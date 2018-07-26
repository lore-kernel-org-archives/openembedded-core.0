Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DBFA678C31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 17:01:43 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w6QH1gjg023473
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 26 Jul 2018 18:01:43 +0100
Message-ID: <0a90dfe4b92bee074090c8f90e1ffe881a0aea6b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Thu, 26 Jul 2018 18:01:42 +0100
In-Reply-To: <4bdbc774f6b6fe04fc4301980729c890a0502c8d.camel@linuxfoundation.org>
References: <1531151586-30557-1-git-send-email-bruce.ashfield@windriver.com>
	<8e3f9ec13333061ecb0125e153df668abe8da1b9.camel@linuxfoundation.org>
	<1cc72609-d849-f8a3-6524-1f7d9ad214c3@windriver.com>
	<4bdbc774f6b6fe04fc4301980729c890a0502c8d.camel@linuxfoundation.org>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] kernel-devsrc: restructure for out of tree (and on target) module builds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jul 2018 17:01:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-07-26 at 15:17 +0100, richard.purdie@linuxfoundation.org
wrote:
> On Thu, 2018-07-26 at 10:04 -0400, Bruce Ashfield wrote:
> > On 2018-07-10 6:21 AM, Richard Purdie wrote:
> > > and also a failure in one of the multilib builds, probably from
> > > different dependencies pulled in by kernel-devsrc:
> > > 
> > > https://autobuilder.yocto.io/builders/nightly-multilib/builds/113
> > > 9/
> > > steps/BuildImages_4/logs/stdio
> > > 
> > > Error: Transaction check error:
> > >    file /usr/bin/libtool from install of libtool-2.4.6-r0.0.i586
> > > conflicts with file from package lib64-libtool-2.4.6-r0.0.x86_64
> > >    file /usr/bin/libtoolize from install of libtool-2.4.6-
> > > r0.0.i586 
> > > conflicts with file from package lib64-libtool-2.4.6-r0.0.x86_64
> > > 
> > 
> > And that leaves this error.
> > 
> > I've not been able to reproduce it, and I've been looking at the
> > elfutils RDEPENDS that is part of kernel devsrc, since that is what
> > pulls in libtool as a DEPENDS.
> > 
> > I'm not seeing any difference in the way that it is pulled in,
> > versus
> > the other uses.
> > 
> > In particular, perf also has elfutils as a REDEPENDS, but yet it
> > builds
> > in the same configuration. Can you spot the difference in how it is
> > used ?
> > 
> > elfutils is potentially required at tools build time, hence why it
> > is
> > a RDEPENDS in devsrc, but a DEPENDS in the main linux-yocto
> > recipes.
> > If there's another way to express this, let me know and I can
> > switch
> > to that.
> > 
> > And finally, I did build the old reproducing configuration for
> > multlib that you mentioned before .. can you point me at this
> > config,
> > so I can try again ?
> 
> This is a timely reminder that I've been meaning to look at this. I
> think the config is:
> t
> MACHINE=qemux86
> require conf/multilib.conf 
> MULTILIBS = "multilib:lib64" 
> DEFAULTTUNE_virtclass-multilib-lib64 = "x86-64" 
> 
> then bitbake lib64-core-image-sato-sdk
> 
> which seems like an odd mix of 64bit with a 32 bit kernel but is
> nonetheless what it appears to be building. I suspect it will fail
> the same way with the x86-64 machine too though.
> 
> I have a build running now to check if I can replicate and perhaps
> dig into it further.

I've confirmed the above does reproduce the failure. The logs are also
helpful and show that whilst it mostly installs lib64-* packages, it
also installs a handful of "normal" ones.

What appears to happen is it installs kernel-devsrc, which depends on
elfutils. Since its a "devel" image, it installs the corresponding -dev
packages, which means elfutils-dev. elfutils-dev rrecommends libtool-
dev.

Since there are other lib64-* packages, one is bound to have a -dev
package which installs lib64-libtool-dev.

libtool-dev depends on libtool, lib64-libtool-dev on lib64-libtool.

Then we discover you can't install libtool and lib64-libtool onto the
system at the same time as they're not compatible with each other,
hence the error message.

I tried a quick hack to the elfutils recipe:

package_depchains_append () {
    rreclist = bb.utils.explode_dep_versions2(d.getVar('RRECOMMENDS_elfutils-dev') or "")
    if "libtool-dev" in rreclist:
        del rreclist["libtool-dev"]
    d.setVar('RRECOMMENDS_elfutils-dev', bb.utils.join_deps(rreclist, commasep=False))
}

which is pretty evil but proves this is the only issue we have to solve
since with the hack, the build completes.

So I'm not sure how to fix it but at least we can say why it breaks...

Cheers,

Richard





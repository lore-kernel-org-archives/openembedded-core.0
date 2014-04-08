Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 3493865DC4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 21:33:47 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s38LXgNq006919; Tue, 8 Apr 2014 22:33:43 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bhE-HF4GQT5P; Tue,  8 Apr 2014 22:33:42 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s38LXbDt006910
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 8 Apr 2014 22:33:39 +0100
Message-ID: <1396992811.24597.116.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Slater, Joseph" <joe.slater@windriver.com>
Date: Tue, 08 Apr 2014 22:33:31 +0100
In-Reply-To: <007BD92917A2324FA403BCF9A464CF8455D2735A@ALA-MBA.corp.ad.wrs.com>
References: <007BD92917A2324FA403BCF9A464CF8455D24E2D@ALA-MBA.corp.ad.wrs.com>
	<1396976257.24597.109.camel@ted>
	<007BD92917A2324FA403BCF9A464CF8455D2735A@ALA-MBA.corp.ad.wrs.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: libxslt populate_sysroot dependencies
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
X-List-Received-Date: Tue, 08 Apr 2014 21:33:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-04-08 at 21:21 +0000, Slater, Joseph wrote:
> 
> > -----Original Message-----
> > From: Richard Purdie [mailto:richard.purdie@linuxfoundation.org]
> > Sent: Tuesday, April 08, 2014 9:58 AM
> > To: Slater, Joseph
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] libxslt populate_sysroot dependencies
> > 
> > On Mon, 2014-04-07 at 23:25 +0000, Slater, Joseph wrote:
> > > I have attached a patch that makes sure libxml2-native is available
> > > when both it and libxslt-native
> > > are taken from sstate.
> > >
> > > The patch parallels one from a few weeks ago for pixbufcache, but the
> > > underlying problem might
> > > have been fixed since then.  I looked for likely commits, and didn't
> > > see anything, so this patch might still be needed.
> > 
> > This is an shlibs depends, right? sstate should handle those correctly.
> > If not, I'd like to see logs from a build where this doesn't happen on
> > master please?
> 
> The bitbake I was using is a bit out of date, so I cloned a poky repo today
> and did several builds of vala-native pulling libxml2-native and libxslt-native
> from sstate.
> 
> I've attached the logs (truncated and annotated).  I think out_of_order.log shows that libxslt-native is
> put in sysroot before libraries from libxml2 that it needs.
> 
> The in_order.log shows what happens after applying the populate sysroot [depends] patch.
> 
> I've attached the patch, too.

Thanks, I think I've been staring at too many builds for too long and
have too many things cross threaded so I may have things confused,
however I'm going to have a go at explaining this.

The setscene dependencies typically work backwards. The system does this
deliberately since in general if you can install say bash
do_package_write_ipk, we can skip the toolchain and other tools since we
have the ipk we want. "bitbake <someimage> -c rootfs" is a good example
of that in action, the -c build default tends to be a bit greedy.

The only time this reversal would cause a problem is for native/cross
binaries *if* we execute them at setscene time. I know of two problem
cases:

a) gdk-pixbuf does this to create a correct index file within the 
   sysroot.
b) the adduser parts are used to setup user accounts before sstate 
   packages are extracted.

Those two cases have explicit setscene dependencies for those reasons. I
am not aware of xlstproc being run at setscene time by anything so it
doesn't need these dependencies.

Ok you say, what if it extracts libxslt-native but then fails to extract
libxml2-native?

Well, when the main build happens, nothing with a dependency on
libxsltproc will run until libxml2-native has been built.

So, your logs actually show what I would expect to happen, the question
is what behaviour do you see which isn't correct?

Cheers,

Richard






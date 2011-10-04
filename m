Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RBDQ4-00084x-SV for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 00:25:01 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p94MPntG025975; Tue, 4 Oct 2011 23:25:49 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GThDr4w7FOCD; Tue,  4 Oct 2011 23:25:48 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p94MPjx6025971
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Tue, 4 Oct 2011 23:25:47 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 04 Oct 2011 23:19:15 +0100
In-Reply-To: <CAEsOVNcBdVBxef9OkOjwXP++XYieXOJnQSC95j5iDFkJX2g=Pg@mail.gmail.com>
References: <1317660469.13337.16.camel@phil-desktop>
	<CAEsOVNcZbs3TBQiBYnpzk4UgbfSwFYNHfkChhjN3FOcjnp4qUw@mail.gmail.com>
	<4E8A2828.7090202@intel.com>
	<CAEsOVNekGoGvTPOJKj1a+FDrYT-mWvF-T5AdcjQMEP6diDZhQQ@mail.gmail.com>
	<CAEsOVNcBdVBxef9OkOjwXP++XYieXOJnQSC95j5iDFkJX2g=Pg@mail.gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317766764.14671.123.camel@ted>
Mime-Version: 1.0
Subject: Re: sstate_clean() overzealous?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Oct 2011 22:25:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-10-03 at 22:08 +0000, McClintock Matthew-B29882 wrote:
> On Mon, Oct 3, 2011 at 4:29 PM, Matthew McClintock <msm@freescale.com> wrote:
> > On Mon, Oct 3, 2011 at 4:24 PM, Saul Wold <saul.wold@intel.com> wrote:
> >> I am not sure that's correct, since we use sstate with the Autobuilder and
> >> it's shared across different hosts building different MACHINEs, we don't see
> >> the -natives getting build, do you have any examples?
> >
> > I'm building with targets that are not upstream, so I can't comment on
> > the upstream variant. There are different TUNES though. I'm actually
> > currently in the process of looking at why sstate-cache is not being
> > reused.
> >
> > Can you point at the autobuilder stuff? Is it going from
> > fsl-mpc8315e-rdb to and x86_64 target? Or between two x86_64 targets?
> 
> For example autoconf-native:
> 
> $ bitbake-diffsigs
> ../sstate-cache/sstate-autoconf-native-x86_64-linux-2.68-r2-x86_64-2-*siginfo
> [mattsm@right build_p5020ds_release (master *$)]$ bitbake-diffsigs
> ../sstate-cache/sstate-autoconf-native-x86_64-linux-2.68-r2-x86_64-2-*siginfo
> [snip]
> basehash changed from bab02dfa833aca4810b0fae8c4ab48f9 to
> e156f3fb86236bfc0262e6287bd73784
> List of dependencies for variable baselib changed from
> set(['BASELIB']) to set(['DEFAULTTUNE'])
> Dependency on variable BASELIB was added
> Dependency on Variable DEFAULTTUNE was removed
> Variable baselib value changed from ${BASELIB} to
> ${@d.getVar('BASE_LIB_tune-' + (d.getVar('DEFAULTTUNE', True) or
> 'INVALID'), True) or 'lib'}
> Hash for dependent task
> virtual:native:/local/home/mattsm/git/poky/meta/recipes-devtools/autoconf/autoconf_2.68.bb.do_install
> changed from e74616029727b6e61b00273425128f1d to
> 478e7900a2310f2669708e6909883865
> 
> Back tracking this appears to be a multilib issue since I have that
> enabled on one of the -native packages:
> 
> ../meta/conf/bitbake.conf:baselib = "${BASELIB}"
> ../meta/conf/multilib.conf:baselib = "${@d.getVar('BASE_LIB_tune-' +
> (d.getVar('DEFAULTTUNE', True) or 'INVALID'), True) or 'lib'}"
> 

This is bad and shouldn't be happening, particularly for the native
packages. I did accidentally commit part of a work in progress in this
commit:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=ea0b7440ec5a8663b66f56a19f0b38e803b523d3

I didn't revert it since I thought it was a good idea and fixed some
problems I was seeing.

I suspect a baselib = "lib" in native.bbclass might be a good idea
too...

Cheers,

Richard




Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TC9CN-0004ut-G4 for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 15:11:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8DCwd6a030720;
	Thu, 13 Sep 2012 13:58:39 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29786-10; Thu, 13 Sep 2012 13:58:34 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8DCwTgk030714
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 13 Sep 2012 13:58:30 +0100
Message-ID: <1347541111.11710.97.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 13 Sep 2012 13:58:31 +0100
In-Reply-To: <20120913121431.GB11252@jama.jama.net>
References: <20120911130155.GC14077@jama.jama.net>
	<1347460383.11710.34.camel@ted> <20120913062017.GA11252@jama.jama.net>
	<1347532926.11710.66.camel@ted> <20120913121431.GB11252@jama.jama.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: qemuarm: should it really have TUNE_ARCH armv5te?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Sep 2012 13:11:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-09-13 at 14:14 +0200, Martin Jansa wrote:
> On Thu, Sep 13, 2012 at 11:42:06AM +0100, Richard Purdie wrote:
> > On Thu, 2012-09-13 at 08:20 +0200, Martin Jansa wrote:
> > > On Wed, Sep 12, 2012 at 03:33:03PM +0100, Richard Purdie wrote:
> > > > On Tue, 2012-09-11 at 15:01 +0200, Martin Jansa wrote:
> > > > > Hi,
> > > > > 
> > > > > when building spitz and qemuarm (both produces packages in armv5te feed)
> > > > > resulting packages are tuned with -mtune=xscale (when built for spitz) 
> > > > > or -mtune=arm926ej-s (when built for qemuarm).
> > > > > 
> > > > > From
> > > > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=1916#c5
> > > > > Firstly, if you go changing the tune parameters in a given machine,
> > > > > you are expected to use a different PACKAGE_ARCH. If you do that, you
> > > > > will get a different package feed for the different binaries,
> > > > > different WORKDIR and so on. This was always the way the package
> > > > > architectures was intended to work and nothing has changed there. Yes,
> > > > > you as the user changing various variables can create inconsistent
> > > > > package feeds. There are 101 ways you can do that, the simple answer
> > > > > is just don't. We're therefore unlikely to add MACHINE to DEPLOY_DIR
> > > > > or remove PACKAGE_ARCH, please just use it as its intended.
> > > > > 
> > > > > Does qemuarm use oe-core as it's intended?
> > > > > 
> > > > > Shouldn't spitz produce something like armv5te-xscale and qemuarm armv5te-arm926ejs?
> > > > > It would cause all recipes to build again (cannot share armv5te feed anymore),
> > > > > but at least it would build it and user will really get it on target, right now
> > > > > opkg upgrade can download some packages with xscale some with arm926ej-s.
> > > > > 
> > > > > $ ~/bitbake/bin/bitbake-diffsigs
> > > > >   stamps.1347348910/spitz/armv5te-oe-linux-gnueabi/linux-libc-headers-3.4.3-r0.do_configure.sigdata.04b364a15889fcff7502614f1c116abc
> > > > >   stamps.1347348910/qemuarm/armv5te-oe-linux-gnueabi/linux-libc-headers-3.4.3-r0.do_configure.sigdata.656f0583be969b427f040f2e143bcb14
> > > > >   basehash changed from 7fe9c0a3455dac20ba6a90ed337b097e to d8dd2ff8613d0aafe60bef1a1e9469a1
> > > > >   Variable TUNE_CCARGS value changed from
> > > > >   ${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=armv5${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}", "", d)}
> > > > >   ${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=armv4${ARMPKGSFX_THUMB}", "", d)}
> > > > >   ${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "", d)}
> > > > >   ${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "-mno-thumb-interwork", "-mthumb-interwork", d)}
> > > > >   ${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FEATURES", "callconvention-hard", "-mfloat-abi=hard", "-mfloat-abi=softfp", d), "" ,d)}
> > > > >   ${@bb.utils.contains("TUNE_FEATURES", "xscale", "-mtune=xscale", "", d)}
> > > > >   to
> > > > >   ${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=armv5${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}", "", d)}
> > > > >   ${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=armv4${ARMPKGSFX_THUMB}", "", d)}
> > > > >   ${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "", d)}
> > > > >   ${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "-mno-thumb-interwork", "-mthumb-interwork", d)}
> > > > >   ${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FEATURES", "callconvention-hard", "-mfloat-abi=hard", "-mfloat-abi=softfp", d), "" ,d)}
> > > > >   ${@bb.utils.contains("TUNE_FEATURES", "arm926ejs", "-mtune=arm926ej-s", "", d)}
> > > > > 
> > > > 
> > > > This is a tricky one. As others have mentioned, this is a tune
> > > > parameter, not an arch one and as such the binaries are compatible with
> > > > each other although they potentially are compiled differently with
> > > > different optimisations.
> > > > 
> > > > As such, mixing the feeds is permitted and will not cause any real world
> > > > usage problem. As you point out, sstate is much more sensitive to this
> > > > kind of change and is correctly deciding the output is different though.
> > > > 
> > > > I think my preferred approach would be to have the tune files do
> > > > something like:
> > > > 
> > > > -mtune=${ARMV5TEDEFAULTTUNE}
> > > > 
> > > > and then the user can set ARMV5DEFAULTTUNE to whatever the believe is a
> > > > appropriate. This would result in the package feed at least having a
> > > > consistent state of one tune and sstate would be happy. It then becomes
> > > > a distro policy decision which is what it should be. ARMV5TEDEFAULTTUNE
> > > > would default to the current values meaning the distro would then just
> > > > do:
> > > > 
> > > > ARMV5TEDEFAULTTUNE_poky = "xscale"
> > > >
> > > > and hence make their decision. Of course the distro could also decide to
> > > > split the package architectures up which is equally fine.
> > > > 
> > > > Does something like that sound like it would work?
> > > 
> > > My solution seems to be a bit more flexible then this.
> > 
> > Which cases does it enable which the above doesn't?
> 
> To have separate binary feeds for some packages while keeping most of
> other packages in armv5te feed without any -mtune or with some
> ARMV5TEDEFAULTTUNE.

Firstly, lets clearly define what the problems are. We want to have some
packages with the existing tune in separate feeds and have other
packages sharing (or have no) mtune values?

The reason I say that is that initially this looked like a problem with
sstate and the specific mtune values which is a relatively generic and
widespread issue. The problem described above is implementation of what
is very specific distro policy. I want to be clear about which
problem(s) we're solving as that is leading to confusion discussing it.

If the problem(s) we're solving are the distro feed one rather than
sstate, the problem is more specific the distro policy and I'd expect
the distro itself to be handling this and not the core.

> But -mtune=${ARMV5TEDEFAULTTUNE} in tune-arm926ejs.inc with 
> xscale value set through ARMV5TEDEFAULTTUNE_disto doesn't look very
> intuitive.

I'm not saying that it is. What I'm saying is that it puts the pain in
the place of the person trying to do the deep configuration and isn't
the first thing a new user hits and struggles with. 

We can add variables for *everything*. That doesn't mean that we should
and this is one case that I think the proposal complicates something
that is already too complicated, badly (under) documented and being
misused (see the number of patches I've seen recently abusing
DEFAULTTUNE).

At least if the tune files and system was well documented I might feel
better about things but right now it isn't.

> And how many .*DEFAUTTUNE variables distro should set?

As soon as you enter the world of recipe specific tunings, I suspect a
number of variables are going to need to get set.

Cheers,

Richard




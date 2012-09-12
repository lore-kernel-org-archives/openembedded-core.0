Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TBoCG-0007eY-Qn for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 16:45:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8CEXAmA020466;
	Wed, 12 Sep 2012 15:33:10 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19954-08; Wed, 12 Sep 2012 15:33:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8CEX1qN020460
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 12 Sep 2012 15:33:02 +0100
Message-ID: <1347460383.11710.34.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 12 Sep 2012 15:33:03 +0100
In-Reply-To: <20120911130155.GC14077@jama.jama.net>
References: <20120911130155.GC14077@jama.jama.net>
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
X-List-Received-Date: Wed, 12 Sep 2012 14:45:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-09-11 at 15:01 +0200, Martin Jansa wrote:
> Hi,
> 
> when building spitz and qemuarm (both produces packages in armv5te feed)
> resulting packages are tuned with -mtune=xscale (when built for spitz) 
> or -mtune=arm926ej-s (when built for qemuarm).
> 
> From
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=1916#c5
> Firstly, if you go changing the tune parameters in a given machine,
> you are expected to use a different PACKAGE_ARCH. If you do that, you
> will get a different package feed for the different binaries,
> different WORKDIR and so on. This was always the way the package
> architectures was intended to work and nothing has changed there. Yes,
> you as the user changing various variables can create inconsistent
> package feeds. There are 101 ways you can do that, the simple answer
> is just don't. We're therefore unlikely to add MACHINE to DEPLOY_DIR
> or remove PACKAGE_ARCH, please just use it as its intended.
> 
> Does qemuarm use oe-core as it's intended?
> 
> Shouldn't spitz produce something like armv5te-xscale and qemuarm armv5te-arm926ejs?
> It would cause all recipes to build again (cannot share armv5te feed anymore),
> but at least it would build it and user will really get it on target, right now
> opkg upgrade can download some packages with xscale some with arm926ej-s.
> 
> $ ~/bitbake/bin/bitbake-diffsigs
>   stamps.1347348910/spitz/armv5te-oe-linux-gnueabi/linux-libc-headers-3.4.3-r0.do_configure.sigdata.04b364a15889fcff7502614f1c116abc
>   stamps.1347348910/qemuarm/armv5te-oe-linux-gnueabi/linux-libc-headers-3.4.3-r0.do_configure.sigdata.656f0583be969b427f040f2e143bcb14
>   basehash changed from 7fe9c0a3455dac20ba6a90ed337b097e to d8dd2ff8613d0aafe60bef1a1e9469a1
>   Variable TUNE_CCARGS value changed from
>   ${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=armv5${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}", "", d)}
>   ${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=armv4${ARMPKGSFX_THUMB}", "", d)}
>   ${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "", d)}
>   ${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "-mno-thumb-interwork", "-mthumb-interwork", d)}
>   ${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FEATURES", "callconvention-hard", "-mfloat-abi=hard", "-mfloat-abi=softfp", d), "" ,d)}
>   ${@bb.utils.contains("TUNE_FEATURES", "xscale", "-mtune=xscale", "", d)}
>   to
>   ${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=armv5${ARMPKGSFX_THUMB}${ARMPKGSFX_DSP}", "", d)}
>   ${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=armv4${ARMPKGSFX_THUMB}", "", d)}
>   ${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", "", d)}
>   ${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "-mno-thumb-interwork", "-mthumb-interwork", d)}
>   ${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FEATURES", "callconvention-hard", "-mfloat-abi=hard", "-mfloat-abi=softfp", d), "" ,d)}
>   ${@bb.utils.contains("TUNE_FEATURES", "arm926ejs", "-mtune=arm926ej-s", "", d)}
> 

This is a tricky one. As others have mentioned, this is a tune
parameter, not an arch one and as such the binaries are compatible with
each other although they potentially are compiled differently with
different optimisations.

As such, mixing the feeds is permitted and will not cause any real world
usage problem. As you point out, sstate is much more sensitive to this
kind of change and is correctly deciding the output is different though.

I think my preferred approach would be to have the tune files do
something like:

-mtune=${ARMV5TEDEFAULTTUNE}

and then the user can set ARMV5DEFAULTTUNE to whatever the believe is a
appropriate. This would result in the package feed at least having a
consistent state of one tune and sstate would be happy. It then becomes
a distro policy decision which is what it should be. ARMV5TEDEFAULTTUNE
would default to the current values meaning the distro would then just
do:

ARMV5TEDEFAULTTUNE_poky = "xscale"

and hence make their decision. Of course the distro could also decide to
split the package architectures up which is equally fine.

Does something like that sound like it would work?

Cheers,

Richard





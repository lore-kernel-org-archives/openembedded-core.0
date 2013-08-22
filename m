Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B31F761EE1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 09:07:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Aug 2013 02:07:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,932,1367996400"; d="scan'208";a="366700188"
Received: from timevans-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.122.241])
	by orsmga001.jf.intel.com with ESMTP; 22 Aug 2013 02:07:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 10:07:37 +0100
Message-ID: <6560539.TdGG90GaLI@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <cover.1377150822.git.sgw@linux.intel.com>
References: <cover.1377150822.git.sgw@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [CONSOLIDATED PULL 00/62] Python3, Packge Exlude and more (Initial ACK Please)!
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
X-List-Received-Date: Thu, 22 Aug 2013 09:07:54 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 21 August 2013 22:58:55 Saul Wold wrote:
> Paul, Ross:
> 
> Please review this set.
> 
> It has a number of large changes that I want more EYES on!
> 
> Particularly, the python3 patch set, which I may remove before
> this is final due to the world build issue.
> 
> There is also a few patches on poky from Beth and myself which
> need a look at and ACK
> The following changes since commit d98f08a7ad95d0b17846276b028a6614f16b6846:
> 
>   genext2fs: fix memory corruption on powerpc (2013-08-20 07:11:44 -0700)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib sgw/stage
>  
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/
> stage
> 
> Cristian Iorga (4):
>   packagegroup-self-hosted: pcmanfm integration
>   builder: register directories with pcmanfm
>   build-appliance-image: changing the icon theme to sato
>   default-providers: Set the preferred provider for bluez

I thought we were going to fix the libasound-module-bluez multiple provider 
issue by renaming the package?

> Jonathan Liu (3):
>   xf86-video-intel: remove duplicate xf86driproto from DEPENDS
>   xf86-video-vesa: remove duplicate xf86driproto from DEPENDS
>   mesa: enable additional drivers for gallium-llvm x86/x86-64
> 
> Kai Kang (3):
>   bc: fix segmentation fault
>   libx11: upgrade to 1.6.1
>   libx11-diet: upgrade to 1.6.1

"Deleted keysymdef_include patch" - why? Presumably because it was merged 
upstream, but that needs to be stated.

> Khem Raj (27):
>   generate-manifest-3.3.py: Add script to generate python 3.3 manifests
>   python-3.3-manifest: Add python3 manifest file
>   python3native.bbclass: Add python3 abstraction class
>   package_rpm.bbclass:Make the regexp less greedy
>   classes/distutils: Introduce PYTHON_PN
>   classes: Add distutils for python3

I hadn't noticed earlier, but this set of changes introduces a shedload more 
bbclasses. Are these really all necessary?

>   setuptools.bbclass: Use python-distribute instead of python-setuptools
>   distutils3.bbclass: Port the distutils class fix to handle filenames
>     with spaces
>   setuptools3.bbclass: Remove useless multiline comment

These incremental changes to files added in earlier commits need to be squashed 
into those commits.

>   distutils: Introduce PYTHON_ABI variable
>   distutils3: Do build_ext as separate step during compile
>   python3: Add recipes
>   python3: Add native recipe
>   python_2.7.3.bb: Inherit python-dir
>   python3-nose: Testing tools for python
>   zeromq: Add recipe
>   pyzmq: Add recipes using python3

There's inadequate justification given in the commit messages for why these 
last two need to be added; I already mentioned this in earlier feedback on 
these changes. What's more, the second commit makes a tweak to the commit 
before which should be squashed into there instead.

>   ipython: Add recipes for ipython2 and ipython3

Again, the commit message needs to mention why we need these.

>   python-distribute: Add recipes for python2 and python3
>   python3: Upgrade to 3.3.2
>   distutils3.bbclass: Fix typo and use proper values for target sysroot
>   python3, python3-native: Consider OE staging installation
>   python3: Fix host include contamination issue
>   distutils3.bbclass: Use MACHINE for sysroot when not building for
>     build host
>   python3: Fix the compiler invocation and linker flags when cross
>     compiling
>   python: Add Patch description and status information
>   eglibc: Update SRC_URI and fix unpackaged empty dir

I appreciate the work and testing that has gone into this set of changes but 
it still needs further cleaning up as discussed above IMO.
 
> Lauren Post (2):
>   directfb: Upgrade to 1.6.3
>   directfb: add fusion patch for hangs on exit with

The commit messages seem a little bit malformed on these two.

> Mark Hatle (11):
>   image.bbclass: Add basic support for PACKAGE_EXCLUDE
>   python-smartpm: Add support for excluding package from the install
>   package_rpm.bbclass:  Add support for PACKAGE_EXCLUDE to RPM installs
>   python-smartpm: Add support to disable installing recommends
>   package_rpm.bbclass: NO_RECOMMENDATIONS support
>   package_deb.bbclass: Use the WORKDIR not SYSROOT for temp files
>   package_deb: Add support for NO_RECOMMENDATIONS and PACKAGE_EXCLUDE
>   opkg: Add --no-install-recommends option.
>   package_ipk: Add support for NO_RECOMMENDATIONS
>   opkg: Add support for excluding packages from the install
>   package_ipk: Add support for PACKAGE_EXCLUDE

As mentioned earlier I'm still unhappy with not persisting these into the 
rootfs if package-management is enabled, but I'll try to address that myself 
in a follow-up.

> Marko Lindqvist (3):
>   texinfo: correct dont-depend-on-help2man.patch
>   SDL2: add recipe
>   boost: fix build when PARALLEL_MAKE is not set
> 
> Otavio Salvador (1):
>   distro_features_check.bbclass: Allow checking of required/conflicting
>     features

I should have asked this earlier - why does this need to be a separate 
bbclass? The code doesn't do anything if the variables aren't set, so it can't 
be because it could have an impact on existing setups that don't set them.

> Paul Eggleton (1):
>   gst-plugins-good: fix orc enabling via PACKAGECONFIG
> 
> Roy.Li (1):
>   shadow: backport a patch to make newgrp work

The commit message should really have some detail in it for a change like 
this.

> Saul Wold (4):
>   Add Upstream-Status tags to patches
>   libsdl: Backport xData32 patch for x11 update
>   valgrind: Backport patch for eglibc 2.18
>   gnupg: Update to 2.0.21
> 
> Tyler Hall (1):
>   cpan-base: Don't use immediate expansion

I assume there's no appreciable impact on build performance with this change?

> Yevhen Kyriukha (1):
>   connman: fix systemd support for connman-* packages.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


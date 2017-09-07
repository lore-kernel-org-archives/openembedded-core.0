Return-Path: <mac@mcrowe.com>
X-Greylist: delayed 460 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 07 Sep 2017 11:21:28 UTC
Received: from avasout05.plus.net (avasout05.plus.net [84.93.230.250])
	by mail.openembedded.org (Postfix) with ESMTP id 1FD3C71A32
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Sep 2017 11:21:28 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout05 with smtp
	id 6bDn1w0030BmcFC01bDoWk; Thu, 07 Sep 2017 12:13:48 +0100
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.2 cv=Iav3YSia c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=2JCJgTwv5E4A:10 a=eOwo1LqHI9O2leiWysAA:9
	a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>) id 1dpukl-0000SH-BB
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Sep 2017 12:13:47 +0100
Date: Thu, 7 Sep 2017 12:13:47 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170907111347.u4bixwf2q7mabuy3@mcrowe.com>
MIME-Version: 1.0
User-Agent: NeoMutt/20170113 (1.7.2)
Subject: Building and using a second toolchain
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
X-List-Received-Date: Thu, 07 Sep 2017 11:21:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I'm trying to compile a vendor bootloader for an AArch64-based chip. This
bootloader requires both a 32-bit "arm" compiler and a 64-bit "aarch64"
compiler to build. The rest of the system only requires the aarch64
compiler, so I'm using arch-armv8.inc in my machine configuration.

Since this is for a bootloader, the 32-bit compiler can probably be the
equivalent of gcc-cross-initial, and of course I need binutils-cross too.

Inspired by native.bbclass, I produced binutils-cross-arm and
gcc-cross-initial-arm recipes that rewrite lots of TARGET_ variables and
then copied the handful of require lines from the standard binutils-cross
and gcc-cross-initial recipes. This seems to work well - the binaries end
up in sysroots-components as would be expected.

I then added gcc-cross-initial-arm to DEPENDS for the bootloader recipe.
Unfortunately, things seem to go wrong when populating the recipe-specific
sysroot as the secondary toolchain is not present. I get messages like:

 WARNING: bootloader-7 do_prepare_recipe_sysroot: Manifest .../tmp-glibc/sstate-control/manifest-x86_64_aarch64-gcc-cross-initial-arm.populate_sysroot not found?
 WARNING: bootloader-7 do_prepare_recipe_sysroot: Manifest .../tmp-glibc/sstate-control/manifest-x86_64_aarch64-binutils-cross-arm.populate_sysroot not found?

These manifest files do exist though:

 tmp-glibc/sstate-control/manifest-x86_64_arm-gcc-cross-initial-arm.populate_sysroot
 tmp-glibc/sstate-control/manifest-x86_64_arm-binutils-cross-arm.populate_sysroot

These filenames appear to come from staging.bbclass and are generated from:

 manifest-${BUILD_ARCH}_${TARGET_ARCH}-%s.populate_sysroot

It thought that the simplest path to making this work would be to ensure
that the manifest files generated during the build have the names that all
other recipes will expect, but this means using the wrong TARGET_ARCH in my
binutils-cross-arm and gcc-cross-initial-arm recipes which I can't do
without also overriding TARGET_SYS and PN at least which definitely isn't
pretty.

I remember reading posts about doing this on the list in the past, but my
search engine skills aren't up to the job of finding anything. Am I missing
an easier way to make this work?

Thanks.

Mike.


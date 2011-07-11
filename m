Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QgJiD-0004ln-Ir for openembedded-core@lists.openembedded.org;
	Mon, 11 Jul 2011 18:52:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6BGm5k5013056
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2011 17:48:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12380-07 for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2011 17:48:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6BGlxhG013050
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2011 17:47:59 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <164DA52B-98AF-47AA-A42D-1DE7FA9A1200@dominion.thruhere.net>
References: <1310399860.20015.980.camel@rex>
	<164DA52B-98AF-47AA-A42D-1DE7FA9A1200@dominion.thruhere.net>
Date: Mon, 11 Jul 2011 17:47:12 +0100
Message-ID: <1310402833.20015.986.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC PATCH 2/3] conf/machine: Overhaul tune include files
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
X-List-Received-Date: Mon, 11 Jul 2011 16:52:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-11 at 18:34 +0200, Koen Kooi wrote:
> Op 11 jul 2011, om 17:57 heeft Richard Purdie het volgende geschreven:
> 
> > There is currently considerable confusion over how the tune files
> > operate and hwo these interact with the rest of the build system.
> > 
> > This update/overhaul changes things so the tune files are primarily
> > responsible for setting:
> > 
> > TUNE_ARCH - What was formerly set as TARGET_ARCH and is the value
> > that represents the architecture we're targetting.
> > 
> > TUNE_PKGARCH - The value that represents the tune configuration that
> > this set of tune parameters results in.
> > 
> > The tune files continue to be responsible for setting the compiler
> > flags as previously.
> > 
> > To determine the values for these fields, the tune code looks at
> > the values set in TUNE_FEATURES. Possible values that can be included
> > in this variable for a given tune file are shown in the TUNEVALID
> > variable.
> > 
> > This code allows several significant improvements:
> > 
> > 1) The core can now always determine the target architecture value,
> > even when TARGET_ARCH needs to be reset to something different.
> > 
> > 2) The tune code can allow for the definition of multilib configurations
> > which can be enabled in the TUNE_FEATURES variable by the multilib class.
> > 
> > 3) Distros can easily configure/override specific tunable values
> > that they're specifically interested in.
> > 
> > 4) Several versions of partial and buggy architecture support can be
> > rolled into one good implementation (e.g. the arm endianness support).
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > meta-yocto/conf/machine/beagleboard.conf         |    1 -
> > meta/conf/bitbake.conf                           |   11 +++++++----
> > meta/conf/machine/include/tune-arm1136jf-s.inc   |    2 ++
> > meta/conf/machine/include/tune-arm920t.inc       |    2 ++
> > meta/conf/machine/include/tune-arm926ejs.inc     |    2 ++
> > meta/conf/machine/include/tune-arm9tdmi.inc      |    2 ++
> > meta/conf/machine/include/tune-armv7.inc         |   16 ++++++++++++----
> > meta/conf/machine/include/tune-atom.inc          |    8 ++++++--
> > meta/conf/machine/include/tune-cortexa8.inc      |   10 +++++++---
> > meta/conf/machine/include/tune-strongarm1100.inc |    2 ++
> > meta/conf/machine/include/tune-thumb.inc         |   22 ++++------------------
> > meta/conf/machine/qemux86.conf                   |    3 ++-
> > 12 files changed, 48 insertions(+), 33 deletions(-)
> 
> > diff --git a/meta/conf/machine/include/tune-armv7.inc b/meta/conf/machine/include/tune-armv7.inc
> > index 979d6fe..6f7062f 100644
> > --- a/meta/conf/machine/include/tune-armv7.inc
> > +++ b/meta/conf/machine/include/tune-armv7.inc
> > @@ -1,7 +1,15 @@
> > +require conf/machine/include/arch-arm.inc
> 
> Where does that file live?

Oops, sorry, those dropped out the patchset as I was cleaning it up. I
makes a lot more sense with these. They are:

diff --git a/meta/conf/machine/include/arch-arm.inc b/meta/conf/machine/include/arch-arm.inc
new file mode 100644
index 0000000..bf2df5f
--- a/dev/null
+++ b/meta/conf/machine/include/arch-arm.inc
@@ -0,0 +1,4 @@
+TUNEVALID += "bigendian"
+TUNE_ARCH = "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "armeb", "arm" ,d)}"
+
+ENDSUFX = "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "b", "" ,d)}"
diff --git a/meta/conf/machine/include/arch-ia32.inc b/meta/conf/machine/include/arch-ia32.inc
new file mode 100644
index 0000000..8d3f678
--- a/dev/null
+++ b/meta/conf/machine/include/arch-ia32.inc
@@ -0,0 +1,17 @@
+TUNEVALID += "m64"
+TUNE_ARCH = "${@bb.utils.contains("TUNE_FEATURES", "m64", "x86_64", "i586" ,d)}"
+
+TUNEVALID += "ml-lib32"
+TUNE_ARCH_ml-tune-lib32 = "i586"
+base_libdir_ml-tune-lib32 = "${base_prefix}/lib32"
+libdir_ml-tune-lib32 = "${exec_prefix}/lib32"
+TUNEOVERRIDES += "${@bb.utils.contains("TUNE_FEATURES", "ml-lib32", ":ml-tune-lib32", "", d)}"
+
+TUNEVALID += "ml-lib64"
+TUNE_ARCH_ml-tune-lib64 = "x86_64"
+base_libdir_ml-tune-lib64 = "${base_prefix}/lib64"
+libdir_ml-tune-lib64 = "${exec_prefix}/lib64"
+TUNEOVERRIDES += "${bb.utils.contains("TUNE_FEATURES", "ml-lib64", ":ml-tune-lib64", "", d)}"
+
+OVERRIDES .= "${TUNEOVERRIDES}"
+
--
cgit v0.8.3.3-89-gbf82

> > +TUNE_PKGARCH = "armv7"
> > +TUNE_FEATURES_tune-armv7 ??= "hard-fpu"
> > +
> > # valid options for -march: `armv7', `armv7-a', `armv7-r', `armv7-m'
> > # valid option for -mtune: `cortex-a8', `cortex-r4', `cortex-m3', `cortex-m1'
> > # This will NOT compile programs in 'ARM' mode, which is what you really want
> > -TARGET_CC_ARCH = "-march=armv7 -mfpu=vfp -mfloat-abi=softfp"
> > -FEED_ARCH = "armv7"
> > -PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t armv5te armv6 armv7"
> > -BASE_PACKAGE_ARCH = "armv7"
> > +TARGET_CC_ARCH += "-march=armv7"
> > +TARGET_CC_ARCH += "-mfpu=vfp -mfloat-abi=softfp"
> > +
> > +TARGET_FPU = "${@bb.utils.contains("TUNE_FEATURES", "hard-fpu", "hard", "soft" ,d)}"
> 
> So the above takes care of the softfp calling conventions with hardware support or not, this doesn't take care of the hardfp calling conventions (mfloat-abi=hard)
> 
> > +PACKAGE_EXTRA_ARCHS = "${TUNE_ARCH} armv4${ENDSUFX} armv4t${ENDSUFX} armv5te${ENDSUFX} armv6${ENDSUFX} armv7${ENDSUFX}"
> 
> > diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/tune-cortexa8.inc
> > index a5b982a..74c1e9e 100644
> > --- a/meta/conf/machine/include/tune-cortexa8.inc
> > +++ b/meta/conf/machine/include/tune-cortexa8.inc
> > @@ -1,3 +1,8 @@
> > +require conf/machine/include/arch-arm.inc
> > +
> > +TUNE_PKGARCH = "armv7a"
> > +TUNE_FEATURES_tune-armv7a ??= "hard-fpu"
> > +
> > # Instead of using -mfpu=vfp[2] we can use -mfpu=neon to make use of gcc intrinsics[1] and vectorize loops with -ftree-vectorize[3]
> > # [1] http://gcc.gnu.org/onlinedocs/gcc/ARM-NEON-Intrinsics.html
> > # [2] http://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html 
> > @@ -8,6 +13,5 @@ TARGET_CC_ARCH = "-march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
> 
> And here you set mfpu=neon, while it's optional in both the cortex-a8
> and armv7a standards. It also shows that we're messing with hardware
> option (neon, vfp) and software option (softp) in one line. 

These need splitting off into different options. The info you've added
below gives me a better idea of how to do that.

> > # Other potentially useful options
> > #-ftree-vectorize -ffast-math -fno-omit-frame-pointer
> > 
> > -FEED_ARCH = "armv7a"
> > -BASE_PACKAGE_ARCH = "armv7a"
> > -PACKAGE_EXTRA_ARCHS = "arm armv4 armv4t armv5te armv6 armv7 armv7a"
> > +PACKAGE_EXTRA_ARCHS = "${TUNE_ARCH} armv4${ENDSUFX} armv4t${ENDSUFX} armv5te${ENDSUFX} armv6${ENDSUFX} armv7${ENDSUFX} armv7a${ENDSUFX}"
> 
> Taking armv7a as an example with my angstrom hat on I need the following knobs:
> 
> 1) softp or hardfp calling conventions, resulting in a different package arch (e.g. armv7a vs armv7ahf) (link incompatible)
> 2) neon or not, resulting in a different packagearch (e.g armv7a vs armv7a-vfponly) (link compatible)
> 3) Thumb2 or arm mode, no direct need for different packagearch, they are compatible
> 4) use FPU fw or not (TARGET_PFU) (slightly different from 2.)
> 
> Do you have any examples on how the package arch will look with this patchset?

I added in code to differentiate between big and little endian. We can
add in code to add extra options, e.g. in the tune-armv7 case:


TARGET_CC_ARCH += "${@bb.utils.contains("TUNE_FEATURES", "callconvention-hard", "-mfloat-abi=hardfp", "-mfloat-abi=softfp" ,d)}"

PACKAGE_EXTRA_ARCHS = "${TUNE_ARCH}${SUFX2} armv4${ENDSUFX}${SUFX2} armv4t${ENDSUFX}${SUFX2} armv5te${ENDSUFX}${SUFX2} armv6${ENDSUFX}${SUFX2} armv7${ENDSUFX}${SUFX2}"






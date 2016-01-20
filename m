Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6E6426FFD4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 01:49:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0K1nF0Q015351
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 Jan 2016 17:49:15 -0800 (PST)
Received: from [128.224.162.134] (128.224.162.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 19 Jan 2016 17:49:14 -0800
To: Andre McCurdy <armccurdy@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <1453253641-6309-1-git-send-email-armccurdy@gmail.com>
	<1453253641-6309-3-git-send-email-armccurdy@gmail.com>
From: Rongqing Li <rongqing.li@windriver.com>
Message-ID: <569EE799.7090203@windriver.com>
Date: Wed, 20 Jan 2016 09:49:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1453253641-6309-3-git-send-email-armccurdy@gmail.com>
Subject: Re: [PATCH 2/3] valgrind: re-enable ARM intdiv and vcvt_fixed_float_VFP tests
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
X-List-Received-Date: Wed, 20 Jan 2016 01:49:15 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2016年01月20日 09:34, Andre McCurdy wrote:
> The intdiv test has been fixed upstream and the vcvt_fixed_float_VFP
> test can be fixed with a similar approach, ie ensuring that it is
> always compiled with appropriate -mcpu/-mfpu flags to support the
> instructions being tested.
>
> See similar cases in none/tests/arm/Makefile.am
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>   .../valgrind/remove-arm-variant-specific.patch     | 66 ----------------------
>   ...ppropriate-flags-for-vcvt-fixed-float-VFP.patch | 33 +++++++++++
>   meta/recipes-devtools/valgrind/valgrind_3.11.0.bb  |  2 +-
>   3 files changed, 34 insertions(+), 67 deletions(-)
>   delete mode 100644 meta/recipes-devtools/valgrind/valgrind/remove-arm-variant-specific.patch
>   create mode 100644 meta/recipes-devtools/valgrind/valgrind/use-appropriate-flags-for-vcvt-fixed-float-VFP.patch
>
> diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-arm-variant-specific.patch b/meta/recipes-devtools/valgrind/valgrind/remove-arm-variant-specific.patch
> deleted file mode 100644
> index 2319ab9..0000000
> --- a/meta/recipes-devtools/valgrind/valgrind/remove-arm-variant-specific.patch
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -Remove arm tests that don't compile
> -
> -Upstream-Status: Pending
> -
> -Corrects the original commit for the patch that removed ARM ptest CFLAGS
> -settings. Since the flags could be set by a user, the flags should
> -be kept in place during compilation.  By keeping the original up-stream
> -CFLAGS for the tests, then additional tests successfully compile
> -for all tested ARM tunings.
> -
> -However, there were still two tests listed below that did not compile
> -for any beaglebone tuning that is valid for valgrind. With the updated
> -patch, the set of excluded ARM ptests and their respective build
> -failures are:
> -  intdiv - fails for all beaglebone tunings with 2 errors:
> -  {standard input}:(40 or 41): Error: selected processor does not
> -       support Thumb mode `udiv r3,r9,r10'
> -  {standard input}:(72 or 73): Error: selected processor does not
> -       support Thumb mode `sdiv r3,r9,r10'
> -
> -  vcvt_fixed_float_VFP - fails for all beaglebone tunings in one of
> -  two ways:
> -    with neon tuning (-mfpu=neon) fails with Internal Compiler Error
> -    without neon tuning fails with 3 errors:
> -    {standard input}:33: Error: selected FPU does not support
> -      instruction -- `vcvt.f32.s32 s15,s15,#1'
> -    {standard input}:58: Error: selected FPU does not support
> -      instruction -- `vcvt.f32.s32 s15,s15,#32'
> -    {standard input}:136: Error: selected FPU does not support
> -      instruction -- `vcvt.f32.u32 s15,s15,#1'
> -
> -After applying this commit, the valgrind ARM ptests compile without
> -errors for tunings:
> -  armv7[t][hf][b][-neon] cortexa8[t][hf][-neon]
> -where the tuning [option] was successfully compiled, both with
> -and without the 'option', and in combination with all other options.
> -
> -Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
> -
> -Index: valgrind-3.10.1/none/tests/arm/Makefile.am
> -===================================================================
> ---- valgrind-3.10.1.orig/none/tests/arm/Makefile.am	2015-05-19 15:11:59.224842927 -0500
> -+++ valgrind-3.10.1/none/tests/arm/Makefile.am	2015-05-19 15:14:20.808847028 -0500
> -@@ -17,9 +17,13 @@
> - 	vfp.stdout.exp vfp.stderr.exp vfp.vgtest \
> - 	vfpv4_fma.stdout.exp vfpv4_fma.stderr.exp vfpv4_fma.vgtest
> -
> -+# Remove the following tests which cause compiler errors for all tunings
> -+#  available for beagle bone (see remove-arm-variant-specific.patch):
> -+#	intdiv
> -+#	vcvt_fixed_float_VFP
> -+
> - check_PROGRAMS = \
> - 	allexec \
> --	intdiv \
> - 	ldrt \
> - 	ldrt_arm \
> - 	neon128 \
> -@@ -27,7 +31,6 @@
> - 	v6intARM \
> - 	v6intThumb \
> - 	v6media \
> --	vcvt_fixed_float_VFP \

it failed on my platform again


| arm-wrs-linux-gnueabi-gcc -march=armv7-a -mfloat-abi=softfp  -marm 
-mthumb-interwork 
--sysroot=/work/wr/buildarea/arm/bitbake_build/tmp/sysroots/qemuarma9 
-Winline -Wall -Wshadow -Wno-long-long -g -fno-stack-protector 
-Wno-nonnull   -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o allexec 
allexec-allexec.o
| arm-wrs-linux-gnueabi-gcc -march=armv7-a -mfloat-abi=softfp  -marm 
-mthumb-interwork 
--sysroot=/work/wr/buildarea/arm/bitbake_build/tmp/sysroots/qemuarma9 
-DHAVE_CONFIG_H -I. 
-I/work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a-vfp-wrs-linux-gnueabi/valgrind/3.11.0-r0/valgrind-3.11.0/none/tests/arm 
-I../../.. 
-I/work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a-vfp-wrs-linux-gnueabi/valgrind/3.11.0-r0/valgrind-3.11.0 
-I/work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a-vfp-wrs-linux-gnueabi/valgrind/3.11.0-r0/valgrind-3.11.0/include 
-I/work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a-vfp-wrs-linux-gnueabi/valgrind/3.11.0-r0/valgrind-3.11.0/coregrind 
-I../../../include 
-I/work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a-vfp-wrs-linux-gnueabi/valgrind/3.11.0-r0/valgrind-3.11.0/VEX/pub 
-I../../../VEX/pub -DVGA_arm=1 -DVGO_linux=1 -DVGP_arm_linux=1 
-DVGPV_arm_linux_vanilla=1   -Winline -Wall -Wshadow -Wno-long-long -g 
-fno-stack-protector    -g -mcpu=cortex-a15 -mthumb  -c -o 
intdiv-intdiv.o `test -f 'intdiv.c' || echo 
'/work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a-vfp-wrs-linux-gnueabi/valgrind/3.11.0-r0/valgrind-3.11.0/none/tests/arm/'`intdiv.c
| 
/work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a-vfp-wrs-linux-gnueabi/valgrind/3.11.0-r0/valgrind-3.11.0/none/tests/arm/intdiv.c:1:0: 
warning: switch -mcpu=cortex-a15 conflicts with -march=armv7-a switch
|
|  ^
| /tmp/ccw8BXpd.s: Assembler messages:
| /tmp/ccw8BXpd.s:49: Error: selected processor does not support Thumb 
mode `udiv r3,r9,r10'
| /tmp/ccw8BXpd.s:104: Error: selected processor does not support Thumb 
mode `sdiv r3,r9,r10'
| Makefile:811: recipe for target 'intdiv-intdiv.o' failed
| make[5]: *** [intdiv-intdiv.o] Error 1



-Roy


> - 	vfp \
> - 	vfpv4_fma
> -
> diff --git a/meta/recipes-devtools/valgrind/valgrind/use-appropriate-flags-for-vcvt-fixed-float-VFP.patch b/meta/recipes-devtools/valgrind/valgrind/use-appropriate-flags-for-vcvt-fixed-float-VFP.patch
> new file mode 100644
> index 0000000..b60bbec
> --- /dev/null
> +++ b/meta/recipes-devtools/valgrind/valgrind/use-appropriate-flags-for-vcvt-fixed-float-VFP.patch
> @@ -0,0 +1,33 @@
> +From 3edcad177058150a841a88cf0798fdc0bd0dad43 Mon Sep 17 00:00:00 2001
> +From: Andre McCurdy <armccurdy@gmail.com>
> +Date: Tue, 19 Jan 2016 16:00:00 -0800
> +Subject: [PATCH] use appropriate -mcpu/-mfpu for vcvt_fixed_float_VFP
> +
> +vcvt_fixed_float_VFP.c contains embedded vfpv3 instructions. Ensure
> +that it is always compiled with appropriate -mcpu/-mfpu flags to
> +support the instructions being tested. The aim is to build all tests,
> +even ones which may not run correctly on all target CPUs.
> +
> +See similar cases in none/tests/arm/Makefile.am
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> +---
> + none/tests/arm/Makefile.am | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/none/tests/arm/Makefile.am b/none/tests/arm/Makefile.am
> +index 4507a20..b38a082 100644
> +--- a/none/tests/arm/Makefile.am
> ++++ b/none/tests/arm/Makefile.am
> +@@ -66,4 +66,6 @@ intdiv_CFLAGS	  = $(AM_CFLAGS) -g -mcpu=cortex-a15 -mthumb
> + ldrt_CFLAGS	  = $(AM_CFLAGS) -g -mcpu=cortex-a8 -mthumb
> + ldrt_arm_CFLAGS	  = $(AM_CFLAGS) -g -mcpu=cortex-a8 -marm
> +
> ++vcvt_fixed_float_VFP_CFLAGS = $(AM_CFLAGS) -g -mcpu=cortex-a8 -mfpu=vfpv3
> ++
> + vfpv4_fma_CFLAGS  = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a15 -mfpu=vfpv4 -marm
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
> index 8e9b72c..d2a78c3 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
> @@ -15,13 +15,13 @@ DEPENDS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d
>   SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
>              file://fixed-perl-path.patch \
>              file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch \
> -           file://remove-arm-variant-specific.patch \
>              file://run-ptest \
>              file://11_mips-link-tool.patch \
>              file://0002-remove-rpath.patch \
>              file://0004-Fix-out-of-tree-builds.patch \
>              file://0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch \
>              file://0001-Remove-tests-that-fail-to-build-on-some-PPC32-config.patch \
> +           file://use-appropriate-flags-for-vcvt-fixed-float-VFP.patch \
>              "
>
>   SRC_URI[md5sum] = "4ea62074da73ae82e0162d6550d3f129"
>

-- 
Best Reagrds,
Roy | RongQing Li


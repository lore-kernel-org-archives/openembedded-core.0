Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 96F0865CBB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 01:34:15 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id x140so14988508oif.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 17:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oQPOpluxi3RSY18I5kz/zHu7YIh3zcaHECCHxA7np0A=;
	b=Kh2zyg5JpgzsQ9GVnKYOUDVxM7vllzhLzQP7dZ9xh2fhhLuBrG4VdpSdJFuXyPyhRu
	XQPUrRmWo997u2e5HyNuUZkpl/j86aC3F908lN5PMp3EhRmb8yPSER1brFyAF406TTdp
	bggAzbzpuLYrFTbGedF/HfXYMzyxMYHA2u1YnxIm7mT/xAMQeMpb7OJ3Js8JilQBcpGS
	dsjhTkGPbZSdMY0qc+IRDW/MqalWJjw8RNjIhq2Iqj9p3qOO0nJRGUvteeovWNpPsDjq
	rAcuWYBtjntnvXGnSg4x0m2e+gPkI5OdkE1zup1YfKGooaE7o6dGnGdBQCP1csYsb+Wg
	XPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=oQPOpluxi3RSY18I5kz/zHu7YIh3zcaHECCHxA7np0A=;
	b=Hopcc/XDW46QZ1Yy067KKo7IKj03FdiQNYxa2IosT44B/RI2gL634XjBNK4GRrP88Q
	yscT7dh/IKlzBLemgKFfnRfQpyco6wGnvItj5nuUDOoCX9Sua0F3BNJIEMDxQoVmcyXS
	IzzjgoJfQE9nuS9n59db1I9WbwBmfdWmsYAIxPYsmdlgxwikMaQSL/5b0i/aT3cJCjso
	Zu61qGqoG8d6Skpvxuto+gQkGeNCadzMd63Ndo7gRXaqUQvP/+M/DiNhdgP9ONzXW699
	NVM4ju+QIBAS+qw61q84YSFsVAk8Jxg6dkyKisJKLvCoYGyhKR4d1UW+R1UMh9w9qt+Q
	OH5Q==
X-Gm-Message-State: ALoCoQmHwkz7gQbS3caWBCgU3UGUpDMyit4PbG+MWPx/PSeFGyRTkiED/n6eY9brLdf0ryG+HY9bvKhfeaKI1pb2VfDRfrlB1w==
X-Received: by 10.202.79.137 with SMTP id d131mr25132414oib.37.1453253656288; 
	Tue, 19 Jan 2016 17:34:16 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	j201sm11858118oih.19.2016.01.19.17.34.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Jan 2016 17:34:15 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 17:34:00 -0800
Message-Id: <1453253641-6309-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453253641-6309-1-git-send-email-armccurdy@gmail.com>
References: <1453253641-6309-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/3] valgrind: re-enable ARM intdiv and vcvt_fixed_float_VFP tests
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
X-List-Received-Date: Wed, 20 Jan 2016 01:34:15 -0000

The intdiv test has been fixed upstream and the vcvt_fixed_float_VFP
test can be fixed with a similar approach, ie ensuring that it is
always compiled with appropriate -mcpu/-mfpu flags to support the
instructions being tested.

See similar cases in none/tests/arm/Makefile.am

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../valgrind/remove-arm-variant-specific.patch     | 66 ----------------------
 ...ppropriate-flags-for-vcvt-fixed-float-VFP.patch | 33 +++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.11.0.bb  |  2 +-
 3 files changed, 34 insertions(+), 67 deletions(-)
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/remove-arm-variant-specific.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/use-appropriate-flags-for-vcvt-fixed-float-VFP.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-arm-variant-specific.patch b/meta/recipes-devtools/valgrind/valgrind/remove-arm-variant-specific.patch
deleted file mode 100644
index 2319ab9..0000000
--- a/meta/recipes-devtools/valgrind/valgrind/remove-arm-variant-specific.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-Remove arm tests that don't compile
-
-Upstream-Status: Pending
-
-Corrects the original commit for the patch that removed ARM ptest CFLAGS
-settings. Since the flags could be set by a user, the flags should
-be kept in place during compilation.  By keeping the original up-stream
-CFLAGS for the tests, then additional tests successfully compile
-for all tested ARM tunings.
-
-However, there were still two tests listed below that did not compile
-for any beaglebone tuning that is valid for valgrind. With the updated
-patch, the set of excluded ARM ptests and their respective build
-failures are:
-  intdiv - fails for all beaglebone tunings with 2 errors:
-  {standard input}:(40 or 41): Error: selected processor does not
-       support Thumb mode `udiv r3,r9,r10'
-  {standard input}:(72 or 73): Error: selected processor does not
-       support Thumb mode `sdiv r3,r9,r10'
-
-  vcvt_fixed_float_VFP - fails for all beaglebone tunings in one of
-  two ways:
-    with neon tuning (-mfpu=neon) fails with Internal Compiler Error
-    without neon tuning fails with 3 errors:
-    {standard input}:33: Error: selected FPU does not support
-      instruction -- `vcvt.f32.s32 s15,s15,#1'
-    {standard input}:58: Error: selected FPU does not support
-      instruction -- `vcvt.f32.s32 s15,s15,#32'
-    {standard input}:136: Error: selected FPU does not support
-      instruction -- `vcvt.f32.u32 s15,s15,#1'
-
-After applying this commit, the valgrind ARM ptests compile without
-errors for tunings:
-  armv7[t][hf][b][-neon] cortexa8[t][hf][-neon]
-where the tuning [option] was successfully compiled, both with
-and without the 'option', and in combination with all other options.
-
-Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
-
-Index: valgrind-3.10.1/none/tests/arm/Makefile.am
-===================================================================
---- valgrind-3.10.1.orig/none/tests/arm/Makefile.am	2015-05-19 15:11:59.224842927 -0500
-+++ valgrind-3.10.1/none/tests/arm/Makefile.am	2015-05-19 15:14:20.808847028 -0500
-@@ -17,9 +17,13 @@
- 	vfp.stdout.exp vfp.stderr.exp vfp.vgtest \
- 	vfpv4_fma.stdout.exp vfpv4_fma.stderr.exp vfpv4_fma.vgtest
- 
-+# Remove the following tests which cause compiler errors for all tunings
-+#  available for beagle bone (see remove-arm-variant-specific.patch):
-+#	intdiv
-+#	vcvt_fixed_float_VFP
-+
- check_PROGRAMS = \
- 	allexec \
--	intdiv \
- 	ldrt \
- 	ldrt_arm \
- 	neon128 \
-@@ -27,7 +31,6 @@
- 	v6intARM \
- 	v6intThumb \
- 	v6media \
--	vcvt_fixed_float_VFP \
- 	vfp \
- 	vfpv4_fma
- 
diff --git a/meta/recipes-devtools/valgrind/valgrind/use-appropriate-flags-for-vcvt-fixed-float-VFP.patch b/meta/recipes-devtools/valgrind/valgrind/use-appropriate-flags-for-vcvt-fixed-float-VFP.patch
new file mode 100644
index 0000000..b60bbec
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/use-appropriate-flags-for-vcvt-fixed-float-VFP.patch
@@ -0,0 +1,33 @@
+From 3edcad177058150a841a88cf0798fdc0bd0dad43 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Tue, 19 Jan 2016 16:00:00 -0800
+Subject: [PATCH] use appropriate -mcpu/-mfpu for vcvt_fixed_float_VFP
+
+vcvt_fixed_float_VFP.c contains embedded vfpv3 instructions. Ensure
+that it is always compiled with appropriate -mcpu/-mfpu flags to
+support the instructions being tested. The aim is to build all tests,
+even ones which may not run correctly on all target CPUs.
+
+See similar cases in none/tests/arm/Makefile.am
+
+Upstream-Status: Pending
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ none/tests/arm/Makefile.am | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/none/tests/arm/Makefile.am b/none/tests/arm/Makefile.am
+index 4507a20..b38a082 100644
+--- a/none/tests/arm/Makefile.am
++++ b/none/tests/arm/Makefile.am
+@@ -66,4 +66,6 @@ intdiv_CFLAGS	  = $(AM_CFLAGS) -g -mcpu=cortex-a15 -mthumb
+ ldrt_CFLAGS	  = $(AM_CFLAGS) -g -mcpu=cortex-a8 -mthumb
+ ldrt_arm_CFLAGS	  = $(AM_CFLAGS) -g -mcpu=cortex-a8 -marm
+ 
++vcvt_fixed_float_VFP_CFLAGS = $(AM_CFLAGS) -g -mcpu=cortex-a8 -mfpu=vfpv3
++
+ vfpv4_fma_CFLAGS  = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a15 -mfpu=vfpv4 -marm
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
index 8e9b72c..d2a78c3 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
@@ -15,13 +15,13 @@ DEPENDS = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d
 SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://fixed-perl-path.patch \
            file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch \
-           file://remove-arm-variant-specific.patch \
            file://run-ptest \
            file://11_mips-link-tool.patch \
            file://0002-remove-rpath.patch \
            file://0004-Fix-out-of-tree-builds.patch \
            file://0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch \
            file://0001-Remove-tests-that-fail-to-build-on-some-PPC32-config.patch \
+           file://use-appropriate-flags-for-vcvt-fixed-float-VFP.patch \
            "
 
 SRC_URI[md5sum] = "4ea62074da73ae82e0162d6550d3f129"
-- 
1.9.1



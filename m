Return-Path: <dave.lerner@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 27588742DC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 15:43:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4MFgxXQ024004
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 22 May 2015 08:42:59 -0700 (PDT)
Received: from ord-dlerner-d8.wrs.com (172.25.36.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Fri, 22 May 2015 08:42:59 -0700
From: Dave Lerner <dave.lerner@windriver.com>
To: <openembedded-core@lists.openembedded.org>, Saul Wold <sgw@linux.intel.com>
Date: Fri, 22 May 2015 10:42:42 -0500
Message-ID: <1432309362-3275-1-git-send-email-dave.lerner@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] valgrind: remove arm tests that don't compile
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
X-List-Received-Date: Fri, 22 May 2015 15:43:09 -0000
Content-Type: text/plain

[Yocto #7453]

Corrects the original commit for the patch that removed ARM ptest CFLAGS
settings. Since the flags could be set by a user, the flags should
be kept in place during compilation.  By keeping the original up-stream
CFLAGS for the tests, then additional tests successfully compile
for all tested ARM tunings.

However, there were still two tests listed below that did not compile
for any beaglebone tuning that is valid for valgrind. With the updated
patch, the set of excluded ARM ptests and their respective build
failures are:
  intdiv - fails for all beaglebone tunings with 2 errors:
  {standard input}:(40 or 41): Error: selected processor does not
       support Thumb mode `udiv r3,r9,r10'
  {standard input}:(72 or 73): Error: selected processor does not
       support Thumb mode `sdiv r3,r9,r10'

  vcvt_fixed_float_VFP - fails for all beaglebone tunings in one of
  two ways:
    with neon tuning (-mfpu=neon) fails with Internal Compiler Error
    without neon tuning fails with 3 errors:
    {standard input}:33: Error: selected FPU does not support
      instruction -- `vcvt.f32.s32 s15,s15,#1'
    {standard input}:58: Error: selected FPU does not support
      instruction -- `vcvt.f32.s32 s15,s15,#32'
    {standard input}:136: Error: selected FPU does not support
      instruction -- `vcvt.f32.u32 s15,s15,#1'

After applying this commit, the valgrind ARM ptests compile without
errors for tunings:
  armv7[t][hf][b][-neon] cortexa8[t][hf][-neon]
where the tuning [option] was successfully compiled, both with
and without the 'option', and in combination with all other options.

Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
---
 .../valgrind/remove-arm-variant-specific.patch     | 99 +++++++++++-----------
 1 file changed, 48 insertions(+), 51 deletions(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-arm-variant-specific.patch b/meta/recipes-devtools/valgrind/valgrind/remove-arm-variant-specific.patch
index f84bf9a..2319ab9 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-arm-variant-specific.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-arm-variant-specific.patch
@@ -1,69 +1,66 @@
-Remove tests that require thumb compiler flags
-
-Default compiler options for arm machines are incompatible with the
-'-mthumb' compiler option imposed by the intdiv and lrt test
-applications, so those two are removed from the ptest build.
+Remove arm tests that don't compile
 
 Upstream-Status: Pending
 
+Corrects the original commit for the patch that removed ARM ptest CFLAGS
+settings. Since the flags could be set by a user, the flags should
+be kept in place during compilation.  By keeping the original up-stream
+CFLAGS for the tests, then additional tests successfully compile
+for all tested ARM tunings.
+
+However, there were still two tests listed below that did not compile
+for any beaglebone tuning that is valid for valgrind. With the updated
+patch, the set of excluded ARM ptests and their respective build
+failures are:
+  intdiv - fails for all beaglebone tunings with 2 errors:
+  {standard input}:(40 or 41): Error: selected processor does not
+       support Thumb mode `udiv r3,r9,r10'
+  {standard input}:(72 or 73): Error: selected processor does not
+       support Thumb mode `sdiv r3,r9,r10'
+
+  vcvt_fixed_float_VFP - fails for all beaglebone tunings in one of
+  two ways:
+    with neon tuning (-mfpu=neon) fails with Internal Compiler Error
+    without neon tuning fails with 3 errors:
+    {standard input}:33: Error: selected FPU does not support
+      instruction -- `vcvt.f32.s32 s15,s15,#1'
+    {standard input}:58: Error: selected FPU does not support
+      instruction -- `vcvt.f32.s32 s15,s15,#32'
+    {standard input}:136: Error: selected FPU does not support
+      instruction -- `vcvt.f32.u32 s15,s15,#1'
+
+After applying this commit, the valgrind ARM ptests compile without
+errors for tunings:
+  armv7[t][hf][b][-neon] cortexa8[t][hf][-neon]
+where the tuning [option] was successfully compiled, both with
+and without the 'option', and in combination with all other options.
+
 Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
 
-Index: valgrind-3.10.0/none/tests/arm/Makefile.am
+Index: valgrind-3.10.1/none/tests/arm/Makefile.am
 ===================================================================
---- valgrind-3.10.0.orig/none/tests/arm/Makefile.am
-+++ valgrind-3.10.0/none/tests/arm/Makefile.am
-@@ -17,15 +17,16 @@ EXTRA_DIST = \
+--- valgrind-3.10.1.orig/none/tests/arm/Makefile.am	2015-05-19 15:11:59.224842927 -0500
++++ valgrind-3.10.1/none/tests/arm/Makefile.am	2015-05-19 15:14:20.808847028 -0500
+@@ -17,9 +17,13 @@
  	vfp.stdout.exp vfp.stderr.exp vfp.vgtest \
  	vfpv4_fma.stdout.exp vfpv4_fma.stderr.exp vfpv4_fma.vgtest
  
-+# For yocto:
-+#  Only include tests that don't require Thumb.
-+#  Only use CFLAGS passed in by the build system.
-+# Some tests may fail, but all tests must compile.
++# Remove the following tests which cause compiler errors for all tunings
++#  available for beagle bone (see remove-arm-variant-specific.patch):
++#	intdiv
++#	vcvt_fixed_float_VFP
++
  check_PROGRAMS = \
  	allexec \
 -	intdiv \
--	ldrt \
+ 	ldrt \
  	ldrt_arm \
  	neon128 \
- 	neon64 \
+@@ -27,7 +31,6 @@
  	v6intARM \
--	v6intThumb \
+ 	v6intThumb \
  	v6media \
- 	vcvt_fixed_float_VFP \
+-	vcvt_fixed_float_VFP \
  	vfp \
-@@ -36,34 +37,3 @@ AM_CXXFLAGS  += @FLAG_M32@
- AM_CCASFLAGS += @FLAG_M32@
+ 	vfpv4_fma
  
- allexec_CFLAGS		= $(AM_CFLAGS) @FLAG_W_NO_NONNULL@
--
--# These two are specific to their ARM/Thumb respectively and so we
--# hardwire -marm/-mthumb.  neon64 and neon128 are compilable on both,
--# however, ask for them to be compiled on thumb, as that looks
--# like that's going to be the more common use case.  They also
--# need special helping w.r.t -mfpu and -mfloat-abi, though.
--# Also force -O0 since -O takes hundreds of MB of memory 
--# for v6intThumb.c.
--v6intARM_CFLAGS   = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 -marm
--v6intThumb_CFLAGS = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 -mthumb
--
--v6media_CFLAGS    = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 -mthumb
--
--vfp_CFLAGS        = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 \
--			-mfpu=neon \
--			-mthumb
--
--
--neon128_CFLAGS    = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 \
--			-mfpu=neon \
--			-mthumb
--
--neon64_CFLAGS     = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a8 \
--			-mfpu=neon \
--			-mthumb
--
--intdiv_CFLAGS	  = $(AM_CFLAGS) -g -mcpu=cortex-a15 -mthumb
--ldrt_CFLAGS	  = $(AM_CFLAGS) -g -mcpu=cortex-a8 -mthumb
--ldrt_arm_CFLAGS	  = $(AM_CFLAGS) -g -mcpu=cortex-a8 -marm
--
--vfpv4_fma_CFLAGS  = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a15 -mfpu=vfpv4 -marm
-- 
1.9.1



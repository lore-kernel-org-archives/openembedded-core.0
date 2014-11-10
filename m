Return-Path: <net147@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8F323713A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 10:45:58 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id kq14so7948091pab.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 02:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=KeiIR+kiU88g4rP3b1JknVjaxNMa0KGflDu0oOsxYYQ=;
	b=umOhv4t/n/GVsRtX4Drw6TPEZI3lEu2eP6kNPXWvYzixCSVnHbesSizbm+E0weGCE8
	b9r2NPf87wmbd3tRAliptwigLoCeFZBLz6SX+HNlIj/em6ft9IL1G1lCTmtjOfG1/hoj
	Ydb2TWLpDhuKNQxlCQtTnBEtT+/LW9OFPhses2d5ggUC5LPcna8ZPb/34fxfjcEnTzdw
	o7nNrAWNoe+/Tm4ey+unPxYZgyLvRAqDiLYi7o5PYK1bwy4KFbIRrWQ9aNs2vdpmouGd
	8CI5wIGP5dF6A6FDk8cRLWwjMru1fIGlDE0QrCJU52IVJXBjAC4a0sIPp7P/gEQP6Su/
	mfGA==
X-Received: by 10.66.234.100 with SMTP id ud4mr31184010pac.36.1415616359289;
	Mon, 10 Nov 2014 02:45:59 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	kc15sm16225363pbb.3.2014.11.10.02.45.57 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Nov 2014 02:45:58 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Nov 2014 21:59:24 +1100
Message-Id: <1415617164-18810-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.1.2
Subject: [PATCH] valgrind: Upgrade to 3.10.0
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
X-List-Received-Date: Mon, 10 Nov 2014 10:45:59 -0000

Updated two patches to fit new version:
- remove-arm-variant-specific.patch
- remove-ppc-tests-failing-build.patch

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../valgrind/valgrind/remove-arm-variant-specific.patch     | 13 ++++++++-----
 .../valgrind/valgrind/remove-ppc-tests-failing-build.patch  | 12 ++++++------
 .../valgrind/{valgrind_3.9.0.bb => valgrind_3.10.0.bb}      |  4 ++--
 3 files changed, 16 insertions(+), 13 deletions(-)
 rename meta/recipes-devtools/valgrind/{valgrind_3.9.0.bb => valgrind_3.10.0.bb} (95%)

diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-arm-variant-specific.patch b/meta/recipes-devtools/valgrind/valgrind/remove-arm-variant-specific.patch
index 46dea60..951ff0e 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-arm-variant-specific.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-arm-variant-specific.patch
@@ -7,14 +7,15 @@ applications, so those two are removed from the ptest build.
 Upstream-Status: Pending
 
 Signed-off-by: Dave Lerner <dave.lerner@windriver.com>
+Signed-off-by: Jonathan Liu <net147@gmail.com>
 
 diff --git a/none/tests/arm/Makefile.am b/none/tests/arm/Makefile.am
 index 2a19f5b..ccdeb77 100644
 --- a/none/tests/arm/Makefile.am
 +++ b/none/tests/arm/Makefile.am
-@@ -16,15 +16,16 @@ EXTRA_DIST = \
- 		vcvt_fixed_float_VFP.vgtest \
- 	vfp.stdout.exp vfp.stderr.exp vfp.vgtest
+@@ -17,15 +17,16 @@
+ 	vfp.stdout.exp vfp.stderr.exp vfp.vgtest \
+ 	vfpv4_fma.stdout.exp vfpv4_fma.stderr.exp vfpv4_fma.vgtest
  
 +# For yocto:
 +#  Only include tests that don't require Thumb.
@@ -31,8 +32,8 @@ index 2a19f5b..ccdeb77 100644
 -	v6intThumb \
  	v6media \
  	vcvt_fixed_float_VFP \
- 	vfp
-@@ -34,32 +35,3 @@ AM_CXXFLAGS  += @FLAG_M32@
+ 	vfp \
+@@ -36,34 +37,3 @@
  AM_CCASFLAGS += @FLAG_M32@
  
  allexec_CFLAGS		= $(AM_CFLAGS) @FLAG_W_NO_NONNULL@
@@ -65,3 +66,5 @@ index 2a19f5b..ccdeb77 100644
 -intdiv_CFLAGS	  = $(AM_CFLAGS) -g -mcpu=cortex-a15 -mthumb
 -ldrt_CFLAGS	  = $(AM_CFLAGS) -g -mcpu=cortex-a8 -mthumb
 -ldrt_arm_CFLAGS	  = $(AM_CFLAGS) -g -mcpu=cortex-a8 -marm
+-
+-vfpv4_fma_CFLAGS  = $(AM_CFLAGS) -g -O0 -mcpu=cortex-a15 -mfpu=vfpv4 -marm
diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-ppc-tests-failing-build.patch b/meta/recipes-devtools/valgrind/valgrind/remove-ppc-tests-failing-build.patch
index 2a14e18..bc00645 100644
--- a/meta/recipes-devtools/valgrind/valgrind/remove-ppc-tests-failing-build.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-ppc-tests-failing-build.patch
@@ -40,7 +40,7 @@ diff --git a/memcheck/tests/ppc32/Makefile.am b/memcheck/tests/ppc32/Makefile.am
 index bd70eea..1436e8e 100644
 --- a/memcheck/tests/ppc32/Makefile.am
 +++ b/memcheck/tests/ppc32/Makefile.am
-@@ -7,8 +7,7 @@ EXTRA_DIST = $(noinst_SCRIPTS) \
+@@ -7,8 +7,7 @@
  	power_ISA2_05.stderr.exp power_ISA2_05.stdout.exp power_ISA2_05.vgtest \
  	power_ISA2_05.stdout.exp_Without_FPPO
  
@@ -54,7 +54,7 @@ diff --git a/none/tests/ppc32/Makefile.am b/none/tests/ppc32/Makefile.am
 index 4f581b6..91ce7e7 100644
 --- a/none/tests/ppc32/Makefile.am
 +++ b/none/tests/ppc32/Makefile.am
-@@ -50,16 +50,8 @@ check_PROGRAMS = \
+@@ -52,16 +52,8 @@
  	allexec \
  	bug129390-ppc32 \
  	bug139050-ppc32 \
@@ -67,9 +67,9 @@ index 4f581b6..91ce7e7 100644
 -	test_isa_2_07_part1 \
 -	test_isa_2_07_part2 \
 -	test_tm \
--	test_touch_tm
+-	test_touch_tm \
 +	ldstrev lsw mftocrf mcrfs test_fx test_gx \
-+	twi tw xlc_dbl_u32 power6_bcmp 
++	twi tw xlc_dbl_u32 power6_bcmp \
+ 	ldst_multiple \
+ 	data-cache-instructions
  
- AM_CFLAGS    += @FLAG_M32@
- AM_CXXFLAGS  += @FLAG_M32@
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.10.0.bb
similarity index 95%
rename from meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.10.0.bb
index c415e77..dbd70b7 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.9.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.10.0.bb
@@ -23,8 +23,8 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://run-ptest \
           "
 
-SRC_URI[md5sum] = "0947de8112f946b9ce64764af7be6df2"
-SRC_URI[sha256sum] = "e6af71a06bc2534541b07743e1d58dc3caf744f38205ca3e5b5a0bdf372ed6f0"
+SRC_URI[md5sum] = "7c311a72a20388aceced1aa5573ce970"
+SRC_URI[sha256sum] = "03047f82dfc6985a4c7d9d2700e17bc05f5e1a0ca6ad902e5d6c81aeb720edc9"
 
 COMPATIBLE_HOST = '(i.86|x86_64|powerpc|powerpc64).*-linux'
 COMPATIBLE_HOST_armv7a = 'arm.*-linux'
-- 
2.1.2



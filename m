Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16730C433F5
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 14:11:39 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web08.22773.1651327893966093690
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Apr 2022 07:11:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: redrectangle.org,
 ip: 217.70.183.195, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 7292F60002;
	Sat, 30 Apr 2022 14:11:29 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [master][kirkstone][PATCH] powerpc: Remove invalid GLIBC_EXTRA_OECONF
Date: Sat, 30 Apr 2022 07:08:04 -0700
Message-Id: <20220430140804.1597722-1-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Apr 2022 14:11:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165069

OE-core previously carried patches to glibc that added optimized sqrt
implementations for various PowerPC chips. These were recently removed,
which now results in errors when compiling glibc with certian PowerPC
machine tunes:

	checking sysdep dirs... configure: error: The 603e subspecies of powerpc is not supported.

Remove setting GLIBC_EXTRA_OECONF with parameters that are no longer
valid. Also remove a commented out setting of the variable that probably
isn't vaild anyway.

Fixes: 2511e937f445 ("glibc: Drop ppc sqrt optimisations")

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta/conf/machine/include/powerpc/tune-ppc603e.inc   | 3 ---
 meta/conf/machine/include/powerpc/tune-ppc7400.inc   | 3 ---
 meta/conf/machine/include/powerpc/tune-ppce300c3.inc | 3 ---
 meta/conf/machine/include/powerpc/tune-ppce500mc.inc | 3 ---
 meta/conf/machine/include/powerpc/tune-ppce5500.inc  | 3 ---
 meta/conf/machine/include/powerpc/tune-ppce6500.inc  | 4 ----
 6 files changed, 19 deletions(-)

diff --git a/meta/conf/machine/include/powerpc/tune-ppc603e.inc b/meta/conf/machine/include/powerpc/tune-ppc603e.inc
index 8beec00f24..28680bdb3c 100644
--- a/meta/conf/machine/include/powerpc/tune-ppc603e.inc
+++ b/meta/conf/machine/include/powerpc/tune-ppc603e.inc
@@ -9,6 +9,3 @@ AVAILTUNES += "ppc603e"
 TUNE_FEATURES:tune-ppc603e = "m32 fpu-hard ppc603e bigendian"
 TUNE_PKGARCH:tune-ppc603e = "ppc603e"
 PACKAGE_EXTRA_ARCHS:tune-ppc603e = "${PACKAGE_EXTRA_ARCHS:tune-powerpc} ppc603e"
-
-# glibc configure options to get 603e specific library (for sqrt)
-GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'ppc603e', '-with-cpu=603e', '', d)}"
diff --git a/meta/conf/machine/include/powerpc/tune-ppc7400.inc b/meta/conf/machine/include/powerpc/tune-ppc7400.inc
index 1e2c9fc2ce..49b94f5ee1 100644
--- a/meta/conf/machine/include/powerpc/tune-ppc7400.inc
+++ b/meta/conf/machine/include/powerpc/tune-ppc7400.inc
@@ -9,6 +9,3 @@ AVAILTUNES += "ppc7400"
 TUNE_FEATURES:tune-ppc7400 = "m32 fpu-hard ppc7400 altivec bigendian"
 TUNE_PKGARCH:tune-ppc7400 = "ppc7400"
 PACKAGE_EXTRA_ARCHS:tune-ppc7400 = "${PACKAGE_EXTRA_ARCHS:tune-powerpc} ppc7400"
-
-# glibc configure options to get 7400 specific library (for sqrt)
-#GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'ppc7400', '--with-cpu=power4', '', d)}"
diff --git a/meta/conf/machine/include/powerpc/tune-ppce300c3.inc b/meta/conf/machine/include/powerpc/tune-ppce300c3.inc
index b74b6ad976..31aff51af3 100644
--- a/meta/conf/machine/include/powerpc/tune-ppce300c3.inc
+++ b/meta/conf/machine/include/powerpc/tune-ppce300c3.inc
@@ -11,9 +11,6 @@ TUNE_PKGARCH:tune-ppce300c3 = "ppce300c3"
 PACKAGE_EXTRA_ARCHS:tune-ppce300c3 = "${PACKAGE_EXTRA_ARCHS:tune-powerpc} ppce300c3"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'ppce300c3', ' -mcpu=e300c3', '', d)}"
 
-# glibc config options to make use of e300c3 (603e) specific sqrt/sqrtf routines
-GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'ppce300c3', '--with-cpu=e300c3', '', d)}"
-
 # soft-float
 TUNEVALID[ppce300c3-nf] = "Enable ppce300c3 specific processor optimizations (no fpu)"
 TUNE_FEATURES:tune-ppce300c3-nf = "${TUNE_FEATURES:tune-powerpc-nf} ppce300c3-nf"
diff --git a/meta/conf/machine/include/powerpc/tune-ppce500mc.inc b/meta/conf/machine/include/powerpc/tune-ppce500mc.inc
index e3524a10ca..036f8b2631 100644
--- a/meta/conf/machine/include/powerpc/tune-ppce500mc.inc
+++ b/meta/conf/machine/include/powerpc/tune-ppce500mc.inc
@@ -10,8 +10,5 @@ TUNE_FEATURES:tune-ppce500mc = "m32 fpu-hard ppce500mc bigendian"
 TUNE_PKGARCH:tune-ppce500mc = "ppce500mc"
 PACKAGE_EXTRA_ARCHS:tune-ppce500mc = "${PACKAGE_EXTRA_ARCHS:tune-powerpc} ppce500mc"
 
-# glibc configure options to get e500mc specific library (for sqrt)
-GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'ppce500mc', '-with-cpu=e500mc', '', d)}"
-
 # pass -mcpu=e500mc for ppce500mc kernel cross compile
 TARGET_CC_KERNEL_ARCH = "-mcpu=e500mc"
diff --git a/meta/conf/machine/include/powerpc/tune-ppce5500.inc b/meta/conf/machine/include/powerpc/tune-ppce5500.inc
index 2cf7b1737c..4915b81ee4 100644
--- a/meta/conf/machine/include/powerpc/tune-ppce5500.inc
+++ b/meta/conf/machine/include/powerpc/tune-ppce5500.inc
@@ -16,8 +16,5 @@ BASE_LIB:tune-ppc64e5500 = "lib64"
 TUNE_PKGARCH:tune-ppc64e5500 = "ppc64e5500"
 PACKAGE_EXTRA_ARCHS:tune-ppc64e5500 = "${PACKAGE_EXTRA_ARCHS:tune-powerpc64} ppc64e5500"
 
-# glibc configure options to get e5500 specific library (for sqrt)
-GLIBC_EXTRA_OECONF += "${@bb.utils.contains('TUNE_FEATURES', 'e5500', '--with-cpu=e5500', '', d)}"
-
 # QEMU usermode fails with invalid instruction error (YOCTO: #10304)
 MACHINE_FEATURES_BACKFILL_CONSIDERED:append = "${@bb.utils.contains('TUNE_FEATURES', 'e5500', ' qemu-usermode', '', d)}"
diff --git a/meta/conf/machine/include/powerpc/tune-ppce6500.inc b/meta/conf/machine/include/powerpc/tune-ppce6500.inc
index e78de350ad..f6310ab4c4 100644
--- a/meta/conf/machine/include/powerpc/tune-ppce6500.inc
+++ b/meta/conf/machine/include/powerpc/tune-ppce6500.inc
@@ -16,9 +16,5 @@ BASE_LIB:tune-ppc64e6500 = "lib64"
 TUNE_PKGARCH:tune-ppc64e6500 = "ppc64e6500"
 PACKAGE_EXTRA_ARCHS:tune-ppc64e6500 = "${PACKAGE_EXTRA_ARCHS:tune-powerpc64} ppc64e6500"
 
-# glibc configure options to get e6500 specific library
-GLIBC_EXTRA_OECONF:powerpc64 += "${@bb.utils.contains('TUNE_FEATURES', 'e6500', '--with-cpu=e6500', '', d)}"
-GLIBC_EXTRA_OECONF:powerpc += "${@bb.utils.contains('TUNE_FEATURES', 'e6500', '--with-cpu=e6500', '', d)}"
-
 # QEMU usermode fails with invalid instruction error (YOCTO: #10304)
 MACHINE_FEATURES_BACKFILL_CONSIDERED:append = "${@bb.utils.contains('TUNE_FEATURES', 'e6500', ' qemu-usermode', '', d)}"
-- 
2.35.1



Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E3BC7EE25
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 03:25:34 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web10.539.1686108330913819157
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jun 2023 20:25:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=VigLIUbd;
 spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686108331; x=1717644331;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0GWavUmxZ6VhB5JsAZ6rdYf1a8Cw4IRjjftIsn60m0M=;
  b=VigLIUbdDt8Dvz5DgpXBlNdkaM4ORiM0DjqMLyNAQ6LD94kd2MOWNE3o
   n0wkm7GpaWQGxsmE7MBivdDQ5GMp3UM+Y0wKvPEpMzQCxufYoTiMtpahF
   X5Q7j+3kYx2WPi6Km6jLdv0soGaOsIpAH6Ulip0Qt/O+RJ2VFK6prRKNe
   cn/lFyYxqBUs0s26YHEwtkUZZ6j55ZzI31dVdWZeSmwznAhuxpotzd1YH
   30/kSDkApZ7N4rDaxAh33HtbVEJ36NPIfQMOs+nPy/vbhcyMsCbOIZwIo
   4IWdgYmAtFRKIa33tiX1SEYdj0MrLuJFeHjjQoyX14VLX5JElZRSprNR0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="341519117"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; 
   d="scan'208";a="341519117"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 20:25:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="703442013"
X-IronPort-AV: E=Sophos;i="6.00,222,1681196400"; 
   d="scan'208";a="703442013"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.215.153.121])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 20:25:29 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glib-2.0: upgrade 2.76.2 -> 2.76.3
Date: Wed,  7 Jun 2023 11:25:16 +0800
Message-Id: <20230607032516.19934-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 03:25:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182453

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...utex_simple-inadvertently-modify-err.patch | 36 -------------------
 ...{glib-2.0_2.76.2.bb => glib-2.0_2.76.3.bb} |  3 +-
 2 files changed, 1 insertion(+), 38 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Avoid-having-g_futex_simple-inadvertently-modify-err.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.76.2.bb => glib-2.0_2.76.3.bb} (93%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Avoid-having-g_futex_simple-inadvertently-modify-err.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Avoid-having-g_futex_simple-inadvertently-modify-err.patch
deleted file mode 100644
index db63cfd91e..0000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-Avoid-having-g_futex_simple-inadvertently-modify-err.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From edd1e47f107410d9e4edb691335410026ae5a534 Mon Sep 17 00:00:00 2001
-From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
-Date: Tue, 25 Apr 2023 20:02:31 +0200
-Subject: [PATCH] Avoid having g_futex_simple() inadvertently modify errno
-
-If both __NR_futex and __NR_futex_time64 are defined, g_futex_simple()
-will first call futex_time64(). If that fails with ENOSYS, then
-futex_time() is called instead. However, errno was not saved and
-restored in this case, which would result in g_futex_simple()
-returning with errno set to ENOSYS, even if futex_time() succeeded.
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/edd1e47f107410d9e4edb691335410026ae5a534]
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
----
- glib/gthreadprivate.h | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/glib/gthreadprivate.h b/glib/gthreadprivate.h
-index 9c847e039..74d37ba32 100644
---- a/glib/gthreadprivate.h
-+++ b/glib/gthreadprivate.h
-@@ -65,9 +65,13 @@ struct  _GRealThread
- #define g_futex_simple(uaddr, futex_op, ...)                                     \
-   G_STMT_START                                                                   \
-   {                                                                              \
-+    int saved_errno = errno;                                                     \
-     int res = syscall (__NR_futex_time64, uaddr, (gsize) futex_op, __VA_ARGS__); \
-     if (res < 0 && errno == ENOSYS)                                              \
--      syscall (__NR_futex, uaddr, (gsize) futex_op, __VA_ARGS__);                \
-+      {                                                                          \
-+        errno = saved_errno;                                                     \
-+        syscall (__NR_futex, uaddr, (gsize) futex_op, __VA_ARGS__);              \
-+      }                                                                          \
-   }                                                                              \
-   G_STMT_END
- #elif defined(__NR_futex_time64)
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb
similarity index 93%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb
index 6a9a5f359c..a60e768836 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb
@@ -14,12 +14,11 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
-           file://0001-Avoid-having-g_futex_simple-inadvertently-modify-err.patch \
            file://0001-gio-tests-portal-support-Fix-snap-test-ordering-race.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-SRC_URI[sha256sum] = "24f3847857b1d8674cdb0389a36edec0f13c666cd3ce727ecd340eb9da8aca9e"
+SRC_URI[sha256sum] = "c0be444e403d7c3184d1f394f89f0b644710b5e9331b54fa4e8b5037813ad32a"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.40.1



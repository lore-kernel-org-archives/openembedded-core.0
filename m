Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB748C48BF6
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 11:40:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by mx.groups.io with SMTP id smtpd.web10.16724.1708083641400806033
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 03:40:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=amqiD3IY;
 spf=pass (domain: intel.com, ip: 192.198.163.16, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708083642; x=1739619642;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=XzU2D/efTprpMArWtHZ+3IhSewFQQHWlgi9DfWxOKvM=;
  b=amqiD3IY6QHXMBulTkDrirG/FaJHx54keOGXVJXdadJdo1hN6+ZdqfSc
   +vXwiIYzlkOKubgXppMsxR3vA/wH5dmDR/36z/e/9kVLmf0m9nZVSfn3D
   L+RGtxKisMsEUdr5lVgs0pp98p+O//vKUbAzqcUO82CHTcWaIlaQoItj7
   B51gHpNeJJjt2VQEk7M4PflgTGVokFpBYNqcsctOjfM+cy7HtW3/VCV7Y
   bX4vYZOqYVsby/u+/g4qrokqrDN0J7ahXhXO6RUAuAP1VeZ8GvuHGwx0V
   7aKECwwEMzd0IoBYzXAasG3k2gAC+xv81+j9BziYNv7P6ACu/9OKwbVQJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2612856"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2612856"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 03:40:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="912349723"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="912349723"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.247.118.3])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 03:40:41 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/9] minicom: upgrade 2.8 -> 2.9
Date: Fri, 16 Feb 2024 19:40:27 +0800
Message-ID: <20240216114034.109257-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240216114034.109257-1-anuj.mittal@intel.com>
References: <20240216114034.109257-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 11:40:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195749

Drop patches that have been merged upstream and available in this
version.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ix-minicom-h-v-return-value-is-not-0.patch | 33 -------------------
 .../minicom/allow.to.disable.lockdev.patch    | 30 -----------------
 .../{minicom_2.8.bb => minicom_2.9.bb}        |  7 ++--
 3 files changed, 2 insertions(+), 68 deletions(-)
 delete mode 100644 meta/recipes-extended/minicom/minicom/0001-fix-minicom-h-v-return-value-is-not-0.patch
 delete mode 100644 meta/recipes-extended/minicom/minicom/allow.to.disable.lockdev.patch
 rename meta/recipes-extended/minicom/{minicom_2.8.bb => minicom_2.9.bb} (80%)

diff --git a/meta/recipes-extended/minicom/minicom/0001-fix-minicom-h-v-return-value-is-not-0.patch b/meta/recipes-extended/minicom/minicom/0001-fix-minicom-h-v-return-value-is-not-0.patch
deleted file mode 100644
index 9e67126f3e1..00000000000
--- a/meta/recipes-extended/minicom/minicom/0001-fix-minicom-h-v-return-value-is-not-0.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Exit normally for help/verison options
-
-If -v or -h is used for the help/version information, it is a normal exit situation,
-not an error condition. Sometimes these are used as a simple operation test of the
-resulting binary so the exit code does matter.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Submitted [https://salsa.debian.org/minicom-team/minicom/-/merge_requests/14]
----
- src/minicom.c |    6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-Index: minicom-2.8/src/minicom.c
-===================================================================
---- minicom-2.8.orig/src/minicom.c
-+++ minicom-2.8/src/minicom.c
-@@ -1257,14 +1257,14 @@ int main(int argc, char **argv)
-                  "modify it under the terms of the GNU General Public License\n"
-                  "as published by the Free Software Foundation; either version\n"
-                  "2 of the License, or (at your option) any later version.\n\n"));
--          exit(1);
-+          exit(0);
-           break;
-         case 's': /* setup mode */
-           dosetup = 1;
-           break;
-         case 'h':
-           helpthem();
--          exit(1);
-+          exit(0);
-           break;
-         case 'p': /* Pseudo terminal to use. */
-           if (strncmp(optarg, "/dev/", 5) == 0)
diff --git a/meta/recipes-extended/minicom/minicom/allow.to.disable.lockdev.patch b/meta/recipes-extended/minicom/minicom/allow.to.disable.lockdev.patch
deleted file mode 100644
index 39dc5c04925..00000000000
--- a/meta/recipes-extended/minicom/minicom/allow.to.disable.lockdev.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-configure: Allow lockdev to be disabled
-
-When the pkgconfig dependencies may be present, it is useful to be
-able to explictly disable the lockdev dependency. This adds such an
-option.
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Upstream-Status: Submitted [https://salsa.debian.org/minicom-team/minicom/-/merge_requests/14]
-
-Index: minicom-2.8/configure.ac
-===================================================================
---- minicom-2.8.orig/configure.ac
-+++ minicom-2.8/configure.ac
-@@ -43,7 +43,13 @@ if test "x$enable_socket" = xyes; then
- fi
- 
- PKG_PROG_PKG_CONFIG
--if test -n "$PKG_CONFIG"; then
-+
-+AC_ARG_ENABLE([lockdev],
-+        AS_HELP_STRING([--enable-lockdev],
-+                       [Enable lockdev support (def: enabled)]),
-+        [], [enable_lockdev="yes"])
-+
-+if test -n "$PKG_CONFIG" && test "x$enable_lockdev" = xyes; then
- 	PKG_CHECK_MODULES([LOCKDEV], [lockdev], AC_DEFINE([HAVE_LOCKDEV],[1],[Define if you have lockdev]),[:])
- fi
- 
diff --git a/meta/recipes-extended/minicom/minicom_2.8.bb b/meta/recipes-extended/minicom/minicom_2.9.bb
similarity index 80%
rename from meta/recipes-extended/minicom/minicom_2.8.bb
rename to meta/recipes-extended/minicom/minicom_2.9.bb
index 2640c6b0574..907d5c79c9d 100644
--- a/meta/recipes-extended/minicom/minicom_2.8.bb
+++ b/meta/recipes-extended/minicom/minicom_2.9.bb
@@ -7,12 +7,9 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=420477abc567404debca0a2a1cb6b645 \
                     file://src/minicom.h;beginline=1;endline=12;md5=a58838cb709f0db517f4e42730c49e81"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/m/${BPN}/${BPN}_${PV}.orig.tar.bz2 \
-           file://allow.to.disable.lockdev.patch \
-           file://0001-fix-minicom-h-v-return-value-is-not-0.patch \
-"
+SRC_URI = "${DEBIAN_MIRROR}/main/m/${BPN}/${BPN}_${PV}.orig.tar.bz2"
 
-SRC_URI[sha256sum] = "38cea30913a20349326ff3f1763ee1512b7b41601c24f065f365e18e9db0beba"
+SRC_URI[sha256sum] = "9efbb6458140e5a0de445613f0e76bcf12cbf7a9892b2f53e075c2e7beaba86c"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[lockdev] = "--enable-lockdev,--disable-lockdev,lockdev"
-- 
2.43.2



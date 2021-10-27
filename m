Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC94C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 15:18:33 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web11.13210.1635347912852474029
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 08:18:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="230456843"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="230456843"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:30 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="537617226"
Received: from hchai4-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.47])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:29 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 24/36] gpgme: Use glibc provided closefrom API when
 available
Date: Wed, 27 Oct 2021 23:16:32 +0800
Message-Id: 
 <f03762543ad8f05c2b5aea2c33f86d5eeef2e8bc.1635347406.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635347406.git.anuj.mittal@intel.com>
References: <cover.1635347406.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 15:18:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157552

From: Khem Raj <raj.khem@gmail.com>

glibc 2.34+ has added this API new

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a2b2479d20d029f5a11dba8cf7f7ca3e4a5bbbe2)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...se-closefrom-on-linux-and-glibc-2.34.patch | 24 +++++++++++++++++++
 meta/recipes-support/gpgme/gpgme_1.15.1.bb    |  3 ++-
 2 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch

diff --git a/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch b/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
new file mode 100644
index 0000000000..1c46684c6d
--- /dev/null
+++ b/meta/recipes-support/gpgme/gpgme/0001-use-closefrom-on-linux-and-glibc-2.34.patch
@@ -0,0 +1,24 @@
+From adb1d4e5498a19e9d591ac8f42f9ddfdb23a1354 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 15 Jul 2021 12:33:13 -0700
+Subject: [PATCH] use closefrom() on linux and glibc 2.34+
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/posix-io.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/posix-io.c b/src/posix-io.c
+index e712ef2..ab8ded9 100644
+--- a/src/posix-io.c
++++ b/src/posix-io.c
+@@ -570,7 +570,7 @@ _gpgme_io_spawn (const char *path, char *const argv[], unsigned int flags,
+               if (fd_list[i].fd > fd)
+                 fd = fd_list[i].fd;
+             fd++;
+-#if defined(__sun) || defined(__FreeBSD__)
++#if defined(__sun) || defined(__FreeBSD__) || (defined(__GLIBC__) && __GNUC_PREREQ(2, 34))
+             closefrom (fd);
+             max_fds = fd;
+ #else /*!__sun */
diff --git a/meta/recipes-support/gpgme/gpgme_1.15.1.bb b/meta/recipes-support/gpgme/gpgme_1.15.1.bb
index dc38aa8e3c..f207e81687 100644
--- a/meta/recipes-support/gpgme/gpgme_1.15.1.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.15.1.bb
@@ -20,7 +20,8 @@ SRC_URI = "${GNUPG_MIRROR}/gpgme/${BP}.tar.bz2 \
            file://0006-fix-build-path-issue.patch \
            file://0007-python-Add-variables-to-tests.patch \
            file://0008-do-not-auto-check-var-PYTHON.patch \
-          "
+           file://0001-use-closefrom-on-linux-and-glibc-2.34.patch \
+           "
 
 SRC_URI[sha256sum] = "eebc3c1b27f1c8979896ff361ba9bb4778b508b2496c2fc10e3775a40b1de1ad"
 
-- 
2.31.1



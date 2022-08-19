Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 288E3C25B0E
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 06:10:18 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web10.101.1660889416628408692
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 23:10:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=bMd41RYv;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660889416; x=1692425416;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iewCA8XheJZg/7nz0b7dT420uzKj9c7IgieTt87MDng=;
  b=bMd41RYvXDldRh5s2FtGSHyLnVgoyXJCeGiBdQ+04vc+ltLLz5+7Bxjb
   bA887Id6X3Wa2ORMmOArG3CEychwXzje5G71CvkMdjXh86AyxxvmnGjim
   5odSemcuSyTZ5cNDgQSDAM3keGKTz3bmJp4RrCn/XOJx+VengK3S7RRcZ
   oKwGsZZgx/o4RG/60KsWmIdee5VBZ1D9tFw8EaMwJsahJN08BwhW5w+S7
   Vk6bawqIyW9IEMvPaPxfzF2P5lulJi6am2X+jZr19oXcQRVUlvBDgUCPh
   EesLnjW8BRnDMM5zG3Cw6owDg9s6bCkt1WV5YzdRHgYMzIM7T7E9WC9tT
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="293732684"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200";
   d="scan'208";a="293732684"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 23:10:08 -0700
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200";
   d="scan'208";a="784044902"
Received: from nailulmx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.214.166.221])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 23:10:07 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH] cryptodev-module: fix build with 5.11+ kernels
Date: Fri, 19 Aug 2022 14:10:03 +0800
Message-Id: <20220819061003.43857-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 06:10:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169571

Backport patch to fix:

| cryptodev-module/1.10-r0/git/ioctl.c:875:4: error: implicit declaration of function 'ksys_close'; did you mean 'ksys_chown'? [-Werror=implicit-function-declaration]
|   875 |    ksys_close(fd);
|       |    ^~~~~~~~~~
|       |    ksys_chown
| cc1: some warnings being treated as errors

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../cryptodev/cryptodev-module_1.10.bb        |  1 +
 .../files/fix-build-for-Linux-5.11-rc1.patch  | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-kernel/cryptodev/files/fix-build-for-Linux-5.11-rc1.patch

diff --git a/meta/recipes-kernel/cryptodev/cryptodev-module_1.10.bb b/meta/recipes-kernel/cryptodev/cryptodev-module_1.10.bb
index e4f7d1e3729..d7c7918515d 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-module_1.10.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-module_1.10.bb
@@ -11,6 +11,7 @@ SRC_URI += " \
 file://0001-Disable-installing-header-file-provided-by-another-p.patch \
 file://0001-Fix-build-for-Linux-5.8-rc1.patch \
 file://0001-Fix-build-for-Linux-5.9-rc1.patch \
+file://fix-build-for-Linux-5.11-rc1.patch \
 "
 
 EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
diff --git a/meta/recipes-kernel/cryptodev/files/fix-build-for-Linux-5.11-rc1.patch b/meta/recipes-kernel/cryptodev/files/fix-build-for-Linux-5.11-rc1.patch
new file mode 100644
index 00000000000..3ae77cb9d66
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/files/fix-build-for-Linux-5.11-rc1.patch
@@ -0,0 +1,32 @@
+From 55c6315058fc0dd189ffd116f2cc27ba4fa84cb6 Mon Sep 17 00:00:00 2001
+From: Joan Bruguera <joanbrugueram@gmail.com>
+Date: Mon, 28 Dec 2020 01:41:31 +0100
+Subject: [PATCH] Fix build for Linux 5.11-rc1
+
+ksys_close was removed, as far as I can tell, close_fd replaces it.
+
+See also: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8760c909f54a82aaa6e76da19afe798a0c77c3c3
+          https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1572bfdf21d4d50e51941498ffe0b56c2289f783
+
+Upstream-Status: Backport [https://github.com/cryptodev-linux/cryptodev-linux/commit/55c6315058fc0dd189ffd116f2cc27ba4fa84cb6]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ ioctl.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/ioctl.c b/ioctl.c
+index 3d332380..95481d4f 100644
+--- a/ioctl.c
++++ b/ioctl.c
+@@ -871,8 +871,10 @@ cryptodev_ioctl(struct file *filp, unsigned int cmd, unsigned long arg_)
+ 		if (unlikely(ret)) {
+ #if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 17, 0))
+ 			sys_close(fd);
+-#else
++#elif (LINUX_VERSION_CODE < KERNEL_VERSION(5, 11, 0))
+ 			ksys_close(fd);
++#else
++			close_fd(fd);
+ #endif
+ 			return ret;
+ 		}
-- 
2.37.1



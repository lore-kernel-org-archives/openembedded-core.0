Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE225C83F3F
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 10:38:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web11.45427.1693823896941190099
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Sep 2023 03:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=lC0U0qkT;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693823897; x=1725359897;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gU0JFkC0H9z2mgIvraaIRShGTQpdpdfj0Ic1QtQKXpI=;
  b=lC0U0qkT4Nx9q0GoABf4FNzvH6irCeRCXQA9uHdZZbNX44gupXYbGNOA
   d8XgQiywd8j5+yhCswa1TQczXeXifsX5QY3zzMRHl4xByFsX2WhMD6nFp
   qp2Egxa07FQ9msfxXGoISc0DV+Boe+znUeaDEzs1wu2J8V3cKH0uE5a3F
   eCm9godT/eOUO0FcEE2/rY16OSLsGZYraX9ovZgF1JIFqhOj4ryD3sCSu
   vbduAbNxdh1LUuYCqvIE4a6KaN2O4MpdXTshJ+cCLXaU8nnNBSg6Vxmi/
   9I3vVDpKGWuWuZ7/VxhMqdeZXHPCLRXUgDBTObsp7vrnUsc4LfkeEeTKq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="366793887"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="366793887"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 03:38:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="810871262"
X-IronPort-AV: E=Sophos;i="6.02,226,1688454000"; 
   d="scan'208";a="810871262"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga004.fm.intel.com with ESMTP; 04 Sep 2023 03:38:00 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH 1/2] file: fix CVE-2022-48554
Date: Mon,  4 Sep 2023 18:18:22 +0800
Message-Id: <20230904101823.2075193-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 10:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187170

From: Chee Yang Lee <chee.yang.lee@intel.com>

ignore changes to FILE_RCSID part.

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../file/file/CVE-2022-48554.patch            | 35 +++++++++++++++++++
 meta/recipes-devtools/file/file_5.41.bb       |  4 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/file/file/CVE-2022-48554.patch

diff --git a/meta/recipes-devtools/file/file/CVE-2022-48554.patch b/meta/recipes-devtools/file/file/CVE-2022-48554.patch
new file mode 100644
index 0000000000..c285bd2c23
--- /dev/null
+++ b/meta/recipes-devtools/file/file/CVE-2022-48554.patch
@@ -0,0 +1,35 @@
+CVE:  CVE-2022-48554
+Upstream-Status: Backport [ https://github.com/file/file/commit/497aabb29cd08d2a5aeb63e45798d65fcbe03502 ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+From 497aabb29cd08d2a5aeb63e45798d65fcbe03502 Mon Sep 17 00:00:00 2001
+From: Christos Zoulas <christos@zoulas.com>
+Date: Mon, 14 Feb 2022 16:26:10 +0000
+Subject: [PATCH] PR/310: p870613: Don't use strlcpy to copy the string, it
+ will try to scan the source string to find out how much space is needed the
+ source string might not be NUL terminated.
+
+---
+ src/funcs.c | 11 +++++++----
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/src/funcs.c b/src/funcs.c
+index 89e1da597..dcfd352d2 100644
+--- a/src/funcs.c
++++ b/src/funcs.c
+@@ -54,9 +54,12 @@ FILE_RCSID("@(#)$File: funcs.c,v 1.124 2022/01/10 14:15:08 christos Exp $")
+ protected char *
+ file_copystr(char *buf, size_t blen, size_t width, const char *str)
+ {
+-	if (++width > blen)
+-		width = blen;
+-	strlcpy(buf, str, width);
++	if (blen == 0)
++		return buf;
++	if (width >= blen)
++		width = blen - 1;
++	memcpy(buf, str, width);
++	buf[width] = '\0';
+ 	return buf;
+ }
+ 
diff --git a/meta/recipes-devtools/file/file_5.41.bb b/meta/recipes-devtools/file/file_5.41.bb
index 653887e97a..6fd4f2c746 100644
--- a/meta/recipes-devtools/file/file_5.41.bb
+++ b/meta/recipes-devtools/file/file_5.41.bb
@@ -11,7 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=0251eaec1188b20d9a72c502ecfdd
 DEPENDS = "file-replacement-native"
 DEPENDS:class-native = "bzip2-replacement-native"
 
-SRC_URI = "git://github.com/file/file.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/file/file.git;branch=master;protocol=https \
+           file://CVE-2022-48554.patch \
+"
 
 SRCREV = "504206e53a89fd6eed71aeaf878aa3512418eab1"
 S = "${WORKDIR}/git"
-- 
2.37.3



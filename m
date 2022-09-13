Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B97C6FA86
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 03:47:44 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web10.782.1663040862082628879
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Sep 2022 20:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=T7iVJ/DB;
 spf=pass (domain: intel.com, ip: 192.55.52.43,
 mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663040862; x=1694576862;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MFqqUCfmj30KfwOqTB00pdLsi92HncVsIG6T/QvD0xo=;
  b=T7iVJ/DBlYbt4HalFuy+Yyw3T7BGeUhVb+iD+lVUOVn17ivz3MpzUda/
   o5Z4ZARpSbt0WDkmWFRldO1IiXbUKpSSWq8g1AS031+7cyEOueM2gBxvb
   4gJUe+zJu6zQEIudXpfZKz4ZupINufiNZ6kFrIPh105iW1A3TByV1HTM4
   eOQvfysrUfUjsgAiP/fYxqkbrzDCnCsyUqikihP38BmZYP6+YsTVeFCqI
   mod2Y/V5s1E5H7vpCHP1Ag+gMJIPWd8R7tiWrVKyh2BHN8TFoTBpuNHtx
   MvsGvL5uIJtVPWWK+JWuEVu1onJLdbaBhPepwgRphMObCxemnEctci5mN
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="384324359"
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200";
   d="scan'208";a="384324359"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 20:47:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200";
   d="scan'208";a="567425888"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga003.jf.intel.com with ESMTP; 12 Sep 2022 20:47:40 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell 1/3] connman: fix CVE-2022-32292
Date: Tue, 13 Sep 2022 11:47:37 +0800
Message-Id: <20220913034739.45165-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 03:47:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170557

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../connman/connman/CVE-2022-32292.patch      | 37 +++++++++++++++++++
 .../connman/connman_1.37.bb                   |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2022-32292.patch

diff --git a/meta/recipes-connectivity/connman/connman/CVE-2022-32292.patch b/meta/recipes-connectivity/connman/connman/CVE-2022-32292.patch
new file mode 100644
index 0000000000..74a739d6a2
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/CVE-2022-32292.patch
@@ -0,0 +1,37 @@
+From d1a5ede5d255bde8ef707f8441b997563b9312bd Mon Sep 17 00:00:00 2001
+From: Nathan Crandall <ncrandall@tesla.com>
+Date: Tue, 12 Jul 2022 08:56:34 +0200
+Subject: gweb: Fix OOB write in received_data()
+
+There is a mismatch of handling binary vs. C-string data with memchr
+and strlen, resulting in pos, count, and bytes_read to become out of
+sync and result in a heap overflow.  Instead, do not treat the buffer
+as an ASCII C-string. We calculate the count based on the return value
+of memchr, instead of strlen.
+
+Fixes: CVE-2022-32292
+
+Upstream-Status: Backport
+https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=d1a5ede5d255bde8ef707f8441b997563b9312b
+CVE: CVE-2022-32292
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+---
+ gweb/gweb.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gweb/gweb.c b/gweb/gweb.c
+index 12fcb1d8..13c6c5f2 100644
+--- a/gweb/gweb.c
++++ b/gweb/gweb.c
+@@ -918,7 +918,7 @@ static gboolean received_data(GIOChannel *channel, GIOCondition cond,
+ 		}
+ 
+ 		*pos = '\0';
+-		count = strlen((char *) ptr);
++		count = pos - ptr;
+ 		if (count > 0 && ptr[count - 1] == '\r') {
+ 			ptr[--count] = '\0';
+ 			bytes_read--;
+-- 
+cgit 
+
diff --git a/meta/recipes-connectivity/connman/connman_1.37.bb b/meta/recipes-connectivity/connman/connman_1.37.bb
index bdd1e590ec..4f22c7ad49 100644
--- a/meta/recipes-connectivity/connman/connman_1.37.bb
+++ b/meta/recipes-connectivity/connman/connman_1.37.bb
@@ -12,6 +12,7 @@ SRC_URI  = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
             file://CVE-2021-33833.patch \
             file://CVE-2022-23096-7.patch \
             file://CVE-2022-23098.patch \
+            file://CVE-2022-32292.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
-- 
2.36.1



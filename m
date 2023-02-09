Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB602C05027
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 12:46:37 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web11.13490.1675946796192864494
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 04:46:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=k24nDzkV;
 spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675946796; x=1707482796;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yEOGv7bZ0Nc9Yi1oZ51UdYKLjOOdGNAhdGjWabPugrg=;
  b=k24nDzkV9AmoG1TileRdywd+eiXqVErJQ+JehK/s3WYaKKxD81BjeK7L
   YPqjnJf3/Q1O6c8wp34n7yIbhWf0oecxPWaf4OLK2PIkvns/Iv9hRBVfd
   NjCPCcZnH5/HywCqfC4a4dIAtGudOaLFhy4RebVZFquw0L0pLQQ+1dDQs
   NiyEUqZeG2Vxv6zU6EPtfFs8wPTUKknj/8wTECnE/JV+CKUsJ5CEMktKq
   i8FzxV+MZICT9Q+J6no9xtUN3R1pnzqZoPpLn4+LXeftWjqPKYd61yMv8
   PJ7doi1oVeOweBUOo9j9QZO1Kbod0gQV9Cgiarals7QTTVM+N1s4BqwKJ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="309743288"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="309743288"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 04:46:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="617557313"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="617557313"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga003.jf.intel.com with ESMTP; 09 Feb 2023 04:46:34 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [patch][master][langdale][kirkstone] tar: Fix CVE-2022-48303
Date: Thu,  9 Feb 2023 20:46:26 +0800
Message-Id: <20230209124626.2609388-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 12:46:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176951

From: Chee Yang Lee <chee.yang.lee@intel.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../tar/files/CVE-2022-48303.patch            | 36 +++++++++++++++++++
 meta/recipes-extended/tar/tar_1.34.bb         |  4 ++-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/tar/files/CVE-2022-48303.patch

diff --git a/meta/recipes-extended/tar/files/CVE-2022-48303.patch b/meta/recipes-extended/tar/files/CVE-2022-48303.patch
new file mode 100644
index 0000000000..a8e9f4ac7d
--- /dev/null
+++ b/meta/recipes-extended/tar/files/CVE-2022-48303.patch
@@ -0,0 +1,36 @@
+From 1d530107a24d71e798727d7f0afa0833473d1074 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Matej=20Mu=C5=BEila?= <mmuzila@gmail.com>
+Date: Wed, 11 Jan 2023 08:55:58 +0100
+Subject: [PATCH] Fix savannah bug #62387
+
+* src/list.c (from_header): Check for the end of field after leading byte
+  (0x80 or 0xff) of base-256 encoded header value
+
+Upstream-Status: Backport
+[https://savannah.gnu.org/patch/download.php?file_id=54212]
+CVE: CVE-2022-48303
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ src/list.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/list.c b/src/list.c
+index 9fafc425..bf41b581 100644
+--- a/src/list.c
++++ b/src/list.c
+@@ -895,6 +895,12 @@ from_header (char const *where0, size_t digs, char const *type,
+ 			   << (CHAR_BIT * sizeof (uintmax_t)
+ 			       - LG_256 - (LG_256 - 2)));
+       value = (*where++ & ((1 << (LG_256 - 2)) - 1)) - signbit;
++      if (where == lim)
++        {
++          if (type && !silent)
++            ERROR ((0, 0, _("Archive base-256 value is invalid")));
++          return -1;
++        }
+       for (;;)
+ 	{
+ 	  value = (value << LG_256) + (unsigned char) *where++;
+-- 
+2.38.1
+
diff --git a/meta/recipes-extended/tar/tar_1.34.bb b/meta/recipes-extended/tar/tar_1.34.bb
index 7307cd57a2..22c04ba70a 100644
--- a/meta/recipes-extended/tar/tar_1.34.bb
+++ b/meta/recipes-extended/tar/tar_1.34.bb
@@ -6,7 +6,9 @@ SECTION = "base"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2"
+SRC_URI = "${GNU_MIRROR}/tar/tar-${PV}.tar.bz2 \
+           file://CVE-2022-48303.patch \
+           "
 
 SRC_URI[sha256sum] = "b44cc67f8a1f6b0250b7c860e952b37e8ed932a90bd9b1862a511079255646ff"
 
-- 
2.37.3



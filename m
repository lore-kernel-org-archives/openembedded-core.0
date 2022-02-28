Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA61C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:00:44 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.19878.1646056840489874149
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:00:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=DVeJZpIU;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646056843; x=1677592843;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=imx8HL52yA+YyRNytbl1eMGy5FfUpCO+DyQol6jbLSk=;
  b=DVeJZpIUCBsZmV7FP962nBylJzpqdzWtLj7YL6KXyG6R7MT5QhzYdlD7
   92x7z7lK8bls5Xw7iRCZuILCBypThi6BGaaqAwURYicDDC1RlRJPQd/gm
   ujy0Q1sMm1lFNp7zYHpd6XzgHk+KBl8dKzdb54oIlxpVcDAAoE8v0Bt3s
   tkmyCSc8Tj3nA4DvCOtGi0bzN4VEadIKq0a7oYGltR3elMOe48VbMIrNb
   Qpbrn2RKpAzJyethFuvMDwVhLFye6E85sQzcNTd+RgjEVmOycwBccRWlq
   A2z0+1vEJnAunbiRJzaok5rL5R2p0W0Wap4mU3aWkI/ofQ7k00HUmEKw+
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232856904"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="232856904"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:00:42 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="778092151"
Received: from jtang17-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.141.22])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:00:41 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 02/39] expat: fix CVE-2022-23990
Date: Mon, 28 Feb 2022 21:59:52 +0800
Message-Id: 
 <dc30243e7cc1b1c392b999de114b4096d432ef02.1646056612.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646056612.git.anuj.mittal@intel.com>
References: <cover.1646056612.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:00:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162458

From: Kai Kang <kai.kang@windriver.com>

CVE: CVE-2022-23990

Based on Steve Sakoman's patch for branch dunfell, fix CVE-2022-23990
for expat in branch hardknott.

And correct indent as well.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../expat/expat/CVE-2022-23990.patch          | 49 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.2.10.bb       |  7 +--
 2 files changed, 53 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-23990.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2022-23990.patch b/meta/recipes-core/expat/expat/CVE-2022-23990.patch
new file mode 100644
index 0000000000..c599517b3e
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2022-23990.patch
@@ -0,0 +1,49 @@
+From ede41d1e186ed2aba88a06e84cac839b770af3a1 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Wed, 26 Jan 2022 02:36:43 +0100
+Subject: [PATCH] lib: Prevent integer overflow in doProlog (CVE-2022-23990)
+
+The change from "int nameLen" to "size_t nameLen"
+addresses the overflow on "nameLen++" in code
+"for (; name[nameLen++];)" right above the second
+change in the patch.
+
+Upstream-Status: Backport:
+https://github.com/libexpat/libexpat/pull/551/commits/ede41d1e186ed2aba88a06e84cac839b770af3a1
+
+CVE: CVE-2022-23990
+
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+
+---
+ lib/xmlparse.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/lib/xmlparse.c b/expat/lib/xmlparse.c
+index 5ce31402..d1d17005 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -5372,7 +5372,7 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+       if (dtd->in_eldecl) {
+         ELEMENT_TYPE *el;
+         const XML_Char *name;
+-        int nameLen;
++        size_t nameLen;
+         const char *nxt
+             = (quant == XML_CQUANT_NONE ? next : next - enc->minBytesPerChar);
+         int myindex = nextScaffoldPart(parser);
+@@ -5388,7 +5388,13 @@ doProlog(XML_Parser parser, const ENCODING *enc, const char *s, const char *end,
+         nameLen = 0;
+         for (; name[nameLen++];)
+           ;
+-        dtd->contentStringLen += nameLen;
++
++        /* Detect and prevent integer overflow */
++        if (nameLen > UINT_MAX - dtd->contentStringLen) {
++          return XML_ERROR_NO_MEMORY;
++        }
++
++        dtd->contentStringLen += (unsigned)nameLen;
+         if (parser->m_elementDeclHandler)
+           handleDefault = XML_FALSE;
+       }
diff --git a/meta/recipes-core/expat/expat_2.2.10.bb b/meta/recipes-core/expat/expat_2.2.10.bb
index 074441dc2a..a851e54b2a 100644
--- a/meta/recipes-core/expat/expat_2.2.10.bb
+++ b/meta/recipes-core/expat/expat_2.2.10.bb
@@ -10,13 +10,14 @@ VERSION_TAG = "${@d.getVar('PV').replace('.', '_')}"
 
 SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://libtool-tag.patch \
-	   file://run-ptest \
-	   file://0001-Add-output-of-tests-result.patch \
+           file://run-ptest \
+           file://0001-Add-output-of-tests-result.patch \
            file://CVE-2022-22822-27.patch \
            file://CVE-2021-45960.patch \
            file://CVE-2021-46143.patch \
            file://CVE-2022-23852.patch \
-	  "
+           file://CVE-2022-23990.patch \
+           "
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
 
-- 
2.35.1



Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBF24C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 09:07:26 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.19860.1644224834864333556
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 01:07:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=gpeTnM+t;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644224846; x=1675760846;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=gzldZOeYdiKcPdLhyQmFvkP69cmOYTn+oaqLpifMGCk=;
  b=gpeTnM+t+oO8LJgRjpD2bvaDrtdGCzak58BAMxDRiwaTXZjm/73uWpNp
   UF59H2jyxjgi2M1u+fA0CMUO+E7o5NhIr1Dq4RLI3seVnUpF4+SC9Yr1C
   I4EHPMWH5DrgRIgemuvKVOosdcfLRdQLKAru/8FJ4RWiGLooL7beYOxDb
   IPhJPsK03q4nkRhhcWF/ayCpl89tDxutebsibK2RT88TAuoLgotxnjjdO
   MBar5FkOJsz75/Qm/UY8LPw6f4N4a8iQsCaZ9JJj33maSWxUGRdeF9oq/
   Cp2w3Cg+B2GfF19YFzYbj/z0pjC72dBtyWQU+ITIZdqdjvJ0R7zMPrsW0
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="309420856"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600";
   d="scan'208";a="309420856"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 01:07:26 -0800
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600";
   d="scan'208";a="499140473"
Received: from xgoh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.138.138])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 01:07:24 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 11/12] expat: fix CVE-2022-23852
Date: Mon,  7 Feb 2022 17:07:01 +0800
Message-Id: 
 <8a50809a0e54c66a8a7aafb1b9bffbec009f8c57.1644224643.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1644224643.git.anuj.mittal@intel.com>
References: <cover.1644224643.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 09:07:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161453

From: Steve Sakoman <steve@sakoman.com>

Expat (aka libexpat) before 2.4.4 has a signed integer overflow in XML_GetBuffer
for configurations with a nonzero XML_CONTEXT_BYTES.

Backport patch from:
https://github.com/libexpat/libexpat/commit/847a645152f5ebc10ac63b74b604d0c1a79fae40

CVE: CVE-2022-23852
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit af81bb9d10c0f1e9dcaffc1bbc18ef780eea7127)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../expat/expat/CVE-2022-23852.patch          | 33 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.2.10.bb       |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2022-23852.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2022-23852.patch b/meta/recipes-core/expat/expat/CVE-2022-23852.patch
new file mode 100644
index 0000000000..41425c108b
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2022-23852.patch
@@ -0,0 +1,33 @@
+From 847a645152f5ebc10ac63b74b604d0c1a79fae40 Mon Sep 17 00:00:00 2001
+From: Samanta Navarro <ferivoz@riseup.net>
+Date: Sat, 22 Jan 2022 17:48:00 +0100
+Subject: [PATCH] lib: Detect and prevent integer overflow in XML_GetBuffer
+ (CVE-2022-23852)
+
+Upstream-Status: Backport:
+https://github.com/libexpat/libexpat/commit/847a645152f5ebc10ac63b74b604d0c1a79fae40
+
+CVE: CVE-2022-23852
+
+Signed-off-by: Steve Sakoman <steve@sakoman.com>
+
+---
+ expat/lib/xmlparse.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index d54af683..5ce31402 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -2067,6 +2067,11 @@ XML_GetBuffer(XML_Parser parser, int len) {
+     keep = (int)EXPAT_SAFE_PTR_DIFF(parser->m_bufferPtr, parser->m_buffer);
+     if (keep > XML_CONTEXT_BYTES)
+       keep = XML_CONTEXT_BYTES;
++    /* Detect and prevent integer overflow */
++    if (keep > INT_MAX - neededSize) {
++      parser->m_errorCode = XML_ERROR_NO_MEMORY;
++      return NULL;
++    }
+     neededSize += keep;
+ #endif /* defined XML_CONTEXT_BYTES */
+     if (neededSize
diff --git a/meta/recipes-core/expat/expat_2.2.10.bb b/meta/recipes-core/expat/expat_2.2.10.bb
index e5415361d8..074441dc2a 100644
--- a/meta/recipes-core/expat/expat_2.2.10.bb
+++ b/meta/recipes-core/expat/expat_2.2.10.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
            file://CVE-2022-22822-27.patch \
            file://CVE-2021-45960.patch \
            file://CVE-2021-46143.patch \
+           file://CVE-2022-23852.patch \
 	  "
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.34.1



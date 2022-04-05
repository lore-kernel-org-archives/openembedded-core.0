Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3BF3C388F3
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:47 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.7190.1649169707422558639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 07:42:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=UXlKZ1e9;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649169734; x=1680705734;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=/xkBxNzK6KjZ7fy1036qX4QCgeF5cA7PW+5ezEB/yQI=;
  b=UXlKZ1e9nhBFtIupD/ihUIeVKS8cjfOrXB5tZgcOwjCZeZqLVrrxQgnK
   yoHeUga/sr2TBZnhfCO9HZD7fZnRdCa/meUNpU5NhkE/Zt5yyCCbCVwN3
   Egdq3XCziJqqt5Hl9U16lEmNOcdEmxvpRf9v45t6uUEqUYmL10ovD+e69
   Ob+f7akgsPeNjtj1HhuFX7BEdRB3EYNEvKez61sQClfB6wqGtuTQynjXw
   S9IWYMYpSZaHroGxQd7TOGFHmuAHgoltk7GcyrCOOUp+hPwXyxKB4KNZN
   PIFIL/R39Wj2zrJrXioTCnh9p9Ik6P2wybJ+v/uAPlcARCVtzsAx/m6Mv
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="258348960"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="258348960"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:42:13 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="696953663"
Received: from ntabdull-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.226.238])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:42:12 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 18/22] libxml2: fix CVE-2022-23308 regression
Date: Tue,  5 Apr 2022 22:41:37 +0800
Message-Id: 
 <b63244b60cedf33f8f39a48436b946005248703e.1649169646.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1649169646.git.anuj.mittal@intel.com>
References: <cover.1649169646.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164036

From: Joe Slater <joe.slater@windriver.com>

The fix for the CVE in 2.9.13 caused a regression which
was addressed after 2.9.13.  We import that patch here.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f7fd194feb4f7993518388160acd5199fcfc3b26)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../CVE-2022-23308-fix-regression.patch       | 99 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.13.bb    |  3 +
 2 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-23308-fix-regression.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2022-23308-fix-regression.patch b/meta/recipes-core/libxml/libxml2/CVE-2022-23308-fix-regression.patch
new file mode 100644
index 0000000000..e188914613
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2022-23308-fix-regression.patch
@@ -0,0 +1,99 @@
+From 646fe48d1c8a74310c409ddf81fe7df6700052af Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Tue, 22 Feb 2022 11:51:08 +0100
+Subject: [PATCH] Fix --without-valid build
+
+Regressed in commit 652dd12a.
+---
+ valid.c | 58 ++++++++++++++++++++++++++++-----------------------------
+ 1 file changed, 29 insertions(+), 29 deletions(-)
+---
+
+From https://github.com/GNOME/libxml2.git
+ commit 646fe48d1c8a74310c409ddf81fe7df6700052af
+
+CVE: CVE-2022-23308
+Upstream-Status: Backport
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+
+diff --git a/valid.c b/valid.c
+index 8e596f1d..9684683a 100644
+--- a/valid.c
++++ b/valid.c
+@@ -479,35 +479,6 @@ nodeVPop(xmlValidCtxtPtr ctxt)
+     return (ret);
+ }
+ 
+-/**
+- * xmlValidNormalizeString:
+- * @str: a string
+- *
+- * Normalize a string in-place.
+- */
+-static void
+-xmlValidNormalizeString(xmlChar *str) {
+-    xmlChar *dst;
+-    const xmlChar *src;
+-
+-    if (str == NULL)
+-        return;
+-    src = str;
+-    dst = str;
+-
+-    while (*src == 0x20) src++;
+-    while (*src != 0) {
+-	if (*src == 0x20) {
+-	    while (*src == 0x20) src++;
+-	    if (*src != 0)
+-		*dst++ = 0x20;
+-	} else {
+-	    *dst++ = *src++;
+-	}
+-    }
+-    *dst = 0;
+-}
+-
+ #ifdef DEBUG_VALID_ALGO
+ static void
+ xmlValidPrintNode(xmlNodePtr cur) {
+@@ -2636,6 +2607,35 @@ xmlDumpNotationTable(xmlBufferPtr buf, xmlNotationTablePtr table) {
+ 	    (xmlDictOwns(dict, (const xmlChar *)(str)) == 0)))	\
+ 	    xmlFree((char *)(str));
+ 
++/**
++ * xmlValidNormalizeString:
++ * @str: a string
++ *
++ * Normalize a string in-place.
++ */
++static void
++xmlValidNormalizeString(xmlChar *str) {
++    xmlChar *dst;
++    const xmlChar *src;
++
++    if (str == NULL)
++        return;
++    src = str;
++    dst = str;
++
++    while (*src == 0x20) src++;
++    while (*src != 0) {
++	if (*src == 0x20) {
++	    while (*src == 0x20) src++;
++	    if (*src != 0)
++		*dst++ = 0x20;
++	} else {
++	    *dst++ = *src++;
++	}
++    }
++    *dst = 0;
++}
++
+ static int
+ xmlIsStreaming(xmlValidCtxtPtr ctxt) {
+     xmlParserCtxtPtr pctxt;
+-- 
+2.35.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.13.bb b/meta/recipes-core/libxml/libxml2_2.9.13.bb
index be59aba84b..e361b53bfd 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.13.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.13.bb
@@ -23,6 +23,9 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=${BP};name=te
            file://remove-fuzz-from-ptests.patch \
            file://libxml-m4-use-pkgconfig.patch \
            "
+# will be in v2.9.14
+#
+SRC_URI += "file://CVE-2022-23308-fix-regression.patch"
 
 SRC_URI[archive.sha256sum] = "276130602d12fe484ecc03447ee5e759d0465558fbc9d6bd144e3745306ebf0e"
 SRC_URI[testtar.sha256sum] = "96151685cec997e1f9f3387e3626d61e6284d4d6e66e0e440c209286c03e9cc7"
-- 
2.35.1



Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web09.6238.1622800467311052845
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 02:54:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: U3efd/+6+FKWRN/9MxYqh/YRZYT9pzPLzbGXiIwl90REKeCA5JIeKcfcpZQEAbd3fqeHSTu7U9
 7vq0gs27N+Dw==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="204289026"
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; 
   d="scan'208";a="204289026"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2021 02:54:26 -0700
IronPort-SDR: ugsWXDp5cguiB+bgmJwXDTeJyV5PPde87BfT7ox548Um555Ds6D0Ob9Aw0fOp7nSun0NhrU/Hk
 ztV9XK5yJL+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; 
   d="scan'208";a="550479767"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by orsmga004.jf.intel.com with ESMTP; 04 Jun 2021 02:54:25 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell 1/2] libxml: fix CVE-2021-3517 CVE-2021-3537
Date: Fri,  4 Jun 2021 17:54:23 +0800
Message-Id: <20210604095424.76470-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../libxml/libxml2/CVE-2021-3517.patch        | 53 +++++++++++++++++++
 .../libxml/libxml2/CVE-2021-3537.patch        | 50 +++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |  2 +
 3 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2021-3517.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2021-3537.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2021-3517.patch b/meta/recipes-core/libxml/libxml2/CVE-2021-3517.patch
new file mode 100644
index 0000000000..e88a8ae7c6
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2021-3517.patch
@@ -0,0 +1,53 @@
+From bf22713507fe1fc3a2c4b525cf0a88c2dc87a3a2 Mon Sep 17 00:00:00 2001
+From: Joel Hockey <joel.hockey@gmail.com>
+Date: Sun, 16 Aug 2020 17:19:35 -0700
+Subject: [PATCH] Validate UTF8 in xmlEncodeEntities
+
+Code is currently assuming UTF-8 without validating. Truncated UTF-8
+input can cause out-of-bounds array access.
+
+Adds further checks to partial fix in 50f06b3e.
+
+Fixes #178
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/bf22713507fe1fc3a2c4b525cf0a88c2dc87a3a2]
+CVE: CVE-2021-3517
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ entities.c | 16 +++++++++++++++-
+ 1 file changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/entities.c b/entities.c
+index 37b99a56..1a8f86f0 100644
+--- a/entities.c
++++ b/entities.c
+@@ -704,11 +704,25 @@ xmlEncodeEntitiesInternal(xmlDocPtr doc, const xmlChar *input, int attr) {
+ 	    } else {
+ 		/*
+ 		 * We assume we have UTF-8 input.
++		 * It must match either:
++		 *   110xxxxx 10xxxxxx
++		 *   1110xxxx 10xxxxxx 10xxxxxx
++		 *   11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
++		 * That is:
++		 *   cur[0] is 11xxxxxx
++		 *   cur[1] is 10xxxxxx
++		 *   cur[2] is 10xxxxxx if cur[0] is 111xxxxx
++		 *   cur[3] is 10xxxxxx if cur[0] is 1111xxxx
++		 *   cur[0] is not 11111xxx
+ 		 */
+ 		char buf[11], *ptr;
+ 		int val = 0, l = 1;
+ 
+-		if (*cur < 0xC0) {
++		if (((cur[0] & 0xC0) != 0xC0) ||
++		    ((cur[1] & 0xC0) != 0x80) ||
++		    (((cur[0] & 0xE0) == 0xE0) && ((cur[2] & 0xC0) != 0x80)) ||
++		    (((cur[0] & 0xF0) == 0xF0) && ((cur[3] & 0xC0) != 0x80)) ||
++		    (((cur[0] & 0xF8) == 0xF8))) {
+ 		    xmlEntitiesErr(XML_CHECK_NOT_UTF8,
+ 			    "xmlEncodeEntities: input not UTF-8");
+ 		    if (doc != NULL)
+-- 
+GitLab
+
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2021-3537.patch b/meta/recipes-core/libxml/libxml2/CVE-2021-3537.patch
new file mode 100644
index 0000000000..9e64c2a36d
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2021-3537.patch
@@ -0,0 +1,50 @@
+From babe75030c7f64a37826bb3342317134568bef61 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Sat, 1 May 2021 16:53:33 +0200
+Subject: [PATCH] Propagate error in xmlParseElementChildrenContentDeclPriv
+
+Check return value of recursive calls to
+xmlParseElementChildrenContentDeclPriv and return immediately in case
+of errors. Otherwise, struct xmlElementContent could contain unexpected
+null pointers, leading to a null deref when post-validating documents
+which aren't well-formed and parsed in recovery mode.
+
+Fixes #243.
+
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libxml2/-/commit/babe75030c7f64a37826bb3342317134568bef61]
+CVE: CVE-2021-3537
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ parser.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/parser.c b/parser.c
+index b42e6043..73c27edd 100644
+--- a/parser.c
++++ b/parser.c
+@@ -6208,6 +6208,8 @@ xmlParseElementChildrenContentDeclPriv(xmlParserCtxtPtr ctxt, int inputchk,
+ 	SKIP_BLANKS;
+         cur = ret = xmlParseElementChildrenContentDeclPriv(ctxt, inputid,
+                                                            depth + 1);
++        if (cur == NULL)
++            return(NULL);
+ 	SKIP_BLANKS;
+ 	GROW;
+     } else {
+@@ -6341,6 +6343,11 @@ xmlParseElementChildrenContentDeclPriv(xmlParserCtxtPtr ctxt, int inputchk,
+ 	    SKIP_BLANKS;
+ 	    last = xmlParseElementChildrenContentDeclPriv(ctxt, inputid,
+                                                           depth + 1);
++            if (last == NULL) {
++		if (ret != NULL)
++		    xmlFreeDocElementContent(ctxt->myDoc, ret);
++		return(NULL);
++            }
+ 	    SKIP_BLANKS;
+ 	} else {
+ 	    elem = xmlParseName(ctxt);
+-- 
+GitLab
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index 4ebfb9e556..d3aa32b7aa 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -23,6 +23,8 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://CVE-2020-7595.patch \
            file://CVE-2019-20388.patch \
            file://CVE-2020-24977.patch \
+           file://CVE-2021-3517.patch \
+           file://CVE-2021-3537.patch \
            "
 
 SRC_URI[libtar.md5sum] = "10942a1dc23137a8aa07f0639cbfece5"
-- 
2.17.1


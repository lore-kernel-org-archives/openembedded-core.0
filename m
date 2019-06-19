Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 175447E6B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 17:54:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45TXdf5rPTz4s
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 19:54:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1560966870;
	bh=89AqlGs7NcFyB7eBeh+3aCj5B5gWRxvvUb5TeOfdP3Y=;
	h=From:To:Subject:Date:From;
	b=epkulm07PSjF9U0kP66HMCcCKiMm6+Q91cGKNOo5FvYLggkiu4tq6YjycKa9v+Pie
	bxbzDJsUNRj6cV0oMtyls47evLvKBCEPdc/nh4+hjmKKaT0w4S6VQtlFg2UAaFNQcU
	EsDB9jguZNezwboAYah0eU7fZEjV2rwr0MUD4yGxOOtbIWt4t9BT4lK7akhOn/EnON
	cLaHsHBNGmjr6FQnldPasvrhbATU6yj/hSsxcBIahQwyj3zmMGcaaOrDcq0DrZfbXH
	14G47jzwWvXdD7yvOApo2BAt+iHaTZxkbAh6voZj27kzsknVXnwjwqfNS6d4rrsIji
	y5YNSBUzoPDbATkPZCWKsIaKMjDVrO2x28ZW7eIukPJCV8+zFivykBG/eeGbc2Q4hT
	5hDbgVI1cwxQQDp9WIOVkK/ir0eGZfaXkUNhydRkqF3prh5iZZoxu1OsWx13sYYSOu
	e8p9+zp6im1gs0ermvA0i58r4vYWknd7XAKzj5/+by3RIshsHoPLVU015I3AFK/GQp
	KI3XWWlWXt8lGWvaxn744k3rReM3IlZy9wzxqpH/4NgOzpfLYzmNSuLOR6jb+uA86l
	Z47wIK70zKgZhc6qERI0nEF8xrLLkFGpyFMV/bdUlmtxeiKFN0otwTNqVu+ZMSzMXw
	NJNiF+I7qkZkQv9IqzSvvlEw=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2019 20:54:29 +0300
Message-Id: <20190619175429.22836-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] libxslt: Fix CVE-2019-11068
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Jun 2019 17:54:30 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../0001-Fix-security-framework-bypass.patch  | 124 ++++++++++++++++++
 .../recipes-support/libxslt/libxslt_1.1.33.bb |   4 +-
 2 files changed, 127 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libxslt/files/0001-Fix-security-framework-bypass.patch

diff --git a/meta/recipes-support/libxslt/files/0001-Fix-security-framework-bypass.patch b/meta/recipes-support/libxslt/files/0001-Fix-security-framework-bypass.patch
new file mode 100644
index 0000000000..89b647ddbf
--- /dev/null
+++ b/meta/recipes-support/libxslt/files/0001-Fix-security-framework-bypass.patch
@@ -0,0 +1,124 @@
+From e03553605b45c88f0b4b2980adfbbb8f6fca2fd6 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Sun, 24 Mar 2019 09:51:39 +0100
+Subject: Fix security framework bypass
+
+xsltCheckRead and xsltCheckWrite return -1 in case of error but callers
+don't check for this condition and allow access. With a specially
+crafted URL, xsltCheckRead could be tricked into returning an error
+because of a supposedly invalid URL that would still be loaded
+succesfully later on.
+
+Fixes #12.
+
+Thanks to Felix Wilhelm for the report.
+
+Signed-off-by: Adrian Bunk <bunk@stusta.de>
+Upstream-Status: Backport
+CVE: CVE-2019-11068
+---
+ libxslt/documents.c | 18 ++++++++++--------
+ libxslt/imports.c   |  9 +++++----
+ libxslt/transform.c |  9 +++++----
+ libxslt/xslt.c      |  9 +++++----
+ 4 files changed, 25 insertions(+), 20 deletions(-)
+
+diff --git a/libxslt/documents.c b/libxslt/documents.c
+index 3f3a7312..4aad11bb 100644
+--- a/libxslt/documents.c
++++ b/libxslt/documents.c
+@@ -296,10 +296,11 @@ xsltLoadDocument(xsltTransformContextPtr ctxt, const xmlChar *URI) {
+ 	int res;
+ 
+ 	res = xsltCheckRead(ctxt->sec, ctxt, URI);
+-	if (res == 0) {
+-	    xsltTransformError(ctxt, NULL, NULL,
+-		 "xsltLoadDocument: read rights for %s denied\n",
+-			     URI);
++	if (res <= 0) {
++            if (res == 0)
++                xsltTransformError(ctxt, NULL, NULL,
++                     "xsltLoadDocument: read rights for %s denied\n",
++                                 URI);
+ 	    return(NULL);
+ 	}
+     }
+@@ -372,10 +373,11 @@ xsltLoadStyleDocument(xsltStylesheetPtr style, const xmlChar *URI) {
+ 	int res;
+ 
+ 	res = xsltCheckRead(sec, NULL, URI);
+-	if (res == 0) {
+-	    xsltTransformError(NULL, NULL, NULL,
+-		 "xsltLoadStyleDocument: read rights for %s denied\n",
+-			     URI);
++	if (res <= 0) {
++            if (res == 0)
++                xsltTransformError(NULL, NULL, NULL,
++                     "xsltLoadStyleDocument: read rights for %s denied\n",
++                                 URI);
+ 	    return(NULL);
+ 	}
+     }
+diff --git a/libxslt/imports.c b/libxslt/imports.c
+index 874870cc..3783b247 100644
+--- a/libxslt/imports.c
++++ b/libxslt/imports.c
+@@ -130,10 +130,11 @@ xsltParseStylesheetImport(xsltStylesheetPtr style, xmlNodePtr cur) {
+ 	int secres;
+ 
+ 	secres = xsltCheckRead(sec, NULL, URI);
+-	if (secres == 0) {
+-	    xsltTransformError(NULL, NULL, NULL,
+-		 "xsl:import: read rights for %s denied\n",
+-			     URI);
++	if (secres <= 0) {
++            if (secres == 0)
++                xsltTransformError(NULL, NULL, NULL,
++                     "xsl:import: read rights for %s denied\n",
++                                 URI);
+ 	    goto error;
+ 	}
+     }
+diff --git a/libxslt/transform.c b/libxslt/transform.c
+index 13793914..0636dbd0 100644
+--- a/libxslt/transform.c
++++ b/libxslt/transform.c
+@@ -3493,10 +3493,11 @@ xsltDocumentElem(xsltTransformContextPtr ctxt, xmlNodePtr node,
+      */
+     if (ctxt->sec != NULL) {
+ 	ret = xsltCheckWrite(ctxt->sec, ctxt, filename);
+-	if (ret == 0) {
+-	    xsltTransformError(ctxt, NULL, inst,
+-		 "xsltDocumentElem: write rights for %s denied\n",
+-			     filename);
++	if (ret <= 0) {
++            if (ret == 0)
++                xsltTransformError(ctxt, NULL, inst,
++                     "xsltDocumentElem: write rights for %s denied\n",
++                                 filename);
+ 	    xmlFree(URL);
+ 	    xmlFree(filename);
+ 	    return;
+diff --git a/libxslt/xslt.c b/libxslt/xslt.c
+index 780a5ad7..a234eb79 100644
+--- a/libxslt/xslt.c
++++ b/libxslt/xslt.c
+@@ -6763,10 +6763,11 @@ xsltParseStylesheetFile(const xmlChar* filename) {
+ 	int res;
+ 
+ 	res = xsltCheckRead(sec, NULL, filename);
+-	if (res == 0) {
+-	    xsltTransformError(NULL, NULL, NULL,
+-		 "xsltParseStylesheetFile: read rights for %s denied\n",
+-			     filename);
++	if (res <= 0) {
++            if (res == 0)
++                xsltTransformError(NULL, NULL, NULL,
++                     "xsltParseStylesheetFile: read rights for %s denied\n",
++                                 filename);
+ 	    return(NULL);
+ 	}
+     }
+-- 
+2.20.1
+
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.33.bb b/meta/recipes-support/libxslt/libxslt_1.1.33.bb
index 462eccf52f..6320a821dc 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.33.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.33.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=0cd9a07afbeb24026c9b03aecfeba458"
 SECTION = "libs"
 DEPENDS = "libxml2"
 
-SRC_URI = "http://xmlsoft.org/sources/libxslt-${PV}.tar.gz"
+SRC_URI = "http://xmlsoft.org/sources/libxslt-${PV}.tar.gz \
+           file://0001-Fix-security-framework-bypass.patch \
+"
 
 SRC_URI[md5sum] = "b3bd254a03e46d58f8ad1e4559cd2c2f"
 SRC_URI[sha256sum] = "8e36605144409df979cab43d835002f63988f3dc94d5d3537c12796db90e38c8"
-- 
2.17.1



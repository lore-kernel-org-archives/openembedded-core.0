Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 9A0A7745CB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 10:59:53 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w4GAxrtg000552
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 12:59:53 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.57.90])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id w4GAxrSs012037;
	Wed, 16 May 2018 12:59:53 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id CB27991F4F7;
	Wed, 16 May 2018 12:59:52 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 May 2018 12:59:22 +0200
Message-Id: <20180516105922.22483-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libxslt: Fix handling of RVTs returned from nested EXSLT functions
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
X-List-Received-Date: Wed, 16 May 2018 10:59:54 -0000

Set the context variable to NULL when evaluating EXSLT functions.
Fixes potential use-after-free errors or memory leaks.

Fixes bug 792580

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../libxslt/libxslt/fix-rvts-handling.patch        | 80 ++++++++++++++++++++++
 meta/recipes-support/libxslt/libxslt_1.1.32.bb     |  5 +-
 2 files changed, 84 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libxslt/libxslt/fix-rvts-handling.patch

diff --git a/meta/recipes-support/libxslt/libxslt/fix-rvts-handling.patch b/meta/recipes-support/libxslt/libxslt/fix-rvts-handling.patch
new file mode 100644
index 0000000000..424c976d9b
--- /dev/null
+++ b/meta/recipes-support/libxslt/libxslt/fix-rvts-handling.patch
@@ -0,0 +1,80 @@
+libxslt-1.1.32: Fix handling of RVTs returned from nested EXSLT functions
+
+[No upstream tracking] -- https://bugzilla.gnome.org/show_bug.cgi?id=792580
+
+Set the context variable to NULL when evaluating EXSLT functions.
+Fixes potential use-after-free errors or memory leaks.
+
+Upstream-Status: Backport [https://git.gnome.org/browse/libxslt/commit/?id=8bd32f7753ac253a54279a0b6a88d15a57076bb0]
+bug: 792580
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+
+diff --git a/libexslt/functions.c b/libexslt/functions.c
+index dc794e3..8511cb0 100644
+--- a/libexslt/functions.c
++++ b/libexslt/functions.c
+@@ -280,6 +280,7 @@ exsltFuncFunctionFunction (xmlXPathParserContextPtr ctxt, int nargs) {
+     exsltFuncFunctionData *func;
+     xmlNodePtr paramNode, oldInsert, fake;
+     int oldBase;
++    void *oldCtxtVar;
+     xsltStackElemPtr params = NULL, param;
+     xsltTransformContextPtr tctxt = xsltXPathGetTransformContext(ctxt);
+     int i, notSet;
+@@ -418,11 +419,14 @@ exsltFuncFunctionFunction (xmlXPathParserContextPtr ctxt, int nargs) {
+     fake = xmlNewDocNode(tctxt->output, NULL,
+ 			 (const xmlChar *)"fake", NULL);
+     oldInsert = tctxt->insert;
++    oldCtxtVar = tctxt->contextVariable;
+     tctxt->insert = fake;
++    tctxt->contextVariable = NULL;
+     xsltApplyOneTemplate (tctxt, tctxt->node,
+ 			  func->content, NULL, NULL);
+     xsltLocalVariablePop(tctxt, tctxt->varsBase, -2);
+     tctxt->insert = oldInsert;
++    tctxt->contextVariable = oldCtxtVar;
+     tctxt->varsBase = oldBase;	/* restore original scope */
+     if (params != NULL)
+ 	xsltFreeStackElemList(params);
+diff --git a/tests/docs/bug-209.xml b/tests/docs/bug-209.xml
+new file mode 100644
+index 0000000..69d62f2
+--- /dev/null
++++ b/tests/docs/bug-209.xml
+@@ -0,0 +1 @@
++<doc/>
+diff --git a/tests/general/bug-209.out b/tests/general/bug-209.out
+new file mode 100644
+index 0000000..e829790
+--- /dev/null
++++ b/tests/general/bug-209.out
+@@ -0,0 +1,2 @@
++<?xml version="1.0"?>
++<result/>
+diff --git a/tests/general/bug-209.xsl b/tests/general/bug-209.xsl
+new file mode 100644
+index 0000000..fe69ac6
+--- /dev/null
++++ b/tests/general/bug-209.xsl
+@@ -0,0 +1,21 @@
++<xsl:stylesheet
++    version="1.0"
++    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
++    xmlns:func="http://exslt.org/functions"
++    extension-element-prefixes="func">
++
++    <xsl:template match="/">
++        <xsl:variable name="v" select="func:a()" />
++        <xsl:copy-of select="$v"/>
++    </xsl:template>
++
++    <func:function name="func:a">
++        <func:result select="func:b()" />
++    </func:function>
++
++    <func:function name="func:b">
++        <func:result>
++            <result/>
++        </func:result>
++    </func:function>
++</xsl:stylesheet>
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.32.bb b/meta/recipes-support/libxslt/libxslt_1.1.32.bb
index 6a03f77699..f0fa5e723f 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.32.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.32.bb
@@ -8,7 +8,10 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=0cd9a07afbeb24026c9b03aecfeba458"
 SECTION = "libs"
 DEPENDS = "libxml2"
 
-SRC_URI = "http://xmlsoft.org/sources/libxslt-${PV}.tar.gz"
+SRC_URI = "http://xmlsoft.org/sources/libxslt-${PV}.tar.gz \
+           file://fix-rvts-handling.patch \
+           "
+
 SRC_URI[md5sum] = "1fc72f98e98bf4443f1651165f3aa146"
 SRC_URI[sha256sum] = "526ecd0abaf4a7789041622c3950c0e7f2c4c8835471515fd77eec684a355460"
 
-- 
2.11.0



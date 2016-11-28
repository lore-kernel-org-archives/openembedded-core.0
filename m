Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CD098719C7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 09:55:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uAS9tu19009384
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 01:55:56 -0800
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Mon, 28 Nov 2016 01:55:55 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Nov 2016 17:55:40 +0800
Message-ID: <1480326940-7571-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [PATCH] libxml2: Security fix CVE-2016-5131
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
X-List-Received-Date: Mon, 28 Nov 2016 09:55:58 -0000
Content-Type: text/plain

CVE-2016-5131 libxml2: Use-after-free vulnerability in libxml2 through
2.9.4, as used in Google Chrome before 52.0.2743.82, allows remote
attackers to cause a denial of service or possibly have unspecified
other impact via vectors related to the XPointer range-to function.

External References:
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5131

Patch from:
https://git.gnome.org/browse/libxml2/commit/?id=9ab01a277d71f54d3143c2cf333c5c2e9aaedd9e

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libxml/libxml2/libxml2-CVE-2016-5131.patch     | 180 +++++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.4.bb          |   1 +
 2 files changed, 181 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2016-5131.patch

diff --git a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2016-5131.patch b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2016-5131.patch
new file mode 100644
index 0000000..9d47d02
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2016-5131.patch
@@ -0,0 +1,180 @@
+From 9ab01a277d71f54d3143c2cf333c5c2e9aaedd9e Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Tue, 28 Jun 2016 14:22:23 +0200
+Subject: [PATCH] Fix XPointer paths beginning with range-to
+
+The old code would invoke the broken xmlXPtrRangeToFunction. range-to
+isn't really a function but a special kind of location step. Remove
+this function and always handle range-to in the XPath code.
+
+The old xmlXPtrRangeToFunction could also be abused to trigger a
+use-after-free error with the potential for remote code execution.
+
+Found with afl-fuzz.
+
+Fixes CVE-2016-5131.
+
+CVE: CVE-2016-5131
+Upstream-Status: Backport
+https://git.gnome.org/browse/libxml2/commit/?id=9ab01a277d71f54d3143c2cf333c5c2e9aaedd9e
+
+Signed-off-by: Yi Zhao <yi.zhao@windirver.com>
+---
+ result/XPath/xptr/vidbase | 13 ++++++++
+ test/XPath/xptr/vidbase   |  1 +
+ xpath.c                   |  7 ++++-
+ xpointer.c                | 76 ++++-------------------------------------------
+ 4 files changed, 26 insertions(+), 71 deletions(-)
+
+diff --git a/result/XPath/xptr/vidbase b/result/XPath/xptr/vidbase
+index 8b9e92d..f19193e 100644
+--- a/result/XPath/xptr/vidbase
++++ b/result/XPath/xptr/vidbase
+@@ -17,3 +17,16 @@ Object is a Location Set:
+   To node
+     ELEMENT p
+ 
++
++========================
++Expression: xpointer(range-to(id('chapter2')))
++Object is a Location Set:
++1 :   Object is a range :
++  From node
++     /
++  To node
++    ELEMENT chapter
++      ATTRIBUTE id
++        TEXT
++          content=chapter2
++
+diff --git a/test/XPath/xptr/vidbase b/test/XPath/xptr/vidbase
+index b146383..884b106 100644
+--- a/test/XPath/xptr/vidbase
++++ b/test/XPath/xptr/vidbase
+@@ -1,2 +1,3 @@
+ xpointer(id('chapter1')/p)
+ xpointer(id('chapter1')/p[1]/range-to(following-sibling::p[2]))
++xpointer(range-to(id('chapter2')))
+diff --git a/xpath.c b/xpath.c
+index d992841..5a01b1b 100644
+--- a/xpath.c
++++ b/xpath.c
+@@ -10691,13 +10691,18 @@ xmlXPathCompPathExpr(xmlXPathParserContextPtr ctxt) {
+ 		    lc = 1;
+ 		    break;
+ 		} else if ((NXT(len) == '(')) {
+-		    /* Note Type or Function */
++		    /* Node Type or Function */
+ 		    if (xmlXPathIsNodeType(name)) {
+ #ifdef DEBUG_STEP
+ 		        xmlGenericError(xmlGenericErrorContext,
+ 				"PathExpr: Type search\n");
+ #endif
+ 			lc = 1;
++#ifdef LIBXML_XPTR_ENABLED
++                    } else if (ctxt->xptr &&
++                               xmlStrEqual(name, BAD_CAST "range-to")) {
++                        lc = 1;
++#endif
+ 		    } else {
+ #ifdef DEBUG_STEP
+ 		        xmlGenericError(xmlGenericErrorContext,
+diff --git a/xpointer.c b/xpointer.c
+index 676c510..d74174a 100644
+--- a/xpointer.c
++++ b/xpointer.c
+@@ -1332,8 +1332,6 @@ xmlXPtrNewContext(xmlDocPtr doc, xmlNodePtr here, xmlNodePtr origin) {
+     ret->here = here;
+     ret->origin = origin;
+ 
+-    xmlXPathRegisterFunc(ret, (xmlChar *)"range-to",
+-	                 xmlXPtrRangeToFunction);
+     xmlXPathRegisterFunc(ret, (xmlChar *)"range",
+ 	                 xmlXPtrRangeFunction);
+     xmlXPathRegisterFunc(ret, (xmlChar *)"range-inside",
+@@ -2243,76 +2241,14 @@ xmlXPtrRangeInsideFunction(xmlXPathParserContextPtr ctxt, int nargs) {
+  * @nargs:  the number of args
+  *
+  * Implement the range-to() XPointer function
++ *
++ * Obsolete. range-to is not a real function but a special type of location
++ * step which is handled in xpath.c.
+  */
+ void
+-xmlXPtrRangeToFunction(xmlXPathParserContextPtr ctxt, int nargs) {
+-    xmlXPathObjectPtr range;
+-    const xmlChar *cur;
+-    xmlXPathObjectPtr res, obj;
+-    xmlXPathObjectPtr tmp;
+-    xmlLocationSetPtr newset = NULL;
+-    xmlNodeSetPtr oldset;
+-    int i;
+-
+-    if (ctxt == NULL) return;
+-    CHECK_ARITY(1);
+-    /*
+-     * Save the expression pointer since we will have to evaluate
+-     * it multiple times. Initialize the new set.
+-     */
+-    CHECK_TYPE(XPATH_NODESET);
+-    obj = valuePop(ctxt);
+-    oldset = obj->nodesetval;
+-    ctxt->context->node = NULL;
+-
+-    cur = ctxt->cur;
+-    newset = xmlXPtrLocationSetCreate(NULL);
+-
+-    for (i = 0; i < oldset->nodeNr; i++) {
+-	ctxt->cur = cur;
+-
+-	/*
+-	 * Run the evaluation with a node list made of a single item
+-	 * in the nodeset.
+-	 */
+-	ctxt->context->node = oldset->nodeTab[i];
+-	tmp = xmlXPathNewNodeSet(ctxt->context->node);
+-	valuePush(ctxt, tmp);
+-
+-	xmlXPathEvalExpr(ctxt);
+-	CHECK_ERROR;
+-
+-	/*
+-	 * The result of the evaluation need to be tested to
+-	 * decided whether the filter succeeded or not
+-	 */
+-	res = valuePop(ctxt);
+-	range = xmlXPtrNewRangeNodeObject(oldset->nodeTab[i], res);
+-	if (range != NULL) {
+-	    xmlXPtrLocationSetAdd(newset, range);
+-	}
+-
+-	/*
+-	 * Cleanup
+-	 */
+-	if (res != NULL)
+-	    xmlXPathFreeObject(res);
+-	if (ctxt->value == tmp) {
+-	    res = valuePop(ctxt);
+-	    xmlXPathFreeObject(res);
+-	}
+-
+-	ctxt->context->node = NULL;
+-    }
+-
+-    /*
+-     * The result is used as the new evaluation set.
+-     */
+-    xmlXPathFreeObject(obj);
+-    ctxt->context->node = NULL;
+-    ctxt->context->contextSize = -1;
+-    ctxt->context->proximityPosition = -1;
+-    valuePush(ctxt, xmlXPtrWrapLocationSet(newset));
++xmlXPtrRangeToFunction(xmlXPathParserContextPtr ctxt,
++                       int nargs ATTRIBUTE_UNUSED) {
++    XP_ERROR(XPATH_EXPR_ERROR);
+ }
+ 
+ /**
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.4.bb b/meta/recipes-core/libxml/libxml2_2.9.4.bb
index 59874be..1fed90b 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.4.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.4.bb
@@ -19,6 +19,7 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://run-ptest \
            file://python-sitepackages-dir.patch \
            file://libxml-m4-use-pkgconfig.patch \
+           file://libxml2-CVE-2016-5131.patch \
           "
 
 SRC_URI[libtar.md5sum] = "ae249165c173b1ff386ee8ad676815f5"
-- 
2.7.4



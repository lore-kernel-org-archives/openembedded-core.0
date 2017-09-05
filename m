Return-Path: <andrej.valek@siemens.com>
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id 96E716B6EA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 06:36:28 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id v856aTEt002398
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Sep 2017 08:36:29 +0200
Received: from dev.sbt.siemens.com ([163.242.56.100])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v856aS86027700;
	Tue, 5 Sep 2017 08:36:28 +0200
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id 23CE8510363;
	Tue,  5 Sep 2017 08:36:28 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Sep 2017 08:35:53 +0200
Message-Id: <1504593353-7409-1-git-send-email-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] libxml2: 2.9.4 -> 2.9.5
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
X-List-Received-Date: Tue, 05 Sep 2017 06:36:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../libxml/libxml2/libxml-m4-use-pkgconfig.patch   |   2 +-
 .../libxml/libxml2/libxml2-CVE-2016-4658.patch     | 269 ----------
 .../libxml/libxml2/libxml2-CVE-2016-5131.patch     | 180 -------
 .../libxml/libxml2/libxml2-CVE-2017-0663.patch     |  40 --
 .../libxml/libxml2/libxml2-CVE-2017-5969.patch     |  62 ---
 .../libxml/libxml2/libxml2-CVE-2017-8872.patch     |  37 --
 .../libxml2-CVE-2017-9047_CVE-2017-9048.patch      | 103 ----
 .../libxml2-CVE-2017-9049_CVE-2017-9050.patch      | 291 ----------
 .../libxml2/libxml2-fix_NULL_pointer_derefs.patch  |  45 --
 ...ibxml2-fix_and_simplify_xmlParseStartTag2.patch | 590 ---------------------
 .../libxml2/libxml2-fix_node_comparison.patch      |  67 ---
 meta/recipes-core/libxml/libxml2/runtest.patch     |  32 +-
 .../libxml/{libxml2_2.9.4.bb => libxml2_2.9.5.bb}  |  14 +-
 13 files changed, 10 insertions(+), 1722 deletions(-)
 delete mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2016-4658.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2016-5131.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-0663.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-5969.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-8872.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-9047_CVE-2017-9048.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-9049_CVE-2017-9050.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/libxml2-fix_NULL_pointer_derefs.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/libxml2-fix_and_simplify_xmlParseStartTag2.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/libxml2-fix_node_comparison.patch
 rename meta/recipes-core/libxml/{libxml2_2.9.4.bb => libxml2_2.9.5.bb} (85%)

diff --git a/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch b/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
index 3277165..d9ed151 100644
--- a/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
+++ b/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
@@ -183,7 +183,7 @@ index 68cd824..5fa0a9b 100644
 -          echo "*** If you have an old version installed, it is best to remove it, although"
 -          echo "*** you may also be able to get things to work by modifying LD_LIBRARY_PATH" ],
 -        [ echo "*** The test program failed to compile or link. See the file config.log for the"
--          echo "*** exact error that occured. This usually means LIBXML was incorrectly installed"
+-          echo "*** exact error that occurred. This usually means LIBXML was incorrectly installed"
 -          echo "*** or that you have moved LIBXML since it was installed. In the latter case, you"
 -          echo "*** may want to edit the xml2-config script: $XML2_CONFIG" ])
 -          CPPFLAGS="$ac_save_CPPFLAGS"
diff --git a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2016-4658.patch b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2016-4658.patch
deleted file mode 100644
index bb55eed..0000000
--- a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2016-4658.patch
+++ /dev/null
@@ -1,269 +0,0 @@
-libxml2-2.9.4: Fix CVE-2016-4658
-
-[No upstream tracking] -- https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2016-4658
-
-xpointer: Disallow namespace nodes in XPointer points and ranges
-
-Namespace nodes must be copied to avoid use-after-free errors.
-But they don't necessarily have a physical representation in a
-document, so simply disallow them in XPointer ranges.
-
-Upstream-Status: Backport
- - [https://git.gnome.org/browse/libxml2/commit/?id=c1d1f7121194036608bf555f08d3062a36fd344b]
- - [https://git.gnome.org/browse/libxml2/commit/?id=3f8a91036d338e51c059d54397a42d645f019c65]
-CVE: CVE-2016-4658
-Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
-
-diff --git a/xpointer.c b/xpointer.c
-index 676c510..911680d 100644
---- a/xpointer.c
-+++ b/xpointer.c
-@@ -320,6 +320,45 @@ xmlXPtrRangesEqual(xmlXPathObjectPtr range1, xmlXPathObjectPtr range2) {
- }
- 
- /**
-+ * xmlXPtrNewRangeInternal:
-+ * @start:  the starting node
-+ * @startindex:  the start index
-+ * @end:  the ending point
-+ * @endindex:  the ending index
-+ *
-+ * Internal function to create a new xmlXPathObjectPtr of type range
-+ *
-+ * Returns the newly created object.
-+ */
-+static xmlXPathObjectPtr
-+xmlXPtrNewRangeInternal(xmlNodePtr start, int startindex,
-+                        xmlNodePtr end, int endindex) {
-+    xmlXPathObjectPtr ret;
-+
-+    /*
-+     * Namespace nodes must be copied (see xmlXPathNodeSetDupNs).
-+     * Disallow them for now.
-+     */
-+    if ((start != NULL) && (start->type == XML_NAMESPACE_DECL))
-+	return(NULL);
-+    if ((end != NULL) && (end->type == XML_NAMESPACE_DECL))
-+	return(NULL);
-+
-+    ret = (xmlXPathObjectPtr) xmlMalloc(sizeof(xmlXPathObject));
-+    if (ret == NULL) {
-+        xmlXPtrErrMemory("allocating range");
-+	return(NULL);
-+    }
-+    memset(ret, 0, sizeof(xmlXPathObject));
-+    ret->type = XPATH_RANGE;
-+    ret->user = start;
-+    ret->index = startindex;
-+    ret->user2 = end;
-+    ret->index2 = endindex;
-+    return(ret);
-+}
-+
-+/**
-  * xmlXPtrNewRange:
-  * @start:  the starting node
-  * @startindex:  the start index
-@@ -344,17 +383,7 @@ xmlXPtrNewRange(xmlNodePtr start, int startindex,
-     if (endindex < 0)
- 	return(NULL);
- 
--    ret = (xmlXPathObjectPtr) xmlMalloc(sizeof(xmlXPathObject));
--    if (ret == NULL) {
--        xmlXPtrErrMemory("allocating range");
--	return(NULL);
--    }
--    memset(ret, 0 , (size_t) sizeof(xmlXPathObject));
--    ret->type = XPATH_RANGE;
--    ret->user = start;
--    ret->index = startindex;
--    ret->user2 = end;
--    ret->index2 = endindex;
-+    ret = xmlXPtrNewRangeInternal(start, startindex, end, endindex);
-     xmlXPtrRangeCheckOrder(ret);
-     return(ret);
- }
-@@ -381,17 +410,8 @@ xmlXPtrNewRangePoints(xmlXPathObjectPtr start, xmlXPathObjectPtr end) {
-     if (end->type != XPATH_POINT)
- 	return(NULL);
- 
--    ret = (xmlXPathObjectPtr) xmlMalloc(sizeof(xmlXPathObject));
--    if (ret == NULL) {
--        xmlXPtrErrMemory("allocating range");
--	return(NULL);
--    }
--    memset(ret, 0 , (size_t) sizeof(xmlXPathObject));
--    ret->type = XPATH_RANGE;
--    ret->user = start->user;
--    ret->index = start->index;
--    ret->user2 = end->user;
--    ret->index2 = end->index;
-+    ret = xmlXPtrNewRangeInternal(start->user, start->index, end->user,
-+				  end->index);
-     xmlXPtrRangeCheckOrder(ret);
-     return(ret);
- }
-@@ -416,17 +436,7 @@ xmlXPtrNewRangePointNode(xmlXPathObjectPtr start, xmlNodePtr end) {
-     if (start->type != XPATH_POINT)
- 	return(NULL);
- 
--    ret = (xmlXPathObjectPtr) xmlMalloc(sizeof(xmlXPathObject));
--    if (ret == NULL) {
--        xmlXPtrErrMemory("allocating range");
--	return(NULL);
--    }
--    memset(ret, 0 , (size_t) sizeof(xmlXPathObject));
--    ret->type = XPATH_RANGE;
--    ret->user = start->user;
--    ret->index = start->index;
--    ret->user2 = end;
--    ret->index2 = -1;
-+    ret = xmlXPtrNewRangeInternal(start->user, start->index, end, -1);
-     xmlXPtrRangeCheckOrder(ret);
-     return(ret);
- }
-@@ -453,17 +463,7 @@ xmlXPtrNewRangeNodePoint(xmlNodePtr start, xmlXPathObjectPtr end) {
-     if (end->type != XPATH_POINT)
- 	return(NULL);
- 
--    ret = (xmlXPathObjectPtr) xmlMalloc(sizeof(xmlXPathObject));
--    if (ret == NULL) {
--        xmlXPtrErrMemory("allocating range");
--	return(NULL);
--    }
--    memset(ret, 0 , (size_t) sizeof(xmlXPathObject));
--    ret->type = XPATH_RANGE;
--    ret->user = start;
--    ret->index = -1;
--    ret->user2 = end->user;
--    ret->index2 = end->index;
-+    ret = xmlXPtrNewRangeInternal(start, -1, end->user, end->index);
-     xmlXPtrRangeCheckOrder(ret);
-     return(ret);
- }
-@@ -486,17 +486,7 @@ xmlXPtrNewRangeNodes(xmlNodePtr start, xmlNodePtr end) {
-     if (end == NULL)
- 	return(NULL);
- 
--    ret = (xmlXPathObjectPtr) xmlMalloc(sizeof(xmlXPathObject));
--    if (ret == NULL) {
--        xmlXPtrErrMemory("allocating range");
--	return(NULL);
--    }
--    memset(ret, 0 , (size_t) sizeof(xmlXPathObject));
--    ret->type = XPATH_RANGE;
--    ret->user = start;
--    ret->index = -1;
--    ret->user2 = end;
--    ret->index2 = -1;
-+    ret = xmlXPtrNewRangeInternal(start, -1, end, -1);
-     xmlXPtrRangeCheckOrder(ret);
-     return(ret);
- }
-@@ -516,17 +506,7 @@ xmlXPtrNewCollapsedRange(xmlNodePtr start) {
-     if (start == NULL)
- 	return(NULL);
- 
--    ret = (xmlXPathObjectPtr) xmlMalloc(sizeof(xmlXPathObject));
--    if (ret == NULL) {
--        xmlXPtrErrMemory("allocating range");
--	return(NULL);
--    }
--    memset(ret, 0 , (size_t) sizeof(xmlXPathObject));
--    ret->type = XPATH_RANGE;
--    ret->user = start;
--    ret->index = -1;
--    ret->user2 = NULL;
--    ret->index2 = -1;
-+    ret = xmlXPtrNewRangeInternal(start, -1, NULL, -1);
-     return(ret);
- }
- 
-@@ -541,6 +521,8 @@ xmlXPtrNewCollapsedRange(xmlNodePtr start) {
-  */
- xmlXPathObjectPtr
- xmlXPtrNewRangeNodeObject(xmlNodePtr start, xmlXPathObjectPtr end) {
-+    xmlNodePtr endNode;
-+    int endIndex;
-     xmlXPathObjectPtr ret;
- 
-     if (start == NULL)
-@@ -549,7 +531,12 @@ xmlXPtrNewRangeNodeObject(xmlNodePtr start, xmlXPathObjectPtr end) {
- 	return(NULL);
-     switch (end->type) {
- 	case XPATH_POINT:
-+	    endNode = end->user;
-+	    endIndex = end->index;
-+	    break;
- 	case XPATH_RANGE:
-+	    endNode = end->user2;
-+	    endIndex = end->index2;
- 	    break;
- 	case XPATH_NODESET:
- 	    /*
-@@ -557,39 +544,15 @@ xmlXPtrNewRangeNodeObject(xmlNodePtr start, xmlXPathObjectPtr end) {
- 	     */
- 	    if (end->nodesetval->nodeNr <= 0)
- 		return(NULL);
-+	    endNode = end->nodesetval->nodeTab[end->nodesetval->nodeNr - 1];
-+	    endIndex = -1;
- 	    break;
- 	default:
- 	    /* TODO */
- 	    return(NULL);
-     }
- 
--    ret = (xmlXPathObjectPtr) xmlMalloc(sizeof(xmlXPathObject));
--    if (ret == NULL) {
--        xmlXPtrErrMemory("allocating range");
--	return(NULL);
--    }
--    memset(ret, 0 , (size_t) sizeof(xmlXPathObject));
--    ret->type = XPATH_RANGE;
--    ret->user = start;
--    ret->index = -1;
--    switch (end->type) {
--	case XPATH_POINT:
--	    ret->user2 = end->user;
--	    ret->index2 = end->index;
--	    break;
--	case XPATH_RANGE:
--	    ret->user2 = end->user2;
--	    ret->index2 = end->index2;
--	    break;
--	case XPATH_NODESET: {
--	    ret->user2 = end->nodesetval->nodeTab[end->nodesetval->nodeNr - 1];
--	    ret->index2 = -1;
--	    break;
--	}
--	default:
--	    STRANGE
--	    return(NULL);
--    }
-+    ret = xmlXPtrNewRangeInternal(start, -1, endNode, endIndex);
-     xmlXPtrRangeCheckOrder(ret);
-     return(ret);
- }
-@@ -1835,8 +1798,8 @@ xmlXPtrStartPointFunction(xmlXPathParserContextPtr ctxt, int nargs) {
- 		case XPATH_RANGE: {
- 		    xmlNodePtr node = tmp->user;
- 		    if (node != NULL) {
--			if (node->type == XML_ATTRIBUTE_NODE) {
--			    /* TODO: Namespace Nodes ??? */
-+			if ((node->type == XML_ATTRIBUTE_NODE) ||
-+			     (node->type == XML_NAMESPACE_DECL)) {
- 			    xmlXPathFreeObject(obj);
- 			    xmlXPtrFreeLocationSet(newset);
- 			    XP_ERROR(XPTR_SYNTAX_ERROR);
-@@ -1931,8 +1894,8 @@ xmlXPtrEndPointFunction(xmlXPathParserContextPtr ctxt, int nargs) {
- 		case XPATH_RANGE: {
- 		    xmlNodePtr node = tmp->user2;
- 		    if (node != NULL) {
--			if (node->type == XML_ATTRIBUTE_NODE) {
--			    /* TODO: Namespace Nodes ??? */
-+			if ((node->type == XML_ATTRIBUTE_NODE) ||
-+			     (node->type == XML_NAMESPACE_DECL)) {
- 			    xmlXPathFreeObject(obj);
- 			    xmlXPtrFreeLocationSet(newset);
- 			    XP_ERROR(XPTR_SYNTAX_ERROR);
diff --git a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2016-5131.patch b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2016-5131.patch
deleted file mode 100644
index 9d47d02..0000000
--- a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2016-5131.patch
+++ /dev/null
@@ -1,180 +0,0 @@
-From 9ab01a277d71f54d3143c2cf333c5c2e9aaedd9e Mon Sep 17 00:00:00 2001
-From: Nick Wellnhofer <wellnhofer@aevum.de>
-Date: Tue, 28 Jun 2016 14:22:23 +0200
-Subject: [PATCH] Fix XPointer paths beginning with range-to
-
-The old code would invoke the broken xmlXPtrRangeToFunction. range-to
-isn't really a function but a special kind of location step. Remove
-this function and always handle range-to in the XPath code.
-
-The old xmlXPtrRangeToFunction could also be abused to trigger a
-use-after-free error with the potential for remote code execution.
-
-Found with afl-fuzz.
-
-Fixes CVE-2016-5131.
-
-CVE: CVE-2016-5131
-Upstream-Status: Backport
-https://git.gnome.org/browse/libxml2/commit/?id=9ab01a277d71f54d3143c2cf333c5c2e9aaedd9e
-
-Signed-off-by: Yi Zhao <yi.zhao@windirver.com>
----
- result/XPath/xptr/vidbase | 13 ++++++++
- test/XPath/xptr/vidbase   |  1 +
- xpath.c                   |  7 ++++-
- xpointer.c                | 76 ++++-------------------------------------------
- 4 files changed, 26 insertions(+), 71 deletions(-)
-
-diff --git a/result/XPath/xptr/vidbase b/result/XPath/xptr/vidbase
-index 8b9e92d..f19193e 100644
---- a/result/XPath/xptr/vidbase
-+++ b/result/XPath/xptr/vidbase
-@@ -17,3 +17,16 @@ Object is a Location Set:
-   To node
-     ELEMENT p
- 
-+
-+========================
-+Expression: xpointer(range-to(id('chapter2')))
-+Object is a Location Set:
-+1 :   Object is a range :
-+  From node
-+     /
-+  To node
-+    ELEMENT chapter
-+      ATTRIBUTE id
-+        TEXT
-+          content=chapter2
-+
-diff --git a/test/XPath/xptr/vidbase b/test/XPath/xptr/vidbase
-index b146383..884b106 100644
---- a/test/XPath/xptr/vidbase
-+++ b/test/XPath/xptr/vidbase
-@@ -1,2 +1,3 @@
- xpointer(id('chapter1')/p)
- xpointer(id('chapter1')/p[1]/range-to(following-sibling::p[2]))
-+xpointer(range-to(id('chapter2')))
-diff --git a/xpath.c b/xpath.c
-index d992841..5a01b1b 100644
---- a/xpath.c
-+++ b/xpath.c
-@@ -10691,13 +10691,18 @@ xmlXPathCompPathExpr(xmlXPathParserContextPtr ctxt) {
- 		    lc = 1;
- 		    break;
- 		} else if ((NXT(len) == '(')) {
--		    /* Note Type or Function */
-+		    /* Node Type or Function */
- 		    if (xmlXPathIsNodeType(name)) {
- #ifdef DEBUG_STEP
- 		        xmlGenericError(xmlGenericErrorContext,
- 				"PathExpr: Type search\n");
- #endif
- 			lc = 1;
-+#ifdef LIBXML_XPTR_ENABLED
-+                    } else if (ctxt->xptr &&
-+                               xmlStrEqual(name, BAD_CAST "range-to")) {
-+                        lc = 1;
-+#endif
- 		    } else {
- #ifdef DEBUG_STEP
- 		        xmlGenericError(xmlGenericErrorContext,
-diff --git a/xpointer.c b/xpointer.c
-index 676c510..d74174a 100644
---- a/xpointer.c
-+++ b/xpointer.c
-@@ -1332,8 +1332,6 @@ xmlXPtrNewContext(xmlDocPtr doc, xmlNodePtr here, xmlNodePtr origin) {
-     ret->here = here;
-     ret->origin = origin;
- 
--    xmlXPathRegisterFunc(ret, (xmlChar *)"range-to",
--	                 xmlXPtrRangeToFunction);
-     xmlXPathRegisterFunc(ret, (xmlChar *)"range",
- 	                 xmlXPtrRangeFunction);
-     xmlXPathRegisterFunc(ret, (xmlChar *)"range-inside",
-@@ -2243,76 +2241,14 @@ xmlXPtrRangeInsideFunction(xmlXPathParserContextPtr ctxt, int nargs) {
-  * @nargs:  the number of args
-  *
-  * Implement the range-to() XPointer function
-+ *
-+ * Obsolete. range-to is not a real function but a special type of location
-+ * step which is handled in xpath.c.
-  */
- void
--xmlXPtrRangeToFunction(xmlXPathParserContextPtr ctxt, int nargs) {
--    xmlXPathObjectPtr range;
--    const xmlChar *cur;
--    xmlXPathObjectPtr res, obj;
--    xmlXPathObjectPtr tmp;
--    xmlLocationSetPtr newset = NULL;
--    xmlNodeSetPtr oldset;
--    int i;
--
--    if (ctxt == NULL) return;
--    CHECK_ARITY(1);
--    /*
--     * Save the expression pointer since we will have to evaluate
--     * it multiple times. Initialize the new set.
--     */
--    CHECK_TYPE(XPATH_NODESET);
--    obj = valuePop(ctxt);
--    oldset = obj->nodesetval;
--    ctxt->context->node = NULL;
--
--    cur = ctxt->cur;
--    newset = xmlXPtrLocationSetCreate(NULL);
--
--    for (i = 0; i < oldset->nodeNr; i++) {
--	ctxt->cur = cur;
--
--	/*
--	 * Run the evaluation with a node list made of a single item
--	 * in the nodeset.
--	 */
--	ctxt->context->node = oldset->nodeTab[i];
--	tmp = xmlXPathNewNodeSet(ctxt->context->node);
--	valuePush(ctxt, tmp);
--
--	xmlXPathEvalExpr(ctxt);
--	CHECK_ERROR;
--
--	/*
--	 * The result of the evaluation need to be tested to
--	 * decided whether the filter succeeded or not
--	 */
--	res = valuePop(ctxt);
--	range = xmlXPtrNewRangeNodeObject(oldset->nodeTab[i], res);
--	if (range != NULL) {
--	    xmlXPtrLocationSetAdd(newset, range);
--	}
--
--	/*
--	 * Cleanup
--	 */
--	if (res != NULL)
--	    xmlXPathFreeObject(res);
--	if (ctxt->value == tmp) {
--	    res = valuePop(ctxt);
--	    xmlXPathFreeObject(res);
--	}
--
--	ctxt->context->node = NULL;
--    }
--
--    /*
--     * The result is used as the new evaluation set.
--     */
--    xmlXPathFreeObject(obj);
--    ctxt->context->node = NULL;
--    ctxt->context->contextSize = -1;
--    ctxt->context->proximityPosition = -1;
--    valuePush(ctxt, xmlXPtrWrapLocationSet(newset));
-+xmlXPtrRangeToFunction(xmlXPathParserContextPtr ctxt,
-+                       int nargs ATTRIBUTE_UNUSED) {
-+    XP_ERROR(XPATH_EXPR_ERROR);
- }
- 
- /**
--- 
-2.7.4
-
diff --git a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-0663.patch b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-0663.patch
deleted file mode 100644
index 0108265..0000000
--- a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-0663.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-libxml2: Fix CVE-2017-0663
-
-[No upstream tracking] -- https://bugzilla.gnome.org/show_bug.cgi?id=780228
-
-valid: Fix type confusion in xmlValidateOneNamespace
-
-Comment out code that casts xmlNsPtr to xmlAttrPtr. ID types
-on namespace declarations make no practical sense anyway.
-
-Fixes bug 780228
-
-Upstream-Status: Backport [https://git.gnome.org/browse/libxml2/commit/?id=92b9e8c8b3787068565a1820ba575d042f9eec66]
-CVE: CVE-2017-0663
-Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-
-diff --git a/valid.c b/valid.c
-index 19f84b8..e03d35e 100644
---- a/valid.c
-+++ b/valid.c
-@@ -4621,6 +4621,12 @@ xmlNodePtr elem, const xmlChar *prefix, xmlNsPtr ns, const xmlChar *value) {
- 	}
-     }
- 
-+    /*
-+     * Casting ns to xmlAttrPtr is wrong. We'd need separate functions
-+     * xmlAddID and xmlAddRef for namespace declarations, but it makes
-+     * no practical sense to use ID types anyway.
-+     */
-+#if 0
-     /* Validity Constraint: ID uniqueness */
-     if (attrDecl->atype == XML_ATTRIBUTE_ID) {
-         if (xmlAddID(ctxt, doc, value, (xmlAttrPtr) ns) == NULL)
-@@ -4632,6 +4638,7 @@ xmlNodePtr elem, const xmlChar *prefix, xmlNsPtr ns, const xmlChar *value) {
-         if (xmlAddRef(ctxt, doc, value, (xmlAttrPtr) ns) == NULL)
- 	    ret = 0;
-     }
-+#endif
- 
-     /* Validity Constraint: Notation Attributes */
-     if (attrDecl->atype == XML_ATTRIBUTE_NOTATION) {
diff --git a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-5969.patch b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-5969.patch
deleted file mode 100644
index 571b05c..0000000
--- a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-5969.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-libxml2-2.9.4: Fix CVE-2017-5969
-
-[No upstream tracking] -- https://bugzilla.gnome.org/show_bug.cgi?id=758422
-
-valid: Fix NULL pointer deref in xmlDumpElementContent
-
-Can only be triggered in recovery mode.
-
-Fixes bug 758422
-
-Upstream-Status: Backport - [https://git.gnome.org/browse/libxml2/commit/?id=94691dc884d1a8ada39f073408b4bb92fe7fe882]
-CVE: CVE-2017-5969
-Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-
-diff --git a/valid.c b/valid.c
-index 19f84b8..0a8e58a 100644
---- a/valid.c
-+++ b/valid.c
-@@ -1172,29 +1172,33 @@ xmlDumpElementContent(xmlBufferPtr buf, xmlElementContentPtr content, int glob)
- 	    xmlBufferWriteCHAR(buf, content->name);
- 	    break;
- 	case XML_ELEMENT_CONTENT_SEQ:
--	    if ((content->c1->type == XML_ELEMENT_CONTENT_OR) ||
--	        (content->c1->type == XML_ELEMENT_CONTENT_SEQ))
-+	    if ((content->c1 != NULL) &&
-+	        ((content->c1->type == XML_ELEMENT_CONTENT_OR) ||
-+	         (content->c1->type == XML_ELEMENT_CONTENT_SEQ)))
- 		xmlDumpElementContent(buf, content->c1, 1);
- 	    else
- 		xmlDumpElementContent(buf, content->c1, 0);
-             xmlBufferWriteChar(buf, " , ");
--	    if ((content->c2->type == XML_ELEMENT_CONTENT_OR) ||
--	        ((content->c2->type == XML_ELEMENT_CONTENT_SEQ) &&
--		 (content->c2->ocur != XML_ELEMENT_CONTENT_ONCE)))
-+	    if ((content->c2 != NULL) &&
-+	        ((content->c2->type == XML_ELEMENT_CONTENT_OR) ||
-+	         ((content->c2->type == XML_ELEMENT_CONTENT_SEQ) &&
-+		  (content->c2->ocur != XML_ELEMENT_CONTENT_ONCE))))
- 		xmlDumpElementContent(buf, content->c2, 1);
- 	    else
- 		xmlDumpElementContent(buf, content->c2, 0);
- 	    break;
- 	case XML_ELEMENT_CONTENT_OR:
--	    if ((content->c1->type == XML_ELEMENT_CONTENT_OR) ||
--	        (content->c1->type == XML_ELEMENT_CONTENT_SEQ))
-+	    if ((content->c1 != NULL) &&
-+	        ((content->c1->type == XML_ELEMENT_CONTENT_OR) ||
-+	         (content->c1->type == XML_ELEMENT_CONTENT_SEQ)))
- 		xmlDumpElementContent(buf, content->c1, 1);
- 	    else
- 		xmlDumpElementContent(buf, content->c1, 0);
-             xmlBufferWriteChar(buf, " | ");
--	    if ((content->c2->type == XML_ELEMENT_CONTENT_SEQ) ||
--	        ((content->c2->type == XML_ELEMENT_CONTENT_OR) &&
--		 (content->c2->ocur != XML_ELEMENT_CONTENT_ONCE)))
-+	    if ((content->c2 != NULL) &&
-+	        ((content->c2->type == XML_ELEMENT_CONTENT_SEQ) ||
-+	         ((content->c2->type == XML_ELEMENT_CONTENT_OR) &&
-+		  (content->c2->ocur != XML_ELEMENT_CONTENT_ONCE))))
- 		xmlDumpElementContent(buf, content->c2, 1);
- 	    else
- 		xmlDumpElementContent(buf, content->c2, 0);
diff --git a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-8872.patch b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-8872.patch
deleted file mode 100644
index 26779aa..0000000
--- a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-8872.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From d2f873a541c72b0f67e15562819bf98b884b30b7 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 23 Aug 2017 16:04:49 +0800
-Subject: [PATCH] fix CVE-2017-8872
-
-this makes xmlHaltParser "empty" the buffer, as it resets cur and ava
-il too here.
-
-this seems to cure this specific issue, and also passes the testsuite
-
-Signed-off-by: Marcus Meissner <meissner@suse.de>
-
-https://bugzilla.gnome.org/show_bug.cgi?id=775200
-Upstream-Status: Backport [https://bugzilla.gnome.org/attachment.cgi?id=355527&action=diff]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- parser.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/parser.c b/parser.c
-index 9506ead..6c07ffd 100644
---- a/parser.c
-+++ b/parser.c
-@@ -12664,6 +12664,10 @@ xmlHaltParser(xmlParserCtxtPtr ctxt) {
- 	}
- 	ctxt->input->cur = BAD_CAST"";
- 	ctxt->input->base = ctxt->input->cur;
-+	if (ctxt->input->buf) {
-+		xmlBufEmpty (ctxt->input->buf->buffer);
-+	} else
-+		ctxt->input->length = 0;
-     }
- }
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-9047_CVE-2017-9048.patch b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-9047_CVE-2017-9048.patch
deleted file mode 100644
index 8b03456..0000000
--- a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-9047_CVE-2017-9048.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-libxml2-2.9.4: Fix CVE-2017-9047 and CVE-2017-9048
-
-[No upstream tracking] -- https://bugzilla.gnome.org/show_bug.cgi?id=781333
- -- https://bugzilla.gnome.org/show_bug.cgi?id=781701
-
-valid: Fix buffer size checks in xmlSnprintfElementContent
-
-xmlSnprintfElementContent failed to correctly check the available
-buffer space in two locations.
-
-Fixes bug 781333 and bug 781701
-
-Upstream-Status: Backport [https://git.gnome.org/browse/libxml2/commit/?id=932cc9896ab41475d4aa429c27d9afd175959d74]
-CVE: CVE-2017-9047 CVE-2017-9048
-Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-
-diff --git a/result/valid/781333.xml b/result/valid/781333.xml
-new file mode 100644
-index 0000000..01baf11
---- /dev/null
-+++ b/result/valid/781333.xml
-@@ -0,0 +1,5 @@
-+<?xml version="1.0"?>
-+<!DOCTYPE a [
-+<!ELEMENT a (pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp!
 ppppppppp
 pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp!
 ppppppppp
 pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp!
 ppppppppp
 pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp!
 ppppppppp
 pppppppppppppppppppppppppp:lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll!
 lllllllll
 llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll!
 lllllllll
 lllllllllllllllllllllllllllllllll)>
-+]>
-+<a/>
-diff --git a/result/valid/781333.xml.err b/result/valid/781333.xml.err
-new file mode 100644
-index 0000000..2176200
---- /dev/null
-+++ b/result/valid/781333.xml.err
-@@ -0,0 +1,3 @@
-+./test/valid/781333.xml:4: element a: validity error : Element a content does not follow the DTD, expecting ( ..., got 
-+<a/>
-+    ^
-diff --git a/result/valid/781333.xml.err.rdr b/result/valid/781333.xml.err.rdr
-new file mode 100644
-index 0000000..1195a04
---- /dev/null
-+++ b/result/valid/781333.xml.err.rdr
-@@ -0,0 +1,6 @@
-+./test/valid/781333.xml:4: element a: validity error : Element a content does not follow the DTD, expecting ( ..., got 
-+<a/>
-+    ^
-+./test/valid/781333.xml:5: element a: validity error : Element a content does not follow the DTD, Expecting more child
-+
-+^
-diff --git a/test/valid/781333.xml b/test/valid/781333.xml
-new file mode 100644
-index 0000000..bceac9c
---- /dev/null
-+++ b/test/valid/781333.xml
-@@ -0,0 +1,4 @@
-+<!DOCTYPE a [
-+    <!ELEMENT a (pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp!
 ppppppppp
 pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp!
 ppppppppp
 pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp!
 ppppppppp
 pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp!
 ppppppppp
 pppppppppppppppppppppppppppppp:lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll!
 lllllllll
 llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll!
 lllllllll
 lllllllllllllllllllllllllllllllllllll)>
-+]>
-+<a/>
-diff --git a/valid.c b/valid.c
-index 19f84b8..aaa30f6 100644
---- a/valid.c
-+++ b/valid.c
-@@ -1262,22 +1262,23 @@ xmlSnprintfElementContent(char *buf, int size, xmlElementContentPtr content, int
-         case XML_ELEMENT_CONTENT_PCDATA:
-             strcat(buf, "#PCDATA");
- 	    break;
--	case XML_ELEMENT_CONTENT_ELEMENT:
-+	case XML_ELEMENT_CONTENT_ELEMENT: {
-+            int qnameLen = xmlStrlen(content->name);
-+
-+	    if (content->prefix != NULL)
-+                qnameLen += xmlStrlen(content->prefix) + 1;
-+	    if (size - len < qnameLen + 10) {
-+		strcat(buf, " ...");
-+		return;
-+	    }
- 	    if (content->prefix != NULL) {
--		if (size - len < xmlStrlen(content->prefix) + 10) {
--		    strcat(buf, " ...");
--		    return;
--		}
- 		strcat(buf, (char *) content->prefix);
- 		strcat(buf, ":");
- 	    }
--	    if (size - len < xmlStrlen(content->name) + 10) {
--		strcat(buf, " ...");
--		return;
--	    }
- 	    if (content->name != NULL)
- 		strcat(buf, (char *) content->name);
- 	    break;
-+	}
- 	case XML_ELEMENT_CONTENT_SEQ:
- 	    if ((content->c1->type == XML_ELEMENT_CONTENT_OR) ||
- 	        (content->c1->type == XML_ELEMENT_CONTENT_SEQ))
-@@ -1319,6 +1320,7 @@ xmlSnprintfElementContent(char *buf, int size, xmlElementContentPtr content, int
- 		xmlSnprintfElementContent(buf, size, content->c2, 0);
- 	    break;
-     }
-+    if (size - strlen(buf) <= 2) return;
-     if (englob)
-         strcat(buf, ")");
-     switch (content->ocur) {
diff --git a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-9049_CVE-2017-9050.patch b/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-9049_CVE-2017-9050.patch
deleted file mode 100644
index 591075d..0000000
--- a/meta/recipes-core/libxml/libxml2/libxml2-CVE-2017-9049_CVE-2017-9050.patch
+++ /dev/null
@@ -1,291 +0,0 @@
-libxml2-2.9.4: Fix CVE-2017-9049 and CVE-2017-9050
-
-[No upstream tracking] -- https://bugzilla.gnome.org/show_bug.cgi?id=781205
- -- https://bugzilla.gnome.org/show_bug.cgi?id=781361
-
-parser: Fix handling of parameter-entity references
-
-There were two bugs where parameter-entity references could lead to an
-unexpected change of the input buffer in xmlParseNameComplex and
-xmlDictLookup being called with an invalid pointer.
-
-Percent sign in DTD Names
-=========================
-
-The NEXTL macro used to call xmlParserHandlePEReference. When parsing
-"complex" names inside the DTD, this could result in entity expansion
-which created a new input buffer. The fix is to simply remove the call
-to xmlParserHandlePEReference from the NEXTL macro. This is safe because
-no users of the macro require expansion of parameter entities.
-
-- xmlParseNameComplex
-- xmlParseNCNameComplex
-- xmlParseNmtoken
-
-The percent sign is not allowed in names, which are grammatical tokens.
-
-- xmlParseEntityValue
-
-Parameter-entity references in entity values are expanded but this
-happens in a separate step in this function.
-
-- xmlParseSystemLiteral
-
-Parameter-entity references are ignored in the system literal.
-
-- xmlParseAttValueComplex
-- xmlParseCharDataComplex
-- xmlParseCommentComplex
-- xmlParsePI
-- xmlParseCDSect
-
-Parameter-entity references are ignored outside the DTD.
-
-- xmlLoadEntityContent
-
-This function is only called from xmlStringLenDecodeEntities and
-entities are replaced in a separate step immediately after the function
-call.
-
-This bug could also be triggered with an internal subset and double
-entity expansion.
-
-This fixes bug 766956 initially reported by Wei Lei and independently by
-Chromium's ClusterFuzz, Hanno Böck, and Marco Grassi. Thanks to everyone
-involved.
-
-xmlParseNameComplex with XML_PARSE_OLD10
-========================================
-
-When parsing Names inside an expanded parameter entity with the
-XML_PARSE_OLD10 option, xmlParseNameComplex would call xmlGROW via the
-GROW macro if the input buffer was exhausted. At the end of the
-parameter entity's replacement text, this function would then call
-xmlPopInput which invalidated the input buffer.
-
-There should be no need to invoke GROW in this situation because the
-buffer is grown periodically every XML_PARSER_CHUNK_SIZE characters and,
-at least for UTF-8, in xmlCurrentChar. This also matches the code path
-executed when XML_PARSE_OLD10 is not set.
-
-This fixes bugs 781205 (CVE-2017-9049) and 781361 (CVE-2017-9050).
-Thanks to Marcel Böhme and Thuan Pham for the report.
-
-Additional hardening
-====================
-
-A separate check was added in xmlParseNameComplex to validate the
-buffer size.
-
-Fixes bug 781205 and bug 781361
-
-Upstream-Status: Backport [https://git.gnome.org/browse/libxml2/commit/?id=932cc9896ab41475d4aa429c27d9afd175959d74]
-CVE: CVE-2017-9049 CVE-2017-9050
-Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-
-diff --git a/Makefile.am b/Makefile.am
-index 9f988b0..dab15a4 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -422,6 +422,24 @@ Errtests : xmllint$(EXEEXT)
- 	      if [ -n "$$log" ] ; then echo $$name result ; echo $$log ; fi ; \
- 	      rm result.$$name error.$$name ; \
- 	  fi ; fi ; done)
-+	@echo "## Error cases regression tests (old 1.0)"
-+	-@(for i in $(srcdir)/test/errors10/*.xml ; do \
-+	  name=`basename $$i`; \
-+	  if [ ! -d $$i ] ; then \
-+	  if [ ! -f $(srcdir)/result/errors10/$$name ] ; then \
-+	      echo New test file $$name ; \
-+	      $(CHECKER) $(top_builddir)/xmllint --oldxml10 $$i \
-+	         2> $(srcdir)/result/errors10/$$name.err \
-+		 > $(srcdir)/result/errors10/$$name ; \
-+	      grep "MORY ALLO" .memdump  | grep -v "MEMORY ALLOCATED : 0"; \
-+	  else \
-+	      log=`$(CHECKER) $(top_builddir)/xmllint --oldxml10 $$i 2> error.$$name > result.$$name ; \
-+	      grep "MORY ALLO" .memdump  | grep -v "MEMORY ALLOCATED : 0"; \
-+	      diff $(srcdir)/result/errors10/$$name result.$$name ; \
-+	      diff $(srcdir)/result/errors10/$$name.err error.$$name` ; \
-+	      if [ -n "$$log" ] ; then echo $$name result ; echo "$$log" ; fi ; \
-+	      rm result.$$name error.$$name ; \
-+	  fi ; fi ; done)
- 	@echo "## Error cases stream regression tests"
- 	-@(for i in $(srcdir)/test/errors/*.xml ; do \
- 	  name=`basename $$i`; \
-diff --git a/parser.c b/parser.c
-index 609a270..8e11c12 100644
---- a/parser.c
-+++ b/parser.c
-@@ -2115,7 +2115,6 @@ static void xmlGROW (xmlParserCtxtPtr ctxt) {
- 	ctxt->input->line++; ctxt->input->col = 1;			\
-     } else ctxt->input->col++;						\
-     ctxt->input->cur += l;				\
--    if (*ctxt->input->cur == '%') xmlParserHandlePEReference(ctxt);	\
-   } while (0)
- 
- #define CUR_CHAR(l) xmlCurrentChar(ctxt, &l)
-@@ -3406,13 +3405,6 @@ xmlParseNameComplex(xmlParserCtxtPtr ctxt) {
- 	    len += l;
- 	    NEXTL(l);
- 	    c = CUR_CHAR(l);
--	    if (c == 0) {
--		count = 0;
--		GROW;
--                if (ctxt->instate == XML_PARSER_EOF)
--                    return(NULL);
--		c = CUR_CHAR(l);
--	    }
- 	}
-     }
-     if ((len > XML_MAX_NAME_LENGTH) &&
-@@ -3420,6 +3412,16 @@ xmlParseNameComplex(xmlParserCtxtPtr ctxt) {
-         xmlFatalErr(ctxt, XML_ERR_NAME_TOO_LONG, "Name");
-         return(NULL);
-     }
-+    if (ctxt->input->cur - ctxt->input->base < len) {
-+        /*
-+         * There were a couple of bugs where PERefs lead to to a change
-+         * of the buffer. Check the buffer size to avoid passing an invalid
-+         * pointer to xmlDictLookup.
-+         */
-+        xmlFatalErr(ctxt, XML_ERR_INTERNAL_ERROR,
-+                    "unexpected change of input buffer");
-+        return (NULL);
-+    }
-     if ((*ctxt->input->cur == '\n') && (ctxt->input->cur[-1] == '\r'))
-         return(xmlDictLookup(ctxt->dict, ctxt->input->cur - (len + 1), len));
-     return(xmlDictLookup(ctxt->dict, ctxt->input->cur - len, len));
-diff --git a/result/errors10/781205.xml b/result/errors10/781205.xml
-new file mode 100644
-index 0000000..e69de29
-diff --git a/result/errors10/781205.xml.err b/result/errors10/781205.xml.err
-new file mode 100644
-index 0000000..da15c3f
---- /dev/null
-+++ b/result/errors10/781205.xml.err
-@@ -0,0 +1,21 @@
-+Entity: line 1: parser error : internal error: xmlParseInternalSubset: error detected in Markup declaration
-+
-+ %a; 
-+    ^
-+Entity: line 1: 
-+<:0000
-+^
-+Entity: line 1: parser error : DOCTYPE improperly terminated
-+ %a; 
-+    ^
-+Entity: line 1: 
-+<:0000
-+^
-+namespace error : Failed to parse QName ':0000'
-+ %a; 
-+    ^
-+<:0000
-+      ^
-+./test/errors10/781205.xml:4: parser error : Couldn't find end of Start Tag :0000 line 1
-+
-+^
-diff --git a/result/errors10/781361.xml b/result/errors10/781361.xml
-new file mode 100644
-index 0000000..e69de29
-diff --git a/result/errors10/781361.xml.err b/result/errors10/781361.xml.err
-new file mode 100644
-index 0000000..655f41a
---- /dev/null
-+++ b/result/errors10/781361.xml.err
-@@ -0,0 +1,13 @@
-+./test/errors10/781361.xml:4: parser error : xmlParseElementDecl: 'EMPTY', 'ANY' or '(' expected
-+
-+^
-+./test/errors10/781361.xml:4: parser error : internal error: xmlParseInternalSubset: error detected in Markup declaration
-+
-+
-+^
-+./test/errors10/781361.xml:4: parser error : DOCTYPE improperly terminated
-+
-+^
-+./test/errors10/781361.xml:4: parser error : Start tag expected, '<' not found
-+
-+^
-diff --git a/result/valid/766956.xml b/result/valid/766956.xml
-new file mode 100644
-index 0000000..e69de29
-diff --git a/result/valid/766956.xml.err b/result/valid/766956.xml.err
-new file mode 100644
-index 0000000..34b1dae
---- /dev/null
-+++ b/result/valid/766956.xml.err
-@@ -0,0 +1,9 @@
-+test/valid/dtds/766956.dtd:2: parser error : PEReference: expecting ';'
-+%ä%ent;
-+   ^
-+Entity: line 1: parser error : Content error in the external subset
-+ %ent; 
-+      ^
-+Entity: line 1: 
-+value
-+^
-diff --git a/result/valid/766956.xml.err.rdr b/result/valid/766956.xml.err.rdr
-new file mode 100644
-index 0000000..7760346
---- /dev/null
-+++ b/result/valid/766956.xml.err.rdr
-@@ -0,0 +1,10 @@
-+test/valid/dtds/766956.dtd:2: parser error : PEReference: expecting ';'
-+%ä%ent;
-+   ^
-+Entity: line 1: parser error : Content error in the external subset
-+ %ent; 
-+      ^
-+Entity: line 1: 
-+value
-+^
-+./test/valid/766956.xml : failed to parse
-diff --git a/runtest.c b/runtest.c
-index bb74d2a..63e8c20 100644
---- a/runtest.c
-+++ b/runtest.c
-@@ -4202,6 +4202,9 @@ testDesc testDescriptions[] = {
-     { "Error cases regression tests",
-       errParseTest, "./test/errors/*.xml", "result/errors/", "", ".err",
-       0 },
-+    { "Error cases regression tests (old 1.0)",
-+      errParseTest, "./test/errors10/*.xml", "result/errors10/", "", ".err",
-+      XML_PARSE_OLD10 },
- #ifdef LIBXML_READER_ENABLED
-     { "Error cases stream regression tests",
-       streamParseTest, "./test/errors/*.xml", "result/errors/", NULL, ".str",
-diff --git a/test/errors10/781205.xml b/test/errors10/781205.xml
-new file mode 100644
-index 0000000..d9e9e83
---- /dev/null
-+++ b/test/errors10/781205.xml
-@@ -0,0 +1,3 @@
-+<!DOCTYPE D [
-+  <!ENTITY % a "<:0000">
-+  %a;
-diff --git a/test/errors10/781361.xml b/test/errors10/781361.xml
-new file mode 100644
-index 0000000..67476bc
---- /dev/null
-+++ b/test/errors10/781361.xml
-@@ -0,0 +1,3 @@
-+<!DOCTYPE doc [
-+  <!ENTITY % elem "<!ELEMENT e0000000000">
-+  %elem;
-diff --git a/test/valid/766956.xml b/test/valid/766956.xml
-new file mode 100644
-index 0000000..19a95a0
---- /dev/null
-+++ b/test/valid/766956.xml
-@@ -0,0 +1,2 @@
-+<!DOCTYPE test SYSTEM "dtds/766956.dtd">
-+<test/>
-diff --git a/test/valid/dtds/766956.dtd b/test/valid/dtds/766956.dtd
-new file mode 100644
-index 0000000..dddde68
---- /dev/null
-+++ b/test/valid/dtds/766956.dtd
-@@ -0,0 +1,2 @@
-+<!ENTITY % ent "value">
-+%ä%ent;
diff --git a/meta/recipes-core/libxml/libxml2/libxml2-fix_NULL_pointer_derefs.patch b/meta/recipes-core/libxml/libxml2/libxml2-fix_NULL_pointer_derefs.patch
deleted file mode 100644
index c60e32f..0000000
--- a/meta/recipes-core/libxml/libxml2/libxml2-fix_NULL_pointer_derefs.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-libxml2-2.9.4: Fix more NULL pointer derefs
-
-xpointer: Fix more NULL pointer derefs
-
-Upstream-Status: Backport [https://git.gnome.org/browse/libxml2/commit/?id=e905f08123e4a6e7731549e6f09dadff4cab65bd]
-Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
-
-diff --git a/xpointer.c b/xpointer.c
-index 676c510..074db24 100644
---- a/xpointer.c
-+++ b/xpointer.c
-@@ -555,7 +555,7 @@ xmlXPtrNewRangeNodeObject(xmlNodePtr start, xmlXPathObjectPtr end) {
- 	    /*
- 	     * Empty set ...
- 	     */
--	    if (end->nodesetval->nodeNr <= 0)
-+	    if ((end->nodesetval == NULL) || (end->nodesetval->nodeNr <= 0))
- 		return(NULL);
- 	    break;
- 	default:
-@@ -1400,7 +1400,7 @@ xmlXPtrEval(const xmlChar *str, xmlXPathContextPtr ctx) {
- 		     */
- 		    xmlNodeSetPtr set;
- 		    set = tmp->nodesetval;
--		    if ((set->nodeNr != 1) ||
-+		    if ((set == NULL) || (set->nodeNr != 1) ||
- 			(set->nodeTab[0] != (xmlNodePtr) ctx->doc))
- 			stack++;
- 		} else
-@@ -2073,9 +2073,11 @@ xmlXPtrRangeFunction(xmlXPathParserContextPtr ctxt, int nargs) {
- 	xmlXPathFreeObject(set);
-         XP_ERROR(XPATH_MEMORY_ERROR);
-     }
--    for (i = 0;i < oldset->locNr;i++) {
--	xmlXPtrLocationSetAdd(newset,
--		xmlXPtrCoveringRange(ctxt, oldset->locTab[i]));
-+    if (oldset != NULL) {
-+	for (i = 0;i < oldset->locNr;i++) {
-+	  xmlXPtrLocationSetAdd(newset,
-+		  xmlXPtrCoveringRange(ctxt, oldset->locTab[i]));
-+      }
-     }
- 
-     /*
diff --git a/meta/recipes-core/libxml/libxml2/libxml2-fix_and_simplify_xmlParseStartTag2.patch b/meta/recipes-core/libxml/libxml2/libxml2-fix_and_simplify_xmlParseStartTag2.patch
deleted file mode 100644
index faa5770..0000000
--- a/meta/recipes-core/libxml/libxml2/libxml2-fix_and_simplify_xmlParseStartTag2.patch
+++ /dev/null
@@ -1,590 +0,0 @@
-libxml2-2.9.4: Avoid reparsing and simplify control flow in xmlParseStartTag2
-
-[No upstream tracking]
-
-parser: Avoid reparsing in xmlParseStartTag2
-
-The code in xmlParseStartTag2 must handle the case that the input
-buffer was grown and reallocated which can invalidate pointers to
-attribute values. Before, this was handled by detecting changes of
-the input buffer "base" pointer and, in case of a change, jumping
-back to the beginning of the function and reparsing the start tag.
-
-The major problem of this approach is that whether an input buffer is
-reallocated is nondeterministic, resulting in seemingly random test
-failures. See the mailing list thread "runtest mystery bug: name2.xml
-error case regression test" from 2012, for example.
-
-If a reallocation was detected, the code also made no attempts to
-continue parsing in case of errors which makes a difference in
-the lax "recover" mode.
-
-Now we store the current input buffer "base" pointer for each (not
-separately allocated) attribute in the namespace URI field, which isn't
-used until later. After the whole start tag was parsed, the pointers to
-the attribute values are reconstructed using the offset between the
-new and the old input buffer. This relies on arithmetic on dangling
-pointers which is technically undefined behavior. But it seems like
-the easiest and most efficient fix and a similar approach is used in
-xmlParserInputGrow.
-
-This changes the error output of several tests, typically making it
-more verbose because we try harder to continue parsing in case of errors.
-
-(Another possible solution is to check not only the "base" pointer
-but the size of the input buffer as well. But this would result in
-even more reparsing.)
-
-Remove some goto labels and deduplicate a bit of code after handling
-namespaces.
-
-There were two bugs where parameter-entity references could lead to an
-unexpected change of the input buffer in xmlParseNameComplex and
-xmlDictLookup being called with an invalid pointer.
-
-
-Upstream-Status: Backport
- - [https://git.gnome.org/browse/libxml2/commit/?id=07b7428b69c368611d215a140fe630b2d1e61349]
- - [https://git.gnome.org/browse/libxml2/commit/?id=855c19efb7cd30d927d673b3658563c4959ca6f0]
-Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-
-diff --git a/parser.c b/parser.c
-index 609a270..74016e3 100644
---- a/parser.c
-+++ b/parser.c
-@@ -43,6 +43,7 @@
- #include <limits.h>
- #include <string.h>
- #include <stdarg.h>
-+#include <stddef.h>
- #include <libxml/xmlmemory.h>
- #include <libxml/threads.h>
- #include <libxml/globals.h>
-@@ -9377,8 +9378,7 @@ xmlParseStartTag2(xmlParserCtxtPtr ctxt, const xmlChar **pref,
-     const xmlChar **atts = ctxt->atts;
-     int maxatts = ctxt->maxatts;
-     int nratts, nbatts, nbdef;
--    int i, j, nbNs, attval, oldline, oldcol, inputNr;
--    const xmlChar *base;
-+    int i, j, nbNs, attval;
-     unsigned long cur;
-     int nsNr = ctxt->nsNr;
- 
-@@ -9392,13 +9392,8 @@ xmlParseStartTag2(xmlParserCtxtPtr ctxt, const xmlChar **pref,
-      *       The Shrinking is only possible once the full set of attribute
-      *       callbacks have been done.
-      */
--reparse:
-     SHRINK;
--    base = ctxt->input->base;
-     cur = ctxt->input->cur - ctxt->input->base;
--    inputNr = ctxt->inputNr;
--    oldline = ctxt->input->line;
--    oldcol = ctxt->input->col;
-     nbatts = 0;
-     nratts = 0;
-     nbdef = 0;
-@@ -9422,8 +9417,6 @@ reparse:
-      */
-     SKIP_BLANKS;
-     GROW;
--    if ((ctxt->input->base != base) || (inputNr != ctxt->inputNr))
--        goto base_changed;
- 
-     while (((RAW != '>') &&
- 	   ((RAW != '/') || (NXT(1) != '>')) &&
-@@ -9434,203 +9427,174 @@ reparse:
- 
- 	attname = xmlParseAttribute2(ctxt, prefix, localname,
- 	                             &aprefix, &attvalue, &len, &alloc);
--	if ((ctxt->input->base != base) || (inputNr != ctxt->inputNr)) {
--	    if ((attvalue != NULL) && (alloc != 0))
--	        xmlFree(attvalue);
--	    attvalue = NULL;
--	    goto base_changed;
--	}
--        if ((attname != NULL) && (attvalue != NULL)) {
--	    if (len < 0) len = xmlStrlen(attvalue);
--            if ((attname == ctxt->str_xmlns) && (aprefix == NULL)) {
--	        const xmlChar *URL = xmlDictLookup(ctxt->dict, attvalue, len);
--		xmlURIPtr uri;
--
--                if (URL == NULL) {
--		    xmlErrMemory(ctxt, "dictionary allocation failure");
--		    if ((attvalue != NULL) && (alloc != 0))
--			xmlFree(attvalue);
--		    return(NULL);
--		}
--                if (*URL != 0) {
--		    uri = xmlParseURI((const char *) URL);
--		    if (uri == NULL) {
--			xmlNsErr(ctxt, XML_WAR_NS_URI,
--			         "xmlns: '%s' is not a valid URI\n",
--					   URL, NULL, NULL);
--		    } else {
--			if (uri->scheme == NULL) {
--			    xmlNsWarn(ctxt, XML_WAR_NS_URI_RELATIVE,
--				      "xmlns: URI %s is not absolute\n",
--				      URL, NULL, NULL);
--			}
--			xmlFreeURI(uri);
--		    }
--		    if (URL == ctxt->str_xml_ns) {
--			if (attname != ctxt->str_xml) {
--			    xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
--			 "xml namespace URI cannot be the default namespace\n",
--				     NULL, NULL, NULL);
--			}
--			goto skip_default_ns;
--		    }
--		    if ((len == 29) &&
--			(xmlStrEqual(URL,
--				 BAD_CAST "http://www.w3.org/2000/xmlns/"))) {
--			xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
--			     "reuse of the xmlns namespace name is forbidden\n",
--				 NULL, NULL, NULL);
--			goto skip_default_ns;
--		    }
--		}
--		/*
--		 * check that it's not a defined namespace
--		 */
--		for (j = 1;j <= nbNs;j++)
--		    if (ctxt->nsTab[ctxt->nsNr - 2 * j] == NULL)
--			break;
--		if (j <= nbNs)
--		    xmlErrAttributeDup(ctxt, NULL, attname);
--		else
--		    if (nsPush(ctxt, NULL, URL) > 0) nbNs++;
--skip_default_ns:
--		if ((attvalue != NULL) && (alloc != 0)) {
--		    xmlFree(attvalue);
--		    attvalue = NULL;
--		}
--		if ((RAW == '>') || (((RAW == '/') && (NXT(1) == '>'))))
--		    break;
--		if (!IS_BLANK_CH(RAW)) {
--		    xmlFatalErrMsg(ctxt, XML_ERR_SPACE_REQUIRED,
--				   "attributes construct error\n");
--		    break;
--		}
--		SKIP_BLANKS;
--		if ((ctxt->input->base != base) || (inputNr != ctxt->inputNr))
--		    goto base_changed;
--		continue;
--	    }
--            if (aprefix == ctxt->str_xmlns) {
--	        const xmlChar *URL = xmlDictLookup(ctxt->dict, attvalue, len);
--		xmlURIPtr uri;
--
--                if (attname == ctxt->str_xml) {
--		    if (URL != ctxt->str_xml_ns) {
--		        xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
--			         "xml namespace prefix mapped to wrong URI\n",
--			         NULL, NULL, NULL);
--		    }
--		    /*
--		     * Do not keep a namespace definition node
--		     */
--		    goto skip_ns;
--		}
-+        if ((attname == NULL) || (attvalue == NULL))
-+            goto next_attr;
-+	if (len < 0) len = xmlStrlen(attvalue);
-+
-+        if ((attname == ctxt->str_xmlns) && (aprefix == NULL)) {
-+            const xmlChar *URL = xmlDictLookup(ctxt->dict, attvalue, len);
-+            xmlURIPtr uri;
-+
-+            if (URL == NULL) {
-+                xmlErrMemory(ctxt, "dictionary allocation failure");
-+                if ((attvalue != NULL) && (alloc != 0))
-+                    xmlFree(attvalue);
-+                return(NULL);
-+            }
-+            if (*URL != 0) {
-+                uri = xmlParseURI((const char *) URL);
-+                if (uri == NULL) {
-+                    xmlNsErr(ctxt, XML_WAR_NS_URI,
-+                             "xmlns: '%s' is not a valid URI\n",
-+                                       URL, NULL, NULL);
-+                } else {
-+                    if (uri->scheme == NULL) {
-+                        xmlNsWarn(ctxt, XML_WAR_NS_URI_RELATIVE,
-+                                  "xmlns: URI %s is not absolute\n",
-+                                  URL, NULL, NULL);
-+                    }
-+                    xmlFreeURI(uri);
-+                }
-                 if (URL == ctxt->str_xml_ns) {
--		    if (attname != ctxt->str_xml) {
--		        xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
--			         "xml namespace URI mapped to wrong prefix\n",
--			         NULL, NULL, NULL);
--		    }
--		    goto skip_ns;
--		}
--                if (attname == ctxt->str_xmlns) {
--		    xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
--			     "redefinition of the xmlns prefix is forbidden\n",
--			     NULL, NULL, NULL);
--		    goto skip_ns;
--		}
--		if ((len == 29) &&
--		    (xmlStrEqual(URL,
--		                 BAD_CAST "http://www.w3.org/2000/xmlns/"))) {
--		    xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
--			     "reuse of the xmlns namespace name is forbidden\n",
--			     NULL, NULL, NULL);
--		    goto skip_ns;
--		}
--		if ((URL == NULL) || (URL[0] == 0)) {
--		    xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
--		             "xmlns:%s: Empty XML namespace is not allowed\n",
--			          attname, NULL, NULL);
--		    goto skip_ns;
--		} else {
--		    uri = xmlParseURI((const char *) URL);
--		    if (uri == NULL) {
--			xmlNsErr(ctxt, XML_WAR_NS_URI,
--			     "xmlns:%s: '%s' is not a valid URI\n",
--					   attname, URL, NULL);
--		    } else {
--			if ((ctxt->pedantic) && (uri->scheme == NULL)) {
--			    xmlNsWarn(ctxt, XML_WAR_NS_URI_RELATIVE,
--				      "xmlns:%s: URI %s is not absolute\n",
--				      attname, URL, NULL);
--			}
--			xmlFreeURI(uri);
--		    }
--		}
--
--		/*
--		 * check that it's not a defined namespace
--		 */
--		for (j = 1;j <= nbNs;j++)
--		    if (ctxt->nsTab[ctxt->nsNr - 2 * j] == attname)
--			break;
--		if (j <= nbNs)
--		    xmlErrAttributeDup(ctxt, aprefix, attname);
--		else
--		    if (nsPush(ctxt, attname, URL) > 0) nbNs++;
--skip_ns:
--		if ((attvalue != NULL) && (alloc != 0)) {
--		    xmlFree(attvalue);
--		    attvalue = NULL;
--		}
--		if ((RAW == '>') || (((RAW == '/') && (NXT(1) == '>'))))
--		    break;
--		if (!IS_BLANK_CH(RAW)) {
--		    xmlFatalErrMsg(ctxt, XML_ERR_SPACE_REQUIRED,
--				   "attributes construct error\n");
--		    break;
--		}
--		SKIP_BLANKS;
--		if ((ctxt->input->base != base) || (inputNr != ctxt->inputNr))
--		    goto base_changed;
--		continue;
--	    }
-+                    if (attname != ctxt->str_xml) {
-+                        xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
-+                     "xml namespace URI cannot be the default namespace\n",
-+                                 NULL, NULL, NULL);
-+                    }
-+                    goto next_attr;
-+                }
-+                if ((len == 29) &&
-+                    (xmlStrEqual(URL,
-+                             BAD_CAST "http://www.w3.org/2000/xmlns/"))) {
-+                    xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
-+                         "reuse of the xmlns namespace name is forbidden\n",
-+                             NULL, NULL, NULL);
-+                    goto next_attr;
-+                }
-+            }
-+            /*
-+             * check that it's not a defined namespace
-+             */
-+            for (j = 1;j <= nbNs;j++)
-+                if (ctxt->nsTab[ctxt->nsNr - 2 * j] == NULL)
-+                    break;
-+            if (j <= nbNs)
-+                xmlErrAttributeDup(ctxt, NULL, attname);
-+            else
-+                if (nsPush(ctxt, NULL, URL) > 0) nbNs++;
-+
-+        } else if (aprefix == ctxt->str_xmlns) {
-+            const xmlChar *URL = xmlDictLookup(ctxt->dict, attvalue, len);
-+            xmlURIPtr uri;
-+
-+            if (attname == ctxt->str_xml) {
-+                if (URL != ctxt->str_xml_ns) {
-+                    xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
-+                             "xml namespace prefix mapped to wrong URI\n",
-+                             NULL, NULL, NULL);
-+                }
-+                /*
-+                 * Do not keep a namespace definition node
-+                 */
-+                goto next_attr;
-+            }
-+            if (URL == ctxt->str_xml_ns) {
-+                if (attname != ctxt->str_xml) {
-+                    xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
-+                             "xml namespace URI mapped to wrong prefix\n",
-+                             NULL, NULL, NULL);
-+                }
-+                goto next_attr;
-+            }
-+            if (attname == ctxt->str_xmlns) {
-+                xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
-+                         "redefinition of the xmlns prefix is forbidden\n",
-+                         NULL, NULL, NULL);
-+                goto next_attr;
-+            }
-+            if ((len == 29) &&
-+                (xmlStrEqual(URL,
-+                             BAD_CAST "http://www.w3.org/2000/xmlns/"))) {
-+                xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
-+                         "reuse of the xmlns namespace name is forbidden\n",
-+                         NULL, NULL, NULL);
-+                goto next_attr;
-+            }
-+            if ((URL == NULL) || (URL[0] == 0)) {
-+                xmlNsErr(ctxt, XML_NS_ERR_XML_NAMESPACE,
-+                         "xmlns:%s: Empty XML namespace is not allowed\n",
-+                              attname, NULL, NULL);
-+                goto next_attr;
-+            } else {
-+                uri = xmlParseURI((const char *) URL);
-+                if (uri == NULL) {
-+                    xmlNsErr(ctxt, XML_WAR_NS_URI,
-+                         "xmlns:%s: '%s' is not a valid URI\n",
-+                                       attname, URL, NULL);
-+                } else {
-+                    if ((ctxt->pedantic) && (uri->scheme == NULL)) {
-+                        xmlNsWarn(ctxt, XML_WAR_NS_URI_RELATIVE,
-+                                  "xmlns:%s: URI %s is not absolute\n",
-+                                  attname, URL, NULL);
-+                    }
-+                    xmlFreeURI(uri);
-+                }
-+            }
- 
--	    /*
--	     * Add the pair to atts
--	     */
--	    if ((atts == NULL) || (nbatts + 5 > maxatts)) {
--	        if (xmlCtxtGrowAttrs(ctxt, nbatts + 5) < 0) {
--		    if (attvalue[len] == 0)
--			xmlFree(attvalue);
--		    goto failed;
--		}
--	        maxatts = ctxt->maxatts;
--		atts = ctxt->atts;
--	    }
--	    ctxt->attallocs[nratts++] = alloc;
--	    atts[nbatts++] = attname;
--	    atts[nbatts++] = aprefix;
--	    atts[nbatts++] = NULL; /* the URI will be fetched later */
--	    atts[nbatts++] = attvalue;
--	    attvalue += len;
--	    atts[nbatts++] = attvalue;
--	    /*
--	     * tag if some deallocation is needed
--	     */
--	    if (alloc != 0) attval = 1;
--	} else {
--	    if ((attvalue != NULL) && (attvalue[len] == 0))
--		xmlFree(attvalue);
--	}
-+            /*
-+             * check that it's not a defined namespace
-+             */
-+            for (j = 1;j <= nbNs;j++)
-+                if (ctxt->nsTab[ctxt->nsNr - 2 * j] == attname)
-+                    break;
-+            if (j <= nbNs)
-+                xmlErrAttributeDup(ctxt, aprefix, attname);
-+            else
-+                if (nsPush(ctxt, attname, URL) > 0) nbNs++;
-+
-+        } else {
-+            /*
-+             * Add the pair to atts
-+             */
-+            if ((atts == NULL) || (nbatts + 5 > maxatts)) {
-+                if (xmlCtxtGrowAttrs(ctxt, nbatts + 5) < 0) {
-+                    goto next_attr;
-+                }
-+                maxatts = ctxt->maxatts;
-+                atts = ctxt->atts;
-+            }
-+            ctxt->attallocs[nratts++] = alloc;
-+            atts[nbatts++] = attname;
-+            atts[nbatts++] = aprefix;
-+            /*
-+             * The namespace URI field is used temporarily to point at the
-+             * base of the current input buffer for non-alloced attributes.
-+             * When the input buffer is reallocated, all the pointers become
-+             * invalid, but they can be reconstructed later.
-+             */
-+            if (alloc)
-+                atts[nbatts++] = NULL;
-+            else
-+                atts[nbatts++] = ctxt->input->base;
-+            atts[nbatts++] = attvalue;
-+            attvalue += len;
-+            atts[nbatts++] = attvalue;
-+            /*
-+             * tag if some deallocation is needed
-+             */
-+            if (alloc != 0) attval = 1;
-+            attvalue = NULL; /* moved into atts */
-+        }
- 
--failed:
-+next_attr:
-+        if ((attvalue != NULL) && (alloc != 0)) {
-+            xmlFree(attvalue);
-+            attvalue = NULL;
-+        }
- 
- 	GROW
-         if (ctxt->instate == XML_PARSER_EOF)
-             break;
--	if ((ctxt->input->base != base) || (inputNr != ctxt->inputNr))
--	    goto base_changed;
- 	if ((RAW == '>') || (((RAW == '/') && (NXT(1) == '>'))))
- 	    break;
- 	if (!IS_BLANK_CH(RAW)) {
-@@ -9646,8 +9610,20 @@ failed:
- 	    break;
- 	}
-         GROW;
--	if ((ctxt->input->base != base) || (inputNr != ctxt->inputNr))
--	    goto base_changed;
-+    }
-+
-+    /* Reconstruct attribute value pointers. */
-+    for (i = 0, j = 0; j < nratts; i += 5, j++) {
-+        if (atts[i+2] != NULL) {
-+            /*
-+             * Arithmetic on dangling pointers is technically undefined
-+             * behavior, but well...
-+             */
-+            ptrdiff_t offset = ctxt->input->base - atts[i+2];
-+            atts[i+2]  = NULL;    /* Reset repurposed namespace URI */
-+            atts[i+3] += offset;  /* value */
-+            atts[i+4] += offset;  /* valuend */
-+        }
-     }
- 
-     /*
-@@ -9804,34 +9780,6 @@ failed:
-     }
- 
-     return(localname);
--
--base_changed:
--    /*
--     * the attribute strings are valid iif the base didn't changed
--     */
--    if (attval != 0) {
--	for (i = 3,j = 0; j < nratts;i += 5,j++)
--	    if ((ctxt->attallocs[j] != 0) && (atts[i] != NULL))
--	        xmlFree((xmlChar *) atts[i]);
--    }
--
--    /*
--     * We can't switch from one entity to another in the middle
--     * of a start tag
--     */
--    if (inputNr != ctxt->inputNr) {
--        xmlFatalErrMsg(ctxt, XML_ERR_ENTITY_BOUNDARY,
--		    "Start tag doesn't start and stop in the same entity\n");
--	return(NULL);
--    }
--
--    ctxt->input->cur = ctxt->input->base + cur;
--    ctxt->input->line = oldline;
--    ctxt->input->col = oldcol;
--    if (ctxt->wellFormed == 1) {
--	goto reparse;
--    }
--    return(NULL);
- }
- 
- /**
-diff --git a/result/errors/759398.xml.err b/result/errors/759398.xml.err
-index e08d9bf..f6036a3 100644
---- a/result/errors/759398.xml.err
-+++ b/result/errors/759398.xml.err
-@@ -1,9 +1,12 @@
- ./test/errors/759398.xml:210: parser error : StartTag: invalid element name
- need to worry about parsers whi<! don't expand PErefs finding
-                                 ^
--./test/errors/759398.xml:309: parser error : Opening and ending tag mismatch: spec line 50 and termdef
-+./test/errors/759398.xml:309: parser error : Opening and ending tag mismatch: №№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№!
 №№№
 №№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№�!
 ��№№�
 ��№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№�!
 �№№�
 �№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№№m line 308 and termdef
- and provide access to their content and structure.</termdef> <termdef
-                                                             ^
--./test/errors/759398.xml:309: parser error : Extra content at the end of the document
--and provide access to their content and structure.</termdef> <termdef
--                                                             ^
-+./test/errors/759398.xml:314: parser error : Opening and ending tag mismatch: spec line 50 and p
-+data and the information it must provide to the application.</p>
-+                                                                ^
-+./test/errors/759398.xml:316: parser error : Extra content at the end of the document
-+<div2 id='sec-origin-goals'>
-+^
-diff --git a/result/errors/attr1.xml.err b/result/errors/attr1.xml.err
-index 4f08538..c4c4fc8 100644
---- a/result/errors/attr1.xml.err
-+++ b/result/errors/attr1.xml.err
-@@ -1,6 +1,9 @@
- ./test/errors/attr1.xml:2: parser error : AttValue: ' expected
- 
- ^
--./test/errors/attr1.xml:1: parser error : Extra content at the end of the document
--<foo foo="oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
-- ^
-+./test/errors/attr1.xml:2: parser error : attributes construct error
-+
-+^
-+./test/errors/attr1.xml:2: parser error : Couldn't find end of Start Tag foo line 1
-+
-+^
-diff --git a/result/errors/attr2.xml.err b/result/errors/attr2.xml.err
-index c8a9c7d..77e342e 100644
---- a/result/errors/attr2.xml.err
-+++ b/result/errors/attr2.xml.err
-@@ -1,6 +1,9 @@
- ./test/errors/attr2.xml:2: parser error : AttValue: ' expected
- 
- ^
--./test/errors/attr2.xml:1: parser error : Extra content at the end of the document
--<foo foo=">ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
-- ^
-+./test/errors/attr2.xml:2: parser error : attributes construct error
-+
-+^
-+./test/errors/attr2.xml:2: parser error : Couldn't find end of Start Tag foo line 1
-+
-+^
-diff --git a/result/errors/name2.xml.err b/result/errors/name2.xml.err
-index a6649a1..8a6acee 100644
---- a/result/errors/name2.xml.err
-+++ b/result/errors/name2.xml.err
-@@ -1,6 +1,9 @@
- ./test/errors/name2.xml:2: parser error : Specification mandate value for attribute foooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo!
 ooooooooo
 oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo!
 ooooooooo
 oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo!
 ooooooooo
 oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo!
 ooooooooo
 oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo!
 ooooooooo
 ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
- 
- ^
--./test/errors/name2.xml:1: parser error : Extra content at the end of the document
--<foo foooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
-- ^
-+./test/errors/name2.xml:2: parser error : attributes construct error
-+
-+^
-+./test/errors/name2.xml:2: parser error : Couldn't find end of Start Tag foo line 1
-+
-+^
diff --git a/meta/recipes-core/libxml/libxml2/libxml2-fix_node_comparison.patch b/meta/recipes-core/libxml/libxml2/libxml2-fix_node_comparison.patch
deleted file mode 100644
index 65f6bef..0000000
--- a/meta/recipes-core/libxml/libxml2/libxml2-fix_node_comparison.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-libxml2-2.9.4: Fix comparison with root node in xmlXPathCmpNodes and NULL pointer deref in XPointer
-
-xpath:
- - Check for errors after evaluating first operand.
- - Add sanity check for empty stack.
- - Include comparation in changes from xmlXPathCmpNodesExt to xmlXPathCmpNodes
-
-Upstream-Status: Backport
- - [https://git.gnome.org/browse/libxml2/commit/?id=c1d1f7121194036608bf555f08d3062a36fd344b]
- - [https://git.gnome.org/browse/libxml2/commit/?id=a005199330b86dada19d162cae15ef9bdcb6baa8]
-CVE: CVE-2016-5131
-Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
-
-diff --git a/result/XPath/xptr/viderror b/result/XPath/xptr/viderror
-new file mode 100644
-index 0000000..d589882
---- /dev/null
-+++ b/result/XPath/xptr/viderror
-@@ -0,0 +1,4 @@
-+
-+========================
-+Expression: xpointer(non-existing-fn()/range-to(id('chapter2')))
-+Object is empty (NULL)
-diff --git a/test/XPath/xptr/viderror b/test/XPath/xptr/viderror
-new file mode 100644
-index 0000000..da8c53b
---- /dev/null
-+++ b/test/XPath/xptr/viderror
-@@ -0,0 +1 @@
-+xpointer(non-existing-fn()/range-to(id('chapter2')))
-diff --git a/xpath.c b/xpath.c
-index 113bce6..d992841 100644
---- a/xpath.c
-+++ b/xpath.c
-@@ -3342,13 +3342,13 @@ xmlXPathCmpNodes(xmlNodePtr node1, xmlNodePtr node2) {
-      * compute depth to root
-      */
-     for (depth2 = 0, cur = node2;cur->parent != NULL;cur = cur->parent) {
--	if (cur == node1)
-+	if (cur->parent == node1)
- 	    return(1);
- 	depth2++;
-     }
-     root = cur;
-     for (depth1 = 0, cur = node1;cur->parent != NULL;cur = cur->parent) {
--	if (cur == node2)
-+	if (cur->parent == node2)
- 	    return(-1);
- 	depth1++;
-     }
-@@ -14005,9 +14005,14 @@ xmlXPathCompOpEval(xmlXPathParserContextPtr ctxt, xmlXPathStepOpPtr op)
-                 xmlNodeSetPtr oldset;
-                 int i, j;
- 
--                if (op->ch1 != -1)
-+                if (op->ch1 != -1) {
-                     total +=
-                         xmlXPathCompOpEval(ctxt, &comp->steps[op->ch1]);
-+                    CHECK_ERROR0;
-+                }
-+                if (ctxt->value == NULL) {
-+                    XP_ERROR0(XPATH_INVALID_OPERAND);
-+                }
-                 if (op->ch2 == -1)
-                     return (total);
- 
diff --git a/meta/recipes-core/libxml/libxml2/runtest.patch b/meta/recipes-core/libxml/libxml2/runtest.patch
index 6e56857..e747808 100644
--- a/meta/recipes-core/libxml/libxml2/runtest.patch
+++ b/meta/recipes-core/libxml/libxml2/runtest.patch
@@ -2,13 +2,13 @@ Add 'install-ptest' rule.
 Print a standard result line for each test.
 
 Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
-Signed-off-by: Andrej Valek <andrej.valek@enea.com>
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
 Upstream-Status: Backport
 
 diff -uNr a/Makefile.am b/Makefile.am
---- a/Makefile.am	2016-05-22 03:49:02.000000000 +0200
-+++ b/Makefile.am	2017-06-14 10:38:43.381305385 +0200
-@@ -202,10 +202,24 @@
+--- a/Makefile.am	2017-08-28 15:01:14.000000000 +0200
++++ b/Makefile.am	2017-09-05 08:06:05.752287323 +0200
+@@ -202,6 +202,15 @@
  #testOOM_DEPENDENCIES = $(DEPS)
  #testOOM_LDADD= $(LDADDS)
  
@@ -21,28 +21,10 @@ diff -uNr a/Makefile.am b/Makefile.am
 +	cp Makefile $(DESTDIR)
 +	sed -i -e 's|^Makefile:|_Makefile:|' $(DESTDIR)/Makefile
 +
- runtests:
+ runtests: runtest$(EXEEXT) testrecurse$(EXEEXT) testapi$(EXEEXT) \
+           testchar$(EXEEXT) testdict$(EXEEXT) runxmlconf$(EXEEXT)
  	[ -d test   ] || $(LN_S) $(srcdir)/test   .
- 	[ -d result ] || $(LN_S) $(srcdir)/result .
--	$(CHECKER) ./runtest$(EXEEXT) && $(CHECKER) ./testrecurse$(EXEEXT) &&$(CHECKER) ./testapi$(EXEEXT) && $(CHECKER) ./testchar$(EXEEXT)&& $(CHECKER) ./testdict$(EXEEXT) && $(CHECKER) ./runxmlconf$(EXEEXT)
-+	$(CHECKER) ./runtest$(EXEEXT) && \
-+	    $(CHECKER) ./testrecurse$(EXEEXT) && \
-+	    ASAN_OPTIONS="$$ASAN_OPTIONS:detect_leaks=0" $(CHECKER) ./testapi$(EXEEXT) && \
-+	    $(CHECKER) ./testchar$(EXEEXT) && \
-+	    $(CHECKER) ./testdict$(EXEEXT) && \
-+	    $(CHECKER) ./runxmlconf$(EXEEXT)
- 	@(if [ "$(PYTHON_SUBDIR)" != "" ] ; then cd python ; \
- 	    $(MAKE) tests ; fi)
- 
-@@ -229,7 +243,7 @@
- 
- APItests: testapi$(EXEEXT)
- 	@echo "## Running the API regression tests this may take a little while"
--	-@($(CHECKER) $(top_builddir)/testapi -q)
-+	-@(ASAN_OPTIONS="$$ASAN_OPTIONS:detect_leaks=0" $(CHECKER) $(top_builddir)/testapi -q)
- 
- HTMLtests : testHTML$(EXEEXT)
- 	@(echo > .memdump)
+
 diff -uNr a/runsuite.c b/runsuite.c
 --- a/runsuite.c	2013-04-12 16:17:11.462823238 +0200
 +++ b/runsuite.c	2013-04-17 14:07:24.352693211 +0200
diff --git a/meta/recipes-core/libxml/libxml2_2.9.4.bb b/meta/recipes-core/libxml/libxml2_2.9.5.bb
similarity index 85%
rename from meta/recipes-core/libxml/libxml2_2.9.4.bb
rename to meta/recipes-core/libxml/libxml2_2.9.5.bb
index 107539b..16391c3 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.4.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.5.bb
@@ -19,21 +19,11 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://run-ptest \
            file://python-sitepackages-dir.patch \
            file://libxml-m4-use-pkgconfig.patch \
-           file://libxml2-fix_node_comparison.patch \
-           file://libxml2-CVE-2016-5131.patch \
-           file://libxml2-CVE-2016-4658.patch \
-           file://libxml2-fix_NULL_pointer_derefs.patch \
-           file://libxml2-fix_and_simplify_xmlParseStartTag2.patch \
-           file://libxml2-CVE-2017-9047_CVE-2017-9048.patch \
-           file://libxml2-CVE-2017-9049_CVE-2017-9050.patch \
-           file://libxml2-CVE-2017-5969.patch \
-           file://libxml2-CVE-2017-0663.patch \
-           file://libxml2-CVE-2017-8872.patch \
            file://0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch \
            "
 
-SRC_URI[libtar.md5sum] = "ae249165c173b1ff386ee8ad676815f5"
-SRC_URI[libtar.sha256sum] = "ffb911191e509b966deb55de705387f14156e1a56b21824357cdf0053233633c"
+SRC_URI[libtar.md5sum] = "5ce0da9bdaa267b40c4ca36d35363b8b"
+SRC_URI[libtar.sha256sum] = "4031c1ecee9ce7ba4f313e91ef6284164885cdb69937a123f6a83bb6a72dcd38"
 SRC_URI[testtar.md5sum] = "ae3d1ebe000a3972afa104ca7f0e1b4a"
 SRC_URI[testtar.sha256sum] = "96151685cec997e1f9f3387e3626d61e6284d4d6e66e0e440c209286c03e9cc7"
 
-- 
2.1.4



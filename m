Return-Path: <andrej.valek@siemens.com>
X-Greylist: delayed 415 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 12 Dec 2016 13:27:20 UTC
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 7325570031
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 13:27:19 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id uBCDKQho021252
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 14:20:26 +0100
Received: from dev.sbt.siemens.com ([163.242.50.172])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id uBCDKQti026053;
	Mon, 12 Dec 2016 14:20:26 +0100
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id 2CDE4108768;
	Mon, 12 Dec 2016 14:20:26 +0100 (CET)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Dec 2016 14:20:19 +0100
Message-Id: <1481548821-15878-1-git-send-email-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/3] libxml2: Necessary changes before fixing CVE-2016-5131 Fix comaparation with root node in xmlXPathCmpNodes and NULL pointer deref in XPointer
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
X-List-Received-Date: Mon, 12 Dec 2016 13:27:20 -0000

xpath:
 - Check for errors after evaluating first operand.
 - Add sanity check for empty stack.
 - Include comparation in changes from xmlXPathCmpNodesExt to xmlXPathCmpNodes

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../libxml2/libxml2-fix_node_comparison.patch      | 67 ++++++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.4.bb          |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-fix_node_comparison.patch

diff --git a/meta/recipes-core/libxml/libxml2/libxml2-fix_node_comparison.patch b/meta/recipes-core/libxml/libxml2/libxml2-fix_node_comparison.patch
new file mode 100644
index 0000000..11718bb
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/libxml2-fix_node_comparison.patch
@@ -0,0 +1,67 @@
+libxml2-2.9.4: Fix comparison with root node in xmlXPathCmpNodes and NULL pointer deref in XPointer
+
+xpath:
+ - Check for errors after evaluating first operand.
+ - Add sanity check for empty stack.
+ - Include comparation in changes from xmlXPathCmpNodesExt to xmlXPathCmpNodes
+
+Upstream-Status: Backported
+ - [https://git.gnome.org/browse/libxml2/commit/?id=c1d1f7121194036608bf555f08d3062a36fd344b]
+ - [https://git.gnome.org/browse/libxml2/commit/?id=a005199330b86dada19d162cae15ef9bdcb6baa8]
+CVE: necessary changes for fixing CVE-2016-5131
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
+
+diff --git a/result/XPath/xptr/viderror b/result/XPath/xptr/viderror
+new file mode 100644
+index 0000000..d589882
+--- /dev/null
++++ b/result/XPath/xptr/viderror
+@@ -0,0 +1,4 @@
++
++========================
++Expression: xpointer(non-existing-fn()/range-to(id('chapter2')))
++Object is empty (NULL)
+diff --git a/test/XPath/xptr/viderror b/test/XPath/xptr/viderror
+new file mode 100644
+index 0000000..da8c53b
+--- /dev/null
++++ b/test/XPath/xptr/viderror
+@@ -0,0 +1 @@
++xpointer(non-existing-fn()/range-to(id('chapter2')))
+diff --git a/xpath.c b/xpath.c
+index 113bce6..d992841 100644
+--- a/xpath.c
++++ b/xpath.c
+@@ -3342,13 +3342,13 @@ xmlXPathCmpNodes(xmlNodePtr node1, xmlNodePtr node2) {
+      * compute depth to root
+      */
+     for (depth2 = 0, cur = node2;cur->parent != NULL;cur = cur->parent) {
+-	if (cur == node1)
++	if (cur->parent == node1)
+ 	    return(1);
+ 	depth2++;
+     }
+     root = cur;
+     for (depth1 = 0, cur = node1;cur->parent != NULL;cur = cur->parent) {
+-	if (cur == node2)
++	if (cur->parent == node2)
+ 	    return(-1);
+ 	depth1++;
+     }
+@@ -14005,9 +14005,14 @@ xmlXPathCompOpEval(xmlXPathParserContextPtr ctxt, xmlXPathStepOpPtr op)
+                 xmlNodeSetPtr oldset;
+                 int i, j;
+ 
+-                if (op->ch1 != -1)
++                if (op->ch1 != -1) {
+                     total +=
+                         xmlXPathCompOpEval(ctxt, &comp->steps[op->ch1]);
++                    CHECK_ERROR0;
++                }
++                if (ctxt->value == NULL) {
++                    XP_ERROR0(XPATH_INVALID_OPERAND);
++                }
+                 if (op->ch2 == -1)
+                     return (total);
+ 
diff --git a/meta/recipes-core/libxml/libxml2_2.9.4.bb b/meta/recipes-core/libxml/libxml2_2.9.4.bb
index 1fed90b..66a8940 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.4.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.4.bb
@@ -19,6 +19,7 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://run-ptest \
            file://python-sitepackages-dir.patch \
            file://libxml-m4-use-pkgconfig.patch \
+           file://libxml2-fix_node_comparison.patch \
            file://libxml2-CVE-2016-5131.patch \
           "
 
-- 
2.1.4



Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id E26D071A80
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 13:45:25 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id uBCDKTQe007101
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 14:20:29 +0100
Received: from dev.sbt.siemens.com ([163.242.50.172])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id uBCDKSgw026253;
	Mon, 12 Dec 2016 14:20:29 +0100
Received: from dev.sbt.siemens.com (localhost [127.0.0.1])
	by dev.sbt.siemens.com (Postfix) with ESMTP id 2985A108768;
	Mon, 12 Dec 2016 14:20:29 +0100 (CET)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Dec 2016 14:20:21 +0100
Message-Id: <1481548821-15878-3-git-send-email-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1481548821-15878-1-git-send-email-andrej.valek@siemens.com>
References: <1481548821-15878-1-git-send-email-andrej.valek@siemens.com>
Subject: [PATCH 3/3] libxml2: Fix more NULL pointer derefs
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
X-List-Received-Date: Mon, 12 Dec 2016 13:45:26 -0000

The NULL pointer dereferencing could produced some
security problems.
This is a preventive security fix.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 .../libxml2/libxml2-fix_NULL_pointer_derefs.patch  | 46 ++++++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.4.bb          |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-fix_NULL_pointer_derefs.patch

diff --git a/meta/recipes-core/libxml/libxml2/libxml2-fix_NULL_pointer_derefs.patch b/meta/recipes-core/libxml/libxml2/libxml2-fix_NULL_pointer_derefs.patch
new file mode 100644
index 0000000..83552ca
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/libxml2-fix_NULL_pointer_derefs.patch
@@ -0,0 +1,46 @@
+libxml2-2.9.4: Fix more NULL pointer derefs
+
+xpointer: Fix more NULL pointer derefs
+
+Upstream-Status: Backported [https://git.gnome.org/browse/libxml2/commit/?id=e905f08123e4a6e7731549e6f09dadff4cab65bd]
+CVE: -
+Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
+Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
+
+diff --git a/xpointer.c b/xpointer.c
+index 676c510..074db24 100644
+--- a/xpointer.c
++++ b/xpointer.c
+@@ -555,7 +555,7 @@ xmlXPtrNewRangeNodeObject(xmlNodePtr start, xmlXPathObjectPtr end) {
+ 	    /*
+ 	     * Empty set ...
+ 	     */
+-	    if (end->nodesetval->nodeNr <= 0)
++	    if ((end->nodesetval == NULL) || (end->nodesetval->nodeNr <= 0))
+ 		return(NULL);
+ 	    break;
+ 	default:
+@@ -1400,7 +1400,7 @@ xmlXPtrEval(const xmlChar *str, xmlXPathContextPtr ctx) {
+ 		     */
+ 		    xmlNodeSetPtr set;
+ 		    set = tmp->nodesetval;
+-		    if ((set->nodeNr != 1) ||
++		    if ((set == NULL) || (set->nodeNr != 1) ||
+ 			(set->nodeTab[0] != (xmlNodePtr) ctx->doc))
+ 			stack++;
+ 		} else
+@@ -2073,9 +2073,11 @@ xmlXPtrRangeFunction(xmlXPathParserContextPtr ctxt, int nargs) {
+ 	xmlXPathFreeObject(set);
+         XP_ERROR(XPATH_MEMORY_ERROR);
+     }
+-    for (i = 0;i < oldset->locNr;i++) {
+-	xmlXPtrLocationSetAdd(newset,
+-		xmlXPtrCoveringRange(ctxt, oldset->locTab[i]));
++    if (oldset != NULL) {
++	for (i = 0;i < oldset->locNr;i++) {
++	  xmlXPtrLocationSetAdd(newset,
++		  xmlXPtrCoveringRange(ctxt, oldset->locTab[i]));
++      }
+     }
+ 
+     /*
diff --git a/meta/recipes-core/libxml/libxml2_2.9.4.bb b/meta/recipes-core/libxml/libxml2_2.9.4.bb
index a1d1e9e..ba08c9c 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.4.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.4.bb
@@ -22,6 +22,7 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://libxml2-fix_node_comparison.patch \
            file://libxml2-CVE-2016-5131.patch \
            file://libxml2-CVE-2016-4658.patch \
+           file://libxml2-fix_NULL_pointer_derefs.patch \
           "
 
 SRC_URI[libtar.md5sum] = "ae249165c173b1ff386ee8ad676815f5"
-- 
2.1.4



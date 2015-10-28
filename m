Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (unknown [64.129.254.146])
	by mail.openembedded.org (Postfix) with ESMTP id 812BA60232
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Oct 2015 05:31:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id t9S5Vo13007724
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 22:31:51 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 27 Oct 2015 22:31:50 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Oct 2015 13:22:53 +0800
Message-ID: <484dd4883f19d258e29e343f1b0735d2940d7424.1446009435.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <cover.1446009435.git.kai.kang@windriver.com>
References: <cover.1446009435.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libxml2: fix unsafe memory access
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
X-List-Received-Date: Wed, 28 Oct 2015 05:31:52 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Backport patch from:

https://bugzilla.gnome.org/show_bug.cgi?id=746048

to fix valgrind errors and unsafe memory access.

Fix the indentation by the way.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../libxml2/libxml2-fix-unsafe-memory-access.patch | 97 ++++++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.2.bb          |  3 +-
 2 files changed, 99 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/libxml2-fix-unsafe-memory-access.patch

diff --git a/meta/recipes-core/libxml/libxml2/libxml2-fix-unsafe-memory-access.patch b/meta/recipes-core/libxml/libxml2/libxml2-fix-unsafe-memory-access.patch
new file mode 100644
index 0000000..b583032
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/libxml2-fix-unsafe-memory-access.patch
@@ -0,0 +1,97 @@
+Upstream-Status: Backport
+
+Backport from
+
+https://bugzilla.gnome.org/show_bug.cgi?id=746048
+
+to fix unsafe memory access.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff --git a/HTMLparser.c b/HTMLparser.c
+index d329d3b..6f81424 100644
+--- a/HTMLparser.c
++++ b/HTMLparser.c
+@@ -3245,13 +3245,20 @@ htmlParseComment(htmlParserCtxtPtr ctxt) {
+ 	ctxt->instate = state;
+ 	return;
+     }
++    if ((ctxt->input->end - ctxt->input->cur) < 3) {
++        ctxt->instate = XML_PARSER_EOF;
++        htmlParseErr(ctxt, XML_ERR_COMMENT_NOT_FINISHED,
++                     "Comment not terminated\n", NULL, NULL);
++        xmlFree(buf);
++        return;
++    }
+     q = CUR_CHAR(ql);
+     NEXTL(ql);
+     r = CUR_CHAR(rl);
+     NEXTL(rl);
+     cur = CUR_CHAR(l);
+     len = 0;
+-    while (IS_CHAR(cur) &&
++    while (((ctxt->input->end - ctxt->input->cur) > 0) && IS_CHAR(cur) &&
+            ((cur != '>') ||
+ 	    (r != '-') || (q != '-'))) {
+ 	if (len + 5 >= size) {
+@@ -3281,7 +3288,7 @@ htmlParseComment(htmlParserCtxtPtr ctxt) {
+ 	}
+     }
+     buf[len] = 0;
+-    if (!IS_CHAR(cur)) {
++    if (!(ctxt->input->end - ctxt->input->cur) || !IS_CHAR(cur)) {
+ 	htmlParseErr(ctxt, XML_ERR_COMMENT_NOT_FINISHED,
+ 	             "Comment not terminated \n<!--%.50s\n", buf, NULL);
+ 	xmlFree(buf);
+@@ -4465,6 +4472,7 @@ htmlParseContentInternal(htmlParserCtxtPtr ctxt) {
+     depth = ctxt->nameNr;
+     while (1) {
+ 	long cons = ctxt->nbChars;
++    long rem = ctxt->input->end - ctxt->input->cur;
+ 
+         GROW;
+ 
+@@ -4540,7 +4548,7 @@ htmlParseContentInternal(htmlParserCtxtPtr ctxt) {
+ 	    /*
+ 	     * Sometimes DOCTYPE arrives in the middle of the document
+ 	     */
+-	    if ((CUR == '<') && (NXT(1) == '!') &&
++	    if ((rem >= 9) && (CUR == '<') && (NXT(1) == '!') &&
+ 		(UPP(2) == 'D') && (UPP(3) == 'O') &&
+ 		(UPP(4) == 'C') && (UPP(5) == 'T') &&
+ 		(UPP(6) == 'Y') && (UPP(7) == 'P') &&
+@@ -4554,7 +4562,7 @@ htmlParseContentInternal(htmlParserCtxtPtr ctxt) {
+ 	    /*
+ 	     * First case :  a comment
+ 	     */
+-	    if ((CUR == '<') && (NXT(1) == '!') &&
++	    if ((rem >= 4) && (CUR == '<') && (NXT(1) == '!') &&
+ 		(NXT(2) == '-') && (NXT(3) == '-')) {
+ 		htmlParseComment(ctxt);
+ 	    }
+@@ -4562,14 +4570,14 @@ htmlParseContentInternal(htmlParserCtxtPtr ctxt) {
+ 	    /*
+ 	     * Second case : a Processing Instruction.
+ 	     */
+-	    else if ((CUR == '<') && (NXT(1) == '?')) {
++	    else if ((rem >= 2) && (CUR == '<') && (NXT(1) == '?')) {
+ 		htmlParsePI(ctxt);
+ 	    }
+ 
+ 	    /*
+ 	     * Third case :  a sub-element.
+ 	     */
+-	    else if (CUR == '<') {
++	    else if ((rem >= 1) && (CUR == '<')) {
+ 		htmlParseElementInternal(ctxt);
+ 		if (currentNode != NULL) xmlFree(currentNode);
+ 
+@@ -4581,7 +4589,7 @@ htmlParseContentInternal(htmlParserCtxtPtr ctxt) {
+ 	     * Fourth case : a reference. If if has not been resolved,
+ 	     *    parsing returns it's Name, create the node
+ 	     */
+-	    else if (CUR == '&') {
++	    else if ((rem >= 1) && (CUR == '&')) {
+ 		htmlParseReference(ctxt);
+ 	    }
+ 
diff --git a/meta/recipes-core/libxml/libxml2_2.9.2.bb b/meta/recipes-core/libxml/libxml2_2.9.2.bb
index 79a395c..4cafc87 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.2.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.2.bb
@@ -2,7 +2,8 @@ require libxml2.inc
 
 SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;name=testtar \
             file://72a46a519ce7326d9a00f0b6a7f2a8e958cd1675.patch \
-	    file://0001-threads-Define-pthread-definitions-for-glibc-complia.patch \
+            file://0001-threads-Define-pthread-definitions-for-glibc-complia.patch \
+            file://libxml2-fix-unsafe-memory-access.patch \
 	   "
 
 SRC_URI[libtar.md5sum] = "9e6a9aca9d155737868b3dc5fd82f788"
-- 
2.6.1



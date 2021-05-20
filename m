Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.1267.1621547154926961441
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 14:45:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: ttasciog@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 14KLjrPL029895
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 14:45:53 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 20 May 2021 14:45:53 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Thu, 20 May 2021 14:45:53 -0700
Received: by yow-lpggp3.wrs.com (Postfix, from userid 21862)
	id CE8562016B; Thu, 20 May 2021 17:45:52 -0400 (EDT)
From: "Tony Tascioglu" <tony.tascioglu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>,
        Tony Tascioglu
	<tony.tascioglu@windriver.com>
Subject: [hardknott][PATCH 1/2] libxml2: Fix CVE-2021-3518
Date: Thu, 20 May 2021 17:45:40 -0400
Message-ID: <20210520214541.19922-1-tony.tascioglu@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch fixes CVE-2021-3518. The fix for the CVE is the
following 3 lines in 1098c30a:

   -                   (cur->children->type != XML_ENTITY_DECL) &&
   -                   (cur->children->type != XML_XINCLUDE_START) &&
   -                   (cur->children->type != XML_XINCLUDE_END)) {
   +                   ((cur->type == XML_DOCUMENT_NODE) ||
   +                    (cur->type == XML_ELEMENT_NODE))) {

This relies on an updated version of xinclude.c from upstream which
also adds several new tests. Those changes are brought in first so
that the CVE patch can be applied cleanly.

The first patch updates xinclude.c and adds the new tests from
upstream, and the second applies the fix for the CVE.

CVE: CVE-2021-3518
Upstream-Status: Backport
[https://gitlab.gnome.org/GNOME/libxml2/-/commit/1098c30a040e72a4654968547f415be4e4c40fe7]

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
---
 .../libxml/libxml2/CVE-2021-3518-0001.patch   | 216 ++++++++++++++++++
 .../libxml/libxml2/CVE-2021-3518-0002.patch   |  45 ++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |   2 +
 3 files changed, 263 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2021-3518-0001.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2021-3518-0002.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2021-3518-0001.patch b/meta/recipes-core/libxml/libxml2/CVE-2021-3518-0001.patch
new file mode 100644
index 0000000000..3d4d3a0237
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2021-3518-0001.patch
@@ -0,0 +1,216 @@
+From 0f9817c75b50a77c6aeb8f36801966fdadad229a Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Wed, 10 Jun 2020 16:34:52 +0200
+Subject: [PATCH 1/2] Don't recurse into xi:include children in
+ xmlXIncludeDoProcess
+
+Otherwise, nested xi:include nodes might result in a use-after-free
+if XML_PARSE_NOXINCNODE is specified.
+
+Found with libFuzzer and ASan.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/0f9817c75b50a77c6aeb8f36801966fdadad229a]
+CVE: CVE-2021-3518
+
+This patch brings in the necessary files to allow the 2nd patch that fixes the CVE to be applied.
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
+---
+ result/XInclude/fallback3.xml     |  8 ++++++++
+ result/XInclude/fallback3.xml.err |  0
+ result/XInclude/fallback3.xml.rdr | 25 +++++++++++++++++++++++++
+ result/XInclude/fallback4.xml     | 10 ++++++++++
+ result/XInclude/fallback4.xml.err |  0
+ result/XInclude/fallback4.xml.rdr | 29 +++++++++++++++++++++++++++++
+ test/XInclude/docs/fallback3.xml  |  9 +++++++++
+ test/XInclude/docs/fallback4.xml  |  7 +++++++
+ xinclude.c                        | 24 ++++++++++--------------
+ 9 files changed, 98 insertions(+), 14 deletions(-)
+ create mode 100644 result/XInclude/fallback3.xml
+ create mode 100644 result/XInclude/fallback3.xml.err
+ create mode 100644 result/XInclude/fallback3.xml.rdr
+ create mode 100644 result/XInclude/fallback4.xml
+ create mode 100644 result/XInclude/fallback4.xml.err
+ create mode 100644 result/XInclude/fallback4.xml.rdr
+ create mode 100644 test/XInclude/docs/fallback3.xml
+ create mode 100644 test/XInclude/docs/fallback4.xml
+
+diff --git a/result/XInclude/fallback3.xml b/result/XInclude/fallback3.xml
+new file mode 100644
+index 0000000..b423551
+--- /dev/null
++++ b/result/XInclude/fallback3.xml
+@@ -0,0 +1,8 @@
++<?xml version="1.0"?>
++<a>
++    <doc xml:base="../ents/something.xml">
++<p>something</p>
++<p>really</p>
++<p>simple</p>
++</doc>
++</a>
+diff --git a/result/XInclude/fallback3.xml.err b/result/XInclude/fallback3.xml.err
+new file mode 100644
+index 0000000..e69de29
+diff --git a/result/XInclude/fallback3.xml.rdr b/result/XInclude/fallback3.xml.rdr
+new file mode 100644
+index 0000000..aa2f137
+--- /dev/null
++++ b/result/XInclude/fallback3.xml.rdr
+@@ -0,0 +1,25 @@
++0 1 a 0 0
++1 14 #text 0 1 
++    
++1 1 doc 0 0
++2 14 #text 0 1 
++
++2 1 p 0 0
++3 3 #text 0 1 something
++2 15 p 0 0
++2 14 #text 0 1 
++
++2 1 p 0 0
++3 3 #text 0 1 really
++2 15 p 0 0
++2 14 #text 0 1 
++
++2 1 p 0 0
++3 3 #text 0 1 simple
++2 15 p 0 0
++2 14 #text 0 1 
++
++1 15 doc 0 0
++1 14 #text 0 1 
++
++0 15 a 0 0
+diff --git a/result/XInclude/fallback4.xml b/result/XInclude/fallback4.xml
+new file mode 100644
+index 0000000..9883fd5
+--- /dev/null
++++ b/result/XInclude/fallback4.xml
+@@ -0,0 +1,10 @@
++<?xml version="1.0"?>
++<a>
++    
++            <doc xml:base="../ents/something.xml">
++<p>something</p>
++<p>really</p>
++<p>simple</p>
++</doc>
++        
++</a>
+diff --git a/result/XInclude/fallback4.xml.err b/result/XInclude/fallback4.xml.err
+new file mode 100644
+index 0000000..e69de29
+diff --git a/result/XInclude/fallback4.xml.rdr b/result/XInclude/fallback4.xml.rdr
+new file mode 100644
+index 0000000..628b951
+--- /dev/null
++++ b/result/XInclude/fallback4.xml.rdr
+@@ -0,0 +1,29 @@
++0 1 a 0 0
++1 14 #text 0 1 
++    
++1 14 #text 0 1 
++            
++1 1 doc 0 0
++2 14 #text 0 1 
++
++2 1 p 0 0
++3 3 #text 0 1 something
++2 15 p 0 0
++2 14 #text 0 1 
++
++2 1 p 0 0
++3 3 #text 0 1 really
++2 15 p 0 0
++2 14 #text 0 1 
++
++2 1 p 0 0
++3 3 #text 0 1 simple
++2 15 p 0 0
++2 14 #text 0 1 
++
++1 15 doc 0 0
++1 14 #text 0 1 
++        
++1 14 #text 0 1 
++
++0 15 a 0 0
+diff --git a/test/XInclude/docs/fallback3.xml b/test/XInclude/docs/fallback3.xml
+new file mode 100644
+index 0000000..0c8b6c9
+--- /dev/null
++++ b/test/XInclude/docs/fallback3.xml
+@@ -0,0 +1,9 @@
++<a>
++    <xi:include href="../ents/something.xml" xmlns:xi="http://www.w3.org/2001/XInclude">
++        <xi:fallback>
++            <xi:include href="c.xml">
++                <xi:fallback>There is no c.xml ... </xi:fallback>
++            </xi:include>
++        </xi:fallback>
++    </xi:include>
++</a>
+diff --git a/test/XInclude/docs/fallback4.xml b/test/XInclude/docs/fallback4.xml
+new file mode 100644
+index 0000000..b500a63
+--- /dev/null
++++ b/test/XInclude/docs/fallback4.xml
+@@ -0,0 +1,7 @@
++<a>
++    <xi:include href="c.xml" xmlns:xi="http://www.w3.org/2001/XInclude">
++        <xi:fallback>
++            <xi:include href="../ents/something.xml"/>
++        </xi:fallback>
++    </xi:include>
++</a>
+diff --git a/xinclude.c b/xinclude.c
+index 001e992..6ec5d31 100644
+--- a/xinclude.c
++++ b/xinclude.c
+@@ -2382,21 +2382,19 @@ xmlXIncludeDoProcess(xmlXIncludeCtxtPtr ctxt, xmlDocPtr doc, xmlNodePtr tree) {
+      * First phase: lookup the elements in the document
+      */
+     cur = tree;
+-    if (xmlXIncludeTestNode(ctxt, cur) == 1)
+-	xmlXIncludePreProcessNode(ctxt, cur);
+     while ((cur != NULL) && (cur != tree->parent)) {
+ 	/* TODO: need to work on entities -> stack */
+-	if ((cur->children != NULL) &&
+-	    (cur->children->type != XML_ENTITY_DECL) &&
+-	    (cur->children->type != XML_XINCLUDE_START) &&
+-	    (cur->children->type != XML_XINCLUDE_END)) {
+-	    cur = cur->children;
+-	    if (xmlXIncludeTestNode(ctxt, cur))
+-		xmlXIncludePreProcessNode(ctxt, cur);
+-	} else if (cur->next != NULL) {
++        if (xmlXIncludeTestNode(ctxt, cur) == 1) {
++            xmlXIncludePreProcessNode(ctxt, cur);
++        } else if ((cur->children != NULL) &&
++                   (cur->children->type != XML_ENTITY_DECL) &&
++                   (cur->children->type != XML_XINCLUDE_START) &&
++                   (cur->children->type != XML_XINCLUDE_END)) {
++            cur = cur->children;
++            continue;
++        }
++	if (cur->next != NULL) {
+ 	    cur = cur->next;
+-	    if (xmlXIncludeTestNode(ctxt, cur))
+-		xmlXIncludePreProcessNode(ctxt, cur);
+ 	} else {
+ 	    if (cur == tree)
+ 	        break;
+@@ -2406,8 +2404,6 @@ xmlXIncludeDoProcess(xmlXIncludeCtxtPtr ctxt, xmlDocPtr doc, xmlNodePtr tree) {
+ 		    break; /* do */
+ 		if (cur->next != NULL) {
+ 		    cur = cur->next;
+-		    if (xmlXIncludeTestNode(ctxt, cur))
+-			xmlXIncludePreProcessNode(ctxt, cur);
+ 		    break; /* do */
+ 		}
+ 	    } while (cur != NULL);
+-- 
+2.23.0
+
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2021-3518-0002.patch b/meta/recipes-core/libxml/libxml2/CVE-2021-3518-0002.patch
new file mode 100644
index 0000000000..de5fc0e8cb
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2021-3518-0002.patch
@@ -0,0 +1,45 @@
+From 1098c30a040e72a4654968547f415be4e4c40fe7 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Thu, 22 Apr 2021 19:26:28 +0200
+Subject: [PATCH 2/2] Fix user-after-free with `xmllint --xinclude --dropdtd`
+
+The --dropdtd option can leave dangling pointers in entity reference
+nodes. Make sure to skip these nodes when processing XIncludes.
+
+This also avoids scanning entity declarations and even modifying
+them inadvertently during XInclude processing.
+
+Move from a block list to an allow list approach to avoid descending
+into other node types that can't contain elements.
+
+Fixes #237.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/1098c30a040e72a4654968547f415be4e4c40fe7]
+CVE: CVE-2021-3518
+
+[OP: adjusted context]
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
+---
+ xinclude.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/xinclude.c b/xinclude.c
+index 6ec5d31..b8eebcc 100644
+--- a/xinclude.c
++++ b/xinclude.c
+@@ -2387,9 +2387,8 @@ xmlXIncludeDoProcess(xmlXIncludeCtxtPtr ctxt, xmlDocPtr doc, xmlNodePtr tree) {
+         if (xmlXIncludeTestNode(ctxt, cur) == 1) {
+             xmlXIncludePreProcessNode(ctxt, cur);
+         } else if ((cur->children != NULL) &&
+-                   (cur->children->type != XML_ENTITY_DECL) &&
+-                   (cur->children->type != XML_XINCLUDE_START) &&
+-                   (cur->children->type != XML_XINCLUDE_END)) {
++                   ((cur->type == XML_DOCUMENT_NODE) ||
++                    (cur->type == XML_ELEMENT_NODE))) {
+             cur = cur->children;
+             continue;
+         }
+-- 
+2.23.0
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index b850164285..a9bff74b55 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -26,6 +26,8 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://fix-python39.patch \
            file://CVE-2021-3517.patch \
            file://CVE-2021-3516.patch \
+           file://CVE-2021-3518-0001.patch \
+           file://CVE-2021-3518-0002.patch \
            file://CVE-2021-3537.patch \
            "
 
-- 
2.29.2


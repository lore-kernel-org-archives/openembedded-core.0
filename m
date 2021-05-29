Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.22186.1622304394905464940
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 May 2021 09:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=c1DNtlQj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id n2so6329116wrm.0
        for <openembedded-core@lists.openembedded.org>; Sat, 29 May 2021 09:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e9UnIQJInvO8mM+p5TV26ak6IXk5VvEiRCKp08JgbD0=;
        b=c1DNtlQjeoZTZC7n89aZS1ko3LZlU7von4jyVRtcKxLG7hoXXMWCKPlAfyOVoGvnwv
         UT9nuJgv1C+Ffi4v1WCzBaTYvlhMAPZiORr2y0d7K/1Te2m0IRbW9lj69VfiglfbOeUL
         GGn/IglURkyQjpBrPGlttnhkDhlwkQNvNha9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e9UnIQJInvO8mM+p5TV26ak6IXk5VvEiRCKp08JgbD0=;
        b=WZ7oxUeEuCdMC3e7V3DYI1RXkSeA58soVKw0BMynnDaprb3TcWGRtmJZfgn2YD5qtx
         1DUZKeSerACRz5iBtJov+V9BsuAfFP2HAW4LV/TG2WleTsLtvH17iA1c6mhigBYFptmt
         5czxo6SHtHZW38+LGh3RguICnIgtm6flDFKtrWGe/6pTBX02IoEubjh3LVX+tQAbhQ42
         mlI6upmafN0P20JoX8yeWGhqfY5G4YfOEGy0wSausIrFIRNc2Y5MDjtOnZFq1oMM3e/g
         YIUPEJHdMqrYpCQnv05/YkUMgRsN/vI4I4bKqV1Ob4uM8M5X6x8bc1WF2ZmHxpOYmZBN
         6+hg==
X-Gm-Message-State: AOAM532KYMB4xOcpe0PfvBgwbeNK+zTfz37/FMjgHd+kgq0gTmoQCwgQ
	1bkMu+m2xMFXESFpV/TdAyjM4lascGItuw==
X-Google-Smtp-Source: ABdhPJwv+ab9hqJmC/kO1hsSaZLC6X6pRVRy5uRTJl6Drf4z6zoAvQ0Cr09m/hZJDg1dtFGEdkMdbA==
X-Received: by 2002:a5d:4843:: with SMTP id n3mr13866127wrs.411.1622304393138;
        Sat, 29 May 2021 09:06:33 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:314e:6a46:a163:7356])
        by smtp.gmail.com with ESMTPSA id q20sm20873615wmq.2.2021.05.29.09.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 May 2021 09:06:32 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tony Tascioglu <tony.tascioglu@windriver.com>
Subject: [hardknott] [PATCH 01/10] libxml2: Fix CVE-2021-3518
Date: Sat, 29 May 2021 17:06:23 +0100
Message-Id: <20210529160632.2796977-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tony Tascioglu <tony.tascioglu@windriver.com>

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libxml/libxml2/CVE-2021-3518-0001.patch   | 216 ++++++++++++++++++
 .../libxml/libxml2/CVE-2021-3518-0002.patch   |  45 ++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |   2 +
 3 files changed, 263 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2021-3518-0001.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2021-3518-0002.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2021-3518-0001.patch b/meta/recipes-core/libxml/libxml2/CVE-2021-3518-0001.patch
new file mode 100644
index 00000000000..3d4d3a0237e
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
index 00000000000..de5fc0e8cbe
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
index b850164285a..a9bff74b553 100644
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
2.30.2


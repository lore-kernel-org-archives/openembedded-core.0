Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 04B48605FF
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Dec 2015 19:35:51 +0000 (UTC)
Received: by pacwq6 with SMTP id wq6so26153828pac.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Dec 2015 11:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wio+6EyGcw27Zxlmss4FTYlP1qqqiov4d4pWfCUxjwA=;
	b=LWgphxMieNBLkjinjallFt6UXMxliaUtkPaqJQd6xDAlwPJgYciRqIJ54RZLC8wGZ9
	/HRr/HwAgawWkgN6zwxgU6e0puqXSEeScDNLEx5oIE9HACAMcDY+kuawyYe5KS4xGNGj
	BynvVeRNYgzO3skRRCWnZF3KGXzqf8pqNdEuoagGsBpy12a9bGY2BQ5gaboOsDeqNvU/
	zcgKrK3Hv2vnQ/+n8mHtt/ayJAKp3kuQ8YtoREBnGr/soVrFWgdW/TtW3FVK6s4tjXF6
	0b9t3s4Ba8oBCEzIwuU4ijF3amtmc2+CiEVtlB/GGo6Uloheyknf1LrEhTvM8Y4GrZvg
	3J9g==
X-Received: by 10.66.228.225 with SMTP id sl1mr31497064pac.63.1449344152588;
	Sat, 05 Dec 2015 11:35:52 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	w8sm24789831pfi.41.2015.12.05.11.35.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 05 Dec 2015 11:35:51 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Dec 2015 11:35:25 -0800
Message-Id: <1449344129-32738-12-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1449344129-32738-1-git-send-email-akuster808@gmail.com>
References: <1449344129-32738-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH][jethro][fido] 11/15] libxml2: depend fix security issue CVE-2015-7500
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
X-List-Received-Date: Sat, 05 Dec 2015 19:35:52 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 ...n-name-parsing-at-the-end-of-current-inpu.patch | 138 +++++++++++++++++++++
 1 file changed, 138 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/0001-Fix-a-bug-on-name-parsing-at-the-end-of-current-inpu.patch

diff --git a/meta/recipes-core/libxml/libxml2/0001-Fix-a-bug-on-name-parsing-at-the-end-of-current-inpu.patch b/meta/recipes-core/libxml/libxml2/0001-Fix-a-bug-on-name-parsing-at-the-end-of-current-inpu.patch
new file mode 100644
index 0000000..a86b9ee
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/0001-Fix-a-bug-on-name-parsing-at-the-end-of-current-inpu.patch
@@ -0,0 +1,138 @@
+From 51f02b0a03ea1fa6c65b3f9fd88cf60fb5803783 Mon Sep 17 00:00:00 2001
+From: Daniel Veillard <veillard@redhat.com>
+Date: Tue, 15 Sep 2015 16:50:32 +0800
+Subject: [PATCH] Fix a bug on name parsing at the end of current input buffer
+
+For https://bugzilla.gnome.org/show_bug.cgi?id=754946
+
+When hitting the end of the current input buffer while parsing
+a name we could end up loosing the beginning of the name, which
+led to various issues.
+
+Upstream-Status: backport
+
+Depend patch for CVE-2015-7500
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+---
+ parser.c                     | 29 ++++++++++++++++++++---------
+ result/errors/754946.xml     |  0
+ result/errors/754946.xml.err | 16 ++++++++++++++++
+ result/errors/754946.xml.str |  4 ++++
+ test/errors/754946.xml       |  1 +
+ 5 files changed, 41 insertions(+), 9 deletions(-)
+ create mode 100644 result/errors/754946.xml
+ create mode 100644 result/errors/754946.xml.err
+ create mode 100644 result/errors/754946.xml.str
+ create mode 100644 test/errors/754946.xml
+
+diff --git a/parser.c b/parser.c
+index 0edd53b..fd29a39 100644
+--- a/parser.c
++++ b/parser.c
+@@ -3491,7 +3491,14 @@ xmlParseNCNameComplex(xmlParserCtxtPtr ctxt) {
+ 	c = CUR_CHAR(l);
+ 	if (c == 0) {
+ 	    count = 0;
++	    /*
++	     * when shrinking to extend the buffer we really need to preserve
++	     * the part of the name we already parsed. Hence rolling back
++	     * by current lenght.
++	     */
++	    ctxt->input->cur -= l;
+ 	    GROW;
++	    ctxt->input->cur += l;
+             if (ctxt->instate == XML_PARSER_EOF)
+                 return(NULL);
+ 	    end = ctxt->input->cur;
+@@ -3523,7 +3530,7 @@ xmlParseNCNameComplex(xmlParserCtxtPtr ctxt) {
+ 
+ static const xmlChar *
+ xmlParseNCName(xmlParserCtxtPtr ctxt) {
+-    const xmlChar *in;
++    const xmlChar *in, *e;
+     const xmlChar *ret;
+     int count = 0;
+ 
+@@ -3535,16 +3542,19 @@ xmlParseNCName(xmlParserCtxtPtr ctxt) {
+      * Accelerator for simple ASCII names
+      */
+     in = ctxt->input->cur;
+-    if (((*in >= 0x61) && (*in <= 0x7A)) ||
+-	((*in >= 0x41) && (*in <= 0x5A)) ||
+-	(*in == '_')) {
++    e = ctxt->input->end;
++    if ((((*in >= 0x61) && (*in <= 0x7A)) ||
++	 ((*in >= 0x41) && (*in <= 0x5A)) ||
++	 (*in == '_')) && (in < e)) {
+ 	in++;
+-	while (((*in >= 0x61) && (*in <= 0x7A)) ||
+-	       ((*in >= 0x41) && (*in <= 0x5A)) ||
+-	       ((*in >= 0x30) && (*in <= 0x39)) ||
+-	       (*in == '_') || (*in == '-') ||
+-	       (*in == '.'))
++	while ((((*in >= 0x61) && (*in <= 0x7A)) ||
++	        ((*in >= 0x41) && (*in <= 0x5A)) ||
++	        ((*in >= 0x30) && (*in <= 0x39)) ||
++	        (*in == '_') || (*in == '-') ||
++	        (*in == '.')) && (in < e))
+ 	    in++;
++	if (in >= e)
++	    goto complex;
+ 	if ((*in > 0) && (*in < 0x80)) {
+ 	    count = in - ctxt->input->cur;
+             if ((count > XML_MAX_NAME_LENGTH) &&
+@@ -3562,6 +3572,7 @@ xmlParseNCName(xmlParserCtxtPtr ctxt) {
+ 	    return(ret);
+ 	}
+     }
++complex:
+     return(xmlParseNCNameComplex(ctxt));
+ }
+ 
+diff --git a/result/errors/754946.xml b/result/errors/754946.xml
+new file mode 100644
+index 0000000..e69de29
+diff --git a/result/errors/754946.xml.err b/result/errors/754946.xml.err
+new file mode 100644
+index 0000000..423dff5
+--- /dev/null
++++ b/result/errors/754946.xml.err
+@@ -0,0 +1,16 @@
++Entity: line 1: parser error : internal error: xmlParseInternalSubset: error detected in Markup declaration
++
++ %SYSTEM; 
++         ^
++Entity: line 1: 
++A<lbbbbbbbbbbbbbbbbbbb_
++^
++Entity: line 1: parser error : DOCTYPE improperly terminated
++ %SYSTEM; 
++         ^
++Entity: line 1: 
++A<lbbbbbbbbbbbbbbbbbbb_
++^
++./test/errors/754946.xml:1: parser error : Extra content at the end of the document
++<!DOCTYPEA[<!ENTITY %
++  ^
+diff --git a/result/errors/754946.xml.str b/result/errors/754946.xml.str
+new file mode 100644
+index 0000000..3b748cc
+--- /dev/null
++++ b/result/errors/754946.xml.str
+@@ -0,0 +1,4 @@
++./test/errors/754946.xml:1: parser error : Extra content at the end of the document
++<!DOCTYPEA[<!ENTITY %
++          ^
++./test/errors/754946.xml : failed to parse
+diff --git a/test/errors/754946.xml b/test/errors/754946.xml
+new file mode 100644
+index 0000000..6b5f9b0
+--- /dev/null
++++ b/test/errors/754946.xml
+@@ -0,0 +1 @@
++<!DOCTYPEA[<!ENTITY %

SYSTEM "A<lbbbbbbbbbbbbbbbbbbb_"
>%SYSTEM;<![
+\ No newline at end of file
+-- 
+2.3.5
+
-- 
2.3.5



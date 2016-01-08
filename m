Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id A43F27326E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 00:48:47 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id e65so1299088pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 16:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=l7Wl24+efXb1mEjEdd5C/rwfUcQyQ0G7j6i+GHAtqB8=;
	b=XA7vJLhXkzQe5reUC6AAH9RG0+RCODlCNAFg34X18RXN3ljLMSq5HhBbaFRis/Mg3j
	74ggdjsvVHduzNuwQi9dfBcfs4Fl+cln76o4RH5wG3GeIrLnAAM97yKuXA4NC89Pv+hA
	ZEtjewyyvv+BhJI7c+20VAB4I6EpkfPVTTwwSd3I1IZmnsGxSKWqTG8lckf+DDAhAexe
	qakICpu9Mj9L+n5TBE1AD9QyDEwgWMj/IRTnOO54w7xSdEvXJ3ypXNbXNsMf7TSGvs2S
	TpB+bg5psIU+oekvuxpu3NKF0lGSALIAtHFEBAOEFWImIFAQsy8lVff2QiwKxHT8NvJ3
	ncnA==
X-Received: by 10.98.71.73 with SMTP id u70mr583012pfa.130.1452214128368;
	Thu, 07 Jan 2016 16:48:48 -0800 (PST)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id o75sm300234pfi.17.2016.01.07.16.48.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jan 2016 16:48:46 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 16:48:31 -0800
Message-Id: <1452214113-11697-8-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1452214113-11697-1-git-send-email-akuster808@gmail.com>
References: <1452214113-11697-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH][V2][Jethro, fido 08/10] libxml2: security fix CVE-2015-7500
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
X-List-Received-Date: Fri, 08 Jan 2016 00:48:47 -0000

From: Armin Kuster <akuster@mvista.com>

includes a depend fix security issue CVE-2015-7500

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-core/libxml/libxml2.inc               |   2 +
 ...00-Fix-memory-access-error-due-to-incorre.patch | 131 +++++++++++++++++++
 ...n-name-parsing-at-the-end-of-current-inpu.patch | 138 +++++++++++++++++++++
 3 files changed, 271 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015-7500-Fix-memory-access-error-due-to-incorre.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/0001-Fix-a-bug-on-name-parsing-at-the-end-of-current-inpu.patch

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 3073851..7fd7693 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -31,6 +31,8 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://0001-CVE-2015-7497-Avoid-an-heap-buffer-overflow-in-xmlDi.patch \
            file://CVE-2015-7499-1-Add-xmlHaltParser-to-stop-the-parser.patch \
            file://CVE-2015-7499-2-Detect-incoherency-on-GROW.patch \
+           file://0001-Fix-a-bug-on-name-parsing-at-the-end-of-current-inpu.patch \
+           file://0001-CVE-2015-7500-Fix-memory-access-error-due-to-incorre.patch \
           "
 
 BINCONFIG = "${bindir}/xml2-config"
diff --git a/meta/recipes-core/libxml/libxml2/0001-CVE-2015-7500-Fix-memory-access-error-due-to-incorre.patch b/meta/recipes-core/libxml/libxml2/0001-CVE-2015-7500-Fix-memory-access-error-due-to-incorre.patch
new file mode 100644
index 0000000..b486079
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/0001-CVE-2015-7500-Fix-memory-access-error-due-to-incorre.patch
@@ -0,0 +1,131 @@
+From f1063fdbe7fa66332bbb76874101c2a7b51b519f Mon Sep 17 00:00:00 2001
+From: Daniel Veillard <veillard@redhat.com>
+Date: Fri, 20 Nov 2015 16:06:59 +0800
+Subject: [PATCH] CVE-2015-7500 Fix memory access error due to incorrect
+ entities boundaries
+
+For https://bugzilla.gnome.org/show_bug.cgi?id=756525
+handle properly the case where we popped out of the current entity
+while processing a start tag
+Reported by Kostya Serebryany @ Google
+
+This slightly modifies the output of 754946 in regression tests
+
+Upstream-Status: Backport
+
+CVE-2015-7500
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ parser.c                     | 28 ++++++++++++++++++++++------
+ result/errors/754946.xml.err |  7 +++++--
+ 2 files changed, 27 insertions(+), 8 deletions(-)
+
+diff --git a/parser.c b/parser.c
+index c7e4574..c5741e3 100644
+--- a/parser.c
++++ b/parser.c
+@@ -9348,7 +9348,7 @@ xmlParseStartTag2(xmlParserCtxtPtr ctxt, const xmlChar **pref,
+     const xmlChar **atts = ctxt->atts;
+     int maxatts = ctxt->maxatts;
+     int nratts, nbatts, nbdef;
+-    int i, j, nbNs, attval, oldline, oldcol;
++    int i, j, nbNs, attval, oldline, oldcol, inputNr;
+     const xmlChar *base;
+     unsigned long cur;
+     int nsNr = ctxt->nsNr;
+@@ -9367,6 +9367,7 @@ reparse:
+     SHRINK;
+     base = ctxt->input->base;
+     cur = ctxt->input->cur - ctxt->input->base;
++    inputNr = ctxt->inputNr;
+     oldline = ctxt->input->line;
+     oldcol = ctxt->input->col;
+     nbatts = 0;
+@@ -9392,7 +9393,8 @@ reparse:
+      */
+     SKIP_BLANKS;
+     GROW;
+-    if (ctxt->input->base != base) goto base_changed;
++    if ((ctxt->input->base != base) || (inputNr != ctxt->inputNr))
++        goto base_changed;
+ 
+     while (((RAW != '>') &&
+ 	   ((RAW != '/') || (NXT(1) != '>')) &&
+@@ -9403,7 +9405,7 @@ reparse:
+ 
+ 	attname = xmlParseAttribute2(ctxt, prefix, localname,
+ 	                             &aprefix, &attvalue, &len, &alloc);
+-	if (ctxt->input->base != base) {
++	if ((ctxt->input->base != base) || (inputNr != ctxt->inputNr)) {
+ 	    if ((attvalue != NULL) && (alloc != 0))
+ 	        xmlFree(attvalue);
+ 	    attvalue = NULL;
+@@ -9552,7 +9554,8 @@ skip_ns:
+ 		    break;
+ 		}
+ 		SKIP_BLANKS;
+-		if (ctxt->input->base != base) goto base_changed;
++		if ((ctxt->input->base != base) || (inputNr != ctxt->inputNr))
++		    goto base_changed;
+ 		continue;
+ 	    }
+ 
+@@ -9589,7 +9592,8 @@ failed:
+ 	GROW
+         if (ctxt->instate == XML_PARSER_EOF)
+             break;
+-	if (ctxt->input->base != base) goto base_changed;
++	if ((ctxt->input->base != base) || (inputNr != ctxt->inputNr))
++	    goto base_changed;
+ 	if ((RAW == '>') || (((RAW == '/') && (NXT(1) == '>'))))
+ 	    break;
+ 	if (!IS_BLANK_CH(RAW)) {
+@@ -9605,7 +9609,8 @@ failed:
+ 	    break;
+ 	}
+         GROW;
+-	if (ctxt->input->base != base) goto base_changed;
++	if ((ctxt->input->base != base) || (inputNr != ctxt->inputNr))
++	    goto base_changed;
+     }
+ 
+     /*
+@@ -9772,6 +9777,17 @@ base_changed:
+ 	    if ((ctxt->attallocs[j] != 0) && (atts[i] != NULL))
+ 	        xmlFree((xmlChar *) atts[i]);
+     }
++
++    /*
++     * We can't switch from one entity to another in the middle
++     * of a start tag
++     */
++    if (inputNr != ctxt->inputNr) {
++        xmlFatalErrMsg(ctxt, XML_ERR_ENTITY_BOUNDARY,
++		    "Start tag doesn't start and stop in the same entity\n");
++	return(NULL);
++    }
++
+     ctxt->input->cur = ctxt->input->base + cur;
+     ctxt->input->line = oldline;
+     ctxt->input->col = oldcol;
+diff --git a/result/errors/754946.xml.err b/result/errors/754946.xml.err
+index 423dff5..a75088b 100644
+--- a/result/errors/754946.xml.err
++++ b/result/errors/754946.xml.err
+@@ -11,6 +11,9 @@ Entity: line 1: parser error : DOCTYPE improperly terminated
+ Entity: line 1: 
+ A<lbbbbbbbbbbbbbbbbbbb_
+ ^
++./test/errors/754946.xml:1: parser error : Start tag doesn't start and stop in the same entity
++>%SYSTEM;<![
++         ^
+ ./test/errors/754946.xml:1: parser error : Extra content at the end of the document
+-<!DOCTYPEA[<!ENTITY %
+-  ^
++>%SYSTEM;<![
++         ^
+-- 
+2.3.5
+
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



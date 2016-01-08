Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 53E9C73281
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 00:48:45 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id yy13so179559926pab.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 16:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xRQm6ehPAxb1BM71h9MiHpPoutaunBMNFebgxN3quu0=;
	b=cRJuUF+nWx1cIfs11oIMxi9oRpov9ebkSPh66b13PBscq9HlEqzOd6M8kgPKO9yZTC
	T6IIyzkZqQvtFLgBnCRdCF5ErmpmIrtrrXc80rhApUjpOO9FQYIAH9toj66VawosmvP9
	TN97d3/2EycGKUtRG1UYYTXRdmseyKD2hQZR+sDTPxHs+CJHcfU1mxNJN0gCseHP7x1F
	X+zAnCcHxLEQJ432Q2HSuSdHWTaKHo0QgS615GHdZzaJuR29PuNV8RQhhq5+42Dn/nEo
	pN2s8XFmHEJ0gyhyL0UXYBbuxyywMRAKnkxDP2NB37CFRsoAGhlAPOAJEFOwZqlHk02W
	k72A==
X-Received: by 10.66.136.101 with SMTP id pz5mr26168677pab.91.1452214126573;
	Thu, 07 Jan 2016 16:48:46 -0800 (PST)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id o75sm300234pfi.17.2016.01.07.16.48.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jan 2016 16:48:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 16:48:30 -0800
Message-Id: <1452214113-11697-7-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1452214113-11697-1-git-send-email-akuster808@gmail.com>
References: <1452214113-11697-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH][V2][Jethro, fido 07/10] libxml2: security fix CVE-2015-7499
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
X-List-Received-Date: Fri, 08 Jan 2016 00:48:46 -0000

From: Armin Kuster <akuster@mvista.com>

includes:
CVE-2015-7499-1
CVE-2015-7499-2

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-core/libxml/libxml2.inc               |  2 +
 ...99-1-Add-xmlHaltParser-to-stop-the-parser.patch | 88 ++++++++++++++++++++++
 ...VE-2015-7499-2-Detect-incoherency-on-GROW.patch | 43 +++++++++++
 3 files changed, 133 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7499-1-Add-xmlHaltParser-to-stop-the-parser.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7499-2-Detect-incoherency-on-GROW.patch

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 65b2625..3073851 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -29,6 +29,8 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://0001-CVE-2015-8035-Fix-XZ-compression-support-loop.patch \
            file://CVE-2015-7498-Avoid-processing-entities-after-encoding-conversion-.patch \
            file://0001-CVE-2015-7497-Avoid-an-heap-buffer-overflow-in-xmlDi.patch \
+           file://CVE-2015-7499-1-Add-xmlHaltParser-to-stop-the-parser.patch \
+           file://CVE-2015-7499-2-Detect-incoherency-on-GROW.patch \
           "
 
 BINCONFIG = "${bindir}/xml2-config"
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2015-7499-1-Add-xmlHaltParser-to-stop-the-parser.patch b/meta/recipes-core/libxml/libxml2/CVE-2015-7499-1-Add-xmlHaltParser-to-stop-the-parser.patch
new file mode 100644
index 0000000..e39ec65
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2015-7499-1-Add-xmlHaltParser-to-stop-the-parser.patch
@@ -0,0 +1,88 @@
+From 28cd9cb747a94483f4aea7f0968d202c20bb4cfc Mon Sep 17 00:00:00 2001
+From: Daniel Veillard <veillard@redhat.com>
+Date: Fri, 20 Nov 2015 14:55:30 +0800
+Subject: [PATCH] Add xmlHaltParser() to stop the parser
+
+The problem is doing it in a consistent and safe fashion
+It's more complex than just setting ctxt->instate = XML_PARSER_EOF
+Update the public function to reuse that new internal routine
+
+Upstream-Status: Backport
+
+CVE-2015-7499-1
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ parser.c | 34 +++++++++++++++++++++++++++++-----
+ 1 file changed, 29 insertions(+), 5 deletions(-)
+
+diff --git a/parser.c b/parser.c
+index da6e729..b6e99b1 100644
+--- a/parser.c
++++ b/parser.c
+@@ -94,6 +94,8 @@ static xmlParserCtxtPtr
+ xmlCreateEntityParserCtxtInternal(const xmlChar *URL, const xmlChar *ID,
+ 	                  const xmlChar *base, xmlParserCtxtPtr pctx);
+ 
++static void xmlHaltParser(xmlParserCtxtPtr ctxt);
++
+ /************************************************************************
+  *									*
+  *	Arbitrary limits set in the parser. See XML_PARSE_HUGE		*
+@@ -12625,25 +12627,47 @@ xmlCreatePushParserCtxt(xmlSAXHandlerPtr sax, void *user_data,
+ #endif /* LIBXML_PUSH_ENABLED */
+ 
+ /**
+- * xmlStopParser:
++ * xmlHaltParser:
+  * @ctxt:  an XML parser context
+  *
+- * Blocks further parser processing
++ * Blocks further parser processing don't override error
++ * for internal use
+  */
+-void
+-xmlStopParser(xmlParserCtxtPtr ctxt) {
++static void
++xmlHaltParser(xmlParserCtxtPtr ctxt) {
+     if (ctxt == NULL)
+         return;
+     ctxt->instate = XML_PARSER_EOF;
+-    ctxt->errNo = XML_ERR_USER_STOP;
+     ctxt->disableSAX = 1;
+     if (ctxt->input != NULL) {
++        /*
++	 * in case there was a specific allocation deallocate before
++	 * overriding base
++	 */
++        if (ctxt->input->free != NULL) {
++	    ctxt->input->free((xmlChar *) ctxt->input->base);
++	    ctxt->input->free = NULL;
++	}
+ 	ctxt->input->cur = BAD_CAST"";
+ 	ctxt->input->base = ctxt->input->cur;
+     }
+ }
+ 
+ /**
++ * xmlStopParser:
++ * @ctxt:  an XML parser context
++ *
++ * Blocks further parser processing
++ */
++void
++xmlStopParser(xmlParserCtxtPtr ctxt) {
++    if (ctxt == NULL)
++        return;
++    xmlHaltParser(ctxt);
++    ctxt->errNo = XML_ERR_USER_STOP;
++}
++
++/**
+  * xmlCreateIOParserCtxt:
+  * @sax:  a SAX handler
+  * @user_data:  The user data returned on SAX callbacks
+-- 
+2.3.5
+
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2015-7499-2-Detect-incoherency-on-GROW.patch b/meta/recipes-core/libxml/libxml2/CVE-2015-7499-2-Detect-incoherency-on-GROW.patch
new file mode 100644
index 0000000..aff3920
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2015-7499-2-Detect-incoherency-on-GROW.patch
@@ -0,0 +1,43 @@
+From 35bcb1d758ed70aa7b257c9c3b3ff55e54e3d0da Mon Sep 17 00:00:00 2001
+From: Daniel Veillard <veillard@redhat.com>
+Date: Fri, 20 Nov 2015 15:04:09 +0800
+Subject: [PATCH] Detect incoherency on GROW
+
+the current pointer to the input has to be between the base and end
+if not stop everything we have an internal state error.
+
+Upstream-Status: Backport
+
+CVE-2015-7499-2
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ parser.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/parser.c b/parser.c
+index 1810f99..ab007aa 100644
+--- a/parser.c
++++ b/parser.c
+@@ -2075,9 +2075,16 @@ static void xmlGROW (xmlParserCtxtPtr ctxt) {
+          ((ctxt->input->buf) && (ctxt->input->buf->readcallback != (xmlInputReadCallback) xmlNop)) &&
+         ((ctxt->options & XML_PARSE_HUGE) == 0)) {
+         xmlFatalErr(ctxt, XML_ERR_INTERNAL_ERROR, "Huge input lookup");
+-        ctxt->instate = XML_PARSER_EOF;
++        xmlHaltParser(ctxt);
++	return;
+     }
+     xmlParserInputGrow(ctxt->input, INPUT_CHUNK);
++    if ((ctxt->input->cur > ctxt->input->end) ||
++        (ctxt->input->cur < ctxt->input->base)) {
++        xmlHaltParser(ctxt);
++        xmlFatalErr(ctxt, XML_ERR_INTERNAL_ERROR, "cur index out of bound");
++	return;
++    }
+     if ((ctxt->input->cur != NULL) && (*ctxt->input->cur == 0) &&
+         (xmlParserInputGrow(ctxt->input, INPUT_CHUNK) <= 0))
+ 	    xmlPopInput(ctxt);
+-- 
+2.3.5
+
-- 
2.3.5



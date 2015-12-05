Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id EDCEC605FF
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Dec 2015 19:35:44 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so103438284pac.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Dec 2015 11:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=R5mfmjN2989iXG2CLesSB2MRMLPWOvcxfQlNhzz0Xn4=;
	b=Vu6KsmsHTLFZzOXFiXXYBFQ+kEv2MWM8wuw/GRRkZlzSYy0Sm3aYaiYfB5w/71ULed
	XvoDZFwR45BkScBuBg0SILqCNw7/n83nlrFZCUHqhfrLUk7cJ5luoleHODvbSNGleKGD
	Ga2uU5QvGLnzSVpTNtfrq+EpkjPqnSU1DwhnNlMxx9yULmJIRzH8bYvfZmlblalwYCNL
	Mc22GKR7EvRgItKLgZiCdlo9KCkBc/pi+0Rcwbdozowe+XRFM2vzYJq4NgcmM9f/P024
	VjWjWva4cXB+BZodnAKGSeZ6VEK1MTjd3fRc+vjMpprCSxWQgfwH2Wz8BTNYgxlG2xUr
	hKoA==
X-Received: by 10.66.63.33 with SMTP id d1mr31308155pas.120.1449344145654;
	Sat, 05 Dec 2015 11:35:45 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	w8sm24789831pfi.41.2015.12.05.11.35.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 05 Dec 2015 11:35:44 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Dec 2015 11:35:21 -0800
Message-Id: <1449344129-32738-8-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1449344129-32738-1-git-send-email-akuster808@gmail.com>
References: <1449344129-32738-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH][jethro][fido] 07/15] libxml2: security fix CVE-2015-7498
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
X-List-Received-Date: Sat, 05 Dec 2015 19:35:45 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 ...ssing-entities-after-encoding-conversion-.patch | 89 ++++++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7498-Avoid-processing-entities-after-encoding-conversion-.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2015-7498-Avoid-processing-entities-after-encoding-conversion-.patch b/meta/recipes-core/libxml/libxml2/CVE-2015-7498-Avoid-processing-entities-after-encoding-conversion-.patch
new file mode 100644
index 0000000..47ba897
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2015-7498-Avoid-processing-entities-after-encoding-conversion-.patch
@@ -0,0 +1,89 @@
+From afd27c21f6b36e22682b7da20d726bce2dcb2f43 Mon Sep 17 00:00:00 2001
+From: Daniel Veillard <veillard@redhat.com>
+Date: Mon, 9 Nov 2015 18:07:18 +0800
+Subject: [PATCH] Avoid processing entities after encoding conversion failures
+
+For https://bugzilla.gnome.org/show_bug.cgi?id=756527
+and was also raised by Chromium team in the past
+
+When we hit a convwersion failure when switching encoding
+it is bestter to stop parsing there, this was treated as a
+fatal error but the parser was continuing to process to extract
+more errors, unfortunately that makes little sense as the data
+is obviously corrupt and can potentially lead to unexpected behaviour.
+
+Upstream-Status: Backport
+
+CVE-2015-7498
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ parser.c          |  7 +++++--
+ parserInternals.c | 11 ++++++++++-
+ 2 files changed, 15 insertions(+), 3 deletions(-)
+
+diff --git a/parser.c b/parser.c
+index 134afe7..c79b4e8 100644
+--- a/parser.c
++++ b/parser.c
+@@ -10665,7 +10665,8 @@ xmlParseXMLDecl(xmlParserCtxtPtr ctxt) {
+ 	xmlFatalErrMsg(ctxt, XML_ERR_SPACE_REQUIRED, "Blank needed here\n");
+     }
+     xmlParseEncodingDecl(ctxt);
+-    if (ctxt->errNo == XML_ERR_UNSUPPORTED_ENCODING) {
++    if ((ctxt->errNo == XML_ERR_UNSUPPORTED_ENCODING) ||
++         (ctxt->instate == XML_PARSER_EOF)) {
+ 	/*
+ 	 * The XML REC instructs us to stop parsing right here
+ 	 */
+@@ -10789,6 +10790,7 @@ xmlParseDocument(xmlParserCtxtPtr ctxt) {
+ 
+     if (CUR == 0) {
+ 	xmlFatalErr(ctxt, XML_ERR_DOCUMENT_EMPTY, NULL);
++	return(-1);
+     }
+ 
+     /*
+@@ -10806,7 +10808,8 @@ xmlParseDocument(xmlParserCtxtPtr ctxt) {
+ 	 * Note that we will switch encoding on the fly.
+ 	 */
+ 	xmlParseXMLDecl(ctxt);
+-	if (ctxt->errNo == XML_ERR_UNSUPPORTED_ENCODING) {
++	if ((ctxt->errNo == XML_ERR_UNSUPPORTED_ENCODING) ||
++	    (ctxt->instate == XML_PARSER_EOF)) {
+ 	    /*
+ 	     * The XML REC instructs us to stop parsing right here
+ 	     */
+diff --git a/parserInternals.c b/parserInternals.c
+index df204fd..c8230c1 100644
+--- a/parserInternals.c
++++ b/parserInternals.c
+@@ -937,6 +937,7 @@ xmlSwitchEncoding(xmlParserCtxtPtr ctxt, xmlCharEncoding enc)
+ {
+     xmlCharEncodingHandlerPtr handler;
+     int len = -1;
++    int ret;
+ 
+     if (ctxt == NULL) return(-1);
+     switch (enc) {
+@@ -1097,7 +1098,15 @@ xmlSwitchEncoding(xmlParserCtxtPtr ctxt, xmlCharEncoding enc)
+     if (handler == NULL)
+ 	return(-1);
+     ctxt->charset = XML_CHAR_ENCODING_UTF8;
+-    return(xmlSwitchToEncodingInt(ctxt, handler, len));
++    ret = xmlSwitchToEncodingInt(ctxt, handler, len);
++    if ((ret < 0) || (ctxt->errNo == XML_I18N_CONV_FAILED)) {
++        /*
++	 * on encoding conversion errors, stop the parser
++	 */
++        xmlStopParser(ctxt);
++	ctxt->errNo = XML_I18N_CONV_FAILED;
++    }
++    return(ret);
+ }
+ 
+ /**
+-- 
+2.3.5
+
-- 
2.3.5



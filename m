Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 53A507326E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 00:48:42 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id n128so1290770pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 16:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QvFw2RGdb5TRVqoQFTjygtS9zwd5hy/aghTvY++0S5o=;
	b=GtMLTCv8NB20y2xkTjZ77SRPA9vWDpf1bZi4ZTFvl02VSXa4NLAdm3IIHzyTHUwuRP
	ikcPau8/C/SXGxyS/NWay756003LKtcq7bGZnopkCfxM5fwcpMPidajo7JnZYuJ+UDWH
	F+lNiEdlILpB3xhUKZBQPZxdZ6Tf8hTyB46ZGLtIz7nPUg/hNNE/6g2H87FxC9pUDyyR
	Hxj9x0N4T25RPXeF4AqCX7dytzU9gFy0vyVGr21nlbMlnmz3eGlt6CelHR8hDVh5qu81
	ABQHAyaKfAawz+HDzVbt/2OYFgIpL0/OgFPh+g5wVj8b6JB0vfP9nT1uHcimztaNxoVn
	IF+g==
X-Received: by 10.98.76.149 with SMTP id e21mr586637pfj.89.1452214123327;
	Thu, 07 Jan 2016 16:48:43 -0800 (PST)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id o75sm300234pfi.17.2016.01.07.16.48.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jan 2016 16:48:41 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 16:48:28 -0800
Message-Id: <1452214113-11697-5-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1452214113-11697-1-git-send-email-akuster808@gmail.com>
References: <1452214113-11697-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH][V2][Jethro, fido 05/10] libxml2: security fix CVE-2015-7498
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
X-List-Received-Date: Fri, 08 Jan 2016 00:48:42 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-core/libxml/libxml2.inc               |  1 +
 ...ssing-entities-after-encoding-conversion-.patch | 89 ++++++++++++++++++++++
 2 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7498-Avoid-processing-entities-after-encoding-conversion-.patch

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index bc84656..389f5cd 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -27,6 +27,7 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://CVE-2015-7942-Another-variation-of-overflow-in-Conditional-section.patch \
            file://CVE-2015-7942-2-Fix-an-error-in-previous-Conditional-section-patch.patch \
            file://0001-CVE-2015-8035-Fix-XZ-compression-support-loop.patch \
+           file://CVE-2015-7498-Avoid-processing-entities-after-encoding-conversion-.patch \
           "
 
 BINCONFIG = "${bindir}/xml2-config"
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



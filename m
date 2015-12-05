Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3B57A605FF
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Dec 2015 19:35:47 +0000 (UTC)
Received: by pacej9 with SMTP id ej9so103651633pac.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Dec 2015 11:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=q/hj7cZAjpi0n3WvFNt/8ijJu2U6fZXBPZIuN/M7ARg=;
	b=JgCvHYyXR3JvU8uZ916q/cQgH6kZSf+bRSFZ5B4H4TvUhBLex+kmtGTW9ZQWC85GQK
	IEfsBuE32fuFbvFaPJqbXjUKtOK+IjZTDwc/j9Y/ZXmntUFVS+GpKD4tg9cMI/I/23CI
	tshnpPLGw5fwGc5o8swMG+X/Z+Ocd1CEYF7PSIQsgAAFIzr62zY5H7507c2FZHixCB4C
	BBnWILAVdnYxUF1SmcxAyO9srXBMizTRj0jNvaWd3XpXKDxniY4HRwnPQJMKpxLPt9JE
	hGy6uGyv9J01YoqwYZJ1IO9hZKHaN4OBVAsXD2CvXtiHpQTuS2WdC8yAaU9s7hO5QHOn
	7HaA==
X-Received: by 10.67.30.227 with SMTP id kh3mr31177291pad.69.1449344148931;
	Sat, 05 Dec 2015 11:35:48 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	w8sm24789831pfi.41.2015.12.05.11.35.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 05 Dec 2015 11:35:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Dec 2015 11:35:23 -0800
Message-Id: <1449344129-32738-10-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1449344129-32738-1-git-send-email-akuster808@gmail.com>
References: <1449344129-32738-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH][jethro][fido] 09/15] libxml2: security fix CVE-2015-7499-1
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
X-List-Received-Date: Sat, 05 Dec 2015 19:35:48 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 ...99-1-Add-xmlHaltParser-to-stop-the-parser.patch | 88 ++++++++++++++++++++++
 1 file changed, 88 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7499-1-Add-xmlHaltParser-to-stop-the-parser.patch

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
-- 
2.3.5



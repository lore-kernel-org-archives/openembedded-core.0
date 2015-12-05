Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id E248B605FF
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Dec 2015 19:35:49 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so103438868pac.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Dec 2015 11:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mUqzgBeDn2GuNnN12SiDpzDO8mOUkjaMdYCr/FmXKms=;
	b=CuYQ9Fr29s4N2HemNQnXpnaBRskz6u4eaoY3Wrb9bwTYR78BgdZ4JLENwB7bYGZLwQ
	rEgGD6Ey5n5S7Z7LK6YPKfsYpZeGKSHGHoGt7PE8LLb+VjUxUmZ/NsSSxLavoggjQ3+9
	yxDQCa4aHcfrsDLo+wCCeP9bpc1jkvH56xDWNYPjdY6QqXUDFHnbB4DP+QisUnfMEYcv
	oBBp59FdW9BKSMD7a72nv4a5DqT5YzDcH/2qMJkgIEqMa2apHTZiKnlhVq3ejlBDJMQP
	TV2A/vFQiWWDhz1Jiw/BCYRZv5Qc+7Qhq9DbH8nuoXk34YtVM7dSIE/JtttSvNBzvVzp
	V2TQ==
X-Received: by 10.67.5.98 with SMTP id cl2mr31378859pad.157.1449344150759;
	Sat, 05 Dec 2015 11:35:50 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	w8sm24789831pfi.41.2015.12.05.11.35.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 05 Dec 2015 11:35:49 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Dec 2015 11:35:24 -0800
Message-Id: <1449344129-32738-11-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1449344129-32738-1-git-send-email-akuster808@gmail.com>
References: <1449344129-32738-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH][jethro][fido] 10/15] libxml2: security fix CVE-2015-7499-2
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
X-List-Received-Date: Sat, 05 Dec 2015 19:35:50 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 ...VE-2015-7499-2-Detect-incoherency-on-GROW.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7499-2-Detect-incoherency-on-GROW.patch

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



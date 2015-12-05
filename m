Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 79AE8605FF
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Dec 2015 19:35:34 +0000 (UTC)
Received: by pfdd184 with SMTP id d184so43098688pfd.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Dec 2015 11:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=R5f7mRD4+FWMnOgRMF9MPoAsvabjOxygEmEK4dVQuZY=;
	b=sgoUeBIpAjvppR7WccCUoZCzpZbCtm8UXMKfy0qhRx61rw1Yx0SJ/eoO5UARnQ4sOI
	IyNjWhkbHPvY1qWiX8pxYr6lF1f9WQfRpztQt1FQ/7QodrUlaB4LDcZrxnDhW3+EU/RY
	45uCf6GWuI7qt5dGHdUhj6BOOVaHwB3p3bYg67XSNSfcFQel4wv8RA9nJYmck3P6ac8z
	oEo1Yh0gDJ9BxLbQyQUf4OjLM4TAD/yC96hie6pgVu8r+sISg2Rc22rtCZJrGJcnG1pv
	mle7RUS6GUx7EUF9klY2KVFK+FzM0YN+CB+W4jKt8wZEMRW8g6EPId3+0AzH7FHCz2nl
	ct9Q==
X-Received: by 10.98.13.156 with SMTP id 28mr30988599pfn.106.1449344135031;
	Sat, 05 Dec 2015 11:35:35 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	w8sm24789831pfi.41.2015.12.05.11.35.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 05 Dec 2015 11:35:34 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Dec 2015 11:35:15 -0800
Message-Id: <1449344129-32738-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1449344129-32738-1-git-send-email-akuster808@gmail.com>
References: <1449344129-32738-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH][jethro][fido] 01/15] libxml2: security fix CVE-2015-7941-1
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
X-List-Received-Date: Sat, 05 Dec 2015 19:35:34 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 ...top-parsing-on-entities-boundaries-errors.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7941-1-Stop-parsing-on-entities-boundaries-errors.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2015-7941-1-Stop-parsing-on-entities-boundaries-errors.patch b/meta/recipes-core/libxml/libxml2/CVE-2015-7941-1-Stop-parsing-on-entities-boundaries-errors.patch
new file mode 100644
index 0000000..11da9f9
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2015-7941-1-Stop-parsing-on-entities-boundaries-errors.patch
@@ -0,0 +1,39 @@
+From a7dfab7411cbf545f359dd3157e5df1eb0e7ce31 Mon Sep 17 00:00:00 2001
+From: Daniel Veillard <veillard@redhat.com>
+Date: Mon, 23 Feb 2015 11:17:35 +0800
+Subject: [PATCH] Stop parsing on entities boundaries errors
+
+For https://bugzilla.gnome.org/show_bug.cgi?id=744980
+
+There are times, like on unterminated entities that it's preferable to
+stop parsing, even if that means less error reporting. Entities are
+feeding the parser on further processing, and if they are ill defined
+then it's possible to get the parser to bug. Also do the same on
+Conditional Sections if the input is broken, as the structure of
+the document can't be guessed.
+
+Upstream-Status: Backport
+
+CVE-2015-7941-1
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ parser.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/parser.c b/parser.c
+index a8d1b67..bbe97eb 100644
+--- a/parser.c
++++ b/parser.c
+@@ -5658,6 +5658,7 @@ xmlParseEntityDecl(xmlParserCtxtPtr ctxt) {
+ 	if (RAW != '>') {
+ 	    xmlFatalErrMsgStr(ctxt, XML_ERR_ENTITY_NOT_FINISHED,
+ 	            "xmlParseEntityDecl: entity %s not terminated\n", name);
++	    xmlStopParser(ctxt);
+ 	} else {
+ 	    if (input != ctxt->input) {
+ 		xmlFatalErrMsg(ctxt, XML_ERR_ENTITY_BOUNDARY,
+-- 
+2.3.5
+
-- 
2.3.5



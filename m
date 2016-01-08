Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9E09F60767
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 00:48:35 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id e65so1297063pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 16:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=V4ey59dADa2oWgfOcMZWq0kyULtLy8XobRlPl1clcQQ=;
	b=hP/cSIpMfzZuW6arpMhIfZGaUyqMo7EyZ7Zy1auCYnFIgxAXFAGfJgX9hBeNLLEe9Z
	g8t5b50aJsqh1FSUwHIpfKoeNe0VFlWKdTIO20EHjerTQ91fLQeUFgJ8HQ/LTbf7fsZs
	wKIAbxmFLMSUXD0bqQJqFNFxos09cwnml4rH2t/gsEe1LmC5KigDIPIJLsniOfF7xgHz
	rYWtVSz/217IsFtWiUOlouEVxhAivsBVJ5rQj9L8OyioYGnNz4wmwODJ9w4cAz/yUYNn
	7VDh02bNmIOWQp8xydkjVY1baJK4zUnMMsdKY0uZlPg9SoqZFvL31c/ImmbcwfyIxDQC
	/9gw==
X-Received: by 10.98.72.136 with SMTP id q8mr576911pfi.86.1452214115940;
	Thu, 07 Jan 2016 16:48:35 -0800 (PST)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id o75sm300234pfi.17.2016.01.07.16.48.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jan 2016 16:48:34 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 16:48:24 -0800
Message-Id: <1452214113-11697-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH][V2][Jethro, fido 01/10] libxml2: security fix CVE-2015-7941
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
X-List-Received-Date: Fri, 08 Jan 2016 00:48:36 -0000

From: Armin Kuster <akuster@mvista.com>

includes:
CVE-2015-7941-1
CVE-2015-7941-2

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-core/libxml/libxml2.inc               |  2 +
 ...top-parsing-on-entities-boundaries-errors.patch | 39 +++++++++++++++
 ...leanup-conditional-section-error-handling.patch | 56 ++++++++++++++++++++++
 3 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7941-1-Stop-parsing-on-entities-boundaries-errors.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7941-2-Cleanup-conditional-section-error-handling.patch

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 1c3c37d..24b98a6 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -21,6 +21,8 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://libxml-m4-use-pkgconfig.patch \
            file://configure.ac-fix-cross-compiling-warning.patch \
            file://0001-CVE-2015-1819-Enforce-the-reader-to-run-in-constant-.patch \
+           file://CVE-2015-7941-1-Stop-parsing-on-entities-boundaries-errors.patch \
+           file://CVE-2015-7941-2-Cleanup-conditional-section-error-handling.patch \
           "
 
 BINCONFIG = "${bindir}/xml2-config"
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
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2015-7941-2-Cleanup-conditional-section-error-handling.patch b/meta/recipes-core/libxml/libxml2/CVE-2015-7941-2-Cleanup-conditional-section-error-handling.patch
new file mode 100644
index 0000000..b7bd960
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2015-7941-2-Cleanup-conditional-section-error-handling.patch
@@ -0,0 +1,56 @@
+From 9b8512337d14c8ddf662fcb98b0135f225a1c489 Mon Sep 17 00:00:00 2001
+From: Daniel Veillard <veillard@redhat.com>
+Date: Mon, 23 Feb 2015 11:29:20 +0800
+Subject: [PATCH] Cleanup conditional section error handling
+
+For https://bugzilla.gnome.org/show_bug.cgi?id=744980
+
+The error handling of Conditional Section also need to be
+straightened as the structure of the document can't be
+guessed on a failure there and it's better to stop parsing
+as further errors are likely to be irrelevant.
+
+Upstream-Status: Backport
+
+CVE-2015-7941-2
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ parser.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/parser.c b/parser.c
+index bbe97eb..fe603ac 100644
+--- a/parser.c
++++ b/parser.c
+@@ -6770,6 +6770,8 @@ xmlParseConditionalSections(xmlParserCtxtPtr ctxt) {
+ 	SKIP_BLANKS;
+ 	if (RAW != '[') {
+ 	    xmlFatalErr(ctxt, XML_ERR_CONDSEC_INVALID, NULL);
++	    xmlStopParser(ctxt);
++	    return;
+ 	} else {
+ 	    if (ctxt->input->id != id) {
+ 		xmlValidityError(ctxt, XML_ERR_ENTITY_BOUNDARY,
+@@ -6830,6 +6832,8 @@ xmlParseConditionalSections(xmlParserCtxtPtr ctxt) {
+ 	SKIP_BLANKS;
+ 	if (RAW != '[') {
+ 	    xmlFatalErr(ctxt, XML_ERR_CONDSEC_INVALID, NULL);
++	    xmlStopParser(ctxt);
++	    return;
+ 	} else {
+ 	    if (ctxt->input->id != id) {
+ 		xmlValidityError(ctxt, XML_ERR_ENTITY_BOUNDARY,
+@@ -6885,6 +6889,8 @@ xmlParseConditionalSections(xmlParserCtxtPtr ctxt) {
+ 
+     } else {
+ 	xmlFatalErr(ctxt, XML_ERR_CONDSEC_INVALID_KEYWORD, NULL);
++	xmlStopParser(ctxt);
++	return;
+     }
+ 
+     if (RAW == 0)
+-- 
+2.3.5
+
-- 
2.3.5



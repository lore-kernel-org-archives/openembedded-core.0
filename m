Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id DEF57605FF
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Dec 2015 19:35:35 +0000 (UTC)
Received: by pfnn128 with SMTP id n128so43069895pfn.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Dec 2015 11:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9OInwb0w3L/YxV9qkd6ngFC1CtRPETOWsxiLPaai4fc=;
	b=jHH02eBLO7rgEvMF2vNVUUG73IqX1rrL8GsoeSB64s69snPZzfeh1x/p7zdoCbk0U7
	8ML1loYWNUPyofDQvJb5gJHabscPD4FHmhkgmRBUUTvOKEiuUGuEv6Z6oLHRJJADKksW
	/RkV5Yr2LH1JF8JZFSAAeBLLn4UEE5y6QXxJ9lKpthf/iA9ucFrWFoEYiGHy902p2m4B
	uLRwRwz5zt4sHw3O+CiW3ArCAHo5tHUUT9WqrOnFB3SXb/dkq0bfh+KFlHPvC0KS3gky
	lzhV6yNuz3zE+LVdtXPFjXkA1Xs44Xocd2cmTWPKc8G4sTds/vIffx1GWdWmUlDIRwf1
	XAVA==
X-Received: by 10.98.71.194 with SMTP id p63mr31500952pfi.66.1449344136816;
	Sat, 05 Dec 2015 11:35:36 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	w8sm24789831pfi.41.2015.12.05.11.35.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 05 Dec 2015 11:35:35 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Dec 2015 11:35:16 -0800
Message-Id: <1449344129-32738-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1449344129-32738-1-git-send-email-akuster808@gmail.com>
References: <1449344129-32738-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH][jethro][fido] 02/15] libxml2: security fix CVE-2015-7941-2
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
X-List-Received-Date: Sat, 05 Dec 2015 19:35:36 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 ...leanup-conditional-section-error-handling.patch | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7941-2-Cleanup-conditional-section-error-handling.patch

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



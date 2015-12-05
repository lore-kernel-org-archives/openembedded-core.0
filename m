Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id BB8A4605FF
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Dec 2015 19:35:53 +0000 (UTC)
Received: by pfdd184 with SMTP id d184so43100827pfd.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Dec 2015 11:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jSNpnNoqen3i3ZKK8jXGgAsZp4Okh1+beTNyC7z283k=;
	b=tj3taudo4UHR+yr8bJ5YW5Ffj+xB9CNLWyXpF8FQm/sY6frSAOtIft9x1YqLUlK6vn
	5ZgtwmZQg5jpfsKDckw1SP0oFcg9iKAkqG8tjbgauq2FPwS3/HUHjKMrxU1I4TxzJqbv
	2v9eCGVIrEOzavBach9EOq0QtvTuzG8Dz48l0AXOSKxjuyypuhOL68GGg6vjEC7kEKg9
	S0TiFuL+U2QufcOAi426d3xm2g3gCPyGv1HUeVI6i7+yPvypCZ8tXW8QYKYfgHHbEaiq
	cc+JU4dDZx2AwbGuPqHVB3OUUgy22r1mjowznuV1wqunBiQnBMDeJbugLTQon8Uwgqnh
	w4eg==
X-Received: by 10.98.74.9 with SMTP id x9mr31289491pfa.139.1449344154397;
	Sat, 05 Dec 2015 11:35:54 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	w8sm24789831pfi.41.2015.12.05.11.35.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 05 Dec 2015 11:35:53 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Dec 2015 11:35:26 -0800
Message-Id: <1449344129-32738-13-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1449344129-32738-1-git-send-email-akuster808@gmail.com>
References: <1449344129-32738-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH][jethro][fido] 12/15] libxml2: security fix CVE-2015-7500
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
X-List-Received-Date: Sat, 05 Dec 2015 19:35:53 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 ...00-Fix-memory-access-error-due-to-incorre.patch | 131 +++++++++++++++++++++
 1 file changed, 131 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015-7500-Fix-memory-access-error-due-to-incorre.patch

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
-- 
2.3.5



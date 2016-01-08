Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 980767328A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 00:48:49 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id uo6so253939163pac.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 16:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uIFRM/xo4CP6eUJ+j82KFJ8wvNYEO2KKusc6PQkLFho=;
	b=0+q7sLVE61racEoyTIWL8Yys/bJJ7pK2u/USMzcwvUczDwngLv+DBoEkAmievImUjf
	P6K9TxVRUrH4qLX6fCeDD7j2fd493gA8QatYYMPxkEnJ+zCLrs21NtzlFc+NrF7UIpLP
	DvuCeVblNcITH1oAZsVpSph9IW459B0Y7lEXFojwWFz06/Lf99LgpGwqrVYrkBjRiSvr
	TeVeVLAP1Ry8gFC4isW6mvfTeJqNZaKAzjM/O1zq2jycLPaq6Pr/ROIVw+K2Xpd7dmjH
	yGgcNQ6KpcxwWqZ9qVPrYILToFWp2UsusHz2J5Mj42rKAhvIG2jLlpYfOfg62pzGtTfl
	CB5w==
X-Received: by 10.66.164.102 with SMTP id yp6mr18918950pab.25.1452214130147;
	Thu, 07 Jan 2016 16:48:50 -0800 (PST)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id o75sm300234pfi.17.2016.01.07.16.48.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jan 2016 16:48:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 16:48:32 -0800
Message-Id: <1452214113-11697-9-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1452214113-11697-1-git-send-email-akuster808@gmail.com>
References: <1452214113-11697-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH][V2][Jethro, fido 09/10] libxml2: security fix CVE-2015-8242
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
X-List-Received-Date: Fri, 08 Jan 2016 00:48:51 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-core/libxml/libxml2.inc               |  1 +
 ...42-Buffer-overead-with-HTML-parser-in-pus.patch | 49 ++++++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015-8242-Buffer-overead-with-HTML-parser-in-pus.patch

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 7fd7693..a30f0b6 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -33,6 +33,7 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://CVE-2015-7499-2-Detect-incoherency-on-GROW.patch \
            file://0001-Fix-a-bug-on-name-parsing-at-the-end-of-current-inpu.patch \
            file://0001-CVE-2015-7500-Fix-memory-access-error-due-to-incorre.patch \
+           file://0001-CVE-2015-8242-Buffer-overead-with-HTML-parser-in-pus.patch \
           "
 
 BINCONFIG = "${bindir}/xml2-config"
diff --git a/meta/recipes-core/libxml/libxml2/0001-CVE-2015-8242-Buffer-overead-with-HTML-parser-in-pus.patch b/meta/recipes-core/libxml/libxml2/0001-CVE-2015-8242-Buffer-overead-with-HTML-parser-in-pus.patch
new file mode 100644
index 0000000..73531b3
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/0001-CVE-2015-8242-Buffer-overead-with-HTML-parser-in-pus.patch
@@ -0,0 +1,49 @@
+From 8fb4a770075628d6441fb17a1e435100e2f3b1a2 Mon Sep 17 00:00:00 2001
+From: Hugh Davenport <hugh@allthethings.co.nz>
+Date: Fri, 20 Nov 2015 17:16:06 +0800
+Subject: [PATCH] CVE-2015-8242 Buffer overead with HTML parser in push mode
+
+For https://bugzilla.gnome.org/show_bug.cgi?id=756372
+Error in the code pointing to the codepoint in the stack for the
+current char value instead of the pointer in the input that the SAX
+callback expects
+Reported and fixed by Hugh Davenport
+
+Upstream-Status: Backport
+
+CVE-2015-8242
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ HTMLparser.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/HTMLparser.c b/HTMLparser.c
+index bdf7807..b729197 100644
+--- a/HTMLparser.c
++++ b/HTMLparser.c
+@@ -5735,17 +5735,17 @@ htmlParseTryOrFinish(htmlParserCtxtPtr ctxt, int terminate) {
+ 				if (ctxt->keepBlanks) {
+ 				    if (ctxt->sax->characters != NULL)
+ 					ctxt->sax->characters(
+-						ctxt->userData, &cur, 1);
++						ctxt->userData, &in->cur[0], 1);
+ 				} else {
+ 				    if (ctxt->sax->ignorableWhitespace != NULL)
+ 					ctxt->sax->ignorableWhitespace(
+-						ctxt->userData, &cur, 1);
++						ctxt->userData, &in->cur[0], 1);
+ 				}
+ 			    } else {
+ 				htmlCheckParagraph(ctxt);
+ 				if (ctxt->sax->characters != NULL)
+ 				    ctxt->sax->characters(
+-					    ctxt->userData, &cur, 1);
++					    ctxt->userData, &in->cur[0], 1);
+ 			    }
+ 			}
+ 			ctxt->token = 0;
+-- 
+2.3.5
+
-- 
2.3.5



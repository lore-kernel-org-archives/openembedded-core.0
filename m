Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8BF34605FF
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Dec 2015 19:35:55 +0000 (UTC)
Received: by pfdd184 with SMTP id d184so43101049pfd.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Dec 2015 11:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NHA6CxFtpTbrAL9Ex70eh1JEYd8L58gX3iWwt0uuUTc=;
	b=OeDUg/uzxCjN4VuUOZC0PTaZnnDqruYGrXkD2kSLzu7wSqrZVY8lK1RZ95JoJLIaKV
	mnggIHNyf1GgVxDrODzpuljyn3IWxJ0QXUdskx4EYIL+OcIH3AD/ZI3+Ze86b9OAdr3e
	yfC45qtwAcZgshqkHhMF4oRY9wdrHXG5eTFPEkCMqUb4OM69Mo0do6WWUgTKbfP6Ye7y
	/Kl76rEFiYaOXAd08lP0pSkyCkhnCGz5UrpLaCnJcbnOffQ1jmg+Hr/xCrTn6AjhBRBH
	f7t4mt5/VErOAfr8G9FXzC77HTeIQCSSTEsyRfmFaTDADJsdpp2qjA6G2wO9oLuoixoh
	+d9Q==
X-Received: by 10.98.0.140 with SMTP id 134mr31475327pfa.6.1449344156117;
	Sat, 05 Dec 2015 11:35:56 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	w8sm24789831pfi.41.2015.12.05.11.35.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 05 Dec 2015 11:35:54 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Dec 2015 11:35:27 -0800
Message-Id: <1449344129-32738-14-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1449344129-32738-1-git-send-email-akuster808@gmail.com>
References: <1449344129-32738-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH][jethro][fido] 13/15] libxml2: security fix CVE-2015-8242
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
X-List-Received-Date: Sat, 05 Dec 2015 19:35:55 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 ...42-Buffer-overead-with-HTML-parser-in-pus.patch | 49 ++++++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015-8242-Buffer-overead-with-HTML-parser-in-pus.patch

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



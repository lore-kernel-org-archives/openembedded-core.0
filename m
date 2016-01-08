Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0FECF73259
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 00:48:38 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id 65so1293503pff.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 16:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=u9MAhJIaCUxGJBbJKtPRfBN9DzDRzMPwlKBI9nyKFl4=;
	b=ndYEvo2DkUKxQ7h766gkeU/tsFNja7LIf91E001+iWyrsnSrPWkPln79so18Xnwc78
	tMpCDuL9ntkHzzTDTFPJo6OgO4fLPWwDXy2ldBANwRCFmOX+9OuL8uUFIYSe9ans7d7m
	pdKSzQNQBN2D/QYn05+QvTlOF8GLG9uV4FeiVbCNhRUD/iN/Yhvbg08F8oM++HedAFSz
	SjkX0mx5hrAaP031YaRHl+xv+ojlMojPxsuhnYHeIPioJpNGSTXxywnFUnhaUioiORDs
	YMSA7DAb82iP7GjGZAFIpkn51gEvBsJAja1lY4aacqZIVYSxcfsuJZ468g6qgug+TWGl
	nXAg==
X-Received: by 10.98.72.132 with SMTP id q4mr572662pfi.53.1452214119655;
	Thu, 07 Jan 2016 16:48:39 -0800 (PST)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id o75sm300234pfi.17.2016.01.07.16.48.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jan 2016 16:48:38 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 16:48:26 -0800
Message-Id: <1452214113-11697-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1452214113-11697-1-git-send-email-akuster808@gmail.com>
References: <1452214113-11697-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH][V2][Jethro, fido 03/10] libxml2: security fix CVE-2015-7942
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
X-List-Received-Date: Fri, 08 Jan 2016 00:48:39 -0000

From: Armin Kuster <akuster@mvista.com>

includes:
CVE-2015-7942
CVE-2015-7942-2

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-core/libxml/libxml2.inc               |  2 ++
 ...ror-in-previous-Conditional-section-patch.patch | 35 +++++++++++++++++++
 ...iation-of-overflow-in-Conditional-section.patch | 39 ++++++++++++++++++++++
 3 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7942-2-Fix-an-error-in-previous-Conditional-section-patch.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7942-Another-variation-of-overflow-in-Conditional-section.patch

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 84217bf..97eb417 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -24,6 +24,8 @@ SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
            file://CVE-2015-7941-1-Stop-parsing-on-entities-boundaries-errors.patch \
            file://CVE-2015-7941-2-Cleanup-conditional-section-error-handling.patch \
            file://CVE-2015-8317-Fail-parsing-early-on-if-encoding-conversion-failed.patch \
+           file://CVE-2015-7942-Another-variation-of-overflow-in-Conditional-section.patch \
+           file://CVE-2015-7942-2-Fix-an-error-in-previous-Conditional-section-patch.patch \
           "
 
 BINCONFIG = "${bindir}/xml2-config"
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2015-7942-2-Fix-an-error-in-previous-Conditional-section-patch.patch b/meta/recipes-core/libxml/libxml2/CVE-2015-7942-2-Fix-an-error-in-previous-Conditional-section-patch.patch
new file mode 100644
index 0000000..34b6036
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2015-7942-2-Fix-an-error-in-previous-Conditional-section-patch.patch
@@ -0,0 +1,35 @@
+From 41ac9049a27f52e7a1f3b341f8714149fc88d450 Mon Sep 17 00:00:00 2001
+From: Daniel Veillard <veillard@redhat.com>
+Date: Tue, 27 Oct 2015 10:53:44 +0800
+Subject: [PATCH] Fix an error in previous Conditional section patch
+
+an off by one mistake in the change, led to error on correct
+document where the end of the included entity was exactly
+the end of the conditional section, leading to regtest failure
+
+Upstream-Status: Backport
+
+CVE-2015-7942-2
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ parser.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/parser.c b/parser.c
+index b9217ff..d67b300 100644
+--- a/parser.c
++++ b/parser.c
+@@ -6916,7 +6916,7 @@ xmlParseConditionalSections(xmlParserCtxtPtr ctxt) {
+ 				 NULL, NULL);
+ 	}
+ 	if ((ctxt-> instate != XML_PARSER_EOF) &&
+-	    ((ctxt->input->cur + 3) < ctxt->input->end))
++	    ((ctxt->input->cur + 3) <= ctxt->input->end))
+ 	    SKIP(3);
+     }
+ }
+-- 
+2.3.5
+
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2015-7942-Another-variation-of-overflow-in-Conditional-section.patch b/meta/recipes-core/libxml/libxml2/CVE-2015-7942-Another-variation-of-overflow-in-Conditional-section.patch
new file mode 100644
index 0000000..40082ec
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2015-7942-Another-variation-of-overflow-in-Conditional-section.patch
@@ -0,0 +1,39 @@
+From bd0526e66a56e75a18da8c15c4750db8f801c52d Mon Sep 17 00:00:00 2001
+From: Daniel Veillard <veillard@redhat.com>
+Date: Fri, 23 Oct 2015 19:02:28 +0800
+Subject: [PATCH] Another variation of overflow in Conditional sections
+
+Which happen after the previous fix to
+https://bugzilla.gnome.org/show_bug.cgi?id=756456
+
+But stopping the parser and exiting we didn't pop the intermediary entities
+and doing the SKIP there applies on an input which may be too small
+
+Upstream-Status: Backport
+
+CVE-2015-7942
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ parser.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/parser.c b/parser.c
+index a65e4cc..b9217ff 100644
+--- a/parser.c
++++ b/parser.c
+@@ -6915,7 +6915,9 @@ xmlParseConditionalSections(xmlParserCtxtPtr ctxt) {
+ 	"All markup of the conditional section is not in the same entity\n",
+ 				 NULL, NULL);
+ 	}
+-        SKIP(3);
++	if ((ctxt-> instate != XML_PARSER_EOF) &&
++	    ((ctxt->input->cur + 3) < ctxt->input->end))
++	    SKIP(3);
+     }
+ }
+ 
+-- 
+2.3.5
+
-- 
2.3.5



Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id AB18D605FF
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Dec 2015 19:35:41 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so106310473pab.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Dec 2015 11:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ivJaJEB7Mk3fZ005ckOuERlzCeopEnAWPLmhW0CZIxg=;
	b=XbbuNGXgjSeU/Bbws+GHelXTKpLkuoQzUKkocl0AEzppiBqkE56jy8+JTpsN03fKnS
	1+rIZde/NbOAx7vJTNE3kq3eprVpOmAYM+eBw7dT0aXcKa5Dc9eMatWIvFUkXBJHlMgl
	0R0c9Q1cs3hGitZ2lWr9SVLvmdu+9k2gCY7689aw1KslB0zSHtfnGXMEcO1F++MVREFB
	GhfYOPM1du1QX7SMKwYN0pcg53sVH6LmBDkbv8saMeA/N5+VOOOi/GM3I4Vkfdl6vBAx
	STwzpi7hlful1DWBWRh36eyWuXKBvjI+VaEKiCkN6/VNgfAuHVbE54tHlNkx6jhmICOe
	bxZw==
X-Received: by 10.66.153.198 with SMTP id vi6mr31500818pab.37.1449344142236;
	Sat, 05 Dec 2015 11:35:42 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	w8sm24789831pfi.41.2015.12.05.11.35.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 05 Dec 2015 11:35:41 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Dec 2015 11:35:19 -0800
Message-Id: <1449344129-32738-6-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1449344129-32738-1-git-send-email-akuster808@gmail.com>
References: <1449344129-32738-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH][jethro][fido] 05/15] libxml2: security fix CVE-2015-7942-2
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
X-List-Received-Date: Sat, 05 Dec 2015 19:35:43 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 ...ror-in-previous-Conditional-section-patch.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7942-2-Fix-an-error-in-previous-Conditional-section-patch.patch

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
-- 
2.3.5



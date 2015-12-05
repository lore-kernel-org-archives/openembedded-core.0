Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id EA052605FF
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Dec 2015 19:35:39 +0000 (UTC)
Received: by pacdm15 with SMTP id dm15so103437676pac.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Dec 2015 11:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dP5CXcxU4x8FVY/ogiMMF/nWrFyF7Jwlhn3ny6IAtTg=;
	b=leT1ZzuvaEzfuORYGVeFuE11R0GNm8CT2TSztNN+xygog24SI8KXYJhRmvpzfxTD8x
	9Ps+GouB2L/lAjFEcnpXgCIObfVZL3a7uZkCXbDh2HeZ5UL1D8/Vvc/grw/T5NF1R9ZC
	56MYReTFSBu1HGJhNoxoBxSMDWUYnnzZP7vfedhXsPmJNcqjsQl8RXJamQV5oDYIGL8J
	d1ZwHg/kbSDcuUmNnMMe0SuVbmED3VMFQ5byj77IV3TMKNDIolkPHpldrlTJdcwfbtuE
	U1LhMO4+bjgTkRUDdj3r+jYfq5MtUIMfbk29gI8eLl/t5dNs7XB0lEJ/0pImrr/mgoZj
	fQsw==
X-Received: by 10.67.5.2 with SMTP id ci2mr31307536pad.47.1449344140511;
	Sat, 05 Dec 2015 11:35:40 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	w8sm24789831pfi.41.2015.12.05.11.35.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 05 Dec 2015 11:35:39 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Dec 2015 11:35:18 -0800
Message-Id: <1449344129-32738-5-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1449344129-32738-1-git-send-email-akuster808@gmail.com>
References: <1449344129-32738-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH][jethro][fido] 04/15] libxml2: security fix CVE-2015-7942
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
X-List-Received-Date: Sat, 05 Dec 2015 19:35:40 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 ...iation-of-overflow-in-Conditional-section.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2015-7942-Another-variation-of-overflow-in-Conditional-section.patch

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



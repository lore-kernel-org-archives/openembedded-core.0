Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id CC14574A13
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 10:04:55 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id a2-v6so2155774wrc.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Oct 2018 03:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=BRzLd+jYLTf0RCvqJpkkaam8Z5M+G9iKo/I/l8ffe3I=;
	b=o+XPrx8F9fwffvI2V5fb6yO0L1e800Op70cRCQODyZAE1XxS6MCCHcOyg+MU0IL6x5
	n6y/doJu0zmTiiRc/XCDC4IXgRY6ze2PhgA9dIg/foBdjbtc2EwDxUzkhCG5Y6gmWKmr
	dW7ye+vXLazS5FKz5Kw5Mv+FrMB4efJ503Vz2xq4kCA12f3/KaAiPpsYt+oPlKoCHnVQ
	+z/6B9dzLw/PF4bj0CzsukXN02xQ4aAS8zH6Dwclie94oxGbz9GuSHRY1vVNeeBbTJUj
	89hIlLwIanceYlutJ1rf+/XH5NgI2aVusXTRf0MnM5azKENDZIkSATJdjcdu5g6Kvh5W
	JK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=BRzLd+jYLTf0RCvqJpkkaam8Z5M+G9iKo/I/l8ffe3I=;
	b=n/8qhbBST/RvDu7kd/aEbkWCLkanb7G3b4A+yTEuu6VT2NcM3YZlxasGFLNVkN9aV6
	TuxVQlGpsHo/rno1uL+uTc481jhEOPhG2QlLhK40nejKYEHNHb0ATFzp9nqrYlfa+bSX
	BlJJjHYOcndpFxg5/cJdAbZvXdEGvRAprBn0AAFkWMA31702Imc2lsSWksAjtUguHv1P
	8mrPIRaw5j3sQ65MoAgPeQJmF5b8IXuBd2gA0LvhBdc6rXeUMFeJhwulujwaEQIyceC4
	ovrxgwC20Z9un9MatBj9khSjtUTms61C0rIU6OtDyOw67WA8SLY6ytf/zPBPYUg4DD+V
	K6VA==
X-Gm-Message-State: ABuFfohhm2rLTbtUDzbkeYw9hSHtB2dd3NEr7kktAYSBBsrq4D8NBn9J
	PDDC2yfD2O6udq35IZmny5Ymwy16sFI=
X-Google-Smtp-Source: ACcGV60CVC8Co4uf/k6qtPItJys8+qKH1lYcN+GtY5EolhB/f30Z3pM+t5ZUYD5hpKM0X34QoQT14Q==
X-Received: by 2002:adf:9b19:: with SMTP id
	b25-v6mr4303214wrc.35.1538647496046; 
	Thu, 04 Oct 2018 03:04:56 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	k63-v6sm5647850wmd.46.2018.10.04.03.04.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Oct 2018 03:04:55 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Oct 2018 11:04:52 +0100
Message-Id: <20181004100452.9713-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libxml2: refresh CVE-2017-8872
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
X-List-Received-Date: Thu, 04 Oct 2018 10:04:56 -0000

The patch associated with the CVE-2017-8872 report was never merged into
libxml2, but a slightly different patch for the same problem was.  Cherry-pick
that as a backport, which also fixes the failing test suite.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libxml/libxml2/fix-CVE-2017-8872.patch         | 73 +++++++++++++++-------
 1 file changed, 50 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2/fix-CVE-2017-8872.patch b/meta/recipes-core/libxml/libxml2/fix-CVE-2017-8872.patch
index b34479f318f..42a4b0ed602 100644
--- a/meta/recipes-core/libxml/libxml2/fix-CVE-2017-8872.patch
+++ b/meta/recipes-core/libxml/libxml2/fix-CVE-2017-8872.patch
@@ -1,38 +1,65 @@
-From b4bee17b158e289e5c4c9045e64e5374ccafe068 Mon Sep 17 00:00:00 2001
-From: Salvatore Bonaccorso <carnil@debian.org>
-Date: Tue, 3 Jul 2018 15:54:03 +0800
-Subject: [PATCH] Out-of-bounds read in htmlParseTryOrFinish (CVE-2017-8872)
+Upstream-Status: Backport
+CVE: CVE-2017-8872
+Signed-off-by: Ross Burton <ross.burton@intel.com>
 
-https://bugzilla.gnome.org/show_bug.cgi?id=775200
-Fixes bug 775200.
+From 123234f2cfcd9e9b9f83047eee1dc17b4c3f4407 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Tue, 11 Sep 2018 14:52:07 +0200
+Subject: [PATCH] Free input buffer in xmlHaltParser
 
-Signed-off-by: Salvatore Bonaccorso <carnil@debian.org>
+This avoids miscalculation of available bytes.
 
-Upstream-Status: Submitted
-https://bug775200.bugzilla-attachments.gnome.org/attachment.cgi?id=366193
-CVE: CVE-2017-8872
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Thanks to Yunho Kim for the report.
+
+Closes: #26
 ---
- parser.c | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
+ parser.c                     |  5 +++++
+ result/errors/759573.xml.err | 17 +++++++----------
+ 2 files changed, 12 insertions(+), 10 deletions(-)
 
 diff --git a/parser.c b/parser.c
-index ca9fde2..fb4c889 100644
+index ca9fde2c..5813a664 100644
 --- a/parser.c
 +++ b/parser.c
-@@ -12464,7 +12464,11 @@ xmlHaltParser(xmlParserCtxtPtr ctxt) {
+@@ -12462,7 +12462,12 @@ xmlHaltParser(xmlParserCtxtPtr ctxt) {
+ 	    ctxt->input->free((xmlChar *) ctxt->input->base);
+ 	    ctxt->input->free = NULL;
  	}
++        if (ctxt->input->buf != NULL) {
++            xmlFreeParserInputBuffer(ctxt->input->buf);
++            ctxt->input->buf = NULL;
++        }
  	ctxt->input->cur = BAD_CAST"";
++        ctxt->input->length = 0;
  	ctxt->input->base = ctxt->input->cur;
--        ctxt->input->end = ctxt->input->cur;
-+	ctxt->input->end = ctxt->input->cur;
-+	if (ctxt->input->buf)
-+	    xmlBufEmpty (ctxt->input->buf->buffer);
-+	else
-+	    ctxt->input->length = 0;
+         ctxt->input->end = ctxt->input->cur;
      }
- }
+diff --git a/result/errors/759573.xml.err b/result/errors/759573.xml.err
+index 554039f6..38ef5c40 100644
+--- a/result/errors/759573.xml.err
++++ b/result/errors/759573.xml.err
+@@ -21,14 +21,11 @@ Entity: line 1:
+             ^
+ ./test/errors/759573.xml:1: parser error : internal error: xmlParseInternalSubset: error detected in Markup declaration
  
+-<?h?><!DOCTYPEt[<!ELEMENT t (A)><!ENTITY % xx '&#37;<![INCLUDE[000&#37;&#3000;00
+-     ^
++
++^
+ ./test/errors/759573.xml:1: parser error : DOCTYPE improperly terminated
+-<?h?><!DOCTYPEt[<!ELEMENT t (A)><!ENTITY % xx '&#37;<![INCLUDE[000&#37;&#3000;00
+-     ^
+-./test/errors/759573.xml:1: parser error : StartTag: invalid element name
+-<?h?><!DOCTYPEt[<!ELEMENT t (A)><!ENTITY % xx '&#37;<![INCLUDE[000&#37;&#3000;00
+-      ^
+-./test/errors/759573.xml:1: parser error : Extra content at the end of the document
+-<?h?><!DOCTYPEt[<!ELEMENT t (A)><!ENTITY % xx '&#37;<![INCLUDE[000&#37;&#3000;00
+-      ^
++
++^
++./test/errors/759573.xml:1: parser error : Start tag expected, '<' not found
++
++^
 -- 
-2.7.4
+2.11.0
 
-- 
2.11.0



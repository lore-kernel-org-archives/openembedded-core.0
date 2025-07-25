Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18252C87FCF
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 18:44:47 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.26631.1753469079733909863
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jul 2025 11:44:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Q3EW2Vig;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2350fc2591dso30409025ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 11:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753469079; x=1754073879; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jBuXIFvxg9nHrdiUgj/KZLU23sMXCEWoE2967Dib7Ug=;
        b=Q3EW2VigVErpECQhw2xf050B04SPBUuHzAWZeqMGpKW9z+htHFjWctTNq2JYcGVfZR
         MN9+zGuGMsmefNt8hODbjuSn/uLl8C29vw3RT39tsHhLBIxgi6SKkE+qrlPUSk9dmFfN
         /wBNPTK6/mLJ8Zwj72i2EZ+ibY9TDgtgjdOs1eqIQa5m9zIKdTfdXV+i0ZXbu14HxF9G
         REiDLK60YgX/aO9QBJ0MwaHZwGxr+DVxKB2iXvJ+yayUsdTpEdMEqRkfcmkHOR9QW9J1
         sUXMLRRD6SBfQKP7N7ypATzE89YHpPl5Bq/mbzaCik599Y1uX5taVKs1UN31uFeUYVUS
         egHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753469079; x=1754073879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jBuXIFvxg9nHrdiUgj/KZLU23sMXCEWoE2967Dib7Ug=;
        b=RdosyW2E+SlgB8pUMT2KR/gQvXmTg+EzQPpd9Mltbltz1X61/6wTTJXWp3XncHPTKs
         okcZou4CNfBtEhxoZFHuzP33WJm6YsTXkwVHvAHk7kSqvOJkH2CmI9dIjm/KQpirxFyD
         ypDRMeakHCXG7LpGm0lAZ3NGZBneDrJmlr0WqgwZwD7ocYJXCAy+MtUQ4RTcRw5k1Fny
         BJiPDCJH+IVUuCkcakTgbj20teUxCEj5CqVmYCBZ9fzxwgr0ehKfSbd9lgYjLAd6a9Jk
         FAGjBJTaVxgKqqSQhTQlWj6W2xmS2G53D7fIURdhN8o2FY8Z5AIbrN93BLEa5lH1I8iC
         HNcg==
X-Gm-Message-State: AOJu0YyfMPweljb7o5kXul6XswrTpzws2R/+u69aEMEE7GDy4+a9tfxT
	kKQdkeNpcqsRwoTD7I0mjG/YqgwhXgX05agk1pf2YMEUgqcjGqSf38Z+5qMyS5iwBbxeQ+jn6Va
	VuKO1
X-Gm-Gg: ASbGncslu10MKpf5SaXJarQZKfv+7R27/w4DVJhfeTVmVMxZchCiF1KGu1aTdV0flnD
	giF0Iud9Lwi3enEs4ppSeB7MasLYN0+/9eb/KrceqdohJlzDkfkAmdW+6gdOXICA7WmRDlEEL1/
	BpYLRiUmFui/JGLsxUY2b1BiZ8fMXhw9j7xhuMBTU53T34a5ZZAnNHI+h0Eo2tjZwiukMwouSFL
	WawtZ0mvmN5cuIpZkpDKqzkGI1RqDqWIHeEM+1G6mVVS64QYo22eECfnIuUscD83lx0N+xGbr1J
	c48U0S3yYIUeNFdHT46WpKtEdH42kTI3cNhoyBuPX+9e1ssHzAzSQcIfm1DPvWZI/x3k8MkrYO6
	94XDKwsLCBTEpTQ==
X-Google-Smtp-Source: AGHT+IF3YSxK98cWV11Ed0o3kyDinF9a103YX5mE/lqWDkW55DvjPoIa6BkNpWWd3xTQ9ex6AeIqjw==
X-Received: by 2002:a17:903:15c8:b0:235:e1d6:2ac0 with SMTP id d9443c01a7336-23fa5dc6ec9mr102197115ad.24.1753469078849;
        Fri, 25 Jul 2025 11:44:38 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b695:a542:567c:1988])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe537f8asm2451225ad.167.2025.07.25.11.44.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 11:44:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap V2 01/16] libxml2: fix CVE-2025-49795
Date: Fri, 25 Jul 2025 11:44:15 -0700
Message-ID: <b144c3ef3ba1797d925ea44d9450a6ec0fe32047.1753468892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753468892.git.steve@sakoman.com>
References: <cover.1753468892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 18:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220917

From: Roland Kovacs <roland.kovacs@est.tech>

A NULL pointer dereference vulnerability was found in libxml2 when processing
XPath XML expressions. This flaw allows an attacker to craft a malicious XML
input to libxml2, leading to a denial of service.

Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/libxml2/CVE-2025-49795.patch       | 92 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-49795.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-49795.patch b/meta/recipes-core/libxml/libxml2/CVE-2025-49795.patch
new file mode 100644
index 0000000000..2e21a99b45
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2025-49795.patch
@@ -0,0 +1,92 @@
+From 19e0a3ed092085a4d6689397d4f08cf5d86267af Mon Sep 17 00:00:00 2001
+From: Michael Mann <mmann78@netscape.net>
+Date: Sat, 21 Jun 2025 12:11:30 -0400
+Subject: [PATCH] Schematron: Fix null pointer dereference leading to DoS
+
+(CVE-2025-49795)
+
+Fixes #932
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/c24909ba2601848825b49a60f988222da3019667]
+CVE: CVE-2025-49795
+
+(cherry picked from commit c24909ba2601848825b49a60f988222da3019667)
+Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
+---
+ result/schematron/zvon16_0     | 6 ++++++
+ result/schematron/zvon16_0.err | 5 +++++
+ schematron.c                   | 5 +++++
+ test/schematron/zvon16.sct     | 7 +++++++
+ test/schematron/zvon16_0.xml   | 5 +++++
+ 5 files changed, 28 insertions(+)
+ create mode 100644 result/schematron/zvon16_0
+ create mode 100644 result/schematron/zvon16_0.err
+ create mode 100644 test/schematron/zvon16.sct
+ create mode 100644 test/schematron/zvon16_0.xml
+
+diff --git a/result/schematron/zvon16_0 b/result/schematron/zvon16_0
+new file mode 100644
+index 00000000..768cf6f5
+--- /dev/null
++++ b/result/schematron/zvon16_0
+@@ -0,0 +1,6 @@
++<?xml version="1.0"?>
++<library>
++	<book title="Test Book" id="bk101">
++		<author>Test Author</author>
++	</book>
++</library>
+diff --git a/result/schematron/zvon16_0.err b/result/schematron/zvon16_0.err
+new file mode 100644
+index 00000000..a4fab4c8
+--- /dev/null
++++ b/result/schematron/zvon16_0.err
+@@ -0,0 +1,5 @@
++Pattern: TestPattern
++xmlXPathCompOpEval: function falae not found
++XPath error : Unregistered function
++/library/book line 2: Book 
++./test/schematron/zvon16_0.xml fails to validate
+diff --git a/schematron.c b/schematron.c
+index a8259201..86c63e64 100644
+--- a/schematron.c
++++ b/schematron.c
+@@ -1481,6 +1481,11 @@ xmlSchematronFormatReport(xmlSchematronValidCtxtPtr ctxt,
+             select = xmlGetNoNsProp(child, BAD_CAST "select");
+             comp = xmlXPathCtxtCompile(ctxt->xctxt, select);
+             eval = xmlXPathCompiledEval(comp, ctxt->xctxt);
++            if (eval == NULL) {
++                xmlXPathFreeCompExpr(comp);
++                xmlFree(select);
++                return ret;
++            }
+ 
+             switch (eval->type) {
+             case XPATH_NODESET: {
+diff --git a/test/schematron/zvon16.sct b/test/schematron/zvon16.sct
+new file mode 100644
+index 00000000..f03848aa
+--- /dev/null
++++ b/test/schematron/zvon16.sct
+@@ -0,0 +1,7 @@
++<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron">
++	<sch:pattern id="TestPattern">
++		<sch:rule context="book">
++			<sch:report test="not(@available)">Book <sch:value-of select="falae()"/> test</sch:report>
++		</sch:rule>
++	</sch:pattern>
++</sch:schema>
+diff --git a/test/schematron/zvon16_0.xml b/test/schematron/zvon16_0.xml
+new file mode 100644
+index 00000000..551e2d65
+--- /dev/null
++++ b/test/schematron/zvon16_0.xml
+@@ -0,0 +1,5 @@
++<library>
++	<book title="Test Book" id="bk101">
++		<author>Test Author</author>
++	</book>
++</library>
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index 488ace62e5..c289de6f73 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -22,6 +22,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2025-32415.patch \
            file://CVE-2025-6021.patch \
            file://CVE-2025-49794-CVE-2025-49796.patch \
+           file://CVE-2025-49795.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"
-- 
2.43.0



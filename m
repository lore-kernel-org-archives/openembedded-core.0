Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 493E4C83F26
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 21:35:50 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.5113.1753392942515706679
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 14:35:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TJsRr/kj;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7490acf57b9so1075057b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 14:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753392942; x=1753997742; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jBuXIFvxg9nHrdiUgj/KZLU23sMXCEWoE2967Dib7Ug=;
        b=TJsRr/kjVzVqEIW7nSQwHXH1lV8Voh7yWm5FL+jGoBMoRdxIsphnhxIIU86Avpuf+t
         tmnli2OrPP87Vu6Vi5wGolCqJT4MmPXWngaWMgVXEa/3YuT74mzNali3QW8J8eYuhGDN
         KxiVMzpkMtwunaPlT8n96wqxSitVTLPlZgr4XpM0q5BqW+v17ioKSFhg+AoyP9a5cph8
         i9fn70Ail/E/GXEPGUxbPR7DiHBC23KhCUEyvkF3Inxya/LTl9kkbUCkVzmgyHiae/WY
         6WSZMBZ3GeDrY9/ZQnNJrxRJvCqMTvnDIo/N0RqwSWzXtj/1FPwxpGw9NK8AZglEMXHZ
         w3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753392942; x=1753997742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jBuXIFvxg9nHrdiUgj/KZLU23sMXCEWoE2967Dib7Ug=;
        b=f+1K+WwD+J8INbvqu8IrqfMGv571IxMezK4MzFDKi4vC2lb5ON70JcoaCDpwTN7NKj
         pUKjKt2jt1YrbgdB4xnrn1RHb3NhAWZ68zB89eXcy+G9eQcQZa8Ov2gNfNFL3ayT6EdR
         oI/RMy6Qjz3ErsZh6HFBsn2COv/+aYiZg/JK10syBTB3VxgKr5SDQWyqm4dPuGC/11Sw
         H79nRgo8tlfaHAgv7eviPSfNBFfaW9QQJpH7UTZGMa8tC9rYbts2EJMDAvHY1mZLMR2m
         XE8qjNjNR3PtsvHXX7PtTs1iEWiVORFt24aMGlHovTRyj+FqWr15p2yjrm/8ZgyPYfx/
         wuKA==
X-Gm-Message-State: AOJu0YzySnWBHHSZpTPg4EsTVce4OjUJUYo/eRgMXbZpWqQNwozY8Kga
	yK57wF+G6KhuijRYxq5AkuGsuVZQLC3sYNIbWKcMmXjhgqDRrk5175LQIM/KcmJZpS5KA6EhWok
	Hqnld
X-Gm-Gg: ASbGncvu7ekwP4pqEDIEVpBQ8sf/9SR8zbKF4J1BRrHrB0SdyDgK6l8FGsRmUEI4OOm
	VZymQkg96+KRRQG2a2GvV2JEOqJrstNSYBpaNE8grdXDqErligFdgG/J0EY2pr6yUGS9u2nQB8F
	E9QXlbOI3VGsBFVmF+TjcFRklTA4Vtz4EvYFP+BPJESn7RhG7FPD5gA4Iym4tLK6m2tin2VtuLF
	s5e8uOBczZd6pfBa+4OESLZjr4Xa4P6hyyVM1Yd+1dVe7Rfb/CEhVfn92CaDBHosgLU9bFJMC9Q
	BLhAHk40/eiU2jcePH9YkJXY6s/DIOTe9QnpgaetWp7Kh9v3yHV6kAublk2r5hHC50BlMfChbVe
	gQ+5t/Nj7a81F
X-Google-Smtp-Source: AGHT+IFrwgjt8meu3Ufcv9TXd1BQ1xcmI9WL8Ot9a7kwD0UuGx+YlF9fpY8PM2+L+vvaJa2/WTuTQA==
X-Received: by 2002:a05:6a00:ba8e:b0:748:6a1f:6d3b with SMTP id d2e1a72fcca58-760353d2cd3mr12155397b3a.19.1753392941724;
        Thu, 24 Jul 2025 14:35:41 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:e2fc:f94:bcdc:cb9e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761ae158129sm2253735b3a.32.2025.07.24.14.35.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 14:35:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/16] libxml2: fix CVE-2025-49795
Date: Thu, 24 Jul 2025 14:35:17 -0700
Message-ID: <b144c3ef3ba1797d925ea44d9450a6ec0fe32047.1753392770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753392770.git.steve@sakoman.com>
References: <cover.1753392770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 21:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220874

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



Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A6CC83F34
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 02:56:01 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web11.40455.1752720953554209426
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 19:55:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PCidTTnM;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b31d489a76dso380098a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 19:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752720953; x=1753325753; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TtS41Au2G7ZoFdyJpu6LiFRoSQSvMV7x2WznWVjXGbI=;
        b=PCidTTnM55R5/wjdidtfqaBH+oYsxQTYHvRttYyn9eXm114+Z2SiWT5V352t9gHaJB
         85etD6FlH0mpwujhsNpjcKa2Igw5nVDEe4oeTESEPkLvlYinypbOJHQccliWypj1wwta
         AXtohXUdjNG13RD0Zl/HY625eGaRdTck/LwJoby+ANSTYuf4hIHBlusDn9l8sYsoebuB
         i9iLKrcinI0/ZqiJuzsB0rZS20icWmfhrthPnjBSPnj6olyBlrbAajx2I2khpkWsTYrJ
         Ki5/Rh3IxJe05VYU3j0VwFAq/+RwRLm6bqpZPcNDyb0ULT433Ms1OlBylRFeaOAGdYf/
         fcJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752720953; x=1753325753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TtS41Au2G7ZoFdyJpu6LiFRoSQSvMV7x2WznWVjXGbI=;
        b=MudIfEpw7+pJEeuZ0xPN9JuBj2ohiUdssD75yNc6yboTjA1MwhkbOT/S1S33GE78Ih
         Ke7MGKKw3AzNgCGLLr7UXOXuqHDf66hnN59ZS7E4gduh6K5OajN/3fNv3r5czMgli3J3
         tDEKerYKlV4xIXU3FY7tDFcvXOIqmc5Rq7d6vZPK1q8G58u5IdoGI287wDO4RK9/iQru
         vnptYbAg0gmZxcDDsDQER7sCpJawcWxn60MVGuZzh610ePZwRAKc51GBTEhAdxTVrML/
         4jkQ2zVUFqP55ouHcoZOBkBzPPRWkbEhDNJoA8khh6tyMR6uPbN1boudrpXIfhzwB71m
         Vrkg==
X-Gm-Message-State: AOJu0Yw7imju/eHRMsaiuSzj6ooRa0+h2MxfSzJf5Kh9Noc1YZOL1Qdc
	SnDmmbQYxiDOX3qKn1nFDa7t7foKcN0ifUji+7D1W1UHzWzu/zvm5p2Ad84ygraShvHybuETiOk
	sPWrO
X-Gm-Gg: ASbGncvRevzrU7xnFv3rUOsCYhrve2f3ULn7xKSOQJIfuCBgLkT/YST61FbQIVuOT8E
	Nbu816FCvFFDW7K1cnqd9wDGp/PclzDwfxz/2/oF8ec1jQLqkFidg4OsGLjg7r7ulxfGBDSjOzi
	tXyJAJaGmf23Ru8XBh2FVZvG5JEDc1KlWQ88Zkltr/WLNB7seISeJkBdOhFLT138PgOARyBQdxI
	VSo2YbH/G/xyZELWbK0oaM0PPbMfb+aV+qituzKGfCLNiJzqHPuF2xYSuLQC7SJXq+y2Z2qRJ8Y
	zIFbdf6DqQQIdt9y+bmZUxG/VrXVqmZSQPc3vwCBgzfEgSLusEFPdO1l4LsH/nISr6C0c+i533F
	f30utjRcSvn2DAQ==
X-Google-Smtp-Source: AGHT+IGL9YvneNHuzBpIiXxhSDpGZ4CKhHr6UMWPM9nTzPSOqz0+ct/NZbNVzWYUbMA61FWzjo0PSQ==
X-Received: by 2002:a17:903:b90:b0:237:ec18:ead7 with SMTP id d9443c01a7336-23e2572fbd9mr90219795ad.24.1752720952572;
        Wed, 16 Jul 2025 19:55:52 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3bfc:8fec:7e35:e96a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f288173sm2333256a91.25.2025.07.16.19.55.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 19:55:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 07/13] libxml2: fix CVE-2025-49795
Date: Wed, 16 Jul 2025 19:55:30 -0700
Message-ID: <9f17e0911eeb49e007de8ee3e50d9f3f38e08a26.1752720827.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752720827.git.steve@sakoman.com>
References: <cover.1752720827.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 02:56:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220493

From: Divya Chellam <divya.chellam@windriver.com>

A NULL pointer dereference vulnerability was found in libxml2 when
processing XPath XML expressions. This flaw allows an attacker to
craft a malicious XML input to libxml2, leading to a denial of service.

Pick commit from 2.13 branch

Reference:
https://security-tracker.debian.org/tracker/CVE-2025-49795

Upstream-patch:
https://gitlab.gnome.org/GNOME/libxml2/-/commit/62048278a4c5fdf14d287dfb400005c0a0caa69f

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/libxml2/CVE-2025-49795.patch       | 75 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.13.8.bb    |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2025-49795.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2025-49795.patch b/meta/recipes-core/libxml/libxml2/CVE-2025-49795.patch
new file mode 100644
index 0000000000..11f543cb9b
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2025-49795.patch
@@ -0,0 +1,75 @@
+From 62048278a4c5fdf14d287dfb400005c0a0caa69f Mon Sep 17 00:00:00 2001
+From: Michael Mann <mmann78@netscape.net>
+Date: Sat, 21 Jun 2025 12:11:30 -0400
+Subject: [PATCH] [CVE-2025-49795] schematron: Fix null pointer dereference
+ leading to DoS
+
+Fixes #932
+
+CVE: CVE-2025-49795
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/62048278a4c5fdf14d287dfb400005c0a0caa69f]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ result/schematron/zvon16_0.err | 3 +++
+ schematron.c                   | 5 +++++
+ test/schematron/zvon16.sct     | 7 +++++++
+ test/schematron/zvon16_0.xml   | 5 +++++
+ 4 files changed, 20 insertions(+)
+ create mode 100644 result/schematron/zvon16_0.err
+ create mode 100644 test/schematron/zvon16.sct
+ create mode 100644 test/schematron/zvon16_0.xml
+
+diff --git a/result/schematron/zvon16_0.err b/result/schematron/zvon16_0.err
+new file mode 100644
+index 0000000..3d05240
+--- /dev/null
++++ b/result/schematron/zvon16_0.err
+@@ -0,0 +1,3 @@
++XPath error : Unregistered function
++./test/schematron/zvon16_0.xml:2: element book: schematron error : /library/book line 2: Book 
++./test/schematron/zvon16_0.xml fails to validate
+diff --git a/schematron.c b/schematron.c
+index 426300c..6e2ceeb 100644
+--- a/schematron.c
++++ b/schematron.c
+@@ -1509,6 +1509,11 @@ xmlSchematronFormatReport(xmlSchematronValidCtxtPtr ctxt,
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
+index 0000000..f03848a
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
+index 0000000..551e2d6
+--- /dev/null
++++ b/test/schematron/zvon16_0.xml
+@@ -0,0 +1,5 @@
++<library>
++	<book title="Test Book" id="bk101">
++		<author>Test Author</author>
++	</book>
++</library>
+-- 
+2.40.0
+
diff --git a/meta/recipes-core/libxml/libxml2_2.13.8.bb b/meta/recipes-core/libxml/libxml2_2.13.8.bb
index 3d6ecf5458..fd042c311d 100644
--- a/meta/recipes-core/libxml/libxml2_2.13.8.bb
+++ b/meta/recipes-core/libxml/libxml2_2.13.8.bb
@@ -19,6 +19,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            file://CVE-2025-6021.patch \
            file://CVE-2025-49794_CVE-2025-49796.patch \
+           file://CVE-2025-49795.patch \
            "
 
 SRC_URI[archive.sha256sum] = "277294cb33119ab71b2bc81f2f445e9bc9435b893ad15bb2cd2b0e859a0ee84a"
-- 
2.43.0



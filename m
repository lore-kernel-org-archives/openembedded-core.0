Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B53C5C7EE2A
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 21:28:28 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.8894.1683840506803282664
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 May 2023 14:28:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Va7fIsd+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-64ab2a37812so368063b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 14:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683840506; x=1686432506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8vV9MkaTeJAXAbVaUpaWzznxG5o5jGtRLIk7kLvV70=;
        b=Va7fIsd+TzEUQFoSBu1b8u+IRe7WimKxQtynE8n2EdRiDU2PVZN+1aL3+7jDWjEqPy
         06sAUebQ5DFiEzAAqA1GGQ0EX2fGn+Ot9LOW85ofwBqUNmRStI7+IY+yPlXX6BaMmWIg
         WikjNXmoIEqj2iu1D4l7VEbniUg/oOiQM1CipBQu1IyGxf2wPW+MJvQxPyelEqRfHEHc
         3asfS4LTmVMOylTyYxKKXAVAHne82AhQ5wh4Ur+QYnZR24kAi8KZQUdDbaikWg0vWa/0
         y46yOaVkUdumZzYHdZvrvafRae27dLw2OoBTB36d4mRiRV/8IqQ9ES6OgY/9Y9rSXo59
         SPBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683840506; x=1686432506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m8vV9MkaTeJAXAbVaUpaWzznxG5o5jGtRLIk7kLvV70=;
        b=l2Mn8NDDLBHc2fbQRiHxcpBPiFiYLhYddGjYv9jZPJu0DDnI1cj5gRFL7+hWhHE+fi
         sRyRTnCiemY0ie+E9SnyA1/5XjU+HDrtbGd3vqHcBoe5D1jVHhMCnukbKEazy1lhkKnk
         E9Ry5U0+oIz3zuWOz2ccRq44InFQ8KdlCcf/lvoPG9Wz0VIOsCcSG8nxzKKwd3xW6C/i
         gKo5xvc3RT+dq/G6py3eobtMSrJUhYcvCHA80Ik6A8bjtGAJqhgOlkRGFbjr5Wu4BQaV
         +EgcNd4g0DGMzpOTmHntdWhUsOWrL2UtBMDzRfMGjUQd88gr33OKfzB7CBhrOlCUEnyg
         xnzw==
X-Gm-Message-State: AC+VfDwp51zgG/gSNs1CmMp3KjSlvyJyRpHYWg1wYcEPTZxnbtJ69vo4
	NyEgDgKtFXrdOoSEc5mqMTxaQp7EPpY1ZtY2A5A=
X-Google-Smtp-Source: ACHHUZ7eF+kzFmh/oiE8sr0iF0T/szEzs4NiCO7LxDLrCRBRgeNT8DVsr9ryFzXb1ZzAVdlLsy7qsA==
X-Received: by 2002:a05:6a20:6a27:b0:101:7703:3376 with SMTP id p39-20020a056a206a2700b0010177033376mr11443374pzk.4.1683840505458;
        Thu, 11 May 2023 14:28:25 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id e5-20020aa78c45000000b00640defda6d2sm5671981pfd.207.2023.05.11.14.28.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 14:28:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/7] libxml2: patch CVE-2023-28484 and CVE-2023-29469
Date: Thu, 11 May 2023 11:28:07 -1000
Message-Id: <c0cfcd3945257efd40745e0ebb84495441acb590.1683840390.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683840390.git.steve@sakoman.com>
References: <cover.1683840390.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 May 2023 21:28:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181149

From: Peter Marko <peter.marko@siemens.com>

Backports from:
* https://gitlab.gnome.org/GNOME/libxml2/-/commit/e4f85f1bd2eb34d9b49da9154a4cc3a1bc284f68
* https://gitlab.gnome.org/GNOME/libxml2/-/commit/547edbf1cbdccd46b2e8ff322a456eaa5931c5df

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/libxml2/CVE-2023-28484.patch       | 79 +++++++++++++++++++
 .../libxml/libxml2/CVE-2023-29469.patch       | 42 ++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |  2 +
 3 files changed, 123 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2023-28484.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2023-29469.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2023-28484.patch b/meta/recipes-core/libxml/libxml2/CVE-2023-28484.patch
new file mode 100644
index 0000000000..907f2c4d47
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2023-28484.patch
@@ -0,0 +1,79 @@
+From e4f85f1bd2eb34d9b49da9154a4cc3a1bc284f68 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Fri, 7 Apr 2023 11:46:35 +0200
+Subject: [PATCH] [CVE-2023-28484] Fix null deref in xmlSchemaFixupComplexType
+
+Fix a null pointer dereference when parsing (invalid) XML schemas.
+
+Thanks to Robby Simpson for the report!
+
+Fixes #491.
+
+CVE: CVE-2023-28484
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/e4f85f1bd2eb34d9b49da9154a4cc3a1bc284f68]
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ result/schemas/issue491_0_0.err |  1 +
+ test/schemas/issue491_0.xml     |  1 +
+ test/schemas/issue491_0.xsd     | 18 ++++++++++++++++++
+ xmlschemas.c                    |  2 +-
+ 4 files changed, 21 insertions(+), 1 deletion(-)
+ create mode 100644 result/schemas/issue491_0_0.err
+ create mode 100644 test/schemas/issue491_0.xml
+ create mode 100644 test/schemas/issue491_0.xsd
+
+diff --git a/result/schemas/issue491_0_0.err b/result/schemas/issue491_0_0.err
+new file mode 100644
+index 00000000..9b2bb969
+--- /dev/null
++++ b/result/schemas/issue491_0_0.err
+@@ -0,0 +1 @@
++./test/schemas/issue491_0.xsd:8: element complexType: Schemas parser error : complex type 'ChildType': The content type of both, the type and its base type, must either 'mixed' or 'element-only'.
+diff --git a/test/schemas/issue491_0.xml b/test/schemas/issue491_0.xml
+new file mode 100644
+index 00000000..e2b2fc2e
+--- /dev/null
++++ b/test/schemas/issue491_0.xml
+@@ -0,0 +1 @@
++<Child xmlns="http://www.test.com">5</Child>
+diff --git a/test/schemas/issue491_0.xsd b/test/schemas/issue491_0.xsd
+new file mode 100644
+index 00000000..81702649
+--- /dev/null
++++ b/test/schemas/issue491_0.xsd
+@@ -0,0 +1,18 @@
++<?xml version='1.0' encoding='UTF-8'?>
++<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.test.com" targetNamespace="http://www.test.com" elementFormDefault="qualified" attributeFormDefault="unqualified">
++  <xs:complexType name="BaseType">
++    <xs:simpleContent>
++      <xs:extension base="xs:int" />
++    </xs:simpleContent>
++  </xs:complexType>
++  <xs:complexType name="ChildType">
++    <xs:complexContent>
++      <xs:extension base="BaseType">
++        <xs:sequence>
++          <xs:element name="bad" type="xs:int" minOccurs="0" maxOccurs="1"/>
++        </xs:sequence>
++      </xs:extension>
++    </xs:complexContent>
++  </xs:complexType>
++  <xs:element name="Child" type="ChildType" />
++</xs:schema>
+diff --git a/xmlschemas.c b/xmlschemas.c
+index 6a353858..a4eaf591 100644
+--- a/xmlschemas.c
++++ b/xmlschemas.c
+@@ -18632,7 +18632,7 @@ xmlSchemaFixupComplexType(xmlSchemaParserCtxtPtr pctxt,
+ 			"allowed to appear inside other model groups",
+ 			NULL, NULL);
+ 
+-		} else if (! dummySequence) {
++		} else if ((!dummySequence) && (baseType->subtypes != NULL)) {
+ 		    xmlSchemaTreeItemPtr effectiveContent =
+ 			(xmlSchemaTreeItemPtr) type->subtypes;
+ 		    /*
+-- 
+GitLab
+
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2023-29469.patch b/meta/recipes-core/libxml/libxml2/CVE-2023-29469.patch
new file mode 100644
index 0000000000..1252668577
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2023-29469.patch
@@ -0,0 +1,42 @@
+From 547edbf1cbdccd46b2e8ff322a456eaa5931c5df Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Fri, 7 Apr 2023 11:49:27 +0200
+Subject: [PATCH] [CVE-2023-29469] Hashing of empty dict strings isn't
+ deterministic
+
+When hashing empty strings which aren't null-terminated,
+xmlDictComputeFastKey could produce inconsistent results. This could
+lead to various logic or memory errors, including double frees.
+
+For consistency the seed is also taken into account, but this shouldn't
+have an impact on security.
+
+Found by OSS-Fuzz.
+
+Fixes #510.
+
+CVE: CVE-2023-29469
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/547edbf1cbdccd46b2e8ff322a456eaa5931c5df]
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ dict.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/dict.c b/dict.c
+index 86c3f6d7..d7fd1a06 100644
+--- a/dict.c
++++ b/dict.c
+@@ -451,7 +451,8 @@ static unsigned long
+ xmlDictComputeFastKey(const xmlChar *name, int namelen, int seed) {
+     unsigned long value = seed;
+ 
+-    if (name == NULL) return(0);
++    if ((name == NULL) || (namelen <= 0))
++        return(value);
+     value = *name;
+     value <<= 5;
+     if (namelen > 10) {
+-- 
+GitLab
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index 40e3434ead..034192d64e 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -36,6 +36,8 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=${BP};name=te
            file://CVE-2016-3709.patch \
            file://CVE-2022-40303.patch \
            file://CVE-2022-40304.patch \
+           file://CVE-2023-28484.patch \
+           file://CVE-2023-29469.patch \
            "
 
 SRC_URI[archive.sha256sum] = "593b7b751dd18c2d6abcd0c4bcb29efc203d0b4373a6df98e3a455ea74ae2813"
-- 
2.34.1



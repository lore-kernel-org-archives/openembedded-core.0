Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C75C77B75
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 22:32:55 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.3054.1683671573412115255
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 15:32:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Hp/o4PRq;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-643a1656b79so4266533b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 15:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683671572; x=1686263572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=feHjBeToHJfaALxNwU2araMQ339rVDEdUH8gcvaSILk=;
        b=Hp/o4PRqg+PE7ztLGfuZP5HkXSAKkfJam9tiD2MDKz9lc9vsBL9RIEfwGqTOQhgXw7
         VEvH0j3MDUFMnF6chaUUhrJRqwF0/Xfq6nL/+cdoeSS1rLbRCZjmysL0hMAodeDiyBDg
         H7wZVZ5C/Yk3Z8QiCac2BzwWg6xiusMzeWC1vmIrc25UMUs8KvJaNqb1jPDL9QRL9XOK
         nCpnkfxCE/mj9M7D0RHiUZ3o6Pu5AFHlzbZVup/Ibhr7sOWX5SbOWUzO1uf+X//fmQLO
         6M9bqVOBtD5pFpUu5q1SyJARHUiFfUg9C8bPPK+f5G+6sOuo8lpkTyvexQHziN3O5qG4
         kywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683671572; x=1686263572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=feHjBeToHJfaALxNwU2araMQ339rVDEdUH8gcvaSILk=;
        b=Zv1JFGsIAbrYzO9/KS8oSSM1AKjTcrNn6YzhZOGenb+uYwz0EtR/PI9py/WDxkRfBM
         26TRWeTYQetxf4CjGaFzPYpnq32pmzjdFKMK02bypnZ7efJl6Iihz60W/OK3yvEqz/2i
         C49FRiOLpdyY+qblon6S/nOxeXDGK6S2KGAtFGBxeSx3CPemAVgr+f0zq80DMxFh8Vgd
         PK8RgOSf3jSCMUFyp7ZzFZBurUGujmcFXmWZ90uztrr+XpmB5/9T5jYtCQ1h3y6rR7gj
         ThFxMyvS6QwlNkctEXQw4n9frNemvWXxt7MALJb9KKUe1tzjPn9EafTdmrRVCPU2MSB+
         aD9g==
X-Gm-Message-State: AC+VfDyI3R1vvB6Zt7fwrQIdICN/E8BLyfxanAVoGgkvYeuxHVkK/OU7
	I9yIcJ7eDCMS/4G5hW0WDXZRfhhNLFYV/RvCcYM=
X-Google-Smtp-Source: ACHHUZ4+q406hBGemIJgOtoUKJgqsbYX4RWcuFMGiTkb2+EiOC/HuO06nq2QFHqypKiAMWZNlQfSyg==
X-Received: by 2002:a05:6a00:150b:b0:645:c730:f826 with SMTP id q11-20020a056a00150b00b00645c730f826mr13471772pfu.24.1683671572383;
        Tue, 09 May 2023 15:32:52 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u17-20020aa78491000000b0063d2dae6247sm2263125pfn.77.2023.05.09.15.32.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 15:32:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/15] libxml2: patch CVE-2023-28484 and CVE-2023-29469
Date: Tue,  9 May 2023 12:32:29 -1000
Message-Id: <7d03d5dbc98aa701869c73c1c55a5868c70c5287.1683671423.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683671423.git.steve@sakoman.com>
References: <cover.1683671423.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 22:32:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181088

From: Peter Marko <peter.marko@siemens.com>

Backports from:
* https://gitlab.gnome.org/GNOME/libxml2/-/commit/e4f85f1bd2eb34d9b49da9154a4cc3a1bc284f68
* https://gitlab.gnome.org/GNOME/libxml2/-/commit/547edbf1cbdccd46b2e8ff322a456eaa5931c5df

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/libxml2/CVE-2023-28484.patch       | 79 +++++++++++++++++++
 .../libxml/libxml2/CVE-2023-29469.patch       | 42 ++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |  2 +
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
index 0000000000..f60d160c49
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
+@@ -433,7 +433,8 @@ static unsigned long
+ xmlDictComputeFastKey(const xmlChar *name, int namelen, int seed) {
+     unsigned long value = seed;
+ 
+-    if (name == NULL) return(0);
++    if ((name == NULL) || (namelen <= 0))
++        return(value);
+     value += *name;
+     value <<= 5;
+     if (namelen > 10) {
+-- 
+GitLab
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index e15f8eb13f..9241b279e4 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -25,6 +25,8 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar;subdir=${BP};name=testt
            file://0001-Port-gentest.py-to-Python-3.patch \
            file://CVE-2022-40303.patch \
            file://CVE-2022-40304.patch \
+           file://CVE-2023-28484.patch \
+           file://CVE-2023-29469.patch \
            "
 
 SRC_URI[archive.sha256sum] = "60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee"
-- 
2.34.1



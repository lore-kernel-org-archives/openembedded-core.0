Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D81DDC77B75
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 21:41:24 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.93636.1683495677991009039
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 May 2023 14:41:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=De/YtBoW;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20230507214113d6376bdb35a8ccd681-v2fxgq@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20230507214113d6376bdb35a8ccd681
        for <openembedded-core@lists.openembedded.org>;
        Sun, 07 May 2023 23:41:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=h7OeXPdvFSxLgnMdS+/MeiPg+7ZlpNtMQNcMDdq2l90=;
 b=De/YtBoWUyvPIsevMHLA8sLS9Yx0IwsGlYRbPW/ueELP9y07UIcm2pSQvsFp5KF4rq6v8o
 AMfcPxO+An9kL+07vkBWvH8VlhIrVsVAvAvVboCA92cYQSQnbgLah8aA4QrVxAfoP0vuV+JH
 9v1Xf25RGB8j8xUiK8q0nXNYrtlWc=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][dunfell][PATCH] libxml2: patch CVE-2023-28484 and CVE-2023-29469
Date: Sun,  7 May 2023 23:40:12 +0200
Message-Id: <20230507214012.2975263-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 May 2023 21:41:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181009

Backports from:
* https://gitlab.gnome.org/GNOME/libxml2/-/commit/e4f85f1bd2eb34d9b49da9154a4cc3a1bc284f68
* https://gitlab.gnome.org/GNOME/libxml2/-/commit/547edbf1cbdccd46b2e8ff322a456eaa5931c5df

Signed-off-by: Peter Marko <peter.marko@siemens.com>
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
2.30.2



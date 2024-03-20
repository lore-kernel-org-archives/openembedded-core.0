Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 500A4CD11BF
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:10:23 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.49391.1710951018315086305
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 09:10:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nmspTbVK;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1dffa5e3f2dso27388815ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 09:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710951017; x=1711555817; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=un6d+Llcm9ogjVszlygMZtzDe+aBKdeo1O6Ef5bR++c=;
        b=nmspTbVKfOqUf7D3bSJZBVKurAOQFJEVCRIaYEiT1uDAJUCuPhV37AEfKa2IIxSp1B
         BfJvvRH3QRDR8N58nfH1ZCrbZZWvqJBz9zST8nf3YBY1UGsF/CQ5fkOTV/7n28B8vb67
         GgmoKQdS0mh3rm7tj3xmgMBZfKzoJrJYnQFz6DIuwuHFACHHz5gx7g3BurRlvVQtmnJM
         V43LSpC53DLlKnwB60fQ4eHBgWLs9Yi7zPxuadO0XxpIJFpnXdUXqMiE1p4E8CnrcOO2
         hr/2pAX/UHOhCLY7kguhZoRntk5tQ5FaogFb2KWRDdXUaUc+u0xtRY3crwG8KHYNIVeF
         lFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710951017; x=1711555817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=un6d+Llcm9ogjVszlygMZtzDe+aBKdeo1O6Ef5bR++c=;
        b=I2R2lJgIsnk/SUZxQusAOy0DFgdqmDgtqJQ5AcbuVowf4erWrbW95ZM0RN6Y6INpUW
         RCDtwv5HB745Db3I7FI8Ur7msswMUFhOtrNx3LG3AY3r+m7ccaHp3cYi4UCcz43Nz3LS
         aWRQOWkELM68110a8+EInLKO1gIWGc7aQ3tVhb2cundee2H6zjheXHcf6z418cZi/Gga
         GqKkmNOHSUTfqs5Ywdz9ATU2AHpamSpKVfwxcckQtk08EVSSLgXryaUwFBc0dLjejaB+
         O+eJHZ5ZYZ0x5GzYs+XuoueF47KkY2fbXfMNpalw/FT/l9t/rS8v/TBvvQelSjL0s32U
         OkzQ==
X-Gm-Message-State: AOJu0YwqHlN3wi9JTb8QiK3gKq8m+IpU1degGGV2eWRsZQS2uwIOWmL7
	w2ErAIezA0TQ+xLRRwGVIqDRPuOQeiOx8KlvlPtcfyd93OlS+ZYnwPsWQKdKvimsKZa+4sQ48vS
	nWHI=
X-Google-Smtp-Source: AGHT+IGhvtxHBRtgu3GlB4Airdxvpr5XQZpFACtcWHSmDXM/qglzqt2rBylRvk3ePQKqJznyW1Of6A==
X-Received: by 2002:a17:902:b216:b0:1e0:c9a:38c7 with SMTP id t22-20020a170902b21600b001e00c9a38c7mr5421048plr.32.1710951017501;
        Wed, 20 Mar 2024 09:10:17 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id l18-20020a170903121200b001ddc93c5759sm13775694plh.196.2024.03.20.09.10.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 09:10:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/15] expat: patch CVE-2024-28757
Date: Wed, 20 Mar 2024 06:09:39 -1000
Message-Id: <c02175e97348836429cecbfad15d89be040bbd92.1710950846.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710950846.git.steve@sakoman.com>
References: <cover.1710950846.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 16:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197372

From: Peter Marko <peter.marko@siemens.com>

Picked patch from https://github.com/libexpat/libexpat/pull/842
which is referenced in the NVD CVE report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../expat/expat/CVE-2024-28757.patch          | 58 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.5.0.bb        |  1 +
 2 files changed, 59 insertions(+)
 create mode 100755 meta/recipes-core/expat/expat/CVE-2024-28757.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2024-28757.patch b/meta/recipes-core/expat/expat/CVE-2024-28757.patch
new file mode 100755
index 0000000000..768dab0c84
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2024-28757.patch
@@ -0,0 +1,58 @@
+From 1d50b80cf31de87750103656f6eb693746854aa8 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 4 Mar 2024 23:49:06 +0100
+Subject: [PATCH] lib/xmlparse.c: Detect billion laughs attack with isolated
+ external parser
+
+When parsing DTD content with code like ..
+
+  XML_Parser parser = XML_ParserCreate(NULL);
+  XML_Parser ext_parser = XML_ExternalEntityParserCreate(parser, NULL, NULL);
+  enum XML_Status status = XML_Parse(ext_parser, doc, (int)strlen(doc), XML_TRUE);
+
+.. there are 0 bytes accounted as direct input and all input from `doc` accounted
+as indirect input.  Now function accountingGetCurrentAmplification cannot calculate
+the current amplification ratio as "(direct + indirect) / direct", and it did refuse
+to divide by 0 as one would expect, but it returned 1.0 for this case to indicate
+no amplification over direct input.  As a result, billion laughs attacks from
+DTD-only input were not detected with this isolated way of using an external parser.
+
+The new approach is to assume direct input of length not 0 but 22 -- derived from
+ghost input "<!ENTITY a SYSTEM 'b'>", the shortest possible way to include an external
+DTD --, and do the usual "(direct + indirect) / direct" math with "direct := 22".
+
+GitHub issue #839 has more details on this issue and its origin in ClusterFuzz
+finding 66812.
+
+CVE: CVE-2024-28757
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/1d50b80cf31de87750103656f6eb693746854aa8]
+
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/xmlparse.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index b884d82b5..d44baa68d 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -7655,6 +7655,8 @@ copyString(const XML_Char *s, const XML_Memory_Handling_Suite *memsuite) {
+ 
+ static float
+ accountingGetCurrentAmplification(XML_Parser rootParser) {
++  //                                          1.........1.........12 => 22
++  const size_t lenOfShortestInclude = sizeof("<!ENTITY a SYSTEM 'b'>") - 1;
+   const XmlBigCount countBytesOutput
+       = rootParser->m_accounting.countBytesDirect
+         + rootParser->m_accounting.countBytesIndirect;
+@@ -7662,7 +7664,9 @@ accountingGetCurrentAmplification(XML_Parser rootParser) {
+       = rootParser->m_accounting.countBytesDirect
+             ? (countBytesOutput
+                / (float)(rootParser->m_accounting.countBytesDirect))
+-            : 1.0f;
++            : ((lenOfShortestInclude
++                + rootParser->m_accounting.countBytesIndirect)
++               / (float)lenOfShortestInclude);
+   assert(! rootParser->m_parentParser);
+   return amplificationFactor;
+ }
diff --git a/meta/recipes-core/expat/expat_2.5.0.bb b/meta/recipes-core/expat/expat_2.5.0.bb
index 7080f934d1..eb7ce1436e 100644
--- a/meta/recipes-core/expat/expat_2.5.0.bb
+++ b/meta/recipes-core/expat/expat_2.5.0.bb
@@ -10,6 +10,7 @@ VERSION_TAG = "${@d.getVar('PV').replace('.', '_')}"
 
 SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://run-ptest \
+           file://CVE-2024-28757.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.34.1



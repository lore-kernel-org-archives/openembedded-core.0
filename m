Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B104AC54E60
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 20:03:58 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.5937.1710360234550216520
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 13:03:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=X/v3E5SF;
 spf=pass (domain: mvista.com, ip: 209.85.210.171, mailfrom: asharma@mvista.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6e6b54a28ebso308143b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 13:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1710360234; x=1710965034; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f8B+LJ/tUU0St7+/ULxNnUZIHBMoeVePFizzadpEdHQ=;
        b=X/v3E5SFZRZ72KYfxcVPFelpInUR4+YzB6tQ5FN0Qq0M5ISE04dn3cShv6KW00XM9g
         yCnlhaV/PzDlRpFfXvjT8u69GJFCT37nvcdoysbgilQQbiAnpEd7jSpbD6U9pMOhUbna
         g7CO2dJY0dd6YryYWcsn0bQgwBvdrooGsq3oE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710360234; x=1710965034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f8B+LJ/tUU0St7+/ULxNnUZIHBMoeVePFizzadpEdHQ=;
        b=p9BeeGPIa1mHOCeMNoxVxbX8RXeYXH7qXX4fDdhQHbysC2BGe7Krm9CfRdPuT6EUOK
         BpFukdxvolOFBR3GTg3zeZQPUGk66n9lPRUXZD+LEXc9YQy8VHDlhGIvIKgZUaFkV1dt
         K2u9smTAPJIikVaNwDH8+7OdCYJdrVMrARHoUId95/eGVhY81QQs0IDqL3OQ+XBpOv/O
         /yKJs6a9qjMnBLdIn8IFb8z1l0IYVh9hqt5RueDv5k04c97k4euMguk9X9JmddCJE1xr
         MeWl8uwWAprq7S0P/BiT83Bhl95phf0gc/neHQB5iuPwewH8WB7Vx0mnLcC2ir8CdvBk
         51rA==
X-Gm-Message-State: AOJu0YwpQmoil2NDRbAphGSdFaY5NOl5HvmY9nY9aBelHC9zHngVaj95
	FaNNdcknTjJl/6MbwtaPYMrtlfcw5mCP5DPXKcollAEmLo8PSIY1hSp12rLInJQ5F40EIURCZGY
	2
X-Google-Smtp-Source: AGHT+IGUEGuhtEu7wTc35HB86B8Ejkok7Fo1ljMdGWuJr6KIaaCTE+f/lq1sANEn7qSgApmTqqhpOg==
X-Received: by 2002:a05:6a20:3956:b0:1a3:2fe9:ad74 with SMTP id r22-20020a056a20395600b001a32fe9ad74mr3895584pzg.44.1710360233573;
        Wed, 13 Mar 2024 13:03:53 -0700 (PDT)
Received: from asharma-Latitude-3400 ([2401:4900:1c68:a50b:4d97:8f6c:b736:c749])
        by smtp.gmail.com with ESMTPSA id h23-20020a635317000000b005dc9439c56bsm28341pgb.13.2024.03.13.13.03.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Mar 2024 13:03:53 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Thu, 14 Mar 2024 01:33:47 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][dunfell][PATCH] expat: Backport fix for CVE-2024-28757
Date: Thu, 14 Mar 2024 01:33:43 +0530
Message-Id: <20240313200343.15817-1-asharma@mvista.com>
X-Mailer: git-send-email 2.24.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 20:03:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197079

Upstream ref:
https://github.com/libexpat/libexpat/pull/842
https://github.com/libexpat/libexpat/issues/839

Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/072eca0b72373da103ce15f8f62d1d7b52695454]
Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../expat/expat/CVE-2024-28757.patch          | 57 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.2.9.bb        |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2024-28757.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2024-28757.patch b/meta/recipes-core/expat/expat/CVE-2024-28757.patch
new file mode 100644
index 0000000000..c4bdb4621a
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2024-28757.patch
@@ -0,0 +1,57 @@
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
+---
+CVE: CVE-2024-28757
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/072eca0b72373da103ce15f8f62d1d7b52695454]
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+---
+ expat/lib/xmlparse.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
+index b884d82b5..d44baa68d 100644
+--- a/expat/lib/xmlparse.c
++++ b/expat/lib/xmlparse.c
+@@ -7787,6 +7787,8 @@ copyString(const XML_Char *s, const XML_Memory_Handling_Suite *memsuite) {
+ 
+ static float
+ accountingGetCurrentAmplification(XML_Parser rootParser) {
++  //                                          1.........1.........12 => 22
++  const size_t lenOfShortestInclude = sizeof("<!ENTITY a SYSTEM 'b'>") - 1;
+   const XmlBigCount countBytesOutput
+       = rootParser->m_accounting.countBytesDirect
+         + rootParser->m_accounting.countBytesIndirect;
+@@ -7794,7 +7796,9 @@ accountingGetCurrentAmplification(XML_Parser rootParser) {
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
diff --git a/meta/recipes-core/expat/expat_2.2.9.bb b/meta/recipes-core/expat/expat_2.2.9.bb
index 8a5006e59a..ea50533ed9 100644
--- a/meta/recipes-core/expat/expat_2.2.9.bb
+++ b/meta/recipes-core/expat/expat_2.2.9.bb
@@ -22,6 +22,7 @@ SRC_URI = "git://github.com/libexpat/libexpat.git;protocol=https;branch=master \
            file://libtool-tag.patch \
            file://CVE-2022-40674.patch \
            file://CVE-2022-43680.patch \
+           file://CVE-2024-28757.patch \
          "
 
 SRCREV = "a7bc26b69768f7fb24f0c7976fae24b157b85b13"
-- 
2.24.4



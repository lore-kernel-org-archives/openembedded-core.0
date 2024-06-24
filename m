Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8FB2C2D0D1
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 15:23:12 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web11.143626.1719242584846038622
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 08:23:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ox7x5eKa;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-25980546baeso2178877fac.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 08:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719242583; x=1719847383; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3rFm5LzyeYIMSAZ2s+xbcgesuUxyJtIKwVd8qwSc+0=;
        b=Ox7x5eKa8F+Ip7T0eFjNvUYUWDO5ZEdm2/qzFm7ylunjpg9EcMaADFNjn3V0wnP2Mr
         Pz6GWpZy4Y9IPcVWzm1d5AnGXpHHxfFbjFhHwkHvD/cMl7lVu15D+MmToBEXC/l9LVkd
         oXHV/Tm7ZsQDZQhn6Sswm0hOcvQIxHSdNqcNuS7zPAf857a72Vk/KLgO2GsnRCdtjtlY
         40ioPz/Q1DKMd5M9PVUvKV2P8s/0QJNjaHLStLyqAVGZLf38B2CkcQLWawkt3W8MTwbM
         O8rU/8nqi+7n9S3MqxSuC5GpL5aDwpLyADxJX2TH5thhUHEktdaWDLcBGJHeErmuqxkv
         Rmbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719242583; x=1719847383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X3rFm5LzyeYIMSAZ2s+xbcgesuUxyJtIKwVd8qwSc+0=;
        b=kD9HNBxcO7ChnHip365Srb8Ezq+12g7s/EKn6AWYu/lpW3g2UtI3uwionSPsy5sP5i
         t1VNb4Sieiuwd+6c014ZfAh397FDfaYRNPEdhb5p7ZjyKtSaZGxZKRU+NZA1SkumWqaV
         srsnRhf0fb41LANPRDfVQJu8b4dY3e4s8NPVz9LtxOM6SrXlGztEGNx6MoeuuENe7WyM
         oFN+mB0+QF9ZQiJ8IsAUsWyNz4juUZ3KkJyBwMgyS6wNMNtzIH5kANxyLpmQMkX18M48
         jv72so+VGrgcfXeN/9la9BqZ6XmgNyMTpy0vYWh17wxFpBQVXn8VmJDNkgb7JWFugKyh
         XITg==
X-Gm-Message-State: AOJu0YxBYfC/OouaAnn+T8vqYcmN9DHbMegw10ORlOaeaacAn07mhFrP
	Ev4iBkPy0sZSEngKu+8gUz6DKDbzDgebK1CxfUGFUcZKBYZqVyiQJMmgtA==
X-Google-Smtp-Source: AGHT+IE2NUXbqlhgou2EyiNUhn8bMRAOLwGW1+0QOcvB5JO3ZtTv9Cxbfj8wMezy2DCxEyb+PBmHgw==
X-Received: by 2002:a05:6870:a446:b0:254:7211:424b with SMTP id 586e51a60fabf-25cfcda35d5mr6163814fac.6.1719242583489;
        Mon, 24 Jun 2024 08:23:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::80e1])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25cd4b80c47sm1890279fac.39.2024.06.24.08.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 08:23:02 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3 09/10] classes/spdx-common: Move SPDX_SUPPLIER
Date: Mon, 24 Jun 2024 09:20:38 -0600
Message-ID: <20240624152236.1019980-10-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240624152236.1019980-1-JPEWhacker@gmail.com>
References: <20240619221805.3038528-1-JPEWhacker@gmail.com>
 <20240624152236.1019980-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 15:23:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201099

Move the SPDX_SUPPLIER variable to create-spdx-2.2 since it's format
only has meaning in SPDX 2.2 (SPDX 3 uses SPDX_PACKAGE_SUPPLIER with a
different format)

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/create-spdx-2.2.bbclass | 8 ++++++++
 meta/classes/spdx-common.bbclass     | 7 -------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 3ebf92b5e12..99061320e53 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -8,6 +8,14 @@ inherit spdx-common
 
 SPDX_VERSION = "2.2"
 
+SPDX_ORG ??= "OpenEmbedded ()"
+SPDX_SUPPLIER ??= "Organization: ${SPDX_ORG}"
+SPDX_SUPPLIER[doc] = "The SPDX PackageSupplier field for SPDX packages created from \
+    this recipe. For SPDX documents create using this class during the build, this \
+    is the contact information for the person or organization who is doing the \
+    build."
+
+
 def get_namespace(d, name):
     import uuid
     namespace_uuid = uuid.uuid5(uuid.NAMESPACE_DNS, d.getVar("SPDX_UUID_NAMESPACE"))
diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index 9dee325ba6b..6dfc1fd9e4c 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -37,13 +37,6 @@ SPDX_LICENSES ??= "${COREBASE}/meta/files/spdx-licenses.json"
 
 SPDX_CUSTOM_ANNOTATION_VARS ??= ""
 
-SPDX_ORG ??= "OpenEmbedded ()"
-SPDX_SUPPLIER ??= "Organization: ${SPDX_ORG}"
-SPDX_SUPPLIER[doc] = "The SPDX PackageSupplier field for SPDX packages created from \
-    this recipe. For SPDX documents create using this class during the build, this \
-    is the contact information for the person or organization who is doing the \
-    build."
-
 def extract_licenses(filename):
     import re
 
-- 
2.43.2



Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 902DEC2BD05
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 22:18:36 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.34266.1718835508619342829
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 15:18:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZndlVoLs;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3d5288e6513so122699b6e.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 15:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718835507; x=1719440307; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8gsOTrf8e1A5ROQaJtv+9BTRe7KNWC4uvpe/71IYyqg=;
        b=ZndlVoLsU+PNKlHinfNrE5c9Iy7+b0UzCMJEU+ya+KjBQLH1JNRrjJvFJFrO9oYlCW
         X8PSbpdRhgaXbi/B+FR2cNbZKB7RPwCp1EG66ud+XBXj6/jXBWCrQ8oT154K7AonJA4L
         9IIx6qoSqpnJzWKEPCgKWSLfXo99As01zbuJuBBje1tjEcXLrjHsQ1TEpJSres+st09t
         avaObMs9fSRWfpeWCerxLTASoOneA1VcxCg7iEhj2KpRm7IUPKjS9ULoFEHqyuwj2B0S
         miy4NRVFDenfjeeChVkCjTYPsTG4hYyNKqmtuGAKkWeGwpr/SMCdHuqmFf67+UcG5KYE
         8MEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718835507; x=1719440307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8gsOTrf8e1A5ROQaJtv+9BTRe7KNWC4uvpe/71IYyqg=;
        b=ttbLs9GM+Akjqlpwhm67rk+pa/bvkoHJ1PZHWfYsWLlrY7T5V/WJENo3e4rNueLE5r
         sZyAO/h16JjVR97SnMhCXtDwa41n4E+I96t3/cEEAStsprHdoJVrdLooIGlme4rfsmub
         krENDL0bwuI2dTpiNDu+DMmAAMPtYc/HsEfHIEXnb0avKXL8BM9J/O8wjIHn6BSP+00V
         2MGRkRQR+8o969xC7B8/v6xtPWSMB543Ur2MJa6LxtHI+WPSX+RooGX1fNVNxuogjjvY
         XH6t/TSpRq2aAOF75yAyWjIHwSjf1rMmaN58jxce/c8NbYmoH/MqrbMeiiDSitTLsebF
         ueYg==
X-Gm-Message-State: AOJu0YwYErLjRQsk/uQUI71N1al7k0ZVvNIeqJahoXog/VIXU0DrkEMm
	/lsfwJTdBFPgSpOECvmt9uCMOJWowMPGCq+CnkCWYbxuOVYYAldHwoqO1A==
X-Google-Smtp-Source: AGHT+IEjL7JynPydbcnuYdYAbHvKPfJmNkcBpahJuBrOuV8xb5ShrgT04U8vDTorqKKfVoVONy+YSA==
X-Received: by 2002:a05:6808:10ce:b0:3d2:249f:3b4 with SMTP id 5614622812f47-3d51b9bc4e4mr3600107b6e.23.1718835506749;
        Wed, 19 Jun 2024 15:18:26 -0700 (PDT)
Received: from localhost.localdomain ([2601:282:4300:19e0::4189])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d2475e5359sm2321190b6e.3.2024.06.19.15.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 15:18:25 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 6/7] classes/spdx-common: Move SPDX_SUPPLIER
Date: Wed, 19 Jun 2024 16:13:28 -0600
Message-ID: <20240619221805.3038528-7-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240619221805.3038528-1-JPEWhacker@gmail.com>
References: <20240610214456.2757397-1-JPEWhacker@gmail.com>
 <20240619221805.3038528-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 22:18:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200935

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
index dc2ecb01009..48abdeb55eb 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -40,13 +40,6 @@ SPDX_LICENSES ??= "${COREBASE}/meta/files/spdx-licenses.json"
 
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



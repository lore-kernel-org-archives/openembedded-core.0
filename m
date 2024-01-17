Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D298C47DAF
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 15:59:20 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.6550.1705507154739838621
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 07:59:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=H7Z1g7ay;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-28e84e3767cso1266516a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 07:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1705507153; x=1706111953; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dsxageyN/LqWveeDduvJQhLneM0yR+urnwaH3cPahdM=;
        b=H7Z1g7ay8x2ZCC+SKNykGLpHN6ej9GcUZC0QHqCO0yHOucBvB5XtPY1X8XU+LNFDzB
         CJmHLRDiblrQUTUGmCbiJ4YudjFq2On0Xfa2+vsCDuXNndP/BN7p1y7qJ+is9zsEsemS
         p4sCyPj25yL28i0Q5+z0sQwGra3TTjAWIomMTqAb3LnAmBKII1hd3oLtGnFvB21mdHag
         SfI4OdKZJKLCJIWpKt7AhqhuAOYo1iO3FuIKB0o7XvpHQjTXs7C+bRdBziTRDuztN4wD
         cT64paeu3DiTgIaoB+hx2/iNsSVtKrA3oG+IVwoA68YQ8plybZaUZQz1kkDddeVergty
         z/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705507153; x=1706111953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsxageyN/LqWveeDduvJQhLneM0yR+urnwaH3cPahdM=;
        b=poSzcOpJZg30elUXzft9VTksR6WI9DXwz7qTkpvPYVz8Jjdbkl2QuL53p8E32Kjm3Z
         SGUfoVALYdkoL+vEoZcMq2CMLAZZU1FPZX+eve01T5zWgUjgs/Nyruo+nn8U9iAAijNN
         uXLmkxSKYKmmKpvbTVoBilTwiDeWmQuyOHY/pqBW3SLbgQKKTOIbEEu9JmvIwQSoUYQ7
         J6owPyBVokEGh3syhSjI5la3+nrvrpv4QT4x4of56NpmUcNwNYWoSF3na8mwd/i4/Wl0
         MbjvAHrolWlmy66V+phvUmWrRMjInF6xf+OlJl47iQpwI7hopCtCLAinmcdFesApEn8h
         3Tdw==
X-Gm-Message-State: AOJu0YymMzJRZpjJS0oH8No7q/5SmKlgnKU+V32xzIWe6J/uqi6G7gpv
	dPumv100ArA6IT5zuPv4EFLU7H5kRPdrcNUIHb66mNPiAM1qhw==
X-Google-Smtp-Source: AGHT+IGSP/eT/UdB4XkiWbFYAUMfU2uh8joOYnfik/+xjMQ371xKGFQPeQLQVdJ2MCcEXr1SdQpc5g==
X-Received: by 2002:a17:90a:3042:b0:28c:e435:7242 with SMTP id q2-20020a17090a304200b0028ce4357242mr1556359pjl.11.1705507153297;
        Wed, 17 Jan 2024 07:59:13 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id s4-20020a170902ea0400b001d425d495c9sm11117999plg.190.2024.01.17.07.59.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 07:59:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/7] sqlite3: backport patch for CVE-2023-7104
Date: Wed, 17 Jan 2024 05:58:56 -1000
Message-Id: <31fb83ac3dcd2dd55b184de22a296ab4dc150d2e.1705505890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705505890.git.steve@sakoman.com>
References: <cover.1705505890.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 15:59:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193927

From: Peter Marko <peter.marko@siemens.com>

Backport https://sqlite.org/src/info/0e4e7a05c4204b47

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sqlite/files/CVE-2023-7104.patch          | 44 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2023-7104.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2023-7104.patch b/meta/recipes-support/sqlite/files/CVE-2023-7104.patch
new file mode 100644
index 0000000000..25c6ba017c
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2023-7104.patch
@@ -0,0 +1,44 @@
+From 09f1652f36c5c4e8a6a640ce887f9ea0f48a7958 Mon Sep 17 00:00:00 2001
+From: dan <Dan Kennedy>
+Date: Thu, 7 Sep 2023 13:53:09 +0000
+Subject: [PATCH] Fix a buffer overread in the sessions extension that could
+ occur when processing a corrupt changeset.
+
+Upstream-Status: Backport [https://sqlite.org/src/info/0e4e7a05c4204b47]
+CVE: CVE-2022-46908
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ sqlite3.c | 18 +++++++++++-------
+ 1 file changed, 11 insertions(+), 7 deletions(-)
+
+diff --git a/ext/session/sqlite3session.c b/ext/session/sqlite3session.c
+index 9f862f2465..0491549231 100644
+--- a/sqlite3.c
++++ b/sqlite3.c
+@@ -213482,15 +213482,19 @@ static int sessionReadRecord(
+         }
+       }
+       if( eType==SQLITE_INTEGER || eType==SQLITE_FLOAT ){
+-        sqlite3_int64 v = sessionGetI64(aVal);
+-        if( eType==SQLITE_INTEGER ){
+-          sqlite3VdbeMemSetInt64(apOut[i], v);
++        if( (pIn->nData-pIn->iNext)<8 ){
++          rc = SQLITE_CORRUPT_BKPT;
+         }else{
+-          double d;
+-          memcpy(&d, &v, 8);
+-          sqlite3VdbeMemSetDouble(apOut[i], d);
++          sqlite3_int64 v = sessionGetI64(aVal);
++          if( eType==SQLITE_INTEGER ){
++            sqlite3VdbeMemSetInt64(apOut[i], v);
++          }else{
++            double d;
++            memcpy(&d, &v, 8);
++            sqlite3VdbeMemSetDouble(apOut[i], d);
++          }
++          pIn->iNext += 8;
+         }
+-        pIn->iNext += 8;
+       }
+     }
+   }
diff --git a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
index 55cc514412..cece207eae 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.38.5.bb
@@ -7,6 +7,7 @@ SRC_URI = "http://www.sqlite.org/2022/sqlite-autoconf-${SQLITE_PV}.tar.gz \
            file://0001-sqlite-Increased-the-size-of-loop-variables-in-the-printf-implementation.patch \
            file://CVE-2022-46908.patch \
            file://CVE-2023-36191.patch \
+           file://CVE-2023-7104.patch \
 "
 SRC_URI[sha256sum] = "5af07de982ba658fd91a03170c945f99c971f6955bc79df3266544373e39869c"
 
-- 
2.34.1



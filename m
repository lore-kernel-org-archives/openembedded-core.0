Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF70DC28B23
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 13:58:59 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.11552.1741355933451051209
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 05:58:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MtSPn/iZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22435603572so3932525ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 05:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741355933; x=1741960733; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yXKStbciPPZJs7M4cklsIXT4OaqXPy5yq7ixr4IasaM=;
        b=MtSPn/iZ7l8Iurl1pUPuEclaO5Ub5sW1wkgSO3xHFJAt44MUudLPpq78kyiHdIHEnv
         J8cenzM48R9ATrh+eLt4syqFIoxX/bXXsIQZUh6/As5dQHmZUFiWHIiFwy6/d8oMUkKN
         v6Rpx25D+ToZYZHDE4tZ6QXK5PRVD5OdKQ+2JJGq3tHj48iPLmdefiOWUi/b8gvS/Ep4
         Wfbr2JuKF67jmyBhaC+G0d6dQ78hEavvQ9cY0p8S4fXP68GttqxX1UJjk6OcL/U3SKSE
         NYlCjusBIBJOJjdZEs1rABlU55kkI5SCs8eioQso9D84Q9kOsfl9+zsIvFSIBcDhmtKK
         FwhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741355933; x=1741960733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yXKStbciPPZJs7M4cklsIXT4OaqXPy5yq7ixr4IasaM=;
        b=bz+Yc7VvsNOZupgXPcSVW/WCvrKG9wK+vLiGU9zHtoUCfIrJwjJLXDYzB8BWBleSgS
         ve2tSBPywd0XUc7v77TlUnTXzjA439Z09Ry6EntXWsiEaWOMsAaJ3CNZFJK17vuzA4Dh
         cGQ/b7Qb02ILi60XuXnzYcy4quRUUTzEAqHVJfmRk87QjVgZW69ADzqV+KvqR8MfSgrz
         vnODud2BTO6nvIMkGQ6OaNOjKBO9atDIzRCALAWCAqLR95UDR3lJftzUz1dcXgdn+SEo
         gU+BSVFgs6tqw8e/ss88EgCjH68sz8lBp9u4T7X0pPEQOHIkESpsljhQKzrcHg1zbYSA
         LS7w==
X-Gm-Message-State: AOJu0Ywhdwh+aZvld69lG8vQMBsgpw/Kwufke37DN4jK6B5c//+34Glg
	OdSu4wnszFwIrb5zqQZebI6steL2qNlehCu/E50YqcmmEcBBofX9PgL1tF+S96vTRtCHPGTIbZN
	8
X-Gm-Gg: ASbGncslfzsTu33gcxLiuFItUntMG9nyOW5DHOlH3U3ADa0/p3sxNrnZSyMS2zBWyOB
	zAzedKieJJpCG+G59vCBZbib6XcGQk4SZwk6nSPE5LdjQk0Dw4wVQZsofCIDtonLkxWcAh32KPi
	1Ci57vDQ4UuB8C+/JiPDbU3yYmf9Ko1DLHutykOIRnfN4IfR81zbDW/L3yxEQZDYR5LZdbGO7m3
	UuyeQjrElVR1IsHWYhDXxpAdlln0CAEQ1Ozdg0px+OODhvAw+DGbDLhkILmXtDNUJnRIGo9ro9F
	dWCQVIx8uDMMwUAvibXR20Tf6F/vkx+S8JcZ
X-Google-Smtp-Source: AGHT+IG1qkXjTRMRUyVWcuRIrXyeBhzMkcYJIIM3RXigh9wJW1iGugZVj2/jp1yKIs6mXF5/64heLA==
X-Received: by 2002:a05:6a21:b91:b0:1f3:401f:d76e with SMTP id adf61e73a8af0-1f544cbc497mr6597678637.19.1741355932629;
        Fri, 07 Mar 2025 05:58:52 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:cfcd:40b4:f918:b895])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7369844cfeesm3230656b3a.77.2025.03.07.05.58.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 05:58:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 2/4] libxml2: upgrade 2.13.3 -> 2.13.6
Date: Fri,  7 Mar 2025 05:58:38 -0800
Message-ID: <13929d3126572d3024afd58a914592e8e6ea8457.1741355808.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741355808.git.steve@sakoman.com>
References: <cover.1741355808.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 13:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212440

From: Peter Marko <peter.marko@siemens.com>

Handle CVE-2025-24928, CVE-2024-56171 and CVE-2025-27113.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/libxml/libxml2/install-tests.patch          | 4 ++--
 .../libxml/{libxml2_2.13.3.bb => libxml2_2.13.6.bb}           | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-core/libxml/{libxml2_2.13.3.bb => libxml2_2.13.6.bb} (97%)

diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/recipes-core/libxml/libxml2/install-tests.patch
index 478eeea81b..1c8c13ab5c 100644
--- a/meta/recipes-core/libxml/libxml2/install-tests.patch
+++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
@@ -1,4 +1,4 @@
-From 0779511838a8cbd1e0f431c22f28f286a2a37b1b Mon Sep 17 00:00:00 2001
+From 8c1054eacb430472068f21e4840749c384e8e866 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@arm.com>
 Date: Mon, 5 Dec 2022 17:02:32 +0000
 Subject: [PATCH] add yocto-specific install-ptest target
@@ -12,7 +12,7 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
  1 file changed, 10 insertions(+)
 
 diff --git a/Makefile.am b/Makefile.am
-index 0a49d37..1097c63 100644
+index 4cb9a5c..8adcd7e 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -27,6 +27,16 @@ check_PROGRAMS = \
diff --git a/meta/recipes-core/libxml/libxml2_2.13.3.bb b/meta/recipes-core/libxml/libxml2_2.13.6.bb
similarity index 97%
rename from meta/recipes-core/libxml/libxml2_2.13.3.bb
rename to meta/recipes-core/libxml/libxml2_2.13.6.bb
index df24f3031c..3b3ca87e96 100644
--- a/meta/recipes-core/libxml/libxml2_2.13.3.bb
+++ b/meta/recipes-core/libxml/libxml2_2.13.6.bb
@@ -19,7 +19,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://install-tests.patch \
            "
 
-SRC_URI[archive.sha256sum] = "0805d7c180cf09caad71666c7a458a74f041561a532902454da5047d83948138"
+SRC_URI[archive.sha256sum] = "f453480307524968f7a04ec65e64f2a83a825973bcd260a2e7691be82ae70c96"
 SRC_URI[testtar.sha256sum] = "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
 
 # Disputed as a security issue, but fixed in d39f780
-- 
2.43.0



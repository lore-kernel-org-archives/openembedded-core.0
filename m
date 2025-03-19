Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5877C36006
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:28 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.2919.1742372182908108857
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j1SNoOmC;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-225a28a511eso111947165ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372182; x=1742976982; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhzkP8MEVpHWnx8XNSAlZP6Y3WdVRHIhXu6jRccd0g8=;
        b=j1SNoOmCnipXR0+LJo7nTklhTg04KTSNGkTxsuKsG0TyOAP/cLchdIHsaD8OuuhmMS
         +nti5UtbkWiLc7lFzE7HrOi8cWVZI16/0DbXVczzLKUyHSht+GIOPGTHhkhkkVGgfzAY
         BZl/vN3gkQFV32XMrrvl5K9QAhqgKfOqnEkmThrys9ahDuS/Nm1Ka8V8B1e4IJLNBOMc
         w2UjAmqL/QYSHUTeM3ePeQfxc0+QKWnVDBXU3tAb6LVkKW7XM6wq0COK6In2Ue36lA5X
         gwzHEjIrg6Gci5lG9sl7Td7n7bAlCSA3NuhtbiHGWTjGQZIEsErOgdOeIptE7hRYBodm
         jxhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372182; x=1742976982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AhzkP8MEVpHWnx8XNSAlZP6Y3WdVRHIhXu6jRccd0g8=;
        b=DUIMOp6P7pDMutsDlQ1P/jqja8V8/m2PwIVSavYMRmnhYAPlzbH3Drq5b+SrFuR+a0
         OGbqHhco1+Zfe1d9Nr69riGmkvpvPCPaj0gGmYYCURS+OYJ0/a9N9FZ0D37B4pYYWA28
         +NOolJn/MKYHAVtv3St4xbIvUqPGL86sakzeXMOy2dyiQcHz4cXNA80sTSQzITmUCuCE
         V0PHGdD7YeVxloXzslW2X9/k0VwRsvPQkB+bPei94xTlorE7laAHjEat5t7meoyW7ls1
         zwpIa/EjF6TyTkDTkGBNzkT2+FIvzE77j9WP+2LWtBgxqpG5mNW/9531lnuri1eQuNmz
         KUfg==
X-Gm-Message-State: AOJu0YwgAFIZnMf+r0Rg4tndTqLmbA2zXL7dW2S0Brgw78L56MWFhhbV
	pAJJlxhSQvJDNOqrYsyQfhxMVmvFS8iLbSqgIl1wsKEB/3SE58PkzQRp22Nr
X-Gm-Gg: ASbGncuj+cdbr2KUrKk9gMW8AS7qCe+vru5RusCEs/gCLkRhNU4OPCxym4KJHieXCB7
	nHE8iVQF0KpsRJ81EElRrQHIYaqTFfiqcX3JUAzsXkZ0MTiXe5mJJPlUNajfXm8fYOwphVvuXZW
	5EyNRyVgDtRCENzDruIJQPIlr0apUE1tWFwiCWhJJX9IAAaP9aJlyKpEKA+cbb3p1u/TAJ9CZup
	fB/6eXoGICyTANhvai+wqB79zygLWYh6PCHhaVnlWsz7+R8Ux0cgNnrpm6qUtV0J9kEHxuITXrS
	Bk1yu2BYpt2BmkbtH+tWHw7ozYNaj00UqNFA
X-Google-Smtp-Source: AGHT+IF0pIUXO74jjcyfKkGDKSncSR5+9+eJKpSXLgVmMEnrRBVOxvOyE41S2LVAf+vYhrxGhAy95w==
X-Received: by 2002:a05:6a21:3993:b0:1f5:7df9:f147 with SMTP id adf61e73a8af0-1fbed3161b5mr3630069637.40.1742372182085;
        Wed, 19 Mar 2025 01:16:22 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 10/27] libsndfile1: Include <stdbool.h> instead of redefining bool true and false
Date: Wed, 19 Mar 2025 01:15:38 -0700
Message-ID: <20250319081610.3536475-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213276

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...h-instead-of-redefining-bool-true-an.patch | 65 +++++++++++++++++++
 .../libsndfile/libsndfile1_1.2.2.bb           |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/0001-Include-stdbool.h-instead-of-redefining-bool-true-an.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/0001-Include-stdbool.h-instead-of-redefining-bool-true-an.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/0001-Include-stdbool.h-instead-of-redefining-bool-true-an.patch
new file mode 100644
index 00000000000..542a7838590
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/0001-Include-stdbool.h-instead-of-redefining-bool-true-an.patch
@@ -0,0 +1,65 @@
+From 0ba5ab2fb7f29a01dbe570c324011e8cffc89d82 Mon Sep 17 00:00:00 2001
+From: Fabian Greffrath <fabian@greffrath.com>
+Date: Tue, 17 Dec 2024 10:38:47 +0100
+Subject: [PATCH] Include <stdbool.h> instead of redefining `bool`, `true` and
+ `false` keywords
+
+Fixes #1049
+
+Upstream-Status: Submitted [https://github.com/libsndfile/libsndfile/pull/1055]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/ALAC/alac_decoder.c | 6 +-----
+ src/ALAC/alac_encoder.c | 7 +------
+ 2 files changed, 2 insertions(+), 11 deletions(-)
+
+diff --git a/src/ALAC/alac_decoder.c b/src/ALAC/alac_decoder.c
+index 46d3330..1b4a87c 100644
+--- a/src/ALAC/alac_decoder.c
++++ b/src/ALAC/alac_decoder.c
+@@ -26,6 +26,7 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <stddef.h>
++#include <stdbool.h>
+ #include <string.h>
+ 
+ #include "alac_codec.h"
+@@ -38,11 +39,6 @@
+ #include "ALACBitUtilities.h"
+ #include "EndianPortable.h"
+ 
+-typedef enum
+-{	false = 0,
+-	true = 1
+-} bool ;
+-
+ // constants/data
+ const uint32_t kMaxBitDepth = 32 ;			// max allowed bit depth is 32
+ 
+diff --git a/src/ALAC/alac_encoder.c b/src/ALAC/alac_encoder.c
+index 599399a..f303311 100644
+--- a/src/ALAC/alac_encoder.c
++++ b/src/ALAC/alac_encoder.c
+@@ -30,6 +30,7 @@
+ // headers
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <stdbool.h>
+ #include <string.h>
+ 
+ #include "sfendian.h"
+@@ -44,12 +45,6 @@
+ #include "ALACAudioTypes.h"
+ #include "EndianPortable.h"
+ 
+-typedef enum
+-{
+-	false = 0,
+-	true = 1
+-} bool ;
+-
+ static void	GetConfig (ALAC_ENCODER *p, ALACSpecificConfig * config) ;
+ 
+ static int32_t	EncodeStereo (ALAC_ENCODER *p, struct BitBuffer * bitstream, const int32_t * input, uint32_t stride, uint32_t channelIndex, uint32_t numSamples) ;
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
index 2a1b96d5e79..63c1570621b 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
@@ -11,6 +11,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libsndfile-${PV}.tar.xz \
            file://noopus.patch \
            file://cve-2022-33065.patch \
            file://CVE-2024-50612.patch \
+           file://0001-Include-stdbool.h-instead-of-redefining-bool-true-an.patch \
           "
 GITHUB_BASE_URI = "https://github.com/libsndfile/libsndfile/releases/"
 


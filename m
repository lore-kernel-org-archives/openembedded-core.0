Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B478C36003
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 04:39:01 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.4307.1742272740660202874
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 21:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fhn5IrSS;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22401f4d35aso96422515ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 21:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742272740; x=1742877540; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhzkP8MEVpHWnx8XNSAlZP6Y3WdVRHIhXu6jRccd0g8=;
        b=Fhn5IrSSOlJOeFCyjf/z9n0hMrfBIrVKlN8lnvtN7T/wtl1V5TegBd5Qx45BQmm/UX
         Z/v5TQDKy+6fwu9JE2PUDtpfQ9v78K3mAVxbo5Qk8dtTmQ7ChBdShNxHW1M7hsmQmops
         8Yy2dqBLzcEx59RVhr2X0obWl3GAMMo6R/20UNqWtMJ32o4hbKA1AYARkQfaKbni8bQi
         aevx+kE31aw/YJih+e7QW7LSgTJtNg8ZrOWZeGR+kr8klQFhkqJ8QWq/bHT45C4iami9
         jW95KKaR/gMVI4EDPYy0F3zcsFeqUEOHI3nWEmpRSlkO42Dpn/2vASwhjQ9xSVlkqF2T
         y7OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742272740; x=1742877540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AhzkP8MEVpHWnx8XNSAlZP6Y3WdVRHIhXu6jRccd0g8=;
        b=a96BB2V0H2eO6nfkz9BtxW7+R78fVUteqsSWKqA0LvNGBXyd9Ll9MSsSq0bHPrV660
         KuASX2XKmaVVWltNI7fQjGVWaxFKOwzkfRofExymwAsrPVrB0qZcmUBQp02E+EncyDOl
         /3OeNGc4M8jL4umCyHd+EKfb0RFb4E0DiVTa3TD81GnpgJG/xqkNJk+Odb4Xu60ROt7k
         67/agreamkXLahft0qtGhjwy9FekG1Ud4LukU9FPP5WFjAhB+zs3oXycteg8GIQHVpFn
         y4U56Umz4iXqnT4rg0HmataiP2eqPYZT4a0IaoXIQFwLSOPXJL5bJzPF+sZGEJH7XuXp
         xMBw==
X-Gm-Message-State: AOJu0Yze8zacYdjv0Ob3mB5hXxUKt4HLUUktYRgr0xkCJsTxWcUY0OtP
	5ZHeoRahoC4G8Vup1QRw4hkBQUJd+m9f8KNq3z1Wuj03ZMvZRsCFDcs0ZzND
X-Gm-Gg: ASbGncuEAP7q1yXv2HZdh2vTCiQrVMywy/2RPpqch9m2zeQHR5gCYLk02ywy4c4U6xz
	T3NyoPI8+RcVdd0HDsxXg5NU9nPijtUl24/tLT3q/ublFpig/YjLR4O2p9za6+6aQI7EjO3Gyrl
	xsuvFjLhdQD6XmMiYHVwBZGlHm+DqeEgGvLbT+7HkZgbixMp4RN0uM+BIoAlB3/71m5famj3/J0
	lZNxnpNty8VrCCZUi8mBGM2fwSV/qTGEfzrcB3q7kUAiSAFH9gi2h1hmJ+RPPya/IDl+fFTcnE9
	eixe7pWBevIELOIMmZnGPT1LxjqhDlJE6HFb
X-Google-Smtp-Source: AGHT+IGEfCtBxIp8BK2+MYI+GFJP9OgqmUgLoAu5ChMHap/uaxATyEBDwhj/vrP0xtUJhfGKAfiAHA==
X-Received: by 2002:a17:902:f647:b0:220:c066:94eb with SMTP id d9443c01a7336-2262c567f43mr26278415ad.25.1742272739756;
        Mon, 17 Mar 2025 21:38:59 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbc8c6sm84112375ad.160.2025.03.17.21.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:38:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 11/24] libsndfile1: Include <stdbool.h> instead of redefining bool true and false
Date: Mon, 17 Mar 2025 21:38:31 -0700
Message-ID: <20250318043846.2422141-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318043846.2422141-1-raj.khem@gmail.com>
References: <20250318043846.2422141-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 04:39:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213145

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
 


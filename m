Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE717EE57F1
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 23:24:17 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.35266.1726097048347719149
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Sep 2024 16:24:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qq9u7M5s;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7db12af2f31so368566a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 16:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1726097047; x=1726701847; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=csw9qHP54NpJ4vqcwLXN84QkmmKehQqNcZfNbwpjKPU=;
        b=qq9u7M5sxHjKE11+jtMSPlTpLH6pbTVeUjoKy826szoYhr2aFZ+5kpfzY0pB8YL4LE
         UE+jwTWajZRg/+BbMOuKr6yYnMfeuPAf3/x70jcr1yglNUdglcvGu0st1gWBJujv68tH
         ysGhQ9JaH72fUcEMLoi4bCnupFAHE6yd+XEjQL6R+VNaxnav8zqOWFAdQCmUUSOw8h+c
         SywO4PsdmYo7gyl4fH8I9imybjyM+d4ceG2DnLn7tBrw9o995mvrw1dgUnLQjGaeuHRF
         6jonrVxsuq0PI0AT0FfMoS1e+lKUEnRGbx/Gypja+Ysscv4YaW3B+22O8/AwDARPkEGZ
         uEkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726097047; x=1726701847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=csw9qHP54NpJ4vqcwLXN84QkmmKehQqNcZfNbwpjKPU=;
        b=K9SQeE7W/jQc5AmsGua0O+MeG1Giq9UxuGynqB6d9u+VW8J0MwkNf8U6awBWsb+Vte
         lv+3Y6BLZcsIv9ndmz0bykWmiqx5U/q7NAVyGrcR9tXloCMZRRY5yveBF1LNtqTDRcYy
         DrXG55wIgYVR6rm+WV5++1+1zS7pPTMpeAFLvthrroYwPThZvoQ3xfFGPxAAtueTiiP3
         cxOJsy0l8JG5t0Cc1V0RlWjSpZBGhEsX5bOlsQhMJsat30bhfonilgntEgAzgaPUIAyo
         xWn8ASKFddINMpl2Nfx216oBny31lPwoub6cBJMDD9MkpP7XSwZfJctXcXij5mqNSoTz
         CZnA==
X-Gm-Message-State: AOJu0Ywmfoo+tQPeR+QUpfnbVGAnKixnXG7f0Ybi+Dr69/XmyJWVt6LO
	19zSL8RCsBoqwAoVAn2BUjZU7t5cjCs3MSI/Qgp5iIYzrt1Prlu5FhLTyUkJEiMG4hxl768ioI3
	a
X-Google-Smtp-Source: AGHT+IG+Ln1ZhjNXp2Fi5PKWsKn8wOGbHCHgRbPcWtiKXCH2g1iAoEuCg2Ek89isy0ZzgSPY5Fxemw==
X-Received: by 2002:a05:6a21:58b:b0:1cf:6953:2872 with SMTP id adf61e73a8af0-1cf764c27f2mr939972637.48.1726097047608;
        Wed, 11 Sep 2024 16:24:07 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe27bfsm3488490b3a.56.2024.09.11.16.24.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 16:24:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/22] libedit: Make docs generation deterministic
Date: Wed, 11 Sep 2024 16:23:19 -0700
Message-Id: <88630352d6d1cfee06787fa84b73ca8ad335cb08.1726096839.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1726096839.git.steve@sakoman.com>
References: <cover.1726096839.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 23:24:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204416

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The presence or lack of nroff on the host was changing the doc type. Stop
the code from looking at host paths outside HOSTTOOLS and hence cause the
doc type to be deterministic and reproducible.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 918e2b266eba6779f19f65349f85caa880ba45e7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/libedit/libedit_20210910-3.1.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/libedit/libedit_20210910-3.1.bb b/meta/recipes-devtools/libedit/libedit_20210910-3.1.bb
index 5aa83ef246..0f501eb7a4 100644
--- a/meta/recipes-devtools/libedit/libedit_20210910-3.1.bb
+++ b/meta/recipes-devtools/libedit/libedit_20210910-3.1.bb
@@ -15,6 +15,13 @@ SRC_URI = "http://www.thrysoee.dk/editline/${BP}.tar.gz \
           "
 SRC_URI[sha256sum] = "6792a6a992050762edcca28ff3318cdb7de37dccf7bc30db59fcd7017eed13c5"
 
+# configure hardcodes /usr/bin search path bypassing HOSTTOOLS
+CACHED_CONFIGUREVARS += "ac_cv_path_NROFF=/bin/false"
+
+# remove at next version upgrade or when output changes
+PR = "r1"
+HASHEQUIV_HASH_VERSION .= ".1"
+
 BBCLASSEXTEND = "native nativesdk"
 
 inherit update-alternatives
-- 
2.34.1



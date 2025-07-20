Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CEE7C83F3D
	for <webhook@archiver.kernel.org>; Sun, 20 Jul 2025 20:05:07 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.24804.1753041901579411715
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jul 2025 13:05:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GRjWB8bJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-23694cec0feso33013515ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 13:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753041901; x=1753646701; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CSFDmFWmOhIdB/KepfhCc5t4L3oxQloiKMKq/RPHqUg=;
        b=GRjWB8bJyvTbV4HDSYTcNV2k7Dc6b3GDf9rsqjm7eZGVJfmEA3Ckh68nLyLMIcd/MM
         XZcHvPx908EdNlm9FX979tZYLRZLvQkiPSssHHBibSvVzWiXx5GiplXidXHy4vJu5OMw
         N4lRHdBhLI2tdPArk8Qeaj3nRcdgiaDKeocLt88iccSSWaHKxhNHu8mj81rSqBAsIAt5
         /zEnWawzj1We6Th04AVTSRGHtQks954xnk6G6njXseSrR10LNwu4DHY1tGHG3jCR2Adp
         ANiRzKynKvqs9XgthV8yf4iECIFpSHVxqnhZmgdmgqS8h0vUVIsbz4RVX7+eUO3p8Ncc
         BDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753041901; x=1753646701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSFDmFWmOhIdB/KepfhCc5t4L3oxQloiKMKq/RPHqUg=;
        b=FDlqelE0gA6UVAr68eO8m486IXyZm9qKq+QUisgWkjT2HHNcN78cT48ggtuDlKkRwR
         mHBWK0z7gzjjudi2p+azasZNwRs0IwCIYFU9TPsh+6qWcoxTUI2ysbV/S06u9Z7pLxsX
         yTg6cp81qFOUR+81elgDINxRFh/uSVRKzT52qgWeBlDxIKvgdiyF2mSSNd+131PLTxhB
         6dc5Ji3M7Fsw1/l3xj3V4Ckq1vAlHEJa6i5MMcooGXWLXp6DFo8GmjW8Q3/fmTTAtNt7
         FuaC7Zb72UNR6bOwatIc1wTzC4L+HLF/6aB2+7L/Gs4HnjutwHfdFaluvDgbW6cVzpdT
         Z0Zw==
X-Gm-Message-State: AOJu0Yz/jZYBDtud/Iv6N5Y6otVV785eycaWuM7vI5uIrQ9+bN9+nK8u
	N7lVPsKdLMR9tg0uibAGKrettuGLiCU/p16i0UtZy0PFqHfzYDEbrTlM/GGh/VGO9cX8FEMbiyQ
	keOr15f8=
X-Gm-Gg: ASbGncs3zYrAliComqnDaPjaW/bxmLPbHGq6Jpfx+hcJJ4wAnVZ03SpW49jTMdkGwVm
	b/2NfVKgkCXKSqUWeqjsOTNMaL0sq3YR/UfZZVx8x3jeGF9S++Ce5rj+nH3taghwwBn5Y8uxChr
	5OCNgGPm/OH+gnkutx3+E+AL4V/4wPvzN10BHAjGnDUDVwPAzlxHdIyV1JyxzOpgV5y8scJ1fmc
	w92cb4s0v/Ne8ZSXkaaHwdwLxqQGF2xrlN950wykgPcz27XDtX8PHe8tD9ZzAYydno+MRqOVCBm
	ZaniSQyJ0hS781VXH7cozNZVlEpz7x9+HHQXW7r8CTrVyDkn8vVHjn/6oG3QCb7F1KSfmCb3OR+
	hVEfFWtTEI2Ghkg==
X-Google-Smtp-Source: AGHT+IE2sJxoR6bguwkja2iHg8XptP9hsZaouzQ0zw14uYVM3b2/+S/9wAKt9ZDXysDqcgDUNI0jGg==
X-Received: by 2002:a17:903:41c3:b0:235:eb8d:7fff with SMTP id d9443c01a7336-23e24f4aab3mr259544835ad.28.1753041900732;
        Sun, 20 Jul 2025 13:05:00 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:31c9:438f:a923:8d3c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b60f096sm44894035ad.78.2025.07.20.13.04.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 13:05:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 02/12] glibc: stable 2.41 branch updates
Date: Sun, 20 Jul 2025 13:04:39 -0700
Message-ID: <b483cf8e831b6a173f04f5bb75df6bb186d0b2d1.1753041740.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753041740.git.steve@sakoman.com>
References: <cover.1753041740.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Jul 2025 20:05:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220627

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

    $ git log --oneline 0c76c951620f9e12df2a89b2c684878b55bb6795..6e489c17f827317bcf8544efefa65f13b5a079dc
    6e489c17f8 Fix error reporting (false negatives) in SGID tests
    11e634ccf3 support: Pick group in support_capture_subprogram_self_sgid if UID == 0
    61e461ed0c sparc: Fix sparc32 Fix argument passing to __libc_start_main (BZ 32981)

    Testing Results:
               Before     After   Diff
    pass         5807      5813    +6
    xpass        4         4        0
    UNSUPPORTED  164       161     -3
    FAIL         280       257    -23
    XFAIL        16        16       0

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 2d31131e03..a2cfd0f308 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.41/master"
 PV = "2.41+git"
-SRCREV_glibc ?= "0c76c951620f9e12df2a89b2c684878b55bb6795"
+SRCREV_glibc ?= "6e489c17f827317bcf8544efefa65f13b5a079dc"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.43.0



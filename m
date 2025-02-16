Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60EB9C021A0
	for <webhook@archiver.kernel.org>; Sun, 16 Feb 2025 03:11:00 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.23214.1739675454406631994
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 19:10:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NHllspEF;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2fc3027c7aeso3376077a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 19:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739675453; x=1740280253; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OJMb0yeyXcf+MT4LBl7di4JTaaCcDsgRjBAd/3I0HPI=;
        b=NHllspEFwZNJKVxZOaF/FZwGDZ4WeS89k2//+HmiZRlueXad7O5dRlJqDswXnARFra
         1Q3lh/aHptWMoRPISAUxGOvm8rYjKjxtRA3ES3HlGc4a8FbfhPQt3ZKv1I1QZATILXD6
         JaUYbrpQruwyJM9buV88tZtTiAvol4iG0Sy7IAS7Y84qPEBCFzISu0/iF+xfVeXbR5C4
         Rn2bsg9SNeP9S6O0mSzpsW4cwvSz6rGGU8+cjiQA/xr5PThvM5QkCVgxyd7+YzbhQGcR
         DGJVMVLdu5lvwLAbGiK3UFANaPAmGyoLnuQ3kuNK0uQ4+i5TWW3rmz9lvGh7FTGPT5H/
         EL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739675453; x=1740280253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OJMb0yeyXcf+MT4LBl7di4JTaaCcDsgRjBAd/3I0HPI=;
        b=u2bTh99b+qm+C+248qRs6dQ35OtAFpSyZafZUfMHeZA4yzkST2y7O3XvwoA1XE9QHr
         mP6np+HRVBdKM0mk1IHrPeqOtYlWtjNDl0bwsEHDjywFDAAzcljS7vtFtQrOA/1Kuj9O
         4lXOUaa2Icu+xWk9Y6vuhr5rCWnZfEKJJEDWGB6LDz+5hu4E+e4/uKbhjRJshutPhuwJ
         DHORa6PcnuabYl2hzzQgW1rKsEevwcopfdj1D8ifT7EecEYN3sISnRx+Q70eusjvpfNa
         s/2q7YBGHlTOyAbYJyjHNpt/KenQ0VUdyqn5/+sLW/e/glbL70TcRO72WY0R0nxf8K9H
         XmuA==
X-Gm-Message-State: AOJu0YzDSR0YZ8nTufK/bvsCX99RtCeEIbN6hTp0WM3WZ0nQBFigYQwv
	7CVCeou+fkJK8ZFjO5Ri0LXSIiRjNuHynP2s9uOSujc8bdv9Z96Adog9dYyb
X-Gm-Gg: ASbGncsGUI/wFhdMiry3JlfiTuWD+RYZ/Vf4pG+/1R2l1nLPucVrvBRIfkoYng10pYC
	Xp5VCth9tbCU0zu65uyPlKZAP29u/nK4IzoR1pyUh7SkFoVjhcmbh3aUlOROOs4E+ax85M7unLQ
	zrnKaLW/Za2cEkPcLR3f2PvMSE0q/hV8jCDL1fKqEP/dSlNUut47GidoedwGoZamadL94uudS4s
	pYSrkWpozlmiCNQPWolmrSjCLzKE2d1UfHWMZoK2t0ea7jqePFlp4NuoyWS223cNzWH1il2Rhxe
	MUvqjvs=
X-Google-Smtp-Source: AGHT+IEYsoE6jAkneXDvYrXTrzDMBs+Oy8yxrpExUUALdGJ+/0rfVfnEXW8yHD5+1OSE3pbKaT2TVg==
X-Received: by 2002:a05:6a00:1706:b0:730:8768:76d1 with SMTP id d2e1a72fcca58-732618d603dmr7240717b3a.19.1739675453220;
        Sat, 15 Feb 2025 19:10:53 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::b976])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242568adasm5774999b3a.52.2025.02.15.19.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 19:10:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] libxcrypt-compat,libxcrypt: upgrade 4.4.37 -> 4.4.38,4.4.37 -> 4.4.38
Date: Sat, 15 Feb 2025 19:10:49 -0800
Message-ID: <20250216031050.2543316-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Feb 2025 03:11:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211492

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch     | 2 +-
 .../{libxcrypt-compat_4.4.37.bb => libxcrypt-compat_4.4.38.bb}  | 0
 meta/recipes-core/libxcrypt/libxcrypt.inc                       | 2 +-
 .../libxcrypt/{libxcrypt_4.4.37.bb => libxcrypt_4.4.38.bb}      | 0
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.37.bb => libxcrypt-compat_4.4.38.bb} (100%)
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.37.bb => libxcrypt_4.4.38.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch b/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
index 879950bbe37..6e91efe1ff5 100644
--- a/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
+++ b/meta/recipes-core/libxcrypt/files/fix_cflags_handling.patch
@@ -1,4 +1,4 @@
-From 1e94a03541e35718dc1eaa8023e0ec3cf2de369b Mon Sep 17 00:00:00 2001
+From 9670e74ad2175356637af20be3a98b5714cbfe16 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 30 Apr 2021 10:35:02 +0100
 Subject: [PATCH] libxcrypt: Update to 4.4.19 release and fix symbol version
diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.37.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.38.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.37.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.38.bb
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 9ecb333fb96..247499565d3 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -12,7 +12,7 @@ inherit autotools pkgconfig
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https \
            file://fix_cflags_handling.patch \
            "
-SRCREV = "e5714d1f0a477f91ce3986fa63651c7710f0e183"
+SRCREV = "55ea777e8d567e5e86ffac917c28815ac54cc341"
 SRCBRANCH ?= "master"
 
 PROVIDES = "virtual/crypt"
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.37.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.37.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.38.bb


Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05078C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 20:13:18 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.5189.1741810391637075333
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 13:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dQeANq/K;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22401f4d35aso4884795ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 13:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741810391; x=1742415191; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J9kIkPYzA6PcHwLDfaF0GeMWGy3NNYwC96FgIVQXvVU=;
        b=dQeANq/KfeIG4iQTJxAxj5sa/J/CE0D48ShazHitm0rrtT13vyr4vC0Lq7fadoeRPZ
         Xzb6csfqe0oU1IDPaLDeAF7gQczf9PC6elS0reJ26hR+WtgFHB8LYrAwNS+1tyOdRqpM
         VqtW41NIGymSKdvOa3vdwISmvPRF4M0UbWYKT5z02LOUDCgSdBZUUIo1kBFL93y7uxWX
         rJNCRvYkM36+ZXJmlh7KXJta/t73m3Pv3iZZ+EfjfMOlX7JeVlgxgdzqvFRip38evnU4
         cKGp6cppaIb9Pmlv0ev3QNYjppdC1+wIaqGlFTRTB4C8XLLcR2gCFee1MFL3dDgb1can
         gVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741810391; x=1742415191;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J9kIkPYzA6PcHwLDfaF0GeMWGy3NNYwC96FgIVQXvVU=;
        b=FaRgYILsl38LIGQY1z8E7YGpRcxQ4Ope1/B4y4+Zzojbg5dSVMQdRDeT+sMVuFXFDr
         ePIKywJj+dmbeVPT3D4tRU4RPvjFmshhXOCpiSwNRU4U1+VK2IjRovBoWVmZShIcmqHR
         rGeasJzwfmHDGJDNPibts6uxbBEGieBSJGI1x92x9/2Nr27a7NT4m4whCdwa7Gpr8kgk
         M4rOA6+G/GxiNjVLVU16TNyGb3J7COw9YnZH+7agmFTcHZWq41drHMq420jWqKdu8Aaq
         pNYzK/BkZDkgpIvr6fD3cQVAf85wssZI38K7LFTNNElDQfh3dgV7UM4esTPvsP5rDTLi
         zkig==
X-Gm-Message-State: AOJu0YykX70IdjrUgtGsXGTjycENVZlcoQFA8FRQ7AfRy9um89QHd9WC
	+qQcNAPNykr2VYoEDelAAfCpKLjnH16Gf0/8nDogjZ0U6oP8ztuU1xJhKOL4
X-Gm-Gg: ASbGnctsl/FlkCkPaI7POhlKB7MzK+JL6Gye7Mt/MnjZJ0GmcG2bBmL5TjSJF8GvvFX
	EM0MCRheyyv4gBkv57ESeqjbqOfzFRgb1Phq5eahbUKRa7pGDbG50JoO9wS/OSRDlYgi38AvlDm
	Yd0AHjKc78QY1ROYp+3PFQR8FEYKScENaJT8XPdtETHqOHwlb5P8bzdsVeGTkPp31wiBd1ty97R
	TDv98BpC45B39ilQHYqi6MtGTyVNzAVVuM0764+7kk8tScNE6O+s+Ut/V3JVPt8JvAX7KH1uJKZ
	tpLzXn/4/Z1yicSj6/dpComBcJA3E7/ZTUUk
X-Google-Smtp-Source: AGHT+IGU9S8s9HB+zwfiQ9zZ3H4DUvgIndnAWhJBfvLlXrVO/AynCxxD93uURjUcGu0O9xWfgfmMWg==
X-Received: by 2002:a17:903:184:b0:223:f408:c3cf with SMTP id d9443c01a7336-22592e2d63fmr124474015ad.21.1741810390687;
        Wed, 12 Mar 2025 13:13:10 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109ddcd9sm120457415ad.10.2025.03.12.13.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 13:13:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gcc-cross,gcc-cross-canadian: Drop symlinking gold linker
Date: Wed, 12 Mar 2025 13:13:08 -0700
Message-ID: <20250312201308.4022381-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 20:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212724

Its not being built by binutils anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 2 +-
 meta/recipes-devtools/gcc/gcc-cross.inc          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 9b55ec21e0e..20dbec7248a 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -132,7 +132,7 @@ do_install () {
 	dest=${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/
 	install -d $dest
 	suffix=${EXEEXT}
-	for t in ar as ld ld.bfd ld.gold nm objcopy objdump ranlib strip g77 gcc cpp gfortran; do
+	for t in ar as ld ld.bfd nm objcopy objdump ranlib strip g77 gcc cpp gfortran; do
 		if [ "$t" = "g77" -o "$t" = "gfortran" ] && [ ! -e ${D}${bindir}/${TARGET_PREFIX}$t$suffix ]; then
 			continue
 		fi
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 7afdf585779..54a1d3d85ce 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -94,7 +94,7 @@ do_install () {
 	# found. These need to be relative paths so they work in different locations.
 	dest=${D}${libexecdir}/gcc/${TARGET_SYS}/${BINV}/
 	install -d $dest
-	for t in ar as ld ld.bfd ld.gold nm objcopy objdump ranlib strip gcc cpp $fortsymlinks; do
+	for t in ar as ld ld.bfd nm objcopy objdump ranlib strip gcc cpp $fortsymlinks; do
 		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t $dest$t
 		ln -sf ${BINRELPATH}/${TARGET_PREFIX}$t ${dest}${TARGET_PREFIX}$t
 	done


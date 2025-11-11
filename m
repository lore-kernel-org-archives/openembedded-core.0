Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F2E5CCFA18
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 14:59:09 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19445.1762873143400606256
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Nov 2025 06:59:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=yXj3qauW;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-34101107cc8so3540047a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 06:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762873143; x=1763477943; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5nIk0bHjB6HruDM3QRn9sOI0yxCDveGs/HfgkmHBtDY=;
        b=yXj3qauWZYyGKMpAB/GmxnwqfZ8q3V2CtklR95yiAh646rruM64X12m5G5Eb1uGS6i
         xdHMx8M0Hq9tRLNYOUrXy2JtYbYVXqkZBOVQ9G1gSAn087okWMZ2nf9c4qrtb2RP6r8c
         RhlVTJ/boKxU/v5r4rogx0ZeZFAqyOCdx6TksQbZIPDeQmuuKk5aWhn/ZpwnAOUh3FU8
         aA6R616ZUZvmY/g37ygloqh+MD+aflkkb9x3d+paMRoS1MXInTy+NB3uF2JAF8Koj4gO
         qEQyR1tfXUizkip9hvwP456xDKFe2rN2JtQK4KMP4AoPNCP357uj0vFNtY5LpxomdMPl
         N7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762873143; x=1763477943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5nIk0bHjB6HruDM3QRn9sOI0yxCDveGs/HfgkmHBtDY=;
        b=APzgwS2H5Zi/VBNOYLJ2X5ZZpUQkGKPoHxU8lZzcA2R2/doQLNd4HgEn+/VeRLnd7w
         GVfx+iKeKdjtLxzBdfe/X08gJyhac0gnpCvQzLTJlttS0AlXVa/Wk2JrbJuYUhByDhZw
         3r9sFLFmU8GT4CNDs2CYcWghJ9wSuDX06HSEQ40qbfzp89FaSZlQFz9jHrw90ywe6k/3
         28743O7vAQlAIclprZs0vJk8bD/Ng8gH/hEpt5FLzUAvMcQXzhdyHKq8OTMUpWQgoPTk
         GayiaMjDfypb65zAjPbBCfwQ4zeHtFaG0ZKNJ4tdRdgNwDgucwXZ3iOJmk016JdRAW5D
         If5g==
X-Gm-Message-State: AOJu0YyFk72xvPhlupJTYttuV0zXq9HgZS3igcPrCYkOZPpzt+10CEVP
	qP5lydz1tRCIoYkiWR0qVGh315u188iXx7P2MXbc3dIudJQi9Ru8m/3a/L7Z54mgc+M4YVKbBmz
	xDWhpczI=
X-Gm-Gg: ASbGnctUq8bCWt6V/Pq2sSijxSv+ljpSFEw6HwMvRXGm71sEXA64PHskZDeyW3hqy5/
	3pjVDGTqpg8r0F9m30sN68joYS6CTuk9aIr2uI1U2oKMBTPgvnnnthtN8k35G1wvzXYGD6zy0Ou
	7JTVc07Oki1ao2wk2UdKSjIynfB9e8NtMT9HhSV071BtLO9v1UAXhYGMrW28tbwZUciwjivH2qL
	5eN0Fj6kx/oOBn1HP2k16HT75cCr/y8odjodwus/EY3W921/lOMvG6C2ELq5Ijc1YLT+axHHoez
	nPDsd7thm/0Tg9aCkciV1ygwT2luxj71E/TLrVybIWSWBuTYgzlG0Jbvli88sHPJboIPSMaXOtP
	c94M2GYvqzkZ2B0MvI/KNYbFzydztLtR98We1Qdmkn/Swr/Tdipe5RYKg8qVmMxHlkSM=
X-Google-Smtp-Source: AGHT+IGSYh1TL/N7CCTy8q9v1xs9MpA02L7Gx7HByLh50c7jwiBkDpPHyX8DM4sAupKqKaI8bxT0/w==
X-Received: by 2002:a17:90b:3d86:b0:338:3789:2e7b with SMTP id 98e67ed59e1d1-3436cb40997mr15755140a91.13.1762873142643;
        Tue, 11 Nov 2025 06:59:02 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:db6b:ed5a:7890:6b41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343685301f8sm11662588a91.5.2025.11.11.06.59.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 06:59:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 13/19] ca-certificates: get sources from debian tarballs
Date: Tue, 11 Nov 2025 06:58:21 -0800
Message-ID: <44c113497c7e3f9f06604e892df1eb717bb3410d.1762872962.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762872962.git.steve@sakoman.com>
References: <cover.1762872962.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 14:59:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226178

From: Alexander Kanavin <alex@linutronix.de>

git repo no longer has tags for recent versions which means
we had missed several of them, and wouldn't be able to get
notifications about any future releases.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 81f013fd1312551628701bf36ac62746a2606dbd)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ca-certificates/ca-certificates_20240203.bb | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb b/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb
index ac0756471c..eff1d97bc5 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb
@@ -14,26 +14,15 @@ DEPENDS:class-nativesdk = "openssl-native"
 # Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
-# Since there is no TAG in the git repository, the SRCREV was determined
-# through comparison of the git repository and the data on the following
-# package informatin pages:
-#
-# * https://packages.debian.org/trixie/ca-certificates
-# * https://packages.ubuntu.com/noble/ca-certificates
-#
-SRCREV = "ee6e0484031314090a11c04ee82689acb73d7ad8"
-
-SRC_URI = "git://salsa.debian.org/debian/ca-certificates.git;protocol=https;branch=master \
+SRC_URI[sha256sum] = "3286d3fc42c4d11b7086711a85f865b44065ce05cf1fb5376b2abed07622a9c6"
+SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz \
            file://0002-update-ca-certificates-use-SYSROOT.patch \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
            file://default-sysroot.patch \
            file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch \
            file://0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch \
            "
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+)"
-
-S = "${WORKDIR}/git"
-
+S = "${WORKDIR}/ca-certificates"
 inherit allarch
 
 EXTRA_OEMAKE = "\
-- 
2.43.0



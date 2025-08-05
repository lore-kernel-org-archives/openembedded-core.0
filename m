Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2655EC87FD2
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 16:43:46 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.4196.1754412223456014554
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 09:43:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=b+L6sxEo;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b421b70f986so4597496a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 09:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1754412222; x=1755017022; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KzmHFXp0aFw25lOHFxLVAQl2jKDzO8o0tKjvUUL9daQ=;
        b=b+L6sxEo4rHTrXSHP6lM0YM0wa1MCwQ09BSgLCO2sxsyZ2Yj8SPiDmnLx5lNbSNCO1
         Q+487OPEUSnIIdKJlGV6gc4v33bjR96p9/Uwteh+ayqRE7VMQUdyudd0NNOwjUa4+0nA
         5fmHUGqgIYvmYX2O9TnpInIHY3IMgtdEbyynyBOBPNNqgV00jlgdeHZVQMDf7LmF8jFq
         g2braE3hHG4laNppN3ty6mCPre4O70ebWlSmgXU8EHQZ4aqCIyWHIrHsU+cmDlCCwVB1
         a3Den1YZK2MeqqRjm1ytVpdlprmciiHIjMyBjSQz1PeDt5J6em7KzkxV68BRFFH9DarS
         V5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754412222; x=1755017022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KzmHFXp0aFw25lOHFxLVAQl2jKDzO8o0tKjvUUL9daQ=;
        b=rpjKsTWgSctLijMBIq9mWZSoxQsU0QMiMAHwdop3lPkQPR0EhpCHwD1SUM8piqnwpj
         0IAFqpA/aGOJge944OhlkcVZX2Hl/4ePubWt2H/ebyHTpGu7sppfcIFQ7xiZ/tK3S+n8
         CxrN2FNsMvfAtHxMScvQgLyDV+PJgoaRCzR/6VFwQfIruQ9GgSoPwz16kAyrEAdaad/W
         od3L36sCjJYXFVPVA8pCUVnVny+Xd4DJEFxURdlqiyPvA4Fb7hM5YydSOy5NYFK9wD70
         vU4ST1D0uWnjGU1ycoTkRj1GZCsWDyAKmMruEl2GyCpq3/7XlB8PP6U6pd77YeRoLa3G
         3gQQ==
X-Gm-Message-State: AOJu0YwENYeK9NA2CA/iZ7sURqDZD7EoFDlKoOX9r/fMf5eOTQ8FxS4h
	3I4tpCUw7qgMWhSLTLXqSH9YofeiKgB2cK/r2AXRmKuOqqYNnHI4TeA0U9NEhUVdcjvJinPHNaJ
	/sFhQ
X-Gm-Gg: ASbGnctQ/i+YFaet1/QMtopRiH2YhC8aZjrtkt588XRVaqhrbEMd0YnzH5TxoB1EUNs
	iCt+YH9UBHWaVEDevuqg1bh1m5cYOzTPpYv3sGKuGVvAluZP9fU1waA6yQp8Rk/1X7Wj/BzB5Kx
	emiHtM6lcfY+XpzvwE6c4AhPseqsp7NwAcvZPJCfOvoyn+5wltyW86cpsDILoo1sJ1ukKVeVZcW
	TP4PYeFVbgZqFBvMwEOFcXrhuRKnj6OnTezLccCt1cIwWZPHiqaud8je/46Eez7SyxO1Q33rxGM
	eY9+BnZHypFnY7+zVt38HyBtiTPrJT5db26aqlgx7Jc9nHjYX9X1ceFUn5f5hts6YVdOlG8X2x9
	lyd9Fb0fo0P+v
X-Google-Smtp-Source: AGHT+IFEbSs9fuFDHfuuZ23VCEtkyABuctuR2+bCkOcOr8iDgs047fE53k2hUes+9q69kPVzoju9cQ==
X-Received: by 2002:a17:902:8608:b0:240:3eb9:5363 with SMTP id d9443c01a7336-242470041bfmr130027765ad.27.1754412222188;
        Tue, 05 Aug 2025 09:43:42 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3554:164c:182:30f5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f0e7d8sm137633135ad.42.2025.08.05.09.43.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 09:43:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/4] Patch review
Date: Tue,  5 Aug 2025 09:43:32 -0700
Message-ID: <cover.1754412086.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 16:43:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221479

Please review this set of changes for kirkstone and have comments back by
end of day Thursday, August 7

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2150

The following changes since commit b4a2f74ba0b40abcdf56c4b58cae5f7ce145d511:

  sqlite3: Fix CVE-2025-6965 (2025-07-29 06:39:06 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Peter Marko (3):
  sqlite3: patch CVE-2025-7458
  sqlite3: ignore CVE-2025-3277
  glibc: stable 2.35 branch updates

Zhang Peng (1):
  avahi: fix CVE-2024-52615

 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   1 +
 .../avahi/files/CVE-2024-52615.patch          | 228 ++++++++++++++++
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 .../glibc/glibc/0025-CVE-2025-4802.patch      | 250 ------------------
 meta/recipes-core/glibc/glibc_2.35.bb         |   2 +-
 ...mpts-to-improve-the-detection-of-cov.patch |  91 +++++++
 .../sqlite/files/CVE-2025-7458.patch          |  32 +++
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb |   4 +
 8 files changed, 358 insertions(+), 252 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2024-52615.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch
 create mode 100644 meta/recipes-support/sqlite/files/0001-This-branch-attempts-to-improve-the-detection-of-cov.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-7458.patch

-- 
2.43.0



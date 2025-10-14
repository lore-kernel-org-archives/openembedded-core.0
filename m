Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73851CCD190
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 22:45:07 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.2566.1760481897473987226
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 15:44:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CjF6fLCz;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-269af38418aso68330285ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 15:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760481897; x=1761086697; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HDN2YfZZPRoyxrJr/DMPtloDAf2ln2Oupfu3f9RtfMI=;
        b=CjF6fLCzsmD43Yk8y2qAkRRjXsBUDVrFPGO8D9zD6sdRFkgIgifbUPwOkbii3hieJJ
         0LbMedt/wBZOPb+cORteZcmWlZZnWmltXdmGW09UNK8PzTDeyx+uGSHiM94Kp7N23zvq
         iWVDWTu79UTBeah7QTgleJfLUqG321zHnjmq9yZn0R7zlu3MNt/ESlsBWqgfjqv/Jos3
         33y5/1429slPuBfoHwqU99oK1P8NqUHNqeudaB7K+K0fW74ZNDk4GpAJjrr5vrnwKfVp
         U13hJ2OqSLRJ6Uy2gqzrt2d3+nBozExFnn6Isvf+iyzzQKO3nqkwPr6dz+UCl7IfoNH9
         76IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760481897; x=1761086697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HDN2YfZZPRoyxrJr/DMPtloDAf2ln2Oupfu3f9RtfMI=;
        b=VJth5rw9vc/u5eGqom3Mt7Q9emzvA0BvBIUybU0Q/d4p9ct3G1Ly/NfoTqL84/KqdJ
         FoC6EHW5hAEZStuYHMOYheF/IUbUHiutWJP391JJpEPqFUfLLEsF1/OxYviA/Rz4sv90
         FG2BzfliJzOKhynNOex6LNElkb3b6s2lwb+H/qfdTeU+odB909SH2TKGF6nsATXPPnbn
         Q99zWbMjmLvmR3vXfQ7eSNGuy1yjMf07iQg0+BGZoFPNyZp+YU5D4j04lwqk7Mr5Wnzn
         o/my0ZcC2z7WBCLOvCl8sNXXA5LSoHudjjd+SsBfrLNduDkrsUdjV9bXd0gPCGmY88wS
         L8Hg==
X-Gm-Message-State: AOJu0YyLPrAgyirmh7iO8BeWALS1LhS+1wjwnkTbZ0685uoPkTnc4DCg
	F+DSts7IT9Y9JKZ7NdG3tCk0zDqN1qsQttl05zTxTpmfWSxsGojMkNxlHrrG2m6l8BfazoozJ/m
	BQBIU
X-Gm-Gg: ASbGncsywiEW/XDV7WH7O7pXmTDGGNkxD9wlYPBZgo85CQHAYpLEeUQfrT6Rlh2Q1Rt
	3aumys44mcFaE1PKvQz/iQvL06ycttkcAC5XdU6PGcFqRNVgMeXwURCUlm/NdUp0gSglhocuNAX
	xZqwOOPsfHaEKDCxha+TsHyqjkwTSB/t4/2pDKoPdKJziYW3tF+4wh1hmNCVtEaQnOsawlRtez/
	PIiEHQRVToC6fEWU0qh4gkj7rLc3el/PxCdVDg6yf7GmfBpHIaF5LCE1VM+MJn7FpMONW06P8fY
	hMDZNAwxMaBCHPoe7e4s8LWhBh6dMUQQexyoO1UrbcNqe9yB3LcbD0EIpOcXdm+EldQsp5MFWea
	LBYHuFEKf+81gpSeQt+FPVnoY53wbijyai7EGu7xGyKY=
X-Google-Smtp-Source: AGHT+IEIaoVpzbdljF2Qpfc720Y8WPAWFqeuHNrr3vfaMqOQj8X3iBjpkQPPggc9kuHEw56qHW7n0w==
X-Received: by 2002:a17:903:4b04:b0:274:746c:b09 with SMTP id d9443c01a7336-2902741e41emr324418685ad.55.1760481896552;
        Tue, 14 Oct 2025 15:44:56 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:ebea:520a:7699:bba7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e20479sm174847365ad.47.2025.10.14.15.44.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 15:44:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/14] Patch review
Date: Tue, 14 Oct 2025 15:44:37 -0700
Message-ID: <cover.1760481775.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 22:45:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224854

Please review this set of changes for kirkstone and have comments back by
end of day Thursday, October 16

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2585

The following changes since commit 0d11c9103f072841baf39166efc133f2a20fc4dc:

  oeqa/sdk/cases/buildcpio.py: use gnu mirror instead of main server (2025-10-09 07:35:42 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Peter Marko (3):
  qemu: patch CVE-2024-8354
  binutils: patch CVE-2025-11082
  binutils: patch CVE-2025-11083

Sunil Dora (11):
  glibc: Remove partial BZ#25847 backport patches
  glibc: pthreads NPTL lost wakeup fix 2
  glibc: nptl Update comments and indentation for new condvar
    implementation
  glibc: nptl Remove unnecessary catch-all-wake in condvar group switch
  glibc: nptl Remove unnecessary quadruple check in pthread_cond_wait
  glibc: Remove g_refs from condition variables
  glibc: nptl Use a single loop in pthread_cond_wait instaed of a nested
    loop
  glibc: nptl Fix indentation
  glibc: nptl rename __condvar_quiesce_and_switch_g1
  glibc: nptl Use all of g1_start and g_signals
  glibc: : PTHREAD_COND_INITIALIZER compatibility with pre-2.41 versions
    (bug 32786)

 .../glibc/glibc/0026-PR25847-1.patch          |  24 +-
 .../glibc/glibc/0026-PR25847-10.patch         |  54 ++++
 .../glibc/glibc/0026-PR25847-2.patch          |  13 +-
 .../glibc/glibc/0026-PR25847-3.patch          |  18 +-
 .../glibc/glibc/0026-PR25847-4.patch          |  11 +-
 .../glibc/glibc/0026-PR25847-5.patch          | 237 ++++++++++-----
 .../glibc/glibc/0026-PR25847-6.patch          | 220 +++++---------
 .../glibc/glibc/0026-PR25847-7.patch          | 277 +++++++++---------
 .../glibc/glibc/0026-PR25847-8.patch          | 269 ++++++++---------
 .../glibc/glibc/0026-PR25847-9.patch          | 193 ++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   2 +
 .../binutils/binutils-2.38.inc                |   2 +
 .../binutils/0044-CVE-2025-11082.patch        |  46 +++
 .../binutils/0045-CVE-2025-11083.patch        |  77 +++++
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2024-8354.patch             |  75 +++++
 16 files changed, 974 insertions(+), 545 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-10.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-9.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0044-CVE-2025-11082.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0045-CVE-2025-11083.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-8354.patch

-- 
2.43.0



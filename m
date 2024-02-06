Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97AB6C4828D
	for <webhook@archiver.kernel.org>; Tue,  6 Feb 2024 15:47:17 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.24761.1707234435987754888
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Feb 2024 07:47:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FJy5qIX6;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-296717ccc2aso577250a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 07:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1707234435; x=1707839235; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=oX8ndgsdo91QmyfZ96Ai2z6RhcfflMOsoH21fUe26s8=;
        b=FJy5qIX6sg8z6coRywDPWnW+tR8tfPi3IUFYkVZcnzOv8xZgGHVZWivRy916UkyrUJ
         Sed6i22I//IOkjAZKQk04B/fJimTHYcowwiJpTFEyC/l9GUMdfpyT08hbontmaEmOVvu
         LYAy/SXBDmuowJw7YzJUYPaA09tsnyTqVcP1R3FvD2fCwHpk1ZLj5cmSa3Da10D1Ftwk
         b5e5A6uRUwDpcZp273D/2y/QIaqAyiqKiodlPtKuPGQEVwn17+2NSFZGe1IIClu3csBa
         ZuuVUqlLn7tsz4qZy4ZpPpFf+IlpzmdrohGnYlSgDlgyxHtreIneq8g8UntpqQsOi41L
         zt1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707234435; x=1707839235;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oX8ndgsdo91QmyfZ96Ai2z6RhcfflMOsoH21fUe26s8=;
        b=et00r/y/QQRcOoh9m6AbOLi/cZKtxfy5pQFawxdvU3hAOfJ3JcMVJ7z98Yrdm8+1Oh
         zwq4l4hHw/jl1P53aLFkYdvf33lh3LsLqOOaCauVYCy1CZTVoXJLq2XKGq8tekMHu9u0
         WmCSy7GPwv0kyevr+zMzqcagBhjkBiO+fwdNZCxHizsCtSz6p4Za5v8+c7/tKhjhk6if
         wvHOV1vzKLwbBnaud73RO+dOhnfQ33AmwhuknCpaLIRDtuh6aW314+ji9VChQ1beKo2o
         GAZBL2UYQvOnZp4QfsxO8TOVuC8BWI5v5ChajsQIBVrMMcB3xahnbZDf+RK9b/b112do
         /H8Q==
X-Gm-Message-State: AOJu0Yw2ZK2MHiMCDAyaUMVzoGpU9l1txiEdxvvKPH4MB22rmlWEn3lq
	13iE9mkdHM1DC4/11XoX4jFA7YqBDvT7y1R9W0biZpi9LASOVnXnyZKt0u5x3dK6d16F1DLHe68
	QgEk=
X-Google-Smtp-Source: AGHT+IGxJwnGGAz2E3KAfCAWXOtDsNUnPHwh7Mf1LYP4ZKwdUTAOY0HSHNFEtp+StEmOHwYd1+W8XQ==
X-Received: by 2002:a17:90b:255:b0:296:5e20:48bc with SMTP id fz21-20020a17090b025500b002965e2048bcmr4794705pjb.10.1707234434517;
        Tue, 06 Feb 2024 07:47:14 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id kx18-20020a17090b229200b0029454cca5c3sm1811452pjb.39.2024.02.06.07.47.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 07:47:14 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/7] Patch review
Date: Tue,  6 Feb 2024 05:45:18 -1000
Message-Id: <cover.1707234215.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Feb 2024 15:47:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194999

Please review this set of changes for kirkstone and have comments back by
end of day Thursday, February 8

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6539

The following changes since commit 60d88989698968c13f8e641f0ba1a82fcf700fb7:

  image-live.bbclass: LIVE_ROOTFS_TYPE support compression (2024-01-30 07:10:42 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Deepthi Hemraj (4):
  binutils: internal gdb: Fix CVE-2023-39129
  binutils: internal gdb: Fix CVE-2023-39130
  gdb: Fix CVE-2023-39129
  gdb: Fix CVE-2023-39130

Peter Marko (3):
  curl: ignore CVE-2023-42915
  gcc-shared-source: ignore CVE-2023-4039
  openssl: Upgrade 3.0.12 -> 3.0.13

 .../openssl/openssl/CVE-2023-5678.patch       | 180 ----------
 .../openssl/openssl/CVE-2023-6129.patch       | 113 ------
 .../openssl/openssl/CVE-2023-6237.patch       | 127 -------
 .../{openssl_3.0.12.bb => openssl_3.0.13.bb}  |   6 +-
 .../binutils/binutils-2.38.inc                |   2 +
 .../binutils/0035-CVE-2023-39129.patch        |  50 +++
 .../binutils/0036-CVE-2023-39130.patch        | 326 ++++++++++++++++++
 .../gcc/gcc-shared-source.inc                 |   3 +
 meta/recipes-devtools/gdb/gdb.inc             |   2 +
 .../gdb/gdb/0012-CVE-2023-39129.patch         |  50 +++
 .../gdb/gdb/0013-CVE-2023-39130.patch         | 326 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   3 +
 12 files changed, 764 insertions(+), 424 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-5678.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-6129.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-6237.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.0.12.bb => openssl_3.0.13.bb} (97%)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0035-CVE-2023-39129.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0036-CVE-2023-39130.patch
 create mode 100644 meta/recipes-devtools/gdb/gdb/0012-CVE-2023-39129.patch
 create mode 100644 meta/recipes-devtools/gdb/gdb/0013-CVE-2023-39130.patch

-- 
2.34.1



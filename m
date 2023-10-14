Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 721A4CDB465
	for <webhook@archiver.kernel.org>; Sat, 14 Oct 2023 21:45:11 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.75707.1697319909984316819
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Oct 2023 14:45:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TvhWyB+8;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-68fb85afef4so2629884b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 14:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697319909; x=1697924709; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gR/z6uBjxT9tXBzxO2c55b8jvMeRSWQ6DDaGcVpwKL4=;
        b=TvhWyB+8AutLz8E5yxZYwPwwOfoAZr8anHgtidu8nqXvwO1h/Kl2yayW0FKtN2eiI0
         lGTp1CJOx7UuhOEA124y+STz6N414dv9tx3QK9+3o+8Ax9qrFUXa2oGMPSOPi2Q/zZ8F
         69/etmV5ZqG8qQG60FcXLLeR49CcGfXGYrfdey57rpSnCNXkDVWezeRI3XgitkuTlKa4
         jGZg8Vn73XCSApSvuIe7bQ+/Bkw2DNiG4FaAJduFRcqgLhBOOU1wIz12RDBZ7vCSgrXV
         nieu5T3xdPY0p/YZYLAMNkQQnJWJ6StO+cscn8Zkdwi/gP6AiiP0DhhzwIRoy2QvVtWm
         BQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697319909; x=1697924709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gR/z6uBjxT9tXBzxO2c55b8jvMeRSWQ6DDaGcVpwKL4=;
        b=NoJsZcsUT4DZg4JArggaUdrc5XFtU0xLSAr45hB0EghNnPwdVCmJ/36/MNNJUNccx9
         fAQGrVJzA2vgpBSYIap/J0sdHbRp3SJPKpuWRl+R4xPOS1l2fYgAcJlvSiOEnUOYgE1c
         22cCEB1JyH5+j6JhgA8jTB0cfCsbh2AZ58LQlZxJIF5TqlSU+z6oVBlzIe0ZI4i8WPk/
         6AS6JE87zPuLrKt8ldwJ3laF/p0CYQuVnNqsQ/dRXMr40Jo9uwK46TuLIyywP9OcXhNQ
         GnYPwzFz6iYM1oVD7pGvG7sH0r6gOHpTdRnmNpSrvf+2F1vDJLD9fRE87FDmt6iSjoqN
         Lq5A==
X-Gm-Message-State: AOJu0Yw2Z/6mDsaBMUhYsPbUMjN+6GXY4Kw6cGJFMp29WJuqXFqHA/6q
	Kl83QAfekHHqE3ewoBMPFgV+tPV3mVUk0v1Nkg4=
X-Google-Smtp-Source: AGHT+IFoa/Z9C1CXq5GhKQE36Qi/I0NPtcwOTkSgYvNcGco8k1spKfYyn5OtdS6chJADt5elFcQXfQ==
X-Received: by 2002:a05:6a20:2591:b0:163:2da1:387f with SMTP id k17-20020a056a20259100b001632da1387fmr30590585pzd.50.1697319908951;
        Sat, 14 Oct 2023 14:45:08 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jf9-20020a170903268900b001c898328289sm5943411plb.158.2023.10.14.14.45.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Oct 2023 14:45:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/13] Patch review
Date: Sat, 14 Oct 2023 11:44:45 -1000
Message-Id: <cover.1697319777.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Oct 2023 21:45:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189124

Please review this set of changes for kikrstone and have comments back by
end of day Tuesday, October 17

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6044

The following changes since commit bca43f95850d395f9dc56644fa1d12910cabb0c5:

  glibc: Update to latest on stable 2.35 branch (2023-10-06 12:03:30 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexander Kanavin (2):
  python3-urllib3: upgrade 1.26.10 -> 1.26.11
  python3-urllib3: upgrade 1.26.12 -> 1.26.13

Hitendra Prajapati (2):
  libtiff: fix CVE-2022-40090 improved IFD-Loop handling
  xdg-utils: Fix CVE-2022-4055

Khem Raj (1):
  apt: add missing <cstdint> for uint16_t

Lee Chee Yang (1):
  python3-urllib3: 1.26.15 -> 1.26.17

Siddharth Doshi (1):
  vim: Upgrade 9.0.1894 -> 9.0.2009

Tim Orling (1):
  python3-urllib3: upgrade 1.26.13 -> 1.26.14

Wang Mingyu (1):
  python3-urllib3: upgrade 1.26.14 -> 1.26.15

Yash Shinde (2):
  binutils: Fix CVE-2022-44840
  binutils: Fix CVE-2022-45703

wangmy (2):
  python3-urllib3: upgrade 1.26.9 -> 1.26.10
  python3-urllib3: upgrade 1.26.11 -> 1.26.12

 ...001-add-missing-cstdint-for-uint16_t.patch |  35 ++
 meta/recipes-devtools/apt/apt_2.4.5.bb        |   1 +
 .../binutils/binutils-2.38.inc                |   3 +
 .../binutils/0030-CVE-2022-44840.patch        | 151 +++++
 .../binutils/0031-CVE-2022-45703-1.patch      | 147 +++++
 .../binutils/0031-CVE-2022-45703-2.patch      |  31 +
 ...3_1.26.9.bb => python3-urllib3_1.26.17.bb} |   3 +-
 .../xdg-utils/xdg-utils/CVE-2022-4055.patch   | 165 +++++
 .../xdg-utils/xdg-utils_1.1.3.bb              |   1 +
 .../libtiff/tiff/CVE-2022-40090.patch         | 569 ++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   1 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 12 files changed, 1108 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/apt/apt/0001-add-missing-cstdint-for-uint16_t.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0030-CVE-2022-44840.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0031-CVE-2022-45703-1.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0031-CVE-2022-45703-2.patch
 rename meta/recipes-devtools/python/{python3-urllib3_1.26.9.bb => python3-urllib3_1.26.17.bb} (82%)
 create mode 100644 meta/recipes-extended/xdg-utils/xdg-utils/CVE-2022-4055.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-40090.patch

-- 
2.34.1



Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B50E743FF
	for <webhook@archiver.kernel.org>; Sat, 30 Sep 2023 19:40:24 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.47399.1696102819499876732
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Sep 2023 12:40:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=qSFnbAll;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-692a885f129so11043183b3a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 12:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696102818; x=1696707618; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WAiztRMrr2Jz0PkfQw26OXzmogTKC4zYIWrA/z8UUMw=;
        b=qSFnbAllMk+dne1UebNmNUsBEHnFJjoXxREpHpv27kw2Uut5awIZ+IthMS28aYDNhk
         VcVF4QBY+vWQKzbS+EAvgLvmEW5YOVXRCHIamEJrGVJXaiiuO0w8HzcjaGniQhZTpIs5
         uQv5J4h9iO7gwpwF6setKPFmxQ8gEE7RkiIXkikwgwSW9pFu7WANFCwGa7Ibepr+rtYD
         C9BKpMeQ+ZZxcFjxGEw+PYv7hos+RiCo5g42zxKxwhNaT8vbj+PuM0pPVfDg79+td/ze
         UzuP17nn5Ne3ox7H1kRT44QrqAXW/lPrwihg5hFhlpXFKEJoQqQj4aCSJTMKCZecblMF
         Sdfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696102818; x=1696707618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WAiztRMrr2Jz0PkfQw26OXzmogTKC4zYIWrA/z8UUMw=;
        b=Fig8kVNFTqABE/8ghPQK2YiT7rFVWYccULcw6FalEvRsUn6p+k8qd7r1vhEaNkh60X
         w1DM+3B1K4CboWUNYuuINiDbLOx1mjTvmbMNDicaQ80V+VyFLPToEnflM/ZXg2qOSFi0
         oAfTJPdJH61+ggBZQHcLnBvvouOWFU9lwjkCjc4zTpcQ5//Tr31CQlI90sUegn0swM+e
         M1FXbtG1ekj29cacW8hqzAYm+NSnLvMx3PZq9b4Qh0BEIwF7fxiZL621zlYCwZXs8xPc
         lpNKj/1QN83FbE0abv2QMHrBg7nwUgDKvNRotufcL2B2EajITVYpH4iaZmGQ2caeJzld
         nX8w==
X-Gm-Message-State: AOJu0YxCYFSLO0QLsWNgPFSHj7yaMjZ6WPG6Y6jbR8DZ9m7oXCizvp9Q
	4ectbe5bk5iQUYaHhvzkzxgNLFCAYMhuTkhVgx0=
X-Google-Smtp-Source: AGHT+IFZlCMXqjaUdhvMp0V23lu+i5J7Spo/LD3iV53NhW8iwa+Taj79FoPpQ0XfkyYxuo/js5QMtg==
X-Received: by 2002:a05:6a00:1396:b0:690:2ad9:1436 with SMTP id t22-20020a056a00139600b006902ad91436mr9439816pfg.7.1696102818512;
        Sat, 30 Sep 2023 12:40:18 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id p2-20020a62ab02000000b006936d053677sm2880011pff.133.2023.09.30.12.40.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Sep 2023 12:40:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/13] Patch review
Date: Sat, 30 Sep 2023 09:39:57 -1000
Message-Id: <cover.1696102675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 19:40:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188465

Please review this set of changes for dunfell and have comments back by
end of day Tuesday, October 3

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5966

The following changes since commit a9d194f21a3bdebca8aaff204804a5fdc67c76d1:

  vim: Upgrade 9.0.1664 -> 9.0.1894 (2023-09-25 07:03:13 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexander Kanavin (1):
  nasm: update 2.15.03 -> 2.15.05

Archana Polampalli (1):
  nasm: fix CVE-2022-44370

Ashish Sharma (1):
  mdadm: Backport fix for CVE-2023-28736

Bruce Ashfield (4):
  linux-yocto/5.4: update to v5.4.252
  linux-yocto/5.4: update to v5.4.254
  linux-yocto/5.4: update to v5.4.256
  linux-yocto/5.4: update to v5.4.257

Colin McAllister (1):
  libwebp: Fix CVE-2023-5129

Lee Chee Yang (3):
  libxpm: fix CVE-2022-46285
  qemu: fix CVE-2020-24165
  python3: update to 3.8.18

Siddharth Doshi (1):
  go: Fix CVE-2023-39318 and CVE-2023-39319

Vijay Anusuri (1):
  ghostscript: fix CVE-2023-36664

 meta/recipes-devtools/go/go-1.14.inc          |   2 +
 .../go/go-1.14/CVE-2023-39318.patch           | 238 ++++++++++++
 .../go/go-1.14/CVE-2023-39319.patch           | 230 +++++++++++
 .../0002-Add-debug-prefix-map-option.patch    |  42 +-
 .../nasm/nasm/CVE-2022-44370.patch            | 104 +++++
 .../nasm/{nasm_2.15.03.bb => nasm_2.15.05.bb} |   5 +-
 .../{python3_3.8.17.bb => python3_3.8.18.bb}  |   4 +-
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2020-24165.patch            |  94 +++++
 .../ghostscript/CVE-2023-36664-1.patch        | 145 +++++++
 .../ghostscript/CVE-2023-36664-2.patch        |  60 +++
 .../ghostscript/CVE-2023-36664-pre1.patch     |  62 +++
 .../ghostscript/ghostscript_9.52.bb           |   3 +
 .../mdadm/files/CVE-2023-28736.patch          |  77 ++++
 meta/recipes-extended/mdadm/mdadm_4.1.bb      |   1 +
 .../xorg-lib/libxpm/CVE-2022-46285.patch      |  40 ++
 .../xorg-lib/libxpm_3.5.13.bb                 |   2 +
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 .../webp/files/CVE-2023-5129.patch            | 364 ++++++++++++++++++
 meta/recipes-multimedia/webp/libwebp_1.1.0.bb |   1 +
 22 files changed, 1467 insertions(+), 44 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-39318.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-39319.patch
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2022-44370.patch
 rename meta/recipes-devtools/nasm/{nasm_2.15.03.bb => nasm_2.15.05.bb} (80%)
 rename meta/recipes-devtools/python/{python3_3.8.17.bb => python3_3.8.18.bb} (99%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-24165.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-1.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-2.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2023-36664-pre1.patch
 create mode 100644 meta/recipes-extended/mdadm/files/CVE-2023-28736.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxpm/CVE-2022-46285.patch
 create mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-5129.patch

-- 
2.34.1



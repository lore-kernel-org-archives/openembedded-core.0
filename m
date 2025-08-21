Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E76ACA0FE2
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 15:40:07 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.708.1755790802709929406
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 08:40:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Xz30kOVP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-24458194d83so9844535ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 08:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755790802; x=1756395602; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fBjBWtDVWu5ruvPHebGQiQm08XY4xMG1TCHI9w/1tJI=;
        b=Xz30kOVPYlpzEwfPQ7LAqQBZNHmy8elFszgedUZMj4JHvW+iiq5VU8ucHsSwyf/q3/
         NNlvWGI3m15AnqOiqK+qG8N9VBwTT8hOMBf2i44F5M/Avoxs16eHK5GjzY0ED5AvhJkr
         SsLNypKqmWEEDAS5rzwZ5xf7HfvR5AAaGRVpAOkaVDy9VfAmgwfPXTUyHpt0Zt73vgUK
         nDmt33k8GrpwM82qeE/98D74ONlSCsIUWZm6229LZNiS0Uzih0EloBfxauoFMNZOA6ds
         hM9F8jZJMhmVCmEhjBbH5zHGttpQ1YC66hyCybMnR/kQo7fBDxAai/ErTtA3SD53cbZ1
         vC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755790802; x=1756395602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fBjBWtDVWu5ruvPHebGQiQm08XY4xMG1TCHI9w/1tJI=;
        b=B4jwwwcWhzrAkn/YejsYzhaNSNrgsLkEhrRcKwJAC5Xkmi8X9Hl/5pOa6qPZc3gqGc
         dTFmdkm18ILMCSSkE50+vRE9DWpJm65SlHMbCJRxwiHsLRJiAj5KuTKJBZHQrQRre+S1
         WNM689/NHfHxuqUPOHCdmfKzuD4g1AZ+Ssbg+Rjf7hDx0iZ18r6QJEuY55WYXE4v/4vv
         0aq2oPy5T3t5WdYhcuryohrHOIAU8syIv551kgDe6nIGfdt1eNmRJnC5I/IkY4qLuvhq
         8Jx6/236tGke77tLRHUEtvgu4vigYBOa/ayWaVdR2XEt/WpFkL2dgdLeYfkPFkkqA4i0
         xUow==
X-Gm-Message-State: AOJu0YwBOI5eHwH/6RPC5xVN9LNTf6hbacrmXu1dkW+K3Bew/b7zjwYF
	VNIk+NbfhbTc+ErJtq19r7YFbJoQ0alq62hvpCXH/OLZ/EL4KLIKZk1Q/oeZ46ynJYmLkT4Ypbm
	zIwdB
X-Gm-Gg: ASbGncvlYg0Pr6RaMKSHl74ZHNejQECqvyiIVONBsXccTz8Gy0/5rUdYSBcM09DMdtu
	Fsf1G4g9MpcrP1AUVw5hnUUUrR9ed5Cbkg4P9x1TlXpBIezKKRAM7/k0Zo+B+7e7gBxcWxejbgi
	n5sc0YIsQ5aG1ZlSmT9erdFy0hAFVZSei4mjN9IzQV+VGuT6DOWZJn8Pxcm31EHuihMrbUJ56s9
	SElK249OBNT766/M/A8NNrfyhaDBvRta7QlwWIwTkz8RVg4/n5XUgTGM8dHqktVLJFAz3NqhCbr
	bl79670loWMvbjC1w2+lppUGpsKGupFKLquOFBljV/zt4axepUE3dOoZDxDg/Of85s+6jHsztJA
	II4Is2QnvfeRjaw==
X-Google-Smtp-Source: AGHT+IEkEPTW2JLf6dLGDm97lUwnptJF7cbyLIOwBxMJItiCzDyJqfkedFfpzJ2SGYs5fpJCBnvcWA==
X-Received: by 2002:a17:902:ea10:b0:242:9bc6:6bc2 with SMTP id d9443c01a7336-245ff867e70mr40040625ad.57.1755790801667;
        Thu, 21 Aug 2025 08:40:01 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:bc1c:6959:5ad5:d4f9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed51b3dfsm58901845ad.142.2025.08.21.08.40.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:40:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 00/15] Patch review
Date: Thu, 21 Aug 2025 08:39:41 -0700
Message-ID: <cover.1755790385.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 15:40:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222249

Please review this set of changes for walnascar and have comments back by
end of day Monday, August 25

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2244

The following changes since commit 347cb0861dde58613541ce692778f907943a60ea:

  build-appliance-image: Update to walnascar head revision (2025-08-15 09:08:50 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/walnascar-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/walnascar-nut

Harish Sadineni (1):
  binutils: Fix gprofng broken symbolic link with gp-*

Markus Volk (1):
  glib-2.0: update 2.84.0 -> 2.84.1

Martin Jansa (2):
  pkgconfig: fix build with gcc-15
  bash: use -std=gnu17 also for native CFLAGS

Patryk Seregiet (1):
  linux-firmware: fix FILES to drop RDEPENDS on full package

Peter Marko (3):
  glib-2.0: update 2.84.2 -> 2.84.4
  glib-2.0: patch CVE-2025-6052
  go: upgrade 1.24.5 -> 1.24.6

Praveen Kumar (1):
  glib-2.0: update 2.84.1 -> 2.84.2

Soumya Sambu (6):
  elfutils: Fix CVE-2025-1352
  elfutils: Fix CVE-2025-1365
  elfutils: Fix CVE-2025-1371
  elfutils: Fix CVE-2025-1372
  elfutils: Fix CVE-2025-1376
  elfutils: Fix CVE-2025-1377

 ...on-Run-atomics-test-on-clang-as-well.patch |   2 +-
 ...ot-enable-pidfd-features-on-native-g.patch |   2 +-
 .../glib-2.0/files/CVE-2025-6052-1.patch      |  97 +++++++++++
 .../glib-2.0/files/CVE-2025-6052-2.patch      |  35 ++++
 ...664e6f1a29e0d5f301979f6d168b08435a61.patch |  75 ---------
 ...l_2.84.0.bb => glib-2.0-initial_2.84.4.bb} |   0
 ...{glib-2.0_2.84.0.bb => glib-2.0_2.84.4.bb} |   0
 meta/recipes-core/glib-2.0/glib.inc           |   7 +-
 .../binutils/binutils-2.44.inc                |   1 +
 .../0020-Fix-for-borken-symlinks.patch        |  62 +++++++
 .../elfutils/elfutils_0.192.bb                |   6 +
 .../elfutils/files/CVE-2025-1352.patch        | 154 ++++++++++++++++++
 .../elfutils/files/CVE-2025-1365.patch        | 152 +++++++++++++++++
 .../elfutils/files/CVE-2025-1371.patch        |  41 +++++
 .../elfutils/files/CVE-2025-1372.patch        |  51 ++++++
 .../elfutils/files/CVE-2025-1376.patch        |  57 +++++++
 .../elfutils/files/CVE-2025-1377.patch        |  68 ++++++++
 .../go/{go-1.24.5.inc => go-1.24.6.inc}       |   2 +-
 ...e_1.24.5.bb => go-binary-native_1.24.6.bb} |   6 +-
 ..._1.24.5.bb => go-cross-canadian_1.24.6.bb} |   0
 ...{go-cross_1.24.5.bb => go-cross_1.24.6.bb} |   0
 ...osssdk_1.24.5.bb => go-crosssdk_1.24.6.bb} |   0
 ...runtime_1.24.5.bb => go-runtime_1.24.6.bb} |   0
 .../go/{go_1.24.5.bb => go_1.24.6.bb}         |   0
 ...0001-Do-not-use-bool-as-a-field-name.patch |  36 ++++
 .../pkgconfig/pkgconfig_git.bb                |   1 +
 meta/recipes-extended/bash/bash_5.2.37.bb     |   3 +
 .../linux-firmware/linux-firmware_20250311.bb |   6 +-
 28 files changed, 779 insertions(+), 85 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/files/CVE-2025-6052-1.patch
 create mode 100644 meta/recipes-core/glib-2.0/files/CVE-2025-6052-2.patch
 delete mode 100644 meta/recipes-core/glib-2.0/files/aee0664e6f1a29e0d5f301979f6d168b08435a61.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0-initial_2.84.0.bb => glib-2.0-initial_2.84.4.bb} (100%)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.84.0.bb => glib-2.0_2.84.4.bb} (100%)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0020-Fix-for-borken-symlinks.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1352.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1365.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1371.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1372.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1376.patch
 create mode 100644 meta/recipes-devtools/elfutils/files/CVE-2025-1377.patch
 rename meta/recipes-devtools/go/{go-1.24.5.inc => go-1.24.6.inc} (91%)
 rename meta/recipes-devtools/go/{go-binary-native_1.24.5.bb => go-binary-native_1.24.6.bb} (79%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.24.5.bb => go-cross-canadian_1.24.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.24.5.bb => go-cross_1.24.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.24.5.bb => go-crosssdk_1.24.6.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.24.5.bb => go-runtime_1.24.6.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.24.5.bb => go_1.24.6.bb} (100%)
 create mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/0001-Do-not-use-bool-as-a-field-name.patch

-- 
2.43.0



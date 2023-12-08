Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC2FCC46CC5
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 02:33:39 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.11136.1702002813982040324
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 18:33:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gzOp3WIw;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-5c6734e0c22so1167966a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Dec 2023 18:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702002812; x=1702607612; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uub6B7b4qbOeTcqoIiU0NXw0t6wm3hPrKie4GIRcn2U=;
        b=gzOp3WIwLw0V/Ss2wMRULODjBSdgTgRiZRrwnm3GXHYDB60N+/+RNeOEj26tVLzbMK
         5yagRP3ROmTlw/GfNo53aeDtcPoPDbmSDNzNeIN0HsnP+tUQXcgOdsvwb7kXR0DDHHhG
         syJD/vZ2tJY7LtcKRHET5scEyeSup2R9GaMAMVEsUvcVVmhx2Z6dsZRwfnjRhIBj+eZC
         8Rq3wT0dJHMso0T9K9pgCCP66UQGtx9pLB2+Ab0pQuGqoR4j8lkMpJ/UuiZcOJpwmlpr
         jMYdXA5Hgm9P2dIBWWce5I/7XYDzpdlLud+RdpgpzBL3puRjluuXhY9bq6UXVRnzMV1X
         lXWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702002812; x=1702607612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uub6B7b4qbOeTcqoIiU0NXw0t6wm3hPrKie4GIRcn2U=;
        b=A+eNoqpQ2M+gJ6MhweH7XS4H27u0MCnkNsh0qwdq4/9HsQO5K2EtgemRGvhCNqD9nB
         +rxEmCfOqAsfS3Ir9Q+ld2mB0CnREcPTP9sUYIvggMFte6hviypR9OpYXdmVnSUb8CME
         t62p/IW0ROKjpTWmK9TgtVabDpW/tZ72x1DM2FBs9Hq7zPGeBO3dctgwjC0Rxam14eHB
         cjFtK8UYWkPwSYRgwj0mHrUa8lmHBAHT7Qlq1LTqvKO3yzYzsDVvla+g3MWsO81W4LIP
         oa4IbPyOS83soQXdzskwt9WhnLZzovdVogDPrXUmGX27MCaBngaWtu0I+sW3+V5AD5p2
         flsw==
X-Gm-Message-State: AOJu0YxSji1jgkYUMZHv381CdF9UITYpq4mF6plYPr8o0S8DN6ajpkiN
	Yq5ZPXMU6kdh9PUWXSY83YVU9/87E9VpXe6Fdvo=
X-Google-Smtp-Source: AGHT+IG3/Xx1N11PCWfBC6DuTxVDvHeSHw3jRhDReweW36UBhTL2F2HXyqrlVEdpVRmVKDb8an22tw==
X-Received: by 2002:a17:90b:4b86:b0:286:d464:687e with SMTP id lr6-20020a17090b4b8600b00286d464687emr3263020pjb.18.1702002812385;
        Thu, 07 Dec 2023 18:33:32 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id i11-20020a170902c94b00b001c9bc811d4dsm499752pla.295.2023.12.07.18.33.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 18:33:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/15] Patch review
Date: Thu,  7 Dec 2023 16:33:06 -1000
Message-Id: <cover.1702002667.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 02:33:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191992

Please review this set of changes for kirkstone and have comments back by
end of day Monday, December 11

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6300

The following changes since commit 11da43b58e19583a9bc16044309610cfb2e86469:

  systemtap_git: fix used uninitialized error (2023-11-28 05:11:52 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Bruce Ashfield (3):
  linux-yocto/5.10: update to v5.10.198
  linux-yocto/5.10: update to v5.10.200
  linux-yocto/5.10: update to v5.10.202

Lee Chee Yang (1):
  xwayland: fix CVE-2023-5367

Narpat Mali (1):
  python3-cryptography: fix CVE-2023-49083

Niko Mauno (1):
  rust-llvm: Allow overriding LLVM target archs

Richard Purdie (5):
  rust-common: Set llvm-target correctly for cross SDK targets
  rust-cross-canadian: Fix ordering of target json config generation
  rust-cross/rust-common: Merge arm target handling code to fix
    cross-canadian
  rust-cross: Simplfy the rust_gen_target calls
  native: Clear TUNE_FEATURES/ABIEXTENSION

Steve Sakoman (1):
  cve-exclusion_5.10.inc: update for 5.10.202

Tim Orling (1):
  vim: upgrade 9.0.2068 -> 9.0.2130

Vivek Kumbhar (1):
  libsndfile: fix CVE-2022-33065 Signed integer overflow in src/mat4.c

Wenlin Kang (1):
  bash: changes to SIGINT handler while waiting for a child

 meta/classes/native.bbclass                   |   2 +
 .../python3-cryptography/CVE-2023-49083.patch |  53 ++++
 .../python/python3-cryptography_36.0.2.bb     |   1 +
 meta/recipes-devtools/rust/rust-common.inc    |  24 +-
 .../rust/rust-cross-canadian-common.inc       |   5 +-
 meta/recipes-devtools/rust/rust-cross.inc     |  21 +-
 meta/recipes-devtools/rust/rust-llvm.inc      |   4 +-
 ...T-handler-while-waiting-for-a-child-.patch | 229 ++++++++++++++++++
 meta/recipes-extended/bash/bash_5.1.16.bb     |   1 +
 .../xwayland/xwayland/CVE-2023-5367.patch     |  85 +++++++
 .../xwayland/xwayland_22.1.8.bb               |   4 +-
 .../linux/cve-exclusion_5.10.inc              |  92 +++++--
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +-
 .../libsndfile1/CVE-2022-33065.patch          |  46 ++++
 .../libsndfile/libsndfile1_1.0.31.bb          |   1 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 18 files changed, 542 insertions(+), 68 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/CVE-2023-49083.patch
 create mode 100644 meta/recipes-extended/bash/bash/0001-changes-to-SIGINT-handler-while-waiting-for-a-child-.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2023-5367.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065.patch

-- 
2.34.1



Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6FADC46467
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 14:34:23 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.13442.1672842858317785135
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 06:34:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=02CQxQcH;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id j8-20020a17090a3e0800b00225fdd5007fso24845544pjc.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 06:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YCHizy3X8siH68MyL0FkgM9stHicKF5PJT6+7VToVFc=;
        b=02CQxQcH01PQJ/qdXtryxFG8Q+SRvBzKALl64+S6ryIvwI/oc9pzqbCp+MmRLaDWJo
         oTuOrnmSP50c+8usdfmTS7/gNJqLUqMzUA4dJZTU5eYqCFKQomZRCI6d/z4SiUIz/XQi
         1WfxJXHnYENggpUzLjt8vhlyRBmtmaNDZZY1Zjm261g/1u2LFbnEBkVPw/69IKZ+8Diw
         YuvRJbDftP9my9NafFfCs5SYXvGfsgpIArnCB+6AgM7XHwGuiEcmPDbZ74ERTYw0oD7S
         XUQikwMpAix6rsJewFGA22rtbxq+p7lU9mCIp1z8VZcuBwbgwuMPOd5IWfWMh1mbyghR
         I2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YCHizy3X8siH68MyL0FkgM9stHicKF5PJT6+7VToVFc=;
        b=VNNxwWBHHCVAZIEwcbNkDdbHhB/2aLW53jQMKrBFZsIUkQQnOXZa7qxtOhsE4QoNzL
         f3BRDpe6L5dYHRhwIearjehPV7w77oKCNPjLJTwWqvfU+DoaR2Zyj92MX2N2aU30CBdT
         SK09oXeCJgGw5g9kKscdME32Uc9BBUerLC8wZQhbh9VIiIDDSLCYdQyIbODQp8ajuC1i
         khvXjIxEl1kG46t4ZAvugnWKRWLjMS//RxHAkB1WKJDulrAgYjmGyPVVwRtzbJETKs+p
         x9XO8kSWKhfCJx9eQShN7YKRcU4jKEt8Q4o46fNa90kY7IwTLvAJAEcYOZof1mA0oxUQ
         ECoQ==
X-Gm-Message-State: AFqh2kqafcV+iSZIfqRvGlYA6LLMXE4ZpdM29IoA0vgy0xz5vKAkPW1+
	Dcmte8GxQsMkgJ8V7fjjlzVuLEUreIBZuWqGkAk=
X-Google-Smtp-Source: AMrXdXvQmST3/pGlQ2bb+gVSe33+e3jgSIWD4S810X0dhh1CD3sv96lQleS+SFT/APTMCpVFJzDPRA==
X-Received: by 2002:a17:903:2283:b0:192:8b51:a9f5 with SMTP id b3-20020a170903228300b001928b51a9f5mr47312071plh.68.1672842856950;
        Wed, 04 Jan 2023 06:34:16 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id x14-20020a170902a38e00b00176ab6a0d5fsm24250982pla.54.2023.01.04.06.34.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 06:34:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/18] Pull request (cover letter only)
Date: Wed,  4 Jan 2023 04:34:10 -1000
Message-Id: <cover.1672842789.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 14:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175479

The following changes since commit cc8ec63310f9a936371ea1070cb257c926808755:

  oeqa/selftest/tinfoil: Add test for separate config_data with recipe_parse_file() (2022-12-14 16:34:29 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (1):
  tzdata: update 2022d -> 2022g

Bruce Ashfield (4):
  linux-yocto/5.4: update to v5.4.221
  linux-yocto/5.4: update to v5.4.224
  linux-yocto/5.4: update to v5.4.225
  linux-yocto/5.4: update to v5.4.228

Chen Qi (1):
  bc: extend to nativesdk

Hitendra Prajapati (1):
  grub2: CVE-2022-28735 shim_lock verifier allows non-kernel files to be
    loaded

Jagadeesh Krishnanjanappa (1):
  qemuboot.bbclass: make sure runqemu boots bundled initramfs kernel
    image

Joshua Watt (1):
  sudo: Use specific BSD license variant

Minjae Kim (1):
  ppp: fix CVE-2022-4603

Peter Marko (1):
  externalsrc: fix lookup for .gitmodules

Quentin Schulz (1):
  cairo: update patch for CVE-2019-6461 with upstream solution

Robert Andersson (1):
  go-crosssdk: avoid host contamination by GOCACHE

Ross Burton (1):
  lib/buildstats: fix parsing of trees with reduced_proc_pressure
    directories

Vivek Kumbhar (4):
  go: fix CVE-2022-41717 Excessive memory use in got server
  rsync: fix CVE-2022-29154 remote arbitrary files write inside the
    directories of connecting peers
  libx11: fix CVE-2022-3555 memory leak in _XFreeX11XCBStructure() of
    xcb_disp.c
  qemu: fix CVE-2021-3507 fdc heap buffer overflow in DMA read data
    transfers

 meta/classes/externalsrc.bbclass              |   2 +-
 meta/classes/qemuboot.bbclass                 |   3 +-
 .../grub/files/CVE-2022-28735.patch           | 271 ++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |   1 +
 .../ppp/ppp/CVE-2022-4603.patch               |  50 +++
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb    |   1 +
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2022-41717.patch           |  75 ++++
 meta/recipes-devtools/go/go-crosssdk.inc      |   2 +
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2021-3507.patch             |  87 +++++
 .../rsync/files/CVE-2022-29154.patch          | 334 ++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.1.3.bb    |   1 +
 meta/recipes-extended/bc/bc_1.07.1.bb         |   2 +-
 meta/recipes-extended/sudo/sudo.inc           |   2 +-
 meta/recipes-extended/timezone/timezone.inc   |   7 +-
 .../cairo/cairo/CVE-2019-6461.patch           |  35 +-
 .../xorg-lib/libx11/CVE-2022-3555.patch       |  38 ++
 .../recipes-graphics/xorg-lib/libx11_1.6.9.bb |   1 +
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 scripts/lib/buildstats.py                     |   4 +-
 23 files changed, 919 insertions(+), 35 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-28735.patch
 create mode 100644 meta/recipes-connectivity/ppp/ppp/CVE-2022-4603.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-41717.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3507.patch
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2022-29154.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2022-3555.patch

-- 
2.25.1



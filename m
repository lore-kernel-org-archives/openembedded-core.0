Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EAA2C53210
	for <webhook@archiver.kernel.org>; Sun,  1 Jan 2023 17:42:56 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.16161.1672594966040515092
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jan 2023 09:42:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=G4nJFXlR;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id u4-20020a17090a518400b00223f7eba2c4so26300244pjh.5
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 09:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Iwa1RzyKwDOBV+tWYJ5Gaq2/AAS+51OWeRhhvtQ1zHg=;
        b=G4nJFXlRKcwrj24t8Knw+nOFpYs5CF8Jc4pflGvp0XiSUHbYxjrVKnjaaI1Xb3Zv7j
         Geq7ZhgGfYgBTHBL0jK3wAIJdKpMFRlD+miFzsQG0LIuE6+DdrRxEmZ5ZB34OutrjvkW
         slgL/FDo0Zxcd87T1hrii4MG+FSw+KcvONPhozDcXk/02NogkfdumBtRYwD6F2OL6Rb0
         Ct2DkxWCWeSaUrH6TDFHHfT13jp/+LLzg8BSAWsuuBNN2AGUMsJViK68/lhjqpJl4K19
         2izqEvDnm3rjvkkKq7WP+J+UXQzKM+K1nPOjJ7d1F7O2Lrmu7enpvSXv0UM+tPNj6jWW
         +OOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iwa1RzyKwDOBV+tWYJ5Gaq2/AAS+51OWeRhhvtQ1zHg=;
        b=XbC0jmOpMEhFaAZPH8eKkmOziodi4n7pb4o/vRczU79iND0nKeOimSIE/eQ8RsmOpJ
         3AH6hhT41ULmUZkJOX5nqxUmCTPj/0/67cBPTAKgiXQU7/UwVfTTaJ6NR+Blc6uEkcaG
         8n9NpKNl9TJeMW6OM5elobZkqgfi5/xURqRIBPBEThdYktLSv+/s7RUg/0gyPBrJcF0o
         75fFh6aOjnUru3g6/VO8iuHKURudAuYOE20SsoRXxDHgZhssYaNMoxM3Ao+oPcyYZ9CT
         Sb1YHtbTuEhCUPaZa7DVH42UKLQutejsOCEeocnd4jjLHN9XLMPeUZILOoSfLVKZWCQy
         8+aQ==
X-Gm-Message-State: AFqh2kqnCHmOvaXgVi+x602CdPiL0GUT6czHfd6pdHCeOksqVvAnzH/C
	DxdyqpZB6SuVY5/ptR7pc+n+bORfzFpvtxyZLKM=
X-Google-Smtp-Source: AMrXdXsQUqJtCek8Vvwvv5N8Z7M5nR0ey3IUNNxUx6U/HkXJ25BrHFydoXwkpOIosSVMcxTmv9c28w==
X-Received: by 2002:a17:903:324c:b0:192:ae36:f76c with SMTP id ji12-20020a170903324c00b00192ae36f76cmr9248222plb.62.1672594965105;
        Sun, 01 Jan 2023 09:42:45 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id c4-20020a170902d48400b001894881842dsm18467004plg.151.2023.01.01.09.42.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jan 2023 09:42:44 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/18] Patch review
Date: Sun,  1 Jan 2023 07:42:16 -1000
Message-Id: <cover.1672594796.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jan 2023 17:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175218

Please review this set of patches for dunfell and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4715

The following changes since commit cc8ec63310f9a936371ea1070cb257c926808755:

  oeqa/selftest/tinfoil: Add test for separate config_data with recipe_parse_file() (2022-12-14 16:34:29 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

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



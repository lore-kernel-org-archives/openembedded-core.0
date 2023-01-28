Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39995C38142
	for <webhook@archiver.kernel.org>; Sat, 28 Jan 2023 02:22:33 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.5241.1674872549095521837
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Jan 2023 18:22:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ImFv0eIC;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id g23so6702064plq.12
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Jan 2023 18:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NXTYvckC6WcM0V2AVmGTi4BzGeUSc650Eklcl7Us7hU=;
        b=ImFv0eIC9NE7trcxI4CJ28tJYcLcHThuyR0BKGyb+huUvuFJAkLqNvs75Mz/Zl6OqV
         zaQye2uFxQk/72PXi9qLM1d22F4qLNCgQJLvLpfPyisLtAkMDgyzSxmckbm0FkoKQsc4
         MmfMi70YibEM+uiZtF/gAEhhQkdrtPLbE/vTHRpgpZNjdKG30TL3a8zxoVHf3HeFRhGD
         d92gUix9IY21JOb2MDnEu17o8CyX4pzyzU/50pzU97v/7xB7C+iMrIZgY0c43SfuHrKg
         T1Xce++fAFFMJeLA0Y8RiGgS+e642jD0cNEAYDWIkesgxJXMK/X5F6RmTAZYSoStnq8c
         7Mlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NXTYvckC6WcM0V2AVmGTi4BzGeUSc650Eklcl7Us7hU=;
        b=BJLhF9grCr13KhEnkJI0KCvK6jS36roomKR/D+23fmP/VQxiCxSEfWfo2FuVujHoeD
         0IZzBXYJpNkLPJ1GG3toJhJ9iceJ83TPdi/nTTyhWnDYnelHUd8/il29PXIEVwsBtvF+
         My87Dbf9108tnJeX3YxSEn8QqEaH56SovWKPjzM1sKnMPGwLrLLhA3SIYL+biV1Ia5Ty
         BDlCL7Bk8KGGqooFudaoiV4vTGda4e4GFoGQdagbIeFCdlaAhYPaqn0YuCplbZM8pJDt
         Jx4QIQ5MfDzLXZruaLslLgosTEiUFPVZeCEOVjoJAUhf8RJrb4S3ZELZpStXOgEXnnW7
         MJfA==
X-Gm-Message-State: AO0yUKVC84ekkQo4SerO/KrOwwI1eoZT3jDQvYT6jUC/MsGAFb95HOpX
	KJO8Mkb93espOwTUQqizC3WPvv/KAQJjCu0oJlU=
X-Google-Smtp-Source: AK7set/dqz1NxArF6e2TY6+S59A6SLxYnOdNmOdQHN24GVisiIDN6jcg2+Is1C7FOkKmaLcLnBfxMQ==
X-Received: by 2002:a17:902:f2cb:b0:196:5e71:e50 with SMTP id h11-20020a170902f2cb00b001965e710e50mr2240844plc.23.1674872547839;
        Fri, 27 Jan 2023 18:22:27 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id c2-20020a170903234200b0018958a913a2sm3479217plh.223.2023.01.27.18.22.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 18:22:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/16] Pull request (cover letter only)
Date: Fri, 27 Jan 2023 16:22:22 -1000
Message-Id: <cover.1674872492.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Jan 2023 02:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176457

The following changes since commit db81e3c7e7f1d4d9eba52ac35ac97627d0240b63:

  build-appliance-image: Update to dunfell head revision (2023-01-13 18:11:40 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (2):
  linux-firmware: upgrade 20221109 -> 20221214
  selftest/virgl: use pkg-config from the host

Benoît Mauduit (1):
  lib/oe/reproducible: Use git log without gpg signature

Bhabu Bindu (1):
  ffmpeg: Fix CVE-2022-3109

Hitendra Prajapati (2):
  QEMU: CVE-2022-4144 QXL: qxl_phys2virt unsafe address translation can
    lead to out-of-bounds read
  xserver-xorg: Fix Multiple CVEs

Jan Kircher (1):
  toolchain-scripts: compatibility with unbound variable protection

Jermain Horsman (1):
  cve-check: write the cve manifest to IMGDEPLOYDIR

Marta Rybczynska (1):
  cve-update-db-native: avoid incomplete updates

Niko Mauno (1):
  systemd: Consider PACKAGECONFIG in RRECOMMENDS

Quentin Schulz (1):
  cairo: fix CVE patches assigned wrong CVE number

Randy MacLeod (1):
  vim: upgrade 9.0.0947 -> 9.0.1211

Ross Burton (2):
  cve-update-db-native: add more logging when fetching
  cve-update-db-native: show IP on failure

Steve Sakoman (1):
  python3: fix packaging of Windows distutils installer stubs

jan (1):
  cve-update-db-native: Allow to overrule the URL in a bbappend.

 meta/classes/cve-check.bbclass                |   6 +-
 meta/classes/toolchain-scripts.bbclass        |   2 +-
 meta/lib/oe/reproducible.py                   |   3 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py  |   2 +-
 .../recipes-core/meta/cve-update-db-native.bb |  97 ++++++++++++-----
 meta/recipes-core/systemd/systemd_244.5.bb    |   4 +-
 .../python/python3/python3-manifest.json      |   4 +-
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2022-4144.patch             | 103 ++++++++++++++++++
 .../cairo/cairo/CVE-2019-6461.patch           |  46 +++-----
 .../cairo/cairo/CVE-2019-6462.patch           |  46 +++++---
 .../xserver-xorg/CVE-2022-4283.patch          |  39 +++++++
 .../xserver-xorg/CVE-2022-46340.patch         |  55 ++++++++++
 .../xserver-xorg/CVE-2022-46341.patch         |  86 +++++++++++++++
 .../xserver-xorg/CVE-2022-46342.patch         |  78 +++++++++++++
 .../xserver-xorg/CVE-2022-46343.patch         |  51 +++++++++
 .../xserver-xorg/CVE-2022-46344.patch         |  75 +++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.14.bb      |   8 +-
 ...20221109.bb => linux-firmware_20221214.bb} |   4 +-
 .../ffmpeg/ffmpeg/CVE-2022-3109.patch         |  41 +++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb |   1 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 22 files changed, 670 insertions(+), 86 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-4283.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46340.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46341.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46342.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46343.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-46344.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20221109.bb => linux-firmware_20221214.bb} (99%)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2022-3109.patch

-- 
2.25.1



Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F2EC43334
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:35:18 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web09.22257.1655667315895356881
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=IIIJWVNR;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id f18so3140379pfq.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fm6OA1zLl3QykGT3YMr0y9h7ojVOti4NY7EaoJE/nxs=;
        b=IIIJWVNR1NAIvJdQQ+M7DH/q0+7XrvjkPVXDY3jDo1AzC9SKSgKoICionJ6tY76iKG
         tJYspEdX3Zfsl/As/IXTg1+P0c9HjU0dFlZ5rt+1eTsiZ1zZ3ksgoPbW1pYNqQb1a/F1
         YCCLp55hUhi/aowH76DsCdc6VC2WEOynYMD0wMrP2kkqirSteGgTn3OD65fxi6Dwspxi
         chXurzo+dIC31QAB/erMo3GnwpgE8ALi5DMQEZARAvPQN2FIET2qtsy5uF9Crwh3X5HU
         CCe2u3pn0IRo+AX08fanL3vmmWCwqdDvjDXOawpz7G3iAiAxifQ0Igzy53/1Ak4Z6wdM
         +NgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fm6OA1zLl3QykGT3YMr0y9h7ojVOti4NY7EaoJE/nxs=;
        b=Fm+onbXxD8IjMKsXcnGXZmyOTOx2/JKj3PuS3qZU/HTpfUYanDiYLmIT1w76Yya2zn
         IS2pAXMxlVqTIn3Lgwo7VT3FYoi3R4tD8V1q9RlydTRQzB/4elq1V7c4CltTfDNQDpVj
         Iohm2U9Sy9OzVgXoMWy07l+5R7xxqFHpy8UeSj2k4YVQt+XwZf6+1Udu/O7Bgw0kXmae
         Zic988y6fVqehhbAsLoD7EQT8rUx5OQ1MxbsSTAnj6uJLrqjTkprRZqQgCWBJEBBkFZO
         thsGTNDIgE5a7pVtWjpSikotUEzBl0I28gdFujPTdhLPtsLmldEcB2vUBfFsTNwvRgrV
         cZyQ==
X-Gm-Message-State: AJIora/KIfOZDjqbh+ywQdlBipVwHEQIznfeF67xdfgdtS+hocHWG6YE
	5ygGd6bcOv8Axhgv4QqDgdMvWvIJLCuWH9Bx
X-Google-Smtp-Source: 
 AGRyM1utPLFvSMVScd94PcZXzO2QekLMhKTedp8+Lb98q4tuDunB8HrcEyhLZfH5zCvtLXdIl4IxqQ==
X-Received: by 2002:a63:206:0:b0:408:a75e:3400 with SMTP id
 6-20020a630206000000b00408a75e3400mr18377391pgc.29.1655667314907;
        Sun, 19 Jun 2022 12:35:14 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 e5-20020a170902ed8500b001678dcb4c5asm216994plj.100.2022.06.19.12.35.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:35:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/12] Patch review
Date: Sun, 19 Jun 2022 09:34:54 -1000
Message-Id: <cover.1655667170.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 19:35:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167062

Please review this set of patches for dunfell and have comments back by end
of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3790

The following changes since commit 7e056e79a5acce8261cb5124c172cc40ad608b82:

  linux-yocto/5.4: update to v5.4.196 (2022-06-07 08:56:30 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Jose Quaresma (2):
  archiver: use bb.note instead of echo
  archiver: don't use machine variables in shared recipes

Marcel Ziswiler (1):
  alsa-plugins: fix libavtp vs. avtp packageconfig

Martin Jansa (1):
  rootfs.py: close kernel_abi_ver_file

Mingli Yu (1):
  oescripts: change compare logic in OEListPackageconfigTests

Pawan Badganchi (1):
  openssh: Whitelist CVE-2021-36368

Peter Kjellerstedt (1):
  license.bbclass: Bound beginline and endline in copy_license_files()

Rasmus Villemoes (1):
  e2fsprogs: add alternatives handling of lsattr as well

Richard Purdie (2):
  vim: Upgrade 8.2.5034 -> 8.2.5083
  gcc-source: Fix incorrect task dependencies from ${B}

Stefan Wiehler (1):
  kernel-yocto.bbclass: Reset to exiting on non-zero return code at end
    of task

Steve Sakoman (1):
  cups: fix CVE-2022-26691

 meta/classes/archiver.bbclass                 | 11 +++++--
 meta/classes/kernel-yocto.bbclass             |  8 +++++
 meta/classes/license.bbclass                  |  8 ++---
 meta/lib/oe/rootfs.py                         |  4 ++-
 meta/lib/oeqa/selftest/cases/oescripts.py     |  3 +-
 .../openssh/openssh_8.2p1.bb                  |  7 ++++
 .../e2fsprogs/e2fsprogs_1.45.7.bb             |  5 ++-
 meta/recipes-devtools/gcc/gcc-common.inc      |  2 +-
 meta/recipes-devtools/gcc/gcc-source.inc      |  1 +
 meta/recipes-extended/cups/cups.inc           |  3 +-
 .../cups/cups/CVE-2022-26691.patch            | 33 +++++++++++++++++++
 .../alsa/alsa-plugins_1.2.1.bb                |  2 +-
 meta/recipes-support/vim/vim.inc              |  4 +--
 13 files changed, 76 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2022-26691.patch

-- 
2.25.1



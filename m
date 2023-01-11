Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE3CDC63797
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 14:34:50 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.25206.1673447681730516838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 06:34:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=j5wSUIex;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id p24so16940998plw.11
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 06:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/YLgPFuqXEqQn+Sn50mCquA1i49NBYCqV8Bz3g4qHBs=;
        b=j5wSUIexp2WC/AyamUqzIcE1GCV8Z2WyjZcXGC4NOOibHVwAIRA7ssRjTQYetjIgyF
         YuyUoToqap1tgZgBQKyRz2M94X7qfmrOmStWzh18t2cdrXcLh+9vFmgR5fWLuixJ47Tt
         /R+hOvKr9KkQNdi7eELkYlqXUyHMJF8ju8ll8gLsHTse98vEQW9Jmhnj7f4+HgcCWsJa
         gM8VzSFr2aMlnn985xOHdJzLMUhH0eBXJZr3UY9rvMfgWCSg+X0zAajhHLG+9kcfWsKy
         aGq82pCVpuw4bodJE+yHaQQ8UQ8mx+kGuThaxQHwny93hwX6WoPdrhUtZkrg1CLl/Sj6
         Ct6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/YLgPFuqXEqQn+Sn50mCquA1i49NBYCqV8Bz3g4qHBs=;
        b=vEpSugJeWktftEINKa70prz72Rk+rfmaE1IamlrOcHQEyBxSppAgkk0UmJKOUpbvZJ
         dvEbiWHZgMLDm6Jt+OAhkipsPbUT/7/IhHgsXZXb4mW+B6Ln3tPyUI1fGE0vUaoFB70J
         BCKGRiW87+5+XZ9+ErJ8OA9rjlkRTgPsXaZQw9KJP7KHn0pIpHbokuTXIv8EEAZoodzB
         5BzCzn2yDCClTORwWGF7LSJOwNEGsHZGHW/bj/50nd7AQtbTx/gVeJdRvjvQzRgKuOLz
         W04uzywHRbdZkWhnGdKoRQCNn4foynHOQdSutWnJ9Du2tGtBqhQl6ibtnrhJBKi6YLS8
         QvQw==
X-Gm-Message-State: AFqh2kqEatumxnAIHEaVR/YhsUbeU3yyIb3kXIx7IoiBCSIhh0Jt1WQq
	eyz5Wuv/UXVZ/4MzpoPkabBZt70l28wmaGFrgN4=
X-Google-Smtp-Source: AMrXdXs1xTwK+W2CW7bCYq8t+WLo8If/JTZbs8HlG9RjMPnWmaOx1tU8b1IY/tOmTn2Dxn1Dw51jag==
X-Received: by 2002:a05:6a20:65a2:b0:b6:8c6:5e70 with SMTP id p34-20020a056a2065a200b000b608c65e70mr6365275pzh.12.1673447680546;
        Wed, 11 Jan 2023 06:34:40 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id y29-20020aa793dd000000b0056c2e497b02sm10381288pff.173.2023.01.11.06.34.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 06:34:40 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/8] Patch review
Date: Wed, 11 Jan 2023 04:34:22 -1000
Message-Id: <cover.1673447528.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 14:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175741

Please review this set of patches for dunfell and have comments back
by end of day Friday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4774

The following changes since commit deb919a693e4371ace649680ca06ca6b6e3da4e2:

  lib/buildstats: fix parsing of trees with reduced_proc_pressure directories (2023-01-06 17:34:50 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Changqing Li (1):
  base.bbclass: Fix way to check ccache path

Chee Yang Lee (1):
  libksba: fix CVE-2022-47629

Hitendra Prajapati (1):
  grub2: Fix CVE-2022-2601 & CVE-2022-3775

Luis (1):
  rm_work.bbclass: use HOSTTOOLS 'rm' binary exclusively

Pavel Zhukov (1):
  oeqa/rpm.py: Increase timeout and add debug output

Steve Sakoman (3):
  ovmf: fix gcc12 warning in GenFfs
  ovmf: fix gcc12 warning in LzmaEnc
  ovmf: fix gcc12 warning for device path handling

 meta/classes/base.bbclass                     |   2 +-
 meta/classes/rm_work.bbclass                  |  15 ++-
 meta/lib/oeqa/runtime/cases/rpm.py            |  23 ++--
 .../grub/files/CVE-2022-2601.patch            |  87 +++++++++++++
 .../grub/files/CVE-2022-3775.patch            |  97 +++++++++++++++
 ...erflow-in-grub_font_get_glyph_intern.patch | 117 ++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |   3 +
 ...1-Basetools-genffs-fix-gcc12-warning.patch |  49 ++++++++
 ...-Basetools-lzmaenc-fix-gcc12-warning.patch |  53 ++++++++
 ...001-Basetools-turn-off-gcc12-warning.patch |  41 ++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |   3 +
 .../libksba/libksba/CVE-2022-47629.patch      |  69 +++++++++++
 meta/recipes-support/libksba/libksba_1.3.5.bb |   4 +-
 13 files changed, 545 insertions(+), 18 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-2601.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-3775.patch
 create mode 100644 meta/recipes-bsp/grub/files/font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-Basetools-genffs-fix-gcc12-warning.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-Basetools-lzmaenc-fix-gcc12-warning.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-Basetools-turn-off-gcc12-warning.patch
 create mode 100644 meta/recipes-support/libksba/libksba/CVE-2022-47629.patch

-- 
2.25.1



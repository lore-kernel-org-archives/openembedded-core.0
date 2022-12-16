Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A329C4167B
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 14:58:05 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.15109.1671202679878485511
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Dec 2022 06:58:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=W1wNpT7b;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id w23so2522035ply.12
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 06:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NwC+IuWHRhF/2/w5qeR9d4HH5nY5/DMiXgG1Bq31xIs=;
        b=W1wNpT7b0L97OIcWiMtJOdn+/c6plDhgMk3x3d/bO7bgrYMrItTby6aL2gNjO+lO3P
         dWNTmtQPpYNG62T4xyvmxpP3GxR7DnJ8Ta4NJUSpcE26W87u89Uc5g/Bal4/xFa1MGTx
         tbbs6+M/AyxkyOTTdrB4ew7EC8atZUyU1/bNOeq1GlhFo76BppRukdwbJ2uw3iiuuJjm
         /UMpx+r5Y+ie/8IsUb02XDLnNSjGgcRELf6I/tsaQJN8x+2Mj3L4RlYEgODKzYK1ZqUS
         hOb9bZZRODrtQlXYpE0f7RLP9/mBsekpdRkif4F9XqbjWtcibBlsIwskV9DKkivIgZj7
         cvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NwC+IuWHRhF/2/w5qeR9d4HH5nY5/DMiXgG1Bq31xIs=;
        b=fe69vb7i9vsbHagMhteNCgdvywIYQB3nsbt3YEb9NuQg71/IEJJND+FMRoh48DmSVw
         Uo5NNIql39UnHPZHCnmY2cq9zbkcYxoIaGX9ZbOQkHdUbTvFw6yxttgkfinNM3N6fIW+
         qrUOm1NWsMPfj3+2heDCdA7L6VsN3VMEk1TSlEjdSZjXH4hPGQSALcFqe49Yl1YuTaoe
         U4DWHfRXXBo2X/yf9f6V8ZdWszpeOLfZN1eCWmvKQYI2nUCxuvykkTxWrCAwI7YeSwwO
         t/7uZ9YQxMM7tCYgRFtpldvsc0+XD0FOnuvdjrCib9hX24hrDYUCw4UtPgO9iOO+tQyX
         HX7A==
X-Gm-Message-State: ANoB5pnBexF7W9XEqbUQavYTtGpRRw8bWCudvn43X79vIYvRE/dBP4gt
	C18KQfYOLRCY8h5nZexE/arlwt9qIViOfIjizYA=
X-Google-Smtp-Source: AA0mqf7Oy3VNoXvCNwoJVx2cGpZ8HwYuhXwCWlnCbrertyStWQXmY765GLVJ8qMoGKzfXa9+wycC7g==
X-Received: by 2002:a17:90a:b891:b0:21d:5e73:d562 with SMTP id o17-20020a17090ab89100b0021d5e73d562mr31911028pjr.27.1671202678397;
        Fri, 16 Dec 2022 06:57:58 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r21-20020a17090b051500b00219eefe47c7sm1482230pjz.47.2022.12.16.06.57.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 06:57:57 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/13] Patch review
Date: Fri, 16 Dec 2022 04:57:39 -1000
Message-Id: <cover.1671202568.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 14:58:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174744

Please review this set of patches for dunfell and have comments back
by end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4633

The following changes since commit e44f0cda8176186d42a752631810c1cb5f1971eb:

  kernel.bbclass: make KERNEL_DEBUG_TIMESTAMPS work at rebuild (2022-12-06 07:52:17 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexey Smirnov (1):
  classes: make TOOLCHAIN more permissive for kernel

Chen Qi (1):
  psplash: consider the situation of psplash not exist for systemd

Harald Seiler (1):
  opkg: Set correct info_dir and status_file in opkg.conf

Hitendra Prajapati (3):
  libarchive: CVE-2022-36227 NULL pointer dereference in archive_write.c
  sysstat: fix CVE-2022-39377
  golang: CVE-2022-41715 regexp/syntax: limit memory used by parsing
    regexps

Lee Chee Yang (1):
  dropbear: fix CVE-2021-36369

Mathieu Dubois-Briand (1):
  curl: Fix CVE CVE-2022-35260

Minjae Kim (1):
  xserver-xorg: backport fixes for CVE-2022-3550, CVE-2022-3551 and
    CVE-2022-3553

Pawan Badganchi (1):
  python3: Fix CVE-2022-37454

Qiu, Zheng (1):
  vim: upgrade 9.0.0820 -> 9.0.0947

Richard Purdie (1):
  oeqa/selftest/tinfoil: Add test for separate config_data with
    recipe_parse_file()

Riyaz Khan (1):
  rpm: Fix rpm CVE CVE-2021-3521

 meta/classes/kernel-arch.bbclass              |   2 +-
 meta/lib/oeqa/selftest/cases/tinfoil.py       |  14 +
 meta/recipes-core/dropbear/dropbear.inc       |   1 +
 .../dropbear/dropbear/CVE-2021-36369.patch    | 145 ++++++++
 .../psplash/files/psplash-start.service       |   1 +
 .../psplash/files/psplash-systemd.service     |   1 +
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2022-41715.patch           | 271 ++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.4.2.bb      |   4 +-
 .../python/python3/CVE-2022-37454.patch       | 105 ++++++
 .../recipes-devtools/python/python3_3.8.14.bb |   1 +
 .../rpm/files/CVE-2021-3521-01.patch          |  60 ++++
 .../rpm/files/CVE-2021-3521-02.patch          |  55 +++
 .../rpm/files/CVE-2021-3521-03.patch          |  34 ++
 .../rpm/files/CVE-2021-3521.patch             | 330 ++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.14.2.1.bb     |   4 +
 .../libarchive/CVE-2022-36227.patch           |  43 +++
 .../libarchive/libarchive_3.4.2.bb            |   1 +
 .../sysstat/sysstat/CVE-2022-39377.patch      |  92 +++++
 .../sysstat/sysstat_12.2.1.bb                 |   4 +-
 .../xserver-xorg/CVE-2022-3550.patch          |  40 +++
 .../xserver-xorg/CVE-2022-3551.patch          |  64 ++++
 .../xserver-xorg/CVE-2022-3553.patch          |  49 +++
 .../xorg-xserver/xserver-xorg_1.20.14.bb      |   3 +
 .../curl/curl/CVE-2022-35260.patch            |  68 ++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   1 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 27 files changed, 1393 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2021-36369.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-41715.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2022-37454.patch
 create mode 100644 meta/recipes-devtools/rpm/files/CVE-2021-3521-01.patch
 create mode 100644 meta/recipes-devtools/rpm/files/CVE-2021-3521-02.patch
 create mode 100644 meta/recipes-devtools/rpm/files/CVE-2021-3521-03.patch
 create mode 100644 meta/recipes-devtools/rpm/files/CVE-2021-3521.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2022-36227.patch
 create mode 100644 meta/recipes-extended/sysstat/sysstat/CVE-2022-39377.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3550.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3551.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3553.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-35260.patch

-- 
2.25.1



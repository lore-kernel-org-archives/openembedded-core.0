Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C57DEC433EF
	for <webhook@archiver.kernel.org>; Sun, 27 Mar 2022 16:41:12 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web12.738.1648399271596833106
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Mar 2022 09:41:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=NA+nSiq+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id s8so10509403pfk.12
        for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Mar 2022 09:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UNWjeBtjtF9GMYnWxbAuw7zTvnLzci0RYHFZ4EdVjHc=;
        b=NA+nSiq+YjDImpHMCCkZF0chx8dhGY4gisV4z0Ya1CX+lNW1WjhRON2t69CJ4IscIF
         dghSvnZw/QGh7ND0OuH5+fwXDrViGf/Z0mzGEWDKtbkwp0peXU3aICQlwIsg5uf3VvN+
         MqLPebHs51RSCviJ110FVFkIaIlpdqFDxsdPbv/ozNYsOqQ6ALMQoLGQaqVfQwoaYoUE
         no87NIWUJ0FwSv0giVgaGEvmpIR/eHnOuf1HbEp2Q6lpoOpm+IA/CHUUcseqagEP4qZV
         mhCS/N8J1oWc/QQT6DNQss1fB06JxEgSC/WDYxS2ET9hDfsyK198agj5mR12u5NMoior
         p3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UNWjeBtjtF9GMYnWxbAuw7zTvnLzci0RYHFZ4EdVjHc=;
        b=k/K0CY6PdHsAu0+tl5JNbNyxivkPxkQfdWVwr8c0ZLFw6WzufilQJkOQwmWhRnfxuN
         Taan01T9nu5MSEemJ4PR8TBbvtUY0noxP9muTCTWiLN3SjUquMY1T206cRJVsW6xtD7G
         J/+Wcsq7scc/q8WdMz93fyBgVTfaWtChjzlBV7C7hLnGcWJcMaS9h/XcVsWMzFUgzD9l
         le44OSmIzRkQgFULx9YZFPZp0mYRAoD9dXglirdQNcZ6nJ807cehSTT4zQATQAoL4/+U
         A0pXed/bKo1LKxFgrHtfIAGEvM/SnOB8NDGm6HBZuiP6Y0HxsCcuIIcYMutXcK5bYY1/
         3k2g==
X-Gm-Message-State: AOAM5339wiItkzujewQoUvhIaW73Gwv6rvLBoc9WjK1r+0P+Ic3cYa5J
	4mMwL8dvQx+PSKdEQTS2x6Tz584QxUdIMBX6fjc=
X-Google-Smtp-Source: 
 ABdhPJxlYjbeSOYUOke0ZI9BAydacyHXvGxlhzK2S/7NTn5/AhEmw1k0HlgfvhLlCCGuFJqlgWoKHw==
X-Received: by 2002:a05:6a00:1a4a:b0:4f7:be32:3184 with SMTP id
 h10-20020a056a001a4a00b004f7be323184mr19633501pfv.65.1648399270475;
        Sun, 27 Mar 2022 09:41:10 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h13-20020a056a00230d00b004f427ffd485sm14583732pfh.143.2022.03.27.09.41.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Mar 2022 09:41:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/10] Patch review
Date: Sun, 27 Mar 2022 06:40:50 -1000
Message-Id: <cover.1648399113.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Mar 2022 16:41:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163666

Please review this set of patches for dunfell and have comments back by end of
day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3433

The following changes since commit 71015408c60ddf2e9af00cc8574815971e1b689d:

  oeqa/selftest/tinfoil: Improve tinfoil event test debugging (2022-03-21 04:17:02 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Davide Gardenal (3):
  qemu: backport patch fix for CVE-2020-13791
  apt: backport patch fix for CVE-2020-3810
  ghostscript: backport patch fix for CVE-2021-3781

Minjae Kim (2):
  gnu-config: update SRC_URI
  virglrenderer: update SRC_URI

Ralph Siemsen (1):
  libxml2: fix CVE-2022-23308 regression

Richard Purdie (1):
  oeqa/selftest/tinfoil: Fix intermittent event loss issue in test

Ross Burton (1):
  python3: ignore CVE-2022-26488

Steve Sakoman (2):
  libsolv: fix CVE: CVE-2021-44568-71 and CVE-2021-44573-77
  ghostscript: fix CVE-2020-15900 and CVE-2021-45949 for -native

 meta/lib/oeqa/selftest/cases/tinfoil.py       |   2 +-
 .../CVE-2022-23308-fix-regression.patch       |  98 ++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |   1 +
 meta/recipes-devtools/apt/apt.inc             |   1 +
 .../apt/apt/CVE-2020-3810.patch               | 174 +++++++++++++
 .../gnu-config/gnu-config_git.bb              |   2 +-
 .../recipes-devtools/python/python3_3.8.13.bb |   2 +-
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2020-13791.patch            |  44 ++++
 .../ghostscript/CVE-2021-3781_1.patch         | 121 +++++++++
 .../ghostscript/CVE-2021-3781_2.patch         |  37 +++
 .../ghostscript/CVE-2021-3781_3.patch         | 238 ++++++++++++++++++
 .../ghostscript/ghostscript_9.52.bb           |   9 +-
 .../libsolv/files/CVE-2021-3200.patch         |  10 +
 .../virglrenderer/virglrenderer_0.8.2.bb      |   2 +-
 15 files changed, 735 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-23308-fix-regression.patch
 create mode 100644 meta/recipes-devtools/apt/apt/CVE-2020-3810.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2021-3781_1.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2021-3781_2.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2021-3781_3.patch

-- 
2.25.1



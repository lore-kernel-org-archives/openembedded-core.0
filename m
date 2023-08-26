Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A56C83F15
	for <webhook@archiver.kernel.org>; Sat, 26 Aug 2023 15:39:07 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.10477.1693064337972752876
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Aug 2023 08:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Y9RzIhCz;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.179, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3a8506f5b73so1352305b6e.0
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 08:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1693064337; x=1693669137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=L4KwXG05xqeGiQbz/aJmUFR9tF4dy9x1EW/AdFkwiQQ=;
        b=Y9RzIhCzBnFNCU67n2AvC98YPSLGVk9wJVNXk3+v8ySnA7MkdFMMbHw4X+uhlPpFvB
         VgOCRz6Cvo8sWeslZRgLIgj7W8ChhKIarCU4cQAr08BsE2LIoSm/nqz37uFPA0dGI5Ha
         T994GqcQjUm5Gg0NJ+6sX52XNTv+aTU3puelW7jb33NTwv7tUHmxqAZT5nrdsUYMB16S
         Aww+3u2F7yvBOK4rSsPodMCtYR6UKdjNrKO7UbBPNp1l9TVZ46DCgeu1r2UkNQMc89ZY
         sMzXV9SZWTH2PMeqjOnhSYqdp9r0KWbAkC9kZ8PX+CzJPKGQ0PZDtO1hT69c4T4xjtdy
         UM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693064337; x=1693669137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L4KwXG05xqeGiQbz/aJmUFR9tF4dy9x1EW/AdFkwiQQ=;
        b=G+azhANsIsL6qOee0tep0hNqe0576LosjI9ynidTFgZoQoYlp29uXh0V79o4Iko7XV
         PFl8vZLRrobjtRaWzBjQr4S7M/3/Ewirb9tkBCTr8z0pBeNhUA3dN1h8y8YZt+W493Nk
         FHALjXQHHwPHOR5M3uBqRIbhz9AHx2ylj4P/CfwEsXZpGeexeLrNwTJE62s/T3/6KxDM
         OsUg0b3F+bGsE7dpuAwK+otCm+J8ploC4wpRBe/myERlxygV9sMdDstfhc/xHi8ahvMT
         w/MB3gOcOnywCDlJm+Jza8lB1Xl6DWNnUJXajOG/6K/qyTSzrhKXI2yl3M2YJCKsGVhr
         XAYQ==
X-Gm-Message-State: AOJu0YyRx46zpzwo5TFmpK5IZbp3E30wfoQC6Zsf+ObnrO5leogAIHO6
	6lE8si1/+EIXuE2gpkTubYkY84aUz9sYXrrtDCc=
X-Google-Smtp-Source: AGHT+IG6q3Tj3b6krsLlSdvw5oWgkFys3xaMIK7FhdTrOcRZ1R7Q3ri2DMNcvHBrL5BAT13a43tYxA==
X-Received: by 2002:aca:210d:0:b0:3a7:1962:d7ff with SMTP id 13-20020aca210d000000b003a71962d7ffmr5632126oiz.57.1693064336740;
        Sat, 26 Aug 2023 08:38:56 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g25-20020aa78759000000b006732786b5f1sm3422430pfo.213.2023.08.26.08.38.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 08:38:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 00/20] Patch review
Date: Sat, 26 Aug 2023 05:38:31 -1000
Message-Id: <cover.1693064194.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 15:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186744

Please review this set of changes for mickledore and have comments back by
end of day Tuesday, August 29.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5786

The following changes since commit 7e3489c0c5970389c8a239dc7b367bcadf554eb5:

  build-appliance-image: Update to mickledore head revision (2023-08-18 03:58:04 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/mickledore-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/mickledore-nut

Alexis Lothoré (1):
  oeqa/utils/gitarchive: fix tag computation when creating archive

Chee Yang Lee (3):
  curl: fix CVE-2023-32001
  ghostscript: fix CVE-2023-38559
  librsvg: upgrade to 2.54.6

Markus Volk (1):
  gtk4: upgrade 4.10.4 -> 4.10.5

Michael Halstead (2):
  yocto-uninative: Update hashes for uninative 4.1
  yocto-uninative: Update to 4.2 for glibc 2.38

Michael Opdenacker (1):
  scripts/create-pull-request: update URLs to git repositories

Narpat Mali (2):
  ffmpeg: add CVE_CHECK_IGNORE for CVE-2023-39018
  python3-git: upgrade 3.1.31 -> 3.1.32

Peter Marko (1):
  openssl: Upgrade 3.1.1 -> 3.1.2

Peter Suti (1):
  externalsrc: fix dependency chain issues

Richard Purdie (4):
  pseudo: Fix to work with glibc 2.38
  lib/package_manager: Improve repo artefact filtering
  gnupg: Fix reproducibility failure
  resulttool/report: Avoid divide by zero

Ross Burton (2):
  linux-yocto: add script to generate kernel CVE_CHECK_IGNORE entries
  linux/cve-exclusion: add generated CVE_CHECK_IGNOREs

Wang Mingyu (1):
  file: upgrade 5.44 -> 5.45

sanjana (1):
  glibc: stable 2.37 branch updates

 meta/classes/externalsrc.bbclass              |    7 +-
 meta/conf/distro/include/yocto-uninative.inc  |   10 +-
 meta/lib/oe/package_manager/__init__.py       |    5 +-
 meta/lib/oeqa/utils/gitarchive.py             |    6 +-
 .../{openssl_3.1.1.bb => openssl_3.1.2.bb}    |    2 +-
 meta/recipes-core/glibc/glibc-version.inc     |    2 +-
 .../file/{file_5.44.bb => file_5.45.bb}       |    2 +-
 .../pseudo/files/glibc238.patch               |   72 +
 meta/recipes-devtools/pseudo/pseudo_git.bb    |    1 +
 ...n3-git_3.1.31.bb => python3-git_3.1.32.bb} |    2 +-
 .../ghostscript/CVE-2023-38559.patch          |   31 +
 .../ghostscript/ghostscript_10.0.0.bb         |    1 +
 .../gtk+/{gtk4_4.10.4.bb => gtk4_4.10.5.bb}   |    2 +-
 .../{librsvg_2.54.5.bb => librsvg_2.54.6.bb}  |    2 +-
 .../linux/cve-exclusion_6.1.inc               | 7250 ++++++++++++++++-
 .../linux/generate-cve-exclusions.py          |  101 +
 .../recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb |    6 +
 .../curl/curl/CVE-2023-32001.patch            |   39 +
 meta/recipes-support/curl/curl_8.0.1.bb       |    1 +
 meta/recipes-support/gnupg/gnupg_2.4.2.bb     |    2 +
 scripts/create-pull-request                   |    7 +-
 scripts/lib/resulttool/report.py              |    5 +-
 22 files changed, 7502 insertions(+), 54 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.1.1.bb => openssl_3.1.2.bb} (99%)
 rename meta/recipes-devtools/file/{file_5.44.bb => file_5.45.bb} (97%)
 create mode 100644 meta/recipes-devtools/pseudo/files/glibc238.patch
 rename meta/recipes-devtools/python/{python3-git_3.1.31.bb => python3-git_3.1.32.bb} (92%)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2023-38559.patch
 rename meta/recipes-gnome/gtk+/{gtk4_4.10.4.bb => gtk4_4.10.5.bb} (98%)
 rename meta/recipes-gnome/librsvg/{librsvg_2.54.5.bb => librsvg_2.54.6.bb} (97%)
 create mode 100755 meta/recipes-kernel/linux/generate-cve-exclusions.py
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-32001.patch

-- 
2.34.1



Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25223C001DB
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 21:18:39 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.93994.1691961516838948704
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 14:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=MJd4TdP6;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-26b2beae166so1048687a91.0
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 14:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691961516; x=1692566316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+w571lg0hSDDOg4cCugvtGWnzI3ScDy7VoLXGNRIMOQ=;
        b=MJd4TdP6yuHG8vItkjeBi95yjQmeMBJav5QoKCwL04AWHnTeDWapwu6AVzq4r5VPRs
         xqGU3b4XkZ0DMZRv1bTW3eWnOpnl7uetOMpdmVkgA0gUEcv3TTOsmvIda3mh5Qok2B+m
         LTv1ztxcJptByGBknWPs5hHIQRLHldB/OqKvCxRDfWSGOEV8LZQBNr1xKuCu+wdoJ5VA
         jKxKfbNWz5+gacUhp3eBouW5dGCV9zfXavN1oqM54+xK9PncDFiU6nsDPYkLGspXmcfi
         s3yKXVF1AR8VKRQQ3nHMwLdvxpKbNPZlpZVamXJwr7DnEVzOBMT52uhnCYeSn2QmUS80
         x4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691961516; x=1692566316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+w571lg0hSDDOg4cCugvtGWnzI3ScDy7VoLXGNRIMOQ=;
        b=gU1HnQuB0E+Btnn4lFiqoDvzS49f8RkC952k9qkuwBp9vVDGRpIJ4pyDBJ9Db94wh2
         rsqUxXDOYZmD81LqKuJf5tU4nr0DHDdQjlLMRaKiLzoFxHzrN306iWjb7XsA6yPmIgpp
         3MKFLnP/r8fOnSZCX6kQURMWTEIWQz8glP02f6nLLO1BxObZv9C8qjeJBGfKWjXQAyAI
         +05HjRV5bpEq/HLyi5KMQ4B/ZNoAqOO92geAIMu4GfVOqrnk/WcF3H9E0ke42ztzYbl7
         v/9e6dpFtMeuP0vESLnSW8rD7t1g/9GfkHVUeYlf1obpHeYmcwZahu5C5UnPLep1HECQ
         ezKQ==
X-Gm-Message-State: AOJu0YzrRrrYiquA2ccQaeLW8XX+404tMZkmZXeZf+2T5mA24svPkDzo
	5dTbT3dIq5IVMs2RAN6Ncu69W3fTSlR31BtcUvm4Zg==
X-Google-Smtp-Source: AGHT+IF5QyE8y+P22G1SApcoWvpw98q+Dx2Di55dPTTSaSHNzEFLyY+GTCJVqCDc6oxvxEapptaDlw==
X-Received: by 2002:a17:90a:aa18:b0:263:1f1c:ef4d with SMTP id k24-20020a17090aaa1800b002631f1cef4dmr5515536pjq.10.1691961515579;
        Sun, 13 Aug 2023 14:18:35 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id qa2-20020a17090b4fc200b00263dfe9b972sm8690578pjb.0.2023.08.13.14.18.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 14:18:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/22] Patch review
Date: Sun, 13 Aug 2023 11:18:06 -1000
Message-Id: <cover.1691961051.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 21:18:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185891

Please review this set of changes for dunfell and have comments back by
end of day Tuesday, August 15.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5730

with the exception of qemuppc-alt, which failed due to out of disk space errors
on the debian-11-ty-1 worker:

https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/4969

The qemuppc-alt build passed on subsequent re-test on a worker without disk space issues:

https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/4972

The following changes since commit 6dd64ca2d726d0b222a7608c65eb0a20454c3f99:

  build-appliance-image: Update to dunfell head revision (2023-08-04 05:41:08 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Abdellatif El Khlifi (1):
  kernel: skip installing fitImage when using Initramfs bundles

Bruce Ashfield (3):
  linux-yocto/5.4: update to v5.4.249
  linux-yocto/5.4: update to v5.4.250
  linux-yocto/5.4: update to v5.4.251

Dhairya Nagodra (2):
  dmidecode 3.2: Fix CVE-2023-30630
  harfbuzz: Resolve backported commit bug.

Emily Vekariya (1):
  qemu: CVE-ID correction for CVE-2020-35505

Hitendra Prajapati (3):
  ruby/cgi-gem: CVE-2021-33621 HTTP response splitting in CGI
  tiff: fix multiple CVEs
  tiff: fix multiple CVEs

Marek Vasut (1):
  linux-firmware: Fix mediatek mt7601u firmware path

Peter Marko (6):
  python3: ignore CVE-2023-36632
  libjpeg-turbo: patch CVE-2023-2804
  libarchive: ignore CVE-2023-30571
  libpcre2: patch CVE-2022-41409
  procps: patch CVE-2023-4016
  openssl: Upgrade 1.1.1t -> 1.1.1v

Vijay Anusuri (1):
  ghostscript: backport fix for CVE-2023-38559

Vivek Kumbhar (2):
  go: fix CVE-2023-29406 net/http: insufficient sanitization of Host
    header
  qemu:fix CVE-2023-3354 VNC: improper I/O watch removal in TLS
    handshake can lead to remote unauthenticated denial of service

Yuta Hayama (2):
  cve-update-nvd2-native: always pass str for json.loads()
  systemd-systemctl: fix errors in instance name expansion

 meta/classes/kernel.bbclass                   |  20 +-
 ...1-Configure-do-not-tweak-mips-cflags.patch |  37 +++
 .../openssl/openssl/CVE-2023-0464.patch       | 226 -----------------
 .../openssl/openssl/CVE-2023-0465.patch       |  60 -----
 .../openssl/openssl/CVE-2023-0466.patch       |  82 ------
 .../openssl/openssl/CVE-2023-2650.patch       | 122 ---------
 .../{openssl_1.1.1t.bb => openssl_1.1.1v.bb}  |   7 +-
 .../meta/cve-update-nvd2-native.bb            |   2 +-
 .../systemd/systemd-systemctl/systemctl       |   2 +-
 .../CVE-2023-30630-dependent_p1.patch         | 236 ++++++++++++++++++
 .../CVE-2023-30630-dependent_p2.patch         | 198 +++++++++++++++
 .../dmidecode/dmidecode/CVE-2023-30630.patch  |  62 +++++
 .../dmidecode/dmidecode_3.2.bb                |   3 +
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2023-29406.patch           | 212 ++++++++++++++++
 .../recipes-devtools/python/python3_3.8.17.bb |   2 +
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2020-35505.patch            |  11 +-
 .../qemu/qemu/CVE-2023-3354.patch             |  87 +++++++
 .../ruby/ruby/CVE-2021-33621.patch            | 139 +++++++++++
 meta/recipes-devtools/ruby/ruby_2.7.6.bb      |   1 +
 ...pcx-buffer-overrun-fix-from-devices-.patch |  31 +++
 .../ghostscript/ghostscript_9.52.bb           |   1 +
 .../libarchive/libarchive_3.4.2.bb            |   3 +
 .../procps/procps/CVE-2023-4016.patch         |  85 +++++++
 meta/recipes-extended/procps/procps_3.3.16.bb |   1 +
 .../harfbuzz/harfbuzz/CVE-2023-25193.patch    |  16 +-
 .../jpeg/files/CVE-2023-2804-1.patch          |  97 +++++++
 .../jpeg/files/CVE-2023-2804-2.patch          |  75 ++++++
 .../jpeg/libjpeg-turbo_2.0.4.bb               |   2 +
 .../linux-firmware/linux-firmware_20230515.bb |   2 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 .../libtiff/files/CVE-2023-25433.patch        | 173 +++++++++++++
 .../files/CVE-2023-25434-CVE-2023-25435.patch |  94 +++++++
 .../libtiff/files/CVE-2023-26965.patch        |  90 +++++++
 .../libtiff/files/CVE-2023-26966.patch        |  35 +++
 .../libtiff/files/CVE-2023-2908.patch         |  33 +++
 .../libtiff/files/CVE-2023-3316.patch         |  59 +++++
 .../libtiff/files/CVE-2023-3618-1.patch       |  34 +++
 .../libtiff/files/CVE-2023-3618-2.patch       |  47 ++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |   8 +
 .../libpcre/libpcre2/CVE-2022-41409.patch     |  74 ++++++
 .../recipes-support/libpcre/libpcre2_10.34.bb |   1 +
 45 files changed, 1977 insertions(+), 531 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-0465.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-0466.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-2650.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1t.bb => openssl_1.1.1v.bb} (96%)
 create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630-dependent_p1.patch
 create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630-dependent_p2.patch
 create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/CVE-2023-30630.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-29406.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3354.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2021-33621.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/0001-Bug-706897-Copy-pcx-buffer-overrun-fix-from-devices-.patch
 create mode 100644 meta/recipes-extended/procps/procps/CVE-2023-4016.patch
 create mode 100644 meta/recipes-graphics/jpeg/files/CVE-2023-2804-1.patch
 create mode 100644 meta/recipes-graphics/jpeg/files/CVE-2023-2804-2.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-25433.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-25434-CVE-2023-25435.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-26965.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-26966.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-2908.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-3316.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-3618-1.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-3618-2.patch
 create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2022-41409.patch

-- 
2.34.1



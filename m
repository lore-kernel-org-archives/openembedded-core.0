Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F054AC47DD9
	for <webhook@archiver.kernel.org>; Sun, 25 Feb 2024 21:52:53 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.7496.1708897971210885893
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 13:52:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VTXtRK/s;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2995fa850ddso1327507a91.0
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 13:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708897970; x=1709502770; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kS9e8svz8U5SCDLnB7M3QIKz2eESmipU1jBo8KU2rx8=;
        b=VTXtRK/sitTQAElQCQ6XGwBWm+86PyuMIttLFpxpQGtygL1PdkkgyXe4grqW0c7qR4
         Y6CL4LB9GUNhzpo7Rvc1pQy/qSzaa2Qt7DvZpP5Gbey4iVsbHtL4Ok0aJZ/LZ1UQT40M
         hkU/6hVb3qP5HhdpG64Q4nNRKmrTwuX4l3o8pCVtytYwYQstR+N8ZFbqKC/z6HlhM1uf
         mhwJbERlCU7dNq1iwzNmReB+I2OmZApPK9WO8Dk9ny8J5KFKZuzUoX2wxW7byGgSKByJ
         c/OL1cHWZYMcigSwiJd3hz3faBQLqgvY7EmcFEKjdGlRTcBqDjg/nsJZ9F6IWCQdCQNM
         KMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708897970; x=1709502770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kS9e8svz8U5SCDLnB7M3QIKz2eESmipU1jBo8KU2rx8=;
        b=LSo/Ortoh8d7RBCkNW6i4bb53bYGxgie/wUy2Kus4+pvaM5c+fPjdZssILhbJcFpE4
         amZVnLuw70iqDPTw+ZY13J4atrHEJH/nuXj3FwcIaw8Ln2aYtftp5FtxLKVYf95KHE8Y
         yqL0IAYejukMF9KvdCLAvHbTLWjIHhZR4y3Deg4TsYqR9+182yMk081NQboUmWF7o5Y0
         Y0A665HYpB2oygcbkQIoVLr/E7PqS3/BDQ58Y3oNmfw80O+Fa1u5bm3QCPDJ1/k0bEZ/
         hzQUTowoDC0JnseCLh2sNOhQkTYGeb4Qnu3BEVdrk7dPAzkuvC+ooBhGqfz7Ih02rEh8
         S8rQ==
X-Gm-Message-State: AOJu0Yy8WuFqvHngm9Ilt7Gy4EybvGM1s2Ye5OLxivyROpm9tf/OlH8Q
	q0N9dQxKU3TXuiAT85XLEGwNXUJMS668LlCpgPSg6LXBs3QP+igpeYJy07esdCs3Gs0Zl6TqUqT
	+TLHi2A==
X-Google-Smtp-Source: AGHT+IFMLnBtzo7EJAdmP8ux2h1ico72RAYCwavTi0sGvXM0tfZ9209U6JYGGt5M4qO/MIWJSWWA1A==
X-Received: by 2002:a17:90a:ca12:b0:29a:9d35:1428 with SMTP id x18-20020a17090aca1200b0029a9d351428mr5568367pjt.5.1708897970223;
        Sun, 25 Feb 2024 13:52:50 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a12-20020a17090acb8c00b0029a4089fbf0sm3082947pju.16.2024.02.25.13.52.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 13:52:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/22] Patch review
Date: Sun, 25 Feb 2024 11:52:19 -1000
Message-Id: <cover.1708897822.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 21:52:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196152

Please review this set of changes for kirkstone and have comments back by
end of day Tuesday, February 27

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6610

The following changes since commit 59cc2e75c15f8c6371a4c4a3b7bd2e6c3f145fbc:

  Revert "kernel: fix localversion in v6.3+" (2024-02-15 15:45:23 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexander Kanavin (1):
  runqemu: direct mesa to use its own drivers, rather than ones provided
    by host distro

Bruce Ashfield (13):
  linux-yocto/5.10: update to v5.10.203
  linux-yocto/5.10: update to v5.10.205
  linux-yocto/5.10: update to v5.10.206
  linux-yocto/5.10: update to v5.10.209
  linux-yocto/5.15: update to v5.15.141
  linux-yocto/5.15: update to v5.15.142
  linux-yocto/5.15: update to v5.15.145
  linux-yocto/5.15: update to v5.15.146
  linux-yocto/5.15: update CVE exclusions
  linux-yocto/5.15: update to v5.15.147
  linux-yocto/5.15: update CVE exclusions
  linux-yocto/5.15: update to v5.15.148
  linux-yocto/5.15: update CVE exclusions

Fabien Mahot (1):
  ldconfig-native: Fix to point correctly on the DT_NEEDED entries in an
    ELF file

Hugo SIMELIERE (1):
  libuv: fix CVE-2024-24806

Ming Liu (1):
  go: add a complementary fix for CVE-2023-29406

Ross Burton (2):
  curl: don't enable debug builds
  oeqa/selftest/runtime_test: only run the virgl tests on qemux86-64

Steve Sakoman (1):
  cve-exclusion_5.10.inc: update for 5.10.209

Tim Orling (1):
  vim: upgrade v9.0.2130 -> v9.0.2190

Zahir Hussain (1):
  cmake: Unset CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES

 meta/lib/oeqa/selftest/cases/runtime_test.py  |   5 +-
 .../libuv/libuv/CVE-2024-24806-1.patch        |  56 +++
 .../libuv/libuv/CVE-2024-24806-2.patch        |  44 +++
 .../libuv/libuv/CVE-2024-24806-3.patch        |  31 ++
 .../libuv/libuv_1.44.2.bb                     |   6 +-
 ...-.dynstr-located-in-separate-segment.patch | 178 +++++++++
 .../glibc/ldconfig-native_2.12.1.bb           |   1 +
 .../cmake/cmake/OEToolchainConfig.cmake       |   3 +
 meta/recipes-devtools/go/go-1.17.13.inc       |   3 +-
 ...023-29406.patch => CVE-2023-29406-1.patch} |   0
 .../go/go-1.18/CVE-2023-29406-2.patch         | 114 ++++++
 .../linux/cve-exclusion_5.10.inc              | 199 +++++++++-
 .../linux/cve-exclusion_5.15.inc              | 372 ++++++++++++++++--
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
 meta/recipes-support/curl/curl_7.82.0.bb      |   4 +-
 meta/recipes-support/vim/vim.inc              |   4 +-
 scripts/runqemu                               |  34 +-
 22 files changed, 1013 insertions(+), 117 deletions(-)
 create mode 100644 meta/recipes-connectivity/libuv/libuv/CVE-2024-24806-1.patch
 create mode 100644 meta/recipes-connectivity/libuv/libuv/CVE-2024-24806-2.patch
 create mode 100644 meta/recipes-connectivity/libuv/libuv/CVE-2024-24806-3.patch
 create mode 100644 meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig-handle-.dynstr-located-in-separate-segment.patch
 rename meta/recipes-devtools/go/go-1.18/{CVE-2023-29406.patch => CVE-2023-29406-1.patch} (100%)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2023-29406-2.patch

-- 
2.34.1



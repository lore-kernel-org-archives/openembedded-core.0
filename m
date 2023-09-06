Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 504DBEB8FBD
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 12:48:32 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.7680.1694004510510099311
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 05:48:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DA5q6kuU;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-26b41112708so2652016a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 05:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694004509; x=1694609309; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fdinwxCJZm2vDXhnVmxnpo0XocjbR9ISlibKHumvjKs=;
        b=DA5q6kuUikpp57ZQvttfrmYWRircShyyZVjw9EI6svds0HUTDxQLlkZWguOgmoElX7
         NQRZiXlu3/w+VjlXmiQSn6oovTSAKTQQCtIpMCO96oUcBDEgBDsz39Wnv0VtE8+WOWjW
         Eh4FEQMnObAvDwQdKBAmLLdsiplDBEcLF3ZuQmfm3BL1/2hjHN3b1NdkQTkiMIHWQewB
         +YM03A2ADVxXMhd3H6lCdfOozW33sjWnCnK3ysCH1Z67GLhJTSYkeRXIK8tnol88WbZ6
         m5hg/eZV/CEi/7C8HjWuv+TZN2/ZAUut1TUVvuwruYSwGtuPiK5HrXss4qD6bZWD6YDT
         R4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694004509; x=1694609309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fdinwxCJZm2vDXhnVmxnpo0XocjbR9ISlibKHumvjKs=;
        b=FZs6QKRjI9rLYzbXRGDTr3Oc1EjdtsHnTsPq1q0kCzRJVn2EGQTvmWbd9FWVzXd38B
         YdfpR2HuBRJ6mQSaeyxR/XHzQq+7OL1HoDg2ejblqIhUJlubik1ioE4JfmGrolxLRw3H
         WtAbQ+Tf8k6wQVAV4V4zFyyad37rV0133siQPR1TO3Rz2tZdHp/3pJVbG9kyAq3REjOn
         XrY8TASDq4p91BpN4gJD0gujaDFrXE+RdHag1uQraLptdwrrtfdXo4TPTf2I89L5rDvo
         AukO3HpQi0o7BMIYeBXumk3fJixfMSOBr69dpscCr/aEuG0Ai5zEverWJTmqJmcSDB6J
         02Jw==
X-Gm-Message-State: AOJu0YzstcNZT23LD7tFah4vzbnvoMQtruqRkK0FV3gEvC+q6amCRQyk
	rNSw3zCqBy1I6WS+jo1PyHfc57zfBjRdC+q81g0=
X-Google-Smtp-Source: AGHT+IGIC73eM0giaD/BL0P6PL9lRjM/9vjcCzJiP0rQyQfzYm+p4YbOl1neLZrbMiIuNu1tjN3afg==
X-Received: by 2002:a17:90a:be0b:b0:26f:4685:5b5c with SMTP id a11-20020a17090abe0b00b0026f46855b5cmr14975940pjs.31.1694004509404;
        Wed, 06 Sep 2023 05:48:29 -0700 (PDT)
Received: from xps13.. ([65.154.164.134])
        by smtp.gmail.com with ESMTPSA id n10-20020a17090a928a00b00267d9f4d340sm12495009pjo.44.2023.09.06.05.48.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 05:48:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/14] Patch review
Date: Wed,  6 Sep 2023 02:48:07 -1000
Message-Id: <cover.1694004064.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 12:48:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187296

Please review this set of changes for kirkstone and have comments back by
end of day Friday, September 8.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5835

The following changes since commit 8ceaeff90023e51c7e874464f026b30d24035bda:
 
  python3-git: upgrade 3.1.27 -> 3.1.32 (2023-08-27 04:03:37 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Abe Kohandel (1):
  libdnf: resolve cstdint inclusion for newer gcc versions

Adrian Freihofer (1):
  json-c: fix CVE-2021-32292

Archana Polampalli (1):
  nasm: fix CVE-2020-21528

Changqing Li (1):
  sysklogd: fix integration with systemd-journald

Chee Yang Lee (3):
  libssh2: fix CVE-2020-22218
  file: fix CVE-2022-48554
  python3: upgrade to 3.10.13

Hitendra Prajapati (2):
  tiff: fix CVE-2023-2908,CVE-2023-3316,CVE-2023-3618
  libtiff: fix CVE-2023-26966 Buffer Overflow

Kai Kang (1):
  webkitgtk: fix CVE-2023-23529

Martin Jansa (1):
  efivar: backport 5 patches to fix build with gold

Meenali Gupta (1):
  busybox: fix CVE-2022-48174

Soumya Sambu (1):
  ncurses: fix CVE-2023-29491

Vijay Anusuri (1):
  inetutils: Backport fix for CVE-2023-40303

 ...ve-deprecated-add-needed-linker-flag.patch |  45 ++
 ...002-Add-T-workaround-for-GNU-ld-2.36.patch |  33 ++
 ...LL-C-to-force-English-output-from-ld.patch |  33 ++
 ...on-and-remove-not-needed-workarounds.patch |  45 ++
 ...mp-efi_well_known_-variable-handling.patch | 262 ++++++++++
 meta/recipes-bsp/efivar/efivar_38.bb          |   9 +-
 ...tpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch | 280 +++++++++++
 ...03-Indent-changes-in-previous-commit.patch | 254 ++++++++++
 .../inetutils/inetutils_2.2.bb                |   2 +
 .../busybox/busybox/CVE-2022-48174.patch      |  80 +++
 meta/recipes-core/busybox/busybox_1.35.0.bb   |   1 +
 .../ncurses/files/CVE-2023-29491.patch        | 464 ++++++++++++++++++
 .../ncurses/ncurses_6.3+20220423.bb           |   1 +
 .../file/file/CVE-2022-48554.patch            |  35 ++
 meta/recipes-devtools/file/file_5.41.bb       |   4 +-
 .../json-c/json-c/CVE-2021-32292.patch        |  30 ++
 meta/recipes-devtools/json-c/json-c_0.15.bb   |   1 +
 ...58-Don-t-assume-inclusion-of-cstdint.patch |  56 +++
 ...onNumber.hpp-add-missing-cstdint-inc.patch |  33 ++
 ...ite3-Sqlite3.hpp-add-missing-cstdint.patch |  36 ++
 meta/recipes-devtools/libdnf/libdnf_0.66.0.bb |   3 +
 .../nasm/nasm/CVE-2020-21528.patch            |  47 ++
 meta/recipes-devtools/nasm/nasm_2.15.05.bb    |   1 +
 ...{python3_3.10.12.bb => python3_3.10.13.bb} |   2 +-
 ...KillMode-process-is-not-recommended-.patch |  33 ++
 ...-messages-lost-when-running-in-syste.patch |  75 +++
 .../sysklogd/sysklogd_2.3.0.bb                |   2 +
 .../libtiff/tiff/CVE-2023-26966.patch         |  35 ++
 .../libtiff/tiff/CVE-2023-2908.patch          |  33 ++
 .../libtiff/tiff/CVE-2023-3316.patch          |  59 +++
 .../libtiff/tiff/CVE-2023-3618-1.patch        |  34 ++
 .../libtiff/tiff/CVE-2023-3618-2.patch        |  47 ++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   5 +
 .../webkit/webkitgtk/CVE-2023-23529.patch     |  65 +++
 meta/recipes-sato/webkit/webkitgtk_2.36.8.bb  |   1 +
 .../libssh2/libssh2/CVE-2020-22218.patch      |  34 ++
 .../recipes-support/libssh2/libssh2_1.10.0.bb |   1 +
 37 files changed, 2175 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-bsp/efivar/efivar/0001-Remove-deprecated-add-needed-linker-flag.patch
 create mode 100644 meta/recipes-bsp/efivar/efivar/0002-Add-T-workaround-for-GNU-ld-2.36.patch
 create mode 100644 meta/recipes-bsp/efivar/efivar/0003-Set-LC_ALL-C-to-force-English-output-from-ld.patch
 create mode 100644 meta/recipes-bsp/efivar/efivar/0004-LLD-fix-detection-and-remove-not-needed-workarounds.patch
 create mode 100644 meta/recipes-bsp/efivar/efivar/0005-Revamp-efi_well_known_-variable-handling.patch
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/0001-CVE-2023-40303-ftpd-rcp-rlogin-rsh-rshd-uucpd-fix-ch.patch
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/0002-CVE-2023-40303-Indent-changes-in-previous-commit.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2022-48174.patch
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2023-29491.patch
 create mode 100644 meta/recipes-devtools/file/file/CVE-2022-48554.patch
 create mode 100644 meta/recipes-devtools/json-c/json-c/CVE-2021-32292.patch
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-Fix-1558-Don-t-assume-inclusion-of-cstdint.patch
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-libdnf-conf-OptionNumber.hpp-add-missing-cstdint-inc.patch
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-libdnf-utils-sqlite3-Sqlite3.hpp-add-missing-cstdint.patch
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2020-21528.patch
 rename meta/recipes-devtools/python/{python3_3.10.12.bb => python3_3.10.13.bb} (99%)
 create mode 100644 meta/recipes-extended/sysklogd/files/0001-syslogd.service-KillMode-process-is-not-recommended-.patch
 create mode 100644 meta/recipes-extended/sysklogd/files/0002-Fix-62-early-log-messages-lost-when-running-in-syste.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-26966.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-2908.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-3316.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-3618-1.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-3618-2.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2023-23529.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2020-22218.patch

-- 
2.34.1



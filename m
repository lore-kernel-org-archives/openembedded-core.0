Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F08CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 18:42:40 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web11.238366.1697568156004747440
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 11:42:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=S579IwnX;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.54, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-57e40f0189aso3173638eaf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 11:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697568155; x=1698172955; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lFOcH4idGz3mJva+jIR6tgfMnCTTmGxA5Okc0XgNNv4=;
        b=S579IwnX7Uc5rhu2+U/WBgwMPZMKgesLoDA+bkY1wUan0N0NsxgR12qdnvp3COdCOH
         8c8vVN/3LZ5l7z1Ylder0bwGSu5IURI5mWIiDkA9ZwpgiyWybC4qZJ8zTqEm905R/qPC
         L2YDEDfoMiXnDQP34VzxJRgSHTXt/j70pHhJbrj668PHUmHU9vEf4fkc3tE6pT2xYghY
         l4XEeSeKClXXxtgejC4EZRHxNWC5Kt7jpn++Tp1oCmWx+QM0u42nQCl9Yl8/ysJ3RDB5
         DubfqmHUhGKopH34XtePtTH0Vm3Xen4UJVeeSVdQHISTVmBe75ZWEpCU2iqnaxYEemVB
         29fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697568155; x=1698172955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lFOcH4idGz3mJva+jIR6tgfMnCTTmGxA5Okc0XgNNv4=;
        b=oi2GCzUiketqp35pky/QLJFdktJsdWx/JzxLMEEDgjb7InlmHa3tkEzJyYdNT02DtG
         Gpj9mpbGlbcP2Pud2pTW2WLqbQpE8lHF/MTEjP84DBAnCpidhHFzQXhROLbSBNb/fJE6
         IhajZUetE2YQdlXuz5RVMgDIvb8GCYMrEGlwc/Sa+oXEaxT+VvDUfitoW+4laq5iXVow
         S+6kSPLp1rv+LWZrUj/fA4HlvfJRFvr6NVLu8k7PRT80rDjjik8WG1mTMmmzFSzY3V74
         6X7cmNA4WBqVRyuf9zB/fub2z9hFm5UfDDouKBbCNXarFEVIfV9OpqWuJMadqimAF+2I
         2kTA==
X-Gm-Message-State: AOJu0YwzUU1ElKGyJz7E+Ai8jqxjub43huc9GMAtR1P36moUgSfWt315
	fhw4G9MciNI/t76fuwDLR4Fh2KxcoraBlh6z4ws=
X-Google-Smtp-Source: AGHT+IEP8ptadUBfdDFIUbpkkCAGPSorjvbsxH5nVZJuJ8vbZ0vy3qlU+KEkZ3PSAcS0SWWOp/aGAA==
X-Received: by 2002:a05:6358:9daa:b0:166:dc89:8c9a with SMTP id d42-20020a0563589daa00b00166dc898c9amr2418183rwo.22.1697568154577;
        Tue, 17 Oct 2023 11:42:34 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id w123-20020a626281000000b0066a31111cc5sm1838715pfb.152.2023.10.17.11.42.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 11:42:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/10] Patch review
Date: Tue, 17 Oct 2023 08:42:20 -1000
Message-Id: <cover.1697567211.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 18:42:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189351

Please review this set of changes for dunfell and have comments back by
end of day Thursday, October 19

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6058

with the exception of a reproducibility issue for the vim-common package
where we have:

"Content-Type:·text/plain;·charset=CP1251\n"

in the A build and:

"Content-Type:·text/plain;·charset=cp1251\n"

in the B build.

Dunfell autobuilder builds are currently using an older buildtools tarball
which is missing:

https://git.yoctoproject.org/poky/commit/?id=a2f1791f8d0118f44cf752341c4793d656a54a94

I'm sending a patch to the list to update dunfell to the latest buildtools tarball

The following changes since commit 0e167ef0eb7ac62ddb991ce80c27882863d8ee7c:

  cpio: Replace fix wrong CRC with ASCII CRC for large files with upstream backport (2023-10-09 07:30:51 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Marek Vasut (2):
  libtiff: Add fix for tiffcrop CVE-2023-1916
  systemd: Backport systemd-resolved: use hostname for certificate
    validation in DoT

Mike Crowe (2):
  curl: Backport fix for CVE-2023-38545
  curl: Backport fix for CVE-2023-38546

Pawan (1):
  libwebp: Update CVE ID CVE-2023-4863

Ryan Eatmon (1):
  kernel.bbclass: Add force flag to rm calls

Siddharth Doshi (4):
  glib-2.0: Fix multiple vulnerabilities
  vim: Upgrade 9.0.1894 -> 9.0.2009
  xorg-lib-common: Add variable to set tarball type
  libxpm: upgrade to 3.5.17

 meta/classes/kernel.bbclass                   |   4 +-
 .../glib-2.0/glib-2.0/CVE-2023-29499.patch    | 290 ++++++++++++
 .../glib-2.0/CVE-2023-32611-0001.patch        |  89 ++++
 .../glib-2.0/CVE-2023-32611-0002.patch        | 255 +++++++++++
 .../glib-2.0/glib-2.0/CVE-2023-32636.patch    |  49 ++
 .../glib-2.0/glib-2.0/CVE-2023-32643.patch    | 154 +++++++
 .../glib-2.0/CVE-2023-32665-0001.patch        | 103 +++++
 .../glib-2.0/CVE-2023-32665-0002.patch        | 210 +++++++++
 .../glib-2.0/CVE-2023-32665-0003.patch        | 417 ++++++++++++++++++
 .../glib-2.0/CVE-2023-32665-0004.patch        | 113 +++++
 .../glib-2.0/CVE-2023-32665-0005.patch        |  80 ++++
 .../glib-2.0/CVE-2023-32665-0006.patch        | 396 +++++++++++++++++
 .../glib-2.0/CVE-2023-32665-0007.patch        |  49 ++
 .../glib-2.0/CVE-2023-32665-0008.patch        | 394 +++++++++++++++++
 .../glib-2.0/CVE-2023-32665-0009.patch        |  97 ++++
 meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb |  14 +
 .../systemd/systemd/CVE-2018-21029.patch      | 120 +++++
 meta/recipes-core/systemd/systemd_244.5.bb    |   1 +
 .../xorg-lib/libxpm/CVE-2022-46285.patch      |  40 --
 .../{libxpm_3.5.13.bb => libxpm_3.5.17.bb}    |   9 +-
 .../xorg-lib/xorg-lib-common.inc              |   3 +-
 .../libtiff/files/CVE-2023-1916.patch         |  91 ++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |   1 +
 .../webp/files/CVE-2023-5129.patch            |   9 +-
 .../curl/curl/CVE-2023-38545.patch            | 148 +++++++
 .../curl/curl/CVE-2023-38546.patch            | 132 ++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   2 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 28 files changed, 3223 insertions(+), 51 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-29499.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32611-0001.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32611-0002.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32636.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32643.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0001.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0002.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0003.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0004.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0005.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0006.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0007.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0008.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0009.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2018-21029.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxpm/CVE-2022-46285.patch
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.13.bb => libxpm_3.5.17.bb} (68%)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-1916.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-38545.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-38546.patch

-- 
2.34.1



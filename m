Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B487C61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 02:31:24 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.10869.1700620280183722646
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 18:31:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ESOJ2Ax8;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6cb9dd2ab56so2557361b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 18:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700620279; x=1701225079; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Py5wmduXTr6LN62oZClofvnzyl2lrETpii19s/YLFJA=;
        b=ESOJ2Ax8j9rrRavj2DbOhFZw677nNkLyVJHXZcH/TC74FkwwNCS6fx417Dcmt6z9hH
         5yGiK0Fj+SRgs8QXMBwktavD9F699EzP0QRexZYwJKQHLPCgn0LzHZV9nPVszN364zUv
         KoxZtA9sUFPZsKegcp+7QRCI8AeFVEUJ2iAib+rzWYM4VXG6sl4CZbqTlEogf1dek3E2
         +DCsDCt5BKVhe5iZC4L3l0jT3XPZwrAtds79HwvHKixkUOpAAqCpifWPRNcJpzXlDiPH
         cV2ypZDYC1GCwHN3d3Udq1UvyCpDkjWj7g6NOaIo+HnImyNM4d9eB8bTsHQ86jykKalV
         hsNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700620279; x=1701225079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Py5wmduXTr6LN62oZClofvnzyl2lrETpii19s/YLFJA=;
        b=Bsp2+dT0tcEfGXHgVrsMQ4uwFDCQZrDAVbkBajC8LE6ucpDYXdzZ89MEN5YLQGmMgp
         JWQihgrMsHaJNh6A6z+4d5RkNOV7ZR92XYCkkBg4c/CwYad9kCitmQtDuSZxS017DpfP
         8pzSYlvus7C6vXCZjxh6+6xUOvf8gJQ8W1d+AbMjP/35oCht/AmRgTp+VNHCHdih3Tsq
         X0hla23JBSU/i4KoDiyBf4Fnh1cYxy843vloQZb1QfjtMbeqm0hECN3808kDnn49gYXO
         a8GZa2bSD+5xFLhuqppfpFAl56ncX8YVsy3Bl0OHlP8GMpkfac7oFo8pn4VgyQhq4Ejh
         wZvA==
X-Gm-Message-State: AOJu0YyogQmxbZUWoD0S4vorqjzQa65GMYRxwnIBF7m5H5MO7DM9LE5X
	Ab6Y8wKERoEs5TI4f1vd9UHo7v/AgxrjHEbWaHBoHA==
X-Google-Smtp-Source: AGHT+IGYyRfRt/W6R1OO4UnFY2UWET3YwnYEwaO3YJyEif5nHdPapAeSfnqjgew9pHOK5bPe5wWBow==
X-Received: by 2002:aa7:8891:0:b0:6cb:6a27:ab57 with SMTP id z17-20020aa78891000000b006cb6a27ab57mr1220677pfe.14.1700620278624;
        Tue, 21 Nov 2023 18:31:18 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id d11-20020a056a00198b00b006cb9a43ae4esm4384182pfl.215.2023.11.21.18.31.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 18:31:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/16] Patch review
Date: Tue, 21 Nov 2023 16:30:57 -1000
Message-Id: <cover.1700620126.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 02:31:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190999

Please review this set of changes for kirkstone and have comments back by
end of day Thursday, November 23

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6227

The following changes since commit 4bb6373e5f4a1330a063d1afe855d6c24d5461e7:

  python3-jinja2: Fixed ptest result output as per the standard (2023-11-08 04:10:02 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Chaitanya Vadrevu (1):
  go: Fix issue in DNS resolver

Deepthi Hemraj (2):
  binutils: Fix CVE-2022-47007
  binutils: Fix CVE-2022-48064

Lee Chee Yang (1):
  ghostscript: ignore GhostPCL CVE-2023-38560

Meenali Gupta (5):
  avahi: fix CVE-2023-38471
  avahi: fix CVE-2023-38470
  avahi: fix CVE-2023-38469
  avahi: fix CVE-2023-38472
  avahi: fix CVE-2023-38473

Niranjan Pradhan (1):
  qemu 6.2.0: Fix CVE-2023-1544

Peter Marko (2):
  go: ignore CVE-2023-45283 and CVE-2023-45284
  goarch: Move Go architecture mapping to a library

Soumya Sambu (1):
  sudo: upgrade 1.9.13p3 -> 1.9.15p2

Vijay Anusuri (1):
  tiff: Backport fix for CVE-2023-41175

Wenlin Kang (1):
  libxcrypt: fixed some build error for nativesdk with mingw

Yogita Urade (1):
  grub: fix CVE-2023-4692

 meta/classes/base.bbclass                     |   2 +-
 meta/classes/goarch.bbclass                   |  27 +----
 meta/lib/oe/go.py                             |  32 ++++++
 .../grub/files/CVE-2023-4692.patch            |  97 ++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |   1 +
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   5 +
 .../avahi/files/CVE-2023-38469.patch          |  47 ++++++++
 .../avahi/files/CVE-2023-38470.patch          |  59 ++++++++++
 .../avahi/files/CVE-2023-38471.patch          |  73 ++++++++++++
 .../avahi/files/CVE-2023-38472.patch          |  46 ++++++++
 .../avahi/files/CVE-2023-38473.patch          | 108 ++++++++++++++++++
 .../0001-Fix-for-compilation-on-Windows.patch |  37 ++++++
 ...dom-bytes.c-fixed-conversion-error-w.patch |  47 ++++++++
 meta/recipes-core/libxcrypt/libxcrypt.inc     |   4 +
 .../binutils/binutils-2.38.inc                |   2 +
 .../binutils/0033-CVE-2022-47007.patch        |  34 ++++++
 .../binutils/0034-CVE-2022-48064.patch        |  57 +++++++++
 meta/recipes-devtools/go/go-1.17.13.inc       |   5 +-
 ...Fix-issue-with-DNS-not-being-updated.patch |  51 +++++++++
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2023-1544.patch             |  70 ++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |   3 +
 ...me.c-correctly-include-header-for-ou.patch |  25 ----
 meta/recipes-extended/sudo/sudo.inc           |   5 +-
 .../{sudo_1.9.13p3.bb => sudo_1.9.15p2.bb}    |   3 +-
 .../libtiff/tiff/CVE-2023-41175.patch         |  69 +++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   1 +
 27 files changed, 854 insertions(+), 57 deletions(-)
 create mode 100644 meta/lib/oe/go.py
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2023-4692.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38469.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38470.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38471.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38472.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2023-38473.patch
 create mode 100644 meta/recipes-core/libxcrypt/files/0001-Fix-for-compilation-on-Windows.patch
 create mode 100644 meta/recipes-core/libxcrypt/files/0001-lib-util-get-random-bytes.c-fixed-conversion-error-w.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0033-CVE-2022-47007.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0034-CVE-2022-48064.patch
 create mode 100644 meta/recipes-devtools/go/go-1.20/0010-net-Fix-issue-with-DNS-not-being-updated.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-1544.patch
 delete mode 100644 meta/recipes-extended/sudo/files/0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch
 rename meta/recipes-extended/sudo/{sudo_1.9.13p3.bb => sudo_1.9.15p2.bb} (92%)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-41175.patch

-- 
2.34.1



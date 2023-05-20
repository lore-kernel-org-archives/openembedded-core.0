Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D63C7EE29
	for <webhook@archiver.kernel.org>; Sat, 20 May 2023 16:05:25 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.13611.1684598717202703225
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 May 2023 09:05:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ToDGn9+G;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-64d247a023aso1990861b3a.2
        for <openembedded-core@lists.openembedded.org>; Sat, 20 May 2023 09:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684598716; x=1687190716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=y3cKpHFqlZkf1O3oonOjGRf0HU/+0gbWdW6bXIrsvOo=;
        b=ToDGn9+Gri8r4bi6PzQ0itKslnZAQuhU6T6kjy0Kl33AtYqRd49qROVpTSi6PnlFuR
         OS6Zl5vcwdXEVbBn4+gmZ5ehFtx9c+XoRROehiQNlpBr5EOUX/+IvfHTGREysLIBwsAl
         f9nTfvoCLEI8tBZmiNgGKmOnmRIrCKXdmTwUjMssJ7hKEktN+g8CJl/eH5xWw+1+Dl5E
         Rs/7hGUN4JegpnlXwwXAC55KGDwEdby1RpKXRyF0nPjt5jen5sQlxY6/LwC/vMZxDoIq
         2xuj6VXkL+orqa+OJNGu6ypXD4LxpCAgvWSz9eidjMNScUTVl26J14JYQTkuyMeAU5Ep
         x/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684598716; x=1687190716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y3cKpHFqlZkf1O3oonOjGRf0HU/+0gbWdW6bXIrsvOo=;
        b=LRV9W6GPDf32Uw7JUte6a074X82FxoOhdCyHZz2VbFHlIFffcTPvIZF6n2xWT09xDt
         QE27s5Zfe26xuYCmBfJ5VTD+nuWRc3hysD3qQUzDxM2UOsySqzC8qC/D6EWLN5457a1X
         zCjF0UeasLylLLvX2zDFNZ9887MI+p+HVHOgyiePnQjF9lfc0iV22xrSrEbFQebOibA/
         HDQugwAMrBuND7/CG6TJO60QxIuItTltg7sAsffIuJWgTnnzSmM56M/biWZYEUwXyK7Z
         c550KzDq9xwYs19Q8B0KP555j5cdexij0Naxy2m34CNEOnv6zY3EAUI6F5XbBJHDYJQi
         8l9Q==
X-Gm-Message-State: AC+VfDygJ1ctYC23HixEyjsBIxGq6Z2RIoyVcTP0aXPeoOfqncVaQz/4
	P5UqC5abrsu3uFbkgLeJCpqHeXI3JODuR7PuIcQ=
X-Google-Smtp-Source: ACHHUZ5BIeTJOb+Ns26iBIzwqro2n8rbsGj7eY+WbDiCYql4EvPFqUQQRXQOay2jJZtL1UyUHspBSQ==
X-Received: by 2002:a05:6a00:a14:b0:647:2ce5:57c4 with SMTP id p20-20020a056a000a1400b006472ce557c4mr8723295pfh.5.1684598715949;
        Sat, 20 May 2023 09:05:15 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a24-20020a62e218000000b00642f1e03dc1sm1457790pfi.174.2023.05.20.09.05.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 May 2023 09:05:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/11] Patch review
Date: Sat, 20 May 2023 06:04:56 -1000
Message-Id: <cover.1684598568.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 May 2023 16:05:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181563

Please review this set of patches for dunfell and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5324

The following changes since commit 1bc254e7969f3d5470bacf9ad9f065d38b7b7fde:

  run-postinsts: Set dependency for ldconfig to avoid boot issues (2023-05-11 07:47:14 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alex Kiernan (1):
  pypi.bbclass: Set CVE_PRODUCT to PYPI_PACKAGE

Dmitry Baryshkov (1):
  linux-firmware: upgrade 20230210 -> 20230404

Hitendra Prajapati (2):
  git: fix CVE-2023-29007
  git: fix CVE-2023-25652

Khem Raj (1):
  perf: Depend on native setuptools3

Marek Vasut (1):
  cpio: Fix wrong CRC with ASCII CRC for large files

Martin Jansa (1):
  populate_sdk_ext.bbclass: set METADATA_REVISION with an DISTRO
    override

Randolph Sapp (1):
  wic/bootimg-efi: if fixed-size is set then use that for mkdosfs

Siddharth (1):
  curl: ammend fix for CVE-2023-27534 to fix error when ssh is enabled

Steve Sakoman (1):
  selftest: skip virgl test on ubuntu 22.10, fedora 37, and all rocky

Thomas Roos (1):
  oeqa/utils/metadata.py: Fix running oe-selftest running with no distro
    set

 meta/classes/populate_sdk_ext.bbclass         |   3 +-
 meta/classes/pypi.bbclass                     |   2 +
 meta/lib/oeqa/selftest/cases/runtime_test.py  |   6 +
 meta/lib/oeqa/utils/metadata.py               |   6 +-
 .../git/files/CVE-2023-25652.patch            |  94 +++++++++++
 .../git/files/CVE-2023-29007.patch            | 159 ++++++++++++++++++
 meta/recipes-devtools/git/git.inc             |   2 +
 ...g-CRC-with-ASCII-CRC-for-large-files.patch |  39 +++++
 meta/recipes-extended/cpio/cpio_2.13.bb       |   1 +
 ...20230210.bb => linux-firmware_20230404.bb} |   6 +-
 meta/recipes-kernel/perf/perf.bb              |   2 +-
 .../curl/curl/CVE-2023-27534-pre1.patch       |  51 ++++++
 .../curl/curl/CVE-2023-27534.patch            | 122 ++------------
 meta/recipes-support/curl/curl_7.69.1.bb      |   1 +
 scripts/lib/wic/plugins/source/bootimg-efi.py |   7 +
 15 files changed, 387 insertions(+), 114 deletions(-)
 create mode 100644 meta/recipes-devtools/git/files/CVE-2023-25652.patch
 create mode 100644 meta/recipes-devtools/git/files/CVE-2023-29007.patch
 create mode 100644 meta/recipes-extended/cpio/cpio-2.13/0001-Wrong-CRC-with-ASCII-CRC-for-large-files.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20230210.bb => linux-firmware_20230404.bb} (99%)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-27534-pre1.patch

-- 
2.34.1



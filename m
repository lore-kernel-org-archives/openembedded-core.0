Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E91BD3A680
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 19:00:04 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.1956.1730228400523994027
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 12:00:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0+h/uPzB;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7ea9739647bso4164129a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 12:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730228400; x=1730833200; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=h7rEui6ebujObGgILoZcM1ATIcbNk9nUcxxntQu1CYM=;
        b=0+h/uPzBxd4DGHJtlUI1/4C+f6GB/GVbnqIZIdlFbY9RJo+VyPkABSK3ncszqlTP++
         TP/6RFg5mWxsIoigbXvZ5ALjY38hHI0YgI2UaoAdcEcKJUpCeOt8Hn98tumgIqZV0+RB
         t6SDuXi3hv8cYri52G+517LyYxZv+FgZ6ssq24Dn2YNH8/dgmuj6mafkfwxo63b7jvw9
         AmaEyoGg8a5blLCn+rPnz4MVIAZmHXu/y8e2EOf6fFlrpxqmwnrPnXkpRx4WxQVaiQhI
         er+VVH5+Nz8aD2BRTj/kwJFomiTrkYIz95+eLXXKl25ZZHpUaRdyXDLRHVwk59gQJVa2
         l+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730228400; x=1730833200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h7rEui6ebujObGgILoZcM1ATIcbNk9nUcxxntQu1CYM=;
        b=KfkcJ3yFccMdJe2Br0v/JL0iZUShkYaKrsVCVxxatfeNy1kOttfjXCn1THzOrUxTZK
         xdfEs2lzxt7BOMqyCpokGV1sM7UczyZz+NPJWB2OpM8dQSwoILYw/D3OdmDQHGXS2oMg
         EqbtVL7ExFohvoFj8xc1UB/p7VGN5vz+YKafHUJqIfXpD4+bDRthcOX4hBno6AEkLXQ6
         d/A6cl93Ohkm1D2RCZv6IweVpGQAXbz2t1fBNHXxPVvJHLjGFwBsGGqFPwRATmeC5Reb
         UXwcEM+3ECQ8/9Um0RBPfIVUPTQNMuyaW3KALdTt+bjuNkkRKjbBzY2BFKV+T3I7XR13
         3EYQ==
X-Gm-Message-State: AOJu0YwnemQDEfHMEcw/ertivx/L2Lo6GbWMaEd6nGkGeBE2azpIfunw
	dmqrSwvDAKEqvjd8F6bAJWhGQn25NELj05LUQKf5omCOuoUnkY2zsly+OL5VgGby2O6x9jW9Waa
	T
X-Google-Smtp-Source: AGHT+IGvYalray3dJkzDJTNXXSrAR47o4GvSeTJv+KYQ/Ivzy7KgFlsFSPpjhhfFUBC+HKwQEk7k+w==
X-Received: by 2002:a05:6a21:164e:b0:1d9:87e3:120c with SMTP id adf61e73a8af0-1d9a851e807mr16065200637.32.1730228399574;
        Tue, 29 Oct 2024 11:59:59 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205793273csm7835439b3a.74.2024.10.29.11.59.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 11:59:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/19] Patch review
Date: Tue, 29 Oct 2024 11:59:33 -0700
Message-Id: <cover.1730228268.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 19:00:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206510

Please review this set of changes for kirkstone and have comments back by
end of day Thursday, October 31

Passed a-full on autobuilder:

https://valkyrie.yoctoproject.org/#/builders/29/builds/362

The following changes since commit 983e3efb51ab22f1fa5f90cbbfba2d701aa425fc:

  kmscube: create_framebuffer: backport modifier fix (2024-10-16 06:55:13 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Antoine Lubineau (1):
  cve-check: add CVSS vector string to CVE database and reports

Ashish Sharma (1):
  ghostscript: Backport CVE-2024-29508

Eilís 'pidge' Ní Fhlannagáin (1):
  nativesdk-intercept: Fix bad intercept chgrp/chown logic

Khem Raj (3):
  zip: Make configure checks to be more robust
  zip: Fix build with gcc-14
  util-linux: Define pidfd_* function signatures

Martin Jansa (3):
  vala: add -Wno-error=incompatible-pointer-types work around
  libffi: backport a fix to build libffi-native with gcc-14
  at-spi2-core: backport a patch to fix build with gcc-14 on host

Peter Marko (3):
  openssl: patch CVE-2024-9143
  python3: ignore fixed CVEs
  cve-check: add support for cvss v4.0

Rohini Sangam (1):
  vim: Upgrade 9.1.0698 -> 9.1.0764

Siddharth Doshi (1):
  vim: Upgrade 9.1.0682 -> 9.1.0698

Steve Sakoman (1):
  bmap-tools: update HOMEPAGE and SRC_URI

Wang Mingyu (1):
  orc: upgrade 0.4.39 -> 0.4.40

Yogita Urade (1):
  qemu: fix CVE-2023-3019

Zoltan Boszormenyi (1):
  cracklib: Modify patch to compile with GCC 14

baruch@tkos.co.il (1):
  overlayfs-etc: add option to skip creation of mount dirs

 meta/classes/cve-check.bbclass                |  12 +-
 meta/classes/overlayfs-etc.bbclass            |   5 +-
 meta/files/overlayfs-etc-preinit.sh.in        |  16 +-
 .../openssl/openssl/CVE-2024-9143.patch       | 202 ++++++
 .../openssl/openssl_3.0.15.bb                 |   1 +
 .../meta/cve-update-nvd2-native.bb            |  19 +-
 meta/recipes-core/util-linux/util-linux.inc   |   1 +
 .../0001-check-for-sys-pidfd.h.patch          |  50 ++
 .../orc/{orc_0.4.39.bb => orc_0.4.40.bb}      |   2 +-
 .../python/python3_3.10.15.bb                 |   2 +
 meta/recipes-devtools/qemu/qemu.inc           |  18 +-
 .../qemu/qemu/CVE-2023-3019-0001.patch        | 622 ++++++++++++++++++
 .../qemu/qemu/CVE-2023-3019-0002.patch        |  91 +++
 meta/recipes-devtools/vala/vala.inc           |   4 +
 ...port-dictionary-byte-order-dependent.patch |   2 +-
 .../ghostscript/CVE-2024-29508-1.patch        | 308 +++++++++
 .../ghostscript/CVE-2024-29508-2.patch        |  29 +
 .../ghostscript/ghostscript_9.55.0.bb         |   2 +
 ...e-dirent.h-for-closedir-opendir-APIs.patch |  45 ++
 ...y-correct-function-signatures-and-de.patch | 134 ++++
 meta/recipes-extended/zip/zip_3.0.bb          |   2 +
 .../0001-Fix-function-prototype.patch         |  27 +
 .../atk/at-spi2-core_2.42.0.bb                |   1 +
 .../bmap-tools/bmap-tools_git.bb              |   4 +-
 ...ward-declare-open_temp_exec_file-764.patch |  47 ++
 meta/recipes-support/libffi/libffi_3.4.4.bb   |   1 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 scripts/nativesdk-intercept/chgrp             |   5 +-
 scripts/nativesdk-intercept/chown             |   5 +-
 29 files changed, 1630 insertions(+), 31 deletions(-)
 create mode 100755 meta/recipes-connectivity/openssl/openssl/CVE-2024-9143.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-check-for-sys-pidfd.h.patch
 rename meta/recipes-devtools/orc/{orc_0.4.39.bb => orc_0.4.40.bb} (92%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3019-0001.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3019-0002.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29508-1.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29508-2.patch
 create mode 100644 meta/recipes-extended/zip/zip-3.0/0001-configure-Include-dirent.h-for-closedir-opendir-APIs.patch
 create mode 100644 meta/recipes-extended/zip/zip-3.0/0001-configure-Specify-correct-function-signatures-and-de.patch
 create mode 100644 meta/recipes-support/atk/at-spi2-core/0001-Fix-function-prototype.patch
 create mode 100644 meta/recipes-support/libffi/libffi/0001-Forward-declare-open_temp_exec_file-764.patch

-- 
2.34.1



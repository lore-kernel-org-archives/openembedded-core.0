Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC6ACEB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 15:06:50 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.26487.1688656000712533950
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 08:06:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=hgnNuS6X;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-55be1ce1669so481882a12.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 08:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688655999; x=1691247999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YwMgSfqJ9zMJaURFePESuNOHkfjTCJN1hbVCaJD3CIo=;
        b=hgnNuS6XuX0b090GDSIJzUH3JNhZvGaKyzap8z+f9YpCa5P2PQdzcYY5CCvIzat18Z
         7JpoOY/1x+hbEJVM6tG3/MfaA1ph6LZiZDatFmpH94aOl3rV58uGsBc8t+UZj/L9LjTJ
         hqZV86Y7N+RpbKypYAJZiZ0ro/snT1/wFOIkq8/5SjicoAhz9q7flMyQzFrCn4iBDCEh
         cMFFzOrzeLEFh6bzTeunSpFR/4F2bPOjJnftG8ttaA2Vu8Jas0gf0r7cW0AyV0Rf1rNw
         38+C2zn6SSeMG9lkwH30UpDt3vIONqwsBwjhzmetLmzlgL4G7ZVZJlZ/DZicUajk34gx
         YQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688655999; x=1691247999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YwMgSfqJ9zMJaURFePESuNOHkfjTCJN1hbVCaJD3CIo=;
        b=c1OE1hPA5D7J9yUu1O1/EUDZTwewP5RtyyB+9QhWKQkwEhOKF26YuJrrB3T49x5eQu
         9tr6kdurE8GQPjABjiSOI76ogz7UtwfRc42tAYunecruA5M2U364epvTydPAmKp85LzH
         CSWLCYF+yMHlxxpadKK/8ULV6iw8DBmi6wulTRfMkQKCGLVaKciCVlS2e/UaYj7cilT/
         9PD/mlsHb8ohM4YR9r5wOk51n6vGLK9c7yxm3JWOPFEs49beN2EaU7aNz4NoiwIwyDcb
         HolGtZW614k/Z47OQZ17eEhGHrCRgdf6pFLXTzkMJoCa/cCveXIfG2OVRcip3bzk/eNc
         O6uw==
X-Gm-Message-State: ABy/qLYDDnMurPdKS4fwPPF7j6wV/DjodCotvzYM7mJq2WGB+AN6jmkz
	Umy9UIHItHA+D05oXGDPmLBuzzj5mkHjD7oBpBI=
X-Google-Smtp-Source: APBJJlHoD4UKTi4plKx/nmyX8AjDzy2nIzHsO4mxrheN3hsklOwDEqElIOpCFsnY4zxv8I1WFloAVA==
X-Received: by 2002:a05:6a20:1612:b0:12c:cfbb:f7e9 with SMTP id l18-20020a056a20161200b0012ccfbbf7e9mr1737537pzj.47.1688655999131;
        Thu, 06 Jul 2023 08:06:39 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj7-20020a170903048700b001b3df3ae3f8sm1534159plb.281.2023.07.06.08.06.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 08:06:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/28] Patch review
Date: Thu,  6 Jul 2023 05:06:03 -1000
Message-Id: <cover.1688655871.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 15:06:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183953

Please review this set of changes for kirkstone and have comments back by
end of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5564

The following changes since commit f20a12ead2d5890e88e7f4ce149a777de47edc48:

  blktrace: ask for python3 specifically (2023-06-27 12:49:55 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexander Kanavin (6):
  scripts/runqemu: split lock dir creation into a reusable function
  scripts/runqemu: allocate unfsd ports in a way that doesn't race or
    clash with unrelated processes
  maintainers.inc: unassign Adrian Bunk from wireless-regdb
  maintainers.inc: unassign Alistair Francis from opensbi
  maintainers.inc: unassign Ricardo Neri from ovmf
  grub: submit determinism.patch upstream

BELOUARGA Mohamed (1):
  meta: lib: oe: npm_registry: Add more safe caracters

Bruce Ashfield (6):
  linux-yocto/5.15: update to v5.15.114
  linux-yocto/5.15: update to v5.15.115
  linux-yocto/5.15: update to v5.15.116
  linux-yocto/5.15: update to v5.15.117
  linux-yocto/5.15: update to v5.15.118
  linux-yocto/5.15: cfg: fix DECNET configuration warning

Charlie Wu (1):
  devtool: Fix the wrong variable in srcuri_entry

Etienne Cordonnier (1):
  libxcrypt: fix hard-coded ".so" extension

Fabien Mahot (1):
  oeqa/selftest/bbtests: add non-existent prefile/postfile tests

Frieder Paape (1):
  image_types: Fix reproducible builds for initramfs and UKI img

Khem Raj (1):
  babeltrace2: Always use BFD linker when building tests with ld-is-lld
    distro feature

Marek Vasut (1):
  cpio: Replace fix wrong CRC with ASCII CRC for large files with
    upstream backport

Mikko Rapeli (1):
  useradd-staticids.bbclass: improve error message

Richard Purdie (4):
  v86d: Improve kernel dependency
  strace: Disable failing test
  strace: Merge two similar patches
  strace: Update patches/tests with upstream fixes

Rusty Howell (1):
  oe-depends-dot: Handle new format for task-depends.dot

Vivek Kumbhar (3):
  go: fix CVE-2023-29400 html/template improper handling of empty HTML
    attributes
  libcap: fix CVE-2023-2603 Integer Overflow in _libcap_strdup()
  cups: fix CVE-2023-34241 use-after-free in cupsdAcceptClient() in
    scheduler/client.c

 meta/classes/image_types.bbclass              |   5 +-
 meta/classes/useradd-staticids.bbclass        |   2 +-
 meta/conf/distro/include/maintainers.inc      |   8 +-
 meta/lib/oe/npm_registry.py                   |   2 +-
 meta/lib/oeqa/selftest/cases/bbtests.py       |   8 +
 meta/recipes-bsp/grub/files/determinism.patch |   2 +-
 meta/recipes-bsp/v86d/v86d_0.1.10.bb          |   1 -
 meta/recipes-core/libxcrypt/libxcrypt.inc     |   6 -
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.18/CVE-2023-29400.patch           |  99 ++++++
 ...0001-caps-abbrev.awk-fix-gawk-s-path.patch |  47 ---
 ...b541b258baec9eba674b5d8dc30007a61542.patch |  50 +++
 ...2f4494779e5c5f170ad10539bfc2dfafe967.patch |  50 +++
 .../strace/strace/update-gawk-paths.patch     |  30 ++
 meta/recipes-devtools/strace/strace_5.16.bb   |   3 +-
 ...g-CRC-with-ASCII-CRC-for-large-files.patch |  39 ---
 ...-calculation-of-CRC-in-copy-out-mode.patch |  58 ++++
 ...appending-to-archives-bigger-than-2G.patch | 312 ++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.13.bb       |   3 +-
 meta/recipes-extended/cups/cups.inc           |   1 +
 .../cups/cups/CVE-2023-34241.patch            |  68 ++++
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
 .../recipes-kernel/lttng/babeltrace2_2.0.5.bb |   1 +
 .../libcap/files/CVE-2023-2603.patch          |  60 ++++
 meta/recipes-support/libcap/libcap_2.66.bb    |   1 +
 scripts/lib/devtool/standard.py               |   2 +-
 scripts/lib/wic/plugins/source/bootimg-efi.py |   2 +
 scripts/oe-depends-dot                        |  21 +-
 scripts/runqemu                               |  48 ++-
 31 files changed, 816 insertions(+), 152 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2023-29400.patch
 delete mode 100644 meta/recipes-devtools/strace/strace/0001-caps-abbrev.awk-fix-gawk-s-path.patch
 create mode 100644 meta/recipes-devtools/strace/strace/3bbfb541b258baec9eba674b5d8dc30007a61542.patch
 create mode 100644 meta/recipes-devtools/strace/strace/f31c2f4494779e5c5f170ad10539bfc2dfafe967.patch
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.13/0001-Wrong-CRC-with-ASCII-CRC-for-large-files.patch
 create mode 100644 meta/recipes-extended/cpio/cpio-2.13/0003-Fix-calculation-of-CRC-in-copy-out-mode.patch
 create mode 100644 meta/recipes-extended/cpio/cpio-2.13/0004-Fix-appending-to-archives-bigger-than-2G.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-34241.patch
 create mode 100644 meta/recipes-support/libcap/files/CVE-2023-2603.patch

-- 
2.34.1



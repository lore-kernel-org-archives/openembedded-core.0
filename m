Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45DA7C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:40:09 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.7269.1654699194316569405
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:39:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=TmpUvUF0;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id a10so18764031pju.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KlxdDvFg5weJn/KPI8Mc+TVFliTt1QDEvPSPDq26ZgY=;
        b=TmpUvUF04PrB6pQJblpuhCtmuP3XW0LGSlzKSr31rdoV98NVvPk5hlXOiWoRjJfIdE
         B4xGxHqZYcZwDJlGMJofdUYeT9WjyWljlTfBXjB6pKOGBKy7pCyYJQpSdjIQDUNZaASh
         9HSrmrnQRXBAYX8IOjn5QNviK3MeqOGvBaFVMMCRNpq8D/KUsrh71zwarfLy8LBkOmV4
         XVmk8r+VjhD0IJUhDVO35fokzVMFNSdDd3akY7ne/qSg1zzCYTUzV2Y8eApNhZCdnfHz
         zi+P0zbg6UGtP7wx07CC7mb9G6Pjw9kqcHQzNyk9q6hn4stGOdbqGwJCfPbUqV4/LkmM
         iFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KlxdDvFg5weJn/KPI8Mc+TVFliTt1QDEvPSPDq26ZgY=;
        b=xB4lcZ4eQBjPKT82jo4j4/tj7VIXCmThs209vdZVMJnpr9QwTBpMaayaVJDpKkp5Cw
         G8JFXTIWRTDN91bVUrXoaEu58KhjnQCkrYeNRvMiU5w/TZzCVprhj58vZeMslZfpEazF
         H4snioqnn8jv/OLXVcUJ5Ntmf6mKXDrC8XRCoL43huKShqc8tG8s5NvH+EuY5bNIDSkA
         4SSuC6OJZQ807sIPJaAcSL9R8nYG9XgcxaS3M5f8APmgFMyDcfySRogI9KeViW91NKAk
         oueghYjNpblJ+fncthLrM1n5m2o0EZ9EMN8nDM5bTcp4E7l7qmrZgBdb09OHtBEOJCeq
         WTLw==
X-Gm-Message-State: AOAM532UoSz3BOabgv6OIkc05xZKzoQdDcuuf3oNGWXv1VPhY+QlgOBT
	DtlS9HZhuDB+RDuFaQxu+5kS8zKRzvYaE+4i
X-Google-Smtp-Source: 
 ABdhPJwaNs9bIIExJra5/S8Rsa9a8ltUyNWDjgdczWHYtTmCpXLCXtSljapJ5AgEHkc67OU4+ZiXEw==
X-Received: by 2002:a17:90b:3ece:b0:1e8:90be:4cda with SMTP id
 rm14-20020a17090b3ece00b001e890be4cdamr14435660pjb.67.1654699193170;
        Wed, 08 Jun 2022 07:39:53 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i4-20020aa787c4000000b0051bc581b62asm12945213pfo.121.2022.06.08.07.39.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 07:39:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/22] Patch review
Date: Wed,  8 Jun 2022 04:39:13 -1000
Message-Id: <cover.1654698895.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 14:40:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166711

Please review this set of patches for kirkstone and have comments back by
end of day Friday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3756

The following changes since commit 27815774c983f7c2c849513efe087a6d77eaf443:

  lzo: Add further info to a patch and mark as Inactive-Upstream (2022-06-02 06:54:27 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Dmitry Baryshkov (2):
  linux-firmware: package new Qualcomm firmware
  linux-firmware: split ath3k firmware

Jeremy Puhlman (1):
  gcc: depend on zstd-native

Marcel Ziswiler (1):
  alsa-plugins: fix libavtp vs. avtp packageconfig

Marta Rybczynska (4):
  cve-check: move update_symlinks to a library
  cve-check: write empty fragment files in the text mode
  cve-check: fix return type in check_cves
  cve-update-db-native: make it possible to disable database updates

Martin Jansa (1):
  patch.py: make sure that patches/series file exists before quilt pop

Mingli Yu (1):
  perl: Fix build with gcc-12

Peter Kjellerstedt (2):
  libseccomp: Correct LIC_FILES_CHKSUM
  license.bbclass: Bound beginline and endline in copy_license_files()

Richard Purdie (6):
  glib-2.0: upgrade 2.72.1 -> 2.72.2
  libxkbcommon: upgrade 1.4.0 -> 1.4.1
  gtk+3: upgrade 3.24.33 -> 3.24.34
  webkitgtk: upgrade 2.36.1 -> 2.36.3
  openssl: Backport fix for ptest cert expiry
  gcc-cross-canadian: Add nativesdk-zstd dependency

Sean Anderson (1):
  rootfs.py: find .ko.zst kernel modules

Stefan Wiehler (1):
  kernel-yocto.bbclass: Reset to exiting on non-zero return code at end
    of task

wangmy (2):
  cups: upgrade 2.4.1 -> 2.4.2
  logrotate: upgrade 3.19.0 -> 3.20.1

 meta/classes/cve-check.bbclass                |  40 +++--
 meta/classes/kernel-yocto.bbclass             |   8 +
 meta/classes/license.bbclass                  |   8 +-
 meta/lib/oe/cve_check.py                      |  10 ++
 meta/lib/oe/patch.py                          |   2 +
 meta/lib/oe/rootfs.py                         |   2 +-
 ...ea88c3888cc5cb3ebc94ffcef706c68bc1d2.patch |  55 +++++++
 .../openssl/openssl_3.0.3.bb                  |   1 +
 .../glib-2.0/glib-2.0/relocate-modules.patch  |   2 +-
 ...{glib-2.0_2.72.1.bb => glib-2.0_2.72.2.bb} |   2 +-
 .../recipes-core/meta/cve-update-db-native.bb |   6 +-
 meta/recipes-devtools/gcc/gcc-11.3.inc        |   2 +-
 .../gcc/gcc-cross-canadian.inc                |   2 +-
 .../files/0001-Fix-build-with-gcc-12.patch    | 143 ++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.34.1.bb     |   1 +
 .../cups/{cups_2.4.1.bb => cups_2.4.2.bb}     |   2 +-
 ...ogrotate_3.19.0.bb => logrotate_3.20.1.bb} |   2 +-
 .../{gtk+3_3.24.33.bb => gtk+3_3.24.34.bb}    |   2 +-
 ...bcommon_1.4.0.bb => libxkbcommon_1.4.1.bb} |   2 +-
 .../linux-firmware/linux-firmware_20220509.bb |  19 ++-
 .../alsa/alsa-plugins_1.2.6.bb                |   2 +-
 ...ebkitgtk_2.36.1.bb => webkitgtk_2.36.3.bb} |   2 +-
 .../libseccomp/libseccomp_2.5.3.bb            |   2 +-
 23 files changed, 273 insertions(+), 44 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/770aea88c3888cc5cb3ebc94ffcef706c68bc1d2.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.72.1.bb => glib-2.0_2.72.2.bb} (96%)
 create mode 100644 meta/recipes-devtools/perl/files/0001-Fix-build-with-gcc-12.patch
 rename meta/recipes-extended/cups/{cups_2.4.1.bb => cups_2.4.2.bb} (51%)
 rename meta/recipes-extended/logrotate/{logrotate_3.19.0.bb => logrotate_3.20.1.bb} (97%)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.33.bb => gtk+3_3.24.34.bb} (89%)
 rename meta/recipes-graphics/xorg-lib/{libxkbcommon_1.4.0.bb => libxkbcommon_1.4.1.bb} (94%)
 rename meta/recipes-sato/webkit/{webkitgtk_2.36.1.bb => webkitgtk_2.36.3.bb} (98%)

-- 
2.25.1



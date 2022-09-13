Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456C9C54EE9
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 14:18:20 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.5123.1663078692097271625
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 07:18:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=iNDsSbv7;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id
 i15-20020a17090a4b8f00b0020073b4ac27so11491854pjh.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 07:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=/dDoRsPmJ5OWmiaNVX4fAwAFPYF39yxlDOJPzb0QXL0=;
        b=iNDsSbv7rkwN9w0cJFscIC2pidCSI9E1KrO+zwMnFSLGXoDuAukoXxGH+BOG+BiqO7
         uRYUykbTEVI2oRVOBDze1E3aEvsEu0US+zJPD73kKULw6WhtLxIEMROBRID0i0tAyU9q
         h1A+RnVvPzDiwignEsPFbcyL8dlILvC3EKXA967RJ9HTZGEnH+bRjTrnYjXH8UYmU0NI
         5itpWU8qm/oYdvQ/uWsGChTP51aAxnijZ5BpLOSsufrMCyuihyhzlFLoCB2TfLY0jzSW
         PlJ6Z0FbdyOVwPkHVqrpM1N0OOaTYYkz+op+UqpIAkFy/TloYD4fHqmJZ752kynAYD26
         qIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=/dDoRsPmJ5OWmiaNVX4fAwAFPYF39yxlDOJPzb0QXL0=;
        b=inp0a8GI7LBD3KCEimAzjGgiuFVbC98l70bvLgm2gpNPIYhLyfEiyH2aQdP0jRfqCf
         FNNVAtutXfK2qawDyhV/VeJ9ZB1Wzptcnij0vsa3DkzJ04awdE2S1kTlueBDjdHCp6Xx
         wHofrlMOrk4Cv10/N8ok6Zq4sRJB+QdrSVqF4VUgLmx13mbKigaFJXCSoPotvKDn6KPe
         7mbfjys88X+D3VyiUcDfSIs1znGra6GLABBSBMNbv7GR1zhxTCUCzpCCZjCIABohXB5D
         aPLUzcVwyOFxeeBaYymWw75H0t9VZr4gQ9Jj6YZg2MhRrF6+ACRGAZyjInMw4WZBVmTn
         9GGQ==
X-Gm-Message-State: ACgBeo3ubpHy0zT+piTgf7MdF77uf3gAoWK0gqtpf6PanSGPVMzqEh8f
	uQSVbiMZth+yuzL7N1RpkQ3+KE46gnXBQ1ZA
X-Google-Smtp-Source: 
 AA6agR6tJz/RzHeMhF1gw/LSGy2kNp8rfhqAvQ/1EVKwa1BC7Tbphc/dxVjlxvy3xCBYB7OTz7JXfA==
X-Received: by 2002:a17:902:da82:b0:178:38ee:70b with SMTP id
 j2-20020a170902da8200b0017838ee070bmr8347818plx.85.1663078690725;
        Tue, 13 Sep 2022 07:18:10 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g11-20020aa796ab000000b0053bf1f90188sm8086424pfk.176.2022.09.13.07.18.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 07:18:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/16] Patch review
Date: Tue, 13 Sep 2022 04:17:41 -1000
Message-Id: <cover.1663078051.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 14:18:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170579

Please review this set of patches for kirkstone and have comments back by
end of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4220

The following changes since commit bfce90b1260d07f01a8dc2998c9e63ca36d4ebbe:

  npm: use npm_registry to cache package (2022-09-06 07:10:59 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alejandro Hernandez Samaniego (1):
  rootfs.py: dont try to list installed packages for baremetal images

Alexandre Belloni (2):
  ruby: drop capstone support
  runqemu: display host uptime when starting

Joshua Watt (1):
  oeqa: qemurunner: Report UNIX Epoch timestamp on login

Khem Raj (2):
  autoconf: Fix strict prototype errors in generated tests
  autoconf: Update K & R stype functions

Kristian Amlie (1):
  externalsrc: Don't wipe out src dir when EXPORT_FUNCTIONS is used.

Martin Jansa (1):
  libxml2: Port gentest.py to Python-3

Pavel Zhukov (1):
  core-image.bbclass: Exclude openssh complementary packages

Peter Bergin (1):
  rootfs-postcommands.bbclass: avoid moving ssh host keys if etc is
    writable

Peter Kjellerstedt (1):
  cairo: Adapt the license information based on what is being built

Richard Purdie (3):
  gcc-multilib-config: Fix i686 toolchain relocation issues
  kernel: Always set CC and LD for the kernel build
  kernel: Use consistent make flags for menuconfig

wangmy (2):
  cracklib: upgrade 2.9.7 -> 2.9.8
  vala: upgrade 0.56.2 -> 0.56.3

 meta/classes/core-image.bbclass               |   4 +
 meta/classes/externalsrc.bbclass              |   8 +-
 meta/classes/kernel.bbclass                   |  16 +-
 meta/classes/rootfs-postcommands.bbclass      |  30 +-
 meta/lib/oe/rootfs.py                         |   4 +
 meta/lib/oeqa/utils/qemurunner.py             |   4 +-
 .../0001-Port-gentest.py-to-Python-3.patch    | 814 ++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |  11 +
 ...ilers-that-moan-about-K-R-func-decls.patch | 138 +++
 .../autoconf/autoconf_2.71.bb                 |   1 +
 .../gcc/gcc-multilib-config.inc               |   2 +-
 ...001-Remove-dependency-on-libcapstone.patch |  36 +
 meta/recipes-devtools/ruby/ruby_3.1.2.bb      |   2 +-
 meta/recipes-devtools/vala/vala_0.56.2.bb     |   3 -
 meta/recipes-devtools/vala/vala_0.56.3.bb     |   3 +
 ...01-rules-Drop-using-register-keyword.patch | 278 ------
 ...rrect-parameter-types-to-Debug-calls.patch |  40 -
 .../{cracklib_2.9.7.bb => cracklib_2.9.8.bb}  |   4 +-
 meta/recipes-graphics/cairo/cairo_1.16.0.bb   |   6 +-
 scripts/runqemu                               |   6 +
 20 files changed, 1058 insertions(+), 352 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/0001-Port-gentest.py-to-Python-3.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/0001-Port-to-compilers-that-moan-about-K-R-func-decls.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/0001-Remove-dependency-on-libcapstone.patch
 delete mode 100644 meta/recipes-devtools/vala/vala_0.56.2.bb
 create mode 100644 meta/recipes-devtools/vala/vala_0.56.3.bb
 delete mode 100644 meta/recipes-extended/cracklib/cracklib/0001-rules-Drop-using-register-keyword.patch
 delete mode 100644 meta/recipes-extended/cracklib/cracklib/0002-rules-Correct-parameter-types-to-Debug-calls.patch
 rename meta/recipes-extended/cracklib/{cracklib_2.9.7.bb => cracklib_2.9.8.bb} (83%)

-- 
2.25.1



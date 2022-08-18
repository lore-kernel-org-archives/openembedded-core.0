Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2513C00140
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 16:56:52 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.44441.1660841804991747920
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 09:56:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=c7xm81uU;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id
 s36-20020a17090a69a700b001faad0a7a34so5278259pjj.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 09:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=su1RVlVuK3IlbKzdn1NrrFLtKt4VRFlGJseYX2uvqtY=;
        b=c7xm81uUD+nXnjvD8VONBuMxg/8nwogDoZEiScqxaGd3+zEXTtkt5ruxeVbPaCj2J6
         wyP2LdycIOvHRCdaAmD7DDPw47Sd1z193IvBF5jg0ly83XXOfqc7Tr+7HWtDUYph3iUb
         FeEHJgKDeonUIJnts9phTZlSLu+Pjg0/8Cfp5Kq7NKO5lfBuCS4FhU2qfNM+todArEey
         bVluHLpjlmNUFMz9QFc3uH62rGfJKIPjLCvUNxVd4Y/MfABEZndHtHDwkzHiU05o5fHs
         y/0ngQunoHzaQUAExQrVKtxjU8lCqV/H91PpeGCAE7bN0U97aLQOGsVx7KWQu1jlr0ce
         t0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=su1RVlVuK3IlbKzdn1NrrFLtKt4VRFlGJseYX2uvqtY=;
        b=R99OQaYIhMbWPvNGVifMXXO1uFjoJrvUkKrkic4cRgEv1bsw753zSouxJTJfSDka9+
         fajwI8c1J52Be6xHyXI0DkeQgC95xlELkU3NnFCDedxik1RRw/MOu03obBd4tkeuMpmm
         i/AtU5/ZOKV9uhbjU7jefWz9B8FtG5T8MO1Igpd/XCXgPAZXQmBuoOyJL1bcmh/iZG/X
         RgabRFflhAg1olZ74Jogu+hCDtlm6xTjZ0jyMV62vd0nksWKAoK4oO1PdWuWjnUt+z6u
         raPeBxBzmFHRl6MG6Q35PuyKBc0ULVbkTN59jM338TkCovcdXLdUYHtQu1dJbBu9kDav
         qMGw==
X-Gm-Message-State: ACgBeo2HcJRuIq29cy2Gsqnp8zHeX+Nwd/vWn0B1o4uxEKycE3Xsb8/j
	OeBhIwQHWX+FnrF6rMZPy+W1BV/KugYjxxq+
X-Google-Smtp-Source: 
 AA6agR4rBsKswgxiXhy019Eqfrr24YGFhB7xElt3FGTfl5B4Q//lAA2QxYKFUBqodtFDzHV8+s6mOQ==
X-Received: by 2002:a17:902:8e8c:b0:171:2a36:e390 with SMTP id
 bg12-20020a1709028e8c00b001712a36e390mr3567853plb.77.1660841803869;
        Thu, 18 Aug 2022 09:56:43 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h135-20020a62838d000000b0052d432b4cc0sm1897446pfe.33.2022.08.18.09.56.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 09:56:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/11] Patch review
Date: Thu, 18 Aug 2022 06:56:17 -1000
Message-Id: <cover.1660841536.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Aug 2022 16:56:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169522

Please review this set of patches for dunfell and have comments back by end
of day Sunday.

This is the final patch set for the 3.1.19 release.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4098

The following changes since commit ac6ea1a96645d2a4dd54660256603f0b191bb4d3:

  gstreamer1.0: use the correct meson option for the capabilities (2022-08-10 05:04:10 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexander Kanavin (1):
  linux-firmware: update 20220610 -> 20220708

Dmitry Baryshkov (1):
  linux-firwmare: restore WHENCE_CHKSUM variable

Hitendra Prajapati (3):
  qemu: CVE-2020-27821 heap buffer overflow in msix_table_mmio_write
  gnutls: CVE-2022-2509 Double free during gnutls_pkcs7_verify
  zlib: CVE-2022-37434 a heap-based buffer over-read

Ming Liu (1):
  rootfs-postcommands.bbclass: move host-user-contaminated.txt to ${S}

Pascal Bach (1):
  bin_package: install into base_prefix

Randy MacLeod (1):
  vim: update from 9.0.0063 to 9.0.0115

Richard Purdie (2):
  vim: Upgrade 9.0.0021 -> 9.0.0063
  kernel-arch: Fix buildpaths leaking into external module compiles

Shruthi Ravichandran (1):
  initscripts: run umountnfs as a KILL script

 meta/classes/bin_package.bbclass              |   3 +-
 meta/classes/kernel-arch.bbclass              |   2 +-
 meta/classes/rootfs-postcommands.bbclass      |   2 +-
 .../initscripts/initscripts_1.0.bb            |   2 +-
 .../zlib/zlib/CVE-2022-37434.patch            |  44 +++
 meta/recipes-core/zlib/zlib_1.2.11.bb         |   1 +
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2020-27821.patch            |  73 +++++
 ...20220610.bb => linux-firmware_20220708.bb} |  14 +-
 .../gnutls/gnutls/CVE-2022-2509.patch         | 282 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.6.14.bb  |   1 +
 meta/recipes-support/vim/files/racefix.patch  |  33 --
 meta/recipes-support/vim/vim.inc              |  10 +-
 13 files changed, 418 insertions(+), 50 deletions(-)
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2022-37434.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-27821.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220610.bb => linux-firmware_20220708.bb} (98%)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2022-2509.patch
 delete mode 100644 meta/recipes-support/vim/files/racefix.patch

-- 
2.25.1



Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E4F2C7619A
	for <webhook@archiver.kernel.org>; Sun,  2 Apr 2023 16:42:29 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.48694.1680453745103549900
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Apr 2023 09:42:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=0+9WqkS4;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id le6so25817558plb.12
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 09:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680453744; x=1683045744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YkIeZB8Kek8/9re/RYRUvuBGSHOpD5rdQhbK7y/vdfA=;
        b=0+9WqkS4roQQqtVy5JY25SUFjWDn0sr/vyo8IQfl0WsTsxBV1aM3R+eWAx9itqTfFd
         i6SHdoL8WqIIbM5mx/n5x1Od+yEJjmAPqhOf7hxEMim1avDM0qf7ENRu4kLESegksRrW
         o33AYgscFe1M2Y+ms59+CaygI3HrS2zrJVxvdR+L8OhCYl8WVY7JBAGqlBcsDm3YDrHc
         GKJxn2M3tDTgh3UwAmZqxGmHzFbK5OZt98uUQhtwzZun5UKewSnQ+QT+ZTiO6ZwS6S6S
         CGMMC9TKv5XdMgAW/5pxghDGORJw0D/sbTvzZcRwK8pQfdJwVYnTS5u3fnObh4TeYGLG
         CThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680453744; x=1683045744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YkIeZB8Kek8/9re/RYRUvuBGSHOpD5rdQhbK7y/vdfA=;
        b=XMCrlG5fLPy04d71rkLJTi8XRMjNl3Ahzs9ob8c5/mzsvLdGMNk5/+/zDHgos3oGW2
         ZyuyAKd01Oa+Yj/64xnUWHrhO6tDJ5zzrzyT3ctydikXHSqBlwNqHq8UNIG134vHyGPn
         X8+DLbVBdiwn0r+fOIOIg/fpzUHlYbrLjKHaUUZ1Bo4x+1zfafirLMFNziJicEilPa5R
         mKGcRQuRlfPdh0H2uTnReUCHX0A5Y7W4V7nR5moacvX/IUGar0dSz2oEPMGFodXUj+07
         rHeplwdjXLfk912SPYC2PgDBwP7lcFHlaScV8dvpHAIHKktJf2/amdBPI/5ljO4thPeK
         sB5Q==
X-Gm-Message-State: AAQBX9eFXCRjcCpBMUa6YWobXVRQNj/xXXi0nY/91vYzU3bO/yBmut/h
	IisGIQ6mxAQDd9fcStpp05w+dHLjLxEaY9IxWeg=
X-Google-Smtp-Source: AKy350Z1vKNq3KnWJPuXDPwDdndZ9WwpR32OzANiP1BDHDFJDWYBG6IfBWBhAFaPxNo1lqLwCczgXg==
X-Received: by 2002:a17:902:c409:b0:1a0:6852:16dd with SMTP id k9-20020a170902c40900b001a0685216ddmr43209982plk.12.1680453743760;
        Sun, 02 Apr 2023 09:42:23 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ja7-20020a170902efc700b001a1ddd224desm5042079plb.89.2023.04.02.09.42.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 09:42:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/21] Patch review
Date: Sun,  2 Apr 2023 06:41:55 -1000
Message-Id: <cover.1680453201.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 16:42:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179581

Please review this set of patches for kirkstone and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5136

with the exception of a known intermittent autobuilder issue on oe-selftest-armhost:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=15005

which passed on subsequent re-test:

https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/1215

The following changes since commit 08ab1f02da65ee9815115e6a1cdb51ffed10a2dc:

  systemd: fix wrong nobody-group assignment (2023-03-23 06:42:22 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Bruce Ashfield (10):
  linux-yocto/5.10: update to v5.10.162
  linux-yocto/5.10: update to v5.10.164
  linux-yocto/5.10: update to v5.10.166
  linux-yocto/5.10: update to v5.10.168
  linux-yocto/5.10: update to v5.10.170
  linux-yocto/5.10: update to v5.10.172
  linux-yocto/5.10: update to v5.10.175
  lttng-modules: update to v2.13.9
  linux-yocto/5.15: update to v5.15.98
  linux-yocto/5.15: update to v5.15.103

Geoffrey GIRY (1):
  cve-check: Fix false negative version issue

Khem Raj (2):
  rsync: Add missing prototypes to function declarations
  rsync: Turn on -pedantic-errors at the end of 'configure'

Martin Jansa (2):
  selftest: devtool: set BB_HASHSERVE_UPSTREAM when setting
    SSTATE_MIRROR
  bmap-tools: switch to main branch

Peter Marko (1):
  gcc-shared-source: do not use ${S}/.. in deploy_source_date_epoch

Randy MacLeod (1):
  vim: upgrade 9.0.1403 -> 9.0.1429

Ross Burton (1):
  scripts/lib/buildstats: handle top-level build_stats not being
    complete

Sakib Sajal (1):
  go: fix CVE-2022-2879 and CVE-2022-41720

Siddharth Doshi (1):
  openssl: Security fix for CVE-2023-0464, CVE-2023-0465, CVE-2023-0466

pawan (1):
  Revert "qemu: fix CVE-2021-3507"

 meta/classes/cve-check.bbclass                |   5 +-
 meta/lib/oe/cve_check.py                      |  39 ++
 meta/lib/oeqa/selftest/cases/cve_check.py     |  19 +
 meta/lib/oeqa/selftest/cases/devtool.py       |   1 +
 .../openssl/openssl/CVE-2023-0464.patch       | 225 ++++++++
 .../openssl/openssl/CVE-2023-0465.patch       |  56 ++
 .../openssl/openssl/CVE-2023-0466.patch       |  50 ++
 .../openssl/openssl_3.0.8.bb                  |   3 +
 .../gcc/gcc-shared-source.inc                 |   4 +-
 meta/recipes-devtools/go/go-1.17.13.inc       |   2 +
 .../go/go-1.18/CVE-2022-2879.patch            | 177 ++++++
 .../go/go-1.18/CVE-2022-41720.patch           | 514 ++++++++++++++++++
 meta/recipes-devtools/qemu/qemu.inc           |   2 -
 .../qemu/qemu/CVE-2021-3507_1.patch           |  92 ----
 .../qemu/qemu/CVE-2021-3507_2.patch           | 115 ----
 ...-prototypes-to-function-declarations.patch | 173 ++++++
 ...antic-errors-at-the-end-of-configure.patch |  68 +++
 meta/recipes-devtools/rsync/rsync_3.2.5.bb    |   2 +
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
 ...ccessor-helpers-into-accessors.h-v6..patch |  45 --
 .../fix-jbd2-upper-bound-for-v5.10.163.patch  |  52 --
 ...e-the-correct-print-format-v5.10.163.patch |  61 ---
 ...ules_2.13.8.bb => lttng-modules_2.13.9.bb} |   5 +-
 .../bmap-tools/bmap-tools_git.bb              |   2 +-
 meta/recipes-support/vim/vim.inc              |   4 +-
 scripts/lib/buildstats.py                     |   1 +
 31 files changed, 1378 insertions(+), 415 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-0465.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-0466.patch
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2022-2879.patch
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2022-41720.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3507_1.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3507_2.patch
 create mode 100644 meta/recipes-devtools/rsync/files/0001-Add-missing-prototypes-to-function-declarations.patch
 create mode 100644 meta/recipes-devtools/rsync/files/0001-Turn-on-pedantic-errors-at-the-end-of-configure.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-btrfs-move-accessor-helpers-into-accessors.h-v6..patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-upper-bound-for-v5.10.163.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-use-the-correct-print-format-v5.10.163.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.8.bb => lttng-modules_2.13.9.bb} (83%)

-- 
2.34.1



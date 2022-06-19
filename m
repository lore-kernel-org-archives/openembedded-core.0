Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2676C43334
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:31:07 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web09.22216.1655667061023872112
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=g8SiUL8m;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id
 g16-20020a17090a7d1000b001ea9f820449so8886617pjl.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m1vFt3zaWXYKjqOF/yLrNTLOozjFwSIeGtZKQvYgA6g=;
        b=g8SiUL8mQKLQjLetGZhdRZzds1dvASMaXoH9edVPqcBmyL4RZqMRJ+pNj0w2Tt+6QT
         gXZA0F3Ar5oqKt9mSpWRRu9GbjAwGZAJBEEdANzJuWphaRxozr6VdCRKEPDT3+op0NTY
         kxp8IAq/F9IG9W3W3rAhqZj0NbZKhl9yk5Nw7tKY2faqGuiKblaXme9IEtPV6BSqdx/k
         D9YgIrZyn7PqTZSJ44OtQgQIfCTvq10NHtXZEcW4sZBXygg0CkRVnOPgD+USt0cFvmzQ
         IUIDWD93QVpvLXxtTLq/1gxLQ+GY5nqousulUkSotLa+uiOPLwy1h4YPmCbK9uenDyyF
         AkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m1vFt3zaWXYKjqOF/yLrNTLOozjFwSIeGtZKQvYgA6g=;
        b=lNBGU63Em+kxFXT4GdCgSZjLNZZKeyb1XEaHEUPS5/TP9MIxS9PTE7uyfUyMMA/WNm
         25coTgtzLrSyzeW0z55ab6w+P8S58FKTEik/oXWILdP8jIK8UMZ4mXGLVrIKFGPxrWCU
         KcM3rQqvee6tZZ8Adr8wGqpKhRWGdKVpK59gmC/SoL+/YXc+wEyirHPFUN5iDZfNML9e
         XyMSnzEJ/8/4CV6dSuCDEN+lcFHjGze0AgEsOYu1+CZV+VFhfSYRrJOl2PkaiXqHzdI+
         Gtz6XAE7tOUz3fCoQDxUKgsrMfrsBJKC0FknwZrSwui3JXNDk06Xg8iYN6YiyCI09mVF
         T6TQ==
X-Gm-Message-State: AJIora9S/JETm32vMeAW31y7nb79ywkRIRxmcFk/IeyZDebcbhjEQHuR
	nSN4v9oqCe0PXHpWHoY+j0haDoL3OHSMfBwr
X-Google-Smtp-Source: 
 AGRyM1uAUFmDSupxRHuY3zzPjnURV+13s3FwKgiiN5bie54LfkXK2DuitG33or4aXhvkWSKyE8zHPQ==
X-Received: by 2002:a17:902:aa43:b0:168:ef35:5bd9 with SMTP id
 c3-20020a170902aa4300b00168ef355bd9mr19998730plr.137.1655667059717;
        Sun, 19 Jun 2022 12:30:59 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 o2-20020a637e42000000b003fe4836abdasm7432886pgn.1.2022.06.19.12.30.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:30:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/15] Patch review
Date: Sun, 19 Jun 2022 09:30:35 -1000
Message-Id: <cover.1655666951.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 19:31:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167046

Please review this set of patches for kirkstone and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3799

The following changes since commit 0f7a8359ba370c7f5d5153453ed699e9566f5b1d:

  rootfs.py: close kernel_abi_ver_file (2022-06-10 05:13:53 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Jack Mitchell (1):
  meson.bbclass: add cython binary to cross/native toolchain config

Jose Quaresma (2):
  archiver: use bb.note instead of echo
  archiver: don't use machine variables in shared recipes

Kai Kang (1):
  xxhash: fix build with gcc 12

Mingli Yu (1):
  oescripts: change compare logic in OEListPackageconfigTests

Pavel Zhukov (1):
  systemd: update 0008-add-missing-FTW_-macros-for-musl.patch

Rasmus Villemoes (1):
  e2fsprogs: add alternatives handling of lsattr as well

Richard Purdie (5):
  vim: Upgrade 8.2.5034 -> 8.2.5083
  uboot-sign: Fix potential index error issues
  selftest/multiconfig: Test that multiconfigs in separate layers works
  gcc-source: Fix incorrect task dependencies from ${B}
  liberror-perl: Update sstate/equiv versions to clean cache

Xiaobing Luo (1):
  devtool: Fix _copy_file() TypeError

Yi Zhao (2):
  popt: fix override syntax in RDEPENDS
  git: fix override syntax in RDEPENDS

 meta-selftest/conf/multiconfig/muslmc.conf          |  2 ++
 meta/classes/archiver.bbclass                       | 11 ++++++++---
 meta/classes/meson.bbclass                          |  2 ++
 meta/classes/uboot-sign.bbclass                     |  2 ++
 meta/lib/oeqa/selftest/cases/multiconfig.py         | 13 +++++++++++++
 meta/lib/oeqa/selftest/cases/oescripts.py           |  3 ++-
 .../0008-add-missing-FTW_-macros-for-musl.patch     |  8 ++++----
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb |  5 ++++-
 meta/recipes-devtools/gcc/gcc-common.inc            |  2 +-
 meta/recipes-devtools/gcc/gcc-source.inc            |  1 +
 meta/recipes-devtools/git/git_2.35.3.bb             |  2 +-
 meta/recipes-devtools/perl/liberror-perl_0.17029.bb |  4 ++++
 meta/recipes-support/popt/popt_1.18.bb              |  2 +-
 meta/recipes-support/vim/vim.inc                    |  4 ++--
 meta/recipes-support/xxhash/xxhash_0.8.1.bb         |  2 ++
 scripts/lib/devtool/standard.py                     |  2 +-
 16 files changed, 50 insertions(+), 15 deletions(-)
 create mode 100644 meta-selftest/conf/multiconfig/muslmc.conf

-- 
2.25.1



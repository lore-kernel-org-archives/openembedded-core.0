Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33EA2C433FE
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 16:58:14 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.33155.1635699480223654627
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=RXmHPmzf;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id
 y14-20020a17090a2b4e00b001a5824f4918so7584199pjc.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lbMGwqQK6c27Y+s+sbMqL9pHv7znoqkY0I3yWwsvxV8=;
        b=RXmHPmzfJLdI0RVcUP6vhkpwx4YiNrJWWc3mZR+ylLjBjPfH/ao6pzVvmtCl7Awlop
         xNcnhQapXPIFeEivOH4TOqUk/U+EvlXPqp4Ekt4ixe4NIcgQwVuxHvHnx6FmMQGGb4s1
         NspRhk5R7c5wYJe16/65KYBbdwHBD+SVQ0ae8GyF1298SL57aTiegHOgbIW1Ac2yb4G9
         xzDnov7HgcvE2XUT0+Dvf1iQ5arPude3JXuzsmE7zD+ZSY8H1oul8LkV24QqQVun/3TM
         QH2pI/3miWAeam86SqBKVd1RNenhXTthEboP/PndB2LbK4wg1/0Lrlh4/UlEiCqCIlnk
         mibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lbMGwqQK6c27Y+s+sbMqL9pHv7znoqkY0I3yWwsvxV8=;
        b=HGi0/h8p4pmJzTI/3no1frNZdKeYgqorQWZXME8yexRdq4pbjOWEiTKrXt/vCYZFs4
         PR9BiNwnsxK0rnbfLnM3XMGRDjYf9rPRqT/LKuWjsn+Bxg0FhLfUwBMY7LZfiS1Qmj58
         wiz4GMwy9e01Sn/xtvKeFXACY8IpDQg+L26Nk+jQ5a9G+19wmKJu2B+6KFC8bKH01Ree
         P1bx9NBV/xN0CYHkoNzEz1GZaBPGPE3Ap2ChYKsLV925kCMCLYM5BYxEGfx5wgyn6nR6
         KF8h2P5VTdP46RjfWZI5C07etWsTchD2C9ScrENqX7ocQ0I5M16LtWn7Hz6AgX7WWxU0
         Pc7A==
X-Gm-Message-State: AOAM533VdA6J6z22M2BTRRpwlKjWyO117yiiDt0IfLgS+xAiyN6UVOI+
	2VlFTK335UcYRXDR/kC7YifUoxV2oKbBTj7zuZU=
X-Google-Smtp-Source: 
 ABdhPJyQfuH7RMbpQU45bhky+d7duYaeoi29C65WXhGGkW8WhxMuifBbHuhfpIdZUpzkrca4eXVf6g==
X-Received: by 2002:a17:90a:5303:: with SMTP id
 x3mr30458615pjh.226.1635699479071;
        Sun, 31 Oct 2021 09:57:59 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s21sm13476617pfk.175.2021.10.31.09.57.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 09:57:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/29] Patch review
Date: Sun, 31 Oct 2021 06:57:19 -1000
Message-Id: <cover.1635699172.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 16:58:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157658

Please review this set of patches for dunfell and have comments back by end
of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2833

The following changes since commit a7520c47573cd166d441e504737492b86f5aa42e:

  selftest/reproducible: adjust exclusion list for dunfell (2021-10-25 13:28:19 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexander Kanavin (7):
  linux-firmware: upgrade 20210511 -> 20210818
  linux-firmware: upgrade 20210818 -> 20210919
  wireless-regdb: upgrade 2021.04.21 -> 2021.07.14
  wireless-regdb: upgrade 2021.07.14 -> 2021.08.28
  ca-certificates: update 20210119 -> 20211016
  tzdata: upgrade 2021a -> 2021d
  tzdata: update 2021d -> 2021e

Daniel McGregor (1):
  bitbake.conf: Add gpg-agent as a host tool

Jose Quaresma (1):
  sstate: fix touching files inside pseudo

Minjae Kim (1):
  vim: fix 2021-3796

Oleksandr Kravchuk (1):
  mirrors.bbclass: remove dead infozip mirrors

Ranjitsinh Rathod (1):
  curl: Whitelist CVE-2021-22897

Richard Purdie (5):
  base: Clean up unneeded len() calls
  base: Use repr() for printing exceptions
  reproducible_build: Drop obsolete sstate workaround
  patch: Use repr() with exceptions instead of str()
  git: Fix determinism issue

Ross Burton (8):
  devtool: fix modify with patches in override directories
  sstate: don't silently handle all exceptions in sstate_checkhashes
  oe/license: implement ast.NodeVisitor.visit_Constant
  license.bbclass: implement ast.NodeVisitor.visit_Constant
  oe/utils: log exceptions in ThreadedWorker functions
  testimage: fix unclosed testdata file
  oeqa/runtime: load modules using importlib
  oeqa/runtime: search sys.path explicitly for modules

Steve Sakoman (3):
  waffle: old website is down, update to new project URLs
  stress-ng: convert to git, website is down
  stress-ng: improve reproducibility

Teoh Jay Shen (1):
  oeqa/runtime/parselogs: modified drm error in common errors list

 meta/classes/base.bbclass                     | 12 +--
 meta/classes/devtool-source.bbclass           |  4 +-
 meta/classes/license.bbclass                  |  4 +
 meta/classes/mirrors.bbclass                  |  1 -
 meta/classes/patch.bbclass                    |  4 +-
 meta/classes/reproducible_build.bbclass       |  4 -
 meta/classes/sstate.bbclass                   | 11 +--
 meta/classes/testimage.bbclass                |  7 +-
 meta/conf/bitbake.conf                        |  2 +-
 meta/lib/oe/license.py                        |  6 ++
 meta/lib/oe/utils.py                          |  3 +-
 meta/lib/oeqa/runtime/cases/parselogs.py      |  2 +-
 meta/lib/oeqa/runtime/context.py              | 29 +++----
 meta/lib/oeqa/selftest/cases/bbtests.py       |  3 -
 meta/recipes-devtools/git/git.inc             |  2 +-
 meta/recipes-devtools/git/git/fixsort.patch   | 36 +++++++++
 ...write-the-timestamp-into-compressed-.patch | 26 ++++++
 .../stress-ng/stress-ng_0.11.17.bb            |  7 +-
 meta/recipes-extended/timezone/timezone.inc   |  7 +-
 meta/recipes-graphics/waffle/waffle_1.6.0.bb  | 12 +--
 ...20210511.bb => linux-firmware_20210919.bb} |  6 +-
 ....04.21.bb => wireless-regdb_2021.08.28.bb} |  2 +-
 ...ertdata2pem.py-print-a-warning-for-e.patch | 80 +++++++++++++++++++
 .../ca-certificates/sbindir.patch             | 26 ------
 ...pdate-ca-certificates-support-Toybox.patch | 33 --------
 ...0210119.bb => ca-certificates_20211016.bb} |  5 +-
 meta/recipes-support/curl/curl_7.69.1.bb      |  5 ++
 .../vim/files/CVE-2021-3796.patch             | 50 ++++++++++++
 28 files changed, 266 insertions(+), 123 deletions(-)
 create mode 100644 meta/recipes-devtools/git/git/fixsort.patch
 create mode 100644 meta/recipes-extended/stress-ng/stress-ng/0001-Makefile-do-not-write-the-timestamp-into-compressed-.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20210511.bb => linux-firmware_20210919.bb} (99%)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2021.04.21.bb => wireless-regdb_2021.08.28.bb} (94%)
 create mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0001-Revert-mozilla-certdata2pem.py-print-a-warning-for-e.patch
 delete mode 100644 meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch
 delete mode 100644 meta/recipes-support/ca-certificates/ca-certificates/update-ca-certificates-support-Toybox.patch
 rename meta/recipes-support/ca-certificates/{ca-certificates_20210119.bb => ca-certificates_20211016.bb} (95%)
 create mode 100644 meta/recipes-support/vim/files/CVE-2021-3796.patch

-- 
2.25.1



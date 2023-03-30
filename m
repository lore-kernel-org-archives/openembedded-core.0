Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D9DC77B61
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 21:14:13 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.38964.1680210845431232440
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 14:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=jNK06iBQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id om3-20020a17090b3a8300b0023efab0e3bfso23313987pjb.3
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 14:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680210844; x=1682802844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vIob7UjpBsTZF2p6ICiTsm9N68h7Kyvs9RwRzUL1LGk=;
        b=jNK06iBQ/Mxn5t1G/JRR/JPg2WZcbjVwQHpsSrGDYhFREIfYvwvVzcBxcdRuc22eoW
         LLdzjdpxqewHIhyC1745h7b93cFenjaR2E814volpCdzBBEwu9xzrLFLkQbWguSLtj6a
         IlBYXMs+gXo+KEyo9CbW2+rADZURu1qHdKccz9HxHdlcuVeCMp4f4j9QFEoOg8DHo3lx
         MRoSMo7BRTls9z72q48C66WuqUp9BZcOzSxjmVj/H9PdiWFLVc3fjTJgxQ1zkSltuybU
         4F5uyFeycYc/2rGDzvE2ukYiKMrHMQ1AjeOgbuU1nOPEbRGfiu+dgGHmYSp3DULLZZ3F
         gBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680210844; x=1682802844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vIob7UjpBsTZF2p6ICiTsm9N68h7Kyvs9RwRzUL1LGk=;
        b=rgACozxPsvGUKBa6BXGr7LnFhENv9Ay8aZ/WMeQPoxULed3rMo/fWWQKTJjxlvu50I
         dYOlCcctSbv06SoLBY5/D7Mm2+I2nCSInOZYuX4Cr2JgY6Ak7SINSNiCh16a9w4fcxkv
         GUH14ql7tdNVEG85/aiaVMNYMw/crJLkAjscJJTNVN+tVPEuMaS18joqjuamzsOP2/Fa
         TDgQp7n5UId2GHtmjiQbPcjWfzwY0H1W8B3/uw0nWSR6JdrwCnkOUXOFlQBbeHLs1Vaf
         PKzHzpJwV6HNlKQHGdPdHSBjCsyBWkOgxvO0zHj28O9HOaME171eZWRDJnpHo2T+GuN9
         Rq9w==
X-Gm-Message-State: AO0yUKXh99mhSA8JKSklT1rOWyiT8JzDipN/1RiABrLjkV0Zaspctbad
	0Q6jaMvo3wHnPfxqVo6d8Uzs9B5mzKLykW/rafU=
X-Google-Smtp-Source: AK7set/sEZfSmXtCUU1vlydJavB7AzXESPaxDzK1UbJWSYxf+8sDgu5iQwTGkmAGVKFu1dY4DOkDfQ==
X-Received: by 2002:a05:6a20:bab0:b0:d9:c3f5:2933 with SMTP id fb48-20020a056a20bab000b000d9c3f52933mr20828480pzb.20.1680210843975;
        Thu, 30 Mar 2023 14:14:03 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id c30-20020a631c1e000000b0050301521335sm250661pgc.11.2023.03.30.14.14.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 14:14:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 00/14] Patch review
Date: Thu, 30 Mar 2023 11:13:42 -1000
Message-Id: <cover.1680210378.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 21:14:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179359

Please review this set of patches for langdale and have comments back by
end of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5122

With the exception of a known intermittent autobuilder issue on oe-selftest-armhost:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=14969

which passed on subsequent re-test:

https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/1201

The following changes since commit a0ef4386d37f84e8f169cbe3cfa9307010b89bbd:

  systemd: fix wrong nobody-group assignment (2023-03-21 06:55:30 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/langdale-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/langdale-nut

Bruce Ashfield (4):
  linux-yocto/5.15: update to v5.15.98
  linux-yocto/5.15: update to v5.15.103
  lttng-modules: update to v2.13.9
  kernel-devsrc: fix mismatched compiler warning

Geoffrey GIRY (2):
  cve-extra-exclusions: ignore inapplicable linux-yocto CVEs
  cve-check: Fix false negative version issue

Martin Jansa (2):
  selftest: devtool: set BB_HASHSERVE_UPSTREAM when setting
    SSTATE_MIRROR
  bmap-tools: switch to main branch

Narpat Mali (1):
  python3-setuptools: fix for CVE-2022-40897

Peter Marko (1):
  gcc-shared-source: do not use ${S}/.. in deploy_source_date_epoch

Randy MacLeod (1):
  vim: upgrade 9.0.1403 -> 9.0.1429

Ross Burton (1):
  scripts/lib/buildstats: handle top-level build_stats not being
    complete

Siddharth Doshi (1):
  openssl: Security fix for CVE-2023-0464, CVE-2023-0465, CVE-2023-0466

Wang Mingyu (1):
  xcb-proto: Fix install conflict when enable multilib.

 meta/classes/cve-check.bbclass                |   5 +-
 .../distro/include/cve-extra-exclusions.inc   | 212 +++++++++++++++++
 meta/lib/oe/cve_check.py                      |  39 +++
 meta/lib/oeqa/selftest/cases/cve_check.py     |  19 ++
 meta/lib/oeqa/selftest/cases/devtool.py       |   1 +
 .../openssl/openssl/CVE-2023-0464.patch       | 225 ++++++++++++++++++
 .../openssl/openssl/CVE-2023-0465.patch       |  56 +++++
 .../openssl/openssl/CVE-2023-0466.patch       |  50 ++++
 .../openssl/openssl_3.0.8.bb                  |   3 +
 .../gcc/gcc-shared-source.inc                 |   4 +-
 ...-of-whitespace-to-search-backtrack.-.patch |  31 +++
 .../python/python3-setuptools_65.0.2.bb       |   4 +-
 ...nstall-conflict-when-enable-multilib.patch |  32 +++
 .../xorg-proto/xcb-proto_1.15.2.bb            |   1 +
 .../linux/cve-exclusion_5.15.inc              |  90 +++++++
 meta/recipes-kernel/linux/kernel-devsrc.bb    |   7 +
 .../linux/linux-yocto-rt_5.15.bb              |   9 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   9 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  29 ++-
 ...ccessor-helpers-into-accessors.h-v6..patch |  45 ----
 .../fix-jbd2-upper-bound-for-v5.10.163.patch  |  52 ----
 ...e-the-correct-print-format-v5.10.163.patch |  61 -----
 ...ules_2.13.8.bb => lttng-modules_2.13.9.bb} |   5 +-
 .../bmap-tools/bmap-tools_git.bb              |   2 +-
 meta/recipes-support/vim/vim.inc              |   4 +-
 scripts/lib/buildstats.py                     |   1 +
 26 files changed, 808 insertions(+), 188 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-0464.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-0465.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-0466.patch
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/0001-Limit-the-amount-of-whitespace-to-search-backtrack.-.patch
 create mode 100644 meta/recipes-graphics/xorg-proto/xcb-proto/0001-Fix-install-conflict-when-enable-multilib.patch
 create mode 100644 meta/recipes-kernel/linux/cve-exclusion_5.15.inc
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-btrfs-move-accessor-helpers-into-accessors.h-v6..patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-upper-bound-for-v5.10.163.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/fix-jbd2-use-the-correct-print-format-v5.10.163.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.8.bb => lttng-modules_2.13.9.bb} (83%)

-- 
2.34.1



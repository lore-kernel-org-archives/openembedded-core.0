Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A57BCC52D7B
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 12:17:02 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.70595.1723551412863818643
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 05:16:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LE8iUpee;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2cb6662ba3aso3635246a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 05:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1723551412; x=1724156212; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wdRsZTKpRij47cKOY0hbVt/dyi7qTuwSHYTB9XBBUig=;
        b=LE8iUpeeK5VJEgg46151UXHzizY0GtGuW1CfmAc2jYpw2S/bVHvli7FFejxf+PVJfG
         TpnjYYWWjcaJyTx9b+AUUeaff6KGcxexjNDmDBAyLjLJYH4XITMaF6oDck7fZADQffSy
         V3NQwWEnd0PSf/9TCSfjJEPYYh/4waJ6QJ/UTTrgeTwJwPVuM9ZW/mzoF1dQI7fl0mPZ
         sQQBBxcIrnMknLFWTj5I1u0d+hb2P5bAPiK6CpmNopbkCC6/vs97kyKHxR91zuKAZiwq
         8NFkFHBulPL+zJlzGltgdK4Ar8trvwmwyL229Cxuo7o1BL8znb7sFKg4CWQjSwFLq3xz
         IFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723551412; x=1724156212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wdRsZTKpRij47cKOY0hbVt/dyi7qTuwSHYTB9XBBUig=;
        b=kMs0kzcNxF2syrdVQTdeYAyXaEGgDNta+SyiED/O/RkdmWcVkB3ySkwbZHOcLTfqU9
         Pn11IEqLKGdgAu3s8xSlOfYhUec6KORgWju+ufym/RNIb73R9XHFLVBy29pZn5GvunD8
         ZcxtHy+1u2uUYKrc5PVWpQMvT1t1ZVVWWJGxuLgS3VKXOPzXRz8e6S/cF3gx7Gd6bgd1
         BDW6z5rQ+PxqqGluV910yTFJ9tlCBPcQjqc1gqgjcj9nYT2Vh9bUW+tkMJZ9MVjVxWGS
         jKU6HN4hcKntvCCz/oh+LBycZdU1AvzWR5sc3gYFJqE687NRy9Uay/m2JeXiHC8gHovv
         rVQg==
X-Gm-Message-State: AOJu0Ywe9yHOhQK52qWaY3iMuT12jfKHMqAvmy2trFA0M4psGpF2Tr/1
	xO5U6WwUkYzzjEiok6wIAJ1iy8BUTkJaWUI3zzlpb0OmMCQTtSe7NXLTorH/ztyyTQpQL7fabxI
	0CLM=
X-Google-Smtp-Source: AGHT+IE5xF0Z911+wC5aFNh6KlymE8HlgBdOGNpPL4PK0NQT6sY52U4kFm9YlL8Ibdhbgftpy9/ldg==
X-Received: by 2002:a17:90b:8e:b0:2c7:49b4:7e3a with SMTP id 98e67ed59e1d1-2d39424c2f3mr4176020a91.7.1723551411741;
        Tue, 13 Aug 2024 05:16:51 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1fced1838sm7148998a91.23.2024.08.13.05.16.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:16:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/11] Patch review
Date: Tue, 13 Aug 2024 05:16:37 -0700
Message-Id: <cover.1723551231.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 12:17:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203264

Please review this set of changes for kirkstone and have comments back by
end of day Thursday, August 15

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7236

The following changes since commit 2721f84ba755ceea5780e44feb0713ad8c4d0217:

  lttng-modules: Upgrade 2.13.9 -> 2.13.14 (2024-08-02 12:10:02 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Archana Polampalli (4):
  ghostscript: fix CVE-2024-29511
  ghostscript: fix CVE-2024-29509
  ghostscript: fix CVE-2024-29506
  go: fix CVE-2024-24791

Hitendra Prajapati (1):
  busybox: CVE-2023-42364, CVE-2023-42365, CVE-2023-42366 fixes

Peter Marko (1):
  libyaml: Update status of CVE-2024-35328

Richard Purdie (1):
  cve_check: Use a local copy of the database during builds

Ross Burton (1):
  python3-pycryptodome(x): use python_setuptools_build_meta build class

Soumya Sambu (1):
  python3-certifi: Fix CVE-2024-39689

Vijay Anusuri (1):
  orc: upgrade 0.4.32 -> 0.4.39

Yogita Urade (1):
  ofono: fix CVE-2023-2794

 meta/classes/cve-check.bbclass                |   7 +-
 .../ofono/ofono/CVE-2023-2794-0001.patch      |  37 ++
 .../ofono/ofono/CVE-2023-2794-0002.patch      |  32 ++
 .../ofono/ofono/CVE-2023-2794-0003.patch      |  44 +++
 .../ofono/ofono/CVE-2023-2794-0004.patch      | 127 +++++++
 meta/recipes-connectivity/ofono/ofono_1.34.bb |   4 +
 .../busybox/CVE-2023-42364_42365-1.patch      | 197 ++++++++++
 .../busybox/CVE-2023-42364_42365-2.patch      |  96 +++++
 .../busybox/busybox/CVE-2023-42366.patch      |  36 ++
 meta/recipes-core/busybox/busybox_1.35.0.bb   |   3 +
 .../meta/cve-update-nvd2-native.bb            |  18 +-
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.21/CVE-2024-24791.patch           | 359 ++++++++++++++++++
 .../orc/{orc_0.4.32.bb => orc_0.4.39.bb}      |   2 +-
 .../python3-certifi/CVE-2024-39689.patch      |  69 ++++
 .../python/python3-certifi_2021.10.8.bb       |   1 +
 .../python/python3-pycryptodome_3.14.1.bb     |   2 +-
 .../python/python3-pycryptodomex_3.14.1.bb    |   2 +-
 .../ghostscript/CVE-2024-29506.patch          |  45 +++
 .../ghostscript/CVE-2024-29509.patch          |  45 +++
 .../ghostscript/CVE-2024-29511-0001.patch     | 100 +++++
 .../ghostscript/CVE-2024-29511-0002.patch     | 219 +++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |   4 +
 meta/recipes-support/libyaml/libyaml_0.2.5.bb |   3 +
 24 files changed, 1442 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2023-2794-0001.patch
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2023-2794-0002.patch
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2023-2794-0003.patch
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2023-2794-0004.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2023-42364_42365-1.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2023-42364_42365-2.patch
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2023-42366.patch
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2024-24791.patch
 rename meta/recipes-devtools/orc/{orc_0.4.32.bb => orc_0.4.39.bb} (92%)
 create mode 100644 meta/recipes-devtools/python/python3-certifi/CVE-2024-39689.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29506.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29509.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29511-0001.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2024-29511-0002.patch

-- 
2.34.1



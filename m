Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B6B7FF5114
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 16:16:24 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.85270.1775578576401252537
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 09:16:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hOEIwSY9;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488a4bc360bso17389735e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 09:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775578574; x=1776183374; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BFWeI6YIeO9LogJT35n14gxe9J/BLXuPi2PkBUTzXg8=;
        b=hOEIwSY9aNoa64w37fgYCWYEBOFgqyFEHIU5BPcCLojnG07BPSug3zLItn3msOhPe0
         reTguP5J9zDDej7QJqKNjlb01JEk9amPlYMDqrgiV9ZCcPxDIAzmDObqZbzb3bI/xBvH
         ZzBSbKJRdErJpxnXJ4fZBRdT8rdwB6JHAw0Yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775578574; x=1776183374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BFWeI6YIeO9LogJT35n14gxe9J/BLXuPi2PkBUTzXg8=;
        b=Vmn/ahr09sPRMkkMiQy4QCsw+hcYN3rdi7p7/mipa/aRbHifAQV9OMg7L2KnbSB2Vr
         v82TiFZIW10hdtu71CdtB/jHXIrnv//HFsQFqBqOmDv8WBicPiYwXWVVInAaIingoo3b
         UvpdWqEaKcJxtSpR7kXnx1UNjQjDEurQkisZjCcad5GhSqbUjZtnT0oNfc3xnq5OFiF9
         oy2BSnjYJgx4wm3dxUjEPlOQ+fDKlkR/w3Ni91ltChJx3H+SrG9mXgR/w/26/JCbBokh
         s3kVtvoZ5EuUM82oy2EPd0jet8rlBcqTXm1ehwZTjvPZrnRSKGmeyJiqcKm36XGj1IFf
         cgRQ==
X-Gm-Message-State: AOJu0Yxqa19++5odFkbI5pZt/XLl33cb/x+LF0/em0UDaMIzhL6Zk6yd
	2x0lSotwlR2nNxVXdPBGkAhGdkyByboekCFUiYUtoSY53VA6kL829RECMPl8VvskNyTJlygOtHw
	yOPi5FkI=
X-Gm-Gg: AeBDievtUfkX5s6xQ+j6PHMJ7g6Vt7RbXpiccL9kg2svmmg7i1uUjMryXC8udfx3mKj
	7/oL/xWyc6QEsjp+E///D3FIwoWX3gOVhwO/xddtZg6zcSR9JJqGHu068RofadWtT5Et2rsSl9+
	aR6RqxJPHHGM2AQu5DBaawJx2lsuGqaRSoYe57/ETaE6qt8PiTXfKOVjXOI4dFfWL29YMQBx1pq
	RCGZSl+iRwF1aXSu8Yze9cW5ecQMsEdJ3yLbopTwDt1OL/zPXpvSY3pSJGxQKB5lfq4VlHlWyQ7
	Lh2jAIF50aDYRf3oX5Tf/6AgHBZ9EvLOmzxVqUThMxprP7NuEFIp9n/L9FC4cDiC2axQoDX9SbG
	MlxBUDiGbT1wCDXwYPUuhb/J4BT3i+HSLyy6Aiut0cHyEg9TDxAkD2mPxN5qcm18dstxOfrRaGD
	UZIGrlMOWg4qImnhTJDCUDl9AVz17JgQ9PGgXInT4dTwglgLnOkeYyYQQYIu+LeSEb6lLT/pOBb
	eH9Zonas3ZzqKu3nODgwchBPFvk
X-Received: by 2002:a05:600c:1884:b0:488:a2ac:a340 with SMTP id 5b1f17b1804b1-488a2aca44emr102131665e9.12.1775578574361;
        Tue, 07 Apr 2026 09:16:14 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa003bbe8013556e3516.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:3bbe:8013:556e:3516])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488c4b57febsm1195665e9.4.2026.04.07.09.16.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 09:16:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v3 00/19] Patch review
Date: Tue,  7 Apr 2026 18:15:37 +0200
Message-ID: <cover.1775578386.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 16:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234753

Please review this set of changes for kirkstone and have comments back by
end of day Wednesday, April 8.

Please note:
- This will be the last review cycle for kirkstone.
- If you expect a patch to get merged and it is not in this series ping
  me as soon as possible.
- Some patches look OK to me and are included here but will only be
  merged if some patches are sent/fixed in more recent branches:
  - Pending an equivalent patch sent for scarthgap:
    - ncurses: fix for CVE-2025-69720
  - Pending an equivalent patch sent for whinlatter:
    - libarchive: Fix CVE-2026-4111

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3612

v2->v3:
- Added ncurses:·fix·for·CVE-2025-69720 to the series

v1->v2:
- replaced "python3: Fix CVE-2025-15282" with
  "python3: upgrade 3.10.19 -> 3.10.20"
- Those patches are not held anymore since equivalent patches have been
  sent to more recent branches:
    - curl: patch CVE-2026-3784
    - curl: patch CVE-2026-3783
    - curl: patch CVE-2026-1965
    - vim: Fix CVE-2026-33412

The following changes since commit c4194cadb1180da37514c55cd97827eb0269c8e2:

  build-appliance-image: Update to kirkstone head revision (2026-03-20 09:58:53 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

for you to fetch changes up to 94df79c304f692b0108155e04905180cdf92b2cd:

  scripts/install-buildtools: Update to 4.0.34 (2026-04-07 09:14:47 +0200)

----------------------------------------------------------------

Bruce Ashfield (2):
  linux-yocto/5.15: update to v5.15.200
  linux-yocto/5.15: update to v5.15.201

Fabien Thomas (1):
  README.OE-Core: update contributor links and add kirkstone prefix

Hitendra Prajapati (2):
  vim: Fix CVE-2026-33412
  ncurses: fix for CVE-2025-69720

Jinfeng Wang (1):
  tzdata/tzcode-native: upgrade 2025c -> 2026a

Paul Barker (1):
  create-pull-request: Keep commit hash to be pulled in cover email

Peter Marko (1):
  libtheora: mark CVE-2024-56431 as not vulnerable yet

Vijay Anusuri (10):
  tzdata,tzcode-native: Upgrade 2025b -> 2025c
  python3: upgrade 3.10.19 -> 3.10.20
  python3-pyopenssl: Fix CVE-2026-27448
  python3-pyopenssl: Fix CVE-2026-27459
  libarchive: Fix CVE-2026-4111
  sqlite3: Fix CVE-2025-70873
  curl: patch CVE-2025-14524
  curl: patch CVE-2026-1965
  curl: patch CVE-2026-3783
  curl: patch CVE-2026-3784

Yoann Congal (1):
  scripts/install-buildtools: Update to 4.0.34

 README.OE-Core.md                             |  10 +-
 .../ncurses/files/CVE-2025-69720.patch        |  42 ++
 .../ncurses/ncurses_6.3+20220423.bb           |   1 +
 .../python3-pyopenssl/CVE-2026-27448.patch    | 125 ++++++
 .../python3-pyopenssl/CVE-2026-27459.patch    | 106 +++++
 .../python/python3-pyopenssl_22.0.0.bb        |   5 +
 .../python/python3/CVE-2025-12084.patch       | 171 --------
 .../python/python3/CVE-2025-13836.patch       | 163 --------
 .../python/python3/CVE-2025-13837.patch       | 162 --------
 .../python/python3/CVE-2025-6075.patch        | 364 ------------------
 ...{python3_3.10.19.bb => python3_3.10.20.bb} |   6 +-
 .../libarchive/CVE-2026-4111-1.patch          |  32 ++
 .../libarchive/CVE-2026-4111-2.patch          | 308 +++++++++++++++
 .../libarchive/libarchive_3.6.2.bb            |   2 +
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
 .../libtheora/libtheora_1.1.1.bb              |   3 +
 .../curl/curl/CVE-2025-14524.patch            |  42 ++
 .../curl/curl/CVE-2026-1965-1.patch           |  98 +++++
 .../curl/curl/CVE-2026-1965-2.patch           |  29 ++
 .../curl/curl/CVE-2026-3783-pre1.patch        |  66 ++++
 .../curl/curl/CVE-2026-3783.patch             | 157 ++++++++
 .../curl/curl/CVE-2026-3784.patch             |  73 ++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   6 +
 .../sqlite/files/CVE-2025-70873.patch         |  33 ++
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb |   1 +
 .../vim/files/CVE-2026-33412.patch            |  61 +++
 meta/recipes-support/vim/vim.inc              |   1 +
 scripts/create-pull-request                   |   2 +-
 scripts/install-buildtools                    |   4 +-
 32 files changed, 1224 insertions(+), 893 deletions(-)
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2025-69720.patch
 create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.patch
 create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27459.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-12084.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-13836.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-13837.patch
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-6075.patch
 rename meta/recipes-devtools/python/{python3_3.10.19.bb => python3_3.10.20.bb} (98%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14524.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3783-pre1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3783.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3784.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-70873.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-33412.patch



Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4160DEF4EA4
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 06:27:39 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49550.1775456851731738252
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2026 23:27:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0QFW/cX4;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48896199cbaso29747235e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 23:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775456850; x=1776061650; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=A3I5nGRDUw4pEbVLRc8echpG4Bm/8KJjbBN6JDfknqQ=;
        b=0QFW/cX4Nul87mczX6bQNMjG6gb8m+SN36zo/LBTA0Jhtlo2ObXQrc23+YCoklzguX
         1qVO8UVsbAuXQGPy7gQsACcSsh+V1nyzhUO1tLNUaahvyxJHIxj+zGWyoT0vlRApjEPv
         R3Z1sfeYI26VzmEKQOwARqa9ZM0QZX9D/LcbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775456850; x=1776061650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A3I5nGRDUw4pEbVLRc8echpG4Bm/8KJjbBN6JDfknqQ=;
        b=VbU2ficS3zc86cG4FmWrmRVu4PlQ3hqFqumCl8d/aDn1gSdYQN/3UVu15xCSUqXO2w
         QAs52pcrClmiTjjSj4PHQF61krz47+FUJRtS3N/B5x6AygrOapD/d0G4M9TUBsOtjWBr
         5/tmx0KBv068fDxdvlhEJSr7ugmBcmKz0IT0tDDHZ0LvQojQfOFCFIm9wH6CPlpBMLDX
         YyoiDI+Pr+Q3nploHmFl8ybHkcxIobMHd5ztsfBybV/9uhr8OcVWonn7PiGNfJLym2ps
         Ah55DUEYe+3w+g7BL7uxgltQOW8y9tDyrcCBYsJKqb5CoPhgGjuknyS3OAVpYqH1nd47
         4Jfw==
X-Gm-Message-State: AOJu0YymPun0ZNLUEvm2Vz5sHjE/2/ruqet7U5vj57QY/scBdChO9A0B
	3p4YrnJEOprBjjzkFtxPoA6gF9QBIx7FO4hNlSBfUYRFjrVqKAR4R/rQL6qpk26wY7cHXg8naZ9
	wZlvkwhw=
X-Gm-Gg: AeBDiesKTlwCItyT0jo76lLCV9kb0bLBxiPzsqlrPtZeqUU77hYsXQptXLvyHvm7xeV
	iOqvwSrWFCLHF5fMUaTaSb0Ef9cwx3u4bTQYgojyKHQ5dZacWs3TqIOwBPIwwtDkWcAadUX88MU
	br+WDNaTrYM1mD9Tlm2/g5YbeqnCvhN+2IwlbveT7mmSlpft0hkhsNS5+IYdDmH6it8I6Poy4oz
	SoGllmGiZ2p1qNnS7CmWT/WPyfEGe+tW+mFkEeBw4OybT2t4cOm6CoERtJw6t2Gv03N3Odpf+LL
	IfeJdWQhFzrKo7UaBErESbhYEY2kT6XiGdevuyDtiWJpKA6gDHhAj4wFADCqQLAr+2G/Di7a9vX
	Xl0SZ28APcSSBCdkTrOkslo3ezfjoMPoDY8R0isz6xEzK34brmvG+EpgTG2iUDmDuME37FC5z+6
	8F+tCJU2hF8sk3PXfH1SWPLecmgBKgVDkdpSEF4uGxBqEfwYoCAAnW3PpnNE4JqsjDNJgTWmWNS
	Ucxk2y4hCQ/K6iXLn8FUEYgmZ4=
X-Received: by 2002:a05:600c:3b1b:b0:488:8bdd:cfb9 with SMTP id 5b1f17b1804b1-488996b01c8mr168962985e9.1.1775456849713;
        Sun, 05 Apr 2026 23:27:29 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48899eab0f7sm84273785e9.29.2026.04.05.23.27.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 23:27:29 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/18] Patch review
Date: Mon,  6 Apr 2026 08:26:29 +0200
Message-ID: <cover.1775435063.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 06:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234646

Please review this set of changes for kirkstone and have comments back by
end of day Wednesday, April 8.

Please note:
- This will be the last review cycle for kirkstone.
- If you expect a patch to get merged and it is not in this series ping
  me as soon as possible.
- Some patches look OK to me and are included here but will only be
  merged if some patches are sent/fixed in more recent branches:
  - Pending a fix for the scarthgap branch:
    - curl: patch CVE-2026-3784
    - curl: patch CVE-2026-3783
    - curl: patch CVE-2026-1965
  - Pending an equivalement patch sent for whinlatter:
    - vim: Fix CVE-2026-33412
    - libarchive: Fix CVE-2026-4111
  - Pending an equivalement patch sent for whinlatter and scarthgap
    - python3: Fix CVE-2025-15282

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3603

The following changes since commit c4194cadb1180da37514c55cd97827eb0269c8e2:

  build-appliance-image: Update to kirkstone head revision (2026-03-20 09:58:53 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

for you to fetch changes up to 38444a1a8eb2575e2ad273a922d9793e10c3858c:

  scripts/install-buildtools: Update to 4.0.34 (2026-04-06 00:08:58 +0200)

----------------------------------------------------------------

Bruce Ashfield (2):
  linux-yocto/5.15: update to v5.15.200
  linux-yocto/5.15: update to v5.15.201

Fabien Thomas (1):
  README.OE-Core: update contributor links and add kirkstone prefix

Hitendra Prajapati (1):
  vim: Fix CVE-2026-33412

Jinfeng Wang (1):
  tzdata/tzcode-native: upgrade 2025c -> 2026a

Paul Barker (1):
  create-pull-request: Keep commit hash to be pulled in cover email

Peter Marko (1):
  libtheora: mark CVE-2024-56431 as not vulnerable yet

Vijay Anusuri (10):
  tzdata,tzcode-native: Upgrade 2025b -> 2025c
  python3: Fix CVE-2025-15282
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
 .../python3-pyopenssl/CVE-2026-27448.patch    | 125 +++++++
 .../python3-pyopenssl/CVE-2026-27459.patch    | 106 ++++++
 .../python/python3-pyopenssl_22.0.0.bb        |   5 +
 .../python/python3/CVE-2025-15282.patch       |  68 ++++
 .../python/python3_3.10.19.bb                 |   1 +
 .../libarchive/CVE-2026-4111-1.patch          |  32 ++
 .../libarchive/CVE-2026-4111-2.patch          | 308 ++++++++++++++++++
 .../libarchive/libarchive_3.6.2.bb            |   2 +
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
 .../libtheora/libtheora_1.1.1.bb              |   3 +
 .../curl/curl/CVE-2025-14524.patch            |  42 +++
 .../curl/curl/CVE-2026-1965-1.patch           |  98 ++++++
 .../curl/curl/CVE-2026-1965-2.patch           |  29 ++
 .../curl/curl/CVE-2026-3783-pre1.patch        |  66 ++++
 .../curl/curl/CVE-2026-3783.patch             | 157 +++++++++
 .../curl/curl/CVE-2026-3784.patch             |  73 +++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   6 +
 .../sqlite/files/CVE-2025-70873.patch         |  33 ++
 meta/recipes-support/sqlite/sqlite3_3.38.5.bb |   1 +
 .../vim/files/CVE-2026-33412.patch            |  61 ++++
 meta/recipes-support/vim/vim.inc              |   1 +
 scripts/create-pull-request                   |   2 +-
 scripts/install-buildtools                    |   4 +-
 27 files changed, 1249 insertions(+), 28 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.patch
 create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27459.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-15282.patch
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



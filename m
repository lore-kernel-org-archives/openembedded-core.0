Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E27ACFD531F
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 09:30:49 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.91851.1772184645073284578
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Feb 2026 01:30:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=c9AkqBNl;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4834826e5a0so19559455e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 01:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772184643; x=1772789443; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zP0bpUguq2gDC3fGw5rJvcygN7ebZtvUZecssrZyUuY=;
        b=c9AkqBNlwpIW9OFGUvwWYhuQAfg8qRtXkTTS4i1eEm3MZ/N8+/d39Ll7WbqTKYV/n0
         4wblYbuD/0BoYeKx2MYvpH+O4SPDkOy2y3SC/cOFeyoJW7Ahs8uNQRrDPAmjQVeD32iV
         CvmcCdsi8moGlVtvrJCRB+KXB1MeXrBoE1KII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772184643; x=1772789443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zP0bpUguq2gDC3fGw5rJvcygN7ebZtvUZecssrZyUuY=;
        b=p4UX0qiPQ4LYq2AhW233u8Gz7nYATAzw1Zn5aRfL2UecrYXs5myd2jldDd7Wg6IYL1
         Dh4UWTE4fVINqOZwiEjw0ZCsrEWzdgsIAy8D0YnNOjrOSEhNkglPSEbd2auwWaqVZFU/
         XvpD6ghxlC6xB0FJcyAt1YVd89YU8uoVBhjlxeBXdlJiPCOWmmkW1AwnFX3fmBlKXxzv
         ZSCUV+77divsfzwW3H0V098os/y1swK+px2i7upl/TjhHBoKZMZm706G+i0cwE44x3WK
         eboiMuZuSNPVzlmYdsgJVsiiFAHFSYkU8BDfBxhfS3xRDAE9WoFRNr/9VbKL7Wh/8wSZ
         HBVg==
X-Gm-Message-State: AOJu0Yw/RhRKG0zkEMC7KMEY7NNeD845vFbe/Fw4m1u8Td4OpKVv2EvB
	S8Q7jEE2OASPJOXDwF56FRD0G+oDW93xbg+g+fszCfPkNVfLB9tnKzCzEaKN9x532hLUdkgPDI4
	QAdtY
X-Gm-Gg: ATEYQzw6LLbz4M/upUBa6APpdXDbebnr1qemfKeuH6xEnXEOf9FU7gjvxUQH0Q6cC64
	gl707MJq+ga/Hpws7vjh/q7fVJQmH+l6A5Gjt8vjQZTLzPbSa/fTiJtE6zHIFkADv+bhhobjM70
	4DWO5xFPmykpfnlqsccT2/UcIfW+Ds/aqCvubAKRZt9kz4ixoNogH+LnNMRle7V8fisb7XX12ox
	v1U90PlAepxhSzBehMkzOi7ZJ6n6JSko2g+ALwh9LBXs4hhnFjDx6r3BWL1y6mop7V8Bh/TwonX
	Mcc7vGITvN/lY87BF0IX7g0U6WhDPGVF1qLAGNHS06VDO+kQ2IqZ8QQnCnrUDEZqsiQFLDWBG71
	73UMku6w8sjsJOW1nXpy2VI9c/VAZT/jLHQCaDvpe92YNqBLhoxSkrOrt6ABubT8t/UP3x9/NPI
	EzhT7o6evLVcxr/kTr/AcfT4YU38aIPVL9grZ80G6xTYcW/iUtC0Rf/vwSKWbelsu9sQXf3LC3k
	SbYGiH+DDl3edyR7RMmVJsEeD6k
X-Received: by 2002:a05:600c:3b9f:b0:465:a51d:d4 with SMTP id 5b1f17b1804b1-483c9ba7e4dmr28472135e9.6.1772184643076;
        Fri, 27 Feb 2026 01:30:43 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa0054865075f82f42ae.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:5486:5075:f82f:42ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb789efsm99991915e9.2.2026.02.27.01.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 01:30:42 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][kirkstone 00/38] Pull request (cover letter only)
Date: Fri, 27 Feb 2026 10:30:40 +0100
Message-ID: <cover.1772184444.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 09:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232091

Those are the patches from the last patch review:
https://lore.kernel.org/openembedded-core/cover.1771942869.git.yoann.congal@smile.fr/T/#t

Passed a-full on autobuilder (no change since patch review request):
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3274

The following changes since commit e2994ca0076ec99038790e7a40936236a5078135:

  build-appliance-image: Update to kirkstone head revision (2026-01-26 18:54:26 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Aleksandar Nikolic (1):
  scripts/install-buildtools: Update to 4.0.32

Amaury Couderc (2):
  avahi: patch CVE-2025-68468
  avahi: patch CVE-2025-68471

Ankur Tyagi (2):
  avahi: patch CVE-2025-68276
  avahi: patch CVE-2026-24401

Bruce Ashfield (5):
  linux-yocto/5.15: update to v5.15.195
  linux-yocto/5.15: update to v5.15.196
  linux-yocto/5.15: update to v5.15.197
  linux-yocto/5.15: update to v5.15.198
  linux-yocto/5.15: update to v5.15.199

Fabio Berton (1):
  classes/buildhistory: Do not sign buildhistory commits

Hugo SIMELIERE (1):
  libtasn1: Fix CVE-2025-13151

Peter Marko (20):
  zlib: ignore CVE-2026-22184
  python3: patch CVE-2025-13837
  python3: patch CVE-2025-12084
  libxml2: patch CVE-2026-0990
  libxml2: patch CVE-2026-0992
  libxml2: add follow-up patch for CVE-2026-0992
  expat: patch CVE-2026-24515
  expat: patch CVE-2026-25210
  inetutils: patch CVE-2026-24061
  libpng: patch CVE-2026-22695
  libpng: patch CVE-2026-22801
  libpng: patch CVE-2026-25646
  glib-2.0: patch CVE-2026-0988
  glib-2.0: patch CVE-2026-1484
  glib-2.0: patch CVE-2026-1485
  glib-2.0: patch CVE-2026-1489
  ffmpeg: set status of CVE-2025-25468 and CVE-2025-25469
  vim: ignore CVE-2025-66476
  harfbuzz: ignore CVE-2026-22693
  glibc: stable 2.35 branch updates

Richard Purdie (2):
  pseudo: Update to 1.9.3 release
  pseudo: Update to include an openat2 fix

Scott Murray (1):
  u-boot: move CVE patch out of u-boot-common.inc

Vijay Anusuri (2):
  openssl: upgrade 3.0.18 -> 3.0.19
  bind: Upgrade 9.18.41 -> 9.18.44

Yoann Congal (1):
  pseudo: Update to include a fix for systems with kernel <5.6

 meta/classes/buildhistory.bbclass             |   2 +-
 meta/recipes-bsp/u-boot/u-boot-common.inc     |   4 +-
 meta/recipes-bsp/u-boot/u-boot_2022.01.bb     |   1 +
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   4 +
 .../avahi/files/CVE-2025-68276.patch          |  65 ++++
 .../avahi/files/CVE-2025-68468.patch          |  32 ++
 .../avahi/files/CVE-2025-68471.patch          |  36 ++
 .../avahi/files/CVE-2026-24401.patch          |  74 ++++
 .../bind/{bind_9.18.41.bb => bind_9.18.44.bb} |   2 +-
 .../inetutils/CVE-2026-24061-01.patch         |  38 ++
 .../inetutils/CVE-2026-24061-02.patch         |  82 +++++
 .../inetutils/inetutils_2.2.bb                |   2 +
 .../openssl/openssl/CVE-2023-50781-1.patch    |  46 ++-
 .../openssl/openssl/CVE-2023-50781-2.patch    | 112 +++---
 .../openssl/openssl/CVE-2023-50781-3.patch    |  16 +-
 .../{openssl_3.0.18.bb => openssl_3.0.19.bb}  |   2 +-
 .../expat/expat/CVE-2026-24515.patch          |  43 +++
 .../expat/expat/CVE-2026-25210-01.patch       |  27 ++
 .../expat/expat/CVE-2026-25210-02.patch       |  37 ++
 .../expat/expat/CVE-2026-25210-03.patch       |  28 ++
 meta/recipes-core/expat/expat_2.5.0.bb        |   4 +
 .../glib-2.0/glib-2.0/CVE-2026-0988.patch     |  58 ++++
 .../glib-2.0/glib-2.0/CVE-2026-1484-01.patch  |  48 +++
 .../glib-2.0/glib-2.0/CVE-2026-1484-02.patch  |  45 +++
 .../glib-2.0/glib-2.0/CVE-2026-1485.patch     |  44 +++
 .../glib-2.0/glib-2.0/CVE-2026-1489-01.patch  |  42 +++
 .../glib-2.0/glib-2.0/CVE-2026-1489-02.patch  |  30 ++
 .../glib-2.0/glib-2.0/CVE-2026-1489-03.patch  | 290 ++++++++++++++++
 .../glib-2.0/glib-2.0/CVE-2026-1489-04.patch  |  68 ++++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |   8 +
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 meta/recipes-core/glibc/glibc_2.35.bb         |   3 +-
 .../libxml/libxml2/CVE-2026-0990.patch        |  76 ++++
 .../libxml/libxml2/CVE-2026-0992-01.patch     |  49 +++
 .../libxml/libxml2/CVE-2026-0992-02.patch     | 325 ++++++++++++++++++
 .../libxml/libxml2/CVE-2026-0992-03.patch     |  33 ++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |   4 +
 meta/recipes-core/zlib/zlib_1.2.11.bb         |   2 +
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   4 +-
 .../python/python3/CVE-2025-12084.patch       | 171 +++++++++
 .../python/python3/CVE-2025-13837.patch       | 162 +++++++++
 .../python/python3_3.10.19.bb                 |   2 +
 .../harfbuzz/harfbuzz_4.0.1.bb                |   3 +
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.3.bb |   5 +
 .../libpng/files/CVE-2026-22695.patch         |  77 +++++
 .../libpng/files/CVE-2026-22801.patch         | 164 +++++++++
 .../libpng/files/CVE-2026-25646.patch         |  61 ++++
 .../libpng/libpng_1.6.39.bb                   |   3 +
 .../gnutls/libtasn1/CVE-2025-13151.patch      |  30 ++
 .../recipes-support/gnutls/libtasn1_4.20.0.bb |   1 +
 meta/recipes-support/vim/vim_9.1.bb           |   3 +
 scripts/install-buildtools                    |   4 +-
 55 files changed, 2391 insertions(+), 121 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68276.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68468.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2025-68471.patch
 create mode 100644 meta/recipes-connectivity/avahi/files/CVE-2026-24401.patch
 rename meta/recipes-connectivity/bind/{bind_9.18.41.bb => bind_9.18.44.bb} (97%)
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-01.patch
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2026-24061-02.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.0.18.bb => openssl_3.0.19.bb} (99%)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-24515.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-25210-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-25210-02.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-25210-03.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-0988.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1484-02.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1485.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-02.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-03.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-1489-04.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992-01.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992-02.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0992-03.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-12084.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-13837.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-22695.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-22801.patch
 create mode 100644 meta/recipes-multimedia/libpng/files/CVE-2026-25646.patch
 create mode 100644 meta/recipes-support/gnutls/libtasn1/CVE-2025-13151.patch



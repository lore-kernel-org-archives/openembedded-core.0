Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 724B9E9B26F
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:25:00 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21451.1771943095874433514
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:24:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mRUDU1Ps;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso48932975e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943094; x=1772547894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mJoH9LNqRe99UcEp74/Airk14BGjRDbLIQl+37+aaDA=;
        b=mRUDU1Psh+fRsRitXsaz+ahAg8tAHgg+ujyK6JdBlN46Sk7HMENz6t/ofxzphOw+eF
         PCaY5Y6e3BCtjRHLEE8WStikmtPKQQ8mdJwadxMqPFr8JbgUJnjsSfSNakUoW5f8nMJd
         A4EnQjAA9s2ilUyd55hKsIqQIefs9WhwUw5t4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943094; x=1772547894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mJoH9LNqRe99UcEp74/Airk14BGjRDbLIQl+37+aaDA=;
        b=h1QJ1tkcxGW+CfYWnvrH0tgxD4WXohpTyztp2XZoUnO93Q5+y/DqT5P3yhHVbnpC0W
         q110ScdfL+MZ6j5YXOOyf3JeaGtQPCPNa3AApzGfPO582oWlsyc02eLPqFZdWYDsEUSD
         r5lWXB06Ct00NlzCisnfg8lcEfN7siruPMfErT1tLpkefq4z0+zRQLtD5ZsGGFf4TISx
         E/57F3qh+4gkm5EAxr/q1UKdRsnm6jY3/nbEpx9p2EHSm/hR4UOki1BvpaZfS8L+efI+
         jCHL5Ukmt2COa6ROj4Kt047pk6m5hSqwzOnnh1c82hcObTTibpuUGg6h47KL2dWZtOvj
         nDfw==
X-Gm-Message-State: AOJu0YzN90FH1NUPOxKCu0WOYWtschqz0uWQMzKa6oIdIzAb2WmwZhPF
	DsPmAKc03hrVM8qEyv6UbbL4C0xBZQvzCR/y0CdSl2TMwukRr7PcGcIJQzsLlyUiDb5LO4GMTRr
	UL5++
X-Gm-Gg: AZuq6aLchV7GdXwjjd9eHBS7FQ8SzrICq8VVuPg0ZWJMNEOfmOyIW43o0+RkmcV7n9A
	TqPxLulfJZkId7wo/l2Nl5vbzfrP97c9BeXGgyMrM8t2o2G4dWH0xnmbuR8CissZrXa7Rw5+STX
	gjjHwqgG/Q8Drv9x3MidinNeeQGWrR8v/cS0+RzhdG/c2hvha65JeIxqOo0BgLW9r+/9aIt2NXR
	mnLqgi2cYyerZDA9JwqQyiuQXho0vOwna2pqffkxSMhxUAfzq81+eq9gFrqhI/VSxf6I7k/k+CM
	voziv4i6/IIfH0iNkMxd/2dM918yZnaRPM+6/Zw/z1TrM03QkgtOI3rcmgYdD0IP6koUaYzLXZR
	ywG2mqOe52kuzkkmNBQhzBrZ8YBTqOUVTh2vzfTk/lt/Ko94fo9fkWtdEVySW2HEDN6aQ2eD0tD
	zH61jRNpGGv+6hM8oeod2QjfdYnMpiJK/300JoH7X9XB0smQ9m6P9PgcPwPIGjTdV0/6K55+dqZ
	uPceifO7nKTmUl4LnfloJdfIJ4FI6Iu2A==
X-Received: by 2002:a05:600c:3516:b0:480:2521:4d92 with SMTP id 5b1f17b1804b1-483a96377c9mr206144955e9.24.1771943093647;
        Tue, 24 Feb 2026 06:24:53 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7507adsm2047455e9.9.2026.02.24.06.24.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:24:53 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/38] Patch review
Date: Tue, 24 Feb 2026 15:23:52 +0100
Message-ID: <cover.1771942869.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:25:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231766

Please review this set of changes for kirkstone and have comments back by
end of day Thursday, February 26.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3274

The following changes since commit e2994ca0076ec99038790e7a40936236a5078135:

  build-appliance-image: Update to kirkstone head revision (2026-01-26 18:54:26 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

for you to fetch changes up to fd883ff6432946d23d923a9be1cd2cb1f001c732:

  u-boot: move CVE patch out of u-boot-common.inc (2026-02-23 23:57:02 +0100)

----------------------------------------------------------------

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



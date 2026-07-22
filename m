Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0459BC44532
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 17:14:10 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5252.1784740442979520353
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 10:14:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HXIs8JCF;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4758bd3731bso5090435f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784740441; x=1785345241; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4epSOlCR0xpyYIwQ5fzQcDWjCs9/ReMV7i6m8J9LkXo=;
        b=HXIs8JCF5ZuZRsi/CnH7T6nfqTo10JX706idxKOx4NaO7Og4AKOuyE19US6rftFyvT
         je/vLDws+pb0/mPVx+o0692hdo+HWEgCqcT0blQs24xsbTbF4VyCmyPqz2EtVrHXDCWA
         X7/hzRSlJ5LO6LQcUNL0jzxEloehiz89hGYrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784740441; x=1785345241;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4epSOlCR0xpyYIwQ5fzQcDWjCs9/ReMV7i6m8J9LkXo=;
        b=ZNftkGQ6Ti6wnh0DtrBvjw9T6aiXq11Z435fP6Rt6rw+pjO5PcAC+L0mXmeCL5FeQA
         VVKGXkeZTP811ddP8m5jsCcie3Ktlq8memkMJAzr7Q43AMo33sGF5fdl7d+ahhFeejNN
         /NCaTFbfYs5IVXFm5G72XwCCj0hlrgRkdKMo0bvRLxcf82CEW+MbDVb5OTnVQETtU6RN
         OHTY1h1PDwDi2NfOO/yGQfWKoOUqGHSRWThf2/ktxYlOhds4hnm8W0f6u+VFkO5BMwrU
         R2D5ksop8fxi1oWQPoQKZaXJm/6hfKVYBRakFBh9NVCtGm0XJVSFb2cUjbiSLU+BBZlC
         uf9g==
X-Gm-Message-State: AOJu0YxYHH8Lhfpz1WaB2rl506aIlvq+bF29JzR4YfgQrY7Mkgo2FpdH
	bogRjKWttmvO3+9ZgVp8iUkxjZMEFdZkq8pEf2L1Rp7ACEt5+cmofbNpkVYlzUAqrpvGP5YM0aS
	IdDBBeTw=
X-Gm-Gg: AR+sD13Bn0qw8ZFayzcwh915ztHDWTyaYu836xrVwSTpgM/AsWVrRqZJyMNvRhi+6tC
	U9UaCDD4gkQUrQ8vkozWYCfDen46ZTtIvssQRwbju0SMwvB+FUPBqDzAOLn6FqrbUSgRvqKKZxq
	uQcRgoU848YkEDncBZUhh/eksT6tgwJ+0whgns0Op5TqnD0KlzjuVv7AQQD4I/dCRwiU1rhkS8D
	7F8mmx7pq5hrQW/XtRZR2xDZXIYAJuogSGgkWu6hCbrolqYw6nfhnS5o3Pf5Dmce/ASmUZtNVT7
	s9i7d+KL1GSrPWSzJwNZlxZ73ro/cSwtQp/DmwmKwmmC3hWPQSVTk2lDvR+bx0vBGC+ebTxuqpA
	riHL8Cck/MiOTaJk8nG7qg1HRQdledbP4fU3ijgB0raupY27Mk7rwHBRvlVAj2zQeZ28rRKTDOF
	qPfiZqVi6bAio+3oWYAKcYLmR6haL++XCOIbO/3J+YKIk6caOiu+PaWIGjr8VRTYVkOZlEjopHo
	HV5jg5tthFO
X-Received: by 2002:a5d:64cf:0:b0:47d:f437:beef with SMTP id ffacd0b85a97d-47f840d8765mr6263857f8f.25.1784740441019;
        Wed, 22 Jul 2026 10:14:01 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6287csm8204069f8f.25.2026.07.22.10.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:14:00 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 00/31] Pull request (cover letter only)
Date: Wed, 22 Jul 2026 19:13:43 +0200
Message-ID: <cover.1784740104.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 17:14:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241709

Those are the patches from the last patch review:
https://lore.kernel.org/all/cover.1784567958.git.yoann.congal@smile.fr/
Removed 2 patches following review:
* bzip2: fix 'bzip2 --version > /tmp/aaa 2>&1' hang
* dropbear: Disable DSS correctly

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4258
* oe-selftest-armhost, oe-selftest-debian, oe-selftest-fedora failed with
  #15289 – [scarthgap] AB-INT: sstatetests.SStatePrintdiff.test_gcc_runtime_vs_gcc_source failure
  * oe-selftest-fedora rebuilt on isolated sstate/hashserv as
    https://autobuilder.yoctoproject.org/valkyrie/?#/builders/48/builds/4164

The following changes since commit 8aca19cff468c5f15c919c973c46be58e020af46:

  cve-update: Avoid NFS caching issues (2026-07-17 12:05:24 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-next

for you to fetch changes up to 3217490cc554069ae53aa54cf8ad7327ce85fa10:

  glibc-testsuite: Do not generate SPDX (2026-07-21 20:32:51 +0200)

----------------------------------------------------------------

Aleksandar Nikolic (1):
  wic: Fix updating fstab for nvme devices

Ankur Tyagi (3):
  wireless-regdb: upgrade 2026.02.04 -> 2026.03.18
  wireless-regdb: upgrade 2026.03.18 -> 2026.05.30
  ca-certificates: upgrade 20260223 -> 20260601

Ashishkumar Parmar (1):
  bind: Upgrade 9.18.44 -> 9.18.49

Benjamin Robin (Schneider Electric) (4):
  python3: fix CVE-2026-11940
  python3: fix CVE-2026-11972
  python3: fix CVE-2026-9669
  glib-2.0: fix CVE-2026-58016

Deepak Rathore (1):
  util-linux: fix CVE-2026-13595

Eric Meyers (1):
  create-spdx-image-3.0: correct SSTATE_SKIP_CREATION key for
    do_create_image_sbom_spdx

Harish Sadineni (1):
  binutils: Add CVE-2025-69646 to "CVE:" tag

Hitendra Prajapati (1):
  vim: Fix for CVE-2026-52858,CVE-2026-52859,CVE-2026-52860

Hugo SIMELIERE (Schneider Electric) (1):
  libcap: Fix CVE-2026-4878

Jaipaul Cheernam (3):
  glibc: stable 2.39 branch updates
  bzip2: Fix CVE-2026-42250
  gzip: fix CVE-2026-41992

Joshua Watt (1):
  glibc-testsuite: Do not generate SPDX

Kris Gavvala (1):
  python3: skiptest tracemalloc_track_race

Mathieu Dubois-Briand (1):
  python3: Simplify ptest exclusion list

Peter Marko (4):
  socat: patch CVE-2026-56123
  vex: remove obsolete semicolon
  rootfs: move tasks using image_list_installed_packages to
    postuninstall
  expat: patch CVE-2026-41080

Roland Kovacs (2):
  binutils: fix CVE-2025-69649, and CVE-2025-69652
  binutils: fix CVE-2025-69645

Ross Burton (1):
  xmlto: update SRC_URI

Sudhir Dumbhare (2):
  python3-urllib3: fix CVE-2026-44431
  openssh: set status for CVE-2026-3497

Theo Gaige (1):
  expat: patch CVE-2026-45186

Vijay Anusuri (1):
  tzdata/tzcode-native: upgrade 2026b -> 2026c

 .../create-spdx-image-3.0.bbclass             |   2 +-
 meta/classes-recipe/license_image.bbclass     |   2 +-
 meta/classes-recipe/nospdx.bbclass            |   2 +-
 meta/classes/vex.bbclass                      |   2 +-
 .../bind/{bind_9.18.44.bb => bind_9.18.49.bb} |   2 +-
 .../openssh/openssh_9.6p1.bb                  |   1 +
 .../socat/files/CVE-2026-56123.patch          | 150 ++++++
 .../socat/socat_1.8.0.0.bb                    |   1 +
 .../expat/expat/CVE-2026-41080-01.patch       |  50 ++
 .../expat/expat/CVE-2026-41080-02.patch       |  29 ++
 .../expat/expat/CVE-2026-41080-03.patch       | 467 ++++++++++++++++++
 .../expat/expat/CVE-2026-45186-01.patch       |  70 +++
 .../expat/expat/CVE-2026-45186-02.patch       | 318 ++++++++++++
 .../expat/expat/CVE-2026-45186-03.patch       |  46 ++
 .../expat/expat/CVE-2026-45186-04.patch       |  32 ++
 .../expat/expat/CVE-2026-45186-05.patch       |  32 ++
 .../expat/expat/CVE-2026-45186-06.patch       |  87 ++++
 .../expat/expat/CVE-2026-45186-07.patch       |  52 ++
 meta/recipes-core/expat/expat_2.6.4.bb        |  10 +
 .../glib-2.0/glib-2.0/CVE-2026-58016-1.patch  |  94 ++++
 .../glib-2.0/glib-2.0/CVE-2026-58016-2.patch  |  98 ++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |   2 +
 .../glibc/glibc-testsuite_2.39.bb             |   1 +
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 meta/recipes-core/glibc/glibc_2.39.bb         |   3 +-
 meta/recipes-core/util-linux/util-linux.inc   |   1 +
 .../util-linux/CVE-2026-13595.patch           | 157 ++++++
 .../binutils/binutils-2.42.inc                |   3 +
 .../binutils/binutils/CVE-2025-69645.patch    | 135 +++++
 .../binutils/binutils/CVE-2025-69648.patch    |   2 +-
 .../binutils/binutils/CVE-2025-69649.patch    |  44 ++
 .../binutils/binutils/CVE-2025-69652.patch    |  39 ++
 .../python3-urllib3/CVE-2026-44431.patch      | 163 ++++++
 .../python/python3-urllib3_2.2.2.bb           |   1 +
 .../python/python3/CVE-2026-11940.patch       |  66 +++
 .../python/python3/CVE-2026-11972.patch       |  60 +++
 .../python/python3/CVE-2026-9669.patch        |  96 ++++
 .../python/python3_3.12.13.bb                 |  23 +-
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb   |   2 +-
 .../bzip2/bzip2/CVE-2026-42250.patch          |  35 ++
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb    |   1 +
 .../gzip/gzip-1.13/CVE-2026-41992.patch       |  64 +++
 meta/recipes-extended/gzip/gzip_1.13.bb       |   1 +
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 ....02.04.bb => wireless-regdb_2026.05.30.bb} |   2 +-
 ...0260223.bb => ca-certificates_20260601.bb} |   4 +-
 .../libcap/files/CVE-2026-4878.patch          | 164 ++++++
 meta/recipes-support/libcap/libcap_2.69.bb    |   1 +
 .../vim/files/CVE-2026-52858.patch            | 167 +++++++
 .../vim/files/CVE-2026-52859.patch            | 274 ++++++++++
 .../vim/files/CVE-2026-52860.patch            | 446 +++++++++++++++++
 meta/recipes-support/vim/vim.inc              |   3 +
 scripts/lib/wic/plugins/imager/direct.py      |   6 +-
 53 files changed, 3501 insertions(+), 20 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.44.bb => bind_9.18.49.bb} (97%)
 create mode 100644 meta/recipes-connectivity/socat/files/CVE-2026-56123.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-02.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-41080-03.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-02.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-03.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-04.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-05.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-06.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-07.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58016-1.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58016-2.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-13595.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-69645.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-69652.patch
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2026-44431.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-11940.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-11972.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-9669.patch
 create mode 100644 meta/recipes-extended/bzip2/bzip2/CVE-2026-42250.patch
 create mode 100644 meta/recipes-extended/gzip/gzip-1.13/CVE-2026-41992.patch
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2026.02.04.bb => wireless-regdb_2026.05.30.bb} (94%)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20260223.bb => ca-certificates_20260601.bb} (94%)
 create mode 100644 meta/recipes-support/libcap/files/CVE-2026-4878.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-52858.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-52859.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-52860.patch



Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C5FDC44529
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:23:36 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2881.1784568208431942327
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:23:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=LWL23LXT;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso13777975e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784568207; x=1785173007; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4rzw3y5ulAC90t2gVTHW+hi2hdLY4BBo6BevK3ePqI=;
        b=LWL23LXTw/7vCzQXLnbPb+SkAsXStja8MoadSw2oWSmjZdc9J6UVRQT1Uleh6BPI+F
         h6A9YcR1vIU3hoRAgA3mmaPVj22d20g5xNHfw+6S2BLhKBYWmM1LHPiikcYpfVg6Zrs2
         TodyUXXk1Hnc6BH3QbbW2ENUbMyVzX1LkJhzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568207; x=1785173007;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J4rzw3y5ulAC90t2gVTHW+hi2hdLY4BBo6BevK3ePqI=;
        b=FLQZyivgSOmzisHt20UWKgUoRsm61RkqmyfcNJv6WaHn7svNHACcyVCfA5eX8riKd2
         Z44BgYCqfw+CyURo7aNQUUAQTOEWaybY+JLl1TJlIT4wl5t6Gye01Qg5wbS8vGjykxni
         B5anXgvRK+RyCgg8nJbjKLwgAFGe/sMHzFm4jmWgRnJNk6ro4gJiqPbhrr2DE9uTkmgx
         g04AyLdaBSnNe6IAHlkUJRh9xfOzVJPkB1eq79cnbUXQsMO2dHr2QAGKYlHPWUGMPDYJ
         YSdWNDVjp5eBes0dOlqrV4+g2dzJzWzIv0XHanYArH1uOmrfNSlbrE/ALt+CiZt33Ysh
         Mfeg==
X-Gm-Message-State: AOJu0YykNy3HXJvTHLLlhu/4emjSpyzQZKXoMZcSo6zAuZyyCCzVvxK9
	lGqXXOlzGRY855iCltEw8p9K4n8Bg49oejWdPAqf9AYYZHFLRIAGXwTRJtWW4ghvsCwts6sLDZf
	mD5tqoB8=
X-Gm-Gg: AfdE7cm2IdRqR6bFfTAuDJc/k80azHo4/56gBLw/nkIzDRhMqPF4RfbPnT4PcGe7beL
	GC5qqJpGn+vkZI/Fbofbhm30/zTVCGwpHOA2ftAZ5w5idL2RSEDyD8MNu+5of2nBkH7hwoowAEB
	1yE1gm4Pp6XXDpG+KLan8emgPTMvNbJwby9ymEFaiQBIxod9tkHov/iZzy3l+LJaiMLOrlcbtJh
	+s3eV1xMcQK25Ykls/7V270rCdWpIWHYy7jz33EWT9yryQdvxuVLsbtasBFbwsBWnAn8JDwwLHI
	6c2oVKlGf9bVc5tIeCXC5kpf1Ubgs5Fu/r9LtceJfLbWRm90cl+BSSveWoQCspbuwebL9xqDSVb
	W8PZXML6YHEiANOtbWoVew78AgjUQ3ss4LL1e2RrjqSiy+DNZm1SBEbVzmsd90Wt5V+gJSBU8wc
	DqdeCfON72OlkmCGjPc6tBbNXbzd4NVKH7+0/Zw50bjylCnYuks3ALhv87Aq1gZ+y5vaNtBrFBK
	+rjTWbhG18wmvXJn20=
X-Received: by 2002:a05:600c:1f82:b0:495:607e:5ee7 with SMTP id 5b1f17b1804b1-495607e635amr43157655e9.17.1784568206326;
        Mon, 20 Jul 2026 10:23:26 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-b501-5b7b-2580-caa3-ecc1-dea5.rev.sfr.net. [2a02:8440:b501:5b7b:2580:caa3:ecc1:dea5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563eee22esm36508575e9.1.2026.07.20.10.23.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:23:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/33] Patch review
Date: Mon, 20 Jul 2026 19:22:33 +0200
Message-ID: <cover.1784567958.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:23:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241434

Please review this set of changes for scarthgap and have comments back by
end of day Wednesday, July 22.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4248
oe-selftest-armhost, oe-selftest-debian and oe-selftest-fedora failed
with 15289 – [scarthgap] AB-INT: sstatetests.SStatePrintdiff.test_gcc_runtime_vs_gcc_source failure
oe-selftest-debian was rebuilt on a isolated sstate/hashserv here:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/35/builds/4333

The following changes since commit 8aca19cff468c5f15c919c973c46be58e020af46:

  cve-update: Avoid NFS caching issues (2026-07-17 12:05:24 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

for you to fetch changes up to 9a7f92f2dce94876fa63ce8625d53444a9a706aa:

  glibc-testsuite: Do not generate SPDX (2026-07-20 13:50:16 +0200)

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

Hongxu Jia (1):
  bzip2: fix 'bzip2 --version > /tmp/aaa 2>&1' hang

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

Mike Crowe (1):
  dropbear: Disable DSS correctly

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
 ...PBEAR_DSS-is-only-forced-for-fuzzing.patch |  30 ++
 .../recipes-core/dropbear/dropbear_2022.83.bb |   1 +
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
 ...-fix-bzip2-version-tmp-aaa-will-hang.patch |  62 +++
 .../bzip2/bzip2/CVE-2026-42250.patch          |  35 ++
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb    |   2 +
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
 56 files changed, 3595 insertions(+), 20 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.18.44.bb => bind_9.18.49.bb} (97%)
 create mode 100644 meta/recipes-connectivity/socat/files/CVE-2026-56123.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/0001-Fix-so-DROPBEAR_DSS-is-only-forced-for-fuzzing.patch
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
 create mode 100644 meta/recipes-extended/bzip2/bzip2/0001-fix-bzip2-version-tmp-aaa-will-hang.patch
 create mode 100644 meta/recipes-extended/bzip2/bzip2/CVE-2026-42250.patch
 create mode 100644 meta/recipes-extended/gzip/gzip-1.13/CVE-2026-41992.patch
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2026.02.04.bb => wireless-regdb_2026.05.30.bb} (94%)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20260223.bb => ca-certificates_20260601.bb} (94%)
 create mode 100644 meta/recipes-support/libcap/files/CVE-2026-4878.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-52858.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-52859.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-52860.patch



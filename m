Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 593E6D74EFC
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 16:23:49 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.135.1769185426714061259
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jan 2026 08:23:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=AbCa3TTe;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so2121741f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 08:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769185425; x=1769790225; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s7GR+1ChrBu8LH5hqFnd+HXTJnxB0+y36/UPh2zId9E=;
        b=AbCa3TTesBX03zovMi2PGr3LzbwCay8mP+vioeIcMdjXhUddjBVLx6UTsxFHVFVdj1
         XOfkMoI7aM344d935S34S+8n7p+HwJbvJ4HJ6nQGBod3NqxXMNY10dwJBRVCJkd7T5j+
         i+c+3Gy002fTHHLx9TMKnNeZ1xrFpneafNj08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769185425; x=1769790225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7GR+1ChrBu8LH5hqFnd+HXTJnxB0+y36/UPh2zId9E=;
        b=Zao23IvZajpJYsvmJwP43tpGNgKkX4YMXapBQA2fxdvJ8XuUfqSukdnbqSXnHyTyde
         q5VHBCzhLEvqEt0CAHi5qu8/mAQ+CMkExly7kMLaaXbUvV/jRJQhSd/P3vSvGzHjS+kt
         jaaEWBJBjQPRlz7Gxa7rm5Z9zuJx+M2SCt2UY5an5n0k+jJxNoLlfyc8oxqT0DiIeYVb
         yFDcIeucr6lDklg6sbAZU7b0QUUEi+D2/ifBqTpC32z5oYm+86S08kICTnJQOJ0e8viL
         wX58fTwMEfyPSMuIcce4qE5Wa+5wroK8KgHMBrGAI/2P5C389xS3rA6rnjOlBZmpYs0S
         FdXg==
X-Gm-Message-State: AOJu0YzRtU17Tt4ix81dmI6VU4gH7zrsk7dFjDY7Sks8hCa2eMvitmg0
	HpSMfX9bcqtTBkGUMovq7RBjRZ2Uew5yd66qzY5JiOYHuXfguKwa+46GHAUEM8yOyOKOUeTljPr
	czaA9f8s=
X-Gm-Gg: AZuq6aIwSjnYic2z5T0PGwliRc4XRt/fjgBMigD+mvQZL/x3z0OQiwN8CYQ6daGdxSi
	ji8igxMp+SGqF/gie+vGGNJLbEf6jNIdnle/hk0i73Ubp/vuzxClvopkc9C5ym9O1jxhXEm99hj
	jAGEXeRM2TQICDtyC+r40p14JRwKqZPXVc4nDBdwdtxUWR7BVC1IWyJwTFXRryiwXTaJvt9YhW+
	qkxjANaLMNWVcspPgj2ak4Caj2yse249dOfg+jEHiNXZKjq9jCvM73sy6UNBwsW/EWIK4YV/28I
	MBqUhHwILYnK/7DKTA/aVq7/cRftilqrvwrvLZkRmauzL0tsOPu6303bpmnLelvOiql7iQrQUaj
	UiE0LeDyJEl2CBTmR/Bb0Mt4467eH1rI2v0b4PSxhNbHRtH/c0kIw3iRjaRoLG1BEUpBBIFADO8
	b0MLKDt8hPIgSvDTSJ5NB74uvfq2yb1IHC7A6TPaBSKQTy9Vih/GL9O5Y88Pha0BjW4l5Pq5IQJ
	dK7Zt3K9K0XiNQ=
X-Received: by 2002:a05:6000:40c9:b0:430:f7dc:7e96 with SMTP id ffacd0b85a97d-435b1604f5cmr6388314f8f.48.1769185424554;
        Fri, 23 Jan 2026 08:23:44 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f742d6sm7476454f8f.30.2026.01.23.08.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 08:23:44 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][kirkstone 00/26] Pull request (cover letter only)
Date: Fri, 23 Jan 2026 17:23:11 +0100
Message-ID: <cover.1769184700.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 16:23:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229896

Those are the patches from the last patch review:
https://lore.kernel.org/openembedded-core/cover.1768914702.git.yoann.congal@smile.fr/
... with the v2 of "python3-urllib3: patch CVE-2025-66418".

Note: this PR has patchs related to the whinlatter PR:
https://lore.kernel.org/openembedded-core/cover.1769175900.git.yoann.congal@smile.fr/
And the scarthgap PR:
https://lore.kernel.org/openembedded-core/cover.1769177912.git.yoann.congal@smile.fr/

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3114
via https://git.yoctoproject.org/poky-contrib/commit/?h=stable/kirkstone-nut&id=323236258711d8f3110c5a3ab1f001f3251d0e03

The following changes since commit 0057fc49725db8637656fac10631d8f89799bad3:

  go: Fix CVE-2025-61729 (2025-12-29 08:48:27 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

for you to fetch changes up to 1ce772b2fd97d2e8364a602fdd313355f2df967e:

  oeqa: Use 2.14 release of cpio instead of 2.13 (2026-01-20 15:39:51 +0100)

----------------------------------------------------------------

Hitendra Prajapati (1):
  python3: fix CVE-2025-13836

Khem Raj (1):
  oeqa: Use 2.14 release of cpio instead of 2.13

Paul Barker (1):
  pseudo: Add hard sstate dependencies for pseudo-native

Peter Marko (17):
  util-linux: patch CVE-2025-14104
  glib-2.0: patch CVE-2025-13601
  glib-2.0: patch CVE-2025-14087
  glib-2.0: patch CVE-2025-14512
  qemu: ignore CVE-2025-54566 and CVE-2025-54567
  cups: patch CVE-2025-58436
  cups: patch CVE-2025-61915
  cups: allow unknown directives in conf files
  dropbear: patch CVE-2019-6111
  python3-urllib3: patch CVE-2025-66418
  libpcap: patch CVE-2025-11961
  libpcap: patch CVE-2025-11964
  libarchive: fix CVE-2025-60753 regression
  curl: patch CVE-2025-14017
  curl: patch CVE-2025-15079
  curl: patch CVE-2025-15224
  gnupg: patch CVE-2025-68973

Richard Purdie (4):
  pseudo: Upgrade to version 1.9.1
  pseudo: Update to pull in memleak fix
  pseudo: Update to pull in openat2 and efault return code changes
  pseudo: Update to pull in 'makewrappers: Fix EFAULT implementation'

Robert Yang (1):
  pseudo: 1.9.0 -> 1.9.2

Vijay Anusuri (1):
  binutils: Fix CVE-2025-1181

 meta/lib/oeqa/runtime/cases/buildcpio.py      |   2 +-
 meta/lib/oeqa/sdk/cases/buildcpio.py          |   4 +-
 meta/lib/oeqa/selftest/cases/meta_ide.py      |   2 +-
 .../libpcap/libpcap/CVE-2025-11961-01.patch   |  38 ++
 .../libpcap/libpcap/CVE-2025-11961-02.patch   | 433 ++++++++++++
 .../libpcap/libpcap/CVE-2025-11964.patch      |  33 +
 .../libpcap/libpcap_1.10.1.bb                 |   3 +
 meta/recipes-core/dropbear/dropbear.inc       |   1 +
 .../dropbear/dropbear/CVE-2019-6111.patch     | 157 +++++
 .../glib-2.0/glib-2.0/CVE-2025-13601-01.patch | 125 ++++
 .../glib-2.0/glib-2.0/CVE-2025-13601-02.patch | 128 ++++
 .../glib-2.0/glib-2.0/CVE-2025-14087-01.patch |  69 ++
 .../glib-2.0/glib-2.0/CVE-2025-14087-02.patch | 240 +++++++
 .../glib-2.0/glib-2.0/CVE-2025-14087-03.patch | 150 +++++
 .../glib-2.0/glib-2.0/CVE-2025-14512.patch    |  70 ++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |   6 +
 meta/recipes-core/util-linux/util-linux.inc   |   2 +
 .../util-linux/CVE-2025-14104-01.patch        |  33 +
 .../util-linux/CVE-2025-14104-02.patch        |  28 +
 .../binutils/binutils-2.38.inc                |   2 +
 .../binutils/binutils/CVE-2025-1181-pre.patch | 149 +++++
 .../binutils/binutils/CVE-2025-1181.patch     | 342 ++++++++++
 .../0001-configure-Prune-PIE-flags.patch      |  44 --
 .../pseudo/files/glibc238.patch               |  65 --
 .../pseudo/files/older-glibc-symbols.patch    |   4 +-
 meta/recipes-devtools/pseudo/pseudo.inc       |   7 +
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   6 +-
 .../python3-urllib3/CVE-2025-66418.patch      |  74 ++
 .../python/python3-urllib3_1.26.20.bb         |   1 +
 .../python/python3/CVE-2025-13836.patch       | 163 +++++
 .../python/python3_3.10.19.bb                 |   1 +
 meta/recipes-devtools/qemu/qemu.inc           |   3 +
 meta/recipes-extended/cups/cups.inc           |   3 +
 ...pping-scheduler-on-unknown-directive.patch |  43 ++
 .../cups/cups/CVE-2025-58436.patch            | 630 ++++++++++++++++++
 .../cups/cups/CVE-2025-61915.patch            | 487 ++++++++++++++
 ...25-60753.patch => CVE-2025-60753-01.patch} |   0
 .../libarchive/CVE-2025-60753-02.patch        |  46 ++
 .../libarchive/libarchive_3.6.2.bb            |   3 +-
 .../curl/curl/CVE-2025-14017.patch            | 115 ++++
 .../curl/curl/CVE-2025-15079.patch            |  32 +
 .../curl/curl/CVE-2025-15224.patch            |  31 +
 meta/recipes-support/curl/curl_7.82.0.bb      |   3 +
 .../gnupg/gnupg/CVE-2025-68973.patch          | 108 +++
 meta/recipes-support/gnupg/gnupg_2.3.7.bb     |   1 +
 45 files changed, 3767 insertions(+), 120 deletions(-)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11961-01.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11961-02.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/CVE-2025-11964.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2019-6111.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-13601-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-13601-02.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14087-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14087-02.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14087-03.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14512.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2025-14104-01.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2025-14104-02.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1181-pre.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1181.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/0001-configure-Prune-PIE-flags.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/glibc238.patch
 create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2025-66418.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-13836.patch
 create mode 100644 meta/recipes-extended/cups/cups/0001-conf.c-Fix-stopping-scheduler-on-unknown-directive.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2025-58436.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2025-61915.patch
 rename meta/recipes-extended/libarchive/libarchive/{CVE-2025-60753.patch => CVE-2025-60753-01.patch} (100%)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-60753-02.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14017.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-15079.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-15224.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2025-68973.patch



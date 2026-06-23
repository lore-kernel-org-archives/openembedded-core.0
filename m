Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85DAFCDE004
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 13:14:36 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20829.1782220467197526341
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 06:14:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QgdMxVTx;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso57944915e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 06:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782220465; x=1782825265; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VyjBCBVZwJxEwkOK1jLGYZ03fIj++LAdnqejw8qPf+8=;
        b=QgdMxVTxxqLjRc/SvmZvbdgV9bW/3sk1Dngrx71F/WaJQYjRVfJI/9U2zhWgUgJtVH
         f6a0oBI+QYMXwfl4yYyyn2u1ox43oHrH3k5+AMtQ0CxtTaQgDCCO14hFPgO9DNoClzpg
         ngvD8sUieo40Oq0MU+/1M3lft8ucvV+eGzNiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782220465; x=1782825265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VyjBCBVZwJxEwkOK1jLGYZ03fIj++LAdnqejw8qPf+8=;
        b=Z3EaBqP16zrFQTvGCkGiXZkeR4ZK6q+MgP5zCDkZKUxeY6JNkY1oqt88nSbcTVa0tj
         UFqBXmXd7gwyrYJdHWlAQJ1y0DV2Us1IBbQ8qZGDqhEJHLcFqRPHv6Z4PA/rA0t6KHU6
         IGVAsLBOgBmQ3CmqxrWHr8zbN4fm7sH3oRs9VPZi5+nFPLoVxCdu0Dh2EefAk2EG88Ho
         FgCHqX7Lw+I6nk2Jr1g/TSZ4zjGKnjSrWwNalvwN5JhGL5d4ClTnv0WDP65d4SvaPro6
         VD8FyvPb1FS9obH9msvmHiShJzoMVXkFSMJj+qr8QF9brQBtqb6TlOp4ajUMEHKet+53
         oO5g==
X-Gm-Message-State: AOJu0Ywc1TragXxB0it/f94M+zHxA5LT9ji0+kZ7s7TL9VERq92yfMii
	0Swbpg8FlnL82bMZ1NEhvI6bgiqrKAB8rRTXPKq4hpcb1IVg+oU/cQq/llQ3N4ousTToKybb5em
	ZbLa+
X-Gm-Gg: AfdE7clIU9Z5HOSNetOVFvT0cEPrwW95qBMLMsykhvf1y4gJ5FXms3JbPZluw0AlT3X
	SGYEXkONsVll4Gvc/LfoOnGwBNqzr3Vr+VkKNKTJVZWnchnxux4nd94XWiE0O3vzw+HhMr6G1Ex
	x7RCBhOjlQOWD8t/517+CPHJKD6cfB0ViwWYwyCbllTesJGYpW3YTN8CfVjhSuk28sVdMu6YKp6
	X+Ri/MGgXkGC6QjbHh9Qds3yqhPIgFv0PYW94r+JdFPGbOmoavky7YCu70cwHCLot0JTOEEx7hs
	NrZUZRpqpP+aHoH7ep2CIuxppp3D2fiUWprE142h9vGLaQCpqZldHVfRjvyGPl6za3/6bpxsSd8
	cimmiW5XaE45b1YXemKGYRzrPsXHoaBzlm0cDIwc3PmsdGBSsXgCb2Zb+F/q4PYh/58F/tMIPPD
	hl1hCGU/WkR1/yqty+UyTR+9f3n60RGuG/KuLQ3CBPrW95vEJsAo9jT0+Djhyk/kzoOi95O2Saq
	9gut548JhDWqZ67Ug==
X-Received: by 2002:a05:600d:4448:20b0:491:9969:739d with SMTP id 5b1f17b1804b1-4925b3b96f5mr32879625e9.29.1782220465066;
        Tue, 23 Jun 2026 06:14:25 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa008234f3c115adbb1a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:8234:f3c1:15ad:bb1a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4925d013a69sm24334285e9.3.2026.06.23.06.14.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:14:24 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/26] Patch review
Date: Tue, 23 Jun 2026 15:13:41 +0200
Message-ID: <cover.1782220259.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 13:14:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239366

Please review this set of changes for scarthgap and have comments back by
end of day Thursday, June 25.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4064
* oe-selftest-armhost failed with 15560 – Corrupt sqlite database in CVE updates
  retried in https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4185

The following changes since commit d4950d6df0867dcd5c380d83ac4d138ec968e698:

  python_setuptools_build_meta: clean the build directory in configure (2026-06-17 01:09:26 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-review
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-review

for you to fetch changes up to 8c56e85dd02063da5630c9b73fb242686a970e20:

  rust,libstd-rs: set status for CVE-2024-3566 (2026-06-23 09:21:53 +0200)

----------------------------------------------------------------

Adarsh Jagadish Kamini (3):
  openssh: fix CVE-2026-35386
  libsolv: fix CVE-2026-9150
  python3: CVE-2026-3087 not applicable

Deepak Rathore (2):
  binutils: Fix CVE-2025-69644
  qemu: Fix CVE-2024-6519

Himanshu Jadon (2):
  apr-util: Add CVE_PRODUCT to support product name
  apr: Add CVE_PRODUCT to support product name

Hitendra Prajapati (1):
  libinput: fix for CVE-2026-50292

Jonas Munsin (1):
  bzip2: set CVE_PRODUCT

Mark Hatle (1):
  pseudo: Update to version 1.9.8

Naman Jain (1):
  tiff: fix CVE-2026-4775

Peter Marko (1):
  openssl: upgrade 3.5.6 -> 3.5.7

Ross Burton (2):
  oeqa/core/runner: stub addDuration in OETestResult
  classes/gtk-icon-cache: fix libdir passed to the postrm intercept

Shubham Pushpkar (1):
  dpkg: Fix CVE-2026-2219

Sudhir Dumbhare (10):
  go: fix CVE-2025-58183
  go: fix CVE-2026-25679
  go: fix CVE-2026-32288
  python3: Fix CVE-2026-3644 and CVE-2026-0672
  python3: Fix CVE-2026-4519 and CVE-2026-4786
  python3: Fix CVE-2026-6019
  python3: Fix CVE-2025-13462
  go-binary-native: set status for CVE-2026-39836
  go: set status for CVE-2026-39836
  rust,libstd-rs: set status for CVE-2024-3566

Yoann Congal (1):
  gdb: backport a patch to fix static_assert in recent GCC

 meta/classes-recipe/gtk-icon-cache.bbclass    |   2 +-
 meta/lib/oeqa/core/runner.py                  |   4 +
 ...ch => CVE-2025-61984_CVE-2026-35386.patch} |   2 +-
 .../openssh/openssh_9.6p1.bb                  |   2 +-
 ...1-Configure-do-not-tweak-mips-cflags.patch |   2 +-
 .../{openssl_3.5.6.bb => openssl_3.5.7.bb}    |   4 +-
 .../binutils/binutils-2.42.inc                |   2 +-
 ...ch => CVE-2025-69644-CVE-2025-69647.patch} |   3 +-
 .../dpkg/dpkg/CVE-2026-2219.patch             |  47 +++++
 meta/recipes-devtools/dpkg/dpkg_1.22.0.bb     |   1 +
 meta/recipes-devtools/gdb/gdb.inc             |   1 +
 ...gnu23-compatibility-wrt-static_asser.patch |  75 ++++++++
 meta/recipes-devtools/go/go-1.22.12.inc       |   4 +
 .../go/go-binary-native_1.22.12.bb            |   1 +
 .../go/go/CVE-2025-58183.patch                | 107 ++++++++++++
 .../go/go/CVE-2026-25679.patch                |  74 ++++++++
 .../go/go/CVE-2026-32288.patch                | 162 ++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   4 +-
 .../python/python3/CVE-2025-13462.patch       | 142 +++++++++++++++
 .../python3/CVE-2026-3644_CVE-2026-0672.patch | 154 +++++++++++++++++
 .../python3/CVE-2026-4519_CVE-2026-4786.patch |  66 +++++++
 .../python/python3/CVE-2026-4519_p1.patch     | 107 ++++++++++++
 .../python/python3/CVE-2026-4519_p2.patch     | 159 +++++++++++++++++
 .../python/python3/CVE-2026-6019_p1.patch     | 133 ++++++++++++++
 .../python/python3/CVE-2026-6019_p2.patch     | 129 ++++++++++++++
 .../python/python3_3.12.13.bb                 |   8 +
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2024-6519.patch             |  51 ++++++
 meta/recipes-devtools/rust/rust-source.inc    |   1 +
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb    |   2 +
 .../libsolv/libsolv/CVE-2026-9150.patch       |  68 ++++++++
 .../libsolv/libsolv_0.7.28.bb                 |   1 +
 .../wayland/libinput/CVE-2026-50292-01.patch  | 109 ++++++++++++
 .../wayland/libinput/CVE-2026-50292-02.patch  |  99 +++++++++++
 .../wayland/libinput_1.25.0.bb                |   2 +
 .../libtiff/tiff/CVE-2026-4775.patch          |  59 +++++++
 meta/recipes-multimedia/libtiff/tiff_4.6.0.bb |   1 +
 meta/recipes-support/apr/apr-util_1.6.3.bb    |   3 +
 meta/recipes-support/apr/apr_1.7.5.bb         |   3 +
 39 files changed, 1785 insertions(+), 10 deletions(-)
 rename meta/recipes-connectivity/openssh/openssh/{CVE-2025-61984.patch => CVE-2025-61984_CVE-2026-35386.patch} (99%)
 rename meta/recipes-connectivity/openssl/{openssl_3.5.6.bb => openssl_3.5.7.bb} (98%)
 rename meta/recipes-devtools/binutils/binutils/{CVE-2025-69647.patch => CVE-2025-69644-CVE-2025-69647.patch} (96%)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/CVE-2026-2219.patch
 create mode 100644 meta/recipes-devtools/gdb/gdb/0001-opcodes-fix-std-gnu23-compatibility-wrt-static_asser.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-58183.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-25679.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-32288.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-13462.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-3644_CVE-2026-0672.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-4519_CVE-2026-4786.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-4519_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-4519_p2.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-6019_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-6019_p2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2024-6519.patch
 create mode 100644 meta/recipes-extended/libsolv/libsolv/CVE-2026-9150.patch
 create mode 100644 meta/recipes-graphics/wayland/libinput/CVE-2026-50292-01.patch
 create mode 100644 meta/recipes-graphics/wayland/libinput/CVE-2026-50292-02.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2026-4775.patch



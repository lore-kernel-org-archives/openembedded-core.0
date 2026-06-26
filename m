Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C49AECD4F26
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 09:25:02 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31627.1782465893826966664
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 02:24:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XOZDLqhV;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4624c1409c9so490317f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 02:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782465892; x=1783070692; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7zqPq938pERl2C8S0DpDC6CWaojj1+1rVOFIRP9cW/g=;
        b=XOZDLqhVj0yC0La/x2cKfSR4Kh7XFFtu2KBFlv08owIcQYPFzT0KQlnTd+vhZtzlhw
         L1pgE+/Il8Gy6j1KcG00tTrGlzcy51dG8ge733tHqH5SeriCY4QXCWv36/nSRTxBMfsA
         17O67tzyExFPyqlmufEh+94v4QRpjJv7eT13g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782465892; x=1783070692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zqPq938pERl2C8S0DpDC6CWaojj1+1rVOFIRP9cW/g=;
        b=d/4/in0HaeOtoKGo+R2y7V/NQPftNpUNedJ9P7+X5lNHf9ezZLL3AfrlvRoAgHHfS+
         7Z2/ZwCmd6mXb6fy58fH2z8noYpyyf9XIoetSOlrICauecMs2s6ao+X+g4Chpff24Dig
         KrBq0VRrpd/tYdX7VG1huzwhEJVq3ZiLPtJi+3eQQU8q9hYml0K8253A3qk4hyHzS7zL
         gOHU7lTFUPJO2hfq2F1POP/zfFYaGgTUbuPt0Fh1L6l9YNJF8FqOGOvQMU6POW0Ci70i
         gZSFvzonA8NurrZ7EDVk53Pa/Cm3o/zTgdjV1kIOPoF3eGBqOONHpX4p4BeO3zLQDixf
         5GRg==
X-Gm-Message-State: AOJu0Yz8AqE3/Pp6nKTWQkWMuqmdYB5kyABA3AbgF/LIJHFMjvXuLDRF
	XN9rokruNbKFfDrDnuNpOSIauM8xkvXqJATc+DZ/pYR8bAswpaI/hPrlevURLI6vIrSAI0GHL5q
	y7Q6w
X-Gm-Gg: AfdE7cmGJqhQtOhlS4w1QobQgxiJXoTehBhinLiuktMZLEtT68UObzEu3db67xhcjJz
	PWtB1ml97GOa/5jyWE+Au4njuXGPfRIEJ+k6rEZb86Sv4NKfioG0n5eDb01LKQ6vt9TI7w0GEjR
	prG9WSSaMvM1Qi5GRIBhLglNV2AFLOpqqLowq0rkSkHIpoDy3ywbf7A+/GhUcxbD692U/4MLokv
	KOuO4qRsazmgBfJd7Pq0lQfDevVoWJECn7mzRtR9eFETHRvRp8onzm6hvbQuQIMTq1cUk5jOsco
	6opZCxrbw9Tng60ctkqSvt/g6owOV/sVLf0NkH/BmVMEiaAK15rqmwEpPE37br/Dg+WTOeUMxgr
	cK08zVIsg+Zj9pVA903C1uAHXrvOj4eRSJR80HgHsnmJk5BOY6yQo4JeMKufcEfm0acEP2rQMSg
	lw167JnXjRtbge4JhcwIcJeHCob/SXxMYgnkRoW1qjXW2sKmweAQCE7PtMeeMhMDMAU8CK1kEEj
	pIP5kono8EVfJ+1Lg==
X-Received: by 2002:a05:6000:24c2:b0:461:fc84:dbee with SMTP id ffacd0b85a97d-46dbf6dbf8amr9075448f8f.16.1782465891832;
        Fri, 26 Jun 2026 02:24:51 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00dc663d106f146c8c.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:dc66:3d10:6f14:6c8c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46cf775a4f0sm17154147f8f.17.2026.06.26.02.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 02:24:51 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][scarthgap 00/41] Pull request (cover letter only)
Date: Fri, 26 Jun 2026 11:23:53 +0200
Message-ID: <cover.1782465777.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 09:25:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239618

Those are the patches from the last patch review:
https://lore.kernel.org/openembedded-core/cover.1782252148.git.yoann.congal@smile.fr/
(No changes, no comments)

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4070
* oe-selftest-debian failed
  * on a github.com access glitch (I'll report it if that happen again)
  * and a graphical VM: This is on Ubuntu 26.04, not yet officially
    supported, I'll investigate this before the "official" support.
  Retried as https://autobuilder.yoctoproject.org/valkyrie/?#/builders/35/builds/4131

The following changes since commit d4950d6df0867dcd5c380d83ac4d138ec968e698:

  python_setuptools_build_meta: clean the build directory in configure (2026-06-17 01:09:26 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-next

for you to fetch changes up to 737293bead3e7b994347e47f09bc69437479d50c:

  linux-yocto/6.6: address ltp hang (2026-06-23 20:33:35 +0200)

----------------------------------------------------------------

Adarsh Jagadish Kamini (3):
  openssh: fix CVE-2026-35386
  libsolv: fix CVE-2026-9150
  python3: CVE-2026-3087 not applicable

Bruce Ashfield (14):
  oeqa/runtime/parselogs: update pci BAR ignore for kernel 6.10
  linux-yocto/6.6: update to v6.6.129
  linux-yocto/6.6: update to v6.6.130
  linux-yocto/6.6: update to v6.6.132
  linux-yocto/6.6: update to v6.6.134
  linux-yocto/6.6: update to v6.6.135
  linux-yocto/6.6: update to v6.6.136
  linux-yocto/6.6: update to v6.6.137
  linux-yocto/6.6: update to v6.6.138
  linux-yocto/6.6: update to v6.6.140
  linux-yocto/6.6: update to v6.6.141
  linux-yocto/6.6: update to v6.6.142
  linux-yocto/6.6: genericarm64 fix configuration audit warning
  linux-yocto/6.6: address ltp hang

Deepak Rathore (2):
  binutils: Fix CVE-2025-69644
  qemu: Fix CVE-2024-6519

He Zhe (1):
  lttng-modules: Fix trace_hrtimer_start build failure

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
 .../cases/parselogs-ignores-qemuall.txt       |   8 +
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
 .../linux/linux-yocto-rt_6.6.bb               |   6 +-
 .../linux/linux-yocto-tiny_6.6.bb             |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  |  28 +--
 ...ce-trace-noise-in-hrtimer_start-v7.1.patch | 103 +++++++++++
 .../lttng/lttng-modules_2.13.12.bb            |   6 +-
 .../libtiff/tiff/CVE-2026-4775.patch          |  59 +++++++
 meta/recipes-multimedia/libtiff/tiff_4.6.0.bb |   1 +
 meta/recipes-support/apr/apr-util_1.6.3.bb    |   3 +
 meta/recipes-support/apr/apr_1.7.5.bb         |   3 +
 45 files changed, 1920 insertions(+), 32 deletions(-)
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
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2026-4775.patch



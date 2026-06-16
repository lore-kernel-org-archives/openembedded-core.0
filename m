Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE3E8CD98D2
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 07:18:52 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.148480.1781594325929727770
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 00:18:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PKWkfPW1;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45ef4223be7so2362649f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 00:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781594324; x=1782199124; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CqlV+qsdQgOn4bWbJCfyTxjZenNQj9ZpHuYiqWLa3jc=;
        b=PKWkfPW1hXdYSoTd1MaT156DmXuddnU3Z4BvVJTj5Cpj8MVlqhBSP5MQwfM39mui47
         krbFdM0pgMcG+kMjOt8Q1V1rcopjr0APQUh/QKNsE3AdM5lCQ0bXgCsQvVwUz3L5E0Vn
         MNq7oYVBTfk5U3GnFVDOx3Y5CLz7CatGi3Pgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781594324; x=1782199124;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CqlV+qsdQgOn4bWbJCfyTxjZenNQj9ZpHuYiqWLa3jc=;
        b=L+uhNvYNHNzjUVdtZAn587Hty+CJF0XD/HhBpcwW/yFvhHNkKnSFl0QgQMvUonHX19
         bWIxOCUi+e1Pa9Bbx3dSY7zr81lhKKbNXaYZBBTbWyOCr9CnHXsYA4MHm5+yHKQb5IhH
         BLdqw3OFeSttoDGsdgl202TzspR936p6uyLeVflrkf05KZ/I96swz6f6NQKGQ6rx7oJQ
         tlTtXZhMyZxe8LfIPSiyrXUkAMRpHUHYnZOc+IZ7zUowsuq0sZJDG8N0+sALHfwMvtQ/
         bxNbf1mds2XbFDhp37zUsrUeNJHtLkkBS9kZP24Fz+KbpLXz8S8axCTx/v/ci2jeou3Y
         XGKg==
X-Gm-Message-State: AOJu0Yw+VWW3JEzNX/GirjG+Pa5fe7HN7UHTt7FdUXQCoXKd+I8D0kJh
	L0R1JZMJi5NHxAO5/OzWz6SZkgWQsSsvaVM6mYobNqkburXys/bygG/zMzv/TQw3rlKKu7nBC4Y
	hwExv
X-Gm-Gg: Acq92OFKGi1OHWrXt9461NyjgvIuE5aawltmVEO/zg4K0G3L0aqV3SEcb7BGWhXP96Q
	y1SB8x+wtigQJPkeGixEhv4t6aTLLGVIeCKFYPcNAgf9WIMjWZeDbp9qbUAicrURyej2nTNw0vC
	+6qEn0AP5k47TpfouD6PbnYH5GfMCrEIlik7mjh/6NXK18c8piw60YNUropXA4XUlMhigsl1GpL
	VltoDAmUYKsotZ3cfBbPsqDy0o3DrR0CnncglNI5oY8fqfF71lfBAhzHPq5F++taQJhkvaO/ek+
	KBzl7ZgiNejouuqzH+KLSbOoBOHdJM0GxWZDF0Jd/32ZQYmRQdjgy24ze5SY2rI27UZ0h36Umdz
	qvu1KoMRu3hEtPgFgjN/HryzFLVBvFYUCqh0AJxHLz2a6cRUOzf44qLjyMcdKVdp2CmBgheAMmx
	x2BROxzqIA11D1Io1f0hY+URT67yh0GJ1SCMLWVuWyiQfat0c40vCJsi47MVQnpE1xqqxD9vVYA
	qD15voSc6eFq6c7Jc99QBWefEc=
X-Received: by 2002:a05:6000:607:b0:454:a41f:d082 with SMTP id ffacd0b85a97d-4619f2d7783mr4211111f8f.3.1781594318593;
        Tue, 16 Jun 2026 00:18:38 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f263945sm42702180f8f.8.2026.06.16.00.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 00:18:38 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][wrynose v2 00/18] Pull request (cover letter only)
Date: Tue, 16 Jun 2026 09:18:25 +0200
Message-ID: <cover.1781593617.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 07:18:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238872

This is the second version of my current wrynose pull request.
Link to PR v1: https://lore.kernel.org/openembedded-core/cover.1781275754.git.yoann.congal@smile.fr/

v1->v2:
* Removed cleanup patches related to python:
  * python3: use SKIPPED_TESTS instead of test skip patches
  * python3: use += instead of :append in SKIPPED_TESTS
  * python3: reference upstream ticket in a test skip

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4003

The following changes since commit 39d4d267906f8e18d44e1ba5da84acc4a5a85b61:

  pseudo: Update to version 1.9.8 (2026-06-05 12:59:40 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-next

for you to fetch changes up to cd635307ab8460d05d13dbfb3f28efdbde6609cd:

  python3: sanitize userbase in _sysconfig_vars JSON to avoid host path leak (2026-06-15 10:50:53 +0200)

----------------------------------------------------------------

Abhishek Bachiphale (6):
  cups: fix CVE-2026-34978
  cups: fix CVE-2026-34979
  cups: fix CVE-2026-34980
  cups: fix CVE-2026-34990
  cups: fix CVE-2026-39314
  cups: fix CVE-2026-39316

Adarsh Jagadish Kamini (2):
  libpcap: fix error message on 32-bit integer overflow
  libsolv: fix CVE-2026-9150

Bin Cao (1):
  python3: sanitize userbase in _sysconfig_vars JSON to avoid host path
    leak

He Zhe (1):
  lttng-modules: Fix trace_hrtimer_start build failure

Jinfeng Wang (1):
  bind: upgrade 9.20.22 -> 9.20.23

Mark Jonas (1):
  libsdl2: Fix compilation error with DirectFB

Peter Marko (4):
  perf: make libraries for install_headers configurable
  go: upgrade 1.26.2 -> 1.26.3
  go: upgrade 1.26.3 -> 1.26.4
  python3: upgrade 3.14.4 -> 3.14.5

Sai Sneha (1):
  python3: Fix ThreadingMock call_count race condition

Wang Mingyu (1):
  xserver-xorg: upgrade 21.1.21 -> 21.1.22

 .../bind/{bind_9.20.22.bb => bind_9.20.23.bb} |   2 +-
 ...ssages-about-32-bit-integer-overflow.patch | 158 ++++++++
 .../libpcap/libpcap_1.10.6.bb                 |   4 +-
 .../go/{go-1.26.2.inc => go-1.26.4.inc}       |   3 +-
 ...e_1.26.2.bb => go-binary-native_1.26.4.bb} |   6 +-
 ..._1.26.2.bb => go-cross-canadian_1.26.4.bb} |   0
 ...{go-cross_1.26.2.bb => go-cross_1.26.4.bb} |   0
 ...osssdk_1.26.2.bb => go-crosssdk_1.26.4.bb} |   0
 ...runtime_1.26.2.bb => go-runtime_1.26.4.bb} |   0
 ...rcing-binutils-gold-dependency-on-aa.patch |  55 ---
 .../go/{go_1.26.2.bb => go_1.26.4.bb}         |   0
 ...shebang-overflow-on-python-config.py.patch |   2 +-
 ...eadingMock-call-count-race-condition.patch |  37 ++
 ...e-stdin-I-O-errors-same-way-as-maste.patch |   2 +-
 ...-qemu-wrapper-when-gathering-profile.patch |   2 +-
 ...sts-due-to-load-variability-on-YP-AB.patch |  10 +-
 ...kip-flaky-test_default_timeout-tests.patch |   4 +-
 ...est_sysconfig-for-posix_user-purelib.patch |   2 +-
 ..._fileno-test-due-to-load-variability.patch |   2 +-
 ...ctive_children-skip-problematic-test.patch |   2 +-
 ...1-test_cmd-skip-bang-completion-test.patch |   2 +-
 ...pes.test_find-skip-without-tools-sdk.patch |   2 +-
 ...le.py-correct-the-test-output-format.patch |   2 +-
 ..._active_thread-skip-problematic-test.patch |   2 +-
 ...-test_unix_console.test_cursor_back_.patch |   2 +-
 ...t_readline-skip-limited-history-test.patch |   6 +-
 ...kip-test_sysconfig.test_sysconfigdat.patch |   2 +-
 .../python/python3/makerace.patch             |   2 +-
 .../{python3_3.14.4.bb => python3_3.14.5.bb}  |  10 +-
 meta/recipes-extended/cups/cups.inc           |   6 +
 .../cups/cups/CVE-2026-34978.patch            | 120 ++++++
 .../cups/cups/CVE-2026-34979.patch            |  57 +++
 .../cups/cups/CVE-2026-34980.patch            |  88 +++++
 .../cups/cups/CVE-2026-34990.patch            | 348 ++++++++++++++++++
 .../cups/cups/CVE-2026-39314.patch            |  47 +++
 .../cups/cups/CVE-2026-39316.patch            |  42 +++
 .../libsolv/libsolv/CVE-2026-9150.patch       |  68 ++++
 .../libsolv/libsolv_0.7.36.bb                 |   1 +
 ...ix-CreateRenderer-callback-signature.patch |  58 +++
 .../libsdl2/libsdl2_2.32.10.bb                |   5 +-
 .../xorg-xserver/xserver-xorg.inc             |   2 +-
 ...org_21.1.21.bb => xserver-xorg_21.1.22.bb} |   2 +-
 ...ce-trace-noise-in-hrtimer_start-v7.1.patch | 103 ++++++
 .../lttng/lttng-modules_2.14.4.bb             |   1 +
 meta/recipes-kernel/perf/perf.bb              |   5 +-
 45 files changed, 1183 insertions(+), 91 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.22.bb => bind_9.20.23.bb} (97%)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/0001-Fix-error-messages-about-32-bit-integer-overflow.patch
 rename meta/recipes-devtools/go/{go-1.26.2.inc => go-1.26.4.inc} (83%)
 rename meta/recipes-devtools/go/{go-binary-native_1.26.2.bb => go-binary-native_1.26.4.bb} (80%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.26.2.bb => go-cross-canadian_1.26.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.26.2.bb => go-cross_1.26.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.26.2.bb => go-crosssdk_1.26.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.26.2.bb => go-runtime_1.26.4.bb} (100%)
 delete mode 100644 meta/recipes-devtools/go/go/0011-cmd-link-stop-forcing-binutils-gold-dependency-on-aa.patch
 rename meta/recipes-devtools/go/{go_1.26.2.bb => go_1.26.4.bb} (100%)
 create mode 100644 meta/recipes-devtools/python/python3/0001-Fix-ThreadingMock-call-count-race-condition.patch
 rename meta/recipes-devtools/python/{python3_3.14.4.bb => python3_3.14.5.bb} (97%)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34978.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34979.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34980.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-34990.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-39314.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-39316.patch
 create mode 100644 meta/recipes-extended/libsolv/libsolv/CVE-2026-9150.patch
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-directfb-Fix-CreateRenderer-callback-signature.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.21.bb => xserver-xorg_21.1.22.bb} (92%)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-hrtimer-Reduce-trace-noise-in-hrtimer_start-v7.1.patch



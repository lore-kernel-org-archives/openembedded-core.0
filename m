Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 510D9CD98CE
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 14:52:01 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.72498.1781275916974617323
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 07:51:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=VC1InFCO;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490aaeabdb4so7388305e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 07:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781275915; x=1781880715; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5Bxez+1u2xLCM6c3yD5peMrjEfIl0pkUPeY1sw8pPvM=;
        b=VC1InFCOwEwxhncE5BR81HcX/IxHNy3amZXJTR33xm8TZmC8M2AiA48cdvoqVJ0l5O
         ZiDLSUVVbHNRLBHs5c1u8qCyi6l9rw0HwS+op8yMAW0BT8VyqTC62ZvHB1TKW9UpO92K
         ve/wNknFy2ewChiAFfn++a4iy5khfIiBIHwg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781275915; x=1781880715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Bxez+1u2xLCM6c3yD5peMrjEfIl0pkUPeY1sw8pPvM=;
        b=P60XlseCoY2pnvxvFH3pFdjpc4j+Ch6HZKGcYvWLE2dXXMQcBNvTNZhZwETYXnV04j
         RuKx0/i50NCs6EtSCwXYQcX+bDpYfyXpLYnSju+oDqGI7qtxTX6DukhF3lAk9Z1hXoXl
         lE5ueeigL/otO14St5SzAgUaQDLyeIrTrVkiETZPcMsleYgAFZTGku1XgvfuB+Z0A/mG
         8hEQAvlK4knxfIYjbTLjHV0rmTvPVig+4o8Bq35bG5yd/pgqhO0R07J0kn8SX9OrEyUY
         3hogj7IRIJ6EPB1m1lo/mSYHVLd6kRnkq0x+rWX9iJodX8X425vJqiBZb8djQWUKvloA
         WfGQ==
X-Gm-Message-State: AOJu0YxKno4ASpqD/Mm+rRIVYQdyk6G+SFkIZBjioBIb10uV0mrZP2ms
	HCXFxLJ+u2r6khf1OkAW9g+7ZzIaqwrQIf4O+a7IF8LAX/kwIvuF175lM0YtrjU3s/BIRnXrSrI
	ziTaD
X-Gm-Gg: Acq92OHj+PGOoKGMd3z5WRs9H8uPbgs8rqRrvtsivWcZajbVFKmdK+tfKiWy2GwDDGd
	TrCTsjThnOJzsCkas6KRJRB9g0KTt5SsS19gQLTjg63RZFP9hTHQwIbm6O9BqGV2JlAdCZPxxIp
	56rmdWJXujMpF+pazs8o64JZZ8+vDkHkCo0SHMz6SYRGqCNC6ey/po+fCJtdzSsGAYoGUbv5X/P
	NsTTGVbhb+gAbY2peNva1k1AtnVuKx1PQbJ4pOLMaJmGjO/MivrqmhrIEA9o0yrWtW1vFG4XClH
	ONpTCOexPok4s1o4aTKF7ctph2Ti1Y3E57GxPqFL3IwbWSBerlKdFPm+S2ndt7aLgn6pE9X1Ip1
	uFqw/er6SwFpEBfntNGCq8Cvf5uWnsAC2Z69X+Vs3k5OzRUaT9elAkFK9OOWNZC1eF3v2Xcgobh
	t6lL85Wdf8IEMZY/TaZsEntlFrfziUG0xYLsw2p7MGa88DZ6xutACCOZQ++AN3eXbqCsNENbOzr
	qjiqMql7127hW3EahacA4mgTBCr
X-Received: by 2002:a05:600c:4f94:b0:490:bad9:de43 with SMTP id 5b1f17b1804b1-490ec3388dfmr48646455e9.0.1781275914861;
        Fri, 12 Jun 2026 07:51:54 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a71583d8af7a53fb.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a715:83d8:af7a:53fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e2ca1a43sm164824335e9.8.2026.06.12.07.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:51:54 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>
Subject: [OE-core][wrynose 00/21] Pull request (cover letter only)
Date: Fri, 12 Jun 2026 16:51:46 +0200
Message-ID: <cover.1781275754.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 14:52:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238645

Those are the patches from the last patch review:
https://lore.kernel.org/openembedded-core/cover.1781132051.git.yoann.congal@smile.fr/T/#u

Paul, you had a question about the python backport set:
https://lore.kernel.org/openembedded-core/cover.1781132051.git.yoann.congal@smile.fr/T/#mdadb33936f28c2ebfc45c494545c8c3c2b9eaf9b

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3963

The following changes since commit 39d4d267906f8e18d44e1ba5da84acc4a5a85b61:

  pseudo: Update to version 1.9.8 (2026-06-05 12:59:40 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-next
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-next

for you to fetch changes up to 3ad25cdf47e75d2edc217727eb3f8bd01ed76e47:

  python3: reference upstream ticket in a test skip (2026-06-10 13:52:06 +0200)

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

Ross Burton (2):
  python3: use += instead of :append in SKIPPED_TESTS
  python3: reference upstream ticket in a test skip

Sai Sneha (1):
  python3: Fix ThreadingMock call_count race condition

Trevor Gamblin (1):
  python3: use SKIPPED_TESTS instead of test skip patches

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
 ...sts-due-to-load-variability-on-YP-AB.patch |  79 ----
 ...kip-flaky-test_default_timeout-tests.patch |  49 ---
 ...est_sysconfig-for-posix_user-purelib.patch |   2 +-
 ..._fileno-test-due-to-load-variability.patch |  29 --
 ...ctive_children-skip-problematic-test.patch |  34 --
 ...1-test_cmd-skip-bang-completion-test.patch |  31 --
 ...pes.test_find-skip-without-tools-sdk.patch |  33 --
 ...-test_deadlock-skip-problematic-test.patch |  27 --
 ...le.py-correct-the-test-output-format.patch |   2 +-
 ..._active_thread-skip-problematic-test.patch |  30 --
 ...-test_unix_console.test_cursor_back_.patch |  46 ---
 ...t_readline-skip-limited-history-test.patch |  46 ---
 ...-test_shutdown-skip-problematic-test.patch |  43 ---
 ...orlines-skip-due-to-load-variability.patch |  29 --
 ...kip-test_sysconfig.test_sysconfigdat.patch |  32 --
 .../python/python3/makerace.patch             |   2 +-
 .../{python3_3.14.4.bb => python3_3.14.5.bb}  |  97 ++++-
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
 48 files changed, 1238 insertions(+), 597 deletions(-)
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
 delete mode 100644 meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-Skip-flaky-test_default_timeout-tests.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-skip-no_stdout_fileno-test-due-to-load-variability.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-test_cmd-skip-bang-completion-test.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-test_deadlock-skip-problematic-test.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-test_only_active_thread-skip-problematic-test.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-test_pyrepl-skip-test_unix_console.test_cursor_back_.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-test_readline-skip-limited-history-test.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-test_shutdown-skip-problematic-test.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-test_storlines-skip-due-to-load-variability.patch
 delete mode 100644 meta/recipes-devtools/python/python3/0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch
 rename meta/recipes-devtools/python/{python3_3.14.4.bb => python3_3.14.5.bb} (87%)
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



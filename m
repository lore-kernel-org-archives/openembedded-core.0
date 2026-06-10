Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92079CD98C7
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 22:55:19 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33474.1781132117531158390
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 15:55:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=X3P3IHRj;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45ef1629ff4so5075711f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 15:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781132116; x=1781736916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=luMSmRvrNIUWUQMhxcn9GmguP5OJ/1l3lKPKOi+Xu1A=;
        b=X3P3IHRj6L5su/rE/b0ZHKBSL2L26FA+YFU7horFni5Iyoq3lHan8FzMe9hhudBsbh
         apACJpLhrAUUoFL3OMD896ikykl56j9k/gvq9FoxHNWbfYjNb2YUkZ/3RIEzIHM3ySw6
         3wiPjfl90BTFVDRjSm9WOPCIPFsUclCqZQ+w0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781132116; x=1781736916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=luMSmRvrNIUWUQMhxcn9GmguP5OJ/1l3lKPKOi+Xu1A=;
        b=UttgUoyvm0ZOeZ7uXp189Bmnopa5ofp9n5ouo3tDmdfPHP2qAPyxUIzyY7JNg8zBZM
         I+KevCI7R/CLhItpXduvEh8TThntSEkQF430n/yTLsso9HMnkbo06aAPLRaZBObOnSfX
         gwClUlBQkNSK8FzpDK++A/kPO1ESfpwmRZMxO9Wrf+baxu61Ge6PbF5wvK7uLpZsTvJ6
         j6LnXQQbodKxUC0ktpWJ2RgC71U72n0iR2Up/KMIZYix9L7tiJDy06I1i/9QtZNxstdR
         DAN4WUClwhHLdymTjqPzMiUUlW/K+M5HebLq7thPeyqY5g1/tDXXkluhdW0gfzh69p9W
         zJmw==
X-Gm-Message-State: AOJu0YwC9LIBmPtTOubDkN5erTljPKZ/xTyIITT+Q6y37jmY+FhUtni6
	ZZ5kmYuIr0/fXZ2lP7AEtdrog9Om7eYuja1hid8Y/Welifz9S9lsVNO2f6CsDi4OK5Y9Lu/vv+i
	XI+Dp
X-Gm-Gg: Acq92OFBIiYJ+YH+2OMr1YfKjMp4A5STK/q+1tW/Lmauk8hpH3K0XRJ6tboZjPLYgi/
	uDJIoa8biBxOaYZsWRTkHzv0fJQWceN53SrtaR5mLWgOnlgVMaYk5EbRdc+ufXtXdQ4Q2vhLKkI
	XNkonDexS5PxFw9Niy0LU53CGAIYwOivK3SbrcKCd1taUoBH8qRrj+tfSYhGW9XwC291v6Pek6G
	iNtX+zVPE9hOPHkrm4WJS/Dg0FT9mkDG2fIAqgdEwiPJ9n/W8U+serm1y9bQWdDklhm/x8sNW4c
	kOvFK+nRJdJxLCsEK73zRRCSDpRKWT1399qNlEYGqiWjdRzfSg6bK1pQVgf+420jf+vsf9N3+Tu
	vO0Fp/pTuYSS1jkE00bybjUeAVx55g7d8TFNKNo3HOtVdm9KaRwSj3T9YpkJrglgNth1O4OpNOS
	Mbf+vufnTYruEvmg7eL1va564h3Br885CZuG19no3HnGYdLcg2evsHBBtAL7Z3VdfF0DGOKVjDA
	q7bUNlf3USY6ehVFZ5Qdw8ICv+Y7QER7DjVa/pBGzHOxaPKqw==
X-Received: by 2002:a05:6000:5c1:b0:45e:8866:e58d with SMTP id ffacd0b85a97d-46067598f92mr279825f8f.11.1781132115829;
        Wed, 10 Jun 2026 15:55:15 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bb749f54eeb85d7b.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bb74:9f54:eeb8:5d7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm71599304f8f.19.2026.06.10.15.55.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 15:55:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 00/21] Patch review
Date: Thu, 11 Jun 2026 00:54:51 +0200
Message-ID: <cover.1781132051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 22:55:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238396

Please review this set of changes for wrynose and have comments back by
end of day Friday, June 12.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3963

The following changes since commit 39d4d267906f8e18d44e1ba5da84acc4a5a85b61:

  pseudo: Update to version 1.9.8 (2026-06-05 12:59:40 +0200)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-nut

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



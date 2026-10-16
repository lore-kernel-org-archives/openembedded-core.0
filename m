Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04DADCCF2C9
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 22:10:55 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4292.1792184151015596863
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 13:55:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=hNqo+Jym;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: oo.hehir@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a5a26c8412so2337801fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 13:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792184149; x=1792788949; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S1nAPI3vLbGM+SqrZrl5hSXq+Bnljj2EDV31zv4KrfY=;
        b=hNqo+JymQtDaH+PLzOJ4XOyBeTQEtRowcjTajf+viD5ahORBvgvfCR2NDq78Vf87tc
         Lcltk7QLA23rSY/Q2weTyF92YrCrvJM83vaj/0DVJGss3F2sKbbSfryS9bygo4UDVFVx
         3FHhJsEF8rrx24usdyzPxFkawQSx+mQRTS9TZp88zVtr1OHL9B1H1R1r1+PlLYbMOoMx
         eI4UJI33ti/It6fXMdjmd6P+q3qjuRrvQAbVOhtKHnVHVbo5iKBJ6fD97rx74rTloCmf
         XXTVrfynK1f9ueWfitFe0yEznM4wQUbCzAtrxzjmSHppsAGG3g4779qbQ5yNAJY8CXn1
         hndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792184149; x=1792788949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S1nAPI3vLbGM+SqrZrl5hSXq+Bnljj2EDV31zv4KrfY=;
        b=uCK9oOkvIngnKcgUoGxS+AaQ5rsxQ0uSo8CWIT2fWYvRapOGTAYcQYuKbg3u1p+V6p
         oYP0tJqw2MRs6SfOB/9orLz3y5drOVEESG6SepE+R90b8LJgqcin0eppJrRca/tUXLJh
         FcYBHbMQkJkDh9ApA+FKmaKt2DbyPGER+aWyzBJOhLcNZCQPlFj+SlX/mDTLIyrybJbf
         vvfcIk14BXIYwcNxADp/fCLLEbBdCxxuR4axIifbW6qeY6e2jsbYtXEuholNf/DmL82N
         5ZzaaKvo/9C3jMP2LoWmCZ8MEebUOuVe7WzlgOkSWmmsB+eBOvCV07a7U7pbYB2X++Uw
         O7yg==
X-Gm-Message-State: AFq9FYJBhSnSoANcAHjxogufuYl7NehNV6/faWWy8P8ZscZqu7/+rlGG
	+MSMbBeVjrOqYP7U8/N7zvocPeX6J3EH+9oBKqyqoQ8l+EcR4YMZfaeCwEBTcQ==
X-Gm-Gg: AYBFou3VL3Exd0DR9mRtzCRuL2b+qRpMjApVpmsFa9TNdqx+6ilNui95tZifaRTSxIb
	6SEn34rPKp1RB6zbFmC6vivoax7+4Hp8Cs8MFwO0RXIirpZPECPiuFW7fQ3OsdAG7AuWiIfkgk2
	kz4fQqnfjTCS3TyVp2VbFcQAieHMKjQ9VAuc/3h3mR5G2+J5XLfBXPeNQCk75Z/lG0E4SgSYpBd
	PJT+HTxXgQNUisovRFdOnlgUw+LBUtVu0lgmOEg6hzYDx36m51AUyVD4dU0Ke+24Otmg8Lilray
	tzC52+B3yTWWhp9V4eOT5cHnI9wKKwytV6v+LxZMX9bX++mYIfV+p84MVBAqkK9xZgvVoNnlAp7
	N0FCaLtTWqt3YVRvMZTqKLqcXplJXqACsiawWeETHiHMrZS/aea0dtGcwDfW372QKm2DKlTv83r
	ht0ALLk3ROwZcMPzbsx/v1yO9XOdyfw1dn6C8zvyDkAcZbm4rQjFF8jVVbgZOaVm4DTDS+XFR58
	Pw=
X-Received: by 2002:a05:600c:4e94:b0:4a1:b187:1314 with SMTP id 5b1f17b1804b1-4a1d75e6ddemr18945625e9.7.1792183654199;
        Fri, 16 Oct 2026 13:47:34 -0700 (PDT)
Received: from hp-z640.fritz.box ([51.37.221.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d3e2e602sm51205765e9.5.2026.10.16.13.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 13:47:33 -0700 (PDT)
From: OOHehir <oo.hehir@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	tgamblin@baylibre.com,
	OOHehir <oo.hehir@gmail.com>
Subject: [PATCH 0/7] riscv64 ptest fixes
Date: Fri, 16 Oct 2026 21:45:29 +0100
Message-ID: <20261016204547.2328847-1-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 22:10:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248047

This series re-enables the strace, python3 & tcl8 ptests on riscv64 & fixes the
three riscv64 failures that are not timeouts: lttng-tools, tcl/tcl8 &
python3-numpy. Patches 2, 3 & 6 only edit the riscv64 lists in
ptest-packagelists.inc; patch 1 skips one slow strace test on riscv64 &
patches 4, 5 & 7 carry the fixes.

I sent these results to Khem Raj & Trevor Gamblin before posting. Trevor
suggested profiling the per-test durations under QEMU first; patch 1 skips
the slowest test found (see "Per-test durations" below).

Where to look:
- Patch 7 works round a confirmed GCC 15+ bug:
  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=127908
  GCC moves the float-to-integer conversion above the range check in its
  inline ceil/floor/trunc, so ceil(+-inf) raises FE_INVALID.
  -fno-fp-int-builtin-inexact makes GCC call libm instead.
- Patch 4 carries an lttng-tools fix under review upstream:
  https://review.lttng.org/c/lttng-tools/+/18903
- Patch 5 skips binary-40.3, which expects a negative float NaN to stay negative
  when widened to double. RISC-V returns the positive canonical NaN, as the ISA
  requires. Reported on an existing MIPS ticket:
  https://core.tcl-lang.org/tcl/tktview/bf029ced86

Testing:
- qemuriscv64: testimage of core-image-ptest-<pkg> with the autobuilder's
  PTEST_RUNNER_TIMEOUT of 450 s (a test is killed after 450 s without output),
  on my machine, a Xeon E5-1680 v3 from 2014 (a plough-horse rather than a
  stallion). An autobuilder worker will be faster per core, but busier.
- VisionFive 2 v1.3B (JH7110, 4x U74, 8 GB): each package in
  core-image-minimal, ptest-runner -t 1800.

  package  qemuriscv64                  VisionFive 2
  strace   1081 pass, 0 fail, 24 min    1212 pass, 0 fail
  python3  44546 pass, 0 fail, 71 min   44698 pass, 0 fail
  tcl8     152 pass, 0 fail, 10 min     only failure was binary-40.3

Per-test durations under QEMU (TCG), as the longest time without output is
what the 450 s limit measures:
- strace (make -j4, every output line timestamped): the longest gap is 283 s,
  ending with qual_fault-syscall.test, which patch 1 skips on riscv64. Next are
  filtering_syscall-syntax.test (139 s), trace_creds.gen.test (90 s) &
  strace--tips-full.test (65 s); the rest are under 50 s.
- python3: regrtest -j4 prints a progress line at least every 30 s, so the
  longest gap in the full run is around 30 s. Its slowest modules
  (test_concurrent_futures.test_process_pool, about 17 min, & the
  test_multiprocessing_* modules, 6-11 min) are made of many short cases: run
  one at a time, no single case takes over 71 s (MiscTestCase.test_large_pool,
  69-71 s in each start method). So I have not skipped anything there.
- tcl8: tcltest prints once per test file. The longest is reg.test (115 s),
  then regexp.test (70 s) & io.test (45 s).

Still parked: tcl, lttng-tools, perl, python3-cffi, libpcap & zstd pass, but
are too slow for the 450 s limit on my machine. Under TCG (QEMU's software CPU
emulation), ptest-runner kills tcl in unicodeNormalize.test, lttng-tools in
test_valid_filter, perl in t/re/regexp_qr_embed_thr (485 s alone, so perl may
pass on a faster worker) & python3-cffi, each after 450 s without output.
libpcap's run-ptest prints nothing until TESTrun finishes, which takes 9.5 min
even on the board. zstd's compression/window-resize.sh exceeds the 200 s
per-case limit in cli-tests.

To confirm that these fail only on time, I reran them under QEMU with this
series, PTEST_RUNNER_TIMEOUT = "7200" & the cli-tests limit raised to 3600 s
(local changes, not in this series). All passed with 0 failures, as they do on
the board:

  zstd           43 pass            10 min
  libpcap        14801 pass         24 min
  tcl            175 test files     46 min
  lttng-tools    2088 pass          85 min
  python3-numpy  45769 pass        104 min
  python3-cffi   1724 pass         187 min
  perl           2729 pass         219 min

python3-numpy stays parked too: patch 7 fixes its only failure (72 cases of
test_unary_spurious_fpexception), but under the 450 s limit numpy 2.5.4 is
killed before pytest prints its first result.

glib-2.0 is left parked. It passed one run on QEMU (308 pass, 31 min) & on the
board, but it was parked for intermittent failures, which one run cannot rule
out:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15891
https://bugzilla.yoctoproject.org/show_bug.cgi?id=16230

The numpy results above are for 2.5.3, before the rebase. numpy 2.5.4 with
patch 7, under QEMU with the 7200 s limit: 45993 pass, 0 fail, 87 min. One
earlier 2.5.4 run had a single failure, a wall-clock check in f2py
(test_nameargspattern_backtracking) that requires a regex search to take under
0.2 s & measured 0.22 s under TCG; it passed on the rerun.

OOHehir (7):
  strace: skip qual_fault-syscall.test on riscv64
  ptest-packagelists.inc: re-enable strace for riscv64
  ptest-packagelists.inc: re-enable python3 for riscv64
  lttng-tools: skip kernel cases when kernel tests are disabled
  tcl, tcl8: skip binary-40.3 on RISC-V
  ptest-packagelists.inc: re-enable tcl8 for riscv64
  python3-numpy: call libm for ceil/floor/trunc on riscv64

 .../distro/include/ptest-packagelists.inc     |   7 +-
 .../python/python3-numpy_2.5.4.bb             |   7 ++
 meta/recipes-devtools/strace/strace_7.2.bb    |  13 +++
 meta/recipes-devtools/tcltk/tcl/run-ptest     |   5 +
 meta/recipes-devtools/tcltk8/tcl8/run-ptest   |   5 +
 ...our-LTTNG_TOOLS_DISABLE_KERNEL_TESTS.patch | 108 ++++++++++++++++++
 .../lttng/lttng-tools_2.16.0.bb               |   1 +
 7 files changed, 141 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-tests-honour-LTTNG_TOOLS_DISABLE_KERNEL_TESTS.patch

-- 
2.43.0



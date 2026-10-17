Return-Path: <oo.hehir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E8ECCF2CF
	for <webhook@archiver.kernel.org>; Sat, 17 Oct 2026 11:24:12 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4472.1792236246765862159
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2026 04:24:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=W301iL1o;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: oo.hehir@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so7235625e9.3
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 04:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792236245; x=1792841045; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yvf9aQA8a1tuG7org2XZMVA/j1y20OjahlIvKhft4wY=;
        b=W301iL1ocwWu73W33G8sj06yO8Qc6CMYL3ahKyiQJWRfDQT9tgjtuovi8eMZDMDLYe
         ggKQ7422zWxPTmSMX67zSV2n0zZOYENbm3ILIz+8uSXe0aT2JKGpS/Gllsgvqm/AFvS2
         Eozmn1nP6zyby77tz6/H+A7CvOJQ3Ns/9KV6E0Hjjd28PKvrBqcNBipxpNSlfKs3OuCw
         0pKwS5g2lIpwOhDwujIRGtengyR1dPuNN7AxIsyRQDOGdzN5Ekcb6lsNW/6oJtttzQhH
         0r4bOM97IcBM8Qw4zgMytPd26/usYV1S9IiqMVi6qGbwud38+On1nDo/2pl25pLZAqZh
         CE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792236245; x=1792841045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yvf9aQA8a1tuG7org2XZMVA/j1y20OjahlIvKhft4wY=;
        b=LbjwSuK/KgkskWesZkD7KzVrwmQnPvvoKdXKIqYsaHbBz6MySp06Rz5pD6TJKEm+SC
         9bG7SF/4q5+laxsSTKBrtxF5OXGZzuf6Gfd0TlSOUBh9QZXE3eC0H9MJ7a7GA/EP5sfk
         YL5StdM3q2kBKet+3X0C+5G6HM9HGBHPyGQNZoISRvDm+Uvyz0O20v3d2eZz3m0T1yMJ
         ZENqADnODPwn+O/qf2hV4dLlohepQV+GZMFIEJaUj1EeUD7FW82P0QatnKVxnehfGBfk
         O4OE9x6a2/9mqxO1AfguQaK/G92KoV9ov9rSo7WOZVdgxeGm437vVpORpAHRokE7ZxWN
         W2dA==
X-Gm-Message-State: AFq9FYJOMhkuMYIgVOsSFhMg6Fzn3oAAz7UhQ4zNv1twYWEVxwwzpSrx
	ClE+XRPNqzbZ77pJgRnMeoY1NFzI45BrnoYz/Njd/v7b1Em7TpiOfpqYfO1kauv2
X-Gm-Gg: AYBFou1BCjEPy/L3Y4EH6x/YxTqDG6HqyPDSSj80UDwuscs/mHzsdmFVaJNpDXW03PC
	IDE3bFgbnMmlKJUZ6Wpo4+cfMcfFmJ8u+cdO8fPc5jOb+CYDf7QnOK52aXuQ1ndsRAguZUPZ+ao
	J6bG76AEw3y0rzq2KKc3jU6iV0G0XS1uBaySFAHt1bJ8K8hotKO7x5fasOZh3DDQEozEIFhL+zs
	4rj5mrYDtxyZnjbPo2QiBGHdvkAK4VNPBybkkO0eyYne45ftJQVTCn+2I+YHeO9izfAIg7dE5hL
	1obaSueEqVo+bd4s86znvDcvOyp4ayG1nQkSN851d4VEqOwo6btWTxqf9fiVnxwMEBys2253jxg
	4nKpHbuFKulf3glErhGldGYAQrcr0bxwFCIba8eC3j393gJsnKL4YQtrTCK1n3cMlcYHhb4iEyt
	nznhPrNzggrocV2MV7zm5CpaPRDd1YqVCpSQIjJe0DuHwSVtYb7UHkTpQN7IYs1Pk12vQZ/5tuD
	Bix
X-Received: by 2002:a05:600d:6414:20b0:4a0:1e37:ae41 with SMTP id 5b1f17b1804b1-4a1d76314aemr35248375e9.24.1792236244610;
        Sat, 17 Oct 2026 04:24:04 -0700 (PDT)
Received: from hp-z640.fritz.box ([109.77.135.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471877sm9140287f8f.1.2026.10.17.04.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:24:03 -0700 (PDT)
From: OOHehir <oo.hehir@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	tgamblin@baylibre.com,
	mathieu.dubois-briand@bootlin.com,
	OOHehir <40183643+OOHehir@users.noreply.github.com>
Subject: [PATCH v2 0/8] riscv64 ptest fixes
Date: Sat, 17 Oct 2026 12:23:49 +0100
Message-ID: <20261017112358.77434-1-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016204547.2328847-1-oo.hehir@gmail.com>
References: <20261016204547.2328847-1-oo.hehir@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 11:24:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248079

From: OOHehir <40183643+OOHehir@users.noreply.github.com>

Changes in v2:
- New patch 5: on musl, the tcl & tcl8 recipes add a skip after every line
  containing SKIP="$SKIP, so v1's skip inside a case arm left run-ptest with a
  syntax error (reported by Mathieu Dubois-Briand). Building tcl & tcl8 to
  do_install_ptest_base for qemux86-64 & syntax-checking the installed
  run-ptest: v1 reproduces the autobuilder error on musl, v2 passes on musl &
  glibc.
- Patches 1 & 8: shorter recipe comments, no functional change.

This series re-enables the strace, python3 & tcl8 ptests on riscv64 & fixes the
three riscv64 failures that are not timeouts: lttng-tools, tcl/tcl8 &
python3-numpy. Patches 2, 3 & 7 only edit the riscv64 lists in
ptest-packagelists.inc; patch 1 skips one slow strace test on riscv64 &
patches 4, 6 & 8 carry the fixes. Patch 5 makes the tcl recipes'
musl sed safe for patch 6.

I sent these results to Khem Raj & Trevor Gamblin before posting. Trevor
suggested profiling the per-test durations under QEMU first; patch 1 skips
the slowest test found (see "Per-test durations" below).

Where to look:
- Patch 8 works round a confirmed GCC 15+ bug:
  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=127908
  GCC moves the float-to-integer conversion above the range check in its
  inline ceil/floor/trunc, so ceil(+-inf) raises FE_INVALID.
  -fno-fp-int-builtin-inexact makes GCC call libm instead.
- Patch 4 carries an lttng-tools fix under review upstream:
  https://review.lttng.org/c/lttng-tools/+/18903
- Patch 6 skips binary-40.3, which expects a negative float NaN to stay negative
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

python3-numpy stays parked too: patch 8 fixes its only failure (72 cases of
test_unary_spurious_fpexception), but under the 450 s limit numpy 2.5.4 is
killed before pytest prints its first result.

glib-2.0 is left parked. It passed one run on QEMU (308 pass, 31 min) & on the
board, but it was parked for intermittent failures, which one run cannot rule
out:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=15891
https://bugzilla.yoctoproject.org/show_bug.cgi?id=16230

The numpy results above are for 2.5.3, before the rebase. numpy 2.5.4 with
patch 8, under QEMU with the 7200 s limit: 45993 pass, 0 fail, 87 min. One
earlier 2.5.4 run had a single failure, a wall-clock check in f2py
(test_nameargspattern_backtracking) that requires a regex search to take under
0.2 s & measured 0.22 s under TCG; it passed on the rerun.

OOHehir (8):
  strace: skip qual_fault-syscall.test on riscv64
  ptest-packagelists.inc: re-enable strace for riscv64
  ptest-packagelists.inc: re-enable python3 for riscv64
  lttng-tools: skip kernel cases when kernel tests are disabled
  tcl, tcl8: anchor the musl unixInit-3 skip to top-level SKIP lines
  tcl, tcl8: skip binary-40.3 on RISC-V
  ptest-packagelists.inc: re-enable tcl8 for riscv64
  python3-numpy: call libm for ceil/floor/trunc on riscv64

 .../distro/include/ptest-packagelists.inc     |   7 +-
 .../python/python3-numpy_2.5.4.bb             |   5 +
 meta/recipes-devtools/strace/strace_7.2.bb    |  12 ++
 meta/recipes-devtools/tcltk/tcl/run-ptest     |   5 +
 meta/recipes-devtools/tcltk/tcl_9.1.0.bb      |   2 +-
 meta/recipes-devtools/tcltk8/tcl8/run-ptest   |   5 +
 meta/recipes-devtools/tcltk8/tcl8_8.6.18.bb   |   2 +-
 ...our-LTTNG_TOOLS_DISABLE_KERNEL_TESTS.patch | 108 ++++++++++++++++++
 .../lttng/lttng-tools_2.16.0.bb               |   1 +
 9 files changed, 140 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-tests-honour-LTTNG_TOOLS_DISABLE_KERNEL_TESTS.patch

-- 
2.43.0



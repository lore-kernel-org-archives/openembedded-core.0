Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A395C5CFDB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 10:56:39 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16322.1786618594625447023
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 03:56:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MzCNLCBb;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-930c0f9c1b1so121617285a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 03:56:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786618593; cv=none;
        d=google.com; s=arc-20260327;
        b=VzG0aCv3DvUmOZZ1UDWQop1jlIVBTxesQwUP6WB4mxSWUmY+gu0hSZcBB3YMY4l8/t
         8oIgDydZPzrhcG7amJBZeivI+lr+maINyI7C/89F3+xan29opVdNaDtPhxsjSKuEkBUg
         MBjGYWcrfOmAWRLyTwgBWxTin4UbGlqO/MeMtbuAN3oEm3w27TQOKXrkJyZcRO4oduoY
         52M+LqPxBNarXzoeozmyYzYsawFAqmbIv94GnOejzCg9RAJ+oTDEYpsfu3pFzaOnXNM1
         uuhc85sd2xv6JbPPrBeKRPfJWhNelA87PBCipLR17rsPxBmXMLv7vvyveFUD07DcnHTu
         RULg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nQOSaqGL7yHtOEwNjuUlg+eKMhNqANLy5nKFn3szGUA=;
        fh=r19dbsJbfwo2sOyRBhWARy8yzPqH7Tke4vIyLNBxG50=;
        b=CZVJVY+txqwKmOoecJ8XMWhqhljj+urdmA3OGAAWfGVv4bY/F/qC1YXgylKlO2W8ky
         C2bzqxwnEuemQXI1t8CWeGofdaeDr1Oty41Vwie1142Jer5atr+d7ny6iQX6yqZm1tl7
         tqAGQYX3j4BcrbKhG7NMZ7vlXxEoFwHZBeM9JQRzY1sqy3Mo3I4hLMJkCrTxidACS5U1
         MPqclAhvt4QcwqEdAsnEFSha30+xqPkhysW6EvnGsGKaY4yq4b7z+4oPVXgL7xRBWKER
         imF7oidTr0M1Ow5sACRfbSShWD7YeB27AVnFH/gpm3cgOM8eO++ZaYdrxysTYP61vMoY
         c+XQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786618593; x=1787223393; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nQOSaqGL7yHtOEwNjuUlg+eKMhNqANLy5nKFn3szGUA=;
        b=MzCNLCBbBVKd+92jy+y3ONmM7w3OzWnDo/CTyCtZ95gxe6DntrNaxtt68ICihQXKlx
         RbYVWx7p+o8oRSFEVz1AlVtOILSjd8keG9XoGLPK3fD31mumiGy3/C6Ls+3flDDOfgUi
         Xwpyzwq2LN+WL23kLVthJ3NRy6YAxtZJKST/FmTHcWIgKVGBwm9NLXtH+dlQzYdHrCMC
         sFpzGqsDGbtQ2KfFNu8LuYMeVUizykL/06JpLgnmxV5O3rlHSHJB7vt8sn1ibyvZ8hkz
         EKOM2zs9VfRyyk0ghlPMERRVv7kG1E/vn84hmtpbWyCoCz9C/hqOoFrH0zu2US5bV+qA
         ulNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786618593; x=1787223393;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nQOSaqGL7yHtOEwNjuUlg+eKMhNqANLy5nKFn3szGUA=;
        b=P4AdchyvyvvNOQUelZ2KDsSmYxUKQhWJ2lY/N9Gk2yFcMp/3R37XsgCaZNsW0IElBC
         FGEyewEF6odkHyxpJhSUtQZoDam6/rhNN84LBpxssBFtSaWwagTnx82EpffsVOJxWAbt
         L3b59NYc/AEjKCsgH6iEHXcO46QItRKUqe0PamNtMHBkHUvGJvFcWLasXgRWK4blzDAy
         QpJXYWu+cfrBvLQch/b3t8OAxhujputXFOM7BarHCC1BCFn4TJmyleLOBhys1B1G6ek2
         AW4pU9G36iO3tPnu4iLpvW9+T8sGa8PpTRyB+1/o0BZuh2rLg3QTB0gYjs3bEmOCRZk1
         jiuA==
X-Gm-Message-State: AOJu0YwjESRt5or2uCFuFCS9QhCBRFMbkvw+5kXz9cwOV+Qv7XZxqyhc
	lrRwnlm5JmuV9xAx8t+3vygmfBPBNHr/jTr7sgFh2YyU5JYObZEcixqM7ANh7rFqqvit2abgPR9
	x94qixBGSCQhidbID3cgz8FugeSDpgmM=
X-Gm-Gg: AR+sD12T1l+wldh3KPh+CmbAX9SkcdYtihJaDb2/cQOn9dInrO98K0lgdMXXgDxaXVf
	SRwGNvztxTGCm1CBOYCn1ttTPDaaySqGkVuLFpNzzaI5Pfmd2yfY3KsGtG1A/cAKdbdaHqRUW8L
	j3WywnMdHJQuZ6Z7lD1pVqXdBiXioZZkboNeBDER9Q+k+ARQjRh49ONoUlWST02A6Gnetjo/EEF
	LDqapqUYDuZkKxnlI8e++gMk3wqUuEvvpYwdo7lKdWOGVTDC7gHm6tENZB7IvFWsaOs/fjh6o77
	w3vzrN4Qm1txe6carCOzz7bYtrCXflrRLUB/ejkmeDjUh3+WIb/OkHYyUbagT7UB70tfUrmpChI
	7dc5ut+9Qm1ErCA==
X-Received: by 2002:a05:622a:17c5:b0:516:e152:7a59 with SMTP id
 d75a77b69052e-52d73e3f146mr47066601cf.42.1786618593372; Thu, 13 Aug 2026
 03:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260812185722.3994412-1-tgamblin@baylibre.com>
In-Reply-To: <20260812185722.3994412-1-tgamblin@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Aug 2026 12:56:22 +0200
X-Gm-Features: AUfX_myfFpz7yAiLcIx7c53_6jfek99Dj9i1AcLOX_vWndVWINGg_m7tMakIKmc
Message-ID: <CANNYZj-q_U58TP=EO9m9g_k9O57HswnZumEHMhnwTypU6zgNCw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] libpng: capture per-test ptest results
To: tgamblin@baylibre.com
Cc: openembedded-core@lists.openembedded.org, pratik.farkase@est.tech, 
	richard.purdie@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 10:56:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243346

Ugh. This is invasive and difficult to support. Pretty much every
other automake-based ptest does the same, so if you want to fix it,
it's better to fix it upstream for all.

Also, we can instead retrieve those individual log files in case of
failure together with other ptest artefacts.

Alex

On Thu, 13 Aug 2026 at 08:31, Trevor Gamblin via
lists.openembedded.org <tgamblin=baylibre.com@lists.openembedded.org>
wrote:
>
> The libpng test suite reports detailed information about results, but
> does so in per-test .log files in the test directory. To improve
> triaging failures, the test needs to put results on stdout as they
> become available. Achieve this by creating a new 'test-driver-tee'
> script based on the original 'test-driver' placed by autogen.sh. We then
> need to patch Makefile.am to point the LOG_DRIVER and TEST_LOG_DRIVER
> variables at the new script.
>
> To make sure that the buffers are flushed in a timely manner (instead of
> only periodically reporting groups of results), add coreutils to the
> ptest RDEPENDS so that stdbuf is available, otherwise we only get
> increased granularity in the output (but the results tend to be flushed
> all at once), which isn't as helpful for triaging intermittent timeout
> situations.
>
> AI-Generated: Uses Claude Sonnet 5
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>  ...ts-stream-per-test-results-to-stdout.patch | 237 ++++++++++++++++++
>  .../libpng/libpng_1.6.58.bb                   |   5 +-
>  2 files changed, 240 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-multimedia/libpng/files/0001-tests-stream-per-test-results-to-stdout.patch
>
> diff --git a/meta/recipes-multimedia/libpng/files/0001-tests-stream-per-test-results-to-stdout.patch b/meta/recipes-multimedia/libpng/files/0001-tests-stream-per-test-results-to-stdout.patch
> new file mode 100644
> index 0000000000..139495d211
> --- /dev/null
> +++ b/meta/recipes-multimedia/libpng/files/0001-tests-stream-per-test-results-to-stdout.patch
> @@ -0,0 +1,237 @@
> +From e0898e243cbef677a862612f04b6bca2b07c2453 Mon Sep 17 00:00:00 2001
> +From: Trevor Gamblin <tgamblin@baylibre.com>
> +Date: Wed, 12 Aug 2026 12:22:54 -0400
> +Subject: [PATCH] tests: stream per-test results to stdout
> +
> +Modify Makefile.am and create a new 'test-driver-tee' script to uses in
> +libpng's ptest suite, so we can live capture test results. This way, if
> +the test suite hits a timeout while running (e.g. on qemuriscv64), we
> +have some extra information about what happened in a specific test
> +and/or an indication of what wouldn't run.
> +
> +The diff between the original test-driver and test-driver-tee:
> +
> +|do_exit='rm -f $log_file $trs_file; (exit $st); exit $st'     | do_exit='rm -f $log_file $trs_file $log_file.exit; (exit $st)
> +|"$@" >>"$log_file" 2>&1                                       | # Programs that print many lines in a loop (e.g. pngimage's p
> +|estatus=$?                                                    | # lines) fully-buffer stdio once it's not a tty, so without t
> +|                                                              > # output would arrive in one dump at exit instead of streamin
> +|                                                              > if command -v stdbuf >/dev/null 2>&1; then
> +|                                                              >   set -- stdbuf -oL -eL "$@"
> +|                                                              > fi
> +|                                                              > { "$@"; echo $? >"$log_file.exit"; } 2>&1 | tee -a "$log_file
> +|                                                              > estatus=$(cat "$log_file.exit")
> +|                                                              > rm -f "$log_file.exit"
> +
> +AI-Generated: Uses Claude Sonnet 5
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +
> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> +---
> + Makefile.am     |   8 ++-
> + test-driver-tee | 167 ++++++++++++++++++++++++++++++++++++++++++++++++
> + 2 files changed, 174 insertions(+), 1 deletion(-)
> + create mode 100755 test-driver-tee
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index eb7078158..a2e64fbe6 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -111,6 +111,12 @@ TESTS =\
> +    tests/pngunknown-vpAg\
> +    tests/pngimage-quick\
> +    tests/pngimage-full
> ++
> ++# Stream each test's detailed output to stdout as it runs (the stock
> ++# test-driver only writes it to the per-test .log file), while still
> ++# leaving the final automake summary for the end of the run.
> ++LOG_DRIVER = $(SHELL) $(top_srcdir)/test-driver-tee
> ++TEST_LOG_DRIVER = $(SHELL) $(top_srcdir)/test-driver-tee
> + endif
> +
> + # man pages
> +@@ -165,7 +171,7 @@ pkgconfig_DATA = libpng@PNGLIB_MAJOR@@PNGLIB_MINOR@.pc
> + # not done in the source directory!
> + EXTRA_DIST= \
> +       ANNOUNCE AUTHORS CHANGES INSTALL LICENSE README TODO TRADEMARK \
> +-      pngtest.png pngbar.png pngnow.png pngbar.jpg autogen.sh \
> ++      pngtest.png pngbar.png pngnow.png pngbar.jpg autogen.sh test-driver-tee \
> +       ${srcdir}/ci ${srcdir}/contrib ${srcdir}/projects ${srcdir}/scripts \
> +       $(TESTS) $(XFAIL_TESTS) tests/pngstest \
> +       CMakeLists.txt example.c libpng-manual.txt
> +diff --git a/test-driver-tee b/test-driver-tee
> +new file mode 100755
> +index 000000000..a6d5aa027
> +--- /dev/null
> ++++ b/test-driver-tee
> +@@ -0,0 +1,167 @@
> ++#! /bin/sh
> ++# test-driver - basic testsuite driver script.
> ++
> ++scriptversion=2025-06-18.21; # UTC
> ++
> ++# Copyright (C) 2011-2025 Free Software Foundation, Inc.
> ++#
> ++# This program is free software; you can redistribute it and/or modify
> ++# it under the terms of the GNU General Public License as published by
> ++# the Free Software Foundation; either version 2, or (at your option)
> ++# any later version.
> ++#
> ++# This program is distributed in the hope that it will be useful,
> ++# but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> ++# GNU General Public License for more details.
> ++#
> ++# You should have received a copy of the GNU General Public License
> ++# along with this program.  If not, see <https://www.gnu.org/licenses/>.
> ++
> ++# As a special exception to the GNU General Public License, if you
> ++# distribute this file as part of a program that contains a
> ++# configuration script generated by Autoconf, you may include it under
> ++# the same distribution terms that you use for the rest of that program.
> ++
> ++# This file is maintained in Automake, please report
> ++# bugs to <bug-automake@gnu.org> or send patches to
> ++# <automake-patches@gnu.org>.
> ++
> ++# Make unconditional expansion of undefined variables an error.  This
> ++# helps a lot in preventing typo-related bugs.
> ++set -u
> ++
> ++usage_error ()
> ++{
> ++  echo "$0: $*" >&2
> ++  print_usage >&2
> ++  exit 2
> ++}
> ++
> ++print_usage ()
> ++{
> ++  cat <<END
> ++Usage:
> ++  test-driver --test-name NAME --log-file PATH --trs-file PATH
> ++              [--expect-failure {yes|no}] [--color-tests {yes|no}]
> ++              [--collect-skipped-logs {yes|no}]
> ++              [--enable-hard-errors {yes|no}] [--]
> ++              TEST-SCRIPT [TEST-SCRIPT-ARGUMENTS]
> ++
> ++The '--test-name', '--log-file' and '--trs-file' options are mandatory.
> ++See the GNU Automake documentation for information.
> ++
> ++Report bugs to <bug-automake@gnu.org>.
> ++GNU Automake home page: <https://www.gnu.org/software/automake/>.
> ++General help using GNU software: <https://www.gnu.org/gethelp/>.
> ++END
> ++}
> ++
> ++test_name= # Used for reporting.
> ++log_file=  # Where to save the output of the test script.
> ++trs_file=  # Where to save the metadata of the test run.
> ++expect_failure=no
> ++color_tests=no
> ++collect_skipped_logs=yes
> ++enable_hard_errors=yes
> ++while test $# -gt 0; do
> ++  case $1 in
> ++  --help) print_usage; exit $?;;
> ++  --version) echo "test-driver (GNU Automake) $scriptversion"; exit $?;;
> ++  --test-name) test_name=$2; shift;;
> ++  --log-file) log_file=$2; shift;;
> ++  --trs-file) trs_file=$2; shift;;
> ++  --color-tests) color_tests=$2; shift;;
> ++  --collect-skipped-logs) collect_skipped_logs=$2; shift;;
> ++  --expect-failure) expect_failure=$2; shift;;
> ++  --enable-hard-errors) enable_hard_errors=$2; shift;;
> ++  --) shift; break;;
> ++  -*) usage_error "invalid option: '$1'";;
> ++   *) break;;
> ++  esac
> ++  shift
> ++done
> ++
> ++missing_opts=
> ++test x"$test_name" = x && missing_opts="$missing_opts --test-name"
> ++test x"$log_file"  = x && missing_opts="$missing_opts --log-file"
> ++test x"$trs_file"  = x && missing_opts="$missing_opts --trs-file"
> ++if test x"$missing_opts" != x; then
> ++  usage_error "the following mandatory options are missing:$missing_opts"
> ++fi
> ++
> ++if test $# -eq 0; then
> ++  usage_error "missing argument"
> ++fi
> ++
> ++if test $color_tests = yes; then
> ++  # Keep this in sync with 'lib/am/check.am:$(am__tty_colors)'.
> ++  red=' [0;31m' # Red.
> ++  grn=' [0;32m' # Green.
> ++  lgn=' [1;32m' # Light green.
> ++  blu=' [1;34m' # Blue.
> ++  mgn=' [0;35m' # Magenta.
> ++  std=' [m'     # No color.
> ++else
> ++  red= grn= lgn= blu= mgn= std=
> ++fi
> ++
> ++do_exit='rm -f $log_file $trs_file $log_file.exit; (exit $st); exit $st'
> ++trap "st=129; $do_exit" 1
> ++trap "st=130; $do_exit" 2
> ++trap "st=141; $do_exit" 13
> ++trap "st=143; $do_exit" 15
> ++
> ++# Test script is run here. We create the file first, then append to it,
> ++# to ameliorate tests themselves also writing to the log file. Our tests
> ++# don't, but others can (automake bug#35762).
> ++: >"$log_file"
> ++# Programs that print many lines in a loop (e.g. pngimage's per-file PASS
> ++# lines) fully-buffer stdio once it's not a tty, so without this their
> ++# output would arrive in one dump at exit instead of streaming live.
> ++if command -v stdbuf >/dev/null 2>&1; then
> ++  set -- stdbuf -oL -eL "$@"
> ++fi
> ++{ "$@"; echo $? >"$log_file.exit"; } 2>&1 | tee -a "$log_file"
> ++estatus=$(cat "$log_file.exit")
> ++rm -f "$log_file.exit"
> ++
> ++if test $enable_hard_errors = no && test $estatus -eq 99; then
> ++  tweaked_estatus=1
> ++else
> ++  tweaked_estatus=$estatus
> ++fi
> ++
> ++case $tweaked_estatus:$expect_failure in
> ++  0:yes) col=$red res=XPASS recheck=yes gcopy=yes;;
> ++  0:*)   col=$grn res=PASS  recheck=no  gcopy=no;;
> ++  77:*)  col=$blu res=SKIP  recheck=no  gcopy=$collect_skipped_logs;;
> ++  99:*)  col=$mgn res=ERROR recheck=yes gcopy=yes;;
> ++  *:yes) col=$lgn res=XFAIL recheck=no  gcopy=yes;;
> ++  *:*)   col=$red res=FAIL  recheck=yes gcopy=yes;;
> ++esac
> ++
> ++# Report the test outcome and exit status in the logs, so that one can
> ++# know whether the test passed or failed simply by looking at the '.log'
> ++# file, without the need of also peaking into the corresponding '.trs'
> ++# file (automake bug#11814).
> ++echo "$res $test_name (exit status: $estatus)" >>"$log_file"
> ++
> ++# Report outcome to console.
> ++echo "${col}${res}${std}: $test_name"
> ++
> ++# Register the test result, and other relevant metadata.
> ++echo ":test-result: $res" > $trs_file
> ++echo ":global-test-result: $res" >> $trs_file
> ++echo ":recheck: $recheck" >> $trs_file
> ++echo ":copy-in-global-log: $gcopy" >> $trs_file
> ++
> ++# Local Variables:
> ++# mode: shell-script
> ++# sh-indentation: 2
> ++# eval: (add-hook 'before-save-hook 'time-stamp nil t)
> ++# time-stamp-start: "scriptversion="
> ++# time-stamp-format: "%Y-%02m-%02d.%02H"
> ++# time-stamp-time-zone: "UTC0"
> ++# time-stamp-end: "; # UTC"
> ++# End:
> +--
> +2.55.0
> +
> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.58.bb b/meta/recipes-multimedia/libpng/libpng_1.6.58.bb
> index 6e4e5e9f38..928b010c9c 100644
> --- a/meta/recipes-multimedia/libpng/libpng_1.6.58.bb
> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.58.bb
> @@ -12,6 +12,7 @@ LIBV = "16"
>
>  SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
>             file://run-ptest \
> +           file://0001-tests-stream-per-test-results-to-stdout.patch \
>  "
>
>  SRC_URI[sha256sum] = "28eb403f51f0f7405249132cecfe82ea5c0ef97f1b32c5a65828814ae0d34775"
> @@ -33,13 +34,13 @@ PACKAGES =+ "${PN}-tools"
>
>  FILES:${PN}-tools = "${bindir}/png-fix-itxt ${bindir}/pngfix ${bindir}/pngcp"
>
> -RDEPENDS:${PN}-ptest += "make bash gawk"
> +RDEPENDS:${PN}-ptest += "make bash gawk coreutils"
>
>  do_install_ptest() {
>      # Install test scripts to ptest path
>      install -d ${D}${PTEST_PATH}/src/tests
>      install -m 755 ${S}/tests/* ${D}${PTEST_PATH}/src/tests
> -    install -m 755 ${S}/test-driver ${D}${PTEST_PATH}
> +    install -m 755 ${S}/test-driver-tee ${D}${PTEST_PATH}
>      install -d ${D}${PTEST_PATH}/src/tests/scripts
>      install -m 755 ${S}/scripts/*.awk ${D}${PTEST_PATH}/src/tests/scripts
>      install -m 644 ${S}/scripts/pnglib* ${S}/scripts/*.c ${S}/scripts/*.def ${S}/scripts/macro.lst ${D}${PTEST_PATH}/src/tests/scripts
> --
> 2.55.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#243335): https://lists.openembedded.org/g/openembedded-core/message/243335
> Mute This Topic: https://lists.openembedded.org/mt/120729819/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


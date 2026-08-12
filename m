Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 951CFC5CFEB
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 06:31:40 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2723.1786561045504526458
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 11:57:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=p2iV9qGn;
 spf=pass (domain: baylibre.com, ip: 209.85.219.43, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8efcfdb2b43so10597796d6.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 11:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786561044; x=1787165844; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jmar9jTtHsbxag5je3vpzzChfY327IK64Z7RCj6S2DY=;
        b=p2iV9qGnqYw+rk3mGyQ7YLAIIH8s+wjFYxoVXH36mto0PK3eR+YckSD+jQLoGv7yPa
         654dkjq20ctls1h1Vqcg0iri9TmWasRzChYJUEzaAsqREfxA9xEQYi6WONY0JYcHA18Y
         X+0CCRZ/GDVM451Ai+hlr4byOnXqVnmPX2p26W1tNJQ+pjNXf+HXkSmFSv9xblI+MsEI
         e+EXZdt+Sf/1Vfaki16tI9sFkEcrgH8ssS+dzCycwZAzRocUMNjkkx38GLgesK7vzlAH
         d31PXKQhLQVPPcrJXlnsvbPFDKGdCOjaSY4UOJeBx/MNG1aRINXPwzgs2RedvaxsiX87
         Z/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786561044; x=1787165844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jmar9jTtHsbxag5je3vpzzChfY327IK64Z7RCj6S2DY=;
        b=W/5+B0rPPgQbFKgXu0DFBYJxKypmR2MqR6cb6RoXlRMgPSNTtAGFqLZUbMVhTKAqUG
         8dNCPJ68ZyL0WW55CCIx8LZ5XzsF3vCisYw7Y/V92MwWHy6Aom65+tMjd16HwD8dATRF
         Nyd3xNydBefDLj81vqO3tEZEbfI4qqQfSu0Wlwjrdu3E8gmaFIQEUG1KuYVl+CfKcKLc
         XGph1abbvNFSSL3a/6Aqyz9oyuQJQHN0kURWuNwDdu5VKhhzDT/THQPnkshygunF5EFX
         /H4vrPWoeUOvXch7bCLaUbvAtFDCD+ebdHSvyHDeN/Yd/9IN7ffvVh0c2eqeEhhreGIY
         +xig==
X-Gm-Message-State: AOJu0Yy4f1n9yXYXy2/OxB0p4+q6R8qw7oN61MeB88OZR03jph2i+6J0
	ob2yk4Y/rWGFiEPAOW5Tv/p0SHnFdkbcE+BsBp0iiL7UTt0WPnO111fTkzoRF0bAwemz7zAe/US
	KWWTIv8Q=
X-Gm-Gg: AR+sD12O9XlhzXcuect+/+TPdmBVV6SxY/Weqob/2j2DpMC9YM737tZFZag5GFxUkwI
	nit34j+lILVXZB+Eq6TZowlIvdaBYOe6qfu60cilJ9Yt/kigK2ZT1I7a+ZD8EfSKQwNDonaNkSv
	XiZh449Fl16tLKN4ahA4gbGKowfxe14e7Mj1aMLk9kqyLUYmPgSkvHzggzErsKf5r7DxzemCzVk
	ZZC3xQtcsUyX8F3kV3zzRBvi47nGiRLA0U8HYGnVIDe01PSMipx+b/0fldeBOzrmdHGz9dFkuEx
	yY4BiMKJfmnI1HZJUXqdRKalJh7NoBe+Bx46lwJv257grzBX4etIRY7Z7rcRrVfBsPOkWxiFyOo
	Yjw8WmfmMN7sA0l88ChjjY/8qiIYg7mbEZM3/yUohDH1lvaCAh0vV7yHkWIoKgkslq/jIYnnqef
	Rxh3L+ewlgQh8OD2AyKAAzB7YksLjc68uCXqQXp6juQDMm/iFLrLFymCqQZ700ZVDj
X-Received: by 2002:a05:6214:54c3:b0:8cc:d066:54d with SMTP id 6a1803df08f44-90a7000bcb4mr69082936d6.24.1786561043981;
        Wed, 12 Aug 2026 11:57:23 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a6c272a73sm27647066d6.8.2026.08.12.11.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 11:57:23 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: pratik.farkase@est.tech,
	richard.purdie@linuxfoundation.org
Subject: [OE-core][PATCH] libpng: capture per-test ptest results
Date: Wed, 12 Aug 2026 14:57:22 -0400
Message-ID: <20260812185722.3994412-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 06:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243335

The libpng test suite reports detailed information about results, but
does so in per-test .log files in the test directory. To improve
triaging failures, the test needs to put results on stdout as they
become available. Achieve this by creating a new 'test-driver-tee'
script based on the original 'test-driver' placed by autogen.sh. We then
need to patch Makefile.am to point the LOG_DRIVER and TEST_LOG_DRIVER
variables at the new script.

To make sure that the buffers are flushed in a timely manner (instead of
only periodically reporting groups of results), add coreutils to the
ptest RDEPENDS so that stdbuf is available, otherwise we only get
increased granularity in the output (but the results tend to be flushed
all at once), which isn't as helpful for triaging intermittent timeout
situations.

AI-Generated: Uses Claude Sonnet 5

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...ts-stream-per-test-results-to-stdout.patch | 237 ++++++++++++++++++
 .../libpng/libpng_1.6.58.bb                   |   5 +-
 2 files changed, 240 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/libpng/files/0001-tests-stream-per-test-results-to-stdout.patch

diff --git a/meta/recipes-multimedia/libpng/files/0001-tests-stream-per-test-results-to-stdout.patch b/meta/recipes-multimedia/libpng/files/0001-tests-stream-per-test-results-to-stdout.patch
new file mode 100644
index 0000000000..139495d211
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/files/0001-tests-stream-per-test-results-to-stdout.patch
@@ -0,0 +1,237 @@
+From e0898e243cbef677a862612f04b6bca2b07c2453 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Wed, 12 Aug 2026 12:22:54 -0400
+Subject: [PATCH] tests: stream per-test results to stdout
+
+Modify Makefile.am and create a new 'test-driver-tee' script to uses in
+libpng's ptest suite, so we can live capture test results. This way, if
+the test suite hits a timeout while running (e.g. on qemuriscv64), we
+have some extra information about what happened in a specific test
+and/or an indication of what wouldn't run.
+
+The diff between the original test-driver and test-driver-tee:
+
+|do_exit='rm -f $log_file $trs_file; (exit $st); exit $st'     | do_exit='rm -f $log_file $trs_file $log_file.exit; (exit $st)
+|"$@" >>"$log_file" 2>&1                                       | # Programs that print many lines in a loop (e.g. pngimage's p
+|estatus=$?                                                    | # lines) fully-buffer stdio once it's not a tty, so without t
+|                                                              > # output would arrive in one dump at exit instead of streamin
+|                                                              > if command -v stdbuf >/dev/null 2>&1; then
+|                                                              >   set -- stdbuf -oL -eL "$@"
+|                                                              > fi
+|                                                              > { "$@"; echo $? >"$log_file.exit"; } 2>&1 | tee -a "$log_file
+|                                                              > estatus=$(cat "$log_file.exit")
+|                                                              > rm -f "$log_file.exit"
+
+AI-Generated: Uses Claude Sonnet 5
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ Makefile.am     |   8 ++-
+ test-driver-tee | 167 ++++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 174 insertions(+), 1 deletion(-)
+ create mode 100755 test-driver-tee
+
+diff --git a/Makefile.am b/Makefile.am
+index eb7078158..a2e64fbe6 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -111,6 +111,12 @@ TESTS =\
+    tests/pngunknown-vpAg\
+    tests/pngimage-quick\
+    tests/pngimage-full
++
++# Stream each test's detailed output to stdout as it runs (the stock
++# test-driver only writes it to the per-test .log file), while still
++# leaving the final automake summary for the end of the run.
++LOG_DRIVER = $(SHELL) $(top_srcdir)/test-driver-tee
++TEST_LOG_DRIVER = $(SHELL) $(top_srcdir)/test-driver-tee
+ endif
+ 
+ # man pages
+@@ -165,7 +171,7 @@ pkgconfig_DATA = libpng@PNGLIB_MAJOR@@PNGLIB_MINOR@.pc
+ # not done in the source directory!
+ EXTRA_DIST= \
+ 	ANNOUNCE AUTHORS CHANGES INSTALL LICENSE README TODO TRADEMARK \
+-	pngtest.png pngbar.png pngnow.png pngbar.jpg autogen.sh \
++	pngtest.png pngbar.png pngnow.png pngbar.jpg autogen.sh test-driver-tee \
+ 	${srcdir}/ci ${srcdir}/contrib ${srcdir}/projects ${srcdir}/scripts \
+ 	$(TESTS) $(XFAIL_TESTS) tests/pngstest \
+ 	CMakeLists.txt example.c libpng-manual.txt
+diff --git a/test-driver-tee b/test-driver-tee
+new file mode 100755
+index 000000000..a6d5aa027
+--- /dev/null
++++ b/test-driver-tee
+@@ -0,0 +1,167 @@
++#! /bin/sh
++# test-driver - basic testsuite driver script.
++
++scriptversion=2025-06-18.21; # UTC
++
++# Copyright (C) 2011-2025 Free Software Foundation, Inc.
++#
++# This program is free software; you can redistribute it and/or modify
++# it under the terms of the GNU General Public License as published by
++# the Free Software Foundation; either version 2, or (at your option)
++# any later version.
++#
++# This program is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++#
++# You should have received a copy of the GNU General Public License
++# along with this program.  If not, see <https://www.gnu.org/licenses/>.
++
++# As a special exception to the GNU General Public License, if you
++# distribute this file as part of a program that contains a
++# configuration script generated by Autoconf, you may include it under
++# the same distribution terms that you use for the rest of that program.
++
++# This file is maintained in Automake, please report
++# bugs to <bug-automake@gnu.org> or send patches to
++# <automake-patches@gnu.org>.
++
++# Make unconditional expansion of undefined variables an error.  This
++# helps a lot in preventing typo-related bugs.
++set -u
++
++usage_error ()
++{
++  echo "$0: $*" >&2
++  print_usage >&2
++  exit 2
++}
++
++print_usage ()
++{
++  cat <<END
++Usage:
++  test-driver --test-name NAME --log-file PATH --trs-file PATH
++              [--expect-failure {yes|no}] [--color-tests {yes|no}]
++              [--collect-skipped-logs {yes|no}]
++              [--enable-hard-errors {yes|no}] [--]
++              TEST-SCRIPT [TEST-SCRIPT-ARGUMENTS]
++
++The '--test-name', '--log-file' and '--trs-file' options are mandatory.
++See the GNU Automake documentation for information.
++
++Report bugs to <bug-automake@gnu.org>.
++GNU Automake home page: <https://www.gnu.org/software/automake/>.
++General help using GNU software: <https://www.gnu.org/gethelp/>.
++END
++}
++
++test_name= # Used for reporting.
++log_file=  # Where to save the output of the test script.
++trs_file=  # Where to save the metadata of the test run.
++expect_failure=no
++color_tests=no
++collect_skipped_logs=yes
++enable_hard_errors=yes
++while test $# -gt 0; do
++  case $1 in
++  --help) print_usage; exit $?;;
++  --version) echo "test-driver (GNU Automake) $scriptversion"; exit $?;;
++  --test-name) test_name=$2; shift;;
++  --log-file) log_file=$2; shift;;
++  --trs-file) trs_file=$2; shift;;
++  --color-tests) color_tests=$2; shift;;
++  --collect-skipped-logs) collect_skipped_logs=$2; shift;;
++  --expect-failure) expect_failure=$2; shift;;
++  --enable-hard-errors) enable_hard_errors=$2; shift;;
++  --) shift; break;;
++  -*) usage_error "invalid option: '$1'";;
++   *) break;;
++  esac
++  shift
++done
++
++missing_opts=
++test x"$test_name" = x && missing_opts="$missing_opts --test-name"
++test x"$log_file"  = x && missing_opts="$missing_opts --log-file"
++test x"$trs_file"  = x && missing_opts="$missing_opts --trs-file"
++if test x"$missing_opts" != x; then
++  usage_error "the following mandatory options are missing:$missing_opts"
++fi
++
++if test $# -eq 0; then
++  usage_error "missing argument"
++fi
++
++if test $color_tests = yes; then
++  # Keep this in sync with 'lib/am/check.am:$(am__tty_colors)'.
++  red='[0;31m' # Red.
++  grn='[0;32m' # Green.
++  lgn='[1;32m' # Light green.
++  blu='[1;34m' # Blue.
++  mgn='[0;35m' # Magenta.
++  std='[m'     # No color.
++else
++  red= grn= lgn= blu= mgn= std=
++fi
++
++do_exit='rm -f $log_file $trs_file $log_file.exit; (exit $st); exit $st'
++trap "st=129; $do_exit" 1
++trap "st=130; $do_exit" 2
++trap "st=141; $do_exit" 13
++trap "st=143; $do_exit" 15
++
++# Test script is run here. We create the file first, then append to it,
++# to ameliorate tests themselves also writing to the log file. Our tests
++# don't, but others can (automake bug#35762).
++: >"$log_file"
++# Programs that print many lines in a loop (e.g. pngimage's per-file PASS
++# lines) fully-buffer stdio once it's not a tty, so without this their
++# output would arrive in one dump at exit instead of streaming live.
++if command -v stdbuf >/dev/null 2>&1; then
++  set -- stdbuf -oL -eL "$@"
++fi
++{ "$@"; echo $? >"$log_file.exit"; } 2>&1 | tee -a "$log_file"
++estatus=$(cat "$log_file.exit")
++rm -f "$log_file.exit"
++
++if test $enable_hard_errors = no && test $estatus -eq 99; then
++  tweaked_estatus=1
++else
++  tweaked_estatus=$estatus
++fi
++
++case $tweaked_estatus:$expect_failure in
++  0:yes) col=$red res=XPASS recheck=yes gcopy=yes;;
++  0:*)   col=$grn res=PASS  recheck=no  gcopy=no;;
++  77:*)  col=$blu res=SKIP  recheck=no  gcopy=$collect_skipped_logs;;
++  99:*)  col=$mgn res=ERROR recheck=yes gcopy=yes;;
++  *:yes) col=$lgn res=XFAIL recheck=no  gcopy=yes;;
++  *:*)   col=$red res=FAIL  recheck=yes gcopy=yes;;
++esac
++
++# Report the test outcome and exit status in the logs, so that one can
++# know whether the test passed or failed simply by looking at the '.log'
++# file, without the need of also peaking into the corresponding '.trs'
++# file (automake bug#11814).
++echo "$res $test_name (exit status: $estatus)" >>"$log_file"
++
++# Report outcome to console.
++echo "${col}${res}${std}: $test_name"
++
++# Register the test result, and other relevant metadata.
++echo ":test-result: $res" > $trs_file
++echo ":global-test-result: $res" >> $trs_file
++echo ":recheck: $recheck" >> $trs_file
++echo ":copy-in-global-log: $gcopy" >> $trs_file
++
++# Local Variables:
++# mode: shell-script
++# sh-indentation: 2
++# eval: (add-hook 'before-save-hook 'time-stamp nil t)
++# time-stamp-start: "scriptversion="
++# time-stamp-format: "%Y-%02m-%02d.%02H"
++# time-stamp-time-zone: "UTC0"
++# time-stamp-end: "; # UTC"
++# End:
+-- 
+2.55.0
+
diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.58.bb b/meta/recipes-multimedia/libpng/libpng_1.6.58.bb
index 6e4e5e9f38..928b010c9c 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.58.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.58.bb
@@ -12,6 +12,7 @@ LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://run-ptest \
+           file://0001-tests-stream-per-test-results-to-stdout.patch \
 "
 
 SRC_URI[sha256sum] = "28eb403f51f0f7405249132cecfe82ea5c0ef97f1b32c5a65828814ae0d34775"
@@ -33,13 +34,13 @@ PACKAGES =+ "${PN}-tools"
 
 FILES:${PN}-tools = "${bindir}/png-fix-itxt ${bindir}/pngfix ${bindir}/pngcp"
 
-RDEPENDS:${PN}-ptest += "make bash gawk"
+RDEPENDS:${PN}-ptest += "make bash gawk coreutils"
 
 do_install_ptest() {
     # Install test scripts to ptest path
     install -d ${D}${PTEST_PATH}/src/tests
     install -m 755 ${S}/tests/* ${D}${PTEST_PATH}/src/tests
-    install -m 755 ${S}/test-driver ${D}${PTEST_PATH}
+    install -m 755 ${S}/test-driver-tee ${D}${PTEST_PATH}
     install -d ${D}${PTEST_PATH}/src/tests/scripts
     install -m 755 ${S}/scripts/*.awk ${D}${PTEST_PATH}/src/tests/scripts
     install -m 644 ${S}/scripts/pnglib* ${S}/scripts/*.c ${S}/scripts/*.def ${S}/scripts/macro.lst ${D}${PTEST_PATH}/src/tests/scripts
-- 
2.55.0



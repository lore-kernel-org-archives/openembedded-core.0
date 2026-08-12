Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA1CAC5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 06:31:30 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2687.1786561023574886119
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 11:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=TyPk/zN4;
 spf=pass (domain: baylibre.com, ip: 209.85.160.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-52b3934af3fso14662971cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 11:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786561022; x=1787165822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jmar9jTtHsbxag5je3vpzzChfY327IK64Z7RCj6S2DY=;
        b=TyPk/zN4dSW6VPGKPmu3T10GxEYfomSKTnoXporHI2i0FKNkkcxCDh4bTDwO6EGnLq
         UhIovkvqMwtDrRyU1/92Q2uNe+5e7d9hp/zprBJoezKzuKGaFK8qy4X0Nb8Bh/zF17kR
         bDwiP2IJPj3Z/CWv/58tcLivdps3aJ8lTsZNndvj+GUGmAlNs1K1jTiTnhovpCn84ZKI
         9WVDFFiTwcLcscH8kZdQgVwpS+nsruCjjTnWEygNRNQKXgqu1YDCfm+2cxKQ+IziJxkn
         ThrGS93F06yRfjwjW2JZloDwrpTai9bmltDAWTVfHGsqslfeNMZuutILFQ88kECeKUfY
         dduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786561022; x=1787165822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jmar9jTtHsbxag5je3vpzzChfY327IK64Z7RCj6S2DY=;
        b=MbJL5G/rVW608tAzw0sG90ufbKb9PJ4HxgCq5gbotigrSpFP/Oxfsny2rwnMi+920b
         cN+HoDOQs+tShA7VFYvMjXKIv1Wa54G0bq+wLmMblyywjWysp5u1qdgyowAH25voq9hs
         yXnwvRzkEP5n5u0cKUnB2MV/3P78cEHWaER0f5Y2CGLXT6DccepvxceLrz0c1sD1JOqR
         ba5hpczq3Lor2ZsuN63GcHu1VzS1b8mjgnjZ4Y/6h/bUqwPgvdOPJiNP/BWQ3VZ35jnG
         N855JHN2nUu21idIFYi6dsJ/lmQEqKHio9rXTiF/V+GgGJl+a6qsfN7bp89f2ljSGnCa
         LCXg==
X-Gm-Message-State: AOJu0YytXE6sbTvp8MxUlzFcaYFjmGg64Bm0SuNet11aLU+fQL1PHxqC
	EKkVlqC6JT4qsaP5/2AieZtPbeqRlwJFm35E0MVVSkY0v3AvXgrQnfhi5aTUjpG9blb25mrsjI+
	u3HEnGbE=
X-Gm-Gg: AR+sD130Gvi8I4LKrtlFHxh6vbMWeovY/nHRbUCwxzIjt4uoYrBZvHKpMXOaEqL3/VA
	y+MRp1+0thNkKNLeJ3hFRHBPLcrrYr3Chei6zHyhJVf7vbmeHwuOvAZaj28k+trfo9M/QiaS9GL
	C6amkU33z2UcCmlezJsaGnvsPhldl1Spv13yxIXqYzKLE+PvHr8p/eUo7LchtMKcjg5khu2Ir24
	1sGDy3d+2/OKuEycranvRw3Mo5qfgzfVBMtgFppcZE1BzMGYXdCTNPAJwFKVpjlwUaU/NnSZ1EO
	xnZPIeU3y22hMe1TkqyNHvEyHirvv67IcJxd1RHkpFVN1eRxZLEqXr8s1oC+8LdhWrmZsMi5JwX
	3jXgaeWTioxjISTNud3OdcEIpOph5eY0+IhG5G/CRQeJ3OkX1n754Jpo9QSc4v3fZ9/jfi47Aa8
	NFAGwpaaJ/pftHfvVVsZMOPkzZSWc1eGp7XV3NTNkQNL/GYzJeeRn6U9DLbX7vLmI+
X-Received: by 2002:a05:622a:5888:b0:51b:eb55:2916 with SMTP id d75a77b69052e-52d73d9f3famr2769561cf.34.1786561022230;
        Wed, 12 Aug 2026 11:57:02 -0700 (PDT)
Received: from localhost ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d73fb89aasm600661cf.14.2026.08.12.11.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 11:57:00 -0700 (PDT)
From: "Trevor Gamblin" <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: pratik.farkase@est.tech
Subject: [OE-core][PATCH] libpng: capture per-test ptest results
Date: Wed, 12 Aug 2026 14:56:58 -0400
Message-ID: <20260812185658.3994300-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 06:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243334

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



Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE7DC5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 13:17:22 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18755.1786626979631213073
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 06:16:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=UmyFoAbK;
 spf=pass (domain: baylibre.com, ip: 209.85.216.44, mailfrom: tgamblin@baylibre.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so1976801a91.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 06:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786626979; x=1787231779; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lphnIvwc8H5ZTjfe/veR5g3qCRLCFGWVqNen3cp4Pkw=;
        b=UmyFoAbKtuAaQ5ivDwiHeciLiF/6uSuLUAvrkvGKOzSzz4RuIXozm7Zv28kLzMB6FC
         PUs+uHisYyIwECDudiwxRmP4oQ2ybnk21H/dxf5FOLI70Ny0FWS0AjVDujurx6luW0Mj
         fApTrdSo5hyChRsWZAJUgf4T2kXV1lvM514NGnQ0Vl+AEbDvD+130+9n95f5dYOzygQF
         ki7F3vHvWeYW00B5PuCZgJo8HOtm3G0rmi1AZfmjWnAHt3CS6ykqK7vxCMCTCEte/ih+
         YVSxQ50BV+ZBUWLaEr/MAAG7jU7F+UWdqhGLGOeoK70qb27DPZ62CTu9zCKRLGvG25v3
         T+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786626979; x=1787231779;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lphnIvwc8H5ZTjfe/veR5g3qCRLCFGWVqNen3cp4Pkw=;
        b=Wy/43xgG+pBtU03jmCcwIV2sLqq5EQWxq7eHPwrEFPyEBjLf4Had2vmvEudICN4NOx
         6k2FtEPDGcka0ByHJ3nFsQtEWpQm2iTD4AmZHlkomLzEjgRDxKbxNK6T56Sj/sPOTjHD
         L4vA7N11Ogjvv27+a19hN0ySZFd7aMkdMBFDr6uF/qms3vrfCr3feClIBgmKPbKuvsJQ
         6/odaHsVieIB0HiFKTQR6ELPL+SJApTxQeUoujKtqo+CVExAVB6I0AcipJ1PZGtbSnN4
         /HI/SxPQ5PPZm7rAyZpNOE6KP6XBja4y6Qkzpd7EJF1oR0l0N0suIMB4a6bIY96vqir0
         ReDQ==
X-Gm-Message-State: AOJu0YyWqqKKEKNgOdP9yi6dAaOZ6Tr37j5wEGubgm8cGZNWpA27Fa8g
	9w/z7R2l39OqTSq7p1fFv2Z9DOtbJhX4NRRaYK0cIipXq0TfvFVA3TJXDgiB7mXvQ98=
X-Gm-Gg: AR+sD11DbuyWE/PH8cU9AW9decqAd5RFW3Ht7TKROe04weDB+ISQogETPkEznSwcmqp
	UzlFvTRQkcVRLGgYePyoPiA86FmxYuWFzcdIfIuzFU/7wdE54dxblEraO54SG3bEB53J94P8nv8
	PmyIoBIeUQ9PjBOqYuoNlyO+b2nTsD9doMIY3bJkCTKc9TxX9Trf99FH5DNWN+rLn9yYxEjA2u1
	BJ6TFD32g4JJ1KbBLIAIbAOl9ip45qSNWSmyTqdFFlJ29hJiQEa+mOZ6R2WHQlqrig32uynbKi7
	OYPVxfJgDF7CJRoR2zgmrmjEeuUZwNZKBL8wFUdQjaYYXu2AzF7shKX9poKrE4o8a7EHcjSJMqv
	meUbg25jcWPbJlEu5ZvHVGxDhqySuSRs29rUYS+hfKwmmz/wdi0FqR68bY0+TVfr8z0ZWrNhLCV
	yb1Fac7EndMiIhINXIE8/uRWpnkWXm9K0fQs7drWcQ1MtkXQNCe6Kb30om1E3/3zKvPFF9J6lr9
	9O7dWXmheouiuQ24rxKnozOh2VqbMWy7+5IsjrR1w==
X-Received: by 2002:a17:90b:57ec:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-3931e2442fdmr6452762a91.16.1786626978536;
        Thu, 13 Aug 2026 06:16:18 -0700 (PDT)
Received: from ?IPV6:2001:1970:3847:e000:1977:be2f:4a71:2892? ([2001:1970:3847:e000:1977:be2f:4a71:2892])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931cd46314sm3639579a91.6.2026.08.13.06.16.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 06:16:17 -0700 (PDT)
Message-ID: <019e4560-7a95-45f2-8c82-83edb54ce27a@baylibre.com>
Date: Thu, 13 Aug 2026 09:16:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] libpng: capture per-test ptest results
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, pratik.farkase@est.tech,
 richard.purdie@linuxfoundation.org
References: <20260812185722.3994412-1-tgamblin@baylibre.com>
 <CANNYZj-q_U58TP=EO9m9g_k9O57HswnZumEHMhnwTypU6zgNCw@mail.gmail.com>
From: "Trevor Gamblin" <tgamblin@baylibre.com>
In-Reply-To: <CANNYZj-q_U58TP=EO9m9g_k9O57HswnZumEHMhnwTypU6zgNCw@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 13:17:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243353


On 2026-08-13 06:56, Alexander Kanavin wrote:
> Ugh. This is invasive and difficult to support. Pretty much every
> other automake-based ptest does the same, so if you want to fix it,
> it's better to fix it upstream for all.
Thanks for looking at it. I agree this would be a good improvement to do 
upstream and not limit it to libpng. For now, I would like us to at 
least use it on the AB so that we can try getting a better idea about 
what's failing in the libpng test suite for qemuriscv64. AFAICT the 
failing test is running a battery of checks against stock .png files, 
but without this patch it's not clear if there's a specific case that is 
broken and/or too heavy.
>
> Also, we can instead retrieve those individual log files in case of
> failure together with other ptest artefacts.
>
> Alex
>
> On Thu, 13 Aug 2026 at 08:31, Trevor Gamblin via
> lists.openembedded.org <tgamblin=baylibre.com@lists.openembedded.org>
> wrote:
>> The libpng test suite reports detailed information about results, but
>> does so in per-test .log files in the test directory. To improve
>> triaging failures, the test needs to put results on stdout as they
>> become available. Achieve this by creating a new 'test-driver-tee'
>> script based on the original 'test-driver' placed by autogen.sh. We then
>> need to patch Makefile.am to point the LOG_DRIVER and TEST_LOG_DRIVER
>> variables at the new script.
>>
>> To make sure that the buffers are flushed in a timely manner (instead of
>> only periodically reporting groups of results), add coreutils to the
>> ptest RDEPENDS so that stdbuf is available, otherwise we only get
>> increased granularity in the output (but the results tend to be flushed
>> all at once), which isn't as helpful for triaging intermittent timeout
>> situations.
>>
>> AI-Generated: Uses Claude Sonnet 5
>>
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> ---
>>   ...ts-stream-per-test-results-to-stdout.patch | 237 ++++++++++++++++++
>>   .../libpng/libpng_1.6.58.bb                   |   5 +-
>>   2 files changed, 240 insertions(+), 2 deletions(-)
>>   create mode 100644 meta/recipes-multimedia/libpng/files/0001-tests-stream-per-test-results-to-stdout.patch
>>
>> diff --git a/meta/recipes-multimedia/libpng/files/0001-tests-stream-per-test-results-to-stdout.patch b/meta/recipes-multimedia/libpng/files/0001-tests-stream-per-test-results-to-stdout.patch
>> new file mode 100644
>> index 0000000000..139495d211
>> --- /dev/null
>> +++ b/meta/recipes-multimedia/libpng/files/0001-tests-stream-per-test-results-to-stdout.patch
>> @@ -0,0 +1,237 @@
>> +From e0898e243cbef677a862612f04b6bca2b07c2453 Mon Sep 17 00:00:00 2001
>> +From: Trevor Gamblin <tgamblin@baylibre.com>
>> +Date: Wed, 12 Aug 2026 12:22:54 -0400
>> +Subject: [PATCH] tests: stream per-test results to stdout
>> +
>> +Modify Makefile.am and create a new 'test-driver-tee' script to uses in
>> +libpng's ptest suite, so we can live capture test results. This way, if
>> +the test suite hits a timeout while running (e.g. on qemuriscv64), we
>> +have some extra information about what happened in a specific test
>> +and/or an indication of what wouldn't run.
>> +
>> +The diff between the original test-driver and test-driver-tee:
>> +
>> +|do_exit='rm -f $log_file $trs_file; (exit $st); exit $st'     | do_exit='rm -f $log_file $trs_file $log_file.exit; (exit $st)
>> +|"$@" >>"$log_file" 2>&1                                       | # Programs that print many lines in a loop (e.g. pngimage's p
>> +|estatus=$?                                                    | # lines) fully-buffer stdio once it's not a tty, so without t
>> +|                                                              > # output would arrive in one dump at exit instead of streamin
>> +|                                                              > if command -v stdbuf >/dev/null 2>&1; then
>> +|                                                              >   set -- stdbuf -oL -eL "$@"
>> +|                                                              > fi
>> +|                                                              > { "$@"; echo $? >"$log_file.exit"; } 2>&1 | tee -a "$log_file
>> +|                                                              > estatus=$(cat "$log_file.exit")
>> +|                                                              > rm -f "$log_file.exit"
>> +
>> +AI-Generated: Uses Claude Sonnet 5
>> +
>> +Upstream-Status: Inappropriate [oe-specific]
>> +
>> +Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> +---
>> + Makefile.am     |   8 ++-
>> + test-driver-tee | 167 ++++++++++++++++++++++++++++++++++++++++++++++++
>> + 2 files changed, 174 insertions(+), 1 deletion(-)
>> + create mode 100755 test-driver-tee
>> +
>> +diff --git a/Makefile.am b/Makefile.am
>> +index eb7078158..a2e64fbe6 100644
>> +--- a/Makefile.am
>> ++++ b/Makefile.am
>> +@@ -111,6 +111,12 @@ TESTS =\
>> +    tests/pngunknown-vpAg\
>> +    tests/pngimage-quick\
>> +    tests/pngimage-full
>> ++
>> ++# Stream each test's detailed output to stdout as it runs (the stock
>> ++# test-driver only writes it to the per-test .log file), while still
>> ++# leaving the final automake summary for the end of the run.
>> ++LOG_DRIVER = $(SHELL) $(top_srcdir)/test-driver-tee
>> ++TEST_LOG_DRIVER = $(SHELL) $(top_srcdir)/test-driver-tee
>> + endif
>> +
>> + # man pages
>> +@@ -165,7 +171,7 @@ pkgconfig_DATA = libpng@PNGLIB_MAJOR@@PNGLIB_MINOR@.pc
>> + # not done in the source directory!
>> + EXTRA_DIST= \
>> +       ANNOUNCE AUTHORS CHANGES INSTALL LICENSE README TODO TRADEMARK \
>> +-      pngtest.png pngbar.png pngnow.png pngbar.jpg autogen.sh \
>> ++      pngtest.png pngbar.png pngnow.png pngbar.jpg autogen.sh test-driver-tee \
>> +       ${srcdir}/ci ${srcdir}/contrib ${srcdir}/projects ${srcdir}/scripts \
>> +       $(TESTS) $(XFAIL_TESTS) tests/pngstest \
>> +       CMakeLists.txt example.c libpng-manual.txt
>> +diff --git a/test-driver-tee b/test-driver-tee
>> +new file mode 100755
>> +index 000000000..a6d5aa027
>> +--- /dev/null
>> ++++ b/test-driver-tee
>> +@@ -0,0 +1,167 @@
>> ++#! /bin/sh
>> ++# test-driver - basic testsuite driver script.
>> ++
>> ++scriptversion=2025-06-18.21; # UTC
>> ++
>> ++# Copyright (C) 2011-2025 Free Software Foundation, Inc.
>> ++#
>> ++# This program is free software; you can redistribute it and/or modify
>> ++# it under the terms of the GNU General Public License as published by
>> ++# the Free Software Foundation; either version 2, or (at your option)
>> ++# any later version.
>> ++#
>> ++# This program is distributed in the hope that it will be useful,
>> ++# but WITHOUT ANY WARRANTY; without even the implied warranty of
>> ++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> ++# GNU General Public License for more details.
>> ++#
>> ++# You should have received a copy of the GNU General Public License
>> ++# along with this program.  If not, see <https://www.gnu.org/licenses/>.
>> ++
>> ++# As a special exception to the GNU General Public License, if you
>> ++# distribute this file as part of a program that contains a
>> ++# configuration script generated by Autoconf, you may include it under
>> ++# the same distribution terms that you use for the rest of that program.
>> ++
>> ++# This file is maintained in Automake, please report
>> ++# bugs to <bug-automake@gnu.org> or send patches to
>> ++# <automake-patches@gnu.org>.
>> ++
>> ++# Make unconditional expansion of undefined variables an error.  This
>> ++# helps a lot in preventing typo-related bugs.
>> ++set -u
>> ++
>> ++usage_error ()
>> ++{
>> ++  echo "$0: $*" >&2
>> ++  print_usage >&2
>> ++  exit 2
>> ++}
>> ++
>> ++print_usage ()
>> ++{
>> ++  cat <<END
>> ++Usage:
>> ++  test-driver --test-name NAME --log-file PATH --trs-file PATH
>> ++              [--expect-failure {yes|no}] [--color-tests {yes|no}]
>> ++              [--collect-skipped-logs {yes|no}]
>> ++              [--enable-hard-errors {yes|no}] [--]
>> ++              TEST-SCRIPT [TEST-SCRIPT-ARGUMENTS]
>> ++
>> ++The '--test-name', '--log-file' and '--trs-file' options are mandatory.
>> ++See the GNU Automake documentation for information.
>> ++
>> ++Report bugs to <bug-automake@gnu.org>.
>> ++GNU Automake home page: <https://www.gnu.org/software/automake/>.
>> ++General help using GNU software: <https://www.gnu.org/gethelp/>.
>> ++END
>> ++}
>> ++
>> ++test_name= # Used for reporting.
>> ++log_file=  # Where to save the output of the test script.
>> ++trs_file=  # Where to save the metadata of the test run.
>> ++expect_failure=no
>> ++color_tests=no
>> ++collect_skipped_logs=yes
>> ++enable_hard_errors=yes
>> ++while test $# -gt 0; do
>> ++  case $1 in
>> ++  --help) print_usage; exit $?;;
>> ++  --version) echo "test-driver (GNU Automake) $scriptversion"; exit $?;;
>> ++  --test-name) test_name=$2; shift;;
>> ++  --log-file) log_file=$2; shift;;
>> ++  --trs-file) trs_file=$2; shift;;
>> ++  --color-tests) color_tests=$2; shift;;
>> ++  --collect-skipped-logs) collect_skipped_logs=$2; shift;;
>> ++  --expect-failure) expect_failure=$2; shift;;
>> ++  --enable-hard-errors) enable_hard_errors=$2; shift;;
>> ++  --) shift; break;;
>> ++  -*) usage_error "invalid option: '$1'";;
>> ++   *) break;;
>> ++  esac
>> ++  shift
>> ++done
>> ++
>> ++missing_opts=
>> ++test x"$test_name" = x && missing_opts="$missing_opts --test-name"
>> ++test x"$log_file"  = x && missing_opts="$missing_opts --log-file"
>> ++test x"$trs_file"  = x && missing_opts="$missing_opts --trs-file"
>> ++if test x"$missing_opts" != x; then
>> ++  usage_error "the following mandatory options are missing:$missing_opts"
>> ++fi
>> ++
>> ++if test $# -eq 0; then
>> ++  usage_error "missing argument"
>> ++fi
>> ++
>> ++if test $color_tests = yes; then
>> ++  # Keep this in sync with 'lib/am/check.am:$(am__tty_colors)'.
>> ++  red=' [0;31m' # Red.
>> ++  grn=' [0;32m' # Green.
>> ++  lgn=' [1;32m' # Light green.
>> ++  blu=' [1;34m' # Blue.
>> ++  mgn=' [0;35m' # Magenta.
>> ++  std=' [m'     # No color.
>> ++else
>> ++  red= grn= lgn= blu= mgn= std=
>> ++fi
>> ++
>> ++do_exit='rm -f $log_file $trs_file $log_file.exit; (exit $st); exit $st'
>> ++trap "st=129; $do_exit" 1
>> ++trap "st=130; $do_exit" 2
>> ++trap "st=141; $do_exit" 13
>> ++trap "st=143; $do_exit" 15
>> ++
>> ++# Test script is run here. We create the file first, then append to it,
>> ++# to ameliorate tests themselves also writing to the log file. Our tests
>> ++# don't, but others can (automake bug#35762).
>> ++: >"$log_file"
>> ++# Programs that print many lines in a loop (e.g. pngimage's per-file PASS
>> ++# lines) fully-buffer stdio once it's not a tty, so without this their
>> ++# output would arrive in one dump at exit instead of streaming live.
>> ++if command -v stdbuf >/dev/null 2>&1; then
>> ++  set -- stdbuf -oL -eL "$@"
>> ++fi
>> ++{ "$@"; echo $? >"$log_file.exit"; } 2>&1 | tee -a "$log_file"
>> ++estatus=$(cat "$log_file.exit")
>> ++rm -f "$log_file.exit"
>> ++
>> ++if test $enable_hard_errors = no && test $estatus -eq 99; then
>> ++  tweaked_estatus=1
>> ++else
>> ++  tweaked_estatus=$estatus
>> ++fi
>> ++
>> ++case $tweaked_estatus:$expect_failure in
>> ++  0:yes) col=$red res=XPASS recheck=yes gcopy=yes;;
>> ++  0:*)   col=$grn res=PASS  recheck=no  gcopy=no;;
>> ++  77:*)  col=$blu res=SKIP  recheck=no  gcopy=$collect_skipped_logs;;
>> ++  99:*)  col=$mgn res=ERROR recheck=yes gcopy=yes;;
>> ++  *:yes) col=$lgn res=XFAIL recheck=no  gcopy=yes;;
>> ++  *:*)   col=$red res=FAIL  recheck=yes gcopy=yes;;
>> ++esac
>> ++
>> ++# Report the test outcome and exit status in the logs, so that one can
>> ++# know whether the test passed or failed simply by looking at the '.log'
>> ++# file, without the need of also peaking into the corresponding '.trs'
>> ++# file (automake bug#11814).
>> ++echo "$res $test_name (exit status: $estatus)" >>"$log_file"
>> ++
>> ++# Report outcome to console.
>> ++echo "${col}${res}${std}: $test_name"
>> ++
>> ++# Register the test result, and other relevant metadata.
>> ++echo ":test-result: $res" > $trs_file
>> ++echo ":global-test-result: $res" >> $trs_file
>> ++echo ":recheck: $recheck" >> $trs_file
>> ++echo ":copy-in-global-log: $gcopy" >> $trs_file
>> ++
>> ++# Local Variables:
>> ++# mode: shell-script
>> ++# sh-indentation: 2
>> ++# eval: (add-hook 'before-save-hook 'time-stamp nil t)
>> ++# time-stamp-start: "scriptversion="
>> ++# time-stamp-format: "%Y-%02m-%02d.%02H"
>> ++# time-stamp-time-zone: "UTC0"
>> ++# time-stamp-end: "; # UTC"
>> ++# End:
>> +--
>> +2.55.0
>> +
>> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.58.bb b/meta/recipes-multimedia/libpng/libpng_1.6.58.bb
>> index 6e4e5e9f38..928b010c9c 100644
>> --- a/meta/recipes-multimedia/libpng/libpng_1.6.58.bb
>> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.58.bb
>> @@ -12,6 +12,7 @@ LIBV = "16"
>>
>>   SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
>>              file://run-ptest \
>> +           file://0001-tests-stream-per-test-results-to-stdout.patch \
>>   "
>>
>>   SRC_URI[sha256sum] = "28eb403f51f0f7405249132cecfe82ea5c0ef97f1b32c5a65828814ae0d34775"
>> @@ -33,13 +34,13 @@ PACKAGES =+ "${PN}-tools"
>>
>>   FILES:${PN}-tools = "${bindir}/png-fix-itxt ${bindir}/pngfix ${bindir}/pngcp"
>>
>> -RDEPENDS:${PN}-ptest += "make bash gawk"
>> +RDEPENDS:${PN}-ptest += "make bash gawk coreutils"
>>
>>   do_install_ptest() {
>>       # Install test scripts to ptest path
>>       install -d ${D}${PTEST_PATH}/src/tests
>>       install -m 755 ${S}/tests/* ${D}${PTEST_PATH}/src/tests
>> -    install -m 755 ${S}/test-driver ${D}${PTEST_PATH}
>> +    install -m 755 ${S}/test-driver-tee ${D}${PTEST_PATH}
>>       install -d ${D}${PTEST_PATH}/src/tests/scripts
>>       install -m 755 ${S}/scripts/*.awk ${D}${PTEST_PATH}/src/tests/scripts
>>       install -m 644 ${S}/scripts/pnglib* ${S}/scripts/*.c ${S}/scripts/*.def ${S}/scripts/macro.lst ${D}${PTEST_PATH}/src/tests/scripts
>> --
>> 2.55.0
>>
>>
>> 
>>


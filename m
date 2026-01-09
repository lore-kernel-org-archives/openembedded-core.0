Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95116D1681D
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 15:07:09 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12043.1767971219377292525
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jan 2026 07:07:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=dAhFG0bl;
 spf=pass (domain: baylibre.com, ip: 209.85.222.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8b25ed53fcbso582889585a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 07:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1767971217; x=1768576017; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XTnAbSjdiiIi+K/v9+KEURTNVpb11OMOHI8xQVR8AyM=;
        b=dAhFG0blte9mRXLN+VN2q0pG3Jegrd6BhaguD813dEvMjzWMZulwOx/4mic2pMDsUd
         OgCpS5rV0sucRXJmpj4O2y8yyjiMkSnRtsusUsq15Za32JOq4rWAr5ET9G4DZRVJb5iu
         +UlC62LsLf6iQE0aLW/ZzcHIAN/kMa/sXVViDedKAAgk3fXB108teaItNO61+ob3Us7a
         xLqt+63AHiTqu/AGYLgk/u0gpSX0K/M2F03bCDbTvWxQyKTxOEWS8GzfoJCFY3m46lEp
         UAOzmQWtx19kD78iLiHqmz20D4FQ5mH4fHlfTVkZdD26lOs1SV2aDKMmgUF7I51R4QCS
         nOnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767971217; x=1768576017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XTnAbSjdiiIi+K/v9+KEURTNVpb11OMOHI8xQVR8AyM=;
        b=heCF1g12P2rMHNLV8myOGlGcKf+ER2FXT7S4niTsL075Ko0Ff85/bcwuWLSYYJGCyY
         G7IPrr2wvMKmQD1IDLXAczSPj9oz5zx6ZmA7/CGBCLkyB3oskYC7RnnIDIpDr76R7Itc
         TxgrmquOmDgfBldtUR6FE9IyxoKKm+dmsMMPsUBPZDM9IIt5jJpLfF3IFyvdTrJ0tYh/
         7H4MRMcxnJrBgk+D2siz5G3xm2uZIJ0viTcUYbMYq26DsLcrUl1vRl4aQTBnUtzfsoDT
         SkcFrlyhvLZI/aoRl8/n0FjxLrEl8UvtePGUzooW9Z27isDh5d3Le12z+Y5toQkUfZee
         Vo1g==
X-Gm-Message-State: AOJu0YztaHb+mdUcA/u+1du3dkhOEoCKuPKrWuJ7GNSHePQxLvBqRjDX
	e3/7yFi3chZeB5Q1S9eAV2PPFRf/mHonOvw7+WCD6RxrKtvqXlxdRGtMHfJbHl3tKLK0ohicY0i
	01a4i8y0=
X-Gm-Gg: AY/fxX4QhOam0TJZjVj6+K4190zXUqromm18c57/Uh8H60slv9zqvCBoVNCVFR2h4hk
	iQ1DOcvN8H97PzO7KSC6KwGAM6McGSSzUR016hjLGqEmbkaq/G2lDrWL2XO5VDPA1WYGXXj+UqE
	D3hwjgXLVtc69mCIgma2WbEz6aOx6PVP64bO/mqAmdA8uqJphi3l4XP4e8UJ6lICyck1wKCyv1U
	6rUbF4V/rzvVIOIpfElaCYt7SjCXmUc/gc6Io1Vzzdj/YndCTfCWGzG/VmaBx1mb2uIVsfYg0Xv
	qQ9uG9vjb9hNMu8Bao8dCR6sdnqh04D4kLmyM7Dd2hVf7gAUoQ9RiJy/iik6zcQUYzoWGzmG2sa
	sdGkDZP0R+Q69Yryojf8o9ImRk11G34SoYX7ccW8oPmYflwZMx++DN44a+faj090LDg99aDkmHE
	U2B1Tzd3ewJe88DDo=
X-Google-Smtp-Source: AGHT+IFVxtBkjO/tXxm3I7OeWyGc/ymrZA2Apm+3yLGciaxZKbf3ltJq2+E1xavxNYj/6bxWc9tUUA==
X-Received: by 2002:a05:6214:328c:b0:87c:82c:628 with SMTP id 6a1803df08f44-890842c38acmr132922066d6.57.1767971215781;
        Fri, 09 Jan 2026 07:06:55 -0800 (PST)
Received: from localhost ([2001:1970:3847:e000:8598:5636:16ad:2a8f])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770cc7a6sm76534926d6.12.2026.01.09.07.06.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 07:06:55 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/6 v3] python3: upgrade 3.13.11 -> 3.14.0
Date: Fri,  9 Jan 2026 10:06:46 -0500
Message-ID: <20260109150651.469332-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109150651.469332-1-tgamblin@baylibre.com>
References: <20260109150651.469332-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jan 2026 15:07:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229127

Changelog: https://docs.python.org/3.14/whatsnew/changelog.html#python-3-14-0-final

- Recipe changes:

  - Remove '0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch'
    as this fix was submitted upstream and is included in 3.14.0.

  - Modify three existing patches to apply on 3.14.0:
    - 0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
    - 0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
    - 0001-test_active_children-skip-problematic-test.patch

  - Add three new ptest skip patches:
    - 0001-test_cmd-skip-bang-completion-test.patch - editline issues
      with tab completion off of bangs (!).
    - 0001-test_pyrepl-skip-test_unix_console.test_cursor_back_.patch -
      change in curses dependency in PyREPL leads to issues with a test
      that expects the ICH1 terminal capability.
    - 0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch -
      OE builds customize prefixes and compiler flags in a way that the
      test doesn't expect.

  - Add zstd to the DEPENDS since Python3 now provides support for the
    Zstandard compression standard.

  - In py_package_preprocess(), handle reproducibility issues with the
    _sysconfig_vars*.json files that the build generates by stripping
    paths from them.

Modify python3-manifest.json to reflect the removal/replacement of
stringold with a new string module directory.

Also update python3-dir Python version to 3.14.

Reproducibility looks OK:

|2025-12-03 17:23:39,179 - oe-selftest - INFO - Reproducibility summary for deb: same=2261 different=0 different_excluded=0 missing=0 total=2261
|unused_exclusions=[]
|2025-12-03 17:23:39,179 - oe-selftest - INFO - Checking ipk packages for differences...
|2025-12-03 17:23:41,631 - oe-selftest - INFO - Reproducibility summary for ipk: same=2261 different=0 different_excluded=0 missing=0 total=2261
|unused_exclusions=[]
|2025-12-03 17:23:41,631 - oe-selftest - INFO - Checking rpm packages for differences...
|2025-12-03 17:23:43,952 - oe-selftest - INFO - Reproducibility summary for rpm: same=2261 different=0 different_excluded=0 missing=0 total=2261
|unused_exclusions=[]
|2025-12-03 17:23:43,952 - oe-selftest - INFO -  ... ok
|2025-12-03 17:24:32,829 - oe-selftest - INFO - ----------------------------------------------------------------------
|2025-12-03 17:24:32,830 - oe-selftest - INFO - Ran 1 test in 1616.811s
|2025-12-03 17:24:32,830 - oe-selftest - INFO - OK
|2025-12-03 17:24:36,170 - oe-selftest - INFO - RESULTS:
|2025-12-03 17:24:36,170 - oe-selftest - INFO - RESULTS - reproducible.ReproducibleTests.test_reproducible_builds: PASSED (1567.51s)
|2025-12-03 17:24:38,017 - oe-selftest - INFO - SUMMARY:
|2025-12-03 17:24:38,017 - oe-selftest - INFO - oe-selftest () - Ran 1 test in 1616.811s
|2025-12-03 17:24:38,018 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=1, skipped=0, failures=0, errors=0)

ptests look OK (with new skips):

|== Tests result: SUCCESS ==
|
|28 tests skipped:
|    test.test_asyncio.test_windows_events
|    test.test_asyncio.test_windows_utils test.test_gdb.test_backtrace
|    test.test_gdb.test_cfunction test.test_gdb.test_cfunction_full
|    test.test_gdb.test_misc test.test_gdb.test_pretty_print
|    test_android test_apple test_asdl_parser test_clinic test_devpoll
|    test_free_threading test_generated_cases test_idle test_kqueue
|    test_launcher test_msvcrt test_startfile test_tcl test_tkinter
|    test_ttk test_ttk_textonly test_turtle test_winapi
|    test_winconsoleio test_winreg test_wmi
|
|8 tests skipped (resource denied):
|    test_curses test_peg_generator test_smtpnet test_socketserver
|    test_urllib2net test_urllibnet test_winsound test_zipfile64
|
|455 tests OK.
|
|Total duration: 3 min 5 sec
|Total tests: run=46,110 skipped=2,364
|Total test files: run=483/491 skipped=28 resource_denied=8
|Result: SUCCESS
|DURATION: 186
|END: /usr/lib/python3/ptest
|2025-12-04T00:20
|STOP: ptest-runner
|TOTAL: 1 FAIL: 0

buildall-qemu result:

BUILDALL-QEMU LOG FOR python3
START TIME: 2025-12-03_10:08:36
HOSTNAME: megalith
HOST OS: Fedora Linux 43 (Server Edition)
HOST KERNEL: 6.17.8-300.fc43.x86_64
===============
BUILD RESULTS:
[glibc]
PASS: qemuarm
PASS: qemuarm64
PASS: qemuarmv5
PASS: qemuloongarch64
PASS: qemumips
PASS: qemumips64
PASS: qemuppc
PASS: qemuppc64
PASS: qemuriscv32
PASS: qemuriscv64
PASS: qemux86-64
PASS: qemux86
[musl]
PASS: qemuarm
PASS: qemuarm64
PASS: qemuarmv5
FAIL: qemuloongarch64
PASS: qemumips
PASS: qemumips64
PASS: qemuppc
PASS: qemuppc64
PASS: qemuriscv32
PASS: qemuriscv64
PASS: qemux86-64
PASS: qemux86
===============
PASSED: 23
FAILED: 1

License-Update: Update copyright example in body

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/classes-recipe/python3-dir.bbclass       |    2 +-
 ...r-OpenSSL-3.4-and-add-it-to-multissl.patch | 1452 -----------------
 ...-use-prefix-value-from-build-configu.patch |   35 +-
 ...sts-due-to-load-variability-on-YP-AB.patch |   31 +-
 ...ctive_children-skip-problematic-test.patch |   17 +-
 ...1-test_cmd-skip-bang-completion-test.patch |   31 +
 ...-test_unix_console.test_cursor_back_.patch |   46 +
 ...kip-test_sysconfig.test_sysconfigdat.patch |   32 +
 .../python/python3/python3-manifest.json      |    3 +-
 .../{python3_3.13.11.bb => python3_3.14.0.bb} |   20 +-
 10 files changed, 183 insertions(+), 1486 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_cmd-skip-bang-completion-test.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_pyrepl-skip-test_unix_console.test_cursor_back_.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch
 rename meta/recipes-devtools/python/{python3_3.13.11.bb => python3_3.14.0.bb} (95%)

diff --git a/meta/classes-recipe/python3-dir.bbclass b/meta/classes-recipe/python3-dir.bbclass
index 0f4e7e7773..3eb0dea9b2 100644
--- a/meta/classes-recipe/python3-dir.bbclass
+++ b/meta/classes-recipe/python3-dir.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
-PYTHON_BASEVERSION = "3.13"
+PYTHON_BASEVERSION = "3.14"
 PYTHON_ABI = ""
 PYTHON_DIR = "python${PYTHON_BASEVERSION}"
 PYTHON_PN = "python3"
diff --git a/meta/recipes-devtools/python/python3/0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch b/meta/recipes-devtools/python/python3/0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch
deleted file mode 100644
index 327124e4e3..0000000000
--- a/meta/recipes-devtools/python/python3/0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch
+++ /dev/null
@@ -1,1452 +0,0 @@
-From db5c5763f3e3172f1dd011355b41469770dafc0f Mon Sep 17 00:00:00 2001
-From: Petr Viktorin <encukou@gmail.com>
-Date: Thu, 28 Nov 2024 13:29:27 +0100
-Subject: [PATCH] gh-127330: Update for OpenSSL 3.4 & document+improve the
- update process (GH-127331)
-
-- Add `git describe` output to headers generated by `make_ssl_data.py`
-
-  This info is more important than the date when the file was generated.
-  It does mean that the tool now requires a Git checkout of OpenSSL,
-  not for example a release tarball.
-
-- Regenerate the older file to add the info.
-  To the other older file, add a note about manual edits.
-
-- Add notes on how to add a new OpenSSL version
-
-- Add 3.4 error messages and multissl tests
-
-Upstream-Status: Submitted [https://github.com/python/cpython/commit/db5c5763f3e3172f1dd011355b41469770dafc0f]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- Modules/_ssl.c                             |   2 +-
- Modules/_ssl_data_111.h                    |   4 +-
- Modules/_ssl_data_300.h                    |   5 +-
- Modules/{_ssl_data_31.h => _ssl_data_34.h} | 674 ++++++++++++++++++++-
- Tools/c-analyzer/cpython/_parser.py        |   4 +-
- Tools/ssl/make_ssl_data.py                 |  34 +-
- Tools/ssl/multissltests.py                 |   1 +
- 7 files changed, 714 insertions(+), 10 deletions(-)
- rename Modules/{_ssl_data_31.h => _ssl_data_34.h} (92%)
-
-diff --git a/Modules/_ssl.c b/Modules/_ssl.c
-index b6b5ebf094c..e5b8bf21002 100644
---- a/Modules/_ssl.c
-+++ b/Modules/_ssl.c
-@@ -121,7 +121,7 @@ static void _PySSLFixErrno(void) {
- 
- /* Include generated data (error codes) */
- #if (OPENSSL_VERSION_NUMBER >= 0x30100000L)
--#include "_ssl_data_31.h"
-+#include "_ssl_data_34.h"
- #elif (OPENSSL_VERSION_NUMBER >= 0x30000000L)
- #include "_ssl_data_300.h"
- #elif (OPENSSL_VERSION_NUMBER >= 0x10101000L)
-diff --git a/Modules/_ssl_data_111.h b/Modules/_ssl_data_111.h
-index 093c786e6a2..061fac2bd58 100644
---- a/Modules/_ssl_data_111.h
-+++ b/Modules/_ssl_data_111.h
-@@ -1,4 +1,6 @@
--/* File generated by Tools/ssl/make_ssl_data.py *//* Generated on 2023-06-01T02:58:04.081473 */
-+/* File generated by Tools/ssl/make_ssl_data.py */
-+/* Generated on 2024-11-27T12:48:46.194048+00:00 */
-+/* Generated from Git commit OpenSSL_1_1_1w-0-ge04bd3433f */
- static struct py_ssl_library_code library_codes[] = {
- #ifdef ERR_LIB_ASN1
-     {"ASN1", ERR_LIB_ASN1},
-diff --git a/Modules/_ssl_data_300.h b/Modules/_ssl_data_300.h
-index dc66731f6b6..b687ce43c77 100644
---- a/Modules/_ssl_data_300.h
-+++ b/Modules/_ssl_data_300.h
-@@ -1,4 +1,7 @@
--/* File generated by Tools/ssl/make_ssl_data.py *//* Generated on 2023-06-01T03:03:52.163218 */
-+/* File generated by Tools/ssl/make_ssl_data.py */
-+/* Generated on 2023-06-01T03:03:52.163218 */
-+/* Manually edited to add definitions from 1.1.1 (GH-105174) */
-+
- static struct py_ssl_library_code library_codes[] = {
- #ifdef ERR_LIB_ASN1
-     {"ASN1", ERR_LIB_ASN1},
-diff --git a/Modules/_ssl_data_31.h b/Modules/_ssl_data_34.h
-similarity index 92%
-rename from Modules/_ssl_data_31.h
-rename to Modules/_ssl_data_34.h
-index c589c501f4e..d4af3e1c1fa 100644
---- a/Modules/_ssl_data_31.h
-+++ b/Modules/_ssl_data_34.h
-@@ -1,4 +1,6 @@
--/* File generated by Tools/ssl/make_ssl_data.py *//* Generated on 2023-06-01T03:04:00.275280 */
-+/* File generated by Tools/ssl/make_ssl_data.py */
-+/* Generated on 2024-11-27T12:35:52.276767+00:00 */
-+/* Generated from Git commit openssl-3.4.0-0-g98acb6b028 */
- static struct py_ssl_library_code library_codes[] = {
- #ifdef ERR_LIB_ASN1
-     {"ASN1", ERR_LIB_ASN1},
-@@ -300,6 +302,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"FIRST_NUM_TOO_LARGE", 13, 122},
-   #endif
-+  #ifdef ASN1_R_GENERALIZEDTIME_IS_TOO_SHORT
-+    {"GENERALIZEDTIME_IS_TOO_SHORT", ERR_LIB_ASN1, ASN1_R_GENERALIZEDTIME_IS_TOO_SHORT},
-+  #else
-+    {"GENERALIZEDTIME_IS_TOO_SHORT", 13, 232},
-+  #endif
-   #ifdef ASN1_R_HEADER_TOO_LONG
-     {"HEADER_TOO_LONG", ERR_LIB_ASN1, ASN1_R_HEADER_TOO_LONG},
-   #else
-@@ -730,6 +737,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"UNSUPPORTED_TYPE", 13, 196},
-   #endif
-+  #ifdef ASN1_R_UTCTIME_IS_TOO_SHORT
-+    {"UTCTIME_IS_TOO_SHORT", ERR_LIB_ASN1, ASN1_R_UTCTIME_IS_TOO_SHORT},
-+  #else
-+    {"UTCTIME_IS_TOO_SHORT", 13, 233},
-+  #endif
-   #ifdef ASN1_R_WRONG_INTEGER_TYPE
-     {"WRONG_INTEGER_TYPE", ERR_LIB_ASN1, ASN1_R_WRONG_INTEGER_TYPE},
-   #else
-@@ -845,6 +857,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"LISTEN_V6_ONLY", 32, 136},
-   #endif
-+  #ifdef BIO_R_LOCAL_ADDR_NOT_AVAILABLE
-+    {"LOCAL_ADDR_NOT_AVAILABLE", ERR_LIB_BIO, BIO_R_LOCAL_ADDR_NOT_AVAILABLE},
-+  #else
-+    {"LOCAL_ADDR_NOT_AVAILABLE", 32, 111},
-+  #endif
-   #ifdef BIO_R_LOOKUP_RETURNED_NOTHING
-     {"LOOKUP_RETURNED_NOTHING", ERR_LIB_BIO, BIO_R_LOOKUP_RETURNED_NOTHING},
-   #else
-@@ -860,6 +877,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"NBIO_CONNECT_ERROR", 32, 110},
-   #endif
-+  #ifdef BIO_R_NON_FATAL
-+    {"NON_FATAL", ERR_LIB_BIO, BIO_R_NON_FATAL},
-+  #else
-+    {"NON_FATAL", 32, 112},
-+  #endif
-   #ifdef BIO_R_NO_ACCEPT_ADDR_OR_SERVICE_SPECIFIED
-     {"NO_ACCEPT_ADDR_OR_SERVICE_SPECIFIED", ERR_LIB_BIO, BIO_R_NO_ACCEPT_ADDR_OR_SERVICE_SPECIFIED},
-   #else
-@@ -880,6 +902,26 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"NO_SUCH_FILE", 32, 128},
-   #endif
-+  #ifdef BIO_R_PEER_ADDR_NOT_AVAILABLE
-+    {"PEER_ADDR_NOT_AVAILABLE", ERR_LIB_BIO, BIO_R_PEER_ADDR_NOT_AVAILABLE},
-+  #else
-+    {"PEER_ADDR_NOT_AVAILABLE", 32, 114},
-+  #endif
-+  #ifdef BIO_R_PORT_MISMATCH
-+    {"PORT_MISMATCH", ERR_LIB_BIO, BIO_R_PORT_MISMATCH},
-+  #else
-+    {"PORT_MISMATCH", 32, 150},
-+  #endif
-+  #ifdef BIO_R_TFO_DISABLED
-+    {"TFO_DISABLED", ERR_LIB_BIO, BIO_R_TFO_DISABLED},
-+  #else
-+    {"TFO_DISABLED", 32, 106},
-+  #endif
-+  #ifdef BIO_R_TFO_NO_KERNEL_SUPPORT
-+    {"TFO_NO_KERNEL_SUPPORT", ERR_LIB_BIO, BIO_R_TFO_NO_KERNEL_SUPPORT},
-+  #else
-+    {"TFO_NO_KERNEL_SUPPORT", 32, 108},
-+  #endif
-   #ifdef BIO_R_TRANSFER_ERROR
-     {"TRANSFER_ERROR", ERR_LIB_BIO, BIO_R_TRANSFER_ERROR},
-   #else
-@@ -920,6 +962,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"UNABLE_TO_REUSEADDR", 32, 139},
-   #endif
-+  #ifdef BIO_R_UNABLE_TO_TFO
-+    {"UNABLE_TO_TFO", ERR_LIB_BIO, BIO_R_UNABLE_TO_TFO},
-+  #else
-+    {"UNABLE_TO_TFO", 32, 109},
-+  #endif
-   #ifdef BIO_R_UNAVAILABLE_IP_FAMILY
-     {"UNAVAILABLE_IP_FAMILY", ERR_LIB_BIO, BIO_R_UNAVAILABLE_IP_FAMILY},
-   #else
-@@ -1230,6 +1277,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"ERROR_VALIDATING_SIGNATURE", 58, 171},
-   #endif
-+  #ifdef CMP_R_EXPECTED_POLLREQ
-+    {"EXPECTED_POLLREQ", ERR_LIB_CMP, CMP_R_EXPECTED_POLLREQ},
-+  #else
-+    {"EXPECTED_POLLREQ", 58, 104},
-+  #endif
-   #ifdef CMP_R_FAILED_BUILDING_OWN_CHAIN
-     {"FAILED_BUILDING_OWN_CHAIN", ERR_LIB_CMP, CMP_R_FAILED_BUILDING_OWN_CHAIN},
-   #else
-@@ -1250,16 +1302,51 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"FAIL_INFO_OUT_OF_RANGE", 58, 129},
-   #endif
-+  #ifdef CMP_R_GENERATE_CERTREQTEMPLATE
-+    {"GENERATE_CERTREQTEMPLATE", ERR_LIB_CMP, CMP_R_GENERATE_CERTREQTEMPLATE},
-+  #else
-+    {"GENERATE_CERTREQTEMPLATE", 58, 197},
-+  #endif
-+  #ifdef CMP_R_GENERATE_CRLSTATUS
-+    {"GENERATE_CRLSTATUS", ERR_LIB_CMP, CMP_R_GENERATE_CRLSTATUS},
-+  #else
-+    {"GENERATE_CRLSTATUS", 58, 198},
-+  #endif
-+  #ifdef CMP_R_GETTING_GENP
-+    {"GETTING_GENP", ERR_LIB_CMP, CMP_R_GETTING_GENP},
-+  #else
-+    {"GETTING_GENP", 58, 192},
-+  #endif
-+  #ifdef CMP_R_GET_ITAV
-+    {"GET_ITAV", ERR_LIB_CMP, CMP_R_GET_ITAV},
-+  #else
-+    {"GET_ITAV", 58, 199},
-+  #endif
-   #ifdef CMP_R_INVALID_ARGS
-     {"INVALID_ARGS", ERR_LIB_CMP, CMP_R_INVALID_ARGS},
-   #else
-     {"INVALID_ARGS", 58, 100},
-   #endif
-+  #ifdef CMP_R_INVALID_GENP
-+    {"INVALID_GENP", ERR_LIB_CMP, CMP_R_INVALID_GENP},
-+  #else
-+    {"INVALID_GENP", 58, 193},
-+  #endif
-+  #ifdef CMP_R_INVALID_KEYSPEC
-+    {"INVALID_KEYSPEC", ERR_LIB_CMP, CMP_R_INVALID_KEYSPEC},
-+  #else
-+    {"INVALID_KEYSPEC", 58, 202},
-+  #endif
-   #ifdef CMP_R_INVALID_OPTION
-     {"INVALID_OPTION", ERR_LIB_CMP, CMP_R_INVALID_OPTION},
-   #else
-     {"INVALID_OPTION", 58, 174},
-   #endif
-+  #ifdef CMP_R_INVALID_ROOTCAKEYUPDATE
-+    {"INVALID_ROOTCAKEYUPDATE", ERR_LIB_CMP, CMP_R_INVALID_ROOTCAKEYUPDATE},
-+  #else
-+    {"INVALID_ROOTCAKEYUPDATE", 58, 195},
-+  #endif
-   #ifdef CMP_R_MISSING_CERTID
-     {"MISSING_CERTID", ERR_LIB_CMP, CMP_R_MISSING_CERTID},
-   #else
-@@ -1425,6 +1512,21 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"TRANSFER_ERROR", 58, 159},
-   #endif
-+  #ifdef CMP_R_UNCLEAN_CTX
-+    {"UNCLEAN_CTX", ERR_LIB_CMP, CMP_R_UNCLEAN_CTX},
-+  #else
-+    {"UNCLEAN_CTX", 58, 191},
-+  #endif
-+  #ifdef CMP_R_UNEXPECTED_CERTPROFILE
-+    {"UNEXPECTED_CERTPROFILE", ERR_LIB_CMP, CMP_R_UNEXPECTED_CERTPROFILE},
-+  #else
-+    {"UNEXPECTED_CERTPROFILE", 58, 196},
-+  #endif
-+  #ifdef CMP_R_UNEXPECTED_CRLSTATUSLIST
-+    {"UNEXPECTED_CRLSTATUSLIST", ERR_LIB_CMP, CMP_R_UNEXPECTED_CRLSTATUSLIST},
-+  #else
-+    {"UNEXPECTED_CRLSTATUSLIST", 58, 201},
-+  #endif
-   #ifdef CMP_R_UNEXPECTED_PKIBODY
-     {"UNEXPECTED_PKIBODY", ERR_LIB_CMP, CMP_R_UNEXPECTED_PKIBODY},
-   #else
-@@ -1435,11 +1537,21 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"UNEXPECTED_PKISTATUS", 58, 185},
-   #endif
-+  #ifdef CMP_R_UNEXPECTED_POLLREQ
-+    {"UNEXPECTED_POLLREQ", ERR_LIB_CMP, CMP_R_UNEXPECTED_POLLREQ},
-+  #else
-+    {"UNEXPECTED_POLLREQ", 58, 105},
-+  #endif
-   #ifdef CMP_R_UNEXPECTED_PVNO
-     {"UNEXPECTED_PVNO", ERR_LIB_CMP, CMP_R_UNEXPECTED_PVNO},
-   #else
-     {"UNEXPECTED_PVNO", 58, 153},
-   #endif
-+  #ifdef CMP_R_UNEXPECTED_SENDER
-+    {"UNEXPECTED_SENDER", ERR_LIB_CMP, CMP_R_UNEXPECTED_SENDER},
-+  #else
-+    {"UNEXPECTED_SENDER", 58, 106},
-+  #endif
-   #ifdef CMP_R_UNKNOWN_ALGORITHM_ID
-     {"UNKNOWN_ALGORITHM_ID", ERR_LIB_CMP, CMP_R_UNKNOWN_ALGORITHM_ID},
-   #else
-@@ -1450,6 +1562,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"UNKNOWN_CERT_TYPE", 58, 135},
-   #endif
-+  #ifdef CMP_R_UNKNOWN_CRL_ISSUER
-+    {"UNKNOWN_CRL_ISSUER", ERR_LIB_CMP, CMP_R_UNKNOWN_CRL_ISSUER},
-+  #else
-+    {"UNKNOWN_CRL_ISSUER", 58, 200},
-+  #endif
-   #ifdef CMP_R_UNKNOWN_PKISTATUS
-     {"UNKNOWN_PKISTATUS", ERR_LIB_CMP, CMP_R_UNKNOWN_PKISTATUS},
-   #else
-@@ -1465,6 +1582,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"UNSUPPORTED_KEY_TYPE", 58, 137},
-   #endif
-+  #ifdef CMP_R_UNSUPPORTED_PKIBODY
-+    {"UNSUPPORTED_PKIBODY", ERR_LIB_CMP, CMP_R_UNSUPPORTED_PKIBODY},
-+  #else
-+    {"UNSUPPORTED_PKIBODY", 58, 101},
-+  #endif
-   #ifdef CMP_R_UNSUPPORTED_PROTECTION_ALG_DHBASEDMAC
-     {"UNSUPPORTED_PROTECTION_ALG_DHBASEDMAC", ERR_LIB_CMP, CMP_R_UNSUPPORTED_PROTECTION_ALG_DHBASEDMAC},
-   #else
-@@ -1825,6 +1947,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"NO_SIGNERS", 46, 135},
-   #endif
-+  #ifdef CMS_R_OPERATION_UNSUPPORTED
-+    {"OPERATION_UNSUPPORTED", ERR_LIB_CMS, CMS_R_OPERATION_UNSUPPORTED},
-+  #else
-+    {"OPERATION_UNSUPPORTED", 46, 182},
-+  #endif
-   #ifdef CMS_R_PEER_KEY_ERROR
-     {"PEER_KEY_ERROR", ERR_LIB_CMS, CMS_R_PEER_KEY_ERROR},
-   #else
-@@ -1960,6 +2087,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"UNSUPPORTED_RECIPIENT_TYPE", 46, 154},
-   #endif
-+  #ifdef CMS_R_UNSUPPORTED_SIGNATURE_ALGORITHM
-+    {"UNSUPPORTED_SIGNATURE_ALGORITHM", ERR_LIB_CMS, CMS_R_UNSUPPORTED_SIGNATURE_ALGORITHM},
-+  #else
-+    {"UNSUPPORTED_SIGNATURE_ALGORITHM", 46, 195},
-+  #endif
-   #ifdef CMS_R_UNSUPPORTED_TYPE
-     {"UNSUPPORTED_TYPE", ERR_LIB_CMS, CMS_R_UNSUPPORTED_TYPE},
-   #else
-@@ -1985,6 +2117,31 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"WRAP_ERROR", 46, 159},
-   #endif
-+  #ifdef COMP_R_BROTLI_DECODE_ERROR
-+    {"BROTLI_DECODE_ERROR", ERR_LIB_COMP, COMP_R_BROTLI_DECODE_ERROR},
-+  #else
-+    {"BROTLI_DECODE_ERROR", 41, 102},
-+  #endif
-+  #ifdef COMP_R_BROTLI_DEFLATE_ERROR
-+    {"BROTLI_DEFLATE_ERROR", ERR_LIB_COMP, COMP_R_BROTLI_DEFLATE_ERROR},
-+  #else
-+    {"BROTLI_DEFLATE_ERROR", 41, 103},
-+  #endif
-+  #ifdef COMP_R_BROTLI_ENCODE_ERROR
-+    {"BROTLI_ENCODE_ERROR", ERR_LIB_COMP, COMP_R_BROTLI_ENCODE_ERROR},
-+  #else
-+    {"BROTLI_ENCODE_ERROR", 41, 106},
-+  #endif
-+  #ifdef COMP_R_BROTLI_INFLATE_ERROR
-+    {"BROTLI_INFLATE_ERROR", ERR_LIB_COMP, COMP_R_BROTLI_INFLATE_ERROR},
-+  #else
-+    {"BROTLI_INFLATE_ERROR", 41, 104},
-+  #endif
-+  #ifdef COMP_R_BROTLI_NOT_SUPPORTED
-+    {"BROTLI_NOT_SUPPORTED", ERR_LIB_COMP, COMP_R_BROTLI_NOT_SUPPORTED},
-+  #else
-+    {"BROTLI_NOT_SUPPORTED", 41, 105},
-+  #endif
-   #ifdef COMP_R_ZLIB_DEFLATE_ERROR
-     {"ZLIB_DEFLATE_ERROR", ERR_LIB_COMP, COMP_R_ZLIB_DEFLATE_ERROR},
-   #else
-@@ -2000,6 +2157,26 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"ZLIB_NOT_SUPPORTED", 41, 101},
-   #endif
-+  #ifdef COMP_R_ZSTD_COMPRESS_ERROR
-+    {"ZSTD_COMPRESS_ERROR", ERR_LIB_COMP, COMP_R_ZSTD_COMPRESS_ERROR},
-+  #else
-+    {"ZSTD_COMPRESS_ERROR", 41, 107},
-+  #endif
-+  #ifdef COMP_R_ZSTD_DECODE_ERROR
-+    {"ZSTD_DECODE_ERROR", ERR_LIB_COMP, COMP_R_ZSTD_DECODE_ERROR},
-+  #else
-+    {"ZSTD_DECODE_ERROR", 41, 108},
-+  #endif
-+  #ifdef COMP_R_ZSTD_DECOMPRESS_ERROR
-+    {"ZSTD_DECOMPRESS_ERROR", ERR_LIB_COMP, COMP_R_ZSTD_DECOMPRESS_ERROR},
-+  #else
-+    {"ZSTD_DECOMPRESS_ERROR", 41, 109},
-+  #endif
-+  #ifdef COMP_R_ZSTD_NOT_SUPPORTED
-+    {"ZSTD_NOT_SUPPORTED", ERR_LIB_COMP, COMP_R_ZSTD_NOT_SUPPORTED},
-+  #else
-+    {"ZSTD_NOT_SUPPORTED", 41, 110},
-+  #endif
-   #ifdef CONF_R_ERROR_LOADING_DSO
-     {"ERROR_LOADING_DSO", ERR_LIB_CONF, CONF_R_ERROR_LOADING_DSO},
-   #else
-@@ -2085,6 +2262,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"RECURSIVE_DIRECTORY_INCLUDE", 14, 111},
-   #endif
-+  #ifdef CONF_R_RECURSIVE_SECTION_REFERENCE
-+    {"RECURSIVE_SECTION_REFERENCE", ERR_LIB_CONF, CONF_R_RECURSIVE_SECTION_REFERENCE},
-+  #else
-+    {"RECURSIVE_SECTION_REFERENCE", 14, 126},
-+  #endif
-   #ifdef CONF_R_RELATIVE_PATH
-     {"RELATIVE_PATH", ERR_LIB_CONF, CONF_R_RELATIVE_PATH},
-   #else
-@@ -2370,6 +2552,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"TOO_MANY_BYTES", 15, 113},
-   #endif
-+  #ifdef CRYPTO_R_TOO_MANY_NAMES
-+    {"TOO_MANY_NAMES", ERR_LIB_CRYPTO, CRYPTO_R_TOO_MANY_NAMES},
-+  #else
-+    {"TOO_MANY_NAMES", 15, 132},
-+  #endif
-   #ifdef CRYPTO_R_TOO_MANY_RECORDS
-     {"TOO_MANY_RECORDS", ERR_LIB_CRYPTO, CRYPTO_R_TOO_MANY_RECORDS},
-   #else
-@@ -2560,6 +2747,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"INVALID_SECRET", 5, 128},
-   #endif
-+  #ifdef DH_R_INVALID_SIZE
-+    {"INVALID_SIZE", ERR_LIB_DH, DH_R_INVALID_SIZE},
-+  #else
-+    {"INVALID_SIZE", 5, 129},
-+  #endif
-   #ifdef DH_R_KDF_PARAMETER_ERROR
-     {"KDF_PARAMETER_ERROR", ERR_LIB_DH, DH_R_KDF_PARAMETER_ERROR},
-   #else
-@@ -2610,6 +2802,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"PEER_KEY_ERROR", 5, 111},
-   #endif
-+  #ifdef DH_R_Q_TOO_LARGE
-+    {"Q_TOO_LARGE", ERR_LIB_DH, DH_R_Q_TOO_LARGE},
-+  #else
-+    {"Q_TOO_LARGE", 5, 130},
-+  #endif
-   #ifdef DH_R_SHARED_INFO_ERROR
-     {"SHARED_INFO_ERROR", ERR_LIB_DH, DH_R_SHARED_INFO_ERROR},
-   #else
-@@ -3545,6 +3742,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"GENERATE_ERROR", 6, 214},
-   #endif
-+  #ifdef EVP_R_GETTING_ALGORITHMIDENTIFIER_NOT_SUPPORTED
-+    {"GETTING_ALGORITHMIDENTIFIER_NOT_SUPPORTED", ERR_LIB_EVP, EVP_R_GETTING_ALGORITHMIDENTIFIER_NOT_SUPPORTED},
-+  #else
-+    {"GETTING_ALGORITHMIDENTIFIER_NOT_SUPPORTED", 6, 229},
-+  #endif
-   #ifdef EVP_R_GET_RAW_KEY_FAILED
-     {"GET_RAW_KEY_FAILED", ERR_LIB_EVP, EVP_R_GET_RAW_KEY_FAILED},
-   #else
-@@ -3745,6 +3947,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"OPERATION_NOT_SUPPORTED_FOR_THIS_KEYTYPE", 6, 150},
-   #endif
-+  #ifdef EVP_R_OPERATION_NOT_SUPPORTED_FOR_THIS_SIGNATURE_TYPE
-+    {"OPERATION_NOT_SUPPORTED_FOR_THIS_SIGNATURE_TYPE", ERR_LIB_EVP, EVP_R_OPERATION_NOT_SUPPORTED_FOR_THIS_SIGNATURE_TYPE},
-+  #else
-+    {"OPERATION_NOT_SUPPORTED_FOR_THIS_SIGNATURE_TYPE", 6, 226},
-+  #endif
-   #ifdef EVP_R_OUTPUT_WOULD_OVERFLOW
-     {"OUTPUT_WOULD_OVERFLOW", ERR_LIB_EVP, EVP_R_OUTPUT_WOULD_OVERFLOW},
-   #else
-@@ -3795,6 +4002,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"SET_DEFAULT_PROPERTY_FAILURE", 6, 209},
-   #endif
-+  #ifdef EVP_R_SIGNATURE_TYPE_AND_KEY_TYPE_INCOMPATIBLE
-+    {"SIGNATURE_TYPE_AND_KEY_TYPE_INCOMPATIBLE", ERR_LIB_EVP, EVP_R_SIGNATURE_TYPE_AND_KEY_TYPE_INCOMPATIBLE},
-+  #else
-+    {"SIGNATURE_TYPE_AND_KEY_TYPE_INCOMPATIBLE", 6, 228},
-+  #endif
-   #ifdef EVP_R_TOO_MANY_RECORDS
-     {"TOO_MANY_RECORDS", ERR_LIB_EVP, EVP_R_TOO_MANY_RECORDS},
-   #else
-@@ -3825,6 +4037,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"UNABLE_TO_SET_CALLBACKS", 6, 217},
-   #endif
-+  #ifdef EVP_R_UNKNOWN_BITS
-+    {"UNKNOWN_BITS", ERR_LIB_EVP, EVP_R_UNKNOWN_BITS},
-+  #else
-+    {"UNKNOWN_BITS", 6, 166},
-+  #endif
-   #ifdef EVP_R_UNKNOWN_CIPHER
-     {"UNKNOWN_CIPHER", ERR_LIB_EVP, EVP_R_UNKNOWN_CIPHER},
-   #else
-@@ -3840,6 +4057,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"UNKNOWN_KEY_TYPE", 6, 207},
-   #endif
-+  #ifdef EVP_R_UNKNOWN_MAX_SIZE
-+    {"UNKNOWN_MAX_SIZE", ERR_LIB_EVP, EVP_R_UNKNOWN_MAX_SIZE},
-+  #else
-+    {"UNKNOWN_MAX_SIZE", 6, 167},
-+  #endif
-   #ifdef EVP_R_UNKNOWN_OPTION
-     {"UNKNOWN_OPTION", ERR_LIB_EVP, EVP_R_UNKNOWN_OPTION},
-   #else
-@@ -3850,6 +4072,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"UNKNOWN_PBE_ALGORITHM", 6, 121},
-   #endif
-+  #ifdef EVP_R_UNKNOWN_SECURITY_BITS
-+    {"UNKNOWN_SECURITY_BITS", ERR_LIB_EVP, EVP_R_UNKNOWN_SECURITY_BITS},
-+  #else
-+    {"UNKNOWN_SECURITY_BITS", 6, 168},
-+  #endif
-   #ifdef EVP_R_UNSUPPORTED_ALGORITHM
-     {"UNSUPPORTED_ALGORITHM", ERR_LIB_EVP, EVP_R_UNSUPPORTED_ALGORITHM},
-   #else
-@@ -4040,6 +4267,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"RESPONSE_PARSE_ERROR", 61, 104},
-   #endif
-+  #ifdef HTTP_R_RESPONSE_TOO_MANY_HDRLINES
-+    {"RESPONSE_TOO_MANY_HDRLINES", ERR_LIB_HTTP, HTTP_R_RESPONSE_TOO_MANY_HDRLINES},
-+  #else
-+    {"RESPONSE_TOO_MANY_HDRLINES", 61, 130},
-+  #endif
-   #ifdef HTTP_R_RETRY_TIMEOUT
-     {"RETRY_TIMEOUT", ERR_LIB_HTTP, HTTP_R_RETRY_TIMEOUT},
-   #else
-@@ -4530,6 +4762,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"UNSUPPORTED_PUBLIC_KEY_TYPE", 9, 110},
-   #endif
-+  #ifdef PKCS12_R_CALLBACK_FAILED
-+    {"CALLBACK_FAILED", ERR_LIB_PKCS12, PKCS12_R_CALLBACK_FAILED},
-+  #else
-+    {"CALLBACK_FAILED", 35, 115},
-+  #endif
-   #ifdef PKCS12_R_CANT_PACK_STRUCTURE
-     {"CANT_PACK_STRUCTURE", ERR_LIB_PKCS12, PKCS12_R_CANT_PACK_STRUCTURE},
-   #else
-@@ -4920,6 +5157,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"CIPHER_OPERATION_FAILED", 57, 102},
-   #endif
-+  #ifdef PROV_R_COFACTOR_REQUIRED
-+    {"COFACTOR_REQUIRED", ERR_LIB_PROV, PROV_R_COFACTOR_REQUIRED},
-+  #else
-+    {"COFACTOR_REQUIRED", 57, 236},
-+  #endif
-   #ifdef PROV_R_DERIVATION_FUNCTION_INIT_FAILED
-     {"DERIVATION_FUNCTION_INIT_FAILED", ERR_LIB_PROV, PROV_R_DERIVATION_FUNCTION_INIT_FAILED},
-   #else
-@@ -4935,6 +5177,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"EMS_NOT_ENABLED", 57, 233},
-   #endif
-+  #ifdef PROV_R_ENTROPY_SOURCE_FAILED_CONTINUOUS_TESTS
-+    {"ENTROPY_SOURCE_FAILED_CONTINUOUS_TESTS", ERR_LIB_PROV, PROV_R_ENTROPY_SOURCE_FAILED_CONTINUOUS_TESTS},
-+  #else
-+    {"ENTROPY_SOURCE_FAILED_CONTINUOUS_TESTS", 57, 244},
-+  #endif
-   #ifdef PROV_R_ENTROPY_SOURCE_STRENGTH_TOO_WEAK
-     {"ENTROPY_SOURCE_STRENGTH_TOO_WEAK", ERR_LIB_PROV, PROV_R_ENTROPY_SOURCE_STRENGTH_TOO_WEAK},
-   #else
-@@ -4990,6 +5237,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"FAILED_TO_SIGN", 57, 175},
-   #endif
-+  #ifdef PROV_R_FINAL_CALL_OUT_OF_ORDER
-+    {"FINAL_CALL_OUT_OF_ORDER", ERR_LIB_PROV, PROV_R_FINAL_CALL_OUT_OF_ORDER},
-+  #else
-+    {"FINAL_CALL_OUT_OF_ORDER", 57, 237},
-+  #endif
-   #ifdef PROV_R_FIPS_MODULE_CONDITIONAL_ERROR
-     {"FIPS_MODULE_CONDITIONAL_ERROR", ERR_LIB_PROV, PROV_R_FIPS_MODULE_CONDITIONAL_ERROR},
-   #else
-@@ -5020,6 +5272,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"INDICATOR_INTEGRITY_FAILURE", 57, 210},
-   #endif
-+  #ifdef PROV_R_INIT_CALL_OUT_OF_ORDER
-+    {"INIT_CALL_OUT_OF_ORDER", ERR_LIB_PROV, PROV_R_INIT_CALL_OUT_OF_ORDER},
-+  #else
-+    {"INIT_CALL_OUT_OF_ORDER", 57, 238},
-+  #endif
-   #ifdef PROV_R_INSUFFICIENT_DRBG_STRENGTH
-     {"INSUFFICIENT_DRBG_STRENGTH", ERR_LIB_PROV, PROV_R_INSUFFICIENT_DRBG_STRENGTH},
-   #else
-@@ -5030,6 +5287,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"INVALID_AAD", 57, 108},
-   #endif
-+  #ifdef PROV_R_INVALID_AEAD
-+    {"INVALID_AEAD", ERR_LIB_PROV, PROV_R_INVALID_AEAD},
-+  #else
-+    {"INVALID_AEAD", 57, 231},
-+  #endif
-   #ifdef PROV_R_INVALID_CONFIG_DATA
-     {"INVALID_CONFIG_DATA", ERR_LIB_PROV, PROV_R_INVALID_CONFIG_DATA},
-   #else
-@@ -5070,6 +5332,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"INVALID_DIGEST_SIZE", 57, 218},
-   #endif
-+  #ifdef PROV_R_INVALID_EDDSA_INSTANCE_FOR_ATTEMPTED_OPERATION
-+    {"INVALID_EDDSA_INSTANCE_FOR_ATTEMPTED_OPERATION", ERR_LIB_PROV, PROV_R_INVALID_EDDSA_INSTANCE_FOR_ATTEMPTED_OPERATION},
-+  #else
-+    {"INVALID_EDDSA_INSTANCE_FOR_ATTEMPTED_OPERATION", 57, 243},
-+  #endif
-   #ifdef PROV_R_INVALID_INPUT_LENGTH
-     {"INVALID_INPUT_LENGTH", ERR_LIB_PROV, PROV_R_INVALID_INPUT_LENGTH},
-   #else
-@@ -5085,6 +5352,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"INVALID_IV_LENGTH", 57, 109},
-   #endif
-+  #ifdef PROV_R_INVALID_KDF
-+    {"INVALID_KDF", ERR_LIB_PROV, PROV_R_INVALID_KDF},
-+  #else
-+    {"INVALID_KDF", 57, 232},
-+  #endif
-   #ifdef PROV_R_INVALID_KEY
-     {"INVALID_KEY", ERR_LIB_PROV, PROV_R_INVALID_KEY},
-   #else
-@@ -5100,6 +5372,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"INVALID_MAC", 57, 151},
-   #endif
-+  #ifdef PROV_R_INVALID_MEMORY_SIZE
-+    {"INVALID_MEMORY_SIZE", ERR_LIB_PROV, PROV_R_INVALID_MEMORY_SIZE},
-+  #else
-+    {"INVALID_MEMORY_SIZE", 57, 235},
-+  #endif
-   #ifdef PROV_R_INVALID_MGF1_MD
-     {"INVALID_MGF1_MD", ERR_LIB_PROV, PROV_R_INVALID_MGF1_MD},
-   #else
-@@ -5120,6 +5397,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"INVALID_PADDING_MODE", 57, 168},
-   #endif
-+  #ifdef PROV_R_INVALID_PREHASHED_DIGEST_LENGTH
-+    {"INVALID_PREHASHED_DIGEST_LENGTH", ERR_LIB_PROV, PROV_R_INVALID_PREHASHED_DIGEST_LENGTH},
-+  #else
-+    {"INVALID_PREHASHED_DIGEST_LENGTH", 57, 241},
-+  #endif
-   #ifdef PROV_R_INVALID_PUBINFO
-     {"INVALID_PUBINFO", ERR_LIB_PROV, PROV_R_INVALID_PUBINFO},
-   #else
-@@ -5155,6 +5437,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"INVALID_TAG_LENGTH", 57, 118},
-   #endif
-+  #ifdef PROV_R_INVALID_THREAD_POOL_SIZE
-+    {"INVALID_THREAD_POOL_SIZE", ERR_LIB_PROV, PROV_R_INVALID_THREAD_POOL_SIZE},
-+  #else
-+    {"INVALID_THREAD_POOL_SIZE", 57, 234},
-+  #endif
-   #ifdef PROV_R_INVALID_UKM_LENGTH
-     {"INVALID_UKM_LENGTH", ERR_LIB_PROV, PROV_R_INVALID_UKM_LENGTH},
-   #else
-@@ -5300,6 +5587,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"NOT_XOF_OR_INVALID_LENGTH", 57, 113},
-   #endif
-+  #ifdef PROV_R_NO_INSTANCE_ALLOWED
-+    {"NO_INSTANCE_ALLOWED", ERR_LIB_PROV, PROV_R_NO_INSTANCE_ALLOWED},
-+  #else
-+    {"NO_INSTANCE_ALLOWED", 57, 242},
-+  #endif
-   #ifdef PROV_R_NO_KEY_SET
-     {"NO_KEY_SET", ERR_LIB_PROV, PROV_R_NO_KEY_SET},
-   #else
-@@ -5310,6 +5602,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"NO_PARAMETERS_SET", 57, 177},
-   #endif
-+  #ifdef PROV_R_ONESHOT_CALL_OUT_OF_ORDER
-+    {"ONESHOT_CALL_OUT_OF_ORDER", ERR_LIB_PROV, PROV_R_ONESHOT_CALL_OUT_OF_ORDER},
-+  #else
-+    {"ONESHOT_CALL_OUT_OF_ORDER", 57, 239},
-+  #endif
-   #ifdef PROV_R_OPERATION_NOT_SUPPORTED_FOR_THIS_KEYTYPE
-     {"OPERATION_NOT_SUPPORTED_FOR_THIS_KEYTYPE", ERR_LIB_PROV, PROV_R_OPERATION_NOT_SUPPORTED_FOR_THIS_KEYTYPE},
-   #else
-@@ -5460,6 +5757,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"UNSUPPORTED_NUMBER_OF_ROUNDS", 57, 152},
-   #endif
-+  #ifdef PROV_R_UPDATE_CALL_OUT_OF_ORDER
-+    {"UPDATE_CALL_OUT_OF_ORDER", ERR_LIB_PROV, PROV_R_UPDATE_CALL_OUT_OF_ORDER},
-+  #else
-+    {"UPDATE_CALL_OUT_OF_ORDER", 57, 240},
-+  #endif
-   #ifdef PROV_R_URI_AUTHORITY_UNSUPPORTED
-     {"URI_AUTHORITY_UNSUPPORTED", ERR_LIB_PROV, PROV_R_URI_AUTHORITY_UNSUPPORTED},
-   #else
-@@ -5595,6 +5897,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"INTERNAL_ERROR", 36, 113},
-   #endif
-+  #ifdef RAND_R_INVALID_PROPERTY_QUERY
-+    {"INVALID_PROPERTY_QUERY", ERR_LIB_RAND, RAND_R_INVALID_PROPERTY_QUERY},
-+  #else
-+    {"INVALID_PROPERTY_QUERY", 36, 137},
-+  #endif
-   #ifdef RAND_R_IN_ERROR_STATE
-     {"IN_ERROR_STATE", ERR_LIB_RAND, RAND_R_IN_ERROR_STATE},
-   #else
-@@ -6210,6 +6517,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"AT_LEAST_TLS_1_2_NEEDED_IN_SUITEB_MODE", 20, 158},
-   #endif
-+  #ifdef SSL_R_BAD_CERTIFICATE
-+    {"BAD_CERTIFICATE", ERR_LIB_SSL, SSL_R_BAD_CERTIFICATE},
-+  #else
-+    {"BAD_CERTIFICATE", 20, 348},
-+  #endif
-   #ifdef SSL_R_BAD_CHANGE_CIPHER_SPEC
-     {"BAD_CHANGE_CIPHER_SPEC", ERR_LIB_SSL, SSL_R_BAD_CHANGE_CIPHER_SPEC},
-   #else
-@@ -6220,6 +6532,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"BAD_CIPHER", 20, 186},
-   #endif
-+  #ifdef SSL_R_BAD_COMPRESSION_ALGORITHM
-+    {"BAD_COMPRESSION_ALGORITHM", ERR_LIB_SSL, SSL_R_BAD_COMPRESSION_ALGORITHM},
-+  #else
-+    {"BAD_COMPRESSION_ALGORITHM", 20, 326},
-+  #endif
-   #ifdef SSL_R_BAD_DATA
-     {"BAD_DATA", ERR_LIB_SSL, SSL_R_BAD_DATA},
-   #else
-@@ -6495,6 +6812,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"CONNECTION_TYPE_NOT_SET", 20, 144},
-   #endif
-+  #ifdef SSL_R_CONN_USE_ONLY
-+    {"CONN_USE_ONLY", ERR_LIB_SSL, SSL_R_CONN_USE_ONLY},
-+  #else
-+    {"CONN_USE_ONLY", 20, 356},
-+  #endif
-   #ifdef SSL_R_CONTEXT_NOT_DANE_ENABLED
-     {"CONTEXT_NOT_DANE_ENABLED", ERR_LIB_SSL, SSL_R_CONTEXT_NOT_DANE_ENABLED},
-   #else
-@@ -6635,6 +6957,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"EE_KEY_TOO_SMALL", 20, 399},
-   #endif
-+  #ifdef SSL_R_EMPTY_RAW_PUBLIC_KEY
-+    {"EMPTY_RAW_PUBLIC_KEY", ERR_LIB_SSL, SSL_R_EMPTY_RAW_PUBLIC_KEY},
-+  #else
-+    {"EMPTY_RAW_PUBLIC_KEY", 20, 349},
-+  #endif
-   #ifdef SSL_R_EMPTY_SRTP_PROTECTION_PROFILE_LIST
-     {"EMPTY_SRTP_PROTECTION_PROFILE_LIST", ERR_LIB_SSL, SSL_R_EMPTY_SRTP_PROTECTION_PROFILE_LIST},
-   #else
-@@ -6650,6 +6977,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"ERROR_IN_RECEIVED_CIPHER_LIST", 20, 151},
-   #endif
-+  #ifdef SSL_R_ERROR_IN_SYSTEM_DEFAULT_CONFIG
-+    {"ERROR_IN_SYSTEM_DEFAULT_CONFIG", ERR_LIB_SSL, SSL_R_ERROR_IN_SYSTEM_DEFAULT_CONFIG},
-+  #else
-+    {"ERROR_IN_SYSTEM_DEFAULT_CONFIG", 20, 419},
-+  #endif
-   #ifdef SSL_R_ERROR_SETTING_TLSA_BASE_DOMAIN
-     {"ERROR_SETTING_TLSA_BASE_DOMAIN", ERR_LIB_SSL, SSL_R_ERROR_SETTING_TLSA_BASE_DOMAIN},
-   #else
-@@ -6680,11 +7012,26 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"EXT_LENGTH_MISMATCH", 20, 163},
-   #endif
-+  #ifdef SSL_R_FAILED_TO_GET_PARAMETER
-+    {"FAILED_TO_GET_PARAMETER", ERR_LIB_SSL, SSL_R_FAILED_TO_GET_PARAMETER},
-+  #else
-+    {"FAILED_TO_GET_PARAMETER", 20, 316},
-+  #endif
-   #ifdef SSL_R_FAILED_TO_INIT_ASYNC
-     {"FAILED_TO_INIT_ASYNC", ERR_LIB_SSL, SSL_R_FAILED_TO_INIT_ASYNC},
-   #else
-     {"FAILED_TO_INIT_ASYNC", 20, 405},
-   #endif
-+  #ifdef SSL_R_FEATURE_NEGOTIATION_NOT_COMPLETE
-+    {"FEATURE_NEGOTIATION_NOT_COMPLETE", ERR_LIB_SSL, SSL_R_FEATURE_NEGOTIATION_NOT_COMPLETE},
-+  #else
-+    {"FEATURE_NEGOTIATION_NOT_COMPLETE", 20, 417},
-+  #endif
-+  #ifdef SSL_R_FEATURE_NOT_RENEGOTIABLE
-+    {"FEATURE_NOT_RENEGOTIABLE", ERR_LIB_SSL, SSL_R_FEATURE_NOT_RENEGOTIABLE},
-+  #else
-+    {"FEATURE_NOT_RENEGOTIABLE", 20, 413},
-+  #endif
-   #ifdef SSL_R_FRAGMENTED_CLIENT_HELLO
-     {"FRAGMENTED_CLIENT_HELLO", ERR_LIB_SSL, SSL_R_FRAGMENTED_CLIENT_HELLO},
-   #else
-@@ -6805,6 +7152,16 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"INVALID_NULL_CMD_NAME", 20, 385},
-   #endif
-+  #ifdef SSL_R_INVALID_RAW_PUBLIC_KEY
-+    {"INVALID_RAW_PUBLIC_KEY", ERR_LIB_SSL, SSL_R_INVALID_RAW_PUBLIC_KEY},
-+  #else
-+    {"INVALID_RAW_PUBLIC_KEY", 20, 350},
-+  #endif
-+  #ifdef SSL_R_INVALID_RECORD
-+    {"INVALID_RECORD", ERR_LIB_SSL, SSL_R_INVALID_RECORD},
-+  #else
-+    {"INVALID_RECORD", 20, 317},
-+  #endif
-   #ifdef SSL_R_INVALID_SEQUENCE_NUMBER
-     {"INVALID_SEQUENCE_NUMBER", ERR_LIB_SSL, SSL_R_INVALID_SEQUENCE_NUMBER},
-   #else
-@@ -6865,6 +7222,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"LIBRARY_HAS_NO_CIPHERS", 20, 161},
-   #endif
-+  #ifdef SSL_R_MAXIMUM_ENCRYPTED_PKTS_REACHED
-+    {"MAXIMUM_ENCRYPTED_PKTS_REACHED", ERR_LIB_SSL, SSL_R_MAXIMUM_ENCRYPTED_PKTS_REACHED},
-+  #else
-+    {"MAXIMUM_ENCRYPTED_PKTS_REACHED", 20, 395},
-+  #endif
-   #ifdef SSL_R_MISSING_DSA_SIGNING_CERT
-     {"MISSING_DSA_SIGNING_CERT", ERR_LIB_SSL, SSL_R_MISSING_DSA_SIGNING_CERT},
-   #else
-@@ -6925,6 +7287,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"MISSING_SUPPORTED_GROUPS_EXTENSION", 20, 209},
-   #endif
-+  #ifdef SSL_R_MISSING_SUPPORTED_VERSIONS_EXTENSION
-+    {"MISSING_SUPPORTED_VERSIONS_EXTENSION", ERR_LIB_SSL, SSL_R_MISSING_SUPPORTED_VERSIONS_EXTENSION},
-+  #else
-+    {"MISSING_SUPPORTED_VERSIONS_EXTENSION", 20, 420},
-+  #endif
-   #ifdef SSL_R_MISSING_TMP_DH_KEY
-     {"MISSING_TMP_DH_KEY", ERR_LIB_SSL, SSL_R_MISSING_TMP_DH_KEY},
-   #else
-@@ -7065,6 +7432,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"NO_SRTP_PROFILES", 20, 359},
-   #endif
-+  #ifdef SSL_R_NO_STREAM
-+    {"NO_STREAM", ERR_LIB_SSL, SSL_R_NO_STREAM},
-+  #else
-+    {"NO_STREAM", 20, 355},
-+  #endif
-   #ifdef SSL_R_NO_SUITABLE_DIGEST_ALGORITHM
-     {"NO_SUITABLE_DIGEST_ALGORITHM", ERR_LIB_SSL, SSL_R_NO_SUITABLE_DIGEST_ALGORITHM},
-   #else
-@@ -7080,6 +7452,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"NO_SUITABLE_KEY_SHARE", 20, 101},
-   #endif
-+  #ifdef SSL_R_NO_SUITABLE_RECORD_LAYER
-+    {"NO_SUITABLE_RECORD_LAYER", ERR_LIB_SSL, SSL_R_NO_SUITABLE_RECORD_LAYER},
-+  #else
-+    {"NO_SUITABLE_RECORD_LAYER", 20, 322},
-+  #endif
-   #ifdef SSL_R_NO_SUITABLE_SIGNATURE_ALGORITHM
-     {"NO_SUITABLE_SIGNATURE_ALGORITHM", ERR_LIB_SSL, SSL_R_NO_SUITABLE_SIGNATURE_ALGORITHM},
-   #else
-@@ -7160,6 +7537,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"PIPELINE_FAILURE", 20, 406},
-   #endif
-+  #ifdef SSL_R_POLL_REQUEST_NOT_SUPPORTED
-+    {"POLL_REQUEST_NOT_SUPPORTED", ERR_LIB_SSL, SSL_R_POLL_REQUEST_NOT_SUPPORTED},
-+  #else
-+    {"POLL_REQUEST_NOT_SUPPORTED", 20, 418},
-+  #endif
-   #ifdef SSL_R_POST_HANDSHAKE_AUTH_ENCODING_ERR
-     {"POST_HANDSHAKE_AUTH_ENCODING_ERR", ERR_LIB_SSL, SSL_R_POST_HANDSHAKE_AUTH_ENCODING_ERR},
-   #else
-@@ -7190,6 +7572,21 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"PSK_NO_SERVER_CB", 20, 225},
-   #endif
-+  #ifdef SSL_R_QUIC_HANDSHAKE_LAYER_ERROR
-+    {"QUIC_HANDSHAKE_LAYER_ERROR", ERR_LIB_SSL, SSL_R_QUIC_HANDSHAKE_LAYER_ERROR},
-+  #else
-+    {"QUIC_HANDSHAKE_LAYER_ERROR", 20, 393},
-+  #endif
-+  #ifdef SSL_R_QUIC_NETWORK_ERROR
-+    {"QUIC_NETWORK_ERROR", ERR_LIB_SSL, SSL_R_QUIC_NETWORK_ERROR},
-+  #else
-+    {"QUIC_NETWORK_ERROR", 20, 387},
-+  #endif
-+  #ifdef SSL_R_QUIC_PROTOCOL_ERROR
-+    {"QUIC_PROTOCOL_ERROR", ERR_LIB_SSL, SSL_R_QUIC_PROTOCOL_ERROR},
-+  #else
-+    {"QUIC_PROTOCOL_ERROR", 20, 382},
-+  #endif
-   #ifdef SSL_R_READ_BIO_NOT_SET
-     {"READ_BIO_NOT_SET", ERR_LIB_SSL, SSL_R_READ_BIO_NOT_SET},
-   #else
-@@ -7200,6 +7597,16 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"READ_TIMEOUT_EXPIRED", 20, 312},
-   #endif
-+  #ifdef SSL_R_RECORDS_NOT_RELEASED
-+    {"RECORDS_NOT_RELEASED", ERR_LIB_SSL, SSL_R_RECORDS_NOT_RELEASED},
-+  #else
-+    {"RECORDS_NOT_RELEASED", 20, 321},
-+  #endif
-+  #ifdef SSL_R_RECORD_LAYER_FAILURE
-+    {"RECORD_LAYER_FAILURE", ERR_LIB_SSL, SSL_R_RECORD_LAYER_FAILURE},
-+  #else
-+    {"RECORD_LAYER_FAILURE", 20, 313},
-+  #endif
-   #ifdef SSL_R_RECORD_LENGTH_MISMATCH
-     {"RECORD_LENGTH_MISMATCH", ERR_LIB_SSL, SSL_R_RECORD_LENGTH_MISMATCH},
-   #else
-@@ -7210,6 +7617,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"RECORD_TOO_SMALL", 20, 298},
-   #endif
-+  #ifdef SSL_R_REMOTE_PEER_ADDRESS_NOT_SET
-+    {"REMOTE_PEER_ADDRESS_NOT_SET", ERR_LIB_SSL, SSL_R_REMOTE_PEER_ADDRESS_NOT_SET},
-+  #else
-+    {"REMOTE_PEER_ADDRESS_NOT_SET", 20, 346},
-+  #endif
-   #ifdef SSL_R_RENEGOTIATE_EXT_TOO_LONG
-     {"RENEGOTIATE_EXT_TOO_LONG", ERR_LIB_SSL, SSL_R_RENEGOTIATE_EXT_TOO_LONG},
-   #else
-@@ -7255,6 +7667,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"SCT_VERIFICATION_FAILED", 20, 208},
-   #endif
-+  #ifdef SSL_R_SEQUENCE_CTR_WRAPPED
-+    {"SEQUENCE_CTR_WRAPPED", ERR_LIB_SSL, SSL_R_SEQUENCE_CTR_WRAPPED},
-+  #else
-+    {"SEQUENCE_CTR_WRAPPED", 20, 327},
-+  #endif
-   #ifdef SSL_R_SERVERHELLO_TLSEXT
-     {"SERVERHELLO_TLSEXT", ERR_LIB_SSL, SSL_R_SERVERHELLO_TLSEXT},
-   #else
-@@ -7325,6 +7742,16 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"SSLV3_ALERT_BAD_CERTIFICATE", 20, 1042},
-   #endif
-+  #ifdef SSL_R_SSLV3_ALERT_BAD_CERTIFICATE
-+    {"SSLV3_ALERT_BAD_CERTIFICATE", ERR_LIB_SSL, SSL_R_SSLV3_ALERT_BAD_CERTIFICATE},
-+  #else
-+    {"SSLV3_ALERT_BAD_CERTIFICATE", 20, 1042},
-+  #endif
-+  #ifdef SSL_R_SSLV3_ALERT_BAD_RECORD_MAC
-+    {"SSLV3_ALERT_BAD_RECORD_MAC", ERR_LIB_SSL, SSL_R_SSLV3_ALERT_BAD_RECORD_MAC},
-+  #else
-+    {"SSLV3_ALERT_BAD_RECORD_MAC", 20, 1020},
-+  #endif
-   #ifdef SSL_R_SSLV3_ALERT_BAD_RECORD_MAC
-     {"SSLV3_ALERT_BAD_RECORD_MAC", ERR_LIB_SSL, SSL_R_SSLV3_ALERT_BAD_RECORD_MAC},
-   #else
-@@ -7335,11 +7762,26 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"SSLV3_ALERT_CERTIFICATE_EXPIRED", 20, 1045},
-   #endif
-+  #ifdef SSL_R_SSLV3_ALERT_CERTIFICATE_EXPIRED
-+    {"SSLV3_ALERT_CERTIFICATE_EXPIRED", ERR_LIB_SSL, SSL_R_SSLV3_ALERT_CERTIFICATE_EXPIRED},
-+  #else
-+    {"SSLV3_ALERT_CERTIFICATE_EXPIRED", 20, 1045},
-+  #endif
-   #ifdef SSL_R_SSLV3_ALERT_CERTIFICATE_REVOKED
-     {"SSLV3_ALERT_CERTIFICATE_REVOKED", ERR_LIB_SSL, SSL_R_SSLV3_ALERT_CERTIFICATE_REVOKED},
-   #else
-     {"SSLV3_ALERT_CERTIFICATE_REVOKED", 20, 1044},
-   #endif
-+  #ifdef SSL_R_SSLV3_ALERT_CERTIFICATE_REVOKED
-+    {"SSLV3_ALERT_CERTIFICATE_REVOKED", ERR_LIB_SSL, SSL_R_SSLV3_ALERT_CERTIFICATE_REVOKED},
-+  #else
-+    {"SSLV3_ALERT_CERTIFICATE_REVOKED", 20, 1044},
-+  #endif
-+  #ifdef SSL_R_SSLV3_ALERT_CERTIFICATE_UNKNOWN
-+    {"SSLV3_ALERT_CERTIFICATE_UNKNOWN", ERR_LIB_SSL, SSL_R_SSLV3_ALERT_CERTIFICATE_UNKNOWN},
-+  #else
-+    {"SSLV3_ALERT_CERTIFICATE_UNKNOWN", 20, 1046},
-+  #endif
-   #ifdef SSL_R_SSLV3_ALERT_CERTIFICATE_UNKNOWN
-     {"SSLV3_ALERT_CERTIFICATE_UNKNOWN", ERR_LIB_SSL, SSL_R_SSLV3_ALERT_CERTIFICATE_UNKNOWN},
-   #else
-@@ -7350,6 +7792,16 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"SSLV3_ALERT_DECOMPRESSION_FAILURE", 20, 1030},
-   #endif
-+  #ifdef SSL_R_SSLV3_ALERT_DECOMPRESSION_FAILURE
-+    {"SSLV3_ALERT_DECOMPRESSION_FAILURE", ERR_LIB_SSL, SSL_R_SSLV3_ALERT_DECOMPRESSION_FAILURE},
-+  #else
-+    {"SSLV3_ALERT_DECOMPRESSION_FAILURE", 20, 1030},
-+  #endif
-+  #ifdef SSL_R_SSLV3_ALERT_HANDSHAKE_FAILURE
-+    {"SSLV3_ALERT_HANDSHAKE_FAILURE", ERR_LIB_SSL, SSL_R_SSLV3_ALERT_HANDSHAKE_FAILURE},
-+  #else
-+    {"SSLV3_ALERT_HANDSHAKE_FAILURE", 20, 1040},
-+  #endif
-   #ifdef SSL_R_SSLV3_ALERT_HANDSHAKE_FAILURE
-     {"SSLV3_ALERT_HANDSHAKE_FAILURE", ERR_LIB_SSL, SSL_R_SSLV3_ALERT_HANDSHAKE_FAILURE},
-   #else
-@@ -7360,11 +7812,26 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"SSLV3_ALERT_ILLEGAL_PARAMETER", 20, 1047},
-   #endif
-+  #ifdef SSL_R_SSLV3_ALERT_ILLEGAL_PARAMETER
-+    {"SSLV3_ALERT_ILLEGAL_PARAMETER", ERR_LIB_SSL, SSL_R_SSLV3_ALERT_ILLEGAL_PARAMETER},
-+  #else
-+    {"SSLV3_ALERT_ILLEGAL_PARAMETER", 20, 1047},
-+  #endif
-   #ifdef SSL_R_SSLV3_ALERT_NO_CERTIFICATE
-     {"SSLV3_ALERT_NO_CERTIFICATE", ERR_LIB_SSL, SSL_R_SSLV3_ALERT_NO_CERTIFICATE},
-   #else
-     {"SSLV3_ALERT_NO_CERTIFICATE", 20, 1041},
-   #endif
-+  #ifdef SSL_R_SSLV3_ALERT_NO_CERTIFICATE
-+    {"SSLV3_ALERT_NO_CERTIFICATE", ERR_LIB_SSL, SSL_R_SSLV3_ALERT_NO_CERTIFICATE},
-+  #else
-+    {"SSLV3_ALERT_NO_CERTIFICATE", 20, 1041},
-+  #endif
-+  #ifdef SSL_R_SSLV3_ALERT_UNEXPECTED_MESSAGE
-+    {"SSLV3_ALERT_UNEXPECTED_MESSAGE", ERR_LIB_SSL, SSL_R_SSLV3_ALERT_UNEXPECTED_MESSAGE},
-+  #else
-+    {"SSLV3_ALERT_UNEXPECTED_MESSAGE", 20, 1010},
-+  #endif
-   #ifdef SSL_R_SSLV3_ALERT_UNEXPECTED_MESSAGE
-     {"SSLV3_ALERT_UNEXPECTED_MESSAGE", ERR_LIB_SSL, SSL_R_SSLV3_ALERT_UNEXPECTED_MESSAGE},
-   #else
-@@ -7375,6 +7842,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"SSLV3_ALERT_UNSUPPORTED_CERTIFICATE", 20, 1043},
-   #endif
-+  #ifdef SSL_R_SSLV3_ALERT_UNSUPPORTED_CERTIFICATE
-+    {"SSLV3_ALERT_UNSUPPORTED_CERTIFICATE", ERR_LIB_SSL, SSL_R_SSLV3_ALERT_UNSUPPORTED_CERTIFICATE},
-+  #else
-+    {"SSLV3_ALERT_UNSUPPORTED_CERTIFICATE", 20, 1043},
-+  #endif
-   #ifdef SSL_R_SSL_COMMAND_SECTION_EMPTY
-     {"SSL_COMMAND_SECTION_EMPTY", ERR_LIB_SSL, SSL_R_SSL_COMMAND_SECTION_EMPTY},
-   #else
-@@ -7450,6 +7922,36 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"STILL_IN_INIT", 20, 121},
-   #endif
-+  #ifdef SSL_R_STREAM_COUNT_LIMITED
-+    {"STREAM_COUNT_LIMITED", ERR_LIB_SSL, SSL_R_STREAM_COUNT_LIMITED},
-+  #else
-+    {"STREAM_COUNT_LIMITED", 20, 411},
-+  #endif
-+  #ifdef SSL_R_STREAM_FINISHED
-+    {"STREAM_FINISHED", ERR_LIB_SSL, SSL_R_STREAM_FINISHED},
-+  #else
-+    {"STREAM_FINISHED", 20, 365},
-+  #endif
-+  #ifdef SSL_R_STREAM_RECV_ONLY
-+    {"STREAM_RECV_ONLY", ERR_LIB_SSL, SSL_R_STREAM_RECV_ONLY},
-+  #else
-+    {"STREAM_RECV_ONLY", 20, 366},
-+  #endif
-+  #ifdef SSL_R_STREAM_RESET
-+    {"STREAM_RESET", ERR_LIB_SSL, SSL_R_STREAM_RESET},
-+  #else
-+    {"STREAM_RESET", 20, 375},
-+  #endif
-+  #ifdef SSL_R_STREAM_SEND_ONLY
-+    {"STREAM_SEND_ONLY", ERR_LIB_SSL, SSL_R_STREAM_SEND_ONLY},
-+  #else
-+    {"STREAM_SEND_ONLY", 20, 379},
-+  #endif
-+  #ifdef SSL_R_TLSV13_ALERT_CERTIFICATE_REQUIRED
-+    {"TLSV13_ALERT_CERTIFICATE_REQUIRED", ERR_LIB_SSL, SSL_R_TLSV13_ALERT_CERTIFICATE_REQUIRED},
-+  #else
-+    {"TLSV13_ALERT_CERTIFICATE_REQUIRED", 20, 1116},
-+  #endif
-   #ifdef SSL_R_TLSV13_ALERT_CERTIFICATE_REQUIRED
-     {"TLSV13_ALERT_CERTIFICATE_REQUIRED", ERR_LIB_SSL, SSL_R_TLSV13_ALERT_CERTIFICATE_REQUIRED},
-   #else
-@@ -7460,6 +7962,16 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"TLSV13_ALERT_MISSING_EXTENSION", 20, 1109},
-   #endif
-+  #ifdef SSL_R_TLSV13_ALERT_MISSING_EXTENSION
-+    {"TLSV13_ALERT_MISSING_EXTENSION", ERR_LIB_SSL, SSL_R_TLSV13_ALERT_MISSING_EXTENSION},
-+  #else
-+    {"TLSV13_ALERT_MISSING_EXTENSION", 20, 1109},
-+  #endif
-+  #ifdef SSL_R_TLSV1_ALERT_ACCESS_DENIED
-+    {"TLSV1_ALERT_ACCESS_DENIED", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_ACCESS_DENIED},
-+  #else
-+    {"TLSV1_ALERT_ACCESS_DENIED", 20, 1049},
-+  #endif
-   #ifdef SSL_R_TLSV1_ALERT_ACCESS_DENIED
-     {"TLSV1_ALERT_ACCESS_DENIED", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_ACCESS_DENIED},
-   #else
-@@ -7470,6 +7982,16 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"TLSV1_ALERT_DECODE_ERROR", 20, 1050},
-   #endif
-+  #ifdef SSL_R_TLSV1_ALERT_DECODE_ERROR
-+    {"TLSV1_ALERT_DECODE_ERROR", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_DECODE_ERROR},
-+  #else
-+    {"TLSV1_ALERT_DECODE_ERROR", 20, 1050},
-+  #endif
-+  #ifdef SSL_R_TLSV1_ALERT_DECRYPTION_FAILED
-+    {"TLSV1_ALERT_DECRYPTION_FAILED", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_DECRYPTION_FAILED},
-+  #else
-+    {"TLSV1_ALERT_DECRYPTION_FAILED", 20, 1021},
-+  #endif
-   #ifdef SSL_R_TLSV1_ALERT_DECRYPTION_FAILED
-     {"TLSV1_ALERT_DECRYPTION_FAILED", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_DECRYPTION_FAILED},
-   #else
-@@ -7480,6 +8002,16 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"TLSV1_ALERT_DECRYPT_ERROR", 20, 1051},
-   #endif
-+  #ifdef SSL_R_TLSV1_ALERT_DECRYPT_ERROR
-+    {"TLSV1_ALERT_DECRYPT_ERROR", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_DECRYPT_ERROR},
-+  #else
-+    {"TLSV1_ALERT_DECRYPT_ERROR", 20, 1051},
-+  #endif
-+  #ifdef SSL_R_TLSV1_ALERT_EXPORT_RESTRICTION
-+    {"TLSV1_ALERT_EXPORT_RESTRICTION", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_EXPORT_RESTRICTION},
-+  #else
-+    {"TLSV1_ALERT_EXPORT_RESTRICTION", 20, 1060},
-+  #endif
-   #ifdef SSL_R_TLSV1_ALERT_EXPORT_RESTRICTION
-     {"TLSV1_ALERT_EXPORT_RESTRICTION", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_EXPORT_RESTRICTION},
-   #else
-@@ -7490,6 +8022,16 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"TLSV1_ALERT_INAPPROPRIATE_FALLBACK", 20, 1086},
-   #endif
-+  #ifdef SSL_R_TLSV1_ALERT_INAPPROPRIATE_FALLBACK
-+    {"TLSV1_ALERT_INAPPROPRIATE_FALLBACK", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_INAPPROPRIATE_FALLBACK},
-+  #else
-+    {"TLSV1_ALERT_INAPPROPRIATE_FALLBACK", 20, 1086},
-+  #endif
-+  #ifdef SSL_R_TLSV1_ALERT_INSUFFICIENT_SECURITY
-+    {"TLSV1_ALERT_INSUFFICIENT_SECURITY", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_INSUFFICIENT_SECURITY},
-+  #else
-+    {"TLSV1_ALERT_INSUFFICIENT_SECURITY", 20, 1071},
-+  #endif
-   #ifdef SSL_R_TLSV1_ALERT_INSUFFICIENT_SECURITY
-     {"TLSV1_ALERT_INSUFFICIENT_SECURITY", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_INSUFFICIENT_SECURITY},
-   #else
-@@ -7500,6 +8042,26 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"TLSV1_ALERT_INTERNAL_ERROR", 20, 1080},
-   #endif
-+  #ifdef SSL_R_TLSV1_ALERT_INTERNAL_ERROR
-+    {"TLSV1_ALERT_INTERNAL_ERROR", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_INTERNAL_ERROR},
-+  #else
-+    {"TLSV1_ALERT_INTERNAL_ERROR", 20, 1080},
-+  #endif
-+  #ifdef SSL_R_TLSV1_ALERT_NO_APPLICATION_PROTOCOL
-+    {"TLSV1_ALERT_NO_APPLICATION_PROTOCOL", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_NO_APPLICATION_PROTOCOL},
-+  #else
-+    {"TLSV1_ALERT_NO_APPLICATION_PROTOCOL", 20, 1120},
-+  #endif
-+  #ifdef SSL_R_TLSV1_ALERT_NO_APPLICATION_PROTOCOL
-+    {"TLSV1_ALERT_NO_APPLICATION_PROTOCOL", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_NO_APPLICATION_PROTOCOL},
-+  #else
-+    {"TLSV1_ALERT_NO_APPLICATION_PROTOCOL", 20, 1120},
-+  #endif
-+  #ifdef SSL_R_TLSV1_ALERT_NO_RENEGOTIATION
-+    {"TLSV1_ALERT_NO_RENEGOTIATION", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_NO_RENEGOTIATION},
-+  #else
-+    {"TLSV1_ALERT_NO_RENEGOTIATION", 20, 1100},
-+  #endif
-   #ifdef SSL_R_TLSV1_ALERT_NO_RENEGOTIATION
-     {"TLSV1_ALERT_NO_RENEGOTIATION", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_NO_RENEGOTIATION},
-   #else
-@@ -7510,21 +8072,56 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"TLSV1_ALERT_PROTOCOL_VERSION", 20, 1070},
-   #endif
-+  #ifdef SSL_R_TLSV1_ALERT_PROTOCOL_VERSION
-+    {"TLSV1_ALERT_PROTOCOL_VERSION", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_PROTOCOL_VERSION},
-+  #else
-+    {"TLSV1_ALERT_PROTOCOL_VERSION", 20, 1070},
-+  #endif
-   #ifdef SSL_R_TLSV1_ALERT_RECORD_OVERFLOW
-     {"TLSV1_ALERT_RECORD_OVERFLOW", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_RECORD_OVERFLOW},
-   #else
-     {"TLSV1_ALERT_RECORD_OVERFLOW", 20, 1022},
-   #endif
-+  #ifdef SSL_R_TLSV1_ALERT_RECORD_OVERFLOW
-+    {"TLSV1_ALERT_RECORD_OVERFLOW", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_RECORD_OVERFLOW},
-+  #else
-+    {"TLSV1_ALERT_RECORD_OVERFLOW", 20, 1022},
-+  #endif
-+  #ifdef SSL_R_TLSV1_ALERT_UNKNOWN_CA
-+    {"TLSV1_ALERT_UNKNOWN_CA", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_UNKNOWN_CA},
-+  #else
-+    {"TLSV1_ALERT_UNKNOWN_CA", 20, 1048},
-+  #endif
-   #ifdef SSL_R_TLSV1_ALERT_UNKNOWN_CA
-     {"TLSV1_ALERT_UNKNOWN_CA", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_UNKNOWN_CA},
-   #else
-     {"TLSV1_ALERT_UNKNOWN_CA", 20, 1048},
-   #endif
-+  #ifdef SSL_R_TLSV1_ALERT_UNKNOWN_PSK_IDENTITY
-+    {"TLSV1_ALERT_UNKNOWN_PSK_IDENTITY", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_UNKNOWN_PSK_IDENTITY},
-+  #else
-+    {"TLSV1_ALERT_UNKNOWN_PSK_IDENTITY", 20, 1115},
-+  #endif
-+  #ifdef SSL_R_TLSV1_ALERT_UNKNOWN_PSK_IDENTITY
-+    {"TLSV1_ALERT_UNKNOWN_PSK_IDENTITY", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_UNKNOWN_PSK_IDENTITY},
-+  #else
-+    {"TLSV1_ALERT_UNKNOWN_PSK_IDENTITY", 20, 1115},
-+  #endif
-   #ifdef SSL_R_TLSV1_ALERT_USER_CANCELLED
-     {"TLSV1_ALERT_USER_CANCELLED", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_USER_CANCELLED},
-   #else
-     {"TLSV1_ALERT_USER_CANCELLED", 20, 1090},
-   #endif
-+  #ifdef SSL_R_TLSV1_ALERT_USER_CANCELLED
-+    {"TLSV1_ALERT_USER_CANCELLED", ERR_LIB_SSL, SSL_R_TLSV1_ALERT_USER_CANCELLED},
-+  #else
-+    {"TLSV1_ALERT_USER_CANCELLED", 20, 1090},
-+  #endif
-+  #ifdef SSL_R_TLSV1_BAD_CERTIFICATE_HASH_VALUE
-+    {"TLSV1_BAD_CERTIFICATE_HASH_VALUE", ERR_LIB_SSL, SSL_R_TLSV1_BAD_CERTIFICATE_HASH_VALUE},
-+  #else
-+    {"TLSV1_BAD_CERTIFICATE_HASH_VALUE", 20, 1114},
-+  #endif
-   #ifdef SSL_R_TLSV1_BAD_CERTIFICATE_HASH_VALUE
-     {"TLSV1_BAD_CERTIFICATE_HASH_VALUE", ERR_LIB_SSL, SSL_R_TLSV1_BAD_CERTIFICATE_HASH_VALUE},
-   #else
-@@ -7535,6 +8132,16 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"TLSV1_BAD_CERTIFICATE_STATUS_RESPONSE", 20, 1113},
-   #endif
-+  #ifdef SSL_R_TLSV1_BAD_CERTIFICATE_STATUS_RESPONSE
-+    {"TLSV1_BAD_CERTIFICATE_STATUS_RESPONSE", ERR_LIB_SSL, SSL_R_TLSV1_BAD_CERTIFICATE_STATUS_RESPONSE},
-+  #else
-+    {"TLSV1_BAD_CERTIFICATE_STATUS_RESPONSE", 20, 1113},
-+  #endif
-+  #ifdef SSL_R_TLSV1_CERTIFICATE_UNOBTAINABLE
-+    {"TLSV1_CERTIFICATE_UNOBTAINABLE", ERR_LIB_SSL, SSL_R_TLSV1_CERTIFICATE_UNOBTAINABLE},
-+  #else
-+    {"TLSV1_CERTIFICATE_UNOBTAINABLE", 20, 1111},
-+  #endif
-   #ifdef SSL_R_TLSV1_CERTIFICATE_UNOBTAINABLE
-     {"TLSV1_CERTIFICATE_UNOBTAINABLE", ERR_LIB_SSL, SSL_R_TLSV1_CERTIFICATE_UNOBTAINABLE},
-   #else
-@@ -7545,6 +8152,16 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"TLSV1_UNRECOGNIZED_NAME", 20, 1112},
-   #endif
-+  #ifdef SSL_R_TLSV1_UNRECOGNIZED_NAME
-+    {"TLSV1_UNRECOGNIZED_NAME", ERR_LIB_SSL, SSL_R_TLSV1_UNRECOGNIZED_NAME},
-+  #else
-+    {"TLSV1_UNRECOGNIZED_NAME", 20, 1112},
-+  #endif
-+  #ifdef SSL_R_TLSV1_UNSUPPORTED_EXTENSION
-+    {"TLSV1_UNSUPPORTED_EXTENSION", ERR_LIB_SSL, SSL_R_TLSV1_UNSUPPORTED_EXTENSION},
-+  #else
-+    {"TLSV1_UNSUPPORTED_EXTENSION", 20, 1110},
-+  #endif
-   #ifdef SSL_R_TLSV1_UNSUPPORTED_EXTENSION
-     {"TLSV1_UNSUPPORTED_EXTENSION", ERR_LIB_SSL, SSL_R_TLSV1_UNSUPPORTED_EXTENSION},
-   #else
-@@ -7665,6 +8282,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"UNKNOWN_KEY_EXCHANGE_TYPE", 20, 250},
-   #endif
-+  #ifdef SSL_R_UNKNOWN_MANDATORY_PARAMETER
-+    {"UNKNOWN_MANDATORY_PARAMETER", ERR_LIB_SSL, SSL_R_UNKNOWN_MANDATORY_PARAMETER},
-+  #else
-+    {"UNKNOWN_MANDATORY_PARAMETER", 20, 323},
-+  #endif
-   #ifdef SSL_R_UNKNOWN_PKEY_TYPE
-     {"UNKNOWN_PKEY_TYPE", ERR_LIB_SSL, SSL_R_UNKNOWN_PKEY_TYPE},
-   #else
-@@ -7700,6 +8322,21 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"UNSUPPORTED_COMPRESSION_ALGORITHM", 20, 257},
-   #endif
-+  #ifdef SSL_R_UNSUPPORTED_CONFIG_VALUE
-+    {"UNSUPPORTED_CONFIG_VALUE", ERR_LIB_SSL, SSL_R_UNSUPPORTED_CONFIG_VALUE},
-+  #else
-+    {"UNSUPPORTED_CONFIG_VALUE", 20, 414},
-+  #endif
-+  #ifdef SSL_R_UNSUPPORTED_CONFIG_VALUE_CLASS
-+    {"UNSUPPORTED_CONFIG_VALUE_CLASS", ERR_LIB_SSL, SSL_R_UNSUPPORTED_CONFIG_VALUE_CLASS},
-+  #else
-+    {"UNSUPPORTED_CONFIG_VALUE_CLASS", 20, 415},
-+  #endif
-+  #ifdef SSL_R_UNSUPPORTED_CONFIG_VALUE_OP
-+    {"UNSUPPORTED_CONFIG_VALUE_OP", ERR_LIB_SSL, SSL_R_UNSUPPORTED_CONFIG_VALUE_OP},
-+  #else
-+    {"UNSUPPORTED_CONFIG_VALUE_OP", 20, 416},
-+  #endif
-   #ifdef SSL_R_UNSUPPORTED_ELLIPTIC_CURVE
-     {"UNSUPPORTED_ELLIPTIC_CURVE", ERR_LIB_SSL, SSL_R_UNSUPPORTED_ELLIPTIC_CURVE},
-   #else
-@@ -7720,6 +8357,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"UNSUPPORTED_STATUS_TYPE", 20, 329},
-   #endif
-+  #ifdef SSL_R_UNSUPPORTED_WRITE_FLAG
-+    {"UNSUPPORTED_WRITE_FLAG", ERR_LIB_SSL, SSL_R_UNSUPPORTED_WRITE_FLAG},
-+  #else
-+    {"UNSUPPORTED_WRITE_FLAG", 20, 412},
-+  #endif
-   #ifdef SSL_R_USE_SRTP_NOT_NEGOTIATED
-     {"USE_SRTP_NOT_NEGOTIATED", ERR_LIB_SSL, SSL_R_USE_SRTP_NOT_NEGOTIATED},
-   #else
-@@ -7750,6 +8392,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"WRONG_CURVE", 20, 378},
-   #endif
-+  #ifdef SSL_R_WRONG_RPK_TYPE
-+    {"WRONG_RPK_TYPE", ERR_LIB_SSL, SSL_R_WRONG_RPK_TYPE},
-+  #else
-+    {"WRONG_RPK_TYPE", 20, 351},
-+  #endif
-   #ifdef SSL_R_WRONG_SIGNATURE_LENGTH
-     {"WRONG_SIGNATURE_LENGTH", ERR_LIB_SSL, SSL_R_WRONG_SIGNATURE_LENGTH},
-   #else
-@@ -8055,6 +8702,16 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"BAD_OBJECT", 34, 119},
-   #endif
-+  #ifdef X509V3_R_BAD_OPTION
-+    {"BAD_OPTION", ERR_LIB_X509V3, X509V3_R_BAD_OPTION},
-+  #else
-+    {"BAD_OPTION", 34, 170},
-+  #endif
-+  #ifdef X509V3_R_BAD_VALUE
-+    {"BAD_VALUE", ERR_LIB_X509V3, X509V3_R_BAD_VALUE},
-+  #else
-+    {"BAD_VALUE", 34, 171},
-+  #endif
-   #ifdef X509V3_R_BN_DEC2BN_ERROR
-     {"BN_DEC2BN_ERROR", ERR_LIB_X509V3, X509V3_R_BN_DEC2BN_ERROR},
-   #else
-@@ -8370,6 +9027,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"UNKNOWN_OPTION", 34, 120},
-   #endif
-+  #ifdef X509V3_R_UNKNOWN_VALUE
-+    {"UNKNOWN_VALUE", ERR_LIB_X509V3, X509V3_R_UNKNOWN_VALUE},
-+  #else
-+    {"UNKNOWN_VALUE", 34, 172},
-+  #endif
-   #ifdef X509V3_R_UNSUPPORTED_OPTION
-     {"UNSUPPORTED_OPTION", ERR_LIB_X509V3, X509V3_R_UNSUPPORTED_OPTION},
-   #else
-@@ -8430,6 +9092,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"CRL_VERIFY_FAILURE", 11, 131},
-   #endif
-+  #ifdef X509_R_DUPLICATE_ATTRIBUTE
-+    {"DUPLICATE_ATTRIBUTE", ERR_LIB_X509, X509_R_DUPLICATE_ATTRIBUTE},
-+  #else
-+    {"DUPLICATE_ATTRIBUTE", 11, 140},
-+  #endif
-   #ifdef X509_R_ERROR_GETTING_MD_BY_NID
-     {"ERROR_GETTING_MD_BY_NID", ERR_LIB_X509, X509_R_ERROR_GETTING_MD_BY_NID},
-   #else
-@@ -8590,6 +9257,11 @@ static struct py_ssl_error_code error_codes[] = {
-   #else
-     {"UNSUPPORTED_ALGORITHM", 11, 111},
-   #endif
-+  #ifdef X509_R_UNSUPPORTED_VERSION
-+    {"UNSUPPORTED_VERSION", ERR_LIB_X509, X509_R_UNSUPPORTED_VERSION},
-+  #else
-+    {"UNSUPPORTED_VERSION", 11, 145},
-+  #endif
-   #ifdef X509_R_WRONG_LOOKUP_TYPE
-     {"WRONG_LOOKUP_TYPE", ERR_LIB_X509, X509_R_WRONG_LOOKUP_TYPE},
-   #else
-diff --git a/Tools/c-analyzer/cpython/_parser.py b/Tools/c-analyzer/cpython/_parser.py
-index 21be53e7884..a08b32fa45d 100644
---- a/Tools/c-analyzer/cpython/_parser.py
-+++ b/Tools/c-analyzer/cpython/_parser.py
-@@ -70,9 +70,7 @@ Python/thread_pthread.h
- Python/thread_pthread_stubs.h
- 
- # only huge constants (safe but parsing is slow)
--Modules/_ssl_data_31.h
--Modules/_ssl_data_300.h
--Modules/_ssl_data_111.h
-+Modules/_ssl_data_*.h
- Modules/cjkcodecs/mappings_*.h
- Modules/unicodedata_db.h
- Modules/unicodename_db.h
-diff --git a/Tools/ssl/make_ssl_data.py b/Tools/ssl/make_ssl_data.py
-index 9860871..0cd05c7 100755
---- a/Tools/ssl/make_ssl_data.py
-+++ b/Tools/ssl/make_ssl_data.py
-@@ -5,9 +5,28 @@ This script should be called *manually* when we want to upgrade SSLError
- `library` and `reason` mnemonics to a more recent OpenSSL version.
- 
- It takes two arguments:
--- the path to the OpenSSL source tree (e.g. git checkout)
-+- the path to the OpenSSL git checkout
- - the path to the header file to be generated Modules/_ssl_data_{version}.h
- - error codes are version specific
-+
-+The OpenSSL git checkout should be at a specific tag, using commands like:
-+    git tag --list 'openssl-*'
-+    git switch --detach openssl-3.4.0
-+
-+
-+After generating the definitions, compare the result with newest pre-existing file.
-+You can use a command like:
-+
-+    git diff --no-index Modules/_ssl_data_31.h Modules/_ssl_data_34.h
-+
-+- If the new version *only* adds new definitions, remove the pre-existing file
-+  and adjust the #include in _ssl.c to point to the new version.
-+- If the new version removes or renumbers some definitions, keep both files and
-+  add a new #include in _ssl.c.
-+
-+A newly supported OpenSSL version should also be added to:
-+- Tools/ssl/multissltests.py
-+- .github/workflows/build.yml
- """
- 
- import argparse
-@@ -16,6 +35,7 @@ import operator
- import os
- import re
- import sys
-+import subprocess
- 
- 
- parser = argparse.ArgumentParser(
-@@ -118,9 +138,17 @@ def main():
-     # sort by libname, numeric error code
-     args.reasons = sorted(reasons, key=operator.itemgetter(0, 3))
- 
-+    git_describe = subprocess.run(
-+        ['git', 'describe', '--long', '--dirty'],
-+        cwd=args.srcdir,
-+        capture_output=True,
-+        encoding='utf-8',
-+        check=True,
-+        )
-     lines = [
--        "/* File generated by Tools/ssl/make_ssl_data.py */"
--        f"/* Generated on {datetime.datetime.utcnow().isoformat()} */"
-+        "/* File generated by Tools/ssl/make_ssl_data.py */",
-+        f"/* Generated on {datetime.datetime.now(datetime.UTC).isoformat()} */",
-+        f"/* Generated from Git commit {git_describe.stdout.strip()} */",
-     ]
-     lines.extend(gen_library_codes(args))
-     lines.append("")
-diff --git a/Tools/ssl/multissltests.py b/Tools/ssl/multissltests.py
-index eae0e0c..fb06f63 100755
---- a/Tools/ssl/multissltests.py
-+++ b/Tools/ssl/multissltests.py
-@@ -51,6 +51,7 @@ OPENSSL_RECENT_VERSIONS = [
-     "3.1.7",
-     "3.2.6",
-     "3.3.5",
-+    "3.4.0",
- ]
- 
- LIBRESSL_OLD_VERSIONS = [
--- 
-2.30.2
-
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index ffdf9affd9..285580195b 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
@@ -1,4 +1,4 @@
-From 3f4f3e917950e286d5729ea949ca342995eb3c3e Mon Sep 17 00:00:00 2001
+From e3c6e770e73e1329958db0a73883e42b01763ae3 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Fri, 17 Nov 2023 14:26:32 +0100
 Subject: [PATCH] Lib/sysconfig.py: use prefix value from build configuration
@@ -9,23 +9,36 @@ native python.
 
 Upstream-Status: Inappropriate [oe-core cross builds]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
+Refresh to apply on top of Python 3.14.0.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- Lib/sysconfig/__init__.py | 5 +++++
- 1 file changed, 5 insertions(+)
+ Lib/sysconfig/__init__.py | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/Lib/sysconfig/__init__.py b/Lib/sysconfig/__init__.py
-index f8e1c7d..0882526 100644
+index 2ecbff222fe..cec54cb23dc 100644
 --- a/Lib/sysconfig/__init__.py
 +++ b/Lib/sysconfig/__init__.py
-@@ -501,6 +501,11 @@ def _init_config_vars():
-         _CONFIG_VARS['VPATH'] = sys._vpath
-     if os.name == 'posix':
-         _init_posix(_CONFIG_VARS)
+@@ -538,12 +538,12 @@ def _init_config_vars():
+     _CONFIG_VARS['py_version'] = _PY_VERSION
+     _CONFIG_VARS['py_version_short'] = _PY_VERSION_SHORT
+     _CONFIG_VARS['py_version_nodot'] = _PY_VERSION_SHORT_NO_DOT
+-    _CONFIG_VARS['installed_base'] = base_prefix
+-    _CONFIG_VARS['base'] = prefix
+-    _CONFIG_VARS['installed_platbase'] = base_exec_prefix
+-    _CONFIG_VARS['platbase'] = exec_prefix
 +    _CONFIG_VARS['installed_base'] = _CONFIG_VARS['prefix']
 +    _CONFIG_VARS['base'] = _CONFIG_VARS['prefix']
 +    _CONFIG_VARS['installed_platbase'] = _CONFIG_VARS['prefix']
 +    _CONFIG_VARS['platbase'] = _CONFIG_VARS['prefix']
 +    _CONFIG_VARS['platlibdir'] = _CONFIG_VARS['PLATLIBDIR']
-     if _HAS_USER_BASE:
-         # Setting 'userbase' is done below the call to the
-         # init function to enable using 'get_config_var' in
+     _CONFIG_VARS['projectbase'] = _PROJECT_BASE
+-    _CONFIG_VARS['platlibdir'] = sys.platlibdir
+     _CONFIG_VARS['implementation'] = _get_implementation()
+     _CONFIG_VARS['implementation_lower'] = _get_implementation().lower()
+     _CONFIG_VARS['abiflags'] = abiflags
+-- 
+2.51.0
+
diff --git a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
index 8fa794b5e7..4a35e8854e 100644
--- a/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
+++ b/meta/recipes-devtools/python/python3/0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch
@@ -1,4 +1,4 @@
-From 8828a52ebace98199569404f01174398bcc64a00 Mon Sep 17 00:00:00 2001
+From aa32aef19d3a54a25dc16b3b77e29e902ee8abd7 Mon Sep 17 00:00:00 2001
 From: Yi Fan Yu <yifan.yu@windriver.com>
 Date: Thu, 1 Apr 2021 13:08:37 -0700
 Subject: [PATCH] Skip failing tests due to load variability on YP AB
@@ -16,6 +16,10 @@ Skip two additional tests due to suspected load variability failures.
 [YOCTO #15131]
 [YOCTO #15177]
 
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+
+Refresh to apply on top of Python 3.14.0.
+
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
  Lib/test/_test_multiprocessing.py | 3 +++
@@ -23,10 +27,10 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  2 files changed, 5 insertions(+)
 
 diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.py
-index 5dae370..23eb971 100644
+index 9a72362c022..008e6a505a5 100644
 --- a/Lib/test/_test_multiprocessing.py
 +++ b/Lib/test/_test_multiprocessing.py
-@@ -701,6 +701,7 @@ class _TestProcess(BaseTestCase):
+@@ -722,6 +722,7 @@ def test_close(self):
          close_queue(q)
  
      @support.requires_resource('walltime')
@@ -34,7 +38,7 @@ index 5dae370..23eb971 100644
      def test_many_processes(self):
          if self.TYPE == 'threads':
              self.skipTest('test not appropriate for {}'.format(self.TYPE))
-@@ -2232,6 +2233,7 @@ class _TestBarrier(BaseTestCase):
+@@ -2345,6 +2346,7 @@ def _test_timeout_f(cls, barrier, results):
          except threading.BrokenBarrierError:
              results.append(True)
  
@@ -42,7 +46,7 @@ index 5dae370..23eb971 100644
      def test_timeout(self):
          """
          Test wait(timeout)
-@@ -5320,6 +5322,7 @@ class TestWait(unittest.TestCase):
+@@ -5459,6 +5461,7 @@ def signal_and_sleep(cls, sem, period):
          time.sleep(period)
  
      @support.requires_resource('walltime')
@@ -51,18 +55,18 @@ index 5dae370..23eb971 100644
          from multiprocessing.connection import wait
  
 diff --git a/Lib/test/test_time.py b/Lib/test/test_time.py
-index 293799f..1dbb623 100644
+index 5312faa5077..36873d9a400 100644
 --- a/Lib/test/test_time.py
 +++ b/Lib/test/test_time.py
-@@ -548,6 +548,7 @@ class TimeTestCase(unittest.TestCase):
+@@ -548,6 +548,7 @@ def test_monotonic(self):
+     def test_perf_counter(self):
+         time.perf_counter()
+ 
++    @unittest.skip('timing related test, dependent on load')
      @unittest.skipIf(
          support.is_wasi, "process_time not available on WASI"
      )
-+    @unittest.skip('timing related test, dependent on load')
-     def test_process_time(self):
-         # process_time() should not include time spend during a sleep
-         start = time.process_time()
-@@ -561,6 +562,7 @@ class TimeTestCase(unittest.TestCase):
+@@ -567,6 +568,7 @@ def test_process_time(self):
          self.assertTrue(info.monotonic)
          self.assertFalse(info.adjustable)
  
@@ -70,3 +74,6 @@ index 293799f..1dbb623 100644
      def test_thread_time(self):
          if not hasattr(time, 'thread_time'):
              if sys.platform.startswith(('linux', 'android', 'win')):
+-- 
+2.52.0
+
diff --git a/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch b/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
index 08ac5861b3..80aa29faf0 100644
--- a/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
+++ b/meta/recipes-devtools/python/python3/0001-test_active_children-skip-problematic-test.patch
@@ -1,4 +1,4 @@
-From 540765b148d942a2339affa6c0d11445e9d0f26c Mon Sep 17 00:00:00 2001
+From 9c9aac87f48eaece5b99ea347b639c21eea84e6d Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <tgamblin@baylibre.com>
 Date: Thu, 13 Jun 2024 10:54:31 -0400
 Subject: [PATCH] test_active_children: skip problematic test
@@ -8,20 +8,27 @@ similar nature to other failing/hanging tests, disable it for now.
 
 Upstream-Status: Inappropriate [OE-Specific]
 
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+
+Refresh to apply on top of Python 3.14.0.
+
 Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
  Lib/test/_test_multiprocessing.py | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/Lib/test/_test_multiprocessing.py b/Lib/test/_test_multiprocessing.py
-index 23eb971..b1295b2 100644
+index 008e6a505a5..746de8945f0 100644
 --- a/Lib/test/_test_multiprocessing.py
 +++ b/Lib/test/_test_multiprocessing.py
-@@ -594,6 +594,7 @@ class _TestProcess(BaseTestCase):
-         self.assertTrue(type(cpus) is int)
-         self.assertTrue(cpus >= 1)
+@@ -615,6 +615,7 @@ def test_cpu_count(self):
+         self.assertIsInstance(cpus, int)
+         self.assertGreaterEqual(cpus, 1)
  
 +    @unittest.skip("skipping problematic test")
      def test_active_children(self):
          self.assertEqual(type(self.active_children()), list)
  
+-- 
+2.51.0
+
diff --git a/meta/recipes-devtools/python/python3/0001-test_cmd-skip-bang-completion-test.patch b/meta/recipes-devtools/python/python3/0001-test_cmd-skip-bang-completion-test.patch
new file mode 100644
index 0000000000..d339e8c198
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-test_cmd-skip-bang-completion-test.patch
@@ -0,0 +1,31 @@
+From 614e3aefec85b51a611f85a55b6760f12e29b953 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Mon, 27 Oct 2025 09:52:46 -0400
+Subject: [PATCH] test_cmd: skip bang completion test
+
+We compile Python3 with editline support by default, which has tab completion
+but not bang completion. If building with readline,
+test_bang_completion_without_do_shell() passes. Skip the test because of this.
+
+Upstream-Status: Inappropriate [embedded-specific]
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ Lib/test/test_cmd.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Lib/test/test_cmd.py b/Lib/test/test_cmd.py
+index dbfec42fc21..c33dab8d10d 100644
+--- a/Lib/test/test_cmd.py
++++ b/Lib/test/test_cmd.py
+@@ -295,6 +295,7 @@ def do_tab_completion_test(self, args):
+         self.assertIn(b'ab_completion_test', output)
+         self.assertIn(b'tab completion success', output)
+ 
++    @unittest.skip('no bang completion without readline')
+     def test_bang_completion_without_do_shell(self):
+         script = textwrap.dedent("""
+             import cmd
+-- 
+2.51.0
+
diff --git a/meta/recipes-devtools/python/python3/0001-test_pyrepl-skip-test_unix_console.test_cursor_back_.patch b/meta/recipes-devtools/python/python3/0001-test_pyrepl-skip-test_unix_console.test_cursor_back_.patch
new file mode 100644
index 0000000000..e886c046cb
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-test_pyrepl-skip-test_unix_console.test_cursor_back_.patch
@@ -0,0 +1,46 @@
+From 66a806ea05ecaf483753de3719041944daae42b0 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Mon, 27 Oct 2025 13:21:14 -0400
+Subject: [PATCH] test_pyrepl: skip test_unix_console.test_cursor_back_write
+
+This test was not run prior to 3.14 due to Python not having access to
+the curses resource. In 3.14, PyREPL's dependency on curses has been
+removed, instead relying on the terminfo module. This results in a
+terminal capability list that does not include ICH1, resulting in an
+"optimization" occurring from PyREPL's side that causes
+test_cursor_back_write() to fail. Specifically, the test tests the
+following writes in sequence:
+
+1. b"1"
+2. TERM_CAPABILITIES["cub"] + b":1"
+3. ANY, b"2"
+
+The first two writes are read correctly, but the result for the third
+write is seeing the equivalent of:
+
+ANY, b"21"
+
+Skip this test.
+
+Upstream-Status: Inappropriate [embedded-specific]
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ Lib/test/test_pyrepl/test_unix_console.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Lib/test/test_pyrepl/test_unix_console.py b/Lib/test/test_pyrepl/test_unix_console.py
+index 3b0d2637dab..5a3c8952f61 100644
+--- a/Lib/test/test_pyrepl/test_unix_console.py
++++ b/Lib/test/test_pyrepl/test_unix_console.py
+@@ -172,6 +172,7 @@ def test_cursor_up_down(self, _os_write):
+         _os_write.assert_any_call(ANY, TERM_CAPABILITIES["cud"] + b":1")
+         con.restore()
+ 
++    @unittest.skip('no ich1 support in vt102 terminfo')
+     def test_cursor_back_write(self, _os_write):
+         events = itertools.chain(
+             code_to_events("1"),
+-- 
+2.51.0
+
diff --git a/meta/recipes-devtools/python/python3/0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch b/meta/recipes-devtools/python/python3/0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch
new file mode 100644
index 0000000000..0fe9399bf1
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch
@@ -0,0 +1,32 @@
+From ac5635821ed9bead45a5bcddc3828e50647fbe77 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <tgamblin@baylibre.com>
+Date: Mon, 27 Oct 2025 14:24:24 -0400
+Subject: [PATCH] test_sysconfig: skip test_sysconfig.test_sysconfigdata_json
+
+This test seems new as of 3.14.0 and fails due to various path and flag
+differences in variables like CFLAGS. Since the test already has the
+precedent of a skip put in place for Android builds due to prefix
+changes, skip it for our situation too.
+
+Upstream-Status: Inappropriate [embedded-specific]
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
+---
+ Lib/test/test_sysconfig.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Lib/test/test_sysconfig.py b/Lib/test/test_sysconfig.py
+index 09eff11179e..14fcdedccba 100644
+--- a/Lib/test/test_sysconfig.py
++++ b/Lib/test/test_sysconfig.py
+@@ -685,6 +685,7 @@ def test_makefile_overwrites_config_vars(self):
+         self.assertNotEqual(data['prefix'], data['base_prefix'])
+         self.assertNotEqual(data['exec_prefix'], data['base_exec_prefix'])
+ 
++    @unittest.skip('OE adds/modifies various flags and paths/prefixes')
+     @unittest.skipIf(os.name != 'posix', '_sysconfig-vars JSON file is only available on POSIX')
+     @unittest.skipIf(is_wasi, "_sysconfig-vars JSON file currently isn't available on WASI")
+     @unittest.skipIf(is_android or is_apple_mobile, 'Android and iOS change the prefix')
+-- 
+2.51.0
+
diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 441830833b..3184bbe0c3 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -1040,7 +1040,8 @@
             "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/string.py"
+            "${libdir}/python${PYTHON_MAJMIN}/string/__init__.py",
+            "${libdir}/python${PYTHON_MAJMIN}/string/templatelib.py"
         ],
         "cached": [
             "${libdir}/python${PYTHON_MAJMIN}/__pycache__/string.*.pyc"
diff --git a/meta/recipes-devtools/python/python3_3.13.11.bb b/meta/recipes-devtools/python/python3_3.14.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3_3.13.11.bb
rename to meta/recipes-devtools/python/python3_3.14.0.bb
index 2fcfd4aba1..7b917a02dd 100644
--- a/meta/recipes-devtools/python/python3_3.13.11.bb
+++ b/meta/recipes-devtools/python/python3_3.14.0.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Python is a programming language that lets you work more quickly
 LICENSE = "PSF-2.0"
 SECTION = "devel/python"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3f64a4ff490f884d562feb77bf2435f1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=224f30639105a6ab845e068c2d0903ff"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://run-ptest \
@@ -29,20 +29,22 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-test_deadlock-skip-problematic-test.patch \
            file://0001-test_active_children-skip-problematic-test.patch \
            file://0001-test_readline-skip-limited-history-test.patch \
-           file://0001-Generate-data-for-OpenSSL-3.4-and-add-it-to-multissl.patch \
+           file://0001-test_cmd-skip-bang-completion-test.patch \
+	   file://0001-test_pyrepl-skip-test_unix_console.test_cursor_back_.patch \
+	   file://0001-test_sysconfig-skip-test_sysconfig.test_sysconfigdat.patch \
            "
 SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "16ede7bb7cdbfa895d11b0642fa0e523f291e6487194d53cf6d3b338c3a17ea2"
+SRC_URI[sha256sum] = "2299dae542d395ce3883aca00d3c910307cd68e0b2f7336098c8e7b7eee9f3e9"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
 
 CVE_PRODUCT = "python:python python_software_foundation:python cpython"
 
-PYTHON_MAJMIN = "3.13"
+PYTHON_MAJMIN = "3.14"
 
 S = "${UNPACKDIR}/Python-${PV}"
 
@@ -70,6 +72,7 @@ DEPENDS = "\
     virtual/libintl \
     xz \
     zlib \
+    zstd \
 "
 
 DEPENDS:append:class-target = " python3-native"
@@ -298,6 +301,15 @@ py_package_preprocess () {
 
         #Remove the unneeded copy of target sysconfig data
         rm -rf ${PKGD}/${libdir}/python-sysconfigdata
+
+	# Remove references to buildpaths in _sysconfig_vars JSON files
+        sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' -e s:'--with-libtool-sysroot=${STAGING_DIR_TARGET}'::g \
+                -e 's|${DEBUG_PREFIX_MAP}||g' \
+                -e 's:${HOSTTOOLS_DIR}/::g' \
+                -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
+                -e 's:${RECIPE_SYSROOT}::g' \
+                -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
+		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfig_vars*.json
 }
 
 # We want bytecode precompiled .py files (.pyc's) by default
-- 
2.52.0



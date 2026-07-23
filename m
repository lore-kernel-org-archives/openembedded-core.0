Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C283C531CA
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 11:54:39 +0000 (UTC)
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21515.1784806946815468539
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 04:42:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ew.tq-group.com header.s=default2602 header.b=To/+Gb5j;
 spf=pass (domain: ew.tq-group.com, ip: 188.40.3.216, mailfrom: alexander.stein@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=KJQ2mwXRRq94MryxkWRh9ZajYUSnm0bqyA1q6JJMtuA=; b=To/+Gb5jmXu0RgaQqJPBOINaiE
	ehqH8+myICbJF0j3a4NDa/gw+gUE+lL7xmSbSCwnjPLIvaSNRVDONjhUlS5MCpcTJh1YNJUZUTV2G
	5qyqxPtaM/5oJ1NTLK58nbC2f9NRUggvJP94waYM1WOcHlspUPCbAmiGXgfKeKDp7oIAHmzwhBUEn
	235zZ4KwN9j5TxaHQG3FybvnajQXcOwSB0T192L8owfB//63gqpW4yTqjm8OKz3hAjjZl6PuxsoXR
	XeSxvWa5JFxw/35zhjn6fQhvfUU5LlStUhEsCTl/2mbcaFup4dK5gehcxa3tjGTp7hAZcGDAQ+q1O
	ztUV6TYQ==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wmrom-000BJ3-25;
	Thu, 23 Jul 2026 13:42:24 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wmrom-00050t-0v;
	Thu, 23 Jul 2026 13:42:24 +0200
From: "Alexander Stein" <alexander.stein@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [wrynose][PATCH] kea: Fix crosscompilation
Date: Thu, 23 Jul 2026 13:42:21 +0200
Message-ID: <20260723114222.261331-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Virus-Scanned: Clear (ClamAV 1.4.3/28069/Thu Jul 23 08:24:48 2026)
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 11:54:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241826

Backport upstream commits to fix cross compilation.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../kea/files/0001-3982-Checkpoint.patch      | 169 +++++++++++++
 ...002-3982-Checkpoint-applied-proposal.patch | 227 ++++++++++++++++++
 .../files/0003-3982-Last-improvements.patch   | 104 ++++++++
 meta/recipes-connectivity/kea/kea_3.0.3.bb    |   3 +
 4 files changed, 503 insertions(+)
 create mode 100644 meta/recipes-connectivity/kea/files/0001-3982-Checkpoint.patch
 create mode 100644 meta/recipes-connectivity/kea/files/0002-3982-Checkpoint-applied-proposal.patch
 create mode 100644 meta/recipes-connectivity/kea/files/0003-3982-Last-improvements.patch

diff --git a/meta/recipes-connectivity/kea/files/0001-3982-Checkpoint.patch b/meta/recipes-connectivity/kea/files/0001-3982-Checkpoint.patch
new file mode 100644
index 0000000000..5db451edb0
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/0001-3982-Checkpoint.patch
@@ -0,0 +1,169 @@
+From c96b0da0ff5cc29526fc8f12ba9a356619e962f4 Mon Sep 17 00:00:00 2001
+From: Francis Dupont <fdupont@isc.org>
+Date: Sun, 8 Mar 2026 12:22:25 +0100
+Subject: [PATCH] [#3982] Checkpoint
+
+Upstream-Status: Backport [https://gitlab.isc.org/isc-projects/kea/-/commit/929b754407776366c18ba50aae9b2bea8cdaa86e]
+
+Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
+---
+ compiler-checks/boost-has-threads.cc |  8 ------
+ compiler-checks/boost-regex.cc       |  8 ------
+ compiler-checks/get-cpp-standard.cc  |  7 -----
+ meson.build                          | 42 ++++++++++++----------------
+ 4 files changed, 18 insertions(+), 47 deletions(-)
+ delete mode 100644 compiler-checks/boost-has-threads.cc
+ delete mode 100644 compiler-checks/boost-regex.cc
+ delete mode 100644 compiler-checks/get-cpp-standard.cc
+
+diff --git a/compiler-checks/boost-has-threads.cc b/compiler-checks/boost-has-threads.cc
+deleted file mode 100644
+index e0203a9ec2..0000000000
+--- a/compiler-checks/boost-has-threads.cc
++++ /dev/null
+@@ -1,8 +0,0 @@
+-#include <boost/config.hpp>
+-#ifndef BOOST_HAS_THREADS
+-#error "boost will not use threads"
+-#endif
+-
+-int main() {
+-    return 0;
+-}
+diff --git a/compiler-checks/boost-regex.cc b/compiler-checks/boost-regex.cc
+deleted file mode 100644
+index 0f7eb87b63..0000000000
+--- a/compiler-checks/boost-regex.cc
++++ /dev/null
+@@ -1,8 +0,0 @@
+-#include <regex.h>
+-#ifdef BOOST_RE_REGEX_H
+-#error "boost/regex.h"
+-#endif
+-
+-int main() {
+-    return 0;
+-}
+diff --git a/compiler-checks/get-cpp-standard.cc b/compiler-checks/get-cpp-standard.cc
+deleted file mode 100644
+index db177c7547..0000000000
+--- a/compiler-checks/get-cpp-standard.cc
++++ /dev/null
+@@ -1,7 +0,0 @@
+-#include <iostream>
+-
+-int main() {
+-    long v = __cplusplus;
+-    std::cout << v << "\n";
+-    return 0;
+-}
+diff --git a/meson.build b/meson.build
+index 769e15779e..ceff12332f 100644
+--- a/meson.build
++++ b/meson.build
+@@ -10,7 +10,7 @@
+ # information regarding copyright ownership.
+ 
+ # Require meson >= 0.64.0 for preserve_path arg in install_data.
+-# Require meson >= 1.1.0 for meson.options file.
++# Require meson >= 1.3.0 for compiler.has_define().
+ # bug_report is not yet supported by meson, its value will be
+ # 'kea-dev@lists.isc.org'
+ 
+@@ -18,7 +18,7 @@ project(
+     'kea',
+     'cpp',
+     version: '3.0.3',
+-    meson_version: '>=1.1.0',
++    meson_version: '>=1.3.0',
+     license: 'MPL-2.0',
+     license_files: ['COPYING'],
+     default_options: [
+@@ -364,15 +364,8 @@ conf_data.set('HAVE_PGSQL', POSTGRESQL_DEP.found())
+ #### Compiler Checks
+ 
+ # The required keyword in cpp.run() is an 1.5.0 feature.
+-result = cpp.run(
+-    fs.read('compiler-checks/get-cpp-standard.cc'),
+-    name: 'Get cpp standard',
+-)
+-if result.returncode() == 0
+-    cpp_standard = result.stdout().strip()
+-else
+-    error('C++ standard is unknown')
+-endif
++
++cpp_standard = cpp.get_define('__cplusplus')
+ message(f'Detected C++ standard (__cplusplus value) is @cpp_standard@.')
+ cpp_std_opt = get_option('cpp_std')
+ no_cpp_std_opt_msg = 'Please set a C++ standard by passing the -D cpp_std argument to meson.'
+@@ -430,26 +423,27 @@ if CRYPTO_DEP.name() == botan.name() and cpp_standard.version_compare('<202000')
+     error('\n'.join(msgs))
+ endif
+ 
+-result = cpp.run(
+-    fs.read('compiler-checks/boost-has-threads.cc'),
++result = cpp.has_define(
++    'BOOST_HAS_THREADS',
+     dependencies: [boost_dep, threads_dep],
+-    name: 'BOOST_HAS_THREADS',
++    prefix: '#include <boost/config.hpp>',
+ )
+-if result.returncode() != 0
++if not result
+     error('boost is not configured to use threads')
+ endif
+ 
+ if cpp.has_header('boost/regex.h', dependencies: [boost_dep], required: false)
+-    result = cpp.run(
+-        fs.read('compiler-checks/boost-regex.cc'),
++   result = cpp.has_define(
++       'BOOST_RE_REGEX_H',
+         dependencies: [boost_dep, threads_dep],
+-        name: 'GET_SYSTEM_VS_BOOST_REGEX_HEADER',
++        prefix: '#include <regex.h>',
+     )
+-    if result.returncode() != 0
++    if result
+         error('boost/regex.h is used in place of system regex.h')
+     endif
+ endif
+ 
++# Rewrite this one as it does not work when cross compiling.
+ result = cpp.run(
+     fs.read('compiler-checks/chrono-same-duration.cc'),
+     name: 'CHRONO_SAME_DURATION',
+@@ -457,28 +451,28 @@ result = cpp.run(
+ conf_data.set('CHRONO_SAME_DURATION', result.returncode() == 0)
+ 
+ if CRYPTO_DEP.name() == openssl.name()
+-    result1 = cpp.run(
++    result1 = cpp.compiles(
+         fs.read('compiler-checks/have-generic-tls-method.cc'),
+         name: 'HAVE_GENERIC_TLS_METHOD',
+         dependencies: [boost_dep, CRYPTO_DEP, threads_dep],
+     )
+-    result2 = cpp.run(
++    result2 = cpp.compiles(
+         fs.read('compiler-checks/stream-truncated-error.cc'),
+         name: 'HAVE_STREAM_TRUNCATED_ERROR',
+         dependencies: [boost_dep, CRYPTO_DEP, threads_dep],
+     )
+-    if result1.returncode() != 0 or result2.returncode() != 0
++    if not result1 or not result2
+         error('Boost TLS support broken.')
+     endif
+ endif
+ 
+ if CRYPTO_DEP.name() == botan.name()
+-    result = cpp.run(
++    result = cpp.compiles(
+         fs.read('compiler-checks/botan-hash.cc'),
+         name: 'CHECK_BOTAN_LIBRARY',
+         dependencies: [boost_dep, CRYPTO_DEP, threads_dep],
+     )
+-    if result.returncode() != 0
++    if not result
+         error('Botan library does not work.')
+     endif
+ endif
diff --git a/meta/recipes-connectivity/kea/files/0002-3982-Checkpoint-applied-proposal.patch b/meta/recipes-connectivity/kea/files/0002-3982-Checkpoint-applied-proposal.patch
new file mode 100644
index 0000000000..f88ed57ac0
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/0002-3982-Checkpoint-applied-proposal.patch
@@ -0,0 +1,227 @@
+From 3bfeea931fd1860ffb5e3eb514cdeb79d18b069c Mon Sep 17 00:00:00 2001
+From: Francis Dupont <fdupont@isc.org>
+Date: Sun, 8 Mar 2026 22:55:55 +0100
+Subject: [PATCH] [#3982] Checkpoint: applied proposal
+
+Upstream-Status: Backport [https://gitlab.isc.org/isc-projects/kea/-/commit/67eb779e9b4307bb1a8449690f4a9604e4e6da14]
+
+Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
+---
+ compiler-checks/get-boost-version.cc     |  7 ---
+ compiler-checks/get-log4cplus-version.cc |  7 ---
+ compiler-checks/get-openssl-version.cc   |  7 ---
+ compiler-checks/have-afl.cc              |  7 ---
+ meson.build                              | 75 ++++++++++++------------
+ 5 files changed, 36 insertions(+), 67 deletions(-)
+ delete mode 100644 compiler-checks/get-boost-version.cc
+ delete mode 100644 compiler-checks/get-log4cplus-version.cc
+ delete mode 100644 compiler-checks/get-openssl-version.cc
+ delete mode 100644 compiler-checks/have-afl.cc
+
+diff --git a/compiler-checks/get-boost-version.cc b/compiler-checks/get-boost-version.cc
+deleted file mode 100644
+index 011f9ce514..0000000000
+--- a/compiler-checks/get-boost-version.cc
++++ /dev/null
+@@ -1,7 +0,0 @@
+-#include <boost/version.hpp>
+-#include <iostream>
+-
+-int main() {
+-    std::cout << BOOST_LIB_VERSION << "\n";
+-    return 0;
+-}
+diff --git a/compiler-checks/get-log4cplus-version.cc b/compiler-checks/get-log4cplus-version.cc
+deleted file mode 100644
+index 7d986c2e6a..0000000000
+--- a/compiler-checks/get-log4cplus-version.cc
++++ /dev/null
+@@ -1,7 +0,0 @@
+-#include <log4cplus/version.h>
+-#include <iostream>
+-
+-int main() {
+-    std::cout << LOG4CPLUS_VERSION_STR << "\n";
+-    return 0;
+-}
+diff --git a/compiler-checks/get-openssl-version.cc b/compiler-checks/get-openssl-version.cc
+deleted file mode 100644
+index 6120f721da..0000000000
+--- a/compiler-checks/get-openssl-version.cc
++++ /dev/null
+@@ -1,7 +0,0 @@
+-#include <openssl/opensslv.h>
+-#include <iostream>
+-
+-int main() {
+-    std::cout << OPENSSL_VERSION_TEXT << "\n";
+-    return 0;
+-}
+diff --git a/compiler-checks/have-afl.cc b/compiler-checks/have-afl.cc
+deleted file mode 100644
+index cd63820efe..0000000000
+--- a/compiler-checks/have-afl.cc
++++ /dev/null
+@@ -1,7 +0,0 @@
+-#ifndef __AFL_COMPILER
+-#error AFL compiler required
+-#endif
+-
+-int main() {
+-    return 0;
+-}
+diff --git a/meson.build b/meson.build
+index ceff12332f..683a55ad05 100644
+--- a/meson.build
++++ b/meson.build
+@@ -477,49 +477,47 @@ if CRYPTO_DEP.name() == botan.name()
+     endif
+ endif
+ 
+-result = cpp.run(
++result = cpp.links(
+     fs.read('compiler-checks/have-optreset.cc'),
+     name: 'HAVE_OPTRESET',
+ )
+-conf_data.set('HAVE_OPTRESET', result.returncode() == 0)
++conf_data.set('HAVE_OPTRESET', result)
+ 
+-result = cpp.run(fs.read('compiler-checks/have-sa-len.cc'), name: 'HAVE_SA_LEN')
+-conf_data.set('HAVE_SA_LEN', result.returncode() == 0)
++result = cpp.compiles(fs.read('compiler-checks/have-sa-len.cc'), name: 'HAVE_SA_LEN')
++conf_data.set('HAVE_SA_LEN', result)
+ 
+-result = cpp.run(
++result = cpp.links(
+     fs.read('compiler-checks/log4cplus-initializer.cc'),
+     name: 'LOG4CPLUS_INITIALIZER_H',
+     dependencies: [LOG4CPLUS_DEP],
+ )
+-conf_data.set('LOG4CPLUS_INITIALIZER_H', result.returncode() == 0)
++conf_data.set('LOG4CPLUS_INITIALIZER_H', result)
+ 
+ if MYSQL_DEP.found()
+-    result = cpp.run(
++    result = cpp.compiles(
+         fs.read('compiler-checks/mysql-my-bool.cc'),
+         name: 'MYSQL_MY_BOOL',
+         dependencies: [MYSQL_DEP],
+     )
+-    conf_data.set('HAVE_MYSQL_MY_BOOL', result.returncode() == 0)
++    conf_data.set('HAVE_MYSQL_MY_BOOL', result)
+ 
+-    result = cpp.run(
++    result = cpp.compiles(
+         fs.read('compiler-checks/mysql-get-option.cc'),
+         name: 'HAVE_MYSQL_GET_OPTION',
+         dependencies: [MYSQL_DEP],
+     )
+-    conf_data.set('HAVE_MYSQL_GET_OPTION', result.returncode() == 0)
++    conf_data.set('HAVE_MYSQL_GET_OPTION', result)
+ endif
+ 
+-result = cpp.run(
+-    fs.read('compiler-checks/fuzzing-with-clusterfuzzlite.cc'),
+-    name: 'FUZZING_WITH_CLUSTERFUZZLITE',
+-)
+-FUZZING_WITH_CLUSTERFUZZLITE = result.returncode() == 0
+-
+-have_afl = false
+-result = cpp.run(fs.read('compiler-checks/have-afl.cc'), name: 'HAVE_AFL')
+-if result.returncode() == 0
+-    have_afl = true
++if FUZZ_OPT.enabled()
++    result = cpp.run(
++        fs.read('compiler-checks/fuzzing-with-clusterfuzzlite.cc'),
++        name: 'FUZZING_WITH_CLUSTERFUZZLITE',
++    )
++    FUZZING_WITH_CLUSTERFUZZLITE = result.returncode() == 0
+ endif
++
++have_afl = cpp.has_define('__AFL_COMPILER')
+ conf_data.set('HAVE_AFL', have_afl)
+ 
+ if GTEST_DEP.found()
+@@ -528,22 +526,22 @@ if GTEST_DEP.found()
+     if GTEST_DEP.type_name() == 'internal'
+         conf_data.set('HAVE_CREATE_UNIFIED_DIFF', true)
+     else
+-        result = cpp.run(
++        result = cpp.compiles(
+             fs.read('compiler-checks/have-create-unified-diff.cc'),
+             name: 'HAVE_CREATE_UNIFIED_DIFF',
+             dependencies: [GTEST_DEP],
+         )
+-        conf_data.set('HAVE_CREATE_UNIFIED_DIFF', result.returncode() == 0)
++        conf_data.set('HAVE_CREATE_UNIFIED_DIFF', result)
+     endif
+ endif
+ 
+ if KRB5_DEP.found()
+-    result = cpp.run(
++    result = cpp.links(
+         fs.read('compiler-checks/have-gss-str-to-oid.cc'),
+         name: 'HAVE_GSS_STR_TO_OID',
+         dependencies: [KRB5_DEP],
+     )
+-    conf_data.set('HAVE_GSS_STR_TO_OID', result.returncode() == 0)
++    conf_data.set('HAVE_GSS_STR_TO_OID', result)
+ endif
+ 
+ #### Other checks.
+@@ -766,13 +764,12 @@ endif
+ report_conf_data.set('PYTHON_PATH', py_for_runtime)
+ report_conf_data.set('PYTHON_VERSION', PYTHON.version())
+ report_conf_data.set('PKGPYTHONDIR', PKGPYTHONDIR)
+-result = cpp.run(
+-    fs.read('compiler-checks/get-boost-version.cc'),
++result = cpp.get_define('BOOST_LIB_VERSION',
+     dependencies: [boost_dep, threads_dep],
+-    name: 'Get Boost version',
++    prefix: '#include <boost/version.hpp>',
+ )
+-if result.returncode() == 0
+-    report_conf_data.set('BOOST_VERSION', result.stdout().strip())
++if result != ''
++    report_conf_data.set('BOOST_VERSION', result.strip())
+ else
+     report_conf_data.set('BOOST_VERSION', 'unknown version')
+ endif
+@@ -796,13 +793,13 @@ if CRYPTO_DEP.name() == botan.name()
+ elif CRYPTO_DEP.name() == openssl.name()
+     report_conf_data.set('CRYPTO_NAME', 'OpenSSL')
+     report_conf_data.set('SPACES', '              ')
+-    result = cpp.run(
+-        fs.read('compiler-checks/get-openssl-version.cc'),
+-        name: 'Get OpenSSL version',
++    result = cpp.get_define(
++        'OPENSSL_VERSION_TEXT',
+         dependencies: [CRYPTO_DEP],
++        prefix: '#include <openssl/opensslv.h>',
+     )
+-    if result.returncode() == 0
+-        version = result.stdout().strip()
++    if result != ''
++        version = result.strip()
+     else
+         version = openssl.version()
+     endif
+@@ -811,13 +808,13 @@ elif CRYPTO_DEP.name() == openssl.name()
+     endif
+     report_conf_data.set('CRYPTO_VERSION', version)
+ endif
+-result = cpp.run(
+-    fs.read('compiler-checks/get-log4cplus-version.cc'),
+-    name: 'Get Log4cplus version',
++result = cpp.get_define(
++    'LOG4CPLUS_VERSION_STR',
+     dependencies: [LOG4CPLUS_DEP],
++    prefix: '#include <log4cplus/version.h>',
+ )
+-if result.returncode() == 0
+-    version = result.stdout().strip()
++if result != ''
++    version = result.strip()
+ else
+     version = log4cplus.version()
+ endif
diff --git a/meta/recipes-connectivity/kea/files/0003-3982-Last-improvements.patch b/meta/recipes-connectivity/kea/files/0003-3982-Last-improvements.patch
new file mode 100644
index 0000000000..22fe8a3aa6
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/0003-3982-Last-improvements.patch
@@ -0,0 +1,104 @@
+From 6de169c45bc2a5369a4b83cb2158f1e5e487ad00 Mon Sep 17 00:00:00 2001
+From: Francis Dupont <fdupont@isc.org>
+Date: Sun, 8 Mar 2026 23:26:33 +0100
+Subject: [PATCH] [#3982] Last improvements
+
+Upstream-Status: Backport [https://gitlab.isc.org/isc-projects/kea/-/commit/812a34d836cda7a75b4f81b31195c342ccba6cdf]
+
+Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
+---
+ compiler-checks/chrono-same-duration.cc |  6 ++++--
+ meson.build                             | 23 ++++++++++++-----------
+ 2 files changed, 16 insertions(+), 13 deletions(-)
+
+diff --git a/compiler-checks/chrono-same-duration.cc b/compiler-checks/chrono-same-duration.cc
+index f2727ebdbe..fa33ab0145 100644
+--- a/compiler-checks/chrono-same-duration.cc
++++ b/compiler-checks/chrono-same-duration.cc
+@@ -2,6 +2,8 @@
+ #include <type_traits>
+ 
+ int main() {
+-    return(std::is_same<std::chrono::system_clock::duration,
+-                        std::chrono::steady_clock::duration>::value ? 0 : 1);
++    static_assert(std::is_same<std::chrono::system_clock::duration,
++                               std::chrono::steady_clock::duration>::value,
++                  "CHRONO_SAME_DURATION");
++    return(0);
+ }
+diff --git a/meson.build b/meson.build
+index 683a55ad05..f8945cd993 100644
+--- a/meson.build
++++ b/meson.build
+@@ -363,8 +363,6 @@ conf_data.set('HAVE_PGSQL', POSTGRESQL_DEP.found())
+ 
+ #### Compiler Checks
+ 
+-# The required keyword in cpp.run() is an 1.5.0 feature.
+-
+ cpp_standard = cpp.get_define('__cplusplus')
+ message(f'Detected C++ standard (__cplusplus value) is @cpp_standard@.')
+ cpp_std_opt = get_option('cpp_std')
+@@ -383,12 +381,12 @@ if cpp_standard.version_compare('<201100')
+     error('\n'.join(msgs))
+ endif
+ if cpp_standard.version_compare('<201400')
+-    result = cpp.run(
++    result = cpp.compiles(
+         fs.read('compiler-checks/boost-math-cpp14.cc'),
+         name: 'BOOST_MATH_REQUIRES_CPP14',
+         dependencies: [boost_dep, threads_dep],
+     )
+-    if result.returncode() != 0
++    if not result
+         msgs = ['Boost Math requires at least C++14.']
+         if cpp_std_opt == 'none'
+             msgs += no_cpp_std_opt_msg
+@@ -433,8 +431,8 @@ if not result
+ endif
+ 
+ if cpp.has_header('boost/regex.h', dependencies: [boost_dep], required: false)
+-   result = cpp.has_define(
+-       'BOOST_RE_REGEX_H',
++    result = cpp.has_define(
++        'BOOST_RE_REGEX_H',
+         dependencies: [boost_dep, threads_dep],
+         prefix: '#include <regex.h>',
+     )
+@@ -443,12 +441,11 @@ if cpp.has_header('boost/regex.h', dependencies: [boost_dep], required: false)
+     endif
+ endif
+ 
+-# Rewrite this one as it does not work when cross compiling.
+-result = cpp.run(
++result = cpp.compiles(
+     fs.read('compiler-checks/chrono-same-duration.cc'),
+     name: 'CHRONO_SAME_DURATION',
+ )
+-conf_data.set('CHRONO_SAME_DURATION', result.returncode() == 0)
++conf_data.set('CHRONO_SAME_DURATION', result)
+ 
+ if CRYPTO_DEP.name() == openssl.name()
+     result1 = cpp.compiles(
+@@ -483,7 +480,10 @@ result = cpp.links(
+ )
+ conf_data.set('HAVE_OPTRESET', result)
+ 
+-result = cpp.compiles(fs.read('compiler-checks/have-sa-len.cc'), name: 'HAVE_SA_LEN')
++result = cpp.compiles(
++    fs.read('compiler-checks/have-sa-len.cc'),
++    name: 'HAVE_SA_LEN',
++)
+ conf_data.set('HAVE_SA_LEN', result)
+ 
+ result = cpp.links(
+@@ -764,7 +764,8 @@ endif
+ report_conf_data.set('PYTHON_PATH', py_for_runtime)
+ report_conf_data.set('PYTHON_VERSION', PYTHON.version())
+ report_conf_data.set('PKGPYTHONDIR', PKGPYTHONDIR)
+-result = cpp.get_define('BOOST_LIB_VERSION',
++result = cpp.get_define(
++    'BOOST_LIB_VERSION',
+     dependencies: [boost_dep, threads_dep],
+     prefix: '#include <boost/version.hpp>',
+ )
diff --git a/meta/recipes-connectivity/kea/kea_3.0.3.bb b/meta/recipes-connectivity/kea/kea_3.0.3.bb
index 0646bf702e..f91da3c8c1 100644
--- a/meta/recipes-connectivity/kea/kea_3.0.3.bb
+++ b/meta/recipes-connectivity/kea/kea_3.0.3.bb
@@ -22,6 +22,9 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.xz \
            file://0001-mk_cfgrpt.sh-strip-prefixes.patch \
            file://0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch \
            file://0001-src-lib-log-logger_level_impl.cc-add-a-missing-inclu.patch \
+           file://0001-3982-Checkpoint.patch \
+           file://0002-3982-Checkpoint-applied-proposal.patch \
+           file://0003-3982-Last-improvements.patch \
            "
 SRC_URI[sha256sum] = "09702ddb078b637e85de9236cbedd3fb9d7af7c6e797026c538b45748ad4d631"
 
-- 
2.54.0



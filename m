Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95DC9CA0EED
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 03:36:48 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.5281.1756438603467175679
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 20:36:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GmLpPwFE;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b49c1c130c9so1180532a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 20:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756438602; x=1757043402; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAPVgewRyLXppXb0SKjKPs47NNB6nKUH4ZRzHbIx+SI=;
        b=GmLpPwFE2Q8ixJrcmTBqV6uZcZU70m5kZ0CHP7lbxjb+90/m05AVV3nLmAEL10SS7L
         s2n/LPiuhbRqUS7SSXLroQrndO9Am8pTBnk0+N9XSW/d8PHH4tbAxVm/BtflVWeuUtyX
         908j/1B3a06ZC7ttxnflZt3DnkerKo5u7MYOXApKP8MiApfJONC1hao81xwsXAAnZmJg
         rdsZZNIp5QiTrRZujQNHpOhupHiuFDqKO8aIBs1yJvE+KxsJwGs0ZXd+vj2pjcoRlx0q
         CTDVQkPMSJ+wy9JDrxYVBw12Z5mW+mWyqEF+LJjDBgQNjMa1aAwldQmdq8sMG4RReAiT
         lQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756438602; x=1757043402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAPVgewRyLXppXb0SKjKPs47NNB6nKUH4ZRzHbIx+SI=;
        b=j0UUAyhtn+PiC3zsrTCvHFSYcaop8GpfMtr3JI0ptPJ111xk0xmPSZ/gy09OLkB3Pp
         8mr0D6QpFozF4lncb8lsCJgzvxhdYuKmY3L+Jf+sRyuWEfFxPaFzIW4AUGtEQitwSnTY
         Yw9pFNYJGrfLuJbjgyW+1boKSD+u3HOr3bla6eBhxcPvhY65L2iL10sGaTClL51nFU9A
         Vc1iyqQyqlU9doLl/GZ8Pmm0muXsQWNmP66FGuQhmyELJ5felpuZj/GnNK24TQdwqfml
         PUZO9Fn4z9AtCBqHfJw5TI0OdCPujk9TRjeCj7CrevnmaBTbpOdlR+PQas89K7hIY0Gq
         EYqg==
X-Gm-Message-State: AOJu0Yyat6oVvy4LpbnuO6GgGiHmFJOAYCtkoDRI4TitiKX5KA8j817/
	Y7JtroxMcrfYuQwYNk75Pu0aLHkEYptZGeh4CIaTu+CEmuwR32SK7Kjp2n8j4BjA
X-Gm-Gg: ASbGnctfQSFUFOTrPLK/VF/W6XvwH96IKc+qRgVtNjEcFismqkzNJ8AahiPSNyD2HRC
	X4taUeFWM3IArP41E3RCvead0zSMLMWrRPpix/g6CEJoppUhdeDA6KTL3aFI8iDekAiPbQZ8xSE
	TXrqaOVO6lW5Zupn+f7UwqmiEIEweXgB9uh+2QECytFV41xKSc84ZQ67TtDEn7ADhpCtkK/JVNa
	ukmgiUteoeKpE77UbzXJrpIWR5tvpCX7MZ5KjR9QvdRlLJ8vX+mQ6l3HHakDf6GCZYuAZbv425t
	156/+S80Bjq2XWtVWWWDvSH+g0PRACCJWGysXKWPXGoWbJbvLCWmh2i8DF6dQUufTg7xw93fkE1
	hhgRHiTduHM89q+Eqd2qO2XUnsDIHgjk1G0wqrtJJyvohb9iM/l98GNIKsF/bF0Ky/KUADZKcmy
	mHZZ6tXK/jI1JVmiVJOIjRbGmm+6yjCUe6vPlFbra/vk0VfMsX4mo=
X-Google-Smtp-Source: AGHT+IFMVJn52Jo+mZDvcaSdX8HjgX/+gBktBT3A2asDhh9zGnh7SsibfUhOiuadu39Vo00OSjUq2Q==
X-Received: by 2002:a05:6a20:7d9d:b0:243:755:58b0 with SMTP id adf61e73a8af0-24340d44410mr39478755637.49.1756438602297;
        Thu, 28 Aug 2025 20:36:42 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::cfd6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26abbbsm923763b3a.5.2025.08.28.20.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 20:36:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 3/3] kea: Upgrade to 3.0 LTS release
Date: Thu, 28 Aug 2025 20:36:34 -0700
Message-ID: <20250829033635.115107-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250829033635.115107-1-raj.khem@gmail.com>
References: <20250829033635.115107-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 03:36:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222598

* Drop backported patch and refresh remaining
* Add fixes to build with boost 1.89.0
* Switch to meson build system

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: same as v1 as no v1 was submitted

 .../files/0001-build-boost-1.89.0-fixes.patch |  53 ++++++++
 ...ake-kea-environment-available-to-lfc.patch |  96 --------------
 ...se-a-runtime-safe-interpreter-string.patch | 121 ++++++++++++++++++
 .../0001-mk_cfgrpt.sh-strip-prefixes.patch    |  54 ++++++++
 ...er_unittest_support.cc-do-not-write-.patch |   4 +-
 .../kea/files/fix-multilib-conflict.patch     |  16 +--
 .../kea/files/fix_pid_keactrl.patch           |  11 +-
 .../kea/{kea_2.6.4.bb => kea_3.0.1.bb}        |  34 +++--
 8 files changed, 259 insertions(+), 130 deletions(-)
 create mode 100644 meta/recipes-connectivity/kea/files/0001-build-boost-1.89.0-fixes.patch
 delete mode 100644 meta/recipes-connectivity/kea/files/0001-make-kea-environment-available-to-lfc.patch
 create mode 100644 meta/recipes-connectivity/kea/files/0001-meson-use-a-runtime-safe-interpreter-string.patch
 create mode 100644 meta/recipes-connectivity/kea/files/0001-mk_cfgrpt.sh-strip-prefixes.patch
 rename meta/recipes-connectivity/kea/{kea_2.6.4.bb => kea_3.0.1.bb} (67%)

diff --git a/meta/recipes-connectivity/kea/files/0001-build-boost-1.89.0-fixes.patch b/meta/recipes-connectivity/kea/files/0001-build-boost-1.89.0-fixes.patch
new file mode 100644
index 00000000000..fba2f5a5732
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/0001-build-boost-1.89.0-fixes.patch
@@ -0,0 +1,53 @@
+From cf6af9219ba688fcd01d73a392dd1306d2b7a9e6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 27 Aug 2025 22:20:09 -0700
+Subject: [PATCH] build: boost 1.89.0 fixes
+
+Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/merge_requests/2771/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ meson.build                        | 2 +-
+ src/lib/asiodns/io_fetch.cc        | 1 +
+ src/lib/asiolink/interval_timer.cc | 1 +
+ 3 files changed, 3 insertions(+), 1 deletion(-)
+
+--- a/meson.build
++++ b/meson.build
+@@ -189,7 +189,7 @@ message(f'Detected system "@SYSTEM@".')
+ 
+ #### Dependencies
+ 
+-boost_dep = dependency('boost', version: '>=1.66', modules: ['system'])
++boost_dep = dependency('boost', version: '>=1.66')
+ dl_dep = dependency('dl')
+ threads_dep = dependency('threads')
+ add_project_dependencies(boost_dep, dl_dep, threads_dep, language: ['cpp'])
+@@ -1094,7 +1094,7 @@ pkg.generate(
+ if TARGETS_GEN_MESSAGES.length() > 0
+     alias_target('messages', TARGETS_GEN_MESSAGES)
+ else
+-    error(
++    warning(
+         'No messages to generate. This is probably an error in the meson.build files.',
+     )
+ endif
+--- a/src/lib/asiodns/io_fetch.cc
++++ b/src/lib/asiodns/io_fetch.cc
+@@ -22,6 +22,7 @@
+ #include <dns/rcode.h>
+ #include <util/io.h>
+ 
++#include <boost/asio/deadline_timer.hpp>
+ #include <boost/scoped_ptr.hpp>
+ #include <boost/date_time/posix_time/posix_time_types.hpp>
+ 
+--- a/src/lib/asiolink/interval_timer.cc
++++ b/src/lib/asiolink/interval_timer.cc
+@@ -9,6 +9,7 @@
+ #include <asiolink/interval_timer.h>
+ #include <asiolink/io_service.h>
+ 
++#include <boost/asio/deadline_timer.hpp>
+ #include <boost/enable_shared_from_this.hpp>
+ #include <boost/noncopyable.hpp>
+ #include <boost/shared_ptr.hpp>
diff --git a/meta/recipes-connectivity/kea/files/0001-make-kea-environment-available-to-lfc.patch b/meta/recipes-connectivity/kea/files/0001-make-kea-environment-available-to-lfc.patch
deleted file mode 100644
index 15c09d4c411..00000000000
--- a/meta/recipes-connectivity/kea/files/0001-make-kea-environment-available-to-lfc.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From 72d7e6c0b6b5af4fea2e4db9ed33757984ccdc5b Mon Sep 17 00:00:00 2001
-From: Razvan Becheriu <razvan@isc.org>
-Date: Fri, 14 Jun 2024 17:09:50 +0300
-Subject: [PATCH] make kea environment available to lfc
-
-Upstream-Status: Backport
-[https://gitlab.isc.org/isc-projects/kea/-/commit/f477e8ebcc8b8e1f1adaad4d55031084c0ff6f40]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- configure.ac                                  |  2 ++
- src/lib/dhcpsrv/memfile_lease_mgr.cc          |  3 ++-
- .../tests/memfile_lease_mgr_unittest.cc       | 26 +++++++++++++++++++
- src/lib/dhcpsrv/tests/test_kea_lfc_env.sh.in  |  6 +++++
- 4 files changed, 36 insertions(+), 1 deletion(-)
- create mode 100644 src/lib/dhcpsrv/tests/test_kea_lfc_env.sh.in
-
-diff --git a/configure.ac b/configure.ac
-index c00edb5..7b572b0 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1629,6 +1629,8 @@ AC_CONFIG_FILES([src/lib/dhcp_ddns/tests/Makefile])
- AC_CONFIG_FILES([src/lib/dhcpsrv/Makefile])
- AC_CONFIG_FILES([src/lib/dhcpsrv/tests/Makefile])
- AC_CONFIG_FILES([src/lib/dhcpsrv/tests/test_libraries.h])
-+AC_CONFIG_FILES([src/lib/dhcpsrv/tests/test_kea_lfc_env.sh],
-+                [chmod +x src/lib/dhcpsrv/tests/test_kea_lfc_env.sh])
- AC_CONFIG_FILES([src/lib/dhcpsrv/testutils/Makefile])
- AC_CONFIG_FILES([src/lib/dns/Makefile])
- AC_CONFIG_FILES([src/lib/dns/tests/Makefile])
-diff --git a/src/lib/dhcpsrv/memfile_lease_mgr.cc b/src/lib/dhcpsrv/memfile_lease_mgr.cc
-index db4f5d5..0ecf3e7 100644
---- a/src/lib/dhcpsrv/memfile_lease_mgr.cc
-+++ b/src/lib/dhcpsrv/memfile_lease_mgr.cc
-@@ -209,7 +209,8 @@ LFCSetup::setup(const uint32_t lfc_interval,
-     args.push_back("ignored-path");
- 
-     // Create the process (do not start it yet).
--    process_.reset(new ProcessSpawn(ProcessSpawn::ASYNC, executable, args));
-+    process_.reset(new ProcessSpawn(ProcessSpawn::ASYNC, executable, args,
-+                                    ProcessEnvVars(), true));
- 
-     // If we've been told to run it once now, invoke the callback directly.
-     if (run_once_now) {
-diff --git a/src/lib/dhcpsrv/tests/memfile_lease_mgr_unittest.cc b/src/lib/dhcpsrv/tests/memfile_lease_mgr_unittest.cc
-index 034f1f5..9edf637 100644
---- a/src/lib/dhcpsrv/tests/memfile_lease_mgr_unittest.cc
-+++ b/src/lib/dhcpsrv/tests/memfile_lease_mgr_unittest.cc
-@@ -534,6 +534,32 @@ TEST_F(MemfileLeaseMgrTest, lfcTimer) {
-     EXPECT_EQ(2, lease_mgr->getLFCCount());
- }
- 
-+/// @brief Check that the kea environment is accesible to the Lease
-+/// File Cleanup process.
-+TEST_F(MemfileLeaseMgrTest, lfcEnv) {
-+    DatabaseConnection::ParameterMap pmap;
-+    pmap["type"] = "memfile";
-+    pmap["universe"] = "4";
-+    pmap["name"] = getLeaseFilePath("leasefile4_0.csv");
-+    pmap["lfc-interval"] = "1";
-+
-+    std::ostringstream s;
-+    s << DHCP_DATA_DIR << "/test_kea_lfc_env.sh";
-+    setenv("KEA_LFC_EXECUTABLE", s.str().c_str(), 1);
-+
-+    boost::scoped_ptr<NakedMemfileLeaseMgr> lease_mgr(new NakedMemfileLeaseMgr(pmap));
-+
-+    // Try to run the lease file cleanup.
-+    ASSERT_NO_THROW(lease_mgr->lfcCallback());
-+
-+    // Wait for the LFC process to complete.
-+    ASSERT_TRUE(waitForProcess(*lease_mgr, 1));
-+
-+    // And make sure it has returned an exit status of 0.
-+    EXPECT_EQ(0, lease_mgr->getLFCExitStatus())
-+        << "environment not available to LFC";
-+}
-+
- /// @brief This test checks if the LFC timer is disabled (doesn't trigger)
- /// cleanups when the lfc-interval is set to 0.
- TEST_F(MemfileLeaseMgrTest, lfcTimerDisabled) {
-diff --git a/src/lib/dhcpsrv/tests/test_kea_lfc_env.sh.in b/src/lib/dhcpsrv/tests/test_kea_lfc_env.sh.in
-new file mode 100644
-index 0000000..3eb71d5
---- /dev/null
-+++ b/src/lib/dhcpsrv/tests/test_kea_lfc_env.sh.in
-@@ -0,0 +1,6 @@
-+#!/bin/sh
-+
-+if [ $(env | grep -c KEA_LFC_EXECUTABLE) != 0 ]; then
-+    exit 0
-+fi
-+exit 1
--- 
-2.25.1
-
diff --git a/meta/recipes-connectivity/kea/files/0001-meson-use-a-runtime-safe-interpreter-string.patch b/meta/recipes-connectivity/kea/files/0001-meson-use-a-runtime-safe-interpreter-string.patch
new file mode 100644
index 00000000000..819b23a7081
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/0001-meson-use-a-runtime-safe-interpreter-string.patch
@@ -0,0 +1,121 @@
+From 5ec5e08edc059ed0c0d430dc8e02cd64bebc8d1c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 28 Aug 2025 17:02:49 -0700
+Subject: [PATCH] meson: use a runtime-safe interpreter string
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+In cross builds, python.find_installation() (what
+PYTHON usually comes from) must be a native
+interpreter (since Meson runs it during configure),
+but you don’t want that absolute native path baked
+into target files. You want a runtime/target path
+such as /usr/bin/env python3 (portable) or
+/usr/bin/python3
+
+Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/issues/4087]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ doc/sphinx/meson.build          | 8 +++++++-
+ meson.build                     | 8 +++++++-
+ src/bin/shell/tests/meson.build | 8 +++++++-
+ src/lib/util/python/meson.build | 8 +++++++-
+ 4 files changed, 28 insertions(+), 4 deletions(-)
+
+--- a/doc/sphinx/meson.build
++++ b/doc/sphinx/meson.build
+@@ -70,7 +70,13 @@ doc_conf.set('builddir', meson.current_b
+ doc_conf.set('srcdir', meson.current_source_dir())
+ doc_conf.set('sphinxbuilddir', sphinxbuilddir)
+ doc_conf.set('abs_sphinxbuilddir', abs_sphinxbuilddir)
+-doc_conf.set('PYTHON', PYTHON.full_path())
++# During cross builds, avoid embedding the native Python path into target artifacts.
++# Use a runtime-safe interpreter path for the target.
++py_for_runtime = '/usr/bin/env python3'
++if not meson.is_cross_build()
++  py_for_runtime = PYTHON.full_path()
++endif
++doc_conf.set('PYTHON', py_for_runtime)
+ doc_conf.set('TOP_SOURCE_DIR', TOP_SOURCE_DIR)
+ if PDFLATEX.found()
+     doc_conf.set('HAVE_PDFLATEX', 'yes')
+--- a/meson.build
++++ b/meson.build
+@@ -638,8 +638,11 @@ link_args = []
+ # Also, Meson might use it by default, but might not use it on all systems, so lots of variables...
+ # EXECUTABLE_RPATH = f'$ORIGIN/../@LIBDIR@'
+ # HOOK_RPATH = '$ORIGIN/../..'
+-
++if not meson.is_cross_build()
+ BUILD_RPATH = TOP_BUILD_DIR / 'src/lib'
++else
++BUILD_RPATH = ''
++endif
+ INSTALL_RPATH = LIBDIR_INSTALLED
+ 
+ # Add rpaths for NETCONF dependencies.
+@@ -759,7 +762,13 @@ report_conf_data.set('CXX_ARGS', ' '.joi
+ report_conf_data.set('LD_ID', cpp.get_linker_id())
+ link_args += get_option('cpp_link_args')
+ report_conf_data.set('LD_ARGS', ' '.join(link_args))
+-report_conf_data.set('PYTHON_PATH', PYTHON.full_path())
++# During cross builds, avoid embedding the native Python path into target artifacts.
++# Use a runtime-safe interpreter path for the target.
++py_for_runtime = '/usr/bin/env python3'
++if not meson.is_cross_build()
++  py_for_runtime = PYTHON.full_path()
++endif
++report_conf_data.set('PYTHON_PATH', py_for_runtime)
+ report_conf_data.set('PYTHON_VERSION', PYTHON.version())
+ report_conf_data.set('PKGPYTHONDIR', PKGPYTHONDIR)
+ result = cpp.run(
+--- a/src/bin/shell/tests/meson.build
++++ b/src/bin/shell/tests/meson.build
+@@ -3,7 +3,13 @@ if not TESTS_OPT.enabled()
+ endif
+ 
+ shell_tests_conf_data = configuration_data()
+-shell_tests_conf_data.set('PYTHON', PYTHON.full_path())
++# During cross builds, avoid embedding the native Python path into target artifacts.
++# Use a runtime-safe interpreter path for the target.
++py_for_runtime = '/usr/bin/env python3'
++if not meson.is_cross_build()
++  py_for_runtime = PYTHON.full_path()
++endif
++shell_tests_conf_data.set('PYTHON', py_for_runtime)
+ shell_tests_conf_data.set('abs_top_builddir', TOP_BUILD_DIR)
+ shell_tests_conf_data.set('abs_top_srcdir', TOP_SOURCE_DIR)
+ shell_unittest = configure_file(
+--- a/src/lib/util/python/meson.build
++++ b/src/lib/util/python/meson.build
+@@ -4,7 +4,13 @@ endif
+ 
+ configure_file(input: 'const2hdr.py', output: 'const2hdr.py', copy: true)
+ util_python_conf_data = configuration_data()
+-util_python_conf_data.set('PYTHON', PYTHON.full_path())
++# During cross builds, avoid embedding the native Python path into target artifacts.
++# Use a runtime-safe interpreter path for the target.
++py_for_runtime = '/usr/bin/env python3'
++if not meson.is_cross_build()
++  py_for_runtime = PYTHON.full_path()
++endif
++util_python_conf_data.set('PYTHON', py_for_runtime)
+ configure_file(
+     input: 'gen_wiredata.py.in',
+     output: 'gen_wiredata.py',
+--- a/src/bin/shell/meson.build
++++ b/src/bin/shell/meson.build
+@@ -1,5 +1,11 @@
+ kea_shell_conf_data = configuration_data()
+-kea_shell_conf_data.set('PYTHON', PYTHON.full_path())
++# During cross builds, avoid embedding the native Python path into target artifacts.
++# Use a runtime-safe interpreter path for the target.
++py_for_runtime = '/usr/bin/env python3'
++if not meson.is_cross_build()
++  py_for_runtime = PYTHON.full_path()
++endif
++kea_shell_conf_data.set('PYTHON', py_for_runtime)
+ kea_shell_conf_data.set('PACKAGE_VERSION', PROJECT_VERSION)
+ kea_shell_conf_data.set(
+     'EXTENDED_VERSION',
diff --git a/meta/recipes-connectivity/kea/files/0001-mk_cfgrpt.sh-strip-prefixes.patch b/meta/recipes-connectivity/kea/files/0001-mk_cfgrpt.sh-strip-prefixes.patch
new file mode 100644
index 00000000000..521fac46297
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/0001-mk_cfgrpt.sh-strip-prefixes.patch
@@ -0,0 +1,54 @@
+From c8a1f0b9c17c8485bdeac045e5afdcd4467c1c14 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 28 Aug 2025 17:31:39 -0700
+Subject: [PATCH] mk_cfgrpt.sh: strip prefixes
+
+Add support for a STRIP_PREFIXES env var (colon-separated list).
+The script will pipe its output through sed to remove any of those prefixes.
+
+Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/issues/4087]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tools/mk_cfgrpt.sh | 22 +++++++++++++++++++++-
+ 1 file changed, 21 insertions(+), 1 deletion(-)
+
+diff --git a/tools/mk_cfgrpt.sh b/tools/mk_cfgrpt.sh
+index bc0cc41..8f41ce1 100755
+--- a/tools/mk_cfgrpt.sh
++++ b/tools/mk_cfgrpt.sh
+@@ -43,6 +43,26 @@ then
+     exit 2
+ fi
+ 
++# Optional: strip absolute path prefixes from generated output to make
++# cross-builds reproducible (e.g. Yocto sysroot/work dirs).
++# Provide colon-separated prefixes via STRIP_PREFIXES.
++strip_paths() {
++    if [ -z "${STRIP_PREFIXES:-}" ]; then
++        cat
++        return
++    fi
++    # Build a sed script that removes each prefix wherever it appears.
++    SED_SCRIPT=
++    IFS=':'; for p in $STRIP_PREFIXES; do
++        [ -n "$p" ] || continue
++        # Escape forward slashes
++        ep=$(printf '%s' "$p" | sed 's,/,\\/,g')
++        SED_SCRIPT="${SED_SCRIPT}s/${ep}//g;"
++    done
++    IFS=' '
++    sed -e "$SED_SCRIPT"
++}
++
+ # Header
+ cat >> "${dest}" << END
+ // config_report.cc. Generated from config.report by tools/mk_cfgrpt.sh
+@@ -55,7 +75,7 @@ END
+ 
+ # Body: escape '\'s and '"'s, preprend '    ";;;; ' and append '",'
+ sed -e 's/\\/\\\\/g' -e 's/"/\\"/g' -e 's/^/    ";;;; /' -e 's/$/",/' \
+-    < "${report_file}" >> "${dest}"
++    < "${report_file}" | strip_paths >> "${dest}"
+ 
+ # Trailer
+ cat >> "${dest}" <<END
diff --git a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
index 94fbd127378..1ab09e39a26 100644
--- a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
+++ b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
@@ -13,11 +13,9 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  src/lib/log/logger_unittest_support.cc | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/src/lib/log/logger_unittest_support.cc b/src/lib/log/logger_unittest_support.cc
-index fc01c6e..f46d17e 100644
 --- a/src/lib/log/logger_unittest_support.cc
 +++ b/src/lib/log/logger_unittest_support.cc
-@@ -84,7 +84,7 @@ void initLogger(isc::log::Severity severity, int dbglevel) {
+@@ -84,7 +84,7 @@ void initLogger(isc::log::Severity sever
      const char* localfile = getenv("KEA_LOGGER_LOCALMSG");
  
      // Set a directory for creating lockfiles when running tests
diff --git a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
index 763639327a3..9e1f28b5603 100644
--- a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
+++ b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
@@ -24,11 +24,9 @@ Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
  src/bin/keactrl/kea-dhcp6.conf.pre      | 4 ++--
  3 files changed, 6 insertions(+), 5 deletions(-)
 
-diff --git a/src/bin/keactrl/kea-ctrl-agent.conf.pre b/src/bin/keactrl/kea-ctrl-agent.conf.pre
-index e6ae8b8..50a3092 100644
 --- a/src/bin/keactrl/kea-ctrl-agent.conf.pre
 +++ b/src/bin/keactrl/kea-ctrl-agent.conf.pre
-@@ -51,7 +51,8 @@
+@@ -85,7 +85,8 @@
      // Agent will fail to start.
      "hooks-libraries": [
  //  {
@@ -38,8 +36,6 @@ index e6ae8b8..50a3092 100644
  //      "parameters": {
  //          "param1": "foo"
  //      }
-diff --git a/src/bin/keactrl/kea-dhcp4.conf.pre b/src/bin/keactrl/kea-dhcp4.conf.pre
-index 6edb8a1..b2a7385 100644
 --- a/src/bin/keactrl/kea-dhcp4.conf.pre
 +++ b/src/bin/keactrl/kea-dhcp4.conf.pre
 @@ -255,7 +255,7 @@
@@ -49,9 +45,9 @@ index 6edb8a1..b2a7385 100644
 -    //       "library": "@libdir@/kea/hooks/libdhcp_legal_log.so",
 +    //       "library": "$libdir/kea/hooks/libdhcp_legal_log.so",
      //       "parameters": {
-     //           "path": "/var/lib/kea",
      //           "base-name": "kea-forensic4"
-@@ -272,7 +272,7 @@
+     //       }
+@@ -271,7 +271,7 @@
      //       // of specific options or perhaps even a combination of several
      //       // options and fields to uniquely identify a client. Those scenarios
      //       // are addressed by the Flexible Identifiers hook application.
@@ -60,8 +56,6 @@ index 6edb8a1..b2a7385 100644
      //       "parameters": {
      //           "identifier-expression": "relay4[2].hex"
      //       }
-diff --git a/src/bin/keactrl/kea-dhcp6.conf.pre b/src/bin/keactrl/kea-dhcp6.conf.pre
-index 271021b..5b85854 100644
 --- a/src/bin/keactrl/kea-dhcp6.conf.pre
 +++ b/src/bin/keactrl/kea-dhcp6.conf.pre
 @@ -201,7 +201,7 @@
@@ -71,9 +65,9 @@ index 271021b..5b85854 100644
 -    //       "library": "@libdir@/kea/hooks/libdhcp_legal_log.so",
 +    //       "library": "$libdir/kea/hooks/libdhcp_legal_log.so",
      //       "parameters": {
-     //           "path": "/var/lib/kea",
      //           "base-name": "kea-forensic6"
-@@ -218,7 +218,7 @@
+     //       }
+@@ -217,7 +217,7 @@
      //       // of specific options or perhaps even a combination of several
      //       // options and fields to uniquely identify a client. Those scenarios
      //       // are addressed by the Flexible Identifiers hook application.
diff --git a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
index 2f5a217d3fb..9cc91bdddf1 100644
--- a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
+++ b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
@@ -15,21 +15,16 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  src/bin/keactrl/keactrl.in | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/src/bin/keactrl/keactrl.in b/src/bin/keactrl/keactrl.in
-index cccfdac303..20ae2e6ec5 100644
 --- a/src/bin/keactrl/keactrl.in
 +++ b/src/bin/keactrl/keactrl.in
-@@ -146,8 +146,8 @@ check_running() {
+@@ -157,8 +157,8 @@ check_running() {
      # Get the PID from the PID file (if it exists)
      get_pid_from_file "${proc_name}"
-     if [ ${_pid} -gt 0 ]; then
+     if [ "${_pid}" -gt 0 ]; then
 -        # Use ps to check if PID is alive
--        if ps -p ${_pid} 1>/dev/null; then
+-        if ps -p "${_pid}" 1>/dev/null; then
 +        # Use pgrep and grep to check if PID is alive
 +        if pgrep -v 1 | grep ${_pid} 1>/dev/null; then
              # No error, so PID IS ALIVE
              _running=1
          fi
--- 
-2.39.2
-
diff --git a/meta/recipes-connectivity/kea/kea_2.6.4.bb b/meta/recipes-connectivity/kea/kea_3.0.1.bb
similarity index 67%
rename from meta/recipes-connectivity/kea/kea_2.6.4.bb
rename to meta/recipes-connectivity/kea/kea_3.0.1.bb
index aa725ee4374..dfa42dbadb2 100644
--- a/meta/recipes-connectivity/kea/kea_2.6.4.bb
+++ b/meta/recipes-connectivity/kea/kea_3.0.1.bb
@@ -3,11 +3,11 @@ DESCRIPTION = "Kea is the next generation of DHCP software developed by ISC. It
 HOMEPAGE = "http://kea.isc.org"
 SECTION = "connectivity"
 LICENSE = "MPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ee16e7280a6cf2a1487717faf33190dc"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fb634ed1d923b8b8fd1ed7ffc9b70ae4"
 
 DEPENDS = "boost log4cplus openssl"
 
-SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
+SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.xz \
            file://kea-dhcp4.service \
            file://kea-dhcp6.service \
            file://kea-dhcp-ddns.service \
@@ -17,11 +17,15 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://fix-multilib-conflict.patch \
            file://fix_pid_keactrl.patch \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
-           file://0001-make-kea-environment-available-to-lfc.patch \
+           file://0001-build-boost-1.89.0-fixes.patch \
+           file://0001-meson-use-a-runtime-safe-interpreter-string.patch \
+           file://0001-mk_cfgrpt.sh-strip-prefixes.patch \
            "
-SRC_URI[sha256sum] = "6806405e4d559abc10febd2c273dc6e2bc6ac42767afa5ca20b118ffba84a671"
+SRC_URI[sha256sum] = "ec84fec4bb7f6b9d15a82e755a571e9348eb4d6fbc62bb3f6f1296cd7a24c566"
 
-inherit autotools systemd update-rc.d upstream-version-is-even
+inherit meson pkgconfig systemd update-rc.d upstream-version-is-even
+
+EXTRA_OECONF += "-Dcrypto=openssl -Drunstatedir=${runtimedir} -Dkrb5=disabled -Dnetconf=disabled"
 
 INITSCRIPT_NAME = "kea-dhcp4-server"
 INITSCRIPT_PARAMS = "defaults 30"
@@ -40,20 +44,18 @@ BUILD_OPTIMIZATION:remove:mipsel = " -Og"
 BUILD_OPTIMIZATION:append:mipsel = " -O"
 
 CXXFLAGS:remove = "-fvisibility-inlines-hidden"
-EXTRA_OECONF = "--with-boost-libs=-lboost_system \
-                --with-log4cplus=${STAGING_DIR_TARGET}${prefix} \
-                --with-openssl=${STAGING_DIR_TARGET}${prefix}"
 
 do_configure:prepend() {
     # replace abs_top_builddir to avoid introducing the build path
     # don't expand the abs_top_builddir on the target as the abs_top_builddir is meanlingless on the target
     find ${S} -type f -name *.sh.in | xargs sed -i  "s:@abs_top_builddir@:@abs_top_builddir_placeholder@:g"
     sed -i "s:@abs_top_builddir@:@abs_top_builddir_placeholder@:g" ${S}/src/bin/admin/kea-admin.in
+    export STRIP_PREFIXES="${RECIPE_SYSROOT_NATIVE}:${RECIPE_SYSROOT}:${WORKDIR}:${B}"
 }
 
 # patch out build host paths for reproducibility
 do_compile:prepend:class-target() {
-        sed -i -e "s,${WORKDIR},,g" ${B}/config.report
+    sed -i -e "s,${WORKDIR},,g" ${B}/config.report
 }
 
 do_install:append() {
@@ -65,7 +67,13 @@ do_install:append() {
     sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@BASE_BINDIR@,${base_bindir},g' \
            -e 's,@LOCALSTATEDIR@,${localstatedir},g' -e 's,@SYSCONFDIR@,${sysconfdir},g' \
            ${D}${systemd_system_unitdir}/kea-dhcp*service ${D}${sbindir}/keactrl
-    sed -i "s:${B}:@abs_top_builddir_placeholder@:g" ${D}${sbindir}/kea-admin
+    sed -i -e "s:${B}:@abs_top_builddir_placeholder@:g" \
+           -e "s:${S}:@abs_top_srcdir_placeholder@:g" \
+           ${D}${sbindir}/kea-admin
+    sed -i -e 's,${RECIPE_SYSROOT},,g' -e 's,${RECIPE_SYSROOT_NATIVE},,g' \
+           -e 's,${UNINATIVE_STAGING_DIR}-uninative/${BUILD_ARCH}-linux/lib,,g' \
+           -e 's,${WORKDIR},,g' \
+           ${D}${datadir}/${BPN}/meson-info/*.json
 }
 
 do_install:append() {
@@ -74,7 +82,9 @@ do_install:append() {
 
 CONFFILES:${PN} = "${sysconfdir}/kea/keactrl.conf"
 
+PACKAGES =+ "${PN}-python"
+FILES:${PN}-python = "${libdir}/python*/site-packages/*"
+RDEPENDS:${PN}-python = "python3"
+
 FILES:${PN}-staticdev += "${libdir}/kea/hooks/*.a ${libdir}/hooks/*.a"
 FILES:${PN} += "${libdir}/hooks/*.so"
-
-PARALLEL_MAKEINST = ""


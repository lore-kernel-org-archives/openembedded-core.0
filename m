Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF52E69189
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:15 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87785.1766434086795371655
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jDXmXgS4;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so607059266b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434085; x=1767038885; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzmNYStzKbZF7GHmqLfkelKdGY21uSdGmEEi1s/RB7Y=;
        b=jDXmXgS47UoVXM4bB1f2xuM7E6+uBpbI7QPQ1XUJl9/UsObM8fSYpNffNX9Cf3Vi1z
         2Vzv6pwj4fPTCvTdhzJPOZihD7J8S3FUKAb+YXs2fnBgvlQdyMxDmrb7Hux7woWqXGSS
         XJce3kWKpXD6Z2YV7xXPPbG1W6tmQJGHzyo7J+NCbRvQr51riX3PdAGUN3BXV17WT4bC
         KItawEXiwlVXscFXHQREJEMNsJiCsb5lOSVKlLDgEoUYYKGnu0f75LyCK5/21nHq+vpr
         wT2pW8dyVf63vOp73CMRbyxOm5okWCC6SYEoWChwUf+BOYQzBM6k4n+MrsJh6q6K4C5o
         GhWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434085; x=1767038885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TzmNYStzKbZF7GHmqLfkelKdGY21uSdGmEEi1s/RB7Y=;
        b=xJQDp0FNmtJO6E6Np29s1mmyh5vadS/+x78EALT7M5GAXVT6PhYSRn99gFU35+i9ju
         J+mI3jWbutOaQQlHlPcgkucDl4pW240026ueIguS0BjAtKLoD4Mxkm4gJ1uwoUMoiJbK
         lijY4jBDxkLZgzqsWn7sZa5nJrWEnr6yPE+YQLVifPmYKjUgA086tqzHRJgdnkcZCxfd
         vyk+HpJ7sHiUqiyBnbg9hELU4o2FDb7D/wuBFFY6Jw/L+uSQqGcbG7p4Y9j2uSqwDpfh
         DiwsK/d7YMe4xh2r7ABfkqhuvMx15mBgX4CCZ5FbAbZ2X6PeJQWw5jMZpH/SO6cQBbOz
         PM9A==
X-Gm-Message-State: AOJu0YwsgP5soycw71qCkjjLlZieX3PS4Ho0A8ZNolKWTpG0/Brautbz
	jxf1iXIWBcA4o8UNjPVUOBqh63zHY2dhvsF2WuvZq8dmwWPeNi7BzEVYvyaF+A==
X-Gm-Gg: AY/fxX6hHg3lsnsNGNVtSrFUf/8sLJlOOFH0uCkIXZTHbknsJwW0cVHHQWPIUQV1aaq
	T1yCyyJrbG99cTvyMbqbMsXmSfb30lNFSFFH1OqcVEQO6zCEPSiPvd51O7B32q/pmfRBxTmwyem
	vfsUfw4oUyggkp1maGqlftldbd6siAP8ggGLL60DSKD2dcJ8cMQFS8IB7zJRTC6c3/BQ6OoOVPe
	sMSaqKrqtjuuWMQ0Ev5Qzw7ZIBLrHPN1IY18E7LDfV5rAN1Mh2wNeamEUVc+jpb06aPHaBtl9/7
	CzGsfogxaWNAQh8MKHCQWf6A5Ff5XXwigvq5qN5vjksx9b2GxHL8RGU27kCSb+D/5B2yFh5EKcA
	Rvm++8poQxh9cteBnmqxWC2WnWZLbfSUmMDBuAR3+y/6adH/xsn2Pp7j/oNdGZb0FbV5KnwaJBV
	lVWU5sSQwDA4cXVoK31yWfKylY9zemVx/ykgUgDEBWrel/p1s=
X-Google-Smtp-Source: AGHT+IE3vBSs/N3WFVZ+FSmJQKIbpkrTqeG7Xvp8I6k3gmXrOySluI0B5Ntk4IGqsWH3vncW2kSA3g==
X-Received: by 2002:a17:907:3f20:b0:b73:8307:4e95 with SMTP id a640c23a62f3a-b8036ebd51cmr1324047066b.4.1766434084875;
        Mon, 22 Dec 2025 12:08:04 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 026/114] kea: upgrade 3.0.1 -> 3.0.2
Date: Mon, 22 Dec 2025 21:06:08 +0100
Message-ID: <20251222200739.2278706-26-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228351

From: Alexander Kanavin <alex@linutronix.de>

Drop CVE backport, add a boost 1.90.0 compatibility patch.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../files/0001-build-boost-1.89.0-fixes.patch |  12 +-
 ...s-dhcpsrv-Avoid-Boost-lexical_cast-o.patch |  10 +-
 ...se-a-runtime-safe-interpreter-string.patch |  57 ++-
 .../0001-mk_cfgrpt.sh-strip-prefixes.patch    |   2 +-
 ...er_level_impl.cc-add-a-missing-inclu.patch |  24 +
 ...er_unittest_support.cc-do-not-write-.patch |   7 +-
 .../kea/files/CVE-2025-11232.patch            | 474 ------------------
 .../kea/files/fix-multilib-conflict.patch     |   8 +-
 .../kea/files/fix_pid_keactrl.patch           |   4 +-
 .../kea/{kea_3.0.1.bb => kea_3.0.2.bb}        |   4 +-
 10 files changed, 84 insertions(+), 518 deletions(-)
 create mode 100644 meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_level_impl.cc-add-a-missing-inclu.patch
 delete mode 100644 meta/recipes-connectivity/kea/files/CVE-2025-11232.patch
 rename meta/recipes-connectivity/kea/{kea_3.0.1.bb => kea_3.0.2.bb} (95%)

diff --git a/meta/recipes-connectivity/kea/files/0001-build-boost-1.89.0-fixes.patch b/meta/recipes-connectivity/kea/files/0001-build-boost-1.89.0-fixes.patch
index fba2f5a573..46a1e38eae 100644
--- a/meta/recipes-connectivity/kea/files/0001-build-boost-1.89.0-fixes.patch
+++ b/meta/recipes-connectivity/kea/files/0001-build-boost-1.89.0-fixes.patch
@@ -1,4 +1,4 @@
-From cf6af9219ba688fcd01d73a392dd1306d2b7a9e6 Mon Sep 17 00:00:00 2001
+From c7d1036c6476ddca79a6beb03604a2364d7c469e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 27 Aug 2025 22:20:09 -0700
 Subject: [PATCH] build: boost 1.89.0 fixes
@@ -6,11 +6,13 @@ Subject: [PATCH] build: boost 1.89.0 fixes
 Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/merge_requests/2771/]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- meson.build                        | 2 +-
+ meson.build                        | 4 ++--
  src/lib/asiodns/io_fetch.cc        | 1 +
  src/lib/asiolink/interval_timer.cc | 1 +
- 3 files changed, 3 insertions(+), 1 deletion(-)
+ 3 files changed, 4 insertions(+), 2 deletions(-)
 
+diff --git a/meson.build b/meson.build
+index 8ed5b2d..d5723ba 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -189,7 +189,7 @@ message(f'Detected system "@SYSTEM@".')
@@ -31,6 +33,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
          'No messages to generate. This is probably an error in the meson.build files.',
      )
  endif
+diff --git a/src/lib/asiodns/io_fetch.cc b/src/lib/asiodns/io_fetch.cc
+index c140676..94f46fa 100644
 --- a/src/lib/asiodns/io_fetch.cc
 +++ b/src/lib/asiodns/io_fetch.cc
 @@ -22,6 +22,7 @@
@@ -41,6 +45,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include <boost/scoped_ptr.hpp>
  #include <boost/date_time/posix_time/posix_time_types.hpp>
  
+diff --git a/src/lib/asiolink/interval_timer.cc b/src/lib/asiolink/interval_timer.cc
+index fa0d9e1..1410a85 100644
 --- a/src/lib/asiolink/interval_timer.cc
 +++ b/src/lib/asiolink/interval_timer.cc
 @@ -9,6 +9,7 @@
diff --git a/meta/recipes-connectivity/kea/files/0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch b/meta/recipes-connectivity/kea/files/0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch
index 6facc4d32d..7c24a3a27c 100644
--- a/meta/recipes-connectivity/kea/files/0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch
+++ b/meta/recipes-connectivity/kea/files/0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch
@@ -1,4 +1,4 @@
-From e3a0d181a279334c7d7a10c5b09fd1610384101c Mon Sep 17 00:00:00 2001
+From 4a507d1822cbfb561657ed9a8ccb0dfeced30cac Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 3 Sep 2025 12:52:51 -0700
 Subject: [PATCH] d2/dhcp[46]/radius/dhcpsrv: Avoid Boost lexical_cast on enums
@@ -295,10 +295,10 @@ index 04fe4df..cefdda8 100644
                        .arg(getCurrentServer()->toText());
  
 diff --git a/src/bin/dhcp4/dhcp4_srv.cc b/src/bin/dhcp4/dhcp4_srv.cc
-index 0701ed4..471e94c 100644
+index a6be662..1de57cd 100644
 --- a/src/bin/dhcp4/dhcp4_srv.cc
 +++ b/src/bin/dhcp4/dhcp4_srv.cc
-@@ -5101,7 +5101,7 @@ Dhcpv4Srv::d2ClientErrorHandler(const
+@@ -5116,7 +5116,7 @@ Dhcpv4Srv::d2ClientErrorHandler(const
                                  dhcp_ddns::NameChangeSender::Result result,
                                  dhcp_ddns::NameChangeRequestPtr& ncr) {
      LOG_ERROR(ddns4_logger, DHCP4_DDNS_REQUEST_SEND_FAILED).
@@ -308,10 +308,10 @@ index 0701ed4..471e94c 100644
      /// @todo We may wish to revisit this, but for now we will simply turn
      /// them off.
 diff --git a/src/bin/dhcp6/dhcp6_srv.cc b/src/bin/dhcp6/dhcp6_srv.cc
-index 417960b..818046d 100644
+index f999c31..acf19d0 100644
 --- a/src/bin/dhcp6/dhcp6_srv.cc
 +++ b/src/bin/dhcp6/dhcp6_srv.cc
-@@ -5054,7 +5054,7 @@ Dhcpv6Srv::d2ClientErrorHandler(const
+@@ -5061,7 +5061,7 @@ Dhcpv6Srv::d2ClientErrorHandler(const
                                  dhcp_ddns::NameChangeSender::Result result,
                                  dhcp_ddns::NameChangeRequestPtr& ncr) {
      LOG_ERROR(ddns6_logger, DHCP6_DDNS_REQUEST_SEND_FAILED).
diff --git a/meta/recipes-connectivity/kea/files/0001-meson-use-a-runtime-safe-interpreter-string.patch b/meta/recipes-connectivity/kea/files/0001-meson-use-a-runtime-safe-interpreter-string.patch
index 44fe82bce0..3740c4abc7 100644
--- a/meta/recipes-connectivity/kea/files/0001-meson-use-a-runtime-safe-interpreter-string.patch
+++ b/meta/recipes-connectivity/kea/files/0001-meson-use-a-runtime-safe-interpreter-string.patch
@@ -1,4 +1,4 @@
-From 5ec5e08edc059ed0c0d430dc8e02cd64bebc8d1c Mon Sep 17 00:00:00 2001
+From f7024a5e7153538072a57858e1b48bbb806167e7 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 28 Aug 2025 17:02:49 -0700
 Subject: [PATCH] meson: use a runtime-safe interpreter string
@@ -17,15 +17,18 @@ such as /usr/bin/env python3 (portable) or
 Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/issues/4087]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- doc/sphinx/meson.build          | 8 +++++++-
- meson.build                     | 8 +++++++-
- src/bin/shell/tests/meson.build | 8 +++++++-
- src/lib/util/python/meson.build | 8 +++++++-
- 4 files changed, 28 insertions(+), 4 deletions(-)
+ doc/sphinx/meson.build          |  8 +++++++-
+ meson.build                     | 14 ++++++++++++--
+ src/bin/shell/meson.build       |  8 +++++++-
+ src/bin/shell/tests/meson.build |  8 +++++++-
+ src/lib/util/python/meson.build |  8 +++++++-
+ 5 files changed, 40 insertions(+), 6 deletions(-)
 
+diff --git a/doc/sphinx/meson.build b/doc/sphinx/meson.build
+index 74ba705..71f1c7b 100644
 --- a/doc/sphinx/meson.build
 +++ b/doc/sphinx/meson.build
-@@ -70,7 +70,13 @@ doc_conf.set('builddir', meson.current_b
+@@ -70,7 +70,13 @@ doc_conf.set('builddir', meson.current_build_dir())
  doc_conf.set('srcdir', meson.current_source_dir())
  doc_conf.set('sphinxbuilddir', sphinxbuilddir)
  doc_conf.set('abs_sphinxbuilddir', abs_sphinxbuilddir)
@@ -40,6 +43,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  doc_conf.set('TOP_SOURCE_DIR', TOP_SOURCE_DIR)
  if PDFLATEX.found()
      doc_conf.set('HAVE_PDFLATEX', 'yes')
+diff --git a/meson.build b/meson.build
+index d5723ba..3bb5185 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -638,9 +638,13 @@ link_args = []
@@ -57,7 +62,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  
  # Add rpaths for NETCONF dependencies.
  if NETCONF_DEP.found()
-@@ -759,7 +763,13 @@ report_conf_data.set('CXX_ARGS', ' '.joi
+@@ -759,7 +763,13 @@ report_conf_data.set('CXX_ARGS', ' '.join(compile_args))
  report_conf_data.set('LD_ID', cpp.get_linker_id())
  link_args += get_option('cpp_link_args')
  report_conf_data.set('LD_ARGS', ' '.join(link_args))
@@ -72,6 +77,25 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  report_conf_data.set('PYTHON_VERSION', PYTHON.version())
  report_conf_data.set('PKGPYTHONDIR', PKGPYTHONDIR)
  result = cpp.run(
+diff --git a/src/bin/shell/meson.build b/src/bin/shell/meson.build
+index 273293d..846a280 100644
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
+diff --git a/src/bin/shell/tests/meson.build b/src/bin/shell/tests/meson.build
+index 18a7bc3..c5c07ad 100644
 --- a/src/bin/shell/tests/meson.build
 +++ b/src/bin/shell/tests/meson.build
 @@ -3,7 +3,13 @@ if not TESTS_OPT.enabled()
@@ -89,6 +113,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  shell_tests_conf_data.set('abs_top_builddir', TOP_BUILD_DIR)
  shell_tests_conf_data.set('abs_top_srcdir', TOP_SOURCE_DIR)
  shell_unittest = configure_file(
+diff --git a/src/lib/util/python/meson.build b/src/lib/util/python/meson.build
+index 36b4f6d..d80403a 100644
 --- a/src/lib/util/python/meson.build
 +++ b/src/lib/util/python/meson.build
 @@ -4,7 +4,13 @@ endif
@@ -106,18 +132,3 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  configure_file(
      input: 'gen_wiredata.py.in',
      output: 'gen_wiredata.py',
---- a/src/bin/shell/meson.build
-+++ b/src/bin/shell/meson.build
-@@ -1,5 +1,11 @@
- kea_shell_conf_data = configuration_data()
--kea_shell_conf_data.set('PYTHON', PYTHON.full_path())
-+# During cross builds, avoid embedding the native Python path into target artifacts.
-+# Use a runtime-safe interpreter path for the target.
-+py_for_runtime = '/usr/bin/env python3'
-+if not meson.is_cross_build()
-+  py_for_runtime = PYTHON.full_path()
-+endif
-+kea_shell_conf_data.set('PYTHON', py_for_runtime)
- kea_shell_conf_data.set('PACKAGE_VERSION', PROJECT_VERSION)
- kea_shell_conf_data.set(
-     'EXTENDED_VERSION',
diff --git a/meta/recipes-connectivity/kea/files/0001-mk_cfgrpt.sh-strip-prefixes.patch b/meta/recipes-connectivity/kea/files/0001-mk_cfgrpt.sh-strip-prefixes.patch
index 521fac4629..076de53c0a 100644
--- a/meta/recipes-connectivity/kea/files/0001-mk_cfgrpt.sh-strip-prefixes.patch
+++ b/meta/recipes-connectivity/kea/files/0001-mk_cfgrpt.sh-strip-prefixes.patch
@@ -1,4 +1,4 @@
-From c8a1f0b9c17c8485bdeac045e5afdcd4467c1c14 Mon Sep 17 00:00:00 2001
+From 920e4895c679a5bfda29e66fa199ad8e889659d0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 28 Aug 2025 17:31:39 -0700
 Subject: [PATCH] mk_cfgrpt.sh: strip prefixes
diff --git a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_level_impl.cc-add-a-missing-inclu.patch b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_level_impl.cc-add-a-missing-inclu.patch
new file mode 100644
index 0000000000..269615dbef
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_level_impl.cc-add-a-missing-inclu.patch
@@ -0,0 +1,24 @@
+From 1ad52a9bbec644e653cc67a596b811b70787c2dd Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Wed, 17 Dec 2025 12:36:24 +0100
+Subject: [PATCH] src/lib/log/logger_level_impl.cc: add a missing include to
+ address failures with boost 1.90.0
+
+Upstream-Status: Inappropriate [a different, more invasive fix is being developed upstream https://gitlab.isc.org/isc-projects/kea/-/issues/4266]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/lib/log/logger_level_impl.cc | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/lib/log/logger_level_impl.cc b/src/lib/log/logger_level_impl.cc
+index a4aba73..c2e4ee5 100644
+--- a/src/lib/log/logger_level_impl.cc
++++ b/src/lib/log/logger_level_impl.cc
+@@ -10,6 +10,7 @@
+ #include <string.h>
+ #include <iostream>
+ #include <boost/lexical_cast.hpp>
++#include <boost/static_assert.hpp>
+ 
+ #include <log4cplus/logger.h>
+ 
diff --git a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
index 1ab09e39a2..7d051705e8 100644
--- a/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
+++ b/meta/recipes-connectivity/kea/files/0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch
@@ -1,4 +1,4 @@
-From 841924e1fe8db2bff3eab8d37634ef08f86c00ec Mon Sep 17 00:00:00 2001
+From 1a0a7b9633ebc4c171b8ee6db6fcf48e8e27a4b8 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 10 Nov 2020 15:57:03 +0000
 Subject: [PATCH] src/lib/log/logger_unittest_support.cc: do not write build
@@ -8,14 +8,15 @@ This breaks reproducibility and is needed only in unit testing.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  src/lib/log/logger_unittest_support.cc | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
+diff --git a/src/lib/log/logger_unittest_support.cc b/src/lib/log/logger_unittest_support.cc
+index fc01c6e..f46d17e 100644
 --- a/src/lib/log/logger_unittest_support.cc
 +++ b/src/lib/log/logger_unittest_support.cc
-@@ -84,7 +84,7 @@ void initLogger(isc::log::Severity sever
+@@ -84,7 +84,7 @@ void initLogger(isc::log::Severity severity, int dbglevel) {
      const char* localfile = getenv("KEA_LOGGER_LOCALMSG");
  
      // Set a directory for creating lockfiles when running tests
diff --git a/meta/recipes-connectivity/kea/files/CVE-2025-11232.patch b/meta/recipes-connectivity/kea/files/CVE-2025-11232.patch
deleted file mode 100644
index 659627deba..0000000000
--- a/meta/recipes-connectivity/kea/files/CVE-2025-11232.patch
+++ /dev/null
@@ -1,474 +0,0 @@
-From 92b65b2345e07d826b56ffd65cf47538f1c7a271 Mon Sep 17 00:00:00 2001
-From: Thomas Markwalder <tmark@isc.org>
-Date: Tue, 7 Oct 2025 14:41:16 -0400
-Subject: [PATCH] [#4155] Backport #4142 to v3_0
-
-Invalid characters cause assert
-
-To trigger the issue, three configuration parameters must have
-specific settings: "hostname-char-set" must be left at the default
-setting, which is "[^A-Za-z0-9.-]"; "hostname-char-replacement" must
-be empty (the default); and "ddns-qualifying-suffix" must NOT be empty
-(the default is empty). DDNS updates do not need to be enabled for
-this issue to manifest. A client that sends certain option content
-would then cause kea-dhcp4 to exit unexpectedly.
-
-CVE: CVE-2025-11232
-Upstream-Status: Backport [https://github.com/isc-projects/kea/commit/92b65b2345e07d826b56ffd65cf47538f1c7a271]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-new file:   changelog_unreleased/CVE-2025-11232-catch-empty-sanitized-hostname
-modified:   src/bin/dhcp4/dhcp4_messages.cc
-modified:   src/bin/dhcp4/dhcp4_messages.h
-modified:   src/bin/dhcp4/dhcp4_messages.mes
-modified:   src/bin/dhcp4/dhcp4_srv.cc
-modified:   src/bin/dhcp4/tests/fqdn_unittest.cc
-modified:   src/bin/dhcp6/dhcp6_messages.cc
-modified:   src/bin/dhcp6/dhcp6_messages.h
-modified:   src/bin/dhcp6/dhcp6_messages.mes
-modified:   src/bin/dhcp6/dhcp6_srv.cc
-modified:   src/bin/dhcp6/tests/fqdn_unittest.cc
-modified:   src/lib/dhcpsrv/d2_client_mgr.cc
-modified:   src/lib/dhcpsrv/d2_client_mgr.h
-modified:   src/lib/dhcpsrv/tests/d2_client_unittest.cc
----
- ...-2025-11232-catch-empty-sanitized-hostname |  6 +++
- src/bin/dhcp4/dhcp4_messages.cc               |  4 ++
- src/bin/dhcp4/dhcp4_messages.h                |  2 +
- src/bin/dhcp4/dhcp4_messages.mes              | 14 +++++
- src/bin/dhcp4/dhcp4_srv.cc                    | 21 ++++++--
- src/bin/dhcp4/tests/fqdn_unittest.cc          | 54 ++++++++++++++++++-
- src/bin/dhcp6/dhcp6_messages.cc               |  2 +
- src/bin/dhcp6/dhcp6_messages.h                |  1 +
- src/bin/dhcp6/dhcp6_messages.mes              |  7 +++
- src/bin/dhcp6/dhcp6_srv.cc                    |  9 +++-
- src/bin/dhcp6/tests/fqdn_unittest.cc          | 23 ++++++++
- src/lib/dhcpsrv/d2_client_mgr.cc              |  9 +++-
- src/lib/dhcpsrv/d2_client_mgr.h               | 19 ++++++-
- src/lib/dhcpsrv/tests/d2_client_unittest.cc   | 42 +++++++++++++++
- 14 files changed, 205 insertions(+), 8 deletions(-)
- create mode 100644 changelog_unreleased/CVE-2025-11232-catch-empty-sanitized-hostname
-
-diff --git a/src/bin/dhcp4/dhcp4_messages.cc b/src/bin/dhcp4/dhcp4_messages.cc
-index e06ce6a121..5c6a334bad 100644
---- a/src/bin/dhcp4/dhcp4_messages.cc
-+++ b/src/bin/dhcp4/dhcp4_messages.cc
-@@ -26,9 +26,11 @@ extern const isc::log::MessageID DHCP4_CLASS_UNCONFIGURED = "DHCP4_CLASS_UNCONFI
- extern const isc::log::MessageID DHCP4_CLIENTID_IGNORED_FOR_LEASES = "DHCP4_CLIENTID_IGNORED_FOR_LEASES";
- extern const isc::log::MessageID DHCP4_CLIENT_FQDN_DATA = "DHCP4_CLIENT_FQDN_DATA";
- extern const isc::log::MessageID DHCP4_CLIENT_FQDN_PROCESS = "DHCP4_CLIENT_FQDN_PROCESS";
-+extern const isc::log::MessageID DHCP4_CLIENT_FQDN_SCRUBBED_EMPTY = "DHCP4_CLIENT_FQDN_SCRUBBED_EMPTY";
- extern const isc::log::MessageID DHCP4_CLIENT_HOSTNAME_DATA = "DHCP4_CLIENT_HOSTNAME_DATA";
- extern const isc::log::MessageID DHCP4_CLIENT_HOSTNAME_MALFORMED = "DHCP4_CLIENT_HOSTNAME_MALFORMED";
- extern const isc::log::MessageID DHCP4_CLIENT_HOSTNAME_PROCESS = "DHCP4_CLIENT_HOSTNAME_PROCESS";
-+extern const isc::log::MessageID DHCP4_CLIENT_HOSTNAME_SCRUBBED_EMPTY = "DHCP4_CLIENT_HOSTNAME_SCRUBBED_EMPTY";
- extern const isc::log::MessageID DHCP4_CLIENT_NAME_PROC_FAIL = "DHCP4_CLIENT_NAME_PROC_FAIL";
- extern const isc::log::MessageID DHCP4_CONFIG_COMPLETE = "DHCP4_CONFIG_COMPLETE";
- extern const isc::log::MessageID DHCP4_CONFIG_LOAD_FAIL = "DHCP4_CONFIG_LOAD_FAIL";
-@@ -206,9 +208,11 @@ const char* values[] = {
-     "DHCP4_CLIENTID_IGNORED_FOR_LEASES", "%1: not using client identifier for lease allocation for subnet %2",
-     "DHCP4_CLIENT_FQDN_DATA", "%1: Client sent FQDN option: %2",
-     "DHCP4_CLIENT_FQDN_PROCESS", "%1: processing Client FQDN option",
-+    "DHCP4_CLIENT_FQDN_SCRUBBED_EMPTY", "%1: sanitizing client's FQDN option '%2' yielded an empty string",
-     "DHCP4_CLIENT_HOSTNAME_DATA", "%1: client sent Hostname option: %2",
-     "DHCP4_CLIENT_HOSTNAME_MALFORMED", "%1: client hostname option malformed: %2",
-     "DHCP4_CLIENT_HOSTNAME_PROCESS", "%1: processing client's Hostname option",
-+    "DHCP4_CLIENT_HOSTNAME_SCRUBBED_EMPTY", "%1: sanitizing client's Hostname option '%2' yielded an empty string",
-     "DHCP4_CLIENT_NAME_PROC_FAIL", "%1: failed to process the fqdn or hostname sent by a client: %2",
-     "DHCP4_CONFIG_COMPLETE", "DHCPv4 server has completed configuration: %1",
-     "DHCP4_CONFIG_LOAD_FAIL", "configuration error using file: %1, reason: %2",
-diff --git a/src/bin/dhcp4/dhcp4_messages.h b/src/bin/dhcp4/dhcp4_messages.h
-index 9a4d0cda21..6e45c63053 100644
---- a/src/bin/dhcp4/dhcp4_messages.h
-+++ b/src/bin/dhcp4/dhcp4_messages.h
-@@ -27,9 +27,11 @@ extern const isc::log::MessageID DHCP4_CLASS_UNCONFIGURED;
- extern const isc::log::MessageID DHCP4_CLIENTID_IGNORED_FOR_LEASES;
- extern const isc::log::MessageID DHCP4_CLIENT_FQDN_DATA;
- extern const isc::log::MessageID DHCP4_CLIENT_FQDN_PROCESS;
-+extern const isc::log::MessageID DHCP4_CLIENT_FQDN_SCRUBBED_EMPTY;
- extern const isc::log::MessageID DHCP4_CLIENT_HOSTNAME_DATA;
- extern const isc::log::MessageID DHCP4_CLIENT_HOSTNAME_MALFORMED;
- extern const isc::log::MessageID DHCP4_CLIENT_HOSTNAME_PROCESS;
-+extern const isc::log::MessageID DHCP4_CLIENT_HOSTNAME_SCRUBBED_EMPTY;
- extern const isc::log::MessageID DHCP4_CLIENT_NAME_PROC_FAIL;
- extern const isc::log::MessageID DHCP4_CONFIG_COMPLETE;
- extern const isc::log::MessageID DHCP4_CONFIG_LOAD_FAIL;
-diff --git a/src/bin/dhcp4/dhcp4_messages.mes b/src/bin/dhcp4/dhcp4_messages.mes
-index 1deb2e6074..b359d09616 100644
---- a/src/bin/dhcp4/dhcp4_messages.mes
-+++ b/src/bin/dhcp4/dhcp4_messages.mes
-@@ -164,6 +164,20 @@ This debug message is issued when the server starts processing the Hostname
- option sent in the client's query. The argument includes the client and
- transaction identification information.
- 
-+% DHCP4_CLIENT_HOSTNAME_SCRUBBED_EMPTY %1: sanitizing client's Hostname option '%2' yielded an empty string
-+Logged at debug log level 50.
-+This debug message is issued when the result of sanitizing the
-+hostname option(12) sent by the client is an empty string. When this occurs
-+the server will ignore the hostname option. The arguments include the
-+client and the hostname option it sent.
-+
-+% DHCP4_CLIENT_FQDN_SCRUBBED_EMPTY %1: sanitizing client's FQDN option '%2' yielded an empty string
-+Logged at debug log level 50.
-+This debug message is issued when the result of sanitizing the
-+FQDN option(81) sent by the client is an empty string. When this occurs
-+the server will ignore the FQDN option. The arguments include the
-+client and the FQDN option it sent.
-+
- % DHCP4_CLIENT_NAME_PROC_FAIL %1: failed to process the fqdn or hostname sent by a client: %2
- Logged at debug log level 55.
- This debug message is issued when the DHCP server was unable to process the
-diff --git a/src/bin/dhcp4/dhcp4_srv.cc b/src/bin/dhcp4/dhcp4_srv.cc
-index 0701ed41e9..a6be662889 100644
---- a/src/bin/dhcp4/dhcp4_srv.cc
-+++ b/src/bin/dhcp4/dhcp4_srv.cc
-@@ -2714,8 +2714,15 @@ Dhcpv4Srv::processClientFqdnOption(Dhcpv4Exchange& ex) {
-     } else {
-         // Adjust the domain name based on domain name value and type sent by the
-         // client and current configuration.
--        d2_mgr.adjustDomainName<Option4ClientFqdn>(*fqdn, *fqdn_resp,
--                                                   *(ex.getContext()->getDdnsParams()));
-+        try {
-+            d2_mgr.adjustDomainName<Option4ClientFqdn>(*fqdn, *fqdn_resp,
-+                                                       *(ex.getContext()->getDdnsParams()));
-+        } catch (const FQDNScrubbedEmpty& scrubbed) {
-+            LOG_DEBUG(ddns4_logger, DBG_DHCP4_DETAIL, DHCP4_CLIENT_FQDN_SCRUBBED_EMPTY)
-+                    .arg(ex.getQuery()->getLabel())
-+                    .arg(scrubbed.what());
-+            return;
-+        }
-     }
- 
-     // Add FQDN option to the response message. Note that, there may be some
-@@ -2857,7 +2864,15 @@ Dhcpv4Srv::processHostnameOption(Dhcpv4Exchange& ex) {
-             ex.getContext()->getDdnsParams()->getHostnameSanitizer();
- 
-         if (sanitizer) {
--            hostname = sanitizer->scrub(hostname);
-+            auto tmp = sanitizer->scrub(hostname);
-+            if (tmp.empty()) {
-+                LOG_DEBUG(ddns4_logger, DBG_DHCP4_DETAIL, DHCP4_CLIENT_HOSTNAME_SCRUBBED_EMPTY)
-+                    .arg(ex.getQuery()->getLabel())
-+                    .arg(hostname);
-+                return;
-+            }
-+
-+            hostname = tmp;
-         }
- 
-         // Convert hostname to lower case.
-diff --git a/src/bin/dhcp4/tests/fqdn_unittest.cc b/src/bin/dhcp4/tests/fqdn_unittest.cc
-index a5d3e4c21a..18e4c6d4b9 100644
---- a/src/bin/dhcp4/tests/fqdn_unittest.cc
-+++ b/src/bin/dhcp4/tests/fqdn_unittest.cc
-@@ -2253,7 +2253,7 @@ TEST_F(NameDhcpv4SrvTest, sanitizeHostDefault) {
-         },
-         {
-             "qualified host name with nuls",
--            std::string("four-ok-host\000.other.org",23),
-+            std::string("four-ok-host\000.other.org", 23),
-             "four-ok-host.other.org"
-         }
-     };
-@@ -3203,4 +3203,56 @@ TEST_F(NameDhcpv4SrvTest, poolDdnsParametersTest) {
-     }
- }
- 
-+// Verifies that when the FQDN option is scrubbed empty it is logged
-+// and ignored.
-+TEST_F(NameDhcpv4SrvTest, hostnameScrubbedEmpty) {
-+    Dhcp4Client client(srv_, Dhcp4Client::SELECTING);
-+
-+    // Configure DHCP server.
-+    configure(CONFIGS[2], *client.getServer());
-+
-+    // Set the hostname option.
-+    ASSERT_NO_THROW(client.includeHostname("___"));
-+
-+    // Send the DHCPDISCOVER and make sure that the server responded.
-+    ASSERT_NO_THROW(client.doDiscover());
-+    auto resp = client.getContext().response_;
-+    ASSERT_TRUE(resp);
-+    ASSERT_EQ(DHCPOFFER, static_cast<int>(resp->getType()));
-+
-+    // Should have logged that it was scrubbed empty.
-+    std::string log = "DHCP4_CLIENT_HOSTNAME_SCRUBBED_EMPTY";
-+    EXPECT_EQ(1, countFile(log));
-+
-+    // Hostname should not be in the response.
-+    ASSERT_FALSE(resp->getOption(DHO_HOST_NAME));
-+}
-+
-+// Verifies that when the FQDN option is scrubbed empty it is logged
-+// and ignored.
-+TEST_F(NameDhcpv4SrvTest, fqdnScrubbedEmpty) {
-+    Dhcp4Client client(srv_, Dhcp4Client::SELECTING);
-+
-+    // Configure DHCP server.
-+    configure(CONFIGS[2], *client.getServer());
-+
-+    // Include the Client FQDN option.
-+    ASSERT_NO_THROW(client.includeFQDN(Option4ClientFqdn::FLAG_S | Option4ClientFqdn::FLAG_E,
-+                                       "___", Option4ClientFqdn::PARTIAL));
-+
-+    // Send the DHCPDISCOVER and make sure that the server responded.
-+    ASSERT_NO_THROW(client.doDiscover());
-+    auto resp = client.getContext().response_;
-+    ASSERT_TRUE(resp);
-+    ASSERT_EQ(DHCPOFFER, static_cast<int>(resp->getType()));
-+
-+    // Should have logged that it was scrubbed empty.
-+    std::string log = "DHCP4_CLIENT_FQDN_SCRUBBED_EMPTY";
-+    EXPECT_EQ(1, countFile(log));
-+
-+    // Hostname should not be in the response.
-+    ASSERT_FALSE(resp->getOption(DHO_FQDN));
-+}
-+
-+
- } // end of anonymous namespace
-diff --git a/src/bin/dhcp6/dhcp6_messages.cc b/src/bin/dhcp6/dhcp6_messages.cc
-index 229ba74450..9619481aba 100644
---- a/src/bin/dhcp6/dhcp6_messages.cc
-+++ b/src/bin/dhcp6/dhcp6_messages.cc
-@@ -27,6 +27,7 @@ extern const isc::log::MessageID DHCP6_CLASSES_ASSIGNED = "DHCP6_CLASSES_ASSIGNE
- extern const isc::log::MessageID DHCP6_CLASSES_ASSIGNED_AFTER_SUBNET_SELECTION = "DHCP6_CLASSES_ASSIGNED_AFTER_SUBNET_SELECTION";
- extern const isc::log::MessageID DHCP6_CLASS_ASSIGNED = "DHCP6_CLASS_ASSIGNED";
- extern const isc::log::MessageID DHCP6_CLASS_UNCONFIGURED = "DHCP6_CLASS_UNCONFIGURED";
-+extern const isc::log::MessageID DHCP6_CLIENT_FQDN_SCRUBBED_EMPTY = "DHCP6_CLIENT_FQDN_SCRUBBED_EMPTY";
- extern const isc::log::MessageID DHCP6_CONFIG_COMPLETE = "DHCP6_CONFIG_COMPLETE";
- extern const isc::log::MessageID DHCP6_CONFIG_LOAD_FAIL = "DHCP6_CONFIG_LOAD_FAIL";
- extern const isc::log::MessageID DHCP6_CONFIG_PACKET_QUEUE = "DHCP6_CONFIG_PACKET_QUEUE";
-@@ -203,6 +204,7 @@ const char* values[] = {
-     "DHCP6_CLASSES_ASSIGNED_AFTER_SUBNET_SELECTION", "%1: client packet has been assigned to the following classes: %2",
-     "DHCP6_CLASS_ASSIGNED", "%1: client packet has been assigned to the following class: %2",
-     "DHCP6_CLASS_UNCONFIGURED", "%1: client packet belongs to an unconfigured class: %2",
-+    "DHCP6_CLIENT_FQDN_SCRUBBED_EMPTY", "%1: sanitizing client's FQDN option '%2' yielded an empty string",
-     "DHCP6_CONFIG_COMPLETE", "DHCPv6 server has completed configuration: %1",
-     "DHCP6_CONFIG_LOAD_FAIL", "configuration error using file: %1, reason: %2",
-     "DHCP6_CONFIG_PACKET_QUEUE", "DHCPv6 packet queue info after configuration: %1",
-diff --git a/src/bin/dhcp6/dhcp6_messages.h b/src/bin/dhcp6/dhcp6_messages.h
-index 186f7d557a..7af56e716a 100644
---- a/src/bin/dhcp6/dhcp6_messages.h
-+++ b/src/bin/dhcp6/dhcp6_messages.h
-@@ -28,6 +28,7 @@ extern const isc::log::MessageID DHCP6_CLASSES_ASSIGNED;
- extern const isc::log::MessageID DHCP6_CLASSES_ASSIGNED_AFTER_SUBNET_SELECTION;
- extern const isc::log::MessageID DHCP6_CLASS_ASSIGNED;
- extern const isc::log::MessageID DHCP6_CLASS_UNCONFIGURED;
-+extern const isc::log::MessageID DHCP6_CLIENT_FQDN_SCRUBBED_EMPTY;
- extern const isc::log::MessageID DHCP6_CONFIG_COMPLETE;
- extern const isc::log::MessageID DHCP6_CONFIG_LOAD_FAIL;
- extern const isc::log::MessageID DHCP6_CONFIG_PACKET_QUEUE;
-diff --git a/src/bin/dhcp6/dhcp6_messages.mes b/src/bin/dhcp6/dhcp6_messages.mes
-index fff50ed367..79fc984ff5 100644
---- a/src/bin/dhcp6/dhcp6_messages.mes
-+++ b/src/bin/dhcp6/dhcp6_messages.mes
-@@ -1167,3 +1167,10 @@ such modification. The clients will remember previous server-id, and will
- use it to extend their leases. As a result, they will have to go through
- a rebinding phase to re-acquire their leases and associate them with a
- new server id.
-+
-+% DHCP6_CLIENT_FQDN_SCRUBBED_EMPTY %1: sanitizing client's FQDN option '%2' yielded an empty string
-+Logged at debug log level 50.
-+This debug message is issued when the result of sanitizing the
-+FQDN option(39) sent by the client is an empty string. When this occurs
-+the server will ignore the FQDN option. The arguments include the
-+client and the FQDN option it sent.
-diff --git a/src/bin/dhcp6/dhcp6_srv.cc b/src/bin/dhcp6/dhcp6_srv.cc
-index 417960b126..f999c3178f 100644
---- a/src/bin/dhcp6/dhcp6_srv.cc
-+++ b/src/bin/dhcp6/dhcp6_srv.cc
-@@ -2332,7 +2332,14 @@ Dhcpv6Srv::processClientFqdn(const Pkt6Ptr& question, const Pkt6Ptr& answer,
-     } else {
-         // Adjust the domain name based on domain name value and type sent by
-         // the client and current configuration.
--        d2_mgr.adjustDomainName<Option6ClientFqdn>(*fqdn, *fqdn_resp, *ddns_params);
-+        try {
-+            d2_mgr.adjustDomainName<Option6ClientFqdn>(*fqdn, *fqdn_resp, *ddns_params);
-+        } catch(const FQDNScrubbedEmpty& scrubbed) {
-+            LOG_DEBUG(ddns6_logger, DBG_DHCP6_DETAIL, DHCP6_CLIENT_FQDN_SCRUBBED_EMPTY)
-+                .arg(question->getLabel())
-+                .arg(scrubbed.what());
-+            return;
-+        }
-     }
- 
-     // Once we have the FQDN setup to use it for the lease hostname.  This
-diff --git a/src/bin/dhcp6/tests/fqdn_unittest.cc b/src/bin/dhcp6/tests/fqdn_unittest.cc
-index ca51856e67..7891c1f5e6 100644
---- a/src/bin/dhcp6/tests/fqdn_unittest.cc
-+++ b/src/bin/dhcp6/tests/fqdn_unittest.cc
-@@ -2425,4 +2425,27 @@ TEST_F(FqdnDhcpv6SrvTest, poolDdnsParametersTest) {
-     }
- }
- 
-+// Verify an FQDN with all invalid chars is ignored.
-+TEST_F(FqdnDhcpv6SrvTest, fqdnScrubbedEmpty) {
-+    // Create the query.
-+    Pkt6Ptr question = generateMessage(DHCPV6_SOLICIT, Option6ClientFqdn::FLAG_S,
-+                                       "___" , Option6ClientFqdn::FULL, true);
-+    ASSERT_TRUE(getClientFqdnOption(question));
-+    subnet_->setHostnameCharReplacement("");
-+
-+    // Create the response with an "assigned" lease.
-+    // Set the selected subnet so ddns params get returned correctly.
-+    AllocEngine::ClientContext6 ctx;
-+    ctx.subnet_ = subnet_;
-+    Pkt6Ptr answer = generateMessageWithIds(DHCPV6_ADVERTISE);
-+    addIA(1234, IOAddress("2001:db8:1::1"), answer, ctx);
-+
-+    // Process the client's FQDN.
-+    ASSERT_NO_THROW(srv_->processClientFqdn(question, answer, ctx));
-+
-+    // Should not have an FQDN option in the answer.
-+    EXPECT_FALSE(answer->getOption(D6O_CLIENT_FQDN));
-+    countFile("DHCP6_CLIENT_FQDN_SCRUBBED_EMPTY");
-+}
-+
- } // end of anonymous namespace
-diff --git a/src/lib/dhcpsrv/d2_client_mgr.cc b/src/lib/dhcpsrv/d2_client_mgr.cc
-index 84ee11d9fb..54c815176e 100644
---- a/src/lib/dhcpsrv/d2_client_mgr.cc
-+++ b/src/lib/dhcpsrv/d2_client_mgr.cc
-@@ -186,10 +186,15 @@ std::string
- D2ClientMgr::qualifyName(const std::string& partial_name,
-                          const DdnsParams& ddns_params,
-                          const bool trailing_dot) const {
-+    if (partial_name.empty()) {
-+        isc_throw(BadValue, "D2ClientMgr::qualifyName"
-+                            " - partial_name cannot be an empty string");
-+    }
-+
-     std::ostringstream gen_name;
-     gen_name << partial_name;
-     std::string suffix = ddns_params.getQualifyingSuffix();
--    if (!suffix.empty() && partial_name.back() != '.') {
-+    if (!suffix.empty() && (partial_name.back() != '.')) {
-         bool suffix_present = true;
-         std::string str = gen_name.str();
-         auto suffix_rit = suffix.rbegin();
-@@ -241,7 +246,7 @@ D2ClientMgr::qualifyName(const std::string& partial_name,
-         // If the trailing dot should not be appended but it is present,
-         // remove it.
-         if ((len > 0) && (str[len - 1] == '.')) {
--            gen_name.str(str.substr(0,len-1));
-+            gen_name.str(str.substr(0, len-1));
-         }
- 
-     }
-diff --git a/src/lib/dhcpsrv/d2_client_mgr.h b/src/lib/dhcpsrv/d2_client_mgr.h
-index 7344f19a40..238fd0a415 100644
---- a/src/lib/dhcpsrv/d2_client_mgr.h
-+++ b/src/lib/dhcpsrv/d2_client_mgr.h
-@@ -30,6 +30,14 @@
- namespace isc {
- namespace dhcp {
- 
-+/// @brief Exception thrown when host name sanitizing reduces
-+/// the domain name to an empty string.
-+class FQDNScrubbedEmpty : public Exception {
-+public:
-+    FQDNScrubbedEmpty(const char* file, size_t line, const char* what) :
-+        isc::Exception(file, line, what) { }
-+};
-+
- /// @brief Defines the type for D2 IO error handler.
- /// This callback is invoked when a send to kea-dhcp-ddns completes with a
- /// failed status.  This provides the application layer (Kea) with a means to
-@@ -197,6 +205,7 @@ class D2ClientMgr : public dhcp_ddns::NameChangeSender::RequestSendHandler,
-     /// suffix itself is empty (i.e. "").
-     ///
-     /// @return std::string containing the qualified name.
-+    /// @throw BadValue if partial_name is empty.
-     std::string qualifyName(const std::string& partial_name,
-                             const DdnsParams& ddns_params,
-                             const bool trailing_dot) const;
-@@ -264,6 +273,9 @@ class D2ClientMgr : public dhcp_ddns::NameChangeSender::RequestSendHandler,
-     /// @param ddns_params DDNS behavioral configuration parameters
-     /// @tparam T  FQDN Option class containing the FQDN data such as
-     /// dhcp::Option4ClientFqdn or dhcp::Option6ClientFqdn
-+    ///
-+    /// @throw FQDNScrubbedEmpty if hostname sanitizing reduces the input domain
-+    /// name to an empty string.
-     template <class T>
-     void adjustDomainName(const T& fqdn, T& fqdn_resp,
-                           const DdnsParams& ddns_params);
-@@ -515,7 +527,12 @@ D2ClientMgr::adjustDomainName(const T& fqdn, T& fqdn_resp, const DdnsParams& ddn
-                 ss << sanitizer->scrub(label);
-             }
- 
--            client_name = ss.str();
-+            std::string clean_name = ss.str();
-+            if (clean_name.empty() || clean_name == ".") {
-+                isc_throw(FQDNScrubbedEmpty, client_name);
-+            }
-+
-+            client_name = clean_name;
-         }
- 
-         // If the supplied name is partial, qualify it by adding the suffix.
-diff --git a/src/lib/dhcpsrv/tests/d2_client_unittest.cc b/src/lib/dhcpsrv/tests/d2_client_unittest.cc
-index 68ad2189d6..00375d0066 100644
---- a/src/lib/dhcpsrv/tests/d2_client_unittest.cc
-+++ b/src/lib/dhcpsrv/tests/d2_client_unittest.cc
-@@ -9,6 +9,7 @@
- #include <dhcp/option6_client_fqdn.h>
- #include <dhcpsrv/d2_client_mgr.h>
- #include <testutils/test_to_element.h>
-+#include <testutils/gtest_utils.h>
- #include <exceptions/exceptions.h>
- #include <util/str.h>
- 
-@@ -627,6 +628,10 @@ TEST_F(D2ClientMgrParamsTest, qualifyName) {
-     qualified_name = mgr.qualifyName(partial_name, *ddns_params_, do_not_dot);
-     EXPECT_EQ("somehost.suffix.com", qualified_name);
- 
-+    // Verify that an empty name throws.
-+    partial_name = "";
-+    ASSERT_THROW(mgr.qualifyName(partial_name, *ddns_params_, do_not_dot), BadValue);
-+
-     // Verify that an empty suffix and false flag, does not change the name
-     subnet_->setDdnsQualifyingSuffix("");
-     partial_name = "somehost";
-@@ -1257,4 +1262,41 @@ TEST_F(D2ClientMgrParamsTest, sanitizeFqdnV6) {
-     }
- }
- 
-+/// @brief Tests adjustDomainName template method with Option4ClientFqdn
-+/// when sanitizing scrubs input name empty.
-+TEST_F(D2ClientMgrParamsTest, adjustDomainNameV4ScrubbedEmpty) {
-+    D2ClientMgr mgr;
-+
-+    // Create enabled configuration
-+    subnet_->setDdnsSendUpdates(false);
-+    subnet_->setDdnsQualifyingSuffix("suffix.com");
-+    subnet_->setHostnameCharSet("[^A-Za-z0-9.-]");
-+    subnet_->setHostnameCharReplacement("");
-+
-+    Option4ClientFqdn request(0, Option4ClientFqdn::RCODE_CLIENT(),
-+                              "___", Option4ClientFqdn::FULL);
-+
-+    Option4ClientFqdn response(request);
-+    ASSERT_THROW_MSG(mgr.adjustDomainName<Option4ClientFqdn>(request, response, *ddns_params_),
-+                     FQDNScrubbedEmpty, "___.");
-+}
-+
-+/// @brief Tests adjustDomainName template method with Option4ClientFqdn
-+/// when sanitizing scrubs input name empty.
-+TEST_F(D2ClientMgrParamsTest, adjustDomainNameV6ScrubbedEmpty) {
-+    D2ClientMgr mgr;
-+
-+    // Create enabled configuration
-+    subnet_->setDdnsSendUpdates(false);
-+    subnet_->setDdnsQualifyingSuffix("suffix.com");
-+    subnet_->setHostnameCharSet("[^A-Za-z0-9.-]");
-+    subnet_->setHostnameCharReplacement("");
-+
-+    Option6ClientFqdn request(0, "___", Option6ClientFqdn::FULL);
-+
-+    Option6ClientFqdn response(request);
-+    ASSERT_THROW_MSG(mgr.adjustDomainName<Option6ClientFqdn>(request, response, *ddns_params_),
-+                     FQDNScrubbedEmpty, "___.");
-+}
-+
- } // end of anonymous namespace
diff --git a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
index 68a566773a..34ae256823 100644
--- a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
+++ b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
@@ -1,8 +1,7 @@
-From cdef313bd34c5abd897b80f25554b0c66737ed05 Mon Sep 17 00:00:00 2001
+From 00e2905dc622f98f608d253b1148a3d778131cad Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Tue, 14 Oct 2025 01:37:35 +0000
-Subject: [PATCH] There are conflict of config files between
- kea and lib32-kea:
+Subject: [PATCH] There are conflict of config files between kea and lib32-kea:
 
 | Error: Transaction test error:
 |  file /etc/kea/kea-ctrl-agent.conf conflicts between attempted installs of
@@ -99,6 +98,3 @@ index c69a508..2bb488f 100644
      //   }
      // ],
  
--- 
-2.43.0
-
diff --git a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
index 9cc91bdddf..af5a21defa 100644
--- a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
+++ b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
@@ -1,4 +1,4 @@
-From f5125725e4e2e250ccc78a17a8b77431100e7c15 Mon Sep 17 00:00:00 2001
+From 4b1f48612fd1af40fff7b7b0a1d476e551458ab8 Mon Sep 17 00:00:00 2001
 From: Armin kuster <akuster808@gmail.com>
 Date: Wed, 14 Oct 2020 22:48:31 -0700
 Subject: [PATCH] Busybox does not support ps -p so use pgrep
@@ -15,6 +15,8 @@ Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
  src/bin/keactrl/keactrl.in | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
+diff --git a/src/bin/keactrl/keactrl.in b/src/bin/keactrl/keactrl.in
+index da108d8..30e4832 100755
 --- a/src/bin/keactrl/keactrl.in
 +++ b/src/bin/keactrl/keactrl.in
 @@ -157,8 +157,8 @@ check_running() {
diff --git a/meta/recipes-connectivity/kea/kea_3.0.1.bb b/meta/recipes-connectivity/kea/kea_3.0.2.bb
similarity index 95%
rename from meta/recipes-connectivity/kea/kea_3.0.1.bb
rename to meta/recipes-connectivity/kea/kea_3.0.2.bb
index a4950e3bc1..30dfba07a2 100644
--- a/meta/recipes-connectivity/kea/kea_3.0.1.bb
+++ b/meta/recipes-connectivity/kea/kea_3.0.2.bb
@@ -21,9 +21,9 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.xz \
            file://0001-meson-use-a-runtime-safe-interpreter-string.patch \
            file://0001-mk_cfgrpt.sh-strip-prefixes.patch \
            file://0001-d2-dhcp-46-radius-dhcpsrv-Avoid-Boost-lexical_cast-o.patch \
-           file://CVE-2025-11232.patch \
+           file://0001-src-lib-log-logger_level_impl.cc-add-a-missing-inclu.patch \
            "
-SRC_URI[sha256sum] = "ec84fec4bb7f6b9d15a82e755a571e9348eb4d6fbc62bb3f6f1296cd7a24c566"
+SRC_URI[sha256sum] = "29f4e44fa48f62fe15158d17411e003496203250db7b3459c2c79c09f379a541"
 
 inherit meson pkgconfig systemd update-rc.d upstream-version-is-even
 
-- 
2.47.3



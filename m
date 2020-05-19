Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.8162.1589877900299657291
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 01:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: ovidiu.panait@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 04J8iwUa006211
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2020 01:44:59 -0700 (PDT)
Received: from otp-linux01.wrs.com (128.224.126.17) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Tue, 19 May 2020
 01:44:58 -0700
From: "Ovidiu Panait" <ovidiu.panait@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] lttng-tools: upgrade to 2.12.0
Date: Tue, 19 May 2020 11:43:09 +0300
Message-ID: <20200519084309.34503-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Upgrade lttng-tools 2.11.2 -> 2.12.0:
* drop x32 patch, as it was merged upstream
* update ptest file mi-lttng-3.0.xsd -> mi-lttng-4.0.xsd
* add local patch to fix ptest build failure on musl
* License-Update: licenses were moved under LICENSES directory and changed in
  upstream commit [1]

[1] https://github.com/lttng/lttng-tools/commit/ab5be9fa2eb5ba9600a82cd18fd3cfcbac69169a

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 ...ents-ns-tp.h-Fix-build-with-musl-lib.patch | 43 +++++++++++++++++++
 .../lttng/lttng-tools/x32.patch               | 36 ----------------
 ...-tools_2.11.2.bb => lttng-tools_2.12.0.bb} | 14 +++---
 3 files changed, 50 insertions(+), 43 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-tests-gen-ust-events-ns-tp.h-Fix-build-with-musl-lib.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/x32.patch
 rename meta/recipes-kernel/lttng/{lttng-tools_2.11.2.bb => lttng-tools_2.12.0.bb} (92%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-gen-ust-events-ns-tp.h-Fix-build-with-musl-lib.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-gen-ust-events-ns-tp.h-Fix-build-with-musl-lib.patch
new file mode 100644
index 0000000000..a150d648ab
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-gen-ust-events-ns-tp.h-Fix-build-with-musl-lib.patch
@@ -0,0 +1,43 @@
+From e5d94cf4882cc6516af52b794c6acb8e4d6469a3 Mon Sep 17 00:00:00 2001
+From: Ovidiu Panait <ovidiu.panait@windriver.com>
+Date: Mon, 18 May 2020 16:39:26 +0300
+Subject: [PATCH] tests: gen-ust-events-ns/tp.h: Fix build with musl libc
+
+Fix the following build error with musl libc:
+In file included from ../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/tp.h:14,
+                 from ../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/tp.c:10:
+../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/tp.h:17:10: error: unknown type name 'ino_t'; did you mean 'int8_t'?
+   17 |  TP_ARGS(ino_t, ns_ino),
+      |          ^~~~~
+../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/tp.h:17:10: error: unknown type name 'ino_t'; did you mean 'int8_t'?
+   17 |  TP_ARGS(ino_t, ns_ino),
+      |          ^~~~~
+../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/./tp.h:17:2: error: unknown type name 'ino_t'; did you mean 'int8_t'?
+   17 |  TP_ARGS(ino_t, ns_ino),
+      |  ^~~~~~~
+../../../../../lttng-tools-2.12.0/tests/utils/testapp/gen-ust-events-ns/./tp.h:17:2: error: unknown type name 'ino_t'; did you mean 'int8_t'?
+   17 |  TP_ARGS(ino_t, ns_ino),
+      |  ^~~~~~~
+
+Upstream-Status: Submitted [https://github.com/lttng/lttng-tools/pull/161]
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ tests/utils/testapp/gen-ust-events-ns/tp.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/utils/testapp/gen-ust-events-ns/tp.h b/tests/utils/testapp/gen-ust-events-ns/tp.h
+index 4dbfed5..e0ddb29 100644
+--- a/tests/utils/testapp/gen-ust-events-ns/tp.h
++++ b/tests/utils/testapp/gen-ust-events-ns/tp.h
+@@ -11,6 +11,7 @@
+ #if !defined(_TRACEPOINT_TP_H) || defined(TRACEPOINT_HEADER_MULTI_READ)
+ #define _TRACEPOINT_TP_H
+ 
++#include <sys/types.h>
+ #include <lttng/tracepoint.h>
+ 
+ TRACEPOINT_EVENT(tp, tptest,
+-- 
+2.17.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools/x32.patch b/meta/recipes-kernel/lttng/lttng-tools/x32.patch
deleted file mode 100644
index 42cebf94ac..0000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/x32.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Fix build for x32
-
-Signed-off-by: Christopher Larson <chris_larson@mentor.com>
-
-Fix build error of src/common/utils.c for x32.
-
-Upstream-Status: Submitted [https://github.com/lttng/lttng-tools/pull/150]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-diff --git a/src/bin/lttng/utils.c b/src/bin/lttng/utils.c
-index 0e96ef0c..5c79c8c7 100644
---- a/src/bin/lttng/utils.c
-+++ b/src/bin/lttng/utils.c
-@@ -158,7 +158,7 @@ unsigned int fls_u32(uint32_t x)
- #define HAS_FLS_U32
- #endif
- 
--#if defined(__x86_64)
-+#if defined(__x86_64) && !defined(__ILP32__)
- static inline
- unsigned int fls_u64(uint64_t x)
- {
-diff --git a/src/common/utils.c b/src/common/utils.c
-index 08139e5e..3c389981 100644
---- a/src/common/utils.c
-+++ b/src/common/utils.c
-@@ -1223,7 +1223,7 @@ static inline unsigned int fls_u32(uint32_t x)
- #define HAS_FLS_U32
- #endif
- 
--#if defined(__x86_64)
-+#if defined(__x86_64) && !defined(__ILP32__)
- static inline
- unsigned int fls_u64(uint64_t x)
- {
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.11.2.bb b/meta/recipes-kernel/lttng/lttng-tools_2.12.0.bb
similarity index 92%
rename from meta/recipes-kernel/lttng/lttng-tools_2.11.2.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.12.0.bb
index 36a19ec18d..148a7928d2 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.11.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.12.0.bb
@@ -5,9 +5,9 @@ to extract program execution details from the Linux operating system \
 and interpret them."
 
 LICENSE = "GPLv2 & LGPLv2.1"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
-                    file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=40ef17463fbd6f377db3c47b1cbaded8 \
+                    file://LICENSES/GPL-2.0;md5=e68f69a54b44ba526ad7cb963e18fbce \
+                    file://LICENSES/LGPL-2.1;md5=9920968d0f2ff585ce61fae30344dd95"
 
 DEPENDS = "liburcu popt libxml2 util-linux"
 RDEPENDS_${PN} = "libgcc"
@@ -29,15 +29,15 @@ PACKAGECONFIG[manpages] = "--enable-man-pages, --disable-man-pages, asciidoc-nat
 PACKAGECONFIG_remove_arc = "lttng-ust"
 
 SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
-           file://x32.patch \
            file://0001-tests-do-not-strip-a-helper-library.patch \
            file://run-ptest \
            file://lttng-sessiond.service \
            file://0001-tests-regression-disable-the-tools-live-tests.patch \
+           file://0001-tests-gen-ust-events-ns-tp.h-Fix-build-with-musl-lib.patch \
            "
 
-SRC_URI[md5sum] = "68ed78f7fa4235477ea577e48b3cd245"
-SRC_URI[sha256sum] = "936477305b25f65c5dd22db9161287d30a309ce868b6180857b1fd1fb5e6a56b"
+SRC_URI[md5sum] = "4592201ea981f0722438345fb1f009d2"
+SRC_URI[sha256sum] = "405661d27617dc79a42712174a051a45c7ca12d167576c0d93f2de708ed29445"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
@@ -71,7 +71,7 @@ do_install_ptest () {
         install -D "${B}/$f" "${D}${PTEST_PATH}/$f"
     done
 
-    for f in config/tap-driver.sh config/test-driver src/common/config/session.xsd src/common/mi-lttng-3.0.xsd; do
+    for f in config/tap-driver.sh config/test-driver src/common/config/session.xsd src/common/mi-lttng-4.0.xsd; do
         install -D "${S}/$f" "${D}${PTEST_PATH}/$f"
     done
 
-- 
2.17.1


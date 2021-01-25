Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.30516.1611537390603999802
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jan 2021 17:16:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.79,372,1602518400"; 
   d="scan'208";a="103780668"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 25 Jan 2021 09:16:20 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 812F54CE601E
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Jan 2021 09:16:18 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 25 Jan 2021 09:16:18 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH] wayland: upgrade 1.18.0 -> 1.18.92
Date: Mon, 25 Jan 2021 09:16:13 +0800
Message-ID: <1611537373-1667-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 812F54CE601E.A4DD0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

0001-meson-tests-add-missing-dependencies-on-protocol-hea.patch
removed since it is included in 1.18.92

refresh the following patches:
0002-Do-not-hardcode-the-path-to-wayland-scanner.patch
0002-meson.build-find-the-native-wayland-scanner-directly.patch

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...missing-dependencies-on-protocol-hea.patch | 115 ------------------
 ...hardcode-the-path-to-wayland-scanner.patch |  23 ++--
 ...-the-native-wayland-scanner-directly.patch |  15 ++-
 .../{wayland_1.18.0.bb => wayland_1.18.92.bb} |   5 +-
 4 files changed, 24 insertions(+), 134 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/wayland/0001-meson-tests-add-missing-dependencies-on-protocol-hea.patch
 rename meta/recipes-graphics/wayland/{wayland_1.18.0.bb => wayland_1.18.92.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland/0001-meson-tests-add-missing-dependencies-on-protocol-hea.patch b/meta/recipes-graphics/wayland/wayland/0001-meson-tests-add-missing-dependencies-on-protocol-hea.patch
deleted file mode 100644
index 61de0e04e8..0000000000
--- a/meta/recipes-graphics/wayland/wayland/0001-meson-tests-add-missing-dependencies-on-protocol-hea.patch
+++ /dev/null
@@ -1,115 +0,0 @@
-From b2c74f6a3dbe0aee2413800837314136947a4985 Mon Sep 17 00:00:00 2001
-From: Jan Beich <jbeich@FreeBSD.org>
-Date: Sat, 15 Feb 2020 02:03:45 +0000
-Subject: [PATCH] meson/tests: add missing dependencies on protocol headers
-
-In file included from ../tests/connection-test.c:43:
-In file included from ../tests/test-compositor.h:30:
-../src/wayland-client.h:40:10: fatal error: 'wayland-client-protocol.h' file not found
- #include "wayland-client-protocol.h"
-          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
-In file included from ../tests/display-test.c:45:
-In file included from ../src/wayland-server.h:104:
-src/wayland-server-protocol.h:4454:2: error: unterminated /* comment
-        /**
-        ^
-In file included from ../tests/cpp-compile-test.cpp:2:
-In file included from src/wayland-server-protocol.h:8:
-In file included from ../src/wayland-server.h:104:
-src/wayland-server-protocol.h:3:2: error: unterminated conditional directive
- #ifndef WAYLAND_SERVER_PROTOCOL_H
-  ^
-../tests/headers-protocol-test.c:33:2: error: including wayland-server-protocol.h did not include wayland-server.h!
- #error including wayland-server-protocol.h did not include wayland-server.h!
-  ^
-In file included from ../tests/headers-protocol-test.c:26:
-In file included from src/wayland-client-protocol.h:8:
-In file included from ../src/wayland-client.h:40:
-src/wayland-client-protocol.h:1358:2: error: unterminated conditional directive
- #ifndef WL_SHM_FORMAT_ENUM
-  ^
-In file included from ../tests/protocol-logger-test.c:34:
-In file included from ../src/wayland-client.h:40:
-src/wayland-client-protocol.h:2613:1: error: unterminated /* comment
-/**
-^
-../tests/resources-test.c:49:36: error: use of undeclared identifier 'wl_seat_interface'
-        res = wl_resource_create(client, &wl_seat_interface, 4, 0);
-                                          ^
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- tests/meson.build | 26 ++++++++++++++++++--------
- 1 file changed, 18 insertions(+), 8 deletions(-)
-
-diff --git a/tests/meson.build b/tests/meson.build
-index c28a2a3..f1af7b4 100644
---- a/tests/meson.build
-+++ b/tests/meson.build
-@@ -69,7 +69,7 @@ test(
- 	executable(
- 		'cpp-compile-test',
- 		'cpp-compile-test.cpp',
--		wayland_server_protocol_core_h,
-+		wayland_server_protocol_h,
- 		include_directories: src_inc
- 	)
- )
-@@ -91,17 +91,25 @@ tests = {
- 	'array-test': [],
- 	'client-test': [ wayland_server_protocol_h ],
- 	'display-test': [
-+		wayland_client_protocol_h,
-+		wayland_server_protocol_h,
- 		tests_server_protocol_h,
- 		tests_client_protocol_c,
- 		tests_protocol_c,
- 	],
--	'connection-test': [ wayland_server_protocol_h ],
-+	'connection-test': [
-+		wayland_client_protocol_h,
-+		wayland_server_protocol_h,
-+	],
- 	'event-loop-test': [ wayland_server_protocol_h ],
- 	'fixed-test': [],
- 	'interface-test': [ wayland_client_protocol_h ],
- 	'list-test': [],
- 	'map-test': [],
--	'sanity-test' : [ wayland_server_protocol_h ],
-+	'sanity-test' : [
-+		wayland_client_protocol_h,
-+		wayland_server_protocol_h,
-+	],
- 	'socket-test': [
- 		wayland_client_protocol_h,
- 		wayland_server_protocol_h,
-@@ -116,7 +124,7 @@ tests = {
- 		files('../src/wayland-server.c'),
- 		wayland_server_protocol_h,
- 	],
--	'resources-test': [ wayland_server_protocol_core_h ],
-+	'resources-test': [ wayland_server_protocol_h ],
- 	'message-test': [
- 		wayland_client_protocol_h,
- 		wayland_server_protocol_h,
-@@ -126,14 +134,16 @@ tests = {
- 		wayland_server_protocol_h,
- 	],
- 	'protocol-logger-test': [
--		wayland_server_protocol_core_h,
--		wayland_client_protocol_core_h,
-+		wayland_client_protocol_h,
-+		wayland_server_protocol_h,
- 	],
- 	'headers-test': [
-+		wayland_client_protocol_h,
-+		wayland_server_protocol_h,
- 		'headers-protocol-test.c',
--		'headers-protocol-core-test.c',
--		wayland_server_protocol_core_h,
- 		wayland_client_protocol_core_h,
-+		wayland_server_protocol_core_h,
-+		'headers-protocol-core-test.c',
- 	],
- 	'os-wrappers-test': [],
- }
diff --git a/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch b/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch
index 2199548bdf..f3355b27e7 100644
--- a/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch
+++ b/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch
@@ -12,15 +12,18 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/meson.build b/src/meson.build
-index 294aee0..7e410fa 100644
+index 7ca6d8f..7cc5c0f 100644
 --- a/src/meson.build
 +++ b/src/meson.build
-@@ -49,7 +49,7 @@ pkgconfig.generate(
- 		'datarootdir=' + join_paths('${prefix}', get_option('datadir')),
- 		'pkgdatadir=' + join_paths('${datarootdir}', meson.project_name()),
- 		'bindir=' + join_paths('${prefix}', get_option('bindir')),
--		'wayland_scanner=${bindir}/wayland-scanner'
-+		'wayland_scanner=wayland-scanner'
- 	],
- 	filebase: 'wayland-scanner'
- )
+@@ -52,7 +52,7 @@ if get_option('scanner')
+ 			'datarootdir=' + join_paths('${prefix}', get_option('datadir')),
+ 			'pkgdatadir=' + join_paths('${datarootdir}', meson.project_name()),
+ 			'bindir=' + join_paths('${prefix}', get_option('bindir')),
+-			'wayland_scanner=${bindir}/wayland-scanner'
++			'wayland_scanner=wayland-scanner'
+ 		],
+ 		filebase: 'wayland-scanner'
+ 	)
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/wayland/wayland/0002-meson.build-find-the-native-wayland-scanner-directly.patch b/meta/recipes-graphics/wayland/wayland/0002-meson.build-find-the-native-wayland-scanner-directly.patch
index f98037a850..9efb22f24e 100644
--- a/meta/recipes-graphics/wayland/wayland/0002-meson.build-find-the-native-wayland-scanner-directly.patch
+++ b/meta/recipes-graphics/wayland/wayland/0002-meson.build-find-the-native-wayland-scanner-directly.patch
@@ -12,16 +12,19 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/src/meson.build b/src/meson.build
-index 3e8c9bf..294aee0 100644
+index d91c503..7ca6d8f 100644
 --- a/src/meson.build
 +++ b/src/meson.build
-@@ -55,8 +55,7 @@ pkgconfig.generate(
- )
+@@ -59,8 +59,7 @@ if get_option('scanner')
+ endif
  
- if meson.is_cross_build()
--	scanner_dep = dependency('wayland-scanner', native: true, version: '>=1.14.0')
+ if meson.is_cross_build() or not get_option('scanner')
+-	scanner_dep = dependency('wayland-scanner', native: true, version: meson.project_version())
 -	wayland_scanner_for_build = find_program(scanner_dep.get_pkgconfig_variable('wayland_scanner'))
-+	wayland_scanner_for_build = find_program('wayland-scanner')
++        wayland_scanner_for_build = find_program('wayland-scanner')
  else
  	wayland_scanner_for_build = wayland_scanner
  endif
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/wayland/wayland_1.18.0.bb b/meta/recipes-graphics/wayland/wayland_1.18.92.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland_1.18.0.bb
rename to meta/recipes-graphics/wayland/wayland_1.18.92.bb
index 00be3aac27..d7217981f6 100644
--- a/meta/recipes-graphics/wayland/wayland_1.18.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.18.92.bb
@@ -17,10 +17,9 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://0002-meson.build-find-the-native-wayland-scanner-directly.patch \
            file://0002-Do-not-hardcode-the-path-to-wayland-scanner.patch \
            file://0001-build-Fix-strndup-detection-on-MinGW.patch \
-           file://0001-meson-tests-add-missing-dependencies-on-protocol-hea.patch \
            "
-SRC_URI[md5sum] = "23317697b6e3ff2e1ac8c5ba3ed57b65"
-SRC_URI[sha256sum] = "4675a79f091020817a98fd0484e7208c8762242266967f55a67776936c2e294d"
+SRC_URI[md5sum] = "90f204964ee697edf46905910f0d4052"
+SRC_URI[sha256sum] = "5b5696d8f58230971e848c0e25b987ab1c2b52f07eba6e88f036556606fb65cd"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-- 
2.25.1




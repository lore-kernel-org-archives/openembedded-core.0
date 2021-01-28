Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1820.1611874906204313614
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jan 2021 15:01:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0A3F4406B9
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 23:01:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Y9JAT8OQS1U
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jan 2021 23:01:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E4E6D406B5
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Jan 2021 23:01:44 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 3F9A91743CE;
	Thu, 28 Jan 2021 18:01:44 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH] wayland: upgrade 1.18.0 -> 1.19.0
Date: Thu, 28 Jan 2021 18:01:43 -0500
Message-Id: <1611874903-25899-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

This release mostly contains bug fixes and minor protocol updates.

Related patches were rebased and backported patches dropped.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 ...0001-build-Fix-strndup-detection-on-MinGW.patch |   5 +-
 ...-add-missing-dependencies-on-protocol-hea.patch | 115 ---------------------
 ...-not-hardcode-the-path-to-wayland-scanner.patch |  23 +++--
 ...-find-the-native-wayland-scanner-directly.patch |  13 +--
 .../{wayland_1.18.0.bb => wayland_1.19.0.bb}       |   4 +-
 5 files changed, 24 insertions(+), 136 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/wayland/0001-meson-tests-add-missing-dependencies-on-protocol-hea.patch
 rename meta/recipes-graphics/wayland/{wayland_1.18.0.bb => wayland_1.19.0.bb} (91%)

diff --git a/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch b/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch
index c2ceae4..ad1063b 100644
--- a/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch
+++ b/meta/recipes-graphics/wayland/wayland/0001-build-Fix-strndup-detection-on-MinGW.patch
@@ -1,4 +1,4 @@
-From e6783c99f051c6d8252db5f388d805cef0e16357 Mon Sep 17 00:00:00 2001
+From 6a6223a8e217664a348835e92d5a602f50e18b2c Mon Sep 17 00:00:00 2001
 From: Joshua Watt <JPEWhacker@gmail.com>
 Date: Thu, 20 Feb 2020 15:20:45 -0600
 Subject: [PATCH] build: Fix strndup detection on MinGW
@@ -13,10 +13,13 @@ See: https://github.com/mesonbuild/meson/issues/3672
 
 Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
 Upstream-Status: Submitted [https://gitlab.freedesktop.org/wayland/wayland/merge_requests/63]
+
 ---
  meson.build | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
+diff --git a/meson.build b/meson.build
+index 11c35fa..80729d0 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -36,11 +36,11 @@ have_funcs = [
diff --git a/meta/recipes-graphics/wayland/wayland/0001-meson-tests-add-missing-dependencies-on-protocol-hea.patch b/meta/recipes-graphics/wayland/wayland/0001-meson-tests-add-missing-dependencies-on-protocol-hea.patch
deleted file mode 100644
index 61de0e0..0000000
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
index 2199548..e3e7192 100644
--- a/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch
+++ b/meta/recipes-graphics/wayland/wayland/0002-Do-not-hardcode-the-path-to-wayland-scanner.patch
@@ -1,4 +1,4 @@
-From cbb28635a1079d68e62dbaa1e21791a20dbbbaf4 Mon Sep 17 00:00:00 2001
+From 3e7cd56611aeec274e48a4816bc7c21f74f15be0 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 17 Feb 2020 21:46:18 +0100
 Subject: [PATCH] Do not hardcode the path to wayland-scanner
@@ -7,20 +7,21 @@ This results in host contamination during builds.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  src/meson.build | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/meson.build b/src/meson.build
-index 294aee0..7e410fa 100644
+index 15730a3..61edbc8 100644
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
diff --git a/meta/recipes-graphics/wayland/wayland/0002-meson.build-find-the-native-wayland-scanner-directly.patch b/meta/recipes-graphics/wayland/wayland/0002-meson.build-find-the-native-wayland-scanner-directly.patch
index f98037a..11dc069 100644
--- a/meta/recipes-graphics/wayland/wayland/0002-meson.build-find-the-native-wayland-scanner-directly.patch
+++ b/meta/recipes-graphics/wayland/wayland/0002-meson.build-find-the-native-wayland-scanner-directly.patch
@@ -1,4 +1,4 @@
-From 2582d2653ba80917d7bc47088e1a5f49530fddaa Mon Sep 17 00:00:00 2001
+From 98e7902a4ddcd80b61cce6f35f97907e841a5eda Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Sun, 16 Feb 2020 16:29:53 +0100
 Subject: [PATCH] meson.build: find the native wayland-scanner directly in PATH
@@ -7,19 +7,20 @@ Otherwise, meson attempts to use the target pkg-config and fails.
 
 Upstream-Status: Pending
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
 ---
  src/meson.build | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/src/meson.build b/src/meson.build
-index 3e8c9bf..294aee0 100644
+index d91c503..15730a3 100644
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
 +	wayland_scanner_for_build = find_program('wayland-scanner')
  else
diff --git a/meta/recipes-graphics/wayland/wayland_1.18.0.bb b/meta/recipes-graphics/wayland/wayland_1.19.0.bb
similarity index 91%
rename from meta/recipes-graphics/wayland/wayland_1.18.0.bb
rename to meta/recipes-graphics/wayland/wayland_1.19.0.bb
index 00be3aa..8f12160 100644
--- a/meta/recipes-graphics/wayland/wayland_1.18.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.19.0.bb
@@ -17,10 +17,8 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://0002-meson.build-find-the-native-wayland-scanner-directly.patch \
            file://0002-Do-not-hardcode-the-path-to-wayland-scanner.patch \
            file://0001-build-Fix-strndup-detection-on-MinGW.patch \
-           file://0001-meson-tests-add-missing-dependencies-on-protocol-hea.patch \
            "
-SRC_URI[md5sum] = "23317697b6e3ff2e1ac8c5ba3ed57b65"
-SRC_URI[sha256sum] = "4675a79f091020817a98fd0484e7208c8762242266967f55a67776936c2e294d"
+SRC_URI[sha256sum] = "baccd902300d354581cd5ad3cc49daa4921d55fb416a5883e218750fef166d15"
 
 UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
 
-- 
2.7.4


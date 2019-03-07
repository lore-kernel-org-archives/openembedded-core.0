Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A24E77CE6B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 02:49:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x272nQCo023560
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Mar 2019 18:49:37 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Wed, 6 Mar 2019 18:49:36 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Mar 2019 10:58:54 +0800
Message-ID: <11c87e694d0cfdaf464ebc8d0550d4acecf2bad0.1551927438.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1551927438.git.Qi.Chen@windriver.com>
References: <cover.1551927438.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] systemd: backport patch to fix parallel build failure
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Mar 2019 02:49:47 -0000
Content-Type: text/plain

Backport patch to fix parallel build failure like below.

       In file included from ../git/src/core/dbus-manager.c:10:
       ../git/src/basic/build.h:4:10: fatal error: version.h: No such file or directory
       #include "version.h"
                 ^~~~~~~~~~~
       compilation terminated.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...re-version.h-as-dep-for-various-targets-t.patch | 118 +++++++++++++++++++++
 meta/recipes-core/systemd/systemd_241.bb           |   1 +
 2 files changed, 119 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-meson-declare-version.h-as-dep-for-various-targets-t.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-meson-declare-version.h-as-dep-for-various-targets-t.patch b/meta/recipes-core/systemd/systemd/0001-meson-declare-version.h-as-dep-for-various-targets-t.patch
new file mode 100644
index 0000000..01936f2
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-meson-declare-version.h-as-dep-for-various-targets-t.patch
@@ -0,0 +1,118 @@
+From 9f86d8769ab830a724c84f849975b5595e26b47c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Sun, 24 Feb 2019 22:49:38 +0100
+Subject: [PATCH] meson: declare version.h as dep for various targets that
+ include build.h
+
+Should fix #11565.
+
+Upstream-Status: Backport
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ meson.build          | 19 +++++++++++++------
+ src/core/meson.build |  3 ++-
+ src/udev/meson.build |  1 +
+ 3 files changed, 16 insertions(+), 7 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 30df834..232f3e1 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1637,7 +1637,8 @@ exe = executable('systemd-analyze',
+                  include_directories : includes,
+                  link_with : [libcore,
+                               libshared],
+-                 dependencies : [threads,
++                 dependencies : [versiondep,
++                                 threads,
+                                  librt,
+                                  libseccomp,
+                                  libselinux,
+@@ -2183,7 +2184,8 @@ if conf.get('ENABLE_IMPORTD') == 1
+                                   systemd_pull_sources,
+                                   include_directories : includes,
+                                   link_with : [libshared],
+-                                  dependencies : [libcurl,
++                                  dependencies : [versiondep,
++                                                  libcurl,
+                                                   libz,
+                                                   libbzip2,
+                                                   libxz,
+@@ -2232,7 +2234,8 @@ if conf.get('ENABLE_REMOTE') == 1 and conf.get('HAVE_LIBCURL') == 1
+                          systemd_journal_upload_sources,
+                          include_directories : includes,
+                          link_with : [libshared],
+-                         dependencies : [threads,
++                         dependencies : [versiondep,
++                                         threads,
+                                          libcurl,
+                                          libgnutls,
+                                          libxz,
+@@ -2558,6 +2561,7 @@ exe = executable('systemd-stdio-bridge',
+                  'src/stdio-bridge/stdio-bridge.c',
+                  include_directories : includes,
+                  link_with : [libshared],
++                 dependencies : [versiondep],
+                  install_rpath : rootlibexecdir,
+                  install : true)
+ public_programs += exe
+@@ -2641,7 +2645,8 @@ exe = executable('systemd-udevd',
+                  link_with : [libudev_core,
+                               libsystemd_network,
+                               libudev_static],
+-                 dependencies : [threads,
++                 dependencies : [versiondep,
++                                 threads,
+                                  libkmod,
+                                  libidn,
+                                  libacl,
+@@ -2658,7 +2663,8 @@ exe = executable('udevadm',
+                  link_with : [libudev_core,
+                               libsystemd_network,
+                               libudev_static],
+-                 dependencies : [threads,
++                 dependencies : [versiondep,
++                                 threads,
+                                  libkmod,
+                                  libidn,
+                                  libacl,
+@@ -2798,7 +2804,8 @@ foreach tuple : tests
+                         sources,
+                         include_directories : incs,
+                         link_with : link_with,
+-                        dependencies : dependencies,
++                        dependencies : [versiondep,
++                                        dependencies],
+                         c_args : defs,
+                         build_by_default : want_tests != 'false',
+                         install_rpath : rootlibexecdir,
+diff --git a/src/core/meson.build b/src/core/meson.build
+index 85021bd..88fb093 100644
+--- a/src/core/meson.build
++++ b/src/core/meson.build
+@@ -150,7 +150,8 @@ libcore = static_library(
+         load_fragment_gperf_c,
+         load_fragment_gperf_nulstr_c,
+         include_directories : includes,
+-        dependencies : [threads,
++        dependencies : [versiondep,
++                        threads,
+                         librt,
+                         libseccomp,
+                         libpam,
+diff --git a/src/udev/meson.build b/src/udev/meson.build
+index 9d3f6d1..973a75e 100644
+--- a/src/udev/meson.build
++++ b/src/udev/meson.build
+@@ -180,6 +180,7 @@ foreach prog : [['ata_id/ata_id.c'],
+                    prog,
+                    include_directories : includes,
+                    c_args : ['-DLOG_REALM=LOG_REALM_UDEV'],
++                   dependencies : [versiondep],
+                    link_with : [libudev_static],
+                    install_rpath : udev_rpath,
+                    install : true,
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/systemd/systemd_241.bb b/meta/recipes-core/systemd/systemd_241.bb
index 44a132a..47492c9 100644
--- a/meta/recipes-core/systemd/systemd_241.bb
+++ b/meta/recipes-core/systemd/systemd_241.bb
@@ -22,6 +22,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0004-rules-whitelist-hd-devices.patch \
            file://0005-rules-watch-metadata-changes-in-ide-devices.patch \
+           file://0001-meson-declare-version.h-as-dep-for-various-targets-t.patch \
            "
 
 # patches needed by musl
-- 
1.9.1



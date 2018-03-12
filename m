Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EB81278863
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 08:38:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w2C8d1aJ008788
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 01:39:01 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.197) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Mon, 12 Mar 2018 01:38:22 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Mar 2018 16:38:52 +0800
Message-ID: <d9f15ae9662c50df3dc17419d83a787a3740d054.1520841539.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1520841539.git.Qi.Chen@windriver.com>
References: <cover.1520841539.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] systemd: fix build failure for qemux86 and qemuppc with musl
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
X-List-Received-Date: Mon, 12 Mar 2018 08:39:00 -0000
Content-Type: text/plain

Remove the 'fstack-protector' and 'fstack-protector-strong' flags
as a workaround to fix the following error when building for qemux86
and qemuppc with musl.

  undefined reference to `__stack_chk_fail_local'

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...ck-protector-flags-to-workaround-musl-bui.patch | 33 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_237.bb           |  4 +++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch b/meta/recipes-core/systemd/systemd/0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch
new file mode 100644
index 0000000..e913e3f
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch
@@ -0,0 +1,33 @@
+From e361f6b4aefae57efff7e457df8db4d1067bec23 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 28 Feb 2018 21:50:23 -0800
+Subject: [PATCH] Remove fstack-protector flags to workaround musl build
+
+Remove fstack-protector and fstack-protector-strong flags to fix
+the following build failure for qemux86 and qemuppc with musl.
+
+  undefined reference to `__stack_chk_fail_local'
+
+Upstream-Status: Inappropriate [OE Specific]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ meson.build | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 7610ab12b..591b9cbab 100644
+--- a/meson.build
++++ b/meson.build
+@@ -329,8 +329,6 @@ foreach arg : ['-Wextra',
+                '-fdiagnostics-show-option',
+                '-fno-strict-aliasing',
+                '-fvisibility=hidden',
+-               '-fstack-protector',
+-               '-fstack-protector-strong',
+                '--param=ssp-buffer-size=4',
+               ]
+         if cc.has_argument(arg)
+-- 
+2.13.0
+
diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
index ae6e455..dfa43ea 100644
--- a/meta/recipes-core/systemd/systemd_237.bb
+++ b/meta/recipes-core/systemd/systemd_237.bb
@@ -53,6 +53,10 @@ SRC_URI = "git://github.com/systemd/systemd.git;protocol=git \
            "
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
+# Workaround undefined reference to `__stack_chk_fail_local' on qemux86 and qemuppc for musl
+SRC_URI_append_libc-musl_qemux86 = " file://0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch"
+SRC_URI_append_libc-musl_qemuppc = " file://0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch"
+
 PAM_PLUGINS = " \
     pam-plugin-unix \
     pam-plugin-loginuid \
-- 
1.9.1



Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F0B527887F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 05:56:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w1S5ue4n025296
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 21:56:40 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.197) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 27 Feb 2018 21:56:14 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Feb 2018 13:56:38 +0800
Message-ID: <846a1c535da3f41e87999910427d49929d9753a2.1519797175.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1519797175.git.Qi.Chen@windriver.com>
References: <cover.1519797175.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] systemd: fix build failure for qemux86 and qemuppc with musl
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
X-List-Received-Date: Wed, 28 Feb 2018 05:56:39 -0000
Content-Type: text/plain

Remove the 'fstack-protector' and 'fstack-protector-strong' flags
as a workaround to fix the following error when building for qemux86
and qemuppc with musl.

  undefined reference to `__stack_chk_fail_local'

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...ck-protector-flags-to-workaround-musl-bui.patch | 33 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_236.bb           |  4 +++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch b/meta/recipes-core/systemd/systemd/0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch
new file mode 100644
index 0000000..783e579
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-Remove-fstack-protector-flags-to-workaround-musl-bui.patch
@@ -0,0 +1,33 @@
+From a3e71209957e627be7e47969a61d2c69de4f2659 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 27 Feb 2018 18:06:51 -0800
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
+index ddc061c12..631e76886 100644
+--- a/meson.build
++++ b/meson.build
+@@ -298,8 +298,6 @@ foreach arg : ['-Wextra',
+                '-fdiagnostics-show-option',
+                '-fno-strict-aliasing',
+                '-fvisibility=hidden',
+-               '-fstack-protector',
+-               '-fstack-protector-strong',
+                '-fPIE',
+                '--param=ssp-buffer-size=4',
+               ]
+-- 
+2.13.0
+
diff --git a/meta/recipes-core/systemd/systemd_236.bb b/meta/recipes-core/systemd/systemd_236.bb
index a208f62..7798abb 100644
--- a/meta/recipes-core/systemd/systemd_236.bb
+++ b/meta/recipes-core/systemd/systemd_236.bb
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



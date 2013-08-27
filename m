Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f52.google.com (mail-pb0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 36CB16B230
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 17:16:24 +0000 (UTC)
Received: by mail-pb0-f52.google.com with SMTP id wz12so5071086pbc.39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 10:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=kQ3JnBmNIU17nl5YLSM9KnPoteY5tGBqQcxjQWRYtrE=;
	b=bIm2VWj6OydNpeEtoB5IMyY1UXQm2QkrMVdY2N3CVo5+KPN8zng3drrwsMkjlyPLRq
	ykpW9SOKF0n4dC8Sgaz4kgrnjNEZw/ZJW8sKh3NnSRciJ+mRkV4ihzy9gbPu9BxoSCY7
	nIfgnZ73bi7rqZR71WIdQ8f592zjvbOHXnbmenKqGHMWxcNMuq63AmV1sm35ERUtvPZK
	xOUW0EWmi+M0PwThRoJccf9SNTHOMWLVqcv8VrZLXEgo8sg5qkb4EX40DViMKlLWQcfD
	lHQ8mnMKbRZA3ZMgVb/ho2fY84q5fZFGR8cCoWl7otAdisehnMelrVEBdaAt2GUIU0NX
	aMjg==
X-Received: by 10.66.142.107 with SMTP id rv11mr22234057pab.17.1377623785245; 
	Tue, 27 Aug 2013 10:16:25 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id t9sm25769021pba.46.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 27 Aug 2013 10:16:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2013 10:15:15 -0700
Message-Id: <4c5fdb5a0f6c91c2170e0becc18ff49c29fe273b.1377623208.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <569ad1cd7395edbd376600e8c05708a9cefd9262.1377623208.git.raj.khem@gmail.com>
References: <569ad1cd7395edbd376600e8c05708a9cefd9262.1377623208.git.raj.khem@gmail.com>
In-Reply-To: <cover.1377623208.git.raj.khem@gmail.com>
References: <cover.1377623208.git.raj.khem@gmail.com>
Subject: [PATCH 16/20] python3: Fix host include contamination issue
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
X-List-Received-Date: Tue, 27 Aug 2013 17:16:24 -0000

Let compiler append sysroot to include path if it can

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-native_3.3.2.bb                 |  1 +
 .../python/python3/sysroot-include-headers.patch   | 35 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.3.2.bb      |  1 +
 3 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/sysroot-include-headers.patch

diff --git a/meta/recipes-devtools/python/python3-native_3.3.2.bb b/meta/recipes-devtools/python/python3-native_3.3.2.bb
index 012deba..da8dc87 100644
--- a/meta/recipes-devtools/python/python3-native_3.3.2.bb
+++ b/meta/recipes-devtools/python/python3-native_3.3.2.bb
@@ -20,6 +20,7 @@ file://avoid_warning_about_tkinter.patch \
 file://06-ctypes-libffi-fix-configure.patch \
 file://shutil-follow-symlink-fix.patch \
 file://0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch \
+file://sysroot-include-headers.patch \
 ${DISTRO_SRC_URI} \
 "
 SRC_URI[md5sum] = "7dffe775f3bea68a44f762a3490e5e28"
diff --git a/meta/recipes-devtools/python/python3/sysroot-include-headers.patch b/meta/recipes-devtools/python/python3/sysroot-include-headers.patch
new file mode 100644
index 0000000..785b556
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/sysroot-include-headers.patch
@@ -0,0 +1,35 @@
+Dont search hardcoded paths, we might be doing a cross-build
+Use '=' in-front to let compiler append sysroot, if it can
+
+Should fix things like
+
+configure:6972: arm-angstrom-linux-gnueabi-gcc  -march=armv7-a -mthumb-interwork -mfloat-abi=hard -mfpu=neon -mtune=cortex-a8 -DNDEBUG -fno-inline -D__SOFTFP__ --sysroot=/build/v2013.06/build/tmp-angstrom_v2013_06-eglibc/sysroots/beaglebone -c -O2 -pipe -g -feliminate-unused-debug-types  -I/usr/include/ncursesw conftest.c >&5
+cc1: warning: include location "/usr/include/ncursesw" is unsafe for cross-compilation [-Wpoison-system-directories]
+
+
+Signed-off-by: Khem Raj
+Upstream-Status: Pending
+
+
+Index: Python-3.3.2/setup.py
+===================================================================
+--- Python-3.3.2.orig/setup.py	2013-07-30 01:30:48.000000000 -0700
++++ Python-3.3.2/setup.py	2013-07-30 01:41:11.697862723 -0700
+@@ -1210,7 +1210,7 @@
+         panel_library = 'panel'
+         if curses_library == 'ncursesw':
+             curses_defines.append(('HAVE_NCURSESW', '1'))
+-            curses_includes.append('/usr/include/ncursesw')
++            curses_includes.append('=/usr/include/ncursesw')
+             # Bug 1464056: If _curses.so links with ncursesw,
+             # _curses_panel.so must link with panelw.
+             panel_library = 'panelw'
+@@ -1819,7 +1819,7 @@
+         if host_platform == 'darwin':
+             # OS X 10.5 comes with libffi.dylib; the include files are
+             # in /usr/include/ffi
+-            inc_dirs.append('/usr/include/ffi')
++            inc_dirs.append('=/usr/include/ffi')
+ 
+         ffi_inc = [sysconfig.get_config_var("LIBFFI_INCLUDEDIR")]
+         if not ffi_inc or ffi_inc[0] == '':
diff --git a/meta/recipes-devtools/python/python3_3.3.2.bb b/meta/recipes-devtools/python/python3_3.3.2.bb
index 768d44b..fe423d3 100644
--- a/meta/recipes-devtools/python/python3_3.3.2.bb
+++ b/meta/recipes-devtools/python/python3_3.3.2.bb
@@ -30,6 +30,7 @@ SRC_URI += "\
             file://host_include_contamination.patch \
             file://python-3.3-multilib.patch \
             file://shutil-follow-symlink-fix.patch \
+            file://sysroot-include-headers.patch \
            "
 SRC_URI[md5sum] = "7dffe775f3bea68a44f762a3490e5e28"
 SRC_URI[sha256sum] = "f77202fe2bbc203205d7bd6e8452567fa1d9bc97f6957c9ef753d9a36cdcbe9a"
-- 
1.8.3.4



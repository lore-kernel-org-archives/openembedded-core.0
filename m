Received: from mail-ee0-f46.google.com ([74.125.83.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1USEDf-0003fP-IB
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 00:19:23 +0200
Received: by mail-ee0-f46.google.com with SMTP id d49so450197eek.19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 15:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=wnu8nmeiXJgVZDlBH9oXtzovhj2lwuLG5+JjXABqeDo=;
	b=Cv/QTXKEru5rLFLv0nIZMklwAHHI4/oWoSWIGQbnjo9RfFOykGILGEjOSFX+bBCps8
	UK2B/K4WVGdujIKM7qiNNo+j4bukDSI6jcn4VsVMvvtqIGnALe96gsO16ZIWHWfTqISz
	I+Jxpq5mllC3Df1HDOAwzgYIEr2D2/NEildwOzr16kBwH6OJc4LjjGtkSFtPbq6wYpyN
	E3SLaU02iEQF++hPK282zjsIkK7dBBwr36HFFppKAq63bzNypvH43E5pVco+wuTcYvKS
	nDxIFzrWpxP5/cbRJzgNTUkvLo3MmKrpUya+gH5NLeKyqe7nZeI0JhDnvL5TEpDNwByM
	/cHA==
X-Received: by 10.15.83.73 with SMTP id b49mr10825184eez.25.1366149708882;
	Tue, 16 Apr 2013 15:01:48 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id u44sm5130821eel.7.2013.04.16.15.01.47
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 15:01:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Apr 2013 00:01:44 +0200
Message-Id: <1366149704-12490-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1366147707.8670.110.camel@ted>
References: <1366147707.8670.110.camel@ted>
Subject: [PATCHv2] systemd: use AC_CHECK_TOOL instead of AC_PATH_TOOL when checking objcopy, strings, gperf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Apr 2013 22:19:23 -0000

* with external toolchain I have different HOST_PREFIX and HOST_SYS
  AC_PATH_TOOL is using HOST_SYS as prefix and fails to find objcopy
  then it tries objcopy without prefix which is found on host, but
  that objcopy does not work for arm libs
* with internal toolchain gperf is not prefixed with HOST_PREFIX, but
  fallback to "gperf" only finds the one in native sysroot first
* based on http://lists.linuxtogo.org/pipermail/openembedded-core/2013-April/037985.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...se-AC_CHECK_TOOL-for-objcopy-strings-and-.patch | 41 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_199.bb           |  6 +++-
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-configure-use-AC_CHECK_TOOL-for-objcopy-strings-and-.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-configure-use-AC_CHECK_TOOL-for-objcopy-strings-and-.patch b/meta/recipes-core/systemd/systemd/0001-configure-use-AC_CHECK_TOOL-for-objcopy-strings-and-.patch
new file mode 100644
index 0000000..d847bbc
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-configure-use-AC_CHECK_TOOL-for-objcopy-strings-and-.patch
@@ -0,0 +1,41 @@
+From d6f92bcbbae9a577adb9588c7b2783a5d0bf343d Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 16 Apr 2013 14:20:41 +0200
+Subject: [PATCH] configure: use AC_CHECK_TOOL for objcopy, strings and gperf
+
+* using AC_PATH_TOOL does not allow to override it from shell environment
+  which is useful when cross-compiling
+* with external toolchain I have different HOST_PREFIX and HOST_SYS
+  AC_PATH_TOOL is using HOST_SYS as prefix and fails to find objcopy
+  which is available only as ${TARGET_PREFIX}objcopy then it tries
+  objcopy without prefix which is found on host, but that objcopy
+  does not work for !host (e.g. arm when building on x86) libs
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Upstream-Status: Submitted
+http://lists.freedesktop.org/archives/systemd-devel/2013-April/010468.html
+
+---
+ configure.ac | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 33b0ca9..519f1a9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -86,9 +86,9 @@ GOBJECT_INTROSPECTION_CHECK([1.31.1])
+    AM_CONDITIONAL([HAVE_INTROSPECTION], [false])
+    enable_introspection=no])
+ 
+-AC_PATH_TOOL(OBJCOPY, objcopy)
+-AC_PATH_TOOL(STRINGS, strings)
+-AC_PATH_TOOL(GPERF, gperf)
++AC_CHECK_TOOL(OBJCOPY, objcopy)
++AC_CHECK_TOOL(STRINGS, strings)
++AC_CHECK_TOOL(GPERF, gperf)
+ if test -z "$GPERF" ; then
+         AC_MSG_ERROR([*** gperf not found])
+ fi
+-- 
+1.8.1.5
+
diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core/systemd/systemd_199.bb
index d22df12..bbe19ea 100644
--- a/meta/recipes-core/systemd/systemd_199.bb
+++ b/meta/recipes-core/systemd/systemd_199.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
 PROVIDES = "udev"
 
 PE = "1"
-PR = "r2"
+PR = "r3"
 
 DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
@@ -27,6 +27,7 @@ SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
            file://0002-readahead-chunk-on-spinning-media.patch \
            file://0003-readahead-cleanups.patch \
            file://0013-systemd-sysctl-Handle-missing-etc-sysctl.conf-proper.patch \
+           file://0001-configure-use-AC_CHECK_TOOL-for-objcopy-strings-and-.patch \
            file://199-firmware.patch \
            file://init \
           "
@@ -77,6 +78,9 @@ EXTRA_OECONF_append_libc-uclibc = " --disable-myhostname "
 do_configure_prepend() {
 	export CPP="${HOST_PREFIX}cpp ${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"
 
+	export STRINGS = "${HOST_PREFIX}strings"
+	export GPERF = "${HOST_PREFIX}gperf"
+
 	sed -i -e 's:=/root:=${ROOT_HOME}:g' units/*.service*
 }
 
-- 
1.8.1.5




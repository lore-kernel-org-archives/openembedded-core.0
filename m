Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1USEMR-0004P1-TE
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 00:28:33 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so454658eei.20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 15:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=A0ijeiDVkN2katnYH391UOx18En0cEWSIQo6+zOTm04=;
	b=oIJYbRn9zA0RlMuhte481nRR+k4V8MpDFedErtiq2nWJNhRw01Vgy7nhUxuevOUd+i
	jjHVgUH40yO01Bh6INdh4W19HB6mGKnwwys/tmFARRGQ6SNFhjhFWTEHMQdMpAgcX4Bs
	nLkZYRgHkyuUXveejlAdLN8dYVUy1t2q1/T00uKm8MO33gT+6WsH5iP8E0M0al7OFAKl
	A9tE/H4a/6/D+XO7Ao+xfe6vAw+o3vnTnMjHdX+Heu1DNbtGH93/JsJCPO7Y1IcjbwPK
	SGfvwbKAt+DdSsOihzN1Xf72G6Djb7/7IQ2G5gDd1oHtFQ80+XqXjY/iM6MGiLxUzt/d
	yoxA==
X-Received: by 10.15.111.202 with SMTP id cj50mr10989934eeb.6.1366150253349;
	Tue, 16 Apr 2013 15:10:53 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ch6sm5095404eeb.17.2013.04.16.15.10.52
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 15:10:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Apr 2013 00:10:56 +0200
Message-Id: <1366150256-21827-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1366147707.8670.110.camel@ted>
References: <1366147707.8670.110.camel@ted>
Subject: [PATCHv3] systemd: use AC_CHECK_TOOL instead of AC_PATH_TOOL when checking objcopy, strings, gperf
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
X-List-Received-Date: Tue, 16 Apr 2013 22:28:49 -0000

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
index d22df12..dc25179 100644
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
 
+	export STRINGS="${HOST_PREFIX}strings"
+	export GPERF="${HOST_PREFIX}gperf"
+
 	sed -i -e 's:=/root:=${ROOT_HOME}:g' units/*.service*
 }
 
-- 
1.8.1.5




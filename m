Received: from mail-we0-f178.google.com ([74.125.82.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1US5IO-0008VF-K0
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 14:47:38 +0200
Received: by mail-we0-f178.google.com with SMTP id z53so312105wey.37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 05:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=1Jdhr7qJxbSgv/Fth7nRx/IMJjGjbrQ2ek6HfUhfs84=;
	b=U75tcScvAKxrCVBp7dUXLXo4TkhI98jxr+M0iCSYOw3Bc9wZG72bhMi2GnXxB7pBnv
	mtHFvgiL6pEdyZxXsgP/xm9rzLpvA3kaTq69KvUm+IQRb0wz6vUevYt5M4GyZ4So9BpM
	jgqIlhxlpeb5JMET3yM2MfirlG0VG838KQAAlGhGqfDtL4Z+INbCRt/tIYxQjU6LHFh/
	B3ojZcv+jAKX9Cj/hhpskQNP0/pLqn3Kn+BbSX16TL2ob3kZjRhmaEF2gn5URUtrt8UA
	vvCnfpkJ0E+awoUzDxSAF0CVW4Lao/12S/EXd+/PQNPAPZ7opC8/ptN3PUmxnz62snqj
	Aoeg==
X-Received: by 10.194.109.35 with SMTP id hp3mr3610461wjb.15.1366115406433;
	Tue, 16 Apr 2013 05:30:06 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id fp2sm19162101wib.7.2013.04.16.05.30.05
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 16 Apr 2013 05:30:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Apr 2013 14:30:11 +0200
Message-Id: <1366115411-15270-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCH] systemd: use AC_CHECK_TOOL instead of AC_PATH_TOOL when checking objcopy, strings, gperf
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
X-List-Received-Date: Tue, 16 Apr 2013 12:47:38 -0000

* with external toolchain I have different HOST_PREFIX and HOST_SYS
  AC_PATH_TOOL is using HOST_SYS as prefix and fails to find objcopy
  then it tries objcopy without prefix which is found on host, but
  that objcopy does not work for arm libs
* with internal toolchain gperf is not prefixed with HOST_PREFIX, but
  fallback to "gperf" only finds the one in native sysroot first
* based on http://lists.linuxtogo.org/pipermail/openembedded-core/2013-April/037985.html
  Khem suggested to export strings and gperf from bitbake.conf instead

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/bitbake.conf                             |  2 ++
 ...se-AC_CHECK_TOOL-for-objcopy-strings-and-.patch | 41 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_199.bb           |  1 +
 3 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-configure-use-AC_CHECK_TOOL-for-objcopy-strings-and-.patch

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index cd5d61e..a84ae38 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -455,6 +455,8 @@ export RANLIB = "${HOST_PREFIX}ranlib"
 export STRIP = "${HOST_PREFIX}strip"
 export OBJCOPY = "${HOST_PREFIX}objcopy"
 export OBJDUMP = "${HOST_PREFIX}objdump"
+export STRINGS = "${HOST_PREFIX}strings"
+export GPERF = "${HOST_PREFIX}gperf"
 export NM = "${HOST_PREFIX}nm"
 PYTHON = "${@sys.executable}"
 
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
index d22df12..e8ad8f5 100644
--- a/meta/recipes-core/systemd/systemd_199.bb
+++ b/meta/recipes-core/systemd/systemd_199.bb
@@ -27,6 +27,7 @@ SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
            file://0002-readahead-chunk-on-spinning-media.patch \
            file://0003-readahead-cleanups.patch \
            file://0013-systemd-sysctl-Handle-missing-etc-sysctl.conf-proper.patch \
+           file://0001-configure-use-AC_CHECK_TOOL-for-objcopy-strings-and-.patch \
            file://199-firmware.patch \
            file://init \
           "
-- 
1.8.1.5




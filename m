Return-Path: <Rongqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 75CED7391A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 03:05:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0P35Zud017923
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jan 2016 19:05:35 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Sun, 24 Jan 2016 19:05:34 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jan 2016 11:04:33 +0800
Message-ID: <1453691073-14559-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] systemd: make TEST_DIR configurable
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
X-List-Received-Date: Mon, 25 Jan 2016 03:05:36 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

1. make TEST_DIR configurable, and configure it to ptest dir, since
the *.service for test are installed into ptest dir. 
2. always follow symbolic links in SOURCE when copy test files
to install dir, since some *.service under test dir are linked to
../unit/*.service which are not installed into ptest dir

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../systemd/0001-make-test-dir-configurable.patch  | 64 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_228.bb           |  4 +-
 2 files changed, 67 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-make-test-dir-configurable.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-make-test-dir-configurable.patch b/meta/recipes-core/systemd/systemd/0001-make-test-dir-configurable.patch
new file mode 100644
index 0000000..7d06371
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-make-test-dir-configurable.patch
@@ -0,0 +1,64 @@
+From 3eeec270d3af166e3bc09537626850562487742b Mon Sep 17 00:00:00 2001
+From: Roy Li <rongqing.li@windriver.com>
+Date: Fri, 22 Jan 2016 16:44:11 +0800
+Subject: [PATCH] make test dir configurable
+
+Upstream-Status: Pending
+
+test maybe be run on target in cross-compile environment, and test dir
+is not the compilation dir, so make it configurable
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ Makefile.am  | 2 +-
+ configure.ac | 7 +++++++
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 931d13f..7155ec7 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -209,7 +209,7 @@ AM_CPPFLAGS = \
+ 	-DROOTLIBDIR=\"$(rootlibdir)\" \
+ 	-DROOTLIBEXECDIR=\"$(rootlibexecdir)\" \
+ 	-DROOTHOMEDIR=\"$(roothomedir)\" \
+-	-DTEST_DIR=\"$(abs_top_srcdir)/test\" \
++	-DTEST_DIR=\"$(testdir)/test\" \
+ 	-I $(top_srcdir)/src \
+ 	-I $(top_builddir)/src/basic \
+ 	-I $(top_srcdir)/src/basic \
+diff --git a/configure.ac b/configure.ac
+index 76090a1..b02968d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1411,6 +1411,11 @@ AC_ARG_WITH([roothomedir],
+         [],
+         [with_roothomedir=/root])
+ 
++AC_ARG_WITH([testdir],
++        AS_HELP_STRING([--with-testdir=DIR], [test file directory]),
++        [],
++        [with_testdir=${abs_top_srcdir}])
++
+ AC_ARG_WITH([pamlibdir],
+         AS_HELP_STRING([--with-pamlibdir=DIR], [Directory for PAM modules]),
+         [],
+@@ -1503,6 +1508,7 @@ AC_SUBST([pamconfdir], [$with_pamconfdir])
+ AC_SUBST([rootprefix], [$with_rootprefix])
+ AC_SUBST([rootlibdir], [$with_rootlibdir])
+ AC_SUBST([roothomedir], [$with_roothomedir])
++AC_SUBST([testdir], [$with_testdir])
+ 
+ AC_CONFIG_FILES([
+         Makefile
+@@ -1593,6 +1599,7 @@ AC_MSG_RESULT([
+         lib dir:                 ${libdir}
+         rootlib dir:             ${with_rootlibdir}
+         root home dir:           ${with_roothomedir}
++        test dir:                ${with_testdir}
+         SysV init scripts:       ${SYSTEM_SYSVINIT_PATH}
+         SysV rc?.d directories:  ${SYSTEM_SYSVRCND_PATH}
+         Build Python:            ${PYTHON}
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/systemd/systemd_228.bb b/meta/recipes-core/systemd/systemd_228.bb
index 0e1bd8b..a110f0c 100644
--- a/meta/recipes-core/systemd/systemd_228.bb
+++ b/meta/recipes-core/systemd/systemd_228.bb
@@ -45,6 +45,7 @@ SRC_URI = "git://github.com/systemd/systemd.git;protocol=git \
            file://00-create-volatile.conf \
            file://init \
            file://run-ptest \
+           file://0001-make-test-dir-configurable.patch \ 
           "
 SRC_URI_append_libc-uclibc = "\
             file://0001-define-exp10-if-missing.patch \
@@ -127,6 +128,7 @@ EXTRA_OECONF = " --with-rootprefix=${rootprefix} \
                  --without-python \
                  --with-sysvrcnd-path=${sysconfdir} \
                  --with-firmware-path=/lib/firmware \
+                 --with-testdir=${PTEST_PATH} \
                "
 # uclibc does not have NSS
 EXTRA_OECONF_append_libc-uclibc = " --disable-myhostname --disable-sysusers"
@@ -215,7 +217,7 @@ do_install() {
 
 do_install_ptest () {
        install -d ${D}${PTEST_PATH}/test
-       cp -rf ${S}/test/* ${D}${PTEST_PATH}/test
+       cp -rfL ${S}/test/* ${D}${PTEST_PATH}/test
        install -m 0755  ${B}/test-udev ${D}${PTEST_PATH}/
        install -d ${D}${PTEST_PATH}/build-aux
        cp ${S}/build-aux/test-driver ${D}${PTEST_PATH}/build-aux/
-- 
1.9.1



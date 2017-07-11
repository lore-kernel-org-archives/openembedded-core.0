Return-Path: <romain.perier@collabora.com>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 795E277EA7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 06:55:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: rperier) with ESMTPSA id 5517B26BDCB
From: Romain Perier <romain.perier@collabora.com>
To: liezhi.yang@windriver.com
Date: Tue, 11 Jul 2017 08:46:05 +0200
Message-Id: <20170711064606.8941-2-romain.perier@collabora.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170711064606.8941-1-romain.perier@collabora.com>
References: <20170711064606.8941-1-romain.perier@collabora.com>
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/2] logrotate: Bump to 3.12.3
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
X-List-Received-Date: Tue, 11 Jul 2017 06:55:44 -0000

This commit updates the recipe to the last upstream tag. Then, as the
tarball no longer contains the pre-generated Makefile, inherit from
autotools

Signed-off-by: Romain Perier <romain.perier@collabora.com>
---
 ...upport-system-dates-back-to-the-year-1970.patch | 27 --------
 .../logrotate/act-as-mv-when-rotate.patch          | 32 +++++-----
 .../logrotate/logrotate/update-the-manual.patch    | 16 ++---
 .../recipes-extended/logrotate/logrotate_3.12.3.bb | 66 ++++++++++++++++++++
 meta/recipes-extended/logrotate/logrotate_3.9.1.bb | 71 ----------------------
 5 files changed, 92 insertions(+), 120 deletions(-)
 delete mode 100644 meta/recipes-extended/logrotate/logrotate/0001-Support-system-dates-back-to-the-year-1970.patch
 create mode 100644 meta/recipes-extended/logrotate/logrotate_3.12.3.bb
 delete mode 100644 meta/recipes-extended/logrotate/logrotate_3.9.1.bb

diff --git a/meta/recipes-extended/logrotate/logrotate/0001-Support-system-dates-back-to-the-year-1970.patch b/meta/recipes-extended/logrotate/logrotate/0001-Support-system-dates-back-to-the-year-1970.patch
deleted file mode 100644
index b544ec6..0000000
--- a/meta/recipes-extended/logrotate/logrotate/0001-Support-system-dates-back-to-the-year-1970.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Support system dates back to the year 1970
-
-The system time on Linux can be set back as far as 1970 (the epoch time).
-Currently logrotate stops working correctly if the time goes before 1996.
-This value (1996) appears to have been hard coded since the code was written
-back in 1996. Testing and code analysis shows this can simply be modified
-to 1970.
-
-The patch is provided by Matt Bennett <matt.bennett@alliedtelesis.co.nz>
-
-Upstream-Status: Backport +
-Signed-off-by: Zhenbo Gao <zhenbo.gao@windriver.com>
-
-diff --git a/logrotate.c.orig b/logrotate.c
-index cf8bf2c..a7dadfb 100644
---- a/logrotate.c.orig
-+++ b/logrotate.c
-@@ -2381,7 +2381,7 @@ static int readState(char *stateFilename)
- 	}
- 
- 	/* Hack to hide earlier bug */
--	if ((year != 1900) && (year < 1996 || year > 2100)) {
-+	if ((year != 1900) && (year < 1970 || year > 2100)) {
- 	    message(MESS_ERROR,
- 		    "bad year %d for file %s in state file %s\n", year,
- 		    argv[0], stateFilename);
-
diff --git a/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch b/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch
index 2e931a2..04cb588 100644
--- a/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch
+++ b/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch
@@ -1,4 +1,4 @@
-From 68f29ab490cf987aa34b5f4caf1784b58a021308 Mon Sep 17 00:00:00 2001
+From 517cbff66c8bdbf455bc3b7c1a85a4f990d0f9a6 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Tue, 17 Feb 2015 21:08:07 -0800
 Subject: [PATCH] Act as the "mv" command when rotate log
@@ -10,14 +10,14 @@ Upstream-Status: Pending
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
- logrotate.c |   71 +++++++++++++++++++++++++++++++++++++++++++++++++----------
- 1 file changed, 59 insertions(+), 12 deletions(-)
+ logrotate.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++++++-----------
+ 1 file changed, 60 insertions(+), 12 deletions(-)
 
 diff --git a/logrotate.c b/logrotate.c
-index d3deb6a..cf8bf2c 100644
+index 4ad58d4..ba05884 100644
 --- a/logrotate.c
 +++ b/logrotate.c
-@@ -1157,6 +1157,53 @@ int findNeedRotating(struct logInfo *log, int logNum, int force)
+@@ -1315,6 +1315,54 @@ static int findNeedRotating(struct logInfo *log, int logNum, int force)
      return 0;
  }
  
@@ -68,10 +68,11 @@ index d3deb6a..cf8bf2c 100644
 +    return 1;
 +}
 +
- int prerotateSingleLog(struct logInfo *log, int logNum, struct logState *state,
- 		       struct logNames *rotNames)
++
+ static int prerotateSingleLog(struct logInfo *log, int logNum,
+ 			      struct logState *state, struct logNames *rotNames)
  {
-@@ -1523,15 +1570,15 @@ int prerotateSingleLog(struct logInfo *log, int logNum, struct logState *state,
+@@ -1674,15 +1722,15 @@ static int prerotateSingleLog(struct logInfo *log, int logNum,
  		}
  
  	    message(MESS_DEBUG,
@@ -90,7 +91,7 @@ index d3deb6a..cf8bf2c 100644
  			    oldName, newName, strerror(errno));
  		    hasErrors = 1;
  		}
-@@ -1669,21 +1716,21 @@ int rotateSingleLog(struct logInfo *log, int logNum, struct logState *state,
+@@ -1767,21 +1815,21 @@ static int rotateSingleLog(struct logInfo *log, int logNum,
  				return 1;
  			}
  
@@ -115,19 +116,19 @@ index d3deb6a..cf8bf2c 100644
 -				message(MESS_ERROR, "failed to rename %s to %s: %s\n",
 +			mvFile(log->files[logNum], rotNames->finalName, log, prev_acl)) {
 +				message(MESS_ERROR, "failed to move %s to %s: %s\n",
- 					log->files[logNum], tmpFilename,
+ 					log->files[logNum], rotNames->finalName,
  					strerror(errno));
  					hasErrors = 1;
-@@ -2063,7 +2110,7 @@ int rotateLogSet(struct logInfo *log, int force)
+@@ -2170,7 +2218,7 @@ static int rotateLogSet(struct logInfo *log, int force)
      return hasErrors;
  }
  
--static int writeState(char *stateFilename)
+-static int writeState(const char *stateFilename)
 +static int writeState(struct logInfo *log, char *stateFilename)
  {
  	struct logState *p;
  	FILE *f;
-@@ -2227,7 +2274,7 @@ static int writeState(char *stateFilename)
+@@ -2322,7 +2370,7 @@ static int writeState(const char *stateFilename)
  		fclose(f);
  
  	if (error == 0) {
@@ -136,7 +137,7 @@ index d3deb6a..cf8bf2c 100644
  			unlink(tmpFilename);
  			error = 1;
  			message(MESS_ERROR, "error renaming temp state file %s\n",
-@@ -2525,7 +2572,7 @@ int main(int argc, const char **argv)
+@@ -2648,7 +2696,7 @@ int main(int argc, const char **argv)
  		rc |= rotateLogSet(log, force);
  
  	if (!debug)
@@ -145,3 +146,6 @@ index d3deb6a..cf8bf2c 100644
  
  	return (rc != 0);
  }
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-extended/logrotate/logrotate/update-the-manual.patch b/meta/recipes-extended/logrotate/logrotate/update-the-manual.patch
index 50d037d..725567e 100644
--- a/meta/recipes-extended/logrotate/logrotate/update-the-manual.patch
+++ b/meta/recipes-extended/logrotate/logrotate/update-the-manual.patch
@@ -1,4 +1,4 @@
-From e0b0fe30e9c49234994a20a86aacfaf80e690087 Mon Sep 17 00:00:00 2001
+From bf22e8805df69344f6f20cea390e829a22fa741b Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Tue, 17 Feb 2015 21:14:37 -0800
 Subject: [PATCH] Update the manual
@@ -9,14 +9,14 @@ Upstream-Status: Pending
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 ---
- logrotate.8 |   10 ++++------
+ logrotate.8.in | 10 ++++------
  1 file changed, 4 insertions(+), 6 deletions(-)
 
-diff --git a/logrotate.8 b/logrotate.8
-index e4e5f48..84407d0 100644
---- a/logrotate.8
-+++ b/logrotate.8
-@@ -405,12 +405,10 @@ Do not rotate the log if it is empty (this overrides the \fBifempty\fR option).
+diff --git a/logrotate.8.in b/logrotate.8.in
+index 951e406..581bf48 100644
+--- a/logrotate.8.in
++++ b/logrotate.8.in
+@@ -445,12 +445,10 @@ Do not rotate the log if it is empty (this overrides the \fBifempty\fR option).
  
  .TP
  \fBolddir \fIdirectory\fR
@@ -34,5 +34,5 @@ index e4e5f48..84407d0 100644
  
  .TP
 -- 
-1.7.9.5
+1.8.3.1
 
diff --git a/meta/recipes-extended/logrotate/logrotate_3.12.3.bb b/meta/recipes-extended/logrotate/logrotate_3.12.3.bb
new file mode 100644
index 0000000..2033be1
--- /dev/null
+++ b/meta/recipes-extended/logrotate/logrotate_3.12.3.bb
@@ -0,0 +1,66 @@
+SUMMARY = "Rotates, compresses, removes and mails system log files"
+SECTION = "console/utils"
+HOMEPAGE = "https://github.com/logrotate/logrotate/issues"
+LICENSE = "GPLv2"
+
+# TODO: Document coreutils dependency. Why not RDEPENDS? Why not busybox?
+
+DEPENDS="coreutils popt"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+# When updating logrotate to latest upstream, SRC_URI should point to
+# a proper release tarball from https://github.com/logrotate/logrotate/releases
+# and we have to take the snapshot for now because there is no such
+# tarball available for 3.9.1.
+
+S = "${WORKDIR}/${BPN}-${PV}"
+
+UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
+UPSTREAM_CHECK_REGEX = "logrotate-(?P<pver>\d+(\.\d+)+).tar"
+
+SRC_URI = "https://github.com/${BPN}/${BPN}/archive/${PV}.tar.gz \
+            file://act-as-mv-when-rotate.patch \
+            file://update-the-manual.patch \
+            file://disable-check-different-filesystems.patch \
+            "
+
+SRC_URI[md5sum] = "d1c41bdf63b9993c8e4e8b48a7bd5b8b"
+SRC_URI[sha256sum] = "683ccb7fff74082471aa6bd9e962ae7a3f4d55eea7df41fd97aa12ec6f55e657"
+
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)}"
+
+PACKAGECONFIG[acl] = ",,acl"
+PACKAGECONFIG[selinux] = ",,libselinux"
+
+CONFFILES_${PN} += "${localstatedir}/lib/logrotate.status \
+		    ${sysconfdir}/logrotate.conf"
+
+# If RPM_OPT_FLAGS is unset, it adds -g itself rather than obeying our
+# optimization variables, so use it rather than EXTRA_CFLAGS.
+EXTRA_OEMAKE = "\
+    LFS= \
+    OS_NAME='${OS_NAME}' \
+    'CC=${CC}' \
+    'RPM_OPT_FLAGS=${CFLAGS}' \
+    'EXTRA_LDFLAGS=${LDFLAGS}' \
+    ${@bb.utils.contains('PACKAGECONFIG', 'acl', 'WITH_ACL=yes', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'selinux', 'WITH_SELINUX=yes', '', d)} \
+"
+
+# OS_NAME in the makefile defaults to `uname -s`. The behavior for
+# freebsd/netbsd is questionable, so leave it as Linux, which only sets
+# INSTALL=install and BASEDIR=/usr.
+OS_NAME = "Linux"
+
+inherit autotools
+
+do_install(){
+    oe_runmake install DESTDIR=${D} PREFIX=${D} MANDIR=${mandir}
+    mkdir -p ${D}${sysconfdir}/logrotate.d
+    mkdir -p ${D}${sysconfdir}/cron.daily
+    mkdir -p ${D}${localstatedir}/lib
+    install -p -m 644 ${S}/examples/logrotate-default ${D}${sysconfdir}/logrotate.conf
+    install -p -m 755 ${S}/examples/logrotate.cron ${D}${sysconfdir}/cron.daily/logrotate
+    touch ${D}${localstatedir}/lib/logrotate.status
+}
diff --git a/meta/recipes-extended/logrotate/logrotate_3.9.1.bb b/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
deleted file mode 100644
index 7c73212..0000000
--- a/meta/recipes-extended/logrotate/logrotate_3.9.1.bb
+++ /dev/null
@@ -1,71 +0,0 @@
-SUMMARY = "Rotates, compresses, removes and mails system log files"
-SECTION = "console/utils"
-HOMEPAGE = "https://github.com/logrotate/logrotate/issues"
-LICENSE = "GPLv2"
-
-# TODO: logrotate 3.8.8 adds autotools/automake support, update recipe to use it.
-# TODO: Document coreutils dependency. Why not RDEPENDS? Why not busybox?
-
-DEPENDS="coreutils popt"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
-
-# When updating logrotate to latest upstream, SRC_URI should point to
-# a proper release tarball from https://github.com/logrotate/logrotate/releases
-# and we have to take the snapshot for now because there is no such
-# tarball available for 3.9.1.
-
-S = "${WORKDIR}/${BPN}-r3-9-1"
-
-UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
-UPSTREAM_CHECK_REGEX = "logrotate-(?P<pver>\d+(\.\d+)+).tar"
-
-SRC_URI = "https://github.com/${BPN}/${BPN}/archive/r3-9-1.tar.gz \
-           file://act-as-mv-when-rotate.patch \
-           file://update-the-manual.patch \
-           file://disable-check-different-filesystems.patch \
-           file://0001-Support-system-dates-back-to-the-year-1970.patch \
-            "
-
-SRC_URI[md5sum] = "8572b7c2cf9ade09a8a8e10098500fb3"
-SRC_URI[sha256sum] = "5bf8e478c428e7744fefa465118f8296e7e771c981fb6dffb7527856a0ea3617"
-
-PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'acl selinux', d)}"
-
-PACKAGECONFIG[acl] = ",,acl"
-PACKAGECONFIG[selinux] = ",,libselinux"
-
-CONFFILES_${PN} += "${localstatedir}/lib/logrotate.status \
-		    ${sysconfdir}/logrotate.conf"
-
-# If RPM_OPT_FLAGS is unset, it adds -g itself rather than obeying our
-# optimization variables, so use it rather than EXTRA_CFLAGS.
-EXTRA_OEMAKE = "\
-    LFS= \
-    OS_NAME='${OS_NAME}' \
-    'CC=${CC}' \
-    'RPM_OPT_FLAGS=${CFLAGS}' \
-    'EXTRA_LDFLAGS=${LDFLAGS}' \
-    ${@bb.utils.contains('PACKAGECONFIG', 'acl', 'WITH_ACL=yes', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'selinux', 'WITH_SELINUX=yes', '', d)} \
-"
-
-# OS_NAME in the makefile defaults to `uname -s`. The behavior for
-# freebsd/netbsd is questionable, so leave it as Linux, which only sets
-# INSTALL=install and BASEDIR=/usr.
-OS_NAME = "Linux"
-
-do_compile_prepend() {
-    # Make sure the recompile is OK
-    rm -f ${B}/.depend
-}
-
-do_install(){
-    oe_runmake install DESTDIR=${D} PREFIX=${D} MANDIR=${mandir}
-    mkdir -p ${D}${sysconfdir}/logrotate.d
-    mkdir -p ${D}${sysconfdir}/cron.daily
-    mkdir -p ${D}${localstatedir}/lib
-    install -p -m 644 examples/logrotate-default ${D}${sysconfdir}/logrotate.conf
-    install -p -m 755 examples/logrotate.cron ${D}${sysconfdir}/cron.daily/logrotate
-    touch ${D}${localstatedir}/lib/logrotate.status
-}
-- 
1.8.3.1



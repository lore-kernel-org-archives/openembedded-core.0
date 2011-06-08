Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QUNho-00040q-ND
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Jun 2011 20:42:17 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p58IcuYB025378
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Jun 2011 11:38:56 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 8 Jun 2011 11:38:56 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Jun 2011 13:48:56 -0500
Message-ID: <e36a5a812026d1c95710a02e189dd481894499c6.1307558785.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307558785.git.mark.hatle@windriver.com>
References: <cover.1307558785.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/2] pseudo: Update pseudo to 1.1.1 version
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Jun 2011 18:42:17 -0000
Content-Type: text/plain

Update both the core and pseudo_git packages to the latest 1.1.1 verison.

This fixes an issues where the call system() was not wrapped.  This could
lead to issues where certain spawned commands broke out of a pseudo-chroot
and created files in the wrong place.

Also the update the 1.0 -> 1.1.1 adds additional capabilities such as
beginning support for MacOS X.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/pseudo/pseudo.inc            |   20 +++++--
 .../recipes-devtools/pseudo/pseudo/oe-config.patch |   58 ++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.0.bb         |    9 ---
 meta/recipes-devtools/pseudo/pseudo_1.1.1.bb       |   10 ++++
 meta/recipes-devtools/pseudo/pseudo_git.bb         |    7 ++-
 5 files changed, 86 insertions(+), 18 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/pseudo/oe-config.patch
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.0.bb
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.1.1.bb

diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-devtools/pseudo/pseudo.inc
index a458dcc..0416a53 100644
--- a/meta/recipes-devtools/pseudo/pseudo.inc
+++ b/meta/recipes-devtools/pseudo/pseudo.inc
@@ -1,3 +1,7 @@
+# Note: Due to the bitbake wrapper script, making changes to pseudo can be
+# difficult.  To work around the current version of the wrapper use:
+# BBFETCH2=True PSEUDO_BUILD=1 ../bitbake/bin/bitbake pseudo-native [-c CMD]
+
 DESCRIPTION = "Pseudo gives fake root capabilities to a normal user"
 HOMEPAGE = "http://wiki.github.com/wrpseudo/pseudo/"
 LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
@@ -18,8 +22,12 @@ NO32LIBS ??= "0"
 
 # Compile for the local machine arch...
 do_compile () {
-	${S}/configure --prefix=${prefix} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=${SITEINFO_BITS}
-	oe_runmake 'LIB=lib/pseudo/lib$(MARK64)'
+	if [ "${SITEINFO_BITS}" == "64" ]; then
+	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib${SITEINFO_BITS} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=${SITEINFO_BITS}
+	else
+	  ${S}/configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=${SITEINFO_BITS}
+	fi
+	oe_runmake
 }
 
 # Two below are the same
@@ -28,8 +36,8 @@ do_compile () {
 do_compile_prepend_virtclass-native () {
 	if [ "${SITEINFO_BITS}" == "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" == "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
 		# We need the 32-bit libpseudo on a 64-bit machine...
-		./configure --prefix=${prefix} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32
-		oe_runmake 'CFLAGS=-m32' 'LIB=lib/pseudo/lib' libpseudo
+		./configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32
+		oe_runmake libpseudo
 		# prevent it from removing the lib, but remove everything else
 		make 'LIB=foo' distclean 
 	fi
@@ -38,8 +46,8 @@ do_compile_prepend_virtclass-native () {
 do_compile_prepend_virtclass-nativesdk () {
 	if [ "${SITEINFO_BITS}" == "64" -a -e "/usr/include/gnu/stubs-32.h" -a "${PN}" == "pseudo-native" -a "${NO32LIBS}" != "1" ]; then
 		# We need the 32-bit libpseudo on a 64-bit machine...
-		./configure --prefix=${prefix} --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32
-		oe_runmake 'CFLAGS=-m32' 'LIB=lib/pseudo/lib' libpseudo
+		./configure --prefix=${prefix} --libdir=${prefix}/lib/pseudo/lib --with-sqlite=${STAGING_DIR_TARGET}${exec_prefix} --bits=32
+		oe_runmake libpseudo
 		# prevent it from removing the lib, but remove everything else
 		make 'LIB=foo' distclean 
 	fi
diff --git a/meta/recipes-devtools/pseudo/pseudo/oe-config.patch b/meta/recipes-devtools/pseudo/pseudo/oe-config.patch
new file mode 100644
index 0000000..d368281
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/pseudo/oe-config.patch
@@ -0,0 +1,58 @@
+configure: Fix configuration to match OE-Core requirements
+
+In OE-Core we need to be able to configure for both 32-bit and 64-bit libpseudo
+libraries.  In order to avoid some complex manipulations, we adjust the configure
+and Makefile to facilitate this.
+
+Upstream-Status: Submitted
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+
+diff --git a/Makefile.in b/Makefile.in
+index 6c57d43..342d066 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -27,7 +27,7 @@ MARK64=@MARK64@
+ RPATH=@RPATH@
+ VERSION=1.1.1
+ 
+-LIB=$(shell basename $(LIBDIR))
++LIB=@LIB@
+ BIN=bin
+ LOCALSTATE=var/pseudo
+ BINDIR=$(PREFIX)/$(BIN)
+diff --git a/configure b/configure
+index 9a480fb..eeb19f3 100755
+--- a/configure
++++ b/configure
+@@ -80,14 +80,18 @@ if [ -z "$opt_prefix" ]; then
+   usage
+ fi
+ 
+-if [ -n "$opt_bits" ] && [ -n "$opt_libdir" ]; then
+-    echo >&2 "Can not specify both --libdir and --bits"
+-    exit 1
+-fi
+ if [ -z "$opt_libdir" ]; then
+     opt_libdir=$opt_prefix/lib$opt_mark64
+ fi
+ 
++# We need to find the libdir relative to the prefix, this is required
++# by the code in pseudo-utils.c that handles relocation.
++opt_lib=${opt_libdir#$opt_prefix/}
++if [ "$opt_lib" = "$opt_libdir" ]; then
++    echo >&2 "libdir must be relative to prefix."
++    exit 1
++fi
++
+ if [ ! -f "${opt_sqlite}/include/sqlite3.h" ]; then
+     echo >&2 "SQLite3 headers not found in at ${opt_sqlite}/include/sqlite3.h. Please check that SQLite3 and SQLite3 headers are installed."
+     exit 1
+@@ -107,6 +111,7 @@ fi
+ sed -e '
+   s,@PREFIX@,'"$opt_prefix"',g
+   s,@LIBDIR@,'"$opt_libdir"',g
++  s,@LIB@,'"$opt_lib"',g
+   s,@SUFFIX@,'"$opt_suffix"',g
+   s,@SQLITE@,'"$opt_sqlite"',g
+   s!@RPATH@!'"$opt_rpath"'!g
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.0.bb b/meta/recipes-devtools/pseudo/pseudo_1.0.bb
deleted file mode 100644
index e750e8a..0000000
--- a/meta/recipes-devtools/pseudo/pseudo_1.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require pseudo.inc
-
-PR = "r0"
-
-SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://static_sqlite.patch"
-
-SRC_URI[md5sum] = "a329bd00ba78711bcacd48fc1982af6a"
-SRC_URI[sha256sum] = "cb41c97094044144ef4027ab9dbba009f3cb1c23e6bec9640f29d530524ad60f"
diff --git a/meta/recipes-devtools/pseudo/pseudo_1.1.1.bb b/meta/recipes-devtools/pseudo/pseudo_1.1.1.bb
new file mode 100644
index 0000000..e05fe41
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/pseudo_1.1.1.bb
@@ -0,0 +1,10 @@
+require pseudo.inc
+
+PR = "r0"
+
+SRC_URI = "http://www.yoctoproject.org/downloads/${BPN}/${BPN}-${PV}.tar.bz2 \
+           file://oe-config.patch \
+           file://static_sqlite.patch"
+
+SRC_URI[md5sum] = "dd59766c17e199fe6144fce8a2c67802"
+SRC_URI[sha256sum] = "c697f643577d661c3ce826504b9dcd11fa98e78a5d10e3c83931da8942f6bfad"
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 2b9fe70..6505958 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -1,12 +1,13 @@
 require pseudo.inc
 
-SRCREV = "5434325fc887817ebb2bad36313d8277992cef1d"
-PV = "1.0+git${SRCPV}"
-PR = "r18"
+SRCREV = "1d3e67cb168c3459e67a0b29f071ca30ed17dadc"
+PV = "1.1.1+git${SRCPV}"
+PR = "r19"
 
 DEFAULT_PREFERENCE = "-1"
 
 SRC_URI = "git://github.com/wrpseudo/pseudo.git;protocol=git \
+           file://oe-config.patch \
            file://static_sqlite.patch"
 
 S = "${WORKDIR}/git"
-- 
1.7.3.4




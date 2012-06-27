Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sjlcd-0003Jl-0b
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 08:21:03 +0200
Received: by pbbrq2 with SMTP id rq2so1066718pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2012 23:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ZsaHwlaeM1dFtmLgB9RRtgEIwCCZ7Kd4ncMklzKQs/Q=;
	b=RcMcwTjNV2i7y/FyJCJtnz/OYrMalxCsJfax3KQByq5fsgK/6GidCAH5AoGxC/SWDV
	9BPBgJeQiyeQ4QUYhR3E/MSrrESJky1MC5cHfaETHZRpjSiwZcuEfPpnkZE9DMAjDWg5
	ZuRSmYRqHkytjgSWxhCPQZvX1nfjBCa/CgtewvCsvpZ3ClpUmm65SYP4J6l6K9bHyqrE
	zqByIF+wg+Sxe4j7OxGx7yj94Th6lwEwFv6KsKc4WhWoOzA7I/9yIshdqN2mlie8oMw1
	drnIyjewgq58buNmfULt/5g8c3RCeScMcwl5FuvQ3mvW/eYK2VQYHhcaWvevH5EdFOQy
	jcCw==
Received: by 10.68.132.201 with SMTP id ow9mr59140446pbb.160.1340777409261;
	Tue, 26 Jun 2012 23:10:09 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ob9sm14168304pbb.28.2012.06.26.23.10.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Jun 2012 23:10:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jun 2012 23:09:47 -0700
Message-Id: <ec558be2030b45d171cfe32f041d0cef680fc580.1340777116.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <55a411d66293b6d2196e98376f0fb9e4487b4bdf.1340777116.git.raj.khem@gmail.com>
References: <55a411d66293b6d2196e98376f0fb9e4487b4bdf.1340777116.git.raj.khem@gmail.com>
In-Reply-To: <cover.1340777115.git.raj.khem@gmail.com>
References: <cover.1340777115.git.raj.khem@gmail.com>
Subject: [PATCH 3/7] uclibc: Separate the bits between uclibc and uclibc-initial
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
X-List-Received-Date: Wed, 27 Jun 2012 06:21:04 -0000

uclibc and uclibc-initial were providing conflicting PROVIDES
separate the common bits into logical pieces. Create a common
inc file to hold package information and version specific includes
so correct logical units can be included in uclibc and uclibc-initial
recipes.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc-0.9.33.inc         |   21 ++++
 meta/recipes-core/uclibc/uclibc-git.inc            |   23 +++++
 .../uclibc/uclibc-git/utmp-locking.patch           |  106 ++++++++++++++++++++
 meta/recipes-core/uclibc/uclibc-initial_0.9.33.bb  |    3 +-
 meta/recipes-core/uclibc/uclibc-initial_git.bb     |    3 +-
 meta/recipes-core/uclibc/uclibc-package.inc        |   37 +++++++
 meta/recipes-core/uclibc/uclibc.inc                |   59 +----------
 meta/recipes-core/uclibc/uclibc_0.9.33.bb          |   33 +++---
 meta/recipes-core/uclibc/uclibc_git.bb             |   33 +++---
 9 files changed, 221 insertions(+), 97 deletions(-)
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33.inc
 create mode 100644 meta/recipes-core/uclibc/uclibc-git.inc
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/utmp-locking.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-package.inc

diff --git a/meta/recipes-core/uclibc/uclibc-0.9.33.inc b/meta/recipes-core/uclibc/uclibc-0.9.33.inc
new file mode 100644
index 0000000..8d03e21
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-0.9.33.inc
@@ -0,0 +1,21 @@
+SRCREV="7810e4f8027b5c4c8ceec6fefec4eb779362ebb5"
+
+PR = "${INC_PR}.2"
+
+SRC_URI = "git://uclibc.org/uClibc.git;branch=${PV};protocol=git \
+	file://uClibc.machine \
+	file://uClibc.distro \
+	file://uclibc_enable_log2_test.patch \
+	file://ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch \
+	file://powerpc_copysignl.patch \
+	file://argp-support.patch \
+	file://argp-headers.patch \
+	file://remove_attribute_optimize_Os.patch \
+	file://compile-arm-fork-with-O2.patch \
+	file://uclibc-execvpe.patch \
+	file://orign_path.patch \
+	file://dup3.patch \
+	file://define-MSG_CMSG_CLOEXEC.patch \
+	"
+
+S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
new file mode 100644
index 0000000..eac7e75
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -0,0 +1,23 @@
+SRCREV="0dcc13bf7a61b1d0708e5dd103d5515e0ffec79a"
+
+DEFAULT_PREFERENCE = "-1"
+
+PV = "0.9.33+git${SRCPV}"
+PR = "${INC_PR}.1"
+
+FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-git' ], d)}"
+
+SRC_URI = "git://uclibc.org/uClibc.git;branch=master;protocol=git \
+	file://uClibc.machine \
+	file://uClibc.distro \
+	file://uclibc_enable_log2_test.patch \
+	file://powerpc_copysignl.patch \
+	file://argp-support.patch \
+	file://argp-headers.patch \
+	file://remove_attribute_optimize_Os.patch \
+	file://compile-arm-fork-with-O2.patch \
+	file://uclibc-execvpe.patch \
+	file://orign_path.patch \
+	"
+
+S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/uclibc/uclibc-git/utmp-locking.patch b/meta/recipes-core/uclibc/uclibc-git/utmp-locking.patch
new file mode 100644
index 0000000..85efaf2
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/utmp-locking.patch
@@ -0,0 +1,106 @@
+diff --git a/libc/misc/utmp/utent.c b/libc/misc/utmp/utent.c
+index 136ac69..a35bb2b 100644
+--- a/libc/misc/utmp/utent.c
++++ b/libc/misc/utmp/utent.c
+@@ -34,7 +34,7 @@ static const char default_file_name[] = _PATH_UTMP;
+ static const char *static_ut_name = default_file_name;
+ 
+ /* This function must be called with the LOCK held */
+-static void __setutent_nolock(void)
++static void __setutent_unlocked(void)
+ {
+     if (static_fd < 0) {
+ 	static_fd = open_not_cancel_2(static_ut_name, O_RDWR | O_CLOEXEC);
+@@ -56,12 +56,12 @@ static void __setutent_nolock(void)
+ static void __setutent(void)
+ {
+     __UCLIBC_MUTEX_LOCK(utmplock);
+-    __setutent_nolock();
++    __setutent_unlocked();
+     __UCLIBC_MUTEX_UNLOCK(utmplock);
+ }
+ #else
+ static void __setutent(void);
+-strong_alias(__setutent_nolock,__setutent)
++strong_alias(__setutent_unlocked,__setutent)
+ #endif
+ strong_alias(__setutent,setutent)
+ 
+@@ -70,7 +70,7 @@ strong_alias(__setutent,setutxent)
+ #endif
+ 
+ /* This function must be called with the LOCK held */
+-static struct utmp *__getutent_lock(void)
++static struct utmp *__getutent_unlocked(void)
+ {
+     if (static_fd < 0) {
+ 	__setutent();
+@@ -91,13 +91,13 @@ static struct utmp *__getutent(void)
+     struct utmp *ret;
+ 
+     __UCLIBC_MUTEX_LOCK(utmplock);
+-    ret = __getutent_lock();
++    ret = __getutent_unlocked();
+     __UCLIBC_MUTEX_UNLOCK(utmplock);
+     return ret;
+ }
+ #else
+ static struct utmp *__getutent(void);
+-strong_alias(__getutent_lock,__getutent)
++strong_alias(__getutent_unlocked,__getutent)
+ #endif
+ strong_alias(__getutent,getutent)
+ 
+@@ -123,7 +123,7 @@ strong_alias(__endutent,endutxent)
+ #endif
+ 
+ /* This function must be called with the LOCK held */
+-static struct utmp *__getutid_lock(const struct utmp *utmp_entry)
++static struct utmp *__getutid_unlocked(const struct utmp *utmp_entry)
+ {
+     struct utmp *lutmp;
+     unsigned type;
+@@ -133,7 +133,7 @@ static struct utmp *__getutid_lock(const struct utmp *utmp_entry)
+     type = utmp_entry->ut_type - 1;
+     type /= 4;
+ 
+-    while ((lutmp = __getutent()) != NULL) {
++    while ((lutmp = __getutent_unlocked()) != NULL) {
+ 	if (type == 0 && lutmp->ut_type == utmp_entry->ut_type)	{
+ 	    /* one of RUN_LVL, BOOT_TIME, NEW_TIME, OLD_TIME */
+ 	    return lutmp;
+@@ -152,13 +152,13 @@ static struct utmp *__getutid(const struct utmp *utmp_entry)
+     struct utmp *ret;
+ 
+     __UCLIBC_MUTEX_LOCK(utmplock);
+-    ret = __getutid_lock(utmp_entry);
++    ret = __getutid_unlocked(utmp_entry);
+     __UCLIBC_MUTEX_UNLOCK(utmplock);
+     return ret;
+ }
+ #else
+ static struct utmp *__getutid(const struct utmp *utmp_entry);
+-strong_alias(__getutid_lock,__getutid)
++strong_alias(__getutid_unlocked,__getutid)
+ #endif
+ strong_alias(__getutid,getutid)
+ 
+@@ -174,7 +174,7 @@ static struct utmp *__getutline(const struct utmp *utmp_entry)
+     struct utmp *lutmp;
+ 
+     __UCLIBC_MUTEX_LOCK(utmplock);
+-    while ((lutmp = __getutent()) != NULL) {
++    while ((lutmp = __getutent_unlocked()) != NULL) {
+ 	if (lutmp->ut_type == USER_PROCESS || lutmp->ut_type == LOGIN_PROCESS) {
+ 	    if (strncmp(lutmp->ut_line, utmp_entry->ut_line, sizeof(lutmp->ut_line)) == 0) {
+ 		break;
+@@ -200,7 +200,7 @@ static struct utmp *__pututline(const struct utmp *utmp_entry)
+        the file pointer where they want it, everything will work out. */
+     lseek(static_fd, (off_t) - sizeof(struct utmp), SEEK_CUR);
+ 
+-    if (__getutid(utmp_entry) != NULL)
++    if (__getutid_unlocked(utmp_entry) != NULL)
+ 	lseek(static_fd, (off_t) - sizeof(struct utmp), SEEK_CUR);
+     else
+ 	lseek(static_fd, (off_t) 0, SEEK_END);
+
diff --git a/meta/recipes-core/uclibc/uclibc-initial_0.9.33.bb b/meta/recipes-core/uclibc/uclibc-initial_0.9.33.bb
index 234b810..51afab2 100644
--- a/meta/recipes-core/uclibc/uclibc-initial_0.9.33.bb
+++ b/meta/recipes-core/uclibc/uclibc-initial_0.9.33.bb
@@ -1,5 +1,6 @@
 SECTION = "base"
-require uclibc_${PV}.bb
+require uclibc.inc
+require uclibc-${PV}.inc
 
 DEPENDS = "linux-libc-headers ncurses-native virtual/${TARGET_PREFIX}gcc-initial"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
diff --git a/meta/recipes-core/uclibc/uclibc-initial_git.bb b/meta/recipes-core/uclibc/uclibc-initial_git.bb
index 8e5c251..2226d25 100644
--- a/meta/recipes-core/uclibc/uclibc-initial_git.bb
+++ b/meta/recipes-core/uclibc/uclibc-initial_git.bb
@@ -1,5 +1,6 @@
 SECTION = "base"
-require uclibc_git.bb
+require uclibc.inc
+require uclibc-git.inc
 
 DEPENDS = "linux-libc-headers ncurses-native virtual/${TARGET_PREFIX}gcc-initial"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
diff --git a/meta/recipes-core/uclibc/uclibc-package.inc b/meta/recipes-core/uclibc/uclibc-package.inc
new file mode 100644
index 0000000..c1815f9
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-package.inc
@@ -0,0 +1,37 @@
+# Ensure the uclibc-dev package is processed before uclibc-staticdev to allow
+# *_nonshared.a libraries to be packaged in the uclibc-dev package.
+PACKAGES = "ldd uclibc-utils-dbg uclibc-utils uclibc-gconv uclibc-thread-db uclibc-argp uclibc-backtrace uclibc-libcrypt uclibc-libintl uclibc-libnsl uclibc-libresolv uclibc-libm uclibc-libdl uclibc-libutil uclibc-libpthread uclibc-librt ${PN}-dbg ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}"
+
+FILES_uclibc-libcrypt = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so"
+FILES_uclibc-libintl = "${base_libdir}/libintl*.so.* ${base_libdir}/libintl-*.so"
+FILES_uclibc-libnsl = "${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so"
+FILES_uclibc-libresolv = "${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so"
+FILES_uclibc-libm = "${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so"
+FILES_uclibc-libdl = "${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so"
+FILES_uclibc-libutil = "${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so"
+FILES_uclibc-libpthread = "${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so"
+FILES_uclibc-librt = "${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so"
+
+FILES_ldd = "${bindir}/ldd"
+FILES_uclibc-utils = "${bindir} ${sbindir}"
+FILES_uclibc-utils-dbg += "${bindir}/.debug ${sbindir}/.debug"
+FILES_uclibc-gconv = "${libdir}/gconv"
+FILES_uclibc-thread-db = "${base_libdir}/libthread_db*"
+FILES_uclibc-argp = "${base_libdir}/libuargp-*.so ${base_libdir}/libuargp*.so.*"
+FILES_uclibc-backtrace = "${base_libdir}/libubacktrace-*.so ${base_libdir}/libubacktrace*.so.*"
+
+# The last line (gdb and lib1) is for uclinux-uclibc builds
+uclibc_baselibs = "${base_libdir}/ld*.so.* ${base_libdir}/ld*.so \
+                   ${base_libdir}/libc*.so.* ${base_libdir}/libuClibc-*.so \
+                   ${libdir}/libc.gdb ${libdir}/libc ${base_libdir}/lib1.so \
+                  "
+FILES_SOLIBSDEV = "${libdir}/lib*${SOLIBSDEV}"
+FILES_${PN}-dev += "\
+        ${libdir}/lib*.so \
+        ${libdir}/*_nonshared.a \
+        ${libdir}/[S]*crt[1in].o \
+        ${libdir}/crtreloc*.o \
+        ${includedir}/*.h ${includedir}/*/*.h \
+       "
+FILES_${PN} = "${sysconfdir} ${uclibc_baselibs} /sbin/ldconfig \
+               ${libexecdir} ${datadir}/zoneinfo ${libdir}/locale"
diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 4dae303..863bf3a 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -16,10 +16,8 @@ file://${S}/test/regex/testregex.c;startline=1;endline=31;md5=234efb227d0a40677f
 INC_PR = "r8"
 
 require uclibc-config.inc
-STAGINGCC = "gcc-cross-intermediate"
-STAGINGCC_virtclass-nativesdk = "gcc-crosssdk-intermediate"
-PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
 
+PATH_prepend = "${STAGING_BINDIR_TOOLCHAIN}.${STAGINGCC}:"
 TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TCBOOTSTRAP}"
 
 # siteconfig.bbclass runs configure which needs a working compiler
@@ -40,63 +38,8 @@ sed -i -e 's# ${base_libdir}# ${SYSROOT_DESTDIR}${base_libdir}#g' -e 's# ${libdi
 # is a uclibc build.
 COMPATIBLE_HOST = ".*-uclibc.*"
 
-PROVIDES += "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
-DEPENDS = "virtual/${TARGET_PREFIX}binutils \
-           virtual/${TARGET_PREFIX}gcc-intermediate \
-           linux-libc-headers ncurses-native"
-RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
-
 INHIBIT_DEFAULT_DEPS = "1"
 
-# Ensure the uclibc-dev package is processed before uclibc-staticdev to allow
-# *_nonshared.a libraries to be packaged in the uclibc-dev package.
-PACKAGES = "ldd uclibc-utils-dbg uclibc-utils uclibc-gconv uclibc-thread-db uclibc-argp uclibc-backtrace uclibc-libcrypt uclibc-libintl uclibc-libnsl uclibc-libresolv uclibc-libm uclibc-libdl uclibc-libutil uclibc-libpthread uclibc-librt ${PN}-dbg ${PN}-dev ${PN}-staticdev ${PN}-doc ${PN}"
-
-FILES_uclibc-libcrypt = "${base_libdir}/libcrypt*.so.* ${base_libdir}/libcrypt-*.so"
-FILES_uclibc-libintl = "${base_libdir}/libintl*.so.* ${base_libdir}/libintl-*.so"
-FILES_uclibc-libnsl = "${base_libdir}/libnsl*.so.* ${base_libdir}/libnsl-*.so"
-FILES_uclibc-libresolv = "${base_libdir}/libresolv*.so.* ${base_libdir}/libresolv-*.so"
-FILES_uclibc-libm = "${base_libdir}/libm*.so.* ${base_libdir}/libm-*.so"
-FILES_uclibc-libdl = "${base_libdir}/libdl*.so.* ${base_libdir}/libdl-*.so"
-FILES_uclibc-libutil = "${base_libdir}/libutil*.so.* ${base_libdir}/libutil-*.so"
-FILES_uclibc-libpthread = "${base_libdir}/libpthread*.so.* ${base_libdir}/libpthread-*.so"
-FILES_uclibc-librt = "${base_libdir}/librt*.so.* ${base_libdir}/librt-*.so"
-
-FILES_ldd = "${bindir}/ldd"
-FILES_uclibc-utils = "${bindir} ${sbindir}"
-FILES_uclibc-utils-dbg += "${bindir}/.debug ${sbindir}/.debug"
-FILES_uclibc-gconv = "${libdir}/gconv"
-FILES_uclibc-thread-db = "${base_libdir}/libthread_db*"
-FILES_uclibc-argp = "${base_libdir}/libuargp-*.so ${base_libdir}/libuargp*.so.*"
-FILES_uclibc-backtrace = "${base_libdir}/libubacktrace-*.so ${base_libdir}/libubacktrace*.so.*"
-
-# The last line (gdb and lib1) is for uclinux-uclibc builds
-uclibc_baselibs = "${base_libdir}/ld*.so.* ${base_libdir}/ld*.so \
-                   ${base_libdir}/libc*.so.* ${base_libdir}/libuClibc-*.so \
-                   ${libdir}/libc.gdb ${libdir}/libc ${base_libdir}/lib1.so \
-                  "
-FILES_SOLIBSDEV = "${libdir}/lib*${SOLIBSDEV}"
-FILES_${PN}-dev += "\
-        ${libdir}/lib*.so \
-        ${libdir}/*_nonshared.a \
-        ${libdir}/[S]*crt[1in].o \
-        ${libdir}/crtreloc*.o \
-        ${includedir}/*.h ${includedir}/*/*.h \
-       "
-FILES_${PN} = "${sysconfdir} ${uclibc_baselibs} /sbin/ldconfig \
-               ${libexecdir} ${datadir}/zoneinfo ${libdir}/locale"
-
-RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
-# uclibc does not really have libsegfault but then using the one from glibc is also not
-# going to work. So we pretend that we have it to make bitbake not pull other recipes
-# to satisfy this dependency for the images/tasks
-
-RPROVIDES_${PN} += "libsegfault rtld(GNU_HASH)"
-
-SRC_URI = "\
-        http://www.uclibc.org/downloads/uClibc-${PV}.tar.bz2;name=uClibc-${PV} \
-        "
-
 # do_stage barfs on a CC with whitespace, therefore put the 'HOST_CC_ARCH' in
 # the CFLAGS (when building the utils).
 OEMAKE_NO_CC = "'STRIPTOOL=true' 'LD=${LD}'"
diff --git a/meta/recipes-core/uclibc/uclibc_0.9.33.bb b/meta/recipes-core/uclibc/uclibc_0.9.33.bb
index b72f9dd..c863896 100644
--- a/meta/recipes-core/uclibc/uclibc_0.9.33.bb
+++ b/meta/recipes-core/uclibc/uclibc_0.9.33.bb
@@ -1,24 +1,21 @@
 SRCREV="7810e4f8027b5c4c8ceec6fefec4eb779362ebb5"
 
 require uclibc.inc
+require uclibc-package.inc
+require uclibc-${PV}.inc
 
-PR = "${INC_PR}.2"
-PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
+STAGINGCC = "gcc-cross-intermediate"
+STAGINGCC_virtclass-nativesdk = "gcc-crosssdk-intermediate"
 
-SRC_URI = "git://uclibc.org/uClibc.git;branch=${PV};protocol=git \
-	file://uClibc.machine \
-	file://uClibc.distro \
-	file://uclibc_enable_log2_test.patch \
-	file://ldso_use_arm_dl_linux_resolve_in_thumb_mode.patch \
-	file://powerpc_copysignl.patch \
-	file://argp-support.patch \
-	file://argp-headers.patch \
-	file://remove_attribute_optimize_Os.patch \
-	file://compile-arm-fork-with-O2.patch \
-	file://uclibc-execvpe.patch \
-	file://orign_path.patch \
-	file://dup3.patch \
-	file://define-MSG_CMSG_CLOEXEC.patch \
-	"
+DEPENDS = "virtual/${TARGET_PREFIX}binutils \
+           virtual/${TARGET_PREFIX}gcc-intermediate \
+           linux-libc-headers ncurses-native"
 
-S = "${WORKDIR}/git"
+PROVIDES += "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
+RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
+RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
+# uclibc does not really have libsegfault but then using the one from glibc is also not
+# going to work. So we pretend that we have it to make bitbake not pull other recipes
+# to satisfy this dependency for the images/tasks
+
+RPROVIDES_${PN} += "libsegfault rtld(GNU_HASH)"
diff --git a/meta/recipes-core/uclibc/uclibc_git.bb b/meta/recipes-core/uclibc/uclibc_git.bb
index 1744c48..4e5b830 100644
--- a/meta/recipes-core/uclibc/uclibc_git.bb
+++ b/meta/recipes-core/uclibc/uclibc_git.bb
@@ -1,27 +1,22 @@
 SRCREV="0dcc13bf7a61b1d0708e5dd103d5515e0ffec79a"
 
 require uclibc.inc
+require uclibc-package.inc
+require uclibc-git.inc
 
-# We prefer a release version so DP -1 for this
-DEFAULT_PREFERENCE = "-1"
+STAGINGCC = "gcc-cross-intermediate"
+STAGINGCC_virtclass-nativesdk = "gcc-crosssdk-intermediate"
 
-PV = "0.9.33+git${SRCPV}"
-PR = "${INC_PR}.1"
-PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
+PROVIDES += "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
 
-FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-git' ], d)}"
+DEPENDS = "virtual/${TARGET_PREFIX}binutils \
+           virtual/${TARGET_PREFIX}gcc-intermediate \
+           linux-libc-headers ncurses-native"
 
-SRC_URI = "git://uclibc.org/uClibc.git;branch=master;protocol=git \
-	file://uClibc.machine \
-	file://uClibc.distro \
-	file://uclibc_enable_log2_test.patch \
-	file://powerpc_copysignl.patch \
-	file://argp-support.patch \
-	file://argp-headers.patch \
-	file://remove_attribute_optimize_Os.patch \
-	file://compile-arm-fork-with-O2.patch \
-	file://uclibc-execvpe.patch \
-	file://orign_path.patch \
-	"
+RDEPENDS_${PN}-dev = "linux-libc-headers-dev"
+RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
+# uclibc does not really have libsegfault but then using the one from glibc is also not
+# going to work. So we pretend that we have it to make bitbake not pull other recipes
+# to satisfy this dependency for the images/tasks
 
-S = "${WORKDIR}/git"
+RPROVIDES_${PN} += "libsegfault rtld(GNU_HASH)"
-- 
1.7.9.5




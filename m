Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3348.1628040489284150324
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Aug 2021 18:28:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F333B40C93
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Aug 2021 01:28:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dB_mNBDltXqu
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Aug 2021 01:28:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E4B1440BEC
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Aug 2021 01:28:07 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id F009E17464D;
	Tue,  3 Aug 2021 21:28:06 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH 1/2] meta: convert nested overrides leftovers to new syntax
Date: Tue,  3 Aug 2021 21:28:04 -0400
Message-Id: <1628040485-45946-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

Those were missed in previous rounds of automated and manual conversion.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta/classes/manpages.bbclass                      | 4 ++--
 meta/recipes-devtools/gcc/gcc-configure-common.inc | 2 +-
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc   | 8 ++++----
 meta/recipes-devtools/gcc/gcc-runtime.inc          | 2 +-
 meta/recipes-devtools/gdb/gdb-common.inc           | 8 ++++----
 meta/recipes-kernel/perf/perf.bb                   | 2 +-
 6 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/classes/manpages.bbclass b/meta/classes/manpages.bbclass
index 3a96659..64b7d8c 100644
--- a/meta/classes/manpages.bbclass
+++ b/meta/classes/manpages.bbclass
@@ -12,7 +12,7 @@ MAN_PKG ?= "${PN}-doc"
 # only add man-db to RDEPENDS when manual files are built and installed
 RDEPENDS:${MAN_PKG} += "${@bb.utils.contains('PACKAGECONFIG', 'manpages', 'man-db', '', d)}"
 
-pkg_postinst:append_${MAN_PKG} () {
+pkg_postinst:append:${MAN_PKG} () {
 	# only update manual page index caches when manual files are built and installed
 	if ${@bb.utils.contains('PACKAGECONFIG', 'manpages', 'true', 'false', d)}; then
 		if test -n "$D"; then
@@ -36,7 +36,7 @@ pkg_postinst:append_${MAN_PKG} () {
 	fi
 }
 
-pkg_postrm:append_${MAN_PKG} () {
+pkg_postrm:append:${MAN_PKG} () {
 	# only update manual page index caches when manual files are built and installed
 	if ${@bb.utils.contains('PACKAGECONFIG', 'manpages', 'true', 'false', d)}; then
 		mandb -q
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index e9bc8e4..e4cdb73 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -56,7 +56,7 @@ export gcc_cv_collect2_libs = 'none required'
 # in the config.log files (which might not get generated until do_compile
 # hence being missed by the insane do_configure check).
 
-EXTRA_OECONF:append_linux = " --enable-__cxa_atexit"
+EXTRA_OECONF:append:linux = " --enable-__cxa_atexit"
 
 EXTRA_OECONF:append:mips64 = " --with-abi=64 --with-arch-64=mips64 --with-tune-64=mips64"
 EXTRA_OECONF:append:mips64el = " --with-abi=64 --with-arch-64=mips64 --with-tune-64=mips64"
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 92fb1f3..495dd90 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -180,9 +180,9 @@ SYSTEMLIBS = "${target_base_libdir}/"
 SYSTEMLIBS1 = "${target_libdir}/"
 
 EXTRA_OECONF += "--enable-poison-system-directories"
-EXTRA_OECONF:remove_elf = "--with-sysroot=/not/exist"
-EXTRA_OECONF:remove_eabi = "--with-sysroot=/not/exist"
-EXTRA_OECONF:append_elf = " --without-headers --with-newlib"
-EXTRA_OECONF:append_eabi = " --without-headers --with-newlib"
+EXTRA_OECONF:remove:elf = "--with-sysroot=/not/exist"
+EXTRA_OECONF:remove:eabi = "--with-sysroot=/not/exist"
+EXTRA_OECONF:append:elf = " --without-headers --with-newlib"
+EXTRA_OECONF:append:eabi = " --without-headers --with-newlib"
 # gcc 4.7 needs -isystem
 export ARCH_FLAGS_FOR_TARGET = "--sysroot=${STAGING_DIR_TARGET} -isystem=${target_includedir}"
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 9e39d49..4839a66 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -281,7 +281,7 @@ SUMMARY:libitm-staticdev = "GNU transactional memory support library - static de
 
 require gcc-testsuite.inc
 
-EXTRA_OEMAKE:prepend_task-check = "${PARALLEL_MAKE} "
+EXTRA_OEMAKE:prepend:task-check = "${PARALLEL_MAKE} "
 
 MAKE_CHECK_TARGETS ??= "check-gcc ${@" ".join("check-target-" + i for i in d.getVar("RUNTIMETARGET").split())}"
 # prettyprinters and xmethods require gdb tooling
diff --git a/meta/recipes-devtools/gdb/gdb-common.inc b/meta/recipes-devtools/gdb/gdb-common.inc
index 01cca12..0fe7b4e 100644
--- a/meta/recipes-devtools/gdb/gdb-common.inc
+++ b/meta/recipes-devtools/gdb/gdb-common.inc
@@ -59,7 +59,7 @@ do_install:append() {
 	rm -f ${D}${infodir}/bfd.info
 }
 
-RRECOMMENDS:gdb:append_linux = " glibc-thread-db "
-RRECOMMENDS:gdb:append_linux-gnueabi = " glibc-thread-db "
-RRECOMMENDS:gdbserver:append_linux = " glibc-thread-db "
-RRECOMMENDS:gdbserver:append_linux-gnueabi = " glibc-thread-db "
+RRECOMMENDS:gdb:append:linux = " glibc-thread-db "
+RRECOMMENDS:gdb:append:linux-gnueabi = " glibc-thread-db "
+RRECOMMENDS:gdbserver:append:linux = " glibc-thread-db "
+RRECOMMENDS:gdbserver:append:linux-gnueabi = " glibc-thread-db "
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 8ebd7d7..f473272 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -110,7 +110,7 @@ EXTRA_OEMAKE += "\
 # that it has to be done this way rather than by passing -j1, since
 # perf's build system by default ignores any -j argument, but does
 # honour a JOBS variable.
-EXTRA_OEMAKE:append_task-configure = " JOBS=1"
+EXTRA_OEMAKE:append:task-configure = " JOBS=1"
 
 PERF_SRC ?= "Makefile \
              tools/arch \
-- 
2.7.4


Received: from mail-pd0-f174.google.com ([209.85.192.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1UWlzZ-0001wk-7Z
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Apr 2013 13:11:33 +0200
Received: by mail-pd0-f174.google.com with SMTP id y13so3159641pdi.33
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2013 03:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:subject
	:content-type; bh=R2Hfvv2KG25P1cBHny0qdblBrgilXn0uLa1mB04T15w=;
	b=gGfcoBwmEnSxIeABAC/8E/pH7f3qN7FXE5C87i6HW7k8owk/TWiF0drqsWt0sRpq7u
	G+nzaUpn14zNrEg7tnsT72b3yRzoI/GRwAtwHGJ2NjJODdnye5zG9mXvSfFMA0ysx64P
	Ss+x52mjO0w33pQybsqTaCdNJjL3spTKapVgIVn0EGhvJYJj4rTJ2t5tc/Gf0ySeDZfz
	FrB5KW8lq0jV8KOld8lnLSRuS4Dg9q7JB/3MSwEcZ9in+BL6kxyLxso9BqB+ggyrxN2c
	GhxKa9ux/x0W+UXm5h1CDNQsFPrR4xmEdxDmcihmHpvTFAdNbukUHyUU8bVJh0sbs6Zt
	jjGg==
X-Received: by 10.66.155.102 with SMTP id vv6mr41989305pab.64.1367232822919;
	Mon, 29 Apr 2013 03:53:42 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	ef4sm23583351pbd.38.2013.04.29.03.53.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 29 Apr 2013 03:53:41 -0700 (PDT)
Message-ID: <517E501F.1030809@gmail.com>
Date: Mon, 29 Apr 2013 20:49:03 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] guile: Update to 2.0.9
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
X-List-Received-Date: Mon, 29 Apr 2013 11:11:34 -0000
X-Groupsio-MsgNum: 38513
Content-Type: multipart/mixed; boundary="------------030603040706080004010408"

--------------030603040706080004010408
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

fix_parallel_build_issue.patch is now part of upstream.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
  .../guile/files/fix_parallel_build_issue.patch     |  20 ----
  meta/recipes-devtools/guile/guile_2.0.7.bb         | 103 
---------------------
  2 files changed, 123 deletions(-)
  delete mode 100644 
meta/recipes-devtools/guile/files/fix_parallel_build_issue.patch
  delete mode 100644 meta/recipes-devtools/guile/guile_2.0.7.bb

diff --git 
a/meta/recipes-devtools/guile/files/fix_parallel_build_issue.patch 
b/meta/recipes-devtools/guile/files/fix_parallel_build_issue.patch
deleted file mode 100644
index 761d51b..0000000
--- a/meta/recipes-devtools/guile/files/fix_parallel_build_issue.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Add explicit dependency for libpath.h on dynl.x which fixes a potential 
parallel build issue.
-
-Fixes Yocto bug# 3558
-
-Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
-
-Upstream-Status: Pending
-
-diff --git a/libguile/Makefile.am b/libguile/Makefile.am
-index e216435..016bd90 100644
---- a/libguile/Makefile.am
-+++ b/libguile/Makefile.am
-@@ -700,6 +700,7 @@ $(DOT_DOC_FILES) $(EXTRA_DOT_DOC_FILES): 
scmconfig.h snarf.h guile-snarf-docs.in
- error.x: cpp-E.c
- posix.x: cpp-SIG.c
- load.x: libpath.h
-+dynl.x: libpath.h
- - alldotdocfiles    = $(DOT_DOC_FILES) $(EXTRA_DOT_DOC_FILES)
- snarf2checkedtexi = GUILE_AUTO_COMPILE=0 
$(top_builddir)/meta/uninstalled-env guild snarf-check-and-output-texi
diff --git a/meta/recipes-devtools/guile/guile_2.0.7.bb 
b/meta/recipes-devtools/guile/guile_2.0.7.bb
deleted file mode 100644
index b8ab88e..0000000
--- a/meta/recipes-devtools/guile/guile_2.0.7.bb
+++ /dev/null
@@ -1,103 +0,0 @@
-SUMMARY = "Guile is the GNU Ubiquitous Intelligent Language for 
Extensions."
-DESCRIPTION = "Guile is the GNU Ubiquitous Intelligent Language for 
Extensions,\
- the official extension language for the GNU operating system.\
- Guile is a library designed to help programmers create flexible 
applications.\
- Using Guile in an application allows the application's functionality 
to be\
- extended by users or other programmers with plug-ins, modules, or 
scripts.\
- Guile provides what might be described as 'practical software freedom,'\
- making it possible for users to customize an application to meet their\
- needs without digging into the application's internals."
-
-HOMEPAGE = "http://www.gnu.org/software/guile/"
-SECTION = "devel"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504" -
-SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.xz \
- 
file://debian/0002-Mark-Unused-modules-are-removed-gc-test-as-unresolve.patch 
\
- 
file://debian/0003-Mark-mutex-with-owner-not-retained-threads-test-as-u.patch 
\
-           file://opensuse/guile-64bit.patch \
-           file://guile_2.0.6_fix_sed_error.patch \
-           file://arm_endianness.patch \
-           file://fix_parallel_build_issue.patch \
-           "
-
-# 
file://debian/0001-Change-guile-to-guile-X.Y-for-info-pages.patch
-#           file://opensuse/guile-turn-off-gc-test.patch -
-SRC_URI[md5sum] = "30ff9e94663a2e2098b52f8ce9d050b9"
-SRC_URI[sha256sum] = 
"6f278fa699685382ae51ba8bfad5840959e0af6414f3ad803d61131567bfa338"
-
-PR = "r1"
-
-inherit autotools gettext
-BBCLASSEXTEND = "native"
-
-DEPENDS = "libunistring bdwgc gmp libtool libffi"
-# add guile-native only to the target recipe's DEPENDS
-DEPENDS += "${@['guile-native libatomics-ops', ''][d.getVar('PN', True) 
!= 'guile']}"
-
-EXTRA_OECONF += "${@['--without-libltdl-prefix 
--without-libgmp-prefix', ''][bb.data.inherits_class('native',d)]}"
-
-do_configure_prepend() {
-	mkdir -p po
-}
-
-export GUILE_FOR_BUILD="${BUILD_SYS}-guile"
-
-do_compile_append() {
-	# just for target recipe
-	if [ "${PN}" = "guile" ]
-	then
-		sed -i -e s:${STAGING_DIR_TARGET}::g \
-	               -e s:/${TARGET_SYS}::g \
-	               -e s:-L/usr/lib::g \
-        	       -e s:-isystem/usr/include::g \
-	               -e s:,/usr/lib:,\$\{libdir\}:g \
-	                  meta/guile-2.0.pc
-	fi
-}
-
-do_install_append_class-native() {
-	install -m 0755  ${D}${bindir}/guile ${D}${bindir}/${HOST_SYS}-guile
-
-	create_wrapper ${D}/${bindir}/guile \
-		GUILE_LOAD_PATH=${STAGING_DATADIR_NATIVE}/guile/2.0 \
-		GUILE_LOAD_COMPILED_PATH=${STAGING_LIBDIR_NATIVE}/guile/2.0/ccache
-	create_wrapper ${D}${bindir}/${HOST_SYS}-guile \
-		GUILE_LOAD_PATH=${STAGING_DATADIR_NATIVE}/guile/2.0 \
-		GUILE_LOAD_COMPILED_PATH=${STAGING_LIBDIR_NATIVE}/guile/2.0/ccache
-}
-
-SYSROOT_PREPROCESS_FUNCS = "guile_cross_config"
-
-guile_cross_config() {
-	# this is only for target recipe
-	if [ "${PN}" = "guile" ]
-	then
-	        # Create guile-config returning target values instead of 
native values
-	        install -d ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}
-        	echo '#!'`which ${BUILD_SYS}-guile`$' \\\n--no-auto-compile -e 
main -s\n!#\n(define %guile-build-info '\'\( \
-			> guile-config.cross
-	        sed -n -e 's:^[ \t]*{[ \t]*":  (:' \
-			-e 's:",[ \t]*": . ":' \
-			-e 's:" *}, *\\:"):' \
-			-e 's:^.*cachedir.*$::' \
-			-e '/^  (/p' \
-			< libguile/libpath.h >> guile-config.cross
-	        echo '))' >> guile-config.cross
-	        cat meta/guile-config >> guile-config.cross
-	        install guile-config.cross ${STAGING_BINDIR_CROSS}/guile-config
-	fi
-}
-
-# Guile needs the compiled files to be newer than the source, and it won't
-# auto-compile into the prefix even if it can write there, so touch 
them here as
-# sysroot is managed.
-SSTATEPOSTINSTFUNCS += "guile_sstate_postinst"
-guile_sstate_postinst() {
-	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = 
"populate_sysroot_setscene" ]
-	then
-                find ${STAGING_DIR_TARGET}/${libdir}/guile/2.0/ccache 
-type f | xargs touch
-	fi
-}
-- 
1.8.2.1


--------------030603040706080004010408
Content-Type: text/plain; charset=windows-1252;
 name="Attached Message Part"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="Attached Message Part"



--------------030603040706080004010408--

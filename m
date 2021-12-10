Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4394C433EF
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 14:22:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.7656.1639146168766169370
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:22:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24DCF106F
	for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:22:47 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C31513F5A1
	for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:22:46 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 01/10] libtool: don't prefix the installed binary
Date: Fri, 10 Dec 2021 14:22:33 +0000
Message-Id: <20211210142242.2698587-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 14:22:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159530

Typically libtool installs the binary to 'libtool' in the source tree,
but we've got patches to rename this to ${host_sys}-libtool. As this
isn't standard any upstream that don't respect the LIBTOOL variable need
to be told explicitly where libtool is, which is a long-term maintenance
burden for us on top of the initial libtool patches.

The reasoning for this renaming appears to stem from the design to be
sure that we're using our new/patched libtool and not the host's binary.
However, now that we have HOSTTOOLS, there's no way to run the host
libtool so this argument is moot.

This patch removes the libtool renaming, follow-up patches remove the
required modifications from the rest of the recipes.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libtool/libtool-cross_2.4.6.bb            | 11 ++-
 .../libtool/libtool-native_2.4.6.bb           |  4 +-
 .../libtool/libtool/prefix.patch              | 98 -------------------
 .../libtool/nativesdk-libtool_2.4.6.bb        |  6 +-
 4 files changed, 11 insertions(+), 108 deletions(-)
 delete mode 100644 meta/recipes-devtools/libtool/libtool/prefix.patch

diff --git a/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb b/meta/=
recipes-devtools/libtool/libtool-cross_2.4.6.bb
index 4a43867b3ec..4448373afc4 100644
--- a/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb
+++ b/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb
@@ -1,7 +1,7 @@
 require libtool-${PV}.inc
=20
 PACKAGES =3D ""
-SRC_URI +=3D "file://prefix.patch"
+#SRC_URI +=3D "file://prefix.patch"
 SRC_URI +=3D "file://fixinstall.patch"
=20
 datadir =3D "${STAGING_DIR_TARGET}${target_datadir}"
@@ -22,15 +22,16 @@ do_configure:prepend () {
 # Find references to LTCC=3D"ccache xxx-gcc" and CC=3D"ccache xxx-gcc"
 #
 do_install () {
+	ln -s false ${D}
 	install -d ${D}${bindir_crossscripts}/
-	install -m 0755 ${HOST_SYS}-libtool ${D}${bindir_crossscripts}/${HOST_S=
YS}-libtool
+	install -m 0755 libtool ${D}${bindir_crossscripts}/libtool
 	sed -e 's@^\(predep_objects=3D"\).*@\1"@' \
 	    -e 's@^\(postdep_objects=3D"\).*@\1"@' \
 	    -e 's@^CC=3D"ccache.@CC=3D"@' \
 	    -e 's@^LTCC=3D"ccache.@LTCC=3D"@' \
-	    -i ${D}${bindir_crossscripts}/${HOST_SYS}-libtool
-	sed -i '/^archive_cmds=3D/s/\-nostdlib//g' ${D}${bindir_crossscripts}/$=
{HOST_SYS}-libtool
-	sed -i '/^archive_expsym_cmds=3D/s/\-nostdlib//g' ${D}${bindir_crossscr=
ipts}/${HOST_SYS}-libtool
+	    -i ${D}${bindir_crossscripts}/libtool
+	sed -i '/^archive_cmds=3D/s/\-nostdlib//g' ${D}${bindir_crossscripts}/l=
ibtool
+	sed -i '/^archive_expsym_cmds=3D/s/\-nostdlib//g' ${D}${bindir_crossscr=
ipts}/libtool
 	GREP=3D'/bin/grep' SED=3D'sed' ${S}/build-aux/inline-source libtoolize =
> ${D}${bindir_crossscripts}/libtoolize
 	chmod 0755 ${D}${bindir_crossscripts}/libtoolize
 	install -d ${D}${target_datadir}/libtool/build-aux/
diff --git a/meta/recipes-devtools/libtool/libtool-native_2.4.6.bb b/meta=
/recipes-devtools/libtool/libtool-native_2.4.6.bb
index 3b20ce3e69f..c68527f2609 100644
--- a/meta/recipes-devtools/libtool/libtool-native_2.4.6.bb
+++ b/meta/recipes-devtools/libtool/libtool-native_2.4.6.bb
@@ -2,7 +2,7 @@ require libtool-${PV}.inc
=20
 DEPENDS =3D ""
=20
-SRC_URI +=3D "file://prefix.patch"
+#SRC_URI +=3D "file://prefix.patch"
=20
 inherit native
=20
@@ -18,5 +18,5 @@ do_configure:prepend () {
 do_install () {
 	autotools_do_install
 	install -d ${D}${bindir}/
-	install -m 0755 ${HOST_SYS}-libtool ${D}${bindir}/${HOST_SYS}-libtool
+	install -m 0755 libtool ${D}${bindir}/libtool
 }
diff --git a/meta/recipes-devtools/libtool/libtool/prefix.patch b/meta/re=
cipes-devtools/libtool/libtool/prefix.patch
deleted file mode 100644
index a73df2e4a7a..00000000000
--- a/meta/recipes-devtools/libtool/libtool/prefix.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-Renames "libtool" -> "${TARGET_PREFIX}libtool" which makes sure
-it can't be confused with the host libtool.
-
-Originally by: RP
-
-Updated: Date: 2010/06/28
-Nitin A Kamble <nitin.a.kamble@intel.com>
-
-It also adjusts libtool so that the header at the script is used for=20
-script execution and not thevalue of $SHELL. This is because many=20
-Makefiles change $SHELL so dash can get used to execute what is=20
-otherwise configured as a bash shell script. Since we don't need to=20
-execute scipts this way on any system I'm aware of us building upon,=20
-the simplest fix is just to remove $SHELL.
-
-Updated: Date: 2011/11/09
-RP
-
-Updated by: Robert Yang <liezhi.yang@windriver.com>
-
-diff --git a/Makefile.am b/Makefile.am
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -31,7 +31,7 @@ SUBDIRS			=3D .
- DIST_SUBDIRS		=3D $(SUBDIRS)
- EXTRA_DIST		=3D
-=20
--BUILT_SOURCES		=3D libtool libtoolize
-+BUILT_SOURCES		=3D $(host_alias)-libtool libtoolize
-=20
- CLEANFILES		=3D
- MOSTLYCLEANFILES	=3D
-@@ -67,7 +67,7 @@ build_scripts	=3D $(srcdir)/$(aux_dir)/announce-gen \
-=20
- EXTRA_DIST     +=3D bootstrap bootstrap.conf $(build_scripts) cfg.mk ma=
int.mk \
- 		  GNUmakefile
--CLEANFILES     +=3D libtool libtoolize
-+CLEANFILES     +=3D $(host_alias)-libtool libtoolize
-=20
- ## If a file is named several times below, and especially if it
- ## is a distributed file created during Libtool bootstrap, we
-@@ -276,7 +276,7 @@ configure_edit =3D $(bootstrap_edit) \
- 	-e 's|@srcdir\@|$(srcdir)|g'
-=20
- # The libtool distributor and the standalone libtool script.
--bin_SCRIPTS =3D libtool
-+bin_SCRIPTS =3D $(host_alias)-libtool
-=20
- libtoolize: $(libtoolize_in) $(config_status)
- 	$(AM_V_at)rm -f '$@'
-@@ -287,7 +287,7 @@ libtoolize: $(libtoolize_in) $(config_status)
- # We used to do this with a 'stamp-vcl' file, but non-gmake builds
- # would rerun configure on every invocation, so now we manually
- # check the version numbers from the build rule when necessary.
--libtool: $(ltmain_sh) $(config_status) $(dotversion)
-+$(host_alias)-libtool: $(ltmain_sh) $(config_status) $(dotversion)
- 	@$(rebuild); \
- 	if test -f '$@'; then \
- 	  eval `'$(SED)' -n '/^package_revision=3D/p' '$@'`; \
-@@ -731,12 +731,12 @@ TESTS_ENVIRONMENT =3D MAKE=3D"$(MAKE)" CC=3D"$(CC)=
" CFLAGS=3D"$(CFLAGS)" \
-=20
- BUILDCHECK_ENVIRONMENT =3D _lt_pkgdatadir=3D"$(abs_top_srcdir)" \
- 	LIBTOOLIZE=3D"$(abs_top_builddir)/libtoolize" \
--	LIBTOOL=3D"$(abs_top_builddir)/libtool" \
-+	LIBTOOL=3D"$(abs_top_builddir)/$(host_alias)-libtool" \
- 	tst_aclocaldir=3D"$(abs_top_srcdir)/m4"
-=20
- INSTALLCHECK_ENVIRONMENT =3D \
- 	LIBTOOLIZE=3D"$(bindir)/`echo libtoolize |$(SED) '$(program_transform_=
name)'`" \
--	LIBTOOL=3D"$(bindir)/`echo libtool |$(SED) '$(program_transform_name)'=
`" \
-+	LIBTOOL=3D"$(bindir)/`echo $(host_alias)-libtool |$(SED) '$(program_tr=
ansform_name)'`" \
- 	LTDLINCL=3D"-I$(includedir)" \
- 	LIBLTDL=3D"$(libdir)/libltdl.la" \
- 	tst_aclocaldir=3D"$(aclocaldir)"
-diff --git a/m4/libtool.m4 b/m4/libtool.m4
---- a/m4/libtool.m4
-+++ b/m4/libtool.m4
-@@ -86,7 +86,8 @@ _LT_SET_OPTIONS([$0], [$1])
- LIBTOOL_DEPS=3D$ltmain
-=20
- # Always use our own libtool.
--LIBTOOL=3D'$(SHELL) $(top_builddir)/libtool'
-+LIBTOOL=3D'$(top_builddir)'
-+LIBTOOL=3D"$LIBTOOL/${host_alias}-libtool"
- AC_SUBST(LIBTOOL)dnl
-=20
- _LT_SETUP
-@@ -199,7 +200,7 @@ aix3*)
- esac
-=20
- # Global variables:
--ofile=3Dlibtool
-+ofile=3D${host_alias}-libtool
- can_build_shared=3Dyes
-=20
- # All known linkers require a '.a' archive for static linking (except M=
SVC,
diff --git a/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.6.bb b/m=
eta/recipes-devtools/libtool/nativesdk-libtool_2.4.6.bb
index e3ad6721fdf..cede2092db0 100644
--- a/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.6.bb
+++ b/meta/recipes-devtools/libtool/nativesdk-libtool_2.4.6.bb
@@ -2,7 +2,7 @@ require libtool-${PV}.inc
=20
 FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/libtool:"
=20
-SRC_URI +=3D "file://prefix.patch"
+#SRC_URI +=3D "file://prefix.patch"
 SRC_URI +=3D "file://fixinstall.patch"
=20
 inherit nativesdk
@@ -20,12 +20,12 @@ do_configure:prepend () {
 do_install () {
 	autotools_do_install
 	install -d ${D}${bindir}/
-	install -m 0755 ${HOST_SYS}-libtool ${D}${bindir}/
+	install -m 0755 libtool ${D}${bindir}/
 }
=20
 SYSROOT_PREPROCESS_FUNCS +=3D "libtoolnativesdk_sysroot_preprocess"
=20
 libtoolnativesdk_sysroot_preprocess () {
 	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-	install -m 755 ${D}${bindir}/${HOST_SYS}-libtool ${SYSROOT_DESTDIR}${bi=
ndir_crossscripts}/${HOST_SYS}-libtool
+	install -m 755 ${D}${bindir}/libtool ${SYSROOT_DESTDIR}${bindir_crosssc=
ripts}/libtool
 }
--=20
2.25.1



Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C25ECDE001
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 13:31:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11361.1782394273816362352
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 06:31:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=qldFJ9Kg;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: luca.fancellu@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE5AF165C
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 06:31:08 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.2.203.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CEA133F62B
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 06:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782394273; bh=FJgh+1dVzVGhqryScunPxHL8DtpOdtwwu6bN4L9+6Pg=;
	h=From:To:Subject:Date:From;
	b=qldFJ9KgAPYx5G89PBgnTte5ZXqWMX0h+2URtI+HwYGyehrZ+X7I1v1cjzPMnvnsk
	 Ey1zVndj0URDWkC+UvkY3u3NTCIqjz5rN9posqI2xd/4GqIgVQdHO13mSf7K1RD6kN
	 c8BWUMhOn5wrlKnv2OeGAkpWXDz+6VOHQ8qpxq+g=
From: Luca Fancellu <luca.fancellu@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ncurses: fix split wide library and pkg-config installs
Date: Thu, 25 Jun 2026 14:31:06 +0100
Message-Id: <20260625133106.2108430-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 13:31:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239564

Add a patch which makes generated install/install.libs targets depend
on the installed shared-library set. Without this, a wide install after
a narrow install can install libticw and the secondary wide libraries
while leaving libncursesw.so missing.

Also patch the misc install rule to regenerate pkg-config files during
install.libs instead of relying on the pc-files stamp. The stamp is not
one of the generated .pc files, so an existing build tree can contain a
stale stamp while the .pc files that must be installed into a clean
DESTDIR are missing.

Recipes such as procps use pkg-config to detect ncurses, so missing
ncursesw.pc makes configure fail with errors like
`ncurses support missing/incomplete`.

Fixing the misc Makefile keeps the install target self-contained and
avoids a recipe-side workaround that deletes ncurses' internal pc-files
stamp before rerunning the misc install.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 ...depend-on-installed-shared-libraries.patch | 267 ++++++++++++++++++
 ...rate-pkg-config-files-before-install.patch |  38 +++
 meta/recipes-core/ncurses/ncurses_6.6.bb      |   2 +
 3 files changed, 307 insertions(+)
 create mode 100644 meta/recipes-core/ncurses/files/0004-Make-install.lib=
s-depend-on-installed-shared-libraries.patch
 create mode 100644 meta/recipes-core/ncurses/files/0005-misc-Always-rege=
nerate-pkg-config-files-before-install.patch

diff --git a/meta/recipes-core/ncurses/files/0004-Make-install.libs-depen=
d-on-installed-shared-libraries.patch b/meta/recipes-core/ncurses/files/0=
004-Make-install.libs-depend-on-installed-shared-libraries.patch
new file mode 100644
index 000000000000..00276fac0594
--- /dev/null
+++ b/meta/recipes-core/ncurses/files/0004-Make-install.libs-depend-on-in=
stalled-shared-libraries.patch
@@ -0,0 +1,267 @@
+From f2c153984dceb8b25a7612b744598cf01ded809f Mon Sep 17 00:00:00 2001
+From: Luca Fancellu <luca.fancellu@arm.com>
+Date: Thu, 11 Jun 2026 10:46:21 +0100
+Subject: [PATCH] Make install.libs depend on installed shared libraries
+
+The generated library Makefiles list the build-tree library outputs in
+LIBRARIES, but there is no matching aggregate for the installed shared
+libraries.  Instead, install and install.libs get their installed-file
+prerequisites only from the per-library rules emitted later.
+
+That can miss a library in split installs.  For example, after installin=
g a
+narrow build first, $(LIBDIR)/libtinfo.so.$(REL_VERSION) already exists.=
  A
+subsequent wide install.libs with --with-termlib=3Dtinfo --with-ticlib c=
an
+install libticw, libpanelw, libmenuw and libformw, while not relinking
+$(LIBDIR)/libncursesw.so.$(REL_VERSION).
+
+Track the installed shared-library targets separately and make install a=
nd
+install.libs depend on that aggregate.  This keeps the generated install=
 target
+consistent with LIBRARIES and forces all installed shared libraries in t=
he
+directory to be considered.
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bug-ncurs=
es/2026-06/msg00043.html]
+Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
+---
+ aclocal.m4          | 13 +++++++++++++
+ c++/Makefile.in     |  4 ++++
+ configure           | 13 +++++++++++++
+ form/Makefile.in    |  4 ++++
+ menu/Makefile.in    |  4 ++++
+ ncurses/Makefile.in |  4 ++++
+ panel/Makefile.in   |  4 ++++
+ 7 files changed, 46 insertions(+)
+
+diff --git a/aclocal.m4 b/aclocal.m4
+index 1463b247fb92..dbd521a88978 100644
+--- a/aclocal.m4
++++ b/aclocal.m4
+@@ -4838,6 +4838,7 @@ do
+=20
+ 		SHARED_LIB=3D
+ 		Libs_To_Make=3D
++		Libs_To_Install=3D
+ 		cf_awk_program=3D
+ 		if test -n "${cf_cv_abi_default}" && test "x${cf_cv_abi_default}" !=3D=
 "x5"
+ 		then
+@@ -4951,12 +4952,18 @@ CF_EOF
+ 			fi
+ 			cf_add_lib=3D"../lib/${cf_prefix}${cf_libname}${cf_suffix}"
+ 			Libs_To_Make=3D"$Libs_To_Make $cf_add_lib"
++			if test "$cf_item" =3D shared && test "$cf_dir" !=3D c++
++			then
++				cf_add_inst=3D'$(LIBDIR)'"/${cf_prefix}${cf_libname}${cf_suffix}"
++				Libs_To_Install=3D"$Libs_To_Install $cf_add_inst"
++			fi
+ 		done
+=20
+ 		if test "$cf_dir" =3D ncurses ; then
+ 			cf_subsets=3D"$LIB_SUBSETS"
+ 			cf_r_parts=3D"$cf_subsets"
+ 			cf_liblist=3D"$Libs_To_Make"
++			cf_instlist=3D"$Libs_To_Install"
+=20
+ 			while test -n "$cf_r_parts"
+ 			do
+@@ -4967,9 +4974,11 @@ CF_EOF
+ 					case "$cf_l_parts" in
+ 					(*termlib*)
+ 						cf_add_lib=3D`echo "$cf_liblist" |sed -e s%${LIB_NAME}${ABI_SUFFI=
X}%${TINFO_LIB_SUFFIX}%g`
++						cf_add_inst=3D`echo "$cf_instlist" |sed -e s%${LIB_NAME}${ABI_SUF=
FIX}%${TINFO_LIB_SUFFIX}%g`
+ 						;;
+ 					(*ticlib*)
+ 						cf_add_lib=3D`echo "$cf_liblist" |sed -e s%${LIB_NAME}${ABI_SUFFI=
X}%${TICS_LIB_SUFFIX}%g`
++						cf_add_inst=3D`echo "$cf_instlist" |sed -e s%${LIB_NAME}${ABI_SUF=
FIX}%${TICS_LIB_SUFFIX}%g`
+ 						;;
+ 					(*)
+ 						break
+@@ -4978,6 +4987,9 @@ CF_EOF
+ 					if test -n "$cf_add_lib"; then
+ 						Libs_To_Make=3D"$cf_add_lib $Libs_To_Make"
+ 					fi
++					if test -n "$cf_add_inst"; then
++						Libs_To_Install=3D"$cf_add_inst $Libs_To_Install"
++					fi
+ 				else
+ 					break
+ 				fi
+@@ -5014,6 +5026,7 @@ CF_EOF
+ 		fi
+=20
+ 		sed -e "s%@Libs_To_Make@%$Libs_To_Make%" \
++		    -e "s%@Libs_To_Install@%$Libs_To_Install%" \
+ 		    -e "s%@SHARED_LIB@%$SHARED_LIB%" \
+ 			"$cf_dir/Makefile" >$cf_dir/Makefile.out
+ 		mv "$cf_dir/Makefile.out" "$cf_dir/Makefile"
+diff --git a/c++/Makefile.in b/c++/Makefile.in
+index f03468bb519b..15746e20ca42 100644
+--- a/c++/Makefile.in
++++ b/c++/Makefile.in
+@@ -129,6 +129,7 @@ LIBNAME_NORMAL	=3D @LIB_PREFIX@$(LIBROOT)@ABI_SUFFIX=
@.a
+ LIBNAME		=3D @LIB_PREFIX@$(LIBROOT)@CXX_LIB_SUFFIX@
+=20
+ LIBRARIES	=3D @Libs_To_Make@
++INSTALL_LIBRARIES =3D @Libs_To_Install@
+=20
+ LINT		=3D @LINT@
+ LINT_OPTS	=3D @LINT_OPTS@
+@@ -184,6 +185,9 @@ AUTO_SRC	=3D \
+ all \
+ libs ::		$(AUTO_SRC) $(LIBRARIES)
+=20
++install \
++install.libs :: $(INSTALL_LIBRARIES)
++
+ @MAKE_TESTS@all ::		demo$x
+=20
+ depend :
+diff --git a/configure b/configure
+index 48ad381ffd83..f1351415cbb9 100755
+--- a/configure
++++ b/configure
+@@ -31344,6 +31344,7 @@ do
+=20
+ 		SHARED_LIB=3D
+ 		Libs_To_Make=3D
++		Libs_To_Install=3D
+ 		cf_awk_program=3D
+ 		if test -n "${cf_cv_abi_default}" && test "x${cf_cv_abi_default}" !=3D=
 "x5"
+ 		then
+@@ -31546,12 +31547,18 @@ eval cf_libname=3D"\$${cf_map_lib_basename}_NA=
ME"
+ 			fi
+ 			cf_add_lib=3D"../lib/${cf_prefix}${cf_libname}${cf_suffix}"
+ 			Libs_To_Make=3D"$Libs_To_Make $cf_add_lib"
++			if test "$cf_item" =3D shared && test "$cf_dir" !=3D c++
++			then
++				cf_add_inst=3D'$(LIBDIR)'"/${cf_prefix}${cf_libname}${cf_suffix}"
++				Libs_To_Install=3D"$Libs_To_Install $cf_add_inst"
++			fi
+ 		done
+=20
+ 		if test "$cf_dir" =3D ncurses ; then
+ 			cf_subsets=3D"$LIB_SUBSETS"
+ 			cf_r_parts=3D"$cf_subsets"
+ 			cf_liblist=3D"$Libs_To_Make"
++			cf_instlist=3D"$Libs_To_Install"
+=20
+ 			while test -n "$cf_r_parts"
+ 			do
+@@ -31562,9 +31569,11 @@ eval cf_libname=3D"\$${cf_map_lib_basename}_NAM=
E"
+ 					case "$cf_l_parts" in
+ 					(*termlib*)
+ 						cf_add_lib=3D`echo "$cf_liblist" |sed -e s%${LIB_NAME}${ABI_SUFFI=
X}%${TINFO_LIB_SUFFIX}%g`
++						cf_add_inst=3D`echo "$cf_instlist" |sed -e s%${LIB_NAME}${ABI_SUF=
FIX}%${TINFO_LIB_SUFFIX}%g`
+ 						;;
+ 					(*ticlib*)
+ 						cf_add_lib=3D`echo "$cf_liblist" |sed -e s%${LIB_NAME}${ABI_SUFFI=
X}%${TICS_LIB_SUFFIX}%g`
++						cf_add_inst=3D`echo "$cf_instlist" |sed -e s%${LIB_NAME}${ABI_SUF=
FIX}%${TICS_LIB_SUFFIX}%g`
+ 						;;
+ 					(*)
+ 						break
+@@ -31573,6 +31582,9 @@ eval cf_libname=3D"\$${cf_map_lib_basename}_NAME=
"
+ 					if test -n "$cf_add_lib"; then
+ 						Libs_To_Make=3D"$cf_add_lib $Libs_To_Make"
+ 					fi
++					if test -n "$cf_add_inst"; then
++						Libs_To_Install=3D"$cf_add_inst $Libs_To_Install"
++					fi
+ 				else
+ 					break
+ 				fi
+@@ -31609,6 +31621,7 @@ eval cf_libname=3D"\$${cf_map_lib_basename}_NAME=
"
+ 		fi
+=20
+ 		sed -e "s%@Libs_To_Make@%$Libs_To_Make%" \
++		    -e "s%@Libs_To_Install@%$Libs_To_Install%" \
+ 		    -e "s%@SHARED_LIB@%$SHARED_LIB%" \
+ 			"$cf_dir/Makefile" >$cf_dir/Makefile.out
+ 		mv "$cf_dir/Makefile.out" "$cf_dir/Makefile"
+diff --git a/form/Makefile.in b/form/Makefile.in
+index 753e42faad72..f75ad26678fd 100644
+--- a/form/Makefile.in
++++ b/form/Makefile.in
+@@ -130,6 +130,7 @@ ABI_VERSION	=3D @cf_cv_abi_version@
+ RANLIB		=3D @LIB_PREP@
+=20
+ LIBRARIES	=3D @Libs_To_Make@
++INSTALL_LIBRARIES =3D @Libs_To_Install@
+=20
+ LINT		=3D @LINT@
+ LINT_OPTS	=3D @LINT_OPTS@
+@@ -156,6 +157,9 @@ all \
+ libs \
+ install ::	$(AUTO_SRC) $(LIBRARIES)
+=20
++install \
++install.libs :: $(INSTALL_LIBRARIES)
++
+ check ::
+ 	@echo "no unit-test implemented"
+=20
+diff --git a/menu/Makefile.in b/menu/Makefile.in
+index 5f96e76f944c..34cec6f51268 100644
+--- a/menu/Makefile.in
++++ b/menu/Makefile.in
+@@ -130,6 +130,7 @@ ABI_VERSION	=3D @cf_cv_abi_version@
+ RANLIB		=3D @LIB_PREP@
+=20
+ LIBRARIES	=3D @Libs_To_Make@
++INSTALL_LIBRARIES =3D @Libs_To_Install@
+=20
+ LINT		=3D @LINT@
+ LINT_OPTS	=3D @LINT_OPTS@
+@@ -158,6 +159,9 @@ all \
+ libs \
+ install ::	$(AUTO_SRC) $(LIBRARIES)
+=20
++install \
++install.libs :: $(INSTALL_LIBRARIES)
++
+ check ::
+ 	@echo "no unit-test implemented"
+=20
+diff --git a/ncurses/Makefile.in b/ncurses/Makefile.in
+index fbe2153baa7e..ac35a8274702 100644
+--- a/ncurses/Makefile.in
++++ b/ncurses/Makefile.in
+@@ -150,6 +150,7 @@ ABI_VERSION	=3D @cf_cv_abi_version@
+ RANLIB		=3D @LIB_PREP@
+=20
+ LIBRARIES	=3D @Libs_To_Make@
++INSTALL_LIBRARIES =3D @Libs_To_Install@
+=20
+ LINT		=3D @LINT@
+ LINT_OPTS	=3D @LINT_OPTS@
+@@ -235,6 +236,9 @@ all libs ::	$(AUTO_SRC) ../lib $(LIBRARIES)
+=20
+ @CHECK_BUILD@all libs ::	report_offsets$(BUILD_EXEEXT)
+=20
++install \
++install.libs :: $(INSTALL_LIBRARIES)
++
+ sources:	$(AUTO_SRC)
+=20
+ $(BINDIR) \
+diff --git a/panel/Makefile.in b/panel/Makefile.in
+index 53abc3625f57..e16a5dd43525 100644
+--- a/panel/Makefile.in
++++ b/panel/Makefile.in
+@@ -132,6 +132,7 @@ ABI_VERSION	=3D @cf_cv_abi_version@
+ RANLIB		=3D @LIB_PREP@
+=20
+ LIBRARIES	=3D @Libs_To_Make@
++INSTALL_LIBRARIES =3D @Libs_To_Install@
+=20
+ LINT		=3D @LINT@
+ LINT_OPTS	=3D @LINT_OPTS@
+@@ -158,6 +159,9 @@ all \
+ libs \
+ install ::	$(AUTO_SRC) $(LIBRARIES)
+=20
++install \
++install.libs :: $(INSTALL_LIBRARIES)
++
+ check ::
+ 	@echo "no unit-test implemented"
+=20
+--=20
+2.34.1
diff --git a/meta/recipes-core/ncurses/files/0005-misc-Always-regenerate-=
pkg-config-files-before-install.patch b/meta/recipes-core/ncurses/files/0=
005-misc-Always-regenerate-pkg-config-files-before-install.patch
new file mode 100644
index 000000000000..48831848768f
--- /dev/null
+++ b/meta/recipes-core/ncurses/files/0005-misc-Always-regenerate-pkg-con=
fig-files-before-install.patch
@@ -0,0 +1,38 @@
+From 2ddc64cb7814a2b7dd3ebaafcb66c5e6fbec75b6 Mon Sep 17 00:00:00 2001
+From: Luca Fancellu <luca.fancellu@arm.com>
+Date: Sun, 21 Jun 2026 09:52:00 +0100
+Subject: [PATCH] misc: Always regenerate pkg-config files before install
+
+The pc-files target is a stamp file rather than one of the generated
+pkg-config files.  If the stamp remains in the build directory while the
+generated .pc files are missing, install.libs can skip gen-pkgconfig and=
 then
+silently install no pkg-config files because the install loop ignores mi=
ssing
+files.
+
+Regenerate the pkg-config files directly from install and install.libs i=
nstead
+of relying on the stamp target.  The pc-files stamp remains useful for a=
ll and
+sources, but installation now guarantees that the files it is about to c=
opy
+exist in the build tree.
+
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bug-ncurs=
es/2026-06/msg00044.html]
+Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
+---
+ misc/Makefile.in | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/misc/Makefile.in b/misc/Makefile.in
+index 31fc7f664860..90da6bba73c5 100644
+--- a/misc/Makefile.in
++++ b/misc/Makefile.in
+@@ -153,7 +153,8 @@ install.libs :: $(BINDIR) ncurses-config
+ # pkg-config is not installed.  Work around that by creating the librar=
y
+ # directory during this rule:
+ @MAKE_PC_FILES@install \
+-@MAKE_PC_FILES@install.libs :: pc-files
++@MAKE_PC_FILES@install.libs ::
++@MAKE_PC_FILES@	$(SHELL) ./gen-pkgconfig
+ @MAKE_PC_FILES@	@$(SHELL) -c 'case "x$(PKG_CONFIG_LIBDIR)" in \
+ @MAKE_PC_FILES@		x@GLOB_FULLPATH_POSIX@|x@GLOB_FULLPATH_OTHER@) \
+ @MAKE_PC_FILES@			mkdir -p $(INSTALL_CONFIG); \
+--=20
+2.43.0
diff --git a/meta/recipes-core/ncurses/ncurses_6.6.bb b/meta/recipes-core=
/ncurses/ncurses_6.6.bb
index 7459e445f8c7..1d48a34e8250 100644
--- a/meta/recipes-core/ncurses/ncurses_6.6.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.6.bb
@@ -3,6 +3,8 @@ require ncurses.inc
 SRC_URI +=3D "file://0001-tic-hang.patch \
            file://0002-configure-reproducible.patch \
            file://0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-genera=
ted.patch \
+           file://0004-Make-install.libs-depend-on-installed-shared-libr=
aries.patch \
+           file://0005-misc-Always-regenerate-pkg-config-files-before-in=
stall.patch \
            file://exit_prototype.patch \
            file://0001-do-not-create-symlink-to-terminfo-under-usr-lib.p=
atch \
            "
--=20
2.34.1



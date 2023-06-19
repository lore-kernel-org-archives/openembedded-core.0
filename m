Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 469CAEB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 11:49:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.5586.1687175369647393774
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jun 2023 04:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 303D612FC;
	Mon, 19 Jun 2023 04:50:13 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CB0233F64C;
	Mon, 19 Jun 2023 04:49:28 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH v2] ghostscript: mostly rewrite recipe
Date: Mon, 19 Jun 2023 12:49:27 +0100
Message-Id: <20230619114927.923520-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 11:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183102

From: Ross Burton <ross.burton@arm.com>

This started as a patch cleanup but escalated rapidly.

Remove unneeded patches:
- mkdir-p.patch isn't needed now the Makefiles appear to have the correct
  dependencies.
- ghostscript-9.15-parallel-make.patch appears to be unneeded for the sam=
e
  reason
- base-genht.c-add-a-preprocessor-define-to-allow-fope.patch isn't needed
- cups-no-gcrypt.patch isn't needed
- do-not-check-local-libpng-source.patch can be replaced by deleting
  the libpng/ directory, as is already done for jpeg/
- ghostscript-9.21-native-fix-disable-system-libtiff.patch is not needed
  when we stop doing native builds (see below)

Remove the need for ghostscript-native to build and install tools that
are needed at target build-time: ghostscript can do this itself.  Remove
the BBCLASSEXTEND and all of the native overrides.

Inherit pkgconfig and explicitly tell configure to use the pkgconfig
binary: unless told otherwise this configure will refuse to use an
unprefixed pkgconfig in cross builds.

Review DEPENDS and add missing freetype and zlib dependencies.

Ghostcript will use the embedded copies of libraries over system
libraries, so extend the deletion of jpeg and libpng to include expat,
freetype, and cups as we want to link to our build of those. We can't
delete zlib as it is explicitly used when building the native tools.

Add PACKAGECONFIGs for optional libidn and libpaper dependencies.

Remove HAVE_SYS_TIME_H assignments, the upstream bug was fixed in 2011.

Clean up comments: there's no need to explain how to use PACKAGECONFIG,
and justify the use of autotools-brokensep.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../avoid-host-contamination.patch            |  3 +-
 ...-a-preprocessor-define-to-allow-fope.patch | 42 --------
 .../ghostscript/cups-no-gcrypt.patch          | 37 -------
 .../do-not-check-local-libpng-source.patch    | 31 ------
 .../ghostscript-9.15-parallel-make.patch      | 28 ------
 ...21-native-fix-disable-system-libtiff.patch | 47 ---------
 .../ghostscript/ghostscript/mkdir-p.patch     | 50 ----------
 .../ghostscript/ghostscript_10.01.1.bb        | 97 ++++---------------
 8 files changed, 21 insertions(+), 314 deletions(-)
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/base-ge=
nht.c-add-a-preprocessor-define-to-allow-fope.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/cups-no=
-gcrypt.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/do-not-=
check-local-libpng-source.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/ghostsc=
ript-9.15-parallel-make.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/ghostsc=
ript-9.21-native-fix-disable-system-libtiff.patch
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/mkdir-p=
.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/avoid-host-con=
tamination.patch b/meta/recipes-extended/ghostscript/ghostscript/avoid-ho=
st-contamination.patch
index e8cb16c36b4..15c7eb5a774 100644
--- a/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contaminat=
ion.patch
+++ b/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contaminat=
ion.patch
@@ -5,8 +5,7 @@ Subject: [PATCH 04/10] avoid host contamination
=20
 Remove hardcode path refer to host to avoid host contamination.
=20
-Upstream-Status: Inappropriate [embedded specific]
-
+Upstream-Status: Pending
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
=20
 Rebase to 9.23
diff --git a/meta/recipes-extended/ghostscript/ghostscript/base-genht.c-a=
dd-a-preprocessor-define-to-allow-fope.patch b/meta/recipes-extended/ghos=
tscript/ghostscript/base-genht.c-add-a-preprocessor-define-to-allow-fope.=
patch
deleted file mode 100644
index 7d80066a80e..00000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/base-genht.c-add-a-pr=
eprocessor-define-to-allow-fope.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 9ca6f795409b988d38dd98bc2a6ecb68a9392312 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 29 Mar 2018 16:37:40 +0800
-Subject: [PATCH 10/10] base/genht.c: add a preprocessor define to allow =
fopen
- calling
-
-The commit in upstream:
-http://git.ghostscript.com/?p=3Dghostpdl.git;a=3Dcommitdiff;h=3D773c69e4=
6e70bdd5482676437dafd2ca83397643
-
-Replace all fopen calls with gp_fopen and add a preprocessor define so
-that any unintential calls directly to fopen will cause an error.
-
-Only exceptions are those in the platform specific code, and mkromfs.c.
-This patch add a preprocessor define to allow fopen calling in
-base/genht.c.
-
-Upstream-Status: Pending
-
-Rebase to 9.23
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- base/genht.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/base/genht.c b/base/genht.c
-index e597e72..e96bfb5 100644
---- a/base/genht.c
-+++ b/base/genht.c
-@@ -16,6 +16,10 @@
-=20
- /* Generate C code for compiling halftones into ROM. */
- #include "malloc_.h"
-+
-+/* prevent gp.h from defining fopen */
-+#define fopen fopen
-+
- #include "stdio_.h"
- #include "string_.h"
- #include "gscdefs.h"
---=20
-1.8.3.1
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript/cups-no-gcrypt=
.patch b/meta/recipes-extended/ghostscript/ghostscript/cups-no-gcrypt.pat=
ch
deleted file mode 100644
index 4c9bb22fa2d..00000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/cups-no-gcrypt.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 9129eb7fa9dc160d64a7d9df9279a3b1dae4d793 Mon Sep 17 00:00:00 2001
-From: Jackie Huang <jackie.huang@windriver.com>
-Date: Thu, 29 Mar 2018 16:16:18 +0800
-Subject: [PATCH 08/10] cups no gcrypt
-
-Don't build-depend on libgcrypt, as nothing is used from it
-
-Backported from
-http://www.cups.org/strfiles.php/3308/cups-no-gcrypt.patch
-
-This addresses the cryto dependency seen during build.
-
-Upstream-Status: Backport
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
-
-Rebase to 9.23
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- cups/libs/cups/http-private.h | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/cups/libs/cups/http-private.h b/cups/libs/cups/http-private=
.h
-index 99a85c3..a674852 100644
---- a/cups/libs/cups/http-private.h
-+++ b/cups/libs/cups/http-private.h
-@@ -80,7 +80,6 @@ typedef int socklen_t;
- #  elif defined HAVE_GNUTLS
- #    include <gnutls/gnutls.h>
- #    include <gnutls/x509.h>
--#    include <gcrypt.h>
- #  elif defined(HAVE_CDSASSL)
- #    include <CoreFoundation/CoreFoundation.h>
- #    include <Security/Security.h>
---=20
-1.8.3.1
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript/do-not-check-l=
ocal-libpng-source.patch b/meta/recipes-extended/ghostscript/ghostscript/=
do-not-check-local-libpng-source.patch
deleted file mode 100644
index 13e71c824f8..00000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/do-not-check-local-li=
bpng-source.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 108a7d3f79af8c669af129bd87401402e76edfa9 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Mon, 18 Jan 2016 01:00:30 -0500
-Subject: [PATCH] configure.ac: do not check local png source
-
-In oe-core, it did not need to compile local libpng
-source in ghostscript, so do not check local png
-source, and directly check the existance of shared
-libpng library.
-
-Upstream-Status: Inappropriate [OE-Core specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index bb57825..389c473 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1441,7 +1441,7 @@ else
-   PNGDEVS=3D''
-   PNGDEVS_ALL=3D'png48 png16m pnggray pngmono pngmonod png256 png16 png=
alpha png16malpha'
-   AC_MSG_CHECKING([for local png library source])
--  if test -f $srcdir/libpng/pngread.c; then
-+  if false; then
-           AC_MSG_RESULT([yes])
-           SHARE_LIBPNG=3D0
-           LIBPNGDIR=3D$srcdir/libpng
diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.=
15-parallel-make.patch b/meta/recipes-extended/ghostscript/ghostscript/gh=
ostscript-9.15-parallel-make.patch
deleted file mode 100644
index 5b57da2a972..00000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.15-para=
llel-make.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 04a86a613e0f9bfbbad99874f72217f75e8c53a3 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Thu, 29 Mar 2018 15:59:05 +0800
-Subject: [PATCH] contrib.mak: fix for parallel build
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
-Rebase to 9.23
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- contrib/contrib.mak | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/contrib/contrib.mak b/contrib/contrib.mak
-index 2edee7a..c9100e8 100644
---- a/contrib/contrib.mak
-+++ b/contrib/contrib.mak
-@@ -1241,6 +1241,7 @@ $(DEVOBJ)gdevalps.$(OBJ) : $(JAPSRC)gdevalps.c $(P=
DEVH) \
- ### ----------------- Additional .upp files ---------------- ###
-=20
- extra-upp-install: install-libdata
-+	mkdir -p $(DESTDIR)$(gsdatadir)$(D)lib
- 	for f in $(CONTRIBSRC)uniprint$(D)*.upp; do \
- 	    $(INSTALL_DATA) $$f $(DESTDIR)$(gsdatadir)$(D)lib || exit 1; \
- 	done
diff --git a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.=
21-native-fix-disable-system-libtiff.patch b/meta/recipes-extended/ghosts=
cript/ghostscript/ghostscript-9.21-native-fix-disable-system-libtiff.patc=
h
deleted file mode 100644
index a382c7f8917..00000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/ghostscript-9.21-nati=
ve-fix-disable-system-libtiff.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 0124b1c29b9cfe46d73ae82ce023dd7c5b055744 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 29 Mar 2018 16:36:12 +0800
-Subject: [PATCH 09/10] ghostscript-native:fix disable-system-libtiff
-
-Modify configure to add the check to make sure
-ghostscrip could work while system-libtiff is
-disabled.
-
-Upstream-Status: Pending
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
-Rebase to ghostscript 9.25.
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
----
- configure.ac | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 80a60b1..f3e9efb 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1319,6 +1319,7 @@ AC_TRY_COMPILE([], [return 0;],
- CFLAGS=3D$CGLAGS_STORE
-=20
- if test x"$SHARE_LIBTIFF" =3D x"0" ; then
-+    if test -e $LIBTIFFDIR/configure; then
-       echo "Running libtiff configure script..."
-       olddir=3D`pwd`
-       if ! test -d "$LIBTIFFCONFDIR" ; then
-@@ -1337,6 +1338,10 @@ if test x"$SHARE_LIBTIFF" =3D x"0" ; then
-=20
-       echo
-       echo "Continuing with Ghostscript configuration..."
-+    else
-+      AC_MSG_NOTICE([Could not find local copy of libtiff.
-+Disabling tiff output devices.])
-+    fi
- fi
-=20
- AC_SUBST(SHARE_LIBTIFF)
---=20
-1.8.3.1
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript/mkdir-p.patch =
b/meta/recipes-extended/ghostscript/ghostscript/mkdir-p.patch
deleted file mode 100644
index 3e6d3e3c48a..00000000000
--- a/meta/recipes-extended/ghostscript/ghostscript/mkdir-p.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 2b23026f8e2a352417fb1c4da94bf69b19bef267 Mon Sep 17 00:00:00 2001
-From: Joe Slater <joe.slater@windriver.com>
-Date: Thu, 29 Mar 2018 16:04:32 +0800
-Subject: [PATCH 05/10] ghostscript: allow directories to be created more=
 than
- once
-
-When doing parallel builds, we might try to create directories
-more than once.  This should not cause an error.
-
-Upstream-Status: Pending
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
-Rebase to 9.23
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- base/unix-end.mak | 17 ++++++++---------
- 1 file changed, 8 insertions(+), 9 deletions(-)
-
-diff --git a/base/unix-end.mak b/base/unix-end.mak
-index 9ce599a..feff5a6 100644
---- a/base/unix-end.mak
-+++ b/base/unix-end.mak
-@@ -17,15 +17,14 @@
- UNIX_END_MAK=3D$(GLSRC)unix-end.mak $(TOP_MAKEFILES)
- # Define the rule for building standard configurations.
- directories: $(UNIX_END_MAK)
--	@if test "$(BINDIR)"    !=3D "" -a ! -d $(BINDIR);        then mkdir $=
(BINDIR);        fi
--	@if test "$(GLGENDIR)"  !=3D "" -a ! -d $(GLGENDIR);      then mkdir $=
(GLGENDIR);      fi
--	@if test "$(GLOBJDIR)"  !=3D "" -a ! -d $(GLOBJDIR);      then mkdir $=
(GLOBJDIR);      fi
--	@if test "$(DEVGENDIR)" !=3D "" -a ! -d $(DEVGENDIR);     then mkdir $=
(DEVGENDIR);     fi
--	@if test "$(DEVOBJDIR)" !=3D "" -a ! -d $(DEVOBJDIR);     then mkdir $=
(DEVOBJDIR);     fi
--	@if test "$(AUXDIR)"    !=3D "" -a ! -d $(AUXDIR);        then mkdir $=
(AUXDIR);        fi
--	@if test "$(PSGENDIR)"  !=3D "" -a ! -d $(PSGENDIR);      then mkdir $=
(PSGENDIR);      fi
--	@if test "$(PSGENDIR)"  !=3D "" -a ! -d $(PSGENDIR)/cups; then mkdir $=
(PSGENDIR)/cups; fi
--	@if test "$(PSOBJDIR)"  !=3D "" -a ! -d $(PSOBJDIR);      then mkdir $=
(PSOBJDIR);      fi
-+	@if test "$(BINDIR)"    !=3D "" -a ! -d $(BINDIR);        then mkdir -=
p $(BINDIR);        fi
-+	@if test "$(GLGENDIR)"  !=3D "" -a ! -d $(GLGENDIR);      then mkdir -=
p $(GLGENDIR);      fi
-+	@if test "$(GLOBJDIR)"  !=3D "" -a ! -d $(GLOBJDIR);      then mkdir -=
p $(GLOBJDIR);      fi
-+	@if test "$(DEVGENDIR)" !=3D "" -a ! -d $(DEVGENDIR);     then mkdir -=
p $(DEVGENDIR);     fi
-+	@if test "$(DEVOBJDIR)" !=3D "" -a ! -d $(DEVOBJDIR);     then mkdir -=
p $(DEVOBJDIR);     fi
-+	@if test "$(AUXDIR)"    !=3D "" -a ! -d $(AUXDIR);        then mkdir -=
p $(AUXDIR);        fi
-+	@if test "$(PSGENDIR)"  !=3D "" -a ! -d $(PSGENDIR)/cups; then mkdir -=
p $(PSGENDIR)/cups; fi
-+	@if test "$(PSOBJDIR)"  !=3D "" -a ! -d $(PSOBJDIR);      then mkdir -=
p $(PSOBJDIR);      fi
-=20
-=20
- gs: .gssubtarget $(UNIX_END_MAK)
---=20
-1.8.3.1
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb b/m=
eta/recipes-extended/ghostscript/ghostscript_10.01.1.bb
index 5d4b8cdc913..f03ebf44789 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.01.1.bb
@@ -13,91 +13,50 @@ SECTION =3D "console/utils"
 LICENSE =3D "GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df98ffa763e50cded76f49bce73aad=
e16"
=20
-DEPENDS =3D "ghostscript-native tiff jpeg fontconfig cups libpng"
-DEPENDS:class-native =3D "libpng-native"
+DEPENDS =3D "tiff jpeg fontconfig cups libpng freetype zlib"
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/ArtifexSoftware/ghostpdl-down=
loads/releases"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)\.tar"
=20
-# As of ghostscript 9.54.0 the jpeg issue in the CVE is present in the g=
s jpeg sources
-# however we use an external jpeg which doesn't have the issue.
+# We use a system libjpeg-turbo which has this fix
 CVE_CHECK_IGNORE +=3D "CVE-2013-6629"
=20
 def gs_verdir(v):
     return "".join(v.split("."))
=20
=20
-SRC_URI_BASE =3D "https://github.com/ArtifexSoftware/ghostpdl-downloads/=
releases/download/gs${@gs_verdir("${PV}")}/${BPN}-${PV}.tar.gz \
-                file://ghostscript-9.15-parallel-make.patch \
-                file://ghostscript-9.16-Werror-return-type.patch \
-                file://do-not-check-local-libpng-source.patch \
-                file://avoid-host-contamination.patch \
-                file://mkdir-p.patch \
+SRC_URI =3D "https://github.com/ArtifexSoftware/ghostpdl-downloads/relea=
ses/download/gs${@gs_verdir("${PV}")}/${BPN}-${PV}.tar.gz \
+           file://ghostscript-9.16-Werror-return-type.patch \
+           file://avoid-host-contamination.patch \
 "
=20
-SRC_URI =3D "${SRC_URI_BASE} \
-           file://cups-no-gcrypt.patch \
-           "
-
-SRC_URI:class-native =3D "${SRC_URI_BASE} \
-                        file://ghostscript-9.21-native-fix-disable-syste=
m-libtiff.patch \
-                        file://base-genht.c-add-a-preprocessor-define-to=
-allow-fope.patch \
-                        "
-
 SRC_URI[sha256sum] =3D "4df18a808cd4369f25e02dbcec2f133cb6d674627b2c6b15=
02020e58d43e32ce"
=20
-# Put something like
-#
-#   PACKAGECONFIG:append:pn-ghostscript =3D " x11"
-#
-# in local.conf to enable building with X11.  Be careful.  The order
-# of the overrides matters!
-#
-#PACKAGECONFIG ??=3D "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x1=
1', '', d)}"
-PACKAGECONFIG:class-native =3D ""
-
+PACKAGECONFIG ??=3D ""
+PACKAGECONFIG[gtk] =3D "--enable-gtk,--disable-gtk,gtk+3"
+PACKAGECONFIG[libidn] =3D "--with-libidn,--without-libidn,libidn"
+PACKAGECONFIG[libpaper] =3D "--with-libpaper,--without-libpaper,libpaper=
"
 PACKAGECONFIG[x11] =3D "--with-x --x-includes=3D${STAGING_INCDIR} --x-li=
braries=3D${STAGING_LIBDIR}, \
-                      --without-x, virtual/libx11 libxext libxt gtk+3\
-                      "
+                      --without-x, virtual/libx11 libxext libxt"
=20
-EXTRA_OECONF =3D "--without-libpaper --with-system-libtiff --with-jbig2d=
ec \
+EXTRA_OECONF =3D "--with-jbig2dec \
                 --with-fontpath=3D${datadir}/fonts \
-                --without-libidn --with-cups-serverbin=3D${exec_prefix}/=
lib/cups \
-                --with-cups-datadir=3D${datadir}/cups \
                 CUPSCONFIG=3D"${STAGING_BINDIR_CROSS}/cups-config" \
+                PKGCONFIG=3Dpkg-config \
                 "
=20
 EXTRA_OECONF:append:mipsarcho32 =3D " --with-large_color_index=3D0"
=20
-# Explicity disable libtiff, fontconfig,
-# freetype, cups for ghostscript-native
-EXTRA_OECONF:class-native =3D "--without-x --with-system-libtiff=3Dno \
-                             --without-libpaper \
-                             --with-fontpath=3D${datadir}/fonts \
-                             --without-libidn --disable-fontconfig \
-                             --enable-freetype --disable-cups "
-
-# This has been fixed upstream but for now we need to subvert the check =
for time.h
-# http://bugs.ghostscript.com/show_bug.cgi?id=3D692443
-# http://bugs.ghostscript.com/show_bug.cgi?id=3D692426
-CFLAGS +=3D "-DHAVE_SYS_TIME_H=3D1"
-BUILD_CFLAGS +=3D "-DHAVE_SYS_TIME_H=3D1"
-
-inherit autotools-brokensep
-
-do_configure:prepend:class-target () {
-        rm -rf ${S}/jpeg/
-}
+# Uses autoconf but not automake, can't do out-of-tree
+inherit autotools-brokensep pkgconfig
=20
-do_configure:append () {
-	# copy tools from the native ghostscript build
-	if [ "${PN}" !=3D "ghostscript-native" ]; then
-		mkdir -p obj/aux soobj
-		for i in genarch genconf mkromfs echogs gendev genht packps; do
-			cp ${STAGING_BINDIR_NATIVE}/ghostscript-${PV}/$i obj/aux/$i
-		done
-	fi
+# Prune the source tree of libraries that we're using our packaging of, =
so that
+# ghostscript can't link to them. Can't prune zlib as that's needed for =
the
+# native tools.
+prune_sources() {
+    rm -rf ${S}/jpeg/ ${S}/libpng/ ${S}/tiff/ ${S}/expat/ ${S}/freetype/=
 ${S}/cups/lib
 }
+do_unpack[postfuncs] +=3D "prune_sources"
=20
 do_install:append () {
     mkdir -p ${D}${datadir}/ghostscript/${PV}/
@@ -105,22 +64,6 @@ do_install:append () {
     cp -r ${S}/iccprofiles ${D}${datadir}/ghostscript/${PV}/
 }
=20
-do_compile:class-native () {
-    mkdir -p obj
-    for i in genarch genconf mkromfs echogs gendev genht packps; do
-        oe_runmake obj/aux/$i
-    done
-}
-
-do_install:class-native () {
-    install -d ${D}${bindir}/ghostscript-${PV}
-    for i in genarch genconf mkromfs echogs gendev genht packps; do
-        install -m 755 obj/aux/$i ${D}${bindir}/ghostscript-${PV}/$i
-    done
-}
-
-BBCLASSEXTEND =3D "native"
-
 # ghostscript does not supports "arc"
 COMPATIBLE_HOST =3D "^(?!arc).*"
=20
--=20
2.34.1



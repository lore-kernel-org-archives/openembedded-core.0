Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.11329.1626097925348135456
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 06:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8419106F
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 06:52:04 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82EBD3F7D8
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 06:52:04 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/9] tcl: use tcl-core instead of patching out packages
Date: Mon, 12 Jul 2021 14:51:54 +0100
Message-Id: <20210712135159.2131269-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712135159.2131269-1-ross.burton@arm.com>
References: <20210712135159.2131269-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Instead of patching out the build of optional packages, we can just use
the tcl-core tarball which is identical except it doesn't include the
packages.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../tcltk/tcl/no_packages.patch               | 53 -------------------
 meta/recipes-devtools/tcltk/tcl_8.6.11.bb     |  5 +-
 2 files changed, 2 insertions(+), 56 deletions(-)
 delete mode 100644 meta/recipes-devtools/tcltk/tcl/no_packages.patch

diff --git a/meta/recipes-devtools/tcltk/tcl/no_packages.patch b/meta/rec=
ipes-devtools/tcltk/tcl/no_packages.patch
deleted file mode 100644
index 5c622a2369..0000000000
--- a/meta/recipes-devtools/tcltk/tcl/no_packages.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-tcl 8.6.0 builds by default a number of packages that are not needed in =
Yocto.
-This patch changes the makefile so that these packages are not built by =
default.
-
-Upstream-Status:Inappropriate [embedded specific]
-
-Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
-
-diff --git a/Makefile.in b/Makefile.in
-index b729ffd..2c2e824 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -612,7 +612,7 @@ SRCS =3D $(GENERIC_SRCS) $(TOMMATH_SRCS) $(UNIX_SRCS=
) $(NOTIFY_SRCS) \
- # Start of rules
- #----------------------------------------------------------------------=
----
-=20
--all: binaries libraries doc packages
-+all: binaries libraries doc
-=20
- binaries: ${LIB_FILE} ${TCL_EXE}
-=20
-@@ -656,12 +656,12 @@ Makefile: $(UNIX_DIR)/Makefile.in $(DLTEST_DIR)/Ma=
kefile.in
- #tclConfig.h: $(UNIX_DIR)/tclConfig.h.in
- #	$(SHELL) config.status
-=20
--clean: clean-packages
-+clean:
- 	rm -rf *.a *.o libtcl* core errs *~ \#* TAGS *.E a.out \
- 		errors ${TCL_EXE} ${TCLTEST_EXE} lib.exp Tcl @DTRACE_HDR@
- 	cd dltest ; $(MAKE) clean
-=20
--distclean: distclean-packages clean
-+distclean: clean
- 	rm -rf Makefile config.status config.cache config.log tclConfig.sh \
- 		tclConfig.h *.plist Tcl.framework tcl.pc
- 	cd dltest ; $(MAKE) distclean
-@@ -709,7 +709,7 @@ tcltest-real:
- # tcltest, ie:
- #	% make test TESTFLAGS=3D"-verbose bps -file fileName.test"
-=20
--test: test-tcl test-packages
-+test: test-tcl
-=20
- test-tcl: ${TCLTEST_EXE}
- 	$(SHELL_ENV) ${TCLTEST_EXE} $(TOP_DIR)/tests/all.tcl $(TESTFLAGS)
-@@ -774,7 +774,7 @@ INSTALL_PACKAGE_TARGETS =3D install-packages
- INSTALL_DEV_TARGETS =3D install-headers
- INSTALL_EXTRA_TARGETS =3D @EXTRA_INSTALL@
- INSTALL_TARGETS =3D $(INSTALL_BASE_TARGETS) $(INSTALL_DOC_TARGETS) $(IN=
STALL_DEV_TARGETS) \
--		  $(INSTALL_PACKAGE_TARGETS) $(INSTALL_EXTRA_TARGETS)
-+		  $(INSTALL_EXTRA_TARGETS)
-=20
- install: $(INSTALL_TARGETS)
-=20
diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.11.bb b/meta/recipes-dev=
tools/tcltk/tcl_8.6.11.bb
index b2863f9a1f..722e4a0132 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
@@ -15,17 +15,16 @@ LIC_FILES_CHKSUM =3D "file://../license.terms;md5=3D0=
58f6229798281bbcac4239c788cfa38
=20
 DEPENDS =3D "tcl-native zlib"
=20
-BASE_SRC_URI =3D "${SOURCEFORGE_MIRROR}/tcl/${BPN}${PV}-src.tar.gz \
+BASE_SRC_URI =3D "${SOURCEFORGE_MIRROR}/tcl/tcl-core${PV}-src.tar.gz \
                 file://tcl-add-soname.patch"
 SRC_URI =3D "${BASE_SRC_URI} \
            file://fix_non_native_build_issue.patch \
            file://fix_issue_with_old_distro_glibc.patch \
-           file://no_packages.patch \
            file://tcl-remove-hardcoded-install-path.patch \
            file://alter-includedir.patch \
            file://run-ptest \
 "
-SRC_URI[sha256sum] =3D "8c0486668586672c5693d7d95817cb05a18c5ecca2f40e28=
36b9578064088258"
+SRC_URI[sha256sum] =3D "cfb49aab82bd179651e23eeeb69606f51b0ddc575ca55c3d=
35e2457469024cfa"
=20
 SRC_URI_class-native =3D "${BASE_SRC_URI}"
=20
--=20
2.25.1


Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA2A2C433EF
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 14:02:47 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.16173.1636725766847401628
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 06:02:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 059DB101E
	for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 06:02:40 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A51D63F70D
	for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 06:02:39 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] dtc: use Meson to build
Date: Fri, 12 Nov 2021 14:02:33 +0000
Message-Id: <20211112140237.575404-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211112140237.575404-1-ross.burton@arm.com>
References: <20211112140237.575404-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Nov 2021 14:02:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158223

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...-Makefile-to-add-CFLAGS-not-override.patch | 36 -------------------
 .../recipes-kernel/dtc/dtc/make_install.patch | 26 --------------
 meta/recipes-kernel/dtc/dtc_1.6.1.bb          | 15 +++-----
 3 files changed, 4 insertions(+), 73 deletions(-)
 delete mode 100644 meta/recipes-kernel/dtc/dtc/0001-dtc-Fix-Makefile-to-=
add-CFLAGS-not-override.patch
 delete mode 100644 meta/recipes-kernel/dtc/dtc/make_install.patch

diff --git a/meta/recipes-kernel/dtc/dtc/0001-dtc-Fix-Makefile-to-add-CFL=
AGS-not-override.patch b/meta/recipes-kernel/dtc/dtc/0001-dtc-Fix-Makefil=
e-to-add-CFLAGS-not-override.patch
deleted file mode 100644
index a2deb12d4b..0000000000
--- a/meta/recipes-kernel/dtc/dtc/0001-dtc-Fix-Makefile-to-add-CFLAGS-not=
-override.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From f0119060ef1b9bd80e2cae487df1e4aedffb0e9b Mon Sep 17 00:00:00 2001
-From: Oleksiy Obitotskyy <oobitots@cisco.com>
-Date: Fri, 22 Jan 2021 09:12:48 +0200
-Subject: [PATCH] dtc: Fix Makefile to add CFLAGS not override
-
-Makefile override CFLAGS not extend them, so some of them
-missing. Sources builds out of kernel tree and probably not all
-options could be used (?). We need at least -fmacro-prefix-map/
-debug-prefix-map to eliminate absolute path in binaries.
-
-Upstream-Status: Pending
-Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
----
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 35d936f..b5b13cf 100644
---- a/Makefile
-+++ b/Makefile
-@@ -20,10 +20,10 @@ CONFIG_LOCALVERSION =3D
- # See libfdt_internal.h for details
- ASSUME_MASK ?=3D 0
-=20
--CPPFLAGS =3D -I libfdt -I . -DFDT_ASSUME_MASK=3D$(ASSUME_MASK)
-+CPPFLAGS +=3D -I libfdt -I . -DFDT_ASSUME_MASK=3D$(ASSUME_MASK)
- WARNINGS =3D -Wall -Wpointer-arith -Wcast-qual -Wnested-externs \
- 	-Wstrict-prototypes -Wmissing-prototypes -Wredundant-decls -Wshadow
--CFLAGS =3D -g -Os $(SHAREDLIB_CFLAGS) -Werror $(WARNINGS) $(EXTRA_CFLAG=
S)
-+CFLAGS +=3D -g -Os $(SHAREDLIB_CFLAGS) -Werror $(WARNINGS) $(EXTRA_CFLA=
GS)
-=20
- BISON =3D bison
- LEX =3D flex
---=20
-2.25.1
-
diff --git a/meta/recipes-kernel/dtc/dtc/make_install.patch b/meta/recipe=
s-kernel/dtc/dtc/make_install.patch
deleted file mode 100644
index ea9359e815..0000000000
--- a/meta/recipes-kernel/dtc/dtc/make_install.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From e9852b9d206df1e42aa4c8afec55a0f5e099b533 Mon Sep 17 00:00:00 2001
-From: Saul Wold <sgw@linux.intel.com>
-Date: Thu, 3 Nov 2011 08:35:47 -0700
-Subject: [PATCH] dtc: Add patch to correctly install shared libraries an=
d
-
-Upstream-Status: Inappropriate [configuration]
-
----
- Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index d8ebc4f..f5e01be 100644
---- a/Makefile
-+++ b/Makefile
-@@ -205,8 +205,8 @@ install-bin: all $(SCRIPTS)
- install-lib: all
- 	@$(VECHO) INSTALL-LIB
- 	$(INSTALL) -d $(DESTDIR)$(LIBDIR)
--	$(INSTALL_LIB) $(LIBFDT_lib) $(DESTDIR)$(LIBDIR)
--	ln -sf $(notdir $(LIBFDT_lib)) $(DESTDIR)$(LIBDIR)/$(LIBFDT_soname)
-+	$(INSTALL) $(LIBFDT_lib) $(DESTDIR)$(LIBDIR)/$(LIBFDT_soname)
-+	ln -sf $(LIBFDT_soname) $(DESTDIR)$(LIBDIR)/$(notdir $(LIBFDT_lib))
- 	ln -sf $(LIBFDT_soname) $(DESTDIR)$(LIBDIR)/libfdt.$(SHAREDLIB_EXT)
- 	$(INSTALL_DATA) $(LIBFDT_archive) $(DESTDIR)$(LIBDIR)
-=20
diff --git a/meta/recipes-kernel/dtc/dtc_1.6.1.bb b/meta/recipes-kernel/d=
tc/dtc_1.6.1.bb
index 979b610576..44293cf4ff 100644
--- a/meta/recipes-kernel/dtc/dtc_1.6.1.bb
+++ b/meta/recipes-kernel/dtc/dtc_1.6.1.bb
@@ -8,23 +8,16 @@ DEPENDS =3D "flex-native bison-native"
 LIC_FILES_CHKSUM =3D "file://GPL;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 =
\
                     file://libfdt/libfdt.h;beginline=3D4;endline=3D7;md5=
=3D05bb357cfb75cae7d2b01d2ee8d76407"
=20
-SRC_URI =3D "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=3Dmas=
ter \
-           file://make_install.patch \
-           file://0001-dtc-Fix-Makefile-to-add-CFLAGS-not-override.patch=
 \
-           "
+SRC_URI =3D "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=3Dmas=
ter"
 SRCREV =3D "b6910bec11614980a21e46fbccc35934b671bd81"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
=20
-EXTRA_OEMAKE=3D'NO_PYTHON=3D1 PREFIX=3D"${prefix}" LIBDIR=3D"${libdir}" =
DESTDIR=3D"${D}"'
-
-inherit pkgconfig
-
 S =3D "${WORKDIR}/git"
=20
-do_install () {
-	oe_runmake install
-}
+inherit meson pkgconfig
+
+EXTRA_OEMESON =3D "-Dpython=3Ddisabled -Dvalgrind=3Ddisabled"
=20
 PACKAGES =3D+ "${PN}-misc"
 FILES:${PN}-misc =3D "${bindir}/convert-dtsv0 ${bindir}/ftdump ${bindir}=
/dtdiff"
--=20
2.25.1



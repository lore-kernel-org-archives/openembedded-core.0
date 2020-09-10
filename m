Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1120.1599771240512296862
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 13:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DDB6E113E
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 13:53:58 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 813A23F73C
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 13:53:58 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ncurses: remove config.cache
Date: Thu, 10 Sep 2020 21:53:54 +0100
Message-Id: <20200910205354.900504-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Ross Burton <ross.burton@intel.com>

Instead of having a config.cache that overrides the system site files,
simply set the values in CACHED_CONFIGUREVARS. We can also drop the
mkstemp check as the configure.ac assumes it works, leaving just
nanosleep.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/ncurses/files/config.cache | 4 ----
 meta/recipes-core/ncurses/ncurses.inc        | 3 ++-
 meta/recipes-core/ncurses/ncurses_6.2.bb     | 3 +--
 3 files changed, 3 insertions(+), 7 deletions(-)
 delete mode 100644 meta/recipes-core/ncurses/files/config.cache

diff --git a/meta/recipes-core/ncurses/files/config.cache b/meta/recipes-=
core/ncurses/files/config.cache
deleted file mode 100644
index 6a9217d5bb..0000000000
--- a/meta/recipes-core/ncurses/files/config.cache
+++ /dev/null
@@ -1,4 +0,0 @@
-#! /bin/sh
-
-cf_cv_func_nanosleep=3Dyes
-cf_cv_func_mkstemp=3Dyes
diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/nc=
urses/ncurses.inc
index 4156bf4f7d..1627fb91d3 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -16,7 +16,8 @@ inherit autotools binconfig-disabled multilib_header pk=
gconfig
 SRC_URI =3D "git://salsa.debian.org/debian/ncurses.git;protocol=3Dhttps"
=20
 EXTRA_AUTORECONF =3D "-I m4"
-CONFIG_SITE =3D+ "${WORKDIR}/config.cache"
+
+CACHED_CONFIGUREVARS =3D "cf_cv_func_nanosleep=3Dyes"
=20
 EXTRASITECONFIG =3D "CFLAGS=3D'${CFLAGS} -I${SYSROOT_DESTDIR}${includedi=
r}'"
=20
diff --git a/meta/recipes-core/ncurses/ncurses_6.2.bb b/meta/recipes-core=
/ncurses/ncurses_6.2.bb
index 723e685a9b..5c02db8541 100644
--- a/meta/recipes-core/ncurses/ncurses_6.2.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.2.bb
@@ -2,12 +2,11 @@ require ncurses.inc
=20
 SRC_URI +=3D "file://0001-tic-hang.patch \
            file://0002-configure-reproducible.patch \
-           file://config.cache \
            "
 # commit id corresponds to the revision in package version
 SRCREV =3D "a669013cd5e9d6434e5301348ea51baf306c93c4"
 S =3D "${WORKDIR}/git"
-EXTRA_OECONF +=3D "--with-abi-version=3D5 --cache-file=3D${B}/config.cac=
he"
+EXTRA_OECONF +=3D "--with-abi-version=3D5"
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+(\.\d+)+(\+\d+)*)"
=20
 # This is needed when using patchlevel versions like 6.1+20181013
--=20
2.28.0


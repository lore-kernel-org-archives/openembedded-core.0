Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6557FC41513
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 16:39:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.758.1713803931922932232
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Apr 2024 09:38:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1BD71515;
	Mon, 22 Apr 2024 09:39:19 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 307133F7BD;
	Mon, 22 Apr 2024 09:38:51 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 4/5] npth: remove obsolete pkgconfig patch
Date: Mon, 22 Apr 2024 16:38:45 +0000
Message-Id: <20240422163846.1012183-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240422163846.1012183-1-ross.burton@arm.com>
References: <20240422163846.1012183-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Apr 2024 16:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198600

npth now provides a pkg-config itself[1] so we don't need to patch one
in anymore.

[1] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=3Dnpth.git;a=3Dcommit;h=3D=
f3cbbc86cb49a1729d6df573bd76a5559e7f636b

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-support/npth/npth/pkgconfig.patch | 59 -------------------
 meta/recipes-support/npth/npth_1.7.bb         |  1 -
 2 files changed, 60 deletions(-)
 delete mode 100644 meta/recipes-support/npth/npth/pkgconfig.patch

diff --git a/meta/recipes-support/npth/npth/pkgconfig.patch b/meta/recipe=
s-support/npth/npth/pkgconfig.patch
deleted file mode 100644
index e736921b43d..00000000000
--- a/meta/recipes-support/npth/npth/pkgconfig.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From ff19a9648f1c7d93087e2c33ca64bb881d53ea5a Mon Sep 17 00:00:00 2001
-From: Saul Wold <sgw@linux.intel.com>
-Date: Mon, 10 Nov 2014 13:59:03 -0800
-Subject: [PATCH] Added npth pkgconfig file
-
-Upstream-Status: Pending
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
----
- configure.ac    |  1 +
- src/Makefile.am |  4 +++-
- src/npth.pc.in  | 10 ++++++++++
- 3 files changed, 14 insertions(+), 1 deletion(-)
- create mode 100644 src/npth.pc.in
-
-diff --git a/configure.ac b/configure.ac
-index 10f3629..65b76a1 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -476,6 +476,7 @@ src/Makefile
- w32/Makefile
- tests/Makefile])
- AC_CONFIG_FILES(npth-config, chmod +x npth-config)
-+AC_CONFIG_FILES([src/npth.pc])
- AC_OUTPUT
-=20
- echo "
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 7070118..6f01c64 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -17,8 +17,10 @@
- # License along with this program; if not, see <http://www.gnu.org/lice=
nses/>.
-=20
- ## Process this file with automake to produce Makefile.in
-+pkgconfigdir =3D $(libdir)/pkgconfig
-+pkgconfig_DATA =3D npth.pc
-=20
--EXTRA_DIST =3D libnpth.vers
-+EXTRA_DIST =3D libnpth.vers npth.pc
- #	     versioninfo.rc.in
- nodist_include_HEADERS =3D npth.h
-=20
-diff --git a/src/npth.pc.in b/src/npth.pc.in
-new file mode 100644
-index 0000000..db091e8
---- /dev/null
-+++ b/src/npth.pc.in
-@@ -0,0 +1,10 @@
-+prefix=3D@prefix@
-+exec_prefix=3D@exec_prefix@
-+libdir=3D@libdir@
-+includedir=3D@includedir@
-+
-+Name: npth
-+Description: a new portable posix threading library
-+Version: @VERSION@
-+Libs: -L${libdir} -lnpth -lpthread
-+Cflags: -I${includedir}
diff --git a/meta/recipes-support/npth/npth_1.7.bb b/meta/recipes-support=
/npth/npth_1.7.bb
index 45d4efb4a9c..038caebd3d6 100644
--- a/meta/recipes-support/npth/npth_1.7.bb
+++ b/meta/recipes-support/npth/npth_1.7.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D2caced0b25=
dfefd4c601d92bd15116de"
 UPSTREAM_CHECK_URI =3D "https://gnupg.org/download/index.html"
=20
 SRC_URI =3D "${GNUPG_MIRROR}/npth/npth-${PV}.tar.bz2 \
-           file://pkgconfig.patch \
            file://musl-fix.patch \
            "
=20
--=20
2.34.1



Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD977C3DA79
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 14:09:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2451.1702390158895866973
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 06:09:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 064421474;
	Tue, 12 Dec 2023 06:10:05 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 343E83F738;
	Tue, 12 Dec 2023 06:09:18 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 8/9] kmod: fix configure with autopoint calling gtkdocize
Date: Tue, 12 Dec 2023 14:08:19 +0000
Message-Id: <20231212140820.2900963-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231212140820.2900963-1-ross.burton@arm.com>
References: <20231212140820.2900963-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:09:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192201

From: Ross Burton <ross.burton@arm.com>

GTKDOC_DOCDIR is obsolete now, so fix the build by passing the
documentation directory in the GTK_DOC_CHECK call.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-kernel/kmod/kmod/gtkdocdir.patch | 33 +++++++++++++++++++
 meta/recipes-kernel/kmod/kmod_31.bb           |  3 +-
 2 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-kernel/kmod/kmod/gtkdocdir.patch

diff --git a/meta/recipes-kernel/kmod/kmod/gtkdocdir.patch b/meta/recipes=
-kernel/kmod/kmod/gtkdocdir.patch
new file mode 100644
index 00000000000..a34ea466e8e
--- /dev/null
+++ b/meta/recipes-kernel/kmod/kmod/gtkdocdir.patch
@@ -0,0 +1,33 @@
+From dd59095f70f774f6d1e767010e25b35ef6db4c4b Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Fri, 8 Dec 2023 22:35:45 +0000
+Subject: [PATCH] configure: set docdir in GTK_DOC_CHECK
+
+By passing --docdir in the GTK_DOC_CHECK arguments (to match
+autogen.sh) autoreconf will work out of the box.
+
+Without this autoreconf fails due to the documentation not being in
+./docs, the default location.
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-modules/202312=
08224511.1363066-1-ross.burton@arm.com/T/#u]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index de01e08..67696c4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -255,7 +255,7 @@ AS_IF([test "x$enable_coverage" =3D "xyes"], [
+ AM_CONDITIONAL([ENABLE_COVERAGE], [test "x$enable_coverage" =3D "xyes"]=
)
+=20
+ m4_ifdef([GTK_DOC_CHECK], [
+-GTK_DOC_CHECK([1.14],[--flavour no-tmpl-flat])
++GTK_DOC_CHECK([1.14],[--flavour no-tmpl-flat --docdir libkmod/docs])
+ ], [
+ AM_CONDITIONAL([ENABLE_GTK_DOC], false)])
+=20
+--=20
+2.34.1
+
diff --git a/meta/recipes-kernel/kmod/kmod_31.bb b/meta/recipes-kernel/km=
od/kmod_31.bb
index 934a678a062..f8e83d5db63 100644
--- a/meta/recipes-kernel/kmod/kmod_31.bb
+++ b/meta/recipes-kernel/kmod/kmod_31.bb
@@ -20,6 +20,7 @@ SRCREV =3D "aff617ea871d0568cc491bd116c0be1e857463bb"
 SRC_URI =3D "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git;bra=
nch=3Dmaster;protocol=3Dhttps \
            file://depmod-search.conf \
            file://avoid_parallel_tests.patch \
+           file://gtkdocdir.patch \
            "
=20
 S =3D "${WORKDIR}/git"
@@ -35,8 +36,6 @@ PACKAGECONFIG[xz] =3D "--with-xz,--without-xz,xz"
 PACKAGECONFIG[zlib] =3D "--with-zlib,--without-zlib,zlib"
 PACKAGECONFIG[zstd] =3D "--with-zstd,--without-zstd,zstd"
=20
-GTKDOC_DOCDIR =3D "${S}/libkmod/docs"
-
 PROVIDES +=3D "module-init-tools-insmod-static module-init-tools-depmod =
module-init-tools"
 RPROVIDES:${PN} +=3D "module-init-tools-insmod-static module-init-tools-=
depmod module-init-tools"
 RCONFLICTS:${PN} +=3D "module-init-tools-insmod-static module-init-tools=
-depmod module-init-tools"
--=20
2.34.1



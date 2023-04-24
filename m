Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C92A3C77B61
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 13:04:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.50220.1682341437537099314
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Apr 2023 06:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC010D75;
	Mon, 24 Apr 2023 06:04:40 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4EE753F64C;
	Mon, 24 Apr 2023 06:03:56 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] dmidecode: upgrade to 3.5
Date: Mon, 24 Apr 2023 14:03:54 +0100
Message-Id: <20230424130354.3484944-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 13:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180350

This includes a fix for CVE-2023-30630.

Remove the patch changing prefix and instead pass the paths to the make
install command.

Passing -e to make is no longer needed, the Makefile respects variables
now.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...mitting-changes-from-do_unpack_extra.patch | 25 -------------------
 .../{dmidecode_3.4.bb =3D> dmidecode_3.5.bb}    | 21 +++++++---------
 2 files changed, 9 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-devtools/dmidecode/dmidecode/0001-Commit=
ting-changes-from-do_unpack_extra.patch
 rename meta/recipes-devtools/dmidecode/{dmidecode_3.4.bb =3D> dmidecode_=
3.5.bb} (50%)

diff --git a/meta/recipes-devtools/dmidecode/dmidecode/0001-Committing-ch=
anges-from-do_unpack_extra.patch b/meta/recipes-devtools/dmidecode/dmidec=
ode/0001-Committing-changes-from-do_unpack_extra.patch
deleted file mode 100644
index d082459ca94..00000000000
--- a/meta/recipes-devtools/dmidecode/dmidecode/0001-Committing-changes-f=
rom-do_unpack_extra.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 2c0437f47eaaf565aaccf0c0d150d5fc0fc734f5 Mon Sep 17 00:00:00 2001
-From: OpenEmbedded <oe.patch@oe>
-Date: Thu, 22 Nov 2018 12:05:04 +0000
-Subject: [PATCH] Do not install to /usr/local
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 7aa729d..e079b18 100644
---- a/Makefile
-+++ b/Makefile
-@@ -31,7 +31,7 @@ CFLAGS +=3D -D_FILE_OFFSET_BITS=3D64
- LDFLAGS ?=3D
-=20
- DESTDIR =3D
--prefix  =3D /usr/local
-+prefix  =3D /usr
- sbindir =3D $(prefix)/sbin
- mandir  =3D $(prefix)/share/man
- man8dir =3D $(mandir)/man8
diff --git a/meta/recipes-devtools/dmidecode/dmidecode_3.4.bb b/meta/reci=
pes-devtools/dmidecode/dmidecode_3.5.bb
similarity index 50%
rename from meta/recipes-devtools/dmidecode/dmidecode_3.4.bb
rename to meta/recipes-devtools/dmidecode/dmidecode_3.5.bb
index bc741046dd0..3e2bb6e30bc 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode_3.4.bb
+++ b/meta/recipes-devtools/dmidecode/dmidecode_3.5.bb
@@ -4,21 +4,18 @@ DESCRIPTION =3D "Dmidecode reports information about yo=
ur system's hardware as des
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
=20
-SRC_URI =3D "${SAVANNAH_NONGNU_MIRROR}/dmidecode/${BP}.tar.xz \
-           file://0001-Committing-changes-from-do_unpack_extra.patch \
-           "
+SRC_URI =3D "${SAVANNAH_NONGNU_MIRROR}/dmidecode/${BP}.tar.xz"
=20
 COMPATIBLE_HOST =3D "(i.86|x86_64|aarch64|arm|powerpc|powerpc64).*-linux=
"
=20
-EXTRA_OEMAKE =3D "-e MAKEFLAGS=3D"
-
-# The upstream buildsystem uses 'docdir' as the path where it puts AUTHO=
RS,
-# README, etc, but we don't want those in the root of our docdir.
-docdir .=3D "/${BPN}"
-
 do_install() {
-	oe_runmake DESTDIR=3D"${D}" install
+    oe_runmake \
+        DESTDIR=3D"${D}" \
+        prefix=3D"${prefix}" \
+        sbindir=3D"${sbindir}" \
+        docdir=3D"${docdir}/${BPN}" \
+        mandir=3D"${mandir}" \
+        install
 }
=20
-SRC_URI[sha256sum] =3D "43cba851d8467c9979ccdbeab192eb6638c7d3a697eba5dd=
b779da8837542212"
-
+SRC_URI[sha256sum] =3D "79d76735ee8e25196e2a722964cf9683f5a0958150353788=
4b256b01389cc073"
--=20
2.34.1



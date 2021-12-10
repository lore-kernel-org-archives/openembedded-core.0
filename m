Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C47C4167B
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 14:22:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.7715.1639146169711834416
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:22:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E885106F
	for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:22:51 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 38A5D3F5A1
	for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:22:51 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 09/10] subversion: remove obsolete support for renamed
 libtool
Date: Fri, 10 Dec 2021 14:22:41 +0000
Message-Id: <20211210142242.2698587-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211210142242.2698587-1-ross.burton@arm.com>
References: <20211210142242.2698587-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 14:22:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159536

libtool is now longer renamed to ${host}-libtool, so remove the changes
to support this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...001-Fix-libtool-name-in-configure.ac.patch | 29 -------------------
 .../subversion/subversion_1.14.1.bb           |  1 -
 2 files changed, 30 deletions(-)
 delete mode 100644 meta/recipes-devtools/subversion/subversion/0001-Fix-=
libtool-name-in-configure.ac.patch

diff --git a/meta/recipes-devtools/subversion/subversion/0001-Fix-libtool=
-name-in-configure.ac.patch b/meta/recipes-devtools/subversion/subversion=
/0001-Fix-libtool-name-in-configure.ac.patch
deleted file mode 100644
index 5a1b10b2e11..00000000000
--- a/meta/recipes-devtools/subversion/subversion/0001-Fix-libtool-name-i=
n-configure.ac.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From cbcfe0399347989e45a8fb695f55c855d6b3da72 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 7 Dec 2015 17:11:02 +0200
-Subject: [PATCH] Fix libtool name in configure.ac
-
-Upstream-Status: Inappropriate [embedded specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- configure.ac | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 4ed66d4..ceb64f9 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -221,8 +221,8 @@ if test "$experimental_libtool" =3D "yes"; then
-   LIBTOOL=3D"$sh_libtool"
-   SVN_LIBTOOL=3D"$sh_libtool"
- else
--  sh_libtool=3D"$abs_builddir/libtool"
--  SVN_LIBTOOL=3D"\$(SHELL) \"$sh_libtool\""
-+  sh_libtool=3D"$abs_builddir/$host_alias-libtool"
-+  SVN_LIBTOOL=3D"\$(SHELL) \$(abs_builddir)/$host_alias-libtool"
- fi
- AC_SUBST(SVN_LIBTOOL)
-=20
---=20
-2.6.2
-
diff --git a/meta/recipes-devtools/subversion/subversion_1.14.1.bb b/meta=
/recipes-devtools/subversion/subversion_1.14.1.bb
index 87dc359439c..a0a9376f3de 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.1.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.14.1.bb
@@ -10,7 +10,6 @@ DEPENDS:append:class-native =3D " file-replacement-nati=
ve"
=20
 SRC_URI =3D "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://disable_macos.patch \
-           file://0001-Fix-libtool-name-in-configure.ac.patch \
            file://serfmacro.patch \
            "
=20
--=20
2.25.1



Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42508C433FE
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 18:26:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.561.1640024800051380583
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 10:26:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCAC76D
	for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 10:26:38 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 785613F774
	for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 10:26:38 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] kmod: expand compression PACKAGECONFIGs
Date: Mon, 20 Dec 2021 18:26:35 +0000
Message-Id: <20211220182635.885262-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220182635.885262-1-ross.burton@arm.com>
References: <20211220182635.885262-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 18:26:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159898

Turn the explicitly enabled zlib support into an enabled by default
PACKAGECONFIG, and add Zstd support (disabled by default).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-kernel/kmod/kmod_29.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/kmod/kmod_29.bb b/meta/recipes-kernel/km=
od/kmod_29.bb
index 904a17d9d0..9ac5214df6 100644
--- a/meta/recipes-kernel/kmod/kmod_29.bb
+++ b/meta/recipes-kernel/kmod/kmod_29.bb
@@ -24,17 +24,19 @@ SRC_URI =3D "git://git.kernel.org/pub/scm/utils/kerne=
l/kmod/kmod.git;branch=3Dmaster
=20
 S =3D "${WORKDIR}/git"
=20
-EXTRA_OECONF +=3D "--enable-tools --with-zlib"
+EXTRA_OECONF +=3D "--enable-tools"
=20
+PACKAGECONFIG ??=3D "zlib"
 PACKAGECONFIG[debug] =3D "--enable-debug,--disable-debug"
 PACKAGECONFIG[logging] =3D " --enable-logging,--disable-logging"
 PACKAGECONFIG[manpages] =3D "--enable-manpages, --disable-manpages, libx=
slt-native xmlto-native"
-PACKAGECONFIG[xz] =3D "--with-xz,--without-xz,xz"
 PACKAGECONFIG[openssl] =3D "--with-openssl,--without-openssl,openssl"
+PACKAGECONFIG[xz] =3D "--with-xz,--without-xz,xz"
+PACKAGECONFIG[zlib] =3D "--with-zlib,--without-zlib,zlib"
+PACKAGECONFIG[zstd] =3D "--with-zstd,--without-zstd,zstd"
=20
 GTKDOC_DOCDIR =3D "${S}/libkmod/docs"
=20
-DEPENDS +=3D "zlib"
 PROVIDES +=3D "module-init-tools-insmod-static module-init-tools-depmod =
module-init-tools"
 RPROVIDES:${PN} +=3D "module-init-tools-insmod-static module-init-tools-=
depmod module-init-tools"
 RCONFLICTS:${PN} +=3D "module-init-tools-insmod-static module-init-tools=
-depmod module-init-tools"
--=20
2.25.1



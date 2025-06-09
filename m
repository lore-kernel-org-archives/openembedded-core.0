Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADF09C71132
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 11:20:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.56842.1749467999334566620
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 04:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A99714BF
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Jun 2025 04:19:40 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9C2073F59E
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Jun 2025 04:19:58 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 10/16] squashfs-tools: clean up PACKAGECONFIG
Date: Mon,  9 Jun 2025 12:19:42 +0100
Message-ID: <20250609111948.2282441-10-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609111948.2282441-1-ross.burton@arm.com>
References: <20250609111948.2282441-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 11:20:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218279

LZMA isn't supported by the mainline kernel driver, so there's no real
point in enabling it.

Disable LZO by default, as LZO is very obsolete (last released in 2017)
and there are better algorithms available.

Move xattr to the end so it's separate from the compression algorithms.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.bb b=
/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.bb
index 3eb7ad46e94..930439e2d26 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.bb
@@ -1,5 +1,3 @@
-# Note, we can probably remove the lzma option as it has be replaced wit=
h xz,
-# and I don't think the kernel supports it any more.
 SUMMARY =3D "Tools for manipulating SquashFS filesystems"
 HOMEPAGE =3D "https://github.com/plougher/squashfs-tools"
 DESCRIPTION =3D "Tools to create and extract Squashfs filesystems."
@@ -18,14 +16,14 @@ S =3D "${WORKDIR}/git"
=20
 EXTRA_OEMAKE =3D "${PACKAGECONFIG_CONFARGS}"
=20
-PACKAGECONFIG ??=3D "gzip xz lzo lz4 lzma xattr zstd"
+PACKAGECONFIG ??=3D "gzip lz4 xz zstd xattr"
 PACKAGECONFIG[gzip] =3D "GZIP_SUPPORT=3D1,GZIP_SUPPORT=3D0,zlib"
 PACKAGECONFIG[xz] =3D "XZ_SUPPORT=3D1,XZ_SUPPORT=3D0,xz"
 PACKAGECONFIG[lzo] =3D "LZO_SUPPORT=3D1,LZO_SUPPORT=3D0,lzo"
 PACKAGECONFIG[lz4] =3D "LZ4_SUPPORT=3D1,LZ4_SUPPORT=3D0,lz4"
 PACKAGECONFIG[lzma] =3D "LZMA_XZ_SUPPORT=3D1,LZMA_XZ_SUPPORT=3D0,xz"
-PACKAGECONFIG[xattr] =3D "XATTR_SUPPORT=3D1,XATTR_SUPPORT=3D0,attr"
 PACKAGECONFIG[zstd] =3D "ZSTD_SUPPORT=3D1,ZSTD_SUPPORT=3D0,zstd"
+PACKAGECONFIG[xattr] =3D "XATTR_SUPPORT=3D1,XATTR_SUPPORT=3D0,attr"
=20
 do_compile() {
 	oe_runmake -C ${S}/squashfs-tools all
--=20
2.43.0



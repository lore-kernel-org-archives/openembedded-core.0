Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D985F43848
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 15:27:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21953.1776266864378342736
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 08:27:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=GaczSgW9;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 466BB46FC
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 08:27:38 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 885BD3F7B4
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 08:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776266863; bh=y+TaqzVfRj9YBNaZg9oBHDl4sr+pWC3V8X0F3vv6SrI=;
	h=From:To:Subject:Date:From;
	b=GaczSgW9yGXYvHQUcAkA6IlsKspO5bxEYdkaIjnLUUsPrRlmrrNreoTTFrfRVjVRE
	 fVVz2nzFFGHHCfNBC0aKBb/yDEqW3b5g6pXEKVYatXSd0lZRHVYgpAwX9m93Y6axR7
	 3/QpZKbFtKJbxFyBDXNHifMAU6C/SHtnkJ1hEDfE=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] rsync: always use the system zlib
Date: Wed, 15 Apr 2026 16:27:41 +0100
Message-ID: <20260415152742.1597025-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 15:27:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235309

There's nothing gained by adding an option to use the vendored zlib
apart from the chance of accidentally not using it, so remove the
PACKAGECONFIG and just explicitly depend on zlib.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/rsync/rsync_3.4.1.bb | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/rsync/rsync_3.4.1.bb b/meta/recipes-de=
vtools/rsync/rsync_3.4.1.bb
index 2e4f9af3119..6d3ed359db6 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
@@ -8,7 +8,7 @@ SECTION =3D "console/network"
 LICENSE =3D "GPL-3.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D24423708fe159c9d12be1ea29fcb1=
8c7"
=20
-DEPENDS =3D "popt"
+DEPENDS =3D "popt zlib"
=20
 SRC_URI =3D "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://rsyncd.conf \
@@ -22,7 +22,7 @@ SRC_URI[sha256sum] =3D "2924bcb3a1ed8b551fc101f740b9f0f=
e0a202b115027647cf69850d65f
 # Doesn't use automake
 inherit autotools-brokensep
=20
-PACKAGECONFIG ??=3D "acl attr system-zlib \
+PACKAGECONFIG ??=3D "acl attr \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
 "
=20
@@ -33,14 +33,13 @@ PACKAGECONFIG[lz4] =3D "--enable-lz4,--disable-lz4,lz=
4"
 PACKAGECONFIG[openssl] =3D "--enable-openssl,--disable-openssl,openssl"
 PACKAGECONFIG[xxhash] =3D "--enable-xxhash,--disable-xxhash,xxhash"
 PACKAGECONFIG[zstd] =3D "--enable-zstd,--disable-zstd,zstd"
-PACKAGECONFIG[system-zlib] =3D "--with-included-zlib=3Dno,--with-include=
d-zlib=3Dyes,zlib"
=20
 # By default, if crosscompiling, rsync disables a number of
 # capabilities, hardlinking symlinks and special files (i.e. devices)
 CACHED_CONFIGUREVARS +=3D "rsync_cv_can_hardlink_special=3Dyes rsync_cv_=
can_hardlink_symlink=3Dyes"
=20
 EXTRA_OEMAKE =3D 'STRIP=3D""'
-EXTRA_OECONF =3D "--disable-md2man --with-nobody-group=3Dnogroup"
+EXTRA_OECONF =3D "--disable-md2man --with-nobody-group=3Dnogroup --witho=
ut-included-zlib"
=20
 #| ./simd-checksum-x86_64.cpp: In function 'uint32_t get_checksum1_cpp(c=
har*, int32_t)':
 #| ./simd-checksum-x86_64.cpp:89:52: error: multiversioning needs 'ifunc=
' which is not supported on this target
--=20
2.43.0



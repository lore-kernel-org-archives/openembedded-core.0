Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA61EC4332F
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 13:32:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.40932.1666013536795110182
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Oct 2022 06:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 932871042;
	Mon, 17 Oct 2022 06:32:22 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E67203F67D;
	Mon, 17 Oct 2022 06:32:15 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/3] zlib: use .gz archive and set a PREMIRROR
Date: Mon, 17 Oct 2022 14:32:09 +0100
Message-Id: <20221017133211.212616-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 13:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171909

When a new zlib release is made, the top-level URL is no longer available
and it is only available as a .gz under the /fossils/ directory.

When this happens the source fetch fails and bitbake noisily warns that
it is using the mirrors.  Avoid this by using the .gz tarball and add
the /fossils/ directory to PREMIRRORS so fetches will check there too.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/zlib/zlib_1.2.12.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/zlib/zlib_1.2.12.bb b/meta/recipes-core/zl=
ib/zlib_1.2.12.bb
index b999f13530e..2491cb941f5 100644
--- a/meta/recipes-core/zlib/zlib_1.2.12.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.12.bb
@@ -6,7 +6,8 @@ SECTION =3D "libs"
 LICENSE =3D "Zlib"
 LIC_FILES_CHKSUM =3D "file://zlib.h;beginline=3D6;endline=3D23;md5=3D537=
7232268e952e9ef63bc555f7aa6c0"
=20
-SRC_URI =3D "https://zlib.net/${BP}.tar.xz \
+# The source tarball needs to be .gz as only the .gz ends up in fossils/
+SRC_URI =3D "https://zlib.net/${BP}.tar.gz \
            file://cc.patch \
            file://ldflags-tests.patch \
            file://0001-configure-Pass-LDFLAGS-to-link-tests.patch \
@@ -17,7 +18,11 @@ SRC_URI =3D "https://zlib.net/${BP}.tar.xz \
            "
 UPSTREAM_CHECK_URI =3D "http://zlib.net/"
=20
-SRC_URI[sha256sum] =3D "7db46b8d7726232a621befaab4a1c870f00a90805511c0e0=
090441dac57def18"
+SRC_URI[sha256sum] =3D "91844808532e5ce316b3c010929493c0244f3d37593afd6d=
e04f71821d5136d9"
+
+# When a new release is made the previous release is moved to fossils/, =
so add this
+# to PREMIRRORS so it is also searched automatically.
+PREMIRRORS:append =3D " https://zlib.net/ https://zlib.net/fossils/"
=20
 CFLAGS +=3D "-D_REENTRANT"
=20
--=20
2.34.1



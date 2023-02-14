Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8285C05027
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 16:42:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.12165.1676392926862501181
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 08:42:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0329A1042;
	Tue, 14 Feb 2023 08:42:49 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF03F3F663;
	Tue, 14 Feb 2023 08:42:05 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] libcgroup: clean up musl DEPENDS
Date: Tue, 14 Feb 2023 16:42:04 +0000
Message-Id: <20230214164204.2792379-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 16:42:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177157

libcgroup uses fts_* functions, but these are not implemented in musl so
we depend on the fts recipe and force a link to libfts.

However since 3.0.0 libcgroup will automatically look for fts_open in
both libc and libfts[1], so this can be simplified to just a conditional
DEPENDS.

[1] https://github.com/libcgroup/libcgroup/commit/27ba904355575153308bdc0=
fa48344ef1be55ca1

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/libcgroup/libcgroup_3.0.0.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-core/libcgroup/libcgroup_3.0.0.bb b/meta/recipe=
s-core/libcgroup/libcgroup_3.0.0.bb
index 9937a17fb51..457b965481d 100644
--- a/meta/recipes-core/libcgroup/libcgroup_3.0.0.bb
+++ b/meta/recipes-core/libcgroup/libcgroup_3.0.0.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4d794c5d710e=
5b3547a6cc6a6609a641"
 inherit autotools pkgconfig github-releases
=20
 DEPENDS =3D "bison-native flex-native"
+DEPENDS:append:libc-musl =3D " fts"
=20
 SRC_URI =3D "${GITHUB_BASE_URI}/download/v3.0/${BP}.tar.gz \
            file://0001-api-Use-GNU-strerror_r-when-available.patch \
@@ -18,9 +19,6 @@ UPSTREAM_CHECK_URI =3D "https://github.com/libcgroup/li=
bcgroup/tags"
=20
 SRC_URI[sha256sum] =3D "8d284d896fca1c981b55850e92acd3ad9648a69227c028dd=
a7ae3402af878edd"
=20
-DEPENDS:append:libc-musl =3D " fts "
-EXTRA_OEMAKE:append:libc-musl =3D " LIBS=3D-lfts"
-
 PACKAGECONFIG =3D "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
 PACKAGECONFIG[pam] =3D "--enable-pam-module-dir=3D${base_libdir}/securit=
y --enable-pam=3Dyes,--enable-pam=3Dno,libpam"
=20
--=20
2.34.1



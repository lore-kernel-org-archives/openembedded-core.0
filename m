Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D638C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 17:09:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.53515.1744045751458927793
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 10:09:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7D55106F
	for <openembedded-core@lists.openembedded.org>; Mon,  7 Apr 2025 10:09:11 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 75E4A3F59E
	for <openembedded-core@lists.openembedded.org>; Mon,  7 Apr 2025 10:09:10 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cmake: fix upstream release checking
Date: Mon,  7 Apr 2025 18:09:06 +0100
Message-ID: <20250407170906.3514273-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 17:09:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214470

New releases are no longer made to SourceForge and the GitHub releases
are considered official according to https://libjpeg-turbo.org, so
inherit github-releases and update the SRC_URI.

This now reports that we need to upgrade to 3.1.0.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb b/meta/rec=
ipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
index 4ff4cec721b..56bab4dacad 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
@@ -8,11 +8,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D2a8e0d8226=
a102f07ab63ed7fd6ce155"
 DEPENDS:append:x86-64:class-target =3D " nasm-native"
 DEPENDS:append:x86:class-target =3D " nasm-native"
=20
-SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
-
+SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz"
 SRC_URI[sha256sum] =3D "22429507714ae147b3acacd299e82099fce5d9f456882fc2=
8e252e4579ba2a75"
-UPSTREAM_CHECK_URI =3D "http://sourceforge.net/projects/libjpeg-turbo/fi=
les/"
-UPSTREAM_CHECK_REGEX =3D "/libjpeg-turbo/files/(?P<pver>(\d+[\.\-_]*)+)/=
"
=20
 PE =3D "1"
=20
@@ -22,7 +19,7 @@ RPROVIDES:${PN} +=3D "jpeg"
 RREPLACES:${PN} +=3D "jpeg"
 RCONFLICTS:${PN} +=3D "jpeg"
=20
-inherit cmake pkgconfig
+inherit cmake pkgconfig github-releases
=20
 export NASMENV =3D "--reproducible --debug-prefix-map=3D${WORKDIR}=3D${T=
ARGET_DBGSRC_DIR}"
=20
--=20
2.43.0



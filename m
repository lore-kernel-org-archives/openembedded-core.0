Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E49C7EE22
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 13:21:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.27122.1683292909202278555
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 06:21:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35113113E;
	Fri,  5 May 2023 06:22:33 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6FE013F64C;
	Fri,  5 May 2023 06:21:48 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/3] python3: use system expat
Date: Fri,  5 May 2023 14:21:44 +0100
Message-Id: <20230505132144.2951723-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505132144.2951723-1-ross.burton@arm.com>
References: <20230505132144.2951723-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 13:21:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180919

From: Ross Burton <ross.burton@arm.com>

Instead of statically linking to an integrated expat which may not be
updated to fix security issues, dynamically link to the system expat.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3_3.11.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.11.2.bb b/meta/recipe=
s-devtools/python/python3_3.11.2.bb
index 810f0c2e009..421a305e22f 100644
--- a/meta/recipes-devtools/python/python3_3.11.2.bb
+++ b/meta/recipes-devtools/python/python3_3.11.2.bb
@@ -72,11 +72,11 @@ ALTERNATIVE_LINK_NAME[python3-config] =3D "${bindir}/=
python${PYTHON_MAJMIN}-config
 ALTERNATIVE_TARGET[python3-config] =3D "${bindir}/python${PYTHON_MAJMIN}=
-config-${MULTILIB_SUFFIX}"
=20
=20
-DEPENDS =3D "bzip2-replacement-native libffi bzip2 openssl sqlite3 zlib =
virtual/libintl xz virtual/crypt util-linux-libuuid libtirpc libnsl2 auto=
conf-archive-native ncurses"
+DEPENDS =3D "bzip2-replacement-native expat libffi bzip2 openssl sqlite3=
 zlib virtual/libintl xz virtual/crypt util-linux-libuuid libtirpc libnsl=
2 autoconf-archive-native ncurses"
 DEPENDS:append:class-target =3D " python3-native"
 DEPENDS:append:class-nativesdk =3D " python3-native"
=20
-EXTRA_OECONF =3D " --without-ensurepip --enable-shared --with-platlibdir=
=3D${baselib}"
+EXTRA_OECONF =3D " --without-ensurepip --enable-shared --with-platlibdir=
=3D${baselib} --with-system-expat"
 EXTRA_OECONF:append:class-native =3D " --bindir=3D${bindir}/${PN}"
 EXTRA_OECONF:append:class-target =3D " --with-build-python=3Dnativepytho=
n3"
 EXTRA_OECONF:append:class-nativesdk =3D " --with-build-python=3Dnativepy=
thon3"
--=20
2.34.1



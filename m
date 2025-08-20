Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA11CA0EF5
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 13:29:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.19892.1755696579570538200
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 06:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C32081F37
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 06:29:30 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9F8003F58B
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 06:29:38 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] spirv-tools: improve packaging
Date: Wed, 20 Aug 2025 14:29:28 +0100
Message-ID: <20250820132929.2644708-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820132929.2644708-1-ross.burton@arm.com>
References: <20250820132929.2644708-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 13:29:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222180

spirv-tools is a set of libraries and some binaries that link to those
libraries, so inherit lib_package so that the binaries and the libraries
are packaged separately.

The lesspipe script hasn't needed bash since 2018[1], so remove the bash
dependency and package the script with the other binaries.

The build type unless specified is Debug, explicitly set RelWithDebInfo.

[1] spirv-tools f70e9e "tools/lesspipe: Allow generic shell (#2255)"

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb b/meta/r=
ecipes-graphics/spir/spirv-tools_1.4.321.0.bb
index 319b25b7f43..5242473e6bc 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
@@ -18,11 +18,12 @@ PE =3D "1"
 # upstream considers a release.
 UPSTREAM_CHECK_GITTAGREGEX =3D "sdk-(?P<pver>\d+(\.\d+)+)"
=20
-inherit cmake
+inherit cmake lib_package
=20
 DEPENDS =3D "spirv-headers"
=20
 EXTRA_OECMAKE +=3D "\
+    -DCMAKE_BUILD_TYPE=3DRelWithDebInfo \
     -DSPIRV-Headers_SOURCE_DIR=3D${STAGING_EXECPREFIXDIR} \
     -DSPIRV_TOOLS_BUILD_STATIC=3DOFF \
     -DBUILD_SHARED_LIBS=3DON \
@@ -45,8 +46,4 @@ do_install:append:class-target() {
 SOLIBS =3D ".so"
 FILES_SOLIBSDEV =3D ""
=20
-PACKAGES =3D+ "${PN}-lesspipe"
-FILES:${PN}-lesspipe =3D "${base_bindir}/spirv-lesspipe.sh"
-RDEPENDS:${PN}-lesspipe +=3D "${PN} bash"
-
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0



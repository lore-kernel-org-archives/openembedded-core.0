Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96691C77B7A
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 18:40:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.30015.1684262439259648118
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 11:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9F502F4;
	Tue, 16 May 2023 11:41:23 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 61C5E3F793;
	Tue, 16 May 2023 11:40:38 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com,
	kubiznak@2n.com
Subject: [PATCH 2/7] gobject-introspection: always DEPEND on gobject-introspection-native
Date: Tue, 16 May 2023 19:40:26 +0100
Message-Id: <20230516184031.2255171-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516184031.2255171-1-ross.burton@arm.com>
References: <20230516184031.2255171-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 18:40:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181415

From: Ross Burton <ross.burton@arm.com>

If a recipe inherits gobject-introspection then there's a good chance
that it needs the gobject-introspection-native recipe for the m4 macros
in introspection.m4, because we always autoreconf so we always need the
macros to be present.

Change the dependencies so that inheriting g-i always adds a dependency
on gobject-introspection-native, and a dependency on qemu-native and
target gobject-introspection if G-I is enabled.

Partially reverts 4e51c18.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../gobject-introspection.bbclass              | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/meta/classes-recipe/gobject-introspection.bbclass b/meta/cla=
sses-recipe/gobject-introspection.bbclass
index 98edb93761f..65c67ddc721 100644
--- a/meta/classes-recipe/gobject-introspection.bbclass
+++ b/meta/classes-recipe/gobject-introspection.bbclass
@@ -35,23 +35,19 @@ EXTRA_OEMESON:prepend:class-nativesdk =3D "${@['', '$=
{GIRMESONBUILD}'][d.getVar('G
=20
 # Generating introspection data depends on a combination of native and t=
arget
 # introspection tools, and qemu to run the target tools.
-DEPENDS:append:class-target =3D " ${@bb.utils.contains('GI_DATA_ENABLED'=
, 'True', 'gobject-introspection gobject-introspection-native qemu-native=
', '', d)}"
+DEPENDS:append:class-target =3D " ${@bb.utils.contains('GI_DATA_ENABLED'=
, 'True', 'gobject-introspection qemu-native', '', d)}"
=20
-# Even though introspection is disabled on -native, gobject-introspectio=
n package is still
-# needed for m4 macros.
-DEPENDS:append:class-native =3D " gobject-introspection-native"
-DEPENDS:append:class-nativesdk =3D " gobject-introspection-native"
+# Even when introspection is disabled, the gobject-introspection package=
 is still needed for m4 macros.
+DEPENDS:append =3D " gobject-introspection-native"
=20
 # This is used by introspection tools to find .gir includes
 export XDG_DATA_DIRS =3D "${STAGING_DATADIR}:${STAGING_LIBDIR}"
=20
 do_configure:prepend:class-target () {
-    if [ "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '1', '0', d)}"=
 =3D "1" ] ; then
-        # introspection.m4 pre-packaged with upstream tarballs does not =
yet
-        # have our fixes
-        mkdir -p ${S}/m4
-        cp ${STAGING_DIR_TARGET}/${datadir}/aclocal/introspection.m4 ${S=
}/m4
-    fi
+    # introspection.m4 pre-packaged with upstream tarballs does not yet
+    # have our fixes
+    mkdir -p ${S}/m4
+    cp ${STAGING_DIR_NATIVE}/${datadir}/aclocal/introspection.m4 ${S}/m4
 }
=20
 # .typelib files are needed at runtime and so they go to the main packag=
e (so
--=20
2.34.1



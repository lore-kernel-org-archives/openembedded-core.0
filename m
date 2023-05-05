Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FEC0C77B7C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 13:21:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.26951.1683292908495415528
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 06:21:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 889A52F4;
	Fri,  5 May 2023 06:22:32 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C2E463F64C;
	Fri,  5 May 2023 06:21:47 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/3] python3: clean up PACKAGECONFIG
Date: Fri,  5 May 2023 14:21:43 +0100
Message-Id: <20230505132144.2951723-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230505132144.2951723-1-ross.burton@arm.com>
References: <20230505132144.2951723-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 13:21:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180918

From: Ross Burton <ross.burton@arm.com>

There's no need to define the PACKAGECONFIG for each class when they're
all identical (as native DISTRO_FEATURES are pruned before use).

Also add a disabled case to the LTO configuration to be explicit.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3_3.11.2.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.11.2.bb b/meta/recipe=
s-devtools/python/python3_3.11.2.bb
index 4a9aa9306bc..810f0c2e009 100644
--- a/meta/recipes-devtools/python/python3_3.11.2.bb
+++ b/meta/recipes-devtools/python/python3_3.11.2.bb
@@ -95,9 +95,7 @@ CACHED_CONFIGUREVARS =3D " \
 "
=20
 # PGO currently causes builds to not be reproducible so disable by defau=
lt, see YOCTO #13407
-PACKAGECONFIG:class-target ??=3D "editline gdbm ${@bb.utils.filter('DIST=
RO_FEATURES', 'lto', d)}"
-PACKAGECONFIG:class-native ??=3D "editline gdbm"
-PACKAGECONFIG:class-nativesdk ??=3D "readline gdbm"
+PACKAGECONFIG ??=3D "editline gdbm ${@bb.utils.filter('DISTRO_FEATURES',=
 'lto', d)}"
 PACKAGECONFIG[readline] =3D "--with-readline=3Dreadline,,readline,,,edit=
line"
 PACKAGECONFIG[editline] =3D "--with-readline=3Deditline,,libedit,,,readl=
ine"
 # Use profile guided optimisation by running PyBench inside qemu-user
@@ -105,7 +103,7 @@ PACKAGECONFIG[pgo] =3D "--enable-optimizations,,qemu-=
native"
 PACKAGECONFIG[tk] =3D ",,tk"
 PACKAGECONFIG[tcl] =3D ",,tcl"
 PACKAGECONFIG[gdbm] =3D ",,gdbm"
-PACKAGECONFIG[lto] =3D "--with-lto,,"
+PACKAGECONFIG[lto] =3D "--with-lto,--without-lto"
=20
 do_configure:prepend () {
     mkdir -p ${B}/Modules
--=20
2.34.1



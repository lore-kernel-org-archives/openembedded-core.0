Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E4E8C47258
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 20:29:42 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web11.14944.1705523375746472237
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 12:29:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=BgD5IZ8F;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id CC45C240027
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 21:29:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1705523373; bh=x1OSJXwhz1w8d56p0Md1Vyaypsgaf9VdM/Df0gjz2oY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=BgD5IZ8Fa7fOwjstOSZyCtt26KIE6ToRSzq1f4rLP2m7PkwUjMnoMKcTPmH0cGniq
	 iWT8Nxlt3j2HSQCOK0DctjIJyvZ++/OrFjcXZ07XN9/yc7dXU4N+4UjiPFqZ1HCoMO
	 AnnhE8OCmp9tuubGJokaIwW+VeJ6rWRrtgjjqdJ3N5gYfUii2rfXRD5vnWuz4bLSCW
	 fvfyUSYLsq9wtXi455S88IAu1+NkQ9r1/X6J5LotERLfdVQDvNNLGOjQQq7dXBdZOH
	 OZEyvHU6C+/LXwXhykTOYOLcW0k5CKP9zKoGCuLJ7WE8Ldlf6hoNOw8qkrcnXglygG
	 kNfZt8HeAzJcg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TFctP1CCGz6tvp;
	Wed, 17 Jan 2024 21:29:33 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH v2] tune-core2: Update qemu cpu to supported model
Date: Wed, 17 Jan 2024 20:29:23 +0000
Message-Id: <20240117202923.29341-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 20:29:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193946

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Fixes [YOCTO #12388]

QEMUs documentation does recommend to not use n270 and core2duo as
an argument to -cpu anymore. See also the QEMU documentation for this at
[0].
Update therefore the QEMU cpu option for the core2duo tune to Nehalam.
Tested it locally with QEMU and KVM.

[0]: https://qemu-project.gitlab.io/qemu/system/qemu-cpu-models.html#othe=
r-non-recommended-x86-cpus

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 meta/conf/machine/include/x86/tune-core2.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/x86/tune-core2.inc b/meta/conf/mac=
hine/include/x86/tune-core2.inc
index 97b7c1b188..082fd4efc3 100644
--- a/meta/conf/machine/include/x86/tune-core2.inc
+++ b/meta/conf/machine/include/x86/tune-core2.inc
@@ -21,18 +21,18 @@ TUNE_FEATURES:tune-core2-32 =3D "${TUNE_FEATURES:tune=
-x86} core2"
 BASE_LIB:tune-core2-32 =3D "lib"
 TUNE_PKGARCH:tune-core2-32 =3D "core2-32"
 PACKAGE_EXTRA_ARCHS:tune-core2-32 =3D "${PACKAGE_EXTRA_ARCHS:tune-i686} =
core2-32"
-QEMU_EXTRAOPTIONS_core2-32 =3D " -cpu n270"
+QEMU_EXTRAOPTIONS_core2-32 =3D " -cpu Nehalem,check=3Dfalse"
=20
 AVAILTUNES +=3D "core2-64"
 TUNE_FEATURES:tune-core2-64 =3D "${TUNE_FEATURES:tune-x86-64} core2"
 BASE_LIB:tune-core2-64 =3D "lib64"
 TUNE_PKGARCH:tune-core2-64 =3D "core2-64"
 PACKAGE_EXTRA_ARCHS:tune-core2-64 =3D "${PACKAGE_EXTRA_ARCHS:tune-x86-64=
} core2-64"
-QEMU_EXTRAOPTIONS_core2-64 =3D " -cpu core2duo"
+QEMU_EXTRAOPTIONS_core2-64 =3D " -cpu Nehalem,check=3Dfalse"
=20
 AVAILTUNES +=3D "core2-64-x32"
 TUNE_FEATURES:tune-core2-64-x32 =3D "${TUNE_FEATURES:tune-x86-64-x32} co=
re2"
 BASE_LIB:tune-core2-64-x32 =3D "libx32"
 TUNE_PKGARCH:tune-core2-64-x32 =3D "core2-64-x32"
 PACKAGE_EXTRA_ARCHS:tune-core2-64-x32 =3D "${PACKAGE_EXTRA_ARCHS:tune-x8=
6-64-x32} core2-64-x32"
-QEMU_EXTRAOPTIONS_core2-64-x32 =3D " -cpu core2duo"
+QEMU_EXTRAOPTIONS_core2-64-x32 =3D " -cpu Nehalem,check=3Dfalse"
--=20
2.39.2



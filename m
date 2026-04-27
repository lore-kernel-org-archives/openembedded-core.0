Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C8DFF885E
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 13:09:23 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44880.1777295360151661303
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 06:09:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=l6M9a4pK;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5B7664E42B33;
	Mon, 27 Apr 2026 13:09:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 329B6600D1;
	Mon, 27 Apr 2026 13:09:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A9C8110728203;
	Mon, 27 Apr 2026 15:09:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777295355; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=G+oM7SGjrLlcOqHICJUFq+DJGxcoEgQ/LCCC8WVbZKE=;
	b=l6M9a4pK1Z7lmvhvqLH0R4JhTB5dfV4VFFnZJwAokZO5wvZ9dK4bfynmYjDlDYPFnS6ZYX
	0I1O3NurXfpjDhwj2J+m5z15+SskoFAe2fXfIdHKZzrcqt3PzDdNXBD1yywFxt9iObo4Gp
	TB1SB4dRqJb0477XJ/SBpA5Eu7QEu5ZuCSV7ZFwPJvqSN+K9wTKDlQLQ4+L4gsmkY3JExU
	iWoVHjQK0qhX21jHZbML2yIZligmyAjr4Lshmxr1FCIotb+nZqw4IChSpDTo+ZO09L874D
	rVXO33JQ40HSM0dwwraz9W6WJEsuJUF0LP1R7VNjKNpf1PxiQO6gze5MI4Dn7g==
From: =?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	quentin.schulz@cherry.de,
	qi.chen@windriver.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [PATCH v2 3/3] machine: include: arm: simplify conditional operations with bb.utils.filter
Date: Mon, 27 Apr 2026 15:08:46 +0200
Message-ID: <20260427130846.96013-4-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260427130846.96013-1-joaomarcos.costa@bootlin.com>
References: <20260427130846.96013-1-joaomarcos.costa@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 13:09:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236011

Some configuration files use bb.utils.contains to check for a string
inside a variable, and return the exact same string if true.

This can be simplified by a call to bb.utils.filter, since the result is
the same, and the inline is shorter.

Replace "bb.utils.contains(A, 'a', 'a', '', d)" by "bb.utils.filter(A, 'a=
', d)".

bb.utils.filter() does not return the string with a leading space, and
this is handled by a leading space outside of the helper. This
workaround, however, has its limitations: the leading space is always
added. To avoid any potential issues, use .strip() when dereferencing
TUNE_CCARGS_MFPU in the if statements.

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta/conf/machine/include/arm/feature-arm-neon.inc | 8 ++++----
 meta/conf/machine/include/arm/feature-arm-vfp.inc  | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/conf/machine/include/arm/feature-arm-neon.inc b/meta/co=
nf/machine/include/arm/feature-arm-neon.inc
index 174b9b9f2a..2ec354bfeb 100644
--- a/meta/conf/machine/include/arm/feature-arm-neon.inc
+++ b/meta/conf/machine/include/arm/feature-arm-neon.inc
@@ -5,16 +5,16 @@
 # 'vfp', -mfloat-abi parameter and 'hf' suffix is implemented in feature=
-arm-vfp.inc
=20
 TUNEVALID[neon] =3D "Enable Neon SIMD accelerator unit."
-TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'neon', ' n=
eon', '', d)}"
+TUNE_CCARGS_MFPU .=3D " ${@bb.utils.filter('TUNE_FEATURES', 'neon', d)}"
=20
 TUNEVALID[vfpv3d16] =3D "Enable Vector Floating Point Version 3 with 16 =
registers (vfpv3-d16) unit."
-TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3d16',=
 ' vfpv3-d16', '', d)}"
+TUNE_CCARGS_MFPU .=3D " ${@bb.utils.contains('TUNE_FEATURES', 'vfpv3d16'=
, ' vfpv3-d16', '', d)}"
=20
 TUNEVALID[vfpv3] =3D "Enable Vector Floating Point Version 3 with 32 reg=
isters (vfpv3) unit."
-TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfpv3', ' =
vfpv3', '' , d)}"
+TUNE_CCARGS_MFPU .=3D " ${@bb.utils.filter('TUNE_FEATURES', 'vfpv3', d)}=
"
=20
 TUNEVALID[vfpv4] =3D "Enable Vector Floating Point Version 4 (vfpv4) uni=
t."
-TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfpv4', ' =
vfpv4', '', d)}"
+TUNE_CCARGS_MFPU .=3D " ${@bb.utils.filter('TUNE_FEATURES', 'vfpv4', d)}=
"
 TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', [ 'vfpv4', =
'neon' ], ' neon-vfpv4', '', d)}"
=20
 TUNEVALID[vfpv4d16] =3D "Enable Vector Floating Point Version 4 with 16 =
registers (vfpv4-d16) unit."
diff --git a/meta/conf/machine/include/arm/feature-arm-vfp.inc b/meta/con=
f/machine/include/arm/feature-arm-vfp.inc
index d020100daa..22cd5e1767 100644
--- a/meta/conf/machine/include/arm/feature-arm-vfp.inc
+++ b/meta/conf/machine/include/arm/feature-arm-vfp.inc
@@ -3,14 +3,14 @@
 # and this .inc file is included from armv5
=20
 TUNEVALID[vfp] =3D "Enable Vector Floating Point (vfp) unit."
-TUNE_CCARGS_MFPU .=3D "${@bb.utils.contains('TUNE_FEATURES', 'vfp', ' vf=
p', '', d)}"
+TUNE_CCARGS_MFPU .=3D " ${@bb.utils.filter('TUNE_FEATURES', 'vfp', d)}"
=20
 # simd is special, we don't pass this to the -mfpu, it's implied
-TUNE_CCARGS  .=3D "${@ (' -mfpu=3D%s' % d.getVar('TUNE_CCARGS_MFPU').spl=
it()[-1]) if (d.getVar('TUNE_CCARGS_MFPU') !=3D '') else ''}"
+TUNE_CCARGS  .=3D "${@ (' -mfpu=3D%s' % d.getVar('TUNE_CCARGS_MFPU').spl=
it()[-1]) if (d.getVar('TUNE_CCARGS_MFPU').strip() !=3D '') else ''}"
 # The following deals with both vfpv3-d16 and vfpv4-d16
-ARMPKGSFX_FPU =3D "${@ ('-%s'       % d.getVar('TUNE_CCARGS_MFPU').split=
()[-1].replace('-d16', 'd16')) if (d.getVar('TUNE_CCARGS_MFPU') !=3D '') =
else ''}"
+ARMPKGSFX_FPU =3D "${@ ('-%s'       % d.getVar('TUNE_CCARGS_MFPU').split=
()[-1].replace('-d16', 'd16')) if (d.getVar('TUNE_CCARGS_MFPU').strip() !=
=3D '') else ''}"
=20
 TUNEVALID[callconvention-hard] =3D "Enable EABI hard float call conventi=
on, requires VFP."
-TUNE_CCARGS_MFLOAT =3D "${@ bb.utils.contains('TUNE_FEATURES', 'callconv=
ention-hard', 'hard', 'softfp', d) if (d.getVar('TUNE_CCARGS_MFPU') !=3D =
'' or bb.utils.contains('TUNE_FEATURES', 'simd', True, False, d)) else ''=
 }"
+TUNE_CCARGS_MFLOAT =3D "${@ bb.utils.contains('TUNE_FEATURES', 'callconv=
ention-hard', 'hard', 'softfp', d) if (d.getVar('TUNE_CCARGS_MFPU').strip=
() !=3D '' or bb.utils.contains('TUNE_FEATURES', 'simd', True, False, d))=
 else '' }"
 TUNE_CCARGS   .=3D "${@ ' -mfloat-abi=3D${TUNE_CCARGS_MFLOAT}' if (d.get=
Var('TUNE_CCARGS_MFLOAT') !=3D '')     else ''}"
 ARMPKGSFX_EABI =3D "${@ 'hf'                                 if (d.getVa=
r('TUNE_CCARGS_MFLOAT') =3D=3D 'hard') else ''}"
--=20
2.47.0



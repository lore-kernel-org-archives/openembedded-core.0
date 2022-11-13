Return-Path: <christoph.lauer@email.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC2FEC4332F
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 08:43:22 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by mx.groups.io with SMTP id smtpd.web08.984.1668328997851340314
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Nov 2022 00:43:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@email.de header.s=s29768273 header.b=Rho1CZDf;
 spf=pass (domain: email.de, ip: 212.227.17.12, mailfrom: christoph.lauer@email.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=email.de;
	s=s29768273; t=1668328995;
	bh=TRbi5gDXvq2LqmWKdyW9VXNOlcmaQim+xN+2tuWjnmM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Rho1CZDfTQcw26NagKvr1WZshRZ+gNQrEctSbeaOTfTFagc9pXReepJU+d8KR/ZYt
	 1vYpVTNIN5W2XMdwrb0qa9W/3lGUpoNr+ZDEsT+zzX96xV85KQayNySvgcq8ZUjGv6
	 e1e2MyEYQnHaogvDF4IW+g6MOPABs6BlzUanvDSTiVWcw//MVSAMP/2sW8URKIQL1k
	 BcXziSCpP6d3JRHcWH4Ef9xQ6ZSWytohKlxSON4H+4OarIsNRLuJU2z4XyYJ0xt18q
	 6EfV1i+scniFmTeIVoP3NNGxLZXtqgevoLfXsP1TGlVFAe0nbpZ1BPBL6cACP4AItO
	 /rkzOQn52qgDg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from xtr-acuyocto-p01.xtronic-net.com ([178.251.90.190]) by
 smtp.web.de (mrweb105 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1MdfCN-1pTTT032ll-00ZF1d; Sun, 13 Nov 2022 09:43:15 +0100
From: Christoph Lauer <christoph.lauer@email.de>
To: openembedded-core@lists.openembedded.org
Cc: Christoph Lauer <christoph.lauer@xtronic.de>
Subject: [PATCH 2/2] poky.conf: set initial DISTRO_FEATURES as weak as possible
Date: Sun, 13 Nov 2022 08:42:55 +0000
Message-Id: <20221113084255.18113-2-christoph.lauer@email.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221113084255.18113-1-christoph.lauer@email.de>
References: <20221113084255.18113-1-christoph.lauer@email.de>
X-Provags-ID: V03:K1:b9gNsmjOwNIzRG2ByJRGnBKtsc3nThp4WyY/LIqrMujuXJR5WU8
 ro+8T+2TKYQRSTHIieGqGfZ46UpkbQGRtZ7AvIsHprbJNUDZhmtxvrceoj6hIcuZ7uMByqo
 YW4L2etFWah1K6Ts/Afk9cIstK9Yg14FudVtuvnVKKK8iWlZii2Zp+1rUpnh50aQsvrCPvB
 6CpGO87I8e6o32TKCdcbA==
UI-OutboundReport: notjunk:1;M01:P0:PR4FgfcVVSw=;6tiWgcQR+jdXYPUAktZ1bhFbxcK
 lZHthBFM7HEpEom6veYAUAg/d42dkoyTSsbovAvbcnPHxCyTiTG4i67EyEbf6h8/1hLCjiWpP
 g8ZU3IBsuYywgTIcjkD41ojcV+/6frd2y0uVdnrl58hVEpZeOJ9Ou47HlSuNnwCPK9MSO9BgG
 jFh09vP45GTH9MrhMJmxVP8WoQUZ+m6hwbbTK5Q2upoj9JE0ISTS7zxjlxZKqFZtlZbMn/egC
 DfXRyUXo5atm82mJ6goXCOTweVPFgeZ+lMe2flAy7hMaFAn0TOz0Bqnm7wHrlps91us0UUoff
 nG8sF2NX3IDIlaxMslsryf1BpxJ2IvDshkwOO2mZA99qArZBTntgEdUr8LtV+Y0VBCZsRBroD
 DXjydq+oVdBoVA+TX7xNol+tW6Ovz3KzEzVP49o3t6q8VlDt4eAeNTBAk49OU5oWBKYBF2kAs
 QMo4kAbZYA1MDFZhc8QkAlOTAQRRQNYieTIazEtZbFgBqjJ1NgFEib47w3S4atXAl4Yz/3iPG
 sjL5BjcoWgsb5jEIdQLTFvdK90fB9BZZBWT61IUi08ZtdjOt7oTzGh4OZPqsdm2aQ4sUy7FM3
 bheSwJme03FobpJXtGpEiunz2h0S2wimsIVrH8aixVeDuaoo5xb8HsI0bBINc941GJR6ATI0I
 jJRwuQaU+H3Ax9guH6dfw20Sb9ROY+jKfppTbnIJ05hgxHePQIVvPFT5auwd3ItgCz/tBEUBo
 l81DOHQIyxVNUbpl5wSlUVKhCUl6J42fNVSmaUXVpNmni5vahmBeRdC+eHbx+hLg5Nl4lLrH5
 kHcYx4Wk9l9iWuH7do6zUwRweFeDwxE63boBBItwDVa1r1KvWuhip4GqpEH33qAZGkmDW68rB
 LwgE3JnaLeJ+tU4CuGvXR5cIS3SYI+sojVXg1rTxslo+cnv/EpvcR6G3aboAKnK8IiL1pUzmL
 J88uEV6hHxpUcRLc0xbRhvtg9ok=
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 08:43:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173186

From: Christoph Lauer <christoph.lauer@xtronic.de>

This gives BSP creators the flexibility to change features with weak defau=
lts

Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
=2D--
 meta-poky/conf/distro/poky.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.=
conf
index 3e90766349..3a453ef9ed 100644
=2D-- a/meta-poky/conf/distro/poky.conf
+++ b/meta-poky/conf/distro/poky.conf
@@ -18,7 +18,7 @@ POKY_DEFAULT_DISTRO_FEATURES =3D "largefile opengl ptest=
 multiarch wayland vulkan"
 POKY_DEFAULT_EXTRA_RDEPENDS =3D "packagegroup-core-boot"
 POKY_DEFAULT_EXTRA_RRECOMMENDS =3D "kernel-module-af-packet"

-DISTRO_FEATURES ?=3D "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTRO_FE=
ATURES}"
+DISTRO_FEATURES ??=3D "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTRO_F=
EATURES}"

 PREFERRED_VERSION_linux-yocto ?=3D "5.19%"
 PREFERRED_VERSION_linux-yocto-rt ?=3D "5.19%"
=2D-
2.17.1



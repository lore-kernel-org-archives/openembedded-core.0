Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 414FAC54E71
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 19:58:52 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.26150.1710878327794413260
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Mar 2024 12:58:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jkAczIEL;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42JJwl7S041746;
	Tue, 19 Mar 2024 14:58:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710878327;
	bh=HgNi5uYhApiMwfpgkKM1ESYO56W6dYYWRFfyzT0cX1U=;
	h=Date:To:CC:Subject:From:References:In-Reply-To;
	b=jkAczIELh6K89s8JcQMEBofUNf+eh9PxX5JIPdO7ns6xRQ0a3D/HLjb82+SmvIiN9
	 bSFNWc1e5dD7vfc0EeovAFGfCUHk4+9RyORDlnWSnpJtQ4SxenVFntONpyqEJKu/0i
	 ZPGKrxzTfhOtyRdlIQZH0zXxPX/v6acEZfxUADWc=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42JJwlCK053139
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 19 Mar 2024 14:58:47 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 19
 Mar 2024 14:58:46 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 19 Mar 2024 14:58:46 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42JJwkkB014208;
	Tue, 19 Mar 2024 14:58:46 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 19 Mar 2024 14:58:46 -0500
Message-ID: <CZXZR0YS8M6L.B942UZH8UZEE@ti.com>
To: Marcel Ziswiler <marcel@ziswiler.com>,
        <openembedded-core@lists.openembedded.org>
CC: Ryan Eatmon <reatmon@ti.com>,
        Max Krummenacher
	<max.krummenacher@toradex.com>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: [oe-core][PATCH v3] mesa: enable imagination powervr support
From: Randolph Sapp <rs@ti.com>
X-Mailer: aerc 0.15.2
References: <20240319152642.360329-1-marcel@ziswiler.com>
In-Reply-To: <20240319152642.360329-1-marcel@ziswiler.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 19:58:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197331

On Tue Mar 19, 2024 at 10:26 AM CDT, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>
> Allows mesa to be build with Imagination PowerVR support.
>
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
>
> ---
>
> Changes in v3:
> - Add a negative condition to the imagination PACKAGECONFIG as well,
>   otherwise upstream defaults may result in an incorrect configuration
>   (option being quietly enabled without it being present in
>   PACKAGECONFIG) as pointed out by Alex.
>
> Changes in v2:
> - Define imagination as a standard PACKAGECONFIG setting as suggested by
>   Alex.
>
>  meta/recipes-graphics/mesa/mesa.inc | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index 12d7a18eb8..0d4a37c34a 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -113,6 +113,7 @@ VULKAN_DRIVERS:append:i686 =3D ",intel,amd"
>  VULKAN_DRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'freedre=
no', ',freedreno', '', d)}"
>  VULKAN_DRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'broadco=
m', ',broadcom', '', d)}"
>  VULKAN_DRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'gallium=
-llvm', ',swrast', '', d)}"
> +VULKAN_DRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'imagina=
tion', ',imagination-experimental', '', d)}"
>  PACKAGECONFIG[vulkan] =3D "-Dvulkan-drivers=3D${@strip_comma('${VULKAN_D=
RIVERS}')}, -Dvulkan-drivers=3D'',glslang-native vulkan-loader vulkan-heade=
rs"
>
>  # mesa development and testing tools support, per driver
> @@ -122,6 +123,7 @@ TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG=
', 'etnaviv', ',etnaviv', '',
>  TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',f=
reedreno', '', d)}"
>  TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima',=
 '', d)}"
>  TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',pa=
nfrost', '', d)}"
> +TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'imagination', '=
,imagination', '', d)}"
>
>  # dependencies for tools.
>  TOOLS_DEPS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno'=
, ' ncurses libxml2 ', '', d)}"
> @@ -189,6 +191,8 @@ PACKAGECONFIG[xa]  =3D "-Dgallium-xa=3Denabled, -Dgal=
lium-xa=3Ddisabled"
>  PACKAGECONFIG[va] =3D "-Dgallium-va=3Denabled,-Dgallium-va=3Ddisabled,li=
bva-initial"
>  PACKAGECONFIG[vdpau] =3D "-Dgallium-vdpau=3Denabled,-Dgallium-vdpau=3Ddi=
sabled,libvdpau"
>
> +PACKAGECONFIG[imagination] =3D "-Dimagination-srv=3Dtrue,-Dimagination-s=
rv=3Dfalse"
> +
>  PACKAGECONFIG[lima] =3D ""
>  GALLIUMDRIVERS:append =3D"${@bb.utils.contains('PACKAGECONFIG', 'lima', =
',lima', '', d)}"
>
> @@ -327,7 +331,7 @@ PACKAGES_DYNAMIC +=3D "^mesa-driver-.*"
>  PACKAGES_DYNAMIC:class-native =3D "^mesa-driver-.*-native"
>
>  FILES:mesa-megadriver =3D "${libdir}/dri/* ${datadir}/drirc.d"
> -FILES:mesa-vulkan-drivers =3D "${libdir}/libvulkan_*.so ${datadir}/vulka=
n"
> +FILES:mesa-vulkan-drivers =3D "${libdir}/libvulkan_*.so ${libdir}/libpow=
ervr_rogue.so ${datadir}/vulkan"
>  FILES:${PN}-vdpau-drivers =3D "${libdir}/vdpau/*.so.*"
>  FILES:libegl-mesa =3D "${libdir}/libEGL*.so.* ${datadir}/glvnd/egl_vendo=
r.d"
>  FILES:libgbm =3D "${libdir}/libgbm.so.*"
> --
> 2.44.0

Looks good. Thanks Marcel! Running a test build now to verify things. Will
respond with Tested-By whenever that finishes.

Reviewed-by: Randolph Sapp <rs@ti.com>


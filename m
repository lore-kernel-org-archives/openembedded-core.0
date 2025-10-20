Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5DECCCD199
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 14:44:47 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.20543.1760971481661983226
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 07:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=vK71dJQ4;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59KEieTb919069;
	Mon, 20 Oct 2025 09:44:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760971480;
	bh=6zPg2VmoYrspZz3siNkm/VN/mBY5137Hrqd4q7Jd8GU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=vK71dJQ4AiM004SCVdisWa8SKhyJEKu0qlWyPmFRIEOJMKuiGNt8JBXIFot2CXSQ9
	 5rILdNRI0xoEqb2QEifwZItLftmb47mAAb1ogBowM2a0dhJ65WnYjNDdohhxG1Clls
	 AA2eIbYZemSStM/I7B8s25XCCp2t1+UkjFBJpXyM=
Received: from DFLE206.ent.ti.com (dfle206.ent.ti.com [10.64.6.64])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59KEie5q865851
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 20 Oct 2025 09:44:40 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 20 Oct
 2025 09:44:39 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 20 Oct 2025 09:44:39 -0500
Received: from [128.247.81.40] (dtmz023nlv.dhcp.ti.com [128.247.81.40] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59KEidLZ2117626;
	Mon, 20 Oct 2025 09:44:39 -0500
Message-ID: <775b0d63-866b-47f4-9a4a-94d291430195@ti.com>
Date: Mon, 20 Oct 2025 09:44:39 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] kernel-fit-image: Split signing variables
To: Adrian Freihofer <adrian.freihofer@gmail.com>
CC: <openembedded-core@lists.openembedded.org>
References: <20251016135758.32738-1-reatmon@ti.com>
 <CAB3asfjtYEyO5MSjJx6DZ+5Z8SZ95DCmk_RLz48v=-utKy_W0A@mail.gmail.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <CAB3asfjtYEyO5MSjJx6DZ+5Z8SZ95DCmk_RLz48v=-utKy_W0A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 59KEieTb919069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 14:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225122



On 10/20/2025 1:39 AM, Adrian Freihofer wrote:
> Am Do., 16. Okt. 2025 um 15:58=C2=A0Uhr schrieb Ryan Eatmon via=20
> lists.openembedded.org <http://lists.openembedded.org>=20
> <reatmon=3Dti.com@lists.openembedded.org=20
> <mailto:ti.com@lists.openembedded.org>>:
>=20
>     Right now all signing is done with a single variable: UBOOT_SIGN_EN=
ABLE.
>     This has the side effect of not allowing for signing the fitImage w=
hile
>     not signing the uboot files.
>=20
>     This patch creates three new variables specific to KERNEL_FITIMAGE =
and
>     defaults them to the corresponding UBOOT variables.=C2=A0 That way =
all
>     existing code will remain the same, but we can selectively control =
just
>     signing the fitImage without also signing the uboot files.
>=20
>     Signed-off-by: Ryan Eatmon <reatmon@ti.com <mailto:reatmon@ti.com>>
>     ---
>      =C2=A0meta/classes-recipe/kernel-fit-image.bbclass | 8 ++++++--
>      =C2=A01 file changed, 6 insertions(+), 2 deletions(-)
>=20
>     diff --git a/meta/classes-recipe/kernel-fit-image.bbclass b/meta/
>     classes-recipe/kernel-fit-image.bbclass
>     index f04aee1807..29f4098ccc 100644
>     --- a/meta/classes-recipe/kernel-fit-image.bbclass
>     +++ b/meta/classes-recipe/kernel-fit-image.bbclass
>     @@ -35,6 +35,10 @@ do_configure[noexec] =3D "1"
>      =C2=A0UBOOT_MKIMAGE_KERNEL_TYPE ?=3D "kernel"
>      =C2=A0KERNEL_IMAGEDEST ?=3D "/boot"
>=20
>     +KERNEL_FITIMAGE_SIGN_ENABLE ?=3D "${UBOOT_SIGN_ENABLE}"
>     +KERNEL_FITIMAGE_SIGN_KEYNAME ?=3D "${UBOOT_SIGN_KEYNAME}"
>     +KERNEL_FITIMAGE_SIGN_KEYDIR ?=3D "${UBOOT_SIGN_KEYDIR}"
>     +
>=20
>=20
> This kind of introduces a new namespace=C2=A0KERNEL_FITIMAGE_.
> However, there are already namespaces which we could re-use.
> Would that be better?
>=20
> FIT_KERNEL_SIGN_ENABLE ?=3D "${UBOOT_SIGN_ENABLE}"
> FIT_KERNEL_SIGN_KEYNAME ?=3D "${UBOOT_SIGN_KEYNAME}"
> FIT_KERNEL_SIGN_KEYDIR ?=3D "${UBOOT_SIGN_KEYDIR}"

I'm fine with that.  I'll send a v2.


> It would also be interesting to understand your use case, because=20
> signing the FIT
> image usually requires a bootloader which can verify the signature at=20
> run-time.
> Your patch basically removes the deployment of the public key into u-=20
> boot's=C2=A0DTB.
> Do you use a different bootloader?

We are using u-boot, but we are making use of the UBOOT_CONFIG flow to=20
build multiple versions of the u-boot files at the same time.  Sometimes=20
we build different configs, sometimes we just want to change the make=20
command line options when building the same config.  In the UBOOT_CONFIG=20
flow, the last variation in the list because the "default" variation for=20
the main uboot files and what aligns with the fitImage as the "default"=20
out of the build.

We then use the individual files in our testing by uploading the image=20
files over uart to our boards and booting from there.

Second piece of background, our u-boot files are all signed by the=20
binman flow within the u-boot build process.  So oe-core signing them a=20
second time is not needed.

In this specific case, one variation we are trying to build is our main=20
config but sign all of the files using a different key type (ecdsa) to=20
test out that our board and software work correctly.  But we ran into=20
the problem that UBOOT_SIGN_ENABLE was re-signing the files using the=20
"default" key and not the key that we had already signed them with.

So we need the fitImage signing for the default set of files, but we do=20
not want the u-boot file signing since they are already signed by the=20
u-boot build itself.

Hope that helps clarify...



--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS



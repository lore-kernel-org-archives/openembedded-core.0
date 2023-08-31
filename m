Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 666F8C83F10
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 13:49:56 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.17602.1693489795343587150
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Aug 2023 06:49:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=s//2oKL8;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37VDnraI115383;
	Thu, 31 Aug 2023 08:49:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1693489793;
	bh=IZkYm9RidP7LkBfIWAFoj3lyUngRIfYZvqjtBxNekpk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=s//2oKL8VOHUWEMia6BLfzFTUifRXymxYW0j5+gf23oQHiBkflDnIq/sLS0JMUnd+
	 l4sIsKQR3qyj9E/KT8ZpfohH2YoG0KwgXesi3Z0a7FxfuGciSURtRkyoWvyqE2peae
	 2mPtZzc0i92SOCtyN9F63I7SKwd6JkjuAq3JOvcw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37VDnrFp087572
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 31 Aug 2023 08:49:53 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 31
 Aug 2023 08:49:53 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 31 Aug 2023 08:49:53 -0500
Received: from [128.247.81.69] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37VDnrCb119843;
	Thu, 31 Aug 2023 08:49:53 -0500
Message-ID: <41f4cfe3-d84b-a97e-3f9a-bf944cace5b2@ti.com>
Date: Thu, 31 Aug 2023 08:49:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [OE-core][PATCH] kernel.bbclass: Add file exist checks around
 removes
Content-Language: en-US
To: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
CC: <openembedded-core@lists.openembedded.org>
References: <20230831133803.30556-1-reatmon@ti.com>
 <CA+cAkep_j4sfhHUW_GRoO0O+3Qb_TTrULcyznVW2w+ATYTjApQ@mail.gmail.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <CA+cAkep_j4sfhHUW_GRoO0O+3Qb_TTrULcyznVW2w+ATYTjApQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 37VDnraI115383
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 13:49:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186976



On 8/31/2023 8:47 AM, Fr=C3=A9d=C3=A9ric Martinsons wrote:
> Hello,
>=20
> On Thu, 31 Aug 2023 at 15:38, Ryan Eatmon via lists.openembedded.org=20
> <http://lists.openembedded.org> <reatmon=3Dti.com@lists.openembedded.or=
g=20
> <mailto:ti.com@lists.openembedded.org>> wrote:
>=20
>     The latest 6.5 kernels do not appear to create the source file in
>     ${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source so the
>     recipe errors out when trying to remove it.=C2=A0 Simple fix is to =
add an
>     exists check around the call.
>=20
>     Signed-off-by: Ryan Eatmon <reatmon@ti.com <mailto:reatmon@ti.com>>
>     ---
>      =C2=A0meta/classes-recipe/kernel.bbclass | 8 ++++++--
>      =C2=A01 file changed, 6 insertions(+), 2 deletions(-)
>=20
>     diff --git a/meta/classes-recipe/kernel.bbclass
>     b/meta/classes-recipe/kernel.bbclass
>     index acb43bd4d5..4df052061b 100644
>     --- a/meta/classes-recipe/kernel.bbclass
>     +++ b/meta/classes-recipe/kernel.bbclass
>     @@ -454,8 +454,12 @@ kernel_do_install() {
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS=
 MACHINE
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grep -q -i -e '^CONFIG_MODULES=3Dy=
$' .config); then
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake=
 DEPMOD=3Decho
>     MODLIB=3D${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}
>     INSTALL_FW_PATH=3D${D}${nonarch_base_libdir}/firmware modules_insta=
ll
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm
>     "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm
>     "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e
>     "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build" ]; the=
n
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0rm
>     "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e
>     "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source" ]; th=
en
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0rm
>     "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Remove e=
mpty module directories to prevent QA issues
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 find
>     "${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel" -type
>     d -empty -delete
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
>     --=20
>     2.17.1
>=20
>=20
> My 2 cents: the "-f" switch makes=C2=A0rm=C2=A0ignore=C2=A0nonexistent =
files , and it=20
> will make a shorter patch ;)

If that is the group consensus I can submit a v2.  Anyone else feel that=20
way?


>=20
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#186974):
>     https://lists.openembedded.org/g/openembedded-core/message/186974
>     <https://lists.openembedded.org/g/openembedded-core/message/186974>
>     Mute This Topic: https://lists.openembedded.org/mt/101073782/621338=
8
>     <https://lists.openembedded.org/mt/101073782/6213388>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://lists.openembedded.org/g/openembedded-core/unsub>
>     [frederic.martinsons@gmail.com <mailto:frederic.martinsons@gmail.co=
m>]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


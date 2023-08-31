Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D9B3C83F37
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 18:26:41 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.2310.1693506397859348800
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Aug 2023 11:26:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=hBwCnfUJ;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37VIQWf1011532;
	Thu, 31 Aug 2023 13:26:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1693506393;
	bh=LgG9WZ6Y9RdpvpMz79zmEdC8ALVuPfYxa36Fg5M8tvI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=hBwCnfUJHeehIGU/D08nNfTIwI4v1BBUcWbvWJXpx+ymNeEgo/emBzxFQhom7tRvT
	 0FgItHRog/4VR5QhC7GO8lJhXAzF6iMS3hEj7FC2qvPaYrIdCXEmsoEXlNDxFlvdIq
	 zlXcTv5fVE5m0eK6PVSE5A/2bFOxq5Jm3yV9Ok5o=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37VIQW4O061381
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 31 Aug 2023 13:26:32 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 31
 Aug 2023 13:26:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 31 Aug 2023 13:26:32 -0500
Received: from [128.247.81.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37VIQWd7106794;
	Thu, 31 Aug 2023 13:26:32 -0500
Message-ID: <8400d86b-670c-ea81-2f7b-b5b273d684ce@ti.com>
Date: Thu, 31 Aug 2023 13:26:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [OE-core][PATCH] kernel.bbclass: Add file exist checks around
 removes
Content-Language: en-US
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        Frederic Martinsons
	<frederic.martinsons@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20230831133803.30556-1-reatmon@ti.com>
 <CA+cAkep_j4sfhHUW_GRoO0O+3Qb_TTrULcyznVW2w+ATYTjApQ@mail.gmail.com>
 <41f4cfe3-d84b-a97e-3f9a-bf944cace5b2@ti.com>
 <CA+cAkepOV1bPKLJUh_TVVMHtCa7qkiwiFM6DYKw+zktjngmbwQ@mail.gmail.com>
 <DB5PR02MB10213AE50A3F9822EB6D0DDDAEFE5A@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <DB5PR02MB10213AE50A3F9822EB6D0DDDAEFE5A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 37VIQWf1011532
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 18:26:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186986


With two votes I'll send a v2.

No, I have not done that thorough of an investigation into what happened=20
to the source file.  My thought was just to get the build working so=20
that our nightly upstream testing (latest kernel, uboot, optee-os,=20
trusted-firmeware) would not be blocked.  But I can look into it deeper=20
and let you know.


On 8/31/2023 12:58 PM, Peter Kjellerstedt wrote:
> For what it=E2=80=99s worth, I would also go with rm -f.
>=20
> Also, have you checked so that the files have not just been=20
> moved/renamed? I.e., are they produced in some other location where the=
y=20
> should now also be removed from?
>=20
> //Peter
>=20
> *From:*openembedded-core@lists.openembedded.org=20
> <openembedded-core@lists.openembedded.org> *On Behalf Of *Frederic=20
> Martinsons
> *Sent:* den 31 augusti 2023 18:57
> *To:* Ryan Eatmon <reatmon@ti.com>
> *Cc:* openembedded-core@lists.openembedded.org
> *Subject:* Re: [OE-core][PATCH] kernel.bbclass: Add file exist checks=20
> around removes
>=20
> On Thu, 31 Aug 2023 at 15:49, Ryan Eatmon <reatmon@ti.com=20
> <mailto:reatmon@ti.com>> wrote:
>=20
>=20
>=20
>     On 8/31/2023 8:47 AM, Fr=C3=A9d=C3=A9ric Martinsons wrote:
>      > Hello,
>      >
>      > On Thu, 31 Aug 2023 at 15:38, Ryan Eatmon via
>     lists.openembedded.org <http://lists.openembedded.org>
>      > <http://lists.openembedded.org <http://lists.openembedded.org>>
>     <reatmon=3Dti.com@lists.openembedded.org
>     <mailto:ti.com@lists.openembedded.org>
>      > <mailto:ti.com@lists.openembedded.org
>     <mailto:ti.com@lists.openembedded.org>>> wrote:
>      >
>      >=C2=A0 =C2=A0 =C2=A0The latest 6.5 kernels do not appear to creat=
e the source file in
>      >=C2=A0 =C2=A0 =C2=A0${D}${nonarch_base_libdir}/modules/${KERNEL_V=
ERSION}/source
>     so the
>      >=C2=A0 =C2=A0 =C2=A0recipe errors out when trying to remove it.=C2=
=A0 Simple fix is to
>     add an
>      >=C2=A0 =C2=A0 =C2=A0exists check around the call.
>     >=20
>     >=C2=A0 =C2=A0 =C2=A0Signed-off-by: Ryan Eatmon <reatmon@ti.com <ma=
ilto:reatmon@ti.com><mailto:reatmon@ti.com
>     <mailto:reatmon@ti.com>>>
>     >=C2=A0 =C2=A0 =C2=A0---
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0meta/classes-recipe/kernel.bbclass | 8 =
++++++--
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A01 file changed, 6 insertions(+), 2 dele=
tions(-)
>     >=20
>     >=C2=A0 =C2=A0 =C2=A0diff --git a/meta/classes-recipe/kernel.bbclas=
s
>     >=C2=A0 =C2=A0 =C2=A0b/meta/classes-recipe/kernel.bbclass
>     >=C2=A0 =C2=A0 =C2=A0index acb43bd4d5..4df052061b 100644
>     >=C2=A0 =C2=A0 =C2=A0--- a/meta/classes-recipe/kernel.bbclass
>     >=C2=A0 =C2=A0 =C2=A0+++ b/meta/classes-recipe/kernel.bbclass
>     >=C2=A0 =C2=A0 =C2=A0@@ -454,8 +454,12 @@ kernel_do_install() {
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unset CFLAGS CPPF=
LAGS CXXFLAGS LDFLAGS MACHINE
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (grep -q -i -e=
 '^CONFIG_MODULES=3Dy$' .config); then
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 oe_runmake DEPMOD=3DechoMODLIB=3D${D}${nonarch_base_libdir}/mo=
dules/${KERNEL_VERSION}INSTALL_FW_PATH=3D${D}${nonarch_base_libdir}/firmw=
are modules_install
>     >=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0rm"${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
>     >=C2=A0 =C2=A0 =C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0rm"${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
>     >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if [ -e"${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/bu=
ild" ]; then
>     >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm"${D}${nonarch_base_libdir}/modul=
es/${KERNEL_VERSION}/build"
>     >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fi
>     >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if [ -e"${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/so=
urce" ]; then
>     >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm"${D}${nonarch_base_libdir}/modul=
es/${KERNEL_VERSION}/source"
>     >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0fi
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # Remove empty module directories to prevent QA issues
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 find"${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kern=
el" -typed
>     -empty -delete
>     >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
>     >=C2=A0 =C2=A0 =C2=A0--=20
>     >=C2=A0 =C2=A0 =C2=A02.17.1
>     >=20
>     >=20
>     > My 2 cents: the "-f" switch makes=C2=A0rm=C2=A0ignore=C2=A0nonexi=
stent files , and it=20
>     > will make a shorter patch ;)
>=20
>     If that is the group consensus I can submit a v2. Anyone else feel =
that
>     way?
>=20
> Don't know if a "group consensus" can exist here. (it is a public list
>=20
> where anyone can raise remarks) and there is no "vote".
>=20
> Mine was not a "cons" for you patch, what you did is completely valid,
>=20
> I just wanted to say that there was a more concise way of doing it.
>=20
> Feel free to send a v2 if you think my remark=C2=A0is relevant.
>=20
>=20
>      >
>      >
>      >
>=20
>     --=20
>     Ryan Eatmon reatmon@ti.com <mailto:reatmon@ti.com>
>     -----------------------------------------
>     Texas Instruments, Inc.=C2=A0 -=C2=A0 LCPD=C2=A0 -=C2=A0 MGTS
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FC68C83F3A
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 18:58:11 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.3272.1693508283836562931
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Aug 2023 11:58:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=NWqn3hno;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37VIvxed072676;
	Thu, 31 Aug 2023 13:57:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1693508279;
	bh=wYaP+X/yyovi1zqs4JathOpc8baGe1PHv1NI5wdd02Y=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=NWqn3hnovyteAeQpqYzmBEbxhtN+FJTGDXTBO78/scGtO3NS5c7+gOLT6bNTIuYaz
	 enNHpz2OcTArrzakYeqNRzZbWTTrAaRLhqO6y3NqKYiQ2g2lrgBFkv51kfDWcek80V
	 pzgk2BnvcpQ/0v9yptXqbeBWJ6tNcJRrLLqt4S0I=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37VIvxgL064736
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 31 Aug 2023 13:57:59 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 31
 Aug 2023 13:57:59 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 31 Aug 2023 13:57:58 -0500
Received: from [128.247.81.69] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37VIvwRS107959;
	Thu, 31 Aug 2023 13:57:58 -0500
Message-ID: <6d52d378-fba6-5b03-e061-6fbe1d2ba206@ti.com>
Date: Thu, 31 Aug 2023 13:57:58 -0500
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
 <17808B18B95AEB86.27804@lists.openembedded.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <17808B18B95AEB86.27804@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 37VIvxed072676
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 18:58:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186987



On 8/31/2023 1:26 PM, Ryan Eatmon via lists.openembedded.org wrote:
>=20
> With two votes I'll send a v2.
>=20
> No, I have not done that thorough of an investigation into what happene=
d=20
> to the source file.=C2=A0 My thought was just to get the build working =
so=20
> that our nightly upstream testing (latest kernel, uboot, optee-os,=20
> trusted-firmeware) would not be blocked.=C2=A0 But I can look into it d=
eeper=20
> and let you know.

It looks like they reworked how make modules_install worked.  They moved=20
the logic into a files scripts/Makefile.modinst.  And all they seem to=20
have removed was the symlink to the source tree.  The symlink build is=20
still there.


>=20
> On 8/31/2023 12:58 PM, Peter Kjellerstedt wrote:
>> For what it=E2=80=99s worth, I would also go with rm -f.
>>
>> Also, have you checked so that the files have not just been=20
>> moved/renamed? I.e., are they produced in some other location where=20
>> they should now also be removed from?
>>
>> //Peter
>>
>> *From:*openembedded-core@lists.openembedded.org=20
>> <openembedded-core@lists.openembedded.org> *On Behalf Of *Frederic=20
>> Martinsons
>> *Sent:* den 31 augusti 2023 18:57
>> *To:* Ryan Eatmon <reatmon@ti.com>
>> *Cc:* openembedded-core@lists.openembedded.org
>> *Subject:* Re: [OE-core][PATCH] kernel.bbclass: Add file exist checks=20
>> around removes
>>
>> On Thu, 31 Aug 2023 at 15:49, Ryan Eatmon <reatmon@ti.com=20
>> <mailto:reatmon@ti.com>> wrote:
>>
>>
>>
>> =C2=A0=C2=A0=C2=A0 On 8/31/2023 8:47 AM, Fr=C3=A9d=C3=A9ric Martinsons=
 wrote:
>> =C2=A0=C2=A0=C2=A0=C2=A0 > Hello,
>> =C2=A0=C2=A0=C2=A0=C2=A0 >
>> =C2=A0=C2=A0=C2=A0=C2=A0 > On Thu, 31 Aug 2023 at 15:38, Ryan Eatmon v=
ia
>> =C2=A0=C2=A0=C2=A0 lists.openembedded.org <http://lists.openembedded.o=
rg>
>> =C2=A0=C2=A0=C2=A0=C2=A0 > <http://lists.openembedded.org <http://list=
s.openembedded.org>>
>> =C2=A0=C2=A0=C2=A0 <reatmon=3Dti.com@lists.openembedded.org
>> =C2=A0=C2=A0=C2=A0 <mailto:ti.com@lists.openembedded.org>
>> =C2=A0=C2=A0=C2=A0=C2=A0 > <mailto:ti.com@lists.openembedded.org
>> =C2=A0=C2=A0=C2=A0 <mailto:ti.com@lists.openembedded.org>>> wrote:
>> =C2=A0=C2=A0=C2=A0=C2=A0 >
>> =C2=A0=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0The latest 6.5 kernels d=
o not appear to create the source=20
>> file in
>> =C2=A0=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0${D}${nonarch_base_libdi=
r}/modules/${KERNEL_VERSION}/source
>> =C2=A0=C2=A0=C2=A0 so the
>> =C2=A0=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0recipe errors out when t=
rying to remove it.=C2=A0 Simple fix is to
>> =C2=A0=C2=A0=C2=A0 add an
>> =C2=A0=C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0exists check around the =
call.
>> =C2=A0=C2=A0=C2=A0 > =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0Signed-of=
f-by: Ryan Eatmon <reatmon@ti.com=20
>> <mailto:reatmon@ti.com><mailto:reatmon@ti.com
>> =C2=A0=C2=A0=C2=A0 <mailto:reatmon@ti.com>>>
>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0---
>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0 =C2=A0meta/classes-recipe/ker=
nel.bbclass | 8 ++++++--
>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0 =C2=A01 file changed, 6 inser=
tions(+), 2 deletions(-)
>> =C2=A0=C2=A0=C2=A0 > =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0diff --gi=
t a/meta/classes-recipe/kernel.bbclass
>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0b/meta/classes-recipe/kernel.b=
bclass
>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0index acb43bd4d5..4df052061b 1=
00644
>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0--- a/meta/classes-recipe/kern=
el.bbclass
>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0+++ b/meta/classes-recipe/kern=
el.bbclass
>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0@@ -454,8 +454,12 @@ kernel_do=
_install() {
>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 u=
nset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
f (grep -q -i -e '^CONFIG_MODULES=3Dy$' .config); then
>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake=20
>> DEPMOD=3DechoMODLIB=3D${D}${nonarch_base_libdir}/modules/${KERNEL_VERS=
ION}INSTALL_FW_PATH=3D${D}${nonarch_base_libdir}/firmware modules_install
>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0-             =20
>> =C2=A0rm"${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0-             =20
>> =C2=A0rm"${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0if [=20
>> -e"${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build" ]; then
>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0+                     =20
>> =C2=A0rm"${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0fi
>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0if [=20
>> -e"${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source" ]; the=
n
>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0+                     =20
>> =C2=A0rm"${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/source"
>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0fi
>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 # Remove empty module directories to=20
>> prevent QA issues
>> =C2=A0=C2=A0=C2=A0 >                     =20
>> find"${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel" -typ=
ed
>> =C2=A0=C2=A0=C2=A0 -empty -delete
>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 e=
lse
>> =C2=A0=C2=A0=C2=A0 >=C2=A0 =C2=A0 =C2=A0-- =C2=A0=C2=A0=C2=A0 >=C2=A0 =
=C2=A0 =C2=A02.17.1
>> =C2=A0=C2=A0=C2=A0 > =C2=A0=C2=A0=C2=A0 > =C2=A0=C2=A0=C2=A0 > My 2 ce=
nts: the "-f" switch=20
>> makes=C2=A0rm=C2=A0ignore=C2=A0nonexistent files , and it =C2=A0=C2=A0=
=C2=A0 > will make a shorter=20
>> patch ;)
>>
>> =C2=A0=C2=A0=C2=A0 If that is the group consensus I can submit a v2. A=
nyone else feel=20
>> that
>> =C2=A0=C2=A0=C2=A0 way?
>>
>> Don't know if a "group consensus" can exist here. (it is a public list
>>
>> where anyone can raise remarks) and there is no "vote".
>>
>> Mine was not a "cons" for you patch, what you did is completely valid,
>>
>> I just wanted to say that there was a more concise way of doing it.
>>
>> Feel free to send a v2 if you think my remark=C2=A0is relevant.
>>
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 >
>> =C2=A0=C2=A0=C2=A0=C2=A0 >
>> =C2=A0=C2=A0=C2=A0=C2=A0 >
>>
>> =C2=A0=C2=A0=C2=A0 -- =C2=A0=C2=A0=C2=A0 Ryan Eatmon reatmon@ti.com <m=
ailto:reatmon@ti.com>
>> =C2=A0=C2=A0=C2=A0 -----------------------------------------
>> =C2=A0=C2=A0=C2=A0 Texas Instruments, Inc.=C2=A0 -=C2=A0 LCPD=C2=A0 -=C2=
=A0 MGTS
>>
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186986): https://lists.openembedded.org/g/openembed=
ded-core/message/186986
> Mute This Topic: https://lists.openembedded.org/mt/101073782/6551054
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
reatmon@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


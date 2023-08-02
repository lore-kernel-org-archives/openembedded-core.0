Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B017C04A94
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 18:23:37 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.3801.1691000609559483558
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 11:23:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=JYnmAkfW;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 372INSGS066317;
	Wed, 2 Aug 2023 13:23:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1691000608;
	bh=/zYb8jLPBv5wrKuaqMCw1DisN2xD2xzoSRc+R7gOESI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=JYnmAkfW+wiCGD4dCOh/3yXoF4wWp8JzGuzS/WYc+wFbVnMHG0Sny9b7xcs8meMGL
	 TmbUuaNlJnXWzzzrcAoJB/3gTB6IRCKuHnQE6u10n90TtZ69BO+vZ2h4gJSYBYd2ii
	 vC81DDgwtQPZKoa9maxYsLhbPoMxk8wN8pjHpO1I=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 372INS8w006478
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Aug 2023 13:23:28 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 2
 Aug 2023 13:23:27 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 2 Aug 2023 13:23:27 -0500
Received: from [128.247.81.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 372INRiK095311;
	Wed, 2 Aug 2023 13:23:27 -0500
Message-ID: <4c07bf28-4830-7422-5ac3-28a821ea8329@ti.com>
Date: Wed, 2 Aug 2023 13:23:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core] image.bbclass question
Content-Language: en-US
To: Christopher Larson <kergoth@gmail.com>
CC: <openembedded-core@lists.openembedded.org>
References: <c447aa42-9eae-ce9c-356f-ae3133c00418@ti.com>
 <CABcZANmXqJcCaqdxuHrTdvrg1kZ8OCeOag_ZGUA2J_TUkuLJFw@mail.gmail.com>
 <1777A39C626FDD4B.20033@lists.openembedded.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <1777A39C626FDD4B.20033@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 372INSGS066317
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 18:23:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185427


In looking at the poky tiny initramfs image, it sets:

IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}"


Which would then make the two variable the same and make the check kick=20
in.  But I cannot find where it manual says that you have to make them=20
the same value and cannot generate an initramfs image along with all=20
other image types.



On 8/2/2023 1:14 PM, Ryan Eatmon via lists.openembedded.org wrote:
>=20
> I added some debugging to print out the various variables on interest=20
> and got this output:
>=20
> DEBUG: image_fstypes=3D tar.xz wic.xz wic.bmap tar.xz.md5sum cpio cpio.=
xz
> DEBUG: initramfs_fstypes=3Dcpio.gz cpio cpio.xz
> DEBUG: initramfs_maxsize=3D65536.000000
> DEBUG: base_size=3D74366
>=20
> So I'm not sure I agree with what you are saying.=C2=A0 Again, I might =
be=20
> missing something in how the =3D=3D is supposed to work when comparing =
the=20
> two variables...
>=20
>=20
> On 8/2/2023 12:17 PM, Christopher Larson wrote:
>> Image builds obey IMAGE_FSTYPES. Initramfs images set that to=20
>> INITRAMFS_FSTYPES, so it's comparing the two as a check to see if this=
=20
>> is an initramfs image. It isn't making sure it matches a hardcoded=20
>> list, so intersection isn't necessary.
>>
>> On Wed, Aug 2, 2023 at 9:41=E2=80=AFAM Ryan Eatmon via lists.openembed=
ded.org=20
>> <http://lists.openembedded.org> <reatmon=3Dti.com@lists.openembedded.o=
rg=20
>> <mailto:ti.com@lists.openembedded.org>> wrote:
>>
>>
>> =C2=A0=C2=A0=C2=A0 I am trying to add support for the INITRAMFS_MAXSIZ=
E into the meta-ti
>> =C2=A0=C2=A0=C2=A0 layer for our tiny image.
>>
>> =C2=A0=C2=A0=C2=A0 I have added the following to our tiny image file:
>>
>> =C2=A0=C2=A0=C2=A0 INITRAMFS_FSTYPES +=3D "cpio cpio.xz"
>> =C2=A0=C2=A0=C2=A0 INITRAMFS_MAXSIZE =3D "65536"
>>
>> =C2=A0=C2=A0=C2=A0 But I'm not seeing any errors about the image being=
 too big being
>> =C2=A0=C2=A0=C2=A0 printed.
>>
>> =C2=A0=C2=A0=C2=A0 In looking at the code in question:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0# Check the initramfs siz=
e against INITRAMFS_MAXSIZE (if set)
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0if image_fstypes =3D=3D i=
nitramfs_fstypes !=3D ''=C2=A0 and
>> =C2=A0=C2=A0=C2=A0 initramfs_maxsize:
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0initramfs_m=
axsize_int =3D int(initramfs_maxsize)
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if base_siz=
e > initramfs_maxsize_int:
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0bb.error("The initramfs size %d(K) exceeds
>> =C2=A0=C2=A0=C2=A0 INITRAMFS_MAXSIZE: %d(K)" % \
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(base_size, initramfs_maxsize_int))
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0bb.error("You can set INITRAMFS_MAXSIZE a larger value.
>> =C2=A0=C2=A0=C2=A0 Usually, it should")
>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0bb.fatal("be less than 1/2 of ram size, or you may
>> =C2=A0=C2=A0=C2=A0 fail to
>> =C2=A0=C2=A0=C2=A0 boot it.\n")
>>
>>
>> =C2=A0=C2=A0=C2=A0 What is the purpose of the:
>>
>> =C2=A0=C2=A0=C2=A0 if image_fstypes =3D=3D initramfs_fstypes !=3D ''
>>
>>
>> =C2=A0=C2=A0=C2=A0 It seems to looking for the ONLY images being built=
 are the exact=20
>> same
>> =C2=A0=C2=A0=C2=A0 as the INITRAMFS_FSTYPES...=C2=A0 Shouldn't that be=
 more of an=20
>> intersection
>> =C2=A0=C2=A0=C2=A0 check?=C2=A0 If any of the INITRAMFS_FSTYPES are in=
 the IMAGE_FSTYPES,=20
>> then
>> =C2=A0=C2=A0=C2=A0 check the size?
>>
>> =C2=A0=C2=A0=C2=A0 Or am I missing something?
>>
>>
>>
>> =C2=A0=C2=A0=C2=A0 -- =C2=A0=C2=A0=C2=A0 Ryan Eatmon reatmon@ti.com <m=
ailto:reatmon@ti.com>
>> =C2=A0=C2=A0=C2=A0 -----------------------------------------
>> =C2=A0=C2=A0=C2=A0 Texas Instruments, Inc.=C2=A0 -=C2=A0 LCPD=C2=A0 -=C2=
=A0 MGTS
>>
>>
>>
>>
>> --=20
>> Christopher Larson
>> chris_larson@mentor.com, chris.larson@siemens.com, kergoth@gmail.com
>> Principal Software Engineer,=C2=A0Embedded Linux Solutions,=C2=A0Sieme=
ns Digital=20
>> Industries Software
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185425): https://lists.openembedded.org/g/openembed=
ded-core/message/185425
> Mute This Topic: https://lists.openembedded.org/mt/100509426/6551054
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
reatmon@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD3AC04A94
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 18:14:47 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.3594.1691000076735144786
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 11:14:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=jDFsuzJF;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 372IEZJG011165;
	Wed, 2 Aug 2023 13:14:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1691000075;
	bh=P8HhB9ZqdnWiWWasvUpe06HmoTyagAczXoXpWNKW56k=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=jDFsuzJF47YdZnJMr5pPmBC6XrFAGOFDIEKtIEQomr1FhUyCKRImcUEy4kf+yJ2Ii
	 he0lRTdLQ1gkBNM/FkCcTr0gU5nsnGMeyL5xf2T28tzds/3VgR6kEnX+AQYFINEYhY
	 2LzasfqXIAXoIDo8Y2y7eM9rg+xJ+cn3kfEm3ipk=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 372IEZDG118872
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Aug 2023 13:14:35 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 2
 Aug 2023 13:14:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 2 Aug 2023 13:14:35 -0500
Received: from [128.247.81.69] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 372IEZXn029036;
	Wed, 2 Aug 2023 13:14:35 -0500
Message-ID: <37697470-800d-7c33-08af-a155b73d42d7@ti.com>
Date: Wed, 2 Aug 2023 13:14:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core] image.bbclass question
Content-Language: en-US
To: Christopher Larson <kergoth@gmail.com>
CC: <openembedded-core@lists.openembedded.org>
References: <c447aa42-9eae-ce9c-356f-ae3133c00418@ti.com>
 <CABcZANmXqJcCaqdxuHrTdvrg1kZ8OCeOag_ZGUA2J_TUkuLJFw@mail.gmail.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <CABcZANmXqJcCaqdxuHrTdvrg1kZ8OCeOag_ZGUA2J_TUkuLJFw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 372IEZJG011165
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 18:14:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185425


I added some debugging to print out the various variables on interest=20
and got this output:

DEBUG: image_fstypes=3D tar.xz wic.xz wic.bmap tar.xz.md5sum cpio cpio.xz
DEBUG: initramfs_fstypes=3Dcpio.gz cpio cpio.xz
DEBUG: initramfs_maxsize=3D65536.000000
DEBUG: base_size=3D74366

So I'm not sure I agree with what you are saying.  Again, I might be=20
missing something in how the =3D=3D is supposed to work when comparing th=
e=20
two variables...


On 8/2/2023 12:17 PM, Christopher Larson wrote:
> Image builds obey IMAGE_FSTYPES. Initramfs images set that to=20
> INITRAMFS_FSTYPES, so it's comparing the two as a check to see if this=20
> is an initramfs image. It isn't making sure it matches a hardcoded list=
,=20
> so intersection isn't necessary.
>=20
> On Wed, Aug 2, 2023 at 9:41=E2=80=AFAM Ryan Eatmon via lists.openembedd=
ed.org=20
> <http://lists.openembedded.org> <reatmon=3Dti.com@lists.openembedded.or=
g=20
> <mailto:ti.com@lists.openembedded.org>> wrote:
>=20
>=20
>     I am trying to add support for the INITRAMFS_MAXSIZE into the meta-=
ti
>     layer for our tiny image.
>=20
>     I have added the following to our tiny image file:
>=20
>     INITRAMFS_FSTYPES +=3D "cpio cpio.xz"
>     INITRAMFS_MAXSIZE =3D "65536"
>=20
>     But I'm not seeing any errors about the image being too big being
>     printed.
>=20
>     In looking at the code in question:
>=20
>      =C2=A0 =C2=A0 =C2=A0# Check the initramfs size against INITRAMFS_M=
AXSIZE (if set)
>      =C2=A0 =C2=A0 =C2=A0if image_fstypes =3D=3D initramfs_fstypes !=3D=
 ''=C2=A0 and
>     initramfs_maxsize:
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0initramfs_maxsize_int =3D int(in=
itramfs_maxsize)
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if base_size > initramfs_maxsize=
_int:
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.error("The init=
ramfs size %d(K) exceeds
>     INITRAMFS_MAXSIZE: %d(K)" % \
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(bas=
e_size, initramfs_maxsize_int))
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.error("You can =
set INITRAMFS_MAXSIZE a larger value.
>     Usually, it should")
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.fatal("be less =
than 1/2 of ram size, or you may
>     fail to
>     boot it.\n")
>=20
>=20
>     What is the purpose of the:
>=20
>     if image_fstypes =3D=3D initramfs_fstypes !=3D ''
>=20
>=20
>     It seems to looking for the ONLY images being built are the exact s=
ame
>     as the INITRAMFS_FSTYPES...=C2=A0 Shouldn't that be more of an inte=
rsection
>     check?=C2=A0 If any of the INITRAMFS_FSTYPES are in the IMAGE_FSTYP=
ES, then
>     check the size?
>=20
>     Or am I missing something?
>=20
>=20
>=20
>     --=20
>     Ryan Eatmon reatmon@ti.com <mailto:reatmon@ti.com>
>     -----------------------------------------
>     Texas Instruments, Inc.=C2=A0 -=C2=A0 LCPD=C2=A0 -=C2=A0 MGTS
>=20
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#185415):
>     https://lists.openembedded.org/g/openembedded-core/message/185415
>     <https://lists.openembedded.org/g/openembedded-core/message/185415>
>     Mute This Topic: https://lists.openembedded.org/mt/100509426/361712=
3
>     <https://lists.openembedded.org/mt/100509426/3617123>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://lists.openembedded.org/g/openembedded-core/unsub>
>     [kergoth@gmail.com <mailto:kergoth@gmail.com>]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20
>=20
>=20
> --=20
> Christopher Larson
> chris_larson@mentor.com, chris.larson@siemens.com, kergoth@gmail.com
> Principal Software Engineer,=C2=A0Embedded Linux Solutions,=C2=A0Siemen=
s Digital=20
> Industries Software

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


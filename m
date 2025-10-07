Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4740CCA470
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 12:55:13 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.18042.1759841708426009505
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 05:55:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=SAC+iNKd;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 597CsxaV3760349;
	Tue, 7 Oct 2025 07:54:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759841699;
	bh=70I6SkkIq+R1bmhSmOUhrlE7EUJ4xsY1e6wZUxsPp9I=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=SAC+iNKd5FqTw7vLpX7bRC6n5bcTO9IMxCew+PqjTEVqFLbCkUu9/Lon54uYn/GK7
	 3rRP4AH+ccZdjI6+N+X5p6ndyOisPSE9LDfINbwhJICGggOvqSmmkUO97xFWHHuUjj
	 LgPky/+7grB/sLGWlXfk/Zw59g0gRjas3mYw9Ej4=
Received: from DFLE205.ent.ti.com (dfle205.ent.ti.com [10.64.6.63])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 597Csx1I2982790
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Oct 2025 07:54:59 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Oct
 2025 07:54:58 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 7 Oct 2025 07:54:58 -0500
Received: from [128.247.81.40] (dtmz023nlv.dhcp.ti.com [128.247.81.40] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 597CswWJ1138326;
	Tue, 7 Oct 2025 07:54:58 -0500
Message-ID: <d395d3a2-4467-4e62-beef-f7b5ab973e89@ti.com>
Date: Tue, 7 Oct 2025 07:54:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] linux-firmware: Move all firmware into
 sub-packages
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        <openembedded-core@lists.openembedded.org>
References: <20251006170804.9664-1-reatmon@ti.com>
 <DDBWZY3PMFQU.1HP666LHFOD0H@bootlin.com>
 <186C362D6E62D57C.5353@lists.openembedded.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <186C362D6E62D57C.5353@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 597CsxaV3760349
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 12:55:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224534



On 10/7/2025 7:45 AM, Ryan Eatmon via lists.openembedded.org wrote:
>=20
>=20
> On 10/7/2025 2:34 AM, Mathieu Dubois-Briand wrote:
>> On Mon Oct 6, 2025 at 7:08 PM CEST, Ryan Eatmon via=20
>> lists.openembedded.org wrote:
>>> A lot of the firmware has already been broken out into sub-packages, =
but
>>> a good number were still lingering in the base linux-firmware package.
>>>
>>> This patch does two things:
>>>
>>> 1) Move all of the remaining firmware into sub-packages based on the
>>> driver name in the WHENCE file or into existing sub-packages where a
>>> file or two were missed.
>>>
>>> 2) Create a new REMOVE_UNLICENSED variable and do_install() logic to
>>> allow for marking certain firmware files as something to remove and n=
ot
>>> package up.=C2=A0 The intention is that in the WHENCE file, a number =
of
>>> firmware files have no license information or very questionable
>>> declarations as to what the license is for the firmware.
>>>
>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>> ---
>>
>> Hi Ryan,
>>
>> Thanks for your patch.
>>
>> It looks like some files are not shipped correctly:
>>
>> ERROR: linux-firmware-1_20250917-r0 do_package: QA Issue: linux-=20
>> firmware: Files/directories were installed but not shipped in any=20
>> package:
>> =C2=A0=C2=A0 /lib/firmware/ess
>> =C2=A0=C2=A0 /lib/firmware/ttusb-budget
>> =C2=A0=C2=A0 /lib/firmware/emi62
>> =C2=A0=C2=A0 /lib/firmware/myricom
>> =C2=A0=C2=A0 /lib/firmware/sun
>> =C2=A0=C2=A0 /lib/firmware/yamaha
>> =C2=A0=C2=A0 /lib/firmware/korg
>> =C2=A0=C2=A0 /lib/firmware/vicam
>> =C2=A0=C2=A0 /lib/firmware/acenic
>> =C2=A0=C2=A0 /lib/firmware/yam
>> =C2=A0=C2=A0 /lib/firmware/qcom/sa8775p/LEMANS-EVK-tplg.bin
>> Please set FILES such that these items are packaged. Alternatively if=20
>> they are unneeded, avoid installing them or delete them within=20
>> do_install.
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/2542
>>
>> Can you fix it please?
>=20
> That is odd.=C2=A0 I don't get that error on my builds.=C2=A0 All of th=
ose files=20
> should have been removed by the new REMOVE_UNLICENSED feature in the=20
> recipe.=C2=A0 I'll take a look.

I actually added some "debug" output to the do_install code.  Can you=20
get the log.do_install file for that run?  My company's firewall setup=20
is blocking the WebSockets stuff that the autobuilder site uses, so if=20
it is available there I apologize.  Working with them to address it.


>=20
>> Thanks,
>> Mathieu
>>
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224530): https://lists.openembedded.org/g/openembed=
ded-core/message/224530
> Mute This Topic: https://lists.openembedded.org/mt/115621118/6551054
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
reatmon@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS



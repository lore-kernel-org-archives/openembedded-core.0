Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35D63C2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 18:38:34 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.6402.1747852710571648970
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 11:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=nUAwd8Hy;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54LIcTnf369800;
	Wed, 21 May 2025 13:38:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747852709;
	bh=DD1Dy+3MRNdJoojAr9hkPbCpxFrrNyRz5mpMZuilW/w=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=nUAwd8HyIQz+qoGjc8cLp7ctCJlnvyVMkQt5+oUCPD/BqljoMqVwiNSM6YgZnjQE+
	 LmK+bERK9EeT4uXIwBPYWwlSRzQ6X68KXOTtB/PbKQGfjxvXVB3x8GQVSM5eXIcCM/
	 p195XKX7OMxUcyC7KnLaOsSs31i17+DZO1cu679c=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54LIcT6x908301
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 21 May 2025 13:38:29 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 21
 May 2025 13:38:28 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 21 May 2025 13:38:28 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54LIcSR7125690;
	Wed, 21 May 2025 13:38:28 -0500
Message-ID: <1be302c7-e3bc-4ff3-a0c0-284f1118be04@ti.com>
Date: Wed, 21 May 2025 13:38:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] sbc: Fix for gcc 15 compile error
To: Randy MacLeod <randy.macleod@windriver.com>,
        <openembedded-core@lists.openembedded.org>
References: <20250521162632.27169-1-reatmon@ti.com>
 <490b85d7-9c06-4c1d-8ff4-8b04b8bb8b83@windriver.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <490b85d7-9c06-4c1d-8ff4-8b04b8bb8b83@windriver.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 54LIcTnf369800
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 18:38:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217053



On 5/21/2025 11:55 AM, Randy MacLeod wrote:
> Hi Ryan,
>=20
> On 2025-05-21 12:26 p.m., Ryan Eatmon via lists.openembedded.org wrote:
>> With the move to gcc 15, the code is not generating a compile error.
>=20
> Do you mean *now*generating a compile error?
>=20
>=20
> I guess the YP AB doesn't have a build that catches this target.
>=20
>=20
>> ../sbc-2.1/sbc/sbc_primitives_armv6.c:284:9:
>>     error: too many arguments to function 'sbc_analyze_eight_armv6';
>>        expected 0, have 3
>>
>> Simple fix is to drop the C standard down to gnu17 to avoid this new
>> error.
> It would be better to file a bug or at least send the
> maintainer a patch or a bug description. That's:
>=20
>  =C2=A0=C2=A0 Marcel Holtmann <marcel@holtmann.org>
>=20
> from:
> https://git.kernel.org/pub/scm/bluetooth/sbc.git/tree/README

Sent bug report.


> Anyway, we do have 17 other such work-arounds:
>=20
> poky.git
> =E2=9D=AF rg gnu17 | wc -l
> 17
>=20
> so one more won't hurt that much!
>=20
> ../Randy
>=20
>=20
>> Signed-off-by: Ryan Eatmon<reatmon@ti.com>
>> ---
>>   meta/recipes-multimedia/sbc/sbc_2.1.bb | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-multimedia/sbc/sbc_2.1.bb b/meta/recipes-mul=
timedia/sbc/sbc_2.1.bb
>> index 5aaa52313f..8b91e7e65b 100644
>> --- a/meta/recipes-multimedia/sbc/sbc_2.1.bb
>> +++ b/meta/recipes-multimedia/sbc/sbc_2.1.bb
>> @@ -19,5 +19,7 @@ SRC_URI[sha256sum] =3D "426633cabd7c798236443516dfa8=
335b47e004b0ef37ff107e0c7ead32
>>  =20
>>   inherit autotools pkgconfig
>>  =20
>> +CFLAGS +=3D "-std=3Dgnu17"
>> +
>>   PACKAGES =3D+ "${PN}-examples"
>>   FILES:${PN}-examples +=3D "${bindir}/*"
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#217048):https://lists.openembedded.org/g/openembed=
ded-core/message/217048
>> Mute This Topic:https://lists.openembedded.org/mt/113232263/3616765
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  =
[randy.macleod@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>=20
> --=20
> # Randy MacLeod
> # Wind River Linux
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


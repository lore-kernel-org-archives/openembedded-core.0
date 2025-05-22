Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E86C54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 14:05:00 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.24571.1747922690212964742
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 07:04:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=F2IzSieS;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54ME4nRD619753;
	Thu, 22 May 2025 09:04:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747922689;
	bh=xja5o4JvUrQ4PKUoy3a0z4eRDmO6Njh7yBDHr3zPKbA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=F2IzSieSCbGWizp0DCKtXLQd5KgF9GI6LKGya7UUh1iOsFxYb/XOUDvMkVjEX8skj
	 lkXw7HUS3bt8bpcbCtHNkc6l1JocRGRRDz1MfXnxglVAjEwCzEFe01TTT5l6hbMZLf
	 KdXhmc3GDhF20w/Sux66QgpzJAQW54s0/yRoRaGQ=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54ME4m1O3551400
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 22 May 2025 09:04:49 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 May 2025 09:04:48 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 May 2025 09:04:48 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54ME4mRc051467;
	Thu, 22 May 2025 09:04:48 -0500
Message-ID: <c97759ed-254e-4154-85ab-7f653bf34617@ti.com>
Date: Thu, 22 May 2025 09:04:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] sbc: Fix for gcc 15 compile error
To: Khem Raj <raj.khem@gmail.com>
CC: <openembedded-core@lists.openembedded.org>
References: <20250521162632.27169-1-reatmon@ti.com>
 <CAMKF1spnAHWh=gytPt=vfaFBh81A0VRxFvWqqZnWk07YAQNSVw@mail.gmail.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <CAMKF1spnAHWh=gytPt=vfaFBh81A0VRxFvWqqZnWk07YAQNSVw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 54ME4nRD619753
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 14:05:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217108



On 5/21/2025 3:27 PM, Khem Raj wrote:
> On Wed, May 21, 2025 at 9:26=E2=80=AFAM Ryan Eatmon via lists.openembed=
ded.org
> <reatmon=3Dti.com@lists.openembedded.org> wrote:
>>
>> With the move to gcc 15, the code is not generating a compile error.
>>
>> ../sbc-2.1/sbc/sbc_primitives_armv6.c:284:9:
>>     error: too many arguments to function 'sbc_analyze_eight_armv6';
>>        expected 0, have 3
>>
>> Simple fix is to drop the C standard down to gnu17 to avoid this new
>> error.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
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
>>
>>   inherit autotools pkgconfig
>>
>> +CFLAGS +=3D "-std=3Dgnu17"
>=20
> maybe changing
> static void __attribute__((naked)) sbc_analyze_eight_armv6()
>=20
> to
> static void __attribute__((naked)) sbc_analyze_eight_armv6(const
> unsigned char *buffer, int size, int channels)
>=20
> in that file helps ?

Likely that would help.  I guess the philosophy question is...

Patch the source code  vs.  Lower the C standard to match what the=20
existing source was developed under?

What is the preferred method for handling things like this?

>=20
>=20
>> +
>>   PACKAGES =3D+ "${PN}-examples"
>>   FILES:${PN}-examples +=3D "${bindir}/*"
>> --
>> 2.17.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#217048): https://lists.openembedded.org/g/openembe=
dded-core/message/217048
>> Mute This Topic: https://lists.openembedded.org/mt/113232263/1997914
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


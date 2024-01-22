Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 274F6C46CD2
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 23:36:24 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.8644.1705966575637384347
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 15:36:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=rsmKX46d;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40MNaDSV080541;
	Mon, 22 Jan 2024 17:36:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1705966573;
	bh=71WnH5ly3eTeG0BhkSjfDPxPQfa6TxkNKK0QVbO4zAQ=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=rsmKX46dVENl3kPuMprFOELiR/5NpFnFluybHOLixbArGynNmoD9bnoIY1p1F+Av/
	 b6GueHVwLSh/ZGY6uJX46eBVvJu/io+NKJl9/XVnCUh2y6bDp4wTvtmA1LH9OOkLLF
	 x4msTuwiSvYaDptCrlf0GC7g2j913hB6Kyhwejtk=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40MNaDk5012718
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 22 Jan 2024 17:36:13 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 Jan 2024 17:36:13 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 Jan 2024 17:36:12 -0600
Received: from [10.249.39.53] ([10.249.39.53])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40MNaCfB066837;
	Mon, 22 Jan 2024 17:36:12 -0600
Message-ID: <88033e10-0c89-4498-a785-058d4334c532@ti.com>
Date: Mon, 22 Jan 2024 17:36:12 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] python3-yamllint: Add recipe
Content-Language: en-US
To: Yoann Congal <yoann.congal@smile.fr>,
        <openembedded-core@lists.openembedded.org>, <tim.orling@konsulko.com>
References: <20240122200704.21018-1-reatmon@ti.com>
 <b9a69f67-802a-4c94-88ec-1c16d787d3da@smile.fr>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <b9a69f67-802a-4c94-88ec-1c16d787d3da@smile.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 40MNaDSV080541
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 23:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194195



On 1/22/2024 4:30 PM, Yoann Congal wrote:
> Hi,
>=20
> Le 22/01/2024 =C3=A0 21:07, Ryan Eatmon via lists.openembedded.org a =C3=
=A9crit=C2=A0:
>> Add recipe for yamllint.  There is an upcoming change in u-boot where
>> the binman tool is now configured to call yamllint to verify the confi=
gs
>> during compile time.
>>
>> There was a previous patch a year ago from Trevor Woerner that never
>> made it into oe-core.  This patch is a reworking of his patch but
>> pointing to a newer version.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   .../python/python3-yamllint_1.33.0.bb             | 15 +++++++++++++=
++
>>   1 file changed, 15 insertions(+)
>>   create mode 100644 meta/recipes-devtools/python/python3-yamllint_1.3=
3.0.bb
>=20
> FYI, this new recipe lacks a maintainer and throw this warning :
> WARNING: python3-yamllint-1.33.0-r0 do_recipe_qa: QA Issue: Recipe pyth=
on3-yamllint in [...]/poky/meta/recipes-devtools/python/python3-yamllint_=
1.33.0.bb does not have an assigned maintainer. Please add an entry into =
meta/conf/distro/include/maintainers.inc. [missing-maintainer]

Tim,

Do you mind being the maintainer for this new python recipe?  You are=20
maintainer for many other python modules including pyyaml which this=20
module depends on.  I can submit a v2 updating that file as well if you=20
are willing.


> Regards,

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


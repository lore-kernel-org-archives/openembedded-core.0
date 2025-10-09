Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE857CCD185
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 15:00:57 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.2554.1760022050020134445
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 08:00:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=bNNUkUl6;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 599F0kh1108017;
	Thu, 9 Oct 2025 10:00:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760022046;
	bh=DbpD/9izuViPXaJp3NyTlRVTce7x+exvwhsxu68BGno=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=bNNUkUl6QnYc3oO9Yo4VgB+6oL7qiBQCO72o5lWaXpqc/+24kOPUONQ+bOxaoUE+r
	 yvnRvr/ENX2pTgG/3ZXduG02jUfx3ZRruCqo8SqbjaqR/bQXCKt7mO9r1VZIKC1pBV
	 1ONxpPsj0MYTeDfMUx7j8XIjNLvV4r2zn0ZDAeCM=
Received: from DLEE203.ent.ti.com (dlee203.ent.ti.com [157.170.170.78])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 599F0k6K1511741
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Oct 2025 10:00:46 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Oct
 2025 10:00:46 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 9 Oct 2025 10:00:46 -0500
Received: from [128.247.81.40] (dtmz023nlv.dhcp.ti.com [128.247.81.40] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 599F0kHq423929;
	Thu, 9 Oct 2025 10:00:46 -0500
Message-ID: <913e6202-9c78-446e-bbec-59bd17b454ae@ti.com>
Date: Thu, 9 Oct 2025 10:00:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v2] linux-firmware: Move all firmware into
 sub-packages
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20251007154620.21284-1-reatmon@ti.com>
 <D8E485CB-74EA-4719-BAAE-2E4CE23CC7EB@arm.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <D8E485CB-74EA-4719-BAAE-2E4CE23CC7EB@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot01.ext.ti.com id 599F0kh1108017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 15:00:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224618



On 10/9/2025 9:23 AM, Ross Burton wrote:
> On 7 Oct 2025, at 16:46, Ryan Eatmon via lists.openembedded.org <reatmo=
n=3Dti.com@lists.openembedded.org> wrote:
>>
>> A lot of the firmware has already been broken out into sub-packages, b=
ut
>> a good number were still lingering in the base linux-firmware package.
>>
>> This patch does two things:
>>
>> 1) Move all of the remaining firmware into sub-packages based on the
>> driver name in the WHENCE file or into existing sub-packages where a
>> file or two were missed.
>>
>> 2) Create a new REMOVE_UNLICENSED variable and do_install() logic to
>> allow for marking certain firmware files as something to remove and no=
t
>> package up.  The intention is that in the WHENCE file, a number of
>> firmware files have no license information or very questionable
>> declarations as to what the license is for the firmware.
>=20
> I=E2=80=99m tempted to ask for (1) and (2) to be split into separate pa=
tches, but importantly this empties PN but doesn=E2=80=99t set ALLOW_EMPT=
Y, so the meta-package to let you install all the firmware no longer exis=
ts.
>=20
> Can you set ALLOW_EMPTY:${PN} =3D =E2=80=9C1=E2=80=9D so that linux-fir=
mware is still built (albeit empty).

Sure.  I'll split this into three patches.

1) Bin everything (with a license).
2) Add the remove logic for the remaining unlicensed code, and set=20
ALLOW_EMPTY.
3) Set FILES:${PN}=3D"" with comment to make it clear what the new policy=
 is.

Just to make it super clear what each patch is doing.


> Ross

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS



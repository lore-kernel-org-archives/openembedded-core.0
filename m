Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAFE3C71136
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 18:02:03 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.26404.1750183316303020000
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 11:01:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=NnZoiizd;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55HI1rjj089405;
	Tue, 17 Jun 2025 13:01:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750183313;
	bh=s/G0cJgfZScxh123sz13kDe04Jkd/tyxFcBfZppeYTU=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=NnZoiizd0lFkwfdVvcLE/Hf4gVSJ2a7DrkOKNLo448tvEqSRN6xIyhi186HXhFF8w
	 f1chVlmdN7Y2I8cte1YsJ5uRUHb5n6U0+dS9+9HmsKqvGlTDsfvSCtPfpLiZqRgNo/
	 v5+AIuVt8yAo0x2eYTpnQC2A+tRAqgMiw7Qu08gE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55HI1r892000715
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 17 Jun 2025 13:01:53 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 17
 Jun 2025 13:01:52 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 17 Jun 2025 13:01:52 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55HI1q5G2117271;
	Tue, 17 Jun 2025 13:01:52 -0500
Message-ID: <ccb00e82-a47b-4917-8c97-c7a67fe5b090@ti.com>
Date: Tue, 17 Jun 2025 13:01:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] u-boot: Allow for customizing installed/deployed
 file names
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20250611190430.13378-1-reatmon@ti.com>
 <12269899-C562-4B4A-987E-27A2F770B694@arm.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <12269899-C562-4B4A-987E-27A2F770B694@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot04.ext.ti.com id 55HI1rjj089405
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 18:02:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218915



On 6/17/2025 12:16 PM, Ross Burton wrote:
> On 11 Jun 2025, at 20:04, Ryan Eatmon via lists.openembedded.org <reatm=
on=3Dti.com@lists.openembedded.org> wrote:
>>
>> When assembling all of the various filenames that are installed/deploy=
ed
>> from u-boot, we have been including the PV and PR in the filenames.  T=
his
>> change introduces a simple variable indirection for those places so th=
at
>> the values for PV and PR can be modified if desired.
>>
>> In this case, we are wanting to use the value for PKGV instead of PV s=
o
>> that we can pick up the git commit, but a change of that magnitude in =
a
>> bbappend would be impossible with all of the places where PV is hard-c=
oded.
>>
>> This change should not be disruptive since the default value for the n=
ew
>> UBOOT_PV and UBOOT_PR are just PV and PR respectively.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>> meta/classes-recipe/uboot-config.bbclass | 15 +++--
>> meta/recipes-bsp/u-boot/u-boot.inc       | 80 ++++++++++++------------
>> 2 files changed, 50 insertions(+), 45 deletions(-)
>>
>> diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-r=
ecipe/uboot-config.bbclass
>> index f44605cb6a..6287701888 100644
>> --- a/meta/classes-recipe/uboot-config.bbclass
>> +++ b/meta/classes-recipe/uboot-config.bbclass
>> @@ -22,12 +22,17 @@ def removesuffix(s, suffix):
>> UBOOT_ENTRYPOINT ?=3D "0x20008000"
>> UBOOT_LOADADDRESS ?=3D "${UBOOT_ENTRYPOINT}"
>>
>> +# When naming the files we install/deploy, the package version and re=
vision
>> +# are part of the filename.  Allow these to be customized if desired.
>> +UBOOT_PV ?=3D "${PV}"
>> +UBOOT_PR ?=3D "${PR}"
>=20
>> -UBOOT_IMAGE ?=3D "${UBOOT_BINARYNAME}-${MACHINE}-${PV}-${PR}.${UBOOT_=
SUFFIX}"
>> +UBOOT_IMAGE ?=3D "${UBOOT_BINARYNAME}-${MACHINE}-${UBOOT_PV}-${UBOOT_=
PR}.${UBOOT_SUFFIX}=E2=80=9D
>=20
> Every instance of this is PV-PR, so why not have a single =E2=80=9CUBOO=
T_VERSION=E2=80=9D variable that defaults to PV-PR?
>=20
> Putting the PR in the filenames seems wrong, but that can be a follow-u=
p patch.

I can make that change.  I had thought about doing something like that,=20
but decided for the more specific change.  I'll take a stab at that and=20
send in a v2.  Thanks!


> Ross

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


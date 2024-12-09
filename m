Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 885EFE77181
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 20:40:54 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.112537.1733776853562292927
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Dec 2024 12:40:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=OU91yFn6;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B9KeoJY2820698
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Dec 2024 14:40:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733776851;
	bh=6NMmdym3xyFnm2An5qah/SLC10Xcrko5pBWCDkhMSlI=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=OU91yFn6KHcWcV6ZASpCvhsK7nH/uzzY7m79UiTLoxKR6NY9QTOMGXYBCNtKJffDU
	 Sk+0OauqoBauZtXSB3BWaL4WjZyCufd/WV1RPQp6VMURwYgrT0hk0sG7FvLupOVvc8
	 6AJ3zvW7v0287KjenX7ufylBL1ldSMzY33T4/os8=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B9Keo8b081035
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 Dec 2024 14:40:50 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Dec 2024 14:40:49 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Dec 2024 14:40:48 -0600
Received: from [10.249.33.166] ([10.249.33.166])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B9KemiA061144;
	Mon, 9 Dec 2024 14:40:49 -0600
Message-ID: <aa70739a-2a7e-42d1-876e-25cb8bb10cc0@ti.com>
Date: Mon, 9 Dec 2024 14:40:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] Revert "uboot-sign: fix U-Boot binary with
 public key"
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        <openembedded-core@lists.openembedded.org>,
        Denys Dmytriyenko
	<denys@konsulko.com>
References: <20241206210917.31123-1-reatmon@ti.com>
 <f33814f998b09438feadedbab1ab04c536600496.camel@linuxfoundation.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <f33814f998b09438feadedbab1ab04c536600496.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot01.ext.ti.com id 4B9KeoJY2820698
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Dec 2024 20:40:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208496



On 12/8/2024 4:22 PM, Richard Purdie wrote:
> On Fri, 2024-12-06 at 15:09 -0600, Ryan Eatmon via lists.openembedded.o=
rg wrote:
>> This reverts commit 0d14e99aa18ee38293df63d585fafc270a4538be.
>>
>> The patch removed logic required for correct handling of
>> UBOOT_SUFFIX=3Dimg or UBOOT_SUFFIX=3Drom.=C2=A0 We need to find a bett=
er way to
>> handle the fix for [YOCTO #15649].
>>
>> Signed-off-by:=C2=A0 Ryan Eatmon <reatmon@ti.com>
>> ---
>>  =C2=A0meta/classes-recipe/uboot-sign.bbclass | 8 +++++++-
>>  =C2=A01 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-rec=
ipe/uboot-sign.bbclass
>> index 7ee73b872a..a17be745ce 100644
>> --- a/meta/classes-recipe/uboot-sign.bbclass
>> +++ b/meta/classes-recipe/uboot-sign.bbclass
>> @@ -122,7 +122,13 @@ concat_dtb() {
>>  =C2=A0	# If we're not using a signed u-boot fit, concatenate SPL w/o =
DTB & U-Boot DTB
>>  =C2=A0	# with public key (otherwise U-Boot will be packaged by uboot_=
fitimage_assemble)
>>  =C2=A0	if [ "${SPL_SIGN_ENABLE}" !=3D "1" ] ; then
>> -		if [ -e "${UBOOT_NODTB_BINARY}" -a -e "${UBOOT_DTB_BINARY}" ]; then
>> +		if [ "x${UBOOT_SUFFIX}" =3D "ximg" -o "x${UBOOT_SUFFIX}" =3D "xrom"=
 ] && \
>> +			[ -e "${UBOOT_DTB_BINARY}" ]; then
>> +			oe_runmake EXT_DTB=3D"${UBOOT_DTB_SIGNED}" ${UBOOT_MAKE_TARGET}
>> +			if [ -n "${binary}" ]; then
>> +				cp ${binary} ${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX}
>> +			fi
>> +		elif [ -e "${UBOOT_NODTB_BINARY}" -a -e "${UBOOT_DTB_BINARY}" ]; th=
en
>>  =C2=A0			if [ -n "${binary}" ]; then
>>  =C2=A0				cat ${UBOOT_NODTB_BINARY} ${UBOOT_DTB_SIGNED} | tee ${binar=
y} > \
>>  =C2=A0					${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX}
>>
>=20
> I'm in two minds about whether to take this or not. The code is clearly
> needed for some platforms however the selftests don't cover it and I
> doubt it is documented either :/
>=20
> If I take this, can we add in some better testing please?

The initial commit that starts the img ball rolling came from 2016:

https://git.openembedded.org/openembedded-core/commit/meta/classes/uboot-=
sign.bbclass?id=3D4afee787e455ce1d4c002cd5c003182f1fc50028

The logic has morphed over time, but there is where it started.  So it's=20
been in there for a number of years.

I'm willing to take a stab at the selftest.  Is there any documentation=20
to help with that broadly means/entails?  I'll also talk to Denys in our=20
call tomorrow if he knows and can point me in a good direction for this.


> Cheers,
>=20
> Richard
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


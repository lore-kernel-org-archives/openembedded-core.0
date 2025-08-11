Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 123AECA0EC4
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 17:43:38 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.54172.1754934216970575519
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Aug 2025 10:43:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=P1R6WIK0;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57BHhXch1660572;
	Mon, 11 Aug 2025 12:43:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754934213;
	bh=ejuMUOlVbqnxEicJruyHsPZ6zNeF8ZXb17kJB7NHEgk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=P1R6WIK04hWPp0NM3PG5jtTcZ3MuMKlW8/uIaWftF8SLPh4e3K/hLT+XQLojz2HqE
	 kMLqqMwWYNV44PKH3lu8+hMgO1k/TE0elcSptIrJV0jeBaomWCmivEjicm+xMnROTR
	 ZIUqrCzZjY4Fm02x3gF6/9obVsWXB4Gq0Czodky4=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57BHhWuD3840574
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 11 Aug 2025 12:43:33 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 11
 Aug 2025 12:43:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 11 Aug 2025 12:43:32 -0500
Received: from [128.247.81.69] (dtmxl9433pnr.dhcp.ti.com [128.247.81.69])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57BHhWDb3265395;
	Mon, 11 Aug 2025 12:43:32 -0500
Message-ID: <8c52874a-71b5-4319-aa89-05c2f4a0aee7@ti.com>
Date: Mon, 11 Aug 2025 12:43:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: clang package sizes
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <f9092d37-56a3-47c7-bb04-396d7ba61691@ti.com>
 <CAMKF1spicyRpN1EYdDMJPn8e8He1qdCgbB1pKrCS0U+nfR-2oQ@mail.gmail.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <CAMKF1spicyRpN1EYdDMJPn8e8He1qdCgbB1pKrCS0U+nfR-2oQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 57BHhXch1660572
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 17:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221747


Not poky.  Our meta-arago distro.  I'll take a look at that.  Thanks!


On 8/8/2025 12:48 PM, Khem Raj wrote:
> On Fri, Aug 8, 2025 at 7:24=E2=80=AFAM Ryan Eatmon <reatmon@ti.com> wro=
te:
>>
>>
>> I've been noticing that the master final build sizes have increased a
>> lot from scarthgap to master.  Some increase is inevitable, but I was
>> seeing an almost 10gig increase in size.  So I started comparing our
>> scarthgap builds against our master builds and I tracked down the
>> biggest offender to the packages (.ipk).
>>
>> So I dug further, wrote a perl script to compare the two directories a=
nd
>> found two very big offenders.
>>
>> INC:   94M -> 4.1G  4366.38%  clang-staticdev
>> INC:   18M -> 3.4G  19242.22%  clang-dbg
>>
>>   From the meta-clang setup in scarthgap to the oe-core versions of th=
e
>> packages I'm seeing a huge blow up.  Can anyone with some knowledge of
>> the differences between the two approaches verify that this is expecte=
d
>> and not just something overlooked in the new setup?
>=20
> If you are using poky then you will notice
>=20
> require conf/distro/include/yocto-space-optimize.inc
>=20
> which should have helped, are you comparing this with poky or poky
> derived distro ?
>=20
>>
>>
>> --
>> Ryan Eatmon                reatmon@ti.com
>> -----------------------------------------
>> Texas Instruments, Inc.  -  LCPD  -  MGTS

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


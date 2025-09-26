Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F176CCAC5AE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 13:40:01 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.17582.1758893999650440895
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Sep 2025 06:39:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=jsn2hDou;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58QDdwwg1668084;
	Fri, 26 Sep 2025 08:39:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758893998;
	bh=ml6qs03mP/eZqfApwLjSok6Z7wkLlO1jpYfKbI3MzY8=;
	h=Date:From:Subject:To:CC:References:In-Reply-To;
	b=jsn2hDouGaA8NITjyOvRNHSLQDy3IidLN8CBPFkZkXUmKfp20BdvG+tDJw4wQM2eQ
	 ox8CToT9AiAjQssEyTltKWia9oFFskvmg/FCjIMM62Qlwo14iaaXNdxgSPx/SjWJoY
	 X6x1hdX/oIJMbNH4iCOxL1WdVpUz+Uwn+keJFSXo=
Received: from DLEE214.ent.ti.com (dlee214.ent.ti.com [157.170.170.117])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58QDdwwX184155
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 Sep 2025 08:39:58 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 26 Sep
 2025 08:39:57 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 26 Sep 2025 08:39:57 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58QDdvA21115144;
	Fri, 26 Sep 2025 08:39:57 -0500
Message-ID: <aefeeb56-49dc-46e4-aa64-4e47a83b5b3d@ti.com>
Date: Fri, 26 Sep 2025 08:39:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ryan Eatmon <reatmon@ti.com>
Subject: Re: [OE-core][PATCH] linux-firmware: Fix FILES for intel firmware
To: Martin Jansa <martin.jansa@gmail.com>
CC: <openembedded-core@lists.openembedded.org>
References: <20250925192115.21761-1-reatmon@ti.com>
 <CA+chaQdeDK_-buP-nq9BoPqbD3dBHGKo+kr5xD_1=sJXdaqqgg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CA+chaQdeDK_-buP-nq9BoPqbD3dBHGKo+kr5xD_1=sJXdaqqgg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 58QDdwwg1668084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 13:40:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224081



On 9/25/2025 4:01 PM, Martin Jansa wrote:
> On Thu, Sep 25, 2025 at 9:21=E2=80=AFPM Ryan Eatmon via lists.openembed=
ded.org
> <reatmon=3Dti.com@lists.openembedded.org> wrote:
>>
>> The 20250917 version is installing the firmware files into the
>> /usr/lib/firmware/intel directory and symbolic links to those files
>> under /usr/lib/firmware.  FILES needs to be updated to correctly packa=
ge
>> all of the files into the right packages.  Without this we get a depen=
dency
>> from the linux-firmware-iwlwifi-* and linux-firmware-qat packages back=
 to
>> linux-firmware which means you have to install ALL of the drivers when=
 you
>> depend on the specific package.
>=20
> Can we set FILES:${PN} to empty, so that issues like this trigger
> installed-vs-shipped QA issue in the version upgrades? Or are there
> any files which should be packaged in ${PN}?
>=20
> Cheers,

I certainly think that would be a good idea in the long run.  But right=20
now there are bunch of files that go into linux-firmware that are not=20
broken out in sub packages.

ls -l packages-split/linux-firmware/usr/lib/firmware// | wc -l
234

So, there would need to be a lot of additional cleanup and sub package=20
definitions before linux-firmware could be considered to be clean.

I'm happy to start the process of doing that, but this patch needs to be=20
picked up to avoid build issues.

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


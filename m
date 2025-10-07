Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE38ECCA476
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 15:15:44 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.21430.1759850140927211826
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 08:15:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=x8lJ4Nrr;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 597FFcRk3784645;
	Tue, 7 Oct 2025 10:15:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759850138;
	bh=Bihi+8XEpSCMVLMy5NEvL3Z1fKUAMh9OV3c0jhV68CM=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=x8lJ4NrrxOrYONqyTjK1C0c+znjzXuYq6fE/Qq/aEePMxWcJkUMpr0etN15lzutyU
	 KoFS89YIL8f43Mcp7SsG21ONcSE8mkKFXqNrpcxpq4iaKGfsE0rqIrNDRG2YfE6ahG
	 uxbKDFH6ZIBgocfRzza2R8hbpyr33QKAgxlFXMyc=
Received: from DLEE213.ent.ti.com (dlee213.ent.ti.com [157.170.170.116])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 597FFcdN4159952
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Oct 2025 10:15:38 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Oct
 2025 10:15:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 7 Oct 2025 10:15:38 -0500
Received: from [128.247.81.40] (dtmz023nlv.dhcp.ti.com [128.247.81.40] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 597FFcM41317297;
	Tue, 7 Oct 2025 10:15:38 -0500
Message-ID: <f493e158-daf4-4314-b4f3-18f0ffacdbfd@ti.com>
Date: Tue, 7 Oct 2025 10:15:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] linux-firmware: Move all firmware into
 sub-packages
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        <openembedded-core@lists.openembedded.org>
References: <20251006170804.9664-1-reatmon@ti.com>
 <DDBWZY3PMFQU.1HP666LHFOD0H@bootlin.com>
 <186C362D6E62D57C.5353@lists.openembedded.org>
 <d395d3a2-4467-4e62-beef-f7b5ab973e89@ti.com>
 <DDC6AQNV866W.OLD39GWU3AYP@bootlin.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <DDC6AQNV866W.OLD39GWU3AYP@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 597FFcRk3784645
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 15:15:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224539



On 10/7/2025 9:51 AM, Mathieu Dubois-Briand wrote:
> On Tue Oct 7, 2025 at 2:54 PM CEST, Ryan Eatmon wrote:
>>>
>>> That is odd.=C2=A0 I don't get that error on my builds.=C2=A0 All of =
those files
>>> should have been removed by the new REMOVE_UNLICENSED feature in the
>>> recipe.=C2=A0 I'll take a look.
>>
>> I actually added some "debug" output to the do_install code.  Can you
>> get the log.do_install file for that run?  My company's firewall setup
>> is blocking the WebSockets stuff that the autobuilder site uses, so if
>> it is available there I apologize.  Working with them to address it.
>>
>=20
> Hi Ryan,
>=20
> I'm attaching the log. It contains a lot of "160: [: 1: unexpected
> operator" or similar errors, so it might explain what we are seeing.
>=20
> Also, if it can help you, I was able to reproduce it easily with this
> tag:
> https://git.yoctoproject.org/poky-ci-archive/tag/?h=3Dautobuilder.yocto=
project.org/valkyrie/a-full-2531
> Just ". oe-init-build-env" and "bitbake linux-firmware" should be
> enough, no need to tweak the configuration.

Thanks!  I'll see if I can figure out why my code is not happy in that=20
environment and send a v2...


> Thanks,
> Mathieu
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS



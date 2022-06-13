Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2857FCCA47B
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 16:57:58 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.57])
 by mx.groups.io with SMTP id smtpd.web12.8462.1655139467960905808
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 09:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=FcadTO/L;
 spf=pass (domain: arm.com, ip: 40.107.20.57, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=j8CRmT+6ZS3YkAF9Mt9VAogzuCocbG7x5LIrjNLO5yZnX892abiAArm02T+TZMPCiWYMTxeXxLKTweZWZwvnsF3AtJAdaiZ/VtjLNg2GuAP9bcSVzKqkVPm3ejGz/b0QGQrsmq/KyyxDQMi6YxzRt1QFbxkdW3o8eY+wUjYWFhuwKXBDaxal2adWvNOfLRG7n0Kc0Dm1VMqcYXN3JFHVVGTAuGFD5OliJRoRciDMThGn5HFKMqZhfZzPAvEG1/RnJvlu2pBYjrgZWdgis8RLQUKDTKeGXp131NFCJfA22WAwVcAOjs817IlZmRKjEUYesYLpG0d+5Za9GGknrmmhTA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xr2vVqlPh+Mun1uUEO4amOgsuN1fkZWE0wbNp6LyHNA=;
 b=Z/jhr1RuxfW8AjIUfPiAe/CVdyhtjRv/984+BTvW6OF6oA0h+OC8MfJqdR6ASJkCnkXWGbuhkCdmdKJcpgxjVW52ZodS0WCc+rmV5bdXee/7BRt6JcFhSy1KKdJ7iW4lbJlErOB72/zO7yQG2zO41DZg7m5JUjVNSItiMbvP8f3w23IM5Ldg1hiq2Bk1GavAH4vymAJqnuINkK01XSsbuqaODU+ScvtM0AEGFjZseT1rntpi5yWC12FWAvPwJPuUWhdHwMaBQhLYTclSSV+GUjN40SjkO1fSTyT+J2bYRxcPDGUF90RvOzG6GOu7uMgWLy90+a4+sRjlipu1Esd5ig==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xr2vVqlPh+Mun1uUEO4amOgsuN1fkZWE0wbNp6LyHNA=;
 b=FcadTO/LOkgDmtlQ/tdVlne/mZboRQorAF0axHZqwWC8B0q3NmMylU8oK4uyW6XEDMLIcF7IPLvxTVFcev/wKTsZMv7LtRq05rI7oQPMmdPHl/clCRvgy3dBuZCze9vl95RF8FCT0swWb4o7rfkW4cIdxWoRP1nnEN73HyyvNvc=
Received: from DB6PR07CA0015.eurprd07.prod.outlook.com (2603:10a6:6:2d::25) by
 PAXPR08MB6814.eurprd08.prod.outlook.com (2603:10a6:102:137::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Mon, 13 Jun
 2022 16:57:45 +0000
Received: from DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::51) by DB6PR07CA0015.outlook.office365.com
 (2603:10a6:6:2d::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.11 via Frontend
 Transport; Mon, 13 Jun 2022 16:57:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT024.mail.protection.outlook.com (100.127.142.163) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.12 via Frontend Transport; Mon, 13 Jun 2022 16:57:44 +0000
Received: ("Tessian outbound e40990bc24d7:v120");
 Mon, 13 Jun 2022 16:57:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b18a4699d7dd2e5b
X-CR-MTA-TID: 64aa7808
Received: from 8eb64e76e296.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DF5EF049-816C-481C-ADDF-40B2A74E5408.1;
	Mon, 13 Jun 2022 16:57:37 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 8eb64e76e296.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 13 Jun 2022 16:57:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X/DqrWCDGt9fkMfEbJyC7/+FM+3+m/kps7NBxJJUE+x6bgL7ZU3tq9JXNFW33uNrrd1cMLZxqqR1Xf3Mfxt5L8FrcBd+D0/DUfNWqYFANUKJ/H3wm6lbi1ftzzR4tlNxj6WxPbD5atwSEBARG9lSwGdfMVxdND9f0RIPEtZdoCZhwZ/+UCZuakWRhurVmhbQSwE5zztSMdau1wBTI6FF8tF4iUQLz7zviwXx3xqoK7Hdq3jarhXKE75A6eqhzYiiQT4J+q8pTu84q9BH/cEz1xZv9KESHcFE/K22rEwGE23e1kT5y0N29o5yhM+zz1YQzYqfyQOIu0jyXHxcwmH6Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xr2vVqlPh+Mun1uUEO4amOgsuN1fkZWE0wbNp6LyHNA=;
 b=HppyJhV38JtJk7jTVCto4HUy1Ld+meeu3JDj7O+/B4qM4BRtVw6ZgxN3w1GH5t4ungc0KAwfAFg5UuGNZWVAlGoO0JLOJS2PPIjSZapJywRpXLBx7fPfvpnIYeqLaNeVoyKXXuKOJURLjamNFzlAiiiNQRnKJb7dlGDM2gtFn3NcjsnCDJvtW3JqrwpAhRNiYPWc54iYVd3gwoFdhAmmsJObzyarBwQuXoBPaRZDIxNoWGGciejLuR5RkKRsgL3dgtLlOAqc7L/0wO5H8XTWt3H5RXGRZPGzRzjM9bacXbBqOcC4Zs2ALKc1v/F7N7rLK6fTrQL8ZhtI7qe5pLpw2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xr2vVqlPh+Mun1uUEO4amOgsuN1fkZWE0wbNp6LyHNA=;
 b=FcadTO/LOkgDmtlQ/tdVlne/mZboRQorAF0axHZqwWC8B0q3NmMylU8oK4uyW6XEDMLIcF7IPLvxTVFcev/wKTsZMv7LtRq05rI7oQPMmdPHl/clCRvgy3dBuZCze9vl95RF8FCT0swWb4o7rfkW4cIdxWoRP1nnEN73HyyvNvc=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by VI1PR08MB4528.eurprd08.prod.outlook.com (2603:10a6:803:fd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.14; Mon, 13 Jun
 2022 16:57:35 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::a5a1:150b:2203:ff34]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::a5a1:150b:2203:ff34%9]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 16:57:35 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Steve Sakoman <steve@sakoman.com>
CC: openembedded-core <openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: Re: [OE-core] [yocto-security] OE-core CVE metrics for master on Sun
 12 Jun 2022 02:00:01 AM HST
Thread-Topic: [OE-core] [yocto-security] OE-core CVE metrics for master on Sun
 12 Jun 2022 02:00:01 AM HST
Thread-Index: AQHYflRP08ywTRQ3J0Sl4Bfd2GrCH61NcFUAgAAQN7SAABAmAA==
Date: Mon, 13 Jun 2022 16:57:35 +0000
Message-ID: <2CD70374-F9AA-47B0-9F34-8C4FD7D709A1@arm.com>
References: <20220612120224.4629B96054A@nuc.router0800d9.com>
 <AD877D76-9887-4236-80AC-F3F0BD6E4540@arm.com>
 <16F837E9E22C509D.5246@lists.openembedded.org>
 <CAOSpxdaZ=HsmohVRz8X=+=uu+hLo6hRHutFuoHqTzRVy-UeUfw@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdaZ=HsmohVRz8X=+=uu+hLo6hRHutFuoHqTzRVy-UeUfw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 59d29334-e104-4980-bf4a-08da4d5dd632
x-ms-traffictypediagnostic: 
	VI1PR08MB4528:EE_|DBAEUR03FT024:EE_|PAXPR08MB6814:EE_
X-Microsoft-Antispam-PRVS: 
	<PAXPR08MB6814A7654FA41C53BDF92EB6E8AB9@PAXPR08MB6814.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 KnrXy5MyI8hRwmLs2WkiE8hgr92KBSdqxhnLGHew1SH6vwlu1KapZMAiPhzg4tZ5v7ClB0DKnx2kHOm75SImCEnhrLMUV7hYBAHrkgUP4Lndfxp8OzrzJ68rkYXCP4fMpEGA4W/2hKarjTAlBMsIAwBdTwmk6ijTtnZ1eKBQ6svEEK95c6vWvPmrIfwFOTEWkCYKMXojyidyXWs6jE4YnYxhC+qBkW8RSDm0LqBDHhsTRd+eZMWIHRkM/nOe1RPsaKbCGPfYZ0GHpVlVjcSZ1ZpZeOmGrnByp4d9BfWB5iv6x0pncfFAsmAvAXyNcXxv3qJ1O8EO9YgMsTmHE32tyQKlarYrETZDF/YMJETyRIsqUXF29N16zNvsEd32GSuVV51xm5XAIPp2/X8MaMw7AR4XCnac2gsqZRayF5C0zuSQ+93cEqE1Cb4gOqMO96goxGYLQxmc/jaA/muk66ANLFlJW3VUslmwoYi51ndLq5jSkHDO7T5vlHTbCfIizepie8ihGeXym4P7kU/LIMVSVVXfYSc4UWt7iedgkR9eH23kfrhLWT8mnpuOzMg7F8A1IxgJVHuo4w1U86WQ6HmqMn9clPbZbKc2BCMj2+cwTTMa3ofYYsneIdHUoBab/6DbgkDQMqJslLBQLdfT6xqITYcny5NuY/wiWOuVLENV2bT0Qc1S43YxGuBkHOK2YCmpZYzEr16OdtWFincPWYWgJ7zfHBmOlrNFw2uXQyNdXX0MQIWdlKmXSgyv5GbsNxpZ8g8e3naP497f1GMA5i4DwnUja/rHqWpBXO8MNF6INmnqJ49CBAKUDxru3Xwzf3vw
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(2906002)(508600001)(66946007)(6486002)(966005)(8676002)(66446008)(64756008)(66556008)(15650500001)(6916009)(54906003)(71200400001)(316002)(53546011)(86362001)(26005)(6512007)(76116006)(6506007)(4326008)(66476007)(91956017)(38100700002)(36756003)(33656002)(186003)(83380400001)(2616005)(8936002)(5660300002)(122000001)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5CC988130C5FE8418BF26B1EADB35842@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4528
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ec98f38f-a190-4413-e3d7-08da4d5dd06e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iQ1dtMhVYYwyyD0/Yx4bISVOFwc/g9kcyHYzf5mdEZBfdvF6D3nBz1uOSZqpEEErbt+4owl0u7p7s58KIoUU9p+WrZ/wUhotebxnGOO1n1r86qWlnUCKGv4mSRXgro/6Fu5ZgPkc/Tsj1hSkP98iX7Q7KudZHN/9PW6L/HWKVq7028W8HOW/FTJzJUnotM/5JRdAwIxHRoVx0zZraq+qEwgLGslgqtMwf4dZjx2AfZ/IUMtc/wYMuT4INcfl1w0D0xDANyNfV/EHXEyAaxhf8jZDHv3oCBE+F8Mvo18ZLeGB8agvQ0wHcCzof1Wj3GsCxkOK+fmlMFC5/41VE1UA/U4SCpqpTkjBqb1H/HycDhKdey7m5QH7FXVk2cCGdwRY1lkAqLWqbGjizBDnIBNgsRMGezeD7pXvKTJHjLM3yam3YliLfUl7gy8YwmvMTl3ByD6IjkLNNI+8eVGyUxPkCzOShv6S+K6LyMpxcSkqAJ92JX9NVMFQLgbgLsAHCHEHjocK6P6QO23Xb3yjtXdmxQC+j6KaZq28Oe9F3fop7g+haaLQ+NrwCq9KY27ueHaxyl/FxKG1RqbkLzn+AhRnL1Ny7xSEtsNjQcF/C64bttGNJddfOcLOMcyY0v52fwZT/XNlibGmoylSbSLRSJeOAzAKoVLfv204mZjkMFz5okIbSBiNdpSMjC7FRPwoxd9cR1LvaAeTVLWsXyjszclKJQbfXgG4vHRFnCJf7P9Z2KP0lG1l+LbBtJee6Q/A3BcG
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(46966006)(40470700004)(36840700001)(6486002)(508600001)(316002)(966005)(70586007)(70206006)(15650500001)(54906003)(53546011)(82310400005)(6512007)(356005)(26005)(5660300002)(33656002)(107886003)(6862004)(2616005)(4326008)(8676002)(2906002)(86362001)(36756003)(8936002)(186003)(336012)(47076005)(40460700003)(6506007)(83380400001)(36860700001)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 16:57:44.7293
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 59d29334-e104-4980-bf4a-08da4d5dd632
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6814
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 16:57:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166869

VGhlIENQRSBwcmV2aW91c2x5IHNheXMgdGhhdCBpdCBhcHBsaWVzIHRvIGFwcGxlOmN1cHMgPDQ5
OS40LiAgV2UgaGF2ZSBvcGVucHJpbnRpbmfigJlzIGZvcmsgb2YgY3VwcywgMi40LjIuDQoNCkl0
IG5vdyBhbHNvIHNheXMgb3BlbnByaW50aW5nOmN1cHMgPDIuNC4yLCBidXQgSSBkb27igJl0IHRo
aW5rIHdlIHNob3VsZCByZXN0cmljdCB0aGUgQ1ZFX1BST0RVQ1QgYXMgd2XigJlsbCBtaXNzIGFs
bCB0aGUgYXBwbGU6Y3VwcyBlbnRyaWVzIHRoZW4uICBOb3Qgc3VyZSBob3cgYmVzdCB0byBoYW5k
bGUgdGhpc+KApg0KDQpSb3NzDQoNCj4gT24gMTMgSnVuIDIwMjIsIGF0IDE2OjU5LCBTdGV2ZSBT
YWtvbWFuIHZpYSBsaXN0cy55b2N0b3Byb2plY3Qub3JnIDxzdGV2ZT1zYWtvbWFuLmNvbUBsaXN0
cy55b2N0b3Byb2plY3Qub3JnPiB3cm90ZToNCj4NCj4gT24gTW9uLCBKdW4gMTMsIDIwMjIgYXQg
NTozMiBBTSBTdGV2ZSBTYWtvbWFuIHZpYQ0KPiBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxzdGV2
ZT1zYWtvbWFuLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KPiB3cm90ZToNCj4+DQo+PiBP
biBNb24sIEp1biAxMywgMjAyMiBhdCA1OjAxIEFNIFJvc3MgQnVydG9uIDxSb3NzLkJ1cnRvbkBh
cm0uY29tPiB3cm90ZToNCj4+Pg0KPj4+DQo+Pj4+IENWRS0yMDIyLTI2NjkxIChDVlNTMzogNi43
IE1FRElVTSk6IGN1cHMgaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/
dnVsbklkPUNWRS0yMDIyLTI2NjkxICoNCj4+Pg0KPj4+IFRoaXMgaXMgZml4ZWQgaW4gMi40LjIg
d2hpY2ggaXMgYWxyZWFkeSBpbiBtYXN0ZXIuDQo+Pj4NCj4+PiBUaGUgc3RhYmxlIGJyYW5jaGVz
IGNhbiBjaGVycnktcGljayBodHRwczovL2dpdGh1Yi5jb20vT3BlblByaW50aW5nL2N1cHMvY29t
bWl0L2RlNGY4YzE5NjEwNjAzM2U0YzM3MmRjZTNlOTFiOWQ0MmIwYjk0NDQuDQo+Pg0KPj4gSSdt
IHdvcmtpbmcgb24gdGhhdCBmb3IgZHVuZmVsbCBhbmQga2lya3N0b25lIHRvZGF5Lg0KPg0KPiBJ
J3ZlIHB1dCB0b2dldGhlciBhIHBhdGNoIGZvciBkdW5mZWxsIHdoaWNoIHdpbGwgYmUgaW4gdGhl
IG5leHQgcGF0Y2hzZXQuDQo+DQo+IEhvd2V2ZXIga2lya3N0b25lIGFuZCBtYXN0ZXIgYXJlIGJv
dGggYXQgdmVyc2lvbiAyLjQuMiwgc28gc29tZXRoaW5nDQo+IG11c3QgYmUgd3JvbmcgaW4gdGhl
IGRhdGFiYXNlIGVudHJ5IGZvciB0aGlzIHRvIGJlIGZsYWdnZWQgZm9yIGJvdGgNCj4gOi0oDQo+
DQo+IFN0ZXZlDQo+DQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVj
ZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGlu
ZSAoIzYxMyk6IGh0dHBzOi8vbGlzdHMueW9jdG9wcm9qZWN0Lm9yZy9nL3lvY3RvLXNlY3VyaXR5
L21lc3NhZ2UvNjEzDQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy55b2N0b3Byb2pl
Y3Qub3JnL210LzkxNzI5ODgyLzY4NzU4ODgNCj4gR3JvdXAgT3duZXI6IHlvY3RvLXNlY3VyaXR5
K293bmVyQGxpc3RzLnlvY3RvcHJvamVjdC5vcmcNCj4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlz
dHMueW9jdG9wcm9qZWN0Lm9yZy9nL3lvY3RvLXNlY3VyaXR5L3Vuc3ViIFtyb3NzLmJ1cnRvbkBh
cm0uY29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPg0KDQpJTVBPUlRBTlQgTk9USUNF
OiBUaGUgY29udGVudHMgb2YgdGhpcyBlbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIGFyZSBjb25m
aWRlbnRpYWwgYW5kIG1heSBhbHNvIGJlIHByaXZpbGVnZWQuIElmIHlvdSBhcmUgbm90IHRoZSBp
bnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBh
bmQgZG8gbm90IGRpc2Nsb3NlIHRoZSBjb250ZW50cyB0byBhbnkgb3RoZXIgcGVyc29uLCB1c2Ug
aXQgZm9yIGFueSBwdXJwb3NlLCBvciBzdG9yZSBvciBjb3B5IHRoZSBpbmZvcm1hdGlvbiBpbiBh
bnkgbWVkaXVtLiBUaGFuayB5b3UuDQo=


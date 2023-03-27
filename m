Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72FC0C7619A
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 11:38:19 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.85])
 by mx.groups.io with SMTP id smtpd.web10.32487.1679917093282325016
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 04:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=EXbUT6FT;
 spf=pass (domain: arm.com, ip: 40.107.6.85, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fn4qniYDoy8iMXNcBXWQXJCe1jNLD9Du3CvTrV2CErk=;
 b=EXbUT6FTjRhZn/tW5JSMTeq6yBvKU2S//Rx0sb073ZlUsUhFsfbrudv++aXA2ujQtkIbfX7/WgyQo5kUWO0I/nRGK300SbsCW2HZ03YYMXYPtALlfQvD9VjDIyBKUkWOSOD9NP3UI5spmhHq2W7acNcFu2UNXDp4L/t3/Kx1+k4=
Received: from AS9PR06CA0023.eurprd06.prod.outlook.com (2603:10a6:20b:462::28)
 by VE1PR08MB5598.eurprd08.prod.outlook.com (2603:10a6:800:1a2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.30; Mon, 27 Mar
 2023 11:38:08 +0000
Received: from AM7EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:462:cafe::26) by AS9PR06CA0023.outlook.office365.com
 (2603:10a6:20b:462::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.42 via Frontend
 Transport; Mon, 27 Mar 2023 11:38:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT048.mail.protection.outlook.com (100.127.140.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.32 via Frontend Transport; Mon, 27 Mar 2023 11:38:08 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136"); Mon, 27 Mar 2023 11:38:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2b5cb15d7149664b
X-CR-MTA-TID: 64aa7808
Received: from 8e323e971651.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 655A1B6F-6118-4BF7-A5C4-0CD5282BA090.1;
	Mon, 27 Mar 2023 11:38:01 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8e323e971651.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 27 Mar 2023 11:38:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JhoXB9o6N3y4eSRs/L7djEmUxpQ89OgCdd425dPrUWUnK5XWZwW5PSj+dBvWpmYB2T9czQ/JOoCAyZDI4d3FtVRUOwsr/Gq5lonXsrQii7y3CHwH/iPKz//vdl3flfp8MtiY/KuRPLQJoT8+gy7sZGMbz6/6In1uJKuzsqc5qI5mQCbNZoEN9mmOcKE4/nOqBUxD94RosoUj0ASn6E9f9+/+DhqUD4DHu8AqB4ea7iHleYeXiYDSsQ2gtEKQocofPV3nBeQNV4zowVakiGG5+2b87AemVi/jr80MjHWb3SzI2QxXRVuW5uw69aBHjpKaxvThc9hmCl02NKSygHWdTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fn4qniYDoy8iMXNcBXWQXJCe1jNLD9Du3CvTrV2CErk=;
 b=VZSZeC2zSpQjxq1PRrXdAqVNKJXpHTmkCF+c4Ap7Nvft9/7CUdFRPKEJbW+ArDcwGBgLycrRvFiPJyQHI4B13/jSC2HnYOyEOGkQDr4oYriLZfy+sM6Y64mdYxyz33mKSU0MwiFzngRFWrcUe0YPI0B9EojUIkQbjHraG7yzqqK1FwMi21EM5b6W0kGqoGgdB9NkSmrc6GR8cYjAXvBwgux+zoNnmPKJtR17QB7/FzmAhEBi/hj6fGM2VwHYT4BKuEflQNsG8trlGV/ckula4W6iTXfxKmgmI5EUp8dY5pxPgBTcK262nC1RDwCPt1b9HcBhL/HEgpg+UZwac7kpkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fn4qniYDoy8iMXNcBXWQXJCe1jNLD9Du3CvTrV2CErk=;
 b=EXbUT6FTjRhZn/tW5JSMTeq6yBvKU2S//Rx0sb073ZlUsUhFsfbrudv++aXA2ujQtkIbfX7/WgyQo5kUWO0I/nRGK300SbsCW2HZ03YYMXYPtALlfQvD9VjDIyBKUkWOSOD9NP3UI5spmhHq2W7acNcFu2UNXDp4L/t3/Kx1+k4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS4PR08MB7556.eurprd08.prod.outlook.com (2603:10a6:20b:4fe::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 11:37:58 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6178.024; Mon, 27 Mar 2023
 11:37:58 +0000
From: Ross Burton <Ross.Burton@arm.com>
CC: Steve Sakoman <steve@sakoman.com>, OE-core
	<openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: Re: [yocto-security] [OE-core] OE-core CVE metrics for master on Sun
 26 Mar 2023 02:00:01 AM HST
Thread-Topic: [yocto-security] [OE-core] OE-core CVE metrics for master on Sun
 26 Mar 2023 02:00:01 AM HST
Thread-Index: AQHZX9sBmBdv3CGAykKgs6YUCgMtG68Oe2WAgAAGAIA=
Date: Mon, 27 Mar 2023 11:37:57 +0000
Message-ID: <FCACAB04-E262-4CC3-8526-273AB897E80E@arm.com>
References: <20230326120317.E1C1F9604A9@nuc.router0800d9.com>
 <5B8F0061-26B1-4B53-ADE8-9ED2B7C528FB@arm.com>
In-Reply-To: <5B8F0061-26B1-4B53-ADE8-9ED2B7C528FB@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS4PR08MB7556:EE_|AM7EUR03FT048:EE_|VE1PR08MB5598:EE_
X-MS-Office365-Filtering-Correlation-Id: db39056c-8b5d-4da5-2e13-08db2eb7bcab
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 H2UNODybtSQR55as+0MAvH2Udg2DqktjrCnWsp1uuIW+js1x6X60SbpIoc883nb3Mk4FhlmxbxdsMQVG6NMdXgpCmnMe26WmV6X0Q5QDX9gpmuilR2pYkgy/M+8AsfPGAOhx51tU/JLrw7WsNhZ3kUQcMWJFI/TM/6jymKYgIvxyVJO1XIBUEa8jO8sDpoTfLBjf3t0G8Z8oaoYFUhPTv1ZDwT3f2fGgw8zZAl/7J7Y8EoAWVDfPQIZwcxlK8U9OIxhDr4VjPOHW2GxqidUiqCN9ywaYT4LJtolef8rxqipsSFyKd8Q4iVW4akXPSmpjVJG8V37TnvReUwtyWRaLSSzVfyoaCj7dLjMI91Yzd1bDRIA1JXOedAHnHq4sDy8OWtmoSLhcVAI/w5JH0eqRKu/a/z+HVPwLVkAj7jz9rG2lIMqsRSWEAGwU61HdaMJvYMMfxBQhUYt0qPfcwShZhssG9+mGyfu0I0ppTYZiiOfzzIwuB5G1QlBpVRwm2Fuh1sbpFoWr5COhRddnkRNzalrykdvbBVBpn2YbU6Iv+qBk605aXKpLMA4unXrnt88rApSt+9Od/gH46f1hEClQ359btSNalzUIdSkh3ajWIhSxG17xsXErgGEU2xXB1Nvk
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(366004)(346002)(376002)(396003)(451199021)(109986019)(66476007)(66946007)(66446008)(64756008)(8676002)(66556008)(76116006)(4326008)(91956017)(316002)(8936002)(5660300002)(4744005)(41300700001)(38100700002)(122000001)(6512007)(186003)(6506007)(54906003)(2616005)(6486002)(966005)(26005)(71200400001)(83380400001)(478600001)(15650500001)(38070700005)(86362001)(33656002)(2906002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <11768CDA1D00B940832DEC905BBEB6B8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7556
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f8e9bba1-26dc-41cb-6e47-08db2eb7b687
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	L9Qqk2WRoLtbJMZE4GUmZ6dkDTHPj5QRhF7dQbNQ6EK35hqA+AreeCSyssoXpCr3yjU3QsbVkTmQQg895/vQN+s6wX7ur2HzUoB5uiZCbznu7J4BHSoKyG+Y0FxwOc/Lzy2lVrEymTkEVOshEkoK8byWIyr2G/TWggv2dhqUIbmXr2oSGwPgixe600VlYxCTFdN8416HmCQYIMf6NkQ5cKDQffsHyXkpDmSfzYDxtIyUg+YJUOTtPZE6/vONDFYb4K96w/ztYZnSCeRZL15bvkPqoGFjZzMSu4QRzvmpRrPEHmg5MU47hOGAO+wINPjw/1L9YyTbG+cYbvTuli2m8gWDINGOerKTUDErbuzUQ7oitLfqHHvIvD9SbW69jjsP+pfNfw1xgNvFy/vC/N3SVv7grYaD86YRdeYmfB9qkIQF5t7s3cc+QH/G+CQsQksrEibxF1IKW3qKZQueOX9F0J+M1pJkQWm3whPgEVD0cAEkIrfiZG9HaHHd/aAJOIIhVDPnglmyo83SVNGkMruo8mgIB6liNDuKVeliVNOfxenT4hhW8BV+JOGPFl2cJOWyvV24COrdnwld7HTwfApiGslQojxwXvMu6hRxB/yZFJUeKFNZsiC1s4YoHD0xmC81XaBU7Z/f5gdEiPdC4idFqQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(39850400004)(346002)(109986019)(451199021)(46966006)(36840700001)(2906002)(15650500001)(83380400001)(36756003)(41300700001)(82740400003)(356005)(81166007)(5660300002)(4744005)(8936002)(82310400005)(33656002)(336012)(40480700001)(86362001)(2616005)(107886003)(54906003)(6506007)(6512007)(26005)(47076005)(316002)(6486002)(966005)(478600001)(36860700001)(186003)(4326008)(8676002)(70586007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 11:38:08.1660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db39056c-8b5d-4da5-2e13-08db2eb7bcab
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5598
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 11:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179156

Pj4gQ1ZFLTIwMjMtMDMzMCAoQ1ZTUzM6IDkuOCBDUklUSUNBTCk6IHFlbXU6cWVtdS1uYXRpdmU6
cWVtdS1zeXN0ZW0tbmF0aXZlIGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0
YWlsP3Z1bG5JZD1DVkUtMjAyMy0wMzMwICoNCj4gDQo+IFZlcnkgbmljaGUgZnJvbSB3aGF0IEkg
Y2FuIHRlbGwsIGJ1dCB0aGUgcGF0Y2ggb24gdGhlIGxpc3QgaXMgc2ltcGxlLCB0ZXN0aW5nIG5v
dy4NCg0KVXBkYXRlOiB0aGVyZeKAmXMgYW4gYWx0ZXJuYXRpdmUgcGF0Y2ggc2VyaWVzIHdoaWNo
IGlzIGxpa2VseSBtZXJnZWQgaW5zdGVhZDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvcWVtdS1k
ZXZlbC8yMDIzMDMyNDExMzcyNS54c25icXZ6bzZyc3pheWpqQG1venouYnUuZWR1Lw0KDQpJIHN1
c3BlY3Qgbm9uZSBvZiBvdXIgbWFjaGluZXMgdXNlIHRoaXMgZGV2aWNlIHNvIHRoaXMgaXNu4oCZ
dCBhbiB1cmdlbnQgZml4Lg0KDQpSb3Nz


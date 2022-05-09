Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97326C433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 11:52:24 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.43])
 by mx.groups.io with SMTP id smtpd.web10.30520.1652097140642630079
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 May 2022 04:52:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=tqnH/e07;
 spf=pass (domain: arm.com, ip: 40.107.8.43, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mdGmrYSuI/WBzCpIlIL17y7ZpeK7xOnRMYizhQkxyBEvGnpRC2ecCbA+JJvncIVGNizxclpQsP2V9qUjgc968NeByM4JBQsPX8VrUNMNFTnpJM8H0jX+/4bbodRj1Wfp7z1z1bhMTtmR8ttZAHgrJHyA5jvdnMPv/GhxBAGjTD2HMzm2ctMFI9oi1X+85hq/NXqNpRScR1bUv7sKjAvoJmFXcYDCHWSMn43WcHKOP15Trrd6F/LpQUXn5Xwm1SWyhqwGTxKnwHo8PrGy/ZMDBZPHzTPmI67FaXZ3HB07y6POq7g24P88aRJZS2Q7PY/89qFwVPGl6moW5i1K1+pC/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ikJA1CgttYSXmjYFXVgcuBqn5ltFG80b18ZPQbc19g=;
 b=MxrEIfapfPrs++Eoldcea6DwLgtB9dTNkiWjbdO4AN7GD8xF6n5tCzQZsu23dHCBUwDfVWSh+S5PG2iYDIk+FIp8JpJUF2vt+e1XDuWSWdcGjby7bPiwKi9YTI9CxsUbfQ+xBDlZv8Yzy1+9eBhkguBU3sEHe1ICFB80Xm4SZhVaRnQmIhkJtXqUodeq/ClaXl+HzoPHX8mmqlfMnRbB0EzBOWbF48Mo1xWofprceKD6iKkTjjYgCwlpBssiAK6WUGrpxMmEoMyvt1f/2czi0O5BDhPjQP7bSnHlKUae9VKTrH/Ej8iG1HF7Kx31OLERx6V9oHFgq3+D2BJR8NTe/g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ikJA1CgttYSXmjYFXVgcuBqn5ltFG80b18ZPQbc19g=;
 b=tqnH/e07yMnaJHLneFzpZ+Zn2jvuZtBbpqL7nVBthhVWBBhFqezO1oSqkXEFILtNYuZI/H/CqBRBjAXtLTLdgjsil2crXFWw3pUOQaYwxOrv8mp8/nlSpWlYb4LHuaGlI9W34OLRoBjuKpKrxi9+zrt0y149xxWPyualEVyqips=
Received: from AS8PR05CA0025.eurprd05.prod.outlook.com (2603:10a6:20b:311::30)
 by AM6PR08MB4278.eurprd08.prod.outlook.com (2603:10a6:20b:71::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Mon, 9 May
 2022 11:52:08 +0000
Received: from AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::be) by AS8PR05CA0025.outlook.office365.com
 (2603:10a6:20b:311::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23 via Frontend
 Transport; Mon, 9 May 2022 11:52:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT022.mail.protection.outlook.com (10.152.16.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Mon, 9 May 2022 11:52:07 +0000
Received: ("Tessian outbound 62985e3c34b6:v118");
 Mon, 09 May 2022 11:52:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 592779555c390ef0
X-CR-MTA-TID: 64aa7808
Received: from 913133cf8ec3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 41F1AAFB-64BC-4F9F-A3A4-00D873E6182F.1;
	Mon, 09 May 2022 11:52:00 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 913133cf8ec3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 09 May 2022 11:52:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=msOpcDm8WC7qSfbKCDPZ9CXPYQV8WGuv/di0UBQjB9HsacGlRjN0Ooh6/kJ8by0kLAq7U8DhN0L5DesbcA2EicxqtCRkRN3lhwC5tF6M3LPV0RYhsWqzZcaxDxUe9bLgrXjnhgdCGpvZeqAOm95ehcZBi1uBdLjQMmKUftbnHJ5BjueIPadl01wL/LpnV2HY9ut0uufibpkIvHbmj07PYyXLxy+nYrakhKwALkHzVBJR32RaD9GdEIzRlKm2kFLOV/LgYZQotnD/FYbbDo8QBAIipNvqPOkil3wdJz2e0sczIyd8hgE7896ZgiddSZsWD1mmgaElw1izZ0R3b5yy3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ikJA1CgttYSXmjYFXVgcuBqn5ltFG80b18ZPQbc19g=;
 b=EfzRyLnDqT2ts4gW5YZBQMc4P324oJdsZ3LBP8/WU49p4ACqnLIpmcz8gp2uDc6vqGUDWouTmGgUygU6WxBK4LXKwzUQwYcC1jMPs/9ssiud8k+A/IyOvNg6QOw/t5KFVYMqV4Autn4R1PVnakH6WPfwU9SH+zCZXtwnoiy0mILk6gaYMre/dlx+pvTUQ79SOMXqsjG5ZyiZOseZs3VAYs0J6nswZVF3vIuahJ1uRECWYzyCOVZxuDVkvbrz5h0HRBe8ZHzFwXpKFsnrQMutos5km6nFHy3sC04hlAifPPBa5Ob6yTnQlvW2d6rOK2uE6dZjXGrzT6q23xQdsAO2Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ikJA1CgttYSXmjYFXVgcuBqn5ltFG80b18ZPQbc19g=;
 b=tqnH/e07yMnaJHLneFzpZ+Zn2jvuZtBbpqL7nVBthhVWBBhFqezO1oSqkXEFILtNYuZI/H/CqBRBjAXtLTLdgjsil2crXFWw3pUOQaYwxOrv8mp8/nlSpWlYb4LHuaGlI9W34OLRoBjuKpKrxi9+zrt0y149xxWPyualEVyqips=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM9PR08MB6915.eurprd08.prod.outlook.com (2603:10a6:20b:30f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Mon, 9 May
 2022 11:51:59 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6c2b:5021:db9a:bf6d]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6c2b:5021:db9a:bf6d%7]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 11:51:59 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
CC: Khem Raj <raj.khem@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] gcc12 testing results
Thread-Topic: [OE-core] gcc12 testing results
Thread-Index: AQHYYVv5udyvabHcREaJniIrv9H+9q0R/MEAgAAHegCABG9tgA==
Date: Mon, 9 May 2022 11:51:59 +0000
Message-ID: <F23D7126-B6EF-430A-B3D4-36979D9A9A1B@arm.com>
References: 
 <0f338ca1e26012b86f183975252e670f11776e99.camel@linuxfoundation.org>
 <CAMKF1srnfLwbEnD=h8MNSa4WXBf8RDJ+x=uqxBfHVb14ARktvg@mail.gmail.com>
 <CADkTA4PLxeGwEau+DC7c=hQdw4Ro4bTz08xtK_YNHk_jO2N_hA@mail.gmail.com>
In-Reply-To: 
 <CADkTA4PLxeGwEau+DC7c=hQdw4Ro4bTz08xtK_YNHk_jO2N_hA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 4bc93b75-ed9d-4dc1-92a2-08da31b25804
x-ms-traffictypediagnostic: 
	AM9PR08MB6915:EE_|AM5EUR03FT022:EE_|AM6PR08MB4278:EE_
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB4278C912EE62F7C21EA29AECE8C69@AM6PR08MB4278.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 mehblDTgGiqhPRDJn2AUVeJJaCnITXl4BHnLH1gclvhq0FqnCvu52IDyNpTRv5p9MINfK4s2RUVCFGCGPTGvDrpehpCW/rZWmNRmmKlNNV6o92QDgKYanTWgjfcPWRiHF5NUKz20H1M/F4RSovAGnfKWlxbrd0a9Z9FHFhZn3tcwwzzW5pL9Jgg3Gec6336Z1qQo2nRBHAyvteDwyIC/Ue05E9h3psDNDKceGTxMH/GP3gZ7xYgRfKCOD1wRGiSKMl9jxbvpclpWz3gJjtpgXrsmHS7Gxk6zD+QQDVQH9TSyWrPyqczos8DpGdU5K6z2aCdlF7LkBm9Tn7rjg6EQHNpL8NAgZYIljkzCKPQ+h/uFci8eawp0wdu3aha/rUBV5z5FZUwZCAt5uCs2irMKp3CWFNWPZjrwVZy6SCLSuwdy47tq2vPCrqZ3yiaaZ7iBOn+vUGuVHN+zCKkH4Xfl/zv4kjHjnAc6kuu5BlGpdBlz4prj0bJIUcANeNNFneJXQxrF/zkwFk6ny77CeUO55zbcUH3GlMd+1A17oiOI2vduQjH0iWVLVt8ksn12CsSg5N1laRdUnYue+Yz5sM3F1uAYM2/X/lUR7m9ibhw1Zh5QmrpG9BZsWGDfarQSeFZT7XueiFxTa6Iuqtobyn+91/degKStt+U8JYcCRVQK32QTmZPUzISfeTDOn8xQmT1XAB31XWh9xD+3in9GGJsfieDcXFzq6vgWA6cuYa1CmHV7CQOp8eOWC+kjFwgemnw4JCRdtrJJwcHMlJDVho4tcAAUFoWaUbR9ns7led4LNuAR2OaUVAlzo+rIIKr+lkUKYVYWK7a7wESww/Heg72jwA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(4326008)(8676002)(76116006)(91956017)(64756008)(2906002)(66476007)(66446008)(66946007)(38100700002)(66556008)(38070700005)(36756003)(33656002)(53546011)(54906003)(508600001)(316002)(6916009)(6506007)(6486002)(71200400001)(966005)(26005)(2616005)(5660300002)(186003)(86362001)(6512007)(122000001)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A86FB834A5BD4644BCD1C00F1B39F8BA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6915
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ef6592ef-eef3-4ba3-0667-08da31b25335
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/ZMiz0DRaDlETnFTvthLfpD5Cp9olcCpLkPX1Kggjn3Sgros0eiI3so1lKjExS+S36FByoW0Gv3q/gDuVbuTa8rvBdNBZza9oOgZYS03wkbwjB7+JUGHrVS5mCvtKwxtl0OnbODoA4Eum0EDYSnRLcSEEsVEqBZZlZNJ8pHIVuIzbcZPjuUBvLNMGiI+/rUKTSQ2+jrMBPR821KYvPwoPfrs5oDa0RAlDMfB0ebPdLYa/GDBGgRzgMioXrLijYKl5Sua94237iZjjqMxu0rzPukZT8D6RNfucCgfwB3oNooAG1+jGKjlRRtpwQ1+o0n8Y38qUURQ63TV2TBRY73eW3yv9otAjmF8oFgtA3RerEowOr+1QH2Xi84nGv6PBcNy5IyuPMlX8PHtJw/JQHMuqf3qit9pZWY6kBBj4hBXBQDztunpofmkcIFbW6EYKVHHWvCXzf5D1Z9z1g/LesEE4FfpxaBVnhSXLveJEA9ulzFClEvsDLFL54f/zL8XpsREU/ziRIpJVkS1jjqNGC8fnLkZcUvGZlGoF/VDMvATU5/mXuo/sdhQZCuOkqq8Gzl87syNC/zoxS5o7HZaVfNDY2dGkKCrWBhVzy1y/t7SVuGIKB96qXXAgNRq2IXtm7SLknMeS8JK9IfyUx7iwn02UEbs3Vr4bY1JxIujo9xBlYcei/Gw/vKh/O3lZBM/s03zbCO/pt/W2tSYKdGqFYU/GOWO9GNqgoo4vQb1Hih4FGSkfKzdCRHTQ60P8/HboB5x6PCk+Z6jiTjopku9aOwYmw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(316002)(6512007)(82310400005)(53546011)(26005)(8676002)(40460700003)(5660300002)(336012)(70206006)(6506007)(70586007)(83380400001)(2616005)(36860700001)(186003)(6862004)(4326008)(47076005)(33656002)(8936002)(81166007)(86362001)(36756003)(966005)(356005)(54906003)(6486002)(508600001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 11:52:07.6451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4bc93b75-ed9d-4dc1-92a2-08da31b25804
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4278
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 May 2022 11:52:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165397

DQo+IE9uIDYgTWF5IDIwMjIsIGF0IDE3OjA4LCBCcnVjZSBBc2hmaWVsZCB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8YnJ1Y2UuYXNoZmllbGQ9Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+IHdyb3RlOg0KPg0KPiBPbiBGcmksIE1heSA2LCAyMDIyIGF0IDExOjQxIEFNIEtoZW0g
UmFqIDxyYWoua2hlbUBnbWFpbC5jb20+IHdyb3RlOg0KPj4NCj4+IHllYWggbWV0YS12aXJ0IGlz
IHNlZW1pbmdseSBhIG5ldyBhZGRpdGlvbi4gQWRkaW5nIEJydWNlIGFsc28gYWJvdXQNCj4+IHRo
ZSBmYWlsdXJlcy4NCj4NCj4gVGhlIFhlbiBndXlzIHdpbGwgaG9wZWZ1bGx5IGdldCBhcm91bmQg
dG8gaXQgc2hvcnRseSwgYnV0IHdlIGFyZSBzdGlsbA0KPiBnb2luZyB0aHJvdWdoIHNpZ25pZmlj
YW50IHdvcmsgdG8gZ2V0IGtpcmtzdG9uZSBzdGFiaWxpemVkIGFuZA0KPiByZWxlYXNlZCBmb3Ig
bWV0YS12aXJ0LCBzbyB0aGVyZSdzIHVubGlrZWx5IHRvIGJlIGFueXRoaW5nIHNwZWNpZmljDQo+
IGRvbmUgb24gaXQgZm9yIGEgYml0IHlldC4NCj4NCj4gSSdtIHN1cmUgWGVuIHVwc3RyZWFtIGhh
cyBhbHJlYWR5IGFkZHJlc3NlZCBpdCwgYnV0IG91ciBYZW4gdXBncmFkZXMNCj4gYXJlIGluIHBs
YWNlIGZvciB0aGUgcmVsZWFzZSAoV2hpY2ggaXMgd2hlcmUgdGhlIHN0YWJpbGl6YXRpb24gZWZm
b3J0DQo+IGlzIGhhcHBlbmluZyksIHNvIHdlIGNhbiBwZWVrIGZvciBpbmNyZW1lbnRhbCBmaXhl
cyBhcyBhcHByb3ByaWF0ZS4NCg0KQXQgbGVhc3QgT3BlblN1c2UgaGFzIGEgd29ya2Fyb3VuZCBw
YXRjaDoNCg0KaHR0cHM6Ly9idWlsZC5vcGVuc3VzZS5vcmcvcGFja2FnZS92aWV3X2ZpbGUvb3Bl
blNVU0U6RmFjdG9yeS94ZW4vZ2NjMTItZml4ZXMucGF0Y2g/ZXhwYW5kPTENCg0KSeKAmW0gcHJl
dHR5IHN1cmUgd2UgY2Fu4oCZdCBleHBlY3QgdG8gc2VlIHRoYXQgdXBzdHJlYW1lZCwgYnV0IGl0
cyBsaWtlbHkgZ29vZCBlbm91Z2ggZm9yIHRoZSBzaG9ydCB0ZXJtLg0KDQpSb3NzDQpJTVBPUlRB
TlQgTk9USUNFOiBUaGUgY29udGVudHMgb2YgdGhpcyBlbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRz
IGFyZSBjb25maWRlbnRpYWwgYW5kIG1heSBhbHNvIGJlIHByaXZpbGVnZWQuIElmIHlvdSBhcmUg
bm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBpbW1l
ZGlhdGVseSBhbmQgZG8gbm90IGRpc2Nsb3NlIHRoZSBjb250ZW50cyB0byBhbnkgb3RoZXIgcGVy
c29uLCB1c2UgaXQgZm9yIGFueSBwdXJwb3NlLCBvciBzdG9yZSBvciBjb3B5IHRoZSBpbmZvcm1h
dGlvbiBpbiBhbnkgbWVkaXVtLiBUaGFuayB5b3UuDQo=


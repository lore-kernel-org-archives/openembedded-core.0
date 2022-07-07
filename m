Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8457C433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 10:03:23 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.56])
 by mx.groups.io with SMTP id smtpd.web09.3741.1657188192788105605
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 03:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=Ltz2fxBt;
 spf=pass (domain: arm.com, ip: 40.107.104.56, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ap0al+RTOu7bfm+Mmj47cvhhU2DgKJsyt/tlbxcPkXMPFq+kzFha2qK6bbTSt3SgnnXdzjVVz0Bt9QQCbigpb63T9HuQqzYfhoW4ePlzu7VyOlc/K02aYohfCdRIdGrtlQEEhy272I+Yn0WqUB8+zRc1hIBk5ymEVs9oIi8z6ROCHvSnqbPfnjm1VioR+htD1aD/ci14qtYitO6mzwaI8+VcIzPydWDvjC4sXhJ2rhjHm06XS7ll7lOw3mH5AZz+sYYLdFx0vnQVI1Zufwj8TuEXZhm9aKacpxG0VELu6sztxvty5ByK4sOdkM5eS9YaT/j9mO98qTTImnCsQem4Iw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rs6lhJYVhEiwJGxRGxP7ZbVz2TZZzEnC0B/E4bC/BHw=;
 b=VimQcdqlBmU1bb9IMZcHpvf9QLlAykdi/fMWnyNfMCYxTEnSYKhRgYTZdm9ZLxDHlgJ8tJgU0t2l5rVTTzk1S9N2vKWHXMas96Eu3OcpD4u5Qn8GhOTPShaQLR7gAMcF28M4IWeCrIprc2GX6sJ9/taLS8GUG1ivkJOI5gzba892TggtJFMRTGpYMkTpDv9SWCJjhd4V6NzB2RS+m2blZ2TlKzyQxSUGXW0UuGnByAls7kMMXSE5KyZfMuj4FKFvBbkusGkt03ZfeOC48vimgFpDJEbFPH6iJ9ZNHEZBNVpc5lI8CGYG1MlDpRc2N0V7Dc13gR8BPY9TlHZOhaUOsA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rs6lhJYVhEiwJGxRGxP7ZbVz2TZZzEnC0B/E4bC/BHw=;
 b=Ltz2fxBtnXtsitSnE0gk3cIbDzLvkXRISFp33rK4eganBesY4Kwa3P05jQg7yhQz+IsJzJBBndXAegvCbCBNNinj1oaqslh5KSlkVf2Bu6CQTYgPN/hSoUR6pUOYbLPQIhTrLThb7qt27GyvZ39XqKPrnpoyyMuYdv2bbBNyJpM=
Received: from DU2PR04CA0224.eurprd04.prod.outlook.com (2603:10a6:10:2b1::19)
 by VI1PR08MB5519.eurprd08.prod.outlook.com (2603:10a6:803:133::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 7 Jul
 2022 10:03:09 +0000
Received: from DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::68) by DU2PR04CA0224.outlook.office365.com
 (2603:10a6:10:2b1::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16 via Frontend
 Transport; Thu, 7 Jul 2022 10:03:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT061.mail.protection.outlook.com (100.127.143.28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Thu, 7 Jul 2022 10:03:09 +0000
Received: ("Tessian outbound e5f49c5d38f9:v122");
 Thu, 07 Jul 2022 10:03:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0024d7951ee4bf07
X-CR-MTA-TID: 64aa7808
Received: from cd2aa322582d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C38F2009-028D-49D2-9B2E-C382CA7F5CBC.1;
	Thu, 07 Jul 2022 10:03:02 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 cd2aa322582d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 07 Jul 2022 10:03:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GeCtoL88wO1KiM9rvkAqx39em8ZDe6bh/+AHmi4oAfJW7yqf6wP+k5RmbMh5dnoXoPra2W9SRJ10xM/2KuCxyFG6/V2wl+BaQnEJ1YBCQr0JjmlrgULyKuCbifdZsJSUK3cenhcMWBufbYzQVL53y40e66U5BwSu8+4MHqQFLk2WIDTRFomMTA3Erk/XnYO6ixo8dA69TkKs4Xi+cNTmf3SagAWRFBpLKhZoucGtEeOsqz9UNntdANs7gBBt3u3FKo/7msjTIOYWJ+HeLt1JlGqzBQIjc3MbDCPAIruv9qiH+p/g+iB/9Nz584pm6x4yyFkpiZxKsZHLgP9slEU3TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rs6lhJYVhEiwJGxRGxP7ZbVz2TZZzEnC0B/E4bC/BHw=;
 b=LjawvSyUjNRFKfKnkm0IVHrK2mPVjiRqNL35WGrLyYORZvWRKG0RCnjpWNge4nQfQxLoNKnwdX4shqa1Lw9YWGsfSDBkePbHk49bE05O8nmBHgerHk5M3nWRHBhVC2e/AoIaBuYrWqftnoKYblFI9K+U5a4JRjqLev/NKDk5zZxKSgtNZ4KCsSwscHTcBXBcs8eJR+zd5ARohRrwj9f2KCZ/mMzhf6UahcZ/OpEWGg4Ny2JzpHVgL7HpSdx5UMYVO0f7BXsPXnrgHirk2u+EcLeG2bCWxpAmWkVCGOsYvYbUziLRhy065D/+LFMF2/NYn4z/LSEPe6iU4EPrA8z25A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rs6lhJYVhEiwJGxRGxP7ZbVz2TZZzEnC0B/E4bC/BHw=;
 b=Ltz2fxBtnXtsitSnE0gk3cIbDzLvkXRISFp33rK4eganBesY4Kwa3P05jQg7yhQz+IsJzJBBndXAegvCbCBNNinj1oaqslh5KSlkVf2Bu6CQTYgPN/hSoUR6pUOYbLPQIhTrLThb7qt27GyvZ39XqKPrnpoyyMuYdv2bbBNyJpM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6568.eurprd08.prod.outlook.com (2603:10a6:20b:338::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Thu, 7 Jul
 2022 10:02:59 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2c4a:b33:a761:a926]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2c4a:b33:a761:a926%2]) with mapi id 15.20.5395.020; Thu, 7 Jul 2022
 10:02:59 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "JPEWhacker@gmail.com" <JPEWhacker@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][RFC] Layer Setup JSON schema and example
Thread-Topic: [OE-core][RFC] Layer Setup JSON schema and example
Thread-Index: AQHYkXI5OEmmUfWjvkWig9qxoeGl661yrpMA
Date: Thu, 7 Jul 2022 10:02:59 +0000
Message-ID: <CAA2FC7D-8003-431C-B856-B8DE9DCDC202@arm.com>
References: <20220706195311.974830-1-JPEWhacker@gmail.com>
In-Reply-To: <20220706195311.974830-1-JPEWhacker@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 8c5a7dd6-3894-482c-5ded-08da5fffe541
x-ms-traffictypediagnostic: 
	AS8PR08MB6568:EE_|DBAEUR03FT061:EE_|VI1PR08MB5519:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 dy1dPsSAoLGQfkoQiTIQjKw97+vH3Tfgw0V3dkKNgO6OnfEdBrYFGXSw3a5NBZIvvSWJRD8R9Z02TvqQG31ystYOWk2qu3lj72ISwO5Jf3TMNrGl8quYenMw9AuhEWbt0Dle+TON4QxnaYrDlIufVX+M221BtAwjeWWcaBDRsJZGBMxmBLAQEiNgfkW9KvsaJostkVuGn+y1FBZ3aN17MzoQTza7alB988JwpGrBZRhY6ZZe1aASgapeKIxzFIa5MQfveyiuwhCEIkGAC+dbtnhFwgUIWLcYjGm/8qJzIA5Jgc4CBrzdTkkv6NV7Cm2Sy0pGRSVc7X/RyE17aHhJkdi4p503LED+ghTfIC2JdWe42G4h6wgchLK4lKN/g9zRgORW8BjR3CM/jZ1Bd6SAc3UQ3tsuwiWDJhCt+mSppvogW2M0TTFsQkTCTpM14IVaLpqANRQmc5obisB176oYPmMoUCP5VrnrpxkaYJmYz9NfJ8d7ptLElpNEHPDAboI857FtiLQ8FhL+EmvqdXeBKn32V+WLGl1HnA0cA9Lw9Jdrzx3orn9SkXcr0vsb/Ix+9NwUgt/2ZBWyGNGNxT+1/R1w90gBFQg17dNpe60a2BLOBr/OWnQaX153lWt7zTUSmNU7jxLYIdovssYCwvPKnm4uPiua40EKNVfmTCGsED2Ntf0DTt7qkQQZlxkvWL6p49xaJqk+ajOuprpqMNY5OkoFBKcytaPBIevm7Qu5SWNzyacg7J2YgkSEvl00AstqN3IwIkKH2Ppnmepa65piICrmiNyVvGJajLY+yAxTc0/ldJHyczlxkJRxoFW6AVYyWaRssLoghAKuUPapmPqMtYv5/vdMygYV+qXM9zKF5Zg=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(39860400002)(366004)(396003)(376002)(64756008)(41300700001)(2906002)(66476007)(478600001)(4326008)(8676002)(91956017)(86362001)(4744005)(66446008)(6486002)(66946007)(8936002)(33656002)(76116006)(66556008)(71200400001)(36756003)(316002)(122000001)(5660300002)(38100700002)(6916009)(186003)(26005)(2616005)(6512007)(83380400001)(53546011)(6506007)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <34D55035C2953C4889E89745AAC58AA8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6568
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b41f3b5b-dc26-464c-c1c3-08da5fffdf8d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RUvsHtDz2SblezAHVpsjNgkVkEfUX2Ydq/ac8MTpaEOlw11QTJP5QC69e6yngUs/ANSHAieNjXdoRjpSlvKhg7R3gtbpppoBhImEV35HRJQMdiLAr9BetTBbsJbBThzEf3m2T2F9o7daJR1WV4o1anu7A+u95z1kXMNZhxR5AQTNRzxCLrfV/KvHBe9lhUpWwcBYsIV8mFNZh/XXiQHzKNmumvlGv2aFEoC/PJChYZxRABO8AGG5XGj4geXXXqpYwCNre3af5ecqSO2puItDkfNUOq7wmruDhLR1JP1Mgsrs5saGOAbQTytpbSQK8aC8EFoTiWSExw2LSk7wkb/CfTUXYdJTgRQmtE8gmqMPhrcUbDFDUhzLOBbD2t0tqqJ9u3vW818CybHpO7qOKeS0N8EUbI2RvFriqRPitfOJCm6TTad3uqkBPBjp9Tp73f25uFY45IB47ROYcnPq1qaAp67NCiLNQNpWtFWWzpW61ccWBlrJpF1TRVGo9LSdHAgJn9XbvtnTKqW2scJQh0uvVnFHMaeXSKZM42aBP+g035jwDIeuWmKU9s5tHOgWXVnygueyC8PUQ9telVx5zIR9iyF0/TSK0zu+WllHeYbAEMIkdquKUNS3OPhuHDLFPQYV/xq+Ve8BzI9LS8ZWnOOKWnVebxbtqGt175aUegeQM35jDkivzXSKguOFBfzxB/GOq8nOooQkIyZTsKZjxJMP9ts9LZ2uilyZsuk+01e7uZKLnym2V/btnG3t0Lwy5U6xc6ztxGBf7l/Jrdmazy8WHQ1HkfguyQKktxS2122/gvQkvtALR7OK6O+avi8pymdd
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(376002)(396003)(346002)(40470700004)(36840700001)(46966006)(6862004)(5660300002)(86362001)(81166007)(8936002)(70206006)(8676002)(36860700001)(82310400005)(70586007)(4744005)(4326008)(356005)(41300700001)(316002)(478600001)(6512007)(47076005)(6486002)(6506007)(36756003)(40460700003)(26005)(2616005)(33656002)(336012)(40480700001)(53546011)(2906002)(186003)(82740400003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 10:03:09.3755
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8c5a7dd6-3894-482c-5ded-08da5fffe541
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5519
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 10:03:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167764

DQoNCj4gT24gNiBKdWwgMjAyMiwgYXQgMjA6NTMsIEpvc2h1YSBXYXR0IHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxKUEVXaGFja2VyPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4NCj4gRGVmaW5lcyBhIGNvbW1vbiBzY2hlbWEgZm9yIGxheWVyIHNldHVwIHRo
YXQgY2FuIGJlIGNvbnN1bWVkIGJ5IHRvb2xzIHRvDQo+IGtub3cgaG93IHRvIGZldGNoIGFuZCBh
c3NlbWJsZSBsYXllcnMgZm9yIGVuZCB1c2Vycy4gQWxzbyBpbmNsdWRlcyBhbg0KPiBleGFtcGxl
IG9mIHRoZSBsYXllciBzZXR1cCB0aGF0IGNvbnN0cnVjdHMgcG9reSBmb3IgcmVmZXJlbmNlLg0K
DQpKU09OIGlzIHRlcnJpYmxlIGZvciBodW1hbnMgdG8gcmVhZCBvciBlZGl0LCBpcyB0aGlzIGlu
dGVuZGVkIHRvIGJlIHB1cmVseSBmb3IgdGhlIG1hY2hpbmUsIG9yIGFyZSBodW1hbnMgbWVhbnQg
dG8gcmVhZCBpdCB0b28/ICBJZiBodW1hbnMgYXJlIG1lYW50IHRvIHdvcmsgb24gdGhlIGZpbGUg
SeKAmWQgcmVhbGx5IHByZWZlciBzb21ldGhpbmcgcmVhZGFibGUgbGlrZSBZQU1MLg0KDQpSb3Nz
DQpJTVBPUlRBTlQgTk9USUNFOiBUaGUgY29udGVudHMgb2YgdGhpcyBlbWFpbCBhbmQgYW55IGF0
dGFjaG1lbnRzIGFyZSBjb25maWRlbnRpYWwgYW5kIG1heSBhbHNvIGJlIHByaXZpbGVnZWQuIElm
IHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBub3RpZnkgdGhlIHNl
bmRlciBpbW1lZGlhdGVseSBhbmQgZG8gbm90IGRpc2Nsb3NlIHRoZSBjb250ZW50cyB0byBhbnkg
b3RoZXIgcGVyc29uLCB1c2UgaXQgZm9yIGFueSBwdXJwb3NlLCBvciBzdG9yZSBvciBjb3B5IHRo
ZSBpbmZvcm1hdGlvbiBpbiBhbnkgbWVkaXVtLiBUaGFuayB5b3UuDQo=


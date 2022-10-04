Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15F36C433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 14:15:38 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.65])
 by mx.groups.io with SMTP id smtpd.web12.11181.1664892936116687443
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 07:15:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=2VSj6jgT;
 spf=pass (domain: arm.com, ip: 40.107.22.65, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=JAl0kleRQnObiMRHRGQ1XZxraoUnWJ7L2uQNZa7YXlQH6Bo5tvGkZhOh3mwVDaAwWZ+M5BRDSeVHWRqorU6UXK6YClHruZ6661bW3JirXNonXiGN7luatkkoOuNyTylxg3pgqaYVUVvikJ7esgvLEupXUOhJBn3l3ABL5ez9MPFPFJnbMT+hNutvYW9YJ6wqZWHvsKwHZz8NabwHKxuF5NOWMjYbSVs/PznI+2BfPq8AS56HN/oKUfBM5XJiGJRAKyFjyA1b3O8+PmI8TKzHGqBg1Iw7NZvt7vp7NHUkBvfBORXUXgbKqK3NAY2zjWQtZxmJRcVfim/USUgzsBSdWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KfU9ARJW/i00euxSn0xzXOZdbg2pTu1TJ2WYiFUnoOI=;
 b=ZcK5hJ9aXJTn4bLKBOR2hiJAJdVKcYL9+f06bodPWSU8zaqiB6ot1BsxIqWwDsA8sYbK7Qr9e0I+i77e1+jLDoMShVyDsJZOLgpDS8YYL3jEfMeWLqji/pxv/Ht8MQ+ei6c9dUIpNUftKuaDzXTlwCUv5HYt2qOc6FdVlkoRjSBgut3hLCyUBJNADe6ccVBg1FKAkLaorXomMi1AqdCKeAB6qVXbYq19wrSsRvpUzA0R2coRfEJtBWppieF2ek1YS0zS3uYx6S712A9HWfhKxh6gcILQhakxgi72IG+bybZeV+rOmSj9/dnwJNr+S1OqPLzi4vHvi5tUZF2M09Xydg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KfU9ARJW/i00euxSn0xzXOZdbg2pTu1TJ2WYiFUnoOI=;
 b=2VSj6jgT3X6qsEUToKb75M0oyraB1Cxo0GiozBeEIIEQkPucMuri1iqYcVqirJppLu06auYv8RbsWMsJLVRInnfep6wuCo+QQw4B7ZDqD4KpElnu4qMt/VhGNRPz+t/MeUVW7B8TK8Ulwz4HCh0NBo9VMKUHWOhAwpQCltcc+Ks=
Received: from AS9P251CA0018.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:50f::16)
 by AS8PR08MB5941.eurprd08.prod.outlook.com (2603:10a6:20b:296::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Tue, 4 Oct
 2022 14:15:32 +0000
Received: from AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:50f:cafe::8d) by AS9P251CA0018.outlook.office365.com
 (2603:10a6:20b:50f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.31 via Frontend
 Transport; Tue, 4 Oct 2022 14:15:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT023.mail.protection.outlook.com (100.127.140.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Tue, 4 Oct 2022 14:15:31 +0000
Received: ("Tessian outbound 86cf7f935b1b:v128");
 Tue, 04 Oct 2022 14:15:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0882f7ff26307ad7
X-CR-MTA-TID: 64aa7808
Received: from a5d6920d027c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9107455F-55D5-480B-AA49-D72F831DED70.1;
	Tue, 04 Oct 2022 14:15:25 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 a5d6920d027c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 04 Oct 2022 14:15:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9fGKsTLvlt701JhGKrz0N9cPABYCiYz9fLFNUw/Ty7NNPYdDFuUKtMZ7oFD+0vPKbijbbypoQFrwnvyyERldgL6yZ3CELjKwow5KNIRt2Xf5G1f788KsBxJMm+qqcrb9KV0jlUEhTHhIIMl9HBDpf9f5xzS0iOTt0r7khicbqsADEctk+Wn4d0BRLsdmugcGOhtomai+N/AcuYddE9qVt/WqFKyWyZdxfngLK5GWqeiSiW33zXE5Op05knq4YaMk4w3PSyAQMpCa38FbH6t+51Ns3k8TLD6AqTDIN3/KT4nAnFQSDpOrEn9xIm5T/V6Byu/tDbvCEPkkOircf1PXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KfU9ARJW/i00euxSn0xzXOZdbg2pTu1TJ2WYiFUnoOI=;
 b=W1mln+l1OtqnpvItJFxRDmdad5p1fgPSprfr/6Y4z8qk39/Nluk5e6JWz79RHEm9fYx1fhOZnpLmYghntBYMnMxXh2B3EHekEYdx+FD7gKFQNw6rNMhOSwQfgTcEHQQiWBeWXtz9+TFoMzrpJ0Q7E91qsGm8hUvLeQR2zWTVRKuF83E4PZIgUmu1SCzYHiSY8IvkfnRS8ME105L4b/E5h+/fdB1EW0Kyogs5vaBHZmEUTjidRC1lCw5N+eHAGUCsCUD42Du11X1dGa/+PtssAlHvZmcXhuUML/2Z5cHEV/Ak0e2UCbbV7evUs1ojqZqFJtjVah8+3DsTFDi7IWypgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KfU9ARJW/i00euxSn0xzXOZdbg2pTu1TJ2WYiFUnoOI=;
 b=2VSj6jgT3X6qsEUToKb75M0oyraB1Cxo0GiozBeEIIEQkPucMuri1iqYcVqirJppLu06auYv8RbsWMsJLVRInnfep6wuCo+QQw4B7ZDqD4KpElnu4qMt/VhGNRPz+t/MeUVW7B8TK8Ulwz4HCh0NBo9VMKUHWOhAwpQCltcc+Ks=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6726.eurprd08.prod.outlook.com (2603:10a6:20b:39a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Tue, 4 Oct
 2022 14:15:23 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%5]) with mapi id 15.20.5676.028; Tue, 4 Oct 2022
 14:15:23 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 4/5] piglit: upgrade to latest revision
Thread-Topic: [OE-core] [PATCH 4/5] piglit: upgrade to latest revision
Thread-Index: AQHY199RIXHHolBKkkSnsd2ruLPGFq3+PN6AgAAA3wCAAAgfAIAAAeGA
Date: Tue, 4 Oct 2022 14:15:23 +0000
Message-ID: <1551A249-DD59-4B04-A5A8-6233143DCC69@arm.com>
References: <20221004105106.1556357-1-ross.burton@arm.com>
 <20221004105106.1556357-4-ross.burton@arm.com>
 <CAMKF1sqk1eK0RVhQtj6WjYi4n=WrBfkP5VmgpZUdp=18dHsmgg@mail.gmail.com>
 <720037DF-9057-48C4-B5FA-D5BDE584A240@arm.com>
 <CAMKF1soNXOp6ZXDihRPw1qTzG8p01bqHfo+m4R6LO1TjL-96cA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soNXOp6ZXDihRPw1qTzG8p01bqHfo+m4R6LO1TjL-96cA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6726:EE_|AM7EUR03FT023:EE_|AS8PR08MB5941:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eb13a01-8cb8-40b7-e166-08daa612e5bf
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 f+d1Qhi0g4wndFkPoz/NsgnV2VSxI3QxezP12HHTxWGnifPShqdIe3/6IJDjIuGy2z2bAJWa0t8Lbh52OQRjC6yWrqsQ2miWpBT3S1UaxTOk+xse8yZdqKj5O8mpMTgz/tf8HRg53MIBrqwGtAAXDfC9b03IGvgizVmObMjUYcI7bzcQqqo6rQ4qhAJid2ex7GniWmsPLKXWtjKe/fDkL2BJpNLTUNjNILzN+cIWia7P2S0d66H8+VEODMs3eSM9WI+pvw9QHNdS9IC7xcOwvAGjvZPb5ZNhtmlc7CUMsTBavb/WRAJ3B3JeV0ytDaLAGjA3+WNjvYQ4ET3hEqY0/2vAR07IT/yx1q0gk2OxkIHzBnyrEXUimvCMSoXUbF++3XBS2hVSDuxaqIdeoNxIfWRS9gtk9KrMalKrnKqe7NfdP1hGQHXaRbF+o+btrzB7ATa7ofvF2aEpp0XEy3udx94ofQLGrvlxWFY0FwW30GAUQvhxwzsQUto+sHxoNQmYbiPa8e64IhKyQUTp2E5fx8N8qy8YWFMUkU2ikcsQJqbkMJcJ1cIFLm12QGJBMrOCOHxzc73pAN9mOrftjcXQlnHBVdQiFwtM1iUJMC99WVAYyUwLYvy6q7o+Cn3g+3HbacTb4JR7jkq2szZP4iWc675zok+D+im0QebgoNEvGRmc1JJ5O99dcKp8kYTFIBLa5EmicEL5Czz9XQ7VyMY7XmiPdLzilKAa5dczqH2TKig1WiRutyBTaF8HXDuaCOjfuryj5FWa4de8RfIkHWZPyc/utPanVG9rug689SXNIM4=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199015)(4744005)(86362001)(38100700002)(38070700005)(186003)(122000001)(8936002)(6916009)(71200400001)(41300700001)(5660300002)(8676002)(76116006)(66946007)(66556008)(66476007)(66446008)(4326008)(64756008)(91956017)(53546011)(26005)(6512007)(6506007)(2616005)(33656002)(316002)(2906002)(478600001)(6486002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB18F6BE1D0118448AE5B8BD4CA5F687@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6726
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	29f5e073-6e30-42da-ba29-08daa612e0ce
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5Xvj3inpMN1kszQ6TXr24SWi6ZLQqRZVK9sfhTVGfCNWF5RP2Fbhpb8etyK5SLd+ahVydUDeCzK1ZgoiGrOdFckA5lbxpFxoKpJnABwVJl98ZjbEX0s0OxqOeVG4/TNXPppJ5T26QHVgApmLzKnltkdJrQkap6+DatQS0tmAB8hVhLuO/vKxIjAeqZOfoc5kFrTxWc83ER+Qqi8t6AHMMGMOCN/hAuGIxkKWl486SYkshICZnbhCgCNQj/KhMa5F39AFxZzXvR3Uz/NXdG0bqEwZGTq+QZWOz6JtBafPZBKpftFIP6fKHrKarvQFN8xmq2oE7uVlHjxXifkGBHdziXKlZ/7FMaLe5hR4/Ajoo8eKNweDu4NT/s0ifBxqfhGY5Fx+hWhB+/tkaehUnsMfoQeH5rm9dynLBYJ79u7bwvNSxSOFcewyT6OccIGeoj+8ZiW4muPW8YMX6ctwtzE73vCaa/a/nkT38qZTHZSuwFuNFBBG2omM4ZkDnAY8RRo9RO24j0EedK7ukOp/OSPoz7OAFoxkvW/7fjbhBr3A8ksZYaHOjTCVL6EORoC1gXzzc1kwe6QjfZPopcEgxAsWoqXz+WKfrpcDvDmK+Ei5+fO8xXzxrY0OQyIDW5e47Eefx32vVQYEyG8d159gsjS1S1ckd62upFVWwakIx3Qe8OFt5OacHx3jqT1Za2eAhhzrSQYQ+tIkLh0WNh4GKwxenJw6mRARdQ1WKuu6Z5kCyE0r2/QbTHIU4ItEGDw53MCA19SxHxJkYTsNrGBpTCCaBw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199015)(46966006)(36840700001)(40470700004)(2616005)(186003)(47076005)(81166007)(336012)(82740400003)(356005)(4744005)(5660300002)(2906002)(8936002)(82310400005)(6862004)(40480700001)(40460700003)(6486002)(6506007)(26005)(6512007)(478600001)(53546011)(316002)(4326008)(8676002)(70206006)(70586007)(36860700001)(41300700001)(36756003)(33656002)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 14:15:31.9901
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1eb13a01-8cb8-40b7-e166-08daa612e5bf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5941
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 14:15:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171398

T24gNCBPY3QgMjAyMiwgYXQgMTU6MDgsIEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+IHdy
b3RlOg0KPiANCj4gT24gVHVlLCBPY3QgNCwgMjAyMiBhdCA2OjM5IEFNIFJvc3MgQnVydG9uIDxS
b3NzLkJ1cnRvbkBhcm0uY29tPiB3cm90ZToNCj4+IA0KPj4gT24gNCBPY3QgMjAyMiwgYXQgMTQ6
MzYsIEtoZW0gUmFqIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxyYWoua2hlbT1nbWFpbC5j
b21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+Pj4gSG93IGRvZXMgZGVidWdnaW5n
IHBpZ2xldCBsb29rcyBsaWtlIGFmdGVyIHRoaXMgY2hhbmdlID8gSSB3b25kZXIgaWYgd2UgY2Fu
IHJlZHVjZSBkZWJ1ZyBpbmZvIGJ5DQo+Pj4gVXNpbmcgc29tZXRoaW5nIGxpa2UgLWcxIG1heWJl
IGEgZ29vZCBtaWRkbGUgZ3JvdW5kDQo+PiANCj4+IFRoZSBiaW5hcmllcyBoYXZlIGJlZW4gc3Ry
aXBwZWQgc2luY2UgMjAxNiwgdGhpcyBjaGFuZ2Ugc2ltcGx5IHN0b3BzIGRvX3BhY2thZ2UgZnJv
bSB0cnlpbmcgdG8gc3BsaXQvc3RyaXAgdGhlIGRlYnVnIHN5bWJvbHMuICBUaGVyZeKAmXMgMkdC
IG9mIGFscmVhZHktc3RyaXBwZWQgYmluYXJpZXMgdG8gcHJvY2Vzcywgd2hpY2ggb24gbXkgbWFj
aGluZSB0YWtlcyBvdmVyIGEgbWludXRlLg0KPiANCj4geWVhaCB1bmRlcnN0b29kLCBJIHdhcyB0
cnlpbmcgdG8gc2VlIGlmIHdlIGNhbiBtYWtlIGl0IG9wdGltaXplIGEgYml0DQo+IHdoaWxlIHlv
dSB3ZXJlIGhlcmUuDQoNClR1cm5pbmcgb24gYW55IGZvcm0gb2YgZGVidWcgd291bGQgbWFrZSB0
aGF0IDJHQiBtb3JlIGxpa2UgM0dC4oCmDQoNClJvc3M=


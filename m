Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20377C54E58
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 11:15:52 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.89])
 by mx.groups.io with SMTP id smtpd.web11.41231.1710933349387642185
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 04:15:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=IhbBZLvs;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=IhbBZLvs;
 spf=pass (domain: arm.com, ip: 40.107.8.89, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=IuCGPE14EDEhO3/dxRqdQam+b5Anvxiwj/A6lp354C+T9VHVm8T8RSM9BRAAMVkpXfgH/LdPAx8n3RlVbZMDMl3IYQ5uLI7NaWyuInRPrI9JUEtMC+KcED3UyrGPgqGwlHGykTcos4F/a62yl5+I7z/veg95Vxjm8RfVMJeOxQayiawaKNn32YQXZY3xnP178fjxKdd6sc7stuUSTb5NRKO0PyL0cKC+7Xa8UerxuBQ2HBSAVXHxDpvHzh0YYrlvQmtZiGMo89uoJAeucQkNKHF83TjIs3TAlWf3CqcXYlAem2YkCfoFrqbC4BvjAJJwkN5eXtjfdIxLzvcK2TL2yA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KAe+DMhwPu7PpTFNl28j9YiOc81w3OBuaj8tCgMjLQU=;
 b=f81EQ5I4puZ6fveF3tEssmvw4P9rud8w3yoM5k+IHU8AS2hOM5T3G6APByp0+D530l0W8WGUNarsGK7SH38zM0Gh0wAxfVB9+lhr/Dih5LdRhHJV9eDHOpiiBDXy5bHqMv7E4xXoJBZU4/P7nI8a5vgDD5GNLcBbhBI8+Q7hJ6aM6ADSyzcDTrxHSapKZ+hRPWB3T8bX12kItE8D+B5I0ptcZqBd2X8P2/KraEnkOBZ2sn0S4CY01Sp+9wZc/3JIWgblESB8eyTlkTV9bYzcIRdTjVyUwHFkkBteHtvU57qth9nrb21F9FVSi5lkHaWmnWFwaYGwRyY6cnI+IdOdww==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAe+DMhwPu7PpTFNl28j9YiOc81w3OBuaj8tCgMjLQU=;
 b=IhbBZLvsgU4Row4Ajk+X5AOBaXELV3g75zY/YE8jexnnzsHcmsnxq/uvotsu/bpKvjagG37jpyFnwutqeaq4C6JSsdRC361YbyrlzkpdxNM5dcALBhEIZ0D37w6BuAk9Q//jwHDIq1So0+9C4tuFj/n8bfrNYJSpo/9EnJBDIJI=
Received: from AM7PR02CA0027.eurprd02.prod.outlook.com (2603:10a6:20b:100::37)
 by DB4PR08MB8102.eurprd08.prod.outlook.com (2603:10a6:10:386::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.28; Wed, 20 Mar
 2024 11:15:45 +0000
Received: from AM4PEPF00027A60.eurprd04.prod.outlook.com
 (2603:10a6:20b:100:cafe::40) by AM7PR02CA0027.outlook.office365.com
 (2603:10a6:20b:100::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26 via Frontend
 Transport; Wed, 20 Mar 2024 11:15:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A60.mail.protection.outlook.com (10.167.16.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.10 via Frontend Transport; Wed, 20 Mar 2024 11:15:45 +0000
Received: ("Tessian outbound dc0a9029eb2c:v300"); Wed, 20 Mar 2024 11:15:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0c7931db11a81b40
X-CR-MTA-TID: 64aa7808
Received: from fb8eedcb61cc.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8CADE101-9E3D-4C73-AF95-CDB1DAC96735.1;
	Wed, 20 Mar 2024 11:15:38 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fb8eedcb61cc.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 20 Mar 2024 11:15:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ARcJyoqqma7Ns3V8+QQ0DGwmHA4EqjH3LnZJDxPvaZ2ZQmFzabCv6WT8TnRlueQzjaRycslJo+5tcsXW1p4MdbJuY2fGf2jAuuX2XXydhT/snlgNYLjozVf/t9jxtlhGB53AyA5TPl2t8xZgm3DJdWx6tyI1nvUyGhbojpuxkefk2j5WpI769mpPml/2ykdHCUMNA7Tsyty3TKD0KtdsCnkLx6ITCFT7YWLq9elIvan5ZztC2T3eRuOyNRHFHWfDXyyq8z6OtiwcpxAdqilD8g63ayazGUt71ffVSv6wCzq3DxAqnoEv3BAg1eQrRt+AKA4V1vUa+ziwHLsm0mj1Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KAe+DMhwPu7PpTFNl28j9YiOc81w3OBuaj8tCgMjLQU=;
 b=JZDSHv+eTj8xroGITo0nior6pHfsLJUA69brzq528QH3jkpBO0T/XKoL243eGcL6XXBcP24QE1nrFnxlN5QxSN/3+bAkHVb78+GdPkT2DnqOyaCR3YqR0AEfVPK/AtBAdmD9uEhbw6IChRSxsxFPhdmGtzTeOokgcNPHtF2icA7LSYoypqoA8/heqLB2KYZtk60TA7ldk7g/jDQJke4ArVp8ZKA7XzY1JXK/nD0/XTOKlB8lIuNJYTDPNUfDNCc1u8lrASwZnuDqdfgLYey9hUxYyjjonqZ2+kt2GoxhWGf4aHJ6Or6PYQm25ermqjBpOCyBfvrDinkhTPl/Do3Tpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAe+DMhwPu7PpTFNl28j9YiOc81w3OBuaj8tCgMjLQU=;
 b=IhbBZLvsgU4Row4Ajk+X5AOBaXELV3g75zY/YE8jexnnzsHcmsnxq/uvotsu/bpKvjagG37jpyFnwutqeaq4C6JSsdRC361YbyrlzkpdxNM5dcALBhEIZ0D37w6BuAk9Q//jwHDIq1So0+9C4tuFj/n8bfrNYJSpo/9EnJBDIJI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB10315.eurprd08.prod.outlook.com (2603:10a6:20b:5bd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Wed, 20 Mar
 2024 11:15:35 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228%5]) with mapi id 15.20.7386.025; Wed, 20 Mar 2024
 11:15:35 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "f_l_k@t-online.de" <f_l_k@t-online.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][RFC][PATCHv2] glib-2.0: update 2.78.4 -> 2.80.0
Thread-Topic: [oe-core][RFC][PATCHv2] glib-2.0: update 2.78.4 -> 2.80.0
Thread-Index: AQHaerNjPT3JZuGKwk6VYrs32pEDxLFAemcA
Date: Wed, 20 Mar 2024 11:15:35 +0000
Message-ID: <70D06732-17CB-4BF3-A35C-96C684E011E2@arm.com>
References: <20240320104300.757486-1-f_l_k@t-online.de>
In-Reply-To: <20240320104300.757486-1-f_l_k@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB10315:EE_|AM4PEPF00027A60:EE_|DB4PR08MB8102:EE_
X-MS-Office365-Filtering-Correlation-Id: 118cff47-7267-45c8-4caf-08dc48cf1663
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ZQCsbwZaHBl5ChjNlT+YxwlWSiDvhb+ZfAuNWZxjiZdl4VqNvvHGCdCfi4KBwxkuqfCrsh0ICavfPiYmnvlZr1myYzoUbgG/xJiUN+HsKcENbtEzUEWIFEiaufdyhx8CJsTtMWLueEFmk0Jhq+6EgmsdYNLxYKk1O5MVezqb8xzsbtWFYHoQC2UocnslDamzcJxEKAkwKkXqOGLRuQRm/jkdzy4NaSno01YP1C+4khOlWRYRH3Rpzbg+WvsH91NFRa/O1ISXJtN4DtaJZU7AM5eX3NkcddFYAMo1/qBHmaA9SOt0jyhkWT4eKCrb0A3QITuAfBwp8yoOErpmzBvCbLW0ZitXO3m6DX9BnsK+9Arkk5MZiqDgSqpD3Er7fd4Ghkpic6xZ4lHyATAf4ER5LuTlcultmYZ6fSGHDts/y1LWXEa+7kHqtYlFhWLhDIuDIPOkaBrxN4A8TonMgxnNnNAZpgM3cFeCWO0PCdGJ0cSDktT7D2pLoMCdVgGBP/oCgXObJqCMXblEUR0EvY3LLD6nZ+RYpTf40Uawks+kEkPa5AdDZHFK6WWGQaa2jP/9GP+N1LFu/xKF5GDXgPuCEUN0aKQjFVyU73vN6WLbgeLB2LtbSSPJ5DnhCeBc0PvS1bl8kK5as6BtSL2OPqxR7HCk+RRryGSVkEgX/X1pzI0Zo1La6sJyAGDr06q70mzzkDArsCmnUFwdmkRbLPQ2RQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <05863FF39DC29A42A1DE4B91516E28C2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10315
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	11eaf8a0-a239-4d1c-1f3a-08dc48cf10d1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OQ+DZJb+CCInj6frs6IYvValhJrnrOndeSQO20ZaSeS+eTUrY1rzExSbreZu7WCdDDOBx4PsiMv/ykBSe7pdsiWh1cG0qtQhIFaLAin/49vKpYgyIcG8+c/ap2DhIXab5i4KguFjl8J+Gf0xQALW8c/WjsOE0vRsaWm54mtHO93Yvmr+8ZMWfvy6tdDXyImod88MePUk4ljkM+EsiZCbG9KvNffgntPujhP5xiN/9g6Ck5BYw5Ohv0dRcbNqt2gA0LKDyi2lplsI4p3HvZGBdV1a5PVnp7aadlk+i7wh8cyH0BuRq9Z4f4Y9vcQjXm40DEXgADR/jVtSCIIZ8KRuhNyXBPCDK6dCNIaJkoM5nILptLv4dC0OwGWwGu23Psr8QAE0GSqJJmrGtybTSA54u/1v6mGaxA+JAQ+db7461mShopWeuY/MV9cLzAgv1DM7w3eolMrKoUXxU3wu2y4f/0M+iX/r1bbgyLlZSp2oKBtV3//r54kadfhvKNxh2scVM/6i8M0x4PuCWQUMN8XcF+A70DuZOlPfk1wCvvBxJ81yNzd4LnjKUry7zGpU9o8v/tVgnVubQ4CLXztt1Gkeimf2orX0tvr7Ea/aPEnp9CVpcQPJJ70CcIPXdVtmQPFQdIP0OHqlQ6rVh/arOwrYO1hPjKVT9422HeumbyoliL8X4SQWbgQRy15VKqfOosMigNAHRatvKvOuBrANBPM1hrZ410WEO8ZC2kzisRiySyb5xxIhTw7It4UDT8tnOdu7
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 11:15:45.0179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 118cff47-7267-45c8-4caf-08dc48cf1663
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A60.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8102
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 11:15:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197357

QXJlIHlvdSB0ZXN0aW5nIHdpdGggZ29iamVjdC1pbnRyb3NwZWN0aW9uPyAgIFRoZSBBUEkgZG9j
cyBkb24ndCB1c2UgZ3RrLWRvYyBlaXRoZXIgYW55bW9yZS4NCg0KSeKAmXZlIGEgV0lQIGJyYW5j
aCBhdCBwb2t5LWNvbnRyaWI6cm9zcy9nbGliMjgwLCB0aGlzIHVwZ3JhZGUgaXMgbGVzcyB0aGFu
IHRyaXZpYWwuDQoNCih0aGUgYnJhbmNoIGRlc3BlcmF0ZWx5IG5lZWRzIHJlYmFzaW5nIGFuZCBz
cXVhc2hpbmcgc29tZXdoYXQsIGFuZCBHLUkgaXMgc3RpbGwgdXR0ZXJseSBicm9rZW4pDQoNClJv
c3M=


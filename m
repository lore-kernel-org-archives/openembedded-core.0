Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6AD5C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 11:48:09 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.52])
 by mx.groups.io with SMTP id smtpd.web11.97486.1701776885206964953
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 03:48:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=UydcyKCp;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=UydcyKCp;
 spf=pass (domain: arm.com, ip: 40.107.20.52, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ITGFUxqQfH1l3AjmtQzG26h/jY4HIlMGt/Qglzwaqj5Ac7jygfGszZ0PxbodJOwxpXrRphIfQiGmyVhNt1TATddT4qgWIhthKttS9FyffRobe9uaLAmDwLFWdvZM2B/srRMTj5FtbeUy59++WHOSjEoh+XI0uzoA79NVazqepTdIBmwHZN6HvR17uxqKu9A7unw1fNFxIeRhR8SsGLjDnzePrZ6Ny3GElrLfCcMobe28y8viONCo4KiGi8aTMDMXCIeYp2Wc4VeHGR62p215lYIsjeCbpfSHJhirzdm8+M408Ii/herY/RVLE5iDqPhWYfMQFo15Ek+jhZmuTNUcdw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SaPBUBeNeKRJ+kYHftYqOYIMUbuYwuhOCnr6/n+QL9g=;
 b=YBDTYPrLyBTYPfu9FaanZ5vaeU0Y8V6HnyqfmyvTgNyr0H2rBnxwqiYrmbwcIbzx343ybUybMG4GbrTU6jkcDHX0dgVb2/rxlw59G11/JsvsIemMN0I0yIXf4omxtBJTVRM+iWhh2vEmvG/8eRhpQOQR9m5ByGqeYGxBZVb0QymsSLRfDRKGoprkeYkT+HNPUnDjgqjEJOhePKPc0wJKLctUVPGS2I6IgwtJGptKH87CH3Owbe0X+1f780rKJZNqRr8AYdC+y8n7pkTgeNpR9mUzAvcoVxVUYLy4dhEbntfydACbFuI/BWHU4BCO8rNAhu8XgecQBkJfvx052SNxvw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SaPBUBeNeKRJ+kYHftYqOYIMUbuYwuhOCnr6/n+QL9g=;
 b=UydcyKCpdJydJ3mdsr4LYY51ODSOkf7LyEL1AzvAi3jKIqJicoHOpYrlEq6HOjPC/ynLEDE2Y036V6YVyc7UB+PFzRYRvCcbyI5DbZeF/jySA28W3udFVWWiXQ28Efn0GmHmvX79ZAm5prH2TzZqcjdWqOchcKD5nlVl0PPIwDs=
Received: from DU2PR04CA0085.eurprd04.prod.outlook.com (2603:10a6:10:232::30)
 by GV1PR08MB10371.eurprd08.prod.outlook.com (2603:10a6:150:8a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 11:48:01 +0000
Received: from DU6PEPF00009525.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::b2) by DU2PR04CA0085.outlook.office365.com
 (2603:10a6:10:232::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.32 via Frontend
 Transport; Tue, 5 Dec 2023 11:48:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF00009525.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.20 via Frontend Transport; Tue, 5 Dec 2023 11:48:01 +0000
Received: ("Tessian outbound 26ee1d40577c:v228"); Tue, 05 Dec 2023 11:48:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 12266b4f6ed2f94c
X-CR-MTA-TID: 64aa7808
Received: from 07c246afd151.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7DDAB04D-3298-460D-8CAD-5044C793B7FA.1;
	Tue, 05 Dec 2023 11:47:54 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 07c246afd151.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 05 Dec 2023 11:47:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=es6YfyZpnJjzOsrGR0yfXakMMrT8+sB1gUu63uuttzBHKc4xOtY8FkZPgG9zkY69YFACcylFUUyqFcILnKzzpBc/DcAKkqSj81Jef9z92hbU2KKmNsOg2lCbdqcggg20wrci2xp4mc2A0ES/X95zw6B4iwVovGugdOz2kiu2v678o7HkcMAdJf5zp1JYevEWWY8MLnM/w2tDJvpno7GdLjPzt/klaj+SzUVJdrBM5IqSnWizVov0DQL6Piav2aGmFYht7yGg4FH+mm3uriQxuUDJgC8EA46kgIfrQE2Y9MXQ1bVtiqTx2CKjeI2zrHZnM9Gt5dWBobf0/XPfHkAMlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SaPBUBeNeKRJ+kYHftYqOYIMUbuYwuhOCnr6/n+QL9g=;
 b=aDXd3mBcguJuhER22K8lERcWyba95KNqvc8ld3aIauTs9NA0e7U1DAOsb79HvjALwt77Q19i0HhVoCSNXidM/nwsEhJeXHRVzt3PUGIIscgHyXYId4dgbRhu2b2OO29HADh9w2SY1CN+qSOPI3nOzUP5gOi4k2YhLFynN7JkzMxw6c8Hc/PT0qJy7XXDddAhNvmf84bWwof1qQNVh4yw1mNzr0615NLFyhspPoqK7JgHj/rgui0dqEvs3EvZyzqeK9G75ZUSrozwLLnbfSB3sls9ToN1Embv222xPj/5hm5lWekxBktWAPjk1W2eBmN2xz71kXVfab81rrM8tyoOzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SaPBUBeNeKRJ+kYHftYqOYIMUbuYwuhOCnr6/n+QL9g=;
 b=UydcyKCpdJydJ3mdsr4LYY51ODSOkf7LyEL1AzvAi3jKIqJicoHOpYrlEq6HOjPC/ynLEDE2Y036V6YVyc7UB+PFzRYRvCcbyI5DbZeF/jySA28W3udFVWWiXQ28Efn0GmHmvX79ZAm5prH2TzZqcjdWqOchcKD5nlVl0PPIwDs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS4PR08MB7602.eurprd08.prod.outlook.com (2603:10a6:20b:4cc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Tue, 5 Dec
 2023 11:47:53 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7046.034; Tue, 5 Dec 2023
 11:47:53 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Changqing Li <changqing.li@eng.windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] libxcrypt.inc: use alternatives to resolve
 crypt.3 conflict
Thread-Topic: [OE-core] [PATCH] libxcrypt.inc: use alternatives to resolve
 crypt.3 conflict
Thread-Index: AQHaJxxpIntGDBt9a0+HfX59vCdzTrCak3wA
Date: Tue, 5 Dec 2023 11:47:53 +0000
Message-ID: <D76589A2-EA11-423F-8C77-283FB96BD89D@arm.com>
References: <20231205014155.3991250-1-changqing.li@windriver.com>
In-Reply-To: <20231205014155.3991250-1-changqing.li@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS4PR08MB7602:EE_|DU6PEPF00009525:EE_|GV1PR08MB10371:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c0f894e-e981-4b4c-6286-08dbf58808a4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 VpbHCmTjDqKikYAy0CTWwdBsIGv36gHUBHez/1Uu5BiFYdBojD6azw52EcTdOlVEYE41sdFrHxnE1ThzDk9NDf7/ZIWtQrHa3tFO5zxCunRBk1iRoC6JEm3lpW1xC2lUGdXvxCY6gNE8dW6PH+KdAGKY7WKsdMMqvWOuBcUCfzf9iaUvzsLibW4R3CGz/I3ngBmIeStue7Y1f3lMAykCUf1xzjuqPuAEYeRbgl7767bu6n63+1/TZHiE1HtTtwVcB5BQjP4BCsyEp3ltrn+vRCkjNrFXCJRVJUKWM6yt2VwLdv1uTrG21ftkK+N3YyejOP3FQPqNQu++f0L32VLrlpNmLuvFdnvLRqgAEzWB0BgXkZsMsUp7RIRs9brVxlgi3/oyFw6XKBNRAJdmId0BxoZV8WjnpAIoBq/2Fqe7qKUlo29llwzCQyjvb8PVeyEprEUjG/ojIj8qEZUXwaO1DV+ophuV1M0RD/4JU6Dq0Y/KK56WHHiI6nruwAg4NC5QJ2/z8pmzxcQMHeXJrw/6QUBn6nQpUpNnf2GMRYXDiR6UXhF2B1TdYaRYfVK7JpuyE8AORtqZsAlncyuxWod5ONhT+f04kgp6EKF7esrhWBcuTb424TvJvjYt+5OrBs87A2gVaTHu69E2CbQ31yOz8Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(376002)(396003)(366004)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(4744005)(2906002)(33656002)(316002)(91956017)(66446008)(66556008)(6916009)(64756008)(66476007)(38070700009)(76116006)(86362001)(66946007)(8676002)(41300700001)(36756003)(4326008)(8936002)(5660300002)(38100700002)(122000001)(6486002)(478600001)(26005)(71200400001)(2616005)(6512007)(53546011)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E93B6E251889864594E511C637E0F476@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7602
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8422942b-429a-4739-4207-08dbf58803e8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VR0YkYw+Um/Z/MTt3kxAzxfiYUoF9qj5xpka62eNIpgHVMDDYaBziCFhll7+xbSWK+sFvlN92kfR8wIJ19rUcPzTDaEWIEMRJd+9ESWPjgbf5cg+ZSiJa6WbfwA5j5l6dQOM4gWRFFyCdWXu+6iSA7/D55icNyMxnvg6TeQbwmt3RDElmg/DMsXOhFXoYhjOYdxS6ruRHH/ydDBsRxBXkUQc1ocYkM/veVk10lGxOUhhxcRq2RAY+ACseiTUmf8tAYMKpldGkWkcgMa4g00e3Vt3XaFEp2Dhlh1LO36j3IzMBVjnwYKkzB8qOzAbFZh/G9dn9FM2/hhw8Bgqlg9b4N9YKK+ARO//ILnBQsAOOxc18D7VVXOdJ17vqUQnn9HXFlYriLXOSMxt6NHCoOfXNQW21RKVvMETkYIpmmKIay0a/0prj9AfwbV+ppGgEuhEyO7LIJWtqp/u7+Xj1hwHBnuQ26oeuU0eDKJqNuyP0QT21cE3TidCA4DC47zhRDlMQLtHcNu1t3+UcD9PkFjd5eNyrCwHQO6dVIWt6UdcdzMHBaxGuGOE724Mr0pnYkFG3N2JS5JVnq0trh7i9Bt0vqOoGS7zn8SN8wdd6hGIo4VJTqoKm+0kI5iyHLsrUdvo1+FxquEHDsxjkjmUKNDfRNFzXaGRekAnkSdgT/2mIEiCJRz0xMxGWXO2ZPCXlwCwBaIA6oaVcWrNH0M49ipAzreC47RDy9fRtWvv8OIWkmw=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(39860400002)(376002)(396003)(230922051799003)(451199024)(1800799012)(186009)(82310400011)(64100799003)(40470700004)(46966006)(36840700001)(2906002)(4744005)(6486002)(40460700003)(478600001)(8936002)(8676002)(6862004)(4326008)(86362001)(70206006)(70586007)(316002)(5660300002)(47076005)(36860700001)(356005)(81166007)(26005)(82740400003)(40480700001)(33656002)(336012)(36756003)(41300700001)(2616005)(6512007)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 11:48:01.2405
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c0f894e-e981-4b4c-6286-08dbf58808a4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10371
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 11:48:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191816

T24gNSBEZWMgMjAyMywgYXQgMDE6NDEsIENoYW5ncWluZyBMaSB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8Y2hhbmdxaW5nLmxpPWVuZy53aW5kcml2ZXIuY29tQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+IHdyb3RlOg0KPiANCj4gRnJvbTogQ2hhbmdxaW5nIExpIDxjaGFuZ3FpbmcubGlAd2lu
ZHJpdmVyLmNvbT4NCj4gDQo+IFRvIGZpeDoNCj4gDQo+IEVycm9yOiBUcmFuc2FjdGlvbiB0ZXN0
IGVycm9yOg0KPiAgZmlsZSAvdXNyL3NoYXJlL21hbi9tYW4zL2NyeXB0LjMgZnJvbSBpbnN0YWxs
IG9mDQo+ICBsaWJjcnlwdC1kb2MtNC40LjMzLXIwLng4Nl82NCBjb25mbGljdHMgd2l0aCBmaWxl
IGZyb20gcGFja2FnZQ0KPiAgbWFuLXBhZ2VzLTYuMDQtcjAueDg2XzY0DQoNClRoaXMgZmVlbHMg
bGlrZSB0aGUgd3Jvbmcgc29sdXRpb24uICBJdCBmZWVscyBsaWtlIG9uZSBvZiB0aGVzZSBwYWNr
YWdlcyBoYXMgdGhlIOKAnGJldHRlcuKAnSBkb2N1bWVudGF0aW9uIGFuZCB0aGF0IHNob3VsZCBi
ZSB0aGUgb25lIHRoYXQgc2hpcHMgdGhlIGRvY3VtZW50YXRpb24uDQoNClJvc3M=


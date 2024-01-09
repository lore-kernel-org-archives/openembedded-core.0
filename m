Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D10C46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 16:33:51 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.57])
 by mx.groups.io with SMTP id smtpd.web11.21174.1704818028135585088
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jan 2024 08:33:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=QzbhlY8J;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=QzbhlY8J;
 spf=pass (domain: arm.com, ip: 40.107.21.57, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=GhnSYUBNx9I62UvLbcnHrzJTOpIvoiaNCTOD7Fpq7jF7pa/qjOhTXo2CquAzkDUePbEbj9ZU/K8SZ0Nrnf155OrvfSJvqpwvE26bylMRsA0nmaSgGdr6lJT0SSzH1xtGtsFsfECqv8WvBzAGU85zWKCOmUz3jndr2GM6jbhN9VFliY92MckcM+P80RO7ISNR9cMpjpWs7GgemTwHCJzzQascWnPVXyls3Qm+0V0eBCtV5X0fIKOM3anERFKQpLPGvmN5LJVH0KVCvghPyElqTsogTS3dsJihwM8EypFZknIAHLO6RCSDVkRNRxavBeSQgt73bXqTLLaPRBaQdHCRLw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkY5skp8aHIEXsZMJyt82nmKIDisHG9DdyvI2T8U4/s=;
 b=Xo3Y3PLmohXh3I3YalqrVZUJMAjcB4MD6Mza/cpAfWLkiUslghiW3W6BjndkpwHk8nvNU8KcWeRXPAhW4CWkMDQ2sKuQspxWuGJwixS+UtN3kFDRc3E6rb8Gh2436dEVor9NHe3LkI7UcQ0jA16u+n6bF22WDWmNJPv3X8JlKkLoOjUuliqDWwt7gjx2hYRO8zAQF8PTM0ciJK2GeV6NYwZbeu1PsImr+yfo35eqSXhAMmjrZ3Ks7Mdu/1lxvmT4XIno41mVTnfgljHoZQFsBcAXhAfVWNga0vV0wswTouZJB1Uv2J3Ym5uXS7Ept+9GVLG1I76Dua14W9jEE25Zag==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkY5skp8aHIEXsZMJyt82nmKIDisHG9DdyvI2T8U4/s=;
 b=QzbhlY8JdJ3RYcrJ87bS+6FB38DWuHNODhai40o/8uFC1YR4YN/3RB3uBp2vggLS/hniUPpxJe4C9WbOUfYejEzXMjIXMmRqm7eK2vZarXAjsNXPZ1ESEGsPys3KoZRuSxvBuJ44QmWhGXuFo/850IMLGrbQuZGxX5uZ4IrjJsM=
Received: from DUZPR01CA0324.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::29) by DB9PR08MB9682.eurprd08.prod.outlook.com
 (2603:10a6:10:462::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 16:33:42 +0000
Received: from DU6PEPF00009527.eurprd02.prod.outlook.com
 (2603:10a6:10:4ba:cafe::d5) by DUZPR01CA0324.outlook.office365.com
 (2603:10a6:10:4ba::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23 via Frontend
 Transport; Tue, 9 Jan 2024 16:33:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF00009527.mail.protection.outlook.com (10.167.8.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7181.14 via Frontend Transport; Tue, 9 Jan 2024 16:33:42 +0000
Received: ("Tessian outbound 9bee66383d2d:v239"); Tue, 09 Jan 2024 16:33:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 950d566fe1fba036
X-CR-MTA-TID: 64aa7808
Received: from 1544ba561c53.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 827D934C-34E5-48A4-AC72-FCFE369E5666.1;
	Tue, 09 Jan 2024 16:33:35 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1544ba561c53.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 09 Jan 2024 16:33:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dxzsVUfpI0XxDxns1kA/1kbDhJ2bepavapVIG8uOWFPxALIDY7/oBaJfa1n02W3aJkHUjuxmgFlsCfyG6LJGbEzwjV4oTk/aJXpBuJfa62IJ/0Mr+uWZP2eL2sH++uGc71AfNIofbyi7NnpRXl3rDdeLLAyeH1rDdMSOjYxP8+8aK871tUmEtRG3nXUkSn4/aIcaNlEMsyd6XXFZsw7BHj60lxM3+00toF0xVaoBlgg0L9gxQefpgKJQXPuPUNjRfMdIYGAc9xUZTOgBpzb6blVGoQN2ItJN7ibNmx+jbVkWbobP3O7Lin4lQUM1gnkhpdVNGp1JwmryyW1y7FBwGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkY5skp8aHIEXsZMJyt82nmKIDisHG9DdyvI2T8U4/s=;
 b=Du4gr4hBsgBGqyRvzmUGUf1Wp0oShC4JKjbfGCx8e96cLa84mulT1o8sX/58efpKv0O5X+ASgYZGTnxjghckfZqfEsUrrX8VTA9X5vxPLv3bawanZ3QvaR8ifyo9kTv2zxGLkhG6gZOAInVk26zkfsPNjrvPYpDtIWnE5sFn1+9Y+y8hXxA3pg/P9bBcyxD7GmxmrKzLYfqvJ6Pl9yNB0jUZWjT39KNDAiLrCi3jXHZYpr37h7hi6yflzoj4jncIqXO/yX7K6DC5+1eaewtm5qs4y5qfhHMANUWqpYkYGZsKnpzxgkb2PltPMuKj3mLW6IZpuT6xfr65rnaGaHmctg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkY5skp8aHIEXsZMJyt82nmKIDisHG9DdyvI2T8U4/s=;
 b=QzbhlY8JdJ3RYcrJ87bS+6FB38DWuHNODhai40o/8uFC1YR4YN/3RB3uBp2vggLS/hniUPpxJe4C9WbOUfYejEzXMjIXMmRqm7eK2vZarXAjsNXPZ1ESEGsPys3KoZRuSxvBuJ44QmWhGXuFo/850IMLGrbQuZGxX5uZ4IrjJsM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB7393.eurprd08.prod.outlook.com (2603:10a6:102:2bd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Tue, 9 Jan
 2024 16:33:30 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 16:33:30 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] glib-networking: Fix ptest failures with
 openssl backend
Thread-Topic: [OE-core] [PATCH] glib-networking: Fix ptest failures with
 openssl backend
Thread-Index: AQHaNQAFFl0k3Asme0io/Ko1wR+UW7DRvmQAgAAFPACAAAV8AA==
Date: Tue, 9 Jan 2024 16:33:30 +0000
Message-ID: <B452371D-F3B7-4E14-9CA8-4E934D05BAC3@arm.com>
References: <20231222175452.3796386-1-raj.khem@gmail.com>
 <CFDEB1DE-ACAF-4175-8BF5-8FD59AFC2110@arm.com>
 <CAMKF1srWfX8ohAJZ0nAV9i7HjWkyb-hLUAn-wh1bbJ17_uyXFA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srWfX8ohAJZ0nAV9i7HjWkyb-hLUAn-wh1bbJ17_uyXFA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAXPR08MB7393:EE_|DU6PEPF00009527:EE_|DB9PR08MB9682:EE_
X-MS-Office365-Filtering-Correlation-Id: 00a09fd5-0d97-4d8e-96c0-08dc1130be0a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 4Nugkuypnjsmd8DGWbpwAITO5VwzLW4SJJ+I/MDCh34NxziqgC3SjSWvBo7UlAO6Nmwobp0O6upToP+N6kY5UNvnKMQ7caUYEM/r1+4k7SJLoDKePOhfyzFzbEZqa7IcFF4xbfCC5fIM56NTAwmvj+1DmnweziqkE6X0bbZ1fdAZ2pYu/UAdSIzxiSTeZC2i5Virg29HofKLJ/igJoX5IIT50J5CwlnkiYFLmKQkhJSqH/g/wEaMsMs1Mz1/trItt6bIZDlLBMflznBa1Y/CcWjiYPGBHfa097rN0kDVqyaMIyx078Ew+G96lFd+iBkIxO4sRX9f5idDYfPvnmjwIIlMh5b/96QQJtA6YikQGaKiKL0tClF6hWznuhAGU2qIK0v+jySvCuOnurM4CkQidpwGIG7QseHmcNmqfE3MFhSbU4+ggtZV9Ds1itCdyi8CuvzAeRu2XnPwMlHgvg3Tq0dpTowmftJf1gFKkZzMftuIiEV3ZbgPF8/yOrkIezNRK5R/vVUQIVu4//VvToF0HwvtYFzw3YWg91aiCVJ4kJ8pGpU48UYa7K92IJHmC71gUZVVqoGT8wZ96hdMuoBERusx8usgcyKsp+d+buRg+uUokdQDc3aqlkm7FiKcv7IcTFcwhsR/zPJt1u5ZcYxJqQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(366004)(39860400002)(346002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(4744005)(38100700002)(2906002)(6486002)(2616005)(91956017)(66476007)(76116006)(66556008)(64756008)(38070700009)(66446008)(66946007)(41300700001)(122000001)(33656002)(86362001)(4326008)(5660300002)(36756003)(26005)(6916009)(316002)(53546011)(6506007)(6512007)(71200400001)(83380400001)(478600001)(8936002)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C95A7461507C14287CBEF27AB86E735@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7393
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7ea86a28-8e35-43c3-0047-08dc1130b717
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	t/nws49sTSMlviApiWRVz7RZEhcNcNSJwPhOqDvy2tAO3596zY7l2qLntUi5Ri/JoeCPGQJKRJChb/lRO+3uiXOmu6zAyuydLWQTiBV2lGKbgxVP0XDCULas1cQaKS4KnBzZg0WFB2MacL+DDb7vquoVaj8uKaqkEMLuGCYT8JbU3Q83cnTi1fhOssYKAHNyWZug66RL7zgFOJA28y8LN5K9vwCzHBjivaK5WcUzghfB4O+Hq7ViEEynND59gS4bgvyvtpNyAxpJoJRLOKK/hp4Z8nLt8mpcEjrt2hfDtQTrzt/oPvduaaFbuCYcEwI3O787Yvp6bAtvbwV75jRF5+PyEpb8hbKHGtVolJV7+KE4c28y7BekTvSzWGxn1mE382dcorppAtT9XiEXklmBtzuj9ySn3NptGwCMSyr42pFm1RGwl4/AtmwBOvzBQmZqB0gLmLPaOQg62OFKShZe682AbUxP2LEZsicwA+j6s8pihMOYM6wvu8PADMk6wdclXUksiCXtcrqr0k0M3I7W9r5aD3Uqy+xgvtumf0eZboePzC7kfjs7im2hMJAQ7ttvIqXkARwyx51ScsbWNp/jYb/Xrty1RkYGIc3mVgiNaSjuKuSHqlCnh6mMQRniZxbg9YIwQtINIa8f7OPY1Du4yvGFzomMka4YiybPgzZ9Df2yE53V0U8qPmodY5Cm8fr3GS9Gh4wWYq9efIorGQRBylXUTiqizYDptf4A4sGCpOhKkrJiSUZAePeTo09osA5j
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(39860400002)(396003)(230922051799003)(451199024)(64100799003)(82310400011)(186009)(1800799012)(46966006)(36840700001)(40470700004)(83380400001)(26005)(53546011)(6506007)(6512007)(336012)(2616005)(36860700001)(82740400003)(47076005)(4326008)(8676002)(8936002)(6862004)(5660300002)(4744005)(2906002)(6486002)(478600001)(316002)(70586007)(41300700001)(70206006)(356005)(33656002)(81166007)(36756003)(86362001)(40480700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 16:33:42.4078
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00a09fd5-0d97-4d8e-96c0-08dc1130be0a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9682
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 16:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193469

T24gOSBKYW4gMjAyNCwgYXQgMTY6MTMsIEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+IHdy
b3RlOg0KPiANCj4gT24gVHVlLCBKYW4gOSwgMjAyNCBhdCA3OjU14oCvQU0gUm9zcyBCdXJ0b24g
PFJvc3MuQnVydG9uQGFybS5jb20+IHdyb3RlOg0KPj4gDQo+PiBPbiAyMiBEZWMgMjAyMywgYXQg
MTc6NTQsIEtoZW0gUmFqIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxyYWoua2hlbT1nbWFp
bC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+Pj4gK1NSQ19VUkkgKz0gImZp
bGU6Ly9lYWdhaW4ucGF0Y2ggXA0KPj4+ICsgICAgICAgICAgICBmaWxlOi8vMDAwMS10ZXN0cy1E
aXNhYmxlLXRlc3RfdW5jbGVhbl9jbG9zZV9ieV9zZXJ2ZXIucGF0Y2ggXA0KPj4gDQo+PiBBcyB0
aGlzIG9ubHkgYWZmZWN0cyBidWlsZHMgd2l0aCBvcGVuc3NsLCBzaG91bGQgd2UgYXBwbHkgdGhl
IHBhdGNoIGluIG9uIG9wZW5zc2wgYnVpbGRzPw0KPj4gDQo+IA0KPiBpcyBpdCBlbmFibGVkIHRv
IHJ1biB3aGVuIHVzaW5nIG90aGVyIGJhY2tlbmRzID8NCg0KVGhhdCB0ZXN0IGRvZXNu4oCZdCBh
cHBlYXIgdG8gYmUgZ3VhcmRlZCB0byBvbmx5IHJ1biBvbiBvcGVuc3NsLCBzbyBpdCBwYXNzZXMg
d2l0aCBnbnV0bHMuDQoNCkZXSVcsIGl04oCZcyByZWNvbW1lbmRlZCB0byB1c2UgZ251dGxzIHVu
bGVzcyB5b3UgaGF2ZSBpbmNyZWRpYmx5IGdvb2QgcmVhc29ucywgdGhlIG9wZW5zc2wgYmFja2Vu
ZCBfaXNfIGJyb2tlbi4NCg0KUm9zcw==


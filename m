Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 202B2EE14C5
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 18:07:14 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.82])
 by mx.groups.io with SMTP id smtpd.web10.6074.1694023624585474689
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 11:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Ww5cnwqI;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Ww5cnwqI;
 spf=pass (domain: arm.com, ip: 40.107.8.82, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLAX9R4XiM3Ikg5JdKB4CliBoJqUreticBE9i32mpYs=;
 b=Ww5cnwqI4aCRNk+DjJZ0uuHA/G/LOUeZF94YrVEFtQFIYY7FxC8G8rcmcj3vDPv0SaSbgHeDzsLqgdIy/U5tW7YhIJuCQRe9ANrjzXnyNHmDey1NSYHDffhTE0VfTFqjiGy1MqAVKrPgiGjoacOgOvpxj5lsEvTbH6AY1pUKLqM=
Received: from AS9P194CA0003.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::12)
 by AS1PR08MB7586.eurprd08.prod.outlook.com (2603:10a6:20b:472::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 18:07:00 +0000
Received: from AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46d:cafe::7d) by AS9P194CA0003.outlook.office365.com
 (2603:10a6:20b:46d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34 via Frontend
 Transport; Wed, 6 Sep 2023 18:07:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT020.mail.protection.outlook.com (100.127.140.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.28 via Frontend Transport; Wed, 6 Sep 2023 18:07:00 +0000
Received: ("Tessian outbound 1eb4e931b055:v175"); Wed, 06 Sep 2023 18:07:00 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 370d14a79a5ecc70
X-CR-MTA-TID: 64aa7808
Received: from ab8a0d6dcd70.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 131B6405-9933-47AA-85A5-CF267D5D3B59.1;
	Wed, 06 Sep 2023 18:06:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ab8a0d6dcd70.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 06 Sep 2023 18:06:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XRFkbnlu5LIno7knPKrRLzRLDjmc3jpkBr4X9qZbd98p3xd3/vE4yl2xRCqRuZHcxhNej69Wza8fpaPbO52o38XQhBtOVSDaip7/kydENpck1y0vaiuUiMnoSpdjsLzPHwsqHOJ7l21kpup6vXpVADoRBOeD50wB8WOEQHfFqAvIoVeGSrJSQSZOzJeyBUEnYIzhkeRvlR1fPg10UoTrzbXNLPaFp9nROj341qVm8t3WDU5HwuubMUlKsvlpiFQe2tw9CffoXVnYAypCWGO3aUc8yyUhkzO0iqOtmUur7Cp363IE/Oy7TXZ2LKMx6ovO2OprwDT65B+0rzMCbQRIdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLAX9R4XiM3Ikg5JdKB4CliBoJqUreticBE9i32mpYs=;
 b=NzoljtXWjFIWZVB9GQwPVUSJb0B+jTLvbNw3XVo4DGiZvFQmN384bOtZVPyzi9L+eSEH1dHSg+CtTGtT1/6Y8oNbQTmsAQR6OcAXjsh26u+wAXk3QGYryQ/XP6K+i8VkyLG21FHzNprXSQCAFqPXc/9CuyfVvndrRKcjYoEmthvBV1OMAmUyU/LUTdp2co2lN2Ve5RHnFdPmRvNkCG1J3rHXBxpLWKe24L9GJxO9YSPIvIkj4YcEARSskld67ibMhYAXiwG92yHNfpLbm0debB8a3UoJ2pPDlIoZZJA1lG0u0Qt6HdAxY72+Kve2T4X2NtiAeXGBgFVOuqlTuD7Q/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLAX9R4XiM3Ikg5JdKB4CliBoJqUreticBE9i32mpYs=;
 b=Ww5cnwqI4aCRNk+DjJZ0uuHA/G/LOUeZF94YrVEFtQFIYY7FxC8G8rcmcj3vDPv0SaSbgHeDzsLqgdIy/U5tW7YhIJuCQRe9ANrjzXnyNHmDey1NSYHDffhTE0VfTFqjiGy1MqAVKrPgiGjoacOgOvpxj5lsEvTbH6AY1pUKLqM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB3PR08MB8796.eurprd08.prod.outlook.com (2603:10a6:10:433::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 18:06:50 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 18:06:50 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, nd <nd@arm.com>
Subject: Re: [OE-core] [PATCH] glib-2.0: explicitly enable strlcpy()
Thread-Topic: [OE-core] [PATCH] glib-2.0: explicitly enable strlcpy()
Thread-Index: AQHZ4NSjMTK9X12mvUKyFYjMdgXIVrAODhgAgAAKAwA=
Date: Wed, 6 Sep 2023 18:06:50 +0000
Message-ID: <65C77DD9-C7AA-407A-A023-80DF7A62D483@arm.com>
References: <20230906151247.312252-1-ross.burton@arm.com>
 <CAMKF1sqCfbe25rBAR97etyoYtMNMowPiB1EK3HzhVT2O15b=Kg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqCfbe25rBAR97etyoYtMNMowPiB1EK3HzhVT2O15b=Kg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB3PR08MB8796:EE_|AM7EUR03FT020:EE_|AS1PR08MB7586:EE_
X-MS-Office365-Filtering-Correlation-Id: 582717f5-821a-40c6-1ae1-08dbaf041143
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 cJmtiazYUkk/67kHcrjHubfp+g7dPMFmmE5QsXu1qKo64OYn0475jmSN2JpdhXjm8aXLKUQqw1VxSXkCpOy9TSvfVOuJyR1COjgqE5p2CK8NDmyZaKkhXD6tIWadivOTs4Oiwhsq1veQDj0IsWShuM+K/fYKefATuuhn24qfghCZ2AQRR5kWftBQbDg8YciCRpJhqy1GZmDxWy2iVfP/SiLeR7519Irb+8wBfool3cCmUuEtk+c5UbeaJBy+L5Mgemj2KsAn6ut+Hj6mealCW9Gdlt8Ag90ajrF3Lw8RPoUCHBZA2mZqkrI03kMHyIX/0ZGafTEvtLlNRIqk+2jGVbOhdzHWfoekikErGNiGDkotuz9cX+kQEMtw0QnnTfYOEHL6wRaQedo2Gg8IH6jTkvOaksm5Xx/pXr/ntR7NTURyAE1KqPNDF3eLAEFogBAwqvNn5yu1tzvBZnoueHIfkWnpsEP/E9JeCBlNUX0r8lWCcHPJS1xW8m9nfphJ/HOuO07Zj9YWzxa20ch6koFB4o4IRHvNL1ZwhyBaGIFTxGicxdtKb568RiNS/mtiJEc1ZZ2NRQGKgIVwFAdFSNHRfpYzKB95XesQq3ohzhGuX1XwIiy0wA+SqxbQa5kVsu2M6ObeAW5k4aeI9wFbfTQhsQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(396003)(366004)(376002)(1800799009)(186009)(451199024)(122000001)(71200400001)(6506007)(6486002)(53546011)(6512007)(478600001)(2616005)(26005)(2906002)(66476007)(54906003)(4744005)(6916009)(66556008)(66446008)(66946007)(8676002)(64756008)(91956017)(76116006)(41300700001)(4326008)(316002)(5660300002)(8936002)(36756003)(33656002)(86362001)(38100700002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D861ACC4E17B7A4D9E3724037CB4FAA3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8796
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f3e87804-660b-4d4c-cc5c-08dbaf040b23
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oaEvaVOlReVs3uRnV0cfwxc6eiyBvPZXFWNwM7Oj44pLzyu+pJMgF1pks1kfCZdHLXjQVt+N4ATEMQUD/qNkN28oH7KYUp34Cj6pSrdbhHvmMeoAbG68nO33mc8XHimnLEWctrfxOabSWlXQ+/82KOjUDO34cEfdR2jlHNVRSbbelhdsh6e1zcm0vSxqMQ341hsKvQOd7sHTiGk4a+lyxtKz3VLTAhgnM2dyOOhDLXpYIc/is1EQEpUQc1TgEPlnZ0mylz/3V3s4uocQqc6saIBCNfXAz1xWGlO94vLhQfsy0JYGe9Q4raHLoCGZnMsGmsswSy/HaY4pSvOn+yV5CItKL9SFui9kkd29Qr/sQ7uxYzku+/Bib+X9AW1okvWeVUIXcetHB87OGTPFYeksmgCZCilj4YaL6WPiCa2IAUmZHs5K/TEChKVHjUXs+qm2aDyLTsSjkdm41ejqsSmyZt7FjTvGPkCW6eISY5w017XohGI6w1FW/6npg+cXkS91b33vV+yQww7oHfR9Q+GzJX1a4pV1eOKNbG+ASAzSBsEcg2qqD8tTg6yNIpn6IDN5IURncUOc/upZpod/PrO60upjOVS+JouYZY6WW/JOyV4ZUuLj3c2ul2rtuGxa+kww5dMcD4CS6kKVqlIXDBbbDcZm2i6PoZTd5NzUQAcW5CN4nGDtIxuD7TFePyFKBSlavRDm+Ux2HJcaaj2B5NRuQZOwOnGYwuTsvW1LqXWVt5M=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(39860400002)(376002)(136003)(1800799009)(82310400011)(186009)(451199024)(40470700004)(46966006)(36840700001)(36860700001)(40480700001)(86362001)(33656002)(36756003)(82740400003)(40460700003)(81166007)(356005)(478600001)(2906002)(53546011)(6512007)(6506007)(6862004)(6486002)(8676002)(8936002)(4326008)(5660300002)(4744005)(41300700001)(54906003)(316002)(47076005)(70586007)(70206006)(26005)(2616005)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 18:07:00.6772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 582717f5-821a-40c6-1ae1-08dbaf041143
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7586
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 18:07:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187341

T24gNiBTZXAgMjAyMywgYXQgMTg6MzAsIEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+IHdy
b3RlOg0KPiANCj4gT24gV2VkLCBTZXAgNiwgMjAyMyBhdCA4OjEy4oCvQU0gUm9zcyBCdXJ0b24g
PHJvc3MuYnVydG9uQGFybS5jb20+IHdyb3RlOg0KPj4gDQo+PiBGcm9tOiBSb3NzIEJ1cnRvbiA8
cm9zcy5idXJ0b25AYXJtLmNvbT4NCj4+IA0KPj4gV2UgaGF2ZSBnbGliYyAyLjM4IHdoaWNoIGFk
ZGVkIHN0cmxjcHkoKSwgc28gZW5hYmxlIHRoZSB1c2Ugb2YgaXQNCj4+IGV4cGxpY2l0bHkgaW4g
dGhlIE1lc29uIGNyb3NzIGZpbGUgZm9yIHdoZW4gdGhlIHRhcmdldCBkb2Vzbid0IHN1cHBvcnQN
Cj4+IHFlbXUtdXNlcm1vZGUgKHdoaWNoIHdpbGwgcmVzdWx0IGluIHRoZSBkZWZhdWx0IG9mIG5v
dCB1c2luZyBpdCkuDQo+IA0KPiB3aWxsIHRoaXMgYmUgZWZmZWN0aXZlIGZvciBub24tdGFyZ2V0
IHZhcmlhbnRzIHRvbyA/IEluIHRoYXQgY2FzZSB3ZQ0KPiBtYXkgbm90IGhhdmUNCj4gZ2xpYmMg
Mi4zOCBvbiBhbGwgZGlzdHJvcyB5ZXQuDQoNClRoZSBleHRyYSBjcm9zcyBmaWxlIGxvZ2ljIGlz
IG5vdCB1c2VkIGluIG5hdGl2ZSBidWlsZHMuDQoNClJvc3M=


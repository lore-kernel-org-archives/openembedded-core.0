Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45651C77B75
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 10:16:39 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.83])
 by mx.groups.io with SMTP id smtpd.web10.18319.1684836996158120329
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 May 2023 03:16:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Quh6pbfk;
 spf=pass (domain: arm.com, ip: 40.107.6.83, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1mre0Y2sHw22oCNn6zEexNm991OeQvAFKLFfAjCtBnM=;
 b=Quh6pbfkvVTgLFXJN2C3Za1DWpT88yQi9896pz7Nr2eRfVf1lqu5C3qZz8G+Bov/iEiSFzIY+afmYHEqdOXDgJ27GLwbLstZjuj/9PI0beQ29FHyX2ss/q/v7gV52YP/wopu8Uv5+IV4L//WemSNj1HjkjurDK7YSE1l1MrINUE=
Received: from DBBPR09CA0046.eurprd09.prod.outlook.com (2603:10a6:10:d4::34)
 by DU0PR08MB7691.eurprd08.prod.outlook.com (2603:10a6:10:3a5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 10:16:28 +0000
Received: from DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::59) by DBBPR09CA0046.outlook.office365.com
 (2603:10a6:10:d4::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29 via Frontend
 Transport; Tue, 23 May 2023 10:16:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT058.mail.protection.outlook.com (100.127.142.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.14 via Frontend Transport; Tue, 23 May 2023 10:16:28 +0000
Received: ("Tessian outbound 8b05220b4215:v136"); Tue, 23 May 2023 10:16:28 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4b2f74dfb52e2cf9
X-CR-MTA-TID: 64aa7808
Received: from 83da63c899cc.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 355D24C8-5E2C-4857-9E9D-469DB9E6CCBD.1;
	Tue, 23 May 2023 10:16:21 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 83da63c899cc.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 23 May 2023 10:16:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nc2LacwyZFQ52B/yykqBcmOm+qBpm+btWYMkse8l6POF7bYkTsCpzTfZVgft0Bio59SMjtfywIo631eRjkStVKE8ETdSRiRqzDk4ntkwSNTYG2lzF1DFrhoDgJQ0x34qYQti03Ga+F5MUKhknzesNNiFcxkvzRtdFYnjYyZJeXipmKJwfraSAS0fAc1nr9DAqlHdHxTLxoPH6jcQTy4AcO5HUGKG/39nQpP14qXkGCRhqQOeF79MCFNjHpQCoYNKce1Lp1hOuGGyAVftiS27QcPWVdeOvb8sYtYoTIRyy27TcrlRZ0BY5PeG5SmUQcjk71eA/GUQLEkg7sJxLF6Tlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1mre0Y2sHw22oCNn6zEexNm991OeQvAFKLFfAjCtBnM=;
 b=NC0+NuPUuLcgE5mwmB7uCwPsF3unLgf/zYO4HWvfIJmBv9mCqCaj5+KYj/fOrwgWAllU7uIdGu4iLLSUU8FKyZBl9gny9a2KWaeabHc0S0YWPWwM0/h1TCkR68ExtFio+uZGAZ7hSdlUTu/f/pOWb8TNVIOWaGLUeKj+H7vCGscc0JJWbH5wK7W7J/QTnzych0xH0KuHOLE4wZTyENb/58ZkMRmfl3+7W0IwJ1QEeRKxQph8d7TDDKrRSAXmRh1FrnH3W959cO4C/F1KmcrMk2zFvTFlYmGdevdTsmCP+u4N33XkQwMmBSYtyupIVO37iUWIatJZE04HVa4YG/ASNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1mre0Y2sHw22oCNn6zEexNm991OeQvAFKLFfAjCtBnM=;
 b=Quh6pbfkvVTgLFXJN2C3Za1DWpT88yQi9896pz7Nr2eRfVf1lqu5C3qZz8G+Bov/iEiSFzIY+afmYHEqdOXDgJ27GLwbLstZjuj/9PI0beQ29FHyX2ss/q/v7gV52YP/wopu8Uv5+IV4L//WemSNj1HjkjurDK7YSE1l1MrINUE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB10347.eurprd08.prod.outlook.com (2603:10a6:20b:57f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 10:16:18 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 10:16:18 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, Markus Volk
	<f_l_k@t-online.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 5/8] Remove usage of /var/volatile/tmp
Thread-Topic: [OE-core] [PATCH 5/8] Remove usage of /var/volatile/tmp
Thread-Index: AQHZjNKxgGfMqoMILUS67yDOTI9SJq9njgGAgAADmQCAABPtgA==
Date: Tue, 23 May 2023 10:16:18 +0000
Message-ID: <120CEE6E-6835-467C-9A0B-20960B333984@arm.com>
References: <20230522172503.1651374-1-alex@linutronix.de>
 <20230522172503.1651374-5-alex@linutronix.de>
 <CBE8C9FE-27D0-437F-8CCF-5F13C0DBFE3B@arm.com>
 <CANNYZj9V73Dd0hTquGLNn1W_A0oDF52eMQE124D5UWZWMF_zDg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9V73Dd0hTquGLNn1W_A0oDF52eMQE124D5UWZWMF_zDg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB10347:EE_|DBAEUR03FT058:EE_|DU0PR08MB7691:EE_
X-MS-Office365-Filtering-Correlation-Id: b9c00355-63d0-46b1-ba99-08db5b76c59f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 /ketRWHB8Ie2OCnZyc6OF/EpiKT0jY5/yaWX4+vCVRxG+CJvzHf5SmNNWqy0kPMP+Fxv1oTHFq8EEZTuLo58os7yHxMUx1qFRdn/eSV4w0CRvi5lmojDz+6SinBf25IGUoWjmebxsiFupktdrSEUZ7ZUJx9LnV9HE0I6/S1+ppBZnybgwN9htVcyAp5PFj/68x5XYg3KpgNFfQFtHW2TKoSW1dNm/QxBNSsfNJIDg5tLTau89Vx/laQVgWFnKAs0GAjXrfa+aLryOQlGpN//Ks14Xinq2LidR9VaiDOcxR//s8C5NANVmZaBo1pcrt9cj1cx1kfQ5Ud+CqoXwouxwVgvQZcQj3AOUE0c0I2BbQNUAlHcJq8OmZP08OFi2PK9wlGv75/vCIm0oXQG34s73ZuS555FUhr8ak8RkQfBMRSmS5QsZ351ZQ+mbTv1am7VxeqdxBQl4fuRaeOU+Jl+t28KwaE9fqkCIIcXDqjis+YJ9Jp316f7X5LS3c8wlFXnr3deMX6Vt2sTRtTFlYeHsX9w9QweHIpbR3PUiw4kJ/8siiAUlDgY4R89yjmnCk/oi+fC+Co4UpQgb9eo4EvgMPnpSRbZ1vFGvuHUBCfQq9wJ8Y2dEkudLee1bYcVQpXyZ9USXgwAluVzAi9i0PJ94w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(396003)(376002)(366004)(451199021)(316002)(71200400001)(38070700005)(66556008)(64756008)(66476007)(4326008)(66946007)(6916009)(66446008)(76116006)(91956017)(478600001)(54906003)(8676002)(8936002)(6486002)(86362001)(41300700001)(5660300002)(38100700002)(6512007)(26005)(36756003)(6506007)(83380400001)(33656002)(122000001)(53546011)(186003)(2906002)(4744005)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DE56EC5F6258FB42900AFCC2776276CF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10347
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3f83dffc-7a7d-4f99-6f71-08db5b76bf97
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7Sy9glZjzIT5rvM+5TJQ/55wE9/lmUZRBGVdyqqG1yXNzuqPjMCo0Kv4ISW+B4WhbCapKCeX4K2YQuzfIsczbUKJEJ5A8xLCHnOUDTPkbuF4k0HpURudBb2/LAp3Qf2rkMfqECQwvWsjEUavbZmrAmiCiXKeOUGAGKTA+l6rD9FeTv8s7HkTXQH5u+vNZ576Bg0Nh66XvPswTb4nEiFwy686dwpdqBej6WF+58BmeFgUgtT0VQr6/BUVXU7a8YGd903m88Pehdtif2emyPyjGSB2Q7RmeGuhbW03D+EPTUTVmMokls+FcaTXJHCt5z7sj9F1qk5z98Os+NbnisM73WGZCdGhyTnvzD6Krsd/xiLHZNtWlWD8GA8ndSZWRu/I/9QnpMd2vsbZaMe+dG/sPSbdY4CvR5KEYRb9GOeNiYGzLhvdx4MQOC9bE6pudcGWmjDuVQCP3Tz565vmf6xpibTZqte1hVrLloT8HWsu93vtBN9CJi54IlbHZ4PMP85C0pAWiGdj4u3I2+R9M0aUM+Vmu3JSVKQtQhfYNVqjq92TB47BWLCbEs0FCgl0sh/7+dFfCceF1mZjBUVqUwCYCGcMlX+sXFiG3Izp8AJKQ1dXEzwY93Usu4+zj/8mpnEtvqaYBxGmq9pOUcCDk1ZY7vdKfaXsZhsGk+xde6kXbIl4G0PtOC8B0y1RdqYg8lVpK+k0w+V/3XbaRuCGGT/S7Wh+5R/TDuCBCIRQDBmf7s3FqFTp6h0sd5xR+wvxLvjTMAm2yQ497zLsg3gkam0Ixi7Jtqs6DpIKpLaFi1Z1x2I=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199021)(40470700004)(46966006)(36840700001)(4744005)(2906002)(5660300002)(83380400001)(47076005)(6862004)(8676002)(8936002)(40480700001)(70586007)(41300700001)(4326008)(70206006)(54906003)(36756003)(316002)(33656002)(6486002)(478600001)(2616005)(6512007)(53546011)(6506007)(26005)(81166007)(356005)(86362001)(186003)(82310400005)(36860700001)(107886003)(40460700003)(336012)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 10:16:28.2749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9c00355-63d0-46b1-ba99-08db5b76c59f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT058.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7691
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 10:16:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181634

T24gMjMgTWF5IDIwMjMsIGF0IDEwOjA0LCBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmlu
QGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBOb3RoaW5nIGRlcGVuZHMgb24gdGhpcyBwYXRjaCBh
bmQgaXQgY2FuIGJlIGRyb3BwZWQgZm9yIHRlc3Rpbmcgb3INCj4gbWVyZ2luZy4gSSBwdWxsZWQg
aXQgaW4gYmVjYXVzZSBvdGhlcndpc2UgZ2xpYiB1cGRhdGUgdG8gMi43NiB3b3VsZA0KPiBzdGFy
dCBmYWlsaW5nIGl0cyBwdGVzdCwgYnV0IEkgc2VlIHRoYXQgZ2xpYiB1cGRhdGUgbGFuZGVkIGlu
IG1hc3Rlcg0KPiBidXQgdGhpcyBwYXRjaCBkaWQgbm90LiBOb3Qgc3VyZSBob3cgdGhhdCBoYXBw
ZW5lZCwgYXJlIHB0ZXN0cyBwYXNzaW5nDQo+IGFzIG9mIGN1cnJlbnQgbWFzdGVyPw0KDQpJbiB0
aGUgcHJldmlvdXMgaXRlcmF0aW9uLCB0aGUgdmFsZ3JpbmQgdXBncmFkZSB3YXMgZGVwZW5kZW50
IG9uIHRoZSBjaGFuZ2VzIChhbGJlaXQgdHJpdmlhbCB0byByZXNvbHZlKS4NCg0KVGhlIHB0ZXN0
cyBhcHBlYXJlZCB0byB3b3JrIGJ1dCBJ4oCZbGwgZG8gYSBydW4gbG9jYWxseSBqdXN0IHRvIGNo
ZWNrIDopDQoNClJvc3M=


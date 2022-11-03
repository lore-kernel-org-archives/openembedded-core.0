Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97260C4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 13:51:32 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.45])
 by mx.groups.io with SMTP id smtpd.web08.19402.1667483489117231552
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 06:51:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=qDNbShHY;
 spf=pass (domain: arm.com, ip: 40.107.6.45, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RJxev/BnvUr/DMQXm7pK/iPMrwJ4cgodUUI3ebem1xAed4Y8W3BZdxQhrVelnhD8nh/G2szJ1H5M2GjM4wsNAed0G/l3ZGjgEK9nT4MbfXiT3Rig7CtT7FQx8OJNpdcAALacWMLgruk08k8b0WWGgzMutXu5uJ4xDQlc9wfoOIDOVIyF+i/UW9PZRiKFEho/+tZGpKrlVYqIPA1HL89yHrgJCI1XnyVM4Vw1DmkMJhzYnaY3n6XT35Jd7ljI/2RsvbXmOniR+T3yIKKfj/+bTkoDK48XC+w/kOP01Ap5kCfSVufDdW0B2Rj68G2vjzCoqSVHNb6X2MVixOYPqVgFDg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FtdftzYGtNbQhTvvZ5ibV54dwgBiOG7aSXm6X0KpknY=;
 b=eHAzNrceKIfuuQ2qr1HQI7mlB/Rtn49OrOFbn8BE2kyz/3wUXYcVNLSkyF0yrR9ouDDU7w8cvzJQY6HpVBKR2OyUwo7n3fOYHWMhay5HDS5HhxUNyKEXXeHx65/SujovJUWmRbkO/DAI1aSukbhE5WLV/fG4xc5nOH8Fu78UjjxQFMyttN7l1BUIwjYaYciARMF8YvxH/XO7TjoemO4CaxRKRWNQXOO7bXSw7EDjNnPuPNnhq1Xjg2QBdRnR5xufGIbEz7HF5t5JRnWtVeUkD4bR1nyJzef729GpHGryJ6x/NKkoTCpEhmA7cVGkOa+EAl/+pDyNxj3RvXMSG3XwUQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FtdftzYGtNbQhTvvZ5ibV54dwgBiOG7aSXm6X0KpknY=;
 b=qDNbShHYgynuPjVEtBW/XUGw6MV4g10XI7y/MnnUrmANymqt4helEAsaO1jGYqTWsH2I5GaoD854hhgNsrsH8bQ7sF7TeyzDyX7cX0HQGBdGDMR+rLE8Gtjjchi134OS4oz4KuG9+4NBYUJeP7rt3a9P8LyWPEt6Rs0DvG1UDmM=
Received: from DB8PR04CA0004.eurprd04.prod.outlook.com (2603:10a6:10:110::14)
 by GV2PR08MB8510.eurprd08.prod.outlook.com (2603:10a6:150:b1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21; Thu, 3 Nov
 2022 13:51:25 +0000
Received: from DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::70) by DB8PR04CA0004.outlook.office365.com
 (2603:10a6:10:110::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Thu, 3 Nov 2022 13:51:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT020.mail.protection.outlook.com (100.127.143.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 13:51:25 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130"); Thu, 03 Nov 2022 13:51:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 64805da56aa0ce0a
X-CR-MTA-TID: 64aa7808
Received: from d2ed8ce94e21.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 193694A0-0877-4E88-976A-87DD07663DFF.1;
	Thu, 03 Nov 2022 13:51:18 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d2ed8ce94e21.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 03 Nov 2022 13:51:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eI88wmESy+iVzbUy4J2KJ7vJVUsRJncTPDxmtdus2f4hIrIU1xpYd1+WjoKowtqFy98GY7gZ1Vjet7eeU5alWy65yZUM7V2Ctk7QEu2lufOZVVNLMtwyBgNhI7Cjqaaku8QmqwAlFxLV41oItlSWoZXvDuQlRVkBcSUgIf/Efx/A93vxLmWFq1ayLSxnPj/naniDQaH2N5luGIOYPkqZyCQaCnKRzk8VamqP3r0Bx6YkleQ0VKoICh9SDnnk6AEjUKSIYFlPuUOjh0VDBvdytgE6YNqRwceENmITql0DZnqllmNmqFO5E8m7KlH4ypNkM8SQAYryrATdwNhsXkeBDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FtdftzYGtNbQhTvvZ5ibV54dwgBiOG7aSXm6X0KpknY=;
 b=k+P4pqzK5MCyhC9KXkjlSMXVlHaCC5lDemzpSuQblq5A8Dw36MURXTjy1l5O47yPAhxFGArIF928Uj9tbKCeRIL8meTwIcOOi9RYJYVTlyi8i0UFacFnpST2bv6LZzWelxZuvCsHMCA+nThwDaq2AmvmI1uFqp+drI4Weghw+CsEfq5c5L4czXTm3R2sU7EDqFquxmh8hdDL7AXC+gVeBbKgSQ/IsImCffUx4UXyn5HMgwEy8V8GqSjx7GeZ7mnE0dcNhQiR0keVJfd5QaTojdzXPDfJEZH/Y0dhnsc1UznLzP33odI1bTD6oxd+1bIDpzNoh3xLz8X52pirCRrpcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FtdftzYGtNbQhTvvZ5ibV54dwgBiOG7aSXm6X0KpknY=;
 b=qDNbShHYgynuPjVEtBW/XUGw6MV4g10XI7y/MnnUrmANymqt4helEAsaO1jGYqTWsH2I5GaoD854hhgNsrsH8bQ7sF7TeyzDyX7cX0HQGBdGDMR+rLE8Gtjjchi134OS4oz4KuG9+4NBYUJeP7rt3a9P8LyWPEt6Rs0DvG1UDmM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB6418.eurprd08.prod.outlook.com (2603:10a6:20b:360::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 13:51:16 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc%5]) with mapi id 15.20.5769.019; Thu, 3 Nov 2022
 13:51:16 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "chase.qi@linaro.org" <chase.qi@linaro.org>
CC: Openembedded Core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] libc-test: add libc testsuite for musl
Thread-Topic: [OE-core] [PATCH] libc-test: add libc testsuite for musl
Thread-Index: AQHY70cKoLBRlfjVFkKGJhwd5dOHi64tOBSA
Date: Thu, 3 Nov 2022 13:51:16 +0000
Message-ID: <019492FD-CF5A-495F-A76D-4038A4035D52@arm.com>
References: <20221103053926.719998-1-chase.qi@linaro.org>
In-Reply-To: <20221103053926.719998-1-chase.qi@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB6418:EE_|DBAEUR03FT020:EE_|GV2PR08MB8510:EE_
X-MS-Office365-Filtering-Correlation-Id: 87c071de-aaad-4a0b-82dc-08dabda27ff8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 GX69k9V2W4mU2iYqrZh9MfTL6y9rH1UtGZ0ksQc3hlDzVO4ZGDsx7cKil50uVWXelQTKzifO3SCXnnWatkrtAjnELCKups0hMu5Ouu8l2sCUmepZ73rPOJ54+keTKBsVi1+k23QE6nhmutDlog8y1SVdKLFkD69WmVDIHv/6hUhiOeE88bpd9T4Pk25FZMLWhQ0uC68mFz1fJkOqdYwftr2ATH4y6Q/Wucdzs/ws1wdNNZPyXeGJwv6mYu4BeuhYkVuLTsEuuCZN7MHkTUtQzQbpfxnLC9tx9Fnt1N5QJdpfYoXMRmPI/Z0Bq8o5RqzhMXbzUncoHS6lcz9yH6pXGhkA4XZfk46GFYWm5qy74/v61SadygZFugLaofB6yAYe87UKuttyHwcj1FdnYH4uOENSerLc7Vl+aeVkidnMWd3XvIgSJumvzc6n/hgWTuFlS1+WojlHoqckzd3PhGSbYJsVeh1SOA4Ebo4eG+JvgbTk6A7vgal8JO7v2GwPO29kWxHLPYdKsToRlBjizam6cd8J8rI2GVVAwNKpmavJN4J8lvO4Cn82loJj8tNF3Ts2Obrwav2eHIjX3bWc04MpPGdYOS6N+3bx1nicRWa9opADJ1KRhd9mAne9E47zgOKmvQXVa0yafn0jRehnlabFZnGR+GynMADNApVRzwRGyfNvPHlCL/rblp8V5yz/MP5gUN+eTWinyBw5QbbC8AZRYt6qKd5wAdncHjGoS6b9+FcwVh6yLu4p4ZlvILt4vWWy1zBXJjoqPcCy2DqbVp+nqjjLah6tLSS3ummeR5d/Otg=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(451199015)(38100700002)(6506007)(53546011)(8936002)(66476007)(6512007)(26005)(5660300002)(91956017)(66556008)(76116006)(4326008)(36756003)(41300700001)(2906002)(66446008)(8676002)(33656002)(64756008)(122000001)(66946007)(38070700005)(71200400001)(2616005)(6486002)(478600001)(6916009)(186003)(316002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <54BED83C114583439F48D980DBF54846@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6418
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4a41768d-2bff-46f5-c454-08dabda27a97
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XaF6D4YgEVYzx/yzrt57Hz25SLeFeXVirhp4oovxw+IaXLjJhyUE5/76KNdk3kHsfyzGMBVTL3KT3GSoPTJnFKsNa7B0YW4frR7GHm/ThADRk6FfGVBm2/veUQXvVDG0fwnvuiJfQXN+ZMUDxxX9NbKoF5sc6j5jvyH93YpS275h8pTBS7e+sExMUnJwGQT1RsyE4DEqPrOuSZIexaAD5/T2RLeO8WMRvUw/yfPJH16RxQ/vb20NkwI5paFiqE0UwIO0oz1SQtiFipFSHI0e05XlRR4WBLFUWemTpBjVI/PTu8CG3lYMJol/cPRgeDauDB36aeLAtsetZ/tNDiCVi6II5gQCgtEIRzqd/XWszLO4h6AKv01AV5HiqVnjXac5lV9bQB5Zws3YkMsJF4hjIMUcmhyQFUHfAebByzUC8mRzquZsNGSGwvr6KuB900RDJyanY6N2cWHD6x5KmEz+0bFsAiOnbl0b7MhJz7vKf2g2eBcGJFmPrYR0sLuUxlaDBB7IGhvl9DZ3oy0mJm1mvxos05m5hJntgZr4U5mVduxogs8SMl9TEbSOkrrCZBo889HyWMiYy7sYbBc422rLwlnzjOu6PfMLwbb6nHanFncv2nU+ZcKWTUQnI5qGSMHBILAP4j/fi1XktUb1LMX6AIq+gLM2n7qr8ejUeaezKsJbPedY3q77aoDmUIR1ZQwTjH8OAY8OrObqcJksrbA/iE1Cp/pY7Jrr3zDk3hZ0YXo9/NMHTc4gqhpxeunWcXbHFJgahZs1wirE8Amaxs4wwg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199015)(40470700004)(46966006)(36840700001)(41300700001)(70206006)(81166007)(6862004)(2906002)(316002)(6486002)(36756003)(8676002)(26005)(33656002)(70586007)(40460700003)(4326008)(82740400003)(6512007)(6506007)(8936002)(478600001)(53546011)(2616005)(186003)(336012)(36860700001)(356005)(5660300002)(40480700001)(82310400005)(86362001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 13:51:25.5690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87c071de-aaad-4a0b-82dc-08dabda27ff8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8510
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 13:51:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172629

T24gMyBOb3YgMjAyMiwgYXQgMDU6MzksIENoYXNlIFFpIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIDxjaGFzZS5xaT1saW5hcm8ub3JnQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiArTUlSUk9SUyArPSAiZ2l0Oi8vbnN6LnJlcG8uaHU6NDkxMDAvcmVwby9saWJjLXRlc3QgZ2l0
Oi8vcmVwby5vci5jei9saWJjLXRlc3QiDQoNCldoeSBkbyB0aGlzIHJlY2lwZSBuZWVkIGEgTUlS
Uk9SUz8NCg0KPiArUkRFUEVORFM6JHtQTn0tcHRlc3QgPSAiIFwNCj4gKyAgICBiYXNoIFwNCj4g
KyAgICBncmVwIFwNCj4gKyAgICBtdXNsIFwNCj4gKyAgICBwYWNrYWdlZ3JvdXAtY29yZS1idWls
ZGVzc2VudGlhbCBcDQo+ICsgICAgc2VkIFwNCj4gKyINCj4gKw0KPiArZG9faW5zdGFsbF9wdGVz
dCAoKSB7DQo+ICsgICAgY3AgJHtTfS9NYWtlZmlsZSAke0R9JHtQVEVTVF9QQVRIfQ0KPiArICAg
IGNwICR7U30vY29uZmlnLm1hay5kZWYgJHtEfSR7UFRFU1RfUEFUSH0vY29uZmlnLm1haw0KPiAr
ICAgIGNwIC1yICR7U30vc3JjICR7RH0ke1BURVNUX1BBVEh9Lw0KPiArfQ0KPiArDQo+ICsjIGxp
YmMtdGVzdC1wdGVzdCBkZXBlbmRzIG9uIGVtcHR5IGxpYmMtdGVzdC4NCj4gK0FMTE9XX0VNUFRZ
OiR7UE59ID0gIjEiDQoNCkl0IHdvdWxkIGJlIG5lYXRlciBpZiB0aGUgdGVzdCBzdWl0ZSB3YXMg
aW5zdGFsbGVkIHRvIGxpYmMtdGVzdCwgYW5kIGxpYmMtdGVzdC1wdGVzdCBzaW1wbHkgY29udGFp
bmVkIHRoZSBydW4tcHRlc3Qgc2NyaXB0LiBUaGlzIHdheSB0aGUgcGFja2FnaW5nIHJlZmxlY3Rz
IHJlYWxpdHkgYW5kIHlvdSBkb27igJl0IG5lZWQgdG8gc2V0IEFMTE9XX0VNUFRZLg0KDQpCYXNp
Y2FsbHk6IHRoZSBwYWNrYWdlIGNvbnRhaW5zIGEgdGVzdCBzdWl0ZSwgYW5kIGEgcHRlc3QgaGFy
bmVzcy4gIElmIHdlIGV2ZXIgbW92ZSBmcm9tIHB0ZXN0IHRvIHNvbWV0aGluZyBlbHNlIHRoZW4g
dGhlIGxpYmMtdGVzdCBwYWNrYWdlIHdvbuKAmXQgY2hhbmdlLCBqdXN0IHRoZSBoYXJuZXNzIHdp
bGwuDQoNCj4gK0NPTVBBVElCTEVfSE9TVCA9ICJudWxsIg0KPiArQ09NUEFUSUJMRV9IT1NUOmxp
YmMtbXVzbCA9ICIoLiopIg0KDQpJcyB0aGVyZSBhbnkgdmFsdWUgaW4gcnVubmluZyB0aGUgdGVz
dCBzdWl0ZSBvbiBnbGliYz8NCg0KUm9zcw0KDQo=


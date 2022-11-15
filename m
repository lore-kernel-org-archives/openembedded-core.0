Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D56D2C433FE
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 11:20:34 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.80])
 by mx.groups.io with SMTP id smtpd.web08.4326.1668511227682568005
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 03:20:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=CFL0NVIJ;
 spf=pass (domain: arm.com, ip: 40.107.14.80, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=UkLwS/XyyxEigCM2l4QXi2vo/+xttlgDw3m2xjoqS+z2+0rAI3SIuywxGu9imxOOeKOw8eJUH+RyNL66Qo5PbsiDbs4QB4/oc1cL6OXubRVU5EnkDOvk2xrhhbup7TEvleHebu/Kxyhz951FEJ85kuDT8chp46fbN/xnkOF84QJc0DCfA/2z91hhuh2Dc8TYzJNTZpPpn3J+f4gM5o4+Rr1oEV2Uisl24H+026UTKOEN+4SougXL3BE++tP+Dez1HI/O9O8mv5pDyPkfBd/aWJ+287iaJwwiCuiAqxHIq5HoBauGWi+Qz+dRHazyBHeNqbdhFXz9N5eMZDEoshVOaQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SitYTgahVu36Z4Cuu8x2h+Kh3x7N2KnhnXB/JUjXWbU=;
 b=dwrH2U13hFJjyy7eXq9NW3DYar7hLtY33O2y4xzsiQIm9V4fDeehzI70nzFT78gF3Wp5MxNGyIppdDaTryfssQ0aaCMuSjJWZCbuG8MHdzjf4tJz5PG3Y2RbdWZ+iKIGdqLuGy6U2lJKMa+BQqiSQ3rh9svWjl54m1beXDINnlwE6dtrBZ6hiDXqSUtJezm5miPC5LCURv8czKBWyIFGu973299Fu0EBnY/xgjtEvFYvQrxi2nkiBSWHEnshVE2AoA6suMGh+7GdwVdLlvI+bNEPIO4Gn54axffQGrXtvqFqCleLOmuILs9ChMkt7geTMRUuD20QwQfZabN7lEMcnQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SitYTgahVu36Z4Cuu8x2h+Kh3x7N2KnhnXB/JUjXWbU=;
 b=CFL0NVIJb9pl0nU139QlatcsgnGLcfgM0HBLtZWsaiHE1WIZQ1tbzUO8iVW75xb5tQG8mvxQOIYuTN6UPN6qvFNDgzaV2H3ezs/HwVMKZP8cwnu+Fmp3BSAh7CzmukbnBG1zyJeRQp4A/8R3JuEwPAbZw5H4okAv/L7pyC9/nyg=
Received: from FR3P281CA0164.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a2::18)
 by AM0PR08MB5508.eurprd08.prod.outlook.com (2603:10a6:208:186::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.7; Tue, 15 Nov
 2022 11:20:23 +0000
Received: from VI1EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a2:cafe::e) by FR3P281CA0164.outlook.office365.com
 (2603:10a6:d10:a2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18 via Frontend
 Transport; Tue, 15 Nov 2022 11:20:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT009.mail.protection.outlook.com (100.127.144.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Tue, 15 Nov 2022 11:20:22 +0000
Received: ("Tessian outbound 58faf9791229:v130"); Tue, 15 Nov 2022 11:20:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0bcd580dd3b1fe2e
X-CR-MTA-TID: 64aa7808
Received: from a3bd6b90a3c4.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E59FE3F7-8101-41E8-89B0-1EA0C502FFAE.1;
	Tue, 15 Nov 2022 11:20:15 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a3bd6b90a3c4.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 15 Nov 2022 11:20:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLjDbUarji8Nx8JFdUIxvc9K7gYG9O1yUKN/unswwAOMvVx6oQbHltMnNWbJQBTjtL0/5SrXQ2Dm2tN2XxEnoYFxAtiR13JwBJq8JLiNBbAq/AvBr9wVZMeYljC9MDcdIvokidGbKD6TVhPdtKTcUtYEV3ucBBglYu6zAIqKmoizSqsPMTVf7SzG32M4XkOFKs5iuo+t1PJhB+2W1KbtgpbYLnqAn90TioXwzj6IQSoovZjgKxrohkr8JviHAPV+NUQcKu3igu9W6DCPuY73DZMTsJofgSNgZ7JkPgjAekuv8Uwp6w3xpFtspXFI4HlNe/70RpM2MzIdx3j3neF3JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SitYTgahVu36Z4Cuu8x2h+Kh3x7N2KnhnXB/JUjXWbU=;
 b=DlqV+NOZCSb6JcnLRLCjgqYmJhXQ+dDoiYDqY+Z3kaa5OHLtn5aYpNFk9A/BBiX3EfosquP2gjYc+iO934IdZrxdHgOQ36w/BqKub83/b+9KY3/F8g0iEnCc/7LSiO9fuKYAQhjWxis4qZk2chZRr9k3tO9WkJi0Y/a9xnDjRlsb68RA7u+a2+tywaqbsxn4afg4JrKgehTN4/cmDmwdQJcS6uTmmCXg+jRdjM5RnvqWtk655kIxNykyOJk8VhALWk5ezE1GCg9mjvM9V4iYDBYjAYmkQbfOy6wuamb2E60BPT5yI4V9JcEggdZiRANRo3kE5ShOo2cOI1VqLcXINQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SitYTgahVu36Z4Cuu8x2h+Kh3x7N2KnhnXB/JUjXWbU=;
 b=CFL0NVIJb9pl0nU139QlatcsgnGLcfgM0HBLtZWsaiHE1WIZQ1tbzUO8iVW75xb5tQG8mvxQOIYuTN6UPN6qvFNDgzaV2H3ezs/HwVMKZP8cwnu+Fmp3BSAh7CzmukbnBG1zyJeRQp4A/8R3JuEwPAbZw5H4okAv/L7pyC9/nyg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PR3PR08MB5753.eurprd08.prod.outlook.com (2603:10a6:102:87::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.6; Tue, 15 Nov
 2022 11:20:13 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::af9:29f:ae3b:108f]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::af9:29f:ae3b:108f%4]) with mapi id 15.20.5834.007; Tue, 15 Nov 2022
 11:20:13 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "cp0613@linux.alibaba.com" <cp0613@linux.alibaba.com>
CC: Openembedded Core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [meta-oe] [PATCH 1/2] Support for building on RISCV
Thread-Topic: [OE-core] [meta-oe] [PATCH 1/2] Support for building on RISCV
Thread-Index: AQHY9ncgcKVraZXZY0WOQmSS4xxu3K4/23oA
Date: Tue, 15 Nov 2022 11:20:13 +0000
Message-ID: <6D11494A-84C4-446D-A736-49841179EC70@arm.com>
References: <20221112091217.1025-1-cp0613@linux.alibaba.com>
In-Reply-To: <20221112091217.1025-1-cp0613@linux.alibaba.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PR3PR08MB5753:EE_|VI1EUR03FT009:EE_|AM0PR08MB5508:EE_
X-MS-Office365-Filtering-Correlation-Id: 63aa18ac-3852-4f3d-b885-08dac6fb633a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 hGuXxYTUiHzTl1xpdz+tWeh9qkuKnwW42eKKUW6HR1ZF5lyhuDEDNBEYqctaPMWVBa6vLv2maqfS49paXJFUKW5Yloy1AMpU4s5CuY/gsWUJ+DHtKv6ifcaLSV2pFip8d3i2hwT+a1yN4b/OdJroR4q5z6BUloFeffjBAPOZqpO8QNIBfDHhDVb0I00DDlFBUnYY1UQ54QOQ1p2rHT00PyWaLrjfRtTUN5loRKiOvjXSq1YcY+w8GvuWHslgfP5vuNsFWUFi8Vl1gTcsKoO1b3PvPDUO6ICiQBUeXOizJFGf0nsn9VXvJYSEKP+CXzMAf/tckpR2Y6boqpC7w/hWBywYwRvt1Cs2MivHiqJig59q+w5W71lPqTjFb1t6fbTcRrxBnWOTM+hTy5+K88dWv0kmjdg17BJGxEkGDW1d8J4EBfKoPCE0sckmqcGe37tkLCXSuDb7O7XVlkFU1A+0VLB2RAzQ6NDBuZSJmcQ/lyjzftBAucKyvJMOZF7iT39Zy4own19OW/Uw06TadQc6sx5N4FnlqQytYP6swavz5nTB4rMRkZCmxvUxI3qZT/C5/YxWmOW7ExgcR//P+ajhKcJEgt/p2ZVTLdolYWdKwLyscmMuZbYJ+RSsNpKiU1L6bV+/Da48PMVYvhCghNggBCA4xWUoSgvL1X262SRCdHqWXvYgC+v/23uYZV6Ua3T86aBXs8VSwxDjpc05c59ac5sMUOcjpO19UlXllAWQsMEXF73lpXevU2KsePyQzKreIbxHSfu4BEi0jnMIi2fbtaFiBm/e1jVN6jSiusjYX4TSb1hErDDMY+njhW5HAV/W
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(451199015)(33656002)(6512007)(76116006)(6506007)(86362001)(4326008)(2906002)(186003)(316002)(478600001)(6916009)(966005)(38100700002)(83380400001)(6486002)(5660300002)(8936002)(38070700005)(71200400001)(64756008)(8676002)(66476007)(122000001)(66556008)(91956017)(2616005)(66446008)(66946007)(41300700001)(66899015)(36756003)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <83AC5473DD22D147B88EAF1AAD744536@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5753
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	53899017-ea7a-4953-2678-08dac6fb5dbc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zXJhFQLifrieIsiNSt8WMiqtK9yAFyvG9+a21OAQ36tLOI1fe20rt6AXPF4JLYiHBfsQrIgBa/aNqVKx/uwdySb2899WzFUsvNZ9RFVpMPl9Br5KCWmnnLcbfRrVHnP7p5/7COe6TD4OEKlTRQhjyfqeTXKpSrmxA2MdnUfpHepWNDkVDCsqpGzcObcW87Sv0IP6MDwnUr2r+lF8C5xsmOdqKsijRbMzN/RobsQxOiM6HcJg3OT9b6bFSfCq0EFVZn985BHsTBUy5NcBLO1hjHbJrnAI6Jhi1Z7fj5UqK5Z8+6kHc9dbI+w4mznfzzmO4ZqqGqe+t5mGk3oY0Xc/lQ+g13lqpqj0kDqVw6AxfWwhLCJ2FxRvXZWS8DyPJuNo6H93X3HCvLB6HTKISAmwrf/Su7hFhSBevqk/4FVPNMoTzLkvLJoD6LaXOwgKkrWehbzqas5pvSNuOm9Ok9U1NJHx0XLjEvjHxJ71BgcZkR9uaw6U6L5GRhUFR7PhQYOjy0ytcHvrKnlS/iJCkhF2zTEezRKrLYILdFiNwZPXeV1AmFacbMrpPsKQ6QUd8mJ0hltlrLoOhX7OgipBfsiMAWUW7UFAsVQgXzQEZwI3R/3R6cg6kJz//K7RFFca90JAF90luRH7mGthB6PWqmqQTDP6zfjIMV2gvbAjJs7B5ZJjK/LzjZAuMBpguEAFBdyPsgAO2LZswyEsile/JhyuHMj1fWxyt09LZvUnxjkhFvtXN7Zk+6yNaa8b+fGoBn68aDs5ugKqw+q/AX4UCK65AA4raCkGGS/TQ/7bKbv8BUs=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199015)(40470700004)(46966006)(36840700001)(2906002)(6486002)(66899015)(6862004)(36860700001)(36756003)(5660300002)(8936002)(8676002)(70206006)(70586007)(4326008)(33656002)(966005)(316002)(86362001)(40460700003)(2616005)(40480700001)(478600001)(82740400003)(83380400001)(356005)(41300700001)(81166007)(186003)(47076005)(336012)(6512007)(53546011)(82310400005)(6506007)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 11:20:22.9136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63aa18ac-3852-4f3d-b885-08dac6fb633a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5508
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 11:20:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173268

Q2FuIHlvdSByZXNlbmQgdGhlc2Ugd2l0aCBiZXR0ZXIgY29tbWl0IG1lc3NhZ2VzPw0KDQrigJxT
dXBwb3J0IGZvciBidWlsZGluZyBvbiBSSVNDVuKAnSBkb2VzbuKAmXQgZXhwbGFpbiB3aGF0IGlz
IGhhcHBlbmluZyBoZXJlLg0KDQrigJxtYWNoaW5lLXNkazogYWRkIGNvbmZpZ3VyYXRpb24gZm9y
IHJpc2N2NjTigJ0gZG9lcy4NCg0KUm9zcw0KDQo+IE9uIDEyIE5vdiAyMDIyLCBhdCAwOToxMiwg
Y3AwNjEzIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxjcDA2MTM9bGludXguYWxpYmFiYS5j
b21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiBGcm9tOiBDaGVuIFBlaSA8
Y3AwNjEzQGxpbnV4LmFsaWJhYmEuY29tPg0KPiANCj4gSSB0cnkgdG8gdXNlIHlvY3RvIG9uIFJJ
U0NWIHBsYXRmb3JtLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQ2hlbiBQZWkgPGNwMDYxM0BsaW51
eC5hbGliYWJhLmNvbT4NCj4gLS0tDQo+IG1ldGEvY29uZi9tYWNoaW5lLXNkay9yaXNjdjY0LmNv
bmYgfCAzICsrKw0KPiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+IGNyZWF0ZSBt
b2RlIDEwMDY0NCBtZXRhL2NvbmYvbWFjaGluZS1zZGsvcmlzY3Y2NC5jb25mDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvbWV0YS9jb25mL21hY2hpbmUtc2RrL3Jpc2N2NjQuY29uZiBiL21ldGEvY29uZi9t
YWNoaW5lLXNkay9yaXNjdjY0LmNvbmYNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXgg
MDAwMDAwMDAwMC4uMTU1YzE5NWQ3ZA0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL21ldGEvY29u
Zi9tYWNoaW5lLXNkay9yaXNjdjY0LmNvbmYNCj4gQEAgLTAsMCArMSwzIEBADQo+ICtTREtfQVJD
SCA9ICJyaXNjdjY0Ig0KPiArQUJJRVhURU5TSU9OOmNsYXNzLW5hdGl2ZXNkayA9ICIiDQo+ICsN
Cj4gLS0gDQo+IDIuMjUuMQ0KPiANCj4gDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExp
bmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3
L1JlcGx5IE9ubGluZSAoIzE3MzE0Nyk6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9n
L29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMTczMTQ3DQo+IE11dGUgVGhpcyBUb3BpYzogaHR0
cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210Lzk0OTc3MDQzLzY4NzU4ODgNCj4gR3JvdXAg
T3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4g
VW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRl
ZC1jb3JlL3Vuc3ViIFtyb3NzLmJ1cnRvbkBhcm0uY29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0t
PS09LQ0KPiANCg0K


Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB574C4725D
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 12:52:20 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.89])
 by mx.groups.io with SMTP id smtpd.web11.72868.1705927935183281543
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 04:52:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=cvisAnoa;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=cvisAnoa;
 spf=pass (domain: arm.com, ip: 40.107.6.89, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=iYsNvJRWWQ2LFcLH6R6Iy0joUgkhSEWcmWDT+nhPA5QVNU2jflDc+muPmdFw0oaOG5AnxhysJ01yG2Z4QJKyRslC6DHgned59Zh0YUAXhlkzxAYdpG34Cf96rBbkBQUDq+SzezB26WZLeaPwjyTgB1menc7YCggPUrze+vMduCHlXWywg3rjsazXF0AgnwQHWTbXxxfnst+CnIGJqVsqMy+kNNXcON1D/eizRCx8Wnul44oMDdXp4/6PYK/No05yyT/h4XP1ebTq0RZ7QxkJF1uGN0uAN8zmyuqQ9XwO9WYDtNhsoMrrG3G+jUXvP1nNhptgOCfNysK77bwiPgyhcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ph9hgGG9SogolHdpOlVqn4auR6gWHXC6YMkIDwOBbnY=;
 b=DpTohT7nxvR6ZM6/E45+lfLdV9SmaqVjuXEfMwNjxGlReYy+aOHT5gEMjXOIe58dwbeJlqjMKamysWDH2XGxGYBjYdPBC+weLVtLmq2Kd3QlgRF7Qwv6Sej+nzkB4t2iO1Ps35qOmtN0ls5sbyk+l5AIKFmgjmbZBRSiPmVZkFk0yos7Cqv9Yg8xzdAJskAs04p8PCl/O99wO4IEhjAgFUK7+m5YI8OcaFLT7vmbzJ12qJf614LPykvLyzA8be+54dnNgwY4BdyOL3509MX5Pcar7muH919KofzoPCBAd6Gc3SDl9nQslxjp3tWhyvPaIIbU2Hk892CLBHh33Mlf6Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ph9hgGG9SogolHdpOlVqn4auR6gWHXC6YMkIDwOBbnY=;
 b=cvisAnoaD7QAeAZrO422YI1ACtvgMlSxm48SdNzZPkDnebFj+qZ+bmdfWGaLzW6CISUvreA5S+nclmaSspvXU3TOHKKFR+bnRpNvOSY5endRc1BCJ6HS8SNr7f8je7SfsDbLbJst26BSZqI4Ywq1Mib8cLgsWdh8H+DF/veuf+8=
Received: from AM6P191CA0104.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::45)
 by DB5PR08MB10254.eurprd08.prod.outlook.com (2603:10a6:10:488::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 12:52:09 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:209:8a:cafe::c) by AM6P191CA0104.outlook.office365.com
 (2603:10a6:209:8a::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.31 via Frontend
 Transport; Mon, 22 Jan 2024 12:52:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.16 via Frontend Transport; Mon, 22 Jan 2024 12:52:08 +0000
Received: ("Tessian outbound a064b9944658:v228"); Mon, 22 Jan 2024 12:52:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9bb55e738e142ea6
X-CR-MTA-TID: 64aa7808
Received: from ed61992f9cb5.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8E730362-5EB2-4735-A98A-FF73D6EFFC00.1;
	Mon, 22 Jan 2024 12:52:01 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ed61992f9cb5.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 22 Jan 2024 12:52:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c/Kzy1i50AG7tT0TzMBm5y6APRZrBYGYHKxokcdToxT/QzLzZJHzg9lYR0k1/cCH7pgtUYypsk33zr2T7bQqP8TUP54s3rKcVHYqQdGD4Q9IsITgPCmkgj1+AJzdpEKBQsDIlTaj+z4eaWbtDchDFPaCvuqY+/ULZrG3J4CrxgtM2ZFRwqE84MUR/Q5WF6HtrEfpsPvLKh+gvGaTdOI7l8SFgF4ePQWT+4wHaLXUMzf7ieP5jW6VfMxZnISQaCw+6M6RCqrB5Y5lMUQ4qSE5QkSRCZ60wkAiFP3wHkjMvxyCWZxmf7W91QdTKAUZZjWU80+EdcJKtYionGbYZOjuMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ph9hgGG9SogolHdpOlVqn4auR6gWHXC6YMkIDwOBbnY=;
 b=l6u3kLcNfVFD/Rx7cvUU/xxOyHXdzoq1uxEbSbceP9mgo2wg9r42vH7a1WPyjoRNjlW5RH4XhRaYluAI1/RrO/bDIwL8MAlivjAd32RcxSzn/7ex7212Pkz9blgndQ5cshdeLwDYc1WhYpEZ07IfHduJpYCIRCM8VWndlSpeNBF3dzHO5QLsUZOEusfblrIOmzVp1KMAnUlfu6VeEOii1QnnMZhbF8/QJkmuScuEQ5MfR1dVjptOiwz0N/hiVXKUaL4+UIbVIgNomyyNLtzbbXvXgfNhx8Bo/pHNNQlgWxs1Ga2R4Jfp+lVFBCOlkBA5D/88/rp3u6dVdZxtGfO8NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ph9hgGG9SogolHdpOlVqn4auR6gWHXC6YMkIDwOBbnY=;
 b=cvisAnoaD7QAeAZrO422YI1ACtvgMlSxm48SdNzZPkDnebFj+qZ+bmdfWGaLzW6CISUvreA5S+nclmaSspvXU3TOHKKFR+bnRpNvOSY5endRc1BCJ6HS8SNr7f8je7SfsDbLbJst26BSZqI4Ywq1Mib8cLgsWdh8H+DF/veuf+8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8052.eurprd08.prod.outlook.com (2603:10a6:150:75::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 12:51:57 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06%3]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 12:51:57 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "steve@sakoman.com" <steve@sakoman.com>
CC: OE Core mailing list <openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 21 Jan
 2024 01:00:01 AM HST
Thread-Topic: [yocto-security] OE-core CVE metrics for master on Sun 21 Jan
 2024 01:00:01 AM HST
Thread-Index: AQHaTFuggAlyx2rD9UOuVvqk81OqbLDlys2A
Date: Mon, 22 Jan 2024 12:51:57 +0000
Message-ID: <66B61CE3-5886-4895-8DEE-53DD04181C2D@arm.com>
References: <20240121111840.BFB881069A4@builder.sakoman.com>
In-Reply-To: <20240121111840.BFB881069A4@builder.sakoman.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8052:EE_|AMS0EPF0000019B:EE_|DB5PR08MB10254:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d8a70b4-1392-4dd2-db29-08dc1b48f1d1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 94WPzGy8J/i72eqkl0OXZCGdGojjoa0N7JkRBChMkbTWdnjizR9b3TA6yTOVPOtsPOZ59LX9Q1hbbzviDSAS0Rj/lIQxTtkizlYRzuhV5LInn/+YieVYM/a8rU67dDCnOQQFBPxPGr5nM2Ms4ccuK+fmBW2S4GV4M3vdPWF6/ZLvA3HVLydI3pzLeaJshnxgE0bmSVbWz8Qm6jVDvSovMQsgS04tqaFAw/z1ZlggyeHAU0spPIAtDEVJOf3Qf83Pus/iXt/5OkKdzllQ2nKGg4n3a1xoQTZzj38zdTCA+r5NAyLOZt3A3+EifKKIIUKDEECgBYzZKTiKRIVwOosyLTA3w+xVta2HEkIbymYME55gGIYHKKXLWD9tRy9rUzezFvJugUTYxmSSFDWbzWa9/Mo12c4q5u+fYkfvSpOryU2wyFhS4CWf2mAVyUae8wpTpRw7tVNC9jeLBz1HUo62bVdkn3RF1QYgys+nj7kJt5tFG2xZkEJWnpgg+bjzMcAtj1Hu9WLlvCxL+uN4ifMXgC9idGdfcro5dsgN2JiawIsvJ0d2eblUf3n7At89KbJm7EmG5C2OMiSyuEb+8IK4I5rSUQj3n1PturiF0tUnHmDtbI0A3ZR44U00musheYDWYkqZchy/GFkuhJsbyM1KCQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(39860400002)(376002)(366004)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(86362001)(122000001)(38100700002)(2616005)(26005)(83380400001)(36756003)(33656002)(38070700009)(6512007)(53546011)(6506007)(71200400001)(6486002)(91956017)(316002)(76116006)(54906003)(64756008)(8676002)(8936002)(66946007)(66556008)(66476007)(66446008)(6916009)(2906002)(4326008)(15650500001)(5660300002)(966005)(478600001)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A09338CE5675B45AF10C0F2EFD60FA4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8052
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	22e761ca-e4ed-4bd5-49c6-08dc1b48eb0f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hCmKT5i/EN8Dea0uQI3/X9b1FQAB6CgvHjOJ597uAIZfDia8YWfFLsdPp9MbVK1DXFcNE0n6SGtySQH1VdtvSr4KdTUgNSDS8yKpdVG0BML6bNGlttsu46JpClig48Y7GWLy4kms5M0fHOTQJn+q+WGN0gDs1VgBeDM90fINWiLk4AjrwTAmgXmc8psL0AaXT0j8nzD4wgMSZRj21Ptnt1fNHeBywyRYc9lkj20naKbY+5SPk3VMEy1+XbqcFFTxeooEdwMZzgel/dPNimEDTgCvykrraiWq3fDC4L9b/Bi49K686xYKDfX2Cp9jWVN19RgtHYa1fMgqL9v5YgFTKX9Lhvyy1P+qVvkVjT627iJfTZuD1CqPfobJghL58bhOAUhp8Tf2uo8V0cA+XhYUyWMaM2fMGIJFSpdbTnjjxWLPpPJur8RpXtoaRFSrxxwxFAcwgpoCaQk9YuFZRWJ8nvgODJRqjoGYue92VwNggHruOEgejijKvJlklPtMUGd43VlEfvGSZX29HyT8723LphCUg2HM+64RYZZ3OyGlgCtvapgKhRoTSrS8l83lMRsyN9BOSG675dq+ymAEibzpFSmKplIfnQFyBGPv1qHRhDwEMeqvff4iHU+S2B5czi1njBlcZVjWKeT46Tz9W9z5SytVX8xlV+0ZAdUPUNLya28jvDIiqm1LudjtfyR/2/s7
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(39850400004)(376002)(230922051799003)(82310400011)(186009)(451199024)(1800799012)(64100799003)(36840700001)(46966006)(966005)(8676002)(6862004)(5660300002)(4326008)(8936002)(15650500001)(6486002)(2906002)(316002)(33656002)(86362001)(70206006)(54906003)(70586007)(478600001)(36756003)(36860700001)(47076005)(82740400003)(81166007)(356005)(6512007)(53546011)(6506007)(83380400001)(2616005)(107886003)(26005)(336012)(41300700001)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2024 12:52:08.7956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8a70b4-1392-4dd2-db29-08dc1b48f1d1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10254
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 12:52:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194147

T24gMjEgSmFuIDIwMjQsIGF0IDExOjE4LCBTdGV2ZSBTYWtvbWFuIHZpYSBsaXN0cy55b2N0b3By
b2plY3Qub3JnIDxzdGV2ZT1zYWtvbWFuLmNvbUBsaXN0cy55b2N0b3Byb2plY3Qub3JnPiB3cm90
ZToNCj4gTmV3IHRoaXMgd2VlazogMCBDVkVzDQoNCkh1cnJheSENCg0KPiBGdWxsIGxpc3Q6ICBG
b3VuZCAzOSB1bnBhdGNoZWQgQ1ZFcw0KDQpPdWNoIQ0KDQpJIGRpZCBhIHBhc3Mgb2YgdHJpYWdl
IG9uIHRoZSBub24ta2VybmVsIGlzc3Vlcy4NCg0KPiBDVkUtMjAyMi0zMjE5IChDVlNTMzogMy4z
IExPVyk6IGdudXBnOmdudXBnLW5hdGl2ZSBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92
dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjItMzIxOSAqDQo+IENWRS0yMDIyLTQ2NDU2IChDVlNT
MzogNi4xIE1FRElVTSk6IG5hc206bmFzbS1uYXRpdmUgaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292
L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDIyLTQ2NDU2ICoNCj4gQ1ZFLTIwMjMtMTM4
NiAoQ1ZTUzM6IDcuOCBISUdIKTogcWVtdTpxZW11LW5hdGl2ZTpxZW11LXN5c3RlbS1uYXRpdmUg
aHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDIz
LTEzODYgKg0KDQoNClRoZXNlIGFyZSBzdGlsbCBvcGVuIHVwc3RyZWFtLg0KDQo+IENWRS0yMDIz
LTMwMTkgKENWU1MzOiA2LjUgTUVESVVNKTogcWVtdTpxZW11LW5hdGl2ZTpxZW11LXN5c3RlbS1u
YXRpdmUgaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNW
RS0yMDIzLTMwMTkgKg0KPiBDVkUtMjAyMy0zODU1OSAoQ1ZTUzM6IDUuNSBNRURJVU0pOiBnaG9z
dHNjcmlwdCBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9
Q1ZFLTIwMjMtMzg1NTkgKg0KDQo+IENWRS0yMDIzLTUwODggKENWU1MzOiA3LjAgSElHSCk6IHFl
bXU6cWVtdS1uYXRpdmU6cWVtdS1zeXN0ZW0tbmF0aXZlIGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdv
di92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMy01MDg4ICoNCj4gQ1ZFLTIwMjMtNDY0
MDcgKENWU1MzOiA1LjUgTUVESVVNKTogZmZtcGVnIGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92
aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMy00NjQwNyAqDQoNClRoZXNlIGhhdmUgYmVl
biBmaXhlZCBidXQgdGhlIENQRSBpcyBpbmNvcnJlY3QsIHVwZGF0ZXMgbWFpbGVkIHRvIE5JU1Qu
DQoNCj4gQ1ZFLTIwMjMtNDAzOSAoQ1ZTUzM6IDQuOCBNRURJVU0pOiBnY2M6Z2NjLWNyb3NzLXg4
Nl82NDpnY2MtcnVudGltZTpnY2Mtc2FuaXRpemVyczpsaWJnY2M6bGliZ2NjLWluaXRpYWwgaHR0
cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDIzLTQw
MzkgKg0KDQpXZSBoYXZlIGEgZml4IGJ1dCB0aGUgY2hlY2tlciBkb2VzbuKAmXQgc2VlIGl0LCBT
aW1vbmUgV2Vpw58gaGFzIGEgcGF0Y2ggdGhhdCBuZWVkcyBhIHJlc3Bpbg0KDQo+IENWRS0yMDIz
LTU1NzQgKENWU1MzOiA3LjAgSElHSCk6IHhzZXJ2ZXIteG9yZyBodHRwczovL3dlYi5udmQubmlz
dC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjMtNTU3NCAqDQoNCk5vdCBmaXhl
ZCB1cHN0cmVhbSwgYnV0IGFsc28gc3BlY2lmaWMgdG8gWHZmYi4gIFh2ZmIgaXMgcHJldHR5IGFu
Y2llbnQgbm93IHNvIEkgcHJvcG9zZSB3ZSBkaXNhYmxlIHRoaXMgYnkgZGVmYXVsdCBhbnl3YXku
DQoNCj4gQ1ZFLTIwMjMtNjIyOCAoQ1ZTUzM6IDUuNSBNRURJVU0pOiB0aWZmIGh0dHBzOi8vd2Vi
Lm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyMy02MjI4ICoNCg0K
UGF0Y2ggdXBzdHJlYW0gYnV0IG5vIHJlbGVhc2UsIHNlbmRpbmcgYSBiYWNrcG9ydC4NCg0KPiBD
VkUtMjAyMy02NjkzIChDVlNTMzogNS4zIE1FRElVTSk6IHFlbXU6cWVtdS1uYXRpdmU6cWVtdS1z
eXN0ZW0tbmF0aXZlIGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1
bG5JZD1DVkUtMjAyMy02NjkzICoNCg0KUGF0Y2ggYXQgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
cWVtdS1kZXZlbC8yMDI0MDEwMjAzMjkwMS4zMjM0LTEtamFzb3dhbmdAcmVkaGF0LmNvbS8sIG5v
dCB5ZXQgbWVyZ2VkLg0KDQo+IENWRS0yMDIzLTY5OTIgKENWU1MzOiA1LjUgTUVESVVNKTogemxp
Yjp6bGliLW5hdGl2ZSBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92
dWxuSWQ9Q1ZFLTIwMjMtNjk5MiAqDQoNClNwZWNpZmljIHRvIHRoZSBDbG91ZGZsYXJlIGZvcmss
IHNlbmRpbmcgYSBwYXRjaCB0byBpZ25vcmUgaXQuDQoNClRoZSByZXN0IGFyZSBvdXRzdGFuZGlu
ZyBhbmQgdGhlIGtlcm5lbCBsaXN0IHdpbGwgY2hhbmdlIChob3BlZnVsbHkgZm9yIHRoZSBiZXR0
ZXIpIHdoZW4gbWFzdGVyLW5leHQgbWVyZ2VzLg0KDQpSb3Nz


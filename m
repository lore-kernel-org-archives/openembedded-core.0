Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19962C54EED
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 16:41:49 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.45])
 by mx.groups.io with SMTP id smtpd.web11.46251.1675096904440086107
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jan 2023 08:41:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=D7RMvQrt;
 spf=pass (domain: arm.com, ip: 40.107.6.45, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZNwgXKBcT1YhgMkhv+W+tH7APkD0OgdL9VzDE3SBgIc=;
 b=D7RMvQrtHLoMMX02mTB04XmRprZiZ4eibUKxAnJPGhFvVGyVPTWNkl+iiY25260JCF6HAUhCR6OXLrGWyYh9o/fisDxVUtxv1UrINkzQWXfWCqELn/5jDgynEU2NWOZuWDGkQfHMsQDWnGKYotHwgAhLjYE5HZDnjANcd7ywvN8=
Received: from DU2P251CA0022.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::20)
 by PAVPR08MB9746.eurprd08.prod.outlook.com (2603:10a6:102:31d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.33; Mon, 30 Jan
 2023 16:41:41 +0000
Received: from DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:230:cafe::a7) by DU2P251CA0022.outlook.office365.com
 (2603:10a6:10:230::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36 via Frontend
 Transport; Mon, 30 Jan 2023 16:41:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT036.mail.protection.outlook.com (100.127.142.193) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.36 via Frontend Transport; Mon, 30 Jan 2023 16:41:40 +0000
Received: ("Tessian outbound 8038f0863a52:v132"); Mon, 30 Jan 2023 16:41:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d90cf6d2e9d77e56
X-CR-MTA-TID: 64aa7808
Received: from f546cf5e5b92.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C5F3CEA6-5F80-4C2B-AD9A-E8AEBE4A6F45.1;
	Mon, 30 Jan 2023 16:41:34 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f546cf5e5b92.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 30 Jan 2023 16:41:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KrDifZOOW5YkXxYuQbudjqiM9YJJNLhOohGk2pnOCvBF28fS28HvqAKg6f2+j2yDWK0bvK8bYStcBpo3bhi4psz8Jd9WVTpnp5/lo1JbDzk+k9rkwO195B8Hu6ErzgaCExiqg0a2XlVoZWhIi7zNyUmmFPn3Hf7rf6YEFk19bcyngjz391IngbeuHeQ9xGs9AiK1tL3gQZsLFkPgX/fFFSt/dx5u9YDou2qJBqIiwJc9SXgXd0joRxTlAVeSI5yxguMIx2s5LFbOPJPpi8t4kEP0AdzO2z/HSw/Thd8u7hH7U4cKd3F2iGgpVQczQqc2HYFrvafOpaW3QZGpnh1F4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNwgXKBcT1YhgMkhv+W+tH7APkD0OgdL9VzDE3SBgIc=;
 b=MyGMhR3d/3k7HGuh+VUME7Zg3Izmis3oWCroXaogfDTwxJ8D+bCUfWeDYz3RbLGyaf47WOJ0QdujrPK8vIp7+DEDUo1mcVLx31y5X+tdC5AvejTu0qO9YmACWQ8bpPHYnfMwfqal/2Tg982HW/HZuEDzMgamyzIOG3U1RfO6FIlDR7pS1+NdcxlASow770Hj6/duLTlEFVHsG2G4AnogbMcqMsKyk+2f+XH/o36ziYFyGC9pYSvFlINecldO7HI2alHKsfU7v6LREhEH2w2iEOPYLTVQXCFID6/pipQC/WKPkjSi7AGavSez1i4i5wvndnq/GImfuz17MzTMeHhBkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZNwgXKBcT1YhgMkhv+W+tH7APkD0OgdL9VzDE3SBgIc=;
 b=D7RMvQrtHLoMMX02mTB04XmRprZiZ4eibUKxAnJPGhFvVGyVPTWNkl+iiY25260JCF6HAUhCR6OXLrGWyYh9o/fisDxVUtxv1UrINkzQWXfWCqELn/5jDgynEU2NWOZuWDGkQfHMsQDWnGKYotHwgAhLjYE5HZDnjANcd7ywvN8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VE1PR08MB5646.eurprd08.prod.outlook.com (2603:10a6:800:1a9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 16:41:32 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0%5]) with mapi id 15.20.6043.033; Mon, 30 Jan 2023
 16:41:32 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Steve Sakoman <steve@sakoman.com>
CC: OE-core <openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 29 Jan
 2023 02:00:01 AM HST
Thread-Topic: [yocto-security] OE-core CVE metrics for master on Sun 29 Jan
 2023 02:00:01 AM HST
Thread-Index: AQHZM9nFvAtJN/+ooUaNm6pDL3Pf9a63K6qA
Date: Mon, 30 Jan 2023 16:41:31 +0000
Message-ID: <E7BF6584-DB84-410C-9980-DC5B6F6AF25E@arm.com>
References: <20230129120339.90B80960377@nuc.router0800d9.com>
In-Reply-To: <20230129120339.90B80960377@nuc.router0800d9.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VE1PR08MB5646:EE_|DBAEUR03FT036:EE_|PAVPR08MB9746:EE_
X-MS-Office365-Filtering-Correlation-Id: c9edf248-2aeb-4c5b-5b3b-08db02e0dd31
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 glLJV1HM2tTpF/evPzQBiKC91yhS80yCEiT02hFFH0yemsVkDjm5Aw9+mKyiJAqgSXKVsqylbzFZM7rN+waMgbYG6rzyZooYkBlH1URvmQ+BWoh1U3PBdk3Cum+cebXtOBR9NwnQQ8OeZ2pAmciqEncLjX+NIbYsOIz9o6KfTGFqh9V5xAO9S0Mz3BTngyC68KhrlvbPFnh2KBn3dFZUI3P2Vkn/Ru1vURYpoMm9LvTXW3ixQyNmLvShi1s7sWVUrLCLCCbrdCcfuYW5qTooNKU5XufnItZcE6BOE78XFOqH+J+4P/+3eLWTYoCNo2zFZxMKTJzJ5rVGl7MTyXCZ4QNWhmkhwirzCQe7B4x2XqbLAh1CEJAeLlZOx499UqnFJphN8qBEQcvjoBfdBCbHgco1KS3JOdcCCgGjU9Nz8UVg+uCg/e1lcw9Z3mLWjZRBuJ9eaKRBns2+1MqglMKCetjcoDszelAZnr1z+4NMSkR33JA6HF1coZugV+W/N/6NRdGYD7H+YFTlZWuLKJ1gXLs9Q5bPws5UKolxLAlG5GczsPhw+mNlSQzjLv5b+6AJZ4ZvxEJrSOT2T8pBuJh7P+gW17kEZVqxvn/g0RuUsALYbw8hxWSnhy9AC1ix1lYPGGkjS/nRH+x+jtUDtFU/5Q25Uuek4fStrkoIs3HkwdKZVTbCgXRXTTDpXjeYw/45AED3Da3GVJ2P5PRlGcUTn5cfdWadquWv/vIPgOtAEKisVmZYfaXOFiEDDcSVE/RE
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199018)(38070700005)(83380400001)(54906003)(66556008)(66946007)(6916009)(8676002)(66446008)(316002)(4326008)(64756008)(66476007)(91956017)(33656002)(76116006)(5660300002)(53546011)(8936002)(6512007)(6506007)(186003)(26005)(36756003)(86362001)(2906002)(41300700001)(122000001)(71200400001)(38100700002)(966005)(2616005)(6486002)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9E7FF983BAC9B242B97242941DE22531@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5646
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	76e0a697-2088-4ddb-c2f7-08db02e0d7d1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	x6nTN8i1YntC62rEdK4xvPBCLZro257dL6jsFAYpGt9fhGJyTs7Qc/hVFo9KZs6kX+YGrdwNqX93wuHp/q0hANRm4E0TOgmurL7VgEz7IfOXc4osPa1v/YauST/yIApItcb7PKbWPAyQ3EH3/N9xD/4cN4mBLsvEWUo0SbR5e57OBrc4YaEoSHMRX17x+czzW4PQcNBNCtXg11HdjEHGAmuXGFDHU1GvOm2394Ru0jePqcvwRPZO7PX9C2XSX0VExPG982wZVsD6Z+mrzpQJAvOb6M/USGdiQDEWi4ZoqunipeJ00sGwZf5xoheLE5wUJlbrKpPXyqj1XHgthd1HLJnMr852iLggySxQwZgCWwrPgkCGshF/eDoc3j3Yuv20lDli7G6QbsSglp9qNCJd2ni7xW3o+2WWj9tbwiKTc4LVwGYwqA/SZOD6Q4gW3rgc725FmyIu3ftLS88Jv4r/0a47+81fOePiGprlJI4sbkd4/frwjrOCG0Gdw4l7yIzIj84nA39J66wYov6wpNIZAQRnQFU/MNDlS9/2GckQRJw4GfOJBzKQc1ZxKO9C0/f7IS4ys93PRv45q50h+w57z30HPtS3YUYEaimIcHG7jqZtymkgRjWvxbar2xHPzrAzos5JCbk5NcecQR+NTcQFCk1X2XqzEoS2GoCqRzaenOtLkzNouMd4pCiDtF+AThUZWapQf74rIEt7/cuJvkLICj/LKb2m6w8iXnCen9QrB58=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(396003)(39860400002)(136003)(451199018)(46966006)(40470700004)(36840700001)(336012)(86362001)(36860700001)(82740400003)(316002)(33656002)(6862004)(8936002)(41300700001)(83380400001)(36756003)(8676002)(40480700001)(4326008)(70586007)(70206006)(5660300002)(40460700003)(2906002)(82310400005)(54906003)(81166007)(47076005)(356005)(478600001)(966005)(6486002)(107886003)(53546011)(6506007)(2616005)(26005)(186003)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 16:41:40.9986
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9edf248-2aeb-4c5b-5b3b-08db02e0dd31
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9746
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 16:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176497

T24gMjkgSmFuIDIwMjMsIGF0IDEyOjAzLCBTdGV2ZSBTYWtvbWFuIHZpYSBsaXN0cy55b2N0b3By
b2plY3Qub3JnIDxzdGV2ZT1zYWtvbWFuLmNvbUBsaXN0cy55b2N0b3Byb2plY3Qub3JnPiB3cm90
ZToNCj4gRnVsbCBsaXN0OiAgRm91bmQgOSB1bnBhdGNoZWQgQ1ZFcw0KPiBDVkUtMjAyMi0yMzUy
MSAoQ1ZTUzM6IDkuOCBDUklUSUNBTCk6IGdpdCBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmll
dy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjItMjM1MjEgKg0KPiBDVkUtMjAyMi00MTkwMyAo
Q1ZTUzM6IDkuOCBDUklUSUNBTCk6IGdpdCBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92
dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjItNDE5MDMgKg0KPiBDVkUtMjAyMi00MTk1MyAoQ1ZT
UzM6IDcuOCBISUdIKTogZ2l0IGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0
YWlsP3Z1bG5JZD1DVkUtMjAyMi00MTk1MyAqDQoNClBhdGNoZXMgc2VudCAodXBncmFkZSBhbmQg
aWdub3JlKS4NCg0KPiBDVkUtMjAyMi0zNTUwIChDVlNTMzogOC44IEhJR0gpOiB4c2VydmVyLXhv
cmcgaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0y
MDIyLTM1NTAgKg0KPiBDVkUtMjAyMi0zNTUxIChDVlNTMzogNi41IE1FRElVTSk6IHhzZXJ2ZXIt
eG9yZyBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZF
LTIwMjItMzU1MSAqDQo+IENWRS0yMDIyLTQ2NDU3IChDVlNTMzogNS41IE1FRElVTSk6IG5hc206
bmFzbS1uYXRpdmUgaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVs
bklkPUNWRS0yMDIyLTQ2NDU3ICoNCg0KTklTVCBoYXZlbuKAmXQgdGFrZW4gdGhlIENQRSBmaXhl
cyBJIHNlbnQsIHJlLXNlbnQuDQoNCj4gQ1ZFLTIwMjItMzk5NiAoQ1ZTUzM6IDcuNSBISUdIKTog
b3BlbnNzbDpvcGVuc3NsLW5hdGl2ZSBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxu
L2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjItMzk5NiAqDQoNClRoaXMgd2FzIGZpeGVkIGJ5IGEgcGF0
Y2ggb24gdGhlIGxpc3QgdGhhdCB3YXMgaW5jb3JyZWN0bHkgbGFiZWxsZWQgYXMgbGFuZ2RhbGUs
IEnigJl2ZSByZXBvc3RlZCBpdC4NCg0KPiBDVkUtMjAyMi00MDU1IChDVlNTMzogNy40IEhJR0gp
OiB4ZGctdXRpbHMgaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVs
bklkPUNWRS0yMDIyLTQwNTUgKg0KPiBDVkUtMjAyMi00NjQ1NiAoQ1ZTUzM6IDYuMSBNRURJVU0p
OiBuYXNtOm5hc20tbmF0aXZlIGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0
YWlsP3Z1bG5JZD1DVkUtMjAyMi00NjQ1NiAqDQoNCkJvdGggc3RpbGwgb3BlbiB1cHN0cmVhbS4N
Cg0KUm9zcw==


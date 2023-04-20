Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F96AC77B73
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 11:42:48 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.78])
 by mx.groups.io with SMTP id smtpd.web11.5582.1681990960564754202
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Apr 2023 04:42:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=CFyTkoOp;
 spf=pass (domain: arm.com, ip: 40.107.104.78, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtp0t+O8jSiVUuTehR5aK33NL/SLu+rGJGJl1MmZo20=;
 b=CFyTkoOpfhsMXSs1oEfMvYdKMm7Z3wyud7bmgzrScKpnJYgeZMefRcVENbKHI1gptuFoGUhBA7C48p3+DdaJhuRy7llLq5EcxinNxVNyPLddwmANVRQ76VgLoU4GiLbdFbpkRfn6sVG8x55H/4y6geGqd+KAP45ogmhZYf1mPL4=
Received: from DB3PR08CA0014.eurprd08.prod.outlook.com (2603:10a6:8::27) by
 AS8PR08MB10141.eurprd08.prod.outlook.com (2603:10a6:20b:631::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 11:42:37 +0000
Received: from DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::ca) by DB3PR08CA0014.outlook.office365.com
 (2603:10a6:8::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.24 via Frontend
 Transport; Thu, 20 Apr 2023 11:42:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT030.mail.protection.outlook.com (100.127.142.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.24 via Frontend Transport; Thu, 20 Apr 2023 11:42:37 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136"); Thu, 20 Apr 2023 11:42:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9dc308ee22266634
X-CR-MTA-TID: 64aa7808
Received: from 80822f23520e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1BA35D0B-9639-4FB1-8AD4-C4AF0275E1A8.1;
	Thu, 20 Apr 2023 11:42:31 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 80822f23520e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 20 Apr 2023 11:42:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3zhV4+xqkSkcC5EPxIhHd5Hjq6J35JezmJYSi36RfFTJFCwYJ+26/Px8GoM+5mN30tgZY3cjz+6WU8KdR6tlO0bZsbkJmFP4V5NXAKuGvRAoBLAW5+YLCpfxAwACJ/C8c/u50jgdgWTAqcou7K9dTlAnI+lIGp/vq/BBDRQ0nV3BXTY54qToeC2tGRRk0b5zA8VujWEve0592E1FzUmUTd8+o0JPFF+Oh4snFLVx79ON/Zm1mCoK5hHilS4Ug1qnyYnrcqDsRKOFWWDinYp3FF0vwCvijjdhvBXMGyoB+o7M5th7i6FSgUTU1dGMyftIghPljOYxTZsDKfPNXI4qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qtp0t+O8jSiVUuTehR5aK33NL/SLu+rGJGJl1MmZo20=;
 b=AwcH9KNaqPUk18HZUleasfgmJcDELpYHn3yFbbH2fnft/1EMDsosz3OMr+OJ6x0KHKJCrNuWNae6A0Tp3EQeKFds2KcSy81fbU0PMSe9K3bX1HqKQE3UQZkrRSV/MeJae/UjRI+8j3zY3DnH7GSthA9lgXNSY2LcAu5+ZW7n8zGLzWL21fD6id6nBs5QyV9B9HgKy6nNgrqOWDKj4sfcS8hZ8+1/P8WC2RjpbUAtZ5EzubOt9CJ1aCrcNoGdg9A8HhcrYH+dCxE/7PWt9EF+w1iiiUFNeLaghsEbB/TBqy05c299bmBHVrx6wjM4BT1GzLmaW0YHlIEyZ0YcYq7ivQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qtp0t+O8jSiVUuTehR5aK33NL/SLu+rGJGJl1MmZo20=;
 b=CFyTkoOpfhsMXSs1oEfMvYdKMm7Z3wyud7bmgzrScKpnJYgeZMefRcVENbKHI1gptuFoGUhBA7C48p3+DdaJhuRy7llLq5EcxinNxVNyPLddwmANVRQ76VgLoU4GiLbdFbpkRfn6sVG8x55H/4y6geGqd+KAP45ogmhZYf1mPL4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB9544.eurprd08.prod.outlook.com (2603:10a6:102:2f2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Thu, 20 Apr
 2023 11:42:29 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%5]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 11:42:29 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, nd <nd@arm.com>
Subject: Re: [OE-core] [PATCH 2/2] xserver-xorg: backport fix for
 CVE-2023-1393
Thread-Topic: [OE-core] [PATCH 2/2] xserver-xorg: backport fix for
 CVE-2023-1393
Thread-Index: AQHZcsS7kMCcuWJ6qUWlj/CPsmon0K8zbBuAgACoroA=
Date: Thu, 20 Apr 2023 11:42:29 +0000
Message-ID: <D59B2010-A770-47C4-9F39-439B218FEB19@arm.com>
References: <20230419134143.1530528-1-ross.burton@arm.com>
 <20230419134143.1530528-2-ross.burton@arm.com>
 <CAMKF1sp0o0UtmUGS_m5DHBN7vUTCNH6s_Lo0O8BVyjAwK6AX1Q@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sp0o0UtmUGS_m5DHBN7vUTCNH6s_Lo0O8BVyjAwK6AX1Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB9544:EE_|DBAEUR03FT030:EE_|AS8PR08MB10141:EE_
X-MS-Office365-Filtering-Correlation-Id: c61e26da-e3f3-495e-9a9d-08db419456f6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 XnAmqqguqJbmxIC/nuL3aG1z+gRKJeSgSMWKYmHd66sVc4EdanC1ZfpE/cXrh/36Yi6Emzq5UDeBpbRa3ND3kKc4LhrAcwm9EGSLI3rjKpEJVkc9hYcKbXhHdik2dogpfZNvZCjxF67gVAqMwCigbxcGsthTstUAl7xkVhXp4BAYVVdvd9aETXbcJTHEODO+W+xiZYS+j44e777Grf6QszIaCGV/XmoauW9wC0+GmuLMQgWbeoLqjoSrDCMKQULDVzkC8QACfhboqBb7o9d9789yXb/PR4GmZnKeyP7NGbt2gRmF6ZNZqx7zYiij0WH22g/GoR3xNmy+voBT35biEnTNG0k5k6hPcC2LeXnyC61F378p5UynWYnZE0OATmWgDk2a7wiOkSey670/pglHOlvPiBsUm4IKYrCtI875hOvIc+curTU9OHbKvP7Y4Lvj68YHgXwp9Cp/wV9tuxnqAV3ZUJ9eTmkIFveBla/pF1hH8XANKJfNhyiGvUV3qSoY7GOE2/8YftJ1dUPj/6NMWCtVjG2yfTqYQsFZ8Gev8fGoPtlHVFvRwV3kQm93/HSzYVo7R3CCQXyrI4budEP9zR8RaxRWItDyLl4KMEE/LKPFDCughqlJ1jUzwDoNQyH/dhPHpVqqfj2pBTWokxT3Ow==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(39860400002)(136003)(346002)(451199021)(2616005)(26005)(6506007)(6512007)(86362001)(54906003)(478600001)(66946007)(316002)(4326008)(64756008)(66476007)(66446008)(66556008)(83380400001)(6916009)(186003)(6486002)(71200400001)(53546011)(966005)(91956017)(76116006)(122000001)(66899021)(41300700001)(5660300002)(38100700002)(2906002)(8676002)(8936002)(38070700005)(36756003)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <15BE677633BB1A4A98A9CF1E8B7111A3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9544
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e6bac92e-81d2-452b-5e1e-08db4194524c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GdAARqPFpRE7Srb07/2xevDn3319Y+w+HjpAWvAlRcyaGjqBMYhBEjVulN/oPP22Mdda6EZ13YYyzMYVFq1WLFLvKgFFukSFkCsDFq1b7pUvLtkDIUr0KMyGcxZJ6l5bE/D2Vn697avpPZ1v5VZ4s1P3uKHowe+OhtSy9kfWcNZBp7o4hBSXhmdLCDirelFaqqG8/6PMvSHNM9O3FXEQijNOWhlDNRMNyOYt2+xd4ZWeE7RZGg4iVBp18thLQR1wAf49g5uZVmd/re2xUapCwt3S19FSK2NIbazBjJSnTy2BkSLhd7XHtK0IV+qpJK03+exQSB95AEFIrilEqg4LZy2uou9A3Ql4Ow/kGS/Yr0q1L1cNKv9Xf2RaU+o9cUA+nvQjMJXCksHhO1K/RmxN5xBsYglGbAxKHT3d8a5s/RnvlR4vKkeW1Pif3TaUuAzUTj22i7LDRcl4xus8GeswRVlhF/PEfFcfDP82Nsy+xxsny3LfSzNAJBtgmQx5GgCW5Tiz677Okxgn3KVZSLkSIFV7s78bQ3Uv+0ZHyGk4z2wtlwmH1KHU/61b8brer8Tkf3v15KfRL8w5zlX/k6RNJJS3RKq/irDT30X/bhQRFcSqgSOIii+e5Y8jpyP7eyYozcZVjPM5iOpczOAJ9xvcc5g+ywmUMmJmw4JSBPjJ8bM6Ur7L6PE143RLxEZpVwqn
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199021)(46966006)(36840700001)(40470700004)(33656002)(186003)(336012)(36756003)(478600001)(82310400005)(40460700003)(356005)(86362001)(54906003)(6512007)(53546011)(2616005)(26005)(6506007)(81166007)(6486002)(4326008)(316002)(36860700001)(70586007)(70206006)(82740400003)(41300700001)(66899021)(8936002)(8676002)(6862004)(966005)(83380400001)(5660300002)(47076005)(2906002)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 11:42:37.3024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c61e26da-e3f3-495e-9a9d-08db419456f6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10141
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 11:42:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180249

WWVhaCwgZHJvcCB0aGlzLCBJIGZhaWxlZCB0byB1cGRhdGUgbXkgYnJhbmNoIHRvIGluY2x1ZGUg
dGhlIDIxLjEuOCB1cGdyYWRlIHRoYXQgaGFkIGJlZW4gc2VudC4NCg0KUm9zcw0KDQo+IE9uIDIw
IEFwciAyMDIzLCBhdCAwMjozOCwgS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4gd3JvdGU6
DQo+IA0KPiBGYWlscyB0byBwYXRjaCAtIGh0dHBzOi8vZXJyb3JzLnlvY3RvcHJvamVjdC5vcmcv
RXJyb3JzL0RldGFpbHMvNzAwNDA4Lw0KPiANCj4gT24gV2VkLCBBcHIgMTksIDIwMjMgYXQgNjo0
MeKAr0FNIFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPiB3cm90ZToNCj4+IA0KPj4g
U2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+DQo+PiAtLS0N
Cj4+IC4uLnBvc2l0ZS1GaXgtdXNlLWFmdGVyLWZyZWUtb2YtdGhlLUNPVy5wYXRjaCB8IDQ2ICsr
KysrKysrKysrKysrKysrKysNCj4+IC4uLi94b3JnLXhzZXJ2ZXIveHNlcnZlci14b3JnXzIxLjEu
Ny5iYiAgICAgICB8ICAzICstDQo+PiAyIGZpbGVzIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkNCj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZ3JhcGhp
Y3MveG9yZy14c2VydmVyL3hzZXJ2ZXIteG9yZy8wMDAxLWNvbXBvc2l0ZS1GaXgtdXNlLWFmdGVy
LWZyZWUtb2YtdGhlLUNPVy5wYXRjaA0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWdyYXBoaWNzL3hvcmcteHNlcnZlci94c2VydmVyLXhvcmcvMDAwMS1jb21wb3NpdGUtRml4LXVz
ZS1hZnRlci1mcmVlLW9mLXRoZS1DT1cucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9y
Zy14c2VydmVyL3hzZXJ2ZXIteG9yZy8wMDAxLWNvbXBvc2l0ZS1GaXgtdXNlLWFmdGVyLWZyZWUt
b2YtdGhlLUNPVy5wYXRjaA0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAw
MDAwMDAwLi5mYzQyNmRhYmE1MQ0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIvbWV0YS9yZWNp
cGVzLWdyYXBoaWNzL3hvcmcteHNlcnZlci94c2VydmVyLXhvcmcvMDAwMS1jb21wb3NpdGUtRml4
LXVzZS1hZnRlci1mcmVlLW9mLXRoZS1DT1cucGF0Y2gNCj4+IEBAIC0wLDAgKzEsNDYgQEANCj4+
ICtGcm9tIDI2ZWY1NDViMzUwMmY2MWNhNzIyYTdhMzM3MzUwN2U4OGVmNjQxMTAgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxDQo+PiArRnJvbTogT2xpdmllciBGb3VyZGFuIDxvZm91cmRhbkByZWRo
YXQuY29tPg0KPj4gK0RhdGU6IE1vbiwgMTMgTWFyIDIwMjMgMTE6MDg6NDcgKzAxMDANCj4+ICtT
dWJqZWN0OiBbUEFUQ0hdIGNvbXBvc2l0ZTogRml4IHVzZS1hZnRlci1mcmVlIG9mIHRoZSBDT1cN
Cj4+ICsNCj4+ICtaREktQ0FOLTE5ODY2L0NWRS0yMDIzLTEzOTMNCj4+ICsNCj4+ICtJZiBhIGNs
aWVudCBleHBsaWNpdGx5IGRlc3Ryb3lzIHRoZSBjb21wb3NpdG9yIG92ZXJsYXkgd2luZG93IChh
a2EgQ09XKSwNCj4+ICt3ZSB3b3VsZCBsZWF2ZSBhIGRhbmdsaW5nIHBvaW50ZXIgdG8gdGhhdCB3
aW5kb3cgaW4gdGhlIENvbXBTY3JlZW4NCj4+ICtzdHJ1Y3R1cmUsIHdoaWNoIHdpbGwgdHJpZ2dl
ciBhIHVzZS1hZnRlci1mcmVlIGxhdGVyLg0KPj4gKw0KPj4gK01ha2Ugc3VyZSB0byBjbGVhciB0
aGUgQ29tcFNjcmVlbiBwb2ludGVyIHRvIHRoZSBDT1cgd2hlbiB0aGUgbGF0dGVyIGdldHMNCj4+
ICtkZXN0cm95ZWQgZXhwbGljaXRseSBieSB0aGUgY2xpZW50Lg0KPj4gKw0KPj4gK1RoaXMgdnVs
bmVyYWJpbGl0eSB3YXMgZGlzY292ZXJlZCBieToNCj4+ICtKYW4tTmlrbGFzIFNvaG4gd29ya2lu
ZyB3aXRoIFRyZW5kIE1pY3JvIFplcm8gRGF5IEluaXRpYXRpdmUNCj4+ICsNCj4+ICtTaWduZWQt
b2ZmLWJ5OiBPbGl2aWVyIEZvdXJkYW4gPG9mb3VyZGFuQHJlZGhhdC5jb20+DQo+PiArUmV2aWV3
ZWQtYnk6IEFkYW0gSmFja3NvbiA8YWpheEByZWRoYXQuY29tPg0KPj4gKw0KPj4gK0NWRTogQ1ZF
LTIwMjMtMTM5Mw0KPj4gK1Vwc3RyZWFtLVN0YXR1czogQmFja3BvcnQNCj4+ICtTaWduZWQtb2Zm
LWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4NCj4+ICstLS0NCj4+ICsgY29t
cG9zaXRlL2NvbXB3aW5kb3cuYyB8IDUgKysrKysNCj4+ICsgMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKQ0KPj4gKw0KPj4gK2RpZmYgLS1naXQgYS9jb21wb3NpdGUvY29tcHdpbmRvdy5j
IGIvY29tcG9zaXRlL2NvbXB3aW5kb3cuYw0KPj4gK2luZGV4IDRlMjQ5NGI4Ni4uYjMwZGE1ODll
IDEwMDY0NA0KPj4gKy0tLSBhL2NvbXBvc2l0ZS9jb21wd2luZG93LmMNCj4+ICsrKysgYi9jb21w
b3NpdGUvY29tcHdpbmRvdy5jDQo+PiArQEAgLTYyMCw2ICs2MjAsMTEgQEAgY29tcERlc3Ryb3lX
aW5kb3coV2luZG93UHRyIHBXaW4pDQo+PiArICAgICByZXQgPSAoKnBTY3JlZW4tPkRlc3Ryb3lX
aW5kb3cpIChwV2luKTsNCj4+ICsgICAgIGNzLT5EZXN0cm95V2luZG93ID0gcFNjcmVlbi0+RGVz
dHJveVdpbmRvdzsNCj4+ICsgICAgIHBTY3JlZW4tPkRlc3Ryb3lXaW5kb3cgPSBjb21wRGVzdHJv
eVdpbmRvdzsNCj4+ICsrDQo+PiArKyAgICAvKiBEaWQgd2UganVzdCBkZXN0cm95IHRoZSBvdmVy
bGF5IHdpbmRvdz8gKi8NCj4+ICsrICAgIGlmIChwV2luID09IGNzLT5wT3ZlcmxheVdpbikNCj4+
ICsrICAgICAgICBjcy0+cE92ZXJsYXlXaW4gPSBOVUxMOw0KPj4gKysNCj4+ICsgLyogICAgY29t
cENoZWNrVHJlZSAocFdpbi0+ZHJhd2FibGUucFNjcmVlbik7IGNhbid0IGNoZWNrIC0tIHRyZWUg
aXNuJ3QgZ29vZCovDQo+PiArICAgICByZXR1cm4gcmV0Ow0KPj4gKyB9DQo+PiArLS0NCj4+ICsy
LjM0LjENCj4+ICsNCj4+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9yZy14
c2VydmVyL3hzZXJ2ZXIteG9yZ18yMS4xLjcuYmIgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MveG9y
Zy14c2VydmVyL3hzZXJ2ZXIteG9yZ18yMS4xLjcuYmINCj4+IGluZGV4IDIxMmM3ZDM5YzIzLi5m
MDc3MWNjODZlYyAxMDA2NDQNCj4+IC0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy94b3JnLXhz
ZXJ2ZXIveHNlcnZlci14b3JnXzIxLjEuNy5iYg0KPj4gKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL3hvcmcteHNlcnZlci94c2VydmVyLXhvcmdfMjEuMS43LmJiDQo+PiBAQCAtMSw3ICsxLDgg
QEANCj4+IHJlcXVpcmUgeHNlcnZlci14b3JnLmluYw0KPj4gDQo+PiBTUkNfVVJJICs9ICJmaWxl
Oi8vMDAwMS14Zjg2cGNpQnVzLmMtdXNlLUludGVsLWRkeC1vbmx5LWZvci1wcmUtZ2VuNC1oYXJk
d2FyLnBhdGNoIFwNCj4+IC0gICAgICAgICAgIGZpbGU6Ly8wMDAxLUF2b2lkLWR1cGxpY2F0ZS1k
ZWZpbml0aW9ucy1vZi1JT1BvcnRCYXNlLnBhdGNoIFwNCj4+ICsgICAgICAgICAgICBmaWxlOi8v
MDAwMS1Bdm9pZC1kdXBsaWNhdGUtZGVmaW5pdGlvbnMtb2YtSU9Qb3J0QmFzZS5wYXRjaCBcDQo+
PiArICAgICAgICAgICAgZmlsZTovLzAwMDEtY29tcG9zaXRlLUZpeC11c2UtYWZ0ZXItZnJlZS1v
Zi10aGUtQ09XLnBhdGNoIFwNCj4+ICAgICAgICAgICAgIg0KPj4gU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImQ5YzYwYjJkZDBlYzUyMzI2Y2E2YWIyMGRiMGU0OTBiMWZmNGY1NjZmNTljYTc0MmQ2NTMy
ZTkyNzk1ODc3YmIiDQo+PiANCj4+IC0tDQo+PiAyLjM0LjENCj4+IA0KPj4gDQo+PiAtPS09LT0t
PS09LT0tPS09LT0tPS09LQ0KPj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50
IHRvIHRoaXMgZ3JvdXAuDQo+PiBWaWV3L1JlcGx5IE9ubGluZSAoIzE4MDIyMSk6IGh0dHBzOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMTgwMjIx
DQo+PiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC85
ODM2NjYyNi8xOTk3OTE0DQo+PiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPj4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViIFtyYWoua2hlbUBnbWFpbC5j
b21dDQo+PiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KDQoNCg==


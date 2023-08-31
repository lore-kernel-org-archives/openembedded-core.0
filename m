Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A084C83F2E
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 16:29:19 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.71])
 by mx.groups.io with SMTP id smtpd.web10.2451.1693499349220687899
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Aug 2023 09:29:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=wI2ak1u5;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=wI2ak1u5;
 spf=pass (domain: arm.com, ip: 40.107.104.71, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pgOpPCXoP9iG0nCmGnLGw9zzz7Z3YjPhC1kj+MvPdM=;
 b=wI2ak1u5EDDuDc8YshvmdNWPguhjglG1syFs9PR3BnAGoYnvli1uilhNDE652gkjAOZ2SmEdzirGA2tUKldlwQRL/3YqplQZi+ZV2OUbqmK44sMSYqvmItNpO31fbVqIEo1aLEoKglacCcr04QZTneeZnjZhst79l1wN1VPLJxY=
Received: from AS8P189CA0024.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::29)
 by PAWPR08MB9831.eurprd08.prod.outlook.com (2603:10a6:102:2ee::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Thu, 31 Aug
 2023 16:29:05 +0000
Received: from AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:31f:cafe::f9) by AS8P189CA0024.outlook.office365.com
 (2603:10a6:20b:31f::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22 via Frontend
 Transport; Thu, 31 Aug 2023 16:29:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT017.mail.protection.outlook.com (100.127.140.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.21 via Frontend Transport; Thu, 31 Aug 2023 16:29:04 +0000
Received: ("Tessian outbound 5c548696a0e7:v175"); Thu, 31 Aug 2023 16:29:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d9860bea4412a100
X-CR-MTA-TID: 64aa7808
Received: from 5a09f9e78363.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F751094D-6F25-4A79-9CF5-F6537DF1D168.1;
	Thu, 31 Aug 2023 16:28:57 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5a09f9e78363.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 31 Aug 2023 16:28:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GfgrQRmrz3pQbc35E2WVUhb7X+FLtr1jX05DVl8iHInNVq2HpNXWkgqcH9s5PXi0DZIlKsnBEcdkcKswUYCTl+JgEfivEMRj5azK0JLSX6hfDXScjP/DMb98HS34b/BXIZ3uRQ/wuNCPa1LfIzZa+5fsnG6sgciKnJeFikY6AupnTcHMJMuCYIIKy9v2JEJQEemjp0hu8PAvyuZ8RiQkzJyBznpUrd3eKVfkgJb4OqC3p5I+KzYqY7FJNe+TEqtulb7erXRcwg+LaALvJWOjfYWcDOe3bZg7BsB/85BF58EWcx6M8pMuuGJx9YZSR1QrHUj/F5+hbK1DptFqy5frnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pgOpPCXoP9iG0nCmGnLGw9zzz7Z3YjPhC1kj+MvPdM=;
 b=F6Wh+u/EcRA0aOwilpCP3fMs/d9aWEsTVyztVNUzFhAXneU6xCbR/IP4WQwsqf1z6jx0Iixka6hEAgo6CQwxD4QnhuUCSIDL9QROp+MnUD7FrWlVLRIjixiKu9dErogwGli4esMjotgHwq9e+Ra1eRRO4fKew+x1Pa67fONa1h5L7iQQlb9H6hhiRV/iinRuj0y3FQzPcRWI9yu39AhT8kxagRmbe7ENiXvEtQKtKoPEfgUErqHO+Wl9xKl3pyauRBoSVPf0UCpFSoNQr/I9ve1cebOE8p0QgTG/431a3Lwri4q38hG8aTAlUaYOMQfBRyjQHAxG/OTFpCarcJwsjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pgOpPCXoP9iG0nCmGnLGw9zzz7Z3YjPhC1kj+MvPdM=;
 b=wI2ak1u5EDDuDc8YshvmdNWPguhjglG1syFs9PR3BnAGoYnvli1uilhNDE652gkjAOZ2SmEdzirGA2tUKldlwQRL/3YqplQZi+ZV2OUbqmK44sMSYqvmItNpO31fbVqIEo1aLEoKglacCcr04QZTneeZnjZhst79l1wN1VPLJxY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU2PR08MB10087.eurprd08.prod.outlook.com (2603:10a6:10:491::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Thu, 31 Aug
 2023 16:28:54 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6745.021; Thu, 31 Aug 2023
 16:28:54 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, nd <nd@arm.com>
Subject: Re: [OE-core] [PATCH 2/2] glib-networking: use gnutls backend for TLS
 sockets
Thread-Topic: [OE-core] [PATCH 2/2] glib-networking: use gnutls backend for
 TLS sockets
Thread-Index: AQHZ2/JbsHtUl4O5F0i2i1UUDcaH6LAEmBeAgAAAboA=
Date: Thu, 31 Aug 2023 16:28:54 +0000
Message-ID: <9A6118FB-20AD-421D-AE1D-0ECA08BC4664@arm.com>
References: <20230831100243.3946833-1-ross.burton@arm.com>
 <20230831100243.3946833-2-ross.burton@arm.com>
 <f71f323b-fa43-450c-9d76-bc96978a5bb0@gmail.com>
In-Reply-To: <f71f323b-fa43-450c-9d76-bc96978a5bb0@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU2PR08MB10087:EE_|AM7EUR03FT017:EE_|PAWPR08MB9831:EE_
X-MS-Office365-Filtering-Correlation-Id: 8be83e23-ce1c-4003-c185-08dbaa3f643d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 SXS1R9NMvF0oH4ddCEyfNJeRDNF48RLm5qEldd3QWAQQ9OOsyqrI00cJ4ChQJpHc0jy8CawYF7LIaPWMl1cKynStuID3zx1OxipSKiLAgXWTVhqa5Rgybg2bY32mpfa07WZXid8VUWzld9Jlffb05d3eF88ElrStrAXYJ3bzdjjv5XqFnp2Or0Rd0LBZR50+j2Gxw+eSGOIyj4U8+/bZ068ZjNo8nNaYK8QWp6mOqroaSRfzZD1mYUUE/beAiBFghr3Dt8NNJ++p9dnQnoCT8wqqz6dqOkE3fEaANj0zUBAacnVDE66OrfTMRnypdRaJBmtz4E/scXemutfqz5zjpOJYmhJ2yAAelVr+erZKilDtNtXIu/nLjk3S8EHnw7G0b6dMRquj06YK+dKFCkbdfLa8e2HPUKKSt2oWXL05+9KYHWfPGyyL0uvPD1kPlZSxJbdrn8DACVAxhqpb71X5UrsJV/7E02cP5XA/z/KSagUiCmgJEIPUBUwHPHKVbh9zt6dGe04bJobk5u6YRHn1m1MVZ1ozeFS9dWTMKWsu21B1SiKAV4D9I2o7TGb+ZOPsMZSHp3/Mju/892Xf8QR9GlBgnyUG/X43OreKA9a9QhOFRi1UTPxpZxJAtgwit4C+ymWTi+FSYMV9qi+FtQTLvw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(396003)(39860400002)(346002)(451199024)(1800799009)(186009)(8936002)(36756003)(6512007)(86362001)(966005)(478600001)(33656002)(66446008)(66476007)(6506007)(64756008)(53546011)(6486002)(54906003)(41300700001)(316002)(76116006)(66946007)(66556008)(71200400001)(6916009)(5660300002)(91956017)(4326008)(2616005)(8676002)(26005)(83380400001)(2906002)(38070700005)(38100700002)(66899024)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C5C8338985F2B244B30A05685C031155@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10087
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	60c2f75e-0e69-41c3-98b0-08dbaa3f5e3f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EsYnTm1P+GdOFxG/GvR1y1KDeeANWpFI7v1MUZCd4rf2zAJUfKcLmilOKr7ygcHwVNQtfAUWkF20KC6NOY6TJfDy1fKjmBxB9/IhQmG+Rdm7oBqqZbgLCjBGG3TlVgGBMwwu63uRdsUVCoOH8dtmvafc4x/Ctmujk/IXHF3my1MW7Rjtc1kycmzsINfgzDJnh//UmaEe6l7d+oE7sBrHLorUiohrXN43zoNa/1mRl5DqF/MClyV06mmZLoYLsyFx0xth3VhGvBsgSlQ30nNKA3mSBmkfJhu1VSfk3G6jX+VSMoERKXeAvWJ0ufuv1gJfmehWoKewf+nN3Ja3DAFDzCJGFzWALVlvWqLnIj0HiR5Y3KVptnaC0hn7sxN87mDiqdJ/VEg6KID6hdPnLTlh8uWTjb3oMxtEfwLltHmyf4yGtZZkXicwsJAt1HTnklL6GLGWxJqsSORWlp5XXoel9O3JpmgMFxKhvRYwM21140i2lCjOJFR4yx3XqKOAPr3n7R51IgDCjfTHarBmpkm3nSnkOAt7HGVjqRjTZLr7quf+CNTfuJ6nB5KAxQ4eZikWxl2Wq/vp2Egg+smZMJ9I4TWJZPAQX3pY7bPAbFUUfQYqgkzP/4T5qeQV4uO54m6isYseuQfAjvK7ttrWKA+Y9aKZ7fOo2lsGveGLPdNlmdz/4l2v0h0s5lF0uBKi0Ynht0id/AkLVlg1qQTccQ6Wjmep/RVtA1VDay995IEZVgQ=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(396003)(346002)(136003)(1800799009)(186009)(451199024)(82310400011)(36840700001)(40470700004)(46966006)(82740400003)(66899024)(356005)(6506007)(6512007)(6486002)(40460700003)(36756003)(33656002)(86362001)(36860700001)(81166007)(40480700001)(47076005)(2616005)(2906002)(336012)(26005)(966005)(53546011)(83380400001)(478600001)(70586007)(70206006)(8936002)(6862004)(8676002)(4326008)(5660300002)(54906003)(41300700001)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 16:29:04.3862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be83e23-ce1c-4003-c185-08dbaa3f643d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9831
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 16:29:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186981

T24gMzEgQXVnIDIwMjMsIGF0IDE3OjI3LCBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPiB3
cm90ZToNCj4gDQo+IE9uIDgvMzEvMjMgMzowMiBBTSwgUm9zcyBCdXJ0b24gd3JvdGU6DQo+PiBG
cm9tOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4NCj4+IEFzIHBlciB1cHN0cmVh
bToNCj4+ICAgVGhlcmUgYXJlIGhhY2tzIGluIGhhbGYgdGhlIHRlc3RzIHdoZXJlIHRoaXMgYmFj
a2VuZCBkb2Vzbid0IHJldHVybg0KPj4gICB0aGUgZXhwZWN0ZWQgZXJyb3IgY29kZSBvciBkb2Vz
bid0IHdvcmsgYXMgZXhwZWN0ZWQuIEkgZG8gaG9wZSB0bw0KPj4gICBlbmFibGUgdGhpcyBiYWNr
ZW5kIGJ5IGRlZmF1bHQgaW4gdGhlIGZ1dHVyZS4gRm9yIG5vdywgaXQncyBub3QgdGhlcmUNCj4+
ICAgeWV0Lg0KPj4gaHR0cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL2dsaWItbmV0d29ya2lu
Zy8tL2NvbW1pdC84ZTFkODBjMWUwZmM1MmQxN2QwOGEyMTk0NmZhNGE4NmVjMzBlMWRiDQo+PiBT
aWduZWQtb2ZmLWJ5OiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4NCj4+IC0tLQ0K
Pj4gIG1ldGEvcmVjaXBlcy1jb3JlL2dsaWItbmV0d29ya2luZy9nbGliLW5ldHdvcmtpbmdfMi43
Ni4xLmJiIHwgMiArLQ0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQ0KPj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItbmV0d29ya2lu
Zy9nbGliLW5ldHdvcmtpbmdfMi43Ni4xLmJiIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi1uZXR3
b3JraW5nL2dsaWItbmV0d29ya2luZ18yLjc2LjEuYmINCj4+IGluZGV4IDY2YjZhNzhhNTMxLi5l
ZDE2MjU2MTdlNiAxMDA2NDQNCj4+IC0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItbmV0d29y
a2luZy9nbGliLW5ldHdvcmtpbmdfMi43Ni4xLmJiDQo+PiArKysgYi9tZXRhL3JlY2lwZXMtY29y
ZS9nbGliLW5ldHdvcmtpbmcvZ2xpYi1uZXR3b3JraW5nXzIuNzYuMS5iYg0KPj4gQEAgLTE2LDcg
KzE2LDcgQEAgREVQRU5EUyA9ICJnbGliLTIuMC1uYXRpdmUgZ2xpYi0yLjAiDQo+PiAgICBTUkNf
VVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICI1YzY5OGE5OTk0ZGRlNTFlZmRmYjEwMjZhNTY2OThh
MjIxZDYyNTBlODlkYzUwZWJjZGRkYTdiODE0ODBhNDJiIg0KPj4gIC1QQUNLQUdFQ09ORklHID8/
PSAib3BlbnNzbCBlbnZpcm9ubWVudCAke0BiYi51dGlscy5jb250YWlucygnUFRFU1RfRU5BQkxF
RCcsICcxJywgJ3Rlc3RzJywgJycsIGQpfSINCj4+ICtQQUNLQUdFQ09ORklHID8/PSAiZ251dGxz
IGVudmlyb25tZW50ICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdQVEVTVF9FTkFCTEVEJywgJzEnLCAn
dGVzdHMnLCAnJywgZCl9Ig0KPj4gDQo+IA0KPiB0aGlzIGlzIHNhZC4gQXJlIHdlIHJ1bm5pbmcg
aW50byB2aXNpYmxlIGlzc3VlcyB3aXRoIE9FIGlmIHdlIHVzZSBvcGVuc3NsIFRMUyBpbXBsZW1l
bnRhdGlvbi4NCg0KVmlzaWJsZSBpc3N1ZXM/IE5vLiAgQnV0IHRoZSBnbGliLW5ldHdvcmtpbmcg
bWFpbnRhaW5lcnMgZXhwbGljaXRseSBzYXkgdGhlIG9wZW5zc2wgYmFja2VuZCBpcyBub3QgYXMg
ZnVuY3Rpb25hbCBhbmQga25vd24gdG8gYmUgYnVnZ2llciB0aGFuIHRoZSBnbnV0bHMgYmFja2Vu
ZC4NCg0KSWYgeW91IHdhbnQgdG8gdXNlIHRoZSBvcGVuc3NsIGJhY2tlbmQgdGhlbiB5b3XigJly
ZSB3ZWxjb21lIHRvIHN3aXRjaCBiYWNrLCBidXQgSSB0aGluayB0aGUgZGVmYXVsdCBzaG91bGQg
cmVzcGVjdCB0aGUgd2lsbCBvZiB0aGUgYXV0aG9ycyB1bmxlc3Mgd2UgaGF2ZSBhIGdvb2QgYXJn
dW1lbnQgb3RoZXJ3aXNlLg0KDQpSb3Nz


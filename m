Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5DD1C4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 15:02:28 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.79])
 by mx.groups.io with SMTP id smtpd.web11.48821.1669388547091723026
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Nov 2022 07:02:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Mk6Axy8P;
 spf=pass (domain: arm.com, ip: 40.107.8.79, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNmkULsGEqKngq41IGHBDRjNQbBeozDSKaXVDLBBGx4=;
 b=Mk6Axy8P9qOvdh6at9sy2MamEtGqHITv8L0OeD/Mc/VphxKBNjSVM3lwXhyiGXQZLRdeukxoX7dc/2EHJlQ0dZXz3xPzPezvOes4MJSr/awZBQvtMoqHW4pVvM+RFbWjh+VR6SttE0RxiE8qboqX6a7vvv+IZ7IV8PffkRxHuLg=
Received: from FR3P281CA0126.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:94::16)
 by AS4PR08MB8071.eurprd08.prod.outlook.com (2603:10a6:20b:58a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Fri, 25 Nov
 2022 15:02:22 +0000
Received: from VI1EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:94:cafe::ac) by FR3P281CA0126.outlook.office365.com
 (2603:10a6:d10:94::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20 via Frontend
 Transport; Fri, 25 Nov 2022 15:02:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT024.mail.protection.outlook.com (100.127.145.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.18 via Frontend Transport; Fri, 25 Nov 2022 15:02:22 +0000
Received: ("Tessian outbound 73ab5f36653e:v130"); Fri, 25 Nov 2022 15:02:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 49d2c379aecb5f10
X-CR-MTA-TID: 64aa7808
Received: from f775d7cc310f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FD3BAAF0-C0C9-4215-A220-F07098520BB1.1;
	Fri, 25 Nov 2022 15:02:15 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f775d7cc310f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 25 Nov 2022 15:02:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nUV1/3RzMQrVfYgisF6ALX8Eba2ujIf4vfUnzFDPfPFgcTffVXZ2FYlr7tVl650bHOi1Gc6ZcdDiaShHGaDhRnEq6EldKQbw5CnYW4mnZAPmBFDIUAutbeWz6I/PywTXwI91Fyo828SOpuOjKNdRJLUso93H1L6K/cFn4rf6RCcXPuCZWA83uXYUuf518e4pmZyi7cCFz5p8jU859KlalqHlk0L4k9wxM+v9h1LdzQLXzr1VgBEwkmH8WZYztPOJtpwPDkeHcMRNZiNUs7dIXWf1oQ3y1h7uHYsJiuYHU2B7GGXDndxnDaoV5VQjVm2r3CpR9R9rGIAtn6cFHXQu4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CNmkULsGEqKngq41IGHBDRjNQbBeozDSKaXVDLBBGx4=;
 b=Ck3j8ZR7z+Zdvmx4GO19SdBgYxtpFG9JQ6A090wufJWyO3z7u6zfk1tyHK3zkrY++PJomSGuEeJiY1SeFQK1w13RSTZuE0sYqWC0+sbdzJmAXVJvq5GUtgAY14vLpRm6ud66GiVZhbyyRCK1FQhcDdRn65kVWWECvOlDVmhFSGDb7DIULg3OBKvEFHmb89gxdazVmL7Drmftye7okXG9aUc7ve+Q0yh+52jtoOW7P/PCX02CO1Xj8QHDkXy83P3cwtlQw4o3ZoN9WKWHE5UM1Dxjx358pHKBZaZtH01U5ekyWYUm+Mg6jyMGY7TdqABli8V4uGtjqCHd2HEJ5u9x1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CNmkULsGEqKngq41IGHBDRjNQbBeozDSKaXVDLBBGx4=;
 b=Mk6Axy8P9qOvdh6at9sy2MamEtGqHITv8L0OeD/Mc/VphxKBNjSVM3lwXhyiGXQZLRdeukxoX7dc/2EHJlQ0dZXz3xPzPezvOes4MJSr/awZBQvtMoqHW4pVvM+RFbWjh+VR6SttE0RxiE8qboqX6a7vvv+IZ7IV8PffkRxHuLg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PR3PR08MB5740.eurprd08.prod.outlook.com (2603:10a6:102:87::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Fri, 25 Nov
 2022 15:02:13 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119%9]) with mapi id 15.20.5880.005; Fri, 25 Nov 2022
 15:02:13 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "hws@denx.de" <hws@denx.de>
CC: Openembedded Core <openembedded-core@lists.openembedded.org>, Martin Jansa
	<martin.jansa@gmail.com>
Subject: Re: [OE-core] [PATCH] opkg: Set correct info_dir and status_file in
 opkg.conf
Thread-Topic: [OE-core] [PATCH] opkg: Set correct info_dir and status_file in
 opkg.conf
Thread-Index: AQHY//MKKIxJCf+UTkShsVgHBh4X9K5PvdkA
Date: Fri, 25 Nov 2022 15:02:13 +0000
Message-ID: <B6018CD1-6FAD-4DD1-B504-DA3E0EAD8DBB@arm.com>
References: <20221124105259.130383-1-hws@denx.de>
In-Reply-To: <20221124105259.130383-1-hws@denx.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PR3PR08MB5740:EE_|VI1EUR03FT024:EE_|AS4PR08MB8071:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f5d4f0f-3c75-40f0-cdcd-08dacef60e29
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 uPhDkobFaOOYw22paFoqYO001mfR4QbeuZoHdMuOhE4Vu/NjXf+ELJ+m5YMAHvCUSINNqs/NmCfPKJrX7WsyM3XSe646B4Zo2K3EYlSYo79VSj/HK6cKI+3k5khAZJFiA3PWgZMn1ex5lZ6HIyZaLPGgoKkdUIqCJEbLAzyMyoXqJC+qcRCd/jyItvtUx7LgaptfBrxvO6q/YCdenWjfe5vDneIjkJTW6mrhEftrVC2tuB7wCtm4rlERfZPrCngJJSFnFyUm58ZXEl8BwH/3diUi2ekhdPyQJjjromnKtieXbqFAkkRdqyrdElP8VELqPHvVa+1tjoXW5Z/myfZ1u6BrFmITBJUM7uBshXOr6OzIf45DZK2z0t8Y8ANfOkezkFmT+Cf8za9iWw7lGwB//R944H6BcEUykYjRV3CjMEPvDl+JAkGn2uYWx+FBTn9De10xGZ5GgUEJPK6jcN6yMMTap+1s/WJAxNfgT//+P4asGiSHw8h6AvBUVOc6MJFHK4bUwi4c13t/wz/oWJwiix8cd3vK8AEjXNuDXVgBe0MrKqWDY8bnPIbqhKUd05zV1t1Andl5FG4PFGdal8XY3xnbWqdp9pKg7lPEwFklrBNYdWY7tiOThBQJOLoRgIEj3Z1fjGtClS41hspo3iPxVK0ippKKLRQqvsfJJ0v9pL/DMw3aGe1BRCqfUlb1RW/5lpEPsi4AAwdIQCy0kHKY5XPa+FrAZhU2gnI3Po66dhTX8kBkW6MSzl8kOvcwbrOY
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(376002)(346002)(396003)(136003)(451199015)(122000001)(38100700002)(6916009)(53546011)(316002)(2906002)(26005)(66899015)(5660300002)(41300700001)(8936002)(86362001)(6506007)(36756003)(6512007)(966005)(8676002)(66476007)(6486002)(66446008)(66946007)(76116006)(38070700005)(64756008)(91956017)(4326008)(66556008)(71200400001)(83380400001)(33656002)(478600001)(2616005)(186003)(54906003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <820E52F97AF02C47A5399DF47D81C1ED@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5740
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c3bf8e93-a7b0-4189-98d9-08dacef608fa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JvHCVDuaZFttjeovzYg3B9fXZovtNHS1h7PdDb2cJSCNjJdl4Q57CBqQf1FJVojm3Fxleaccn+fpxLjNOivLkhm8M2tpccENIFI+BUNVEusSGWSyyMzwT2b/SZmUvOtiAiNM/3A4sR6y9HVsJb5ehwqP63NcM23TU+W0/38SnDBR9TOeIBI60mYBQQ8CVG/zzw+3rUxjAbLMSAoI4s3A2Dj97kkxXQwFclciEfz8Yd35TevbiCqGQy09TAMh+Lrv3QeZCGMid0RInsuD5INa/uBjdsCv3DbVp7Mk47Kx1srZSOWykk7A7OP4XIHNeV5Bcsk7RP+qJ3LFzsVCe5h6yHikdWJuqr56emtFBrVaqlCVzYwwf3JIh/TZWvKvvM6kpVhx2T+AKfwyyAqmwvmVjTbEbapU9jPbhM4BBZbcPawk8PRycsd8Z0Jnz2uLiM4YdfLDZ5jQgk66HDANADzHAuHuaLIHY/eYPx9OtXwq4Smqbk0N2SjDaU9ci5FEVmFCUfUHJ7PZZ6VFO5Q+Mk2rojo22PZ1eZPCwIwVew+qvhb+enMv81QfUZ1OGOcVCVMDKbGSpyt9ta+zhwF0Dx9tb2vUAilk2SMgrAlsvHcfF3jX/N0sRVXXxSwww1tV42BXUa7tV3cejBOA+lHZ8TIvz0wzxsvk1Z+t7yTSH3chDCQzYZDkIScjIXG6FOf0nsKCZTpLz97pg8dKF+ZQG89vccztKycBDrAMorh9MZAYhp0=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(136003)(396003)(451199015)(46966006)(36840700001)(40470700004)(478600001)(966005)(6486002)(47076005)(186003)(81166007)(83380400001)(336012)(356005)(40480700001)(2616005)(33656002)(36756003)(6506007)(107886003)(86362001)(36860700001)(82310400005)(6512007)(53546011)(66899015)(2906002)(26005)(5660300002)(316002)(41300700001)(40460700003)(54906003)(82740400003)(70206006)(8936002)(6862004)(8676002)(70586007)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 15:02:22.0150
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f5d4f0f-3c75-40f0-cdcd-08dacef60e29
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 15:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173770

V2XigJl2ZSBoYWQgb3BrZyAwLjYuMCBpbiBtYXN0ZXIgc2luY2UgSnVuZSwgc28gY2FuIHlvdSBy
ZWJhc2UgdG8gY3VycmVudCBtYXN0ZXIgYW5kIHJlc2VuZD8NCg0KVGhhbmtzLA0KUm9zcw0KDQo+
IE9uIDI0IE5vdiAyMDIyLCBhdCAxMDo1MiwgSGFyYWxkIFNlaWxlciB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8aHdzPWRlbnguZGVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+
IA0KPiBEaXN0cm9zIGNhbiBjdXN0b21pemUgdGhlIGxvY2F0aW9uIG9mIE9QS0cgZGF0YSB1c2lu
ZyBPUEtHTElCRElSLiAgSW4NCj4gT0UtQ29yZSBjb21taXQgMTFmMTk1NmNmNWQ3ICgicGFja2Fn
ZV9tYW5hZ2VyLnB5OiBkZWZpbmUgaW5mb19kaXIgYW5kDQo+IHN0YXR1c19maWxlIHdoZW4gT1BL
R0xJQkRJUiBpc24ndCB0aGUgZGVmYXVsdCIpLCBhIGZpeCB3YXMgYXBwbGllZCB0bw0KPiBjb3Jy
ZWN0bHkgc2V0IHRoZSBpbmZvX2RpciBhbmQgc3RhdHVzX2ZpbGUgb3B0aW9ucyByZWxhdGl2ZSB0
bw0KPiBPUEtHTElCRElSLg0KPiANCj4gSG93ZXZlciwgYXMgdGhlIGNvbW1pdCBtZXNzYWdlIG5v
dGVzLCB0aGUgb3BrZy5jb25mIGZpbGUgZGVwbG95ZWQgYXMNCj4gcGFydCBvZiB0aGUgb3BrZyBw
YWNrYWdlIG11c3QgYWxzbyBiZSBhZGp1c3RlZCB0byBjb3JyZWN0bHkgcmVmbGVjdCB0aGUNCj4g
Y2hhbmdlZCBsb2NhdGlvbi4gIE90aGVyd2lzZSwgb3BrZyBydW5uaW5nIGluc2lkZSB0aGUgaW1h
Z2UgY2Fubm90IGZpbmQNCj4gaXRzIGRhdGEuDQo+IA0KPiBGaXggdGhpcyBieSBhbHNvIHNldHRp
bmcgdGhlIGluZm9fZGlyIGFuZCBzdGF0dXNfZmlsZSBvcHRpb25zIGluDQo+IG9wa2cuY29uZiB0
byB0aGUgY29ycmVjdCBsb2NhdGlvbiByZWxhdGl2ZSB0byBPUEtHTElCRElSLg0KPiANCj4gRml4
ZXM6IDExZjE5NTZjZjVkNyAoInBhY2thZ2VfbWFuYWdlci5weTogZGVmaW5lIGluZm9fZGlyIGFu
ZCBzdGF0dXNfZmlsZSB3aGVuIE9QS0dMSUJESVIgaXNuJ3QgdGhlIGRlZmF1bHQiKQ0KPiBTaWdu
ZWQtb2ZmLWJ5OiBIYXJhbGQgU2VpbGVyIDxod3NAZGVueC5kZT4NCj4gLS0tDQo+IG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9vcGtnL29wa2dfMC41LjAuYmIgfCA0ICsrKy0NCj4gMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9vcGtnL29wa2dfMC41LjAuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvb3BrZy9vcGtnXzAuNS4wLmJiDQo+IGluZGV4IGU5MWQ3MjUwYmMuLjdiZGRhYTMwMTYg
MTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9vcGtnL29wa2dfMC41LjAuYmIN
Cj4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL29wa2cvb3BrZ18wLjUuMC5iYg0KPiBAQCAt
NDYsNyArNDYsOSBAQCBFWFRSQV9PRUNPTkY6Y2xhc3MtbmF0aXZlID0gIi0tbG9jYWxzdGF0ZWRp
cj0vJHtAb3MucGF0aC5yZWxwYXRoKCcke2xvY2Fsc3RhdGVkaQ0KPiBkb19pbnN0YWxsOmFwcGVu
ZCAoKSB7DQo+IGluc3RhbGwgLWQgJHtEfSR7c3lzY29uZmRpcn0vb3BrZw0KPiBpbnN0YWxsIC1t
IDA2NDQgJHtXT1JLRElSfS9vcGtnLmNvbmYgJHtEfSR7c3lzY29uZmRpcn0vb3BrZy9vcGtnLmNv
bmYNCj4gLSBlY2hvICJvcHRpb24gbGlzdHNfZGlyICR7T1BLR0xJQkRJUn0vb3BrZy9saXN0cyIg
Pj4ke0R9JHtzeXNjb25mZGlyfS9vcGtnL29wa2cuY29uZg0KPiArIGVjaG8gIm9wdGlvbiBsaXN0
c19kaXIgICAke09QS0dMSUJESVJ9L29wa2cvbGlzdHMiICA+PiR7RH0ke3N5c2NvbmZkaXJ9L29w
a2cvb3BrZy5jb25mDQo+ICsgZWNobyAib3B0aW9uIGluZm9fZGlyICAgICR7T1BLR0xJQkRJUn0v
b3BrZy9pbmZvIiAgID4+JHtEfSR7c3lzY29uZmRpcn0vb3BrZy9vcGtnLmNvbmYNCj4gKyBlY2hv
ICJvcHRpb24gc3RhdHVzX2ZpbGUgJHtPUEtHTElCRElSfS9vcGtnL3N0YXR1cyIgPj4ke0R9JHtz
eXNjb25mZGlyfS9vcGtnL29wa2cuY29uZg0KPiANCj4gIyBXZSBuZWVkIHRvIGNyZWF0ZSB0aGUg
bG9jayBkaXJlY3RvcnkNCj4gaW5zdGFsbCAtZCAke0R9JHtPUEtHTElCRElSfS9vcGtnDQo+IC0t
IA0KPiAyLjM4LjENCj4gDQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczog
WW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBs
eSBPbmxpbmUgKCMxNzM3NDApOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVu
ZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE3Mzc0MA0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC85NTIzNTU5Mi82ODc1ODg4DQo+IEdyb3VwIE93bmVy
OiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vi
c2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29y
ZS91bnN1YiBbcm9zcy5idXJ0b25AYXJtLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0N
Cj4gDQoNCg==


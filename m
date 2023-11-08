Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD52CC4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 15:22:07 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.137])
 by mx.groups.io with SMTP id smtpd.web11.16556.1699456919414425952
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 07:22:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nedap.com header.s=selector2 header.b=gV7jxAxO;
 spf=pass (domain: nedap.com, ip: 40.107.8.137, mailfrom: jermain.horsman@nedap.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCb8FDReKax1E7JHM3o8VxkUcdGDMZ1AS0HEpJLMRk+iubU4GcCKnml8Tkl4gm8C/MP0Q086nTtTkG6Ft4TWEne8kQY9uLz3ESr2ax3lcQfCufGyyB1KLou8vuLr208qj+XHMFgxIKKZCx0R+SutPpZPwz5j2iCa88w3z91LB0+XIm7XNoYN1zhY6udAR0PXi78e3CBiXOPOPYlyxMQAuaCMsBS6Gqsz+2ZOUKM3JDlJfuvfPYgRbmVDhI01/tRzmw+KZD0IjDIfwYlREBYjE7aKZXtHTjhd4jat9ERTG4rczPkcvHCn0h8iq6645JBW6/0F2uQmxBNiUFuYv5PPnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3AK5tbB6WoXuTBAvuf/Yy61LPengIGWew4PLTfz+f7g=;
 b=PCX9f93otmi8EYP5S3Q9poUixnUGnh41xH1ixqY+VRbdO54GeOwXfRCrvnQDHbfpZjAtufuj2Ll0mi7iTqgxXh+X25+kbv3cjNWKhuCXGk6iu6WQ82/p8Aw53t3O/mkLPr5Ru2oxsksqxV1cqqMg38e+k6sjJsb1oHKxePfqPU2r6ZA5XOZQEg7OpOw96MAh+fdZsO3bK5O0MDUIDWsqniB07FdBwQruDjje4pYWpLAOPdzaMCxLGZe7bUW+vpZu/nmF18AoMs2iUbUB8aoPAbZ6tv4NqQA1D8snkgROx8+THJ+kjKkNf0gYZCijsN8GslmVt0IZsyPTZCxToUP7rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nedap.com; dmarc=pass action=none header.from=nedap.com;
 dkim=pass header.d=nedap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nedap.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3AK5tbB6WoXuTBAvuf/Yy61LPengIGWew4PLTfz+f7g=;
 b=gV7jxAxOV2jwyew77FrQru3hNIPbQK16uteOEKwgT/QoO/YxS67t5gxqOV3QOzM7vDnogao2B2spK34/3YSHBGdDg1mBtShI1eZfJ9pOZ3ZSN4BsMsYSVUlVa5NrnZVIMCpvxk25+6XclAID7/V3khxL5TeSLVJZxJ2vVvlmguw=
Received: from VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:137::14)
 by AS5PR10MB8102.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:673::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Wed, 8 Nov
 2023 15:21:56 +0000
Received: from VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ba10:eb74:e945:d470]) by VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ba10:eb74:e945:d470%6]) with mapi id 15.20.6954.029; Wed, 8 Nov 2023
 15:21:55 +0000
From: Jermain Horsman <jermain.horsman@nedap.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: RE: [OE-core] [RFC 3/7] bitbake-layers: Add ability to update layer
 repository configuration
Thread-Topic: [OE-core] [RFC 3/7] bitbake-layers: Add ability to update layer
 repository configuration
Thread-Index: AQHaEY752IQ//CJVWEKvlbGM2M/8OLBwPHUAgABKTmA=
Date: Wed, 8 Nov 2023 15:21:55 +0000
Message-ID: 
 <VI1PR10MB318254B843785AEB44CA9393F7A8A@VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM>
References: <20231107152641.1043-2-jermain.horsman@nedap.com>
 <20231107152641.1043-5-jermain.horsman@nedap.com>
 <CANNYZj8_gtZxzuUiAuu=ykJ05xK=cYqi9-D9697Zfiee5rU7Vw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8_gtZxzuUiAuu=ykJ05xK=cYqi9-D9697Zfiee5rU7Vw@mail.gmail.com>
Accept-Language: nl-NL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nedap.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR10MB3182:EE_|AS5PR10MB8102:EE_
x-ms-office365-filtering-correlation-id: c51f5e3c-244a-42e2-9186-08dbe06e7172
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 zuMc3I3IhGMCIHhMSuAYWuRfxWbzTMxliFsf9v/o35oe6l9SvVKlPzApcfrY6qm9eRjYjk2PBI1o9yXS6zeDXv7FJZj58LBql0bgTwZ6ttfMhAchb2VDJ4ge4BiUmY7/2/FR4BdBHt4XZaoQgbb1p2Uh5Y4UDNgb8MrkZVTvVjuoeeKrntSTdja8Hs/vrIvpV6bNco1LTdjthy1lX+hvxHam6Q5v4dKxkSDsILg50RC8F04BWqEO5DM92GYnLSseoysTTxOACsN/7jYCytLk6O5SOwPLqDR1QLpenaGQC+EbM97Ufm+av9Z/0Ysvm60qBBU74FEwbGEsdKziE3QKsORlkQfEBcnxo6TON7pWTjjtvIFZGphw2vg1+71fhpV8coTD4ebBCrDefAb1AMpqP4CLgSX02Vzj425/xkibQoD2u6whoQX45q6bChyDVGF4auo/jJMsZq17IcnYDhgG37AhJ8DI0uaaETVs/4CoZ4EIOwtaqKtIidULO4qQbX3JQwO0Hcp8Cvv2TcOJq45IholRxG8MAIspIYy6LgoDVv1sFcHKaLxsKko7V/o4h46AZAQh7En+K7pz77mhdW2lXBC6Sn631HGG0iAPKneEiid5tv2/++OH3yPR+AuEc568
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(136003)(376002)(366004)(346002)(396003)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(55016003)(2906002)(4326008)(8676002)(8936002)(15650500001)(83380400001)(86362001)(38100700002)(4744005)(33656002)(5660300002)(41300700001)(9686003)(122000001)(52536014)(44832011)(316002)(6506007)(66446008)(66556008)(54906003)(66476007)(66946007)(76116006)(6916009)(64756008)(7696005)(71200400001)(38070700009)(26005)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Yk1pTmk5cStZY0pmRkxmNWJHbjVCTy9IbDBKdld1QWNoL3ZMa28xUkVaRXY4?=
 =?utf-8?B?UTNYQWdXU1B4UC90cG5Ddnd2emdrR0phQW5xZGtkT1hyeUZ0VEF1VUtoNzNQ?=
 =?utf-8?B?bGpzM1N0OGNtZkFTS09Qc0V4VW5NN0NXblJQRXVMQTFObzRYMHZhVTBnbDZL?=
 =?utf-8?B?R01ieXhtSEpSNzRZdHhpWFg2MDZhN0xmTVZUM016a2xkYlZOVFhZdHpBSm5W?=
 =?utf-8?B?K0dQUlIyUnpXa3B4U1R4U2RGT2RNdER1VzNqcFRRQ2c3OS9ONlNwRDNCNUR5?=
 =?utf-8?B?djZHbU94bWI3Y0tobXo0YmI3Y3ZodFJRU3Q4dkpmUVh0aWozdE9LVnpiVkxI?=
 =?utf-8?B?K0s3TjZqZUFLcDNDR0ZlR3ZscTI4c1gvN1lpRkhZWGtacXVFcXB4OTlFWVFm?=
 =?utf-8?B?Y0ZjMDd4cE4rWGJYbkJ2V1RZY2VCc2wreFV6R3k3dkxLZDNaS1pvYTgwNGFh?=
 =?utf-8?B?VTl6RjBVRVhvanpTUFdrTmFoSnhMbk1JS09jOHBVc1hvK3B2Z1p1dmRPb1BT?=
 =?utf-8?B?OWpUWmlMQk9rYnFIWEhrN0ZJZDVGQ3ZmN2RyUHRkWk4yaXFEQmV4Znp5L1VC?=
 =?utf-8?B?Y1NSdzBiZmp0TVZRNG5xMGVEVkgvWG1SalNZKzFkS3AwRisrbG5Falgza0VW?=
 =?utf-8?B?Q1hjcEwrdmFuWHczbTFxTXltalZOWkNiMVN0M0QveXNIc0xwcWJtWUw4ZnZu?=
 =?utf-8?B?SUoyaXJXamdhMkxWeUNuRG5YcklzSVFpVDdTdmw1b0xjNUFZbW9WV1l1dDhn?=
 =?utf-8?B?bUMzNzdIODUzNlZDNkN1QzM3M01MZk94NFRaRmw3TThpLzhqSE8xb1JVbFhH?=
 =?utf-8?B?Mnk3R01JUjRNVEVxTzFZSXJ0VTBNeEVEQW9pUG5mQTJhYU5HOXVFeGxJbE96?=
 =?utf-8?B?UFNmVDhTU0t0c1djZGNSNlZtRUZsbGRlREpRNktoTXpsdUVLRjdBNHVtbHd4?=
 =?utf-8?B?N1J3S3pnaW9nbWpHZllQRHNocEEwNjJRTzE2NzNzU3pYTFhnQy9hOGt4dHc1?=
 =?utf-8?B?bjJYZHhuQ0F3SDh5b3dpanJjT2dVdWFEM2p2MVNYUG9EcVRIckFZS1ZZSHl6?=
 =?utf-8?B?dHRqdjY4a04rVjhob3h3aUYxU0orUU1aRUE5Tnh5NmdIL0djUzhjTlF3cUdL?=
 =?utf-8?B?VE9NbUhRS1NhcVBuc1A4VEQ5NXBsZUJSUHM4dWVPOWdMUzk5ZmI2citEL0Yy?=
 =?utf-8?B?VlprTmIrbDhIZ3ZvR2RaYlJNZkVIS2xIVG5TR0tEWGxpTmljS3paRnJTMHRt?=
 =?utf-8?B?TnpHT0h1QU9mV3FhUEx5U1hqNVIzZWpRZW1IeVM0ZTRZamE0UVk0YVM1aGZL?=
 =?utf-8?B?WW9aQXdJQ2Q1RlNxSUVoV1F1WUxCbnJVT3hXU09GZFVoUE1pSlB1SzlOYTI0?=
 =?utf-8?B?SzcyOGhGVmpNN0xOQUgzY05TL0lSOGRDQkI3NHhJK21RenMzbEY3RFRVY1JP?=
 =?utf-8?B?M1FGKy9HWTVoK2Zoc3JCaFY4UUkyTzIwNEY3aWp2aGZCRFNHY2hidGNLS0xr?=
 =?utf-8?B?TDNVdHBiNGNXRWVCZ1NDZnkwaE5wNDlMUk4xYW45My9hWVhOSTZjNUpRcG4y?=
 =?utf-8?B?UXNFRW1JYzJEaXF0UnFSU0paRUoxUDFmYVFWNzNYVFNsbHVZNktGVWEvVWRD?=
 =?utf-8?B?OFYyOW1HQlpUYzNoL3lHRFRYNkVyNk9YVE1ocGgvQVBJb3ZDWUhSTGNVaDRt?=
 =?utf-8?B?VDdRT3h0Uk1pRmFlY0hDRWN6bzhvQkVXeGJrRGxidVEyNnhuMDdzdDQzU1pI?=
 =?utf-8?B?ZHJ0WElTMmoxVm14NTZZcndjU1dENS9hTkw5d1hmejl2b0h2dW5QaDVFWUIx?=
 =?utf-8?B?bForRjFMVlRLVXBka2xSeU9kdmprazdQZ2hHK3ZFZHordVcraG1QaWhXeGdT?=
 =?utf-8?B?SFlmcHg0USsvY3dVcXc0a0RoYklSYlp3VFVtYTBPU2NmLytFWStDYW5nTkZB?=
 =?utf-8?B?cjlHTWJUZGRVcDZraHN3MWE5Mk5QeTZpaXoyVjJFWGZpYzFmdWxCa3BmR2g0?=
 =?utf-8?B?aTlNeTJoeW5RZlYyUlpwVnFxdFZmc1ZadTdHcUFmaDJqZ3JTYk15Sm54Nmkv?=
 =?utf-8?B?bDhKUW5uQVpaNGlOVkY1R2N3RDA2SlZBMEh4OEFwL2FVU2pyeU9mNmIyNU9I?=
 =?utf-8?Q?SAlQEZwM9twljxXtPbXUGuf1Q?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nedap.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c51f5e3c-244a-42e2-9186-08dbe06e7172
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2023 15:21:55.6905
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d21d161-0ae7-4a24-94cf-df0881e2fa96
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wg5Dsb3mxP+CPmDIgCbXv+VaymTSkJqYFOdf3XyFcLjIGoOfyXstiLGxQGLEnAgJtLOyFvjuSWO8aoHLMtagrmk7yjYuRErR8p5xzFVuaKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR10MB8102
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 15:22:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190353

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4
LmthbmF2aW5AZ21haWwuY29tPiANClNlbnQ6IFdlZG5lc2RheSwgTm92ZW1iZXIgOCwgMjAyMyAx
MTozOSBBTQ0KDQo+IEEgc2VwYXJhdGUgdG9wIGxldmVsIHBsdWdpbiBpcyBwcm9ibGVtYXRpYyBi
ZWNhdXNlIGNyZWF0ZS1sYXllcnMtc2V0dXANCj4gaGFzIHNwZWNpZmljYWxseSBhIHN1Yi1wbHVn
aW4gbWVjaGFuaXNtIGluIGl0c2VsZiB0byBzdXBwb3J0IHZhcmlvdXMNCj4gd2F5cyBvZiB3cml0
aW5nIGxheWVyIHNldHVwLCBqc29uIHdyaXRlciBpcyBqdXN0IG9uZSBpbXBsZW1lbnRhdGlvbiwN
Cj4gYW5kIGFsbCBleHRlbnNpb25zIHNob3VsZCBiZSBjb250YWluZWQgdGhlcmUuDQoNCllvdSBh
cmUgYWJzb2x1dGVseSByaWdodCwgSSBoYWQgY29uc2lkZXJlZCBpbmNsdWRpbmcgdGhlIHdyaXRl
ciwNCmJ1dCBkZWNpZGVkIHRvIGlnbm9yZSB0aGF0IGZvciBub3cuDQoNCj4gQWxzbyAtLWJyYW5j
aCB3aXRob3V0IHBhcmFtZXRlcnMgdG8gc2F5ICd1c2UgY3VycmVudCBicmFuY2gnIGlzIHRvbw0K
PiBsaW1pdGluZy4gSXQncyBiZXR0ZXIgdG8gZXhwbGljaXRseSBwcm92aWRlIHRoZSByZWZlcmVu
Y2UsIGFuZCB3cml0ZQ0KPiBpdCBvdXQgaW50byB0aGUganNvbiB3aXRob3V0IHZhbGlkYXRpb24g
Zm9yIGV4aXN0ZW5jZS4NCg0KSSB3YXMgd29ya2luZyB3aXRoIHRoZSBhc3N1bXB0aW9uIHRoYXQg
bm90IHZhbGlkYXRpbmcgd291bGQgbm90IGJlDQphY2NlcHRhYmxlLg0KSSBndWVzcyBpdCBjb21l
cyBkb3duIHRvIHdoZXRoZXIgd2UgKHdhbnQgdG8pIHRydXN0IHRoZSB1c2VycyB0byB2YWxpZGF0
ZQ0KdGhlaXIgaW5wdXQsIG9yIGlmIHdlIHRoaW5rIGl0IGlzIG1vcmUgaW1wb3J0YW50IHRvIG1h
a2Ugc3VyZSB0aGF0IGl0IGlzLg0KDQpTaW5jZXJlbHksDQoNCkplcm1haW4gSG9yc21hbg0K


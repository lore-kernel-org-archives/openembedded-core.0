Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DAA4C4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 23:08:32 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.79])
 by mx.groups.io with SMTP id smtpd.web10.115788.1701126504052027675
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 15:08:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=IFdBDfhW;
 spf=pass (domain: axis.com, ip: 40.107.13.79, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ed9htgRcR39uoaw3QSX8e53HOXCXFD+dAITAJMMZQtc9knVtAKaljyQiCeHtFGgEmZBgELdqLNRfYECbpnTCfJxzgj7rC7DtRwtmrc/o6csWjTNQ28QkE7ZY03ELpoaDlheaJ+TSVdLRNwJosheUvUc+pYhVzdMfqYlLMmxTMudMA7RQMArw+ezi57Ci1SmNUxVX7IRVICXb0Tae0HU/jD6VzFmxwzlS5Hogs9vZwKuZ4SmbLg9CDVodkDXo81yItPtFnNHP0aHKWXyIP7Ap/YrZJf16uxDcOhtDSWUqska56OANAoXaz66t4VzTK03BoWWV1WSs6ahVG4ZMBWisaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JgHQJ5NIEk8hT442Sr8TNBW9sIyR/UF6+911YK6j58c=;
 b=B2byXl+xgbAOwkkg4skQimpBOM3B83zM47izDqq95Uvro/mPdprjhesA7IGUtpBnNZi7JZzhlDcRKgYJtt8BHz5+im/NLZr5AtGezDT4s6AAo/plzpCOUUDND+7ke4FbN1dWuyom0VUU08w4HFPeNqiyqVe+XdVE7h3VfLmqhubRqZ/nJoI6y/lGuhXTtWGLUMIoIISqfSoCuQI+jqgODXp5GiFxFayZ8/dsMpa/uUYMkRp7lKyOPypACHkw3kTxNtBeWDwyrHFPtQjciJRmTGEq/+2qxOdNPsZ7Gi3dklc6jWf5BpRv2ejpk2+YKLAtIDHBkqXyA2w8npB88G1j2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgHQJ5NIEk8hT442Sr8TNBW9sIyR/UF6+911YK6j58c=;
 b=IFdBDfhWqQb/w4/hI9ZX8XowOIlPPOErBA5I+erMw6ooPaAUhsuVLtFYuCfMvUvbeWn1VtPfs2hcCldMn7NDzeYBShxihuIiTOtq77ovs5gAUOYvUoRHyEaLXqsvmfzF3I1vVV7zQBqK8RYRznee0rlIYfb+f8qTml3jHsNvNMA=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DU0PR02MB8805.eurprd02.prod.outlook.com (2603:10a6:10:412::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Mon, 27 Nov
 2023 23:08:19 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::6bf2:231b:b0b7:205e]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::6bf2:231b:b0b7:205e%5]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 23:08:19 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Dmitry Baryshkov <dbaryshkov@gmail.com>, Ross Burton <ross.burton@arm.com>
CC: "quic_vkraleti@quicinc.com" <quic_vkraleti@quicinc.com>, OE Core mailing
 list <openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] systemd-boot: Extend recipe to compile native
Thread-Topic: [OE-core] [PATCH] systemd-boot: Extend recipe to compile native
Thread-Index: AQHaIUIAj8U8/qeNkUuo/Ou/1pYr+rCOYN0AgABHZICAACHxwA==
Date: Mon, 27 Nov 2023 23:08:19 +0000
Message-ID: 
 <DB5PR02MB10213D5B2D471CCC65EFAA4ABEFBDA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20231127145643.986904-1-quic_vkraleti@quicinc.com>
 <56AF193C-6DA6-435A-8C6B-06EF0F5B15F3@arm.com>
 <CALT56yNtJMP8rv+7MGOCL-bPn2XnDVLDVa2SBhVmTiFZUGDp5g@mail.gmail.com>
In-Reply-To: 
 <CALT56yNtJMP8rv+7MGOCL-bPn2XnDVLDVa2SBhVmTiFZUGDp5g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU0PR02MB8805:EE_
x-ms-office365-filtering-correlation-id: 3cc0229b-ded5-4c54-0d22-08dbef9dbeff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qnnHt8IYVhyXrSTpdHPbaIWHWCZAfJ8axIJBYHhHkBnYLrth97NtrpTg2LDkIdw1L3XYNuCz2koF0IhGKNV+JTOORpcuyzyzk75REeETaxzXUiWVr4ockRmVtpNqzHAEHcnGMxcbvVR9EgD6FsQevtLRP4o3Ov6G0K8ScISBRlw+OpKPb6xSa9CK5OOx0rvPArXckK/yYvFDsaisf+X/nquJGJVWzIJ0sS5rVzFqRgWX+5G+7z6G9+9lnF3gHBkl9WB7tUIAfEtTLK2mzQIkG0NmcTYeqYzeJNLGQSj3kRsN7dI4bxZpU8ScUa2mO+iFUeFzfkEmRyNjViiYBa92ydnVby5iZeGa/S78cqFn30IBN2uE5ydGPY+zIkDNDb+49COKFC0UeWWSnofTsU++6XcFKptVd1o7hi631HqVBZrh8Mi2fbAirGOPTXdERlEvpDb+KE8iZRcHTB5vq78peAxhLQg/ULx1IZfG+5VlSD6gzvX9wZJiGgJXACJZjUgRhXkIBX9sTGltT+j+O3Z0YrlLKAHRiBOKDVyqnu33hz+uBNGJtuyulNYrZc9ehWDXZU9aomXRZBorMvnWoykH6JYl0fVj65eeDrEIhBfd/2lGt+A8otP7k2/liRUutuxS
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(39860400002)(346002)(366004)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(38100700002)(41300700001)(33656002)(38070700009)(122000001)(55016003)(83380400001)(5660300002)(26005)(44832011)(86362001)(2906002)(9686003)(53546011)(6506007)(7696005)(52536014)(8936002)(8676002)(4326008)(71200400001)(478600001)(66476007)(66946007)(76116006)(66446008)(316002)(66556008)(54906003)(64756008)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cDlET3ltMnZlWThhWDg4ajhLM0RqNEhqT2tqaHg1QUFsOHF4YUkxMUpUb1pP?=
 =?utf-8?B?RDVKK25wZ3ppSUJYaE5XcFg3S1R2b2NFckRKN2I2alhhR2cwbHk5R2hYRlpv?=
 =?utf-8?B?Q2doS1R6M21CVGtLT2o4WnBpY1FjakN6ZjRlOGxOUmhPb2ZEcDhTL2NhTWNS?=
 =?utf-8?B?eXFBRDRYdmNaaCtXVUU0V3hWR09OZjR0MWI0UHR2UXZjemtYbnB1MUY5UW9G?=
 =?utf-8?B?bFRWbjJxUEsvYm54emUwQm1rRDJWOWlrazhaYW5yRXZPZFFQeWpxUExCazlQ?=
 =?utf-8?B?dFQ5S0g2K01pSGtWTHRlMHZ0VXpXb3JXUWxlR3NMekc3OUNFRzhrNEd1UGMv?=
 =?utf-8?B?VzU5cmVQMWt6L0NBM0ljTFdYbEo2V3I0eUR3Y1VWdHh0aHdpVkNXTFdtMWtm?=
 =?utf-8?B?cGUySUFoaWdLVGpFdUwvNjBKMmZyRDhmZHhNOHZ1S2tJNUF1eFdldHpCWVBq?=
 =?utf-8?B?SnhVM0gvYlFwcjl6eldnN1dOa1F5cnVvUzJCamFCbTBCdkpFK2RkVDc3TXVa?=
 =?utf-8?B?N1hPMlFUYU8wcEVpMDQwYnk1RGlWN2xNRFc1bXI0TXlDSWs4T1luV3VZNFJY?=
 =?utf-8?B?N3NxUUprOWNqSSt3cFA2Mkp3N2VDY0RQV0toaHFFSHRwVzdnWXNFOUltRTFl?=
 =?utf-8?B?MVR3Q096aEl3b0Rwd3lCZHU5eTd6Wk1jeCt2QUJNWUFSSmRKRWtLc1NWQlhm?=
 =?utf-8?B?MndVeEdoNyt1RnBaSDZQZTl3WlZYeStQcG52YnRIbEJuMElyWkxJSmJxK0xN?=
 =?utf-8?B?c0dNZlZ6c0pkNENOMUVMcEtyNWFRSm5QMHozSVRvbmJwUDYxbGZRQWVlT0Jk?=
 =?utf-8?B?WG9rMnpQc3FJL1pXWXFKaFBMb1JmVzd1SU8xZmtyMjU2NUZGSmNBaWhpTVRo?=
 =?utf-8?B?U0R1NURsSjJoZFM0V0xRcW4wRTN5ZjQ5NmFXRlpQcUZMaTk3UjdndDR5QlBi?=
 =?utf-8?B?YlUrYStYZHRLNnF0RnQ3VlMxcnU4Vk52UFBQMzRMeVF6U09CaFdVVzlPZWdS?=
 =?utf-8?B?TE1ETmQvNzVpanhuT1dqQlE3SVJRajNkcEdBd3lsZE8vVkRVR1l4dkJ6WWhR?=
 =?utf-8?B?QjYzOUdvbUh1dU00M3NOQjR5d0tqdXZGTjA2bnBYaWZsdTJTRnRubGh5SWJU?=
 =?utf-8?B?aEoySXNISDA0WVl5bXBOMDFWdmNiZExQb3dmRzI4Y3I2b0FXUjlpVDRyUnlM?=
 =?utf-8?B?b0hHbjhBQ2hldTRlRmxySG96SFUwV0FBVzlWR2luUGVDbkJ5N29JaTgrc2xV?=
 =?utf-8?B?ampsaktWMnJHR2hPTzVnNStyLytyUXU1WU93eEZPTW9WdUFTVzFkZDA2MWg0?=
 =?utf-8?B?RWJ1cU4zQmY2MDNVTjdaZGRiNDRYRnlnLzFDY0RwVUtsY1hJS0tIWVJMTkY0?=
 =?utf-8?B?cmlhMUJkNUpxV1MrU3ZNcmRLZ2wvZEFYbmJLUCtMVFM3UGl4eDdObmh2VEY1?=
 =?utf-8?B?OFBoeCtWK0pGa2FrOXJFZU5MSE5MQUFqVktkRHowTFRFQ2pCZVB0WWkxV08r?=
 =?utf-8?B?UkFRRnVheDRUbTVXL0pidmJqWUgzVDg1RWsvWTZOK3UwVjN6M0dxMG94Yk1E?=
 =?utf-8?B?Q0cwQ0hVODNxOFl0RjZQN3NGZGUzTlRkQ1NYSWJUY1lINS9FdkJvbGkwMUZH?=
 =?utf-8?B?T0UyMHh5c1RtVE5xWW81cmw0eG1QRm1qQzNSWkNIMWJTL2R4WXRreGVWRVpj?=
 =?utf-8?B?OHlkUmRwMWNEelFPMDRrdWdPWEtkSmIvZWNiaU1GcVk3MXBldEptN21DSjlH?=
 =?utf-8?B?RldJQlBGMzFzMzE3b3VleURZUEJWMG4zQy83dFQxckdUVGtseTJRRlZUL1lU?=
 =?utf-8?B?eDdKVDAyV0s0OXFqeTBTQzQ3cGo3OVY0ZURBMG9RSFJ3MjcrVTdLandsZnE2?=
 =?utf-8?B?RWNYOG9IN2Q3ZGJLN3NDY0xUMjJ3L21aU3JkNGhiZ2puYmJ1Mm9mRjdQOE93?=
 =?utf-8?B?UG5xYTcwaGVkNVNKaXBabWtORGZXTHJ6Wk1lWGlpWlFHT1pnY0JGdGhVSDI2?=
 =?utf-8?B?anA4RWk5VGJUakZHejZUMWg2TERreGxmcHZHUkZ6aS9DNWplNXdUbS9GQnVV?=
 =?utf-8?B?U2ZvOVBxNHVWMVhVNXJwWEYrWTVwK2xTOFJoclZPS1F5MmFUbE5MZFFKQ3Fx?=
 =?utf-8?Q?8V/8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cc0229b-ded5-4c54-0d22-08dbef9dbeff
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2023 23:08:19.6301
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VJW8pmfkMivbFTXT8lM1BW9/vbxK7KBbDE5sju1XLQpnCeRcenEYSUqXF+rzlDxf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8805
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 23:08:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191329

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIERtaXRyeSBCYXJ5c2hrb3YNCj4gU2VudDogZGVuIDI3
IG5vdmVtYmVyIDIwMjMgMjI6MDUNCj4gVG86IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0u
Y29tPg0KPiBDYzogcXVpY192a3JhbGV0aUBxdWljaW5jLmNvbTsgT0UgQ29yZSBtYWlsaW5nIGxp
c3QgPG9wZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPg0KPiBTdWJq
ZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gc3lzdGVtZC1ib290OiBFeHRlbmQgcmVjaXBlIHRv
IGNvbXBpbGUNCj4gbmF0aXZlDQo+IA0KPiBPbiBNb24sIDI3IE5vdiAyMDIzIGF0IDE4OjQ5LCBS
b3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBPbiAyNyBO
b3YgMjAyMywgYXQgMTQ6NTYsIFZpc3dhbmF0aCBLcmFsZXRpIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQo+IDxxdWljX3ZrcmFsZXRpPXF1aWNpbmMuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiA+ID4NCj4gPiA+IHN5c3RlbWQgaGFzIHVraWZ5LCBhIG5hdGl2ZSB0b29s
LCB3aGljaCB3aWxsIGNvbWJpbmUgdGhlIGtlcm5lbC9pbml0cmQvc3R1Yg0KPiA+ID4gY29tcG9u
ZW50cyB0byBidWlsZCB0aGUgVUtJICh1bmlmaWVkIGtlcm5lbCBpbWFnZXMpLiBzeXN0ZW1kLWJv
b3QgcmVjaXBlDQo+ID4gPiBpc24ndCBwcm92aWRpbmcgdGhpcyB0b29sLg0KPiA+ID4NCj4gPiA+
IEluIG9yZGVyIHRvIHVzZSB1a2lmeSwgb25lIG5lZWQgc3lzdGVtZC1ib290IG5hdGl2ZSByZWNp
cGUgdGhhdCBjYW4gYmUNCj4gPiA+IGFkZGVkIGFzIGEgZGVwZW5kZW5jeSB0byBnZXQgdGhlIHRv
b2wgdW5kZXIgcmVjaXBlLXN5c3Jvb3QtbmF0aXZlLg0KPiA+DQo+ID4gRmVlbHMgbGlrZSBpdCBt
aWdodCBiZSBuZWF0ZXIgdG8ganVzdCBoYXZlIGEgbmV3IHJlY2lwZSB0aGF0IGJ1aWxkcyB0aGF0
DQo+IG9uZSBiaW5hcnksIGluc3RlYWQgb2YgYSBtZXNzIG9mIG92ZXJyaWRlcyBpbiBhbiBvdGhl
ciB3aXNlIHNpbXBsZSByZWNpcGUuDQo+IA0KPiBUaGlzIHdhcyBvbmUgb2YgdGhlIGNvbmNlcm5z
IGR1cmluZyBwYXRjaCBkZXZlbG9wbWVudC4gSSBzdWdnZXN0ZWQNCj4gcGF0Y2hpbmcgdGhlIGV4
aXN0aW5nIC5iYiBvbiB0aGUgcHJlbWlzZXMgb2YgaGF2aW5nIHRoZSBzYW1lIHZlcnNpb24NCj4g
Zm9yIG5hdGl2ZSBhbmQgdGFyZ2V0IHJlY2lwZXMuDQo+IA0KPiAtLQ0KPiBXaXRoIGJlc3Qgd2lz
aGVzDQo+IERtaXRyeQ0KDQpUaGF0IHNob3VsZCBiZSB0YWtlbiBjYXJlIG9mIGJ5IHJlcXVpcmlu
ZyB0aGUgc3lzdGVtZC5pbmMgZmlsZS4NCg0KLy9QZXRlcg0KDQo=


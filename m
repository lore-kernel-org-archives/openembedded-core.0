Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A33CD5BB1
	for <webhook@archiver.kernel.org>; Fri, 22 May 2026 13:28:31 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16638.1779456504229775545
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 May 2026 06:28:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=uPStYp3R;
 spf=pass (domain: ericsson.com, ip: 52.101.66.11, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZiehhPe7DRtAzwiN9XCAdlck/1z3e9Ma6P1F2SnRfE2HV/Vw8tV7M5PKDLo2m3gc5n4qduDXXnznkk+B12PYqDWwbl3OBykWcYqNZPSgs2zDwYVc8k9CkmoweCL65VX7w8FXe1WRPNfDk2mmxT7xW7MJpzlGbs2tZYZGx0XMlDGrqIXSylOYjJMPKHES/EaAp2Ixaeu0zMzF4IAm6rkGsS+kAebdpQkukd811SGO1kmmJzEslFbwUXoJdF2gArV8cOgy1t2Oc3mzpGFV7KJgowm7dB6SJLegFCgixAtOdMr1gHcZNtUs8YUMinrDO9cNjZRqh2/auAD2PjG3BfFBOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+Cxn3OkH1imz+1O53eXdk7Mn8tarpRUQx2tsol0d4Q=;
 b=oXogfbG5ylYn0Gw5gpP98E7yYpeyaytcYf+B+EBsFiYKMDx7oPcnqGJkVSu7nokjI6V9GqbbZfm03yuDE6vfkxw/JSmhbCVLmFPMHZUVKDJwnB6A4qQCA7LrwZz9KPebNvb0vE9tQMnzCCWjwR+mTurQOPhe+aPh3i45IbpNko0foOHn2/XBVrZNeWGyJnOSlD7IaAal05HHV/Qxb3t4HgoLvUQ69NQc0Q7SAdeygYf1xk3j1vFrA3DGOsRSr8uwqkMZ7R7rfkrxTN1ceDeh8H4JXXIuX1fhOBWrHt3Zvh54c9jWAZ1hVOrKhas6mBKe2XEGpTN5TpBXXSPDubWdmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+Cxn3OkH1imz+1O53eXdk7Mn8tarpRUQx2tsol0d4Q=;
 b=uPStYp3RyJq70OXqa1T3yGsiQywSdgl3yCrhXQpLODc8oLmfIk98PZjEe/65meUdoefsSX6xyk9CKMrTEqsHohi8sacR9ftg+0apiqoddUNcaA9cIGYy1VsefXHpjA2GA190nOiIr4HQJ7MXFw/QyNTaoVfIczvAvoT9r++rPR5RoP68KGXVN1Oatk11d6BI4uUiqFWNessRUjIZrjWG9BmC+hKcuUNHQxOTOrfQ6PVv8cQmj2L1fHehNHtZJwpIBmjjf3lCJoq8gemS1vlpJFHj4msJ8Hemd38+KUKdKDRyODzusNX6Sc+os9dRuSHvP9mMieRA38uYsdQ9jRcpyg==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by AS8PR07MB7639.eurprd07.prod.outlook.com (2603:10a6:20b:2ad::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Fri, 22 May
 2026 13:28:20 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%7]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 13:28:20 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: Daniel Turull <daniel.turull@ericsson.com>, Alexander Kanavin
	<alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "ticotimo@gmail.com"
	<ticotimo@gmail.com>, Tim Orling <tim.orling@konsulko.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, Ross Burton <ross.burton@arm.com>
Subject: RE: [OE-core] [PATCH v4] devtool: upgrade: extract changelog between
 versions
Thread-Topic: [OE-core] [PATCH v4] devtool: upgrade: extract changelog between
 versions
Thread-Index: AQHc5s6W6ed30615g0Sv9IRu2gWVD7YYSI8AgAABdBCAAAIXgIAAApWggAGfV+A=
Date: Fri, 22 May 2026 13:28:20 +0000
Message-ID: 
 <PA3PR07MB107217DF71F10FA2869E5F8618A0F2@PA3PR07MB10721.eurprd07.prod.outlook.com>
References: <20260518135925.2579226-1-daniel.turull@ericsson.com>
 <CANNYZj_b1FwJ888KMGpMSvBHQTWw6ns_M83Z3hn5WQHbi-_WCQ@mail.gmail.com>
 <PA3PR07MB1072144F3A9A22B216961FBCB8A0E2@PA3PR07MB10721.eurprd07.prod.outlook.com>
 <CANNYZj8uZeX=uRvG4LunO8M51bfA26otSP9=R=Nx+Eqbd_Lexg@mail.gmail.com>
 <18B18EE2CF222850.3639055@lists.openembedded.org>
In-Reply-To: <18B18EE2CF222850.3639055@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|AS8PR07MB7639:EE_
x-ms-office365-filtering-correlation-id: da96db2c-c084-47ef-04a7-08deb805fd97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|22082099003|11063799006|56012099003|38070700021|4143699003;
x-microsoft-antispam-message-info: 
 ys7H+lP0vX6mLQMfLAqKR0Q2M/JWkGVuBvIoGPTmenzk/7jfkWvC8FZFMavJ2XOHti1xv/qiL6Rgr8wuCLIDd9B9i1fVyfQ49chUws1cq4+46GOUphrMciejK0RhDzdjINurlZF/mcLhsvdxEFHg8sxP+E6Da/lmd32xC+8/NlDf9kxIH6bZCkjlm8ZOKx9WSIUyL+1pl7M+cBVGJ07cCEe0MQKV/iDQszNgwFtkGeweBcTTRW13RgovkeGNJ7mnRCX1yHYSP+od+P4xrO6+T+EleyBhUgbJLtobYlPs5+G2UTtClwMBx1r70rWc/aXdmutigiPzg+KsHWjlt9liDV48NQvjpeV4udjIIfFpqeGyUWfN5+6aaFJ5T+FfKcXfJS3cITt5xgh31Qv66X9igN6e8CCIia5WYOpN45INslCUFieY7+fv+12GRz9rgnd4viZfWHnAUkVQbYidOSFKKIAySrtSzO7Rh/hK4xKUnnwyunEYTqFzsSL2mrEI2EX2PXKu2+wYbKjbkZfHgKYR1GA7Pl65jCxiFcGI9PlVZG5EJ8OIb9/rgNcMhl8o/1DZ0z63DZWYByForhCmhhs7WGVplf1tWyGYibGVsXZXqccBAQRYzU6yGMOM2pJ26AEI4rK5MZEvdQvvt3UJ7IU9fyFReX+xQDi/91AsaT5YuzhvLcE1wftEn8uF1mb9R5bEqEr7mDL3n1r4t02Ufu9qzqXxdDfyFRAvcgV5We+DO5AjJCzKk04h2KtGrwe+74ks
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(11063799006)(56012099003)(38070700021)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dHVKejhPU0R5SWZhVkNGeDladXA5RkZkMFpwcHFjOStEUlprN1BYNVgyakZC?=
 =?utf-8?B?YzR0M3BkV3dnY3kzMjJWZEFtempkdG03MTl2c3dtYkZrMnZtbUdkZ09wN1o5?=
 =?utf-8?B?VEREWjlhVVVPZWRmV0NDTlduYXBsQTBJNzk5ZEtJMU90ZVlIYzU1bGoxQ3Zy?=
 =?utf-8?B?bm1yd2RhQlM5WDZKelZqY3dWcDEvMzRlV1M2bFdLRGR6UDRBZy93anlHMzR6?=
 =?utf-8?B?cncwYmxjeHNobEZQYjVFU1poeW1MTFZKUmJaeU0weTIzd3ZQbW5xc040eDh4?=
 =?utf-8?B?eWcxVWdQdHEzNjBKRUZHeG1vK0RCVXFGbnl6aEh3ZUUvdFIrcUp0OE1nUG5x?=
 =?utf-8?B?ZzJkVGFxblc5ZjR0MSs0S1NQRjJWSElqMlIvZmZWRENDQVpKQlVrRUR0bk41?=
 =?utf-8?B?TkJUSkxPaWw2MFZZT1lEcSs3VFBVRGpCMktiajU4ZG5tZ1A2WmswVS9aNnpU?=
 =?utf-8?B?UFo5SytZendaMEhjdnBBZmswdDl0bGd1bkZUYnU2MjEyWGFRakwxdDgwYUFs?=
 =?utf-8?B?Mm1NT2xJY1FhUi9BR2loUGlCcHY4eG5raHI3U20wbVRnSWF1NS9XKzFnYlZX?=
 =?utf-8?B?WEdtTDJqZzFVTSswZlpaakhKSGg5RWZXejNBa09EeFNtSEJNNHNNRmRPNEsv?=
 =?utf-8?B?TTRvZEp6R2EyR0ZmbmVKb0xRQmpLU2Y1emhlbGJKNlY5MzQzSXhLMTRVeHBN?=
 =?utf-8?B?T0pDbnVUU1UzVnpYNnpTYWgwb2dqKzFRMGRXcStSOHVDNjJETVFUQTFVQWJU?=
 =?utf-8?B?WW1wRzhqQXhkOGhDRStYajVGRjAramg0WXpXa3B6bHczdDE2ak5ENlNvaUwz?=
 =?utf-8?B?NkdkNzREVUE3S2owSUgxcHZqQUQyT1JCY2hwQlEwM2g0VUtsSEhkN2dHdDkr?=
 =?utf-8?B?M1NEUXJrVndpMnZJTXRDOXFCN1BOZFBkYTN6UG1aQnFVQnFaWHNvNlhoZmUr?=
 =?utf-8?B?cXo3YzBJY25hUDRBUDRMTEovMFR6VndWR0hxTWZkaE9lQTMrdE01Z2FDSU1I?=
 =?utf-8?B?ZTZrait5RWh3MnRCbWZSbGk3Mi9ma0NBOHVZWXQxeVRPNEwvR3NwZTY4c01k?=
 =?utf-8?B?bVdZYmVkb3NuYnJvdmEvOXk0QnhFZUJOSUVSZ0d4TUlyZFNReTZDSHduQVhw?=
 =?utf-8?B?WUlXYXBZR3Y1VUFGOVRnTXhaSXdPVjJtNlNXbHJDZjlFRzZtbzI3WTFDTGtD?=
 =?utf-8?B?SWdkR0xaZ0tDamFFR0Z0MUNVcHBVUTVCQ2pqVVYzUW03NzdYc3J2NjU0L29K?=
 =?utf-8?B?OXg1aURnY1dENVdsRUdnL1ROY0R3cytVWTNmYUU3eFg4eG11d2FsRGVSU1J1?=
 =?utf-8?B?Sm9NVHIvQXlTalNXcHc0UllTanpzYjJTejdNZVdxZWRYUnZwL1UrU1Y5bkha?=
 =?utf-8?B?em5yR3RzMkRWRDhRZGpqQzFJVHRvZ3hDUUVnbGgvUmtLQ1VQMEJqUk1WSkR0?=
 =?utf-8?B?MVI0aFFoRi9Oc1FYejZFZEVNcDhjdGNseGM4QlE1Z2VyMWp4blp6MkpDRFNk?=
 =?utf-8?B?WHRvN015b2NtQTMzNEVqK0xRTThhcnk2cXlJdVdZcXN0YjZVNWs4ZXBid1Jt?=
 =?utf-8?B?Sk55TUV4Sm00emYvdHJHSXdLN3NGQjFVVmdvYXJiZ0VzUlkxRGpIeCt0WThy?=
 =?utf-8?B?dnNKd254RDZ5ZFpXMUFjZlBjQXJ0T0I5VXhHZmh4SjQ0SHhSOXVCbEM2WVd6?=
 =?utf-8?B?eUNObit3RDArdGhud3laTHVsR0xUZ2kzbnBnb3kyRWNLdkg3Ynd5TEYrc1pq?=
 =?utf-8?B?cUJISFdOY1dGZ2dzYzFmaXlnZXFsUUx3UzZueFJFWkk1Rk1oeXVhTFBPRWdM?=
 =?utf-8?B?VTVEcE91TTZ3NEJTY0piR21MenJQQ3o4NFNUb1BxM2RoSnVjNWg3Ny81UUox?=
 =?utf-8?B?M2hEdHlWd3A1VCtmVXdnMW83elJ4NTFuQ0pmTW4yZWVDQVczTHpZODFRaG5p?=
 =?utf-8?B?cG9uQnQ1Yk5JMFNZS2JlM0hSd1FpeG9zVkZucjRvU0R0eCtSUXFPZHgvY05O?=
 =?utf-8?B?ZkdRK2ZEenBaYVh2ZktNSVMrSlhGVGo5bDc5bytXbDZyZWRuTTRzd3N4aGdj?=
 =?utf-8?B?clNCcXQzWko5ZkVGRjRLVlpvTy9zZG4zSklML0hTaS80ZWh2Yk1KTVplRUdQ?=
 =?utf-8?B?NE1jS1hBSmJKM0Z5Z1dNcHE3Q1NVV2xzdnV4NkpqODZHZGRrb21SSkx4Lzlu?=
 =?utf-8?B?RGVlK21LRzBrQVBNb1lrTEhuQTluQTIvSVlQQUZKdHpUcXpoWEZIZG1TMS9l?=
 =?utf-8?B?aVBBaGhPbnFCTldvTHpoQ1UzcVJ0S1lRZE9LNW1mNkIvNStpY1VzQkZiZWk2?=
 =?utf-8?B?NldweFc2MXpvNzhSWjl2RHBQdFYvV1JlclU5R2tGRTNxOUQySCthQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da96db2c-c084-47ef-04a7-08deb805fd97
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2026 13:28:20.1511
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LAjfzm+tpYHisQD3iAkUwAXGFFGNU9tgRkhqEB/QEtSYK68DGZgAx4B7fj+aDvXWNE4NTrgPoLtMCH2Oj9CoMpCsQrV1kB2K496WP4sXRDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7639
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 May 2026 13:28:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237549

SSBob3BlIEkgY2FuIHNlbmQgdGhlIHBhdGNoZXMgYWZ0ZXIgcnVubmluZyBhbGwgdGhlIHRlc3Rz
IG9uIE1vbmRheS4gSSBmb3VuZCBzb21lIHNtYWxsIGlzc3VlcyBhbmQgSSBuZWVkIHRvIHJlcnVu
IEFVSCBmb3IgMjE2IHBhY2thZ2VzLg0KDQpJIGFsc28gaGF2ZSB0aGUgQVVIIHBhdGNoZXMgcmVh
ZHkNCg0KQmVzdCByZWdhcmRzLA0KRGFuaWVsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3Bl
bmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBE
YW5pZWwgVHVydWxsIHZpYQ0KPiBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFNlbnQ6IFRodXJz
ZGF5LCAyMSBNYXkgMjAyNiAxMjo0Nw0KPiBUbzogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2Fu
YXZpbkBnbWFpbC5jb20+DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnOyB0aWNvdGltb0BnbWFpbC5jb207IFRpbQ0KPiBPcmxpbmcgPHRpbS5vcmxpbmdAa29u
c3Vsa28uY29tPjsgUmljaGFyZCBQdXJkaWUNCj4gPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRh
dGlvbi5vcmc+OyBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtPRS1jb3JlXSBbUEFUQ0ggdjRdIGRldnRvb2w6IHVwZ3JhZGU6IGV4dHJhY3QgY2hhbmdl
bG9nIGJldHdlZW4NCj4gdmVyc2lvbnMNCj4gDQo+IA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiA+IEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21h
aWwuY29tPg0KPiA+IFNlbnQ6IFRodXJzZGF5LCAyMSBNYXkgMjAyNiAxMjozMQ0KPiA+IFRvOiBE
YW5pZWwgVHVydWxsIDxkYW5pZWwudHVydWxsQGVyaWNzc29uLmNvbT4NCj4gPiBDYzogb3BlbmVt
YmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzsgdGljb3RpbW9AZ21haWwuY29tOyBU
aW0NCj4gPiBPcmxpbmcgPHRpbS5vcmxpbmdAa29uc3Vsa28uY29tPjsgUmljaGFyZCBQdXJkaWUN
Cj4gPiA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz47IFJvc3MgQnVydG9uDQo+
ID4gPHJvc3MuYnVydG9uQGFybS5jb20+DQo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2NF0gZGV2
dG9vbDogdXBncmFkZTogZXh0cmFjdCBjaGFuZ2Vsb2cgYmV0d2Vlbg0KPiA+IHZlcnNpb25zDQo+
ID4NCj4gPiBPbiBUaHUsIDIxIE1heSAyMDI2IGF0IDEyOjI1LCBEYW5pZWwgVHVydWxsIDxkYW5p
ZWwudHVydWxsQGVyaWNzc29uLmNvbT4NCj4gd3JvdGU6DQo+ID4NCj4gPiA+IFllcywgSSBjYW4g
ZG8gdGhhdC4gSSB3YXMgd2FpdGluZyB0byBzdWJtaXQgdGhlIEFVSCBwYXRjaCBhZnRlciB0aGlz
DQo+ID4gPiBiZWVuDQo+ID4gbWVyZ2VkLCBidXQgSSdsbCBzZW5kIGl0IGFuZCBwdXQgYSBub3Rl
IHRoYXQgZGVwZW5kcyBvbiB0aGlzIHBhdGNoIHRvIGdldCBpbi4NCj4gPiA+DQo+ID4gPiBJIHdp
bGwgdGFrZSBhIDEgeWVhciBvbGQgb2UtY29yZSBhbmQgcnVuIEFVSCBza2lwcGluZyBjb21waWxh
dGlvbiB0bw0KPiA+ID4gYmUgZmFzdGVyLiBJJ2xsIHB1c2ggdGhlIGNvbW1pdHMgYXMgaXMgaW50
byBhIGNvbnRyaWIgYnJhbmNoIGFuZA0KPiA+ID4gYW5hbHlzZSB0aGVtIGZvciBjb3JuZXIgY2Fz
ZXMNCj4gPg0KPiA+IElmICdkZXZ0b29sIHVwZ3JhZGUnIGZhaWxzIHRvIHJlYmFzZSB0aGUgcGF0
Y2hlcyAob3Igb3RoZXJ3aXNlIGZhaWxzKSwNCj4gPiB3aWxsIGl0IHN0aWxsIGJlIGFibGUgdG8g
ZXh0cmFjdCB0aGUgY2hhbmdlbG9ncz8NCj4gSXQgd2lsbCBzdGlsbCBydW4gYW5kIGV4dHJhY3Qg
dGhlbS4gVGhlIGV4dHJhY3QgbmV3IHNvdXJjZXMgaXMgaW4gYSB0cnkvRXhjZXB0aW9uDQo+IGJs
b2NrLg0KPiANCj4gPklmIHlvdSBnbyBiYWNrIDEgeWVhciBpbiB0aW1lLCB0aGUgbXVjaCBsYXJn
ZXIgIHZlcnNpb24gZGVsdGEgZm9yIG1vc3QNCj4gPnJlY2lwZXMgd2lsbCBjZXJ0YWlubHkgY2F1
c2UgYW4gaW5jcmVhc2UgaW4gc3VjaCBmYWlsdXJlcywgc28gSSAgd291bGQNCj4gPnByb2JhYmx5
IGRvIGFuIHVwZGF0ZSBvbiBjdXJyZW50IG1hc3RlciwgYW5kIG1heWJlIG1hc3RlciBhcyBvZiB0
d28NCj4gPm1vbnRocyBhZ28gYXMgd2VsbC4NCj4gDQo+IE9rLiBPbmUgd2l0aCBjdXJyZW50IG1h
c3RlciBhbmQgb25lIHdpdGggdHdvIG1vbnRocyBvbGQgbWFzdGVyLg0KPiANCj4gQ2hlZXJzDQo+
IERhbmllbA0KDQo=


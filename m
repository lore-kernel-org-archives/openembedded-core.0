Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7702BC44527
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 09:46:47 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5422.1784540799101686049
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 02:46:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=j69Gh8JG;
 spf=pass (domain: est.tech, ip: 40.107.162.36, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6pZz/NH/fWVUCHM4M73DKSrWibQjurQuJ867wj1xpJPntcnKyTTHyJn83koBIvjGIGNWqFQzO4DD5ayHenALraGO04S8q+KWTCazAQNl5VJvWm9zWlP4ZcAfCPFgwY6dN/Xb+RGEmKAuPjZOUE8mxSbeoBp/rxRHnVIfhrv1EIrPcU/IAuvYw3CuomiJIyHEOSijeO+E/0h73lZDBdhlRbJLngonq/bMnVVr/dBAwhHjuXwzt9H4B92RIyWT8pym22DiK7bJoKtPCVP+UMbza+4iVluXQZWIFzODFhIyAIhrDqjkkDa18UF24QVIKYsfenZ7shcOhct00d+RTrAuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oq+rqWth5tZs7Gpwkzr79hYkuax1uGMyMOGo/c3fWJ8=;
 b=lBShtFIcYhvmaWYc8ji11lHMvCnGiOS2+Bh08jGxvOhHNOumAo4fQ+M0BecxMz3CuIc9oNpZREWGTP+T5HvpH+3tdULH3uRNuSXTNRiZ7jeDpQpGr2joL+QAteS/qKyIFjqsSYvIpU8Z9tqwPjKHHdsQliqVsfqtY3QzCfUFo6OAcI084fkVh2WOUOUNMWUC/1UTUTlmNZiWl2VCRUMaRF+3Ed6VfT+JexLrW4DHLQ5HkcdlxoEQyTPiRWcrRaj1SBHWi53XWTgIefPljNX+rqwqKsoZlxyP/TTTXjclkjX77Jk3ArNxtToOqMgOKcS8YxejpUUHnW5eiAYMKdl9jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oq+rqWth5tZs7Gpwkzr79hYkuax1uGMyMOGo/c3fWJ8=;
 b=j69Gh8JGznX3ec81whj+TtKxbl3hY+a8haywihHujKDmNHlvYSplSY1BnDK+L2RnUp9H0rWo8PBj9PAMVMb2s21igRlf85+wnypEeGmOgd6jQ1hzcuRSWr6sngNrtv/v3YIYhy4e4OKbmP2GU/W/mVEczBQMrylCjWMk5KFJaOTOWKEQ5ZKi7He20Qby1YMp2ziWxfy68mkD9BoNQlmHdP+KkDHzyhREqb3QFrd5hyvP4cpJtHG87eZoAfAd8j1Hl3qqTmmuNCTyBCVaFzDcxpMSryDE/j755oqWEQDiGqFZzQxisgie3PZ5/UZ9fSCzLeHpNzBnCHmjo/Q9/+I/jQ==
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20)
 by AS8P189MB1238.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:28b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Mon, 20 Jul
 2026 09:46:34 +0000
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d]) by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d%5]) with mapi id 15.21.0245.009; Mon, 20 Jul 2026
 09:46:34 +0000
From: =?utf-8?B?Um9sYW5kIEtvdsOhY3M=?= <roland.kovacs@est.tech>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] binutils: fix CVE-2025-69645
Thread-Topic: [OE-core] [scarthgap][PATCH] binutils: fix CVE-2025-69645
Thread-Index: AQHdFQm3qnzWiglx+kixgFCChq1lJLZ1VE+AgADa6YA=
Date: Mon, 20 Jul 2026 09:46:34 +0000
Message-ID: <f81d8c26b92fdb73043c336630ecc54233da05f5.camel@est.tech>
References: <20260716095854.65840-1-roland.kovacs@est.tech>
	 <DK2U92VVUXKE.2HBXKS4ZWACG@smile.fr>
In-Reply-To: <DK2U92VVUXKE.2HBXKS4ZWACG@smile.fr>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7P189MB0725:EE_|AS8P189MB1238:EE_
x-ms-office365-filtering-correlation-id: 05df2e5e-3636-4060-0ebd-08dee643c928
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|6133799003|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 siY3+fnSfAPDJhBJ4fLkhmvAD40s5Y6AeXFOyq/KSq/QW4zO5O4OiMV75/2kydLqT1xVPC4O0RzR2Px4m6cLDXq6kVEASrk3SiMXCDM8qjxfpqaFTILvuFB6CDrR+PVhxmKasd4QghV83+ek9KISDMC5pgH+9cqfkT+nluxBDpBx0dWtnE/yQ7qhZsLMt5lH8r/XXvjVNVHx1l3a2K3QZd7TmEAUIO/pC8TkF+d4Ca9LszP+sBSDxCjS4enj9ww9PG2RHGkHwxhHNAM5z6M/RW6GhAkjhw5XGtyKVWLvFSzN76uXGZkgqPKq/RF5vphEQi3UJDhSzOvpFeZPjvicExUTTUyHG9tJMxV4i8G16ARtm2zRpS8rXOOQK/d9YjMn+JK31WFZ15BWPPv8MJ6OQhR3Z0uoYYPvwZpbdSrbLLSRgSKpWHpBABzevy9iknZNDeiStQDGUgJGAm5uiGVAVwE5kaqfh/Zb0ZBTVbqVJsoYQ0eXTCG4F8Ly4/qsL2xWiJZXdb7MOJPQgPHVRyhkWDvX4HrkazxMgBAYdU+Rq1YJAPR8vuDXbKItEnhnT2Qf7KVBERomIf2FwoLUvM1Zyp19hWGZ34vuLS3obJampPXpKZpgUFMSakng5tiZremkfYMKXtLOLuc3sBfgSUPWWITP+S4BuLlS+0QtU8LKC5D1jwS4OxUUlGTmpXPqTc9nBK2yHVApDzuS/CGVlxTu16+q11YBDo7ABKh8eo0bIj4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB0725.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(6133799003)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Znh5NEozWndXQlpIK3BuSTFkcUVvbktmSWJiMVM0eDJsblZMZVlsN2hvU3B5?=
 =?utf-8?B?Q0JLMDl3SW5iSkx2VUw2WU1mSTUyRGQvc2xlejk1OStTT0ZrYThTVFAreTdC?=
 =?utf-8?B?by9iZTFLb2t2d2lOditwYjN3aXo5ZExiVmZRVFNzSU9oZlB6ejZJMnh3c0JY?=
 =?utf-8?B?MmpIOGhmMkNrOUlsQk85aU5CaitYbjQwSmVJQ0NBazJRSlBUUkJxMWpUVjMx?=
 =?utf-8?B?ZHFEVWd2V0gydy9KNlA2WXJqZ0hmZVJpOWVVbnhUZkFSSk1CVkdCMlI3WDV5?=
 =?utf-8?B?dzdwK0xWZDEvQStpQmFtTXEwRjEvY1pJZzdWMENBN2pMUENTWGNiZDBYSGRL?=
 =?utf-8?B?b1RVaU1Kb2JkK2syazVOd3M5d2o3UkRBN0hQTGE1aVhmZUkvTlVwOVZhTllx?=
 =?utf-8?B?Vjczb2dSOG5PdjdyeHZyd0czdGRpZ2lHckFyUTRFTE5MVnBuUjdqUElwRldJ?=
 =?utf-8?B?SlNMZEsvSGVFR2tjYnJXSkp2bThJckdIY0R5NWtzNzhKbDU2TnBzb0krb1NL?=
 =?utf-8?B?c3dpT3A3YUkvRE5UOUkxU0JTeDcwVTlOYUt5bFVjcnRsQWp3a0tGRVBJMXpu?=
 =?utf-8?B?RW01NlBFcHBzYm1abUVCcDFoemxvKzRuQ1lIY2xQS0xQR0kwZHJoZmtwdWpM?=
 =?utf-8?B?SHpkSWZsLzl6NVF2UU05Rmp6a3B4bDJrQ3dsT0liUGZNNkhnRXk5ODdPbURM?=
 =?utf-8?B?aUVhRWtoQmc1bnVNRUJQUE9NTms3RnpiTGVpalVVNkdrcy82WnJrbythZmox?=
 =?utf-8?B?bTBhREd3VnRDR1NibFloanR3bWhHQ2dGL1IzbGFNUmN6NDRQWEZoMzBESmYv?=
 =?utf-8?B?akd4SnQ4TXY1WUNsZHFXWGU1MlB6Nkh1NWZLT2pvMkYxSGpHSFlOcUxsRjZX?=
 =?utf-8?B?VXBJZlAwQVh5d3FUZi9sa0JCVEx6cktiVVFMOHBNeVQ1M1NSRGRkQ1JxckRo?=
 =?utf-8?B?ZUozVm5XYU9PZGNpZ3lqNy96ZXBiRHVnRHExVFlVTzJVMDB4M3R2UHpDcDFp?=
 =?utf-8?B?Z2MwQ3lnZDRldnNtc1RqalZiei9QZFh1R2hVbXprOUp5WWVORHlTYXUvZWd5?=
 =?utf-8?B?MERUb2czL1JILzdJSUJzVm9xY0pRdG15U0V3NTRpa0tmTmR2WFRCZm9Pc0F6?=
 =?utf-8?B?M1dzR3kzTUluS2dmODEyd3ZkcXJpUThCNXRKdHM1eDMrVjFJMVRnc0RYdGx1?=
 =?utf-8?B?TnBoMUoyUGhSRXV3eFQxbEtkQXRhemVWRnNBYTN6Tm1LNCt2TnloOElwb21t?=
 =?utf-8?B?aGlGdHhQckZza01ic1dwTWZPemZ1cmpuNE5zTVBiVFVBNTVISUtOcUVuUFEz?=
 =?utf-8?B?RkZwRmx1V3RVTjluL2IzUW4wZUFTL0E4NXBRakswUjc5S3NhSXJONmVjSEpW?=
 =?utf-8?B?elliL1lGOGZXSlVJNFpJSDFQTk12b1VrMzdlajdkODBHTDIwSDlOV2dsSEFD?=
 =?utf-8?B?emwzYnhPVURDNWJ2c3JaMVBXMENOTEtqTCtxdGtNWUo2eHhtNGZibTVMdldx?=
 =?utf-8?B?cFRtYW5wRnhxSUdMN00wQUVSV1pOTlB4L1V6amZIL3BMNitqZ3dMK3A2bm5U?=
 =?utf-8?B?cC9iTGZrUG14UjlDZmhnRlJUblprSzIwTlpYMnU0akRaQ0RCd2RCVGcrRGRR?=
 =?utf-8?B?alFVT0xzRlljNGFoSmgyRElNU2VoYTJWR2RJUm9IcVVuQ0REMS9BTmNxZVUw?=
 =?utf-8?B?M29VVEpWM0RRS2RYblJCajQyMzBsdTQxQ01GYmtEcCsvcU42MUVZSTNvT25C?=
 =?utf-8?B?aTVYRS9HWHJUV2oraGdNMWdMVlVJM2k5RWZJMkhIUGZuT0ZiTXBBdTZJWVNp?=
 =?utf-8?B?cnpCRUpaNnRyWXh3TWVBZXRLNXFjMEYycFFHUCtkVGhkQVBoTEdwNEx2V1NX?=
 =?utf-8?B?bHNXUHJDL08rODVWRkgzZ0wrZXFLU2dldHJHa1hzZVVrSXdPMm02NmJmWmFR?=
 =?utf-8?B?NnozcEZtVUg1QkkzM2JtSGZPK1FkWitvRWF6NjFjc3lCNkw4M0ZGK2l4NWdN?=
 =?utf-8?B?L3lxS2ZXbnhVMkoxelhnTnZCT3graDhqZ1JOdUZnR1ZTaGtiQWh4dmFtMFpD?=
 =?utf-8?B?UldsNGdtVUVHU2RYbVRGWURQa0hBNGdCNGg0R1hoUSt1WFlOeGlNR2FHa3pS?=
 =?utf-8?B?YmNkVldVN2pXM1BTV3NZQkRrcUVJTXBzN1owaCtKSHRWRm5qOGpIWEVYSWov?=
 =?utf-8?B?YzRqeE9JWWYxd3lrQkhheTdjY201dDlaTm9HL3NHWUZyMDlDazlldHllbm1B?=
 =?utf-8?B?enZVd2ZLWkFUdS9xTVFKdkllUVJQM2NRd3N2Wk5xc2w3eXR2SHc4MXBBRG1P?=
 =?utf-8?B?cElOSjBPNW8xQXpDUndXeUdVMGFBQjlZN1I2UU94Y3QwdlZ5bzh5d2tGZG5s?=
 =?utf-8?Q?60IDDEp+bya9PZiU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F39F0A40F003384A9A159A465E6B4A34@EURP189.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 05df2e5e-3636-4060-0ebd-08dee643c928
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 09:46:34.4782
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LoW4K/VTab4Pa5zmmNkkHxrpQLn85Afi+1M1l9Oc0q5hinsJvR1/QUClK4ZviN0++tIZSPsuM+C4kTsMHkwZAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB1238
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 09:46:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241351

T24gU3VuLCAyMDI2LTA3LTE5IGF0IDIyOjQzICswMjAwLCBZb2FubiBDb25nYWwgd3JvdGU6DQo+
IEhlbGxvLA0KPiANCj4gT24gVGh1IEp1bCAxNiwgMjAyNiBhdCAxMTo1OCBBTSBDRVNULCBSb2xh
bmQgS292w6FjcyB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiBCaW51dGls
cyBvYmpkdW1wIGNvbnRhaW5zIGEgZGVuaWFsLW9mLXNlcnZpY2UgdnVsbmVyYWJpbGl0eSB3aGVu
IHByb2Nlc3NpbmcNCj4gPiBhIGNyYWZ0ZWQgYmluYXJ5IHdpdGggbWFsZm9ybWVkIERXQVJGIGRl
YnVnIGluZm9ybWF0aW9uLiBBIGxvZ2ljIGVycm9yIGluDQo+ID4gdGhlIGhhbmRsaW5nIG9mIERX
QVJGIGNvbXBpbGF0aW9uIHVuaXRzIGNhbiByZXN1bHQgaW4gYW4gaW52YWxpZCBvZmZzZXRfc2l6
ZQ0KPiA+IHZhbHVlIGJlaW5nIHVzZWQgaW5zaWRlIGJ5dGVfZ2V0X2xpdHRsZV9lbmRpYW4sIGxl
YWRpbmcgdG8gYW4gYWJvcnQgKFNJR0FCUlQpLg0KPiA+IEEgbG9jYWwgYXR0YWNrZXIgY2FuIHRy
aWdnZXIgdGhlIGNyYXNoIGJ5IHN1cHBseWluZyBhIG1hbGljaW91cyBpbnB1dCBmaWxlLg0KPiA+
IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFJvbGFuZCBLb3ZhY3MgPHJvbGFuZC5rb3ZhY3NAZXN0LnRl
Y2g+DQo+ID4gLS0tDQo+ID4gwqAuLi4vYmludXRpbHMvYmludXRpbHMtMi40Mi5pbmPCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMSArDQo+ID4gwqAuLi4vYmludXRpbHMvYmlu
dXRpbHMvQ1ZFLTIwMjUtNjk2NDUucGF0Y2jCoMKgwqAgfCAxMzUgKysrKysrKysrKysrKysrKysr
DQo+ID4gwqAyIGZpbGVzIGNoYW5nZWQsIDEzNiBpbnNlcnRpb25zKCspDQo+ID4gwqBjcmVhdGUg
bW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2JpbnV0aWxzL2JpbnV0aWxzL0NWRS0y
MDI1LTY5NjQ1LnBhdGNoDQo+IA0KPiBNb3JlIHRoYW4gYSBkZXNjcmlwdGlvbiBvZiB0aGUgdnVs
bmVyYWJpbGl0eSwgd2hhdCB3ZSBuZWVkIGluIHRoZSBjb21taXQNCj4gbWVzc2FnZSBpcyBhIGp1
c3RpZmljYXRpb24gZm9yIHRoZSBwYXRjaDogaS5lLiB3aHkgdGhpcyBpcyB0aGUgcGF0Y2ggd2UN
Cj4gc2hvdWxkIHRha2UgdG8gZml4IHRoaXMgQ1ZFPyBJbiB0aGlzIGNhc2UsIHRoaXMgaXMgdHJp
dmlhbCwgdGhpcyBpcyB0aGUNCj4gcGF0Y2ggcmVmZXJlbmNlZCBmcm9tIHRoZSBOVkQgcGFnZSwg
c28gSSd2ZSBhZGRlZCBpdC4NCkknbGwga2VlcCB0aGlzIGluIG1pbmQsIHRoYW5rcy4NCg0KPiAN
Cj4gQWxzbywgdGhlIE5WRCBlbnRyeSBsb29rcyB3cm9uZzogb25seSB0aGUgMi40NCB2ZXJzaW9u
IGlzIHNhaWQgaW1wYWN0ZWQNCj4gYnV0IHRoZSBwYXRjaGVzIHRvIGZpeCBhcHBseSB3YXkgbW9y
ZSB0aGFuIHRoYXQuDQpOVkQgZGF0YSBtYXJrcyBhbnkgdmVyc2lvbiBhZmZlY3RlZCwgMi40NCBp
cyBfX21lbnRpb25lZF9fIGluIHRoZSBkZXNjcmlwdGlvbiBidXQgbm8gZmlsdGVyIG9yIGJvdW5k
DQppcyBzZXQgaW4gdGhlIENWRSBtZXRhZGF0YS4gDQo+ICBDYW4geW91IHJlYWNoIHRoZW0gYW5k
IGZpeCB0aGUgTlZEIGRhdGE/DQpJIGNhbiBhc2sgdXBzdHJlYW0gd2hvIGlzc3VlZCB0aGUgQ1ZF
IHRvIHNldCAyLjQ2IGFzIHVuYWZmZWN0ZWQvZml4ZWQgYmFzZWQgb24gdGhlaXIgYnVndHJhY2tl
ciwgYnV0DQp0aGF0J3MgYWJvdXQgaXQuDQoNCj4gDQo+IFRoYW5rcyENCg==


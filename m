Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C5EC79F99
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 18:57:47 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2867.1788807464854776095
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 11:57:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=m1r62E67;
 spf=pass (domain: siemens.com, ip: 52.101.65.70, mailfrom: peter.tatrai.ext@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=COP0DPjc8ckztNLWOLAf9NP03M3dx2FDTjtfY9anD1ofvtMCdO/8cXY7R9YPMlhIpcR/7G4GkB0C3j7V4uISGGtRQszOM2IxVum+smxNZx0DBA4eGQLr5fbbUv4kkDs5ubu2yUphhAHuqW+s+uhbSUohPoXKC8jkJJrMUx+4psG/Lvq5WDouZpLwO8HVH/Msy7xoVZJNzH7bgu4ayYrJ3nmytJfwS9+qAEvGQJC4djc0UxXT4CZiT6U7PtH6LH1kMVj9N3Bg1d+vRIznaP+tywqlKH6Hyv+OoJhXyXjegvCsXl5hxW2N9Jabk22wxRzA8Y//G8JNI2xU/wUUaySbWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkYwaL5ZU3cHVKXtglF87iVxP56JS+683GaCKacP0Uk=;
 b=si8k7NyW7NpoQY/yRmnjN5fEMS+lJC8UNVaZAihKaI9kk1hmlmqePbf8fi+9kcEdqcpjEK3jYkS4dzEj+JBaOpjIXxBI9U+o2pnW7n6/D78LeualZ6SKhqU8pFwg8x5ZvZvj/iYyi4UFtZkP4QCcon/7Y0tgUIorHB2FDg5/qhsp5U7ogOqtsf+PuqAI43FIkD4rLHaoJ1wDpB6susO9Vk3q5sAPz5wK2KCN4ynOHlvBRoU12soF2UVAAhDgCPtN6vJCQTlVN0RM8UzguEdRtKzZB1HSoGE3fjSLqIPDdK2Wj8g2agvV5LMMe/U0BXNCXVNbcj8NP2gxN++iFQ/cHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkYwaL5ZU3cHVKXtglF87iVxP56JS+683GaCKacP0Uk=;
 b=m1r62E67VwyBAVV7SwORLjMtGBePrEIrstX+wThs0XOIID5zEdCqJNnCycofvFf+aXTGamE8TgqL89J/TiBBe/sBzTuoR92JO8Q1CjUU/k1NtTJTblfRJnKGqjVnlPGxQfc/lS9QqvAifazxi2EGwumke5B828JlaW7A/vrMvsbpMrQ2wuWQ+yKVIujWl1cYlI6teC0sBp4e/UMjdGCaq5/JL4sKvxNpz6FwG09QSrBU+kv3p1DChmLaLKJj2ba6BhGA4vKst/yR2I7pT2cAglHiIKRW6oPpMpfJNliWBt7rjovpQcr76ipHlc8ffSHXVSiZBwZfN7CGlcy+LlumAw==
Received: from AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:605::21)
 by VI0PR10MB9719.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:340::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Mon, 7 Sep
 2026 18:57:38 +0000
Received: from AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9f70:952:2a71:7f3f]) by AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9f70:952:2a71:7f3f%6]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 18:57:38 +0000
From: "Tatrai, Peter" <peter.tatrai.ext@siemens.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [scarthgap][PATCH] testimage: avoid symlinking missing
 qemu boot log
Thread-Topic: [OE-core] [scarthgap][PATCH] testimage: avoid symlinking missing
 qemu boot log
Thread-Index: AQHdNJEzahiAsIrAp0yaIF0TozaUCrbAovsAgALot1A=
Date: Mon, 7 Sep 2026 18:57:38 +0000
Message-ID: 
 <AS2PR10MB7347DD080657BB251A34E040DBB22@AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM>
References: <20260825125617.192989-1-peter.tatrai.ext@siemens.com>
 <DL7QKYPK5OC1.1P2BC87C6OB5N@smile.fr>
In-Reply-To: <DL7QKYPK5OC1.1P2BC87C6OB5N@smile.fr>
Accept-Language: en-US, sk-SK
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=ffbabe19-8ffd-4885-bf27-7a2e8e5ff617;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-09-07T18:55:13Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR10MB7347:EE_|VI0PR10MB9719:EE_
x-ms-office365-filtering-correlation-id: 36f0e1fc-fbe7-4629-5d19-08df0d11e316
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|55112099003|10067099003|18002099003|56012099006|11063799006|4143699003|22082099003|38070700021;
x-microsoft-antispam-message-info: 
 67E4JX807Sw8fRV8vlYJgQDcQa0hqY+gNVtBKODRgAdCKaLWoulmk4OCS97pioZIUUQ/twNXxNjUeYC891dzAO3f4BCQGgFEdcpcWyijHMWx+tmJAKY6aTnJdyEx6fOV+Y9s4/zOmqgkk+De0h3HHiyocUifdNpUyQ7gHg5HiT7h69yZgoZ0wqhctisbtkuyV0jOdRGm8vQM08oWExxSy7OjXCSj20rifH3ZETByozhWmQQR+vZ/GkCE00ssIaEXSIztcx73AyNfykkvP1WDmNqKjwXJzwxWWvLP/hrdqJnPck8eRvNO/WyZxkdrv9Yx5KOljDC3wzX5r/8jutiPlWjsE6/FfOjdgwQB0jpt2yj9w1MIbn1Pq4Fq4wBFX47WKX7rPKc9aa6UudexIOwrud+CiYm/6kcxgz1wzl2ixl+rJ4xd5NwWlo1LVto5yQrTKE6/N8C10m0lhjTRG0EDbMi3Aw3G0bbhGbZowy4NT6KxE7f/ZkTVdWosI3gKqPhrtXmxV4wU+PhtfsHDDEGlCcRizsX0dLk1g1mTdWZ/fhKTIkHAVaSPcXTdModsfOfzcgR/x7P/9QUDhhMZWUpZ4GtXkp0B2DmJJ7JSGGAxXbpP3figvOYRfZm6DC7xtnXRh+MlWu0fGzK/cvg3gL0o7rkUk3T+2t7bgax+V0Z4Aw9BYM0mxBlIE0z9vYUZ/h5ehA4IPsdhuCOERmtW52u1UfJl7BfQCSn2kLDXl7lmjQo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(55112099003)(10067099003)(18002099003)(56012099006)(11063799006)(4143699003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SU9iMERzNjZBakZuOFpLdk5BSjlQQUViRDJtSWhjNnhGQi81VG1zd3VxUkNQ?=
 =?utf-8?B?cVVPMGNGRnhraHBxdmZKRkcvSEc4NThMeGcwWFlhRGJVSUl2L29ZMFB2NFZL?=
 =?utf-8?B?cFF5djB5Rjh4cXR0TTQ2T0tVTWl0QmlTR1JTSHBoc3lBZ01hNXNTSlZDckhV?=
 =?utf-8?B?NkdWeFVjVTRpdnVIaDQ1alVRUlNGaXJUUW16RnN2bTRzRzNaa3RrV09ER2RP?=
 =?utf-8?B?UTBxVHhZTUJtcDNoODJSRWppMkUrTVFncjNxanphT2U0VjQ2RnNKcVBiYXFP?=
 =?utf-8?B?U3VGeU9CbWtQRlppQnNTWDFOd3cyUE0wcWFqeXFPcmY3eTFBd25EVnl0dzdO?=
 =?utf-8?B?aUdWM2tlNThzQ2dzNUROSG1JRTA0LzNWU2tMbEZCODlOcWhTSmJhNXRWUCtS?=
 =?utf-8?B?TTYvTU1jQXBaYVUrQWNVeGMxVGdvRGhvRXIwUC9QNFowN0lCOHBlak9iS0dw?=
 =?utf-8?B?WFFNaGpCQTZqUnRlTGd5ajUya01QSkVRNHBOVGdGaU1yOHJrVmh1Wkx1SXhF?=
 =?utf-8?B?N2dldWNEWGsvdzdNZFdJaUxCeVVUbG9paTJ1Vm5CM1ZsZVlYQjVHQW1WSm5m?=
 =?utf-8?B?TWRjT2FlNlgrZVdDNHR4TDhXcER5dnJMeFU5R3lDSmdIK29uU3owT3pIOUNM?=
 =?utf-8?B?Vm42dDRURXljMWIxUkxmQlZLSVB4cmdOWDIzVW5ZSzZ2ZEVGY2VvR3JiSFM0?=
 =?utf-8?B?MEUzbUFpT2VHckpOYlRpUzh2VU1naGtoRytNOGp1V1pZSm9SOFFzY08vWlJF?=
 =?utf-8?B?ZGJWKzhNTG5XOUgrV1N6VTV5dm94R3NQMGVjR0xQc3ErTHdoRTE3cFBRZjRr?=
 =?utf-8?B?NlVRbmVLUDNrbGFaRVVMclo0N2pNZElFRCs4MnJob1ZBS3h2c2FpRXVtbkJr?=
 =?utf-8?B?aDcrbit6R3RYNEtrdVJpVE9PR3pVaWUvMGdnRWROaDEwc0JDci8xQWJBQ3Ux?=
 =?utf-8?B?YTIweXUxWlhnSzR2NWRJa3FqVUo3S1NFR05TemU0bHZIU3NhSmtaYTlLMERi?=
 =?utf-8?B?OHBXTzdLM1pSUFVEVk5BZzdZWmxQU2VCTHRMdm4rRC9XWURvOGZJeW5DTG12?=
 =?utf-8?B?WTkzME9wWVBOMlU5bFRsUWRhYzlwSXVBeUpmRGlCbUZ2S1plbUYwR1UyZDFn?=
 =?utf-8?B?WExDcllJOGhnbEFjRVZlaUtOa1hScm92bWwxYnNqMEc4TjI0YVB5Y1ZKTVho?=
 =?utf-8?B?UXJvR2xMWHZUa21vbEJFdHlsLzloNHpYVnUwVU5tNTBId2phT0h1THdZQTZq?=
 =?utf-8?B?dlRmbEhmSlVNT2M1WGMzRHFyVlJaYzd0T1FjS09LK00raGllL254d0U5NVB4?=
 =?utf-8?B?TE1VMmJ5NlJZZU00VHRJTERrMWdwVUVGZGxmY1YyN250N0o1NjVjUGhidDdt?=
 =?utf-8?B?d2krSXRNbnJMNWE5L2JwZUdyMnI5bTc5cnRPZUErODVPMFRadndZTjIvNEpi?=
 =?utf-8?B?NHhmZFdKZVF4SnArUDZvNC8zRjZVTnYxTTZMb3pXL3AwKzRPbE56Ym5Fbi9n?=
 =?utf-8?B?bUJiZFZvUEtvbWpwVmc1YWZEaGxSMXh5WGljcHYvSTk2UE1IY0NWUjlTbmxY?=
 =?utf-8?B?NFk5K1pZR3E1SjVoaXBJRi9qdHNwcTlsZng4aDVCVkh6WWw0WkR1RnRMTFJl?=
 =?utf-8?B?TTl2M29iTXh5TzVRZmRpV1dKa0F2UHFWQ2dTd3d5RUdZa3dERHozRnNRbnZa?=
 =?utf-8?B?WmhQbHc0Ky9tK2E4cHpwMDZiVUh0RHNkTE1ObTFjOUdyc1BkWlpNSmRIaldS?=
 =?utf-8?B?U1UyZFNtMmNjSnpqYms5NEJYOEV4ZHByS2hmanpBaHQ4bUdnVGJlM1FHNHpz?=
 =?utf-8?B?dmQ4bzYrVys3Nkp0NXppWmh6UGV6MlpOMEdNY01PQW1YSW0vaFNkbVJod0NB?=
 =?utf-8?B?MER4aVhpNFBVeFZJVlVNVHZWMWJmdGhrSzUrWUxvUEdUTDUyOHdvOE5KOUZM?=
 =?utf-8?B?UUV0bEF5K2Vlb1ZtY3lpZVhSS3VtaE5xUkR4cTZBUERqTjUvd3lxUHdUQXhh?=
 =?utf-8?B?Z1J0UzhjaWs5WUFUeFRXRUZPSm12RFhwZDFJaktrSkF3MkViZFNiNmhnTGQ0?=
 =?utf-8?B?aWp4c3VtNFNvSW1wUE4vcW5UTndQNnFKVnVIQkZHUFloWE1rdGU0QjU1VEE1?=
 =?utf-8?B?TVF6V2w2MThyYncxMUpaMlZub2VYWlVoWDRTajdoUi9wakpZRzVyaHY2cnUy?=
 =?utf-8?B?RG5kRWNPa0llNm0zTzdRaDNiZlZ3WVVmc1N3SUVKVHBoNDFMTmUydEt6RDNV?=
 =?utf-8?B?UWs2dFk5bVBZV0dRMVlyUlhKeFArNzBvQ2RoYzI1cnRDb1hLUlk0aUdlY01I?=
 =?utf-8?B?aWdtZUVkT1VBYllQeWFlUGd6dWJkNFUramxnOE05dEFrQ2NIb3BxQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 36f0e1fc-fbe7-4629-5d19-08df0d11e316
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2026 18:57:38.5256
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UiBAwoA2WvNpOlIXihAFIZ0w3Jub1cuNg70bUhu9JPvRBqTySvxT6XJFSPM9tKx4FN6noNRnBVBnMLP9JS7ANcGJOR5iQoT1y0GS17J7rYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9719
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 18:57:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245305

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWW9hbm4gQ29uZ2FsIDx5
b2Fubi5jb25nYWxAc21pbGUuZnI+DQo+IFNlbnQ6IFN1bmRheSwgU2VwdGVtYmVyIDYsIDIwMjYg
MTI6MzAgQU0NCj4gVG86IFRhdHJhaSwgUGV0ZXIgKGV4dCkgKEZUIEQgRVUgU0sgQkZTMSkgPHBl
dGVyLnRhdHJhaS5leHRAc2llbWVucy5jb20+Ow0KPiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW3NjYXJ0aGdhcF1bUEFU
Q0hdIHRlc3RpbWFnZTogYXZvaWQgc3ltbGlua2luZyBtaXNzaW5nDQo+IHFlbXUgYm9vdCBsb2cN
Cj4gDQo+IFtZb3UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20geW9hbm4uY29uZ2FsQHNtaWxl
LmZyLiBMZWFybiB3aHkgdGhpcyBpcyBpbXBvcnRhbnQgYXQNCj4gaHR0cHM6Ly9ha2EubXMvTGVh
cm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIF0NCj4gDQo+IE9uIFR1ZSBBdWcgMjUsIDIwMjYg
YXQgMjo1NiBQTSBDRVNULCBQZXRlciB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyBUYXRyYWkN
Cj4gd3JvdGU6DQo+ID4gRnJvbTogUGV0ZXIgVGF0cmFpIDxwZXRlci50YXRyYWkuZXh0QHNpZW1l
bnMuY29tPg0KPiA+DQo+ID4gV2hlbiBxZW11IHRlc3QgcnVucyBvbmx5IHByb2R1Y2Ugc3VmZml4
ZWQgYm9vdGxvZyB2YXJpYW50cywgdGhlIGJhc2UNCj4gPiBib290bG9nIHBhdGggbWF5IG5vdCBl
eGlzdC4gR3VhcmQgdGhlIHN5bWxpbmsgY3JlYXRpb24gYW5kIGxvZyBhIG5vdGUuDQo+ID4NCj4g
PiAoRnJvbSBPRS1Db3JlIHJldjogN2E2NTk2OTI1Y2IwZWI4ZGQ0OGEwMzYyYTUxODc1Y2RkNjAx
NTJiYykNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBldGVyIFRhdHJhaSA8cGV0ZXIudGF0cmFp
LmV4dEBzaWVtZW5zLmNvbT4NCj4gPiAtLS0NCj4gPiAgbWV0YS9jbGFzc2VzLXJlY2lwZS90ZXN0
aW1hZ2UuYmJjbGFzcyB8IDUgKysrKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy1y
ZWNpcGUvdGVzdGltYWdlLmJiY2xhc3MNCj4gPiBiL21ldGEvY2xhc3Nlcy1yZWNpcGUvdGVzdGlt
YWdlLmJiY2xhc3MNCj4gPiBpbmRleCAzM2IxYzEzZjlkLi43NDRkZTVkN2RlIDEwMDY0NA0KPiA+
IC0tLSBhL21ldGEvY2xhc3Nlcy1yZWNpcGUvdGVzdGltYWdlLmJiY2xhc3MNCj4gPiArKysgYi9t
ZXRhL2NsYXNzZXMtcmVjaXBlL3Rlc3RpbWFnZS5iYmNsYXNzDQo+ID4gQEAgLTM5NSw3ICszOTUs
MTAgQEAgZGVmIHRlc3RpbWFnZV9tYWluKGQpOg0KPiA+ICAgICAgIyBDb3B5IGFkZGl0aW9uYWwg
bG9ncyB0byB0bXAvbG9nL29lcWEgc28gaXQncyBlYXNpZXIgdG8gZmluZCB0aGVtDQo+ID4gICAg
ICB0YXJnZXRkaXIgPSBvcy5wYXRoLmpvaW4oZ2V0X2pzb25fcmVzdWx0X2RpcihkKSwgZC5nZXRW
YXIoIlBOIikpDQo+ID4gICAgICBvcy5tYWtlZGlycyh0YXJnZXRkaXIsIGV4aXN0X29rPVRydWUp
DQo+ID4gLSAgICBvcy5zeW1saW5rKGJvb3Rsb2csIG9zLnBhdGguam9pbih0YXJnZXRkaXIsIG9z
LnBhdGguYmFzZW5hbWUoYm9vdGxvZykpKQ0KPiA+ICsgICAgaWYgb3MucGF0aC5leGlzdHMoYm9v
dGxvZyk6DQo+ID4gKyAgICAgICAgb3Muc3ltbGluayhib290bG9nLCBvcy5wYXRoLmpvaW4odGFy
Z2V0ZGlyLCBvcy5wYXRoLmJhc2VuYW1lKGJvb3Rsb2cpKSkNCj4gPiArICAgIGVsc2U6DQo+ID4g
KyAgICAgICAgYmIubm90ZSgidGVzdGltYWdlOiBib290IGxvZyBub3QgZm91bmQgYXQgJXMiICUg
Ym9vdGxvZykNCj4gPiAgICAgIG9zLnN5bWxpbmsoZC5nZXRWYXIoIkJCX0xPR0ZJTEUiKSwgb3Mu
cGF0aC5qb2luKHRhcmdldGRpciwNCj4gPiBvcy5wYXRoLmJhc2VuYW1lKGQuZ2V0VmFyKCJCQl9M
T0dGSUxFIikgKyAiLiIgKw0KPiA+IGQuZ2V0VmFyKCdEQVRFVElNRScpKSkpDQo+ID4NCj4gPiAg
ICAgIGlmIG5vdCByZXN1bHRzIG9yIG5vdCBjb21wbGV0ZToNCj4gDQo+IEhlbGxvLA0KPiANCj4g
IihGcm9tIE9FLUNvcmUgcmV2OiIgdXN1YWxseSBpbmRpY2F0ZSBhIGNoZXJyeSBwaWNrIGJ1dCBo
ZXJlIHRoaXMgaXMgbm90IGEgZGlyZWN0IG9uZS4NCj4gQ29tbWl0IHRpdGxlL21lc3NhZ2UgY2hh
bmdlZCBhbmQgdGhlIG1hc3RlciBjb21taXQgY29udGFpbmVkIG1vcmUgZGlmZnMgdGhhdA0KPiB3
ZXJlIG5vdCBjaGVycnktcGlja2VkIGhlcmUuDQo+IA0KPiBNb2RpZmllZCBjaGVycnktcGlja3Mg
YXJlIGZpbmUgYnV0IG1vZGlmaWNhdGlvbnMgc2hvdWxkIGJlIG1pbmltYWwgYW5kIHRoZSBub24t
dHJpdmlhbA0KPiBvbmVzIGV4cGxhaW5lZC4NCj4gDQo+IENhbiB5b3Ugc2VuZCBhIHYyIHdpdGgg
dGhlIGFib3ZlIHN1Z2dlc3Rpb25zPw0KPiANCj4gVGhhbmtzIQ0KPiAtLQ0KPiBZb2FubiBDb25n
YWwNCj4gU21pbGUgRUNTDQoNCkhlbGxvIFlvYW5uLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcu
IEkndmUgc2VudCBhIHYyIGFkZHJlc3NpbmcgeW91ciBjb21tZW50czogcmVtb3ZlZCB0aGUgbWlz
bGVhZGluZyAiKEZyb20gT0UtQ29yZSByZXY6IC4uLikiIGxpbmUgYW5kIGFkZGVkIGFuIGV4cGxh
bmF0aW9uIHRoYXQgdGhpcyBpcyBhIHBhcnRpYWwvbWluaW1hbCBiYWNrcG9ydCAob25seSB0aGUg
c3ltbGluayBndWFyZCwgbm90IHRoZSBib290bG9nLXZhcmlhbnRzIGdsb2JiaW5nIGZyb20gdGhl
IG1hc3RlciBjb21taXQsIHdoaWNoIGRvZXNuJ3QgYXBwbHkgdG8gc2NhcnRoZ2FwKS4NCg0KaHR0
cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdG9waWMvc2Nh
cnRoZ2FwX3BhdGNoX3YyLzEyMTEzMzYxOA0KDQpSZWdhcmRzLA0KUGV0ZXINCg==


Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA4DFE51E9
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 08:50:11 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.8])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16920.1777020608759639752
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 01:50:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=Iq1cQ6Jj;
 spf=pass (domain: ericsson.com, ip: 40.107.159.8, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V9xDg70iYfv9EQb4QiUuZmYhRs/Zuo0K5EfTi8eMAO3DFwo8PDeoFnJx1h0D25yi7OE2LsYaepMlhLr/VrMymQZDIuYH+KfAWspJCcqIcLQmucG8AnIulE48zP/FZ+6Xp4evV+VqurZWGL+i/7isWPOBdgaDsF5QxLbcKb8q4rMDYSXZlOI1EEwt2XkHcUI92gFv16RHN4idtNG9NBC4JtKMvMXn2nhLF5KcCRTC+HD90NHXvSmOpZIThk9XxWHyHWQ/RE+Pv09Awquj3GdPm3V2NUzcc3Q5VIF5gOTHVfzLQIVWqvkKUvelakEyhXPk4E6hYJ3EDcZl4aUomrAcFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IC6+l2xd1ibg7NAAD9w9wwJlkFzObm4xgAejnVV5Fc8=;
 b=OKYfW9qqJAIEm7ZsVYeervX5MWXrWhEgFLbABHRfhoIGRybHPmlqUOGcHY5c8KU3ok3s0LSmOnh8f2zIAwumi204X8LlC0Gc8PiB58f84H6PJTxHTDsRz6lMrKdtoXlOYkybFtTZ+KwhEdh7UOvzJnfT0M4bi+Aj1KQIT0lAYHtOCDxsq25fXrBvVIClxdgsoBsWDAqJRBml/i41DSbG9bkdEyXxPtV5KAGDdUh3m6gbynpslqKjY662HGd22ZKyEwWxP7xroaysAGgYjEbqeg6QUW5wiNB+5u5CzcgSZtVsZ8zGSS7XAATI+0c7mHOhYHw9qft/ypwS4++Xc5/+sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IC6+l2xd1ibg7NAAD9w9wwJlkFzObm4xgAejnVV5Fc8=;
 b=Iq1cQ6JjHHjZTm94bOD8j0/cexmFH+mi7SajroPmcTcHOWOiflo3tloETytTNimFTn1WTIssUAQ6lWJvY38OQLHti0GVzwfC3kMp+BOQH3s03qJ+uYHykT4kk6/P4+3C2/uiVG6OajvplP4JzvzFVxR/EvrqReEko7XHe0cGioBnICluBbDIrvfvmCB0gtrfDBPO4Pm6QrmIAMKjDprZ54141F9EyOu4z2a6S9qJJO+/WXQ1197bTnb4luVsF8bWsPhfeAZ1/QM9lbCAPdLE990yS89CKH+08HyZtTHEWB3kdISU9ec0nPkc87GGKTV+Hz5ciZiugKebHB7ZljqyUw==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by AM4PR07MB11085.eurprd07.prod.outlook.com (2603:10a6:20b:6ea::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Fri, 24 Apr
 2026 08:50:04 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%7]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 08:50:04 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [scarthgap][PATCH 3/9] python3-requests: upgrade 2.32.4
 -> 2.32.5
Thread-Topic: [OE-core] [scarthgap][PATCH 3/9] python3-requests: upgrade
 2.32.4 -> 2.32.5
Thread-Index: AQHcyANpofR9t6QFP0ioEfau8+Tvc7Xt/JUAgAABeuA=
Date: Fri, 24 Apr 2026 08:50:04 +0000
Message-ID: 
 <PA3PR07MB1072149E41A3AF6E9EA446E228A2B2@PA3PR07MB10721.eurprd07.prod.outlook.com>
References: <20260409092936.1740143-1-daniel.turull@ericsson.com>
 <20260409092936.1740143-4-daniel.turull@ericsson.com>
 <DI192N2M7DFY.2KF06OYFF458A@smile.fr>
In-Reply-To: <DI192N2M7DFY.2KF06OYFF458A@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|AM4PR07MB11085:EE_
x-ms-office365-filtering-correlation-id: fc167690-8298-4357-c722-08dea1de7ab9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: 
 R2g1a9gxb9HwtWTHiKLBE25tvMFiQ6HL2htCVyWcJBVn1JwTI2+UupAld5UxFu3ZLFEjYmCh5GVV6H9g/kji0x/aptT/aJHCMPVgjG1YZKI6AoS2m45jNrxG9lhm+tg/09ppBTDKxaByyKe0kezhCXDSQ+MU/ejAW79dRgWMB9HxPoPSrQUVsTnGg4wn82mzSVO9LeIb2ZMSFzIewHEOzlsMnIHdeIeXa3djPghULYR947loA1r3QYtNsbm+NEJScFWRHUj+tOBwABJgeHpAOMroLV7QS8Te/d/F3aC91rE7L6eP4DUN4abr7NOQQnK4RpoOtgSu+/zHPjKr90q2iHnds+yCdL41zyf8H3ZHPJgxh3MFb6l4VEA9mMnB6+PrjhrKCvdoFAXFFlkby/mDv876UBZf8eqFSkojA7fE/GBb9Ir9RohBubTxNDYS/JbCUwArhIPCxrB6VchPol6FQFP1pDCebdqDtHxIgT2FZqsBrSYAb8qMW5yEsm5US7GMGz+NjHcSqH+lS+pO7jaCFzuZXMMYuqtFYVWhUMXP3mZiT6Ve+qoLdUqN5dRmsf+xijjXjW1eLDMSAPmSnLRMC4Ax7bmYksn0zWUfpBYoJ/WcVL7A/oPrYCYXy/iwuNgXFm2QWPyI0KOZLim/CHWqe6y2PEsFQt0D0TGKBMCKmu0MBgQikFIhCMV/Vm6oFa4skK3PQ5FSBnbZQ2txo+3rSH6FDIHb4j6F0v/drJdkslV3tX0SCA6GFcwx+KnEoy4q5E1Cg5+H2R1SqQ8whEfQFSHbmq7Gk4nk37KeTXGLPiA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NGw4TVNoVkRmQ2FNN2ZxYnloZmw1Q3p5Q1lWQS84aEpBem03bUtQWlB4Mndq?=
 =?utf-8?B?ckJKdVlHRTc2R3BYUStQeHgzL0ZLTm5iMlpqVitFRkZiaEhCQ0c4S00yVHhl?=
 =?utf-8?B?NU95QjFvZFA5N2psUG5NY3pzYk41VlpzVUlpeUo5TTM3eHVxTUZlRXdDZkoy?=
 =?utf-8?B?ZlFuNTc2US96RSsrK3AvTHJhU1ZFZkdENFpPQTZCK29yRVJFbUxVbTk1aElt?=
 =?utf-8?B?b3Z0bmI3Y3R4UWhVRXpUZU9SNFkyS3ZETnNDU09yODMrMGQ3TkdveWhUTDZL?=
 =?utf-8?B?NVBjK0xlZlJjVGU2NFdtUXRBS240RlFhL0NEeVowSEc3ZEhFQjVHb3ZadjZ6?=
 =?utf-8?B?d21kQTdJUkRyZHF6UXgxVjhDWGVsSEoxSnhBeGRqcmRqUWVHS0NZOEpDanQv?=
 =?utf-8?B?WU1KS1M1anBjdFhFZFB2UXBYUzJNTmZFTnVqR2lEVmRPR20rZW5iQ0dqOU1F?=
 =?utf-8?B?TGx3ejZEMmZQYlk3cWY1aExPWTZCY3MrT1VWbHRtYkpweFovYklWSmVydkhH?=
 =?utf-8?B?eFZqUElVbmlSOWI1ZllXY2dOcmtnY2dLSjRhWUw0bjFXVFNoT1A1TXlzaE96?=
 =?utf-8?B?YnExN0hDL3F6bmN4SlNnM1dsUmFpWFJkOUVVckhLWWtCSXJPNmJPQ1p3cnlh?=
 =?utf-8?B?UjdmM3UzbFJRcXQ1SFBpY0RzN21BNlpJMjdQV09yUEFIOEtueDdYNlRQWXJ6?=
 =?utf-8?B?Mjdya3RaWjNVT1ZqZDBwdEZsdkN3ckwxajcwTTZmYlBGekFnQ1NIWUJxZE5k?=
 =?utf-8?B?ZlY0YXFDcFlLNEZnUks2Rnc5cFBPUWVwWkkxYjhVY1lqMVE2WmtRS3JCZW0y?=
 =?utf-8?B?Z3l0U0dDWjBybXJmSnNQam1VR240Z1VISWgxQjZUbkgyS1gwN2ZFV1c3bzRp?=
 =?utf-8?B?clV5SFc1T3Jxb0lNUitKSndZb201ejFkRkYvTmRSMk5UYkxoWEdTeUVvMGhL?=
 =?utf-8?B?bzBwSGpmTTAwRkxyd2hFeEZpcVJ1V2NWVDA5ZC9SL21IM00rQm1ySEMxV1lO?=
 =?utf-8?B?aUJMWExMQWc2QjhBNUVvQ1I2bENRaEFHdzZwME1iM1k4UUEwcG9hdmFQdlgz?=
 =?utf-8?B?NHpyejZjbFhFa3FJSjJwS1ZacEJLSUlDUEFMdnFyTHVoSEVFelFaZTIvUHpx?=
 =?utf-8?B?Q2hqWDBZalZwS0JVOVp4NDJvWXpvSExCOGN1Y3dwNk1JNElQRm54ek5ubmkr?=
 =?utf-8?B?UXp1UTJuY2RrTzkwWDhyQ2xPS2QwOUZ6UmtEN2k3anczVHFqMXlQZDY2eTFx?=
 =?utf-8?B?dXN0TDQ3bmkyVVVGdGNOM0Q2ZzZ6K0wvL2NaMHZxcU1XaHBvT2l0aGVxV1pu?=
 =?utf-8?B?RkVudW1DeDZzZUVRTy9IYjBHL2tKUVo2L24xcmhsb3RlK2JUSUI3VTM0YTM2?=
 =?utf-8?B?TWM2aXcvc1FnSVd2YWNrUHJ2VTlUQkFoZCtsUm9DVnlXc0tmdWh4bE1CVnJS?=
 =?utf-8?B?cGtWVTdvSFhLU3FhTXdQdyswcnF2alJ5NTQyUHpVeHZwNGszdk13U0RvZ0Ez?=
 =?utf-8?B?L0JLNENwMDM0WkJTV3gvVjlpREZERFRvVHdkUjIxMHUrM3BLNFVCUnIvRUVB?=
 =?utf-8?B?YTBlaUVsendIY2p1aGdFd1RQM2xtYk1aaXcySVcydWZJME5KTnU1dXZ5bDk4?=
 =?utf-8?B?Ym8wZkZpN25yRjRUTzJsUUFTaDRyUWlDUUphZ1pjallNTEpRbVRPS0RmTUQ4?=
 =?utf-8?B?eE9MWEMrdlBiZkpib2xySjVRc1liaVFBUmJMTy9UK1BWWGx1eCsxME9tdUFM?=
 =?utf-8?B?RUNjV3BKT3F6TWZ0RWowTXRzQXZ6TFhkb0FnWjdQRGFMaG5FZ1piVlZDUlFW?=
 =?utf-8?B?OEN0dHR1WWwySzJZb1ZHZXpXaGhJNlNjN1loK2ZKTHlQbWJQSEMzcjB6SUgw?=
 =?utf-8?B?VXRacE9UczJoQVp3NGJ5T3NnQ2lWcW1Kam5nUDVZcVhId3VYblhsMjlxLy9w?=
 =?utf-8?B?NjNCOHBTYTVUN0VmdTh1S0tTU3pYSHNNenBkc0VhUDhUOU8xL1JtT2RRWU5H?=
 =?utf-8?B?bFAvdlR0cVhvWUdWMG9IbTh2QUJTd2RiMWpLelNoTzhpTVVua0lWNHZNczZ5?=
 =?utf-8?B?eDlXR1Bza0QwbUJPcGRDZ244VHdYUVI2T1l6bHhXdVlrT2U0K3VpeTloeXdi?=
 =?utf-8?B?MGlFOURtZHdiTkxJek5rdkV6Y0dSL3JPblRmV3M5YkZLV01tTGxLMm80aVdL?=
 =?utf-8?B?dURjREptcnFtRnRJaGFBdkRoV0VwTXI5VGtadHhvU2Nvd0c0bGpJZ3NxYlZO?=
 =?utf-8?B?QUh2QjVZWVMzYlhoS1lNRkRiWXJDWFgwUmdFc2RBcnlnVlQvWUhOK2JQajFa?=
 =?utf-8?B?V0xEdkt2dXhKTHZsSzJRUmErNm5TZFZiaGNLbVY2UTY2WitOS0p4cG9wajYy?=
 =?utf-8?Q?n+LZXq8Zrwh0WSGyzRIkshBcAwyTgK6rBtgG5l5vsG76L?=
x-ms-exchange-antispam-messagedata-1: t2OV/0Bg7gW3mg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc167690-8298-4357-c722-08dea1de7ab9
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2026 08:50:04.6396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sGYsKWG4szpEjBgiwCtPp5TrExYEuw6CSbWm3BhMR/pwD/60lARk3lTUvEWI+jn8MaZaLsGLyuIEkeGwia/b7S1E/TNNpTE8RHYbY3MBBRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR07MB11085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 08:50:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235848

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWW9hbm4gQ29uZ2FsIDx5
b2Fubi5jb25nYWxAc21pbGUuZnI+DQo+IFNlbnQ6IEZyaWRheSwgMjQgQXByaWwgMjAyNiAxMDo0
Mw0KPiBUbzogRGFuaWVsIFR1cnVsbCA8ZGFuaWVsLnR1cnVsbEBlcmljc3Nvbi5jb20+OyBvcGVu
ZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTog
W09FLWNvcmVdIFtzY2FydGhnYXBdW1BBVENIIDMvOV0gcHl0aG9uMy1yZXF1ZXN0czogdXBncmFk
ZQ0KPiAyLjMyLjQgLT4gMi4zMi41DQo+IA0KPiBbWW91IGRvbid0IG9mdGVuIGdldCBlbWFpbCBm
cm9tIHlvYW5uLmNvbmdhbEBzbWlsZS5mci4gTGVhcm4gd2h5IHRoaXMgaXMNCj4gaW1wb3J0YW50
IGF0IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQo+IA0K
PiBPbiBUaHUgQXByIDksIDIwMjYgYXQgMTE6MjkgQU0gQ0VTVCwgRGFuaWVsIFR1cnVsbCB2aWEN
Cj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiBGcm9tOiBEYW5pZWwgVHVydWxs
IDxkYW5pZWwudHVydWxsQGVyaWNzc29uLmNvbT4NCj4gPg0KPiA+IENoYW5nZWxvZyBmb3IgcHl0
aG9uMy1yZXF1ZXN0czogMi4zMi40IC0+IDIuMzIuNQ0KPiA+ID09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+DQo+ID4gMi4zMi41
ICgyMDI1LTA4LTE4KQ0KPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPg0KPiA+ICoqQnVnZml4
ZXMqKg0KPiA+DQo+ID4gLSBUaGUgU1NMQ29udGV4dCBjYWNoaW5nIGZlYXR1cmUgb3JpZ2luYWxs
eSBpbnRyb2R1Y2VkIGluIDIuMzIuMCBoYXMgY3JlYXRlZA0KPiA+ICAgYSBuZXcgY2xhc3Mgb2Yg
aXNzdWVzIGluIFJlcXVlc3RzIHRoYXQgaGF2ZSBoYWQgbmVnYXRpdmUgaW1wYWN0IGFjcm9zcyBh
DQo+IG51bWJlcg0KPiA+ICAgb2YgdXNlIGNhc2VzLiBUaGUgUmVxdWVzdHMgdGVhbSBoYXMgZGVj
aWRlZCB0byByZXZlcnQgdGhpcyBmZWF0dXJlIGFzIGxvbmcNCj4gdGVybQ0KPiA+ICAgbWFpbnRl
bmFuY2Ugb2YgaXQgaXMgcHJvdmluZyB0byBiZSB1bnN1c3RhaW5hYmxlIGluIGl0cyBjdXJyZW50
IGl0ZXJhdGlvbi4NCj4gPg0KPiA+ICoqRGVwcmVjYXRpb25zKioNCj4gPiAtIEFkZGVkIHN1cHBv
cnQgZm9yIFB5dGhvbiAzLjE0Lg0KPiA+IC0gRHJvcHBlZCBzdXBwb3J0IGZvciBQeXRob24gMy44
IGZvbGxvd2luZyBpdHMgZW5kIG9mIHN1cHBvcnQuDQo+IA0KPiBTb3JyeSBidXQgdGhhdCBtZWFu
IGRyb3BwaW5nIHN1cHBvcnQgZm9yIGEgcHl0aG9uIHZlcnNpb24gd2UgYXJlIHN1cHBvc2VkDQo+
IHRvIHN1cHBvcnQ6DQo+IEJpdGJha2UgaW4gc2NhcnRoZ2FwIG5lZWRzID49IDMuOCBhbmQgcHl0
aG9uMy1yZXF1ZXN0cyBjYW4gYmUgLW5hdGl2ZSBzbw0KPiB0aGF0IG1lYW4gdGhhdCBhIHB5dGhv
biAzLjggY2FuIHJ1biB0aGlzIGNvZGUuDQoNClRoYW5rcywgSSBtaXNzZWQgdGhhdCBzaW5jZSBv
ZS1jb3JlIHNjYXJ0aGdhcCBoYXMgMy4xMi4xMi4gSSdsbCBjaGVjayBmb3IgdGhhdCBpbiB0aGUg
bmV4dCBweXRob24zLSogdXBkYXRlcy4NCg0KSSBndWVzcyB0aGVuIHdlIG5lZWQgdG8gZHJvcCB0
aGUgcGF0Y2guDQoNCg0KRGFuaWVsDQo=


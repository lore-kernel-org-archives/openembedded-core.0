Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58681EDB7CC
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 07:40:08 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75951.1775547598043976039
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 00:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=BwIOu6+I;
 spf=pass (domain: ericsson.com, ip: 52.101.84.19, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aDeBo3C8NBY40NiDlkIi7A5J+2WiOUkud6x5NdsUOodsTgJYPeEKxEPlUG5ZYNo34jBmCAuIZq2bWAG5ZVIkTZR1uZL5apM78uy+vpePwYQFcW5wneM8ObHjmp6BIoh7qPfKQxbPy2lpq14YVBcjpVslLp4C8H7VnWSvmS7X9Lx6D0fRAnIwRq5rFeMsgacn1keY9W5vR+Rp9k/cy/PKAcJzxO+LTZA+OvrOMszh6wogUFwkpCIBceLa4DwCz/DzSkJzbZ8+tFccqE5oAu2b0NCzoos8vp05QRdY4pUqIqwEraBQDP6e3k5sK0SIgfdCYCK3G6ASdhEywxtPAm9yZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/VjKBwX784gzyCTGQH8yyfKP4H+BOyl4nIuz5tnTIE=;
 b=LnmmB7i6dv12mI9le4+K32WJXcj3NRm/Q01cjRgJgXXBcgJKOHo/8sQmG0bJi6ECruKmK9wK7VJtXTFdcstXg6GEWrpq3pmzakPkhEoO2bXzyy0WY/mjrPVaU0nS7vNFRuPZISeMjPdKvlrtdASc4VsFUb+r0bgttbodPiqlCDcfNLYgbtMVd/lWH/SPpG4WofJ8VcrLa2gtHeMu/O75lsyosnXOn7rK8mWKcuO8bfSa1G6C7hCYkqyoE+RcyEtC/Oq/qQldgjL+BZjGIq9zQKCREHFp7f6MRi/NX2y2KIqUueufZbN1N0U7dLYCdzXfBGsCjFFT9X1N+S0gL0VRog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/VjKBwX784gzyCTGQH8yyfKP4H+BOyl4nIuz5tnTIE=;
 b=BwIOu6+Ib3jKGfY47+MzkzsyAx0jPwiIScxNRmiYg/NNC70jxwn09W74Rv6zHQIuRDwC8e2gDP+ege6gGmpHUI0mnHorr1cPWJojLj7OQk5+MUNAU5xS4BNFR3DAY9T7Bd+hmPwP2DOdl7fw/mIlws+AI0t2jY/JmiuULW4fFAZ8Myt4ak1IWh0CvXsJP42ZHjjrb42p9HoiL2HHxbJmXFP0+zQVlAUgQA2TFxMF/fCkXdTlr0cvxMwLrqB34lRWdGNjgAG2vz8ODAutPw6kQ5pm8NmKwOvAGBzZoT72k4YHMbVo4//TkKWtEC4gDWbZxX4OIW+5U3boYdqXQlIzBw==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by DU2PR07MB8271.eurprd07.prod.outlook.com (2603:10a6:10:278::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 07:39:53 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%7]) with mapi id 15.20.9769.016; Tue, 7 Apr 2026
 07:39:50 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: Benjamin Robin <benjamin.robin@bootlin.com>, Ross Burton
	<Ross.Burton@arm.com>
CC: "rybczynska@gmail.com" <rybczynska@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/3] classes/vex: remove
Thread-Topic: [OE-core] [PATCH 1/3] classes/vex: remove
Thread-Index: AQHcwRG7K/hFKNmmh0+wUe8B+l4FVrXItzgAgAFskXCAAbfcgIAAAyuAgAdhXrA=
Date: Tue, 7 Apr 2026 07:39:50 +0000
Message-ID: 
 <PA3PR07MB107213FD3F157CA716E4A8CDE8A5AA@PA3PR07MB10721.eurprd07.prod.outlook.com>
References: <20260331132430.781647-1-ross.burton@arm.com>
 <PA3PR07MB10721439AB9FDE89335C33B3E8A50A@PA3PR07MB10721.eurprd07.prod.outlook.com>
 <B7466D11-14E9-49CF-9203-24A6B4D47DB6@arm.com>
 <3204609.CbtlEUcBR6@brobin-bootlin>
In-Reply-To: <3204609.CbtlEUcBR6@brobin-bootlin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|DU2PR07MB8271:EE_
x-ms-office365-filtering-correlation-id: 203741d3-1e64-4758-1cfa-08de9478d9db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: 
 oJ5RxXTgz4j1mutFTAXaw+Ss0UVBjoxEHXD2IVWXccSOFiMukOTyEEx1s2qhjueUe5oV3lZ7+OwjNP9rRlzRUSYIeZVZNdJtwQfTQGLXjyciBZyx1DVH0GyjG9UbzNsashkQMkIGd7gKx6Q9RAGSz2xo3Cj8uCA5Q9AkYrOi/YqBQ66YP77Rwstb/GCu8iAA6jrATx/89tVq1viYzzkguErrgO/jOP5UizfRdFrNOmF5SUVomLxJvf4CEWbSzAuuJyog7Rmwc3jx5tPQPOFZYD41nVT5k0NyvKS5kBHDd+N+E4TYOsTOqTVsCUhcdg565jtkzaJgQW/SE/ciy4BNxRsmRqJ2ltosndGYyw5mY6IiYXacJJdQfQy6SuqXmEjT4fl0j6ZkSf6HuE6acrqBms47kr+x22x7nEUUnMEFZv/pL8VMWg5M/W7r1/CuY4+5reHmGAihb/WMJWhMY+8ji5Ub6jshIqFAZq4jNGTeWUQAlO8W2zK5pyN75pjnM+Aar9ohOsh3OD5Pg4/pgeMqIFIGOgZSV71di+56S7bFUqI66behaxj96bQa+6/uYSApwqciRXZnG7zMXNUoePfTIB7keJ+LBtBZCS3p1LfGgT86wigrm2cUcS02PZizuxUq+2PjpjvR6sP3dBRIaWDunlFU8zPON+bLisuFMRe+lIrLFBiAWGRCkYBFS5YLDR0E9hlzguCdvWzZQ8KLP0ZuL4Poxz1SFSwKg0TSi+3dsaIwiH9+67zt7vWk/VyR8Y0YxsoWJZqGUU8Bb26jbfKUf5DQQ5IRRcgkrz1nNXhvuZY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YVFRSlhDYmV2aW1OZUlMRDhKOVpUM2ptT3UyYnZ6MlhVYUlidVNpclM0Vk51?=
 =?utf-8?B?R2N4STZFcldZbnplWlBDTEVLZzlaL3p3N1h5c0JmLzY3cEMydVE3TXc2NUpZ?=
 =?utf-8?B?MTByaW9rVGhvcUJRTnJ5V3NZYlJOVEpmMnhwZHk0MlpZMWJvVkVyMkZHLzgy?=
 =?utf-8?B?Vmo4OW9iRVBQUHhGTTJZVitKUHBNUkpocGphMHRkNkY2TzlwVktRbWxaUWlt?=
 =?utf-8?B?VVNoRDlqcmRhc3NJa3hWNGN1dW9odjFURU9jMTBIRTFtUmJ6MHo3TGV3S2dM?=
 =?utf-8?B?aUF0ajd1MUhnSDNRSjYyVXp3K1dUVmoxZ1VzanltREpPUzZwVjd1TVRqL1NW?=
 =?utf-8?B?MENZa3R3MWgvSmNlNVRyOVl1bUtrcy92TXExdy9wMGo4bnhuWGtKL0RTNlRG?=
 =?utf-8?B?bEJqSEhLWHRXWEpqYVdwV3dqZ1FpejRFV092VTV5WU9tdlVsRk4xT1pBSklz?=
 =?utf-8?B?bjM3dVh6U0pwaFZxZWdkT2kwL2g1VzJ2dU80MXQ4TW4rQ3dBYjd6d3hSelQw?=
 =?utf-8?B?cWhQWk5BS1l6ejZTMytLb1hmVk0raVd4Wkk4NVNveTA1eThFY2NkT1ZLK3lN?=
 =?utf-8?B?eEhCcU1PVGNWV0dHTWl2TURKTmhPWVhNNFBETnM0M0o1NzJ0RmNkOW5wN0Mr?=
 =?utf-8?B?NThseU1peFM2dFcvU1pMRG1WV1EySXdqQ0I0OExSSlhCdW9LbjRZSWNXZ3F5?=
 =?utf-8?B?YWNkVkxPL3dqRXVHeVFYMHNHU2NuNW01d3EvMmttZ096Zm5ZSngxQmcvcFJx?=
 =?utf-8?B?VzhUNCt6TFN6cWNoTHF1MTZKOUVvYlMvckhFWTlOT0JQcHpMd0FhdXpmckd3?=
 =?utf-8?B?LytlekhtMk80a3pPd2RvYmVYdDdoZzZmTmlaU016SGVTQlNWaG1iV2xjeitR?=
 =?utf-8?B?b1RHY09xakoyN09KREVnQ2s3NGhHZ0pZL2pod0hLT1cyRTU3eUhGR3o2Tksv?=
 =?utf-8?B?bzNHQ1RxcHhmUXJ2VkVmcGdvN1kyWllPQms0TEkvbUVvRk1lVWozbk5KeVAr?=
 =?utf-8?B?cEs2WmgwL3BuNzRLUGd3T2VoK2g0azRlVFg0UDJIVGJVOCt3OTVSY0lsTGpR?=
 =?utf-8?B?UDZOczFJdEF6bXRHSXVxYmxuMGVYakFjTnpvTzllS0pQa3ZMdTlEZXdidnRh?=
 =?utf-8?B?eFliWktDTWp5OEJGQ0c2WkFESVM2TnVXZEN0N3pzRUh5eHo1V2wrZjZmRjB6?=
 =?utf-8?B?N3JwYW12WlhDa2FJN2d3RlBBLzI0OHFBUmhvOEVVZER3WFNoWGpON2MvSUFa?=
 =?utf-8?B?MDZkZVdtODJWZ3lLcWIxZHJCazE3UlRwTDhnRFZKSHR3eDlhUUozOXZUdGhs?=
 =?utf-8?B?czRsWEV1REhxNGtTTUdJMlpzN2ZrSFBmdlludWkrcmhHY2hzK0RGUnNNc0pE?=
 =?utf-8?B?ZldtOFlnOUJFUkpXNXFzV255YTBrSkFGMG9OUzFnNGNoZkx2TXhaMGdkVXRy?=
 =?utf-8?B?UDRlZXZ1ZTJrQy9CbEJYc0JCNWc2Rk1XcFVOOVFQVnplWmgwWFptRVdVY1ZH?=
 =?utf-8?B?dDMvNktPbXp0bllSeG5mTGJQWGF1NG9Ea1krbWQzaDN2WTh0U3FkN2hPWVpz?=
 =?utf-8?B?SHZRL0xQKzJtdXcwdFVia2M2eldOUlNIUGdDUWtrK3RJTGJqQm5mU1RrZzZE?=
 =?utf-8?B?U3dBOFN1Rm1KRXhFbS9Xa1BrRk1ibCs4R09mb2t4cGFBZ0FycWRXc0xydFdJ?=
 =?utf-8?B?T21ORUdCQUpaNGhjelhnK1h5dDlWMERPb1RIR3hNZm95OWMvQTZlanRzK2sw?=
 =?utf-8?B?d3psSC9zbFNWdHdMMGlyb0pIWncyek15cHBqRlQrSDA2cXZjckV1c1RIWjB3?=
 =?utf-8?B?a2dCOHQ0ZnRpV1ZIZjVtNmNjekd3UEhSdlpRZGVjdlZXSC82ek85eUkzcDF3?=
 =?utf-8?B?cGRYU3lZTUpIc25HRGxrcWhPYSsrUXQ5dkdLMmUxVVByblpJeEtKYm5Ga2Fm?=
 =?utf-8?B?Y3dTaGZ3KzJQMFYxNmtEUU9SMWNCS0xzRU9sN1BGUFFucSsvL04wUGZXbGh3?=
 =?utf-8?B?eUNjTDFxNHdtbnY3blo5MmpDdDFYRmdiK1phL1N6VDdQVjVob3ozZTVHbm55?=
 =?utf-8?B?QThobUxCS29KZStYV295MFhRM0FiQWlNWm8xU3B2aUxZU2g3d01sdG9jcHo5?=
 =?utf-8?B?L3JDdDBITm9uV0N3aXNsQ1dLcVI2RXI3MGhWTlRhaHdrcFB5N0FjRVZBVnht?=
 =?utf-8?B?engwV0pHYlBzNjdYY0M5N2JjQzRYVWUrVkpwa3BRQWpIRFYrMWpOc2tTVGF4?=
 =?utf-8?B?eW1STzNaaUF6UWlkODJKZzcwbG5LTzRqUmhyZWNoUy9KY3ZQTk1KbEZvUnFz?=
 =?utf-8?B?b1ZpOXdENXMwV3lBbUxEQ1BnVW42R3RucnovSHVkTk5SelJQYzZVUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 203741d3-1e64-4758-1cfa-08de9478d9db
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2026 07:39:50.4242
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AqUqJ11WqOZLswiWXmZvHmnZJDtaP8nWw2VImS9MnOOr7Z8AY7uiWXlO0NVjC9c5ewm378oKlfFdpqBDaKN2DwJhEsQicqXhmO7SebJ3PCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8271
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 07:40:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234723

SGksDQpXaGlsZSB0aGUgdmV4IG91dHB1dCBpcyBvcHRpb25hbCB0byBpbXByb3ZlIHRoZSBxdWFs
aXR5IGlzIG5vdCBhIGJsb2NrZXIgdG8gdXNlIGltcHJvdmVfa2VybmVsX2N2ZV9yZXBvcnQucHku
IEJ1dCBCZW5qYW1pbiBhbHNvIHNheXMgdGhhdCBpdCBpcyBzdGlsbCBub3QgaW50ZWdyYXRlZCB3
aXRoIHRoZSBzYm9tLWN2ZS1jaGVjay4NCg0KSSBjb3VsZCBhbHNvIGFkZCB0aGUgZnVuY3Rpb25h
bGl0eSB0byByZWFkIGZyb20gdGhlIHNwZHgzIHNib20gYnV0IGl0IHdvbid0IG1ha2UgaXQgZm9y
IHRoZSBuZXh0IHJlbGVhc2UuDQoNCkkgdGhpbmsgaXMgYSBiaXQgdG9vIGxhdGUgaW4gdGhlIGN5
Y2xlIHRvIGtlZXAgcmVtb3ZpbmcgZnVuY3Rpb25hbGl0eS4gSSBjYW4ga2VlcCB0aGUgdmV4LmJi
Y2xhc3Mgb24gb3VyIG1ldGEtbGF5ZXJzIGJ1dCB0aGlzIHdpbGwgcmVkdWNlIHRoZSBjb2xsYWJv
cmF0aXZlIHdvcmsgYXJvdW5kIGl0Lg0KDQpCZXN0IHJlZ2FyZHMsDQpEYW5pZWwNCg0KPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCZW5qYW1pbiBSb2JpbiA8YmVuamFtaW4u
cm9iaW5AYm9vdGxpbi5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCAyIEFwcmlsIDIwMjYgMTY6NTQN
Cj4gVG86IERhbmllbCBUdXJ1bGwgPGRhbmllbC50dXJ1bGxAZXJpY3Nzb24uY29tPjsgUm9zcyBC
dXJ0b24NCj4gPFJvc3MuQnVydG9uQGFybS5jb20+DQo+IENjOiByeWJjenluc2thQGdtYWlsLmNv
bTsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBS
ZTogW09FLWNvcmVdIFtQQVRDSCAxLzNdIGNsYXNzZXMvdmV4OiByZW1vdmUNCj4gDQo+IFtZb3Ug
ZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20gYmVuamFtaW4ucm9iaW5AYm9vdGxpbi5jb20uIExl
YXJuIHdoeSB0aGlzDQo+IGlzIGltcG9ydGFudCBhdCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0
U2VuZGVySWRlbnRpZmljYXRpb24gXQ0KPiANCj4gSGVsbG8sDQo+IA0KPiBPbiBUaHVyc2RheSwg
QXByaWwgMiwgMjAyNiBhdCA0OjQy4oCvUE0sIFJvc3MgQnVydG9uIHdyb3RlOg0KPiA+IE9uIDEg
QXByIDIwMjYsIGF0IDEzOjI5LCBEYW5pZWwgVHVydWxsIDxkYW5pZWwudHVydWxsQGVyaWNzc29u
LmNvbT4gd3JvdGU6DQo+ID4gPiAgVGhlIGtlcm5lbCBzY3JpcHRzIHRvIGNoZWNrIENWRXMgdXNl
cyB0aGUgdmV4IG91dHB1dCBhcyBpbnB1dC4NCj4gPiA+IGh0dHBzOi8vZXVyMDIuc2FmZWxpbmtz
LnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmdpDQo+ID4gPiB0Lm9w
ZW5lbWJlZGRlZC5vcmclMkZvcGVuZW1iZWRkZWQtDQo+IGNvcmUlMkZ0cmVlJTJGc2NyaXB0cyUy
RmNvbnRyaWIlMkYNCj4gPiA+DQo+IGltcHJvdmVfa2VybmVsX2N2ZV9yZXBvcnQucHkmZGF0YT0w
NSU3QzAyJTdDZGFuaWVsLnR1cnVsbCU0MGVyaWNzc29uDQo+ID4gPg0KPiAuY29tJTdDNjBjZTg5
Y2RiODAxNDgzNjcwYzQwOGRlOTBjNzllZDglN0M5MmU4NGNlYmZiZmQ0N2FiYmU1MjA4DQo+IDBj
NmINCj4gPiA+DQo+IDg3OTUzZiU3QzAlN0MwJTdDNjM5MTA3Mzg0MjAxMjQ1MTEyJTdDVW5rbm93
biU3Q1RXRnBiR1pzYjNkDQo+IDhleUpGYlhCMA0KPiA+ID4NCj4gZVUxaGNHa2lPblJ5ZFdVc0ls
WWlPaUl3TGpBdU1EQXdNQ0lzSWxBaU9pSlhhVzR6TWlJc0lrRk9Jam9pVFdGcGINCj4gQ0lzDQo+
ID4gPg0KPiBJbGRVSWpveWZRJTNEJTNEJTdDMCU3QyU3QyU3QyZzZGF0YT1ERVBKOWsxWjZTQSUy
QmhnbXZJdTBWTzBiDQo+IFdiUVhtVHUNCj4gPiA+IExJc1o3UEJKJTJGME80OCUzRCZyZXNlcnZl
ZD0wDQo+ID4NCj4gPiBJIGJlbGlldmUgdGhpcyBmdW5jdGlvbmFsaXR5IGlzIGFsc28gc3VwZXJj
ZWRlZCBieSBzYm9tLWN2ZS1jaGVjaywgYXMgdGhlDQo+IHJlY29tbWVuZGVkIGNvbmZpZ3VyYXRp
b24gZnJhZ21lbnQgc2V0cw0KPiBTUERYX0lOQ0xVREVfQ09NUElMRURfU09VUkNFUzpwbi1saW51
eC15b2N0byA9IOKAnDHigJ0uDQo+ID4NCj4gPiBXb3VsZCB5b3UgYmUgYWJsZSB0byB2ZXJpZnkg
dGhpcywgd2UgbWlnaHQgYmUgYWJsZSB0byBkZXByZWNhdGUvcmVtb3ZlIHRoaXMNCj4gc2NyaXB0
IHRvbyBpbiBtYXN0ZXIuDQo+ID4NCj4gPiBSb3NzDQo+IA0KPiBDdXJyZW50bHksIHNib20tY3Zl
LWNoZWNrIGRvZXMgbm90IGZ1bGx5IGhhbmRsZSBMaW51eCBrZXJuZWwgQ1ZFcyBjb3JyZWN0bHku
DQo+IFNwZWNpYWwgcHJvY2Vzc2luZyBpcyByZXF1aXJlZCB3aGVuIHRoZSBpbmZvcm1hdGlvbiBv
cmlnaW5hdGVzIGZyb20gdGhlDQo+IGtlcm5lbCBDTkEsIGFzIG1hbnkga2VybmVsIENWRXMgYXJl
IGluY29ycmVjdGx5IG1hcmtlZCBhcyB2dWxuZXJhYmxlLg0KPiANCj4gQWRkaXRpb25hbGx5LCBz
Ym9tLWN2ZS1jaGVjayBkb2VzIG5vdCB5ZXQgcHJvdmlkZSBhbiBhc3Nlc3NtZW50IGFzIGRldGFp
bGVkDQo+IGFzIGltcHJvdmVfa2VybmVsX2N2ZV9yZXBvcnQucHkuDQo+IA0KPiBUaGUgZmlyc3Qg
bGltaXRhdGlvbiBpcyBwbGFubmVkIHRvIGJlIGFkZHJlc3NlZCBpbiB0aGUgdmVyeSBuZWFyIGZ1
dHVyZSAod2l0aGluDQo+IHRoaXMgbW9udGgpLiBBbmQgZm9yIHRoZSBzZWNvbmQgcG9pbnQsIEkg
aG9wZSBJIGNhbiBhZGRyZXNzIGl0IGF0IHRoZSBzYW1lDQo+IHRpbWUuDQo+IA0KPiAtLQ0KPiBC
ZW5qYW1pbiBSb2JpbiwgQm9vdGxpbg0KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2lu
ZWVyaW5nDQo+IGh0dHBzOi8vZXVyMDIuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20v
P3VybD1odHRwcyUzQSUyRiUyRmJvb3RsaW4NCj4gLmNvbSUyRiZkYXRhPTA1JTdDMDIlN0NkYW5p
ZWwudHVydWxsJTQwZXJpY3Nzb24uY29tJTdDNjBjZTg5Y2RiODANCj4gMTQ4MzY3MGM0MDhkZTkw
Yzc5ZWQ4JTdDOTJlODRjZWJmYmZkNDdhYmJlNTIwODBjNmI4Nzk1M2YlN0MwJTdDDQo+IDAlN0M2
MzkxMDczODQyMDEyNzE1MTMlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKRmJYQjBlVTFoYw0K
PiBHa2lPblJ5ZFdVc0lsWWlPaUl3TGpBdU1EQXdNQ0lzSWxBaU9pSlhhVzR6TWlJc0lrRk9Jam9p
VFdGcGJDSXNJbGRVDQo+IElqb3lmUSUzRCUzRCU3QzAlN0MlN0MlN0Mmc2RhdGE9emprdnljblpt
SXliY1VYNE01d0ZxU0hDWFF3ZQ0KPiBDWVAzSTdBRmY0UVBLVzAlM0QmcmVzZXJ2ZWQ9MA0KPiAN
Cj4gDQoNCg==


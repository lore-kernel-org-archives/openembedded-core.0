Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D81C5DF7D
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 08:44:32 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3372.1787301865967029799
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 01:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=XMlAFq7E;
 spf=pass (domain: est.tech, ip: 40.107.159.30, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oJrOGdDKLY7RMe8lZCjS1g9M3mYIhgMT/MzepHVApLA5SClm0awphusAUcvnIT3L77w7mEeRj8iQVAghEDoRSbfdh+YqOqVrjJLuHlCdM+mx+leftIwl+UItAU9zXkZezzRQ+S85px+IlGbKx23mMKJeIaC9UZceDuSEt2CogiKHGr6eRpS5UxVV+PvTSmirBCE1+U+zglHRLC2xbtBI57CEPGdim4Nfb1MQ0Y3JGgn1G2+KRqOR0v+g+kKSIfa1UpTcrgpAK5dal0ckaZwbqZ4cfvmetpfkfgQFxohV1nhLZEZXcNWcvBIVRtp7eu6n0FsGs2vWpdldZmYG1W8/zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKL0f0M4wJXS6wz19Q0YezeALnGMQFqmg2w625WfgJ0=;
 b=EduC2uRnXSzTngP4hzlNRpNzhiG8D6JDoKf+hMRthfSG1Zlkiveqbdc1SOvYzwhptPTdIsUKVkLCf4UgqvwT3+1qY3op8p6ywNslNqqdBnydP0w+nPO7/I7legsDEY04M5zj+QbQ1iqaO+nHK+I9ypvJJ0aEuKQ06hiFVr3g1hoSSFOzlY7XjiPZJmut2N87KlGoifPnMq+BJD7IFrMHZOsKJbZGnJvDs+1WwSjdtwWSzU06weEXhatCHhe7D2pMCg/Eq4Q+cxgZ2yixUQvI/eNs1rAYsDfJeufyVvWRkP4dZ66P1fjugOfWX1j0TuAr1X7Ulq5Ikk8hM+cERXqrvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKL0f0M4wJXS6wz19Q0YezeALnGMQFqmg2w625WfgJ0=;
 b=XMlAFq7EeilQ5iFd8FEVFGGE8kZhDVaohjexSW62n0YuqLZj4BK7pAJI42cYE1D9SBdDS6R4ga1jWDUoK+chNMVe6MLxZnfFg4t5HXZMNwrmY8FoQqj/fIFLnWR9IV8qq58uNTp60X0gFCkV4mh6KL0E/Zck9CspT6SYHTbSdaJDc9mFFEYqALMTRCQErb5KhWiErmSLFuzJMcf5or4vrswhAn+efS8+Tuxepi8fRUJVjyhlIs8T4N4ecj8Zrvx1jNURcZw5RkzfKKrD5PlgXpPCeffBiUJ9Ic3vqspthZbeTXHsGstfY5hViUtjWQ5AZ4ALzV7052Z2uQFNVFXiCA==
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20)
 by PA4P189MB1200.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:cc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.3; Fri, 21 Aug
 2026 08:44:21 +0000
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d]) by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d%5]) with mapi id 15.21.0360.003; Fri, 21 Aug 2026
 08:44:21 +0000
From: =?utf-8?B?Um9sYW5kIEtvdsOhY3M=?= <roland.kovacs@est.tech>
To: "patchtest@automation.yoctoproject.org"
	<patchtest@automation.yoctoproject.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Patchtest results for [scarthgap][PATCH] Fix gnutls
 CVE-2026-33846
Thread-Topic: [OE-core] Patchtest results for [scarthgap][PATCH] Fix gnutls
 CVE-2026-33846
Thread-Index: AQHdMK4NbpTPGtvs/E218cKjlIHRFram/7SAgAExdYA=
Date: Fri, 21 Aug 2026 08:44:21 +0000
Message-ID: <df7d65630556fef8dd922eda1a6af57553c1613b.camel@est.tech>
References: <20260820141317.937328-1-roland.kovacs@est.tech>
	 <010101a01f952c97-77bb6525-2ab1-4326-9339-d2a6e2b573b9-000000@us-west-2.amazonses.com>
In-Reply-To: 
 <010101a01f952c97-77bb6525-2ab1-4326-9339-d2a6e2b573b9-000000@us-west-2.amazonses.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7P189MB0725:EE_|PA4P189MB1200:EE_
x-ms-office365-filtering-correlation-id: 76a7df66-45f5-4a03-8612-08deff60655d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|4022899009|38070700021|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 re1ehyTZNxEP4e31oE/m31NF7RXxE0o+sSSM8WmpJ5mDJN40tEpDAoJr3gu5P5wra0tdtiKcKSHh7cvHtZaksBcK+44/qjXxeRSEXFL6oTHG5iw2SdCRGtX/OLACH3Od1fBRyE24eGNhrUM63Jd0ZT/xowZ24q98VxYVnNPeClim5TdGYnOEZJmXlzTRg6aqjj2XqQoeObtUSxAZKKqB/iE+8/WPhYfKtbWT9UHwpSAygRAghJ2CRVzn85iNyAZ7qAVar0YHEcBfDZw8gy2HZDgWMvMyFa4wGdcKtLqEVM+9Q4YNCF5kvHRxwKI71M9GenJJeTJAOppYY3+NXlQCJogZQ2azmI2S0H7J0ns741aX5ZehyI5y4s/TEMn9lFK3DAZJJb7tslcJL+tyiURbg+VvKbv29aIXl4lNqaLnJtwBwZzOktpOyJrELVCHgmc5Qx0TEZPb9qqXDuJE5zQOdeuQ2LTp+mXjd0OSXacfg6WaLAM/gZNnSEiVdLfAdJnBctw0Ajm6MlkBwFO/av3JBozlbMgc/MnMe3s98NdVsnW2rTJWJuhPqsH9bY9wb5tO0BnHdgLN1yR4If/rZNrmIdtgKv2VloBqC5Li+l7ZnImhFFNt/ZCUyWFDj98mDAmnxdN6ouATzwqw579p5B50HCDi+T2SbbInon2EeZRUk0I=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB0725.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(4022899009)(38070700021)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?REhFRUJOLzZxcWc3QTFZbUUrTUsxNE1ScjZhRWJ4UnpXVlRGbUQ3TlhBUnlv?=
 =?utf-8?B?S05Ld3ZQLzdHVlRpS3BjWnpJb29ibjh5R3FVOTB4ZXdzMWVNb05OUkVWaTRC?=
 =?utf-8?B?TlZJd2p1MjhQN1phTDNBMmZBUE5taVJmUXI3WWQvRCtFZEQ2dmFlT2NDcVVV?=
 =?utf-8?B?L3RXMU5SS2hISUFvOW5SaE8wQmFLcC95RittS1FGdkVUZEZFQzhVaG9hU2M3?=
 =?utf-8?B?eWxNZFVXUENtcDJGYkl3UFNoRVdUWEtVaCtHZ0lFemFuQkRtUi9iSVRFWFFu?=
 =?utf-8?B?eDJyWVNueitLcHBpK1BURHZQZHZQekttYmhaMmNPeXI2MStrR0ZqWFMrd3l4?=
 =?utf-8?B?cTFqYndwQjFCaGhXZll3aUlNVmpmZjlQU2kvOGg5MW41YnIvQTdsaEhGaUF4?=
 =?utf-8?B?aElVK0pPNHRlaWxGL1hOUjI4MGtkakpLR3J2bmJlYlpQQWdvVDhOVzBGM01o?=
 =?utf-8?B?UjhPVWJCLzVDSEIxMlJySHZJc2g3ZnhoZGVhOC9CdXc5U0dOT2tNNFBaU1RD?=
 =?utf-8?B?TTQ3VlpJcmx5U3pnd0prVXU4WmNGcFErYlRRZk1MZXlleU4vQ0lRckRFZytv?=
 =?utf-8?B?Zmh5OXo5eWhpT1p2YVdsU3Q4RXBXelIrcFZzcWpGbmx0S0JLMnFUYVdSL1Vk?=
 =?utf-8?B?YlZ6OXJ2dDJ6QTdDN2tTcjRMVUR1UEdPcmNhVHVxVThlbURRMWJoSVlBR2Rv?=
 =?utf-8?B?Z1g4am5ML245SU4wOStxdmxuV0lEcE9jcVlYMS9rUE05TVVDSDFhUUdUWk9C?=
 =?utf-8?B?WTVTT2F2M3hnN1hsQ3VrNVRKVXJzODYybXF3bzdrQW90RkY3NVZocUJ3bit2?=
 =?utf-8?B?VDd4L1FvM2lHbHZQZS9lUzVjVE1aR3puTEY5a21sRmJVMTNLZFFCUEdSTHpp?=
 =?utf-8?B?SWVDVDBDOVA3KzJjUDZXNW02ZEN1M0FYamJDK0hXR1FmSWthS2tPdDBkU1JW?=
 =?utf-8?B?Mjc1Y2ZNVk5xc0lnU1gwSlo2Smc5MXBBZFJHSDJoOHpxR2JPcTMzYVBDS2to?=
 =?utf-8?B?Yk84K0pBaXFvWDNEUVlNR0RzQzQySU5VdWRFak5uMThEbWZQTG1aVTd3bEs2?=
 =?utf-8?B?bzk2VkVWRFRVcG1FY1U0SEhtTFpyMEtuMEY5MjlvZHduenMwYk1RVlRhWldE?=
 =?utf-8?B?aG1UbGU2T3kyVUdHMC9VaFNUWnlyYXBwK0xvZlBYMVUvOVBKYmlQT0tacnp1?=
 =?utf-8?B?dTZnNDh3M25lV0cwM0owR2wzbFJSV1J5SnBVMkpnZE5pYVBJY2tnSTQ1Mmo5?=
 =?utf-8?B?Smdpa0FsYnBhU21BUE55dWRLdEN4VWE4Mit3WmdRSEFta1QzY0hxMnU2dk55?=
 =?utf-8?B?am4zUWttUG0rRWRNbFJReHBTelN0bFJ3d2dWc2dkazNHTlpyK0FDN01NUXpX?=
 =?utf-8?B?Y3F4cGQxODYrajhBQk1mR3RuNHZnalVISSs3T0ROVGlpMkE1eGh4U2VhOXh5?=
 =?utf-8?B?cUQ4V3NLeENoblV3d0t0Yzl1b0RwNTZDU29JUkNQUFo1ZUt0VVJrM052Qm9T?=
 =?utf-8?B?dklHSE1icElHNll3LzlmVEJNT2xCNlk3K2lheG9GTU5QQ2thaDlhVi9zcGF2?=
 =?utf-8?B?Qnd0U3RLTitJc0RPdVBLbEl3ejIySnZQRW9tZndmTmJERU1KdWNueGp0RW8x?=
 =?utf-8?B?cHBnYXhUM2dhanNQb3RyS1ptazZOUmgrdkZsUG9wbzh5SU0yUHBENHFFc28r?=
 =?utf-8?B?b2lId2l5blgwbXByYktiaVZmcWhGS3R3SlI2RThiYWs3SEZsRVhlWHVHVitW?=
 =?utf-8?B?NCtVNjg1OTJSMkxLWTNmc3JiRmZSODY3SXd2VEtleDF6ZEVqZVZSZmVDdVlX?=
 =?utf-8?B?SFNBMjVsbDFiSTlhQjlOQXdmdmxDMXlqd3g1VklINmxoWm9OSEpnVVZNWGUr?=
 =?utf-8?B?MDVSRVFRL2d0VHIwUlFacFpRMkdSMHBrenZaTW1hSldrdEcxRUEzcjJUbE5p?=
 =?utf-8?B?bGdENTdPa1RRQ3VGNUV2UjNpZDFOeGxrMFRITFhEc09US05PQU5CM3hWM3hC?=
 =?utf-8?B?Tk9YbjJxZUZUTXJxOW9ydlQxZHB1NWJXYWgrQUFzQ0I5Ump5UVlDZSt2Risx?=
 =?utf-8?B?S0lqOXBvMTROQ1Y2TGgxa29ySkxEdjBCRGdCVXBHTjNsVzAzU2JmM0VOV0JT?=
 =?utf-8?B?TnhnVmJHeTZyS1lta2hQK3lOeGxMWVl3ZVhOUktzQktJTm01Z2RrWDdXVkJ4?=
 =?utf-8?B?bG1Za3VzMm9ZbWRick0vczJsaFRmQm1WZU9IVFh4ejg2VmVJbXNqQXRtOUNy?=
 =?utf-8?B?MVRxcWhwWUhSZWY5Y2tpMFBiTGhhdUxRb1JsTGlBNGlwRnBWMW9DeFNIK3lz?=
 =?utf-8?B?RmhTSmxTV3JwanQ4OHZuYS8wbjZ4RmVNcXJNS2NaN04rdGo4M3dCZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C6E5A9A307FD04E9C865BBA6F53133A@EURP189.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a7df66-45f5-4a03-8612-08deff60655d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2026 08:44:21.5487
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nW/AYpx7QBC01gSKbfmeKa6QMYCnpu+CRQi235EF3I/Ahty5CbzdFLl5vD1+oNCwZrgjV/QhBQZjRhFkNZjvwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4P189MB1200
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 08:44:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243902

T24gVGh1LCAyMDI2LTA4LTIwIGF0IDE0OjMxICswMDAwLCBQYXRjaHRlc3QgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+IFRoYW5rIHlvdSBmb3IgeW91ciBzdWJtaXNzaW9uLiBQ
YXRjaHRlc3QgaWRlbnRpZmllZCBvbmUNCj4gb3IgbW9yZSBpc3N1ZXMgd2l0aCB0aGUgcGF0Y2gu
IFBsZWFzZSBzZWUgdGhlIGxvZyBiZWxvdyBmb3INCj4gbW9yZSBpbmZvcm1hdGlvbjoNCj4gDQo+
IC0tLQ0KPiBUZXN0aW5nIHBhdGNoIC9ob21lL3BhdGNodGVzdC9zaGFyZS9tYm94ZXMvc2NhcnRo
Z2FwLUZpeC1nbnV0bHMtQ1ZFLTIwMjYtMzM4NDYucGF0Y2gNCj4gDQo+IEZBSUw6IHRlc3Qgc2hv
cnRsb2cgZm9ybWF0OiBDb21taXQgc2hvcnRsb2cgKGZpcnN0IGxpbmUgb2YgY29tbWl0IG1lc3Nh
Z2UpIHNob3VsZCBmb2xsb3cgdGhlDQo+IGZvcm1hdCAiPHRhcmdldD46IDxzdW1tYXJ5PiIgKHRl
c3RfbWJveC5UZXN0TWJveC50ZXN0X3Nob3J0bG9nX2Zvcm1hdCkNCj4gDQo+IFBBU1M6IHRlc3Qg
Q1ZFIGNoZWNrIGlnbm9yZSAodGVzdF9tZXRhZGF0YS5UZXN0TWV0YWRhdGEudGVzdF9jdmVfY2hl
Y2tfaWdub3JlKQ0KPiBQQVNTOiB0ZXN0IENWRSB0YWcgZm9ybWF0ICh0ZXN0X3BhdGNoLlRlc3RQ
YXRjaC50ZXN0X2N2ZV90YWdfZm9ybWF0KQ0KPiBQQVNTOiB0ZXN0IFNpZ25lZC1vZmYtYnkgcHJl
c2VuY2UgKHRlc3RfbWJveC5UZXN0TWJveC50ZXN0X3NpZ25lZF9vZmZfYnlfcHJlc2VuY2UpDQo+
IFBBU1M6IHRlc3QgU2lnbmVkLW9mZi1ieSBwcmVzZW5jZSAodGVzdF9wYXRjaC5UZXN0UGF0Y2gu
dGVzdF9zaWduZWRfb2ZmX2J5X3ByZXNlbmNlKQ0KPiBQQVNTOiB0ZXN0IFVwc3RyZWFtLVN0YXR1
cyBwcmVzZW5jZSAodGVzdF9wYXRjaC5UZXN0UGF0Y2gudGVzdF91cHN0cmVhbV9zdGF0dXNfcHJl
c2VuY2VfZm9ybWF0KQ0KPiBQQVNTOiB0ZXN0IGF1aCBjaGFuZ2Vsb2cgdHJ1bmNhdGlvbiBub3Rp
Y2UNCj4gKHRlc3RfbWJveC5UZXN0TWJveC50ZXN0X2F1aF9jaGFuZ2Vsb2dfdHJ1bmNhdGlvbl9u
b3RpY2UpDQo+IFBBU1M6IHRlc3QgYXV0aG9yIHZhbGlkICh0ZXN0X21ib3guVGVzdE1ib3gudGVz
dF9hdXRob3JfdmFsaWQpDQo+IFBBU1M6IHRlc3QgY29tbWl0IG1lc3NhZ2UgcHJlc2VuY2UgKHRl
c3RfbWJveC5UZXN0TWJveC50ZXN0X2NvbW1pdF9tZXNzYWdlX3ByZXNlbmNlKQ0KPiBQQVNTOiB0
ZXN0IGNvbW1pdCBtZXNzYWdlIHVzZXIgdGFncyAodGVzdF9tYm94LlRlc3RNYm94LnRlc3RfY29t
bWl0X21lc3NhZ2VfdXNlcl90YWdzKQ0KPiBQQVNTOiB0ZXN0IGxpYyBmaWxlcyBjaGtzdW0gbW9k
aWZpZWQgbm90IG1lbnRpb25lZA0KPiAodGVzdF9tZXRhZGF0YS5UZXN0TWV0YWRhdGEudGVzdF9s
aWNfZmlsZXNfY2hrc3VtX21vZGlmaWVkX25vdF9tZW50aW9uZWQpDQo+IFBBU1M6IHRlc3QgbWF4
IGxpbmUgbGVuZ3RoICh0ZXN0X21ldGFkYXRhLlRlc3RNZXRhZGF0YS50ZXN0X21heF9saW5lX2xl
bmd0aCkNCj4gUEFTUzogdGVzdCBtYm94IGZvcm1hdCAodGVzdF9tYm94LlRlc3RNYm94LnRlc3Rf
bWJveF9mb3JtYXQpDQo+IFBBU1M6IHRlc3Qgbm9uLUFVSCB1cGdyYWRlICh0ZXN0X21ib3guVGVz
dE1ib3gudGVzdF9ub25fYXVoX3VwZ3JhZGUpDQo+IFBBU1M6IHRlc3Qgc2hvcnRsb2cgbGVuZ3Ro
ICh0ZXN0X21ib3guVGVzdE1ib3gudGVzdF9zaG9ydGxvZ19sZW5ndGgpDQo+IFBBU1M6IHRlc3Qg
dGFyZ2V0IG1haWxpbmcgbGlzdCAodGVzdF9tYm94LlRlc3RNYm94LnRlc3RfdGFyZ2V0X21haWxp
bmdfbGlzdCkNCj4gDQo+IFNLSVA6IHByZXRlc3QgcHlsaW50OiBObyBweXRob24gcmVsYXRlZCBw
YXRjaGVzLCBza2lwcGluZyB0ZXN0DQo+ICh0ZXN0X3B5dGhvbl9weWxpbnQuUHlMaW50LnByZXRl
c3RfcHlsaW50KQ0KPiBTS0lQOiBwcmV0ZXN0IHNyYyB1cmkgbGVmdCBmaWxlczogUGF0Y2ggY2Fu
bm90IGJlIG1lcmdlZA0KPiAodGVzdF9tZXRhZGF0YS5UZXN0TWV0YWRhdGEucHJldGVzdF9zcmNf
dXJpX2xlZnRfZmlsZXMpDQo+IFNLSVA6IHRlc3QgYnVnemlsbGEgZW50cnkgZm9ybWF0OiBObyBi
dWcgSUQgZm91bmQgKHRlc3RfbWJveC5UZXN0TWJveC50ZXN0X2J1Z3ppbGxhX2VudHJ5X2Zvcm1h
dCkNCj4gU0tJUDogdGVzdCBsaWMgZmlsZXMgY2hrc3VtIHByZXNlbmNlOiBObyBhZGRlZCByZWNp
cGVzLCBza2lwcGluZyB0ZXN0DQo+ICh0ZXN0X21ldGFkYXRhLlRlc3RNZXRhZGF0YS50ZXN0X2xp
Y19maWxlc19jaGtzdW1fcHJlc2VuY2UpDQo+IFNLSVA6IHRlc3QgbGljZW5zZSBwcmVzZW5jZTog
Tm8gYWRkZWQgcmVjaXBlcywgc2tpcHBpbmcgdGVzdA0KPiAodGVzdF9tZXRhZGF0YS5UZXN0TWV0
YWRhdGEudGVzdF9saWNlbnNlX3ByZXNlbmNlKQ0KPiBTS0lQOiB0ZXN0IHB5bGludDogTm8gcHl0
aG9uIHJlbGF0ZWQgcGF0Y2hlcywgc2tpcHBpbmcgdGVzdA0KPiAodGVzdF9weXRob25fcHlsaW50
LlB5TGludC50ZXN0X3B5bGludCkNCj4gU0tJUDogdGVzdCBzZXJpZXMgbWVyZ2Ugb24gaGVhZDog
TWVyZ2UgdGVzdCBpcyBkaXNhYmxlZCBmb3Igbm93DQo+ICh0ZXN0X21ib3guVGVzdE1ib3gudGVz
dF9zZXJpZXNfbWVyZ2Vfb25faGVhZCkNCj4gU0tJUDogdGVzdCBzcmMgdXJpIGxlZnQgZmlsZXM6
IFBhdGNoIGNhbm5vdCBiZSBtZXJnZWQNCj4gKHRlc3RfbWV0YWRhdGEuVGVzdE1ldGFkYXRhLnRl
c3Rfc3JjX3VyaV9sZWZ0X2ZpbGVzKQ0KPiBTS0lQOiB0ZXN0IHN1bW1hcnkgcHJlc2VuY2U6IE5v
IGFkZGVkIHJlY2lwZXMsIHNraXBwaW5nIHRlc3QNCj4gKHRlc3RfbWV0YWRhdGEuVGVzdE1ldGFk
YXRhLnRlc3Rfc3VtbWFyeV9wcmVzZW5jZSkNCj4gDQo+IC0tLQ0KPiANCj4gUGxlYXNlIGFkZHJl
c3MgdGhlIGlzc3VlcyBpZGVudGlmaWVkIGFuZA0KPiBzdWJtaXQgYSBuZXcgcmV2aXNpb24gb2Yg
dGhlIHBhdGNoLCBvciBhbHRlcm5hdGl2ZWx5LCByZXBseSB0byB0aGlzDQo+IGVtYWlsIHdpdGgg
YW4gZXhwbGFuYXRpb24gb2Ygd2h5IHRoZSBwYXRjaCBzaG91bGQgYmUgYWNjZXB0ZWQuIElmIHlv
dQ0KPiBiZWxpZXZlIHRoZXNlIHJlc3VsdHMgYXJlIGR1ZSB0byBhbiBlcnJvciBpbiBwYXRjaHRl
c3QsIHBsZWFzZSBzdWJtaXQgYQ0KPiBidWcgYXQgaHR0cHM6Ly9idWd6aWxsYS55b2N0b3Byb2pl
Y3Qub3JnL8KgKHVzZSB0aGUgJ1BhdGNodGVzdCcgY2F0ZWdvcnkNCj4gdW5kZXIgJ1lvY3RvIFBy
b2plY3QgU3VicHJvamVjdHMnKS4gRm9yIG1vcmUgaW5mb3JtYXRpb24gb24gc3BlY2lmaWMNCj4g
ZmFpbHVyZXMsIHNlZTogaHR0cHM6Ly93aWtpLnlvY3RvcHJvamVjdC5vcmcvd2lraS9QYXRjaHRl
c3QuIFRoYW5rDQo+IHlvdSENCj4gDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtz
OiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1Jl
cGx5IE9ubGluZSAoIzI0Mzg2OCk6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29w
ZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMjQzODY4DQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6
Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzEyMDg0NjQyNi85ODk3MDc0DQo+IEdyb3VwIE93
bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVu
c3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQt
Y29yZS91bnN1YsKgW3JvbGFuZC5rb3ZhY3NAZXN0LnRlY2hdDQo+IC09LT0tPS09LT0tPS09LT0t
PS09LT0tDQpNeSBiYWQhIEknbGwgcmUtc2VuZCB0aGUgcGF0Y2ggd2l0aCBjb3JyZWN0IHN1Ympl
Y3QgbGluZS4NCg0KQ2hlZXJzLA0KCVJvbGFuZA0K


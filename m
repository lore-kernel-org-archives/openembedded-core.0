Return-Path: <michael.haener@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFAB5CCF9E3
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 21:46:22 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.40])
 by mx.groups.io with SMTP id smtpd.web11.1116.1761860777686702325
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 14:46:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=lKgULFA2;
 spf=pass (domain: siemens.com, ip: 40.107.162.40, mailfrom: michael.haener@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SgnbxAMVh9VtbRRqYTvR5qdxhhPy8XJTROwm7w1lzAngw9MPQsNOzGNJzcnZmJfj4jaCCNH5XCJqCMdidXy59LIBImpCjGTci4agvtmgj9Pc+kwjb/kxhp4t4orIdKNCJ8tAMOzZOQxFi5Qf/L4vLBDUxDfIh/zym4x+Bmhm89BotDXd/OIC3B12aBVGrMW5w2b8KH3001N6qzxC01p5HpnKyo4FGm7KffTpdzlKFe5/oaZT4qzm8djvILqVonOrjTkCi4EJm9+j/1AdZfCUSFH+NK/Rnd1xOP2OiZmkea8DAU7CQZ+WEmmJ76QE5jfhnHmOCS04wd7GfiOdp1xH+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/kkvQxtU5uwSuJ0oO5aVBwR2XTZ4SXW+tbexAhePa58=;
 b=RZ5JfVKoAJ3KLo7ej1xjih4fWatT7D/kD5fVhGrZTA7vKArJ+FkLryMWYw22BqioXUCXhc4lSa7HTDGljt0qhS0bWS+lQ6P3I15t943lPguPbCaR5P23eZQAlJyN4T/WZKIAu+GWrof9S6Z67R/BABCsFxo+5yWOOTPumkFX1oqZQI3gjuGiUM66/4ArOZmUFF02fq0DzNyzcpbMaJfv1C5xE3ilEljgC1OdTey5u0RRv4xKc/XJ2sywFn21AeooDrDJXoE/gMtZffBm5ZU2Y93T6XEURTgW1fjmyoUuINHb76VCotucB+Wt5tM6QhyA2k52tcsSGD6+QwOykRDr8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/kkvQxtU5uwSuJ0oO5aVBwR2XTZ4SXW+tbexAhePa58=;
 b=lKgULFA2OnDVK4lTK1LmP/T0KborZzVbu3xJ2ZvS8vnSDOHWR68s4aQn+/nr6OR7z4czvnX6ItGdY+wegjpmOk/ON89mx7V3wufImltbkI61761DR0sqwLuvqhEGXrD9Rx+vNXNWJ8ghyCT/leWsb3qlvp38/CV31M4ZdWOWld3IMU+NCXDY8FpOqduiT0HUzmsovxDJSdxnp8rEr1dk5oJGV0j2fpO9Rjuh4gxhyK/QQXKCph+KTXEt2GieImLX0hp3p4L7yA+E+9p1ws/+8roTNqcS0WZky5Q6WkGpcNZELrD97WCIZ24uZL0gn/Qj5zFdGChThXZNrCwbmuhdTA==
Received: from DB9PR10MB7098.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:458::5)
 by PA4PR10MB5708.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:267::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 21:46:13 +0000
Received: from DB9PR10MB7098.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7162:954:18b5:f5e7]) by DB9PR10MB7098.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7162:954:18b5:f5e7%5]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 21:46:13 +0000
From: "Haener, Michael" <michael.haener@siemens.com>
To: "denis@denix.org" <denis@denix.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] oeqa/runtime/ping: don't bother
 trying to ping localhost
Thread-Topic: [OE-core] [scarthgap][PATCH] oeqa/runtime/ping: don't bother
 trying to ping localhost
Thread-Index: AQHcPhQp9eyeGWh3JkOq5mlGbnqdCLTbSDyAgAAIyQA=
Date: Thu, 30 Oct 2025 21:46:13 +0000
Message-ID: <87935df8d36e7cbfe4f3ff5da020431d45b552f5.camel@siemens.com>
References: <20251015204131.14992-1-michael.haener@siemens.com>
	 <20251030211437.GI3125@denix.org>
In-Reply-To: <20251030211437.GI3125@denix.org>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2+intune 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR10MB7098:EE_|PA4PR10MB5708:EE_
x-ms-office365-filtering-correlation-id: 11de3c13-3375-463b-3b32-08de17fdbf32
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|1580799027|38070700021|7053199007;
x-microsoft-antispam-message-info: 
 =?utf-8?B?UzhNTTFZK1VlbWRkVkQ0TzgyaHhTbktHd1o3S3c1bTFXNGNJeXVKV0d2MkFY?=
 =?utf-8?B?YmlNR0Yrbkp5bDNtZjNWQS9nQ1VWaWx6YVZEMlRkcE9TRWVSeXVkNlpwSlVm?=
 =?utf-8?B?N3BNMFNhY0czRmQ5RnZ5K2p4cmNSaHhYbEo0YTNsMWRscDJxeDk2ZFllYWVn?=
 =?utf-8?B?OVhsYm9IcXpvQU8zVUxleUluczFmSVhMTkVPSTlaUDB4K3BuVkV0azl1T0Rk?=
 =?utf-8?B?SHVBREtJcElHMVY2TXZoY3M2TVMxVnBtM2k4ZFhQNXlWNUJSOGhpQmdxRE1h?=
 =?utf-8?B?TzBhTHNSRTFUTmRmQzh4YUUveXdxWlpUMjlMa2h3dDI1bkpRazZYMnpqb1NC?=
 =?utf-8?B?SFAzKzJNK253TW9SaGdWdDY1SXNoWnlpOVhjRE1RRTlaemJTWHhmaExnRWFn?=
 =?utf-8?B?WlBWbENwN2h5YWpzcXlKODM2RkRRRkxyT2Z3THFLWjV3VENVL2lVOEFZYisy?=
 =?utf-8?B?cW43dHRpUUR4dkRqN3FVM0tONXpJWkEya2E0YXRTWlBLdkpzUFZsSjNVUVhm?=
 =?utf-8?B?RFFHdzkxMmh6a2lPTGU4akduaVlqSGcvT3pqQXlndUVQbXVjU3VMeXZXeUNF?=
 =?utf-8?B?ZnByZGE2MFhvczRlTW92QStYSGV3dWI3SzZOMzEwcHdrS2JuS3JSMCtzamRo?=
 =?utf-8?B?WVRsZGp6UFJzVEdNem5jQkRxc2c4Wmw0Qk1RS3loRXVLeEo1bjNnQ2ZrL0Fr?=
 =?utf-8?B?RDE4cWtVUkcwTk1NUnBvSUQ0S0hMYjVvSXpWSUw4MDdPZzh3RzlmTGU0ZDFB?=
 =?utf-8?B?SnV5Ky8wM3ZkMzlOUFZ6QTg0MHY5YXdXNkZuZG14NTdKZThkcW1PMjM4SWxr?=
 =?utf-8?B?azVaeEJRZThVUDdjQU5CWFpyZVRjYlZXeXdpVW9ENXVCRTlza1g4NjUxL3NG?=
 =?utf-8?B?YTZnQnhYRXVxd3M3ZVNESnQ5YnUzNXBHekpjYUczMlBTajUvMXdsR1Y3cTVX?=
 =?utf-8?B?U3FqZ2JhWlFmc0xPeEZ0bExrYy9zdnFxSG1QdEh2YmpnVGl0UkFNS1NnREpE?=
 =?utf-8?B?dVpvVDU5cHlWVW01SDRCYStJcUw5ZFJmck10OHhxL3FjdzVTSGswRTh4RUhL?=
 =?utf-8?B?QnBmaS9ObGxHK1oxLzlSSGJnRnNuRHcrV1dORDhtQTRDaS9TQ0JSY1ZETG1v?=
 =?utf-8?B?QlB1Y0dJcXFseFdDZ1JUeGVtQ0o0a05CV09PWDk1VWtmRCtjS0ovV2lEL2xl?=
 =?utf-8?B?UHJ6WDNGMmM0cHpCWkZwWldEUHRZUTNwczNWSEQ3bmhmWDk5ckE5YVkreFRy?=
 =?utf-8?B?VkVNTnZwUVFsOVJ0c0laM1Bqa2VUYzVIakoyNnNSa3AwYytubDlnejRsampw?=
 =?utf-8?B?VGFZc3pLN0gvY3hGZDhUSm8zVDdhNEdaNDg3SzJicEVVazlYYk1ub1JqQnAx?=
 =?utf-8?B?ekN2RVZBcjFGMjZFMXBvcXFTYkhhcjhxY3RESkRqRllBM05iWnRCWm1zbCt1?=
 =?utf-8?B?ZktDSWlsTnoySXlCOXB4VnFKck5yWWRTRTVVVzVoSjQ5RzFVYWhKcm5laVFG?=
 =?utf-8?B?cTVTRnNMc3Q2Y2l3TERPOUk2SDh2RzVPbkwxdGxHVk9QaCtSTnJqRDkxd0Nt?=
 =?utf-8?B?MVYzakl2OVRocHhJRjdjQUxrNnBSYWlzL1pIaGRIRSsxOW9TUGVmeUFDdldR?=
 =?utf-8?B?NzgvTUwvU3VJRkZaSEFXdTA4b3FoaUdEMGI4S3RXeWR4eGVabEpLVnZYeG1o?=
 =?utf-8?B?SjhZVWNnaStqTlh0UHhLTnFmR2U1NG96ckJuVkVxSGlmTmdrbjlJRVplQ0U5?=
 =?utf-8?B?SjJmTXVZS2dSVHovVTMvZGNpRElZZ3Znb0pZSi9hbnVyVWlsSytzRVZ4Vmh3?=
 =?utf-8?B?ZXRneElIL054NVNtUDBqUG9ncE9JY2lseFcvRVowbnBjT1l3TURJMHFTTWlv?=
 =?utf-8?B?aHlpUmZnblExcVlScVpVSDRKeDNqYmVUb0RHbDdrL2Q0MDFpN3BleDg3Q2I5?=
 =?utf-8?B?WVd4RXlDWEtvcStqWGpsQXdlSE1rUUlvUUdPSzZJRXNRdjl3R0czWXlkeXUv?=
 =?utf-8?B?VTc4eko1STdjTlpyZStCV3RHaUNGVGZhZnRzeHVOQURrdys3ZFI2cVdpY1hp?=
 =?utf-8?B?ZkhhRUhJRDNOL1ZPNm50THJlOEZvdGlzUm5yZz09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB7098.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(1580799027)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?d0tKRExUOTJOczhDVzFidEhvWEZFei8yVllHZmpHMFVSZ2hYT2xKTHpDVXpP?=
 =?utf-8?B?VmQ4U1paTlRsblA4SndiTDVTMXpGLzFDdVNBZ2U0REVIbWppNERHUTFtaHBl?=
 =?utf-8?B?R2lBWUwxb2JUbWo1QldWRjVIQVRTOFUxNHJpcWswTStjK0NHelA1Tjc2cVM2?=
 =?utf-8?B?aThlWHZrazFvT21oUHVEOHFNUHFnUi9nZ3dVeTBtekgwRVpFNUgzUDZpRDZz?=
 =?utf-8?B?SjI3MEMwS2ZJSFdqSGVjNjE2UWpSeWI4azdYRUJOUGVtcmtnMWFLVEN2VUYx?=
 =?utf-8?B?TWJQclZyQmZQYVM5eTJHZ296eEFzWExlRFFjY294clJsWUtaeW5RKyt3NWdr?=
 =?utf-8?B?STdYc2ErMUlGRGpWRkJqV0x5QjF2akxoa2h5MWIwWE9OcnJGOXBmNm84dXlk?=
 =?utf-8?B?SWdVdzdIMU91RmVaRjJSQ21ISTluNDZCVmxsSlFJcHRaSHdTVXc4eG5XTGxQ?=
 =?utf-8?B?dTgxdHBoN0RtVWs2SGxuUnZjSEIvZmR1cm9PVnNaeWF6QWZoWjA4eVpPMWdE?=
 =?utf-8?B?KzJxL25lTTJMN09mOTY4REZsdmZVZ1FkQ2lXZWNmSWR2UjhGaGJkVnRrR0R5?=
 =?utf-8?B?ZlB1MTg2VWJBbmI5NzEvdnFoVGViY1lUM0FJOU1HWGRsZ3h1TGc2WjMzOGxw?=
 =?utf-8?B?VzVEc3VGWXduUjJFaGU3eUIrUHVJTzE5WXEyZDRsd3A2TUNWK2g4WnhxRXYz?=
 =?utf-8?B?cVJWYmdvc2svZ1c3WGZDTWoybjZEaFgzblQzUkYydGZBTys0TWhBRWViMDRm?=
 =?utf-8?B?R2ZUeXBveStiOW9CaXJZMFZ3SE1MQUZYVExhdmpiRE40KzZFZVBTSnNLYWov?=
 =?utf-8?B?STRHbWUzZ1RRQ1g2cXpDOER0TDdjeE82a2ZjV1ZtSVZkOUhOTHpLc00wQjZH?=
 =?utf-8?B?Wkk0U1FMbTdYb0ZIeVBvSnE4cmYrKy9SWTZrQVFUSkFpZXE5amVpa3ZiaTNG?=
 =?utf-8?B?bnVkb0F1UjEvckZxMGh3elFuY1QzRmd4VFE3VmJ5bCt1dnl2a0xvbWdveDVV?=
 =?utf-8?B?QTVabHNvcVB0OUhOb3U5RGI2L1lyelhGQTVQek43Z3Z2dklLKysrbVNFTnBE?=
 =?utf-8?B?T1EwL1B3cmQ2VjA5c0taSExhZ2hKUkw4cEJxaXdzb2RxdUcvS1FXOHpRbS92?=
 =?utf-8?B?TkcwZGJ0MHVMZHQrN2xJZFNEUWlhQ0RFQUU0TzUyR0V0S1Y5ZGpmVjlIWEN1?=
 =?utf-8?B?K3JyeUlWbGp0NXcvYmlQZnd2ZkVkSHVTejZqRUFmejNGUXFjTEVTenRJZ1R2?=
 =?utf-8?B?K1R3aWo3S2I0Q0d3YWo4c2lmV0JwUzlMeVR4NHErenRZVkl3ajh4STZYOVVP?=
 =?utf-8?B?Rmh5a0twdnRkc1BBMTFadVMrQ3dIQlh5ZDNTNWhpeklCZHM0WFBqRXNjajh2?=
 =?utf-8?B?TVpJeXNZRW9ycWxKUU5Ua25sWjJUTitpT0pSc1ZuUUZ5WFFueGtJZ0g0UU9I?=
 =?utf-8?B?UG1sRXRqQlp6ZzFVRGxUbzRuMmJ5bzl6SDlSaGhKRncwSTlXOGx6OWQwZkhU?=
 =?utf-8?B?bTdXZUxuMkgxa3NqWHJzWUJnVU1acTJMVnVyOEFqWXg5VG9tRFBoUVNBY1lQ?=
 =?utf-8?B?UFhDSk44dVlpUG1TZktZQjZPUUlwK2tTTndiNjFKZlNmVVArMS9wVEthUktj?=
 =?utf-8?B?ZnRIRWt1VDNkallpUC9aeHVOdHR1NERVVW1NUm1IWWh2THhrcDFMbU5iQW9S?=
 =?utf-8?B?TEwyZWFqYk83WE5PZ0l3U2M5M21RaGIzV2tvOXdEeWV3WER0UFpIK0ViMWtp?=
 =?utf-8?B?RlZYNStnUkwrY0hVSGdUZEYwWHVQanZwaks1T0dJQTJmajF5ZENQQjVPaFpR?=
 =?utf-8?B?UjhmNk5lUjY5QTlidnlMMFJNWkhhREpPSE10VXdtdUdpcmlPZ1JTVUZRbGlF?=
 =?utf-8?B?ZGxOeXlRL2tQK3RlajBZdno5bmp3QmpyQ0dRNng2UWZLTFR4dmEyRWYwK2pO?=
 =?utf-8?B?NStsNDJsZ0xNNFBKV2E0d3FubGJTY0YrdC9TVnJ3aDFLM0dVYklJdEk3bWVI?=
 =?utf-8?B?VytmTmRwd3dxVkM0aXNTcUJrS090TmxDdHJXOXZxSHVnZldicllTelBKMnpk?=
 =?utf-8?B?aUk4alVtdm1Ib1JQbTFuNGpsbjk0VFlIaDNMczIyRnAvemM5NEFYMzVlQ0Iz?=
 =?utf-8?B?MHc2WTQrSHkrRUUyK0NCK25xVHhBTHVXbGZCTWE1VWpXSTJrL0xIWlNIS3Bi?=
 =?utf-8?B?blE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A876FC4CFC8B3F40BC267F8E09367311@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7098.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 11de3c13-3375-463b-3b32-08de17fdbf32
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 21:46:13.3374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7yr9wCY2fUXR4SKD5+oyfOjadnS6OxtNT1ZDr3TVHcRGak2OGT7quJce07aTK7Jlk3Y0VPirpjVkpae+HKnJtxx7g1UGGIIHc4bhSk0IUHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5708
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 21:46:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225520

T24gVGh1LCAyMDI1LTEwLTMwIGF0IDE3OjE0IC0wNDAwLCBEZW55cyBEbXl0cml5ZW5rbyB3cm90
ZToNCj4gW1lvdSBkb24ndCBvZnRlbiBnZXQgZW1haWwgZnJvbSBkZW5pc0BkZW5peC5vcmcuIExl
YXJuIHdoeSB0aGlzIGlzDQo+IGltcG9ydGFudCBhdCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0
U2VuZGVySWRlbnRpZmljYXRpb27CoF0NCj4gDQo+IE9uIFdlZCwgT2N0IDE1LCAyMDI1IGF0IDEw
OjQxOjMxUE0gKzAyMDAsIE1pY2hhZWwgSGFlbmVyIHZpYQ0KPiBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIHdyb3RlOg0KPiA+IElmIFNMSVJQIGlzIGJlaW5nIHVzZWQgaW5zdGVhZCBvZiBUQVAgZm9y
IG5ldHdvcmtpbmcgdG8gdGhlIGd1ZXN0DQo+ID4gdGhlbg0KPiA+IHRoZSB0YXJnZXQgSVAgd2ls
bCBiZSBsb2NhbGhvc3QuwqAgVGhlcmUncyBubyBwb2ludCBpbiBwaW5naW5nDQo+ID4gbG9jYWxo
b3N0DQo+ID4gdG8gc2VlIGlmIHRoZSB0YXJnZXQgaXMgdXAgYnV0IHdoaWxzdCB5b3UnZCB0aGlu
ayBpdCBpcyBoYXJtbGVzcywNCj4gPiBpbg0KPiA+IHNvbWUgY29udGFpbmVycyBwaW5nIGRvZXNu
J3QgYWN0dWFsbHkgaGF2ZSBlbm91Z2ggcmlnaHRzIHRvIHdvcms6DQo+ID4gDQo+ID4gwqAgcGlu
Zzogc29ja3R5cGU6IFNPQ0tfUkFXDQo+ID4gwqAgcGluZzogc29ja2V0OiBPcGVyYXRpb24gbm90
IHBlcm1pdHRlZA0KPiA+IMKgIHBpbmc6ID0+IG1pc3NpbmcgY2FwX25ldF9yYXcrcCBjYXBhYmls
aXR5IG9yIHNldHVpZD8NCj4gPiANCj4gPiBMb29rIGF0IHRoZSB0YXJnZXQgYWRkcmVzcyBhbmQg
aWYgaXQncyBsb2NhbGhvc3Qgb3IgMTI3LjAuMC4qDQo+ID4gcmV0dXJuDQo+ID4gaW1tZWRpYXRl
bHkuDQo+ID4gDQo+ID4gKEJhY2twb3J0IGZyb20gT0UtQ29yZSByZXY6DQo+ID4gYTA2ZWY0M2Qy
YTUwZTE2YzMyYmQ2ZWRiZGM3YjMyYzM1Mjg2ODdkNSkNCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5
OiBNaWNoYWVsIEhhZW5lciA8bWljaGFlbC5oYWVuZXJAc2llbWVucy5jb20+DQo+ID4gLS0tDQo+
ID4gwqBtZXRhL2xpYi9vZXFhL3J1bnRpbWUvY2FzZXMvcGluZy5weSB8IDcgKysrKysrKw0KPiA+
IMKgdGVzdMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHwgMA0KPiA+IMKgMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykN
Cj4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0DQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL21l
dGEvbGliL29lcWEvcnVudGltZS9jYXNlcy9waW5nLnB5DQo+ID4gYi9tZXRhL2xpYi9vZXFhL3J1
bnRpbWUvY2FzZXMvcGluZy5weQ0KPiA+IGluZGV4IGY3MjQ2MGU3ZjMuLmJjNTQzZjZjNDEgMTAw
NjQ0DQo+ID4gLS0tIGEvbWV0YS9saWIvb2VxYS9ydW50aW1lL2Nhc2VzL3BpbmcucHkNCj4gPiAr
KysgYi9tZXRhL2xpYi9vZXFhL3J1bnRpbWUvY2FzZXMvcGluZy5weQ0KPiA+IEBAIC0xOCw2ICsx
OCwxMyBAQCBjbGFzcyBQaW5nVGVzdChPRVJ1bnRpbWVUZXN0Q2FzZSk6DQo+ID4gwqDCoMKgwqDC
oMKgwqDCoCBvdXRwdXQgPSAnJw0KPiA+IMKgwqDCoMKgwqDCoMKgwqAgY291bnQgPSAwDQo+ID4g
wqDCoMKgwqDCoMKgwqDCoCBzZWxmLmFzc2VydE5vdEVxdWFsKGxlbihzZWxmLnRhcmdldC5pcCks
IDAsIG1zZz0iTm8gdGFyZ2V0DQo+ID4gSVAgYWRkcmVzcyBzZXQiKQ0KPiA+ICsNCj4gPiArwqDC
oMKgwqDCoMKgwqAgIyBJZiB0aGUgdGFyZ2V0IElQIGlzIGxvY2FsaG9zdCAoYmVjYXVzZSB1c2Vy
LXNwYWNlDQo+ID4gbmV0d29ya2luZyBpcyBiZWluZyB1c2VkKSwNCj4gPiArwqDCoMKgwqDCoMKg
wqAgIyB0aGVuIHRoZXJlJ3Mgbm8gcG9pbnQgaW4gcGluZ2luZyBpdC4NCj4gPiArwqDCoMKgwqDC
oMKgwqAgaWYgc2VsZi50YXJnZXQuaXAuc3RhcnRzd2l0aCgiMTI3LjAuMC4iKSBvciBzZWxmLnRh
cmdldC5pcA0KPiA+IGluICgibG9jYWxob3N0IiwgIjo6MSIpOg0KPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHByaW50KCJydW50aW1lL3Bpbmc6IGxvY2FsaG9zdCBkZXRlY3RlZCwgbm90IHBp
bmdpbmciKQ0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybg0KPiA+ICsNCj4gPiDC
oMKgwqDCoMKgwqDCoMKgIHRyeToNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgd2hpbGUg
Y291bnQgPCA1Og0KPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNtZCA9ICdw
aW5nIC1jIDEgJXMnICUgc2VsZi50YXJnZXQuaXANCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdCBiL3Rl
c3QNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAuLmU2OWRl
MjliYjINCj4gDQo+IFNob3VsZCB0aGVyZSBiZSBhbiBlbXB0eSAidGVzdCIgZmlsZSBpbiB0aGUg
cm9vdCBkaXJlY3Rvcnkgb2YgT0UtDQo+IENvcmU/DQo+IA0KPiAtLQ0KPiBEZW55cw0KDQpJIHN0
aWxsIGRvbid0IHF1aXRlIHVuZGVyc3RhbmQgaG93IHRoaXMgY291bGQgaGF2ZSBoYXBwZW5lZCBk
dXJpbmcNCmNoZXJyeS1waWNraW5nLiBUaGlzIHRlc3QgZmlsZSBkb2VzIG5vdCBiZWxvbmcgdGhl
cmUgYW5kIGhhcyBubw0KZnVuY3Rpb25hbGl0eSBpbiB0aGUgY29tbWl0LiBUaGFuayB5b3UgZm9y
IHBvaW50aW5nIHRoaXMgb3V0Lg0KDQpNaWNoYWVsDQo=


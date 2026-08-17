Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B14C5CFC1
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 03:58:45 +0000 (UTC)
Received: from TYDPR03CU002.outbound.protection.outlook.com (TYDPR03CU002.outbound.protection.outlook.com [52.101.127.121])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23015.1786939118780871607
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 20:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector1 header.b=J3UHBJ3v;
 spf=pass (domain: aspeedtech.com, ip: 52.101.127.121, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IuwHs+ZLF5wZJxlaP0VIZbnNkqE2FpHgiXpLTMaP7egbISFIodD0sQGbCGeJ1HBONCRSIrRnZR1IdXgCxDopJ98LWT9fB+olhVOMuM/e9/LO2WTOyDH2RnbJe+6qrywOcPtOuGvNNeVOvn511vthWJ/MhOrd6qbxRiTlk3SOjv5Gt8vuDdOwvrdklz8lhvX4erB4Z3eufwiqKiPVUW32uWUkAcezCIGcblfSkWhwZoV00m1TI8aNuuLYGJq2JqjCx+aAMjiTwhl9cF9mzOBib375Pz/sJ+bnPTo2X+lQV488h8W5Tp1CJqRB3hvDylyyvIEAFTee4942kMn0mEZzxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKTum0ujNanP/s4dKpGuZTvTWvssVAn6q1dXllMyDcA=;
 b=FM6f+K2HfZaFZvivL6pMauorHQkxfyffUlmGc+j+drzdYYu0smbn3OLnm92m6gQ+G+TtrQJFGTW+6QynptpWYrfgeJSYrvQVRxsdSU6TS6LbEQdCNArQRtnEW/DazLAnosEDHgxsrZ94V65GGj7vgw0Lp3shcwQo9YBaahPo0b4TDrfcFQOiyAgMKfr2wYyWvd9W05fpHapiEpgg5iPCpnJtYePHnNL4/rhlYPH/9bk5cLe7kR6nkDOisuUjWM3rI5Oghj1Dk3Y7Hg3TzVXZsMIQgi1P1Gsc3cEirWTdF4tdjoKnABXf/gXd+AeKxn78bwmfC4Sr0DClf8gZqBOrkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKTum0ujNanP/s4dKpGuZTvTWvssVAn6q1dXllMyDcA=;
 b=J3UHBJ3vb6VI5B/vAVt9IX45K6Ux1MA09OvRbiFhh0djBDU+il4WGUsRQyHTD2TuiBoc1zlg8unaoa7cLHA8XYZ4MeRTewEXg8IfhxhAi8yWa7WmS1FmYUHmL0P3pgEZxxFRbaM3OQ5+dds5aq3FwlAuMi1/TIE3YQpZVnrBnNomZ2KBqI6v/2nzrT60tR4qSNc5vxZUnJOTBhWCU5npQvWM65UXMuU2HWuLrzsqBQ/ORKFdu7xCz33DGMl8QABVCuL0wlYcCJJMrRWgp15p8fRSnPHnumx+dAJJT8QfAp+KLFjOQovTuCEh0ZgVSNjVraneWG+b2GtladHuxIfO0w==
Received: from TYZPR06MB4980.apcprd06.prod.outlook.com (2603:1096:400:1cc::10)
 by TYZPR06MB6989.apcprd06.prod.outlook.com (2603:1096:405:45::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 03:58:36 +0000
Received: from TYZPR06MB4980.apcprd06.prod.outlook.com
 ([fe80::ea8a:7cb7:4822:2fb3]) by TYZPR06MB4980.apcprd06.prod.outlook.com
 ([fe80::ea8a:7cb7:4822:2fb3%6]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 03:58:36 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Paul Barker <paul@pbarker.dev>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>, "mathieu.dubois-briand@bootlin.com"
	<mathieu.dubois-briand@bootlin.com>
CC: Troy Lee <troy_lee@aspeedtech.com>
Subject: RE: [PATCH v4 2/5] devtool: Register nested git repos before the
 initial commit
Thread-Topic: [PATCH v4 2/5] devtool: Register nested git repos before the
 initial commit
Thread-Index: AQHdIM6v+ernWD7tZ0ifQ5Gml3Ixm7agmuuAgAEclgA=
Date: Mon, 17 Aug 2026 03:58:36 +0000
Message-ID: 
 <TYZPR06MB498056B5435B3865E3E3F77BFCA72@TYZPR06MB4980.apcprd06.prod.outlook.com>
References: <20260731092634.1127862-1-jamin_lin@aspeedtech.com>
	 <20260731092634.1127862-3-jamin_lin@aspeedtech.com>
 <43b1bcd191c3153ebfa58ad6e85c0eb1764a10b7.camel@pbarker.dev>
In-Reply-To: <43b1bcd191c3153ebfa58ad6e85c0eb1764a10b7.camel@pbarker.dev>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB4980:EE_|TYZPR06MB6989:EE_
x-ms-office365-filtering-correlation-id: a8fce9dc-21c1-41aa-b3a9-08defc13d03f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|38070700021|6133799003|10067099003|56012099006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 rp/kMmcB7YowJ7iBM3UUdPbCm9fzgXupW+nos3nwbZ4GHNh9W9Xz9cXfK4G65F3x0ndC9d5hFgkSTnjgEztcr4Zq+t2DPm3NaM8tjZ1w3jwlBTHDEFNFrcfS9YT0fAEO+oQCAi0l1uo2O6ZGoiuvLG/cHmGH5bxPtQBkyBCysEbNVc8UU0s7Zl65xghmj/C1Bo3MhONbOstevMjCkItsWpGcw2q8j2I+amING6QpNfXXEggsW0enSWbe8TWwsaLettvx4q1K7GFybRcUrrn0JIHjSukuEpfpsEVllDfIHjd8Vy5qBca7R+8ON/g4hKHlaTvYGqNE6ILUndjKTCLdB53j1zzt5vxzZWQIQQm/8KYO36PYprbkz2K93ehyUhrqKpVSI8jdBFe4BrHY8l49ih7wZ9aBz7j7zqGZfS9ymuAu/PEDMAHECM8Se1Nj8OxkfcaOE7ttA26ajOhI2F2QXedZGdXkeLTRIn8rv2sRaPrI9o7y/4C+XXL/NiOorCvkqVqRGZ+PRzpYnBQoux1EvM+IjALW1NAWxU6P5Ub5YCWfaNrldiO8V4JowQXhkKOhtQbsElhJWr2hVlFJsoxwq5Bxs7XB90LdaSbVVzqpDexkySHWIOtOWkFkz2G8meaeImHrgXsOj5y0Y90A+KHv/wU5xMyH2rvNIPFvSqCFhoiwrkYmE7HHip9L8womQH4G
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4980.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(6133799003)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RWR6cmU3TjNWWk5Jbm1xZndOekdGSHJobnNmenArRVpNZEszSlhRNXdSaHpa?=
 =?utf-8?B?azdPeDdVYk9KMDNSUVlPK3lWcUdQa1pIb2NKZ216cURQZFJsSGdWaG54bFVK?=
 =?utf-8?B?WGdrRHNwbDA4aXp4SitNOXA0R25jcVpFZHViZU93Y0JxS21MR0dGU1VFZjZM?=
 =?utf-8?B?OGdzelpKeTJFM0xYZlRwUTMwZmF5NWUrS2R0Y2xleGltaG1xSnZCekkrQUFy?=
 =?utf-8?B?c3pSdlduTEgzYS9nNFZTMlp0dTBJcXR2VmgwT3gzTkNlOVpvMEhiWVN4c1k1?=
 =?utf-8?B?UnR6VE9mOVY3Y1pzRnFqa3R1SEk2eUQ5OUNmWXlEOWZXUnV1bW1PSUZEUnpi?=
 =?utf-8?B?Y1lxVFk4dkM0a0ZuWVlvMFc1S1BnNDFrOEVSdlhOamc3Y205WE1mTE1TaWZ1?=
 =?utf-8?B?VGVmU1NuRzd6Sk5SamxUdVBKeEtVelJITEdwcHdVMHdpZjY1WTBPVHJwSTZS?=
 =?utf-8?B?OVhSNElicjdVU0pGUG1iZnhUSFVPNWRGaDhSOG9YV3daN1RISEoyWUlJYVUv?=
 =?utf-8?B?N21tWFRPeFlITm12eUt5QnRsVU53dW53ektadlVQN1h4dzl0Y2wwVWJmZmpW?=
 =?utf-8?B?V1E1em8zWFkxMU1HQklKTDgySFRGZnRGenlmT1k5Y2krVWkyQ2ZLMVUreDZD?=
 =?utf-8?B?K3FZM1l3ZUhmVmRTZ25OaTRhcVBPbkt1TzcrbkNlL3k1ZWhnclpaM0I3alpQ?=
 =?utf-8?B?dVQvQU85ZmUySUJqNXlDem5yYmd3VkZQVXcvYnNaOGxFVVowTThaZS9qb0Iy?=
 =?utf-8?B?aXFiREFTbVc1Vll5dGs2NUt2WlJnMDNCNm00d1VnbHlCVjNoWGZMZ1Z3UEtM?=
 =?utf-8?B?QXJpd1d1R1Rxd09WNHVDSXlYWkI3cnJ2b2VVSkNabGh6RzdNMmY1UXlEMHBq?=
 =?utf-8?B?eVlJRHN6Q0p5M3krREJ6MVN2clM1M0tSdTFZS2h1MWtSSmZVNjRMQy94aTNn?=
 =?utf-8?B?bkFYdXNZSkt6cklQblhyR0RFRVNaNnJTNEk1SjdacjFicm1aS2hVU29nNmg5?=
 =?utf-8?B?Q2M5MUdFRjZzTDc4TUVqVFEweXlFd0NSR0tSeGpWTXNqaHhWNTUwMHJrSElx?=
 =?utf-8?B?eGIvR2JtWG92NXZqYjBmVHZWSVpubTNJeDBwSFRwMEtSbURKV0xUbDJwRi9h?=
 =?utf-8?B?QitmT1hVVEkrcUYzVU5IeTlWekxFTjFHNHk0ekxwTFZ4bGdoT0ZsR21vR3hN?=
 =?utf-8?B?MzVvWmpnTU9CekhRTlZWa2tDM1hRQ2xINTJMSFNYS3duOC9RcDB1L3lzUmJN?=
 =?utf-8?B?OWhvb3pZUUxZMEkwSUZZQ3Q0QW9IVDdlNmFSYnpGZ1U4YTdSYVFqbjlSb2FB?=
 =?utf-8?B?NnpzNjR6dXBIL2RNeE5FZldUaWllV01qUUg4emUzNmZzRG1wTnJkKy94TEZ0?=
 =?utf-8?B?by9ZcURzdjd2SXFTR2ZUSU1qcHhLYVBkWWJta1JHV0o3RUZiYk84aTVYQjZC?=
 =?utf-8?B?SExWbXhSWnExWEU1UDRDK3dDWWtWdE1oSHV6RWFzZHlCTCtPVDd5bTNrU1R5?=
 =?utf-8?B?N1laQ21KQTkvODBDdnRRTHZ6MjNZUkMyM2ozQW81QnlWQVVQalBYVHkzMmly?=
 =?utf-8?B?QnRBb0JHSHZRZkwyZzU5U08xSmthVkw0N3ZUZDVzTXpsSGlLYk9PRkVyam5U?=
 =?utf-8?B?aDdXNllmRWNibEtNNmpzQXZsanl1VmFuUHlZYlNyMVl0U1Q0dytyOFI3YTI2?=
 =?utf-8?B?bDJLb1BzaTFNUElpZ2U5aXBYS0kwK3k3dE9UeTh3UmNOdXBteHR6eVFQcXhk?=
 =?utf-8?B?eEQwbmo4cjg3eGpCSTVvZm14ZzRXZ1NpbktQWkJXSkFaMDFjcGFSYmtReity?=
 =?utf-8?B?WTZBZmpGSmNyVFAwRHZiT25mYWlBaVdpcm84Q0cxTFhNcVJPRTYzSDdMTkZ4?=
 =?utf-8?B?Yk9OZllaYnk3dGJkcFBzRmhMUUlLa0hmakZpa2pETGJ1a3pHTGI3Y0FZcW1Y?=
 =?utf-8?B?NUVsUkhUcCtPQTlpZW5uRjV3bURFMGZWMVlBSVhLMUtvcVcra3hIY3VzeWty?=
 =?utf-8?B?TnA1b3g0dnJDY0NocjA2U3dMQlRObEROM2VCZ0dnRGd4QVdtMXVKMkdIUm14?=
 =?utf-8?B?cmMxeU1vbDlCc3BKY3AxQVlNUFNuRzRkaUtNNXNweW1oUVVYZWN1R2lqTkI1?=
 =?utf-8?B?ejNJVitBM2haS3hPaVJkWHNJbEJvN01nNkNYMW1Wa2tnOTh4SHh0cDF1L1Zo?=
 =?utf-8?B?MjJjZHBVdWg0K25TZndYSEMwRnNXM1dHekJIOXhQWVF0K2Y2SFFtcUFFTDFR?=
 =?utf-8?B?SjlxeTJyVm9BM29CUW9Ic0NIclNFdGdiUGw3YXBlRzhLWjl5QVg2Rmh1ZGV4?=
 =?utf-8?B?aFJETm9aVm5OVXNma3FZcXJDUmRrcU94eHFleEg2Uyt1V1hxam10QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	gQmdt7clOGDhHmcvb94flIzdT/n/5Ujm2cAjhqAhX+H8Dqp8NulmQnYrBAYJrkluHrGbdIj/FeM0KMb57fQ+NiqlVRt4NGUz53+qQGjEq4B0cGwMYjXxvZJFSW3pJIxbOw5RJxBoyvlvhTpXjaCkwSYZuow2vWQZdl7erLUmihZTE9irQWzICouWIcbgJ52fpSuxrnNfErxJB6T0j+kpSZ/lHH9Hy5fN+Xl5MJBLtpohmT1VUhqVGeo8TZwTgNWOooG40r0QPnnHdsBPKl4wBMX3/3305XB2gpfBUgePWTob93bXnkCiy6iiP8Ow0E/zM/sqpBi0MpkqzDZPXkVGog==
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4980.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8fce9dc-21c1-41aa-b3a9-08defc13d03f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2026 03:58:36.1393
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6wGmv9v3lMYV7MSJAuG2UWsjj+Cc4bt6QTWKc3eq2CSSXDcR+EwWjAsdIwCsdS7fhIsGkcSSW8Fbn5uTXpPte7NULmK55txT3qBfKoBkASM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6989
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 03:58:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243583

PiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDIvNV0gZGV2dG9vbDogUmVnaXN0ZXIgbmVzdGVkIGdp
dCByZXBvcyBiZWZvcmUgdGhlIGluaXRpYWwNCj4gY29tbWl0DQo+IA0KPiBPbiBGcmksIDIwMjYt
MDctMzEgYXQgMDk6MjYgKzAwMDAsIEphbWluIExpbiB3cm90ZToNCj4gPiBzZXR1cF9naXRfcmVw
bygpIGlzIG1lYW50IHRvIGNvbnZlcnQgYSBnaXQgcmVwbyB0aGF0IGEgcmVjaXBlIHVucGFja3MN
Cj4gPiBpbnNpZGUgUyAoZS5nLiB2aWEgbXVsdGlwbGUgZ2l0IFNSQ19VUkkgZW50cmllcyB3aXRo
IGRpZmZlcmVudA0KPiA+IGRlc3RzdWZmaXggdmFsdWVzKSBpbnRvIGEgcmVndWxhciBnaXQgc3Vi
bW9kdWxlLCBzbyBkZXZ0b29sIGNhbiBsYXRlcg0KPiA+IHRhZyBicmFuY2hlcyBvbiBpdCBhbmQg
ZXh0cmFjdCBwYXRjaGVzIGZyb20gaXQgdmlhIGZpbmlzaC91cGRhdGUuDQo+ID4NCj4gPiBUaGF0
IGRldGVjdGlvbiBuZXZlciBhY3R1YWxseSB0cmlnZ2VyZWQsIGJlY2F1c2Ugb2YgdGhlIG9yZGVy
IHRoZQ0KPiA+IGZ1bmN0aW9uIHJhbiB0aGluZ3MgaW4gd2hlbiBpdCBoYWQgdG8gY3JlYXRlIHRo
ZSB3b3Jrc3BhY2UgcmVwbyBpdHNlbGY6DQo+ID4NCj4gPiAgIDEuICdnaXQgaW5pdCcNCj4gPiAg
IDIuICdnaXQgYWRkIC1BIC4nICsgaW5pdGlhbCBjb21taXQgIDwtIGNvbW1pdHMgdGhlIG5lc3Rl
ZCByZXBvIGFzIGENCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGJhcmUsIHVucmVnaXN0ZXJlZCBnaXRsaW5rDQo+ID4gICAzLiBjaGVja291dCBkZXZicmFuY2gs
IHRhZyBiYXNldGFnDQo+ID4gICA0LiBzY2FuICdnaXQgc3RhdHVzIC0tcG9yY2VsYWluJyBmb3Ig
c3RpbGwtdW50cmFja2VkIGRpcmVjdG9yaWVzDQo+ID4gICAgICAoIj8/IDxkaXI+LyIpIGFuZCBj
b252ZXJ0IGFueSB0aGF0IGFyZSBnaXQgcmVwb3MgaW50byBzdWJtb2R1bGVzDQo+ID4NCj4gPiBC
eSB0aGUgdGltZSBzdGVwIDQgcmFuLCB0aGUgbmVzdGVkIHJlcG8gaGFkIGFscmVhZHkgYmVlbiBz
d2VwdCB1cCBieQ0KPiA+IHN0ZXAgMidzICdnaXQgYWRkIC1BIC4nOiBnaXQgdHJlYXRzIGEgZGly
ZWN0b3J5IGNvbnRhaW5pbmcgaXRzIG93bg0KPiA+IC5naXQgYXMgYW4gZW1iZWRkZWQgcmVwbyBh
bmQgc3RhZ2VzIGl0IGFzIGEgZ2l0bGluayBwb2ludGluZyBhdCBpdHMNCj4gPiBjdXJyZW50IEhF
QUQsIHdpdGhvdXQgcmVnaXN0ZXJpbmcgaXQgYXMgYSBzdWJtb2R1bGUuIE9uY2UgdGhhdCBnaXRs
aW5rDQo+ID4gaXMgY29tbWl0dGVkLCAnZ2l0IHN0YXR1cyAtLXBvcmNlbGFpbicgcmVwb3J0cyBp
dCBhcyBlLmcuICIgTSA8ZGlyPiINCj4gPiAoYWxyZWFkeSB0cmFja2VkKSByYXRoZXIgdGhhbiAi
Pz8gPGRpcj4vIiAodW50cmFja2VkKSwgc28gc3RlcCA0J3MNCj4gPiAibGluZS5lbmRzd2l0aCgn
LycpIiBjaGVjayBjb3VsZCBuZXZlciBtYXRjaCBpdCBhbmQgdGhlIGNvbnZlcnNpb24gdG8NCj4g
PiBhIHJlYWwgc3VibW9kdWxlIHNpbGVudGx5IG5ldmVyIGhhcHBlbmVkLg0KPiA+DQo+ID4gVGhl
cmUgaXMgYWxzbyBhIHNlY29uZCBlbnRyeSBwYXRoIHdpdGggdGhlIHNhbWUgcm9vdCBjYXVzZTog
d2hlbiB0aGUNCj4gPiByZWNpcGUncyB0b3AtbGV2ZWwgc291cmNlIGlzIGl0c2VsZiBmZXRjaGVk
IHZpYSBnaXQ6Ly8sIHJlcG9kaXIgaXMNCj4gPiBhbHJlYWR5IGEgZ2l0IHJlcG8sIHNvIHRoZSAn
aWYgbm90IC5naXQnIGJsb2NrIGFib3ZlIChpbml0ICsgaW5pdGlhbA0KPiA+IGNvbW1pdCkgaXMg
c2tpcHBlZCBlbnRpcmVseSAtIGFuZCBzbyB3YXMgdGhlIGRldGVjdGlvbiB0aGF0IGxpdmVkDQo+
ID4gaW5zaWRlIGl0LiBJbiB0aGF0IGNhc2UgdGhlIG5lc3RlZCByZXBvIGluc3RlYWQgZ2V0cyBj
b21taXR0ZWQgYXMgYQ0KPiA+IGJhcmUgZ2l0bGluayBsYXRlciwgYnkgcGF0Y2hfdGFza19wb3N0
ZnVuYydzICdnaXQgYWRkJyBhZnRlciBkb19wYXRjaC4NCj4gPg0KPiA+IEZpeCB0aGlzIGJ5IGV4
dHJhY3RpbmcgdGhlIGRldGVjdGlvbiBpbnRvIGEgaGVscGVyIGFuZCBjYWxsaW5nIGl0DQo+ID4g
YmVmb3JlIGFueXRoaW5nIGNhbiBjb21taXQgdGhlIG5lc3RlZCByZXBvIGFzIGEgYmFyZSBnaXRs
aW5rLCBpbiBib3RoIGNhc2VzOg0KPiA+ICAgLSBmcmVzaGx5LWNyZWF0ZWQgd29ya3NwYWNlIHJl
cG86IHJpZ2h0IGFmdGVyICdnaXQgaW5pdCcsIGJlZm9yZQ0KPiA+ICAgICAnZ2l0IGFkZCAtQSAu
JyBhbmQgdGhlIGluaXRpYWwgY29tbWl0Ow0KPiA+ICAgLSByZXBvZGlyIGFscmVhZHkgYSBnaXQg
cmVwbzogYXQgZnVuY3Rpb24gZW50cnksIGJlZm9yZSB0aGUgbGF0ZXINCj4gPiAgICAgJ2dpdCBh
ZGQnIGluIHBhdGNoX3Rhc2tfcG9zdGZ1bmMuDQo+ID4gQXQgdGhvc2UgcG9pbnRzIHRoZSBuZXN0
ZWQgcmVwbyBpcyBzdGlsbCB1bnRyYWNrZWQgYW5kIHJlcG9ydGVkIHdpdGggYQ0KPiA+IHRyYWls
aW5nICIvIiwgc28gaXQgaXMgY29ycmVjdGx5IHBpY2tlZCB1cCBhbmQgcmVnaXN0ZXJlZCB2aWEg
J2dpdA0KPiA+IHN1Ym1vZHVsZSBhZGQnLg0KPiA+DQo+ID4gTmVzdGVkIHJlcG9zIGFyZSBkaXNj
b3ZlcmVkIHRvcC1kb3duIChzbyBhIHJlcG8gdGhhdCBtYW5hZ2VzIGl0cyBvd24NCj4gPiBzdWJt
b2R1bGVzIHZpYSAuZ2l0bW9kdWxlcyBjYW4gYmUgc2tpcHBlZCByYXRoZXIgdGhhbiBkZXNjZW5k
ZWQgaW50byksDQo+ID4gYnV0IHJlZ2lzdGVyZWQgYm90dG9tLXVwIChkZWVwZXN0IGZpcnN0KTog
YSBwYXJlbnQncyBjb21taXQgcmVjb3JkaW5nDQo+ID4gaXRzIGNoaWxkJ3MgSEVBRCBtdXN0IGhh
cHBlbiBhZnRlciB0aGF0IGNoaWxkIGlzIGZ1bGx5IGZpbmFsaXplZCwNCj4gPiBvdGhlcndpc2Ug
cmVnaXN0ZXJpbmcgYSBzdGlsbC1kZWVwZXIgcmVwbyBhZnRlcndhcmRzIG1vdmVzIHRoZSBjaGls
ZCdzDQo+ID4gSEVBRCBmb3J3YXJkIGFnYWluIGFuZCBsZWF2ZXMgdGhlIHBhcmVudCBwb2ludGlu
ZyBhdCBhIHN0YWxlIHJldmlzaW9uLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSmFtaW4gTGlu
IDxqYW1pbl9saW5AYXNwZWVkdGVjaC5jb20+DQo+IA0KPiBUaGlzIGNvbW1pdCBpcyBkb2luZyB0
aHJlZSB0aGluZ3M6DQo+IC0gUmVmYWN0b3JpbmcgZXhpc3RpbmcgY29kZSBpbnRvIHJlZ2lzdGVy
X25lc3RlZF9naXRfc3VibW9kdWxlcygpDQo+IC0gTW9kaWZ5aW5nIHRoZSByZWZhY3RvcmVkIGNv
ZGUNCj4gLSBNb3ZpbmcgdGhlIGNhbGwgc2l0ZSBlYXJsaWVyDQo+IA0KPiBJdCdzIHZlcnkgaGFy
ZCB0byByZXZpZXcgdGhpcyBjb21taXQgYW5kIGJlIGNvbmZpZGVudCB0aGF0IGl0IGlzIGNvcnJl
Y3QuIFRoaXMNCj4gc2hvdWxkIGJlIHNwbGl0IGludG8gYSB0d28gb3IgdGhyZWUgbG9naWNhbCBz
dGVwcyB3aXRoIHNpbXBsZXIgY29tbWl0IG1lc3NhZ2VzLg0KPiANCj4gVGhlIHdhbGwtb2YtdGV4
dCBjb21taXQgbWVzc2FnZSBhbmQgY29tbWVudCBzdWdnZXN0cyB0byBtZSB0aGlzIG1heSBiZQ0K
PiBnZW5lcmF0ZWQgd2l0aCBBSS4gSGF2ZSB5b3UgcmVhZCB0aGUgY29udHJpYnV0b3IgZ3VpZGUg
WzFdPw0KPiANCkFmdGVyIEkgcmVhZCB0aGlzIGNvbnRyaWJ1dGlvbiBndWlkZSwgd2lsbCBhZGQg
DQpBSS1HZW5lcmF0ZWQ6IFVzZXMgQ2xhdWQgaW4gY29tbWl0IG1lc3NhZ2UuDQoNCj4gWzFdOg0K
PiBodHRwczovL2RvY3MueW9jdG9wcm9qZWN0Lm9yZy9jb250cmlidXRvci1ndWlkZS9zdWJtaXQt
Y2hhbmdlcy5odG1sI2FjY2VwdGFuDQo+IGNlLW9mLWFpLWdlbmVyYXRlZC1jb2RlDQo+IA0KPiBC
ZXN0IHJlZ2FyZHMsDQo+IA0KPiAtLQ0KPiBQYXVsIEJhcmtlcg0KDQo=


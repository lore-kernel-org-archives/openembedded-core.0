Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6F68C55162
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 06:35:27 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37558.1785738918139846956
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Aug 2026 23:35:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=HCnrKMPJ;
 spf=pass (domain: ericsson.com, ip: 52.101.72.9, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=metTN7z1GccY0YWH2TFw0RN6iJhetXW1iAAKh2TWrn0Yhwk3IzaBtB2ojhIJapXN8GaKT+iiwUbI1Xf/m4TwOlT682LAwDUkbvOSzIPU4Q88zhjW72yOaWwh9rE6IBYkNvbfOANPtgqO7w+PUGW5v2bG8iNwKLt3ptQXu3W690ip9B4r/STem9A2F5qmKZvQ+TNfM15rCHFayEgsRTcSPlaxjmyCr6isr/12cVEGAtUdq57oFLRuFuc2dnfJhsfzzRqRHboY22ZRv/u0KeZIux/vMYyNhZnOnnWkViRKwzbwY+QWrD5z1g/36sdW6kJPn2oICJdMi6aUAEVOk2Wz9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FHw5Meh16M6OkwjlG3uDQgw1z7HDnWWvU2E7Q250aD8=;
 b=EYf/hRhtNtDh7qz1JYAzKy/4E+q2DV9kbTt/Zgb6pfM1K8sBveT4jWkAoULPlO5AQXU3+UYwa0yI3068wDqn8hLVF4C2dD/g14GB8G/JwyoYS5RMAdmNm4rUOoQ0zY5/wNUI3zNJhnq7rqans7Aq+289ixvJzk7ZTH2R5WXOqQvqeJmudz/1I4+D9WT3IgExb7SZjR4cmQw0bl68HYgOUPrVVbmhovVN4gcPkpO7+gdj7joIRII88e8aheVpHnIdBNZRv2f+Fq9oIq9zgHZlTdQElcP4oZIouVicvJPz015Cuy72npd/OmZNp86K+ecbICXZtPKhMtaD4+Bi7j23Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FHw5Meh16M6OkwjlG3uDQgw1z7HDnWWvU2E7Q250aD8=;
 b=HCnrKMPJ0ixERd3BvyWnLMAMot1M2/cMJE+A0YqTxXXZ7sOcKYorTasP+xvqiUnEx0dUVVPT+oZ1BMj/ntQBueVfPjFaLELTQ8qFQRB6RQMwoppNoZMlsGBcjONYiUD90xGARdp6wb52MIRF+6wGsbpjShgzJ2CUD99aK1Kr8rlq9tqM1jaRKOov+0G1pm1qyiGJYeeSA0EwhDPTESs8sjFiPugZksaSlyqtc/F3jjuWF402MUGp0waCCE4c/HWNC6Z4nmJOBu6atUjhp5uzrGkEgHDDgfPQPhosc1hqK5zJ8I1AEXvldm5qcpmROTm6q4477m5yG8ICjeZ2NTDLqQ==
Received: from DU0PR07MB10740.eurprd07.prod.outlook.com (2603:10a6:10:5a4::19)
 by VI0PR07MB10756.eurprd07.prod.outlook.com (2603:10a6:800:2ae::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.13; Mon, 3 Aug
 2026 06:35:13 +0000
Received: from DU0PR07MB10740.eurprd07.prod.outlook.com
 ([fe80::eb99:3f8b:e32d:2652]) by DU0PR07MB10740.eurprd07.prod.outlook.com
 ([fe80::eb99:3f8b:e32d:2652%4]) with mapi id 15.21.0292.012; Mon, 3 Aug 2026
 06:35:13 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "auh@yoctoproject.org" <auh@yoctoproject.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [AUH] nghttp2: upgrading to 1.70.0 SUCCEEDED
Thread-Topic: [OE-core] [AUH] nghttp2: upgrading to 1.70.0 SUCCEEDED
Thread-Index: AQHdH+cCMz927ieRgkShMeYYXB7moraIvQ0AgAMnnoA=
Date: Mon, 3 Aug 2026 06:35:13 +0000
Message-ID: <c21067f210bfb366bce54b34d7586b756fc37c2d.camel@ericsson.com>
References: 
 <0101019fb18e1f88-465e0adb-d4fd-4e74-882f-0dc06a073f4b-000000@us-west-2.amazonses.com>
	 <e90714b981bce6a12f01c1a3555dc190f7c0211a.camel@linuxfoundation.org>
In-Reply-To: 
 <e90714b981bce6a12f01c1a3555dc190f7c0211a.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR07MB10740:EE_|VI0PR07MB10756:EE_
x-ms-office365-filtering-correlation-id: 0aed289c-e27e-46b6-bc45-08def1295fda
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|22122799003|23010399003|10070799003|4133799003|38070700021|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 T8SEggo43i+djXw1yU998hKcNrGpXLbBaAiXzJyRInmOM+z60sBoNxQHf4d7sKcwJ0d1dpMOoNS4TN2puSkjJ27We+P2FBy6w5mG+8ZjBUbb98RiuR3gwUvfC4RxEqYSi4GG7xvBnbmhCZiWJSlyPhcQhDlpkFAHGP5/xDI07DWvap4WtcHTUb1WnbF9ptK/Mg9i8JQTwYHXB1mBePE4/Er9jcR45cGY90M27Pbm05CwYPL38FZdf6m/HjG/LxJjaGkga0Jq+LuNGBZ8AbzqK6RIWijq3JttC1XuLffs6jTcuDC+OF5Kv+IvPWhyY7XUvb56q3nzIlJGIKEgJmnzOD4LjCEEXdkf7kdznKuxhGJO6wz8QM8O6Qbm2WpIgUm8oARQguVBcYEe4PDzhp3HOCsPwUoKUeAis8ZS6FXe7XnQHyQUPXBhCISpIloJpi4au7kKYAf6fod3OhxQVFuCAuTa4Zk5AgGOSk11g3ZEfsXLNTeUcnyMRcCH7TjgV0ZRhnXXo0bgNZvNlEltTo2cE/yBAviQeLvjT6dF0RDmakdw9jio6+O+Yzt1S2NpVilTD1xhB0Z7s1HcT4zm0IJQADMItylAR/nmHf+TuGQVpU7mKKV9vCzduPEOpTLDB/+aWV0u2yIodd7yITu4oCjgo9STDS0s/ed6az33RE2Ontc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR07MB10740.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(22122799003)(23010399003)(10070799003)(4133799003)(38070700021)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dWR2UW9ldUJYQ0NlZmFOMzZpK3lUUHR4Q21COGtBVC9VMWhLSklGQlhsMWRP?=
 =?utf-8?B?WlUxeXBkb3F1M2wvZUlDTlIrbDhWOUt4cXZJRk9pUXhSNlFCUkVuMDZ1djFQ?=
 =?utf-8?B?ZEMrbzNhYzRKem1zeE9BL3R2UUpYMXI5WUtKbURQNHlsR0kvUmFDTXMxaXZK?=
 =?utf-8?B?bm1wRHQxQWl2c2hveWRYOUpkZHBVeThFbDY2T1ltTkpSeDRmU0pSSkVkNlMr?=
 =?utf-8?B?WXN6WURYcmRHa0szcDZsWEQ1NWttTTVNU3hCRkp1dFBocUR5dGRuOWw2U0Nm?=
 =?utf-8?B?K3ZqZGZPUGxPMG80QlRqZUhMSGZST3paSjFZM1d4MlJXczJYTjY4S2lXcTcw?=
 =?utf-8?B?cENxc2NxU1lUbGlmWnFieDZySm13WDgzNTlHVC9GZVV6TE1NRmxZSmlTdkMv?=
 =?utf-8?B?ZUNOZmhtQkhUZ1p5WEN6ckNteUtXbTNpcjc0WE9CcVFlOVhZSXIrajgrUFkx?=
 =?utf-8?B?U2JaZ0RaSVFLWlBkZ3RrcnlFM1NHWXR0aGlFK1kxUXBZNjAzY0dMUTE0V0Js?=
 =?utf-8?B?bUZDamR2RkJVYmg5akxDVm5WVFJldFNQM2NuZi81UlpWMHdndDFkMWVHVEpt?=
 =?utf-8?B?YWdHbWdQTndMU0YxOHAwMjhaTTh1N29rY1czUFM3dzdBd3A2ZFVobDUwaGxM?=
 =?utf-8?B?OERSaHBuYUtkdGtzVDIrajZKMkkwNVZBVjRka2VwQVJNSkdvZnh3VzMxOUVt?=
 =?utf-8?B?eFQ4dVFRMy9nWGpzWDNCdDZGaENmUVJBNWRkTkw0YnRmRlluZUpXbDJZTmhh?=
 =?utf-8?B?TEh1TkRzSzV0RThWTkU5Ujd3MXoyVXhRU0VWZlhmc1FvY1hZdGc1UFErK3I0?=
 =?utf-8?B?cFZCdVZ6Zms5SGFadUpEditrai84dU12dUtqWmRxWWtwOHN4VUYwbTlLa2FX?=
 =?utf-8?B?ZkZkdi9tMjUrdlB5akJ5ZmJ4WHJJYWFrd01BRHQ5Y1c3QVAwbFowTkx0TWxi?=
 =?utf-8?B?bjh3ZWs3UnVUcHlqZFNyZXpRK3BnQmhFOXNhVExNTXFsaXJwTk81WVdSQVJT?=
 =?utf-8?B?VUl0V2NOYnRlVXlFd25nWmdjRTJJY3lQbmNHN3dhSERxOXlWUDhJaks5dzRl?=
 =?utf-8?B?Mjd3SlE5Snp2UFhnUVBCK2U3VXE5OUltSlJiRzh2NmxSby9wQ2ZPMS9oYllV?=
 =?utf-8?B?bGEvN2Z2VVNVL0hBcG9KSEM4VW5ucGwrSExrRGlNTS96cVl4cTA3ZTNZd3Rq?=
 =?utf-8?B?c1pabGc2VkpwYnZ6amN2V0RYaFRZS1lDdFdlbnUzclREWFpMelQvYmJBeFdP?=
 =?utf-8?B?MnNseWlKT2pDbW1rbWxmaU5YaVMrT1M0N21aZmh0TktYN0RWczVCcWJkekNj?=
 =?utf-8?B?Z2xHOSt2ZWZPODJVS29QYXZtT1A5dmc3M3VJZ1RvWCsxR0lTTHRPaHN3VXlZ?=
 =?utf-8?B?cy9kdmFWbHpocU4yTk82WWhaYXJ3Q1BISHB5OVZaQjg2ME1tdytZRXBTMWVM?=
 =?utf-8?B?WUxwOHNjaEZ4OGQySmNBTkk2eTZPS0JZNE5FQ01LWkF3eit4cngxeHJRUEdF?=
 =?utf-8?B?OXZvLzZNLy9uMmtOOFpGUDlmNUsvWmZyL09YNHJLZmpLTE1odURzMzEzZ01P?=
 =?utf-8?B?b0hVcDZXMExJOTZzb3JjUmx4NmNMaDE2Rm40MXQreGVSVURUSFJadEhiZ0Fa?=
 =?utf-8?B?eGRJN2hKNjJJbVovaENTbzRjQkM3WVNDVFppV2x2WlN6Z0lIQ2c1elcvaTBz?=
 =?utf-8?B?bmtuTVdMS3Y2MFUvS3lBREZ0Nm5BdFIweHMrTExIRlBnYk4rM0crcXEyRkJK?=
 =?utf-8?B?NlZ0WnJFbzlKR3VQQTFEVllPR2poK2w5aG9LUHN1NGNMbUJ6MW41SjJZUTdw?=
 =?utf-8?B?REtIVDNZUTUrK1lZUFhXT2xhNmN2VVZoUUxMYjZHYU1jOEhwcXJQTXV6NFVx?=
 =?utf-8?B?cElKdDQ3N2QyaTZWZTNYZzFvUDRlUytETTRUTktGUlQrU1llTFRjRWxzMUxw?=
 =?utf-8?B?SzM0K0dDYkpiNmIvVDIzYXNqMmxycDFERGJoSTg2eHJ4dFVIQlJGeklJOTdS?=
 =?utf-8?B?dStlNmV5RVN2YnptbE9aRTlQbjlKbUJHMmN4ZUJYSVRZc1dsNDR2VkJsVGNa?=
 =?utf-8?B?VEROQVQ1TE9xM29WSFlkR0pnOGw5WVFmRWRLNXVZNEU5Sk9ycnFCUlpJOFN3?=
 =?utf-8?B?VnRBQzh0aWxSMXRrVHY2RkNSY0JwbnloUCtQNDFCNUpjUWhnbTBsYnpEcU11?=
 =?utf-8?B?Tm9iclp1N0hobFRudWxnVVZoVkJ6VU13YUNyb09MaSs5RXlPeDRSU2RJM04z?=
 =?utf-8?B?Rlo0d2dFQmg3RDhGTjJYajU5YTVlQnl2ZEVPR21yNS9HTVlyNm1udWRlM2tV?=
 =?utf-8?B?bHZ2UEhldnl4UWd5dVJpREJqd2c3VTRxZTZBTVV2QnozOHI4NGFCYVRscHNL?=
 =?utf-8?Q?cxqXF/QtXefv42bOhJ/ExwNF+NBQRvJic4N0UJ7/yMvOk?=
x-ms-exchange-antispam-messagedata-1: lUnQdZR4dRmPp6QVbwdrZOzdPI7O/9RRlAw=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1ED3CB35FCE82F40ADA87C8687ECDFD4@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR07MB10740.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aed289c-e27e-46b6-bc45-08def1295fda
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2026 06:35:13.6723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2BYguAy6TN+xFAFLBDR+dYmmT/ueBBjpEzXLFyhL2WrHlCZh5yKuUFQKVAF4nLqVQVLdsPsAA3hF5EFcM6g+c3uBxtOqA9hdrKbtPX8Vfp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR07MB10756
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 06:35:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242607

T24gU2F0LCAyMDI2LTA4LTAxIGF0IDA3OjI0ICswMTAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gT24gVGh1LCAyMDI2LTA3LTMwIGF0IDA1OjQ1ICswMDAwLCBBdXRvIFVwZ3JhZGUgSGVscGVy
IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiA+IEhlbGxvLA0KPiA+DQo+ID4g
dGhpcyBlbWFpbCBpcyBhIG5vdGlmaWNhdGlvbiBmcm9tIHRoZSBBdXRvIFVwZ3JhZGUgSGVscGVy
DQo+ID4gdGhhdCB0aGUgYXV0b21hdGljIGF0dGVtcHQgdG8gdXBncmFkZSB0aGUgcmVjaXBlKHMp
ICpuZ2h0dHAyKiB0byAqMS43MC4wKiBoYXMgU3VjY2VlZGVkLg0KPiA+DQo+ID4gTmV4dCBzdGVw
czoNCj4gPiAgICAgLSBhcHBseSB0aGUgcGF0Y2g6IGdpdCBhbSAwMDAxLW5naHR0cDItdXBncmFk
ZS0xLjY5LjAtMS43MC4wLnBhdGNoDQo+ID4gICAgIC0gY2hlY2sgdGhlIGNoYW5nZXMgdG8gdXBz
dHJlYW0gcGF0Y2hlcyBhbmQgc3VtbWFyaXplIHRoZW0gaW4gdGhlIGNvbW1pdCBtZXNzYWdlLA0K
PiA+ICAgICAtIGNvbXBpbGUgYW4gaW1hZ2UgdGhhdCBjb250YWlucyB0aGUgcGFja2FnZQ0KPiA+
ICAgICAtIHBlcmZvcm0gc29tZSBiYXNpYyBzYW5pdHkgdGVzdHMNCj4gPiAgICAgLSBhbWVuZCB0
aGUgcGF0Y2ggYW5kIHNpZ24gaXQgb2ZmOiBnaXQgY29tbWl0IC1zIC0tcmVzZXQtYXV0aG9yIC0t
YW1lbmQNCj4gPiAgICAgLSBzZW5kIGl0IHRvIHRoZSBhcHByb3ByaWF0ZSBtYWlsaW5nIGxpc3QN
Cj4gPg0KPiA+IEFsdGVybmF0aXZlbHksIGlmIHlvdSBiZWxpZXZlIHRoZSByZWNpcGUgc2hvdWxk
IG5vdCBiZSB1cGdyYWRlZCBhdCB0aGlzIHRpbWUsDQo+ID4geW91IGNhbiBmaWxsIFJFQ0lQRV9O
T19VUERBVEVfUkVBU09OIGluIHJlc3BlY3RpdmUgcmVjaXBlIGZpbGUgc28gdGhhdA0KPiA+IGF1
dG9tYXRpYyB1cGdyYWRlcyB3b3VsZCBubyBsb25nZXIgYmUgYXR0ZW1wdGVkLg0KPiA+DQo+ID4g
UGxlYXNlIHJldmlldyB0aGUgYXR0YWNoZWQgZmlsZXMgZm9yIGZ1cnRoZXIgaW5mb3JtYXRpb24g
YW5kIGJ1aWxkL3VwZGF0ZSBmYWlsdXJlcy4NCj4gPiBBbnkgcHJvYmxlbSBwbGVhc2UgZmlsZSBh
IGJ1ZyBhdA0KPiA+IGh0dHBzOi8vYnVnemlsbGEueW9jdG9wcm9qZWN0Lm9yZy9lbnRlcl9idWcu
Y2dpP3Byb2R1Y3Q9QXV0b21hdGVkJTIwVXBkYXRlJTIwSGFuZGxlcg0KPiA+DQo+ID4gUmVnYXJk
cywNCj4gPiBUaGUgVXBncmFkZSBIZWxwZXINCj4gPg0KPiA+IC0tID44IC0tDQo+ID4gRnJvbSAz
NjA2M2Y5NDViM2ViNjNkYzRkZDM5NWJlZjlhNTg3ZDY3YTIyNTczIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQ0KPiA+IEZyb206IFVwZ3JhZGUgSGVscGVyIDxhdWhAeW9jdG9wcm9qZWN0Lm9yZz4N
Cj4gPiBEYXRlOiBUaHUsIDMwIEp1bCAyMDI2IDA1OjQ0OjU1ICswMDAwDQo+ID4gU3ViamVjdDog
W1BBVENIXSBuZ2h0dHAyOiB1cGdyYWRlIDEuNjkuMCAtPiAxLjcwLjANCj4gPg0KPiA+IFNvdXJj
ZTogQ2hhbmdlTG9nDQo+ID4NCj4gPiBjb21taXQgODVlMzAwYzc5ZmI2ZGJjZmE5YzEwMTMyMTVj
ODcxMGMxYzJjZDNkMg0KPiA+IE1lcmdlOiBhMzk5YWI3MiBkZWRhZDM3ZA0KPiA+IEF1dGhvcjog
ICAgIFRhdHN1aGlybyBUc3VqaWthd2EgPDQwNDYxMCt0YXRzdWhpcm8tdEB1c2Vycy5ub3JlcGx5
LmdpdGh1Yi5jb20+DQo+ID4gQXV0aG9yRGF0ZTogMjAyNi0wNy0yOQ0KPiA+IENvbW1pdDogICAg
IEdpdEh1YiA8bm9yZXBseUBnaXRodWIuY29tPg0KPiA+IENvbW1pdERhdGU6IDIwMjYtMDctMjkN
Cj4gPg0KPiA+ICAgICBNZXJnZSBwdWxsIHJlcXVlc3QgIzI4MjMgZnJvbSBuZ2h0dHAyL25naHR0
cHgtcmVzZXQtcXVpYy11cHN0cmVhbS1hZGRyLWZkDQo+ID4NCj4gPiAgICAgbmdodHRweDogUmVz
ZXQgcXVpYyB1cHN0cmVhbSBhZGRyIGZkIHRvIHRoZSBjdXJyZW50IHBhdGgNCj4gPg0KPiA+IGNv
bW1pdCBkZWRhZDM3ZGVmYTlhYjNjNWFlODE4ZTUyNjY3OWMyNTYyMzczMmUyDQo+ID4gQXV0aG9y
RGF0ZTogMjAyNi0wNy0yOQ0KPiA+IENvbW1pdERhdGU6IDIwMjYtMDctMjkNCj4gPg0KPiBbLi4u
XQ0KPiA+ICAgICAtLS0NCj4gPiAgICAgdXBkYXRlZC1kZXBlbmRlbmNpZXM6DQo+ID4gICAgIC0g
ZGVwZW5kZW5jeS1uYW1lOiBnaXRodWIuY29tL3F1aWMtZ28vcXVpYy1nbw0KPiA+ICAgICAgIGRl
cGVuZGVuY3ktdmVyc2lvbjogMC42MS4wDQo+ID4gICAgICAgZGVwZW5kZW5jeS10eXBlOiBkaXJl
Y3Q6cHJvZHVjdGlvbg0KPiA+ICAgICAgIHVwZGF0ZS10eXBlOiB2ZXJzaW9uLXVwZGF0ZTpzZW12
ZXItbWlub3INCj4gPg0KPiA+IFtDaGFuZ2Vsb2cgdHJ1bmNhdGVkIGFzIGl0IGV4Y2VlZHMgMzAw
MCBjaGFyYWN0ZXJzOw0KPiA+IHRoZSBmdWxsIGNoYW5nZWxvZyBjYW4gYmUgZm91bmQgaW4gYW4g
YXR0YWNobWVudCB0byB0aGUgQVVIIGVtYWlsXQ0KPg0KPiBUaGUgY2hhbmdlbG9nIGlzIGludGVy
ZXN0aW5nIG9uIHRoaXMgb25lLiBJIGVuZGVkIHVwIHJlcGxhY2luZyBpdCB3aXRoOg0KPg0KPg0K
DQpJbmRlZWQuIEknbGwgdGFrZSBhIGxvb2sgYW5kIHNlbmQgYSBmaXggZm9yIHRoZSBjb3JuZXIg
Y2FzZS4gQ2hhbmdlTG9nIHNlZW1zIHRvIGJlIGFuIGVtcHR5IGZpbGUuDQoNCkNoZWVycywNCg0K
RGFuaWVsDQoNCj4gQ2hlZXJzLA0KPg0KPiBSaWNoYXJkDQoNCg==


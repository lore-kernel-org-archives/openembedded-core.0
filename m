Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C00B10F2847
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 15:45:22 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75618.1774626316139800619
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 08:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=JVoiSUMb;
 spf=pass (domain: ericsson.com, ip: 40.107.162.45, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q/0YfTAwBmRBQuwYKq3bhjop95R56xi+qAls+/sdZ3qnIWgw6jsL6si1oY7Dvf1VsUIQN2Ss6Ba+LpE+UdItSTKBBZd2wWYXwj128r96T0PsjHVif+oNvhrdzGKVGJz+VLb1xF5WHPJNKh8MUjM5AgmL/vmqwxd5GyttxtFcU/PsKpm5q77OGx8CUCfetBPAZNwv/zlGckyryol3GSQ3qcVQ9zjkxIJvK+2gNFqG0PKArX2SaVxwjrsokNhVjXu7RhGh2s6SO0dNwFAmgASjyxWMq4ZT8t0o/rpQXTS3k9V29Z60ks3vzcsYDoZ/UAmH/6qm4yCKYABMWQpGujGbhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+zOcJk1W/syuqdn4iU+SqNH+L3nZhTVngrisYwHcnb8=;
 b=mGqhb3xEPGuCfv+mWyWopHlKKcM94HkCbjZXTs/mWuI55a4LdI8ZO1PZXb6htx2kx8zl9oM587IOdnVVy7D6/Gl9qp2oq/cerH3Luts+Wyi/IyYiYlovP/B17zKjog4R3o/jnUUu1vjf5R5w3tOc2uRl/oFRB9kDCN2IfbuOHFK6+htj5gB1xGKLX7L4g5ovbZHFOICMx+S0FQB8vR4VKw85k4laGlr6LnkYEf9FzTJjCPg6W3WexgRt4SSAJvGBilXPza0G4CaEGfgFNqhOk693LgCnypq0srwFYbsgDPlC/FFXl0wm+dpPz8CrDym8eIl+0WRucC+SKjO5IIjcbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zOcJk1W/syuqdn4iU+SqNH+L3nZhTVngrisYwHcnb8=;
 b=JVoiSUMbOx3ObcILfH3lCWxQi1hnf2pcgsswcL9MikK709HaBQXPN4ricJAm9g1H5wZ4GH+tul3eSWx5A4g0PZmRytfJsZKKZOwPeI29T+Eru3B/MxvmACYUCiCC+HYEfRGSrK6eBjo3fPeF9nTW3kg6w7s+FO/pdbu9xcJiyzIyMyWVNU8A08zu0mTKRF+g+ltTRvG3dZURNo6YbGu9PvhQpBM6kwG/cUFuavnoIXvjQK4g9p+9Ky+RN77F2v/y4m8R3YDp1ROqEgehCBxzCiv9uoRZEBgJ0QpZkYZZxFCr7Zlu+jU8ikr7aMpgDW5xZ6JzM1oC81LqLMa5M/j5QQ==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by PA3PR07MB10670.eurprd07.prod.outlook.com (2603:10a6:102:4b8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.18; Fri, 27 Mar
 2026 15:45:12 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%6]) with mapi id 15.20.9745.022; Fri, 27 Mar 2026
 15:45:12 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?utf-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.nystrom@est.tech>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@est.tech"
	<pratik.farkase@est.tech>, "bruce.ashfield@gmail.com"
	<bruce.ashfield@gmail.com>
Subject: RE: [OE-core] [PATCH 2/2] oeqa: replace runltp with kirk
Thread-Topic: [OE-core] [PATCH 2/2] oeqa: replace runltp with kirk
Thread-Index: AQHcvEecTK7jl1ZqZUu5QJvzt2t3LrW/clsAgAFUoICAAYuFAIAANRYAgAAAKYA=
Date: Fri, 27 Mar 2026 15:45:12 +0000
Message-ID: 
 <PA3PR07MB1072190A879A0BDC25C0D3FFF8A57A@PA3PR07MB10721.eurprd07.prod.outlook.com>
References: <20260325084021.3915804-1-daniel.turull@ericsson.com>
	  <20260325084021.3915804-2-daniel.turull@ericsson.com>
	 <136e62fde93b3b6a61cbd476f2b19724500b8643.camel@linuxfoundation.org>
	 <PA3PR07MB10721A419D82B4B57F78F31748A56A@PA3PR07MB10721.eurprd07.prod.outlook.com>
	 <550d7d85-7e12-53d6-3dad-ff8e7a20ccd8@est.tech>
 <f9aacf9124191baa4386fbcca1db435a08f8ccbf.camel@linuxfoundation.org>
In-Reply-To: 
 <f9aacf9124191baa4386fbcca1db435a08f8ccbf.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|PA3PR07MB10670:EE_
x-ms-office365-filtering-correlation-id: 19323d9e-121f-40f6-8490-08de8c17d540
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|10070799003|366016|1800799024|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info: 
 JozxA5quO45XgJnSDHzPW1IH5v+sBnTBy0+07tDOaG+AdwqujMm1rSQl+75kYB5h22tLJCWVEtRz9SXNx/cMULVRJJNigRsUccTXN0nnZz0jXkNXtD5vspNtx3KE4oLa90XPEc6u7cy8uo2sPMl7gCj+wCZJ+0bIy5YF+Flw0VqHc6jig2cRYKlAT4Fhs8lSaFH1PigKnngqcq2rYibwbWuZClsxxw84E5NSlQfs/Nk0TPhEsA4UijoZ1VZHyiGKWt8FfL6XZ6S50rJUry90wvBDHqJDrI4etdmH3bJobvHpctTg+wPtZlY6+UfVXF+7JinHCsPLDRbHtKVoc3bAW3rvv1BzagIUVQz7q/7qx3rDwW+rMpHrtxFXAa88tuGZtWFMA3a076F2LuTLl0g6wyGRSUfrtWaL4bLhdwFtks+jU4VXcCYyl677LfKViuH8i3HAf6wgwfs3TUl/Z/m6gZ5qvic9aJugfIyOzEZRvTNuEgLw4FjpP6fvGAGzgduzFCqHzXlA33IFMoaSi9daJ1lfMUHADS3HA5gWH/VbM05Qm6j1HlfEKClpMqcxxCmYGnHv/NvhQwvgMEnNof7mWanGhxWggUqkCIR811MiFNVsr+Bhs25sFhxP7gWsOOQMRbrzfZJanhWUjJv5IUn45j5mmisA91sVY1NcV8UkJs7hDCV4xujHXk6TTzZD/MHwlkZJ75eSTSqTGyNvy4lWl10J5y7pqwi319i/KZmYGwE0qYrNrKsCmvIO3jjJLx1oRrAy2YSkcRAqnapMXzcSe7rogzT3F0p8ZlzYSjA0/2U=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(366016)(1800799024)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?a0FFTHhmSVFONjAvZWhSZUhWNERZUi9OcldlQ2tvTVRuK09iOEZ1bEZXZGYy?=
 =?utf-8?B?MmFBUUlBY2UwcTVvdXFyRUp0aHphbm93OE0xZU1rc253ZWhGRjR3YnJtd08z?=
 =?utf-8?B?TjhnbmtmQlE0MmlCTzNKdWg4T0FzcDdhUTU0ZHVhUTEvbzlBcU53Vnk2RTcr?=
 =?utf-8?B?OUt2U0tOQkpRbGVFZHN5c0I5WG5uNkFmK3h1T3ZsRlVxSGhGTlBqZDVtUUM2?=
 =?utf-8?B?R3NBV2hvcGM1M00rMTFTbm1lNlRnaTdINXZENWNBNVcvN0RNTFh0RU1GOUhD?=
 =?utf-8?B?ZHJrWVZNQ2drWkNmTzJEYjV4YWI5WkdNUnpCZG5tcHhKOVg3MDhFNXUrMFRn?=
 =?utf-8?B?MnpSdHJaQjVsZTFoQjhxQWMwVHN6a2VPOEkveWtoUGpMdzljaUduQjA1aWR5?=
 =?utf-8?B?TndET2tWU1dGbDJuN3k4NUZKQkF0YUk5UHZRU0EvMXJNbVRHdzIwUlZEeUw2?=
 =?utf-8?B?NkszWmJUaVBYQzdwVHlpaWU1K3V2RDhSbmZNM21KSzBEVGNsT1ZEaWVVaG5n?=
 =?utf-8?B?VkMrdjFDZ2dCdDNaQkE3bDZ3M3FrUkU2bTZ4OTNJS0pWUWhpN01lN2RUSnk0?=
 =?utf-8?B?bk9OR0ovVmhHOS9paFl6S283VW1tUmJ3Wm9WU2xVQklFZEJTcGdwdmlXOWdV?=
 =?utf-8?B?Qm5EUUlDd0E4ZVNMeXZ4V2lZcmtnS0svNlRnN1V2ODBqc0MzQ0dXWnpVNjl5?=
 =?utf-8?B?bHhLekw2RXJicnlRVVNTb085UVl5bE9jS3hyNjVqRng5UnVVM3RJVTBnTmlP?=
 =?utf-8?B?SElUYkV1UnZBb0M1MmRxSXBsN2wrQjlkSGtpamdEcnpqdm1OandoeVhUS2Ny?=
 =?utf-8?B?OFQ2Yzh6Z0xpeC9KbTFiTUpuYlEwUG9GVTd4K1owK0Vvcjh1aWIwL2RtRmFp?=
 =?utf-8?B?TjB2U2x0Y1NCUVViTitDUDJ3aW4yNDdZQkJ3aG5vVXJ6SkFlN3JRYjk2cWNp?=
 =?utf-8?B?L20xRDRwTmJFd1Zkazk3RmVYMWROaElRMk9DRWNOd29lZnZ6WElLQno5cXJE?=
 =?utf-8?B?Nkt2Wm02cUtpdERTQ01PU0tOTWh1TzRNQ05seXZwQm5ZVmZsZWRTWmFLQ1ps?=
 =?utf-8?B?dzF0Vk5MRVdqV3lhUUxRSW5PNTBpZ1JhSEMrdUMxRUI4VnEySjFEaGJLSExw?=
 =?utf-8?B?Y0IxQW9WQTVpV3JOcXBGanYyaUZJbmhrQzhjODFGVnlmYkw0ekkrQng2Tllh?=
 =?utf-8?B?cHhxZWZYU2s4U1dmajdCdDc2QmRsSkVFbGc4OUp3QkU0ZUdjb2JtcS9pVHdk?=
 =?utf-8?B?Y0ZyTUtoR2d1UTltQm1tcXNhNFBmUW9vdnV2WU9ZZk4vZkd6Z2JQNU5aWU1x?=
 =?utf-8?B?OWYwcU9kUFZSWVVDMnIvZlZPWEhWRzc0QnJyRE1GL21MZFBXNGtpZkdoYjBr?=
 =?utf-8?B?MkUveUVvcStzZmR4Z0FKNjc2eHVBeFhqSU55QytsU1NLUDIzVlNjcWxFN3lv?=
 =?utf-8?B?ZzJrcUFYa2poSDVtdjhJLyt3WkkwQ2haTURFaEp5OXF5NFNpWDQ2VHo1N0Zo?=
 =?utf-8?B?QWlEbUcxcVgzTzZhbWUyYndFdGxJSlYyMkQwaWlYTWNENU1RRWdYUzEwc3hB?=
 =?utf-8?B?Vk1XT3NsdDdDeVNudW5hYUYyejRPam9kVjljOGZmZXdmenpLZFNpbEh0a0xl?=
 =?utf-8?B?c1BRMG1JKzdJNDhxMnA0QVEvR2tzSkl5WjArQVF0U3lUcHBIMTlZLzAvUDd1?=
 =?utf-8?B?TS93V0dKZ3V5eklSd0x2RTloc01TVmR4TGdhZmNmZ2MrbGJjOVdHTmo2cUdt?=
 =?utf-8?B?WWVWVTlyS3ZKdEVoeTlBSW9TZ1BERHlMVVIyeE5xMVN6WnVaaTJaYTlHT2dv?=
 =?utf-8?B?ZzlLdmt6NGZRbkQzUThaZEFlZGxkSVBiU2p2K3VObS9Jb3QzNjErN3o3Y2Ni?=
 =?utf-8?B?RjZnTWxoYUE3RHpuYnYraXQwcktTY2JwYjUyajZjNUJZMWR3YTV0K3RidmJu?=
 =?utf-8?B?MkYySFNCZVNpMzdwQ0dFYVFHTWZFQndtUEhBa1ZSZ1lxQVU3WXJkcFJTb25C?=
 =?utf-8?B?dTYrUDBySjZocjFNcHNtcXhwSmMwazFsbWFGa0RTUjJ1ZEZZSCt5VlZ4dG9s?=
 =?utf-8?B?aUZFeEZ6YmdRdFBhUXREanJ5NCtRR0NPYjZIMC85UFhjTlVlUEdqd3IrZDhB?=
 =?utf-8?B?Wkw5RXBLR3oxY2dTM2VxbXRhbnBTZUpzeXRWTUtaUjJkb0RpL2RYRCsxcy9P?=
 =?utf-8?B?c3FnK0Z3NTk4R21QY2hLUlZoREJJSkVGYk12RFZvaFNRTFhYL0dNb2NFYmgw?=
 =?utf-8?B?YTBDeldiSU9FcDIvdUg5S0M1a2pBdjNtUS8yWCs4a1dzd3lTSmNJOTNWM2VQ?=
 =?utf-8?B?bnJDZ3AxMmc1eEtrWHh1V0Fyb3FseWU2V0dCSTQ0cGZoWkZJbyt5YVNsMUw1?=
 =?utf-8?Q?SZrvk41wsOqvt1BQbEf0l7AG0a0WDfQX4jaD5ESPXAr3f?=
x-ms-exchange-antispam-messagedata-1: /Kgoy02PPP5nmQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19323d9e-121f-40f6-8490-08de8c17d540
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2026 15:45:12.2707
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8fYlR74I6Opt1666UcnZARACBOpzFDCLgRl+toueqrnLn6QAweFCag9lUBRR2bEewiWJByWu3/DJW7Wit8E+SzB5FO5G32i8E2eTBjYT1X4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR07MB10670
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 15:45:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234094

SGksDQoNCkRhdmlkIG9wZW4gYW4gaXNzdWUgd2l0aCB0aGVtIG5vdy4NCmh0dHBzOi8vZ2l0aHVi
LmNvbS9zeXN0ZW1kL3N5c3RlbWQvaXNzdWVzLzQxMzcyDQoNCkkgdXNlZCBBSSB0byBnZW5lcmF0
ZSBhIGZpeCBmb3IgaXQgdGhpcyBhZnRlcm5vb24gYW5kIGl0IHNlZW1zIHRvIGJlIHdvcmtpbmcg
YnV0IEkgaG9sZCBhIGJpdCB3aXRoIGl0IHRvIGZ1bGx5IHZlcmlmeSBpdC4gVGhlcmUgaXMgbWVt
b3J5IGxlYWsgaW4gdGhlIHN5c3RlbWQtdWRldiB3aGVuIGEgbG90IG9mIGRldmljZXMgYXJlIGNy
ZWF0ZWQgaW4gYSBzaG9ydCB0aW1lLg0KDQpEYW5pZWwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3Vu
ZGF0aW9uLm9yZz4NCj4gU2VudDogRnJpZGF5LCAyNyBNYXJjaCAyMDI2IDE2OjQxDQo+IFRvOiBE
YXZpZCBOeXN0csO2bSA8ZGF2aWQubnlzdHJvbUBlc3QudGVjaD47IERhbmllbCBUdXJ1bGwNCj4g
PGRhbmllbC50dXJ1bGxAZXJpY3Nzb24uY29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZzsgcHJhdGlrLmZhcmthc2VAZXN0LnRlY2g7DQo+IGJydWNlLmFz
aGZpZWxkQGdtYWlsLmNvbQ0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCAyLzJdIG9l
cWE6IHJlcGxhY2UgcnVubHRwIHdpdGgga2lyaw0KPiANCj4gT24gRnJpLCAyMDI2LTAzLTI3IGF0
IDEzOjMwICswMTAwLCBEYXZpZCBOeXN0csO2bSB3cm90ZToNCj4gPg0KPiA+IE9uIFRodSwgMjYg
TWFyIDIwMjYsIERhbmllbCBUdXJ1bGwgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6
DQo+ID4NCj4gPiA+IEp1c3QgYW4gdXBkYXRlLg0KPiA+ID4NCj4gPiA+IEl0IGlzIHRha2luZyBh
IGJpdCBtb3JlIHRpbWUgdGhhbiBleHBlY3RlZC4gTXkgb3JpZ2luYWwgdGVzdCBvbmx5DQo+ID4g
PiBjb3ZlcmVkIHRoZSBtYXRoIHRlc3Qgc3VpdGUgaW4gbHRwIHRvIHZlcmlmeSB0aGUgZnVuY3Rp
b25hbGl0eS4NCj4gPiA+DQo+ID4gPiBTb21lIG9mIHRoZSBsdHAgdGVzdCBhcmUgZmFpbGluZyB3
aXRoIE9PTSwgc29tZSByZWxhdGVkIHRvIHN5c3RlbWQtDQo+ID4gPiB1ZGV2LiBJJ2xsIGJlIGRp
c2FibGluZyB0aGVtIG5vdyB0byBoYXZlIGEgd29ya2luZyBsdHAuIFRoZW4gbG9vayBhdA0KPiA+
ID4gdGhlIHVuZGVybGF5aW5nIGlzc3Vlcy4NCj4gPiA+DQo+ID4gPiBTbyBmYXIgSSBoYXZlIGZv
dW5kIDQgZmFpbGluZyB0ZXN0IGNhc2VzLiBVc2luZyB0aGUgZGVmYXVsdCBjb25maWcNCj4gPiA+
IHdpdGhvdXQgYW55IGNoYW5nZXMgd2l0aCBxZW11eDg2LTY0DQo+ID4gPg0KPiA+ID4gbWluX2Zy
ZWVfa2J5dGVzIChtbSkgKE9PTSkNCj4gPg0KPiA+IFRoaXMgc2VlbXMgdG8gYmUgYSBidWdneSB0
ZXN0Y2FzZSBmb3IgYXV0b21hdGlvbi4gRGlzYWJsZSB1bnRpbCBpdHMNCj4gPiBmaXhlZC4NCj4g
PiBFdmVuIGlmIHRoZSB0ZXN0IG93biBtZW1vcnkgY29uc3VtZXJzIHNldHMgdGhlaXIgb3duIE9P
TS1zY29yZSBoaWdoZXIsDQo+ID4gdGhlcmUgYXJlIHN0aWxsIGNoYW5jZXMgdGhhdCB0aGUgT09N
LWtpbGxlciBraWxsIHRoZSB3cm9uZyB0aGluZ3MuDQo+ID4NCj4gPiA+IHB0eTA3IChwdHkpIChP
T00pDQo+ID4gPiBwdGVtMDIgKHB0eSkgKE9PTSkNCj4gPg0KPiA+IFRoZXNlIHNlZW0gdG8gbWUg
dG8gYmUgcmVsYXRlZCB0byBzeXN0ZW1kLXVkZXZkIGhhdmluZyB1bmJvdW5kZWQNCj4gPiBtZXNz
YWdlIHF1ZXVlIHNpemVzIHRvIGl0cyB1ZGV2IHdvcmtlcnMuIElNTywgdGhpcyBpcyBhIHN5c3Rl
bWQtdWRldmQNCj4gPiBpc3N1ZS4NCj4gPiBTb21lIG90aGVyIHVkZXYgaW1wbGVtZW50YXRpb25z
IHN0YXJ0cyBkcm9wcGluZyBldmVudHMuDQo+ID4NCj4gPiBXZSBzaG91bGQgaGF2ZSBzZWVuIHRo
aXMgd2hlbiB1c2luZyBydW5sdHAgYXMgd2VsbCA/DQo+ID4NCj4gPiBEZWF0aCBzcGlyYWw6IHN5
c3RlbWRfMjU5LjUNCj4gPiAxLiBUZXN0IHRpZ2h0IGxvb3AgY3JlYXRpbmcgZGV2aWNlcyBmbG9v
ZHMgc3lzdGVtZC11ZGV2ZCdzIHdvcmtlcnMNCj4gPiB1bmJvdW5kZWQgaW5ib3ggcXVldWUocyku
DQo+ID4gLSBTaW5nbGUgY29yZSwgbG93IG1lbSwgYW5kIGxvbmcgcnVubmluZyB1ZGV2IHJ1bGVz
IG1ha2VzIHRoZSBwcm9ibGVtDQo+ID4gd29yc2UuDQo+ID4gMi4gc3lzdGVtZC11ZGV2ZCBncm93
cyB0byBjb25zdW1lIGFsbCBhdmFpbGFibGUgUkFNIDMuIE9PTSBraWxsZXINCj4gPiBraWxscyBl
dmVyeXRoaW5nIGJ1dCBzeXN0ZW1kLXVkZXZkIChPT01TY29yZUFkanVzdD0tDQo+ID4gMTAwMCkN
Cj4gPiA0LiBLZXJuZWwgcGFuaWM6ICJubyBraWxsYWJsZSBwcm9jZXNzZXMiDQo+IA0KPiBBcmUg
dGhlIHN5c3RlbWQgZGV2ZWxvcGVycyBhd2FyZSBvZiB0aGlzPw0KPiANCj4gWW91J3JlIGNvcnJl
Y3QgdGhhdCB0aGUgbHRwIHRlc3RpbmcgYXMgY3VycmVudGx5IHJ1biBkb2VzIHNvbWV0aW1lcyBz
ZWVtIHRvIGhhdmUNCj4gaXNzdWVzIGFuZCBub3QgYWxsIHRlc3RzIHBhc3MuIEl0IGlzIHNvbWV0
aGluZyB3ZSd2ZSBiZWVuIHdhbnRpbmcgdG8gbG9vayBpbnRvIGFuZA0KPiByZXNvbHZlIGJ1dCBz
aW1wbHkgaGF2ZW4ndCBoYWQgdGltZS4NCj4gDQo+IEZpbmRpbmcgYW4gaXNzdWUgbGlrZSB0aGUg
c3lzdGVtZCBvbmUgZG9lcyBoaW50IHRoYXQgdGhlcmUgbWF5IGJlIHZhbHVlIGluIHNvbWUgb2YN
Cj4gdGhlIHRlc3RpbmcuDQo+IA0KPiBJZGVhbGx5IHdlJ2QgaWRlbnRpZnkgYW5kIGRpc2FibGUg
dGhlIHByb2JsZW1hdGljIHRlc3RzLCB0aGVuIHdlIHdvdWxkIGtub3cgYW55DQo+IGZhaWx1cmVz
IHdlcmUgbmV3IGFuZCBwb3RlbnRpYWwgaXNzdWVzLiBUaGUgbmV3IHZlcnNpb24gb2YgdGhlIHBh
dGNoIHNlcmllcyBmcm9tDQo+IERhbmllbCBkb2VzIG1vdmUgdXMgZm9yd2FyZCB3aXRoIHRoYXQs
IHRoYW5rcyENCj4gDQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQNCj4gDQo+IA0KPiANCg0K


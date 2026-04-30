Return-Path: <jaeyoon.jung@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3CCCCCFA13
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 21:00:31 +0000 (UTC)
Received: from lgeamrelo12.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.768.1777582823903456082
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2026 14:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: jaeyoon.jung@lge.com)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.52 with ESMTP; 1 May 2026 06:00:21 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO sniperexo5.lge.com) (165.244.147.16)
	by 156.147.1.121 with ESMTP; 1 May 2026 06:00:21 +0900
X-Original-SENDERIP: 165.244.147.16
X-Original-MAILFROM: jaeyoon.jung@lge.com
Received: from unknown (HELO SLXP216CU001.outbound.protection.outlook.com) (40.93.138.29)
	by 165.244.147.16 with ESMTP; 1 May 2026 06:00:21 +0900
X-Original-SENDERIP: 40.93.138.29
X-Original-SENDERCOUNTRY: unknown
X-Original-MAILFROM: jaeyoon.jung@lge.com
X-Original-RCPTTO: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFPN1gEPDWn33y/AGtPci+m77GF4ZPPwsUTDXLcUL9EfNd/6OWf3sbVcEjBjeQxEyrMOVr9jkxDkFp/tJxAMEhpj6AEWebVAP26xQX8IvbbUkgytv0LdMs+5K5CIUQdBZuDSbIJXGMrHMEfYmtY+JMTedfk7FsgMeLY6mUKPbSZIWfATKqed5IzyMKa6azi11WRkvmuRfwNZUT1sASi2200TFxzJo0sgy5Y3MmjTtGKOnAhKM+CKPD+oNf4J149dFZyBPCiY/KmGpgEmxCpire+aLVp4vIPc7yOFZxpkyyRuILHT6ncah/jfQd7XPRb9aGaRTJn7M8UxpOAg1qjVHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yF6RQh5ut02rSusfaELbmPKbXlOYZk+qeVw+dewS+jc=;
 b=YJuXb1T+qoyZfk6DIgzhsLNllP77vs3lvcb8OIryhTq4ktM61by3qKtnHq18j5rgGvoMzhOVHAkHVHwrFsjHl726C3G0qvjU09FmWB/JqXwZuaUVxcB6RX6bY+U2uNXGIRfFPONZGOK+0jFNAMDfhDtGGIEmHsMnYM3VQc+bZ96BO3RQLQIBBDh7P0eLEJYk3V+qUMdbEWKb9jsDJaQBJsEg9DQQJjMQ6qWnVf68QwAsAX4fCTyWlpKbBUreAm+C83FVibo2pDb986UWgdEtDYtlcxhREfhWaOgfdnD3/35qaADdZfJumS2OhQIkb6vc981BgTw5VLHUtS0PNjF9Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lge.com; dmarc=pass action=none header.from=lge.com; dkim=pass
 header.d=lge.com; arc=none
Received: from PU4P216MB1133.KORP216.PROD.OUTLOOK.COM (2603:1096:301:72::13)
 by SEWP216MB3074.KORP216.PROD.OUTLOOK.COM (2603:1096:101:297::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Thu, 30 Apr
 2026 21:00:20 +0000
Received: from PU4P216MB1133.KORP216.PROD.OUTLOOK.COM
 ([fe80::b838:75f7:a447:d66e]) by PU4P216MB1133.KORP216.PROD.OUTLOOK.COM
 ([fe80::b838:75f7:a447:d66e%4]) with mapi id 15.20.9870.022; Thu, 30 Apr 2026
 21:00:20 +0000
From: =?utf-8?B?7KCV7J6s7JykL1Rhc2sgTGVhZGVyL1NXIFBsYXRmb3JtKOyXsCnshKDtlolQ?=
 =?utf-8?B?bGF0Zm9ybeqwnOuwnOyLpCBMaWdodHdlaWdodCBTeXN0ZW0gVGFzaw==?=
	<jaeyoon.jung@lge.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/3] package.bbclass: extend package variables
 for multilib variants
Thread-Topic: [OE-core] [PATCH 3/3] package.bbclass: extend package variables
 for multilib variants
Thread-Index: AQHc1+Tx/OFnOsJMpEuL2e7VhzzVe7X3oe8AgABm0to=
Date: Thu, 30 Apr 2026 21:00:20 +0000
Message-ID: 
 <PU4P216MB1133AC52E32414980F1893FA9A352@PU4P216MB1133.KORP216.PROD.OUTLOOK.COM>
References: <20260429143104.684760-1-jaeyoon.jung@lge.com>
	 <20260429143104.684760-4-jaeyoon.jung@lge.com>
 <ae2eb15dfea13034c01e5159c84a3d33c3379e0e.camel@linuxfoundation.org>
In-Reply-To: 
 <ae2eb15dfea13034c01e5159c84a3d33c3379e0e.camel@linuxfoundation.org>
Accept-Language: en-US, ko-KR
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=lge.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PU4P216MB1133:EE_|SEWP216MB3074:EE_
x-ms-office365-filtering-correlation-id: 7923873c-3a5e-467d-ecda-08dea6fb7d5a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|18002099003|56012099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 
 1712hVVJ2dvc6oV8MZ7PWqKlBADSAwe1RfB9d3e4aCFfZJbocXl5e/C6fVn3bn9d5seQKWwUl54V5Milt/5nIekC5rgKYO6nDbDKHlnccMFhHWEw2l7xprFCmIReWB7jHNTD2Ecq6CRqbsLA3P/iQXCxfnKNaOvgMrMas6i6rcOrjZBXkrIKq6aWg1YAVvO6SSs91Awisu7K7G2/MXjEKMh/0auloFnHMkhkNmdkX1xzqOyaIHCq+Aa0wlSo+vYCTEIeHcyqVaD9A3l7hZaGKTJgoAheiO8cTwnEg8X9ojmTVhybqRb7AVVcFt9Hp5bCjDoj2Dm55nmqvDHlCV7QWx6eUUl6BwZUF1zzn9CZBtBwg20Q09nPiV3da2aCNhCYPS36RwfauWw4+J63fBQFDgK9ImndW/npvNKtiAWzN2o707tPJzfN0y4KtMmNg9F6puo4DsT4P1xAwOvwG+mElGyCdQaQQdayj+MzBAEwgDDh/HU6ropKFCAMCZcfXIkNlKRgdScqx2twEe9H6/Roi1WE2f5+NEoTIU2BO1IrNvNdm6RbBGedLxAZo8/GUbUybvDklpLNCbEJx4MRWbuJIyEvjsucgjEwPXhxrEMTU5q27bg4JC5G+leAQUH6jCBsBsaTaMlpdS7wbZ4e7p7QTFkbr7g00wII8SxptH5hMyrsnLT+H53PWPwC7Zxgn51SJ8YaryMcywgFkBhP+NzhWi+jEZFb7lor3e5G5u9wwFTlfRy5q/6si/fX69UPRft9
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PU4P216MB1133.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(18002099003)(56012099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U3NveEQwWjV4bzRBaFNIVm9ZcFZEK1BxcnhzRkhTRWpWSFdIVWsvbEhlczh5?=
 =?utf-8?B?czVYRlFicVcyVnhLK29NbWszbFhzTUZvRXMyL3puUURYRU0vemMzc2xtWklF?=
 =?utf-8?B?bUc0enh0NENMaDZBN1hDN0ZwazdPMFJzTjF4MWRCSTROR0N6YjVRS3RnL0d1?=
 =?utf-8?B?VzBUanhNb3c2ajVIKzFxOTByUmJNaXh1UGgyQlpjYlhqZ3hwQnFqbFFjWXFv?=
 =?utf-8?B?SGJGaTZYcW9MdysybXRMZzZRWU9KUGhiWmVUaVRERnVXYkFvSUlLYzlsNlNk?=
 =?utf-8?B?UFJIdFM2ZnJPMFJRbmNRMlRrYnJ2Z1d1dm0yZ2NRQ3Nwc0t3Z3ZLOTNPOW1w?=
 =?utf-8?B?V3VtNXZ1enFGMEo0Tm1UK3h0enEvUEphay9JWHdkVE4vNjdxT2ZZeWFxaVN1?=
 =?utf-8?B?RnY5OUlnekJMNGxvZmZudG9CMVFpZExsdGpZVXd3cnFYd0ZIYktqNVkwaFJp?=
 =?utf-8?B?anNZcU1sdkJ5UlRmNDQwNlY4MFVjVHFaTkcxZi9kZ2EzZTEzbUFqa1FkV29Z?=
 =?utf-8?B?OUlJM1pFbDN4RDhHS3J0cDNkM1cyOC9oTGdTVUlWQzhYZGcxUDVYUXJmSE56?=
 =?utf-8?B?QXA4MmxpQy8rU3VBbHlNYksvL2pEMFdyTEZHc0NsVHhWemg1dEVhMVFCaTJK?=
 =?utf-8?B?UVMzRnhmdUFhckxLM0tJZW5XdW9EVmJBQXVVWnJNUHZGMGdEZ3FVNnRaVldW?=
 =?utf-8?B?OEtaSUdTTXI1My9LdUNwb0ZGKzRMaHFnQ0JJTHBhbHJIeGx1U1Y5UWJnREtS?=
 =?utf-8?B?MGRyK0Uzbkc2dnUvbzdsdE94a3REZkpiTkFqbGNOck9GRjNGOTJFZmJhNEU5?=
 =?utf-8?B?d3RGeGdnaHRHVEcweFA5dC8rYVMybnRvZWEvNGRHOVJxY2J1UzBRdzBGbXJ4?=
 =?utf-8?B?ZGhxS0R1UklqMVZxeVhaUDdtU081Mk5pc2RRYUtXdWZWTTh2ZnRHeFhzZ010?=
 =?utf-8?B?anFidXlvMHJJM0R1bjVCYk9IWjhENTQvYmpoRFFxY3g3VE84TzQ5eXZOV1hj?=
 =?utf-8?B?MitPVkM3ZnZMWVB0d3R3cnZiaHBRY3Y4ci9qSnNHL0lMdkNRczFFRDJwTXdv?=
 =?utf-8?B?aURpT0Y1ZVVnVUVoeXhyTllualZlUE9hS0dNbEJzRG9vcWIzL01EUVVXRit4?=
 =?utf-8?B?d0RkcnhWRnl6TXZoRWZQNDkxRWdRY1Zscksyd0d6V3Yxakk0R2NKd0RVSHJm?=
 =?utf-8?B?eEZwVERvTUFNZWRabmVtYmJBVG1RVjcrMjZKQ05sYzJKRnE1MEFOWmdwT01P?=
 =?utf-8?B?dmc0K3BQUEFKQzZ0UWxTVjJsVnRuL211cTR3c2tQVnUyUEtvRktUNjkrYUk2?=
 =?utf-8?B?SU1yZUFaM0RJQWlNbnJlTTBCL1lZcE5OaG9BbGY3dkI1anA4aTlKcjljUysw?=
 =?utf-8?B?VEFYL2p2Rng2TFNDVjZTb0ZROXQwTHRTazNpY0dJOFhTVTJOcFZWU3ZYMXFP?=
 =?utf-8?B?bGF0bVEyVW9qaTZmdmlEbEkvWmJnNG9kMnVydk50UG01ZXBIVU1hVUtMeE43?=
 =?utf-8?B?eDdxb3JrUWYvdkRKek9PRVlRb3JUMXFUNHkxR0htam96YkVTMlVyT3liSEEv?=
 =?utf-8?B?UTBkQ0d3RVFOUVR4amYrejZsWTlXN1F4eHhPczhTNCs3ckdJbFI5cGF4OHZ5?=
 =?utf-8?B?U01DWE5BMzZ1UmtLR3ROaS85WHBySkZSVnVadjIyMXk1QnlUaXE4a3hZcUU2?=
 =?utf-8?B?K0RMT1YvYzVJVmxpelRrbU5wUXJjNld5LytFZC8zN1lWMlBQV1U4dWgyRFha?=
 =?utf-8?B?RnhQWndLWlAxOGZKUUZHejRpMWVNZStOMG1jYnNldUFCekkxbzlQcmIrUkhy?=
 =?utf-8?B?VUo4VG9KWmhjRzYvTDQ4ekpCN0xBZndObDVTVTBiVXFlMFVFUUJHLzQxcmVR?=
 =?utf-8?B?NFRKT215eWFmcVRKV3cwOHJpZDRBUi9vbWRXT1BSZGw3MU9WZVg2STRTNXZW?=
 =?utf-8?B?RllhUi9yVUJ1bFBiN3MySzZQblJzR1A4aXBzQmtnbmRrVThnU2J5MDU4Y2JV?=
 =?utf-8?B?L2FHMXNQTWg5Q1MvNEd1L2ZDRnErOHVnS3UzQXFUM3E1QUpLMjJvYU9vTyt4?=
 =?utf-8?B?eGEvS2VZT3JHTVlXQWdiRkQ1VFF3QXhXK2cxVm8rcVJWWk9HMFA4UWZUVktt?=
 =?utf-8?B?STV5a1Y2MWZqUktkMGxXbERvZ05LUFgvbWliYnhZTGJoSFVycjYrNFQydjhq?=
 =?utf-8?B?K0NQSE1mT3V5VU1tZG9CMWl0d2syOTZiQk90OHIwK1ZZUlREK29qZXFCcWhj?=
 =?utf-8?B?OGxISDVlRXdab3BQMHp5dE5lU09hQ2MyYWVKMDg4KytubTF3bjFTQlFqcTJM?=
 =?utf-8?B?ZDFlQ3hGcUR1dVhmRnEzZjNYR2FTcTZJRVp4dVZrN0lzWDQ0NXhEZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	NSg8hLUgEeIG8nZx4Q73jdMOG8Rvf3Jq5ALcJFLUYEVYc7xolnBzxBP417rR+rWKUUrWMw6Y+xErLw+J1FKHYzgV7FqvF2B35kj41dACpGAocC5FktUT9Dgn6Zj+iTrN5EQIYDH8784Oa0SUh0y6AP0Nk3vXDVHV1pRPR/HbDApZitlx3YQ2K/L7xaMI0ukmGo2gwO49c/K4EVU9c3/9U7vrscP84A8jXc8B7wBFFCj4iUgmVPyaShYsr8/mCaqAU+Tg5sJAPSt3GufJREJb2MtWpfEgN5HIKFKcOYzZnVwRThz1Re+Pgdwvv9fqOtLrOtWXP7tU6a09BxTrxLQ+dA==
X-OriginatorOrg: lge.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PU4P216MB1133.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7923873c-3a5e-467d-ecda-08dea6fb7d5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2026 21:00:20.3053
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5069cde4-642a-45c0-8094-d0c2dec10be3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1hjKykI9y/kd0cJ9ujd4/a0fnlxWSEWqiwczofq7OYorItcHi39WOcmKC+IOTx6NV4eIBUqhCzZOa0pnRb0bgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEWP216MB3074
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2026 21:00:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236187

PiBGcm9tOsKgUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5v
cmc+Cj4gU2VudDrCoFRodXJzZGF5LCBBcHJpbCAzMCwgMjAyNiAyMjo1NAo+IFRvOsKg7KCV7J6s
7JykL1Rhc2sgTGVhZGVyL1NXIFBsYXRmb3JtKOyXsCnshKDtlolQbGF0Zm9ybeqwnOuwnOyLpCBM
aWdodHdlaWdodCBTeXN0ZW0gVGFzayA8amFleW9vbi5qdW5nQGxnZS5jb20+OyBvcGVuZW1iZWRk
ZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnPgo+IFN1YmplY3Q6wqBSZTogW09FLWNvcmVdIFtQQVRDSCAzLzNdIHBh
Y2thZ2UuYmJjbGFzczogZXh0ZW5kIHBhY2thZ2UgdmFyaWFibGVzIGZvciBtdWx0aWxpYiB2YXJp
YW50cwo+IMKgCj4gT24gV2VkLCAyMDI2LTA0LTI5IGF0IDIzOjMxICswOTAwLCBKYWV5b29uIEp1
bmcgKExHRSkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6Cj4gPiBGcm9tOiBKYWV5
b29uIEp1bmcgPGphZXlvb24uanVuZ0BsZ2UuY29tPgo+ID4KPiA+IEVuc3VyZSBQQUNLQUdFVkFS
UyBhcmUgZXh0ZW5kZWQgZm9yIG11bHRpbGliIHZhcmlhbnRzIGR1cmluZwo+ID4gZG9fc3BsaXRf
cGFja2FnZXMgc28gdGhhdCBwZXItcGFja2FnZSBtZXRhZGF0YSBpcyBjb3JyZWN0bHkKPiA+IHJl
bmFtZWQgd2hlbiBCQkVYVEVORFZBUklBTlQgaXMgaW4gdXNlLgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IEphZXlvb24gSnVuZyA8amFleW9vbi5qdW5nQGxnZS5jb20+Cj4gPiAtLS0KPiA+IMKgbWV0
YS9jbGFzc2VzLWdsb2JhbC9wYWNrYWdlLmJiY2xhc3MgfCAxMSArKysrKysrKysrKwo+ID4gwqAx
IGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9tZXRh
L2NsYXNzZXMtZ2xvYmFsL3BhY2thZ2UuYmJjbGFzcyBiL21ldGEvY2xhc3Nlcy1nbG9iYWwvcGFj
a2FnZS5iYmNsYXNzCj4gPiBpbmRleCA2NzE0OGZjMWFjLi5kOTgxNDI0MjkwIDEwMDY0NAo+ID4g
LS0tIGEvbWV0YS9jbGFzc2VzLWdsb2JhbC9wYWNrYWdlLmJiY2xhc3MKPiA+ICsrKyBiL21ldGEv
Y2xhc3Nlcy1nbG9iYWwvcGFja2FnZS5iYmNsYXNzCj4gPiBAQCAtMTY5LDYgKzE2OSw3IEBAIGRl
ZiBkb19zcGxpdF9wYWNrYWdlcyhkLCByb290LCBmaWxlX3JlZ2V4LCBvdXRwdXRfcGF0dGVybiwg
ZGVzY3JpcHRpb24sIHBvc3RpbnN0Cj4gPiDCoAo+ID4gwqDCoMKgwqAgZm9yIG8gaW4gc29ydGVk
KG9ianMpOgo+ID4gwqDCoMKgwqDCoMKgwqDCoCBpbXBvcnQgcmUsIHN0YXQKPiA+ICvCoMKgwqDC
oMKgwqDCoCBpbXBvcnQgb2UucGFja2FnZQo+ID4gwqDCoMKgwqDCoMKgwqDCoCBpZiBtYXRjaF9w
YXRoOgo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG0gPSByZS5tYXRjaChmaWxlX3JlZ2V4
LCBvKQo+ID4gwqDCoMKgwqDCoMKgwqDCoCBlbHNlOgo+ID4gQEAgLTIyNSw2ICsyMjYsMTYgQEAg
ZGVmIGRvX3NwbGl0X3BhY2thZ2VzKGQsIHJvb3QsIGZpbGVfcmVnZXgsIG91dHB1dF9wYXR0ZXJu
LCBkZXNjcmlwdGlvbiwgcG9zdGluc3QKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBob29r
KGYsIHBrZywgZmlsZV9yZWdleCwgb3V0cHV0X3BhdHRlcm4sIG0uZ3JvdXAoMSkpCj4gPiDCoAo+
ID4gwqDCoMKgwqAgZC5zZXRWYXIoJ1BBQ0tBR0VTJywgJyAnLmpvaW4ocGFja2FnZXMpKQo+ID4g
Kwo+ID4gK8KgwqDCoCB2YXJpYW50ID0gZC5nZXRWYXIoIkJCRVhURU5EVkFSSUFOVCIpCj4gPiAr
wqDCoMKgIHByZWZpeGVzID0gKGQuZ2V0VmFyKCJNVUxUSUxJQl9WQVJJQU5UUyIpIG9yICIiKS5z
cGxpdCgpCj4gPiArCj4gPiArwqDCoMKgIGlmIHZhcmlhbnQgYW5kIHByZWZpeGVzOgo+ID4gK8Kg
wqDCoMKgwqDCoMKgIGltcG9ydCBvZS5jbGFzc2V4dGVuZAo+ID4gK8KgwqDCoMKgwqDCoMKgICMg
RXh0ZW5kIHBhY2thZ2UgdmFyaWFibGVzIGZvciB0aGUgZ2l2ZW4gdmFyaWFudCBpZiB1bnNldAo+
ID4gK8KgwqDCoMKgwqDCoMKgIGNsc2V4dGVuZCA9IG9lLmNsYXNzZXh0ZW5kLkNsYXNzRXh0ZW5k
ZXIodmFyaWFudCwgcHJlZml4ZXMsIGQpCj4gPiArwqDCoMKgwqDCoMKgwqAgY2xzZXh0ZW5kLnJl
bmFtZV9wYWNrYWdlX3ZhcmlhYmxlcygoZC5nZXRWYXIoIlBBQ0tBR0VWQVJTIikgb3IgIiIpLnNw
bGl0KCkpCj4gPiArCj4gPiDCoMKgwqDCoCByZXR1cm4gbGlzdChzcGxpdF9wYWNrYWdlcykKPgo+
IEZpcnN0bHksIHRoaXMgcHV0cyBtdWx0aWxpYiBjb2RlIGludG8gZ2VuZXJpYyBjb2RlLCB3aGlj
aCB3ZSd2ZSB0cmllZAo+IHZlcnkgaGFyZCB0byBhdm9pZC4KPgo+IFNlY29uZGx5LCB0aGlzIHBy
b2Nlc3NlcyBhbGwgb2YgUEFDS0FHRVMgYWdhaW4uCj4gcmVuYW1lX3BhY2thZ2VfdmFyaWFibGVz
IGlzIGRlc2lnbmVkIHRvIG9ubHkgYmUgY2FsbGVkIG9uY2UuIENhbGxpbmcgaXQKPiBhIHNlY29u
ZCB0aW1lIGlzbid0IGEgZ29vZCBpZGVhLiBXZSByZWFsbHkgc2hvdWxkIG9ubHkgcHJvY2VzcyB0
aGUgbmV3Cj4gc3BsaXRfcGFja2FnZXM/Cj4KCk9uIHlvdXIgc2Vjb25kIHBvaW50LCBJIGFncmVl
IHRoYXQgdGhlIG5ldyBzcGxpdF9wYWNrYWdlcyBhcmUgdGhlIG9ubHkKdGhpbmdzIHRvIGJlIHBy
b2Nlc3NlZCBoZXJlLiBJIHNlZSB0d28gcG9zc2libGUgYXBwcm9hY2hlczoKMSkgSW50cm9kdWNl
IGEgbmV3IHZhcmlhbnQgb2YgcmVuYW1lX3BhY2thZ2VfdmFyaWFibGVzIGluIENsYXNzRXh0ZW5k
ZXIKdGhhdCB0YWtlcyBhbiBleHBsaWNpdCBsaXN0IG9mIHBhY2thZ2VzIHRvIHByb2Nlc3MsIG9y
CjIpIEV4dGVuZCByZW5hbWVfcGFja2FnZV92YXJpYWJsZXMgdG8gYWNjZXB0IGEgcGFja2FnZSBs
aXN0LCBhbmQgdXBkYXRlCml0cyBleGlzdGluZyBjYWxsZXJzIChtdWx0aWxpYi5iYmNsYXNzIGFu
ZCBuYXRpdmVzZGsuYmJjbGFzcykgdG8gcGFzcwpQQUNLQUdFUyBleHBsaWNpdGx5LgoKT24geW91
ciBmaXJzdCBwb2ludCwgSeKAmW0gd29uZGVyaW5nIHdoZXRoZXIgZG9pbmcgdGhpcyB1bmNvbmRp
dGlvbmFsbHkgaW4KZG9fc3BsaXRfcGFja2FnZXMgd291bGQgYmUgYSBwcmVmZXJhYmxlIGFwcHJv
YWNoIOKAlCBrZWVwaW5nIGl0IGdlbmVyaWMKcmF0aGVyIHRoYW4gbGltaXRpbmcgaXQgdG8gdGhl
IG11bHRpbGliIGNhc2UuIEFsdGVybmF0aXZlbHksIGlmIHlvdSBldmVuCndhbnQgdG8gYXZvaWQg
YW55dGhpbmcgbXVsdGlsaWItc3BlY2lmaWMgaW4gcHVibGljIGNvZGUgbGlrZQpkb19zcGxpdF9w
YWNrYWdlcywgdGhlbiBpdCBzaG91bGQgYmUgaGFuZGxlZCB3aXRoaW4gbXVsdGlsaWIuYmJjbGFz
cy4KQnV0IEkgZG9uJ3Qgc2VlIGhvdyB0byBhY2hpZXZlIHRoYXQuIEl0IHNlZW1zIHRvIGJlIHRy
aWNreSB0byBkbyBpdAphZnRlciBkeW5hbWljIHBhY2thZ2VzIGFyZSBwcm9jZXNzZWQgYW5kIGJl
Zm9yZSBlbnRlcmluZwpvZS5wYWNrYWdlLnBvcHVsYXRlX3BhY2thZ2VzLgoKCkJlc3QgcmVnYXJk
cywKLS0tCkphZXlvb24gSnVuZwpTb2Z0d2FyZSBQbGF0Zm9ybSBMYWIuIC8gQ29ycG9yYXRlIFIm
RCAvIExHIEVsZWN0cm9uaWNzIEluYy4K


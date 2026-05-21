Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C26A5CD5BAC
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 10:25:28 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33280.1779359123545826789
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 03:25:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=N1RmrlBH;
 spf=pass (domain: ericsson.com, ip: 52.101.72.31, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B42K9EopwltDLx+O3DjjJ1p1f66TE7FWbHwiCVe/lB/l08j2piZjfiyQREimX8fnNQjRJnIKg+BMqHJpZ4T1tAg34+pPzFLCaNd8YC7esiHwhb9K1jjiMs/yGLXnuxFPPgC1F1g1C1m/6X88dod6T6wSW/2f2nqwVixQ7xnZ7iwFcSh798EGNqr+OIteqFZevZnW1dLTNeJuKGI/xBfgSQzJEMeGRwy39XDVwO/EGHReksadWwQveew8azk64Otio5Iokxg8Nwf6VJJWV2iFeY4dgc+2EskUlEbKPkJYBAl9APAh+58nX6hvQvOFbNdAfpKo2yy68Im7BZIKX8DoXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXyrx/yVGq3eNNcT9fHV1sxdjcsCiJDf+bJGe6R8WuE=;
 b=Ss32dKMT3LdYvZv1y0ymXwCBCz1kNIjMz56jutBSuJ9h9gBjHPKIqPR3HHamreC8UEwT/Z6uOPjDz06RJnLcK+k7cFT54aVfTroC2Qh+jNvGpfgIyapHc2Xub1LgeBcPu8FgV6BvyQqpdaWb/kit9cNnLDqPIBcVQr+tZ0TorXNYvv/m648sS+Rmn/bMsztNv1nnTtjIz6dE/k3uITWJdUmjvr0GBteKwuytjiiZIjdkXqBtIOUYpSXAmT6J1Te6LSzU3WA2SwAlEwi1niJlEq1jtNImhkmIfbAkEIdA3+4tz0c29LVqlkr68qiLyDtp0029YxK6rbnnk/e641NaRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXyrx/yVGq3eNNcT9fHV1sxdjcsCiJDf+bJGe6R8WuE=;
 b=N1RmrlBH4W1JBzPr3qoxijvB5ql79Tb7BoXsy0fTqZJ9OiltXMYQ4c8fkTnOye1B3idxurX6YqV5HJvXa0ZmyCYDZfo4huyNiX8JLcbV7XepLfFZc91guv/JBUAnPeKtgDA+5ED2EEOjsBeeL6Wuc4LzbrF8sD/SCve2yjX9Z7lAZKhoE25JtZWri8LZyjrHmSs6fZYWJaXWmcnr4qwf2thzTi2P1C9ZTYP52le4Y7iEAZCOrJsEAQ/tFt/DIoQjxomeUzNxRrOi9erWxs8BTARW+8zEKzVeqXjzudYgxE6PRHnlfPy6nTRSn4MUX+dRu9Rmb02j7HHwSkBiF9i6cw==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by AS1PR07MB9648.eurprd07.prod.outlook.com (2603:10a6:20b:471::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 10:25:18 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%7]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 10:25:18 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "ticotimo@gmail.com"
	<ticotimo@gmail.com>, Tim Orling <tim.orling@konsulko.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, Ross Burton <ross.burton@arm.com>
Subject: RE: [PATCH v4] devtool: upgrade: extract changelog between versions
Thread-Topic: [PATCH v4] devtool: upgrade: extract changelog between versions
Thread-Index: AQHc5s6W6ed30615g0Sv9IRu2gWVD7YYSI8AgAABdBA=
Date: Thu, 21 May 2026 10:25:18 +0000
Message-ID: 
 <PA3PR07MB1072144F3A9A22B216961FBCB8A0E2@PA3PR07MB10721.eurprd07.prod.outlook.com>
References: <20260518135925.2579226-1-daniel.turull@ericsson.com>
 <CANNYZj_b1FwJ888KMGpMSvBHQTWw6ns_M83Z3hn5WQHbi-_WCQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_b1FwJ888KMGpMSvBHQTWw6ns_M83Z3hn5WQHbi-_WCQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|AS1PR07MB9648:EE_
x-ms-office365-filtering-correlation-id: 07dcfe17-1be2-4661-7f0c-08deb72341ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|22082099003|56012099003|18002099003|3023799007|6133799003|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info: 
 9ZWFOEWuMF3DixBbfKWei8OFIRrofQfbjhQWjtl6mf615OpMOLWqiEcho6gdq4FN5151LIB5ZW7o1avPcdma6eVM6JolxIjTYG906SyEJhxjhReJIW8xrxnXLrFEYd4Xzk/xfVs73w7f1RTcoXv1dL2njLFN7S7eoxZMsJgFNAaPO23zwlHrwq5MrfzOg/Em7pXhcnuvlAQuUhjMb6XKbRnsg/Ix1tQoHUtPsHQUfSoYyo8FBPCIUMdWULBCi/CSdJr3KCYHtkY9Q9FHjaku9dBR5ycOXdRsqkpxORDx/W+FfhHDYxN1mhUHPZlj+BQE7WN3h6F8Mmh99OxOy6PQnO5oGXr5eKSdIAK75Qq/HlBb/+jCRgRADbfRWOI47Y0LTRWtqnY48EBgpww5nwwRgx/cf6TI0lHICYHHEi3GXDtF+pxcc0I5LIO+2f7Nh/Ws8NBGytBrtdubl5dgZ4gto+TS3xTt8PlJF4mEYKL5271Y2XbKUKDm77ENnhGtoFqu02wKzp6QMPHQf2OAFwUMtwbznhE452Gj61fIFO8b4XWKnEDh0eRvCeRIcKklG2//phjIklbRdsdOJVvC5P/gO5xr9khK0zCh6kp7cyd3U21gk9lai8msJ+s+NTeKn0W6bMzw66nkpWAxh7AIk8oZ3QoCWj2U9MhkjVLaAE9WsleKpcX2ggIfOWEodeCy0Ol1BIC8E++hJsfA+ylHtD4qWP2yzgw3SngVZ4xxGBKMxN/fDw1IFkzY6YaF4q/V0x59
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(56012099003)(18002099003)(3023799007)(6133799003)(11063799006)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ekRlMkJaVXdoc2gxRXhSb3RYY1BSa2I4Wm5EZTZXWUN4bFZLRUNyZGVoeVo5?=
 =?utf-8?B?M3dxMURSWDBTZndQMVlZQUR1ZFpkR0ViVWR1SEY4ZjB3aDNGWkkwSk12eWFx?=
 =?utf-8?B?V09GUEhkQ3EzT1ljTTBzRmVuY25iMzg3a1NiQ2tUanhLY3hsTEJaak54djFK?=
 =?utf-8?B?cXFKODErbG8yelJxWEg4NzNuV2ZoUjNHNnQ1UkM5YTg4OVBDTFdkTmd5WStN?=
 =?utf-8?B?UmdJbVo4QmllQm1nZGZMQUhTNHNKUmpYZUVzUHNKL1dRS1MxZXNGMk5JTHBQ?=
 =?utf-8?B?elNnR1pHa1VOM0V2NVlXMGlxSW1kVjliN1FVKzdmdnVmb3VJR2F6K0NCWmdx?=
 =?utf-8?B?U29lMldGQXJvNTEvK0F1dGVCZzB0Q0pxRFV3TmowbmE2OGRRbXdGQitqRWZQ?=
 =?utf-8?B?K2FnZWEvTy9qRmhNa09EaUc4RWVqZStTY21SUGNBWnQwUGhtZmtzQ1FZSXpG?=
 =?utf-8?B?MnRTV2FTb01jcG5KbFZ4VWExOFJjK3hUaWNWZUdmQm02SjdOK1Uzb0ozUDcv?=
 =?utf-8?B?cGtQTWxFc2ZQK3JLdkRSWXM1MTVFQzA3bExvYVdjMWNUcTJSWG9Fb0VXeHc3?=
 =?utf-8?B?bzRMYi9HYlJWRzJLbTM2d3ZsMHdQN3RSZGdrUGtPRHAvUEtXUnRGb0hyKys3?=
 =?utf-8?B?S3BSUWVjeERxbjJ3bzV1cFUzaEJmUjN0UWtncEhlLzk1NFNaU2VBeEhsSFBo?=
 =?utf-8?B?QnczTkNxa081VDlXTDk1R2JTWXJiaExrREVYRUh6UHJCVFJQMXMrZHltMDlu?=
 =?utf-8?B?KzdtS3BZWWtUMGRZNVpyODhzVmxNWm5SVUpLR1JVTDRURWNBTG4xZzZsVFdE?=
 =?utf-8?B?dW5FbHJHUEF6VWFLMWswdEJia2JCNkx6dG95NkQvdFNUWXZ1dkFnNCtkbHlG?=
 =?utf-8?B?aEQxTCtrVlBoWU9HM0FrRExqWlN2OW81QWFjZTEvcUFtNG1lUmJoME9Ga210?=
 =?utf-8?B?OWxtWlQ4WVozb1gwSFFJUFdGci9vOHFWQXVIbnRkRFQwb3hLUGtiV2pjNVFu?=
 =?utf-8?B?amlHRHA0amFVVzZhSzRaakIrRmhiY2laUkRpaHlSRWVCK0JhTzByZ3hxSzIw?=
 =?utf-8?B?M2tYQ2traG5sYjVud09wbVRmQTE0UVlTTENoN1J0Wk9hQWxvL052V21rMEl3?=
 =?utf-8?B?NzNuUzhrR3lmUzVtNG9ac0hrdzZpelppdmpLUkVUeGhoakJmNlJDNzdnOW9j?=
 =?utf-8?B?WEhDNkN6TTk5djVpazNlWm53bGFlUUNWeXBoOXltV25MbVhEeEZFYkZQUmFq?=
 =?utf-8?B?T1p1QS9GMXJ4SmVpSGdRalVjMEV5NXVIQzgrWnRFMXRZdy9iU2lpdjBTTjBU?=
 =?utf-8?B?NHd1UERyZ0x0Y05XQktVY05KZ3NiNjdQdlZJMVJ3S0FJb2kxbUhzcWdLeUZr?=
 =?utf-8?B?N2gzRjF4azdXclB0dlJpdmlQY3BDZHovOWJacE1vTnR6YXA2RWQyQm1HaFdh?=
 =?utf-8?B?b0RYWmNnOTh4dXR3aHlselY0OG9UbGZaRUJCdjFmeE1sRjhWcmdiS0diWC95?=
 =?utf-8?B?TEd0TDNQWU83VWhuTjF1Q2JSK09YV3VXRndJanRlUjlhYkxGMDNqcFNtWXN2?=
 =?utf-8?B?TzU1UmVZbHIyVzRWNTg5NGpOa0RGdjExQlVlQk9BZk5DckVVUVhQcFhTOEFs?=
 =?utf-8?B?M2xDMHgyTlYwVkFFemptK21IQmxUNGNpQXhUd3d3YjlrYkxLamRNRk1LbC9z?=
 =?utf-8?B?VlBxZUppMzhZYkRkVEVGMy9MQ0RQRU53S1kyb1VhcUJiRW9Sb0NPV3VmcmNz?=
 =?utf-8?B?ekVtMCtIZmRhakJ5VTBjZXlzTnFDNlR4ZHZlWHhNVWR1b09BTW0zNGNaQnlH?=
 =?utf-8?B?b1R5YjhFSVovVlYrU0JqbXg1WU1Xa0ZtVVI4d1ZzNkFqZmpuek1GRnJTcmJa?=
 =?utf-8?B?eDJML2c2dDBJUVl5S1NpbTZJSVIvVitxb2xROWJVVVIzUjk5Z1R0M2F3bEd4?=
 =?utf-8?B?MUFCTkdDUUxpbjYvdHppTG9ocEtsN0w2c2lIWXpIdy82aDYwQXJ5Yjl4dlVN?=
 =?utf-8?B?bXlLMzhJU1lpdmJuT3lNWWlvRWNVcThQOTJvc3JaR292MmhlNEVrMjFOaG1H?=
 =?utf-8?B?U1RwaU94SW1JM25wZ3ZyU1I4ZHh5VjFzcVRReExySHRXVVQ4MmRDK1ZZNXdF?=
 =?utf-8?B?YlZ1KzBsY1FmZ1FUeDFKUFBLTlN5c3dVS3BsanR1Q1d3eWxkdkUxd0ZEWUEr?=
 =?utf-8?B?Y2hDZkd3TVRrNWVpa2ZVNXZMZ1lpQ1YrNk9PZWMzeVdZdzAvRWZvWVFTMmIx?=
 =?utf-8?B?bWJ5RDNYT2puWFlRbW4xOVE2dXdvQVJjK0w1Z3pPek5BU09Od2JQOWlEcTFQ?=
 =?utf-8?B?c29TMWRQYW16NXdmc1JwNDlYcjV0ZUNHcTVIYytZWDRGVGY4cTRVQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07dcfe17-1be2-4661-7f0c-08deb72341ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2026 10:25:18.8617
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZhJ2zfrMjwEgdvHS0GOkrvLIBKDEHDtMwDhwTytM3TU11Z3yqcxkJlH5mKJGtf68GqWYI4ugOI6pAgExDTHZJxcm5iaPMW6rS2+zVa2mXcY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR07MB9648
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 10:25:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237499

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleGFuZGVyIEthbmF2
aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCAyMSBNYXkgMjAy
NiAxMjoxOA0KPiBUbzogRGFuaWVsIFR1cnVsbCA8ZGFuaWVsLnR1cnVsbEBlcmljc3Nvbi5jb20+
DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnOyB0aWNvdGlt
b0BnbWFpbC5jb207IFRpbQ0KPiBPcmxpbmcgPHRpbS5vcmxpbmdAa29uc3Vsa28uY29tPjsgUmlj
aGFyZCBQdXJkaWUNCj4gPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+OyBSb3Nz
IEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NF0g
ZGV2dG9vbDogdXBncmFkZTogZXh0cmFjdCBjaGFuZ2Vsb2cgYmV0d2VlbiB2ZXJzaW9ucw0KPiAN
Cj4gT24gTW9uLCAxOCBNYXkgMjAyNiBhdCAxNTo1OSwgPGRhbmllbC50dXJ1bGxAZXJpY3Nzb24u
Y29tPiB3cm90ZToNCj4gPiBPdXRwdXQgaXMgd3JpdHRlbiB0byB3b3Jrc3BhY2UvY2hhbmdlbG9n
cy88cG4+LnR4dCBhbmQgY2xlYW5lZCB1cCBvbg0KPiA+IGRldnRvb2wgcmVzZXQuIFRoaXMgYWxs
b3dzIEFVSCBhbmQgb3RoZXIgdG9vbHMgdG8gcGljayB1cCB0aGUNCj4gPiBjaGFuZ2Vsb2cgd2l0
aG91dCBpbXBsZW1lbnRpbmcgdGhlaXIgb3duIGV4dHJhY3Rpb24gbG9naWMuDQo+IA0KPiBUaGUg
cGF0Y2ggcmV2aWV3IHBvaW50ZWQgb3V0IHRoYXQgdGhpcyBoYXMgYmVlbiB0ZXN0ZWQgb24gYSBz
bWFsbCBoYW5kZnVsIG9mDQo+IHJlY2lwZXMsIGJ1dCBiZWZvcmUgdGhlIGNoYW5nZSBnZXRzIGFj
Y2VwdGVkLCB3ZSByZWFsbHkgbmVlZCB0byBwZXJmb3JtIGFuDQo+IGluZHVzdHJpYWwtc3RyZW5n
dGggc2V0IG9mIHVwZ3JhZGVzIHdpdGggaXQsIGUuZy4gYSB0eXBpY2FsIEFVSCBydW4gb24gYWxs
IG9mIG9lLWNvcmUNCj4gKHBvc3NpYmx5IHJvbGxlZCBiYWNrIGluIHRpbWUgdG8gaW5jbHVkZSBl
dmVuIG1vcmUgcmVjaXBlcyksIGFuZCB0aGVuIHNoYWtlIG91dCBhbGwNCj4gY29ybmVyIGNhc2Vz
LCB1bmV4cGVjdGVkIGZhaWxzLCBhbmQgcGF0aG9sb2dpY2FsIGNoYW5nZWxvZ3MuIEkgd2FzIGdv
aW5nIHRvIG1ha2UNCj4gdGhhdCBydW4sIHRoZW4gSSByZWFsaXplZCB0aGF0IHRoZSBjb21wYW5p
b24gcGF0Y2ggZm9yIEFVSCBoYXMgbm90IHlldCBiZWVuDQo+IHBvc3RlZC4gQ2FuIHlvdSBtYWtl
IHRoYXQgcGxlYXNlPw0KPiANCg0KWWVzLCBJIGNhbiBkbyB0aGF0LiBJIHdhcyB3YWl0aW5nIHRv
IHN1Ym1pdCB0aGUgQVVIIHBhdGNoIGFmdGVyIHRoaXMgYmVlbiBtZXJnZWQsIGJ1dCBJJ2xsIHNl
bmQgaXQgYW5kIHB1dCBhIG5vdGUgdGhhdCBkZXBlbmRzIG9uIHRoaXMgcGF0Y2ggdG8gZ2V0IGlu
Lg0KDQpJIHdpbGwgdGFrZSBhIDEgeWVhciBvbGQgb2UtY29yZSBhbmQgcnVuIEFVSCBza2lwcGlu
ZyBjb21waWxhdGlvbiB0byBiZSBmYXN0ZXIuIEknbGwgcHVzaCB0aGUgY29tbWl0cyBhcyBpcyBp
bnRvIGEgY29udHJpYiBicmFuY2ggYW5kIGFuYWx5c2UgdGhlbSBmb3IgY29ybmVyIGNhc2VzDQoN
CkNoZWVycywNCkRhbmllbA0KPiBBbGV4DQo=


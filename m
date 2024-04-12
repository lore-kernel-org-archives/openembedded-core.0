Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3F8C4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 13:47:24 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.52])
 by mx.groups.io with SMTP id smtpd.web11.46929.1712929639421504940
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Apr 2024 06:47:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=muUhRJwh;
 spf=pass (domain: siemens.com, ip: 40.107.22.52, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FtiHHPp4NiWyK/zt0GVM/NSVa4OHlgRwFwG+eqe4MwN5zO2h4Q6X19s3F8vF0gBZHU0heMRjdq5NFY50+7wroPPZHSmDOWtMD+JX4Yum3kUclXHd5JYkrl1NUWs4mF9eO89xJSpVyve96if95YPiJXkKGq6LYuRdtYuJux0QBj1oLr8or4xHL0kZLRoD3/qOSUmbBPgLLFIXng8DFqeBIZa4ZfYGcwIs8sXlWwcloHTs3lneZTNOJBCArmwmCaycSFwjDzCOS7QOACWsiCVlXaHaUgeCctUew8xChQp+KbcytkiAVhVxFBEJUbkYq3phQnTny5yk+d+pZKpEBl+w4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eiqTimbUj8viR+omIGKiV3s59C7fG5nJ5KQUBWFpKQY=;
 b=CnXZsTBlNuiwbPFafcDEmYCyMOtWzYGhPizthznpTaS9UbhFRt7MIJ5hgC/i3lBupM5h2RRhp/+UlKXD9B2V13ls5J263PuHmS5dVzFxvn9kyZ05qb6gVlnU9LN8+en+pytDegXnW6mczz0x4wkY+VydpVt2NBjzftuiLLSvpvWEU1G47W82GRiP246hRPj8gG+8/xsaJiVHclcqtSFUFdgg3ua1ku9WGL2rlHNKsohaEcGkslKRYJx5NHDpgO8GrBF10CE64N0zr0U/SMzyvayzDo2x6WhJBg58eVhr2LARhLKfEn58XRIWrilT4sBPy5AN496pjiCq/dzoGX97vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eiqTimbUj8viR+omIGKiV3s59C7fG5nJ5KQUBWFpKQY=;
 b=muUhRJwhCy6UOz3h/eyG5xs5e0e7FxwfdlQXpvEnXQxlCJ+YSHz8bfqmZgIbaWWF1EqOYLMlb4jI50yjhn6WV0kB8aizOtElnLlLSkKBmixjbyE5ioJLzfdWwAMd7CMtxPRXhqq8IC545t5mcdt5GScqHj1VXFb1M9LwVn003CRjn72oiYPXId+b7Hv9774TAXZs7tIjRwVme5Pz+kgbbHChB3QhEXi7ab7uSLgCePZigxXyXT0Gws6LcVyoakVMc05llDqzqdvCoo4uYwiSh/qGrfFKxiScuZSDxkWr8JPnLfQDV/erwbv/16FrxRY45QvGj1Yd7tOieqHfr0zjrA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by DU0PR10MB7923.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:321::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Fri, 12 Apr
 2024 13:47:16 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fd78:3502:7564:1891]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fd78:3502:7564:1891%4]) with mapi id 15.20.7409.053; Fri, 12 Apr 2024
 13:47:16 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Ross Burton <Ross.Burton@arm.com>, "alex@linutronix.de"
	<alex@linutronix.de>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>, "joe.slater@windriver.com"
	<joe.slater@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] systemd: make predictable name mac policy
 opt-out
Thread-Topic: [OE-core][PATCH] systemd: make predictable name mac policy
 opt-out
Thread-Index: AQHaiYMz9L+lb5XHbEKUptuivabAZrFhrToAgAL+uPA=
Date: Fri, 12 Apr 2024 13:47:16 +0000
Message-ID: 
 <AS1PR10MB5697DE4D22B801842C85891FFD042@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240408070450.27686-1-peter.marko@siemens.com>
 <DD50CE1C-F584-49BA-845D-ACA0F3B91450@arm.com>
In-Reply-To: <DD50CE1C-F584-49BA-845D-ACA0F3B91450@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=04d1783f-dceb-4d5f-986a-4d6c91a648a2;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-04-12T13:44:05Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|DU0PR10MB7923:EE_
x-ms-office365-filtering-correlation-id: 34d3d8b6-f282-43b6-e389-08dc5af710bd
x-ld-processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 gaPDkFPXdCIFy/kB1ti++VwjQbfTIzqoJ4h1Bp668c72R5kgCOEzoRGH1LXQMlIMhS+0r3TB8XMmFx8lk/WYKhUD40qtO5XnFk6Ee8WUR7yrNDUjJYjv/BmETgsWY0kNy2GkDDVJiRFOdaz4FrUd8pH3lo31ls+/IVSuEGTISTEgEutJw48NdL3a7bIV/LQceDhtAPQEeq1+OuzTXFJ3ZBfcNPv0mgcruvGainbHUYu1xAxajkwTH6AZqLOupsY5wDs77zJXXzDrsuapwHHmw+Pvoo5D+FWzuOp/Bw8zLm2cfdhNxYePfl+WNEWugBN+ypOfS7IEE2rgzIxIj3h70cNbu4fqpFAvTkw9pyyY94OwHTQ2DR+vn0rsdKuG+4cFD4htCdtJHZw1+dm8BAAFZIL1Bq/ZfEW2rYJxeV1k5DDcrMvF13pNYpp+4Q8rmSt/4HBFZOJXy6q3itm13zrY7pT8G0DSfQ3dxvEJC3cCS3X4h3qNLfIyqBm8CjvrPzx0nT4EnWiCVWzRAfZ6uVNdtXG9NHMAgCDrNjOIim8S/FVbl+2Zdmqi6TRgFAV9zxbaJRHG+GnmP3S6NB95ZD2KN1hmVF1+lH6tDzVmFwBjgIx8GZDTUiHOprCiVM+AhShEd5oaQCxCe48S8bMHpv6RDNcjBYYSWaQDTRIUtSogDvsH89ud2e14cm9XXJQwIuhV4cB34hrYn9aCwmGxI49o0YUlIcQU0N8uE/U+GN2WoJ0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SG5TYTF6N0dtd2NuQ1hLS295NjFoNW1teVdPSTZCNVY4WGFOOTVYS2Y0Nnlx?=
 =?utf-8?B?TjViN2xxWUduTzhSUWNpSUE1UFEzQXl1dHBhY0dHM2VsUVVpay9nY2R2Nis3?=
 =?utf-8?B?YkNXUGVoWmIxaVpHV2xtaGhxNXJnTmNCL0ZVY0ppbnN5d2l4NzB5a09yR0tn?=
 =?utf-8?B?S280TXBiNldjTGdrejFpUEFZWEIvQk95OHhrMWNVMDBiS2VtZUlRcEhRUUMw?=
 =?utf-8?B?TWZkUUJyblpSLzlFWTVvcVBOcVVpaGF2R0kzZnUrdW01L3hnaXR0SlJ2cUdK?=
 =?utf-8?B?MmtpZCt1Y2dYM2ltYlc2NzVOOFAxcmozUjIzdlRzVjh4TW9jQXFtWVEwNWZz?=
 =?utf-8?B?VC9qalVUSG05TG4wZUNuSTU5NHR6ODU4SzNNTUsyazRKUXlLZnMyU05hcDJx?=
 =?utf-8?B?cU00eHN1UXprWlRGWEFER2FUQlpiQ3BNTlRKRkdEMEYxY2hTQWtJb3FpcC84?=
 =?utf-8?B?QVRWYm83aUVQa0N3bFF4MnB2R0UwV0ltRUZxYzkxdkFEL3BrQlhHN2ZldE9N?=
 =?utf-8?B?eCtNaVU1MmZnMFlNWmt4OCt5N0dNa216N3N4OHFnYjVjb2xFOVp1QmNocjA3?=
 =?utf-8?B?UlVhMS9GLzlaeDlZcVk3aUtVQnpQMnRsaUhTNzYvdVBOcFNibDdRcm9FREtO?=
 =?utf-8?B?UmRWRFFzSitIZWVPdm4vVGRuaXFPaHArZElweGFhazJOaGtpWGplVStpZGJV?=
 =?utf-8?B?a3I3N3QzdWQybWJrbERlWUhrakgvTXQvb3V4eGpaVlhZNmlHZmYwQTh4d3Ns?=
 =?utf-8?B?b2hxeDM4clZVWm5tdUE2R29NcjF5bWFuMVU3cGNCRzRlMlNlSThDSkF4QXlt?=
 =?utf-8?B?SEZ0VUFIcFlWMS90OGI4Y1FxYkhDUU1rT2p1amtncWFray9KQTBrYVQ0V1Nu?=
 =?utf-8?B?bGNmekpoZHhicWtody9QMCsyOWRRcTN1VUYyR3ZDamdVNWI0blkwWTZmWGZI?=
 =?utf-8?B?NkxNdHZkZ1Y2cW9ZcmVWK3IrYkVnakJDdnRDTzIzMlBLQndJSW1IZ0tYNjQz?=
 =?utf-8?B?TUVJWE9PL1VTNDEyMTVNQzZjYktubkVBdjQwWmg1NXVXK3dtQjY1cWRvNE1I?=
 =?utf-8?B?MUQyNGFvVmJQR096T3V2aGxEblRJenFhSFdYU0txTk9CTkd3aVFXdUdTa3Ns?=
 =?utf-8?B?ckViblJ5MmhQYW5Yeldpc2xlWS8zREdITERRS1VuTFFtY2crWCtNQmd6bUg4?=
 =?utf-8?B?V1N4VUFlNGt1WkJDUmh4bjlZSks3Z1RqbTNPYnViNENMWCtETmhVSVZTZWU4?=
 =?utf-8?B?eGc0THE1dmhqQjRQczB4K2dVZEs2MkNrbFZoeW1ZcUViVUJnblV1VW1zUmtB?=
 =?utf-8?B?NDJFeXBtY1cxWHRKaFpTNGJqVUpQV0hSRk00WlhBZmlOYTFDRHpiT1R6dTFK?=
 =?utf-8?B?QjJOZnU0YWtpVUl0NGFibVoxd2kzZEtaeHVaVEg1eDExekFXcm9BVENONW9G?=
 =?utf-8?B?OWxLdVZLWjJoVTVWT0NhczgzckhXV3pRci93MDFGcHpXK0lTS0xCNEJ4czY1?=
 =?utf-8?B?TzFKY1dVM2p3aG53ZE5LbjZKVEtjak9sL0prdGtxVlppampoNk9LZFZDa3dF?=
 =?utf-8?B?bWo1WGNqZFoyeVFNb1B2OWpOYUN0VndEY2FUSWJ4QW9LTjc4SWJCL3Y2R3Mw?=
 =?utf-8?B?cThhVVptaHVFaWdvelMzQ21WRjRvNHhsUEhlNzl2ZHBudnFyTFMwYlVrcHRM?=
 =?utf-8?B?RXdBWWFoMkhPOTIxYVcyd1RIejlNNG9FZjJyRW96M1c3dFN3a1JYTU1UQUp0?=
 =?utf-8?B?NSt5bzgwTmg0Y0FkMHEyWTBINmg2RTFCejd1VjJsOHhNaHNKcWZud1I3MXZ2?=
 =?utf-8?B?TSthOHVFNm9LQUJJRDR6Sll6ZHRqNGM5VWY2Z2toU011YnYwbW53VGZGNjNM?=
 =?utf-8?B?amhZRnEvQ3ZzTWt2RkwxRkVSVmpvOHdDS1BFaEV1cFZ0S2VvSy81Y0JSamtO?=
 =?utf-8?B?bnc1SEdRQmFDZGRjNFNRbFk4UzhUN1p3a3U5ZVJNKzZHUE82Y0J3Y203NHZR?=
 =?utf-8?B?MnRla0MxOHAzNEJQejd4N3Z3Tm1QZnIxdDlPRStkSFJ2anV3alpIK1JOZ2Mw?=
 =?utf-8?B?ZWdCTkMvc093dU9IeUFJZ2NnSE9PUE5qY2Eyb1Q5blZUTk5hQVd0NGpxVFlo?=
 =?utf-8?Q?LngSrqtnf+27BdbpsFxlT918A?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 34d3d8b6-f282-43b6-e389-08dc5af710bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2024 13:47:16.3933
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0bvRJ8pF8rWwaafxEvCzGRY913S8a2tk+CzXiRUsGMluHZTL+hL1RPeEpSTDUyfu6T1lggo1Ka5Y+ggeNqzySA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7923
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 13:47:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198168

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFJvc3MgQnVydG9uIDxSb3NzLkJ1cnRv
bkBhcm0uY29tPiANClNlbnQ6IFdlZG5lc2RheSwgQXByaWwgMTAsIDIwMjQgMTg6MDANClRvOiBN
YXJrbywgUGV0ZXIgKEFEViBEIEVVIFNLIEJGUzEpIDxQZXRlci5NYXJrb0BzaWVtZW5zLmNvbT4N
CkNjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBS
ZTogW09FLWNvcmVdW1BBVENIXSBzeXN0ZW1kOiBtYWtlIHByZWRpY3RhYmxlIG5hbWUgbWFjIHBv
bGljeSBvcHQtb3V0DQoNCj4gT24gOCBBcHIgMjAyNCwgYXQgMDg6MDQsIFBldGVyIE1hcmtvIHZp
YSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxwZXRlci5tYXJrbz1zaWVtZW5zLmNvbUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gPiArICAgICAgICAgICAke0BiYi51dGlscy5jb250
YWlucygnUEFDS0FHRUNPTkZJRycsICdwcmVkaWN0YWJsZS1pZi1tYWMnLCAnZmlsZTovLzAwMDEt
TmFtZVBvbGljeS5wYXRjaCcsICcnLCBkKX0gXA0KPg0KPiBUaGVyZeKAmXMgYSBmZXcgb3RoZXIg
cGxhY2VzIHdoaWNoIHVzZSB0aGUgcG5pLW5hbWVzIERJU1RST19GRUFUVVJFICh3aGljaCBwcm9i
YWJseSBuZWVkcyB0byBiZSBkb2N1bWVudGVkKSwgdGhpcyBzaG91bGQgcmVzcGVjdCB0aGF0IEkg
Z3Vlc3MuDQoNClNlbnQgYSB2MiwgbWF5YmUgaXQncyBtb3JlIGFjY2VwdGFibGUgYXMgaXQgdXNl
cyBkaXN0cm8gZmVhdHVyZSBhbmQgZG9lcyBub3QgY29uZGl0aW9uYWxseSBwYXRjaCB0aGUgc291
cmNlcy4NCg0KTm90ZSB0aGF0IEkgaGF2ZSBhZGRlZCB0aGUgcG5pLW5hbWVzIGNvbmRpdGlvbiBv
bmx5IHRvIHRoZSBzeXN0ZW1kIHBhcnQuDQpJZiB0aGlzIGlzIGFjY2VwdGVkLCB0aGUgY29tcG9u
ZW50cyBmcm9tIHRoZSBvdGhlciA0IHBhdGNoZXMgc2hvdWxkIGZvbGxvdyB0aGlzLg0KDQpQZXRl
cg0KDQo+DQo+IFJvc3MNCg0K


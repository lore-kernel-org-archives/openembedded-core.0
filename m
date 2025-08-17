Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE4ECA0EDC
	for <webhook@archiver.kernel.org>; Sun, 17 Aug 2025 19:56:02 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.44])
 by mx.groups.io with SMTP id smtpd.web11.59523.1755460556466859391
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Aug 2025 12:55:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=f34WFuh3;
 spf=pass (domain: axis.com, ip: 52.101.65.44, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yK10kw6Vgo6SKumIPpFWBEZWDs1u+xH0us0Kb9RaPAqSdrjbQVxd52EAbMbzgosdVThZHp8R5VTKMUpEul1p3+MBJdOyjacJsbuqmbXHA5heeV1MfYRJfaXFjGY1zbmxmtEdpBTEmATAw06Z7x6sXDaXCShygdLZ9JHP/Pm5qzdLNKBCxofCWm1hq8AVQfmqU46vjEeOzf8sJ87ZtnIAPGMykqXpFQDHZsBxYllzsHFlrhyScdNnxl0w2dpRDjy7ZM5bME2fssnpIITaraVi4YR+AOHXp1oZV1FPqZKdpiTAxxUamttOlvrekoM/ec1AyCuxlCZqRYPIe5U+gZfQzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xsleqzbfijDNccJy4Ic4vswu1MR+P0vN0RBOJPYcsk=;
 b=iJ35aC2drZV/65QbWnPbEHTUauCgMswzwZi4TpwPlrN3Bakl+xjIRDMyR4kGgC9WaHcmU15sWFcAeOxa06+aobpSJ6kFxh7L0zPlpgBidfuYhU3+563pJ5ctYpJ+VMiU3Mo5g/FB24exdPwBxxByDSdpsk7xhd0yDIB64xt1p/3V3+LWWrGPB8tkxtGQjHLcf71NLHJ0KiRRDdTFXeWrR/cM7AoO3dmU6lHlXVVuSPowE8l4jRM/8OIp58QZp3LXnYnWmwPF/Hzc1bTlRmJwAYSB9UzDgonLtgAMwqfZWJigjdzbswqpefqo9WBZu81uUu8hxok9bGH0wGyKmFyCvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xsleqzbfijDNccJy4Ic4vswu1MR+P0vN0RBOJPYcsk=;
 b=f34WFuh3POQM7QsKuHIWiDZc+H0JmUQ3o7MKRZ8MAMiMHsDmN/duhY+cQF0UPWLwySdBQSOtqBzMIwBaVVHg6V0Eov+/nT6ahsdXEPr6ICphV9qBmqePOjpPrwg7AAt7wJTdIPcd+2am0FmeiS2T4LL6aJm178tWDDvuAvxNHr0=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB9PR02MB8088.eurprd02.prod.outlook.com (2603:10a6:10:303::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.23; Sun, 17 Aug
 2025 19:55:53 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%3]) with mapi id 15.20.9031.021; Sun, 17 Aug 2025
 19:55:53 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] systemd.bbclass: Make systemd_postinst run as
 intended
Thread-Topic: [OE-core] [PATCH] systemd.bbclass: Make systemd_postinst run as
 intended
Thread-Index: AQHcDDBDfkt9donyd0avnn3wSV9YTLRnSIZg
Date: Sun, 17 Aug 2025 19:55:53 +0000
Message-ID: 
 <DB5PR02MB1021388CCD1DDAE773DDBF094EF36A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250812211424.76559-1-pkj@axis.com>
 <CANNYZj-k_aGqkW6VOpT8R_CJQzPmRR0y4aer=1brezTebrhkTw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-k_aGqkW6VOpT8R_CJQzPmRR0y4aer=1brezTebrhkTw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB9PR02MB8088:EE_
x-ms-office365-filtering-correlation-id: 0cea931f-8808-4b3c-52da-08ddddc8128f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?UnR6QlFLcklqajJPRW5XM3pYMFlnNHI3R1JTZTlpdXlra25UUEVPRFNxRW4y?=
 =?utf-8?B?M0VYbUtJczNhUlZ4aS96Sm15UGpXR3E5SEJYVUFkMXpvZ0pyaFc3cWdnbmhy?=
 =?utf-8?B?TVNPaFI1SWVMbzJIaUFrYUZYTWdQVWtHWGIxUWZ6Z2pEdHgwY3R0eUNhcGVt?=
 =?utf-8?B?cE5JR2NUaTRYeHlwZTRGOXRGSXlWb3BkU0RVVWlHazlOb2s1M3pZcFZld210?=
 =?utf-8?B?SW1wYzF3L2VKODNRQlVOZU9BOVdNMnlnZ1FDUFN2L2VIc05TK1Z2Ri9UbXhG?=
 =?utf-8?B?MjdCdFIzR0VNSzFwWCt0TnptcUpHZzR6NGhSdFd3bmFMK1hnWWVwZzBZekpn?=
 =?utf-8?B?TmZqVVRUdGJtNVhJVzMzYWFFQ3poNURUZUFCSmwzOUVsZ05wZWtXNmZrRzli?=
 =?utf-8?B?WEE2MTJxYnFvejlUcVd0UTdtNVhvK2pBbGMvWlRhRzZXVi90OVVqRkNYcDNn?=
 =?utf-8?B?OURvRWE5RTRQMWszNkhneHQwajhUL05CMHlyRWtZMFN6NTNNRGlRendDZks1?=
 =?utf-8?B?NWFlWHlzYmxvSS9MQzJlYzF5NDMvNUh5bEMwSktFU0V4TktoQmN3eDZvanlT?=
 =?utf-8?B?NE9Id3ZKT3VGZzBHaElvaHdiTG1qVHFNSzhkcnZEQjdEaEc1SjI0ZjdIc1ZD?=
 =?utf-8?B?TURoMnBUcDY0SStuRVliU1pTYUlKU2grWTI0UnozRDhDbCtjaG0zZkhiTEt3?=
 =?utf-8?B?VnRxZUFYbUgyaGNKdThSMUNEYk01VUE4a0JIQmJ3K2pEa2VFTjFyNGJwL28y?=
 =?utf-8?B?Q0VpUWMxWUlLeStlMkpvZXJQRzF6anpLVFpwQTFCWnBoR1gzWnBMWmlVcEdy?=
 =?utf-8?B?cjJ2V0ljNS9YeCs4Z1NqVy9RdlY4RUg3TUtGSWpsMzErS1ZRVEYxYXg2d0JI?=
 =?utf-8?B?UW5yYTZaWVA1WUs2VlB1R1dLNWo2UDNWYXRTbEhhb2c1dTBDTWsraFBkWktk?=
 =?utf-8?B?Vys1V1hheW5JU09pRVpxZ2RjZlN4SnZ2a1l0V2JEejc2cU5UK09HdTdKeGQy?=
 =?utf-8?B?NFBHRmx2MzQzUFhtcUluQjAray9BbXYwWHJFOG1YcXNucjRPZ05Zc2FyNzF4?=
 =?utf-8?B?OW9EazRobUlrbkwvYzY4OWpzeERmRTVFVklnRzBnaTJsNUpOekpKbmZ0UW80?=
 =?utf-8?B?c1ZITTFTYmlnM3ZvWWxRYThMdzlySnpJOWtrdzdNcER1VXJRdVZKL2RrUDJI?=
 =?utf-8?B?NGlrYVkvdHRYOXVlUzhFcGJJQ3cwOEhmNVlJMnpIMzJKbFRtN0cwYmdBbDBw?=
 =?utf-8?B?WTQ1cXRRQ1ErdWZUSTZrTVVvOVlrT1RKdmJMZjJmUXhIS0tBVEZBc3dyVDkw?=
 =?utf-8?B?SE9SaXFMbnA5NytrYnVmQ3RVbEdJR1QxcHpyQlpjMFhIYTA3SWZuY0pWdnJh?=
 =?utf-8?B?TS83SXlrOGUySlJvRHgxTklZK1I4allZLzQ2a09rUGxsb2hvZVZUMWdOOTFM?=
 =?utf-8?B?bVhsQTFmemhEUnhaK1QxTFpGTmZ2NUxiczRnazBVbjRNaG9HZURrbitNdW5Q?=
 =?utf-8?B?czBncGlyMWRhSTBhMnMyVmFDNUJqc0doMjJManlCSDZqbzVHd25kVmZXc2Ry?=
 =?utf-8?B?WHhSenlnaCtRdTdNb1FMZS9BYUZpSmY5eTkyZktDTng2TzRxa3FReW1GN3NI?=
 =?utf-8?B?cnBBWGxlV3lINk9WaWFDenQrVFdQY2gyTTQ3QU04ZFNxSnI1USt6c3RBRXBk?=
 =?utf-8?B?UDZrbTczWFVXZ25KZ2tSVkFjbjlBdm5HMXEzVm1adXB4bFk4aDZaZnpkTVpn?=
 =?utf-8?B?ejdZL2x2d3BMTTlLMGJEUUVZbmRQM3dDc3lpZ3c4T3lmNUxBMjJva0xqOUww?=
 =?utf-8?B?QWVRbEUvZUllc29CY21EbC9UaDhWbWJZQjhkMytnR3BaaTRGMWcrVkU5VnpI?=
 =?utf-8?B?c1k4dUJ3ZERycWNFNXVSRFg3bzMyWjJac0FiODFKQW1TTUswOFQ1T2Y5Y2F0?=
 =?utf-8?B?Wi9sUjFVSU9STitISU5zOXo5cTJaZk5idlNHRGFyU2hJb2NWZGh5K0k2L0I0?=
 =?utf-8?B?WkNEVndvUHV3PT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?T015Z281bDFiQVJsR2ZsbVhVekltZTBwaFNJaHlZWkp0ZGZrazFjNnFSLzVI?=
 =?utf-8?B?WmVLN253TGtmOExuSWtMUWxiTTZkaFdHQ0NXYW1DT2t4V3R3Y09UcWQyRGZo?=
 =?utf-8?B?WFIxbTFzbWRLaCtIVUhrUGh1TGR5Sy9BN2xYN3Y1TVVVY1lkVTFRTklvemFi?=
 =?utf-8?B?clFwcHZRMHJMaVYvaHFoQm9obmN1VEtwL0FjM3YvQ042cW83VVptZnNSeE9q?=
 =?utf-8?B?b0FGV2docmhOWGZGb0RmNVM2eHdJeG9xOWNpQ3U2RmtmNkgrR3Q2blcrdGJD?=
 =?utf-8?B?U0dBSS9CcmZRQVEvZUJ0ZC8rdUFFMUZJQ3ZSMmZCdEpSNTExNnE5SUxlZ2Nx?=
 =?utf-8?B?N291UDVYMmN4K1FKVlQ4bU5qeUd2SUhiNVdic2J0cFBBeDNMMnNrWnM0OXND?=
 =?utf-8?B?ZGJmbHRNRk5IUjVBVE15SlhuUWxHNzZpQjRnSGhHa0h5RVFUdGtqcFpOSkJu?=
 =?utf-8?B?czNubXIyWmRYclBEVi9sazVnQVh0ODgxRjMva3JxSHJsVDM5ZGFHaVVLUmxU?=
 =?utf-8?B?RC9XQUMyV2tGMzhiOXVNYTBDZ1haTGVtem8rM2dIUVJ4bmx4a3U2SjA0Q3hL?=
 =?utf-8?B?azRxeUVFQjZMTS9GT2VQVHBhRVRFaEM3RGg1TmlpY3NHc1dsc1pOb1FnWnNS?=
 =?utf-8?B?NmNMZHZTTHNmR1lwelFEUlM2U0o3WUQ3T1pHam9zblZTU3JYY0ZuSGQ5SzQ0?=
 =?utf-8?B?SW0yYXVoeU8zd0wxem9Zd25VbFBscEE2VjJWcUhUTUViWGNudkxBSDNCdkll?=
 =?utf-8?B?TUsxZmpsVVZnSEN4QnM5MUVLN0ttZlY5R2VveFI0WTJENHJQOTVYRFEvUGJx?=
 =?utf-8?B?LzVmc1lBek1xb3IxdDdXRGNtaUlwby9CNk10cGJyNXQvM1ZzMTNwQTQ2ZFVS?=
 =?utf-8?B?amJZS1ljNFZXeVMxcllYQ1grTlhuaXRpcnZkejFkZFhTcDNZcEJFTmZGekJ6?=
 =?utf-8?B?T2FwZnlYNWx4RGllNklvZndLclV6cEFaUjY5M1lZY0hxUWhHdnZJV2gzL3Y1?=
 =?utf-8?B?ODd1enBYYzZJV2c4RVFMYjJWMnMydmU1SytuTXpDK2g4bmMzQXU2ZERtdmt1?=
 =?utf-8?B?aWtLRnpUTGxJZE1COWZJRjdtaURpK2l1RTVmblhhb1JZY2RRRHNra0p2Ti8v?=
 =?utf-8?B?QnB1VzZkd3FoR1d4cmc4MDM0NHhtSWxQcERpNWZ6cnJMdFVVUTI5c25jVWVX?=
 =?utf-8?B?Nk1IZ2wxaWhLaTdoU2NNRWZyWGVuZytucVRFYklWejdXM1ZCVEZDOTlFQXBB?=
 =?utf-8?B?RmZBSjZXb282a1FCaFV1Szc4QzUva3owaGJEZ2ZPUU5wdW8yckJjQTBNdW5J?=
 =?utf-8?B?NW9lRmdtdk41eWIzb011Ukh4Nkc2Qy90Z0o1RnBNU0UvTVMrSzgxSnB2VWpR?=
 =?utf-8?B?ZVhqa015Uk41SXBCNFdMeit4QkJETHBNbEJKMCtiOVhlS2FhYi9uZ0xqc24v?=
 =?utf-8?B?TkhLeE9sd1B4Sjl0bWgrVUkvcUd6QjkyY242STlmODBtMmo4RHQ4ME40SnRn?=
 =?utf-8?B?dllxNDJ4b1hEMkRYUVF2Tk5hOHByT243WTQ2dFE5dHl1ODI4L0JyekljVGoy?=
 =?utf-8?B?ZkJ1YWI4Y2cvYm1ja0l3Z0RLZmxrakdXb29oMWgvTHdLemFIeXk4RzNUWCtG?=
 =?utf-8?B?aml2R3Z6TkNYc21NM0pGaU8yVlJLdDE1azVaQTB5RG9qRjRXT2xwdS9TR3ZP?=
 =?utf-8?B?WGc1dWJhOHRWMVRZNVZuSDMwSXdxV25QbVF6RytWUmFnL0dXWFkrb0pQTVgr?=
 =?utf-8?B?R2Q1Qys0STEwajlLL3RDcUk2N2JVcXlxRnRBMFRjOFBxb1AvSXd4bGV6aEIz?=
 =?utf-8?B?K1JoUlFxM3VmQTNUdWsxUWJMVGRxSlFMeEJhcFEzZzFBWnoxUzZUUS9nelZq?=
 =?utf-8?B?K3hvZ0s0R0hmOGZMSlBmeHY4dnNxc3dSUFZ2MzhTb0NZdTFiRlNncjRkd2t0?=
 =?utf-8?B?am1oMlVQK1QydmRjTkFwME82ckNOQXBNNzk0ZEUrZDdtN0RSdXYrK3RPcy9I?=
 =?utf-8?B?MEtIUy9RakFLaVNGNTdYWHFoZk9UYTlmd25Xdk1hUk55d3VjbmVmdTBTU3pa?=
 =?utf-8?B?eXJUdE92MXN2M094VW9lRDF2dUdEVDQ5YWNvQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cea931f-8808-4b3c-52da-08ddddc8128f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2025 19:55:53.0673
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JM6m0n8CwyDT2v54kMy/BR/eZnQgZFsNwZSw6mCoMChPgjwtJpCCMdAg5SjVb6Vz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB8088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 19:56:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222010

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleC5rYW5hdmluQGdtYWlsLmNvbT4NCj4gU2VudDogZGVuIDEzIGF1Z3VzdGkgMjAyNSAxMDo1
Nw0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+
DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1Ympl
Y3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBzeXN0ZW1kLmJiY2xhc3M6IE1ha2Ugc3lzdGVtZF9w
b3N0aW5zdCBydW4NCj4gYXMgaW50ZW5kZWQNCj4gDQo+IE9uIFR1ZSwgMTIgQXVnIDIwMjUgYXQg
MjM6MTQsIFBldGVyIEtqZWxsZXJzdGVkdCB2aWENCj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
PiA8cGV0ZXIua2plbGxlcnN0ZWR0PWF4aXMuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdy
b3RlOg0KPiA+IC0gICAgICAgaWYgWyAteiAiJEQiIF07IHRoZW4NCj4gPiArICAgICAgIGlmIFsg
LXogIiREIiBdICYmIHN5c3RlbWN0bCA+L2Rldi9udWxsIDI+L2Rldi9udWxsOyB0aGVuDQo+IA0K
PiBldGMuDQo+IA0KPiBVZ2guIElzIGl0IHBvc3NpYmxlIHRvICpub3QqIGRvIHRoaXMgPmRldi9u
dWxsIDI+ZGV2L251bGwgdGhpbmc/DQo+IERpc2NhcmRpbmcgb3V0cHV0LCBhbmQgZXNwZWNpYWxs
eSBkaXNjYXJkaW5nIHN0ZGVyciBoYXMgYmVlbiBzaG93bg0KPiB0aW1lIGFuZCBhZ2FpbiB0byBj
YXVzZSBoZWFkYWNoZXMgd2hlbiB0aGluZ3MgZ28gd3JvbmcgKGFuZCB0aGV5IGRvKS4NCj4gDQo+
IEFsZXgNCg0KV2hpbGUgSSB1bmRlcnN0YW5kIHlvdXIgY29uY2VybiwgdGhlIGFib3ZlIGNoYW5n
ZSBqdXN0IGNvcGllZCB0aGUgDQpvcmlnaW5hbCBjb2RlLiBTaW5jZSB0aGlzIGlzIHBhcnQgb2Yg
YW4gaWYtc3RhdGVtZW50LCB3aGVyZSBpdCBpcyANCmV4cGVjdGVkIHRoYXQgdGhlIHN5c3RlbWN0
bCBjb21tYW5kIHdpbGwgZmFpbCB1bmRlciBzb21lIGNvbmRpdGlvbnMsIA0KYWxsb3dpbmcgc3Rk
ZXJyIHRvIGJlIG91dHB1dCB0byB0aGUgbG9ncyB3b3VsZCBwcm9iYWJseSBiZSBjb25mdXNpbmcu
DQoNCi8vUGV0ZXINCg0K


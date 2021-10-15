Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC3CC433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 10:39:53 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.81])
 by mx.groups.io with SMTP id smtpd.web09.7701.1634294391858139037
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Oct 2021 03:39:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com
 header.s=selector1-siemens-onmicrosoft-com header.b=o99UtGea;
 spf=pass (domain: siemens.com, ip: 40.107.21.81,
 mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJE1AsSmlcsw7fXMR7ndD4v3FAEJg7wIPOqXiFV5Nw4bge5x9WuSzxMkqwk4yOi16+Ys0jyK2b8TpiCDWlY9TNpYPa2Ts1jsiqbFAes587opDiulC6ALvCrzlIri11uglTE2zmFMjozUh2ghBvPAYvwtBNfjkv6QVqkVjFr9wayyFifLYB4LpN7ZdCiy/2ty5aS9WUTVUuc/eg2HhKOlQoPQ2tRvCilglrWZfmV56RKZAMalWmJEYATzDq1hAKJ1Gx5lZF+pk8it7ZsPP0NPBbQumIQz8TNRZE0B5gR9Lj8vZeeImCstrpnoH+X/HR8NfzJkRdCUk51//WNLqBY+mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vkSv69h6uM9f5M/CPVBFLa1W0+WT27hmlfwykklcock=;
 b=OHKHsuyT4mzhw9xTl0lxaL0lty3iHhqylm8WyO6Gk1tb+YiYxwh081ncaXLaPUHl9zhkGG2f7k3xvnreNbQA/0twtkq11OPDn220y8Wwjs0yBaI6GrW7Km4ZfOChtm+c5RrSoqhSz3BSqolW0TgONzV3dL49ayrEMyDLXWtpm++nRimI2/YpdqbciH1UNNg/1DgRpHSwggDrbX53v6xxXnk1CzjztWXMpVMfJr0s3lLj+XZRU6dL4TooxEM2r30gNv8o97EusANkeJYyDIUK+udtxbMW6Vl4uYNd6HckuurMltygouf2obFqhXwC4w8iLW3OhLwmXG8YpJOP3M0CyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vkSv69h6uM9f5M/CPVBFLa1W0+WT27hmlfwykklcock=;
 b=o99UtGeauaL8Wzd4WmPe1poyhGowIURV1lqDYNeWxJkQi4AGHAXBXwRkXX0MYXXs+9Hg5N/7hfRVG3arBtZezMIPCwN2hf900izo67qUz/TmOKE4rv49gPOlZxH0Oi+Yi7tPCanprKd0hBelOR6w2NAWYX98H7wLAXirsJk+snw=
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DB6PR1001MB1094.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:61::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 10:39:48 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2458:1777:3472:6774]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2458:1777:3472:6774%4]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 10:39:48 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"steve@sakoman.com" <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
Subject: Re: [OE-core] libpsl: Add config knobs for runtime/builtin conversion
 choices
Thread-Topic: [OE-core] libpsl: Add config knobs for runtime/builtin
 conversion choices
Thread-Index: AQHXwGZ5SD/9Otc2fEmK+5WS2+7uFKvSwxoAgADUP4CAAD4hgIAAC6wA
Date: Fri, 15 Oct 2021 10:39:48 +0000
Message-ID: <4f983fee5101acf1a55c150a4a4ed1992b7199a4.camel@siemens.com>
References: <0c5732d80a8f5810e9a26c3b1e634422cf750fbf.camel@siemens.com>
	 <CAOSpxdaGuK2RqNGz2VJg04AhnDhVRAMYvOLS497d-OTYUoXc-Q@mail.gmail.com>
	 <56ce3d16404402d0b6661fb067c587618a57661f.camel@siemens.com>
	 <d1015886629914a9b2ca8dba71326ecf7b355bda.camel@linuxfoundation.org>
In-Reply-To: 
 <d1015886629914a9b2ca8dba71326ecf7b355bda.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-2.fc34) 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc96f868-b9ff-4df4-1216-08d98fc81cd9
x-ms-traffictypediagnostic: DB6PR1001MB1094:
x-microsoft-antispam-prvs: 
 <DB6PR1001MB109495BB38578C5BBCEB10DD92B99@DB6PR1001MB1094.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 eSypQR8PU/YJY250myNrTN4IaFDHacHDmwUFGfHf1kYylakQrggDlf/aPl+Hu4iGCiMgLFB3fTZuqFxxN9bSklaIthM4hfAmEIIrsMTUBcA2bGKOI5xtmLByOX+2WsRv+cJowrdjZEu/EWbA+/N+dSQEHBWWuZfBxicqY1Ew/neRz2R1v4PdBv1UGmzOM+3hx/yTtebZ0fJr46kcFgyzWXYV8kl5zHXFpDdf9MX6DxYwreCmll6X9angumtcoaVrB1rTtfGH1QXuESqcdtjjg+6FYJr/g1Yaes6BcC3LX+ZZ65LZLg4P9j8BDsyymQulOQ+I6GS4mmFho9QLQwnagUpqWkD5gJ3BtStXa5XyZ2aM++UDpfQlfyRjjp47CS0LEBLufCmVcAtPG77L5B3KPs07ktNA0CD1V6bTjOpg3JDYR+L+CP5mLqmERsnsul9JhBR2Zmp8kzytLGE8dU+OiiZdWddJVSwEV+Sh0PoJg6ui7+LkoUXlu+Cq3CEcq7GolMOdumU/7GsvwLoIb6V/ttwHvmA0EELUnPUqlwLCG/aL3gXgrLwEINoFV5R5xIPZxLLPYdOTTt4zl1jY+ps8T1gNGr5qtETJ0CLg6MwOHYOofWpnoMvkzI1rGx/vpXLrzPHUrECrGSD/aGhyFpuFs+2/olQ9rxZFThRVmPF3R5Wz828Zj3yhg1SqFmSp6PfBNLggX6Gh5P6GsiSCNdp0ZQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(54906003)(122000001)(86362001)(110136005)(76116006)(2616005)(316002)(4001150100001)(71200400001)(38100700002)(6512007)(2906002)(91956017)(5660300002)(26005)(4326008)(4744005)(508600001)(6486002)(36756003)(82960400001)(186003)(6506007)(8676002)(66446008)(64756008)(66556008)(66476007)(38070700005)(66946007)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?anhicXQ4Szgwamw0MWc4dncxQzZKbTduVEZ6aFh0VlB2dk1ZNzdOS1NYcmtu?=
 =?utf-8?B?cW8yYU5KZjdia3lrZkM1MFA2VVY2ZFIwb2g4bjZReHl4RTdPeGV6UUVjekFw?=
 =?utf-8?B?MDNuc0lnTUJEcTQrVXhKNnR5czBkbktDK3NEZlNVcWY2ck9rN1ppUThCYmpX?=
 =?utf-8?B?K2lZQnBoQzl3VTJXSEF2c0R6M1ozbGJCZDhEK3JIekdmS1laK3kxWGhiU1Rj?=
 =?utf-8?B?U1Z6cytPQ1VNMStXSXNLYzYwSFdHQjFnaWxXSzRrSkxNNVVScnlTL1E3ZGp0?=
 =?utf-8?B?ZVRrZEM2TWNScmxPZDhJOCtHWVBmR1pNT0EvVFNuYUlxcDhSenJybFBhaDhV?=
 =?utf-8?B?WDlxS3EraVExRnpyZ0JOYnZ2WDc3Vk1mMU55M29HRExVTEdOWXlxejR4Nndq?=
 =?utf-8?B?RmJ4K3NabkhLbDRlWGprZnEwZlRGaFR2clh6SnpOdVJpVUFKWDYzaTZvd1Jx?=
 =?utf-8?B?bEhoUFYwTXVRb0pMSDBzWmxnV1plcldaSmFCZEhRMWdGSHVvNDAyaHFDSU9k?=
 =?utf-8?B?RTFIQWZhRmR6QW05dllwL0VtWHpyTDJqVzhRcjRZQ1BIU1N0OTdCRm1Jelpm?=
 =?utf-8?B?TFdwU2VSdmZIZU53MkN2V21SdllVMktzN01DaGdzSzBMWTc3SjR0WlZZUklY?=
 =?utf-8?B?RXI5UFpRK1FZTEZUNkNWeXFHdFNYOGlId3pXWmUvdmpHUHVqSU1aanEzcGs4?=
 =?utf-8?B?WUFMNlVudFRDR1NOMkk5K0d0TWVOQnNqTzg4R1QxRkZLOE92RjZkSjBycHA3?=
 =?utf-8?B?cWowVmR2S0luRHBLZEZoQnFWS2V2dFVUMmV0VEJxZFV4RmFiZzN5TUh2eEYz?=
 =?utf-8?B?eHVidTRvR1VqaWEwajV5SE5vUUY4TDhLVTVKMHQ0bjRHRENDdlhySDdac25K?=
 =?utf-8?B?c0tUR1haWGJyMzc2UE1BbkJzNmNCZDRpZVVRWU44aUM2ZE1nVElkd0E2WERF?=
 =?utf-8?B?NHQyN25jV2xQMUJuWHFWRVNMakNUTjI2c0dmS29uNW5IbnhNdWMxMjlIR3lM?=
 =?utf-8?B?dHEwVkhlVmllR284NHJkcnEzS0FRamNjZFZ4MWNENlhHUU1kZGJhWEEwS1hD?=
 =?utf-8?B?eW84MGtjTmFMR2MwVk9iT2pxWTcxWmFtQ3hLTmF4VFdtckVWRzFWQ0oxWDlY?=
 =?utf-8?B?cWU2Rk1TWE02WFNGNFhwQmhFcXdtWGg3ekJrQ1BxY2RtY1pmSGUzNXNWQ01m?=
 =?utf-8?B?Qzkya25EMU1sbDM4eUhjUXRuci9KSm50a3l3NGxiQWFqSk9sdC80YWx6UnMz?=
 =?utf-8?B?N3Jjby9MbjJZZFBQNWNTVVpCa21xZTRSVWNFSTRrYkF4NHJKQ2tCS2RkMnNE?=
 =?utf-8?B?VHdVd2Q0ODMxMW1lYXljazJodkNxemRFK1djRVFHV1ZjWS80cG5PVEloUlZw?=
 =?utf-8?B?eVBadTZIbXRHcEtUZFgyb202Y09LdTFPUnZ2QUlIUlNaSWEvSnZMUmRSZXBw?=
 =?utf-8?B?WnlZc1A3RUQ0RWxMN1ozbENMYndQMkdZVSt1M2ZtVXVteGM4d0p3eldnalEx?=
 =?utf-8?B?U2l0bUFEN3ZXUjNrdm9Eck55YjE2VVgxbEt6Y3NjTUF2ckkvMHFMWkhJclBX?=
 =?utf-8?B?aDVFZnBUeFlyTSs3eDRpZHFIblh1MEQ2eVdyMkpZZnZtK2IyQjZjV1JXZkJB?=
 =?utf-8?B?RHQyVGc5VUhiSklLTkxNOTlsT1dYSEdmakE5QldSMVQ5NmdDa2djSEFBbU1M?=
 =?utf-8?B?ZVNzTlJpNDRGcjNwdkkvSHlSaUkvL0tPOFM2cmhiTXFaY3JlM2dWSWpDTm41?=
 =?utf-8?Q?Pdob5TRu1WBBY5LOJ3vUbs2N92AR/Oeqtr/wKks?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <B33A5A46F001F843B9B7F8BC215F3F6D@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dc96f868-b9ff-4df4-1216-08d98fc81cd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2021 10:39:48.9168
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 BiZ3dXtEYiyXgjUqDUf/3f8lsFq9osZzWUQW6uXdU8/M4A1q/OdoNrRwaDufk0zSRE1a0r0PjjaJxAdg27ph73tvN71J2HIXMTyViGe2myg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR1001MB1094
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Oct 2021 10:39:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156989

T2ssIGJ1dCBJJ3ZlIGp1c3QgY29waWVkIHRoZSBleGlzdGluZyBjb21taXQgZnJvbSBtYXN0ZXIu
IFNvIEkgaGF2ZSB0bw0Kc2VuZCBhIGRpZmZlcmVudCBjb25maWd1cmF0aW9uIGZvciBkdW5mZWxs
Pw0KDQpBbmRyZWoNCg0KT24gRnJpLCAyMDIxLTEwLTE1IGF0IDEwOjU4ICswMTAwLCBSaWNoYXJk
IFB1cmRpZSB3cm90ZToNCj4gT24gRnJpLCAyMDIxLTEwLTE1IGF0IDA2OjE1ICswMDAwLCBBbmRy
ZWogVmFsZWsgd3JvdGU6DQo+ID4gVGhlIHJlYXNvbiwgd2h5IEkgd2FudCB0byBhcHBseSBpdCBo
ZXJlLCB0byBzd2l0Y2ggcmVwbGFjZSBsaWJpZG4yDQo+ID4gd2l0aA0KPiA+IGljdS4gQWNjb3Jk
aW5nIHRvIGxpYnBzbCBkb2N1bWVudGF0aW9uLCB5b3UgY2FuIGNob3NlIHdobyB3aWxsDQo+ID4g
Z2VuZXJhdGUNCj4gPiB0aGUgUFNMIGRhdGFiYXNlIChsaWJpZG4sIGxpYmlkbjIsIGljdSkuIFNv
IEkgZG9uJ3Qgd2FudCB0byBpbnN0YWxsDQo+ID4gYQ0KPiA+IG5ldyBjb21wb25lbnQgaWYgdGhl
cmUgaXMgYSB2YWxpZCByZXBsYWNlbWVudCB3aGljaCBpcyBhbHJlYWR5DQo+ID4gaW5zdGFsbGVk
Lg0KPiANCj4gSSB0aGluayB3aGF0IFN0ZXZlIGlzIHN1Z2dlc3RpbmcgaXMgYSB0d2Vha2VkIHZl
cnNpb24gd2hpY2ggZG9lc24ndA0KPiBjaGFuZ2UgdGhlDQo+IGN1cnJlbnQgc2l0dWF0aW9uLCBq
dXN0IGFkZHMgdGhlIFBBQ0tBR0VDT05GSUcgb3B0aW9ucyBidXQgZG9lc24ndA0KPiBjaGFuZ2Ug
dGhlDQo+IGN1cnJlbnQgZGVmYXVsdC4NCj4gDQo+IFlvdSBjb3VsZCB0aGVuIGNoYW5nZSB0aGUg
Y29uZmlndXJhdGlvbiBpbiB5b3VyIGRpc3Ryby4NCj4gDQo+IENoZWVycywNCj4gDQo+IFJpY2hh
cmQNCj4gDQoNCg==


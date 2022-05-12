Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96185C433F5
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 05:46:50 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.78])
 by mx.groups.io with SMTP id smtpd.web08.939.1652334398793506402
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 22:46:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=QM/A4C3V;
 spf=pass (domain: siemens.com, ip: 40.107.22.78,
 mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KY8ftfKKpeY8UDE2coCkOFaB2FPeyWSLLfTXcOJUIq7P5xqsJg3hQYyzUA16gPOJLvApzbkJrYBREEWNVjO5rP21r3Lt7iaanddNuMfjK/qBsdiz0LKZHwOHwtR9UHFqexxriDznOMdVU5NriTOGxBjs6pxuHlK8zFIpyT69SKhyL6ZK7RE4cD1AOoHdBSKxyyybPAsaEdw43iM3OmyN9BftzDKW1vHYBj4V6KoE8xRsoR/gHJrqpx2tdynSJ4DufsVg/rW5f4pYLKqTgs6zt03kNrXumfn+WpzlZBf3mIa8nptzUNI7yawxdHNfrEvNrB2B2nx8sOQi70TMTWSuuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lt+2PpumzRf+MO+049tUNQ3tlklNUWiy6WN8bYuR8dk=;
 b=XL7NUIjANSxYtQ2lXJYB9Mc/8YzioY9iZ0tw0ZTjMT1NVBrksjaWHzIkACFmYq4anwEmiBLhcfGcKEYu5GkiWOlSgncuLiwJK6CABalRIC7BEmJLXJOL1pB7Bj3DgnDoJdtaIA1ukpCZKj51zMevVtRIKTbPlvf0eBTrAcKuY68/PRfdSOOGb6I1VfwY4pCgqBxaqqThmcOMJSQJDbHbNWCLDnzMB1XtNt+5BPjq4wmkVlMqfOLSjcDifGbIhfZ7nvVEpDHbw21wGfpN49G65F6iHvTFn3jXArkx6xawjpQxSSZF+G+g/uO4H7HaDMBQLcWpb+yTZ3pq/kI1HuPJaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lt+2PpumzRf+MO+049tUNQ3tlklNUWiy6WN8bYuR8dk=;
 b=QM/A4C3VffF8tFqX/+skouLUiL/BqByOP9Q5mTUTRt7hIigsGVkFtVKMouW1vxqxjU8blzAR9Mf87yPJJrBBf0/Uof6qC496KDSAv3JVdCOZzieRQ9cL2TvkxHKXHj/pwsEOym4RN1s30wAJ0t1BUvi5CoTXyn3VnspnXETS15RVQgB1RnqSd+dVC1nyfVGkESvXeUISTSY4bnGx46YQqJxY4pZAMlFKlUo4SgvKGiOkCBWrlJ2GJoNaGmERFmnkykYG+LF7DYa9Z8gN5dz1ikXhmMC+BlAE4wlM9UgMo/Qz8LMZnoH0Z53bWFHUTnXh/s+0oEreWLv8Hn8b8rtMog==
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by VI1PR10MB2189.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:80::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Thu, 12 May
 2022 05:46:35 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b8a3:9026:5e8a:795e]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b8a3:9026:5e8a:795e%9]) with mapi id 15.20.5250.014; Thu, 12 May 2022
 05:46:35 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "michael.opdenacker@bootlin.com"
	<michael.opdenacker@bootlin.com>, "saul.wold@windriver.com"
	<saul.wold@windriver.com>
Subject: Re: [OE-core][PATCH] kernel: add missing path to search for debug
 files
Thread-Topic: [OE-core][PATCH] kernel: add missing path to search for debug
 files
Thread-Index: AQHYZcOjMbSu3cRT3kyq2iUrLp2vLQ==
Date: Thu, 12 May 2022 05:46:35 +0000
Message-ID: <f247450e6f6442a3561f8c1eb6127b782d318071.camel@siemens.com>
References: <20220119115759.1390792-1-andrej.valek@siemens.com>
	 <59f559e8a8f7a1ec6fccb9de63002c781cbe7acf.camel@linuxfoundation.org>
	 <9d5cf8f9-e2db-0d25-4e6f-cab32111b0ee@bootlin.com>
	 <16CD270F9BE96264.31480@lists.openembedded.org>
In-Reply-To: <16CD270F9BE96264.31480@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-5.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: efbc5777-3d9f-4403-3807-08da33dac69e
x-ms-traffictypediagnostic: VI1PR10MB2189:EE_
x-microsoft-antispam-prvs: 
 <VI1PR10MB2189D10F9FEA68353E22092892CB9@VI1PR10MB2189.EURPRD10.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 TrkA6xJuFrsS6dB8jPs8SV7TOU2DNCsIpSRNKJ+QOwRtApuacv0Yb3/3sxKNxZWHGgfFcuCv+fTD8j3Y33rutLw4fLiCQSydY6PXbncYPMRS6DG778R1+muOI2ofs6D56tx4F00IH0RisHehMK2ZLZpgAScuu+XOQCP91wMISHNjsoGMQ0TOjsD4I6J6PfypIBYs1CQUXssYawHO7newU0K4wijOnsEkiqDqgPPMxZjdY0N/zfRReWOeZ1/oHM3H9VM11jbXXyy+XWIjm5BFIIM7j0WYemtoV/SHMaAYSf9wMgEHOiLz1wFkQOO30WhbOLnnpimh7cxVIxILo1MLLoBGx/s1uOqtyzOcgvjbpJYmXtjGTyetKwCbKI8hktg7FM4/5b99JdUBkgikp5LMkxYPufGPcHzgphlIHe7BnQL6AgDA0R5pCjyisRR1GxWjbzpPw8fIjl+WDgxMsPadkfRSdK9WNOfmtme3/FJRWnrSApKnrecE6357DIFseBxJ7vuxlD1kKoMAjPLfKVhEkFh6k0CKji6QwBSbYanIyC2IxSHB4DX1OXlsoKoU6tL+WbWGODBOxbS/I6mLXh3ssskc0WQki3JMRliHAEV+MzzhSqgpIsUR2GJf4QKQ+js6e5zLLm6B2Fj1PW/7G492uucGoxc7cEC9NpOC1UADXuB91y1jO9j3ids7mn4mgkEeQElgySc/KVU6ARsl5P7FHEPtHpILx8mf9dKqUgLWe/LRRzGeKCoUHfB5gfAEWKi/sF4rvAmy3kMty6N9zrY2aPkTx/U8dvay2vsWpia4YAGbZt1Cqb/RkbjorLNsoS+VqpVnWRliIC0IO9VLD92paA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(4326008)(71200400001)(86362001)(6512007)(2616005)(82960400001)(26005)(6506007)(53546011)(2906002)(122000001)(966005)(6486002)(83380400001)(8936002)(38100700002)(508600001)(38070700005)(6916009)(316002)(186003)(36756003)(91956017)(66946007)(54906003)(66556008)(66446008)(76116006)(66476007)(64756008)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VEFKVFZJekcyU01xRFhEdFJDKzBrNlFzZCt3MTBKQVVYcXNrVEhUeStlUDEw?=
 =?utf-8?B?bktORjU0OTBjR0ZESTNWN3ZrbTRVS2lUeDFTRll5RXpSNjNDVW5rL2tmWWRR?=
 =?utf-8?B?aGordHd5VTRBTnd3Tm1jbFdsQ3Y3dnU5M1dzVHlZZnlsOHhpNFZHenVQWXlk?=
 =?utf-8?B?K0NDVVdyNG0wOUdBekxFemxHK2hTdXYwbWc3YTNvOE52M1hRdHZHMVd1UVph?=
 =?utf-8?B?SFVoZTFPenN3UkdKbWRGdmdvZjRoaGFNYk5jQlRWR0FSano1ZXRWWFhvb0RD?=
 =?utf-8?B?WVJudFFGMHNIY0w5bnUyY3dhekxyM0ZmM0pyNUxMVGQyNWNSWHp2ZFNHMHI5?=
 =?utf-8?B?UXcvUGg1QWVHNFNtSG1KbGJUd1VSMUlBd0tDbHZrV0xpR0tBMmNJNHYvNVlJ?=
 =?utf-8?B?OE1mL0tmcFl3RGVENVZjeEQ4TEdFUGs0N0ZIbEcxbWErSmlLRGgwWXAyVVNt?=
 =?utf-8?B?U0hFYkFxSEx4VTg2c1Y1MDlNaTkxci9tR3FPRUgwUGROZzJNNDNMdzdxQU8w?=
 =?utf-8?B?dklTamtkRHQxend6SHBqbDdnNlBpRUcydUNlWVdwUkkwSzZad3dJNDRDV0FK?=
 =?utf-8?B?ZnFXNjRLZ2h1SitEUGdIektUbEUvOUxmVGxUZmtkc3NBOWhOS0wza2dMc1Ra?=
 =?utf-8?B?VmhHYllwT0NqSlRRY2xCR3BENWZWSU0vaG1iL095UkNBbTlIc2R0QS9GSU5s?=
 =?utf-8?B?OVpHL25Cb3pVZUxhd3NRWmk3Nk1UUEZjckk2R1BjWnFsVElocjFFYzdpQlk5?=
 =?utf-8?B?UzBuaFN2enJJTzNnblh0VmtQUFRTMGo0NzhEcUQ4YmR2RjB0QjZiTXFSSjU1?=
 =?utf-8?B?czFHSHN5c2dEbGhLb0p3ak1SM20xYjNtbmZ5aGNxZVVtMGhUdEtySEFwZlo3?=
 =?utf-8?B?bHIrWUdCZ2lrb3JoNlU3Ym1iQTJrZUt3YUI2WUNuLytaQ3NuQ2Flb2ZDdE5H?=
 =?utf-8?B?K2hrQ3Bmbnc0YkZuc1oxNjVLZ0FRRDJ0WkZ0K0krdFlyVnFWSTVPSTQxSmlp?=
 =?utf-8?B?d0NRTDJPWEJFMTJyV3Nlai9Oc0ptY2ZUakZCS2dZbjIyeEhJdC9wT1V0TkhS?=
 =?utf-8?B?dVFuN1Jnd3JXWFN4VmxsUlBlUWpleGtUQWplcExpL1drMFVudytMaENHUFBE?=
 =?utf-8?B?ZlB5R200V01xYXhzOHdiUWZkRzZ6MGNCRUZXY0xHZmJGK05nT0hSb1dobzVw?=
 =?utf-8?B?NlJ0UnpWaWVxV0R5bEl1ZU4xdW1tUlZTaERLWUtSVXp4VGJ6bHVJWnFVNWVj?=
 =?utf-8?B?dmhDUTFWK1ExWkpzYmt6VlZPQnpkaVQ5R3c2Ritla0RiMVh4bkRlOXVoMGRr?=
 =?utf-8?B?YjFWVHp6bzlTOGp5SjVncWF4eFRraENBVlRGSGYvaUhIK2ZBRkxBbjVMVndv?=
 =?utf-8?B?T2U3aXl6N0JJeU1weVpHbStYalBkd2hncWZCOFJ0bGZBWDY2TnpCQndySURj?=
 =?utf-8?B?QjFWQ1hjZnl4S3RDWjJIZS8xS1A3MDU4b3hzWFNwWUQxNDNFbk9wWVhNWDA4?=
 =?utf-8?B?eEQ3cDRiNXM1YzQxYWRSR0RLcXlaSC8rWDBHTjkyU1RtaUN6N2ZqSXRZNGl2?=
 =?utf-8?B?cUdheUxvYzZ6SGlLL1MycTdYVEVkY1FOTGpTOEgyS0JKamJBdTdNMlRZd0E1?=
 =?utf-8?B?VlZnQzk1a2hDR3A4cWtsQTVWbjF2L1JSL2NQY1F6bXRRSng0RkRacXdobUVh?=
 =?utf-8?B?OXQ2NEd1Qk8rYkZ5TmJ4OXg4NFhKdVNJdUR4KzRlemJ4V2ViNnZQQVRzRHBR?=
 =?utf-8?B?VmI2UFJrUDdlQUVaYzVSU1h3UExzR1ZXTW9HNGx3YzkxMlFKRlhDdllubXJQ?=
 =?utf-8?B?UnRCVERMOGNnOFl1eDZJUTRwOEtFQjJib1I3Y2xFNm9uMERSQnBBdTMwRjE4?=
 =?utf-8?B?ZStZdE5UaXpsQzR5ekp6T2d2ZXowaVNPN1BZM01vMVVKK1R4Uy9qc05GaG5o?=
 =?utf-8?B?Z2pkK0crdDF0NmtPQWtUcnlrWnVNLzBQZDVVNFpUK3AvRHVlcE40azcrcndn?=
 =?utf-8?B?czZ2RTdhM0RiQTB3TW5hRnZPNWcwTHJsZGQ0dkRlaGNjSkNsMDdhV0l5cjNG?=
 =?utf-8?B?d1I5TjJheVBtYXFWQ3RIQlVKeWxMbGUyYVZOb29sQmkrZXorUHhoaU5vQzFP?=
 =?utf-8?B?ZXhlSzhHWmhKSThCQktFeUwrRkVBaFovOTlqVTdYS0EweGsxSXpoQUJ2T3JS?=
 =?utf-8?B?NkR0TURML04wemNNZC80ZWlzSjlibXVuZTVSMEs2RmFkVmIwQXNWTWRNM2ZM?=
 =?utf-8?B?WjJ4SUdpM282T1N6WG93UmR1Nnk0NFNJZ2QvcW1WcHY3SlZ2V3krYm9TOHJl?=
 =?utf-8?B?ZXZ4LzUxSlpnYzhxbFJFc3lFWDBtVzlGT2FMZ1owT044eHFZTEMwbU4wSFFs?=
 =?utf-8?Q?kkNGZbMSm3bz6dCs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E58A7BBA8B3AE64198C371B057847BCD@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 efbc5777-3d9f-4403-3807-08da33dac69e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2022 05:46:35.4023
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 Dkh5LcdYQ7rwS04DXJ4ELsD7BbIXluVxpEj93UWl4nm8MNRpmENe3RGcpuRK2z6z+6r/H7HpD2zT/wOdSlLrq+0O3VLZcnfJBHqVMZfXapI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB2189
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 May 2022 05:46:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165534

cGluZw0KDQpPbiBNb24sIDIwMjItMDEtMjQgYXQgMDg6MTkgKzAwMDAsIEFuZHJlaiBWYWxlayB2
aWENCmxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+IEhlbGxvIFJpY2hhcmQsDQo+IA0K
PiBGaW5lLCB0aGF0IHdlIGhhdmUgaXQsIGJ1dCBhcmUgeW91IGdvaW5nIHRvIHRha2UgYSBsb29r
IG9uIHRoZSBwYXRjaA0KPiA6KQ0KPiA/DQo+IA0KPiBSZWdhcmRzLA0KPiBBbmRyZWoNCj4gDQo+
IE9uIEZyaSwgMjAyMi0wMS0yMSBhdCAxMDoxOCArMDEwMCwgTWljaGFlbCBPcGRlbmFja2VyIHdy
b3RlOg0KPiA+IA0KPiA+IE9uIDEvMTkvMjIgNTo0OCBQTSwgUmljaGFyZCBQdXJkaWUgd3JvdGU6
DQo+ID4gPiBPbiBXZWQsIDIwMjItMDEtMTkgYXQgMTI6NTcgKzAxMDAsIEFuZHJlaiBWYWxlayB3
cm90ZToNCj4gPiA+ID4gU2luY2UgZXhwbGljaXQgZGVidWcgcGFja2FnZSBjcmVhdGlvbiB2aWEN
Cj4gPiA+ID4gJHtLRVJORUxfUEFDS0FHRV9OQU1FfS0NCj4gPiA+ID4gZGJnIGhhcw0KPiA+ID4g
PiBiZWVuIGFkZGVkIHRvIGtlcm5lbCwgaXQgaGFzIHRvIGNvdmVyIGFsbA0KPiA+ID4gPiBQQUNL
QUdFX0RFQlVHX1NQTElUX1NUWUxFDQo+ID4gPiA+IG9wdGlvbnMuIEZvciBleC4gd2hlbiB0aGUg
dmFyaWFibGUgImRlYnVnLWZpbGUtZGlyZWN0b3J5Ig0KPiA+ID4gPiBwYWNrYWdlDQo+ID4gPiA+
IHNlYXJjaA0KPiA+ID4gPiBwYXRoIGhhcyB0byBiZSBzZXQgZXhwbGljaXRseSwgb3RoZXJ3aXNl
IGl0IHdpbGwgbm90IGZpbmQgYW55DQo+ID4gPiA+IGZpbGVzLg0KPiA+ID4gPiANCj4gPiA+ID4g
U2lnbmVkLW9mZi1ieTogQW5kcmVqIFZhbGVrIDxhbmRyZWoudmFsZWtAc2llbWVucy5jb20+DQo+
ID4gPiA+IC0tLQ0KPiA+ID4gPiDCoG1ldGEvY2xhc3Nlcy9rZXJuZWwuYmJjbGFzcyB8IDEgKw0K
PiA+ID4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiA+ID4gPiANCj4gPiA+
ID4gZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy9rZXJuZWwuYmJjbGFzcw0KPiA+ID4gPiBiL21l
dGEvY2xhc3Nlcy9rZXJuZWwuYmJjbGFzcw0KPiA+ID4gPiBpbmRleCA0NzNlMjhiZTQ3Li45ZWEy
MDFjOTM2IDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9tZXRhL2NsYXNzZXMva2VybmVsLmJiY2xhc3MN
Cj4gPiA+ID4gKysrIGIvbWV0YS9jbGFzc2VzL2tlcm5lbC5iYmNsYXNzDQo+ID4gPiA+IEBAIC02
NDcsNiArNjQ3LDcgQEAgRklMRVM6JHtLRVJORUxfUEFDS0FHRV9OQU1FfS1pbWFnZSA9ICIiDQo+
ID4gPiA+IMKgRklMRVM6JHtLRVJORUxfUEFDS0FHRV9OQU1FfS1kZXYgPSAiL2Jvb3QvU3lzdGVt
Lm1hcCoNCj4gPiA+ID4gL2Jvb3QvTW9kdWxlLnN5bXZlcnMqIC9ib290L2NvbmZpZyogJHtLRVJO
RUxfU1JDX1BBVEh9DQo+ID4gPiA+ICR7bm9uYXJjaF9iYXNlX2xpYmRpcn0vbW9kdWxlcy8ke0tF
Uk5FTF9WRVJTSU9OfS9idWlsZCINCj4gPiA+ID4gwqBGSUxFUzoke0tFUk5FTF9QQUNLQUdFX05B
TUV9LXZtbGludXggPSAiL2Jvb3Qvdm1saW51eC0NCj4gPiA+ID4gJHtLRVJORUxfVkVSU0lPTl9O
QU1FfSINCj4gPiA+ID4gwqBGSUxFUzoke0tFUk5FTF9QQUNLQUdFX05BTUV9LW1vZHVsZXMgPSAi
Ig0KPiA+ID4gPiArRklMRVM6JHtLRVJORUxfUEFDS0FHRV9OQU1FfS1kYmcgPSAiL3Vzci9saWIv
ZGVidWcNCj4gPiA+ID4gL3Vzci9zcmMvZGVidWciDQo+ID4gPiBUaGlzIHNlZW1zIHRvIGhpZ2hs
aWdodCB0aGF0IHdlIGhhdmUgbm8gdGVzdHMgZm9yDQo+ID4gPiBLRVJORUxfUEFDS0FHRV9OQU1F
LiBBdCB0aGUNCj4gPiA+IHZlcnkgbGVhc3Qgd2UgbmVlZCBhIGJ1Z3ppbGxhIGVudHJ5IGZvciBj
cmVhdGluZyBzb21lLi4uDQo+ID4gDQo+ID4gDQo+ID4gRG9uZTogaHR0cHM6Ly9idWd6aWxsYS55
b2N0b3Byb2plY3Qub3JnL3Nob3dfYnVnLmNnaT9pZD0xNDcwMA0KPiA+IENoZWVycw0KPiA+IE1p
Y2hhZWwNCj4gPiANCj4gDQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczog
WW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBs
eSBPbmxpbmUgKCMxNjA4NzIpOg0KPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9v
cGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE2MDg3Mg0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBz
Oi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC84ODUzMjIyNS8zNjE5ODc2DQo+IEdyb3VwIE93
bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVu
c3Vic2NyaWJlOg0KPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRk
ZWQtY29yZS91bnN1YsKgWw0KPiBhbmRyZWoudmFsZWtAc2llbWVucy5jb21dDQo+IC09LT0tPS09
LT0tPS09LT0tPS09LT0tDQo+IA0KDQo=


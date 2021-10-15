Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB05DC433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 06:15:44 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.73])
 by mx.groups.io with SMTP id smtpd.web11.5831.1634278542904860560
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 23:15:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com
 header.s=selector1-siemens-onmicrosoft-com header.b=MBwPiPuH;
 spf=pass (domain: siemens.com, ip: 40.107.21.73,
 mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dg+9arBsyaLjIfcrxIeS3oH1tp0PqERWLa9w6cYBBEjRUdt9dU0isOnYjxPDjO95PvFA9cPNs5/IcDAtGx9PHc3kRZQ6PYOA3mjjfCyIhC1MWXZEhllt8X1GjPyhUfahu9+qMeqWg64vuRT42k7y9gtGxcxkcORwg0EAAuCLnj5vNzP1xQpOZhAJaVn//h+VUz6pyAekBPGvQzHwiezMW9DHRK31XqZnhTAs2bI/1l8uX1m5aBtO8vwi9gADj+BTtWCvS14mpIgQZ5+9bwFSRgXOd6hZlaTotWxuh2hf4w//iDhkxiNmEDW/oTdc3l/RpIh5zC+RoQNh5hh9vVmlsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8w3/JEoNXFQgp5bkbVPpfCPb+5su6AKUhZIDMDDgm8=;
 b=AOvH/v+gYUx5yFItRuhmbhjv4m4QMTWEbn4dISyJohRIxXJWQPVnwTIRn5QqAEQ4BaETxHX3ECSNZEyzYN07rjWPfKl/1OnLD83Q9cSJpKP9pNMpxmJzBZHlZ7Tfyqs6EYvQT/viMNdAafXyEvmfCwzvlNGUKhXnkhoiEm2G3pJCOGANufO/+Gcp+RvJZZ2Vu0GKnK+rABM8jsiTmFmz87u6Du+Tij4DGveNmI3XBKd3XmHw/7EoC3jDz7FpsoHeC48FIsDReQxPHOIad4NZ/kq8KW5R6bneeDulUiGJZ37KL5jelnIhBsEMcHp4j54QoRQmeSUDHl+1WvC9lvnrGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8w3/JEoNXFQgp5bkbVPpfCPb+5su6AKUhZIDMDDgm8=;
 b=MBwPiPuHx1jYcUnzREisvNOpLAKmryGJ75cbWDbFmbR5uTPQMJjgo3wMupzgMlG4qsxugXOOGcKOKNvQidI9mq9Lknft3rGws7Jx/LJQ3KZpUPQ1sv+n588luq/sUpDwF1aZol+H/ByX+IDeKaLisD4gWiB+Qno1R1yIArGwmvk=
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DBAPR10MB4169.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1ca::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Fri, 15 Oct
 2021 06:15:40 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2458:1777:3472:6774]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::2458:1777:3472:6774%4]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 06:15:40 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "steve@sakoman.com" <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
Subject: Re: libpsl: Add config knobs for runtime/builtin conversion choices
Thread-Topic: libpsl: Add config knobs for runtime/builtin conversion choices
Thread-Index: AQHXwGZ5SD/9Otc2fEmK+5WS2+7uFKvSwxoAgADUP4A=
Date: Fri, 15 Oct 2021 06:15:40 +0000
Message-ID: <56ce3d16404402d0b6661fb067c587618a57661f.camel@siemens.com>
References: <0c5732d80a8f5810e9a26c3b1e634422cf750fbf.camel@siemens.com>
	 <CAOSpxdaGuK2RqNGz2VJg04AhnDhVRAMYvOLS497d-OTYUoXc-Q@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdaGuK2RqNGz2VJg04AhnDhVRAMYvOLS497d-OTYUoXc-Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-2.fc34) 
authentication-results: sakoman.com; dkim=none (message not signed)
 header.d=none;sakoman.com; dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1406e1e2-44d0-49bb-a625-08d98fa33654
x-ms-traffictypediagnostic: DBAPR10MB4169:
x-microsoft-antispam-prvs: 
 <DBAPR10MB4169AA5490F3D0E59B3B6E5C92B99@DBAPR10MB4169.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 UhDRsUci1eT396cqeOR5O/MV3FuHzqj+ulFetAYy60ywL9LdqYkrJbZc6cUSHsSZX67RRiXtP0qxiW9ZHDepQNP40dwkVzpil5gGTNZZ4O0GGPeqhKiTCRx3qF50U1NQHtDk8fHP7pBo3wLZ9/NsRq71sqPl7dXHG1QSG0F7D9HCy8Ud86tXUzRtwprfD1uoUk6A6B55pdkp2jA2iUjoVZhGFwK2EEEirxx68LbpeigMG2s3xgADPO5aZG/9O2JPL8EZkLVPoBhMjUqxKR3viNnw8yzb4QmPq+UaPrLJOxKEpfrOsEy1WNhMHH0a8QgkeRX6c5/RraQDWoOyWR/fWe1WL1NrxUKgtl/ld6cYfnVMjUJplkBmadezgN1e2zFwcUtYUJ2htEZo7nbS9bgazJHcq1ET1HkMoh1POrs4cA6UDot2ztrCSzMrNroMT9GZ0En6XREJuH/ghsNeBR3m0dW+m6gwOn2+VBVfRsuAgV2quALCB8cW6tcIzwwHAGS5v9FpUOZlTww97fNmAqC2F4CIu+rnDJklnQl/H3q5wmbgmiBjss78f+IODZaQ7FKIG5EVUEB6KLiR9I2sbli3ov6pDiwN/j39PKKlbKgjWkUFpZuiWLeDG3XjVLz7GzjuVr6m1nPxXmVOSkyzgyC+bZrd/Om5LgNBPRbWmw+YuO6ZZpqCRtNyybcQv9z61rOOqijPKxSwCBUhZD7t3Xc1h8ndZiRtc4+n9PmkD6f6d1G1xMlQ4L5R/HM0uNGZ3xYlNflU1cSdlqsctolpqQE8J9QKXa3DABL5MKzqkFnVG1A=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(71200400001)(53546011)(4744005)(38100700002)(186003)(82960400001)(36756003)(122000001)(508600001)(54906003)(6512007)(38070700005)(76116006)(91956017)(66946007)(6506007)(66476007)(2906002)(8676002)(4326008)(66556008)(86362001)(64756008)(66446008)(316002)(2616005)(966005)(5660300002)(83380400001)(6916009)(6486002)(8936002)(26005)(4001150100001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eHhmd3RSdExXd1dXQTlucnpTd2tNQjRLZlhRZitZV1lrYWUrcjNVNzNuN04z?=
 =?utf-8?B?eGIxZW5ocFU5emxvb0RlSWtmZFU4dlZ2WGJadHM1Q3RXNWZhbnV4bkhYd1hO?=
 =?utf-8?B?Vmw4OFROU3B6aHBNSnM4NFU5RFpXTUo1YTZOM3pwcDJHdERHVG5xUkV1QlFi?=
 =?utf-8?B?RmRQNmIrZnFTSW04ZnR6Zkh1MjZ1MjFmRFA2Um92cEdDWUZ4WjB5UzQzbWVi?=
 =?utf-8?B?cm5OYUQ0dExsdzE2ckVmZDNrS05aOHliYWFJdVNlNFZuckhJQkU1d2k5USt3?=
 =?utf-8?B?ZHl3N1JYbmVpZFFkVkh4RXhpUW1sU25RUXVNUzJrT3VOY0l4aUxoREFUUUZj?=
 =?utf-8?B?WWZSL0RKelArcEo4NXdrNXU4VEtMTjhxbmUrU0tIZkFSdGFnNkpjcnNteEVm?=
 =?utf-8?B?RzNraWtyZVovUmNLR3FFYXAweVA0MmRFanNMenhZME5RVjdaZkFUMkNzTU1o?=
 =?utf-8?B?K0VzaDQyLzhtb29uUjczeTh4VmxQcTVTdDFQQjJyM1hHd1VWMHRwWHh4N2xJ?=
 =?utf-8?B?ZkI3cENTQjZVT2ptSDdvZWlhN1h3T1NCL2VTM0s3VW9qV0Vlb2NFQWxod1Z1?=
 =?utf-8?B?bnRUVzczWFVqS0Nhb05iQmMyWjd4cjlOTHBTN0lCNEVSZTUvbVI3UGJGemps?=
 =?utf-8?B?c2pQL3U2SGlzbWIxT3ZtZEU2YldIcXg0V2VUakw1ckRXWjZoM0RERUcraDZB?=
 =?utf-8?B?Y3lEbmtwMHB1cHVIVzJNenJsb2Z2dy8wL21zUFpQTGorSENyYUNxblJNNWlZ?=
 =?utf-8?B?dytkWXlDK2lUZERNTVpTaVdBbTRRRDJ2NURRdDAxUHpkbk1KaDAvUFRJRllt?=
 =?utf-8?B?OU5Qa29rM3JMRGw1YmNaL3dyZkR0Mkx3ZmZZdVlQbk9oV0FaTUoxaEtzRXBQ?=
 =?utf-8?B?a0dyWDlWL0p2RGxPMUlOd2VJdkNCenI0VEE5amtOendOZ24vMVBDWlkvY2M2?=
 =?utf-8?B?TXQzL1hqbGJhcCsrMEJONFRUK1FVV3FDbUZZZXIwZzV5L29kdnkyOGFDcTQ0?=
 =?utf-8?B?WW9DVFZZODZXREpxMktJZ0lKOXIrS3lNTG1TZG5pL2dsOU4yRkJidVdKM0VV?=
 =?utf-8?B?Zkx5WHVWM2dJQnlLYVlXazhjdkNodnJpZlBYL29BTWlCempmZU9TZFl6dHRV?=
 =?utf-8?B?bkFhNzRYU2lEQVNzbnFQM0FaRndDalcrREhXUDdzMm42a2kyZE5iUVpsNWNm?=
 =?utf-8?B?OElSS3o3QnFCZ1hIeS9OV2N6OWIxRHdwdTlzaFVYbFBYemNyYkJNTkRzWDhU?=
 =?utf-8?B?dk5pTXp2UU9OZ2k5eUFnSFJVQ0Z2bUlVcHI0UmI4TWh2b0Z4cEJyTlpic29i?=
 =?utf-8?B?UHc0Q3BYZURxeXNOUERTWnpFVEM3MjdWK1JJSGNOOExuUkcxN3h5SjNOdHl6?=
 =?utf-8?B?RG1zeUZwTXkxeVdNck1aVDZ6MndINWxLcTZXMVpNd1RWbEpsTytHbmhWQVd5?=
 =?utf-8?B?eEtXeXBLL1RTV25MMlVZa3RmbjdwczR3NEJNZEgyRmZ2dk43UHQvcW8wR3pl?=
 =?utf-8?B?cVRyM2IzdXZkcjVhcXhyWUVobmZSamhlaWVyRGRwVk9IRWoreUJrcVQ0SUpy?=
 =?utf-8?B?ek1LSmF2KzNUZFNoMkMyOXQwdFRzdTlmVHZWWUhWdjhiUlBTeTkxT0tMWWFp?=
 =?utf-8?B?K1QzVkZUTkM5UmMyaHpJSjIyVGZsRVM1K1VwdzMyZGI1SDNkbGVsSVR1OUVp?=
 =?utf-8?B?MVlCQkFRWWtXR0x1bXhBZjBUbmM4VGtLVzcyU3FGZzVhRWdBWTBDV0pNNFNi?=
 =?utf-8?Q?vXkznoAp+koK2VeS6b/22oYUHZT0cXtv0rQ8XCV?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <EFF856945B2CCF42BC8AA957248D20C6@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1406e1e2-44d0-49bb-a625-08d98fa33654
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2021 06:15:40.3375
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 PjwyUOoGWc0VDY3WbsSw974QZWwd7qDEAYZR+3jn/pmhoqBSCrHibJ2Y1PE424VjoUhcvV+Y12et7HqXiWNDo89YNJzB6l+P+G30OK1s0UU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR10MB4169
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Oct 2021 06:15:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156987

VGhlIHJlYXNvbiwgd2h5IEkgd2FudCB0byBhcHBseSBpdCBoZXJlLCB0byBzd2l0Y2ggcmVwbGFj
ZSBsaWJpZG4yIHdpdGgNCmljdS4gQWNjb3JkaW5nIHRvIGxpYnBzbCBkb2N1bWVudGF0aW9uLCB5
b3UgY2FuIGNob3NlIHdobyB3aWxsIGdlbmVyYXRlDQp0aGUgUFNMIGRhdGFiYXNlIChsaWJpZG4s
IGxpYmlkbjIsIGljdSkuIFNvIEkgZG9uJ3Qgd2FudCB0byBpbnN0YWxsIGENCm5ldyBjb21wb25l
bnQgaWYgdGhlcmUgaXMgYSB2YWxpZCByZXBsYWNlbWVudCB3aGljaCBpcyBhbHJlYWR5DQppbnN0
YWxsZWQuDQoNClJlZ2FyZHMsDQpBbmRyZWoNCg0KT24gVGh1LCAyMDIxLTEwLTE0IGF0IDA3OjM2
IC0xMDAwLCBTdGV2ZSBTYWtvbWFuIHdyb3RlOg0KPiBPbiBXZWQsIE9jdCAxMywgMjAyMSBhdCA5
OjE0IEFNIFZhbGVrLCBBbmRyZWoNCj4gPGFuZHJlai52YWxla0BzaWVtZW5zLmNvbT4gd3JvdGU6
DQo+IA0KPiA+IFdvdWxkIGl0IGJlIHBvc3NpYmxlIHRvIGluY2x1ZGUgdGhpcyBjb21taXQNCj4g
PiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNz
YWdlLzE1MDYyN8KgaQ0KPiA+IG50bw0KPiA+IGR1bmZlbGwgYnJhbmNoPw0KPiANCj4gQXQgZmly
c3QgZ2xhbmNlIHRoaXMgc2VlbXMgdG8gY2hhbmdlIHRoZSBkZWZhdWx0IGJlaGF2aW9yLiBQZXJo
YXBzIGENCj4gdmVyc2lvbiBvZiB0aGUgcGF0Y2ggdGhhdCBhZGRzIHRoZSBrbm9icyBidXQga2Vl
cHMgdGhlIHNhbWUgYmVoYXZpb3I/DQo+IA0KPiBJIG1heSBiZSBtaXN0YWtlbiBzaW5jZSBJJ20g
bm90IHJlYWxseSBmYW1pbGlhciB3aXRoIHRoaXMgcGFja2FnZSwgc28NCj4gd291bGQgbG92ZSBp
bnB1dCBmcm9tIHRob3NlIHdobyBhcmUhDQo+IA0KPiBTdGV2ZQ0KDQo=


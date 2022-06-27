Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A70AC43334
	for <webhook@archiver.kernel.org>; Mon, 27 Jun 2022 12:33:08 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.52])
 by mx.groups.io with SMTP id smtpd.web10.41035.1656333180253503896
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jun 2022 05:33:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=oTY4iatx;
 spf=pass (domain: siemens.com, ip: 40.107.22.52,
 mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=naR17/9AwglX+uLylw37nWlJTAksLFePOu9c5wPpTvDDYbKJOulkhdBcU42mt0+VG/2fcJDiIImhsQF7TUf04QgXFE6/IsiVWdFL5VOKA0C/O3jnXAEcfOKvnEeJDrrrf/xRXs0S56dFK7LYh869TVLDtJs1pgK1CULwaVkViAQJbpBJDMbJGWWknsbzvYHkPGDxuIIDcL7bH46sL1WsnaZZg5bf5h5KdJSWXzG0xG+oZOqSXfrVHfPV5naAvEjZxq1+7flJR76lXK2vm2DbhwOJrJKyuLwFHpIZyC8XLJ2wP5rsdCqJqcDaRf+aZcL5+1bfEMaIKjpQ1vLWiTTTBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XSBcKh43LEJ/cep5/VCLotrndUNRZk62VFRh8pvHV7g=;
 b=iQlCBEAWdxTEiflfDODXdgkbF1//V9AR9+OyWjAjQE5B3XJiRN8pcfOmzXftvkiwkmvESyD/ryNAzZngPGXF+a3cKchdjW9tlDJA5GWwgqB9QPbUFZ6cejwxncHULLCr1qgfWvnXzJ3VqSlkK/My7xOS3h4dD2c+l/QkWt6w82cp/OFNv7bBu72YOb0tR5i8K6ymiH13Tos6Qb8jZFkgO6d3lBfkR9r+FNiEcQ1juYr9JWh5dYD+fmNPGmKozGpkyz7ORj3YM4AqUffObDaFYgrhHAxP1XNFMx36eC0b0eUdwXrY8tz/aKxNGFWSjuoVJbQjlF5cVTYRrm1tc0hcUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XSBcKh43LEJ/cep5/VCLotrndUNRZk62VFRh8pvHV7g=;
 b=oTY4iatxickn8xklM3LCVtyBitm2zD8aWLlOrZLHn+9fpx3EvVsim6qUaId+J7/3nbC+qYx71ej3yGMKzNhMcYN5yw5/mFci6A3OjCWDi1n8TXQaSCRZqWpzISD3IfXm/VjOKH+HLNI3K1l2Vz/0fY2KkDrxxgbS7HSH3Ma4b2zZbjhBt2c0OQkRpFdUjGsVo8QQKTPq4LOUa4bijnf4ifF8XMwuMIvJ5uoL8EmrvJbibrvfqxFtC/xdyWQoRMnNxsWdvVxcqxU+x3yeffSvqv3+TIdfsD48wDgH6f9aQid15DB1WzecpvOgCISQELqycGcXZjYnYRbSnlZ+8gW4nA==
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by VI1PR10MB3152.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:137::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Mon, 27 Jun
 2022 12:32:57 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e5c4:b2fc:cecd:ee75]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e5c4:b2fc:cecd:ee75%4]) with mapi id 15.20.5373.018; Mon, 27 Jun 2022
 12:32:57 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Marko, Peter"
	<Peter.Marko@siemens.com>, "Freihofer, Adrian" <adrian.freihofer@siemens.com>
Subject: eSDK dependencies
Thread-Topic: eSDK dependencies
Thread-Index: AQHYiiIHc1CLXz+3xkuTnJctNcNK1g==
Date: Mon, 27 Jun 2022 12:32:57 +0000
Message-ID: <57e72a0fe687a49a7efcffa167adab843305b612.camel@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-5.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1741f57-7b9c-4b42-3941-08da58392a4f
x-ms-traffictypediagnostic: VI1PR10MB3152:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vCrpiALWXewlP860B2nsO+bna5ISbRMFp+oxWeSCbHunNpA5oeCVYmIQdjTalvu2wBZoArq7MwVrLVq6xapIQOwMa8jVjfxn7WYubuj8Dse/DWLpESFm1hHkN2EDRGvJfem84cmhIQjxcScrtCHzxrP4W2cBaNjnGOROBc3BBGU6IO1+LzdlPUECQ4uI43lTNK0FUlM5N8ys4RNEdQZuclZnxy+DaTMTFRORk/sTZ6VBGrmW4q5AaGLynSx9sAQ//y2yMnjqo7kWVb++NzoQhtN0iMAsjp8JGIjC619eP/BYkoiV+joSXtm60FPgZXPKEw05W/voKCscA7bmvHyg7rgnWeIdKjnh/RtnQIHLakhnvhaizt1/Pfr0b5UXir+S43Howuzk7+GGEV7/G3QNlkuYaMqpdcWYcgdy+WrGZqHFBDVrpsxVCcvC5QSXpJiZBFWAAl99JJEfnTnJPuJCW10dQ+KToJ6z3LFGUncbFtdiFzrUj24OuF7JMHjd6Uo56QK+ur8Rf0cRf1HeGHBGH8ri6cB4KmLFYJdb29WwNjmYDw+0uZ0pMZW9ZeIxyl/DyRZrNoelpQxNxpq9i0xdhtlExE208WoLQ1QwSS4Zy5qI/8gK87g2cqrcARA+ngd/kF7G+AwEZTacSf46r6tZdzpVpeYc+TsNQJ3Gkl98ZGe/A/9+bR3hloLVbAmGGm0rgwkfIsbQ8uzFCsmwghFvS8D56UQl38XuLNzh3Cfnld/6ZTSxycYpr+heY3XnAh4UlABjEWriCkJz6zLn9pnHkvXPgwEuZ0pTj5VjCxPFHcY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(39860400002)(396003)(376002)(136003)(76116006)(64756008)(4326008)(66946007)(8676002)(66446008)(38070700005)(107886003)(5660300002)(38100700002)(6486002)(66476007)(66556008)(186003)(91956017)(478600001)(8936002)(2616005)(71200400001)(41300700001)(83380400001)(122000001)(6916009)(2906002)(7116003)(36756003)(86362001)(316002)(4744005)(6512007)(26005)(6506007)(82960400001)(54906003)(3480700007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?STJHeWJ5ZEZsSHJVaG1zbXlsaTR2QlgxYkt1SVdSM3d1eWZVaEE5Vk1Hamsv?=
 =?utf-8?B?Z1lVdm16OWh4TjI0WGVUSGU5aGZRTno2Y0laczRYOXU4bVdtSFBiKytZTW9M?=
 =?utf-8?B?WXpJNEN0dzVONzBlTFpNY0NhWGZTMUE0YktIVkxFU2hMU2NMV3QwME0vQjF3?=
 =?utf-8?B?c2Z6aG1lQmdFY3Iza2pPa2hSVFlRNm1oR3I3Ym5NTjQvMW9EaDdlYnlCZmoz?=
 =?utf-8?B?a2cxYVVxNytDcmVUU0E1NHNSZzRYWlBYcXdIV0lxS0NzZkowb0xwbzlZcUNN?=
 =?utf-8?B?TXZYMDNNY1g4L2NIUWxyZFBYQ2E1a1pBc2haREJkak1Sb3ZlMUw4YXFOVFY5?=
 =?utf-8?B?LzhsdGc4WkJRYmJsZUt4c1RHdG9GRDFyblF6MFgzd3g4am1hS0dzZ2IwcmpC?=
 =?utf-8?B?Ny84ckhrSlk3ellWM0lQVjRtUXFtbFBOa0p0NkJFUkpHMTE3TXZMaVVKNFRK?=
 =?utf-8?B?eFVuWnMwK0hjbFpDOWx6OEJjMytDME5ZUVdEQ0tNWS9tRHlCWHJjMEVnWTZW?=
 =?utf-8?B?TTlvdEMyR3pYT1RoL0NXRUZzdW1NbE9MS24raVp5T3JyZnF5M0lxQTl3VENr?=
 =?utf-8?B?OUpmcEJkR0JIc2lhTm5KS2FTUjQ4elVuUWllTGdqaExKeWhRWEZWMjl3K3Yx?=
 =?utf-8?B?cENLMG43N1R5VW9EQzlNVmUxblppOUlweHorM0lIVG9yM1ZHcWtCQjFnYXlY?=
 =?utf-8?B?RHZ6Q0dYdjh6Uk9qZ1JwYS90a2M1ek9PQktoalVYYjArb1BsT2k1dC92OWo4?=
 =?utf-8?B?RjhHSXpmM0NRRlVTZFUyeE9ab1RiS0RYS3RnN2p6SUxYc1k3RmlQZytPZGo1?=
 =?utf-8?B?QkFXZ0R6aXZaWHZPSlJXejBvenNlZTRZUW9YYXErdm1VNzg2dUlYZE5kU1VT?=
 =?utf-8?B?QTdXMXo5WmIrUnFnQzg4NkpxQnprd3NyUjVSSEZ3dC9OSmtxZC9YdW5wcTRB?=
 =?utf-8?B?a2pmTGhQMFFSTlBLbkhiMzhONkNWZzdhcjd3Y1R3cnFLa29rYXhreFZ1dmRU?=
 =?utf-8?B?enFaNXc1Nms3a3Z3N1hOeVdod2htQ01KQmd0cDBkbkZmNXBBNE51b3dFd1Yw?=
 =?utf-8?B?b05WbWN3KzN4bkdxLzNIcmQ3c05MaXd3dFcvL0owR0svaWhrblQ2OTAwaFow?=
 =?utf-8?B?Z1RnMXRGVzgyZ011T1dRRmhmK1R4UThiNmljLzJhYWJoT2o5VzNqaEoxQ3Y0?=
 =?utf-8?B?dGwySzBCbXFCekRkOWg2d1NQZGk0WFRzY2p1T1ltakxwTVd4b2l3YWhtV2pE?=
 =?utf-8?B?Uk1RQnJUNitHSEYwZW9HT0hzN3MzOU40ZmNzbnlLcTFGaDBXSXdTdmhVSnZ5?=
 =?utf-8?B?cEt2SFptRjVLNkpiMElIMFZLMDkxekFEaWwyelB3cVYvbm4wdWE0amViSGI3?=
 =?utf-8?B?WU4vZlc5SW5TenNTZ1BDcVVidWcxTG9ybzlaZjFEL202dGhzVlZmRGF0UE01?=
 =?utf-8?B?STBETkpGNlVyT09Oak0vdTU1THNOWWN0ckdnVXhnTno2TkV6N3g5eFlJZ1NE?=
 =?utf-8?B?ditnb2Z5WTdudFhoanhzK0hyVkU0VkFzWHdvVW5yNmhvOTdUSFUzRVV2YTRu?=
 =?utf-8?B?dC9EQ1ByM1poWENwNWt6TmVnZHdqWEZhdXo3QTJGeG9wNmZFdjZKMEZvMWND?=
 =?utf-8?B?RnRVTklvd3FUS2xZQUpLSWJVQmU3TEtZQTd0UFczUE1oNkFmSDJzKy9VME9m?=
 =?utf-8?B?cnZMNjkyQnQwa3lIcFRHVVA3UFNxcnlMUVpUUnMzUkYzem1ZTGhzY1V3YmxZ?=
 =?utf-8?B?TU42U0xrV1FoZDhPYWhhbEpWSTVmUFJnVThmaXdCZElTck1KUFR5VTZFMjha?=
 =?utf-8?B?cE1lNEtkRWJ4QitTQ3gzQ0Rlb0lwakxTU0RyUlBuenh0SUFNeldBeDhEZ1RW?=
 =?utf-8?B?SG1hdGEwa0ZkTDJwVDdjSmdRNWxEUzdBWmVWRFd0cFBFdGFvNGhqK2VCTVoy?=
 =?utf-8?B?QjdpaGluM051OGt0VUIwNjhIOTVCM3dvcGkwSHh0T25saEFrcWJmMXRMbFp6?=
 =?utf-8?B?RWRtSUJtbjU0anl5eEY5ZUUrUEpaTk1lMVBBRkxaYnNLMWFzd3NzTGhjcU5B?=
 =?utf-8?B?dVJOZ01FSlBrNkduMUVPaDd0enlhZU1ERHJKOStJbTZOSXNxeGVFbzlCMnhK?=
 =?utf-8?B?MzBxeXI1bmsycHU5WjlTemJzYXQ1SzNqbWZsanlQL1VhbUtueTFvTzZoM3Ju?=
 =?utf-8?B?Q3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8E55DC0EC50E084481EBDE25FE476EF0@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d1741f57-7b9c-4b42-3941-08da58392a4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2022 12:32:57.2092
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 y6NLJJ4ymWKxxegnsF45OCIQnZvZQ7Zzc3+mOKFH1zkAsIp8/Cks+nu3z6qFGWdBv+vmgakwT5CkCXiWLLo63ghHlFxRsEDR8Mgs8Ct7mng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3152
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jun 2022 12:33:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167319

SGVsbG8gUmljaGFyZCENCg0KSSBoYXZlIGEgcXVlc3Rpb24gcmVsYXRlZCB0byBlU0RLIGRlcGVu
ZGVuY2llcy4gV2UncmUgdXNpbmcgdGhlIGR1bmZlbGwNCmJyYW5jaCB3ZXJlIGV2ZXJ5dGhpbmcg
cmVsYXRlZCB0byB0aGlzIGVTREsgdG9waWMgd29ya3MgZmluZS4gTm93IHdlJ3JlDQppbiB0aGUg
dHJhbnNpdGlvbiBwaGFzZSB0byBuZXcgTFRTIGJyYW5jaCwgd2hlcmUgd2VyZSB3ZSBmb3VuZCBv
bmUgYmlnDQpkaWZmZXJlbmNlIGJldHdlZW4gZVNES3MuDQoNClRoZSBvbGQgdmFyaWFudCAoZHVu
ZmVsbCkgaW5jbHVkZXMgYWxsIGFwcGxpY2F0aW9uIGJ1aWxkIGRlcGVuZGVuY2llcywNCmJ1dCB0
aGUgbmV3IHZhcmlhbnQgKGtpcmtzdG9uZS9tYXN0ZXIpIGRvZXNuJ3QuIE1lYW5zIGlmIEkgaW5z
dGFsbGVkDQp0aGUgZVNESyBhbmQgdXNlZCAiZGV2dG9vbCBtb2RpZnkgbXktYXBwIiAoYXBwbGlj
YXRpb24gaW5zdGFsbGVkIG9uIHRoZQ0KaW1hZ2UpIGl0IHdvcmtzIHdpdGhvdXQgYW55IGFkZGl0
aW9uYWwgYnVpbGQgZGVwcyByZWNvbXBpbGF0aW9uLg0KQnV0IG5vdywgaWYgSSBkbyB0aGUgc2Ft
ZSBvbiB0aGUgbmV3ZXIgdmVyc2lvbiBpdCBhbHdheXMgcmVjb21waWxlIGFsbA0KYnVpbGQgZGVw
cy4NCkkgd2FzIGFscmVhZHkgbG9va2VkLCB3aGF0IGNvdWxkIGJlIGNoYW5nZWQsIGJ1dCBJIGRp
ZG4ndCBmaW5kIHNvIGZhcg0Kc29tZXRoaW5nIHN1c3BpY2lvdXMuIFNvIHRoZSBxdWVzdGlvbiBp
cywgd2hhdCBoYXMgYmVlbiBjaGFuZ2VkLCBhbmQNCmhvdyB0byBicmluZyB0aGUgb2xkIHZhcmlh
bnQgYmFjaz8NCg0KTWFueSB0aGFua3MsDQpBbmRyZWoNCg==


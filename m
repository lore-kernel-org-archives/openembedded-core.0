Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B36F5CA0EF8
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 15:11:32 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.31])
 by mx.groups.io with SMTP id smtpd.web10.11997.1755789084340076325
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 08:11:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=e9JTJ03N;
 spf=pass (domain: axis.com, ip: 52.101.72.31, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HjVuJhQ2W2wr4Eh6GAygKViQM/O4z/LEYVwm9APjFm+VcWznmsEZorqBIKPFMBkHO/WAGYqU6ZIh+x1RmajL9tLYAOOcKqkmT8JkEY9SH7vrSMcolkGbUusNLP4AnW6SOgnhIhpYmJsaLDISNquSR0402O0NY5N+Kv8IgQtac/8RRLwsK2ahMoFhEQKVbPQoQIjZDqhCw9s1urE1uKtTpsMmNzUH7p8vSSc9lq2u53WLzK+Ouw07kJ5SnvHuKz7F1osPv5eWLnuIrb9muUTY7f4fufuiefYSKLDCw9U4G6CmNLOYMWHzLjFM3dZPtbBvdg38YsTWWJDYfhOITcne4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alart+5AHQWiJJxwNGRT7lVI3ML3MJFdw3jYSee8/rE=;
 b=apQWhA5afItlSMPL2epHlSfIwHMTpYTYrinkLKPvGbSE/K4EZjkDcDgqtUjw1vP/hvdPW5kINfANSN0xQubGaVPDRStTJ8ar1614UlDKgN9CFyDZFG386tbnD99GiQXZiTFgWUN5BXXri2rJd7XMj5TM1UdsV0gYv6Z5eHMRnsppBH9tmar979VEjr61/Lt2hG7rhO+RMwe2FGqNyn57B2JjGMn2bI8a/fhM75+v4VN/NbJr1zjxdodMbZ4IRK6G4Vdl1E0XRDqpYjE3N6j6RUB3I7T8S6Lk7ZnXA7wbXi8UW27JN6aj13LU/pPMWWGG2fnIdjhoig0JWpOK5UmUcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=alart+5AHQWiJJxwNGRT7lVI3ML3MJFdw3jYSee8/rE=;
 b=e9JTJ03No7gwGfCcskRHVDvufOkUsRB3fYsU+enpf0JZn81siOgVbo2845oHYCtBb/egc7PkAS5oWzXC6q6XyLw6DR9z4U1ByQd0oUth85wf1KtMM02I1SBjkbIvLvKgKiKVK2/JSRC+A8/0hlDb5KaeVX05M/yk6xt472ImI/I=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DU0PR02MB9776.eurprd02.prod.outlook.com (2603:10a6:10:44c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 15:11:20 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%3]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 15:11:20 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCHv5 1/2] systemd-systemctl-native: Install
 systemd-sysv-install
Thread-Topic: [OE-core] [PATCHv5 1/2] systemd-systemctl-native: Install
 systemd-sysv-install
Thread-Index: AQHcEmY0Br+4kD+V/k6A4KFaUq2UjbRtNMtg
Date: Thu, 21 Aug 2025 15:11:20 +0000
Message-ID: 
 <DB5PR02MB10213ECD00D7E7E9E3F32E155EF32A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250820134202.1412477-1-pkj@axis.com>
 <DC7WDGGBK31E.2TP4Q7QNVM9A1@bootlin.com>
In-Reply-To: <DC7WDGGBK31E.2TP4Q7QNVM9A1@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU0PR02MB9776:EE_
x-ms-office365-filtering-correlation-id: 5c2b77dd-cc02-4ffe-44fa-08dde0c4fc10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?UTVRTGFJK1BUb0FsZXlvRGdtbkhPc0kxZEt6U1Q5V1dQdktUck1OSUJZL1VT?=
 =?utf-8?B?VkplR3lIcDRqMTRCYjFLbEpyU05zZS9wMGx0R0M0L1ZNejZoZUdVaUNQc093?=
 =?utf-8?B?bHg0WGM2b3Y1aFR2bXo4di81NURXNjdFSzdJbmh0SUJoa25TU05Zb1hwYUhr?=
 =?utf-8?B?SmcvNnhlRXJFbDVsUjdoSGJsVkJIVzkzWDhreHl4dWVZSEhwdEJPUjBacm9o?=
 =?utf-8?B?Yk82QU1JaklTRnVUMnIvc0lnRlZYV0lIcEdTbXAyaE9LdS8yTm9MRHkzV0ox?=
 =?utf-8?B?ZUNVZ3FCb0ZONlF5TjYyOEdkeE5sa3NLS3gyLzM3Szc2bGVOZGk1QTJRWDNh?=
 =?utf-8?B?T3FjZk5PZ2NDQjZJZ0p2YmE3TWFVK2JPZ3lZaGtmQy9rVUNra1N0dHkyVGxp?=
 =?utf-8?B?YTduS3FWR0JnWVBCZXFzamlrTGZZV2hhVExhR2NQUXBXZU5PamRRQVV3RXIr?=
 =?utf-8?B?RzZkaHBRRkNTZFdObEM1T0V0MEVKdDBvVEgzS01DM1RDUS95QmREK1RFYjUz?=
 =?utf-8?B?ZEpMakF5S3AyQ0IwVmZjU2VPNjNCKzhydkI5SHRidUo4c0ZuRG9JNndqN1FO?=
 =?utf-8?B?RklUYTltZmNJNjVvVVBCU1k3eWFsREpsRm9sQnZoaEh2b2RtNEhTWE10L2wy?=
 =?utf-8?B?ZEt2c29GM1Q0NWF5N0JFTWt4SEJzWG5OQ21heWxMblBGMnpZSDl4NnRGRnFO?=
 =?utf-8?B?MjNyTlVIOGhRcU1YL3ZyeDdyY0FYTVBON2NleWZRdVlscUlIUE5Kc2tUdE4w?=
 =?utf-8?B?Y1ZacWZtZ043RmY3UlFGZmRRMkNWeFdsdUp1ckFKemtQcmJSWEJ0Y0xJMVR5?=
 =?utf-8?B?ZnhKRHNwbGkxc0lqOTdJZnlueTZXd1crUTczWlJTdElpTWM2RTBXS3NWNG81?=
 =?utf-8?B?RnpIUnhxek9keEVuSERrcWdLSUtIbUxlL1Rham1aaWpHcklPeGQrYTJnREpw?=
 =?utf-8?B?dTdHL0pEbWhRUlM2emlqdVp1Vy80TDRNZHRuRTNMdXBTelpNYmRyRTMrMnFS?=
 =?utf-8?B?azVDKzQ5dkt2UG1ZbUQwTzQ2ci9JNUlzZjJqQ3BoZDIycVZGUWY5TDI1QXpK?=
 =?utf-8?B?VW1vSkJXdmxQY1E5TkhXTE9HcEh4WE1Mb3FvVFZQZGhoRlNQYUJ5TzBzRU90?=
 =?utf-8?B?eTNkMGdOMGNaZDZDclY3K1lxWlo5RlN3aUl1NGpUZXRWTGI5aGRhS3ZmZjRX?=
 =?utf-8?B?NnUrSU5Ub0RGOFpZRkF3NHdSKzFwTld6bW5VbFVaTktJVzg3bWZaT1hvcTZ1?=
 =?utf-8?B?Skk3UEZwVjZQNGpRYkpSYyttTnpFV1JKQzJLWlpIaVhlV2VSbFljNEs1Ymtj?=
 =?utf-8?B?MlFhQmNaOFZ5UW05ek1OOFdld0FYR2R6YmNnWmQyZkZITGhtT3ZCM2txdUsr?=
 =?utf-8?B?d0kvUW5wV2hNQUpQa2NVRDZsaWdmdENEUmExb2crbU5jelJiL2xKWHRURWRY?=
 =?utf-8?B?OTN3NktCdnpWdnROYS9QcjVzMUVSNGhhY0NUaXdJbnFsZXNjSDUxWWVZaU5Y?=
 =?utf-8?B?SkEwMVNhRlpqUUZmVk8wZmc2b0t6YWxXcTVWdEZOSWtpc1ZjSndocW81L0d4?=
 =?utf-8?B?YWlyWUcrUGpoKzBJOG1DOVU1Z2tXMFZEbWNuS21jQUErdE50SUdGU05SWkRG?=
 =?utf-8?B?bUFDUmVLeWFWeFlPc1BwVHVvVUtEREFHaDVnUGJNNHJDR3Y0RmpxWFBkalVp?=
 =?utf-8?B?NjNYR3pQRXFoVURURDJTY2l0dEF6NFNHZzFLbWJJVUlXRCtNNjBqS1RmL25s?=
 =?utf-8?B?SmZMcDE0SStYcFJ0NWhUdU9CTTBEWk1zT1AvcU1xK1FMbGgrWHBrakdwblFs?=
 =?utf-8?B?SUxQYTFGZlpmSVZnQ2QwRG5nUmFDQlIzVXB0RE40Q3F4VGwzcnFtL3dMOVZq?=
 =?utf-8?B?YVEwMFBkTENVbUVOTXE3a1RtMlo2Y0s1VzF1Y2JiamxPU0VGc2lxZXZFb3FO?=
 =?utf-8?Q?pLzBNRURL7E=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OUtPTjlGREJOOWdOR1N3MVNKb1lzWiszWjlHZWRpSzlablBuNVRmQTN6TXFG?=
 =?utf-8?B?M1llbE1LaXBBKzgwcTRZRTNjUVFjRHQxSzJjaEk3QyttTlp2L3lZSHduWm1F?=
 =?utf-8?B?V2tZTFFZNnU2aDBUaTJqVG12NkdaOUNMeEFKOTNjSVZXYVgzQnVUbmtmakE4?=
 =?utf-8?B?M2dXVUxVcVdQV2dLZUNUTFdEY2VlU21hU09SSWo4aERmMmlQVTJlSFR2TzB0?=
 =?utf-8?B?NFRORjdQcG5BV2JNQmtFYzRKRXN0anN3dXE0OFZvZDhWWmdxc2x1ZEhMVzlr?=
 =?utf-8?B?UUFQcXZaYThTaU82cUh3R1pyS1AzdXlRWERFL0w2VzhBUzNvNE16bGxYb0Yy?=
 =?utf-8?B?SEZQYURHaXdLV2ZyaDROdDhaOUJwVjl5U2ZyRksrS3lrZDZNYXlzUE5vaEta?=
 =?utf-8?B?R3YyYjhMdFAvZ0dweXZHR09uMGdhZnkwM05tNW9PMU5OZk9wYldQaUhyWFVT?=
 =?utf-8?B?ZnN1MGlQM09acDh0MjJjWVlqQzVQZ0VBM0V1OHBoR09uK1VBVVhkNTdaK3JZ?=
 =?utf-8?B?M01rUkd5NjRvb2ZFSnBUV05HYkl6MkZySkVsSW5Xa0lSMWZmcFlWZVorZTJt?=
 =?utf-8?B?L3VNRTBncHpVbWE2M2Rma1ZzSFZtMkNDRVE2TDhUYjNjQkxRYjBSSTBEMExN?=
 =?utf-8?B?ZU9sNFo1RlgxWWVCZ2x5bnJYWEVsa2ZWVFVSUVhFWE1KSmd2Nm83K3Foazlq?=
 =?utf-8?B?bHFCUjlDU1YxVnU1cEFiYTBCRUFNdmtrR2s4bXNoWFJkNXd5WnIrYjF4YVFW?=
 =?utf-8?B?UG5DTHhzQThnQ0FHamd4K2doRnBHbWhra1ROU3ZOMDQrcEhpWXZ2akhsM1Ji?=
 =?utf-8?B?VThwQVJldWpHNFdxRGcwalIybHdlUlJlaFR6RkpTVmpxRmhtY1BGSzYreERw?=
 =?utf-8?B?RjhoRVpHVStPb2ZIYUxPOUcvVUR0MmErQ3JTaER6Qms4SFlkNnJKTUI5RWlZ?=
 =?utf-8?B?aXpZQVZmQWw1cHplVnhsYXVvc0ZzczI5QlRhRnNzQXB2dVNyU0ttMU9oWnVa?=
 =?utf-8?B?WVBxd0xjbnV3WG40QVN1blNFRnJXK3F1R2JxSXB0WURWVXNkd0M5TGFYWXM4?=
 =?utf-8?B?RWVJMXBiMVN0OUROa1lVc0daUE4wUVhmczRmZEFpb0oyRGoxV0c3eG1NSTl0?=
 =?utf-8?B?Rkp2RU13d2VhbXZoN3NRSEoxdEtMWnRYajJyU20yQlpjNWMvdzZQcnd2OXUz?=
 =?utf-8?B?SUgwenBrZnJMQUsvU1JSNmRsc3o2T3FrL1pzMFBNTS9Pc0ttODVZTlMrUXRM?=
 =?utf-8?B?MXFkMTBWTWd2M0FmcDFmb0lLZXNRd3ptc0dyS0RRcTByZnc1aElRMW12K29j?=
 =?utf-8?B?Q0dJWVljY1dWZ3NFWUFMcTRmUG83MVRHMVZ6bmVYVlpIbysvRVV3VFh5SXJo?=
 =?utf-8?B?U3BId1M2Zy9WNXkwb0lPTlZGUjMrTmFCSlZKV29qWHdMTW5TWVN4b3ZIUDZv?=
 =?utf-8?B?cGREMHhjNDNXNVIzM21idmEvR1M4MTlvTU04dnExdFhob3VLMjJ4UXc4MFVD?=
 =?utf-8?B?SFBTZHRVL0tJc3FTM1JPZjk5aUZJWnp4V2tuWnNaNnpwcFFTYUh6M0ppMjJp?=
 =?utf-8?B?YzFUamZsWW1DR2pQai8yOGJOcDdmZVcyWVV1Q21VVnVOU090UXFVSzNNT05t?=
 =?utf-8?B?RGoyeWpoVlo0ajRmc1BnZ2prS3Rkc2ZicnYrWkJOc2dubUJUWUpwb1NxemtV?=
 =?utf-8?B?eFVLLzR4SXhDbFZvdWlOWG9DSFNuamZ6OW41NHhiOFRCc2pjRk9iL1ZhT1kr?=
 =?utf-8?B?ZXdiWXJmODIvc2YybjBVUVdhYWRtQ1UwYk9aZWplQ3lKeGZWZUpuTDdycWxa?=
 =?utf-8?B?VktQKzBobXVxeWUrNGxsTkcxcno1Vnc4eEM4M0Ywd2ptODVnMlVpTHpFRWt1?=
 =?utf-8?B?ZHFvaXNpcmJud2o0SUs5dGNmWjhjMzlyN2hpYjJiNnBwVEhRZUE2TjlLaFNo?=
 =?utf-8?B?bEZMcXBPQmdrWVFiQ2p3OHBjN0hnckw0MmpyODY0UVZnTlJuU2VtV21nd2Vv?=
 =?utf-8?B?TTZiaGhTbXZBOUxNMlpCNGlSMUNxV1M4amJ1OERNM21nMW5tTGhVcVNXa2VL?=
 =?utf-8?B?aUJaRHBCQUdCQUV0QytUcDJZV0hiaHV3SDgwdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c2b77dd-cc02-4ffe-44fa-08dde0c4fc10
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2025 15:11:20.3075
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 22vz12LJWJYHCijGNhwOYzc7IUlzdANpJe3lm5+iYdeIFJGtERCJprSrgY8VMIDj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9776
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 15:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222248

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXRoaWV1IER1Ym9pcy1Ccmlh
bmQgPG1hdGhpZXUuZHVib2lzLWJyaWFuZEBib290bGluLmNvbT4NCj4gU2VudDogZGVuIDIxIGF1
Z3VzdGkgMjAyNSAwODozOA0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVy
c3RlZHRAYXhpcy5jb20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIdjUgMS8yXSBzeXN0ZW1kLXN5c3RlbWN0
bC1uYXRpdmU6IEluc3RhbGwgc3lzdGVtZC1zeXN2LWluc3RhbGwNCj4gDQo+IE9uIFdlZCBBdWcg
MjAsIDIwMjUgYXQgMzo0MiBQTSBDRVNULCBQZXRlciBLamVsbGVyc3RlZHQgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+ID4gSXQgaXMgbmVlZGVkIHdoZW4gc3VwcG9ydCBmb3Ig
Ym90aCBzeXN0ZW1kIGFuZCBzeXN2aW5pdCBhcmUgZW5hYmxlZC4NCj4gPg0KPiA+IFRoaXMgYWxz
byBhZGRzIGEgcGF0Y2ggZm9yIHN5c3RlbWN0bCB0byBhbGxvdyB0aGUgcGF0aCB0bw0KPiA+IHN5
c3RlbWQtc3lzdi1pbnN0YWxsIHRvIGJlIHNwZWNpZmllZCBpbiBydW50aW1lLiBUaGlzIGlzIG5l
ZWRlZCBiZWNhdXNlDQo+ID4gdGhlIGhhcmRjb2RlZCBwYXRoIHRoYXQgaXMgYnVpbHQgaW50byBz
eXN0ZW1jdGwgZG9lcyBub3QgbWF0Y2ggdGhlIHBhdGgNCj4gPiB0byB3aGVyZSBpdCB3aWxsIGV2
ZW50dWFsbHkgYmUgZXhlY3V0ZWQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBLamVs
bGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4NCj4gPiAtLS0NCj4gDQo+IEhp
IFBldGVyLA0KPiANCj4gU29ycnksIGJ1dC4uLg0KPiANCj4gV0FSTklORzogY29yZS1pbWFnZS1m
dWxsLWNtZGxpbmUtMS4wLXIwIGRvX3Jvb3RmczogaXB0YWJsZXMucG9zdGluc3QgcmV0dXJuZWQg
MSwgbWFya2luZyBhcyB1bnBhY2tlZCBvbmx5LCBjb25maWd1cmF0aW9uIHJlcXVpcmVkIG9uIHRh
cmdldC4NCj4gV0FSTklORzogY29yZS1pbWFnZS1mdWxsLWNtZGxpbmUtMS4wLXIwIGRvX3Jvb3Rm
czogb3BlbnNzaC1zc2hkLnBvc3RpbnN0IHJldHVybmVkIDEsIG1hcmtpbmcgYXMgdW5wYWNrZWQg
b25seSwgY29uZmlndXJhdGlvbiByZXF1aXJlZCBvbiB0YXJnZXQuDQo+IFdBUk5JTkc6IGNvcmUt
aW1hZ2UtZnVsbC1jbWRsaW5lLTEuMC1yMCBkb19yb290ZnM6IHN5c2tsb2dkLnBvc3RpbnN0IHJl
dHVybmVkIDEsIG1hcmtpbmcgYXMgdW5wYWNrZWQgb25seSwgY29uZmlndXJhdGlvbiByZXF1aXJl
ZCBvbiB0YXJnZXQuDQo+IFdBUk5JTkc6IGNvcmUtaW1hZ2UtZnVsbC1jbWRsaW5lLTEuMC1yMCBk
b19yb290ZnM6IG9zdGluc3QgcmV0dXJuZWQgMSwgbWFya2luZyBhcyB1bnBhY2tlZCBvbmx5LCBj
b25maWd1cmF0aW9uIHJlcXVpcmVkIG9uIHRhcmdldC4NCj4gV0FSTklORzogY29yZS1pbWFnZS1m
dWxsLWNtZGxpbmUtMS4wLXIwIGRvX3Jvb3RmczogYXQucG9zdGluc3QgcmV0dXJuZWQgMSwgbWFy
a2luZyBhcyB1bnBhY2tlZCBvbmx5LCBjb25maWd1cmF0aW9uIHJlcXVpcmVkIG9uIHRhcmdldC4N
Cj4gV0FSTklORzogY29yZS1pbWFnZS1mdWxsLWNtZGxpbmUtMS4wLXIwIGRvX3Jvb3RmczogY3Jv
bmllLnBvc3RpbnN0IHJldHVybmVkIDEsIG1hcmtpbmcgYXMgdW5wYWNrZWQgb25seSwgY29uZmln
dXJhdGlvbiByZXF1aXJlZCBvbiB0YXJnZXQuDQo+IFdBUk5JTkc6IGNvcmUtaW1hZ2UtZnVsbC1j
bWRsaW5lLTEuMC1yMCBkb19yb290ZnM6IGxvZ3JvdGF0ZS5wb3N0aW5zdCByZXR1cm5lZCAxLCBt
YXJraW5nIGFzIHVucGFja2VkIG9ubHksIGNvbmZpZ3VyYXRpb24gcmVxdWlyZWQgb24gdGFyZ2V0
Lg0KPiBXQVJOSU5HOiBjb3JlLWltYWdlLWZ1bGwtY21kbGluZS0xLjAtcjAgZG9fcm9vdGZzOiBu
ZnMtdXRpbHMtY2xpZW50LnBvc3RpbnN0IHJldHVybmVkIDEsIG1hcmtpbmcgYXMgdW5wYWNrZWQg
b25seSwgY29uZmlndXJhdGlvbiByZXF1aXJlZCBvbiB0YXJnZXQuDQo+IFdBUk5JTkc6IGNvcmUt
aW1hZ2UtZnVsbC1jbWRsaW5lLTEuMC1yMCBkb19yb290ZnM6IG5mcy11dGlscy5wb3N0aW5zdCBy
ZXR1cm5lZCAxLCBtYXJraW5nIGFzIHVucGFja2VkIG9ubHksIGNvbmZpZ3VyYXRpb24gcmVxdWly
ZWQgb24gdGFyZ2V0Lg0KPiBXQVJOSU5HOiBjb3JlLWltYWdlLWZ1bGwtY21kbGluZS0xLjAtcjAg
ZG9fcm9vdGZzOiBydW4tcG9zdGluc3RzLnBvc3RpbnN0IHJldHVybmVkIDEsIG1hcmtpbmcgYXMg
dW5wYWNrZWQgb25seSwgY29uZmlndXJhdGlvbiByZXF1aXJlZCBvbiB0YXJnZXQuDQo+IEVSUk9S
OiBjb3JlLWltYWdlLWZ1bGwtY21kbGluZS0xLjAtcjAgZG9fcm9vdGZzOiBQb3N0aW5zdGFsbCBz
Y3JpcHRsZXRzIG9mIFsnaXB0YWJsZXMnLCAnb3BlbnNzaC1zc2hkJywgJ3N5c2tsb2dkJywgJ29z
dGluc3QgcmV0dXJuZWQgMSwgbWFya2luZyBhcyB1bnBhY2tlZCBvbmx5LCBjb25maWd1cmF0aW9u
IHJlcXVpcmVkIG9uIHRhcmdldCcsICdhdCcsICdjcm9uaWUnLCAnbG9ncm90YXRlJywgJ25mcy11
dGlscy1jbGllbnQnLCAnbmZzLXV0aWxzJywgJ3J1bi1wb3N0aW5zdHMnXSBoYXZlIGZhaWxlZC4g
SWYgdGhlIGludGVudGlvbiBpcyB0byBkZWZlciB0aGVtIHRvIGZpcnN0IGJvb3QsDQo+IHRoZW4g
cGxlYXNlIHBsYWNlIHRoZW0gaW50byBwa2dfcG9zdGluc3Rfb250YXJnZXQ6JHtQTn0gKCkuDQo+
IERlZmVycmluZyB0byBmaXJzdCBib290IHZpYSAnZXhpdCAxJyBpcyBubyBsb25nZXIgc3VwcG9y
dGVkLg0KPiANCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmll
LyMvYnVpbGRlcnMvNjUvYnVpbGRzLzIyNTMNCj4gQW5kIGxvdCBvZiBvdGhlciBidWlsZHMgaW4N
Cj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRl
cnMvMjkvYnVpbGRzLzIyNDYNCj4gDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IE1hdGhpZXUNCg0K
SSBoYXZlIGZhaWxlZCB0byByZXByb2R1Y2UgdGhpcy4gSSBmZXRjaGVkIDE1YzgzNDNjMTA3NTFm
MTYyNDhhYzFiNWI1ZDFjYWQzNGI0ZTQ5MTcgDQp0aGF0IGlzIHVzZWQgaW4gdGhlIGFib3ZlIGJ1
aWxkcywgYW5kIHVzZWQgdGhpcyBjb25maWd1cmF0aW9uIGluIG15IA0KbG9jYWwuY29uZiAodG8g
dHJ5IHRvIG1pbWljIHRoZSBjb25maWd1cmF0aW9uIHVzZWQgYnkgdGhlIGF1dG9idWlsZGVyKToN
Cg0KRElTVFJPID89ICJwb2t5LWFsdGNmZyINCg0KRVhUUkFfSU1BR0VfRkVBVFVSRVMgPz0gImFs
bG93LWVtcHR5LXBhc3N3b3JkIGVtcHR5LXJvb3QtcGFzc3dvcmQgYWxsb3ctcm9vdC1sb2dpbiIN
Cg0KVVNFUl9DTEFTU0VTID89ICJidWlsZHN0YXRzIg0KDQpNQUNISU5FID89ICJnZW5lcmljeDg2
Ig0KDQpJTkhFUklUICs9ICJpbWFnZS1idWlsZGluZm8iDQpJTUFHRV9CVUlMRElORk9fVkFSUzph
cHBlbmQgPSAiIElNQUdFX0JBU0VOQU1FIElNQUdFX05BTUUiDQoNClBBQ0tBR0VfQ0xBU1NFUyA9
ICJwYWNrYWdlX2lwayBwYWNrYWdlX3JwbSBwYWNrYWdlX2RlYiINCg0KSU1BR0VfUk9PVEZTX0VY
VFJBX1NQQUNFOmFwcGVuZCA9ICIke0BiYi51dGlscy5jb250YWlucygnSU1BR0VfRkVBVFVSRVMn
LCAncGFja2FnZS1tYW5hZ2VtZW50JywgJyArIDI2MjE0NCcsICcnLCBkKX0iDQoNCkJCX0hBU0hT
RVJWRSA9ICJ3c3M6Ly9oYXNoc2Vydi1ldS55b2N0b3Byb2plY3Qub3JnL3dzIg0KDQpEbyB5b3Ug
aGF2ZSB0aGUgbG9nLmRvX3Jvb3RmcyBmcm9tIHRoZSBmYWlsZWQgYnVpbGQ/IE1heWJlIGl0IGNh
biBzaGVkIA0Kc29tZSBsaWdodCBvbiB3aGF0IHdlbnQgd3JvbmcuLi4NCg0KLy9QZXRlcg0K


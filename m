Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6018EC55184
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 14:40:47 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18022.1785854437638160169
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 07:40:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=0N5dmoLq;
 spf=pass (domain: est.tech, ip: 52.101.65.20, mailfrom: david.partain@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=txUVkDp1Mw4EDuwRMgAhAN3ecVY6m+sOJMnEgrtwePBgDnd2Au7zSYuLkoEivtsOsWQnebhPJf0gNlw1SMbLlVBRksU2Sl2CSs1puh9b24/+J5blxDQha0Zy8hibA2a1QFDcwA7hnjae9EM5TZY3m0MNQY7x87X4sVq2vkYvki7057ib08Uslb/NNv8QQyLA80OIjP9tld9gEhlXHdQxKHxsjT1BA8QoZbCZQJuw6j83yceLicT2ws9l7pEfImUcZI7I/hmGl5XiQ6h2Qdp7W7Cy2x7jD62skFPtNNfKL/CTTttdAh8/S7NXJ/9W+eShvLn8lpnfVtHHM3QS/ancXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byQ4fGyck37KPmomG4nRhwzshiOGFb7BvYyKqUHbm1Y=;
 b=TMZiY3b7d0eexE+nY5uQqOEUso9yM+6XdOPnQC3hxXO0o4wmNaEGmFWsfkD1yYyD1rpOZwYIH2Uy3pLeUy4/dqlA0gFDvRFmqqofxsvZuQYgDqNnEtpOWjLG3lcHhe8UNozSMnwFcV/7HG17SSOGN830/1Ub29QxWJAZdp+eiNGPZ+Efd+riieGs9Op+fALJ5MAdQeKUJ1eP1zWWgeIWfT3jSFddG9kyz/xHakBYPsJRm4aXYcY3yj0YFAbdk6i1jlpfotZ06evlSlsbjZm4nX2V85Pua3kUW0gORViJFibMmL/KR1tcyYvcC3oLCLjSWY28eve+4nO7jJ/7S/HZTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=byQ4fGyck37KPmomG4nRhwzshiOGFb7BvYyKqUHbm1Y=;
 b=0N5dmoLqAMG6tQ0wU8t+s7rll2acN7EbG4u1Ml3CErewb+rCJ5YNnWWl4e8TTuFsyBHauy8oYUvfTcVvP5UeYPUcES71Lgb449cvGEu6iRBOIsN01eAG2hf/uSPqGgxiTvHtRe2gKO1its9bDnJsY1G9uGfMnr5YVxee4GfebxXWZZfcmJ1zElbGR2HE+u8HIkeqmhIBjLCbaf3ueePS1KqLTldhD8ILYE/iZPUjWh7jZ/jYCpU8Ej/OhSRgBK21DOZbkjT+4TbbHYzhn7mEsnyC8pRsp8pr6X1n8PbeHKiNGfihu16NMDq5P93rvux8A7QtqMXl/8I9kowP8PCwww==
Received: from GV1P189MB3098.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:25f::11)
 by PA4P189MB1199.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:c9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 14:40:32 +0000
Received: from GV1P189MB3098.EURP189.PROD.OUTLOOK.COM
 ([fe80::f8f0:25e8:3614:ab76]) by GV1P189MB3098.EURP189.PROD.OUTLOOK.COM
 ([fe80::f8f0:25e8:3614:ab76%4]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 14:40:31 +0000
From: David Partain <david.partain@est.tech>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Daniel Turull
	<daniel.turull@ericsson.com>, "elin-upstream@mailman.lmera.ericsson.se"
	<elin-upstream@mailman.lmera.ericsson.se>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"paul@pbarker.dev" <paul@pbarker.dev>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>, "Randy.MacLeod@windriver.com"
	<Randy.MacLeod@windriver.com>
Subject: Re: [ELIN-upstream] [PATCH 0/7] Mark recipes whose point releases are
 fixes-only (2/3)
Thread-Topic: [ELIN-upstream] [PATCH 0/7] Mark recipes whose point releases
 are fixes-only (2/3)
Thread-Index: AQHdJBszJl1qw32riUy+O3Tlh8Uan7aN9i2A
Date: Tue, 4 Aug 2026 14:40:31 +0000
Message-ID: <dc83efc3a1190f4f79ae4bb19156bd6b35e38497.camel@est.tech>
References: <20260804141135.3779287-1-daniel.turull@ericsson.com>
In-Reply-To: <20260804141135.3779287-1-daniel.turull@ericsson.com>
Accept-Language: en-SE, sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1P189MB3098:EE_|PA4P189MB1199:EE_
x-ms-office365-filtering-correlation-id: f743ea61-2c76-44d7-9a11-08def23655f5
x-ld-processed: d2585e63-66b9-44b6-a76e-4f4b217d97fd,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|56012099006|10067099003|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 L8zfXzFsF3TpdrPp+7vQ7eM6IW1WOiSVWrjsBzxRfqhAXi/khG2PyHGVS7+I8PHXXW+jNSUIQ7s4ptU3cMNRDtW3zfO4NfzK6gz7YNotEFjsl6XQJT5lgLqdTAUv0CZyeOr4RNw0oEiW/qA7BINJyXrzKfOIyfb4rQdDPLHVbZ0el6Fp3tTaddF/jRFw7wiz952PuKzP79a3utqqorYsnGo96ASwP+y0k/qGab03st4y++DzItwjvjA5/bISrMFCO1jwRsNW+lASID9NdApnT7e+OAZx6CWa0jlRZ2Zaxw92YXlJXlkDmLZwSjaQfTs4L8zwhTYAfYXUBqhtDQPKdyE2LtdOfwQ20XRDqYJSRougHhZY6fy5i8l0El/AcrJrUN3w4nb4R1FvkEz3wQAyc3fmOgkov4lhcjT37KoCPu/0SgraK3XbKOKVLkfDRByNO+yY//3b9GGpkvLDPEXC3L5WhHm23ZBRHIvwxMHZbu2m/Z01voj5mAwPSa6iRhvxSogUPOdBpbgJzZCuE4DgDDJanmwG/e+FI4E7lPd8luCgQ/OSIoptA9GRB+PcjXQrfNPGJBnH1S52UuDueAuXBu/GX0KWur+3+EyZjj5CatFsbHywQrZR6QCOPEck2CFxYNGrbag4tSvJyYk0mYPFlx0iDzGT7VIgdZ+vVrpHsSSeNi1n2Vy6FLU0XF1dHJSA/oFBinwx/xQeA6/yDTTdx2+rzvIQtxij6iNrXql2nlQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1P189MB3098.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZFp3Yk40ZHRFckdMaVM5WkxGMysxWml1Qkp5b3FKNTNzaFNVNytTOUVOSHlp?=
 =?utf-8?B?aWVzRnFWSGczMVBYenFQNisvbiswcmxCSGVUS0pSU0VCSlkrdjBYRnJ5S0Ri?=
 =?utf-8?B?MjRPMzdKVHhHeXFVeTM4RWtGTlVaWkZTY1F2R0tveDZvVUxKSHRqaUtackVa?=
 =?utf-8?B?YmpKK3N4TGhQdHk1Zml6Si9BelZBSUl6REI2ZFkxaGlJbDVZWGlaelJzWTMx?=
 =?utf-8?B?YUR1b3Q4ZXNMQll1VjZwZkxGWFRta1ZyaDFiMVhyQXVUTTNTWm02QlRKa3pZ?=
 =?utf-8?B?OHI5UjhlWng5SkNxcXF3SjRWSjVrQXRWSnZMZzcrSDZma1d0TFNBb1lHdm9N?=
 =?utf-8?B?eTZzcnhSOTh2U28rR01EMWdERVRhTEQ1MnAzZThPSTQ1R2lrMWxtN25lSUNT?=
 =?utf-8?B?aWJvSTNENk1hRHlTY1pwZFVza055eE53ZmM0blpsbkNvcDJrTTlVSExBSjF5?=
 =?utf-8?B?eFdPd0dKWjlnOEgvZkZWZHpIUmk4S09PMTRKdzhQVFYxaWNVY1hJbkd4UTdu?=
 =?utf-8?B?VWhYMmVtM3VpZ2JmNnM2dkZZeUZwTTRNQlYxd0h5OS9MNU95TkJOeTNNbm1n?=
 =?utf-8?B?Nk5MdHB6eEIwRFhFN1hIM1hRaVJlaXVESk9UNzd1TkJoYjJ1OGRKTG9Cb043?=
 =?utf-8?B?cUh3T3BTdmVFOStyaUpBK2dQS1pBaldSMHhqcjdkR2JYMHJZcFlWZDN2RGph?=
 =?utf-8?B?QUVUWnV4WFQxblRUTVhOZGhvRk5RNEpSRVRXNDdtT29tdU1Tc2hBcWF3TTJW?=
 =?utf-8?B?cHV5OHRWSDQ1TTE5ckJ0d1JKdVF4NUlUTVRWOG1BY2tSQU5mOXEwWHFXa1VD?=
 =?utf-8?B?UHV0OWhQWDRyQmJhdEV1UXRjL0xOR2VQb2ljQ0hRSDdnenV5bkVhdFNZbXFN?=
 =?utf-8?B?eEhpTTY3dHpqUVRqZlpPcS91ZWRsb1RVK1pZbXZWR2k0M2tkS1VhZUZBU2xp?=
 =?utf-8?B?SWxHaGI2ZHlUdXl2ZjBObTBlRVFRZFQxUHMybnpjNXlVam5NdVp6ZldzenRj?=
 =?utf-8?B?MFZ5bTkyK055Q2lmRkRrQnNsTHJlbHVwaEczTXRVWEw0VjM0Szl2Yy9zbGZk?=
 =?utf-8?B?L0NyckZLZW1ZVVZHb2lSaXdybm84ZDZBTC9NQVAyZVNnWFR4Wm5ya3NvSHRl?=
 =?utf-8?B?MzFLWWJRS3BSOGcxQ3huZFFGRC81N3JuaGVoejR0dHo2NXVUUVQ0L3hNb1pM?=
 =?utf-8?B?ZDRDeUJwRVUvbTNKVHNtdjBtV0p1L1ByVlFLYVdhcDZHWXQvS2Z0S0JxSlBY?=
 =?utf-8?B?M1YySTFMeGl3VkZxc21UdWhTUnJ3Vmc3cFgzbDV5WHJ2ZGhnZERyYW1tNFhP?=
 =?utf-8?B?Vk9VeVdqcll2QWtPZEkzUmxDQk5uSVQ5ZnhhUENIcmM1MXV3RFVTQjRjZVJz?=
 =?utf-8?B?YzFsNSs0Z0txdnVPMW5NOG81M25KYXB4YmZNZ2llZEhhM2JtWER5ZGNGTWE5?=
 =?utf-8?B?QVVDUjREVDFiSnAxYzlIOVBnY1lmdTFlTzAwQnRPOEdtNUlwU1UxZEJ0Nk1M?=
 =?utf-8?B?cVhoMGEwZDRBV1hqM3ZsUTNCSlUyTnVjejVJeUZIVkpEMWNnOUt2OExUakY1?=
 =?utf-8?B?b3N0T0ZDN3h3R3hwbGN5ZFpBSm1jcVlaOXo5NHJOZzc1cS81UnB4dmQrSklU?=
 =?utf-8?B?TGluQ2hzTFhZaWFScHF2ZUFNVW1ISmdHS1kwMnUwWjBRVjdYSzdGdVBwUGVZ?=
 =?utf-8?B?M1VINUgwWGd4WU9VVTdrYmttSCs0aUlvN2l2YSs4Q3lPUkppbUZzV2JzUmRJ?=
 =?utf-8?B?WmVLSzFsTkdtcncxYzZjenptUDlUSE1aZTlCUGFlZ01xRThUaHFsT1ZCVFBs?=
 =?utf-8?B?N3l5d2dBZkF1MlFlbURkWmNPdklzTE5vQmlwVGJ6Q01GdFk5cW5aRUMwOEU3?=
 =?utf-8?B?TEt2YndtSytDeTZkY3dvOFYxVWlqRmV2MDNxVmtDYlZIYnQyaG1kRm1vVkJz?=
 =?utf-8?B?ZGxHQkZEZXlTd3pta2FEU0dQbnl3bDZsVXNlUUJrM0pGWktPSXEvMnczck95?=
 =?utf-8?B?bUVpakJzWjFoTUlyNjliU1dobzNCNmR2NFVJSXpPSzFQMFBBblUvbnFHbnR3?=
 =?utf-8?B?MUVlbEEwTHBrRk03YjdhMkFhQmVFZDlnUXBlTUZQSXdsZXJLR0YrQlMyS2Rt?=
 =?utf-8?B?dkUxb213U2JlOEMvUmFBQm1HZHhIc2wvd3MzK0Z1VFc3aHpFQ1I0aE8yNEc5?=
 =?utf-8?B?VDVJRkxvL005QXZSOXppM0hTRGdDUnJMYjBGTnVIeHdTUllvcW1iVG84Q0FZ?=
 =?utf-8?B?c2tNcXBpNmNOVTRuQW44d0dReW5aZEhBTTdlbURpREpCRmUzZzVMbEhFamxv?=
 =?utf-8?B?YWUrQ2tRTFU2TWpnMVNSQjB1RlJBdmY4RUNqMVZYSGRyUlVlOEVWcEZraEE0?=
 =?utf-8?Q?L0O8hupT6sMPIY9s=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C46696679112CA4CB89FDBF2F963A295@EURP189.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1P189MB3098.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f743ea61-2c76-44d7-9a11-08def23655f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2026 14:40:31.7110
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vKbz4D9Qb3it35pfDVHbSxxeQ8My3uoV3hNtNHmIZ8WXc9/nJamNcmSkxj4D5fOMDrmI7tBz9cVkQqPqSxlYkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4P189MB1199
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 14:40:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242774

T24gVHVlLCAyMDI2LTA4LTA0IGF0IDE2OjExICswMjAwLCBkYW5pZWwudHVydWxsQGVyaWNzc29u
LmNvbSB3cm90ZToNCj4gRnJvbTogRGFuaWVsIFR1cnVsbCA8ZGFuaWVsLnR1cnVsbEBlcmljc3Nv
bi5jb20+DQo+IA0KPiBTZWNvbmQgb2YgdGhyZWUgc2VyaWVzIG9wdGluZyByZWNpcGVzIGludG8g
VVBTVFJFQU1fU1RBQkxFX1JFTEVBU0VfUkVHRVguIFRoZQ0KPiBmaXJzdCBjb3ZlcmVkIHJlY2lw
ZXMgd2hvc2UgdXBzdHJlYW0gcHVibGlzaGVzIGEgd3JpdHRlbiBzdGFibGUtYnJhbmNoIHBvbGlj
eQ0KPiBhbmQNCj4gaXMgaW4gbWFzdGVyLW5leHQuIFRoaXMgb25lIGNvdmVycyByZWNpcGVzIHdp
dGggbm8gc3VjaCBkb2N1bWVudCwgcXVhbGlmeWluZw0KPiBpbnN0ZWFkIG9uIGJyYW5jaCBzdHJ1
Y3R1cmUgYW5kIGNoYW5nZWxvZyBldmlkZW5jZTsgdGhlIHRoaXJkIHdpbGwgY292ZXINCj4gc21h
bGxlcg0KPiBjb21wb25lbnRzIHdpdGggd2Vha2VyIGV2aWRlbmNlLg0KDQpUaGVzZSBhbGwgbG9v
ayBnb29kIHRvIG1lLg0KDQpEYXZpZA0KDQo=


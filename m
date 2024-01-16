Return-Path: <alexander.sverdlin@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 667AFC47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 07:54:33 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.70])
 by mx.groups.io with SMTP id smtpd.web11.7857.1705391663178236869
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 23:54:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=fPUtOi6X;
 spf=pass (domain: siemens.com, ip: 40.107.14.70, mailfrom: alexander.sverdlin@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SLRP92Tbb90WxVOr9o8qsxQDGMzbdGPfIr5AovYT0A28f0gap2KMvqQohACN4cWE/FSR/7sQ4xxNZil6Tw19lZIySCGEkrK1W2nlKa4hR1hFObJz8V3r5Xa6goS9ZiHTVsl3/K6hjqSv8FhFIlHIMNc3nu41FZaz5iODW9L+iQXZv8HBVg64BJirXQ7O3w6/HYJ6hNUg/e/dNDiOx7q70SqHhmhVxTRw5gf5fbL9uDmhfbHy+Dwbxk49B0JuefhLSaBZUX6bKGc3chW+J7gyU6MmfDJTh6jXvqaE3X6pHc4JJCSPn2jWAW8+JDEJO6ZzfMC+gctV14SwxzJzaWgkqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CWtDUkUyTy+pXETpA/14wz0ND7O10oS7KalT7c7qxI=;
 b=m3G+kqgnSsTV0e/ZXO8d9W/BievoCNfMJ/BQ5+30gBl88SADAhuXJoC/gTjnaxEPg7h+V9CvrLacBbtJId4wZDPAMNIf2tOvapAT7KnqEaQqZtGYLL+UjbpPoFiYHUWyFGkTu6eI+lAuHOQuJs0+T2gn6LJ4FkijMi+9rBBSJaNX5v0ZyHybpg5B2y9sggCIAbqU/L9uAYdNRCRKa6fQV51G/IHUEVIgd5ppywL801ihX6fXfFem9TQRwGpIg6CvPDmhkRBzLSzQ0WrTBpnJukjK5KIJuU+NDfT+qvyRBuSf7gkk7vbd/tf/6smFZXq66uSSnwcuLHsvVyY9yUIaaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9CWtDUkUyTy+pXETpA/14wz0ND7O10oS7KalT7c7qxI=;
 b=fPUtOi6XL0MyvzD3hYt1cEpE7bdVdwtoulW63nKdDvRz/GDBkaPcqUboS3nDsbMIAXkwQzsMMcjej6K6qp/zBvt836ixhHgYZGdaVp1kpUUaJKFVOTeLrkDrPxSMKhmS1czGAjzj/YZWRdmVrk9Xlt9pefHgnq7XddxbAXKZrvtFRKdKdgYYCVyiRae/IrNSir2T2ZsWXsrP0f1bny4T9YaAnY/vJD6s31rI4zZq5ii5ymn6ykBVeEbBjBUwHvOonxDupYIPtSJflf/CBqfzr4/057CzLlszgoB/8NbHpuAPCUJmhNu3dl0mhhSemVaBaHTH6h+bRA7IoZv+jQBgYw==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by AM9PR10MB4086.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1f5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.29; Tue, 16 Jan
 2024 07:54:19 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f4e3:6357:166f:b46b]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f4e3:6357:166f:b46b%4]) with mapi id 15.20.7181.026; Tue, 16 Jan 2024
 07:54:19 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "jamin_lin@aspeedtech.com"
	<jamin_lin@aspeedtech.com>
Subject: Re: [OE-core] [PATCH] uboot-sign: support to load optee-os and TFA
 images
Thread-Topic: [OE-core] [PATCH] uboot-sign: support to load optee-os and TFA
 images
Thread-Index: AQHaSD6d4zRiFb9ZQkqtV4y7H/Si3rDcEewA
Date: Tue, 16 Jan 2024 07:54:19 +0000
Message-ID: <8f804eb9fff6b055a4d53198fa4553242e1204af.camel@siemens.com>
References: <20240115075416.393025-1-jamin_lin@aspeedtech.com>
In-Reply-To: <20240115075416.393025-1-jamin_lin@aspeedtech.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|AM9PR10MB4086:EE_
x-ms-office365-filtering-correlation-id: 30a4ae9e-9c13-479b-67af-08dc1668588a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 M7GKrbtPOkQ0PTqxokuqib7BZq0tgf2HjIZCTI7TjUxKT33BHpSfq92OW+9olKo8+ehhQIzZTKCNQWhfYf8enfRGEBElhdNc1aRLdV/559LP0IFlGm8RzBjHZ/wDiWqxj35eYXcKgANX0o84wXRhNlCZtMUNj4jbxomBRworH5v6NmrFZUJc8V5BYfVy4g1qh/QgyBTmk9JUnnrSYsoIB0HSkORBqxy3itZIIe0bTRlssfsXRiyuk1qqWLQkmcG05PxggYYrrPyB4wS9BC8IvRIYKZrZ3TTgvvTB+r6c0ZZV/FzqpXCkSCYGiypFil3oXtOlSMvTh0dklKrm76v7eTHtMAcc8Ru9bmdtsFj4d4HX04sAZa/NMwNXssKijgbNTxg4/P17da9808T8i0nD5a+f/TPQuD2JuGyME/FaVQp6skh5PLki4mNZSRls/BGqu36zL/mkCxyYGFCABkkQKFUGjLl9UeoYAdpuZLoxFrjMgEZThMN4uTDP/NJnSncf7NdQzmmGOoRQ8JA0MX75Afu1JqaHWYEWDeEY+YSppb4fjIf41kVrTs1UkSLqyngB7oxgwUH7GCsrjen6e4osxeaHTfA07fv0LUTuMVWbpVuQF/BLYHx2LupZKazaK5O7RdvOhBrg+ko2Aeehulgksw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(396003)(39860400002)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(122000001)(2906002)(41300700001)(15974865002)(36756003)(86362001)(38100700002)(82960400001)(76116006)(6506007)(64756008)(66446008)(66946007)(66556008)(66476007)(55236004)(8676002)(8936002)(316002)(6512007)(6486002)(71200400001)(91956017)(966005)(478600001)(83380400001)(5660300002)(2616005)(26005)(110136005)(38070700009)(18886075002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?V00wWkhsdEhKT1VRTlo5OEZZWjc3bzdvbUlqNEw4ZHNrRk5ZS1lnSWtxdm5I?=
 =?utf-8?B?NW94SlhYZjNXNEtVU1BTblZoaDAyUHF0ODI2bjFPRWdWRjlGdVZrdkRRRW80?=
 =?utf-8?B?N0ZyZENsQmYvcHNSandjNjdyNkJHS0psL1RSTmdQazh2UVExazd6UXZJazFx?=
 =?utf-8?B?Z0s2L21pVTNFcjBSODczNGR3WWRxK0xxSG4wUGxqekNNcU5RdDVDVjFzMlFX?=
 =?utf-8?B?dHRNUmV2cFlGanpRRnc0WGFVMFF6cWUvR0RWY0FVR1BjUkxnYXNSYzlTc0hF?=
 =?utf-8?B?elAxL1lBY1M4QnVZQUF3cGNBcEdjdUFUSXZ0TDNzcmxoSTh3Y1Q2aEg2N0ZG?=
 =?utf-8?B?WWJRUGxPbEhnbGlldldRTlQ5U0xZNndZTVpJS0VGT3VWaVRHaHpuUURNZFV3?=
 =?utf-8?B?OUJ6RVAxelhaY2lERHZRcEIrL3E1bnp3aHFIKzlJRWJrc1pTdGxuTmZ0K2Mr?=
 =?utf-8?B?YmtlQjZvY1hCWkt3S25PSWpKMnJ5OHdyaWU2UVl6cDhPSXFBYTVBK3ZiR2Vr?=
 =?utf-8?B?R2xCS1JFZ2M5TTQ2ckpVbGRoOHBYdmhOYWVlQTlHWWsvcGpPMkhkdm9MNnFU?=
 =?utf-8?B?SFJRZWpNZklDc2x1WFZLZWVzSmtVTkZYNWtuek9ncXFFaGtDU1hXVGlNcUU0?=
 =?utf-8?B?cDZkYnJUQUs4KzBFV1AvakJpRmxydGJiM3hqVzJKaVRBa0RVLyt4WmhyTlNj?=
 =?utf-8?B?cTI3N0w1ZWViUWkrbzhqdHJqOHdKWnBLT1Z0cWlBLzdlTW1ocVlVb28xdXpr?=
 =?utf-8?B?Q3V5RDVRN2h5a3hTeWhpNFgwSVk2VWtLWlVWeE42VkNGL2VKTVlmd0RoNkt5?=
 =?utf-8?B?UHJnVno2UDFETG53SjlJSXFtem1pUEhqTEI5S3FVNmlwS0xEbnA3WHB1WHRw?=
 =?utf-8?B?aXUwQ1JmSWRkaUVkRnRQU0srSlh4VCtTYlZoV1FtWTZ2akp3OTRJRWRtbFdx?=
 =?utf-8?B?QmY3Q1A2MGhxYkxPWlErK1pJek41TVA3bm95U3BPSVovOXZCeko4STVBaE9q?=
 =?utf-8?B?bEhyMm1BSlJFdTNPSDg3b1o0d0VSWU42RHh0WlljT2FhR3piVTlzZzJXaEV5?=
 =?utf-8?B?bUJOdmNlNkVQVis5bldCYjMyaU1mS1Q4NlBWVm5ZczJaMGlneTBUYm9VSjJ2?=
 =?utf-8?B?Z005b2E2bG1LeEtrdDRRTUxxM0VWald2a0RwYlZ2aVNvTDFlZzNyK0MrVWdE?=
 =?utf-8?B?S0pnTHdkdnFGd1NlNFBsWGh6WXlHeVFzY0ZKbHJNeG0zYWE3Zmh4QzQwNjJ0?=
 =?utf-8?B?TUM2eDhlb2ZRSVAvSUorZ3ZRMGRTZ3B5UXlPNlJ5azJydDRrNGhrN0czelFl?=
 =?utf-8?B?QldjWFI5d3ZOTmVtU1lXVDBDejRtT1RwVkRwdFhJMmZkNFBTQWh5aHF5YjVE?=
 =?utf-8?B?VVNHbVRQTUZDZjlvSE5xcVZKcHkxOVN1UHgvNnZkaXlLMmFmTGFmQ1ZSNjlZ?=
 =?utf-8?B?cFhPQVVuaEc1dFBwN2Y3bmxTR3RWcm5SVFovcWhsSC9iN25xWFMvTG9Yc1hs?=
 =?utf-8?B?RW84MFgvQ09VTWFMcGpyVEx5dVJ6U0xDTlhDYU05R2plSDg0andzZkVZL1Bz?=
 =?utf-8?B?ZE9mNUJqL1BWMHJ5bExZWUh1UlNuN0tWN3JUazd3UTNFajE4S2dTcWFuVXh5?=
 =?utf-8?B?V2tjVXVLaTRML21zTHE4NlppQit6WitOMnA3elRoZ3l1WU1oU0RoT1hxdVNL?=
 =?utf-8?B?RktjeGxFM0Jmc21MUzM4QzRPQnBnc0dYV1BycVF1OHl6WXpBRlcxeTFFYlg2?=
 =?utf-8?B?VHUvY2QxQ3p0TFA1ZlkybHVpZEN2QUlBdHdzZDlUT0VaTUtzd3E0Q3dpdHlU?=
 =?utf-8?B?aFR0SExXS3ord0c3YTAzcTQyYzhIVGluaTF1YWlPYkNJcjBOWDNzNGh4WDN6?=
 =?utf-8?B?VGhOV1d4U3lNbi9BZUJCR1lSU1g4aWpvQklmUEdVVGtyYmV3Z1lTVEVIV1p5?=
 =?utf-8?B?dEw2cVZiaVo3YmNJdW1Cb0ZOUDhMTE50RGxXY3RQVC82UVFkTG9yQUREQmZi?=
 =?utf-8?B?eXAvbjhuZG4rUDlCVzVPT2ttUnFZVWFlaGQybm1LcHBKaTZsOEREVjk3TXFr?=
 =?utf-8?B?Z1NoWTFmUGRjZ3kyQ05vandxWmVuMkFNSjBDZVJGQnBpSG5QSmNGOStjRThL?=
 =?utf-8?B?VjhTNVhIeXYrQTJCeFp0U1RlcjgvVjZpVDN4SlExN3FpMkJodWY3Vk02YTAv?=
 =?utf-8?Q?EcDPMzF+c/fyG6keC6psvBA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <472A8BD7141DC84F859F70975CB8111F@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a4ae9e-9c13-479b-67af-08dc1668588a
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2024 07:54:19.7201
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iJFDo2ovtrsMmI3Uf+ToUjWiCfCSNRpsO0fUvbaZI23zc14buXwCV6g2Y+uoONN2uAWqrdrBHr6p0So2qH9vY+tFvINp9PRIO3aeE+PC08I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jan 2024 07:54:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193820

SGVsbG8gSmFtaW4hDQoNCk9uIE1vbiwgMjAyNC0wMS0xNSBhdCAxNTo1NCArMDgwMCwgSmFtaW4g
TGluIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiBDdXJyZW50bHksIHUtYm9v
dCBGSVQgaW1hZ2Ugb25seSBzdXBwb3J0IHRvIGxvYWQgdS1ib290IGltYWdlLg0KPiBUbyBzdXBw
b3J0IG9wdGVlLW9zIGFuZCB0cnVzdGVkLWZpcm13YXJlLWEsIHVwZGF0ZSBJVFMgZmlsZSBnZW5l
cmF0aW9uDQo+IHNjcmlwdHMsIHNvIHVzZXJzIGFyZSBhYmxlIHRvIHVzZSB1LWJvb3QgRklUIGlt
YWdlIHRvIGxvYWQNCj4gdS1ib290LCBvcHRlZS1vcyBhbmQgdHJldXN0cmVkLWZpcm13YXJlLWEg
aW1hZ2VzDQo+IA0KPiBBZGQgYSB2YXJpYWJsZSAiVUJPT1RfRklUX0FSTV9UUlVTVEVEX0ZJUk1X
QVJFX0EiIHRvDQo+IGVuYWJsZSB0cnVzdGVkLWZpcm13YXJlLWEgaW1hZ2UgYW5kIGl0IGlzIGRp
c2FibGUgYnkgZGVmYXVsdC4NCj4gDQo+IEFkZCBhIHZhcmlhYmxlICJVQk9PVF9GSVRfT1BURUVf
T1MiIHRvIGVuYWJsZSBvcHRlZS1vcyBpbWFnZQ0KPiBhbmQgaXQgaXMgZGlzYWJsZSBieSBkZWZh
dWx0Lg0KDQpIYXZlIHlvdSBjb25zaWRlcmVkIGxldmVyYWdpbmcgdGhlIGV4aXN0aW5nIGJpbm1h
biBpbmZyYXN0cnVjdHVyZSBpbiB0aGUgcmVjZW50DQpVLUJvb3QgZm9yIFRGLUEgYW5kIE9QVEVF
Pw0KDQpXaGljaCBwbGF0Zm9ybSBhcmUgeW91IHRlc3Rpbmcgb24/DQoNClRoZXJlIGlzIFRJIEsz
IGRvY3VtZW50YXRpb24gYWxyZWFkeSBbMV0sIGJ1dCBtYW55IHBhcnRzIG9mIHRoZSBuZXcgaW5m
cmFzdHJ1Y3R1cmUNCmFyZSBub3QgVEkgc3BlY2lmaWMgYXMgSSB1bmRlcnN0YW5kLi4uDQoNCj4g
VGhlIElUUyBmaWxlIGNyZWF0aW9uIGxvb3MgbGlrZSBhcyBmb2xsb3dpbmcuDQoNCltdDQoNClsx
XSBMaW5rOiBodHRwczovL3NvdXJjZS5kZW54LmRlL3UtYm9vdC91LWJvb3QvLS9ibG9iL21hc3Rl
ci9kb2MvYm9hcmQvdGkvazMucnN0P3JlZl90eXBlPWhlYWRzJnBsYWluPTENCg0KLS0gDQpBbGV4
YW5kZXIgU3ZlcmRsaW4NClNpZW1lbnMgQUcNCnd3dy5zaWVtZW5zLmNvbQ0K


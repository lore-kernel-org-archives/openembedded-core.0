Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8417FC3DA4A
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 12:16:37 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.19])
 by mx.groups.io with SMTP id smtpd.web10.58492.1723119393639405772
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Aug 2024 05:16:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=rrGndN2Y;
 spf=pass (domain: axis.com, ip: 52.101.66.19, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RpxjPZtMdbNayj4fKsGNKAEO8v0j4PKu0uD5Sx73hGXFMeosppjw/MFoHxD/WRbb3vO+Es3KP28bDoGOgMdnwLYPH0vR7lZme3heywbTpvyl/aebFuprIbjJUsfqE43+Mh5k2B99hIWtJqv6D7jIm+VVMUJTpo7CDS8UG7gupfjRXFSlXECq+9WMyWbHpa5+YWVc0+8LpwsHWWJ7rMVZN0PBrp317tKvUAOp+wsp9o4BpZvsq40tcxmCR2+HTa3rgl+o/j64w4hpiVz+lpBujcgnl0Af+6kjjOQlwAEiV4t5wzdn/ZKbV46oR8vTGZy/GzqVzjoPkDKpWr8xFI6t3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9RDyoiEX4CeqHz82t3zKZ+KkoefhIQKhp5jIqZoRuNY=;
 b=c+eH57lvWtBnKKY/if56UD+Sq8WUPSfvYUzek9zcZHzxWCi9RqAkWNMjM4LJjbAfR+C5PuqoP1LfaIgPgHuLNTbfGUSIsTCim8QcDiXeOXQrfgozGMDgAXy7bnT0P0ZG89qdXUNYCq7D3ioS9+jgJ+FTxOAGjKKmYRV3ZdPsYqjGBK+oxPZTCxoo8l3RduC0UuGzRGKz1FS/ZwuIyGFJ/KMyX0+wI4Q0jCm8KumNOzhg3UQm5aSWjO7RiNG9RbZxvo7XuBp5HSwOmbwtWKB7VmpXQwXNJ/vruMWo8s0l9dVJrmxWDk97gMZ2TeCpbvjcU+0SR9KULn8ZGAZrpjd2tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RDyoiEX4CeqHz82t3zKZ+KkoefhIQKhp5jIqZoRuNY=;
 b=rrGndN2YAgNqnr7UTOhnVesNJW48X9plQWId1Y9MQ5mFJcs2PtYkAfJZQCFy7cZRyv6mZ0u1EqfDxom5o2fRr5bdrHOKH/cB6kJIFLmfgcwc2sJlEu4CIwHxPfyUOzkp0THbObbYFZlhnKHfRs4BExRj4On6A/zXMub7Uz5bNys=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PA4PR02MB8193.eurprd02.prod.outlook.com (2603:10a6:102:272::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Thu, 8 Aug
 2024 12:16:29 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%2]) with mapi id 15.20.7849.013; Thu, 8 Aug 2024
 12:16:29 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: =?utf-8?B?RW5yaWNvIErDtnJucw==?= <ejo@pengutronix.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "yocto@pengutronix.de" <yocto@pengutronix.de>
Subject: RE: [OE-core] [PATCH] archiver.bbclass: fix
 BB_GENERATE_MIRROR_TARBALLS checking
Thread-Topic: [OE-core] [PATCH] archiver.bbclass: fix
 BB_GENERATE_MIRROR_TARBALLS checking
Thread-Index: AQHa6YLSHQ6oWQPhDUSNAa0T2zqLx7IdRgDw
Date: Thu, 8 Aug 2024 12:16:29 +0000
Message-ID: 
 <DB5PR02MB102134D57C3C7A57E7D625679EFB92@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240808110409.4077831-1-ejo@pengutronix.de>
In-Reply-To: <20240808110409.4077831-1-ejo@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PA4PR02MB8193:EE_
x-ms-office365-filtering-correlation-id: b498f2c2-766c-4457-a51d-08dcb7a3eee4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?RDFQMFFVWVlCRHhrcDlXZFNNSjBibDVlMW1ldVorM2RVUTZHY21uMmczdGg3?=
 =?utf-8?B?L0M1QWVIdHhTbWZ3VzllWUZ3TWpRakd6VXNRRHphaXBodkZDTXFlN3lQV2w4?=
 =?utf-8?B?RHRsem01K0xxSmdsTUVUcDNQaTA2MThXdDNselUxWUhRL0RXWTR2QjQzQUxs?=
 =?utf-8?B?RjhoWDdZbzJUWitGTlp1bTluZTZlK0ZRemF2SDZ4NEdRZnFPVlJ4b1pZajVD?=
 =?utf-8?B?WlYwclU2SDJJUm9MeENrbyt1N0N3ak44NUlCOXMvSGUxNHZUNUVvR0pBRTE2?=
 =?utf-8?B?dTBydFJQRzlLZ2djanZNcTY2Sm1iK1VnU3YxeThpcFBjc3NPck5vS0hmNUpU?=
 =?utf-8?B?b2V6dkhra1NmL1N4VU91Q21CYzVJVnBZclB1dGRKYW10Qi9HNy9kMnAzRHJG?=
 =?utf-8?B?SEMyZzV5bGIvUEx2VzFIclFmYkNmcUdpMERFdENjak9VNlY4Rk9aRUIxZitB?=
 =?utf-8?B?QkEwKzRxK2dSdE5KemxsclJNR3ZFb1YzYUsrRDBwcll0b0ZBejF3UDRzRVF0?=
 =?utf-8?B?NVNocERMSFlpYStQLzdpUHpvKzlMTE56cUlWcVlBQUo2Y1krOTljSjlzVDln?=
 =?utf-8?B?cmhKYmFja1krZVovckMzdGRxdk9SRTFuWm80ZFYydkdURVBuZml3eEJ4SjVS?=
 =?utf-8?B?Vm9GWTQ2eFcxZjNPbFM1VFZnY0VYWjdYS0FwOEVITlU1NlhJbzNyeEFkUHU0?=
 =?utf-8?B?SDh6V3JpWmo3cFBkU1JtM0czc01NMGdRMEI1RE5lVnk4TkJQSjNPcXZyM0xY?=
 =?utf-8?B?WTNJeWorUGdZSU83V25FazU1NTJXZEFNelFwai9kN3d3L1ZQQTZCTkpDZ29j?=
 =?utf-8?B?Q2l1amttc3grYmNBN1hBT1lPdmFyakpzUWVqT2hTQVFzQTdoN21FTi9PSHQ2?=
 =?utf-8?B?ZDg3c0lmU09zckVxR2tMU1phQmNoVk9QWXRYUXRsNWRRSXpzZi9IMEFBaStT?=
 =?utf-8?B?dDBlbHM5WGFFZzdyMEM2M1JrSFg1blRMaTlTcUdTemFqVSsrZ2QvRUp0RkpM?=
 =?utf-8?B?OVRpcGJKWFpPaFZBLzVpcWErWVRkTGl6MFpPTDIvbUhXRGwyQk5hQTJnSWdF?=
 =?utf-8?B?bkJpaGhFUmxud09tRUFYVVVqdGtYdmIwVG1yaXgrb0R0eGJGL2hrajZSNnZs?=
 =?utf-8?B?M0x1dTRnMUQ2M0RtNVA1SzJvRjdxdU9seTBsVG5ScXI4WFQrNjhFaVk4empZ?=
 =?utf-8?B?eGpVUGtTdGNzSWMvNG55aWRGMko1RkF3eVk1dzBDc1owMmtUWGgzcTUrYnZQ?=
 =?utf-8?B?NjF2UnYwRE5pdkdqcFg3ZHFNaXR4dXNZVGwvVnozYlQ4TlRCY3NkRmkvRTBZ?=
 =?utf-8?B?Z0xjYjRtdTZLRTBTQ2NNamR1bkt4K2V2Vk9SRmQxVUFtVGFMczlXQ1h1SUpj?=
 =?utf-8?B?VGRMZTFwTzczZTRyTzhWbVcyeS9vdS9Za2VOaXV2SVNOOHRSdEhBNm1vYU1B?=
 =?utf-8?B?VUYrKzE4MGh1djRHWG8wQ29SYXpMQXR5ZlcxbWhJUWtuOCtPVGRwV1Vsc1Bh?=
 =?utf-8?B?a25zdzY0bjN3NmYwakN3UUp6cUxXTWo0T0tHcEw3YWE1ZS8xOEJqdmpaaUty?=
 =?utf-8?B?a0p5TjdLajQ3OVE3ZE5MdkpBd0RjUkZoRy92YXJzUW9SV25HakVwejRma2xi?=
 =?utf-8?B?NFV2bnhOajJvVGsxUHYxQ2FpcEdVTnhOcFJPVHBKN1BNQmJwQng4a3lKVTZr?=
 =?utf-8?B?NnN5c1RqTzh0bXdyczZ1czRhN1o1eDdJR0Q2Z1Fsb3orNWE0UWM3cTduYm9S?=
 =?utf-8?B?WGlHQS8rYWxRTkVtaXY3ajlRcFVmQTVPaThTbk9rL3lXRnRZUEhWSy8wMVdS?=
 =?utf-8?B?Ulg2VFZiMU5Zb1I1MGtab3J2YWRabHgxV0VOVUpiU0VVNElQYkV2eHJVR0p0?=
 =?utf-8?B?aWFySkRQS29oK3lYaEI1VGdOV2Y1TjFrVEpXVVkzdk1GU1E9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YlNXK2ZKbTVOY1ZvNTFzVHV0UldvSllXRW1OdVNVdVJPYkRFSTNaUGdxSkFG?=
 =?utf-8?B?cUJINFNkUHl3N3AybCtFa0kzdHFySDkyNUZWM2d1YzJvNlcxQUNxOGFuQVVx?=
 =?utf-8?B?MjBDOEFkTjZnc2NWNEJCa2UraTNnanlWRHF3cnNHSkt4eXV3NWR4N1BHT0Vh?=
 =?utf-8?B?VXdHSjg0cndETTJqZVZUZlY5d2QzZGFoVkdwTzRvTGgyTjJObER5VXB4SWhG?=
 =?utf-8?B?L09hY3pHWjFqS1hVTVJWR1RxYlBZZzJ3c0RKNm9FZDZ6bjdpRzMwWlpieXJY?=
 =?utf-8?B?OXR1cFFtR2ZHUUN4bTZTQXVTZ2RONWNzN3dRemZSYVR0NXNURWx0SVpOa1gr?=
 =?utf-8?B?eDM1ck9GTkUyaFNiZGdhaWpKTEJvSEo2KzRXQ1pOaGVucWVQZ0Flek5Ta0FM?=
 =?utf-8?B?SldXaGlEby9VOFhLQVBqaTBNMnhTcFNsM0FLWDRaTG1VL29IQlIwUjlMdWdC?=
 =?utf-8?B?Q2x6bHNaUFZiRVBKT0hpbXY0NWtSU0VzQlZUVi9NL0hPRklmenhucDduQ1I2?=
 =?utf-8?B?Rkwvd1pnVitnc1VCS0tmTjVxbE92K1NNN0RteHdtek45SEFGVHVLc0h0ZUIr?=
 =?utf-8?B?K0t5MmNTWjdyOUgvY1cwOFFYNWx4T2tUTEtjY04wWW1UdmM1MEgwK1VldlRC?=
 =?utf-8?B?b01iell6RElUb0lUaHBoN2ZxMGRlS3Jmb2lncXZQSlJCNi8rM25ORm9ZZzUx?=
 =?utf-8?B?S2o5bkxpMXc1OE0vUkJJRUhjQXB3bnV1UGQ2L1ZkanRxTnV0c25CUUFxcnlW?=
 =?utf-8?B?eWFlM0xNVENHdC9DRktmOHExQ3dVSkJocTgwUE5nM2NXV1UzbWJKS3plUDcv?=
 =?utf-8?B?TzdrVitZL3JoTDhxOU9iTWF5bEwvQjBBSTFVYXBNOG5XRm9GVGljc2VPSUd2?=
 =?utf-8?B?eXpMbWthU0xQYktJNkRlN3dvb3ZmYitsemkybjZTSlhUdnNoa3Iyb2FubjlE?=
 =?utf-8?B?c0EvQzlyRkJXNW00U21Db24yUU9xM2FPR1BBM2VCaXFWV1VnblA2czlYb0lX?=
 =?utf-8?B?UnFUb3ZxMGtJWEdhZEZ6VkdrSTQ3WFBHMklUd0Y1djcvZ011Z0Y4QlVFVmlu?=
 =?utf-8?B?RFI1WjBjc3lvcFlwa0IrUFNOSlNEUjJleHJiSDQwSUpCakc4QU1US2VZVlBj?=
 =?utf-8?B?c3pHbzVCMFZEZ21nY1M1RTlud1F5citwcWY4c3gxL0NaSGk3L0JsckVDeGFj?=
 =?utf-8?B?MnFhNjIxc29WRnNCYjE3MkF1YnRzUHE3d1BBTEswYzBOdHBCdkYyREMwMkFa?=
 =?utf-8?B?NitjRXF4N3FFSUwzL0gvdnhpcWJzWnhMbkFCNXNIamN0WWNtVEJ5QlVTWnFB?=
 =?utf-8?B?UTdycnltN3YyeDVYMW5lZG1VSTBhYmNYVXJwZ3htN1dQbTJMMFhnRFphR0R3?=
 =?utf-8?B?R3VtYVFaZmhHakJxTVBKaXNhWlRLdmtXdlhPT05ITHNuMGJwcC9vVTNYcTVp?=
 =?utf-8?B?SXJCQnhLaUFyVjh3Q202MEJueVlJZFJhYTBPQ1ZNc013VXUvZzVYWFZOTkkz?=
 =?utf-8?B?S29DTDVvUFRleDN3WVlyM2pkN2ZXV1A3SzNuV2kxSWJ2QUdHU0Rmcm9EOTFC?=
 =?utf-8?B?RHpYd3E5dllrQjk5VFRjdHBZS1k1ajlsMEczTTM4THFiNlpOK1hUc2R1NDI0?=
 =?utf-8?B?Rm9aM2pDYlNEWnZxcnVhRVI1Q2V0ZW1FMmtTTmFqU1hnazdaZm5CVzFlVk41?=
 =?utf-8?B?amVJQXpxdGZIUWErN3RFakdsbUJiUGVkZk1WaVJVYktCdHl6WlVHU0sxcFRw?=
 =?utf-8?B?blFidVZXN3NiaGhGVXhVTnpjdndnN2svWVZVbUwwdXppU1F0UXE4MkRGUGpI?=
 =?utf-8?B?NndQSC9sWVFQbVFGWFdob0h6NUVjUGZiaXdrc2UycVp1M3hHaTRxcTNOcXQ2?=
 =?utf-8?B?ZG11aU5QWGJINjAvTkZPTXlQV2ExNkVzeWJQd3R6bzBpM3RVdGlpajF1UXNL?=
 =?utf-8?B?Y3hFanlWZGFWR2h0OEtjNFRHdGhGbE01b0RRd3VDN3hsTGhvWjBNRkJ0bEpC?=
 =?utf-8?B?TzJ6RFJoY3BSd1lZZ1lMM2l3bDZZb1ptNDVyN0pEdG00bGpCVkh6VFk5bDNT?=
 =?utf-8?B?Mld6eWJLek5PZVVMT2ZmdVJjT1d6T2F0Q1RJNk5mYlhKSG11OUxOYVZ0ZUU3?=
 =?utf-8?Q?034k=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b498f2c2-766c-4457-a51d-08dcb7a3eee4
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 12:16:29.5011
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MV6X6M/fAEI+K9cg45WpYEetJEZAqfSYGzD1RrOLnCUAy8tmJz0kQ6pENa0yxvGW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB8193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 12:16:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203136

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgRW5yaWNvIErDtnJucw0KPiBTZW50OiBkZW4gOCBhdWd1c3Rp
IDIwMjQgMTM6MDQNCj4gVG86IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcNCj4gQ2M6IHlvY3RvQHBlbmd1dHJvbml4LmRlDQo+IFN1YmplY3Q6IFtPRS1jb3JlXSBbUEFU
Q0hdIGFyY2hpdmVyLmJiY2xhc3M6IGZpeCBCQl9HRU5FUkFURV9NSVJST1JfVEFSQkFMTFMgY2hl
Y2tpbmcNCj4gDQo+IFRoZSB2YXJpYWJsZSAnaGF2ZV9taXJyb3JfdGFyYmFsbHMnIGlzIHVzZWQg
YXMgYSBib29sZWFuIHdoaWxlIGl0IGlzDQo+IGFjdHVhbGx5IHRoZSByZXN1bHQgb2YgJ2QuZ2V0
VmFyKCdCQl9HRU5FUkFURV9NSVJST1JfVEFSQkFMTFMnKScgYW5kDQo+IHRodXMgYSBzdHJpbmcu
DQo+IA0KPiBGaXggdGhpcyBieSBjb252ZXJ0aW5nIGl0IGludG8gYSBib29sZWFuIGJlZm9yZSB1
c2luZyBpdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEVucmljbyBKw7ZybnMgPGVqb0BwZW5ndXRy
b25peC5kZT4NCj4gLS0tDQo+ICBtZXRhL2NsYXNzZXMvYXJjaGl2ZXIuYmJjbGFzcyB8IDIgKy0N
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy9hcmNoaXZlci5iYmNsYXNzIGIvbWV0YS9jbGFzc2Vz
L2FyY2hpdmVyLmJiY2xhc3MNCj4gaW5kZXggOWQyODYyMjRkNi4uOWM4YjBkYWYzMSAxMDA2NDQN
Cj4gLS0tIGEvbWV0YS9jbGFzc2VzL2FyY2hpdmVyLmJiY2xhc3MNCj4gKysrIGIvbWV0YS9jbGFz
c2VzL2FyY2hpdmVyLmJiY2xhc3MNCj4gQEAgLTMzOSw3ICszMzksNyBAQCBweXRob24gZG9fYXJf
bWlycm9yKCkgew0KPiAgICAgIGRsX2RpciA9IGQuZ2V0VmFyKCdETF9ESVInKQ0KPiAgICAgIG1p
cnJvcl9leGNsdXNpb25zID0gKGQuZ2V0VmFyKCdBUkNISVZFUl9NSVJST1JfRVhDTFVERScpIG9y
ICcnKS5zcGxpdCgpDQo+ICAgICAgbWlycm9yX21vZGUgPSBkLmdldFZhckZsYWcoJ0FSQ0hJVkVS
X01PREUnLCAnbWlycm9yJykNCj4gLSAgICBoYXZlX21pcnJvcl90YXJiYWxscyA9IGQuZ2V0VmFy
KCdCQl9HRU5FUkFURV9NSVJST1JfVEFSQkFMTFMnKQ0KPiArICAgIGhhdmVfbWlycm9yX3RhcmJh
bGxzID0gZC5nZXRWYXIoJ0JCX0dFTkVSQVRFX01JUlJPUl9UQVJCQUxMUycpID09ICIxIg0KDQpN
YXkgSSBzdWdnZXN0Og0KDQogICAgaGF2ZV9taXJyb3JfdGFyYmFsbHMgPSBvZS50eXBlcy5ib29s
ZWFuKGQuZ2V0VmFyKCdCQl9HRU5FUkFURV9NSVJST1JfVEFSQkFMTFMnKSkNCg0KaW5zdGVhZD8N
Cg0KPiANCj4gICAgICBpZiBtaXJyb3JfbW9kZSA9PSAnY29tYmluZWQnOg0KPiAgICAgICAgICBk
ZXN0ZGlyID0gZC5nZXRWYXIoJ0FSQ0hJVkVSX0NPTUJJTkVEX01JUlJPUkRJUicpDQo+IC0tDQo+
IDIuMzkuMg0KDQovL1BldGVyDQoNCg==


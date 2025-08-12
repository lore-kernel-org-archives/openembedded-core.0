Return-Path: <y.moog@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 399A0C87FCB
	for <webhook@archiver.kernel.org>; Tue, 12 Aug 2025 09:58:43 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.93])
 by mx.groups.io with SMTP id smtpd.web10.70736.1754992714800523061
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Aug 2025 02:58:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=selector2 header.b=I7/vyCVf;
 spf=pass (domain: phytec.de, ip: 40.107.247.93, mailfrom: y.moog@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZmEbrh99flmmWz8juA11TiRHPZu16KSDTUgXstKtbQv+rjo4MoNAEkzHrYvYujefN6WxWi08A25REZ8NE2suxT+txT7huT1/t+1sHRYkNhIhz4pUV5gtQRLOjJS+08Sia212oQMg7AUHxJpjbEzywWTHrB6aoqeH4mlkAt5i+aXs41Trj25PAtEF53hr+pie4T6Aw9RC9NV4QMrXdqGgbD7GGUbNVsgsG8f+V8G/G5Uzd0Do+R6BfmMu8kvhJJDA/uXa6DyZSyqd8WLzUwa+bFTKXS+ArGlmr2cfb0wDqwcVRGYyMe3rT1pSvuqD2BBgylwjMxsGuCC0VRK6WkEhQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/et+5Fh8GQmG/K6ox5Bqn/gzXHB/tspQfs7Q+IBSRL0=;
 b=eTLV8536cc5Dwvil8nSVeCkueyaR4jPIBNqwvxtmeomDHcxizsiDblAU4d7P/dZXlFy8U+GqQCPkVIjOQEDj+VI6RRJxDEnU6tdl4MVqtlcQmR2W5yyp6fKlOKNuDBQNgyDPIYDDkcqEYddAcw5NyOS/3xm2uTV7i4Ukn0AEiWOBAoRJbHIf7nas4jI8Dzyhg0J8ZbVqfL0tmSnKZE6xF/ppOSJTIkAHfCRQS4a6jkuASNGQY73ZWFSP1FvPRiRWscIK1P/MZCxYsSf2HsI2QwORni5dlpdNjr3QNuNJhSWiBWNNX2JGzv3Y/qFkw8t4k1blf6IGCzfiTXLK/LERbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/et+5Fh8GQmG/K6ox5Bqn/gzXHB/tspQfs7Q+IBSRL0=;
 b=I7/vyCVfDw9l8qpTe9jHOu+9akqx5XX1j2uMXfqzFyerXUF4yhbYNFhCJCQq2zZfFs6GsdI1U30fsU767wWunlBBTK0o4qk4O9GgLNwZmEbmLdyOLbShG2b1llQwsZemjkuLwXg8GaKpgF6fHIuS5iz2zAry+R5pBgSUp1rUZ3PbMVXry/qyWtKMS1iq5DmTBFuDCJmbPZkVufqs4cbjxGEXh7S7iXhUULU3L+PsP/kNZ+TePCSnm6k2vFuL/YG7geLCSzQdrbqt2bgQlPqkmomCiEw443grwG+vkU9uxOukpK2fYE5bPPHaHm4CaJk8vNZuLCebcsoITOdfrxxG5A==
Received: from VI2P195MB2491.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:22f::14)
 by DB9P195MB1388.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:29b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Tue, 12 Aug
 2025 09:58:30 +0000
Received: from VI2P195MB2491.EURP195.PROD.OUTLOOK.COM
 ([fe80::4131:8d3c:f0c6:c414]) by VI2P195MB2491.EURP195.PROD.OUTLOOK.COM
 ([fe80::4131:8d3c:f0c6:c414%5]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 09:58:30 +0000
From: Yannic Moog <Y.Moog@phytec.de>
To: Martin Schwan <M.Schwan@phytec.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] arch-arm.inc: Only add -mcpu options if it
 exists
Thread-Topic: [OE-core] [PATCH] arch-arm.inc: Only add -mcpu options if it
 exists
Thread-Index: AQHcC26zforEJWyHbk62o7DHEheZZbReyHIA
Date: Tue, 12 Aug 2025 09:58:30 +0000
Message-ID: <6f7f607491d58d04daf3e9b33f64788f530c3b91.camel@phytec.de>
References: <20250812-wip-arm64-crypto-v1-1-5c2cd9d8f1bb@phytec.de>
In-Reply-To: <20250812-wip-arm64-crypto-v1-1-5c2cd9d8f1bb@phytec.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI2P195MB2491:EE_|DB9P195MB1388:EE_
x-ms-office365-filtering-correlation-id: 6af1287d-14c6-4a2d-967f-08ddd986ca90
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|4022899009|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?aGJTb3FNVzdNa1J3U3NhdXBITHJZL21uQ05BUjJZZEJBUzIzYkdISGdUTHd2?=
 =?utf-8?B?WGxQMmR5VnhGeDZYU0NiMC9HT2JVWk02RDR2SjhQd1BXTnFBTjZ4ckNTWEZL?=
 =?utf-8?B?TytURi8yRUhDN1NvZ0xhcU93LzYvRUJGbHY3bi9oSXJzYngyaHdTWi9GNDFW?=
 =?utf-8?B?eDRoUExGcVJHKzhNQVJiM0NpZzlzQ052aUdsaWd0djJLd0ppTURjS0xyRURF?=
 =?utf-8?B?bHlWVDVBWWdGZnRCT1p0dWU5WGxHRnJQOThFYkRUMUdCcFYycFFiUEZNK1F6?=
 =?utf-8?B?VjZpeWNQcU5JZWtXOTdTLzgyOXVkcTNGQkYva0tZc3EwZW9zL1pHYjlLbDZZ?=
 =?utf-8?B?Yk83VGxGTFU3MVBJaUZiL05OdVUyU2VYUWlYVW40aEIwVGVqSGJEZk5YemYv?=
 =?utf-8?B?OWNqVDFjN0xvODlKSzJFL0dXSUJtMHVzaUdMRzJrWEtoNDg0eU5TcmZmdmoz?=
 =?utf-8?B?WG1PYlBtdW4vQ1B1SFl6d0FURURKSWt2RU5GeEFNNjBXVmhQVUcrZFoxYmVN?=
 =?utf-8?B?elJ5WDBPdlpndHhOZlNKbXRidEJldjFhYUJMVjFBZmhYR3hzLzE1cllEZFM2?=
 =?utf-8?B?YjZrcVVIWXM1aDBOKzRqczFORk1kQUVONnRLeEdxaHZkOWJBWS95clJncDlW?=
 =?utf-8?B?cmJXMDFvaFN0bTl6MnBBUkorTzhmMVZLMXVvcDBTV2RGSU0yZUtvSkhyZ1Ar?=
 =?utf-8?B?MUN3VllmRVZ4MlN2TmROejM3clQrZWV1Rm1JclZhcndqQXFyVW5LRXFsTG8w?=
 =?utf-8?B?RUZjL254cGlqU0tJNDlBKzYvRGlWdFJtdXBpY2V1L0VsWmIreWd0aU1UbjNu?=
 =?utf-8?B?dVc0L2o2MEVCcC83Y29FQ2xUMVIzTXR6amJKZlFHWkNLMThPZ3hMWE9RelVN?=
 =?utf-8?B?NjF6RENocDZJMHNMbVJIMnFFamFsVTNsaEVKcG43R0swMEJQTmVqQ1BBTVZK?=
 =?utf-8?B?NjlxeFN1Z204Vjd1NDFOc1gwdnVmS2svSlE1djRvTkFvSmtaMm5wUHUraCtS?=
 =?utf-8?B?a3NkODlQTkx5c3hEZEJvdVlZNFdkY3ZlOWxrc3oxRzJJLzNxZnVJQ00zdTFS?=
 =?utf-8?B?UDFuNUJSSUdWUm5GTTBFdjlmcWtJbk9icVZJbmlHN0lrSE5iU3Fzd3Z0RStL?=
 =?utf-8?B?RE9QblpmMW9MOENnZkswUnpOZkVzdnFLb2YxejYwc0kxWTFsekRHZEU4WDVh?=
 =?utf-8?B?U1dxcnVqdTFCMjY5U0pJdXEzd05peGcxajZ2djBaaytEc3FpcnBqUHpWaTA1?=
 =?utf-8?B?ZDJzam9NMmI1L09TRytUdjgzMXNDTnBzT01ubVZvVXhsMGEvbjFhTFZvNUJU?=
 =?utf-8?B?Z1JVblVHZ1JwbTk4WWtOYTNFalVESzRQcDgxcmQ1U1BFOWs3cUxudExuQjZl?=
 =?utf-8?B?cUdtQk04dko4YU1zQ3VxV3pCTEI0Ri91dFg1eXgydVZCLzdmbEFlcFRwa2NK?=
 =?utf-8?B?Wm9LL0FLemxmM1p0b3NQM2daM2J1YzVMZmdKNVBYVVdQR3ZsMUx1VGZTY0lj?=
 =?utf-8?B?ZmNjY2hHUSt2aUxyaFE4WEgyTTh3R3IwbkdTZWF6Y2RCUFUxY25wTzlQRk9T?=
 =?utf-8?B?UzdaU2hiUFBXZ01rYldoWFRVUG1BKzhYNzBBQkhXaTNEMnBsRWg1SHRFa0U1?=
 =?utf-8?B?Y1o4TjgzdnVCT3dRYnFUdGoxNFNrTnVVV3JNSGN5L2FDTVBrbkoxRjljRWxO?=
 =?utf-8?B?dEF2Si9ERXlWTTRWL3Q4Sit6d21Ld0Fsdnc0cHJGT0xva0VoeXA4YUsyMTU5?=
 =?utf-8?B?OGduNGtwNDZseTZTUVVVRlQ3U2I4NjJMY0tjUE9qUFYyUCtmY0ZaVWduQnFU?=
 =?utf-8?B?WHdlbTVzOEgycGExQ2dzUGNsb3BCN01rb1A2Wk8yYXJlNU9UUlpJRlZzWS83?=
 =?utf-8?B?TEV0eVlxdWY5UkxlSGNvbWx6OCs5dFphMXE3TThOZkdjcmFDU2xaUWN3cFZp?=
 =?utf-8?Q?nHo4zQq/M3o=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2P195MB2491.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?d1EzemVtSEVWOWFIc3Q2SlExRlQ1YmR4VVpDT0pZcGdTcnNGb0ErdEk5d01m?=
 =?utf-8?B?YVQ5MVhmMGp2YlpJaGorV094RjdvcmZkN3VZMVFHeHFRaU04V1VWQUhrMmJn?=
 =?utf-8?B?MUhBT0dxeVNaMEdTYWhWais4L1lZOE84YTgxMjhTYU9qcC9Bd3lBUDYvbEMx?=
 =?utf-8?B?WGdFTjEzVTd2Q0NNVzNZM2IrUkk0WFcvMGFqcHBtekxOaXZHVThRY0g2V0xZ?=
 =?utf-8?B?enljRkNLQUs5aTdUQjFpV0NteEpJYjVmY3NxK2lyLzFwWFUrTEhWekJkWFN4?=
 =?utf-8?B?ZHRhRzJnMms5THpvMDFoVGh2RXUvN2tzdzYxMlI4Zmh0RENhR1VrTGdxOEpJ?=
 =?utf-8?B?Kzh6Q2thY01DbTZnbXpSMmV1V3ZEeHcrM3RyME95R2lyQXlMUGJ5am84bWNy?=
 =?utf-8?B?Q1I1LzlhK1BMblhiZXlLNDdwMUF6eVNqaDdPK3l2QXVDQU9KRTJXUktwNXZu?=
 =?utf-8?B?Yms4bkJsT0N2TEVpYjdITzZIN0tJbnhFVDFQdjZwd01tK2FoOGdxUkF6ZFMz?=
 =?utf-8?B?emRkR3lUYXJZaTJEelBqMi9lVkpQZlFRM3MxNm1QQWVhMG5GQ0hPeFFNWUx1?=
 =?utf-8?B?L1ExeVN0V2YrZk1JUmpzeEpwMDlqNThVN21sTUxhaFJHQloyYW5VblIwN01a?=
 =?utf-8?B?RFprcEl5Yzl0Wng5YXFQaVV5UkQwT3pQNkl5ekFuUzRzdnlhc0JmOGdoSjdq?=
 =?utf-8?B?dlRXc3A4OE5EckdmTFk5QnUvcEZSSmpUcVJGWllscTA0ck1TNi9ZdStaV2RO?=
 =?utf-8?B?ZHppU05YbXBiU0lqUUZLUjB4cFcrMnFCWDFSVnh4emZTekp0U01SelpEbW95?=
 =?utf-8?B?d1h6ZFZHcUdEcXBBcEQvVlUrdmpDTUl5V3U5TjNuUGRZUzVLc08xMGp0aUpz?=
 =?utf-8?B?UVUyY29kSklXWVpFMDhNN0p5SUtReFNvaUY1NURRWHVYdTJWUFNmYk1TUkRq?=
 =?utf-8?B?NGVRM29rUmdXTng5V0Z3YmhiWEtHUmF3b01QRDhTVHdXV21nZlpBKzhuTzJO?=
 =?utf-8?B?Mm1YNlBLcWtWUUFBby9UZS9GNjV1cTRTQUZpZ2ZFTTlra1Q5RUUrRmRTY09a?=
 =?utf-8?B?YjM5Z3d3T2hUS0ZXcEJjZDNNZzZYdGZTdG5WdmZLUm85VzRyWHRNbE8vR0VB?=
 =?utf-8?B?TFNnR0lpYzUyVzZJOHd4OFNHNHI2emNaL0VVRmsrai9sbFVzbmFMVHZVYzlt?=
 =?utf-8?B?ZlVHTThPdzM3RVRGUEd0c2JNYTVqY0s3Zm44dkxLR3g5VEVXeW1RQTVxQ1RD?=
 =?utf-8?B?OEF1SkRBWERjSkFrV1AxWVNsWmRmZEI0aTEzcXhUSWduR25QdCtUSzlqdnlY?=
 =?utf-8?B?T0FGOFBGa2U2YUJoYm92MStSVDZUNWVKaVRVVk9DMDc0YUhEK0w4ZmtVeDkv?=
 =?utf-8?B?V3pkWS8rRTM1R3RvMnd4UllST3c0Y3Y4UlV1ZHNHOUF4MVE2SElwSURSOXV4?=
 =?utf-8?B?dm9JSlJwVk9hclVYYzgzMTlpZTZSVGpWTSs3UWdsQnJGVGtDM1dRcXBsTXFj?=
 =?utf-8?B?bFFSelJ0OU5kYWFTdXdJbTFkVjRmZUgzL0U3eVhRNnpUTkNpSkp1RWc0R1ZK?=
 =?utf-8?B?Rzk3d3B3V2dqSDE0US9zb25BNDdzOUQrbWN1Vm1aU0YzMThFdXR3dmIvZWhS?=
 =?utf-8?B?WVRhZGpJeU5NMjhQT3M5U2xEb3JBS1JTOXNuVmJqYnFvUURseWdTdnlESU5L?=
 =?utf-8?B?NHA5Qjg1ZEIxSTZCZWdud2NaN0QvRUZnWDJKOC80bU1RUjgwaXZOd000MThl?=
 =?utf-8?B?VTN5S25oSUVxK3QyTEkxSkh5d1BXMEExSnJvd3lmR214N1JlZ1dhUWRONU5W?=
 =?utf-8?B?ajFmV1JsMkY4SXBkU0hDS3Ezbm5ESEtXdWhOTmhiNjdCNUhaVXE3ZWlIT2ZY?=
 =?utf-8?B?VFQyeDVZVTBnZGlUZno3UWx5TlhyUU9sWnJNZVA3MUNKNERHYlVEbCtWdFRl?=
 =?utf-8?B?UlhNSCtibUgzeVl5VkhGb01PNkZ4S0JTb3NaTkMyQTZFSUNaWXJtRm0xM09F?=
 =?utf-8?B?djdTZ2ZCck1KNXlmYTNIZWU4NVNleUdkK2lWUHFWRlhESGF4a1Y5cXRGVnpt?=
 =?utf-8?B?NzdUTFJqbkF1Z2tOZnF4Q3ZwY3F5b3lGWHI1T1o5amFEUUZJdnlMRFYxOGlY?=
 =?utf-8?Q?SvrQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <543EED268FFA6140A5FC2711FE06CDD4@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI2P195MB2491.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6af1287d-14c6-4a2d-967f-08ddd986ca90
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2025 09:58:30.3635
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vh6zyshcSVpenk3OQizZKMN7BceX46CMhRHUWKh5swWPyMZXEOiwupv9rF1F4z7OVo/LcjEaWfNE7YJC7ytP/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P195MB1388
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 09:58:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221760

QW0gRGllbnN0YWcsIGRlbSAxMi4wOC4yMDI1IHVtIDExOjUxICswMjAwIHNjaHJpZWIgTWFydGlu
IFNjaHdhbiB2aWEKbGlzdHMub3BlbmVtYmVkZGVkLm9yZzoKPiBPbmx5IGFkZCBmZWF0dXJlIG1v
ZGlmaWVycyB0byB0aGUgLW1jcHUgYW5kL29yIC1tYXJjaCBvcHRpb24sIGlmCj4gLW1jcHUvLW1h
cmNoIGlzIGFjdHVhbGx5IHNwZWNpZmllZC4gRm9yIHNvbWUgdmVyeSBiYXNpYyB0dW5lcywgbGlr
ZQo+ICJhYXJjaDY0IiB3aXRob3V0IGFueSBBUk0gdmVyc2lvbiwgdGhlIC1tY3B1IG9wdGlvbiBp
cyBvbWl0dGVkIGFuZCB0aHVzCj4gbm8gZmVhdHVyZSBtb2RpZmllcnMgc2hvdWxkIGJlIGFkZGVk
Lgo+IAo+IEZpeGVzOiA3NTQzNDVkNjA2M2MgKCJmZWF0dXJlLWFybS1jcnlwdG86IEFkZCArbm9j
cnlwdG8gdG8gLW1jcHUgd2hlbiBjcnlwdG8KPiBub3QgaW4gZmVhdHVyZXMiKQo+IAo+IFNpZ25l
ZC1vZmYtYnk6IE1hcnRpbiBTY2h3YW4gPG0uc2Nod2FuQHBoeXRlYy5kZT4KClJlcG9ydGVkLWJ5
OiBZYW5uaWMgTW9vZyA8eS5tb29nQHBoeXRlYy5kZT4KVGVzdGVkLWJ5OiBZYW5uaWMgTW9vZyA8
eS5tb29nQHBoeXRlYy5kZT4KClRlc3RlZCBvbiBhYXJjaDY0IE5YUCBpbXguCgo+IC0tLQo+IMKg
bWV0YS9jb25mL21hY2hpbmUvaW5jbHVkZS9hcm0vYXJjaC1hcm0uaW5jIHwgMiArLQo+IMKgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL21ldGEvY29uZi9tYWNoaW5lL2luY2x1ZGUvYXJtL2FyY2gtYXJtLmluYwo+IGIvbWV0YS9j
b25mL21hY2hpbmUvaW5jbHVkZS9hcm0vYXJjaC1hcm0uaW5jCj4gaW5kZXgKPiBmMWU5MmUxOWM2
MTU2ZGExNzFkZTk1MmZjYjc0YmQwNWI5NWM4Njg1Li41NjYxNjc3MmZhZGQ5MmMwYzJkZDAxYTlj
NDk4M2YxZmE1NzMKPiBmYTk1IDEwMDY0NAo+IC0tLSBhL21ldGEvY29uZi9tYWNoaW5lL2luY2x1
ZGUvYXJtL2FyY2gtYXJtLmluYwo+ICsrKyBiL21ldGEvY29uZi9tYWNoaW5lL2luY2x1ZGUvYXJt
L2FyY2gtYXJtLmluYwo+IEBAIC0xNyw0ICsxNyw0IEBAIFRBUkdFVF9GUFUgPSAiJHtAZC5nZXRW
YXIoJ1RVTkVfQ0NBUkdTX01GTE9BVCcpIG9yICdzb2Z0J30iCj4gwqAKPiDCoCMgU29tZSAtbWFy
Y2ggc2V0dGluZ3MgbmVlZCBhICtYIG9wdGlvbiBwYXNzZWQgaW4uwqAgU2luY2Ugd2UgY2Fubm90
IGd1YXJhbnRlZQo+IHRoYXQgYW55IHNwZWNpZmllZCBUVU5FX0NDQVJHUyBvcHRpb24gaXMgc2V0
IGluIGFueSBvcmRlciwgd2UgbXVzdCBoYXJkIGNvZGUKPiB0aGUgb3JkZXIgaGVyZSB0byBhbGxv
dyBmb3IgaXQuCj4gwqBUVU5FX0NDQVJHU19NQVJDSF9PUFRTID8/PSAiIgo+IC1UVU5FX0NDQVJH
UyAuPSAiJHtUVU5FX0NDQVJHU19NQVJDSH0ke1RVTkVfQ0NBUkdTX01BUkNIX09QVFN9Igo+ICtU
VU5FX0NDQVJHUyAuPSAiJHtUVU5FX0NDQVJHU19NQVJDSH0ke0BkLmdldFZhcignVFVORV9DQ0FS
R1NfTUFSQ0hfT1BUUycpIGlmCj4gZC5nZXRWYXIoJ1RVTkVfQ0NBUkdTX01BUkNIJykgZWxzZSAn
J30iCj4gCj4gLS0tCj4gYmFzZS1jb21taXQ6IDFkZWM1M2IzNTBkN2QyZWRjYzg4MGY2NDBiMWNi
MmZkMzFmZjdmMGIKPiBjaGFuZ2UtaWQ6IDIwMjUwODEyLXdpcC1hcm02NC1jcnlwdG8tY2EwMDY4
Yzc0YjNjCj4gCj4gQmVzdCByZWdhcmRzLAo+IAo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tCj4g
TGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuCj4gVmll
dy9SZXBseSBPbmxpbmUgKCMyMjE3NTkpOgo+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMjIxNzU5Cj4gTXV0ZSBUaGlzIFRvcGljOiBo
dHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTE0NjYzMDY4LzgyODA1NjUKPiBHcm91
cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZwo+
IFVuc3Vic2NyaWJlOgo+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJl
ZGRlZC1jb3JlL3Vuc3ViwqBbeS5tb29nQHBoeXRlYy5kZV0KPiAtPS09LT0tPS09LT0tPS09LT0t
PS09LQo=


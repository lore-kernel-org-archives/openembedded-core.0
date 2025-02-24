Return-Path: <L.Anderweit@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F5EFC021B3
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 08:42:45 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.96])
 by mx.groups.io with SMTP id smtpd.web10.84660.1740386553632677413
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Feb 2025 00:42:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=selector1 header.b=fit+1Lyo;
 spf=pass (domain: phytec.de, ip: 40.107.21.96, mailfrom: l.anderweit@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jvYN1R5K/YJlSHGTddaSnSfZ0RwOs6/0idepjfa2tGY0UhQFfOSU8cfZVCjU+zyGIE1P6JXv+tksRzwNmd9Vzw9nNCWmesoKxddPd4hY72DufvNFOAqdms7lslQyTu2GNvYTDYPYgVjZmuikBdp6TgJD6GCdt2kK0CJXQhVNpbRmBvLJJ2EzPqAkPFMI8u/kL+dx+Q4LgCT5pTeSIT8bnkXr9BwBHfWQkAVanpQ4TQVllffqCeQp/sysMlKkbWvgoZJs5xeiwkbvpU6eYM7FXzbMMUn+h3DJALDAKdC92+0eWv7HY/cYvoqPrJmRNjCe3D9qxWzHsZapPu1Ps/O3GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EiA4L+jz6q/sRaoBBa7H0u15F/TM8K6lAPZ7A2lqAg8=;
 b=B7Eh1xsuxqN+Gs2Qi4mA9aGETRCOsZO0lHpcz8yq8heQnQ+C0rgHAYeXSsOi3lie9IX9qYYbx8B04G5YNcQS3WwNx5nnFgqtZxrW24MduXUVRwpA0eXykO54TBtYy7g45mx14T0so0gUGGUA6/X+r7rNDDE2sOcKdPyIj2NTMnS1FxUCtUOVrhgWQZ3Jo377KbaRyj/4DNBFdnG/EAg9Vu9+QIZC8EJHmCtQgG5fZZwa1a1vAyapSpE7l9EGd0jXj7Trgki2GJ91EAQVKLcFi3Sg//Y6cZRaEt9mEA6oGamC0H+HvNZf51iILCKlPtKEbrNKPIHYWbgUT5ug6skneA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EiA4L+jz6q/sRaoBBa7H0u15F/TM8K6lAPZ7A2lqAg8=;
 b=fit+1LyofV20qbawhgWO5raYnOglBm97fyr5VgzYyl0zPVOqFKkpe875z9drlCV4k7zwC3La10w+MwIX7MIEbQ83P54KtgQqkw4JLz42LuCCL7T5K1jvg1kt8gH/S0PYCyXibxK5y79lIHzw0/1tcfEDA94yaNNlnPsjuzb8K9ZTdfI7tWlwKnawzXo8lyds2iBRiUGw8P2yUDw7CUzmn/zM9HrSva6NXkPt42EDtzbHsXK5GFzC3W1YDBbduJR78EBUDEkihhNAGbT/T5JX9YW/BBbVS4j/19OZ71+fAoLXxURvIzX9fKlrTceZyq/4GKaMv3rqsbw7yYDuEOJtBQ==
Received: from PAWP195MB2176.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:330::14)
 by PAWP195MB2348.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:35c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Mon, 24 Feb
 2025 08:42:29 +0000
Received: from PAWP195MB2176.EURP195.PROD.OUTLOOK.COM
 ([fe80::ea1e:17ff:23ca:3c0]) by PAWP195MB2176.EURP195.PROD.OUTLOOK.COM
 ([fe80::ea1e:17ff:23ca:3c0%5]) with mapi id 15.20.8466.015; Mon, 24 Feb 2025
 08:42:29 +0000
From: Leonard Anderweit <L.Anderweit@phytec.de>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "upstream@lists.phytec.de" <upstream@lists.phytec.de>,
	"quentin.schulz@cherry.de" <quentin.schulz@cherry.de>, "marex@denx.de"
	<marex@denx.de>, "rogerio.borin@toradex.com" <rogerio.borin@toradex.com>,
	"quaresma.jose@gmail.com" <quaresma.jose@gmail.com>, "seanga2@gmail.com"
	<seanga2@gmail.com>, "adrian.freihofer@gmail.com"
	<adrian.freihofer@gmail.com>
Subject: Re: [OE-core] [RFC] uboot-sign: Fix u-boot dtb signatures
Thread-Topic: [OE-core] [RFC] uboot-sign: Fix u-boot dtb signatures
Thread-Index: AQHbg6VsK05jv/tSYUGUv8wjqs4MWLNWKMYA
Date: Mon, 24 Feb 2025 08:42:29 +0000
Message-ID: <bc8cfc1c3df8f65873e840cbc113c998ac5c35d1.camel@phytec.de>
References: <1825F18F550EF04E.23135@lists.openembedded.org>
In-Reply-To: <1825F18F550EF04E.23135@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWP195MB2176:EE_|PAWP195MB2348:EE_
x-ms-office365-filtering-correlation-id: d7a2aacd-32fe-4645-d529-08dd54af2c26
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|4022899009|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?M21lR2VZUjhJaURsMjJNNU9GTXUzTUtzRWtFOW5NdXJVeUYwM3RLcU9wQWtD?=
 =?utf-8?B?c3RTdkZvU1pWdWlTSmRyVHJLVzgxNTlUTjdtTUVwcVNBOVdFdEovdFlCeE1l?=
 =?utf-8?B?ellWMS9SZlo4a0F1b0x3TDZLUStkUE5mSThNZlloUGlWWWtKTTlxa1Y5M2h0?=
 =?utf-8?B?cU0zZitPZndJYklZZnhtcWlLZEZKclAvSkMvOG56dnVNQWhvc3AxZUxCaXJk?=
 =?utf-8?B?RHpUZVNsdTBqKytyN1RrcHdOem9IZ3VoZDhjWVFWTUxLaElOL3hGYzB1QnZX?=
 =?utf-8?B?ZVNmbHJnRDlDYmpBOFZkSkFDMjVzVnpWTDRLOHYyNGFjYmlVd2w5bGJCaXJz?=
 =?utf-8?B?L2QvaDI4RE9UZEZHZndUVlF2SFJKL1hEUG5RS1EzUS9JTHkzM0srNTZXVGk1?=
 =?utf-8?B?d2xnRFpQU0tyMXY5b0V5UVh2TGszZ0dYYUZ0WDNSc3gvZ2xSL2NreTgxZnp6?=
 =?utf-8?B?aXlzM3ZLZHR5QTV2bEZlS2wrdHRQWXY3YnVqbWhQa3VYUjI5ZnpoakthTFhQ?=
 =?utf-8?B?ZE13VytnMXZqSVV3OUdVenI1MjNIc2lyUUlNVHBSOWpML0hIMFp2RWNTVjFh?=
 =?utf-8?B?ZjVQTGZ2SmR2dy9MN2JOTHhTYUdaL21BTDdPYURLcU5nd1hRdmd1cTluaUJx?=
 =?utf-8?B?Y3M0c0lCMFl6Z0hjMEFiRjUyRHFUMzhNL3RUZXY1djIyeGl5enZRQWtNYVZW?=
 =?utf-8?B?MWtpOThUWVBmYmwvTStsaTB5US95aDVyNzVuS0MvMXAzektGR1Jyb3BFTlVi?=
 =?utf-8?B?dVV3TUY1RmlEM2pVWTU4RDVKR3JVZ0tUU0NJSU1DN3hoOG1rbXY1UkRRTDl1?=
 =?utf-8?B?OWJMOGUvSnlqa1M1RlI0S3Nqd0hjaHN3cGpqZDVYQmFBdTBxRE5sSkFtTXJ1?=
 =?utf-8?B?QlpmQ01EOVpYVWpBZk8rM0llamg0UFBHWGZ6blpoMThiR2VmL0hPQ1ZFQ1F6?=
 =?utf-8?B?ZDdZcWN5T0poMHZKQmNjSkRWclh6U081TmU4MjZSSTdRNUw4dUkvNkpCM3pC?=
 =?utf-8?B?UjB6eTIyK1ZqLzF1SnNVVGhwbko2QnBhODBQNTZuS3VyWXFTS29BUFl3VStY?=
 =?utf-8?B?aWpBQ3RzZk52cWNGcmtxK1dDQnkvZHpEK1BwNXlad0xnRkZObldGZVdHbnZM?=
 =?utf-8?B?RG01SUtQNUdHS2tVeFZCQW9SZWJSMWg1TmZCbnZjbXZlaDR5REdaTzFMcS9r?=
 =?utf-8?B?MU1yM0s4NEtnSU5yYng5cXhZSTU5OHA3eGdxQnQ0NzkxM3R0djE0K2tENlVX?=
 =?utf-8?B?eUxha1dNVGRpbStmOTUyN0RETXZ3OVNwYzhYMlcyY3ZkWTFsVXlDdE5KRTNX?=
 =?utf-8?B?cmxYaGxoUDRYUkVyUHN4QXk2Uk1jZTRHUE44bytKNDNxamR4ZTJValZaakxH?=
 =?utf-8?B?M3MyUDBUcFExMXBBRnhTSGh4RUdTTHY0YTRnU2thNk51bTY3bmcyVmFCT05M?=
 =?utf-8?B?cGM5cXJwVjlITEZGbklVdDY3SVdLZlhmaGY5cUZwNXdjajJ5MWNIRXhIaXp3?=
 =?utf-8?B?bGF0aGY4UkJkKzBSTit5dytJVDBzR213Z29nTm91ckZKNnhCYitwWDBib1c4?=
 =?utf-8?B?VGhsemtWYWpuZkliUlVyeUtPMVNaVFBYZlVTbzhLOGxRejMvSE1KWjl6STdu?=
 =?utf-8?B?bDhkNW53NWc4dWMyeXFRWmYxWktmU3A0NmEzdUlXbHFRY25DNXM0SjhnUnNJ?=
 =?utf-8?B?VG5qMFMwMUZmdTk2MTFYaGNzWCtRb1lHWm9CY3R5MHUyMDN2ZytDK3RaVGJN?=
 =?utf-8?B?blpOVnR4L1BqYllzaFNuTnZGd2xQTkU0UTY1QUlyMytNejU2QXlFcnVoSnVm?=
 =?utf-8?B?Q0ZNNWF6QlkzTnFuWmtzOGhnY1FjcDArQ0lMMlI0R0hlR3JqeWIyaUdEeGRm?=
 =?utf-8?B?OGVPV1hMWUl6Sk9mbGZTcjBuWHJLa1BSTW4zNnl6VGpCczNHNVdIZWFBQ3gz?=
 =?utf-8?Q?BwYmA5RwsuQiG1o6x90yyJotMPnI7I9S?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWP195MB2176.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dkprQkcyK3FvMDMyU01vUVJDTjk3eXRWU0s0OEZxczE5UXJtVjZCVC83UTRw?=
 =?utf-8?B?L2Q3VDN5UXY3TXkwMFVveHNSb1VVcW5mbmxaTVpOd05maWJqKyt6NFNIQXBo?=
 =?utf-8?B?bXhTcUtCOTM4UXdCQXFvZ0w0eXZoMS9Gb3A2cGhHM3N5VTU4dzcweG93OHFm?=
 =?utf-8?B?YytpRGNyb0VsOGFUTUI4YS8rRFBhNmJTK0xTNStHbzBTcmI0RFZvUmgwclRO?=
 =?utf-8?B?ZTJDcGpmR0RocnUrRHZHVlZxZlpZV2FxcXZaWFNna2NJWXhBa0E4dWVaN2ZD?=
 =?utf-8?B?Rk4wN1NUSXhNUzhYSU1Rek9iUkh5NmU1MzQ0M2phSGhCOWNsVkZ1aFlmWFd4?=
 =?utf-8?B?aWxXQWZCK3hqQm4yRmxqb3E2cmJnNm5hYjdQQUZPT2Q2bGl1MzhGYXZxNVV5?=
 =?utf-8?B?a2RZS0dpa20wYy84aXdZSVE2ZnpSREw3dzVlVEQrRmlFOUllL250YTBiNWYz?=
 =?utf-8?B?L2QxMVJjc3didSs4WGlRRmhyYWtuSEFuWVRCbWJ6WTAwaVRtRHJqMVVRRk9S?=
 =?utf-8?B?WkwzTWJLa0hrK1V6SmJkMmlhbjY0YzVUTnJQV2d2ZjVDZzA5cGMyTWlJSk9h?=
 =?utf-8?B?Rmo5MmF1TDloMjRZZlpCNEd0SytZRzNRMk9hdmJGRVRWOS9zL3lQQmxvNWhi?=
 =?utf-8?B?elRMaWZPV0I4M3QyMGduNHdQTWJkZlVjUEtJYUZ5ZEdzZ05MaDR5YmRLNlZT?=
 =?utf-8?B?REw2ZnFIdGJBMXV0TWh4aTZZZG9YRGplQkVPS2YxdDN2QVp6RHRLUklsRVRM?=
 =?utf-8?B?WWk5YmtSWUJhT3RBSnVFdVZGRGVmSk1vdE5ocUN4MUthVWVmakE0MEc5MTNJ?=
 =?utf-8?B?ZUUzV1puU0VCQWJ2NHNWZG9odGE4djZ3MVNHSzZKRjRuMFp0KzdJMXUvZnRa?=
 =?utf-8?B?d3dVR2Q3NUVnOVZaTVBaTzNkeHkyd21NYkRuOXpzYUR1Nzd6ckZ1b0E0Sjlq?=
 =?utf-8?B?czRtamJaVVlLV1dJdUNpbkFaNFkrOGluNXVUU0c2UjB6c3BXMTMrUnlOYURv?=
 =?utf-8?B?L2pSckVTKy9CeW4ram5iWkY0VkRIN0R4eDR6R1NzWWc1SXAvdFBwUnZKR3px?=
 =?utf-8?B?UGdCSW1IdlVZb3h5ZjcvTThxTzJtYkYzcGF5Y29xaTFvSGFqamJ0RE1MUXpJ?=
 =?utf-8?B?RDlhdGtuZVNwL2NIMmwrYnVDYk5IbFE2V1NFRDhqdjRkdEJiNllwQkxMWEcw?=
 =?utf-8?B?VlJVUTZTZVFEbEdRVEJyUTE0NXFHTzI3b1NWVFlCU0RjR3ZaMFNXenVhVVZK?=
 =?utf-8?B?WDhrU0RqYlpIamxCVndQUjZJbW0xcnZubFp0OENqTzBhaktla1grTUhadjd1?=
 =?utf-8?B?QnBvRGNGTEQ2ejN3c0RjdXQ2OUwwM0UrUCtLVHFQRXR3SGd0Q0dMN0x4N3R4?=
 =?utf-8?B?VDNnT3htWG90OE9Bc0dtaDRheWxEVjhEeW42V1QxdGpJVEZXVFZvcDNFTnlQ?=
 =?utf-8?B?OUlEZ2VZRHJnVWdkTDViSk5oTUR4VXM3NExzSFFHeDZyMnlRZnFsckEyVTdr?=
 =?utf-8?B?V2FPWGtEdGhJOEM1QWVGYzZPY1BlTFo0ajNWK1dRRGFoaHU2UmdldlZIQW5n?=
 =?utf-8?B?a1gxSmdFN21MN1VPaExKTGVFQUhnT3NlcS8vbTRCRDhXSmNGV1JmRXhHV3lG?=
 =?utf-8?B?M2lvVGc3dnkyWFZqbEgyeHljQTBkV2N4MTZvUkJFaFdiandzQXFPTGRjMkx1?=
 =?utf-8?B?RVVOMjJHSENTT1NZVlVva1o4Q0lxOEZ1YWhkb1pFd1lsZU5NcU10Z25hQldB?=
 =?utf-8?B?anFUSTFFZGpLS0l3V1RyQyt5ZVJNWXRFWTNpOE1uTzlBL01oVFh4eGUzWWwv?=
 =?utf-8?B?Y2Z0dTJYSTZzaHJzNXM3OWVkNmVkNTNhQlljRnhoZENQdmNMT09jOGNHQTVl?=
 =?utf-8?B?cGlQVzdRZjFKQ05GSGRGUVB2bkkxdi9BSzFoWk5obTRBRXVtek1DVEs2d1hC?=
 =?utf-8?B?dXF2c0hSVVJxQWROMjQ5ajZaaFE0R200aXhIVlJsN3ppWFVIa3grSDlvS1lI?=
 =?utf-8?B?MXJ4eXFTaWNzMTJXQXBVUUJWMm9DNkpEQzRtVmdYaWx1RjRUSmgzMnA4T0xB?=
 =?utf-8?B?SktJTkJWenZKb1JKcGMzcFE3cXJHRnUrOWxCUGtFVjRmVHAzNkZxTTVIRHBa?=
 =?utf-8?B?MDZxc09ZdmduWWxKQlg2RnFnT0JGUWJIVnVZbldJUTZHVStjbXdwR0NZQ1NV?=
 =?utf-8?B?OFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC98058EFD3F5240830499241DE0E4E2@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWP195MB2176.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d7a2aacd-32fe-4645-d529-08dd54af2c26
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 08:42:29.2768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PHXFxlpZk5r5aM7jQY7346jpsIXeOKLDkdDp+9WMzPmnt8I8qD8bkg/MVD1sEVBtE1FOuPNKSfqYC7e1eK14Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP195MB2348
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Feb 2025 08:42:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211842

Q0MgZXZlcnlvbmUgZnJvbSB0aGUgb3JpZ2luYWwgYnVnIHJlcG9ydAoKQW0gRG9ubmVyc3RhZywg
ZGVtIDIwLjAyLjIwMjUgdW0gMTU6NDAgKzAxMDAgc2NocmllYiBMZW9uYXJkIEFuZGVyd2VpdAp2
aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZzoKPiBXaXRoIFVCT09UX1NJR05fRU5BQkxFIGVuYWJs
ZWQgY29tbWl0IDNmYjIxNWEzYWYyNCAodS1ib290Ogo+IGtlcm5lbC1maXRpbWFnZTogRml4IGRl
cGVuZGVuY3kgbG9vcCBpZiBVQk9PVF9TSUdOX0VOQUJMRSBhbmQKPiBVQk9PVF9FTlYKPiBlbmFi
bGVkKSBhbHdheXMgYWRkcyB0aGUgc2lnbmF0dXJlIG9mIFVCT09UX1NJR05fSU1HX0tFWU5BTUUg
dG8gdGhlCj4gdS1ib290IGR0YiwgaW5kZXBlbmRlbnQgb2YgRklUX1NJR05fSU5ESVZJRFVBTC4g
VGhlIGtlcm5lbCBmaXRpbWFnZQo+IGNvbmZpZ3VyYXRpb24gbm9kZSBpcyBzaWduZWQgd2l0aCBV
Qk9PVF9TSUdOX0tFWU5BTUUgYnV0IHRoZSB1LWJvb3QKPiBkdGIKPiBjb250YWlucyB0aGUgc2ln
bmF0dXJlIG9mIFVCT09UX1NJR05fSU1HX0tFWU5BTUUuIFUtYm9vdCBpcyB0aGVyZWZvcmUKPiB1
bmFibGUgdG8gdmVyaWZ5IHRoZSBzaWduZWQga2VybmVsIGZpdGltYWdlLgo+IEJlZm9yZSB0aGF0
IGNvbW1pdCB0aGUgc2lnbmF0dXJlIG9mIGFsbCBrZXlzIHVzZWQgaW4gdGhlIGtlcm5lbAo+IGZp
dGltYWdlCj4gd291bGQgYmUgYWRkZWQgdG8gdGhlIHUtYm9vdCBkdGIuCj4gCj4gVG8gZml4IHRo
aXMsIGFsd2F5cyBhZGQgdGhlIHNpZ25hdHVyZSBvZiBVQk9PVF9TSUdOX0tFWU5BTUUgZm9yCj4g
Y29uZmlndXJhdGlvbiBub2RlcyB0byB0aGUgdS1ib290IGR0Yi4gSWYgRklUX1NJR05fSU5ESVZJ
RFVBTCBpcyAxCj4gYWxzbwo+IGFkZCB0aGUgc2lnbmF0dXJlIG9mIFVCT09UX1NJR05fSU1HX0tF
WU5BTUUgZm9yIGluZGl2aWR1YWwgaW1hZ2VzLgo+IAo+IFRoaXMgaGFzIG9uZSBkcmF3YmFjayBh
dCB0aGUgbW9tZW50OiBUaGUgc2lnbmluZyBvZiBpbmRpdmlkdWFsIGltYWdlcwo+IGlzCj4gbm90
IHRlc3RlZCB3aXRoIGZpdF9jaGVja19zaWduIGR1cmluZyBjb25jYXRfZHRiLgo+IAo+IEZpeGVz
OiAzZmIyMTVhM2FmMjQgKHUtYm9vdDoga2VybmVsLWZpdGltYWdlOiBGaXggZGVwZW5kZW5jeSBs
b29wIGlmCj4gVUJPT1RfU0lHTl9FTkFCTEUgYW5kIFVCT09UX0VOViBlbmFibGVkKQo+IFJlcG9y
dGVkLWJ5OiBSb2dlcmlvIEd1ZXJyYSBCb3JpbiA8cm9nZXJpby5ib3JpbkB0b3JhZGV4LmNvbT4K
PiBTaWduZWQtb2ZmLWJ5OiBMZW9uYXJkIEFuZGVyd2VpdCA8bC5hbmRlcndlaXRAcGh5dGVjLmRl
Pgo+IC0tLQo+IExpbmsgdG8gYnVnIHJlcG9ydDoKPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS90b3BpYy8xMTEyMTgzNzEjbXNnMjExNTA3Cj4gLS0t
Cj4gwqBtZXRhL2NsYXNzZXMtcmVjaXBlL3Vib290LXNpZ24uYmJjbGFzcyB8IDI2ICsrKysrKysr
KysrKysrKysrKy0tLS0tLQo+IC0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygr
KSwgOCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbWV0YS9jbGFzc2VzLXJlY2lwZS91
Ym9vdC1zaWduLmJiY2xhc3MgYi9tZXRhL2NsYXNzZXMtCj4gcmVjaXBlL3Vib290LXNpZ24uYmJj
bGFzcwo+IGluZGV4IDk2YzQ3YWIwMTY1MS4uYjJmY2I1YTMxNTQ2IDEwMDY0NAo+IC0tLSBhL21l
dGEvY2xhc3Nlcy1yZWNpcGUvdWJvb3Qtc2lnbi5iYmNsYXNzCj4gKysrIGIvbWV0YS9jbGFzc2Vz
LXJlY2lwZS91Ym9vdC1zaWduLmJiY2xhc3MKPiBAQCAtMTAyLDI2ICsxMDIsMzYgQEAgY29uY2F0
X2R0YigpIHsKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqBpZiBbIC1lICIke1VCT09UX0RUQl9CSU5B
Ull9IiBdOyB0aGVuCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAjIFJlLXNpZ24g
dGhlIGtlcm5lbCBpbiBvcmRlciB0byBhZGQgdGhlIGtleXMgdG8gb3VyCj4gZHRiCj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoFVCT09UX01LSU1BR0VfTU9ERT0iYXV0by1jb25mIgo+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAjIFNpZ25pbmcgaW5kaXZpZHVhbCBpbWFn
ZXMgaXMgbm90IHJlY29tbWVuZGVkIGFzCj4gdGhhdAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAjIG1ha2VzIGZpdEltYWdlIHN1c2NlcHRpYmxlIHRvIG1peC1hbmQtbWF0Y2ggYXR0
YWNrLgo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiBbICIke0ZJVF9TSUdOX0lO
RElWSURVQUx9IiA9ICIxIiBdIDsgdGhlbgo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgVUJPT1RfTUtJTUFHRV9NT0RFPSJhdXRvIgo+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBmaQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
JHtVQk9PVF9NS0lNQUdFX1NJR059IFwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAke0AnLUQgIiR7VUJPT1RfTUtJTUFHRV9EVENPUFRTfSInIGlmCj4g
bGVuKCcke1VCT09UX01LSU1BR0VfRFRDT1BUU30nKSBlbHNlICcnfSBcCj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAtZiAkVUJPT1RfTUtJTUFHRV9NT0RF
IFwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC1mIGF1
dG8tY29uZiBcCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgLWsgIiR7VUJPT1RfU0lHTl9LRVlESVJ9IiBcCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLW8gIiR7RklUX0hBU0hfQUxHfSwke0ZJVF9TSUdOX0FM
R30iIFwKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC1n
ICIke1VCT09UX1NJR05fSU1HX0tFWU5BTUV9IiBcCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAtZyAiJHtVQk9PVF9TSUdOX0tFWU5BTUV9IiBcCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLUsgIiR7VUJPT1Rf
RFRCX0JJTkFSWX0iIFwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAtZCAvZGV2L251bGwgXAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoC1yICR7Qn0vdW51c2VkLml0YiBcCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgJHtVQk9PVF9NS0lNQUdFX1NJR05fQVJHU30K
PiArCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAjIFZlcmlmeSB0aGUga2VybmVs
IGltYWdlIGFuZCB1LWJvb3QgZHRiCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAk
e1VCT09UX0ZJVF9DSEVDS19TSUdOfSBcCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgLWsgIiR7VUJPT1RfRFRCX0JJTkFSWX0iIFwKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAtZiAke0J9L3VudXNlZC5pdGIK
PiArCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCMgU2lnbmluZyBpbmRpdmlkdWFs
IGltYWdlcyBpcyBub3QgcmVjb21tZW5kZWQgYXMKPiB0aGF0Cj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCMgbWFrZXMgZml0SW1hZ2Ugc3VzY2VwdGlibGUgdG8gbWl4LWFuZC1tYXRj
aCBhdHRhY2suCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIFsgIiR7RklUX1NJ
R05fSU5ESVZJRFVBTH0iID0gIjEiIF0gOyB0aGVuCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAke1VCT09UX01LSU1BR0VfU0lHTn0gXAo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCR7
QCctRCAiJHtVQk9PVF9NS0lNQUdFX0RUQ09QVFN9IicgaWYKPiBsZW4oJyR7VUJPT1RfTUtJTUFH
RV9EVENPUFRTfScpIGVsc2UgJyd9IFwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAtZiBhdXRvIFwKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAtayAiJHtV
Qk9PVF9TSUdOX0tFWURJUn0iIFwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAtbyAiJHtGSVRfSEFTSF9BTEd9LCR7RklUX1NJ
R05fQUxHfSIKPiBcCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgLWcgIiR7VUJPT1RfU0lHTl9JTUdfS0VZTkFNRX0iIFwKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAtSyAiJHtVQk9PVF9EVEJfQklOQVJZfSIgXAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC1kIC9kZXYvbnVsbCBcCj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgLXIgJHtCfS91bnVzZWQuaXRiIFwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAke1VCT09UX01LSU1BR0VfU0lHTl9B
UkdTfQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBmaQo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgY3AgJHtVQk9PVF9EVEJfQklOQVJZfSAke1VCT09UX0RUQl9TSUdO
RUR9Cj4gwqDCoMKgwqDCoMKgwqDCoGZpCj4gwqAKPiAKPiAtPS09LT0tPS09LT0tPS09LT0tPS09
LQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLgo+
IFZpZXcvUmVwbHkgT25saW5lICgjMjExNzYxKToKPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzIxMTc2MQo+IE11dGUgVGhpcyBUb3Bp
YzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzExMTI4OTgwMS83MjcwMjY2Cj4g
R3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcKPiBVbnN1YnNjcmliZToKPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVu
ZW1iZWRkZWQtY29yZS91bnN1YsKgWwo+IEwuQW5kZXJ3ZWl0QHBoeXRlYy5kZV0KPiAtPS09LT0t
PS09LT0tPS09LT0tPS09LQo+IAoK


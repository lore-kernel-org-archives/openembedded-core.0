Return-Path: <y.moog@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CFF2CA0EC4
	for <webhook@archiver.kernel.org>; Tue, 12 Aug 2025 11:10:53 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.110])
 by mx.groups.io with SMTP id smtpd.web10.71693.1754997044925631932
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Aug 2025 04:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=selector2 header.b=i0RKdCrU;
 spf=pass (domain: phytec.de, ip: 40.107.22.110, mailfrom: y.moog@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KYqzJAUIDEPIOPzqSRu3JA/jLhqTkf6IdVs1fhw3wBxiifpfRbsn0K8WPCUWWpqMWyLFQg8RrFgi4eFC7t+56LxqtgB+fpr++Rd4ssjB3LwWQzp91ziiA4oGXpWPk5HNBuLzw7sGrc5StO+Si79HJvBkjjMjXLssOwB3ICmVojHODKap3ERalBS54Uw+vU9LLvcCYwh6GFiV1rW0O4+fL+b82hA9n1A7+yzbeizeEAdgXpu+m9bcr+lqbMvrcLzGFIQU55senXTQEqadsCG2BNxTU/cWFMtuujYBblPe+heGaiNrOzklxrO2ZrlUqwlJqem+EypYFa7aANuc4nGSkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AH66cHOSZUMTWDoifj87RxjdpfAAfAU/CDDcybx4WVk=;
 b=mHubtM2gcTrnr+k1vkcBbECiEsQQpDXhBWx87r4qkNy72M3N2d8owGNDGQb3QqD3ep1wuZVT8iMVgLxkfow2Vj8089dhVa2NNw59oND3sTgBYvI+rqrn7mirWIYsHVZJoVhfPHkbgAZW+PBmDlRAY8OBGpXTLYrS6DfMQ/qUH2cqV9dKqeHdvG0rbZB99IQfTSo1zVNG6HBrOl2DtfKWPvQkyAGk3gR/46bc0IlZPJOxuBW9OOM4cfc6B9ZIBttGux4rczDbmgJqekAjE83eYUh5qqPHW3R8iDNB3Pl5VR61iGNFQ+PdzSUirotRo+gaqvmHSrDR0DQYBq3eEUxZRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AH66cHOSZUMTWDoifj87RxjdpfAAfAU/CDDcybx4WVk=;
 b=i0RKdCrUYGICkKcZ0ouXJ5Nm4xL89LqFDu5ofyAnDIbPnqriqijhxRgi2Oed9NV84Yb6GShC8z79un5TUMKGYdnA/tmkt02ECm7cGAUtcPgk42RYvKfRqi9MbObQiWT5tiBexmjvG+Drra4l29b/oF661ANzGEnQrpPLlMVUOWd9pOgcZjfZ0ku0cC0pwBrgW8lLCcWZc9WkjGmbOqPKcrjgSmqqxEnCDM6wPhHcvcRFs636gwIqmLQkqtxC+o6bTSf4hyNIm2ftGE5K0V0cZqTvwb2JxtQVVQVWqQiL/Wk7wha8gEdgJx8t5XXSKPgGemuPKj+OiHoGmKqNR8Sa2w==
Received: from VI2P195MB2491.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:22f::14)
 by FRWP195MB2806.EURP195.PROD.OUTLOOK.COM (2603:10a6:d10:179::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Tue, 12 Aug
 2025 11:10:40 +0000
Received: from VI2P195MB2491.EURP195.PROD.OUTLOOK.COM
 ([fe80::4131:8d3c:f0c6:c414]) by VI2P195MB2491.EURP195.PROD.OUTLOOK.COM
 ([fe80::4131:8d3c:f0c6:c414%5]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 11:10:40 +0000
From: Yannic Moog <Y.Moog@phytec.de>
To: Quentin Schulz <quentin.schulz@cherry.de>, Martin Schwan
	<M.Schwan@phytec.de>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] arch-arm.inc: Only add -mcpu options if it
 exists
Thread-Topic: [OE-core] [PATCH] arch-arm.inc: Only add -mcpu options if it
 exists
Thread-Index: AQHcC26zforEJWyHbk62o7DHEheZZbRey9KAgAAQygA=
Date: Tue, 12 Aug 2025 11:10:40 +0000
Message-ID: <c9fb6eb304160f217d00ffcc28e9ce76f5bfed3d.camel@phytec.de>
References: <20250812-wip-arm64-crypto-v1-1-5c2cd9d8f1bb@phytec.de>
	 <e2ff042d-a875-4c74-93a6-69b3c26ab6b2@cherry.de>
In-Reply-To: <e2ff042d-a875-4c74-93a6-69b3c26ab6b2@cherry.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI2P195MB2491:EE_|FRWP195MB2806:EE_
x-ms-office365-filtering-correlation-id: 2e39391b-afda-4bfc-aa7d-08ddd990dfa0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?R1BQN0h4Sk1RaFQwU3BpUzRSZEpKSWt5emFVVXBNOGxuWFA2bTVURmNjbksy?=
 =?utf-8?B?YmptNERqN1p5NDF0VWVZRXRra3EyRzFWZ1BneGdlT04wWGkvNGo3ZERNMkpu?=
 =?utf-8?B?MzNxaE5jN3JxYkhOT3JtMFZqWTEwemloNmNsSFN1aWhyUVZCbE8vMDV5R2hq?=
 =?utf-8?B?U2lqT3YyVzhWV0VXa05PeXorblIyUzN1amNwQWhtS0txajdRalhiQ2FlWUl2?=
 =?utf-8?B?NUozWE9jTzBOVnVROVBxWDZFV2FTM0RZV0wzSTkzaUFsNUw5cTlGQ3p3K05G?=
 =?utf-8?B?aWNnVzJQU3FDUjd4Ti9adkJZbEIvR2dPSElJcHNlTldsR1dHcjE4VURKZEh0?=
 =?utf-8?B?ZDQ3QWhGS3REUW4zU0YwTFNzSEpZQVdoZXdleDNWNzdPUDV2US9VSU5nalBT?=
 =?utf-8?B?RUgxMXBkajFrUEUrWms4b0I1cmNzbm9iOGIxVmRrNG42V3M1Z0l3YjZkTFNT?=
 =?utf-8?B?VW1ac3pkVjVkNmtCTGlkelNEd0VKRm5kU1ovd25WRVR3c1dtK1U0YXArRmor?=
 =?utf-8?B?cUVnbUZoZUtoemxKcUFCVHphK2dGbFF0RU9acStBMTVhaVBUTHVPT2VET0xN?=
 =?utf-8?B?WU41R3hGYWpmSXFXK0pDMU1GcDMvTVFzZ3ZUNUdZb1dHYXlsMDhzSDh4eWRR?=
 =?utf-8?B?c2s3RlBod0luRlMyRFhRbnhDVVA3cW1vQURDMUJPdFRqTHdwak5jZElrS0J4?=
 =?utf-8?B?SkpwanNidlB5YXY2UnFyVlErZkU5SVVQdU0wb0wwM3ljM1diREdQYXlvdENn?=
 =?utf-8?B?ek9jaUhtUEt4clEvUFVSK0k5NG1TcFlTdVEwWExqVnh3U3M2c0RTUG9IRWRi?=
 =?utf-8?B?R2pQS3pvcFIrOGRWbUovY1RucW9SZUZJQjBoM1loL1l5c1VXV1hWK2VXQ3Fl?=
 =?utf-8?B?cDV5WmtPTW00dFVXanRtUkJ0MmJjcFllbmJMYmxJZElycmJMbHJkODZWN2Jj?=
 =?utf-8?B?cFZ6SU9iSFZZdEJ1dFlWSEM3RzhzUWJmRXJiUEhUWkcxdEJFZElUMWlZQ0xm?=
 =?utf-8?B?czI2TEM5d0pmNWFkU25mQzgyMVk1RUk5SHVsM1p3NUM4N0NVdFFjY0dhbGIr?=
 =?utf-8?B?SjE1TUVvbFR6b25UNk5zQ1ZOVVM4T25RNDRzVWtVUjVHbEhRYnlKd1ZoRmhZ?=
 =?utf-8?B?T1FsMGw3ak5oZjR5dHhXbnplclMrcThvTVpvdjhndXlvckpMWFhoY1JSWVF0?=
 =?utf-8?B?OTRKMTA5aWsweGhFOXNTejNmemE5MU5mSkErVEVXZzBpam9IdlkzcGljYVN1?=
 =?utf-8?B?UEsvUHgxQmswbXF6b0lBaEhBMHJ0bW81Vzk1d3gybkRNV3NxazJsUWZ0MW9Y?=
 =?utf-8?B?c3VJMGQ0WkhPaXRhR3FtTWFYcDRrR1E4SW5HSFQxZVVxbldrdFFiaFVuTEVY?=
 =?utf-8?B?TVVTVVBOZDg2bG5hb1lSbCs5cCtFa2MzdGZMa0prOGZGWlNKQ3B4MmN6VmQr?=
 =?utf-8?B?NkVDcVRjUktFSkFNNzVVQ1A0MStGQmduanIzZ0RvaG5VMXR2VU53Nm9wTERj?=
 =?utf-8?B?RmtNa0RFWHBJOUdmaXhsdXM1d3VFOWJqclphRGpXS3pCaWlTZ3NjUFRINHI0?=
 =?utf-8?B?bzVQbHRMZDZWR1k5VE5HTmkvMjFMN1ZwY1htZkZNQkVRWXFSanJkeG9PZWZU?=
 =?utf-8?B?aFM1ZE9DbE5SWkxQbVpEajUvSDQ1Nmd2cThjRlhFN1dNTTBqOTlrekk2TGph?=
 =?utf-8?B?UnY4N3UyZVh6eGh0c09EVGh3VWdKd3JLU3JVdlBjcnBKSUxON0FwNGRVWXRp?=
 =?utf-8?B?YytENDdrMHhJb082TTNFV1dEbUx0T0NpbVhiN1BMUWx3YkM4Z2lsZGs2S0t0?=
 =?utf-8?B?dzdxeDhWaVo5QmF2UlJMTjArL2Q0Q3ZsRW1oMFNoSC91eThGVkI3ZE9EVnRi?=
 =?utf-8?B?eTlDQ205a0cyZEtsMzFjQ0VIK0lQeFpjc3lWNWFlVlNVdURnVzhuYi9iZk9N?=
 =?utf-8?Q?xT3PgPcN/dPbGVAFhA7LmJoFu2FM8f12?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2P195MB2491.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?R3ZZeFhoT0xUc1BJcFpzMmlIVmR5RHlVWklWc1pyMWdRYnRxWklTYkYvbmpD?=
 =?utf-8?B?WHVLaVRxaGdlSmNIUmdSZk82ZHJETEVqaUorUjVUR1JRL2dsN1pGSmZKYkxq?=
 =?utf-8?B?NWhLMXhTK2F2Q0V3QkJZbTRITTZiV0gxQWNEZWJJUzVKM0JqVEZneE5RY3gy?=
 =?utf-8?B?VmZaQXprUHltRHVUbTdmaXlZU0twUHlNK3prZk54a09nVWFPR1p2UkJGL0lj?=
 =?utf-8?B?M3RRR01iNFB3d0RjYXFmSzdtQ2VKWlJpTk5xSWFpZ3RiT3F3N0F5WnlLbmRh?=
 =?utf-8?B?S1pXdFZPSXQ2cW5lQkhsb2RxZzdOSjBYUktqVitPQ2EyTXhCTnQrRjBYZ3cz?=
 =?utf-8?B?dWlOa2tPeVRyV3hTemxGbFdlNmdoeVNreWhRcnh2Zm5vMDVKcWM0VjJJOG91?=
 =?utf-8?B?YmNycnVudGNvbkVmUmdiN3hyeXlldUpxdDFMM0p5bGJQZVU4QjZYTW8wT0JP?=
 =?utf-8?B?ZjIxbjNmb09haFppdDFUK0s2dDZaNDlPb1drYk0yZkdxVjBJQ3dDRXN0VU4x?=
 =?utf-8?B?U05GalhnQWVIVGZMNUU3dWRwOU5YVkJUOFQ2SVBEMlAxMm9lUjYxNWpjYmU4?=
 =?utf-8?B?TFVYUXpvSldxeTFzWHE0ZXI4UlFydnB2T2NNamFkVGthWHRCZXlsaCtNYkVz?=
 =?utf-8?B?Y0N1UitzblMwa3hrOFlFOWM3ZDhnM0ZsNmlnUWN0d3dJVlVMWDNjUk8yeGt1?=
 =?utf-8?B?NkdHYml6QUhBUjJ6Y0VpK01rNmF3UFNNa0c2U0s1VTJMRWdXVVJ3OCtzeC91?=
 =?utf-8?B?bHMvZXNFVTMyd0g1K3VNL2tzZGxFY2FjcUJDR1VoMUI1OWptbnRKVTVibGpm?=
 =?utf-8?B?VWZHb1A3OUlmbGRYS3FmdUthNHFvWFVzbWtMc1d3YXE0a1N5cnhFeGdaNk9w?=
 =?utf-8?B?Sk95YWNXTktObStDU1lOdnREOGV0VzNkajUyS25kWWJDakI2aXVOQURWNnFG?=
 =?utf-8?B?blBDakpPZllySkhBZkJ3ZVdBdC9kOHczbThlRnhUaVdaa1pIMWlIRjZsRmJj?=
 =?utf-8?B?dVA3cGRFVVZpYWovWGlmMnJ2RGlaNlBCd3F1Rjh0dm1mU0Y1cTBlaTV0cUpr?=
 =?utf-8?B?OGFwNFFjNFdwNVdxM2JIdkI4YXJ1U3NhbVAxL1ZjQnZxMURKRDNtR2pzdm9Q?=
 =?utf-8?B?SDY5WWlNcXNsbzR0d1Z0NnV2NzgrQjVPdEpIdmFrSzJWNVFFVzRwbGtiS2hp?=
 =?utf-8?B?NnRRTjNzc1ltRkxteXZLejFkSUFpVVNockZBbitRZ0lBc2NDdUpQblpaS2Nm?=
 =?utf-8?B?M0NkakVZaVF5WW4xWlFHK2RYTm9mRWtRVThKcmJBZkFIeGxTc1lCTjRoOUZi?=
 =?utf-8?B?aWhjUkZrQkFCRUFhVXdiSXFxay91bTBDWjQvT241S2hFV2doT1Fib3M0Y05T?=
 =?utf-8?B?UjZ1cVZudkY0Z3ZxUnFkOVBCU0FTRk4rUHJTUzVtM2hsNmVhUVJUN3dNZisw?=
 =?utf-8?B?cjBkWkVRQ2JMRU4yMGtRS0locUZueXlvTVM0VzExdlBUeGV0dlFvS0JOZEJm?=
 =?utf-8?B?Smp4R2sxeUtKcWQ3WU9yelNqeEd1RE5XMXZ5clBoOUtqRFQ1c3FNY01XMVE5?=
 =?utf-8?B?bTFGdVJEb2t0ZUh1NFRnK2lGS2V0NWRlcjFaN0YwVGxMU2JpclI1OUx0ZHJB?=
 =?utf-8?B?N0ZjVWIzUEd2UU4ybUliL3dKWWdkWHJLdTR3U0p1SldTUm5YR3ludVJQOWxM?=
 =?utf-8?B?aEVQK2NmTGpyWHVQMFBJWTltMWVTOXlITTVIakd2SDJGbkZqOTdzZlRrOXVr?=
 =?utf-8?B?RlFEamFuTmk5T1IrK1dEa2E1SnRlczZPdURIaVg3MjlDekxoUlZPTFZvdGZW?=
 =?utf-8?B?Q29yK2hXd2lEVmpERi91TDdTZFFxdGF2ZjNSSzhlTjZ5d29GcVhqa0J4c1RO?=
 =?utf-8?B?M0tRTGVFZ0c1Wk51WkRtQkJ4a1g3NW1hVUQ1U1EvNE5hTFYvbm9OaFh3QndQ?=
 =?utf-8?B?TlN5aWFONk83aHR2YXl6Q0pNMjluOW5iWlZxSTlyZ0EybTZXRSt0amJnRUZs?=
 =?utf-8?B?NXhkMFRKd3ZyNllGVjVQa245TVFWWmxCSU9IZktOOFIvYzFkWHZLRlFnNk9S?=
 =?utf-8?B?c1Z0cHJXNExnZHhveWRPV2Fyb1RlUkJ1SXVoSFEyY04xclNEZ21wc2U5RkYy?=
 =?utf-8?Q?b1Oo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <35B4195C66E9A0498E86C3D4DAC8F353@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI2P195MB2491.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e39391b-afda-4bfc-aa7d-08ddd990dfa0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2025 11:10:40.6398
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G7pJmRCmzt6AGaMbm+LDFjO6AOlidNX0wjZssFHr8xJoPEO13RgDq7d+gezStg/14yxmJ4EwcoqegsmT22W/tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWP195MB2806
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 11:10:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221764

SGkgUXVlbnRpbiwKCkFtIERpZW5zdGFnLCBkZW0gMTIuMDguMjAyNSB1bSAxMjoxMCArMDIwMCBz
Y2hyaWViIFF1ZW50aW4gU2NodWx6Ogo+IEhpIE1hcnRpbiwgWWFubmljLAo+IAo+IFRoYW5rcyBm
b3IgdGhlIHBhdGNoIGFuZCB0aGUgdGVzdCBidXQuLi4KPiAKPiBPbiA4LzEyLzI1IDExOjUxIEFN
LCBNYXJ0aW4gU2Nod2FuIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOgo+ID4gW1lv
dSBkb24ndCBvZnRlbiBnZXQgZW1haWwgZnJvbSBtLnNjaHdhbj1waHl0ZWMuZGVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZy4KPiA+IExlYXJuIHdoeSB0aGlzIGlzIGltcG9ydGFudCBhdAo+ID4gaHR0
cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uwqBdCj4gPiAKPiA+IE9u
bHkgYWRkIGZlYXR1cmUgbW9kaWZpZXJzIHRvIHRoZSAtbWNwdSBhbmQvb3IgLW1hcmNoIG9wdGlv
biwgaWYKPiA+IC1tY3B1Ly1tYXJjaCBpcyBhY3R1YWxseSBzcGVjaWZpZWQuIEZvciBzb21lIHZl
cnkgYmFzaWMgdHVuZXMsIGxpa2UKPiA+ICJhYXJjaDY0IiB3aXRob3V0IGFueSBBUk0gdmVyc2lv
biwgdGhlIC1tY3B1IG9wdGlvbiBpcyBvbWl0dGVkIGFuZCB0aHVzCj4gPiBubyBmZWF0dXJlIG1v
ZGlmaWVycyBzaG91bGQgYmUgYWRkZWQuCj4gPiAKPiA+IEZpeGVzOiA3NTQzNDVkNjA2M2MgKCJm
ZWF0dXJlLWFybS1jcnlwdG86IEFkZCArbm9jcnlwdG8gdG8gLW1jcHUgd2hlbiBjcnlwdG8KPiA+
IG5vdCBpbiBmZWF0dXJlcyIpCj4gPiAKPiAKPiAuLi50aGlzIGhhcyBhbHJlYWR5IGJlZW4gc2Vu
dCBhbmQgcmVqZWN0ZWQsIHNlZSAKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vcGVuZW1iZWRk
ZWQtY29yZS8yMDI1MDgwNTE3MTYxOS4xMzU3MTkzLTEtcmFqLmtoZW1AZ21haWwuY29tLwo+IAo+
IFBsZWFzZSBzZWUgdGhlIHYyIGhlcmUgaW5zdGVhZDogCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvb3BlbmVtYmVkZGVkLWNvcmUvMjAyNTA4MDYwNTA4MzguMzMxMTAzNy0xLXJhai5raGVtQGdt
YWlsLmNvbS9ULyN1Cj4gCj4gQ291bGQgeW91IHBsZWFzZSB0ZXN0IGFuZCByZXZpZXcgdGhhdCBw
YXRjaCBpbnN0ZWFkPyBUaGFua3MhCgpUaGFua3MsIHdpbGwgZG8uCgpZYW5uaWMKCj4gCj4gQ2hl
ZXJzLAo+IFF1ZW50aW4K


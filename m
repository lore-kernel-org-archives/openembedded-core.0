Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5916FC5B572
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 03:57:45 +0000 (UTC)
Received: from TYDPR03CU002.outbound.protection.outlook.com (TYDPR03CU002.outbound.protection.outlook.com [52.101.127.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23271.1786939058350943271
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 20:57:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector1 header.b=gXD4lgJi;
 spf=pass (domain: aspeedtech.com, ip: 52.101.127.78, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t0hKoeubmbNte4bJ/MTF21wdhiL1kQY2FqTfYOTftJSlCL8XlRtK1oEe44GVSm1jEgu5Dev8esJmFwtGYQJqXAP70y4sHSkEgAFpmr7JCFGc0mQlH6li4kYT7eXj5H2iWe8Vu6ySyfTd4XQ0tpbiX7kB+guklZe7mnaDVos6oD6jogaDal3E2hyFpykHaRb+h4DWLG7P0j29hgTDHs10UB6gC1k1KorYC0jIddxHj/MnCYDcJbTb6DeJL1uNU30efBzzZ6Eu6K8H3Z2gH+PFD8JUydsUee5JmSWGADWTvDaiRFc4zVW8PXDj3gCp8LH2EGDbxZWd9br77Xtaf1zQcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QmsxS5JY2dFLQ/+HDXkyceP9x/kYY+6Pd+XC3dAgSxA=;
 b=Ac8fJw8NuvdgkmrzG/4cxKeYddQCi8dfZReu9lLEoeW1AdWh7Kc6FHdI/1Onns3tgXmShVdX0ongGe74eucRAZ7mx7xtwAKOwr9zVBRi7qnM9AhRkzdhs69ZQl3Uf06QK+nCcRTAzObhNBAQrTxqAhfd4Dl0H8mlR8QB7ww44cxMJxtw6ebS5noL7lyMYSrfmA02XGpvaeck1USyCOu9AG2dHNAJV/vzRPQ7o/0Hxd/kmMDgXlEraGlt7kSaNsO8FlPCh/3nT4Sfy6mFcbE4po4QDnLnjXf9/BozgmrGOm6372V78Fs73XhMJYG1dxboMOkeG4xT/hvEVTWLHcT4xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QmsxS5JY2dFLQ/+HDXkyceP9x/kYY+6Pd+XC3dAgSxA=;
 b=gXD4lgJinhNWxmty1AL69WwmfsFKcHblJaVTsbHFD6tIWogGqXPoLYRLRQXmlwk4HGPgXludUyW10BDok4P/AqgkDBW32Iqm2x/1OlQthc+IlP6L47fQv88N4bQ5za6cB3cYy1aCcyg21Bd8i3LoE+W07NT0RigxCYfrgYGJb2OQGjwmeN6UXBDR1WGYu1JM5tUReAjyzip5Br2vlIFjMZBtMSwEOctUbKFDhOBWZf/FvyrkRRKDaeNyH/433QMxFKSg/EPu3NixytDpFCG+PHLHl7pGP9ZkgHfZmIuU8Z53SZCA8CntcuiVVba4Nw4s6h+wnh798iCOdGeTzmSVTw==
Received: from TYZPR06MB4980.apcprd06.prod.outlook.com (2603:1096:400:1cc::10)
 by TYZPR06MB6989.apcprd06.prod.outlook.com (2603:1096:405:45::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 03:57:32 +0000
Received: from TYZPR06MB4980.apcprd06.prod.outlook.com
 ([fe80::ea8a:7cb7:4822:2fb3]) by TYZPR06MB4980.apcprd06.prod.outlook.com
 ([fe80::ea8a:7cb7:4822:2fb3%6]) with mapi id 15.21.0315.016; Mon, 17 Aug 2026
 03:57:30 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Paul Barker <paul@pbarker.dev>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>, "mathieu.dubois-briand@bootlin.com"
	<mathieu.dubois-briand@bootlin.com>
CC: Troy Lee <troy_lee@aspeedtech.com>
Subject: RE: [PATCH v4 1/5] oe/patch: Skip commitIgnored when nothing is
 actually staged
Thread-Topic: [PATCH v4 1/5] oe/patch: Skip commitIgnored when nothing is
 actually staged
Thread-Index: AQHdIM6vWbfO175rC02B/a9fFTzGHragmGWAgAEey3A=
Date: Mon, 17 Aug 2026 03:57:30 +0000
Message-ID: 
 <TYZPR06MB49803FB875B441B2936B1B6DFCA72@TYZPR06MB4980.apcprd06.prod.outlook.com>
References: <20260731092634.1127862-1-jamin_lin@aspeedtech.com>
	 <20260731092634.1127862-2-jamin_lin@aspeedtech.com>
 <3e5f24dc43f974a5572ab35ad6ab77e0135bbda6.camel@pbarker.dev>
In-Reply-To: <3e5f24dc43f974a5572ab35ad6ab77e0135bbda6.camel@pbarker.dev>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB4980:EE_|TYZPR06MB6989:EE_
x-ms-office365-filtering-correlation-id: 7746878e-9aa7-416d-caeb-08defc13a957
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|38070700021|10067099003|56012099006|4143699003|5023799004|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 LOXphkAf5ECiFnhanQ95oNR4JbCQS2C0DJrPESY6LDnVoDkDjRH/cGGFFKbIwb5NoqwUjEC7lau2hhd+WT7yJaWIJzNY4FcOUTwtXdNryxgLnvCt5oic60RU+nPxHDRBsGzwjylVemJjY5b7D+lj2ofVCkFyAKIpI+d112hsLpUs59LrMDDk49pK3WyDupoi6O2d9uoE4p4n7w1UAtCRodoUsjbwwJDnXXH8Pxrc5In1cM32wWMz6GI4ZmW/B+2QtTboUeZa8Yienz5Fw06PKasQwh5sqFNXvTgYtoGbwiEaGJjUCKXi89sHUhgcVKFCYIv/G5PcGQGOmz31j1DxT7uLq0xNyF6YZnS7ujwnYEmTiWPrsxQKu6tETz0Q5xg0ZSlcWP5Ba0YFOFYJSaEw1t5MNvf5ODwk7AzyYY5naVBwYLUh2cNeuzHN1lzsOPRpBzEtSjUGjIsUpk/Dko3RUSL8o8pS7tcanIpZXWSj5doyUX9AOlEznS0aJXFejK1FV3l2ccC/YDdHBK2/+DiG5JMqs6TisfSLMTXSkgP+nRgdLCLjlneOKwEMOHTpxF9+EcmqcTUBomQMmfoRtVAXM7I9pg9le8Ahimk6wOp5QfkMYMUlyypAc1U45ADi+M130T67mN59VdLnPpe25gU7Hnl1Q5ovSAacG3iCCj4tSJmXUlEkgOMHu5FAveN+cHeKf7WBDWCKSm3xkKs8ZGkW7OauTWsGqhwcCm74YZd94IE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4980.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(38070700021)(10067099003)(56012099006)(4143699003)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QWRlRmRwRCtqdDBVb3Uzd3JLZXFkYkFENkpINlk1QnZFTG5xemNCc20vL01N?=
 =?utf-8?B?cHc2c3FyMEN0ZG4vVy9Rc1RmWSsrSTROcHhvNW9jWndFT2hTeGFObm42RXUv?=
 =?utf-8?B?YVVEOGhKOFNVeHFvWVI5NVR3V25TSU5ObVZJaExtQkZVY1NSem1xdHVsbzlC?=
 =?utf-8?B?cGZvWWJyQ1RpVldmQm1iNmZNTXJXL0RqMjhwYmlxU3RONDJGUGdJL1A0TXVj?=
 =?utf-8?B?ZysrQWMyakUrYnMvcExIcFdEOXd4ZDZLUEx5UTI2MFZENkRJK1JxVkRtczdK?=
 =?utf-8?B?Rk9HZUpzdnJRSmUrSGgyL1lEMHZUZVFBMk82aGs3bGVKTC8zVnhzQVFvQk9T?=
 =?utf-8?B?WEpsajNhNmZ4eGYrSWNXaktWVEZjakwvdHRZY2Nad0pBNEZIZTBaeEtJNmYz?=
 =?utf-8?B?eStUYUpTL0FhWGs3R0xxT2Vhc2gyOTFPcWZtdkgxZzdBYzc2NUo2VzY4dGE5?=
 =?utf-8?B?dFB2QmVoV2Q5c21oUUpqa21aYjVoWE1uczlFcEJhSjdSdU9OSmhsZkF4YzB1?=
 =?utf-8?B?d09vMkhMWnpNSjVSanZvSzNxUTNEaytvQ0YxQnllRjBGeWxIR3U2NGpGV2Nj?=
 =?utf-8?B?WUVvamtyd1M3ZU1RQVZFa2VGQUVOQTUySmh3RnhRNURPc0NObGNtV296OVpT?=
 =?utf-8?B?RkIzWmFzbGdWcmFVN0VXRU5QcFU1WGlNYkJ5RXllbGRyRmJ2WWN3SU9aTzFD?=
 =?utf-8?B?czdXQjROb1l4cEJEWEVEUUtZajN2Ym5saGtENVdqNHE2L2JDa0RmKzlNRXkx?=
 =?utf-8?B?dEZ3aHdJZzlBQjdwSC9iQldKNXhXUTJlOWxYSVcyS2Iza2p1c3RBaS9hTFMw?=
 =?utf-8?B?b3RLMUZJMHJ4RkdJczdBY2czNDFJT1BISjJKUnhtVkNjVnJBeGdjai90Z1FP?=
 =?utf-8?B?MjRkdkhhZUR2U3pNcGhOUmxyZExWelRneTZYYlFyNnpkWUxmcy9zNlFwRFlr?=
 =?utf-8?B?RTBKbzJ4dUxHdFA4NDNWWXJKcktCT3RNSm5vSUNzOVBzbHpRN0FIN2JRR1U5?=
 =?utf-8?B?N2JpSlZyR2EyYTdsUU1Lam94b1JrRlZkUld2YXpVOVVUVUo4QmQyN0UxVjh5?=
 =?utf-8?B?eU5QUW1ZQTlHMExsODlXZHdPN1NDVmRUTUFrZkxUcXhaN3I4NkttdzczQm1D?=
 =?utf-8?B?YlBFcjBqK1JrbTN6VnRJRmVsZ2dFL1Jldy9yMHlIY3o2YUVMbU1wZFJCZ3NY?=
 =?utf-8?B?TWlIa0t2N0RyU1VqemFVcjMyUTV6WStDMUk5ZWhIQXNRbEcyeko5K2lBOE8x?=
 =?utf-8?B?ZGpxaDhRdHZWUHJ1eTVxTEtFWFE0TERVYXhXMmZ6Z3dwdVBTTmlqenhLK1dm?=
 =?utf-8?B?MHBCejd4dStZbFFKcktZeTNsY082WWhGTjRPU1ZzN3FRMDRqK3Juc1pQQTY0?=
 =?utf-8?B?dTV0V0NkaGtIZjZ0czZkQzVZenZkR2JsZ29nVEFKMTlkM2tLVzlRVVd2V2pB?=
 =?utf-8?B?TWxrb2E5QmlOTFFnb2hDMldTNGVZRTJBaGhWMmlCc3o0dTZvd0JiK0NoZzVR?=
 =?utf-8?B?dnhNU3BFd0ZRTFlIMkRyRmJRaG82OWRzZGRPd1ZKZTlJZlJlM2RZL2tZL3Uv?=
 =?utf-8?B?UUJwZmpDVHpLVGNLdkU1WXIxdklIMlJHaWg5RzNpUXVKVmJGdnNLZFpIRzM3?=
 =?utf-8?B?L0lEY3VoTUpQSW85SzY2cEE2T21vTTl1elNNMGdxcC9qZDFMVm83dUxvVVlk?=
 =?utf-8?B?bG5zS3pJdWFLV3JjOEdQN25QRVBoZTdneG1VM08rL3JwS0Y1STl5c1g5RkNK?=
 =?utf-8?B?RzZjZW9HUWx4blpIOGpvUGN4ekJYVkJFc0d6Sk45UzJ1UVJGZUo2NGxTUUlK?=
 =?utf-8?B?bmdjNThEMGlZempIZDZKZmRxRGFRRmdwV1NPZnUyQU0yVFBEa1ZXdjZRWWUr?=
 =?utf-8?B?VWhFczhzSmc0eC9OaVcySTlZL2ZkNUl5UjhLYmhpb0hMY1cwVlM0VWxsM2Ns?=
 =?utf-8?B?OUtSRGwyZmVNVVJRdUJSRk9WMGd1a0RZMTFkUk5BdFNneVJUVGJnbUVXdjBl?=
 =?utf-8?B?d1MwK0xVS0lqL2JsRGNnNHFJVCtLbGZrUWNCL2ZUeXUrYmM0dm51NlBHeDZS?=
 =?utf-8?B?aUlnTzlFTDkxKzUrNytwV1UvblVtdDVjeEdaSVBMcUVzUzVkS0NHNEphNnVq?=
 =?utf-8?B?a0c1by9lMFlVa2duTWxKSXNZLzJWOWJzdnU2Y3RSODZUbDM1UTBSMDdYbmJm?=
 =?utf-8?B?U1FCNDRDMzYwM0kzbUpYK3Rlc3pvR3RMbXhBZ2p4eVYwcUY3NDh1OUE4QURh?=
 =?utf-8?B?RW13UE8vTUpaVzAwY0tEcnNqd2lldHhsYk13dEpDdlNnVkhva2NtbDRoMG9Z?=
 =?utf-8?B?MStNMUhrZTVLeERhZUZXaXFpWHZneURGbHdVQTVGSDgwWUxZNnRoZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	jdPb+yLC99agB4hhfETpSohKgrN2+fXLuNacCLyuI1Ahh06FIl9uP2kV4vXgreESL9gS54aSVqtdN6f7lSscRqPDInP5rDMpig5SwyxAZ6M9p/sZCRTFVWr/VQJsvD0wLnuRj2ADOXWNbr4dl5syPmqpjE+tYMtCeKAWX+cAchVhe2LcWOATDL6qOylQhrWM//Sh80/zyT+c8QgMsu5MAeGMbBCA9Po9zijt0Lyz+dlwoh7IHvXhknTXwTnQr1/I/QjcAC/B9J/isY5dLWPl4UeNWHIU/wTiRwqmqZGl0y5bj1aFDiRxC1eCrSyQdBlJ/EGQNmWLxBameBydPy0uig==
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4980.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7746878e-9aa7-416d-caeb-08defc13a957
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2026 03:57:30.8351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: msUB6BbIgAX2iUYEOmVbsGoUqlujjIi2NUPPRyAOq9TlpSTdaz5jPGJuKu5kFxlt9a82e+txEB7x8WeaUO3MFAlJU0o//39qvhi50MLy51I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6989
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 03:57:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243582

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQYXVsIEJhcmtlciA8cGF1bEBw
YmFya2VyLmRldj4NCj4gU2VudDogU3VuZGF5LCBBdWd1c3QgMTYsIDIwMjYgNjo1MCBQTQ0KPiBU
bzogSmFtaW4gTGluIDxqYW1pbl9saW5AYXNwZWVkdGVjaC5jb20+Ow0KPiBvcGVuZW1iZWRkZWQt
Y29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnOyBhbGV4LmthbmF2aW5AZ21haWwuY29tOw0KPiBt
YXRoaWV1LmR1Ym9pcy1icmlhbmRAYm9vdGxpbi5jb20NCj4gQ2M6IFRyb3kgTGVlIDx0cm95X2xl
ZUBhc3BlZWR0ZWNoLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAxLzVdIG9lL3BhdGNo
OiBTa2lwIGNvbW1pdElnbm9yZWQgd2hlbiBub3RoaW5nIGlzDQo+IGFjdHVhbGx5IHN0YWdlZA0K
PiANCj4gT24gRnJpLCAyMDI2LTA3LTMxIGF0IDA5OjI2ICswMDAwLCBKYW1pbiBMaW4gd3JvdGU6
DQo+ID4gcGF0Y2guYmJjbGFzcydzIHBhdGNoX3Rhc2tfcG9zdGZ1bmMgY2FsbHMgR2l0QXBwbHlU
cmVlLmNvbW1pdElnbm9yZWQoKQ0KPiA+IHdoZW5ldmVyICdnaXQgc3RhdHVzIC0tcG9yY2VsYWlu
IC4nIHJlcG9ydHMgdGhlIHNvdXJjZSB0cmVlIGFzIGRpcnR5DQo+ID4gYWZ0ZXIgZG9fcGF0Y2gs
IHRvIHNuYXBzaG90IHRob3NlIGNoYW5nZXMgaW50byB0aGUgZGV2dG9vbCB0cmFja2luZw0KPiA+
IHJlcG8gd2l0aCAnZ2l0IGFkZCcgKyAnZ2l0IGNvbW1pdCcuDQo+ID4NCj4gPiBBIHBhdGggY2Fu
IGJlIHJlcG9ydGVkIGFzIGRpcnR5IGJ5IGdpdCBzdGF0dXMgcHVyZWx5IGJlY2F1c2UgaXQgaXMg
YQ0KPiA+IHN1Ym1vZHVsZSAob3IgYW4gdW5yZWdpc3RlcmVkIGVtYmVkZGVkIGdpdCByZXBvKSB0
aGF0IGl0c2VsZiBoYXMNCj4gPiBtb2RpZmllZCBvciB1bnRyYWNrZWQgY29udGVudCAtIGZvciBl
eGFtcGxlIGEgcmVjaXBlIHdpdGggbXVsdGlwbGUgZ2l0DQo+ID4gU1JDX1VSSSBlbnRyaWVzIHdo
ZXJlIG9uZSBkZXN0c3VmZml4IHBsYWNlcyBhIHJlcG8gaW5zaWRlIGFub3RoZXINCj4gPiByZXBv
J3Mgb3duIHdvcmtpbmcgdHJlZS4gVGhlIG91dGVyIHJlcG8ncyB0cmFja2VkIGNvbW1pdCBoYXNo
IGZvciB0aGF0DQo+ID4gc3VibW9kdWxlIGhhc24ndCBjaGFuZ2VkLCBzbyAnZ2l0IGFkZCcgaGFz
IG5vdGhpbmcgbmV3IHRvIHN0YWdlIGZvcg0KPiA+IGl0LCBhbmQgZ2l0IHJlZnVzZXMgdG8gZm9s
ZCB0aGUgc3VibW9kdWxlJ3Mgb3duIGRpcnR5IHN0YXRlIGludG8gYQ0KPiA+IHBsYWluIGNvbW1p
dCB3aXRob3V0IGl0IGJlaW5nIHJlc29sdmVkIGZpcnN0Og0KPiA+DQo+ID4gICAkIGdpdCBjb21t
aXQgLW0gLi4uIC0tbm8tdmVyaWZ5IC0tbm8tZ3BnLXNpZ24NCj4gPiAgIENoYW5nZXMgbm90IHN0
YWdlZCBmb3IgY29tbWl0Og0KPiA+ICAgICAoY29tbWl0IG9yIGRpc2NhcmQgdGhlIHVudHJhY2tl
ZCBvciBtb2RpZmllZCBjb250ZW50IGluIHN1Ym1vZHVsZXMpDQo+ID4gICAgICAgICAgIG1vZGlm
aWVkOiAgIGxldmVsMSAobW9kaWZpZWQgY29udGVudCkNCj4gPiAgIG5vIGNoYW5nZXMgYWRkZWQg
dG8gY29tbWl0ICh1c2UgImdpdCBhZGQiIGFuZC9vciAiZ2l0IGNvbW1pdCAtYSIpDQo+ID4NCj4g
PiAnZ2l0IGNvbW1pdCcgdGhlbiBleGl0cyBub24temVybyB3aXRoIG5vdGhpbmcgdG8gY29tbWl0
LCBhbmQNCj4gPiBjb21taXRJZ25vcmVkKCkgcHJvcGFnYXRlcyB0aGF0IGZhaWx1cmUgc3RyYWln
aHQgdXAsIHRha2luZyB0aGUgd2hvbGUNCj4gPiBkb19wYXRjaCB0YXNrIGRvd24gd2l0aCBpdC4N
Cj4gPg0KPiA+IEZpeCBieSBjaGVja2luZyAnZ2l0IGRpZmYgLS1jYWNoZWQgLS1uYW1lLW9ubHkn
IGFmdGVyICdnaXQgYWRkJzogaWYNCj4gPiBub3RoaW5nIHdhcyBhY3R1YWxseSBzdGFnZWQsIHRo
ZXJlIGlzIG5vdGhpbmcgbWVhbmluZ2Z1bCB0byBzbmFwc2hvdCwNCj4gPiBzbyBza2lwIHRoZSBj
b21taXQgKGFuZCB0aGUgbm90ZSBpdCB3b3VsZCBvdGhlcndpc2UgYWRkKSBpbnN0ZWFkIG9mDQo+
ID4gZmFpbGluZy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEphbWluIExpbiA8amFtaW5fbGlu
QGFzcGVlZHRlY2guY29tPg0KPiA+IC0tLQ0KPiA+ICBtZXRhL2xpYi9vZS9wYXRjaC5weSB8IDEy
ICsrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQ0KPiA+
DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEvbGliL29lL3BhdGNoLnB5IGIvbWV0YS9saWIvb2UvcGF0
Y2gucHkgaW5kZXgNCj4gPiAxZDUwZTgzYWI3Li45NDRkZGUxZTAzIDEwMDY0NA0KPiA+IC0tLSBh
L21ldGEvbGliL29lL3BhdGNoLnB5DQo+ID4gKysrIGIvbWV0YS9saWIvb2UvcGF0Y2gucHkNCj4g
PiBAQCAtNTE2LDYgKzUxNiwxOCBAQCBjbGFzcyBHaXRBcHBseVRyZWUoUGF0Y2hUcmVlKToNCj4g
PiAgICAgIGRlZiBjb21taXRJZ25vcmVkKHN1YmplY3QsIGRpcj1Ob25lLCBmaWxlcz1Ob25lLCBk
PU5vbmUpOg0KPiA+ICAgICAgICAgIGlmIGZpbGVzOg0KPiA+ICAgICAgICAgICAgICBydW5jbWQo
WydnaXQnLCAnYWRkJ10gKyBmaWxlcywgZGlyKQ0KPiA+ICsNCj4gPiArICAgICAgICAjICdnaXQg
YWRkJyBjYW4gbGVhdmUgbm90aGluZyBhY3R1YWxseSBzdGFnZWQgZXZlbiB0aG91Z2ggdGhlDQo+
IGNhbGxlcg0KPiA+ICsgICAgICAgICMgc2F3IGEgZGlydHkgc3RhdHVzOiBhIHBhdGggY2FuIHNo
b3cgYXMgbW9kaWZpZWQgcHVyZWx5IGJlY2F1c2UNCj4gaXQNCj4gPiArICAgICAgICAjIGlzIGEg
c3VibW9kdWxlL2VtYmVkZGVkIGdpdCByZXBvc2l0b3J5IHdpdGggbW9kaWZpZWQgb3INCj4gdW50
cmFja2VkDQo+ID4gKyAgICAgICAgIyBjb250ZW50IG9mIGl0cyBvd24gKGUuZy4gYSBmdXJ0aGVy
IG5lc3RlZCBnaXQgcmVwbyBmcm9tIGFub3RoZXINCj4gPiArICAgICAgICAjIGRlc3RzdWZmaXgg
U1JDX1VSSSBlbnRyeSkgLSBnaXQgcmVmdXNlcyB0byByZWNvcmQgdGhhdCB2aWEgYSBwbGFpbg0K
PiA+ICsgICAgICAgICMgJ2dpdCBhZGQnLydnaXQgY29tbWl0JyB3aXRob3V0IHJlc29sdmluZyB0
aGUgc3VibW9kdWxlJ3Mgb3duDQo+IHN0YXRlLA0KPiA+ICsgICAgICAgICMgc28gdGhlIGNvbW1p
dCBiZWxvdyB3b3VsZCBmYWlsIHdpdGggIm5vIGNoYW5nZXMgYWRkZWQgdG8NCj4gY29tbWl0Ii4N
Cj4gPiArICAgICAgICAjIFNraXAgdGhlIGNvbW1pdCBpZiB0aGVyZSBpcyBub3RoaW5nIGFjdHVh
bGx5IHN0YWdlZC4NCj4gPiArICAgICAgICBpZiBub3QgcnVuY21kKFsnZ2l0JywgJ2RpZmYnLCAn
LS1jYWNoZWQnLCAnLS1uYW1lLW9ubHknXSwgZGlyKS5zdHJpcCgpOg0KPiA+ICsgICAgICAgICAg
ICByZXR1cm4NCj4gDQo+IFRoaXMgaXMgYSBsb3Qgb2YgdGV4dCBmb3IgYSBzaW1wbGUgbWVzc2Fn
ZSwgd2FzIHRoaXMgQUkgZ2VuZXJhdGVkPw0KPiANClllcywgd2lsbCBhZGQgQUktR2VuZXJhdGVk
OiBVc2VzIENsYXVkDQoNCj4gV2UgY2FuIGp1c3Qgc2F5ICJTa2lwIHRoZSBjb21taXQgaWYgdGhl
cmUgaXMgbm90aGluZyBhY3R1YWxseSBzdGFnZWQiDQo+IGhlcmUuDQo+IA0KV2lsbCBkby4NCg0K
PiBCZXN0IHJlZ2FyZHMsDQo+IA0KPiAtLQ0KPiBQYXVsIEJhcmtlcg0KDQo=


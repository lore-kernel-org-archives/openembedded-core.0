Return-Path: <mark.jonas@de.bosch.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1543CA5FCB
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 13:00:09 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10584.1790859604221585696
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 06:00:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@de.bosch.com header.s=selector2 header.b=fkCK1fk+;
 spf=pass (domain: de.bosch.com, ip: 52.101.84.58, mailfrom: mark.jonas@de.bosch.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eW44j21JWeeZ4nQXqpihZaYGbPlKstW8MbWFDCQCz03TbcYNNTk2dvXhalT7yjzW+6Mdtp1i/tRr+kVU/k5lgwrFimrsx1ClHnXGLPjiS72K/1GdE2kjB0F4KOQk5STUBdOHKxIsXYly3tSXo+ddqCY7Q74fVDspfHs603eI8XXFMLu1asfHgolbsGdwxVDxfIiFpQlbsttZ3+BRl2qrIGeCnX1dJw0U4pgUQRgfDCxYh1KSvgbLAGHyrv4bYmGIhwsj7Kkvr1wPjcssIoR7pWkqTLAj3nEuYfHFjwg3kAT+aXxyy2wDPbUMOYzaWFpRgG1dNmbaUsUdzZb0UCG+sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MX4zquLFiZx+2aCj2rujs281Er3jzld6qhDcTxTUs/Q=;
 b=oSbU/9UIvhnctshsmJuVWz3+WlwHSWvO/bq5bjj3/nqvYmHXTF9vDD6qIarJ1FoIqNcTM3tTrgc9reYUp056Opd+VGKKrUNfK25SdUnAouTVSzgPLWV8Uiz+oO4PjQ3OCMXKdQSiYQUyjwQXBvmTtnRb5VEUCG9P64mT9EQzph+d4/Nt6KiuGRqlJReUIWNg/IdHM2UBxYmsUp94KPQoRiLKydG50XJzbhiFy+MBykDpqkVAVCrzHZMXRvBq4nLAx8Tgp3FA/kQZQS6K2LJFWnS0FvW3JG8otuasn/RAgHtUD5IZRwmWVCDQ2WyIZK3dLx96nMB4dcGFQRWGYjnT2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=de.bosch.com; dmarc=pass action=none header.from=de.bosch.com;
 dkim=pass header.d=de.bosch.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MX4zquLFiZx+2aCj2rujs281Er3jzld6qhDcTxTUs/Q=;
 b=fkCK1fk+aiiHwRsi2acViy86IptU3VIRritQmi+M7t070hPYKyP8ifY4enFEQQ8M+FyrzXZF2ZCWI6EOH6RT1KpANw6qmn5m0+MQFdRkfih6jkSSX2/iy2UCqBRHbvdZBPNb7mKFKRzEChAvhXfXWCQRx6pxilY/llbKkByjtUXcRFbv81fRal0+HC+cWbN3fWYxHo5rKX1CAIpQiRL4qUKlvAhqhWHsvpsg3n82OH76078taxhgvg7NizXD0zc7VJwMguCjPc5EWF1jXMbHWaG3YXp0Olsg2lsd9dnABkOyuRw/4b+T1fePqdVlhA9IoVLbHtPa6Wh2husPSbIu8g==
Received: from DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:338::11)
 by VI1PR10MB3646.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:138::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.27; Thu, 1 Oct
 2026 13:00:00 +0000
Received: from DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5dd6:d284:1ca8:ee9f]) by DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5dd6:d284:1ca8:ee9f%6]) with mapi id 15.21.0451.026; Thu, 1 Oct 2026
 13:00:00 +0000
From: "Jonas Mark (BT-EL/ESW1)" <mark.jonas@de.bosch.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Paul Barker
	<paul@pbarker.dev>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "wangmy@fujitsu.com" <wangmy@fujitsu.com>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>,
	"Simoes Ricardo (BT-EL/ESW2)" <Ricardo.Simoes@pt.bosch.com>
Subject: AW: [OE-core] [PATCH] xorgproto: Set ALLOW_EMPTY for the main package
Thread-Topic: [OE-core] [PATCH] xorgproto: Set ALLOW_EMPTY for the main
 package
Thread-Index: AQHdR3jHtav7oPpwiU+ohkEVBlLhq7bm6peAgAGGJjCAADABAIAAFo6g
Date: Thu, 1 Oct 2026 13:00:00 +0000
Message-ID: 
 <DB9PR10MB535471F68D8031C8A62C5D46AD8A2@DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM>
References: <20260918141849.1875-1-mark.jonas@de.bosch.com>
	 <f2101f97616baa3cee4c5733846dc6b64dd944c2.camel@pbarker.dev>
	 <DB9PR10MB53549FAC3975BDDD2B057243AD8A2@DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM>
 <34e67117d3a6fa876092f3736d3ecfa3f2b8fbc1.camel@linuxfoundation.org>
In-Reply-To: 
 <34e67117d3a6fa876092f3736d3ecfa3f2b8fbc1.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=de.bosch.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR10MB5354:EE_|VI1PR10MB3646:EE_
x-ms-office365-filtering-correlation-id: 0fdbee4d-3815-4e39-7855-08df1fbbe6ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 
 oFe2PizdYUr6LgCw7s33bjrHgrGG2op7dUlJEBw8Rfe3QQQXmY2alyb26/mCLp2U+wCVh3peLoXF+tUSNYvGuppWF2DFynuhUB+AXvXrCcZfr8eqThEtbZiI3cHxBeQG6LI+o4p7IEyk9khqanQQAUnlNgkPuqQL5sKzxISJ1Blu1+zuBqg9ID2B9nyEo6uVWJAqbACGwYhhKYCvmLuh6nSQ41J3en45YDAgRdcmK7cZIH4yEOpaO3BKFpbj1R4ed4JnnsLHd79gMJEJ/+kYaS1YDJNrLZHTINVknJLDU7AI6nZa5Kwj5/en2wpsl/oIWUkmDH4K/F+neGVVKPfygBnSuMrIAH6C+SCO8UVmeCXRFLK6Fcl0zyn79yP99IchuPhZwOWF0CoqG8T51ahr3rRnLV+dpK1jO/z0HCI01AQOwAKt3YvOCyzmt5dNkSIvY8dZwY1+T48F/SlVcPzo3OABWR/kezJDj7WZTsj20gzftn6+7EsbxAbRWeLaxzEchQ+MsZklvBAFDTm/IEDqrU7NHFVAN54azLXzOc3FuOFZ9eXIhN+M6YnBa3NuWQOe/kxqGVnJN43Fj51BWe3SfugjhvmHkkgWg86zT7AlWg6RNTyvX0KZUiUZ9fYUtcQaqGeXPCRd1e5Y+B0Arb5y+WHhJ2AYcie51F3BJZ0TEYyjong3LJ3qfuBCLz8iE1BuXx+YXYkbPqMnpd4uBATTYD/tnoh8FjKxOxQyvgobF2Y=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Z01nOVlFbUtwSllNSWo2SUtkZTc4SnByRVNCS1E4VDVLQ1RwMU81TC94MTF6?=
 =?utf-8?B?Q2RWT3d5SGxiN1M0clZnajFFOFFoZy9KTXFSYWI1cVljTmRpUnpEdHRhOFJH?=
 =?utf-8?B?ZlM2TFNjT0xHZXlVbFo5MW5qQURtc0FrWXB5VVRxeE5XVkxlL1ljRVZEY3Vl?=
 =?utf-8?B?OG1IQkVBZWdKcVBrM084SXp4TVl1WW54VDZVWDUwZHM1bXNJSXZ1KzNKN3Ax?=
 =?utf-8?B?emZ0U0p2Y2tjZ0tyOWNoVW9oUktpL2d3STNkODVDa3lVeWVZdllJd3lMdmJQ?=
 =?utf-8?B?U3A0aWRDYlV6UlhJU01mTVdjVW5OaEpjUGFmZ0ZxcWQ3WENpRkJwdzNSYm1I?=
 =?utf-8?B?MWNmWE1CeTFGOXFVOCs1Tmg1eXk4dDQ4YWx6ODZualNicHFVNHp1Y0NhYnBr?=
 =?utf-8?B?WTZpS3hGNlVOQnRURjNQUVhBMkU2WEQ4QnFDQklqMzRnMkJrQ1lQUXkyRzk2?=
 =?utf-8?B?dEcvOTVhZE10S3NCa25ZcUh0cnhSMDcrSUFZNFFMTDgwYlZiZ1BNSHBPVHJI?=
 =?utf-8?B?bnRnY1g0R0tjTFpwQ0hjY2l3bUxCakhHL3pQS3JZYllITHM1L3dqM29LUEpS?=
 =?utf-8?B?MGdZV3gxSWJDM2R4TXU3T3JVL1g0anNGakFQVFI3U3NxU1BxRmU5cHh5UmZE?=
 =?utf-8?B?TXJkdVZDVWwwdENmdHpkYmZVZlZQQ3lwUFY1WHpBYTNNOG1DeFZGZWhKUVZr?=
 =?utf-8?B?dXdlOE1sQlQxVDBIK1pHTklMNkx5VFpaZnRZNzVOejBUTmNUUmxlWG5oZjBZ?=
 =?utf-8?B?S01nYVZaZmpZVjFwSU9DS3V6akhOZ3FwbFJOdVZadVhsQ3JOK1pwOWxncVBW?=
 =?utf-8?B?akVYRzRYSHJHNWtjVHRzblJrdTNKaStwVDdKVnpWckkwME02eGxZcVlMRThV?=
 =?utf-8?B?T3NMWlkxM1VMZVRicFdQQkYwczgzQ0ROMnliVGp0VTJsNUM2cHdQdHg2cTVm?=
 =?utf-8?B?NU5naUI2WHJFRmNYcHlxK1R0eHZmazhvZ2VPRDNjNzZnTXpYM1dvNVdBNzIw?=
 =?utf-8?B?RHlYcS9LTVM0NkRPajVmWGU1MUVDRWhUbjlxeXMxYXRXeTVGMWt1aHk1NTd3?=
 =?utf-8?B?S3VEdmdOMVZYRUowcEVqTk5SM2FVTU5HWXBoaFdrVlZSS0wrM0loeFBKbGlV?=
 =?utf-8?B?MENaNVU2bjhwOTFHdXVKbE10U292eEp6UzhiWVpVWUdZL2tpZ1BCRlFZUTYy?=
 =?utf-8?B?cXhCN1U3MmFpZStKR2pUYmxPZ1NFMEMwQWg0T3IzRlUrZmE1d2tWSTloY1ov?=
 =?utf-8?B?OVlYZ1h0VXMvcytuOTRBWDg0cXdTdHU3c1pBelBmOCsvb09zNFByVjcyeW5h?=
 =?utf-8?B?eVpzTmlFYi8xY0dZUTNoRzZ4MksxNnBUc1RZR3pBMi9saHFtbHR0Ump3SE5R?=
 =?utf-8?B?Y2RpVnZPR2ZqUHlXQTVCOVdFQXNSMWp1d3BiR3ozb1l3aytHY21TbUI2eXkr?=
 =?utf-8?B?N2dGQUtnc3UwbWhvclp6SnA3QTRSMk1xNmQ2SE1raVhKdnJTaDRiUnNQTGdI?=
 =?utf-8?B?dk5ySXpjWHpUQjAvWnFZT0k2M2RpY1ZyQlRDRjNoOXJrbDkycGY5WUE2YW16?=
 =?utf-8?B?ZUZMQkg3Z0VKNXI0WDBjRWNaYkR0bVNwRm1xbUYxdnhqemhLbmE0VkVHMmJ5?=
 =?utf-8?B?Z2JwU2FJWlY2VEQ3YzJNTXcvNHNKbkRJRGpRZ0xnL0hFQ1NEOTcrZWNSejBP?=
 =?utf-8?B?Rzh3MGJzdElONGUwRjlqZFJVeGRlVXFyTURqUUtWWUE0eU5Za05mZjkycDhk?=
 =?utf-8?B?SHJPYSs5UWkwRzdpMnFWZ2dlZ2o4blk1STRnVERGVG8xYWxxN1N4NjFmb2JJ?=
 =?utf-8?B?TEVaOW9ham5jQ3E5eWFONFllVUN5alBNeDlKSFFxVEYxQUh2TVNKOXZoTEpU?=
 =?utf-8?B?SG5rWS9sT05MQmFScTZ4Nkt4elJnbndIZ3gwRzFWNnhCdmk0cW1OcHR6TXNJ?=
 =?utf-8?B?R3ZyN0F2MktGYWVQMGNVSW5nVWdWYVBmMGdya0hNVnVhekFydlhnRlQ4dmxF?=
 =?utf-8?B?WVQxVDR5aW5DbHQraHhmWGo1eHVBbkM2Nm1XZEI2MUtXaGJOdzdJcDFvSHB3?=
 =?utf-8?B?d3kxRVFMZHEzenRlVlNaNks3MUFnRGI4Q3ZlOW9ZRE5ST2VHbGdlaU5tVVNu?=
 =?utf-8?B?bGczVmZnVUFrYVJpNlVBZ1IycVpTdFhOa25vQkduUHFLTVVnWmdmWW1jaktm?=
 =?utf-8?B?MHZDRVBvaDVhZThhZktkVmFQYjcyNEkyclBrZ0lOdFdPdFMvVFl1QmY2T2xI?=
 =?utf-8?B?WVRWNEF3d1BOeHg3L0lHb3ZJNjNLSHp4WFpMa0ZZbFVUMFVnSVlYV09NZ2Y4?=
 =?utf-8?Q?+r8Nw1WapnVOjsEML8?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fdbee4d-3815-4e39-7855-08df1fbbe6ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2026 13:00:00.0946
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IpQ6tGRf8YCxP/wDf+wG+xmMcTMsICnmb1sAZvv8CfzOi97Yyx5qbrgkJxa7869AoMeOpFD8VIfNt/5wTdSMfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3646
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 13:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247035

SGkgUmljaGFyZCwNCg0KPiAtLS0tLVVyc3Byw7xuZ2xpY2hlIE5hY2hyaWNodC0tLS0tDQo+IFZv
bjogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+
IEdlc2VuZGV0OiBEb25uZXJzdGFnLCAxLiBPa3RvYmVyIDIwMjYgMTM6MjgNCj4gQW46IEpvbmFz
IE1hcmsgKEJULUVML0VTVzEpIDxtYXJrLmpvbmFzQGRlLmJvc2NoLmNvbT47IFBhdWwgQmFya2Vy
DQo+IDxwYXVsQHBiYXJrZXIuZGV2Pjsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KPiBDYzogd2FuZ215QGZ1aml0c3UuY29tOyBtYXRoaWV1LmR1Ym9pcy1icmlhbmRA
Ym9vdGxpbi5jb207IFNpbW9lcw0KPiBSaWNhcmRvIChCVC1FTC9FU1cyKSA8UmljYXJkby5TaW1v
ZXNAcHQuYm9zY2guY29tPg0KPiBCZXRyZWZmOiBSZTogW09FLWNvcmVdIFtQQVRDSF0geG9yZ3By
b3RvOiBTZXQgQUxMT1dfRU1QVFkgZm9yIHRoZSBtYWluDQo+IHBhY2thZ2UNCj4gDQo+IE9uIFRo
dSwgMjAyNi0xMC0wMSBhdCAwOTowMCArMDAwMCwgTWFyayBKb25hcyB2aWENCj4gbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPg0KPiA+IFdlIHdlcmUgYSBsaXR0bGUgYnJpZWYgb24g
b3VyIGV4cGxhbmF0aW9ucyBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuIFNvDQo+ID4gd2Ugc2F0IGRv
d24gdG8gY3JlYXRlIGEgaG9wZWZ1bGx5IHJlcHJvZHVjaWJsZSBkZW1vIG9mIHRoZSBwcm9ibGVt
Lg0KPiA+DQo+ID4gRm9yIHJlcHJvZHVjaW5nIHdpdGggdXNlZCBjb3JlLWltYWdlLWJhc2UgYW5k
IGxvY2FsLmNvbmYgY29udGFpbmluZw0KPiA+IHRoZSBmb2xsb3dpbmc6DQo+ID4NCj4gPiBNQUNI
SU5FID8/PSAicWVtdWFybSINCj4gPiBVU0VSX0NMQVNTRVMgPz0gImJ1aWxkc3RhdHMiDQo+ID4g
UEFUQ0hSRVNPTFZFID0gIm5vb3AiDQo+ID4gQkJfRElTS01PTl9ESVJTID8/PSAiXA0KPiA+IMKg
wqDCoCBTVE9QVEFTS1MsJHtUTVBESVJ9LDFHLDEwMEsgXA0KPiA+IMKgwqDCoCBTVE9QVEFTS1Ms
JHtETF9ESVJ9LDFHLDEwMEsgXA0KPiA+IMKgwqDCoCBTVE9QVEFTS1MsJHtTU1RBVEVfRElSfSwx
RywxMDBLIFwNCj4gPiDCoMKgwqAgU1RPUFRBU0tTLC90bXAsMTAwTSwxMDBLIFwNCj4gPiDCoMKg
wqAgSEFMVCwke1RNUERJUn0sMTAwTSwxSyBcDQo+ID4gwqDCoMKgIEhBTFQsJHtETF9ESVJ9LDEw
ME0sMUsgXA0KPiA+IMKgwqDCoCBIQUxULCR7U1NUQVRFX0RJUn0sMTAwTSwxSyBcDQo+ID4gwqDC
oMKgIEhBTFQsL3RtcCwxME0sMUsiDQo+ID4gQ09ORl9WRVJTSU9OID0gIjIiDQo+ID4gREVQRU5E
UzphcHBlbmQ6cG4tYmFzZS1maWxlcyA9ICIgeG9yZ3Byb3RvIg0KPiA+IFJERVBFTkRTOmJhc2Ut
ZmlsZXM6YXBwZW5kID0gIiB4b3JncHJvdG8iDQo+ID4gRElTVFJPX0ZFQVRVUkVTOmZvcmNldmFy
aWFibGUgPSAic3lzdGVtZCB1c3JtZXJnZSBleHQyIGlwdjQgdmZhdA0KPiA+IGdvYmplY3QtaW5z
dHJvc3BlY3Rpb24tZGF0YSBsZGNvbmZpZyBtdWx0aWFyY2giDQo+ID4gRElTVFJPX0ZFQVRVUkVT
X09QVEVEX09VVCA9ICIqIg0KPiANCj4gWW91J3JlIHNldHRpbmcgUkRFUEVORFM6YmFzZS1maWxl
czphcHBlbmQgPSAiIHhvcmdwcm90byIgYW5kIHhvcmdwcm90bw0KPiBkb2Vzbid0IGV4aXN0IHNv
IGl0IGlzbid0IHN1cnByaXNpbmcgdGhlIGltYWdlIGdlbmVyYXRpb24gZmFpbHMgYXMNCj4gc3Vj
aC4gRGlkIHlvdSBvdmVyIHNpbXBsaWZ5IHRoZSByZXByb2R1Y2VyPw0KDQpZb3UgYXJlIHJpZ2h0
LCB3ZSB0cmllZCB0byBzaW1wbHkgb3VyIHNjZW5hcmlvIGFzIG11Y2ggYXMgcG9zc2libGUgLSBt
YXliZSB0b28gbXVjaC4NCg0KV2UgYXJlIG5vdyB3b3JraW5nIG9uIGNyZWF0aW5nIGFuIGFic29s
dXRlIG1pbmltdW0gbWV0YS1sYXllciwgYSByZWNpcGUsIGFuZCBhbiBpbWFnZSB0byByZXByb2R1
Y2UgdGhlIGlzc3VlLg0KDQpUaGUgcm91Z2ggc2tldGNoIGlzIHRoYXQgd2Ugd2lsbCBoYXZlIGEg
Zm9vLXByb2dyYW0uYmIgcmVjaXBlIHdoaWNoIGRlcGVuZHMgb24geG9yZ3Byb3RvLiBJdCBidWls
ZHMgZm9vLmMgd2hpY2ggdXNlcyBhIGNvbnN0YW50IGZyb20gYSB4b3JncHJvdG8gaGVhZGVyIGZp
bGUuIFRoZXJlIHdpbGwgYmUgYW4gaW1hZ2UgZm9vLWltYWdlLmJiIHdoaWNoIGluY2x1ZGVzIGNv
cmUtaW1hZ2UtYmFzZSBhbmQgcmRlcGVuZHMgb24gZm9vLXByb2dyYW0uIFdoYXQgdGhlbiBoYXBw
ZW5zIGlzIHRoYXQgdGhlIFNESyBnZW5lcmF0ZWQgd2lsbCBub3QgY29udGFpbiB4b3JncHJvdG8t
ZGV2Lg0KDQpXaGF0IGlzIGludGVyZXN0aW5nIGlzIHRoYXQgc29tZXRoaW5nIG11c3QgaGF2ZSBo
YXBwZW5lZCBiZXR3ZWVuIEtpcmtzdG9uZSBhbmQgV3J5bm9zZTogV2l0aCBLaXJrc3RvbmUgdGhl
IGFib3ZlIHN0aWxsIHdvcmtlZC4gVGhhdCBpcywgeG9yZ3Byb3RvLWRldiB3YXMgImF1dG9tYXRp
Y2FsbHkiIHBhcnQgb2YgdGhlIFNESy4gRXZlbiB3aXRob3V0IGFkZGluZyBpdCB0byB0aGUgUkRF
UEVORFMuDQoNCkNoZWVycywNCk1hcmsNCg==


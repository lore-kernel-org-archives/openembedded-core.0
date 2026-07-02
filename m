Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE25C43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 14:05:45 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70456.1783001140631831660
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 07:05:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=W3c1f1jt;
 spf=pass (domain: ericsson.com, ip: 52.101.72.44, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A9W3xaaWLt53TIka1VezdGqzjO8XubNxsFvfXGped82hVM0ukoESLcEI8nUQu5thLhArqHDB15tBChE+aojH/Mgdp5tF2aAqvKI0gLCBCvoEGeJjfjTWxG8JGHoP4FMMvwzBcMiw8bevdoHpPtxQ09jjw6ugRQ0mkF/DIqBbzgXOu66MJ1MLGxJXyvGikgr9V3/Hxta7SfYmOcfvW+zmQprVu+5wX4HWJX80JsAe2lHbbyRIg3ah39Cjlrcs3zLJcuVbkw+OA6I9ax1BljO0sjMzM4pjoewvKQx9TyS5xTtgsEdZkm9fYX4PAp0VK/RrOXCLhxb0hYJLdxs3WOdV1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4y1Z5bwkQPyJrjWNGc7qYi5EP2hO/ynsqPhx82gR56Y=;
 b=Pft8VOjSUGza6xAJmnHs+I1rKmpRafp9BzSamnC9itsdPSu8CTn6KJhNHpcUIdLSMjHHAWq6yjf/5V0Ev01wvcXraElNDK/AKOmsC+K4Gs4fROzUddGj9BaW0W70W68DxtvwmeypDREHdRHfgunuoNd2P8vXV1ONdMswZQy0X3cok6Edxp0a3GVs4U3WiOktNQenek4doswQvjImN4hHe/zeG4N3SFUy6438RuQworN1Zk8R4VQGTB9Mp1IwuESuz1rLKmk3XsAunwhuDiGU2s6kSyaNiQq8gMJdyb7JvAB/V0j7c1Ql5cogR+vIt538hK/Yp6JAgsvbvpV/GQtcXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4y1Z5bwkQPyJrjWNGc7qYi5EP2hO/ynsqPhx82gR56Y=;
 b=W3c1f1jt5ncPuxzpa/KC72xv9xgXXgGlt+rvBp45K0htptpde9INADB8jCMPphvGpfbsHpGyY/Fbvi8v1/FveyCQgIjTwgAUskfqy5Y3fFwcl2ahxCmlcYaaMBPw2nPqCR/Rt4iOX/IbJPMGZKsV6d+QnUf3FHxVz5S53ckRaqGYB7MZvYg6eQv4GYvw2ZG8Lvj1PaPO6CJw/CrDFOoCpo5EK6yqtdaod4isDojUHPgjZlkEADz9VP8osp8DDnT2Pc51KEndh5MBLhBSa0T5HdfgmgQVgwvVywYAPt1s6tBFXrwkNd/butkefENXZ+qrtisQMun7V8kVCOpULoMeUg==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by DU0PR07MB8761.eurprd07.prod.outlook.com (2603:10a6:10:318::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.18; Thu, 2 Jul
 2026 14:05:36 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%7]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 14:05:36 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "Ross.Burton@arm.com" <Ross.Burton@arm.com>
CC: "qi.chen@windriver.com" <qi.chen@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
	"joerg.sommer@navimatix.de" <joerg.sommer@navimatix.de>,
	"anders.heimer@est.tech" <anders.heimer@est.tech>
Subject: Re: [OE-core] [PATCH v2 3/3] systemd: add native hwdb generator for
 hosts without STATX_MNT_ID
Thread-Topic: [OE-core] [PATCH v2 3/3] systemd: add native hwdb generator for
 hosts without STATX_MNT_ID
Thread-Index: AQHdBT7JGIkc469YrUeZl5xVXXqW2rZaO/eAgAARP4A=
Date: Thu, 2 Jul 2026 14:05:36 +0000
Message-ID: <70a79a998ad81a52bede139bd98bd74bbef62489.camel@ericsson.com>
References: <20260626073812.769193-1-daniel.turull@ericsson.com>
	 <20260626073812.769193-4-daniel.turull@ericsson.com>
	 <D6CAA5E2-17E6-4893-A8DE-A99AC61DA48C@arm.com>
In-Reply-To: <D6CAA5E2-17E6-4893-A8DE-A99AC61DA48C@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|DU0PR07MB8761:EE_
x-ms-office365-filtering-correlation-id: f02ba785-de52-4654-4d76-08ded842fd7a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|56012099006|18002099003|6133799003|4143699003|22082099003|11063799006|38070700021;
x-microsoft-antispam-message-info: 
 Y3AB33S25Wj9K92WFbybrzRNO4e+RcaOKx1kfXoUGQe2ulUqbk41tXFOF0r9NfhI7+FmRW+tRX3ujCXQMVfqNDvHOw7DE9RUEzLzv2PvJme79cNCnHVcMzBrk3lMkFGrnKfeDXNxo6pQ64xjTsTN1gtqJWDe76Cmih7scwoduaYVziyFcXj3NQOhLSxI72EvaTTBYjle8ZEQ+gWf72GN5WsXEb/f/rEwof4GHzUVGFS9kG7Uv8z5xReK/CIHH8rmFh25SZNZkB0/4ZiKOEhKVAb5ifh0GV464brV6hQe+nGp3pYXimHD6zw6IZYrIxYsKJbmD0uxUsTkMThm0chta9+FF25Oyv0zTyzoLhQMa4w37Z2JvO1xjaDWnMIyoV2IlRtl1T72x0WfqwzVT2xlcR7yT6OG1Gv4mnaSw6H64H/dFTIeBvnG8VYWXsbNavPHTREQnHCHkzPnnfaLndgF0jAayi1ixkNKYLMoKCscQ0YBiw08sMAP/F0Qfi6mtUA/BxbnQDpun+XkuyHcz7iU4zOr+AMyfPQIQnkl+wonOMMN0ZxyEw1O0GVv2em9LO6ywVaAYjdYFynsrRut+6KH/0oM7c8fMeW55mx4MS7w8Q4zgOl8HuocwvWue1vZ4mRNXbibG5mETAodi9EEeCCecr+zkYxI5Y3lX9HwfjI3zy6EtzEBiMWps+qcCtsRAaw8i4iM1tnbJY11m+70vgzHTGGMr+zLrJtQyanjgEe6Brk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(56012099006)(18002099003)(6133799003)(4143699003)(22082099003)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?R2xnWEtoZnFOdFR5Q0JWTm5pQ0VRZjJoVmsxb0prVVcxdVdNdE1FVm1VZGxx?=
 =?utf-8?B?VHVGWkZrYVBxTWN5Nzk5RDYvZm5RdjBtQkIyalNLbkFVVkVlYWdmZUdhaDc1?=
 =?utf-8?B?NXp3YUtXek9KL0xnSGh0K1JNM0s3RkFCSEdEYnJzZFFrZWlnTVNwQ20xNHJi?=
 =?utf-8?B?Vkp2ZkYxSVlpYllha3krUnJnVkI2OWVmWlpFY2tHendpMk1GYlZNY3V5a24y?=
 =?utf-8?B?eWdtSXh5TXp3V3p1ek1DVmRZRmltUFVXVWJJN3N6T3dpdTB6TVh3SnVOamlm?=
 =?utf-8?B?TVNHREswekU4YTE1WHprUnJFRm5QKzhoN3ByWGJ5OVUzLzczVS9DL1M4ZkxM?=
 =?utf-8?B?Zm54QWxrVkVxNlRpa0NUNDZoWXZRcHVTRXRQVWVQT01QZ1VRREg4T0p2d3V3?=
 =?utf-8?B?NEZPUlRrcGxqQWFYZUs2ckhtWW5pUUYxU3lYK3E4Rm5zRUdpYXZ0VVJYek9y?=
 =?utf-8?B?S2ZVL2hXVUJ3RzRuSCs5YUpiazlpaTFrRHpHYnVkN1pSQzRxWURsQ2Z3UElw?=
 =?utf-8?B?c3diWTJHa1V3RVRaWVN5bkFLL0QrRnY3TFNzNHR2clk5SGYyMjY3enJERlNK?=
 =?utf-8?B?blhVRDJ6NWFteUUvS2JiRHpxMmRrMDFIRmtyeXhiWWZGVGkyQjNTMHhwejk3?=
 =?utf-8?B?dkZHOCtFSUlLNC9YM0w3RkFoUEEra0NTUEswSWFCMTN0WjJEemhBSFJtSXda?=
 =?utf-8?B?Qmt1UlJ1VDBZSlBLRkQyMzBNTWFnSUZrbVFMMGRzbDV4N0MyUDVlSnM1Rndl?=
 =?utf-8?B?MWovbmZBN3VxQVZqYWNTOWk5WXRsNWZNeGtLNXhEdWJVRE0vMEtKYmRjbVVH?=
 =?utf-8?B?bGxnRWxYcWU2anAvZmVuYkVkYkE1YVlOajFGcDVkaTIzcFg1WW4zaXlwWEhy?=
 =?utf-8?B?ZGI0TlU3bEkxZGo0LzlsaDE1ZUpKdnFsRkVWRDNKRjBBTXFZVFcwNGs0c1JV?=
 =?utf-8?B?WUZFNUFPT0xqM3Q0QThZcWNXZXFidTdXbW1kdkpZYnZsa1c2WmtrNzV6YWk3?=
 =?utf-8?B?VnRJNVFzTldIazRwS0RmOERnczZNbGJIaDUrUGhYd2tXdWN2TXFBMk5KMjBl?=
 =?utf-8?B?cUxPVk9VRWQ1SDZFQWxKTEJzbXduV01oSTh2LzV6M25iYXJLcmsvNzg2elZK?=
 =?utf-8?B?TzUrTEVUY010bWZ0enJITGNZUHZVN3RMVzBqK0l1OWF1L3BsS3FMSThndUFS?=
 =?utf-8?B?aEhFNXppcGpLRFFDM3U2djA5ZXVSdnM3bjlnb1ZPaTh6SEU5eVRvUHZwc3pt?=
 =?utf-8?B?Q2U5UkY0a1EyQ1N5ZXQyeEVnMHRhZlpEaG4rWVNYSjllUzNQN2daa2swZVhN?=
 =?utf-8?B?eHRONzA1UEdQU1BvWkhQWUJyeWJhT2FHOVArWXMvUy9CV2Y2Qmd5a0lwcnB3?=
 =?utf-8?B?SHVWZUUxT1Uyc0hHNXp3K2hWUStnMlRtS08zZDZuR2RPR0NrV3pPNzlzdHNl?=
 =?utf-8?B?a2tlQ0pGem1RQ01lYUUwUUlMZVZ4S0MyVGt4R1VjT1NmZWg4SlMrNlpwTzNK?=
 =?utf-8?B?YnpJOE9nTXZkaVkxaHZXb294RWh6ODVDTFZUdGdLRWpteGFxR3plSi85TVZh?=
 =?utf-8?B?ZnY2Qkh4Q0tBNnJ0T1ZIVDZ3ZFMreEo1a3BxQzNlU1RWeUEyQlhCbzlhU2lH?=
 =?utf-8?B?UDNwZ2h1bFQ4VHRleXB1NVBKM0Zqa3ljRmt2aUV5OVlzRW92dTd0S3FYWmJW?=
 =?utf-8?B?b2p1SmgySTVVZWZIMU1SbEFTVXdOZGxwenlZZ0ZNNVVsT1BRS0ZRdk81Y1ow?=
 =?utf-8?B?OXNLQTdsQ0JYdzNrRkhlTXNPeTVpWlZmaVMyb0FuM2x0eFJ6R0dnWjZLSHhr?=
 =?utf-8?B?b2dobUEyUnlBUzJweW5PZktxcHFjUkYwcDk1djFxNklBUjVZMHd6N1NVVkti?=
 =?utf-8?B?M2czRjdreEErUWhXdEpSUzdVRjJSL1JTMXJkNFZxd2tuS2MrdDUrQlQ3QlVO?=
 =?utf-8?B?T3Y1Qm9mSlJSNUlHY3BIUHVvdWo5WFVyT0ZyenByU3dXek8rdEhGWkJlSjl6?=
 =?utf-8?B?eGVUZENaRlU4UkRBbmNHZy9kV3lRK2pMZlpuUnhlNUFvbWlGUktIcHpRSWFy?=
 =?utf-8?B?emJrSEVPKzB0VGFCZkh6Z1M3dzlUaDJEZDA1eDU0emg3MFZGUS9iSFdldkNn?=
 =?utf-8?B?czE5UFpWeExaeWNRUFMyRno2eW1obGY4M2tIdC8vQzMvRXRDbE9OVW4zM2dw?=
 =?utf-8?B?M29RbHYwVVBSS0dkM1pEVVNORytjTEY0TzlZUWRlbmNxZm0yMWdJSWw0cVZL?=
 =?utf-8?B?bDFDNC9VZHY0dTY4b2ZXZ2hQYWlhUGcrdWx1MTJLcjhzWUpiU1R0bmxsMjN0?=
 =?utf-8?B?aC96L0JyUHZOcDk4MWRhcnJCcDlXSjhSV2RaOUxRdFVTVnV2eXlGOWxjdzJF?=
 =?utf-8?Q?na+3JjjBEnsEhZuU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF8C090FBBE9CA43B5DE04CCAE9C6EB2@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f02ba785-de52-4654-4d76-08ded842fd7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2026 14:05:36.5179
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +M4Hbm9rePJ8u/WF+tfo8ticmA72LF9LbaSc55X2unQNmAd2pHY2VHdrF8CKmAhN6hUW8LrMTlLQ77+A+/UdPMlkD5/FPgKtndj8AvlGm7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR07MB8761
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 14:05:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240054

T24gVGh1LCAyMDI2LTA3LTAyIGF0IDEzOjAzICswMDAwLCBSb3NzIEJ1cnRvbiB3cm90ZToNCj4g
DQo+IA0KPiA+IE9uIDI2IEp1biAyMDI2LCBhdCAwODozOCwgRGFuaWVsIFR1cnVsbCB2aWEgbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IDxkYW5pZWwudHVydWxsPWVyaWNzc29uLmNvbUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gPiArKysgYi9tZXRhL3JlY2lwZXMtY29yZS9z
eXN0ZW1kL3N5c3RlbWQtaHdkYi1uYXRpdmVfMjYxLmJiDQo+ID4gQEAgLTAsMCArMSwzMiBAQA0K
PiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQNCj4gPiArRklMRVNFWFRSQVBBVEhT
OnByZXBlbmQgOj0gIiR7VEhJU0RJUn0vc3lzdGVtZDoiDQo+ID4gKw0KPiA+ICtTVU1NQVJZID0g
IkhhcmR3YXJlIGRhdGFiYXNlIG1hbmFnZW1lbnQgdG9vbCBmcm9tIHN5c3RlbWQiDQo+IA0KPiBX
b3VsZCBpdCBiZSBiZXR0ZXIgdG8gbWVyZ2UgdGhlc2UgbmF0aXZlIHJlY2lwZXMgaW50byBvbmU/
wqAgU29tZXRoaW5nDQo+IGxpa2Ugc3lzdGVtZC10b29scy1uYXRpdmUsIHdoaWNoIGJ1aWxkcyBi
b3RoIGh3ZGIgYW5kIHN5c3RlbWN0bC4NCj4gDQoNClN1cmUsIEknbGwgbWFrZSBhIHY0IHdpdGgg
YSBzeXN0ZW1kLXRvb2xzLW5hdGl2ZS4gSSBob3BlIGxhdGVyIHRvZGF5IG9yDQp0b21vcnJvdyBJ
IGNhbiBzZW5kIGl0Lg0KDQpEYW5pZWwNCg==


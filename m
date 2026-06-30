Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9E5BC43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 10:51:13 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18161.1782816668202006007
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 03:51:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=dARtd+pI;
 spf=pass (domain: siemens.com, ip: 40.107.162.51, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmLPbtvO4PDlFGCJU1es3ZggX2U0LvKXcQtuRbFzMGW5AQohrtRDPyN9Ow+5ymwxeigo2qPrlbVT/4E3HphPx0h8a4yh84iLp9dZSXTOyBb2srNwrl0kx2dk7Rls6kYZF4pdFScEL9RzpDcXMl3xpEeQdE4ZmnQSHJxddY99fAXX/0jToVH/fbohdZ2680zKqOEgL1MleBzisuFN8oxsFz5qVm8Nm6I0OpGYiG5eKaAlI2prbeLS8XHxS6YjD5/sZwrCImJmIw+s1LjcGaNd2XxVGtlhqknWv5iLM4RsYzaaeJDmeKlRxdcLAlb2zlMSEdfMDoH4ZVyQaYctYzIrDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6nt3fSy+kb3oLMNkLY4rQ8lkes772yJHQ6jDPOUwFH8=;
 b=hb3Wh0s+c1Vc4G4x8ug15GdL5+rlBzmHPHzwYkfrJe7wzw1FYkyGpNvwZsEOAxe2ilv9XSTo63NBwJMvWtoIr0MihH4JYyQhsjwrlmLIrwZP532q8QddE0EHIIohP4DjqjerKWD020geOvD8e7CeS4MwfAqlKq43OgM++URvdAPtD05hC83dyKYIYqwt0WrtlkZR3G1BiIznPaxq9/7bK+TUQ2lNQtquPtwEpREu9VyXOIQ8x44E1ml2afBtzTEkmjUiSZPJ4lgLvYF1sZAGZ6tHwHNuJFhQhUsogt+YX+DGisV5CFHD507awV5DfSgv6xgbTtBegqfsMx1f6XxwEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6nt3fSy+kb3oLMNkLY4rQ8lkes772yJHQ6jDPOUwFH8=;
 b=dARtd+pIr2MKPePsJ43/XAveESf+bSVKT8AcFPDqi9OgzLQ6sl5vHGK8GEGCuoppSIaVg15/MqW7VtbP4AxWazXC38+1zxYDFixQRpYTB9jq3YZfbeSt+VoeMhMNFlReB1GCXgI5ChDJKem87r+dwcllYfT0sHCBXj/pYTPeCbxgNFOBb2Z/GanlXwdzF+nfS4y5rYLhqo1JKi8OSONEBlHu/MzheEFgTA8814aV3tkSV3dyCrv30+YKTna+u+JKiIf6Uf+6Ny0oif84zWygzQlgQ/PZQT2A33O9Eklu1b1B/z25z0KuZz9Nu5/vOqixlnHnggUCBFKk7DOvlD2Wbg==
Received: from AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:14e::19)
 by VI1PR10MB7690.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1c8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 10:51:03 +0000
Received: from AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7576:68aa:ea32:323f]) by AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7576:68aa:ea32:323f%5]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 10:51:02 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: Marek Vasut <marek.vasut@mailbox.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Yoann Congal <yoann.congal@smile.fr>
Subject: Re: [wrynose][PATCH] kernel-fit-image.bbclass: Do not include kernel
 property in DTBO config subnodes
Thread-Topic: [wrynose][PATCH] kernel-fit-image.bbclass: Do not include kernel
 property in DTBO config subnodes
Thread-Index: AQHdCGQ7/lqLIPzjpE2Qt+FF2J5GbbZW6+WA
Date: Tue, 30 Jun 2026 10:51:01 +0000
Message-ID: <6fb0c748f9cbdeb15dc583483486e12af1c7f397.camel@siemens.com>
References: <20260630074356.10265-1-marek.vasut@mailbox.org>
In-Reply-To: <20260630074356.10265-1-marek.vasut@mailbox.org>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR10MB3745:EE_|VI1PR10MB7690:EE_
x-ms-office365-filtering-correlation-id: d1a2a37e-c195-4452-8237-08ded6957a19
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|18002099003|22082099003|6133799003|11063799006|56012099006|55112099003;
x-microsoft-antispam-message-info: 
 5UMV9Sxl6lN+qFP7b5g39gVgwN7V5afC15QmqUQ+zQfBDnLKqoD180Q1g853XVUCqjk4MvoGS3kBOifRFbtK5wn0IVCnbVZtCYvVia2PaWiALmIZAxplZIotloXTGzbSNfm3u8AZMVCnJ6bqnsdC6Jxfa0ul7ukklh5QvMO5y0lJGtdaPo68SXrMOtM1DI0LZvpXUUASEBFYiGaYTmgosPmDlgIMMztsxiK1e7/FAht8kW1aNuFS5RoHZh834T7X10yPvOpwMMiGyIRu2yp3c57g2ywC+f5Bjrx/BlEqE2ajkOhL9rIyHuP7IJexAphgaiAhXMzg7jjazMT1O8gkeotsIiORekC8sBmjXoF8fpKiHopW0ogNy9zTWKr9aoJ11tfvbYb+16/bohSk7/iwsKtgWn4QVScwR+qmiONpEQyZDHh6VlhstpnX9uNqUrrL3CMeWQ/Aw+uJW35QwtBsj1i3mINlqmPmnfqWptC5t8lW3EJILBcPR6CHRqGhpeJDBEscNbLdmVwgpzd60lI3EXQH9BvfQbRWVZED46fVCaCGaMAXnd05UJaL9o4GrekHldaktVfeNvax+ajv1TNpZq3S6UGDjtTAFhNykeoPWk8LZpSGQgWt+gTT1MafjWQ2FL/umopsyylauOUsKV8PgG4P5GWHPRmYgBauD59k1F9n9YjL9nwIvXNt2BPj9kWrj3/l51Fev3rbXJvirK1EVHE4wsslnnRHMdxzHaHw0pw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006)(55112099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NExUWUFrVjBZY0dEYk9PYmtKRmpXOUdlOVBFbTI1NEQvaU1USUJ5WjJlQzNB?=
 =?utf-8?B?WDI0V2RaM2k4TTBVZVFwazg4V0lTN250OTRySnpsSFIxMmZjNkJQLy9BdHha?=
 =?utf-8?B?OFlzeEFMcldFT2lkUVRkSjluZlp4QWorR0kvaExjV01rbkw2UzZBT09tSGpv?=
 =?utf-8?B?ZTRiZzd1emRnOUxZdnN1eDc4UGl0L1JpZFhmNUg0WG0zM1gveFc1MFVwZ0RL?=
 =?utf-8?B?UmR2aXM3eUFaTjFLbVUzaGZjdHF4djJLekNRV0pkSnpEYU1QU3dwQUR3dzQx?=
 =?utf-8?B?NHBzQjg1NE8za2RYdnNkOVhMVUJTSnVGUUV6ajVqUjZGL0UwWXlWbzFtOEt4?=
 =?utf-8?B?b1owWlQ4YlJ6WGkrdEtKdWROb3U0Wk8xcUJHVUl0VTI5dGJRZEp2TFl0bmY1?=
 =?utf-8?B?VldwRjJqN2VoZERSMUM3d2VmdXlvaU9STFkrZVp4N1lFK015Z09oeU9RK0U4?=
 =?utf-8?B?bFRiTXgraVNHUTNxSU9VRzhONyt1UFZqcHpYOTk1QnpyWWhUbUVXTlNEMzNU?=
 =?utf-8?B?dU4rZVBEb09rYmVLMDUvSU5YV3o1bk9hVVN0QTd0SVQrT3NRYzhMaTEzeDVn?=
 =?utf-8?B?QXBkS1RHWTNHbVAyVFlaZ2M4dFRVQ3FOWlZtOFB0aUxyUVB3ZEpDNDNwL3BD?=
 =?utf-8?B?bnMvYlBKd3Y0bjM2OHhQUlpnSklwaU8yM1paYTZWOUh4UVZaRzd6bUNEWmF1?=
 =?utf-8?B?b0tOMGtKSXY2OEdHZXpxK0xUbkloaHR4a0YwRFRRUlBLNVlMeHB0TEZ1dnRO?=
 =?utf-8?B?NWZaSUpDSVRwU3RUcllzRStGczNnTDBGVGpkUGlRUGsrWkFDZGl3R0FDK1k1?=
 =?utf-8?B?UzBWYkRaS2VIZkNqaUZYTUVMejUxRVgyLzJMRnVVeEpOL2dmb1lWYmF5Z1lr?=
 =?utf-8?B?cHc3Q1lqQVovVCtWbmFLKzg4VFd4bEJTT1hvTnI5bFYySCttNnZtK1ZNN1hq?=
 =?utf-8?B?UXQ4Qyt4UHdrS3dJY0xaRE5ReHlBbUhkVUpJNS9RWU9HSmc0WUduNWRlS0g3?=
 =?utf-8?B?eXdXS0ZiclNyRXRsQWNJY1EvTnR3eWFxcnpQQ09WWFRzZ0R6TmUvMEZ0NktR?=
 =?utf-8?B?VHM5eU5NdkVMMjlNWTFVVTJVT1RyK00rWml4V2lPQml5dC83dUFRVjNrUlk2?=
 =?utf-8?B?S3lDMDFIelZIRlNRTzR0K0hVOHRrQ1IrdkplRUtGbWhIdHMxUHVGYUVCZnZH?=
 =?utf-8?B?NVlxT2ZzNEVuQ1l4cXI0R0VOMTRmUzg5RFp3YlFTOUpybXRHSVJGRk42Q2Qr?=
 =?utf-8?B?cTJaVURiYTRaNHp1RzJJaWx1bkxqTVMrS2ZmbjJ5aVFlNE9IdDJrYXVXclFl?=
 =?utf-8?B?WjlQTHBlTVBLdTE5QlpERnJiclVVaXFxR1drc3VKNXA1V3pwNCtFdmh0cGFP?=
 =?utf-8?B?OWRhZXltUWxVdTNkenhPQUVjalJVbXN2cEJPQ0xUcjY5eW9LR3pMUEY4a1JT?=
 =?utf-8?B?OHFSbHNnU1dxTUNUTGlLYmRxcmJBQTFTZ2pxRDhyVEx2SHpHUUtKZFp4WEVF?=
 =?utf-8?B?UHMvTWhCcGs3dURVZi9LREowUDIzbUJyeDZ4MXRiS0ErN1lLcUpWcjMvb3c5?=
 =?utf-8?B?cGtjcHcya0hlSWhoSk9ocktJTDBaL1M1bDBkKytPTXh2N1NMQ1JpOFAxWjA3?=
 =?utf-8?B?dUdTODRFUGJBVllBclF6Y3VJYjBORm53bC9HRzNRNHJ6ZDlGUFFtTEZ0cFIw?=
 =?utf-8?B?TjB3TElsYUR4UVpFMy9LZ0R1WDN1NHJDTnlwZVMwc1pQLzRYTDFzTEZ3MTlr?=
 =?utf-8?B?U0dmUW5CbytyY2FCWWRSYzhhRWY0VEZHaHYveHVkay9KenZQQ1JGLzBrdW1X?=
 =?utf-8?B?NnN3NXo3Sk9nTDRMdjdWVzlLRU9WSk1RMTRTYUN3V1djMmVqdGNqbnBldU1E?=
 =?utf-8?B?NDVKYjlRTzZnNFRXb1B2cVp6dzdLQnU2ZHg4SndwNEpjKzEydVFCMjJmVldD?=
 =?utf-8?B?QUtiTXFPWVdhN0E2cGZWbWh6d25PNDZaZjdiVUpmYkZnR2N3N2xHY21kSE45?=
 =?utf-8?B?Vmk4dmdLelNHN255a1A0bUFpaU5kMjR5M2M0OHp0MUthZkQxSjNzdEdwYXJn?=
 =?utf-8?B?RGJaQ3VKVWtmUHVQTG1MUFNaZEpFY2tBTVh0WHM0QnREd3VtT1dsdWwyc0FL?=
 =?utf-8?B?NVFKbUQvejZONWlQZ1ExVGpwVGNjczBzeklzSDFtQ0pBNTdOTkZvVTBHMlUz?=
 =?utf-8?B?bTY5ellOUGNHNHlXN1FSTGUwUG5KamxwMUlqVk12SkhHZUFRM3Q2UkI0ZUov?=
 =?utf-8?B?L1lLUE9qUGVOMHhPeUg5U0tSaHdvN1cxeiswam4vRDVBQWhHTHBta1c5VCtY?=
 =?utf-8?B?aStRa2NCZzFCb0JrU0VqQUxmTUNZS0tKdWQvWjN1eHNtMnhxVzRiZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6B2427943B77964E92BACF6B8ED1680A@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d1a2a37e-c195-4452-8237-08ded6957a19
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2026 10:51:01.9784
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xjlfWA8o+tGK/ocFHDCioORoT/hrFU7nBo/eLs2XrrejpZiWk63P3CazHXxE5f0mQx+/zgaIvIymKwjDQLb5wrcu+tozR8GzJjfQS/j51Bg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB7690
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 10:51:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239875

SGkgTWFyZWsKCkkgZ3Vlc3MsIGJlZm9yZSB0aGlzIHBhdGNoIGNhbiBiZSBhcHBsaWVkLCB0aGlz
IG9uZSAob3IgYSBiYWNrLXBvcnQgb2YKaXQpIGlzIHJlcXVpcmVkOgpodHRwczovL2dpdC5vcGVu
ZW1iZWRkZWQub3JnL29wZW5lbWJlZGRlZC1jb3JlL2NvbW1pdC8/aWQ9ODVlMDQwOGE4MWJkY2Ew
NDExYTg2MjUwNjFlNWUzNDNjMDVmOTJkOQpPdGhlcndpc2UsIHRoZSBvZS1zZWxmdGVzdCBmYWls
LgoKUmVnYXJkcywKQWRyaWFuCgoKT24gVHVlLCAyMDI2LTA2LTMwIGF0IDA5OjQzICswMjAwLCBN
YXJlayBWYXN1dCB3cm90ZToKPiBUaGUgT0UgNS4wIGltcGxlbWVudGF0aW9uIG9mIGZpdEltYWdl
IGdlbmVyYXRpb24gZGlkIG5vdCBpbmNsdWRlIHRoZQo+IGtlcm5lbCBwcm9wZXJ0eSBpbiBEVEJP
IGNvbmZpZ3VyYXRpb24gbm9kZSBzdWJub2Rlcywgd2hpbGUgdGhlCj4gY3VycmVudAo+IE9FIDYu
MCBpbXBsZW1lbnRhdGlvbiBkb2VzLiBUaGUgcHJldmlvdXMgaW1wbGVtZW50YXRpb24gd2FzIGNv
cnJlY3QsCj4gYmVjYXVzZSBrZXJuZWwgdG9nZXRoZXIgd2l0aCBvbmx5IGEgRFRCTyBvdmVybGF5
IGNhbiBub3QgZm9ybQo+IGJvb3RhYmxlCj4gcmVzdWx0LiBUaGUga2VybmVsIHByb3BlcnR5IHNo
b3VsZCBvbmx5IGJlIHBhcnQgb2YgdGhlIGNvbmZpZ3VyYXRpb24KPiBzdWJub2RlIHdoaWNoIGlu
Y2x1ZGVzIGJvdGgga2VybmVsIGFuZCBEVEIuIEZpeCB0aGlzLgo+IAo+IEZpeGVzOiAwNWQwYzcz
NDJkNzYgKCJrZXJuZWwtZml0LWltYWdlLmJiY2xhc3M6IGFkZCBhIG5ldyBGSVQgaW1hZ2UKPiBp
bXBsZW1lbnRhdGlvbiIpCj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgVmFzdXQgPG1hcmVrLnZhc3V0
QG1haWxib3gub3JnPgo+IFNpZ25lZC1vZmYtYnk6IE1hdGhpZXUgRHVib2lzLUJyaWFuZAo+IDxt
YXRoaWV1LmR1Ym9pcy1icmlhbmRAYm9vdGxpbi5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUm9zcyBC
dXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUmljaGFyZCBQdXJk
aWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gKGNoZXJyeSBwaWNrZWQg
ZnJvbSBjb21taXQgMDZlZDM0MDA1OTU3YTZhZmI4ODI3MDYwM2RmNWU1NDU5NDE1NDZiMCkKPiAt
LS0KPiBDYzogQWRyaWFuIEZyZWlob2ZlciA8YWRyaWFuLmZyZWlob2ZlckBzaWVtZW5zLmNvbT4K
PiBDYzogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+
Cj4gQ2M6IFlvYW5uIENvbmdhbCA8eW9hbm4uY29uZ2FsQHNtaWxlLmZyPgo+IC0tLQo+IMKgbWV0
YS9saWIvb2UvZml0aW1hZ2UucHkgfCA3ICsrKysrKy0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA2IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbWV0YS9saWIvb2Uv
Zml0aW1hZ2UucHkgYi9tZXRhL2xpYi9vZS9maXRpbWFnZS5weQo+IGluZGV4IDg4MWQwZWFlMGFi
Li5kN2UyMTE3MWFiOSAxMDA2NDQKPiAtLS0gYS9tZXRhL2xpYi9vZS9maXRpbWFnZS5weQo+ICsr
KyBiL21ldGEvbGliL29lL2ZpdGltYWdlLnB5Cj4gQEAgLTQyNSw4ICs0MjUsMTMgQEAgY2xhc3Mg
SXRzTm9kZVJvb3RLZXJuZWwoSXRzTm9kZSk6Cj4gwqDCoMKgwqDCoMKgwqDCoCBvcHRfcHJvcHMg
PSB7fQo+IMKgwqDCoMKgwqDCoMKgwqAgY29uZl9kZXNjID0gW10KPiDCoMKgwqDCoMKgwqDCoMKg
IHNpZ25fZW50cmllcyA9IFtdCj4gK8KgwqDCoMKgwqDCoMKgIGluY2x1ZGVfa2VybmVsID0gMQo+
IMKgCj4gLcKgwqDCoMKgwqDCoMKgIGlmIHNlbGYuX2tlcm5lbDoKPiArwqDCoMKgwqDCoMKgwqAg
IyBEVEJPIGNvbmZpZ3VyYXRpb24gc2VjdGlvbnMgZG8gbm90IGluY2x1ZGUga2VybmVsIHByb3Bl
cnR5Cj4gK8KgwqDCoMKgwqDCoMKgIGlmIGR0YiBhbmQgb3MucGF0aC5zcGxpdGV4dChkdGIubmFt
ZSlbMV0gPT0gIi5kdGJvIjoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbmNsdWRlX2tlcm5l
bCA9IDAKPiArCj4gK8KgwqDCoMKgwqDCoMKgIGlmIHNlbGYuX2tlcm5lbCBhbmQgaW5jbHVkZV9r
ZXJuZWw6Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbmZfZGVzYy5hcHBlbmQoIkxpbnV4
IGtlcm5lbCIpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG9wdF9wcm9wc1sia2VybmVsIl0g
PSBzZWxmLl9rZXJuZWwubmFtZQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiBzZWxmLl9z
aWduX2VuYWJsZToK


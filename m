Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F709C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 23:46:27 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.41])
 by mx.groups.io with SMTP id smtpd.web11.26817.1702079185801431655
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 15:46:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=OXB+mT16;
 spf=pass (domain: axis.com, ip: 40.107.8.41, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nDfzBtr8Pz9gLT42MNsP1gEaiCTXOMHlyrCllrVNulXyHG17xEcCGHVI0LZFImhOIsQBnaMm5OspBxXzG7Odd3MLz8k+I1NlhdRPsKfcISx4PvRrg1pBCNrfxUf3Mil4rf3BkEIfqIkeGQRfW/kIygX0jAX+QOl5cwdMR8r+SirKKiMMjppC1i/1WQ2LFeL/VByxPbsSFxU/cLMGb5E3YuAj5QHVXGj9xwauTXdfVvFwijf0TnN6k3DXzk2LgeLB+YairmiZl7ZYO9sU1PtLSsW5DQb1M6zJQo8qgqiYaO6NQbepMkFRmFJLZ8HsIwL0fNekS1bhZOM6D7nCBwhBMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SDL5l/3qxW8LyZgcXdeCK7+VTcyX0dvcSQswckMNv+Y=;
 b=maJeyB6tLVRrxxiLFgiweaKxnjyrxImv/z4SzPzYiC0n1l913h5T2G8KjiZ7xnCnLBiP0IJqqMvDO3ccHFk6seoIY+QCQsp8M9YnqDzJWjPb9pNgNlAaNEv/Q8+0btnI2maOHZn8qIAjzZjn+X4+6hISSg3WvtrynePXdx7Q7NmGex/VoNq+xDMpQSCsSaB9PKGM2wYJE2QS1oN5dMkuwKpgdi8R5x5tjIfvVtuEQki/giLgX1f7gWZbYm1EmBhS2nLp1xfzFi7aM+32B+bRP9cPCLRJgoJsGhu98tDdAVvx8PwZGskaJPQop/87YpuB3HKik5Z29dESLOBfFMC1ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SDL5l/3qxW8LyZgcXdeCK7+VTcyX0dvcSQswckMNv+Y=;
 b=OXB+mT16Ifx5MMuKR0JwzAtybsK8owvCLmBbaHlq33w4pm3JLa8taBAzIkAaTAc8gKD7P2bWfYShQMFRlGM/58H1FN/aVlEYw59INnCPtjdwGJmt3UVK5RJOswltPh4AFeknFI6RFX9nWtFvdbffPUnaEDPI8b2T3UyaUvbff1o=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB9PR02MB7002.eurprd02.prod.outlook.com (2603:10a6:10:22b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 23:46:22 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::7d13:15f0:2292:6962]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::7d13:15f0:2292:6962%7]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 23:46:22 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Alexander Kanavin
	<alex.kanavin@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Alexander Kanavin <alex@linutronix.de>
Subject: RE: [OE-core] [PATCH 4/6] gnu-config: add a do_compile task
Thread-Topic: [OE-core] [PATCH 4/6] gnu-config: add a do_compile task
Thread-Index: AQHaKb+Olp7VjtpR40mddkyYtJZVErCfQaeAgADKVkA=
Date: Fri, 8 Dec 2023 23:46:21 +0000
Message-ID: 
 <DB5PR02MB102138AC5B61021289BA6C5D4EF8AA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20231208101522.198832-1-alex@linutronix.de>
	 <20231208101522.198832-4-alex@linutronix.de>
 <e66b4cebf577218dfffb4dcfa812b69597c8650c.camel@linuxfoundation.org>
In-Reply-To: 
 <e66b4cebf577218dfffb4dcfa812b69597c8650c.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB9PR02MB7002:EE_
x-ms-office365-filtering-correlation-id: 39cae9ce-7598-47f6-c9af-08dbf847e1ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 9t86SRUUKG7OlZQOu85mZFHUHWR/KdVq3vCqZXPzFSMyGiLjdymJNxQWt/vmH3dDMqG1j9BCyBDk2vu/fL4Qq+WPugRppC1e+g6+PabAlQPqaYKmS8Ci8uNhrmQCmr304C+yYM4+FAfq3gXGg2/awBJXouRJOLGN3o/aeywaFpoRAniUE5bieMIGfXBe4o8ylBV80s8ySdlx86j5LDqO7Rpond+hQk8ypNYYS0NeuVRCZo8uT8uzvS1nsE+7DU8oxjmSkNlcMiCsG927r3+pnx7JLSSC6VABjJYBh15ahdsw+zPrNsISmgy/03rt+meGW/AImFTTnQ844FK9tp+uLPem/OHC1m3nwRMHsw6zJg6qqVRbbjqq0hLIA0FtcuXgIQUBuF1CCSsMxl1VX8aGPgJneAR/BFZjsLF/7LTn67qvZ//jsa/IHaiz+6mTtkoW65R4FxHzvnXEKaAwOBxlKDPzMYD/ZhLLdm+9oa+6OzyFpYf41jQ8+OGWBE4K8eKMpGEmza3OENhCkjfoB0ZNWS5VteTYbKzxX9JeXuGZYlMMnAMyrPxnpDpcsDBLlbeA6p89gDgVgDup11PtKHF1XS4hmXZF5sPKxpvFAC8c7Mv+UzZRbngBwxx8W1VRuXXT
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(39860400002)(136003)(376002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(2906002)(4326008)(8936002)(8676002)(44832011)(52536014)(5660300002)(38070700009)(41300700001)(26005)(71200400001)(33656002)(83380400001)(55016003)(86362001)(38100700002)(122000001)(478600001)(110136005)(316002)(6506007)(66946007)(76116006)(66556008)(66476007)(66446008)(64756008)(53546011)(9686003)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Y1FlZkFzV0dteXcvQTVLZU43VGtvenVDbDNyblFlNHpvUUYycXZmL1Jvd3hl?=
 =?utf-8?B?ODlHaTZ5d2NqVmZjLzh3aHVrUWw5dks3elhwWWwzZE9uZlJ1QWR5UmpiZjN3?=
 =?utf-8?B?NHowVE5GYXE5VndLRERZR3huL2lrc2xwclhXRjR6NlhiOWZrc3R5ZGI0QXFX?=
 =?utf-8?B?YVhUbVpLNWI5Sk1qWmlxdEJMMWluRm5EYkdPakhLODN3M3dsaE5DZnh2UlFU?=
 =?utf-8?B?Z0dJd3hFUUVrSFF5N1owWDhwcUgzREYrR2wxUnduL3VjTEYyTjhLY2VDTDUx?=
 =?utf-8?B?REYvNTkrbFZNQy8vWm1LSTRpYVlsa1pwZWl1SWc0eDBoZWVUWlBpaTBxZzhx?=
 =?utf-8?B?djRzZ0dQNUd0Q2RBTzRSUWgxcTkvUVZENW8yazkxb0JDNk1RdTI4Z21sMTY4?=
 =?utf-8?B?enFpM1IrNXk3Y0N1MFI1TUkzeEJwNE1vbDlHUmdNRTBBVGQ5amtOT2hyK1NQ?=
 =?utf-8?B?QkFtemJuMkViZ1hZUXlUTy9xZ3d3RGFUVWZPR0hCVWRGUWpxK1lEbWN3Rklj?=
 =?utf-8?B?MmdBbTVEaFpyMkI0NlU4QTJxazg2SG1wdkdoNU5KUHo0bHdLUC9mbzBqTWd2?=
 =?utf-8?B?UCtOMlBFQ0ErTFhPTlhIMGhZOHRxbWJUMlF4SkEwRWpqamxJSlA0U00raGJl?=
 =?utf-8?B?UC9tOW9xdTFDNlJJakNoQTBwMzVRNk1EaVpycDdEcDBFbEVlRzVIV1VkNlFW?=
 =?utf-8?B?WlpYMnhNNzBQWU5LTklqYVpsTUNtM01Va040RGdKSHl6YThrbTVRUWNpN2dD?=
 =?utf-8?B?VVpJNzllNC80MC9TWS9yTnIyMzBmZlVBWG9qRjJVKzdCMmFVSEhDQlJNY1Zu?=
 =?utf-8?B?QWxjSU5jdm1wZHV1cEdlUlZ0WTBMVURWVEVxWVNBYTFDU0hzVitnWS84NU12?=
 =?utf-8?B?TnIyMnc3OXB4Q3lwcGk3bjVRbzhwQUlRaGtrWUxHNDhkbnhaU2pzNFE5QW51?=
 =?utf-8?B?UHU1eXc1TFdyZ2VITGN6YU9Dd1B5OGxpQ2IwdDQzYW5BMjZrRElhamd3bFIz?=
 =?utf-8?B?WHFqTWZjSzh2cXhwdlpsK3hWZDh0LzR1WlhpU0JSejEzUHJsWW9RUWVsTHU4?=
 =?utf-8?B?UjR3Q0xVeEZJZ044Z01BT3VuSGhtRUJTRXVUeVFjWkxxdUFrV256MXNuTDJT?=
 =?utf-8?B?ZTYrV3ZrSDRhdThXOFRYb2NhZjlZNEM5c2U4S1puWDRDdllxSlAzWDBKWGk5?=
 =?utf-8?B?T3lYbWdQdXVGRnRYWUJMYTFIc2NJTk1DeVVpUmtlQkRSNndMaGhKSGZ1Zkh4?=
 =?utf-8?B?Z004U211NTVOYVg2aEZJSmFPU0RwZ2pxb2IzSVJsZjlobkRHcXpKRWZnSEp6?=
 =?utf-8?B?YU9Gak95RjFVNFpGOVFCckdJK3lZSVRteHBPSkpQdk52bytUNnRGc3kvZ1lx?=
 =?utf-8?B?cDFmdHpBVW9BQ3ZoTFBuUGxnSUYzSzJqdG44QWYzeGpsLzE0MDYrR1N2c255?=
 =?utf-8?B?TkF4SEY1M1FPSE9WRk9aL3JYMXVNYzJnUS9aSWlmdHY1VUJOM1RJY2x0K3NE?=
 =?utf-8?B?TFFIUEtqQ2ErS21tL0ZRa1pHRmQzUlNIMjZaYW8wbTRjb2ZIUm9UU250ZUlH?=
 =?utf-8?B?R1Nyb1VONStrMWo0L2s0OVFqUGZtbE9xYmwwRnBhbDZ6Ukh4MmkwRTFvQlVv?=
 =?utf-8?B?NWp4V3dFaWl0ckRWMDU2ZnZyMDNHK1kweHI5SzAzbm03Zjlab3NxbWd3MVFY?=
 =?utf-8?B?alNNUnN3UEx5VDVZdFdGSDBaeXk0c05LdmhLVkFEaUdSb1V2b2doNW03RFNt?=
 =?utf-8?B?eGFNb0lRV2drYnJzQ3RnbEZLWDRPZ2htKzN2bk1BaUM0ZHRCTGlTTUduelM4?=
 =?utf-8?B?V3FkZEZiQnJWVU94NVFWRlNxOUZsR2F4aTlrUmJwZTN3Q1pURlp0VjBLNDI1?=
 =?utf-8?B?RU0zM3ZqSVlBenJUelRxdmNWbVZVdGVGL0cxbHlYU2hvdWw1M1lBa2crMWxP?=
 =?utf-8?B?OUM4RXpnRmVQQlNBY1IrZlJFaWllNGVpa2NlTHh2TkNYRDRYK3pKNEc5czhC?=
 =?utf-8?B?NVlrcmtDVzgzYnZLbVF3MFh1RjNaMjhxSVpEdkhQaVhIbkJoVmNoMXVWc2xr?=
 =?utf-8?B?V1dqa3MzYjlwS3BhbkhDWGlaZGxTQW80a0tFSEphU3loUzMwbVRmTHpiVk5E?=
 =?utf-8?Q?lqzo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39cae9ce-7598-47f6-c9af-08dbf847e1ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2023 23:46:21.9171
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x48QvmtGZ2262nCjiILW9KiAppvVaCPGozrl+bTx8M4noolx1Nab8XpB4CSNKMiX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB7002
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 23:46:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192088

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgUmljaGFyZCBQdXJkaWUNCj4gU2VudDogZGVuIDggZGVjZW1i
ZXIgMjAyMyAxMjozNQ0KPiBUbzogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFp
bC5jb20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IENjOiBB
bGV4YW5kZXIgS2FuYXZpbiA8YWxleEBsaW51dHJvbml4LmRlPg0KPiBTdWJqZWN0OiBSZTogW09F
LWNvcmVdIFtQQVRDSCA0LzZdIGdudS1jb25maWc6IGFkZCBhIGRvX2NvbXBpbGUgdGFzaw0KPiAN
Cj4gT24gRnJpLCAyMDIzLTEyLTA4IGF0IDExOjE1ICswMTAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3
cm90ZToNCj4gPiBub2V4ZWMgZmxhZyBoYXMgYW4gdW5mb3J0dW5hdGUgc2lkZSBlZmZlY3Qgb2Yg
bm90IHdyaXRpbmcgb3V0IHRoZSAuc2lnaW5mbw0KPiA+IGZpbGUgaW50byBzc3RhdGUgKGJlY2F1
c2UgdGhhdCBpcyBkb25lIGluIHNzdGF0ZSBiYmNsYXNzDQo+ID4gZnJvbSBhIHRhc2stY29tcGxl
dGVkIGV2ZW50IGhhbmRsZXIpLg0KPiA+DQo+ID4gSW4gdGhlIGFic2VuY2Ugb2YgdGhlIHNpZ2lu
Zm8gZmlsZSwgZGlmZnNpZ3MgY29kZSBpcyB1bmFibGUgdG8gdHJhY2UgYmFjaw0KPiA+IHRoZSBj
aGFuZ2UgaW4gdGFzayBzaWduYXR1cmVzIGlmIHRoZSBjaGFuZ2UgaXMgcmVhbGx5IGJhc2ljIGFu
ZA0KPiA+IGFmZmVjdHMgdGFza3MgY29taW5nIGFoZWFkIG9mIGdudS1jb25maWctbmF0aXZlOmRv
X2NvbXBpbGUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxl
eEBsaW51dHJvbml4LmRlPg0KPiA+IC0tLQ0KPiA+ICBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ251
LWNvbmZpZy9nbnUtY29uZmlnX2dpdC5iYiB8IDMgKystDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZ251LWNvbmZpZy9nbnUtY29uZmlnX2dpdC5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9nbnUtY29uZmlnL2dudS1jb25maWdfZ2l0LmJiDQo+ID4gaW5kZXggNzE4
Zjc5OGEwMGUuLmM3MmRlMTU5Y2UyIDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9nbnUtY29uZmlnL2dudS1jb25maWdfZ2l0LmJiDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2dudS1jb25maWcvZ251LWNvbmZpZ19naXQuYmINCj4gPiBAQCAtMTksNyArMTks
OCBAQCBVUFNUUkVBTV9DSEVDS19DT01NSVRTID0gIjEiDQo+ID4NCj4gPiAgQ0xFQU5CUk9LRU4g
PSAiMSINCj4gPg0KPiA+IC1kb19jb21waWxlW25vZXhlY10gPSAiMSINCj4gPiArZG9fY29tcGls
ZSAoKSB7DQo+ID4gK30NCj4gPg0KPiA+ICBkb19pbnN0YWxsICgpIHsNCj4gPiAgCWluc3RhbGwg
LWQgJHtEfSR7ZGF0YWRpcn0vZ251LWNvbmZpZyBcDQo+ID4NCj4gDQo+IFlvdSBoYXZlIGEgZ29v
ZCBwb2ludCBoZXJlIGJ1dCBieSB0aGlzIGxvZ2ljLCB3ZSBuZWVkIHRvIHJlbW92ZSAqYWxsKg0K
PiBub2V4ZWMgdGFza3MuIFdlIGRvbid0IHJlYWxseSB3YW50IHRvIGRvIHRoYXQgYW5kIEknbSBu
b3Qgc3VyZSB3ZSB3YW50DQo+IHRvIHNldCB0aGlzIHByZWNlZGVudC4NCj4gDQo+IEkgd29uZGVy
IGlmIHdlIGNvdWxkIGp1c3QgcmVtb3ZlIHRoZSBjb21waWxlIHRhc2sgZW50aXJlbHkgYW5kIHdo
YXQNCj4gdGhhdCB3b3VsZCBicmVhay4uLg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0K
DQpXb3VsZCBpdCBiZSBwb3NzaWJsZSB0byBjaGFuZ2UgdGhlIGNvZGUgc28gdGhhdCB0aGUgLnNp
Z2luZm8gZmlsZXMgYXJlIA0Kc3RpbGwgcHJvZHVjZWQgZm9yIG5vZXhlYyB0YXNrcz8gT3RoZXJ3
aXNlIGl0IHNlZW1zIHVzaW5nIG5vZXhlYyB0YXNrcyANCmlzIGEgcmVhbCBibG9ja2VyIGZvciBi
ZWluZyBhYmxlIHRvIHRyYWNlIHRoZSBzaWduYXR1cmVzIGZvciBhbnkgDQpzdWJzZXF1ZW50IHRh
c2suDQoNCi8vUGV0ZXINCg0K


Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4C38C43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 13:19:23 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.71])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69009.1782998359821778169
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 06:19:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=DGsucfWf;
 spf=pass (domain: ericsson.com, ip: 52.101.72.71, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EHy7zjILIRQPECdMDtGIWtDAT7FeZ1AlNNQ9NDyGcQmBwb41mYkd7vRL5Ywb1+GoXsjKmtvSyDmdvCOeNtcvybfO8fNARalaAX3XQk1VzRKLit4nkn/H2mU2c15Kn054nSbdIATmcg/DVVYwD+ixQGZNUoGDy7vXZ/ZMN+TwgRru4mj1ZAJHAwACpJaT2BEa0+zOJ8BehaoxJ73e4Xnn9I7wMQCwjz2UjqtLbmHNxcyEsnUodlNAZmgUwxJCUcJYfHtyxrK27HeqSmMShy03g0Rtd7yZo8VxIEG48hMvPpoXFbA0IgmDxL0bS+JaYIogzAaTMNP2hdpfv6MVzAZCxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mns3aMfGXmou5Nf6kPLaQtmwCzU5WxYXkky4dq3A/vs=;
 b=aDJ6Ath3DmTlhnMHPVRtdS+WnzbaDYgK6tx37GQNvgK0twa+p4EGI7H9mWrEuJcT0tWAwX1yFEzpUI2ldsAB5A/MZTz55tS4MG0p4ekK+PuQxhraav1Rp5dyUxCcMu93F/dDdMnvcoNCS6lf4XxLzvnPVa4txnhBETNnfVVbJ7zWSDymKBq9GTTs4OCVg1hkdUfDLlEmYacfVUhlWuW3jZ3msyZ8CWWqK6bQ8bVrYBsOy0lmtJ6ADSzEitBAlW1BSqu6C2jRyytrIR1FcS6PPUnH14Hxp5Y1LyssLr2K6gh4osq8UAn/jJPon53/a149euTZkXVC1w1FdpkGf37Ydg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mns3aMfGXmou5Nf6kPLaQtmwCzU5WxYXkky4dq3A/vs=;
 b=DGsucfWfArbMwFYgvMREo9cjdW/M9z9NU+kJD2MrzVpqoeWGQrp4SbSksQmF9Dzc0+orICP2+az3svxb60Ru5E19kdkL1JV3QOmw8Tjyxhj4nUSO5dZGluakdY1NwnZnPkTvPBHVZfb4tKxZZDTN1apO6gYFJAkzHZqWV9Pkz5WDF47UtTmpp3zRCqYEo3gbe9snpsAyn0Kr7cUcDTlnPu86zEn98i4XjPfG9LbEE+O3JzbFghrQDvTxWotINOe/8rqALFgVLUnqnNywkA6O9M9nqxkTWZ6c6BQCfdZv8fKwa/BWHNSu/y+GpIMeQkskgaofZf+SWx0P7jQXlFykCw==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by PAXPR07MB8913.eurprd07.prod.outlook.com (2603:10a6:102:248::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 13:19:15 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%7]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 13:19:15 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>
CC: "qi.chen@windriver.com" <qi.chen@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"Ross.Burton@arm.com" <Ross.Burton@arm.com>
Subject: Re: [PATCH v3 0/3] systemd: update to 261 and be compatible with
 rhel8
Thread-Topic: [PATCH v3 0/3] systemd: update to 261 and be compatible with
 rhel8
Thread-Index: AQHdCIa1vskK4SNBwEGlQJdUOSKzmbZZ6sUAgAAF+ACAAA/hAIAAEzGAgAAl5AA=
Date: Thu, 2 Jul 2026 13:19:15 +0000
Message-ID: <7ad0d4852da4b1f13d6637f1e6e7dc6c674e2731.camel@ericsson.com>
References: <20260630115028.4001775-1-daniel.turull@ericsson.com>
	 <DJNY5PFZT70X.2O5P68RPD0PJU@bootlin.com>
	 <afbb3cf90ff55c3b4e693b8a28a6903b7f34f946.camel@ericsson.com>
	 <DJNZTL96C89O.1S6YFZXO1KCJI@bootlin.com>
	 <CANNYZj-duZWDtw2XP8SYg8gqhEbVDhnATLByJw+kAN2EjY0ZNg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-duZWDtw2XP8SYg8gqhEbVDhnATLByJw+kAN2EjY0ZNg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|PAXPR07MB8913:EE_
x-ms-office365-filtering-correlation-id: b2763030-5c74-4cd8-0d84-08ded83c83c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|6133799003|4143699003|11063799006|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 
 KmaoPjQwoag2krEc75l6jzH/jCXoMk1Q4zOkZVn6tnaFdsdFHrvKkuJrwSva4a2Q71OkNSupZ/AxHnl7z/iaNloxm6BmhaEeobrADN+1fDYDIaB/jebZCNbXgcZqVscW6AeRowap+eQZZRpJraxr+jtNTMr+mAEl27xMf6t+Qj+tGMPJCq5t88DXj1l5DzJ7yNVjk21ORfEm1fkssIxRowIIdiC4pPB/hhz8j3ShZe/Pev/EibzCwLQ8laMiNIkn0EUs63vEG2ZWoHg/jF5u80bK21yopTIan/qEI+p5bP14fpKTWLueYBxfRiB9eCoHTU9LKP5Lgy14Lij2KWcOFxPdswwrtChm78rSj82EhTQ7IV2zfoX4Di2ocldI60XunrFP+f6AAzuybuKUAWCCFTZSwnV/ZZWoHJzhFqpJDhQsjTb4oynq3Bz+5RF+8+K9FYIviQMxtLiKAB6U0uTAIc0EB2FWSgo2TCEtebY9KbUkSR7QWj/izGNwkbUmh+XWPHqiFzN9X+VNtUxtZRJ6ymS5984R+FcdtpeZ4hZZNvHVM+GuWnOwdc3iJdQ67vh+UrqHOxBdTgxkOym5DyCQVsT5nDh/Iunw0Bh153dEkc2XHs5YmSpzogbzxYUDvt5C2EQd5bjqnlTfCiSFv4PRdBl7bCBQMOlZS98icLSrPKn/LOmwcjsIDoKNbMjO9zGEa2x9oXgsEY8hhHGkLoAs4+4JusSEM+KSQJungEjLcnU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(4143699003)(11063799006)(56012099006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MHNKZzBCWkg5Z2FFTmdBYk4wNnN3aXJqS0ZDUmQwRkVGbWlVUmxnR3UrRE02?=
 =?utf-8?B?M0pWVEd4cFJBTG5FYUQvdkdZcHdZeXpRbG1MdmRxS1RjbkpBOWs5SDIxcG14?=
 =?utf-8?B?L3l5M2tPZEF2TWE3NjBrYlc3dUhjODRhaVlpUlhqNVBzTnUvTWVJNzhaNXFq?=
 =?utf-8?B?bjhYSk5kOFZwTStnQkxrVDJoeFdEbWR6NXJmM0ZwbW9DSzFmQmxmdk9SdEYy?=
 =?utf-8?B?Z1pMeW1xQjRYWjlEeHZUbnhPckdQWFBheWdBY0c5UHFMMDVQVkFXWkZtWXgy?=
 =?utf-8?B?Q2JEUFVhTHpRM1AvS05NNktSYWFkdU0zWHo2OUxsMkdabjN0RTFKV0N5TnIy?=
 =?utf-8?B?eVo4a2VyNVlFM2diUHJsTyt2b2VSYW5DUWNxREh0OWJxRkthc1NhSDZKYjE3?=
 =?utf-8?B?VW1GNUZUWGtlNlllcngyNjVuZjg1NFgrUXFhQys3SmIyK2IrUVY3RzlrbGcr?=
 =?utf-8?B?UTdnZTVObUFYWmxjSUo4ZWRhSWcycFRnMDFSZ2Q4RzZrNEZVOHYzdUhCbUxI?=
 =?utf-8?B?b0pIR1RCQlJJSHVTWUtVNDJ2Ui9HQkJBeDk2cXJuK1JRdUsvUWNnZktTd2xh?=
 =?utf-8?B?SGZYUzlxZGhlNE1xemtMRmFhOVY0bU9SaElUeTNXb0REVDYzL0hoRkduWUxy?=
 =?utf-8?B?Y3I2RHJDNWJmRUMvZUVDcFJTakRoL0RVcVVWSEJNR2JIT3pXOFZEWDc2bGJN?=
 =?utf-8?B?TUNTMEo1U0dyMUZuNFM2U0crZERaa3Jjb0x0bGtvRWU2eG04VG10b0lZa2Vk?=
 =?utf-8?B?WnpESmJtemNaTlFpUDc0dFRwaEQxbnZpSXZsMnJhVU5IOTk1TGh5ZUsxR1Y1?=
 =?utf-8?B?bG9uSTlRVDlweU01UjRIOUVhN0hkVjlHZzQwYTNNb2FrSFI1eFQzcHEwVlFY?=
 =?utf-8?B?b1F2Q0VqOHpyMGdTaDFnNmd3L3lONnFxc1A0SUZabVAzMlVOZ1FIOE0zY1Uz?=
 =?utf-8?B?ekVxYmRWRGZjWmhEeGFRaWRWcktxM3RnYXdYSG5DRU9yYVJLOGwwY1A0OERP?=
 =?utf-8?B?cG9ZdEcwY3JTVFU4c1lGRU1DRmhHWksxS0xNSlF1SEZLU2VtOUxKZUZOZkdh?=
 =?utf-8?B?SXdrSng0cU1pckh4bUFXRzdwV0FGemYrQW8vNGZqa3dlS040bU9lbVlxUE9q?=
 =?utf-8?B?bEFJYkY2OXh6dlR0SVlPdGdSeW1nQkFCaW9VUTIxMG56clJudkY5eGxad3Fx?=
 =?utf-8?B?ZWlEYlA4U21HRURzODR6LzBDYUZrM2V4UTNna2JPQXhudmhmYmJVL0NGOG9C?=
 =?utf-8?B?bDZ1bVBaTldCNTV4SWtZdUU3dmhuSHkvSmlTV0dlTkp6bGhaTndFQVdXQlhq?=
 =?utf-8?B?YndqYjJmVlI3WFUvQU0rVmlaMVk1RXd2dHFhakR1YkFiZmpMK2NQaFBmUWFX?=
 =?utf-8?B?RVNtSVpObkVaOE00b1BxYXlYM2lUOFJRQmcxQzlNcW80REtmQkZSWXVsZ25n?=
 =?utf-8?B?eWpUaWFrM2F3cVMxNTQ0S0ZMRFBlTTRPK2ZsSC9QeHd1ckF4YVJoYTY4QWp5?=
 =?utf-8?B?U0pybWpmSDlIYUFRV05RcUhwUFJHK0pET1lndU1oVmJTa3Z3N2Mvem9scWRQ?=
 =?utf-8?B?TjJDK09DWWMzdTc3VHBHc2dxWUUvNHVxWnVsZVdBaldoNUJGV0dPcXkxd0VU?=
 =?utf-8?B?bSthUTNIWm1kK0Q0M2FLc2dnU3RmdGFRT0VpTFlUR2NGbVVWWGNiRXBBVEU3?=
 =?utf-8?B?eWo4WGZ3cG4wc2hHNFJEVDRFOS9kaTBoSWVHcXg4NmsxT2hLRFExSEF2OVpw?=
 =?utf-8?B?RjkxeGJYTndjZGxoL2JNc0JKZUd5cEdyMWdiT1hTOFEyNC9CbDh3Vkc5ak1V?=
 =?utf-8?B?TE1jOWNlM0dzd3N6YmVtYWRqZCtuMURxTmtlTUQ0L2pHSW9jU2lMSWpRYTBU?=
 =?utf-8?B?djh1aGl3bS8xMFEyS0JrL0dMbWpWYzc3bkNsaXc3dWR2NUlSNjVMalJlc2pk?=
 =?utf-8?B?bW1BS0NxamtDOGYyM0E4cEpHR0swWWVsRVFqdXJ5NG9jYVUvUG9VbjJKT0tH?=
 =?utf-8?B?cmY2bDJ4V2kzd0RwRWJJYk9odHd0eEVnRXV4SkF0dm9oaVBMRzcrbEVQSHl2?=
 =?utf-8?B?aVVSVzNZbUVCd2VmRktEaFYvenQ4MnlBVE9hdDA4bVJDN2l2WDVrMmVpVXlp?=
 =?utf-8?B?L0xRd0d5L0s2TzcxeUxQTFdnZ0FocGxwS2dRUzRnV0FDc0ZaRkNIRU1QQWI2?=
 =?utf-8?B?MW1OdWkrV1EyR1VyOEJJTldYTUc1TCtXdDBVWlBkU2xKdlJRTjUyYWxEM1pK?=
 =?utf-8?B?ZjJnTlRQV0p4YnEvd2w0RjZtYWZ0WkpFMW9rcWRmckh2S2FzNUU4dmdTMHBE?=
 =?utf-8?B?dlJnVGtRbGlxNEMweXRLN0dFYUNMNUpqUVRmZ3BkQmNvWUNuMTFBdC9jMnFp?=
 =?utf-8?Q?E2/p4D8fmmtQuOmo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D7FDB6803EC47D40A566E1742835B48E@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2763030-5c74-4cd8-0d84-08ded83c83c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2026 13:19:15.3083
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d1Rynj3r+KI68+VG3jtgR2r1jqMA/U9Getoqeq95JP0yaQjj7AU2VPLys6p0NQuIQjSpK3+6x7nsJ46NCLDRtMkUH9GBlkDDFU8JWRwJ42k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR07MB8913
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 13:19:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240047

T24gVGh1LCAyMDI2LTA3LTAyIGF0IDEzOjAzICswMjAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToNCj4gT24gVGh1LCAyIEp1bCAyMDI2IGF0IDExOjU1LCBNYXRoaWV1IER1Ym9pcy1CcmlhbmQN
Cj4gPG1hdGhpZXUuZHVib2lzLWJyaWFuZEBib290bGluLmNvbT4gd3JvdGU6DQo+IA0KPiA+IEkg
c3VzcGVjdCB3ZSBoYWQgdGhlIHNhbWUgaXNzdWUgd2l0aCB2Miwgd2UganVzdCBoYXZlIGJlZW4g
YSBiaXQNCj4gPiAodW4pbHVja3kgYXMgaXQgbmV2ZXIgcmFuIG9uIGEgRGViaWFuIDExIHdvcmtl
ci4NCj4gDQo+IERlYmlhbiAxMSBoYXMgaG9zdCBnbGliYyB0aGF0IGlzIHRvbyBvbGQgZm9yIHN5
c3RlbWQuIFRoZXJlIGFyZSBvdGhlcg0KPiBkaXN0cm9zIHRoYXQgdXNlIGFuIGV2ZW4gb2xkZXIg
Z2xpYmMsIGFuZCB0aGV5IGRvIG5vdCBmYWlsIGJlY2F1c2UNCj4gdGhleSB1c2UgYnVpbGR0b29s
cy4gU28gd2UgbmVlZCB0byBhZGp1c3QgdGhlIGF1dG9idWlsZGVyIHRvIHN0YXJ0DQo+IHVzaW5n
IGJ1aWxkdG9vbHMgb24gZGViaWFuIDExIGFzIHdlbGwuDQo+IA0KPiBBbGV4DQoNClllcywgSSBj
YW4gcmVwcm9kdWNlIHRoIHByb2JsZW1zIHdpdGggZ2xpYmMgb24gZGViaWFuIDExLg0KDQpJIGhh
dmUgdGVzdGVkIGluc2lkZSBhIGRlYmlhbiAxMSBjb250YWluZXIgYW5kIHVzaW5nIGJ1aWxkdG9v
bHMtDQpleHRlbmRlbmQtdGFyYmFsbCBzaG91bGQgZml4IHRoZSBpc3N1ZS4NCg0KRGFuaWVsDQo=


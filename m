Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4A2CCD6E55
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 01:54:42 +0000 (UTC)
Received: from TYVP286CU001.outbound.protection.outlook.com (TYVP286CU001.outbound.protection.outlook.com [52.101.125.34])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15398.1780365273177964681
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 18:54:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=NCGtCCEh;
 spf=pass (domain: fujitsu.com, ip: 52.101.125.34, mailfrom: zhengrq.fnst@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U49iOikziUqaVG3PuYRfScllU3LFubNQlGeTDnCu2h9T90GKU9C1cFYDdiPJ6Rfq3T8GnNPY0NnDOz7otlD0Fo99u82rH7wtsGRpEMqtCZ/YKGzvp7leE5CJMXxFQuornIg+ql6IV2lBVVYdmhfWV4gBZu5y+0jquWkmh9qSLKhCUqAhygLgJmjmdaqVZC583l+m94hUEDlGuEbQpXOrXOeBEAGVqJIF9wpBtjp1HwTsKONyq3+vji8vgVe1Ns+ZQlCx4CpWHZ6+ojtIhVSbJBeQ15vnUgPbQgD8bPKlDBycCPLhvgT2AOWFNDw9+nMJXkNHs0BUc9caDCYTjRaGIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TCN38q0okidXWRgW0zmqkMVBHuriKNqcxUAfSzs9/SU=;
 b=j0eh71ZfnVMz812jPeFHi8s65J0d4F/YUyTLQihpd6aeoWXAlrjvPXCdUu+UKpkwjFOLJzvNOpy44pL/kS05O/QGbS2QwJxT8J1sd5Dn9P+KSfdkicyAaPaxbp/KaCmPJIg/xhCET/Qnxt46Vy/sFyiVoy+F0SdJTQ+q/IJYT17Hb3/Mh3HNzlykYW3Na+n66duipgFz33IPX70r0H9Ax28iGOeRYs9xeSQPo3gt8ifsFmDJCBcX/WVKof8PUBzum9u7fDjqQ977PBfQjNq5D+E2r6JqOdg0Z9WxgnT77xmhxS8Dawsu4T4Td6Pc/lVwMtiNL+ZfZt/s66W0dJmkKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TCN38q0okidXWRgW0zmqkMVBHuriKNqcxUAfSzs9/SU=;
 b=NCGtCCEhCT6wQXDWjNYk74nZ3rUWUTfS8p94SJ4MpBof35mqbkVXIISZvnLo6kW+COHEV2zs4eWAKU4JRDmPMf2EUazXVM365F/oYCxtvnBp16Ch8CPQTvE/yMHnvYD39LtZq7rQgNx1d05jHzbJboHiiP2sWHbMcHo7eMgqwIoNqjETnN0yD9fyO4jn+GCg0Z16kZ3bXLOtFuUtcoJOpGr+GZ1Rcy9AYDG9CJGsKMFT99kuch0s7I1HMpeSI7B6OFPnvIdXezqH2ooXysGhXJWt+bjC868CBay6/0eyUt4sNoflaR0MhkmihPxFYS9Z74EZ0JlPihIJ5s85yqcMuQ==
Received: from OSZPR01MB7868.jpnprd01.prod.outlook.com (2603:1096:604:1b8::10)
 by TYCPR01MB10365.jpnprd01.prod.outlook.com (2603:1096:400:241::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Tue, 2 Jun 2026
 01:54:27 +0000
Received: from OSZPR01MB7868.jpnprd01.prod.outlook.com
 ([fe80::faa3:6cc4:2c96:cedc]) by OSZPR01MB7868.jpnprd01.prod.outlook.com
 ([fe80::faa3:6cc4:2c96:cedc%3]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 01:54:27 +0000
From: "Ruoqin Zheng (Fujitsu)" <zhengrq.fnst@fujitsu.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] vim-tiny: bugfix lack of defaults.vim
Thread-Topic: [OE-core][PATCH] vim-tiny: bugfix lack of defaults.vim
Thread-Index: AQHc8SKl2Ow8VA90V0GJMC5GDqATwbYo8yY5gAGHZM4=
Date: Tue, 2 Jun 2026 01:54:27 +0000
Message-ID: 
 <OSZPR01MB7868A7D33A0E67FBB3E1043B8B122@OSZPR01MB7868.jpnprd01.prod.outlook.com>
References: <20260528020658.789-1-zhengrq.fnst@fujitsu.com>
 <2c47dc98209c6874d1e2c9726a5d24881b059d6e.camel@linuxfoundation.org>
 <18B4D2C3BE17A296.111707@lists.openembedded.org>
In-Reply-To: <18B4D2C3BE17A296.111707@lists.openembedded.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=True;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2026-06-02T01:54:26.546Z;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=1;MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB7868:EE_|TYCPR01MB10365:EE_
x-ms-office365-filtering-correlation-id: cbcfda62-c43f-4399-7d0d-08dec049e100
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|1580799027|13003099007|8096899003|4143699003|38070700021|18002099003|22082099003|56012099006|11063799006;
x-microsoft-antispam-message-info: 
 AOn2dGKYnFTLsvEtFgNnTDo2lM/xP0Zji+cEiEmzANrdoXa6zqkggPYAkoW/tqy162yZEApV0phnzULaig8/fW8liYFRwHRfvuxN6uP7jq7DPiNvm+PJyR0KkPFzT+kblw5Ztq58JggbdiV5NkLt4aWye45QVaD3XG/L9bF1NtJ1VUsqHZZIgL6HA6VYMxV0XaGli17h4yLQ65GPfF+TbNPQE8CnVluJL47M3DeqOf+E3KHe7JknS9HDcsA32K3jEoV8r1T6TJpsVk7+gOFBgKs6I/CTx4c8c+g+tzNxad9JikYZKQwC12ipxv7V1aOZfQMutF9hkbI8rYan7DFBZEW1aaLauRleyqRFNGYSutU3ax8lzMRPEDjikvro+VeZPrhnyRgT09G1B0nEsaL2HyZjHFmZmNsKVG/or7qzH7J5JkEJO/om0PhIZZrECw8Vfeqe9zj5kxexUemgUDuuhzRpYUxbW0Os4NjXRUCYfkn0lKdAy0CzV3HTICAO8axDcD9ap2TZCUBpVBMmk7dc4+miqtgZ2QOyCO6K1T3ENYu3iyrjLTgKwlBN5MgKGhFdVniKK4afQjFm/wWC7RgiUCiGJJBNOAHL1dp9vxTBRAlDBuzk3MVBAzjjOKWCggGK+uePTPbqUQessMQrAyUTOzg3ALCgBMf2clIlTqZ/gXE+FRLjooPKgyObGgVWAnorAHnAkFQmonZIrtWR9K9YmMmvZfCseCSWCOC/Q2RfgGQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7868.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(1580799027)(13003099007)(8096899003)(4143699003)(38070700021)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?RjA0WlVNRFZKSjFPN3lGcllPZE9TUlNuWVpiM2pIZVAzMVJyVnZ1ZkN1U0pV?=
 =?gb2312?B?eGpDNEU2ODRJNGU3UEgrUUFHZGxySzdZeGZMTkZFY29xSHdYbEQrZVE3eHZG?=
 =?gb2312?B?WkRoczVSaW84MjhjN0JWR05HNk05MDVuZkFWSVlrVlVrWnFFYXRjZllLSy9B?=
 =?gb2312?B?ZU9mS0gyQXMwd1lDcGl2ekF6dTJ3MFBWbjcrT3VRUHR3U3FEdmdqT2dxaE43?=
 =?gb2312?B?ZGR3U0krSVR1alJtamJucVpQdEpKZFBIYitGNThidDIreFZ0Wkp1NnlIMjdZ?=
 =?gb2312?B?dzFLZXFUb1ZHRmY1Vk1YN0luaGRJKytIYmFXbno2ZTRmNkNvbW02UEhLWFc5?=
 =?gb2312?B?MFBISzQza3U3VEFWbnNMNGx3Um5aSkp5TUUrRnZuQlZrU2R2bXVTZWFjOWtQ?=
 =?gb2312?B?S25EWXFZTDFHRjNuQXh6OTJUUFQwN0NxcDA5a0V0SXk2aWJpZjd6ZU9VVlhB?=
 =?gb2312?B?REo5aUZLTEg2blpyZGFIdXZVTUlTRUs2eTNqRWZNMG1pSldrQkVZN3BFSVRL?=
 =?gb2312?B?eGIyZExkYXQxUjQxdUg3V25QT1dzaWZIb3B4YnFiVjFLc3dldk90emVxbTBI?=
 =?gb2312?B?Y25kclBxZ2IvM3dydWsxUStUS3FjY3VSVWpiWkFYdFZOUmhiV1BPL3hBdHN4?=
 =?gb2312?B?SENOM1NUV1Y4ZkJwb0VielBiUmlpaXZuY3VMQWtkMzFzb28xdnRxYjJjRzN1?=
 =?gb2312?B?MjhFNDJhUjU2anUvWkRYRUZFYXhVbDJrbXVSS3FEbkY2ZnpRYVp0QlZSRmpS?=
 =?gb2312?B?RHc4UUNETEQvejRUT1B5RURQakZFYVhLNkZwOVJmMGVqNDVTRzhCakRXSUVZ?=
 =?gb2312?B?aEY2azdkVVoyRzlIckJtaFdybkpaejlvMGxBSHk0WUx5VWplYjV0RFlXQTdP?=
 =?gb2312?B?SjBLUWw0RVpFR0VxakxBTzVteTdGc0hFZ3VLRkQ3M2pMSWNTRmtkL0ZrTHcw?=
 =?gb2312?B?K3ptSHhtL2dNcGovUHhvdkt6WnlXT3J0UVZaNXlkNDFmWW94OVNJMWxIeUdl?=
 =?gb2312?B?OHRlMFFWZldtVHJlTW95Z0g5VVZDWHF0di9tWmkzRnI1MEw2eU51RnBoKzNv?=
 =?gb2312?B?ekViRlprdE9IODBGRVdUNG1WZlZSMnFTbUE5TWtDYkZQcmt4dGN3T1FaM2Za?=
 =?gb2312?B?anhEWmxnaWRBZlBaRVNQc1BRMVlIN0NjeWI0dVFBSzd5NHkwYkxNUmdSTlBY?=
 =?gb2312?B?TitmbDJoNENEL1puZXIrMnlYcURCWGpiT1dMTnNrNHlmWDZ1dGsyaVQ1VTZi?=
 =?gb2312?B?ait3b2Q5Q2krTEJ4eVFnb1A5UlRCUnMzc2ZLUkZXR1VVNHlmc3FwdE10Y0VL?=
 =?gb2312?B?NUhWd0pGK1VCMllvaXpiRHhJd1R2YmZMQWJML2QxOS9hYmZENHNvQ1NQLzly?=
 =?gb2312?B?OEtmdDJ1ejZJRW5hN1JMK0hzbzI5OGV6QW96bktUaXBDdU1iSnJpK0kya3V2?=
 =?gb2312?B?b1hYSTM3TUdrQlNlenk3blR0V0dzUlFQd1lwZGRJZmJ0Yy92Vm1yZXhXM0xa?=
 =?gb2312?B?bzg4WjRJQXBJQXBDcnBHajBlakxzSTIrRHNSenN4UzA3TndFaUlicVRVY2Zm?=
 =?gb2312?B?bUZ3V1E4aWpGZTd4RVFacDVzY3VwZ0d6N1gyZTZMODM2VHp5c25ZWlBNRktr?=
 =?gb2312?B?TFZrTVhRSFFsTVZGazd2OWZ5RDBOZ2FPN1pFQjZMZGQvcUc5Ry85ajBoc25W?=
 =?gb2312?B?UklFeFA5aUJYMVVGbVhPMmtTWmVEYk9PeUlTMmlpN21jNjhWTGJvZmRlcUQ1?=
 =?gb2312?B?QWsvR1JhbmN6VHVnU1F1SDM4dG8xenlzdnhWZ1RnMEZnNnZUUE1RcUhlbFk4?=
 =?gb2312?B?STBBRTNwWFE5dGp6YVdnTWM5VmZnUjFhZGoyalNJeXhJWmx2QzM1bEZmWEhx?=
 =?gb2312?B?Ti9ZdDR6ZFpZbVZpdDBJRnRYQ2NVMkIxWFJTYmF2NENDeEpnNzltWTQ3dlFW?=
 =?gb2312?B?RDdJRXZseFpWWEtJN25NUzAyaDVBRlcxY1VVRUZ5S2s2T3RSeHhKa1phRVp3?=
 =?gb2312?B?V2ZwYmpDSm1NYmF5Ry9YM0wxRGp0WERBVGVxb0JLQXFtOWcvZUgvaFNudEo3?=
 =?gb2312?B?SXZRay9xK1ZMdEJiOUhhVVFOQWZlT0Y4ak1vbVVNcVY3eCsrc2RmZ3RGT0RB?=
 =?gb2312?B?V0FvRzhlWHR5Rld1NytUNkZmUjQxMG9kRzZmZ2ZwWHA4Mm1ZM1lTVUtyVnFj?=
 =?gb2312?B?ZmFNa3R0SEtuanVlWWplZ3QvVzdSNGtWODM1YktCRGRTVDBtTTdNTWJPZkFH?=
 =?gb2312?B?bis4UG1LdlE5dXpZeUhLbzB4Y0paSVI3Q3k5ZUJaMEdTZ2dOalNOVkh2UzBt?=
 =?gb2312?B?eHB0SWhKK3FLYTQzR0pHRW00Um9GYWRPZGNqdit1NUdJMlVScG54UT09?=
Content-Type: multipart/alternative;
	boundary="_000_OSZPR01MB7868A7D33A0E67FBB3E1043B8B122OSZPR01MB7868jpnp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	oDqn4zsE/l6lZ9Qwi0k7SN+8CxeTZEsgph6nMfz5vy+XeXXqsmpgCoznbAXKpR6b/NKXxxQNwspoyt9e+Gtvwtn0h6tRnvpNl395RlnbpBVSuP4aHSRtq9EYLKWep4q6cvn72kvrkh2jZ9aXriV5BC2N2H/i3s5lX1MIBvSMZg2VyLC4GTDVe0eWfKasieajNay4jP5e+sFKbnmuLbLnAY80JNLsG8waDd9oVk6Rsxm56szA8X6X46RH8IchXnM1B0yh7TeWCaNuOv7ycRU2MfUW1RGbuTRfOUXT55hXaFbXVE77fkaxaTTPuDlf3n3ezTQD/8xRRLPb7ronU6NOmw==
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7868.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbcfda62-c43f-4399-7d0d-08dec049e100
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2026 01:54:27.2990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h0awwbxwc1p52zfOMNuGFznDP1J1VM7Oe9xSf2BUAEWnKaolZLwpiT7mYu45jvocvXXPePVC70dJ5wzeLswoSOt9xk/TnQHy8wZF7L7NkPg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10365
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 01:54:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237997

--_000_OSZPR01MB7868A7D33A0E67FBB3E1043B8B122OSZPR01MB7868jpnp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZA0KICAgSSBhbHNvIHJlZmVyIHRoZSBzb2x1dGlvbiBvZiB1YnVudHUNCg0KICAx
LiBJbiB1YnVudHUsIHZpbS50aW55IGRlcGVuZHMgb24gdmltLWNvbW1vbg0KaHR0cHM6Ly9wYWNr
YWdlcy51YnVudHUuY29tL2VuL25vYmxlL3ZpbS10aW55DQoNCjIuIEluIHZpbS1jb21tb24sIGl0
IGluY2x1ZGVzIHZpbXJjIG5lZWRlZCBieSB2aW0udGlueS4NCmh0dHBzOi8vcGFja2FnZXMudWJ1
bnR1LmNvbS9lbi9ub2JsZS9hbGwvdmltLWNvbW1vbi9maWxlbGlzdA0KDQogMy4gRGlzY3Vzc2lv
biBhYm91dCB0aGlzIGlzc3VlIG9mIHVidW50dQ0KICAgaHR0cHM6Ly9saXN0cy5zbmFwY3JhZnQu
aW8vYXJjaGl2ZXMvZm91bmRhdGlvbnMtYnVncy8yMDIyLUFwcmlsLzQ3MjgzMC5odG1sDQoNCiBT
byBJIHRoaW5rIGFkZCB2aW0tY29tbW9uIGFzIFJERVBFTkRTIG9mICB2aW0udGlueSBpcyBhbHNv
IGEgcmVhc29uYWJsZSBzb2x1dGlvbi4NCg0KWmhlbmcNCg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18NCkZyb206IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IG9uIGJlaGFsZiBv
ZiB6aGVuZ3J1b3FpbiB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8emhlbmdycS5mbnN0PWZ1
aml0c3UuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQpTZW50OiBNb25kYXksIEp1bmUgMSwg
MjAyNiAxMDowNA0KVG86IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5k
YXRpb24ub3JnPjsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3Bl
bmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NClN1YmplY3Q6IFJlOiBbT0Ut
Y29yZV1bUEFUQ0hdIHZpbS10aW55OiBidWdmaXggbGFjayBvZiBkZWZhdWx0cy52aW0NCg0KSGkg
UmljaGFyZA0KDQogICBUbyBmaXggdGhpcyBpc3N1ZSwgSSBhbHNvIGhhdmUgYW5vdGhlciBtZXRo
b2QuIFRvIHRvdWNoIGVtcHR5IC52aW1yYyB0byBhdm9pZCAiRmFpbGVkIHRvIHNvdXJjZSBkZWZh
dWx0cy52aW0iIGVycm9yDQoNCiAgIEFuZCB0aGUgcGF0Y2ggd2lsbCBsaWtlIHRoaXMNCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC92aW0vdmltLXRpbnlfOS4yLmJiIGIvbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvdmltL3ZpbS10aW55XzkuMi5iYg0KaW5kZXggZTRjMjZkMjNmNi4uMzNj
YzQ4MTI3MSAxMDA2NDQNCi0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3ZpbS92aW0tdGlueV85
LjIuYmINCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L3ZpbS92aW0tdGlueV85LjIuYmINCkBA
IC02LDYgKzYsMTUgQEAgUEFDS0FHRUNPTkZJRyArPSAidGlueSINCg0KIGRvX2luc3RhbGwoKSB7
DQogICAgIGluc3RhbGwgLUQgLW0gMDc1NSAke1N9L3NyYy92aW0gJHtEfS8ke2JpbmRpcn0vdmlt
LnRpbnkNCisNCisgICAgIyBBZGQgIi52aW1yYyIgZmlsZSB0byBhdm9pZCAiRmFpbGVkIHRvIHNv
dXJjZSBkZWZhdWx0cy52aW0iIGVycm9yDQorICAgICMgRm9yIHJvb3QgdXNlcg0KKyAgICB0b3Vj
aCAke0R9L3Jvb3QvLnZpbXJjDQorDQorICAgICMgRm9yIG5vbi1yb290IHVzZXINCisgICAgaW5z
dGFsbCAtZCAke0R9L2V0Yy9za2VsDQorICAgIHRvdWNoICR7RH0vZXRjL3NrZWwvLnZpbXJjDQor
DQogfQ0KDQpJcyB0aGlzIG1ldGhvZCBPSz8NCg0KWmhlbmcNCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18NCkZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51
eGZvdW5kYXRpb24ub3JnPg0KU2VudDogTW9uZGF5LCBKdW5lIDEsIDIwMjYgMToyNg0KVG86IFpo
ZW5nLCBSdW9xaW4v1qMgyPTH1SA8emhlbmdycS5mbnN0QGZ1aml0c3UuY29tPjsgb3BlbmVtYmVk
ZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZz4NClN1YmplY3Q6IFJlOiBbT0UtY29yZV1bUEFUQ0hdIHZpbS10aW55
OiBidWdmaXggbGFjayBvZiBkZWZhdWx0cy52aW0NCg0KT24gVGh1LCAyMDI2LTA1LTI4IGF0IDEw
OjA2ICswODAwLCB6aGVuZ3J1b3FpbiB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToN
Cj4gV2hlbiB2aW0tdGlueSB3YXMgdXNlZCBpbiBpbWFnZSwgaXQgbGFja3MgZGVmYXVsdHMudmlt
IGZpbGUgd2hpY2ggd2lsbCBjYXVzZSBmb2xsb3dpbmcgZXJyb3INCj4gcm9vdEBxZW11eDg2LTY0
On4jIHZpDQo+IEUxMTg3OiBGYWlsZWQgdG8gc291cmNlIGRlZmF1bHRzLnZpbQ0KPiBQcmVzcyBF
TlRFUiBvciB0eXBlIGNvbW1hbmQgdG8gY29udGludWUNCj4NCj4gU28gYWRkIHZpbS1jb21tb24g
YXMgUkRFUEVORFMgdG8gcHJvdmlkZSBkZWZhdWx0cy52aW0gZmlsZSB0byBmaXggdGhpcyBpc3N1
ZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogWmhlbmcgUnVvcWluIDx6aGVuZ3JxLmZuc3RAZnVqaXRz
dS5jb20+DQo+IC0tLQ0KPiAgbWV0YS9yZWNpcGVzLXN1cHBvcnQvdmltL3ZpbS10aW55XzkuMi5i
YiB8IDIgKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4NCj4gZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3ZpbS92aW0tdGlueV85LjIuYmIgYi9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC92aW0vdmltLXRpbnlfOS4yLmJiDQo+IGluZGV4IGU0YzI2ZDIzZjYuLmI2
ZGRkZWQzODEgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3ZpbS92aW0tdGlu
eV85LjIuYmINCj4gKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvdmltL3ZpbS10aW55XzkuMi5i
Yg0KPiBAQCAtOCw1ICs4LDcgQEAgZG9faW5zdGFsbCgpIHsNCj4gICAgICBpbnN0YWxsIC1EIC1t
IDA3NTUgJHtTfS9zcmMvdmltICR7RH0vJHtiaW5kaXJ9L3ZpbS50aW55DQo+ICB9DQo+DQo+ICtS
REVQRU5EUzoke1BOfSArPSAidmltLWNvbW1vbiINCj4gKw0KPiAgQUxURVJOQVRJVkVfUFJJT1JJ
VFkgPSAiOTAiDQo+ICBBTFRFUk5BVElWRV9UQVJHRVQgPSAiJHtiaW5kaXJ9L3ZpbS50aW55Ig0K
DQpEb2Vzbid0IGFkZGluZyBkZXBlbmRlbmNpZXMgbGlrZSB0aGlzIGRlZmVhdCB0aGUgcG9pbnQg
b2YgdmltLXRpbnkgaW4gdGhlIGZpcnN0IHBsYWNlPw0KDQpDYW4gd2UgY29uZmlndXJlIHRoYXQg
b3V0IGluc3RlYWQ/DQoNCkNoZWVycywNCg0KUmljaGFyZA0K

--_000_OSZPR01MB7868A7D33A0E67FBB3E1043B8B122OSZPR01MB7868jpnp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; color: rgb(0, 0, 0);">
<span style=3D"font-size: 12pt; background-color: rgb(255, 255, 255);">Hi <=
/span><span style=3D"font-size: 11pt; background-color: rgb(255, 255, 255);=
">Richard</span></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;I also refer the solution of ubuntu&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; 1. In ubuntu,&nbsp;vim.tiny depends on vim-common</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<a href=3D"https://packages.ubuntu.com/en/noble/vim-tiny">https://packages.=
ubuntu.com/en/noble/vim-tiny</a></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
2. In vim-common, it includes vimrc needed by vim.tiny.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<a href=3D"https://packages.ubuntu.com/en/noble/all/vim-common/filelist">ht=
tps://packages.ubuntu.com/en/noble/all/vim-common/filelist</a></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp;3. Discussion about this issue of ubuntu</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;<a href=3D"https://lists.snapcraft.io/archives/foundations-bug=
s/2022-April/472830.html" id=3D"OWA8a864bf4-6146-bc0a-d0af-22761f48aa83" cl=
ass=3D"OWAAutoLink">https://lists.snapcraft.io/archives/foundations-bugs/20=
22-April/472830.html</a></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp;So I think add vim-common as RDEPENDS of &nbsp;vim.tiny is also a rea=
sonable solution.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: black;">
Zheng</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of zhengruoqin via lists.openembedded.org &lt;zhengrq.fnst=3Dfujitsu.co=
m@lists.openembedded.org&gt;<br>
<b>Sent:</b> Monday, June 1, 2026 10:04<br>
<b>To:</b> Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;; opene=
mbedded-core@lists.openembedded.org &lt;openembedded-core@lists.openembedde=
d.org&gt;<br>
<b>Subject:</b> Re: [OE-core][PATCH] vim-tiny: bugfix lack of defaults.vim<=
/font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; color:rgb(0,0,0)">
<span style=3D"font-size:12pt">Hi </span><span style=3D"font-size:11pt">Ric=
hard</span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
&nbsp; &nbsp;To fix this issue, I also have another method. To touch empty =
.vimrc to avoid &quot;Failed to source defaults.vim&quot; error</div>
<div style=3D"font-family:Aptos,Aptos_EmbeddedFont,Aptos_MSFontService,Cali=
bri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Aptos,Aptos_EmbeddedFo=
nt,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:=
rgb(0,0,0)">
&nbsp; &nbsp;And the patch will like this&nbsp;</div>
<div style=3D"margin-left:40px; font-family:Aptos,Aptos_EmbeddedFont,Aptos_=
MSFontService,Calibri,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0=
)">
diff --git a/meta/recipes-support/vim/vim-tiny_9.2.bb b/meta/recipes-suppor=
t/vim/vim-tiny_9.2.bb</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
index e4c26d23f6..33cc481271 100644</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
--- a/meta/recipes-support/vim/vim-tiny_9.2.bb</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
+++ b/meta/recipes-support/vim/vim-tiny_9.2.bb</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
@@ -6,6 +6,15 @@ PACKAGECONFIG +=3D &quot;tiny&quot;</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
&nbsp;do_install() {</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
&nbsp; &nbsp; &nbsp;install -D -m 0755 ${S}/src/vim ${D}/${bindir}/vim.tiny=
</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
+</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
+ &nbsp; &nbsp;# Add &quot;.vimrc&quot; file to avoid &quot;Failed to sourc=
e defaults.vim&quot; error</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
+ &nbsp; &nbsp;# For root user</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
+ &nbsp; &nbsp;touch ${D}/root/.vimrc</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
+</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
+&nbsp;&nbsp; &nbsp;# For non-root user</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
+ &nbsp; &nbsp;install -d ${D}/etc/skel</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
+ &nbsp;&nbsp;&nbsp;touch ${D}/etc/skel/.vimrc</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
+</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
&nbsp;}</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
Is this method OK?</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"margin-left:0px; font-family:Aptos=
,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font-=
size:12pt; color:rgb(0,0,0)">
Zheng</div>
<div class=3D"x_elementToProof" style=3D"margin-left:40px; font-family:Apto=
s,Aptos_EmbeddedFont,Aptos_MSFontService,Calibri,Helvetica,sans-serif; font=
-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Richard Purdie &lt;=
richard.purdie@linuxfoundation.org&gt;<br>
<b>Sent:</b> Monday, June 1, 2026 1:26<br>
<b>To:</b> Zheng, Ruoqin/=D6=A3 =C8=F4=C7=D5 &lt;zhengrq.fnst@fujitsu.com&g=
t;; openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.op=
enembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][PATCH] vim-tiny: bugfix lack of defaults.vim<=
/font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">On Thu, 2026-05-28 at 10:06 +0800, zhengruoqin v=
ia lists.openembedded.org wrote:<br>
&gt; When vim-tiny was used in image, it lacks defaults.vim file which will=
 cause following error<br>
&gt; root@qemux86-64:~# vi<br>
&gt; E1187: Failed to source defaults.vim<br>
&gt; Press ENTER or type command to continue<br>
&gt; <br>
&gt; So add vim-common as RDEPENDS to provide defaults.vim file to fix this=
 issue.<br>
&gt; <br>
&gt; Signed-off-by: Zheng Ruoqin &lt;zhengrq.fnst@fujitsu.com&gt;<br>
&gt; ---<br>
&gt; &nbsp;meta/recipes-support/vim/vim-tiny_9.2.bb | 2 ++<br>
&gt; &nbsp;1 file changed, 2 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-support/vim/vim-tiny_9.2.bb b/meta/recipes-s=
upport/vim/vim-tiny_9.2.bb<br>
&gt; index e4c26d23f6..b6ddded381 100644<br>
&gt; --- a/meta/recipes-support/vim/vim-tiny_9.2.bb<br>
&gt; +++ b/meta/recipes-support/vim/vim-tiny_9.2.bb<br>
&gt; @@ -8,5 +8,7 @@ do_install() {<br>
&gt; &nbsp;&nbsp;&nbsp;&nbsp; install -D -m 0755 ${S}/src/vim ${D}/${bindir=
}/vim.tiny<br>
&gt; &nbsp;}<br>
&gt; &nbsp;<br>
&gt; +RDEPENDS:${PN} +=3D &quot;vim-common&quot;<br>
&gt; +<br>
&gt; &nbsp;ALTERNATIVE_PRIORITY =3D &quot;90&quot;<br>
&gt; &nbsp;ALTERNATIVE_TARGET =3D &quot;${bindir}/vim.tiny&quot;<br>
<br>
Doesn't adding dependencies like this defeat the point of vim-tiny in the f=
irst place?<br>
<br>
Can we configure that out instead?<br>
<br>
Cheers,<br>
<br>
Richard<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_OSZPR01MB7868A7D33A0E67FBB3E1043B8B122OSZPR01MB7868jpnp_--


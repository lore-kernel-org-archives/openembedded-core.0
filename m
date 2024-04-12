Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA73C4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 20:55:54 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.55])
 by mx.groups.io with SMTP id smtpd.web10.2072.1712955345261320912
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Apr 2024 13:55:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=KhYzCitT;
 spf=pass (domain: siemens.com, ip: 40.107.8.55, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IRZkrhVMMLeIGbMEH2JbfbOzx9sMytf8w2l2TuZh5qnQ73uRRblh/o+ny8naixfoRY4IRAQeAs5xRHA5XgAJiJD8/vpU6MDtcLnsDIJe/TnWfhG0cenPiwaC9G+FCJjcAl63g6jEzH2unLJupNE2Owy+YGhuCH5pt/fqr+c5sSmPyozw42PSUXAboVUNaxkzO+TQr+2RROspKqVM9vfxU07pVk9jIPKS9O0SFOx20ORG+qnmy1ULZLWQ3hMXTrVgQ6UuuUdbfnBt9kMacjwke3dS0Qo2QQ5kblnCgypOcVedSYmn29pCSBVx7lcElHgkt4dOo8vhAQUOvGT5edN+NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjI53u+lZXmaRHRvd5ki0JVINBELxfSOX2PgM0XyliQ=;
 b=dcxuCaFXr5n1W67ZV94qi4V+VNH9KHuIKT8fmY3ss++hH6pthzYZ2taicq7V0ttkMJXfe2j6t9q9HTOKuLWQxgIR5Rpb9Ujo4wRZ9RyHuxMzf31/F5Udc8Rg92ZV0Oklmfydwm4ToimlwmBjuJkVIW+S1oRbVWwcyfWHJdPty9nw3vqi0D/1xKufy6z6s9EfyUwvDNixXfKsVaoXs8W8H37HeqHvWBfOCHa/rrw7QXSUR1r7pxHo5XFVkv32Hz89Qazjwk4IcfuoW16ZZnZV2lisfXSK4N96PMDB+4ER6XExTT0v1fqDRW/LJqNHymZsohLbBjhqNIiWCkOJ/Ne0cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjI53u+lZXmaRHRvd5ki0JVINBELxfSOX2PgM0XyliQ=;
 b=KhYzCitT5ZF1uS1GuFuIET+x860ZkbxVKtCnI4RSd6xrHTH9qYyGNk3D/et4B57z4nrzPAEBdqDhzTrCWl3kRX9XzS5uGhGtM6bUffJUsIOI6njE26T7M1j3mEmWJJ78qcfPFsTuUJurkoMl72VfONzv7wc+kZeoEiw829ZornEK2SMrcuiiUETYGMygdEaJ+DaDGgDwwfqwJrSRmTyajFYg1tMlrWCAm+FJWue1u5LCCmqa0u8UhYbq0Q23zxsGaunVtVEkSqwV2NR3ig8tmpIVuk4bpcDs4jHBNWeUkhl4A713L+kUwdflz8du+eNGIbAN2Ay0oPBeOFW1D7rBAg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by VI1PR10MB7634.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1c4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Fri, 12 Apr
 2024 20:55:41 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fd78:3502:7564:1891]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fd78:3502:7564:1891%4]) with mapi id 15.20.7409.053; Fri, 12 Apr 2024
 20:55:40 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton
	<Ross.Burton@arm.com>, "alex@linutronix.de" <alex@linutronix.de>,
	"joe.slater@windriver.com" <joe.slater@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] systemd: make predictable name mac policy
 opt-out
Thread-Topic: [OE-core][PATCH] systemd: make predictable name mac policy
 opt-out
Thread-Index: AQHaiYMz9L+lb5XHbEKUptuivabAZrFhrToAgAL+uPCAADGKAIAARMeA
Date: Fri, 12 Apr 2024 20:55:40 +0000
Message-ID: 
 <AS1PR10MB56977B9AD8AD9F1B9C1C27CBFD042@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240408070450.27686-1-peter.marko@siemens.com>
	 <DD50CE1C-F584-49BA-845D-ACA0F3B91450@arm.com>
	 <AS1PR10MB5697DE4D22B801842C85891FFD042@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <1561eb66e99857d084e6717172ee9e716cf14d74.camel@linuxfoundation.org>
In-Reply-To: 
 <1561eb66e99857d084e6717172ee9e716cf14d74.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=66936a9b-5d20-45b2-ac6f-d91ba885aee2;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-04-12T20:47:33Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|VI1PR10MB7634:EE_
x-ms-office365-filtering-correlation-id: a06f9c03-d61a-406f-72fe-08dc5b32e96f
x-ld-processed: 38ae3bcd-9579-4fd4-adda-b42e1495d55a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 SN+cd08v9qMSF7jLUnVOq77roLofbFUQgigPvtuzYh1wFfsSzgW9e6f2EV87qLioIruwiJj94dSTx2asjjOId9MzPAaFZF93ojwNpRKT8nuhVV4Ul4pFKthAmvIA0Qt92uxy4KK4mc48YbBsGtdM2C385+wJvJ6vNUv36nzmUqint0j2prfDC4T+Sxrm7G7hV3z+VeiSL6kgJlMkH5CqK7KrA1gs25ra2PLC1G952K9bnJRt6LDo9jRZOPr7sWgggZ/mJoAzm57pcC488DQfOdmfgvTCIvddN4d3y2r8oPQcFu2r0yer7C9Lt5JlwF8k6vToGzG0o0129aWbL4TmfV2HM1F59Od9TgjSKIsaa5uDnMENMKA/hfYB1OelTwXxFvK+mhCxpX14BQN02r3yCMIfUjqec5KKG+8FBENMQq7ShQrTXUFXpykSsPjdyUvTU3FYESr7B4ZjyU9md7VOa9SmlCiwyxp8n2Gh8YTZwl1Uquav7J5C2KF/2cCfaf7EBDW4f1wOpMcCaWl3i3EBjMVk43OKx3M++bddm43a8frcH+4KTHdgPIwT6nsZCeinR2kjQVv5pDMJB6b5M1a3+UUzh82yLEoUbJ4G7wN6+DqcfqOHpBD9Lgc5XOxdBBxGunfwGy17/mz9+niN9JM1eqbclH/yQd2AUzwlBuO5G2BJt1ru3WMPnoRANK/zHvBZrEhWPkQyASbcGRUpHGmN94OJPHuQ6fpmOGiUIZBI8MU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bmdTeUxnS1c1L0RLbGNQN0xWd3llY1hRdkRXL1UrZGFjZ3dmV2JIVnNjVWc4?=
 =?utf-8?B?ZlRVUXcrQ0ZGQ2huVW5ocENCTWpOMG1FNTQwLzNvVWVFSDh3c0U3RzhneTV1?=
 =?utf-8?B?Q0FCTE5STGxOWUxNR0Y0UWdhdktpK2lRMzVDV3QzMXdwdFNaQzJwdG9Qakoz?=
 =?utf-8?B?elJOdmpUYm80VlFTcmRHeEkzTUFWQ25IMnNzZFJTQUU4NU5vVEhoWG1FcjE4?=
 =?utf-8?B?MW8rMTIvYzl5bFE4R3pJUzBQa1NrUHczc205RFExYXZSU3dtSUNRK1Fzbzcr?=
 =?utf-8?B?YVhwMkV6UmEyUGl4QWd4YncvLzRGcnhaWUxlTnMvMHhOUGFwMm5EMG5QWkVi?=
 =?utf-8?B?dmRiRkFqYzV6eVVKMHJmNEZjM2pLS2NSeGJpL1Y4dHd1OVUwVmwweWlVMWRJ?=
 =?utf-8?B?dm45QkVBNnFVY3FYR3plelRWcXN6RmZZNHJjWk53d09WMHBhNzRRZlhSNFYz?=
 =?utf-8?B?R1lwQUdGUGd3UlZ2MC9PaXBjakt6R0c5alNIeTh0ejNsLzdwdTNGSkhZbDhq?=
 =?utf-8?B?UUJPY1c4WWZnL24wMm1VMUNjbUxxK0VsTkZQOFFNSm5CVHkzRHlPYzM0d3NC?=
 =?utf-8?B?ZUt1SWdkcDcrM1I2YkUvU0VIdHl2Y0VKVUQwK3FzZ0szbGpqaSsrUmlPUnha?=
 =?utf-8?B?ZWJZRk5DaXVIQkdDL2VpVXBLV2lKNnF5bmtZU1M4a0dwNE1YNVBMOGloVmNN?=
 =?utf-8?B?RkNtNE80QVFXRTFYWnkxRXdjM0llTHBGSk9rWkZleUFRRk9ZWjlNMkZ0Wmd6?=
 =?utf-8?B?bEs5OVF5c2dIOFhlVmxoblg1eUhsWUgyNGVFRHVkZVhMOHgrb3pUUzQyeVU1?=
 =?utf-8?B?Z25ONWwycWNqeU9GalVmNFlzZ1JaaElham1CZkVkZlhDb0I0NklBaFZVbUpp?=
 =?utf-8?B?NjNEN05mYXZwTGROSmQ1aEh3MGVCR2I4YlpGWEVlN1pDeDdKUU10NEcvRWJD?=
 =?utf-8?B?NlJRR0c2UHRIdGZGVUFWQkJHTzc4VjdmUDhpdUh3Y3YzUWs1anFRTlhPMmli?=
 =?utf-8?B?dDBMTG03bG54Rk81SzZqdnF4QUJwanVOQTc0bFY2bU1Xd0lJb3Z1OUJ3S2VU?=
 =?utf-8?B?Z3FFN21ZU2xlaFRjVENpbW45b2VwVi93N0NZZUt5UnhKWk9PUUVsajRqSUpY?=
 =?utf-8?B?REEyZDM0dGxpbnp6Yk9PN3c0YmVaQUJtUG9UOTZLR2VBZURVOW1zSCs3ck9Z?=
 =?utf-8?B?c2FkdlY2MWlxaU1aLzZMQ2RKM2Vzck1SUCtkT01RZ1RyYVI3S2I0dmNObWp2?=
 =?utf-8?B?SWExVGZiYVllUElML0w4MTNuOWZ2cENubGhPNTZqMWdLSEx5SVZvdTlLSWov?=
 =?utf-8?B?Q1hmUnp0TG1HOWc1ekI4dUJUeHBlUUh5azJOc1NpM0xjMm4yWEI4UUpmdUJQ?=
 =?utf-8?B?QWxOYTBSL1dWVkJRTHM3a1RtOG5LajFLZGN3bStRaDlPbjNvck5FUWlBMnpH?=
 =?utf-8?B?U2NrcXpjaEpxakM3SVZiaWxpM1hZR1pXZGNJMzFzN3o0NFhGUDliTCtsMW8w?=
 =?utf-8?B?RjJ2LzBJYWcvQ0FJdXpkY08xVEQzNmpWN09aS0Q1UDNXeXRNUkIzWTNMdlc2?=
 =?utf-8?B?QUU4bCt0VzhjdTJQVE9YbUs4clh0L0NidXRhM25yd21HQ2pZK3VoZGRramJE?=
 =?utf-8?B?cmtFNVZxR21RTFRRWkVtYmlYYjhUbHN4OUNnbGJibjJ3MmNYZVhoNXlUSEJ2?=
 =?utf-8?B?ZVh1VEVHU2lIV2kxbWtBSGd3Rzc4RWJEMWZkaTRlclNHcERuMXRFc1dtdzVv?=
 =?utf-8?B?cGQ4cXE1VlBOVXB4d2ducGF5c3FMWndVN0hYTXMrd0dHUjlnWmdJRkUrZVB2?=
 =?utf-8?B?Q3ZSRzhLZFM5N0dheWdpRWVVYVovd1EvcGFGZEpuNm1pbFhQUE93bE1aMHF4?=
 =?utf-8?B?cWxXajlrcFhOa0I1NC9JMFBuTlBXOUUwZi9sMmY3aURCSFJqdFliVjY2MjBJ?=
 =?utf-8?B?d1BoeXllemxTZDZCMnkzS3luZlpDQktGZXhNbXVVamhOcmgyWVd5U2IybkxR?=
 =?utf-8?B?LzBQYlo0aWhwbHdyTlNHVll4Y0xIbWxMeGZ2VVNBRFdid21xU0V2Rm1ERHk1?=
 =?utf-8?B?c3daWjlRaWtUamY4M2Y5ZnlEMEVlQUR5eFBpTXRlOVlZR3NqQ0FrKzV5Qzg2?=
 =?utf-8?Q?XNOo0NVDhwg+rt0i452NHfYwy?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a06f9c03-d61a-406f-72fe-08dc5b32e96f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2024 20:55:40.2078
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sPmVME8DJRtLkYoA0eiO5/p79vv2/1E46Y4ZfAKFUJONyvwqwOYRBak+wI2nSR4UnqLTi8oshnr11VdAgZTD8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB7634
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Apr 2024 20:55:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198186

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJk
LnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPiANClNlbnQ6IEZyaWRheSwgQXByaWwgMTIsIDIw
MjQgMTg6NDENClRvOiBNYXJrbywgUGV0ZXIgKEFEViBEIEVVIFNLIEJGUzEpIDxQZXRlci5NYXJr
b0BzaWVtZW5zLmNvbT47IFJvc3MgQnVydG9uIDxSb3NzLkJ1cnRvbkBhcm0uY29tPjsgS2FuYXZp
biwgQWxleGFuZGVyIChFWFQpIChMaW51dHJvbml4IEdtYkgpIDxhbGV4QGxpbnV0cm9uaXguZGU+
OyBqb2Uuc2xhdGVyQHdpbmRyaXZlci5jb20NCkNjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09FLWNvcmVdW1BBVENIXSBzeXN0ZW1kOiBt
YWtlIHByZWRpY3RhYmxlIG5hbWUgbWFjIHBvbGljeSBvcHQtb3V0DQoNCj4gT24gRnJpLCAyMDI0
LTA0LTEyIGF0IDEzOjQ3ICswMDAwLCBNYXJrbywgUGV0ZXIgd3JvdGU6DQo+ID4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gPiBGcm9tOiBSb3NzIEJ1cnRvbiA8Um9zcy5CdXJ0b25AYXJt
LmNvbT4NCj4gPiBTZW50OiBXZWRuZXNkYXksIEFwcmlsIDEwLCAyMDI0IDE4OjAwDQo+ID4gVG86
IE1hcmtvLCBQZXRlciAoQURWIEQgRVUgU0sgQkZTMSkgPFBldGVyLk1hcmtvQHNpZW1lbnMuY29t
Pg0KPiA+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4g
U3ViamVjdDogUmU6IFtPRS1jb3JlXVtQQVRDSF0gc3lzdGVtZDogbWFrZSBwcmVkaWN0YWJsZSBu
YW1lIG1hYyANCj4gPiBwb2xpY3kgb3B0LW91dA0KPiA+IA0KPiA+ID4gT24gOCBBcHIgMjAyNCwg
YXQgMDg6MDQsIFBldGVyIE1hcmtvIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIA0KPiA+ID4g
PHBldGVyLm1hcmtvPXNpZW1lbnMuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqAgJHtAYmIudXRpbHMuY29udGFpbnMoJ1BBQ0tB
R0VDT05GSUcnLCAncHJlZGljdGFibGUtDQo+ID4gPiA+IGlmLW1hYycsICdmaWxlOi8vMDAwMS1O
YW1lUG9saWN5LnBhdGNoJyzCoCcnLCBkKX0gXA0KPiA+ID4gDQo+ID4gPiBUaGVyZeKAmXMgYSBm
ZXcgb3RoZXIgcGxhY2VzIHdoaWNoIHVzZSB0aGUgcG5pLW5hbWVzIERJU1RST19GRUFUVVJFIA0K
PiA+ID4gKHdoaWNoIHByb2JhYmx5IG5lZWRzIHRvIGJlIGRvY3VtZW50ZWQpLCB0aGlzIHNob3Vs
ZCByZXNwZWN0IHRoYXQgSSANCj4gPiA+IGd1ZXNzLg0KPiA+IA0KPiA+IFNlbnQgYSB2MiwgbWF5
YmUgaXQncyBtb3JlIGFjY2VwdGFibGUgYXMgaXQgdXNlcyBkaXN0cm8gZmVhdHVyZSBhbmQgDQo+
ID4gZG9lcyBub3QgY29uZGl0aW9uYWxseSBwYXRjaCB0aGUgc291cmNlcy4NCj4NCj4gRldJVyBJ
IG11Y2ggcHJlZmVyIGl0IHRoYW5rcy4NCj4NCj4gPiBOb3RlIHRoYXQgSSBoYXZlIGFkZGVkIHRo
ZSBwbmktbmFtZXMgY29uZGl0aW9uIG9ubHkgdG8gdGhlIHN5c3RlbWQgDQo+ID4gcGFydC4NCj4g
PiBJZiB0aGlzIGlzIGFjY2VwdGVkLCB0aGUgY29tcG9uZW50cyBmcm9tIHRoZSBvdGhlciA0IHBh
dGNoZXMgc2hvdWxkIA0KPiA+IGZvbGxvdyB0aGlzLg0KPg0KPiBJJ20gc3RydWdnbGluZyB0byBr
ZWVwIHRyYWNrIG9mIGFsbCB0aGUgZGV0YWlscyBidXQgSSB0aGluayB0aGlzIGlzIGFuIGltcHJv
dmVtZW50IHNvIEkndmUgcXVldWVkIGl0Lg0KDQpJIGhhdmUgY2hlY2tlZCBhbmQgSSB0aGluayB3
ZSBzaG91bGQgYmUgZ29vZCBub3cuDQpUaGUgNSBjb21taXRzIGludHJvZHVjaW5nIHRoZSBwbmkg
Y2hhbmdlcyB3ZXJlOg0KLSAiaW5pdC1pZnVwZG93bjogYWRkIHByZWRpY3RhYmxlIGludGVyZmFj
ZSBuYW1lcyIgLSBkb2VzIG5vdCBlbmFibGUgcG5pLCBqdXN0IGhhbmRsZXMgaWYgaXQncyBlbmFi
bGVkDQogICAgLSBmb3VuZCBwcm9ibGVtcyB3ZXJlIGZpeGVkIGJ5ICJpbml0LWlmdXBkb3duOiBt
b2RpZnkgaW50ZXJmYWNlcyBmb3IgYnVzeWJveCIgYW5kICJwYWNrYWdlZ3JvdXAtY29yZS1ib290
OiByZWNvbW1lbmQgaWZ1cGRvd24iDQotICJldWRldjogbW9kaWZ5IHByZWRpY3RhYmxlIG5ldHdv
cmsgaWYgbmFtZSBzZWFyY2giIC0gZG9lcyBub3QgZW5hYmxlIHBtaSwganVzdCBoYW5kbGVzIGlm
IGl0J3MgZW5hYmxlZA0KLSAiZXVkZXY6IGFsbG93IGZvciBwcmVkaWN0YWJsZSBuZXR3b3JrIGlu
dGVyZmFjZSBuYW1lcyIgLSBndWFyZGVkIGJ5IHBuaS1uYW1lcw0KLSAicWVtdWJvb3Q6IHByZWRp
Y3RhYmxlIG5ldHdvcmsgaW50ZXJmYWNlIG5hbWVzIiAtIGd1YXJkZWQgYnkgcG5pLW5hbWVzDQot
ICJzeXN0ZW1kOiBlbmFibGUgbWFjIGJhc2VkIG5hbWVzIGluIE5hbWVQb2xpY3kiIC0gZ3VhcmRl
ZCBieSBwbmktbmFtZXMgbm93IGFmdGVyIG15IGNvbW1pdA0KDQpQZXRlcg0KDQo+IENoZWVycywN
Cj4NCj4gUmljaGFyZA0K


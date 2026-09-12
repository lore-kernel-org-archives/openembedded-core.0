Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 542D4C88E53
	for <webhook@archiver.kernel.org>; Sat, 12 Sep 2026 14:40:13 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7915.1789224008812207696
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2026 07:40:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=YLWLJ7Xc;
 spf=pass (domain: siemens.com, ip: 40.107.162.51, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5KanqbBfSi6jvfyvM+diVaWQTuHoWq5kIsgQgscvdkbHlSdZrDnUdAcc8FZ51RJJ3FCn0SFBHWZE4qMhFXXL+INoSnC4qZ5fdI4rc1ymSqxBD7wTj4akCpg/Lgg+7/B4nG5rAUNDLzSSuAcMzwppnJ/yMYT6YofhkrqJJ7z8YAZ/Q3fh8a2Or3kzA6APVh0+V60JTG+RrDG25DbO48gwmF8mrrKyMIFALuZlGWwCM1ooLcF5vS5XSzXxHxUZ2daOqaz85VADDz9Q/bwNtFTHC4RVylbX0vlrN1ZwiH+KyxfuvOS9Rx5zekIrtuCpKo5kkHkT5/OT00O5nUOma1luA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xVvXbddNoGxGQho5og88Ximrdf7UdvfsdSdkobXI76c=;
 b=AMkH4xHUSAkZGIj9lKmyg9uPLfoCvXs330uJIb2TUT8da+F18I4yi1RUme3S/PY9XpGmsqTTQQnwnk8tcpdxsoqXBq0IR4cFDnhIuW3ejlZZTIQGKvw35FYpblNG9FxDCnROI/pw+Ri2L15a4hs1V5RuZuLdWQfihdk/u3ORKD1d5J/rgpJQeL5xoXt/g6EExekbtQZ3wqgq8xYXfIljSknoAg+L90LdaIGF/OGtN1I63Zjsq5E6Hrnlng13Ds6xP7hkicGVNt25Vyy17YNRieEOsV7dueDoiBpb2J4Dexj55IiQJ+7JBa1nbCmrvHPhWtiypclK650VztctYwbjqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xVvXbddNoGxGQho5og88Ximrdf7UdvfsdSdkobXI76c=;
 b=YLWLJ7Xc9oU8Hmqm1P5JJ+ODJs0WBUfThndHDnKWM+3cEArQCRJu+aCgtuacWSjDt0HwVgrLu66dXEikf/mfvM4D5nmBZ8CgOZiKR5GT7h9kjOmVFstQfH6Y60N7oszi1Kbhny00wo5lWDgyyUMR13RJI/ana3J167GMlV1pIZADvu0j1fjVkF/NwdL1IekTBfutK4l7iW/tr0/s+Rn6SBfCQrA7N+iUKEEjyVE2Cz2pjVzfrsKceIJuC5myW8vV2w/5ee9OQze89nYDYJwO0AsHm6KPE3VVXw5HTnp4+UrEvaRUeNxs6wb+OaRYjXZUunnR2YqoWxr650e8GunBhw==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by PA1PR10MB8972.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:448::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Sat, 12 Sep
 2026 14:40:04 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%4]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 14:40:04 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Paul Barker <paul@pbarker.dev>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Yoann Congal
	<yoann.congal@smile.fr>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>, Benjamin Robin
	<benjamin.robin@bootlin.com>, Yoann Congal <yoann.congal@smile.fr>, Ross
 Burton <ross.burton@arm.com>
Subject: RE: [wrynose][RFC PATCH 00/11] sbom-cve-check update
Thread-Topic: [wrynose][RFC PATCH 00/11] sbom-cve-check update
Thread-Index: AQHdJyP2NiWRtkyEXEePwSaqro3ccbab5HCAgC9WB9A=
Date: Sat, 12 Sep 2026 14:40:04 +0000
Message-ID: 
 <AS8PR10MB50733F9D2630FC2F6FD62694FDBD2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20260808105147.42294-1-peter.marko@siemens.com>
 <2edd57716d5a827ffe58d9001323098a045be7a6.camel@pbarker.dev>
In-Reply-To: <2edd57716d5a827ffe58d9001323098a045be7a6.camel@pbarker.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=f6adbef1-00ed-4d49-9a4e-4879990fe3b8;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-09-12T14:38:27Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|PA1PR10MB8972:EE_
x-ms-office365-filtering-correlation-id: cf9d314f-60e6-48c3-545c-08df10dbbbff
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10067099003|4143699003|22082099003|18002099003|55112099003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info: 
 jOZvHjWxzv377f+ZKHeM73YPadteBA2kDXmytQZci8mwAZvjdYm59U2KcB4xTEVTrrb93KYhl0Syy3UaLWxK4815xnQcswVJeEZ+h9tsOBw7/kIBcTWn3iqOdyA+9E1E3zFngtgQe3nr1chDLjBtBt3Ox/UifEt5F2o9oDGsqO0y2e2DTlf1epb1mAma+113RGRjdeK1xff79jQfAEG5LbNz+dgMN8UNbupQKcFpU3CDvZzvyFx6vQ+QrkllD4RGlO37oVsNLD1NRLLZHLXYJBQ4LDTyYKSbPoRIanGfENWT+MJCIPc42sDExJq1+FGgA+VJicnhqcIWVFLgupBSr3KEIaC395nph9uyqQ8aMXnX3Ye3kr3nrqTIymvkYMiRMz1O6J0NFMoFrn7n3C0YTo/BEPSzNvJAT6+1hz+EuP3C8s/vjSyPIfBrOBphpsTVoPv9Ndo2sRXR7cL1ekYg4Or7MWHZth3g/eBCPbyLRkw0VyWbf7B/26mFi/Dx5l5DJqXZ+tgN0mMZqv9imBCPA/SD4N+VliOwwu1cod8TlHtIWIAUfmsS/dxDDl7XP4h0Oy60qDxv6S1oSx5xz5BCrWskjVx+0nTV39FD0bB/1nYe7GMIPvuLtsZ+8mQoX1mBGSBqaDieT2rh45lpFFqAW9WArp0n0ElHLzBs22JTy5NPU0/EkXNPWPUUcd1OyDj+z8HbC25KWdfkVOdGwMBlesO0IMAYOlMOUKRBV951QjM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10067099003)(4143699003)(22082099003)(18002099003)(55112099003)(56012099006)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZGRNQkdFdThMQk5tNVVhMTZNM2ZabENQOURTTlAycklZN2ljS1kvQkl0YmRN?=
 =?utf-8?B?Y2dUL2V0dkpSa2xEVEkrU2hwdnY5UncyK3dqZFdrVDJtYkFFTC9kK1dmNlpM?=
 =?utf-8?B?enNDQmJON0pFazFmbmxYa0U4RjVYWVk1OVpHcm9TeWo1RFVpR2RpelExUkRT?=
 =?utf-8?B?M3BpTnYra3QwR01USjBrM1h1MFJqcFA0U2lKaFRHcU9zeEowcnBFd3RncTlj?=
 =?utf-8?B?aGhvcm14UGg1VUo0ZUNVeEJXdWUxQXg3UEdISXpZV0dMSWx5Zm1talYzRXB5?=
 =?utf-8?B?SWpja201MUdodzVrRHdHeEVPNnI5ekRFbVRHcWs1V1ZMZ25vbS8rRDlvUjd6?=
 =?utf-8?B?eHMvWDBPU2VKakRmdjdXUnF3SGw4UVlBZzIybU45cWNKM2tqdlpMRUVwOHlC?=
 =?utf-8?B?aFB2cU55RSt1TGxGNG9aOEFlQ3JNT084K2JRQS8zSVZ2Y3RKeXNVaVdBVDhV?=
 =?utf-8?B?ZVNidHBUeE9BMUFYajlPMFdSamVoZmRRUjZCSWwxL2UrNkhlNnIvK3lacU9D?=
 =?utf-8?B?ZmQ5eWhJdVMyR256dm1Bbkx6ajhpcUpoV01BK0VoWUdPNWg5eWVjK3Zmb1NI?=
 =?utf-8?B?NGtsQ09pbG5wS25TcFl1T1RLQzRSZkZEOXhPSXc5WmtBaW1QbzJGNk1XR09I?=
 =?utf-8?B?MUZaanAvMUdzcTNZc015bEhtcFhMSTFxeSt6eERQQTRmbXB6QnkvVjNSNXp3?=
 =?utf-8?B?NUpYUHJUaGtCUEc5S09jZThWaGRUUGs5bkdIeDJlZDdIZDkzajNONmtnTTdI?=
 =?utf-8?B?RzFzbDJSc2VBaUR5YnFDcEU1M2IrcG1CUUExZjAvR1laZkg5M2VoeFpDekdz?=
 =?utf-8?B?QzEwMTE3QUxuQTUveWRrb0VZYU9HSzVyMDdMQ2gvRGhaaE5PR0hOdWRWd1k2?=
 =?utf-8?B?RkE2OWZJOXdHR2I3MVBnU1RrWDcyNVVmMnZPdUFYbzdjdXFwaXlPWE8xWTRM?=
 =?utf-8?B?eWtjNHJjT2xKNk5kbitjZWhmZFpOOTd4LzU3TjBxdSsrNEt1cGkxMzhzRGFT?=
 =?utf-8?B?NVhyN3F2c3RXUEhYelJsdDlBWnA2amcrbURxNktxamh1WCthT3BmeWFnRzQ3?=
 =?utf-8?B?bjRvWFhCYWJnRTNoWGpTbGxrNXQ0TjJSaU8vbzVnRFBVU2R5UlU3dFRjZHpt?=
 =?utf-8?B?RitYT3NTb0k1M09yT041MHVSaWgyVUM4bG1iUklLdWxKSmlGb25qUWRvc2pB?=
 =?utf-8?B?WFR1bVhsUkFHWWpweDNMcEprSFBXNTFNdVB4eTRvbWpNdE41MWNrZVRwVWdj?=
 =?utf-8?B?YThNeGVrazVxdGpNcTMwYnFoTnVXcDVlWDhqOTJQanMzN0tGNDVlbG5UbFBy?=
 =?utf-8?B?YWl2c0F4d1FtM0tFb1B2QVVJYU9pdWJJWFVyYlFwSFRjdlhUSFlvSkpZOXkx?=
 =?utf-8?B?TkdaNDk0SGdEbUt6KzhXUGpsSEcxSk1LRGs2ZjVpbVdtNGpydmxzT1BtK2pz?=
 =?utf-8?B?THYzTmZtYXRTc3pQVWZkNWRaR3JIazgrTFE4NklYVUp2V29zOFBvWGhielZO?=
 =?utf-8?B?T2pEbUJtQVFHcmt1UEVxeFJBeWdURHVyaHF4dzIrVjZwZGN4OFlDTVo4QUIv?=
 =?utf-8?B?U3ZXUFNUbU5MY0NxMWRSSFF6MUJ4RGFMREQvTGhjZ1FIODFGL3ltbmxQL3VX?=
 =?utf-8?B?UHZYMTVvZlp3WFBuQ2dSZFBmVXRXNlhibklXQWc1VnIxUmNvTG42SDFwT1lE?=
 =?utf-8?B?bHBYYlRYVm4yci91MUVjZ0V6c1BsMEVXeE0zZStIY2Ercy9kUzE4aVg3RmVi?=
 =?utf-8?B?MGU1cTUxZ0JJSzAxVWRzSm1QdDY3d1h3MlE3Z1h4eUorQklYWnk2NEVxWGlU?=
 =?utf-8?B?Ky9mSUFSMTlrbE9iakJhZ2RoODF6bmdmZFVnYmw3Z0xtU2dpMTFZYzZna2JD?=
 =?utf-8?B?SFZPYUVDUmRkbFRxbWRJeHpHMzYyUWJBS1U3NHkyeVlWWXowWUVDY2pON05Q?=
 =?utf-8?B?QkxPWjVUMDM2YjJvWEg5UndvOUVBemZFdFhXTFppQVFYbjlldWh1dWg2YXhy?=
 =?utf-8?B?Tm5NRW4zMFlsWUE5MHJUMURKWUx2SXFsNEJPbkhyLzA4bHg4alc4anlBbzFM?=
 =?utf-8?B?UGNiZTJWT1lNQ3lIS0hMTmxZTVBKK1QzdFN0UTkwMGxZSDlLcEdGMERZOEQw?=
 =?utf-8?B?UVgvSVVEV1d4UUNSTVBUdUp0aE5FWXJuZDZUTlZvd2dkRExINUpQS3pyVGxu?=
 =?utf-8?B?aGVMWFlabld2MENvQldVeTcyRlp1ck1pZE13N3VhNnRwZUs2ak4reGtqTTUx?=
 =?utf-8?B?V0RvNklVU05nRk5rdFpzZFhVczYzN1RYdHE5THB2TG9OS3l1eko2YXNOU2FG?=
 =?utf-8?B?dWgyS2w1eXFOMi8vaEVDd3N6cjN2N3dqM3dBQnlkdmFwaDlkbndZZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cf9d314f-60e6-48c3-545c-08df10dbbbff
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2026 14:40:04.7265
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T8OMI+68udjIX2908CU67RK8lUg6HdZ0BTkor0YAd9Ortij5RcnZV3SSPxCbflpvNEEYGXJVubf8bgvt3ofQVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8972
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2026 14:40:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245704

SGVsbG8gUGF1bCwNCg0KU2luY2UgdGhpcyB3YXMgYWNjZXB0ZWQgd2l0aGluIFRTQywgY2FuIHRo
aXMgYmUgcGlja2VkIHRvIHdyeW5vc2Ugbm93Pw0KT3IgZG8gSSBoYXZlIHRvIHJlc2VuZCB0aGlz
IHNlcmllcyB3aXRob3V0IFJGQyBwcmVmaXg/DQoNClRoYW5rcywNCiAgUGV0ZXINCg0KPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBQYXVsIEJhcmtlciA8cGF1bEBwYmFya2Vy
LmRldj4NCj4gU2VudDogVGh1cnNkYXksIEF1Z3VzdCAxMywgMjAyNiAxOjQ2IFBNDQo+IFRvOiBN
YXJrbywgUGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkgPFBldGVyLk1hcmtvQHNpZW1lbnMuY29tPjsN
Cj4gb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBDYzogUmljaGFy
ZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+OyBCZW5qYW1pbiBS
b2Jpbg0KPiA8YmVuamFtaW4ucm9iaW5AYm9vdGxpbi5jb20+OyBZb2FubiBDb25nYWwgPHlvYW5u
LmNvbmdhbEBzbWlsZS5mcj47IFJvc3MNCj4gQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPg0K
PiBTdWJqZWN0OiBSZTogW3dyeW5vc2VdW1JGQyBQQVRDSCAwMC8xMV0gc2JvbS1jdmUtY2hlY2sg
dXBkYXRlDQo+IA0KPiBPbiBTYXQsIDIwMjYtMDgtMDggYXQgMTI6NTEgKzAyMDAsIFBldGVyIE1h
cmtvIHdyb3RlOg0KPiA+IFRoaXMgc2VyaWVzIHVwZGF0ZXMgc2JvbS1jdmUtY2hlY2sgdG9vbGlu
ZyBpbiB3cnlub3NlIHRvIGN1cnJlbnQgbWFzdGVyLg0KPiA+IFVuZm9ydHVuYXRlbHkgaXQgc2hv
d3MgdGhhdCBoYXZpbmcgY3ZlLWNoZWNrIHRvb2xpbmcgaW4gdXBzdHJlYW0NCj4gPiBjb21wb25l
bnRzIHZpb2xhdGVzIExUUyBwYXRjaCBhY2NlcHRhbmNlIHBvbGljaWVzLg0KPiA+DQo+ID4gSW4g
dGhpcyBjYXNlIHRoZSBtb3N0IHZpc2libGUgaXMgcHl0aG9uMy1zaGFjbDJjb2RlICgxLjAuMSAt
PiAxLjEuMCksDQo+ID4gYnV0IGFsc28gc2JvbS1jdmUtY2hlY2stdXBkYXRlLW52ZC1uYXRpdmUg
aW50cm9kdWNlcyBuZXcgZmVhdHVyZXMNCj4gPiAod2hpY2ggaXMgYWN0dWFsbHkgdGhlIHJlYXNv
biB3aHkgdGhpcyB1cGdyYWRlIGlzIHdhbnRlZCkuDQo+ID4gRm9yIG5vdyB0aGlzIHNob3VsZCBu
b3QgYmUgYSBiaWcgaXNzdWUgYXMgYWxsIHRoZSBkZXBlbmRlbmNpZXMgYXJlIHZlcnkNCj4gPiBu
ZXcgYW5kIHVzZWQgZXhjbHVzaXZlbHkgaW4gY3ZlLWNoZWNrLCBob3dldmVyIGJ5IHRpbWUgdGhl
eSBtYXkgYmUgdXNlZA0KPiA+IGluIG90aGVyIHJlY2lwZXMgb3IgdG9vbGluZywgdG9vLg0KPiA+
DQo+ID4gU28gSSBhbSBzZW5kaW5nIHRoaXMgc2VyaWVzIGFzIFJGQyB0byBkaXNjdXNzIGZ1dHVy
ZSBvZiBDVkUgY2hlY2tpbmcgb24NCj4gPiBMVFMgYnJhbmNoZXMuDQo+ID4gKiBzaG91bGQgd2Ug
Z28gd2l0aCB0aGlzIHNlcmllcyBhcyBpcyAocG9zc2libHkgdXBkYXRpbmcgcG9saWN5IHRleHQp
Pw0KPiA+ICogb3IgYXJlIHdlIHN0dWNrIHdpdGggb2xkIGNvZGUgZm9yIG5leHQgMy41IHllYXJz
Pw0KPiA+ICogb3Igc2VwYXJhdGUgdGhlIHRvb2xpbmcgdG8gbWV0YS1zYm9tLWN2ZS1jaGVjayB3
aGljaCB3b3VsZCBvbmx5IGhhdmUNCj4gPiAgIG1hc3RlciBicmFuY2ggdG8gc2VydmljZSBhbGwg
Y3VycmVudGx5IHN1cHBvcnRlZCByZWxlYXNlcz8NCj4gPiAqIG9yIGNyZWF0ZSBtaXhpbnMgbGF5
ZXIgKHRvIGJlIGFsc28gdXNlZCBieSBBQiBjdmUtbWV0cmljcyBqb2JzKT8NCj4gPiAqIG9yIGFy
ZSB0aGVyZSBzb21lIG90aGVyIHN1Z2dlc3Rpb25zIGhvdyB0byByZXdvcmsgdGhpcyBzZXJpZXM/
DQo+ID4NCj4gPiBNeSBwcmVmZXJlbmNlIHdvdWxkIGJlIHRvIGhhdmUgY3ZlLWNoZWNrIGFsaWdu
ZWQgZm9yIGFsbCBzdXBwb3J0ZWQNCj4gPiByZWxlYXNlcyAoZXZlbiBzY2FydGhnYXApLCBzbyBJ
IHdvdWxkIHdlbGNvbWUgb3BpbmlvbnMgYW5kIGRpc2N1c3Npb24NCj4gPiBvbiB0aGlzIHRvcGlj
Lg0KPiA+DQo+ID4gQ2M6IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5k
YXRpb24ub3JnPg0KPiA+IENjOiBCZW5qYW1pbiBSb2JpbiA8YmVuamFtaW4ucm9iaW5AYm9vdGxp
bi5jb20+DQo+ID4gQ2M6IFlvYW5uIENvbmdhbCA8eW9hbm4uY29uZ2FsQHNtaWxlLmZyPg0KPiA+
IENjOiBQYXVsIEJhcmtlciA8cGF1bEBwYmFya2VyLmRldj4NCj4gPiBDYzogUm9zcyBCdXJ0b24g
PHJvc3MuYnVydG9uQGFybS5jb20+DQo+IA0KPiBIaSBQZXRlciwNCj4gDQo+IFRoZSBUU0MgaGFz
IGRpc2N1c3NlZCB0aGlzIHNlcmllcyBhbmQgaXMgaGFwcHkgZm9yIHNib20tY3ZlLWNoZWNrIHRv
IGJlDQo+IHVwZGF0ZWQgb24gd3J5bm9zZS4gSXQncyBpbiBsaW5lIHdpdGggdGhlIGV4cGVjdGF0
aW9ucyB3ZSBoYWQgd2hlbg0KPiB3cnlub3NlIHdhcyByZWxlYXNlZCwgYW5kIHRoZSB1cHN0cmVh
bSBtYWludGFpbmVyIGlzIGludm9sdmVkLg0KPiANCj4gRm9yIHNjYXJ0aGdhcCBpdCdzIGEgZGlm
ZmVyZW50IHF1ZXN0aW9uLiBUaGF0IHN0aWxsIGhhcyB0aGUNCj4gY3ZlLWNoZWNrLmJiY2xhc3Mg
aW1wbGVtZW50YXRpb24gaW5zdGVhZCBvZiBzYm9tLWN2ZS1jaGVjaywgdGhpcyB3b3VsZA0KPiBi
ZSB3aG9sZSBuZXcgZnJhbWV3b3JrIHJhdGhlciB0aGFuIGEgc2V0IG9mIHVwZGF0ZXMuIEkgd29u
ZGVyIGlmIHRoaXMNCj4gY2FuIGJlIGhhbmRsZWQgdmlhIGFuIExUUyBtaXhpbiBsYXllciBpbnN0
ZWFkIG9mIGEgYmFja3BvcnQgaW4gT0UtY29yZT8NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gDQo+
IC0tDQo+IFBhdWwgQmFya2VyDQoNCg==


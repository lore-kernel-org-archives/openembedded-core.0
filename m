Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B981C624D6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 14:32:49 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14393.1788359566792582300
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 07:32:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=I+s051bt;
 spf=pass (domain: ericsson.com, ip: 40.107.159.44, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=igf4iCYtZJKgZpJp4gZ+KOKcINxPzVT2OzUO6Z0jW6JvoGfHZj1s8vI/Dd0eDBqq70hWap9D+T52cxtC9EVNoEIeXp2DIOm17I8vxW0ZOuBF/mJkQCcatZPrLGuAZiDubccsqlIeNunFw11ovbEyGA+5nNWBD1S+Yr4+AjQuGKiehLxdPFJ173Y9XJTKzQfkQHy+PS1q7ua4/i2GLqMPBS3ciuTEYpO1982HMO36TEQ9kwXRvnAFJCXfnvHlqRviLxT38j7cDesuOBN1c6e7BegP8MdcxqvyqqEMk1L4hsulZlTLwqYJKwf2sVvNe/9EBWj0M1wiHSJRKMSsiBZxmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=beS6pb+lXAp+QIOPEPdgjTUk9xQDAA2ivDtZaSd2vWg=;
 b=bdts79PFBIB+Lg4a+6dT45/bo9WOx07WOk8+hcvAJZhYbBJ15CLI+01V0cQH79mKN6+djSLu5IeB79i1zinw0XGbTItlj2kC/v30gBUhOwaMNSpkzm0FukffHz7hXHMgtD4+qOv4a/aSpEfL6ffyjwKGXFPCFzpa8xH8PSF0fPD+ytC60Oqdph9gAGMU925WMD/4ltWJpE3R3mgCiaE7VfBorfLuFiCYTGfFyBSDBXmowJjoWN8fOAuH8a1mYMSxcX4uqgXtu3rGam8lIQH5vLJhu4Eq4JgVwcdbBvK2uaQrd2DgY/sYXpMJJKUIUOdwtw/hSxaUeTe2SwRVh252LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=beS6pb+lXAp+QIOPEPdgjTUk9xQDAA2ivDtZaSd2vWg=;
 b=I+s051btR4st0ZyoXUUswK55HQflFVeThOe8w/WNAMka5QaLhl8OF4RUImXzhB5utAucsgaGy3KpvEEH1IOHEiLdbCHGf41rCtA20CKWwARVlPNERUkJmHRk4lQEOaQw6eHVkR8pvmgiuZnrTR6W6xPXmSOERFJzksHxRIlpn60UwF+elwYdDHGS0Mvrwpysf0aC/ELYLqbg+XxY8UMsTr+QmIyLhvaK8y6OiMp1ZdK9hoJcTWAbzFUmOZaugd1T4ZzowsGUDey4Rk598f5iiIEa500SpQbqvPWKDPRZCGS5h4korslMR7H2KCVXoIIOw+YPaPEH/rVGokDGoyFnWA==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by GV2PR07MB11743.eurprd07.prod.outlook.com (2603:10a6:150:305::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 14:32:42 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%2]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 14:32:42 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>
CC: "paul@pbarker.dev" <paul@pbarker.dev>
Subject: Re: [OE-core] [wrynose][PATCH] libarchive: mark CVE-2026-14164 as
 not-applicable-platform
Thread-Topic: [OE-core] [wrynose][PATCH] libarchive: mark CVE-2026-14164 as
 not-applicable-platform
Thread-Index: AQHdLjeI7CENn/n4skCyyntUZ0+2uLa7G7sAgABXhQA=
Date: Wed, 2 Sep 2026 14:32:42 +0000
Message-ID: <5a747778c02e7715b9ce17712c71a9658b419bc0.camel@ericsson.com>
References: <20260817105942.2295192-1-daniel.turull@ericsson.com>
	 <DL4PVTP9830X.2T1UL0PBOMPPF@smile.fr>
In-Reply-To: <DL4PVTP9830X.2T1UL0PBOMPPF@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|GV2PR07MB11743:EE_
x-ms-office365-filtering-correlation-id: b2d968c6-74c9-4ec5-962b-08df08ff0c02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|22082099003|18002099003|11063799006|4143699003|56012099006|38070700021;
x-microsoft-antispam-message-info: 
 7xzHXS1AcHtkP8kftuGs6ObA0JCACJw1VreWk5WS/0RNXG3HCOL+PuhoVCNsiAa0hjd50HfUlMUFX9hd+h6zRBPg9hIvN5+XjGVTJcO34N/+QsbgQ6Yg07w6Z5ynLVJ5u7UtDrePIkWJsvNKhvvS1KV4g+8NY8W/mPVwSyebQH2NUWugn1ETbI0vunbA8HipMuoimcN4IP+kw5NA48iKM/CxZuIPj+/YEnxha6VO2qwJ4Cyxo2CdqlaZ/tNClZ77nWBHUDHEi35WEqere6zmMpvRLuRXgsYevAdwsjO1ice/CRmEjuNgsQj1qT9BGZZQJooO2vvPFyowB/OA3IQTM7Qx1EwuV+k3RmRnjD2MW6IEtcbGPtfzPos5LrhkR0hRobS7QjWgi8yna+LtK46jdB/6aPYtLwWUaLbuExbdKLYsuB56H2f+L1PCyt3YEXVaZkahGE4ljk6kv+enJCDiKj80g58b/OTI0b3nPvKAB9OCC6Rhk+/+XMf+L1CaTHe+xE8IxDSdsgcVvYA4hMRCybyflIXxLwk+FhBfpsEmbFx8RSCz1J7Kn5W401mYbFszBKlPPcq23YddDG0GE0ebZ8y9kCY6W+Ob3BpYBe7SJWVZewC44PhYzNdIim5WSElB0Wsa/jTuklKo/zeV8Eb08gnvCkVuTUWJiPwWC72zU3la6sVZW881Zkq1K3er8RIqJtckmffFMxHwbZNJQPEAog==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MTduZXNPMUdKWHlHdGxVSlVhZmRSY1VTM3paejF6ek9iUE9mL0gyQjdaYmpB?=
 =?utf-8?B?TDloSStoRUQzazBsaHUwL3pSRFdRK1g4SFA0WmtXeml2YjU1a3V6aHV5dHdL?=
 =?utf-8?B?UjVKZ3FoRFNNLzZrektTREZTL1hzUE5sZlcrdmtZODZweS9kM2dvaVZTUVdF?=
 =?utf-8?B?dlRsWnRObzZOZEpZTUtzZEZxOUs0NVArMkNRd1pmL0R4Y3NHS1MvMWdPcXp0?=
 =?utf-8?B?QWhxTXpXZTBCY2E2Q01zYnRRZDJTdTR1ZWx3OTlmOFFOSkMwRXdQSXpNeDZn?=
 =?utf-8?B?T1hMeFJmcUZMQklRVVkxa1FvWXc4azZtRkYrdndmVU9wODE3c0VWRm9qMzA5?=
 =?utf-8?B?akp5bUcrUm9yK1pCS2ZpVG01SWlJYWlrcWNzV0ZndkJFWHljclFseHZ0SDFO?=
 =?utf-8?B?K3IxUmJLU09zeFhDd2NKTGpWVlo3dmxaSGlZOHBRMlNZanBqaFpMeVl6eDlT?=
 =?utf-8?B?ZkNJTk4ydE0wQStOZk5mUExUajFNWDk1OGhUMDJkeWJHV3pPOWU5S2I5Y3Jn?=
 =?utf-8?B?dUNwemNHd3ExRGxaQmVqQi9IbWx3Y0o3NWd3TGw0cGgxN09WcXBZSm1iQ2lw?=
 =?utf-8?B?T0xIZDFCaFRub3NxcFdmbGQ0aEVPR3cvY3NOanJmckJwUDVNSHhDbzhJMWNH?=
 =?utf-8?B?eWpLOW00Q1VKaUpMQkR1cFB5dGxtOFZ4akpNOEpFekFHTjM3d0lCZ0lZa01U?=
 =?utf-8?B?MWdLeG9hYndlN1JsMmdodCs0R0tpY0NBc3dLckVLR1ZoQ2JJMW40YWhhOVVj?=
 =?utf-8?B?ZVUrWjF4QURwRU1KcmYvdUp0cGpSQnRvTGRVUEpqUkt5TWc1OFBxSEM5ZGVw?=
 =?utf-8?B?SjNadjlxVUw0c3I2Qm9HS1hZcmdkNzdvdUV5QkVNUC9ha21SZXR1Ykt4b2tv?=
 =?utf-8?B?ZUJURWJXMjdNZ3U5NzVCZWdkbHl1N3poaWNadWJ2R0hMZnZrenJsa0FMWWdK?=
 =?utf-8?B?WjYvdFVUSklEcDNCVFFNWHpWaVhlaHhzVlVCMHpLaVdEZFpTZW5VZ3FpVFg0?=
 =?utf-8?B?blZBcm9iOURtbjdZZjlpZWNmQkFmVnUvSlJzNzBwRDF3RlpxWmY3WmtCR1FO?=
 =?utf-8?B?ZUl3TEI0bWNNMXFOZXA2Y2lIV3JOamgvQmgrNDRYVzdnenkzd3dhaFlIMnNa?=
 =?utf-8?B?ZHlkYXNWVm83U0FlS1FDK2hIOHBYeTExQWxhUzdTNjZ5c2Jma1JCRS85bHVF?=
 =?utf-8?B?RWJqaXVJNlY2VStiSHBBdVZGRU9qV2FrSHpOMHNCeW5yaGpIVkJlRTYwZlJk?=
 =?utf-8?B?YmlnUzJaSzFhbGlObzVOY0tqVmwyVGJnK2c0ckpGWFRnYzhleUh1K0RvZ1Rl?=
 =?utf-8?B?NEJISEJuTHllMEtsZVByTklKV29UOFl5bEk0L3J5UDhGOUJhTVpiMDhVMkZH?=
 =?utf-8?B?MjdzdUo5Z0VUa2x4ZUJhQjhXSEhYMFY5SlNLc2FCeElKQ21vblE4cWIvRWVi?=
 =?utf-8?B?Mk1aamZvdzNKZnZkbUk3MVJNdmlxd2JOTXR2TXVWOHlqUmVFUzFxZVdVd0xN?=
 =?utf-8?B?T252QUZGcUM3R2daTVE2M2VRSTR3T0tRT0t4N1VhQWYyNmp0K3NIMDFnN09X?=
 =?utf-8?B?aUJuU2Rza0lIOUE4OWxlcGticUg2aWZMY1d1OFo5MVhaL0RleGlFelQxM1FK?=
 =?utf-8?B?V0o5V2ZtaWk2MDIycW5GSWNmY1RYSmtNUWVwUnVsblVOU3hJV2s2RVFLNkVn?=
 =?utf-8?B?YUxhSS9mdXV6K0RiRkF3bllUMDVma2g4R0tpakt1amxCM0VJVVVUS1hvbGsz?=
 =?utf-8?B?a252QlZML2RpRXFnTkQ2ZDRBVzUzOXY3Y1Q2cDVtTUFmcDY1VXBDMXoxSkdW?=
 =?utf-8?B?QXp2ZXFtZmdQU3JXKzh2RDRxdHgxVUwrbzhQWkVmdEZVOUQ0cFFybWNTR21E?=
 =?utf-8?B?NFB1c3ZjWlVmeXVXL3BIcTVjT1JWZ3pQUG5EU1hkSjhWOUc5L2s4bkNDVW9F?=
 =?utf-8?B?KzRraGY1NW9YaEszOHJTc05objRHMFZ4WVBuZjc2VUhUNWlLbkduMm5HbnVq?=
 =?utf-8?B?SmJhWTFCV0xZbEs3bGh5WWREUjZqNmROQVJRYXpSczhhRjI0S2tIaUd6Q2lJ?=
 =?utf-8?B?enZvOWNVZ0JoVlBOU3d3QTBrTDNzTU81SEdPT2diTW9NOXRxemV1UzNobkNi?=
 =?utf-8?B?UzVLMHgzTjZrSWV4eXRxRFRzY1JhZGx2UWRuTWsvcFhFMzF5dEk3cWtjdUNQ?=
 =?utf-8?B?MjRTb2ljZW0vUTR0RlliUExHN3lHWWViZW1GR1NJbGpqSUx4WEpialVFeEdq?=
 =?utf-8?B?QUpicGtGQkpNMzYycXNLb2NhNjh3eXJiZllheW0xYmh2UndxSmhZVlV3WnZz?=
 =?utf-8?B?MWNLeHhHdXJ0V0ptSTlzNkQyWFBBTkV3aGdpYjIwVnRNYXZCV1Z1UFZ0TldR?=
 =?utf-8?Q?qub2PSj8wYPDDQsw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <90D72C118A1B974E94BCE78EEA32959A@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d968c6-74c9-4ec5-962b-08df08ff0c02
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2026 14:32:42.0969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AbCvLy5LZsX9oS9Rl6qYZ4UmI41GL4y3TffiVYFw0ObRDgTYtuZbZmWb0WKtZDuN8H+bXyUoGR6ZBy3xB9iLCLJQ7mlQDBsqpjHaCQjq5/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR07MB11743
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 14:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244965

T24gV2VkLCAyMDI2LTA5LTAyIGF0IDExOjE4ICswMjAwLCBZb2FubiBDb25nYWwgd3JvdGU6DQo+
IE9uIE1vbiBBdWcgMTcsIDIwMjYgYXQgMTI6NTkgUE0gQ0VTVCwgRGFuaWVsIFR1cnVsbCB2aWEg
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiBGcm9tOiBEYW5pZWwgVHVydWxsIDxk
YW5pZWwudHVydWxsQGVyaWNzc29uLmNvbT4NCj4gPiANCj4gPiAtIFRoZSBSQVI1IGRvdWJsZS1m
cmVlIGluIGluaXRfdW5wYWNrKCkgaXMgYSByZWdyZXNzaW9uIGludHJvZHVjZWQNCj4gPiDCoCB1
cHN0cmVhbSBieSBjb21taXQgNjIwYmRhZmEgb24gMjAyNi0wNS0xNiBhbmQgZXhpc3RlZCBvbmx5
DQo+ID4gwqAgb24gdGhlIGdpdCBtYXN0ZXIgYnJhbmNoIHVudGlsIGl0IHdhcyBmaXhlZCBieSBQ
UiAjMzA3MSAoY29tbWl0DQo+ID4gwqAgMWM5MTRjZGYpIG9uIDIwMjYtMDUtMjQuIEl0IHdhcyBu
ZXZlciBwYXJ0IG9mIGFuIHVwc3RyZWFtIHJlbGVhc2UuDQo+ID4gLSBUaGUgdXBzdHJlYW0gcmVs
ZWFzZSB0YXJiYWxscyAoMy42LngvMy43LngvMy44LjYpIHVzZSB0aGUgb2xkZXINCj4gPiDCoCBp
bml0X3VucGFjaygpIHdpdGggdW5jaGVja2VkIGNhbGxvYyBhbmQgbm8gZWFybHktcmV0dXJuIHBh
dGgsIHNvIHRoZQ0KPiA+IMKgIGZyZWVkIHdpbmRvd19idWYvZmlsdGVyZWRfYnVmIHBvaW50ZXJz
IGFyZSBuZXZlciBsZWZ0IGRhbmdsaW5nIGFuZCB0aGUNCj4gPiDCoCBkb3VibGUtZnJlZSBjYW5u
b3Qgb2NjdXIuDQo+ID4gDQo+ID4gUmVmZXJlbmNlczoNCj4gPiDCoCANCj4gPiANCj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBEYW5pZWwgVHVydWxsIDxkYW5pZWwudHVydWxsQGVyaWNzc29uLmNvbT4NCj4g
PiAtLS0NCj4gPiDCoG1ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2xpYmFyY2hpdmVf
My44LjcuYmIgfCA0ICsrKysNCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykN
Cj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xpYmFyY2hpdmUv
bGliYXJjaGl2ZV8zLjguNy5iYiBiL21ldGEvcmVjaXBlcy0NCj4gPiBleHRlbmRlZC9saWJhcmNo
aXZlL2xpYmFyY2hpdmVfMy44LjcuYmINCj4gPiBpbmRleCBlOGMzYTNiZmUzLi4wOTI2YWNkOGY5
IDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9saWJhcmNoaXZlL2xpYmFy
Y2hpdmVfMy44LjcuYmINCj4gPiArKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGliYXJjaGl2
ZS9saWJhcmNoaXZlXzMuOC43LmJiDQo+ID4gQEAgLTkyLDMgKzkyLDcgQEAgUkRFUEVORFM6JHtQ
Tn0tcHRlc3QgKz0gImJzZHRhciBic2RjcGlvIg0KPiA+IMKgQ1ZFX1NUQVRVU1tDVkUtMjAyNi00
NDI2XSA9ICJmaXhlZC12ZXJzaW9uOiBmaXhlZCBzaW5jZSAzLjguNyINCj4gPiDCoENWRV9TVEFU
VVNbQ1ZFLTIwMjYtNTEyMV0gPSAiZml4ZWQtdmVyc2lvbjogZml4ZWQgc2luY2UgMy44LjciDQo+
ID4gwqBDVkVfU1RBVFVTW0NWRS0yMDI2LTU3NDVdID0gImZpeGVkLXZlcnNpb246IGZpeGVkIHNp
bmNlIDMuOC42Ig0KPiA+ICtDVkVfU1RBVFVTW0NWRS0yMDI2LTE0MTY0XSA9ICJub3QtYXBwbGlj
YWJsZS1wbGF0Zm9ybTogRG91YmxlLWZyZWUgcmVncmVzc2lvbiBpbiB0aGUgUkFSNVwNCj4gPiAr
IHJlYWRlcidzIGluaXRfdW5wYWNrKCkgd2FzIGludHJvZHVjZWQgdXBzdHJlYW0gYnkgY29tbWl0
IDYyMGJkYWZhICgyMDI2LTA1LTE2KSBhbmQgZXhpc3RlZFwNCj4gPiArIG9ubHkgb24gdGhlIGdp
dCBtYXN0ZXIgYnJhbmNoIHVudGlsIHRoZSBmaXggaW4gUFIgIzMwNzEgKGNvbW1pdCAxYzkxNGNk
ZiwgMjAyNi0wNS0yNCkuIEl0IHdhc1wNCj4gPiArIG5ldmVyIHBhcnQgb2YgYW4gdXBzdHJlYW0g
cmVsZWFzZSB0YXJiYWxsLiINCj4gDQo+IEhlbGxvLA0KPiANCj4gSSBkb24ndCB0aGluayBub3Qt
YXBwbGljYWJsZS1wbGF0Zm9ybSBpcyB0aGUgcmlnaHQgZmxhZyBmb3IgdGhpcw0KPiBDVkVfU1RB
VFVTLiBTZWUgY3ZlLWNoZWNrLW1hcC5jb25mWzBdOg0KPiA+IFtub3QtYXBwbGljYWJsZS1wbGF0
Zm9ybV0gdXNlIHdoZW4gdnVsbmVyYWJpbGl0eSBhZmZlY3RzIG90aGVyIHBsYXRmb3JtIChlLmcu
IFdpbmRvd3Mgb3IgRGViaWFuKQ0KPiANCj4gSG93IGFib3V0ICJmaXhlZC12ZXJzaW9uIj8NCg0K
U3VyZS4gSSdsbCBzZW5kIGEgdjIgd2l0aCBpdC4gYWxzbyBmb3Igc2NhcnRoZ2FwDQoNCkRhbmll
bA0K


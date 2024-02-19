Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21BFCC48BC3
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 14:56:52 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.65])
 by mx.groups.io with SMTP id smtpd.web11.43224.1708354603740678430
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Feb 2024 06:56:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=AgGfJXyS;
 spf=pass (domain: axis.com, ip: 40.107.6.65, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=agH8NCksNoh9f8xxHtFjPwfw52cMmdrSAhVTHX8VE0aVlelaLKiGD4YUo6IcXMTVcZrtqfj5aUN8ECdck5X0lWuNw1reSIGepe2q6Fj5UwOzSdWp73RrO33LLvhygDmwLHgavjZgJW295jewDe00YSmJcQldkofqHJvpMVOChoIdnVyAMfcwsWdIlkMPDv4sgh6pHDWY0Xcm1SKSYn1fd92wp0hu+UXapsTknq9BwEOH87koxeVb8bSbAglamWaGUu5tXqCsfgxJnvQHQQniyOQZSn81OmUbBikOaJuraVeaAXAOSEaxlb2FxJxy/G6nYJyl9dHxA5kqKXiSN0UcKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIrE4bKRPW4WZsHtiZd4bw8NRMIxpbEpd4jVw/+2u80=;
 b=jM1giF8RrhcF7BLA8MEQJJbE+ssJ7y4rS69fdtMoRdsoNTvAfc3c7yGH5Ar+KiHvTKBpdzFhKdS+W5czTgV4EbLUa7tZK2aCnRXmXcjKH2+HrZZ7HDskGVFTiDPvxAsBNsGZx45KGN9RVUjlwBjsXsjIgs/HsYo3J+7ICeD8OVlNZR4Rc5CsCxjAmysVUd6hTp6zvhO0aaOpD4eOzmLGwrCwbFatsK5bHsoNMh3m/KV9tk9UrQFAkCCn5j8pxesyCruFBlIXUWQWGulHTRhXzIQj7upNJSIssG8rzvwb5naJG245VWHPFRx2syRW29V3K2R3RY8zG8YaYBanEJE1Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIrE4bKRPW4WZsHtiZd4bw8NRMIxpbEpd4jVw/+2u80=;
 b=AgGfJXySNkXP+tTVWhRFyBThN471zq+UzQJoq5fCIM5TTHqiUk9Cs2bArfIWiRwVwA0iwKsWfkRrRi/ZJPY3Lr98fSNl0CXpzdQubbT8UXAn/nydMsjAMx1S1y1jZkJOqg+7PC92Da+90QGu/gvMmi0r2+7AQ16+ktku6Wt7P9k=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB9PR02MB8023.eurprd02.prod.outlook.com (2603:10a6:10:371::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.31; Mon, 19 Feb
 2024 14:56:40 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::546:7e4f:ddb1:92d7]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::546:7e4f:ddb1:92d7%7]) with mapi id 15.20.7292.033; Mon, 19 Feb 2024
 14:56:40 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCHv2 3/5] devtool: Make use of
 oe.patch.GitApplyTree.commitIgnored()
Thread-Topic: [OE-core] [PATCHv2 3/5] devtool: Make use of
 oe.patch.GitApplyTree.commitIgnored()
Thread-Index: AQHaYzKlKOcUsl3ViU2IFwuAUA8pCrERwCzg
Date: Mon, 19 Feb 2024 14:56:40 +0000
Message-ID: 
 <DB5PR02MB102131ECF6060FC6405427CBDEF512@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240219012832.3090768-1-pkj@axis.com>
 <20240219012832.3090768-3-pkj@axis.com>
 <55B5D690-26D6-4B12-92A1-B753EA66D486@arm.com>
In-Reply-To: <55B5D690-26D6-4B12-92A1-B753EA66D486@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB9PR02MB8023:EE_
x-ms-office365-filtering-correlation-id: 990c1434-56ce-42bd-9e9e-08dc315afb08
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 D8fSFAT0/jTsbS4sbYzjTT5Y7HLkU3xgq7v+QZ2jtAb2K6LOGACmWVlXF/xJ4KnG/ft4DU4xbbTVxpNcpG631uVBpU5l8Ohwh0g2A6e14M5OZTY5YGZlW0lSrvmv5ET2AjfS8X2I0llkOY+DUU85ssqDvmb/uuOPMe3KXx/BaqJoKCR5w59oX2XqzzQ5EJHhgZY7DNlmr+FiQbimVZAHDuZgonaPGRZmagGBjR0u6rCLqG+pzj9wDKGYdYmxzLNQB84V05tUnGEJocGo0iNiEbF19X9jdzSfEudNIB/ufxzy9wjc5yXjPyXSMucClxY7X7kPoxDPJIn3hNwrxgPckWMEnclpqyW3W/27v7na/F6y3EJUdgoyRR8iyHYUMtZM/qjwwkV3LnmtamDFMT3f7BQ71ZeIyACjObsMjcmdEhhObt0FigpxoitEpkzuE/fLxh3rZj9k0lbVVU7OCbMV4ivqhOUpnZoggN9U6ZykLSePvuV+UJk+QgyyklEyDpipVpLJQXPetmfZvrgHWM+s4rOUYUx4TFTNraPGsL+KjIy+CqLNeoquJu+Yb736DvfmhxcNQ8OeedhE4KtPmlg/mloWaQPw7P2K42VGnSx5/HOmsexduIoV9uS2yHj+CBW3
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U0xUdHJITGtNaDhyWUFqbDVuLzRWbDh3bGRjNFFpZ1g2elNyRmRvRy9qc1Fq?=
 =?utf-8?B?bXk4NWpTR0dpSlZ0MXJHMC93VzY3M1o3ZkhzTDBCa0hmTVd6VjNvWXhyWEtq?=
 =?utf-8?B?alR6VkxxSkdwUDVSQ2R1RklvZUVzNGpBOXhqLzhrK052dW5hVEhDWWF3SEVZ?=
 =?utf-8?B?dU9PaGEzUDRIc3IwbkJvUmdoMjVMZWlZU284N01IRnkzdkFOeTFpTG5qUVpr?=
 =?utf-8?B?bjJtR2o2akRIaWY5c0hkRGJqN2FTVldMa3BRK2RRMDV0RjNNUjgyb2xmTnBT?=
 =?utf-8?B?V0xPdTZxQTFWaEx3bHRhQU9MbnF4TnB5WG9jSEJjOThnNGFGRzgxQWVtR21o?=
 =?utf-8?B?NTJPMXFTeFFZcTFEOEdrM3pLWVc5dkZYZEtrRGxyRC9pRm9HdGFqU1pWZ2JK?=
 =?utf-8?B?SE1ZcXQzMlVOT29IdjJyT0NBenRVaFlWbTkrZjl1OEpDRkxvMEphUEticTlL?=
 =?utf-8?B?WHhqR054QjBEYzlLa3B3ZkdIcU1oTmNha0V4eGcvQ2c5RnI2QytadDAxcjJH?=
 =?utf-8?B?K0lhTkVwNnlCVG1JY04rRXZXWmhxREhFYkVPYXoxc0p3RkdFY0ZId3JueDl5?=
 =?utf-8?B?L2NyOExWUkMrbmRIczNwNmttQnFEOVphS0dTS1BDTHh2djFEQmhJTllvUDdO?=
 =?utf-8?B?SGI3Z1pkazI2SGNaRkYySG1WK25Jdll5Ui80bEQ1SzJZekhCcHFWVURJOUNX?=
 =?utf-8?B?OG5qajFEMk9ONGhxN1NJQjJTZzZlWnM5cUNPOGE0TFBzR0J0eXNGNGdEZW16?=
 =?utf-8?B?QVA0RUhma0RkZVp5U3J3WjdCaTZEKyt1OTI1aXVPMk82WGdTZ1krRktObDZG?=
 =?utf-8?B?SmVWUW9sQ1Q1ZW1rczZwc2VrcHZDNVZiV0lXNjh0ajJBREg1TWFocEhia05y?=
 =?utf-8?B?eENWUHBVVkhGNlluYjdjeWxRZFl6bFQwWk9CYS9yWStjUFNDbUpMVzBCWFdJ?=
 =?utf-8?B?ZGlaU25ONVFKakV0Ung3RXFEVnhraUlPQUY1SGxsZEJtWDd2S3dlZ1VTTmFk?=
 =?utf-8?B?dDV5MTE3em44SVUzK0t0V21jdjd1dWtIMnZnLzJPSWd0N2FWdlBaZmtrNURj?=
 =?utf-8?B?Zmc0VDJXT1VEaEQ1NEpmR1VGOFpkOTVnRm9LVFV5ZWpDQTF5N3JTeUJ0Z0Rr?=
 =?utf-8?B?ZjlYTmdpd0FIR1RWbDhLeDVONkNpdkF1dFFoQ1VLcEtGM21TMFV2U25JY2FK?=
 =?utf-8?B?NzVMbFVHNjRtN2NvL3Q5VzA2eVBvRmxrUVVVYWRuamRFVEtZUmFpTnJadmQw?=
 =?utf-8?B?UEpNQW82NmRYbDFzbUR5SmxLT3RrdDFxdVpXSHJicDRWOVFnc3ZHM2ZWYzhW?=
 =?utf-8?B?MjFuUTh6SlRtS2V4QXZ4bnBTYjViZ1U5bURxVk9yRU1hU1BmOUVyUW9FZjJ1?=
 =?utf-8?B?cWUwWUpBWG1wV3ltaGorQm9Td0oyejRVK05SaDhmNmZXbVk0NVFjeG1NRjVY?=
 =?utf-8?B?ZUNMMG1ZOXM2djByM0tiRVg0T2xvQ3R3UjN6Uk4rWVF3YUJmSlRCaVRuRlJ0?=
 =?utf-8?B?ZjNnaStlQ0F0T3BKK0RnZWs3SHBVUWg5RGlva2tYYWpDS0llQnh0QVBlUmRY?=
 =?utf-8?B?Um9sQmtYQnhnS1Y1Qm43RkxuMTBJakhablR0UUFEaFJkQWVMdnhkdmxYbjR0?=
 =?utf-8?B?UWh0clRRS3hLWGxuQVlWMUU3cnh3TDdoRWMvS0E3dzVIVkh6RmVucE03bExa?=
 =?utf-8?B?N3R0S1haOCtSczVrVDZZN0pVdXdhQ1pURldIOFpFMUYyR2dvMGc2NG92em5J?=
 =?utf-8?B?Z1JLbUxSdlVGVWcxdFY5NmtIck9UWStzTFBPcWhxYmVVMEVsZUdSZFh2ZXlx?=
 =?utf-8?B?RlpZdHVnY09nSWlxN0I5ZWNCV2ZGNTluMWVadmIrZEdXdURhcHVRVEtiN2pP?=
 =?utf-8?B?ZTRPZGtoY1RxVFNYd0xqQkV2WmY0dUtUY0hBSWxQaEVWSElLWVRMOTk5b1JS?=
 =?utf-8?B?cGRmYXpTY09oRDFBaXBFMHhaeWxHYk9WTldLZHl3MWl1Ui81TVFrSkdUS1hD?=
 =?utf-8?B?NDhuRlhJeTExelVOWERCWHdwOFRRSjdOcno0VEpONVhCRVNabElvT1RRREdk?=
 =?utf-8?B?ZjFIcVBpY1RYWmNuOXV4cEZlN1pLb1BtNUhieTMrU1A5MVY5YUpWbFJzWDNo?=
 =?utf-8?Q?JPQw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 990c1434-56ce-42bd-9e9e-08dc315afb08
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2024 14:56:40.8092
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 921/VJ6YfJxCaqgl8aL2SVbckj6fJ+WGqavLTp9WVMfXMi7tlxQHPsDhegPEkABF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB8023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Feb 2024 14:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195879

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb3NzIEJ1cnRvbiA8Um9zcy5C
dXJ0b25AYXJtLmNvbT4NCj4gU2VudDogZGVuIDE5IGZlYnJ1YXJpIDIwMjQgMTM6NTQNCj4gVG86
IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPg0KPiBDYzog
b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTog
W09FLWNvcmVdIFtQQVRDSHYyIDMvNV0gZGV2dG9vbDogTWFrZSB1c2Ugb2YNCj4gb2UucGF0Y2gu
R2l0QXBwbHlUcmVlLmNvbW1pdElnbm9yZWQoKQ0KPiANCj4gT24gMTkgRmViIDIwMjQsIGF0IDAx
OjI4LCBQZXRlciBLamVsbGVyc3RlZHQgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPHBl
dGVyLmtqZWxsZXJzdGVkdD1heGlzLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToN
Cj4gPg0KPiA+IFRoaXMgbWFrZXMgdXNlIG9mIHRoZSBvZS5wYXRjaC5HaXRBcHBseVRyZWUuY29t
bWl0SWdub3JlZCgpIGZ1bmN0aW9uIHRvDQo+ID4gY3JlYXRlIGNvbW1pdHMgdGhhdCBzaGFsbCBi
ZSBpZ25vcmVkIGJ5IGBkZXZ0b29sIGZpbmlzaGAuDQo+IA0KPiBJZiB3ZeKAmXJlIHVzaW5nIG5v
dGVzIHRvIHN0b3JlIHRoZSBmaWxlbmFtZSBpbmZvLCBjb3VsZG7igJl0IHRoZSBpZ25vcmVzDQo+
IHN0YXRlIGFsc28gYmUgYSBub3RlPw0KPiANCj4gUm9zcw0KDQpZZXMsIHRoYXQgY29tZXMgd2l0
aCBwYXRjaCA1LiBUaGlzIHdhcyBqdXN0IGEgcHJlcGFyYXRpb24gdG8gZ2V0IHRoZSB0aHJlZSAN
CmRpZmZlcmVudCBwbGFjZXMgdGhhdCBjcmVhdGUgaWdub3JlIGNvbW1pdHMgZ2F0aGVyZWQgaW50
byBvbmUgcGxhY2UuDQoNCi8vUGV0ZXINCg0K


Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90868C88E56
	for <webhook@archiver.kernel.org>; Sat, 12 Sep 2026 19:15:34 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.62])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12395.1789240531448051614
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Sep 2026 12:15:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=L4ZGKran;
 spf=pass (domain: siemens.com, ip: 52.101.84.62, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iVVQJ6QnQIpro28tT5UtsHePHEYhsw/pFYeTwmBt/YCn6dipJdD68VPQo9Y2QfIAnmJkx85zG+FTYasCbfCmqZM0ym0nKlTiqkt1b0iu0cYFuDH5B8UMVw7sqnCFZmgbr25eB4n3ONOXKWo8I2Du4I42NXqGH0QhlaDA1w8/YY7qKHiIRKMIG+opmzX6ofobAjFFa5btBJttjgigHcMjUwYbHlSpEmlrYlvOoz/pMP5UUoAnZNd840i6wbhn9/9DZbloJKqetMZvokVvB4ewNrAj+B7A8QnhDEg+prf0IyGJHCHvQNfOCCrYJR6ZbdUKUAxQNpXNNqjNkOy2P7fNcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TIUMUjn43ISdfyAH7qPRpy6AHx9I4OFt9mK2/4y3xxw=;
 b=FmwlE0EbfNpQcNI8Xo6PjzLHaEzxatweHRTJSXqbFLV6aoytSP+B6fVeooOTY5jj6zqJ91ETqsYuu0UZc/ZI1urO06R5Uy649umgY3K9wZyHzVBBLMSk9qEOcLkOJRDjgFuPj2TiFiS4l8Z+mJ+Fc3Ks06Q7jwNkuknh3JSzNG+ufB7jeqKi3NsYDmpHz+xjbCNWTxWkpmL31CJJpMPUDjKLWW+unzVmGUG6qwP9YZfJ/s+IMf+xpUfgPbBMYA0LEWj1ABbhFk+2x1KnEQJi2nhebLtmROmFuHC6fqo9bTNWY/mmZisnuVQ5r3yX7v30YWJ2Pqaq8dvT30Q+hppWMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TIUMUjn43ISdfyAH7qPRpy6AHx9I4OFt9mK2/4y3xxw=;
 b=L4ZGKranaQnAMmBYxJoX4gqEbUnejICAGNgjxJk1xJnjANHPTqBUdpsqVbjTdqR8Mwm+eBTWrZLIwzzYOIYF5DSQUlmn8pDMdF2QUno4TrefbWolVGTv+hiOexvMo8Fm1oKhElpNwQ4aLD77Un2OtWzBT2UzZHTFYTONfnjuP+Tn7/nnz6MKtsJKGxAzYA1nGi2an+TrqyuP54Ipuc6jL5TaLuo0RmVJvOPjkzo6nT8UNjVWeicVTdkzA62fxONjOk+hObCk2ac5IRggBkWzImyDvXy+oK1X489Rz8F0k4CyfEqIJOmYRpMo7pSvUI5coZJrXuEIo1roJl/XXikc0Q==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by PAWPR10MB8187.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:391::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Sat, 12 Sep
 2026 19:15:27 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%4]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 19:15:26 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [scarthgap][PATCH 1/3] cpio: patch CVE-2026-66485
Thread-Topic: [OE-core] [scarthgap][PATCH 1/3] cpio: patch CVE-2026-66485
Thread-Index: AQHdLOl3UAdWHYZC8U2us4tepxuYUbazM7EAgBhHcLA=
Date: Sat, 12 Sep 2026 19:15:26 +0000
Message-ID: 
 <AS8PR10MB50730917F166A3CF95DA25CEFDBD2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20260815190824.2980891-1-peter.marko@siemens.com>
 <DL0FM099GEIW.TMGQI3PXEOAU@smile.fr>
In-Reply-To: <DL0FM099GEIW.TMGQI3PXEOAU@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=8926f3b5-e50e-42c3-babc-b137924a05b3;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-09-12T19:11:13Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|PAWPR10MB8187:EE_
x-ms-office365-filtering-correlation-id: 193c782a-1d13-4bf7-2d46-08df110233f5
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|6133799003|55112099003|22082099003|18002099003|38070700021|11063799006|4143699003|10067099003|56012099006;
x-microsoft-antispam-message-info: 
 TkdfmWJ1wfGEk+f6ep7t7Gv+ViA2NX70B/I3urbM/vBniTZ3SyJmVFLZOtp9JM1F69pCeV3IENH3PgeuOid2qJFEqGiP0RQq+g7MTbcVtfUjtt+QFSfHJzItl6rVTkZjNWkRRp7vMnjRkTq703zHDAnSP8LX8qAEnMUfmiZ9H/cmwIPuuCeg2rufFnnylHSCEgPV/ridUO1ACFLngcmb49Or3utB4nR6F1ttbbfXdMoDNK2j3G5hcez7+GVw9T+ieqhER/wTNcawQ25DiJElXfZG7eX6+uq6qlEyk0cjyXY+R1NFCNLZHH172jn34od/h2NWq9qrT+ZDn6a3g7y9fvex/+NkoxxS2FEiQfXPzsyko4tbigiI42/BLg6fNPE1P1uQwGzSULYPiKvrlbbOcX9e8y+Oi3+JY8Sj1xHOEi9zZ+qyS/lVLPSwoiAK5bh+XuL8Jc+2M+2NJeZVruKWJz7bXX/4dhREi9Yu8oDy6uUcF79g/9e1V+q6T/GBd1mCQ55EmwpeKnYUa9YC41rC63KFl3zTXiVvrADhLdvt+RSlKjOcb74qxcSpttzqm3hYM9e/BokoLgf19fJr2daD28lNIoPFdUnJmahif/rWzc2LJ1/qvAtskU2uOpfvlPqWcNh59EkcBnbOOWNHLXxNvnw3pbYoPsyxQK3pBYiL1+M=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(6133799003)(55112099003)(22082099003)(18002099003)(38070700021)(11063799006)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bmlSMjk2Z0NjcXJYSms0NjJuYUNZL1dpQ3BCRXFXanNoVWxBaHI2ZGtxVE4r?=
 =?utf-8?B?SVIxNDJCSHJSbzVwSDhwelQ2cjZRa3VlS0JzNWFGUXJ5VnFyb3FSVW1VczBa?=
 =?utf-8?B?U2hrcmhsVm4rcGd1Um85eENwWFFycEc1TnF3a3pVdWxMam5PNHI0VDVweWRw?=
 =?utf-8?B?dWdHVm1OcmlwM3RJY09vOUozZU5JWG5MSEFOd0padENDQkg1ZTI3WDgrZ1BP?=
 =?utf-8?B?TVRrU2xCSFA1Y2ZkSTZQdUQrc0wyVmpFU2tlTmVwblJmT1ErU0pROUNyaGI3?=
 =?utf-8?B?SnBQWjNCK3llSHZ3VStJVTJUTGtqSFNxSjI4WFp2LzZWUEdUU3A5czdaQ1hq?=
 =?utf-8?B?QjB6SE1zaCtPWGpqZjF1blljbWJTRGFLT083Q1lFS2xoaWZvRnUzc04ycHNQ?=
 =?utf-8?B?Wk9tZDBoV3FkbzYwRVN2ZUp2Tkh0akpFZzBWbk0raU1udFlrQURMQTU3QmVW?=
 =?utf-8?B?QnVCVW1laHdJaDdkVVhkRVRGWHhJOXByVUZlMzlBcmZSV1YvOEVPRnp0Tk1o?=
 =?utf-8?B?eUNOZVFRK04xQy81U0tHd2FSa2EwT2ZCbGUveVhWblZGVnU1YmoxM2tjKy9a?=
 =?utf-8?B?N0MxT3FsUjI3clcxMEtVVExZTU9tZVlmMk9FTGU3N21DalhrV3d4YWEvbWxX?=
 =?utf-8?B?SDUrTzRNMkFhZ0pVZHhYZkRTbzZrb3Mxb1cxNXNTVmd6NDhJOGNLRTZHdi9n?=
 =?utf-8?B?N0J2ZVplNVFWTFU0cDB4bWNhS2xUTXZkR09BcTY1djU2Rjh2Z1haZEhqR3Bw?=
 =?utf-8?B?SC9lWHVHZWFOdDBjY1dQZ2FxZll4UHM1YVNVcU9ZK2NzcDdEVVJ2eEttZVBJ?=
 =?utf-8?B?dXpCU1g5Y2szNFFtMVhaZENDVlJYNTRuaGJ1WnhPQ3JKYVRrb0FZSkVUSSs2?=
 =?utf-8?B?Mm5FZVByUFlrY3p1aTNMbnBhckhEYlBJekx6dnJtcTYvdW1zZU9HZlJ6Qm5J?=
 =?utf-8?B?Q2R1bE5lRk5HZVlnaXUvVVJVVXg3cnJSTGFTdGNwcU54SXluRjhEMVkySU5T?=
 =?utf-8?B?SW52Sy9ycTNJcXo1RnBMMG16aGRRekt0Y05mWnNWZEdPZkJDdU53UWpYUUJi?=
 =?utf-8?B?dzNNcmxQSUVBRUU4dEE4Y1ZqdkJTLzdERHJNSGx5MzZXQ0lHNGJjaVA2azNS?=
 =?utf-8?B?YlErMElLdEt5bEJ5dGlwWDAvcCtBc1FZbTBER2liWVkwdXQvdjNHa01KWFlW?=
 =?utf-8?B?L2VRcTdha2syL3ZHdUk5ZGhPWmdvNHdDMDVlMUtCS1lKUzdPMU5Vdms1R3FY?=
 =?utf-8?B?dnRDUFdjWkNVTlNIcHpMS1BjM3VYbWI2Y2N5YkQxU085RlFWQXRsOHJTb04r?=
 =?utf-8?B?KzlUS3drTzNheUdNcm1WVXJta3djOVVleU1GUE45L0pLeldUOXZRbDJ5d08y?=
 =?utf-8?B?VTBYVFZCeGhna2Q1RmZUcFRsWlIvbjdQM2xvTHByeENvK0tTWmY1QzFkUjhs?=
 =?utf-8?B?Wkc4Z0paa1g2ZTZQSjRCV2VjaVRSYkN0cEtvNlcvbXZjNFJTNWpxUmxFYjkw?=
 =?utf-8?B?OWd3U2NVSWhtMlQyYkRNSHRSZ0FFR0FrQ0puN1ZBRUZpVnlvT29mMmhOTnZm?=
 =?utf-8?B?aWRTSXp5OHhXaFc3Ri9teDRqZVJRUHUxSC9iWjhBMkY4TFhNWmUyVDZibzJ5?=
 =?utf-8?B?MmxSQW11L0FEbEJjUVhzQVdPMmJsSmJpU0FjeG0xMnVnOUJHcHMrU0hVUVQ5?=
 =?utf-8?B?UzYyL3E4dis0NHJPMFZzSzJ0WWFNUWx6MnVwZHN6YUVxaE5lWko4UWYwM1BJ?=
 =?utf-8?B?dmdFcjRtdEJ2ZWxJMCtBS0dLZVBtRkxzamt2OXYyUmx1bGRsWGNuN3hUeGNQ?=
 =?utf-8?B?ZnpIWkthZGRSMzhla3pKL3BwNXNFWGVxSy8rMlNJa2hqSys3UGhkQzFRNXNL?=
 =?utf-8?B?NEhLNlBFSGVhQXFtYkRwMEdEMVVGYVdQUmVDOGRVaVMzWWJkbUdPL25CMVNO?=
 =?utf-8?B?MGNJbnRmTkdPNG1HTi9lUEhqTmJMM0dTejYvMFJwdklPdnRFcXAraGxBWFpW?=
 =?utf-8?B?eHJlZmloMXJidk9sdTNjMWZ0MkZrVUNsenVRY0txaW14NXQyNDBRTk1kQkVp?=
 =?utf-8?B?TC9uMFpDZS8xMXMvWldzWWx0dE8vYkNWSFU3WU0yaHFrbm9tYnBiL2l5RXN5?=
 =?utf-8?B?MzdQbHp6dyt1aitLdFBZa1VQcXdWd2xBOUxsNGhWa1NPK3NGcGZXRXdLT2JP?=
 =?utf-8?B?RTkzcGJsUGVlQnhsYU05ZlgxUFBNaEIwY0JJK1Z4azI5dlFQZHA2RGtIUnhi?=
 =?utf-8?B?MGgxczVaYkdETWdubVBjeWRiQ0puUEROdyt1MWdUckw3SU1KWVpFWHBQK0Fh?=
 =?utf-8?B?dnFSQ3RPNzZodUY5WmxuamVIMU5GQVpuK0RsUDVocGtGSjMwWnplZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 193c782a-1d13-4bf7-2d46-08df110233f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2026 19:15:26.9160
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7GJ7wRdLo3xqN7RcEUHFSmGs9p5hfdAEhBPR3LocyoD6C/72TkuY5CZ0sDzTHTjqXuLqMYvdScsckE7Yf6+3QA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB8187
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Sep 2026 19:15:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245706

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogWW9hbm4gQ29uZ2FsIDx5
b2Fubi5jb25nYWxAc21pbGUuZnI+DQo+IFNlbnQ6IEZyaWRheSwgQXVndXN0IDI4LCAyMDI2IDEw
OjI1IEFNDQo+IFRvOiBNYXJrbywgUGV0ZXIgKEZUIEQgRVUgU0sgQkZTMSkgPFBldGVyLk1hcmtv
QHNpZW1lbnMuY29tPjsNCj4gb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtzY2FydGhnYXBdW1BBVENIIDEvM10gY3Bpbzog
cGF0Y2ggQ1ZFLTIwMjYtNjY0ODUNCj4gDQo+IE9uIFNhdCBBdWcgMTUsIDIwMjYgYXQgOTowOCBQ
TSBDRVNULCBQZXRlciBNYXJrbyB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiB3cm90ZToN
Cj4gPiBGcm9tOiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+ID4NCj4g
PiBQaWNrIHBhdGNoIG1lbnRpb25lZCBpbiBOVkQgQ1ZFIGRlc2NyaXB0aW9uLg0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogUGV0ZXIgTWFya28gPHBldGVyLm1hcmtvQHNpZW1lbnMuY29tPg0KPiA+
IFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5k
YXRpb24ub3JnPg0KPiA+IChGcm9tIE9FLUNvcmUgcmV2OiBjMTA1ZmJmODJlMmY1MGIwNWRjNjgw
ZTA2MDFiZjBlYTMxOThlNThjKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IFBldGVyIE1hcmtvIDxwZXRl
ci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4gPiAtLS0NCj4gPiAgbWV0YS9yZWNpcGVzLWV4dGVuZGVk
L2NwaW8vY3Bpb18yLjE1LmJiICAgICAgIHwgICAxICsNCj4gPiAgLi4uL2NwaW8vZmlsZXMvQ1ZF
LTIwMjYtNjY0ODUucGF0Y2ggICAgICAgICAgIHwgMjEwICsrKysrKysrKysrKysrKysrKw0KPiA+
ICAyIGZpbGVzIGNoYW5nZWQsIDIxMSBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Bpby9maWxlcy9DVkUtMjAyNi02NjQ4NS5wYXRj
aA0KPiANCj4gSGVsbG8sDQo+IA0KPiBJdCBsb29rcyBsaWtlIHRoaXMgc2VyaWVzIHRyaWdnZXJz
IHB0ZXN0cyBpc3N1ZXM6DQo+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92
YWxreXJpZS8/Iy9idWlsZGVycy82MS9idWlsZHMvNDM2Mg0KPiBodHRwczovL2F1dG9idWlsZGVy
LnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvPyMvYnVpbGRlcnMvNzMvYnVpbGRzLzQzNzgNCj4g
DQo+IGh0dHBzOi8vdmFsa3lyaWUueW9jdG8uaW8vcHViL25vbi1yZWxlYXNlLzIwMjYwODI0LTg4
L3Rlc3RyZXN1bHRzL3FlbXV4ODYtNjQtDQo+IHB0ZXN0L2NvcmUtaW1hZ2UtcHRlc3QtY3Bpby9s
b2cuZG9fdGVzdGltYWdlLjMxMTMzOC4yMDI2MDgyNDIxNDk0MA0KPiB8IEZBSUw6IENWRS0yMDE5
LTE0ODY2ICh0YXIgaGVhZGVyIHNpemUgb3ZlcmZsb3cpDQo+IA0KPiBDYW4geW91IGxvb2sgaW50
byB0aGlzPw0KDQpJIHJlYWxseSBoYXRlIHRoZSBleHBlY3RmYWlsIGRlZmF1bHQgc2V0dGluZywg
c29tZXRpbWVzIEkgbWlzcyB0aGUgZmFpbHVyZS4uLg0KDQpDb3VsZCB5b3UgcGxlYXNlIHRha2Ug
dGhlIGZpcnN0IHR3byBwYXRjaGVzIGZyb20gdGhpcyBzZXJpZXM/DQpPbmx5IHRoZSB0aGlyZCBv
bmUgaXMgY2F1c2luZyB0aGUgZXJyb3IuDQpBZnRlciB0d28gd2Vla3Mgb2YgdmFjYXRpb24gbG90
IG9mIHRoaW5ncyBwaWxlZCB1cCBzbyBpdCB3aWxsIHRha2UgbWUgc29tZSB0aW1lIHRvIGNsZWFy
IG15IGJhY2tsb2cgdG8gYmUgYWJsZSB0byBsb29rIGF0IHRoaXMgaXNzdWUuDQoNClRoYW5rcywN
CiAgUGV0ZXINCg0KPiANCj4gVGhhbmtzIQ0KPiAtLQ0KPiBZb2FubiBDb25nYWwNCj4gU21pbGUg
RUNTDQoNCg==


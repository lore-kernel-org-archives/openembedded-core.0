Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27385C4345F
	for <webhook@archiver.kernel.org>; Sat, 13 Apr 2024 12:00:08 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.86])
 by mx.groups.io with SMTP id smtpd.web11.10369.1713009598350352166
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Apr 2024 04:59:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=jAvCVJcQ;
 spf=pass (domain: axis.com, ip: 40.107.22.86, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PC9ToZSTM/gVCTGKOfwpW0vNjG4KUUH2CZm4Hn6cc2Okd2CjTgtXE6Fmux3BGw5Wyw8VSmkQl7NKdmDCvqDnyJs5XURtLT6UExojUxKsbZyUOMBxJznvU4ehLbIcLOzHRYf3E40J1Y+zKH8wW7kSInqwEmpzyRmKntXpUKqz+JlMO2ds3PJNhGWONUkMh03hhRP+IcZCIxNT4ar1hGjcP04cX8x1jWqZabrFfR+dCyEZignZB5Cm4IaQLQbOi+Hcysxvb83C99bMe1eEsBIue8osnBrPlOPBdWPhq9KvH+BK1tTJu0MNbtYHKULgVVjUikBdylpjxVakvYoaxnnaRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ywiw5elOw9ms3qpUlKJzGfK18UVNllBWkS20yNOloZ8=;
 b=fMBQ+Cov07KkfJOn8frJ67WH/eHxfe/JiL1VSiA4ReHYyOFHuS0YGJrVDT7lIMwCZyO5USrlcgaudswvAIMZgcnFgwxoOeAiC4/Wx9FNOTTz3LZnxuleies5iQ3Bde1g8QeMz6EDpX4vt0Pu4u6mxDG1v/VkIEyS2eGcgRjFpWn+rzVBgh25OL69VC5gQtfCFk9t6zYr7kavVlQDXFgz09NZLk6KSiFplFma91a5Or/xui6J5zdgyBGZZAj2DgJKFvsIig4QQINAEQ7V0jknAPaNfLXkSDKenN8SkAkDyaIfiDofAb1xWcE6TnIO0MnOr1HvXK9xSxhPVOMG74QaeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywiw5elOw9ms3qpUlKJzGfK18UVNllBWkS20yNOloZ8=;
 b=jAvCVJcQlUE+1v23KSihbjvvSJJJkv6cID2RnZ0a+1ch/7vXhjtqW8bcV0lg6LENvpClc6HQkZSkFvpwvzbpLY6jaTqDuoPARtM/XZGjprnXWXLa8hnw3gGzAkhFgNMPajCtX8ULszPihzebUfxsDpnLy7lMX5M4sbDdtH6JcYY=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DU5PR02MB10728.eurprd02.prod.outlook.com (2603:10a6:10:521::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Sat, 13 Apr
 2024 11:59:54 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::fa03:deff:aae:c4d0]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::fa03:deff:aae:c4d0%7]) with mapi id 15.20.7409.053; Sat, 13 Apr 2024
 11:59:54 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"peter.marko@siemens.com" <peter.marko@siemens.com>, Khem Raj
	<raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH 2/3] kbd: remove non-free Agafari fonts
Thread-Topic: [OE-core][PATCH 2/3] kbd: remove non-free Agafari fonts
Thread-Index: AQHajPq2a15rJ/zxCEyFtCtns/CzYLFk3GsAgAB8DgCAAGYVAIAAR1yAgAATExA=
Date: Sat, 13 Apr 2024 11:59:54 +0000
Message-ID: 
 <DB5PR02MB10213FBEAA07405417E5E08E6EF0B2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240412165714.8951-1-peter.marko@siemens.com>
	 <20240412165714.8951-3-peter.marko@siemens.com>
	 <AS1PR10MB5697E46CE94DF5D1CBC5F901FD042@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
	 <CAMKF1sqLRn60xsM3QB7dUAgKFPKdawyyVEnjBo5vHmU_Udgmog@mail.gmail.com>
	 <AS1PR10MB5697E9AA3A39FABDFDD0CCACFD0B2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <1fdc33e91742f6633a11748bfd863d6d462d4a2d.camel@linuxfoundation.org>
In-Reply-To: 
 <1fdc33e91742f6633a11748bfd863d6d462d4a2d.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU5PR02MB10728:EE_
x-ms-office365-filtering-correlation-id: d55d4348-6004-491e-a422-08dc5bb13b91
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Frz1uOv5qOIXdxegGsQBox2EZrw0X+VGT69kEdYBGJqdw9ZBz1gK0EKOjPzqKkOsuzeZIeJ98vdwaDs2KG2g+dhqgzSg8jPJkc8aMpbmYSvv17ImMeH4gq5JV4hUi75kyHXPgTjyHHf74VL9N4uuLo0cjuu5xxsDkJa85uqO0SpsHOjqkWpnVO7HEBCMuGWY0mi5u2PvsBOsn4VZBEwwkfyhyHCkP/uck4lcrh85RFjwZF9Q8RJ259y3/MbWT3lxtN2rO8F5dE+jJ8xVXGxvCe4tscxTjheKo+tyRap5GwB8V3jjftVcGqt5ngbig1+RcN1kxYI5UU6ltLQc11CCegOGFYy3WVZ6b+Dms2SOmIxEkECWfiXsJbp+ZXv53q49xrUVDqUP3mnEdoUx6gYWtMPWvkrPCY2FiyVhVNhE3W82DGznm9yRaAHzbF2iRGh18/YniPnR7IxiJOk8AgLsv3BxtJIV+9zdeFs+TvcrYejSXECkTJOgPz+YdsKuwO6kS3JAiE/4ow2tkFe6OGNLhV9H7xc1tpgjEU+f3rMWlqR6YhnZuvDXnexo/lEuOHFAhP1dFfuKq3nPYCyYlac1JGY0LWx/rce5tTBeWXA1WTceG7rSDEslepR0BWsoqasiRw+UI7BAJ1XZi6GX9fiGjW1t4ynLKvcOjR8ARG7xAcVhhQDZXsal90v8TxQd+lY6aOzLz6p87GWPCnf9+nIRFfSKX1jPEhS7eYL4ZkzbO/8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TVZ5Z0Z5b1dCTU5Zb1I2aW16QnczUC9OTitUcml1N1UxWStrNzlLb1NRdFhQ?=
 =?utf-8?B?QmdsSkJsTTNUYXhCY2FkYXZZNFoyTDJzRDhVVmpjdU5ia0R1bnRaa3l3dWtN?=
 =?utf-8?B?Mml5LzJHVTJ0SkJCUWpDbzIxRUpRUWVETXdUWVhHaDZ5MXJkamcvRFNlYVZZ?=
 =?utf-8?B?bFkyd1Z3WVBVQTREQWJrZVdUT1hKSmxrTnlLYk5SMWo3MUZUMm9HRUlPTTZB?=
 =?utf-8?B?cGNMdUhYRXBjMXRndFRwV3NtWEYyMVVNVFcvL3hDellnaStWVHJqOWtPTkhJ?=
 =?utf-8?B?ckliV0xPenVKVmRDc1I2S1hzcE9mSFJBSEJyUzB1dlRIU0lvbDlaUGlwcXJw?=
 =?utf-8?B?NDdxY3FtVlVPWnd0aTYvMXJzQ08wZWl2UncyQnlKK2ozYWpvSzJsczVWajBZ?=
 =?utf-8?B?UTBtY1RxUFhBS3VqUTBnckRDUWNPUXM5K1k0cWZQWmJJNHlWMVJTOWJEVmtq?=
 =?utf-8?B?YkY0Q0ZYQkx3VkRpWGoyVmhRTVliZVdqSElmYmlIdVRSd3I5dEhEeXFyWHdL?=
 =?utf-8?B?RVIxYUQvR0xCaFpTS1BaMTl5OHFoamk5R3BoVWVLTFI4cUNtUnQ0Rk82aXdH?=
 =?utf-8?B?VUdzRTVSMFVPMWxWZnBISGdOUGhGY0EvV2dudzl3ekY3UzJzRVFIWUZ0YUtS?=
 =?utf-8?B?aVl1cXlFdEF4OTBjRWNhcThiNTZiRzVNMldBZEVSTDA4VG43ZzlJbG44dnAr?=
 =?utf-8?B?cGo0TkpjUnhmaUMwNmJjMGNSTlMxazZzSlRsZ20zSGoyTWs1a2N5STZlNGZl?=
 =?utf-8?B?RUxxdTdtWjZPcE5Ia0grWERuZytHdEtidHFrSHJ3dS9yV1M3RmcwU0ZzQm16?=
 =?utf-8?B?ZmlwOFp2dTlXSXRsM1lpWlNLdzZjbjY2eVR3Q0ZJM0V6SEFuY1o1dXA2eHU0?=
 =?utf-8?B?dVg4eGYxTzV2K1NPbEJtRWpvNkp3alVKQUtVMWNYNnhJUEtmeVhxNVVVdHNP?=
 =?utf-8?B?ZnlFUmhxQWh0NU84WXo3WHZnRWpDYVB2UXMwK1NkQXRPNkllTDZnZzZ4UURG?=
 =?utf-8?B?MnlxS2cxa2tHQ094REVXVDlQdG1GdGdMMEMvNUVtTjFzdC92aklYcldsVlRR?=
 =?utf-8?B?anh1VEE3K1MwVUYxRTNhd0VXYlZNMDJQQnNibEJhczlzSUxjTHoxakViQmFT?=
 =?utf-8?B?MEhiLzEyZ2xlS1N6UXpYbFRSc2tJb3ZXSG56bmNkVkdvb2dOYmJmMGxJUFoy?=
 =?utf-8?B?SGdqNGVaVFVhYUg4TmpTQzlCVDNJNG9BL0s1NFY1UkNHa3dQcUswWU84N3U1?=
 =?utf-8?B?VEdCTWhXWTR0THp4SGJIRUpJMFNxUngraGZwSExiTVJEbWhmOHRCOWdOcDc1?=
 =?utf-8?B?Zk13NW9KU3BlOGVWaTBoWXpJdkl2c1ZxaTRha1pEUldCb2x5QWJHY0d6NGpC?=
 =?utf-8?B?QkRqNDdVQjFOckJ2ekVvUjJoYXVUSElQYXpKeXFOOWl6RlF5aEN0S0NqVy9M?=
 =?utf-8?B?b3B1SGdhZDhqdVR0Qk5BcEI5Wm15MlkzSEgzY0RzUjBEcEFPT0F4cldXVHMr?=
 =?utf-8?B?eVZlRDUreTFQd1lhRzVDSmJrc2xKbm9MNk5DUDhnSUxWY3lmM2loV2ZNc2Vw?=
 =?utf-8?B?cGZaZGlUMi9zY2dkK2J3MzZINGFJSU9DQ2wvRXVVaDN3Um1rZmdJdVFPOW9K?=
 =?utf-8?B?eGpZbXhCQ1JjOGdFQ2g3dWtoaFhMOHVoRWUwR2xDWkF5OERzRWtyMU5WMmYz?=
 =?utf-8?B?N1hvMEVjR05pQjNhMW5hdGpEN2JCVmtkcFZCb1hVdnNIT09EZDJLb0RQODBR?=
 =?utf-8?B?NWZkbWFkQkszZXNrU0Y5blRKbnNDWkF1Nko2N0RWaTEwUnlaU1o4VjVXQnNr?=
 =?utf-8?B?THhZK0loMGs3Tk9hYUpZUEdab25kcVBxeHRwNmJzbzRWOHQ3UmtXdGhRekpU?=
 =?utf-8?B?cnFYQWUzM3J1ZTdSTi9DNXkwNlUrVFM5MXJ3azg2MmorWXNmK1hrZ0JsTTg3?=
 =?utf-8?B?d05DMFl6OFp5MVhlZng0VFhTeWFtRmg1cllYUm94QUd6R3ZNNkxRYlFTYWRQ?=
 =?utf-8?B?T1B4QTcxOE0xenowK1VRTldxbStRS0o5TjNHekNtMi9hZk44aUl5ZWIwQzBG?=
 =?utf-8?B?SXF0dG00a1loTXV4empybytvLzNkTlJvb3lldElUOWNCTmNXU3dxaDRGZWNC?=
 =?utf-8?Q?vZHc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d55d4348-6004-491e-a422-08dc5bb13b91
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2024 11:59:54.6353
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BDxjhFCNE26rvIGl0ziAhQ0BhtcH1LRcUS60AA3vYVemFxnka/tNsuM8GcRGDaxf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR02MB10728
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Apr 2024 12:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198199

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIFJpY2hhcmQgUHVyZGllDQo+IFNlbnQ6IGRlbiAxMyBh
cHJpbCAyMDI0IDEyOjQ3DQo+IFRvOiBwZXRlci5tYXJrb0BzaWVtZW5zLmNvbTsgS2hlbSBSYWog
PHJhai5raGVtQGdtYWlsLmNvbT4NCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXVtQQVRDSCAyLzNdIGtiZDogcmVt
b3ZlIG5vbi1mcmVlIEFnYWZhcmkgZm9udHMNCj4gDQo+IE9uIFNhdCwgMjAyNC0wNC0xMyBhdCAw
NjozMSArMDAwMCwgUGV0ZXIgTWFya28gdmlhDQo+IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3Jv
dGU6DQo+ID4gVGhhdCBzdXJwcmlzZXMgbWUgYnV0IGZpbmUuDQo+ID4gSSdtIHNlbmRpbmcgYSB2
MiBtb3ZpbmcgdGhlIGZpbGUgcmVtb3ZhbCB0byB0aGUgcmVjaXBlLg0KPiA+IEJ1dCB5b3UgY291
bGQgYWxzbyBoYW5kLWNyYWZ0IHRoZSBwYXRjaCBhZ2FpbiBsb2NhbGx5Lg0KPiANCj4gU2luY2Ug
dGltZSBpcyBhZ2FpbnN0IG1lLCBJIGRpZCBjcmVhdGUgYSBoeWJyaWQgcGF0Y2g6DQo+IA0KPiBo
dHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL3Bva3kvY29tbWl0Lz9oPW1hc3Rlci1uZXh0Jmlk
PTAzYjkwMjhmZTZmNzZkYTRiMTljNjJlY2ExMDJjYWNjYWY2NmMxYjQNCj4gDQo+IExldCBtZSBr
bm93IGlmIGFueW9uZSBpc24ndCBoYXBweSB3aXRoIHRoaXMuIEknbSBoYXBweSB0byB0YWtlIG90
aGVyDQo+IHBhdGNoZXMuDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJkDQoNClRoZSBkb19j
b25maWd1cmU6cHJlcGVuZCgpIGxvb2tzIHdyb25nOg0KDQorZG9fY29uZmlndXJlOnByZXBlbmQo
KSB7DQorICAgIHJtIC1yZiAke1N9LyR7U30vZGF0YS9jb25zb2xlZm9udHMvQWdhZmFyaS0xKg0K
K30NCg0KSSBhc3N1bWUgdGhhdCBzaG91bGQgYmU6DQoNCitkb19jb25maWd1cmU6cHJlcGVuZCgp
IHsNCisJcm0gLXJmICR7U30vZGF0YS9jb25zb2xlZm9udHMvQWdhZmFyaS0xKg0KK30NCg0KLy9Q
ZXRlcg0KDQo=


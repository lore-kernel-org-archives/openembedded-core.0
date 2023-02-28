Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E0CC64ED6
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 18:49:42 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.51])
 by mx.groups.io with SMTP id smtpd.web10.994.1677610176611625250
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Feb 2023 10:49:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=Qtimv3qP;
 spf=pass (domain: nxp.com, ip: 40.107.7.51, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7ogNCpAS2Gp/5A0h2J924v5Bzzk7kkZn59mVF30s2Mut4ZM8F6EQeOwrhY0aZhjkI1qyC3GwKDsw2ZUYZWv41QHiXCGXveE/kyo8+zzyr8BzDLuJp2p3pzjoA0NRg67SwT+jeMUDLs0+Yt6pIe1eoBqkLnKSq5LtnBk9nWG6WToW6clm4E6xpWtwi8U5GnptQtHlIVCgs9dB1H9BhN7/z1SUFWWJuDfJWi2acWx3YBPL4Ck6rTronNQiBB0Jl05bNGlb2Cc9HOTqOAIAnli45X5iXGzC9+3PyJ7AoiS/uVBqEhzutalDhkW79xsPdXPLAk8a+2OCGRG3tbdeM++rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5l3eMxRvVak5PVPLyTGsjGwhJZdbZOgiXScmudQgud0=;
 b=UDn5ZzcH87kduSW0gPvNpDFmLUPOdp8NKQeRMrEFU4sFEssD+M9/zKh3ynkvPf/qzysjMNvuc/WpP1ery/6eGn9TSEo5R+8cFXj6mprsxCCZl7DXU5j9EQ47zsunJ7n3b0FjOwKewUF+479DwhsGrfuxUgqwKh+54xdgIjlIh94oQ0g+dLpc4DUIY5QZV0Ud/9ZJLvNoxdWyifcZrggqThzQuhxi6IZYDtB2vTtKoBSPs3aPlq2D94t9BrWpii3tjQb0SO/d379I0FG3XiuSt3GQQuhDt46KN+cXXziheqE2hDzXS+6JZFbHEN3ekT9EecNpHT5I475z0yOoBlYTPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5l3eMxRvVak5PVPLyTGsjGwhJZdbZOgiXScmudQgud0=;
 b=Qtimv3qPnKcN8qDwpBh6MQv/A7qUO6JPCyOgBrVQwZMHrfKxstbNOArsr+nub+nSEvYHvB5NdQFv7CyHZWbY8c/lDV3HpPon0YAzu0FFP/MoFU/b0O/si8C+Zqjek07TpToMMKIerShVzFOAW9q7HEG3dYxme0ud8TKU1E4xmQg=
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com (2603:10a6:8:f::15)
 by AM9PR04MB8634.eurprd04.prod.outlook.com (2603:10a6:20b:43d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 18:49:33 +0000
Received: from DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::1667:141d:675c:ea2e]) by DB3PR0402MB3852.eurprd04.prod.outlook.com
 ([fe80::1667:141d:675c:ea2e%4]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 18:49:33 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"michael.opdenacker@bootlin.com" <michael.opdenacker@bootlin.com>, OE-core
	<openembedded-core@lists.openembedded.org>
CC: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: RE: [OE-core] [DISTRO|MACHINE]_FEATURES_BACKFILL_CONSIDERED:
 confusing variable names?
Thread-Topic: [OE-core] [DISTRO|MACHINE]_FEATURES_BACKFILL_CONSIDERED:
 confusing variable names?
Thread-Index: AQHZR6g8vwkwJ5+4r0+QgjBGl0YsVK7c8QvAgAc0PwCAAANhAIAATn6w
Date: Tue, 28 Feb 2023 18:49:33 +0000
Message-ID: 
 <DB3PR0402MB385242FC81CA153CD9C9F8A2E2AC9@DB3PR0402MB3852.eurprd04.prod.outlook.com>
References: <8a4852e0-7d49-dfc3-7f41-9bf6c0c28016@bootlin.com>
	 <DB3PR0402MB3852CCB16686C166ADAED151E2AB9@DB3PR0402MB3852.eurprd04.prod.outlook.com>
	 <82ebb063-3d90-1f8c-3c93-d5e3a84fe764@bootlin.com>
 <c6d70d998ccbc09857f77dbd74684505273940eb.camel@linuxfoundation.org>
In-Reply-To: 
 <c6d70d998ccbc09857f77dbd74684505273940eb.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0402MB3852:EE_|AM9PR04MB8634:EE_
x-ms-office365-filtering-correlation-id: 21ae5d85-c88f-41dd-f5bb-08db19bc8828
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 v9zTdou+b61vDxCEgxnMtj7vAZ0voRg8FrsBLL+2Wsm7OAmK61z5anTrZR03IV514gFtZhwdvNA8NIVhFDWkyNnDYCrkBRqE34RdRb8yz7Gvq6BSJcr9Q5KwEceRcJHeJd8fphAq02Lx61fls9zznnAktUE7pGWtpfqLFcNtfPh9mh6xA7ddWopbEQHadW78FeJk4ihoE0ULX9vPsiAu/YS75wjW4rcoCwb0NC1xXvCbcxgRdLMaq3Kpg0klvy2pmGFjYlMxqgeWhz4CWd4ba1Yxd/Lz2TAbfRlmhyMHOJIps/x3Q5GnANtYkiqORKCYDDBbzQ6UJ2N48RQJuxQtoebEti6jmP9TowgtsWZMdWPZD1aUEsfUhgLUo5lhVpcdJ5R04WSjXRHJB3y+ip0xOq6x1SgnCI7MG3OPkUYlZrlJb1F1mV6mLkC+f/qlLgufmHLaCV/9PDlnOmsUhkplfFSS8mDq6dEOzMaNsFJWNB0DsNpREoXatLBOmvw0UqE6Afuo0eY/BVRpA8yjkuVJFvPW9CXSp32ihA82DQEMjV7zdtIXEZD1Gv9QaUu7iJBr9M/SZoBd8rfAp5gw6ylJPfwfU9cYr6dVvpOJKftdQksdJm/bl9m49zZyLd2gLQkDOrmnczi/N0Q6wqne1xKjfjA57hfTHMFYezcnZudMnWrTflz30mdPEB2age4C5zHGatsE0g0TxjD5pVVFk4nWDH0J4Ynv+y4CCf2aaa6ZecU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0402MB3852.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(366004)(376002)(136003)(39860400002)(451199018)(38070700005)(33656002)(122000001)(86362001)(38100700002)(44832011)(2906002)(8676002)(8936002)(5660300002)(4326008)(52536014)(66446008)(66556008)(41300700001)(76116006)(64756008)(66946007)(66476007)(55016003)(53546011)(55236004)(6506007)(186003)(110136005)(26005)(83380400001)(9686003)(316002)(478600001)(7696005)(71200400001)(83133001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cGI2M21ZOG5ZdFRDbEdOVFEySVgvV1hONW9ERHlzNjBVZWtoV0czaHRlYi9J?=
 =?utf-8?B?dlk3SUFzTGtzck1FbmtDUEVnZ0J4cUxzUWpHQWV5NXhkZ3hrRGFBMXZ6Z3NH?=
 =?utf-8?B?NlIxVXd0ZkRsdWhUSVNNNW1NU252VS9yQk9qSVRMNUhzYTNFbkhHUi9SZith?=
 =?utf-8?B?ZG9KY25NcGdrdE1zazhjajhjeTFkU2JZbk05Y2E0dWhUS08wRndpcm9Ud1FC?=
 =?utf-8?B?R0VtNHI5V0ZCZkk3dlJmeElCNlJzekZ1RVJ6amUxL0xZTzY0Q2xyVFhpb0xv?=
 =?utf-8?B?ZzBlM0l2eXRJOVhTMEdGNUF1Ykl4Tnc0OVIyeW1PVThzK2N2SEJGaVZOd2pW?=
 =?utf-8?B?bklNRWtLc0lnVjFWSVNGSHRBV0F0VVBLMTFMcmxTVmpYOUowVnI1TkpDK0Y1?=
 =?utf-8?B?djZqVmRGeW9iU0g0K05mekxRRmp4UEJBaFc5azVtK2tEWTNIL0lzVWlxb1NX?=
 =?utf-8?B?R25SMElDSWFMR1g3WU1qSGZaZVg2czdja3RhTk50NHhRRU9PR3FnQ3BUWUx0?=
 =?utf-8?B?ZTd1b256bk53VUdWSUVjLzVZeHhFUlZiNkQ2alAweTZhWE5iSmVjdDIxNkpO?=
 =?utf-8?B?algrQU4zeEo4SFVUZ0QvZ200cFZibWwrNVZra2tFUmMrVXd0WHJncUxWTGla?=
 =?utf-8?B?SS9scWxicnBISHpmdnpqZjl6UnFNaHQ5b3kxRHJqQ2tPS1kvbm9vdGRnT0tr?=
 =?utf-8?B?akxpL2xzV1R2STZYcEpPMndEelVZc3I4WGRUZVNLTjd4QkxMRHE3ZVFza1pS?=
 =?utf-8?B?bWM3eTFvK0EzcDdzT0tNM1RQQlNMODZXRVFNaC95UC9nSGdGNnZWbGZKWmxI?=
 =?utf-8?B?RllsS2hNUktYekV3MG0xZHJJSW5JdTh0cEU0bUlCS3VJNW5ZV3NiNzFic0Ns?=
 =?utf-8?B?d0ZXclRqRTFoWVVzWnlyeENxOC8vM1FPcHhpem1uSWlCZ2h2RW9McFNFK1Rx?=
 =?utf-8?B?SjQxQXBmMHZyREpqdkd4WXZKTmcrdnBSaXlmNzd0d0p3ZS8rSGsyUkdad3Vl?=
 =?utf-8?B?YWd3aTM2ak9aZWNyY2N4WU1sSG1QYXJDajVLSW80azM3RFdqcjNJcmtoYlFo?=
 =?utf-8?B?RVpNWmRGZ0pldXlBS0tIWWpNOUpYVXhJblMweDhaZ3RIb3RkcEpvSktLcDZq?=
 =?utf-8?B?NUl5OFA1VmV6QlVqbVdwQStXSS9ST3JHakllejI4cDdCWnpwa1QwSmYzaS9B?=
 =?utf-8?B?UERjNkNnMFg2TUxKKzlDc2dMYzB0YVBJTDRqRFBtUFhZQ2RDYjA5V1F1dVVG?=
 =?utf-8?B?R0xZWmVNK2RCbkV1ck1HbHFFd0VuSVBkb3h1QnNFdXlJS1FjZUJndEZBWHZR?=
 =?utf-8?B?Qjg4Y2dpNDA0L0grUlR1RjVVK3RtN2pRbjRQdk1VcXIveG1uOUYycm45YXVI?=
 =?utf-8?B?L1JVY2txVWd6VkdTcy9ZYmZYcHhMUlpKVGt6ZndBVk54aTA5a3dYRGlyRUpa?=
 =?utf-8?B?b05WL3NZekV0aFpvUEdQWmNGWFFzaWhweGt2eEsrR0NGZnRQNno2a1RlY294?=
 =?utf-8?B?cDB5blRuQjQyYmxvUEo4TjZCRlJnd2pzT3pESGJqNXE5a0JSOUdjZ0lxaEJt?=
 =?utf-8?B?dFBtQ2tUV25wY1lCL1hld2tGZVc0T3lNbEI4dnFsWnhqbkUyMkFrRTB1Y253?=
 =?utf-8?B?RlZ6cCtnU3RldWMxUEVZYnZXQ3M4VDR2bnVoOE1mVW82UTYwZTBtcmJQWGM1?=
 =?utf-8?B?b0xSYzVGNmRpOGg2a3U3YnJML3J4NUpiQ05FK1g2a3BqUnllVTcrL2kyaXpY?=
 =?utf-8?B?SElhaFZ5YU13aFBLVDZnWmhTVWNhQVJvdDUrdCtOVU1HU1YvdFJIMHhBQTZN?=
 =?utf-8?B?dGpiVGhYSitDZGlGcENTdTNZNWloMzJQd2NUdWszd2pWUk1PL2xZWC9zMHV5?=
 =?utf-8?B?VWRFT1IvbHNBSlp4L2ZBRFhRYlVlaFNFbzNTVjZiSUtQMGVsSm9rTlJBZWcx?=
 =?utf-8?B?S2tIeDN1V1VFTGMwQk5QVzY3c0hlZlEyd1hLVHgvWnBjTUNmS09abU93YWsx?=
 =?utf-8?B?MHQraXkzQ0kyc2VROUxjZXY3Rkp3QnJwWGRKWjBrN1R4YWpJRDNnS3NaNGNG?=
 =?utf-8?B?KzRrQmFJK1QzZ2pjK1hURS9sODVjNVROTERoS1pzM0FXZEJBV0IrMXd4a0lE?=
 =?utf-8?Q?YJoZgVpUqzEyr8SmZ9qYW6bYo?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0402MB3852.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21ae5d85-c88f-41dd-f5bb-08db19bc8828
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2023 18:49:33.1832
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: asabSpq0LxYQhtnaLH2jccgK/c0BhC4D8usn1lxDgWf2ZTQPKTmeaWaBnb9HAG1LAs1djElG+g14poJgkDZj0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8634
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Feb 2023 18:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177856

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUg
PHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIEZl
YnJ1YXJ5IDI4LCAyMDIzIDQ6MDQgQU0NCj4gVG86IG1pY2hhZWwub3BkZW5hY2tlckBib290bGlu
LmNvbTsgVG9tIEhvY2hzdGVpbg0KPiA8dG9tLmhvY2hzdGVpbkBueHAuY29tPjsgT0UtY29yZSA8
b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+IENjOiBZUCBk
b2NzIG1haWxpbmcgbGlzdCA8ZG9jc0BsaXN0cy55b2N0b3Byb2plY3Qub3JnPg0KPiBTdWJqZWN0
OiBSZTogW09FLWNvcmVdIFtESVNUUk98TUFDSElORV1fRkVBVFVSRVNfQkFDS0ZJTExfQ09OU0lE
RVJFRDoNCj4gY29uZnVzaW5nIHZhcmlhYmxlIG5hbWVzPw0KPiANCj4gT24gVHVlLCAyMDIzLTAy
LTI4IGF0IDEwOjUyICswMTAwLCBNaWNoYWVsIE9wZGVuYWNrZXIgdmlhDQo+IGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgd3JvdGU6DQo+ID4gR3JlZXRpbmdzLA0KPiA+DQo+ID4gVGhhbmsgeW91IGFs
bCBmb3IgeW91ciByZXBsaWVzIGFuZCBjb21tZW50cyENCj4gPg0KPiA+IE9uIDI0LjAyLjIzIGF0
IDAwOjI0LCBUb20gSG9jaHN0ZWluIHdyb3RlOg0KPiA+ID4gSSBhZ3JlZS4gVGhlIHByb2JsZW0g
SSBoYXZlIHdpdGggdGhlc2UgdmFyaWFibGUgbmFtZXMgaXMgdGhhdCBpdCdzIGFtYmlndW91cw0K
PiB3aGV0aGVyIHRoZSBmZWF0dXJlcyB3aWxsIGJlIGluY2x1ZGVkIG9yIGV4Y2x1ZGVkIGZyb20g
dGhlIGJhY2tmaWxsLiBBbGwgeW91IGNhbg0KPiB0ZWxsIGZyb20gdGhlIG5hbWVzIGlzIHRoYXQg
dGhlIHZhbHVlcyB3ZXJlICdjb25zaWRlcmVkJy4gV2hhdCBkb2VzIHRoYXQgbWVhbj8NCj4gWW91
IGhhdmUgdG8gZ28gdG8gdGhlIG1hbnVhbCB0byBmaW5kIHRoZSBmdWxsIG1lYW5pbmcuDQo+ID4g
Pg0KPiA+ID4gV2hhdCdzIGltcG9ydGFudCBhYm91dCB0aGUgdmFyaWFibGVzIGlzIHRoYXQgdGhl
eSB3aWxsIGJlICdleGNsdWRlZCcgZnJvbSB0aGUNCj4gYmFja2ZpbGwsIHNvIHRoaXMgZG9lcyBs
b29rIG11Y2ggY2xlYXJlciB0byBtZToNCj4gPiA+DQo+ID4gPiAJRElTVFJPX0ZFQVRVUkVTX0JB
Q0tGSUxMX0VYQ0xVREVEICs9ICJzb21lLWZlYXR1cmUiDQo+ID4NCj4gPg0KPiA+IFJpY2hhcmQs
IHdvdWxkIHlvdSBhY2NlcHQgaXQgaWYgSSBzZW50IGEgcGF0Y2ggcmVwbGFjaW5nDQo+ID4gIkJB
Q0tGSUxMX0NPTlNJREVSRUQiIGJ5ICJCQUNLRklMTF9FWENMVURFRCIgaW4gdGhlIHR3byB2YXJp
YWJsZXM/DQo+ID4NCj4gPiBPZiBjb3Vyc2UsIEkgY2FuIHVuZGVyc3RhbmQgaWYgdGhhdCdzIHRv
byBsYXRlIGZvciB0aGUgbmV4dCByZWxlYXNlLCBhbmQNCj4gPiBpbnN0ZWFkIGRvY3VtZW50IHRo
aXMgb2RkaXR5LCBhdCBsZWFzdCBiZWZvcmUgd2UgY2FuIG1ha2UgYSBjaGFuZ2UgYWdhaW4uDQo+
IA0KPiBJIGRvbid0IHdhbnQgdG8gcnVzaCBpbnRvIHRoaXMuIFRoZSBpZGVhIG9mIHRoZSB2YXJp
YWJsZSB3YXMgdGhhdCB0aGUNCj4gbGlzdCB3ZXJlIHRoaW5ncyB0aGF0IGRpc3RybyBtYWludGFp
bmVycyB3b3VsZCBuZWVkIHRvIGNvbnNpZGVyIHdoZW4NCj4gdXBncmFkaW5nIGFuZCB0aGVuICJt
YXJrIGFzIGNvbnNpZGVyZWQiIHNvIGluIHRoYXQgY29udGV4dCwgZXhjbHVkaW5nDQo+IHRoZW0g
bWFrZXMgbGVzcyBzZW5zZS4gSSdtIHN1cmUgdGhlcmUgd2FzIGRpc2N1c3Npb24gYWJvdXQgdGhl
IG5hbWUgYXQNCj4gdGhlIHRpbWUuDQoNCk5vdCBzdXJlIEkgdW5kZXJzdGFuZC4gV2hlbiB5b3Ug
c2F5ICdpZGVhIG9mIHRoZSB2YXJpYWJsZScsIGFyZSB5b3UgcmVmZXJyaW5nIHRvIHRoZSBCQUNL
RklMTCB2YXJpYWJsZT8gSSBhc3N1bWUgc28gc2luY2UgdGhhdCBzZWVtcyB0byBiZSB0aGUgb25l
IHRoYXQgdGhlIGRpc3RybyBtYWludGFpbmVycyB3aWxsICdjb25zaWRlcicsIHJpZ2h0PyBBZnRl
ciB0aGV5J3ZlICdjb25zaWRlcmVkJyB0aGUgQkFDS0ZJTEwsIHRoZW4gdGhleSB3aWxsIGFkZCB0
aGUgb25lcyB0aGV5IF9kb24ndCB3YW50XyB0byBCQUNLRklMTF9DT05TSURFUkVEKF9BTkRfTk9U
X1dBTlRFRCkuIFRoZSBvbmVzIHRoZXkgX2RvIHdhbnRfIGFyZSBub3QgbWFya2VkLg0KDQo+IA0K
PiBJJ20gbmVydm91cyBhYm91dCByZW5hbWluZyB2YXJpYWJsZXMgaW4gZ2VuZXJhbCBhcyBpdCBk
b2VzIGNyZWF0ZSBwYWluDQo+IGZvciB1c2VycyB1cGdyYWRpbmcgYW5kIHNvbWUgY29tbXVuaXR5
IGZlZWRiYWNrIGhhcyBiZWVuIHRoYXQgd2UncmUNCj4gYm9yZGVyaW5nIG9uIGZydXN0cmF0aW5n
IHVzZXJzLiBJIGtub3cgd2UgaGF2ZSBtZWNoYW5pc21zIG5vdyB0byBoZWxwDQo+IGJ1dCBpdCBp
c24ndCBwYWluIGZyZWUuDQoNClRoaXMgSSB0b3RhbGx5IHVuZGVyc3RhbmQg8J+Yig0KDQo+IA0K
PiA+ID4gSXMgdGhlcmUgYSBnb29kIHJlYXNvbiB3aHkgd2UgaGF2ZSB0aGlzIHNlcGFyYXRlIHZh
cmlhYmxlIGFuZCBjYW4ndCBqdXN0IGRvDQo+IHRoaXM/DQo+ID4gPg0KPiA+ID4gCURJU1RST19G
RUFUVVJFU19CQUNLRklMTDpyZW1vdmUgPSAic29tZS1mZWF0dXJlIg0KPiA+DQo+ID4NCj4gPiBH
b29kIHF1ZXN0aW9uLiBNYXliZSBiZWNhdXNlICI6cmVtb3ZlIiBpcyBmaW5hbCwgYW5kIGNhbm5v
dCBiZQ0KPiA+IG92ZXJyaWRkZW4sIGlmIEkgdW5kZXJzdG9vZCBjb3JyZWN0bHk/DQo+IA0KPiBS
aWdodCwgdGhlIGNvbmNlcm4gd291bGQgaGF2ZSBiZWVuIGl0IGNvdWxkbid0IGJlIHVuZG9uZSBh
bmQgdGhlIGRpc3Rybw0KPiBzZXR1cHMgZnJvbSB3aGVuIHRoaXMgZGF0ZXMgZnJvbSB3ZXJlIG1v
cmUgY29tcGxleC4NCg0KU2luY2UgZXZlcnkgdmFyaWFibGUgaXMgc28gYWZmbGljdGVkIGJ5IDpy
ZW1vdmUsIHBlcmhhcHMgdGhpcyBpc24ndCBhIGdvb2QgYXJndW1lbnQsIHBhcnRpY3VsYXJseSB3
aGVuIHRoZXJlIGlzIGEgbW9yZSBnZW5lcmFsIHBhdHRlcm4gZm9yIHRoaXM6IHRvIGFkZCBhbiBl
eHRyYSB2YXJpYWJsZSBhdCB0aGUgcG9pbnQgb2YgdGhlIHJlbW92YWw6DQoNCk1ZX0RJU1RST19G
RUFUVVJFU19CQUNLRklMTF9SRU1PVkFMUyA/Pz0gInNvbWUtZmVhdHVyZSINCkRJU1RST19GRUFU
VVJFU19CQUNLRklMTDpyZW1vdmUgPSAiJHsgTVlfRElTVFJPX0ZFQVRVUkVTX0JBQ0tGSUxMX1JF
TU9WQUxTfSINCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KPiANCg0K


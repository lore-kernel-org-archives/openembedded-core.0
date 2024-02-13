Return-Path: <vikas.katariya@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 674BDC48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 08:54:53 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.81])
 by mx.groups.io with SMTP id smtpd.web10.7391.1707814489213876599
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 00:54:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=JmEwkS6E;
 spf=pass (domain: arm.com, ip: 40.107.21.81, mailfrom: vikas.katariya@arm.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yl1xJJScqIjsXn6xmdfubZZn3KkOzV6aDKRQ1ffbXHx/JlxfGIpkFC+UHsR3/Nk92GQfL2/4iC450XU59pjfCHf+gUUmpE9lM1Nh53TVm7BnaAFuXYiTPpfk4bP3nT6nm6lNwiXMC0DGXqK08qB/6IwhwCzEgP39EYLmmhs/brwQ3K4NEGYixFfntadoDxTky7oOqRNRmndAVDKI9pTJcvGAaue2lZ5VWqjDLPCPLnNQMgtXjPGajOpT+ipK1SPtsFsVEqTnOtCnNjoUNtBwKeyjDnLpFGEP1osDm8ToVWGV9d/Eiy7n77zBUGikFek+Zb8+hTRs8rb4LVgiBKk/pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZTK2PQf5Ir9EGh7AaTnOzLWoTZKCEfdbmpj0v7j0mz0=;
 b=XiVaouz5QfiYqQCIY1CStuOz1ccymf9CLs3AnrvqNdmh9KwLEFT95wtnRKij7u7BvUE13vuMBZ/KsxHtysQJhsOOodRfyOzj8wXjnBeo7Iz6A/PkyLn7CNZ8MuLIJ9/GVe+6BTKsZoz1qVf2v3MZ7Gv5n6jXBjaTCspdjSzn4aFlGmAwC3UKVMDdc2Ju7puB6ZBKhYjIh5RpA703xJ/ZclgxS/+PwnN4Fr0CD6zMLXck/caEmuDNnHIB8WLGIr055SQaS9rEBcPiLB5Q8rQIvPKJmMPeK70ME06qHygam8DcxK1U9lGnptudJ2uOXR75WexW+GTIpkk8e7KJY14fTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZTK2PQf5Ir9EGh7AaTnOzLWoTZKCEfdbmpj0v7j0mz0=;
 b=JmEwkS6ETYi+Ql8a0GLTsON11BFYv8yzn4qJ8ZJo8+ApwKcQAdZC9NTfbTk9HzBVoplDhtPz8aUXBcYgARmxndEZdUadLnhTmyz8Azg59duRvwB6xfD1Vhx6aupMZJAuHHPPlTaxgfXUJdxiconltbyGrVupyAndidSMFmGb9fs=
Received: from AS8PR08MB6789.eurprd08.prod.outlook.com (2603:10a6:20b:38f::23)
 by AS8PR08MB9148.eurprd08.prod.outlook.com (2603:10a6:20b:57f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.33; Tue, 13 Feb
 2024 08:54:44 +0000
Received: from AS8PR08MB6789.eurprd08.prod.outlook.com
 ([fe80::b1d7:951d:dca7:1725]) by AS8PR08MB6789.eurprd08.prod.outlook.com
 ([fe80::b1d7:951d:dca7:1725%4]) with mapi id 15.20.7270.036; Tue, 13 Feb 2024
 08:54:44 +0000
From: Vikas Katariya <Vikas.Katariya@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Tim Orling
	<ticotimo@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Ross Burton <Ross.Burton@arm.com>
Subject: RE: [OE-core] [PATCH 1/1] bmap-tools: Add missing runtime dependency
Thread-Topic: [OE-core] [PATCH 1/1] bmap-tools: Add missing runtime dependency
Thread-Index: AQHaWeYNQVYP2HwXNU+7osfyF1qEh7D/0t+AgAJrVgCABL+bAIAAA7mAgAD9oLA=
Date: Tue, 13 Feb 2024 08:54:44 +0000
Message-ID: 
 <AS8PR08MB6789B72B529095D6FA0BFCA19F4F2@AS8PR08MB6789.eurprd08.prod.outlook.com>
References: <20240207165219.825246-1-vikas.katariya@arm.com>
	 <20240207165219.825246-2-vikas.katariya@arm.com>
	 <CANx9H-BnSFGhJLCWgof7mCLfTPMBWn9rdVRYb2vtuoTnmAWc-w@mail.gmail.com>
	 <c5fc39dd2e0081a621b8e8568c18dec188bdbf2b.camel@linuxfoundation.org>
	 <FE02D4E8-A5D7-4C9D-B673-2219E20E04D5@arm.com>
 <1e5e0f9b95767fd27729893ca22a5b2687fab0a9.camel@linuxfoundation.org>
In-Reply-To: 
 <1e5e0f9b95767fd27729893ca22a5b2687fab0a9.camel@linuxfoundation.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 433B63B506FB7C429A6FDBF7D62B2374.0
x-checkrecipientchecked: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR08MB6789:EE_|AS8PR08MB9148:EE_
x-ms-office365-filtering-correlation-id: 9a5757d9-a5dd-46cf-0949-08dc2c716c71
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 OnDVZamNleAHVaRHQblJX3IW5RD10q86E3GCT0cygHRGOaOr0WkCzB4C7Tv3JxlYl/QdTrP/TYxXGCXdUHQc3mv1fxc2UmEHMSRlKCeB3v+0c/aDAndKjIXnNeZ7wFb6LLsVPlEm7svkbhdBHewINmvpnG2dB6UOaJkcXaZMhj0bhZhDl60NC19g7aXbMlW2nXW82wk0C/TOgKzqF4pW/eTPZsfvLEW8SR/Y5dfi+sXQCzVRDe+UwT2aj+bz1q5+JuGDBgmPjlAUba0V4x+S3KTsyqySRVCzlmPeG3bP4wdpUJSrXR8uaCE3/9AVcURH91tTs6R1WFTnnB57vpxITM2SFbZ/qoK1PHEGuPXevoabN4KAYh/jd8E+RxbS+0J9lDDnQi+5r2ESQfz1tp2/S8DRw9z3kuuxgOXUaX9sZbrllc/a1Em0hmEvcuyWjNPZnOC959atpNf7TrfH+3xdaj00aosmmTaPuRLcEF79qCnGTfSR7Y/+hWYXHO9xdnA6LBW2E9f4jTqOjBksnROfbmaQSJay88fYKqunDCHocXye372w9JVNdcU3DqfrhwcsNe8DUW5sGs7a4vPN/qK4Zg4YEtxRDQxRgCCiBtKbKuU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6789.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(39860400002)(136003)(346002)(366004)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(52536014)(8936002)(4326008)(8676002)(5660300002)(2906002)(66899024)(26005)(83380400001)(66446008)(38100700002)(33656002)(122000001)(86362001)(38070700009)(110136005)(6506007)(66476007)(54906003)(316002)(66946007)(64756008)(76116006)(53546011)(7696005)(66556008)(71200400001)(478600001)(966005)(55016003)(41300700001)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eFJ1a3NMMDdidTJLR1Q1bFdtd0lya2NoMnhtR1FieXNPcVYxMFJUc1I1NlhF?=
 =?utf-8?B?TVNBTVJiREx3UTczK1o4cWZOY1oyQ2k0bmZTS1BvaTNmdkVTaWxwNGtyaEx3?=
 =?utf-8?B?Y1JTUjZOQjRYcENtS0s2c08rRlBGcUFCelRTN0xKdEdLakVDeEJEcGhQSWF6?=
 =?utf-8?B?SU8wNGdIN2tWaG4rNEVQbDNqZFpYQUIwTFRrOXB4bmVlelhSd05WTG0wa2RQ?=
 =?utf-8?B?SmtWaWpKT01lSVp3N2RVdUgxRnhCci8yeDViUEJTSXhQZENYZzM4ODhCSGY3?=
 =?utf-8?B?RVpwb3V3V2I5NkhUQndVTmZmZmY2NGlYMjVXSGQ4ZEh5YmVjZzUvQk85UnRQ?=
 =?utf-8?B?aW5BaEQ0ZzBUdml5bjdSYWdBUXQwbjJmWm1lY0E5aWV0R3dENXpKWk1HOGVt?=
 =?utf-8?B?b0xscHV3RisrakVRelRidVlLaHROVVVvMk9nTUE2OWpYeTZDQVU5Q3NWWEdT?=
 =?utf-8?B?dXZQTVQ1MlZ4ZFFabjZRbVhvZ281d1RXTFV4Mmg0ajNZVWd3Mm82L29oZFZX?=
 =?utf-8?B?cU5sNEdqZGk2L2xIaEZxWGdEZWpxRGxvVlM3ekZ2K0pwekkwQmZuL2Z4N3NR?=
 =?utf-8?B?WFNya3I3NW9CeEpHbHZZblVvdkVKMjZGVlUxdkxiSnNZOWV4bHRaUFA2ZDhy?=
 =?utf-8?B?QU5oRG5NL3FualVQak5VSXZSMnIzcjluTTB1OUVqT2IrT1ZtVmwwS1NwM2Nm?=
 =?utf-8?B?TXE4VmFiQjVVZWg2VTVEM2VHUmVuenNsbm5xNHdPdXBhZEJQUVdZOSt3OE00?=
 =?utf-8?B?ZUs3UDlNOUNkQUdVbVhiM295dWhqY2ZSNTZ0QzVmRS8rbHRkdUVWUTNDT2U5?=
 =?utf-8?B?ZEw4T2xpbi9WNGJuYUtZb2FQQWRkblN6S3FPcmsyYS9uY3IwSGVJVlpVZFhU?=
 =?utf-8?B?L0tRYmpYRTdKK3ZDTFlDaloyRG52VURVTm9wQklrdFNQVmUvMXJWNklKdU5Q?=
 =?utf-8?B?aUQ5NW9uUFVnWVVBY0tuQzViQ0pxd2Y1dUVyRGRWM1lkc1F0UUNEaEIxODM3?=
 =?utf-8?B?dHZjVzNYdVk2LzNzZGdGOERaRVdWZjZkM0tEb1hMSm9lREIwbFlVOW1vV2VU?=
 =?utf-8?B?dE1uZFlkRFRXdzkvN3ZhdCtEVjZncnIzTWxxbHVYeXFOWmVBM01uWXNzM2Ey?=
 =?utf-8?B?aTVVd3FUQ3FjNGxzMGE0UGNQZ3BURTFjcmVqZjdZWFM2ajJYRmQ4RmprbWd2?=
 =?utf-8?B?SFBpcjBRZldKYVpZcHllMk54STZEaHdDTTljSHNrRnBzU0hMclNiaWFVdEJK?=
 =?utf-8?B?TDNxaDQvQ0hCRkd4T2gzcUxNMy9SOXg4cmNOMFYzVGZkSlpvMjJuY0N5bXkv?=
 =?utf-8?B?TzlLS0ZuZjZyR1UzeXgra0dGNHloWkgvMUxBcEI0VUI4ZzZUV3lHelVNSjFH?=
 =?utf-8?B?RUxaOE1FSExXSzJhSDduRW5PRnZMbVJLclRBd2N6YTJ0alYrNmRObDZRL3Bk?=
 =?utf-8?B?Y3V3ZFBiM25KTTdPVnhNOGt1Y2JZOVRaMjF4S1NLT3FMbjRYOVBLeWdDYmRK?=
 =?utf-8?B?SjFTT0Q3Rm1Jd1VOYWIwTXBad1JYUGxGbkZ4eDcyK2phN09GODZEUit6bi9n?=
 =?utf-8?B?SGtwYXlGSk9FMzA5ck1HMWpaelcyVkJUMVRHTlluZDBzcGp6YzRRNlFzbU1s?=
 =?utf-8?B?dG84dFoyNitZQjJqTUk5S1BGZWRsTDhqaENWL1lBYzdBaHNqYkJZVnRsSk5j?=
 =?utf-8?B?SExtbS84cURVNG1pbVBYMnVPVXJiN3d3MEVwMFNzVy9qbHpxWVpHU3R3Uy9L?=
 =?utf-8?B?MVNMYzRzc3M4WU5OK09DcWE0bElDNWVmZzIvN3hZVlVqc2dHVE16bjlDbU1a?=
 =?utf-8?B?US9IbXFxSTZ4NXNsRVFZZ2p2cndPMk5GQVA4RWtiWDZiN1lPVk0xR2FjbVNq?=
 =?utf-8?B?QzcySFRINEcxbTRYa21SSXJUUHJkbGFnMWxmVWhCeDMzQlRZbzBrYld3aGlY?=
 =?utf-8?B?TU9ackdRV2pCb29VcU9yUUNaZDc5S3RwWW5qVndhL3NyUjkwb3NnR3pJWDUx?=
 =?utf-8?B?UFE0b2NCOFB6T2dyK3RKeHFyN1JQN1RIZXZZYmVHM3pDUk84cnVpYWtpWEQ3?=
 =?utf-8?B?RlNkZ0xGSUdhdHRmVlZsRlFGckVuVWNLakpBWVFxWU5Fa0huRGVaUTRUWVZP?=
 =?utf-8?Q?lOkPv5LWJc0IDQX4NvC+DBQcD?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB6789.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a5757d9-a5dd-46cf-0949-08dc2c716c71
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2024 08:54:44.1681
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rBRCwYWLN4Yu+IPxxwoGo5FhWJ9R1AJuQ5ikNiVSYdXtXy+CA9qLMDLCaxWKF7Jj4+j9Pw7ePdFUVOyeiCYt7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9148
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 08:54:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195371

SnVzdCBjaGVja2luZyBpZiByZXdvcmsgb2YgdGhpcyBwYXRjaCBpcyByZXF1aXJlZD8gSWYgbm90
LCBwbGVhc2UgY2FuIHRoaXMgYmUgbWVyZ2VkPw0KDQpUaGFua3MsDQpWaWthcyBLYXRhcml5YQ0K
DQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hh
cmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+IA0KU2VudDogTW9uZGF5LCBGZWJydWFyeSAx
MiwgMjAyNCAxNzo0MQ0KVG86IFJvc3MgQnVydG9uIDxSb3NzLkJ1cnRvbkBhcm0uY29tPg0KQ2M6
IFRpbSBPcmxpbmcgPHRpY290aW1vQGdtYWlsLmNvbT47IFZpa2FzIEthdGFyaXlhIDxWaWthcy5L
YXRhcml5YUBhcm0uY29tPjsgb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMS8xXSBibWFwLXRvb2xzOiBBZGQgbWlz
c2luZyBydW50aW1lIGRlcGVuZGVuY3kNCg0KT24gTW9uLCAyMDI0LTAyLTEyIGF0IDE3OjI3ICsw
MDAwLCBSb3NzIEJ1cnRvbiB3cm90ZToNCj4gT24gOSBGZWIgMjAyNCwgYXQgMTY6NTcsIFJpY2hh
cmQgUHVyZGllIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxyaWNoYXJkLnB1cmRpZT1saW51
eGZvdW5kYXRpb24ub3JnQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiA+IA0KPiA+
IE9uIFdlZCwgMjAyNC0wMi0wNyBhdCAyMDowMCAtMDgwMCwgVGltIE9ybGluZyB3cm90ZToNCj4g
PiA+IA0KPiA+ID4gDQo+ID4gPiBPbiBXZWQsIEZlYiA3LCAyMDI0IGF0IDg6NTLigK9BTSA8dmlr
YXMua2F0YXJpeWFAYXJtLmNvbT4gd3JvdGU6DQo+ID4gPiA+IEZyb206IFZpa2FzIEthdGFyaXlh
IDx2aWthcy5rYXRhcml5YUBhcm0uY29tPg0KPiA+ID4gPiANCj4gPiA+ID4gUHl0aG9uMyBtb2R1
bGUgbmV0cmMgaXMgcmVxdWlyZWQgYnkgYm1hcC10b29scyAodjMuNyksIHRoZXJlZm9yZSANCj4g
PiA+ID4gYWRkIGBweXRob24zLW1pc2NgIGFzIHJ1bnRpbWUgZGVwZW5kZW5jeS4NCj4gPiA+ID4g
DQo+ID4gPiANCj4gPiA+IA0KPiA+ID4gaHR0cHM6Ly9naXRodWIuY29tL3NlYXJjaD9xPXJlcG8l
M0FpbnRlbCUyRmJtYXAtdG9vbHMlMjBuZXRyYyZ0eXBlDQo+ID4gPiA9Y29kZQ0KPiA+ID4gDQo+
ID4gPiBXZSBjb3VsZCBhcmd1YWJseSBjcmVhdGUgYSBweXRob24zLW5ldHJjIHN1YiBwYWNrYWdl
IHRvIG1pbmltaXplIHRoZSBhZGRlZCBmaWxlcy4NCj4gPiANCj4gPiBJIGRvbid0IHdhbnQgdG8g
YWRkIHB5dGhvbi1taXNjIGRlcGVuZGVuY2llcyBsaWtlIHRoaXMuIFBsZWFzZSBjYW4gDQo+ID4g
d2UgdHdlYWsgdGhlIHB5dGhvbiBtb2R1bGUgc3BsaXR0aW5nIHRvIGhhdmUgYSBzZXBhcmF0ZSBw
YWNrYWdlIGZvciANCj4gPiB0aGlzLCB0aGVuIHdlIGNhbiBkZXBlbmQgdXBvbiB0aGF0Lg0KPiAN
Cj4gcHl0aG9uMy1taXNjIGRvZXNu4oCZdCBoYXZlIGFueSBoZWF2eSBkZXBlbmRlbmN5IGNoYWlu
cywgaXTigJlzIGp1c3QgdGhlIGNhdGNoLWFsbCBvZiBsYXN0IHJlc29ydC4NCg0KRmFpciBlbm91
Z2gsIEkgdGhpbmsgSSB3YXMgbWlzcmVtZW1iZXJpbmcgc29tZXRoaW5nIGFib3V0IGl0IG5lZWRp
bmcgYSBsb3Qgb2YgbW9kdWxlcy4gSWRlYWxseSBpdCB3b3VsZCBnZXQgc3BsaXQgYnV0IEknbSBv
ayB3aXRoIG1lcmdpbmcgdGhlIHBhdGNoIEkgZ3Vlc3MuDQoNCkNoZWVycywNCg0KUmljaGFyZA0K


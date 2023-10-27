Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B506C27C47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 23:28:00 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.85])
 by mx.groups.io with SMTP id smtpd.web10.32434.1698449272646870496
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Oct 2023 16:27:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=RiaOZZ58;
 spf=pass (domain: axis.com, ip: 40.107.249.85, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Drddjm9Z8BukaFMkr6UKk13UtlB2/h5plAydTHQ1xPRnE1hD1ZpFVT8LXUvm56cdzdyzzRh0cGXIy1OH9rBb6j8vfzePYLuuD1+MKKv5hcQu+M8gCeG13yJnDiXOhaGo+D0UsTl4BXRTzZBKuauksbvvX6vcSe2AenO5fjUXgQ17rAR2y83NooZktpKrFnJMzBapl5X/+Cvyxmht1xB/jDFPrVbgvoiL43aD2ORW6QH7RQlymjsVkEFPUYcZ1/5d3H47joC55uQ3OXaXnVGxo2zIH+v329AFa9l6edfRSqw0bBydn/rk6s44ErWi8L2DJaz5zu9YMu/AjM+jhg0S3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xn4HcXr9TvaPq0FlnkOUgIvkmzNyamvhAXEQVQ/dOn4=;
 b=WE1XQN6qTNLMMq9VIUYHX4+jSWrk6tyn5c25MJDo5BRnOt0fmO4pDM07qF7cAeKnNdLL+Km7gInJabp5hgx/dI1cSajPw4C7958rxlR5KAL8qoZ/R5eLZmb+fInJCx/3YbYgon7XEN4mhoOadwlbYmWucc1gDLbHWjrOZw3PFVcKPnzYDTVLgXW5BMN8yCRRJ9EctJrA0ude/9TtQAI5qhOMRv6h/NRM/bx5+bx18Qn17HLQKPZGZrYn8dbUji+rsbYEmVnOhu2CMhpg1aokQ1mdXkNk+LiWkfI/HT4+8UzVzNVTjxcUhT3lDKWVJ2a2VmWuCuznEcVk1eOamsw3yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xn4HcXr9TvaPq0FlnkOUgIvkmzNyamvhAXEQVQ/dOn4=;
 b=RiaOZZ58E0p9p5UUSdKhcdFvSQyT/aYPJPkk8I18ybPv7SjNCNkx9fnzUkyl3EAQvh2BVM3s/lyvNqlgQXbql927RkRh+Xb25qqfr12E5CCE0THjUBVVXcgNWV1x77ScAbTxKq1zioJZB60mqpoqRkiAu8Pd5HbStiZVJV+8CTU=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PR3PR02MB6204.eurprd02.prod.outlook.com (2603:10a6:102:62::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.24; Fri, 27 Oct
 2023 23:27:49 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1b86:94ad:137d:4093]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1b86:94ad:137d:4093%6]) with mapi id 15.20.6907.032; Fri, 27 Oct 2023
 23:27:49 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, William Kennington
	<wak@google.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] kernel: Commit without running hooks
Thread-Topic: [OE-core] [PATCH] kernel: Commit without running hooks
Thread-Index: AQHaB5PV4k7hDtnGIU+wFwHKw8plKrBbU0sAgACOpoCAAD+LgIACJBKQ
Date: Fri, 27 Oct 2023 23:27:49 +0000
Message-ID: 
 <DB5PR02MB10213AA31EED673AFF57264C8EFDCA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20231025223710.93502-1-wak@google.com>
 <CADkTA4OucgUogtX6tQ21oD6i1qQ+6qq1uJQG3S8NsChATTr3Ww@mail.gmail.com>
 <CAPnigK=VcgCH_gWUy2j3nXSngNXdc32y8FRKRiPSRU-bh57M5w@mail.gmail.com>
 <CADkTA4M90k1pt1Jc6SDLFYQyNgYqDoj_poC33t9byssx=HRP3g@mail.gmail.com>
In-Reply-To: 
 <CADkTA4M90k1pt1Jc6SDLFYQyNgYqDoj_poC33t9byssx=HRP3g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PR3PR02MB6204:EE_
x-ms-office365-filtering-correlation-id: dca5166b-92a5-4e6b-80ef-08dbd7445547
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jcCuu/CDULtzxQE2RnhK5Y3nZG0PJXz0S524erf3Eae13kvpnKOSVBNvzqSqS1rPsQ6+w4JDAM+oO25n1tONPkpbQ1NkecZA13EQv5INZj6RiAYlAWNwE93B+t6srxbmYzEJHPjX/dKXk6xIcKwzCaBPm0oFq/GA7co2PvBYIO7lX0dF8Zp2AmVfaWRfGSfvsvNXFXUUxNbSTTdf+7m5VeYEXC+IbSr8S5HCIz3Y3Gi3QUCWOck0dle0Uc8XZHUhBcYyvLM2ZpiQjCkU/x1Klc2b6mTRYFasN2yaZplbxTTQRw8zI9z1EeLAQUkEwtLGkEL9xMeGCwIHyAgoDoh5+yX8+8THZbnt13i+YaUWwfCW43PugKELi2KFw7KvSozFSTwKWvtiHPlY6XEaZ1lU1QbjbKPvlAY/Ok/7dJQiACr78RR2vCrPhEUzoJTVqqJmFTDunnhZJgupM9SeSkIbbq7FY3e5/pvkKdYHRY2bieM1laXf228ZJiekLMxyzoA5VP/NWslrZiz1QJ6i2Uz6HeDDBG6beSE0879M6LuHR1qiqyTeelA3OE1sQoLHzbLGUYUdfK5gRYofXJ1Qnqt85/79uTS0Ne376C3R84zvaH7+wJWeiM7cDs4JUAnVY0bu
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(136003)(346002)(396003)(366004)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(316002)(83380400001)(122000001)(6506007)(7696005)(38100700002)(66556008)(66946007)(110136005)(9686003)(76116006)(66476007)(66446008)(26005)(53546011)(71200400001)(64756008)(478600001)(41300700001)(2906002)(52536014)(44832011)(33656002)(5660300002)(86362001)(8936002)(4326008)(8676002)(38070700009)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WkVSQ2R1WUdaVXUrcVNGNG9hK05QZTZGK0psQW15WGhHc2dtcEdJa2hSMS93?=
 =?utf-8?B?OU5ZYndGT1JwZnpjeUd4UWQxL1UrVHJJVDBLd1N6bXNUS2RNblRyTEloZlJF?=
 =?utf-8?B?YkZGZllxVUpuS2NmeXRFUmZYa0hIaFdJUlUrdE9BNVFFcGR5Tk56Z1l1WGdv?=
 =?utf-8?B?dU9SY2ZDeXhSUHhNQVFKU3ZSV1NjL2RwL3V5a1BEL1dZT0pQc1Mrc2FNTjJB?=
 =?utf-8?B?TUVaYWRFb3BXTFBRRmdiaXdkTTZ3WjFTVDhpdjB0Q3hOb0FhUS9NRXNkVnB6?=
 =?utf-8?B?QnBGcEFBb1JWZUg3djRJK2hxV1FUUWZibFZYVHErUXdjNlUydXJUR2VyQ3do?=
 =?utf-8?B?TTRzVHFOSDV0YzFSVWhGOUtTbkNwSE93TUduSkUrOG40Rkp1Y1VhMldpNlVa?=
 =?utf-8?B?aWM4VGFaeTFRUWd0cXJMMlBiQ2ZoWm1meUFuY2Y4Q01LM0JSaGtEMklsWjhT?=
 =?utf-8?B?YkNyYWJjeUtLZWZwUlFmL2E1N0JzUWRodUlsa1FjSlJuSEZPSWdpem9mNGJp?=
 =?utf-8?B?bm5NblB0MUFLTk9DRGl4OHZJVmlqWnQwcTZrcjNRTEJ4MGJBUDZWUXVLL0ZP?=
 =?utf-8?B?WTZWdHNvYVF6UXl1Rys4cFNWZjNZcE1FQVZQT1hCazhhR3hhOVlNY3ZqeTN2?=
 =?utf-8?B?NTF3UkNkOXA0Z29WUXJZQU1NOWNzSFhkaDJhTktCemp6cnVRelczUVNlM2Mx?=
 =?utf-8?B?VVUya29jeHg0TmVFeEFTL2sxeTZ5ZnZrejhnYko2WGVscTRoVjAyMzdWaTQz?=
 =?utf-8?B?UjdPTXB1NWRYMTJqU1N3NVBpREswbEFyWXFFSHlMTGxYM2lWeGk5eFNjcDJJ?=
 =?utf-8?B?R1E3UHZSRkpZMk5yc2lIZFNyRUtHMkFtZm9jVFZxM3FpRjhobWlobmh1aVNN?=
 =?utf-8?B?RUlrcVd3VThaQ25RZUxDT3BNa0dnMWFKYzZvVUE4U0Y0T1RZTXdlSkN2cVZU?=
 =?utf-8?B?aGFlN0hJRTYvc2srQzFZWVlXbHNJdkpCUWYxT0dXK3ZJOFRFRXcrcEJWUUx6?=
 =?utf-8?B?ZDhLVXVCaXJ1MmdjOXdoR1k5VFluTE5oM0RzMDMrYmRFalF3Uk16aUxGQ053?=
 =?utf-8?B?bVZkUXJzam9JYmpLWTdITTZHeFZtckFzUjVBTXl0Qi9jYU15S3hkMU02RTI5?=
 =?utf-8?B?SisrY0NMTjV5MEppYlovK3RyLzBqZlI2Z1hnZU9LOXN4N0ZyOWkxQ1NVc0RC?=
 =?utf-8?B?NThlRHhFWTlGdmQ5WEVKUVFJdWZUcEVRbm40Zjk0RkE0RkhLSVFHQVR5YS81?=
 =?utf-8?B?cE5mOFRKVUVYOHJZMWhKelhmU2tSVWF3eFkyVFlEa0x6VTRSbVdHYkRWOGpy?=
 =?utf-8?B?MFFGemV2bzljY1ZLWnhtMTZ3UkdNbGoyYnpJVTJoM0pINURBdDVaa1NFekFY?=
 =?utf-8?B?cnd2Vy9peFJ3ejkxOXp3K0R2RTF4MVp4RG05UDJLNmtCNlkvU2JxUEoxYWJ4?=
 =?utf-8?B?MWVKek8vR0FWUEg4dmRoUWFOcFU0Q2s3d3E5SXZqTE9CWEdPY3B5RTJvNzZB?=
 =?utf-8?B?Zkd6T3V4dGMzSFIxQmdRa3hPMHRUdWhFSkVtUjExU1M4K05VeDd5bmlaMWYw?=
 =?utf-8?B?V1U0RU1LNE5oNGN4ODh3dlV1RlJvNUcxaDl5OWJaNGJjSFZvbUJ0S0dlZUVF?=
 =?utf-8?B?cVBNNmNoUE05QXNEbUJwL1BtQlpzTUcvbTZJRGFDcmNxTUVTZEYxUUw2T3Nh?=
 =?utf-8?B?K3dHQWN4R3NnQWVhZENNUmRGaVJMM0RQc01kM3RuTDNsd3lhanBwZHRBOEVR?=
 =?utf-8?B?bmZ1S3k4aS9NNk9NTFdaS01admM5aTA4UGdUdi84UGtVMDBYcFh4QWUwYmov?=
 =?utf-8?B?bFBYbUV5bWREdGVRbC9aTHY4N3A1REhtejQ1Y0NEVTFjSFlTZjVZbmVCbys3?=
 =?utf-8?B?VS9oWU0wWXQ3Yi84c0RNRlBmNkFVSkpVclU2SGtuc0dzZlVDckpXWXJjd0VD?=
 =?utf-8?B?VWZHaGdHMjVsR2ZKOFd4UUF0a04rVkRRQVVidjR4cnUyK29COWllUnBDandB?=
 =?utf-8?B?Q1hKTEpUTmY5Tmpvc0pYT3hIcWhjdHhCR2t5ZEhyR2hZcDY0R09oUUFPSU9I?=
 =?utf-8?B?S3lBVGpmbkpSUHV4MmNHZWtObUNsUm05MnEyaTJVK0pZa3doTGJ3UDMwTlhS?=
 =?utf-8?Q?8RjQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dca5166b-92a5-4e6b-80ef-08dbd7445547
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2023 23:27:49.1450
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P5xNgqjMDgrI6SfgcnGXgnK6PuyCL8i2Q1iMEMtMeZ/KF2fHt3UxvysZMOUTRCi3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6204
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Oct 2023 23:28:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189755

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIEJydWNlIEFzaGZpZWxkDQo+IFNlbnQ6IGRlbiAyNiBv
a3RvYmVyIDIwMjMgMTY6MjYNCj4gVG86IFdpbGxpYW0gS2VubmluZ3RvbiA8d2FrQGdvb2dsZS5j
b20+OyBSaWNoYXJkIFB1cmRpZQ0KPiA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9y
Zz4NCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3Vi
amVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIGtlcm5lbDogQ29tbWl0IHdpdGhvdXQgcnVubmlu
ZyBob29rcw0KPiANCj4gT24gVGh1LCBPY3QgMjYsIDIwMjMgYXQgNjozOOKAr0FNIFdpbGxpYW0g
S2VubmluZ3RvbiA8d2FrQGdvb2dsZS5jb20+IHdyb3RlOg0KPiA+DQo+ID4gT24gV2VkLCBPY3Qg
MjUsIDIwMjMgYXQgNzowOOKAr1BNIEJydWNlIEFzaGZpZWxkDQo+IDxicnVjZS5hc2hmaWVsZEBn
bWFpbC5jb20+IHdyb3RlOg0KPiA+ID4NCj4gPiA+IE9uIFdlZCwgT2N0IDI1LCAyMDIzIGF0IDY6
MzfigK9QTSBXaWxsaWFtIEEuIEtlbm5pbmd0b24gSUlJIHZpYQ0KPiA+ID4gbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8d2FrPWdvb2dsZS5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6
DQo+ID4gPiA+DQo+ID4gPiA+IFRoZSBob29rcyBhcmUgcHVsbGVkIGZyb20gdGhlIGltcHVyZSBl
bnZpcm9ubWVudCBhbmQgYXJlIG9mdGVuDQo+IGJyb2tlbiBpbg0KPiA+ID4gPiBvdXIgZW52aXJv
bm1lbnRzLiBUaGVyZSBpcyBubyByZWFzb24gdG8gYWRkIGV4dHJhIG1ldGFkYXRhIG9yIHZlcmlm
eQ0KPiB0aGUNCj4gPiA+ID4gY29tbWl0IG1lc3NhZ2UgYXMgaXRzIGFyYml0cmFyeSB0byB0dXJu
IHRoZSB0YXJiYWxsIGludG8gYSBnaXQgcmVwby4NCj4gPiA+DQo+ID4gPiBCdXQgd2hhdCBhYm91
dCB0aGUgb3RoZXIgdXNlcyBvZiBnaXQgPyBJZiB0aGUgaG9va3MgYXJlIGJyb2tlbiBkdXJpbmcN
Cj4gPiA+IHRoZSBjcmVhdGlvbiBzdGVwLCBvdGhlciB1c2VzIG9mIGdpdCBzaG91bGQgYWxzbyBi
ZSBicm9rZW4uDQo+ID4NCj4gPiBUaGUgb25seSB0aW1lIGhvb2tzIGFyZSBydW4gaXMgZm9yIGBn
aXQgY29tbWl0YC4gQUZBSUsgb3VyIGJ1aWxkDQo+ID4gcHJvY2VzcyBoYXMgbm8gb3RoZXIgaW52
b2NhdGlvbnMgb2YgYGdpdCBjb21taXRgLiBBbGwgb3RoZXIgZ2l0DQo+ID4gb3BlcmF0aW9ucyB3
b3JrIGZpbmUuDQo+IA0KPiBSaWdodC4gVGhlcmUgYXJlIGEgZmV3IG90aGVycyB0aGF0IHlvdSBq
dXN0IGFyZW4ndCBoaXR0aW5nLiBUaGVyZSdzDQo+IHRoZSBnaXQgb3B0aW9uIGZvciBwYXRjaGlu
ZyAoZm9yIGFueSByZWNpcGUpLCBhbmQgYWxzbyBzb21lIHVzZSBpbiB0aGUNCj4ga2Vybi10b29s
cyB0aGF0IHlvdSB3b3VsZG4ndCBzZWUgdW5sZXNzIHlvdSBhcmUgYWxzbyBwYXRjaGluZyBvcg0K
PiBkb2luZyBtZXJnZXMgYXMgcGFydCBvZiB0aGUga2VybmVsIHBhdGNoIHBoYXNlLg0KPiANCj4g
SXQgd291bGQgYmUgbmljZSB0byBmaXggdGhlbSBhbGwgYXQgdGhlIHNhbWUgdGltZS4NCj4gDQo+
ID4NCj4gPiA+DQo+ID4gPiBXZSd2ZSBoYWQgdGhlIGFiaWxpdHkgdG8gY2hlY2sgdGhlIGdpdCBj
b25maWcgZm9yIHF1aXRlIHNvbWUgdGltZSwgd2UNCj4gPiA+IGNvdWxkIHRha2UgaXQgZnVydGhl
ciBhbiBpbmhpYml0IHRoZSB1c2Ugb2YgdGhlIGhvc3QgY29uZmlnIGlmIHdlIGFyZQ0KPiA+ID4g
d29ycmllZCBhYm91dCBicmVha2FnZSBsaWtlIHRoaXMuDQo+ID4NCj4gPiBNYXliZSB0aGlzIHdv
dWxkIGJlIHRoZSBiZXN0IGlkZWEgb3ZlcmFsbCBmb3Igb3VyIGdpdCBzdXBwb3J0IGluc2lkZQ0K
PiA+IHRoZSBidWlsZCBzeXN0ZW0sIGF2b2lkaW5nIHRoZSBidWlsZCB1c2VyIGdsb2JhbCBnaXQg
Y29uZmlnLiBUaGF0DQo+ID4gcHJvYmFibHkgc29sdmVzIHRoZSBpc3N1ZSB3ZSBnZW5lcmFsbHkg
aGF2ZS4gSSdtIG9rYXkgZWl0aGVyIHdheS4NCj4gPg0KPiANCj4gQWdyZWVkLg0KPiANCj4gVGhl
cmUncyBzb21lIGNvbXBsZXhpdHkgd2l0aCBnaXQgdmVyc2lvbnMgYW5kIHRoZSB2YXJpYWJsZXMg
dGhhdA0KPiBhcmUgYXZhaWxhYmxlIHRvIGluaGliaXQgbG9jYWwvaG9zdC9zeXN0ZW0gY29uZmln
dXJhdGlvbiwgYnV0IHJlYWxseSwNCj4gaWYgd2Ugd2FudCB0byBoYXZlIGlzb2xhdGVkIGFuZCBy
ZXByb2R1Y2libGUgYnVpbGRzLCB3ZSBzaG91bGQNCj4gcHJvdmlkZSBvdXIgb3duIGNvbmZpZ3Vy
YXRpb24uDQo+IA0KPiBSaWNoYXJkOiBEb2VzIHRoYXQgc291bmQgcmVhc29uYWJsZSB0byB5b3Ug
PyBJZiB5b3Ugd2FudCB0byBmaXgNCj4gdGhpcyBpbW1lZGlhdGUgcHJvYmxlbSwgaSBkb24ndCBz
ZWUgYW55IGhhcm0gaW4gdGhlIHBhdGNoLCBidXQgaXQNCj4gbWF5IGp1c3QgbWFzayB0aGluZ3Mg
YW5kIGVuc3VyZSB3ZSBkb24ndCBldmVyIGZpeCBpdCBmdWxseS4NCj4gDQo+IFdpbGxpYW06IGNv
dWxkIHlvdSByYWlzZSBhIGJ1Z3ppbGxhIChhbmQgYXNzaWduIGl0IHRvIG1lKSBhYm91dA0KPiBn
aXQgY29uZmlndXJhdGlvbiBmcm9tIHRoZSB1c2VyL3N5c3RlbSBpbmZsdWVuY2luZyBvdXIgYnVp
bGQgPyBUaGF0DQo+IHdvdWxkIGVuc3VyZSB3ZSBkb24ndCBmb3JnZXQgaXQgY29tcGxldGVseSA6
KQ0KPiANCj4gQnJ1Y2UNCg0KSSB3b3VsZCBhcmd1ZSB0aGF0IGl0IGNhbiBiZSBhIGJhZCBpZGVh
IHRvIGlnbm9yZSB0aGUgdXNlcidzIEdpdCANCmNvbmZpZ3VyYXRpb24uIEl0IG1heSwgZS5nLiwg
Y29udGFpbiBpbnN0ZWFkT2Ygc2V0dGluZ3MsIHdoaWNoIGlmIA0KaWdub3JlZCwgcHJldmVudHMg
dGhlIGJ1aWxkIGZyb20gZmV0Y2hpbmcgZnJvbSB0aGUgY29ycmVjdCBzb3VyY2VzLg0KVGhlcmUg
bWF5IGJlIHByb3h5IHNldHRpbmdzIHRoYXQgYXJlIG5lZWRlZC4gVGhlcmUgbWF5IGJlIGhvb2tz
IA0KdGhhdCBhcmUgbmVlZGVkLiBBbmQgdGhlIGxpc3QgZ29lcyBvbi4gVHJ5aW5nIHRvIGF2b2lk
IHByb2JsZW1zIA0KYnkgY29tcGxldGVseSBpZ25vcmluZyB0aGUgdXNlcidzIGNvbmZpZ3VyYXRp
b24gaXMgbGlrZWx5IHRvIG9wZW4gDQp1cCBhbm90aGVyIGNhbiBvZiBwcm9ibGVtcy4NCg0KVGhh
dCBzYWlkLCBzcGVjaWZpY2FsbHkgaWdub3JpbmcgdGhlIHByZS1jb21taXQgYW5kIGNvbW1pdC1t
c2cgDQpob29rcyBieSBzcGVjaWZ5aW5nIC1uIChvciAtLW5vLXZlcmlmeSBhcyBJIHByZWZlcikg
dG8gZ2l0IGNvbW1pdCANCmlzIHByb2JhYmx5IGEgZ29vZCBpZGVhLiBBdCBsZWFzdCBpZiBvdGhl
cnMgYXJlIGxpa2UgdXMgYW5kIGhhdmUgDQpnbG9iYWwgR2l0IGhvb2tzIHRoYXQgdmVyaWZ5IHRo
YXQgdGhlIGNvbW1pdCBtZXNzYWdlIGZvbGxvd3Mgb3VyIA0KcnVsZXMuLi4NCg0KLy9QZXRlcg0K
DQo+ID4gPg0KPiA+ID4gQnJ1Y2UNCj4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYt
Ynk6IFdpbGxpYW0gQS4gS2VubmluZ3RvbiBJSUkgPHdha0Bnb29nbGUuY29tPg0KPiA+ID4gPiAt
LS0NCj4gPiA+ID4gIG1ldGEvY2xhc3Nlcy1yZWNpcGUva2VybmVsLXlvY3RvLmJiY2xhc3MgfCAy
ICstDQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkNCj4gPiA+ID4NCj4gPiA+ID4gZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy1yZWNpcGUva2Vy
bmVsLXlvY3RvLmJiY2xhc3MgYi9tZXRhL2NsYXNzZXMtcmVjaXBlL2tlcm5lbC15b2N0by5iYmNs
YXNzDQo+ID4gPiA+IGluZGV4IDRhYzk3N2IxMjIuLmNiOWNkMjZiMDkgMTAwNjQ0DQo+ID4gPiA+
IC0tLSBhL21ldGEvY2xhc3Nlcy1yZWNpcGUva2VybmVsLXlvY3RvLmJiY2xhc3MNCj4gPiA+ID4g
KysrIGIvbWV0YS9jbGFzc2VzLXJlY2lwZS9rZXJuZWwteW9jdG8uYmJjbGFzcw0KPiA+ID4gPiBA
QCAtNDA4LDcgKzQwOCw3IEBAIGRvX2tlcm5lbF9jaGVja291dCgpIHsNCj4gPiA+ID4gICAgICAg
ICAgICAgICAgIGdpdCBpbml0DQo+ID4gPiA+ICAgICAgICAgICAgICAgICBjaGVja19naXRfY29u
ZmlnDQo+ID4gPiA+ICAgICAgICAgICAgICAgICBnaXQgYWRkIC4NCj4gPiA+ID4gLSAgICAgICAg
ICAgICAgIGdpdCBjb21taXQgLXEgLW0gImJhc2VsaW5lIGNvbW1pdDogY3JlYXRpbmcgcmVwbyBm
b3IgJHtQTn0tJHtQVn0iDQo+ID4gPiA+ICsgICAgICAgICAgICAgICBnaXQgY29tbWl0IC1xIC1u
IC1tICJiYXNlbGluZSBjb21taXQ6IGNyZWF0aW5nIHJlcG8gZm9yICR7UE59LSR7UFZ9Ig0KPiA+
ID4gPiAgICAgICAgICAgICAgICAgZ2l0IGNsZWFuIC1kIC1mDQo+ID4gPiA+ICAgICAgICAgZmkN
Cj4gPiA+ID4NCj4gPiA+ID4gLS0NCj4gPiA+ID4gMi40Mi4wLjgyMC5nODNhNzIxYTEzNy1nb29n
DQo+ID4gPg0KPiA+ID4gLS0NCj4gPiA+IC0gVGhvdSBzaGFsdCBub3QgZm9sbG93IHRoZSBOVUxM
IHBvaW50ZXIsIGZvciBjaGFvcyBhbmQgbWFkbmVzcyBhd2FpdCB0aGVlIGF0IGl0cyBlbmQNCj4g
PiA+IC0gIlVzZSB0aGUgZm9yY2UgSGFycnkiIC0gR2FuZGFsZiwgU3RhciBUcmVrIElJDQo+IA0K
PiAtLQ0KPiAtIFRob3Ugc2hhbHQgbm90IGZvbGxvdyB0aGUgTlVMTCBwb2ludGVyLCBmb3IgY2hh
b3MgYW5kIG1hZG5lc3MgYXdhaXQgdGhlZSBhdCBpdHMgZW5kDQo+IC0gIlVzZSB0aGUgZm9yY2Ug
SGFycnkiIC0gR2FuZGFsZiwgU3RhciBUcmVrIElJDQoNCg==


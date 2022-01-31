Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D66C433EF
	for <webhook@archiver.kernel.org>; Mon, 31 Jan 2022 07:01:59 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.70])
 by mx.groups.io with SMTP id smtpd.web11.29312.1643612517018384646
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jan 2022 23:01:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=y/QVwWjb;
 spf=pass (domain: siemens.com, ip: 40.107.8.70,
 mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EY5m4bQf6pRAlUpFgPfjO0IMSVMYb7Vb7R1DwAsJrzgGOGB6wRkHQpKwPa8xoxqxT5KLd1eCPfgwkJ5shecmoehyNrKGkF5sAhRjgEuosk/sjiqwG5VymaM3X+jMRtQDBxQgwJXI9oh593bMLLLpAp9D4ITdZxgtsFrdaLEIxgNxGhFheQ4IaUaRkpKZ9qsXUletuYc/wClL6pcXc5P/vnYHhhWnUh8PoZY3/4KOClEcYVVauaNy9IP9ulWkO7/6yYwEvN5EetRhflF7Y3Gs8sgaEFodotLl2DPB20tDVEZXWxnDeNDdB8ncbQRyFfJgFe/1qmB6PK3TyTwS0QAAFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HbLLvyLge+JkJWp+lV4NT/M8n3hdyXO1LNkBcZftNU=;
 b=MsO+qVpBIXYVd1hzwtvHgTt68T8RSW8aur6YbfZXzorkhb8LoUY/s+DYRDY9c5NDY8S7Te7Yt9fegsd1XEjAcaUIEGwuN2h5DZsfRurJv9Js9bBjN0scIcw9k4izn5j9X7pzvjqGxI8dr46s3cWwWYgCPrLKwAik3lkpSockmQOYb6UVn3d0VF7XS6kG7OM3ju3SlgULnjpZwoSVxzEZi0f3GuvYqmhQRKaP7GzYtKkEAsijixms7nWlY0pW3mtHJfnrPW37jFsXFjJJZI3iLhm484AgKD7oz6nig3b95lRIm6Cn7gwnkazdnZqCZByieONIIZxvkOy9BE75Xlhe9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6HbLLvyLge+JkJWp+lV4NT/M8n3hdyXO1LNkBcZftNU=;
 b=y/QVwWjbOMJ7aD+nwadYkZ6XDigmZxKlatgcfxc43LGxTrkK+zcUqgTCxvwGjZOEQYzNO1iQWLYSshMh8HORUuZyJqgwgjyOyEuMSN9Tkav6n0Qyxld5GuwVOY+GFveSL6P79+Qj0xSK7i4rgJURuQ1+1bQCJ7jdt0qr36iJ/JPGrYGSBa2mdurM89f9uhd2AeCYIx7xtJnaaJLzsaEA5Yq0I+WGp8+lJFyAk9/PWmXiVzWCgMVMlDjHeSZeMapUMtCvgmbSnQ6T72IckLqjjUO60vv9TWQ4fEs++U4Xf0oF0nrnlAh4cjwiXWJ2YqAHuOhWzwMQAMm2yK2CgEREhQ==
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by AS8PR10MB4997.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:402::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Mon, 31 Jan
 2022 07:01:54 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a891:c3c5:9b77:c2da]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a891:c3c5:9b77:c2da%3]) with mapi id 15.20.4930.021; Mon, 31 Jan 2022
 07:01:54 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "marex@denx.de" <marex@denx.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "peter.kjellerstedt@axis.com"
	<peter.kjellerstedt@axis.com>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] Revert "featimage: refactor style"
Thread-Topic: [OE-core] [PATCH] Revert "featimage: refactor style"
Thread-Index: AQHYFKdFKazkG8IFIU+R02wKcIxavqx5L5cAgAAJAoCAAAZAgIAACdGAgANu4YA=
Date: Mon, 31 Jan 2022 07:01:53 +0000
Message-ID: <c864b18a0e354116059c25ddf03096c90cf8bbca.camel@siemens.com>
References: <20220129002907.84534-1-marex@denx.de>
	 <93bb78f01d7c44c1b5918e1576f2a804@axis.com>
	 <315161c5-6b68-2b4c-37fc-3d10459fdbf8@denx.de>
	 <53514b34002e424584e20150b6b725a7@axis.com>
	 <cd82c692-f11c-0e1d-4b53-950121e0b3bc@denx.de>
In-Reply-To: <cd82c692-f11c-0e1d-4b53-950121e0b3bc@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-2.fc34) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab844d40-9c74-42b8-3f3c-08d9e487905a
x-ms-traffictypediagnostic: AS8PR10MB4997:EE_
x-microsoft-antispam-prvs: 
 <AS8PR10MB49975E0BD13E3F008834434B92259@AS8PR10MB4997.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 JyuTj2z4Zlne/q3NnRWjInIcVztn56t3nF9lxocm2xgtmct9Fh68X3/lOOr+QEoraczkGTiaIdiBus4ycqI9+7f5tnhOhprshcGJMN+lAQPWyJoXeD13is4/sVTU3ELiwY4eVwZKDt8BxM1ER4djkF/7r75242nOmly/PCVJE0Lq0i+HadX0CgDf/M/CGcKVRezA5XKfN7cczWG3/4N/fPDJg3Z4+KV1ZVBYYQ2KfMtWYnJQ7uFy9QJqUeU3yDM/ORp4z5CsAMOhcT6BS6BEFSd16M0PIVpnjeJjn5XuKysqtm9j81oHh5qurNrvGLXyycxv2SJzk2WzD4lxndF/I8Xilc8DI/hcMa22mqulldSkpwwTYZ69ffORyM26KLHrCid48oHLHsL1TezcDgBMGCcAMuIwF3TFrlLXczIUH0RmNXxToKiGkIINpAjAKlxiEo0hkaVDR4XS425G0ytWFzhtEGYJW3bbhVQg/t+3DNhQNIqTNibIDXEn//aSNN3+F6O1Uqt0M6m7IjqjzdaNsOtQY8o0BQUv3cCNqi243sbaeZvkarmr3IS5DpUpkk/27So96X5ElVhujL+m62GZShPAcf81pXQ9f6wkqUWPRzoyCFPvzPu14EvWXOuVkQeo2jnIumRlMz2VRNvGB0XfNDymKteQ1sUjWZMKsKdmHfvh19S6xzULm/KuUyQcdH1A1r8Y7L74cRfVdH/60YHdIg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(82960400001)(122000001)(86362001)(83380400001)(6486002)(508600001)(4326008)(36756003)(316002)(38100700002)(76116006)(71200400001)(66946007)(91956017)(66446008)(64756008)(8676002)(110136005)(8936002)(66476007)(66556008)(6512007)(186003)(5660300002)(6506007)(53546011)(2616005)(2906002)(26005)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ME1vU0RDSHpzY2ZNaTcvL1NzdDNvWmJGTWR5OGNJdmRlVEhBajNaSVRzOWZ0?=
 =?utf-8?B?UGlCSzZoMU9OMkYrNVFCZkQ2MlhVOGVVa2F1N1B3T2hLOStaVWtOK2dYSXd4?=
 =?utf-8?B?RVgwdnF0Wm1qMnpmcURuMVBMRytnUUFsR0tUaklxdDl5d3YxNTdqSWxLNSth?=
 =?utf-8?B?U1E1RDhhc25KSzE5d0lEMEl2c3dwbEV2Yzg5QXAvTGNYNTZCL05tMTMvV0Fw?=
 =?utf-8?B?ajlLYWtROEtmTGV3K3RTRHp2VGs0cmtjV2dEWFdTSjJ4VjNCcS9RRzdVZGNv?=
 =?utf-8?B?Yk5sV1B5a0JiNmxWa0NjZjRKdVF2ZC9XRUZWZU9VcEt2U2kzUWtxeko2S3gy?=
 =?utf-8?B?T3pPemJRYjY4SE5QejRIUEdtM2JvWmh2NEpFRHY3dlYyMTVlVzRZODI4MmN4?=
 =?utf-8?B?eis1VnZncFI5TUVUNVMrZGhRZkp0SnZSWURGcld1bXZaK3Vtd2FkUlF5cnpo?=
 =?utf-8?B?bDEwSUZTcXZDenZUMEJyVTZ4MFNTZnN5UEd4TXNTKzZIZzZ4QnVSRFBUb0tM?=
 =?utf-8?B?MXZLZEE3bmYxL0hZZTNCRkNSLytWbHBYa3gvOW1lSmlQK2pTZFpoc2txQUdp?=
 =?utf-8?B?akROU2VhUmoxOFNDU044bVBneVBlcTZPNjVucjRzQ2NWbEgvZlBpaUtmakxl?=
 =?utf-8?B?Q3ZiVDh3MTd6V1pwN1dTQ0liVEhiaVVCaGZWQzM1N2JpcG1uWXd5STdaUjJy?=
 =?utf-8?B?LzdvbVNlaFRHcndpaFJHV1ZsSFBGNUx6aDFPY2ZJUDR5c2luVjJIR0hNeVp3?=
 =?utf-8?B?ZmxOQTZDN1o3dHJxKzRyY2FjVDNFNjZoL05iNi9sTWQ1M3RteHp5Tlc1ZjE0?=
 =?utf-8?B?aFk2MUtFZ0FMamJvc0dXL3c4T2VsVmY4VzE3U2dyeWJFc2NRdU1YcWljZk5t?=
 =?utf-8?B?aTNRTVFFdFhpMEExdDdqTmhtTzNRZzV2dUZxMnRaSDJzb2hwZ0NoaEllYkp1?=
 =?utf-8?B?K2REck9VYlZzL0hlVHFCMzYzUzNRdFRNcFNOeVUvNmlucUFRem50Y0Nvb3FE?=
 =?utf-8?B?eGZRNFhRc215dWRjUEhIZ1ZRWU5YZDFPM0M0VlM3a09JaVpLbXZPYWMxNVhY?=
 =?utf-8?B?bnlBUFhuVlVUNzRQWjEvdkNBSG43Q05xakZhYjhtVyt3RTNXVktMLzVDWW9U?=
 =?utf-8?B?eFVwREpUWG56QXorTXZocFRCaGVuc2l3c2JlZlNHTWkxNEJIN2VBZGRRQjNI?=
 =?utf-8?B?MWVoNVJaU1luY2piZzhOaUNwTEY2cXRBaVNNaFpGdzFUc2w2UDdCdlRYWkZW?=
 =?utf-8?B?SmFIbXg4dmVBVnVKcnFwSGx5T29UQWtaVERibC9qa3VSdzhwMGd4VjU4OE5t?=
 =?utf-8?B?bVpYaWM5Unl0d1Q4R0kvS2cyTDB1ajBJKzFiU1Y4WWU2dHZSUmNDR1ZEaXNk?=
 =?utf-8?B?MmREM2QyNCtNTkpWeTUxZHU5YXVPWmROdDRtTGYxSWtTYlljZHhpckR4bjZT?=
 =?utf-8?B?dFNxM3N3NVlmWHJibUlwNEI3bWRGZkdNMkluTUIrVGV4aW1SbDBEUXZ4c0lS?=
 =?utf-8?B?NlBnTVZkeHlRdDZsQitqRExCQURQazdoYnprdnNLUnZSZVNERW41c1g0N1Vv?=
 =?utf-8?B?TFF6NS8yMXBVTUdjR1dRbG00UnhOZG5EVmwzSGtJS0lXZEJOR2dRcUZuSGxh?=
 =?utf-8?B?MlRGcUNZbmZsT054YjJlZjJHU0xQc2JjK3JOYjJoZlpmd1ZWUlNaRHRleHE4?=
 =?utf-8?B?Q3MvQnV5ZGFYaHdvN0NMS3lWZWxQUkpuVDVPMmdScU91RTVoOHV5MS9vMVlI?=
 =?utf-8?B?enF1SEZQQlc1QzhqU0F2MGlrbWtRUXBoaFprbHdkZ2cwS2tZQjROdlZwVUZx?=
 =?utf-8?B?MEY1VzRPaXN6RXpOQWlRTmYzSW5USzRpdlVDTFgvcExuWmVWVG0wdDZLL3F5?=
 =?utf-8?B?NHZNMk84SlF5a0tnNVdmYnhQclV5YUpLSXJoSGg0YVljakFsOEF4eERlaEY1?=
 =?utf-8?B?emg3VU1yOWhCVkswVkczTkVneE5PaUczN0FIYjJaWENVZFNKSWRkQ2dlMitG?=
 =?utf-8?B?blVMZ2ViUzdkYk83b2FoN09jQ1BnU01TSTJCUGFjTHJxSWlSR0ErQ1BnQjVj?=
 =?utf-8?B?Y1BsaXVLY1k1RlhrcWFKMkMyYXU3NVhWd253T3hsa3JBVC9jUkxveWFyaVZ1?=
 =?utf-8?B?aVpMKzhuNG5WZCtqcUQrak5nOVl3OVMyT2lnTEtpb3RLTFdNa2hRSExkY2kr?=
 =?utf-8?B?ZGMzLyszcmVXdGhabXo4V3dKTitlb0xlYlNtMVFOT3ZqbVppTlZQUk1weFM0?=
 =?utf-8?Q?fQ2qKCWPYqerKgWq3Jr393Z0Mm1GkeKzS1Q9196GoA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0C33A916AD49294FBC8F085C9D4AC9C2@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ab844d40-9c74-42b8-3f3c-08d9e487905a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 07:01:53.9437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 0Nu1GukgPAcUzFP4u4A9cagSINiwV6j5H6QxKaP4toDbndv2jqeYcXJgreK8A5JMjCS4xWgjzNkqM5C8rb95rq9CCjxJwJdsPDYSc2WUrjI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB4997
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jan 2022 07:01:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161117

SGksDQoNClNvcnJ5LCBidXQgcGVyc29uYWxseSBJIGRvbid0IGxpa2UgeW91ciBpZGVhLiBXaGF0
J3MgdGhlIGJlbmVmaXQgb2YNCnJldmVydGluZyB0aGlzPyBJIHdvdWxkIGtlZXAgdGhlICR7fSBm
b3IgYml0YmFrZSBhbmQgJCBmb3Igc2hlbGwuIFRoZQ0Ke30gaGFzIHRvIGJlIHBsYWNlZCBvbmx5
IGZvciB2YXJpYWJsZXMgbGlrZSAkYSR7Yn1jLg0KV2Ugc2hvdWxkIHJlc3BlY3QgdGhlIHdvcmtm
bG93IG9uIGFsbCByZWNpcGVzIG90aGVyd2lzZSB3ZSdyZSBicmFraW5nDQp0aGUgInVud3JpdHRl
biIgcnVsZXMuDQoNClJlZ2FyZHMsDQpBbmRyZWoNCg0KT24gU2F0LCAyMDIyLTAxLTI5IGF0IDAz
OjM2ICswMTAwLCBNYXJlayBWYXN1dCB3cm90ZToNCj4gT24gMS8yOS8yMiAwMzowMSwgUGV0ZXIg
S2plbGxlcnN0ZWR0IHdyb3RlOg0KPiANCj4gSGksDQo+IA0KPiBbLi4uXQ0KPiANCj4gPiBQZXJz
b25hbGx5IEkgZG8gbm90IHNlZSBpdCBhcyBpbmNvbnNpc3RlbnQsIGl0IGlzIGp1c3QgdGhlIHdh
eQ0KPiA+IHNoZWxsIGhhbmRsZXMgdmFyaWFibGVzLiBJdCBpcyBqdXN0IHNvbWV0aGluZyB0byBn
ZXQgdXNlZCB0byAoSQ0KPiA+IGFsc28gaGFkIGEgY29sbGVhZ3VlIHdobyB3b3VsZCByZXZpZXcg
YW55IHNoZWxsIGNvZGUgY2hhbmdlcyB3ZQ0KPiA+IG1hZGUgYW5kIGNvbW1lbnQgb24gZXZlcnkg
c2luZ2xlIHVubmVjZXNzYXJ5IGNoYXJhY3RlciBzbyBvbmUNCj4gPiBxdWlja2x5IGxlYXJuZWQg
dG8gdXNlICRmb28gZXZlcnl3aGVyZSBwb3NzaWJsZSByYXRoZXIgdGhhbg0KPiA+ICR7Zm9vfS4u
LikNCj4gDQo+IHF1aWNrbHkgc3RhcnQgcHV0dGluZyB0aGUge30gZXZlcnl3aGVyZS4gVGhhdCdz
IG15IGNhc2UuDQo+IA0KPiAod2Ugc2hvdWxkIGxpa2VseSBzdG9wIHRoaXMgXiBkaXNjdXNzaW9u
IHRocmVhZCBiZWZvcmUgaXQgdHVybnMgaW50bw0KPiBhIA0KPiBmbGFtZXdhcikNCj4gDQo+ID4g
VGhhdCBzYWlkLCBJIGhhdmUgbmV2ZXIgbG9va2VkIGF0IHRoaXMgY29kZSBzbyBJDQo+ID4gaGF2
ZSBubyByZWFsIGlkZWEgb2YgaG93IGJhZCBpdCBpcyBvciBpc24ndC4NCj4gDQo+IFRoaXMgcGF0
Y2ggbGlzdHMgcHJldHR5IG11Y2ggYWxsIHRoZSB2YXJzLCBzbyB5b3UgY2FuIGdldCBhIHByZXR0
eSANCj4gZGVjZW50IGlkZWEgZnJvbSBqdXN0IGxvb2tpbmcgYXQgdGhhdC4NCj4gDQo+ID4gPiB0
aGlyZCBhbHRlcm5hdGl2ZSA/IEkgbWVhbiwgYmVzaWRlcyByZXdyaXRpbmcgdGhlIGZpdGltYWdl
DQo+ID4gPiBnZW5lcmF0aW9uIGludG8gcHl0aG9uLCB3aGljaCBtaWdodCBtYWtlIGl0IG1vcmUg
ZmxleGlibGUgdG9vLg0KPiA+IA0KPiA+IFJlcGxhY2luZyBzaGVsbCBjb2RlIHRoYXQgaGFzIGdy
b3duIGJleW9uZCBhIGNvdXBsZSBvZiBodW5kcmVkDQo+ID4gKHRlbnM/KSBsaW5lcyB3aXRoIHNv
bWV0aGluZyB3cml0dGVuIGluIGEgYmV0dGVyIGxhbmd1YWdlIGlzDQo+ID4gYWxtb3N0IGFsd2F5
cyBhIGdvb2QgaWRlYS4NCj4gDQo+IEl0J3MgZ3Jvd24gdG8gYWxtb3N0IDgwMCBMb0MsIHNvIG1h
eWJlIGl0IGlzIHRpbWUgdG8gcmVldmFsdWF0ZSB0aGUgDQo+IHB5dGhvbiBjb252ZXJzaW9uIHRo
ZW4uDQoNCg==


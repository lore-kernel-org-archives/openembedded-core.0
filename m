Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C12CDE008
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 07:40:19 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30188.1782459615156521628
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 00:40:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=K1tPMjtS;
 spf=pass (domain: ericsson.com, ip: 40.107.159.48, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sjK83rCEKPVGpCsV1u2kMmOndX+2cBWfpu+vgNTAfvrQa3GlZVVs/PeIo5k6OJ3uuRRSORVbrEVpbkf6EzVRq+ZsUjI+cZ8/t0s0i7agih8++rAC30RH4ZylOctLzzY2ORmbQghL2atDNhtbp5M+fJLeDqnuOfkoDveHOwV4Q+SFzOXlj9SqC/+adgwcCpXUw2Dn9rUvw6Uitqjuu03buk+jjDmk8AaFJpi/bbI70Umuc40AtK/VEQjKDsQyJLW7KRey1xutVa5wyI/oh0Mx7dnJ/Gg/oZxjhojLB3aqk2YGEUZkPNs+UvGhd1nQd+c1lu6FJsfrySm5w8kSUtPZPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FwQjpdKg05wXBG/cL0LPUrIZ8hbbq/bI9YIzWGtDwio=;
 b=md3tSEUBKRgILWtkRi2VTqSA4uvKIsjqWUk/oP4TESedHlnTNqgcXGkMdICh9bvi5nRcT5QVIh+JTJ7M6j/JhQhLzme50EuwPGhQ+Wo3eH1HLs6V5VmXHMj69gfM9XMqUXmz+F0UPLrviYtucseCiLLlwlbwzSLCnnI9Orii21rSNzssvruBIciKKPQsTVeZzMSQFmwe8n7C5wE0T5JkCu/I8I+bO4rlKHNjmenZSaCpmpeLiskcnVE0ysOHvDKSWAq528UD+DEgsZHO2g0eBTqku8AY2tB5JXp4jREAM/E4qbNA/YSnwy8pa9y1DpbiaHGWDfYNpjUZKv9PeizCGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FwQjpdKg05wXBG/cL0LPUrIZ8hbbq/bI9YIzWGtDwio=;
 b=K1tPMjtS8Q/siwdwLJBzAEiokJ9RBQZgNAPr247NwizIl8s11A/wRt98yQt4YlkhuXnO3Viuyyg666Hs1K6UaxNwwnzAmSYnZpOKv+i4TRoKPuDKEBC1K+b0ccsz2sXmFoz3GNiSFGIUIhxkI6hfc7THK3oEcpsoxxwx12FrA0fcJ2CKoqLoOR4SbGlJdUKFpM1vkSNgvLiVkiTrzZ43KOuCE1ZUx7MNkauh46TVF2i9skKrtgoGWWIIk65Kx4YFL35WyuJ6EF2lVDHAWSC8OBQnd3+g1HZ9mrgP4jPfjmdXPSl/N5MMQJdbwPhX5JF50p0eWlQwbUez+Ywoc10xtw==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by VI1PR07MB6398.eurprd07.prod.outlook.com (2603:10a6:800:13b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 07:40:10 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%7]) with mapi id 15.21.0159.016; Fri, 26 Jun 2026
 07:40:10 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "qi.chen@windriver.com" <qi.chen@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"anders.heimer@est.tech" <anders.heimer@est.tech>
Subject: Re: [PATCH 2/3] systemd: upgrade to 261
Thread-Topic: [PATCH 2/3] systemd: upgrade to 261
Thread-Index: AQHdBKh8qpSGMSqasEqKNBU1HbkVvLZPZsaAgAAB1mWAAAMDIoAAFrSAgADyYoA=
Date: Fri, 26 Jun 2026 07:40:10 +0000
Message-ID: <c1d9ab79c1c4cee2a7a9e7af34f4afdcb7a8b7b8.camel@ericsson.com>
References: <20260625134210.4046622-1-daniel.turull@ericsson.com>
	 <20260625134210.4046622-3-daniel.turull@ericsson.com>
	 <CANNYZj-YEH6Nbk5A+ste7RNa0MyATwFZHO91Q1iC-+Qaf50JYA@mail.gmail.com>
	 <PA3PR07MB10721D0B5720F489999AF31FE8AEC2@PA3PR07MB10721.eurprd07.prod.outlook.com>
	 <PA3PR07MB10721EC942E3A6F2418A9953F8AEC2@PA3PR07MB10721.eurprd07.prod.outlook.com>
	 <CANNYZj9H=r7hScOW3+dn3jeD2ek=fpm+ghLDdziJ+8Lvt=FGAg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9H=r7hScOW3+dn3jeD2ek=fpm+ghLDdziJ+8Lvt=FGAg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|VI1PR07MB6398:EE_
x-ms-office365-filtering-correlation-id: 61037a5e-26d8-4ee6-0f25-08ded356269a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|4143699003|22082099003|18002099003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info: 
 epVoYe/M84GXS/HuvWEy5odisYH33TKHabt8ZVCs3UeXf19AR5smpmXXXPVOnbx7YR25adqJsmOOBzaHTor+xpx4NDLrGflw2mJWGaNnErpwu4c86GTkSW0BMj6xbAXoYU21QIFTDWTP8WKnhhWFYsiNk4wC5rCNnIolA7T+UpJzcgWLjGdEpVu6FwmW8UDepeipTnoZC/g/zEDBvC2F4rGA2xK28E9t62NkzfyidmtOmwG95I0+/LhGI+v5GjjZGZmyqy3iWZMSqDEKE2I0zSLlBRh61ItEpGqQS9rwVE8hwi/T1E0/AEs6iauQOTeUlc8YdMxsoBhnOT08CxLdjPLoCNiJvbXDRQKSmp7U3O1r3RilhNTDyj86IbgEATIxvvt4Wm/+tYGpgLQiu+dO+SEdRsbESpOmUAySw+zoaC4rbuJKoBVAaUnX93XFA+tewee4dbeTA6CsA6WX5PxtaVCVLWVtjlivsbXvlco0H8yUH1ZFcyh8h1NCslRd34zHr8/RKp+3GF3/G3otL1T14e4dlMu64kOrHneLN9nnMVAXK5+RzXxQ+ZJrS9Mshsv5iroffaMkat9RpdjqyStbtEAkvriOmujtsuQxRIuv9xeBgp7D+JvoZqIS2zrqFPEazarBMMeHnxhgVqdy0XnTK1O9jdvgtcx3fak8wbu3y6PKOiP0YINlnZFuKVH63ErxM5hNXMG58UhhfEDW2EHAmK8U+gqJZkjwd99JhxHVJ7g=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(4143699003)(22082099003)(18002099003)(56012099006)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NU1Camh5dTI0endiY0U3a3JyYUJzbmttMUU3Sm01VC8rTlBLU2QzNlIzdFh4?=
 =?utf-8?B?N0ttZHFKbkxMaG5EYXRtUW54N0toclNWc2dsZUUyVlpZL2swS2Rrc2dUYTZL?=
 =?utf-8?B?ekM2U1A4Ni9selhuMTVObTRza2YzSHRDNTBZZkQ1UTVQbHJNWUNNRGczWlpV?=
 =?utf-8?B?VldtUDVhTW1Ed3hVOHg3aDVHQVdaMFRpU2NPWWloNnhDaWdpWG9XK0l3OUIv?=
 =?utf-8?B?ZUJOM0NEOVNHaW1qVnQzUVBMQjFON0VUczFpKzUxWENadm1TNEcwcDhZeFZR?=
 =?utf-8?B?aWFCMDJCeEJoVEZ1TGs3OXVoaUZwMXplKzVCK2xwWjF4RTNMbjZlTllGd0F5?=
 =?utf-8?B?WkFxZTVDK3RJWGI2cHJzL21NRk16bFZ1a0UycHhsU29qTDA2VXRZWEhBaTVV?=
 =?utf-8?B?bEdrelNEZjk1ZGFFRFZrRWwwRGpxTkF2QU5RbFR0QVJPL0pkVFRzWHdJOGx6?=
 =?utf-8?B?K09DQlNEQ1NBT2pqM29ablhBZ1N5NVFaRVNLQUU4R3RCTVN6bjd4N0F3RkFz?=
 =?utf-8?B?eDJLZ283VTlnQkd4RG5yV1JjY3J4V1k2Y1dCMzIwMHdFTjEzci9FcWMwTDJW?=
 =?utf-8?B?UzBocjBZbDJMMXNYU3pkcndwU2IwRCtIRTFLS2ZvY0NqNlNNODRpV2NKTllK?=
 =?utf-8?B?d0JZbG5KUm1rMUdSYlNTcmQ3UFdRRkxNWU8wRmt1b0tYalJDMU5pUzhTSDNt?=
 =?utf-8?B?MW1wZlZhWVdibGRHZk9aRmVPTFpGVkRpVmozeUU0RTU2Tk5GM3VNaFpOakw1?=
 =?utf-8?B?M1BabUkxM0MybVd1UDZkT1dlc2h1b1hhZFpkSzZteFlMYUltK3pRZ0FLZjlr?=
 =?utf-8?B?dVlFcVhzZ21rbTl5MklRdU1XYWtJL0xhWktmc3JGTFlubGRkQlRtaytnRGRS?=
 =?utf-8?B?dHB6OFgyUE1ua2NreVg2SHBxcEMxZ0VQSFZMdXU2Ty9ZVXRrSzBhWnZPcWZ0?=
 =?utf-8?B?TmdDTUp0MVQzU3dsM3RsUlVNZ1IwcFNvQk5nTm1aS0Y2SUhxMXNqZ3ZpSlVD?=
 =?utf-8?B?ZjFkSkxyK01nWFA0Yi9nNVRycE1DZnc0dVcwaHJybk4xeGVHK0FDV09Kc1V2?=
 =?utf-8?B?VDFkcmxJcDdnVGNiOEJ3L0NtcGk4azVTSEJHK1Vzc1BQaTZPZytzOUFNYlk0?=
 =?utf-8?B?TU9kdE1xT1lsamZVOVduVGFWYlRvajdrR3p5MFl0ajk3S01uZWhDWFFEdzJ5?=
 =?utf-8?B?RmhacUUrTU5aWmVvL1prUFl1djJNaSs3dHJ3aTFRUmI4Y25TaW9JREtRK3NC?=
 =?utf-8?B?NmZWR2t6WnlmMG5VMUdaelBXeVVvZzZZOXA5Q0tPVjl5YU5Wck1lTGFYNDFN?=
 =?utf-8?B?R3AwNmdKMEFtWDVEKzlNekV4ZVZuc3dJTHBkQlB6dVJCMWFkM0E0d21iMXg4?=
 =?utf-8?B?czY0elhUL1lDK1Q3Mjl1cU9zeWN3aXhpL2psMnRkZUNMbnhoYnUrNFNZTExK?=
 =?utf-8?B?RDk1WDBBc1hjem1kTVBmY0E3ZlFZT2dlOEwybWxtcnliLzBmd2VHUmJ3YXhW?=
 =?utf-8?B?VERaN2RTQ05tZ3pWVG14ckNLQkxMSTJJaU5jamkycGZKem1xYXQzUDFES2RW?=
 =?utf-8?B?bVpHakU1c2krVE5pL0RCM3VuNEU3M3RmbkRFTm94bE1hL2VuOXkrMWVsRDZE?=
 =?utf-8?B?bGZGUnpteHVGZDNJbDNwOXpJclo1MUtpdkFpL0ZqTkVqS1RTMCtxc3R0ZWNS?=
 =?utf-8?B?T3RCSndJSWxaQWtmdVZ4N0RxSEFQNFRhWlJYQVFQTVNpYWtKR1gxN0FGUTJ2?=
 =?utf-8?B?R0NYMjkxQ0lkejZRQmZQV01sTFdMV0oweDllOGU0OUFWZCtReVJydmFYT0tr?=
 =?utf-8?B?Qm5vS3FNcGE3alFjYm1waTNGeWh5YWRJd2NzeE5mazZyYUZ6ckFRU2hXdDNq?=
 =?utf-8?B?Q1FhNlFFODRRa2FsdUFveGZQWVJ3OHFvVUN0WU9Pb0E4VjFaMTBzdjZ2Mjhu?=
 =?utf-8?B?Q1hMaGEzTTVDblRzdjVvVzJJVlVEM3FnMXhFM0gxQ2hac0tZK1NpcVNBTitt?=
 =?utf-8?B?eVE5U2hjOFNlR1dBck1SNExld0NyWlVtSC9jMFptMkpWS1o4bzNYc2ordktB?=
 =?utf-8?B?SnEzR1ZHMFM5clVBSDJOcURrekU0ZXZiN2ltL3FFK29UUlVmeUZOTWpSME03?=
 =?utf-8?B?WUdxSWFoWWF3VEhDL1ZIS3RZWGdxRFdCVDRWYklyRW53ZlNFSi94ODQ1VnR2?=
 =?utf-8?B?Q3paa0pkdUxLTWFqck9JdE1tdnhEUmJXSlR4RkQwWDNxSDFDK0pjRFlzdmxy?=
 =?utf-8?B?RUtCSFF2dEZ2TFhLRnhPRUtydmhQOThsOE41ZkVuK0ZpZmo1UlNjL3R0YTZQ?=
 =?utf-8?B?WGVKMWg0bUFNYlppRXlWcURrUFd1WWNpT01UVlNDSHg2WGE1OUNoMTYwSi83?=
 =?utf-8?Q?71y1OyWzuGJEzjQ4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5D018C694CE30C448F39A235E680F9BE@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61037a5e-26d8-4ee6-0f25-08ded356269a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2026 07:40:10.1350
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W2tu63IvhgaFLrfF/gcG7S3geFlR8QyIelF+EltF2095oMNspuPY0NGybbQvXIExlqTalIxtzGuu+2YewhTetV4NUjECmmOyePFdj2MPMMM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB6398
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 07:40:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239613

T24gVGh1LCAyMDI2LTA2LTI1IGF0IDE5OjEyICswMjAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToNCj4gT24gVGh1LCAyNSBKdW4gMjAyNiBhdCAxNzo1MywgRGFuaWVsIFR1cnVsbA0KPiA8ZGFu
aWVsLnR1cnVsbEBlcmljc3Nvbi5jb20+IHdyb3RlOg0KPiA+IEhpLCByZWdhcmRpbmcgdGhlIHRh
ZywgU2hvdWxkIHdlIGFkZCB0aGUgY2hlY2sgaW4gdGhlIHBhdGNodGVzdCBhcw0KPiA+IHdlbGwg
c28gaXQgd2lsbCBiZSBjYXRjaGVkIHRoZXJlPyBPciBpbiBzb21lIHFhPw0KPiANCj4gSXQncyB0
aGUgZmlyc3QgdGltZSBJJ3ZlIHNlZW4gaXQgcmVtb3ZlZCBhY2NpZGVudGFsbHksIHNvIEknbSBu
b3QNCj4gc3VyZQ0KPiBhIGNoZWNrIGZvciB0aGF0IGlzIHdvcnRod2hpbGUuIElmIHlvdSBoYXZl
IGN5Y2xlcyB0byBzcGFyZSwgSSdkDQo+IHByZWZlciB5b3UgYWRkaW5nIHRhZz0gdG8gcmVtYWlu
aW5nIHJlY2lwZXMgdGhhdCBmZXRjaCBmcm9tIGdpdCBhbmQNCj4gdHJhY2sgcmVsZWFzZXMgKHJh
dGhlciB0aGFuIGxhdGVzdCBjb21taXRzKS4gVGhvc2UgaGF2ZSBiZWVuDQo+IGdyYWR1YWxseQ0K
PiBhZGRlZCBvdmVyIHRpbWUsIGJ1dCB0aGVyZSBoYXNuJ3QgYmVlbiBhIGRlZGljYXRlZCBlZmZv
cnQgdG8gY292ZXINCj4gMTAwJSBvZS1jb3JlIHJlY2lwZXMuDQo+IA0KSSBjYW4gcHV0IGl0IGlu
IG15IHRvZG8gbGlzdCB0byBjcmVhdGUgYSBzY3JpcHQgdG8gdmVyaWZ5IGl0IGFuZCBkbyB0aGUN
CmNoYW5nZXMuIEkgaGF2ZSBtb3JlIG9uZSB3ZWVrIGJlZm9yZSBzdW1tZXIgdmFjYXRpb24sIHNv
IGl0IG1pZ2h0IG5lZWQNCnRvIHdhaXQgYWZ0ZXIgdGhhdC4NCg0KRGFuaWVsDQo=


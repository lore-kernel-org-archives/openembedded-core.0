Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79151C47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 14:04:22 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.60])
 by mx.groups.io with SMTP id smtpd.web11.16654.1706277861868883229
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 06:04:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@infinera.com header.s=selector2 header.b=pTyWekNm;
 spf=pass (domain: infinera.com, ip: 40.107.244.60, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hiJoNepWgvczFP/vlzpYfMLNSPurOPlQzgKvimuy9hLaKzp1QCXt327DmC94jIj/qbpC4CwpDkTM4D3OCNk1/Ww5Ih2n7ie5vBVdkAmqfT4JnIEy6zd+2WkW059GtUunvE1G50gmBkvaj5gH7CeYaFvp0bdPTXgAuYUxLyggGnwjVO3KfcK03gANQfUr2nWYFId82fxjfcjVomVNCDY7FpHH/B/4gZhRuQyAPPO4F/IM4WuGQLZonvq4GzLciywOWN9c3Yee6UtZRXzsPQfJb3cMeOcP9qFBWK+hneuqFeiVTEg3YxzZrq5E7haf4MbUQyH7WCGi7fRKOcfj1tGK8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6c+JZqbT9Ll/L13xBGL0jsvM+sr1VN5N9tzC6vpgD60=;
 b=dOVYzW/i30qm1AGk6X79kqDFUJvaNOJwLnCUBysxD6iYdRYFAblevFJCCDkghRwNEu05AqdVvLTo9lEvPmpRZTtpe+EzXEjeSamJCtJkOEkaBKObHG6HydtY8BACH53OPH2eQzbf+LPBVVDQ9pFhblYKNrzghoVytdC1L+lBTR2C3TPQPeSnCShOD2ZHxDHZGylpNzmpCfphAQFcS1H26u9N38efvC7n89JKH8zJn6WVOKBb6Nz/HkRDEND1V8WTV/LtSUJ12S+uwvLqmF6U+o7MmUEUfL9JAIZ87kRHE+7DMfoFQ9pjYr13imET8I9ex7TaDqdUVOkfBWXTGCq8pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6c+JZqbT9Ll/L13xBGL0jsvM+sr1VN5N9tzC6vpgD60=;
 b=pTyWekNmOcqQkn2o+7xKhh/9juXI3OjWHEfWbqW4Abr9Tb74WfYcK1poOPep/gNAsrBR/FY5IPEYhFbsS8R9IKscT0xZkc+/KPe1AMN6dFXPL7YY0I6SYdnrYbJBsgmnyX7EfL7z6j9cq7miV+/pV91H04SwYGmZ/gEEH5yEyvtd7PTGfb4qP4CSPA8IE8Zyhk4PBldYwQM6MrGPVCOwQ8gTbIOhStnelnpPj0Uu7X2NZpwLEsDCnfK3ic5RmpUEYksh/RHBaKdthwJvOEpHcaQ3rRaIYvfsLiGCsxySc15XiGQp0evxvqP1xNojkX4AiHaY5sDQ/MZilD6VkPL8iA==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by MW4PR10MB6462.namprd10.prod.outlook.com (2603:10b6:303:213::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27; Fri, 26 Jan
 2024 14:04:18 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::4d76:4230:708c:9eea%7]) with mapi id 15.20.7228.022; Fri, 26 Jan 2024
 14:04:18 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] oe-selftest
 reproducible.ReproducibleTests.test_reproducible_builds appears to hardcode
 important tunable params
Thread-Topic: [OE-core] oe-selftest
 reproducible.ReproducibleTests.test_reproducible_builds appears to hardcode
 important tunable params
Thread-Index: AQHaUEgkMNzCIETAnkmJ7AygmSs1ubDsAvKAgAARooCAAANfgIAACJaA
Date: Fri, 26 Jan 2024 14:04:18 +0000
Message-ID: <1f9e50e96714b8ed49f2e1b62ef769a6d4a32edb.camel@infinera.com>
References: <f2b33f50e7f11903a1b16f9a2f814134da203223.camel@infinera.com>
	 <CANNYZj9Hy670NNEm_vTf8drPuhBWCGtjGbfVvgcnNq_+xgsy5w@mail.gmail.com>
	 <6dc1b2effd68945b83870b24669f9a86eba64515.camel@infinera.com>
	 <CANNYZj-rVN+CNCG6x4VYoPZTcCYwMnhKXzo7kT7zpN9HNvJ7zg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-rVN+CNCG6x4VYoPZTcCYwMnhKXzo7kT7zpN9HNvJ7zg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.3 
autocrypt: addr=joakim.tjernlund@infinera.com; prefer-encrypt=mutual;
 keydata=mQENBFp0f28BCADPn4XzN2HEzkY4BZKE6/T/S4M/Qjlf01K6gmECJZi5LQgOt0jOUAdvsXVd8yKYeqCq+eWvlfrLU9OXPGoCqwj95P2YjMsttqaPBEAnf4XyBs67Snz2wHyBDONoRxGoyq2Ondy+TPicWEm0mh404h9EzKxRNxwrRyKhsjWoVeaucuybAiGbJvqQj0CLmuMCl4PUBYDmXFzt3yx0g54z8E9/8ON+z0J7yZbA0aftZAjFLv6nn0Th/2dpD8d3vWtkJw4yBjLX2KFvlzJfQqkd6RI4Cn1OP9sguXDob123dMiMk/5XbjXz+0C21QFxejxt3HGisvKes+8swplyni7KdiDtABEBAAG0MEpvYWtpbSBUamVybmx1bmQgPGpvYWtpbS50amVybmx1bmRAaW5maW5lcmEuY29tPokBVAQTAQgAPhYhBFtMG/jmfqy7x0aBp4VMQ6CbDpcaBQJadH9vAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEIVMQ6CbDpcasFAH/j64dpHpjY55tVoUg5yK8hcmxS/buKQQP9H3e2DdHeYrK0qeQ97AXiWTh63UvzvEXchiKjua6kYhUUkDObaltmwkKgPv0qb9lP6yfFBzvllriS6LrdIMCOLgtnQW2x28m5mC1hYT08jlqEXluYDoj2dTll9HGMsqn0JkhRjBsuzTXq8VyJjjnNLpzsAlTOGEQoAi7SqtDHs9PSNyOAKH5jRjATdNbPAsTKuI1veJf7Zzyc98yG0ya43Hqal1scoa+9GJZXNQPRaMVkyxKGbEEncdtnQl9e/DUMH4SUQ5vbM/+U4WvkX5Cvc+KwI6JAm1PhrAaVHSkDNAU5LqUqEbbHY=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|MW4PR10MB6462:EE_
x-ms-office365-filtering-correlation-id: a11470ef-520e-4968-e37f-08dc1e77b007
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 /OviRjGp0gO+5R2n9oqpNS5IdFsv7LvOuIVXcHHI1sjroMTlOKOwM6laz+EVptjTU/vhIkr5ynG8tQ/xQgIbG8AR+o94tdsQxJNp2LxTDL5L9uaces+y4jLGxtY9rwagsCu96Rozzzd6HwhAi/BFYlfE/+Gg7gGzHsmRgpWB4c8iS8EyuqJV41LdKMOhApxLIqpSkdmYHNWPhGk7xUwsGZUhOdwi1yOecC8HBD2jmI4VrCUpV6vB7LHvOsxkFRpIVjDYHwMkjxtWUPzNvce4hN1vgMIB9IdYA0TbpzbB1N51TRwrvWGZ2UZJrsPUSvXW2wA5IcEOPJwfB4h8hwNhQ8rK6wHO5bTYOMGXdeCVR9SsYJkzzpM4TalJpGJ2sYCk5FszHqoroldyDTYwgiylemN/+LHoUsSE2sLmVfhIEj9rWKr2lAd99qYjID+oL2Vv4XkDAxl6KQwvC4587/a8YXxHbrE6VpKhr9u41bhO36PxVxP8Axwf3fMddntl+1ctYMA+V5dX1mEjjgPXTuND22XyGVpWVbYoUSAuhT49jTzVGZpcE8SFlwt02Rt0GyC19ghIOJfA+4FAXRxPu8Kuf2q2aHIup62iFJCoMyN/lgw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(396003)(366004)(136003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(66899024)(6506007)(36756003)(6512007)(71200400001)(6486002)(966005)(478600001)(38100700002)(2616005)(38070700009)(76116006)(66446008)(66556008)(6916009)(91956017)(86362001)(66476007)(64756008)(66946007)(4326008)(8936002)(8676002)(316002)(2906002)(5660300002)(41300700001)(83380400001)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MmlYVDMyNm94Um1sRlNBU2NHekhyVURPR1JWOVArdllPbnZCc2loVUtUaE1W?=
 =?utf-8?B?UFZWSmYzVUNlZG91Sjd1bWxtME45WEEvZWVBNVpNQUMzbkpDbkxaQlFhVUg2?=
 =?utf-8?B?QzB3MUNyWEZyTnBib3ZJL0c1SVRoYVlRa0YyRUxsdXlKRCt0aU1tMFNxaU1q?=
 =?utf-8?B?RTlNOE5hbVN5TlVTWW01VVdnclh2cHFwQTVZelEvVURkMmd5Z1BxMjJteGFt?=
 =?utf-8?B?UVlQdUc1aXFReXlmSTUzakRKdnhKMnVaM2RpeGVkRklNTmxjbUwydHJPWkRV?=
 =?utf-8?B?MXhTbXlEN2hpRDhld0RzMEEvcXdmZ2ZjeTRPdGNMaDFieDczUU5IMU8xRnda?=
 =?utf-8?B?N3BxbDhBUXNvVWJmcWlFRXNONjQ5WG5oeURHaXZuQW1UNGdlUWRnMmtrdXJs?=
 =?utf-8?B?d0tabE1UZmJrME5YaHBKeE1TN3R0blBqWjdMMDF3RTB0azFBTExmMVJpZUVl?=
 =?utf-8?B?czRxRXlBb0VvWDZ0aWNsTm9Wcm9UTjhZUXRSTFFUM2NiTVNmTjlwOGlFVTlZ?=
 =?utf-8?B?THo4d0U3UzVPZlZpR29JS0xTaHZwSUtFdS90RFJWWVBtZDJyanY1bkIzR09B?=
 =?utf-8?B?cjJSUXY3OUlCZU1RWTFhaGpKQ1U1Ukc2K0p2bklsRDhEbURnNzJabHBjQnFC?=
 =?utf-8?B?bHQrcE1RbmFzOU45TzQ4Z00zd3NhQmF2cGhxZWJEUnZ1Z3FXVnM0d2FhdUlY?=
 =?utf-8?B?NU1EWEl4WW9lUU1NQ29jaUMxNkVhZG0zWDUyNUw2MWRNOEQ5a2ZobU9Td0Y4?=
 =?utf-8?B?bDgvSldWRHg3dnpEUWV6SFlJOWdGSzhTUzN6RGRjcmVDWlNYNSs2REE2b2kw?=
 =?utf-8?B?SDZmYnRKYUorMkRPODZ2RUp5TGV5aWZhZTdDVmViV1RWN2p0N1lvOGJPWVlh?=
 =?utf-8?B?Yld2Y2xPek9hMkUxWWJ3U1VmazFOTFpwUER0N3REMWhscUFiMHBJcEp1Tmtp?=
 =?utf-8?B?b2hpUU9iZjVUeTN5WWQ0dmZTbUZzc1hOWW5tc1AzVk5pcmtsN1RxeUFBTU05?=
 =?utf-8?B?eEVOMzlFV2dJcUJrN1dTUVZNWnZVS3BmSEZuNDkxeitHbVFFMENDQmtQZ2d0?=
 =?utf-8?B?TzdLcmxnKzd4bGxpT1JaWDk3YS9rLzcxVjlyMWROb1JKY3RNZnZoaVc0YzZi?=
 =?utf-8?B?eXkrM3Jtb2VLcWdmQ1pDbE9zNVhOQUhoMUZVVlF2K1Y3bmNhUEhsVlVHRklI?=
 =?utf-8?B?UVFYQjZvVVFzVVgyZkxvbXY0UGx3SlBRYkVOc0dwQkdkQysrVW1YUUFYck9q?=
 =?utf-8?B?WFpJK0dEaXhvZGQxZnhxVGZvNGRucWpmdW1GcjVNUUhRZ1BFWU1JdlVkUGx3?=
 =?utf-8?B?OWVFUi9vR0RpVDBWL0c0N0pycFp0ejFiTjNNWFpuOUlTaCtDVUxYZWdaSkFC?=
 =?utf-8?B?M2VkaDY2UzJiN1laSmxxMmpmczRYc2V4bUtCVWRTbGY3Vkt0QUV6UDdsclRt?=
 =?utf-8?B?dW50SW5LalZWL0QvSFRoQU9mckFmU2FmWDF1NlBjRStFWmI2MG1hajVlRHlw?=
 =?utf-8?B?eHNZSnJKZUtTTXZtdjF2WERTKzRJQ1M4cTZmWWhUN3BlMXVlZk9WOGlXQ3g1?=
 =?utf-8?B?OFVIWC9lVldyeUdJbTZoUWRrRnB1NzhlbExYTzZSYk1xcWFNTTIyOVFiZnVl?=
 =?utf-8?B?VDBydEQ1N2tTYWh6ek9Pejc0aUo1b1h0S2ZCNStzQlRQWkFibmhUL0ZaNVFR?=
 =?utf-8?B?SzBLNTJNcFFpcTJIUCt4Y0FBamRuTk12V0QyVHh2YlRHWjdTTE5BVnVVTEwv?=
 =?utf-8?B?eS9TU3QrdG9qK21yS0E3eis0K1hWZlZaUnZQUmFVbVYyd3dGeWRJaVZjbm1k?=
 =?utf-8?B?bytXaittcEFlQjloc05XcE1ERkdHVmtRbmNVTGtuVkp2YnplSW44Z3dkQU4x?=
 =?utf-8?B?TndkWHBHMFRuVnRXVHJpVGpLbWNLT3MvNEZpb29zbGpyQTR0SDF0TjBHN2Q0?=
 =?utf-8?B?cFlvcVBJbEFqeHlvTmt1bURCeWlJbTJQQWxBMVR1MnBVWEM4aUtmaC95UGor?=
 =?utf-8?B?Y3NQOG1BZjNBeFY5b2djS0lEZldMMlR0NlVHSjFVQy9ocFRWWDV5ZW5RNk5x?=
 =?utf-8?B?Q1pHMFJoTnJVV3BMWGJCand0ZDNhT1ovRWQrdG9lL04vUFZpN00raERCTGRz?=
 =?utf-8?B?OFRvNVZ5TjFvTGhPS1FvTmNRMlBnR05yMWZwNlBBbFJWU1o1UXRtZ1VXdjh6?=
 =?utf-8?Q?rtxjwmL7+8hINYTBapnLp0jwbd/391HFCurslRCK8PXF?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <80226CDC9944554F933AACDF3EE13235@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a11470ef-520e-4968-e37f-08dc1e77b007
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2024 14:04:18.2477
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FUNodNSd0OOuPg29mQCk4s5xX7n8/7K+6w7ueV+Ee5fJIY30x8irt6VkZ/ZVfcnEmlW0cOBvoc+vCDhrX490bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6462
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 14:04:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194370

T24gRnJpLCAyMDI0LTAxLTI2IGF0IDE0OjMzICswMTAwLCBBbGV4YW5kZXIgS2FuYXZpbiB2aWEg
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gT24gRnJpLCAyNiBKYW4gMjAyNCBhdCAx
NDoyMSwgSm9ha2ltIFRqZXJubHVuZA0KPiA8Sm9ha2ltLlRqZXJubHVuZEBpbmZpbmVyYS5jb20+
IHdyb3RlOg0KPiA+IEkgd2lsbCB0cnkgd29ya2Fyb3VuZCB0aGVzZSBzb21laG93IGJ1dCB3aWxs
IG5vdCBnbyBzbyBmYXIgYXMgY3JlYXRpbmcgYSBuZXcgTUFDSElORSBqdXN0IHRvDQo+ID4gcnVu
IHRoZXNlIHRlc3RzLg0KPiANCj4gV2h5IHdvdWxkIHlvdSBuZWVkIGEgbmV3IG1hY2hpbmU/IFlv
dSBvbmx5IG5lZWQgYSBuZXcgY29uZmlndXJhdGlvbg0KPiB0ZW1wbGF0ZSBpbiBhZGRpdGlvbiB0
byBleGlzdGluZyBvbmUgKGUuZy4NCj4gY29uZi90ZW1wbGF0ZXMvcmVwcm8tdGVzdC9sb2NhbC5j
b25mLnNhbXBsZSBhbmQgYmJsYXllci5jb25mLnNhbXBsZSkuDQo+IFRoZW4gaW5pdGlhbGl6ZSB0
aGUgYnVpbGQgd2l0aCBURU1QTEFURUNPTkYgcG9pbnRpbmcgdG8gdGhhdC4NCg0KQWgsIHRoZXJl
IGlzIGFuIGlkZWEuIEJ1dCB0aGlzIHdpbGwgc3RpbGwgY2hhbmdlIHRoZSBvcmlnaW5hbCBtYWNo
aW5lIHNvIG9uZSBjYW5ub3Qgc3dpdGNoDQpiZXR3ZWVuIG5vcm1hbCBidWlsZHMgYW5kIHJlcHJv
IGJ1aWxkcyBpbiBoZSBzYW1lIHRyZWUuDQoNCj4gDQo+ID4gQnV0IG5vdyB5b3Uga25vdyB3aGF0
IHRoZSBtYWluIGlzc3VlIGlzLCBob3BlZnVsbHkgeW91IGNhbiBmaXggdGhlc2Ugc29tZWhvdy4N
Cj4gPiBXaHkgbm90IGZvcmNlIG9mZmVuZGluZyBjb25maWcgb2ZmIGluc3RlYWQgb2YgZXJyb3Ig
b3V0KGluIGtpcmtzdG9uZSB0b28gcGxlYXNlKT8NCj4gDQo+IFBhdGNoZXMgZnJvbSB5b3Ugd291
bGQgYmUgbW9zdCB3ZWxjb21lLiBJIHRoaW5rIHRoZXJlJ3MgYSBhbHJlYWR5IGENCj4gbWVjaGFu
aXNtIHdoZXJlIGJ1aWxkLXN0L2NvbmYvIGNvbnRhaW5zIGEgY3VzdG9tIGxvY2FsLmNvbmYsIHNv
IGFsbA0KPiB0aGUgbmVlZGVkIHNldHRpbmdzIGNvdWxkIGJlIGFkZGVkIGF0IHRoZSBwb2ludCB3
aGVyZSB0aGF0IGlzIGNyZWF0ZWQ/DQoNClllcywgSSB0aGluayBzby4gTXkgcHl0aG9uIHNraWxs
cyBhcmUgcHJldHR5IG5vbiBleGlzdGVudCB0aG91Z2guDQoNCj4gDQo+IEFsZXgNCj4gLT0tPS09
LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50
IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTk0MzYwKTogaHR0cHM6Ly9s
aXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8xOTQzNjAN
Cj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTAz
OTczOTY5Lzc0NzIwNDkNCj4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVt
YmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViIFtKb2FraW0uVGplcm5sdW5kQGlu
ZmluZXJhLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQoNCg==


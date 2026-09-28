Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A32ECA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 18:57:00 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66377.1790621817226859326
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 11:56:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=wRgu/h8d;
 spf=pass (domain: siemens.com, ip: 52.101.72.31, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UoDbqqPFKQyq1gQvVDgj4lPzUvSFMoMBIHEEmHmc14uVocojISSJ/aacLi5WhK8mEYNmnYzmcmvwyA4uu6IJ1NzaXXakSpqpHi8sdoZp6r0jtgaHqqOZymZHl7Xngf7MtxUkObHz6xU6vCS2Lkt7RwqV5GrsFsBE4vzRPkJ4VppNEPYvgeLGuUG2iNnt7rrru0UlxGwEBDWJ2dGgtRhaV2UV0JTwHTIuyDTXhft9DczYyChbPf0AiXT94O74/1MifvclYhP1DjEtAhQVnf85AAqCKK0WElrnC9X4xj+IonajvhT62swzAspjhJHjmYvVOeZ+EnZjUo39J8lSLpA4cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=87ggJZ4PpY9mFa6IHbi5QmVKfXcioc2RDgVKQ8koTv8=;
 b=xUigy+Y1qW6GQXD+7S6IvAaqeV3QLkhp6uwdM0pHC800m16gOkMWKzTHX1nYMNvbSpqA5o3pcQ/7JYJ4bF8hfLeMGzYCUEW8sIcaJ89ovRTMNL7bJzC0ugETZKnbV4CDZVyxGYUOzX+D+5EQVYJMG3BFPW+LCXQCnViC6KmfGIjpO+sQLxrMbR/lTonqgvoCaOPRZY3yc4iSg0z2qBAeK9VMtK4EVa1I0VYlbp7so7tLR+ApOPyMdqG0cTHkfYF0Cufa1o+6RPruhE0FV3/PReT0XiZBsXDhbT5+gRWJWRPvDh/Rrqa89DYE76Jd2a7AnXzGVdFBjbtEzMWVJfWF2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=87ggJZ4PpY9mFa6IHbi5QmVKfXcioc2RDgVKQ8koTv8=;
 b=wRgu/h8dizSpDyBw2Pk7d+mpC00WYJxNZDturLI6CyT9ar0uDv/sUFAHkipshpJNgE1mDdikp0lQXZefzNE7lzUWRRo9J6Z0vWHvsBc36PpJ2Ij8cbFni7YZTAvQCQ4TzUXP/6BcIBY6+Hz7aOFbXTznZwupBJcWNvzCJmFytcVf5GmgrVgr7Xnrjooe+QQS2j93UWLwWxtZAq3sUzCMa5JQUtHgMWP6KJoHMP1gxKvB7exwdaEvRuq9Wre7cpHsreeY+oad1a0mzhXhjYc/ZBKUba8L5Zy+Q6YHqB/eteut6m0Z7xYCoVEvHGlXMiTmBXjl3Lfl2uNyTt46WKcSng==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by DU0PR10MB6608.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:403::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 18:56:52 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%4]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 18:56:51 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Khem Raj <raj.khem@gmail.com>, Ross Burton <ross.burton@arm.com>,
	"Freihofer, Adrian" <adrian.freihofer@siemens.com>
Subject: RE: [PATCH v2] toolchain/clang: prepend target host-sys to
 HOST_CC_ARCH
Thread-Topic: [PATCH v2] toolchain/clang: prepend target host-sys to
 HOST_CC_ARCH
Thread-Index: AQHdMOAdcrDvwhsBPUy6HHn5sbuz5rbkJIFggAANeQCAAGBx4A==
Date: Mon, 28 Sep 2026 18:56:51 +0000
Message-ID: 
 <AS8PR10MB5073DFB98035EFDFCBAB95A2FD8D2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20260820201120.293849-1-peter.marko@siemens.com>
	 <AS8PR10MB5073188A36969BE5B9F44940FD8D2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
 <cb4625f943a2836c2618d04a9db0e807136edceb.camel@linuxfoundation.org>
In-Reply-To: 
 <cb4625f943a2836c2618d04a9db0e807136edceb.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=a0532207-76c0-42aa-8743-c554ea13094b;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-09-28T18:49:25Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|DU0PR10MB6608:EE_
x-ms-office365-filtering-correlation-id: b283bec5-d359-4820-f229-08df1d9241c8
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|10067099003|11063799006|6133799003|18002099003|55112099003|22082099003|4143699003|56012099006|38070700021;
x-microsoft-antispam-message-info: 
 6Fmtw4egOvlrtO8fcA2XsdPJGwEdUzwKjetmTq/gXfszoNV117BnyZFqMUslDEkM4D7AqLBw+kSNvC0+/yUGl/JsfI0aHxe/whU29Ha9J/UlOwtIiIeJH5e5bBYBtENxsw7LoQVuGTeLfPE8OyBX91zxX9IDGfNT59oF6eiyE2UMLAGitcBd46Q79EYdAz6zPSiiCv/HV+ndCbPIVPK+blRoPUBqR+sW6Bq0niTpxI5sB0IefOGvDNB4nfKad7JkvlFhD0sKvnR/us4rEzuiVOmk7LZWzUiPvpReStwuJGMNFIisrrUJ/lrWO8Y8JSSJRPxn26ppXabB/0xdNJlAasFOeUOewvDb4xTbZE3i49NYLLMcuuHj9mQ0hJQG+wmqQScfh3HyZoBxS6bs0woAZ9fJwR63ClYQhQ9b7CztER0vkNyuQAKqPnNhNyNaxoOuH29ypO0VSkLI2tLvORKsvylCjmvj5PFBiyUPrWyXKdSVfSbpAmqz6K1yK6b1eWM3lvXSGXHjx6g1JcUGcntJx447LbQqJ+a1qjl+fQAQ0OCat42w8Nmu2403Jse9eyPRZFTJ6A1/RF/c5HfA/4UX1bRJUQ5p+z5NmmSES1IAKnpiTeNMRq+0HZ85cvim5YqxXDp2WbLBQDnOojRpOVyx0bYd+c8X+LJ511FowAdcuffsPDwbPUyl0D68wOJcdCexDFMWT8GhHjjkL2IDKRS8Vc6JZHuLdgqmK57FVUNh34w=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(11063799006)(6133799003)(18002099003)(55112099003)(22082099003)(4143699003)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Y3dBYXI0aFAzUkdKTGVPMzBtZVhQaWk0ZzluOStrRnUwK0VXRnZER3F2M0Nk?=
 =?utf-8?B?T3VseHJhMXVVSHBoQXAyNGdqcUx4SGxycXhnWWhZbzdBOUpoQkNYMGRKazIz?=
 =?utf-8?B?OGdMU3ZDYzFCZ0dxdWxJY1UzbzJkaFMwSEVkNElpeXV4eEVsQ0VFampOT3Rw?=
 =?utf-8?B?MER6WTAxZzU3RVpMNU5uS0tIZ245YzJnRlk3aTEzV0NvNUYrWkx0QTJjMWM2?=
 =?utf-8?B?aDJZVEdLa0kwRHIxak0xM20vaWpUODNTQUMwRzZ0VFN4MkhuZWdybW9QK2w5?=
 =?utf-8?B?aEVxTkJLdU1ib0tTamRjUVRIOE94cDBCOGs2V2hrQ0dldG51WkJaenNiQjhr?=
 =?utf-8?B?VzdnaWZDQjNUNWFsaDdwUlQwNk92eXRLSG9kN1B4YVdmWlFvUHFDRVhhdHFx?=
 =?utf-8?B?RWFkK1RoaHpTbXFBZEp4YXhqWlk2SndmYVFSS2RxZTFUS3YvV1VpSmNGV1o4?=
 =?utf-8?B?WWloaXlJWEl3N0hiamJNQkhXMUJrOWthRkRBK0haUWVwRVBxYTlpWFFPZE1T?=
 =?utf-8?B?OERIOUl5SFhFdWJoRC9HcXR3anVyeUNzZDRucFNlamNhUStOM2IwUE9EcVZi?=
 =?utf-8?B?L3hlSzFESmJVQkNiYjRmVERucjA4bFNpVEJ4VkRPMTVRRVhsSnRUQ0JWSHQv?=
 =?utf-8?B?Znd2d2lBY3VJUlhkV2I5bHVsZnNiSVRvR2owN2R2bFc5VFZIeEVUK2Jtc1hO?=
 =?utf-8?B?OWJzcGZLNjdLeU5wODZUbTA1OGlqK3NuTE5KTS9RcktFSzFZODkrOWpLVGNB?=
 =?utf-8?B?cStpTGVmSjFLWWNNKy9aS2diRXhpTDBiNWVDTjQ0d3RqaFkvdnRUUjl5K2Z6?=
 =?utf-8?B?dG9iL1drczdqQUN0R3BXR052MGErbTRaOGRyOXFLUG1SZDlOOXovSE9vdnd3?=
 =?utf-8?B?Tlg3OGJoaGh3TTk2N0tzcmxaOWZYUFJHWVNmcmZSNitUOENHU3VoM3J0MkJh?=
 =?utf-8?B?WllIQk4xaE5OZmR5WncxYjNpczFaSnJicFNjdkowN3kwU3NaYVZYd3hvMENT?=
 =?utf-8?B?Z3VtdVNMc0wrc2R1UThhRWZLWnozK1doeXA2eWRHTGErc3RwWkNzM0xNWVIx?=
 =?utf-8?B?RVpQQU1GZnpCMDVaUjZveXI0RGt2dndBQ1pFSGw4a0tJSElUdXhJSEs2YUhN?=
 =?utf-8?B?R2FhY1pNNkFWVW9MaWh5VlAwbitEekdjYkpZaVZiTVpPOCtsWDFPcFpxb3FV?=
 =?utf-8?B?NWh2bERrV1g2MzFiN3pTeU1DSGJRY0dVeG1MVXpobFAyZjlBTVRHZURaN25l?=
 =?utf-8?B?eTlKSmVMbWdtMGgwayt1NmtaZ2k0YXFYbEFadDA1MEZKUStuL1I1ZDJDVFk0?=
 =?utf-8?B?KytkcWhXY1pCWW1zckJUVzh2ck5GblNFdHNNeDYrK1p5UHorVldNSnNOT29V?=
 =?utf-8?B?RXlYNVd0SXl1UVhiVjVuQ0ZzVjhWSGpOdk04bVZYTW5Bd2NUdmw2MjQ0UjJa?=
 =?utf-8?B?ajNtZ2VzVHRmWVdhbkNYS09lVTB0U0RERjdtMUM1SzZ1c3JnVXJJaUF3bjNT?=
 =?utf-8?B?SGtqU0lXZ1kxWVRScklKZjB3Tys1dFNaS1lobHJRdzNnTFAxWWFIbkQ3cWlQ?=
 =?utf-8?B?ditEaG5CcWU5NUNMaTZJcTZwSzlyTGY0dkRQNmxtOHAwQjF0L0czU2lBZ1Mw?=
 =?utf-8?B?RllmWngwTldkTGswUkY0OWUwL0hDSXVrWE5qNExiQ3NLNStkaXcycnZ2QkZh?=
 =?utf-8?B?N2tVQ3dSOHdDa1dYS3ZQT1lLYUpQb09KeW9PTHM1d3hqVDNCUkRSTzFyR1lr?=
 =?utf-8?B?cUJCbEg4ZVVrR2VWbGdwT2xNRTF0QkFRQjB4S3lDV0o4MEI0and3N3YybHJZ?=
 =?utf-8?B?OUlBNGM4Yk84Z2JXTVd0bzN6R1NNSDNZcmNMaG4zNENFNEdIS1RnZFl2SHRq?=
 =?utf-8?B?Qkx4czlxaExhb213Um5rdTI4WDBzZmlaUjB3RXlVSUEvRGR3RktoWk1YOG1S?=
 =?utf-8?B?cmJiRWJIaVFOZ1N4d1pGWVNQQnpGbmxMMklVVkUxU05tQnY5OFFnakpaOEUy?=
 =?utf-8?B?SlhEOWdvRVpTaFNpYTFyeCtsalNWc3F0S0k1dlZwd2tucTI4RERGZVpCKzY2?=
 =?utf-8?B?RnA1ZFVlTXpTWlMycm9zSDNsMGx5K2hVODU1c3JzNWcyOXhwekVkQWJXQTdY?=
 =?utf-8?B?UXYwRW5TWkNOQWNLTzV2ZXZVVGgvQnlDK292TUpuUmhCeXRzOGtSTGl4eDEw?=
 =?utf-8?B?eC83Z3h3WVZhYkVSMkt5RXpVaUpkeTdlQ1FrYVV4TERaVTZLZ1dwdXVWSFBJ?=
 =?utf-8?B?MlNHK0I5S3pQcmsyVHlLaDBhRTlDVloxTTJNWDk5SThneWxWTUcvV3Y4cS9N?=
 =?utf-8?B?MzU5UnN0dGkzNHZKcXJmTFpwUFJGcUs5NlBwSG9mMXhiZlE4b3VBdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b283bec5-d359-4820-f229-08df1d9241c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2026 18:56:51.5997
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OCnR2a0n2Fyhgd0/IggqMQER9m4zl2MxPu/niWj44KfnvJ9auOLa8NbsCAf8USIX3R803ijvfHGUaSbS7HlfOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6608
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 18:57:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246787

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUg
PHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgU2Vw
dGVtYmVyIDI4LCAyMDI2IDM6MDQgUE0NCj4gVG86IE1hcmtvLCBQZXRlciAoRlQgRCBFVSBTSyBC
RlMxKSA8UGV0ZXIuTWFya29Ac2llbWVucy5jb20+Ow0KPiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+IENjOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPjsg
Um9zcyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+Ow0KPiBGcmVpaG9mZXIsIEFkcmlhbiAo
U0kgQiBQUk8gVEkgRUFDIENDUCkgPGFkcmlhbi5mcmVpaG9mZXJAc2llbWVucy5jb20+DQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIHRvb2xjaGFpbi9jbGFuZzogcHJlcGVuZCB0YXJnZXQgaG9z
dC1zeXMgdG8NCj4gSE9TVF9DQ19BUkNIDQo+IA0KPiBPbiBNb24sIDIwMjYtMDktMjggYXQgMTI6
MzUgKzAwMDAsIE1hcmtvLCBQZXRlciB3cm90ZToNCj4gPiBUaGlzIHBhdGNoIGlzIHNpdHRpbmcg
aW4gbWFzdGVyLW5leHQgZm9yIHNvbWUgdGltZSBhbHJlYWR5IGFuZCBpcw0KPiA+IHByb2JhYmx5
IHNwZW5kaW5nIGEgbWludXRlIG9yIHR3byBvZiBldmVyeW9uZSdzIHRpbWUgb24gZWFjaCBwYXRj
aA0KPiA+IHJldmlldyBjYWxsLg0KPiANCj4gVGhhdCBpcyB0cnVlLg0KPiANCj4gPiBMZXQncyB0
cnkgdG8gZG8gYSBkZWNpc2lvbiB3aGV0aGVyIHRvIG1lcmdlIGl0IG9yIGRyb3AgaXQuDQo+ID4g
SSAod2l0aG91dCBhc2tpbmcgb3IgcmV3b3JkaW5nIHZpYSBBSSkgdGhpbmsgdGhpczoNCj4gPg0K
PiA+IEkgc2VlIGZvbGxvd2luZyB3YXlzIGhvdyB0byBhcHByb2FjaCB0aGlzIGNsYW5nLXRpZHkg
cHJvYmxlbToNCj4gPiAtIG1ha2UgY2xhbmctdGlkeSBhcmNoaXRlY3R1cmUgYXdhcmUgdXBzdHJl
YW0NCj4gPiAtIGFkZCB0aGVzZSBmbGFncyB0byB0ZWxsIGl0IHRoZSBhcmNoaXRlY3R1cmUgKHdo
YXQgdGhpcyBwYXRjaA0KPiA+IHByb3Bvc2VzIGFuZCB3aGF0IHdhcyBwcmVzZW50IGluIHNjYXJ0
aGdhcCkNCj4gPiAtIGFkZCBpdCBvbmx5IHRvIHJlY2lwZXMgd2hpY2ggdXNlIGNsYW5nLXRpZHkg
KG9yIG90aGVyIHNpbWlsYXIgY2xhbmcNCj4gPiB0b29scykNCj4gPg0KPiA+IGNsYW5nLXRpZHkg
KGFuZCB0aGlzIGFsc28gYXBwbGllcyB0byBzb21lIG90aGVyIGNsYW5nIHN1cHBvcnQgdG9vbHMp
DQo+ID4gaXMgaW4gcHJpbmNpcGxlIGFyY2hpdGVjdHVyZSBpbmRlcGVuZGVudC4NCj4gPiBMaW50
ZXIgc2hvdWxkIG5vdCBjYXJlIGFib3V0IGJ1aWxkIGFyY2gsIGNvcnJlY3Q/LCBpdCBqdXN0IG5l
ZWRzIHRvDQo+ID4ga25vdyB0aGUgcGF0aHMgdG8gc291cmNlcy4NCj4gPiBTbyBpbWhvIG1ha2lu
ZyBpdCBhcmNoaXRlY3R1cmUgZGVwZW5kZW50IHdvdWxkIGdvIGluIGEgd3JvbmcNCj4gPiBkaXJl
Y3Rpb24sIHByb2JhYmx5IHdhc3RpbmcgdGltZSBvZiB3aG9ldmVyIGRldmVsb3BzIHRoaXMgYW5k
DQo+ID4gdXBzdHJlYW0gY2xhbmcgbWFpbnRhaW5lcnMuDQo+ID4NCj4gPiBFeHBsaWNpdCBzZXQg
b2YgYXJjaGl0ZWN0dXJlIGdsb2JhbGx5IGxvb2tzIGxpa2UgYSBiZXR0ZXIgY2hvaWNlLg0KPiA+
IFlvY3RvIGN1cnJlbnRseSBkb2VzIG5vdCBzZXQgdGhlIHRyaXBsZXQgaW4gYnVpbGQgZmxhZ3Ms
IGJlY2F1c2UgaXQncw0KPiA+IGhhcmRjb2RlZCBpbiB0b29sY2hhaW4gYW5kIHRodXMgIml0IHdv
cmtzIiAoaG93ZXZlciBhcyB3ZSBzZWUgaGVyZSwNCj4gPiBvbmx5IGluIDk5LjklIG9mIGNhc2Vz
KQ0KPiA+IEZvciBjbGFuZyBjb21waWxlciBpdCdzIGEgbm8tb3AgKHRoZSB2YWx1ZSBpcyB0aGUg
c2FtZSBhcyB2YWx1ZSB0aGF0DQo+ID4gaXQgaGFzIGhhcmRjb2RlZCBkdXJpbmcgaXRzIGNvbXBp
bGF0aW9uKS4NCj4gPiBBbmQgaXQgaGVscHMgYWxsICJhcmNoLWluZGVwZW5kZW50IiBjbGFuZyB0
b29scyB0byBmaW5kIHRoZSByaWdodA0KPiA+IGhlYWRlcnMuDQo+ID4NCj4gPiBIYXZpbmcgYSBz
cGVjaWFsIGhhbmRsaW5nIGZvciBjbGFuZy10aWR5IGluIGFsbCByZWNpcGVzIHVzaW5nIGl0IGlz
DQo+ID4gY2VydGFpbmx5IHBvc3NpYmxlLCBidXQgc2VlbXMgdG8gYmUgc3ViLXBhci4NCj4gPiBZ
b2N0byBzaG91bGQgc3VwcG9ydCBjbGFuZy10aWR5IHdvcmtmbG93cyBuYXRpdmVseS4NCj4gDQo+
IEkgdGhpbmsgc2V2ZXJhbCBvZiB1cyBhbGwgaGF2ZSBtaXhlZCBmZWVsaW5ncyBvbiBpdC7CoE9u
IHRoZSBvbmUgaGFuZCBpdA0KPiBmaXhlcyBhIHByb2JsZW0uIE9uIHRoZSBvdGhlciwgdGhlIHJl
c3Qgb2YgY2xhbmcgZG9lc24ndCBuZWVkIHRoaXMgYW5kDQo+IHRoZXNlIGtpbmRzIG9mIGZsYWdz
LCBvbmNlIGFkZGVkLCBhcmUgdmVyeSB2ZXJ5IGhhcmQgdG8gcmVtb3ZlIGFnYWluLg0KPiANCj4g
SSBndWVzcyB3ZSBsYWNrIGVub3VnaCBkYXRhIHRvIG1ha2UgYW4gaW5mb3JtZWQgY2hvaWNlIGFu
ZCBhcmUgd29ycmllZA0KPiBhYm91dCBzZW5kaW5nIHRoaXMgaW4gdGhlIHdyb25nIGRpcmVjdGlv
biBpZiB3ZSByZWplY3QgaXQsIGVxdWFsbHksIHdlDQo+IGRvbid0IHJlYWxseSB3YW50IHRvIG1h
a2UgYSBjaGFuZ2UgbGlrZSB0aGlzIGFzIGl0IGRvZXNuJ3QgZmVlbCByaWdodC4NCj4gV2UgYXJl
IHRoZXJlZm9yZSBzdHJ1Z2dsaW5nIHRvIHJlYWNoIGEgZGVjaXNpb24gOi8uDQoNCkkgZGlkbid0
IHdhbnQgdG8gY2F1c2UgdG9vIG11Y2ggZWZmb3J0IHdpdGggdGhpcyBwYXRjaC4NClNvIGZlZWwg
ZnJlZSB0byBkcm9wIHRoaXMgb25lLCBpdCBjYW4gd2FpdCBmb3IgbW9yZSBkZW1hbmQgdGhhbiBh
IHNpbmdsZSBwcm9qZWN0Lg0KSXQncyB0cml2aWFsIHRvIGtlZXAgdGhpcyBpbiBvdXIgcHJvZHVj
dCBsYXllciB3aXRob3V0IGZlYXIgb2YgZ2V0dGluZyBicm9rZW4uDQoNClBldGVyDQoNCj4gDQo+
IEV2ZW4gdHJ5aW5nIHRvIGFydGljdWxhdGUgdGhhdCBpbiBhIHdheSB5b3UgY2FuIHRha2Ugc29t
ZSBhY3Rpb24gb24gaXMNCj4gaGFyZCwgaGVuY2UgaXQgaXMgc2l0dGluZyB0aGVyZSA6Lw0KPiAN
Cj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0K


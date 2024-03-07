Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDBC2C48BF6
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 15:49:10 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.41])
 by mx.groups.io with SMTP id smtpd.web10.26503.1709826541173345682
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 07:49:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=KHGlXgF9;
 spf=pass (domain: axis.com, ip: 40.107.21.41, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdY6JHDY4qAGTCFTUlqJ+x1oSdp6F4dgZJkxyLlxCzyZuj0748cHy/mLEDS/+ONotTwiBwz9OfoN/h/UtSCXSCGqMcIGw9AbgOnstYUN018/HjFuEnYnwWBxBOuG2UVqdsTxqlENZj4XsaHVigXm4CDRVjcQ365biSvqWHmKomV8AvRNiAvDPSXf4+RBmfZYJBaRX9DnPBP//o2OZgBzAyheyBhLHZoMyTHmUNxbEBOcf+xNojGb+zMQTEbrhUwRlHyiYb/TMmd6KdzqdPuWGTXbk/U+aGTkfz6NEqBd14I6oE88qXJsv7ic+qozxpEcscSivYCze9mDF4VTnOxEAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3w7RiXp+Pj7ZIq8jHerkZ+W/ZzN55DUjPvbx9rD67g=;
 b=b9blAJKF1nZ3EoxgUAPr0l/OFpRs3YeGUFj6vP9mlIaw0de0ZnL9Kh6VF2/gpnm79PITqGJDmb6pNT4B3biQ7t4QeFTSLITFoE8OBjCy7kugkKcbk4Ass5ORJ5FgFlez2JpSyW4c2f5fWAnY/0Yq6xmBOmcrf2VIH/vYujsO7jExukvOYylCA7HdEtltGR+PClmEumaqxeAJTiVheHN4zENwJzNZn/kkfdVlXLJyawsgE4zWDD1E7Ef77Nx7GBSaRt0YBDJNzKcuDgZzJC0SNVrnE0V1hrC0e31xSyETII8q0gZlSq/YqWepXNLKdsX4Wh0i9tMXKtJWCdz78OPtAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3w7RiXp+Pj7ZIq8jHerkZ+W/ZzN55DUjPvbx9rD67g=;
 b=KHGlXgF92HU1KvPtcbnqVWDa0DIdOpc8koLuV8jTzqJ7LJUIgt2hV6ogn4F56eelyUF8z7sap2ZLjxssilFu1Y9L0nBMkVuzx22ZkP2IOQzb89kZtysoMkdhDDL6LluO/LyVCzo4b6qRbRWoctqb3HXtIwvhXIxEoL+1iyjN3dU=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by GV1PR02MB8585.eurprd02.prod.outlook.com (2603:10a6:150:97::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Thu, 7 Mar
 2024 15:48:56 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::fa03:deff:aae:c4d0]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::fa03:deff:aae:c4d0%7]) with mapi id 15.20.7362.024; Thu, 7 Mar 2024
 15:48:56 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, Martin Jansa <martin.jansa@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] glib-2.0: backport a switch from distutils to
 packaging in codegen
Thread-Topic: [OE-core] [PATCH] glib-2.0: backport a switch from distutils to
 packaging in codegen
Thread-Index: AQHaZ85Pepywq1uLvUWa8zcMnHRpyLEdQ/OAgADPyZWAAgUAAIALVsHw
Date: Thu, 7 Mar 2024 15:48:56 +0000
Message-ID: 
 <DB5PR02MB10213AB74AFAAB16C842B2E78EF202@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240225093726.1113403-1-martin.jansa@gmail.com>
 <CAMKF1sr1SVSnAZ2_ZCTHfMyM8i01msDQ+81M5h+Bb9zmKGPLCw@mail.gmail.com>
 <17B78F10F29044A4.14830@lists.openembedded.org>
 <CA+chaQfh47nRBVAjhxpo1xeXWkmw-vHf8Jk-MWX6Npn4GfyGXw@mail.gmail.com>
 <CAMKF1sroBXyZwPqLyehFLD36orrh7fC3Z5A_b98863-5hbRFxQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sroBXyZwPqLyehFLD36orrh7fC3Z5A_b98863-5hbRFxQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|GV1PR02MB8585:EE_
x-ms-office365-filtering-correlation-id: 37837f63-396c-455a-d7df-08dc3ebe194e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 F2W7qBDnzU6k2GZYcd7y1FmbB9qhhGh4wFquRjwMz8EiS7jO6+hoNwIZhR1Bs24kLnTFV26Yp8HRkeCe7ee0+WQAoNaJIqHHqP6fYv1hJNo9hNPZ6/mTApuvX1hXtZXmsuXJE0RCR4fBsTwrpvz6HATP5oyapOEc2JwbZQfGZZmUMW9NhPB3JeO8n5zLJ1S0WII+cibljSdYcqpj8bPJUW3TJU6sC/PkTVrqlz2Qdth/gNaSNjpNWQpW+wW2gZyo3kGeRiE8kdgu2pkJO3gab1qS9w0TPN/6kW31kLQhhMMbNwd8mEN9gDllLxEn9gs+yhcKyxiLmdomSLOOyrRzIt3BUsriWvO4GRyNB6BkikdIkjruuTf4n67YDDdCreTVFrFKSu0u4m12rSakNyPVsUX+/XmlM0DyxLUBCp9W/OFubq6gScLpyGdkbNDDEpC3TB1urlFTJN/4oWgo/k/F47CmaOq2qF+84W+1BH8hFIGat3V0qRiG7WEKO4kBKgKrk8xkpscl75W5C2Zj0hwl2VDAg4JBlNYTkAovpE07UgeEi2AWXGjk6M31NnD1bUlVKCikGkjjzVKPrM8eShnHo3tbgLHH/1PLvatIGTD8AQa8KOFk4R60UK7huvEFyTzCS1VVEfy+7uDeIZL6h4nezkBgNLDHKEcoigQ+Qp3gaDs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZVY1S3ZMeC9TWUFZV2xQL3JjRXgvdjVnN2ZjMDlmU2xRWWx4Q3VWWkY4VWZ1?=
 =?utf-8?B?T1FHVStyUTkvbVZiZ3FURmVrZlpIaHZiaDV4cTJsVWdZUG80ZFhaMjJpOWVD?=
 =?utf-8?B?NXg3Mld3UlBONlJDaWZxUE5qa2UrNHpINFJDbEdXOEdlWWdPUUp1LzJxNEkr?=
 =?utf-8?B?alJicU1SRVdUNFpwclZHZ0dUNy9CVzR2aFRDTmJvdjJ3WWFBWVRTVFZTS2VZ?=
 =?utf-8?B?c3JRUjFBaW9LaW9tUWwrSTZpWWNXMzdWYmdHdlp4Q3B6MTFtZWwyOFMwVWpO?=
 =?utf-8?B?bmNxR01mbFpmeDd5cERlS1RQKyt5Z1dOeUFjVUIyYnROTy92ekMxZDlITW93?=
 =?utf-8?B?SXIyVUFUZlhyYjNuN2EzWU1neDE4OGNSa2pPbGVHUkFvYXJ3SHJSSXYzMXdF?=
 =?utf-8?B?YSt0ai9iUW1hUCtZSWNUSW02TUFWeUZ4Z29DZlJHS2dOa1JlRndtRkFPdThS?=
 =?utf-8?B?MjZQT0k4cmRmdFk2cXFTNDlzV0hlV2h6MzM4TW5QaHlaVUovcjV4bHpRSWZD?=
 =?utf-8?B?UitHRlpaUi8xR0FxamlsMmRXRjlCRXNWS1k4azRINjJrd3N4N3pzWERoYkgy?=
 =?utf-8?B?OFpyTVFlSU82VnUwb2c2NG9pN3ZST2RHUnlPRGZyQTg5dFVHOVpyWlpaNURM?=
 =?utf-8?B?azVzOW5sWi9US0hRMlMreTFTenNaeTJsUGVkdzZZRnJ1ZHU1VGpGek9TSURS?=
 =?utf-8?B?YzhMWmdsWWRLZFhDVlpLZmVWNnp6MW1GSllnZlFmYXpEbU85VXMyZENWZU1V?=
 =?utf-8?B?bHZQZHlCSWhhQkdqbHA2ajYzV1BkV0VraFJscytsRHJjK2d4Rm9hRTQ5dlB0?=
 =?utf-8?B?MDlWaVBRTS85SzdsODBuWUFQUW1Xd2RUZzFZOTgzVE5hbUk0UUF6ME1qN0c1?=
 =?utf-8?B?UXdWWnpMRU5YMTZlOGg0ZUZORE9pbDE0M3NEd1NoWlZ6a3BncmZvOFJIZTFU?=
 =?utf-8?B?MEkzdEgrSEhKS3pVK3BvUjgzRk8vSnJGWjQ0Q2w5bkhLU2loWnFWMTJMYUdC?=
 =?utf-8?B?bnlxN1JIZlg0R0gyVzdkVzJubEFISW8vdnFSdU42SzBydGtIbVFnZjhxekNB?=
 =?utf-8?B?VklxenVvUzViWFcrV2c3bDVJMExzaWZQS1Z4SjRJeFc3Vm9qdGFVNTQwd2tP?=
 =?utf-8?B?K3YwN0U5bU1sQ3QyT0hSVFJ2SVFOb2p2RUM4RUtlbjdXcGh3emVIQ0N2NXkz?=
 =?utf-8?B?S0IvZi9JUVN4T1BxY1ZEWlRZWW9vT3ErNjM3bDNuRGxNd3ArY0owREwyRjl1?=
 =?utf-8?B?MVhVUmNmTTgyOTdaUk45N1VmSjQxT1MxNmJyd290UHdkQmdDdVpMQk1lVk1Q?=
 =?utf-8?B?NzdMKy9qcm91Q0tsS3hGT0ZjZno4VXpOS1RXY2k1SnlTZFlrWlFDbjF6QVUz?=
 =?utf-8?B?VXFVTEFDU2lwOFd1N1VUbloraVQyazVXUlp1V0lvZlYxZFJPaUQ1czk2NEJ5?=
 =?utf-8?B?VUxKMFNORXI0Rmpkek5UQkpiMnlSbFJIZGVUaXdKZlVWNmFTcThPMm1jOGdk?=
 =?utf-8?B?Zyt4Qi9LQ3JjWWhXMjZnMmNiYXQ1cmNXRnVpK1pzWFdFMlVhcXovVWV2VllR?=
 =?utf-8?B?Y3ZNbHZLeURKUTZqRHdYNG1BazMvcWRPRjZsQVl1NVdJYnU0ZWErRHROejNO?=
 =?utf-8?B?Z0s0cUVKcmlsZEcxdU8wWWU0QzN4QkdWRC8xdnlDQmF2T1J2WDNZOTlGU2xE?=
 =?utf-8?B?NFIvTFZ3N1Ara2tuSHhpMTNBWEljRnFTWVoycUx2aUw2L0RJK1Ayd2tCWE92?=
 =?utf-8?B?aXRuaFV6eEdHL2dZaHp4U2FSS0xtNlZveUVVazMvdHk1YkFhUHM4MlpGS3FM?=
 =?utf-8?B?SlVjbWRkTDJUd2dMZG5NQjZpRTkvL0Y5Yk1DOWp1MStPSU5uNHB3Q0hpV1VN?=
 =?utf-8?B?YXI2dm9CSVZxWjJwYnp6RkhkNnh0eU0xcDkyTzAyYjQvMmFzQnErYks1SUxK?=
 =?utf-8?B?VWNJTUNUem5IQzVxOXdPL3g4encxUGVrTStpQ1JXMWhWbk1iN09OZ0c0bXJO?=
 =?utf-8?B?M2I2M1hRdFlwMzFha0ZRUEFGcWswS3pNSzIrNHpuMHU1amxjelQwc2FpVUww?=
 =?utf-8?B?NmxLQ0RjR1dJaUR4cXR4OHh3ZEtpcVZUb2NNYm9zNCttNG1WTEdlNmxuRWox?=
 =?utf-8?Q?D3C0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37837f63-396c-455a-d7df-08dc3ebe194e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2024 15:48:56.8838
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ptzLQHHNYJhq2O043uJOrcS4zrXi6/xXL6QPxGn2ZSaiHV5SSVZa0AFtEtvqcjFx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB8585
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 15:49:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196801

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIEtoZW0gUmFqDQo+IFNlbnQ6IGRlbiAyOCBmZWJydWFy
aSAyMDI0IDE5OjMwDQo+IFRvOiBNYXJ0aW4gSmFuc2EgPG1hcnRpbi5qYW5zYUBnbWFpbC5jb20+
DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1Ympl
Y3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBnbGliLTIuMDogYmFja3BvcnQgYSBzd2l0Y2ggZnJv
bSBkaXN0dXRpbHMNCj4gdG8gcGFja2FnaW5nIGluIGNvZGVnZW4NCj4gDQo+IHNvbWUgbW9yZSBm
YWlsdXJlcyBpbiBtZXRhLW9wZW5lbWJlZGRlZCBsYXllcnMgKCBtZXRhLXhmY2UpDQo+IA0KPiBo
dHRwczovL2Vycm9ycy55b2N0b3Byb2plY3Qub3JnL0Vycm9ycy9EZXRhaWxzLzc1NDk5NS8NCj4g
aHR0cHM6Ly9lcnJvcnMueW9jdG9wcm9qZWN0Lm9yZy9FcnJvcnMvRGV0YWlscy83NTQ5OTYvDQo+
IA0KPiBPbiBUdWUsIEZlYiAyNywgMjAyNCBhdCAzOjM54oCvQU0gTWFydGluIEphbnNhIDxtYXJ0
aW4uamFuc2FAZ21haWwuY29tPg0KPiB3cm90ZToNCj4gPg0KPiA+IFllcywgaXQgd2FzIHJlcHJv
ZHVjaWJsZSBvbiBteSBob3N0IGdlbnRvbyBhZnRlciByZW1vdmluZyBkaXN0dXRpbHMNCj4gPiB3
aXRoIGRldi1weXRob24vc2V0dXB0b29scyAoYW5kIGZvciB1cGRhdGVkIGdsaWItMi4wLW5hdGl2
ZSBhZnRlcg0KPiA+IHJlbW92aW5nIGRldi1weXRob24vcGFja2FnaW5nKQ0KPiA+DQo+ID4gRml4
ZXMgc2VudDoNCj4gPiBodHRwczovL3BhdGNod29yay55b2N0b3Byb2plY3Qub3JnL3Byb2plY3Qv
b2UvcGF0Y2gvMjAyNDAyMjcxMTM3MTEuODM0NzY3LTEtbWFydGluLmphbnNhQGdtYWlsLmNvbS8N
Cj4gPiBodHRwczovL3BhdGNod29yay55b2N0b3Byb2plY3Qub3JnL3Byb2plY3Qvb2UvcGF0Y2gv
MjAyNDAyMjcxMTM3MTEuODM0NzY3LTItbWFydGluLmphbnNhQGdtYWlsLmNvbS8NCj4gPg0KPiA+
IENoZWVycywNCj4gPg0KPiA+IE9uIFR1ZSwgRmViIDI3LCAyMDI0IGF0IDEyOjU44oCvQU0gTWFy
dGluIEphbnNhIHZpYQ0KPiA+IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPG1hcnRpbi5qYW5zYT1n
bWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCj4gPiB3cm90ZToNCj4gPiA+DQo+ID4g
PiBUaGFua3MgS2hlbSwgd2lsbCB0cnkgdG8gcmVwcm9kdWNlIHRvbW9ycm93LiBNYXliZSB0aGVz
ZSBkb24ndCB1c2UNCj4gPiA+IENPREVHRU5fUFlUSE9OX1JERVBFTkRTLg0KPiA+ID4NCj4gPiA+
IFdpdGggdGhpcyBwYXRjaCBiYWNrcG9ydGVkIHRvIGtpcmtzdG9uZSBJJ3ZlIHNlZW4gZ2xpYi0y
LjAtbmF0aXZlDQo+ID4gPiBmYWlsaW5nIHdpdGggdGhlIHNhbWUgaXNzdWUgYXMgcHl0aG9uM25h
dGl2ZSB0aGVyZSBkb2Vzbid0IGluY2x1ZGUNCj4gPiA+IHB5dGhvbjMtcGFja2FnaW5nLg0KPiA+
ID4NCj4gPiA+IE1heWJlIHRoZXNlIHJlY2lwZXMgYXJlbid0IHVzaW5nIHB5dGhvbjNuYXRpdmUg
YW5kIHdlcmUgZGVwZW5kaW5nIG9uDQo+ID4gPiBwYWNrYWdpbmcgZnJvbSBob3N0LCB3aWxsIGRl
YnVnIHRvbW9ycm93Lg0KPiA+ID4NCj4gPiA+IE9uIFR1ZSwgRmViIDI3LCAyMDI0IGF0IDEyOjE2
4oCvQU0gS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4gPiA+DQo+ID4g
PiA+IEkgYW0gc2VlaW5nIHNvbWUgYnVpbGQgZmFpbHVyZXMgd2hpY2ggc2VlbXMgdG8gYmUgcmVs
YXRlZCB0byB0aGlzDQo+ID4gPiA+IHBhdGNoDQo+ID4gPiA+DQo+ID4gPiA+IGh0dHBzOi8vYXV0
b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy90eXBob29uLyMvYnVpbGRlcnMvODgvYnVpbGRzLzM2
NTcvc3RlcHMvMTUvbG9ncy9zdGRpbw0KPiA+ID4gPg0KPiA+ID4gPiAgfCAgIEZpbGUgIi9ob21l
L3Bva3lidWlsZC95b2N0by13b3JrZXIvbWV0YS1vZS9idWlsZC9idWlsZC90bXAvd29yay9jb3Jl
Mi02NC1wb2t5LWxpbnV4L2dhdHRsaWIvMC4yK2dpdC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNy
L3NoYXJlL2dsaWItMi4wL2NvZGVnZW4vdXRpbHMucHkiLCBsaW5lIDIyLCBpbiA8bW9kdWxlPg0K
PiA+ID4gPiAgICAgfCAgICAgaW1wb3J0IHBhY2thZ2luZy52ZXJzaW9uDQo+ID4gPiA+ICAgICB8
IE1vZHVsZU5vdEZvdW5kRXJyb3I6IE5vIG1vZHVsZSBuYW1lZCAncGFja2FnaW5nJw0KPiA+ID4g
Pg0KPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiAgIHwgICBGaWxlICIvaG9tZS9wb2t5YnVpbGQv
eW9jdG8td29ya2VyL21ldGEtb2UvYnVpbGQvYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1s
aW51eC9uZXR3b3JrbWFuYWdlci1mb3J0aXNzbHZwbi8xLjQuMC9yZWNpcGUtc3lzcm9vdC1uYXRp
dmUvdXNyL3NoYXJlL2dsaWItMi4wL2NvZGVnZW4vdXRpbHMucHkiLCBsaW5lIDIyLCBpbiA8bW9k
dWxlPg0KPiA+ID4gPiAgICAgfCAgICAgaW1wb3J0IHBhY2thZ2luZy52ZXJzaW9uDQo+ID4gPiA+
ICAgICB8IE1vZHVsZU5vdEZvdW5kRXJyb3I6IE5vIG1vZHVsZSBuYW1lZCAncGFja2FnaW5nJw0K
PiA+ID4gPiAgICAgfCBtYWtlOiAqKiogW01ha2VmaWxlOjIwODE6IHNyYy9ubS1mb3J0aXNzbHZw
bi1wcHBkLXNlcnZpY2UtZGJ1cy5oXSBFcnJvciAxDQoNCldlIGhhdmUgYSBsb3Qgb2YgcmVjaXBl
cyB0aGF0IHVzZSBnZGJ1cy1jb2RlZ2VuIGFuZCBhcmUgbm93IGZhY2luZyB0aGlzIA0KcHJvYmxl
bS4gVG8gc29sdmUgaXQsIEkgaGF2ZSBhZGRlZCBhIGdkYnVzLWNvZGVnZW4uYmJjbGFzcyB0aGF0
IGRvZXM6DQoNCkRFUEVORFM6YXBwZW5kID0gIiBnbGliLTIuMC1uYXRpdmUgcHl0aG9uMy1wYWNr
YWdpbmctbmF0aXZlIg0KDQppbmhlcml0IHB5dGhvbjNuYXRpdmUNCg0KVGhpcyBhZGRzIHRoZSBk
ZXBlbmRlbmNpZXMgbmVlZGVkIHRvIHVzZSBnZGJ1cy1jb2RlZ2VuLCBhbmQgaXMgc2ltaWxhciAN
CmluIHNwaXJpdCB0byBwa2djb25maWcuYmJjbGFzcywgd2hpY2ggYWRkcyB0aGUgZGVwZW5kZW5j
aWVzIG5lZWRlZCB0byB1c2UgDQpwa2ctY29uZmlnLg0KDQpJIGNhbiBzZW5kIGEgcGF0Y2ggdG8g
YWRkIGl0IHRvIGVpdGhlciBtZXRhIG9yIG1ldGEtb2UgaWYgaXQgc291bmRzIA0KbGlrZSB0aGlz
IGlzIHNvbWV0aGluZyB0aGF0IHdvdWxkIGJlIHVzZWZ1bCB0byBvdGhlcnMuDQoNCi8vUGV0ZXIN
Cg0K


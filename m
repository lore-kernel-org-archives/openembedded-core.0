Return-Path: <peter.tatrai.ext@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 537E0CD6E55
	for <webhook@archiver.kernel.org>; Wed,  3 Jun 2026 09:08:03 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15803.1780477672516315914
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2026 02:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=Doe8VT8a;
 spf=pass (domain: siemens.com, ip: 40.107.162.48, mailfrom: peter.tatrai.ext@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JAiIVHsj/QE6pYtgcGrXp1O5U/pu03M5hR3iy1k05QZN0slHw9TjZIRO7bU6vGJks/IuI6YMouLXc8n7CG1xNHHmUxbs26I8PGLOzZtFU9uYYhItnePSd/7q7juebeS5oI6sYLMI5EKbWlKDh3R4KgBkJveZLYdLnWkXRZuTaLyDuPSJq3lXSbl2nXAJWGHzLvRKPCMUKU4a+vv5410PAPIR4UmFm4V/zB8IE01inhDl67v4SAs+qeOguUPJdR75nXji6mRSu1HoZp29IxbsSEZlADY1zFBCL0VL2byrG9rO+v6iWTamA8SwNugJcMvoyk28mj6ptC18oecHqfzoVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/dMCucWzu1IUEnvcwO7K/f9yFEIfWPEaBy1oqkAbODA=;
 b=m/n8F+xm6UJ6TJ7wBh1UtokoXwy2cngoZYE7/jrVtjjWGQLJiCFEZr88UPSdWSDMVQBZqoYZQzkHk76vOteaRvwEPg+8Op4dVNv1RJDIqhc422nDs8PLmi9PctUSNMtKhIC5fqk7YtvXZJPP7Dpc5qrYhLigIHP/6i6wAbNosOZIZTQXTnVNKAQvIOaukZK7F2QrF1HolFLoTxP+DmmXuODL4IqD/kQ2SnBK85TbHPCi5yqlM4tHHOIAr+Tc9yZv8Yge00UyVnC/5GwvN6GhazNiOi+n64qmFggf+M7+wiokqDe1uvrOGLLjgNRzowInRJTDyFfQKfFZ6gPxxiEQRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/dMCucWzu1IUEnvcwO7K/f9yFEIfWPEaBy1oqkAbODA=;
 b=Doe8VT8aLNKWdixLLijFpeVj5TpEtFjxU01KeMrdb5b4nsFyWnOb9VqPWppkZpT73WENwfCSX/8Z+XA7hJwagZfutW+lsbBubAH2angEX0OE6WxSq2cT0lZ0vn8+WUPn/+o0gQUBWRuDTb9MZQmHgcbBY3QnGm5iqEtj6gcPHw/AJZmdLytTPJXeSasRWxisPG8FrU04h5dMYQ90v+NfuywihCUoDnn672Zlv+W/QS/T+c7cf12lgHrOau8uSFa4BtLZwp1TJeBEIalhvYr1fjaY4WXAHGoRIgomH20Lc1795jr45QA1Mj2pvJqOKEp4A9W5HnmQsxgdgglP5Ff7pQ==
Received: from AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:605::21)
 by GVXPR10MB9827.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:319::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 09:07:48 +0000
Received: from AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9f70:952:2a71:7f3f]) by AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9f70:952:2a71:7f3f%6]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 09:07:48 +0000
From: "Tatrai, Peter" <peter.tatrai.ext@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Ross Burton <Ross.Burton@arm.com>
Subject: RE: [OE-core] [PATCH] testimage: handle missing boot log file
 gracefully
Thread-Topic: [OE-core] [PATCH] testimage: handle missing boot log file
 gracefully
Thread-Index: AQHc5tHJaWui7bfh3UqqDc3Lmx3thLYYtQYAgBPtKfA=
Date: Wed, 3 Jun 2026 09:07:48 +0000
Message-ID: 
 <AS2PR10MB734704548BD954B6383D4510DB132@AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM>
References: <20260518142235.2077-1-peter.tatrai.ext@siemens.com>
 <4C2A3BCA-C42A-4B86-8FDB-BC7C817476BC@arm.com>
In-Reply-To: <4C2A3BCA-C42A-4B86-8FDB-BC7C817476BC@arm.com>
Accept-Language: en-US, sk-SK
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=4b203794-2cff-4152-9cc7-37e029e8ad9f;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-06-03T09:03:58Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR10MB7347:EE_|GVXPR10MB9827:EE_
x-ms-office365-filtering-correlation-id: 6497f863-5a31-4147-5315-08dec14f958d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|55112099003|38070700021|22082099003|18002099003|4143699003|56012099006|11063799006;
x-microsoft-antispam-message-info: 
 73YdZwftmlS8m821Hp00UuDtEx3Pe8CeQCVA4R+TrlYC9SppXldeAM5kyHijd42UnwfLN1tkGDrH4J8A74Xc1bJiF11hErWyV6Ih3ITEFpOkNrjMR32D6JlDg2wJ3jv+jvgT5ZtdAqfhcUWSAxZMsi8Y3HYN2G+8j2Rkp+3FlUspoX315PuFokfFQTk3JUPnoxf2vnRhnVOg4jx0KqtT9EbH0skNbauXH4hZIEG6nS39scngoS77yWVvnJ++t2gghi3UCKwKOzgI/WWGj7SrpwwmboTwc77JXxd8cf6NrBb+WbWJQzVfmPmQuDlicMgMOc4FV+iYOIl8ixTs2YW80nNyng+TAGw1Lc9VOlx/YJzpzmSjI4Kze47wG/3ubHVlOHp+urQ3sFFK2dEQw5RlQzatJOCArRBKt2x3g3iqbeF8o4/Vf7YnUAF68Bd+j0lAwPMcmkFP/PIFFVbn2RhyAuOAcNvEbInlrlnf3fyN0CZ+VBjYqEePPaN4R9k5oKbA5mer/Zjvs71hhkWvg3DZl9+UnhICxoePU/ibzKikeIqvvh0gz2cguRUFpJQIfQBeWX0tfwVvqkVHpeGsoycU8Kwo06TmwBlIe4L09/URl+nr9/ufOdi4XhQEms19w1DubYH4QA4u5SyGK7muyNJtAgy+opIWoCJ2dnsq+/VMPA+zb4DS5En3NP1PeQ3fRhHQWY1LzQUyaE1qVoW2n2IxMg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(55112099003)(38070700021)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?a0NLeDBsUS9NNi9NckxOUjRwclBjMXN4VmtOQjNLRFRlZjhuREJNZ2tVWkw3?=
 =?utf-8?B?elo0Wk9nV2owQk9UUGdGTk5wZ2ZURUM4bW10WWt1cUpxL2JEWUprZTB5c280?=
 =?utf-8?B?RFhzOThhVERLYkJsVmVwaE9rSHpOdytxT3VlTGdmRXp2cTlybCs4Q21YZ2JB?=
 =?utf-8?B?QTQ2ekJnOFJaV0VZbzExZkczZ0tkMmFYNFd5S2s2NXNYM21ZK1JTVHR6dTB0?=
 =?utf-8?B?MnYzL3N6S3R3VnpjeVgxVHhReENhajRWZjJmY3pTRklnMXcvZnlrVnBuNkRE?=
 =?utf-8?B?dkY2bVJ6V0IvK1ZPUVVIWXpoMkR5anE0MDF5emkwdUFTWDkvM0J5Vm1EWXQy?=
 =?utf-8?B?djJFalhBNjNGVkFWaGlLS2o5K1ZCSW4rblhBcGtjNFZmc0N2UVFFM24vRzln?=
 =?utf-8?B?MmNsNnlEUEwvZmdBaUFidVQraWNRaksvUEQwNmFsdjZSWFUvblZ0UVVZWjVE?=
 =?utf-8?B?U3hoS2Y1SExXcGNWT2t5enAzUWNJOUM2dXMvSFRQeWFManhFdHc1KzhIVFJv?=
 =?utf-8?B?RTFrZG44QXdFNGI5SVkyYmltZE5BMWprRjZqY1Z4S1ZoU1BXZ3N0UGRNMkVk?=
 =?utf-8?B?MTFsbHVnY0Z1eWhiK2ZZU1pOTjFObHNiZFEvL3UvRkhoTmZtTlAvK1FCNkdI?=
 =?utf-8?B?ZUlpVFNLcnRsWU56UVNYR3VsRFo0UjN2MUZ4MWVsQ2p4Slg4ODJuRVJnTHlM?=
 =?utf-8?B?cGJBaWNsbitDN0NMeWx0VlNMWkNXRmxzUm1KUzZoYTBnQXhXRmVRbjBlbEFh?=
 =?utf-8?B?QmtudTlKaktOT28zOXF6bmtlbjc5bjI0RytaRUZxTWVnTzJYbHo2RXJPaUZQ?=
 =?utf-8?B?eDlTT2k3V2o0YVIvbmhuTEVzemUwTVNobmRUVjVscVY3eWptRXVDZE1uTXM0?=
 =?utf-8?B?Nm84SlQxb204cGdCR0xNbGk3TC8wWHdtajRlUnpYSDZXREN5RmJGcjJyaGw4?=
 =?utf-8?B?dTQ1OVlwMExVUHZWVGJDTDNXcmtJT3RzeGtyUVVTd1dvaE4zdEMvQWc1RjB2?=
 =?utf-8?B?Q2VVcmNXMURrQTE1WEkrT1lTVTU1UjdLS0t4L1hvK0NXVURYdUNRanoyWWR1?=
 =?utf-8?B?eGczSXpYT3hydTdWNmQxRTdSS0RwSC90byt0SlJTa3dvQnhQTlJzak00L1Ba?=
 =?utf-8?B?dzNQRUd2bXJlMVpsN2wxM3Byc0lJY2VVYW1BRmpGVFFiMHZYZTZUZHlwSEMz?=
 =?utf-8?B?SGN4c1RMTGtQdWFLZDVjUFZUZm05ZzF4d1dMdVRUczlVZ0JETFUvWHNOckpa?=
 =?utf-8?B?MEllTGp1MHR4Q3NGbU5KcVE3YW0vVTJFU09HK1Y5VGIxQlp1OHdRQlZlc1Qw?=
 =?utf-8?B?R1I3UFRIT2FkNytobnhaNmNNTkQybTl3NmF4WkdIRkhPbkk5dU01UnhHZ0Fv?=
 =?utf-8?B?RWgybnhvNWExTk56UW5uM2Vob2ljbTB1d3pQcUNRMWh0cTJoNitrU2FzenBP?=
 =?utf-8?B?MmkrYUtIOC9nQkNYSk5TSlJqT0NvTW1QVUlTQlJkMWxUZUV6R0FuaExYb2lj?=
 =?utf-8?B?a2t3aFV0L291SHZDdUJPK0ZIRUlINXVESWJ3RXhwMk40eituMytkWU16YjdT?=
 =?utf-8?B?dDdKMUh1VUZoWWxYY05HUmFtcjlET0o4bHY0VTZkZ0RiamI3MmcvbjBBYmZj?=
 =?utf-8?B?eWRlbElPYUNFWWNXSFFGRnZwU1ZvZ1U5NFR2QkR4VDJvZkI3QWFIYUpXa0Rh?=
 =?utf-8?B?SmlBdzdKcXB1ekZMTU14dVJnTkJSd1lIcjRrQlllbEVHbk1MbzBYK05Eb3BY?=
 =?utf-8?B?T1hRdG5NOWNTRkhBa3dYM0ZGemhTVzY5bEFtYmllT0R1TEloNDFvY01ra0Nl?=
 =?utf-8?B?SmNMbFBpZ01XUTBUNVo4WFpVUmFuNmU0U3NLN1o4cE1VV2x4SjlHMExwazZR?=
 =?utf-8?B?OUoxMXV1anlDZHJKcmp4UTRWbk9aUFJmRTl4Z1dFS09TNVhkSDFQMzRtdUR1?=
 =?utf-8?B?ZXpDa2VGMWttVUZxM0FhcGZIc0NUZjdubTRoWHhNVlpTd21QdWdjQnVmUG44?=
 =?utf-8?B?MXQ3R2RLajY3a0ZVL2NyS3RMWjVDdGxFSml5MjVQS3g0RVR1ZWJ3MU83YzNO?=
 =?utf-8?B?aWRMZ3ludkthSXpBUHRmQUZTV0pCZmxLSzY3djVqbzBlbXJhL3BmSHk4TjJG?=
 =?utf-8?B?VktkbnBHMzM5ZUZNeXFWMjlKcUlIR1ZKajA2VjhCOGtVcjM2RE9hNG1NbU5O?=
 =?utf-8?B?S3Z0L2oxN0tGZXhuK1Z5aVU5dmw5ZlpCcTAwWWlBYWN0cjA1TEtucHZ3Ykp0?=
 =?utf-8?B?RXRKWVZMelZRODlGdUpsR0gzRURDd2ZEaitDU2wwL2l0bzRsSmUydzZxUlJP?=
 =?utf-8?B?a2ZJaHV1azFhUm5vc3BtVGEyakRKZ2duY3ZYOTNZMzlPTVFUbS9Ldz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR10MB7347.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6497f863-5a31-4147-5315-08dec14f958d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2026 09:07:48.8448
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AJoj8SlWoKSguw+iIeaVA5MCsB9qBhJUtYg7QznqU+VnobjXGzRKuRdoC3DoNY9vJ3JHD1AhC3hnSgW++LSdPXg7/wHGnnSpCQPXnS3nX4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB9827
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2026 09:08:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238087

PiBGcm9tOiBSb3NzIEJ1cnRvbiA8Um9zcy5CdXJ0b25AYXJtLmNvbT4NCj4gU28gd2hhdCBpZiBh
IGRpZmZlcmVudCBtYWNoaW5lIGVuZHMgdXAgd2l0aCB0aGUgbG9nIGJlaW5nIGluIGJvb3QubG9n
LjEgb3INCj4gYm9vdC5sb2cuMz8NCj4gDQo+IEkgdGhpbmsgYSBiZXR0ZXIgc29sdXRpb24gaGVy
ZSB3b3VsZCBiZSB0byBqdXN0IGxpc3QgX2FsbF8gZmlsZXMgdGhhdCBtYXRjaCBib290LmxvZyBh
bmQNCj4gYm9vdC5sb2cuKiwgc28gdGhhdCB0aGUgY29ycmVjdCBsb2cgaXMgYWx3YXlzIHNob3du
Lg0KPiANCg0KDQpBZnRlciB0YWtpbmcgYSBjbG9zZXIgbG9vayBhdCB0aGUgY29kZSwgaXQgc2Vl
bXMgdGhhdCBvbmx5IGEgbGltaXRlZCBzZXQgb2YgZmlsZW5hbWVzDQpjYW4gYWN0dWFsbHkgYmUg
Z2VuZXJhdGVkOiBib290bG9nICh3aXRob3V0IGV4dGVuc2lvbiksIGJvb3Rsb2cuc3Rkb3V0LCBh
bmQgYm9vdGxvZy4yLg0KDQpTbyBpbiBwcmFjdGljZSwgd2Ugc2hvdWxkbuKAmXQgZW5jb3VudGVy
IGFyYml0cmFyeSB2YXJpYW50cyBsaWtlIGJvb3Rsb2cuMSBvciBib290bG9nLjMuDQoNCkZvciBy
ZWZlcmVuY2U6DQpodHRwczovL2dpdC5vcGVuZW1iZWRkZWQub3JnL29wZW5lbWJlZGRlZC1jb3Jl
L3RyZWUvbWV0YS9saWIvb2VxYS91dGlscy9xZW11cnVubmVyLnB5I244MzgNCg==


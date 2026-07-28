Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB28C54F51
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 21:31:06 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1736.1785274263463954930
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2026 14:31:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=z+O1gEWi;
 spf=pass (domain: siemens.com, ip: 40.107.130.31, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EniFhjedygjRg1XqWNV0DKOXsDyG0H4XX4kEttBCRMeK2dlKQjy2fkywzm8hgNchCgaMazaCdLi5QEgT3st3xfZcwIuLCPNH0lrPd78S598fQufyvo039PoKvQv2k4xQmzubPJddA748WqOJZJbgFNfl2Mp42nNmJU0/8dSyc8C4CoO5/kZOyTrwk4YXwHAUENcl8OFQaXm2AMCApgMScWcWNBVRTBKIgXVNxaxqTJ6lIcjLuaz8Ug6b1YU+1nX48DwgmWAFSQmExvdkRC3Cnywy2bFrvhEoeCX20KB+opVCxpcyFWa5IAcTx5meufmoJymJwtDODqDdfbG5uC7+vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCycl4F6erBwevQw3Xf1MTNKtfKjUMRF8quR+pM3ajk=;
 b=D/6KcUMKecEyGS6RlQevYDd5eZcWvDAQnIMYU7rUOmiXgg91/J98UHMUj73219irWcTl7RLLxCojX85Lgtm4rJ9UUoThm3FaxqVoZwv+UtMk/VCj9zxUOKGu02A44prex1MQBVmW7X4Z3mQwvNhUq+/b18H/oSSvMrHwXlTj9MKZOda3O9IBua66COXh0/3ZHYGHYqhK3/Np4RpHV+sBWf3OrApYKWzx2el37pc93dMA2YZ7CoOgOlXyjw7wGogjh0JbGVMdQq8iWMCOqg4Cu+pu6xpoiIu6DbLQoW5wJniOeRPSlxQf9hMH4LELbqnFjrgVC2AVIcdUfR6HR2tjTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iCycl4F6erBwevQw3Xf1MTNKtfKjUMRF8quR+pM3ajk=;
 b=z+O1gEWioN9pW6vzfuymmPOlWzNdb9DZXd0bg9dgnO8Kxs8LiUSXnmpTu15xzhAisJBKpHNSHmI+IPpFiT69dMIUpthO7xLv/JIfAmsCyHTpahNxGRataC+QfNDU43RwMVXlitl7ymCzP732+k5Ebm1hvgXfEBUqJc2+GyUNO3pjioqtVVI/xxNwxWINglx4ofQKSRPc3XUvzfgVjT9hj5OjtzcpSnJw9XZgLbJFnNCmAP1ZeI6hzXNh0Xm0usXyUXylnAeE5H+ZVCF14YcbMkqp5HUgMptF6+JTNSxemEPXXzQU7N8Ta11vOPoL8CiO6BqFmJRoLb6FytzXtoAVDA==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by DU4PR10MB8830.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:567::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 21:30:59 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%4]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 21:30:59 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Paul Barker <paul@pbarker.dev>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Benjamin Robin <benjamin.robin@bootlin.com>
Subject: RE: [PATCH 4/4] python3-ply: set status for CVE-2025-56005
Thread-Topic: [PATCH 4/4] python3-ply: set status for CVE-2025-56005
Thread-Index: AQHdGUM3W0Y0yKwc+UeWncL4FbL5zbaC13UAgACmirA=
Date: Tue, 28 Jul 2026 21:30:58 +0000
Message-ID: 
 <AS8PR10MB5073D5E9E2FF1038118E6A76FDCB2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20260721190005.49809-1-peter.marko@siemens.com>
	 <20260721190005.49809-4-peter.marko@siemens.com>
 <718e51a8c619547ceb9691aec9dc8f16be87b4c9.camel@pbarker.dev>
In-Reply-To: <718e51a8c619547ceb9691aec9dc8f16be87b4c9.camel@pbarker.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=726df8a5-4bb7-428c-9bfd-91489c9aa591;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-07-28T21:30:07Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|DU4PR10MB8830:EE_
x-ms-office365-filtering-correlation-id: 1b82476a-bf48-4f30-b9a2-08deecef840d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|4143699003|56012099006|11063799006|10067099003|6133799003|18002099003|22082099003|55112099003|38070700021;
x-microsoft-antispam-message-info: 
 M6FzoNlFkv6LzfZJbEU90UQ6EiXy8OP0I6Sk2seTOz1358xVDeSM89r/TgrlqaDeGph+0OhfyITIY7KZkT910XWsAmYtIU4thNw84XEbHmFeg0Qx8Vi0i1aoGD/Qr0kY4s907aQvZrMCuTXwOJijHNKIbdrYtKyhfMaQgqhtO5oyyXad8NeSm88xQJyOsNhi/hpd7TKzGYHvB0uq79t6VuaqUnjjjK1mUS8iAj9scK5Dd1UD9RSDM4VIy7TWFNMrWhqpCKRFHgs3miqFrvc/ftWXNvNCLyoDKTYVDo3zGpMXrEYK+uLP95y35UShJ2jREtGMy7qPh/OwYepgRsIMUyIG2lYvZJuCbw2ByFpGg6FuhxX85YFq6diUl3Vq+P2R5V2jnFw1QinA4woY8vyF+HdEC2GfTKB4wekrqBfeLdQO9FRGBiUeWQzbMBYzkblxSLT0XT4UMZU/LvERIxn+DqDtYGsrQ9idjvQcDH/aZ4T5yPJCBjG5j2GuDsDyoxxy0HBon7uFOaDru0402o+xfcenS8KBGe4vzFtZWgs5E0ZfPEjuWvDoSLjqJdQqZZzcM9aEd0YLGJ5n9Bj5yhEB2h1I43lb8C3uSk5KtHZ+tM8oTq6UWo3Po4CqtUFxxpvc+3BYv51NlG0rXvX1zGZZ80kAnjRVgn/qnq3wiUyu6pC6qhhFpvrze21TV4mgyQqhP8/nw57vzvj7PrM/USZEJkj2b2bhnG/YciPOn32yK94=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(4143699003)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003)(22082099003)(55112099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?azBiSnF3UWUzTXpqR2MwWFlDTG1lZlhPTi9vb0wzb2JJRkhmTERCSjBQM0Zs?=
 =?utf-8?B?Ly9LQzJUWGpZZDhLRzVMMFlIRWkzZTZRRHNQUTUyQkNCZGw2eDJweVA5aEJx?=
 =?utf-8?B?aWtGcG5JTzlmVXVJNlFwQmVLTHQvVU1nVk53SjdZL1F3WU05Ty82ZG5TblZ6?=
 =?utf-8?B?aXBvc05Xb0JwWXhQTVR0RFA3T2lhRmFXczFBSm1BTUhCVkplckNjVmZwN1g1?=
 =?utf-8?B?TUN3NW4zSFBqc0wxSy90bEd1dGdBd2o4THgxSUdVNE15V1NJVjRBK1E0dXI3?=
 =?utf-8?B?WmtiUFJGb0pNZ1d4QytuMVNZZzhVTldoaThEWW1KVkt3MEhTek9DSitad1VE?=
 =?utf-8?B?cnFqODFpTTViclRBSXJZTWNRTnA1OFdpNmxWQlkrVzYwem9TOFlrWGkreGFZ?=
 =?utf-8?B?UDU5blNiR1I0WUpoSmdXK0ZJdzAwTFdIRG5TMnhCbStZRkVwb1JSdG9FTWtH?=
 =?utf-8?B?VE1qRmhOaVd2SzhIaTNOSmRrVHNpN3R5aEc1V3huT0JGYjNjVmxnUWhsRmhp?=
 =?utf-8?B?bGpoQlZHS29XYnpERjR4SXVYNnFPaTg1cEI3dFV3aEp2RlkrTjEvNUl4S1Ex?=
 =?utf-8?B?NURmNTdnVzNOckF2M0lWZW9OZE5VQTlvL1FVeWVyMnIzUDQzRm9vclorTTVz?=
 =?utf-8?B?YmlmZ1MzQUNrajhaL2t3ZXFWRzh6ajBRS25ZWVRzUDRFL2hUakZBQ2lubGoz?=
 =?utf-8?B?NmFzalZabjEvRE9abmdoYng2ZGsvS1FzMEg0Zkx6T3YraHNnazhjanVNU1Av?=
 =?utf-8?B?UjAwdWU5dGdmempGYTB5NFZxNVlIOXZiS1Q1NU5FN0d3bW5kOSs3bU1CcklX?=
 =?utf-8?B?UUMya1JvWWxpM2xubGtaV1IvWnNEZVFwM2c2dlIrQXFCamQ4L25DenR1dEFN?=
 =?utf-8?B?bXB0VzhkT0tDbFBZc0NYZFBHWlZQSzY2eHNEb3JtS2lXemU5TlFPcnV2SFhu?=
 =?utf-8?B?MC8yT29mc25HMDhHQXM2Z2xLeGdBY2NrMlZaR3pRS0NFVHpYME9RM1RDcS9q?=
 =?utf-8?B?bzRIY2tJWGVOZ1BEUTlTbkdMOUQ1emRMNHRTMjVNcEZrY2xPTHFJeVZ3V0t1?=
 =?utf-8?B?TEtCNGNSQVR1bmZZQjYrYXpzRUZUeEFSSDdta3JIUk5sSTJWRnlrT2kxQUQ2?=
 =?utf-8?B?ZFB5cUVEUWloQkg0YkJPcDV5K1VBdTlnQk9VUFdibkxzNDdLTzhpZm5zMXp2?=
 =?utf-8?B?TjZNM0pZV210Ykl0WkIwaVlkRnp2Z0dMVEdjVEdudUlEMVI5YXM2bXY4aGcx?=
 =?utf-8?B?U1JUVmpIUTZ0ZGtsa3B2TngzV0dqTkd2UE9RTGVldVV3RkdoYm5Sei9YU1lO?=
 =?utf-8?B?OGtNa08wc0xDSmZwZzM2Z2pNQmdOaE5XeDIyS21vSitjaXVnK0pmTm5Fd0V6?=
 =?utf-8?B?TVJ2cUkvSnVtelNFRk9RNzZmUjVRNGlSR2F2Z3pacFloaVRyTlNGOWwvYkhT?=
 =?utf-8?B?aUlLR3g3OGF4WWVKaUVzVzFYUERMUllqcmVsL0lCYjFFcEtUYTZSZzBXcmNq?=
 =?utf-8?B?Q3dGc1FCZkZPbHhxMnVFZ1diTnBxTVc0cmlVRWErcytleDMrdk9xVXZla2hp?=
 =?utf-8?B?eklDL0FjdnZVa25rVUpGZWNFTjJmS003VkI3dGE4ZVk1ZC92RjVMODFtaWR2?=
 =?utf-8?B?dGVoOVJYUGRQOC9seG1FZ1RUd3ZaMXZtYWt4Q0xYUFNOZzZGeEV6NlFGazNo?=
 =?utf-8?B?ZDY1ZTZPZUxseVcvK0REL0NtRzh4YitaUFNKb3pFS3A0d2hVS2haNmJxczhz?=
 =?utf-8?B?VXJVL0g2dUdDSklkbCszWVdmS3JyUzZNUVVkU3F1ajBrNWRzN0N4dUxaNXBx?=
 =?utf-8?B?Vk1yTllxY2hycHA0NXpCeGI3dDB5WHdFV1pGSEhWRkMvS2NERC9GSnBGUTdG?=
 =?utf-8?B?c2pwWmpaSVlJOTU5b2lpQU5KdGxSc3d0Rm5JbHJRWnIwbHlrWll4Q0dLVldv?=
 =?utf-8?B?bmNQN1o2NktaTkNYZVRNbDJVeFhaODlEVVZHUVA5dTdpcm1YQ0E1SmJPL21x?=
 =?utf-8?B?b3hlNHpSRjhyMXhPZGVxQ1l4Z2NMSU4rR0ZScHhYVG5BbTgvRmFGTGhpVWsy?=
 =?utf-8?B?QXVON2xmMnNEWlpxYVI4bkV5ajBwY25PWHJFMmpEdlJ6aFZZbjF5cng0NXpm?=
 =?utf-8?B?bVhCVm9hVWpaejBZYk4xNG0wUTIvZSsxU2RmNGtjZmtSTEJUNkVjQmlWcllS?=
 =?utf-8?B?THhodHFCRUhKUEJFK2JLNTZJeHFjSkxQbkRoYmRTSWtyWTJweGE1bnVuWTZO?=
 =?utf-8?B?TjFETS8xSEhDVzdqOW5iSjRlQmZnMGJkMzF6Y0NydlIzeFFVdXM0QXcxRVJk?=
 =?utf-8?B?UkE5M0tjREJCd3lXZ0ZVd1ZManZiWHlXQXNOWXRBaUcwUlF5a1pmZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b82476a-bf48-4f30-b9a2-08deecef840d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2026 21:30:58.9957
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gI2EsCMshDJ6HaumC10ANyCyckZaswhiwrCfXsP3XBDFREapSCfWOqHxFGFo3QGXm0bKwTlw3nSBTkzcgjSBxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8830
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jul 2026 21:31:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242201

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGF1bCBCYXJrZXIgPHBh
dWxAcGJhcmtlci5kZXY+DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bHkgMjgsIDIwMjYgMTozNCBQTQ0K
PiBUbzogTWFya28sIFBldGVyIChGVCBEIEVVIFNLIEJGUzEpIDxQZXRlci5NYXJrb0BzaWVtZW5z
LmNvbT47DQo+IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCA0LzRdIHB5dGhvbjMtcGx5OiBzZXQgc3RhdHVzIGZvciBDVkUtMjAy
NS01NjAwNQ0KPiANCj4gT24gVHVlLCAyMDI2LTA3LTIxIGF0IDIxOjAwICswMjAwLCBQZXRlciBN
YXJrbyB3cm90ZToNCj4gPiBGcm9tOiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5j
b20+DQo+ID4NCj4gPiBUaGUgQ1ZFIGhhcyB0YWcgZGlzcHV0ZWQgYm90aCBpbiBOVkQgWzFdIGFu
ZCBjdmVsaXN0VjUgWzJdLg0KPiA+DQo+ID4gWzFdIGh0dHBzOi8vbnZkLm5pc3QuZ292L3Z1bG4v
ZGV0YWlsL0NWRS0yMDI1LTU2MDA1DQo+ID4gWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9DVkVQcm9q
ZWN0L2N2ZWxpc3RWNS9ibG9iL2N2ZV8yMDI2LTA3LQ0KPiAyMV8xNzAwWi9jdmVzLzIwMjUvNTZ4
eHgvQ1ZFLTIwMjUtNTYwMDUuanNvbiNMNjMNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBldGVy
IE1hcmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4gPiAtLS0NCj4gPiAgbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBseV8zLjExLmJiIHwgMiArKw0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBseV8zLjExLmJiIGIvbWV0YS9yZWNpcGVz
LQ0KPiBkZXZ0b29scy9weXRob24vcHl0aG9uMy1wbHlfMy4xMS5iYg0KPiA+IGluZGV4IDA2Mzkz
YWM0ZmUuLjEwNTg2OTdmYTMgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXBseV8zLjExLmJiDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLXBseV8zLjExLmJiDQo+ID4gQEAgLTE2LDQgKzE2LDYgQEAgUkRF
UEVORFM6JHtQTn06Y2xhc3MtdGFyZ2V0ICs9ICJcDQo+ID4NCj4gPiAgQ1ZFX1BST0RVQ1QgPSAi
ZGFiZWF6OnBseSINCj4gPg0KPiA+ICtDVkVfU1RBVFVTW0NWRS0yMDI1LTU2MDA1XSA9ICJkaXNw
dXRlZDogVGhpcyBDVkUgd2FzIGRpc3B1dGVkIg0KPiA+ICsNCj4gDQo+IEhpIFBldGVyLA0KPiAN
Cj4gSSBsb29rZWQgaW4gdG8gdGhpcyBhbmQgcmVwbGllZCBbMV0gd2hlbiBzb21lb25lIHByZXZp
b3VzbHkgc2VudCBhDQo+IHNpbWlsYXIgcGF0Y2guIEknbSBub3QgY29udmluY2VkIGJ5IHRoZSBk
aXNjdXNzaW9uIGxpbmtlZCB0byBieSBOVkQuDQo+IA0KPiBTaW5jZSB0aGUgZGlzcHV0ZWQgdGFn
IGlzIHByZXNlbnQgaW4gdGhlIGN2ZWxpc3RWNSByZXBvc2l0b3J5LCBJIHdvbmRlcg0KPiBpZiB3
ZSBjYW4gZXh0ZW5kIHNib20tY3ZlLWNoZWNrIHRvIGRldGVjdCB0aGF0IHRhZyBhbmQgc2V0IHRo
ZSBzdGF0dXMNCj4gYXBwcm9wcmlhdGVseSwgaW5zdGVhZCBvZiBoYXZpbmcgdG8gY2FycnkgQ1ZF
X1NUQVRVUyBhbm5vdGF0aW9ucyBpbg0KPiBPRS1jb3JlLg0KDQpJIGhhdmUgY3JlYXRlZCBodHRw
czovL2dpdGh1Yi5jb20vYm9vdGxpbi9zYm9tLWN2ZS1jaGVjay9wdWxsLzI3DQpMZXQncyBzZWUg
aG93IHRoYXQgZ29lcy4uLg0KDQpQZXRlcg0KDQo+IA0KPiBPbmUgc29sdXRpb24gY291bGQgYmUg
dG8gdXBkYXRlIHBseSwgcHVsbGluZyBmcm9tIHRoZSBHaXRIdWIgcmVwbyBbMl0NCj4gaW5zdGVh
ZCBvZiBQeVBJLiBUaGVyZSBpcyBhIHN1Z2dlc3Rpb24gdGhhdCB0aGUgdnVsbmVyYWJsZSBjb2Rl
IHdhcw0KPiByZW1vdmVkIGZyb20gcGx5IGFzIHBhcnQgb2YgdGhlIHJlZmFjdG9yaW5nIGZvciB2
NC4wICh3aGljaCB3YXMgbmV2ZXINCj4gdGFnZ2VkKSBbM10uDQo+IA0KPiBJdCdzIGFsc28gd29y
dGggbm90aW5nIHRoYXQgdGhlIG9ubHkgY29uc3VtZXIgb2YgcHl0aG9uMy1wbHkgaW4gT0UtY29y
ZQ0KPiBpcyBweXRob24zLXNwZHgtdG9vbHMsIGFuZCB0aGVyZSBpcyBhbiBvcGVuIGlzc3VlIFs0
XSBmb3IgdGhhdCB0byBlaXRoZXINCj4gZm9yay92ZW5kb3IgcGx5IG9yIG1pZ3JhdGUgdG8gc29t
ZXRoaW5nIGVsc2UuDQo+IA0KPiBbMV06IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29wZW5lbWJl
ZGRlZC0NCj4gY29yZS81NmZkMGQ3NWZhM2FiODFkZDUyYjRlNzkyMjg0ZTAyOWQyZDkyZjUxLmNh
bWVsQHBiYXJrZXIuZGV2Lw0KPiBbMl06IGh0dHBzOi8vZ2l0aHViLmNvbS9kYWJlYXovcGx5DQo+
IFszXTogaHR0cHM6Ly9naXRodWIuY29tL3NwZHgvdG9vbHMtcHl0aG9uL2lzc3Vlcy84NzgjaXNz
dWVjb21tZW50LTQ2NzQ2OTU1NTENCj4gWzRdOiBodHRwczovL2dpdGh1Yi5jb20vc3BkeC90b29s
cy1weXRob24vaXNzdWVzLzg3OA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiANCj4gLS0NCj4gUGF1
bCBCYXJrZXINCg0K


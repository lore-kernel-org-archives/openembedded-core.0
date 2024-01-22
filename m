Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22CFFC47DD9
	for <webhook@archiver.kernel.org>; Mon, 22 Jan 2024 14:52:32 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.77])
 by mx.groups.io with SMTP id smtpd.web11.75938.1705935143782445859
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 06:52:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=LcuZ+TaL;
 spf=pass (domain: siemens.com, ip: 40.107.8.77, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hoesN3yDI/KNZZUtmL3HWYA9nKPfF3S6uefX1gu7hriHc7OW+RdfFmFDAbVH9+lZjTgV2wxFkL9hYbGSqtIz8aq+xPmKynhh2TNc8od1yRbqFfijimu7rWq2+/APJ1gsFz4uVRK0Vsp9hIGRYapSeJDP7LZea2hi4Mj+3P3vczl3Rbb0pi2PJfGq/tAv9vaj6pVLTHHkGHpQCjlYXKEr1m0yVXLwEC3p3dmpcNpIlpiu8LKmc7KJ6316Lr4fyRK84GGUtpnYHS9InIPBrXkrdWBzi3H78VXH2DvZXeLDvDa6u3weyQRm69YYwUr5grVx+rdW6fN2hu5GhVqYoXQesQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ALpTes5UZgAq2HpcLR5xI1FzsaDR4+McTRRQGUaQS5E=;
 b=cFdJKWPl8WDblpPkFtODdxlS9GRi8/nwBvsPMiOJ43OEYnCus9xJa5UyiJYfjlXt/mxjmw346rGNDACx3OmNyR8qXe8nPvK5WGSgDpcYx7MtwWm0kacqgvTJNoSC19bIbXXxUpRetOI94pXVunJIXLCYMutslR0nLW/SdoGaZ61KANjoNXBAJ0/RI0ZHFmqX2UP4ZsNWbYaVl4PQgYq3uaLqyQab5jI3HPPNN3emXE6Oft642k/oVOGv0xYbGdPnma+MHP6/+RQE2hDGJZMuXyj1SdyXamjZDoRr/dvg2hlGrLVIYXR5UvX2i+szVlzuC3Rw2iaPbtYfPIuPvdpCjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ALpTes5UZgAq2HpcLR5xI1FzsaDR4+McTRRQGUaQS5E=;
 b=LcuZ+TaLs7yt2OlYFtUhOFSaMfOzfn+jwTRyBZ8ZzFoVF61jNRXumzWTC+3JcBdcm/avM5a98Mk/ErHWlRXqrmfl3Tv+QEUIlVcFnajOwd1svrmvcDdyx5Mr0vsxyCVuXQtyGFZZCWT5wdxuCgCQ+BnqoRchxyaGB9cp/qAiie8sHkVj5wP8E1zxPNTdGHZXhOwCsMzpgXlO+9Gx5MVma5i9JSSemeSgKI3j04rZbUrxYvqUB04ZsKA/wYnYUTRq7ubAW+fODzR1/eCzA5X0I/yNXAsMq0r+scX4WF0G3ExuuZmfa2CI+v6Fsn71VNVuP44P+KrPVhdSD3gWCQaviA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS8PR10MB5902.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:527::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 14:52:19 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c496:afda:bc34:6b5e]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::c496:afda:bc34:6b5e%7]) with mapi id 15.20.7202.031; Mon, 22 Jan 2024
 14:52:19 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 3/5] zlib: ignore CVE-2023-6992
Thread-Topic: [OE-core] [PATCH 3/5] zlib: ignore CVE-2023-6992
Thread-Index: AQHaTTvpAe1f3dt1tUSQL+qINVakNrDl4AZwgAADnACAAAYHYA==
Date: Mon, 22 Jan 2024 14:52:19 +0000
Message-ID: 
 <AS1PR10MB569793527853A6F941EB8316FD752@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240122140406.3837333-1-ross.burton@arm.com>
 <20240122140406.3837333-3-ross.burton@arm.com>
 <AS1PR10MB5697D9500BD9ACE6C5006C54FD752@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <E01A3F45-0755-4500-8CA6-D9F9F0C49534@arm.com>
In-Reply-To: <E01A3F45-0755-4500-8CA6-D9F9F0C49534@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=faee44ad-2eb5-48ec-9ae6-ebae1c1ffbbc;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-01-22T14:48:30Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS8PR10MB5902:EE_
x-ms-office365-filtering-correlation-id: 633d113d-6c7a-48f9-b092-08dc1b59bb9c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 n8TQu1jsU+RfgB0Z1dEUEG2S/7jGQLKDa82de69Ci2EHlNSkyB0pT3M/gJfS19XvMEcvZPNlIayK306TpO9NACP+1ktHVRAzuCLiMQPWTcE54zglox1OCRWcKO1a7DH2Qbl1T9Qkm3VGFeldFkoi/zjJNTGazDL78972E1Kr+euO/vUM4EBOMmQEmFomk6De0d8Iz9proizHTfvKDd2gnMbCG01ENlHdedCZEs8nLqSJBHCKg0rRpevo4w6DNMKSKIKLpTvKXMa9hT+OZ34sCPPtNmNnjCZNMN6/OYaK8IQskRX1zW4+zK0hrG1W0xrRVbn/R1FZf6T+mPRU9CrYDvWdmirPczUB1gFvdlNRK3FYPkGyFY9lAHadIs7W30UhjfC7A1K2SeO47TfTvvp7mWVh2jo7Bd8Nw5373ya4ziaVhY/Ct1TaDxTH0meNac9vRc5x/N1OR35zoFSC2W9U0Yi9CVod7sguWZ4hHu2r8H80Bp/Y2Mt7rQPtiBTfKAAbO2jC7e/CfZeMW21j8utPvbbiQPalioQB7Ebroqz/J/KAqTHsO7cf2iNACyuIy2YRWlP2U9GJz6HLP/VES8vyLuqTbDXo/tYN/bQa3DE+o2w=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(396003)(39860400002)(136003)(366004)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(38070700009)(33656002)(55016003)(86362001)(122000001)(82960400001)(38100700002)(26005)(83380400001)(9686003)(966005)(71200400001)(66899024)(66446008)(6916009)(478600001)(8676002)(53546011)(8936002)(7696005)(6506007)(316002)(76116006)(64756008)(66556008)(66946007)(66476007)(4326008)(52536014)(5660300002)(2906002)(41300700001)(4001150100001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RFdOS3d1SVhtUjlvZUg5dEVEWTNzdkN0TXovRDA1aVJiNTFYM0lOK1hjdHZm?=
 =?utf-8?B?VEQyTlpsVmtHRlhZdkpkMHJnVWpKTW5HMWxsbVBEeVl4cHVyNFl6UEpsQTFE?=
 =?utf-8?B?MjdOSXltcjl0ZmxwZmlQa29HdUVQaUwyaEhyQUJEZGlINWt3NGEyZG45aEo0?=
 =?utf-8?B?UmU1VktvdFMzS2xnbUJXcmxreGhpSWpyZU8rM1BaUXd5UmVzRnRrK3pEUDhJ?=
 =?utf-8?B?Y2RwNUdJNU1CRldhVDB1aThINzg1djY3eGp3L09VOVFHUllVRVNoQ0Nkc0la?=
 =?utf-8?B?OWg0UHBvSkVWUnJxbEtXSDhUbzdRQmM3MFdSaEQ5aWlsNzlrMmMramgwQnVn?=
 =?utf-8?B?WlVBcGxSSVd6R1BOZDZsTURCbGI5RldDMWd5Rm9WQmdXd1R2dnN3eU5uaUZN?=
 =?utf-8?B?V1ZnVVBIYmV4YWY5NXZuREpkczFzb2phUjJXQVBqZjB5NlgrSnlGQ3VrK3dW?=
 =?utf-8?B?REYyVVB5OWdpN1VIaXNlZCtxRmxUK2R3emNuVlpUc2xiWnVFT0hWTkVLRTY0?=
 =?utf-8?B?SXBQbEUwRDJtcERZaEFZMC80M2kwK05GVzlNS3l3R3pmVWk4UG02b0pRcFlm?=
 =?utf-8?B?eVBsalhVWXhaSER4TjNtTThHWFdYVVA5SzljeS9ybWd0bHlJYzVZd3pzWmpp?=
 =?utf-8?B?Q2t1MU9RaTNWdEZ5TTRxYS91NTRQSWhmM3R6RjdUaWVCbGwrL1JuZlRpUk9m?=
 =?utf-8?B?RnMrWTArdjlFc3gvMVo4bWlSdEVUN1V1ZmZxR2YxZXdoT0kyNjEzUzhBeTd5?=
 =?utf-8?B?Zkg4Uy9oenpIYklGME5HanZSYVlHRWtMRUtpczZrVEFnSkRnUllPNGJ4dG9P?=
 =?utf-8?B?TVpRTllST0lkS3FYRmh2K0NHNnczSEVvWUdUMFduYkVxb2V1bXppNEd2WDlD?=
 =?utf-8?B?THRqRXpmamd0dHZrZzJ2SWl2azV0UEM1YWNzWVVsNWl3QWVEU3Uvb3M5cEl0?=
 =?utf-8?B?dk9MM0hJOEdUVUNFR1Z3U1lLUlE2bU56dHMvb0dkaXZ0elFld01LenJjQy9t?=
 =?utf-8?B?ZS9HZXRiWW1qY3pVWWhJUXByM3ZZc2RMdEFpOFB0TkdnS1l4Q3JzcEVvclJr?=
 =?utf-8?B?UUozczA0UlRLZHZLK0NWaStlVGFyVE1QclJHeWdqb2QrNkJUS3ZsbGhJN0pN?=
 =?utf-8?B?T1ZoSHlpWWYxcTJKNmZKMG8rTjNMemd2Z1QxRE0zYTg3NmRnZmxBSm1wczdO?=
 =?utf-8?B?QWZTQk93OUxzdjVHeWcrTGVOMVFnaDRNL2hiMTRXOW1uSGZtK2NSY2NaRUR5?=
 =?utf-8?B?bWgva0d0eDZZUUsrYlhwdWdUMkhDUnVoby9pVWRKaEZuZyt1UHdhWVErU2FR?=
 =?utf-8?B?VlNJbGNhSmFTa1pQb0l2aThFQXNveWhRd3dYOTRmWDh3S1BNbmtzaXpQZGR0?=
 =?utf-8?B?K3FwR2oyaG8zTU1GVkxrVERjSE5XZU1qOEdhQm4yQzdzZUp3d0laMjU0T0dZ?=
 =?utf-8?B?UTlOSFppSXBRVU5IM1ZybzkyUUdqZUdiUndsZHk0UFIrZXJTSkVEK0NLTysy?=
 =?utf-8?B?MkdMTjExMEtiMmNMZHU4UkNxdjF1QzZKb0YxY3I5ZTV4cGJrejRnWjNkQlRN?=
 =?utf-8?B?QWxwWVFmWlZlN2JmczR4VUo3UFpTQzRzZFd5YUNoZlJXb1RPcVF6aWpEcytT?=
 =?utf-8?B?Sml6RzNZcEpYNmRxWmpzOUxyNXNOS2dDWmZQOStwbVZrRUZzNGtxb3B3dXRE?=
 =?utf-8?B?S3JGM2ZseHZSZjZYZnFDYVRvS2NwMXkzOG5MMUtwWE82MjQ2bDkvSktFeWVV?=
 =?utf-8?B?a2xkV2Z6aUdqd1k5RGFEZjRvU1gxa1J2NGVTRHhJOVBDQzJsRUQ2QUcxaVNq?=
 =?utf-8?B?T2QvcEFoUEh5R1paWE5FZEs3OExWODlxRHZBQVltMUZNMWpseUxaOW1JeFNl?=
 =?utf-8?B?UEZnNjBibnhLcXE4dEdpVEFlZ2xndW5UWlJmeUVrbDFxUVBEWEZHSmJFSVlq?=
 =?utf-8?B?YUFqdjJFQ0VJVWxYVEJFT242RC96V2lCMlBNTEdpbXNDK1B4VkRhZ1ROVWJY?=
 =?utf-8?B?ZVg0L0poV25zRHVabWd2SE1LMS9pMkVzZ3FoVzk3bmJ3clZHZzQwb2orUjdi?=
 =?utf-8?B?L0JlQXIrVVN0Z2xEbmw5R2QvVTdLOXorVkJOZFZDb3VtOFZzUWV6T0dRbzRP?=
 =?utf-8?Q?wS5lfPxt5jauUeBg4Yfna39Z6?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 633d113d-6c7a-48f9-b092-08dc1b59bb9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2024 14:52:19.2970
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vn8wRyU3nvAsrsPOu+yTJ+07nqZf+3LJkNMhcU3Wn7l4tfHjbFPY6N0omDFXVvsZFiuDDCUyki9bl6UlQYm70A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB5902
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 14:52:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194173

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFJvc3MgQnVydG9uIDxSb3NzLkJ1cnRv
bkBhcm0uY29tPiANClNlbnQ6IE1vbmRheSwgSmFudWFyeSAyMiwgMjAyNCAxNToyNw0KVG86IE1h
cmtvLCBQZXRlciAoQURWIEQgRVUgU0sgQkZTMSkgPFBldGVyLk1hcmtvQHNpZW1lbnMuY29tPg0K
Q2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJl
OiBbT0UtY29yZV0gW1BBVENIIDMvNV0gemxpYjogaWdub3JlIENWRS0yMDIzLTY5OTINCg0KPiBP
biAyMiBKYW4gMjAyNCwgYXQgMTQ6MTYsIE1hcmtvLCBQZXRlciA8UGV0ZXIuTWFya29Ac2llbWVu
cy5jb20+IHdyb3RlOg0KPiA+IA0KPiA+IEhpIFJvc3MsDQo+ID4gDQo+ID4gSSB0aGluayB0aGlz
IG9uZSBpcyBiZXR0ZXIgLSBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1i
ZWRkZWQtY29yZS9tZXNzYWdlLzE5MzYwMw0KPiA+IEknbSBub3Qgc3VyZSB3aHkgaXQgd2FzIG5v
dCBwaWNrZWQgdXAgeWV0IGFmdGVyIDkgZGF5cywgYnV0IEl0J3MgQ1BFIHdoaWNoIGlzIG5vdCBt
YXRjaGluZywgbm90IG91ciBjb25maWd1cmF0aW9uIG9wdGlvbnPigKYNCj4NCj4gQWggSSBkaWRu
4oCZdCBzZWUgdGhhdC4NCj4NCj4gSG93ZXZlciB0aGUgQ1BFIF9pc18gY29ycmVjdCwgaXRzIG91
ciBtYXRjaGluZyB3aGljaCBpcyBub3QuICBJIGFzc3VtZWQgdGhlcmUgd2FzbuKAmXQgZW5vdWdo
IGNvbnNpc3RlbmN5IGluIHRoZSB6bGliIENQRXMgdGhhdCB3ZSBjb3VsZCBzZXQgb25lIHdpdGgg
YSB2ZW5kb3IuDQoNClllcywgaXTigJlzIGluY29uc2lzdGVuY3kgb24gb3VyIHNpZGUgYnV0IHN0
aWxsIGluIENQRSBmaWVsZC4gQ3VycmVudCBDVkUgc3RhdHVzIG9wdGlvbiBkbyBub3Qgb2ZmZXIg
YmV0dGVyIHNlbGVjdGlvbi4NCk15IGNvbW1pdCBtZXNzYWdlIGV4cGxhaW5zIHdoeSBJIGhhdmUg
Y2hvc2VuIHRoZSB3YXkgdG8gaWdub3JlIGl0IGFsdGhvdWdoIGl0IHdpbGwgYmUgaW4gdGhlIHJl
Y2lwZSBmb3JldmVyIChhcyB2ZXJzaW9uIDIwMjMtMTEtMTYgd2lsbCBiZSBhbHdheXMgaGlnaGVy
IHRoYW4gUFYpDQpCdXQgSSBjYW4gYWxzbyByZXN1Ym1pdCB3aXRoIGNoYW5naW5nIENWRV9QUk9E
VUNUIHRvICJnbnU6emxpYiB6bGliOnpsaWIiIGlmIHRoYXQgaXMgdGhlIHByZWZlcnJlZCBvcHRp
b24gdG8gZ28gZm9yd2FyZC4NCg0KUGV0ZXINCg0KPg0KPiBSb3NzDQoNCg==


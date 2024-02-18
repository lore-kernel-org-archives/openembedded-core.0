Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A392BC48BF6
	for <webhook@archiver.kernel.org>; Sun, 18 Feb 2024 22:10:15 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.61])
 by mx.groups.io with SMTP id smtpd.web10.28053.1708294213168522992
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Feb 2024 14:10:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=MhaFFl/t;
 spf=pass (domain: axis.com, ip: 40.107.241.61, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RrIu/dgkzaM7P36HPhU0cXBxUMivhICFJFm2S6238Czp84oK9klwU4MbIHeS7OGf4xMcYMOAdfKY6pNZxdvz8thIdeP4G1B9pjMLt6J23tf9+szkVZI5QnWrLkVahFQhmOcQ8WYPlgAG+LpJWga/n62FqQ0Qi0vHuetSWubhQJOvfbESk1MD3cCHUCX3YgVn0uWK+Xr9miXYKpZHzj+2yIkICIJmqY43rYkc/iJ+ybBm9YHfmkNT4LnzPajleGh5IWj/t1w7Rby8mojU1QWMWUXwtl1CUm55a8CSmbaw555OM7jnQHzFglD8Pm1D+ydlXVIij/6f7EEIbkMvE9CZLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LflaaQP8YL5L+o7UrKrqdzmHKM+aLWlzZn4aVoIIfcc=;
 b=ck2XJ/3AysRQppRD8NnAll83poHH23KyH3HsF/Um3dHtd94rMzPWoLS85piege8xNmo6ioCnzyi25sTxHx8ND8OhZe9ynfWc2PkIxyvdvqLrqVxg0we85fVtUpxu3OSud8eb1uCXwIp1EiGCenuIh8J/ua10v5lIJn9NnNoKvQf9zpJmHuqsyJzXK0wnJ6eKcgCRQTgACatPB80DOFAUaDLvGI8PKLgN1fdh/GzshB5yjnU1gPCEbDuXFkTL62PTxbkSEa9s1GU+AntOf6qvrHDV8QahiuBXo+y8BeKG9hKwC/KAlRVcdm2ss3lSkoa1LT1yRXwXYRkWIvGInduYjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LflaaQP8YL5L+o7UrKrqdzmHKM+aLWlzZn4aVoIIfcc=;
 b=MhaFFl/t3d6oXRUSYr+eEvGCupip1MX2bWvCn3JLAzI8Fa6ZOU6Fsz/ueVK5w/SWefyyCfv07EAET6/kOwLaTO8f/FGAxpV0LbMIc4c4RUMtPSBaqT7HQH9SIpwmdoMdljOKVrqFcplyjs//cNDLc+CtVKdy32uTJtU3U9TWmvs=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DB9PR02MB8159.eurprd02.prod.outlook.com (2603:10a6:10:30a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.34; Sun, 18 Feb
 2024 22:10:08 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::546:7e4f:ddb1:92d7]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::546:7e4f:ddb1:92d7%7]) with mapi id 15.20.7292.033; Sun, 18 Feb 2024
 22:10:08 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 7/7] lib/oe/patch: Use git notes to store the
 filenames for the patches
Thread-Topic: [OE-core] [PATCH 7/7] lib/oe/patch: Use git notes to store the
 filenames for the patches
Thread-Index: AQHaYZ2Yy0UvlBLwV0WcAuoABdnyVrEQqRxQ
Date: Sun, 18 Feb 2024 22:10:08 +0000
Message-ID: 
 <DB5PR02MB10213AA33A86077900A14418EEF522@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240216185956.2606978-1-pkj@axis.com>
	 <20240216185956.2606978-7-pkj@axis.com>
 <1913878c922f5791522efce3a9fb31e55ed01988.camel@linuxfoundation.org>
In-Reply-To: 
 <1913878c922f5791522efce3a9fb31e55ed01988.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DB9PR02MB8159:EE_
x-ms-office365-filtering-correlation-id: fd10b8cd-bcbf-44e4-3daa-08dc30ce5e9b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 bPez3QlC8i3sLoNB1Stjqvj8biUdIC8NnNVTOroGs2D5wctBaF3Xtvk4qvg2UTDfbc+HI2LbqepKD9xMaoKNwm+D0bclk9UAtP+yrrYlcS5sBBe75vlUnFJV3vHQRbFEb7K2CYzFeoY5+MztyZjZgpGXJOxzy5Xh4n8zcCou/uLZtBFnPVLFSt3s3Wuf9R3GGO7+QG059oCevHoPeS4fOo4AYGbJJ9wlYzlmHjxyjkVr+R0YVPI/p0UyMpcJUvYHpb8EoQa0YB8RlECanalqbm0QxMuKz6ATO6N/2dis1MJcjwi45pMY8Zqby4X+AYO6DROnEwwMAD4MfKGOt2CUkAzRX9LoPJl1iPj3G//IXozGbxGNng+YPKDMEJbigfQ2YpRxd85QQlD/hntTUgrtueDjK5A8cShz8o9ltbLjGuZZgBO5gaTXrURs4bk1+adm8wGvFWW5lLFiTXHG5wQJEzmK3DZIXMOSyUu8sBhFHFK+Y0Wfp1ipcIcKaz0yLRAT2562Xa/n0lSUyky516fCE4bLun6j8K68d61hbJk+c9hyXo2KaJUP+W/WoP+EPvh7MEfmjl5xT//KKcaApcLsKjGeJa/RZpfMkCfhrT8ZtJs=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39850400004)(396003)(136003)(376002)(366004)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(33656002)(86362001)(38100700002)(122000001)(83380400001)(478600001)(966005)(316002)(64756008)(66446008)(66476007)(66556008)(110136005)(76116006)(66946007)(71200400001)(26005)(6506007)(7696005)(53546011)(9686003)(38070700009)(8676002)(8936002)(44832011)(55016003)(2906002)(5660300002)(52536014)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WTJ4eWQ2eUVtZHVVVXJKK2ozZUZ3c2l3KzRETitqZVZ2alk3dGZUdEpuNzZF?=
 =?utf-8?B?aGlMRXllcjVwdVpMYUlkOEpCUmdGYTlqTVFFWVM1aHdURVY4SER6Z2R2WlU0?=
 =?utf-8?B?NkN1eXpzU3lOaWxvRFhWUkp1VHhCRk9mcDQxTk1FNnJzOE16YU95S0ZSM2dI?=
 =?utf-8?B?SklhSWFONVUwOTA4RWY4cUtOVDk1NWxieUVQWXhkVVJmcmlaME1ETEh6MXNY?=
 =?utf-8?B?bkh3c05sdFhlV0pyYmM4bUNaZzdqNFVsRTdCWmxEZHVqNjNlK0VCWitlTmhB?=
 =?utf-8?B?RlJwR0t1QmF5V3ozRXVIclRlcC9RUzROR2NNWGdhdXF4R001bHc5OTAwejZC?=
 =?utf-8?B?VC9OcDZBdklhREtNVzVnMDNYaEVSTmkyRjlaV0NtWUlWOExVSThna1lxN2xS?=
 =?utf-8?B?WWYwbnhRMEYxa0pWM3RsK084ZVlwRUp1Sk5vQ2RjYStRbmRQZzEvNFAxdkJP?=
 =?utf-8?B?TkFKZGRUTmplT0h1UW93V0pNVFhxZ1pXT1FsOVVmY2pGa3RNNTRUUHltSFRI?=
 =?utf-8?B?WU1UTXNQaG5ic1pVQWhCTEV1bWxwRC8xSFZ1SjN3ekc2bVA0bFdPRkpQL1Jr?=
 =?utf-8?B?eWVwTjZtcVVTTHFmcnA5MkIzZ0h4QzVrSGJrK3NkeDluR3FXc3dFekNxYmMy?=
 =?utf-8?B?OG9SeGl3RlZPUVo5QmlNSWdIdnZWSUNWU1lFN3hKb0REemJMY2wvYUN2YjJ4?=
 =?utf-8?B?amptN2xyMjBjak1TVk95MkZLa1o4UGRHMW5JdndjL0RzRHNVUnpWYjZVeHB1?=
 =?utf-8?B?SzlaYmh5UG83ZXd1VU5aTVJGcFlGaHR6TEs5WU94RXo5ek1YbDdNd3NGUTVv?=
 =?utf-8?B?NjhEQlFBWHpMTkk4bGs0ekpVUGZldVA1WWRxWHQ0dGxVcUs4enRBNGtuOHk5?=
 =?utf-8?B?bk80UUtEUDdXOG41dTBJTUVrR28yc0ZxWlhsekhmdlV5SlhMNUp2UnhrVVlE?=
 =?utf-8?B?TEJxdWdHRzJWZm02S25FV3Q5ajJ5SDlTTTJqZmk5WExCQXhHM2UwSzlNSlls?=
 =?utf-8?B?WVlYV3p6MkZveWJQQm1RODVhckJGODVUV0V1bXZQYzFGRERpWEszWTdCK2li?=
 =?utf-8?B?RklncXpUT3lCTHNpZ05EYWp0Z04yL3MvVnp3TFBpRW9maldoWGwvS2p1eVRx?=
 =?utf-8?B?VWltd3l0WnFraWtxbVdrY0M2Rkp0T0xBMGowM0tMNzBBeTBieUpEOHl3VnF4?=
 =?utf-8?B?UlZtU3djeXZPRDFOaCsrSWpmZzhsWFNWemsxVDV3d2lFVk9YR0dnODQ4UEJF?=
 =?utf-8?B?MXN0SVpLeDh4djExWFBTRXpmMHJLWVc3YzF0UXdOc0tJVVNBL3dYMEJFY3JN?=
 =?utf-8?B?eUgvaUxjaHpXT2l6MkhDanNuYkphamtzMnVvTlUyaWNaVnQ0KzRLYVNNdVNn?=
 =?utf-8?B?bUV6MDNySUpPQWZqaURaS2ZpRzUvNXMzeDNBRlZsOVNPWGdmeTV2cGk5bVRL?=
 =?utf-8?B?SlJVeUhPbVQrTldNNUdqMVNtRnJMZnBVRzF6dGRLYXJBUlFjdVpoZUZUaHBL?=
 =?utf-8?B?WHBvRjVOWkZnbmlWQm0zcWV5WW5KTXQ5Zy9Sb0NIRS9mS0MzbS96UThYRXcw?=
 =?utf-8?B?a09hYy9LdHl3SERTWGRmdDZ3SS9ORFN6OGJ1NyttQVd3M3BMczlaZGJJb1E3?=
 =?utf-8?B?OXVERmd4R0ZQSjE1cXBVMlZaUEFNOWlWV29UbzFiUGhKdXJKQjR6MFdSNmFD?=
 =?utf-8?B?SDR6QlBvdFdQME50TUwrTXZXYTYzZHVmNitzQS9XWjNRRkdHeDdPSkdvYjFy?=
 =?utf-8?B?T1YxSFJweDRGRWdwS0gvZDc2TDlUVk5tZEtDb0VETXhqck9Teml0TXpHZENs?=
 =?utf-8?B?K0ZEbkhBaS80a28zQUJuZms4NUZKcjJrWVVYTWt6Y0lpdCt5Qk96OVluVlVn?=
 =?utf-8?B?N0lzYk9FMmxTYmVVU1VLdnBkbU1TNjc1RnVOK2x4bm92YVM5MWprOG5UNFho?=
 =?utf-8?B?TzdjVFRGdytTMHpFMnVkQzBvblRnUjk2MWsxc0N3QjFOUEFocVgvZFBrT0w2?=
 =?utf-8?B?dlZMUWlVeExjTThjQlRpNGFZVUpMQTFNUWllZkVKZmtKKyt1dy8rZEs1aHpY?=
 =?utf-8?B?UTdZS0F6WW1vWDJ3NHZHMVRNd2pVZVR0N3VwaisyRGhSTVJsVUFVbXJYYlFq?=
 =?utf-8?Q?wVMc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd10b8cd-bcbf-44e4-3daa-08dc30ce5e9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2024 22:10:08.7911
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WVS2y0uB4MGu6+aMkbg5wwQtGK7MZvWKRktJwWvkMnzk8SdDOhkgd1rvXh7DHHMV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR02MB8159
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 22:10:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195851

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogZGVuIDE3IGZlYnJ1YXJp
IDIwMjQgMTM6MzQNCj4gVG86IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0
QGF4aXMuY29tPjsgb3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcN
Cj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggNy83XSBsaWIvb2UvcGF0Y2g6IFVzZSBn
aXQgbm90ZXMgdG8gc3RvcmUNCj4gdGhlIGZpbGVuYW1lcyBmb3IgdGhlIHBhdGNoZXMNCj4gDQo+
IE9uIEZyaSwgMjAyNC0wMi0xNiBhdCAxOTo1OSArMDEwMCwgUGV0ZXIgS2plbGxlcnN0ZWR0IHdy
b3RlOg0KPiA+IFRoZSBvbGQgd2F5IG9mIGtlZXBpbmcgdHJhY2sgb2YgdGhlIGZpbGVuYW1lcyBm
b3IgdGhlIHBhdGNoZXMgdGhhdA0KPiA+IGNvcnJlc3BvbmQgdG8gdGhlIGNvbW1pdHMgd2FzIHRv
IGFkZCBhIHNwZWNpYWwgY29tbWVudCBsaW5lIHRvIHRoZSBlbmQNCj4gPiBvZiB0aGUgY29tbWl0
IG1lc3NhZ2UsIGUuZy4sICIlJSBvcmlnaW5hbCBwYXRjaDogPGZpbGVuYW1lPiIsIHVzaW5nIGEN
Cj4gPiB0ZW1wb3JhcnkgZ2l0IGhvb2suIFRoaXMgbWV0aG9kIGhhZCBzb21lIGRyYXdiYWNrcywg
ZS5nLjoNCj4gPg0KPiA+ICogSXQgY2F1c2VkIHByb2JsZW1zIGlmIG9uZSB3YW50ZWQgdG8gcHVz
aCB0aGUgY29tbWl0cyB1cHN0cmVhbSBhcyB0aGUNCj4gPiDCoCBjb21tZW50IGxpbmUgaGFkIHRv
IGJlIG1hbnVhbGx5IHJlbW92ZWQuDQo+ID4gKiBUaGUgY29tbWVudCBsaW5lIHdvdWxkIGVuZCB1
cCBpbiBwYXRjaGVzIGlmIHNvbWVvbmUgdXNlZCBnaXQNCj4gPiDCoCBmb3JtYXQtcGF0aCByYXRo
ZXIgdGhhbiBkZXZ0b29sIGZpbmlzaCB0byBnZW5lcmF0ZSB0aGUgcGF0Y2hlcy4NCj4gPiAqIFRo
ZSBjb21tZW50IGxpbmUgY291bGQgaW50ZXJmZXJlIHdpdGggZ2xvYmFsIEdpdCBob29rcyB1c2Vk
IHRvDQo+ID4gwqAgdmFsaWRhdGUgdGhlIGZvcm1hdCBvZiB0aGUgR2l0IGNvbW1pdCBtZXNzYWdl
Lg0KPiA+ICogV2hlbiByZWdlbmVyYXRpbmcgcGF0Y2hlcyB3aXRoIGBkZXZ0b29sIGZpbmlzaCAt
LWZvcmNlLXBhdGNoLXJlZnJlc2hgLA0KPiA+IMKgIHRoZSBwcm9jZXNzIHR5cGljYWxseSByZXN1
bHRlZCBpbiBhZGRpbmcgZW1wdHkgbGluZXMgdG8gdGhlIGVuZCBvZiB0aGUNCj4gPiDCoCBjb21t
aXQgbWVzc2FnZXMgaW4gdGhlIHVwZGF0ZWQgcGF0Y2hlcy4NCj4gPg0KPiA+IEEgYmV0dGVyIHdh
eSBvZiBrZWVwaW5nIHRyYWNrIG9mIHRoZSBwYXRjaCBmaWxlbmFtZXMgaXMgdG8gdXNlIEdpdA0K
PiA+IG5vdGVzLiBUaGlzIHdheSB0aGUgY29tbWl0IG1lc3NhZ2VzIHJlbWFpbiB1bmFmZmVjdGVk
LCBidXQgdGhlDQo+ID4gaW5mb3JtYXRpb24gaXMgc3RpbGwgc2hvd24gd2hlbiwgZS5nLiwgZG9p
bmcgYGdpdCBsb2dgLiBBIHNwZWNpYWwgR2l0DQo+ID4gbm90ZXMgc3BhY2UsIHJlZnMvbm90ZXMv
ZGV2dG9vbCwgaXMgdXNlZCB0byBub3QgaW50ZWZlcmUgd2l0aCB0aGUNCj4gPiBkZWZhdWx0IEdp
dCBub3Rlcy4gSXQgaXMgY29uZmlndXJlZCB0byBiZSBzaG93biBpbiwgZS5nLiwgYGdpdCBsb2dg
IGFuZA0KPiA+IHRvIHN1cnZpdmUgcmV3cml0ZXMgKGkuZS4sIGBnaXQgY29tbWl0IC0tYW1lbmRg
IGFuZCBgZ2l0IHJlYmFzZWApLg0KPiA+DQo+ID4gU2luY2UgdGhlcmUgaXMgbm8gbG9uZ2VyIGFu
eSBuZWVkIGZvciBhIHRlbXBvcmFyeSBHaXQgaG9vaywgdGhlIGNvZGUNCj4gPiB0aGF0IG1hbmlw
dWxhdGVkIHRoZSAuZ2l0L2hvb2tzIGRpcmVjdG9yeSBoYXMgYWxzbyBiZWVuIHJlbW92ZWQuIFRv
DQo+ID4gYXZvaWQgcG90ZW50aWFsIHByb2JsZW1zIGR1ZSB0byBnbG9iYWwgR2l0IGhvb2tzLCAt
LW5vLXZlcmlmeSB3YXMgYWRkZWQNCj4gPiB0byB0aGUgYGdpdCBjb21taXRgIGNvbW1hbmQuDQo+
ID4NCj4gPiBUbyBub3QgY2F1c2UgdHJvdWJsZXMgZm9yIHRob3NlIHdobyBoYXZlIGRvbmUgYGRl
dnRvb2wgbW9kaWZ5YCBmb3IgYQ0KPiA+IHJlY2lwZSB3aXRoIHRoZSBvbGQgc29sdXRpb24gYW5k
IHRoZW4gZG8gYGRldnRvb2wgZmluaXNoYCB3aXRoIHRoZSBuZXcNCj4gPiBzb2x1dGlvbiwgdGhl
IGNvZGUgd2lsbCBmYWxsIGJhY2sgdG8gbG9vayBmb3IgdGhlIG9sZCBzdHJpbmdzIGluIHRoZQ0K
PiA+IGNvbW1pdCBtZXNzYWdlIGlmIG5vIEdpdCBub3RlIGNhbiBiZSBmb3VuZC4NCj4gPg0KPiA+
IFdoaWxlIG5vdCB0ZWNobmljYWxseSBtb3RpdmF0ZWQgbGlrZSBhYm92ZSwgdGhlIHdheSB0byBr
ZWVwIHRyYWNrIG9mDQo+ID4gaWdub3JlZCBjb21taXRzIGlzIGFsc28gY2hhbmdlZCB0byB1c2Ug
R2l0IG5vdGVzIHRvIGF2b2lkIGhhdmluZw0KPiA+IGRpZmZlcmVudCBtZXRob2RzIHRvIHN0b3Jl
IHNpbWlsYXIgaW5mb3JtYXRpb24uDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBLamVs
bGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4NCj4gPiAtLS0NCj4gPiDCoG1l
dGEvbGliL29lL3BhdGNoLnB5wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fCAxMDUgKysrKysrKysrKysrKysrLS0tLS0tLS0tDQo+ID4gwqBtZXRhL2xpYi9vZXFhL3NlbGZ0
ZXN0L2Nhc2VzL2RldnRvb2wucHkgfMKgwqAgOSArLQ0KPiA+IMKgc2NyaXB0cy9saWIvZGV2dG9v
bC9zdGFuZGFyZC5wecKgwqDCoMKgwqDCoMKgwqAgfMKgIDE1ICsrLS0NCj4gPiDCoDMgZmlsZXMg
Y2hhbmdlZCwgNzggaW5zZXJ0aW9ucygrKSwgNTEgZGVsZXRpb25zKC0pDQo+IA0KPiBJJ3ZlIHR3
ZWFrZWQgdGhlIEVYQ0xVREVfRlJPTV9XT1JMRCBpc3N1ZSBhbmQgSSBjYW4gc3F1YXNoIHRoYXQg
aW4gYnV0DQo+IHdpdGggdGhhdCB3ZSBzdGlsbCBzYXc6DQo+IA0KPiBodHRwczovL2F1dG9idWls
ZGVyLnlvY3RvcHJvamVjdC5vcmcvdHlwaG9vbi8jL2J1aWxkZXJzLzg3L2J1aWxkcy82NDMzL3N0
ZXBzLzE0L2xvZ3Mvc3RkaW8NCj4gDQo+IHdoaWNoIEkgdGhpbmsgaXMgZnJvbSB0aGlzIHBhdGNo
Lg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KDQpXaGlsZSBJIGhhZCBjaGVja2VkIHdo
ZW4gYGdpdCBub3Rlc2Agd2FzIGludHJvZHVjZWQgKDEuNy4xIGZvciB0aGUgDQpmdW5jdGlvbmFs
aXR5IEkgdXNlKSwgSSBoYWQgbm90IHJlYWxpemVkIHRoYXQgdGhlIC0tZml4ZWQtdmFsdWUgb3B0
aW9uIA0KdG8gYGdpdCBjb25maWdgIHdhcyBvbmx5IGludHJvZHVjZWQgaW4gMi4zMCAod2F5IGFm
dGVyIHRoZSBjdXJyZW50IE9FIA0KbWluaW11bSByZXF1aXJlbWVudCBvZiBHaXQgMS44LjMuMSku
IFRoYW5rZnVsbHksIHRoZSAtLWZpeGVkLXZhbHVlIA0Kb3B0aW9uIGlzIG5vdCByZWFsbHkgbmVl
ZGVkIGluIHRoaXMgY2FzZSBhbmQgY2FuIGp1c3QgYmUgcmVtb3ZlZC4NCg0KSSBoYXZlIGFuIHVw
ZGF0ZWQgcGF0Y2ggc2VyaWVzIHRoYXQgZml4ZXMgdGhpcywgdGhlIG1pc3NpbmcgDQpFWENMVURF
X0ZST01fV09STEQsIGFuZCBhIHByb2JsZW0gcmVsYXRlZCB0byBob3cgZ2l0IHJlYmFzZSBoYW5k
bGVzIA0Kbm90ZXMgd2hlbiBhIGNvbW1pdCBpcyBmdWxseSBhYnNvcmJlZCBkdXJpbmcgYSByZWJh
c2UuIFRoZSBsYXR0ZXIgDQpjb3VsZCB0cmlnZ2VyIHdoZW4gZGV2dG9vbCB1cGdyYWRlIGlzIHVz
ZWQuDQoNCkkgd2lsbCBzZW5kIHRoZSBwYXRjaGVzIG9uY2Ugb2Utc2VsZnRlc3QgLXIgZGV2dG9v
bCBpcyBkb25lLi4uDQoNCi8vUGV0ZXINCg0K


Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E70C3DA6E
	for <webhook@archiver.kernel.org>; Fri,  5 Jan 2024 11:14:25 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.94])
 by mx.groups.io with SMTP id smtpd.web10.21437.1704453263291906552
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jan 2024 03:14:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nedap.com header.s=selector2 header.b=uGS3LA7x;
 spf=pass (domain: nedap.com, ip: 40.107.249.94, mailfrom: jermain.horsman@nedap.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lUrqOhfoGvD7kSU6IkSIl56iEwEGxxvrMth5DEC6JxDe3SO/vmpJ5PSJbgym0OdhpQtSifdMI7FQ2AaGwibgaq8/PfTPXrGr+ZK+LgiSxzV4TVXjwWbVjCw4JNQynNuRGCFhkyta3aFh8fYULRk/X7K+knRIe2Cb4BEuGPka488BiEEkX74BAmpUdYUPsMSv0ZFnxmuffXGXxz16WrXYSpGu8RoAF5Uzae3EtmOzUaMrHkERLmuGB44904B2lFyzgyf/5vXDLStWRemOyCEQ/yJnJyqFhAE1Vcaq505Z4f8dHR3sY1i5q7uAv0WyUdWAZtXWDxKgQBcN8bKzXlo22w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Ts+ayyKbS+EBACaKn2gU0yM6D0BDfeVe2tosHRPMcE=;
 b=g4xc1CWvTWZFrjZMbxoWwlr1x1sCFWnRxDQv19iOahbNTyH7e1EXAHoY1F3W4jK+xIBjSGRIazTUmLVBjqNHCw7eG3SGExnIoqNeyHw/U3MFUM8XodQMwNEQZJVEF2Y3btFOTkJz1NXy64kMTwhObw9QrkjFm7HB4UkjU/K4CHV2RxHANsObgy+ncS++hkiSitBuog1uBclTBR0Katus6mSTzp/CBGf+KfI1k6/LNl0wUgVBH5/5EHbtvJQO8Be4DzkBd1UObd5hmSzvszd8D1JNMb7uZNead7epS9CgHW6aFeLfeaBVgtKkXc6wCJa6jjXQWFp2WrMbUYpdx/4m4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nedap.com; dmarc=pass action=none header.from=nedap.com;
 dkim=pass header.d=nedap.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nedap.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Ts+ayyKbS+EBACaKn2gU0yM6D0BDfeVe2tosHRPMcE=;
 b=uGS3LA7xv0JAG8kplcSYbHunEgPaAbei8c+XZ1MxX8sf+AenO7Uc9B61UhCy25T6Z8LBlwcR07GUD5GoeRx1J9VN42PS9puNsUy2fWfjTVm7mZlEOxCZ1C7MWPhKnQMsQ97r7gx2YpqgP5TZ3oiY8qQjjyqK6SmQ1zShACtF+Fg=
Received: from VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:137::14)
 by PAWPR10MB8089.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:381::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.15; Fri, 5 Jan
 2024 11:14:19 +0000
Received: from VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::32f2:104e:1590:a7f2]) by VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::32f2:104e:1590:a7f2%4]) with mapi id 15.20.7159.015; Fri, 5 Jan 2024
 11:14:19 +0000
From: Jermain Horsman <jermain.horsman@nedap.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [RFC v2 1/2] bitbake-layers: Add ability to update the
 reference of repositories
Thread-Topic: [OE-core] [RFC v2 1/2] bitbake-layers: Add ability to update the
 reference of repositories
Thread-Index: AQHaPwqN1qm2xhvOzk+ExMHLf+YhwLDJ938RgAEa09A=
Date: Fri, 5 Jan 2024 11:14:19 +0000
Message-ID: 
 <VI1PR10MB318284AEBA21614AB71C2EB9F7662@VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM>
References: <20240104123420.932-2-jermain.horsman@nedap.com>
 <20240104123420.932-3-jermain.horsman@nedap.com>
 <17A7372B437A2AE2.16812@lists.openembedded.org>
 <CANNYZj_t4AR01a=BHc6fTQYpe08rN2Vd7h7Okr+GOmBD6dd0ww@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_t4AR01a=BHc6fTQYpe08rN2Vd7h7Okr+GOmBD6dd0ww@mail.gmail.com>
Accept-Language: nl-NL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nedap.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR10MB3182:EE_|PAWPR10MB8089:EE_
x-ms-office365-filtering-correlation-id: 3b653916-bc54-44fe-4684-08dc0ddf766c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 VQ4Fz/oWoLNDJuTXRFOOLDnYevzjwrNmRQBvLe5HwXNYOFvOygC3hqggoaZ7QC24Jy2lUL5s5ATcpgXaH56fDXwJcajEnRvPV6pM273IdkqlHIXV78SjkngiUUopVi5CQeshAp4PNAtKoQdiqTq6D3RxuJQMIkX2DR2wBk+A/OgoGOqxnVQEZUA1MBJefkxvkVCIsxT8+//C4x2ReAjmVGlY9S0gqSOGbDEfZeQfQUi0tE40io1OuGyaHet+ABrPqEilySdwZdwzUiVpXxS/auDxvrJ41i6yLkhrQ7sQ6qhUfeUHzb2wB3XT4tg8urE1wzw67WO7oQixPpj5s3iIKZPPaIwDOkcf+ZIqPxBrGYqUMUZdXS+sA9+KKkKA8BsG8SIy4YZlcsMU5Toc3vxWMBI2TWW4ilzv1j3ZfzXnbWoya/5H8qkSLvmxHYSRuFEHJVyO+mZ9iEvyjS25rNwrXVnXZh3IxbaFVa7KjKFOeNZfDDcFtw/9A2rzjifLg18pj+g7lLUlh/9G9pPEigdYSfevQeGg9yX992xUldS8Z4yI6VJ4B3kfNfgNqlrdhNnp2M1lFb8nl6sktHztLzbOtMRkScJHgwfQEbmT8KpAR8B266vZ9uXi0h3k5ABpU3WY
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(39850400004)(366004)(346002)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(26005)(478600001)(9686003)(71200400001)(7696005)(6506007)(83380400001)(4744005)(66476007)(41300700001)(2906002)(66946007)(6916009)(64756008)(316002)(44832011)(15650500001)(52536014)(66556008)(4326008)(8936002)(5660300002)(38070700009)(66446008)(8676002)(76116006)(38100700002)(122000001)(33656002)(86362001)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NmhSWEhYcVVOL0ZjbmVDa0xiS1ljdVo4VGdid3VzNitiQlliMjJUZWNZWG91?=
 =?utf-8?B?L3dhQngwdFhTbE9xRHRJbXFoLy9GalNiM2lrVFdsSkd6YWp2UTRkU0VtZVB4?=
 =?utf-8?B?eUgzTTVWVGZOazkySVNZM2NmS3VMbjZEbUN3Nlh5UGdPRzBlekYvNGhENU95?=
 =?utf-8?B?dms4aEpQRVg2enNwY25Ydk5UdWc0enlaam9CZ2x3WnU3bk9WWUpkeFR5ejV6?=
 =?utf-8?B?ekpRR0ZjbFdqbGlPVVdwNXpneEFlOHhoTURSREpzY1c1Q2RVak9vakxDNjQr?=
 =?utf-8?B?Z1BHTk1QMXQ5UVlnWE4wZjlnU095UVM3NU9qWlVMM0ZjWXMvSUtuMjczQXZk?=
 =?utf-8?B?Y2lLc3pFc3NYcTYwa3RrZWY2MG5xbnFET2VVMkthTS9WSVBDZU5ialJmMDFl?=
 =?utf-8?B?QXVsVGdScmNRdVVNeCtubUJTSGVMYTh6YTB1MW5pNHRiYkxKRURJMWYwa1Nz?=
 =?utf-8?B?RnM3RFA4ODhPUkEzcGRaQkxOOGZzaFk1SnhyZVhVTmpTcURCTHFkNDhqbUZK?=
 =?utf-8?B?Uk8yTEVuczVvRXErRFVDVVNPbmxJSk11VmhQN0t5UjkzN1lhZHhmZ1FiM3VW?=
 =?utf-8?B?aXBDNFVvWkpKQ2RHSXU5cXVrdi9jczVzVzR2OHBaZlZZK0xrOEtMN0Rob29w?=
 =?utf-8?B?SWVhMzd2dk9vR2NNMHhGTlVOYi82OURoZndsdEJwZ2tybC82eUtGYm0rbzZC?=
 =?utf-8?B?dVY5bzJnMnNRV3dnZ1JKVGZvOEI5Z3NMMnpyUmc2VXR4bVpLWVc0Q0F1Qld6?=
 =?utf-8?B?TjhUb0FscVA0bWZZK0p4TlVkMFpNVXI5MTZtV1E2czdKT3ZGTklyUGlBU2tt?=
 =?utf-8?B?UUtjTG81SEVtQUFnRkpYQUlReGxkcld0QnQ4MmZaTmxzdEcwcVZKcnUvUHFD?=
 =?utf-8?B?UnFXUklqRjJ3YXpERzRON08vVlovR3BKVWM3R29LRDdUNFFFaFdyMW1ROUtx?=
 =?utf-8?B?ZU5uUk0zUkxLUGRaSTZNSDV1UWs2UDNFOGt5WUpoTXdSSzgvNFArTlZxZHlD?=
 =?utf-8?B?NVM3NmlqNTNtU3NYK1hyTGM0ZXBiV09LNysrSy96RzdydDhSOHVKa0Ezalcw?=
 =?utf-8?B?dHFFNGJsQ1g4NUE0UDNteHdpQ1gwL3dTWHA5WEhOWTd3TEZTQlo4M2VqY0VD?=
 =?utf-8?B?Y3NLYU5CTGN5S3VuckorUmRoRlVPb2lRRVkxeSs1U2t1RjJlR1hCTk51K2I4?=
 =?utf-8?B?Ym5rREFKdXVvZ1JwV243YlpncnJkQzZwcmFMSlNNWWpCaUtZSVhuM1Bkc2s4?=
 =?utf-8?B?T3I5S3MwOGxpWnNHWUN2MFh6UGZ1Q3JRTDRlYmlkY1V2Q0lXaTlFY3puY2Q5?=
 =?utf-8?B?RktDT0tHU2IrUkdudUZxdDZiSitEVjU5ZWkwRTFTbkNjVjM5RUo5eVBjMWw2?=
 =?utf-8?B?TEp6MDBHaVhvM2hCanR4MmcvSm9DQWlJN1RlV29SdTlCN2wwMUJRaWYvbk95?=
 =?utf-8?B?NmZ0Y0lPemsyWk5objNzelN1STVoS3VqblY1eThyM25qNnMwM1JEVDZqQ1FX?=
 =?utf-8?B?RjBVMWszdWo2aGZocVluTHNzc0dCNnNDVC94TFVTeG5BSFplak5aS3FKK2o0?=
 =?utf-8?B?K0RCRHUvV3RKNTl3WnNObGZtSDZiV2JocEE0UlRLVXRHQW9nM3U1ZXEza1Zo?=
 =?utf-8?B?ZUNqV2YwdHdMK01Ob1dNYmNGTFJHOWVuKy8wL1pPZ0NySTVJRG4xRmVGVVFD?=
 =?utf-8?B?VWVIeDdjdjVlakFDRnBRaER5TnhEN0xsTEN2cVM4Qi91dFhvMU9YT1JhWW5m?=
 =?utf-8?B?UStFaEl5K3JNOHY3TkxhRldsSmxYb3AwSDVrQmxwVk1YSjFkNUZ5bWRQcDVt?=
 =?utf-8?B?cmw1N05NL214TFhtWDFpbDVGM0s0MTc1SjNiUTZoTWVTa2ZTWWVyd2oyeHMv?=
 =?utf-8?B?SFJpeEFTWGRmM3JXd0hlclhOd3RTSTFUQ0g0N3JRV1BjVXVncnZpV2RzSmhy?=
 =?utf-8?B?Rm81QlRDeTV1eVZOSXdXbmhIclFLSllhSUJ4eDQ0MzQ4Q2dUV1JzMUE4dkZC?=
 =?utf-8?B?amQ0SElYU2xSdGQzWXl6cTF1V2RXWUFjcFRQa28yeTM3NkhsbUV4bEU5Uysy?=
 =?utf-8?B?YW1XRHUrSkZPamY1MUpPQ0JIRXIyQUJXUTRwYkpmZkZLT0pYN0NiMlhFTHBz?=
 =?utf-8?Q?nEfh9NiIRB/zMyyqYDe8+6J2c?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nedap.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR10MB3182.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b653916-bc54-44fe-4684-08dc0ddf766c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2024 11:14:19.4813
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d21d161-0ae7-4a24-94cf-df0881e2fa96
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YpOoTXkB6G/6C98lrb8nhdCOpZaAoQilJq3F3wtz/htoOHr3iW0Ygz9/NR4/ivgZoMy97O20vrYS6fTXpaViYsfg3WIzVM5348RwczuYzaI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB8089
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jan 2024 11:14:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193349

PiBPbiBmdXJ0aGVyIHRob3VnaHQsIGlmIGRvbmUgdGhpcyB3YXksIHRoZW4gLS11cGRhdGUgY291
bGQgaW5zdGVhZA0KPiBzZXJ2ZSB0byB1cGRhdGUgZmlsZSB0aGF0IGFscmVhZHkgZXhpc3RzLCB3
aGVyZWFzIHRoZSBkZWZhdWx0IHdvdWxkIGJlDQoNCkkgd291bGQgcHJlZmVyIHRoaXMsIGFzIEkg
bWlnaHQgaGF2ZSBhIGNvbmZpZyB3aXRoIHJlcG8gQSBhbmQgQiBmb3Igd2hpY2gNCkkgaGF2ZSBj
aGFuZ2VkIGJvdGggbG9jYWxseSwgYnV0IEknZCBvbmx5IHdhbnQgdG8gYXBwbHkgdGhlIGNoYW5n
ZXMgdG8gQg0KdG8gdGhlIGxheWVycyBzZXR1cCwgd3JpdGluZyBhIG5ldyBmaWxlIHdpbGwgdXBk
YXRlIEEsIHdoZXJlYXMgdXNpbmcgdGhlDQpvbGQgbGF5ZXJzIHNldHVwIHdpbGwgbGVhdmUgQSBh
cyBpcy4NCg0KPiB0byBvdmVyd3JpdGUgdGhlIGZpbGUgd2l0aCBhIG5ldyBvbmUuDQoNClRvIGNs
YXJpZnkgYXMgaXQgaXMgbm90IGVudGlyZWx5IGNsZWFyIHRoaXMgaXMgd2hhdCB5b3Ugc3VnZ2Vz
dGVkLg0KDQpVc2UgJy0tdXBkYXRlJyBhcyBhIGJvb2xlYW4gZmxhZyB3aGljaCBkZXRlcm1pbmVz
IHdoZXRoZXIgb3Igbm90IHRvIHVzZQ0KdGhlIG9sZCBsYXllcnMgc2V0dXAgb3Igd3JpdGUgYSBu
ZXcgb25lDQphbmQgdXNlIGFuIGFkZGl0aW9uYWwgJy0tdXNlLWN1c3RvbS1yZWZlcmVuY2UgcmVw
bycgb3B0aW9uIHRvIGRldGVybWluZQ0KZm9yIHdpdGggcmVwbyB0byB1c2UgdGhlIGN1c3RvbSBy
ZWZlcmVuY2UuDQoNClRoaXMgbGVhdmUgdGhlIHF1ZXN0aW9uIG9mIHdoYXQgdG8gZG8gaWYgb25s
eSB0aGUgJy0tcmVmZXJlbmNlJyBvcHRpb24gaXMgdXNlZD8NCkRvIG5vdGhpbmcgb3IgdXBkYXRl
L3VzZSBhIGN1c3RvbSByZXZpc2lvbiBmb3IgYWxsIHJlcG9zPw0KQW4gc2VwYXJhdGUgb3B0aW9u
IGxpa2UgJy0tdXNlLWN1c3RvbS1yZWZlcmVuY2UtYWxsJyBzZWVtcyB1bmRlc2lyYWJsZSB0byBt
ZS4NCg0KU2luY2VyZWx5LA0KDQpKZXJtYWluIEhvcnNtYW4NCg==


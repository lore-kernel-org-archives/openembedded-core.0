Return-Path: <Jasper.Orschulko@iris-sensing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97FA5C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 14:03:36 +0000 (UTC)
Received: from DEU01-BE0-obe.outbound.protection.outlook.com (DEU01-BE0-obe.outbound.protection.outlook.com [40.107.127.77])
 by mx.groups.io with SMTP id smtpd.web10.80881.1705327415569048576
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 06:03:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@iris-sensing.com header.s=selector1 header.b=qe6ts+lJ;
 spf=pass (domain: iris-sensing.com, ip: 40.107.127.77, mailfrom: jasper.orschulko@iris-sensing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MyhG/lifOO5yMCbNp1WhrB39N4S321ap8jpGtbVap93L0AZ+p/CvbMSBLT21aqR4se46iig1LhwMMlasGfhu3LWcmu4ndEvBWAWyB60BKrQWJIfoEJPIFK55iZbKK/7y15A6rdQ4H/Xtqw4oaP7cl2g2QreXYtgkBJ4TKHTVn9ShcO88hbD7dqTy5EUqcdaiibdCHxvZ3FMneyIHQs3AtBfmXSCALMUrLgWnAkCD9DFOZDReAd/qQTgu897xUQWs+GletSxmLlown3m/FEyuOF2yKqKAly4olJhPOWjHCDsFX+s0ubL32jJ2TazwkvE4dMtCdvydvkFpw13zHFAxLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t3pwws55lJkzMeoUMcLOlS6nBLl6tDWyYAUGHb4h+lE=;
 b=GWuABw/tuL4IYpBdekx10Zb97FZnQp87J8jG6N8sPVwi6S8hJ/qs7CkqWTdvlVmCcQQAK1OwQHf3FbAGwkiIcc6Jrc+mKw0B9NUZkg1knPQVAPvB6b/sk7aFjcjVaVYkiVacsxM33WBHyQGewRjSaVlokXG9TghqvjP5Pc49dhZkCBlOIkDttrSKlqthxqvs6ksQaVbtT1VVWknyUZWOUdos1M1BcpolvoMljJ1W4bTc9/u3asYunyY7s1U8j+oe4x9taMaYF7qRJPqK6jvWnfQeihkadgwKZgDKRCOugkwj0gXi1Jj/Uw40W+wUfgg7p86asJYLrWE3XL1QYuB3gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iris-sensing.com; dmarc=pass action=none
 header.from=iris-sensing.com; dkim=pass header.d=iris-sensing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iris-sensing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t3pwws55lJkzMeoUMcLOlS6nBLl6tDWyYAUGHb4h+lE=;
 b=qe6ts+lJzIp1gwxlnCud3tRQIc4o5Kj1+kGrgk33GCzewpyTS2WcpTZgImVkDwQPhfOik44rUpzlYF8df8mrTFbVtn2Pha06qgBNaNDDVBYAWj5Ehz4bUmFBBSqLxQbcKBTUTCBgJwGXD/QYtanaEB+qZAcs6rbBGv61o9f1AdIq2cLg0xMmuCqOBVT3kPJWuJXeo4BrSNI6frsgjgFwgdaz1oln7u2npOMpVo01BsTrRyHwJTC1xOx9bklrMcJa454lCErJEsQZK3KMC0Bj6KtMwd+ZnSGJiRWem1IkHiubLySw5GI0pII475cwEVDl8FddrvkhDQXA5zeZvQC1hA==
Received: from FR2P281MB1963.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:3d::14)
 by BEUP281MB3414.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Mon, 15 Jan
 2024 14:03:31 +0000
Received: from FR2P281MB1963.DEUP281.PROD.OUTLOOK.COM
 ([fe80::1568:5c5e:8a0d:be4a]) by FR2P281MB1963.DEUP281.PROD.OUTLOOK.COM
 ([fe80::1568:5c5e:8a0d:be4a%4]) with mapi id 15.20.7181.026; Mon, 15 Jan 2024
 14:03:31 +0000
From: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "ecordonnier@snap.com" <ecordonnier@snap.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Removing Github release SRC_URIs from oe-core recipes?
Thread-Topic: [OE-core] Removing Github release SRC_URIs from oe-core recipes?
Thread-Index: AQHaR01toZjDsnahoEKeitp4QsxNjbDabEdvgAArzoCAAE3pAIAAAVEAgAABU4A=
Date: Mon, 15 Jan 2024 14:03:31 +0000
Message-ID: <36bdc27c8ff2eb0fa91e5bd8b44556dfc270fb49.camel@iris-sensing.com>
References: <2ef89f525fd5ceaec574d025c515033c06fcaf6c.camel@iris-sensing.com>
	 <17AA7149AA53F0BC.13033@lists.openembedded.org>
	 <CANNYZj9yuJemGmM3aLqL+LEaixSrqchgH3406fzreQbqzjwPaA@mail.gmail.com>
	 <CAHUKmYYnztYA5zJN7StJzLcBzW9gexFbD2PNhGD6rzc7BW0pmA@mail.gmail.com>
	 <8a632115c057bcecff50ef9404802670f072c4a6.camel@iris-sensing.com>
	 <CANNYZj8jPYgXuu8FzGOLD99Rxv7wxWdy3KCMtAN5YERhibrawA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8jPYgXuu8FzGOLD99Rxv7wxWdy3KCMtAN5YERhibrawA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iris-sensing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR2P281MB1963:EE_|BEUP281MB3414:EE_
x-ms-office365-filtering-correlation-id: 145a8fd2-c41e-4dfe-b397-08dc15d2c1d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kF3sgDYMxfO2wICCEM7gzFmf/pjoyNmnXx+FUIf0zoj+Oe9UNcjp1QlGMxOU2g1EedHdrYq8NUxu1BReda60Wby2o28vc+z5qAZQxzEAYG1ja1E2Q/nPBlw+UgPfPmfHuGyYxXdoiGuJqurEhngbDz56btWu3fTu6EBybksAk6t7xoL8LUqHceGiZvSysQHyidGh4mZ+ZBElifyeaoOF9zBzRY1RKBVDl9lAiayWnQhJG1mqgCA+CXijo4lgiisiHhyoCVVuUbqaRcusY2BqgYiRH5ZY0UCFzAq7m16AQwhkRk9gm7GCGB3tUEWhntKfurKKTrApbzi3pI479qfeTAj9rsw7iYY4XvzxYapZZf381DTJ4y5nWwVkumchWWps/v3smQ2kdZE5MDJM14UVJhF2wYfpzraZbvjzq/xXV7qZPkVELssUP0ChqgIao4GirqwcSuzzmb2nDz+KO63ce4oA0n/0yCp1UidHbIF2ZrIQe7jIieRVi1HstRUFgvv6Tzy7bupqsX3KcnPOuEVjg7WF0GDd7lzQZnaP2Z8Fzyew83SO3gdQNpo/PIacV9nzqw7R+/ry5qeC3FV20s2NECLcgzZpZGtj2U/5Ha1rc5PHrZn5N05uN9ers8YVFdIg
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR2P281MB1963.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(39850400004)(366004)(346002)(136003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(5660300002)(2906002)(4744005)(8936002)(8676002)(38100700002)(122000001)(26005)(6486002)(86362001)(478600001)(55236004)(6506007)(36756003)(38070700009)(2616005)(41300700001)(6512007)(66946007)(4326008)(66446008)(64756008)(316002)(66476007)(71200400001)(54906003)(66556008)(91956017)(76116006)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QWttSmwrMHdBZU14RTh4bFQwcnVBUXJjUE9MUmp6a1FPYVN6TVVvRkZma2dZ?=
 =?utf-8?B?WE5uUWlaVWpyd21aTGIwT3FIOENpWWtRY21BMGc1YitkWFZxMzZxb0llWUZH?=
 =?utf-8?B?TG1DajY0MWh2aE1KN041WDRTZ2lZTytpbTZsb1c4a0h4cnhhRkpLWmFkUGlJ?=
 =?utf-8?B?bkhsUXF5SU40RVRkOTM0MG5adnZER2Z1VkdldU9jZGJUc3ZSSGtPL0tKbHli?=
 =?utf-8?B?WFozb0lCaWRDam1vYzF4RUZXSVE1WEoweGhNekI1MEdFVW8xTno5YWFJOFlX?=
 =?utf-8?B?ZFVFajVsNnFnVlk4YUJYTXQzWUwrNk05UndpVzJhd2NLZ0ZqdUk4LzRDMjFI?=
 =?utf-8?B?RkFEdFZSOXYvN2VUSWFiWVk1VXVCSmxoVzdzTGp1WVV1T3hONUloTVZaVW8z?=
 =?utf-8?B?QjFCVWs2dHB0NFZuUWpUTE5idG1CWUlER0hjSzJPNWlGM2tkcEF6c0IxaWll?=
 =?utf-8?B?em1XaERvRUx2bXlRS3NOOUpkNjN2eEcwODNlYm5kc015NmdFbFk2OVdWQ1V1?=
 =?utf-8?B?QzRKbHhIS0FzMjk2OWF2bFFYdnd2Z3Y4SUIvK3oxZTdvOW13RkVUaFhjOTBJ?=
 =?utf-8?B?dDNNdDNEZWdKWVVyTGMvbTM1eURXL0NnUFNFeXB0R3krQmhKcldLdGkzRWts?=
 =?utf-8?B?bndZMkFFbmxKTmY5SGo3TENTZGwzMVppMmc4NUdXWHp0REJyR1I5SndlR0lr?=
 =?utf-8?B?L25Edm03Ty9kQjVSVE5zV2w1aGhQRTI3UmVDOWdWTWZGNlpUcjEyUFFlS3FL?=
 =?utf-8?B?MkFvNHFFZWc1WjVGdzU5aHUzbXFlcVV2S0gvb1JSUmRZM2dTMmh1M2M1U2Jj?=
 =?utf-8?B?SisrdnpnT0NwaS9Sc1paSUlvWkFPalVId1pmbk5pdGNNbW5qQVo0NkJaazZZ?=
 =?utf-8?B?Tk1SR0FVTE5xOTNJaE45TjJ5dUYvSGU0WGRTdzM3OTNpOVQ1SkNNc3FCT1M1?=
 =?utf-8?B?amZkUTY1TmhMSFN4Z1djZnU5ckRWVWJoQ2s4a1N5QmVGSWk2WGk2MW0zQkg1?=
 =?utf-8?B?MGhCQVNwVmhCUDZlNDUvYjIrQkZMUUY0VXNHbEhNZ0pjelV6QUh2emE0RkE3?=
 =?utf-8?B?MERpRHFTUWRjbGxMNExVZjgxWTJnTjRESDkvNXNkS25QaFlHaXBMU21UN0x1?=
 =?utf-8?B?eXZzTXpOdWVuQWQ4Q1N3SzNLWVJQazd5MUZBU015ai96K21ja2hqNGVMeHBN?=
 =?utf-8?B?WmVUdk4weDNxNzZyNkM4Vmg5L3dUckFhYUx1OUJsVTB3NE93YTk0N2NDTGZO?=
 =?utf-8?B?N1c3eG5QeVJ3c3M2NXlNNVFzeHU4bmZoNVM4WFJEQ0tkcDFQM1VLR0Q3cUxh?=
 =?utf-8?B?bDFIbnUvUFYwSlF4anpTVm1RWWJWaHhjbnpsdU9kcHdHeDV6UnV1aU5IRkRo?=
 =?utf-8?B?QmkwK2UvRW4ramp6MUZocDJNek9uSG1Vc0dYWUd1NVpzV3RKWk9PY1I4MWZy?=
 =?utf-8?B?WDlyWmNndHZibkhkYmZFbjlJZGpOL3BybDJ3eHFJbW9laVEvdTZKaWw4NldP?=
 =?utf-8?B?RzdQNnplQkwzR3RLK0JTSDJsM29mVjQ2Y2t2SktGR2JZMEJZdmxZdnY5V0Y5?=
 =?utf-8?B?TWxXZldMUmdLNFYwbFgvK25oL3laWUZtSW5zTy9uaXNOT3RJeFZwbkoyL2NO?=
 =?utf-8?B?YjF3bWwwNVB2cU15TTU3U0dqOG91OVo0MkM0YitnU3B0NlNmam5zNzhVMDBE?=
 =?utf-8?B?L0FNWEN0R3RIaXZWcm96QlFhWmFLa3V1SXVGV0hzVjVLVHBPV01UZVRJTzJY?=
 =?utf-8?B?UHg3K2tzdW9rTnNWbTJtZjBUdVNoQTN2OUZiam14MjFYWkhOZjJSZ3VYdUFs?=
 =?utf-8?B?OWFBdlAzdmFFWTF4K0NZWk16QVZmaVhOV2hKY25WUTZJdnRHVmsyQkVGRWln?=
 =?utf-8?B?SUdkQU0vU2wxQkdTdHhNWitJOFV5c0YrRnBaWE1sWVhGaFBMayt5SEhndzl6?=
 =?utf-8?B?cHdPN0UzeExDZG5rM0pscjdiZDlFaXFrMDE3a2g5ZWcrNWdlUm5vUjBockhk?=
 =?utf-8?B?VWpUMk1QZmZGM0tqL1VpdmI3V25DeDRMc2hkaHBHQnVXV3N3Y2pFWjhSeWtG?=
 =?utf-8?B?Mm96SjA4VUt2U2pVZjMrSDFlMzI0aEtzWVJ0NnBVMERYeU9VdUFKVmZ0ZHF6?=
 =?utf-8?B?cUt6V2J3TzNyL3FIcisvcWdrbE81bEVudUFaWUVleDIvYjNyanVUckJCcTVz?=
 =?utf-8?Q?/Soq2Sq0m8hZ1LRtWBj6iws=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8783CB092C9CCB418FC5319453090E26@DEUP281.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: iris-sensing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR2P281MB1963.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 145a8fd2-c41e-4dfe-b397-08dc15d2c1d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2024 14:03:31.9266
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 963f3913-ffae-43fd-856b-2dfd3f6604e3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vAFq/j7OZK7IwqoZmMEZ/QI2KOu8hzienyPeVLyIvRzydvoz+nIzFNaleefYmXS40YKMgnzpvrTqXBn9Dk4Vfs9Y7x++b8xOK1UfFWAZ4+GFp91TpbuC/skXTb/Et68g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEUP281MB3414
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 14:03:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193678

PiBTYWRseSBpdCB3b3VsZG4ndC4gQXV0by1nZW5lcmF0ZWQgZ2l0aHViIGFyY2hpdmVzIGFyZSBr
bm93biB0byBiZQ0KPiBub24tZGV0ZXJtaW5pc3RpYywgYW5kIHdlIGV2ZW4gaGF2ZSBhIHFhIGNo
ZWNrIHRvIGVuc3VyZSBubyByZWNpcGUgaXMNCj4gdXNpbmcgdGhlbS4gSSBkaWRuJ3QgcmFpc2Ug
dGhpcyBwb2ludCBiZWNhdXNlIG15IG9iamVjdGlvbnMgYXJlIG9uDQo+IHRoZQ0KPiBwcmluY2lw
bGUgb2YgdXNpbmcgcmVsZWFzZSB0YXJiYWxscywgbm90IHRoaXMgdGVjaG5pY2FsaXR5Lg0KDQpB
aCBvaywgdGhhdCBpcyBpbnRlcmVzdGluZy4gQ291bGQgeW91IHBsZWFzZSBlbGFib3JhdGUgb24g
dGhlIG5vbi0NCmRldGVybWluaXN0aWMgbmF0dXJlIG9mIHRoZSBnaXRodWIgYXJjaGl2ZXM/IFRo
aXMgaW5mb3JtYXRpb24gY291bGQgYmUNCnZpdGFsIGZvciB0aGUgT3NzZWxvdCBwcm9qZWN0IGFz
IHdlbGwsIGFzIHRoZXkgY3VycmVudGx5IHVzZSBzYWlkDQphcmNoaXZlcyBhcyB0aGUgZGF0YSBi
YXNpcy4NCg==


Return-Path: <bevenson@melinkcorp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DBC5C433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 15:41:49 +0000 (UTC)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.139])
 by mx.groups.io with SMTP id smtpd.web10.8800.1644594108180225104
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 07:41:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@melink.onmicrosoft.com
 header.s=selector1-melink-onmicrosoft-com header.b=RHabIkt+;
 spf=pass (domain: melinkcorp.com, ip: 40.107.93.139,
 mailfrom: bevenson@melinkcorp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aCdLvn4y0sFc7bfPsiKsHuGvAWWf4M2JbngJW5bs6jAGmPF6SIX2RZzeYIVckv/DkQx/sGbA6Asx7P/sjn9TgbmOuklvU9ndikrg0r3krKj8mICl6FAsrbO8Yg+qnAyFXMsbq2YpK8HpV9wVaPC+a6h1DkrdWdHhHqSSNyw/WRZtICErFQD1W6CvjyvGreavFC4rhPNgCO1Y5s3gvoTORNOw9SDVk9YCSmahyLqZMeUY2cJMOagynWB1iPcVBqS0Zxakr7aKSlkFV1WHwR4JguhYY8by2NizwQ1sxN4HeeN/Bt9OH1WaN8KiR+23KX5+qm/OSEqJR+YmCG/I96Kz9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kxi4PyYbHMqKIxOrzNQWAQavLq9dgax0w56k3XVouDM=;
 b=MUd6IbcvcW6Qh/mvANnO3K9lVyKjIeBp1h7c4LLKuPguAbZhDcdOR+67KIbP4MHZ2C5722Tfn7loprdVgoHs5dqM4lfG8Om7O9zGmAlbuWmo+jbKAG8mfPHlaxfS8aUZBZAyDNoPSrDzUtwHX2z15FzdFBadUEyPDOgU0Zg9Ekbt0gWnSgkwYLyDKeTnrjL8Wabvkap1DVWvmL4/3W8iDQCttarDpo93VgDJz9wStl0MbVr0Ofxo4naBjaddnbD1ZQI50VaCLAc4HanMo5A/Qc5qmpE14yDNhhrkWINiVWC3W8D1pwrvFQoVancLII51OxWt3ZJGZ6QaeuejxzZc/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Melink.onmicrosoft.com; s=selector1-Melink-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxi4PyYbHMqKIxOrzNQWAQavLq9dgax0w56k3XVouDM=;
 b=RHabIkt+8UXYijijgdX1SdBuGS3TBFptgrTOFgj1ivwlBdJkzvMSDXjtR74TvAOts0POKhl4GR4gioUA6mjuZFb4VyuEi/1hQP7JfNXNDwCVZz8IgLAeG2WXhOLMgEIUkhFHm1wWVZ9Y4Ua2YgJH3Ry5o7lynyvrGUdl5XhLmH4BzWQ68Twkwbu1wu92J5kUBq2zU3SWFSIiTWKDxqKepK4MuCtR0cPRpTK72QO1M0pw1X7VFOWTuL8JcJG644MOtdAvFz0kL7IlwLcKXcdUvKxehQyVL53xoXTKAjXX2bOaDU5o+WR0s5rmLBUtScaZ9IBT1nzdSDff/miiWktcaA==
Received: from CH0PR20MB3948.namprd20.prod.outlook.com (2603:10b6:610:c6::22)
 by DM6PR20MB2329.namprd20.prod.outlook.com (2603:10b6:5:1a5::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Fri, 11 Feb
 2022 15:41:45 +0000
Received: from CH0PR20MB3948.namprd20.prod.outlook.com
 ([fe80::3c03:994:3b7f:e757]) by CH0PR20MB3948.namprd20.prod.outlook.com
 ([fe80::3c03:994:3b7f:e757%6]) with mapi id 15.20.4975.011; Fri, 11 Feb 2022
 15:41:45 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] gio-querymodules: error while loading shared libraries:
 libffi.so.6: cannot open shared object file
Thread-Topic: [OE-core] gio-querymodules: error while loading shared
 libraries: libffi.so.6: cannot open shared object file
Thread-Index: 
 AdgcTEk/yTwxPrPGTJaVV/RKLvaNJQACGOWAACSkBfAACXpSAAAGhO3gAAM+v4AAhQkeoAAEJTEAAAEU5fA=
Date: Fri, 11 Feb 2022 15:41:45 +0000
Message-ID: 
 <CH0PR20MB3948B7386896646FACB9798EBB309@CH0PR20MB3948.namprd20.prod.outlook.com>
References: 
 <CH0PR20MB3948AC26096D485ED45706F6BB2C9@CH0PR20MB3948.namprd20.prod.outlook.com>
 <CANNYZj9_bX2BLzXWM6f+OZL9dsjDrycc8TWrZkQMkW0MznYfgg@mail.gmail.com>
 <CH0PR20MB39480F83C8949247D7968800BB2D9@CH0PR20MB3948.namprd20.prod.outlook.com>
 <CANNYZj8FiA8==JdmsV-ws=q+0W8hQQRPM6o0+OsGrrjpRo+gXg@mail.gmail.com>
 <CH0PR20MB3948F3D57A8F78D131B9B246BB2D9@CH0PR20MB3948.namprd20.prod.outlook.com>
 <CANNYZj80JaZqGQQyYPB_8S7gejDKSc0fpYCmY-2=Z+=YoqKtMA@mail.gmail.com>
 <CH0PR20MB39483D12D0719FB606E87560BB309@CH0PR20MB3948.namprd20.prod.outlook.com>
 <CANNYZj9zbHH7oef1KeVk+TRBbm6kyur9Ao+hkqTJycv5UcxEzA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9zbHH7oef1KeVk+TRBbm6kyur9Ao+hkqTJycv5UcxEzA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-bromium-msgid: 407b5e6e-ef8f-4391-a8a2-ae0dde68dd3c
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=melinkcorp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c3ba8ca-6708-42aa-a29b-08d9ed750218
x-ms-traffictypediagnostic: DM6PR20MB2329:EE_
x-microsoft-antispam-prvs: 
 <DM6PR20MB23295607162C759C237030FFBB309@DM6PR20MB2329.namprd20.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 QFVxYDv56g9Le4ktl2kSA4pFM+eROjq0NY2bOMqEMFRIrdktYeyN877l7gAFlSIIEq4yDy4zOhci6XS1ImF6vOeResfTh2g1irl9KbLZoYqx4hRm73mOg8ITcLjvgSt9trNtdGWQCEbA0uTsHKfZMe2SKbD3skJGC2hfycrD9pQT42U4/VaSfGhPAwtNJKfD+OKOo14hmolU4418W6Mu4CGYsQQJKecxZqYJEXe4yM01g8BbEhgfavaKRFblwrZ9ZbA6pmCvpR7l3RwKXXPc/gLu1ux8gpzZqTdJ263nTzE2rd+EJCsAxFRoWAyziSF1+1+uThW3PlkYVnyM3Kg1hAcPosxODMuqb6g+zgzApu6w2YYu6NZ8siOfoE5hfbcNkPuGfUhvyeSqfgOZGOY8EaFVU5CLoRZK/P0S4rynI7M7KlTBShg6aorLgjw+w373/JJkNC9AOOtoRfJ21i8ShAyVGQjRnlMg8hqEpJ/ZPLNhRiFBUJbGYh/zLoG2jqriqVeRCUkkzyWfI9dCbILeCAFlRE/ntOOB9DVBsQQSSGEEWxCviuwpBGvfJGRPe45FftBkCwTWRsR0BYl+W6Gv8rmmG/DfE452c/D63uB58qx5AkUV5LTx2iPgmAT5nx6DKwsNVJBoABKaTzggU6LEEXPa4OzK5yFSrHdPyymAfnN2kzjTVcHM4aSrf1PQ7OpyKiNSHnTjOWyUWw1Z4xStVA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR20MB3948.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(136003)(346002)(366004)(376002)(39840400004)(396003)(66446008)(64756008)(5660300002)(66556008)(52536014)(76116006)(66946007)(66476007)(83380400001)(38070700005)(508600001)(8936002)(55016003)(122000001)(33656002)(4326008)(38100700002)(8676002)(86362001)(6506007)(316002)(186003)(9686003)(71200400001)(7696005)(2906002)(26005)(6916009)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?R1cvWmR5dExRWG55L3JSWGhlVUFjbFI1bEplbnRFdmp1b0pSYUdlYVdoTllC?=
 =?utf-8?B?NzQ1L1ZidDBGQWV4bDEySVlFNThwaWVoM3VRVkxvbnlBNHl2NnIzYjNqZ241?=
 =?utf-8?B?QkNEKzNvandLbTlnSG5GYlE1bitKWTRBblFHTWNrRldNZUFnbUNhS0grbGxj?=
 =?utf-8?B?bHZMYkkwand0OGVhdndISGdMcXlhQWYwajZ5RXc0VmU2V2lzYmxkYmJ6amhO?=
 =?utf-8?B?NnZrakJ2eXpVRlhWWVF5Q2RmbmpWbmkvME5qKy9NN0FaaTMxblpieEI4b2d5?=
 =?utf-8?B?SVV3SnZ5eUI0Z0RmdUF5bmFGckJGUGwrMlMyVEJuL095SUJsVG1xTDh0VVRi?=
 =?utf-8?B?VUlqWW1RTzJzL0I2aVpmWTN0SWZTTmVuOVZPb1M0NUxqeUJGWk5wbVkwMk5s?=
 =?utf-8?B?WlBUd2dFeGtoaDIyak92cnk5OW4veW05bE8rWjRvVkhPTVY2dExYL1RUUnZw?=
 =?utf-8?B?SEFtSlRPUVdrZVlBME9CVWd2M2NmNEhQWml3NkVCUkJKdjBwWkd3MS9pKzI2?=
 =?utf-8?B?SmhsbEI1STJsa3ZuOUJ3VERzNGRPeGIvK3VBQzFPeUs0YmJUcE1KcGJCMUQz?=
 =?utf-8?B?dks4dC9PTnFqR1hDL3NJTDd5d3I2dURLQmdZTUl5NGIwVlVpWWUwNEVydU1l?=
 =?utf-8?B?NDlobEhXamtDcnlNQmxZWmVpMDB1bm1GTGx0bzZ1ZzZiVkt2NWtUeGI2SkhL?=
 =?utf-8?B?OURsei9DZ2FsS1lPTkpRdDVxcmgybDJGMHg4N2dOOTRLR2doQ0JVS3RjdUxT?=
 =?utf-8?B?d1MzM3pxdi9PZHArRzkrekE2SHdIc3pzVkRoWGJvK1lJMHlNSFNxMzcrNmor?=
 =?utf-8?B?SS9hL2l0RVpuc2t6a00wVHdsenM1anIvMnZWWEQ1RlBqZUwwRGxxNEhBNjhh?=
 =?utf-8?B?anIraXA1SUdVSEZGYlZvaTFMc2RjV05hSTk5RG84SHZkSVJXbmMxRmZHTmZG?=
 =?utf-8?B?b2lmc2phTjlIM0tjaFVQc1NValcwbEJvalZqRmNFbTAzWHpyWFVPT0UwQTJV?=
 =?utf-8?B?WUxXcnlEWlZGSW9TWDhHRU44eXJLWXlDeGV0YzVFa1lwVWE2QUI0Q0V1QWJy?=
 =?utf-8?B?cnJ0VzU1bCtycWRmNkpaL1NaektOSWtGdUV4dzljN1dMMXFiMnVjNkxXaFk5?=
 =?utf-8?B?MHJWRUc2ci9KZmd2cFdnVGVtK3Z5ZGpzZE1yRUE3Z2kwRVJvTUdCL05PR2xD?=
 =?utf-8?B?QWZ2THh2bTNQa3NkS3RqTXQzT2orb0Q1aTZOYmNqYmJpbUR1bkI4cTVYRTIr?=
 =?utf-8?B?cmMvUHZDK3gxUW45U0lxQ1dWRjI0S3lTdHNTbzl6VGNneWZMT0p0MVhybWtw?=
 =?utf-8?B?T3JOSWtVclhicVNzUWZBazdjMCtIU3U1RURxb0NKcGd4YUIzcVJ2b2wyU3c4?=
 =?utf-8?B?QUg5UXdZR005WUltTjY1SGJQZHpGRXRVT00xeUtrTUtBeEVUL3IzN3hXcW4z?=
 =?utf-8?B?SlNOMStKdkkxTVd2Rzhzc1VrTEFHWEp0QzVONEtsZTh4dExVcjdZd2NVejlv?=
 =?utf-8?B?R3NpUXU5Q2FQaWllTWZPNlNMTjM4WityL21qZjVKY2F0MzRsY2xXeXRTS0RR?=
 =?utf-8?B?ZSs2cktaTk84UTRwSmNCUGRqVDFyUjFjNnExc0FDV0xEWTdCcGFMMmZXUUE2?=
 =?utf-8?B?SGZzMjEzTEwzdkdqeVVyZnZQL2prSzdNc2NDT0pTVTlBYTZDTDlaRGlsNklM?=
 =?utf-8?B?NTlVZVZrcHNCR2tEUTNOelJ1L2gwN1l4bml4V3BkNzhNd2FGZXFZS3o5MFVs?=
 =?utf-8?B?bkxmenBiOHJYN251Y2VsR2ljZUhaSlZCZ2U3eEliaFhOUWZiOWtNcEdHOU1F?=
 =?utf-8?B?TWJXMzBJRi9haXpmYnp4WkwvSDNKU204dTRoUjVHUG5jaGdtOExPcTBaQzJN?=
 =?utf-8?B?QUZJREdHODBWVnJETWgwQWhPbkhQbHQ3RjBWUHl2MUJJMFI2VmNIRDEzSjhJ?=
 =?utf-8?B?V0JyRytQc0xLZzNkb3ZPUzhaK0lIUUp1ZXVaWUNaL0U0djVLRHUvR0UxN1pN?=
 =?utf-8?B?cmhhNXZ6M0FtUXBvcDFKYzBDeDFVYm51UmFFbHZGWEY2TnNyVjV0QTN2d2xZ?=
 =?utf-8?B?UjBMMEhmczY2dW9JWmk1TE5iSVltNzJSdjIvZEpjd2NOM0NBRllKdHNuNEF6?=
 =?utf-8?B?b0NGMmJxcEJNYXdsbWxCbmVRQXA4S3NyaE5OT2JHd3ZQUXlaN202MUlBWjVi?=
 =?utf-8?B?Znc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR20MB3948.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9c3ba8ca-6708-42aa-a29b-08d9ed750218
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2022 15:41:45.1136
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 yXpjEPBceUFmnq7kwa8Gk+Ysh1B/Z2sbNgc1vNE1hWMDIfx5wNp5fvsSUIu+V8CcByA12oFSD1RHiQOpe3MZdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR20MB2329
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Feb 2022 15:41:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161656

QWxleCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIg
S2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4NCj4gU2VudDogRnJpZGF5LCBGZWJydWFy
eSAxMSwgMjAyMiAxMDowNiBBTQ0KPiBUbzogQnJ5YW4gRXZlbnNvbiA8YmV2ZW5zb25AbWVsaW5r
Y29ycC5jb20+DQo+IENjOiBQYXRjaGVzIGFuZCBkaXNjdXNzaW9ucyBhYm91dCB0aGUgb2UtY29y
ZSBsYXllciA8b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+
IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gZ2lvLXF1ZXJ5bW9kdWxlczogZXJyb3Igd2hpbGUgbG9h
ZGluZyBzaGFyZWQNCj4gbGlicmFyaWVzOiBsaWJmZmkuc28uNjogY2Fubm90IG9wZW4gc2hhcmVk
IG9iamVjdCBmaWxlDQo+IA0KPiBPbiBGcmksIDExIEZlYiAyMDIyIGF0IDE0OjQ2LCBCcnlhbiBF
dmVuc29uIDxiZXZlbnNvbkBtZWxpbmtjb3JwLmNvbT4NCj4gd3JvdGU6DQo+IA0KPiA+IEhvd2V2
ZXIsIEkgc3RpbGwgdGhpbmsgdGhhdCBhIHBhY2thZ2UgdXBncmFkZSBzaG91bGQgaGF2ZSBhIHdh
eSB0byBleGl0DQo+IGdyYWNlZnVsbHkgZm9yIHNvbWV0aGluZyB0aGF0IGlzIGFuIG9wdGltaXph
dGlvbiBhbmQgbm90IHJlcXVpcmVkIGZvcg0KPiBvcGVyYXRpb24uICBJbiBteSBjYXNlLCBteSBk
ZXZpY2UgaXNuJ3QgZXZlbiB1c2luZyB0aGUgR0lPIGxpYnJhcnkgYW5kIHRoZSBnaW8tDQo+IHF1
ZXJ5bW9kdWxlcyBzZXJ2ZXMgbm8gcHVycG9zZS4gIEkgZG9uJ3Qga25vdyBlbm91Z2ggYWJvdXQg
dGhlIGVudGlyZQ0KPiBHbGliIHBhY2thZ2UgdG8ga25vdyBJZiB0aGVyZSBpcyBhIHdheSB0byBt
YWtlIHRoaXMgZnVuY3Rpb25hbGl0eSBvcHRpb25hbCBvcg0KPiBub3QuICBJZiB0aGVyZSBpc24n
dCwgdGhlbiBJIHdpbGwgY29udGludWUgd2l0aCBteSBvd24gb3V0LW9mLXRyZWUgY2hhbmdlcyB0
byBmaXgNCj4gdGhlIG9wZXJhdGlvbmFsIHByb2JsZW1zIEkgYW0gc2VlaW5nIG9uIG15IGRldmlj
ZS4NCj4gDQo+IFRoYW5rcywgZG9lcyBycG0gZG8gc29tZXRoaW5nIHNpbWlsYXIgdG8gZGViaWFu
PyBUaGlzIGRvZXMgbG9vayBhcyBhDQo+IHNob3J0Y29taW5nIGluIG9wa2cgZGVzaWduOyB3aGF0
IHdvdWxkIGhlbHAgeW91IGlzIHBlcmhhcHMgYSBjb21tYW4gbGluZQ0KPiBvcHRpb24gZm9yIG9w
a2csIC0taWdub3JlLXNjcmlwdGxldC1mYWlsdXJlcyBvciBzaW1pbGFyLg0KDQpGcm9tIHdoYXQg
SSBoYXZlIHJlYWQsIGl0IGFwcGVhcnMgUlBNIGZ1bmN0aW9ucyB2ZXJ5IHNpbWlsYXIgdG8gRGVi
aWFuLiAgVGhlIG5ldyBwYWNrYWdlIGZpbGVzIGFyZSBpbnN0YWxsZWQgcHJpb3IgdG8gcG9zdHJt
LCB3aXRoIHRoZSBvbGQgZmlsZXMgdGVtcG9yYXJpbHkgYmFja2VkIHVwIGFuZCByZW1vdmVkIGxh
dGVyLiAgSSdsbCBsb29rIGF0IHNvbWUgb2YgdGhlIG90aGVyIG9wa2cgb3B0aW9ucyB0byBzZWUg
aWYgdGhlcmUgYXJlIHNvbWUgaWdub3JlIG9wdGlvbnMgdGhhdCBJIGhhdmVuJ3QgdHJpZWQgeWV0
Lg0KDQpUaGFua3MsDQpCcnlhbg0KDQo+IA0KPiBBbGV4DQo=


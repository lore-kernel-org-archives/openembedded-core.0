Return-Path: <bevenson@melinkcorp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC87C433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 13:46:04 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.121])
 by mx.groups.io with SMTP id smtpd.web12.7351.1644587163250234704
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Feb 2022 05:46:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@melink.onmicrosoft.com
 header.s=selector1-melink-onmicrosoft-com header.b=LNHEaFIc;
 spf=pass (domain: melinkcorp.com, ip: 40.107.244.121,
 mailfrom: bevenson@melinkcorp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L9UWM7vq6OUYBBZauJogRIIA/3R3oUdZkH/bOm7ewp81ItrR7slrP9XvZHg4NyGCR8HrtKXhClJYw9Bjzw8N4SOqz2XpHKHDCosMSh+KROSsI2DakotLMhaCNctdYIyiDVNVFc3novV86TpYh6N0UxfAgCOckfi9wpfWnq19fnf0blTfCVCWZyLxsbkJ5RAmnR9vWFpGvh0L2V2XGftgGK5NK3yUuZIsmn6f3Oo/icWdudTxsazDg/v1U3cYVNQtCildirIYlEBH5l+V07Ud8T5XcwCr6aEZSh2OwUa9ePJ6rMyGDN+DYznXJqNVdjoLaQjSDmoIcpNCyJGASD0dMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2pLfDpW897JAa+SyLW1Oudukscg0mO07T40uWBDpksQ=;
 b=nDzZJvYHClQeDDH8AjQJgA4nGVuGQ8zZ/6QKWQLXJif4pNJbcdwRJU7RR9NBfhzQDZ5dT4257EshdRFhSVM3j+8N8EMoJLh5IcKdXN3c/S8XAJTaARF7Kn3JSqL1CWba7or9ARCNvGu+ObKpbX5BJw2FC2M8ZdukIGuYWnU4j6zzRKo2gUtciKWx274ur8TvAY4jsOZIwQCj+ZvUAXAsXzuEjvONWe0AWM1C5iukQ57An0whi1j++8mmFs1WyWbql82by59vhnz1qaAz9wnuqpb45WbyCzJUYNi3BtKdR+e+CbjW2wTq6vuZgn2k9EA21EGhaFTWGgnRd72eqRnIbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Melink.onmicrosoft.com; s=selector1-Melink-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pLfDpW897JAa+SyLW1Oudukscg0mO07T40uWBDpksQ=;
 b=LNHEaFIc3uS/HGWlm5sMXcZf5oqPCjydT/YkAJ7qu6X6NNuNqv/eO1EshnsKgaJ4weQrRB0qJMt2YLs2z/sbzw8j4fN/mlqhh6+n3LB5MgdPWiNEiP60Nc1W5tBT/80Ui+u3lfgZaBL5R7VJsp84DiGbID2aI+gCU2nWm6SYBLtggFy7SwMcg+oFJi8upjLeIYLwRxt9nw4fT0cvIeAH/cAMTMqxWmpPuR8UrqHaO01SBY2WOl4HEmfMw0ifurAVgCPjEcClNax1NkfFCOP6RztLMCHs2n5pXwsjuNx28NkC826kNJZ40X8Rm4m7faWhpXhckB99NMBMhm2z8HMykA==
Received: from CH0PR20MB3948.namprd20.prod.outlook.com (2603:10b6:610:c6::22)
 by BY5PR20MB3105.namprd20.prod.outlook.com (2603:10b6:a03:1f5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Fri, 11 Feb
 2022 13:45:58 +0000
Received: from CH0PR20MB3948.namprd20.prod.outlook.com
 ([fe80::3c03:994:3b7f:e757]) by CH0PR20MB3948.namprd20.prod.outlook.com
 ([fe80::3c03:994:3b7f:e757%6]) with mapi id 15.20.4975.011; Fri, 11 Feb 2022
 13:45:57 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] gio-querymodules: error while loading shared libraries:
 libffi.so.6: cannot open shared object file
Thread-Topic: [OE-core] gio-querymodules: error while loading shared
 libraries: libffi.so.6: cannot open shared object file
Thread-Index: 
 AdgcTEk/yTwxPrPGTJaVV/RKLvaNJQACGOWAACSkBfAACXpSAAAGhO3gAAM+v4AAhQkeoA==
Date: Fri, 11 Feb 2022 13:45:57 +0000
Message-ID: 
 <CH0PR20MB39483D12D0719FB606E87560BB309@CH0PR20MB3948.namprd20.prod.outlook.com>
References: 
 <CH0PR20MB3948AC26096D485ED45706F6BB2C9@CH0PR20MB3948.namprd20.prod.outlook.com>
 <CANNYZj9_bX2BLzXWM6f+OZL9dsjDrycc8TWrZkQMkW0MznYfgg@mail.gmail.com>
 <CH0PR20MB39480F83C8949247D7968800BB2D9@CH0PR20MB3948.namprd20.prod.outlook.com>
 <CANNYZj8FiA8==JdmsV-ws=q+0W8hQQRPM6o0+OsGrrjpRo+gXg@mail.gmail.com>
 <CH0PR20MB3948F3D57A8F78D131B9B246BB2D9@CH0PR20MB3948.namprd20.prod.outlook.com>
 <CANNYZj80JaZqGQQyYPB_8S7gejDKSc0fpYCmY-2=Z+=YoqKtMA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj80JaZqGQQyYPB_8S7gejDKSc0fpYCmY-2=Z+=YoqKtMA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-bromium-msgid: 57fb72bb-df98-46d6-bc77-be308c3f37ae
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=melinkcorp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db6b148b-8917-40c8-8c00-08d9ed64d53e
x-ms-traffictypediagnostic: BY5PR20MB3105:EE_
x-microsoft-antispam-prvs: 
 <BY5PR20MB310577D9721F33C90F8F044BBB309@BY5PR20MB3105.namprd20.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 NdZQBRQNI2ZzxOL5f89u6/aTu6LEEC5tJ8fSCvORO2R8T4GXhhRbFVIETw3Dfn+24rwVZm6Lw4Hf++g/O8mqcDJk1nXvV1fZI63XImlkWDVuNsZlvg5EAnqtouqgpppOfdamuG5UV4uY9+mDULCjTWsGX5OiAZlqvKCBsuhc8y4eFJVP35Wf00dLlZey9KWUzHcdguNa+hRQd3NYIWAEAol6gmNoO1Abzs2D7SgtqZ1FKFF4UOjs2QiOoMISF3/j9aXt3X3DxD+ZxLgPCqZnKA6bITb7zOS9zaZzgHmxS6aRlkFhiKSfDBIennYkM3+FMI2sk5nt77g9jrRxxYPnT6P4HzS1ZafdYvt2zXdu5lyNcygzVcyG/enKnQ6OUTrhPK7MCtnCS8TDytnmnnu4jzIy3MIKkUp5WHB6dAUeEwO1YxWRf1N69lN9EIQVPYPdYGI5dGUKuHYhIr6Mt9Laqn+05W21mQsV6ne/WyT11TGP4nOqXzXFiXs/MCzQ02V9q6fNBUyIvtkitf1RVNsr4Bd7mAb/ZAiCJgjsK2MLNKdhltxb5AJ9vhRM60ME+jpBf8nOo/UkPDBIXT3MSIcZhxuP9Mf6yv1IVZUbKDkH0uZnI1EifCyd5QtFw1lp3Kcub/TQ7OGubbu8mYCek72/Y1ooP1q6U1PXtGu6flI+hdMUhC4CZJrTXKaCrV6RnHA+znqcmisBKyHVwdIQ2+B/n5Xbboqgg7asrkTH+4h8fnRaBTSQSnm/BIeJww0uNOq6OZo2VAclfkEXHnMB4SqPpF+mi9PJT7YDfvkJK73fBnk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR20MB3948.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(346002)(396003)(376002)(39840400004)(136003)(4326008)(508600001)(64756008)(66446008)(66476007)(66556008)(8676002)(53546011)(76116006)(7696005)(316002)(966005)(6916009)(2906002)(9686003)(66946007)(6506007)(83380400001)(186003)(26005)(38100700002)(86362001)(33656002)(38070700005)(55016003)(8936002)(52536014)(71200400001)(122000001)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bUw0d1dNNXlCcVdRdFVWaHB5WTRxQ2cwSGdKN1dTaXZkVVZETEVHR3NYQ1JC?=
 =?utf-8?B?VDdSVnhyK0IrUDlkTHdMT1dFd2VORWp6K09XL1MyVVhvTWpPQUlubUxCb08y?=
 =?utf-8?B?UzdaTlU3bFZxaWFwbUt3UDVrUGxBYTdVWFloZjlrVjM1L3diNExtc1N0MW5Q?=
 =?utf-8?B?ZUU3WGNoOWd4akx4dXN4QzJ0ZWNteXNlV2dxbStjY2pvdUNVN0JwS2IzOE10?=
 =?utf-8?B?YUJsUk5VNmFiN2Rlakl5OEh1aUl1Vnl2MU1MK1dzSVJOZ1dHcVpyR3NoL1Zm?=
 =?utf-8?B?bSs0RWR1cHhyZ0ViU0hxK3BiUWlQSTlVaU9waHBZTjdodDl4ZWN5dk9pVkEr?=
 =?utf-8?B?cDBuR0VrbDF3SGJHeTJvbStoME1NYk50Z1dBQS9xSzVScnM4RWdHK2RvQ21z?=
 =?utf-8?B?bVpIcmI3TlV0Q2QyeXZhdC93L3VSbzZpUTRzZDYyVXFwU3d0MUphSkZxY3dI?=
 =?utf-8?B?NEpzNnBNUk5tUHNWeDdsRHNBRDBUeDNSc2dMYitnZ0F1c2N2UmNYa2JkdDNY?=
 =?utf-8?B?M0VKTVlYcW94aS9XRmo3SmxsbkR1c2ZXaGgzOEpEQTJtQ3hMNEhqNTNOYmJh?=
 =?utf-8?B?dHZGZXdFVjdSYnZxNzcwZEVnSFBvRFJ6emdzQ2xEamNMTjl1L2NxbTlXOSs3?=
 =?utf-8?B?M2EvSWkwc1ZETmpGWUlxNEtCUHlkd0tTVlZJRTMvcCttQnkyZzJxeFFoazMz?=
 =?utf-8?B?dTFZREtHeGxpSkpubERWcFFEb0p1UEpUQ1JSeTY3d25hSk5jdmRkL2NJZ3lJ?=
 =?utf-8?B?WURPbU95RXd5NUQrbDZVZVgweGhSclVMMytIem5XUDl1VzdPVkhrYldTQmhq?=
 =?utf-8?B?MGJKTExYNDA5OSt6Znd6M3NjNE4wL251dGgxRXFRZ0hCN0lsdk8xSU5oMHJ6?=
 =?utf-8?B?ajBXc0lWOC85MWZTYTYyK0JIU09uQ1pkZnRuTVJNOUF1WlQrUW1QZmhsOHQv?=
 =?utf-8?B?Lyt3UjBHSG81RStaNHNqTFRJUHBlU21DelNQTVg5VmNob2hZTzI2bEgrQ2wz?=
 =?utf-8?B?WnhuUm5Ici91eE5tYmFQaGpwczZYc3oyWXlxU0p0UTNhTTdoRmo0VTNFOG10?=
 =?utf-8?B?amxQQzVLYmJRNlRwUzUyOW1MZTVqSWE1cHdVTzcvK1V1cUFVTG5WVXdXUWND?=
 =?utf-8?B?U3BjZmExbDc4VnJPVnV5bXJBSVY5OUw3aDJmS3NjOGxEWVEyTGVNa3p3UWsz?=
 =?utf-8?B?NnRGUTIrNGxEaFhFcU05bExnMUlqWHFud2xZRXJjRkpnT21NS2VJdkZ4UXEv?=
 =?utf-8?B?dFlNQUZodXo2eWp4eEZOc01oN2NRNmhPc3pvcGtubE9Jb25CRlJkMURxM1Fk?=
 =?utf-8?B?dVh6bUpkWTJvWFhWOUxKbmFUbVRjSGt0U3Q3cGxzbmZ6WWZSQ1dYaTRUM3Na?=
 =?utf-8?B?dmx3ZzFFWUNud3pmWXZUMkhKc0JqWmYzK1Q2SitjSkJjNVZjMXR6Wm1vUkxk?=
 =?utf-8?B?dCt5VzV1OWhYd3NYMXJ6cjBaNGFXTWtzVS9OaTJNLzdiOFhRMjE0WnF3MGtN?=
 =?utf-8?B?OUFCUHV5MVJkYjd0UkFnK2JudUlnMmZuUE1XR0xtN0hvOTE0UXRUcWFMTkZn?=
 =?utf-8?B?MUJ4VXgvYUJFYXN1SFZXeHZXU3h5RUhjeXRobk5Gc053OUc3azFzSFpma00y?=
 =?utf-8?B?UUloL1VSR3dodlBRekhFK1JkVXE1Z3ZlN2xTZjZHZElUa0JxZE52b0xmZ1hQ?=
 =?utf-8?B?clVkdUdPQkk1SXNMQnZMakF5T0QrUVo0N0k3NmxMeWp2cWtLS0M3aDhiNFhE?=
 =?utf-8?B?ZlZJZ2Ftc2NnWC9iRWlNUURNOVA1ZGZvbkU4Y2dZaUgrcTVGRmxKTnFtMWJU?=
 =?utf-8?B?RHVNajRQSXhuaHNaaHVSbUdWZ2MvWTVUWDZTckp0UU1RSG9NNDZua2x5elZ3?=
 =?utf-8?B?NFoyLzYwZFNXRWprMVZiNlRYYzVNZnpRbmNsSzdOOHdCRFNkTERDeEYycUN3?=
 =?utf-8?B?Zzc2T21ITVNnZlBlRGhxRENFb2I2RVM1aHR3NVBUR3R4RXU3bUFuNGI1UkF2?=
 =?utf-8?B?Qm4yOVB0ZExXNXFRUVJCdm8zWklYWGFTcUZNM3l1ZFlsd2F2Z0wvY2dSV3o5?=
 =?utf-8?B?K1hSbXV0QU9vTUh6UHFQWjlqRGFGUFQ5cVlWOXRLdXBwWW1mQ1ZjY3pUN20r?=
 =?utf-8?B?QTZnTFhGWXVoMU45eE1mZ1ZzTFcrVGN4ZGxCYituUXBnVVpBZlBFUHQyR3p2?=
 =?utf-8?B?clE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR20MB3948.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 db6b148b-8917-40c8-8c00-08d9ed64d53e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2022 13:45:57.8700
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 hxd7K+812EgEkRojGYt3DeV1jxVv6qs7uJ+38gneY841YQ7WFsw+/nqZ4MicQmHca83I+grduW+Hq+uC3U8lXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR20MB3105
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Feb 2022 13:46:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161651

QWxleCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIg
S2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgRmVicnVh
cnkgOCwgMjAyMiA0OjM4IFBNDQo+IFRvOiBCcnlhbiBFdmVuc29uIDxiZXZlbnNvbkBtZWxpbmtj
b3JwLmNvbT4NCj4gQ2M6IFBhdGNoZXMgYW5kIGRpc2N1c3Npb25zIGFib3V0IHRoZSBvZS1jb3Jl
IGxheWVyIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCj4g
U3ViamVjdDogUmU6IFtPRS1jb3JlXSBnaW8tcXVlcnltb2R1bGVzOiBlcnJvciB3aGlsZSBsb2Fk
aW5nIHNoYXJlZA0KPiBsaWJyYXJpZXM6IGxpYmZmaS5zby42OiBjYW5ub3Qgb3BlbiBzaGFyZWQg
b2JqZWN0IGZpbGUNCj4gDQo+IE9uIFR1ZSwgOCBGZWIgMjAyMiBhdCAyMTozNiwgQnJ5YW4gRXZl
bnNvbiA8YmV2ZW5zb25AbWVsaW5rY29ycC5jb20+DQo+IHdyb3RlOg0KPiA+IEFzIGJlc3QgSSBj
YW4gdGVsbCwgdGhpcyBpcyBicmVha2luZyBiZWNhdXNlIGxpYmZmaSB1cGdyYWRlZCBmcm9tIGxp
YmZmaTYgdG8NCj4gbGliZmZpNy4gIFRoZSBvbGQgdmVyc2lvbiBvZiBnbGliLTIuMCBkZXBlbmRz
IG9uIGxpYmZmaTYgYW5kIHRoZSBuZXcgdmVyc2lvbiBvZg0KPiBnbGliLTIuMCBkZXBlbmRzIG9u
IGxpYmZmaTcuICBPcGtnIHN0YXJ0cyB0byB1cGdyYWRlIGdsaWItMi4wLCBidXQgaXQgZmlyc3QN
Cj4gdXBncmFkZXMgdGhlIGRlcGVuZGVudCBwYWNrYWdlcy4gIFRoaXMgcmVtb3ZlcyBsaWJmZmk2
IGFuZCBpbnN0YWxscyBsaWJmZmk3Lg0KPiBUaGVuLCB0aGUgcG9zdHJtIHNjcmlwdCBydW5zIGZv
ciBnbGliLTIuMCB1c2luZyB0aGUgb2xkIGJpbmFyaWVzLiAgVGhlIGdpby0NCj4gcXVlcnltb2R1
bGVzIGNhbGwgdGhlbiBmYWlscyBiZWNhdXNlIGl0IHRyaWVzIHRvIGxvYWQgbGliZmZpNiB3aGlj
aCBubyBsb25nZXINCj4gZXhpc3RzLiAgRXZlbiBpZiBJIHdhcyBhYmxlIHRvIGRlZmVyIHVwZ3Jh
ZGluZyBsaWJmZmkgZnJvbSBsaWJmZmk2IHRvIGxpYmZmaTcgdW50aWwNCj4gYWZ0ZXIgZ2xpYi0y
LjAgdXBncmFkZXMsIEnigJlkIHRoZW4gcnVuIGludG8gYSBzaW1pbGFyIHByb2JsZW0gd2l0aCB0
aGUgcG9zdGluc3QNCj4gc2NyaXB0LiAgSW4gdGhhdCBjYXNlLCBnaW8tcXVlcnltb2R1bGVzIHdv
dWxkIGZhaWwgYmVjYXVzZSBpdCB3b3VsZCB0cnkgdG8gbG9hZA0KPiBsaWJmZmk3IHdoaWNoIHdv
dWxkIG5vdCBiZSBpbnN0YWxsZWQgeWV0Lg0KPiA+IEkgdW5kZXJzdGFuZCB0aGF0IHlvdSBkb27i
gJl0IHdhbnQgZXJyb3JzIHRvIGdvIHRocm91Z2ggdW5kZXRlY3RlZC4gIFdvdWxkDQo+IGFuIGFw
cHJvcHJpYXRlIGVycm9yIG1lc3NhZ2UsIHN1Y2ggYXM6DQo+ID4gICAgICR7bGliZXhlY2Rpcn0v
JHtNTFBSRUZJWH1naW8tcXVlcnltb2R1bGVzICR7bGliZGlyfS9naW8vbW9kdWxlcy8gfHwNCj4g
ZWNobyDigJxHSU8gbW9kdWxlIGNhY2hpbmcgZmFpbGVkLiAgWW91IG1heSBuZWVkIHRvIG1hbnVh
bGx5IHVwZGF0ZSB0aGUgR0lPDQo+IG1vZHVsZSBjYWNoZS7igJ0NCj4gPiBXb3JrIGZvciB5b3U/
DQo+IA0KPiBUaGF0IGlzIG5vdCBhbiBlcnJvciBtZXNzYWdlLCB0aGF0IGlzIGEgd2FybmluZyBt
ZXNzYWdlLCBhbmQgbm8sIHRoYXQgaXMgbm90DQo+IGFwcHJvcHJpYXRlIGVpdGhlciwgYmVjYXVz
ZSBpdCdzIGxpa2VseSB0byBnbyB1bnNlZW4sIG9yIGRpc2NhcmRlZC4NCj4gDQo+IEkgdGhpbmsg
eW91IHNob3VsZCBzdHVkeSBob3cgZGVza3RvcCBkaXN0cmlidXRpb25zIGhhbmRsZSB0aGlzLCBi
b3RoIHJwbS0NCj4gYmFzZWQgYW5kIGRlYi1iYXNlZC4gSG93IGRvIHRoZWlyIHBvc3RpbnN0L3Bv
c3RybXMgbG9vayBsaWtlLCBhbmQgaW4gd2hhdA0KPiBzZXF1ZW5jZSBkbyB0aGV5IHJ1bj8NCg0K
Rm9yIHRoZSBEZWJpYW4gdXBncmFkZSBwb2xpY3kgKGZsb3djaGFydCBoZXJlOiBodHRwczovL3d3
dy5kZWJpYW4ub3JnL2RvYy9kZWJpYW4tcG9saWN5L2FwLWZsb3djaGFydHMuaHRtbCksIHN1Y2Nl
c3NmdWwgZXZlbnRzIG9jY3VyIGluIHRoZSBmb2xsb3dpbmcgb3JkZXI6DQoxLiBDYWxsIHByZXJt
IHNjcmlwdCBmcm9tIHRoZSBvbGQgcGFja2FnZQ0KMi4gQ2FsbCBwcmVpbnN0IHNjcmlwdCBmcm9t
IHRoZSBuZXcgcGFja2FnZQ0KMy4gVW5wYWNrIG5ldyBmaWxlcyBhbmQgc2F2ZSBiYWNrdXAgb2Yg
b2xkIGZpbGVzDQo0LiBDYWxsIHBvc3RybSBzY3JpcHQgZnJvbSB0aGUgb2xkIHBhY2thZ2UNCjUu
IERlbGV0ZSBvbGQgZmlsZXMNCjYuIENhbGwgcG9zdGluc3Qgc2NyaXB0IGZyb20gdGhlIG5ldyBw
YWNrYWdlDQo3LiBFeGl0IHBhY2thZ2UgdXBncmFkZQ0KDQpPcGtnIGRvZXMgc29tZXRoaW5nIHNs
aWdodGx5IGRpZmZlcmVudCBzbyBpdCBjYW4gb3BlcmF0ZSB3aXRoIGEgc21hbGxlciBtZW1vcnkg
Zm9vdHByaW50LiAgRm9yIG9wa2cgdGhlIGV2ZW50IG9yZGVyIGlzOg0KMS4gQ2FsbCBwcmVybSBz
Y3JpcHQgZnJvbSB0aGUgb2xkIHBhY2thZ2UNCjIuIENhbGwgcHJlaW5zdCBzY3JpcHQgZnJvbSB0
aGUgbmV3IHBhY2thZ2UNCjMuIENhbGwgcG9zdHJtIHNjcmlwdCBmcm9tIHRoZSBvbGQgcGFja2Fn
ZQ0KNC4gVW5wYWNrIG5ldyBmaWxlcyBhbmQgZGVsZXRlIG9sZCBmaWxlcw0KNS4gQ2FsbCBwb3N0
aW5zdCBzY3JpcHQgZnJvbSB0aGUgbmV3IHBhY2thZ2UNCjYuIEV4aXQgcGFja2FnZSB1cGdyYWRl
DQoNClRoaXMgc2F2ZXMgc3BhY2Ugc2luY2UgdGhlcmUgd29uJ3QgYmUgYSBjb3B5IG9mIGV2ZXJ5
IGZpbGUgaW4gdGhlIHBhY2thZ2UgZHVyaW5nIHVwZ3JhZGUuICBJdCBhbHNvIHJlZHVjZXMgY29k
ZSBjb21wbGV4aXR5IGluIG9wa2cuICBCdXQsIGl0IGFsc28gbWVhbnMgdGhlIG5ldyBmaWxlcyBh
cmVuJ3QgYXZhaWxhYmxlIHVudGlsIHRoZSBwb3N0aW5zdCBzdGFnZS4gIFRoaXMgaXMgd2h5IEkn
bSBzZWVpbmcgdGhlIGZhaWx1cmUgdGhhdCBJIGFtIHdpdGggb3BrZy4gIFNvIHRoZSBwb3N0cm0g
c2NyaXB0IGlzIGZhaWxpbmcgYmVjYXVzZSBvcGtnIGlzbid0IG1lZXRpbmcgdGhlIERlYmlhbiBw
b2xpY3kuDQoNCkhvd2V2ZXIsIEkgc3RpbGwgdGhpbmsgdGhhdCBhIHBhY2thZ2UgdXBncmFkZSBz
aG91bGQgaGF2ZSBhIHdheSB0byBleGl0IGdyYWNlZnVsbHkgZm9yIHNvbWV0aGluZyB0aGF0IGlz
IGFuIG9wdGltaXphdGlvbiBhbmQgbm90IHJlcXVpcmVkIGZvciBvcGVyYXRpb24uICBJbiBteSBj
YXNlLCBteSBkZXZpY2UgaXNuJ3QgZXZlbiB1c2luZyB0aGUgR0lPIGxpYnJhcnkgYW5kIHRoZSBn
aW8tcXVlcnltb2R1bGVzIHNlcnZlcyBubyBwdXJwb3NlLiAgSSBkb24ndCBrbm93IGVub3VnaCBh
Ym91dCB0aGUgZW50aXJlIEdsaWIgcGFja2FnZSB0byBrbm93IElmIHRoZXJlIGlzIGEgd2F5IHRv
IG1ha2UgdGhpcyBmdW5jdGlvbmFsaXR5IG9wdGlvbmFsIG9yIG5vdC4gIElmIHRoZXJlIGlzbid0
LCB0aGVuIEkgd2lsbCBjb250aW51ZSB3aXRoIG15IG93biBvdXQtb2YtdHJlZSBjaGFuZ2VzIHRv
IGZpeCB0aGUgb3BlcmF0aW9uYWwgcHJvYmxlbXMgSSBhbSBzZWVpbmcgb24gbXkgZGV2aWNlLg0K
DQpUaGFua3MsDQpCcnlhbg0KDQo+IA0KPiBBcyBtZW50aW9uZWQgYmVmb3JlLCBZb2N0byBkb2Vz
IG5vdCB0ZXN0IG9yIHN1cHBvcnQgbWFzcy11cGdyYWRlcyB2aWENCj4gcGFja2FnZSBtYW5hZ2Vy
OiBpZiB3ZSB3YW50IHRvIGZpeCB0aGlzLCB3ZSBiZXR0ZXIgZG8gaXQgcHJvcGVybHkgZnJvbSB0
aGUNCj4gc3RhcnQuDQo+IA0KPiBBbGV4DQo=


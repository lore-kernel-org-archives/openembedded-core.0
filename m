Return-Path: <petr.gotthard@advantech.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DDDEC0015E
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 20:10:24 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (APC01-PSA-obe.outbound.protection.outlook.com [40.107.255.88])
 by mx.groups.io with SMTP id smtpd.web11.119.1689797415746574335
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 13:10:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@advantech.cz header.s=selector1 header.b=D6vRtW1A;
 spf=pass (domain: advantech.cz, ip: 40.107.255.88, mailfrom: petr.gotthard@advantech.cz)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2MxQpHh4+CYGYHdE4utDgxDr5N4V/+6577HjJBZlSW2rdkjWcpCJiNnlmMkwWjuS8ekH1ePkL7o03ZZmJCgS8E20YkN5Ca4B5KMIQrj/Lkr0pP//uTYJsftUTF/zbpbSHR8FTTJhH5IDlbQCtENNZhAXRYZgomaEFaBUv1CvuN1ThW3ZgomIUBaw1ZUN2BzoyeLoeHg7fAlwjll6/srjU3dr947HT0X8dR0VUyn9O9rnGov85Aoe5yyh2F6ABAmSgBCOJbQXfirI5vqDSUMQbO767uOH2Eum6NaOh7ZWh0b7PHnRmVmcUg6n2vtKUrcoQsWhHKyh+nDnqph3wa/EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qXolbBNbcIBscP2cRdQ+DGLMOx8DDmlDRV6RAf+AYKM=;
 b=DjmVWdiivC/KBvl2CnTTCVUgyi0cg909S5OaH4GNbEKhMaOUIdhHaNAinVnQ9IE/zKPSpWeMZEsKOykNjcwpq7Sd950GXTBjH7D/HHhWoWK65M5HGbjv+LgEnM+vvdLPz5lNq2qCe72xtcftqbkSFtH4n0dIGYMSOvwmybi4rdRKL29EqElovOuHdHKXgPvnAcBJ07YgMRUCpm6ak8mIm4tP0FfsOw6wWub9wSePyueV57LJv7pUznCnfDvPRERMq3OUeVw8CbBu1RqpMId3jWka6aC0JO/jEuC6QiwOdRdEXfSk5LKXTRDcAounkH+YgRUNrG899f7AMTH19lLtIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.cz; dmarc=pass action=none header.from=advantech.cz;
 dkim=pass header.d=advantech.cz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.cz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXolbBNbcIBscP2cRdQ+DGLMOx8DDmlDRV6RAf+AYKM=;
 b=D6vRtW1Aq4vZ4PWvgFxf4G4zx29ihvTk4RCVwzFTdtK1WYdUlbJfseBAtsPa00Po28ETrEKY7GA24ttBYROqx7FbavGpNRXRBaWJii+c8N5jSg6sHNIzj/wIXdNCgiVcafPCEXT2hWkme0BA7oSPbssK/0WgRG1ZaArlMtaAdIfCb1EpGBVZufuakhvC+3BItZrgP5SJKDffuIiNtVXYTLB1TXJTHyVJI7kju21IsKdNdPm/ozoibAEI6ifxFgSV607wkH7UltlrL3Lr7COUOScO3TCzc3Tqh01yDJCkKXbHF8zefoJQJc391Zh9OVjXAyl7BLhiIUmBggUrS3Nrnw==
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com (2603:1096:404:b7::12)
 by SEYPR02MB5679.apcprd02.prod.outlook.com (2603:1096:101:5b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Wed, 19 Jul
 2023 20:10:11 +0000
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::5974:168:dff:f88c]) by TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::5974:168:dff:f88c%7]) with mapi id 15.20.6609.022; Wed, 19 Jul 2023
 20:10:11 +0000
From: Petr Gotthard <petr.gotthard@advantech.cz>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] make-mod-scripts doesn't know KERNEL_LOCALVERSION
Thread-Topic: [OE-core] make-mod-scripts doesn't know KERNEL_LOCALVERSION
Thread-Index: Adm6Zirrs9Te84mJRC+MJegq9PcmmAAAnvEAAAEeMFA=
Date: Wed, 19 Jul 2023 20:10:10 +0000
Message-ID: 
 <TY2PR02MB3678ED281AB36D9AB6CBA9C68139A@TY2PR02MB3678.apcprd02.prod.outlook.com>
References: 
 <TY2PR02MB367800CEED14B7DA7EE92C5F8139A@TY2PR02MB3678.apcprd02.prod.outlook.com>
 <CADkTA4O92vHqJbTEqUDPktnuaCp-vzskCZeb_5iqr5NmfGNONg@mail.gmail.com>
In-Reply-To: 
 <CADkTA4O92vHqJbTEqUDPktnuaCp-vzskCZeb_5iqr5NmfGNONg@mail.gmail.com>
Accept-Language: en-US
Content-Language: cs-CZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.cz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR02MB3678:EE_|SEYPR02MB5679:EE_
x-ms-office365-filtering-correlation-id: bff23cb6-f679-451b-a66b-08db889427ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 DwbLsvBhv+D12AE46ciARxjsh7z3bfXaSGmGnexPJFwPsDjE+CaEcmw2HcQ08yFm9C060ya/QZBH6viGDaVHCJiMou6wMAqj1rT+KBgCedukxholrdZ9FWBMzHdrg5YC1ES8DxZYrSHP1XQRajvgEpPur89eNZlsuSi30LNcKw+HHrVb5Dwejqfp0UkJijlCW/Ozk+s6pEXpGUcXGNTXr9wl438zuvWdzLQoRzEwyJ0QKTC1voWGO5MHGhAMZhMHwpLC+hHuFNIIUUmj8TzR6BIkXHs5t1odAbzO9co3WUJSVxucllj3ESuiEXODd9cTWkQGx0rpS2ZG0GeuAdkPNP//EFwvLzCAWO50BaX7UYDjhBWRg36SpCyI/uSERBITvqk5L0MLgGUZuBK3tpEpF9axPGf5SZ6xlFYpDGMqGQLHYfv/B+i43029pkO1WxlP2p0afHV0+K6zpShMBkEO7OSXNc33cX1wT5C7cteEaa/KTOKaOVFNbjq9+EOq8ypORWL9WhtL1ADqVxWaIOX/tuy3vVmGKjjPXriU8FCE0VIPrGs6e/ZotoJ+yX+0ZdTnHiHMXsqLq2xI5ykA+FNB/iyrr8jKaMwrvOC2ohhEhQE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR02MB3678.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(451199021)(86362001)(2906002)(33656002)(44832011)(38070700005)(55016003)(966005)(186003)(83380400001)(9686003)(6506007)(26005)(53546011)(38100700002)(122000001)(7696005)(71200400001)(66446008)(66556008)(478600001)(64756008)(66946007)(66476007)(316002)(5660300002)(4326008)(76116006)(6916009)(41300700001)(8936002)(8676002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Z2cvSHpLS0ZGWjVPelBHSDRncGRLUW5DUnJNdVgvUGlXOEswZCtsS0wwRVFT?=
 =?utf-8?B?bnhsSm9wbUl2U05wbjRqRkQxMVdLNElzc3ozU01GTENSWWRacGRVMXFmTklD?=
 =?utf-8?B?Tjg3ZmRyOVM5N21wYzBzbmR4bDNZZWRtcjZqSVVFTFI1cmJJa1dFdGs0SkYy?=
 =?utf-8?B?WGdCTzNZOWJ3ZU5yK3NxVytud2lTemxVMEpvS3ZIK2tqTWwzM20rZUZUanpM?=
 =?utf-8?B?Vzh3RnM1V0YzTlRqOC9tSjdTQmhvaFBtMFJKTld5ZFJNTVhRRHJsazlFODRT?=
 =?utf-8?B?WHFBY1JlMTVjWWs3SUxHNzFQK1BTUWQ1RnBhNnI4ZkNlR1ErRTRYWmVacmZV?=
 =?utf-8?B?NjRTRXZCbWYvS1VRUWhEQzRoWi9WZzdOVEcweDdNNjNpVDVWVkM4eVlKbTFC?=
 =?utf-8?B?K3dvcWVsYytrb2FqZEFlK3ZuUklyem9CSFIvK3ZNMHdxczZNZjN5azNRZWZa?=
 =?utf-8?B?ckt2VmxrV200YnFlSGtaeUhlZ0JManhEeFJVY1g1UFhOV1ZhQy9BVDVOcFpR?=
 =?utf-8?B?UHBNc3hEMDJkMlFHaDBJVERlaTF4VlhJVVVQLzVURVBwcmMrb2RIWXF1VnFx?=
 =?utf-8?B?amdCcUhkbUJMaU50aU9Xb3c4Y0Fsb0hVSXJ3K3A4dkp2VFo3b2E3TTFLQmFC?=
 =?utf-8?B?WHY0Sk1ZS1N0czVLNW5RMk1oMGRESks0d3U1NzlIUEpzYjVubXBDSkdBVTBa?=
 =?utf-8?B?MkNVbkNqNkQzQkkwbkpJT1M2ZmUxbmZZUnNCVURDTks4bXlyc2RSZWlhREl1?=
 =?utf-8?B?RnRPN3JpNkg3OEJvVnBMUDdPNkp2TDFqeU84RXE0bVAvby9oUDFTT1BpdmF2?=
 =?utf-8?B?MVdCUWp2SUNCUEpPMXlXSC81TGhqQWdTVzNQWi9rbW8vRmxEdDBkNWduODJF?=
 =?utf-8?B?bzJGekg0Q2xyaHZFcHl5U3VjT0RpZVFUNnN0RjdaOHYzbU41Zmxuc3lTQUZT?=
 =?utf-8?B?eG9VQlFlelJ4RFdScnFQdU04eTQvU2VsNkRMZUFaeEVFL3BGNzM1ZEZ3cGxm?=
 =?utf-8?B?K3NwSGQyNUljNEF1amhnMnNhWldtYVlXN004TUVrWXJrUzJBQ01mQm52ZEJZ?=
 =?utf-8?B?Y3ZQcFdZV3hJc2hnT1A2NWlJUGlXdGFwWUd2Y3RwSVBNN0RPRjQ0cE9hNSt4?=
 =?utf-8?B?bjVDekNYY204Y2pjREN2Vm5Cd2ZMcElLelhtK1Y5TUkwbFZUWURtU1B2WVJ4?=
 =?utf-8?B?ODN6cmgrYmV5MUlRc3VCRWJ6MGhRelFwTkFCcS80ZUc1bnVlMmpoZTlkalZU?=
 =?utf-8?B?RWhjZkZuTVRweEFucFh3bzJkcFY4ZEVJc0NndnZkbVk3Q0Nqa1c3bkgrRnJ5?=
 =?utf-8?B?a01oL0pybnNGdGFjRkpHVWtzQWtMek45bHcxUy9qRTZPbXhYZ2ZzU1I5bHF6?=
 =?utf-8?B?ZDE4MFFZNmljNUliNzBWcTFqTENBVFJUNDBDRStnVmdONFhXcDFnQk5hK2FW?=
 =?utf-8?B?L3pDa0U2VTZLWGpmMHF2Z25zYlIzY3pIVzhzTE5taHdmUjZOOHUvSUcwN0hu?=
 =?utf-8?B?ZGE3dllJZ0g4Z1lrZ25kUi9UMlpMdzZranBNTUprUkpSdnJZdE91ejFkQTgy?=
 =?utf-8?B?N3JRYU5ja3lUQUFwL3hNaTlWTkgxODVWanJUTnBlQXhxMjNHeDVlVGVsZVVl?=
 =?utf-8?B?YllPSnZET1IzZm5LYXFES2ZkOCtTVUREQ0x4aGFaU1VhWmFIejNjbEFIUUVl?=
 =?utf-8?B?aEp4RTFWR3VxdEMreXhOMlo2dy9GczVNVEhZMG9CaHpHTExuYVVTNkFlTCtL?=
 =?utf-8?B?Qm1xU0xHaS94aUF1SFNOMmFCeElJdWQxM3p6dnJvRW5mWXRMWVNUV1FLQ2p2?=
 =?utf-8?B?MEdVaGZYQU1jcHNKMTM1cVltMkM4SXY0b3NWbmxnSHRFNGx2WmNWVmp2RmY0?=
 =?utf-8?B?eldvQzI1Y3hzSU1McHdTQXVvUE41VzN1TnFzZzkwK0N1UGJ0REJ6QlJVYm9y?=
 =?utf-8?B?ZUg0eTJNbEpHNjAvb0gwSGFUS2xKekhQSjZxK3FFZVVQbkZuUXZBZ2pqLzFl?=
 =?utf-8?B?SnhSMXovZ3VrTFhjUlNWZ2ZISDZWMC9zTmlKZS9nMm5TVVdiQmlFakNDQWdQ?=
 =?utf-8?B?aGdnZ1VGV1hSemVITXNqVERMaWRkM0ZXQytNbVJDVXhITUpkSlhDQkZGWElk?=
 =?utf-8?B?RU1kdytkTWVGcFdhb2Q1aXVNS3NxUHJlT3dzMnI0TmU3SE1nS0VvQjBycGt5?=
 =?utf-8?B?bkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: advantech.cz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB3678.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bff23cb6-f679-451b-a66b-08db889427ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2023 20:10:10.5127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f8tpMPOAKapvlNlm7BSeKZ3PVC3K2fg7AwDLqoMEMeHnPKm1/1zKu/HHGr7+HHKy6srqnjOO9d0cCDU/eUfmcguh81G6milJU8Ohxb9ShSQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR02MB5679
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 20:10:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184606

VGhhbmtzIEJydWNlLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEJy
dWNlIEFzaGZpZWxkIDxicnVjZS5hc2hmaWVsZEBnbWFpbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgSnVseSAxOSwgMjAyMyA3OjQ0IFBNDQo+IFRvOiBQZXRyIEdvdHRoYXJkIDxwZXRyLmdvdHRo
YXJkQGFkdmFudGVjaC5jej4NCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBtYWtlLW1vZC1zY3JpcHRzIGRvZXNu
J3Qga25vdyBLRVJORUxfTE9DQUxWRVJTSU9ODQo+IA0KPiBIbW0uDQo+IA0KPiBJIGV4cGxpY2l0
bHkgdGVzdGVkIHRoaXMgc2NlbmFyaW8gdG8gbWFrZSBzdXJlIGl0IHdvcmtlZCwgc2luY2UgeW91
IHJ1biBpbnRvIHRoZQ0KPiBzYW1lIGlzc3VlIHdoZW4gYnVpbGRpbmcgbW9kdWxlcyBvbi10YXJn
ZXQuDQo+IA0KPiBtYWtlLW1vZC1zY3JpcHRzIGlzIHJ1bm5pbmcgb3V0IG9mIHRoZSBzYW1lIFND
TSBhcyB0aGUgbWFpbiBrZXJuZWwgYnVpbGQsIHNvIGl0DQo+IHNob3VsZCBtYXRjaCwgYW5kIGRp
ZCBpbiBteSB0ZXN0aW5nIChvdGhlcndpc2UgbHR0bmctbW9kdWxlcyB3b3VsZG4ndCB3b3JrKS4N
Cj4gDQo+IENhbiB5b3Ugc2VuZCB0aGUgZXhhY3Qgc3RlcHMsIHdoaWNoIGtlcm5lbCByZWNpcGUg
eW91IGFyZSB1c2luZywgZXRjLg0KPiBUaGF0IHdheSBJIGNhbiByZXByb2R1Y2UgdGhlIHByb2Js
ZW0gbG9jYWxseS4NCj4gDQoNCkkgYW0gdXNpbmcgYW4gQU0zMzV4IHdpdGggbWV0YS10aSAobGF0
ZXN0IG1hc3RlcikuIEkgdGhpbmsgdGhhdCB0aGUgImJlYWdsZWJvbmUiIG1pZ2h0IGJlIGNsb3Nl
IGVub3VnaC4NCkkgZGlkIG5vdCBzZXQgYW55IGtlcm5lbCB2ZXJzaW9ucyBleHBsaWNpdGx5LiBU
aGUgS0VSTkVMX0xPQ0FMVkVSU0lPTiBpcyBzZXQgYnkgdGhlIG1ldGEtdGkgaXRzZWxmIGluIHRo
ZWlyIHNldHVwLWRlZmNvbmZpZy5pbmM6DQpodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL21l
dGEtdGkvdHJlZS9tZXRhLXRpLWJzcC9yZWNpcGVzLWtlcm5lbC9saW51eC9zZXR1cC1kZWZjb25m
aWcuaW5jDQoNClRoZSBrZXJuZWwgaXMgImxpbnV4LXRpLXN0YWdpbmdfNi4xIiB3aXRoIHF1aXRl
IHN0YW5kYXJkIHNldHRpbmdzLiBSZWNlbnRseSBJIGRpZCBleHBsaWNpdGx5IHNldA0KQ09ORklH
X0xPQ0FMVkVSU0lPTl9BVVRPPW4NCndoaWNoIHdhcyAieSIgYnkgZGVmYXVsdC4gV2l0aCB0aGUg
ZGVmYXVsdCAieSIgc2V0dGluZyBJIHdhcyBnZXR0aW5nIGEga2VybmVsIHZlcnNpb24gd2l0aCB0
d28gaWRlbnRpY2FsIHN1ZmZpeGVzICgiNi4xLjMzLWc4ZjdmMzcxYmUyLWc4ZjdmMzcxYmUyIiwg
d2hlcmVhcyB0aGUgbWFrZS1tb2Qtc2NyaXB0cyB1c2VkICI2LjEuMzMtZzhmN2YzNzFiZTIiKS4N
Cg0KVGhlIG91dC1vZi10cmVlIG1vZHVsZXMgSSBhbSBidWlsZGluZyBhcmUgdXNpbmcgcmVjaXBl
cyBhbG1vc3QgaWRlbnRpY2FsIHRvIHRoZSAicG9reS9tZXRhLXNrZWxldG9uL3JlY2lwZXMta2Vy
bmVsL2hlbGxvLW1vZCIuIEFnYWluLCBubyBrZXJuZWwgdmVyc2lvbiBzcGVjaWZpZWQuDQoNCkkg
dHJpZWQgdG8gYnVpbGQgdGhlIGx0dG5nLW1vZHVsZXMgYW5kIHNlZSB0aGUgc2FtZSBpc3N1ZTog
Im1vZGluZm8gbHR0bmctY2xvY2sua28iIHJldHVybnMNCmZpbGVuYW1lOiAgICAgICAvaG9tZS8u
Li4tbGludXgtZ251ZWFiaS9sdHRuZy1tb2R1bGVzLzIuMTMuOS1yMC9wYWNrYWdlcy1zcGxpdC9r
ZXJuZWwtbW9kdWxlLWx0dG5nLWNsb2NrLTYuMS4zMy1nOGY3ZjM3MWJlMi9saWIvbW9kdWxlcy82
LjEuMzMtZzhmN2YzNzFiZTIva2VybmVsL2x0dG5nLW1vZHVsZXMvbHR0bmctY2xvY2sua28NCnZl
cm1hZ2ljOiAgICAgICA2LjEuMzMgU01QIG1vZF91bmxvYWQgQVJNdjcgcDJ2OA0KDQp3aGljaCBp
bmRpY2F0ZXMgdGhlIHZlcm1hZ2ljICh3aXRob3V0IHRoZSAtZ3h4eHggc3VmaXgpIGlzIGRpZmZl
cmVudCB0byB0aGUga2VybmVsIHZlcnNpb24gKHdpdGggdGhlIHN1Zml4KS4NCg0KDQpQZXRyDQoN
Cg==


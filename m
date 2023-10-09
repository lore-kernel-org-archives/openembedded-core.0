Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19777CD612F
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 20:56:33 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.50])
 by mx.groups.io with SMTP id smtpd.web11.74956.1696884987846070264
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 13:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=oeW9siIx;
 spf=pass (domain: siemens.com, ip: 40.107.21.50, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ogKnDMl0Sz5tVtYWGFLZHhmcNdvUeT3UEZ9gXZPeOt8WbCtH97KVHrnCAn5ZLPNcU4KK+Oy7SvEQXNwcy2FD8ovBrG8+TPiomhyGDMWXDAa0739KBgBxJs0QxqYybgn+QdnCXhbRqrumUpOCLM0dO10GBTzhZvpKUqq3Ja1i2G9p1G/pcX4Kv7fjOTMuvCtN3ylfJjeRi4nYSz/kYd57e0x7C9rtNVF3ZM/x7604hh4HsnwTcOi2bS9yO3QXPbBRJ4+lhVLW6LWsl1Fdmp/1/lh81SevHFVs6tsN9RJHfZ9lCEKRfaATfxpyWT7mccXc0Pz9g7IRCs9jBvQJVjFHmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WpY4faVZBg8tElhkPzlsHEZ3rRnQ57uIZwhWaaJpJFU=;
 b=NB/tLsGhnMnGX7+Cijh2wWR6lPfH+7dO1tsj5Mq5hXC+Zrl2oxB8XPWtOCw9pbSEwHnWGpTEf6ZL5aob1i6WtVGAqEVr2iqM7Mr4FF8HXnkhOFLpyY6wz6ymKandk6thzqZeqG76XceLsA6gTHW2byi14DUQBLNwSpkgIjUgXo1TcWSri7WGLsJvEH6snWTC0mzk9rfy16W6Rif98rvAEAGTsModzsW8gfret6hcE/WluTFBee7qpFMkOHgl8zg6RjHJGeY8dY7hYAzXOac60WfJtwtGGMZAPGWfzalVJab19bMuogdDLMh2Rx8KUziE/uxW+e+JURUJEhZJY+IHNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WpY4faVZBg8tElhkPzlsHEZ3rRnQ57uIZwhWaaJpJFU=;
 b=oeW9siIxa0H5H6K/wXmGE4+KuEsC6a+kcgvn71bxdNa6Y8MGEcisdk3uBQ14QiYaZtpP2l4uSmsMRMUqo3Zm5lIbBZ0CdLTmQqXFONi1wh5YC6VjRbh+XAcZVg00aHyeb/zh5dIv254c4anRr7G219cJDR/5PKlwNHQOlgx64+2id+PlehbRvGjVkfxNdwcZ9lw02Lzjjr34OZnko6XgIExab4rylGZc+6d5iD1BlVuNbDo9BlDyjAKVPIpuDNUygUL2z2pKVH8iURKnjQcb2K9C9ngRr617Kf/KnD5x9/7vrlzOhEZ/p/Tk7xSCxw4Y7Fx54qFsfm2zXYafYn9hSw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by VI1PR10MB3278.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:137::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.43; Mon, 9 Oct
 2023 20:56:22 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fad3:1ee5:fae4:adf7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fad3:1ee5:fae4:adf7%5]) with mapi id 15.20.6838.040; Mon, 9 Oct 2023
 20:56:22 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Marek Vasut <marex@denx.de>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, "steve@sakoman.com"
	<steve@sakoman.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] ncurses: Mitigate CVE-2023-29491
Thread-Topic: [OE-core] [PATCH] ncurses: Mitigate CVE-2023-29491
Thread-Index: 
 AQHZ+s4QM7OitojrPkSOGd5qmkfWiLBBqgyAgAABCGCAAAKCgIAACAHAgAAiNQCAABXoAA==
Date: Mon, 9 Oct 2023 20:56:21 +0000
Message-ID: 
 <AS1PR10MB56977FE08F148CC174EA0383FDCEA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20231009163110.94431-1-marex@denx.de>
 <4eb39033effcbbcd8651f73632b94bb159fecb65.camel@linuxfoundation.org>
 <AS1PR10MB56972FEC790240DB9F01228FFDCEA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <71c01da4-1fcf-438e-ad90-d17970a9adc2@denx.de>
 <AS1PR10MB5697B786381725B14B540C96FDCEA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <faa8e420-8a86-4523-9d79-b6348a93023c@denx.de>
In-Reply-To: <faa8e420-8a86-4523-9d79-b6348a93023c@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=0158446a-13b7-4b2d-9267-a4dfa5ee6fd9;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2023-10-09T20:46:19Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|VI1PR10MB3278:EE_
x-ms-office365-filtering-correlation-id: fa83a37b-4643-4b65-cc24-08dbc90a317d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 yR45jjSbouKkx/1nUdWDBnDZziFMYECo2iKMOzYvPpki2LvvhW5j/E/fZ89AHCQr8qCpPOzYuwye5RVdNeqLN04X85SCxyF+toiCbnvsj2stWLs8AoTlk6M3xjjKxxo1Q15eFhBOFQDNSyPQr4sh5OuanT87prC9CTlng4LbQNEn4i9MvoiACKRNXiVUCvkFHeEIYzy/E/23AFN96NfME/DDSUZlnGUu0zBn8XR3wy7qivhVdnvZlL5w9RZ30sI9h36WFHYaLFUknpOqOwbf2fmkOYgbhH3TTs7Sq88dTPqS3+rw5/GkMAWKYOwPZkCa61SxdXQPXxbeQMbyooGRYA1exZGA8PLY02sj0AMszKZbgoThuMvwXkowjweeTHHKSsSZ+o4Q5DQepUmzBKSJsW1uavNrmc1BncW7Ut42ycsQGhwsWSI380yerT59fXjrl5900p8kG6nAA+J4YqpXgdNcWmzwjGbEjD3F0OdRa1j87F/SET1jbOmWug5TDurr2GwdkqIwUg7+cOWJxmPeeYauUbcdnXtiRN4e7P5XyXKsrg9rQyvr+ec3TaEft5SI29u0AphdpKPuK682tBl/lXmFGTSjlaX9T43i9FcbwYI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(39860400002)(396003)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(9686003)(478600001)(7696005)(55236004)(53546011)(6506007)(966005)(110136005)(26005)(71200400001)(2906002)(83380400001)(54906003)(66476007)(316002)(66946007)(76116006)(4326008)(8676002)(52536014)(66446008)(41300700001)(66556008)(5660300002)(8936002)(64756008)(82960400001)(122000001)(38070700005)(33656002)(38100700002)(86362001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SkNETGR4QzlnMkVhNVdIZnhQWFpJSytHVjM5aWlMUTNqa2JMa1ZhdWhoMzJn?=
 =?utf-8?B?ZTlwWkFCOTF5aGwvd1Ywd2Q5WFIzUEZSd29nUHdNZ1A2emJnOEpERzl5MmE4?=
 =?utf-8?B?cURTQzE2TEtOZHczZ1Mza01CazF1Vk81QnluUU9pMEtxZDVMZ093eEJkeDVO?=
 =?utf-8?B?QW16RVpuOTY0Zjl2d1dvTDVyNCtBcklYY0JXeTFZT0ZTa2E5UEVqWTY2bTJo?=
 =?utf-8?B?UjA0R3VaV0pWVEpYL0hqNWx0QlF6dHN2MkI5NktDZnFWWFNqblRkMmM2NkJx?=
 =?utf-8?B?N0dkM2hsN0hBR2NqTlpJNDR6WVFyOEJwM2x5NUJNekRuVUErOEpVZWh3RnZo?=
 =?utf-8?B?TW02UXE0c1lYUWlYc1RNMWhmWEY3Zlp6Vk9PaERsSE9pcUdrTFRGNHNZbUFW?=
 =?utf-8?B?WVZpckEzS0tuNEdxQ2VFaThmaHNiSmRUU29JbTRwVG8rMzVCNjlPTXVoSm82?=
 =?utf-8?B?ZUh6TVJLcUpxS2IxVUpQMDAraXljd29QdlZEM01yMkFxR2FSV05TdWJmZHV1?=
 =?utf-8?B?dmI2UktGc3YzeS9yRndKMVNSUnZZM2NkUHY1ZFl1S2xwbWJnZFBCazdld1Vk?=
 =?utf-8?B?VlBzYkxBakhkU3ZUOHAyOEVWQTAvK1BWaTZsU21DbUNJUVpQcUZYd0NOL1l3?=
 =?utf-8?B?eFZrVmNneGVHYVhBb1hvMVdMWWxqb0xsUDJBT2FGcjBMVklsYmhRdk80enZS?=
 =?utf-8?B?ck5OQmVReDFDNktidzNrMEpiWHF0Y3k0ZzYxOHFITXlDSGxReW5KY0xhZFoz?=
 =?utf-8?B?S1VQZi9kSzRISmRvNzhjL2pqWjhmZi9jNHlwa09FREVxWERsdk9ZcWlFODFR?=
 =?utf-8?B?N0pJVk84MytZaDJtOHlycjB0VzdpVDhTSmNMRDVJYm1ERW4vTWtZTVp3YWUy?=
 =?utf-8?B?MEZNNVJuTEk0SEoxQW9RenZuR2pMUUFKdDZub1RDWTRuYmFzWFJyTEd6eTNs?=
 =?utf-8?B?ZDVoWjE2SnJEZU9oNFEwRU5iRkxNajRTMlAwdGxlNk9QOThpSzQ4dVFlYjRW?=
 =?utf-8?B?cW5ENkRRZlUvZnRFZmlVdHdteU5nWktkOGZ1dXRDUVhsd2pqeW9zRUwxbDQ1?=
 =?utf-8?B?eE5lRVZoQjd4eU5TUjRVMDRVa05BYnF1M2o1aEExN1pLc3lqNXVuVWNkNU82?=
 =?utf-8?B?YWdRR0U0cnQrNk5COFpqZzVWeHpsZjdsUVJTQzVUanpsYThDaVFOT0puWDJD?=
 =?utf-8?B?ZHl4dFUzTTNZWWpMRzBNcE0zY1h5MTlmWTVJRGExYTBUY0VGSi9mN3l4UDU5?=
 =?utf-8?B?Ymt6S2dBTjFqZ2EwV096SGQzSEN1S09xRUIrdUIrb3JaWGQ3OEFEZ1hVbThX?=
 =?utf-8?B?TFBScFpkUHJhY2Y0cTV0SHJ5elhUUG9YRk95cTZUN2JlQjFyc0JYNUZubWFJ?=
 =?utf-8?B?UDlIemQ5VXpRR2E4dVl2cnIxREJNV3oyb2lRTk45WnppSmlIRWIvamltRzQv?=
 =?utf-8?B?ODZNdndzUUdXS0FxdS9PZEtaUGpURGdRWmkxU2R6R0R1WlVqbGJsVzV5MXZ6?=
 =?utf-8?B?SUtQZ2lRMW5QR1UwdWd5OURYMHk1ZlJ1THR5bGVrd0d3Ry9YSmlaN3czSmtL?=
 =?utf-8?B?ZkZEQUVqOFhWMUxxR2c2M21KRjcyNEpsUWdpV0J2alRTc0Z5eG1kU0NUNUxa?=
 =?utf-8?B?YmZnajdQQk9JSmIwSnNmWm8zR2ZuNGpwRVYydmJleGMzZTBMWWROT2s0VTMz?=
 =?utf-8?B?T21XckxhamF4VUpvMVpDbDBha2FkWGN6Yis3TE5pNkNUSGdmaTNnZnNCODFv?=
 =?utf-8?B?WFdTRnpCbmRHRWZKTllCSXF6bkZkcVdBcCt6OTFYODVWUFExZzRYRlhXcGdt?=
 =?utf-8?B?QkxKcUs4WEljTXhJNTVTK3BsRXVCRVoyM2lXUXA1ekdpdm5yT1IxV1p5dGdZ?=
 =?utf-8?B?cVJmSC9Kc25EMUlvUElFdGQxWnc0eVVIUDBWL2tjbGUrdmFBaU4zcHE1QVky?=
 =?utf-8?B?YWdjMjhiL1RrOTBOTG9xR2ZhV3VWRVVIQzdWcXZEYmZ5VzY0YWx2UlpSRHRG?=
 =?utf-8?B?T1ZRcUcxbGFGRjczc3diL2hUSGFhTHJaSUR1NjhnVjBKcDBQQ2xNTDEra3lh?=
 =?utf-8?B?dUxPMXA0UDRpbkhEOEI4dWtDcjJCWkJ0dGZWV2VTbXc3VGVFUnl5L3hveFlJ?=
 =?utf-8?Q?OP3CBX0GwS6N/j95RR8XlEPke?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: fa83a37b-4643-4b65-cc24-08dbc90a317d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 20:56:21.9992
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ceIpzQmeWJ/uqDcV2FRoxS1i9fCXB/mzQfU0pTAy42Yg8HYaQ+DAQZN7tXTo16g3x3G8gof3LxZZH8sC7Uf89A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3278
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 20:56:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188866

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54
LmRlPiANClNlbnQ6IE1vbmRheSwgT2N0b2JlciA5LCAyMDIzIDIxOjI4DQpUbzogTWFya28sIFBl
dGVyIChBRFYgRCBFVSBTSyBCRlMxKSA8UGV0ZXIuTWFya29Ac2llbWVucy5jb20+OyByaWNoYXJk
LnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnDQpDYzogQWxleGFuZHJlIEJlbGxvbmkgPGFsZXhh
bmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPjsgc3RldmVAc2Frb21hbi5jb207IG9wZW5lbWJlZGRl
ZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BB
VENIXSBuY3Vyc2VzOiBNaXRpZ2F0ZSBDVkUtMjAyMy0yOTQ5MQ0KPHNuaXA+DQo+ID4+Pj4NCj4g
Pj4+PiBTaG91bGQgdGhlIHBhdGNoIGFkZCBhIENWRV9TVEFUVVMgZW50cnkgYXMgd2VsbCBzbyB0
aGUgY3ZlIHRvb2xpbmcgY2FuIHRlbGwgd2UndmUgbWl0aWdhdGVkIHRoaXM/DQo+ID4+Pg0KPiA+
Pj4gbmN1cnNlcyA2LjQgaXMgbm90IGFmZmVjdGVkIGFuZCBub3Qgc2hvd24gaW4gQ1ZFIHJlcG9y
dCwgbm90IHN1cmUgd2h5IHRoaXMgaXMgc3VibWl0dGVkIGZvciBtYXN0ZXIuDQo+ID4+PiBQZXRl
cg0KPiA+Pg0KPiA+PiBKdXN0IHdhbnRlZCB0byBtYWtlIHN1cmUgdGhlIGNvbmZpZ3VyYXRpb24g
aXMgY29uc2lzdGVudCBhY3Jvc3MgYWxsIHRoZSByZWxlYXNlcy4NCj4gPiANCj4gPiBJIHRoaW5r
IHRoYXQgdGhlIGNvbW1pdCBtZXNzYWdlIHNob3VsZCBiZSBjaGFuZ2VkLg0KPiA+IEl0J3MgbWlz
bGVhZGluZyB3aGVuIGl0IG9ubHkgc2F5cyB0aGF0IGl0IG1pdGlnYXRlcyBhbHJlYWR5IGZpeGVk
IENWRS4NCj4NCj4gV2lsbCBkbywgaG93IGRvZXMgdGhpcyBzb3VuZDoNCj4NCj4gIg0KPiAgICAg
IG5jdXJzZXM6IGRpc2FsbG93IGxvYWRpbmcgb2YgY3VzdG9tIHRlcm1pbmZvIGVudHJpZXMgaW4g
c2V0dWlkL3NldGdpZCBwcm9ncmFtcw0KPg0KPiAgICAgIENvbmZpZ3VyZSB3aXRoICItLWRpc2Fi
bGUtcm9vdC1lbnZpcm9uIiB0byBkaXNhbGxvdyBsb2FkaW5nIG9mDQo+ICAgICAgY3VzdG9tIHRl
cm1pbmZvIGVudHJpZXMgaW4gc2V0dWlkL3NldGdpZCBwcm9ncmFtcy4gVGhpcyBpcyByZWxhdGVk
DQo+ICAgICAgdG8gQ1ZFLTIwMjMtMjk0OTEsIGV2ZW4gdGhvdWdoIENWRS0yMDIzLTI5NDkxIGl0
c2VsZiBpcyBmaXhlZCBpbg0KPiAgICAgIHRoaXMgT0UgcmVsZWFzZSBieSBhIGJhY2twb3J0IHBh
dGNoLg0KPg0KPiAgICAgIFRoaXMgaXMgdGFrZW4gZnJvbSBkZWJpYW46DQo+ICANCj4gaHR0cHM6
Ly9zYWxzYS5kZWJpYW4ub3JnL2RlYmlhbi9uY3Vyc2VzLy0vY29tbWl0LzFjNTMwYWFkNzcyZjdh
ZWVmMDM5Yjg3ODBkNTFjZDA5YmQ1YTA4YWMNCg0KUGFyZW50IGNvbW1pdCAtIGh0dHBzOi8vc2Fs
c2EuZGViaWFuLm9yZy9kZWJpYW4vbmN1cnNlcy8tL2NvbW1pdC85M2EzODM2ODFlM2RhOWYzODU1
MzZmOWJjOTgyNjZjNWRkN2U0MmNmDQoNCj4gIg0KPiANCj4gPw0KDQpUaGUgY29tbWl0IG1lc3Nh
Z2Ugc2VlbXMgdG8gYmUgZmluZSBub3csIGJ1dC4uLg0KDQouLi5sb29raW5nIGF0IERlYmlhbiwg
dGhleSBmaXJzdCBjaGFuZ2VkIGJlaGF2aW9yIG9mICItLWRpc2FibGUtcm9vdC1lbnZpcm9uIiBv
cHRpb24gdmlhIGN1c3RvbSBwYXRjaCBhbmQgb25seSBhZnRlcndhcmRzIHVzZWQgaXQuDQpTaW5j
ZSBZb2N0byBpcyBub3QgY2hhbmdpbmcgdGhlIGJlaGF2aW9yIG9mIHRoaXMgb3B0aW9uLCBpdCBp
cyBwcm9iYWJseSBhIHdyb25nIHRoaW5nIHRvIGVuYWJsZSBpdCBieSBkZWZhdWx0Lg0KVGhpcyB3
b3VsZCBuZWVkIGEgbXVjaCBkZWVwZXIgYW5hbHlzaXMgaW1obywgZm9yIGFsbCB0aHJlZSBicmFu
Y2hlcyB3aGVyZSB0aGlzIGlzIHN1Ym1pdHRlZC4NCg0KUGV0ZXINCg==


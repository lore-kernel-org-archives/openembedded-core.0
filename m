Return-Path: <Jasper.Orschulko@iris-sensing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73859C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 14:13:36 +0000 (UTC)
Received: from DEU01-FR2-obe.outbound.protection.outlook.com (DEU01-FR2-obe.outbound.protection.outlook.com [40.107.135.51])
 by mx.groups.io with SMTP id smtpd.web11.80717.1705328008732987195
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 06:13:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@iris-sensing.com header.s=selector1 header.b=WQpdS1bN;
 spf=pass (domain: iris-sensing.com, ip: 40.107.135.51, mailfrom: jasper.orschulko@iris-sensing.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S1PhVlEmpL5SBbZwDLbZyiD6w1GXdxwP/SpXhmHDcylCFDFtDQLPoYH7G/exc34xx/KBuD1wGiXjaA+wZmcAnDDtIViFDbxM2IBdx7bbzAnF86tDHxXwbmUGTxcufOo2Z+HY0FWtcREwth+z8fP0vIt1vn44LdJXQxV6BUWRsDAQ2KT+LSkXKxok82LqCZRIbY5oPknLpHJOKDKrVOC8oHWUVZyMgHc9E+emY/t7z8+s+v0cXckUgkBL8ZyFMaZmD30fTNk74ZtRMzYutJo40HqkHGANfSO2fB7M1e/hZYxWoDJ+SrJGNyuYvLYUH9tiW7ZDdlhW0R4xSNOXzUPVSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=64I/nOBQQOD07S35/gxZttGk9s9j7JQ0VCdHxIXSn3I=;
 b=WxcdZdVWtnhiQg/3FEQCmvih4e6fnArKWYG/FOGnJrsXkQ41PFxR7wZnBnU+fyys6+j1vyJZubGLaUnVSYWTKebSw1AsUpq7hT3RP1yKiqsc3rGRD2R+yASncEai7cnzP2GQnh2M7n0XYmK3yKJRgcxbQCpN3HEiKypyYD9J7lfeDmsiw4NUS+PjOSSZUv3KU1QfuDbdMuk8TnyH40REzvZiDPsS2hOjFWszH4vYLC/G6JgU44hIrug0VTslV/ql59vJvB9TIH+oTaPxZ9txP+lBBuNZGMXNzjk+j44M3K6llSdPfgYCIIMxBYdBj32jXuhIBBSS5k30vd+iyO74Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=iris-sensing.com; dmarc=pass action=none
 header.from=iris-sensing.com; dkim=pass header.d=iris-sensing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iris-sensing.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64I/nOBQQOD07S35/gxZttGk9s9j7JQ0VCdHxIXSn3I=;
 b=WQpdS1bNt0HDVXt4TP1epy6QyidxKb5daopIxg73YNZksADOSWPDeQnwRn2hlRymc06DMJ0zc+9JQACFkrtPFael2Q7OkUaHeTsdSIE/E93Tv8+MXRvJqNED2FEmgg6Tb/DGH3gZvoCoIG5WUTa3Y02Bka5t3q4BrmZ6LU8Fwyde1V98/PIq/Czal7NMJGhOZrjNlBOniIBt5Vh7waIcr2bmWRawnt+8A/Ibu1qyJ2c6cX+8GiuKB6X34gmv2i0ItoVezYs2TQo8WjPDTkKvT6f/RGC3uFeD44g3NAMDrs/d0orhyg7Fqp+ajr/V4ABfVvvpqdgp3YchdqSd7JjfVA==
Received: from FR2P281MB1963.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:3d::14)
 by BE1P281MB2929.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:6e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.25; Mon, 15 Jan
 2024 14:13:24 +0000
Received: from FR2P281MB1963.DEUP281.PROD.OUTLOOK.COM
 ([fe80::1568:5c5e:8a0d:be4a]) by FR2P281MB1963.DEUP281.PROD.OUTLOOK.COM
 ([fe80::1568:5c5e:8a0d:be4a%4]) with mapi id 15.20.7181.026; Mon, 15 Jan 2024
 14:13:24 +0000
From: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "ecordonnier@snap.com" <ecordonnier@snap.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Removing Github release SRC_URIs from oe-core recipes?
Thread-Topic: [OE-core] Removing Github release SRC_URIs from oe-core recipes?
Thread-Index: 
 AQHaR01toZjDsnahoEKeitp4QsxNjbDabEdvgAArzoCAAE3pAIAAAVEAgAABU4CAAACAAIAAAkMA
Date: Mon, 15 Jan 2024 14:13:24 +0000
Message-ID: <c229298e2e15b01e4ef50c9e61fe96b3c7c9bd93.camel@iris-sensing.com>
References: <2ef89f525fd5ceaec574d025c515033c06fcaf6c.camel@iris-sensing.com>
	 <17AA7149AA53F0BC.13033@lists.openembedded.org>
	 <CANNYZj9yuJemGmM3aLqL+LEaixSrqchgH3406fzreQbqzjwPaA@mail.gmail.com>
	 <CAHUKmYYnztYA5zJN7StJzLcBzW9gexFbD2PNhGD6rzc7BW0pmA@mail.gmail.com>
	 <8a632115c057bcecff50ef9404802670f072c4a6.camel@iris-sensing.com>
	 <CANNYZj8jPYgXuu8FzGOLD99Rxv7wxWdy3KCMtAN5YERhibrawA@mail.gmail.com>
	 <36bdc27c8ff2eb0fa91e5bd8b44556dfc270fb49.camel@iris-sensing.com>
	 <CANNYZj9oX1YRzmbvGKqSsy8anTsLsh8nKLjqx18C9XEGR6ophQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9oX1YRzmbvGKqSsy8anTsLsh8nKLjqx18C9XEGR6ophQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iris-sensing.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR2P281MB1963:EE_|BE1P281MB2929:EE_
x-ms-office365-filtering-correlation-id: ec7853f2-d5f6-419b-3769-08dc15d42334
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jZQGx8MiP9q7jLd9fqNfxzZM3jcBM49g6h0wsZX37HWOjqw3Djp0va83H/9yBafFB5XaKqO5TsiJgLc37+jRg1XlS1jzgHc/8w2H9PQTrfw8yDjOurDJVE0OBPAmKq6hqb2U55pOkZtMf7ARQov8jkheCAbP01Zv0shp0HcLq0b99NtnoSIWqyI7WVYJRLKmiH8CB9PH1glblAcbPnW7SFrDdalMTN8NdXMQDy4nAWdPA8zESlLhema27gFDYuviN7Yremn73X8NbZwZFM0/xi82fjpcENrNrz96mN5Xc/54KcDjDZAmtxOK3zqwHic1Jr9SQtYdj6wCnwuQQyPBYxKe/yIJ55GH478krCsYp1yOIDn34rYgQ+ev7K2o1I1Xoa0lyaSKA1M6q4rGC0yEQffMuhSJTVZU6YSrTDMjvvUET3iRMRPt9iS4r4DgQVITQYiwCHq3X+mWLoe0HrzIcnQEJ0Bgp1zTFHM4UU/XHorOFhnJsbU8OL2vz9VhSCr8rivFVmGR9ZTZ2PmQx21gVDbh8iee/66FrfWriVX1IX4KI47BbGeHISrzPyWqcBf4On/+mGCufChORmELZ7CfBmfKhuYM9kHsoGk5aUM+iM0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR2P281MB1963.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(39850400004)(366004)(396003)(376002)(346002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(26005)(38100700002)(2616005)(6512007)(55236004)(71200400001)(2906002)(6506007)(966005)(122000001)(478600001)(4744005)(5660300002)(54906003)(86362001)(91956017)(8676002)(66476007)(8936002)(4326008)(66946007)(66556008)(316002)(6486002)(6916009)(66446008)(76116006)(41300700001)(36756003)(64756008)(66899024)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SDg1cGVOaTZMNmgwZnhFSkVjTEFuQVJDNy8wTGJvTUJhV29TQ1M2NngxRDA5?=
 =?utf-8?B?MFpHVTFQc1pqUjdUWWJhM0RrS1R5N2FNQnduUDdPbyttU0dSZ1pGcml0TVB3?=
 =?utf-8?B?M1dNb3RiUXJDUXdiVTFhMUg1R2NjR0J1M3V0SjgzTFZUVkpDLzh1M3YzajZ4?=
 =?utf-8?B?QlFzSU5DY0lMS25jbzRLOWhoVEl0NmYyelkrK0wxbitxbHF2R0I5TjVWYXBP?=
 =?utf-8?B?RjhTZjhwektsUmZMRUNMYS8zUGhjN3hjYVR0WDN4U05BNUJiSlpFR2JXZ3dj?=
 =?utf-8?B?WGhjbWNnamw4eDhjRTBXbjhGdzhNK290VURCRlorakJ4blFXaWtRZU0xZHNr?=
 =?utf-8?B?a1RCOHJMQWZKYmdHZS9SbGcyNHRLcUVEdzJQR0Vhb0dZZjN5aEhXc0ZuWEds?=
 =?utf-8?B?M3piZlJJSmEzdXUySHNLWTBHd0pMSzlGY2tnVTgySXNERGVXZ09ZMGVVVFhj?=
 =?utf-8?B?NW5mcXBKVGo5SGl2WkEvMUdQb2dEb3VHOWtGbWplWGZWTGx3a1FWampMSzUz?=
 =?utf-8?B?UFZKZGt3dDNLTlhqQVQ0d2RtL2R4dzlvRnUrT2FwaU5UQ0ZWbEF6a3pKM0d6?=
 =?utf-8?B?WXBDSFVtYjFwd1IydnQyQWd0c3hNQkg2UVFBblNUSjdEQUwzSFBOdjZ0eXhR?=
 =?utf-8?B?VHdmcTRvU0pIQlA4amw4ZkpuMndJVkFNNTM1S2JyV1VIekczREJqckxRaUFV?=
 =?utf-8?B?cTZjUkZYWWRoZTZhWXBkbU04a0hUazZ2UzVRRmE5bFowaWlTcmplRUVtbzlz?=
 =?utf-8?B?YkJCY3lXUkdQSkg5cXhFWTUwZHNHczlTRis5UDJvL3lOK3AvY0o0dFd0SHd4?=
 =?utf-8?B?akRleXZlb1lHTk5tbHJYZE1pcUQyNVpVZkhyWE4vTlBvM3FIaktkYkVEdG9k?=
 =?utf-8?B?aVc4SzY4cTdoVGdUK3lxWFAzZDVadkk5YnEzcm9RaDBrSEFKUWRzd2NoK01a?=
 =?utf-8?B?bTNxOHNoSHRVM0IrSWN1ZEIxM090YnFScTN6RDRJQzQvSVRZcTR6TENybzE0?=
 =?utf-8?B?OFJnZmM3UmJjaXdaUklmdmNKcmtML2dETFZDSkN5MmdZWTRyY3ZsVEgyOHdR?=
 =?utf-8?B?UTFESDdZZ0JHUmxWSy9HWlkvdnFHMVRDNXlSc0U5dkVxU0xzc3JMano2OWhy?=
 =?utf-8?B?UzdqMWZFbDNwUGl5dm1qVFJ4OWowNXFlcVZaTzNHMk5MMkdJWmVlbkQrZXN6?=
 =?utf-8?B?WHZpRGZiR1VudnJueElNaUVSWGkvOU8rd3hNeVdDU2ZyeDAzdW85VDhVVDRi?=
 =?utf-8?B?ZDRLdUJsZm9UdmpleVNjMTd6VlR4K0o4RE1qNGp0TkdVV3g1OXBMT05Jdm5Q?=
 =?utf-8?B?NlMzUlVvOWRBR0FRK1k0NGszQ2cxVzE4S0ZsMnNzWGUvT1NDZjhwYkViR0pU?=
 =?utf-8?B?dzZodUxqdkNhaW5rN0dub29ESnFFbzk5OFlXNG5oRFgzcW81K05RTzVTd3ph?=
 =?utf-8?B?OUFrckJreEtTaHY1QzRSUXRicVJTUUpBTVAxQXZ1a3BOb1RxQ055Z0t0cWVk?=
 =?utf-8?B?TWx5ZXMvVDFxYTFaUmpSd3pLWlRCMXBSdmtVa0JZT0E5N3JNOExoaTM1azUx?=
 =?utf-8?B?RldXK0M2ZHVHVm5RU3prT0NKVGh1ZHYrMTB2OS84OUYxWThlQ3dZNG9aNGlj?=
 =?utf-8?B?V0F0K1ozLzhKbExGR3BvZTMwVG1MbGZ0TGZDS0x2ZVZYdUU2aEo5TCt3Z2V2?=
 =?utf-8?B?Y1FXVStxbm04MkRKdTRHWllnMTB4c21ON0IyaGFUcitYbXVjbVB1bDZXQU8x?=
 =?utf-8?B?T2d2b1R3MmZTc3JVWjVlZDhvcVJiY0ExN3hTU2VHQ01JdjZ4ZTBLNzZQbk1I?=
 =?utf-8?B?RUpLbkpCN3BsQUl0WTMvZ0pXUkRmZk9hU0hVUUY2TzNKOUNpUjNuZllwYi9o?=
 =?utf-8?B?bXpiWGtxNmNQcmtXaGZMcEZ2aTlWZnJHcjlWQk9jcDhtSGdSbHVwbkVxNlN0?=
 =?utf-8?B?NG5ZY3RIV1ZocC9wVDl0SkZoUEdqL3I1M1FSaFNEOERHUUV6Zk1qbW1FK3lk?=
 =?utf-8?B?N3pKNWd1WXJCWFdBakhxZHFVMHVOczdHZ1hndEd1MTZ3S3oyQWdUZ25ZMC9B?=
 =?utf-8?B?SWJhSWh6cWdXMEpXc2NkNWZwYnNKM1BqaytDMkRFR0Fqb2JOY3NsUnlpWjdY?=
 =?utf-8?B?Z1dvd0xCOTBmSm9NbENlL29YMEtuaDhIcnMxWlEyU29XVjNyS2RwMXRDY2Iz?=
 =?utf-8?Q?bUIEFf4fduoIDlx2/otyZJc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <931E83975DD10043A1EFC0D80A5EE7D7@DEUP281.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: iris-sensing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR2P281MB1963.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ec7853f2-d5f6-419b-3769-08dc15d42334
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2024 14:13:24.7268
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 963f3913-ffae-43fd-856b-2dfd3f6604e3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e2Px68IVIt4LRcxk/hlNptVI3jb6hXdBgJsfzOOdvSr2SUbScFPXoLXymeFe2WxMCNlhphkklrstmX3MT6H4/cvxt6tFXaXBrZZDPwmJbHhf8OmsIi8OR/rtF0LQ6J11
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB2929
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 14:13:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193683

VGhhbmtzLCBnb29kIHRvIGtub3chIFdlbGwsIHRoYXQgYnVyaWVzIHRoYXQgaWRlYSB0aGVuIEkg
Z3Vlc3MuLi4gd2UNCndpbGwgaGF2ZSB0byBzb21laG93IGRlYWwgd2l0aCB0aGUgcmVsZWFzZSB0
YXJiYWxscyB0aGVuIEkgZ3Vlc3MuDQoNCk9uIE1vbiwgMjAyNC0wMS0xNSBhdCAxNTowNSArMDEw
MCwgQWxleGFuZGVyIEthbmF2aW4gd3JvdGU6DQo+IE9uIE1vbiwgMTUgSmFuIDIwMjQgYXQgMTU6
MDMsIEphc3BlciBPcnNjaHVsa28NCj4gPEphc3Blci5PcnNjaHVsa29AaXJpcy1zZW5zaW5nLmNv
bT4gd3JvdGU6DQo+ID4gDQo+ID4gPiBTYWRseSBpdCB3b3VsZG4ndC4gQXV0by1nZW5lcmF0ZWQg
Z2l0aHViIGFyY2hpdmVzIGFyZSBrbm93biB0byBiZQ0KPiA+ID4gbm9uLWRldGVybWluaXN0aWMs
IGFuZCB3ZSBldmVuIGhhdmUgYSBxYSBjaGVjayB0byBlbnN1cmUgbm8NCj4gPiA+IHJlY2lwZSBp
cw0KPiA+ID4gdXNpbmcgdGhlbS4gSSBkaWRuJ3QgcmFpc2UgdGhpcyBwb2ludCBiZWNhdXNlIG15
IG9iamVjdGlvbnMgYXJlDQo+ID4gPiBvbg0KPiA+ID4gdGhlDQo+ID4gPiBwcmluY2lwbGUgb2Yg
dXNpbmcgcmVsZWFzZSB0YXJiYWxscywgbm90IHRoaXMgdGVjaG5pY2FsaXR5Lg0KPiA+IA0KPiA+
IEFoIG9rLCB0aGF0IGlzIGludGVyZXN0aW5nLiBDb3VsZCB5b3UgcGxlYXNlIGVsYWJvcmF0ZSBv
biB0aGUgbm9uLQ0KPiA+IGRldGVybWluaXN0aWMgbmF0dXJlIG9mIHRoZSBnaXRodWIgYXJjaGl2
ZXM/IFRoaXMgaW5mb3JtYXRpb24gY291bGQNCj4gPiBiZQ0KPiA+IHZpdGFsIGZvciB0aGUgT3Nz
ZWxvdCBwcm9qZWN0IGFzIHdlbGwsIGFzIHRoZXkgY3VycmVudGx5IHVzZSBzYWlkDQo+ID4gYXJj
aGl2ZXMgYXMgdGhlIGRhdGEgYmFzaXMuDQo+IA0KPiBodHRwczovL2x3bi5uZXQvQXJ0aWNsZXMv
OTIxNzg3L8KgY292ZXJzIHRoZSBzdWJqZWN0IHdlbGwsIEkgdGhpbmsuDQo+IA0KPiBBbGV4DQo=


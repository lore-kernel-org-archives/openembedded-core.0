Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D244C0015E
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 21:14:34 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.109])
 by mx.groups.io with SMTP id smtpd.web11.1687.1689801264010936864
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 14:14:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=selector1 header.b=VIWwS40F;
 spf=pass (domain: ni.com, ip: 40.107.243.109, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eB2iUUJlVjTulDHWq0ZHWrFIHm7SPnS3CFZs7KQSccSPq4Oimh/2FA6Y9WFjJfDMbQGANzV1lrXno8HbbQQBY3Fr+in8arR4ffKLv13eL0MWOwgnJN75bisHv7Uvyj2zlRRKopSWsOROrPppqpMkMLXmkoEAhNP+KU3iyVYu9m2xNsng88gzGKQUOGPJZNWOlYRB5Ee3s+ubnL7WQuhIRN2G6rXQA8f1T9l9UY/M/1JehQ1Rz3XlHRgDzl0kSJFQgQye/xOgyZDY9+nzpfqBrafkSSERXpAhl9Xb6Y5Nf33vdxamUMMEoJ5kBDH4r2sRppwjtxBx9m54otc/ee6hgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wmi1wfo4/kC6RhVTEiB1iOuBBPmO4TpSnPCfNaOIyRU=;
 b=UJ0AZirW4UwaS1QB44L6Ts5a3q22OiuhLxxhpcIu1g6rRdnBz8IzRX5eS8Ux6NWSK8+dsElxliMEUms/EV7pxbaQ34SNkrKc7kHwn3adoxEM3KYAVXkMZl7m7xaRNPcsFd1KzOc2SHruKbze0cFurrwfBd7u5N1Z729rB2Ad3/ZqXSW33AdG4+cvWfR1ktMLELeme2Z5DH5n7EokBemY6W8R8TntVM3hhSowqtmKI2U25jICuB4LPhrUn/vTVnY374jtaFt3gIb2/24vCQk5Lirb5f7Ku0XNArwzmJ7ZOh9TE6GgDdNgt6aa24TYfKDBgarr6x9f1WoU/fKFS2N34A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wmi1wfo4/kC6RhVTEiB1iOuBBPmO4TpSnPCfNaOIyRU=;
 b=VIWwS40F41nu6ul3XenQcVYY9ckvRlUHoUdTc3JAFfyVNdsORlGonUyGFuj4PiTZLF5MJvrh07NVQy5WEK+0pBmkksz1YJGVIfkZVf4bYXiRKFUzRZXWGybdophtU8WM2YYna8lMWVCD/CT5a+gVr+O2bz+T1mG9CB19qw884p4=
Received: from BYAPR04MB4870.namprd04.prod.outlook.com (2603:10b6:a03:4a::15)
 by SJ0PR04MB7279.namprd04.prod.outlook.com (2603:10b6:a03:295::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 19 Jul
 2023 21:14:19 +0000
Received: from BYAPR04MB4870.namprd04.prod.outlook.com
 ([fe80::a1ec:bd70:8ee9:6ada]) by BYAPR04MB4870.namprd04.prod.outlook.com
 ([fe80::a1ec:bd70:8ee9:6ada%5]) with mapi id 15.20.6609.022; Wed, 19 Jul 2023
 21:14:18 +0000
From: Charlie Johnston <charlie.johnston@ni.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][RFC PATCH 0/3] Add packagefeed recipe class
Thread-Topic: [oe-core][RFC PATCH 0/3] Add packagefeed recipe class
Thread-Index: Adm6hfrCcEphFSdkRUOWLuw1tvtBgw==
Date: Wed, 19 Jul 2023 21:14:18 +0000
Message-ID: <32dfc0fd-aef2-ac74-7545-31f0e88f40e4@ni.com>
References: <20230719200252.1203047-1-charlie.johnston@ni.com>
 <17735F6200BCFB48.26345@lists.openembedded.org>
 <CANNYZj9X0mQn+bi758xiSAVa48d=NVEDBXCNkO89Fc37kWZ-OQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9X0mQn+bi758xiSAVa48d=NVEDBXCNkO89Fc37kWZ-OQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SA1P222CA0159.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::7) To BYAPR04MB4870.namprd04.prod.outlook.com
 (2603:10b6:a03:4a::15)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR04MB4870:EE_|SJ0PR04MB7279:EE_
x-ms-office365-filtering-correlation-id: 2d0eb36e-e84d-4bc2-e4a1-08db889d1d42
x-ni-monitor: EOP Exclude NI Domains ETR True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KpgGz+kDCR3wFidseljvYIoOLAahq8rDMxuyhxCDUJAO9TliGRQMbe+Ersipy/ZLInRWhCGJslBiETR0RRXQn73O5vm5fm4uBGdvWy9SgVsotFcmLsuxOzeyQYabPWPLU2JXEBwpmhWWcFHCOmB6BB8IZpSpKUziIRHiQhg1hRcKGIbdPORvtmhemuCgzAKTsRaOE3kxXWpb+pqZ1gZHQWGB88xRXUgyL7xke67eG1GfFpCmNnuxFGlR8qh1+JQkzHbWg0Kz0e07QLdg2sUcfXa1twB5XGF4HI9Qt+HdvFPN0WlXrYDxig/J1wgYnAYOjLQn4FQO7G/nhDgWFDSPJ0Eguxwj3B8Okwe/x5B+gPIzOZYk2Luz+IPswaYXeGbdMxy+Tw90DXPP7iyTk56gxhOP7rl7gNMihPxJoonA+OH3sk8o1rLinInEftLdRKNe3fBPzJHbpZI8rStcp7XtWMBPYjNKMM/NDOZp46uAV8lF+1XcTP8SiRk3E6C6ZLTyROFZ2ABGbD3cYzx2tNiD3S75rh33fEbMAUbx1iD2Gm97tW45qbddxcCFiLxiILAxpHcwY7R+eOPIRvFn4ozKMFo0PzabpVfqb4TR4kl6AjBRlUPTta23crKmaI2N7yPrH0+rqxPpevGz+DNva9/2Bg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB4870.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(366004)(346002)(39860400002)(451199021)(41300700001)(31686004)(64756008)(66446008)(316002)(66946007)(66476007)(66556008)(4326008)(5660300002)(44832011)(6916009)(2906002)(6512007)(966005)(6486002)(71200400001)(53546011)(6506007)(8676002)(26005)(86362001)(186003)(8936002)(31696002)(36756003)(478600001)(2616005)(83380400001)(66899021)(122000001)(38100700002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MHFLbEMzNk9Ob1NKdWhoa2pONVNiL1o4RElNcERvcUdLb3ZjNTNLTHZjamZQ?=
 =?utf-8?B?dWtEN2dSUXBKV1B0L3J3ZEdIb3M5OWdzWDJnUkVZY01jNWcwcnhIcFQxUkZi?=
 =?utf-8?B?S0tLYndDMEFPZnhLWmlKU2ZEZENMRVg0aFY1M1Z4RmlkciszcVFycElobnR2?=
 =?utf-8?B?N0J6dnhHRXZEUnBRckFOT055d3prd2VKOUozT0RwWk1ZeVFHcGIwTmVMUnJ4?=
 =?utf-8?B?L3l1Mnp4RHA1eTJHYkJhNmdNNi9nMGg4RFdKUUJJOThxZ0JOelI5RDE3VGk5?=
 =?utf-8?B?N20vakFNTWV2azJjdTBONU9yempEYmdpVTdKT0gycG40RUpnK1hrTnhxL2dK?=
 =?utf-8?B?REs4R3dHSmcxZnZDekZoWk1td1Z6L1RhTU82TW9nRE15M3drK0Q3ZUcxaGp2?=
 =?utf-8?B?SDJ2QldoaHcrS3VPOUVJZzNLdmtqRW52V1NCc3BUTGt6aVRaRk9qblIzUUcr?=
 =?utf-8?B?aUpHdUtXeUVtYU9sSTVHUmxYcVhuVDlWYUVzTkZnWmtWR0htS0d6YlZkSmdT?=
 =?utf-8?B?S1VuOXBOMjhPYWdEM25XUWRSTjZzUjJzNUJ5SjNaS3hYYTZTRzB2djEzOUdx?=
 =?utf-8?B?eWE4M2FBTWlWYkNSQ1NhTUNvN1BTYUJxcVl1TVdOekEzQ2RKTzN4R3c2eGp6?=
 =?utf-8?B?UElKeHJqTTJXa2ZWaXltVGprNUd6WGNIREJRbFhPSjJ0N0xwMW04QzdqaUR4?=
 =?utf-8?B?QTRsR2tvaVN3STJTVi9zbXNnOFd2VlNhZlQ3WW9DTzNiVzV6VTVpdkZ5M0VK?=
 =?utf-8?B?YlNNWFZERExSTnhkUi9tTDJvTDc4R08wMUM3S25wOGxBbldEcVR6eGpmL3g1?=
 =?utf-8?B?aTNvczJsb2hObW9SVDRrVFBUV0ZMU0o5NGF0dVdUemk1NmU0M0pSOXNDOFE2?=
 =?utf-8?B?cEFxMDBQemt6K1NiRVNENDREd1FwcmhpWXQrK21QREt6czNXQlYzM21lZ0N2?=
 =?utf-8?B?M0RuMWFTVDU2MUU2ME9qYkZTclRvNFNQdlAxZWNZaWwxdXMvNElLeHNveG9s?=
 =?utf-8?B?UTJkdjd2bk1TTzJWOGdkdXlhY3RhdWx5OEl0bGNLQ2VrVmIzc3dId1pVM1Jx?=
 =?utf-8?B?TEdTUTU3dXJ5bmRvM3NaVjREOENhdGZsL051MlAvYXdnZGRpeWJ3OTVzZFph?=
 =?utf-8?B?MmFHd0FPSm5VaDFFQldpSWVRVUpNSU9sKzFkSlFVSEFqT0U3M21acDFRV3Vt?=
 =?utf-8?B?d0s4eEN5dVpMS1dDSUVnZERNVm1GSHFiaVJjQnBFZzVuYXBkcS9XclIrTE1n?=
 =?utf-8?B?ZkI1WUV3bTR0NXhVbjNIVVNHNVUzZlh3Y0RuN0hreVg5L3Ezcmc1U0o0UWZy?=
 =?utf-8?B?WHpHZmQ0Z2V5b1ZneldhMVlHM0tRa2dhK3pTa2hUdnowS1V1Wm0xQnU2TWZL?=
 =?utf-8?B?OUpsVU4xcDJ3TVF6S0oyY0FBNmQ2Zzl5U21Gc1ZQMlVxQ3FMZUl0aWluMTdB?=
 =?utf-8?B?OEgvS3g0VDF4TXNpMnhwR2VLVUFrQ1FwY3VxZnVJQ00rOVBRdkovVEFVeG0r?=
 =?utf-8?B?TzB6cjhuV3FCQzFyR0RieHhBZ3AvVmpoWnMvZ3dBNE5wR2xkbjMwVkg2UnVT?=
 =?utf-8?B?QUU3a0MrZ3A4eGZZcEFFelpJbE9ocHhVUXVXRWFjN2VJRUtFcHJ4aVRsb1pr?=
 =?utf-8?B?ckJ3WDhnNkU3MUJPeEFzTHRKa1Q3Ny8zZHJVbWlEaVQwc3d1WkJaczZ5dm5l?=
 =?utf-8?B?L2NqMUJLMWQydlJiUTZJU3JzVG5vZ2I3dVZGaGlBM2FpUEdBY2w5d216MzFB?=
 =?utf-8?B?VTBzZ1U4alMyczhQaGRLZmtyWE13eXZ0OTJmWEgvVjNGRUtXbkdBeFN4dWFx?=
 =?utf-8?B?Z25ERmpLa3NxTjVha0ZiN0ZmZzFXWUZOZU1RT2V6ZkVXaXk4bUNsL2xWNmZU?=
 =?utf-8?B?cFB2QjJaZWxKbm5JUkxqTGRuVnVUVFhrcE1aTFBPb3p4RzFOdlBQaGJ0YTZl?=
 =?utf-8?B?V2d0RC9iaThrSnkxQ0JWbmVuR3BaMlpZU3EvRGgvL2tTclJQdUVBNFk1ZHND?=
 =?utf-8?B?bzJ0cnZLOW1tYnQ2TG5NS0JMZTdMSFJRY3VRN3lwYmFzdFlseXB1aTFRYzRn?=
 =?utf-8?B?RjM1bTY1RWRQdWxHK1hGclYyUEE0NXlveTBwajZlN2RIT3hFZHlXdFoxMFZi?=
 =?utf-8?B?VnJpNkQwQW5Xd1hqZTlLZnhJTGhSSGpvTDZGSVVUU2E2VVpyczhkdDREUmd3?=
 =?utf-8?B?VFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <02819AA76E94D3408A5BD9640E0073DE@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4870.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d0eb36e-e84d-4bc2-e4a1-08db889d1d42
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2023 21:14:18.4980
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KOyyDcybJAmlul+FNs5vNelauUC6rXUkBOrLjUs4l1ZqiUaAoVf1UYn0MIcDANkURwaRYpmyxf6CwKpEcEglrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR04MB7279
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 21:14:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184615

U3VyZSEgDQoNCkN1cnJlbnRseSB0byBjcmVhdGUgYSBmZWVkLCB1c2VycyBidWlsZCB0aGUgcGFj
a2FnZXMgdGhleSB3YW50IGluIHRoZSBmZWVkDQphbmQgdGhlbiBiaXRiYWtlIHBhY2thZ2UtaW5k
ZXguIFRoYXQgd29ya2Zsb3cgdW5mb3J0dW5hdGVseSBoYXMgYSBudW1iZXIgb2YNCmxpbWl0YXRp
b25zLCB0aGUgbWFpbnMgb25lcyBiZWluZzoNCi0gVGhlIGluZGV4IGNyZWF0aW9uIG1ldGhvZHMg
T05MWSB3b3JrIG9uIHRoZSBwYWNrYWdlIGRlcGxveSBkaXJlY3RvcnkuIElmDQp0aGVyZSBhcmUg
cGFja2FnZXMgdGhhdCBhcmUgbm90IG1lYW50IHRvIGJlIGluIHRoZSBmZWVkIGluIHRoZSBkZXBs
b3kNCmRpcmVjdG9yeSwgdGhleSB3aWxsIGJlIGluY2x1ZGVkIGluIHRoZSBwYWNrYWdlIGluZGV4
LiBBZGRpdGlvbmFsbHksIG11bHRpcGxlDQpmZWVkcyBjYW5ub3QgYmUgYnVpbHQgaW4gb25lIGNv
bW1hbmQgZHVlIHRvIHRoaXMgbGltaXRhdGlvbi4NCi0gSWYgYSBwYWNrYWdlIGZlZWQgZGVwZW5k
cyBvbiBhbm90aGVyIHBhY2thZ2UgZmVlZCBiZWluZyBzaWRlLWJ5LXNpZGUgdG8gaXQNCih0aGF0
IGlzLCBpZiBwYWNrYWdlcyBpbiBGZWVkIEEgZGVwZW5kIG9uIHBhY2thZ2VzIGluIEZlZWQgQiBh
bmQgdXNlcnMgb2YgRmVlZCBCDQphcmUgcmVxdWlyZWQgdG8gdXNlIEZlZWQgQSkgYSB1c2VyIHdv
dWxkIGhhdmUgdG8gbWFudWFsbHkgcmVtb3ZlIGR1cGxpY2F0ZSBwYWNrYWdlcw0KZnJvbSB0aGUg
ZGVwbG95IGRpcmVjdG9yeSBiZWZvcmUgbWFraW5nIEZlZWQgQidzIGluZGV4Lg0KDQpUaGVzZSBj
aGFuZ2VzIGluc3RlYWQgY3JlYXRlIGEgcGFja2FnZWZlZWQgY2xhc3MgdGhhdCBjYW4gYmUgaW5o
ZXJpdGVkIGFuZCB3aWxsDQpjcmVhdGUgYSBmZWVkIGluIHRoZSB0bXAvZGVwbG95L2ZlZWRzLzxm
ZWVkbmFtZT4gZGlyZWN0b3J5LiBUaGlzIGFsbG93cyBjb250cm9sIG92ZXINCnRoZSBwYWNrYWdl
cyB0byBiZSBpbmNsdWRlZCBpbiB0aGUgZmVlZCwgYXMgdGhlIHBhY2thZ2VzIGFyZSBoYXJkbGlu
a2VkIG9yIGNvcGllZA0KZnJvbSB0aGUgZGVwbG95IGRpcmVjdG9yeSBzaW1pbGFyIHRvIGhvdyBm
ZWVkcyBhcmUgY29uc3RydWN0ZWQgZm9yIHJvb3RmcyBjcmVhdGlvbi4NCg0KSSBjb3VsZCBzZWUg
cmV1c2luZyB0aGUgbG9naWMgZnJvbSB0aGUgcGFja2FnZV9tYW5hZ2VyLCBidXQgaXQgd291bGQg
cmVxdWlyZQ0KY2hhbmdlcyB0byBhbGxvdyBpbmRpY2VzIHRvIGJlIGNyZWF0ZWQgZm9yIGFyYml0
cmFyeSBkaXJlY3RvcmllcyAoaW5zdGVhZCBvZiBiZWluZw0KaGFyZGNvZGVkIGJhc2VkIG9uIHBh
Y2thZ2UgdHlwZSksIGFuZCBhZGRpbmcgc29tZSBtZWNoYW5pc20gdG8gY3JlYXRlX3BhY2thZ2Vz
X2Rpcg0KaW4gdGhlIHBhY2thZ2VfbWFuYWdlci9fX2luaXRfXy5weSB0byBoYW5kbGUgZmVlZCBj
cmVhdGlvbiB0YXNrcy9mZWVkcyBiZWluZw0KZGVwZW5kZW50IG9uIG90aGVyIGZlZWRzLiANCg0K
QXJlIHRoZXJlIGxpbWl0YXRpb25zIG9uIGNoYW5naW5nIHRoZSBBUEkgb2YgdGhvc2UgY2xhc3Nl
cyBhbmQgbWV0aG9kcyB0byBhZGQNCmlucHV0cz8gQWx0ZXJuYXRpdmVseSwgSSBjb3VsZCBzcGxp
dCB0aGUgb3ZlcmxhcHBpbmcgY29kZSBpbnRvIGEgaGVscGVyIG1ldGhvZA0KaW5zdGVhZD8NCg0K
VGhhbmtzLA0KQ2hhcmxpZSBKb2huc3Rvbg0KDQoNCk9uIDcvMTkvMjMgMTU6NTksIEFsZXhhbmRl
ciBLYW5hdmluIHdyb3RlOg0KPiBTcGVjaWZpY2FsbHkgcGxlYXNlIHRha2UgYSBsb29rIGF0LA0K
PiAuL3JlY2lwZXMtY29yZS9tZXRhL3BhY2thZ2UtaW5kZXguYmINCj4gYW5kDQo+IGdlbmVyYXRl
X2luZGV4X2ZpbGVzKCkgaW4gbGliL29lL3BhY2thZ2VfbWFuYWdlci9fX2luaXRfXy5weQ0KPiAN
Cj4gSSB0aGluayB3ZSBzaG91bGQgcmF0aGVyIGV4dGVuZCB0aGVzZSBpbnN0ZWFkIG9mIGFkZGlu
ZyBvdmVybGFwcGluZw0KPiBjb2RlIHdoaWNoIHdvcmtzIGRpZmZlcmVudGx5Lg0KPiANCj4gQWxl
eA0KPiANCj4gT24gV2VkLCAxOSBKdWwgMjAyMyBhdCAyMjozOSwgQWxleGFuZGVyIEthbmF2aW4g
dmlhDQo+IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPGFsZXgua2FuYXZpbj1nbWFpbC5jb21AbGlz
dHMub3BlbmVtYmVkZGVkLm9yZz4NCj4gd3JvdGU6DQo+Pg0KPj4gWW91IG5lZWQgdG8gc3RhcnQg
YnkgZGVzY3JpYmluZyB0aGUgdXNlIGNhc2UuIFdoYXQgcHJvYmxlbSBkb2VzIHRoZQ0KPj4gY29k
ZSBzb2x2ZSB0aGF0IGV4aXN0aW5nIHBhY2thZ2VmZWVkIGNvZGUgZG9lcyBub3Q/IENhbiB3ZSBy
YXRoZXINCj4+IGV4dGVuZCB0aGUgYWxyZWFkeSBleGlzdGluZyBjb2RlLCBpdHMgdGVzdHMsIGFu
ZCBpdHMgZG9jdW1lbnRhdGlvbiwgdG8NCj4+IHN1cHBvcnQgdGhhdCB1c2UgY2FzZT8NCj4+DQo+
PiBBbGV4DQo+Pg0KPj4NCj4+IE9uIFdlZCwgMTkgSnVsIDIwMjMgYXQgMjI6MDMsIENoYXJsaWUg
Sm9obnN0b24gPGNoYXJsaWUuam9obnN0b25AbmkuY29tPiB3cm90ZToNCj4+Pg0KPj4+IEhlbGxv
LA0KPj4+DQo+Pj4gSSd2ZSBiZWVuIHdvcmtpbmcgb24gYSBwYWNrYWdlZmVlZC5iYmNsYXNzIHRv
IGFsbG93IHJlY2lwZXMgdGhhdCBkZWZpbmUgYSBmZWVkLiBJIGhhdmUgYSB3b3JraW5nIHByb3Rv
dHlwZSB3aGljaCBoYXMgYmVlbiB0ZXN0ZWQgYWdhaW5zdCBwb2t5IHVzaW5nIGFsbCAzIHBhY2th
Z2UgdHlwZXMuDQo+Pj4gVGhpcyBpcyBteSBmaXJzdCB0aW1lIHN1Ym1pdHRpbmcgdGhpcyB0eXBl
IG9mIGNoYW5nZSwgc28gSSdtIGxvb2tpbmcgZm9yIHNvbWUgZmVlZGJhY2sgdG8gY292ZXIgdGhl
IGdhcHMgaW4gbXkga25vd2xlZGdlLg0KPj4+IEFyZSB0aGVyZSB0ZXN0cyB0aGF0IG5lZWQgdG8g
YmUgYWRkZWQgZm9yIHRoaXMgdHlwZSBvZiBjaGFuZ2U/DQo+Pj4gU2hvdWxkIHRoaXMgdHlwZSBv
ZiByZWNpcGUgY2xhc3MgYmUgU1NUQVRFIGNhY2hlIGVuYWJsZWQ/DQo+Pj4gV2hhdCBkb2N1bWVu
dGF0aW9uIGNoYW5nZXMgYXJlIG5lY2Vzc2FyeSBmb3IgdGhpcyB0eXBlIG9mIGNoYW5nZT8NCj4+
Pg0KPj4+IFRoYW5rcywNCj4+PiBDaGFybGllIEpvaG5zdG9uDQo+Pj4gY2hhcmxpZS5qb2huc3Rv
bkBuaS5jb20NCj4+Pg0KPj4+DQo+Pj4NCj4+Pg0KPj4+DQo+Pg0KPj4gLT0tPS09LT0tPS09LT0t
PS09LT0tPS0NCj4+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlz
IGdyb3VwLg0KPj4gVmlldy9SZXBseSBPbmxpbmUgKCMxODQ2MTEpOiBodHRwczovL2xpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzE4NDYxMQ0KPj4gTXV0
ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTAwMjQzMDU0
LzE2ODY0ODkNCj4+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnDQo+PiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRk
ZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWIgW2FsZXgua2FuYXZpbkBnbWFpbC5jb21d
DQo+PiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPj4NCg0K


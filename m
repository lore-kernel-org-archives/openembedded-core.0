Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4749C7EE23
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 12:01:42 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.55])
 by mx.groups.io with SMTP id smtpd.web10.56945.1686571297840211582
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jun 2023 05:01:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=vu8buivj;
 spf=pass (domain: siemens.com, ip: 40.107.8.55, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nRua4qxpkBHG/VzyFuBbNt0D2zHfH6Ck8Z6pBLzCLuWwfsA888F5KBjMRndJHdLTcHK1HnvVipvvfRE8/iiLSzVGLwJGahaKpjZ5YMd40qz7gJsf7pTR5UkJK0bJw8hvkljuuuntvLbyubDuEsHN5IGwbtyx9lW1xxVH/1XxqUbPmJNZb78wrGejEUqvWural6aF1lbgCmFWpG59sFOJ+R/VXYvQqFTobmTRHQKow6WTeurwVThJ5eKELYiOm7wyBvmEmNVuW7hpEowbTIcIj+Z3KipEOK5bIrh8ezn10JuMhgriq9ysyNw23pGF0aN2YHJd6NmHgg4mChdHJWTwJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLxpko7PJDU0mEu9f1Kn7yTS0sdyusLVgqLovNcUf4Y=;
 b=NEyr2GcCUk9vOYHRweht4HI8PAoU+WuhJ5I8SLSpxO8oP6AvjWnegx6q1eCTZ4a7qUKyJZSiUrfU7wUzmJm84E7Ku7lV0SENuqM3J8TqaS9nnSKUFybLiCmlY1QLpSWA11P6PFdhOwUcgIY0B3M7DnFni6jnVQmP8P8PS71gP/PKFbiFQ9cAPReAutByJ/ma+KOVSVPHEZan9IRigmjl8hPx3344hv8Fsh7vXCjCLlLjZsPB6U2yLwKisS0Lxn9hU6Ul7tViYyIDYqNvdVyeRt3p/Viuh2j86zb7gnhGUCI2F+A27KWr326LbRM0jevEZhsbquTdc139KFys3LeScQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLxpko7PJDU0mEu9f1Kn7yTS0sdyusLVgqLovNcUf4Y=;
 b=vu8buivjcQEyIgZdWF6vU1la7JmA95aLOdj8hxPACJbDwkOD9mFvLUucglp8T9FjSdAEdZlTwRYTjGLbvUsl+bi++sgNGt9DrYJS0FFBKWCMYw6XQrnjOqS+cTLjB/bC/a0q8LDCaCte5GWHc9dmxOT6iYMFCuH49P4NV29L2v6c85appVJHMCVgKk/iHTt3coOkqmOAf9kul5X9n8pz8iyPIcmtBfstdL6Sit2IcndDR4vvgMMQeXGt6Dij+CkmSAI+U4qo0qTsZqkO3/sjXwSQ6PIvkbUiNn0qQ7Gf+oB3cvGTvJHkGCuXsd88CSvOAv0AWwduNwxS4OtpA68+1w==
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DU0PR10MB6533.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:406::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.44; Mon, 12 Jun
 2023 12:01:35 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6efd:61a4:f180:349a]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6efd:61a4:f180:349a%6]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 12:01:34 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][dunfell][PATCH 2/2] curl: whitelists CVE-2022-42915,
 CVE-2022-42916 and CVE-2022-43551
Thread-Topic: [OE-core][dunfell][PATCH 2/2] curl: whitelists CVE-2022-42915,
 CVE-2022-42916 and CVE-2022-43551
Thread-Index: AQHZnSUksqlOEKR2MU2opW1jfpxSJq+HEPkA
Date: Mon, 12 Jun 2023 12:01:34 +0000
Message-ID: <6bcfc819a21fa5090f3a4148ab5679bc364a1d7c.camel@siemens.com>
References: <20230519081850.82586-1-andrej.valek@siemens.com>
	 <20230612115743.52686-3-andrej.valek@siemens.com>
In-Reply-To: <20230612115743.52686-3-andrej.valek@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3977:EE_|DU0PR10MB6533:EE_
x-ms-office365-filtering-correlation-id: 41588b8c-df77-4910-eb90-08db6b3cc4f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 RTTtNAruLzKsxz5baiQVm6NdwlIv2KUPATIhzN4oIWKw369GPWdjTJYZ6ZTBbI/vUb0dDVdU2BkIuEBbvaFEYjtR9nRnDhv6SAAo7VdSQwyQWBhP/XGdn4bqaaaj6K50Odtcqe8JS60mE1UIjcMSxYEQExl//wcA8DgegHf/vrVOH32e9uRKohcZ44X50dTEB6Y9w8grwGDz6Ja1VDHpj0QcWadAsPrrgz51wM1Y0bhabuC4wEOfqN64E6im3ZnVze1OcowQHWx8YIgCA/93YlCqfEXfksUazSkwx+bOqfnuxFpWp3xmqBg15Eef7UEHEbjHQll6vM8BzDiU8ve/B6Bcz9Zh8MqRHyJPWucUbrgIidYzgMaJo87czpgX6KIbeq3ppSaJ5WVhYy/5GfqiCsTy6WafBYHN9ye9j0MjeZEfs1Kv77ySnQ3i9bUK9FKePTIlXJrrAOKos95HJr1xBwEuoa7wGXuAndD+f4VRakYMvSa7pmsEooYWMqLvUd0fZ9nUD68HauvMs/woGslQye3GY7KRX36/Ucn7Q8bcPH04w3x9rbtlGPHk+ySLyBNHNEIcPt4aRQ82d0ueWCc772c7KGZRjV/n/nh1nSJXPsgJTCaY6STzfFffosW5lHsF
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(451199021)(82960400001)(122000001)(36756003)(38070700005)(41300700001)(38100700002)(316002)(6486002)(26005)(71200400001)(6506007)(6512007)(64756008)(6916009)(66946007)(66446008)(66556008)(76116006)(91956017)(2906002)(5660300002)(86362001)(8936002)(8676002)(66476007)(478600001)(2616005)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Qi94eVJZWGJ6dWQvVHVaVTJtK0E1U3RBTkZIL2JVQStLcTBmOWtVSVVHUGpO?=
 =?utf-8?B?MU95TnZqMUQwY0p2WVo4cmlJNll6UWVDaGx0WThBTDZMaXVxSytIQXU4TGdC?=
 =?utf-8?B?VmRCV1k4SG54eHFtc2ZUOTdUNUlWWFk4SzFBN1BrcmVMYlRtWTgrSE5wbWRw?=
 =?utf-8?B?enFVRWVYeEhBalJxY2VKOWVuTXk3Z08zYXhQaW9PUmpJTjEzUGpUUkhwUFFi?=
 =?utf-8?B?a1ZKc1c5dTNSdVFBTFM3MEtIL0FQREE0TkVUdGQ2L1I4Q3ZiaHYxalFVSXVL?=
 =?utf-8?B?Umg0c1J5S2IyTVdHdXJ0MHo1aGwyOU0wYXFmOWFyTWs5dmh6UXpNSThpTlhL?=
 =?utf-8?B?a0MwREx6cnYxSkdCOW5mYVFLSU1JT2EwNXNHU2t3eG5maGNqYkFjYWRKYWs1?=
 =?utf-8?B?WlQwNGVRaDRGMlJOSTE0UzB4bmJBYklHaUlvZkpUZTZPVlIvZVpnMFRYN1dx?=
 =?utf-8?B?azkyWVpjZFpselIreVA0ek10ZFE5b2dCMUhzN3VidFhQUGZTS1RLVU5MZkVN?=
 =?utf-8?B?VkdLempPeTl3b0VEdVNVeFpGOVRjMUFVc0NJRCtGL2tQNkJvK0xBMWtVV0F2?=
 =?utf-8?B?Nm51WmtNcWlHNnFXVWFnT1NUVlJDZUZPbDRDZ2NzQ0VQbTUxbzlkWG9BN3BR?=
 =?utf-8?B?RTVDdkowQzVQSm54a2dQdTQ2eHdubGpINi9tbU5yeGJleHlqZjQvSTJUQzNP?=
 =?utf-8?B?ZWRkZWdDci9pYW9CWWdhUlNLYWtmYVB6QTFaU2ZzS05nOC9MN3lwMThMdlZo?=
 =?utf-8?B?UkpaZDlTYlU1WDNFMWhyS1p6N3d4eVVBMXYyVFF6YWt1Q05wMjVkdmRWa3VP?=
 =?utf-8?B?d2JwMThVTlRBR2JFd0lISUZEZFJ3S0RBMCtmOEs4NDhScExyNEJxdTJPeVor?=
 =?utf-8?B?V0RUbHV5SDRuSkI0VEM2ZE5uSTRQL2YxMXJhMDd0eVZtYzh0eVlrZkQ5dWdJ?=
 =?utf-8?B?VndIbkV5WE01K1RPZHBmcmtCbEVwOGsvR0Zka2N4Wmo4VkhZVmhRZVRUNllt?=
 =?utf-8?B?S24zMSt6UHl6QkNSaDYvRDRXWlFhaDBTYWVKaVU1U0Raci9qbGZjS3dBUlQz?=
 =?utf-8?B?MnBPcXdXK21yM2wwNVFVMjNBeWxQc21GejU1WkVJOEFTNXV4SUluVDR0Sm1x?=
 =?utf-8?B?Y3Zua2VrdXNqeGx0OHh0ZFlRbGducDlXTEUySEdkaGxwVjZiMEJCTDFDRlBm?=
 =?utf-8?B?cE54UW9IbGk3YjZmQ3lPZEV6ZFhnNFdRb2RtNXQ4YUkrVnVPOThkbXpyU0kw?=
 =?utf-8?B?WjdQd3g1SGErMlNzeFd6V2lrUS9BSlVxcmJkNm9KMnhOcHFVOUtKQ3VGSFZL?=
 =?utf-8?B?VGJWWHFkandLT2tNdTdtT1MyT3dvTGpXb3llVHFzNGtGYzB2NHpTNEZ6ai9r?=
 =?utf-8?B?SXFvdWxZSXBzR1F0Rkw2OXVtcXhqMUtRSTcwdXlWVWpDM0MvUWg0VlBmY3pI?=
 =?utf-8?B?ZEh2VFo4R0ZQU0VnS1BQcWptYlhLaXMvdWhCaHYybEE3VU1Fa2RqdkJQZjI3?=
 =?utf-8?B?em9VZFIvZ2pjMGFCMGJDeFZmNC9zTElZZVZSZWdBWEw4dmVIMkJ3aTdHYkZ6?=
 =?utf-8?B?WjlRRXZwU3NpbmNDazBoTUVyZVN6ZzF1VG90RlVRanROT2FhOSs0TjlrVHJ3?=
 =?utf-8?B?c2hOTWV5SEVvdmlKVTZQeUNMejBOb1c3aVIwcE12QUhwRUg3MW5Bb3A5SE9x?=
 =?utf-8?B?NGYxTG9JQXNQRTZZRnl0Skt4T09uaG1aeWswTDRpVnNtY0t6M0hQS1V2bG52?=
 =?utf-8?B?NUk0blpUc1QxMDVBcnUxZnpoMkNiYlA1eTlTdjM2NjFjUlZ1eFlRcTlTQko0?=
 =?utf-8?B?QTJRdTZSRHp3R0lkdk9kazRVdm85QjhPOFBqTUtQaWV2WXJuU0ZRNEI2WWdz?=
 =?utf-8?B?Z29iWXhwSDI4NEVGZ1gwY0ZXTDg1ZEd6T3FtRUtENnorWk41UlJhRzh5L2Fp?=
 =?utf-8?B?bGQ3ZStDbk1aSHM4djlFK1NUOFpVdm9yMnZYRHBuUDlEYTkzNEQ0NnhpYU4y?=
 =?utf-8?B?TytjVlI0aVlUVkNRNmpHcUREenBzRUpMbGpRSC8rdWVpeURCd0dPdGFqQkQ5?=
 =?utf-8?B?aFlCUE82R2pHVEJqQXdlaDc5d1A0Y3hMSnZRU0JYbitQU2xXVUlQb3JTdnhI?=
 =?utf-8?B?NXoxTUh6NEVvTDVjcVNtWXkrZFZPMWx1dGtVSEwvWWluN1MvRGZLcDFUUWhn?=
 =?utf-8?B?TWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <009F9D9BF293BC44839DF78AA8436001@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 41588b8c-df77-4910-eb90-08db6b3cc4f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2023 12:01:34.9035
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gLI7qSUYGUutqcIMoKy/V6ZI449FrMOXErWfN//eDHxuuxyVXwkdPu9/yd7QFcrN3J1sLmqbaVpjfAy5C0OhgpnyJNm0EnnRXdK+MtUFw7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6533
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 12:01:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182668

VGhpcyB3YXMgc2VudCBieSBtaXNzdGF0ZSwgaWdub3JlIGl0IHBsZWFzZS4NCg0KQW5kcmVqDQoN
Ck9uIE1vbiwgMjAyMy0wNi0xMiBhdCAxMzo1NyArMDIwMCwgQW5kcmVqIFZhbGVrIHdyb3RlOg0K
PiBBbGwgbWVudGlvbmVkIENWRXMgYXJlIHJlbGF0ZWQgdG8gSFNUUyBjaGVjayBmZWF0dXJlLCB3
aGljaCBpcyBub3QNCj4gaW1wbGVtZW50ZWQgaW4gdmVyc2lvbiA3LjY5LjEgLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogQW5kcmVqIFZhbGVrIDxhbmRyZWoudmFsZWtAc2llbWVucy5jb20+DQo+IC0t
LQ0KPiDCoG1ldGEvcmVjaXBlcy1zdXBwb3J0L2N1cmwvY3VybF83LjY5LjEuYmIgfCAzICsrKw0K
PiDCoDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1cmxfNy42OS4xLmJiIGIvbWV0YS9yZWNpcGVzLQ0K
PiBzdXBwb3J0L2N1cmwvY3VybF83LjY5LjEuYmINCj4gaW5kZXggODk5ZGFmOGVhYy4uZWEzNmMw
YmQzZCAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvY3VybC9jdXJsXzcuNjku
MS5iYg0KPiArKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9jdXJsL2N1cmxfNy42OS4xLmJiDQo+
IEBAIC01Niw2ICs1Niw5IEBAIENWRV9DSEVDS19XSElURUxJU1QgPSAiQ1ZFLTIwMjEtMjI5MjIg
Q1ZFLTIwMjEtMjI5MjMgQ1ZFLQ0KPiAyMDIxLTIyOTI2IENWRS0yMDIxLTIyOQ0KPiDCoCMgVGhp
cyBDVkUgaXNzdWUgYWZmZWN0cyBXaW5kb3dzIG9ubHkgSGVuY2Ugd2hpdGVsaXN0aW5nIHRoaXMg
Q1ZFDQo+IMKgQ1ZFX0NIRUNLX1dISVRFTElTVCArPSAiQ1ZFLTIwMjEtMjI4OTciDQo+IMKgDQo+
ICsjIEhTVFMgY2hlY2sgZmVhdHVyZSBpcyBub3QgaW1wbGVtZW50ZWQNCj4gK0NWRV9DSEVDS19X
SElURUxJU1QgKz0gIkNWRS0yMDIyLTQyOTE1IENWRS0yMDIyLTQyOTE2IENWRS0yMDIyLTQzNTUx
Ig0KPiArDQo+IMKgaW5oZXJpdCBhdXRvdG9vbHMgcGtnY29uZmlnIGJpbmNvbmZpZyBtdWx0aWxp
Yl9oZWFkZXINCj4gwqANCj4gwqBQQUNLQUdFQ09ORklHID8/PSAiJHtAYmIudXRpbHMuZmlsdGVy
KCdESVNUUk9fRkVBVFVSRVMnLCAnaXB2NicsIGQpfSBnbnV0bHMNCj4gbGliaWRuIHByb3h5IHRo
cmVhZGVkLXJlc29sdmVyIHZlcmJvc2UgemxpYiINCg0K


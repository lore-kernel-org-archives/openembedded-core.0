Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32198C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 13:27:22 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.44])
 by mx.groups.io with SMTP id smtpd.web10.42857.1669901237096677687
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 05:27:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Vwtqsc3j;
 spf=pass (domain: arm.com, ip: 40.107.22.44, mailfrom: ross.burton@arm.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SvfaVbgOLD5l0LAP5hMTtJulaAGmHDTqU7I++5Sv8583FGlnFFCPEPLxzp6VmtfRSMNL5qixPeRE4NM8UX96aa7maLrb/SRNUuLTz4rSNro7bvg8VNB0Ub+O00d1K1AbJEmiLArfKIFUBIWo55Tp0d0XJ+I1Jgg0tt2ECr0glYwMnuaSVlIowEDlzB025cdi+QrXKGMvIglEd6pdxaSiQdIlCM910XXlyrVTOWla4ryzvbhu7vuWVJq1ChJgqAd+HAeH6AMe5ml/6vqMSLo6wwvaijKm/kGkN8Nzmgtk7Uad7+mlO6lwaVSJTaAuA+Zuc2UGQ0FZCnQyWAsL6NZfOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ya9HxhA16S7K+lv0/Ize1RY8lMotdA77+x5US3iW8Ro=;
 b=L6ZTj2puwV/w+AQWmiJ8dPentqQzTXhDDhfLjzGJ0NsknwxBEVy/CRXwo9LWwkKioyKwKZqrm5B0X0VAz+zFZ6wc9iUHsm505A5W7HVDGcHZI4b0EdvQKAOIQNVImhoUCjEqkK3kKGNqrBRnLuT4/bdDmCARHuCJi7q7IAR89Wn0Gnaq1pHUVlsIX0a7v1cqmyAr05B4H1TirsGKkQOxkfxkcpIKgN+SnDjnQl2t+tKwe3+Gwon9N9YkCjHfy96etbqXq/da/WLa97GcqqoGf5xYdPWY5+L6d+yNsX7uwTicxbZetDTHWr7JbfF1yPvscrKi72I/rDePxHCJ0GGgXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ya9HxhA16S7K+lv0/Ize1RY8lMotdA77+x5US3iW8Ro=;
 b=Vwtqsc3jcJ8OredzeodxdyVyxo1h2hg0QX9TcODOz6CpSSR0y3im08mShQzdK04NeJwpUHAItsGHuTkeJMqzxjk87FTnckUFp+qeaLu6GdKoxNuqg+Yvn39oh4XlfN7WHOWD9BKGgeRQtQEsCWK0pfv65fgtNfe8ZYkdTrer8Bc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB6494.eurprd08.prod.outlook.com (2603:10a6:102:154::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Thu, 1 Dec
 2022 13:27:14 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119%9]) with mapi id 15.20.5880.008; Thu, 1 Dec 2022
 13:27:13 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "pyih.soft@gmail.com" <pyih.soft@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] classes: make TOOLCHAIN more permissive for
 kernel
Thread-Topic: [OE-core] [PATCH] classes: make TOOLCHAIN more permissive for
 kernel
Thread-Index: AQHZBNg4VymjSPtyL0K4z+VVAFCF765Y5X+AgAANwACAABRHgA==
Date: Thu, 1 Dec 2022 13:27:13 +0000
Message-ID: <7EBEF3C3-A9F1-475E-A90E-DA21E6E5895C@arm.com>
References: <20221130162113.3731385-1-pyih.soft@gmail.com>
 <C5C61A1A-4E14-4D7F-97BA-B12C3FB15417@arm.com> <Y4iaqGB8RkrBQYsX@mail.local>
In-Reply-To: <Y4iaqGB8RkrBQYsX@mail.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR08MB7411:EE_|PAXPR08MB6494:EE_
x-ms-office365-filtering-correlation-id: bd4fd6f2-cb9b-485a-6710-08dad39fc233
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 x1km/piey9QAeG9TH3BRucdlGdYjvHxp5QbutbszG3BhUsqYYvy51fXRqCMKlHaSLoeK0rOMY4+y8akZczpHvL+9OeyI26v/4nOqpzDv4qAMTSPv5OZHsI2nnnZRi4YB1tSQ4T3iuXgfuzTM5Kco5wVkmGVR6sj4jst/XC/oTFIR1Lzpp0ndLE41Ms5G5Yg79jc2mhH9uFntiSyyQApzkkxSNONduXWnfmto4yJ1+Wt4dPPLDEfRuzQWxHXUi1VjJnYPp6Gxv/Q7s/p3b38r3XTxIZWJUMQnU1gqXzFdfIA2nfb8krIytD+R6aXj3lqB3oB0f6Xdm6Ssn1OSckzFLB+K8Xbfk2T4KkfqyTAsPqj5Rto+FLcUTNVeMSr+YBjWZ/vma+D+WNcRWy/NXwWgNEmRcff73HyCNQBK8FkneXFrD4KsgFRqncWxkrxXwbu6BObRyFMNlJQi5Xk+Si7+A4aoAAROtOzvJubHSG253ulHh5CfogMt/1jWjcbDWqh+VmCayZXo940/hlSTI6zN/v33B6h5x9ip9zayG03woTmKvV7rROtRfiap/Ti83GwHGZTm3bkl2SKAoxTkBWxv4zY5vd60sUU0YKshLYaKTj/52s9zVbLih5HLq7KMRO8rnEz1OU8oy6E/CQc56JvLmgg8Q9gpDSpBWmBm1nA50T7yA+5RjuyTGtlK0eSuAXIN9fh0ed7o4q6AkCGf/hbptiHgFP3lSnr0Xrg4OLmZTJE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(451199015)(8936002)(76116006)(36756003)(6512007)(33656002)(91956017)(186003)(26005)(4326008)(71200400001)(5660300002)(66476007)(66446008)(66946007)(64756008)(8676002)(316002)(38100700002)(38070700005)(122000001)(2616005)(66556008)(6506007)(6486002)(478600001)(6916009)(53546011)(54906003)(41300700001)(86362001)(2906002)(4744005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZjJnYUlFSFlSNzBMSUVIZTFLcnJkVmoyTFE4bVpEQ0F1ZjF3bjVyNzUvUUpa?=
 =?utf-8?B?amxUZlBKQ0h5NVNmUjVaOTBicEFGQXY0b09ORzlZNHRaUXVOc09Pc2dOYis1?=
 =?utf-8?B?TUFNT09RT2hsRC9FOExqVTBXMzVFSlFGUmFHc3UzTHBjTTc5bGdFclhyTmpP?=
 =?utf-8?B?YkJGS1ZMdUs2OE9EUytWWGNwSWt1RzRIckJmd3RINk41Nll4N01CMjBmcHNN?=
 =?utf-8?B?RlFKbWJ5OHpHYjFUVFRyQVEyY1ozS3BvUHdFdFo5b3ZrYVdtcXh1V3ZSdVln?=
 =?utf-8?B?alc2Y2djOU91ZSt3L3paeVJ0cVRnRTJDWGxjdmFoamhvSTJ3eVkvcm9NaVlj?=
 =?utf-8?B?bTVCSElkaDhnSTZFMjhtbmFkUFVnNmVIczBaYkZaaFpsMmxpdWVlWVpma0Q5?=
 =?utf-8?B?aHdGYnpJNlpHUmlzbGZTR0tvUDZQb0hqLzF3aEE2czlOSVo5ejAxczRNZGFB?=
 =?utf-8?B?NFpSWjN5QWJweWhkSElXWS9xUG9vTUg0YlZibGtBOW9yeGNrcUpsVnViSzA0?=
 =?utf-8?B?L2hLOW1FQ21Ya0h1cWpyTlZYTXJzdlJmenJQdzBUUGJPTTN6VDBNR3ArNzVv?=
 =?utf-8?B?OUdFd041WURSdlRqTFVzMWhkUlE5MGJ4eW40VEoxNTlEeGhUVUFHUVhJSFk1?=
 =?utf-8?B?WDhOWlVxdlVSeGlYQ2VrSVBTc0RkSUtsMEx5NmY2aUxmc2srUHJJYXhrY0F6?=
 =?utf-8?B?b0t5UW1qaUd2WE44dXVMc0QxNU1OU2xZdXlsY1hOS2krRXpKaHNNTWJxVlR6?=
 =?utf-8?B?aGdIdURGaDkrdC9PL1llNTl3bURJeXEvWHNWQ3BoV2hRL2oyWG5vbmNpbkJP?=
 =?utf-8?B?cDVvWi9yQllRbkZoelF1dE8vS2ZNbzh5TEZRb0NESW5VcDJVdnRCQ1ZOOUY2?=
 =?utf-8?B?Nk13Z1d0MUg1blRkNlh0OG14djhqRTZLSnlIQjhZSUZ3NzJGOFFOSU9rTkE4?=
 =?utf-8?B?bnhlTGhxVklDNTBzL3VpSmI3REk5SHBpRTFSbDNxMTcrV1ZMUFcxcUoySlMr?=
 =?utf-8?B?a2ZOWmxzU01XSUN3Tm5GTVJQR2tHcFZrc21pQ1dtaFlxYXA5TDBSNStlK09v?=
 =?utf-8?B?NHVhbFlEeXdMandVZFkwaGVrT29yVTBlRTZtN1NsNGZoRmVmYUZxSyt6MTk4?=
 =?utf-8?B?WUk2TjdxMWdGeWYvMEI1ZDZQbC83ZGhnODFJN1c5SHZvOHBvaVZ0MWJuK21K?=
 =?utf-8?B?bEhpOWVaU3VDM25QRUZwejFUVWJQdmU3Umd4VUVuamhYZ0RJdVlEcXpmNDRj?=
 =?utf-8?B?NGpOUmZEVzJVMXVFdU1DMURSSlZpbmNMcFgreVkxQlhRMHNTQXkrSjJDcXgr?=
 =?utf-8?B?R05ySmthMXRWRVVpUEVqQkRIcTdFWEFqYnY2KzBJQjFUTEluRzdBRGdOU0Nq?=
 =?utf-8?B?QnM0bk1UWDBwMVVLWWw3emtqNjIrTVQydHdPQlhKVTJ0SzVVOEthN0JHanRW?=
 =?utf-8?B?RFRhSFkyWlg0R2RIKzEyRnhWTHJxS3ZrTi93dURJUWhVeFVSZ0YvZlErNXp3?=
 =?utf-8?B?RkhDS0ZKTml3R2tqM3U4MGpLOWx5WThqMmMreTd1a2RJNkt5L3hZUlk0cXRo?=
 =?utf-8?B?YTdMejJkbDBheW04bUVLLzNDcUROYkJMUGhaMjdzRm9tK054R3MvQ3N5eXJs?=
 =?utf-8?B?c0RBOFBPUklWaVlyelphWDFORFl5dEoweDFxNksrdlY5bnFYM0hWbVA1REJS?=
 =?utf-8?B?NFVZTDJSV2Z3NDFhbHJRNE1uQ2pYV0VuWGRQakVONzVienI1c0V6WkxSNG1Z?=
 =?utf-8?B?VkpoSENjc0llYld3MUxsbEFTQzNuVXpxcWNobXo1Unh0QWJuZmFEVUdlQThr?=
 =?utf-8?B?bHhtbzhFRmpQRllVaW5PRXNMbTZzaWE2YTNjV0RpclhPQVJGUElKWVFoS2FL?=
 =?utf-8?B?UmZZcDdMZDkxRnpzOG1XTjR0NUxZaEJ4azhVeURCbDEvaGY0T3ZoMFRVSEdv?=
 =?utf-8?B?ZFFYZzUyZ210ZFRsR29hY0dnaFZ5RmdIclJrTS9wQkRidmc3RXlxY3JEcStG?=
 =?utf-8?B?bXZRN2oyR1FWZ011UUl1WDZyTUVvV0Z1VG81cVpuUWdCTndOYzYvWXMzNzlT?=
 =?utf-8?B?QkhjdUplZUxkQXR5aVFGQkRhZ1U5RTkxcExVdlQrWElieE1tTEs4Y3F4NUdJ?=
 =?utf-8?Q?uh9DQTzleXev5u/DV8OAoKz11?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <98F0F28E3C6957469F88E2082504B00B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd4fd6f2-cb9b-485a-6710-08dad39fc233
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2022 13:27:13.7599
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zKt+shYdF3B7zQwAHGqdKbVSNEtYFKI6/VRba6cq0yM3VIUCx2nqA5HWHSit5RLDqvhrEK+JohgtB1UOqW2h6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6494
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 13:27:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174059

DQoNCj4gT24gMSBEZWMgMjAyMiwgYXQgMTI6MTQsIEFsZXhhbmRyZSBCZWxsb25pIDxhbGV4YW5k
cmUuYmVsbG9uaUBib290bGluLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiAwMS8xMi8yMDIyIDExOjI1
OjI5KzAwMDAsIFJvc3MgQnVydG9uIHdyb3RlOg0KPj4gT24gMzAgTm92IDIwMjIsIGF0IDE2OjIx
LCBBbGV4ZXkgU21pcm5vdiB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8cHlpaC5zb2Z0PWdt
YWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4+PiAtVE9PTENIQUlOID0g
ImdjYyINCj4+PiArVE9PTENIQUlOID89IOKAnGdjYyINCj4+IA0KPj4gSWYgdGhlIGtlcm5lbCBp
cyBidWlsZGFibGUgd2l0aCBjbGFuZyB0aGVuIHRoZSBUT09MQ0hBSU4gc3RhdGVtZW50IHNob3Vs
ZCBqdXN0IGJlIHJlbW92ZWQuDQo+PiANCj4gDQo+IEl0IGlzIGJ1aWxkYWJsZSBidXQgdGhlIGdl
bmVyYXRlZCBiaW5hcnkgaXMgbm90IG5lY2Vzc2FyaWx5IGJvb3RhYmxlLA0KPiBkZXBlbmRpbmcg
b24gdGhlIGFyY2hpdGVjdHVyZQ0KDQpTbyBtYXliZSB0aGUga2VybmVsIGNsYXNzIHNob3VsZCBq
dXN0IHNldCBUT09MQ0hBSU4gZm9yIHRob3NlIGFyY2hpdGVjdHVyZXMgd2hlcmUgaXQgaXMga25v
d24gdG8gbm90IHdvcmssIGxlYXZpbmcgaXQgdW5zZXQgKGFuZCB0aHVzIG92ZXJyaWRhYmxlIHdp
dGggYSBnbG9iYWwgYXNzaWdubWVudCkgZm9yIGV2ZXJ5dGhpbmcgZWxzZT8NCg0KUm9zcw==


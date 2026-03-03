Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD74BEB362F
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 10:23:27 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15207.1772533402251346471
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 02:23:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=qMzcwKe7;
 spf=pass (domain: est.tech, ip: 52.101.70.4, mailfrom: david.partain@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v00ihBibu6K8uSNbiAzncyzHNmq3h4xBQwYlC0SJgh7v7/EjwPkeEHFetp8Mm65/ZWFNQPsKKPYolq/MK+eLvOwiu2krE4R95LPcu66iXfORqxivPd5r4fZVaJ2Vk/At+0Mqdh51+2QVLIHSswmVtdfvzLbLg8QZ4PQeyry+jXZpnQtt6p/NfSbvK31EThbT+/YTOgXSJ3qLXytw+qSkT57dxNxGByBysxDWqiYbQYaVVePeZMRxSNwRPhj9Mai8c9/KuF3ZDE9/WrBA08NHCiiGsJXWnOZNJ/9Aa9NozyvB2E1hD7MH3B/9lR/ScR0Czk2hiTVyuullrIlkhqv3ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HolqVopcXuBwZJUU8OaeMwk48/fmkB+RfSuvNt4H8ac=;
 b=gcYW1C/GURfJHuOBAWjx5YXPur/nAvihS5qgIqGk8q1PUSi8vZvfPgXv0vP9+iXe+wPE5X8bysAsmhD15Hf/3v4rVF5fhDU+EHZO9Aj8QtjW4fpw7Km9QCyHtKqtmQEaF0us1kinxCJGxT64L8HycHEGOC/C+FgArYy8yJ92LHANDmvYfsCdhf3IeSHwVkDdfMBh5os4sq3btXMCVZnCcQWABAOJnSDlxjF4ukEx8TR/suODHY5fuHhaAGBFVwCAZ0AE9RWayVPdlx6/2hYXXO6pigGAKVIo0BzvlxB//qfXYbJp68iFRw+VsAOnJ0UPwZKtml8/f43Lkr2Vz8dU7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HolqVopcXuBwZJUU8OaeMwk48/fmkB+RfSuvNt4H8ac=;
 b=qMzcwKe7wCvUu/g2zvzM72lXdjL+ym5tHmLxhROcJnx1mKdKVKo5CTH6puKfE6Egd2Kp4XkRMKKAJHjwVbia4PoBhEnVk9TFu8dXxRL7TyLabO8N4VKQjnp1FMQlZPukwFHGSQo8osN0JhIPuHYce1OJD18asX0Eecjja5FUiF51u7/NQv8YLvNW7WhTXko4DTQeFDzTND1VdK7n8NZ6E/rzIN3Fxv+naWsJ1qhTvOpRfWkb1cjlo6N+viuWBEp0/LTqft/u4U4eHMYv5hKFPJLwU1b4HldA6v8QPAy3fRqfbqCfMSz6gBY8OJU7zf+g9b6Ac37IYWxtxRSSBoaCFQ==
Received: from DU7PPFA0322DFE4.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ae1)
 by PA1P189MB3556.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:504::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Tue, 3 Mar
 2026 10:23:18 +0000
Received: from DU7PPFA0322DFE4.EURP189.PROD.OUTLOOK.COM
 ([fe80::269c:a66b:1e6:32e3]) by DU7PPFA0322DFE4.EURP189.PROD.OUTLOOK.COM
 ([fe80::269c:a66b:1e6:32e3%8]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 10:23:18 +0000
From: David Partain <david.partain@est.tech>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "peter.marko@siemens.com"
	<peter.marko@siemens.com>, "yoann.congal@smile.fr" <yoann.congal@smile.fr>
Subject: Re: [OE-core][PATCH] vim: upgrade 9.1.2144 -> 9.2.0
Thread-Topic: [OE-core][PATCH] vim: upgrade 9.1.2144 -> 9.2.0
Thread-Index: AQHcpap8iOaO6th6zE2X5YVZJtlBgrWSCk1AgAqZ3oA=
Date: Tue, 3 Mar 2026 10:23:18 +0000
Message-ID: <17678281463335733ecacbfc29bedd53164414d2.camel@est.tech>
References: <18973B8A1D1BE087.558139@lists.openembedded.org>
	 <AS1PR10MB56978C6748852F61C4F7109BFD74A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB56978C6748852F61C4F7109BFD74A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-SE, sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU7PPFA0322DFE4:EE_|PA1P189MB3556:EE_
x-ms-office365-filtering-correlation-id: 3f3a2987-3306-4685-6e2f-08de790ee339
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: 
 aYWrYzozKPyc1vuMIgSIVk++OnKjuPh4sQqvSM6TIDWW34+5s6XROuOznczenYOaUTYr0IiQvT6HyhSZkZvg0UT8pguPXMRwsX/A7S45zNrppiq6w6boMlset3MjI4sKZX3+wdtJuYXz6MpDF4/tcdx9bWt/YY9bS599EOu3arAN/xH8UKp19Dr5r4Rv2QaBq1Fppm0axA0hZTtWgGpS5oMhn5/CRHa+xkuzQ3NCF+t3MXAhtvLaPuCP2pY68TbaPGB+LF7qnbtqOCeH93DVjudSNqwqn4MMYj8FzC205iGh8nvdxcE9rN7gi5MJdOvrzf6JY5QNnu1SEj36S7JORxuEY2lttxg+yiFOzexPFfdIf4ZpPom+TO4J9Z0+ucMRxCOk45rfioPUQ0p502csM0n2aZFMUZwRcV5fAlmLnvMg9gluU8YGae0X7aQ6Ve2C+RQomk5SGowNhOBYcukewZBjQmiDjc4kMHdvDTYrbtGWbyKJSt7L/ludsUpVlFXKkeQndwgQq5odxQ/2Ag5DncCuuD5NuORCvHr+GTf1rUeyTsAPePRczZzFc0EBKXi1MwZXmBgOe7rFWIlvh0PpXpKgQSdX8LOGk6J2y7Tl1IMWp/Wyy5cfhNV1bnOQtsfRRceQkZ8F7TNO5CRqecP/0F+Yz3flZywCJGiv8t4vxC3D9bbsJGli/AU/Ax5gmv6F1scSsLy+7/AVFyW6LvxwzGHNxFHtEG0IDnT4HRIfTdPha0vQDMugQoekX1qqzhPazvJNiRNf9sfLYQX2RY7LSEaqSHFIojoJ1NfUhesfKqw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPFA0322DFE4.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?M2tzZTByd2ZESFY5M1g1VzZYZTI5YXJQY2ZhMExFZ0ZmS0MvMWQ2Y0pmRDA4?=
 =?utf-8?B?cnBvQVhvODlMT0tzbVlkTi9kZXFONTE2Nk54endPM3VYVWxSRDFlc2JCM1pJ?=
 =?utf-8?B?ZWJObmR0WHFhMVJvcVZaWTkvVTB1bFI4R2doVEkzVDhYVVM4ZDZhZlF0YVZj?=
 =?utf-8?B?alNJNWhBbXNSTUdZQnVYYXJMRWNoQ0NRRFlLRklxZTZFbHZCR1RYSWFrVUw4?=
 =?utf-8?B?eGNEdEN1VG9XYU1hYXNBcm5xNFVpVDBxM3RDVWdMaXI5NWdad0U1SXJPYndD?=
 =?utf-8?B?ZUJRWk01a0o3dVF6dkhzbnc4K1k3bGVHaXFNZVVDQ25vN1lLbWczYStzOG9T?=
 =?utf-8?B?SWdjQlB0Y1dNdk53SEo4a3FkbEhWZ0duaXpZNkhmMVFTN21vWElEbmJEMHZk?=
 =?utf-8?B?aWpCeWFlQUphZHlEcUViMkgwRG11Y0JPRkhoZk1QL1h2ZzI4OXVtT3FoSnF1?=
 =?utf-8?B?SDh6eXd6U1hmY285SEF0cDBHQXdjeHV3d05tTzcxcFdpL3E3dHZYNVNwVU56?=
 =?utf-8?B?NVoyQmNxR24wSUZucWIxTDRqanV0Uk9OZ3RVUVBhZWNwSTZ4NitSRDVrTDlB?=
 =?utf-8?B?VkVkbXZEbnhScVpqUm9BbUdjOTVXcEVySlBKZWtGSjN3SDZEbElyVHhoQ1lB?=
 =?utf-8?B?alZZTkVXVVNsOXZKSmZFanlGOUxkYkJNdmNQQnJOUVI4NFFYWm41a0p2ZGo2?=
 =?utf-8?B?NCtsdTlHclkySTNVMzB5eHQxV3ZBUWV4cU4xMDBUU3M3T2tHaU5xbEsvdEl1?=
 =?utf-8?B?VzFxbXZrQjRMd2hnTFdtc3BQc2E2eXdhMW9HYnBhME85Vm1yQ281b1orcnh1?=
 =?utf-8?B?Rk5XeUFPWkc4Nzk3S1plVzNCSW9RT2FFcFZXTEVIc21sMHIva3pLN0FQaDVQ?=
 =?utf-8?B?NUZzendhZlhEaTZtd1IxUmUvZFFlbWlCZUxRUm83YklqdTc0QzRpU2dXVmZI?=
 =?utf-8?B?YTl6elQrSzZWY0l1YlorMG8rOWhHQlNwbEJUSFRBTm1sdktZblpJbFJZbE5N?=
 =?utf-8?B?bm9ORzk1M09RbzlVTW92dTJoWndrSlIxTzVvT1NYWVRSL2U5dURZc2p0aldL?=
 =?utf-8?B?TngxTExnQ2U5WEZWOWRTMUFGSDRLVHN6YjhtYmQrUXlNRUJoeEtjdHJodS9v?=
 =?utf-8?B?OTRnZG9qWWMwRFhsTXB1K0NBYmtXVUI5UVVyRE54cFNkeUVBZ3l2Ukd3bDR2?=
 =?utf-8?B?NGZiOG51UGN6Um5uSys1ZmdMczRQNEdlYytxQVRKQ0M4NkRPQ2RiMUJrNzRP?=
 =?utf-8?B?MnBkQm1rRlhSZWZLbGtkNVF5cUkwT2p5L1pXMTFJU3NrNG45RkVBRldocTRD?=
 =?utf-8?B?aStrTitKRXpqeU9IWnRGL1c3SVhIL1d0UXk1emlGQVJsZkFva1gzTW9yeUJu?=
 =?utf-8?B?b3Y5VHRtUVNVM2dBSmVNRktrL3VEbjRKbStranVTUW1iRjR6c0ZVZE9NWndQ?=
 =?utf-8?B?RDFaZFNhUERtSUlFT3J1S245aE1SNjJGOTdYeWNOSWZ4ZU16S3VVb2JIOUUx?=
 =?utf-8?B?YmdLZnJINmJ5bE5DelAvczhtSndDZDdjdjRsRnE4VWJ0Y3ZVTXlMTk1JWmFH?=
 =?utf-8?B?bDNxdFpZbkEwUld6bWthZ2lXc0VDUEdrbFg3cVFlMGJGWU9HRmJISnFRNXo3?=
 =?utf-8?B?V2laN281bDM2WU9GMzR4OGRLUUZ6aUhtak1WNTVhbmhHQ0s5VFJhdUlWbWFJ?=
 =?utf-8?B?SEM0bzMwNU1TZjNjMTUveUtHeDd6Y20ra1hJVDMxakhwMFhVWXBKYUtWMDNv?=
 =?utf-8?B?ZEZVT3FPYVd2c2cwY0tYN2E4bm9NRHdUSlg5ME1aS09aWEpTWGRuZWt6UVNH?=
 =?utf-8?B?dEtOQldEQ2RnakZoN3J4Q1ZZMUhwNUtaZFVnZzJXL3gwd1N5M2x1NkJJMlJC?=
 =?utf-8?B?TU1PMk1YV3czSFJGNFhLRzNIRXdwZ0M4RjNWYzE5YVUyRDJpdGhCSlB3Rk9U?=
 =?utf-8?B?TXZmeTd6YWxqeFl4TFNpOGVXSjZPelprdHoxQThyQTJZSHdacnJsZkpBaHZU?=
 =?utf-8?B?QURoTkVOVk44STVHTjdUcVV2NWt5VzFaaHlvQXZjbUp0aDQxdFlBSWI0YmFX?=
 =?utf-8?B?Sm1oeEtmTmFEL1B1aTFzT3hzQVhhK1FHbEo2QUV4a3pqc0NSZUExcCtZNmpa?=
 =?utf-8?B?OVRxT3BURzhhU3FtV1NHaDJQbVBoZ3Z3M0UyTU9ZWVNUUTNEY0xyUXNMUkI3?=
 =?utf-8?B?d3F2bGhUSHl3aVlGb2pac1JaYVBiWnhta1pIOUNWK1k2dUdNdWlFZDdURmk3?=
 =?utf-8?B?MTAySjRUdFlobVY0U1hNTFNWNFI1N1lQcmVyY3dSejM5d2FobEJPYVBmT0s2?=
 =?utf-8?B?ZFJZNjBkSUV2ZDE1NjlJZUZ0b2kwTCtMMHhtMjhoZFZmUlNlL0FSMmR2TVp1?=
 =?utf-8?Q?G8dF2EiKc66Je0NM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8977EC2D953B644185992304568A1CC5@EURP189.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU7PPFA0322DFE4.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f3a2987-3306-4685-6e2f-08de790ee339
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 10:23:18.1509
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +qFk7kWSdTLOQgOOv2f3F9aUQ3VIWvkD75PySECYm1ypxtFStuiqtUJ++x6wjRwIlJe8CSFldMxaOx6YZNxpWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3556
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 10:23:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232302

T24gVHVlLCAyMDI2LTAyLTI0IGF0IDE2OjQ1ICswMDAwLCBQZXRlciBNYXJrbyB2aWEgbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gQWx0ZXJuYXRpdmVseSwgd2UgY291bGQgYWxzbyBj
b250aW51ZSB1cGRhdGluZyB2aW0gaW4gTFRTIGxpa2Ugd2UgZGlkIGluIHRoZQ0KPiBwYXN0Lg0K
PiBGb3Igbm93LCB0aGVyZSBhcmUgdHdvIGFjdGl2ZSBDVkVzIGluIExUUyByZWxlYXNlcy4NCj4g
UGxlYXNlIGxldCBtZSBrbm93IGlmIEkgbmVlZCB0byBiYWNrcG9ydCBwYXRjaGVzIG5vdyBvciBp
ZiB2aW0gdXBncmFkZSB3b3VsZA0KPiBiZSBhY2NlcHRlZC4NCg0KR3JlZXRpbmdzLA0KDQpJJ3Zl
IGZvdW5kIGl0IHF1aXRlIHVzZWZ1bCBpbiB0aGUgcGFzdCB0aGF0IHZpbSBzaW1wbHkgZ2V0cyB1
cGRhdGVkIHRvIHRoZQ0KbGF0ZXN0LCBldmVuIGluIHRoZSBMVFMgYnJhbmNoIHdlIHVzZS4gIEtl
ZXBpbmcgdXAgd2l0aCB2aW0gQ1ZFcyBpcyBwYWluZnVsDQpvdGhlcndpc2UuIEFzIHN1Y2gsIEkg
d291bGQgcHJlZmVyIHRvIGtlZXAgZG9pbmcgdGhpbmdzIGFzIHRoZXkgaGF2ZSBiZWVuIGRvbmUN
CmluIHRoZSBwYXN0Lg0KDQpDaGVlcnMsDQoNCkRhdmlkDQo=


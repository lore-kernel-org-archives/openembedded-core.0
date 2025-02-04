Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E45C02193
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 16:45:18 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.55])
 by mx.groups.io with SMTP id smtpd.web11.120882.1738687511072669370
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 08:45:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=U+fiyvCr;
 spf=pass (domain: axis.com, ip: 40.107.21.55, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ozL7Qts15U6SDiHiVNTWKqc9+Osx0gidsuVWmOl950eb+bp4BS2nVqtUwzykCX4IJNBf6lxIKcJfka4cnDy+EUftIFaJH7y7Eb9gjmE5UTHeJyOxishLIhtsx3b1mMX92f3CJPX/Ob6lPzAqK2wo8IDHys4ibnwYHYsAipOKX9kKHzbYKRGz0j2YRlkCMRjGgqvYn7EqEhdwCpyYqEkCb14nj9CL83QilfjcvspchnhuRpfmWp8DVKfQa+qrT+Rvl16h8f2NSbUyqk0gq5LbiXXnvAKbEe4Ehuz3P//0bWSGOo3hbZtg2WAPzLVOPYayDeRWjEzvVkuWrCEjx+MqVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j+Q2mtYazN5hTvJxe/hcVY62VR6dNXySQqWrywChNWA=;
 b=Obw4t/hENfqgdr5sHaHYyHGXS0ktoDQaalHhWYj77/SGBzBk6hJj3oXx4KrCixu5YFEP4wtOwkn41SOVZOWvkEW8x86QlSxCEiWx/mP8ojs+zFW1JCBavCsHq46vafBQ5TFbR9pZNS5/9BqxqZKp2V8wJuvQXnw3vsavHtDjnS9EAjOjWF+wh5tx64yKLo03d/G8Dij3PHC7QzvOjxy7d5tZXQ4mr5jUNxNH1YUICVNFJdZWkJFBBakJdNbQQUVqgYjKC52+Ks8EP1iuB/66yYE/+UujVLv9dEXsAbnN8nDs+CVdSieP+UWORz9Q26bXahIAwj/F0s0bWhKpd2suZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j+Q2mtYazN5hTvJxe/hcVY62VR6dNXySQqWrywChNWA=;
 b=U+fiyvCrKgCQrJEvXimyicP8WSBL5+jusyUuTsdWRqpLp+85KTnWDw8hRES5gJt3zIeBZ76MnRMhOrm3SjVRApell6b4mpEmLiUIT48Yupjv+w0atDGqfOfzOttJTh19oU3RmR8DiPwSfJ5Pe5yqZMH6hfZRxPyZA3uQOiX7EsU=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by PA4PR02MB7135.eurprd02.prod.outlook.com (2603:10a6:102:103::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 16:45:07 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 16:45:07 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] meson.bbclass: Specify a cross binary for cmake
Thread-Topic: [OE-core] [PATCH] meson.bbclass: Specify a cross binary for
 cmake
Thread-Index: AQHbdx7E+lYOPGVflEiMF6cEQi4yBrM3UuGAgAAFDwA=
Date: Tue, 4 Feb 2025 16:45:07 +0000
Message-ID: 
 <DB5PR02MB10213F946EC053FBB8266773CEFF42@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20250204160609.1646883-1-pkj@axis.com>
 <15230CB2-3678-46F7-B0AD-705DBB8ADB5A@arm.com>
In-Reply-To: <15230CB2-3678-46F7-B0AD-705DBB8ADB5A@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PA4PR02MB7135:EE_
x-ms-office365-filtering-correlation-id: 01d52454-58ea-4314-be2f-08dd453b482f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?a2xnSGI4bmhQaUluRGFSYW9IYUdRR25ScExmYitMMi9sL2lpV1dabG15aHJO?=
 =?utf-8?B?aDI4anEySTErSHdrMHMrQmZENHRkR0I1SHJ6R0tJbklaN3Zqd3hBaXNINWZr?=
 =?utf-8?B?MUEwSk9aV1MzTWRhK3NjVTNoODFPekZEZGxaeHUzNkExaTd0L215OXNFV2Vn?=
 =?utf-8?B?bG5kRmJia0VYd3ozbUZUaEs1OEhONXlIbStCN1hJQkl2V2IycEROZlFHekRZ?=
 =?utf-8?B?QWxocFhObzN3NVQwWkprQkJYYzltSHFqRTdyWVc0TGtIL3E2ck1TUEo3SmM2?=
 =?utf-8?B?Y0xweWNVbThqb05oMVNVdEk4ZktXc1VkOTd0a0tZTG9XQVpGaTczaTJKSHJO?=
 =?utf-8?B?dDVkWXVpOXN5UkcxejVLQllWU3ZxWCtic3JQemc4WFVmMisxeEVhTDhWYlMv?=
 =?utf-8?B?WVA3a0dpN1JGdUVzMXhjbklFUkFQYkxYeGtuMXNCRmh6Mmd6WjdYckRiYmgx?=
 =?utf-8?B?MWJhWmIxNURtVHBYckIwQXFzZjRIRTNQZytuTzJjUERwaWpoelcwZnc0M20x?=
 =?utf-8?B?YnZmeHE3OS9HN2pIYjBiOHBVTVVGWjNPM1pzNmpOQm4vUEFYM0xIWHJoQ2hZ?=
 =?utf-8?B?RFo0bVFxblBzVEZFRUd0RTBmQkNoVlNKSWRyaXNBSCt4SEsySFVFVE9uSU5n?=
 =?utf-8?B?SnQ4bTlqQ0t0WUx2bllwVS9GK0lOQzRTWG9URm0xQzRVcHdmOW1MQjdSckJ6?=
 =?utf-8?B?WThNdUo4T0M3R1ZSYm5SVHVWZWxtdXBNVEZtK3k5RFBOdjNRNTJWK0JaZUE0?=
 =?utf-8?B?MEJVY2E3NXcyZzhjUE0yVEtNS291YURQWjJUaEd3bkdpZ0dLNzRmTXJNTnlz?=
 =?utf-8?B?bEdNS2V6QkdUWTZvdllzY1BGMkJONDRZekE4YlhEVnVGZURaYmFZbEFqWGxE?=
 =?utf-8?B?QjJ1Y1NNYmZyUDJFUjU1VHlwRDczelhlclRzc2ljY0VXQmRGSkcxdjhKMXBt?=
 =?utf-8?B?VzRWTG1ZdXp4QUF6MHVleWtROTJWaUpmOHpJSHVRUVhNbjBZNjI2Rk1McENp?=
 =?utf-8?B?bGI4Ym45ZnpEYUhrZmhXRStvTWNuWEpVVWNUcWlRcmkxRW9WZVVLdFVHaVdI?=
 =?utf-8?B?cUF4U0gybWEzWjhxKzJpYVNDZDMyYjBaU2tSNGMrM0tyREhYUG5zNU9XeHJJ?=
 =?utf-8?B?ZXpxWEVzeElOY0RXWldUSmNYRDV3WnE5WTdoa0lYNTk2ck1OakJmbzYrVXdP?=
 =?utf-8?B?bkRYbFVKZERXWlczZ1FZZ2ttN043WGowSXYzeHNCNVB6QjJNR3BxWHYzaXlY?=
 =?utf-8?B?cHN2WXpGeXlsekJDdzdlNnlBdnU1SnRVdXdGVG04TmtpTU54bkFVTlRRK3hj?=
 =?utf-8?B?WWhVVGRQZ0FXakN1cEt0NjR3clJYOUk3aWVkcXd3M3VreXZsK2txckVLUEFx?=
 =?utf-8?B?ZmVqN1pqY0hTa1h5WTBIRjlwVFNXYVUzaVkvV0pzcGNxVC9WSU1wZmFSeTZN?=
 =?utf-8?B?TnNLNkFnWDcxeDVQMHdRU3Q4bmY0NTFwQkZxZTUvM1JFc1dQQ3NEazM4RVll?=
 =?utf-8?B?cVFHSUpocVM4YWVXdFhhdEN1VnNnVm1KNXZib3B5WTQ3T3ZOZGd2RDFlaDlF?=
 =?utf-8?B?UllsWnFJTnRTaWpBNjBiZlVDeXRiUzJvUG40MDhWYllEN05hc0lXUE5peEts?=
 =?utf-8?B?aC8xQ0Q2anlXang3cXplZG9Td0dPNnFrZXpXU015ek5CVXdEUWR4a0pIRUVj?=
 =?utf-8?B?U3ZQS1lQOUV1Zk1ON3FuNVAyaVpDRUFJS0tXRENvdXRDY2g0My92RGgrMUhv?=
 =?utf-8?B?d3QvYklBazRmcGY3SU12SjFQUjdNUURBYW5WSkRXV1h2Mm9vcEF5S1Z4N1JO?=
 =?utf-8?B?WE5SR0VGZlhkakptakFMWjdMVEcwV3Q2anMzVStmQUpYZ1FWRm54ZGxxaCt1?=
 =?utf-8?B?c2JEbkQ1U2FuQ0ZLL2J2QTQxU3gzWnAydjBFWWMwQVZVdlNVQmhUZjNsekhs?=
 =?utf-8?Q?5i+rw5990r5mjmDaqhYfkwrHPdavMOMW?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NGx0bFY3cmZxT09Ic2RkOGVlcVlmWnRqa2RhamtNcHM0K1pkSE1tZDhKN0Vl?=
 =?utf-8?B?bnlKSk8veFJGQjlBWTRWOXFiTHdaMUo4R2t3YnllZFJDKzdKd2NNclpTN2lm?=
 =?utf-8?B?cjJMekdPUGhYSjF2ejBya0IwNU1qdW5JOVliQ3ZKbENrQXZEem9LNUF2YW9M?=
 =?utf-8?B?UUpETTBocEh1dlBSWFEzVkJadVlMYldZSzhPUDFFd3F3Mi9ZZ0NxeFFwdjky?=
 =?utf-8?B?eFB0Z2RGcVIzeis5anZGbkkzZW42UHhJaGJGV3JFQzhIejZXa1RYQjJ5MVZn?=
 =?utf-8?B?SkUwRVRVeEVhVWtOTGN0MkhEdFZYaWl6dHdTUjQ5R1llYWxJaDZ2QWc2TGVk?=
 =?utf-8?B?L0paOUNvczJURkNxZ2p1enZhNzl4WERlY3BSNlQxZlhKOStqRFlNK0VuYnVa?=
 =?utf-8?B?VWdVamFhTEdaUlVyQVU4RlFJd0RtM1d3U0dKTmIvN3YwS1pDTUxJbG4vMnJ0?=
 =?utf-8?B?MVlJdUZCcTNIZWRsRHhDWDQrMmlrMkY2V1AwdnFZNmRBZGQ3eWlQeFVhMnph?=
 =?utf-8?B?Vm9BRkF2TnQrZG95Nkt6RGVuRjRPYWZsZFNoT1cyN21QbyswMk9oSm5zSTRj?=
 =?utf-8?B?bHBRUUtkMEYvaVFjalY1VVpReTIxR3V0NVI1Y1FVQ3hvWXJQaE1JNk03WURG?=
 =?utf-8?B?UEs5ZEVZUWVIT1FvRW9nbk9ualJ5K3FXY3ZhK0M0ZGR5RlBQQzNDZVpiOGxR?=
 =?utf-8?B?S05rdS9Kb1BVOFNJQXBMYm9xUjM2L3VhcnMyUUJ3cGk0V3oraVQ3d0h1d1c1?=
 =?utf-8?B?ZEUwVm1GM3BmMEZKeTk1MXlBUm1LdG56STJwMWxZd2pXRldjVlBzNTQ5SEgx?=
 =?utf-8?B?YTQvNGZNNlZyRlpFWXA1NVhxekVycHlsV3NSTFc2Um5PN0RmYWFwMEpCWjYz?=
 =?utf-8?B?cWJHaEF6Y0R2dlMyNXNYcGxlY1VWYUpua05wZC96NGlDR1NaWHJ5YjFMc3JB?=
 =?utf-8?B?a3BudVZadjJYaTFleEFvUVpzOGVGYmkrYUpSNk1EYnBRZ05CY1UzTFdMYnNZ?=
 =?utf-8?B?TUtvNCs5T1lxaFhzL1NrNDQxODRFT2pjaWF5dUs0djhtY01UcnhjTENXckJF?=
 =?utf-8?B?MDl2YmxMSENqNHJ3VGo3K2diNE9NcFhtS2k1eWtpT3M0UEhTVXQ2dEZCRFlm?=
 =?utf-8?B?TFRMV1BUbC91WHlyZHVnK1A5V0UyNFdUZitXT1dsQ2J3c2tUdGltWHArMENU?=
 =?utf-8?B?S2ZUeFJtZGJDb21kSitra2taZkNJdTR1cU5GSVVNUkRrOWlpVGhNS1ZYSFJP?=
 =?utf-8?B?NGNvdzJ2Vk4zempqWnFmelE1T0pKVFFFNkQxMWxFNDJzYlgzVGgvQzlZSS96?=
 =?utf-8?B?alI3RHlpOVJPVGxBSlphZm1JUUNIZ3g2SGFudndVcmtTY2t0alVnMXRjbXU3?=
 =?utf-8?B?c1MraFFkaEtzMWgvdlVoNW1iREJGQlRYYmdvajVtRExBdE4xMHhPTzNJZlE2?=
 =?utf-8?B?ZGllK2UxNVIwUmtCVDZEK2xOZ09iVkNRN2t5WDRucXM1V0grS2Y3ZDQ1SXBN?=
 =?utf-8?B?SFNPcFhXT2tnUnI5RkMwZCt5d0xERit3Q1RyemtYclRUbWV0ZTdZN0lFL2NV?=
 =?utf-8?B?Y3o4VHRwRDVzYmtaUmRLVmcva0VOckhEbUVQRTgyL0M3RkxDMnJmRm5IdXF0?=
 =?utf-8?B?aGdvN25hbFVPWkZCZTdsNGI5aWh4TDZ0OWZvM0N0OEVZS1FrQkxPejVmVllD?=
 =?utf-8?B?OGFLS2xPUkFOWTZrQy81MEMzYVFEb1I4RXZNWkIyc1p2cEE2c3VlT2dEVjdL?=
 =?utf-8?B?MWl0R0RoMkFaZk9TcHJSV0I4RkpncHcrZzROUENxdllxY1B5aHJyc0E1Z1Bo?=
 =?utf-8?B?dUVWNEZYQ0RGbEZ1NFpqUndqSmxoMk9Bb0FyL0lrTTNyc0tjSEQyajVTUitD?=
 =?utf-8?B?a1ZKK00wb1pENXlSWmx2RlIyVUo3bi8vNmZ4Y0NtWXRZcXdVOVozdzEzQkh3?=
 =?utf-8?B?UnpmSm56QzRXeThtTCswSHdESDNqMUk4azdCVmx5QkNoSVd3dW1lU0lIUThk?=
 =?utf-8?B?N1B2ZVl4RlVmTVhpdjhNREM5RjBWUmZMT1dBZE5leTdzZGVJT3c3YXltc29o?=
 =?utf-8?B?eDBNOTVlcHNPTFNvQis0ODFCZVZqUHV3R0VwNjNoRHJGUTB6TWh3MjgwSXFk?=
 =?utf-8?Q?n5cg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01d52454-58ea-4314-be2f-08dd453b482f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 16:45:07.2736
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: inCWn6BWISE6IH/qkAmvp54ppXxB/3OvuxbrOVmn54NHM7jY/N2nQGpv8yBxBFda
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB7135
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 16:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210813

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb3NzIEJ1cnRvbiA8Um9zcy5C
dXJ0b25AYXJtLmNvbT4NCj4gU2VudDogZGVuIDQgZmVicnVhcmkgMjAyNSAxNzoyMA0KPiBUbzog
UGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+DQo+IENjOiBv
cGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBb
T0UtY29yZV0gW1BBVENIXSBtZXNvbi5iYmNsYXNzOiBTcGVjaWZ5IGEgY3Jvc3MgYmluYXJ5IGZv
ciBjbWFrZQ0KPiANCj4gT24gNCBGZWIgMjAyNSwgYXQgMTY6MDYsIFBldGVyIEtqZWxsZXJzdGVk
dCB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8cGV0ZXIua2plbGxlcnN0ZWR0PWF4aXMuY29t
QGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPiA+ICtjbWFrZSA9IOKAmGNtYWtlJw0K
PiANCj4gSXMgdGhhdCBub3QgdGhlIGRlZmF1bHQ/DQoNCkRvZXMgbm90IGxvb2sgbGlrZSBpdC4g
SSBndWVzcyBpdCBpcyB0aGUgc2FtZSBhcyBmb3IsIGUuZy4sIHBrZy1jb25maWcsIA0Kd2hpY2gg
aXMgb24gdGhlIG5leHQgbGluZSBpbiB0aGUgbWVzb24uY3Jvc3MgZmlsZS4NCg0KV2l0aG91dCBp
dCwgdGhlIGJ1aWxkIGZhaWxzIHdpdGg6DQoNCiAgRm91bmQgQ01ha2U6IE5PDQogIFJ1bi10aW1l
IGRlcGVuZGVuY3kgbmxvaG1hbm5fanNvbl9zY2hlbWFfdmFsaWRhdG9yIGZvdW5kOiBOTyAodHJp
ZWQgcGtnY29uZmlnKQ0KDQogIC4uL2dpdC9tZXNvbi5idWlsZDo4OjE4OiBFUlJPUjogRGVwZW5k
ZW5jeSAibmxvaG1hbm5fanNvbl9zY2hlbWFfdmFsaWRhdG9yIiBub3QgZm91bmQsIHRyaWVkIHBr
Z2NvbmZpZw0KDQpXaXRoIGl0LCBJIGluc3RlYWQgZ2V0Og0KDQogIEZvdW5kIENNYWtlOiAuLi4v
cmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4vY21ha2UgKDMuMzAuMikNCiAgUnVuLXRpbWUg
ZGVwZW5kZW5jeSBubG9obWFubl9qc29uX3NjaGVtYV92YWxpZGF0b3IgZm91bmQ6IFlFUyAyLjIu
MA0KDQphbmQgdGhlIGJ1aWxkIHN1Y2NlZWRzLg0KDQo+IA0KPiBSb3NzDQoNCi8vUGV0ZXINCg0K


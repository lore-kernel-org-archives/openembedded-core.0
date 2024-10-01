Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D91A2CF6493
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 07:02:17 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.19])
 by mx.groups.io with SMTP id smtpd.web10.75457.1727766133949817240
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 00:02:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=TJUWBRac;
 spf=pass (domain: axis.com, ip: 52.101.67.19, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cxi5gDV0tDJcZqW2x3DFfHwzdmVFhrrhg8DQfmqowFEhelUI8sW4GXmIQB8RRaPEAHWnc9QgmwYKwujA3U02GYfTuU+UbGCxMio8jvJsTS56E0EBbOc4AibRiF2A8R6riEOpuneM5JTfyfPdZRkJ7T5NtoH2BvEg3y11/TvMkIlS3fe/2/EVqboqE+ZgQLpCJNU2QFxAJU8uGqTkfNIw/vDrnQq5XV08TrIDWXPaN3Y78bDmYPkOh8bVVuRPJ0w2ZxMjuxebSE+ruIwwVxh/E9cUl3KIr57jlD5H12b2fbzArn4UvfgIVGT2TyItdmDEIl8aV7p/Jrx8KUPqvEvWMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6b0LfY6BwqB+EyQCXDG/bzhB8uC9QY9khtSDO7Q/6A=;
 b=k0/evqiTh+F5yaRa92FHc10FwEVN6cmlludETRRKW0OTcAyZKebuRS3tQFBzE5jkKMwXeT4vTNenTtwaRaHNPL/nSH3BRwXfVzc0EwwSTtIR9TX03AFsMjvzdBkUcna6eyHtXhwJHBHLXPK7ktBJdkPvoP+7NPyQccESccwM8dkfX3M68CaUIBCcoQOy7fvaXyHmapy+hUAwDqLFnM5GrUxIMtE7OL9FN/T2tPcKbDhnbU1DWU02rbQR8eejQgkzV70qnkD+qRhlttRmkOqeAmu7Cg4OCMinyQn8PEwz7L6goz3ky3/JDxgGDikvvOJUFpZxVO9MKnYBGdTbGXD4KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6b0LfY6BwqB+EyQCXDG/bzhB8uC9QY9khtSDO7Q/6A=;
 b=TJUWBRacnxjcOy+Rfqarq2y/yQFCt/A0LbfqhVc01tCIGwxiIfMzHbFsqh6RWA11OkQVEGjEomTyJ6Mi0LzU8D4uqAWMc9xcIpM8ou6XF/DR8J0WKI90y0rdiYe+VAIQ0JzHye4HSNokEjQCm7nQg6GqXpVFUf74xWD/N0Xv8GU=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AM9PR02MB7345.eurprd02.prod.outlook.com (2603:10a6:20b:3b6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 07:02:10 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 07:02:10 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
CC: Trevor Gamblin <tgamblin@baylibre.com>
Subject: RE: [OE-core] release notes in commit messages
Thread-Topic: [OE-core] release notes in commit messages
Thread-Index: AQHbE3gZje0XB1yXu06Z9RoNbstZnLJxdoqA
Date: Tue, 1 Oct 2024 07:02:10 +0000
Message-ID: 
 <DB5PR02MB10213BB73D6955EBEB1887CCEEF772@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: 
 <97a01f7e4ca0ce655789522f2fe965586ae03fee.camel@linuxfoundation.org>
In-Reply-To: 
 <97a01f7e4ca0ce655789522f2fe965586ae03fee.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AM9PR02MB7345:EE_
x-ms-office365-filtering-correlation-id: 9441da51-8b36-4fbc-cbe1-08dce1e6f82c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?RkQ4cDBUTWlGTUtTdzhyNWxVeVBPazMwM2FWeUN6R2Q5M2M5di9iWjNRZ0Nh?=
 =?utf-8?B?U1ZiSjJwTjRLZitDNHM4NjU1MnAwUk5qbnhBWlM3VW5Zckc2MkRyd2xZdWQw?=
 =?utf-8?B?WHdQNkM3Zy94a1JEZExyVlRQMDA0MWozcnFtR0IvZFZyNHY2QU9oZ0U3MWNR?=
 =?utf-8?B?NXVaL2x3Y0ZjU0R1NHRuMmNqWWl0eFBGenpRUVlxa2dwWnFkbFZDbVVhWWwx?=
 =?utf-8?B?S1dQWmxiRGpFbU9lYnFCeEVKcWh2a2EyL1A0QjBFb242Yi9PdjV2L2xTRXpn?=
 =?utf-8?B?WXFkeDhtckxFbXQ1UTVuNStKVngzQTVrR3RUREFxSG56aDRyaUZ2elJVV3cv?=
 =?utf-8?B?L0d4Qjc0dmp4U1gwa0VnMnBHWlhhb3N2LzZpc09HbFZvNlE2VE52N21tKzJn?=
 =?utf-8?B?NWp1cjB3d0lzeE5yUFpjV0hZMXh3c1VIeU9hQkdGMThNUUFIUVVyV3hMcEN1?=
 =?utf-8?B?dEdsYnllWXBUbEhvNkFFaHRhL01ScFh3R1REQU42SGM1bTFSUmc4V1ZUSWJK?=
 =?utf-8?B?WkxtWnlROS9HNXJWd0dQS1N1WGRNZ0pVR3FhL1JEYVhmdWpjN05vUExpMnp0?=
 =?utf-8?B?cmNLeXRJZDd1amxKZ280VkZmVDBFWm9lbHdveVBQTXZnOEdGSEhQOHo3aWxy?=
 =?utf-8?B?a0ZHQlN5S0dObEhBN0dWR2p0dkx0ajZMOEI5RDFCR0M5ckUyVzZOWWVUTk1M?=
 =?utf-8?B?b3FaMmhFWkthZXVqNFRTaS9OT1pXckxtVURDckN2Z2gxdEFjYU1LWk0rR3RC?=
 =?utf-8?B?Zkh0clZsaG5USng1REpPODB4MCtCRVJ3a2doRW9UM1BCRkZKR0xucjZJaURD?=
 =?utf-8?B?QWhaUWwyWDV2KzlpakZqT0NnN3VaYWN3dWVVcUc3Z0FHcDBuRzNDZDFTMm5D?=
 =?utf-8?B?cjZIY1pkVTYwbEJsU05RYk1hT3VCSUhpWU4yYVVCT2p3OHMzYkhVVnArSHBq?=
 =?utf-8?B?Rm9FN1NmMENzK2tQa2JDaDBrMTBzNFY3RVlSTDMxdVljaUQ5VU1vR1Z3TXpu?=
 =?utf-8?B?TXNGR0tka2J0clpTNXltcVE3L2NmS2FOTDVQMHVjcG1UbkdGWXNCeGhIS0Yw?=
 =?utf-8?B?ejJXSEIvVkZPRXFob3ZlYXN1TjJCeUJPejdUSjMyTDdXd2ZvZFpBb3hHY3Jq?=
 =?utf-8?B?ckVKSWZFcEg4MXFpQUx3ZjZUMTRBWmRRdUxIUmZDMTh6OWpWYjVNVkd5S0xh?=
 =?utf-8?B?c3NmVisveUtRcGtmQ2FRLzFFM09kVGh6Y0JzZ1BFTlJXWUlaYllmbWRJZ1dl?=
 =?utf-8?B?RjdXelJ4WlpFYkNYaHd1TTdwVGh2ZVJrWGpkZkFORzgwZTBUR0gwSzdmVUZv?=
 =?utf-8?B?czdpcU9XZ0UzN1Z6MW1scmpEM3BZTnZ6Y1plWThYdWQ1eXZuN2dmanUxWGdO?=
 =?utf-8?B?MUwyZUMvTTkxS0xBVVdzTXpGS3NLSzFCc0prcWtMYXluZytxNGNoQlNpd1R5?=
 =?utf-8?B?dE5GTWp4ZXhKZEEzeG5HU2EwUnA2VUJveEFjQ2JxMUh5b3FEV2M4RnF2V1k0?=
 =?utf-8?B?Z245OTZOMXM3RHRFdVhjWDBEMHkrMDNyQkZKcjBmcU5Pb2NoVUlndXNXaWgx?=
 =?utf-8?B?WnkwYnpCeHphUk5UWEE3d0dsWFQ4eEdpREp0OGZJb2xnOWVhYjNmWHAyYkRx?=
 =?utf-8?B?NnlBNlI4dWdWbi9ZV0VQbWxQRkl2NGZQS1dQRGhneDB2eWxtNXR2aHBZcHhh?=
 =?utf-8?B?WitrVFBXYk5Sa0syaWRzYXBsQTJuOC9paDFjM09ZWmRPaG12SXZDZGYzL3Ar?=
 =?utf-8?B?M2lLSDdlS2J3N2RVdTNTYjdPVkZscjRnZ1FtMFNOK01lenRVcnRnRUpyQnFl?=
 =?utf-8?B?cFhDbnhXMjdFN09ZT0YyQT09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WS9YUjBjVnAwcjVDQXRkd25lUSs5NjI4SVpzaDRVMFBCemxzTnhUNlV1Yk8v?=
 =?utf-8?B?V3BYcWFIM2ZwMEZNcDIybSt3d2hWZVY4a2dUcmpqYmhFOXNJUkptdndlQ1Fs?=
 =?utf-8?B?OU5KZ25zbG1Jb2s5U1Q3SjVCTVRxaHZ6UmsrWkx0dnAvaEQxaVFMQ3l1Q2xx?=
 =?utf-8?B?dUIzV3ViTXcxdmE1b0lnL3QrK294QXVGU3RwL2pPU1pnVEZ5MFcxUmpHMktW?=
 =?utf-8?B?QkttNDIrbmJXV3A4MXBoanZCbkNnbkphZnNsVWhzRThoM2NLS3FaRWwxYXNV?=
 =?utf-8?B?RnFiOTArL1Y2Um5xRDlNcFpmaXVGVGlMekdteXl3ckJCclZDd1I5TEc2V0V2?=
 =?utf-8?B?Yzh4UHMxajJhWkg5eXltcE9FcWptWkZYMEZ1YWY2anJwYktPa05SY2lJMFAy?=
 =?utf-8?B?disvQVUvOEVGUzlwR0ZVVXgyUmM5VDBkWW5OL3ZxUEsrWmhhcHNIQlBpQXI2?=
 =?utf-8?B?U1NieURUL0hqSFFhTXQ3cWwwZkYzNGdmOGI5bk5GbUwzRHNldkpoUTJmeXF3?=
 =?utf-8?B?MnF3SDdJbG15bCtRNm1kZDI5eXM4RDhNa256SGJTSFlEVUhmcWRnWHpnc3VF?=
 =?utf-8?B?Y0JscUZXQVFqVnpld3J3NnNBWHlHb3Fadm45YlZPSmNuTERMZUljYlVJa0dp?=
 =?utf-8?B?RXpLTkJWUlh1Tm1yU0NLLy9IcndkNGxFTm1hVFlrNnBDYTFaZHBuN0ZSditz?=
 =?utf-8?B?d3RGalVuZndPMkpIQjRPUklWVFJ0VGhrbENZSkpSVG9pV0Q2ZzlFNVNaRDd1?=
 =?utf-8?B?MlRBM2E1RTJLNVgrRjJ2eThzUUlYbGFlYXlUU3E5OGpEeXUyTUFPYmRQcG9o?=
 =?utf-8?B?bjltLzI3NzlhaFV0L2NBeEtzMmI4U0Vjam1DejM4R0NhRmdIcmhOL25wanFx?=
 =?utf-8?B?M3QrSkJOeUtlNG1MajUxYktnUkhiNXZpTmtUOGx6VTg4ekY4bkNMSnNSbFVH?=
 =?utf-8?B?aUpnRFVqKzAzS3FmZi9uYTAwd2ZJZ3F5UHRIMkkxV0JkRFNWd1l1Q2lHMWhm?=
 =?utf-8?B?VVdHWEcyVGVRY3RDUkQzUHplOXMyZ3AvUTVYbkNHTFhYNG11RjZXc2kxbFY1?=
 =?utf-8?B?VndzTjkvVEhqdlc1VW9VdStwU0luSFlTTS84TWRVOUk2UmpFT3hWbjJhT3RW?=
 =?utf-8?B?cFBKb0U3cHdhWitxaHdGTG5hODM2OGlPUUl2WFVhNXZEMXpMMXBPNmd1UGhm?=
 =?utf-8?B?S3NxREh3SC9UaGROME8xNDFqL1ROcjFuS1VCS3NvTHl6UlQ0c2JETHYzdTA0?=
 =?utf-8?B?VmpzcjJNZWxnUUZMaWwzS3UvQ0FNcnFZdVRvdW9zaWZEeHJTcUJyenF0V3pj?=
 =?utf-8?B?WGxkRGpGVXNlNFhYejZNbVJXNWF6TnphUUQrNXBTYkpwV0pSa3RWS1NYZDdE?=
 =?utf-8?B?cHpWVWNEaDBTSGoyeWJWTmpzMkFxMGh0N3oydk1jR1FHdSthMWIzU1hMRmU3?=
 =?utf-8?B?Q05wWUJPa2tlSjlEQWRsNGM1T1Z0SnAwdk1VSURrTmZHSG91eXZzbFFadnBV?=
 =?utf-8?B?MmJ2MTJjaWMrV3p0NnNuY0RiR2FwUmlWeXFMVHhXdS9WQkhTUGROUzRwakl6?=
 =?utf-8?B?MFU3SSt0aVQ5Q3RWUEhFR2k2cW9TSWpORmxEYnpOQkgyVFg5RDJaTVg2cDZZ?=
 =?utf-8?B?cDl6VHpjeHZiT3lvdmVMNEx6UG82WG1aUGhVWk9NckRnb1BQUm5pbENmcnBP?=
 =?utf-8?B?dU0yTzNPTTRUTS95ZWxuSW1RWHFpbURYVWVFS052eXpIZEN2STg3UVpENExa?=
 =?utf-8?B?UjdXaWJXQXBQY1NGdldKaklhamdNeGdpamxXZ0R4Vmk0VVpFa0psTlpzandv?=
 =?utf-8?B?cGsxUS9yVG0xZ01qWDhYY0RnKzVPZVZFVVlNUzNWWUFhOENNUkhBMkdleDRp?=
 =?utf-8?B?Zk1sTjVBU25wb0FIc0o4SXlJRXZmMlpaY0V6R0J1Um5ZdFl0ZkhWM3ZWNFdZ?=
 =?utf-8?B?WFZ1ekFsNWdJR0w1c09FNWNHajE4dERpbzZ5MGNQWlU5Ti9uYVNIMkNzQTdI?=
 =?utf-8?B?bDZkOS96U3hPUUtaZVBMdy9SRU1SV0g2YXBUSk5TMmlMdlpoODVXTk1wK0ZU?=
 =?utf-8?B?UjZiWjlOcjBSY0w1U083Wkp6RGtseFRFVEJHeHUzSWVtUkFtZ3drL3RSR0JB?=
 =?utf-8?Q?wPG8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9441da51-8b36-4fbc-cbe1-08dce1e6f82c
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2024 07:02:10.1639
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eG/8OtbWzO/m18SJl7MJ5+TT0rEbXzXm4MojDjw5wUKPSuUhBYchOWbBT9F3vcgI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB7345
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 07:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205132

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIFJpY2hhcmQgUHVyZGllDQo+IFNlbnQ6IGRlbiAzMCBz
ZXB0ZW1iZXIgMjAyNCAyMjozNA0KPiBUbzogb3BlbmVtYmVkZGVkLWNvcmUgPG9wZW5lbWJlZGRl
ZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+IENjOiBUcmV2b3IgR2FtYmxpbiA8dGdh
bWJsaW5AYmF5bGlicmUuY29tPg0KPiBTdWJqZWN0OiBbT0UtY29yZV0gcmVsZWFzZSBub3RlcyBp
biBjb21taXQgbWVzc2FnZXMNCj4gDQo+IEhpIEFsbCwNCj4gDQo+IEkgd2FudGVkIHRvIGhpZ2hs
aWdodCB0byBwZW9wbGUgdGhhdCBjdXQgYW5kIHBhc3RpbmcgcmVsZWFzZSBub3RlcyBpbnRvDQo+
IGNvbW1pdCBtZXNzYWdlcyBpcyBhbm5veWluZyBhIGZldyBwZW9wbGU6DQo+IA0KPiBodHRwczov
L2dpdGh1Yi5jb20vb3BlbmVtYmVkZGVkL29wZW5lbWJlZGRlZC1jb3JlL2NvbW1pdC81MWZiOThj
NmRhNjFhZDRmYWY1YjAwMzE2ZTcwNzVmM2JiZWU5YmM3I2NvbW1pdGNvbW1lbnQtMTQ3Mzk0MjAw
DQo+IA0KPiBUaGUgaXNzdWUgaXMgdGhhdCB1c2VybmFtZXMgZ2V0IHBpbmdlZCBvbiB0aGUgcmVm
ZXJlbmNlcyB3aGVuIHRoaXMgZ2V0cw0KPiBpbnRvIGdpdGh1Yi4NCj4gDQo+IFRoZXJlIGFyZSBh
IG51bWJlciBvZiBkaWZmZXJlbnQgcGVyc3BlY3RpdmVzIG9uIHRoaXMgYnV0IGlmIHBlb3BsZQ0K
PiBjb3VsZCB0cmltIHRoZSB1c2VybmFtZXMgb3V0IG9mIHN1Y2ggY29tbWl0IG1lc3NhZ2VzIGl0
IHdvdWxkIGJlDQo+IGhlbHBmdWwuIEl0IG1pZ2h0IGJlIHNvbWV0aGluZyB0byB0ZWFjaCBwYXRj
aHRlc3Q/DQoNClRoZSByZWFsIHByb2JsZW0gc2VlbXMgdG8gYmUgdGhhdCBHaXRIdWIgdHJpZ2dl
cnMgb24gIkB1c2VybmFtZSIuIFNvIA0KY2hhbmdpbmcgIkB1c2VybmFtZSIgdG8gInVzZXJuYW1l
IiBzaG91bGQgYmUgb2sgdG8ga2VlcCB0aGUgcmVsZXZhbnQgDQppbmZvcm1hdGlvbiB3aXRob3V0
IGNhdXNpbmcgYW5ub3lhbmNlLg0KDQpIb3dldmVyLCBiYXNlZCBvbiB0aGUgZXhhbXBsZSBhYm92
ZSwgSSB3b25kZXIgaG93IHRvIG1ha2UgUGF0Y2h0ZXN0IA0KZGlmZmVyZW50aWF0ZSBiZXR3ZWVu
IEBQcm9wZXJ0eSAod2hpY2ggc2hvdWxkIGJlIGxlZnQgYXMgaXMpIGFuZCBAYXNvdHRpbGUsIA0K
QEF2YXNhbSBhbmQgQEdUb3dlcnMxICh3aGljaCBzaG91bGQgYmUgcmVwbGFjZWQpLi4uDQoNCj4g
DQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQNCg0KLy9QZXRlcg0KDQo=


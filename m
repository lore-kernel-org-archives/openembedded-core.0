Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9183C0015E
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 10:26:55 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.41])
 by mx.groups.io with SMTP id smtpd.web10.10653.1689762414354176512
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 03:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=v3jRKa+g;
 spf=pass (domain: siemens.com, ip: 40.107.22.41, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZM70kQZDi8BB99eR/XAR3X8VwsAJ5ed0gWSXlO6m88UsJYrCNZlnD4VTgilq4UhQgO8sCUBf8wyET32kQ2u3Qc2/qcrRzqF5xkoZyU5tVsH82YXTQbG2yIH7LkW2iFY8a+N6Z1sXQ8WI70sTAgI9u6HQ+Rq5iLMNcTP8rH9+DSgdY+yHGLGmNaB16XdQ3Xvhya8xzslMNXNvdgYL4NccwwRUMf3VHX6Az4CHijdd0bnw4i8nviP0rQBnlbHh9r3Sje8J8cx5lREKuwLKeME1ZFStr/xUFFhCBg24RXwiiczahZ1Ya+1WW9Uh0msSxRZK6SSmcLfyAiORgeUNm3qgUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+O22zwOlxJEvvme6EpSvxTmek+M208l1qhjxNqL5dE=;
 b=lFUz3BB9XHK6LALCZyBmfvXf4yPMo/qSdoO6CgiKrdrbib6k7q6YwVmoLipl63z4oB3P7s9CL8zW2bqjRPKEOH7F1Ub/E4oCPRNnr+X2J7SKVzetwubGpXr6KfHoKM+KtEi1ParhS6du0oqJLuHSFBjTwNiL4CI/6+GQHlMGaFJ8NwjZYzV+r4bqVykqEvvHgDPNh1m4sVDfQRVRngyMpHPWwD3HLa34x5zT+rjZ2bUgbF0a0S9T6DychOoaaHQzyde34tIvlKDHc7Oxi9Aq06fZTFJgwFaHg9rfKJVJwd8nyzRpFM3JL4u3pjNlS/ZU5i/9TPNfD9r8BuL29YbZYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+O22zwOlxJEvvme6EpSvxTmek+M208l1qhjxNqL5dE=;
 b=v3jRKa+gIXs7wOucAkDSIpnjM1DAYV4ECY3ZCgz3dDpRhCT9AKXCybrv+Og5Bwl+Vk5mJSX6A0ZbjOzC7UGqTNA94KMvHEEouofaldX+6AEqNH/E4uJsp+pyvNDGbG2tkyZ1Zlrlr14hMuu6AN7pmoC3WNh7blYYfFxaVUnxnn0CoX6aEvvXI7ZrXBsluHrZ+xsq77vc4YZUl9qsHaS6IMGZNla2VFbHldk+xX4P/QVladYsMi0ZDiLgbkfvCPUQ7qwrHIO09xUcVPx5BeanMLMJQYv3mg8DvjbpsefRt6dT1feQbVA9oAlxEtmKwXpBfe06ZVNElG+aHE2sHaVXiw==
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DB9PR10MB5425.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:336::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 19 Jul
 2023 10:26:51 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::aca4:33f1:8cc0:ba0e]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::aca4:33f1:8cc0:ba0e%3]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 10:26:50 +0000
From: "Valek, Andrej" <andrej.valek@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v9 0/3] CVE-check handling
Thread-Topic: [OE-core][PATCH v9 0/3] CVE-check handling
Thread-Index: AQHZpcQdgpu78byhg0qChnnStUlCU6/BC4YA
Date: Wed, 19 Jul 2023 10:26:50 +0000
Message-ID: <38950e1b3bd475c131e7e4b5db03d9d170c8d690.camel@siemens.com>
References: <20230519081850.82586-1-andrej.valek@siemens.com>
	 <20230623111459.97933-2-andrej.valek@siemens.com>
In-Reply-To: <20230623111459.97933-2-andrej.valek@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 (3.46.4-1.fc37) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3977:EE_|DB9PR10MB5425:EE_
x-ms-office365-filtering-correlation-id: 9a949643-3f5b-46e3-faf5-08db8842aa50
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 SIEpF+mIKXnr1cCU5QX2atPGHWjWIrUq2oJ/uDZbwPw9/GMxZa71E8EMORCh90whELPsOuuWTTtMQnX/cDZiI+BrauhjrgaTeEuFnCdiOiQCTvTCk6ZKn9km2oTmKeBQhDec1RA3oUAamVsG7a4Vn2bXfbc6iRbw9ZCrpOhqPRh/ugLagI+pjQk1BMhvow8JiMA+vFpHLl0eID3/B/C/TmgCvsCumLuKcah7OX0IOnYgb+SYKrqPX1kn+sHTarsYPA+m5NBbA7HnBGxickNYCOAYNfLukUEl3U7lrQYhHEs9NhssmGixMObiB4ZhTo7CDPd7AeiG+K5BgVrqeDjkAKG1cD8KeR+LMDuXZ4apVjozTbcvaCHE6SN6FpH3N96seh57MHIydGvMPLcff74tjKXQXUORQJ4ZiokLOUuOsLpNSvISI+n3oi0OAAh7Dc252ZqK4K4eSSrPS1mUkENOcNlHW8+xAVlQOk0rpGZsNcYQ5xtVyJdp1vFDT1yRGRBi+mpLhtx39TXc99RWUIYmnd+taWU5eluhgXlyQOL+3/+pgQbckNnkK5hcswEOVVO6X7Afg7DDoVa2y1YA1FSRtm4/UJ6aXmxvzRZoNnjeHd0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(136003)(366004)(376002)(451199021)(66899021)(71200400001)(6486002)(478600001)(91956017)(83380400001)(2616005)(36756003)(38070700005)(86362001)(2906002)(26005)(6506007)(186003)(6512007)(38100700002)(122000001)(82960400001)(6916009)(76116006)(4326008)(66946007)(66556008)(64756008)(66476007)(66446008)(316002)(41300700001)(8676002)(5660300002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Y0hQYVhBUS9QT09aMXZmTEhIWVZqcTJ1anBnbjg1aTA1ZWVuT0t4S3VpbTdt?=
 =?utf-8?B?Y2tPVFJ3dXpzT282TFlYSTdLdjRCRDZjSGFrNWtYZTVtOWJkcTBueVBYajd0?=
 =?utf-8?B?M0lXMWFZNW9vYTZpbzY1eWsyTnZVNGZJTmdBS25jYStZenFiMzg1RWtJYTNQ?=
 =?utf-8?B?MzlvQnJ1NjZ2Qk00Smh3WGhuT0RBaXpERDk1MDc4eitkL0FZTEVyeG15NWJE?=
 =?utf-8?B?bENuMFJXMEFNU3pac2tkRGdDcm9Xdjg0VjlMUk9aMm5DTDNxckV2dFFsSTlr?=
 =?utf-8?B?SDhVcnlIMmNhdTZMSDZMOU1uYnRsS04rNWFva3ZUZDJJZklDNU1yaVhNT2Rt?=
 =?utf-8?B?SnNFeVZoaG9QZUhreTBPa2hvOC90QlAvOFZOaEpRZDBHNGxsM2NMSW1VVE9U?=
 =?utf-8?B?R3lickFPc0UwWGJEQU1MRDRWeHJzQ2NBalB1L282aENNRXh6UlNyY3VCQSt5?=
 =?utf-8?B?YmV4NFFnOGM2SGVtYzdUSGxRQll6ZXQ1NWZlcXo5WGhiR295c21vSGZFWEh3?=
 =?utf-8?B?c2U5OUdwd3RHUnRrZ1FQOXkvY0o0MjFERDNvT055dDE5a25TamVCaUV6bkpt?=
 =?utf-8?B?Y0RzYmEvT1hjSCtJOEJqcEFTTkptSUdwL3BTbmxnREE0RUlDY0J2Wml3cFUv?=
 =?utf-8?B?d0RDWUZtWVZWT3ZmRndBU0lJT2QyWHRFUUtXK3RwNHZwVFg3MlhUQ1lpWVZv?=
 =?utf-8?B?Y1FkV0hJZjJVam9vUUkwYU1NamdGcHlNSlR5SHMyQzRtVUM4UVNoempMcG9V?=
 =?utf-8?B?M2krQlE1UTRRejlxcWh2cU9DdnU4Y1RENDgrUTAvRmZhNXUyaXFxRFplNDc1?=
 =?utf-8?B?K3IySEZRbGVvRkZ2aUpqS2tJTVQ2Zml2eXJ0eFNBUEhRRmkxWFBMTmxUOW8v?=
 =?utf-8?B?VlpLSTloZ3NmSVJZN0J3TGY0a085eWhVemJJYnFoKzB3eENBZExzSGNaVTNF?=
 =?utf-8?B?QUJrQ2piN2lSTWk5UDhPeC9DS1ZlVDdKU0wvQnFGWHI3ZFBnaHFlOFh3OC9t?=
 =?utf-8?B?ZWRZVFJpWVFuQ0ZOZWxMZUszT3kvQUhOb3YxWmQzNk45WW1neEVjNTJkbGl6?=
 =?utf-8?B?aUNUSWJZTUplZzVZYko2T1ozcUsvQW5qa2ZiV2o5QW8rS0FhV3FOb29JZi9P?=
 =?utf-8?B?cDV3UWZjc3Avak1PTnFWb2U5T2RFU1VIY0hvaWNGd0NWK0s4NzRJNmxETjBs?=
 =?utf-8?B?NHhlWVo5dWlHcmR3Uk9GdXc4QlAxL2ZnMklEWk5MdnJLZE5yRlkrUUpQN0N4?=
 =?utf-8?B?SFMvanp3cnlBczFPVGFoQzBpWFJJZElxZWZkL2ZkOUQyOHNFNnhPc3h2Vk9v?=
 =?utf-8?B?MWF5ZllQbDFKTm9rTHI1cmhjcmViVThEOHhzWjdpeWVGeUNCRlVJOTVnMThi?=
 =?utf-8?B?eGRRWWdiV0FQNGhCWldhUEZkYkhCVXBXb0xaTXQzODVjUDlXVlFGNFA0SGph?=
 =?utf-8?B?bGw2ZnhZL2dSUEpQMFBYdHZzOE1BSStxWVhJRDNEaFREdzY3N1ZvMDdkV1pP?=
 =?utf-8?B?dnUzUVQ3K1NBdUdheTh6SlN1UVAxT2lxZ3JoVkI3dnFLcGlwSFNQUFozMUxP?=
 =?utf-8?B?QlZ1UFc2WHZFWWMvMGl1eWpwY2dOUU91OFl6V0hxczg2Zjk0VjJHVkxZSS8w?=
 =?utf-8?B?Vy85MDUrM2lnOEMwek1Sc01INnpLQmtjeFZtZ1MwRXNMclRVczJaWG9nN0Rt?=
 =?utf-8?B?SUJuMDE1cU4rWGVZdEJBRzhVaHA3Q2krdnBkVlVFSy9rUTFTV3VDRERJNHFX?=
 =?utf-8?B?bSttR3Y5aXVqQjVRcGFFSHp5T3ErNHdwVFdqY3dEeDhwdXhVYkhiOEhhcGIz?=
 =?utf-8?B?cjRZZnRMeGlLSHVkUkNiMW95UXJXYmJPZXM4eHZGclFyTzVKVjNqbER4T3VK?=
 =?utf-8?B?Nk1uM1lDZVhNQmJRenB4bGtzWVY2TkQ2ODlkUHp5ZzIzYnlsUFB1NmdaSUQ5?=
 =?utf-8?B?VWRacFE2OTdDTVRudjlUTy8yeVNIb05yQzI3QXBjajd1VEVsRkpTMzNpWHpt?=
 =?utf-8?B?MUtzZW56ZDFjYzg4Mmk5cGIzNVUrYm14Mmx5dE1qWkpwMFkyZW12encxc1FD?=
 =?utf-8?B?Wlc2VTdSbjUrZGVzb3RacEozaVBNbG9DNGxJWlByZzJVRlFoKzhtUjNUOE9Z?=
 =?utf-8?B?QWtHZEMxSDNmdXA1bUlEMWFPakJkOVRYNldKZmpQU1lRc2xmR1V0a081b1pz?=
 =?utf-8?B?MFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A1528AB103E95043913F5EF61243F582@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a949643-3f5b-46e3-faf5-08db8842aa50
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2023 10:26:50.9234
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pd/3wbUEwjh3EkYPda/6lYLF3qzvpWX7yrDJndxidWzj/Po6f5Y0xu0BW61Y8xThtnzFDJIQLcK9edtT7VAtMuKCVR8vpFX2arXYAplK6PI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5425
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 10:26:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184575

SGVsbG8sCgpJIHdvdWxkIGxpa2UgdG8gYXNrLCB3aGF0J3MgdGhlIHN0YXR1cyBoZXJlPwoKUmVn
YXJkcywKQW5kcmVqCgpPbiBGcmksIDIwMjMtMDYtMjMgYXQgMTM6MTQgKzAyMDAsIEFuZHJlaiBW
YWxlayB3cm90ZToKPiBBZnRlciBkaXNjdXNzaW9uIGluIGFsbCBwYXJhbGxlbCB0aHJlYWRzIHdl
IHByb3Bvc2VkIGZvbGxvd2luZyB2YXJpYW50IHdoaWNoCj4gY292ZXJzIGJvdGggZXhwcmVzc2Vk
IHJlcXVpcmVtZW50cyB0byBoYXZlIHZlcnkgc21hbGwgbnVtYmVyIG9mIGRpZmZlcmVudCBjdmUK
PiBzdGF0dXNlcyBhbmQgYWxzbyB2ZXJ5IGxhcmdlIG51bWJlciBvZiB0aGVtIGF0IHRoZSBzYW1l
IHRpbWUuCj4gVGhpcyBpcyBhIGNvbXByb21pc2UgdmVyc2lvbiB3aGljaCBtYXliZSBpcyBub3Qg
aWRlYWwgYnV0IGRlYWxzIHdpdGgKPiBjb25mbGljdGluZyByZXNwb25zZXMgd2UgZ290Lgo+IAo+
IENoYW5nZXMgY29tcGFyZWQgdG8gdmVyc2lvbiA4Ogo+IMKgLSBtb3ZlZCBDVkVfQ0hFQ0tfU1RB
VFVTTUFQIGludG8gc2VwYXJhdGVkIGN2ZS1jaGVjay1tYXAuY29uZiBmaWxlCj4gwqAgLSB0aGlz
IHdpbGwgYWxsb3cgdG8gdXNlIGl0IHdpdGhvdXQgaW5oZXJpdGluZyB0aGUgY3ZlLWNoZWNrIGNs
YXNzLCBsaWtlIGZvcgo+IFNQRFgKPiAKPiBEb2N1bWVudGF0aW9uIHdpbGwgYmUgdXBkYXRlZCBp
biBzZXBhcmF0ZWQgcmVwb3NpdG9yeS4KPiAKPiDCoG1ldGEvY2xhc3Nlcy9jdmUtY2hlY2suYmJj
bGFzc8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgODEgKysrLQo+IMKgbWV0YS9j
b25mL2JpdGJha2UuY29uZsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfMKgwqAgMSArCj4gwqBtZXRhL2NvbmYvY3ZlLWNoZWNrLW1hcC5jb25mwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMjggKysKPiDCoC4uLi9kaXN0cm8vaW5jbHVk
ZS9jdmUtZXh0cmEtZXhjbHVzaW9ucy5pbmPCoMKgIHwgMzcxICsrKysrKysrKy0tLS0tLS0tLQo+
IMKgbWV0YS9saWIvb2UvY3ZlX2NoZWNrLnB5wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCAyNSArKwo+IMKgbWV0YS9saWIvb2VxYS9zZWxmdGVzdC9jYXNlcy9j
dmVfY2hlY2sucHnCoMKgwqDCoCB8wqAgMjYgKy0KPiDCoG1ldGEvcmVjaXBlcy1ic3AvZ3J1Yi9n
cnViMi5pbmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDYgKy0KPiDCoG1ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvYXZhaGkvYXZhaGlfMC44LmJiwqAgfMKgwqAgMyArLQo+IMKg
Li4uL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JpbmQvYmluZF85LjE4LjE1LmJiIHzCoMKgIDIgKy0K
PiDCoC4uLi9ibHVlejUvYmx1ZXo1XzUuNjYuYmLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoMKgIDQgKy0KPiDCoC4uLi9vcGVuc3NoL29wZW5zc2hfOS4zcDEuYmLC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDkgKy0KPiDCoC4uLi9vcGVu
c3NsL29wZW5zc2xfMy4xLjEuYmLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oMKgIDMgKy0KPiDCoG1ldGEvcmVjaXBlcy1jb3JlL2NvcmV1dGlscy9jb3JldXRpbHNfOS4zLmJi
wqAgfMKgwqAgNCArLQo+IMKgbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmNfMi4zNy5iYsKg
wqDCoMKgwqDCoMKgwqAgfMKgIDE3ICstCj4gwqBtZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGli
eG1sMl8yLjEwLjQuYmLCoMKgwqAgfMKgwqAgNCAtCj4gwqBtZXRhL3JlY2lwZXMtY29yZS9zeXN0
ZW1kL3N5c3RlbWRfMjUzLjMuYmLCoMKgwqAgfMKgwqAgMyAtCj4gwqBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvY21ha2UvY21ha2UuaW5jwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA0ICstCj4gwqBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvZmxleC9mbGV4XzIuNi40LmJiwqDCoMKgwqDCoCB8wqDCoCA2ICst
Cj4gwqBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2NjL2djYy0xMy4xLmluY8KgwqDCoMKgwqDCoMKg
IHzCoMKgIDMgKy0KPiDCoG1ldGEvcmVjaXBlcy1kZXZ0b29scy9naXQvZ2l0XzIuMzkuMy5iYsKg
wqDCoMKgwqDCoCB8wqDCoCA3IC0KPiDCoG1ldGEvcmVjaXBlcy1kZXZ0b29scy9qcXVlcnkvanF1
ZXJ5XzMuNi4zLmJiwqAgfMKgwqAgNSArLQo+IMKgbWV0YS9yZWNpcGVzLWRldnRvb2xzL25pbmph
L25pbmphXzEuMTEuMS5iYsKgwqAgfMKgwqAgMyArLQo+IMKgLi4uL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjNfMy4xMS4zLmJiIHzCoCAxMyArLQo+IMKgbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3FlbXUvcWVtdS5pbmPCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMTMgKy0KPiDCoG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9yc3luYy9yc3luY18zLjIuNy5iYsKgwqDCoCB8wqDCoCAzIC0KPiDC
oG1ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0ay90Y2xfOC42LjEzLmJiwqDCoMKgwqAgfMKgwqAg
NCAtCj4gwqBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvY3Bpby9jcGlvXzIuMTQuYmLCoMKgwqDCoMKg
wqAgfMKgwqAgMyArLQo+IMKgbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2N1cHMvY3Vwcy5pbmPCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8wqAgMTcgKy0KPiDCoC4uLi9naG9zdHNjcmlwdC9naG9zdHNjcmlw
dF8xMC4wMS4xLmJiwqDCoMKgwqDCoMKgwqAgfMKgwqAgMyArLQo+IMKgLi4uL2lwdXRpbHMvaXB1
dGlsc18yMDIyMTEyNi5iYsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNSArLQo+
IMKgLi4uL2xpYnRpcnBjL2xpYnRpcnBjXzEuMy4zLmJiwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHzCoMKgIDMgKy0KPiDCoC4uLi9sb2dyb3RhdGUvbG9ncm90YXRlXzMuMjEuMC5iYsKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA1ICstCj4gwqBtZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvcHJvY3BzL3Byb2Nwc180LjAuMy5iYsKgIHzCoMKgIDQgLQo+IMKgbWV0YS9yZWNpcGVzLWV4
dGVuZGVkL3NoYWRvdy9zaGFkb3dfNC4xMy5iYsKgwqAgfMKgwqAgNyArLQo+IMKgbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL3VuemlwL3VuemlwXzYuMC5iYsKgwqDCoMKgwqAgfMKgwqAgMyArLQo+IMKg
Li4uL3hpbmV0ZC94aW5ldGRfMi4zLjE1LjQuYmLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqDCoCAyICstCj4gwqBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvemlwL3ppcF8zLjAuYmLC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgNyArLQo+IMKgLi4uL2xpYm5vdGlmeS9saWJub3RpZnlf
MC44LjIuYmLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICstCj4gwqBtZXRhL3Jl
Y2lwZXMtZ25vbWUvbGlicnN2Zy9saWJyc3ZnXzIuNTYuMC5iYsKgIHzCoMKgIDMgKy0KPiDCoG1l
dGEvcmVjaXBlcy1ncmFwaGljcy9idWlsZGVyL2J1aWxkZXJfMC4xLmJiwqAgfMKgwqAgMyArLQo+
IMKgLi4uL3hvcmcteHNlcnZlci94c2VydmVyLXhvcmcuaW5jwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoCAxOSArLQo+IMKgLi4uL2xpbnV4L2N2ZS1leGNsdXNpb25fNi4xLmluY8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDExICstCj4gwqAuLi4vbGlicG5nL2xpYnBuZ18xLjYu
MzkuYmLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMyArLQo+IMKg
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvbGlidGlmZi90aWZmXzQuNS4wLmJiIHzCoCAxMCArLQo+
IMKgLi4uL2xpYmdjcnlwdC9saWJnY3J5cHRfMS4xMC4yLmJiwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoMKgIDQgKy0KPiDCoC4uLi9yZWNpcGVzLXN1cHBvcnQvbGlieHNsdC9saWJ4c2x0XzEu
MS4zOC5iYiB8wqDCoCA0ICstCj4gwqBtZXRhL3JlY2lwZXMtc3VwcG9ydC9sejQvbHo0XzEuOS40
LmJiwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAzICstCj4gwqBtZXRhL3JlY2lwZXMtc3VwcG9ydC9z
cWxpdGUvc3FsaXRlM18zLjQxLjIuYmIgfMKgwqAgNyAtCj4gwqA0OCBmaWxlcyBjaGFuZ2VkLCA0
MDMgaW5zZXJ0aW9ucygrKSwgMzczIGRlbGV0aW9ucygtKQo+IMKgY3JlYXRlIG1vZGUgMTAwNjQ0
IG1ldGEvY29uZi9jdmUtY2hlY2stbWFwLmNvbmYKPiAKCg==


Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3644CCD199
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 14:29:47 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.55])
 by mx.groups.io with SMTP id smtpd.web10.20170.1760970586602044031
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 07:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=mUNZb8lA;
 spf=pass (domain: axis.com, ip: 52.101.83.55, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=momO6FjfKR9FJKXif9W9aGqw06kFCnYyPSE6sRIRdSWNA3s88BhQKiZE47YKxRz5yvLVD9V+CdUD4cW8+47WN75rhX3TeEredJDZVHpP5KD7oZborFJEcaRLaR1kmAIWHfwd8H/Hg6tG7DlCbLoaK81W3wodrLD9jTWk8BiwAI33xXars4ko6ZrNgdSDSqDXMRpsp0GYtxllhq/by7cHXhpNYJAURZql3c0j49UcvR6Rp/m5I2DOnJlRPUBRoIB0eyCLOsbbXy/GmiWF8P7mQ8UkcG0vCdzOWm4oEbGw0QrC/Bjk2v/mIQwk2egODYaJzP/smq0hJkKokNEgUm7LdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g2T3qz2zRVoxj1Bo+LllUT9mLLyI9qfF+X3MWp43XZw=;
 b=dooZwd4zi6rxTfknyQ1jXIdGjV/WC/K/NRNpz3VuSKSTT6INmHASSQKvmkvYBcCIl7yWel6D9WDh0xNGD//tOQc/L/eE26O2tqD4e43YkFxE4m7srwjf92u86QnP2BPCmlCu5BHwu5RXF+cM5J57NzWjUcvZbgSoUyqz23LQHjAtIjRMKW+/O9Xq/yEcn9o3HtndeR3Hef/DixZann1hThwFmY0W2+3PG8Aywc4zV/4fmiw0Dcek1wirz1OmtFtK9XiVt9dVW/+0gdAC/rx48O7zCe3D7N7RTnGVTEDAVTE1vL+3iLtgIhVeH1c/9Epa3P08sBwyKhuTwhJoRAQB3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g2T3qz2zRVoxj1Bo+LllUT9mLLyI9qfF+X3MWp43XZw=;
 b=mUNZb8lAb0AVOI+0xYOE8Rl/Qfr4n2OsO05R5RSHKzMfps1AKekSUqnOwZmKd8qwHII1avNyEWnuR5M+VJP09TKTMrhPFBq2iHMXvPuVS7VqF5lklZeL4hNjpJN8AUCJqE4/VlK97jltahGCPmZAHkcz7j+hK7qJOi6c9nF5fVM=
Received: from AS8PR02MB10201.eurprd02.prod.outlook.com (2603:10a6:20b:63d::6)
 by DU4PR02MB11213.eurprd02.prod.outlook.com (2603:10a6:10:5ef::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 14:29:42 +0000
Received: from AS8PR02MB10201.eurprd02.prod.outlook.com
 ([fe80::90d0:ca74:2479:bbdb]) by AS8PR02MB10201.eurprd02.prod.outlook.com
 ([fe80::90d0:ca74:2479:bbdb%3]) with mapi id 15.20.9228.014; Mon, 20 Oct 2025
 14:29:41 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, "Qi.Chen@windriver.com"
	<Qi.Chen@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH V3 1/2] base-passwd: add clock group
Thread-Topic: [OE-core][PATCH V3 1/2] base-passwd: add clock group
Thread-Index: 
 AQHcPnmAdYjh6ccYY0i71Eq0EjWAvLTEhk1wgAEgFYCAAQK0gIAD2teAgABxAQCAACd5QA==
Date: Mon, 20 Oct 2025 14:29:41 +0000
Message-ID: 
 <AS8PR02MB10201B124FC86278939293593EFF5A@AS8PR02MB10201.eurprd02.prod.outlook.com>
References: <20251016084700.1537381-1-Qi.Chen@windriver.com>
 <DB5PR02MB102130824E86A46D0A830FB03EFE9A@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <a7d6a359-5a4d-4314-939f-3fa97627bdc2@windriver.com>
 <CANNYZj8i4ksk_8kmDjswjA_pvQw-cCg_jOOCh47PYDu3TXw6Bw@mail.gmail.com>
 <6d4ae9fd-b708-4b22-a170-68af462a7b39@windriver.com>
 <CANNYZj9mm4MrgDbfep8m_EW=cFJP1wFrJ9HKHr5kX2gvGbq2ww@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9mm4MrgDbfep8m_EW=cFJP1wFrJ9HKHr5kX2gvGbq2ww@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR02MB10201:EE_|DU4PR02MB11213:EE_
x-ms-office365-filtering-correlation-id: 80ee7424-8ca7-4508-9245-08de0fe51b6e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?MTRtKzlaTHp4bzIzeU1OQnhGeFVkVWZUTzYrRmloa2NIY1RSVnhnc0lZZDdo?=
 =?utf-8?B?d25pZjFzYXFsZEFTRU42UkFCWU0vRVBJYTlGSUxWQVc2aXI1aFk0UUZBTXk2?=
 =?utf-8?B?cHF0ZG5HaGp2bzhPaWdQdHRHZzh3cjFsM3V5SDRlbTZwSGU1ZTJiL245MGZs?=
 =?utf-8?B?cVB3M2RyeW1zRWNkNkNJYms4YlJpQ1M1MnZUTkExVDFBbHZOUEQxZWRrQWZF?=
 =?utf-8?B?a3lqMVN6SWNKbUFNTG9jcHJRSlAzRXpaTk5yWVUzUWRBWVdLV2RkcDJwRE1L?=
 =?utf-8?B?bnpuM0JxQzBMS0I2NVNscHJGK3hhZ3dQMmFqcGx0OXJjOFZLL1NXOGRGTCtz?=
 =?utf-8?B?L01yOUhsclcvOG5DcHdDdkRMVjNIdzdQd0h6aGYvTGVjWjR0alc0QVE4bElV?=
 =?utf-8?B?bkx6a2s4eEV5cWMrM1FOdGlzMG9hK3QzcGorZ2JHWStQREJ4NjJwRng3SWJD?=
 =?utf-8?B?c3FvUmlIM01idzNYTUJONW1VbVdTdXg4SmRhYkREbStOdUZWZktPMHlMNTlq?=
 =?utf-8?B?Z0toWXdtYlp1Qy9hUFlMZStNelhCcXRXcDJFV0FUa2VJbUhhKzdaL1UybjRm?=
 =?utf-8?B?MFhIRTJXblB5WnIwOVJ5dU5GZGVkQUd5WjVrZnRSUlhRTHp3cWNhRVhybFJO?=
 =?utf-8?B?UWNzUm1Hd0J0c1R3VTQycHpDNk91ZVRJTUZZN3FqS0RVV3VZUy9nUk9jakFD?=
 =?utf-8?B?b0pCdEkrWjRTdUdDcFdRcXlkb2RZY1ZHdmxUb1U4My9zVmo1SEtxSmVJdWZi?=
 =?utf-8?B?c2hoZHhSOXdMU0JpZ1ZiMFdEbzhjTGJRSzh3MGo4SlBzN090clA5MmVDMWxB?=
 =?utf-8?B?SUloUmdVa1I4WjNmVUpCVjJ2cnM2Q1YxTVRDRWlQQmZrbDFROStRcUxwSG9N?=
 =?utf-8?B?WE9paDdoMjVNdVQyYkNmOW45ZytwelpCMXord0VCbU5YMmdITEVpZGVOajYw?=
 =?utf-8?B?dTBWanJ5bmxsWitWNGRDdGx0TTJFR3AzMUtaeFBXWHU3ektzcHdNS1VNTmRj?=
 =?utf-8?B?OVRWN2xVMEpmRGFubEpOMTZXZ2dVd0dnK1E2Q3dMLy9wZUoza3lzYTEvanhI?=
 =?utf-8?B?UzdCTHNHRXBZMFNxdVhNdktMUXlLZllUU1NvcHVYYjltR1l5UW8wMEY0RFYz?=
 =?utf-8?B?MVlVL3ZLRjZ4SDQwYTR5TXBZTmFEWGQzTytGVnFVMWlFbkxZam1jYlRzbERY?=
 =?utf-8?B?MU5Gbk9NTnJjR1ZYSzJhUTRrMGtHRkF1RkJ2ZWRCMlBCdGlBVk0xcGgxSnJV?=
 =?utf-8?B?Z2tiNURvYWlVdHBVNDR1SWpNNTE0QVBTajFGNktMWEpYL3FtVVJBMUFXWnNS?=
 =?utf-8?B?Sk90a1dBTU1OcStHNDVFQmhqaTB2bWh5S3BmN2pZT0lhT0xyS0dGNEloOURO?=
 =?utf-8?B?THo1UlN0VTFqbTlZVUhOdzhsSTBzc2JhbWpBSTZRYVBRL29hc2ZjcjJGbGxP?=
 =?utf-8?B?WHpVUVc2Rm43alk4VmxIUEVwMlk0S2Nuakd5MVJQcFl0RkJlQzBBWm5aR3Zv?=
 =?utf-8?B?QnBhckpEWW5TTkhVNmVGejFrYW9qWDVSUS9tZkFZOXNMUXNKWG81WlpzaE9z?=
 =?utf-8?B?aHZjMzdkRE02VHV5cC9MT0VaanpoaXF0UExCZ0t0VjNiQVZJUzE5N3NoSnQ4?=
 =?utf-8?B?cXoxMUZ0MXF5OHpxNUtJZFhHM1RnaGk0QlgzQXM1TStRNXpUb1ErWURpSWZy?=
 =?utf-8?B?ZXFsdXkzVE5OUlRjK0xUWFdpSUdIQ0ZiWnA3dkNxWE1MRmFkS09qR1dhTklJ?=
 =?utf-8?B?ZFRpSFk5QXcrNFMyZW1lUmVURWVGeHVBcmUzZjhsL2ZtN01nWnlQZ1VhaUZ3?=
 =?utf-8?B?aklmVEV3TklkbUtnYXhtQnNkbUJXbXJRc1lkZGtEYUxtcmNMOHh2aWYxM2Ry?=
 =?utf-8?B?ZjhkMm9pTlhwQ1VmYWdXNzU2TEFPUUErYnJwWGFTNHpNWWFoREtCT1llMUlL?=
 =?utf-8?B?d3RnbDNJNXE2bnRTYlRoRFh2Y1lCdzRVTm0vdHE2NFdzcmRTQmxsK2dmWVVx?=
 =?utf-8?B?am82RzdZcUZlT0creW0yMG5WTjVGWlVYSEtuUHlaSlgwS0FqUGYwV2ZyclFy?=
 =?utf-8?Q?gCixIR?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB10201.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NWo2UTBLQ0p2S3cyT3MvZGQ4azhBUnBrdnVhWkJZa2VFdDVMOXV0enE3Vnhy?=
 =?utf-8?B?SVk3b0NJajVQUWhzTHkzREV6VDEvOW9FdmRmc0Mxb0RialdxMkZwUERCSk1F?=
 =?utf-8?B?d1BySjV1SElFWEhOUHpnTE1kSnIxejQ0YWI3T0xHVy9yRWp4YW1LZ05yTVg2?=
 =?utf-8?B?cEFOVXoyTXdKbEpZOE1RNWVvaWU2NTUxazhrM3ZzbFk0YXNhQVlFc0lybmpM?=
 =?utf-8?B?bWEvNlFBUlpGVVcydTZidWxYTExFb1NnSGY2M1k4eVVLbmhlaUdvMTg0TWR0?=
 =?utf-8?B?Zk5GUjJVVDA2NlhLZTdLY21LUzg5T3lFQ1NwVWpONW9JYVFyZDJTVTdydzM2?=
 =?utf-8?B?eDRwUUV6SUhpVzdoZXN2Z0RCUXdMUWNIQXd0L0JjT1ZwVHlKNUJWWEE5dFBy?=
 =?utf-8?B?dXNNRW5TRyt0VDRZaEFQbGNpekNuTTJnbHIrZjUzdTg0VVZ4MVlzNGdVdG9v?=
 =?utf-8?B?NXg1YXp4Qm5xeEN4aHVUUCs2ZWdFbDZzNHhIWlJhVFNQeVlxSWJ0V3BrdzJC?=
 =?utf-8?B?UmlzRlUzT3pNRS9xQUNkMFpOVXAxcUpwNTZhbDRrT3BzeGlVWFBmK28xYUlz?=
 =?utf-8?B?VXpJWm1xRnRiTTdqMklzdXpwL3hLOC9XRERjUEMrQUFWV0FuUHhqYXV2KzBT?=
 =?utf-8?B?eFB5U0paK1N4UGlOM0NvaUFyV1YwczZIdEJ0SDN2bnZtaVVqeW1aM3FpOW5s?=
 =?utf-8?B?QnJEMXFEdnRhaHNBRUdrc2MrK1VMQVV5Y2h4SzNJOElNem1nUUNxZ3VlNGVU?=
 =?utf-8?B?Y1IyNU1oV1hrU29SNklpd21wbjRLK3lab28wWXlwNCtCa3ZjT0xsYlc1UUQw?=
 =?utf-8?B?UFJlck9UcWhET0RQOUZlN3NHdmFBMDBWODVQRGM4QTdzekpQVk1vby96a2dv?=
 =?utf-8?B?YXFwdERmNWZFTDNiS3NWQkdETDJab29IS0wyUUloR2lVbCtEMG5UcG1hNnNM?=
 =?utf-8?B?V0YrV1RzR21IcHpBR1lIejF5WGRnb0pCWTlwcjZpS3U4Q0ZzQ3kxOVI4ZlEr?=
 =?utf-8?B?cFJvZ1dsMlhNTnZPZlE3ZzU1RGJLZkZkSlVZTUFTam1YcStQUFQ3aDRURkwv?=
 =?utf-8?B?TFUyNUNzSCtTMmJVdjZuRWRQNVJCOTdYcEtjY2prbldXMkUzNXpBYW9wNUFN?=
 =?utf-8?B?QjBhOVdIaXJ5ZkgvcEhiOER5SlAwZTRJRGFmWTAyeVdnd0t2Q0N5aExpS3BH?=
 =?utf-8?B?MkxnMXVSTUVoY3pTWTNicURLTTJMd0xoVDRsVnZ6Q0VSWmN3THlYUEVYNUR3?=
 =?utf-8?B?cHc1WCtRc01nMlVpOXBCY3dIUnUzWUtiU0FaZldJSkdYYm1HVzFWMTU4RFRR?=
 =?utf-8?B?WXZTa3FHMlcwcjdlVlUxajVtaHl5alhERTdKc3M0SFpGK0F5d2lCSXBXZk1z?=
 =?utf-8?B?cmFJVnhqYU14LzRDMFB3NVJmT3ZOc0pvczFIcTNEeDVpNnJHSU9JbVJSSkNr?=
 =?utf-8?B?b1A2NzdoZnNqODdTTzNmWWI5QTJnUlg0UnFLVVhEUFV2amNPMnVMZlNqaURS?=
 =?utf-8?B?K3J3ODdyQTBvVCtKSGR3Y1c3VzFlc1lSQWdYbWw4N3BSK2l3YXNHak13TjVO?=
 =?utf-8?B?SUhUc09xdTVxcVB0S09VempJVGdnc0ZOdHFIdTg4ZGhJMjJWOHZRSTA4UlZl?=
 =?utf-8?B?MytYQjVUenZaaGZJN3U3L0hrOUFzb1RFZmRiYTdITU5NV083RDFZa1pYdmRv?=
 =?utf-8?B?eUpwdmZZMyszaDhZRytJR29vU2ZUYWx4YTZTL0Ewb1NyMHEzOVhpTmliQ3Rj?=
 =?utf-8?B?WEhSWG1CRHZMdUR3UVhFbmpSb1RQODFBUWlEeXJ1VzU4Z0dTSXRlNzIwTG9x?=
 =?utf-8?B?YVJMWFR4RS9ocU91SWk2bHllaEsvdUFSYTV4VnRBT0p0WEdTYldDbHVxVUJT?=
 =?utf-8?B?a1lYNFZSRlM4WHQ0UXVzVFVDZHFYUUpFazJJVXNVRldqVkN4NElKRXdlSHN3?=
 =?utf-8?B?ck1nY3hnU004cjJTN0NHMzRnOERPRVMwM2ZIdXc0TzZHZTlINHl3c1cwOEFT?=
 =?utf-8?B?SFFFNmV5Vit2T3ZtNWd1Zm04VlVmdmtQazFzRjBoejI4dFdQMDFEckljeTJT?=
 =?utf-8?B?dWpZR2xGSCtPWTRZZWRPRERsdSt5SldwbUsydz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB10201.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80ee7424-8ca7-4508-9245-08de0fe51b6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2025 14:29:41.4799
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lufw1VKwVYDYYurZlb30UQ3RCpqQzoZtvgRJfJswbI+AVRw32b5ZRAztQJAVSueo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR02MB11213
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 14:29:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225119

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleC5rYW5hdmluQGdtYWlsLmNvbT4NCj4gU2VudDogZGVuIDIwIG9rdG9iZXIgMjAyNSAxMzo1
OQ0KPiBUbzogUWkuQ2hlbkB3aW5kcml2ZXIuY29tDQo+IENjOiBQZXRlciBLamVsbGVyc3RlZHQg
PHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXVtQQVRDSCBWMyAxLzJdIGJh
c2UtcGFzc3dkOiBhZGQgY2xvY2sgZ3JvdXANCj4gDQo+IE9uIE1vbiwgMjAgT2N0IDIwMjUgYXQg
MDc6MTQsIENoZW4gUWkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPFFpLkNoZW49d2luZHJp
dmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gPiBJIGFsc28gY2hlY2tl
ZCBiYXNlLXBhc3N3ZCB1cHN0cmVhbSBhbmQgZGViaWFuOmxhdGVzdCBjb250YWluZXIuDQo+ID4g
YmFzZS1wYXNzd2QgdXBzdHJlYW0gZG9lcyBub3QgaGF2ZSBjbG9jayBncm91cDoNCj4gPiBodHRw
czovL3NhbHNhLmRlYmlhbi5vcmcvZGViaWFuL2Jhc2UtcGFzc3dkLy0vYmxvYi9tYXN0ZXIvZ3Jv
dXAubWFzdGVyP3JlZl90eXBlPWhlYWRzLg0KPiA+IEFuZCBkZWJpYW46bGF0ZXN0IGlzIHVzaW5n
IHN5c3RlbWQgMjU3Ljggc28gaXQgZG9lcyBub3QgaGF2ZSB0aGlzDQo+ID4gJ2Nsb2NrJyBncm91
cCBpc3N1ZSBub3cuDQo+ID4NCj4gPiBJJ2xsIHVzZSBnaWQgMTAzIGluIHBhdGNoIFY0IHRvIHN5
bmMgd2l0aCBmZWRvcmEgKHRob3VnaCBub3QgbmVjZXNzYXJ5KS4NCg0KU2luY2UgbW9zdCBvZiB0
aGUgb3RoZXIgZ3JvdXBzIHByb3ZpZGVkIGJ5IGJhc2UtcGFzc3dkIGFyZW4ndCBzeW5jZWQgDQp3
aXRoIEZlZG9yYSwgY2FuIHdlIHN0aWNrIHdpdGggdXNpbmcgSURzIDw9IDEwMCBmb3IgYmFzZS1w
YXNzd2Q/DQpJdCB3b3VsZCBhdCBsZWFzdCBtYWtlIG15IGxpZmUgZWFzaWVyIHNpbmNlIHdlIGhh
dmUgYWxyZWFkeSB1c2VkIGEgDQpodWdlIG51bWJlciBvZiBzdGF0aWMgSURzID4gMTAwLg0KDQo+
IA0KPiBUaGFua3MgZm9yIHRoZSByZXNlYXJjaC4gSSB0aGluayB5b3UgY2FuIHNpbXBseSBzZW5k
IHRoZSBwYXRjaA0KPiB1cHN0cmVhbSB0byBEZWJpYW4gdmlhIGEgcHVsbCByZXF1ZXN0Pw0KPiBo
dHRwczovL3NhbHNhLmRlYmlhbi5vcmcvZGViaWFuL2Jhc2UtcGFzc3dkLy0vbWVyZ2VfcmVxdWVz
dHMNCj4gDQo+IEFsZXgNCg0KLy9QZXRlcg0KDQo=


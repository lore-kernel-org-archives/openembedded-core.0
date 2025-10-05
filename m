Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0CC1CAC5B8
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 19:48:22 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.64])
 by mx.groups.io with SMTP id smtpd.web11.17472.1759693699210203232
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Oct 2025 12:48:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=Itn/l+hj;
 spf=pass (domain: axis.com, ip: 52.101.66.64, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bV9NoHvmHgDeG/WeGFKhwyzMJZiisZdIXCSJIwVjqoL41KoPUcT6AaDxb1SbfmtfIyiyYAKCefVZE1W95UkBqVg4w8pDbF5j+6eaOJII+XGlCX15phykpietuf6oTn7RHdTYMWsGKLMLcoq1snlUGkAPs2ExA9/ibTgxpVACKa0+3InV9EQDyqyGWcY5sszmnngxLoFekrdUi7EC4gzBQsfjYokqSTQrZKJOgHZ73ALyRkL4ULF7nvugkv8Y+Ue09ulN0CDAvn+PFEXX/RUutJEEBUO/LJhBJ5DZ5SCcS+qivUsOz1kjMq92/kzJmsf/nqKYw00CrIJutBcnYr5dOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pLEhKNUVVZA0XpUiFdAYpgFBfMcbVqISmKEv+aukljE=;
 b=E46dju6qwtZvXGB+K8QGRl1ShyyZXTVd47SWWiejMFglt5xXu8CkhBrWF6BjUtgWNlPlgIOLWMUxXxjX8qzW5zViGszO/yQQtFXmpQ3x6l/UatrpxUmEUkRMLyM3L/HnSYpypprUzgb0ncVW1wqi0XGgOfch2cvdvRpFeQbrnFSUwsV84/new/WzkwvYmtHPFi+yqE8hh33RxqUG/qHY3mhOx9KYVgUsXkq/5xfMdIezluRPv40KVMoSDEzhtMDcMyZFtPZCpZc8ad3bz4jsqaqolfzhq0U+Me3PsQdsMdSbL39SuRStGLruzSWJOBBEBfwgVHS0gRw+eWdT/1j9kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pLEhKNUVVZA0XpUiFdAYpgFBfMcbVqISmKEv+aukljE=;
 b=Itn/l+hjHBzsspgaGvdfHE+fBfKB4dmd0PX64laQXlTdoB6yNA5+bsGOq5+aOJXxtRxOMqKIMuOJOyxagO1ebh8ad+o4/SomsEymI5vz7vcXsKcuJJa/kg3ji5LbiowgwA8wxcXmYN1koi1DgwnBXS6MW2acavaXdjr0xIqk5V8=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS8PR02MB9020.eurprd02.prod.outlook.com (2603:10a6:20b:5ba::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Sun, 5 Oct
 2025 19:48:10 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%7]) with mapi id 15.20.9182.017; Sun, 5 Oct 2025
 19:48:10 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "skandigraun@gmail.com" <skandigraun@gmail.com>, Mathieu Dubois-Briand
	<mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Tom Geelen <t.f.g.geelen@gmail.com>
Subject: RE: [OE-core] [RFC PATCH] cargo_common.bbclass: use source
 replacement instead of dependency patching
Thread-Topic: [OE-core] [RFC PATCH] cargo_common.bbclass: use source
 replacement instead of dependency patching
Thread-Index: AQHcNKzpG43QQg/E2ke+h66wN5hvpbSzjQ2AgAACQICAAGi9UA==
Date: Sun, 5 Oct 2025 19:48:10 +0000
Message-ID: 
 <DB5PR02MB10213909407886D87CE7B4306EFE2A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20251003213000.2256939-1-skandigraun@gmail.com>
 <DDAF5YSSFJS8.2RCPLOVKYH00N@bootlin.com>
 <e6fb29a7-48da-4753-9bae-c9dd0bf55034@gmail.com>
In-Reply-To: <e6fb29a7-48da-4753-9bae-c9dd0bf55034@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS8PR02MB9020:EE_
x-ms-office365-filtering-correlation-id: c7d03f65-c41a-4bc1-8af6-08de04481d2e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Vm1oS2JERk9tTWxOZ3RoMDlzNENzUlVBV3pYcGpodFh3MzNqL3lIMVE2bHZV?=
 =?utf-8?B?cEN0WWhZN2l1dzkxVmxDaFpKVk9VNnNrUnI4c2huMEpyODZIc3FYU1huRkVm?=
 =?utf-8?B?bjNlaHZuemFyWjNLSzgzRUFhTkh4VEFmSnFWay85bmFGeEh6QjFLYW80RVZW?=
 =?utf-8?B?ZlQweThNYnQ4RitRbWgvOENhSVpkR29ZZlFrUFdPYXB1TEsxTUtHK1BqdUxX?=
 =?utf-8?B?ekwwWlFuTVpidE1NYUpEY0N6WTZ3N24rWmNKLzJjcXBpM1kwQUQwU0RFUnhX?=
 =?utf-8?B?OFhhdkhzM0grZmNGZEE3WU9VRGRlYmdOQkVPdndFVXh0cXN3bmZwbnE3Vnlz?=
 =?utf-8?B?UU9PUHVIeUdDNytvc2pDMUl1UDBBNnVSb05wODV0dFZ6MlNFVDJBWE4wYXJv?=
 =?utf-8?B?dXlrOW5QU3AyVUJPV1VHVUl6bldDNE44N081NWRPODhQR3pKVHRTV2hINnRp?=
 =?utf-8?B?WlJjZkNybzdkOWRZSEorRWsxdzlUOVlPVDBUQVNqN3I0TjQvU3NxQ3ErN1R1?=
 =?utf-8?B?UkNxakNuRTd5T0h6aXNRNS9qeEdFVitnTzZ0Ykgzc2sxMFU4aEVyend5ZkhF?=
 =?utf-8?B?MkVOcjB5Lzl3UU16bW1McHN3QnI4Tkd3aTIza2pMNVVyR0l1Sk9nQTBrQUpZ?=
 =?utf-8?B?ZlJEUnZPTkpXUE4wdXVZQjdMZndBYWE2RjQwUDM3dnVuV0FwWkdTdTlSSG5v?=
 =?utf-8?B?bjhZT2RSYTJRVUx1cS9jaWd5ZzhaRTVyaVNwenFsSjBtVWlMaHpTNktHWWhq?=
 =?utf-8?B?SXduYXpGMmY1TmNPNzNCZ1IvNUpzWHhDZDcyb1FtY0g5d0srRDZYL2xLRktP?=
 =?utf-8?B?VFdLWGtvSjIwWi8vSGFYOUgwKzVlcnFsMFdDWUMwUkJ4ZmpCSTlqQnYwYVpk?=
 =?utf-8?B?NEVKRzc3ekpuZlJLOVJxYlk0ekx3R2FXZ2o0bXJJSXJRMnQ5ekw3WS9scnhw?=
 =?utf-8?B?V09wNnN0cEpSeGZ4MDZJZzlGK1JwdnZDNnhzWkk5UVljbnZwTHdIZHptVFhv?=
 =?utf-8?B?UjE1c01EZ3hkSE45b1RxUUxsT3AzaVFUZ1NuS2pmMXl0U210NWVUelZyYnQ1?=
 =?utf-8?B?cDRhMU5xMWhIZHZqSSs3QmsvdWF6SVQrUFU1cWVXTUxJbSt5UjFqRXRtOFJJ?=
 =?utf-8?B?ZEFWdDhHTzlhYmh1UnVDOHBlTStpSEFtQjI0S0ZJV1JJTHhuektFTUZrMEZn?=
 =?utf-8?B?bkxCOTZPYWdqKzVyUkU4NUIycjdOUERWREVBUWdicU5INjJraTk2cFR6ZWVL?=
 =?utf-8?B?dWFPQ1hCRkxlazROUGhvaHhRZFk1ek1qNnpDWkFBTktncCtZbGdiTmRQNnIr?=
 =?utf-8?B?QWdiMEdYQXBTUGUxYmYxVG9TRm9ERUdsWkJYUHlpZlpoMGJ3eFZkMW80Zkg4?=
 =?utf-8?B?SERrRllNZEpCWmxsM3IwclpldlM3Z3RlRUZ5UzQ5d29yTVRISzBJNnlDcTlN?=
 =?utf-8?B?UFU5NFdvcG1rTWJ6Tm9CNzRXaTdDeXkwVXhzeS9maVJEeGp0YU5YaUtVN3My?=
 =?utf-8?B?QUpza3RBeEpHeU5adG0yOC9LclRkY29sZlV3U29ub3BwM2R2NnFQcGI5TThM?=
 =?utf-8?B?aE9LVFpvMTJJOHpMY1JaaE1BNGpIYTFNdGI4VnEwRjdsUzNoQmxhaG9WdVVU?=
 =?utf-8?B?Vy9tdjhTdnFueGlrNC9pUnNaWVRnQUVmVmo0RWkxeU81aDRGUE5mNEpZdnQ1?=
 =?utf-8?B?RC8zblF0TjQ4N3cvbVU0bmtPeE5oYmM2R0Z2UlNkN0hHQ0ttdjdydUp3UWNv?=
 =?utf-8?B?eHRGMzdjNDJVWnFPaGRtdWRHQXpNeE1PRWlBOFRUMzNhK2tSUERXYzd1WjIy?=
 =?utf-8?B?bXF2Mnc3aDFRSE0zK2ZmTE1URTV5YTZ1MG5RSUxIbmZlZlFjOUY0cUVoZmNX?=
 =?utf-8?B?cGduaVNjTUgrY001UDJnYnlFMVp4OE9QN3IxYXd3VDVWRWZ2NE5EZ25ybzN5?=
 =?utf-8?B?R2x5UHlPSE9XV2VYSDlwL1U2U0pTVFk0OXNSRXBCdDNEYlZuY3FORHdOMS8x?=
 =?utf-8?B?Q0tUSHlieHZnPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?N01CRWVSMjMxNjNoYStoRUlYT3dLaGlBclZqcnFxck1zbUZ3ZnNSSjlUOTFI?=
 =?utf-8?B?M21pRjN2ckczdHBxLytsQUozcXF2aEZOYi8yTU9ndStLQWxHNVF4d1VGUWdU?=
 =?utf-8?B?UENvSzBpNEF3TVhKVkpUTU5nTm45WDBJbjc5MUV3T1FOYkRFUEFvREhSRUV6?=
 =?utf-8?B?ZkgyOTk2S2R2K1ZMandMZW5MRHhBdTd4d3REMU01dWc0NEY1K1ViVWpybkc4?=
 =?utf-8?B?ZjNvT1BjTFh3RDJMWm0yZUdXMlY4b09UdXlnN3QrdlVoUE4vSFFFd1JtZnAw?=
 =?utf-8?B?Z1dXNFJHUjU3dFJlbnFhVitwUkk1ZmU5N2Y5VzNnYy9LOXA5Wit3cEFHa3pP?=
 =?utf-8?B?WGlhc2Z5dmZYZDloT094T0wycmJ2KzhHeFk1QzBzWHpUTWRxUzV5aXZLTGJT?=
 =?utf-8?B?cklWNDdzVzhPbGVwWWp4WmFEMyt6SjRzUjdwR3lUV2tMd2tVK04zcE5IVG5J?=
 =?utf-8?B?VHg0MEI0V2RLRDY2MWh3N0g5aDJVSGFDNWZZMTJwUE1HUG1lV1lNazNoN1Nr?=
 =?utf-8?B?a1BTdk5neHFaOFpKcm84bkU4MUZNcjd2aEpBNUxlWDk2ZkhoT2JYSENNWk56?=
 =?utf-8?B?THBSL3NidVE5QnVtL0d2VWxwMzRXT0xWTXZOWG14ejFoQXYyWXlaczJNbWZn?=
 =?utf-8?B?YkY5alFQS3l4RnVlMVpsNktuclZYVE8vWnlzTmgwc3l1bWQ4OHZabStONXlJ?=
 =?utf-8?B?ak1pTWJNZFlLVDdBUTZEV0RhZzM1aElSSmpZekd0VW9EakZNT3Q3bGxUQUZV?=
 =?utf-8?B?clE2VENFb0MvTDZ3dzUvQlVWbFNESGUzRjJpelFBMUM0RVUxcFJtNFQ4TGRD?=
 =?utf-8?B?b1JUdHMvSWZZbW9lbytabUpRSC96bUt2RHdwa3VwSUFqOHdvd1B6MzVJR3F5?=
 =?utf-8?B?UXR2YVZzTXpBYXFVbFhMM0JGQkVFWSthRXZOWUI3VWFtSUlHQjBUd0pheVlT?=
 =?utf-8?B?dmJQVHd1a3FMRVQ5dWtFWExTMUJCMXlxc1VkVFh5aWF5VENIWWordnRmYytm?=
 =?utf-8?B?ZDVuK2E2ZldqMXVpZWo5OFMwK1ZSNDFKU2VKdlRUcDZuUUxnYkdrenF1emY5?=
 =?utf-8?B?NitDcUdBckpscThxTTM0YlBtTXpiSVcxUlFGV3ZvL2VTS3g0WHZ6QzJ4VC9X?=
 =?utf-8?B?ZCtUdDJIWWNSSklNaXQyd1dmS0NhL09KMVF3Znd5cElVZzd1c1pSenloZXNm?=
 =?utf-8?B?OENPRlJDNXYzaVRyRkpFcU1hbFBNTnNJZzV2TmZFS3RvdVZlU2hlSmNaWWh0?=
 =?utf-8?B?V255V3dYR2NSSzhGM0QrVWxiSjQ1ajRzdU1PRFdpZUFuSm5MQUNuTTdocFdQ?=
 =?utf-8?B?dzkxYkxYMDlKS08yOS9BWW9SSG1oS2lHb3ZPVEZjT29PVE50TnJKYnNzTUpL?=
 =?utf-8?B?aENtb2luMkdYb0pYbml5dXFSd3R2aHJaMmV4eUVqSVJ4bEVDWE9UNEtpOStj?=
 =?utf-8?B?NDVwbHdFNlNhUWUveWkvS3dyOU5rN2l1cmxzSWJuRER1ZlV3bTRRM2pwRkM0?=
 =?utf-8?B?d1BZTkFxWitTR0V4TjJ2ZU9CVWJKVDlTM0p1cjN6dDV0REJYZTg2RjFmRUpy?=
 =?utf-8?B?OUFFeERkbFJYcHh1YnRXQ0xNdjRkbFcvVmkvaFpYRzd4MEwxWVVVdTA4OG81?=
 =?utf-8?B?TnE4dU9LcHpuZlFkTklxMGVscXB3a21Rem82MVNPYm5YUDVSQVlRWVBNclo4?=
 =?utf-8?B?eG54eGVvTFkxckpQRHRWaHY4aWtMWVh1UCtSam04ZnpzOG9JVWNKVWZjUXFy?=
 =?utf-8?B?ZjdtTGlUWklVdGduaHFQT3VxcHdDZ3EyY2lNc2pGb3lacFBBWVI2M2NvQ3Uz?=
 =?utf-8?B?Nmt3QjFTbGMvY3RyV0NhcHRqZWwyNkFkSVkyNGRWY2RkRkttMEpvUHF0ZGUz?=
 =?utf-8?B?eUNMV2lSdkJNYWthWDc4b2Z1NXozUUQvYnN5N2kyMDVWRzl5NmJZYkloaHlv?=
 =?utf-8?B?eU5ES3JwMVFzV0ttRHE2bUxVQ0FkTkxySDd4UmZ2YW1TTkRVdFErQkZmWU16?=
 =?utf-8?B?WnJ6WmVPVjBSRDZmRDFzcDJVM3BWNVdpblk3ODdtbXkwZkJSRDQwc0FqRERP?=
 =?utf-8?B?UVJIQW05d1V0MjBSMWVaaThjZnVBZUdTS05CQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7d03f65-c41a-4bc1-8af6-08de04481d2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2025 19:48:10.6920
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Or5+fvID7WJ32SW4nOASw6zbIPcrl208CsoLUa0ihiktPPgmthYCLvVVoOAeH/Vy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 19:48:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224441

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgR3lvcmd5IFNhcnZhcmkgdmlhIGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNCj4gU2VudDogZGVuIDUgb2t0b2JlciAyMDI1IDE1OjMxDQo+IFRvOiBNYXRoaWV1IER1
Ym9pcy1CcmlhbmQgPG1hdGhpZXUuZHVib2lzLWJyaWFuZEBib290bGluLmNvbT47IG9wZW5lbWJl
ZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gQ2M6IFRvbSBHZWVsZW4gPHQuZi5n
LmdlZWxlbkBnbWFpbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1JGQyBQQVRDSF0g
Y2FyZ29fY29tbW9uLmJiY2xhc3M6IHVzZSBzb3VyY2UgcmVwbGFjZW1lbnQgaW5zdGVhZCBvZiBk
ZXBlbmRlbmN5IHBhdGNoaW5nDQo+IA0KPiBPbiAxMC81LzI1IDE1OjIzLCBNYXRoaWV1IER1Ym9p
cy1CcmlhbmQgd3JvdGU6DQo+ID4gT24gRnJpIE9jdCAzLCAyMDI1IGF0IDExOjMwIFBNIENFU1Qs
IEd5b3JneSBTYXJ2YXJpIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiA+PiBD
YXJnby50b21sIGZpbGVzIHVzdWFsbHkgY29udGFpbiBhIGxpc3Qgb2YgZGVwZW5kZW5jaWVzIGlu
IG9uZSBvZiB0d28gZm9ybXM6DQo+ID4+IGVpdGhlciBhIGNyYXRlIG5hbWUgdGhhdCBjYW4gYmUg
ZmV0Y2hlZCBmcm9tIHNvbWUgcmVnaXN0cnkgKGxpa2UgY3JhdGVzLmlvKSwgb3INCj4gPj4gYXMg
YSBzb3VyY2UgY3JhdGUsIHdoaWNoIGlzIG1vc3Qgb2Z0ZW4gZmV0Y2hlZCBmcm9tIGEgZ2l0IHJl
cG9zaXRvcnkuDQo+ID4+DQo+ID4+IE5vcm1hbGx5IGNhcmdvIGhhbmRsZXMgZmV0Y2hpbmcgdGhl
IGNyYXRlcyBmcm9tIGJvdGggdGhlIHJlZ2lzdHJ5IGFuZCBmcm9tIGdpdCwNCj4gPj4gaG93ZXZl
ciB3aXRoIFlvY3RvIHRoaXMgdGFzayBpcyB0YWtlbiBvdmVyIGJ5IEJpdGJha2UuDQo+ID4+DQo+
ID4+IEFmdGVyIGZldGNoaW5nIHRoZXNlIGNyYXRlcywgdGhleSBhcmUgbWFkZSBhdmFpbGFibGUg
dG8gY2FyZ28gYnkgYWRkaW5nIHRoZSBsb2NhdGlvbg0KPiA+PiB0byAkQ0FSR09fSE9NRS9jb25m
aWcudG9tbC4gVGhlIHNvdXJjZSBjcmF0ZXMgYXJlIG9mIGludGVyZXN0IGhlcmU6IGVhY2ggZ2l0
IHJlcG9zaXRvcnkNCj4gPj4gdGhhdCBjYW4gYmUgZm91bmQgaW4gdGhlIFNSQ19VUkkgaXMgYWRk
ZWQgYXMgb25lIHNvdXJjZSBjcmF0ZS4NCj4gPj4NCj4gPj4gVGhpcyB3b3JrcyBtb3N0IG9mIHRo
ZSB0aW1lLCBhcyBsb25nIGFzIHRoZSByZXBvc2l0b3J5IHJlYWxseSBjb250YWlucyBvbmUgY3Jh
dGUgb25seS4NCj4gPj4NCj4gPj4gSG93ZXZlciBpbiBjYXNlIHRoZSByZXBvc2l0b3J5IGlzIGEg
Y2FyZ28gd29ya3NwYWNlLCBpdCBjb250YWlucyBtdWx0aXBsZSBjcmF0ZXMgaW4NCj4gPj4gZGlm
ZmVyZW50IHN1YmZvbGRlcnMsIGFuZCBpbiBvcmRlciB0byBhbGxvdyBjYXJnbyB0byBwcm9jZXNz
IHRoZW0sIHRoZXkgbmVlZCB0byBiZQ0KPiA+PiBsaXN0ZWQgc2VwYXJhdGVseS4gVGhpcyBpcyBu
b3QgaGFwcGVuaW5nIHdpdGggdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gb2YgY2FyZ29fY29t
bW9uLg0KPiA+Pg0KPiA+PiBUaGlzIGNoYW5nZSBpbnRyb2R1Y2VzIHRoZSBmb2xsb3dpbmc6DQo+
ID4+IC0gaW5zdGVhZCBvZiBwYXRjaGluZyB0aGUgZGVwZW5kZW5jaWVzLCB1c2Ugc291cmNlIHJl
cGxhY2VtZW50ICh0aGUgcHJpbWFyeSBtb3RpdmF0aW9uIGZvcg0KPiA+PiAgIHRoaXMgd2FzIHRo
YXQgbWF0dXJpbiBzZWVtcyB0byBpZ25vcmUgc291cmNlIGNyYXRlIHBhdGNoZXMgZnJvbSBjb25m
aWcudG9tbCkNCj4gPj4gLSB0aGUgYWJvdmUgYWxzbyBhbGxvd3MgdG8ga2VlcCB0aGUgb3JpZ2lu
YWwgQ2FyZ28ubG9jayB1bnRvdWNoZWQgKHRoZSBvcmlnaW5hbCBpbXBsZW1lbnRhdGlvbg0KPiA+
PiAgIGRlbGV0ZWQgZ2l0IHJlcG9zaXRvcnkgbGluZXMgZnJvbSBpdCkNCj4gPj4gLSBpdCBhZGRz
IGEgbmV3IGZvbGRlciwgY3VycmVudGx5ICR7VU5QQUNLRElSfS95b2N0by12ZW5kb3JlZC1zb3Vy
Y2UtY3JhdGVzLiBEdXJpbmcgcHJvY2Vzc2luZw0KPiA+PiAgIHRoZSBzZXBhcmF0ZSBjcmF0ZSBm
b2xkZXJzIGFyZSBjb3BpZWQgaW50byB0aGlzIGZvbGRlciwgYW5kIGl0IGlzIHVzZWQgYXMgdGhl
IGNlbnRyYWwNCj4gPj4gICB2ZW5kb3JpbmcgZm9sZGVyLiBUaGlzIGlzIG5lZWRlZCBmb3Igc291
cmNlIHJlcGxhY2VtZW50czogdGhlIGZvbGRlciB0aGF0IGlzIHVzZWQgZm9yDQo+ID4+ICAgdmVu
ZG9yaW5nIG5lZWRzIHRvIGNvbnRhaW4gdGhlIGNyYXRlcyBzZXBhcmF0ZWx5LCBvbmUgY3JhdGUg
aW4gb25lIGZvbGRlci4gRWFjaCBmb2xkZXINCj4gPj4gICBoYXMgdGhlIG5hbWUgb2YgdGhlIGNy
YXRlIHRoYXQgaXQgY29udGFpbnMuIFdvcmtzcGFjZXMgYXJlIG5vdCBpbmNsdWRlZCBoZXJlICh1
bmxlc3MgdGhlDQo+ID4+ICAgZ2l2ZW4gbWFuaWZlc3QgaXMgYSB3b3Jrc3BhY2UgQU5EIGEgcGFj
a2FnZSBhdCBvbmNlKQ0KPiA+PiAtIHByZXZpdW9zbHkgdGhlIFNSQ19VUkkgaGFkIHRvIGNvbnRh
aW4gYSAibmFtZSIgYW5kIGEgImRlc3RzdWZmaXgiIHBhcmFtZXRlciB0byBiZSBjb25zaWRlcmVk
DQo+ID4+ICAgdG8gYmUgYSBydXN0IGNyYXRlLiBUaGUgbmFtZSBpcyBub3QgZGVyaXZlZCBmcm9t
IHRoZSBDYXJnby50b21sIGZpbGUsIG5vdCBmcm9tIHRoZSBTUkNfVVJJLg0KPiA+PiAgIEhhdmlu
ZyBkZXN0c3VmZml4IGlzIHN0aWxsIG1hbmRhdG9yeSB0aG91Z2guDQo+ID4+DQo+ID4+IFRoZSBj
aGFuZ2UgZG9lcyBub3QgaGFuZGxlIG5lc3RlZCB3b3Jrc3BhY2VzLCBvbmx5IHRoZSB0b3AgbGV2
ZWwgQ2FyZ28udG9tbCBpcyBwcm9jZXNzZWQuDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IEd5
b3JneSBTYXJ2YXJpIDxza2FuZGlncmF1bkBnbWFpbC5jb20+DQo+ID4+IENjOiBUb20gR2VlbGVu
IDx0LmYuZy5nZWVsZW5AZ21haWwuY29tPg0KPiA+Pg0KPiA+PiAtLS0NCj4gPiBIaSBHeW9yZ3ks
DQo+ID4NCj4gPiBJIGtub3cgdGhpcyBpcyBqdXN0IGFuIFJGQywgYnV0IEkgc3RpbGwgdG9vayBp
dCBmb3IgYSBydW4gb24gdGhlDQo+ID4gYXV0b2J1aWxkZXIuIEl0IGxvb2tzIGxpa2UgaWQgZG9l
cyBicmVhayBydXN0IGJ1aWxkOg0KPiA+DQo+ID4gRVJST1I6IHJ1c3QtbmF0aXZlLTEuOTAuMC1y
MCBkb19jb25maWd1cmU6IEVycm9yIGV4ZWN1dGluZyBhIHB5dGhvbiBmdW5jdGlvbiBpbiBleGVj
X2Z1bmNfcHl0aG9uKCkgYXV0b2dlbmVyYXRlZDoNCj4gPg0KPiA+IFRoZSBzdGFjayB0cmFjZSBv
ZiBweXRob24gY2FsbHMgdGhhdCByZXN1bHRlZCBpbiB0aGlzIGV4Y2VwdGlvbi9mYWlsdXJlIHdh
czoNCj4gPiBGaWxlOiAnZXhlY19mdW5jX3B5dGhvbigpIGF1dG9nZW5lcmF0ZWQnLCBsaW5lbm86
IDIsIGZ1bmN0aW9uOiA8bW9kdWxlPg0KPiA+ICAgICAgMDAwMToNCj4gPiAgKioqIDAwMDI6Y2Fy
Z29fY29tbW9uX2RvX3BhdGNoX3BhdGhzKGQpDQo+ID4gICAgICAwMDAzOg0KPiA+IEZpbGU6ICcv
c3J2L3Bva3lidWlsZC95b2N0by13b3JrZXIvZ2VuZXJpY3g4Ni02NC9idWlsZC9tZXRhL2NsYXNz
ZXMtcmVjaXBlL2NhcmdvX2NvbW1vbi5iYmNsYXNzJywgbGluZW5vOiAxODIsIGZ1bmN0aW9uOiBj
YXJnb19jb21tb25fZG9fcGF0Y2hfcGF0aHMNCj4gPiAgICAgIDAxNzg6ICAgIGxvY2tmaWxlID0g
ZC5nZXRWYXIoIkNBUkdPX0xPQ0tfUEFUSCIpDQo+ID4gICAgICAwMTc5OiAgICBpZiBub3Qgb3Mu
cGF0aC5leGlzdHMobG9ja2ZpbGUpOg0KPiA+ICAgICAgMDE4MDogICAgICAgIGJiLmZhdGFsKGYi
e2xvY2tmaWxlfSBmaWxlIGRvZXNuJ3QgZXhpc3QiKQ0KPiA+ICAgICAgMDE4MToNCj4gPiAgKioq
IDAxODI6ICAgIGxvY2tmaWxlID0gbG9hZF90b21sX2ZpbGUobG9ja2ZpbGUpDQo+ID4gICAgICAw
MTgzOg0KPiA+ICAgICAgMDE4NDogICAgIyBrZXkgaXMgdGhlIHJlcG8gdXJsLCB2YWx1ZSBpcyBh
IGJvb2xlYW4sIHdoaWNoIGlzIHVzZWQgbGF0ZXINCj4gPiAgICAgIDAxODU6ICAgICMgdG8gaW5k
aWNhdGUgaWYgdGhlcmUgaXMgYSBtYXRjaGluZyByZXBvc2l0b3J5IGluIFNSQ19VUkkgYWxzbw0K
PiA+ICAgICAgMDE4NjogICAgbG9ja2ZpbGVfZ2l0X3JlcG9zID0ge30NCj4gPiBGaWxlOiAnL3Ny
di9wb2t5YnVpbGQveW9jdG8td29ya2VyL2dlbmVyaWN4ODYtNjQvYnVpbGQvbWV0YS9jbGFzc2Vz
LXJlY2lwZS9jYXJnb19jb21tb24uYmJjbGFzcycsIGxpbmVubzogMTM3LCBmdW5jdGlvbjogbG9h
ZF90b21sX2ZpbGUNCj4gPiAgICAgIDAxMzM6ICAgICAgICBjYXJnb190b21sX3BhdGggPSBvcy5w
YXRoLmpvaW4ocGF0aCwgJ0NhcmdvLnRvbWwnKQ0KPiA+ICAgICAgMDEzNDogICAgICAgIHJldHVy
biBvcy5wYXRoLmV4aXN0cyhjYXJnb190b21sX3BhdGgpDQo+ID4gICAgICAwMTM1Og0KPiA+ICAg
ICAgMDEzNjogICAgZGVmIGxvYWRfdG9tbF9maWxlKHRvbWxfcGF0aCk6DQo+ID4gICoqKiAwMTM3
OiAgICAgICAgaW1wb3J0IHRvbWxsaWINCj4gPiAgICAgIDAxMzg6ICAgICAgICB3aXRoIG9wZW4o
dG9tbF9wYXRoLCAncmInKSBhcyBmOg0KPiA+ICAgICAgMDEzOTogICAgICAgICAgICB0b21sID0g
dG9tbGxpYi5sb2FkKGYpDQo+ID4gICAgICAwMTQwOiAgICAgICAgcmV0dXJuIHRvbWwNCj4gPiAg
ICAgIDAxNDE6DQo+ID4gRXhjZXB0aW9uOiBNb2R1bGVOb3RGb3VuZEVycm9yOiBObyBtb2R1bGUg
bmFtZWQgJ3RvbWxsaWInDQo+IA0KPiBUaGFua3MgYSBsb3QgZm9yIHRlc3RpbmcuDQo+IExvb2tz
IGxpa2UgSSBnb3QgdG8gdGFyZ2V0IG9sZGVyIFB5dGhvbiB2ZXJzaW9ucyB0aGFuIDMuMTEuLi4g
aXMgMy45IHRoZQ0KPiBvbGRlc3QgdGhhdCBpcyBzdGlsbCBzdXBwb3J0ZWQ/DQoNClllcyAoc2Vl
IHNhbml0eS5iYmNsYXNzKS4NCg0KPiANCj4gPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJv
amVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy80L2J1aWxkcy8yNTI4DQo+ID4gaHR0cHM6Ly9h
dXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvOS9idWlsZHMv
MjUwNQ0KPiA+IGh0dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8j
L2J1aWxkZXJzLzYvYnVpbGRzLzI1NDMNCj4gPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJv
amVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy8yMC9idWlsZHMvMjQ5Nw0KPiA+DQo+ID4gVGhh
bmtzLA0KPiA+IE1hdGhpZXUNCj4gPg0KDQovL1BldGVyDQoNCg==


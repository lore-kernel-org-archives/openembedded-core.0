Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE12C369DC
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 15:22:04 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.44])
 by mx.groups.io with SMTP id smtpd.web11.1163.1745940117749343499
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 08:21:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=Hoh5M+Pv;
 spf=pass (domain: ericsson.com, ip: 40.107.105.44, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vzuDmn4sithCNW91YWfsDhByBr/GeiDomPbT896EhQOa8bINA0/zcFAFUqkMUd8E3/ZuumgQf3qjomr/dd5Kxe3SJkrcKe/4o+LP9sRwD/pjsc0TBum7iuey24fGvuTasKjlRvN5cSXZnJhAlX7L5wFx1q+pGGaCe9/eTbk75LMBUbWlQq+l7gKxsOoubPz8ZxQm4EnHpD0Y2QC1kZytL00YVtp7Dbw46aWHzTyc2cmVjW0imZv0nH1XzlDYl1qRKAxJVnYcrY4w4JOffznUGrgwjokd40YEisSn6o9mtmtvWlcywipFFnnpAjSzFJ8Is6ZcLYs/yijPHxQKY3BWBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8AvbW/UJUxANrGHhpPzhSIQHeYaGDpcHq1aKz0saMLU=;
 b=VvTyjfWwV/YD4Yz5f1do0cxBze4Fg8lKiRS32PTMB9F5tqDlkFdDyRRUaKZM7cXCQy/w6Pz+gGLN9cJlfTEgeRQUPnvPVZJHc/ji+6xc+kVrR68m0la1Zqtjp61BWUwV1NIZo6mdFsjiBur04axqM7tewOsfUBswSCixFuE9pQX2wyLxwDJWlpsPZIAHYNkLo6MgOAehlYzrOEZmMiwZzukQX4UXCaY8cAmd7rSlWvlGR6Ezf3+VQFjwXLWbgIvv+i6pwDXLEAVSoGAi7/tkbLxwUVWOz1497TCt1smObgaV0zISODA/ou9fXU8Oy93L8XG66rnEJr5j61frBUGt3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8AvbW/UJUxANrGHhpPzhSIQHeYaGDpcHq1aKz0saMLU=;
 b=Hoh5M+Pv8jMp2nEYx69d9y1jEANVa1EsUYV4xw9ctwaflRcfNV/Ak+SP2Y9GT74xA5Zgh8Pra4Hk2Jgn1Bbwq9Qi9OidMzHBV6bX2/ir/X4fCK3jsrlvHF6urLxqL5DaRx7vFZt+aqzocsBZmlLLxSgeEbUIzf5EdsxPMbPhuyjvSePnRpDDahbfv3xKqZ9e3bkTdwfs+J+YUKTz+fAOCE9JHVPZ5V0fiPTVDW9xaAFqgR3YsuT431p6jVRwM0FqcJydh/RdJwtsqlYcpNV8WWjaZC5PL40cKnn8K/4nwNKcQ/Wax9ur+Hxr1zByTfEbXyNSdz7TM8plGwgV+7M7+A==
Received: from PR3PR07MB6666.eurprd07.prod.outlook.com (2603:10a6:102:61::16)
 by AS8PR07MB8944.eurprd07.prod.outlook.com (2603:10a6:20b:53c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 15:21:52 +0000
Received: from PR3PR07MB6666.eurprd07.prod.outlook.com
 ([fe80::548a:adf1:280d:283b]) by PR3PR07MB6666.eurprd07.prod.outlook.com
 ([fe80::548a:adf1:280d:283b%3]) with mapi id 15.20.8699.012; Tue, 29 Apr 2025
 15:21:52 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Peter.Marko@siemens.com" <Peter.Marko@siemens.com>
Subject: RE: [OE-core] [PATCH v3 1/8] linux-vulns: fetch kernel.org CNA info
Thread-Topic: [OE-core] [PATCH v3 1/8] linux-vulns: fetch kernel.org CNA info
Thread-Index: AQHbuRR4GTBdgb7Ti0iECNWcGrS9D7O6t/KAgAAB7AA=
Date: Tue, 29 Apr 2025 15:21:51 +0000
Message-ID: 
 <PR3PR07MB666632E36F8CC1E8EE14AF258A802@PR3PR07MB6666.eurprd07.prod.outlook.com>
References: <20250429143904.634082-1-daniel.turull@ericsson.com>
	 <20250429143904.634082-2-daniel.turull@ericsson.com>
 <f15f7db2297bcd53287699582e960fb29b919fd8.camel@linuxfoundation.org>
In-Reply-To: 
 <f15f7db2297bcd53287699582e960fb29b919fd8.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3PR07MB6666:EE_|AS8PR07MB8944:EE_
x-ms-office365-filtering-correlation-id: 73c53ca3-13e0-41aa-23a4-08dd87319171
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?LzZSUkZEMnErS1JZY2N2WlN4ZHZXZGhnWGZJWVhadWxtaXYvaXdCMy9qNm1E?=
 =?utf-8?B?VUxCT2VXU2VDWDJXQ2FPMWp2UUxIK25aUzdCVFNvWFkvS3Y5RGJ1cWtXeXhH?=
 =?utf-8?B?a212WHZmeWdwV3QxaXZXVDFlOWZ3Rkl0blZpbXFtUllmQ3RhbS9mZndHOXlo?=
 =?utf-8?B?VjQvb2V0RDM4T1B1ZGRMeWQ5QjVKd3R6OUFiS3NCeUJIQktyUnhNOElJeUxx?=
 =?utf-8?B?YmREWWxGY3dDN25tc0piUUVhelFrOXN2blhKek90dVFOTUhOcHhSQ1Q1VnEr?=
 =?utf-8?B?YkZrMWIrTFJWYVR3VDFaL2lWSmRjK2NMc0N1TFRzbVN3YU5oanVHSWRNcjJ4?=
 =?utf-8?B?OGpnQy9iZkUyNEtmMy92eC9BNU9UckNjc3dSVDRNRTlVMk9Fbkk3Qmsyc0FX?=
 =?utf-8?B?dEV5R2M5WndGTmRKL2dOQW9FMkZ5M0JMQm9UaWc1UTltUGYrWS83eTQ4aHlY?=
 =?utf-8?B?SURRSlB0S1c4bXJOV25ZOEh1eDd2Y05NMU9wUHJZOTUwY3diWm5Ec1JITVJ5?=
 =?utf-8?B?VXVubVNRdlNoeHh5WG9sQjNyRWliL2prclBPVGhTTS9oK1RpOEhGbS95Wldk?=
 =?utf-8?B?QVJZemRheHRDM0Z3TzF6aW9aY0lhOE42Mnc0czVzM2phdE4wNkRLY1NUcC90?=
 =?utf-8?B?cXBvYkZnU0RydWhDUUxqMFBhYzBHak54SUVueXBhRkgxY21RMC9wWG9seGR2?=
 =?utf-8?B?THMrM3MrZmRwQU9nSGVYTmZvT2NGRVhVOE5UN0RranE0cUxEekp4eUxVY3hI?=
 =?utf-8?B?MXBVSWp2SXJtd0diSkJjRHgrUW96cjhQSHFCWkIxaDUvTm8zanhITmZnWWs3?=
 =?utf-8?B?NHhoVVRiTXBUZzF1VytHdEJqUXdGQjJLQ0g1UHFOZmNmQkFmMnV0b05vTURO?=
 =?utf-8?B?WmVUdVF3b1h1Q0RpQXEraU1Ta21XeGtYSXliWVU4TnNuc29zVkpBeGJuOU9Z?=
 =?utf-8?B?ajk1Yi9LVUhoOTk1K3V2emxnZFNBbFV3eXpybmJOZVMvaVFhejBCNWR1ck5C?=
 =?utf-8?B?Ynk3cVU4b2c3YTdlR1pxV0xJWTFrbDlaSWlFNVRGSUhocWlveUpjU01xWUNi?=
 =?utf-8?B?Tko2TS9VckdSdGVWVm45NlNxREdabmpiWW16SXNhZmRnNVNqNS9rTzRleE5m?=
 =?utf-8?B?VTcxVm1hRkwrT2tSbEU1YWYvWUxLaml4YWxySUhIR2dWRUdVTWI1WjZsNzlF?=
 =?utf-8?B?RU9RT2R0bUtkb2JNZFVaZXJyak5pVmx2RmFMSTBwUGkwT1RMVDlUbHhQVWtB?=
 =?utf-8?B?SW1wVVlUYTZmdE1mZm9mRHQ5cVF6dGxuZzhQUzc4OUlZQXFYem50MHhRYk13?=
 =?utf-8?B?S2dsNU1zTjgyK3ZtTjF3RmM2elEvTEV3UU9Ra3Z6bk00Tjh2WmtZdE1JNkU2?=
 =?utf-8?B?OTZSS3FZVGx0aVVuMGt3R2pqSEdkZFgzUUhmQ3Y1dEErZzI1MWZ3dkx3QWJn?=
 =?utf-8?B?SzNuTEt0d2hFQS9zYVBhTlByL2N6ZkIyRTV5OE9RL0pBWUJmMXIybEVFc3li?=
 =?utf-8?B?eWlwL3BualE3TXk3RVFvNXZVZTFhTHZDM1Vzc2JVZkNXQ1JRdHJTbjEySWZt?=
 =?utf-8?B?M2JDTDdLNktMWTlHVFY5OGFJUU5nRW5zLy95dU9Ld3dlUlZCQlRHRUFDT3Y1?=
 =?utf-8?B?QWhUb2dnTzNWNC9mOXIwMC8zL2dLaTloSWcyUDlrdUlvZVZPSG5ML1FaWmpu?=
 =?utf-8?B?RC9jYkErd1Fkb29aRWxCMjNZV3BkM0VnbjE1OWdNbm1ZKy9LYnhkemozR3pD?=
 =?utf-8?B?aTVMRkxkYXYwU2dINkh5Q1E4QzJzRmxjVklsaUFWTUVrQVZKRXQraGRKayt1?=
 =?utf-8?B?alJFcXkwT01hNkVVSXBSUGNkNW1iZ0JZaEFRRjZNSDF0d29UVExiMzAraXM2?=
 =?utf-8?B?cmwwdVBtVWwyUW84UWk0THZSZVJVVXZCZ2hTL295NllRVnM1MVJpT2tIVWdL?=
 =?utf-8?B?VEtucWFyMnFMeUFBQjlNZ1pRd0djT1JOZEdUVUFhbUwvS1pvaU5UcnpvZ3Z3?=
 =?utf-8?B?RzE4UFFqRWJRPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR07MB6666.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VWZ6dldjNlZFVjdvQTJsUTFtUjhxd2dITVVZSzBOZmtwbGNpTjJnNDI0Q1dN?=
 =?utf-8?B?N1BJb0tUQ2gzNUZnMlVOdzZ5UDJDUm81THUvMmxmYzBoUmkwU2Z0bm9mM2Q4?=
 =?utf-8?B?RWIzTVM2V1dZMDIvYmFIZm01UktQZEh2ajNCSlk1dVpSa0pyd2Z6TFBvWkVs?=
 =?utf-8?B?dHp3TkJUVUZ3UWFIcm9zZWVqSXlrYkNDaE0zb3doTCs5WWxZeVNCMm1oM2Rw?=
 =?utf-8?B?bTM2a1RvYTFtOXhFMmVpNDQ0aERRbmxmdkg2WlpJRDVlWTF1VWs4UzBBZGV3?=
 =?utf-8?B?aXF1V2Q3djZTcUtDVlhqUTVVanF1dERnRTRyb1NhVmdtTEtyaUlrMUpJT0du?=
 =?utf-8?B?QW9pRXZIOVVKVmpnWWlDcUdOZHo3RWVHa2swakl2Qzl4NnlqYnJuem1YRkdM?=
 =?utf-8?B?bWhINUtHY2tJNWlzYlI4Uzd0TmFENDNiZzV3SlJoT1RjV1BNd3N6SzFLMS9q?=
 =?utf-8?B?Z1JrUXRzaFJKTVZKOVppaHhyeHBaY2lpMTZsKzRpdmJUcmlVbHpJeGlSVW0x?=
 =?utf-8?B?a1Q0Ulh5VnVXdUtJMkZKd0ZxNVZFSXRGdmZOKzNIMTlISW5KWGRVVStadEJN?=
 =?utf-8?B?K28rbE90UktUVmxoRTgvWWpSM0oyaUpzOVRBemFmbkU4eG1yTGl1Rm5qWnlo?=
 =?utf-8?B?ZWUxR0dTeWY1UlN1c3lHYlpXWmlUT1o1eVozS2FWWWo2UjFkOGJoSVNzNjEy?=
 =?utf-8?B?VWN1ZXQwd3RnU0hPekx3dWVGT25TaGdVYnhVUUtad1ZHQm1oZWI1anRHUE9m?=
 =?utf-8?B?TjRRWWJ3RGtUVzVOa1hsaFpwK1pDczMvR00rV0hQNmh3ZDlYdzBDR0U5K1Vy?=
 =?utf-8?B?bmF0Z2NOY1ZYR3VoR1Exd3RyR0plVzhTMEt1L3dFQnZYdHZEb2NONTZobGZt?=
 =?utf-8?B?MGhDUkFSYlBGbnVUSldZdUhFczNWWmhkQi9JNUlkVDBFWFRBVytvQTBHeS8x?=
 =?utf-8?B?eFZ0VndmTXNSV0dGWDJMcFpBVkFEd1hWVUMvZHRwUVowYm81UW4vNW4ySFhi?=
 =?utf-8?B?Z2tGSUtpbitPQU0xRHdqYjE1bzZERmhZU0lMc0lwZUd3NlVlbGhoa0p0ZjE1?=
 =?utf-8?B?L1VtY2hWbHR4U0dDQXlkOVlGL1l2NXVQSk5jbWx5c0w4emZvNHFrNmFZZmZG?=
 =?utf-8?B?VENqMGF1RC8yYjNaQ3FYaFZuTlBTZU40M21JbEI4am1QaWJ3VlozdVBRU1Q2?=
 =?utf-8?B?M3hxaEo1ZFNNVHB2dnd0bFlqcUZsMjZWbE81eFBPK3FVTWJwOXhwTGFjT2dX?=
 =?utf-8?B?L2VYTEVxK1VYVkMycHdBS01LVXBqWkg2V3hLdjBOWGEyVWVNd1l1UmE2aXo2?=
 =?utf-8?B?SmxNZFhoNmJwb0kzTHprRDNpaCticHJ2UmgvSzRRMDFxZGZ4ODlJdWFBMnZD?=
 =?utf-8?B?Q1RsaWJ6c2hINSt2Mi9qYUpxV0lZK3Y4VklUQTE5SGgyTjFYZmY1V3FZWFBq?=
 =?utf-8?B?ZiswdG9KMkdHZmxXR0lXVU9qRGJydjdzcTduUklZMDdGSW5JTHpyczNuMDN4?=
 =?utf-8?B?VkZZNHk2empxcmhSQ3lwblRZWlROUmJ4VHBxMUVheUMvd1JQRTlXTlY1dnlw?=
 =?utf-8?B?TDVxajZuL0ZWK2VQQTQwRmVSL3cyQ2pzUmE5dlo0bFRXTGl5MmxmQ3ZzeTgy?=
 =?utf-8?B?NXg3TllreXVtSVhhRTROaGxQbnNHMEkvUWZ4ekVaOEZkK21LL0dXS0JQVnlZ?=
 =?utf-8?B?TXZKcFBYMm5FVmxwMFUwSHpLeUZYTlIybU5IeVFxV0wzUGJ4b3N1alpVaDZv?=
 =?utf-8?B?KzdROHpqeVU1UU82cFY4OGhqbGlDeGhxaFoyRlBEWVlCZHY2eTlOdkFyMFly?=
 =?utf-8?B?R0FvcFNKYTEyNWlCVjBnclhsZ0NiREFDQk1UR09xYUJSd3h1Qmh6Sm5SSDNq?=
 =?utf-8?B?QURTcko0a28yRVZrUXlBZ3N4Z2w3YlN6aWlrcW5hYlAwdC83Ky96YVdMT01x?=
 =?utf-8?B?U1VjK1lTVGlXYldTNFZQNHBicSt2U1Q4V0RHL0gxc29oOG5SdWxHWkFiaEE0?=
 =?utf-8?B?T1pJZStrbzJERGNqVTVmZ3hhVllaOVN4VGxYWU5YMCtDUFNDTEtTNjhhUWYx?=
 =?utf-8?B?a1owS3V1OGQ1SGJZYXlReE9KSDhzSlhVSVdjSWFzNFZRMTFTZWJWemIzT3gz?=
 =?utf-8?Q?ATkVLLT1l3OsODqGwLC+UAIwS?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR07MB6666.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c53ca3-13e0-41aa-23a4-08dd87319171
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2025 15:21:51.9479
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bw1+PZYxjHDAoveoY8qnldud9bovXADGvZf3QC8nF/aslywd0uEwj7afzN0tdX/uj0jNM0QxZp7NxrlH1dD2r/5pIC1gPBGbN5daIZjEFc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB8944
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 15:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215679

SGksDQoNCk9uIHRoZSBvcmlnaW5hbCBwYXRjaCBJIGhhZCBpdCBhcyBub3JtYWwgU1JDX1VSSSwg
YnV0IEkgY2hhbmdlZCB0byB0aGUgdmFyaWFibGUgbm90IHRvIGludGVyZmVyZSB3aXRoIHRoZSBm
ZXRjaGVyLg0KTm93IEkgdGVzdGVkIGFuZCBJIHNlZSB0aGF0IFNSQ19VUkkganVzdCB3b3JrcyBm
aW5lLiANCkknbGwgc2VuZCBhIG5ldyBwYXRjaCB3aXRoIHRoZSBjaGFuZ2UuDQoNCkFmdGVyIHRo
ZSBjb21tZW50IGZyb20gUGV0ZXIsIEkgZGVjaWRlZCB0byBza2lwIHRoZSBnaXQgZmV0Y2hlciBz
aW5jZSB3ZSBuZWVkIHRvIHVzZSB0aGUgbGF0ZXN0IHZlcnNpb24gYW5kIEFVVE9SRVYgaXMgbm90
IHdvcmtpbmcgd2l0aCBvZmZsaW5lIGJ1aWxkcy4NCg0KVGhlIHZhcmlhYmxlIG5lZWRzIHRvIGJl
IG92ZXJyaWRkZW4gaW4gY2FzZSB3ZSBuZWVkIHRvIHVzZSBhIG1pcnJvci4NCk9yIGlzIGl0IGEg
d2F5IHRvIHVzZSBleGlzdGluZyBwcmVtaXJyb3JzIHdpdGhvdXQgdGhlIGZldGNoZXI/DQoNClRo
YW5rcw0KRGFuaWVsDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBSaWNoYXJk
IFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4gDQpTZW50OiBUdWVz
ZGF5LCAyOSBBcHJpbCAyMDI1IDE2OjQzDQpUbzogRGFuaWVsIFR1cnVsbCA8ZGFuaWVsLnR1cnVs
bEBlcmljc3Nvbi5jb20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQpDYzogUGV0ZXIuTWFya29Ac2llbWVucy5jb20NClN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BB
VENIIHYzIDEvOF0gbGludXgtdnVsbnM6IGZldGNoIGtlcm5lbC5vcmcgQ05BIGluZm8NCg0KT24g
VHVlLCAyMDI1LTA0LTI5IGF0IDE2OjM4ICswMjAwLCBEYW5pZWwgVHVydWxsIHZpYSBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiBGcm9tOiBEYW5pZWwgVHVydWxsIDxkYW5pZWwudHVy
dWxsQGVyaWNzc29uLmNvbT4NCj4gDQo+IEFkZCBDVkUgZGF0YSBzb3VyY2UgZm9yIGtlcm5lbC5v
cmcuDQo+IA0KPiBJdCBpbmNsdWRlcyBtb3JlIGluZm9ybWF0aW9uIHRoYW4gdGhlIG9uZSBwcm92
aWRlZCBieSBOVkQuDQo+IFVzZSBzaW1pbGFyIG1lY2hhbmlzbSBhbmQgc2FtZSB2YXJpYWJsZXMg
YXMgY3ZlLWNoZWNrIHRvIGRlZmluZSB3aGVuIA0KPiB0byB1cGRhdGUuDQo+IA0KPiBUbyB1c2Ug
d2l0aG91dCBpbnRlcm5ldCBhY2Nlc3MsIGNoYW5nZSB2YXJpYWJsZSBWVUxOU19VUkwgdG8gYSBs
b2NhbCANCj4gY29weSBvciBtaXJyb3IuDQo+IA0KPiBDQzogUGV0ZXIgTWFya28gPHBldGVyLm1h
cmtvQHNpZW1lbnMuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVHVydWxsIDxkYW5pZWwu
dHVydWxsQGVyaWNzc29uLmNvbT4NCj4gLS0tDQo+IMKgbWV0YS9jb25mL2Rpc3Ryby9pbmNsdWRl
L21haW50YWluZXJzLmluY8KgIHzCoCAxICsNCj4gwqBtZXRhL3JlY2lwZXMtY29yZS9tZXRhL2xp
bnV4LXZ1bG5zX2dpdC5iYiB8IDc2IA0KPiArKysrKysrKysrKysrKysrKysrKysrKw0KPiDCoDIg
ZmlsZXMgY2hhbmdlZCwgNzcgaW5zZXJ0aW9ucygrKQ0KPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBt
ZXRhL3JlY2lwZXMtY29yZS9tZXRhL2xpbnV4LXZ1bG5zX2dpdC5iYg0KDQpJZiB0aGlzIGlzIGEg
cmVhbCBnaXQgcmVwbywgd2h5IGNhbid0IHdlIHVzZSBhIHN0YW5kYXJkIFNSQ19VUkkgPw0KDQpU
aGF0IHdvdWxkIGF2b2lkIGhhdmluZyB0byBpbnZlbnQgbmV3IG1pcnJvciB2YXJpYWJsZXMgYW5k
IHNvIG9uPw0KDQpDaGVlcnMsDQoNClJpY2hhcmQNCg==


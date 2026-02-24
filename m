Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED75F3C99D
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 15:45:04 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23199.1771947897928961311
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 07:44:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=Exw3Auci;
 spf=pass (domain: axis.com, ip: 40.107.162.71, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZFYXxsocWu2r49+tV/wMwC/fBJPvJmfVtoaLJaWLj/Gz1kfIkGJjZr6PA9YsqZitLLXOGLnTvoIx7UBv/Fr5UdAkuvohWTyycTlNbfSxggLE55eiCeLRVdHUoHWY+3NFcV9yImyoCymYNFB9SzW6dXctQKDiyQQg2bO7FJE20Ug7ZSOQZxGvHAY6h4Du90lfcNK5m5A1SJ5XblOl885Kigq1p634+lYLzmCpuENMkp8lSh/cFOLKmQLanLQdrOKaVD9swjV1PRQG/tLVBsm6KZYrnEOLZpLxewPWr2JLfhxsEZfzFJbQ4BYM8wjv8J5HVdCijXuXxgAoWsKH1MfTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S3HayI9R3KGxyXBeJzpEeGhOSVJkIuV+gO3K98TnRHs=;
 b=OtenRfKQG+bva+K7xbYogjkKk5IUGElzEybTpmJ1kQvTpHt0FGfzAWfDZ2tm92cT3rtu6ldoz0MPy1bWNLXcaO1MA19zdKIXj3z1gi/4cO6/CCYpiJvVB+rXQY2BuRbQ3bSmloDnvhssg2Kb3Yg/93+Z4bdyT1vw0XO6fiPb8jqhNiJ/OYL8r7AKL/mv/jLzhhhv+gCXufNLYJiLSekelcUIvX5vF/GgSvXZp+Drq7YWRZVDh3TJ5AzX8TVbSKoyhCsqbketZHiLnWAxiRMuw83n21oWKApnK1zQmnT8NdfynHG/1sIj0dhR5RD+RkbDbe0DVVSt6Npq3yBw/IVlNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S3HayI9R3KGxyXBeJzpEeGhOSVJkIuV+gO3K98TnRHs=;
 b=Exw3Auci+wN6b6+uMZacyjnGDq7a3gGRY+/5087cAQUpXbeSgGOfv8k9rbIqA/0OJEHifaHiC8AX50gh2Kvc6EE2RjhJFANBt8ovvamwrC2Bg4+qKvqYhUW4PDNEVPev0sMk4wHiJs73HvGQS45v4a2Udd53eWf8RCLBzHxjjPE=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS8PR02MB6631.eurprd02.prod.outlook.com (2603:10a6:20b:23a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 15:44:54 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::e5b6:b9a8:2a5d:e0cd%5]) with mapi id 15.20.9632.010; Tue, 24 Feb 2026
 15:44:54 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
	"changqing.li@windriver.com" <changqing.li@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 2/2] appstream: upgrade from 1.0.6 to 1.1.2
Thread-Topic: [OE-core] [PATCH 2/2] appstream: upgrade from 1.0.6 to 1.1.2
Thread-Index: AQHcpS7bWNMzDVE8Bkmzr2YaBdWVCLWRne0AgABdxQA=
Date: Tue, 24 Feb 2026 15:44:54 +0000
Message-ID: 
 <DB5PR02MB102138725558AB810833F8DFCEF74A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20260224014148.3328393-1-changqing.li@windriver.com>
 <20260224014148.3328393-2-changqing.li@windriver.com>
 <CANNYZj9RjdkAp326jT1RmeQFEUYyaE_wG6RROeWvtX7xdgMGFw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9RjdkAp326jT1RmeQFEUYyaE_wG6RROeWvtX7xdgMGFw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS8PR02MB6631:EE_
x-ms-office365-filtering-correlation-id: 6da3c5df-9312-45cd-4bba-08de73bba7ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Zk1jYVRTSmpBY0JYZyt2cHdjMVBiVm4rcHFteFFCRkg3cHBOaUxMcU5KMThw?=
 =?utf-8?B?aWtEVTB3dVZPeUVxZ0Y3WkRuOXRmNk9VeXlpODIzZkd3NUtwNC93elZzMnE1?=
 =?utf-8?B?cVdVZktRL0VpOVd3ZkV6K2VjNzE4cHA0LzlKSExPWlpBNTd0amRoMG55SU80?=
 =?utf-8?B?eEFESGZhb0l1T1ZGS1ZoNmovWWQ2ZldWYW54WlplZE1ZM2dDeUhMNmxFOXBr?=
 =?utf-8?B?RzJUZkJPVFpOWVRveGszUkE4RzFWS1d4OUp1bnFoemVKamhpT1FvRHVJMnN1?=
 =?utf-8?B?WVEyaWFWeFJTN0dDVHZGL2Y3NVJ4dGZ5L0hqeG5aRHlINFJ3SUsxSVlNK2pY?=
 =?utf-8?B?UmRNQkFQUk5rekxBTElLZEpRbmg0L0R3OXpkeUdzcVJ3UTY2Zk00dVpKalhk?=
 =?utf-8?B?WGdGRldyZU4xN0xKV0J0dy9JalhBcEZHWEZJN0tsbFBuVld0TnJkanJEclYw?=
 =?utf-8?B?YXNIYUdjK3k1YWxFTGFmaWFsUXpmYzgrVHRkY2FBMC9KRzZtem9Yb0cvVkFu?=
 =?utf-8?B?cThWUmFCaUJZWjZ2U0hJYi90SWUyK1RjM1JnOUFsZEhwZ1lySGp1OS9LV0RK?=
 =?utf-8?B?TEdITzg1c1ZXNkhMNENmamVyVTJ3aFY3U0UxM1lZc0U3S1ByYnhvdzNGbElr?=
 =?utf-8?B?dkx3dnpVRUEwN2lEeHhGOFNLWGxQVkw5UHlacHpUV0hReUdnSktyb3JsbnZz?=
 =?utf-8?B?NE4wMzlqT3g1dDQrR2I2OUJpWktUemFJcXZlbm9aNHlham5lMS9oRmFqY1Vs?=
 =?utf-8?B?TjRpWjVFczNNUkIxY1VhSmN5WTRUQ2hST3VkT1AyZi9jVDU1aW0rc2VvSmQw?=
 =?utf-8?B?RENNL0pzSndpbUpxZnVyQjRoYjI3eUFTRnBoV01TTEUwRHc0TEE5T0VIMzha?=
 =?utf-8?B?eGdBdW5SNUE5QUwveEZDaFg4NERWL3dVLzMwa3dUcFVicTVrcDFlVzI1Rk1M?=
 =?utf-8?B?aHpKM1ZKRnlJNkpmMjZJZGVFZ0p3VktEK0VwMkhwVTNRbGFJTy9QRmJPa1RE?=
 =?utf-8?B?YzFPUG84dm9WOXNGYTkvc29HL3czQkQwQjhvRExLaGl1a083b3pRMUhWTkk0?=
 =?utf-8?B?eWFlL2cyMmpNTUZSbEpIdHJVM2J3c1dMa3MwaUkrQXFhQzJBVDh5SjZ3a0Yx?=
 =?utf-8?B?Sk4vb1V5aFY0UzhCQ3FQeEU1c0xmVzkwZUFmelM1RUR2eVE5M3MvTWo4dzl6?=
 =?utf-8?B?UlN1dkxkWDRKK3FLeFY1R0d6aWZmUXBRUXYzcUJKVzJRemhXNU1LYks5cStF?=
 =?utf-8?B?UGlnQVB2bGJiSXk4WmhCenh4UGRCcEc0RmdtUWRreU9nT1ZGWGYzQ1pGM25Q?=
 =?utf-8?B?QWNrNzhDbGszL1p5aTNFZnlxM1FkOVNlQzJOaE0rak5CTUhFUFpuRXhiZ3NP?=
 =?utf-8?B?OEtTWTlsZVZMYnRibHNPSTJDa1FIcGtyUGFxdzlQaUJ2eFU0WHE5WFdGUmhQ?=
 =?utf-8?B?UENJbHBWdmVTSTZEaFkyeDM1N3czbVJvY3JqZlpDZHZOc1Q2Q2hCb00zS1Vu?=
 =?utf-8?B?dlNMZEEyU3FOYUtZSUZac2doRkU1akdFc0lGRmRlQnVUMzRoRDNWUkkwS09L?=
 =?utf-8?B?aTRXNW93amk1U0xmSUdiTmFQZy9oN0FZN1hjRlJWRHNhL1hOZnFoUGIwcUhh?=
 =?utf-8?B?UmtPQVh2TkRZeHJiazJ6Z3U5aWJyQmNDd1l5bG9sdndpcFIyMnNVdENtVWxC?=
 =?utf-8?B?cCtRNFNsd0dlWG56NWE0QjIvQ24wQWhhZFBQMEgyVW5oZkVyVmRwYWRVOEVG?=
 =?utf-8?B?d0hGK3NOVWpmYkxxRno5aXoyNzBhdnpzS0FMOWdzbFQ5citSRUh0SGg2Q282?=
 =?utf-8?B?Q25tRm1ObzN6Y1Y1Z1ZrVmp3d0padEVUWWdjanEvaGNBM0tkSkpWdlFUZHU3?=
 =?utf-8?B?b1VIbXJFT2RqTWMraVVmM2wranE3UnlhcEQ5anlHWjJqall4ZG9aZVJwZ2F2?=
 =?utf-8?B?UWRKOXhFMXVGSU96M0ozZ0NPMndQWGdnSjlJL0FBaUV4b1ZQbjZPS0NkK0Jr?=
 =?utf-8?B?SldkWklXdnpzQkl5MkZQUWxtei9Ibm9TVHlrSldJMWEzU2czZ2JIK1d3a3lE?=
 =?utf-8?B?MkdhWmVlUzNOTjVtZ1diM2RSanNJeGcvenBDSTJsYnpoMzFqQnVUNWhvQXpy?=
 =?utf-8?B?K2hMcnZkQXRhdWRqUUtmRGRwd1VQZ3RWYXdCOUVCVWxlZ2Z0ZEhrUG1NMERv?=
 =?utf-8?Q?Xrk5nfQob/lCpg1sxn9Is/4=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eHk2bjM5aHlUU1k3K1F6eTdvSkJ0d3JpaE1IYTJyMG44WnAranQveWdwcGww?=
 =?utf-8?B?NGMzMFZwME9lcytVc20yYkJ5dGFyN3BkcWtGOUcyd1lJWUJYUjZiRzBOMmsz?=
 =?utf-8?B?MkxrUlRCbi9GbTVtYWY3MWd5U0xndlI4TjFaa0VnWm5OMnM3THo5VjFQU3V2?=
 =?utf-8?B?MFRwcVRyUk9HOW9yQlVYQVBybjRFNUd6ODlrbVBRMjh2VnFtZ0YxQXBDSG1K?=
 =?utf-8?B?dFQwSUNSVDdLWkh4dHVkQUQ2VkN0ZUt6QUsxM3NPelZqU1ZBcVIvVE5sMTdI?=
 =?utf-8?B?dzVsUEpuMzY4VVQyeFhQNkd1RldqZTFBdytHTERVUEQ0eXhqaForTjBzQVpG?=
 =?utf-8?B?eHUzdExEZkxucVU5UVh2dThuYktBeEd6VUd3S3FPUmV3b09kMjZ2amp0Z3BF?=
 =?utf-8?B?b2ZlSzczTldIM2NBREFHdDZxS2kyQms5eHNYbjU1QVl4QTBrVnJvNHp1d2th?=
 =?utf-8?B?NzQxMzBtNXYwTUNmU3N6UFhoZ3FlN0V1VFdxM1JJZ0RqQkUyRmg1cVFLVUtJ?=
 =?utf-8?B?aTRwUFhUTGVFcmg1K1JMQm8xU2hieFdpOW9xVVhmQ055N2dGSTB6TDI3Q2JE?=
 =?utf-8?B?bzdoZU1IR0lzdnh0bWJCdUdiMUt1SmhST2tQa3daQXIrbnVwSG4wSXVJbkY2?=
 =?utf-8?B?TXROa05sUFowQ0tidXNyVitVU1daM1pmbmZ2Q0g1TUZPNmc1Y0FWbkhDRm9p?=
 =?utf-8?B?YkdSQVJ2V0R5Y3poNEZRdHZFMElZMTZ4WFkrUWlIK2N5VGwyK3NEdWZlRW5C?=
 =?utf-8?B?MmVaTUx5YTVDTTluZ0kyeUJRWloybm5PTE5odHRnaGIrMjg2bURTdGVKdENL?=
 =?utf-8?B?Z1BUWFZTTDZXbXl2SG5BVmRjaE5ETmhiclJNdVhNMGRZZ1pSbXFWdkgvVjJY?=
 =?utf-8?B?Z1I2MUhCcG41dys0WmhJRUNoVTROVGUyWm1td0hjMVlBRXlwQTluQkU1c09H?=
 =?utf-8?B?N1c0WXRCM3dwa3pnY3Vmb0FGS0U4ekRIVGRDYmpYcXZSbnVvTjc3UGwzeVM1?=
 =?utf-8?B?UVRYSE1McWVmQnZPYTFFWHZvZXBiaWwveTVXZTkvUDhkRW1SUkUwWHRhRHFr?=
 =?utf-8?B?b1VGYXBzU0Vwb3BMeVFab1ZCazd4aEJaOHRyMWpqT0Zha0tFdDhwWWN6d0NS?=
 =?utf-8?B?NzVPcVgrdTh3dEVJVUZEeFdXSXlYekVLWEVtZGV1eVlkWWx1Sk5lZlRPM0ha?=
 =?utf-8?B?TEtreTZIalVQbkdVeU5LaVlTamRMaTUveFd0VnJMZWlBUmFMNk9ybWFNSkxE?=
 =?utf-8?B?MzZES0w1VG5XMzY5dUYxcE5DZHFyNEVuRUk0TmR5WGlLdEp0Tk94N0FGMzZV?=
 =?utf-8?B?L0NTQ3RLbEIrRUQwQWxIcDhkeTVlUVV0RmJzYUs3aUx4ajFmZTJWYkw3K1BG?=
 =?utf-8?B?ZEk2ZzFvSGZWUDBoZ2E2aUlDb2RwRE51UXMzU1FZcWZoYVJ1Uk4yVFhFL3Yz?=
 =?utf-8?B?YkcxNlVvSThkSFNoNmZNWUNhR2ROcWl6NTh4Nm1yM0NtQ0ZYUXM4bFNCcTNa?=
 =?utf-8?B?am5TMlBhODlEOTFBUHYzSHZlV09tVjYrV0VsWVk3VlhTeHRlKzJIakx6aGdh?=
 =?utf-8?B?SFNWQ0tUc0FCK0x6TGhyTndza1ZRY0xRVGJDZ3gxUzdZTUZHcUhaN3pCZjZ0?=
 =?utf-8?B?eUZsM1h6YUZFbGhiVC9LUUc5ZTcrNXlTb0dSa2FWeGpCMGIwdmlFcFRydTM5?=
 =?utf-8?B?OVlFQmt4N1pnZVVIcmtRRWlCd3lpNFdBWEFydEtHVFBxUXkwRGdIOVB4Qjd0?=
 =?utf-8?B?YTRlNys1cTF1YVdiZ0JRTHoxSzJodEJHM0IzV0Y5L2tESHc2cXBzOFBKek8w?=
 =?utf-8?B?dzRMaGUxUjlySFZKYVVQb3o0TGV4Mk1PNThSZnVqeUoxai9kMWZabXpud0JH?=
 =?utf-8?B?SmtXa0h2YmE5WVAyaTZWSmN5TFlBOWIyaVJaV1NBM1JQTTVQOUlYTjFvVjVK?=
 =?utf-8?B?TWpiTm1qSkpnd2NHTUNiODhUODhrcHpqS0NwYytLQ0hNLzZLYzMzNDdsRDNW?=
 =?utf-8?B?Yit0Y2tBbWxidmVmNmdOQzVtbXNJNUpCV2VUclJ0M3hsNy90ODR0MEwzVDBm?=
 =?utf-8?B?WklNLzNPTjFyMkpqRmxEN0g2OVJ5UTg1VDJwaFN0OVduU2ROU1JoVDFOQmJn?=
 =?utf-8?B?TDVNb01ZZURFTlZWaGlzY3FCOXFlUU5WYWR2ZU5VU0FDNEx4OUx6bDhIcGFh?=
 =?utf-8?B?Q0V3ZWZ2MCs1WldxZFVXL2dpa2h3ZVhibTlrWXJwTFRYcGtyYjQzQjJ1M3pk?=
 =?utf-8?Q?ZO6ImCUtt+AqGAhLGfBtUpRDkmXYvP8kpbZVGF3PnA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6da3c5df-9312-45cd-4bba-08de73bba7ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 15:44:54.3069
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pFefv4UsIDdktiEw0S6YNV00Ncvx4MduW+JKym4cm9IEMygbscsesJ7bfaSqoLwQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB6631
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 15:45:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231866

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgQWxleGFuZGVyIEthbmF2aW4gdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj4gU2VudDogZGVuIDI0IGZlYnJ1YXJpIDIwMjYgMTA6NTkNCj4gVG86IGNoYW5n
cWluZy5saUB3aW5kcml2ZXIuY29tDQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDIvMl0gYXBwc3Ry
ZWFtOiB1cGdyYWRlIGZyb20gMS4wLjYgdG8gMS4xLjINCj4gDQo+IE9uIFR1ZSwgMjQgRmViIDIw
MjYgYXQgMDI6NDIsIENoYW5ncWluZyBMaSB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8Y2hh
bmdxaW5nLmxpPXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+
IA0KPiA+ICtQQUNLQUdFQ09ORklHOmNsYXNzLXRhcmdldCArPSAiYmFzaC1jb21wbGV0aW9uIg0K
DQpUaGF0IHNob3VsZCBiZToNCg0KUEFDS0FHRUNPTkZJRzphcHBlbmQ6Y2xhc3MtdGFyZ2V0ID0g
IiBiYXNoLWNvbXBsZXRpb24iDQoNCm9yIGl0IHdpbGwgcmVwbGFjZSB0aGUgUEFDS0FHRUNPTkZJ
RyBmb3IgdGFyZ2V0IHJhdGhlciB0aGFuIA0KYWRkIHRvIGl0Lg0KDQo+ID4NCj4gPiAgUEFDS0FH
RUNPTkZJR1tzeXN0ZW1kXSA9ICItRHN5c3RlbWQ9dHJ1ZSwtRHN5c3RlbWQ9ZmFsc2Usc3lzdGVt
ZCINCj4gPiAgUEFDS0FHRUNPTkZJR1tzdGVtbWluZ10gPSAiLURzdGVtbWluZz10cnVlLC1Ec3Rl
bW1pbmc9ZmFsc2UsbGlic3RlbW1lciINCj4gPiAgUEFDS0FHRUNPTkZJR1txdDZdID0gIi1EcXQ9
dHJ1ZSwtRHF0PWZhbHNlLHF0YmFzZSINCj4gPiArUEFDS0FHRUNPTkZJR1tiYXNoLWNvbXBsZXRp
b25dID0gIi1EYmFzaC1jb21wbGV0aW9uPXRydWUsLURiYXNoLWNvbXBsZXRpb249ZmFsc2UsYmFz
aC1jb21wbGV0aW9uIg0KDQpSZW1vdmUgdGhlIGRlcGVuZGVuY3kgb24gYmFzaC1jb21wbGV0aW9u
IChzZWUgYmVsb3cpLg0KDQo+IA0KPiBiYXNoLWNvbXBsZXRpb24gY2FuIHBlcmhhcHMgc3RheSBk
aXNhYmxlZCBmb3IgYm90aCBuYXRpdmUgYW5kIHRhcmdldD8NCj4gDQo+IEFsZXgNCg0KTm8sIGJl
dHRlciBpcyB0byBpbnN0ZWFkIGluaGVyaXQgdGhlIGJhc2gtY29tcGxldGlvbiBiYmNsYXNzIHNv
IHRoZSANCmZpbGUocykgYXJlIHBhY2thZ2VkIHNlcGFyYXRlbHksIGFuZCBpbnN0YWxsZWQgYXV0
b21hdGljYWxseSB3aGVuIA0KdGhlIGJhc2gtY29tcGxldGlvbi1wa2dzIGZlYXR1cmUgaXMgZW5h
YmxlZC4NCg0KLy9QZXRlcg0KDQo=


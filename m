Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D3A1D29C28
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 13:14:31 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.62])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34483.1768828465044473293
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 05:14:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=KP0SwCqx;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=KP0SwCqx;
 spf=pass (domain: arm.com, ip: 40.107.159.62, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qbjEzlxRS650RyfkfmNg5ur1KS7a4bVQkcs37Uh4iXvj7zH6kc3UwW2/U5FxXCMYpwQ2uClcAp5uwVNYWEIQJi2HCb7mnDmIfRNG475IxNYCD7ogY3kU85UKwGwIWUVM2uRBVqvV9z81bRTEzp68TO4/RSUrMQcwg7MOQUnAwkHQALTx7yFogcBFdv/U+0PChP6JlUzzTKLAXa32UfdAqvWsBkpFUI03nfZCxJxsDcdeaLZhHH/ZroD9M2QGAFI67ndptkmDKN+jmVhZeGJf09uEuqj32m81At6FERTrTBxomnjyufru3NOAg5jH7VENfwHqHxMXJ9O8pOM+loaNGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUN5tONirX9x9ZslBNbgUSuxf4ez3Ig6L1TkuL34rhM=;
 b=t+lU3djUyApV1UpmhWHgpIOxbhkOC5Su0kgYigQdKGT4ebv+NDZlEmqM58jcWwmHGSyT1SghBtP+A/jpP3oWo6EhmznU9l5YSNMugNVRBAlPuEqczIDouonAlTnWcitPh7lLtxr8Vt6H45Of8+Szmfr7YnxuXIIbGU0M1mC2h8JvH9AycIwZpbkMoJlIOA3wdk5QvAyMtMoi1fmc5QEF8E+7VaZny1LNTq1iat89pL4oevcL+JgPU5vS7v8EESbxnV9Tam/p445rTrBruA8zgNeSM2DCcwzTD3fnWElkqgUBWdRRGdD3VgP503eKUUX88qaKLaIwxELMnk0sD+E7Lg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUN5tONirX9x9ZslBNbgUSuxf4ez3Ig6L1TkuL34rhM=;
 b=KP0SwCqxjMX6J3dQIif1rRsqicqPInJ5LL50O5fIAfoqm+ERPYX0Cm7QnXA3XFi3tFarNdBSh75G5fieSL1/kFqaVJj040eerPnXeD4PKtzKnfx33SSuB6Qpbnfy0YNnhHzsPXGFhovl0sBKDeuikfD6bPvHPvi1pMT+fqdpS+U=
Received: from DUZP191CA0071.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::11)
 by DB9PR08MB7889.eurprd08.prod.outlook.com (2603:10a6:10:39c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 13:14:19 +0000
Received: from DB1PEPF000509F5.eurprd02.prod.outlook.com
 (2603:10a6:10:4fa:cafe::d8) by DUZP191CA0071.outlook.office365.com
 (2603:10a6:10:4fa::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.12 via Frontend Transport; Mon,
 19 Jan 2026 13:14:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F5.mail.protection.outlook.com (10.167.242.151) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4
 via Frontend Transport; Mon, 19 Jan 2026 13:14:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tHfPrYKjZnucq5q0IIik+CZh1CAb5sP1o4Wa+b82ox4BHUzhbp0np47sb+FPmOtO5Lwy/pPkw2hKpcYFUX4miccpNFOdkra9Hweaq3zdf6QrXmz4n5PpTJsvnaBdtlIBKPz6NPbIzxDMsAQ6U8+g8aegMSmTP3Dgfdhf3ylGBEoZ3q+QbMrgpSGDQrc/c2pQsxssh4vZBkM8bhu197rcHZ/f297EC8/uZb6SdiM9gtK0AqFJRaz2ERLh38913VppVRrLMIFleq7UFOnbO/9wzyITD+Vvu5/fBm5/LBiR3rR3yIYAtzfsfacP8OtqGidzZHikQev99/aYs7fFO9KY5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUN5tONirX9x9ZslBNbgUSuxf4ez3Ig6L1TkuL34rhM=;
 b=QKk43MVwGriQLCQePm7yRrkohVmY0R4VDPrFiG+c9/37ED0T1v8e8oXjU/8XbTqPM8A6zsD9c81n3ZJTBAkFTuUrGbjZXDHOm8LGHcUHBXAQq34JQeb7exKG67wSX1SzleMH8Zhr6+uXbXUqTdMp8Q2GLaiwW0ecc+r4mQULkOmD1JRsCGD02vAnEJPp4aqKpvxJ8p9dJ7hYp6sVJL62fjRgc/7RWKQSIYQaYS0vuPvJXk5UsiYm+Mw+3SuofEyGHgGtICnMqAYoyJhZBhCuNikCPbx9M4xKXtE58rZNzd3eJEAzUc8rek5bp2T7Wz+73ni9pPG9jqdL97VcziB+Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUN5tONirX9x9ZslBNbgUSuxf4ez3Ig6L1TkuL34rhM=;
 b=KP0SwCqxjMX6J3dQIif1rRsqicqPInJ5LL50O5fIAfoqm+ERPYX0Cm7QnXA3XFi3tFarNdBSh75G5fieSL1/kFqaVJj040eerPnXeD4PKtzKnfx33SSuB6Qpbnfy0YNnhHzsPXGFhovl0sBKDeuikfD6bPvHPvi1pMT+fqdpS+U=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9953.eurprd08.prod.outlook.com (2603:10a6:20b:635::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 13:13:17 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9520.010; Mon, 19 Jan 2026
 13:13:16 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "max.oss.09@gmail.com" <max.oss.09@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Max Krummenacher
	<max.krummenacher@toradex.com>
Subject: Re: [OE-core][Patch v1] alsa-utils: fix install package alsa-utils
Thread-Topic: [OE-core][Patch v1] alsa-utils: fix install package alsa-utils
Thread-Index: AQHciUHOt93d/x3KpUSQkn+YH/V/GbVZeC6A
Date: Mon, 19 Jan 2026 13:13:16 +0000
Message-ID: <CF0AF935-004A-4E18-820C-E2D2BC6114F7@arm.com>
References: <20260119124722.646039-1-max.oss.09@gmail.com>
In-Reply-To: <20260119124722.646039-1-max.oss.09@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9953:EE_|DB1PEPF000509F5:EE_|DB9PR08MB7889:EE_
X-MS-Office365-Filtering-Correlation-Id: d089a9e8-abad-4d4f-36f7-08de575ca7b8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|7053199007;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?RHBPdWhxVVNqQkUyQXBWaXNWZFpIZkxQaFdmNjF1Q2diV0pSS2lkUWE4OHVm?=
 =?utf-8?B?Y21zNWpqcXdQcTYyRUR3TkV6M3N3b0tSZHoxWVd0Uk5iaDBFdnlsc0NYdlhw?=
 =?utf-8?B?dG1QVDhmdmxpNWgwNUM1VlFUREdVYi9XblVKQXNFcXljMUpBY1ZhV1ZSdDA5?=
 =?utf-8?B?T3hSZ2Nub3YydFhjS0RHYzF3QXZBK01PYnRza1RQb1FCc2MzcStaK3ZwQk9i?=
 =?utf-8?B?b3JmNTNFL01va0I4OUtockZPSlJSZGVUVUVrTXA0Z0xkNUhsaHliV0xUcS94?=
 =?utf-8?B?c21LSndRdTd1K2RVdS9sMTZKVG9rTjlZUCszM1FrTFhnWGQ5UXlSU2hjY2hh?=
 =?utf-8?B?NGFUSTIxOHc5YnFBU0cwakVBZG4vRGtqNXRwbzZZZ1FuWGtDMTFCSEF3Rkhw?=
 =?utf-8?B?T01OeTl0UmRKM3VQQkNJN29sN1M0dUwyU3FZNjNEMmRaUE13Q0ZqaFR2RFNI?=
 =?utf-8?B?Mlh3dm9JcUUrdk1pV0NoNG9DR2dmTVpNQVQxY2tVQkZKd1Z5bzg5NkVTTk41?=
 =?utf-8?B?Y2QyaS9wZjVBREFpR0FmaHhRZGhPTHN1Wm9MVFNVNkZWR3VzdHc3SG1TbFEr?=
 =?utf-8?B?VEwzZnlad3RublBCMDkvZGR5eG02UG1IZG9KOGtuUTY1aHB4OGtLekk4UjEz?=
 =?utf-8?B?NTNwTXdXSkcxMlhkaVhJZlRJVC9SK2VZV2ZyK1E2eHlvdnFXZTF5Y0l4MFB2?=
 =?utf-8?B?U2xlcy95MUpwekh2M0dJWW9kQnlRWE92ejBJQW1xYWhwUk1DcXUrbGhidEV3?=
 =?utf-8?B?dE9iakdRbCtHcGt5NXRjYWNkci8rbHhCL0hzaktvNGZDalhzS3dYVGc0clpB?=
 =?utf-8?B?RXhINDdEVnA1eVRmTWhqM20vdDhtYUtaSE9UWStIN3dmaDJEc3pVK0ZXbkhZ?=
 =?utf-8?B?YnZ4TTZyckhtTXVmbEtIbWxOVmNlaHBpeWk1UzZCZ3ZYVHF4WkpoajNzUkFW?=
 =?utf-8?B?RDExMHMyYXNIQjk5bzFiMWZPMjBETitSMm9Takw5dFlrVFZUbEs1UmsxbkJQ?=
 =?utf-8?B?c291ak0zMDFtTXlSK0t6VDNsMzlFcVlERGgydmJTL0xBNXlNRWxRT0Q0WVBD?=
 =?utf-8?B?N28xcVU2Y1gzZVUvaDd0bVNNbzQwYjdxTGEyQUpkdy84emNLNG5jQ1BlSWJt?=
 =?utf-8?B?QmR4VEdMbVR3VS8yUm8xWnQ1akhMR0V3L3JibmRwenQ2WURvdHkvZFVlUEVm?=
 =?utf-8?B?elpGV1NlakwwZ3dZSnJ4US9OcWpYbGhLdmRvcWpZc0pKR2lYcDRBTXlyWnd0?=
 =?utf-8?B?aWM5eitRQmwwdE1QNGZtOFdhVmlKQXlMeUpMbG5tajJzNVpvVkxYOTMzcUJT?=
 =?utf-8?B?OXRSNTRCS0tVSW0zT1lncWorRUZJZWlBUWtJNUN6d2RYaGFyMkFHcHRqajds?=
 =?utf-8?B?WS9DOXVMczlzSDhHWmpEU2c2WlVTQTFqODhlQnpQK2xhRmQ1TkJXMFZ6UGxI?=
 =?utf-8?B?UWFMUWgyVVk5ZzlEWmd0SmdtS0NnUEJ3Z0VMZUw4dTF1Q05PQUlPczRSYm9M?=
 =?utf-8?B?NmVBbFRPWTRLWmdsWWo4YXowNXVPT3J6T0dtY3lzUHM3aG1HV1Z0cGZDNmMx?=
 =?utf-8?B?MGQ4dzdTVVhmTDFLZ0M2Vnh3NkdkNWpyR09HYXMvcFlPUFFKc090ZDFZUThU?=
 =?utf-8?B?amZPYmlrMjliZUlCRzNWRldLZlJxUFdZMkUrTkp4ZHpoNTJoMUpOUTlhdDIr?=
 =?utf-8?B?YzNmRTNOZXhGNXBncnF5WDh3NUZvUkM1RUFDR0FYYS8xb1BCVDdSNEs1TGhj?=
 =?utf-8?B?UFlZWVRKaHFyT2Z0SzNpTTZXQXhIempPVUlBUnppQ01pVWhCdVpHTktTNFJZ?=
 =?utf-8?B?Wjl2VWIxRFB3Undnd0VwQmdmbzhxbXJwOHN4OUc0bUR0TXJjaGx5ZDVCVU1O?=
 =?utf-8?B?V0hvQVY1ZmxnL2IzWjRvRWZHT0FqMDM2akxxeGttbG8rbEJQYlgySjQvY2JN?=
 =?utf-8?B?b2l4dkpyN1lhampiVkNCMFpXUGRMRVJNVERjOCt5dkFZWEFMY2x2REFVcFhU?=
 =?utf-8?B?eUIwdTc5ZDhnbWxFbzdVd0V3MERQQS85N2M4UUVPOW93RDg4M3lvUUU2d1RQ?=
 =?utf-8?B?NnMwcDgxUXVTUDlySlZRM3FkS2JjY0ZHZHIvdFYxY2hQYytlczh0eXRJcGpj?=
 =?utf-8?B?NlJJMXl4Mmdya1g0WEExQ2IzNEFUb3ZOMGkvUkQ1dmM5dDZ3a2RhMHVrMDNH?=
 =?utf-8?Q?zgeQSXdk+5yXpVzMHHoEMRs=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2DCF51E6F2CE04468939C58306C3FE55@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9953
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	85308574-0e1d-494d-b76c-08de575c8217
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|82310400026|376014|14060799003|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Rjd4VXNTbERkTk8vcFM3SXMyVGtpTXc4SWh4Z1RtQk1zeXgvSm8rWkRMeGFG?=
 =?utf-8?B?eHFlZXRTdU02UERSSjlUeXMwWGhoVWRHSlpuQUxSSTFhcmNnNE5ZWHNOYmE4?=
 =?utf-8?B?dlVNaS9nUU1RM0h4NlNURkk0eGtmc1FFVG1BNkFuWGlHSGpySTJhZ29IZGZx?=
 =?utf-8?B?ajBIR1dvdmdsaGJVdTQzVW5zUm14U1dJY1JyRFh5QjllSkR1UzQraHV2azhp?=
 =?utf-8?B?Y3l3eEphUnZGSEV1MFJvczU3d1pxOXhXdXF0VlVub1dzQVh6WEVUR0tJaFJk?=
 =?utf-8?B?RHF5LzVFZzU5K1lUczVJTjFDNVVvSklxTW1UUG9Xc2IzaWpBOERyRFMwZEtZ?=
 =?utf-8?B?WFUzOXlEdXVGT3dhZXFhaml5c3Z1TXl5Mm02eDVmWDNMTHkwU0diQXlFT3Vh?=
 =?utf-8?B?YWRjelp0Vkt6VHhiNFdrcHpJNHRmTEpjbUlKbmdvQlY1SzlKb0MxUXBQMHpK?=
 =?utf-8?B?bXpiMFF4cTdsenJtdVN1RHA2UVRxaUhHSnhoY3BiY1QzbWd5OXJ2MnYrQ0RQ?=
 =?utf-8?B?dkVzaU15QWJlV09GMVg0blc3K3lSUFZzWlZkT0V0QXFsNkE3UXJ4Y25aSXNM?=
 =?utf-8?B?Y2JaSVYvMGQxZlJsUUtZNkpLeU9jdmdScFlVQzAybHBDMUNYdGhuK3R0OUND?=
 =?utf-8?B?MlNiejNKNVpCdXYrZ0RSSEhaOVBoRnpSVGpoeXF0aDVzaXNLbmNjZ20zWDIz?=
 =?utf-8?B?ZVBCRHJWOW1PYU44OEUrU2ozSmF0OTV0ZkpIOXdpc21IWUxKR0FKaWRmd1hj?=
 =?utf-8?B?ekdHRmdKYjQ2b253ZlVQdWdkNmFBTkhyNXRZZGlYU0JSMWhYbWQveFhrRFpP?=
 =?utf-8?B?ejBwbzRwOU1MdVNqdmk2aDIxRlBZYjRjUmtxekU1U0c3Ly9xZXRSeW5uSXRy?=
 =?utf-8?B?WkxDNGN2QzNUTHRHQk1UQnF5WjBZRnZESzBtdVdzZWJmek83VDFHbHBmcEVI?=
 =?utf-8?B?dlBCQXhnUklFK2ZTbVJ4dlRlVzhweWlYdGJwZlkrQW5keDcrd21rdE45Q1RI?=
 =?utf-8?B?VWRJbWt5amdFOTFDM0JwRjlqait0M21ZeVh4cFdwamphcHEyUG9PVU0rTVpy?=
 =?utf-8?B?bUdoc2l6OTh4eE8xdjNiNnlkLzVqRUtLTTdhQ3dDQVB5Q0RzZWVWMlFrTUJS?=
 =?utf-8?B?RkhPSVM0d0xaaXVaTGRXY1RrTGZPYkN5cFl5dVgydGRQTytJN0RGK2ZlK3JE?=
 =?utf-8?B?bXM3ME5CRGVkL2RUYlRrbmNpZERDalIxV1FTZThmK3AvbFNKSXB4NVFOK2Z3?=
 =?utf-8?B?RG1ZTTJaay9OTGF4aTdlMnNUN2tPYmdrVk4xM3VuY3FVU3hYa1JIeWFYSGh1?=
 =?utf-8?B?SEl5eHZZT25wRTM1eTVRREpqaTh6RUxJOWxsTG42REVXYW5mbkxTU3BpTXJK?=
 =?utf-8?B?TDZqdFRWWm5TZE1MVEIxb0NzMHQ2T1lrNjRFbEs4K01HZkJvYU41bjBJSmNF?=
 =?utf-8?B?RHcrcktjcWphOXhVU05CTGhIVk1nclRvRFBGaTdzQWw0MWlPVk5FN0U4OXJ3?=
 =?utf-8?B?VGJ1ZERTWjJBM1hQQTNvUzV2clZtS1RrZk1mK0xrL1RCOHVBZlg3cG02c2U5?=
 =?utf-8?B?a1JBZG5mVXJ2N3l5U1FyNUlKcTkrM3NGVi8zLzVlbndhTG9qeURQaFkvcWI1?=
 =?utf-8?B?VWd5bUNGOTc0NFVHaVBCQlRWVUJoNDlScWY5d2RiSkdiQ1dqNnk2amNZclo5?=
 =?utf-8?B?V1RHQWVSV3RzMlBYT3ZveXd3b2ZPbGwrL21yZVpYWlpqZnBtOTVQNlFWS0VZ?=
 =?utf-8?B?RFhwcHBBWU4xY3dEZ1pVTlByODB1VG5EOFdodkRGcHR1Q3U2cnJNSE5RVXc4?=
 =?utf-8?B?UUNIREVVSnZreS93enB5WjFoQWUxUUw5SkhFZDF5NlU1SnVnQm9SMGZPWFpH?=
 =?utf-8?B?bmZBa3g3NTBmS1M2VWdacXVpMkI0RnI0ejg4d05WeGN3OGl3My8vZ2FnTFA4?=
 =?utf-8?B?aVBnb2wvejE4M1R4MEVhQVVLZ2VTQnQ4SitqV2dMU3pzK0tHbm93TUhkMFpj?=
 =?utf-8?B?UFliaTV6aXg1WFZmTWFrRTdrY1VQd2tqYWErUkY5dmlzd0ZDd1VvTzlpVjlH?=
 =?utf-8?B?QU1uMHdpTG1TSExaVVFCaEdOd051WDhCWS9ZYmtnZmVLdkxSOEJORmJxN0U3?=
 =?utf-8?B?aHZSUFhSMjZ4Y2V1M0hSVndmamlrbndzcW9BYnhkTFlXNmsxcUdob0psWlZS?=
 =?utf-8?B?eEJDYk9xQlg1K3JseS90UGFtNFM3dGMrem5Zd04yNUVLd0RkTitQaG1wMFpw?=
 =?utf-8?B?VkRxSjJhUzVkS0RSKzJlSDcrTE9BPT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(376014)(14060799003)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 13:14:19.4638
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d089a9e8-abad-4d4f-36f7-08de575ca7b8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F5.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7889
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 13:14:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229617

VGhlcmXigJlzIGEgYmV0dGVyIGZpeCBvbiB0aGUgbGlzdCBhbHJlYWR5LiBzZWUgJ1tPRS1jb3Jl
XSBbUEFUQ0hdIGFsc2EtdXRpbHM6IGZpeCBwYWNrYWdpbmfigJkuDQoNClJvc3MNCg0KPiBPbiAx
OSBKYW4gMjAyNiwgYXQgMTI6NDcsIG1heC5vc3MuMDlAZ21haWwuY29tIHdyb3RlOg0KPiANCj4g
RnJvbTogTWF4IEtydW1tZW5hY2hlciA8bWF4LmtydW1tZW5hY2hlckB0b3JhZGV4LmNvbT4NCj4g
DQo+IFRoZSByZWNlbnQgbW92ZSB0byB1c2luZyBkeW5hbWljYWxseSBzcGxpdCBwYWNrYWdlcyBj
cmVhdGVkIGEgcmVncmVzc2lvbi4NCj4gDQo+IFNvbWUgb2YgdGhlIGR5bmFtaWNhbGx5IHNwbGl0
IHBhY2thZ2VzIGFyZSBlbXB0eSBhcyB0aGUgZmlsZXMNCj4gZHluYW1pY2FsbHkgYWRkaW5nIHRo
ZSBwYWNrYWdlIGFyZSBwYWNrYWdlZCB0aHJvdWdoIGV4cGxpY2l0IEZJTEVTXyoNCj4gaW50byBz
b21lIG90aGVyIHBhY2thZ2UuDQo+IFRoaXMgdGhlbiBicmVha3MgdGhlIG1ldGEgcGFja2FnZSBh
bHNhLXV0aWxzIHdoaWNoIFJERVBFTkRTIG9uIHRoZQ0KPiBub3QgZXhpc3RpbmcgZW1wdHkgcGFj
a2FnZXMuDQo+IA0KPiBFbXB0eSBwYWNrYWdlczoNCj4gYWxzYS11dGlscy1hbHNhYmF0LXRlc3Qs
IGFsc2EtdXRpbHMtYXBsYXltaWRpLCBhbHNhLXV0aWxzLWFwbGF5bWlkaTIsDQo+IGFsc2EtdXRp
bHMtYXJlY29yZG1pZGksIGFsc2EtdXRpbHMtYXJlY29yZG1pZGkyLCBhbHNhLXV0aWxzLWF4ZmVy
DQo+IA0KPiBDaGFuZ2UgdGhlIFJERVBFTkRTIG9mIGFsc2EtdXRpbHMgdG8gUlJFQ09NTUVORFMg
dG8gd29yayBhcm91bmQgdGhlIGlzc3VlLg0KPiANCj4gRml4ZXMgZG9fcm9vdGZzIHdoZW4gSU1B
R0VfSU5TVEFMTCBjb250YWlucyBhbHNhLXV0aWxzOg0KPiAgLSBub3RoaW5nIHByb3ZpZGVzIGFs
c2EtdXRpbHMtYXBsYXltaWRpIG5lZWRlZCBieSBhbHNhLXV0aWxzLTEuMi4xNS4xLXIwLmFybXY3
YXQyaGYtbmVvbg0KPiANCj4gRml4ZXM6IDI2YTI4ZWU3OTM1MCAoImFsc2EtdXRpbHM6IGR5bmFt
aWNhbGx5IHNwbGl0IHRoZSBwYWNrYWdlcyBpbnN0ZWFkIG9mIGRvaW5nIGl0IG1hbnVhbGx5IikN
Cj4gU2lnbmVkLW9mZi1ieTogTWF4IEtydW1tZW5hY2hlciA8bWF4LmtydW1tZW5hY2hlckB0b3Jh
ZGV4LmNvbT4NCj4gLS0tDQo+IG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2Fsc2EvYWxzYS11dGls
c18xLjIuMTUuMS5iYiB8IDIgKy0NCj4gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEv
YWxzYS9hbHNhLXV0aWxzXzEuMi4xNS4xLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxz
YS9hbHNhLXV0aWxzXzEuMi4xNS4xLmJiDQo+IGluZGV4IDkyN2Y5NGFmYjY1NC4uMWVkNGQ5YzRi
NTRhIDEwMDY0NA0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9hbHNhL2Fsc2EtdXRp
bHNfMS4yLjE1LjEuYmINCj4gKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvYWxzYS9hbHNh
LXV0aWxzXzEuMi4xNS4xLmJiDQo+IEBAIC03MCw3ICs3MCw3IEBAIHB5dGhvbiBwb3B1bGF0ZV9w
YWNrYWdlczpwcmVwZW5kKCkgew0KPiAgICAgcG4gPSBkLmdldFZhcigiUE4iKQ0KPiAgICAgcGFj
a2FnZXMgPSBkb19zcGxpdF9wYWNrYWdlcyhkLCBkLmdldFZhcigiYmluZGlyIiksIHIiXihbXi5d
KykuKiQiLCBwbiArICItJXMiLCAiYWxzYS11dGlscyB0b29sICVzIiwgZXh0cmFfZGVwZW5kcz0i
IikNCj4gICAgIHBhY2thZ2VzICs9IGRvX3NwbGl0X3BhY2thZ2VzKGQsIGQuZ2V0VmFyKCJzYmlu
ZGlyIiksIHIiXihbXi5dKykuKiQiLCBwbiArICItJXMiLCAiYWxzYS11dGlscyB0b29sICVzIiwg
ZXh0cmFfZGVwZW5kcz0iIikNCj4gLSAgICBkLnNldFZhcigiUkRFUEVORFM6IiArIHBuLCAiICIu
am9pbihwYWNrYWdlcykpDQo+ICsgICAgZC5zZXRWYXIoIlJSRUNPTU1FTkRTOiIgKyBwbiwgIiAi
LmpvaW4ocGFja2FnZXMpKQ0KPiB9DQo+IA0KPiBQQUNLQUdFU19EWU5BTUlDID0gIl4ke1BOfS0u
KiINCj4gLS0gDQo+IDIuNDIuMA0KPiANCg0K


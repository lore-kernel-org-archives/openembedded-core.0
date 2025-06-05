Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9AF7C5B543
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 15:55:31 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.42])
 by mx.groups.io with SMTP id smtpd.web11.11454.1749138926771240758
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 08:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=pY1YzJSP;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=pY1YzJSP;
 spf=pass (domain: arm.com, ip: 40.107.162.42, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Co3+/ojZ4aMmGRdyK7Ix+Hr7UrcwRoOAzWLZTbTKhb8W1t8CxnwLD+kHQq2fzig0sB0625oyJspNBDrmfRVtoSC+5XKHnAyZ6bpndRj/HhH+HW7Re7FgsvkA98nfCIgO8hiV5pXKqDu/k5JdRkT+VDOYWuMGQlbsE4cx9aq07danW26Z8Aw1wNQ3/U4O3+WWvFmSJTAcJch9S3x9E+P26GJGmA7HbYEGfbnvMl2sIbNWJ7uVsfidpWjP2ABB8gMdCeBk46K8W+pWP9JEgfRg2CVa8ROKMezfriGxPvhH7m+Rcs15BNsciLVlotvRNJrTqM5iWQfMUydtq7HQmKUR8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/p67vmIY/Fneb6HG5bxUjEWN4F32JzVe+9+tD5gl8o=;
 b=k5gVf649uSLAJIbYAI5l32U7NXCl99oYU+HzoPA38oot42i1wnnxmyQEdUfjpgAQ/UOGVqAYi4I8ET9xbqqUUP31vXuNaKG31D5Ri4toixUVbA1U8wqJwCcTkulq6LMv9ZjsHtUdQJbsEZuFtoh0YyvGOebabsfzTMIyiL588CqECMckMzoO6kqZWH6n/V/FDu3Dg245L/uVXS1QIakol7Sq3yqV5el6ODVSUvL+XQpPxkEpQeBKOwPHEuW5bkXKmCFFlGYQL2V79dRYwHPoNiKORfhyrB6Mi3ktMjVpJNNEg7gEApAUcpAbcgdlNDzsHahOL2Nf7jJr8tJfr6hLOg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=siemens.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/p67vmIY/Fneb6HG5bxUjEWN4F32JzVe+9+tD5gl8o=;
 b=pY1YzJSPVDS8IgAlA0zbM+Lm2/zXuKomMqgqjr8803O4kwt00iXCmk/2W0NNXKodppYFSDXRrKvO9MpN4O/FCbcreol0rsqqzgLDhJvMVCqI3HIFsF23PK4hYZIJqWYe8Qf2qveyg2yN6H/yOwCTo1RB/AU2VgvGIUEliXEwHE8=
Received: from CWLP123CA0174.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19b::20)
 by DB4PR08MB9239.eurprd08.prod.outlook.com (2603:10a6:10:3f9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Thu, 5 Jun
 2025 15:55:23 +0000
Received: from AM2PEPF0001C717.eurprd05.prod.outlook.com
 (2603:10a6:400:19b:cafe::fb) by CWLP123CA0174.outlook.office365.com
 (2603:10a6:400:19b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.21 via Frontend Transport; Thu,
 5 Jun 2025 15:55:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C717.mail.protection.outlook.com (10.167.16.187) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Thu, 5 Jun 2025 15:55:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vaE8G8JAE1CTJAymP3FrnOH4uHKEkqM83UQoUboqxS3dto844UGUxCxjq3ihqpgfTJQtUvSvYpdUWlsgJWtqRiu8tQJNerCZD4S21IeXh9u+FYmwErPEtW9j14GCzkpgw4jVG9obbmVSzzgeFKX6WarExpWf/EGD20KFnHoKxs2S0n8CfOnb7Y1fUmOOVsaeWSZX11U0RoYXwFWGF8bICjPPU1kX+/qHVh5+YrN62Wjeyfzm2+ka/4mH8ELRk/lsJnSyTiMIxT8AqwSC6Dj4xBV5cmGO6snOZ94cOjJRuDETV4CElCum/VPAuXl0EO1ysISMaiMh2R9FPL+TB1wccg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/p67vmIY/Fneb6HG5bxUjEWN4F32JzVe+9+tD5gl8o=;
 b=p+NPw6DmZROEJTP81ymWTowlb+GICyUEBDkCgEe0pN/kpKJmhOOSlkUL4EBaO/GaTYXzYFN2UqIw+EV7iiMULWej/bZvpjvXusOupNqmFvtPjWPD/64QwXFaArqpTHwkOir1Ke74SCT9RGX8VRN6/OAZtpIsFTa9rRg0tQbAgZb/My3Cerz2BQULG+Vrhz2yWxxwe6UOKCi1HM/Mh15UvzB4aTJ70noMWtSqzih6+AmaEXq+KmIb5BzlgDuH3if2HME2c8vCVHkUMPxgMX1xFbE8oEEwge1TMmOQkfV2jcRqDynIqG0AM/Jd07fDhnm2r7R9LV2jg20m066O9Gx0WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/p67vmIY/Fneb6HG5bxUjEWN4F32JzVe+9+tD5gl8o=;
 b=pY1YzJSPVDS8IgAlA0zbM+Lm2/zXuKomMqgqjr8803O4kwt00iXCmk/2W0NNXKodppYFSDXRrKvO9MpN4O/FCbcreol0rsqqzgLDhJvMVCqI3HIFsF23PK4hYZIJqWYe8Qf2qveyg2yN6H/yOwCTo1RB/AU2VgvGIUEliXEwHE8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBAPR08MB5640.eurprd08.prod.outlook.com (2603:10a6:10:1a3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 5 Jun
 2025 15:54:50 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8792.033; Thu, 5 Jun 2025
 15:54:50 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Marko, Peter" <Peter.Marko@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 01/16] libmodulemd: put version in recipe
 filename
Thread-Topic: [OE-core] [PATCH 01/16] libmodulemd: put version in recipe
 filename
Thread-Index: AQHb1i90RGu1h4eni0KBKTT68BwVkrP0t2eAgAAAhAA=
Date: Thu, 5 Jun 2025 15:54:50 +0000
Message-ID: <C3E42CB0-FFD2-45AF-B7F9-D326F42144D8@arm.com>
References: <20250605153508.961682-1-ross.burton@arm.com>
 <AS1PR10MB569780F67AB030E8A0B92B50FD6FA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB569780F67AB030E8A0B92B50FD6FA@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBAPR08MB5640:EE_|AM2PEPF0001C717:EE_|DB4PR08MB9239:EE_
X-MS-Office365-Filtering-Correlation-Id: c6d9fdab-a50b-45fe-d47d-08dda4496146
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?eGRjcFBYTWpKMjRSSTN3V1JtSFNLdCtNUmxSRHV6cTM4UUpMYW0yRy9xakl3?=
 =?utf-8?B?VCs3dW9LcHVPSnJGeEQyNjBmUm5pM3hmK2dUcFBYQjNiTXdjMnllNTB2YzBV?=
 =?utf-8?B?RTdFSHhYWVREVm9GWFBGTFpqTDJBa3F4REFJRG9wR3hqQmliKzliYWl6Qmpx?=
 =?utf-8?B?ekZFSmJDTnpCWldkUFZ5THRLU01lZ1c2LzRpTWZrL1VNSmN3N25PRlVlQ2Jw?=
 =?utf-8?B?NmM3djVjTlZnZVlGVGxvaFhiaS9acE03NS91djBnVXRUbGo4WDNwUjNHYXg3?=
 =?utf-8?B?SWl3eEtvQWVzNUNFMmNPU2tYY0tIKzh5NDV2dWsvQ05kSzlJaWNYdC9aRzV4?=
 =?utf-8?B?M3NyaDQwajdNajBMZ01OVnhMZFl5VUhpS3FJN0dYT2lzOTk2QmNJejlSV2pz?=
 =?utf-8?B?Q3FLUW51dzhOVmw5R2lVRnE5eFpVU2E0NTQvUE5ObVNSM0ZBaFhtWUx0ZFhK?=
 =?utf-8?B?bS9kd3BIZnppVUVHcENqNTI0bTZscG84WFU3VlNMQ2NDRm1Qb01LOC9iR2Jk?=
 =?utf-8?B?ZktEK2xtZnRoSmI5dE8rc3l6RkJ0RjI0ekYvTDd6T09ZMjhwd29jTjA4WnRE?=
 =?utf-8?B?dU1JaUtHaVgxT0tEbDdFTkNaRE1ya0NiN0JtOG9iNStMeGp3SWpXSEdnNnBP?=
 =?utf-8?B?dnROdWhGcHdCdklMaUE5RzliOEl6dlJOYUZUVjA0K1pCRFlPaXAvODlPUGFC?=
 =?utf-8?B?UmNEdG1wM1pPZW5TSTZnUWE0c1RVdmM4QVU2TmZPQUZjK1h1UURIUmR3QlJ5?=
 =?utf-8?B?SEJTd3hkMFVuRXFTcWpmckgwYkJ5M0ZHdzFobW1CQUpRS0dUbGI3dW44a3Fp?=
 =?utf-8?B?dElJZHNkVEp2R2hhbUFjNFZWS29VTHBvdUJtajkzdTNtcDBQaE9nWVJxRjdN?=
 =?utf-8?B?WGpjeHFVRWE4Mms3Wms0RlBzN29GTkdwR21SaTdNNXZLVUtlQUNraUlPOHpt?=
 =?utf-8?B?b1p3VG9OaktaVlppSkg5aU5LWTVHZDFqZnlHR05rSURhTUZjUjU2Znk2c3lM?=
 =?utf-8?B?b1Z5THl1VlVRRUhPSmgvWEpBcnZoWWxSeEFKRXlwS2VHTDFrNmhFWCtrU2pH?=
 =?utf-8?B?c01ZRXF5SjlmUkNzRkcyWUhKRk1TRTJHQVhqNFRkbGR0ZzFrZ2lFVkZ1Q2Ur?=
 =?utf-8?B?bHhCaVNKOFpVK3VwVXdZQWRtNENWTHFmZUJKV01LL1dHK0dTS1QrYlhvSXpK?=
 =?utf-8?B?SURaMnJGelRKT0YzTk5kUzV4RDJ3YytTVWZPei9tMmRPcjEzVENzbjhoekV0?=
 =?utf-8?B?enJqTFR5R3AwWENWVldnY2grMDNBV2kyZzFCcTdwblkxQUVRb3VKSzcvcER0?=
 =?utf-8?B?UXdxNm1KdEtkRkErc0VIY3VvWFVDZTdKMXhVOHNQcUgyUjBCditwOEZPeTZF?=
 =?utf-8?B?WG1SYjNtYXNwbFIzb1d2QkhQekNSbnFBUDdod05seE9JQ05MUFltbEo1THZa?=
 =?utf-8?B?L0VoNktCK052NnY2ZGg4NWE5NXZhaVNEdmZ1MkhIQUFmMjNuczM2ZFcrNWZK?=
 =?utf-8?B?QVR3OHRQNC85REhtTFVOdXc3UTJQR2lqNjZmMlArcHFTd3A2UlJJVDRQdWJT?=
 =?utf-8?B?bnJCS2YyVVQ2ekUyWWEzZi9ReC9kdXRjSGI3cWlrV2h2YTZnNEsxU2ZwYXpH?=
 =?utf-8?B?ZjZEV3NrQVBxUVNTLyszSE4rYjhIYzdFNStoYnRxOVdwV0srd2NLU2lEcytG?=
 =?utf-8?B?cVBjSXR6RlpobUIrT0Vjck9ROFF0Q3p6MUFyVUIydGpucUlPeHlXRWxVUytz?=
 =?utf-8?B?KzAySmprVXpMU3ZKdHN2YUVVYktRcFducHkrVkl5S3QyTWgyVE9iSjRVL2gv?=
 =?utf-8?B?Z0dSNEtkS25JY3VoeFBvM2JaaVhPSGlpV0dZMXhPUkJ0cm9lRHFnMUhNVXlG?=
 =?utf-8?B?VmRoVEdmU3dnWGNjWHJ6MTA1UEhyeCsvNkNKTG1LdzZBTGhKWnhEUnJMckJB?=
 =?utf-8?B?ODYxSHBzNTUvMFNqN011dVBHbnRBeDNwWFZrNTFxTFlwOTJ2dHNwTnROOTB5?=
 =?utf-8?B?czJtMU40VFNBPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D359424E827EF944937976C592A1AEA5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5640
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C717.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ffe05745-a806-42ee-2bd9-08dda4494e11
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|35042699022|1800799024|376014|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N014T1dtL0xPYXRFeCtRRmxhSGVGZkFvb0loMjlTZ0FDaTdMTG41aHJrT3dt?=
 =?utf-8?B?SXBWZDFxZXR3Rk9hTlB5RitNOVRXQmhkVUdtMGl4MFFYV0FOQUVaMy9CVjhK?=
 =?utf-8?B?U2F3TUZrVmN6bVZHN3B3bmJQY05vaDBQYjQxd1dLWVBZUDgxbXloL1NQMGZU?=
 =?utf-8?B?N01XSy95OStrLzliQ3JlaDZWYlkxbURJNHJzQy8rWjEwY0JlOEFuNDhsNlEz?=
 =?utf-8?B?d0xLMUFPYXhtL1c1RmJ3MjJZQXcxOEFhN04zS3lvWHRQSlNmV0lteUFKRVBp?=
 =?utf-8?B?bTViMTlVdXpzVDNhWVF4amN2bVJsUzgvK3liWTlQV2tKbkpEWExNWGRGTk5v?=
 =?utf-8?B?TkhhdXpjOUlVek1GL0FvMlVPVmh3bkV5aW9hWFJRcGEwb0hNdS9RcXJUelJV?=
 =?utf-8?B?R2ZqWE5BNHRoaWR2SFVyY2UwK0ZDdkVRRTFqeUtHR3hXUDluSEhKRXZWRE1B?=
 =?utf-8?B?bGhRalo4emdoY0R2RFU5eFRGN2tjQlJvUTJVL1BPUnowcU04ay9EMnFMazhn?=
 =?utf-8?B?MytBZjBydHhZY25uUkFVeDVrMndTbVRSN2xEYlhhWjVuVzJ2UEdiUmc4MEVp?=
 =?utf-8?B?bklDemVJUFJ6bFRBQS9uYXJ4NHFJTmZyRWFoRkw0S3BoaG1tTjB6QnhKL2w5?=
 =?utf-8?B?elB2bFcwUHovNkxtZXJpcUkwMy9IZ29lUTI1UzZlazVQakVtbGpIYmtUSHdK?=
 =?utf-8?B?aUVqNXdHZUwvTjhpODBiYVpIRkZKQU1JOUc5WTNQTWdCVlRJbmFaTUpZR2l5?=
 =?utf-8?B?NllvNm5zMTlrRkNnL1JYVmhzWFkvanlCY214UzlUcnc5SHMwYXRtM2NTS3lK?=
 =?utf-8?B?dnNpaHN5SmhqVUJ3QkJQdmtnQTBvbFMzVGJiQm1RTGs0YWU1ME96WUtRRnk0?=
 =?utf-8?B?SHR2YnZJOXlvQ2IzeUNMOUNPaWhuZmh0cjVuL0FzcHpXVUFBS04rVEJLVWZC?=
 =?utf-8?B?NkVNTktmU2M1V25jdmo4M21TTlBCeWFIMWVmNGZCcXJSNm8vc0FHWlBMVWNa?=
 =?utf-8?B?ZU43Q2NGdWYrN3hmU1RqeXhyN21ycDJWUXAwbGl3ekg2Vk04NkZrUVhNd0dt?=
 =?utf-8?B?UlhwbGVTSGhjODJnTDlkRnZFT0VoTXk4U2JNYzZkejRIaGZQMnQyV0Iwa2ph?=
 =?utf-8?B?MEZUQkZYSHR6Tm9IMWhPUENWYmtLS2FUMWtNa1lZOUE2bjlCemtNem5iT1lw?=
 =?utf-8?B?bkt0WlFSTnUwOHN6WklRalN2SVFDNFJPZ3oxMEN3dkprTDBNbFY0M21FNUY3?=
 =?utf-8?B?Y0h2YnFORGxiamhXT1BKSjUzWGpSV3c1b0xWZTgrOWJVTVE1dkN3ZFFnVkpC?=
 =?utf-8?B?bGhpTmd1ekV4cEh1ZlFJSnF0azExZ1VwNzRWdTNQZTBiMXVRakZ0d1JPanRq?=
 =?utf-8?B?Z0dWRXJqYkFpZ3c1MWF4M1VoU3FwdXZpNWwvZGhDQWVtZHlPYmM4UHpJM3Ry?=
 =?utf-8?B?VHZjNTRZQ2JMSzRvdS9WSXJxZTZONnZzNUNHQlFIV3dockt0VS95Z2JzN2xv?=
 =?utf-8?B?dy8zTXlyN3k3TUZiZEVQcmo2dUlMOGRPZWI4MFcrcStpejYyZ1lPbkRZSnZR?=
 =?utf-8?B?c0h0c0FtZTFBMjRDdEhQZjBob0QxYzlkL0wvMktEK0RWR29QUnh5OTZhZ1hS?=
 =?utf-8?B?T211YXo3RGF1TldtVEpteDUrSU01UFNTUkdOSmhEL3F4MVo4MC9wNzZTdUpr?=
 =?utf-8?B?Q3BhN0V5UStmL3NraXM5NGpWUnNhNFFtNmhaZ3NRQ2pBTXZrNDNQN3lvT2Iv?=
 =?utf-8?B?OXJVQmtPdFh3M1RSV1ZtUHY5ckFOYUxsTkV6ZUZjeWNaS3ZQbGRLL05xOUpY?=
 =?utf-8?B?LzJhMmtHUUI1T2xvU1BjMGFJWituNXVkdk9IaFE3TEN6Z014NThvMDhUdEdM?=
 =?utf-8?B?THI2VUdiYjBxMDhEWTIzeEYvYzBScU11K3NaYWg5K1JTd3gvMitjUWRlN3FD?=
 =?utf-8?B?OVI1cFF4S2IvQ1FSYmNSbDd2NkdVQk00bEpJd0RoQVBZSXVod3VPaDFacHBh?=
 =?utf-8?B?MDJUS1Z1M1VZZ0tKeXpaVmY1WDErK1NPNXdmQ1pnb0Z3cnR3T0tiU1BaeXpr?=
 =?utf-8?Q?F82uGm?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(1800799024)(376014)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 15:55:22.7739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d9fdab-a50b-45fe-d47d-08dda4496146
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C717.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9239
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 15:55:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218054

T24gNSBKdW4gMjAyNSwgYXQgMTY6NTIsIE1hcmtvLCBQZXRlciA8UGV0ZXIuTWFya29Ac2llbWVu
cy5jb20+IHdyb3RlOg0KPiBBZGRpbmcgdGFnIHRvIFNSQ19VUkkgc2hvdWxkIGJlIGRvbmUgb25s
eSBvbiByZWNpcGUgdXBncmFkZS4NCj4gUmVhc29uIGlzIHRoYXQgYnVpbGQgd2lsbCBmYWlsIGlm
IHNoYWxsb3cgdGFyYmFsbCBpcyBnZW5lcmF0ZWQgYmVmb3JlIHRoaXMgY2hhbmdlIGFzIGl0IGRv
ZXMgbm90IGNvbnRhaW4gdGhlIHRhZy4NCj4gSWYgd2Ugd2FudCB0byBhZGQgdGFncyB0byBhbGwg
cmVjaXBlcyB3aGljaCBhcmUgbWlzc2luZyBpdC4gYml0YmFrZSBuZWVkcyB0byBiZSBhZGFwdGVk
IHRvIGFkZCB0YWcgbmFtZXMgdG8gZmlsZW5hbWUgdG8gZGlzdGluZ3Vpc2ggb2xkIGFuZCBuZXcg
c2hhbGxvdyB0YXJiYWxscy4NCg0KW3NoYWtlcyBmaXN0IGF0IGJpdGJha2VdDQoNCkkgaGFkIGEg
ZmVlbGluZyBzb21lb25lIGhhZCBhIHJlYXNvbiB3aHkgdGhpcyB3YXMgYSBiYWQgaWRlYSBidXQg
SSBjb3VsZG7igJl0IHJlbWVtYmVyIHdoeeKApg0KDQp2MiBpbmNvbWluZ+KApg0KDQpSb3Nz


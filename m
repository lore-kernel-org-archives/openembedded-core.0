Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CAEDEE208F
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 11:17:42 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9410.1770376661235331538
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 03:17:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=RJngDnAD;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=RJngDnAD;
 spf=pass (domain: arm.com, ip: 40.107.159.28, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BtKSLUYN7Z8qxywTd+TbnW32bCJNlU5gPyllb++VQtRrPq2UlBeivFWl3iRQQTKCkWaRxwWxjkA8E520gPSWF6LiWUEdj+w4BdbOv0HpoQwat001AMLoOsAUizc0xIw5/yxGJ9wKUzobbRFOEcbNdwiza/JswmkLF9Cukzo97MyyVKU6VBnmAWnciPOiB/zP3MGrlLwURUcj5kWNOkdmsi5Y11ldUxa4iuSkIcoZmHxJUHzQqGJPztpP8OFmMtEj1hokeiGM2uATruc30GuoYHZUlWJ+6LtFwjMYSlfJ8peE0AY8OJBU01gSlVbFIPfvp2Fd7kKPGfdnfVCuawTL8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRlEXXaeTouSbmRtWc+y9lx/VSfm0GAec+//82cCbcA=;
 b=cyOdv2orZ2SAT3ohSnAQBNTx59U0AE0s8Pu1bYhdCiIBZNWTAkWaX/d6jRAI4CyrCa2uP/oD4z4DeribdK3FiW+6Z0hxgTjWyC7o4/q61Z9XGmMd6H5hgwqQhXfE8L2Oce9u86p/k08ijFqRKra/AQnHJpFHscU2GCPPX4XQxKem2DxGj48FTc1ColMs+IoqVIuNLDQohfiuwqJ+YNsQ+h+btAiQiPZ6Rn+ScQvYWIC/4tJ08W6cZNU+m8FaFZ+bl/nAmLp0sGXVQ9ybVKd1ZhuIViEBED60Za4XCLoWjEUhemIuxsMe52qSz+iXDSuy8Puas3/cQJ/w33rsMA36ew==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=thehoodiefirm.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nRlEXXaeTouSbmRtWc+y9lx/VSfm0GAec+//82cCbcA=;
 b=RJngDnADeUgUfBN9rBUX5IQsyzvGcOtzCHdTtDY57mDNYlPCWA1RvegC+aLbFWDh1X7fLZoZCEpDVEE9hqcShnjrlS/q9ZrOg9zyH5XM5WXNTbxvY9R3nXdugSj+KQLjNKCGzDX46NEP1CFW+v9vdX6CEKyECslj8ml9ZJc2FQU=
Received: from AS4P192CA0038.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::7)
 by GV2PR08MB11740.eurprd08.prod.outlook.com (2603:10a6:150:305::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Fri, 6 Feb
 2026 11:17:36 +0000
Received: from AM3PEPF0000A796.eurprd04.prod.outlook.com
 (2603:10a6:20b:658:cafe::ec) by AS4P192CA0038.outlook.office365.com
 (2603:10a6:20b:658::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.15 via Frontend Transport; Fri,
 6 Feb 2026 11:17:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A796.mail.protection.outlook.com (10.167.16.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Fri, 6 Feb 2026 11:17:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MB/7Ugf+d2OGC0tXGUVdvy35rz0b1OFo1206uqrpiKMx4LN8OMT2XENzrChN6/L/SBM/1aLnUzz3J1js6X/SNS/tC8U0pT+IzWEbch1RszGRYfo0sG2vv30187Az2U44WUDS5CbxaP7Nmh/dpsTXKAGcwZZEnKQ3gJ/wmTGpTeD6+G4e7vXnnqcLtiTyLy4sMcYpmzlvB8zmSOP7KUziq9NQULrUxpddFOAbQHTSsGyetZwWyW1V5yqWBaQE11q13JtGNL8so7v6uWDhmhnsZvm456feFkh5rJBAoyeWyyUn+zuSJp1TOIdGDbxFluhWa2+8l0WT1idl+hL5wuAdKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRlEXXaeTouSbmRtWc+y9lx/VSfm0GAec+//82cCbcA=;
 b=gDbG5GILWbwy3tCmiP5q7ytSYuhMsO3pFOs8yTxvNfX/FnTxUAhRLFCvPcRppoTzPTa1nFWt28Dd7H9gtBqjteg6brl6x143ukQFBcEIbyevSgJcEFM7ra//8jehTGd6QXi1ZLYjXvKIOkyQ9Vfb3K/hUwVSdcnccEUXfY6J+YUVGweWluFLox577yBTUmJReWcn9hXf8Vp4WEGuuyTCTiw3wY+loEE5AM8Zpp1dBJl2jiQDnUtiKKLOxhpLFJh8OOOyrkiLeMH/Q9syqYfGWQWbLoyA4cG6gMbtV1PHdPV4CBPUZl3ucEiBSxzkGICW25zXM5H16wClLeqV9rffWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nRlEXXaeTouSbmRtWc+y9lx/VSfm0GAec+//82cCbcA=;
 b=RJngDnADeUgUfBN9rBUX5IQsyzvGcOtzCHdTtDY57mDNYlPCWA1RvegC+aLbFWDh1X7fLZoZCEpDVEE9hqcShnjrlS/q9ZrOg9zyH5XM5WXNTbxvY9R3nXdugSj+KQLjNKCGzDX46NEP1CFW+v9vdX6CEKyECslj8ml9ZJc2FQU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB10012.eurprd08.prod.outlook.com (2603:10a6:20b:64f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Fri, 6 Feb
 2026 11:16:32 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 11:16:32 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alba@thehoodiefirm.com" <alba@thehoodiefirm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "engineering@neighbourhood.ie"
	<engineering@neighbourhood.ie>, Alex Feyerke <alex@neighbourhood.ie>
Subject: Re: [OE-core] [PATCH 1/1] build_perf: add commit annotations
Thread-Topic: [OE-core] [PATCH 1/1] build_perf: add commit annotations
Thread-Index: AQHckFXzoSsnzQyZcU+4Rp4O5n1OSbV1k10A
Date: Fri, 6 Feb 2026 11:16:32 +0000
Message-ID: <F8985EDB-2808-485E-954C-685E56F9E526@arm.com>
References: <20260128125745.58440-1-albaherreriasdev@gmail.com>
 <20260128125745.58440-2-albaherreriasdev@gmail.com>
In-Reply-To: <20260128125745.58440-2-albaherreriasdev@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB10012:EE_|AM3PEPF0000A796:EE_|GV2PR08MB11740:EE_
X-MS-Office365-Filtering-Correlation-Id: e80b6557-5458-4213-1006-08de65715485
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?QnorcVFWRld3dFZYSEVlanFiaU9UTmJCS1lHeDhJQjM4QkRGbGI3aCtQbFYr?=
 =?utf-8?B?dTVRYlBWZTdZL0h1MHJsSnhiVGVnWU5KbStqR05zSWt5cG9KMlZCWmxNdDJu?=
 =?utf-8?B?Z0tXdy9OYkd5YUQrRkVNVUNzdDVKdmQwTUtyWTBSMVVXQWptWjdMRVJ3UDU5?=
 =?utf-8?B?aWpFVGlwdnREczI5VW9sc09TRGZIM1RGUHlxeGJCbEV2eWRPTkhoc05IN2Vv?=
 =?utf-8?B?YTJ1Z2tTQ2RwQmR0NVIwaS9mMTJGRVVKRkVBN3NZTStpaWdabGxWZWNoQTdQ?=
 =?utf-8?B?T1VkeHNyak5mTEdMMGJBM3NwYkJZdGdkQXZiMDJWRDQ5eHlDZURsWjRtLzkz?=
 =?utf-8?B?ejhEdktxbUZyZkJEakhVdVZEZ0RiNm5nK0kweE8rSlZTenQyRnFLYTJkQkQv?=
 =?utf-8?B?Q1lvNnUvSVhRUnNVem9ZN0F1WWhvTWZuQXhndE1RRFljSTVwQVZJUHdrZytJ?=
 =?utf-8?B?cExlWmFITDh5bHFnTkFjSGlDUExnT1JOMngrUDAxUGxtVVhQdFk0Mzhtdk1H?=
 =?utf-8?B?TE9RSkxaaWtiUXJzQjJJWEtBeUhmMjlGZGZGMEdUOElVN0hGRWt1VEtoOWcx?=
 =?utf-8?B?N1RPaVdrVG0yVkJxYnFnRFF0ZFNRdXVUdmNLbUd6a2ZpL25jZWx5djVoSXV2?=
 =?utf-8?B?Ty90QTk1ZmVGaE5DQlppVk1rRUlWWkE1Y0ZiSGVUbUFPYXk4b2pzalZnSllZ?=
 =?utf-8?B?dW5WZTdwcEptT2hKQ04zSkxWaVpOTXVwUmxOSFZDWGk4S0RSVldBL3hYZGhm?=
 =?utf-8?B?YmdVZXNSTUh6LzNxODd0Tm80Q3FQY2cza2wxckZBUmlyRmdhc1g3eVArOHlO?=
 =?utf-8?B?UEZtQnk3d05uSnhDYThFaFhONUpONDJCV3RCWHN6bWw3Tythb3d1dHo4RmNk?=
 =?utf-8?B?OFFIWFRERjVDYVU4ZUVTc2xaZjd0bklTMEJZMnRQTUFrS3BoUlpSc21HOVZF?=
 =?utf-8?B?cXlidnpWRVJPdmNmRWhJazNVUkJPTWdGT3haWkRER0FVYkU0cFNXekxSNU5K?=
 =?utf-8?B?d0tLVHlUVGdhQXNWN2w1QnYraFhSajY5RlBsaU9yNWJtbUorUUExTWhqRERx?=
 =?utf-8?B?QUloSUJOWU0xU2g3TTZEaU53Q2Q1OUdXQjZibFE4Wmc5aHF2L0lxSlhKYXFD?=
 =?utf-8?B?Ymt0cC8zU1kzNWVIMXhRaHBJL2ZseDc4NW1HYnhqdHQ5QUw5NFpnNCtqRjRS?=
 =?utf-8?B?UVMrekNQMWJJaUJLL2wwYVNtN1hIRS9MczI5dnNSYzMxWlRRM2E4OUlNSmpy?=
 =?utf-8?B?bExMU3pPZzhQbk1LMTZRcHdTMWt5TnoweGR3V29JUmk2a09QZ0R4L2VkcGIr?=
 =?utf-8?B?SkVNUFpBMmY3QW1nN3UzMk0xaW10eVZrNnpENFZadG1qV29QOGVjTmliQU00?=
 =?utf-8?B?dHVSRURaV3VhMTJjT3VDNFJBVVkwMzhDTnJDR3ZKZUN1dngyaUtFNzJNZUd4?=
 =?utf-8?B?c1cwNWpjWmVndmdWVm1zcVJUVk1pTkJ6VUZ4VzVuUStLRzZnQjJrYWZWL0pH?=
 =?utf-8?B?TmJtVmhxbDk0STExbHFUR3hQYmN1UzhVNkRvb3EvR0lsQXBoTEIrK2czV2JU?=
 =?utf-8?B?TlVoRkpYVWdIb0s0dFdoYkFaUWNhMXhsQkVMTDJRZGFtdUllNURKdGpvamFa?=
 =?utf-8?B?UTdiNk5tU3UvR0g4alBBdzZqcEd5elJyN0lhcjRSQ24vOXRmTmdtdTR5aG1X?=
 =?utf-8?B?ekF3RHNWbHJEN0t3WmJBdkdkbWJhSjhVd0NZZzU5NWpwVmxPQlZxZWhvV3da?=
 =?utf-8?B?dlZMSkF2K2xiR0t2RmNOVGZHNndrem9UZWxSZlZ2cEhwUm1DR2cvTW9yVE1N?=
 =?utf-8?B?ME9td3BPUU1MSlI1NWNmcVd1WnVTVUJubGh4UG8yWW93VnFqaE5XWkNFZVFP?=
 =?utf-8?B?Qm12V1hTMFRXM2FWMXVQU3lWeFQya2NaNktpYnA4VGEwUHpIbTF1N2pCbzBD?=
 =?utf-8?B?SHFMb0MzSlVGTk5tWDNyOGdMZFhaUHB3V2taMzF6SjhyUzVsY01xQUVST0Mw?=
 =?utf-8?B?b0JBa2dRRDlLVU5KWEpaMWF4eVlMWWxMQUhqVFIzSGMwWUQ0Ynl6QnNidmVE?=
 =?utf-8?B?a3lSd2EvbDlRenVxUStxQlRwUEhHTlBrUENTL2tFZ0pBcGdFaGpvRGdieWxC?=
 =?utf-8?Q?RAljOpWSK4FIFFkXDp9eVQ45o?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3A91A72435388045852E5697954B467D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10012
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A796.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ec413f76-80c7-4a4a-0016-08de65712f18
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|1800799024|376014|35042699022|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ajhFOTRXL2lXd1Rna0EvdFozSExkcU9BcW1JaGZoSHNad0wzbFhNYVFqNUVK?=
 =?utf-8?B?T2ZqUktGOWZwTGdvNi9pVHJsa04xNmVPQ3NCTnkySWpneTF6RlJNWEF1THA3?=
 =?utf-8?B?eHE2Q0N1bDBvdUhrS3dIVGMrVXptSGdQcU53bEl4QUlWNWNyNnFKeDIrcWRI?=
 =?utf-8?B?aTY4dzZJZ0ZZL0srKzQ5N0dNclJtMW9KZnN2aHdGb1lKR2Q3NmZqWHRjKzRx?=
 =?utf-8?B?c0tSTVlYSEdTVDZLWG53eUpEZ1JlUjE3WEwvaGgxSmw3WDlRcnJmUmh5Zlhq?=
 =?utf-8?B?am5NWE5jQTl5MVN1YzVjaGRLVlBpZFM5RzZQT2VnMllkU1hMbTJVRXJnbXZM?=
 =?utf-8?B?RVNuK2RrcG51bG4xMTRjSjhqQmVGOTlVT1pvTWVBUGdhdUs3M0pLSGMrRFdo?=
 =?utf-8?B?cFlTOXo4TGhlYUZkQzhlMTV6UW9vaUFFZWNuSzFLTEUzK0pxTlpvOTYrdEw0?=
 =?utf-8?B?SVB1RzZUUlhhOVNOQnJSSUsvUnFpTThtQjdQckJiOHRtOW1TbXhuYTJ1Q09H?=
 =?utf-8?B?aGxaVHVwVW5SMGlNcUd1L253K1J0UVgrSW0zVVNtVWtaM1grbWp4V3FtODAr?=
 =?utf-8?B?Z1RURlVQM3RPMDZoOGJwRHRPWnVnTVlyOG5uV0dKam54TTVHY3phVWE3SEpI?=
 =?utf-8?B?MXg3cG53Z2lPTzBZaWlTdDBtMkw4U1JVT3FrbVpzYkdXejE0MVdqaXJWRXNX?=
 =?utf-8?B?VjNGRUtTblN5ZE5aM29sN1ZDUE5GV3FoemNsSXBWQ3RwOEYxRGcxdkhRYkFG?=
 =?utf-8?B?NEsraWpJanc1R0ZPSDNINXJjR25hZEJid1FZSmJwWitaUlBSUDk1K3ZUSnRr?=
 =?utf-8?B?aER0UWpzRG5nVHdTUm9paW56cU10L0VueEh6OEpzOC8rRlp3Ykd0M0V0bCtp?=
 =?utf-8?B?RzVlblhsOEZSWnd5MDA1SEpIZWJVeDhmbW5ZaTJRbUtaZHBxOVd5M0tNWTBh?=
 =?utf-8?B?UHJPR0s0bkhrNzVBa00zWWFkMDFHb2xBMFF3ckRXSC9ZZmhWalFodjVxNWdO?=
 =?utf-8?B?OFRzZCtrMkx3U25pdWo3VzFscVhvSVMyV0RvM2ZzK1djdTdSbnFKM1lCYXdQ?=
 =?utf-8?B?d2JvRjRhZkVKRmJnc2ZjNzJRTjFJTGNBa2lOeW8vbjRwdXNla0dyd3VqRVQz?=
 =?utf-8?B?dklUR3l3ZTQ5enpNV2RWbDYvb3NsMGQwczF6RVRBWjhYNHRhM0pldFZmeUZx?=
 =?utf-8?B?aHFKRjYwaURXU0FiZXZPc2RuSXFWVzY1cFZPU1VuZDVnOWtVc1lOc2lmTTdh?=
 =?utf-8?B?MEgzU01leVRGL0NOSzVnU29Md1A3MXFVbzkrSW1jbXp0R2FhNW9EcUY4cmpn?=
 =?utf-8?B?WEVFRVBrNklxc2V5MG5talNBWjhTdWlMbkV3ZVdFNThTa2ltMUxhNEdOOXpl?=
 =?utf-8?B?VmxQdHBPTkkvQ1JBYXdxWGI2SEJQSCtPelJQU0NCQ1NwTnlYOTdkZGlJMUZS?=
 =?utf-8?B?U0R3S0VkVk92cWFCQTVuOVcrNVRZNmEwYnVLZzBuaGJrWEpnZUhBRUNrQXNu?=
 =?utf-8?B?dlVxbHpoVkRjRzgxQmFMd20zUGNBMW5oRFFkSFRNTFlwVFdTL3lZRGpLRkdH?=
 =?utf-8?B?WGNyUHpMUHJFVHRLQmYvRWNiaFJwL0V4V281VDR5ZmRTeFkrSXU1ODR0cW92?=
 =?utf-8?B?WWNjTWxvdXhQQmNoUTB0SDJVdVI3K3ZrYWRXajY3eWkrWmdrMVRnSERWVjI2?=
 =?utf-8?B?TGtyb3ZYTi81aTNielowMEdRMkFYQ0pOVytiVGlPUVhzbkRUUnQzN0VrZVpD?=
 =?utf-8?B?Rnl5dk9NTXl5UzRNMTBKaUp3STViOC9hUkF5SFJkbGFNNERrS0VFNEwvaEVV?=
 =?utf-8?B?dElEckQ1MHdGamxzblBxNSt4TDlpRUFCTUZtb3hrU0FhT2FpWWNUcXozVnZI?=
 =?utf-8?B?L2hRZlo4NDJDeENoN3Voa1JJbnh1TFd1NXppc0ZNLzdQNTJCQVQ4WWI0VU0r?=
 =?utf-8?B?UURLZ05jUmZGcEU0YUdMSGpIV25EczdjQXJ1NmpGZ2p2UVpKdElmSmkwdkxu?=
 =?utf-8?B?NXpXUmFiY1Q2RlhoTGpIWG41aXRNTWtiREJuOEFObmo0cUtpL2dITE8yNEJx?=
 =?utf-8?B?a00zWWlSYi83aGkyYURKWnFJOGFEQzNPQzZMVE5FZFJzWWw3a3FBRnhEU2Fm?=
 =?utf-8?B?UnJhWGdFTitLWFAvVEluNkRlNVZDTGk5RW0zdDVhQndKMlNPYWY5ZjlPc1h2?=
 =?utf-8?Q?uNmtWJnUY8P8ZaSdmGkXhW8=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(376014)(35042699022)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	VXKIWXJZ6+slvsy5pJUCsxWx0HcKf/Y59Q/vgXmj3xJPdIgpUBBbeBFgDzUV0jN4dstL4RxooHctanUMEn1om8rulPPj+o9Uk6nnW2EhfzbGE4a9GUmcdy0erk55RnPuwApPQez1p73qAJzwXp+hSVqRL1vytmluK8+xIv/28PTFsMUOUmHxC2tfn6sekvUw5rciyHHkySQMI62E1/Gi2kVmpgq03rWYHCUttppXFRVZeHgVboKC7SqozQBg3M88qA+KRGNo0zF/CtSaIrxA77iOURHKHacuudOulB5muHxz6Ql1wKK2BegpaYIL2iL3iFHuuKmHn0CEWB50EGlzRo2rqFc1VsZu2+z+eRkyaegM8iJLr4QTrVmixurQQfnYKYQpOIj+1sLNbcalYsAUfSB0ZIR9je9I05aqigSytgXmH1uDC8JgZC18RNhlnB6l
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 11:17:35.5994
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e80b6557-5458-4213-1006-08de65715485
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A796.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB11740
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 11:17:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230613

SGksDQoNClRoYW5rcyBmb3IgdGhlIHBhdGNoLCBtdWNoIGFwcHJlY2lhdGVkLg0KDQo+IE9uIDI4
IEphbiAyMDI2LCBhdCAxMjo1NywgQWxiYSBIZXJyZXLDrWFzIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxhbGJhPXRoZWhvb2RpZWZpcm0uY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdy
b3RlOg0KPiArICAgICMgR2V0IGNvbW1pdCBhbm5vdGF0aW9ucyBmcm9tIFlvY3Rv4oCZcyBnaXQs
DQo+ICsgICAgIyBtdXNoIHRoZW0gaW50byB0aGUgbWV0YWRhdGEgb2JqZWN0LA0KPiArICAgICMg
YW5kIGFsc28gb3V0cHV0IHRoZW0gYXMgYSBQT0pPIHNvIGVDaGFydHMgY2FuIHVzZSB0aGVtDQo+
ICsNCj4gKyAgICBjb21taXRBbm5vdGF0aW9uc1VSTCA9ICdodHRwczovL2dpdC55b2N0b3Byb2pl
Y3Qub3JnL3lvY3RvLWJ1aWxkc3RhdHMvcGxhaW4vYW5ub3RhdGlvbnMuanNvbicNCj4gKyAgICBj
b21taXRBbm5vdGF0aW9uc0pTT04gPSB7fQ0KPiArICAgIHRyeToNCj4gKyAgICAgICAgcmVzcG9u
c2UgPSB1cmxvcGVuKGNvbW1pdEFubm90YXRpb25zVVJMKQ0KPiArICAgICAgICBjb21taXRBbm5v
dGF0aW9uc0pTT04gPSBqc29uLmxvYWRzKHJlc3BvbnNlLnJlYWQoKSkNCg0KV291bGQgaXQgYmUg
cG9zc2libGUgdG8gbG9hZCB0aGUgYW5ub3RhdGlvbnMgaW4gdGhlIEhUTUwgd2l0aCBKYXZhU2Ny
aXB0IHdoZW4gdGhlIHBhZ2UgaXMgbG9hZGVkLCBzbyB0aGF0IHRoZSBhbm5vdGF0aW9ucyBhcmUg
bm90IOKAnGJha2VkIGludG/igJ0gdGhlIEhUTUw/IElmIEkgd2FzIHN0YXJpbmcgYXQgYnVpbGQg
cGVyZm9ybWFuY2UgbG9ncyBJ4oCZZCB3YW50IG5ldyBhbm5vdGF0aW9ucyB0byBiZSB2aXNpYmxl
IGluIGFsbCBleGlzdGluZyByZXBvcnRzIGFuZCBub3QgaGF2ZSB0byB3YWl0IGZvciBhbm90aGVy
IGJ1aWxkIHBlcmYgcnVuIHRvIGNvbXBsZXRlIHRvIHNlZSB0aGVtIG9uIGEgY2hhcnQuDQoNClRo
YW5rcywNClJvc3M=


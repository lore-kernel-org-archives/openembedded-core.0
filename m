Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1124C3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 10:28:31 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.70])
 by mx.groups.io with SMTP id smtpd.web11.17660.1747736901409529533
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 03:28:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=DIYs2hEl;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=DIYs2hEl;
 spf=pass (domain: arm.com, ip: 40.107.20.70, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mjIK6RkFiiOshrmCwQ90QkR0o5PxuMNVi8RlpvxGHmWyFqzzNDIp5iJpzTIJsfFisUcQh0YmJaGy1oUqkdIGN73ZIiglrv80k9FAbK0EnORjUXHDP5N9fDGwQ5+XQoeoj57zAvNSLcq5eVJeUuYLLdHJHBTbbUR5uoKCHmWjCX3YN2GKlyDgAYiAAt7Z4xQ0Tr1AM+ABRbD3Ix6EPqWSHAEy5y2gGSo75G6Xz4Q6BEZp4Due4I+RjW2OdF4IiEOV0s73bITxfAeS0JMtW+L4yGAm109FUp+uDCTemsnkiTPL52+eizMLENygsg5lscp4sFj+nEsJaeCuGb2Md61BkQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=chedror80cfFd4ZkEZi8PKguAnSOfpSyBkCliiF8TAc=;
 b=L+bII/fgO1+Kemc0VB7woUORGZbsq8XE+9iVjSMVUWmtPxc2WuYLAGyfnsTS0K4717Fyj0QvhikQyqEgKJojtWUJCZRlvVw3YA/WmhCVGG7w6zrZ3bR0a7CDshAddyQRwmLA8Lsbe/7I6lD9B3Doj8gU6gpeRb9sV0R9XDdO0EgTEcZT+CIKRDoY5teM14z1E8vyvXzG00SkkW+TA2KzgsVlXUAaX3ppFtgUYLYrBg+ZTrHMV1Y4Ct+4d/iH62odyWRYHhENoOnwSJQiqAO7RseoGtCjwNhpTNCaho6nSfcRdRIs+8agXwMdsixvQ1Hb/MoVQ+mGlUkdyhKfqVFC9A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=fujitsu.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chedror80cfFd4ZkEZi8PKguAnSOfpSyBkCliiF8TAc=;
 b=DIYs2hElJZLlP1WP+Gp3A7uzvZlxYqHj9talF8cETiS4SfCchEtubRDAgpWqhwj5wZkBLiifxGL+CSF9wVpAQ/xaS0eWF72SOjdVxSXHfAqrGwUJd/J9hWJuaG4rybgTD5tVDB1Tzg49N7A518+wZWLszZf7q2vF1XkclsvECEY=
Received: from DUZPR01CA0078.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::20) by GVXPR08MB10686.eurprd08.prod.outlook.com
 (2603:10a6:150:150::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 20 May
 2025 10:28:18 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:46a:cafe::f6) by DUZPR01CA0078.outlook.office365.com
 (2603:10a6:10:46a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Tue,
 20 May 2025 10:29:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Tue, 20 May 2025 10:28:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lm7CfZJk/MrDot6Sa0be3Lq+sA29IaB6IyI6HSJZSZm86xmjeAG6Rv/mfQkI7L1o74mewEyXFvC66eNkpiwbXybLSsTgpRG+qOzBX7unheSd+Q12Uz10ku6jK9CPKXSSqvjnDQ6NMb+2Pw68S6PRjQuga3Yt/rkQTU7YcSejfz7vc20gzzF8QVnUCbZZDDZkd9PKWyI5UYyBWkoYpQJRboczv9xiCUZctp3UtkntGM7Yt5JdESRjNZc1TJQbSGweHshq6cOd5XKrKWEaMTo5TPE4dT/VlG/zmnVhvBpTdZ8p6BhahSesuBU3T6C5EM8Afl9S9udM+n5prVgqmJAW8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=chedror80cfFd4ZkEZi8PKguAnSOfpSyBkCliiF8TAc=;
 b=QPzaoMRYdrZceCl2alPFhMvxwnqda6IXgpPKe/dAK2Qk/LuVcQ7gsnsH/oNaofUwxWxZXn1vCc5ntF2KQcjCkOM1GOxEwi5kUqTnPsnO9ZVJhyktdhnEuibKbRATBh/1SlDgXir26vciiIPt7iHreQwV+B/xYmKIYWflpiiOYjw3/gyEpb/hPIsUv/uc65TBi50Y4KgiN7n7vcgfbxc3KWTINlkloK9c1teqGktbjTul4Z4hqWOaSbHbsgKygzpr+WDRvpItdYKhwNtjuxYIEWCUp5ixYJ7i7aeLYXgJjxIe9YRXGTK5K7+N+l4hMQ8HlbwNAHyf76vqpQJxzGWAJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chedror80cfFd4ZkEZi8PKguAnSOfpSyBkCliiF8TAc=;
 b=DIYs2hElJZLlP1WP+Gp3A7uzvZlxYqHj9talF8cETiS4SfCchEtubRDAgpWqhwj5wZkBLiifxGL+CSF9wVpAQ/xaS0eWF72SOjdVxSXHfAqrGwUJd/J9hWJuaG4rybgTD5tVDB1Tzg49N7A518+wZWLszZf7q2vF1XkclsvECEY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB8721.eurprd08.prod.outlook.com (2603:10a6:10:3d3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 10:27:44 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8722.031; Tue, 20 May 2025
 10:27:44 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Yiding Liu (Fujitsu)" <liuyd.fnst@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] libunwind: fix multilib conflict
Thread-Topic: [OE-core] [PATCH v2] libunwind: fix multilib conflict
Thread-Index: AQHbxkQrKc+nnFQnWkSURVNCjGsT3LPU/mWAgAY4XwCAACBNAA==
Date: Tue, 20 May 2025 10:27:44 +0000
Message-ID: <1F3FA363-6F00-46D4-BF30-7F7E89FC972C@arm.com>
References: <20250516092238.1182-1-liuyd.fnst@fujitsu.com>
 <5625AB89-3201-47B0-B698-9039CE2BC553@arm.com>
 <OSRPR01MB11597C8AD2CB0276171EC06759B9FA@OSRPR01MB11597.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OSRPR01MB11597C8AD2CB0276171EC06759B9FA@OSRPR01MB11597.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB8721:EE_|DB1PEPF000509FD:EE_|GVXPR08MB10686:EE_
X-MS-Office365-Filtering-Correlation-Id: 11407587-b536-410e-8460-08dd978908e6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Qmg2TWpncVV0bzUzcjFuMWR0YlNQaXpjRll5TkxHeTJHSklFazEzZm9WNFlV?=
 =?utf-8?B?L1Z6MlRxSUVJdTd3VjZmOVdsRFNMMzFlNTRJVFJUU1ovc1JuUklCb21yRHpT?=
 =?utf-8?B?L3hYa0ExSDdTZTZtWFFkaEFjTTZoK1dMN3crVzZqQ0FkUXdydkp1cGZZTlI1?=
 =?utf-8?B?b2owZko0dW52ajNIeHRTT0NnMTdYdWNkdklQVStIYnRmMDJ2Wm9hcDZwMks3?=
 =?utf-8?B?V2wrTm8rRWg5L3lFRUs4NDBxMVBTcWNwLzl6aTNUbEpJeHNQWlNpZlRPdllS?=
 =?utf-8?B?dlZPQXRQU3RkTE80cGYzV09lQjFPaDd4Y0ZyNDhHc3c2U0orS2VDZm9PLzl4?=
 =?utf-8?B?c2lkRFp4aU82cGU5OG5Zay9hbzdhbDJhdzVIQWxrSXUwQmlSdGF5eGhqanBD?=
 =?utf-8?B?alZYZC9rb3pqZ1YxakNZUENBYitjNS92ZS8yNEx0TDNUZzVQVGhVenRlYnph?=
 =?utf-8?B?R3JUZ05yR1FiVEFVWDlaQ3pCQXE4eG0vTERneEo4UG9kSzBjQW54QXpsbUhu?=
 =?utf-8?B?UGd3ZVNSTUFVbDVIbXdPNjNOTWI1Y25EUkgzYk9ZOEI5dlk1RHh0MHVNQkxm?=
 =?utf-8?B?dXJqdmYrdTMxTDBPa0FNbWw4QnhVRi9HamtKUDZ2L1pxZk1hczFXa3JKdHZu?=
 =?utf-8?B?TVpCWThYdC8wWVhmeXNSZnBFMGlSQUxPRndUMFR6aGpHV0tuRzFnSHJ4Q3Mz?=
 =?utf-8?B?aUpscUd4NHJhUCswNzc4QVNlOGpKYmkwRmlkcFpOb3FrL2NuVWlpNG5ZR1Zu?=
 =?utf-8?B?WDUyenAzWjdRN0wrZGRoc1lSWU1SbTMxTEo3QzF3MkcyVUlic2ZsUy9vdkhZ?=
 =?utf-8?B?anZaMzlVeVdEakQrRC9ZLzJmVnpaaXlpSDZZcVk0L1QxaEhRSTFIZG1KWks4?=
 =?utf-8?B?VWY4VUxzMDVvaWxhOVdnd0hsRU5kVVBYZGFpWmdwS3Q0YWtaVDhuZVFRZEM0?=
 =?utf-8?B?UzZsdXl0KzhDTDVFd0h3SDRZeUpoTmlIU2hSRnNTSjRncndBYXdseFdwaG96?=
 =?utf-8?B?YStYaFovVmxYeEhtTjJXSHpJcGdnMWlCRHM5eFlaUjN1U1JrZWhPLysrcVVO?=
 =?utf-8?B?NDRRY0hoaVhEbWVQeWduQkxCUDNvQnlYY2lmTE5RTHBjWm1CVU03Vk5vbEFw?=
 =?utf-8?B?RHJhem10c3U2c1Noc0k4Q3V5UUhpOFAvMEljSkxUUTlLWHNDUXZTZkpGdG90?=
 =?utf-8?B?dXJUQmJZL1lsVmJsTzB5RzRHY1JiVmwxUnNjdkNQWVgrZ2R3RXErelZRWkFP?=
 =?utf-8?B?SzY2aDBFMTg4MGg1VFBQMlgwYXp1bVh1UWRiNUFRdkxkTHpxQUhYMWl0Mjcw?=
 =?utf-8?B?SnprT3VQL2c3VDJvL2lpNEdwRHdDeWo2NGF0eEFycDlXRHlCSTVCbEdhTUlK?=
 =?utf-8?B?VWpad2FNY1NBeThQZms5dHJBcW04R1NZZGZEMWJWdzNPYXNMa0IxSHpMMktp?=
 =?utf-8?B?bi9mc0YvYmlZUFVOUGdxQ0U5SDh1Q3g3U1NVWnIrUFllRU1QcDNGam90OU1F?=
 =?utf-8?B?V0RKM3RZcEViNE1MZXBWOFVvTkFiTXRyVEZxSVJQQmZGOFdkbk5ZdTZiYU12?=
 =?utf-8?B?blZ1Rkhhc3pxTlhLMGw3N0pjT3d5UGJpN1FGd241WjRFWjJrUStHckwybFg3?=
 =?utf-8?B?ci9oRnhrMVAydVpueFlvdWYxaTdwUys4SVUwNU44bW1sTU55WWRSOUV2Y0ov?=
 =?utf-8?B?NklUZ2RyUzc3TSs5SzVOcnA2dVgvR211eW9ZWmZyN2JJeW5VcEt3US9xbGwy?=
 =?utf-8?B?clBZeTJGS3cvMmRhbjNrSEVJSzAwMDhuN2ZyNzMwa2xIdFFXRUMxS2FmdSsy?=
 =?utf-8?B?STdNeXpFbmVnUXAySmY4UWVvb0xaWUdVR0dHdWpGVzEzNi9IZjZMTDdORmsv?=
 =?utf-8?B?eE9HUFdTNUgya1F4T1J2dmVKc0JhQ1ZrWDdaYkdGcXFqQU5oZVM3NWtMR3hY?=
 =?utf-8?B?WEVDcVY2U1V1MCs2QzZTSFZWRUl3QmxNRTdRNll4ODdDZXRqYkZZWHh3WTFZ?=
 =?utf-8?B?LzdMVEdiTVJBPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED21ADD84E890743A755231F29B0614E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8721
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	71447550-b645-4ed0-046d-08dd9788f56e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|14060799003|376014|82310400026|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MjlaYWJ2V25DczdYU05xcTVjQ3E2cXdlbkd3aVFRbnZQTDZpVTgyZlpsYmVh?=
 =?utf-8?B?Y24zeFZNMG9UNC9RbkhsV0JMbkNMaUF0d3BRTGRZT3RBNEQ1U3VZWEtHZndM?=
 =?utf-8?B?UlV2aHRBZkZVc2sxQTFhRm1acDZOTUt0N1NZVGxDc0FJUVB2U0ZjTEFMVU9o?=
 =?utf-8?B?eWtkdzI1TWNvWGUvQWlpaDlRS0lHMm43eXlRNjk2VXVxNXJuZ3FGUlM3bCt3?=
 =?utf-8?B?OTBLaW5DQURPT2JENUo4OEhkNHZmME4zTDE2Z0F1ZFdWRmU3Q1FEaFloR1lq?=
 =?utf-8?B?QUNWblR1RjhLV1RXdFVtNXlKUDdKOHBzOFluU2sxcTBtTE9yVmtsVkZKKy9Z?=
 =?utf-8?B?dVF3SjNyb1VCL21PRUdWYWlpRElGVVJaOUg3aGlUZTJmSzlqMEVaRG9GNHBw?=
 =?utf-8?B?NVJuTHpaYTlJaVNnazNmR0QyQ0hsOEhCK0lxcDR5aFN3VTBoYVBlaWdxK2k1?=
 =?utf-8?B?V1BvV2ZVOEhHNjUrS25NOWNrUkcxN245TFM2dDJXMUFoZENQdU1pdE9KT0Ft?=
 =?utf-8?B?K1pxOE40OHI5M2d5R3hzZU9PMzNUY2t6NVNMWmc1eHpPdDZRa0FVaTQyMHJN?=
 =?utf-8?B?QVd1WHJkeEJnMFJ3dDFHazRHdEFZYWlSUDdSbXg0Z0R1T1ZzQ2kvckRKbkti?=
 =?utf-8?B?dWwvN3ltTlRWbVFKeFNXeHE4bTV0aDZtdVNiL2NUWSsyVit6TExrbnNyb2pj?=
 =?utf-8?B?UVlFalNGcXAreWxMRWZjTTNPa2JYN2hHVmt3WHBObU5oVEtJNS9FZEQwQzhI?=
 =?utf-8?B?ZjNra2FaNTJrU3pPSWVKcTdwU0dNYlVBSGFuQnE5T3ZLaU1Qb3RXenBuZ1F4?=
 =?utf-8?B?a2FCK3BSWFhmUFU2T2crUlV5OWlFRXJuSUpYZHZNVHN1RFRwellSWjN3Sncv?=
 =?utf-8?B?L0xHdmkyZDlnS3JxK0l3TUtqTTl3SUd4TTg1R1BTZTVZWEVnT2htYndVUkVY?=
 =?utf-8?B?N1dlcFhZZWkvanpENjFabUk1c3czZDVoTkR6eGFGK0JHRlV2Y2tSQTM5bzcv?=
 =?utf-8?B?TTRKbGdzckQ3MzN4V0IxMTY5SFl3dUM1SXJocTVCc3pFYSs5Ymg5Y3hwRTlO?=
 =?utf-8?B?NEdwUy9lQzljSGxqQm9XMUJIZmNuOUNMeXBnZG50YWEzeEx2RUZQclhhbGxU?=
 =?utf-8?B?ZkZuZDY2RUtSVHpIaEhobGZ1RzY2Y0FvSERsWWVZbERwOXh0OUtnY3VKV2t3?=
 =?utf-8?B?YS9pME5wamthNjFuaHFhVDZtSzdXbGEwVEY2TXl2aWJtMG04TEdRM2JmRGQv?=
 =?utf-8?B?MVFkaURqWjFPWWdtQWkrOG1yc1hLVk0rU1NtZTd1Q2FnTVkrcnZIOUUwREdU?=
 =?utf-8?B?aHhVeHM2Z1BVM1l5ODBTWTJiLys4VlovenR3dzNIN3FJbU1tekpGRkdUMUhH?=
 =?utf-8?B?WGFJQVVuYnhuNFlNMThqYUcrdGlaTWVMcEJYTGFrTUVYcU5LUjFEQmJBdk1u?=
 =?utf-8?B?WlpUdEFFaXY5cWFzeTZXYnFKejQycmFvVkRQMGlLM0tHTmxidk9meTdrcUxT?=
 =?utf-8?B?UHV3ZWpDQkFaQzFKWFd4MithSTcyckVqcmxGTm1DQUEvNnVZUWJoV0M5V1do?=
 =?utf-8?B?V1YrWVBEY3VDTVNMR3FOL0hzTy90SW1VZWdKQms4UjJDZEFnOGgyV2lJWHV2?=
 =?utf-8?B?MFJYeWUvbDFuYThPZThvMkFFZWh2L1FxVjZqZmN4T0dKSlMvRzNyOWtnbUQv?=
 =?utf-8?B?aFgxOFc2ODFVWWpIbE8vcGF5TlA1dHliZkpHOUs1dDR4TVdLSUJwdXFWaU05?=
 =?utf-8?B?MGZydXMzSHV6bHgwUzhhQ0EwOWlDa2hJVStjQko4eVFNTWhGa2o4d0xjcjRY?=
 =?utf-8?B?bDZGZGs3WXdMQjJqeUMyd0ViOVZ4bEppa0lFb3pBK054Q0Zub0xVN1BXeWlB?=
 =?utf-8?B?QS9wY2lrWlpkc015ZHhVWGlIRjFySG93bEVaL05CQng4V244ZlZRSHd1MFIy?=
 =?utf-8?B?c01MaTFZYzBvaTdxOUplNWNzZkx5MWhVdkJGSlEyeGNZalVWcWcyM1JzTkhW?=
 =?utf-8?B?US9YeVhGdkw4N1VxQVhKQlJsVWlvQ0VNTzBoU2NXaHMzbkZrZS92dDJuTy9s?=
 =?utf-8?Q?MiLzq+?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(376014)(82310400026)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 10:28:17.1494
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11407587-b536-410e-8460-08dd978908e6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10686
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 10:28:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216900

DQoNCj4gT24gMjAgTWF5IDIwMjUsIGF0IDA5OjMxLCBZaWRpbmcgTGl1IChGdWppdHN1KSA8bGl1
eWQuZm5zdEBmdWppdHN1LmNvbT4gd3JvdGU6DQo+IEN1cnJlbnRseSwgbGlidW53aW5kIGRvZXMg
bm90IHN1cHBvcnQgcHRlc3QgeWV0LCBzbyBJIG5lZWQgdG8gYWRkIHB0ZXN0IGZvciBsaWJ1bndp
bmQsIHJpZ2h0Pw0KPiBUaGlzIGlzIG5vdCBlYXN5IGZvciBtZS4NCg0KVGhlbiB0aGUgcmlnaHQg
Zml4IHdvdWxkIGJlIHRvIGRpc2FibGUgaW5zdGFsbGF0aW9uIG9mIHRoZSB0ZXN0IHN1aXRlLCBv
ciB0byB3cmFwIHRoZSBpbnN0YWxsYXRpb24gb2YgdGhvc2UgZmlsZXMgc28gdGhleeKAmXJlIG5v
dCBpbnN0YWxsZWQgaWYgdGhlIHRlc3RzIGFyZSBkaXNhYmxlZC4NCg0KUm9zcw==


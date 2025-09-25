Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F9FCAC5A7
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 10:03:48 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.46])
 by mx.groups.io with SMTP id smtpd.web10.7528.1758794623994599914
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 03:03:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=a2zpd7Jd;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=a2zpd7Jd;
 spf=pass (domain: arm.com, ip: 52.101.84.46, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=XNbmbfN5AtR9YTAKhfVFXvKC6WEBjBhMEDK5CwlH0bZuz9F5pVsCD/pYok3MnpMu6sQAWL+yIzH3djhQ9tx/pie4HLDKRoDtveFKfcgUVe0VOg7VRYnzSdRjQR54yy+TvJhFmoFq215hjc2tEk+HnxV6QOBos/JX5YmZZ0o/tWdtG8VZGlxIqL2SgDxCU4UAOIzmdehrcDOmeWd6EdSfyuPmRa0lReCwuHtQUBmwSbqyo0hqQxiHbBUtzBYosxAjyg2yC6f2MgrAzTT3rdH0yovvmeoTFJfX/uE4IVbKyjEqhcAR9sILDHaz/RQOlgdUV1pproSblAaJQhQxe/d1lQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRFcCp6FVVPkKAEkGzb/7iGq8evkgZB10X4jPsHRjLs=;
 b=QgtYiR3PzQPEjbSBtmQX1t5X4BWp9dQWVS5apbtoZCEmk/Nf6dO3pSJo1N6LjT+GAzNcFCXsWS5OBTHEAliHDhJZi3szA08itEsjix/x0QlPpe5+LxMXe1I0HYQIrN1le/Lf5E6vxzZiXFowZNh0wIMg4Lru5GOemWDOdKQYacFgjSh8uyNE/hmAyqpqy/smZdSgaxGGHdQx6ZHrNaClG0CaQamTXfPxhU1aqop2YfUSZizSmHb6M02+zLQ8ke3Ereu7mc+aSIppSlVwbCak9qQkjkDueSR4alXKSiBvtTs36EnriRfiyYUY+MId/g5cSskQPbgXkmrgH0ATJP8FJg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=eng.windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRFcCp6FVVPkKAEkGzb/7iGq8evkgZB10X4jPsHRjLs=;
 b=a2zpd7JdxjH9AsVw45nZiKA3WlTyzODSnloYnJC2X/awrUrhJyK/XoqtBDOR2RggK1UHL/uonSXp4iRFhv8oZjDF5jW7/l89AFFrve0YLG6PBUlZz/9xK6ekfN1ASZQlSkvneUgMVToD3zTEv4iT4inx6qh6ZjHnb50OjPIyN1E=
Received: from AS4P192CA0013.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::18)
 by DBBPR08MB6107.eurprd08.prod.outlook.com (2603:10a6:10:200::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 10:03:36 +0000
Received: from AMS0EPF000001A1.eurprd05.prod.outlook.com
 (2603:10a6:20b:5da:cafe::de) by AS4P192CA0013.outlook.office365.com
 (2603:10a6:20b:5da::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.10 via Frontend Transport; Thu,
 25 Sep 2025 10:03:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A1.mail.protection.outlook.com (10.167.16.231) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.9
 via Frontend Transport; Thu, 25 Sep 2025 10:03:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Riqfn50w+yYb2/np+Muol33Ac8DzQktQxqa+yxDUxy/Sr7qRe5z2dNXEvdclVTJtEKw0qIKdvwiHO3n4ve8TH9KV8HZEeaSwyzw93AchslFbsZOFi4Wfe75i/H0v4YclkibSv1h7Jzun4Vf1Re+f0G5khCilEALH11lPIg+guat9+Sxi+NO/ND2Ya+NEBxFV2GMklt/bwoimLFJVwtIPXQU/tkLneutWgCwpAfI5pQyjhmVrXpY75IeMlwBTBYkfEnXx7cTZesiMdoxObi8fJ10DVb4cJrDsuPCW7L2uzCLnGz65i/nPjP2iOZIYKgVlP1G49F/KzoKC/BLBL9yHlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRFcCp6FVVPkKAEkGzb/7iGq8evkgZB10X4jPsHRjLs=;
 b=raxwZVlzuuJKdUf+L82vhkFFL3R7y3toF4KlngkWs81iOQlAZEHLiuiS33UR3vHCZXjF0bUnappaEVqCkIQkTympMl0fo8cw8JQarOcJMJmxFbnZveDEO0w6jwQYpx2g1EahdKJduHjHo8BfonEQEXOMKKwg1/mqt75pvjvaym9hBheCzZHl9a8kKvFfLahx9Y9/fo8oBR8IY8s4Ne90HvBwR8JSrQH0sFEhaVEg8/EzqU8XYvjwynAAO1OeHC+HJ6j9QF/ESyvV7MxzOSpQ2XXkdsChps/ix8+QZPXbCsmgZoJKtNac5Ow33rdgGW8yLmtzp52SIsjUjRbqcLc0yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRFcCp6FVVPkKAEkGzb/7iGq8evkgZB10X4jPsHRjLs=;
 b=a2zpd7JdxjH9AsVw45nZiKA3WlTyzODSnloYnJC2X/awrUrhJyK/XoqtBDOR2RggK1UHL/uonSXp4iRFhv8oZjDF5jW7/l89AFFrve0YLG6PBUlZz/9xK6ekfN1ASZQlSkvneUgMVToD3zTEv4iT4inx6qh6ZjHnb50OjPIyN1E=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB5926.eurprd08.prod.outlook.com (2603:10a6:20b:29d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 10:03:01 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 10:03:01 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "yi.zhao@eng.windriver.com" <yi.zhao@eng.windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] tcl8: upgrade 8.6.16 -> 8.6.17
Thread-Topic: [OE-core] [PATCH v2] tcl8: upgrade 8.6.16 -> 8.6.17
Thread-Index: AQHcLFm/HpIlAutjCE21tEO99WGwYrSjrmeA
Date: Thu, 25 Sep 2025 10:03:01 +0000
Message-ID: <1715258D-D027-41C4-BC0E-C2F87324660C@arm.com>
References: <20250923071138.3313786-1-yi.zhao@windriver.com>
In-Reply-To: <20250923071138.3313786-1-yi.zhao@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB5926:EE_|AMS0EPF000001A1:EE_|DBBPR08MB6107:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b92d10d-6235-4865-7252-08ddfc1ac9c1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Z2FyMWp1cExvRVdVbm9WaFB2cE9ZMklTWTNPYjM1UWpDZFFha2J3TGY5VDZl?=
 =?utf-8?B?ZTQxVFREZ2QzRnBhREZhZUVrbytsYWs0QUxtYWQwWEFBWHNlVHZwTFhxdW80?=
 =?utf-8?B?MGZ2UktVSFluNnlYVXJPdkd6YURzaTV6Yktmd3JtMUE3N0V0UEpwMnVsaC91?=
 =?utf-8?B?bHVpVzEwb2RlYTlZZkFXWUVPUldXZ2JLTk42MVdpR0M4cnhUcUVnZCtNNWxv?=
 =?utf-8?B?S1ZIWDdkYVh6TEhyeUJLc244eXlrUG5zWm40RmIwYWFER1NBeUtkTTNoVUVz?=
 =?utf-8?B?Mm5ldWdnbGtpZWF1Z0g4NVJLaTJtSm4vNzIxZDBzZGQ1R1dhdGFCdWRBcXE4?=
 =?utf-8?B?c0NsRmpoaE1NM2hvc3pOcGowNFJnejhYZmUvMW9sOXNlc2FFeERQR0ZUUUxG?=
 =?utf-8?B?ZGE5bUFOQVdaNktTZkVIUXdleUxpYkg1eFBxVWVNemtmSlorb3J1S3Vac0tF?=
 =?utf-8?B?S2JJczNCNDBiWFJ3RlMzb2Z2cXNsZzBFc1RPckZNWnhDNXZlSU4xSTg4Rndz?=
 =?utf-8?B?Y0pTWEpBZ0NVRmtwd2hPZHFjdFNCYTVZMHJnZ0loaXI2cGJ6WDhpcVlyMEdB?=
 =?utf-8?B?UFpvODBzRGV1czNRaDdrQ3BmS2U2VnB1ZS91TEpKMGZpUmxGZ3hyS3AwYkYy?=
 =?utf-8?B?T0xLb29UUUZSN1kwOEdwUFRHeExVR2dkZjk1ZEpyR0NCcU9jOGhmQ2ZUOVE3?=
 =?utf-8?B?RVl1ZzVIeEFFbUk1UW5wK0w1YlN5dVJSSU1wZ2JaMFRKVTVPODNlQys4enNr?=
 =?utf-8?B?NXRBY3NwdFBmaFN0TTdXdy83bDhoK3ZJQXovS3M3WVEzbUtMTE1YZzFDOTV6?=
 =?utf-8?B?cURYT2tuT2NDKzlRVnJKUkhySTFwd1B1dFZVQzRDNDF4U2g2VzBMOGdsdVZa?=
 =?utf-8?B?TkU1R3lGVTVvT0F4YTM1UGdNeWtwQisvdlpVSk02WTNmcEtINGNPR29FZTFO?=
 =?utf-8?B?ZGFuM1kwWGpTOWpucGljaERsOVRWeHBDUGZXcC83QThsS2lSTVlxVE5PN3pF?=
 =?utf-8?B?dlA4M0ZqTUs5dUF2K29mODlEdjgvenJ6TEwxQmJvNTIrK2xrRHFJTFZZRnVj?=
 =?utf-8?B?bU9qcEhRYkpCZWxndlZnWVdIWFdQTmNTWW5icGRYU3lsb2R6NVF6c25EODdM?=
 =?utf-8?B?cmtUd2h5SmdUYXB5bE5nZjhSQXIrWlNFc3VhQTcvcjl6aVNJajBsUmFQazBL?=
 =?utf-8?B?SysvODNDdGlFMUhqaTF6SnU4emltdGVjRm15R0pPQysvakRCUVVWUjFZbGN0?=
 =?utf-8?B?QVJLQy9SOXJQS0dUamFkdmVKd1QxdVVueDQyb2w3RkFpTkxiNDdPV3grSzJ1?=
 =?utf-8?B?L2NDUzBCbGxYSncwMS9oTjJ0a0ExQ2s3MkhsQjBxekJrT2p5UlRSYjM1UzBT?=
 =?utf-8?B?OWRNVndVM1lJUng3STVIbEkzQ00wOVg2ZDZCTzJSSHlyemRidldYWXA5WWhF?=
 =?utf-8?B?ZEI3TldQWUJpQktFR3E2Y1pjY254NGtyVWN1dDZndEVNbXV1Z3VNbjlheEFz?=
 =?utf-8?B?S0crOTBsKzBaQ0xFOWl5Zk9JU09XWVpaeUZjUXVpcG1OOGNndHVnaXVaMU02?=
 =?utf-8?B?UFVvN3I5YW5SK0I1ditrbFdLVjJkOFRtSHBRY1llQUM2Z3N5WVBGdlhmU3JO?=
 =?utf-8?B?cDBKZjh4M0Y0V0lKMUh0OGpqOTUvaXpYY0NBY0VFdUxqT3NCR2Z5TDE4V2Vt?=
 =?utf-8?B?MXFhRk4yYlI3bUR4dUIrMFFHN1VSNlo5azVSTXdOcTZXaE8zeFVRRjBtUEg3?=
 =?utf-8?B?TGRqTzFmaVNYYjd1VzJDdElFd1RrYXpJaEcyMXBWUG5iZWt3LzJyaUFKTm04?=
 =?utf-8?B?ejNKUjhpVmxkLzRLQ3BKVlFXMnNUZjBsejdlSnFxOGpTWUVRSS9lWlppZWRl?=
 =?utf-8?B?ZzNpbHMzN2lRZGhIc1RIb3hFanplbktJRG5hcWo4NE1GTE95alNBR1hVWm9a?=
 =?utf-8?B?a0NjeXIyci9LbFZFdjNRWTJwNGswN1NVbUR6UnE1OGdpNjBVUnRtRkdKY2dV?=
 =?utf-8?Q?eQkQtuLfoas/S7Vy885aodAX2bHVJA=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7DBE9EBE4619B74B9C37C9DE93F1259A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5926
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001A1.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6c994390-c2f8-4344-8aa8-08ddfc1ab675
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|14060799003|1800799024|35042699022|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?clZDblh1dEkzakZGY1R0SVVSWUpLSVJ3YVc1VUQ1d3hoTytuY0dwa0RjWjlZ?=
 =?utf-8?B?T1paMG1vS0pJNDdoT25iN3JYRDRZN3pSeWl4blU3MDVQZitXbDhlUzBWdTlO?=
 =?utf-8?B?SDdiL1NUTnlkVm1qRW0zUkd2YWxLbGxDZWpaTitOZ2dsdUJDRHVuWDRucXNL?=
 =?utf-8?B?azBwZGNOUStSZTJCaUYxdDBDVStZSXE1WFc1MzhucU44bzJjK2xJSkluTUt4?=
 =?utf-8?B?Lys1clR3NTEzVWRCRU5ibk5PcGg0Q3VJY0s0M0ZFS0IzTUpmM21WcDV0a3pp?=
 =?utf-8?B?cStkb2lIbDZLZmZPRmI4cDdDbmlCbmJuVnFCYmFnSmRraGxaaDZreGNTYnFw?=
 =?utf-8?B?dmpLSksvcDZWcThCdk1POFhtVmdLandLRjlyUk1tcjBRZ29MZ210dlFFKzJS?=
 =?utf-8?B?Y1ZxYlhhdE5rN0pIbU5XbW5Ob280dmVrcEd4Y2IvWStjejlCbHcvbUVYQjk2?=
 =?utf-8?B?ZVpUOTVCcFphZ3IvMm9JMUVJSUI3SCtCZE94Y0krQXdmY0dPaDRXUEZ5Q2Y0?=
 =?utf-8?B?VjF1aDA3VHNoUFRYcnovNGZadGdDNjZRWGdRYVdDdFExZjBYeXYvYmlmMnJY?=
 =?utf-8?B?NWEvRmI1S3VtYVJsOFVabnY4Wmx1SXAzMTU1VFg0K1EwRlhrY3kxMEw5WUZF?=
 =?utf-8?B?TjNZVTRlWEdJK0pxbEdnVlBxa0Q4OFdkaVYwZDZqcUIzZWFyaTR0ejBVdVIw?=
 =?utf-8?B?M0Y5dE1ma3AwUVduMHRkbncrNkwxeXYvOENSemdyNWZQVllBWUFsS2VZSzAx?=
 =?utf-8?B?RnlIUnhDcFVWVVJGZnpNNHVPeVlnWllZWlUvVEluSjB2eTh0R0N2S0hLRVJ5?=
 =?utf-8?B?djZaenVmTkhXMlFXckVxa001QWMzZGxETHdPR3liUWNkZGRESkNuR01xWi9K?=
 =?utf-8?B?M25aMm5Nc2xDZ1pJZWZ1ZDRzdW1OUC9RRFozdERTc0tDYVkxemVZQWZtU05I?=
 =?utf-8?B?bUxzZS9CZEo0U3JxQnRCRU1qelBXSWFLU1BPVFV6aVY1RkRVQTNOemRYSVNE?=
 =?utf-8?B?c0s1YTdrczNjSEhzb0YyY0FlNCtUZ09KbzNaOU5oWjRoaHdJWkc0WVhWUXBS?=
 =?utf-8?B?cHVRQjJDR2RXc1dic3VURWIzMkZLdll5Q2dlY21sWVhubzluK0Vxdm44RHVL?=
 =?utf-8?B?R3pRUTF1S3NBdzA3L3RKTTBhVWs5ZXRqejN0eEhsdFVtN3JGVEJpd3A2SGQw?=
 =?utf-8?B?UHFleTArb05JeU9IZnFxUmV5c0g2NHllR0RZKzNnb0JERDRRTWdTNUJ2OVlZ?=
 =?utf-8?B?L3R5dmYyVFN5QkgvTVU4WjZhQUVOdHVFT0Z3aGlBK1Z4dGV3SkRLKzJlRFJ1?=
 =?utf-8?B?cisrYmh1Q1VvVllZbzFuZkhDR204R1RiSFFtVXYyZkM2ckNWL2F6cThyV1Qy?=
 =?utf-8?B?YnlKcnF5cksyNzhMWVZsQmxtQkUwRURKYnIrNXZyOXR0Y0dYSHRVOFNFMDlr?=
 =?utf-8?B?ZlJzQ3NkeWxBUDY0d2Y2a1I4MllmbFFoVFk2NDg5SUhzVlJWaDdIaEtYZjZr?=
 =?utf-8?B?ODk0N3FsWTFYWXdFWDIrREo5cUMrTE01cEI0YllabTl1RGdsdExwZmlXMzdN?=
 =?utf-8?B?Y2VRUXdzK3ZIU09hYmROY1hTMjk2bDVxVjdkTlhMQzAzSllRR3Vna2lkbjd5?=
 =?utf-8?B?UTlxVjA2alVYLzA1d243aVU1a2pva3BtdnZuUEcwa2FEdnQ4VFE5STVRKzIv?=
 =?utf-8?B?RXY0WnhLYTRHcmV1R2NnWU8xcVFzL0ZPTG9PUGZmSStwSDg4S054OUxpbWRN?=
 =?utf-8?B?c0xJZVVWOFYzcFFJekg1QW5hYU9yYlFycmpMcVEwUVExaElYNUx4NWJjQUlX?=
 =?utf-8?B?UGswTzJ3SlJHWnlwWGlRcnptdERNVnN2TUYxR0FGRXRFQ2o4R0EzQlFJSzYy?=
 =?utf-8?B?a1hSUlRUdER2dTlzaEpneWllSUE0K1ZXdkRDdlg4M09QSUx5VERtRDgvS21k?=
 =?utf-8?B?TjJsTWlaUzBrRGZZbzBoR28vVkd2QklmaWRkWHppc2YyTlFrZWI1RVN0cXB6?=
 =?utf-8?B?Q0w2Z1NnLzBGL2VwUFlHV2FQc2tzNGR2K2ZadGswY1dPd0ZnM2R2Rmk0NmY5?=
 =?utf-8?Q?PU2ZgY?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(14060799003)(1800799024)(35042699022)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 10:03:34.0276
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b92d10d-6235-4865-7252-08ddfc1ac9c1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 10:03:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224011

SGksDQoNCj4gT24gMjMgU2VwIDIwMjUsIGF0IDA4OjExLCBZaSBaaGFvIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDx5aS56aGFvPWVuZy53aW5kcml2ZXIuY29tQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+IHdyb3RlOg0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRr
OC90Y2w4L3J1bi1wdGVzdCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy90Y2x0azgvdGNsOC9ydW4t
cHRlc3QNCj4gaW5kZXggNjg3ZTA2ZmE0Yi4uMTI5MjFkOGNmZCAxMDA2NDQNCj4gLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3RjbHRrOC90Y2w4L3J1bi1wdGVzdA0KPiArKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvdGNsdGs4L3RjbDgvcnVuLXB0ZXN0DQo+IEBAIC00LDYgKzQsOCBAQA0K
PiBleHBvcnQgVFo9IkV1cm9wZS9Mb25kb24iDQo+IGV4cG9ydCBUQ0xfTElCUkFSWT1AbGliZGly
QC90Y2w4L3B0ZXN0L2xpYnJhcnkNCj4gZXhwb3J0IEVSUk9SX09OX0ZBSUxVUkVTPTENCj4gK2V4
cG9ydCBMQ19BTEw9ZW5fVVMuVVRGLTgNCj4gK2V4cG9ydCBMQU5HPWVuX1VTLlVURi04DQoNCkkg
cHJlc3VtZSB0aGlzIGlzIHRoZSBmaXggZm9yIHRoZSBwdGVzdCBmYWlsdXJlPyAgUGxlYXNlIGFk
ZCBhbiBleHBsYW5hdGlvbiB0byB0aGUgY29tbWl0IG1lc3NhZ2UsIGFuZCBhbHNvIHlvdSBzaG91
bGQgYWRkIGZ1cnRoZXIgUkRFUEVORFMgdG8gZW5zdXJlIHRoYXQgdGhlc2UgbG9jYWxlcyBhcmUg
YXZhaWxhYmxlLiAgRm9yIGV4YW1wbGUsIHRoZSB0Y2wgOSByZWNpcGUgaGFzOg0KDQpSREVQRU5E
Uzoke1BOfS1wdGVzdCArPSAibGliZ2NjIGxvY2FsZS1iYXNlLWVuLXVzIHR6ZGF0YeKAnQ0KDQpD
aGVlcnMsDQpSb3NzDQoNCg==


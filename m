Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1248BCF6499
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 12:34:11 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.87])
 by mx.groups.io with SMTP id smtpd.web11.53530.1727699649109201440
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Sep 2024 05:34:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=R9tbKA7e;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=R9tbKA7e;
 spf=pass (domain: arm.com, ip: 40.107.20.87, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=mqCz2b+Wmg9EkFGq/Gh4Fb7vulhR7/6bS0YWBMHD9XTUvYerhBfoPuOMnM5kLdAPx3rZROVQM3y9kzjf4orvV2mEqmoomrrRFhX7SRp90WFFmkfhMccwdQtK9bFAeSBROS7sDQNUvWxXu3sjAByBFDYIRIsNHlpi53oBzTaNIX7WXYgc/N+ZIUKzJVS7qUtvSe4CWRTA8DXQ/nfQkuUjTBNQ5iD4MQPy7R+m7O1fEqHYB7apDy8lsv8SiOXPJaup8a3BCiJDREHJekFCcLrCio0VniKL2wHqmhM+wYNMQWiBB1MUQd5iC2rkIOMivvPOmLMBM8o6NpntGiifi+k9Hg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWJeP6SN9sezLgc5rMgF9x8b/G1uQ35wsUQzmbyEDPY=;
 b=QpmVYANkSKngYeJunoXK2n7Rej3osW8XLuG7ronbnT31Ug+he+FT8JGXVttAdatXoEECjMLrPmUyVjaEgu0Xjlfs5OOIRY9A+fT6Zfte8ijV9Z/+sCs0ZHwIk5l9JQR8kebeMAJpPxMYcL21/qvh+NYI3k/L46UOJSFrx+alJA/Q46pT5VNcM2ByKlEK3bD3RO14Y4J+uAWh1m04Vr5MEsMil5rjfnu8re/qCOYqsFp3iUR8h9W4eNrYvZHHO6F3faEsbq3prBgAwgguWTGzbstaCR2fgUrREdAIprcG5v/GPYje9p+kbk/apMrTdcnXOZuWP/SQek0lIs3dhzwQfw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWJeP6SN9sezLgc5rMgF9x8b/G1uQ35wsUQzmbyEDPY=;
 b=R9tbKA7exOzJn+4R9rbOvtVIVEHkyvyUF9zbzFLuPir5jahKCQ4xNX0anpKFqPF9T5XAOo+6XNAUyFBkSe7v2RC09UAts+it3t0Mwz3DDFoaGiq3uWfPCpHstDMYsc563C/SskbHbI/h/es1FmFt+OHVKwVynBLKOM6DTPXiTCs=
Received: from DUZPR01CA0061.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::19) by AS2PR08MB9739.eurprd08.prod.outlook.com
 (2603:10a6:20b:605::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.13; Mon, 30 Sep
 2024 12:34:04 +0000
Received: from DB3PEPF0000885B.eurprd02.prod.outlook.com
 (2603:10a6:10:3c2:cafe::62) by DUZPR01CA0061.outlook.office365.com
 (2603:10a6:10:3c2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26 via Frontend
 Transport; Mon, 30 Sep 2024 12:34:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF0000885B.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8026.11
 via Frontend Transport; Mon, 30 Sep 2024 12:34:04 +0000
Received: ("Tessian outbound 5b71c1540f48:v470"); Mon, 30 Sep 2024 12:34:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 76176444c7380855
X-TessianGatewayMetadata: sI382YUAJ/fidPnGX8mxrDGT9Jd07ZouwZQFPnJFYjiN4dBgRK+8ELQpSE6Z7tXNARDF+oLEMrcMjU5p0dJZdEbnBTNiaixY+0p/X2YNjam+MmJNfPY44ah6dwhGhpNRG+/1vFg1g8NRsBvJ9a0eL7sQbwL/HUTNIwHdTLMow+E=
X-CR-MTA-TID: 64aa7808
Received: from L082963cdd2c5.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 50FDFC0B-994D-421D-9B0A-05B49A4F6491.1;
	Mon, 30 Sep 2024 12:33:57 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L082963cdd2c5.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 30 Sep 2024 12:33:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IhHauSJ/C7oP2P0HRxGpaEYf4SL83UdrsD4S+4bLtqUkckMNlrc1oRqf2jTG1qTSfg7fcXGXRIx7lFM1nkDnVTC94Ig4OAPqe4OcHiXcMBIn86mNFKAp1HNQn9BWUNfsr2YCeNKm3es/ecFi1opA5jqAroxGUXnIWSqjDn1hajcECPfzpb56lVZZ4eMAXkx4fsFWucylRd3AclEsG5Jt1mkzcuUd+Jkpb9xSZN06R8T7XiGrFakwlgMTCc2xLjiUiHMl4Ml1ID+WEBNRdtn9DnNDsR14XtbwNzZegGKw08Q9hAspq5F6CL9KIqCO4Dez+6gIOgipL5fP0Yl/AlZa3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vWJeP6SN9sezLgc5rMgF9x8b/G1uQ35wsUQzmbyEDPY=;
 b=fOGSFXPBgfa5/5jDn9ZhZTbq1yOKKZO5AbizmzDsNuKKdx3wSPg8db4p4a+Rv+PuHUBSNoB8g1euyv8y3MMhQepTYaun4eKiz5fHjA2CqlUhNyifJsg079Zg/8ZKjqwaE7PvocexHR9UQXJOup0xMYuv+ox8uI52heC9mxThJT3awqg534MuYaUGUocfh4KyZmHb9vctJelg1LiS7kozp5r+WmBCTQ4Q4tzg3wIA6dNewpKzi8ZpD/E7wNDuXvDNWEDA3empP5zZOQpzM4Ny65B9dfv/CMpl/YIKyC/bzYxqTVv7aZl4iiCFdzGoq2nYtzeSl+yQ5XCBc1XY4dKaCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vWJeP6SN9sezLgc5rMgF9x8b/G1uQ35wsUQzmbyEDPY=;
 b=R9tbKA7exOzJn+4R9rbOvtVIVEHkyvyUF9zbzFLuPir5jahKCQ4xNX0anpKFqPF9T5XAOo+6XNAUyFBkSe7v2RC09UAts+it3t0Mwz3DDFoaGiq3uWfPCpHstDMYsc563C/SskbHbI/h/es1FmFt+OHVKwVynBLKOM6DTPXiTCs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS4PR08MB7783.eurprd08.prod.outlook.com (2603:10a6:20b:517::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.13; Mon, 30 Sep
 2024 12:33:56 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8026.013; Mon, 30 Sep 2024
 12:33:54 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Claus Stovgaard <claus.stovgaard@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [master][scarthgap][PATCH v2] lib/oe/package-manager:
 return early in install_complementary with empty globs
Thread-Topic: [OE-core] [master][scarthgap][PATCH v2] lib/oe/package-manager:
 return early in install_complementary with empty globs
Thread-Index: AQHbEFRODvsZXYUGKUynjr6fmy8YErJwSVEA
Date: Mon, 30 Sep 2024 12:33:54 +0000
Message-ID: <409E410E-1DE7-4294-898A-AF1841D6C3A4@arm.com>
References: <20240926204001.2245184-1-claus.stovgaard@gmail.com>
In-Reply-To: <20240926204001.2245184-1-claus.stovgaard@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS4PR08MB7783:EE_|DB3PEPF0000885B:EE_|AS2PR08MB9739:EE_
X-MS-Office365-Filtering-Correlation-Id: bab404db-8bf8-42a0-e141-08dce14c2b52
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?UXdVYU96WUl2NlI0TlE2dVhyRTgyL0hNU0dwQlFQZ3I0T3AxOEk4WHZ3U3VI?=
 =?utf-8?B?N2hDN0dta2pXdFJBOHROOGFsYmxNVDVPaXhzNllYQTVocUp0cW16YUQ0TldC?=
 =?utf-8?B?NmZNcjhwaDVXZ2VzYjVqMjlWdmtDbi84S0JGWm1JTGRlOFJkOHk4NW0wcWtH?=
 =?utf-8?B?NytTRXozNU9zRnRGZjFJb3JHWXRsSkJadjV3VzhDaTMybTJOazJSQ0NlV1NP?=
 =?utf-8?B?enJadGVENWN4THo3RlUzRUhZS2M1b2ViTWtaMjNWZ2tKZ3QvbW9hQjBPUHU5?=
 =?utf-8?B?TkxjbDJUSzN2VVlkU3kvc2xLQm9jZ0ZWdHEreXRxclZGRWpKV21lZjA5ZE5X?=
 =?utf-8?B?VHdtTEhSNnIycEREM2pGRWxvcGxBZXJDdDkzVkRpN0dhMSs3M1Q5TWJvVk1j?=
 =?utf-8?B?eUpQVWFVVmxUT1NmeXFSUWhicEpOVUo1MmZwZ2hLZmk2OEQzbm1Nb0NPd1hL?=
 =?utf-8?B?T1NZaXBBV09nR0NQcHJFODJmdThwSkJuZGpRMWVQMkxXMGhvR0FVbko1TXFD?=
 =?utf-8?B?UFJzRlBKMU5lLy9QOUx6SWY5NWF5NllQOVpIekZvZkI0R080VndNSGU0aTZo?=
 =?utf-8?B?aitYZnQ5Q2FOZVJVQ0IzbHhKa1IvMkl4eWdGd1QxclMwMXFDa3ZBdnZTZ3lo?=
 =?utf-8?B?eDVZTTJwdUJKa1BEYmZGT0pUVzBOMStjK25JOC9FaG43Q245Sk92UG13Vm56?=
 =?utf-8?B?ekk3c1FpQ3F6UFVBMW9uS3pITStBcW44MEJqcnhsZjI5UEVubjNMZVVhTkM0?=
 =?utf-8?B?ckFtQTRFNlQxYVNRc0ZZRFdtWUh6Qmx6VndMRjFlMC90U0ZYcS9aSVBxTERv?=
 =?utf-8?B?TWFGdVYxS2Q5Wk9wTWVNQWNKQ1N0c3dJY3lJTFFBbkQ3Mk5Ta2hROEQrdUVS?=
 =?utf-8?B?RjFuNTUxazM5UEhYSitoZWFJdDRESFFmNTRzUjIzbUhjdUd0S2RsekhRRE9u?=
 =?utf-8?B?dlcvQmxFemxHM3Jub2ZtYk5FTE9iVUlDNExwZjRtb29XOFo5cW9WbllIRXd5?=
 =?utf-8?B?WCtLZTNIQTRwVGJObWVoTXU3OXVzN3pNSzBic0FjRkdUVEh4VE5hK3grdlZP?=
 =?utf-8?B?RHlXUXRsTUZWN3Vhd25jNHpnNWhBcnVSQ0FTdEcyNFRnN0xKOXlPRXJYR2Uy?=
 =?utf-8?B?MEwrcEZuUjBSNmpOZjh0RDdUQzNzN2xIdFNRQks0STJzVlFzU0hjOU54blk4?=
 =?utf-8?B?cWgvTkE4Wk92d0lMT3JHWFl6MmJHSm53dUZkc0F1bkpzMVh1RGtBOXVnVlQz?=
 =?utf-8?B?NTRCNCtwNlJRTndLRXBMUHBNVXFKYVZJNEMrdWtKWEJtZmZVTFdYc3dON01M?=
 =?utf-8?B?WmRBSGVxZEt0czRRektIdmQ0MWVEQ2s0S1VUSEZoRlU4elRPblRwRVd0T3Yw?=
 =?utf-8?B?ckIvUHRNLzNHWEVGZnQySXV4UmFPQy9HVFNyM0RCa3J0aGgvaXMreTN4NnYv?=
 =?utf-8?B?d2FZZWdjNjhQRjVvL3hYUEwxcGQ4ZGZKaHNjeGxmdVpRTno1aXZPK3hiVHll?=
 =?utf-8?B?WFNPZlFWbjF6R3lNRlYyZEdxKy9rUGlKbDhUM3VVMGREazgrenJWZ0Z0dHhC?=
 =?utf-8?B?dVY3Ti9EMEJrYWRnWWxuWHd4MzdacTRCRjV2S3NJSGdWSHFnNW0wRnRrNzhB?=
 =?utf-8?B?WFN6R3hXZTI4ZlFOV3IvUDFOTG0vS1ltaG41em5US1hyREtPdjZzaXkxQ2di?=
 =?utf-8?B?cjhQWmpkQm1yL0t4dDZVWHY5MWhZNll3MEYwSUFqRDBOMmpJQlVaLzFPYU0z?=
 =?utf-8?B?dnNwb2tqRFROcW96RzNRcVkyclRvVFZFUGtyR3NMdnVUbFRPTHpqSGd3KzJw?=
 =?utf-8?B?eXBGWnNqVWZmK1kyZnlYbVlkUkRIOC9UZnk4Wm1GYVpDdmVxdHRiZHRId0t6?=
 =?utf-8?B?cENkdjgwUXdBZGhreW5iazBqU2pEdWNKdXBTMXhJKzhCYVE9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <75F6D7374CEDE540B1627521125908DD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7783
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cb87aaee-50dd-4a80-641a-08dce14c25cc
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y3MxK2tzdWJSWkdEOGtQTUsra1l5QnhVTnkwQVlRY0p1UFJLc0VNTmpJUkl6?=
 =?utf-8?B?WExkUnJ2Qm9OU0F5Ty9mdy9teUNkUlZDOTkycUJ3bGdYdDV6YmJSK3A3dlRp?=
 =?utf-8?B?LzJrS2FiK2xmU01SNE8yV1lIOWtKNDRhNWFEYjhVYzQweXN4VjVSbkZDTldF?=
 =?utf-8?B?eFJhb0ZabXVwN3pNN0poVmVBc3p0NGpwVVZwU0IrOVJzOGhkSUluY0NYY0tS?=
 =?utf-8?B?OHJNYThSeVExdmQxSFVFL1I5allmdHVmY3lwWFhSdG1ReFljZzZIQi9McXA4?=
 =?utf-8?B?MjdyOG1VQW1BV2tVZVkwZjdyQkZ2YzVCdlBSblpBMFNJWjRVZmIyOVZ5Nngz?=
 =?utf-8?B?ME0ycFZqWWZHWDQ5QTVzV0NvdDMvWmFwS2JvM0loMEtKckxnb0xySTZVZXdi?=
 =?utf-8?B?d0FSUG1sNUhHOExySTJiRHlqcm02am1tbVFtWFNmTnI3Z25uZjhkbklnS1hv?=
 =?utf-8?B?RUNJUE9nb29mNWZIdFBSN2ttdFczbG4zUkU3UENyY1ViU1hiY05raHVDTXFD?=
 =?utf-8?B?bkxLZjZSQVQyUDFBSXhRMHVoWlBKWURYUWF2YUowUVVQUk9VRi9FcHN5cWo1?=
 =?utf-8?B?VFIrazUrakRnUi9WazNsQTVYditvcHJ3ZUM0Qi90eE1KYWhuSmR2T3lROUNr?=
 =?utf-8?B?KzlnNGNFS2o0WTQvRGRLVTRHTUNmTFhpeXpyU0hlVVZMdlg0NEFTblkvWUR3?=
 =?utf-8?B?VW0xUXhRcVFwZzZHa1NIMjNwR3NvNXdjV2ZEN1ZiNnI1QTdnSXNXbHhzZ2hn?=
 =?utf-8?B?UjZvQ0w1MlNFM3cwUUtKV2gyWHlUTWtxU2NiVExJOW84SjltL2orOHpaN25N?=
 =?utf-8?B?ZGRpa0RHSTh0SUlocktGeFNsVWNJODl1Zk1PNXdDSzRPemlFS09NZVdBR3or?=
 =?utf-8?B?ZWhqRnFWVXVkek1HVHdEcnJNOGZNSmgrcmYyZDdWUktORzBGSVhHODV6WkVy?=
 =?utf-8?B?a3Z3Zi9mN1Yzb25kYlEzeCs5RWo1RFhWMTRiWnl2SVp1UHdQeGJwTWJPZVVw?=
 =?utf-8?B?U09zTUV3Y0dLTUhZb1JyNDNjZkVBTFZjckw5OHpwRzFTaDFmZkpsT0VuU0hF?=
 =?utf-8?B?SC9IUDVxY1dJOW5nWEtWWW9LNEY2RENTQlpLWkRMTzdUd1pGenJBS1hkV1Ez?=
 =?utf-8?B?d3FXOHVsVndTK0hxdFpiSjNTRmcyM21tOEtpWUgrckZyZE04TThZTWR2SFQ5?=
 =?utf-8?B?SzRBMGF1SzMrdnFZcDUxT0EvcmxZT3FJNjFEa1BYcE9ERFg2SGJWZnp3K2VH?=
 =?utf-8?B?bFdDYWJYRDJvMURieHpyOGVuakJKZ29XaDUwUW9Nc0prZmFNd291eE9rN01h?=
 =?utf-8?B?MnZkTmt6Z3NjckJUQlFjc3BGVlgrQkl4WHVGd0F1cmxPaUZPbjRsamdMdDBx?=
 =?utf-8?B?WGdsZlYrUW1qd1ZuZk9QNDZXbHlrM0k1SGNEUEM3VUttSnpDWjIrdFBZYjRu?=
 =?utf-8?B?eFZVVlpSRjhObXB3OThsTzV2akNVVlhnWERmY2tYbWxBOTNnb2puRisvMi9M?=
 =?utf-8?B?VXJmR05ZMXkvN25tU3hwV3ZGL2MwY0ZTSUwxL01veXR2T1BIMGdMTk41d1c4?=
 =?utf-8?B?UHVJWUgxWTRhUE9QNjhtNlZkMDY3Q2Vxc2V5M25sbXh5V1gvS250NVdJZmNa?=
 =?utf-8?B?bklyTWJ2KytTRDVzT2JZUGlQUklqVWlQZG4wS3A4ODdNN1BQZmxya0R0R1d6?=
 =?utf-8?B?dllQMmVJNm9kY21hdGJKdUJpTjlWb3RET0owdGZ0eUo0T1VuQ3FOY3VMQUgw?=
 =?utf-8?B?RGVWUU0xdkVOblRkOVJCclM4SnpjM05hbGFnWVRSc0VRYldPQmJMYjJKLzNv?=
 =?utf-8?B?WnNlSlFkNzV2QVgrV0NIQXMvcVlwOGloNklzdUErMDlTRlFDWTdFTXAxUXRa?=
 =?utf-8?Q?lC9q/UJTl2Yq2?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 12:34:04.0383
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bab404db-8bf8-42a0-e141-08dce14c2b52
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9739
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 12:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205117

T24gMjYgU2VwIDIwMjQsIGF0IDIxOjQwLCBDbGF1cyBTdG92Z2FhcmQgdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgPGNsYXVzLnN0b3ZnYWFyZD1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZz4gd3JvdGU6DQo+IA0KPiBSZXR1cm4gZWFybHkgd2hlbiBnbG9icyBpcyBlaXRoZXIgTm9u
ZSBvciBhbiBlbXB0eSBzdHJpbmcuIElmIGdsb2JzIGlzDQo+IGFuIGVtcHR5IHN0cmluZyBmcm9t
IHRoZSBzZWxmLmQuZ2V0VmFyLCB3ZSBzaG91bGQgc2tpcCB0aGUgcmVzZXQgb2YNCj4gaW5zdGFs
bF9jb21wbGVtZW50YXJ5LCBhcyB0aGUgcmVzdWx0IGZyb20gcHJvY2Vzc2luZyB3aXRoIGVtcHR5
IGdsb2IgaW4NCj4gb2UtcGtnZGF0YS11dGlsIHdpbGwgYWx3YXlzIGJlIDAgcGFja2FnZXMgdG8g
aW5zdGFsbC4NCg0KVGhpcyBpc27igJl0IHJpZ2h0OiBpZiB0aGUgZ2xvYnMgYXJlIGVtcHR5IHRo
ZW4gd2UgY2FuIHNraXAgdGhlIHByb2Nlc3Npbmcgb2YgdGhlIGdsb2JzLCBidXQgdGhpcyBmdW5j
dGlvbiBhbHNvIGNvbnRhaW5zIHRoZSBsb2NhbGUgYXJjaGl2ZSBnZW5lcmF0aW9uIHdoaWNoIGlz
IHRoZW4gc2tpcHBlZC4NCg0KSWRlYWxseSB0aGlzIGZ1bmN0aW9uIGlzIHRpZGllZCB1cCBhIGxp
dHRsZSBhcyBsb2NhbGUgYXJjaGl2ZSBnZW5lcmF0aW9uIGlzbuKAmXQgcmVhbGx5IHJlbGF0ZWQg
dG8gY29tcGxlbWVudGFyeSBpbnN0YWxsYXRpb24uDQoNClJvc3M=


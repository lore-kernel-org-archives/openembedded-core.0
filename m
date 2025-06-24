Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79DC5C77B7F
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 12:00:28 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.46])
 by mx.groups.io with SMTP id smtpd.web11.6671.1750766418485321041
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 05:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=gxci46w1;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=gxci46w1;
 spf=pass (domain: arm.com, ip: 52.101.84.46, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=EVy36G4Dq29f+nImqIU9x9/ZHziyBslheRpxi8JYgqt9zElf0a/UIowyOPxc5n5tS9V6lMVhBTt9P/4MxjbNJTQUr3eb7OKSxn5A518lkDBfI2DMZjpz+iR7nrCvhFc4zR6V1npDnuN7it4tRbpU5kRkT8yHvlbTadXBUJ1pZrar5fpy2SYjB8LdixXQBTjHrME0i1jwtWKCEB26+s3B/mG+UvE2zzZyFMdAWN6NquicyMsFKMjZa38lJKf4VVybCyl0i3wy0w5CeD3Ffbj8NbUgCvQpnM9UtHiYWFE6s3SnQztVVloK3zGasrJT8/Y2K1yjVEPRoaaYnzfQj3U9Rg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1wawOs7t+EsGlL03ue2gk+cSN4916LKEWMCuxwyJHjQ=;
 b=oDGd9mr2VnxwdlZGbgqP+jgt//mQMr4YueL1pxq+PN389g/V5N4lIBqXE/t+N4LInyxxzqF5b4JsVHilLZHbAOPFtzqD6C55NZidKzEddvwJ6f2eF9H3fpyrVekugG2sWsNcLLERdJIulcoHYek4TTjRVHFL9hXEds1d5AWyi2IQVFsjrdYPUhSHF7YHs9sKL9Uhl3qSEj8VCgNN7dK0YKytzQ7ds45QUdBIanqoZCdshaT6xVRIb/mvWxH9fwBgwU5LHYgtTljF7Jio6UOzafym2zewrPxoMnOuhSU6IE/JvbQDlSORM5AcuqGfwfD6/+hRMn2kS5ill261/sVn8w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=boeing.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1wawOs7t+EsGlL03ue2gk+cSN4916LKEWMCuxwyJHjQ=;
 b=gxci46w1e+hTKwTTVD7XtR4zu8oBYcblewtKCoEg7Nk4yVtTFF7X7oMpBIsPTFTNX+dNq4dsy0v5HhYEZMoR+BpDf1HHGOiSFhA6pneAmxPEcbb7Pp7T9GOQgwno+qGJyTk9qxT1pv3gGRzkngD0QU47pYg1ui9FGRCPpcIx1GA=
Received: from DB6PR0301CA0094.eurprd03.prod.outlook.com (2603:10a6:6:30::41)
 by DU0PR08MB9824.eurprd08.prod.outlook.com (2603:10a6:10:443::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 12:00:13 +0000
Received: from DU6PEPF0000A7E3.eurprd02.prod.outlook.com
 (2603:10a6:6:30:cafe::72) by DB6PR0301CA0094.outlook.office365.com
 (2603:10a6:6:30::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.29 via Frontend Transport; Tue,
 24 Jun 2025 12:00:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E3.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14 via
 Frontend Transport; Tue, 24 Jun 2025 12:00:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BisvZn0D85EpcrRDEXoGpaQzXPjOj6o54C+mhtNF7o51pzXRb64FIk7MR4E9xTeVMnawdRsaUHLJhWZkpt61PrslOoLDmM2gKaH7P0QaXOu6+xtxF3D6KV93yXaNnWZ8VkSwPpSB9p3c7BfryE8oNpXxLrT/xzhKgqBfr6qiJI9ZrJKDksJkDArewNHf4mR4iAfda6+Odiomf3SpuVQ+7g/SPySyeTgWKP54obOzwgEM6y5AOdf4D8p2qInWrKBuWJFOMfjC78HoFKQNGW2s835HFQOqWVwbzhXo6kV3CfkRjirJNX2qp/182ua0AhWVNksL348YSZ6lgudY41SPzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1wawOs7t+EsGlL03ue2gk+cSN4916LKEWMCuxwyJHjQ=;
 b=NH/vCXQKmXCYVLafDjyuqajMSbM7tBABVRCuXO5SmYKp9b+01zJaW1Z/CReS+/zWVVxjIcsmMWCCbdedG8uYkUijBi5sREdu1bsnL1UtjduWZfnPhjYSSILqHu9UgzZckZWmBtthVrySyChYb6hdWB96Vex05+z55Yyn5/OdNun102aurlkEe91y8iy485j2PwBTYD8ULeQv7ULE7lOGL+uVaiYaGgLVNQN8kaHuOz76xpK0y727jaA0IkcbtHnWq5xobpyk64p1/pjzsNGqx+Z2oagMTCL+/f3NHHK3jw+dMYxO++SPzmttqb5lPO83i+zB5h57+bZE3o+rYvyDgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1wawOs7t+EsGlL03ue2gk+cSN4916LKEWMCuxwyJHjQ=;
 b=gxci46w1e+hTKwTTVD7XtR4zu8oBYcblewtKCoEg7Nk4yVtTFF7X7oMpBIsPTFTNX+dNq4dsy0v5HhYEZMoR+BpDf1HHGOiSFhA6pneAmxPEcbb7Pp7T9GOQgwno+qGJyTk9qxT1pv3gGRzkngD0QU47pYg1ui9FGRCPpcIx1GA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9305.eurprd08.prod.outlook.com (2603:10a6:102:306::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 11:59:39 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%7]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 11:59:38 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "thune.a.tran@boeing.com" <thune.a.tran@boeing.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Chuck Wolber
	<chuck.wolber@boeing.com>
Subject: Re: [OE-core] [PATCH v2] oeqa/sdk: Simplify test specification and
 discovery
Thread-Topic: [OE-core] [PATCH v2] oeqa/sdk: Simplify test specification and
 discovery
Thread-Index: AQHb1mcYtdywnXlSJUm0bm7/EuGeV7QSUhEA
Date: Tue, 24 Jun 2025 11:59:38 +0000
Message-ID: <758CF101-6F42-470E-A68B-CD0F48F2702E@arm.com>
References: <20250605221301.890797-1-thune.a.tran@boeing.com>
In-Reply-To: <20250605221301.890797-1-thune.a.tran@boeing.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9305:EE_|DU6PEPF0000A7E3:EE_|DU0PR08MB9824:EE_
X-MS-Office365-Filtering-Correlation-Id: 699209aa-0a3b-4c05-5719-08ddb316abe8
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?ODlpQTJjQlcxUkx0TGkzQUo0STRZNm9hRlhUcjZCSm5WT3h4c1NxckRaS253?=
 =?utf-8?B?VEhycXBOU1lIMHR2cXViZ3dsTWZoYjhjVVlUOXBUbmNhTWhqN090WHZiZGlz?=
 =?utf-8?B?ZWlWU0hnMTZOMG15QmZ6RHNTR0xnbm9aeGVtMGQyNGhTeFk0ZTk4cFdMMzY0?=
 =?utf-8?B?TlVkQ3RjamRGRmRRUU9Va2p2VFRhdG50S2hTMnZFaVhWTFFQbnk2clFvcVFH?=
 =?utf-8?B?RzdacnpMVGVQSllJYUNocEhYK3FqWG1icC91S3l5bkZUNXB6NjVmZ01xOC9Y?=
 =?utf-8?B?cXhIQVpwVWJNRk5idE9SenJkeUgxSlljeXFYM0daZjZEZ1ZLNTJzTzBmTWd5?=
 =?utf-8?B?b1JobldQRmR2dGJJa3MrU0R4VzVVeWNEa0Y5clR2MmRkUGRNMVV1aVJxTVk4?=
 =?utf-8?B?U3lHWGhhWlJ6ZWJHM0NLaXNhNnAwSUd4K1hnazBsVVUxbG9sK3BWVkx3NjQv?=
 =?utf-8?B?cTJpbVFrQ0pTekxnYmZlVFZGSys5U1VMQjdCNkw4a1psTXh2aVFzUHpmYWVH?=
 =?utf-8?B?ZDd3M0lCdk9IdDFCc0MrdXR4T0huTVVYazFkQktxU0E0N0pMeW5qRXZhdlEx?=
 =?utf-8?B?RWQvL2FZY2J2YXBPNklGWXNOdmNHaWtvVmVmM3krRFY0VXJjYmVkckl3NmxO?=
 =?utf-8?B?MVNYOG54cWx3cmN6Q1FKNkZkb1NYd0UwR2FtSzh4V0Q3YlVLL3FyS2R5d0lB?=
 =?utf-8?B?SjNSTDBhRTkyck9pMmJwQW9CS3JROGdJeXY1bEIxai9GYjhqYUhmZ1pFYUhY?=
 =?utf-8?B?R3JPaXVxbS8vV3lodi9hNkFKTEJIOGRVZ0lzU2tmSEFiMXFGVzVOS0FIZHFt?=
 =?utf-8?B?OHBWOXY0S0QrTE5WOXl2OFJNYWkvVkw1WnIxRXdxaTNvZnJLLzV1dWZtMHpB?=
 =?utf-8?B?SkJZN3BORkRnTWE4cDNibkMrTExha3JLVDJvOEVrQlZCLzRYWXJWUjFKQTNL?=
 =?utf-8?B?d0lncjBSRVBJVG85NmtHZytVSzBpWjdTL093cjBEVHVFZ1oycWxaNFhtT2dP?=
 =?utf-8?B?QmRTeU80c2pCOEd5VFJxeHA2am04cW9DZitGMUZhVk9iSG5ubGM0eEhtU3RL?=
 =?utf-8?B?Z3AyTzZBSHhtN2ZDdEFDVG9mTXJnSXpUMWdBeDJmNVhrbnNnZXhwcDM2c1NP?=
 =?utf-8?B?THhjbERNUUh5ZE52bDAvV3NaSXhRdEZwc3doWktPaWI3cmpoU3ZVVzdJQmFH?=
 =?utf-8?B?VyszU0c5QlRTUDQ2NFdFbFNYcUxBYkdFbTFVbEJVT0RsblZRWEJBbmgvZ3Zp?=
 =?utf-8?B?OUc2Umd6Sm9GcVRxdDd1bGpSRmpvbzhCTlE5anN4RDVmeDhOQWd2TWZQMUxx?=
 =?utf-8?B?L00vcWhmUWF4Ly9LZWJybFNpU0dmelVGckNZT05Qa3QrQURDa1JJTmlxUElv?=
 =?utf-8?B?NUI2ckpKUktMSFAwcHh6TGFsSFBVWjdtY2NoN3VNR1l0bFcraysxRStVL1hZ?=
 =?utf-8?B?TU5nVmVOdW1EeGVETHh3VFpzZW1BWjcvQllzY3N0VXFTcndIeWpoMDIrZlBr?=
 =?utf-8?B?T1hJaEdXNjBMUmt3WnkwZ1U3VHRRZmJtcFlteTBUZHZSelV2UmovOEErL2xN?=
 =?utf-8?B?S2dSZ0N0Z0Jsc2ZoOGpUMlJuTnN4T2tVa1hxUEN0cDlhSG1NQldWellpcGxK?=
 =?utf-8?B?clNvdEFWQW5pdmJxUFJqejJvajVoQVhMa05jK2lGajQrbnNoUVRxT2I0SUJQ?=
 =?utf-8?B?OWdUaldLSTZIMzhFRy81WkVWeDBxY1crMHlOQUYzUUt2a2xYOVNVbWxuZUtx?=
 =?utf-8?B?MXBrR0l1M1hFb0w2eUlBNkVPY0tWNlE2RU5HZWtZdU50YTJtMGg4N2VwT25T?=
 =?utf-8?B?VzVQbVdPWkFQMU0wNXdDc0VvbXVBRG1lTkFwa2JGL2JnVHdzYm0vWGg4Witn?=
 =?utf-8?B?T3ZoQ1JRVmNCd1dBZWhnVFJaL1N2MW44ZEtSVlVFUWJlTmU3elhEZW1zMWxy?=
 =?utf-8?B?NWdrWnV6RzJIVlhDc1hkSmE4WkdXcEp0T2RuWmJ2WVpTVDdESVVFdmRqeDBv?=
 =?utf-8?Q?mlxF88HWZA3C8BKVOUDJ7Hy6rMAv7U=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E6EA8415F380D24BB7B431C76F27F30A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9305
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2a42458c-eb98-4a19-b0ca-08ddb31698a3
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|14060799003|35042699022|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MXpFSEtFRlhFRmlsMlNKNmVzckNpdHJFQVNUR21VVHhnb1dKSkcvMnM5cy92?=
 =?utf-8?B?cUlRSXl2V3d3RlFUa1JaQ3V2cnNnOEtSZEp3T1U0SStvZmlKeEtpRHFrZGdH?=
 =?utf-8?B?OHVCVzl2SEM1V0ZzK1RQQ2F0bkZhWkpHeCt0MkZqSm9CZDd2YjhidVpiV0hQ?=
 =?utf-8?B?NENPdVExZ2owUFJUZ2k4ajJXSmdjYnFLNzlXd1grS2s0WS9VUFFEclc5cE5M?=
 =?utf-8?B?Ti81REtVKytRTmpsa2dKQXZ1eUJRTUhqUEJIcllialJxanBqSEZsY1ZycnFW?=
 =?utf-8?B?N2xaUTNqQ25KWjFOOU5DZk1RYUI5OTFmZXduYmdOZjVWUC9aUC8yeVNFVnJj?=
 =?utf-8?B?UjVGaGRmWWtTMDNVV2JOSW5TN1ROSENBcUtlRlplZWoydE1QdGNLUENaa0d0?=
 =?utf-8?B?UXpXZUdDQ3hHM2RwVG11ekFwUnZTU2tvd2pkVTFKUlpGRFA1aUx6RGxkZWFt?=
 =?utf-8?B?YXQzeXBNQ3pOMnk0eThLSEhzSHFSYlJyVXFSQlRrcUVBOEprd1IyTlBFaUxS?=
 =?utf-8?B?cGRuZVRPK2RORkN4TUx3Y05GdzV6T0lqRnhZS0xkT1NMVEpyUmc5T1FWYjcx?=
 =?utf-8?B?bjVOU21HTThDcnhTL293cmlVWnhjc0wySjlrT1oxMFZmR3VseGtIbWRtRjlJ?=
 =?utf-8?B?YkU3bFR1ZTBYWU5KM0JOcUpkbDRjSzhFNVpyUjZVY2ZQdXZKNzAwTXM2SVV1?=
 =?utf-8?B?a2pzTHNpcVZrS1ZRQ0pjR1JZYldXaUdpc29lUkgyTU03VTQyNzNueVZ6dnB6?=
 =?utf-8?B?TlROQTVEZVNwdHJ5Skh3WmFmZzJJZlRvdDd2THJORmo3amdTWE0xS2E3OWw1?=
 =?utf-8?B?SS9wTStuNWFQVzNRTGx3NVZScE9rNTh0ZnVxWFZVMGVRcW9PS3MrM0prMXFr?=
 =?utf-8?B?Uk5vV29BUE8vQlUxNDFudVNJUGZlenI1VWk3WDdNMmp0ZkNST2F0QWRYQThU?=
 =?utf-8?B?NkFKekE5UWdjb05KRm42d1lOSjYzNVBiR003M3czQzhvRlBPaVZlMnV0alpI?=
 =?utf-8?B?MU9OMzQrbFpMMjhGTnFvOEpOY0NITmkxYjVKUnVndlVVVmVkQ0ZIekJFTzN0?=
 =?utf-8?B?U2wvYi9MYnhVSFV6VnpWRmZ0NlV0Q3hYNzhLYWtBYU5vVVJHWXlGeEtZNHcw?=
 =?utf-8?B?TUN5dzkzS3dWRXlaQ0RuSVBxL0F6aXhGblFuSmM3ZzBQNFhSM1JYNjFvZ1pI?=
 =?utf-8?B?eDl4L0Zscnl2SFBqUW1zbXZ4cGNsMTdyS3RTQ3U0MnpRVVFSNmlXVWhpdUZo?=
 =?utf-8?B?K283ZTNtczU5S2h0endsdXExYUE0TWNNMnc1d2JvZWVzak9ZVkF1eUdhc001?=
 =?utf-8?B?cXZ0YkNsN0V0Y1dNc2hzbXFUZ29TUzFOZUMvUTAxTCtXeWxqV0JGZm90U1h6?=
 =?utf-8?B?VXNYUzhmTzFGbVc4Q00zbzhFSTdPd3ptYVE1eXUwWU12OTB4OHBOQWtFeGxJ?=
 =?utf-8?B?SlpWaGQ2d0hTUk50eERlVjIzZDArOXc5K2JIbUlpWWg1dGFLV1B0M0FyU2JY?=
 =?utf-8?B?SG1qekF1R3R4NG5lNUUwdjRuNEgwZ3FWc1lvTVg3c0VQT2hqRDVQSktsbnYw?=
 =?utf-8?B?ejlRK1pzTDhOUkFLNVEyeXB3bGlqdlQvcjg2R2tWMVAxb2ozZnc4czFFdGkv?=
 =?utf-8?B?empFY09vOTkzTWZzblJTemlwaFdRUmFoWmg0eU1ZQ3FWaGtZajU4S1lLQUNn?=
 =?utf-8?B?K2VwREtGWVVNNE1ScmdKeUxodG9pakJSWVovcERQYWE1c2xtTndYRmVYdzdr?=
 =?utf-8?B?UXBuOUVZeWlkNDhvQlpmbjc0Z0o0WTBHeS8vOUl1MlptSHYvUWU2V3FiYU94?=
 =?utf-8?B?Q2lNQVN0UDVrOTVCMXBBeHIzVGRMcW9XSzRsbklxQU1XY0V4cGZWbzNjbmVT?=
 =?utf-8?B?YUNiUTlNcktYRkVVMUM0UlFOT2ljOTFwTUtTbEg1dnpCaisvbG50R3gxeG0r?=
 =?utf-8?B?cDhvYVpIUGJFRnhvQmZXSTRRTS96ZmJVSlJHUkZvZDNoVW5mM1prSmx1SWZy?=
 =?utf-8?B?RVRlcmYrUWtZK3JGOW4yQm91NEtBb2o4OUVqZDlpaHhNalBtT09Cb2d6amM5?=
 =?utf-8?Q?Y/CSpi?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(14060799003)(35042699022)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 12:00:11.0257
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 699209aa-0a3b-4c05-5719-08ddb316abe8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9824
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 12:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219252

T24gNSBKdW4gMjAyNSwgYXQgMjM6MTMsIFRodW5lIFRyYW4gdmlhIGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcgPHRodW5lLmEudHJhbj1ib2VpbmcuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdy
b3RlOg0KPiBTaW1wbGlmeSBob3cgdGVzdHMgYXJlIHNwZWNpZmllZCBhbmQgZGlzY292ZXJlZCBm
b3IgZGlmZmVyZW50IFNESyBjb25maWd1cmF0aW9ucw0KPiB0byBhbGxvdyBwZXItbGF5ZXIgY3Vz
dG9taXphdGlvbi4NCg0KTmljZSENCg0KPiAqIEludHJvZHVjZSBgVEVTVFNES19DQVNFX0RJUlNg
IHZhcmlhYmxlIHRvIHNwZWNpZnkgdGVzdCBkaXJlY3RvcnkgdHlwZXMsDQo+ICByZXBsYWNpbmcg
dGhlIG5lZWQgdG8gbW9kaWZ5IHRoZSBkZWZhdWx0X2Nhc2VzIGNsYXNzIG1lbWJlcg0KDQpJcyB0
aGVyZSBhIG5lZWQgZm9yIHRoaXMgdG8gYmUgX0RJUlMgYW5kIG5vdCBfRElSPw0KDQpJcyB0aGlz
IGp1c3QgYmVpbmcgZ2VuZXJhbGlzZWQgYmVjYXVzZSB5b3UgY2FuLCBvciBkbyB5b3UgaGF2ZSBp
bnRlcm5hbCB1c2VzIHdoZXJlIHRoZXJlIGFyZSBtdWx0aXBsZSBjYXNlIGRpcmVjdG9yeSBuYW1l
cz8NCg0KPiAgbWV0YS9saWIvb2VxYS8NCj4gIOKUnOKUgOKUgCBzZGsvY2FzZXMvICAgICAgICAg
ICAgICAgICAjIChkZWZhdWx0KSBTdGFuZGFyZCBTREs6IGRpcm5hbWU9InNkayINCj4gIOKUnOKU
gOKUgCBzZGtidWlsZHRvb2xzL2Nhc2VzLyAgICAgICAjIEJ1aWxkdG9vbHM6IGRpcm5hbWU9InNk
a2J1aWxkdG9vbHMiDQo+ICDilJTilIDilIAgc2RrYnVpbGR0b29scy1kb2NzL2Nhc2VzLyAgIyBC
dWlsZHRvb2xzLWRvY3M6IGRpcm5hbWU9InNka2J1aWxkdG9vbHMtZG9jcyINCg0KQ2FuIHlvdSBk
cm9wIHRoZSBzZGsgcHJlZml4IGZyb20gc2RrYnVpbGR0b29scyBhbmQgc2RrYnVpbGR0b29scy1k
b2NzPw0KDQo+ICogQWRkIG1pbmd3IHNkayBjb21wYXRpYmlsaXR5IHVudGlsIG1ldGEtbWluZ3cg
bWlncmF0ZXMgdG8gVEVTVFNES19DQVNFX0RJUlMNCg0KSeKAmW0gdGVtcHRlZCB0byBzYXkgZG9u
4oCZdCBib3RoZXIgaGF2aW5nIG1pbmd3IGNvbXBhdGliaWxpdHksIGJ1dCBpZiB5b3UgY2FuIHNl
bmQgYSBwYXRjaCB0byBtaWdyYXRlIG1ldGEtbWluZ3cgdGhlbiB3ZSBjYW4ganVzdCBtZXJnZSB0
aGVtIGJvdGggYXQgdGhlIHNhbWUgdGltZS4NCg0KVGhhbmtzLA0KUm9zcw==


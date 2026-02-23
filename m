Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B1A4EC111C
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 18:09:23 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.983.1771870159174993089
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 10:09:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=NBQd+brN;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=NBQd+brN;
 spf=pass (domain: arm.com, ip: 40.107.130.9, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=y2q6TQOpVbTiScjxNjjlelF1AJ9Qd93G2/MhwNYRC/uIycL5bPeJ9DmV3oBz+FMUR7cS0j3TRlCGqk+Ke6Bg80BwGp6Hx4IN/oHw+A89956+/hwD3vdqCNzeB/Z+KHPD6+kycrM6dnbTDOypPC4gWQNemFVtX2b5QNmao4LFh0qgmgguTQalVGKgpN9aHvFjOPTyQlkc8ZOIMmV6ufJHkcopByCvwuioi8kCJQWgU5P7uTLfhcMHPN8yrVnMdg0aplbYH0VkG3L1jys1pspJFxfIUax9GBbuEPpIikPRATpWxFiwuevFpt7JMCkt5v2nvWY39M0quexctvDOg7LlEg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=afWhnVbbTiiZu4SINn1lcu+enqFgdWAed4E+uJApqMU=;
 b=V7uQGdqiiv37r9kZRbqbt4oIaSLg3Zx4cIPGe20OFsrndQr7EQ+FMqoc82+NvMe0IWm0rFW7MgQUuo56OccE40eQqSOczXJ/ciGr6kFSyDUczTjlK8/jqEElwiL5lNbzDJA30vRO+qPE8IXVMHvy1e6+pLmMQEJnsJqSSJyg/PS1k7Dzm3MkTy6qeFbN2FxekVrbfzSccZ0fdFO8tSeO88uQhfGhgbv7tRoN2i/jpOvYSRppNr2mEckx9+FU/YnoP1pHvgyGzM0DYIPynSb47r75l2zjH1bqMbf1eBZv4aY8lqktFh9YFR8abSFaz5vuOnAuLCldXIdy2nRqTU6MuA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=t-online.de smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afWhnVbbTiiZu4SINn1lcu+enqFgdWAed4E+uJApqMU=;
 b=NBQd+brNo8uqCbd4UK+NsIF6CM7GvrWhVWBlrE1vPfDjPivvA8sFvM3oQttak2vX+lIdthKtNrwHy85GQKNu869lM51RJpL1ENRlIdh5MzrBhnU48vu3Hp9jtSJsgTcxZonR1gvCyEFUb0tblo3OKWWuVrbI2IXtS77NXEWEelU=
Received: from DU2PR04CA0062.eurprd04.prod.outlook.com (2603:10a6:10:232::7)
 by GVXPR08MB11744.eurprd08.prod.outlook.com (2603:10a6:150:316::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 18:09:14 +0000
Received: from DU2PEPF00028D0A.eurprd03.prod.outlook.com
 (2603:10a6:10:232:cafe::fd) by DU2PR04CA0062.outlook.office365.com
 (2603:10a6:10:232::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 18:09:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0A.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Mon, 23 Feb 2026 18:09:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iShX+EK1I7lbLUk91nNGE0ua7FTthT4RrGWy0NJmII8qc7ON96VkM2q5VEX6WUH2k6RD4T4JDpwGz/XJRvIbhfZ6f4IR7P6O0rIa6iJBGwWX8yVPdBq7Bf5rdY3uJOjlFM7QXkdIS0dnazxSfuE8u15i6Qe9mj3dhPNGJEwC76PObanDGqanlRAHLoKoZF7/j6ymDDD/L/xLSrqOMg/4NyRilcTvkW15JrAXlih969KKbv6uu9TCdoQDWpbLiB7nLzmb9cJ6LEBwUnMkV+YcA8CwCNbk3tIcei10xoKxKEQjRT/fURYHZoxVEzN4H6T3pUvW76IFvlNB1dtU5a2zBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=afWhnVbbTiiZu4SINn1lcu+enqFgdWAed4E+uJApqMU=;
 b=x7rjHiU67TVcTQc/xLXMc/UhOFqirFz0fxCBcFrJKzLktDjos1huMELExFb9OIsZhcIJs5v+g96RSZ57aE1fPc6AMFZVMhJm3C4Aqk4r6MSuCJVTUYOSkkGFeJnoU8DUtvjrWrms7371ZqEc+QRe+kFaUGtrDUeUC2YFxs4JfuVyAJriqjheV1lE4ZjFMziitkE/oFPiDtTMJ4DSn8pBsqGdkOBw6faI2yVPZCSuyhckqdbxEMUwBUIOknnP8MRWmyTJHRAHS5PemvI/zd0hWd042K6OhX4FZ02iNULKHzJWrLq3QKyu0G7B2cIEjfmqp3i/BAzYpHEL4jBqEPv81g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afWhnVbbTiiZu4SINn1lcu+enqFgdWAed4E+uJApqMU=;
 b=NBQd+brNo8uqCbd4UK+NsIF6CM7GvrWhVWBlrE1vPfDjPivvA8sFvM3oQttak2vX+lIdthKtNrwHy85GQKNu869lM51RJpL1ENRlIdh5MzrBhnU48vu3Hp9jtSJsgTcxZonR1gvCyEFUb0tblo3OKWWuVrbI2IXtS77NXEWEelU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB10136.eurprd08.prod.outlook.com (2603:10a6:102:34f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Mon, 23 Feb
 2026 18:08:10 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9632.010; Mon, 23 Feb 2026
 18:08:09 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "f_l_k@t-online.de" <f_l_k@t-online.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH] dbus: disable ptest if using dbus-broker
Thread-Topic: [oe-core][PATCH] dbus: disable ptest if using dbus-broker
Thread-Index: AQHcoRavl2N2KTTQe0OV9NF3xLMFDbWQnIKA
Date: Mon, 23 Feb 2026 18:08:09 +0000
Message-ID: <FB1758B8-BC23-4F97-9C11-DFA240E7FE77@arm.com>
References: <20260218203844.2846590-1-f_l_k@t-online.de>
In-Reply-To: <20260218203844.2846590-1-f_l_k@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB10136:EE_|DU2PEPF00028D0A:EE_|GVXPR08MB11744:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ca5e73f-4bde-4663-8702-08de7306a6ca
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?WElGdHpoSGNON0Q1TEVBalFxbWY1VHJYdktmZGFWSmZ0a1VMRW16MzdnYlVn?=
 =?utf-8?B?NjBaUGN6UW5xZ2paS1k1K3RmSGJWVk5DeHVSMXhaYTJVd3NLV0lNYkxueVNK?=
 =?utf-8?B?V0svMitQbUJaWHlFaklwaUxiY2dXZU12REdmUEpFd1RwMnFWcjIzNjgrV1c0?=
 =?utf-8?B?WUlyOTNxL3VrTm1UM2ErZDdxK3NxNjV3NDNXYStPMnY5VG9mRkZkdEs5d1pO?=
 =?utf-8?B?Z0pzZmJEUUtuQUN4bk4zTkFoV2psbTRLdG02V1pIdUsvZUJQb2NCajhOMU8z?=
 =?utf-8?B?Tm4yYXJaZjhPd29iWmxlNTBWTi9GZlk0N09ZOTYzSEdteTR3MjJmc0NvdVps?=
 =?utf-8?B?Rm81THdrRmtxOVJrZWFHZzdxN3haYXBQY0dYVGs4Zm9lS0N0Yis0cDNIaXNo?=
 =?utf-8?B?bTl0M2dTaUFVUHJWZFRLWmYreWtrY09sdUQ1MG0rVVM5TUJ1eEtzdWErcSs2?=
 =?utf-8?B?cERqMlhXRTAvMFBuL1VBL0dDcDJWdUJXckFsdTVzdHFIeDZXYllCOXdkZE1G?=
 =?utf-8?B?SVh5TUpPdis3OHROdkE5YjN2TmFiTW1KT0lsY0t1QytjK3RVTGpyYVdmS1ds?=
 =?utf-8?B?b25NV3BtdEI0SkluVDl5UkloZEhhNE53SzdCdnpNaXhBdkJmVVZtcGo3SUFM?=
 =?utf-8?B?Mmw4Q0IxRHJ6WU1TbFlaVmJvYThTT1R3QlBGcEU5UVFJZ0EvNWIwaG92OGUw?=
 =?utf-8?B?OXMzdjVGZ2J6TGpMZUFwd3ArN2Y3bHdIWmh3bnUxNnExcjM3U0tsUWgzZ09K?=
 =?utf-8?B?eHVZMDlZM3p5YksxY0VWbytRbEZmbnBqMFlyejU3a09Yb2VZRTY3SW80SzdN?=
 =?utf-8?B?RVBjTUd2V0F2NERjY05ZaUpEQjhuOVExYkw4d1dhT3FmT2VXSlJzQlJiUzJL?=
 =?utf-8?B?d0d6eDRqSHdFQ0p0UUhjdHl3dzlndDMyWGgzbURUT01SYmw4Q0c2US9lQzdz?=
 =?utf-8?B?TGE3MGdabXpkSnQzL2RzaG1oY0xEdlQ0RkVSLzJGblBXbERLYlNocnJTVVRj?=
 =?utf-8?B?TVdSc04raEI3MWhlYjJ3SklTRTlxbmMxdWdiV20rV2U5a2FnWmZXQWZQZkFs?=
 =?utf-8?B?MHArYlUrcDdSYldKZEZYNUFwbVNwUWJMeURqMUNyVm1XS2lQZ1h0SzhaS3hG?=
 =?utf-8?B?NkxveW04WXpMczRCalBEMU5qdTR6K3JQekYrY25jZ3FTbDJkWVE3ZEdZaDA0?=
 =?utf-8?B?ZTFOMDFXQlR1eHJaRnEyME5DYkJXK2JielZ2LzNDKzRWM3NRY1poU0hXcFE1?=
 =?utf-8?B?Q3NlNEVNenBobVNtRThVc1M2bzZSVUtMalpSOTg0OGV6ZlBoUGJzQzFScWdz?=
 =?utf-8?B?ekc5TVhuK0lGVUVERGV5eURQUTV0WnhBTG1iRzdCd0Y2WUtjdzl4c3BoT1dB?=
 =?utf-8?B?TTdGMnpoaU0weElncEVIUWwrcmlVbm53bW5SNGJlTEIzQVQwQkpJMFQ3U1pR?=
 =?utf-8?B?ZU5RbWlSUnZhQlFGMnltbTljNERxQVFJekcxNVZpNGhsWUZ6aFEzNXJFRmcx?=
 =?utf-8?B?ejgwdGVTYTdTRW9WWXcrYTM0MjhWZFhEQUF0RXMxRDlBemsvQWZZVlFaNnhQ?=
 =?utf-8?B?clpsUjd3MG5yTHZBaThzUEk4cWNxQ0hSYnQvTEVQZXNuV054TmpEQURXeWEz?=
 =?utf-8?B?V2lVelNoU1dpVkE1RXU4ejQ3M05ZbXJGTFZSZUl0MXNOZnVUV3h1SGk1bGxw?=
 =?utf-8?B?eHhKNDZ0c0M1Zy9iRTdUR1VmR0R2UXBRTGVWVWE0eWFVZjJySXc2MkpvRnpk?=
 =?utf-8?B?U2tkMTBiR2FaOSthSlpFZ2ExaDNlZXFqMmc5TDR4QXEyY2MrcUlmZUs3WThW?=
 =?utf-8?B?d29rZFROeldlQXhmV01Md2RKN1VmM2t4RjNQZXpLdFROS2dlak1YSDVGRGZJ?=
 =?utf-8?B?dytzeVlqVUpFQkIxL1UyaFdNbXRSaUY0TlBzL3FSYWt5bzlsdjMzdjNnWDl6?=
 =?utf-8?B?WGIvaEozMmNVWkpBK1JFQUhrMUEzN0ZiSnRyS3JGZUp2Zm4ramVYTnFUZWQ1?=
 =?utf-8?B?UE9LWUxaSmMvc1FYYjdiaWVFSGxIaU50SnVTcnNwc0RMTTVDQXVQeDFkVytJ?=
 =?utf-8?B?YnRlbVVuY1AxRzd2OTEzZ0ZYS2l5MUtYMW5FQXJCdlUvSlk2TDhITXVBbHFr?=
 =?utf-8?B?QXZRNitRWnZxUXY2cUt0QUVqbklDRTNOT0lhSjR3QWNSajNCTC90blBlT2Ey?=
 =?utf-8?Q?IrTZDkiko+ksVOMQ9IUSFAk=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E68D050754395F45B7D0AEB575AF2D34@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10136
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D0A.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e73ab0d6-6c25-46e8-2cdb-08de730680a9
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|14060799003|82310400026|35042699022|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RVhFUzROaWpqc2dVYmIxVmEzMnFZeUpXbmpQRDBWZTZGNG5LWkJSV0VhWW5T?=
 =?utf-8?B?MEdJUGZuN0tVdE5SeFZTcUJoZnFBL0VMam0rVk5EYjF3UEFOOGpnbisxOS9h?=
 =?utf-8?B?TWlQMFdWY3NMSGx6c0NINE5tWlpHRm9sNnoxbzRNYy8reUgxbGJMSFZzQ3dh?=
 =?utf-8?B?ZFdjN0YzL05mMDVmOTBMWnlkQnJaYzYvSlJqY3pHZTQ0OEdIVEZYZjd6bGZG?=
 =?utf-8?B?ZjlxOHJGbndyT3owTWsxVFBxa3VLcUJ4OHJTNjdUK3I0Z0lsVWFwQWdMcURO?=
 =?utf-8?B?MC8yZDdjNEhiTmdOTkw3NlYvODRKbFRZeW5qcTJaZVZacXNTSmNHZlVJbENV?=
 =?utf-8?B?cUJ0dlZTMS9tRXpqb2RjNHE0cEhhSnlxbTRVZVJVSDFvTktnL0xFdWVEeHdF?=
 =?utf-8?B?Mk1leWRvVEp4bzBtQlBRT1EwN1lZbXhDeTI5RERjUEpCZ01sTFZDK0RXcWtZ?=
 =?utf-8?B?NXNlYkM5WFp2ODdYUklERjFWSG03OUhXYUVNQzRzUnVPSXB1ZjJ6dHU3Qm4r?=
 =?utf-8?B?b1BJRWordW1PSUo1QlBCa1hhQXdqM0w0UjdTcy9ZY2ROUGxNOW9rbW9PVk9H?=
 =?utf-8?B?M0pBelZIZzhMVTkrV1ppWnhyUERBcVlqMEZOVzQ3WVFtTVNPZWRJQWM2Rjho?=
 =?utf-8?B?TXhCQWxvYUpScUZ6K1pkL1NkUmQ5c2N5eE9xczhFQ2YxOEFod1dxMDhJdmVV?=
 =?utf-8?B?MHZabTBFaGtRSXpIeXpzWGdTTnl1allMQkdyNVB6M1NMenhvcFp6Tk5lNVYr?=
 =?utf-8?B?MmNSSlB6UGdXRlIrZExUeXo2S0hIMGNwcmZrN1BORnZrRnJlU2U1ZExmUUsy?=
 =?utf-8?B?a1NKRWxNbE5YajBZMHVkUHpuZGh2aktLekFkeHFmenJFUis3MmtvUUhKK2NN?=
 =?utf-8?B?ZFZpZHhHN2RDM005SkVXS1duSC9RTWFiYmJjcXlQWVk0dTV4TDdhaWg3amVV?=
 =?utf-8?B?OExYRVJ0WjMrOTFJdzFJaGRuN2tyaTJTNWJ3THNUMEs3S0M2SHg3bTZGNzRI?=
 =?utf-8?B?TSt2dDFwK1NqMUl0c1czMkJqUXFrcmRMNHd1eDVLQWlxenV3clFBWkFZZnMx?=
 =?utf-8?B?THZIdzlZMksyaGNwTWJnRmwwVGZCdVViSmx6dTA3WmkrWVZXMXV4UG9iN3dT?=
 =?utf-8?B?WDNDZzlQOFVSK0ZzanZOUWlpaE95eGJ4Wks4Y0ZEQU9Gdm93UStTdk9oMzlW?=
 =?utf-8?B?M0NCWUpSdHJtaWhNSzd0cmFwT1R6b0oxYXhyY2xLSDhGamlCcE1yYWpBTEdk?=
 =?utf-8?B?Si9ydkJpOTN3cTJvRWtjK3ZOTytpWHFFU1o4QzI0MDc5RWZiZ1NDVk4ybkxH?=
 =?utf-8?B?bkM5VTU3N2FUUk9XdmQ2Y2ZOMVRkeG9tU1JKSDZ5ekxDeEdIVHU5bTYxd2tR?=
 =?utf-8?B?SHZSdmRIK3R1YzVsVVBQdUh6bWd1RlNER0tTKzZsWDBNRkpqWjE1UDlRU3RH?=
 =?utf-8?B?WjY2eCs3TU1PTjV0Q1pTa2d4aXlUQmhEdHY0NkpZWVBqRjVXTElocVNEc0Zk?=
 =?utf-8?B?Uml1UGo3Z2xaOWJ5cDFmd2tBb1FZZzFVbW85UVZKZEEwWFVGNDh1QUprMHlD?=
 =?utf-8?B?SUZieHlYYnJCMk45dFFjS21rYlJoNEt4UVZhcVZuYWFEbGQ2R1ZxdGVoUG9L?=
 =?utf-8?B?TEpvdTVUUEhyVVZqZ0lHaUY1dXFDMFFxRGIzamVXNEMwN0RGNFVVWWE0alhW?=
 =?utf-8?B?R05kejRtNVlWMEo1V3RTMy9GWG9ueWpodG95Q0I5YUt4TzNXK1JESE5wWGMy?=
 =?utf-8?B?QXhvcHZtbUltNjdZdHU5QkpaSisrUnpRVUtYNUNrMEFLY0lMdzk1R0JUd1lm?=
 =?utf-8?B?ays3bExvaWdkcVMxWGdLT0FkaG1yV2Z2ZnRiVHhEWm5ObjVMMWFNcWpTS2hG?=
 =?utf-8?B?TFE3NENNMGs4c3orUTdVMFVrUkl1M3BFNWdPcDRpbm1aeGpCNTlQNzBRSHF1?=
 =?utf-8?B?andISFltUS9keVFmOVhEV0w0MHc1ZU9pSzNwOFIyMGVKb0Zrd0VTVktRTlFq?=
 =?utf-8?B?WGM2UXJmeUFydEZXOCtreGh4UHQwY1NrZUliM3pYb05QY0N6SExrQ3F4emp6?=
 =?utf-8?B?Z21YV2tYWGlzVkxzYjFlRm5wNW9nem9MNlVvMEtrM1FwUnlGMzFGQ0g0V2pO?=
 =?utf-8?B?dmJEcm1QeHlsMXpOSDMvMUZhVW1paEZXbWt0RW9sMHdDRlZnY09veGZiVG5I?=
 =?utf-8?B?NlNUZy9MYnpxYXVpdEgrYmhZZ0IrSk11UW53YmZwZzBuWTVwQ2hEYUk4NjJu?=
 =?utf-8?B?Um1FZnFRSXZIMzlWUy9ILzIwZm53PT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(82310400026)(35042699022)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	UilLCOciRHmzTAeL4HjcKeTOwwsDKI4ooUQ284dqti6N61JFuGkJnAYGsGDsT3X8leF+jcA2u564Ycp3bDwnPghNWrSGUaw9I3Ih0R9sndN2gH6sLaEFtUK1i6PA3R689fromFHAWIN7M0hzWOSZ72pdsMj13NLYZJhg6+EBLlsCPpaw2e7BNEJTvwjqdQ6CBe7XdUzH0CPQP/rUJCATyXc/QIn91/hwIsTKPWhp9X01DrQdo65d20Ibwl8kUOH1BQbxVdp0Spkn4oxXJp/jSvyeWuH4fJuQHNVoqcPSCHBbJmWNXHOgnr4/cAGut1qDW0Kdd7aB3/ksf3qx0++En8W8b/wlK3jjOLDPrUVzMZ6pWbvCwA0j6Cvlof3uv2kXTry0G+Y9bhk9XDF+Rpmq7PjuEm1cuJaccg+5OMfpomh3KlEDDWtpF3x/a0WAlyZM
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 18:09:13.7927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca5e73f-4bde-4663-8702-08de7306a6ca
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0A.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11744
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 18:09:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231688

T24gMTggRmViIDIwMjYsIGF0IDIwOjM4LCBNYXJrdXMgVm9sayB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8Zl9sX2s9dC1vbmxpbmUuZGVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6
DQo+IA0KPiAnaW5oZXJpdCBwdGVzdCcgYWRkcyBhIHJ1bnRpbWUgZGVwZW5kZW5jeSBvbiAke1BO
fSB0aGF0IGNvbmZsaWN0cyB3aXRoDQo+ICdSQ09ORkxJQ1RTOiR7UE59ID0gImRidXMiJyBpbiB0
aGUgZGJ1cy1icm9rZXIgcmVjaXBlLg0KPiANCj4gVGhpcyBjb21taXQgYXR0ZW1wdHMgdG8gZml4
IGFuIGlzc3VlIHdoZXJlIFZJUlRVQUwtUlVOVElNRV9kYnVzIGlzIHNldCB0bw0KPiAnZGJ1cy1i
cm9rZXInIGFuZCBwdGVzdCBpcyBpbmNsdWRlZCBpbiBESVNUUk9fRkVBVFVSRVMgYnkgaW5zdGFs
bGluZyBwdGVzdA0KPiBvbmx5IHdoZW4gZGJ1cyBpcyB1c2VkIGFzIHRoZSBkYWVtb24uDQoNClNv
IHRoZSBzaXR1YXRpb24gaXMgeW91IGhhdmUgYW4gaW1hZ2UgdGhhdCB1c2VzIGRidXMtYnJva2Vu
IGJ1dCBhcyB0aGF0IGlzIGp1c3QgdGhlIGRhZW1vbiB5b3UgYWxzbyBoYXZlIGxpYmRidXMgKGZy
b20gZGJ1cy5iYiksIGFuZCB0aGVuIHVzaW5nIHRoZSBwdGVzdC1wa2dzIElNQUdFX0ZFQVRVUkUg
eW91IGF1dG9tYXRpY2FsbHkgZ2V0IGRidXMtcHRlc3QgaW5zdGFsbGVkLCB3aGljaCB0aGVuIHRy
aWVzIHRvIHB1bGwgaW4gdGhlIGRidXMgZGFlbW9uLiAgQ29ycmVjdD8NCg0KSXQgZmVlbHMgbGlr
ZSBiZWluZyBhYmxlIHRvIHJ1biB0aGUgZGJ1cyB0ZXN0cyBhZ2FpbnN0IGRidXMtYnJva2VyIHdv
dWxkIGJlIGEgZ29vZCB0aGluZy4gIERvIHlvdSBrbm93IGlmIHRoaXMgaXMgZmVhc2libGU/ICBJ
4oCZbSB3b25kZXJpbmcgaWYgdGhlIGRlcGVuZGVuY3kgb24gYSBkYWVtb24gc2hvdWxkIGJlIHNv
bWUgdmlydHVhbCBuYW1lIHRoYXQgZGJ1cyBhbmQgZGJ1cy1icm9rZW4gcHJvdmlkZS4NCg0KQ2hl
ZXJzLA0KUm9zcw==


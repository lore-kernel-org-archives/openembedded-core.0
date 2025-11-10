Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA03ACCFA13
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 17:54:35 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2855.1762797268242762116
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 09:54:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=MWfrEqTS;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=MWfrEqTS;
 spf=pass (domain: arm.com, ip: 40.107.162.13, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=aSturaluHna8mrmAH/6KoQ8PLhLauZ3vR/MXTeo89DzvsR3WmBLzqoqRuEi+lUOsYCPraqksOJbns+o4rOlnowzLzTE3+QII4ObK1GVZbqzA9IeJ1vgq7i4yBD+yzdWgun6IgPqGkaNoFORTEIWb+upteZODSbRXOyYWcyqjcuxTsa+nQQStnVAcQbW/8s6bdk+gRxSGjRup1Fs0ZhJ2Y5wVSjQ+O7BS6/yR1U/2j7MlAWR298DnMPMC10ITr9ToNXvoNswkQRag5+2rtSlru7CXdi0OgNe2XxgvWcwpAPVIgcwkig/eT2FP0/hkVosGid30m1TrbPSZB8strhnkGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+cUBgvzgxpcsorID1hwrMw9E6GZs5cpa91vDaQpz6j8=;
 b=HQvHjVjGNx5F7XZ3ZA6Xfu26V/NyMUeupvCXHddQeuhDb75rtB4yE+USu5IxEL8vbBMwhSxaCu6QMR3j69XprnnbD1rzGGBoOgHvCArOkeakeORGMEm3au/2Nj96RLWWMZ2GFUQnY3+II7EZBVZ6ONv5cjP1B1+3e0wY9zQsD4NXpS35xUNKOiRG55eGxyjXVbck/t4WwxvAKCzTwL5uHhHmcXfQlaBH+l5MiuSZYbqq82SdTj2wES0q/I6/j+pkzGJPtBIfv5RiNElsTgyNOxgdifniMrqAG68ANN2ex0SWTfGVG79TxKNRySwdy8kZNGS8SXCAWOTVRcAWiiTgoA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+cUBgvzgxpcsorID1hwrMw9E6GZs5cpa91vDaQpz6j8=;
 b=MWfrEqTSABYmTJ1rJXIPnN66krDS4BV6tzi1Fvrhu1S7exmzZbjQ8cKWtPgT//Kg+2u+Sw+m6NyB/PLZca3yc+iVorsQ4vBx1gV+LDsmf9rZ8Pmq0xoa0wOpexJzJRN4ZbJqXy9CjTeodhlBqKAzbZW4Yp92bj+hS3tOnkskBmI=
Received: from AM4PR07CA0020.eurprd07.prod.outlook.com (2603:10a6:205:1::33)
 by DU0PR08MB9488.eurprd08.prod.outlook.com (2603:10a6:10:44f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Mon, 10 Nov
 2025 17:54:22 +0000
Received: from AMS0EPF00000193.eurprd05.prod.outlook.com
 (2603:10a6:205:1:cafe::ff) by AM4PR07CA0020.outlook.office365.com
 (2603:10a6:205:1::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.14 via Frontend Transport; Mon,
 10 Nov 2025 17:54:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000193.mail.protection.outlook.com (10.167.16.212) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.13
 via Frontend Transport; Mon, 10 Nov 2025 17:54:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kK6q58njmuXn3rL+gVRcIKG1kPhswmeoQdCiRB+TdNMz16VREr3UcWlqAp+jnsT+Z2A49a1jrq3mxS0SSESkI6JSYdhS8wJcvF7yziSvZw+ZA+tfF3lp56LExZeVdglCsvMyuuOKlaiI2Uex/20+Cu/l83a0aFOUwnesHwUr5/Pg5mEG0FJFzBphb6fp/paZN1myomkHkGjGjfTkY+kCi9PNeg9VSYbtGyRH+UBnNEw2iOg/SeAW6VU/EwDYBiOYmIpoAhtbUupBQG+0YiuFl3gmNpbFeVvv8uqJkeFT8Wd8fOPZuWFZHzncSknFLFJh3dINY8AAwI1Gfnd9GXx7Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+cUBgvzgxpcsorID1hwrMw9E6GZs5cpa91vDaQpz6j8=;
 b=YbkvXyDwQ/GDB96Ag/icJIHj73CSF+bIdvSJh8Gbuu7sHMZX0D6Wgo6CrMfLwTS7Ol0BnAfxM8xUIjCdngFxyFlYJi+DHXHFGXHCAujP4vfVN+i5Mduka2F7eU0i408WeIAh8KAERtlFnUGghiM8ddeKHWQ+3kqMo0wOlvRCSzk/NVvK7wV3iRgxyoTcWQJLavVKYH2V3JrPtGA1TlF9EQo1NFMZRztzIIztI667Pu7QHnBXdlIRxcKIqDj6EKmex1OyZ0Yotkg+WErlVyBTregLo8eBzp1SW4jKvv7cXMmCzNNqnztwR6PEjuGjM9v4cIl6zn3i/u4e864Zuj+JZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+cUBgvzgxpcsorID1hwrMw9E6GZs5cpa91vDaQpz6j8=;
 b=MWfrEqTSABYmTJ1rJXIPnN66krDS4BV6tzi1Fvrhu1S7exmzZbjQ8cKWtPgT//Kg+2u+Sw+m6NyB/PLZca3yc+iVorsQ4vBx1gV+LDsmf9rZ8Pmq0xoa0wOpexJzJRN4ZbJqXy9CjTeodhlBqKAzbZW4Yp92bj+hS3tOnkskBmI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB5944.eurprd08.prod.outlook.com (2603:10a6:20b:297::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 17:53:49 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 17:53:49 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "liu.ming50@gmail.com" <liu.ming50@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH V2] bash-completion.bbclass: prepend
 bash-completion to PACKAGES
Thread-Topic: [OE-core] [PATCH V2] bash-completion.bbclass: prepend
 bash-completion to PACKAGES
Thread-Index: AQHcUZ8XD/yjFxCfgUeZivrDjdPz5rTsMqWA
Date: Mon, 10 Nov 2025 17:53:49 +0000
Message-ID: <977360A8-E803-4B49-AB67-E5510829EBAB@arm.com>
References: <20251109173407.1320188-1-liu.ming50@gmail.com>
In-Reply-To: <20251109173407.1320188-1-liu.ming50@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB5944:EE_|AMS0EPF00000193:EE_|DU0PR08MB9488:EE_
X-MS-Office365-Filtering-Correlation-Id: a788cd97-a630-4d39-6276-08de20822dc1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?TjZKRXBFTXFINHR6T1VGMWhkQ0JXYkpmS0ZwWGtrSnJSdmVIMlhxaHZMdDBt?=
 =?utf-8?B?R1NROXpUOTNLU3VSWldPS0FLR1dhN3hSL2RsVEFhMlp5Rm9DVS83OGptME42?=
 =?utf-8?B?T1hrUVNNajdtYjJySUphVUQwb3huRTlvUE90ZVN4N05FNDZXdGNsWTVPSkts?=
 =?utf-8?B?QVZYZm1pMDd6SWgzMnJaN3NEYnVSQWNNRDc4NU1QNlVBRGFEeWJScHNRMTVN?=
 =?utf-8?B?dk9xcTRLejc2UHJKTk5vbjBaVFE5Y0E0RzR0dkpHMGNsWE5UTzAwSHU5alg3?=
 =?utf-8?B?Nkk1SGNUUXhMK2grSEk5dDRERU5hK1FDeE1rUmVaMlhBd0E5YVdxNExSNjJh?=
 =?utf-8?B?VXhGTlAxejQweEFwbDJKV0laR0xMR0VGVWxHdXcwbzFiRzRqYmdMR2krMkpE?=
 =?utf-8?B?SG9BZ0FkTjU3cWFnVUE1VFMrVnNWenc1a1BuSERmakRDWnRScmo0Z2ZWdWRa?=
 =?utf-8?B?MjVUZDA1MWhiaUE0dklaZ1dkekp4OHBxNFhvS3lxM3lkODRDYWl4dFNDTFYz?=
 =?utf-8?B?b2s1ZTVsQW96YmpKSkM5MEZYNjk4SnJjdjQ1eUEvb3lxcndmZkJzQjM4ZHNL?=
 =?utf-8?B?T09WaXBFY0plM2JDN0RkajhwTDMxd0dieUFudFJnM1BRdmZHdFg2Qkt6V3Zi?=
 =?utf-8?B?a21lUU1yK0MzQnhIdTVwTVJvU0hLOWtEM25aTWdVT21hRk9Kcy8xb0FLNVVo?=
 =?utf-8?B?eEcvekVXMFhzcGlzckYvMUp2MDJLV29DWlNXOE5ZR0E4MGMvakFsbFplSHlF?=
 =?utf-8?B?UG5kOHo0SWFad3Y1c1Mxa0hiZU5lQjkrenRaRzZzY0RraUw1S3hUN0FnVThp?=
 =?utf-8?B?WkdJa1I4TnZuaS95a3R6YnhmeEVqSTNGU2Z3M0RQUWpEcExKVlB3ZGdUaGc2?=
 =?utf-8?B?YVpvakNuc2tCdGdGWTBIb1JweVJTaXNxYUwrR2pMM2lJcHZKOHc2Zlhjb0tm?=
 =?utf-8?B?SUIwUWh4MnF2TnBZaXVwOWNNaVhPNzBNN0EwNjU2aFIvUnBYY3Y5L04raWp6?=
 =?utf-8?B?Q1EybWRBZWVRblRIZ0tmVnROSEpPRFcwRDJjVmtFTWRiL1JIZnpORTNJWUpX?=
 =?utf-8?B?QkRHSG9QK2QxcE9sdFJiZ2Nqb0xRR2pvRlBBUURDR21uZUV0UjBTVDdEeFNq?=
 =?utf-8?B?WUxFdC9BR3MzejRtNWRTRVp6NFkwUmtOQW5kQ0I5c2NKTS93Mll6cEhaT0x4?=
 =?utf-8?B?NjFzbjM1RnErVmo2Q0RIdDFFS1l2bHpXSDErU2tsb1F5ajcwMWZlZjY1cC9Y?=
 =?utf-8?B?UHFvWDd6Y1VuWlV0OUhuOXVLa3ZFTVA3Um5KTDh1ZlNzTVBiMm9sYzZGK3RH?=
 =?utf-8?B?STZ4Y2M0Z3F2UkFQZVVkb3N3Kysxb21FOWFXdkFNQU1LNFh5TE90UkMveTU3?=
 =?utf-8?B?T24vKzJsc2lWZ09OOHJWRTNwSGhhOExZbVpYS3FwMkdaZnJ6N1BiN2FUbWxi?=
 =?utf-8?B?Vi9rUWhuRFp4WVRzaHlwY3BQRFlpREV1Nk50L0ZsRDYyaUtaUldhRXoyRjlk?=
 =?utf-8?B?SjJBL2dQT0Y5cmYvVi9weHI2NzFkYlF3Q2N3U2x5bHJSN3ZKdU81MnE3amtP?=
 =?utf-8?B?M3E3N29PMnoxNjlpYU9PUDRkVEllZWlYbGw1TnhnTC9NcUpHb1dwdVpIRWJ6?=
 =?utf-8?B?aVczcStibU9PQUNmMUxXazNiVm9QTlpTUTRQN09VRVNiR0Q4cTlxY2J1cjZv?=
 =?utf-8?B?UnZPTDBTWW51aVJVVkZ5emVTK0VoenlKdk8ram9URC9JeDJzODNMYUVpUEFi?=
 =?utf-8?B?M0pCeks0NkphVGZoazJVZVR3Z0JyaFU2ZkwvTnN2SHNTWTRKaW8rdXc1dzI4?=
 =?utf-8?B?R0hHQkVzbE5CL2h3d2VkZlF1cTVGSmpydDF3L1ZkQ01TZFQxUUJKbGRxT1Vl?=
 =?utf-8?B?L3JsVzJ2Y0RVRXFUSWpXL05CSm9tR1dFZnJsMVlXRkU0VkhaK3lza1pkbk5V?=
 =?utf-8?B?NDZiQWVabGFtTHNYK25qa21hMkNzQXF0T2w3d3MxRnlibWFlMEF2VmtXbGhy?=
 =?utf-8?B?UGZreGdGdHBwMWJ6SVR6ZGRwUFlOQ0NGQ2NEaEhDVFc0elhJS2dTYmhNeVJP?=
 =?utf-8?Q?+zW1FB?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <286B37F0621949418E49F1D3CA7DFAD9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5944
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1e8f0d63-31ee-4b5d-93bd-08de20821aa9
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|14060799003|1800799024|36860700013|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U3pmaHlmOFRSaU01YTFaemM0aXA2UXVqZzl2VnE2a3JBL0w2OTZodHNmVDlB?=
 =?utf-8?B?anEveEV6cUJKVTluL256d3pHai9MSDFqYm80YytkVFpzcXBrMWZjTFNIMkNP?=
 =?utf-8?B?RVIwRldHYWZmbHFwaW9IUDRUNjdUT2kvNThUcG14Rk5HYjhpeWRYa0RIU2dx?=
 =?utf-8?B?aUhUNWZxVEc0K0xkbGRIK0VvRFZMVnpCYllxNFJvQURhbi9zYmxCZ3ZrM0F2?=
 =?utf-8?B?YUVpVnYrbWZaWk4xckx1bGEyM1U5eWFJWVdPY0tuY3FhRTdqVG9FT1QzVkp6?=
 =?utf-8?B?azUvRERWUGVXQXMzRGpkZVNPNXNkM0trdktoMm4vTWM5WnZzQmdFaW5hRC93?=
 =?utf-8?B?bDNNR0dFdUp4KzV6cnkxbVh5c1pZRzFQTXpkQ21BRTAzdW5uL2s5T1dkUmgv?=
 =?utf-8?B?VzdLOGF2MWRTNmNXL01zbkhSaXdjRzNxcHVyNUxYTllWUGlqMW9Wb2l2b1RS?=
 =?utf-8?B?VmppNzNpbzhiYkx1amhIbDh0OG5ndGNEbCs5R09sbEJmcG90VmxNcDlndHlm?=
 =?utf-8?B?UlBrQUtpV1Y4NWxxWjRFUnMvL0Y4ODhmYnU3V2VjL3QyaWxjZ0tURWdZVXJt?=
 =?utf-8?B?a0dadGZsTW5iV3YwOEViRytrUU8rREpVaTYxczlFMzJRS2hWdzN4RU1MVlYv?=
 =?utf-8?B?UnJmdisrT3Q4aTd5WDdtY3hYTWNiaDBDdE1FQSt3OFBnRCtIbm80bmExcGJH?=
 =?utf-8?B?ZUE3OVQvaTBCaUt5U1Y3V21PT2pZbmx2UUNTS1J4aFViOFB6RXBMZG43TE9v?=
 =?utf-8?B?OWNBL1BYZXNLcUVJMUNSNlNzYXRGREgydVJTL1YwVEl3M3poYmVzUzZQdWFX?=
 =?utf-8?B?RDJPejhCU1lGUmtCa1k3NEdQaFVvZ0FpZ2pJOVJXdkVacDZ6NzFiV3p0SEZi?=
 =?utf-8?B?VVdOSUxwMzFab0Q3NHpyT1puTFhCbnNvdFNRK3M1cWc2QkoxSjdmN2d2TnZu?=
 =?utf-8?B?eEl3MEhVeUlGSUxJOUNIeHhleU53YjNmV0ZyU0wzcDFzKzhxNmlVUkdzQmlL?=
 =?utf-8?B?cFkyblNyL21POG9KaU9uYWtEM0ZubFRXWFJFOVl4aG05VWpuVjdPSUlMS1Rz?=
 =?utf-8?B?VTFUSjIvSHI1SUpUbE42WDQyZ3RNM2lXVFJQcWt0ZytoUXQ0aTVja2xucng3?=
 =?utf-8?B?WG1YVm5FRjNrZ1JxUlEwenlnSCttZDZ2L1VKVENzcGRRbjRGT1FCdGFTTXB2?=
 =?utf-8?B?bklvUW1MV0xMRXRQeVEvdStscE11UERYRzlHZElQQ0FrUDkvVWpyYVpnSEZY?=
 =?utf-8?B?Z1YwRTFYdk1nOTVaRlZJWDNZeEZBeFJPakg3NEx2dFp3N2kyckpaWFN1QkRE?=
 =?utf-8?B?bWljR0pkVmRWbGNKV2pDLzRGaGt1SW9CMFplNTNrR0F2SE5uMlRuN2FBa1E2?=
 =?utf-8?B?QXYvbjdGWEdzazVmVDh1SWxJU2pjTjAvL2dsNzZjbVBzN0RhSEcxcENPN09J?=
 =?utf-8?B?a25pM2NXdDhvNTFrL3dQeW9KaWF6QktZODZWMlYyN0tzTTd2UkJpSUVEUi80?=
 =?utf-8?B?UG9tdVdZc2RQc3BjWVJDYjdOeHVYZWdudGFvbDhCVGxZNDJBajArUlVaSXlR?=
 =?utf-8?B?SExEM1BSN2hBRmhhTTUyZU5ta01TQUxqSXhJUWJKaUhNeXRpS1lmTkU2RlFI?=
 =?utf-8?B?UUYrb1BQcDZYRFVCS2NldjlTRmdJR0FLVUc5QXVDckR5Zjhya1lnMEVnZ1Nk?=
 =?utf-8?B?akdqWHVzdnY5N1l6TDFjUFIwOEFXVHhjb1ZoMTNINFJYSmpDZ2ZCZmFVZXZG?=
 =?utf-8?B?RCtMcURlcVd0Y3VwZWQyNVpObXpsODl0MWhSM0t6SThLWmVMT2hzV05OVHN0?=
 =?utf-8?B?clFEMi81dGZQclA3Q0RBVFJIRExSUWtURldBUURCbmROdlN3YjlmNUNSbTlh?=
 =?utf-8?B?M014ajUweEVETEk0STdqUXFmQXR6bk5tVVEwbFZCemtnUC8rd3hJR2RmVGhr?=
 =?utf-8?B?cEZwd1ErQkhFcG83SDFzVlNMM2liVTRoMEFDMlRaM3JOT1dicmdFUUpNQzNB?=
 =?utf-8?B?MUZaejJRVytGS3dYUnhIVHJabGtWaHd6b0EyY0dIMlpvOW1KWFdNTG1rMzk3?=
 =?utf-8?B?QUYzS2MxU1Z4TnlpeVVCWnBCS1ppZExmMWFESmZickx6eDBMV0llc25yZGlw?=
 =?utf-8?Q?Kx+s=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(14060799003)(1800799024)(36860700013)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 17:54:21.8275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a788cd97-a630-4d39-6276-08de20822dc1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9488
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 17:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226134

T24gOSBOb3YgMjAyNSwgYXQgMTc6MzQsIE1pbmcgTGl1IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIDxsaXUubWluZzUwPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToN
Cj4gDQo+IEl0IHdhcyBvYnNlcnZlZCB3aGVuIEZJTEVTOiR7UE59IGNvbnRhaW5zICIke3N5c2Nv
bmZkaXJ9IiBvcg0KPiAiJHtkYXRhZGlyfSIsIHRoZSBiYXNoLWNvbXBsZXRpb24gZmlsZXMgd29u
dCBiZSBpbnN0YWxsZWQgdG8NCj4gYmFzaC1jb21wbGV0aW9uIHBhY2thZ2UuDQo+IA0KPiBGaXgg
aXQgYnkgcHJlcGVuZGluZyBiYXNoLWNvbXBsZXRpb24gcGFja2FnZSB0byBQQUNLQUdFUywgdGhp
cw0KPiBlbnN1cmVzIGJhc2gtY29tcGxldGlvbiBwYWNrYWdlIGdldCB0aGUgZmlsZXMgcGFja2Fn
ZWQgYmVmb3JlIFBOLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWluZyBMaXUgPGxpdS5taW5nNTBA
Z21haWwuY29tPg0KPiAtLS0NCj4gbWV0YS9jbGFzc2VzLXJlY2lwZS9iYXNoLWNvbXBsZXRpb24u
YmJjbGFzcyB8IDIgKy0NCj4gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9jbGFzc2VzLXJlY2lwZS9iYXNoLWNvbXBs
ZXRpb24uYmJjbGFzcyBiL21ldGEvY2xhc3Nlcy1yZWNpcGUvYmFzaC1jb21wbGV0aW9uLmJiY2xh
c3MNCj4gaW5kZXggYjY1NmU3NmMwOS4uZTMzN2MyMDQ1ZCAxMDA2NDQNCj4gLS0tIGEvbWV0YS9j
bGFzc2VzLXJlY2lwZS9iYXNoLWNvbXBsZXRpb24uYmJjbGFzcw0KPiArKysgYi9tZXRhL2NsYXNz
ZXMtcmVjaXBlL2Jhc2gtY29tcGxldGlvbi5iYmNsYXNzDQo+IEBAIC02LDcgKzYsNyBAQA0KPiAN
Cj4gREVQRU5EUzphcHBlbmQ6Y2xhc3MtdGFyZ2V0ID0gIiBiYXNoLWNvbXBsZXRpb24iDQo+IA0K
PiAtUEFDS0FHRVMgKz0gIiR7UE59LWJhc2gtY29tcGxldGlvbiINCj4gK1BBQ0tBR0VTOnByZXBl
bmQgPSAiJHtQTn0tYmFzaC1jb21wbGV0aW9uIOKAnA0KDQpQbGVhc2UgdXNlIFBBQ0tBR0VTX0JF
Rk9SRV9QTiBmb3IgdGhpcywgYW5kIGp1c3QgKz0uDQoNClJvc3MNCg0K


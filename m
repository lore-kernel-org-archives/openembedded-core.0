Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E8A7C3ABBE
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 10:41:12 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.54])
 by mx.groups.io with SMTP id smtpd.web11.12297.1746700864595771639
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 03:41:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=a0ul3IZj;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=a0ul3IZj;
 spf=pass (domain: arm.com, ip: 40.107.105.54, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Wg6VbKHRWxGgVJ+QMLhMgyGaHFOV0tOgk7cQ4aoAtKH9OiYaXABkNw5AmmOELmd3RVbdpLz76XUieBnRi/S/FfcibLQNmLFOBxHliqc1YW8ZV62n3T8ZRCcwYH7WqVBpohoxJ+lWbt7iBU6PmlVaRqJEPgJFgVzsfLy8UsAgMfic25WlFeTWx5I44O7IXdcOzbXdB+ZNwkerZ/y+qKL85wrIWWcTYn1kYMOlLyTR0S0wJKRjUQc2SHAcBT1ZvAH05OpDQZT1ur2n2MkyGtrsLF4muGzj0CJMcPqkCgSaFvTgcs8E1Cla1MYZ0cfKcrEDDo7mHAGGlej7IFoLIcn93Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1PfHAghzhbShw9rH4h8uy6MddnNUXznhIghYXxxsGoA=;
 b=GzkSe7I138nawsuTxuYsD+YFhtHkWbgC/R/JEyN0e2Tn4UZsUnb+IkCZ3MbSbegM7JZEuKP4Gck01ke/LeWUgKtJfLgpmU9prhkvMVZBpWDFkPMSlgEHy46O3SRdp/oyx4WkAsYL7II9wJI1ooVdZrE7xgPHZ5eqtEMm2Gm2f/6DTlBawuYKS1/OPtFzfPmvkIMFIMpMZk+6dDny5fvOzNU+ZpTK+EC2QKCr4VYRqN7GNspLJPPVc2czdfGvW7RYduJqlmbhvbReVTHI4ArNhIKAyoeZGcUQgjhCqC0QrndSHTx8ide7ZlEvtUET00p8xQHJZ8auJHIOFoBHADUsGw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1PfHAghzhbShw9rH4h8uy6MddnNUXznhIghYXxxsGoA=;
 b=a0ul3IZj1rYOuXPJgahckez4A1quSbhbZ3fxlOxwPps+YbgFjPw+cywOrPim1MlecYjH8ddv9rcECdM3vKcdZJcPerQAhmy3dWQcO67cekweJrAnMEWs91glL73AIQ4ytOGg8rET/oYHRZakRh4kVEu2ycaEJi5Ddetaw8kHOyY=
Received: from DU2P251CA0028.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::32)
 by VE1PR08MB5855.eurprd08.prod.outlook.com (2603:10a6:800:1a2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Thu, 8 May
 2025 10:40:58 +0000
Received: from DB1PEPF00039233.eurprd03.prod.outlook.com
 (2603:10a6:10:230:cafe::60) by DU2P251CA0028.outlook.office365.com
 (2603:10a6:10:230::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.21 via Frontend Transport; Thu,
 8 May 2025 10:40:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00039233.mail.protection.outlook.com (10.167.8.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Thu, 8 May 2025 10:40:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jAd/BwFUVz8fD8dpiztOiXx0KdI6pY9zSdBGu12wqE9UJTYVjRLQwFpsocsiis1SgfOiSv6KCAox1sKppgjLDc1BQ/17ZfSHMfMqvRCCua17pHxijdcxl2d/pVqLGr4XvDWjo67hW+w46MfNgs0po+ox22+2bHJ4ndbc0xF4morjhpC3k7nVV0oR58BLFKt4jSpFbTWKmaen9mAEdw06HDgMDd46gMx/GIWgHivtJRjd8Xzr+D9xNQkj2jcm9U0Q+6Q+HGgo6iQz4o1R5Xtury2HaEWUY1Bvcb0PJGF4O+cHue5IyAojAW2+Zat+75kHFS+3giPKLkqoa797DeQ7VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1PfHAghzhbShw9rH4h8uy6MddnNUXznhIghYXxxsGoA=;
 b=T3g6AeB2JPkja5pm1xcRqSyszrdga/ADvKDv8SS3b7C0J2VuFRaHf48jIWvxMUWU9xBvzVhode1txAMVhLLb+QBEvB///WV6hbpHHppd03Z+pJfRMCySWppCAEUzsXAtnXUxiLacGEc2sg0FC4wMEQbUkipuaQsn6/QuzygpcVIsVurUJZuaxONQGcWcGgxhusdfDMucAkTc9l/vqam7hZvvSgP2XtFzRkMDLQgbF6qpCDnDgZ/k5eL855KofdPexIH3w6zpDDRLFz4MPy1a9ammLja2n2bXHwfpIFtkt9si4lleWvyfj5B2BCYhBji0tE/oj/4PImUWk3ma9N7NuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1PfHAghzhbShw9rH4h8uy6MddnNUXznhIghYXxxsGoA=;
 b=a0ul3IZj1rYOuXPJgahckez4A1quSbhbZ3fxlOxwPps+YbgFjPw+cywOrPim1MlecYjH8ddv9rcECdM3vKcdZJcPerQAhmy3dWQcO67cekweJrAnMEWs91glL73AIQ4ytOGg8rET/oYHRZakRh4kVEu2ycaEJi5Ddetaw8kHOyY=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by PAXPR08MB6479.eurprd08.prod.outlook.com (2603:10a6:102:157::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Thu, 8 May
 2025 10:40:25 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe%5]) with mapi id 15.20.8722.021; Thu, 8 May 2025
 10:40:25 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "tom.hochstein@oss.nxp.com" <tom.hochstein@oss.nxp.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v7 1/7] meson: Allow user to override setup
 command options
Thread-Topic: [OE-core] [PATCH v7 1/7] meson: Allow user to override setup
 command options
Thread-Index: AQHbr8QFGI4DHZ6+w0GLF5rEzxe5abPIq6KA
Date: Thu, 8 May 2025 10:40:25 +0000
Message-ID: <C418837B-2179-4849-BFCE-B5C2C69C415A@arm.com>
References: <20250417180834.1722588-1-tom.hochstein@oss.nxp.com>
In-Reply-To: <20250417180834.1722588-1-tom.hochstein@oss.nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|PAXPR08MB6479:EE_|DB1PEPF00039233:EE_|VE1PR08MB5855:EE_
X-MS-Office365-Filtering-Correlation-Id: d5f7a1b3-a072-4b80-0130-08dd8e1cd170
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Qk5mOS9Ja3NaVXlNbzNSWVdBUUFja2JGc25EenlRRlhtN1h2cWdEQzF0L3JT?=
 =?utf-8?B?WFk0Y1B1eTNCSEZCYTMxdStRMisvVUpHZU95bWVLc0ttdGlNNHdKMnNsZ1Zt?=
 =?utf-8?B?T3RaYnpyRkNNMldqUmM2OENJTTJXMlVBTG5teHlrK0s3S2ExeDZNRGFqMTFG?=
 =?utf-8?B?b1U2R0tNVjRGS2R0NEcvVmVvaDI2MHl0V0haeWlodFZQdGd6aGkrN0VvYVVq?=
 =?utf-8?B?SDhvbTI5VmhSZFFmaWZmOEEwUmtDaWQ1UUlXTDdvWXBpcjZ4Uk1XcE1tSDVE?=
 =?utf-8?B?YVpHQVhTenlCQitEU1FTOEp4WldVb1JGQWRHOVRaRlE5TkMybml5Z3dRR2dC?=
 =?utf-8?B?ajJHcWFFdFpLOG8zVkhkZzIyMm5paWlLT21jK244QUNMTG9kejJZeGNxbzdX?=
 =?utf-8?B?RXRiZUlwd0E4b2k5UTFxbGFrd05wd3o0WGhPc0NqK2lXL0wycVRNUHRDc2xx?=
 =?utf-8?B?a3lCblFaYURHYlJUeUtoS0ExVHZob0YyMnM1cFdoNUduQXBuWFlYc1hwS1BP?=
 =?utf-8?B?U0FyNVJmZHo1QnZIODZOM3RVLzU2b01EVnh2Vm1UdUd1SVBteDJqRTR5OG9r?=
 =?utf-8?B?UkJCalpTYVB1S0o0OWF2MXNvbmJOMWo4cHc1aFl2VG9rejl2emVhMVNIMlFX?=
 =?utf-8?B?K2g0cGVCQitLd05TbUNTNW54UFpIY3I3VVIwdXJoUnhpNXl4QkhnelNkT1kv?=
 =?utf-8?B?VndkME1pRGY4SGRrWENPaGhEQ3VIQ3g1YXJtRDhrb3AvbzdLUmhldFNteW9Y?=
 =?utf-8?B?dzR4bXBubzlMdFB4S09Gd2Fnc0hMZkJ0N2Jacmk5dFQwV0o0a2NSOC9iQTBE?=
 =?utf-8?B?a3hhRDJabXJDOW1XbzZRUFhUTWQ5SFBWK0NFcjNFOU5VNVF1VStMUWYydzBs?=
 =?utf-8?B?ZW1Sei81NVZiTGRVN0VFa2dmb3hOK2RUN1BLK0dvNWVTSTFzRDUrTDVvZnlX?=
 =?utf-8?B?TzhDMmVyaEtlYXJjOWZ0YUpXQ2J1VjVMd2UrSC9iYkVocFVjdE9oUS9xNHRm?=
 =?utf-8?B?dEJOVi9oa3Raa0J3d1dJYVJOVElkUHkwbmZvZzhGbFVuWGtBeS92ZWtONno1?=
 =?utf-8?B?QTU1c3JaNGFZaGZUYjNzcDM4RFVubnhZN21oSzd3OGEzUmdsem5QV0VrNERS?=
 =?utf-8?B?dHV1a0FvMDYrK2t2M2Y0OCswQVVoTFVkK1JtY3NqdnJkM3MycURaeVFQKzQ3?=
 =?utf-8?B?K2MrQkpHR2wydmFwTFh6RlRteFRXbEtWMjJNUmFPSW9hV29OZ2RkOUx2TGpU?=
 =?utf-8?B?VGxZN0FLcHp1UFVzM0QxMHdyOWJNQnhWS21PbExNV21WTzNMZTZSTnFhRzIy?=
 =?utf-8?B?YW1WSGJSNGZxV1N6WHluVWVrM2NvZ25PT0s0QWpxaC9iNE5qTENkUVRUbkV1?=
 =?utf-8?B?dmNhZngwSEJhd082L2lVMHpza01henNVNTBCYjVUcDZ0NTBGMkhVQVdDRlpu?=
 =?utf-8?B?cUlDZHhhUG5hdEgvWlQ4K3RneWRBN2FXVUZPYy9sQ1ZnU1ZxQW9XQjZ1eFRn?=
 =?utf-8?B?R3N1ZEJTSUtGZElPeTR5VEEzUVZiNTZhL0lGYWtFS21JcjhycXRnMlNtU2VX?=
 =?utf-8?B?YmtnTCtBYU0zM3I1YzBFZmIreWc3cFBQOVBha1pHbC8zdW9kREFWY2tpMVJq?=
 =?utf-8?B?NlBaQnlsYTNZdjExK3Fjb1pCaENTczhXenY2a05GanNTcnFPemJ4Wkllb3dp?=
 =?utf-8?B?SGlGS1RYY3BUVmtkL0EzNVhtWllaWVFEQnFiVmZ2cDZ4SVphQkU5M0FwMkhM?=
 =?utf-8?B?TUFvZmJ6ZEwxV1VZRTBlMEdqVUY4bkJOdkxYbFJ4SFJreS9abHUyd0FUcTg2?=
 =?utf-8?B?YTBCMi96dWZOODR6TnlmT29Ya3N1NFlZQTV3bTRIdmo5dnFvdmQwZ2lPT0tw?=
 =?utf-8?B?cTEwTjRSemg2b3Q0V0tXQTRsWnBQR0UwbzlpQm9oNFFaamYvSmVZSEROaWpR?=
 =?utf-8?B?ekFtRklJWkJjeGY0ampIcWVKNC9UY3BxSlphMVVGMVFuNEF5dFVpTXB4aEgx?=
 =?utf-8?Q?BqettA2o2WmBRW6NT6QdTKmGVqF1ZQ=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7ACA4002E132554DB99FAF0FC4DCDC80@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6479
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ba94e2cb-b03d-418f-bb75-08dd8e1cbe29
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|35042699022|1800799024|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RjBqMDMyei9nNWYvbFBlVFBjaVllT2gxcytHbGxvU3JUVlpiaklKcHNmV1Fm?=
 =?utf-8?B?M2RVbkhHU3psUjdDcTNUTUR5T20wTFp5ZlMyMzVKU1ZFUkx2TVF6OEpPM0lY?=
 =?utf-8?B?Z0RjdFFHdGVMMTBoOGFTQ0FBVVJXL0xTeEpjRGpnOWlPYjFpZUJtaVlHSHJj?=
 =?utf-8?B?aURjTkEyRU93ZWlkdUhhVllLeUhQY3RvQWNOUXQ1NUg4a05iNWQweDY2M244?=
 =?utf-8?B?UG4veE1iMGp0dHM1NXJFZ04yeWVXU2ZjTjN6YS80cXlWbFB1Ykp0c0huSnZi?=
 =?utf-8?B?TlA0Tnd6bkw4c1BublhpYzNHUmhSN05zaXBFanBGWE83QWYrd3o3RjRacnFM?=
 =?utf-8?B?Y1JEaGMrM3N2cmlvZ3hlVmQ2MUdHcnUwTVVFSzFpWm52eXJJcnhzY25wTjht?=
 =?utf-8?B?YjZobnBMY2s4L20yLytLVkFSQlI2UVR0bU1RNmxxU1FjQTNRRzZGYXJMOTg2?=
 =?utf-8?B?UWo0cUt1R2dYWmlUQy9aVXRkQSsrenNaRVdVdWFnYUFPc1gvU1VCRk0xUjFN?=
 =?utf-8?B?UWxjZy84VVhyR21lZnNWdC9DNXEyRUFTRm5JdkwwUXlwTHFrZ0pwNk82a2JZ?=
 =?utf-8?B?Z0NUUXdRMlczNWNidU5EVXVYWjhvc05CUjRuRGhIYjFwOHNFWnNIaDcxanVK?=
 =?utf-8?B?dEEvcDRwSThqSEo5M1pJK0diNnBhVVdNckY5OWN3VXFiSFRWMWQvZWNySnJo?=
 =?utf-8?B?bnJ6TWxOaVVsTkhqTGpjVng5a1FMRUt0U0xUdjlDYmhTd01WT2lPMkp6N0w2?=
 =?utf-8?B?RmVoSDh4QWhzM3VnSWhqOUhyUUVKZVp6dHZkRFI3WDNmby8vblVPWHJMWENj?=
 =?utf-8?B?NUE1b3JnVXUwT2x4YnNkODIyVS8xcDlUUGhBdGpxVUplcDBFd201M3VBOTZa?=
 =?utf-8?B?NTVrTmgrZkVyZFRpSHEzZkVpYnhJeUlUODhzNjRIQ2Q4TXN1c1AzMU9VRE1s?=
 =?utf-8?B?ZkFBb1BReTRJcW1XZ1FZcTNXWHJKelRwUzZiZU9hSVh1dnd4SUpPNmNkT2Uy?=
 =?utf-8?B?YmNiWXR6NU45SjI2Wkd3S3R4R2toVm4yeXlyY2pwSzFCeEpaNFFOSVNJM0dV?=
 =?utf-8?B?bHJUbkh3VTFPUm9sQkJIOUlSRjJFcXdCN3k4T2FNYm9mYWFYaDFLam1SR084?=
 =?utf-8?B?VWQ0QkxxZkd2SXpBV0ZOdWx3VUxYZVVrYlJrK2JTKzhMaUZOaXdiaXVDOW9m?=
 =?utf-8?B?eU5FQ3MzNlZtMkJ6ZXdISTUvTXNFMjNQTXV3TEoxaHJHbVErdk9WcXJISXBx?=
 =?utf-8?B?clpzSGJjTDJ3OTBodjREakFYdjdMMjBObFZlZm1aTlpQSzBBYzNIWlh2cTdq?=
 =?utf-8?B?SGtGT1FaMWlSN3hnd0pzMU5ZdUhBOUVQMUJ3MTZLZ20wMkt4VElKWlZoYkZL?=
 =?utf-8?B?ZWJYd0JCYkhrUnlERWFGendCTGJnOXZvUlhTWFBPbzFaZVJrUEZlWHN0Z2V2?=
 =?utf-8?B?YmhNZkdUbHNYck54OHBWZ2Rod2QvUXN1NVlHYzZqc0pMczZ5OHFKTCtjSE44?=
 =?utf-8?B?Y0w5VlJqUURBUkliUWdINVRCQ1VQM2hpUHhubVhTdFRZaTQ3dVZqY0dJbWdj?=
 =?utf-8?B?SnUrQ2MvckoxZGFGa0pZRGNQTHNKazhERDBoRi9QTDUvWUtwVVgrTVcxdFB5?=
 =?utf-8?B?ZzhHbXpnR21GU0dseXh4QWpqS2grd1RCamVGWXRiQlFQSjhOK0FyVVZSSjNw?=
 =?utf-8?B?dDFpZVR0aXVDVVYvcjl0dEsxNzlOUTFzaWZhNzY5Q2hhR0g3eFRvWkRoUUhC?=
 =?utf-8?B?Z2pHckNkVlh4MW94RjVTY2Rkd2JQM0x6Q2lUWFp3TlRZVUZUNUg2L01lcjBH?=
 =?utf-8?B?SzhOS25SSWFjdC9YU2poVnFleGwvdE1RZ2RYOEtoVitIQ2RXZzYrSDFudlhu?=
 =?utf-8?B?cXA3aEI4TER6S1VSWHZ4cUpYRnJNdS9yS0ZBSWgxY0VlOWFNNDB0MjlkRkxw?=
 =?utf-8?B?eUtMMlRFVmFFWitFVXJaa3J3djFNV2JrU1I0ZTBFeG8yc1JPcGV3aGtCQ1h4?=
 =?utf-8?B?SjNKNVZTZlBheEF1bHpmb29LSndqMytqb3ZXRkFFMUVxU3NSRHAyT0VaL0xj?=
 =?utf-8?Q?oBdCaa?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(35042699022)(1800799024)(82310400026)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 10:40:57.9893
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f7a1b3-a072-4b80-0130-08dd8e1cd170
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5855
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 10:41:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216149

SGkgVG9tLA0KDQpPbiAxNyBBcHIgMjAyNSwgYXQgMTk6MDgsIFRvbSBIb2Noc3RlaW4gdmlhIGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcgPHRvbS5ob2Noc3RlaW49b3NzLm54cC5jb21AbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiBUaGUgdXNlciBjYW5ub3Qgb3ZlcnJpZGUgdGhl
IHNldHVwIGNvbW1hbmQgb3B0aW9ucyAtLWNyb3NzLWZpbGUgYW5kDQo+IC0tbmF0aXZlLWZpbGUg
YmVjYXVzZSB0aGUgbWVzb24td3JhcHBlciBwbGFjZXMgdGhlc2Ugb3B0aW9ucyBvbiB0aGUNCj4g
Y29tbWFuZCBsaW5lIGFmdGVyIHRoZSB1c2VyIG9wdGlvbnMuIFRoaXMgcHJvYmxlbSB3YXMgbm90
aWNlZCB3aGVuDQo+IHRyeWluZyB0byBidWlsZCB3aXRoIGFuIFNESyB1c2luZyBhIGN1c3RvbSBj
cm9zcy1maWxlLg0KDQpTbyBJ4oCZdmUgYmVlbiB0cnlpbmcgdG8gdGVzdCB0aGlzIHNlcmllcyBp
biBlU0RLcyBhbmQgaGF2ZSBkaXNjb3ZlcmVkIHRoYXQgc29tZSBidWdzIG1lYW50IG91ciBlU0RL
IGNvdmVyYWdlIGlzIGJhc2ljYWxseSB6ZXJvLiAgSSBmaXhlZCB0aG9zZSBhbmQgbm93IGhhdmUg
dGhlIGludGVyZXN0aW5nIHNpdHVhdGlvbiB0aGF0Og0KLSBmdWxseSBwb3B1bGF0ZWQgZVNES3Mg
ZmFpbCB0byBpbnN0YWxsDQotIG1pbmltYWwgZVNES3MgaW5zdGFsbCwgYnV0IG1lc29uIGRvZXNu
4oCZdCBpbnN0YWxsIGEgY3Jvc3MtZmlsZQ0KDQpEaWQgeW91IG1hbmFnZSB0byB0ZXN0IHRoaXMg
c2VyaWVzIGluc2lkZSBhbiBlU0RLLCBvciBqdXN0IGEgdHJhZGl0aW9uYWwgU0RLPw0KDQpUaGFu
a3MsDQpSb3Nz


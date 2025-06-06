Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D30E8C5B559
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 10:38:09 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.22])
 by mx.groups.io with SMTP id smtpd.web11.30613.1749206285047976643
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 03:38:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=pVzo2P+n;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=pVzo2P+n;
 spf=pass (domain: arm.com, ip: 52.101.69.22, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=uvRU/hnvk5urhbwNHgQBfqlpraL5kQI6F+ewWrXOKTadxpf4IyUNaOexvxtBFEZIhYT6PzeFJMZNCXlf3u3tu3bpqSLTt/bwc9SZD8D09X62olBvAgLHGhIH49IUQ31jC5T1iM8EVtt8xMnvOrTx5L1s/Zm4uebk85vSzORXzaKn7V9rP6+XVz8q4S/JWUXoGkhSx3DwEkXttQydiPuA1bVY0QzQFwEdA3ye77+PfkTG0hDA4EQXDnV2wUBZrzxiaGAC+UHKosfmVpkLANy6O1l+CqLMmcpO/9iakWwIfzR1RCKEg8vPQYExrf6Fv1cE6KDVM93NpLP+m5GagdczkQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PIpHqdyPNp7T+gjxv3tepSkRymBm8QynFgJZ3/WSkoY=;
 b=bdaoMcLch0mmVe2NYiirrHuXKZj5hf9ciqc0AtezHI6eNl4XqdoZhJzJtpTsRTDOQWQdte4L0CtWfiW+OjdFnnUNrBS+AaADe4rmUqlPg5B7qkBQo2sh2IlbN8dht6WlLIolTBr4r1d9nMTff4+uUc+H+Ree/Qu+2B1/SQjpO01oOq8TJcKXSlsJMWok/q1ZSl2munz0wCwsgEsWZx5s7nkYmR7f3H8zC7Men2GLzwoufVanr2ymK+YpfK8ygsojHsIyexBvb+/7x5INQYdN3Yw1nAgN8WmC4mzvTDw7kbIapzIfWQzJsgnFhD5MK2Cn3YDdTYk0pYULxF08Ds+JDQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=cherry.de smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIpHqdyPNp7T+gjxv3tepSkRymBm8QynFgJZ3/WSkoY=;
 b=pVzo2P+n5WULwDXPoQJ3VPGMOvWW3TO1ivzxW8B1dKIL6DrrkTiQeurMKL7gaCTPU4pcXajky7gT0+0bXdJzrDcycsbDE6HoPQC4h2gWJwuUOFge4xo5A/k0vMHVcTc3nZZQVkHq8Ykxu8G20Lc2EGb4jpOdUr2BUJtFt+Pvb24=
Received: from DU2PR04CA0301.eurprd04.prod.outlook.com (2603:10a6:10:2b5::6)
 by GV1PR08MB10534.eurprd08.prod.outlook.com (2603:10a6:150:160::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Fri, 6 Jun
 2025 10:37:58 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:10:2b5:cafe::d8) by DU2PR04CA0301.outlook.office365.com
 (2603:10a6:10:2b5::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.19 via Frontend Transport; Fri,
 6 Jun 2025 10:37:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Fri, 6 Jun 2025 10:37:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5gxsvU6lP9vMNXXy6nZzC3yp10UxLoZbpsAmWtFZ5wwR6RHUynowBMs8tDFlb/qstOevIkOLxICwdLAtd+zjNneokjaJcgVhIF4zF+hwzZXBP2dsui9jd8xuPO3lz4ubGs5TjlcvG8gposorFioraxCCoFwj+jBCoxCeUBL+0eWs4f8FumOswyvck7ZwS492iyVzElhjrvFLt9GlSEFX8gCc1xY9/J7sK0eNk2vFAiNHeoRTpByL6+S98Jlv7guXI044xftdSPrpgEC6+X5snIYrWPD70RJbA2etK1b4GU/j7skA3a2b2ZA9xugaYVgYtWrwlpR8jaGlEfUC61AVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PIpHqdyPNp7T+gjxv3tepSkRymBm8QynFgJZ3/WSkoY=;
 b=GYTyX6W6nvXCbJd7IyY7FGfuQ90oBu4SF9neniEVlsD5rtp03RtGaMb2oISUuaVqJ5EMIvI7VzCnIcvmNBH/UTDAgWnsNNYigdyKGxgbN33ydGzkM2WTukPNnSc2KXdxs0h4AdQ3RRMmaHN0WZksUudgx9C+ZVPo2oIYzHHSmlMkK1damVlaJfzeZejAaTiMuu0cHuL1qgxM59P+ZyIS3TQeXLaXjn0ICT9kRDpj44j2h5ekC1ejjRqfYaPKtc1bsdoU+95KX/0fY236XFbBkmywKKVrM7kLxXkraMUroOaLDqnUX+q4qMlCyns5W0Oi6fu6lot5DBZE+blpwqicBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIpHqdyPNp7T+gjxv3tepSkRymBm8QynFgJZ3/WSkoY=;
 b=pVzo2P+n5WULwDXPoQJ3VPGMOvWW3TO1ivzxW8B1dKIL6DrrkTiQeurMKL7gaCTPU4pcXajky7gT0+0bXdJzrDcycsbDE6HoPQC4h2gWJwuUOFge4xo5A/k0vMHVcTc3nZZQVkHq8Ykxu8G20Lc2EGb4jpOdUr2BUJtFt+Pvb24=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by PA4PR08MB6255.eurprd08.prod.outlook.com (2603:10a6:102:f1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Fri, 6 Jun
 2025 10:37:22 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::8db5:7772:a426:2afe%5]) with mapi id 15.20.8813.018; Fri, 6 Jun 2025
 10:37:22 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Quentin Schulz <quentin.schulz@cherry.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] u-boot: move arm64 disabling fragments to
 versioned recipe
Thread-Topic: [OE-core] [PATCH] u-boot: move arm64 disabling fragments to
 versioned recipe
Thread-Index: AQHb1jPUAt4tfssObkivuIiMjOe6SLP1z2aAgAAiHgA=
Date: Fri, 6 Jun 2025 10:37:22 +0000
Message-ID: <A46D5071-80B2-4343-9D94-F0972F3D8777@arm.com>
References: <20250605160624.1029863-1-ross.burton@arm.com>
 <3f05d487-57d1-4afb-a080-06f77b5bc3ad@cherry.de>
In-Reply-To: <3f05d487-57d1-4afb-a080-06f77b5bc3ad@cherry.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|PA4PR08MB6255:EE_|DB1PEPF000509FC:EE_|GV1PR08MB10534:EE_
X-MS-Office365-Filtering-Correlation-Id: a256a651-c81e-4b0c-8e09-08dda4e632be
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Zm14aS9ER3p3cWFoNHBGZjRzTjM1V3IzTzRqR1FkS08wYmZKTWQ0VVJvV2dD?=
 =?utf-8?B?eDRqRnFRejVnb2xYSDRJb1VWVE41K2djMXkzSUdacFhCbjlBUldOaUZ1NFEr?=
 =?utf-8?B?dDYwS1BDWG9Bc3Avc1dmZ1N6RThxbkR2VEJTZFdTcndDTS9TSFd6bjFibjl4?=
 =?utf-8?B?c1diWGpMbElNNXRhRElVOHRVVHRsVXhUdm1OdTlBd0pQdTFacHFvZXcrNDhV?=
 =?utf-8?B?NXJaQWZuTC9QU1RuS1JvSXpzUmFza05xTXNsMzFjSkw4ejNoL3MxVzhQYlVL?=
 =?utf-8?B?MU9CeldCKzh1QUZwN0pvVzlmYngwMFR3SC9PVDltWm16eVBLeTRqaG0yQlpM?=
 =?utf-8?B?WkVXMHM0dngzb0VHVlRvNHBubnhDbVFsQkJNQjFxMkhnUHdWbnZRa1ZEUG0y?=
 =?utf-8?B?SVZoSitkTVl4ampmbE5oWXhaWndjd2llTmNtNnd1dkxKOEtJcm9SRGJQTjZZ?=
 =?utf-8?B?M0hNRy81ZHFrS0RiT1dDZGJyM0hrZE1qVmdoNi9KN0k4RTFqYjYybk9lcCtK?=
 =?utf-8?B?YTA2ZCtPMktzcllOQTRvOGM1YjNBU2w4YUVLTWNhQ0REbkROaWdFeGM4T2RX?=
 =?utf-8?B?cGQxcmRXbll1R3Mza1F0aTRSU1pNY1lvZy8yOGdueHhXVVVIYVh6ajV3VlFn?=
 =?utf-8?B?bVoxVHhzeXB4cVN1STdyaHZuakc3MHFIbkdmSVJOSXJ4c3FJZUpuRlhFRko3?=
 =?utf-8?B?M0t2eDlCL2FDUE9ZQWR6bm9VTjBLeUMrcHl1U0dzZ0xIQ3FBZytqOUpNL2ZC?=
 =?utf-8?B?eGEyYVI5ZE9wYUVMcXpvMmUwRHZ1OU1XWmUrbWVsL1hLTXNlSVVjaGVIR2M4?=
 =?utf-8?B?QjV4VklYcS9VcmtnbElWR1JvZ0RiRWNCMjJjZUY2VjdVUG9xV2R3a05WN0tB?=
 =?utf-8?B?MEpZWCsxWVBaZUg0eWVrWnM4d2hrQThXUHoyeTdpY0plTEdTUnk5cE13Z095?=
 =?utf-8?B?M2lNNEwvdlgvV0RZVlNOOExkMTJUQUhHc2hpb3pWRlZpTTBqTnlJTnVEQ2Nk?=
 =?utf-8?B?SDdiMTVFOEVIQ0N0bVNJbkYzUDRzQldmc0sxUlFTRWFIQWFlVWdUTzF4d015?=
 =?utf-8?B?WkFwQXYzQitsNjJaeCtRTE5hQm1vMGREazFnZlBYV294Rkc0ODI0VCtSbUdP?=
 =?utf-8?B?cE11NVR2czZ0SjZmTDhWdE0rRUtwOFYwa28rU1VnR1VNcXlNS2RZN0c2QjNk?=
 =?utf-8?B?SFBRamFVdEdyT0NBbHhDdjNYSWgvMjByNmM2blJKSENUWnV2YXE2T1ZmeTEw?=
 =?utf-8?B?SFRFV3huZTIvYWNyaytTUWJDRmJVbVZmNXU4UjNNNElLTVRQYnJFWE42QnA0?=
 =?utf-8?B?VXQ1SXB5VWdLZ2p4T3cvVlBQTDVWcHhqcTlUTmtNZFB6YkhmSHQyMG5KbkNq?=
 =?utf-8?B?TVVVQXZ3K3IzK2dhMkF5ZHZRNlgzNHpEWHFqaC9ua1lnaEhQb08zVDJhQ1lC?=
 =?utf-8?B?YnU5ZTRkVitTQlhpS2ZmRWcyNGM4Y055dmJwOVU5dkxJRm14Ylg3TTVpMWpX?=
 =?utf-8?B?TzhUUHpsNFppTkxYYVJqakhqaVJJTlRBUHBrdlYrYzF4Z2RpY1ZiNFhwcEZE?=
 =?utf-8?B?S2gwRTdqVzIwK3pHYlFid0lwQkRtSG5NNFcrNjB2UHdvVE44TThLWVltVUQ5?=
 =?utf-8?B?UEtRNDN6TW9COXQ3ZmI3dHd1bFIzZ1VzRXBVNHVVMWNyQ0VaTUVBTTB6UEFs?=
 =?utf-8?B?QU9uRXc0MjFod3E4Qm54RkdnTjJNNjc2MXVHR0Njdm45b0NjdlRnaGlWWnNh?=
 =?utf-8?B?aFNyMjgvN1p5Tk9aZTBFaUlBREVWb0xpeFJEOE40MGdmRFF3SVlZS1M2M09l?=
 =?utf-8?B?TGFXUW1CQ3EvSTgzNlBxRHA2TXFKN3dheWpKSER2UFJrVjZnSGpjbjd1SWFq?=
 =?utf-8?B?cDl4eFNlR1BtSFZBL0dTVjFlMTdYeDRHTHJjUk4wVmlqMUlueUo1dGh6Uk9T?=
 =?utf-8?B?c1h3K1RUR3lScUhvRjBwVXVFbldWY2psamw1TVEwaDNDOFpsdHcwM0JNM3Jy?=
 =?utf-8?B?M2piTmRjYWRnPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C91C18865EC8D449AD55096B00CCD593@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6255
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e9b356fc-77ac-43f3-960a-08dda4e61f0e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|14060799003|36860700013|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MGhrVHhoQkwydXlnWEFYZnJMd1B3N3NLbTd5dEY4TUhJZUdDWHp0UGgvRkh0?=
 =?utf-8?B?QktoR2JtMEFLWFAwdFJuTWt6L0R1RngzR0RNbFR1WkZBYUZrYlZVc0g5a0Ft?=
 =?utf-8?B?UUpwMVl3QjVZd1VkMG50N1ptTWV0OHF2dkdLRWZCVDdzUk1WeG5aeW9VZUFK?=
 =?utf-8?B?dmE1T1l3eXl5ZjlSYWVYZlUyWWMva29ZdlJkZ2JuaTc4enc0RTRBdXlpeWV2?=
 =?utf-8?B?aTk1TGFhdnQ3QSt5a2ZpQXVwUjl1VHAxMlBqTUpjSUtGVGRvbGVSbUhGem1C?=
 =?utf-8?B?QXlyaGxSbXM1VEJ5L25MRGxvdXFRVG9VQVRHQnd4Qmh6YWFpVERKdGw4NnlM?=
 =?utf-8?B?cmpzRkVLRE8ydzRHMCswR1dOZmNLcUR3STRpVGR1ajIwOWRoUWgwZ0I5UndP?=
 =?utf-8?B?djZtVkxhKzRiNU8xWXFvV3NBTEgyMHo4eXBFVzhIMm9BMTZZNERRaWgwNGpS?=
 =?utf-8?B?RURnOFBWd1BJZE9IWmM0bmF0SHpUQXNyN0Q0eTBCQXNPSGdrTEpJbHJsdVlP?=
 =?utf-8?B?U014ZTZ3WkZvNkFsYW0rSElVdUpGK2tHek9ubkFoTE92R3Y4YmpqdHVVdGlF?=
 =?utf-8?B?RjltYXR5eUE5WEhnKzltMFFoRWVadnI0b3NJYXdKSmF4cDRWa1dMQTZqS2Q2?=
 =?utf-8?B?eC8vTzBiblhmQ2x6KzZPTmtmWmxxOG5ZYTl0eGJYb3A0REk4a24rdzZkcWR6?=
 =?utf-8?B?d1BMcWNuWDFKbXl4Z0F5TGFYZDRDSS9RSFNNNnJldnlVaCtBMytiZk1GQVJj?=
 =?utf-8?B?WmpxV2lYWGVHUUp1OXJzVHFzaVoxN1FlM1FpZEpZOGc0Z0hGaUxTdkZBMDZP?=
 =?utf-8?B?dDFYUjkxaE9uOS9vZ1JZYWNtRmEwRVRHcnpzU21hR1lObUlrR3RSU3FLODEy?=
 =?utf-8?B?cStpMWpHOUQxWHljSzlzYzFKZTd0T2Z5QXZXY1dTOXRrcE5KOW04YUc3bmR3?=
 =?utf-8?B?S0w1ZVNUREFnK0IrcXl1NElFVGRRb0lkS1R4bk5qSEtKVk1oYUNMWnNTZS9P?=
 =?utf-8?B?b1YxT0ZKQzZNUmJ5bDQzd25jcm5WZUV6WWZZWHpiWEhEV29SUjlsTElQZkV3?=
 =?utf-8?B?cXFIaVZYSHpoT0I0a29sRDgwczN6MWkwQ01xTFBmVGFOczU0OEsxMENTakNZ?=
 =?utf-8?B?QkdpcFN2U1pPdHdKeUJGeWVIdUpxMGlpM1hHSCsrTzFicU9tSGFacnVSU0xC?=
 =?utf-8?B?b3B6VFVPR3NHZGppL3Zya0JpVEV3ODcwVy9vWGE2NXVOcXpJcGZ0UHcySHF2?=
 =?utf-8?B?T2JmSnF4MXgxYm1idUliaDdpTk9Ya1BHZnplU3ZmTGV2K3g0Rng4QmkwRFJl?=
 =?utf-8?B?MFFEZ3pETE9yUXh4NGMwQU9XWitKUGhQaDFtcDZwamxDS3k3TXZsYm9XTnN0?=
 =?utf-8?B?NEdCNWl5eTVxWUhRcEpxam1oSWt1ZCtzUTN4d0xpOWdTVUovOVkyQzNLNzhX?=
 =?utf-8?B?d3JjL3ZzMGlyVlNyMTdkVnJ0R2hBeXV3TTI4ZGVJSk5kdkVKVzlxR2RRS2Y2?=
 =?utf-8?B?ZDNhRExQYUZXNzg2SXZTTnIvWklPN2NOcERwY0JIUnlvOGJydjVWS2hpQUhj?=
 =?utf-8?B?T3picDVZTy9WSVVrcjRwcGw2M2hYRUk2NDIyZ3hHT0M3MnlLaWFYS3BuSk9R?=
 =?utf-8?B?MTRBWHF1RW5iTUl0VVgrWlpDTW1SU2lZZ3dISExsWGRnUVQ3UFZ5MURDY25z?=
 =?utf-8?B?M28xQ0hVV1p6NlAza1IzUWs2ZlU1TTQxbHBLM3h5Vjd6dW1hTFhBaGc3aUJY?=
 =?utf-8?B?WkZ1dGYzVEdlblU3OXM4QUNMU0pReGtzYWQ3aVFtMG14RDNvTDl4S3ZKWlRi?=
 =?utf-8?B?eVRaSDdiL0dHL25KQlBJNnErOG8wUFJkaTlCRVBxbTJnMnBTN3lCbmxRWlhz?=
 =?utf-8?B?RmZiQ2Q4ZWRNNzBXR1cyWFJmN0RxbllLVHRDV1NqN2puMnlHbjZxMnBOTStW?=
 =?utf-8?B?eEZHREFWWGxlaUpvYlg4M1FqWFJTVnNESkJTcXRXVGowWCtGNkZzVEpPUmlx?=
 =?utf-8?B?eFE4YTNFaHNmenhsZUpua2NLcWQrYmpzZWlwbjBvbnJ1bzN1WWM3OUdHMGRE?=
 =?utf-8?Q?EXoWnZ?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(14060799003)(36860700013)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 10:37:55.6808
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a256a651-c81e-4b0c-8e09-08dda4e632be
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10534
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 10:38:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218129

T24gNiBKdW4gMjAyNSwgYXQgMDk6MzUsIFF1ZW50aW4gU2NodWx6IDxxdWVudGluLnNjaHVsekBj
aGVycnkuZGU+IHdyb3RlOg0KPiANCj4gVGhlIHUtYm9vdC10b29scyByZWNpcGUgYWxzbyBpbmNs
dWRlcyB0aGUgdS1ib290LWNvbW1vbi5pbmMgc28gd2Ugd291bGQgYmUgbG9zaW5nIHRoZSBwYXRj
aGVzIGluIHRoYXQgcmVjaXBlLiBJIHdvdWxkIGFzc3VtZSBDT05GSUdfQkxPQkxJU1QgYW5kIENP
TkZJR19VU0IgaW4gdGhlIGRlZmNvbmZpZyBmcmFnbWVudCB3b3VsZG4ndCBtYXR0ZXIgZm9yIHRv
b2xzLCBidXQgbWF5YmUuLi4/IFdoYXQgYWJvdXQgYWRkaW5nIGl0IHRvIHUtYm9vdC10b29sc18y
MDI1LjA0LmJiIHNvIHdlIGRvbid0IGhhdmUgdG8gd29ycnkgYWJvdXQgdGhhdCA6KSA/DQoNCk15
IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCB0aGV54oCZcmUgdW5yZWxhdGVkIHRvIHRoZSB0b29scywg
d2hpY2ggaXMgd2h5IEkgb25seSBjaGFuZ2VkIHRoZSBhY3R1YWwgZmlybXdhcmUuDQoNClJvc3M=


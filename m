Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8131DCCFA04
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 14:43:18 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.65])
 by mx.groups.io with SMTP id smtpd.web11.17107.1761921797828674340
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Oct 2025 07:43:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=FRoNBmeh;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=FRoNBmeh;
 spf=pass (domain: arm.com, ip: 40.107.130.65, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZrfDnMQlS3i1MN1nSHPxhnQcl6dDa/gpdse+6cNe60wLHfCpvG2CWEBEJIdFKMxpAQ+qnUCB8RQppl8/PaBXjWfj0seUsOmGcbRxg2BpmA2xaCq/VF0L9ARP8lrr3u0NJIzinhHq9xw3VTXjZZymVYglNZRCU72/+hex1o8EE0KAHyAR66t17TAPo10fEAdxruKzoB7ZZIx3j5RRp3sp0868SreavkrSNEut1IVO3UosemveOYfnCAXBIy2OajYUwBGAtmxZkA2frQ2PQjt2cGP5LxzVJjmijUsL1rWw7cUfNWuvtAHUzhKNWF5vzRlEEmFCLrvhod8dDQm+GiiesA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ss3RCH5H4Upxch/sJfkcymy6Q1cBU7zOEY3fV47Hes=;
 b=PjE5UcNZ/LlmwciucHwmzMUz6eYNclWGpU5Lyq2nAI3F5LswznvRT1iYFKWmPiwn3mREOOV84WxI1aArN6aYPvK2E5S0y7J55hH7aSUi0vDJ6XiKECoinQrdtMLuSpXxTHgqaE3Dc/3KM96XMmyCNT6CfocXGappNrDJg52bEjMNAs7n0xgPvOSnghYyRmI/21USEjjNyQGpD0NuiXl99xhgMyBWt8ttwNDYoVR0Id4q3MFHc80N+3OexCZV2aBEYOX2kQ3aZcfTwk5IwY/1Ju++GPs78McZPvKpeGh/ySWIlzvqWFeAMrQtALRbBdGH8pcpk8kTux3SMe5jHu5pMw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=siemens.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ss3RCH5H4Upxch/sJfkcymy6Q1cBU7zOEY3fV47Hes=;
 b=FRoNBmehNt7V/JX7A9jtWP0p5LQVO9u0PmjSiBHRrO4engW5eOiVnyrXGwL0cp5UJJkYMMRHlAHpdu0V5DRRET2a6CIB09Rhf6KefU525r4u60TychE9Kig5/ugl2rnqJwZgOhHjOC31y/kyMaub6XePjDoaVcOTNWB0UgLCJiA=
Received: from DU7P251CA0019.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::10)
 by PAWPR08MB9889.eurprd08.prod.outlook.com (2603:10a6:102:330::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Fri, 31 Oct
 2025 14:43:14 +0000
Received: from DB1PEPF000509E7.eurprd03.prod.outlook.com
 (2603:10a6:10:551:cafe::5a) by DU7P251CA0019.outlook.office365.com
 (2603:10a6:10:551::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.15 via Frontend Transport; Fri,
 31 Oct 2025 14:43:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E7.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Fri, 31 Oct 2025 14:43:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O/l827arm5ktz3m7+1CntYUjKKSvvuZzE4QVcrNJNaLSA+bbwyqabOoIAD15tWHCBubQNr/pk6q6oq1lbeHsnhSnJPpnSuPI4be3P6GjFpGjpSnXpy0n7YNDV6p2sMB6/4nHkaRjwYyqrItkN49E4kigTdo6FRvNsq5PuScAhRMsAJ7Jhc8FizwvoFjDj4+4nM5VBtMI2zGvlctUKRo5q/imzsKH7nQTzRK0QttrDiLcITWZyn4SGx1PngVR/xzGseC5vsfZSoGTpPvu0R2x31ij+ePgpddVP2n4WjVVhX0m1XVTXE1LVCY1cxOUPZGxmwgBrfHBzutCtBAuGpWrxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ss3RCH5H4Upxch/sJfkcymy6Q1cBU7zOEY3fV47Hes=;
 b=nFtS1Qk7HyrGwCZioujd5dQMtoh9/01s+SSyPsoXja3h8CbDvzbdmaW29vc8TsdC6G5q7vvf/DSH2AV9NFfClco5CcWntVzHwhRlrjij3wPHd7BFEBS/ri71ZJ7NevShZmQnPfIxxbz/Pp8nFEo7qtl5UmqFLWTan1omy2LF65nJIujuO5n2Lcrbk8tp9kdlW+19TiY+svJoO/oHoPDKai0srZmx1VKHPoNXo5XR0mdMJK/Q3cWGCZpMDEjEz2Ziw/GqMSkHEi8n8rPPkiVUF/+Br9C6MWP0x1Xl0DnQp3LyHGo6MkY3nWQ6C2Yxvsf5JsZv8qk/EoiXd9+z4joCYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ss3RCH5H4Upxch/sJfkcymy6Q1cBU7zOEY3fV47Hes=;
 b=FRoNBmehNt7V/JX7A9jtWP0p5LQVO9u0PmjSiBHRrO4engW5eOiVnyrXGwL0cp5UJJkYMMRHlAHpdu0V5DRRET2a6CIB09Rhf6KefU525r4u60TychE9Kig5/ugl2rnqJwZgOhHjOC31y/kyMaub6XePjDoaVcOTNWB0UgLCJiA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB7676.eurprd08.prod.outlook.com (2603:10a6:10:37f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 14:42:41 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9253.017; Fri, 31 Oct 2025
 14:42:41 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.tatrai.ext@siemens.com" <peter.tatrai.ext@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/3] rust: add missing zlib and zstd
 dependencies
Thread-Topic: [OE-core] [PATCH 1/3] rust: add missing zlib and zstd
 dependencies
Thread-Index: AQHcRyyktqJrkDgBPE231zNKalFqeLTcWtOA
Date: Fri, 31 Oct 2025 14:42:41 +0000
Message-ID: <6BBAB12C-61DC-428B-9C3B-422EC35F114E@arm.com>
References: <20251027102900.65173-1-peter.tatrai.ext@siemens.com>
 <20251027102900.65173-2-peter.tatrai.ext@siemens.com>
In-Reply-To: <20251027102900.65173-2-peter.tatrai.ext@siemens.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB7676:EE_|DB1PEPF000509E7:EE_|PAWPR08MB9889:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d43f30b-65fa-4a0b-a78f-08de188bd229
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?NQ6KIp1IY5+yW+MKuHACvXuwpgWu5zb8tNq14Bj1ea2DDk0LTRyoo+dW/Gif?=
 =?us-ascii?Q?z9evgI3LVpF3JjaAdVo2qQ8Z6DWTsyAWjVDKQ2KFwFCzAuMhZcSaUA5rOja0?=
 =?us-ascii?Q?xwNFJAw/qHfw+3GKgwjxNBsTMhomziEhp/QOI4mYFwNHJc5zlnUIicv1UgVG?=
 =?us-ascii?Q?tlq8LnpN7gCG7NnTsTlsGgjhYFOKRf1EeVHFO5aN2zxB2vwUIY/ptKDuiPtB?=
 =?us-ascii?Q?+CeUwvi/l5+Z4ABPm7IrjTvMqGKPRDBFxlnVDjCO5d/mKP23Rg9gIs5xSzwR?=
 =?us-ascii?Q?2I5IQ5/++4FP70MdC7oML1fe5ALDOrKzswyCoVa9exdqFLFCuIWpVsKHpmt9?=
 =?us-ascii?Q?9yXNIjwqeyNNLVyEa2V3lqjgh71WQpP0hoV8TjQJOBZ136MqxGbqo22Rrh0K?=
 =?us-ascii?Q?63omzUenySusMDs3DhaPYFA/gQ6l8rhJ8SQ5NWZZLUS3ErqCuZwu2bkGcn9w?=
 =?us-ascii?Q?TW85xhc/ayZsC5K93QL1/1tAFQz8SZY5pVtlP3q6bk75y+cpSOSDBiByf3Zv?=
 =?us-ascii?Q?wEktUsk4jRuZ5Un5Drahs0MFXrnACF/yxdIvhuXfSgxufbEEzdyz+az8nd/x?=
 =?us-ascii?Q?PX0g0W91jjy3Z1s94yYZenel+J+KV/MhIjjMPzxDmNfpg4/oqNQXRNMLT6ga?=
 =?us-ascii?Q?71wNOc07Cu45+6SUVotWQj9U+xD0SlR0qvJSeZ5o/s2yBSTKwz4MPw9DJref?=
 =?us-ascii?Q?J3MA0WeBMqO4uv0kSLXakk3zmm7G6r9lCMHVofy/aQabby3gbx2bgd0tyJz4?=
 =?us-ascii?Q?g5AmoCRq9LrBXtH+QEL78JIOfXYp+GUkScoP5WhorCEPTT4qfjUEThXcdHEy?=
 =?us-ascii?Q?TiFE0cWRLLi5moBzpUdAOAi8GRsS8w5x8p6T9P2mjsMmx7oZm/ed5QmYbwV1?=
 =?us-ascii?Q?6edHRYgWC6vBktlX4rhzsOpGS18gX7vDx/CEGZR0ao8bGsuKOq8Gz43dFROx?=
 =?us-ascii?Q?Tw965xbmAhNcrTL6G2JsxUzd9XLwCrnfmd1MO3f1MdZJlPSWZ0VBe8Ymyqgy?=
 =?us-ascii?Q?a4Npnr3pfDH88+bQXKU9CdlPKB2TrOdY9eAAePJqX/b0FCRL0BEmpEa30Dq2?=
 =?us-ascii?Q?eKO0dkHqxaCNoR/agf+meks9Xpy2XJUEb15xomSyxQMkfKzpjVTHoLiDaq/o?=
 =?us-ascii?Q?ONDcmA08akGXusPIiQtI+4g7QdMaVm2cY+MW56NC93esjSBePqLgBJrjw8Om?=
 =?us-ascii?Q?n+T15CjcVuJlUDqdf/TP2e/yk+Pj+aSztfWodX27wrKFQXj35dU7gsC/r9j0?=
 =?us-ascii?Q?CjdjLJTAJQFj/JaWXUz1D/hOCRBVKsFImnV58KUMWJneYdQBpgmNfAxEdZlq?=
 =?us-ascii?Q?vSZalhzeiEQoN3gjGaErhW8vQRevu3Gf+sY+EZc+P/tVBki+k9T5Wx7Fog63?=
 =?us-ascii?Q?U0vvu2vJoG8INcbOmHzTw8hrlcBX82PuWvIF0KTfleUlSnPD/e05tVIP+HUV?=
 =?us-ascii?Q?eAWVn6+VbpPEUgZ3xfk/mH/HUbSrMbkrab6KpjvXQwowfWfroYb4xbodwDaX?=
 =?us-ascii?Q?wVCuipsIseANNvXgGLzOQBoCYorF4KjeENCC?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D72CE8905198F34C9353A73F8B0885A7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7676
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509E7.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	842618aa-1156-4b6f-a804-08de188bbeda
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|14060799003|376014|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lOyBbVjEUZZWGL+lPTvzZejFrRTSLr5fnkP8sAHI2PIRvGgCKTpuLo9F9yIw?=
 =?us-ascii?Q?F4kpFjVU6lGY/rkFvMYdDSbzYnazcrqDAMHp2hZYMN2gSyo0eXk7n6E88q/F?=
 =?us-ascii?Q?S/F5z8jvGrQFD8c3SekIdY+lWy0DY1hkul58Vub0HPsk1FNtXgWoi7sl6br8?=
 =?us-ascii?Q?xiZkrVHmH8mAn+Xmy8DrQMqINeQWXbx1XKgYfpoXtuM5pxZ8jP5Sjc8QaJTq?=
 =?us-ascii?Q?AWgTaWtFAaXPyHnlev2cvrQ3H4kUFis4D6F1ZAAwaHJBfaCrgwIawgmBBSOJ?=
 =?us-ascii?Q?a8RvTN2XfVz/eJ/unqiGnVMk/2x4TLhdx3xUWTG6DoiBHUtbPmzO6C1rSW85?=
 =?us-ascii?Q?yc/Ec4ZVf8XkxvcC4wmyZJOQaG9BpAl6kx8MhPEElUZEi6mQCoLdnXY65/TO?=
 =?us-ascii?Q?FIUDpOencXn7gugoGgfHbDZ4zeQqJxeGm38vchpMjd3uNaqN0DGeE1o0huYO?=
 =?us-ascii?Q?CZKNPDo+o2g+lu7gQhOEUOs5QUgFqEsPst+XFp+SCxNUDeuyubdomxCqb8AD?=
 =?us-ascii?Q?Y22QoxxeWMssle4YjhTbs0GSD8rE48eYgVv5TvTqwDF00nSL80hxmGYwsXP8?=
 =?us-ascii?Q?b0vxDaS/7IT/f/C31XqILALn9fJe1jeUCb1LCe1XVXUaZPzoeve/OTSUNz7q?=
 =?us-ascii?Q?KiWLYEtbVXCU6qf7+/4HRXh39JpVOVw3uzdq+DRVZrzzILK91LdToLz/iC9g?=
 =?us-ascii?Q?nmpBDJ/mhkMbWRU7O7JqcDIYTbiYYmE2Uhb53buBxjlMYpe83wERzNMfOdt4?=
 =?us-ascii?Q?BGylJ5MeH7j6TVpu2XYV6eLLZ3zkYg0xHPyU2xlNMzKI1Y2/KqwDqwhvXzVB?=
 =?us-ascii?Q?w8xnX0VQjG8c733/m7GUbX39ls47+b1B/9Cml5HPDkaDD8EfnRsHNCZo5dwa?=
 =?us-ascii?Q?2Bzxq++Vr71koXEFWRLoY2zzYWW1jNQagX3PJ8Bw5WMy/RfojCJ+TkiPauGJ?=
 =?us-ascii?Q?pfv14LIGqes43kpPXrFaVHeURjSAjSKvJ6uM1Vnm0K0xBo+VOZfGt6f32B2u?=
 =?us-ascii?Q?BgTIlNwk1oqk0Lnvo/MMuYuNKqR9KddAL4cKodlYzCj1jm+R9++fcpcLLJ4v?=
 =?us-ascii?Q?CBTEqbmp6oB6Mnpf0iOD5FXLhiXUap7Iix8KlLaX/1i7NKwokNXf05QDxXdk?=
 =?us-ascii?Q?+5b9pLlCksCv8NKUV8/BJYK92mrJqiEK2Pi81EhzkZTPdAE0RZJ5Am7StFLB?=
 =?us-ascii?Q?+py85YprfvCh6TelwJ8W+ePAC5nLLxf9Ol6ZvfFk/JvwyudPfiWAf6/IqXXb?=
 =?us-ascii?Q?yuhdRKA0nOYlj3tBhAnwtKt4ymDjaAttwEORG5Ucv1OfKZ1x1Teovrg6njIg?=
 =?us-ascii?Q?n+ehAGNUA5SEpQnNYtkYTB5F4m5J94LZhe3OfXWVBvIi4/ZWnTCHt9AnY+1h?=
 =?us-ascii?Q?sTRv9nJ0Lbq45ZAcHPg3tQWArDr7DkDgZHxJ7lyHavA1sK+2+KVXSr2vOmeI?=
 =?us-ascii?Q?nNwjbD3RCBu/fS6GdB/5Er4lB55JyL1TP+iQX4W+ac72rkncBEQMDCdqEJJO?=
 =?us-ascii?Q?ZQ+ZXlJya1T2uRNG/xVswCK6+4Npf81ymCtrfX7n/abCIVO775SSy6OzUtON?=
 =?us-ascii?Q?i04Mz1dyKndj174+YTY=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(14060799003)(376014)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 14:43:13.8183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d43f30b-65fa-4a0b-a78f-08de188bd229
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E7.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9889
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 14:43:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225542

On 27 Oct 2025, at 10:28, Tatrai, Peter via lists.openembedded.org <peter.t=
atrai.ext=3Dsiemens.com@lists.openembedded.org> wrote:
>=20
> Rust's internal LLVM requires zlib and zstd compression libraries when
> building rustc_codegen_llvm and other compiler components.
> Without these dependencies, building Rust for PowerPC target fails
> with linker errors:

Is this still the case after we dropped rust-llvm and now use the same llvm=
 as clang?

Notably, the patch to switch from rust-llvm to llvm included this:

-    export RUSTFLAGS=3D"${RUST_DEBUG_REMAP}"
+    export RUSTFLAGS=3D"${RUST_DEBUG_REMAP} -Clink-arg=3D-lz -Clink-arg=3D=
-lzstd"

Ross=


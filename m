Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA62E83F05
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 14:07:31 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21444.1770300441789532330
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Feb 2026 06:07:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=maGN2PO6;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=maGN2PO6;
 spf=pass (domain: arm.com, ip: 52.101.72.39, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=YA3VN2S8v2p1lsyf6SDXdmZnykNA2GA2IvLxESeTjywX80ub3ePaXmhM9Gx5whB3tUNGoVw/oOs+3dn6YBYNHe8eoLM2hF73c+InI24CHkAezvc3xBbEFFhxu6tBOdUCyCR2v5q8/1uk0hxfo/yhR9hMQs4j/8xS5m6vc9Qdzp73BaNFYpYyzQmNpxi3Rolg0tXsTQ3mWQcTtOGQPfJi7mda1HplF5Xp10W4Pm/PjyhU0nwSf1vMTe85tz3eLKmiWzdOtYIUOgkPekOYs6vRIII4dwfpIL4xponEsburEXYAw6pD+tTo6dOMzN0kcQIZ08p1lc0qqW2IgJm0sRcw4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XDdIqV+aIva94z+085biYni5bcMqMWCnSSQJ5K4VPkE=;
 b=AdA8UXVOIzRZ1YwFTbXPLvPaV3GrlgWxZVxpB8l5E8IPQFQadlVj4cRqPvNHy2Olj618IzT6y2oTAySTCgaLwuHuuNPYeEB0lRXiZgoAwy4oTNQodRTxdJWTzMvUL4IDij3xSp0LPpgPLSXwhyXBWbc60M3vSkUsgDCoBC820nQnomJZyepoTuDpaGfTwIeyhBFv3E0iF58dopolsWBjo3465GkKJDF3ZKUrAbHRnwL1QN7otnwC/E5zxyCN0ltwFn3uGW0r9cQPYcYrYieY82GfLaA4LcDhgu6R7Qu+/VKCuNHBVxJXo3LO9+jQRNg5tWBYPMN/ypI2hl82PuPDdg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=fujitsu.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDdIqV+aIva94z+085biYni5bcMqMWCnSSQJ5K4VPkE=;
 b=maGN2PO6ucCjWDqR0z8eOfjOyc2p/sfYgEqykH+BGEXsP7cWtPqi/6UvZIHthrbU875hEONLF/16RNYANZrKWx5ZkJHXG95P3p8FU0+BHRwMyPEm/e0HLcJ8w5sfUHSRg5WyIX4DrAuvDR25tnZ5S4ydMg0d1TPNR233U8pJ7UM=
Received: from AM6P191CA0079.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::20)
 by DB9PR08MB9826.eurprd08.prod.outlook.com (2603:10a6:10:45d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Thu, 5 Feb
 2026 14:07:10 +0000
Received: from AM2PEPF0001C70F.eurprd05.prod.outlook.com
 (2603:10a6:209:8a:cafe::b7) by AM6P191CA0079.outlook.office365.com
 (2603:10a6:209:8a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.13 via Frontend Transport; Thu,
 5 Feb 2026 14:07:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C70F.mail.protection.outlook.com (10.167.16.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Thu, 5 Feb 2026 14:07:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p1E831aI/b7F1jjZzlQZqY93swDknxMgXg79f9RrDvlSUkR7bt6qnxdDLwJ+2Giqwt1BpUIVVZx66FrnedH2457tNL8xSY038BHHA/dakhhrWqqtC/zhCOwSk7WR0X9eUrHuUJHWE37UKWZyWh9/EdGY+nAMVQLjA2D6d5woI+lRiCAh9PuOoagxie5utZRl2H1b1zbyZINvuKGEOhwBFn8KEH58CyYc/jHqio1GJ9DfMQ/84ZaqYaQOMg/FT20L/2inKl/jVV8B1NczWgra5s7tWZRtWufjloqSAV4W0HXxkIDuaDObkwx2WVaX57+Kk1k6tVWVyRu5Mn76I13dHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XDdIqV+aIva94z+085biYni5bcMqMWCnSSQJ5K4VPkE=;
 b=vAybw3YhhNLi5/J00qBlmvjV6N7XZUnlWkJ8WpRKi4gN5YYuvS9PmZgQ4y2vmxQ92lmiy8G+BrIIRf31N+Key/P5NJEEFkxieLLk4eQg6uoHZWQBni1rS+8vxjmtKn9IhTqRDjb1RNd/MZb31Esn1iiUxcWMbnSFpYemmwMIYu3gN4UFWJfVCDViF6I+Inxesenh2yOCSe13C+jycgLBi11Ej/ILIPT1luVsQoMULcneJe5lwNjXfAiYQwjhJ0a3js+ApTP2NcWr9yWBESyvebtMZqydEASltr3JwiORQ2Nf+wwHH8ezLuRGj6OB9A5D2tTJrwoY/r82ZHFajtMt0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDdIqV+aIva94z+085biYni5bcMqMWCnSSQJ5K4VPkE=;
 b=maGN2PO6ucCjWDqR0z8eOfjOyc2p/sfYgEqykH+BGEXsP7cWtPqi/6UvZIHthrbU875hEONLF/16RNYANZrKWx5ZkJHXG95P3p8FU0+BHRwMyPEm/e0HLcJ8w5sfUHSRg5WyIX4DrAuvDR25tnZ5S4ydMg0d1TPNR233U8pJ7UM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB3PR08MB8940.eurprd08.prod.outlook.com (2603:10a6:10:431::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Thu, 5 Feb
 2026 14:06:07 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9587.013; Thu, 5 Feb 2026
 14:06:07 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "liuyd.fnst@fujitsu.com" <liuyd.fnst@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH 6/6] orc: Enable hotdoc to produce doc
Thread-Topic: [OE-core][PATCH 6/6] orc: Enable hotdoc to produce doc
Thread-Index: AQHckNMWcz7MdsGdikukWKVx4Q1YbLV0L3KA
Date: Thu, 5 Feb 2026 14:06:07 +0000
Message-ID: <0348A260-53CF-412B-9714-53D26703C504@arm.com>
References: <20260129035353.8982-1-liuyd.fnst@fujitsu.com>
 <20260129035353.8982-7-liuyd.fnst@fujitsu.com>
In-Reply-To: <20260129035353.8982-7-liuyd.fnst@fujitsu.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB3PR08MB8940:EE_|AM2PEPF0001C70F:EE_|DB9PR08MB9826:EE_
X-MS-Office365-Filtering-Correlation-Id: ec2d1170-ec92-42e1-50b6-08de64bfda72
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?4saQhNLaf+e+exEZxfN2ZQLvsIVAH9NitWjhBKBmpDiU7/TBvKu+RdWh0XyI?=
 =?us-ascii?Q?q5VP5bdNavyucklNjt7sHJCo/P0sXbxVB0ha4gSiqfMPOJWEKprIxl1lVZH4?=
 =?us-ascii?Q?foVaqjoz/uduF7BGTGuVwdBtZ9s4/n/N/q0mKXfM8g0LuH0iOGvQu/CQ2qm5?=
 =?us-ascii?Q?cPyVbKSTn77WEKW+/iPQYsGvxy9RBwHernWiUXEmhWapAIyeAZ4t39YdBxFr?=
 =?us-ascii?Q?8IONGenQI7sgHn9svG5IEnAy+dHL1eemcRy6eq4vjXAwmtGsYDCJu0fVHHjN?=
 =?us-ascii?Q?Tbknsi2QnIKYJRm5fDDK9gkWqYosbMcTnka4LoXnjuywczWQ8Fn8Ew/IpPna?=
 =?us-ascii?Q?Soq12p7eyOwsga92S+48+W92UTR53ooP2G0O2N04G0rSVT/9Kp2FJR8OvVNx?=
 =?us-ascii?Q?gkLlN6di0mX7VxW+gLSt4pjb6RmseiwlMGltyNi7iiA2qboqSaY7Ej9ZwEr5?=
 =?us-ascii?Q?sdVDQY1H938Z1QS8EoOyTdFfo9H5VKxiuij3541jtOnWBbTZddZjX5hMdHv6?=
 =?us-ascii?Q?ej7BP8Lwyo5bqTW/AxWcKlbxwApKL9dUsoHUhRvyxjikGZKriQzM24hL0wpq?=
 =?us-ascii?Q?Nw/aMlGnIJtwHx6Lbxp8e4ubo8sb6ndzG3lirRBdFy9cTh0RNv4yiu6pDKiq?=
 =?us-ascii?Q?e/GG+eqk7yi6qB+WXb4DcUa4FW5G4Rim7nJYWaaewT+j5dVVNc6tPFSlHBuy?=
 =?us-ascii?Q?WFGkTV3zPtJYPZN37LpJbaNoFaHag6vPoyfqy5/YALkYgZ7Nz1tWEcXrfkHW?=
 =?us-ascii?Q?uslzVhGJWZnjtGtsOEmk/4jUDBGKQ6HrolNx7zTM0kEMxyfD8MR07j1T6jgf?=
 =?us-ascii?Q?dfNqCjAr6bb1a+fJ6GPlT0C3vy6N7icbefmaICSQWLWhbzdA80flC6+Gw+Fq?=
 =?us-ascii?Q?36+v92QcGxrCJD6ti9mGI1t0+Oi0fO5Cr0ua7pzWTzc4VZK9w4DY2wfBgS/U?=
 =?us-ascii?Q?g1LrIbRnCpORO6pN/covgI749q1lJEUnMWqG+egoO2baabSf6yCWemHsQXhW?=
 =?us-ascii?Q?wqDmReYjZx6exN8twVDoPK1wwajhpFqDWSnXUImQ0dB4OfQN4B5mCfTJi8SJ?=
 =?us-ascii?Q?XUglGQzYpOgMW2DTa3h9k6OZpO6jlBRv57O+8xv8/l9GASfTG02gteNZhIbX?=
 =?us-ascii?Q?HjU5bitjfINmw4jo7xR3lwJ3PIwAa9ui6Nlr97PmMIWJO5bmCalprT/HkbWN?=
 =?us-ascii?Q?P5nqg/uEY0YSerbfuGm4RohzpWFzy/FbudL6tOEZlAXseLIckunI/oC/kdCL?=
 =?us-ascii?Q?HwsRVLtxeywLExPE9XfZb5PuvNKTcJwi2ZRTgODpAkKalziekrzU2/45/xPN?=
 =?us-ascii?Q?hxg/d6FfRbu5+8AZzIyKh4/4P7GCcPKpSCsbmu+WsSwXBau9EHPzfB3CUEQu?=
 =?us-ascii?Q?2QK/Ea0+2FUbVRuVxUVTtNrJ6vIWddPdVR0Uabha9c/kfaXjRUjL3hZtt7SU?=
 =?us-ascii?Q?8jO8ntFTvEQ5aXlaRi/lzIfXyqp9aZkZDf2BTuntW/g/hc/MjxbbFTz0Md2x?=
 =?us-ascii?Q?vb/rSwKYOjwfbnkG723VjLL+r4ocixDAYeo3rD7xew5A6Z9j3EixnVUASm0s?=
 =?us-ascii?Q?hLUeRnzr2E/IAml3GoZYm6AoAhZ2rcSXFBFFS6KcxwzYh3mAQJH62vSw1Zsw?=
 =?us-ascii?Q?/lj2MYJ5mVNGD3BwrrGMeDo=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C6BE8AC8C10916469865EDA36A397C04@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB8940
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C70F.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7c070716-7fbc-43ac-86bf-08de64bfb524
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|14060799003|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?G0GZd84osptfhHUFvgAqQRpjJRh2NvAAfRMvbo3RaA2f3jn+BwPctCNvUbjQ?=
 =?us-ascii?Q?3p+iE0+/XYQQylAy9U3NXcNW4h/FIV+3U7yixAP9hCWyYG67QXNxUCV2HyJW?=
 =?us-ascii?Q?Jd7MXegSFU317aoKdla/dhPV9CFSaMZeyEqs3HwvPxCRNDfY6l2BhAa/PGy9?=
 =?us-ascii?Q?yS7mwMuRKjq9VueNiDc4eP/nMjPxU8R50WYh8hg8u34fzo4/druMa7KXWZ8Y?=
 =?us-ascii?Q?VCwIMPOlvLqxC6Y/jcthP6BBcQxHlHqt69QsUULwIbf1EzWAMHwuDxSH2DUT?=
 =?us-ascii?Q?UOOOEgfLTwDmRDaAgE83nPM7c8dqba226QqrosplJ9Ftgb/hiPrOZS+F3ArX?=
 =?us-ascii?Q?FTcuSRmIyJlPrjJnEcVNnbOk48+5JKNvX73ivMPFbPcKCFfxD3+b1+s4PPUp?=
 =?us-ascii?Q?I9ZsBsb3SdNeW4lCoCsGOZS9vJxGhWVOfXbZK8XwtPlt8OR6Y92PPJCAxg2R?=
 =?us-ascii?Q?oC/gP9Xm2N7Fsx0eXHE1Fei/bmJbnTRhVtC9Bt9uHu/9SHVUPIgBd9dbkhZG?=
 =?us-ascii?Q?UT4nOphWZ9eBhDNuwTQ4Nc7HMSTp/EDRuYBJFR65I5/uAhwdgpw+YYH6i+vQ?=
 =?us-ascii?Q?qZGXMldsrd6PyxCYd24mHuo5X8txpMl2nnRwHQBTAxY4msq1Ofi0s1tO1avT?=
 =?us-ascii?Q?9E/Bvv36E4ISOotNBnMo43eiOiUHowvELDBY31PhZhBGGm/I03Xffw5kbl6D?=
 =?us-ascii?Q?8g9hFNgGjxP15ADw2bhrYttIfl4s203RkcV1Q8boLWnSHFyBf3NK0Hnqef66?=
 =?us-ascii?Q?ALCL4T9B8pp9hzAsDC1w+yrhCKWiaW+cbhOpRQvxZXM2EIvH7+KPS/WDadq0?=
 =?us-ascii?Q?7HAdDNA9l1bMrFw4QS4S+f6ntY1gSYa9EPdE+ddHIqnXqCJBQMpx5YwWWekh?=
 =?us-ascii?Q?HColXV7/zTh79araOFbQiYj/G8pDabXYhOOBC29W0WFdYm84dsA3KqBI18ld?=
 =?us-ascii?Q?j7ouHTdglC7n7Toe1LeRFh+3o8hdUMOVcHDiUwQ8tQqk2co3qHzDi8v47/CX?=
 =?us-ascii?Q?gucROVUs6acTm63pPkD1DdO90AMpQNGHBdyywy9eNMGGGaC6Kzt5ONN6R3Nx?=
 =?us-ascii?Q?TrWMlSzKyM/9I4BIMSR0PWkyDcAQH+oGtmUHG2TBvSvB3I4VCcf/8MFWqnwJ?=
 =?us-ascii?Q?7A4kBFdFbcqbLCmPhYrIQtk/8NZPbf60tIZulNRJx3bmIbRvVHLvH+AfGR8z?=
 =?us-ascii?Q?PQYRzMAgbVa0zhxwydsyWO+FcuZA13JuyGcAssexPypzNyFAgbO0Xh0RzYEO?=
 =?us-ascii?Q?Wsv88XkgM2l4kT3uiXSbbWu8DRQ4XSmv2Vt/e9OTFXASRe4mAttPIu1bXpaF?=
 =?us-ascii?Q?X/o5IMNFbcdA5WLIr9LxkIrY7tdpfQJlEgj6JfqOEF7u5RmWtrtboWOpnD11?=
 =?us-ascii?Q?zwsUG7p54pwdYCVIU2d5yhrsqtI8rFgnpUK9CjNNqile+suxnoSquT+ZPvCQ?=
 =?us-ascii?Q?GQ0izW4+2pksDz4Necuekna/OLW/tK0yulTuKkh7z4zWppNsWLV1XIBd+vJc?=
 =?us-ascii?Q?5c//DvUNueS/ntHDadh6uf/8qg1SitbNW1zhUtoQbIr21yla9VjwbDuOt0oa?=
 =?us-ascii?Q?X2XoHysfI1pzRmuStunhj07+Lp8RsgHv215r/BozPpJE9I9LkXrkrH1a0hZY?=
 =?us-ascii?Q?yohLFfg5+F2iCESIfGucmtv2XkX9prw/qxKJDvVKHKguPfTQb0zjGlYsn4TB?=
 =?us-ascii?Q?Gazexg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(14060799003)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	G9v0Q3GfgbaLAxHO2B2TWvH5d83942j3AFGrMKs3QnqgLkteOmKxjBBRYItiQG6I0T7orhAkgL+0ovTXFR7TSOCNJ4vS5PYRHdSkq7oaGV42VGgw+YRkdDsJT7uefI8e7/eCvoMjpurPhAg4Jakq7IClMgHFkJFZFeaJQxTRrAySyXyVfbnV++MQKLP5QtJ/37+4khOpxDzdSbmsYtX3Vf3E//cvrR3AI5wQJ2K5Q4TDgsBE88k+uWTEY7g7TouCDTSZBtgG6QoKQw1EtyVrcLUOshzRs1IOrJ0lalC/WD5rC1BTLYw9QNjps/w60Kwcu+zEujmQn+ufEZ5gPovoEsN+GX5pdbARi/6DdFVX9y/S0wj56u3v0suRPnAEhNjzOXdlM1KsmOTWs8Wjdpc8gdFRHCr2OXqaphaqEzKCi/A9tfTi6eDe+d8WtgFwXUBo
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 14:07:09.9236
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec2d1170-ec92-42e1-50b6-08de64bfda72
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9826
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Feb 2026 14:07:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230579

On 29 Jan 2026, at 03:53, Yiding Liu (Fujitsu) via lists.openembedded.org <=
liuyd.fnst=3Dfujitsu.com@lists.openembedded.org> wrote:
> +DEPENDS =3D "hotdoc-native"

We have an api-documentation DISTRO_FEATURE, please respect that.

Ross



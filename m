Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD64CD43357
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 11:55:44 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.88])
 by mx.groups.io with SMTP id smtpd.web10.10996.1731066938904163652
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Nov 2024 03:55:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=eKoewgd7;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=eKoewgd7;
 spf=pass (domain: arm.com, ip: 40.107.21.88, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=FkqqCYTQMGRPV0HMHYxcAScZlebC+BjxoEUfwgQToShD7EcRdUXDvE3525gGxE12AXYGxrfSLDpvBmZr9ZeIcxKPn9/KHlxdsDS3bTpuvf6zIMLwi6vjDeB7mqUUu37Tgl6ubeC+5xRFWTspNBb0ZdSGOlCJq5PqBREzF8A5BVkrlR9poSajXg3DWU9yIy2QvJj6dMboKCPCw/+dHx8L4rIJiL1R/WL7NN/0PkAy0KizersfLo/dlVYFcBu0kQ3OsUTcfoU+1ZrrNM53F5B7ZTyQd+SorSyJJqsjsyppOng6ywY+NMaTSfItzAH3XqEuVCkCk72Nup832A5xLEbpJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZW73QYM/1ZHiwr1IKTybKAaszifze4vsuywhBqYxXE=;
 b=oX4m13guiVaIN8xiQT7EFF7rBnqSKkLLYzhEST2Ts9czaEt+d5eAGK338Kgk+cDlBgpwO9KBazNIQZOz6Kmdoxw2FJTlYmaHUSXVWt+scKiGZQZnuJK11zm2HGu7QJ/iPgPyr22TppcR2Sna07VF44cz689MbU0Qs1lAZz711tp2tuH4Jky6xyGdt/eZusyuAuDg5UhlorUS+EkntzibkD5YhiMccM4Umtev6w6h7WVYPwA1k6Zm1kluCRCWf6DVJTLWarGMN3mmxW1T2uIfrvZ/Klf7jPtOMQL/p10BTvFpZvUdPObyx+iAzEmRyBnxEq3Ny2HrdK9AqGZ2d70/3g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=bestguesspass action=none header.from=arm.com; dkim=pass (signature was
 verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZW73QYM/1ZHiwr1IKTybKAaszifze4vsuywhBqYxXE=;
 b=eKoewgd7JThe9tDACEc3181Xzf1/5laFXQGrVinbF1eju5dMcps6ecu1LVhsGpMch1H3Vku738dIsROGgBmXhmibLWS3qIBHDGrJguRIWvJn2YXqiAfrT6YV1hJjOdXEtK/p0KCzScwylGhNLdMQVWQma8kf2D86WhKkddn7YH8=
Received: from DU7PR01CA0022.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::10) by GV2PR08MB9351.eurprd08.prod.outlook.com
 (2603:10a6:150:d4::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Fri, 8 Nov
 2024 11:55:33 +0000
Received: from DU6PEPF0000A7E3.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::12) by DU7PR01CA0022.outlook.office365.com
 (2603:10a6:10:50f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.21 via Frontend
 Transport; Fri, 8 Nov 2024 11:55:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7E3.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8137.17 via
 Frontend Transport; Fri, 8 Nov 2024 11:55:32 +0000
Received: ("Tessian outbound 93d42030d577:v490"); Fri, 08 Nov 2024 11:55:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b4c43d43103b9bbe
X-TessianGatewayMetadata: V03fjI/TpOKn+1nawWeWLRwaqAZKivpJ63MJBRin5zL9LqTAUGgnswfmiN3kbZox3CUQ68qBa5POkVmdGze6AySj2vYCl9iRdsO/rdjR9KW0GgbVo8oU4q//EtkWT0H+5qpq/aYqEt5DDKoGY4qYF1xIcmQdfUEk1jvFDDVa34U=
X-CR-MTA-TID: 64aa7808
Received: from Le07d58866e03.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9BA6092B-2F9A-467A-A048-C6CD92EAC9AD.1;
	Fri, 08 Nov 2024 11:55:26 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Le07d58866e03.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Fri, 08 Nov 2024 11:55:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HrgmFhuhiT2cauG2UtyLr0NeETMdIkuB1Q9bvqPJpCak6gam0V/+iFEbhy8AE5FMzpqe+WCI1F3yx886UQHMfheOUhMzQSH9wgLMxiEr5yaeusAiP6hFMqPCT19OjQhCIvtpst+b3alfiMDpcgX7yT+NO4Djs52IJ5vAaOdXOe+MZEyd52Ghq93gQnS7yBjvX0SBWNq++huC0nIPCy+rDfOeulHpgn/4iikCltSnKpLKvAexJ69+OaE3j+JHKS1gAwITYd5027Cr4BmsJ8g/X8kL1OAluUZa0lAlm/g4kbka80OqnqOX/eJRrEWV7ih6AmBHp9RI6gQS0oYtuwmiXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZW73QYM/1ZHiwr1IKTybKAaszifze4vsuywhBqYxXE=;
 b=sR36vz+Ns/g8z8mLeJG7/BlDUK2AH+OmyPs6bmR0TbR/Iqa3dYZ5onRJ4t0B1m79HaqcpaDH1SQXS/ybv4sGntovVy7mJC+zoceEQ9Rp3UNZYgKJWCnqgYmZWIg+yGnzMLbMJRaOrhcKy8y0QO9JJGsGcrtfbLejDSLs0vsn0YWq3qgrzXN61VbQPZYjlP5nHqMJpppMXlCa9nHnEHmV2o0odkToP1Xi3ANDVNspNGUmaQjRzdaXd+2YsoVtaIQItpA0yX/+rdb3Pv7OVTwpXEduWXal6AaYlo8EgFh5o8Wkbwr9EvD7hPbRjsZzRvVfdqsD6x/4BCeB6NzXE603zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZW73QYM/1ZHiwr1IKTybKAaszifze4vsuywhBqYxXE=;
 b=eKoewgd7JThe9tDACEc3181Xzf1/5laFXQGrVinbF1eju5dMcps6ecu1LVhsGpMch1H3Vku738dIsROGgBmXhmibLWS3qIBHDGrJguRIWvJn2YXqiAfrT6YV1hJjOdXEtK/p0KCzScwylGhNLdMQVWQma8kf2D86WhKkddn7YH8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB7816.eurprd08.prod.outlook.com (2603:10a6:20b:52e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Fri, 8 Nov
 2024 11:55:04 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8137.018; Fri, 8 Nov 2024
 11:55:04 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Konrad Weihmann <kweihmann@outlook.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] python3-setuptols: do parallel builds
Thread-Topic: [OE-core] [PATCH 2/2] python3-setuptols: do parallel builds
Thread-Index: AQHbL82s/3yzYmVrJkmbCh3HcGHojrKqlG0AgAHHMACAAKkJAIAARcsA
Date: Fri, 8 Nov 2024 11:55:04 +0000
Message-ID: <C11FF0FD-6A15-4646-ADAF-B90EDBFFBD28@arm.com>
References: <20241105215644.1884070-2-ross.burton@arm.com>
 <2650.1730917856955683740@lists.openembedded.org>
 <1E0CAD7C-8E6F-49AA-A7D9-42C9A645C1D4@arm.com>
 <GV1PR07MB9120975AAD8724E746D5F7EFA85D2@GV1PR07MB9120.eurprd07.prod.outlook.com>
In-Reply-To: 
 <GV1PR07MB9120975AAD8724E746D5F7EFA85D2@GV1PR07MB9120.eurprd07.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB7816:EE_|DU6PEPF0000A7E3:EE_|GV2PR08MB9351:EE_
X-MS-Office365-Filtering-Correlation-Id: c3459134-de56-4b0a-6805-08dcffec3fc9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?O35yCuefG4rM0inRWHmlZvIrA2y0re1pscsc2FvaJ6c6EUNM4yK6Bp6KsIBI?=
 =?us-ascii?Q?v8L8u8PdieJip2zSNwzfMmGRNUdKu7P2ulAyeUVN3q31W20a6WXJv/l7FjOI?=
 =?us-ascii?Q?a8jq6rM21cHZ96yHqBeJGJyuTWq2VlYkuEU6WBkR8yd3jcUtl36rK+tBbeux?=
 =?us-ascii?Q?eMiKDUABx3DPOFXib4VUiTkaCFDWQ1R0EFfGCoj9HcOz+rSFDrDbOZbKaTnS?=
 =?us-ascii?Q?D7gNZW2mZH9z5aQ7T3draK18sw/Ls/wBPwhP94EjWgH/Gp11z7TwcLEMb1vT?=
 =?us-ascii?Q?IKwkmQ/bhhW7auCNkqehyTRjV3uQFFV8GxL0oM2c3dwHV6vNEXTKz5+fJcHo?=
 =?us-ascii?Q?Bj0vd+ldRU7ZUWMtRpIVmU6KV3zoH7JuuAW/va/t8Fffq+JKD0NwobOadZ6O?=
 =?us-ascii?Q?O/DKu3iPEW5YIkgg52HwLf7Zd5BJJnYH2wuRuPnAQjNxEMP62gU3kHFrLJRD?=
 =?us-ascii?Q?MzjNn+OQOPsybg7VurZRXB6VutDsUa+VXekEX8XRMGEepx3FdSPdFop9lemS?=
 =?us-ascii?Q?aPZrBs9bL/qZ/9mobrf8rDHuqjj+MHW+2nVLplxLmFdNTgan6kxRYSNQFg5k?=
 =?us-ascii?Q?0lASeSUu1nEVa97Z5z0mEbT0VTGY8x2gYY/szGgWijrpm3NZTlho4ZJ8znoO?=
 =?us-ascii?Q?oeXnPvzs6s2GQfxhuDet0iWJzhKUURDEUT/3vQENcWzr+EJPAv/77Sf+lqpC?=
 =?us-ascii?Q?gkr5FMJ4AdVS+imwjW87py3M8rzxEgNI6QGdjc9SOxVltxKOLIvBGMm1Fg72?=
 =?us-ascii?Q?asTBTPVuPnGcXvuc0BX3lnjyN3qAz7euwaNdt/jtDoK12dOx9iuNZ1OaEosz?=
 =?us-ascii?Q?Q7fLnLjg569s0c7tdcBCp4GdfIe74Lhg6wmsW065I80VYMi6pywXsgIcgugA?=
 =?us-ascii?Q?TtFMxjsJIszb0/Ge0RoocEOK4kDNTRJ6mU1lFrAiNKFpN6MkMsoPQFahT73J?=
 =?us-ascii?Q?pke8qKT/ODui9Cnh4aAcUwQtO3c1qKw7yXTLD7LS9NTwM+oMMa/FpMg9m1OD?=
 =?us-ascii?Q?5+5UBZ2o7/XIGdHqWjiqknCgRmBKpMfXVZdBlusjsKBV1e8M7mFIJ2N6tN2q?=
 =?us-ascii?Q?yvU5Zv8CCvkJGwAkJh6IEHll3X9T6kjUaCK6/GAKiTvmYklpkfO10DVrzxAP?=
 =?us-ascii?Q?3UXHkXjH16vGPMXBl0CJ6WYcQioZSbURnPO+ExuD5re7dmUiQfqF2ttjU7fa?=
 =?us-ascii?Q?SnV8zgRZXhXisYG6mD34pWuclpdni47bpKJma3NMLNRMc2NmH2sIwzaM+itn?=
 =?us-ascii?Q?rK3gKE2FzWdRg3pkbS55Xxc0AsG0IXQT3jxkBHQEsclBvcUCo9XS+RmA8VLM?=
 =?us-ascii?Q?mlpKqreBpWbVqSK5UFskiEDGBbJfKuzl4YbmVJTRRDHg3I/Zk8IF62PX2YOJ?=
 =?us-ascii?Q?4JCpaJQ=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5F28E798427DAC419E6FF7ECA8913015@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7816
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d83d8719-9229-49b1-9555-08dcffec2f2d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|35042699022|36860700013|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ON8+vuu1W3eHOlPASoSINaGqQ7C+3WWgcx1h5B5o/aar6Xi7/mtDjgzL0o8T?=
 =?us-ascii?Q?3eQRPRrryjMZJfUlRg0qd93FwUIvCd3YGMz4IbzjzoTRUdjezYodeLmqEePa?=
 =?us-ascii?Q?Req0cT5MW1H4Xz49AthCbq9H0NF/gvYdIAz+31+joh0AZ5VVUibW+XoOfgUv?=
 =?us-ascii?Q?o5S3eVx+m52xSAjQgjEjqKd2P26NjgFa4LwqfzXE/SiQp4UU+jG0aXlC3HOk?=
 =?us-ascii?Q?9t++y18MVNSI3kZ1uwJxU6ugjxGdtjUqSV8OQ5odSMoxmy9KwUhn5Uad/9Rw?=
 =?us-ascii?Q?7GntUp5m2xzqx+eal51Ezu8TyKZqehEh/KjBsYAWtqyc51WvBi8+5EYirAC/?=
 =?us-ascii?Q?LejiKCxoCPDznFQWFJtE+ZTTjKLxFslPKzbcNPSgJNvl1AiOOFdMBtMr/YNV?=
 =?us-ascii?Q?zX7Du7uhRIP7id3ZAKVMaKl5yNbzAmMzObl0sr+2KKrMNTJx/7bxD8xSWGRc?=
 =?us-ascii?Q?MmhcTLZXJ4uvrDXI2uuGHrFDObwvucuVZOW9bqk7i5NreBmqPIHpkLCgzobr?=
 =?us-ascii?Q?cGwQ2Qu2AaSIXyitZMH6+Pd4b/AS2vT2LtVjP/BCrIyWalP6lIrOVF3uSrjO?=
 =?us-ascii?Q?U1fP9FXHhRKkbPyWMMppb+SF2xoi2N0XZSGpAusPi5PBHAliTDagmn6Hecm+?=
 =?us-ascii?Q?+iYI3R3gg+7vSmopkeBvqy8IzugmbJ3VKpeTbk37PiA9vkSLgNjo9qzs3k41?=
 =?us-ascii?Q?m42A1IwiYnfvpxRzRCaoU2VDgtWy88Snn0nEqN6i17ilFgIqMCWe480PfRBx?=
 =?us-ascii?Q?G6nhXTv2846TL3i8jvwyoCHdrD3NrR2dYxMUrj7VcBWnOYGKEvcpgJgqGADk?=
 =?us-ascii?Q?QwGK3k3zOj0hLLT3aefPrMrguLZvIld6Gq64piLtiFWi8a7dwIh/EfAcVCy7?=
 =?us-ascii?Q?r3ZmYW/nMfIzOHc60PPaHL3cu7Aj9cOK8YG+JSWKjtPNoRGAD035Hoo+EUei?=
 =?us-ascii?Q?iYGtpsT0fJAUZOFUWQzGZ1200Sii1NNJSDDnVniOCEvOz4eOEx6hGb8pDPYv?=
 =?us-ascii?Q?igYAU273gwtUj17kqclEv6JUneRNTrVoXgfZ4Jz0OUf036MP+4tXCPvCh4ek?=
 =?us-ascii?Q?Hcq3B4i4pM08JB3DF40IYi38n4eF2DmUlxSjKQ3ergX41iSdvAvp7t4o7Qlf?=
 =?us-ascii?Q?1oTZ82U38etxgVHEFX7xsbIP1p4KsdHD3oxEoNRR9BVrAWOzva6XCwYyoDM5?=
 =?us-ascii?Q?3JR0khE5br7sahjckI0O6Di74CEvLG4YXdxZvvaZ1yv0nAmGffUWUbcZ2AL6?=
 =?us-ascii?Q?EMAFppEghdYmFuk6TuNTR/0ws0hATzFuEpW4em1NLNOtowjqi/SEMjZO/KHg?=
 =?us-ascii?Q?V2MzseB5F9Dn047WD3KmM4LTVJnToWl9iHbTtx7eNEFwR3zLoBR8FIcMF00W?=
 =?us-ascii?Q?SE/HAU5ZJolZq0tDD9IFpsSLwaOlGHWkXGaQZN0FCt6F/fWb/w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(35042699022)(36860700013)(82310400026)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 11:55:32.7296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3459134-de56-4b0a-6805-08dcffec3fc9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9351
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Nov 2024 11:55:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206863

On 8 Nov 2024, at 07:45, Konrad Weihmann <kweihmann@outlook.com> wrote:
> And as comment for the v2 of the patch:
> I believe --bdist-dir does set the build dir to a path of your choice alr=
eady

It sets the directory for the binary distribution not the intermediate buil=
d tree.

Ross=


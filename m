Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7383C021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 13:03:13 +0000 (UTC)
Received: from GVAP278CU002.outbound.protection.outlook.com (GVAP278CU002.outbound.protection.outlook.com [52.101.188.82])
 by mx.groups.io with SMTP id smtpd.web10.17845.1739953486847692619
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 00:24:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@duagon.com header.s=selector1 header.b=a0YT+Qh6;
 dkim=pass header.i=@duagon.com header.s=selector1 header.b=a0YT+Qh6;
 spf=pass (domain: duagon.com, ip: 52.101.188.82, mailfrom: jorge.sanjuangarcia@duagon.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QdvodOxJX0rs5dBmWuSuWi3IPDw0EasynNMfWpJoJLNTT2oDNX2AUJgwlp7W+IWygW6Y6yyADgnM14T74Ajzk7zrKoXW9yy9GxV2VbqCmdKev7B9nPPpVPqPFbq3IMJQoNobPyOq3679GA4dCXN2Zm2fliJV3oExs5SZSjlWidrC1eF/K8SFikiQMpCEeWIVltyIVe3YC4GA0lTcTBNDHwdFCSkiiGsn8DvSx7k7PaZN3dLWoVPl2DAcZ0NoSdl1fa5gMfyY44aVG19gVmuWZmvy5rL7rEN8PL1dWswC0r+riuz4cdbGgpTS3yaXRLdWt5qejFr83mVui8fxpbXbxA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ilZUTMLs0Z9YRLiEEzDCQS5A2VCrgVmU7NFvotnd+hA=;
 b=a4M/1RHR5Fh2OT3BGfharOZxQlF/r8vALHyqptRU/7Gm2I+ZOSB6bQt1hWjut/k2MmjOmygiremNPYbkE50uRxOCLL+9LhDca1Uz3H772fRi8ocLwl1TSVSJUDelVT+5sTPqUfNa7iCYxfsB99gDrGj88W5sNEkC6zuI+mBXrtvzmwPBcDcgaP+T5EDiletM54+rG4O8euOrlwNdi/6ooY5l4ar/jm6odi+h7pLdXzYj+d/ng9A0sFXQHg7W4okC8SwfNcW1pENc22JE0pnQdkoE/q+BKfVTbSDadCoxFoAidu5tHgxIDP4NHRSbj6lbOFUCq5qCO6u+pW81SexKWg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 194.38.86.34) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=duagon.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=duagon.com; dkim=pass (signature was verified)
 header.d=duagon.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=duagon.com] dkim=[1,1,header.d=duagon.com]
 dmarc=[1,1,header.from=duagon.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilZUTMLs0Z9YRLiEEzDCQS5A2VCrgVmU7NFvotnd+hA=;
 b=a0YT+Qh691QRknQS7vZu21ewkyefsDjAhWJSn/EgrmrqJzUlqZmp+xdEzr8RKFLr1ioI2hzOjEC3f+t/Si7Se2J6tnyDEKgnQWi4sQDsgfGgpP5YvjhLEk/wcFRpmaonQOlDkVal50ieeFOVx5SxKCgPq24lGnQLgfxlpZ0XJlA=
Received: from AS9PR05CA0124.eurprd05.prod.outlook.com (2603:10a6:20b:497::15)
 by ZR0P278MB1285.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:81::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Wed, 19 Feb
 2025 08:24:37 +0000
Received: from AMS0EPF00000196.eurprd05.prod.outlook.com
 (2603:10a6:20b:497:cafe::bd) by AS9PR05CA0124.outlook.office365.com
 (2603:10a6:20b:497::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.14 via Frontend Transport; Wed,
 19 Feb 2025 08:24:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.38.86.34)
 smtp.mailfrom=duagon.com; dkim=pass (signature was verified)
 header.d=duagon.com;dmarc=pass action=none header.from=duagon.com;
Received-SPF: Pass (protection.outlook.com: domain of duagon.com designates
 194.38.86.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.38.86.34; helo=securemail.duagon.com; pr=C
Received: from securemail.duagon.com (194.38.86.34) by
 AMS0EPF00000196.mail.protection.outlook.com (10.167.16.217) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.11
 via Frontend Transport; Wed, 19 Feb 2025 08:24:36 +0000
Received: from securemail (localhost [127.0.0.1])
	by securemail.duagon.com (Postfix) with SMTP id 4YyTvl0pjLzxpB
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 09:24:35 +0100 (CET)
Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazlp17012051.outbound.protection.outlook.com [40.93.85.51])
	(using TLSv1.3 with cipher AEAD-AES256-GCM-SHA384 (256/256 bits)
	 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by securemail.duagon.com (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 09:24:34 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MNIB/Z5imci9Xf6p5TUr7v73OvwnwAXD/pitEFlaWK4274QFYPLLLl7qRAwa1QOWLDCqdxSm3ebo0t+MK1TrirDUn+he/xVapOwcaCfOH79OEBfYvs6nWussoK/JFq9bxXbSc2xw487Q8Ht7ILHYOHBEbmaVBwMrRcwlBF2wzOlM6uCCASFxpeDS4DLFUCld+1YL97o2DsqJbMQp7vQpW9FoPHRqc8rhzuiyUYqK3z84NzqD5NCQyGz6/ZHVL7fzpkKMMa2r7jIhB18CHzmxlaoqhk9TpOtOFJt5ha4Lvaz0Z6672QBgtlO8IV/Zm5PRiaXcAMhSUqPwpom5Y4nTsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ilZUTMLs0Z9YRLiEEzDCQS5A2VCrgVmU7NFvotnd+hA=;
 b=xmRsfKX1BaohuLye2589U4vR0soeTjbg4KEXZ5EGGm4d458laFCqeR2vtz1IjMG49yZmZBM8Qh9gJ3kRgffFCuHe4nGRHerjedFVLew38/x9MC3KeNboWLFjWcTXCz299V20jNgn1P/OrETpLZHiOpl+2+EivL60dRG1IErWM3LiHcZoJTSWyEyBAAjTXmEfFq5OUOWgNeHUVGcb0Vbazdr0cdm+7cDlggHuspvjBLmtly8z6T3pX1YhgHpOl7d+q5bX1+ARRMtYakSEySZTBGQ9J0MdJhRwkUpQOC4BOqmB05jR6zqpOUjzIq0RJNGYFJ2mda0FS1hOJZrq9neczw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=duagon.com; dmarc=pass action=none header.from=duagon.com;
 dkim=pass header.d=duagon.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=duagon.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilZUTMLs0Z9YRLiEEzDCQS5A2VCrgVmU7NFvotnd+hA=;
 b=a0YT+Qh691QRknQS7vZu21ewkyefsDjAhWJSn/EgrmrqJzUlqZmp+xdEzr8RKFLr1ioI2hzOjEC3f+t/Si7Se2J6tnyDEKgnQWi4sQDsgfGgpP5YvjhLEk/wcFRpmaonQOlDkVal50ieeFOVx5SxKCgPq24lGnQLgfxlpZ0XJlA=
Received: from GV0P278MB0516.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:2e::11)
 by ZR1P278MB1475.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:99::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Wed, 19 Feb
 2025 08:24:33 +0000
Received: from GV0P278MB0516.CHEP278.PROD.OUTLOOK.COM
 ([fe80::ae7a:9620:b675:152e]) by GV0P278MB0516.CHEP278.PROD.OUTLOOK.COM
 ([fe80::ae7a:9620:b675:152e%3]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 08:24:33 +0000
From: =?iso-8859-1?Q?Sanju=E1n_Garc=EDa=2C_Jorge?=
	<Jorge.SanjuanGarcia@duagon.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH] python3: Remove DEBUG_PREFIX_MAP from sysconfigdata
Thread-Topic: [PATCH] python3: Remove DEBUG_PREFIX_MAP from sysconfigdata
Thread-Index: AQHbgqeJiOnsKcgZp0ChitLdHnpWrQ==
Date: Wed, 19 Feb 2025 08:24:32 +0000
Message-ID: 
 <GV0P278MB0516B168ACC6F3595C48BFE88BC52@GV0P278MB0516.CHEP278.PROD.OUTLOOK.COM>
Accept-Language: es-ES, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-codetwoprocessed: true
x-codetwo-clientsignature-inserted: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=duagon.com;
x-ms-traffictypediagnostic: 
	GV0P278MB0516:EE_|ZR1P278MB1475:EE_|AMS0EPF00000196:EE_|ZR0P278MB1285:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e195341-7600-4ec2-50ff-08dd50bed8a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?iso-8859-1?Q?U83kFGMOyq8bPD+eQIwT5vTK4A1Vvxo7hroDNKT690+X3jdOg4xYq2eFsd?=
 =?iso-8859-1?Q?FE1JkPrOjtqDJXm5hkJew9pWo8KrcBHjnk98kULWV8Ej5dg104r5IVdsz2?=
 =?iso-8859-1?Q?XOQvrHfjL+N2IpFn8LoS4ajGW81IuNwJ/VU4XwrM8XQbqLOKlXFnSGCynG?=
 =?iso-8859-1?Q?DpM17juHDeiD0hAjtS4uFwD58KlEsZMCV5os3AJn3vM3PidHAmH9+s9uEb?=
 =?iso-8859-1?Q?oePbRB09AuW9eENPCw8a3Tq8fFYfMMGNCTOp7mkzCp5xrv96hCQk2t0hcS?=
 =?iso-8859-1?Q?mUpr5S8kwg1/7VhaU2Xl/JIzf9JQ6/e28T9nV7SE99qwbQf/wxDJMnEyRx?=
 =?iso-8859-1?Q?9HEWRUf6AKVdSzuVfypWwkPjSA3RoXOznNQKIR2Txev0ZHW9ClbKk4CX6A?=
 =?iso-8859-1?Q?vKiMpd7ReFVhMy6w8+CcM4mpginQXGfYHLEzB721i9WWID4eWR6JMMalfN?=
 =?iso-8859-1?Q?njVwGTDqq0L17QyfWVVyw+ShhwjqRYBJcQax8wZfGQKeneq+gHxMfCOZ5r?=
 =?iso-8859-1?Q?3QS8sG+pmBVDT/2oWd+AhbaavF76t5YdFybtlc+PAp6n6MClKdX62+qkDF?=
 =?iso-8859-1?Q?ws0OvUnA9QGGikE3QHf6aKtTaYSd3MJfuKPB2nNWBfUndueLzCw10OkcjR?=
 =?iso-8859-1?Q?mj77sVTc64046OpZMmhJee2JLrmWvTwEHL1Z3j9Ek5AjCzsxwlYtHO0/RN?=
 =?iso-8859-1?Q?FV2xajWiPvYG0UukGaKLsk3wS/3M2rTk8709yikPVI2PUNBJh/gX1rdjl3?=
 =?iso-8859-1?Q?a5xe6MjLU55EpzHddgQ7E/cYkolOPicxg33aTTt9KRNb074TyAOXlkykR+?=
 =?iso-8859-1?Q?24Lm6N6P5d6KT8wyX7oCfUVQYOvZ6z/E6utEa42fEJ2tOocu7hTz7AX7Qf?=
 =?iso-8859-1?Q?H3DGuomsiUI61R91I5O85b1hd09+LTJvsxz++ezGuCyLun5siqH0zN5lRt?=
 =?iso-8859-1?Q?tUeyWKi3LAX3aUxiQXY9ODyzM1ZpqVc0qYkmdB+MDVVWrqleKz9FtWmn1L?=
 =?iso-8859-1?Q?nj9gZZbdFjdC2HT7IT1KAIcD3+n5jdZXuyoDMCt4tF326eAuVPYFczTD5G?=
 =?iso-8859-1?Q?nWsq2WcrLQzqNlNMni7FwWQGSbj5w1xsaGEyQjpXb8bDYhFPAPImIvVESv?=
 =?iso-8859-1?Q?+GlTso9tnNWBQWNmXeaEa2fPLfzZ4Ntrur/dobs+V2Fgb7SGOOQ/tRT0cP?=
 =?iso-8859-1?Q?74pFHJwT/a9Fpzq3wdGsas+qIOqFFn2axzBSALicIdDIICg88QSNJfiCLi?=
 =?iso-8859-1?Q?pUVt5LAPN8X52eeI0XFRxr9SqkAMvUfA3L2Uu7Pc7WuJAhpE39SlmAmzf8?=
 =?iso-8859-1?Q?01iDJkvmOvSroDRJbombstCMuQQX+wx5hdiKLwWHV7dFAScqa/jmIzM25G?=
 =?iso-8859-1?Q?6PUwUuP0TuiOSjsxsc/GSSdZ1Qwp0YeeK6qd1Vh8akB4ptX2jNQ6gNRtaN?=
 =?iso-8859-1?Q?86dE3QLTePEh6pBDtCHRmB7++OpnhKSavlO221+Cv3cg3+Kac251G549IM?=
 =?iso-8859-1?Q?nPb4/wwYfS940LuVXExK1w?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV0P278MB0516.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR1P278MB1475
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000196.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7fe5eab1-caf5-40e0-8ceb-08dd50bed639
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|35042699022|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?iso-8859-1?Q?lZajjwXgfEj1/Rw5HMNrnYw6NlUQYJaQNiiOsGzWBJQGuiKHz5vb72/DTb?=
 =?iso-8859-1?Q?9mlPCfW+anodJ0kLzHKb6z+Uw8mKQAUwH7nekvKfoHs23j005r+SlJySLL?=
 =?iso-8859-1?Q?tEW5n59AkiVeegVVLOEBfDAWTcYZ6waNpusi4va5mmr1vw18hYWz6WQX/a?=
 =?iso-8859-1?Q?V3ujKQJ6wwYv3GXPXPBUCQd//lNodgRw6G+cN8WdTppkXXH0UWAqwsmkhG?=
 =?iso-8859-1?Q?KoWszNw42kVV5sM88+tQwB3zvKH5R1CZB+/RW9woBv53dRP+EU/1E4RXyy?=
 =?iso-8859-1?Q?g/RO+DRIj1tuMvioAV/F5Pfl4gktDHJOSQK4exNzyC9fVDSHC8WKKjI6vC?=
 =?iso-8859-1?Q?qxt9P+zAe/H4SJLwi4G19fQ6hbUolwoA06wZdMzdP9vhwZgYn4/avbciY1?=
 =?iso-8859-1?Q?Qwrlh0vmlfOaE80EIWzSaMlDAbncwxt/SMLGInE8yP9L7PXHT3L/ytF7e1?=
 =?iso-8859-1?Q?r/8EX55LNN+PyAI7y7r70xzJPmzQ2lNJUTqWD/exo8UIZiOP9jzHsSgxvx?=
 =?iso-8859-1?Q?YUytYESm48ej7uCA5slN/b1GI/52HtKWF2QmY90kg6j1aj24h7FzL1zy7j?=
 =?iso-8859-1?Q?oUGocI/VF3hB2z0VhDy/i9sWuIkieQv3jUSdiiwGP0ZCnKX0FH6RS2n3Zm?=
 =?iso-8859-1?Q?0F0tSk5S0cN+S+RcvDdO/y2J9hGV77zQBnn/Ci6go2HJwwsR1t/bXv7xlT?=
 =?iso-8859-1?Q?zYzUymzz9ZTppSP+xkkDb834HvXwNq6S6a7BS6wtNIeL+TEvyp0oOQjZX2?=
 =?iso-8859-1?Q?GtjsXicj7IMA63SodVLBhPvHXc/ZjCP9/VULez6b+lBv+CX1AmpAqUGTpE?=
 =?iso-8859-1?Q?b40Sq2UmIV32iK8ISXuETsB4PXkfgHfVXciNCQozubEqcSB1XKVcNlK3h9?=
 =?iso-8859-1?Q?4o1h5/PGnW0IM9bOaBR0yw5j4ctqHAP0RfDVw+HmLSEZW+5BGcIsiupP51?=
 =?iso-8859-1?Q?FOv15sJKi2Z1SlCUKnZDFgsdwZQtYAFDBxHLhcxsnte/0g5kiTyiYMQ5OP?=
 =?iso-8859-1?Q?M5ZkNmWacaV2rkGfq11EtAe47JFu4Z0o84ZDgQnWWTOvfNtri5YfrMe12W?=
 =?iso-8859-1?Q?yvQwSvyu0znfX5bKLEbpNXFu0nbeBxiFFLAjnMXBgXLZHf41l1K/k40aBF?=
 =?iso-8859-1?Q?nSNeHibH80lvW7bc/ZD7h7gWr4JONY/Pw4Tk3/OvL8CVS+3RmUiudmleID?=
 =?iso-8859-1?Q?2a97XDVSBPIqNtpfBw9Kd0XpbtcUoCLwMAA2SFQbjfJJxEog7C2oLYwlKE?=
 =?iso-8859-1?Q?NHnFxZ56LA4wxOQVjTO+xgTJMkBdvJryc8mdpjkO3ExZ+n9+++giIp/SLw?=
 =?iso-8859-1?Q?YgusWNggF7tLauo4RESyc/9Kedd3afZ+TYVn+0SFYywQHO8H9l9r+SUj7I?=
 =?iso-8859-1?Q?o0rK/VTkP22l1WMHE7EROnmDA7wfKCBlFhs9kDj8NsIOgY7YevrhgbMulc?=
 =?iso-8859-1?Q?r2qvRbYRG5HaoH23Vw8k+LrPY5YnIDC9aEJ5rFeq0goOOxzHV95q3Wf3iv?=
 =?iso-8859-1?Q?DBEggdjtZ7nS1LlURrxrxzhSNVDrHViGmE4CiTnj4WMZwrfNCsjDn8x+52?=
 =?iso-8859-1?Q?xc0eelQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:194.38.86.34;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:securemail.duagon.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: duagon.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 08:24:36.2437
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e195341-7600-4ec2-50ff-08dd50bed8a1
X-MS-Exchange-CrossTenant-Id: e5e7e96e-8a28-45d6-9093-a40dd5b51a57
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5e7e96e-8a28-45d6-9093-a40dd5b51a57;Ip=[194.38.86.34];Helo=[securemail.duagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000196.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB1285
Content-Language: es-ES
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 13:03:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211707

Paths in DEBUG_PREFIX_MAP are not being removed from sysconfigdata=0A=
files correctly as they are split into line separated values. Update=0A=
the sed command so that it uses any matching patern from=0A=
DEBUG_PREFIX_MAP instead an exact match of the full variable.=0A=
=0A=
Signed-off-by: Jorge Sanjuan Garcia <jorge.sanjuangarcia@duagon.com>=0A=
---=0A=
 meta/recipes-devtools/python/python3_3.13.2.bb | 4 +++-=0A=
 1 file changed, 3 insertions(+), 1 deletion(-)=0A=
=0A=
diff --git a/meta/recipes-devtools/python/python3_3.13.2.bb b/meta/recipes-=
devtools/python/python3_3.13.2.bb=0A=
index 52fac76c00..656a73f501 100644=0A=
--- a/meta/recipes-devtools/python/python3_3.13.2.bb=0A=
+++ b/meta/recipes-devtools/python/python3_3.13.2.bb=0A=
@@ -291,10 +291,12 @@ SSTATE_HASHEQUIV_FILEMAP =3D " \=0A=
     "=0A=
 PACKAGE_PREPROCESS_FUNCS +=3D "py_package_preprocess"=0A=
 =0A=
+DEBUG_PREFIX_MAP_REGEX =3D "${@'\\|'.join(d.getVar('DEBUG_PREFIX_MAP').spl=
it())}"=0A=
+=0A=
 py_package_preprocess () {=0A=
         # Remove references to buildmachine paths in target Makefile and _=
sysconfigdata=0A=
         sed -i -e 's:--sysroot=3D${STAGING_DIR_TARGET}::g' -e s:'--with-li=
btool-sysroot=3D${STAGING_DIR_TARGET}'::g \=0A=
-                -e 's|${DEBUG_PREFIX_MAP}||g' \=0A=
+                -e 's:${DEBUG_PREFIX_MAP_REGEX}::g' \=0A=
                 -e 's:${HOSTTOOLS_DIR}/::g' \=0A=
                 -e 's:${RECIPE_SYSROOT_NATIVE}::g' \=0A=
                 -e 's:${RECIPE_SYSROOT}::g' \=0A=
-- =0A=
2.43.0=


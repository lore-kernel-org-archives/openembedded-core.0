Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C177C3ABBC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 15:23:16 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.4])
 by mx.groups.io with SMTP id smtpd.web10.78542.1746544987511630163
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 08:23:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=QF1HeKYU;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=QF1HeKYU;
 spf=pass (domain: arm.com, ip: 40.107.130.4, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=XGX0PuQhVtQgmwqT8XOH7UARyMOWaYAb0+IrU4oYobsgBk4ktiIS0kTMmDPrDc4szuw7Z3ZR1h4hnCRZMFj004vavGdaDeulX9RrwPxdrAddEqpySu/MiRx2n9cVSsmxbQfY6Y6RUolO6dI9bk8N/EJoCNwMjAfsF6EI7buEXmOwDMC8B4SmucWvfl3rQvOWsYps7KzqN2EIyli2BzfzeDiPV4GcDAXlgX6z2jyIkkuZLdwA+jpAMwVmOxDKrMm5cVUxRpytMt426fT9WGjvG9h+lz5FWj9F9rbPlKaZYDvrX5RlS8d4fOa05i/w9ojQ8d3pFW9vEaltGofb6iPY7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fKbTSVWZr4bJ9Ygos+koXxyV/CgrUNPr0U2ajxzsJg=;
 b=w3wyjnjeKdozNmisuALvClreVhxa67D9GqcQKnVd9htD41OKo1qnhcOF8LNBR69fY3EPMbWDEyW9Cv1aueyGgZTTF3pChw0eoraSM8sQC4gTOsvpSgScCAER10tw6u88xmHtpJFmT7jSXOdte1srpZHABNs11FwFW1/DTHURXTK3toO33b6VKNgBgRRCKEZ/f6olsty+6QgH2BBR43m91yiN4MjKCYuH95+Z6//KfwO6vU8R4TTbzhaS3Xcd37kKtBPZvwDe5GGRP4caZ6OTKKnfPs9pBpoV8g0Yh856NSdAG1NY3xmU7D3D4j2DtwZ+KdeGVI5NYzdBWCEUD2ZOcw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fKbTSVWZr4bJ9Ygos+koXxyV/CgrUNPr0U2ajxzsJg=;
 b=QF1HeKYUFLATmwpVF9vnnIC4Ia2YLHctMJ5W2GlNZRYGp378n0wVCmsebbcOshzF7aQvS1VTPnAollf+LEnyIO3NhPK6CS9FL9YM8LsJCVYRjFgq93i+alkVR5kRa8yRWKqgrtkgvl3EDH7WlCTPqmAvxvhejBt1eJte65rYjfg=
Received: from AS4PR10CA0029.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5d8::18)
 by AS8PR08MB8971.eurprd08.prod.outlook.com (2603:10a6:20b:5b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 6 May
 2025 15:23:03 +0000
Received: from AM3PEPF00009B9F.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d8:cafe::95) by AS4PR10CA0029.outlook.office365.com
 (2603:10a6:20b:5d8::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Tue,
 6 May 2025 15:23:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009B9F.mail.protection.outlook.com (10.167.16.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.18
 via Frontend Transport; Tue, 6 May 2025 15:23:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BOkWKEDEClqiXGI7CLBBp3w4h53WP4VImjKAlzENbuzvplQnLaQIqjRBZlFJqqPVBg/VADMaA76YRwmeyOoxrjkF+P1oddLcvp8H1ERvlWzyzuWxVggcoJwwcbUKVNGpRJsDSJIlCEljkyZ75ZCqXygTZZxo+GUuo16Ls0RqjnEDXzx/Dx8waDk+vCIsixMssOji2OjbREyhoSgtq1jjkNxQxm2sYP9qJpPnNsJRL9MifoY9/qgxpitZNjIH29ePlriERcV0EYWxqBfIYVO59nWiU+zgm6CxXwzNcv8jIiFSri2z7lZSHUQKCovDA9FQzdjAxblEfOkPYSx3vaWCfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fKbTSVWZr4bJ9Ygos+koXxyV/CgrUNPr0U2ajxzsJg=;
 b=ABv/U0Ysew/5CQfY8Ld556rvRuEbut1oy4prnFwUBbikySHo3HL1FY80AHvWNIvl248OIKjMoWLmlzVLMxoXBl4QhxOftA/o1P1Luutd/ljsDLtohXEw6bad2tpvhKbZfEiDi+yZ4izmihXs/sA7wRzPxZRUQh4L8IlweqPpdff5F8AkxtCDUrEvBvjMVAt68cgDpNQgBR6fxSyjGRsY6WVWxOm4a/o3JcZtM+tEdjrESFRnJIyRmovMLywTz+nC9ld/+t1IlUhoO2sPyME4Zloq7mKWrZ+igHk32uxiELV52zyT+xAW4BPAWAKk2iNxDAXBgiBPNPJc0ZzcviknJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fKbTSVWZr4bJ9Ygos+koXxyV/CgrUNPr0U2ajxzsJg=;
 b=QF1HeKYUFLATmwpVF9vnnIC4Ia2YLHctMJ5W2GlNZRYGp378n0wVCmsebbcOshzF7aQvS1VTPnAollf+LEnyIO3NhPK6CS9FL9YM8LsJCVYRjFgq93i+alkVR5kRa8yRWKqgrtkgvl3EDH7WlCTPqmAvxvhejBt1eJte65rYjfg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB10642.eurprd08.prod.outlook.com (2603:10a6:150:167::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 15:22:28 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 15:22:28 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "max.oss.09@gmail.com" <max.oss.09@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Max Krummenacher
	<max.krummenacher@toradex.com>
Subject: Re: [OE-core][Patch v2 1/1] openssl: aarch64: configure with no-asm
Thread-Topic: [OE-core][Patch v2 1/1] openssl: aarch64: configure with no-asm
Thread-Index: AQHbvpDG9yMiIc+Kv0SG0Qqoz8QfFbPFuC0A
Date: Tue, 6 May 2025 15:22:28 +0000
Message-ID: <2CF9A2A9-A12D-420C-80CB-33E69FC256D6@arm.com>
References: <20250506141013.2600055-1-max.oss.09@gmail.com>
In-Reply-To: <20250506141013.2600055-1-max.oss.09@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB10642:EE_|AM3PEPF00009B9F:EE_|AS8PR08MB8971:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b21a22d-3853-4e88-ef1a-08dd8cb1e4ee
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?N25jU2N6bG1GY2dHQXpvQi9reGRZZHJydHlYeFNnbmltdEhxenpNdzZYeG5W?=
 =?utf-8?B?WE82dHBTekM5czZHci96ZXNHbkFKVWNMWjJTSHNaTWl5eDFYMTVvYjBsQWRO?=
 =?utf-8?B?THNOcEhtN1BiOGJKbHJOYUl5K0k2SVEydHVVaU9DdGNGczhXWjN6c1NWSnBX?=
 =?utf-8?B?ZVVFN0M0VE85cnNqc1Uvb3VzOFh6bnYxYTVMR09MaE9Qajd2SWl2UUovQjNs?=
 =?utf-8?B?clZScVFmamk1bnp4NFVaanMxVDFmcm9ybHVxM3NpK2N4ckVFdjQ2RDlDZzEz?=
 =?utf-8?B?ZTlVd0VocEJyelNYZW5IcmZ5Q1k2bnhNNzJQQStwbjdRWHpJN2NCa3lGbk9o?=
 =?utf-8?B?dzRjU2daZy8zSTllWFIwR094SmdzRGJoL3NQN0gydnJMWHhtQVJWcXo0NlJM?=
 =?utf-8?B?b2xoQ1d0ZUZFUm9ZcHU2ZVQ1bnRTblRLY2ZPTGtTUEJwc0dIOGhxTE50UDVV?=
 =?utf-8?B?QWE0WXk3djQxenRyV3h3OWV5MnpLTGdOWmRCelBDUHQrb25WYS9PQWR3SjJV?=
 =?utf-8?B?aGhBbG41NTZGcTRxRm9DQlJIV21JTFZncUp5RWI0UEozMkpQczRIMk01cThz?=
 =?utf-8?B?UUd2MFpzTEJhaFhsbnZkYjdKemx2UE94dVlmaFRaM281bHdpUWpkRTRPSHJ1?=
 =?utf-8?B?WTNDdXVKRXQvQWR4cGNaSjhBU0xpZXBxNytXcytVT0V4MkRva0lKMWIvOGJM?=
 =?utf-8?B?M2tRckIvL3JJbUZ2NzluUXM2YWJoZHJ3U3VEanlmdkZ3RDIrdGJmOSt0ZzdL?=
 =?utf-8?B?dTVyLzlpdmpMMThGREZUa2h2NkRhZGlTTDY0Yy90VnZFVWk1UDNjQ2luRUx4?=
 =?utf-8?B?V1BOTXdibktwUFFybXdtU050eS92cERNdCtSdFFRb0Fwbm9KTEJhMUs0ZGdt?=
 =?utf-8?B?Z2RTemRRSTUreVBNcGlIM2pvRVlneFR6SnR0aTlSUzNaRDZvZnlaOWR6Y3lm?=
 =?utf-8?B?SDAydUJPU2lUaCtrRVVMUHVnKzE1OXA0aVNTQU92cGhZamdPRCtsb2Z5SGFm?=
 =?utf-8?B?MFNVNWhQVmlsTFV5K0hYakEweW4xVWM2R3VvQjlyTHVVMFZsMm1ucGxVY0h5?=
 =?utf-8?B?Q0o1WU9LeEdRWVM0ZDlHck9tZVAzbS8vWERvU2xsenB1YmFCVXdnMXYwbHRm?=
 =?utf-8?B?L3dERGdlVUZVbS85TkxEMlc4YkIvNkw0Y0t3VUh6bUMzRVdFbUlMczBKYmYv?=
 =?utf-8?B?STZLeDFvbUdZZEQyTEpSU01MNlMwMk9VbGpiTXU1MU5yVlZnSUdnMWxkR3Jx?=
 =?utf-8?B?V1ZnM1U0WjlVUFZ5SnBjdFd1b1dpY3lOT25xV0dlRlZGWkFKd3lkaFFBRkox?=
 =?utf-8?B?TkhZcUVXQm1ycGZPcVlEYXE1NVJHRVZDUHhvYTUwZURrRG14WTc5Rks4ZGZK?=
 =?utf-8?B?VlNaWkhld3hVWlJmN0dhSFZTQmlJNXZBY1ZSOHptSTZtT1grbk1IQlJOcmtr?=
 =?utf-8?B?aWp1WGU1RmNOWWNaYUNxTjZ0dXhVcGtVRWNFZkNyczdoc05Vd091WU0wbUhm?=
 =?utf-8?B?NmszeXM3WXh2N3IwdDI2a3dRYk8xclhQU2lZU0E0VjA0aUNRSWpmV1Q4QVJS?=
 =?utf-8?B?WUVUZk41K0ZHMzJ2cExQUHIyeUZFaWp1bkNNRWRmRm90K3VSdU9EdU1adzd4?=
 =?utf-8?B?NTgvN0FFdmxuUVR2Q3l0Z0VqbXExcXJpbVdpOE9BaTJCS1VERkVWZ0JTSDVj?=
 =?utf-8?B?TjJTYU9yMEduMmIxdFpTVStGV2VlYzFQalRua2RmQmpPKzNJUnc2dlhIenIw?=
 =?utf-8?B?UStDMFZGZXRkRzJwNWtvdzl3R1FRbXlSSEM1bzJ0aVJ4Q3h1MTF2YXhHblZt?=
 =?utf-8?B?ZUkxOGI1UjEvbVE5TGx1bS9JWVJNNGIrcTlpeGkwNnNkcXdlTXlpYnpZNVB5?=
 =?utf-8?B?bnU5NjNYRlJIODJOaVpNVHBtaFo1WXFBcU9kV0kvdWVnT3FpS1Z6eGoyWXds?=
 =?utf-8?B?bi9Tc1pVK0NRL3UxNjJSVDlNeTNhTlA3ZUdoNEhWVU1mVmhEaXZnNlpIRU00?=
 =?utf-8?B?cWtJclpMeHJRPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A1AEDBB29520B540B9A59CC21B0774EC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10642
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	32dc96f8-746e-496a-83c7-08dd8cb1d01d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|14060799003|376014|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z2ttbkdMdXZJRWs2bUVzOTYyMkJDamlEVkNxa3pkMTBMZnFFaktRaGVlWUlx?=
 =?utf-8?B?QWtoMWFNSlp1SlZVZnJsZUNud2ZVdXR6NVVDTEdXc1dFTmY1b2l5MlZ0a2s0?=
 =?utf-8?B?R2hmcVZSMkl1anNvVEVUYlZad2FaTUwxY0VyemlaN2l2RDUyb0src2xGRURz?=
 =?utf-8?B?RU81RTc4VjJ3Tllxbk5MMFIvSGw3T0d1QlEreS9PM1RYMTVSVnBQcG1oMEhC?=
 =?utf-8?B?Mk9qdlp5cnJaN3VyUEE2OGtTeFlERjJQakJJRkx4L1lwcklybXFmWnpmM2li?=
 =?utf-8?B?M0plME0xdnl5a2c4ZHAxUzJsMm8vVUNIQzFNWGl3WHdBOHhIVW5DSGV4aExJ?=
 =?utf-8?B?bTN4UHo4VXBLVXFqNzg0VVJhRk9JcnF5WkdkUGNPdXJNNE4vZkxxRE8xUDJW?=
 =?utf-8?B?a3ZBaHIzeWxWTHJaMjVrZUVKLzRKaURkQXlDZER5ZTFIQ1hZVlRqMzU5RWRR?=
 =?utf-8?B?NDIyWUVERzZFSjZ6bGQvb0Rkd1lta3lma0FkRWliMS8xMXNCSjRzZXRCZGJn?=
 =?utf-8?B?aGtuR1ZKRk4zS1Evb0FmQWpRLzI5WFQ1cWNZMzFyWHovakNYYmJadnN1d2Fl?=
 =?utf-8?B?RGJUU3JjSHdWd28rY3ZWQTB3d2laSTdCS2o1SDFTRXB6Q2s2V042UXZYR2NQ?=
 =?utf-8?B?aXJOdktEaEFrSlhFWDJqUnJBUUd5UDN6eW9QMm1keTJGNHZaQXdCRExXeDB4?=
 =?utf-8?B?aFh0K0JyeTlFeS96bGU1SURXLytzOGVGTEI3VkR3OExidDkyNlZxQWVma0dI?=
 =?utf-8?B?dmppNG02bE5rdDNicXRqNWhvVGJpOWw4cGFvcDdkYWFKZUIxVU1IOEJJUEtj?=
 =?utf-8?B?bUl0cW1kNEwwWE9zaHRnT1dBeGx3WHZxT05GUUVUeUdpK1dCbVE4MXNZSVkw?=
 =?utf-8?B?K2RPR2JnQ1FRMG5WRHlUMjdSQVJnb203dGhLWHJkTDF0VmNsSTFaV29ETFZ4?=
 =?utf-8?B?Wi9BTE9aUzJJZExZR3R5TFJGZ1luM0kxanl0S3RUUFByRHV4d0hCcDFYZmF1?=
 =?utf-8?B?VmswOG5aSFJKQ01BM1BvYU1tM1VicU1hcENoTEpwdjZmK3JObFpUTmhqa0Vq?=
 =?utf-8?B?S3VGTXBybGNNbWo4RUprUUF6SVJ4TnFiam40ZHd5ZE9jVjRLTUZpeGMvOEc1?=
 =?utf-8?B?UlBzSjQreE85aGYvN0hPYWJtMTBuN0NZMFloWjJvK2VTRUM0MjR3TWc4QU9U?=
 =?utf-8?B?NGdEY09ocTBkQmJkMXlpMEsxaWFhblorcDM5S3B5cmxISG8wZ3RLaDloNGZG?=
 =?utf-8?B?Qmh6NWRjdkkrWDN5MTAyOVhRZHJzbVhyY2NycENLSGlOS2lKWitmbzJyRi82?=
 =?utf-8?B?VkwrV3h4M2ZVWnJ5ZkRIVVliNmxyL2dXbDJzQ1ErVHYreWNmRlh1OEhMVDlK?=
 =?utf-8?B?WHNnQzBjeFZodjMwZ0xWTFQva0NDMWZGYkJEY1gxc09lWFgwdW5jTklYcFA5?=
 =?utf-8?B?Y0FZeE9sR09mcXNlVEdMOEcvUkpsNWpHRXM5SWNHcWZmMys3aXMzeTZUUytY?=
 =?utf-8?B?L09uL015MjRxeWZ6QVJYTnUwWXlRWlh0Z0dFRHZrSDMvaVB6UzhlYkg0Z2tS?=
 =?utf-8?B?Wk84RW9sZnVtWmJ6M0E1VjFYRWh4cGJHVnlaYW1GOHM2dnJiTFJvTDBQNUp1?=
 =?utf-8?B?akw1cEdZR2cwTEwzUW5GZkdzVG04elV3L3hwb2gvQk54QXJ2akNXd3ZxQlNM?=
 =?utf-8?B?ZUZQM1N4eisvVjJJQlNtUVYrczlUODlXS1dONGx3OUZidkw2bEN3TVBmVDlX?=
 =?utf-8?B?VWl3QllRMksxVFFmTlJwa0JLY2FWeEdIVGl4SDh1ZWkrcjAyWVdnNnc3MFlO?=
 =?utf-8?B?MS9MZUF4MkFnZUdsV1U1eEpqQ3NBc2c1SEhxVEFIbWMzR2RRWHR2ZEdjVTB6?=
 =?utf-8?B?NXYwS1I3TEwxSFhuWCtDT1VkN1lEQ1NYNk1rZlluSm9IbkZWTE5LaXhHeTQ4?=
 =?utf-8?B?Uk5jbXFxVGkyZDN5YVZTQzlPTitwcGNydGdMYlNHbmJXdkFTenQvS3JIWEpr?=
 =?utf-8?B?ODgvaHJqbUxWUEZ3WlVxQkF6Y3ZEVUhGS3FaeVd4KzgzYlNxL0RGbHZsS0ta?=
 =?utf-8?Q?9nwi2G?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(14060799003)(376014)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 15:23:03.3515
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b21a22d-3853-4e88-ef1a-08dd8cb1e4ee
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8971
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 15:23:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216066

T24gNiBNYXkgMjAyNSwgYXQgMTU6MTAsIE1heCBLcnVtbWVuYWNoZXIgdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgPG1heC5vc3MuMDk9Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiAkIGFhcmNoNjQtcG9reS1saW51eC1yZWFkZWxmIC1sbiAuL2NyeXB0by9tZDUv
bGliY3J5cHRvLXNobGliLW1kNS1hYXJjaDY0Lm8NCj4gDQo+IFRoZXJlIGFyZSBubyBwcm9ncmFt
IGhlYWRlcnMgaW4gdGhpcyBmaWxlLg0KPiANCj4gRGlzcGxheWluZyBub3RlcyBmb3VuZCBpbjog
Lm5vdGUuZ251LnByb3BlcnR5DQo+ICBPd25lciAgICAgICAgICAgICAgICBEYXRhIHNpemUgICAg
ICAgIERlc2NyaXB0aW9uDQo+ICBHTlUgICAgICAgICAgICAgICAgICAweDAwMDAwMDEwICAgICAg
IE5UX0dOVV9QUk9QRVJUWV9UWVBFXzANCj4gICAgICBQcm9wZXJ0aWVzOiBBQXJjaDY0IGZlYXR1
cmU6IEJUSSwgUEFDDQo+IA0KPiAkIGFhcmNoNjQtcG9reS1saW51eC1yZWFkZWxmIC1sbiAuL2Ny
eXB0by9tZDUvbGliY3J5cHRvLXNobGliLW1kNV9vbmUubw0KPiANCj4gVGhlcmUgYXJlIG5vIHBy
b2dyYW0gaGVhZGVycyBpbiB0aGlzIGZpbGUuDQo+IA0KPiBEaXNwbGF5aW5nIG5vdGVzIGZvdW5k
IGluOiAubm90ZS5nbnUucHJvcGVydHkNCj4gIE93bmVyICAgICAgICAgICAgICAgIERhdGEgc2l6
ZSAgICAgICAgRGVzY3JpcHRpb24NCj4gIEdOVSAgICAgICAgICAgICAgICAgIDB4MDAwMDAwMTAg
ICAgICAgTlRfR05VX1BST1BFUlRZX1RZUEVfMA0KPiAgICAgIFByb3BlcnRpZXM6IEFBcmNoNjQg
ZmVhdHVyZTogQlRJLCBQQUMsIEdDUw0KDQpTb21lIGNvbnRleHQgaGVyZTogb3BlbnNzbCBoYXMg
c29tZSBhc3NlbWJsZXIgY29kZSB0aGF0IGhhcyBQQUMgYW5kIEJUSSBoaW50cyBidXQgbm90IEdD
Uy4gVGhlIHN5c3RlbWQgcmVjaXBlIHRoZW4gbGlua3MgdG8gbGliY3J5cHRvIGZyb20gb3BlbnNz
bCB3aXRoIEdDUyBlbmFibGVkIChhcyB0aGF0IGlzIGEgZGlzdHJvLXdpZGUgc2V0dGluZykgYW5k
IGl0IC0gY29ycmVjdGx5IC0gd2FybnMgdGhhdCBpdOKAmXMgYmVpbmcgdG9sZCB0byB1c2UgR0NT
IGJ1dCBvbmUgb2YgdGhlIGlucHV0cyBkb2VzbuKAmXQgaGF2ZSBHQ1MuICBUaGlzIHdvdWxkbuKA
mXQgYmUgYSBwcm9ibGVtIGJ1dCBzeXN0ZW1kIGFsc28gbGlua3Mgd2l0aCDigJRmYXRhbC13YXJu
aW5ncywgc28gdGhlIGJ1aWxkIGV4cGxvZGVzLg0KDQpJ4oCZbSBhc2tpbmcgcGVvcGxlIGludGVy
bmFsbHkgd2hvIGtub3cgbW9yZSBhYm91dCB0aGlzIHRoYW4gbWUsIGJ1dCBpdOKAmXMgcG9zc2li
bGUgdGhhdCB0aGUgcHJvcGVyIGZpeCBoZXJlIGlzIHRvIGp1c3QgYWRkIHRoZSBHQ1MgdGFnLiBB
bHRlcm5hdGl2ZWx5LCByZWxheGluZyB0aGUgc3lzdGVtZCBidWlsZCBzbyB0aGF0IGl0IGRvZXNu
4oCZdCBoYXZlIGZhdGFsIHdhcm5pbmdzIChvciBjb25zaWRlciBHQ1MgaXNzdWVzIGEgd2Fybmlu
Zykgd291bGQgYmUgYSBmYWxsYmFjay4gIERpc2FibGluZyB0aGUgYXNzZW1ibGVyIGZhc3QtcGF0
aHMgYmVjYXVzZSBvZiB0aGlzIGlzIGFuIGluY3JlZGlibHkgYmx1bnQgaGFtbWVyLg0KDQpSb3Nz


Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D4DC021BF
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 12:08:00 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.60])
 by mx.groups.io with SMTP id smtpd.web11.4532.1740571671489643565
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Feb 2025 04:07:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=PiAuynnK;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=PiAuynnK;
 spf=pass (domain: arm.com, ip: 40.107.249.60, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=LutC81Z59/SeF67VxzcbWQ9cCu3F1gpZE3XLA2Y7XLRA8UX++b49EmGJstcuMvKxZ4fenjyhuOkiijd1+EYOePL57qjpug5jVa3IbR9GlDxC0b6lYNAMI/mg7mb7rsPSSbb/OGXxLyZfvNb+yGXZWXdeSdwgEaFVl76QkI95NB9ZtZ4OE4q2SyU4zThu9o5CmzUajF4Z/BYZ4ch01zkHGFGb8tfPhk9GW7bc+xwe5tzIaIWRghBtDprnF7lKSYLAerMPjI82yySKdHA8sc5TC/jA3f+9lGlqQ/qfAHfkkgWaQSO8H3UbIDtrkOE27llQHAcOCq9C0jU6bptgG0pkqA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eddlLn0qp28fx/9I2vLo8dLG5UZB8/vNVf93NHKqwK8=;
 b=J393sAC+se6WKGdELRAbIahUc43A6fnj/jF/7EobF6OvFiYNs7jUo+3lE5UzPg5RRq47KXF0jqsipqDCuNfYn1UX6syukw2UTqgCknxgkk340AI2wayxWObQwT8R+5rebaaw+cjqmXYib3A+FNEmX+1mNECQgtD2TsafaH1SuNDoQ7W2SbzslDfZ19Edyw3/CcPASTtwRzYop93UKuXdYXTUOiAFM9mrkY5DAzogVWCVYpUQlMzFPs9w/VNLYfCS5u4xsiO//FSXjf6/p7wu9NiwaPUmdJSlyV3Ax0Frnt8N40WyLYQv7tccdIcXDPrPVjjOPAWXJF/5n3wAoVJ3XQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eddlLn0qp28fx/9I2vLo8dLG5UZB8/vNVf93NHKqwK8=;
 b=PiAuynnKGs/m7KwmI+pmoy6pieiD+2lnjCeFkRE7aNo6bLUtZVQcRXrRmgxDGUDeBcjzWjR7tE7txqiGI/rbYBYtBqMjXSVfqU56IF5yRf7RjgsJ8+aOXJzpLzzVwl4VuFvHnV1AI1+0kdRDdQsKUoVENX7+oCOMzmghbiVjm8Y=
Received: from AS4P189CA0065.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::8)
 by AM8PR08MB5681.eurprd08.prod.outlook.com (2603:10a6:20b:1dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Wed, 26 Feb
 2025 12:07:45 +0000
Received: from AM3PEPF00009B9F.eurprd04.prod.outlook.com
 (2603:10a6:20b:659:cafe::22) by AS4P189CA0065.outlook.office365.com
 (2603:10a6:20b:659::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.21 via Frontend Transport; Wed,
 26 Feb 2025 12:07:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009B9F.mail.protection.outlook.com (10.167.16.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.16
 via Frontend Transport; Wed, 26 Feb 2025 12:07:44 +0000
Received: ("Tessian outbound c3a902884497:v585"); Wed, 26 Feb 2025 12:07:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dbbd2ab7568d6e8a
X-TessianGatewayMetadata: w7wqRG8e3X6LmdSJaFcSrlStvxvsPVi7hVQ30ztGjVicOPQkKdmc3XwSqJBR8QgKSRDD88BZ8jy3Dx4nRM+I9cc1bOrumPcGpfgprQwpfe0nLBwpU4tDEPYJj71tJDygt2JdNXeYDizPv7jb5hG6IC6CEy5qzfyqgK0UcsNvKjg=
X-CR-MTA-TID: 64aa7808
Received: from Lb7cdb6d5f65a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E81BC33A-B175-4996-A7A6-491BA2ADB614.1;
	Wed, 26 Feb 2025 12:07:38 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lb7cdb6d5f65a.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Wed, 26 Feb 2025 12:07:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jSZ51bl/Ha5zmGMzU+hgYxQn50EICwyKhNmcD49/YPOwk90bwoY8xJjfUfEWeN7aFAKwK1tCxcvKnCmpWHI04Ko/lIaMEJNMu41RWcmSvXzNo0cTcGCglA/k1B8QnnvTbRntZSRVROVGIrnw1witnlK8xRECRP2JK4QvT8r8GK05JGxZJnHYGLu5kuo5HLJ8K0BFko6VnowZf+QLFZzLG7kHK2BK1D+U12ddwyoaBUIj86q0zSpsXk9HKMiqLaZa301KXJRHb6EvnW2Ay55HnTaxA4XlFrOyIq6jRWreV8gZkyX474V5GXjVOdkF2affNhMPOjxTg/aoorwYWut5qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eddlLn0qp28fx/9I2vLo8dLG5UZB8/vNVf93NHKqwK8=;
 b=D599vYBFV2SRgGHvrrY6S1KJ0b+uqH0iQ5P8C7BEETPt4+sHeIc4NwSYT+HYwRuZ8/Uu9WbIuLLJ1S0Avbe5qb1pZhRrgygOdeDIxT46PXSlPbp2P3xd6X4WENgNAGDyaWs5LWvJRC/0GEpBlZ/7E9/WN/qILJ3bZWbxWX2NeNxHhA6UYuDzLBj00WYCAIh3EqWkmQrPBXfN7Z23j3mF0Hd9bimARhjSqfhdxif/cugD3zFoo7HzTXjz8Udeufc1nudGC6cQRL2kjV9MkXZ33aSTcpbuNEOaNfdVsn7HYzhDRcPMgY0c+bufvk5n5Xkck8sDpDI+11fPU/QoRPCFNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eddlLn0qp28fx/9I2vLo8dLG5UZB8/vNVf93NHKqwK8=;
 b=PiAuynnKGs/m7KwmI+pmoy6pieiD+2lnjCeFkRE7aNo6bLUtZVQcRXrRmgxDGUDeBcjzWjR7tE7txqiGI/rbYBYtBqMjXSVfqU56IF5yRf7RjgsJ8+aOXJzpLzzVwl4VuFvHnV1AI1+0kdRDdQsKUoVENX7+oCOMzmghbiVjm8Y=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBAPR08MB5637.eurprd08.prod.outlook.com (2603:10a6:10:1b0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Wed, 26 Feb
 2025 12:07:36 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8466.020; Wed, 26 Feb 2025
 12:07:35 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: The new oe-core patch review calls
Thread-Topic: The new oe-core patch review calls
Thread-Index: AQHbiEcFcmMK/BERiEugoidcBxDn1w==
Date: Wed, 26 Feb 2025 12:07:35 +0000
Message-ID: <C152D2D9-A5E2-4599-B89C-009747B4BC3D@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBAPR08MB5637:EE_|AM3PEPF00009B9F:EE_|AM8PR08MB5681:EE_
X-MS-Office365-Filtering-Correlation-Id: 03675024-9946-4c44-0b07-08dd565e2d87
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Y2ZPWnhRWHNvK2s4c0N4K1pRaFEyV1RqOGh0QWk4QmJ2WVJvVkVnemU0SUJs?=
 =?utf-8?B?TEVTSVMvalVndFJ0OXphNEdUK24zOXF3ZXY5L3Q5eGxhQkpKZXZUeGVzOTRX?=
 =?utf-8?B?bGJyQTNxSzNqK0c3MW5VNXREK2FnWS91WWIxalRLVnhuNG5mTFZKRmQzVUhX?=
 =?utf-8?B?bk90UVh1Y2dyYzJ5cktyOExtRVB3Q1Q2My9zWEY4Uy94SUQ0WjFTcGdrdmtm?=
 =?utf-8?B?ZnZtbjdIOW1VTmZ5QmxjVjRnWVN2ZGR3VlFPcVQ0T2JxMW02eXpIQTJES094?=
 =?utf-8?B?dzFPeUh3WnJMQ2tYalowUFhxTDI4VmxldzhwYkEwRm45QjNTZEJJZnJIZmNN?=
 =?utf-8?B?dUFtOGhNTGdMRTNka3ZlZEJWSkxSQm1BMENkajd3cE5YMHF6QndxMnNHc3NZ?=
 =?utf-8?B?QUt0c21ESFFMSzBEUnVzdmFvazNmWlpvVWh0Ni9hb2Z6VnFnWldDb2FlbEh5?=
 =?utf-8?B?eGlaYk1XTGJZbkZ4V1FPVTFpOTgydncxNmwwaGZYMFdTVHRkOEZJNngxVjcx?=
 =?utf-8?B?bXN3cXlEWndZd01WczdTWHZYcGVPU2Vja0lwSDRjTC9NMHBtZDlaQUwrVUVz?=
 =?utf-8?B?bjVvTCtNd1F3V1ZKTUJFTVVSVzdSVWc0Z21WWWl3c3lTVzJzNzBoSEFDL2sv?=
 =?utf-8?B?S0h6NXNQN0hOL1Nwd3JiVXBDYTh0RjZ6eGdjOWN6eitKNXVhZzNHRkRnSzJ3?=
 =?utf-8?B?Wm00TXhHU2tVOU12WGlhVDRxN1FOUFVtTjFMOFkyUUhMWVA1bEtTK241OGF3?=
 =?utf-8?B?czlMTSsrMUNOcE9hTVhaK05yV2ZSaEcyYUZIOWxRSXFudUxheWUrQ2FVcWNK?=
 =?utf-8?B?TlQ2alNldFA4aDdzeXhDb2Q5bkp1dkhzVk9SK0Y3eEt4QjVJVFE2dHp0OXZ5?=
 =?utf-8?B?QTB6WlBHRjR3NjBDd3loNGV0elByVkVVVC92eForNXZibStyZG45ai9zanI4?=
 =?utf-8?B?cVFKUjhGYmR0ZEFLREszZGlYZExxQ2kyZHhSNTZ2R2RRR0s0VWFhREtaZEFU?=
 =?utf-8?B?WDdUOWU1ek9pb2syWUVLYk1QNDFQSWxCejlrSkNJb1NQZE4xc3FFMW0xRGdJ?=
 =?utf-8?B?bm1lcUlFS2VUSXNXd2dma0JwendCaHp3ZjkyY1M2OUp2REdMZHhmQ1hPY1o2?=
 =?utf-8?B?enJkTldKazIrdG5ybldWcEN4WmNrN3BoM2RoSFUzMUNWK3lpODlxb01sYmcr?=
 =?utf-8?B?RmVKOEp1SGlldXlKbVArdWVoNDdNY3hIbTFURkhDWWhVaWpJelZSbXVMWGo1?=
 =?utf-8?B?NVFaRXJWUS92SmVmeVZmTGMrSGtkMnR3aFMrNGNOMjZlWDNtbzNqb0hocE1U?=
 =?utf-8?B?cm5WZW5ZSm5qb2k5WjZYYytrcEJ5bDcrRXhFam1vdlB4dzE5T3h0aWpjbFNt?=
 =?utf-8?B?T3o4ZnhjVVlqb2RTSWhyd2NQazYxbEswOHRVd3VSazBqclRUMTlUYVJEV2ZB?=
 =?utf-8?B?aDFYa0x6YVdiUEZkMXpKQlFNcFdnd0ZNbjl1UHlXK3FoOTVXak1Gc05nMU54?=
 =?utf-8?B?UVNKVCtrbUlUTi9QSGtFOTZFdWtMY2dXRTlNMTlrdGljN3c2aEowYVFHN1pM?=
 =?utf-8?B?aHJGTXc5MXlMSFdMY0Zka2JKWFV0S2IwdThvTmdBVk1qL2kzcHVFU0FlQUhX?=
 =?utf-8?B?c3JHWUc4U3Y5RmIwdjd2dk9xZU16NlFPOVBmZldaUkcxTUltMDlTSWNkd3RM?=
 =?utf-8?B?eHdLQXRPOXlGekZLNURLUzBWRTZSbHEyS3dISVhLRmdVZUYzYXlJcTBZNmtu?=
 =?utf-8?B?Zjc4UHk1MnoxaHdURjg3ck5Tc2R0K0hLSFV2YmF2N3A2d0RrSHhWMmR2RVhx?=
 =?utf-8?B?YXV4bTBWUWxsdy9CNVVLR1VoL1FLMWw2WTRTQUoxL0QvVTduZnFsNGZQcVJj?=
 =?utf-8?Q?Vye+919D/JRYE?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <ED71E7994FF43844BD96ABEF432DF53E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5637
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1be9339e-c0a1-49bf-2025-08dd565e27f0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|35042699022|82310400026|376014|14060799003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aXhNcE83aVFzU1BtUXAxZE9TYkJjM2k4R3FqS0tVbkFSUTcvTlc1YXgvVjdi?=
 =?utf-8?B?SEZSeUV5b0syazY1dUpEbE5wVVk5NnBad2NNaVVzWWpPT0ZvQ3NLSUplTEJB?=
 =?utf-8?B?L0haVkpNTVJyMkxTVHE5MlhxNnpqY01pWFFLSjY3NW10aEVWRWNsWVVpUllW?=
 =?utf-8?B?cHAvZExTWWZKMjJzKzVjLzBaQlF1MmZpc3paQWVhNStmcjBoSnU0YUNYNit6?=
 =?utf-8?B?WEx0azZQVU9sTkdXakxWUHJCVUZtQmhYMVZzNEVSZStadGcyVFkzNllRbGZP?=
 =?utf-8?B?b1I5SnJuSG9aRUMrZjBFS1dlaURMK1l4eExYc3pycTFDSGo4U1h1aVpwSTUr?=
 =?utf-8?B?a2kzSkwzaC9oa3FtVlhZV0YvTWxHVnpDS1RydG4xUmRnS1lUQ1o4ME05STlr?=
 =?utf-8?B?aThpdXVsUFRoYXA3U1h5MEdnUzJnMmNMSHkxNHZnZHU3emxtWTdkRW5ZMFd4?=
 =?utf-8?B?SEoyeHowRGY0ZC85VWRYRGdkZm55OE1mNGVpbllDTTkyODNEQTlWckRuYUZJ?=
 =?utf-8?B?UlN3YzJ3b3FkQ3NGQy9LcFN2azhRUEc5S0I1S1REMTFxMGxZRVIxUWdES0VI?=
 =?utf-8?B?WXBndm9KNHEvUTFlRGp2WTk4VzlJNmtTblp2Nis5ZC9jOW1DaGdvVlFqNG9E?=
 =?utf-8?B?dStkVGQ4UzhwNC9HU01CT0dmUnJGSndRNm9mc2NqQ0VBRVI2eEVDTXlLWjdP?=
 =?utf-8?B?T3BZMmF0bzVIM1NaTGp3TUFYU05SY1hZeU11M2FwcXVDNVNuMzcvZExWVFRO?=
 =?utf-8?B?TUtrTjhHSHh4MS93bXpaVFlIZTBRVU9JSHdmY0NxR2pwN2VjcTZrZnROZEFM?=
 =?utf-8?B?S1YrbElBYkVndk1zT0NyWDVxUjFyQ3lVUjY5RTFlV2MyR0ZQczJFdnZOTHpp?=
 =?utf-8?B?enVJQjFjT0d0c00wNmY0Qmh6VTBjZHlZT3MyRFRWVU1VSnF5RjcyT3ZGd0h6?=
 =?utf-8?B?KzN2UXY5YTRxbCt3MllkTWcrTkxCWmV6bG1pTjFDQzRwV0tCcTZKQlZQNnFC?=
 =?utf-8?B?TldsUmhNWDJNZUIvVE1WK3JIYmVRY1ArRitxVy8zYnBvYm14dGdXS1V5ZGd5?=
 =?utf-8?B?QlpxdTdpUkRQNlJTSVY5ZUFQYmNRNDF3TVltcXplRmhmeXU5WGtCblJ6bTJ3?=
 =?utf-8?B?UXJsb2lsWmdqZE54dUdIMEQwSmpaR3h1ektKMDlKb3ZGVVA5QTIwa0NvVWYr?=
 =?utf-8?B?T1BwMWRZd3pmRzJtV0c2aEkwZE0vakNPZkhPMDhNR1pyUjZoL0EzMkd1UnBU?=
 =?utf-8?B?Sk1uOElmSHFydTVYNUxoT1dMaWFIejFFc3k1TVhwRHZQdlk1b3FpRDNjT3gz?=
 =?utf-8?B?MnNCZEhNZGNqdkJrcGZyVzlDeUtpcUZRd1NtcVNkN1BONG93Q0hGZ08rQzdq?=
 =?utf-8?B?RUw0S0hJbTJ5K2ZNbFlhdEVUdzdteFgrSUhhTy81ZTdtV2NNcUJYZmE2VkRH?=
 =?utf-8?B?LzNsSFp3ZThkSVlqZi9jZHFWeFdrR3IzdElybUdxSGE1R3JMVkoyanNRZXdh?=
 =?utf-8?B?MGFta0pkL3RsVDBwWTR5WXAwNTVVMXIxMzRDdWFXSHo2TlhPWXFqWmlaNUFn?=
 =?utf-8?B?eHhLa1hVVC9hYWJPZGZiT2hDWGJ6TWd2aDFsUXBxaFpsNkZTa09nZ1ZiNHV1?=
 =?utf-8?B?QmsxRjVISjZjYkYxV1IvcnVDZXJjZFZNRElMbXpzRG1LWk9CSnNnVFd5YUhC?=
 =?utf-8?B?RDVYNDk1b0RpaUN3Tkk3TVlZMEw0ejBuUXRueHlXVC9NaTNmZU5vcEt4UkdR?=
 =?utf-8?B?R05WZ1N4d2czemk2VFFXQ1JwWXJENjJQb1RVUUp4K1F1bDFXRGVGdzVIbkVl?=
 =?utf-8?B?LzVKSWxrNlYzWGhOOTU2ZnNDRTRlbUpYa0J6bmlCRXA2a090OWhDN1ZQcDFm?=
 =?utf-8?B?NkFpL3p1Y1FYMHhack5tcVhWZEZnRWpQeUdyYjErSGRaZE00alg5OG4rV2VS?=
 =?utf-8?Q?d2iXDXdhJ6a/Bi884eJhAp1PpUgGjPev?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(35042699022)(82310400026)(376014)(14060799003)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 12:07:44.6749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03675024-9946-4c44-0b07-08dd565e2d87
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5681
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 12:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211952

SGksDQoNCkFzIGFueW9uZSB3aG8gYXR0ZW5kcyB0aGUgd2Vla2x5IGVuZ2luZWVyaW5nIHN5bmMg
Y2FsbHNbMV0gd2lsbCBrbm93LCB3ZeKAmXJlIHBsYW5uaW5nIGEgdHdpY2Utd2Vla2x5IG1lZXRp
bmcgb24gem9vbSB0byBkaXNjdXNzIHRoZSBjdXJyZW50IHBhdGNoZXMgdGhhdCBhcmUgcXVldWVk
IGZvciBvZS1jb3JlIG1hc3Rlci4gIFRoZSBwcm9jZXNzIGlzIG1vc3RseSB0byBzdGVwIHRocm91
Z2ggdGhlIHBhdGNoZXMgdGhhdCBhcmUgcXVldWVkIHVwIGluIG1hc3Rlci1uZXh0LCByZXZpZXcg
dGhlbSwgYW5kIGlmIGZ1cnRoZXIgYWN0aW9uIChiZSBpdCBmb2xsb3dpbmcgdXAgd2l0aCB0aGUg
c3VibWl0dGVyLCBtb3JlIHRlc3RpbmcsIG9yIGEgZGVlcGVyIHJldmlldykgaXMgbmVlZGVkIGFz
c2lnbiBzb21lb25lIHRvIGRvIHRoaXMuDQoNCklmIGFueW9uZSBpcyBpbnRlcmVzdGVkIHRoZW4g
cGxlYXNlIGpvaW4gdXMuIFRoZSBtZWV0aW5ncyBhcmUgdHdpY2UgYSB3ZWVrIHRvIGVuc3VyZSB0
aGF0IHdlIGNhbiBoYXZlIGF0dGVuZGVlcyBmcm9tIGhhbGYgb2YgdGhlIHBsYW5ldCBhdCBsZWFz
dDoNCg0KLSBNb25kYXksIDE3OjAwIC0gMTg6MDAgVUsgdGltZQ0KLSBUaHVyc2RheSwgMTA6MDAg
LSAxMTowMCBVSyB0aW1lDQoNClpvb20gbGlua3MgYXJlIG9uIHRoZSB3aWtpIGF0IGh0dHBzOi8v
d2lraS55b2N0b3Byb2plY3Qub3JnL3dpa2kvUGF0Y2hfUmV2aWV3X0NhbGwuDQoNCkhvcGVmdWxs
eSBzZWUgeW91IHRvbW9ycm93LA0KUm9zcw0KDQpbMV0gV2hpY2ggSSBhbHNvIGVuY291cmFnZSBl
dmVyeW9uZSBpbnRlcmVzdGVkIGluIGNvcmUgdG8gYXR0ZW5kOiBodHRwczovL3d3dy55b2N0b3By
b2plY3Qub3JnL2NvbW11bml0eS9nZXQtaW52b2x2ZWQvI3ZpcnR1YWwtbWVldGluZ3M=


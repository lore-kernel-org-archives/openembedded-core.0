Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40749CCF9F0
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 16:12:49 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.47])
 by mx.groups.io with SMTP id smtpd.web01.9454.1761754364300964167
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 09:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=A/P1Queu;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=A/P1Queu;
 spf=pass (domain: arm.com, ip: 52.101.65.47, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Uo3WIEFdFiz/b235pWgIuJ0ufA+F1clTZeirr1zqJQJrX93SnMjOQLUJXP9GXYM/GWF8avbiKd+jHkM6VNT8sMEJMaalG/o8sl7QM5suh3H04SXnF2IXRvkw8XtyTB0VzyZuAH79ct9IBt5eLDHiSdpEFfy49v5HSXBmnamgpg65iAWzIdq6sjHR2Qpt7DYrBg+SLoozbSY1wEiBhPG0cfIelcKKjmssrw9/OmwbrUvdN1f+vjtu9WD6u2sdh3ZQlE6EwQkOClifDhWn26PeuFatJ8cNW6FwdrNjX2BWvLayrAT/TegMFvxmIQGRMZ0sIyKZGS8GvgVmD7zk7lgvJg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URN5GAnWy3jia0vv29arPevNp/rlB7SUf9M9BvLq81o=;
 b=m2KdNGby9XIQNovyD4VlvRKRZwzZd2fERf6DReLZSLksmiJwgUOVtPnbOk7Cs83EzrbY4a7ResKblClJeX8Py7WP3AgV2E3K4T57le90FnbhsP6rz8JXaGVlFBb19nZ2y3ju6h1fweZ+lsleMQQv0PRgOb3ggzL8He1L/Yloy6zIdX5780s3NW6lzkqd8gkoszw06ML01q2uTrta14RyO864/dbpNZ6t2EBe/lnPJ7LM4nAq1gYqhr39EkbsnAp7bATa+Czf3n/XCh5mvLd+VsUATQhb8sb+bNM5ao6foIVUkBYL5YoZ8P4W4NAaeUG61Y9GlDQa2pg1S6ETXGh3Hg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=mcrowe.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URN5GAnWy3jia0vv29arPevNp/rlB7SUf9M9BvLq81o=;
 b=A/P1QueuPaeOa0aR+441vR8Ef9jtB3WfU3D188OYYynR+p2tG/lFfjTotf6LdCiYaeCnfDwVmJfrkLGzRuCeAhkzA5kAii8tIRCG+e0xsoqwwieuNp6WQVjMjA/Xf6TTgWC8Ysno9oqpTf1r+510K7HQeVrDAHJhe5fltYyktTE=
Received: from AM0PR03CA0038.eurprd03.prod.outlook.com (2603:10a6:208::15) by
 AS4PR08MB7632.eurprd08.prod.outlook.com (2603:10a6:20b:4cf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 16:12:39 +0000
Received: from AM3PEPF00009BA2.eurprd04.prod.outlook.com
 (2603:10a6:208:0:cafe::5c) by AM0PR03CA0038.outlook.office365.com
 (2603:10a6:208::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Wed,
 29 Oct 2025 16:12:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009BA2.mail.protection.outlook.com (10.167.16.27) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Wed, 29 Oct 2025 16:12:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sC/gFSOZmhQX33tX0xrih9SyZEf6qUroJgWNzjV5saksmqobKEvoOI7cOU0pOnrT1gPHgqwLid/D10Z3Ds9XRfSW6pmh8Ya4eLhMt2QAURUz/f8d0LGAhAPj8/8vrBPDUMd6bm8nIjxK/i//YHpyMTKH/N93NVIB/cWm0pRR5zIIMTD/VCnjT4yE9DYhLx1g1W7j7ygV/WzGup3b+YfXHtwzsMYAWmXv9DwOioFsK7uqthr0PSXUv7ow7tZ9TAksPCmtHEV0XEJK+eQQyHqrAMGrkulYM/GJ45ui/Qn7Wz+PlIYvOEY0jNFZx+kbrq49HE2/y82q+1Rb8pMYMR6TTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URN5GAnWy3jia0vv29arPevNp/rlB7SUf9M9BvLq81o=;
 b=jdZ6iXLi2rDc3yDL01CpbSWykumNtqnQPsh9PzQlIvaMJZClHd8fmERHSYxiTGRmLiuel/1OJE3ks8gRUFqffvXICDMqVg8+2BMfc4s9hR4JBBbLmRCdqDy2R8i8wUjjhuyG56GDFBdLX79wCtD7BhSxGE12FZ1koFOrVzxY1+Hat7zEko3UareJ3a7toxoQkG1uHknTZtXSbYXU9GWLTjFTq9UtMRY68s1migLUK+2XFGF3BFhwYTNa+H0cH+BUCF6JmGIl2qS6TEOy7E4aopgVvr5JZgugd1ooPTcgdAWi+Sd1dLp8jCgoMQ7Z3AtZRTe/Q9AOIwVoAjNeHVFydQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URN5GAnWy3jia0vv29arPevNp/rlB7SUf9M9BvLq81o=;
 b=A/P1QueuPaeOa0aR+441vR8Ef9jtB3WfU3D188OYYynR+p2tG/lFfjTotf6LdCiYaeCnfDwVmJfrkLGzRuCeAhkzA5kAii8tIRCG+e0xsoqwwieuNp6WQVjMjA/Xf6TTgWC8Ysno9oqpTf1r+510K7HQeVrDAHJhe5fltYyktTE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB7995.eurprd08.prod.outlook.com (2603:10a6:10:3e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.20; Wed, 29 Oct
 2025 16:12:06 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9253.017; Wed, 29 Oct 2025
 16:12:06 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mac@mcrowe.com" <mac@mcrowe.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] multilib.bbclass: Filter ROOTFS_RO_UNNEEDED to
 fix uninstallation
Thread-Topic: [OE-core] [PATCH] multilib.bbclass: Filter ROOTFS_RO_UNNEEDED to
 fix uninstallation
Thread-Index: AQHcQdtCg34/H9v7Q0iXqc02RowLE7TZWccA
Date: Wed, 29 Oct 2025 16:12:06 +0000
Message-ID: <B79775E7-9442-4E1B-9F4E-A26353ADC746@arm.com>
References: <20251020160353.413127-1-mac@mcrowe.com>
In-Reply-To: <20251020160353.413127-1-mac@mcrowe.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB7995:EE_|AM3PEPF00009BA2:EE_|AS4PR08MB7632:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ee56582-d517-4b8b-8ac7-08de1705fae5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Ti8vZjJzZnJ6QXU1UzNFMHFSSjhyQ2R3eTN0dExYR0x5VXg3aWJlUWl1OGZ5?=
 =?utf-8?B?NHMydHh1YUpNWkY3L3VLYUMrZElOTFBLUFpuK1YxaUpUNjhwbmhaNThHbnda?=
 =?utf-8?B?WDF5UDhhZVlQbEFXc3RyN0k1MjBQbE5rWWw3SURZa3JTZnhYZlNtd3NJZElz?=
 =?utf-8?B?dzJIVmNlQ0NZQ0ZJTTNMNlp2d256VWlVVys4TjF0MHU4eUdBSTdEVXJvc09v?=
 =?utf-8?B?YzA1U2s3dGdEbkl2SURLR1NRbGhybEtEVUJ0T05LWHFIZkRRM2lkdlBrYU9x?=
 =?utf-8?B?TkJZNTh0dDlkdlRDQVYyeFgrQlFRdjFsdmZSK3p4enp3b0FRYjF1ZWY5WUY0?=
 =?utf-8?B?ZzBpSEJjWWxQd2hPMHNROXFVUU9iYUtHYVVjN1Jyb3NyTEQvQjJWOEpSbDZL?=
 =?utf-8?B?SnJXOFQ0N0l6Y1hMSGJVNWptcTFvaXZSemNBU2ZLaTF0N25wRVQ3MWxyclB3?=
 =?utf-8?B?M2sybXh0VkxWMHQrT2owU2IrWFFHYk9zRnZPRThsMTFFNmtiMXQ4NHdDVWEr?=
 =?utf-8?B?cUphekpQRTd6c0lQa2MwR1dIUUVCREJDRlpJU1IrTGVPNjlwUkhrTkw2RUV0?=
 =?utf-8?B?STJoRHpKSStiZTV0QU9jZkFZdmdOUGFac1V3ZVdNNjNtbzlrcVVadFlLOVhL?=
 =?utf-8?B?akluY2cwZGpTYm1hdEp5cXhBU2J5aTNNeDVhdmZnWkxZRkJDYUxNNUxwdzN4?=
 =?utf-8?B?cDhiakRjMU9zUVBHUm9sM1ZzQjJGUmkzVzY4Zzl6SUJkNmVYcXBKZTRMSCtr?=
 =?utf-8?B?ZG1rVmhnM0dKaXF2WVdONFJTSW1XK3IrclF3WHc3UVk0SEFJa3RqSVRUa2Rp?=
 =?utf-8?B?REUxWlJuL3dXNXduLzB4M0xXY3BuQnFwaDRCY3BKSVlqZFRGYUNUa3VTK3pN?=
 =?utf-8?B?MG5yUUpxdDFNVXpYeVVwWGJ0NE5SdFMrZ0lHTm42WnFFV01QZnR0ZEZSMUdq?=
 =?utf-8?B?K05xVGhGVncrbHlwaVJGY1RnN0ZjNmZpT3ZyZVBSTGxDQjI0KzdMRWNuS2NT?=
 =?utf-8?B?engzS3hodmNobFpiQXA0MVVuRTBaUTM2U1VoaDVGSXZZblgwcWJ2WERZK000?=
 =?utf-8?B?UWM0d2N3RWZtcVhtY3NENE1EbzNzcmFUTCtqSVlCdzZESUszZ2U2U0x3MDN2?=
 =?utf-8?B?aUNxNExYT2Y4emRuN212UERhb1BmaGUrVU9PY0cvTmNzOVpMWFM2dGRLRW9R?=
 =?utf-8?B?RVJ3dENzQ3VselZucnZCODkxUnNDLzQvU2NxVG04T2s4T1QrVzlTbms3UGxk?=
 =?utf-8?B?R202SGpLZzBYMDJrbXRSU3NiYmtNZlJKT0JRSmVzaHNnOVMzUGI3Yk9udHh2?=
 =?utf-8?B?SHczNUZ3RUg4Z2hTSGlPT3pXQjZOSjNTYzdXM3AxZ3pTS2dLek5WWkJnb203?=
 =?utf-8?B?SXJMMWFySTgvaHkwR2lPZ0JOZVdnbWNwVFNKL1ZsUTZ1SVhsTjR4OEpIZEtI?=
 =?utf-8?B?N2ltZStEeDdORWwzMlpWOFAzYkViZzNoWUNabVFyR2tNdndBYXhjVVlsRzFI?=
 =?utf-8?B?N0JtcGNjSkZiSzlKa1UxK01IS0k0SXpXVXBybWtXZGMxa1pKNjJUL01CaUU0?=
 =?utf-8?B?SmRTK1pYcWtmK0czRExQbGhYWGV1T1I5bjFCSVdVTGsreEEyenVwR1FjRGJH?=
 =?utf-8?B?TDlZNHdQYUVSYXlQVWNWL2RhdWxkM3FWYWJFNlNkMVlJdGp2bjdGeDJxUlpB?=
 =?utf-8?B?ZUNobG1hT0x2anBNTXJqTjdLZzJLbSs1QzBtT3NYc2ZodFZ6NXQwK3hPa1h6?=
 =?utf-8?B?RWdzd2YyTmVsVDM1djRtdXl3TllTZnFzd1E4RTU2QjBtOVJUdHFQU2dDTXFn?=
 =?utf-8?B?YWRVU0FWT25NQ3hmL2UvdktGeUlZbW1NN252bGFYY3k0aHBmZWV1YitPRWh4?=
 =?utf-8?B?YTlQeTlNTVRVbjZSRjZKU0Z4RkZhQXgrZlN1QnlsTlJ6dHlzTDh1emhLNEQz?=
 =?utf-8?B?NUVMTkNLQ1dMa1Z6Q3lvRjN6NXFrUWpwSTg5V2xHN2hOdE9OVHp3T0V5STFo?=
 =?utf-8?B?T1RDazBOYjMwQnBVNFpHYTgxNXk4ZVRtZzNnVUVjUTBmUy9vMXVHSk9FRnFW?=
 =?utf-8?Q?6W+knp?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F2E1ADFC6E840C489F446CD7B77C4103@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7995
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0246ee01-d8b7-43f6-1dca-08de1705e7bf
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|376014|82310400026|35042699022|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Sy9CRHc2ME5nZk1Db1VWemtKUEFMVWZ2NDJCWUMvQldVMWNwVHZiTVF5Zy9Y?=
 =?utf-8?B?dU9GY2tjRStZUnBQRFA4Mlk3akFYRkZmNEZZU0hzaUZHbFN6MGwvY2ZFeWpr?=
 =?utf-8?B?Y1NDTHVXQVlVakdVb0JaTUQrdzg5Rks0Z005VE9MTW05R29TaEFESzdidTdB?=
 =?utf-8?B?cHk3NHBtQkpuYUx6R1V3enFKR2ZZK1V5TlhITGl1cUJPNHB6M2svQkVJR2NN?=
 =?utf-8?B?Q3VrOGRnU0ZlYTQ3aVlVclJ0dUoxNkgxdHBVZ0N4MytDVFc0RTZmdThHUWVp?=
 =?utf-8?B?M1NaR01yZ3I1L2VhcUQzWFNub0dORHJzVEFWbTY3Sy83ajBQcXMzVitsbDNO?=
 =?utf-8?B?dWdsN0FNekZVaEVZTHpXWVFwMlVjcm1JZ095TnNHWW5oM1N3c1BHT1A4Tmt4?=
 =?utf-8?B?Wjl4bVhKUU9nRm54K3JyYTlxcUVYN1hRNFVLdDFEb09lSXNXUHE3RytxR1JH?=
 =?utf-8?B?U093MDZla0RqeXVPMHRzeHZ5LzZkemVDb0ZsQkw1ZDM3RFdnamJFR2xvd3BG?=
 =?utf-8?B?T0FWbGJsMHVxMTVDSThqc2tRNXZ3aW0wbkVCUjNWMFcwQ1ZMNnRGY1FzQnQ4?=
 =?utf-8?B?OWtqVkJxbGU3eTh4YXhQNHQ2S3ExYUQyQS8rSGhEazJCMG5jcjZGQzIyRUNw?=
 =?utf-8?B?Y0Z2SGgwT1F4a28rNXRqdTFXaXBBSDg4T2RLMmo5ZGtMblE0TDdjdjRScmtU?=
 =?utf-8?B?WWZmdFBoQjFyTWY5bzJ3RG5EeWtLT2gxQkhOOFJVdkU3WGVtV1VxdVZldUhL?=
 =?utf-8?B?c1ZvQkxFWUV3cE1zRTYvRG0wMmlQcU9lM2d0ZTJXRDZzZmFVcU5vRlJ2L0x6?=
 =?utf-8?B?UFloSEdRaFdFUm1KUENodkRGeTgvOGUyNzhXWnRTblphOG9GOEtLYkxXbG82?=
 =?utf-8?B?d3krSzN3TW93VW9GODJQT1Vic201a0phYXNWUnNYMDFBM1d5TXJGZFNiRGhj?=
 =?utf-8?B?ZkZaelNPVysrZ0JyQ1REamtCWnRYYlg5WVVrQ2krUVJFOW1WUFlycGl6UWxa?=
 =?utf-8?B?KzkvSTM4VW1kU3lLQ0VqN1cyN2x2a1JIcis5SGF1b1ZHdE9wdFQ5RFluT3da?=
 =?utf-8?B?K3lWWVZTSFc1L2RlS0pqbC9SMm4ybFRpamtobE1lNUFNUzZoYmxlYWN4ZmFF?=
 =?utf-8?B?THU2TTJMK3FibUJMenVaL0plVjJGRFF0WkJoYTdEQjBhNnA3TDhiV0ljNVN6?=
 =?utf-8?B?b3NlQXRUQ3pCMEViV2V5NUNtS3dWaDdCMFc5Q2VBdG00MlhqbSs2WXgvb3dF?=
 =?utf-8?B?VVJhWGIrenN0N0xzYTZuQU1WcW1ZdWdBUEFnTVQvcmpINmdPSjlZSW9IeWta?=
 =?utf-8?B?VVFURStpMEZuZFg1MC9CZ0NXVmNyZjZGMzJQTW40RDJVRUxQcVdzZXY0Vjdy?=
 =?utf-8?B?SVpKaWxPL01IOEUxRks2cTZ0TXhUYnJIbzd3U0NBWFFKQXhLTk1OeXBmRDJR?=
 =?utf-8?B?eXBNdDNGbnVKcklQOFAwUEZKQk1LMjRGQTVzbTIzOTNiZHZkS3lMODlYTjNy?=
 =?utf-8?B?ZGhNekhkaDh5dW9qMFVXT3NNS01aQkdadi9pRVZKaDlMWUlNbE56QWxXUEph?=
 =?utf-8?B?Y2J2QlhhTHNkdGNrR1BqMTFyOUVZem5UWG5VL1VVNWVBSUw4NFpvaGVUajNu?=
 =?utf-8?B?bnNWUUVZVUJycWNlYkp4OEFKNVVYSEthSFhsVm8zclY3NEZyalJEbktjQU9W?=
 =?utf-8?B?WEFmZFN2aENEb3RqZ05IZFBOeWpTa1A1dE51aHZCeVBzdkRxQzlEUjhKdWxr?=
 =?utf-8?B?K2x6SittQkErYWVEVnl2M1dHSjhrK3NJZFI0dDhWdnVpSlNVL0hLNHhhb0pR?=
 =?utf-8?B?clNFckNkenVGMUVDeVNsUldFaWEvelJSdXp5RDFtbzVDcFExbkNQeHBZWk80?=
 =?utf-8?B?d0JWMGk4bisxWVVFRU03N200cHVLTVlwNEQ0TFBYNGVVNnEzNEZDc1piWWNK?=
 =?utf-8?B?czFnQW5McTJYRWZyalErcmpCNEh3YU4vUFJOaTErcHRoNGRheXAxZ0FFRnQv?=
 =?utf-8?B?T0FkSzNzM1VmNkg5NXBoV0VEdzFXcUhsSEdZQ0dDWTdhTU55bVowanRYazZ4?=
 =?utf-8?B?N2dqT0F3dHdrQkptN2JQR01YRUVwQUN6U2NWQT09?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(82310400026)(35042699022)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 16:12:38.4407
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ee56582-d517-4b8b-8ac7-08de1705fae5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009BA2.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7632
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 16:12:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225460

SGkgTWlrZSwNCg0KPiBPbiAyMCBPY3QgMjAyNSwgYXQgMTc6MDMsIE1pa2UgQ3Jvd2UgdmlhIGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcgPG1hYz1tY3Jvd2UuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiANCj4gRnJvbTogTWlrZSBDcm93ZSA8bWFjQG1jcm93ZS5jb20+DQo+IA0K
PiBXaGVuIGJ1aWxkaW5nIGFuIGVudGlyZSBtdWx0aWxpYiBpbWFnZSAoZS5nLiBsaWIzMi1jb3Jl
LWltYWdlLW1pbmltYWwpDQo+IHdlIG5lZWQgdG8gZW5zdXJlIHRoYXQgdGhlIHVubmVlZGVkIHBh
Y2thZ2VzIGluIFJPT1RGU19ST19VTk5FRURFRCBnZXQNCj4gdGhlIG11bHRpbGliIHByZWZpeCBh
cHBsaWVkIGJlZm9yZSB0aGV5IGFyZSBjb21wYXJlZCBhZ2FpbnN0IHRoZSBsaXN0IG9mDQo+IGlu
c3RhbGxlZCBwYWNrYWdlcyBpbnNpZGUgUm9vdGZzLl91bmluc3RhbGxfdW5uZWVkZWQoKSB0byBk
ZWNpZGUgd2hldGhlcg0KPiB0aGV5IG5lZWQgdG8gYmUgaW5zdGFsbGVkLg0KDQpXb3VsZCB5b3Ug
YmUgYWJsZSB0byBtYWtlIGEgdGVzdCBjYXNlIGluIG9lcWEgdG8gdmVyaWZ5IHRoYXQgdGhpcyBi
ZWhhdmlvdXIgd29ya3MgYXMgZXhwZWN0ZWQgaW4gdGhlIGZ1dHVyZSwgYW5kIGRvZXNu4oCZdCBy
ZWdyZXNzPw0KDQpUaGFua3MsDQpSb3Nz


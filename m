Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2788C71136
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 15:02:25 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.45])
 by mx.groups.io with SMTP id smtpd.web10.15632.1749740539804489665
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 08:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=O6mHg4ZT;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=O6mHg4ZT;
 spf=pass (domain: arm.com, ip: 52.101.65.45, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rzKGVt3GnaAfaElByh3AQb7E/mViOpluCqkW3E/JPlvn9Q8mRt/3eHIZ7bYLLU6LvDrBxvRkddS5oZQdWoTlwdZNAGyY7NET3gGiPw3Jcec8TluxI+LFHwNFfxubn4cvE58lyqLvQaGSQ2onv4sCT793iPJzvqBFDQYTimyAMMcvM4N5mxRscMegv0g0qmannNokQayhmgkVy3/NbRGcVk6BRbdSkE0QLMCjlpUoj7z+WkhbtBzo6/I2eqbxQqGceA3iaNjlpEQ1dIviZjYL+JHNjo3iELW0UtNB7YJUgUSpVQYtjC81GiQlEmUCjGNI9OYvEWu1uzepnaUCV5xKzg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MfjBp8em2nbfMCNJ/gpOVqZrA23k8oijD5OUcN5U818=;
 b=yjQAmMNeXmaJZhgRqNOhjMo1VK0tpU48siAhWs+Vl36lQn2MyYYuXPayXpe0dugqtXO0icj+CveOEvDvBreUV7HBynmDHOfFtBLiV65vnZcloBsqZ7w7PCL8+99e3n8IzEQe0JcRGC2FgXjpscZ6lXGWzCJrG3pS3EXVh1Eb3PZVEdbrwvR/eM2crFAA4LifzfXtm+FCRTxiXY2RRt0GiWG2PfTM1uir4dIawO2YsLpYKrDgEzE69O+tjPyP9VZRPgvaOoU5+/m+u5LsCjyZRdUxQ8MwtbQPITWLMJrsPkl27ZLcxBt286dbID3d0DiTtkHSIB6/8g/AqgQZc+nlfg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=limonsoftware.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MfjBp8em2nbfMCNJ/gpOVqZrA23k8oijD5OUcN5U818=;
 b=O6mHg4ZTLaOPZqSGGi3mKwWlaKZGCCrJopTrhq5mMn0wPXgTYpiOQAzzLgXbHG69rplkJRPACVtzOPJMkcV+qoIMI6iYU2j2yP1fS08osZ1ltLaED/5t4MnIcH//xWYAgI4YsnejcrB+ctuKFyqD1GhITq3bvHR0e5dvwPSWleg=
Received: from DUZPR01CA0131.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::16) by VI0PR08MB10559.eurprd08.prod.outlook.com
 (2603:10a6:800:20f::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.22; Thu, 12 Jun
 2025 15:02:15 +0000
Received: from DB1PEPF00039232.eurprd03.prod.outlook.com
 (2603:10a6:10:4bc:cafe::ff) by DUZPR01CA0131.outlook.office365.com
 (2603:10a6:10:4bc::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Thu,
 12 Jun 2025 15:02:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00039232.mail.protection.outlook.com (10.167.8.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Thu, 12 Jun 2025 15:02:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jvUtdLj+XVw6n3+QoCqocJ6AHMg6sN0OAjx4Fpps7sX3t5LHMagmKC7r8nCVrsnUVw14y6GXEZIQnZYT1ezrwRgGkCJCSPTT42OfKuJKuta9kJmcZIrC3q+7NyGLXtYe1gac24vQZIQ1C97mbfQozlwm5iWaezi4RdrEBi+8UytGY3xTW7kAlUn0rlrcjflqt14N+gjU9SL/FMqjtyxwSbTvmo2f60gxT0EHGVCkmB1gwdZt8USHkBS9JIe6E57mz3EcuWxEekbVg+MmHHaBRj8pMPdjpqNSqoDEvIVblqUogupAwqiPztd2pevNHZnapkeborO1mwsq4r2m3FMt0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MfjBp8em2nbfMCNJ/gpOVqZrA23k8oijD5OUcN5U818=;
 b=XVeynnDMq0tuDj5g/8aBOT+vKKw1vimfLuNPGmYfetE+DVFx/tIhmW/chFJp+3Mt09kKZGN62sz/tWBS754LQdGcHddUnY5pgr55zTzMdITB4TwsjWGRyG4OKyBdB0gUmP/WgYfmNW2hYS+ugkIsZ1FoJHzxf7yg8KCGwgKzdMgPHaqgivCGPgAHjKsgU7qzKZnlvSNnIx/kWDR7VfWK0P0RAUETSVf6ScT9rmTsMIIukQpIAnmASxdRcK/JCZAwBc43bxkoAFPyu6vWItj+7MoeE3lUEWx2kb6FFMj1rLhSGSUquVn/6n8IVDdMRrFtUqzB0PRuGNd53xAyphN2fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MfjBp8em2nbfMCNJ/gpOVqZrA23k8oijD5OUcN5U818=;
 b=O6mHg4ZTLaOPZqSGGi3mKwWlaKZGCCrJopTrhq5mMn0wPXgTYpiOQAzzLgXbHG69rplkJRPACVtzOPJMkcV+qoIMI6iYU2j2yP1fS08osZ1ltLaED/5t4MnIcH//xWYAgI4YsnejcrB+ctuKFyqD1GhITq3bvHR0e5dvwPSWleg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBAPR08MB5848.eurprd08.prod.outlook.com (2603:10a6:10:1b1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 15:01:39 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 15:01:39 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Anibal Limon <anibal@limonsoftware.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, "bruce.ashfield@gmail.com"
	<bruce.ashfield@gmail.com>
Subject: Re: [PATCH 3/3] wic: plugins source bootimage/isoimage rename to have
 valid indentifier
Thread-Topic: [PATCH 3/3] wic: plugins source bootimage/isoimage rename to
 have valid indentifier
Thread-Index: AQHb2uY1iB9UsjydaUO3HIpSm33DO7P+naaAgAECTAA=
Date: Thu, 12 Jun 2025 15:01:39 +0000
Message-ID: <BB304894-22E7-438B-A97A-C689712E1473@arm.com>
References: <20250611153319.54778-1-anibal@limonsoftware.com>
 <20250611153319.54778-3-anibal@limonsoftware.com>
 <CAOU5ZMs1DZM-3-h=_5-9m7nqFuU7i4VwH6ZcbzAwD2uByNt3=w@mail.gmail.com>
In-Reply-To: 
 <CAOU5ZMs1DZM-3-h=_5-9m7nqFuU7i4VwH6ZcbzAwD2uByNt3=w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBAPR08MB5848:EE_|DB1PEPF00039232:EE_|VI0PR08MB10559:EE_
X-MS-Office365-Filtering-Correlation-Id: c0210141-f16f-4bcf-c0c7-08dda9c21d4a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?TjZjWW1SSzc0WmJmOTR3ZzNyN1BRL1RnRWgvR3E4cVlycEJoVnRRUmY4VVly?=
 =?utf-8?B?M2libVZMOHllMkxWZzVGdWJJUDY2R2VDeW05eElXN2lzS2Y5RGFHSFZITWdS?=
 =?utf-8?B?akxLdU5pdXZtbTU3Z21mTFhvRzVoZERIWkYzNjRRVUtESlRYUnFlTVZRb2JO?=
 =?utf-8?B?U0tnQW5ydU9kSDBBcjZKUVhiZnRzK3dyQmkreGw0ZUNwbzN3YWVkUEpBVVBP?=
 =?utf-8?B?elM1R2FHUFFZT3NrN0QwTDZLOFBUSXovLzkrQllFNUNKY1R4enB5WGtxaXpt?=
 =?utf-8?B?djNmZWdRbmlScDZYZjNRekZIQlowZEd1QktZSVMxSE1sYkVtRzdPMi80aGRK?=
 =?utf-8?B?K2JQdThRYk12NlBhdFluYXRLNEJtVzc0UU1Sd1RxT1FvU1BXcUhVWUNFblBX?=
 =?utf-8?B?czdheWlHWld4cGh5M3o0UkRFT2tDK0YyM2RjSWdPMkdYSW9tVjNHY2tEcFJN?=
 =?utf-8?B?WkhIWC9SMzdhWDNOdTVJOHk4M2kzQ25pVHFSZmpnczlwaGxqVTg0UFJNRFhJ?=
 =?utf-8?B?NG5hNElGblExbzRhcmtONUJHRkppVGo4Qk9tOG5RSnVRa1h0cHhLR0JaSUZ3?=
 =?utf-8?B?WWpHUXVFRHppU2FIUXhNcklRbEU3Y2hadmdQU0htVi9BTXV5WnNJZjJmSWJ1?=
 =?utf-8?B?eWg5VDZ6TkhzamdWTkJaY0JXTGNkakFBak5yNFE1Y3MwNDl4dzhiSGFYT2Mz?=
 =?utf-8?B?T3VsK0lsUTdBenRqWngwblpQZFprMHVGeGE3Q3BTOENWRkczMnk4aGUvTzBS?=
 =?utf-8?B?REMxamxKbU9vaGlpTGNRenJPOUUxdkp5ZzhOSld2VmZLcVUrN0dDZTMwSy9E?=
 =?utf-8?B?Q2RBaUo3eXNXckwyaW9oN2dxRWNpOFNJZUtLNkp2L1FqUjhNMFh3NjhsYVRY?=
 =?utf-8?B?ME1JSHZtV0tid3dkVzF2c05ST3lYdDFVZXYyV3drc0pOTEJTTnROZVJNVTVq?=
 =?utf-8?B?M3lXT0kxUWdta0cwTHRPdjA2TXdqUWxhOUVEM2FjWFlYbEJnN04yVDRnc1dC?=
 =?utf-8?B?QWVPZnE3UGRPUWRwOGNLd1c5U1hOUFlmdlFDeHpNcFBLNGtsKy9Jdzg5ejVQ?=
 =?utf-8?B?NDM2bVpyQi9IaEF3OURpbmJTQTJxbmVRZHNJSW1TQ3VBRGZ4NjZ1Ri9kUU5v?=
 =?utf-8?B?NmtvNVVCeFBIOUxCOXp5NHFIWk5VeEZlY3JtUit6RFY0MW84WXZscFQ0aG9q?=
 =?utf-8?B?T2h4YWtOa2V5R1FaczIwYmJJWENWVFJKZFYyamtwc1JVeVRTOFViaHkwWTFM?=
 =?utf-8?B?d1lXaWdOSjI3Q0M5M3d4WlFMc0cyRCswNlR3V3pWekxNTlBGTlFzU0Vxdi9S?=
 =?utf-8?B?dTNyRklNcHMzYjlWRlRlSTJLR1VDSTFta0QzbTVZZnNIS1p4K0Q1cWtzSlFn?=
 =?utf-8?B?VWpwVlo4QlgxbWxML1ZwK1FWUys3UlcvaDRaM3prQmlJMHJKekFSY2tOZkFV?=
 =?utf-8?B?c3lEa1RkV3N6S1F4OC9GUzNhWjVYbWhmNTNIY1VhdlhiTDFZWm9zM1o1d3ZH?=
 =?utf-8?B?R2E1VDZQWndtNVNsMGZsL0g2U0c3dmQ4V2xxeTVsZHhqUkdDMGJ4YmFhaGli?=
 =?utf-8?B?MWQwSHl4THkzZStRMzhLNmhjQ0lZc3Z5c0k4SzJqbnZOS0JMU0pRaVovRlh4?=
 =?utf-8?B?Y28vL2tjL05WTDVxRHphVnVMcjFKY0ZVZ2xJWGNUWStFbnZ0RjBPREcyWVpM?=
 =?utf-8?B?NzVaRHJYTkJleFgxN3V1RFkwUHRDQWVnSjJSZFZBajNUUCtpSGxYRFFOUkxF?=
 =?utf-8?B?RlJCZWE5VHNmOVhGMkJlZ0FEMjN5U0NaTW83MUV2K0ppQy8zai9QbGJ5WEpL?=
 =?utf-8?B?dm9QSS9XTFk3QUdEQ0dEbVdrdzVMWWN5Mml6OURwbXpMMk5OWTJUUWVRcXh0?=
 =?utf-8?B?MnhndkdiNHlpTW1wNDFjWUkrVTJEUkRHaHdmYy9mNjBoTUVzMENNVEhPWGpt?=
 =?utf-8?B?eHZOcEEwRG5jS3VKeDNaQjkxMk5xOVNPUm1aTm1scmRzSlhvcnhwODEza2g2?=
 =?utf-8?B?WE1LSU41dFNRPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EAECBEE592F2E546A1C3DF082F3875A7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5848
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF00039232.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8e7e2f9e-b92c-42fe-fe58-08dda9c208c7
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|35042699022|376014|36860700013|1800799024|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?R1dxeGdzNDd0UVRpRll5TVpQRWxiU1V0T3VoRHljTXlxYUovbUMzcVIyRUli?=
 =?utf-8?B?NVN1NURwN2tXZVZGcjBkRVZOaTJwOEVxNStuS2lORkUyT3draFMwUnpaNWdW?=
 =?utf-8?B?MHVCMldaOFgwNzRaOEpxQTI4VGVFY3dNb0lOM3RSbEdGOUVFWjVIZDlXbnRU?=
 =?utf-8?B?L1RhQklwS01LS0Fib2xHM2JOZ0NmaHpod0VxN3N5V3d2MFA2eE1qSmpBY0Nr?=
 =?utf-8?B?TVZmaksxMk11cEF1UDM3SXVtTFgzTDZ3SllERjdkanIveklpbWZkUmdtTkR4?=
 =?utf-8?B?OStSYTdGVFB6dmhWWm14SnVHa3F5c3VQSWs5SzRtamxCMkgrUnZONzNRM0Jx?=
 =?utf-8?B?VmNKdzloSTI2Rm1JYitoQzZkaGpYVldIc3BCZFVtUGxWUTQzcUVvelFKNlZ2?=
 =?utf-8?B?TklYSDRrd1MxK2NSYkVJdGsrcjZHTEtmeS9TV3BHdkpzQXpMTTBBcmFuK2Fu?=
 =?utf-8?B?OXFadWdvQVRjSmx6eTRNR2NienRRS0lMbVFRdDVsTzhML0V1UDY3U1NhcGFz?=
 =?utf-8?B?MWNTMEtnNXV2dzdHeEZPRzlZRnAyaTRhcjJEMFM5VURuZmFZbThkOStIZ2Ra?=
 =?utf-8?B?SWRDaGxRUE9uY3FPbTJxMmY2dVZ5MnFYazRpMHYwd0Raa3dqRElxaUlsTDlw?=
 =?utf-8?B?NUxENndRd2RZcUo4SWxtTjNXTWZnTFhJZGt2WVNtUlZvWm1yc3dPWHQ4TEFB?=
 =?utf-8?B?cmdRRjN6d3VOUFBKRTg1bmErQ3hqdTJTdVV1ZXJnMGcvNGlEeCthd05mdE95?=
 =?utf-8?B?NHJWZkpaMWJ4NExIWVYyNU9IY0N2QUNNWFR4QURxYXdaZVRnOHBqbHowOFBH?=
 =?utf-8?B?Q2paeDFKZXQ0eWZ2aHA4WDlpcXM4UnpFTFlmd01kSzFTeHVyaytGeEdMQjNh?=
 =?utf-8?B?RVIwTHBzUjVXaUxDZTMycG9ZS2lRemNUWXFwVHMrdStiNGJ1cXJBVG40bUV3?=
 =?utf-8?B?aGRINnU4M2tqdlRaYlNaUW41TDU1SDVEejJSeEQrZUZuWXIxOVRXMGgwUCtH?=
 =?utf-8?B?dTJ0RzRsWW1KZ1poaTA4TlhuK2dCUTllZGJBNGQraGhmcVZiZHJNQTU0U0xR?=
 =?utf-8?B?VHdLd1B4N0t4OERQUXc5QTMxOE1WVWx6dnNvZThrNVNZT2E0bG8rOUs4WXN1?=
 =?utf-8?B?eDRVNFAxUnB4MXpIVVZiR3dvcXJyK1JxZCt1bSs4bnN4MXI2emdqWGt1WU5v?=
 =?utf-8?B?NExESWxFODFqU3E5d0tVdEJDTzBSZnRMRzhBZzdZUXNzN1U0OVZ2Z1BIaUJB?=
 =?utf-8?B?OEh2RExzVEVIbk5UMWxRbWcrNWsyVjlBejZydk1oN0NkSzB1eHJ6Q3JpYlNl?=
 =?utf-8?B?SHFwSG9jczF0NVJkV2EvNzkxR1prR0s0aVB4WThaKzV3MnU3SG5sZW9TRDdN?=
 =?utf-8?B?dkV5SEgzSnB1WjNtaXNVMUpNRGJSN3BvWXhHanhjOUlUc0o1THdLUWRvbnpJ?=
 =?utf-8?B?OWhkMFlFTDB6R3lhdDdGYkJPU2RCb2k3TnlKa0xEU3FpSW0zaVAzRXpQYlVp?=
 =?utf-8?B?bjBpcXB6cHQzczdXQVZVQWJsNDBaL0JXSXdMdmNNdkZ6MmloaFgvRHZMTWhr?=
 =?utf-8?B?TkNqZHFWcXFnQmhoTGVZSC9WRGRFVmxEQ0xDa0J5TW95djEwcloxWGoyOE9O?=
 =?utf-8?B?ejl6RHFxQ2R0VXFCQkdEL0Y2SzVVUlRuc3cxMVNuK28xc2JOM3lzNHZJUVkz?=
 =?utf-8?B?Unl4RGdKRlNhMmZmZHVpVUwva1RiNGVBeDBoNkFCKzFwclQza3ROL3NaMzNB?=
 =?utf-8?B?NDdmSnZSQklGQ1QvcnZselJvdkZhWS9HQ010TVI0U0o3MW03cmtmb09GZXQy?=
 =?utf-8?B?WGo2dnFKdjlkWUR3Wkh3UjZXSnlKYklleVZjL1Z5M3ljbURJQ1FDSnhOQi8z?=
 =?utf-8?B?MjNwb3J3eXRIa0ZHb2lzdnB4M0NTbnFYUnVPUW5hSEFLYXJaWUlOdnUrNnRS?=
 =?utf-8?B?Yk0rcXlXNWJ1ZWh0RnNDUktsN29DMm5qdkxxdTR1emVCOVBRSzNONkl0RTVj?=
 =?utf-8?B?WEk5SDlRSTNtWmk1NVpwT0J2Y2ZDT2p2cEUxaGJ1U2VjRnU1WTFMVk8xTmNJ?=
 =?utf-8?Q?nb3GbJ?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(376014)(36860700013)(1800799024)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 15:02:13.5642
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0210141-f16f-4bcf-c0c7-08dda9c21d4a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00039232.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10559
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 15:02:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218528

T24gMTIgSnVuIDIwMjUsIGF0IDAwOjM2LCBBbmliYWwgTGltb24gPGFuaWJhbEBsaW1vbnNvZnR3
YXJlLmNvbT4gd3JvdGU6DQo+IFRoaXMgcGF0Y2ggaXMgdGhlIHByZXZpb3VzIG9uZSwgb25seSBz
ZW50IHRvIG5vdGUgaXMgcGFydCBvZiB0aGUgc2VyaWVzIGFuZCBjYW4NCj4gYmUgaW50ZWdyYXRl
ZCBsYXRlciBhZnRlciBsYXllcnMgZml4IHBsdWdpbiBmaWxlbmFtZXMuDQoNCldlIGRvbuKAmXQg
bmVlZCB0byBtYWtlIGV2ZXJ5b25lIGNoYW5nZSB0aGVpciB3aWMgZmlsZXMgdGhvdWdoOg0KDQox
KSBjaGFuZ2Ugd2ljIHRvIHdhcm4gaWYgdGhlIHBsdWdpbnMgaGF2ZSBpbnZhbGlkIGZpbGVuYW1l
cw0KMikgcmVuYW1lIHBsdWdpbnMgdG8gYmUgdmFsaWQNCjMpIHdoZW4gcGFyc2luZyB3aWMgZmls
ZXMsIHRyYW5zZm9ybSB0aGUgcGx1Z2luIG5hbWUgIHdpdGggcy8tL18uICBUaGlzIG1lYW5zIHdl
IGRvbuKAmXQgbmVlZCB0byBhbHRlciBhbnkgZXhpc3Rpbmcgd2ljIGZpbGVzLg0KDQpZb3UgaGF2
ZSAxIGFuZCAyIGFscmVhZHkuIDMgaXMgYSBxdWljayAucmVwbGFjZSgpIGNhbGwuICANCg0KQ2hl
ZXJzLA0KUm9zcw==


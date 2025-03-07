Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B0CFC19F32
	for <webhook@archiver.kernel.org>; Fri,  7 Mar 2025 10:24:48 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.80])
 by mx.groups.io with SMTP id smtpd.web11.8075.1741343086166791709
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Mar 2025 02:24:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kq8nagDa;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kq8nagDa;
 spf=pass (domain: arm.com, ip: 40.107.20.80, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=I8DAMOWtlbfyHWEvkSKObjdF3TKw8VfI4AJL/QAOTofeICoAN6zrJ0ODfijWG5BsmNx+yLYZvSHMGCJFBi/J8GWLsc2rZScPwMpY5wqaGvhkqExlFB7V9bQmDCDPHCed7woa5aepKyx86GuuOboVXdVg/ONEvexTV3ssrAZ3WBV16XTWRJRjwMl7EzZVdR+3zef1+9vxV/Hs6yoHbuP21K8vF+tiUBrxFnMWL5p/OVMAUeWUbWJjThzZV8XdnTSIoYAgqypEjWoXbba9WRKQe/GPeViTj45T/FG5uO2r+HeKG/0cmJc/ncPKz8v3zAm9G1+HQfubsogIULQ4rI2vlg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hv9nZ/Bv2U9Fsfypp0bzkQ+CwVHwpcEJQMMsTmLqNdQ=;
 b=MyPpo3H+JqAEoY8ED5YyRXVXjVkLE30H8Te4hpRT9tASbUY76r/YjDopZ/ld46BU/PakPCvJ21DSzmTEDIzBu2b2d1k5E9cJ+/uCOtxl6gsD4ucK1Xn8sU/lZjQAl6dhypZIYvTrS1f3Nn8tT69OAApBw7tHryj2rUc1BXcJJ0gmGtlZBD09V11iTE1Q0I1mAbxqBY/2mALVCAztpq2cdHl3cyZT+OyFgWtLl6syIXPOF35wds+WUVnUBQrjttAqwlDGQyyc729yVLJvEU+BP9a0UEbUJsnlxX0zuHr4q97c5uTQBYYU8ZBm8ci88+RtsJvorUDiMgXOiVEkvOLetw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hv9nZ/Bv2U9Fsfypp0bzkQ+CwVHwpcEJQMMsTmLqNdQ=;
 b=kq8nagDagCV0M42GmDJGvZRujI6XMIHs/xpHcLSqRYGS52HAllQeipgOxgGMjnpZ87osYpiddQGSP+AyjUxHRSs6bD2bB3VUAAEEyYXvFX2pf07JJxAz3UYplvi1mP0Fqj3kuD6OuW/dUqqewiuqFqiBDwZqAyI3U/1lCii97ZE=
Received: from AS4P190CA0005.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::17)
 by AM9PR08MB5938.eurprd08.prod.outlook.com (2603:10a6:20b:2da::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.20; Fri, 7 Mar
 2025 10:24:43 +0000
Received: from AM3PEPF00009B9F.eurprd04.prod.outlook.com
 (2603:10a6:20b:5de:cafe::bc) by AS4P190CA0005.outlook.office365.com
 (2603:10a6:20b:5de::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.22 via Frontend Transport; Fri,
 7 Mar 2025 10:24:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009B9F.mail.protection.outlook.com (10.167.16.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.15
 via Frontend Transport; Fri, 7 Mar 2025 10:24:42 +0000
Received: ("Tessian outbound bc832f6acacf:v585"); Fri, 07 Mar 2025 10:24:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2ebc650f91b8122f
X-TessianGatewayMetadata: dW86i+B4zP+uZKvaAoYDkh8sjnuTi65Vfv8JwTAv73edCMIX4XiKxUe1wXRT5FSVrYl6ykv4Gcu/daFsnrVmWqbj4Jh6jhxZxBN2eTToUovmXq6F/Vg6wK/famk1lUzCavcHwDbnX/S/ixz50BJrlELbPlIP+qmth4Ed/iBoRSQ=
X-CR-MTA-TID: 64aa7808
Received: from L6046f4df59c1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AF83EE0D-DF88-43CE-83B4-92AD606AA4A3.1;
	Fri, 07 Mar 2025 10:24:36 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L6046f4df59c1.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Fri, 07 Mar 2025 10:24:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TRhBbu635W8YlpJrQQ97XXiCTWhJCYOkKfwuAhAl/VkKGnUhb693UAHEnn6VM1EBGBXit9VLN8JxyEiuWQtgaz2X2zi0UooKO7zaUQ5HR4xiT+PxSY9wYkOSBmWTJ/w4T33lGDXikHHOWRbVojzPP8F8svU9QoPb469dBkCAzccU/pXliz+hmxkLX1KvvnRQoK8IcaEbLDrC5SxxYBQT911b+6MF95XM9PLRF1E5o3O0zVjb4joUkAKkiRNYgCV2VostO08COYwHEtGhlrjjRqdThqV5K1Uvja1cAR3lqxkhpsSAhr9mZpjmebNDWLGBx+GC+m6eQgDCaGwc7iFaMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hv9nZ/Bv2U9Fsfypp0bzkQ+CwVHwpcEJQMMsTmLqNdQ=;
 b=uq3cyLf9bmLt8WY4Q3+L8E8rjDY+B61ccC2idplfG2J02IyfjisS8AcJ3XcXtdWx9bSXJH6DonzQ3gDjKNKvRfKhqYqKk8FDyKN7Anduz2n1jGI3NTw9hFktN1t32wGlfvoOhJD2I30gwMHIDMOpkhKySKad0Id/dtpV8cYpyqYyAyVfVVSgURfh3xicVZiRaq/foFJMO2JgfBq86B/cUnPLARsRtpinRpkohSudB+gYftPVgsLatBegrnEsiDsd7ZTXG4WbVRA0Cxr+SqGQdHeDwhxn40FJg2AxdhMlX8HmOUA9vNZYKBRXqXfQ/MgOaYS8kGwmTyRtxSDV1ksLgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hv9nZ/Bv2U9Fsfypp0bzkQ+CwVHwpcEJQMMsTmLqNdQ=;
 b=kq8nagDagCV0M42GmDJGvZRujI6XMIHs/xpHcLSqRYGS52HAllQeipgOxgGMjnpZ87osYpiddQGSP+AyjUxHRSs6bD2bB3VUAAEEyYXvFX2pf07JJxAz3UYplvi1mP0Fqj3kuD6OuW/dUqqewiuqFqiBDwZqAyI3U/1lCii97ZE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB9067.eurprd08.prod.outlook.com (2603:10a6:102:343::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Fri, 7 Mar
 2025 10:24:32 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 10:24:32 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mingli.yu@eng.windriver.com" <mingli.yu@eng.windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] minizip: Add new recipe
Thread-Topic: [OE-core] [PATCH] minizip: Add new recipe
Thread-Index: AQHbjzW+zeFw5hcZ7E6Asf5gF4zPF7Nnd8MA
Date: Fri, 7 Mar 2025 10:24:32 +0000
Message-ID: <919CBDF5-C00B-47CD-93EA-0A7BFB4B6028@arm.com>
References: <20250307075100.645020-1-mingli.yu@eng.windriver.com>
In-Reply-To: <20250307075100.645020-1-mingli.yu@eng.windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB9067:EE_|AM3PEPF00009B9F:EE_|AM9PR08MB5938:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ce2ded8-69dd-4c3c-2972-08dd5d62465c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?ZUxIc1g3VHQrY1BBRVc3WnZ1L0VsMWxTUExlOGx2aGFnbGRDMWJ6TGlTZ0dr?=
 =?utf-8?B?M0lETENZU01laWtJK1hVOWE2YWh0dXNWZ2lPckticzJVVG1SZXVOVnNPR2dI?=
 =?utf-8?B?WGlhM21Ja0hGeWVzc01PNGc4N2E0cW5aRXFOeEhNUlM5VW5IQnIzcmVYTGMy?=
 =?utf-8?B?V1NLcXYwWTVoTCtZb2FLY3JDaVNVV1lXbnEvOGpjZWQxMjFEcTlxeW9DUGcy?=
 =?utf-8?B?R210MEtNdEs0SmIyWFc1MnJqUWlNY0YvSEx5Ymc5Z1BYS0dJSEdHcGhHb1JR?=
 =?utf-8?B?Ump1RGMzU2lrbjIrMzIva1p1R2M4WVNPYWFVMnEyRmUwWkZTeFpqcG9DdGhp?=
 =?utf-8?B?aHA4dlhybld2eVlNejNDa1NmVlBrS1lORnZ0emhYTTAyTjE5cFU3MHlEb0N6?=
 =?utf-8?B?M1E4RTZjYkk4UjZhZ3k0dFo0bnBaWHcvZEljcWoxNk1rQ2FFb1dTYkVLL2N4?=
 =?utf-8?B?dENUWXUwVE5heEhHV0w0TGxBdURHaWRDTldIc0hZQW91ZDd1UkpST1Ewa3gx?=
 =?utf-8?B?V0JNdUlJS2ZyaThDUkF3MHBWT2t0NEtaN0JpaFNPaW5iYWJrSlBPMWZUbVox?=
 =?utf-8?B?RkZUdWVCTEg5K2RpNExhWEV4aU5sUTl6RUpSMjNHUGRReHQvZlZFejNMUWJk?=
 =?utf-8?B?L1daa1o4ckN4MUt5QmUzZFovN0RBR1h5eWxtWHdqTkw4QXU0R29XaEJDcTNa?=
 =?utf-8?B?Y1ExV1cvWFRVTm8zTUZUdmVCeU0zRmxqbUNNY0lKQ3pEa0wwbWZ4VjhkUnVq?=
 =?utf-8?B?VEhZRGxFMUNGc2g5QmhBUVJ3M3ZoM2RUOExIbHhxQXJjcGZGY21ERmlIVHNk?=
 =?utf-8?B?QTRaT1BSUmRDS043dWloclhHQWdZaEEwT1E2QkluTFg1amlLRnhBQjQ5Wmhu?=
 =?utf-8?B?NnJyaEV3UWNGdGlrK2lRZk9reVQ5TE9TWWFpVzR6WnM2WEJ4S2JKY1NMc1oz?=
 =?utf-8?B?L3BPYytKWkFxSVdjNThmS2RLU3g0c1h5Sjc2MG9jSlVhOHJTYUtNREFCUXlO?=
 =?utf-8?B?dCtSNHB4MTVuMnA0RG5LUC91NW1EaWtkVTJ0eW5MaGY5bWRvaVNPZzUxbGtX?=
 =?utf-8?B?QVNxTzJFZVlWVEUrcitUZ2hWWWFrWGsrT0x4bjRieFZaL25hdk9oLzIySGk2?=
 =?utf-8?B?WUFGeENJRk82UFBQQjNJeVVmOGQ0V2UyTE53U20xdTJJNnVFbTExdGY2c2dH?=
 =?utf-8?B?RERZMDlqdnFDdzE2QmhYSXgrOFhzNGRzK3JEZlQvV2ltR2ZhRm5SNTRWakhq?=
 =?utf-8?B?bEV5dDNKbHpNOXJwR0FRRWNTYnBrQ25TTHFPeEhoRHVVTnBNN2lOOUQ1K2U0?=
 =?utf-8?B?eWg3SktCcjU3YzFIcWNzaDVWMWQyZ2JPSTlnMG95NE5zeDF2OTJGTkZsY1NM?=
 =?utf-8?B?SnE0UURsb0JjbDdJWTAzYm5PakhjdUMvMW1kRXM4VnQzU2dwNEZ5d0F0eS8z?=
 =?utf-8?B?THN3aHNZSWoxWERlNTVpY1NMV2JUZzljdjJtWU5iRmp1WC9ydC82K1U3OXhW?=
 =?utf-8?B?bHFmNkRZbUxtaEptSHVhTEN4TE9DN3MxTk1WWUFldmNPbkE2elVYK1pXQ2lk?=
 =?utf-8?B?M3RMQ3IvVUtmVFhFb1Y0SjFpUTMxLzB0MzVKRWtnM0dNZmJXVWlTa1puWTU3?=
 =?utf-8?B?ZzRwZVBNaEo0UnFqSVBvNURQN25KVy9RcitOM0ZENFQyVVZBbWhLWWk2R0I4?=
 =?utf-8?B?anl2RWl2bmFhRm15bHQ5UEZ4WXp2ZXRmOHBLbmNOWk1ZUW05VndxdTBrQjEv?=
 =?utf-8?B?Q1JheTl6QmZSUGQwd0lYeWlRWmlaZklkRkkxbzFnYzhuZXFWT2k4cXQ3UmVi?=
 =?utf-8?B?bWszeit0TkgrOUMzcXY1S2U2ZXdZeVhJTHBvOFZYZlpQOEI2RUs3Y3d6bXgy?=
 =?utf-8?B?MXd0R2JxS0YrSkRTMlMzaXBkZTJnZUUvejF5TlQ5NWtVL1pqK256TC9ybENR?=
 =?utf-8?Q?9HVZI4JkGYw5/RC8SFs4NYiSXs8eUDGB?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EA2CED734ED0D243952F834C08952263@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9067
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	18746ae8-c27d-42f6-de52-08dd5d62405e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|82310400026|1800799024|36860700013|14060799003|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YVJjUVBmR2xITVFQREJzQ2oxYzYvekh4VnlyQWRPYlNyb3VjN1MyaER0OUM5?=
 =?utf-8?B?UWp5cktEdTlWdDZtREdRUzR3K0p1UTJqTlJrRDBQd1FXTzZKSmh6VnREcFJG?=
 =?utf-8?B?dldEVlZVNjFSS0x5aGx4WlhpLzlrY1hYeFFHTktEMldyOEhNL0l6U05TMlMw?=
 =?utf-8?B?Mi9TWXdESzIwTjVUUVJTb1NkZC9Ka2tkbnlrNWF5TmZJeFlHdWNFNFJvNHR4?=
 =?utf-8?B?dnc4eVRoVkxuNVNvVmh5SkJXOXg0TkhlcWZYVVQ0N1B3Sm4wTWRRUEk1dkVl?=
 =?utf-8?B?UFQvaHZDUEpUdjJFV0EwUklFb0ZWQkgzUUh3RXpDNWpZVE44bWU0cFFIM2FV?=
 =?utf-8?B?dHk1ZmVEWlJjbndyTHI2bnVJbUdzMHNtU2tVbXFPNTRIZWxOQjlKSFFkUlV5?=
 =?utf-8?B?Z0g1alJrWEhvODRXOWk3b2lMU0N1b2tzZERjV0twazBjNExUdkpaWGFVRXFz?=
 =?utf-8?B?WDZ6dmoyV1V3UThwaHlZMW93QWhrL0N4TEFCR2FuUlM5OVNqaWZvMDE0MTFs?=
 =?utf-8?B?TGs2WTcwT0Y4aEJ1azFLLzlVSUdDTjIvSW16bUZtTVFsRU8vQU4vMjR1YUds?=
 =?utf-8?B?RUQ4cHBjY1RreW9rRzlXVDRyMjVNazR6UEtpZWc0MElwL2t6K1grZmMvZUVC?=
 =?utf-8?B?U08wY29KbnNGanlHNGNZVGNhMnFpdVRTWGdWMTY5Rzl1cEpabWszNlNyYlRK?=
 =?utf-8?B?NHZhY2Y5cFlVb1lvRzJkd0RrdTJuS2dNTE85MHN5b1FOMkh6VDBlcE1oYnEy?=
 =?utf-8?B?Tmw4TU9jY3ZReTlCQlJtY250ZG1RcUtjbWpVYVpKeTdmRG9aTzdQTlZxMjZp?=
 =?utf-8?B?QUVKUzM2bUtxV3F3eGJWbVdxczBDell3TGMrYUxjNTdUd0lNMWxUZ2pNRnFP?=
 =?utf-8?B?WTNmbm9JVnQzZUdQUWRlMFNDdUx4WFNrNWwxRUxRay9iZ1R4L0VCanFNbE44?=
 =?utf-8?B?VUFlZkNxWkZkaGNkS3Zqc0tyZzhlM3ZpQWdlRENTdzgybGdmT1IrdlkrdThW?=
 =?utf-8?B?M2pzTEFLZlNFOGhTT3Bzdmcvc2w1cGxkOWRnM2QvUWQvUkZCdG0xaWcvbWJa?=
 =?utf-8?B?RWk4aDYzcW8yWDBWcDA1SnJEU01XMHEzdFFrT2pjVWd4L0s1M1d6clBxVytk?=
 =?utf-8?B?RXA2SzJkMit3eFVyMUZnc1Q4Mko5b2lJMlA4WSt6YXhIWjZFRXBqK2hsR0dS?=
 =?utf-8?B?WTAzMUhpMy9MUU5zRThWazRBWjJEZmV4MzljQmRxRTlSS3BKNHBaa05QaGVj?=
 =?utf-8?B?MVJTM0lHV3lvYWs2ZG9rSDhBdFNEWXZRWHM5SitTZ2RocmZaU2dkL3NNMm5v?=
 =?utf-8?B?UXB6VVRnWXAweFFIU0tydzRVaXV1VTIyNlRYUnZDZlRWSDduYVIxRDA0bXhv?=
 =?utf-8?B?WkVpMzhzVTRJaWE0a3RiNC9BN1dhK2dxdkRZaktnZ1N5czE3N0lBNXBBaHph?=
 =?utf-8?B?a1lDajRQVk4zZkxvcVpqMFlaWEYxS3BQOFlCVW9XQ0ZtbGtqekc3Z3ZubkR1?=
 =?utf-8?B?ZnRmRzRHdVFVZFhUQ214QlVaSVJHejlKVFJhSkduMkVmT1plU1cra3JiNnlU?=
 =?utf-8?B?ak5VeHBTem5CeVlkUWkrMUVTMlNuOXA3Sk5oQkJMNjluLzNGaXJJWlVyVGI1?=
 =?utf-8?B?NVNlU25sWS9lMU1DdHlhN1FXSUwvRnA5NzVEb0VyTlduQ1NVRTBTQzJXUnJ0?=
 =?utf-8?B?NFRrRzRYeVErWVErdlBJL3hzcEJaazU1bmRSbnZTUmNnZkgrQXB1RGloaWYw?=
 =?utf-8?B?clRXcmpqc1VoeFk4cTd5NkxpOHAyMzdpc0xQS1dUaHBYSUtIV1lxNXExTThM?=
 =?utf-8?B?VVR2SWFxdCtyekRyUHdJMVRvSHlXZHdGT3UvMEJxVkFHUXFFMU5tYmwrc2h4?=
 =?utf-8?B?UFRWWW9VbDY0dnYxTzRtZ1RRWWhtUHdZcFA4c2lTd1dKU2xRaHpkOTlQdkdi?=
 =?utf-8?B?TS94ZGFLbWg5SklIeFg2czE3cU15YmYzd29DMUVTeFpDd2Vad2c4R1YvK0Rk?=
 =?utf-8?Q?jFBKMZ15uBexYEjawmkiuKU1O1Us68=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(1800799024)(36860700013)(14060799003)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 10:24:42.4632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce2ded8-69dd-4c3c-2972-08dd5d62465c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5938
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Mar 2025 10:24:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212427

T24gNyBNYXIgMjAyNSwgYXQgMDc6NTEsIFl1LCBNaW5nbGkgdmlhIGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcgPG1pbmdsaS55dT1lbmcud2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gDQo+IEZyb206IE1pbmdsaSBZdSA8bWluZ2xpLnl1QHdpbmRyaXZlci5jb20+
DQo+IA0KPiBtaW5pemlwIFsxXSB1c2VzIHpsaWIgWzJdIHRvIHN1cHBvcnQgY29tcHJlc3NlZCBh
cmNoaXZlcy4NCj4gDQo+IG1pbml6aXAgaXMgbm90IHBhcnQgb2YgemxpYiwgYnV0IGlzIGluY2x1
ZGVkIGluIHRoZSB6bGliDQo+IGRpc3RyaWJ1dGlvbiBbMV0gYXMgYSB0aGlyZC1wYXJ0eSBjb250
cmlidXRpb24gaW4gdGhlIGNvbnRyaWINCj4gZGlyZWN0b3J5Lg0KDQpUaGUgbWluaXppcCB3aGlj
aCBoYXMgIkFsbCBmaWxlcyB1bmRlciB0aGlzIGNvbnRyaWIgZGlyZWN0b3J5IGFyZSBVTlNVUFBP
UlRFRC4gVGhleSB3ZXJlDQpwcm92aWRlZCBieSB1c2VycyBvZiB6bGliIGFuZCB3ZXJlIG5vdCB0
ZXN0ZWQgYnkgdGhlIGF1dGhvcnMgb2YgemxpYi7igJ0gaW4gdGhlIFJFQURNRT8NCg0KV2h5IHdv
dWxkIHdlIG5lZWQgdGhpcyBhdCBhbGwsIGFuZCB3aHkgd291bGQgaXQgYmUgaW4gY29yZT8NCg0K
SWYgdGhpcyBpcyBlc3NlbnRpYWwsIHdoeSBub3QgYnVpbGQgaXQgYXMgcGFydCBvZiB6bGliPw0K
DQpSb3Nz


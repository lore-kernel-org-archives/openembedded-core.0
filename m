Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC044CCD193
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 14:40:47 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.48])
 by mx.groups.io with SMTP id smtpd.web10.20439.1760971237579788966
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 07:40:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=VN/nOWfu;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=VN/nOWfu;
 spf=pass (domain: arm.com, ip: 52.101.66.48, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=LHzNMWvGXxAegA74SbbZ9OZpFktflyDuK+QaL9oe2NBaPlsbhOEerH+e2SrfDdFikp0s7/spYbgL3P3UgfIVF+DgkMn2DAKIKcKmvt3wwh4DTHewZPxsupABwwHPNi22BueOJPzdd4JInGBbUx9FuBCg4hKQMgWpCzPzftMynsb5hjSIeXox0oddJlG3tOfaG6CUxyuEn0aNpO78cfWyWaUIQKR1WFOaVAzPtEFZl6vjofRBnNnpYQFSt8P/GLyEman5gQD1Gaq/bO+b1FxFjBEySDUVeNGPU8I+wdOUzoVwFtiN95E5YBuThONcv1pzFGhLuL6XQ57mgrp0vM0AmA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BP6u8p9Qx09spOEIqixbVF08Axj3EwRbcPxaz3OGBfk=;
 b=s0YyknHklaluIrXW44uxfllkCUwZxXJG1699sPoh+HZ4e8+h3kMua/QYB6CbCySdabydxVEpDgZBn2NQx7XOf2hf0PF+tproLMTtrgliJ9LOdDz03oHiw0UkWBCjPiZeHwmy13HCZTzW+xYtNfojwO1nh9usRSt5vAN88qqs81V13qkyYMe/6fxonAyeVYtKFYJOr7hSykpfMV7J3bX78XrrtSP7z9+m4JTyYBOwdgEP3f+tA1SiQ0dXtblkLv6NZs67PhjrQ0FiiJ5u/OtVUY8i/L+bCNdBxSS9F47p5n0rJWJsbRPKuIVUfOrGz1Q1AD7faQKKUil1lav3sBvXLA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BP6u8p9Qx09spOEIqixbVF08Axj3EwRbcPxaz3OGBfk=;
 b=VN/nOWfujlZsa9Kkk069d2Edf6GX1qGuKQ7n2kTMZyvfyLoIfsHAT4RgQp3WY5JBox9H/073ctKufoElCjIaJhnZ1EQAe7YLL2bzWVvZXattarY96hMYIubYuLhR5A9sVp3cgbNUspCgWqKzulEFvdVZGjb65kv/1TZztNlEPi0=
Received: from AS9PR06CA0037.eurprd06.prod.outlook.com (2603:10a6:20b:463::21)
 by VI1PR08MB10050.eurprd08.prod.outlook.com (2603:10a6:800:1c4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.14; Mon, 20 Oct
 2025 14:40:34 +0000
Received: from AMS1EPF0000004A.eurprd04.prod.outlook.com
 (2603:10a6:20b:463:cafe::a3) by AS9PR06CA0037.outlook.office365.com
 (2603:10a6:20b:463::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.16 via Frontend Transport; Mon,
 20 Oct 2025 14:40:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000004A.mail.protection.outlook.com (10.167.16.134) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Mon, 20 Oct 2025 14:40:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BpQZVc8wSROb9VJ7E7dyeJxS5C8RaxT19maBeqGK7Vzonxc8op4dYel5gEh8gnvJszcej6JXi66XppaiCqRAxE7SiIkwtUFxF95LhYpHIZsWNrJvWNUwXAxKq1cjm3u3mOUgqA2rHdYrmf/3dbGpzsTpiA1izF5lO1HmMMO3dfowi8FAxSsr+enbdkUW4lzmLFjrCxOy8INP/D2QkZZEwgziui5JFK6EuWB54+/9kUTkLZTW/7ykv85oZLu+XET9brbcZ4SogSC5qRFcuyV7XlAhH/T/OeEA88AZrXfFGQefF/oksNSozw0SZ4nPBbKCBZGzY/Lg7AInpfE452H/Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BP6u8p9Qx09spOEIqixbVF08Axj3EwRbcPxaz3OGBfk=;
 b=CgmUnTVDY7osxmk8lfMDmUugdiauefykE1q7DYhPCgvbX7D5aozqFBTIkVVyQxwxPBbXhwO4q927vXMFaVBcZbdzMQCuDJRP5E/qs1gxa9k4d+g0j/e9evMwHh8whEFy8vtJyJF01y0g8ik+bjxxzduGT0wSciPAO0541ECcBGv++eA5R1j/cjNMz482/7264P6fLEDBK1qXMxk5LPRkjyUE/IYq/1rG/I2z0F0WVBe89fYPgt/+N+F56ByO33lVOn5lc83IZgIdrNJ4iWAKmHga9cSZtUIJ0nGEtqfpB+KLD0Wu5+Nhp25UDraRs4oGuPwWBOn9FbmOrzJNV26HNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BP6u8p9Qx09spOEIqixbVF08Axj3EwRbcPxaz3OGBfk=;
 b=VN/nOWfujlZsa9Kkk069d2Edf6GX1qGuKQ7n2kTMZyvfyLoIfsHAT4RgQp3WY5JBox9H/073ctKufoElCjIaJhnZ1EQAe7YLL2bzWVvZXattarY96hMYIubYuLhR5A9sVp3cgbNUspCgWqKzulEFvdVZGjb65kv/1TZztNlEPi0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBBPR08MB10819.eurprd08.prod.outlook.com (2603:10a6:10:53a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 14:40:00 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9228.012; Mon, 20 Oct 2025
 14:40:00 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Sundeep.Kokkonda@windriver.com" <Sundeep.Kokkonda@windriver.com>,
	"deepesh.varatharajan@windriver.com" <deepesh.varatharajan@windriver.com>
Subject: Re: [OE-core] [PATCH V5 2/3] rust: Use llvm instead of rust-llvm
Thread-Topic: [OE-core] [PATCH V5 2/3] rust: Use llvm instead of rust-llvm
Thread-Index: AQHcPbp4drTr3kWEvEidTbg0RiBd+bTK7FeAgAA2+wA=
Date: Mon, 20 Oct 2025 14:40:00 +0000
Message-ID: <B7F26DCA-922C-4758-8447-2B89240B182F@arm.com>
References: <20251015095914.2120664-1-Deepesh.Varatharajan@windriver.com>
 <20251015095914.2120664-2-Deepesh.Varatharajan@windriver.com>
 <4F641BFF-8B16-46C4-836C-51705A5659D0@arm.com>
In-Reply-To: <4F641BFF-8B16-46C4-836C-51705A5659D0@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBBPR08MB10819:EE_|AMS1EPF0000004A:EE_|VI1PR08MB10050:EE_
X-MS-Office365-Filtering-Correlation-Id: 566ade69-18a6-4c50-467a-08de0fe6a02c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?SjlGRnVkYkQvYS9aN3FORTlLSDBYcW5pTUdtRkNkTE5oYnc3NWdmMUFPdXow?=
 =?utf-8?B?MUpzcGM1cGhKWWdNZ0VGcEVaa0VxUVFPR2tHWlJXYkVzcnFkWUsvQ0hEQVNP?=
 =?utf-8?B?TkpvM001L2h0bjh6N3BGdlRUMExnVnNEZlZnQ3RvSEJGU2RyY2xnSTNzczZu?=
 =?utf-8?B?QU1WOFlLeUpBN05rQ0RqaUhGZHU4YVY0QVZxRmEwTDBrcUJqZENQWkZyTUpw?=
 =?utf-8?B?UkFwbHZERFVPNUFyY3V0ZExyR25kOTkrNmRzODVObFVHTGtNZkFHV2wyNWZu?=
 =?utf-8?B?SHdWaVFUVHpNQU1qeTFmVFo0UG1RbUh3SkpRUkR4b05mRkN1cDZpR2prTi9D?=
 =?utf-8?B?QUg2RlVSRnpULzJNTGpGVXBKWFUwYlg5bmtvTitSSUNZMndibzF3UEFDR3pN?=
 =?utf-8?B?TTViOWVJQVdCR0lqMW42Z01VQzE1QUpxUE1TRkJyVjY1aFArUVJBUElXRkxF?=
 =?utf-8?B?Zjc3RTZCOTNwK0NkR0pHazdFdllzeXpHd1lKbE9ibktpdXQzTjBJYURJQW4v?=
 =?utf-8?B?VWRtSXlJLzlpMkZWZlhOMG5UaVRDd1VxblV2WlBWbW1aV0F4S1hJZ1BmM3FM?=
 =?utf-8?B?ZCtvK1BsYklaVlFiYy9BOHFXejYyQ2N5QU9XUWNPbDgrRXBIUEN5UGlNdVdl?=
 =?utf-8?B?M3E4TnVuU0o2WUtFd1Ric1E2ZSthZlBBSnZBYVFRdTZpY0xkbjNDWFRQZXlq?=
 =?utf-8?B?YUdyTzY2eTJEZWdJeitTQlJRYVh6ZkdpNUd2aysxVjI4ZXp2RWQ4eVB4VGxt?=
 =?utf-8?B?b3RxUkFMUmp5azBySEZaMHVDdmw1RXlpVmJEeWFKWlg4Z0I1ZHR0RzVuaDNs?=
 =?utf-8?B?NmFXa2x0TE9rNmY1cVhTNjROUkkxYzc3VkpqUnVNdy92VXJ5c0hVQW5WaEp2?=
 =?utf-8?B?Y0g1OG1CM3ZROGRSUnFRSEdRanMwaC8vWmRTU2VnT2VzOGR2L0lnZ2JzNWZX?=
 =?utf-8?B?RjJOSlB4YlNWK3N2NWw2TDA3cWVtM0tlS1JHT1lXa0gvd0V6QzFlQnd4TTdt?=
 =?utf-8?B?eHhxRDdmdVNETU16MlIzNlNENkpCTUh0ZWNkeEF1MEQrTWFUM0tnMFNQbTdF?=
 =?utf-8?B?UkEzZnlZQzlmUVVJMmx4cGhLSTJxS1lEbXBwZmtqSkRDNGg3RUtOS08renc1?=
 =?utf-8?B?MEtWWVVLQnBCczc3MnBBU3VWS2kzK1BCSUtYdFQzVzkyNTVUM0RrQ29NMjFa?=
 =?utf-8?B?MGJOUFlDbWMycTNKMDg0N0VIaW4venMwWlBzWkJ5dlk0ZXBDWmxqUkJXd3pL?=
 =?utf-8?B?d3EyLzFKQXpHaHdldUtXbkF2cEIwdE1QbjYvZlFsWkNmMWRUei9uWDZoRncy?=
 =?utf-8?B?TitSam1ucFlVcWNXRVhjdGVQV1dlZkF1aDdwOW1SaVBRbUVJc2tEVGNjZHFM?=
 =?utf-8?B?SFhKNk0rNWVGNHFXb1oxZVdpYzMxblBBaXVyZzhoWTZoN3hHT2NYUnh0TTBN?=
 =?utf-8?B?UmN5Rm9qam9WaEFNNmovdGVWelpsR1Jua1FCNGlwK2dzNmpYejhqbmRmV2Nx?=
 =?utf-8?B?S2tpRUphOHEwU2RZN09KMUtsZEh3eEUrRm1OT1BlYmNUa3gxVWRFUzNKYWJD?=
 =?utf-8?B?NkJtZ1ByQjJGK0lhTHBQY2tidU5lNE9jOUtoaGJXQ2htNmtHbWpTYitrNi9Y?=
 =?utf-8?B?RFdiVy9qSEJmeFJHSDdEN2lMUHdnSmhrWXAvUVVxSHhiNTd6T0FGNDZsLzdj?=
 =?utf-8?B?bWlLdDBvU3NBb3MrVGlhSE4rRTdmaFliS2h1VEdyenUyUEMxeCtsbFdXOUhW?=
 =?utf-8?B?SHZzMEVla2dkTXY3bHJ4Ykt3UHV5dVFWNWFNQ1Z4Vm1Wc1V5UDNrVVNtRGFU?=
 =?utf-8?B?akxRZ3R6eFJrcWZXSnN3WVRZY21rekhsM0g0MDQrUWNETDhZVllnOGFZRGVH?=
 =?utf-8?B?ZnB4L2haMlFaeUgvRWdrciszMm92dGgrQTVpVTNDQjM1M3d6U2xtazBFRjlp?=
 =?utf-8?B?NXlIaWxBZmk3TERRcnY3NGx6SWlMZ0Z5YmVFS21UK05LcUptR2FsNWlNQ24r?=
 =?utf-8?B?b3hOY0lEZTY2dDBPeXArVDFDWm1lY3NHMTNjU3NDam5uc3B5dmJaTlpYbDJr?=
 =?utf-8?Q?Vv9Fzb?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DEAF278D8DD8104F8118368EB05279D7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10819
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF0000004A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c66d6e21-effb-4483-534d-08de0fe68c4f
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|1800799024|376014|36860700013|14060799003|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NytORzMxVGVXWlRTTXI0T0tIbXpYM0lWWGEvTUVLOGFaUmpuSk9nZFFqdVhM?=
 =?utf-8?B?dDArTi82SmlPSTdIVzVHbzJoZUJ6L09NTFFQcTMwekNFMHVLSHErTXhOTWRQ?=
 =?utf-8?B?cE9TOC9jcEhpeC8zNVVBcitrc0NVQ2ovNFBhUWpBMUMrb0xId0o1TE56SlVi?=
 =?utf-8?B?QU1MVHFlQ2Q3VDU3MGxSbkZQU0hla2ZZR3hPL1FJd3J4QkdaUFdFZTRFM2dE?=
 =?utf-8?B?SW9ZVlU5YWlxSWJHU2FKSVBPaER0bTBmdE9zcUliUURnT3BHbUdxdHpUWndB?=
 =?utf-8?B?MFQ0c1B4ZEZnaU8wenpEVUMxaFFOYUhWeWFkZDFqTkhWdWpuNW5RWllxZ1hm?=
 =?utf-8?B?YnZJMmNXOVV0VlRWcloyUnd1b1F6UXpCdHc0dWVUSkpFVlMyMElXN2hMR3RY?=
 =?utf-8?B?SGJld1UxVllyK0FhUG42S1lPSWVvUnJONCtkVGZHaXVveVhJalNLS0M0Ynhl?=
 =?utf-8?B?QjI5NjQwNlJHck84cnE4VWc5dm10V2hvVWIwUGdrY2l3c1B5ZnFBdTMxM3VY?=
 =?utf-8?B?eS9OYXM1am9LVDVEQ1ZaNWtkMjBTSW51UTBWWStCS1pNMDRQTzdaZ1YzT0pr?=
 =?utf-8?B?TkczSFI1WTNDSDVzVHd5WDFYeTJ3eE84dDZoVi9GR0FlcTFEclA3dHMzR1ph?=
 =?utf-8?B?M3lWVHZFYWdPUTZRVFFqZlNKUTlEVGpMNC9MOW5YU1JGVUJoaFRMLzBRY0I4?=
 =?utf-8?B?UDB1Ty9KMkRyWEhvVlo0a1ZjNDViMXFvRDE1VG9FNzZEeW9RblMycmF2RUdO?=
 =?utf-8?B?YjJ0aCtLNTkyWUVWQXBQUHNwUzZRK0xwdkJwSzV1NmxKNFhrMDNZOU1EZ3hW?=
 =?utf-8?B?OTAzcnlFckd4bUpNSmtyd0FGTlZFamlhN1k0K21QU3RlQ2ZmYlhQTFpkMUVE?=
 =?utf-8?B?dzRqcnpNM0ZXM0xadEFCd1pNTkZIS2NrbnRxR3ZJbkpGc1hETlY0cnBHZXpH?=
 =?utf-8?B?SnBjdXdCWGdaenArdVhHU0VtVVNoVXZDaVFOV0JNM0RmRGZqUmkzUVJlT2sw?=
 =?utf-8?B?Nk9pbExIa3FhTEVWSVJSUHlUZlJQNS9qZ1JLKzM2a29XT1JqNlZQUHo1cGRr?=
 =?utf-8?B?NnlYTytUdWViZG1CWGJNdTdpWFBFSUJ4T3lEOFdiTGVWSW1oTUkxUGpza3dn?=
 =?utf-8?B?TUNEZzUvNnBjc2I5VU1NSlpKWVlnOFBSYk9sRFV4ZjFaK21MOFg3NXd2RExB?=
 =?utf-8?B?bm9jYys0ZTRJanc0ZkxYS1hhNDJFQTZUMmZYZzgvVHZYSTJRekptR0tCVmUv?=
 =?utf-8?B?aHdoNzFHTUZ1MHA1dm40MmdtZ0ljMUZnT0FzQ3dIcjRPNnZzbE9FNkRheVMz?=
 =?utf-8?B?KzNVempENFBJcjUwV2drOXdCWUp6aDg3d0YrZHR2aTZwanNnNmIwQnRLSUky?=
 =?utf-8?B?b3Q1akZRQkdHYVlhQ2pCblFVbzNJTmVhRzBHWGE5SG5welEvbStWRnR2ek9D?=
 =?utf-8?B?RXkxMTdNTlFZMmthaDc2MGNycCtVSkliTXAzRjRYUGNKQ1ZYVWpjWkhMdzFL?=
 =?utf-8?B?eGsva1NiYXIvQVlIZEVaZjMwbTdjRDNQUVBwUTVrdGVtQVN2a1VIMGlGNWNF?=
 =?utf-8?B?cEdIZndoOSs5R3crS1pOM1QxRHVnT2cya0lLcENTT2dpUTVBekpWb1RSdlJw?=
 =?utf-8?B?alU4dytNU1RJR1hjVmxYUHIzNW5PMUdkOEhjTThldVZuQ01acTJsanF1bklw?=
 =?utf-8?B?RUZzdXc4NWM1UWNmVzVqSCt2NVZWUTkveTlFZU1UaWRLY2N3akZUSlQvSmRK?=
 =?utf-8?B?WHh6ZjRqSXdmejd5K3E3UXRqektaSnYra0g0dkRPN3BXY3g5aTNiamtzOTBS?=
 =?utf-8?B?WFpyclpWaFBaVkxUL2VMZmtmR1EybTE4bkZZTWpPRnNySnI3ek80aHRKRHVD?=
 =?utf-8?B?bHlXR3E5amhVQW52aEsvY3ViTittaDFJcnJCcXRRbUlFQ2U0bm55emxaczVX?=
 =?utf-8?B?ajRTMGZXTVNvTEJaR3NXenFIdC9MZFBleGIzZkMwcTlPOXZ0NVQvWUtPREZ2?=
 =?utf-8?B?RVllWlE3RWxWcXd3WWc4RkxzdlBIQWtEN1VINWdVOTBudTVudU1hbDBKdndH?=
 =?utf-8?B?NnBoMkMwTk5BVE0vdEN3S09tdDAxdmtWcTVVR3d3RWxvZW1YSklkdis1OHBm?=
 =?utf-8?Q?uUgA=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(376014)(36860700013)(14060799003)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 14:40:33.6356
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 566ade69-18a6-4c50-467a-08de0fe6a02c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000004A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 14:40:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225121

T24gMjAgT2N0IDIwMjUsIGF0IDEyOjIzLCBSb3NzIEJ1cnRvbiB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8cm9zcy5idXJ0b249YXJtLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90
ZToNCj4gDQo+IEhpLA0KPiANCj4+IE9uIDE1IE9jdCAyMDI1LCBhdCAxMDo1OSwgVmFyYXRoYXJh
amFuLCBEZWVwZXNoIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxkZWVwZXNoLnZhcmF0aGFy
YWphbj13aW5kcml2ZXIuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPj4gVXBk
YXRlZCB0aGUgUnVzdCBidWlsZCB0byBkZXBlbmQgb24gbGx2bSBpbnN0ZWFkLg0KPiANCj4gQmVj
YXVzZSBJIHdhcyBjdXJpb3VzLCBJIGxvb2tlZCBhdCB0aGUgYnVpbGQgc3RhdHMgYmVmb3JlIGFu
ZCBhZnRlciB0aGlzIHNlcmllcyBiZWluZyBtZXJnZWQuIEhlcmUgYXJlIHRoZSBkaWZmcyBmb3Ig
Y3B1dGltZSBhbmQgd2FsbHRpbWUgd2hlbiBJIGJ1aWx0IGxsdm0tbmF0aXZlL3J1c3QtbGx2bS1u
YXRpdmUgYW5kIHJ1c3QtbmF0aXZlOg0KPiANCj4gIFBLRyAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFRBU0sgICAgICAgICAgICAgICAgICAgQUJTRElGRiAgUkVMRElGRiAgQ1BVVElNRTEgLT4g
Q1BVVElNRTINCj4gLSBydXN0LWxsdm0tbmF0aXZlICAgICAgICAgICAgICBkb19jb21waWxlICAg
ICAgICAgICAtMTIyNDEuOHMgIC0xMDAuMCUgIDEyMjQxLjhzIC0+IDAuMHMNCj4gLSBydXN0LWxs
dm0tbmF0aXZlICAgICAgICAgICAgICBkb191bnBhY2sgICAgICAgICAgICAgICAtMzEuNHMgIC0x
MDAuMCUgICAgIDMxLjRzIC0+IDAuMHMNCj4gLSBydXN0LWxsdm0tbmF0aXZlICAgICAgICAgICAg
ICBkb19jb25maWd1cmUgICAgICAgICAgICAgLTkuNHMgIC0xMDAuMCUgICAgICA5LjRzIC0+IDAu
MHMNCj4gLSBydXN0LWxsdm0tbmF0aXZlICAgICAgICAgICAgICBkb19wb3B1bGF0ZV9zeXNyb290
ICAgICAgLTYuMnMgIC0xMDAuMCUgICAgICA2LjJzIC0+IDAuMHMNCj4gKyBsbHZtLXByb2plY3Qt
c291cmNlLTIxLjEuMyAgICBkb19wYXRjaCAgICAgICAgICAgICAgICAgIDUuOHMgICAgK2luZiUg
ICAgICAwLjBzIC0+IDUuOHMNCj4gIHJ1c3QtbmF0aXZlICAgICAgICAgICAgICAgICAgIGRvX3Bv
cHVsYXRlX3N5c3Jvb3QgICAgICAgOS41cyAgKzMyMy4wJSAgICAgIDIuOXMgLT4gMTIuNXMNCj4g
KyBsbHZtLW5hdGl2ZSAgICAgICAgICAgICAgICAgICBkb19jb25maWd1cmUgICAgICAgICAgICAg
MTIuOXMgICAgK2luZiUgICAgICAwLjBzIC0+IDEyLjlzDQo+ICsgbGx2bS1uYXRpdmUgICAgICAg
ICAgICAgICAgICAgZG9fcG9wdWxhdGVfc3lzcm9vdCAgICAgIDE4LjZzICAgICtpbmYlICAgICAg
MC4wcyAtPiAxOC42cw0KPiArIGxsdm0tcHJvamVjdC1zb3VyY2UtMjEuMS4zICAgIGRvX3VucGFj
ayAgICAgICAgICAgICAgICAyMC4wcyAgICAraW5mJSAgICAgIDAuMHMgLT4gMjAuMHMNCj4gKyBs
bHZtLXRibGdlbi1uYXRpdmUgICAgICAgICAgICBkb19jb25maWd1cmUgICAgICAgICAgICAgMjku
MHMgICAgK2luZiUgICAgICAwLjBzIC0+IDI5LjBzDQo+ICsgbGx2bS10YmxnZW4tbmF0aXZlICAg
ICAgICAgICAgZG9fY29tcGlsZSAgICAgICAgICAgICAgNTkzLjFzICAgICtpbmYlICAgICAgMC4w
cyAtPiA1OTMuMXMNCj4gIHJ1c3QtbmF0aXZlICAgICAgICAgICAgICAgICAgIGRvX2luc3RhbGwg
ICAgICAgICAgICAgMTcyNC4ycyAgICsyNi4xJSAgIDY2MTEuM3MgLT4gODMzNS41cw0KPiArIGxs
dm0tbmF0aXZlICAgICAgICAgICAgICAgICAgIGRvX2NvbXBpbGUgICAgICAgICAgICAxMjA1MS42
cyAgICAraW5mJSAgICAgIDAuMHMgLT4gMTIwNTEuNnMNCj4gDQo+ICBQS0cgICAgICAgICAgICAg
ICAgICAgICAgICAgICBUQVNLICAgICAgICAgIEFCU0RJRkYgIFJFTERJRkYgIFdBTExUSU1FMSAt
PiBXQUxMVElNRTINCj4gLSBydXN0LWxsdm0tbmF0aXZlICAgICAgICAgICAgICBkb19jb21waWxl
ICAgIC00MDEuMXMgIC0xMDAuMCUgICAgIDQwMS4xcyAtPiAwLjBzDQo+IC0gcnVzdC1sbHZtLW5h
dGl2ZSAgICAgICAgICAgICAgZG9fdW5wYWNrICAgICAgLTIzLjBzICAtMTAwLjAlICAgICAgMjMu
MHMgLT4gMC4wcw0KPiAgcnVzdC1uYXRpdmUgICAgICAgICAgICAgICAgICAgZG9fdW5wYWNrICAg
ICAgLTIxLjNzICAgLTQyLjUlICAgICAgNTAuM3MgLT4gMjguOXMNCj4gLSBydXN0LWxsdm0tbmF0
aXZlICAgICAgICAgICAgICBkb19jb25maWd1cmUgICAgLTkuMHMgIC0xMDAuMCUgICAgICAgOS4w
cyAtPiAwLjBzDQo+ICsgbGx2bS1wcm9qZWN0LXNvdXJjZS0yMS4xLjMgICAgZG9fdW5wYWNrICAg
ICAgICA3LjBzICAgICtpbmYlICAgICAgIDAuMHMgLT4gNy4wcw0KPiArIGxsdm0tbmF0aXZlICAg
ICAgICAgICAgICAgICAgIGRvX2NvbmZpZ3VyZSAgICAxMi4zcyAgICAraW5mJSAgICAgICAwLjBz
IC0+IDEyLjNzDQo+ICsgbGx2bS10YmxnZW4tbmF0aXZlICAgICAgICAgICAgZG9fY29uZmlndXJl
ICAgIDI4LjVzICAgICtpbmYlICAgICAgIDAuMHMgLT4gMjguNXMNCj4gKyBsbHZtLXRibGdlbi1u
YXRpdmUgICAgICAgICAgICBkb19jb21waWxlICAgICAgMzAuMXMgICAgK2luZiUgICAgICAgMC4w
cyAtPiAzMC4xcw0KPiAgcnVzdC1uYXRpdmUgICAgICAgICAgICAgICAgICAgZG9faW5zdGFsbCAg
ICAgIDMzLjRzICAgICs2LjAlICAgICA1NTMuNHMgLT4gNTg2LjhzDQo+ICsgbGx2bS1uYXRpdmUg
ICAgICAgICAgICAgICAgICAgZG9fY29tcGlsZSAgICAgMzc4LjBzICAgICtpbmYlICAgICAgIDAu
MHMgLT4gMzc4LjBzDQo+IA0KPiBGb3IgbGx2bSB2cyBydXN0LWxsdm0sIEnigJl2ZSBhIGxvY2Fs
IHR3ZWFrIHRvIG5vdCBidWlsZCBzb21lIG9mIHRoZSBHUFUgYmFja2VuZHMgKGFzIHRoZXkgdGFr
ZSBhIGxvbmcgdGltZSkgc28gaXTigJlzIGFjdHVhbGx5IGNvbXBhcmluZyBsaWtlLWZvci1saWtl
LCBhbmQgaXTigJlzIGdvb2QgdG8gc2VlIHRoYXQgdGhlIGNvbXBpbGUgdGltZSBpcyBjbG9zZS4g
IEl04oCZcyBzbGlnaHRseSBmYXN0ZXIgaW4gbGx2bSBldmVuIHRob3VnaCBpdOKAmXMgYnVpbGRp
bmcgbW9yZSBiYWNrZW5kcywgc28gSeKAmW0gZ2xhZCBteSBidWlsZCB0d2Vha2luZyB3YXMgdXNl
ZnVsLg0KPiANCj4gSG93ZXZlciwgcnVzdC1uYXRpdmUgdGFrZXMgMjYlIG1vcmUgY3B1IHRpbWUg
KGp1c3QgNiUgbW9yZSB3YWxsIHRpbWUsIGR1ZSB0byBwYXJhbGxlbGlzYXRpb24pLiAgSeKAmW0g
d29uZGVyaW5nIGlmIHRoaXMgaXMgZmFsbG91dCBmcm9tIHVzaW5nIC1PcyBpbnN0ZWFkIG9mIC1P
Miwgb3Igc29tZXRoaW5nIGVsc2UgYWJvdXQgaG93IHdl4oCZcmUgYnVpbGRpbmcgcnVzdC1sbHZt
IHZzIGxsdm0uICBJbnNpZ2h0cyB3ZWxjb21lLCBidXQgSeKAmWxsIGxpa2VseSBmaXJlIGEgdGVz
dCBidWlsZCB3aXRob3V0IC1PcyB0byBzZWUgaG93IHRoYXQgaW1wYWN0cyB0aGUgbnVtYmVycyBs
YXRlci4NCg0KRm9sbG93dXAsIGNvbXBhcmluZyBjdXJyZW50IG1hc3RlciB0byBtYXN0ZXIgYnV0
IHdpdGggTExWTSBidWlsdCBhcyBSZWxXaXRoRGViSW5mbyBpbnN0ZWFkIG9mIE1pblNpemVSZWw6
DQoNCiAgUEtHICAgICAgICAgICAgICAgICAgIFRBU0sgICAgICAgICAgICAgICAgICBBQlNESUZG
ICAgUkVMRElGRiAgQ1BVVElNRTEgLT4gQ1BVVElNRTINCiAgcnVzdC1uYXRpdmUgICAgICAgICAg
IGRvX2luc3RhbGwgICAgICAgICAgIC0xNjkwLjRzICAgIC0yMC4zJSAgIDgzMzUuNXMgLT4gNjY0
NS4xcw0KICBsbHZtLW5hdGl2ZSAgICAgICAgICAgZG9fY29tcGlsZSAgICAgICAgICAgIDYwODEu
N3MgICAgKzUwLjUlICAxMjA1MS42cyAtPiAxODEzMy4zcw0KDQpDdW11bGF0aXZlIGNwdXRpbWU6
DQogIDQxMTcuNHMgICAgKzE5LjUlICAgIDU6NTI6MzYuMSAoMjExNTYuMXMpIC0+IDc6MDE6MTMu
NSAoMjUyNzMuNXMpDQoNCg0KICBQS0cgICAgICAgICAgICAgICAgICAgVEFTSyAgICAgICAgICAg
ICAgICAgQUJTRElGRiAgIFJFTERJRkYgIFdBTExUSU1FMSAtPiBXQUxMVElNRTINCiAgcnVzdC1u
YXRpdmUgICAgICAgICAgIGRvX2luc3RhbGwgICAgICAgICAgICAgMjQuMHMgICAgICs0LjElICAg
ICA1ODYuOHMgLT4gNjEwLjhzDQogIGxsdm0tbmF0aXZlICAgICAgICAgICBkb19jb21waWxlICAg
ICAgICAgICAgMjM4LjlzICAgICs2My4yJSAgICAgMzc4LjBzIC0+IDYxNi44cw0KDQpDdW11bGF0
aXZlIHdhbGx0aW1lOg0KICAyNTEuM3MgICAgKzIyLjglICAgIDE4OjI0LjcgKDExMDQuN3MpIC0+
IDIyOjM2LjAgKDEzNTYuMHMpDQoNClNvIHJ1c3QgYnVpbGRzIGEgYml0IGZhc3RlciwgYnV0IExM
Vk0gaXMgYSBsb3Qgc2xvd2VyIHRvIGJ1aWxkLCB3aXRoIGEgbmV0IHJlc3VsdCB0aGF0IHRoZSBi
dWlsZCBpcyBhY3R1YWxseSBzbG93ZXIgb3ZlcmFsbC4gIEnigJltIGhhcHB5IHdpdGggdGhlIGNo
b2ljZSB0byB1c2UgTWluU2l6ZVJlbCBpbiBMTFZNLiANCg0KUm9zcw==


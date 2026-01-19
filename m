Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8349D29C57
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 18:09:02 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41268.1768846134966621823
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 10:08:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=L4TH9yVQ;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=L4TH9yVQ;
 spf=pass (domain: arm.com, ip: 52.101.84.46, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=C/luefLSwYhmLdPH7+T3V9v5V/kMUYZJFfCUAw9M4hWDapF0VD4im2UilfYwC8CPmr3hdD8bRu3nSpPAwc19Ms5FFVnX3roRzuXxlM19ZpVyw4uehwwDwKB1R0/UasuM4snLA8gM7CnSC6+dPQGzpBHC/X1P1ZB5kg/tsIQPR8gpnHA4XpmURsUwdFMedKUC2IPv3jkSWhyK1njLIg2tWrtpS/F/mFSDV0oCzPDalZLOseUq1QFSowcT89AELGvb4yjZJNv3eDkzaACxj/Ya/4aiCm/iz7w4L05tjADZtghKMZpuBtkxn1QoLErO+bcU+bNIMRKCLbFAEuPURPOMSw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cP1C5PoCpXg/+ZpLRqBZj/gdISGPHc1hBetT5ncoH4s=;
 b=rpG6KCF+sBr84GNzx7xs4UZJgmHT2yVkX6qqvlqSqntgDAN+XWO/iizMeTu7GIndVmi/UmtLRx/NRMbk2CMUETqBepDVq0p7Yf3Mprt7kYKJtudVAYc+D4jSC+H4m8nA/V6Sv9+2BeC6hKwx1Ztdcoy7DpLOhD3J0/uJ88xg90GmoQsCF44ueQnsiswaUGDuqdM1zuQ9YYJvPtCGMAViieebNhcDWDRliSZorogNAbjuhzbxOOiHhEN+lpD/z6FgnCV+CCasGyCEJ+BadshQn9H5GY5yGBJF4YNR+7MY9KFYHioDwDO+MUsf8MZPyFR4ZRU7/gMrkdVsb4CPeFwlIA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cP1C5PoCpXg/+ZpLRqBZj/gdISGPHc1hBetT5ncoH4s=;
 b=L4TH9yVQ5xzMWL6ITuRZ/cyOvOth8vhKbgX/d4Xj5w2c/jeOyEtqH9Hn7qakll+426CO07HVzriSYuZtpjbcU1P7ySAFXDIY/2G7VLWyDF02IDm/3r0vQvvQJ5VSeD/Y1IFX4PBT3bMIPjE4KMc/zMXKSd8uzJswMJpa7HB7EyI=
Received: from DB3PR08CA0018.eurprd08.prod.outlook.com (2603:10a6:8::31) by
 AS2PR08MB10154.eurprd08.prod.outlook.com (2603:10a6:20b:62e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Mon, 19 Jan
 2026 18:08:49 +0000
Received: from DB1PEPF000509FC.eurprd03.prod.outlook.com
 (2603:10a6:8:0:cafe::e8) by DB3PR08CA0018.outlook.office365.com
 (2603:10a6:8::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.11 via Frontend Transport; Mon,
 19 Jan 2026 18:08:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FC.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Mon, 19 Jan 2026 18:08:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dO0UBqnNmzXULIgxujtSOt/POP5rFrBkZ/gJYE82j0SB/hwPLzkY46bnmoApdWmJVPIDOpccVlLEkbhBlrRorsdBBZqgQUGowQltLNeb/Z6EJVu/QWnuc4gK/0sv0OWPKvGlmrs4oXSY1G/xDh885xkbF7TNzQeYAwxyLBB/n5CyqzMOBObsm5ep9zeDo0AWw/vVAEFLP3yDNa6+5F/BorBPCMycx2jCdqZup6aBschifpGgeq7C2PYFrLlLh6hsH0MV/fCoMPgH6ZLKkb4PpWKJV9O/VsyAa+YIZyLnD2YQHaDbGDD5L9bv8bdeiW5r87QeBoRTiHnmxjRuFFKkmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cP1C5PoCpXg/+ZpLRqBZj/gdISGPHc1hBetT5ncoH4s=;
 b=dOQghnjMu+TraJlq5/0pHClrYVbB+pPLPEGXNkw4MnxnkUjvV0MsszoxnbAFlGjPd6eg04nAZCQ1wpyEJ60n/fVSvXjlTlS96jLry4eVRXmzHSaLVcEBk8VKKaSIVt5+M5jva23ZAoaOzZRWvjbqp8n1aDQD0Wbd3oU5jbhy0OEdCKmyrC9PDzEA6WYnWy3T0DcLgLqJnryUM9yokqcZQTjmklHIP6ctXOBvA62C14/u8ywwYfJIYoSebR4D40f+2l1UF5mOQqsOKXjlEi8/emd+cF/uwnCZYSJGIrQ879N+cnC6yIBD3nqAZOpw5Zkqzwzzv/EfjlcXZj4Hw3RTMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cP1C5PoCpXg/+ZpLRqBZj/gdISGPHc1hBetT5ncoH4s=;
 b=L4TH9yVQ5xzMWL6ITuRZ/cyOvOth8vhKbgX/d4Xj5w2c/jeOyEtqH9Hn7qakll+426CO07HVzriSYuZtpjbcU1P7ySAFXDIY/2G7VLWyDF02IDm/3r0vQvvQJ5VSeD/Y1IFX4PBT3bMIPjE4KMc/zMXKSd8uzJswMJpa7HB7EyI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB5PR08MB10255.eurprd08.prod.outlook.com (2603:10a6:10:4a5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Mon, 19 Jan
 2026 18:07:45 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9520.010; Mon, 19 Jan 2026
 18:07:44 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "hongxu.jia@windriver.com" <hongxu.jia@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] flac: fix compile failed on musl
Thread-Topic: [OE-core] [PATCH 1/2] flac: fix compile failed on musl
Thread-Index: AQHchIqFy5AjEB1w20eXID3ue1Zql7VZ0+MA
Date: Mon, 19 Jan 2026 18:07:44 +0000
Message-ID: <0D264EDA-C778-4ADE-8307-ADDB7525CE97@arm.com>
References: <20260113124504.961856-1-hongxu.jia@windriver.com>
In-Reply-To: <20260113124504.961856-1-hongxu.jia@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB5PR08MB10255:EE_|DB1PEPF000509FC:EE_|AS2PR08MB10154:EE_
X-MS-Office365-Filtering-Correlation-Id: 40593b48-3070-44ae-63f1-08de5785caea
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?dkhNbDFIN0NQdXAwbTdUU2xlK21sS0JDTThiRHl2bjE1QWhXQitaZW96SUhL?=
 =?utf-8?B?QzhlSnplT1ExSWNBaEExYm52VE1UVGpJWjZIUGVUTjBWQ2ZJeWV4b0V6MVFw?=
 =?utf-8?B?VWtrOE9yTS9telphaUd6LzRtbTY1a0lvRGl2Rm5qb2JNWjlia1owbjJLTGtv?=
 =?utf-8?B?cUU2d1RLTVc4UmFqNUZES2VaMGJDTURlbExsY2YyR0lvZ0tESTBSMUVVMlZv?=
 =?utf-8?B?dDRDd09XUmdvcWFOUjhkMjdDbmFjYlB6V2Zkd25OMjVGOWxkVURSbVpJaXps?=
 =?utf-8?B?QjMxYWc2R2xjVTJLK1Y3Q0c1d3V4U2w1eGRJMTQxOWlYcFM1Z3dldGt1bDVQ?=
 =?utf-8?B?TEkzTXZBQ1FGdjNvZTF5YkdURElicGYyanFxUjNpOUdzaURiaUYySzIvOXU4?=
 =?utf-8?B?c0o3VTZ4bHJwcDhMVHF2dVNFdWcwaENsYTFHSlYzOWgxRUZZQU43YXNEdFpr?=
 =?utf-8?B?VTRmT0VwMnNyNlRoTXhOTjBzMTRuNGwxUnVEVU92TVNIV1RpcVFZcDNhVmJW?=
 =?utf-8?B?Mkx1T2RFTFRGeFBhdXdLTlh2cVFpRHE1cGl6MitHOWMzaWZwUjdWTjFncThh?=
 =?utf-8?B?Y0RJTzFxb1VsQmgxL0prMkg3SVVDOUZ1Wi9hS0QyY3p6ZXJ6d05yOHFxZGI1?=
 =?utf-8?B?QjB5WlNiOGg2anRYbjNNSldUQ2lpTmFZYjlmblRVUzJIM3ArTXhSNFJZY3Qr?=
 =?utf-8?B?THdodDBoeGhkbHVHTXFsTTBwV1dmQXkxbWJQS1FDMUsreG4zVitsNVFhZ0pr?=
 =?utf-8?B?azVlL1ZoUTBnRzRZNVpIUUVDYUU1QnZrM1pFUXZqdWtoWGR5dzJLUGtsSUdj?=
 =?utf-8?B?VmR2KzRWMFFjOStad0NwTmJ1dzBzRWxyYjhFUE5uNzZveTlkNVF2QlRCRFFR?=
 =?utf-8?B?THc4Q0pPbWpja0hlZGZVYzF2VE9iRkFsMVczSzFudEpSUUJZdGROTHZmbERk?=
 =?utf-8?B?OUtOWU9Cd1VsYTJOTm5EVjNFUDdYNkZaSk1BT2pnZ2N1d3dUdHM5R0Nsa1VT?=
 =?utf-8?B?OGJmUm5lclVRa3NMVlFFbTlaMWZRc0lFYXdIYTV2Z1NlNlE2cE1RSVRFZW1K?=
 =?utf-8?B?ZlNSSHRXQWk1N0wyS3UxWkVNbXc0b003ZXVhV3dBRW40ZlkrK0RxdUJYNzFK?=
 =?utf-8?B?UmVSVVZ2cHNTQ0RDUytsSS8yc3VyYUc0S1NZRzY3Vlc4NllXVzNScEUyQ2c4?=
 =?utf-8?B?WGNLL05neWYySkRRZGRjZVJwZUdQMFdMNVVsQzJ3OTN1N1N0Y0pSWDRpRWgr?=
 =?utf-8?B?MUUrL0lvaU9wenVCKy9MaS9JSjVHbC9rQTBvdmFTeExjR3UzckUyOHVsTXh0?=
 =?utf-8?B?UEptSFdramVNeWhCUzNKc1c5b2ZhbE5UWEhpd05Hd3d6cS9icVluTnVSNkEz?=
 =?utf-8?B?Sms0MkxwaTZmSzRaeXFuV21oYzBzYmJ4WSszNGpxWHdPL2w5SW03elA1dVNL?=
 =?utf-8?B?S2FLdllkNGRJMGJwaXB3aGRtSUJwd05HWUJsWDNYcVREUHVBeXlxeWFDSWQz?=
 =?utf-8?B?S3Fqd1BTRzltdmpESnFxTmkyMnBaTzdTemFmUWxzZkdybWtiV01wWUp5Z2o0?=
 =?utf-8?B?Ry9QTXVtQUhNR1JCOFZlQzNxM1kybmtUNjRGaTl4ZjN6N2twUHFLNDVjMTFy?=
 =?utf-8?B?czRHaUxVaGNBYXR5YlFKMEJkcUp4K25TczduMzlQSVNsd0I3VEVuM0RhVXBk?=
 =?utf-8?B?S1lRVkFTYlpnaFBBVUQwcGlzSXc1UDNLZm1LVnhCNnBHZERtbkhMd0ZmcXRU?=
 =?utf-8?B?QXZ4QnhTTW00b1grbmYxMU8weGlMTEluTzkwTGRhNVpQU3hWYUFkSWxVckRJ?=
 =?utf-8?B?Z1kxQjhiRHFJbi8zUDY2QzFBMTlDYU8xYjRlaVhFdEVVTVN5T2V1aGszaS9t?=
 =?utf-8?B?cDVhYUtLaFUvdnU2SmF0QzNlMVlHVFFocjNrOERmWEg2VGdUVC9sUkNtMjhh?=
 =?utf-8?B?SWs5SzljZEticUdHTTJPazdjek9MUDBwNXhmblUwckpqblVYc29EVlFITXhT?=
 =?utf-8?B?MktBQ2laTWgwWWVESGpwMFQySWEwbGlHRTRLQ0xVOTZzMStuMTZSbERMNmkv?=
 =?utf-8?B?anVMaEMvWXJld0JtaWo2QXE5MW5aWDlIdFYyemVXZzhVZ1NtRDdwcllNVDVi?=
 =?utf-8?B?SGlnc1h5VlExVXJJck8vUVJpOWg5SFRkVzJYWE1uVEkrM2tOY2RxR29ocmxi?=
 =?utf-8?Q?nW7LK9V/dZWY5QuawGfVcZA=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8115A90367924B4198C4EF4BACAAEDCC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10255
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	dfc5509a-c712-46e4-6538-08de5785a54c
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|35042699022|1800799024|36860700013|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TFhsb1FlY1gvUHJxajd6UFlyK2hldTlIZHYzQUFhTU9rTWlCU1lQNEk0ZW5D?=
 =?utf-8?B?a3dVd3NvVGhOSVYyRmN5bmZwL25hTUZET3VRWFVjcmJ2b3M0SUdmRFVVaGQ1?=
 =?utf-8?B?d2lQN0NySUt5VWl1ZTZVdkV2a21ub2NWbGhTYklVZFZzTEhIVXdzeVI5ZHZi?=
 =?utf-8?B?SjlYNm83REhzOE9GajlzRVhKNzJYaUpMaVEzRUtmaGxTZlN6QXU5SUJuMldP?=
 =?utf-8?B?MlhwMzhDcXJZR0xueUxRWG9adllZSk41Sy82RWptZHVhL2dFeEE0a2ZQTkRx?=
 =?utf-8?B?L3NiVmx6aWNOMVlyU3IyTzlOZTlHY3hudjVjN0NaZTRicHNYZ25PeUtOZzAx?=
 =?utf-8?B?bUFmQjlWM0g5K01Kcjg1bnpiM0RpbjBrZ0EvZjV5ZnI3WFpVZmZKSGlEWnls?=
 =?utf-8?B?UmFtTExOQlJjZHFWUitOZFJybldlR2owaVpRelBKV2xKYUVnMnQ4djVqUHdy?=
 =?utf-8?B?c0lCYm9uN25FRXNTVlJhT094RXJ3aFJmOEx0V1ZBMUQ0U0VGdzBCM1JWUmFN?=
 =?utf-8?B?VHNGQUE5RWwzMk9uWlRBdFFLUTJaL1pIMWI4dW9qNiticWFmdkZqT2NhbVZH?=
 =?utf-8?B?b3I5N0VRSjVHdzQ1RFB5V3RJN2h0bzZVZ2JnaXJJV3dJVVNOMmpuWmJQbTR4?=
 =?utf-8?B?a3pBT3A4SlRRNWZsN2ZjYk9DSGp4MlkvRmJyWEUzWEV2TEx4VzI5cWtYanpX?=
 =?utf-8?B?am1JTFpMOTNMSkRCZVE2WU5PNnEzbU9WeVNKL0pKZXp4bENGc0ZUOFByeUxv?=
 =?utf-8?B?bXM4ZzB1NGd4bVVpT2JtNFR0eWNTcldnZEtiUDdIMWtlb1d2UXRhTzVtVDkr?=
 =?utf-8?B?dUpTQjhqM1hzdDJMcEdSRitTa3BOSHJzdVZvaHJRNnBpS2Eva2l3VUVudG5h?=
 =?utf-8?B?NGVyWlhVTnR3MEFWOFc4cTFjVi9vWStBdHJRM1FyTHlLakdRQWErUE9SSDlq?=
 =?utf-8?B?cTQ3VzZIbUJiVk1Hb3RnM3VVN2QzQXVjR0s5OEFqcTJVY25UUEgvTFVpV0V2?=
 =?utf-8?B?a3pQc3hXTEwreWV2NSsrY000bExMeWl1RnBDWU5jZ2ZPYnRpTUpqQmZKYlZC?=
 =?utf-8?B?cThKWkhYdkxRUFY1Wkt3UHY2UmVwLzF1cXE0QkxYSFZOVHdBTXh3QW9ETXdx?=
 =?utf-8?B?NDNXL0NPaDlqc0RWbFRMV2FoeXE1ekhuV1dDb3FzdXNiNkNGSlkyUmtxLyt4?=
 =?utf-8?B?UFlpRDRNc2hHMFBBUXl3V0NhalRxdjRIUmZMZXVVWlN3NGJ1RVkxYkw0TlNx?=
 =?utf-8?B?ZitUOEduYXQwa0ZkTEhOOUZKT0JSdUZMbDNaU3RmUWdnTEtPcm41OFI2Z0V4?=
 =?utf-8?B?ZjRJK3ZYbmhPMzVUVytUdVpvUFVyZ01oZSs3b3plZFM1M3Zzd0dUWG9WU3RH?=
 =?utf-8?B?WDROUnJBN2FzaTlRUEpGelNkdnZObGpoYTNsSzY3SlJsUTh0M3VlbFRwYU9X?=
 =?utf-8?B?UDBobVJraWg3bW5ibjVwV2tzS21vdjhwZU1KdDBoeUNQTnpyN1VLVlFyRzVS?=
 =?utf-8?B?dmllZkRsVXcwblBGZS9yL3ZmWGJtdmdJdUpaVkpCeC94TUhLUWE4dTFqc1pZ?=
 =?utf-8?B?RGMvRS95Q2dVVlAydjM3ZHZac0dVMjUvVHZ6MnhxY3lZR29zbEw1Mnk4RDFN?=
 =?utf-8?B?MkYrMndEa1ZUV1JxZXl3ekpsWFFQWXE0QnRhbU9kUU5zbkI0aGNqQzVZQWh5?=
 =?utf-8?B?SnJ3dTdQa2taK2VjVEdoK2xLVFZCK1d4SERDN3Y1WTh4YU5nZ2lQTUJZU1dj?=
 =?utf-8?B?bmszdXE4cUlIQkx4T3B0MlZuSUdILzBEdGFDaFFCYnNIejd3SUdtTTU0UjFX?=
 =?utf-8?B?em5jRmFNRFMwdm1WblJkanJxNmZlQ3lUTDlrRU5rTW5aakppTFpkSTE2Y3BM?=
 =?utf-8?B?ZDNoSnFyVEhDWHUrdlN0LzVtdE1YcUZjR3hIMVdwanU2OTl6MEFyanUwSzl4?=
 =?utf-8?B?dUR6UCtXQ2J0NkZUaUpsRW0xQ1E2R0VHb0pzeUVrUm54TWFqeDVQdWFLWkl0?=
 =?utf-8?B?RTV3R3JWYVdMMEo4N0hta2Y4d3JsS3VvR1BTbWE3bmRyNnFDZ21kZFVZVFla?=
 =?utf-8?B?WnpjUjliT2lYcHlxblMyS1JidTYzMUd2TFV6bFJkb3YxK0FVUjMwNDgxcHE0?=
 =?utf-8?B?MFk3UnlkQUs0eWc2b0JmUU1kNnp6a3d1cGd5ODJBbHA0T1htZ1pxSldYbFRS?=
 =?utf-8?B?dGVkbUFJbGxYMndEbTNXSDduUm9nMTdneXZPY09EcHNiN0JvVEthRkROUHZx?=
 =?utf-8?B?TTYyVkE5OFlNSXp1NEVYUjRTLzFBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(1800799024)(36860700013)(82310400026)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 18:08:47.9369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40593b48-3070-44ae-63f1-08de5785caea
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FC.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10154
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 18:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229628

DQoNCj4gT24gMTMgSmFuIDIwMjYsIGF0IDEyOjQ1LCBob25neHUgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPGhvbmd4dS5qaWE9d2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gDQo+ICQgZWNobyAiVENMSUJDID0gJ211c2wnIiA+PiBjb25mL2xvY2FsLmNv
bmYNCj4gJCBlY2hvICJNQUNISU5FID0gJ3FlbXV4ODYnIiA+PiBjb25mL2xvY2FsLmNvbmYNCj4g
JCBiaXRiYWtlIGZsYWMNCj4gLi4uDQo+IHwgbGlidG9vbDogbGluazogKGNkIC5saWJzL2xpYkZM
QUMrKy1zdGF0aWMubGF4L2xpYkZMQUMtc3RhdGljLmEgJiYgaTY4Ni1vZS1saW51eC1tdXNsLWdj
Yy1hcngNCj4gIi9idWlsZGFyZWE1L2hqaWEvb2UtY29yZS9idWlsZC90bXAvd29yay9jb3JlMi0z
Mi1vZS1saW51eC1tdXNsL2ZsYWMvMS41LjAvYnVpbGQvc3JjL2xpYkZMQUMrKy8NCj4gLi4vbGli
RkxBQy8ubGlicy9saWJGTEFDLXN0YXRpYy5hIikNCj4gfCBidWlsZC90bXAvd29yay9jb3JlMi0z
Mi1vZS1saW51eC1tdXNsL2ZsYWMvMS41LjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9iaW4v
DQo+IGk2ODYtb2UtbGludXgtbXVzbC8uLi8uLi9saWJleGVjL2k2ODYtb2UtbGludXgtbXVzbC9n
Y2MvaTY4Ni1vZS1saW51eC1tdXNsLzE1LjIuMC9sZDoNCj4gLmxpYnMvbWV0YWRhdGEubzogaW4g
ZnVuY3Rpb24gYEZMQUM6Ok1ldGFkYXRhOjpWb3JiaXNDbw0KPiBtbWVudDo6c2V0X2NvbW1lbnQo
dW5zaWduZWQgaW50LCBGTEFDOjpNZXRhZGF0YTo6Vm9yYmlzQ29tbWVudDo6RW50cnkgY29uc3Qm
KSc6DQo+IHwgL3Vzci9zcmMvZGVidWcvZmxhYy8xLjUuMC9zcmMvbGliRkxBQysrL21ldGFkYXRh
LmNwcDo5MTM6KC50ZXh0KzB4MjAzMik6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fc3RhY2tf
Y2hrX2ZhaWxfbG9jYWwnDQo+IC4uLg0KPiANCj4gRGlzYWJsZSBzdGFjayBzbWFzaCBwcm90ZWN0
aW9uIHRvIHdvcmthcm91bmQgdGhlIGZhaWx1cmUNCg0KRGlzYWJsaW5nIHN0YWNrIHNtYXNoIHBy
b3RlY3Rpb24gaW4gYSBsaWJyYXJ5IHdob3NlIHNvbGUgam9iIGlzIHRvIHBhcnNlIHVudHJ1c3Rl
ZCBmaWxlcyBzb3VuZHMgZGFuZ2Vyb3VzLiBDYW4gd2UganVzdCBmaXggdGhlIGxpbmthZ2UgaW5z
dGVhZD8NCg0KSWYgdGhpcyBpcyBhIGNhc2Ugd2hlcmUgbXVzbCBkb2VzbuKAmXQgaW1wbGVtZW50
IGVub3VnaCBzdXBwb3J0IGZvciBHQ0PigJlzIGZ1bmN0aW9uYWxpdHkgdGhlbiB0aGUgZGlzYWJs
aW5nIHNob3VsZCBwcm9iYWJseSBiZSBkb25lIGdsb2JhbGx5IGluIHNlY3VyaXR5X2ZsYWdzLmlu
YyB3aXRoIGdvb2QgcmVmZXJlbmNlcyBhcyB0byB3aHkgdGhhdCBpcyBiZWluZyBkb25lLg0KDQpS
b3Nz


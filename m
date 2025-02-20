Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8BC5C021B1
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 14:40:52 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.86])
 by mx.groups.io with SMTP id smtpd.web10.50823.1740062451854740428
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Feb 2025 06:40:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Xh1dS2Pu;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Xh1dS2Pu;
 spf=pass (domain: arm.com, ip: 40.107.22.86, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OKcvwVKk8bY/rOGk/kKEvZ9Nz2A7KnBESLf7G6j2hA8j5pjyBw5S8Uk+l5v60yp+7WBbSBFlkHXjo+WO2NmYS1AnonggibmugWLpqWm5T8o6ZKCYPuezubdudzI/BJC0LH2UPRBASucVIAHplFQQR8t7IvUbBACvSYp5T8809/MUy7NTcQRqTEVCxGZMdHGf2D/cz9VPsPb5o5/1HyjtWriryoQVcFiAV+5JoPg/8Pr7W0QJV28yiBgClH2FA1Fi7AUPhTi6b1mMu+XNvnMIuaQkxkw8KXn2i87wTVs85QrpbQ82iI388TJCSGa7Q4nqETzdm25fgvjwWTMcxKjOtg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYbMrGk/8JpfK3UOGkgmgg3BwambqAqdlWcE5wMq7zw=;
 b=FEtMOSNMHq4xEc8JR5WY2jYzlQU1Vi6Za8EHGkNAA9cfaa9EQvOla9v59CdB/hWVS0V0ArjL8h3FM8UVqiEUc4d9eEjug2epXA9RJg9vsWQoAwSl4yPrsN3TNXWbBXXXJLwuur7K4dZiq6IqRYxIJbO4XlyJvfH5mYOOKnizEf+bGpCibWTr0/SmqLQVAhhjL/l9CCuCGo3CX32PAgb+GmivKFP0caGv99qI/KaAUDJ9lnH0K2s6vjtCnLNI81IPWfV4XSY3J4xxoDkPu3Zadb9aRUBBSKk5rNYekfyaiQN3ejQVHF8RMDYqqTlTjMDYa8CN645fKW8em/tLpap0Xg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYbMrGk/8JpfK3UOGkgmgg3BwambqAqdlWcE5wMq7zw=;
 b=Xh1dS2PuvmpCgCkqLCzkZNbf40Lj3Gb3N9d0jnDZCtb09vkcvf1mGhSb7B06jic7dA+MtWReLPrj4VqRsjGKzDnisvzZEKLhKzaFiWUqFlYalPHcsgB7S4R8r4ZQKPVO6JgnJgZGkBqVay/CM/QTOgUoagcQo0ghXjGd8jX0LFE=
Received: from AS4P189CA0026.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5db::13)
 by DU0PR08MB7392.eurprd08.prod.outlook.com (2603:10a6:10:353::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Thu, 20 Feb
 2025 14:40:48 +0000
Received: from AMS0EPF000001AB.eurprd05.prod.outlook.com
 (2603:10a6:20b:5db:cafe::b1) by AS4P189CA0026.outlook.office365.com
 (2603:10a6:20b:5db::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.16 via Frontend Transport; Thu,
 20 Feb 2025 14:40:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001AB.mail.protection.outlook.com (10.167.16.151) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.11
 via Frontend Transport; Thu, 20 Feb 2025 14:40:47 +0000
Received: ("Tessian outbound f34969e68f18:v567"); Thu, 20 Feb 2025 14:40:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: de8336ccb5c7451e
X-TessianGatewayMetadata: U/Io1iQwg2DeQDF/a3XYwzvAZzSRBhRylfUk4qQ1E+fJHdWzEnO7lCGxa1ZO8e17rT+h0cKHZbIs7Wlc7C6uApyYe131+rWWTC42cdDO1mQcVv/78Uth7TV2+O95Zbo9l0IGQs5TEwslP5SwGyeUhwwdt0gY2Fapw/1NLfJGfiU=
X-CR-MTA-TID: 64aa7808
Received: from Lb403174b9dd2.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 460BDF14-18A6-4137-806D-30EFF977081E.1;
	Thu, 20 Feb 2025 14:40:40 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lb403174b9dd2.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 20 Feb 2025 14:40:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PSalHuZVhTjD7SvrtjdRupz7Rk/08OBQmGZ91Q8EuVtTsnR+7JgCnXqNn5QogjDf4L58uq4aW8xQRY6YhrTxjTLAwFPE7kuOXIMbIRu0z2XM6Ntzceih2TxAalW0FP1fDZITLhW9FqiYSHBGnngdnxLp0WEkWtXvO2xxDyspbB5aABiGqHJcyNqGvU0i7Vq8I4/+TR5h6Syf0+iRv3SOe5r/li94/NBoWgqHCjLuUGklYqsi4KGWOCj2eglHlnqcZIMPISwU37isn7reREMfgZASDQF5e5bolZWLMeMn+jED/4dbDUI1vRMx+4mvf1xp6+/1Jf08TQiMrTf0DyxfoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYbMrGk/8JpfK3UOGkgmgg3BwambqAqdlWcE5wMq7zw=;
 b=g9vaOYtGzCIawyJhmoSzpb2lFRZIXfICERioLuN6ArvJCJhAkTmWy1cW2YbcXfUKRneiv0SYv6W97vXQbPnSwjJGeGaQ/LVQZYg4SLVRrkdtkANCJWxNYBECk9K3/LPePo2yOirwNtauxBN9ch2l0VDgnEVR1oFnoDm7axStrRXGATR7Y8oWDmgnpK8R5wrwr4B70l7/0txXflx8W++CRAS8g3ydXdCtVjJ322S3hGWTZoEH1bI27dzV+9M4lzsoojRSrA+c6MI4M9nXV23qr40TE6fOJsXbmTgNGD+AernhN0mW+3ypbCqHPtxyCsGt4GRCtidccGke+ETjU4zjKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYbMrGk/8JpfK3UOGkgmgg3BwambqAqdlWcE5wMq7zw=;
 b=Xh1dS2PuvmpCgCkqLCzkZNbf40Lj3Gb3N9d0jnDZCtb09vkcvf1mGhSb7B06jic7dA+MtWReLPrj4VqRsjGKzDnisvzZEKLhKzaFiWUqFlYalPHcsgB7S4R8r4ZQKPVO6JgnJgZGkBqVay/CM/QTOgUoagcQo0ghXjGd8jX0LFE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PR3PR08MB5564.eurprd08.prod.outlook.com (2603:10a6:102:87::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.15; Thu, 20 Feb
 2025 14:40:38 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8466.015; Thu, 20 Feb 2025
 14:40:38 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Changqing Li <changqing.li@windriver.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] man-db: fix do_configure "Argument list too
 long" error
Thread-Topic: [OE-core] [PATCH] man-db: fix do_configure "Argument list too
 long" error
Thread-Index: AQHbYakAn2E0m/4StUSYgvf03ouwDLMM/VkAgEMqBACAAGAVAA==
Date: Thu, 20 Feb 2025 14:40:38 +0000
Message-ID: <B4E286BE-E1C3-4989-9675-7A81153CC3D3@arm.com>
References: <1811EBCBC381E647.26783@lists.openembedded.org>
 <0146cc17-13cf-4322-ae18-425b822085ae@windriver.com>
 <D749D0A1-5948-440E-98B4-1B7F49CFE6A2@arm.com>
 <a9da630f-524d-49d7-91d6-777324545f87@windriver.com>
In-Reply-To: <a9da630f-524d-49d7-91d6-777324545f87@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PR3PR08MB5564:EE_|AMS0EPF000001AB:EE_|DU0PR08MB7392:EE_
X-MS-Office365-Filtering-Correlation-Id: f9d9121f-e3c1-4b5e-de0c-08dd51bc90a1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Mk5lNW9Wb3VMWVh6MjFPVXBDQkN4a3JEV295RUdsWWVBNGNQOExXeUtxa3JE?=
 =?utf-8?B?UWJ4RnR0TU05YUhIYnZMWE1Fam84ZE5QekxObEFEUHBwTU1rNDI5VktRU0hu?=
 =?utf-8?B?bVRNUGs1WTJnakFpcGpidWkvMG9kUFhyMkk5T3EyVXoxTTVTWnErMkg1KzF4?=
 =?utf-8?B?Zm50bGQ0STkrOFY2Z0R1SGovTHZzOTQxTTJRTGtQMDVlQUI3emxPTTJIamUw?=
 =?utf-8?B?WGhKTllGdlJnZ0xIcS9hR2h6d1dEWjVsMlhOenNmeTJCaXNCa2FDN3NzdG55?=
 =?utf-8?B?VnpCNGJpNjFZZUY2RFJIU1VwbzIrbkVaNkRFQisyNEFWeDR1QTVFU3MzWDFk?=
 =?utf-8?B?Z0FLOWhtSHgxUjlwWEFPeE9yRmZSSEpOUGNybEtNcnJOVlZiditORkcxK1h4?=
 =?utf-8?B?dlgxQVRIMUlCejN2OWhQc2RRUktrcUV5dmZMa0lyM2dKRkE4MXlFTFdCSEVh?=
 =?utf-8?B?bzBDTlRPUXFGS3FiRVpJNVRxVXEybmF3VFNlS0RyR3F5c0NtcUpMUnB3Q0Y4?=
 =?utf-8?B?WnQ2Z3ZkcVlTcEtzLzRRalpNaVowVXJuZ1JDR2ZnSU1VMlFCZk04NHRJT25W?=
 =?utf-8?B?RER1N1I0eU9nWkhKTUx0eXJDZHk4Zk1qS1Q3djJSSDFOaFl3UUNNMTE4cGRy?=
 =?utf-8?B?WDVwQm15bjkwSXFLQ3k1KzZlb3dUQ0IwZEpqL2V2N3pIV3FreUs0S2xUMm8r?=
 =?utf-8?B?UXVKYTlwWCtrRDd6UDRFMjA2TlRzMW5tRlMxNmdrSEJGWng1QVVRcUQzMzZo?=
 =?utf-8?B?R015STJ4R3dRTHIxdnI1VTJMZm5PQ3BwclUzTGgyOU9KSmZZTzVCYXB4VXBk?=
 =?utf-8?B?SUxxaG84cGNoRWoyS3Y3M0FJQ2VwaFBBTE04QmwwWXFjY2o0TVNEQTBXYzU1?=
 =?utf-8?B?UFJrSjJLVnpJNVZwTm1ubnZpK1d5SFVvcnZIVFo3alJQTVF2czNKVlo1NVN6?=
 =?utf-8?B?VnNPK2tJOFZYN3hwak1uOFg5NThPYUhtOHRHVnlpS2w0TDc2QlRhNzdRUUo2?=
 =?utf-8?B?dDhDcnR4djBUY3dtN21LWkQwaFRrYkVPNWt3L3hKWkQ5ZjVScnZrbUN5SmYz?=
 =?utf-8?B?NThXand1RzdlQXp5NWdCMDlBcXlYMTREVll6WjAzT1NBdkkrNk1IcW9jRmpp?=
 =?utf-8?B?eEpIeXdxbEt0TkJJdVVmT1JIbUNjdldxM0lka0NyajFIS2pPSGJMV0ZWNm5v?=
 =?utf-8?B?QjJsSFkwZTA4Vkh3djJQR21zMkc4Nm94ZUxSMi9aUXhNRllVVzVkYVJndmFL?=
 =?utf-8?B?ZjJPMjdzY2Z1QjlpdVVlNHBycHZLaGFFdVd6dUpjZjlBczFJK29ibHRCc3lw?=
 =?utf-8?B?elgrQ2FKR3M4OG54RDhQOHhjVmlGKzE5RDJsS1RNT1paSmNzOWZFeEdhb0xv?=
 =?utf-8?B?MFRieW5xRjFRMjVGUVhJakJlSGRaZ0pCWExOVFd6c0hHQVJUcnY5eFdkeGUx?=
 =?utf-8?B?L0JrQjJIWnVWT0p5RmRyc0JXeHZZNkxQYmFYVVBoQkhDb2tBRk1SbnF1Ymxu?=
 =?utf-8?B?dFdmRytyU2F3RkFEQ2Mvb3dGTDkvRmxLNzI0SE5CYUN0c3Buc3cwZnhaTWdN?=
 =?utf-8?B?WW5icmVpVmVCcEZ5cGlGenpIV0tJbEoyNkxsL2cvd1dXNnBtVGt6Nk1PNktu?=
 =?utf-8?B?T2Q1NkxuN2ZUVU5GaDA3QWc0VWh0NUdLVDlBWTl1dzZFemp3ZnZiN2lzU2VI?=
 =?utf-8?B?T0NVWWdkc1lZbUFBdTVnRENSbjR1WEVkK09DU2FubzI1STV6bGxYaURQeVhP?=
 =?utf-8?B?YW12a1NiNkl3ZWNHMng5ZExTUzQ2czIxMklyTTRrTlFTMGVpb0ZjbUJHeFlp?=
 =?utf-8?B?UVJEVENMQ3d0WEFQS3J0c2pTVGh6LzRGSk1nYWt1aGp0Ylg0K1Z4RGRjYVow?=
 =?utf-8?B?RjdHVmhxQjBJVG10VllNMUtWUTVCVnBvek5QN2lIZDZOWUE9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FCDD8292B2D62C4E9C68EA6D7A3540B3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5564
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c112e3f2-fcc8-44a3-d95a-08dd51bc8b20
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|35042699022|14060799003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QmlYRC91YUNXbFJCSzNibVpoNFo1TXdxdnJZVkdiYWJOblZaWUpzZWRMc0hU?=
 =?utf-8?B?MlZ6QS83ZFNmY0RLMXo1dmkyUEorR2Vvcmg4SkNrWnVpcTRTcmVoRkNGTVBM?=
 =?utf-8?B?ZEF3a3dTbzBHdDMwQkVwaUlLY0c0T01aVkVWQTQySGlKNEhFdzkxRllOb3lk?=
 =?utf-8?B?Zkxzb05Cbk1OWlVBbVpRdjlIek1DSG4zRE1lM01qRU5rUFlJUmxpWW8vQVhZ?=
 =?utf-8?B?dWRaSnJENUFpaHhYbURGV3E1V2l6V0g2dTIwM0JJeWxxY1dOTk02QTJPWURu?=
 =?utf-8?B?U1Q2N2xxalNkdDIwbGJNWmtybkVrblF5MEhhRzY1SXg4d1M2eFlvVE83SWlo?=
 =?utf-8?B?MllLUDQ1SURIWkNOSXE4aEQ4a0tzK0E0Sm04a2pOUW1CMXVwejBnejRqT3BG?=
 =?utf-8?B?RXlBUWVEVWRpK0lJd0t5dVJkT2NIcEtUaVJDQ0hvT2UxT0FFS2wzNDJSMVZn?=
 =?utf-8?B?NURrTzc0V2VWcWV3YTM2Sm5LdjY3VlpsNnkxcjcwempuLzlTU2x4TzJiWVFz?=
 =?utf-8?B?RFpBampkeFNUTGRtb1pyeGloNWRxdmZ3dDRDSnRZZHZ1czFSVUU5TTQvU2VH?=
 =?utf-8?B?V2M2QTFhWjBLS1EzanBYdC9sMVZyWWYrQy9ydkVoampRRlgvSHFSTVV2WCt2?=
 =?utf-8?B?d0RQTjN2bnVnaXRRTTNpT2t6NmlYK1NONFI2OHlZbjRPcThSRU1EOUIyU1lZ?=
 =?utf-8?B?N0JCUCtNU2dKYzhEaW1lMnM5MjhGY1BkWXdiWlhBQTlEUEgyNFFRU0RIaUx4?=
 =?utf-8?B?Tm8ybWUvSER2NTZMYzhYZ01odityUHZBdEVvSS83QkNlbjg3Y29YYmV1UWY0?=
 =?utf-8?B?UVN6RFplTW1vYXJ5b0RPYUoxSTRRaUdpS2FxSlhiY2lwU3EybEwrdURYcGkx?=
 =?utf-8?B?WFgxWVg5TWtueEwzWklzWC9qL3hyVXkxZnNWMGd4azBlemIwbE1pWVRWUnJw?=
 =?utf-8?B?c2dIRVY3ZkNiY09GdUZWNmtVRFljOGJ3Z1lFMXJ2OGc5WUFXcnlUOGtoajdQ?=
 =?utf-8?B?YlZDQ3ZtRUZMaFIzcVN6VDNYL2s3TDlsTkdRVWQ1dHVSZDFsRnRHWk1pdWQy?=
 =?utf-8?B?RWwrUVBNSkxrTFN3eEpBbkhZOGxUUjY2bWFVT3pxVHdTVVU0UTJKK0Z2cXRt?=
 =?utf-8?B?T0F4Q05oWTJiV3Y2cXZieGJOZFc5SVlTaGN4R3VoRE82cHlaWWJtSzBYWVY0?=
 =?utf-8?B?OEc3cUxzM1g4c3NpajJlZVJoSWMrRXpxa1gzdy9GMW01cmZVQWx6WTZVQkFn?=
 =?utf-8?B?UmsrTldaS2lkNjYwQmQrUXFkbjV2cmNuSHB1d3E5MDJnQ3pINVhiRWl6dzdl?=
 =?utf-8?B?b1puZ3ZYYVo1dS9KbGVONW9nQ1YrSkllVjZ1cS94U3p4YkV6UHNxdExTNG4v?=
 =?utf-8?B?SmVCbFpmRFpNQjlMaGhnb0Z0N0o2RitLMy9HWGNWbiszOGxmQlA1NGFVRCt1?=
 =?utf-8?B?WnZqakF4L0hnbjVNUlk1NkVNS2dyakZxYnBDNFZwVmJhRGl0Ty8wNlVkNkNy?=
 =?utf-8?B?Tmk1K3U5SFB3U3ZheUVCWGZacmZRcS9ZZnhjRHByMXlLQmtzbFpzTnk3ZDZY?=
 =?utf-8?B?TWNmZTlXbEp5MStNeW44Z21OZm9hNEtqSGMwR1htb1ZPNkFqb0ZoTE9UeVpx?=
 =?utf-8?B?bUdya1NNdzZtYnU2NzluaWRDUWJPRFU5VUFoVnFzUkhYSzdmZ2FXNVBHSzRD?=
 =?utf-8?B?eFlOVk16TG9NNTlMK25pQlB2SUV5MmJsVHc2QnZLaVhrRld5Ry9aT3FYNG83?=
 =?utf-8?B?dmpkMU5xajRDeWJxWTFBdnZmZTNOY2NUM3N3MzI5SGNPMTIrS0poZkZCTkE0?=
 =?utf-8?B?Wm5Id0FTdlhDV3lqdFVLNHJyYkpEcjBETFkvV3l2OHE3c2NLWE8vK05TTGto?=
 =?utf-8?B?UUFwOXphSHRuK285YTFXQ2FzWUxualQ4ejk5MEk0RTNldUVQMGFUQXNYS0JY?=
 =?utf-8?Q?Yiu7oQQx4+rEFRxyr/zupbxDOLuzSLp0?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(35042699022)(14060799003)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 14:40:47.8082
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9d9121f-e3c1-4b5e-de0c-08dd51bc90a1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7392
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Feb 2025 14:40:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211762

T24gMjAgRmViIDIwMjUsIGF0IDA4OjU2LCBDaGFuZ3FpbmcgTGkgPGNoYW5ncWluZy5saUB3aW5k
cml2ZXIuY29tPiB3cm90ZToNCj4gRm9yICBhdXRvdG9vbHMuYmJjbGFzcywgIGhvdyBhYm91dCBk
b24ndCBwYXNzIC1JICRpIHRvIGFjcGF0aHMsICBzdXBwb3NlIHRoYXQgdXBzdHJlYW0gY29uZmln
dXJlLmFjIG9yIE1ha2VmaWxlLmFtIGhhdmUgc2V0IHRoZSBjb3JyZWN0IEFDX0NPTkZJR19NQUNS
T19ESVJTLCBBQ0xPQ0FMX0FVVE9NQUtFX0RJUiwgb3IgQUNMT0NBTF9BTUZMQUdTLiAgaWYgdGhl
IHJlY2lwZSBpcyBub3QgY29ycmVjdGx5IHNldCwgIHRoZSByZWNpcGUgaXMgcmVzcG9uc2libGUg
Zm9yIHNldCBjb3JyZWN0IGFjcGF0aHMgdGhlbXNlbHZlcywgb3IgYmV0dGVyIHRvICBzZW5kIHBh
dGNoIHRvIHVwc3RyZWFtLCBzZXQgY29ycmVjdCBtYWNybyBkaXJzIGluIGNvbmZpZ3VyZS5hYy4N
Cj4gRWc6DQo+IGZvciBmcmVldHlwZSwgIGFjY29yZGluZyB0byBodHRwczovL2dpdGh1Yi5jb20v
ZnJlZXR5cGUvZnJlZXR5cGUvYmxvYi9tYXN0ZXIvYXV0b2dlbi5zaCNMMTY1LCAgd2UgY2FuIHNl
dCBhY3BhdGhzPSAtSSAuDQo+IA0KPiBJIHRyaWVkIHRvIGRvIGEgd29ybGQgYnVpbGQgd2l0aCBw
b2t5LCAgb25seSAzIHJlY2lwZXMgZmFpbGVkIGF0IGRvX2NvbmZpZ3VyZSwgIEkgcGxhbiB0byB0
ZXN0IHdpdGggYWxsIGxheWVyIHVuZGVyIG1ldGEtb3BlbmVtYmVkZWQgbGF0ZXIuDQoNClJpZ2h0
LCB0aGF04oCZcyB3aGF0IEkgd2FzIGdldHRpbmcgYXQgYW5kIHdoYXQgSeKAmXZlIF9hbG1vc3Rf
IGdvdCBlbnRpcmVseSB3b3JraW5nIGluIGEgYnJhbmNoOg0KDQpodHRwczovL2dpdC55b2N0b3By
b2plY3Qub3JnL3Bva3ktY29udHJpYi9sb2cvP2g9cm9zcy9hdXRvY29uZi13aXANCg0KSSB0aGlu
ayB0aGUgcmVtYWluaW5nIHByb2JsZW0gd2FzIGx0dG5nLXV0aWxzIGJlaGF2aW5nIHZlcnkgb2Rk
bHkgb24gcmVidWlsZHMuICBJ4oCZbGwgZGlnIGludG8gbXkgd29yayBsb2cgYW5kIGRvIGEgcmVi
dWlsZCwgYnV0IEkgaG9wZSB0byBiZSBwb3N0aW5nIGl0IHNob3J0bHkuDQoNClJvc3M=


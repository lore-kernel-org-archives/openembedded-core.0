Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E93CAE63CB7
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 13:02:16 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19423.1769432531564764708
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 05:02:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=MbaEascS;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=MbaEascS;
 spf=pass (domain: arm.com, ip: 52.101.72.3, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=q2mjquYELtflgxhbG11kcsHjPCorHMrHi47eLc9Cmyx2hXhrj9x1XdjOmQPzCCQ9hlXXJsOwxDkGDvKiWcd/vhwQnkOc4ke8+6Pu5nWdH79XOJF7VWoQ1rhmy60QmCHLnuzM986jegWrCNiba6ajNu8aAv+npOIZpOMtCvMCL8pLScqpKzZZ9DRxP7DddTS/FSZOaihqUFJRI5p8gSUFHcO6Wujq1ZAia3dmeekykpqclVHgKlu/dN7nxu2kGohv2XgTsH1Tw/LpvqnzQaPsar1qXIqq3Y/Z4GpuiXmxl+L7BDQ8qIzxgd+AL/SxuhFJcNk+nLgWkga0g6s09kdjPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cd+ttBVy6MFD8V2Z9JIymiEQFg9QNCmGD0DqtgcgVz8=;
 b=SVmtrFsJf1UV2BalSdp7crI19IBnkBVui/CfeNObqXV+Xnj6RkawEbUoKzJdeGhPBVGoWtc3aq7mzclnZHF4jVllinpvG9EBacDVpXf0lFEWhmrEpHVVlTKHML6MbKbiwGENAib0PLO7t9oyS8CVKMAxINaFzQO3QA1kFPePNYQxj4o+kBRmYwibn6s56ye68dvKZ6jgZWMcBbMf+0AqKha2NIRmiGA7pn6r2/K8Xk28pdfR9FhEJEROCy0/algM09wxgc8Rg/EqvlNTptt1dH69npik00+WkcgCWREAMjGSuCm49H1m1EJ7gAq7X9r87lODtSFtZvR0EAKs8gysBw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cd+ttBVy6MFD8V2Z9JIymiEQFg9QNCmGD0DqtgcgVz8=;
 b=MbaEascSwETpYUhjDJmYwbT+823m8SBdAGALu0rfJGybJC6AKCZX5gqmN8sztkqEFDrOWAY0qPSjDyj2Tgmtyg/H/hyVKuVkl3tSV0uY05P6NKbdfZrFGZpnVTdfFkloJLxRHul2QERGtXWUYTvXaKonD69s9TGeTRf9GPGHTkQ=
Received: from DUZPR01CA0055.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::19) by PAVPR08MB8847.eurprd08.prod.outlook.com
 (2603:10a6:102:2fd::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Mon, 26 Jan
 2026 13:02:06 +0000
Received: from DU2PEPF00028D0F.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::69) by DUZPR01CA0055.outlook.office365.com
 (2603:10a6:10:469::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Mon,
 26 Jan 2026 13:03:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0F.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4
 via Frontend Transport; Mon, 26 Jan 2026 13:02:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GK/QGtCqVt2Ev5mRauvmPAfKrJitpP01y4AS+ruhvGK7cFEvdo6AQct0cp794dtB5QYO6Akqznq0yan5stdqJ28zlD4NRHMJMpLcIND35dOhc2hna+/FLnXluJT3sYKcIiPZfCxHoBo5g6HNG/NGdJxnx8aC8SHUn4Er3nqb+caTjg1aCHxiV5rrA7BUYcGrUSqgnDxe4/rycKrcQxU+YJTj6laCH4XcnykShYvmhC1Oln9njiZWBFqQAxBQrAmUdySpUWPCSwt3qPsl+bpoKe/kAxgDANNUAEh+AKjri57Rv3ibXgctQ3jKjGlgB+dAVz6wUqS6Kod/FFl3dIK/tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cd+ttBVy6MFD8V2Z9JIymiEQFg9QNCmGD0DqtgcgVz8=;
 b=okuICcYZfoA1HZbGfSEfDGzo1aUCTNAW/fwoKFRcwXY7jXMLeexQAS0qvVxL7zyWl5wQ3HL8XtXVSRefmKpsWXug0FImXikFx0aQdMBwFNB3My7xq7Cd6wi2vppKb0TQejWJgAprwJ0UgvKwbgGi7fdIA9Nr0sjmQWVLd80BK9/2/ZnZ/4ciJHcgRhqC/PIrmZhRE1C+b6reTw5RhQ8e5Ky/jYa1B7SmetpJQ6vDjcIW/oByBIc0lb5f8oedMvvIHFqe6Nh34h4IjMKOKsgBisvkblPkBKiJhk4tBa4icSr71VQ7Fuf7r/QwF6YXzO1jqpBbi+RYEaD+YCYUV8Nw2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cd+ttBVy6MFD8V2Z9JIymiEQFg9QNCmGD0DqtgcgVz8=;
 b=MbaEascSwETpYUhjDJmYwbT+823m8SBdAGALu0rfJGybJC6AKCZX5gqmN8sztkqEFDrOWAY0qPSjDyj2Tgmtyg/H/hyVKuVkl3tSV0uY05P6NKbdfZrFGZpnVTdfFkloJLxRHul2QERGtXWUYTvXaKonD69s9TGeTRf9GPGHTkQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA6PR08MB11287.eurprd08.prod.outlook.com (2603:10a6:102:514::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 13:01:02 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 13:01:01 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH V2] procps: support ptest when TCLIBC is glibc
Thread-Topic: [OE-core] [PATCH V2] procps: support ptest when TCLIBC is glibc
Thread-Index: AQHchspTxKQAZIJHpUWjYWZ+gFgRorVkegOA
Date: Mon, 26 Jan 2026 13:01:01 +0000
Message-ID: <48503D06-1C65-407A-8EE8-B2E5099C797C@arm.com>
References: <20260116092704.2465341-1-changqing.li@windriver.com>
In-Reply-To: <20260116092704.2465341-1-changqing.li@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA6PR08MB11287:EE_|DU2PEPF00028D0F:EE_|PAVPR08MB8847:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ba2a3bd-d098-4fa9-9ae3-08de5cdb1b31
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?VVJ3YmtHQzFXek05SVE0UWwrZ2JjczRrNzI4QlhwOVVXVFVjdzBXZUVPaDZv?=
 =?utf-8?B?MXYvWDVPQTgyMFJaVnRGYTkraHdzbzRuOVdyUk9XemJTZEtNdDhkMi9oY256?=
 =?utf-8?B?L280V01aL3JQK2RHYmp6RWZTaFNzdG1EaldvZXFnRVhobjIveld2WGI4bzY1?=
 =?utf-8?B?aWlES0FHWm9zaEhZNDFpZ25oUFNHdEZmeWc3ZDU5T1Z4T3daRG04bnI4Z091?=
 =?utf-8?B?R0ZoNXRUdmNlZjBHMGpCNDU3aFU5NHp4U0xRUWh2THVBVi8zRk9KSGExSHZp?=
 =?utf-8?B?eWlkREQ0WHZraDVSc1BYK1hnMUVrbXNRUjFUSVdOaS9PUzhCdXR3RzVBNHYx?=
 =?utf-8?B?ZVVBSTh6c2NrWGR2YUFTN045OUZQbzArNEd3NXdKWVc3QVVuRXJrdjN6bU5u?=
 =?utf-8?B?UElDZm5md2tnR3Z4bDlMdmgvQlZQbGdFbDNacUhuU2NyaDkzZ1A3WkhibVF2?=
 =?utf-8?B?RWFSd3BYSHBpQnZ1TFZBeFBUZDZPT3pqbDRBWHdQdkgyQ3RTQmcxcmNDcldn?=
 =?utf-8?B?WTZTSmZCeEpLdnpMWWpjM0ZGbWFZZ3JBeFJteEEzeU9samZSWE1jckd4SXI1?=
 =?utf-8?B?NXdUbUllNDZWejVPYlV2VVFZWloxVmNGeWJHRUJmTVVHNTBnMTVnZENiR2FV?=
 =?utf-8?B?QWVWRjBwVUxqcUd1a2UraUFCYkZXeitPNUtHcUxXaXVlbHdNT1VOeUFHcEtl?=
 =?utf-8?B?TzRiRkNBcGNSWGNvUTVoSHFpUzBLT1ZrSXJ6N0hwNDBRVytxUU5LOTNBR25p?=
 =?utf-8?B?SHBkZ3JyVTAzY3I0SWM3dXdiLzkxcTVBWkxDWnM2OHhkQm51dXo1MDg2aHls?=
 =?utf-8?B?L0VJM0JaSTVNK1hKV0J0TTBvbElkRXZJbmRqRnpMbXhvd3dmNjZzK2hwa3JQ?=
 =?utf-8?B?TUtvb2Yxak1Dc1dMZ21FbXpiOWxiTnpzck9uWE9JM2hvZGVBeTRybVJqczdW?=
 =?utf-8?B?eWkrUTh0VEtaOWlpTEtjZjIrcGxEaUhUc2xvOEhGcWdBWk1IY3Y4aFVDTDZN?=
 =?utf-8?B?QnRJZmlPemUzbk5IcGxSMm1xdmptYTQ0d056M0lFWkNzYnJOTWhjYm5vNEhD?=
 =?utf-8?B?dmJiQ0V4R0NHY3lpcnJBck9RaWgwV0dCd0cwamYzR28xN1JzSGZHOEpvNnhV?=
 =?utf-8?B?Q013NEpjOE9oMkIwdXNGZEZUTFYwU1B2MCtwRjdEMjZ0cUhadFFvaklIb3l4?=
 =?utf-8?B?d0Q0aTB6YnJOa0tPTWhBTTg1QlJuWVc3bExuN3pSNXlja2YrUzJhYkEyRnBD?=
 =?utf-8?B?dUFDVk9QWmRGOERYYWp3SW1qSkllS3F4QU5pQTFsSzVDVWxmZ29xeTdFVEwv?=
 =?utf-8?B?aUR3N1dPU0VlRWdrUGxlWjkvSjVzcVNLWWQ5ZTYrWkR3WlU5blIrWURMMHJt?=
 =?utf-8?B?ajVCcDROVjMwbVRkUlg3L3FvVjl0QjY0RURLSnNtelRINFRjN0tOc1FNSmtn?=
 =?utf-8?B?SnRSK2pGdFdmNCt0WFVCT0FqTWVWRnZsY1owVjNWK3d6K2ZGOEw2OXlFMzNQ?=
 =?utf-8?B?Q1g5dUF2ejhTRmRhRXp4NXhTMnp5Mm1zczZlUUIrdlRPMlRGd3FublJwOVpO?=
 =?utf-8?B?aFlwcTRFejVKSjNQNWJRZ2N5enVUM0tlU3ZtN2tDRDZNd3k0b0wycEhDT0gr?=
 =?utf-8?B?WkF6R0ZmY29NYWlxRVR0YUZsWThGNSt5V2JVckI0U3hTamgvTk1tbVI1a25w?=
 =?utf-8?B?eHZUQ0p0dktEOHZHNkJSaUE2VE9KWjhiaHVJRTRMb2wzR21WQW5GcDBRSWQw?=
 =?utf-8?B?RU8wR3RERkdyajF0MDgwSjRjRmpuR1p2dGNYWmhqMzFJSmFCY0ZSZTZYUEY3?=
 =?utf-8?B?aHBkWjI5MFVQQllaV3lFVlBBS1JOUGZHTWl0MkczaW1sdGt6ZVQxTGpMV21y?=
 =?utf-8?B?L2lXODd2YmZ4OTZyRkVnRzNCV1p5R0UxNlM1aTAvSTZ3VHM1bDZTdHBxaTFG?=
 =?utf-8?B?MUhOTW9DbGp5azRGQVBZUDBsMlhlNXZVWFltL2hPZkZJMEpXdWU4UVYvZG5q?=
 =?utf-8?B?OWxOZmhSSWlyc0VRSHFoZXlXcG1JMHBzYjQvVzBXQ0JMMnM4aUFGSTFVdXBO?=
 =?utf-8?B?ckVSaEhxZlhMRzc0LzRESTVHb0tZdGcwcHlQS1FKdlZQSDBRY3R6YXZCNlhQ?=
 =?utf-8?B?RjZoWXJ2SXVscDlqaVcxYnYramMzN0lLWUxIUGJDTnJYeGtkUFJHUkVHQlNj?=
 =?utf-8?Q?2g4sd47meCpWszy4rx5ZieM=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <77128B125857E94B93D6138C0F049146@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB11287
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	9bc47f78-58b7-4cce-b066-08de5cdaf51c
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|14060799003|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OVZHVWhSL2x1ZTBwL1FHQU80Y1k1dmFCV25BTnJ1aHNaZDVXRG9XanlpbEVv?=
 =?utf-8?B?dW8ybUdzWHB2QmNCYVpWZzgvM2x2VVN2KzJIK2lhb29LdVVWeERyZ0dzcWsr?=
 =?utf-8?B?b2ZXSFdKN3BLNmNmWlZpWW1BMEVlZGtROXFrdlNGNVMwbVB0cFdvT1lCSXQz?=
 =?utf-8?B?VXJLR3lvQ0JPVmNnWjhWT3BuQ1g0TnNEY1NNbUxkL0JSVWtlcnFSUFpTT1E5?=
 =?utf-8?B?djVSVk1nQnNCcXYreXVCT1Mvd0F4OW4zcHhrdVhialBwbjU5RU9IN2ZrWVZ4?=
 =?utf-8?B?eE9tZEJQZW9GZFZqRHVzL25tM1dSditrSDJLOFhXM01UbHR0Nll5T2lZdXo2?=
 =?utf-8?B?TFFDVk9VRldjSXQxNDlaNGpJejc5eVprUTFoLysrTWdWbXJ6Y0pXdVpyQ2Ja?=
 =?utf-8?B?d0RPZnRMQ3dhV01KVlpudFhvMFp4UWF0Wkk3Y2o5eDc4V3R2dVg5SXVYd3pO?=
 =?utf-8?B?ZDBHREFHbFNlZjdkOUNiQVFWTmFjWmcwdzU1cis4eUlFcmk1SXV6SlR1RCsx?=
 =?utf-8?B?czlFWUZXdHphWXBXbEVUK1lSMWE1VUZmOEhwNmcrc09yRnFYOHdMdUdXcmEx?=
 =?utf-8?B?TGJTc0VzemxPSEJiVjl0RlBaZUhDUVltdXY2enhpVDBxanhpTm9VT0tBbkk0?=
 =?utf-8?B?ZVJqcVNrRGNDS0JaOTF6K1g2YXY4a1VVK0tRMFNlMFgzMmlvYVlRbThia1h3?=
 =?utf-8?B?Mk10MFVzYlJWN3JYY3hIWmZHVVhlZnRyUUVrOTdQem9KejRMREw4WElsRFdn?=
 =?utf-8?B?S0lBQlAweVRvYWxRaGdHbVpnZEhZc1JhMG44RzlodFEwdlM2VHc5eU1menFs?=
 =?utf-8?B?VkxJYWNQcEpsS21TempOZGs1aXpmNCt3UkF3Rkx6bHZ0cUtvUEhaRjllNEsy?=
 =?utf-8?B?OVExWDFxM1JOR0t5cXJSaHhUeG1OdWpIWkFDdytIbHdQRDFpVXdBTmRxRVM2?=
 =?utf-8?B?YTNqb2lvUGZXa1ZFd0VhQjROdlVzbFlHeTBxN2gzekg5YzJBVlMxSzc5Y1d0?=
 =?utf-8?B?Tk1aMGJaQmdzaFdIeWx1eXJ1dmwvRHZ0SGJLdThhSXZxNm9hNDMrSGFZTzZK?=
 =?utf-8?B?K1cwR21tUzFlMXdwNGNua0pTazlVSkg3c0Y1dTBpc3IyaStMTXdKQTk4QnRl?=
 =?utf-8?B?NWZ4TjRyWFppVmJEd3FibVJlSE80c2o5ei9UMUhYVEFFOHNjR1c4Ky9XcWxh?=
 =?utf-8?B?RDEzelhhaUtGYkJqRHJ6ZTd6V2t6Qk1mV0g3NE1HL0dOSC9pYlFHNERjL0Jl?=
 =?utf-8?B?V1dScGMvYUF5Tk5jTnlKR0s3VFlvTzl1S1Jna3ZaSnRXWkFpTGVzSURIWFRT?=
 =?utf-8?B?bG9IUnd0bi9neDBTc2s1ZjkxRGllR2tYR25CMXNidDd6RFZkaUZLeFdvUlU3?=
 =?utf-8?B?UVZWNlZydjQzeXB3a0dWQWZONTQ3Zm9Qb3BPMi83Y0FBUmpoUjdtU2FKU3A0?=
 =?utf-8?B?dGNyYnJiRmJTUXpWdWoxTWZmQ1RuU3I0NzltY0lXK2Qvb3YzWnVkaUhnYnl0?=
 =?utf-8?B?UDE5ckp0Q0IvVkxWUDN2NlJLRnhBMlBCaHkzeFFPOThRQkdnNFlwRTlPZm8w?=
 =?utf-8?B?Y2Z4R0dBbi93elloWmQ4dVlmd2wvU1BrT3JFeUpIL2t2RmhSNGJVUXhWMG1r?=
 =?utf-8?B?SmZ1bFZsb0l3QWJnQXRsZVFGeHNCY1J1WmYwam5lUzVDamk5SGlIeHJRbHN3?=
 =?utf-8?B?Vmo4ZVZBdVFRTGxHbzJ2TXNHRjV5akw0eDNUZllnT2t1ZmRZZU9Pa0xUMEJ5?=
 =?utf-8?B?TzhuTC9NWkpwZ0FiT1hHRi9SSWFzbVZ1T0ZBc01PTFo2VXBCUkp2aUlQNU9w?=
 =?utf-8?B?M245S3JaV3NyTmM0ajVLZWtXd2VmdVo5M2lNQ2Vvc0xHc2dOWjZmNkJhZmZi?=
 =?utf-8?B?UXkxTzVpZEdORkQwdkhzdUJXSlo1UXVOek9aRzJjNk1DakI0M0E3b1VvcjVy?=
 =?utf-8?B?cHQ3YWxVNVg0TXdIdlFBN1dBR3JCZGJOTW9iQmhoVXJ3bGlZTnJsZEFmcHpz?=
 =?utf-8?B?eEhUazcwdUpuOCtGZkVYcEhoZk9rN1FtZWZGZUNzblBoa250bzlEaWlkMGg5?=
 =?utf-8?B?QytlZHI3RTh2c2tGTStzdGszc2hZNFR2Mkp1ZUcydThIVDJGTDVOeFp6czJP?=
 =?utf-8?B?S1gxRTJXUmF1c0x6cHZlcFlUWlpuT3BVTTJDdXFibVdWOWJoT1luNWMwN3pW?=
 =?utf-8?B?NXdyclVydmptUTdEUERaeWlFUTEzRkZCaUFyaWRlNGNHQ0c5bHpHRmRFTTdq?=
 =?utf-8?B?Y2R2cU9paFV2SHBiejFQbDdlSGp3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(14060799003)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 13:02:05.6534
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba2a3bd-d098-4fa9-9ae3-08de5cdb1b31
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0F.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8847
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 13:02:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230005

T24gMTYgSmFuIDIwMjYsIGF0IDA5OjI3LCBDaGFuZ3FpbmcgTGkgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPGNoYW5ncWluZy5saT13aW5kcml2ZXIuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiArU1JDX1VSSTphcHBlbmQ6bGliYy1nbGliYyA9ICIgZmlsZTovL3J1bi1w
dGVzdCINCg0KS2VlcCB0aGluZ3Mgc2ltcGxlIGFuZCBqdXN0IGFkZCB0aGlzIHRvIFNSQ19VUkks
IGl0IHdvbuKAmXQgY2F1c2UgYW55IHByb2JsZW1zIGluIG11c2wgYnVpbGRzLg0KDQo+ICsgICAg
REVKQVRPT0w9JChtYWtlIC1DIHRlc3RzdWl0ZSAtcyAtZiBNYWtlZmlsZSAtZiAtIDw8J0VPRicN
Cj4gK2FsbDoNCj4gKyAkKGluZm8gJChERUpBVE9PTCkpDQo+ICtFT0YNCj4gKykNCg0KWW91IGNh
biB1c2UgbWFrZWZpbGUtZ2V0dmFyIChvZS1jb3JlL3NjcmlwdHMpIGZvciB0aGlzLCBhbmQgZG8g
aXQgbGF0ZXIuDQoNCj4gKyAgICAgcm0gLXJmICR7RH0ke1BURVNUX1BBVEh9L3Rlc3RzdWl0ZS9N
YWtlZmlsZSoNCj4gKyAgICAgcm0gLXJmICR7RH0ke1BURVNUX1BBVEh9L3Rlc3RzdWl0ZS9SRUFE
TUUNCj4gKyAgICAgZmluZCAke0R9JHtQVEVTVF9QQVRIfS90ZXN0c3VpdGUvIC10eXBlIGYgLW5h
bWUgIioubyIgLWV4ZWMgcm0gLWYge30gKw0KPiArICAgICBmaW5kICR7RH0ke1BURVNUX1BBVEh9
L3NyYy8gLXR5cGUgZiAtbmFtZSAiKi5vIiAtZXhlYyBybSAtZiB7fSArDQoNCk1pZ2h0IGJlIGVh
c2llciB0byB1c2UgbWFrZWZpbGUtZ2V0dmFyIHRvIGdldCB0aGUgbGlzdCBvZiB0ZXN0cyBhbmQg
dGhlbiBpbnN0YWxsIHRoZW0gZGlyZWN0bHksIGluc3RlYWQgb2YgY29weWluZyAqIGFuZCB0aGVu
IGRlbGV0aW5nIGZpbGVzLg0KDQpBbHNvIGZpbmQgaGFzIGEgLWRlbGV0ZSBvcHRpb24gd2hpY2gg
aXMgYmV0dGVyIHRoYW4gLWV4ZWMgcm0uDQoNCj4gKyAgICAgREVKQVRPT0w9JChjYXQgJHtCfS90
ZXN0c3VpdGUvLmRlamF0b29sKQ0KDQpKdXN0IHVzZSBtYWtlZmlsZS1nZXR2YXIgaGVyZT8NCg0K
PiArICAgICBzZWQgLWkgLWUgInMjQERFSkFUT09MQCMkREVKQVRPT0wjZyIgJHtEfSR7UFRFU1Rf
UEFUSH0vcnVuLXB0ZXN0DQo+ICsgICAgIGZvciBwIGluICRERUpBVE9PTDsgZG8NCj4gKyAgICAg
ICAgaWYgWyAiJHAiID0gInBzIiBdOyB0aGVuDQo+ICsgICAgICAgICAgICBpbnN0YWxsIC1kICR7
RH0ke1BURVNUX1BBVEh9L3NyYy9wcw0KPiArICAgICAgICAgICAgbG4gLXNmICR7YmFzZV9iaW5k
aXJ9L3BzICR7RH0ke1BURVNUX1BBVEh9L3NyYy9wcy9wc2NvbW1hbmQNCj4gKyAgICAgICAgZWxp
ZiBbICIkcCIgPSAic3lzY3RsIiBdOyB0aGVuDQo+ICsgICAgICAgICAgICBsbiAtc2YgJHtiYXNl
X3NiaW5kaXJ9LyRwICR7RH0ke1BURVNUX1BBVEh9L3NyYy8kcA0KPiArICAgICAgICBlbGlmIFsg
IiRwIiA9ICJraWxsIiBdIHx8IFsgIiRwIiA9ICJwaWRvZiIgXSB8fCBbICIkcCIgPSAid2F0Y2gi
IF07IHRoZW4NCj4gKyAgICAgICAgICAgIGxuIC1zZiAke2Jhc2VfYmluZGlyfS8kcCAke0R9JHtQ
VEVTVF9QQVRIfS9zcmMvJHANCj4gKyAgICAgICAgZWxzZQ0KPiArICAgICAgICAgICAgbG4gLXNm
ICR7YmluZGlyfS8kcCAke0R9JHtQVEVTVF9QQVRIfS9zcmMvJHANCj4gKyAgICAgICAgZmkNCj4g
KyAgICAgZG9uZQ0KDQpOb3Qgc3VyZSBJIHVuZGVyc3RhbmQgdGhlIHBvaW50IG9mIGl0ZXJhdGlu
ZyBhIGxpc3QgYW5kIHRoZW4gc3dpdGNoaW5nIG9mZiBlYWNoIGl0ZW0gaW4gdGhlIGxpc3QuIFdo
eSBub3QganVzdCBtYWtlIGFsbCB0aG9zZSBzeW1saW5rcyB3aXRob3V0IHRoZSBsb29wIGFuZCBj
b25kaXRpb25hbD8NCg0KPiArUkRFUEVORFM6JHtQTn0tcHRlc3QgKz0gImRlamFnbnUgYmFzaCBn
bGliYy11dGlscyINCg0KSGF2ZSB5b3UgdmVyaWZpZWQgdGhhdCBpdCBfbmVlZHNfIGJhc2ggYW5k
IHdlIGNhbuKAmXQgc2VuZCBhIGxpdHRsZSBwYXRjaCB0byB1c2Ugc2g/DQoNClJvc3M=


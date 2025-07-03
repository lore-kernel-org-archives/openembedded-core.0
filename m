Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 166FDC77B7C
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 09:15:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.18200.1751534113063197934
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jul 2025 02:15:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9279021825=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5634lZe1020361
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Jul 2025 09:15:12 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2084.outbound.protection.outlook.com [40.107.236.84])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j7c9dayb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 09:15:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x4itstBnCQU23LInuwZPVVCInHhCyo5zA7/mppgCkmQ0Vq3N6AdnOrB29TdA5+Na4kiLEuX6K2R1da6DEiUJPjdB8OVCJ9Qne5XvnaugMe2UQmFJ6DYbcvMxOy/kAALsGJxWtwZP1DwXqIBVF+scrQbj5ePKrM58JBZ217lEl+63jTsOUMs1Zr9YDZj47el0dZyyQcH3poZnglSdgiNroz+Ioj10oZ436xw/7q5/wdx0U8KQmBg2oCPbZ/wjaXq1d5LLXNraicpOblTx4ZqR0VtPVNqsz5GAyJhEs10nmIWiKYU5CrTDuTZoKvgWIV50KScv4F0qDjwebkotamXTfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28pxYJ/OujPKPjwCnnJRWMwkkYf0RV1yXSXhiO+b0jU=;
 b=LTdnA5I4l8pRvM5xXW/+mBZIS+/O7uwGceOQ7/HPn8ce3xLGV2MdXAHbmHHh7lTUt/XlOYPtXYD7D3W5d2GPiZ2kMz5cbqCZIT7NkCj+QH6tDcsr3GKRhswREEPoAFMTRy7XYk74GNI+WzGtwueLVe+MP5nxQlyz1g63S1Dabtt2D2p8UP/l05TV//lM4Pud95YgeIUwaetdnxWtDLkWTea9zZVQZEOniGubpor54Sc2zfRpV81/nIFuBrWMN05i/9trOw+imqXuVQ3UJNxOnBcwB2LbFSSVmSRSGSFU8Z3m84YQxgAB0aWENPV/MNuy99TtTqa67Kw/h7wVGdExOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by SA1PR11MB8594.namprd11.prod.outlook.com (2603:10b6:806:3b1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 09:15:09 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%6]) with mapi id 15.20.8857.025; Thu, 3 Jul 2025
 09:15:09 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Yash.Shinde@windriver.com
Subject: [PATCH] rpm-sequoia: Use DEBUG_BUILD to determine build directory
Date: Thu,  3 Jul 2025 02:14:28 -0700
Message-ID: <20250703091428.43247-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset=utf-8
X-ClientProxiedBy: BYAPR11CA0057.namprd11.prod.outlook.com
 (2603:10b6:a03:80::34) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|SA1PR11MB8594:EE_
X-MS-Office365-Filtering-Correlation-Id: 62b0db11-bd99-4228-abdd-08ddba121bbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dS8wM0lUZFA5Qmp6a3A3eElVWkZWbXMyZ2IxSHp0V0FWUC8vL2htUm5PRHhn?=
 =?utf-8?B?WC93YWYxc0QyQVlva3VBUVpUWldtT3gwR3lyUHRrRVdUNzg2b0pmZkZNa0Nm?=
 =?utf-8?B?RitYVVFrZHlCbjFVN0JkdkV3NCtub2pZNWhnN1NBQndGaUcxNEVRQzVCSFJt?=
 =?utf-8?B?S2h5RTZNd3JGTFUrTFJoQmg4MGJQVXZhV25HZWNsR0gyZ0huYUlUbHBMQXdz?=
 =?utf-8?B?T1F5NnpQWDBzU0pJOE5Xb0NnMUhWQTRuVk1QL2VuMzJpWGEyWmlKVGRaNmpp?=
 =?utf-8?B?eHZ1N1VYaHNwdjhvTE9PdlFIYURvSjdEY2NXOXQrSE10c3VEY2ZQZUFDU3NN?=
 =?utf-8?B?UnF1QkhoZ3VVMDlMZEdWd3NLR21VbEdyNUVLMmVCWnVJc1g1UVhnbWVublhF?=
 =?utf-8?B?QlZHT0t5VHIxaG9zcHhtakhSYmhJdVJxNGhzRW9raE5ncXludHoySjB2NWxa?=
 =?utf-8?B?VkJXYmZSY0RsMHdObjVlR0Z2VDdPQTlqUnhsSUNiamVrY3FFaTZ4bFJaMnBO?=
 =?utf-8?B?bytMcE5uclU0V3ZIVmZrQTd6ZmRNVEcxYXFoanZCMG4rUlgyenZyWFllUGpG?=
 =?utf-8?B?SWdoaXlvSll5MG1YYzVNaytTUndhOVY4NVZMa3dHd1ZsWDZnclkyTmI1cXhl?=
 =?utf-8?B?OGFpTW5qaUJrWHU1cyt2akt0RnBoZFJSamxUb2hpK0Q2bjJZNW1RWXVsSzc3?=
 =?utf-8?B?ODlSa2xlK0hyUDFkdm1ZcUhEN2UyMk9kUGJ6QUYwY2xuWmJyTGZINjN0N0JN?=
 =?utf-8?B?YnZBdGo0OC8zdDFtcmxGaXk1TExmeTJ6ZGdnRWtlcXpVcURHQXVreDQxWHh0?=
 =?utf-8?B?ZDRvNC9ycWpsem4xSmVYSVJYQ0FtZkdGZmVxd0FoYnB3NjhnekdKNGxZUjdm?=
 =?utf-8?B?N3k2RmxheGtHNDFYMkNLaGx6RDFiVnZZaG9WWWlnTktkcU5qZTZPRGNCblFZ?=
 =?utf-8?B?K0h0Y3p4aTl0dHJkSFkycUdZS2h0NUVBOE8rSWhQa2FCZ3BBMVNObHZFMDRo?=
 =?utf-8?B?RldCMHQ5dVJvZzRkL3ZPT0VGUHYyUmpMRVhmOWpJb2RiV0ExYUtza3QvRXBG?=
 =?utf-8?B?MHhjeGlRQUsyVW1DQ01oUElzOUczY3ViazBvUUZ2SGVwczc4a2VGN0doRW05?=
 =?utf-8?B?RnU1TlJQQnV4ZklCcUM0M3dXTGVmbWlveUpCUEI1WnMzWWZOWnFuZGJheFVr?=
 =?utf-8?B?YnE1WnhVM2NXbkRtMWxWQ090ZFBtUTV4bmZlL2lWWDVxaUc4bG5pRmZuMGJ0?=
 =?utf-8?B?Z0txa014TDQvbFg3bjZrcWhTcEd4bTh0YndEbnEzNFNjV1hjT0FyZUFXTy85?=
 =?utf-8?B?Y3ozZFc3K1h0aUtvRGpuVW9rNEdrb3FpWGh6dURQWGZId29SYW0xNkc4UW4z?=
 =?utf-8?B?aW9iTDU3b2wwQm9CYTBuNE9xUHRQYkI0OVBnMkFSS1JlWVhhQWVUcXF6QlQy?=
 =?utf-8?B?R3BRL1VVNXVRWDl3RzZSZjJSNFFnTEpHSGtONUsvYllXcFBVN21UVmEra1F0?=
 =?utf-8?B?RXEveUVqZ0dOdXRmL1JTNWhncUtFMUc1NWI5aEpsbXlPaXJyQURWSVNoV2FK?=
 =?utf-8?B?UVc1REFhSXMxU3lQWmY0N1g1aEdFWGJSYzY0anI5eGFoUkpXV1lPbWpBQkRt?=
 =?utf-8?B?eS9VbTF6NW5zd0xud24vcktkbXFFc3d4QXBRcFlmRkQ2ajV3bkhLOGRNdjk1?=
 =?utf-8?B?UjAwdnQ3eHRnbEhnZ1JTRmU2aVl0UEw4bndFOTdWR283SGZUMENDT3prYklS?=
 =?utf-8?B?dnJzVlQwNzhLOVp0dXBXU09JTE05NmN0UVZOUDZNV1N0UFlZK2lHbmlmaEJ1?=
 =?utf-8?B?T2xaTXp1R0FNV0QvNkZ0ektmWXd2VzNRS1N4ZDMxRm5KVCs1akN5aWwvT1lR?=
 =?utf-8?B?T2ovS256TzkxbGlaWm81OW5jSDZOclJLcEhzckkrUHlCODljMjhZZnZYVlVC?=
 =?utf-8?B?U3FPRXBoZTFqa2JjQ1RoYXBvcDJKWXk4WTExVzRoWkxBYjFpZEFQRm53cUZ3?=
 =?utf-8?B?WURYTHNKK3FBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VVBGcUhROUt1NUxQN1pzV01vbEx2TUJ0bG93am55VGdGWkEzcURoKzJNSG9Z?=
 =?utf-8?B?UDVjQ1RTOWI4eGM1ZGNKMmFpT3VZV29LUk52dEhOYmV6OTNJNDlLZHNLZndp?=
 =?utf-8?B?TUJQa3RCUy9Cc2FTUDNQWHEyVHM4a0lCWmZuRHBrT1RSaFA0eDBrcFJPd0ZB?=
 =?utf-8?B?ZlFqaE01eFRnZ3NjaXRJQncyL0k1bFlPQVRnTW5HRmVzdVJ6SkkzZy9IeTBx?=
 =?utf-8?B?TjNPVEV4aGZNdWJXT0hFbUdkdlhpN1c5TEw2U3hwNEJqRU5BbSsrem1QSG1o?=
 =?utf-8?B?WnM2eTV3MmV5UnlMa1pSMXhJM2ltY2w1cjVMYVR6eUJOWWRTSk00MmVJdFlo?=
 =?utf-8?B?SWRDRUVJRXhueFNtdVBTYXBSRzZhMzc0VzFYYlVzdXVaWHlLalZ3TE45UjlO?=
 =?utf-8?B?N0wxVmVMVXE2K2tSbjJhblZDUlpWWWpkMEluYkI1WStSMkt0TVF4RHFyT1JT?=
 =?utf-8?B?bG9yZEJyRFFGaWtVenNHWXhvR2NwV2lkN1pMVFRkZS9tMHhmTUdmTmpNdkow?=
 =?utf-8?B?TStYMFdDWDcvOUZoVklwYWY2d052eGtNZ3dITnllOUU1SXZYZEdFZTRjOEg0?=
 =?utf-8?B?OWhrQ0hIWjRrWjY0eGNjR0pZUnVxRXdWbXc4ZjZOak1LVUFyS293R0FaMjE4?=
 =?utf-8?B?NnBhU2VjVVRzMnB2TEc0eEFVd05sVTJzZGhRMkUvTFVWYmtYdHZPd3VwK0Zh?=
 =?utf-8?B?V3lDZHhNSlNqK0lYaHZ5NzJsKzd0L3ZROHZvM01HU1lsYTRZNnVvc2tYbXlx?=
 =?utf-8?B?Y0VLemFBZGRGUm9TSHBWWTB5b2dZRkRmb1g0WE5lK1Z3N01lL3RlSktIRVo2?=
 =?utf-8?B?OWVmalZpT3V5Z1Rrb0ZiZ2VTMDA0OGoxUTZpdmxvWWlFUU9GREFiRU8rSSsv?=
 =?utf-8?B?ZlJQSmoyWmhNeHlEUTBvMEFtb3F0WWRhQ1BmMnExTVNXWHJ5QVFmNGJvYjhv?=
 =?utf-8?B?dUxkTWNyS2hZdVN2OGpFRDI2bFc4MTE1cUkzeHE0aVNOY1RDOGF3eFRwQWlj?=
 =?utf-8?B?M2tFV1RZRTlrL3BIWWw2ZzhXTEFpM1ZiemkvbEFYNlZ0Z2tQWUlwcE9vQmFN?=
 =?utf-8?B?M2plT1ZLODVkQjU2bnh1aGFYeFNjandyRzd6MTZpTE5CY1loZ05IYU54OTdD?=
 =?utf-8?B?ZFFSYlNIdmE0QXN6eFdsWE96VzZUM0hSMFVxVGxBbGRScVBjTlE3ZmNEVlNv?=
 =?utf-8?B?RGZyREwwN040K0dTRkpmd1RRVmwxTGwzUVNGK3N4ajlaWXRQWmZTZDlnVEtS?=
 =?utf-8?B?NEU4bEh2Yzlqakt2VGdlc2ttbFJudFhZRWxCSURGVHJlQ2Z1RWl5OXZiY2VN?=
 =?utf-8?B?ZXlyU0tldmRRM0c5c0h3RVRBZFoxay80N2w0cUJZQTI2ajB0c2JTZDd4WUgv?=
 =?utf-8?B?NWpuSWFBVXh0c2oxOHVGbkhXSzB2bUk3UFFFcldJSDNXOUJkM3R4SjN2K216?=
 =?utf-8?B?SW5XdlE1UE5pTmhRL0NCTjkyaHJHZGhveTY4Rk4rVEJpMlREalhEVDFWTlp0?=
 =?utf-8?B?TEk4djQ0SllmaGxvRGVQdVUyY1RoNklZUG1zaHdWZ21ZN2FNWEdERnZQNVdV?=
 =?utf-8?B?VnBXMWFTaENkdll1S3p3bVJjcmw5WmFvd0Zwb1NwME5XVnB6R0NFOHR4eERp?=
 =?utf-8?B?dzdSOFFxUnJvYUNsdjhQRkVhdm8vTnJRaTk5R1FIVEl1cFZabzhsS1ZtVTFn?=
 =?utf-8?B?VVVjaVNSdjZOeEdVcDBwck1WdmNHcHNqczk5aytzaERhQTY2WldnczZ4b2Yr?=
 =?utf-8?B?cVlBeUtaZW50ZXhzMERhbjQydTByQjdqTUxacGFyeGwxbUtsbGxTSTREU3kz?=
 =?utf-8?B?VlZPMTBGYzdXT0pVUm5Ga0MxdmhQd3ZPTXNjMEVVelRSVlFkUnNLUU5XcHV0?=
 =?utf-8?B?dXZTcEQxMHNjVW5mZ3F3aHgvbkpFN0FNeE9yWnc1eFErbS80U0NmeExWaUps?=
 =?utf-8?B?UGg2WG9wSkl2aGhpUWF4VmdJYnI0YjRqUEF6SHB5WWwveWJXTWMwTUlsZk1r?=
 =?utf-8?B?empIS1F2YlRwek84OENlUkxibzBpeFZSTDNHN0dWQ2l5cUpYSGNjaG9oVXNn?=
 =?utf-8?B?Tm9za1QzeURib3NlenN3dUZ1WnVjVldaRFRtWXlXM2MvdEZDV3AzR1VPSXg4?=
 =?utf-8?B?cTJ6dGx2aFZMalpXTkNQRE9YNy9ZeEowaE16b2YxbFI0OUwvdjYxZkdsRnNU?=
 =?utf-8?B?Q2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b0db11-bd99-4228-abdd-08ddba121bbc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 09:15:09.5183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sfZLo8BK7AmYXGMA2BwxLXNoPlfSYNtPCUkFMIO5ZM8JS/eRWUvqjb9e1qHo8DWb2e98lg2nrqeW2F6Jfopo40ZO5SBdFlK78A0rnZLAhvs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8594
X-Proofpoint-ORIG-GUID: YQRPomfMjUhVvqj0vgD3VnHbYTwXMi7M
X-Proofpoint-GUID: YQRPomfMjUhVvqj0vgD3VnHbYTwXMi7M
X-Authority-Analysis: v=2.4 cv=M5xNKzws c=1 sm=1 tr=0 ts=68664a1f cx=c_pps a=6jVCcZjlZU7jxA9Q8dw4rQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=t7CeM3EgAAAA:8 a=k52h-3HaRRgvT7H0U1QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDA3NCBTYWx0ZWRfX2ViSOaNzAHAS MAZdmKxHrBV8fayVzRw5WKmL6OB5S1sVNoExVAq8R6R1USINxh8R5euFSXpHlxna7/OVo0ajbsL 0NoZw1WW7a5DZFDP30q9/CnU7GlqAyGQLYuhzoDaSiCjxoOZyThsW1jXY0lCsspuRG8EcmqnKXk
 dDNdsGsbtebDkUDLzSWWl1RZxsAt/HZP0AQ9yFJR36qbc5gtv5ZCLb73BCgKu9llSrNVsIycgG+ 5QilRc1v/NzOyw2BX5wwSlXMKVCXQPO1L+m2q6r+PwxrbdGBOz+fXzvKvICjyE7Rmm6P/34Mqfi NmL/s9/Xg0L2x0c9+JHjfOVCjbBZucBs+415UDRO3WJRd/OdUsMfaZfoatG4ehbr7yBCeOWsFQ0
 Fhok0lcea2n9wB6ipUeI4O1B2jDaJOpoz3cCGt2mFnfC0WdrR7HlfPM8wnpOlfPpSFOLJHou
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_02,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=887 suspectscore=0 mlxscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507030074
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5634lZe1020361
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Jul 2025 09:15:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219863

From: Yash Shinde <Yash.Shinde@windriver.com>

Debug builds fail with a panic in build.rs when attempting
to create rpm-sequoia.pc in a non-existent target/debug directory:

process didn't exit successfully: `TOPDIR/tmp/work/core2-32-wrs-linux/rpm=
-sequoia/1.7.0/build/target/debug/build/rpm-sequoia-d2609670a855c0b5/buil=
d-script-build` (exit status: 101)
=E2=80=94 stderr
thread 'main' panicked at build.rs:125:36:
Creating "TOPDIR/tmp/work/core2-32-wrs-linux/rpm-sequoia/1.7.0/sources-un=
pack/git/target/debug/rpm-sequoia.pc" (CARGO_TARGET_DIR: None): Os
{ code: 2, kind: NotFound, message: "No such file or directory" }

This was caused by the build and install logic assuming a fixed release d=
irectory
in rpm-sequoia recipe.

Update build and install steps to use the ${BUILD_DIR} variable,
which is set based on the value of DEBUG_BUILD from cargo.bbclass.
(rpm-sequoia inherits cargo)
This ensures paths used for rpm-sequoia.pc generation and installation
are valid in both debug and release configurations.

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb b/met=
a/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb
index 17d5a747ff..46f9ee8548 100644
--- a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb
@@ -26,7 +26,7 @@ CARGO_INSTALL_LIBRARIES =3D "1"
 do_compile:prepend () {
 	# rpm-sequoia.pc is generated in the source directory
 	# but the target directory does not exist there.
-	mkdir -p ${S}/target/release
+	mkdir -p ${S}/target/${BUILD_DIR}
=20
 	# From rpm-sequoia's README.md:
 	#
@@ -58,7 +58,7 @@ do_install:append () {
=20
 	# rpm-sequoia does not install its pkgconfig file. Do it manually.
 	mkdir -p ${D}${libdir}/pkgconfig
-	install -m644 ${S}/target/release/rpm-sequoia.pc ${D}${libdir}/pkgconfi=
g
+	install -m644 ${S}/target/${BUILD_DIR}/rpm-sequoia.pc ${D}${libdir}/pkg=
config
 }
=20
 do_install_ptest:append () {
--=20
2.49.0



Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E34DEC5B552
	for <webhook@archiver.kernel.org>; Sun,  8 Jun 2025 10:52:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.35236.1749379939408309059
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jun 2025 03:52:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82543c27de=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558Ac3OW019003
	for <openembedded-core@lists.openembedded.org>; Sun, 8 Jun 2025 10:52:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474cd90v7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 08 Jun 2025 10:52:18 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 558AqHmc007768;
	Sun, 8 Jun 2025 10:52:17 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2055.outbound.protection.outlook.com [40.107.244.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474cd90v7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 08 Jun 2025 10:52:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PO9vT9F77Ft5BABvOlH4jQuqvN9lHv7X8Lt81+hqNZOdikeYcYtiz4Fj1H3fbnu9c3FYJeoItxq2xKjeLkNbsg+AtLWSweAJGriTU8Ket84Pc0gq/F/EIeMneasw5LJvZbwrPaZzth7rXRg+xls7XbBd9qMG6g4+BuPoRK8gNuwNuNPesW+2CmUJv5EwzSpw6qdn7+1LzOXhmwCCCN4/CAufCKkgvEMLNvHn4aQVTrUueKKtwP+CN0zylPfV4K/PK2UrKXnWQavJWWuoOTdJ3ky58w9urhZKcanOuUHulx5euIEi/KJ8ggCmptyNykKOWbc4SSEYdqYkhW0dHwSiUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fHtrNFR4ihGFjpKbc5XH9F2qMIvSWgRd83oscoLiaJA=;
 b=m4cT7B/pD/jwGm/KjblHjbZBS87YnfpFIhLoAUrF+guBRo6dzpvfkzrkB3b/5bUuMYeYiDPEmWP1cwlVXTKti03DhLlmTt59ZJ4hrXTMoY5xqaQjeRcB4ioqw8PtCp5xArQRVD/AJSjgyvxjmHSQI0sODrUI7JIYgfUGP0xoL115QfrK8NcU9cfDK2rtIzjChV3ZBvFrl0jRJBlUo51/RihEybkembHhcX1yE+hHkglA+G2UKgpizQtXUI+dnOwxkATHN2aUXoiENO2ReMSpFoIpBxCgBd63DY9sEbEoSQ+h8KKKrsflcTHEviDi4Vq9SkOzv5W/qtO5KpEeGHaBSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by BN9PR11MB5225.namprd11.prod.outlook.com (2603:10b6:408:132::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Sun, 8 Jun
 2025 10:52:13 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%6]) with mapi id 15.20.8813.024; Sun, 8 Jun 2025
 10:52:13 +0000
Message-ID: <68a030c3-3aad-40be-b0a4-9ba344ad6a39@windriver.com>
Date: Sun, 8 Jun 2025 18:52:06 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: Patchtest results for [PATCH v2 1/1] rpm: 4.20.0 -> 4.20.1
To: patchtest@automation.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
References: <ac979fa2e300f8fb8e4f60fddcad4d299741ab33.1749379320.git.liezhi.yang@windriver.com>
 <010101974f25b46f-25c3d505-38be-4277-ae97-006ce8b41b73-000000@us-west-2.amazonses.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <010101974f25b46f-25c3d505-38be-4277-ae97-006ce8b41b73-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::15) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|BN9PR11MB5225:EE_
X-MS-Office365-Filtering-Correlation-Id: ef31ecc8-7128-4b23-9330-08dda67a868e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?L3VIL3VtcW13ZWZPYWhZVzBHclhyRDFrRjB3RVVWckNlYlhId3FYMDFoejdo?=
 =?utf-8?B?aTU3ZFNSMWs1azJtWDIxS1FqdDFKeXhROE9hZFBUMlltSlk0YUltelF1Q0lP?=
 =?utf-8?B?bjhqRHZDa3F4N2ZTQmpZdjJkNHRQSTRxdkxRRWJZNXo4YW1acHBNaVpQZXEz?=
 =?utf-8?B?dTg2eHlWWU9UVERzTTdSTEFYNDZVN0JOWHlkRW5KNDJTVDRQVmhhdjdwYzFP?=
 =?utf-8?B?ZzJEbXUxZE9lMEcxNmNvZFU2UVhsYklUV3RKN3lSUlc4S2Uza0xmYXM3VTY4?=
 =?utf-8?B?ZDlKS1RkMU85OEZuVGlCakVvZ25TR3NxYVRNSW51QzFycCtGYVFzaFIvNmQv?=
 =?utf-8?B?OUJQZjYwZ2xSZUxrdWZMSWFDL2M3Z0tWQURYWk9haEhBVFBSRWExdDIyTUpt?=
 =?utf-8?B?YjNVcllvQ1VQRHlRRnRUWHk4bzlxL1Q1Z1p1ZmJTUlQ0VVRzdWl2cDRTT3Zi?=
 =?utf-8?B?ZEU2Nlk3Ui9OWlIrbG5uNitsdjRVTUhLaTd6TzFNUzJoV1BMRHFwcXFaVUZz?=
 =?utf-8?B?NXZadzdranUyb01iYjRoT1BBc0o3ZXlZTW5KU3JCZ1VNRmtIcndTS3JSNkpP?=
 =?utf-8?B?QlZxVEJnS3RBQWNJVXRxYUVqWGJCOS9Dd2tJYUVlTlprWC9qNDZNY0l6b3Zm?=
 =?utf-8?B?SUNQRzY3MW9SdUVHd203azhuL2I0NWhXK0krTXBkVkJaOERWdVN1YTVKSXpX?=
 =?utf-8?B?TFRhUWU2VFh6cE9hVEdySmk2VHVtTDlSdTZOYjBXelhXaXRiMUhPR21HVDUy?=
 =?utf-8?B?N1REOVJuU2hxV2h2Ykt4eDlpS3ptMUxEczBVSWpwdzY3TllYWnczKzcvd21G?=
 =?utf-8?B?bjN2NERnbC9aSDltRWpISWNjb2IvMmwwL1hHZ2FSaFM5aXN5YXVORkRBK1pj?=
 =?utf-8?B?QVpwY3F3MVZ0VVg2eFN4dmxzcVFEajlWQXY4T0hQNjgyOW41ZVY2T0w4UlhS?=
 =?utf-8?B?T3pPVk8xT0pNTDNidVNMQ1p2dnJDbWFsWFJQWmZvT2tUV2FTdGdyY2I0Zk1h?=
 =?utf-8?B?Z3lWVE9ZK2d0V3FpN1RrYXRJSHMwQVJzOCtyYW94WkQ4Wis1MXB0UVVCbGI2?=
 =?utf-8?B?T3RFL0dCM2pyR0l2TkxHU1NqYzl6NHlYN0twMUdMdGpTZVdCRXhISXJrdnJN?=
 =?utf-8?B?YXQ2QVZ4YStTNXcxWVg3QUhrRzRmZUtyMmxLd2JIdXY2N1FlbklPRXRQSkMx?=
 =?utf-8?B?VG1nUFBweittQmFCSEV2TExMbGhaSXRjTk92U3RjQjJxMmFWTmF4dXpBYW91?=
 =?utf-8?B?VnlQckNna3VOYlFzZDZUbW96cFE4M1lIdUNjRVk4Y3IvNFB5cGVrRDBJM3k4?=
 =?utf-8?B?SGsvUGhwZ0ZLS3ZRVU16RXM3b0pYRUdSRkEybk9yQ0V5YlNSeHNrb1pzZ2Z5?=
 =?utf-8?B?cWJVdW12L0VEME9NZ3dyLzZkQllERloxUmdOTlY5UkxpRmUvQWlIN09aYlc1?=
 =?utf-8?B?VXgyajFIYzEzT285dDlQKzVVamVPMmhrVWpobUhuUTVCQTEvR3pKRW5XV3Az?=
 =?utf-8?B?VHg3MXJtSlhwb1liV1UyajZHbGwyMXFVcDRXb3NHZU5mM1NFM2dPak5oSkwz?=
 =?utf-8?B?UDZNamM3dmNFYlZ5eEt1ZDRJNU9rU3FZTE90VGZMc2xUZmtSaHFyR0Nvc2R2?=
 =?utf-8?B?emZHMmNmUHVweXFxSjVDdUM5L2hnTTVUZERNZG9YaDZKNG04VnhEbyt0WUFH?=
 =?utf-8?B?QXRkMUFhN2ZJRlZOQWgzcEp5aUtZem1nUFBMTzZ4ekNQQjFZVEs2OHc4a2lF?=
 =?utf-8?B?dHFrYldCNUVjK2VSdnNhb1hFbUsyazdyZ3p5akFjNTY4bENQY2FrQm9MNS9B?=
 =?utf-8?B?MWgxcEpqdXRCbzNrS3p4b2p0b081T0xGNTM4ek1mYUJHZktkZ2V1Vi9pclUx?=
 =?utf-8?Q?D3UwWgy77WJli?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZCszTU1kemRTVGVCbVgweFRTL1lWOXdtZW9CR0pPTzMzYjk5blpydmV3VmhR?=
 =?utf-8?B?RWk4dkVqTmdjMGNmREhCMzJFMDQ4eVNFZEVNUWIzVktPUm01Uks2cU5qYXo4?=
 =?utf-8?B?VmZ1T0dwMjVIeGdRSkwrZkNXMy85WUp5VjkxZWFBRm5Bcm1YUXVxaWdFVGx5?=
 =?utf-8?B?eW8zWWtIckRDQkhJZkZIUXVEWUdTVkc5U0RBZmVkeTVVZUU2VHJSVVZ4RThX?=
 =?utf-8?B?dVBsSUN1RHlkdk9MZVhKOFRmQTZsK1lhSy9xUDkvclNSTnQwcmgvNVJMRStG?=
 =?utf-8?B?WWtEMWY5bUVKSTlZcDRBNTJQY3grclZmWDJmd1g2MVVqc1lPMDJ0VXVXWWps?=
 =?utf-8?B?S1MzWGtEdnd6YWVhMC9oTUpCYVJObzBTTVQzeVFpZzY0QUdWbytEUGdQbkVD?=
 =?utf-8?B?QzhBbzY4NFd0WlE4clpNWTgvN25NSzl0QXJtbjdTaTRhcThDYk5NVERQN0hv?=
 =?utf-8?B?UEJiQnBHaDhsZGxmUStTSHBudU5CTk9rOWE0UFd1N0QwMUtEclp4YTJTR2NR?=
 =?utf-8?B?RVF1MWdPQ3hqTFBJR2lkemUwdy9JclZpR1N4dHp1TzJpbHYrcnBHdXQ3YjJD?=
 =?utf-8?B?a0xEOHp5MjdxZUFKREx1Q1dNcWIzQzJyajdJQW5aR3Y3bW80SjRVMkZNMWJt?=
 =?utf-8?B?VjB0WTlVcWpQYldBT1FYUUF4Y2p4U1RCREYzUUEvQTNJU3Y1RUtuSmNaZUNk?=
 =?utf-8?B?bHFBNHJzMG1IL2tYZmgxRy9nd2FqZkp3K2FuazRnMGFvVTdrdS9vVzNoaUxI?=
 =?utf-8?B?UzZPR3kyY2lIajJqOHB0eU9BUmd3K0VrYzRvSTNPUEtNMUUzN1I3Vm1BRnlp?=
 =?utf-8?B?enZXdHFEU2RvZE02djZZbzFyVS9aY2FGYzJ3L1IzaGlDZEU2a1hWNFQyK1My?=
 =?utf-8?B?TXBEdDV1UFpqRm5ZWk1FSTlMY2xIbWNueEJPODMyeDJvNW8zc29mbVhOU2p4?=
 =?utf-8?B?NDl2T1Zxb3lLc0E4aGtXZjd2MlE3MWhjVUtVZWE1djUzUzh6clU2aGRCc1BN?=
 =?utf-8?B?ZlJCNFNWVWJOWWpkbWVYZmp5N2d2Z0VvdStMeDB2UUNGNEovS3dBd015M2hm?=
 =?utf-8?B?WU1ZU0YxOFlHUUNVZm53OWFtbkVNQ1J3MXRPNDhkeGVZRndQUnVVSExrMjV4?=
 =?utf-8?B?OHFieCtvV0pkcG83SXFqMERXRkh6L1NBZXFwWHd5cnAxbzhjNER2Vk9IcXV2?=
 =?utf-8?B?UENBQjZuVUFaNi9BbnpkRDg3N2lDV25XdHg3M2QxL0plQkwzcGh0Q2p4d1R3?=
 =?utf-8?B?c2JYWWpNWFEzTUtRQXArangzWCtWalpQN0ZjeThDNkZOVVlMUWRLWXR2ZTVp?=
 =?utf-8?B?Rk5SUGN6bExxT2dwMU1rVDhxM3JQZzB2Sm5aOXB4S2MvQUszbEh1TDFNbU95?=
 =?utf-8?B?a0tKcVVPZFFXRnIrZ3VvYlpucjJsZW0vZnUxUlZNNE5pSXhlK2RQZGs2MzVY?=
 =?utf-8?B?SjYrRXB1YitsdnNEYzZzZFo2YW50eks5R3NGQUpXSDQwMFpQY2NKOEZFb0Vw?=
 =?utf-8?B?UTBoMTZGQ0hONWRKUHNTOTdZZnJTRUJ6ZFdrdG5Ja1gzbHJpbnNYamFOb043?=
 =?utf-8?B?QW95S2N0UTJqNXRqNkthelpkVGs2UHlxWjRyUXpuNE0zQmRhTjhncUJabUFm?=
 =?utf-8?B?WjlQd3M1aUFjNXhWM2xzRlFCUHo1V3NEYW5YcVQvZnNTMFRKUkEzNUpNRllN?=
 =?utf-8?B?Z3hOUTQ2VFlIWjdDT0l4eW51UzNPWWFBNUVhQVhMWHR4bkI3NFVMcTBwM3Vi?=
 =?utf-8?B?ZVp0N0tkMmptK0R1ZE4wb3dpWmdIVk51UFlMT1ZVaUttMWVCME8wdHlsRU9s?=
 =?utf-8?B?clFDSEZGMDY2S09jZTMzZW1ZYjQ1QkVtVFZhbjUvTlJNUUYrRUJRRlFGYTBz?=
 =?utf-8?B?OHhwWEd1L0JaMUdZdHdMdmprcVMzRWZOTFpGMVR3QjRzQ1lkVU9KRnFDRGZl?=
 =?utf-8?B?bXFIaUxJV1JNaG5sWXlGek03WU1kS0d1MVJaNytwaXFlN2RNbTlHb1dxOVFS?=
 =?utf-8?B?UmNPcWFQbEJsazdBbGM1QkdmZDA0clJXUmdlbVNWM2pLSU94dUx5MFNKb3ZN?=
 =?utf-8?B?NE1sbmpWTVlBN0xIcVU5UFA5TWREWmptSnozcHIrV0dyNXZsSEVoUHVFQ2ln?=
 =?utf-8?B?dFNsSE0zc29NbkthQk1tbjFobTMrYzVSZ0dXODVwclJZanZKRlFqR0xXV3p4?=
 =?utf-8?B?T1E9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef31ecc8-7128-4b23-9330-08dda67a868e
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2025 10:52:13.3404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dlbiDIylTWivTEMYRjWmq+z/UDLfBSGdCTx6xMVLjcQux6dLt5TH+ZySfLMBTtGiyQCsCyfC1SudTk5ZsI0wS1UPUnTcyFNkjkewpnA2Bnc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5225
X-Authority-Analysis: v=2.4 cv=f+xIBPyM c=1 sm=1 tr=0 ts=68456b62 cx=c_pps a=2GB9L8dNip6y3bDgyjjg1g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=iGHA9ds3AAAA:8 a=OmQg1XK9loyA-OjW1fMA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDA4NCBTYWx0ZWRfX/oi/QlxfVw7E 8PVFe9MNAmLoIAQJcO/A+5r8jG66Ox2Th2d5NBdgw0c3VDjnylZ0ZhwRz4Xm0nkA7fHH8G2QGSA jhOUPSGK7sklsqFDdaZB5orXe18ZNRaFKJop84FochfVw5CGuXxtpZ9zt5EqUmQb0UJqjsgYJLn
 52ePSYNRNo0I6JQptdPHH8aPhtDGwPVX6lO7lAjSwmVyCRPZ2nUeYqiDr7rGSIUeDdR4Seq6/qK aETuvpnnjfBzGq7eVdKyXef6e53vvmNMbfcZ4LNasEdDZtcQoieKz52jkrslVNyGnGHvAC9vE2F A8rq0eHSidVDBsDb0I2V4Ip1hPnrQuBiDDAndwcEEjbiZ8kuuWm4zhNnW5DZhsGAoGQDdXPUU7H
 eftl91oW/YtW11lFevLYPVzGO7m9if2zu/yz0JpATnDaCDEDH0PAFP/O8SYqDzJOIlHpWHJu
X-Proofpoint-ORIG-GUID: _30LECiWzZ6JeNQmw1qrcnldA109elGb
X-Proofpoint-GUID: TWNtOnhNGo7_7CXaR7Ormtb7cbZk85Ns
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2506080084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Jun 2025 10:52:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218212



On 6/8/25 18:46, patchtest@automation.yoctoproject.org wrote:
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
> 
> ---
> Testing patch /home/patchtest/share/mboxes/v2-1-1-rpm-4.20.0---4.20.1.patch
> 
> FAIL: test lic files chksum modified not mentioned: LIC_FILES_CHKSUM changed without "License-Update:" tag and description in commit message (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)

There is a "License-Update:" tag in the commit message:

     * License-Update: Minor formatting changes as the commit messages said in
       41143b27b6f7320f280aea6014e8f532eb0239d6

And V1 didn't have this issue, but failed in V2, I didn't modify the above
section in V2, something is wrong with Patchtest?

// Robert


> 
> PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
> PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
> PASS: test CVE tag format (test_patch.TestPatch.test_cve_tag_format)
> PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
> PASS: test Signed-off-by presence (test_patch.TestPatch.test_signed_off_by_presence)
> PASS: test Upstream-Status presence (test_patch.TestPatch.test_upstream_status_presence_format)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
> PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
> PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> PASS: test src uri left files (test_metadata.TestMetadata.test_src_uri_left_files)
> PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)
> 
> SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
> SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
> SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
> SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
> SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
> SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
> SKIP: test summary presence: No added recipes, skipping test (test_metadata.TestMetadata.test_summary_presence)
> 
> ---
> 
> Please address the issues identified and
> submit a new revision of the patch, or alternatively, reply to this
> email with an explanation of why the patch should be accepted. If you
> believe these results are due to an error in patchtest, please submit a
> bug at https://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
> under 'Yocto Project Subprojects'). For more information on specific
> failures, see: https://wiki.yoctoproject.org/wiki/Patchtest. Thank
> you!


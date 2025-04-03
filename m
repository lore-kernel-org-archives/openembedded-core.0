Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B63C3601A
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 14:28:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.14716.1743690500582315266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Apr 2025 07:28:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=618824bfd2=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5335oPvI015009
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Apr 2025 07:28:20 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45sg0r8vdp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 07:28:19 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 533ERxOJ024033
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Apr 2025 07:28:19 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45sg0r8vdn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 07:28:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZGXQkYZllx0M3Q7XEo5dyKnom8WRY2zh6XP5AuN40T92HXeYyaObHWzbYVLhl/UMO08XiCGLtuazzRdXT1nweMsvycBtnQoswQxqe/M1QHpl+5Yv4+rBhMM2A+dVmE1Qn5dba8H0fa8o4gPsjIl7DcDnm4EE4y0eLwMZAhAQWWMhBtFGmcQ9pWRoHtIdpk7VpTaG7wvBYvZV41AlAMWJOo2YcM8dUpq7j7iec7+OeJ7tmTpR4iCGkc8Z8XUjtUSGApzcxS0ViyP/FddODW3SVqNn1RSWknKZQnVsRZGE6htU0EEglD+ZGHfQX7RC/+OKXycbvyBFuzPblWSfy9KYhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oI3l8TZJDtgwYrwMHfhGE8IIg7F95Ab8kwMJg/wOErM=;
 b=yCOGxvA8lH3X/EzT6CEUWoSj8NZWMdOwn6J2UB9JhK5Oqx4FczjKUT/CpZuw060BpTljUVSIoHuq+8S5HPRLr/ixHqvJDZhlrVyC3rHSX9of4TBjhWIRFRyLPY1adKwhZpuvCkCEyTleMvBl3KW8q+4Y2WTf4UZ0uRI2yPxqCMzs3Pemy4OwtX67dYRyIvVY0iINBAYOYfjRmPr5X2xZb2r/c41QpIpWnYLBKDOno6RQWKQcVHpmcJF5lUh6xrl3MHOSOVxQT9NOBc6g0QZ3GYwKhgYunmN9SgaH+MZFXGxqSQL1Wcmswuk6oOYTgCoRNYvLCe1qXjYHxXrN9arVMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DM4PR11MB8177.namprd11.prod.outlook.com (2603:10b6:8:17e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.42; Thu, 3 Apr
 2025 14:28:14 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%5]) with mapi id 15.20.8583.041; Thu, 3 Apr 2025
 14:28:14 +0000
Message-ID: <84ef7239-6879-4f35-a92d-ab7656fe4df3@windriver.com>
Date: Thu, 3 Apr 2025 19:57:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 2/3] rust: remove redundant cargo config file
To: Sean Nyekjaer <sean@geanix.com>
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com
References: <lh7mwjjeffawkhmarar4gl3egmaalp3gnhhg3d2lf5t244zszq@f2wyi6qm2hjt>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <lh7mwjjeffawkhmarar4gl3egmaalp3gnhhg3d2lf5t244zszq@f2wyi6qm2hjt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0078.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::9) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DM4PR11MB8177:EE_
X-MS-Office365-Filtering-Correlation-Id: 351b51f8-2956-45a2-3a7a-08dd72bbc49b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M1dVL0J1bHdBcmMrNzRwS29GRVJLKysyYXNybDREZHpyMUQ2cjBuM0ZBYVRJ?=
 =?utf-8?B?dDQ3K3VvMGQwUlRFNk1Yam5SakM1clFmTUgyYWdScVZzS2pjb1k3N2ZEQ1p2?=
 =?utf-8?B?SmpPNU5qN0tiZkt6RSsydU1tM2VTVldOc0VWY2JGVHBnMDBhNmxNQW5MbUYz?=
 =?utf-8?B?WmdtZmRLRUtJa3o3N2F2RnVndDh1UittYVNNbkI5K3JDZkNaQWMxclRaWHJo?=
 =?utf-8?B?T1kyMGJUclVxRmlPVThZRVE5Y1FKVjRsTEVWT0VNMkhuVFo3YlpmSnJtalQz?=
 =?utf-8?B?MWdoeHVYM3pxUGgrOWdCZ2dlVnJCbU9zUTlZODNMT2VzNWpiRGh5TDBqYUN4?=
 =?utf-8?B?VHN6cWhzRytOb0FiWktQR3FPUERxMEFiMWNvOHhmTEN6cjRiUDB0U3JzTm92?=
 =?utf-8?B?aDJucjB5MTlZby9VRFlUVHI1WDh2WHk4c0MrQVJSeXVnbjhIUFlkSmhsaVhK?=
 =?utf-8?B?UlJ5Ri9qQVVHaGsydGlnQmZXQWtYcEkvSk4zb2VMMnJtaVZNaE01WG9qcjEx?=
 =?utf-8?B?WEpBd2s5eGlrNFNxSFk5d2lNZlNhcFdhZGFOVnlmdmZIK2hYbDBEVVJDTXpH?=
 =?utf-8?B?cmZ2Lzk0SzV2ekhLa3FRWGgwVHVTZWZTYWEzcVlhVjJSeHJPOUhSaSsxQ29P?=
 =?utf-8?B?ZFd6UEtlOVV6RFNRQytKWUNrTXNRQUZIb1RGTWFISnZkWGtGQlE4NEtkM1lY?=
 =?utf-8?B?SFM2cG9VSlRuZEhpZUlSTVpCWG9vWmRhR3pWNG03RmQrSWV0a2dBRnBSakh4?=
 =?utf-8?B?SzBTcmYybVNibFRpQXc5bFBhK2ljcGR4VU5Yc0xLSVpVcWY1MFJ6a3pNUWRK?=
 =?utf-8?B?SEpiWHhHK3JTS2Q1dDlBL3lrK04yNDFxQWtMb3ZkK1lmTU9ZU01yMmhoYVRM?=
 =?utf-8?B?VWRWVjd0Ryt0YkZKVnlIWFlnbjZTbmFlWWI5c0k1ZGhxZW4weVVKYkNpeVZ1?=
 =?utf-8?B?Y3J0cVlBdjdMbWdIS3M4QVVrMUFQWC9YQlRWVmNyRTMwb0VSUzZXUHluNE0v?=
 =?utf-8?B?SE5IT0U2Z21JTis3U3BkbWtTczB0YWZLQXBCSHNTTFRLRFdQOXMwS0FmNWcy?=
 =?utf-8?B?ZFY1NjdoK3ZGdW8vSWxncEZ0OHZtU2QvWlVzL2dZYWVKZEEwZ3Q4d0Z2Tzly?=
 =?utf-8?B?aXdwWjBqbkFqVmpnZk1HTlFFWUt4ZXBabkNuWEpEVkE4d29KdlVKekYxWFNJ?=
 =?utf-8?B?SzUwenJJSGdoakZHZmQ3ZWNMeEo3T3F2NXUyNFY3SW0yVFUxck9jZVFJWlNn?=
 =?utf-8?B?bnVvWHo3aTZtRzdnSzQvaGU0NnFoUytTTVdzeW1PT2tCbzF1eFRmV0tIY2R2?=
 =?utf-8?B?aGNCWjA2dnVYbk9KZFN6MXowNmVIUkl2UFZ1ZnNhalJaTlhhWDRNYVRhTmtp?=
 =?utf-8?B?RkJIcTFEZXZmZnJueks0T2dhbFJqa3JERVhkQnZRRTI1SVFkdnJNcEJ5R0xX?=
 =?utf-8?B?MldlbSs3MHpiNTZ4cDBvZkN4VWE1R3JoaUd0aG1OelArZldrZ1VOenZxblFq?=
 =?utf-8?B?TjFab2pKQnZQeTNCRm9BRDcrMnpWZFdPdGo5U3VROUJNVU8vSjFFTGZyV1ZR?=
 =?utf-8?B?S0xCZEdhdFpZSFFKUTFDQmg4eUdEdTVZank1dzczL3JhOUdlV0RRQkxOUFhY?=
 =?utf-8?B?RC9zdS95ZUc4dy8rMkxOQld0Z1Z6TkxXVHRFMEs4bkhnMHdpano3Nm5ULzBB?=
 =?utf-8?B?SkJqbHpheE4xMXpvSjNXQWxyeWk4aHBwM1kyV1diUW1LQkZ2MmcvN080WUxk?=
 =?utf-8?B?YzhKY0pxOHVQVGpDZUhKOWt0ajg1UUl6U1FNZnZGZXFMczhKUjhYRlQ5NHV3?=
 =?utf-8?B?ZVFid1F2dVNUcDZ0WkEvOFhFWWdLZzhnQ3Vqam0yd1dTMDg4dmFjNWNxaERS?=
 =?utf-8?B?U29mS0E1aW45T2ZSQzc2RS9YMDVMczV3ZVZhTkNuaDVaZVBYQk9YMjkyc3Mx?=
 =?utf-8?Q?FqBPRKnvi3num20x/8HzOINU6YKT4Fe+?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eEhSM2RWaFdGV2VxVitkOGFuZmd4WlZXRXhjREpBeWRwWGZ3RVcyZEVYbEhU?=
 =?utf-8?B?WHM2Rngxd0N2ZTVkbXdnd1BxeU5aRTdEeWZQSWdnMDBRZFplMm1zV2R2NVRU?=
 =?utf-8?B?S1NiV01tdGxlQjhVTnZtOUI5NXl6b2NIWm9nc3EzYVdTWmtDZGFSa013REFy?=
 =?utf-8?B?bng4dGRXd3Z2aXRnNzFycjhMU0tyejJYMHV0QmFMeExSeURxM2FLRWlFU0tp?=
 =?utf-8?B?MWhybE9RYit2eTVhQ1BxNExCbjVqNmtkVUlCeGZsM3U3QlBReWNqVnl6c3Fh?=
 =?utf-8?B?QitkaFlQcUtXNk5UeFYrZFNXeDFjZVI3a1U2aFY3dGVVQnNHUHcvS2JJazdq?=
 =?utf-8?B?NitSSEJEQzJtdFZkRG0yRGlhWTZqZFpybm1KNWNyaFFBUC8rNi9QbUx3aGR2?=
 =?utf-8?B?RUtuOWMya0lnczZOdXorK1NzTnl3Uzg5U2tkNzNJY2t5UW9iWWcwYjk4OHh5?=
 =?utf-8?B?bStvUUx4cjdHTDZDbUxwSUtvcUQ2anBjSFJUaFNBckxxeDNBUjRHcXgzbjZS?=
 =?utf-8?B?Zk16NXZCd3BQcENXcStpc3Z6NTNsT1I5ekxBSXE1QU45SVdNVnRpenpqMHJN?=
 =?utf-8?B?Z3liaVM3SGdsQzdUdmN5ZVZkR1k5NXFQdm1pZWFCL1hNUXJLYUE3ckFSVFdX?=
 =?utf-8?B?b0ExQmgyRVEvdzVuU0FYTkpOZ1dLY2Q5SFkrT0c1QUkzclA2VkRSL1EyV0xF?=
 =?utf-8?B?V1V6cllFUkxlQW5Ock8waHczOFBPU3JuZ3Z6RFVTNmovNDlwK0VkZWJRcncz?=
 =?utf-8?B?VEwwS1A2SExONVhLRmM4WWI3Uk13cVp0b2c5QUlVMURDYS9HbXg0cXNWb3NE?=
 =?utf-8?B?R0lWQXV6eGRyUlViZ3hjbG1PSG1HNUVHanVldWk1Y25XS1IzeWJuN0R1SUha?=
 =?utf-8?B?N1pkSkp0ZGRCaWlid3RUYVdUQkFnYmFDYzFJaFVtUzlQSXN3bi9CcDFxR0FH?=
 =?utf-8?B?V3RUb2JYd3UwTnhIU2ZpNDBOYnBTNTYwNjV5ZzJrRnQ5OWgwZHFnL3VuSnha?=
 =?utf-8?B?ME45cXJVTnhrNVA3UVJJYUF3d1Y2V0RUYUlHYlpMeVBOSW02dFlzTi9TTXBR?=
 =?utf-8?B?eDl3WTY2clhpRWhVdEpXUzc1OEpsM3NXVUhUSjNIUzRkaHJ2RXdtU3lVOWRS?=
 =?utf-8?B?bm4wNmN1S21NOWFiejFiY2tLWkozWkRxRlpqUTR5ZkdMeHpQNjE4QlpoTVdP?=
 =?utf-8?B?SFJGOUMxQU5uaTBBMzFUYWY2RjkzWXNHTGsxRnhCNUFlUkRsRVN4VVZvd04r?=
 =?utf-8?B?VjRVUzRhak5wOEpFdzhOQzhyV3hXMHNPdkNCSUtVL1dya3liZzlabElDSGFz?=
 =?utf-8?B?U1NhZDUxeFFoekJrTzQ5QjJIR1hRNHMrRi91dFlKNVlhajFqdHFySm1ueXFC?=
 =?utf-8?B?aE4wdUdmL09YclEwbGx4VWJLcSs4VXZ1YmhRSDJ6N1MvSnBRemJBWDVESThZ?=
 =?utf-8?B?andaL2o2VXNJYThNQmVOTllGcXNHVHZub21iTDRTb3VkS0pNNk03c0xFSmFa?=
 =?utf-8?B?WnpObEdHZW0vaEtPaCtkZjV1UGJ6R21KWDZvNXZTQmZTOXZPY2hXb1dtQkdY?=
 =?utf-8?B?M2d4cUhZcXQxcjluRHVTMGZuQnJ1YWNCSnp6OWNmOHl3cVlIRWJ2bExTbDBs?=
 =?utf-8?B?Sy9VbklheDNMUVBGNTgyNG53S0ZDZGFsTXJpVjB5RmZWanREMlFWeGczQkRH?=
 =?utf-8?B?clN1bDI3WU1OeE9kTVdWdzl1bDNreVFWdmw0TDVjbE5LR1prMzd0ZnN3M3Jq?=
 =?utf-8?B?a1BHNUI4ZlpHdkI0ckFzN25ZczRVbFhTbnk1M0JNV2o5cHQ2OWYrcSsrdFVN?=
 =?utf-8?B?R2MycmNtdHR0Znhzc3lVZWhrUWVOYWt0OWVHeVIzSHUwTnYyUlVYbjUzUnhB?=
 =?utf-8?B?WHMzU2ZwT2tOOHliVlBlaHJFcU9vSGJMb0NsM1pnTlI4MnlqVGRNMHk5eVlj?=
 =?utf-8?B?VVJuTmZPNVVVTkRXQldjeURkaGpVeWZrazBOVVZNVXUrTEliUVVtdzhabDJV?=
 =?utf-8?B?b1F5dTFOd1BvYXlBTTNPVkxHWFJ3RmZMOXYrVnN2Zi9uSTBEcVgwV2tnNVFy?=
 =?utf-8?B?RGQ3QzZJYVpVdWRlbWsrSGk5YSt0RlZsd3lMbTVBTVhRdENxckZndHpMQ3lJ?=
 =?utf-8?B?OWhYUDhBd0dSMlhVcnlnUU15ZUhacDJpYzcwSm9Bc0RrMmMvZGNNaXRzQlBs?=
 =?utf-8?Q?AvOxwKqhbZxZKN4QgBdbmgA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 351b51f8-2956-45a2-3a7a-08dd72bbc49b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 14:28:14.5374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/0DfQdUDihLHZLAlHkSX3mFgjrfGnmfNZJjUe0H2R3wfkYeI3A5rA0vznNh9albprFwF1yLcvbsn4xC6wIF3O+4qk/6V8Klcin9INTryN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8177
X-Authority-Analysis: v=2.4 cv=HoF2G1TS c=1 sm=1 tr=0 ts=67ee9b03 cx=c_pps a=GDxOUaUasxmcDRSC7gC2IA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=t7CeM3EgAAAA:8 a=2bnCgyltrCbaZ1JmAWgA:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: qsjATyJQSIhCt8R7F-s6eC2G8mOc1_MM
X-Proofpoint-GUID: 1w_rPzD4o-gHZmNouDSC3EeIBNAUW1U5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_06,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504030067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 14:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214327


On 4/3/2025 6:13 PM, Sean Nyekjaer wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Thu, Jan 23, 2025 at 07:47:54AM +0100, Harish.Sadineni@windriver.com wrote:
>> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>>
>> YOCTO [#15061]
>> The rust target and linker are getting setting from the sdk environment and
>> so the config file is not needed. The redundant config file geneartion is removed.
>>
>> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> Hi Harish,
>
> Before this patch we installed the sdk, and could run "cargo build"
> and we got a binary for target.
> After this patch we getting a binary for the host (or nativesdk).
>
> We could run "cargo build --target armv7-oe-linux-gnueabihf" but I'm
> getting a linker error because of missing CARGO_TARGET_<triple>_LINKER.
> If I run "export CARGO_TARGET_ARMV7_OE_LINUX_GNUEABIHF_LINKER=target-rust-ccld"
> it all works as it should.
>
> IMHO it was nice to be able to run "cargo build" with target as default.
Ok, i will look into it.

Thanks,
Harish
>
> Br,
> /Sean
>
>> ---
>>   meta/recipes-devtools/rust/rust-cross-canadian.inc | 14 --------------
>>   1 file changed, 14 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
>> index 846dde4dc6..09e1b911a2 100644
>> --- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
>> +++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
>> @@ -65,20 +65,6 @@ do_install () {
>>
>>       chown -R root.root ${D}
>>
>> -    CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo.sh"
>> -    cat <<- EOF > "${CARGO_ENV_SETUP_SH}"
>> -     export CARGO_HOME="\$OECORE_TARGET_SYSROOT/home/cargo"
>> -     mkdir -p "\$CARGO_HOME"
>> -        # Init the default target once, it might be otherwise user modified.
>> -     if [ ! -f "\$CARGO_HOME/config" ]; then
>> -             touch "\$CARGO_HOME/config"
>> -             echo "[build]" >> "\$CARGO_HOME/config"
>> -             echo 'target = "'${RUST_TARGET_SYS}'"' >> "\$CARGO_HOME/config"
>> -             echo '# TARGET_SYS' >> "\$CARGO_HOME/config"
>> -             echo '[target.'${RUST_TARGET_SYS}']' >> "\$CARGO_HOME/config"
>> -             echo 'linker = "target-rust-ccld"' >> "\$CARGO_HOME/config"
>> -    fi
>> -     EOF
>>   }
>>
>>   FILES:${PN} += "${base_prefix}/environment-setup.d"
>> --
>> 2.43.0
>>
>>


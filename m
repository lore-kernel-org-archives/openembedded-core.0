Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66097C021B5
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 08:20:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.84955.1740385249296882829
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Feb 2025 00:20:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4150c0ec72=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51O5kMD3030998
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Feb 2025 08:20:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44y3t2j2e5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Feb 2025 08:20:48 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51O8CvHe017951
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Feb 2025 08:20:47 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2171.outbound.protection.outlook.com [104.47.73.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44y3t2j2e4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Feb 2025 08:20:47 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yQX9IWwbLRNMDCR48xqt1P1j6P6/u1ZSubODuT01qN8gAQ6b2Z3SoYdke+wHIh4So2+11TPA/eJ5QXqSJrIecr4exlqZY1HtqnxGT8zwmKHUez9sORhtZDf/DBzEdsR1rklMQAiCQSCC6IHACaZsCcir+9+EoOA7ydoYRt7DAJuwJm7le8cfOpd9QTr+1zxcbcKPre3mOkPl2heYl9Yp1g0MBZkwsEa/qkRjjyLA1s/GgNvn6FRCLGpI0FIE6XhBlIFqh5UadY4qOVJbCwZqqODLNHnnsEm3Ai+P87+yuVI47DHe1hygM1QpLFrzTPJtgxWs4srI+6ARhvMfbHSSWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUXU3ESi2uy9X12XGEaiDCYvQymtY+mVgMUTmCQyAhk=;
 b=vh6BViQ3Uz4GfKlGAE1EmtKHLm9OBEUTGegLxxzc+ISfYDLPbZ4au/kAAwKeS61M66O+yaLgw9TeWewAZYDDrYc0qkuH2xs5LdWgR42YpHfNYoCg25GOU4GEOdpN887MKwav/QrprqM0TvD3HYKoqVdsiQeIv+506yyJU9XPlm6WEZRrZaRa8DMNflUI3D0tk4bI5Za4j2j9Uvoj0B895HS3mA7l3F4PlozSNBje4o0CI9RjSxsPFOeOFO5llAIlfAhgY8VV+WDTC1IcLeACOPFQ5vXOO8lurf6VgSfBITTIYv905+iO+YBGcyXex1+oQry4fnU7UJe3AMEdSzSTrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SA3PR11MB7977.namprd11.prod.outlook.com (2603:10b6:806:2f3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 24 Feb
 2025 08:20:38 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%5]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 08:20:38 +0000
Content-Type: multipart/alternative;
 boundary="------------uxS58gRGSl49Oy9ky5f0hUI1"
Message-ID: <e11efa41-2e8c-40be-a551-f0670eda85c7@windriver.com>
Date: Mon, 24 Feb 2025 16:20:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] Revert "python3-ctypes: depend on ldconfig only
 if distro-feature set"
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
References: <20250220035724.1460062-1-changqing.li@windriver.com>
 <D7Y7576F5D4R.128DYAUZ74YXF@bootlin.com>
 <1826FD59DBA1FC0B.20721@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <1826FD59DBA1FC0B.20721@lists.openembedded.org>
X-ClientProxiedBy: TYAPR01CA0077.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::17) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SA3PR11MB7977:EE_
X-MS-Office365-Filtering-Correlation-Id: c00398b5-7e71-4eb1-a3c0-08dd54ac1ecf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|4022899009|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SGNwYy9jYmNyWW5ZVDEwN3VKb1JBN1lVbkR2S3pNb2JqalF2TzNRd0hSWjc2?=
 =?utf-8?B?b3lIM205eGVZdE5YK29ES2dGa2FQYklVZFBnN0lxditnN1U5ZG83RlF3eFda?=
 =?utf-8?B?bnN1WGVyZzIrNGhKMGIzT1VLM2I1WlBiWGI5ekNTaHZpaG5tdXM0VnU4dW1K?=
 =?utf-8?B?SWp0aDVmQVVLcUp0aUcvZzBRVDRjZFAvdmdtaWFOYzIzcWx2MHpNeCtiQW15?=
 =?utf-8?B?RHJ2MVlFbldkcmhmNlcwZkwyUGp6dUk2eDQxb1VWV1l6YWZKc2NpS0dsMEI2?=
 =?utf-8?B?Z05OVEpuaUlKWDRvcWIrdUd5ZXJOaktTRlozelJ1RFc0WFMvaERQM0ZCZ25a?=
 =?utf-8?B?UzI5MUVxeXg5YVc5T1JiMUF4SGtNdWk3ZzVWbzRLZHVOZlBMaFdKWjh3U1dG?=
 =?utf-8?B?d29zQ0prQk1jbllvOTFkYjIwalRTMUhnQUJ1VW1hTU9JVGdHNUpJS3BpUjFV?=
 =?utf-8?B?ZlhjbVV2YkNpZ2VLTkZjcFdYdFArRlZGWmxKMW5iWVFLRUxxMUR0QTBDa0tU?=
 =?utf-8?B?cE5VOUh0MHdrOGZLYVh5NnVPR0VTT1gwaGtDR2xkNU9aUjU4NEJZaWVIR0pX?=
 =?utf-8?B?U2gzVzJXVGNUenMrRnlKc1RNRS8rVFdJcFZ6eW5KckxHRDlIMWtQSXZiRjg2?=
 =?utf-8?B?MENBNU1HVDQ2OTB5S1NqajNjL3Z4VGFUc001SGdmaXVKdk1QS29VRm5JRldr?=
 =?utf-8?B?dktsT0lYdkJURzlDVUY4eHlzcFV3ZDhLcStaLzZHa0RIU2hDRDJvL1pqeDJo?=
 =?utf-8?B?MnZqVmZMV1RQRCs5SVA3YXRaUlg4bFp6RzV4ZGRyZy9pT2twZUZLVVBySUxR?=
 =?utf-8?B?RjhGVkNaZG5Mc0lBT0FjTTM1Sk5nK2VINFhUK3hLZzU1WjRwenA3SWhSdDF1?=
 =?utf-8?B?ZU9FZUhyU1UwaElzbjF0N1B5MWFtaGlNQzJiVWNOcThvR0I2UVFRMEQ0aHor?=
 =?utf-8?B?UDh6M3dqa0crVmhjdWM0VGVjVEJOakN4dEc3Qml4cmd2L285U2FuQjVtY0hY?=
 =?utf-8?B?UXhzTi9vZGRZdEpDOWYzaUxHK21kUFBsVEdMdGVMVmZFWVg1VkFLcWJ6S3hH?=
 =?utf-8?B?djJHcGdKN0k3Y1didTF1dWF4MEVtNW51VlZmbEpqNlZnVXdVQThiTjJUa3VF?=
 =?utf-8?B?RGVkekhHWXY4eTFpWjVWdmlIZVNmNjZYVStEQ2RVdU1SMDc4V1RRZjI4WllZ?=
 =?utf-8?B?SjhtT0JDd2dWU0dSaXBCOURPdzdsZ0JaUVNFUEtYZk1rcEE1MWN2MlVMbjZh?=
 =?utf-8?B?VFVFVkVJVlh4RUFXMW91SDVBNXVSZEpkMUgrTnorcDgzajF1VHBmNjljVWR1?=
 =?utf-8?B?RzNHQzFuZTFaOVFQNlhGRlZpS1lLLzV6elB5R2JaVHY3ODZ6Yk8yT3VCWHUx?=
 =?utf-8?B?K2ZrR1QySTE3T2lRQ2NCVThiTzRlL1FzbFJtMERFYnYxQTc2QVNYRzYvcjFR?=
 =?utf-8?B?bUYrekZaUndyTVowVnovUTNGMXM1MVNQTER0TFlobXB0VGFoSitUQ0d4Zm9j?=
 =?utf-8?B?STV2OXhMSzc1VU5qRW9pSlg5alR5cE9weEZaV1RkNDBWc09QZTRma0xZaE1Z?=
 =?utf-8?B?VEt0S293KzF4MzRiWnM2RGRVQ01XS0JsQUtEZWtId2g3MjVZNjFJVHd1RHJG?=
 =?utf-8?B?ZWZXVmJqWWhVOGNqR2V4eU5jWlJ2YlJkeDB2SlBwWVVBUkFYUy9IT2RHd1pZ?=
 =?utf-8?B?Ryt0NjRGYUhORVF6dStKd3RhQVNNLytzSFJIcFJ1TzY2RWhlRDdSQXc1QUl1?=
 =?utf-8?Q?hyr5H7bSsNtuTdYidAI62gjO8SFRwQAzw/NeMlv?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4022899009)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ODJyZTZ1L0JUNHY4SGo4YnhybitZdTlaWVhRMS9IYzFoSEZxV2g3UUlocGZP?=
 =?utf-8?B?cnd1aUtGTnhYTmJad052NnJKSktLOXlmbTd4akRuYlRHVkJsQWRqelRNMzZX?=
 =?utf-8?B?Q0NXS2RMWFJTaDZRQk9scms4TkM2eFNCWlZWMS9rdzRTVTFxZUl2S2JuaEwr?=
 =?utf-8?B?bnBVWTJrb1JaRWEvRGlkNkkyVE9mSW1scGVRajFrRDBlWnI3c2hXaWhvK1Fx?=
 =?utf-8?B?UHMvYnhiTmdHTUxRVnR1VURBZFAvSVdjNC9ldjlPeElER2x0eHlMSXlzMUhH?=
 =?utf-8?B?T1NUZjV6enhyMnNXeUpVbmZROWZlZkU4S0RBQVg1TThqamJZZ2tNSGlIaXVL?=
 =?utf-8?B?bTEyU01yejJCZTVxRWJlQTZiYUVZQVdaellXL05RSDhtVk5OK1pGbTFuSzJa?=
 =?utf-8?B?VVNOOHFlZWlzaWVNeU9IdnppbmU3ZVZwaDUvYktPeWdJNHUvN1ZLUmdMSzRN?=
 =?utf-8?B?bGJYbXFUbkVpSlVtRmxFUGpSRTFCNVZPZHBNaHVjaURuNTZkRFRIMkQ2OER6?=
 =?utf-8?B?aDhUOVpZY0ZDNmZUWUI0NEVqNUZYZUJ5NmROSmtLQS9FekxxTG9RTGlUSXo2?=
 =?utf-8?B?bWtXZU1wNzh0R2lLbjlaeTJiWHhkTHRrZlFnUmtEZ0dINGQ2SDcyRVhBK2U1?=
 =?utf-8?B?c0JJa2ZSMVB0N3ZqWm9tTUNhZVpXV1lTWk5BTGFISEFOalB3RlpVK2VMWUJp?=
 =?utf-8?B?L3o4QVpiaFVKU2wzWklWRW53NHphYzlGdUtNT01tZ29mUzZCeU0ySzdwTm9K?=
 =?utf-8?B?M3ZmU3dEQTF1azNJTUdzVHUwQ2VVZCtUd2pVL05TdUdCM01IOVhzSVBSQVhq?=
 =?utf-8?B?MGVQSGFMZVdnUnFhY1Vxc0dQR3ZQeW5MSUpDTEk5UGRtRFgzYStWbm13cmhs?=
 =?utf-8?B?Q1pGRlFUQmI0WWZ0azVwaXhta0s1a2JIZnVjZk82NUtzTUxRdWVTU21va09F?=
 =?utf-8?B?K3B3dVhJV0lPVVJGNUNvbWVxNk14eEdsejh0MG5GZEZHQmxFNXpvNG9UeWdT?=
 =?utf-8?B?UHRMRC9pRjN0Nmc0alhtV08wajhHazVSQitZdTA2NEpBVVg1ZUtyazgxWVpt?=
 =?utf-8?B?d1dJR0xnakJoRGRlM2tBS25zQmVMTFREUnE5Vll3YlgybjRtc1JvODcyNlhv?=
 =?utf-8?B?bEphVEw5ZWFHUzB4VkFBWU9FN2ZWa1h5V2E2eFZ2RmNoZ0ppaWRQNjFYVWFu?=
 =?utf-8?B?b3VIano5Yzd1ZnJ1R3FaMjBObFlhVElKTFJhb1RPY2pFejQ2aUxFdFVHYUtn?=
 =?utf-8?B?SnlJVTB6Wnc2THBmeGlWTzR1UGJYK00rOXFHNitSQ0twL3hBbzJmT3JJbEZl?=
 =?utf-8?B?LzJha0ZUbFlSOWdjZkUwSllnUUozRGN1Q25kc0lVT2RpQzUzUU1LTGhxK3BB?=
 =?utf-8?B?MHVDL3RwYThwc0EzRzlNU3FXcmpQTGREMXNqUDhlOU5iYUpoZEdiWngxOVRp?=
 =?utf-8?B?Zk9uRmJ6ZHhqc29kSGxwNlJSMWRZT3ZJUFdPQnJDZmF1L2xjczhsUEJQK3Bs?=
 =?utf-8?B?WnlzL3dLMkVkUkRmSitXTmRTRlNlelFKVllPY0RpVVBtc0xFaEdvVThkVUl6?=
 =?utf-8?B?MktFaUd0OFpHMjFwSjdNeUkvN1hGV1NwQk5TOFQyZ1BqWXZNc1Y3dzBuT3I5?=
 =?utf-8?B?bEs5bnJ2L21KTzhKZFNkWGIzNEU0TWxSRkh3bnpZbGs5bldYcnVLTldtdUhS?=
 =?utf-8?B?UFRKazlCc2N4SmV5dDIxOHJMNmJRUzh2SGR5enA3RHVpOXlTVldjcVpQbVph?=
 =?utf-8?B?YXVFV3hxVm1GRUMyUDl2Tk9BOS9yN0NNeXo5SmZYWCs2Y1NDNnRLM3kreENI?=
 =?utf-8?B?YU9OamZSRkhTVUpMdE16N1FvSlFBM3pra0dNY1MrcE9kdHYxMFVWb0o1S09E?=
 =?utf-8?B?V1BXdnIvZnR0QW1LVU5OWlJFNTF0VGNHRUwvQzd1WVVQZkI0YkdGUEhSNTR3?=
 =?utf-8?B?Nitsd3Z0U3pvV0lnWjNMME91TnBOOTUzR0NwZS9qa2FzZGlFeVJUdVQwaXJI?=
 =?utf-8?B?MkFCUTZwZ1NFbkM3dEdJUFZpa0VoWndEcjBJMTBJRnpQYkw1bkh4YmxYUDlr?=
 =?utf-8?B?TjZHYkF5SkJVMHhxdnhaOVN0cU5vTDc2dDhkZDV3aStMQW9iQWFpSlgvTGpG?=
 =?utf-8?B?dGRSekhveHpLUmxCSUxSdDhZcXltWFZnNDg1YzJhZXBKa3l1RlRGVGtaNzlD?=
 =?utf-8?B?L3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c00398b5-7e71-4eb1-a3c0-08dd54ac1ecf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 08:20:38.5700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /1PWrPHUoXzFLk58ewic++yOW9xHBjbEX4FyJfDJ+QsDvsHe/k6Yqf1kD+Blr1sKrgztu1ALrYYGSPeUaZaIOyTdWbSQ59wzraD1vp5nPxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7977
X-Authority-Analysis: v=2.4 cv=eoIlzppX c=1 sm=1 tr=0 ts=67bc2be0 cx=c_pps a=n5+7iF7l5R/EKaY7dbRUPA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8
 a=iGHA9ds3AAAA:8 a=1NWNoF9oAAAA:8 a=P-IC7800AAAA:8 a=t7CeM3EgAAAA:8 a=z8vU8Gr3U-nLPclttLsA:9 a=QEXdDO2ut3YA:10 a=52mdeZd8sWgJSgSe30wA:9 a=WZgyLd53R_YNtev1:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=97APRTa-CG6DvPMFVxHL:22 a=d3PnA9EDa4IxuAV0gXij:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: z9MEnY1N3vs7X8PL47m2d0paeb1XEA7i
X-Proofpoint-ORIG-GUID: PUotL8uVjFHYSNFCQBLt1HiAv3FS5M9Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_03,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502240060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Feb 2025 08:20:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211841

--------------uxS58gRGSl49Oy9ky5f0hUI1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2/24/25 08:27, Changqing Li via lists.openembedded.org wrote:
>
>
> On 2/21/25 22:34, Mathieu Dubois-Briand wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>>
>> On Thu Feb 20, 2025 at 4:57 AM CET, Changqing Li via lists.openembedded.org wrote:
>>> From: Changqing Li<changqing.li@windriver.com>
>>>
>>> In oe-core, function ldconfig_postinst_fragment use exist of
>>> /sbin/ldconfig to decide if ldconfig is runned to generate the cache,
>>> and function _run_ldconfig will run ldconfig to generate cache during
>>> generate rootfs.  ldconfig.service is actually not used since we have
>>> generate ld.so.cache during do_rootfs, refer[1][2][3]. ldconfig
>>> dependency is necessary when ldconfig not in DISTRO_FEATURES.
>>>
>>> The reverted commit causes regression when ldconfig not in
>>> DISTRO_FEATURES, before, without ldconfig in DISTRO_FEATURES,
>>> ctypes.util.find_library(name) can find the lib if it is installed, now,
>>> since ldconfig is not installed, ctypes.util.find_library(name) cannot
>>> find the lib even if it is installed.
>>>
>>> Here is one usecase(gtk+3 lib is installed, ctypes.util.find_library
>>> used to find the lib):
>>> import wx.lib.wxcairo as wxcairo
>>> File "/usr/lib/python3.13/site-packages/wx/lib/wxcairo/{}init{}.py", line 59, in <module>
>>>    from .wx_cairocffi import _ContextFromDC, _FontFaceFromFont
>>> File "/usr/lib/python3.13/site-packages/wx/lib/wxcairo/wx_cairocffi.py", line 189, in <module>
>>>    gdkLib = _findGDKLib()
>>> File "/usr/lib/python3.13/site-packages/wx/lib/wxcairo/wx_cairocffi.py", line 181, in _findGDKLib
>>>    return _findHelper([libname], 'gdk',
>>>                       "Unable to find the GDK shared library")
>>> File "/usr/lib/python3.13/site-packages/wx/lib/wxcairo/wx_cairocffi.py", line 170, in _findHelper
>>>    raise RuntimeError(msg)
>>> RuntimeError: Unable to find the GDK shared library
>>>
>>> [1]https://git.openembedded.org/openembedded-core/tree/meta/classes-global/package.bbclass#n394
>>> [2]https://git.openembedded.org/openembedded-core/tree/meta/lib/oe/rootfs.py#n316
>>> [3]https://github.com/systemd/systemd-stable/blob/v255-stable/units/ldconfig.service
>>>
>>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>>> ---
>> Hi,
>>
>> Thanks for your patch. However, I believe this is introducing some
>> regression: I've got some ptest failures on the autobuilder:
>>
>> AssertionError:
>> Failed ptests:
>> {'python3': ['test_timerfd_TFD_TIMER_ABSTIME', 'python3']}
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/992
>>
>> You can get some more advanced about ptest failures in there:
>>
>> https://valkyrie.yocto.io/pub/non-release/20250221-33/testresults/qemux86-64-ptest/core-image-ptest-python3/
>>
>> Can you have a look at this issue please?
>
> Sure. I will check this.
>
> Regards
>
> Changqing
>
Hi, Mathieu

I cannot reproduce this ptest failure on my host. No failure of 
test_timerfd_TFD_TIMER_ABSTIME in log.do_testimage. and the result is:

RESULTS - parselogs.ParseLogsTest.test_get_context: PASSED (0.00s) 
RESULTS - parselogs.ParseLogsTest.test_parselogs: PASSED (2.71s) RESULTS 
- ping.PingTest.test_ping: PASSED (0.02s) RESULTS - 
ssh.SSHTest.test_ssh: PASSED (0.56s) RESULTS - 
ptest.PtestRunnerTest.test_ptestrunner_expectsuccess: SKIPPED (0.00s) 
RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectfail: 
EXPECTEDFAIL (4455.53s) SUMMARY: core-image-ptest-python3 () - Ran 6 
tests in 4458.839s core-image-ptest-python3 - OK - All required tests 
passed (successes=4, skipped=1, failures=0, errors=0) DEBUG: Python 
function do_testimage finished

And I checked 
https://valkyrie.yocto.io/pub/non-release/20250221-33/testresults/qemux86-64-ptest/core-image-ptest-python3/, 


there is no AssertionError in log.do_testimage.2624139.20250221054435 
<https://valkyrie.yocto.io/pub/non-release/20250221-33/testresults/qemux86-64-ptest/core-image-ptest-python3/log.do_testimage.2624139.20250221054435>.

So I checked test_timerfd_TFD_TIMER_ABSTIME, refer [1]. Seems like this 
is not related to my changes.

My commit changes RDEPENDS for package pthon3-ctype, and this is 
actually no influence for poky, since poky enable distro_feature 
ldconfig by default.

There are some similar timerfd issue in upstream python, I guess maybe 
this is an intermittent failure of python13

[1] https://github.com/python/cpython/blob/main/Lib/test/test_os.py#L4402

[2] https://github.com/python/cpython/issues/126112

Regards
Changqing

>> --
>> Mathieu Dubois-Briand, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211834):https://lists.openembedded.org/g/openembedded-core/message/211834
> Mute This Topic:https://lists.openembedded.org/mt/111283758/3616873
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [changqing.li@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------uxS58gRGSl49Oy9ky5f0hUI1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/24/25 08:27, Changqing Li via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:1826FD59DBA1FC0B.20721@lists.openembedded.org">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 2/21/25 22:34, Mathieu
        Dubois-Briand wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:D7Y7576F5D4R.128DYAUZ74YXF@bootlin.com">
        <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Thu Feb 20, 2025 at 4:57 AM CET, Changqing Li via lists.openembedded.org wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com" moz-do-not-send="true">&lt;changqing.li@windriver.com&gt;</a>

In oe-core, function ldconfig_postinst_fragment use exist of
/sbin/ldconfig to decide if ldconfig is runned to generate the cache,
and function _run_ldconfig will run ldconfig to generate cache during
generate rootfs.  ldconfig.service is actually not used since we have
generate ld.so.cache during do_rootfs, refer[1][2][3]. ldconfig
dependency is necessary when ldconfig not in DISTRO_FEATURES.

The reverted commit causes regression when ldconfig not in
DISTRO_FEATURES, before, without ldconfig in DISTRO_FEATURES,
ctypes.util.find_library(name) can find the lib if it is installed, now,
since ldconfig is not installed, ctypes.util.find_library(name) cannot
find the lib even if it is installed.

Here is one usecase(gtk+3 lib is installed, ctypes.util.find_library
used to find the lib):
import wx.lib.wxcairo as wxcairo
File &quot;/usr/lib/python3.13/site-packages/wx/lib/wxcairo/{}init{}.py&quot;, line 59, in &lt;module&gt;
  from .wx_cairocffi import _ContextFromDC, _FontFaceFromFont
File &quot;/usr/lib/python3.13/site-packages/wx/lib/wxcairo/wx_cairocffi.py&quot;, line 189, in &lt;module&gt;
  gdkLib = _findGDKLib()
File &quot;/usr/lib/python3.13/site-packages/wx/lib/wxcairo/wx_cairocffi.py&quot;, line 181, in _findGDKLib
  return _findHelper([libname], 'gdk',
                     &quot;Unable to find the GDK shared library&quot;)
File &quot;/usr/lib/python3.13/site-packages/wx/lib/wxcairo/wx_cairocffi.py&quot;, line 170, in _findHelper
  raise RuntimeError(msg)
RuntimeError: Unable to find the GDK shared library

[1] <a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/tree/meta/classes-global/package.bbclass#n394" moz-do-not-send="true">https://git.openembedded.org/openembedded-core/tree/meta/classes-global/package.bbclass#n394</a>
[2] <a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/tree/meta/lib/oe/rootfs.py#n316" moz-do-not-send="true">https://git.openembedded.org/openembedded-core/tree/meta/lib/oe/rootfs.py#n316</a>
[3] <a class="moz-txt-link-freetext" href="https://github.com/systemd/systemd-stable/blob/v255-stable/units/ldconfig.service" moz-do-not-send="true">https://github.com/systemd/systemd-stable/blob/v255-stable/units/ldconfig.service</a>

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com" moz-do-not-send="true">&lt;changqing.li@windriver.com&gt;</a>
---
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">Hi,

Thanks for your patch. However, I believe this is introducing some
regression: I've got some ptest failures on the autobuilder:

AssertionError:
Failed ptests:
{'python3': ['test_timerfd_TFD_TIMER_ABSTIME', 'python3']}

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/992" moz-do-not-send="true">https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/992</a>

You can get some more advanced about ptest failures in there:

<a class="moz-txt-link-freetext" href="https://valkyrie.yocto.io/pub/non-release/20250221-33/testresults/qemux86-64-ptest/core-image-ptest-python3/" moz-do-not-send="true">https://valkyrie.yocto.io/pub/non-release/20250221-33/testresults/qemux86-64-ptest/core-image-ptest-python3/</a>

Can you have a look at this issue please?</pre>
      </blockquote>
      <p>Sure. I will check this.</p>
      <p>Regards<br>
      </p>
      <p>Changqing<br>
      </p>
    </blockquote>
    <p>Hi, <span style="white-space: pre-wrap">Mathieu</span></p>
    <p><span style="white-space: pre-wrap">I cannot reproduce this ptest failure on my host.  No failure of </span><span style="white-space: pre-wrap">test_timerfd_TFD_TIMER_ABSTIME  in log.do_testimage. and the result is:</span></p>
    <p><span style="white-space: pre-wrap">RESULTS - parselogs.ParseLogsTest.test_get_context: PASSED (0.00s)
RESULTS - parselogs.ParseLogsTest.test_parselogs: PASSED (2.71s)
RESULTS - ping.PingTest.test_ping: PASSED (0.02s)
RESULTS - ssh.SSHTest.test_ssh: PASSED (0.56s)
RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectsuccess: SKIPPED (0.00s)
RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectfail: EXPECTEDFAIL (4455.53s)
SUMMARY:
core-image-ptest-python3 () - Ran 6 tests in 4458.839s
core-image-ptest-python3 - OK - All required tests passed (successes=4, skipped=1, failures=0, errors=0)
DEBUG: Python function do_testimage finished</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">And I checked   </span><a class="moz-txt-link-freetext" href="https://valkyrie.yocto.io/pub/non-release/20250221-33/testresults/qemux86-64-ptest/core-image-ptest-python3/" style="white-space: pre-wrap;">https://valkyrie.yocto.io/pub/non-release/20250221-33/testresults/qemux86-64-ptest/core-image-ptest-python3/</a><span style="white-space: pre-wrap">, </span></p>
    <p><span style="white-space: pre-wrap">there is no </span><span style="white-space: pre-wrap">AssertionError in </span><a href="https://valkyrie.yocto.io/pub/non-release/20250221-33/testresults/qemux86-64-ptest/core-image-ptest-python3/log.do_testimage.2624139.20250221054435" style="white-space: pre-wrap;">log.do_testimage.2624139.20250221054435</a>.</p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">So I checked </span><span style="white-space: pre-wrap">test_timerfd_TFD_TIMER_ABSTIME, </span><span style="white-space: pre-wrap">refer [1]. </span><span style="white-space: pre-wrap"> Seems like this is not related to my changes. </span></p>
    <p><span style="white-space: pre-wrap">My commit changes RDEPENDS for package pthon3-ctype,  and this is actually no influence for poky, since poky enable distro_feature ldconfig by default. </span></p>
    <p><span style="white-space: pre-wrap">There are some similar timerfd issue in upstream python, I guess maybe this is an intermittent failure of python13</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap"></span><span style="white-space: pre-wrap">[1] <a class="moz-txt-link-freetext" href="https://github.com/python/cpython/blob/main/Lib/test/test_os.py#L4402">https://github.com/python/cpython/blob/main/Lib/test/test_os.py#L4402</a></span></p>
    <p><span style="white-space: pre-wrap">[2] </span><span style="white-space: pre-wrap"><a class="moz-txt-link-freetext" href="https://github.com/python/cpython/issues/126112">https://github.com/python/cpython/issues/126112</a></span></p>
    <pre class="moz-quote-pre" wrap="">
Regards
Changqing
</pre>
    <p><span style="white-space: pre-wrap">
</span></p>
    <blockquote type="cite" cite="mid:1826FD59DBA1FC0B.20721@lists.openembedded.org">
      <p> </p>
      <blockquote type="cite" cite="mid:D7Y7576F5D4R.128DYAUZ74YXF@bootlin.com">
        <pre class="moz-quote-pre" wrap="">--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
<a class="moz-txt-link-freetext" href="https://bootlin.com" moz-do-not-send="true">https://bootlin.com</a>

</pre>
      </blockquote>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#211834): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/211834">https://lists.openembedded.org/g/openembedded-core/message/211834</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/111283758/3616873">https://lists.openembedded.org/mt/111283758/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@windriver.com">changqing.li@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------uxS58gRGSl49Oy9ky5f0hUI1--


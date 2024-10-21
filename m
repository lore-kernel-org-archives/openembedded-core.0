Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA37D3C92F
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 03:10:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.37846.1729480221302776826
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Oct 2024 20:10:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=00243e7021=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49L34Zio004868
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Oct 2024 20:10:21 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42c823scme-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Oct 2024 20:10:20 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49L3AKwt012950
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Oct 2024 20:10:20 -0700
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2047.outbound.protection.outlook.com [104.47.57.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42c823scmc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Oct 2024 20:10:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wsr1DJP/Gd2CreCDvzVgNA0NAIFMCYHeBEnv8gtf52JWqpfcGGhSmNbJpM/w6zWf+SNECM3r1WfJP4TDWlI+0KSHBbAoB3nwgQiKG0MwjvJZgqUV8SBecAws68kdGSKSzIJOHiYx4kyx8fUpj4pY+0BNWE5Hy5XJ30B6orax2Jp47DyeUd7KcNTbNnIcIv52jSpU0QmSdkF+dljgAAGGZ1vQR02fbF86VADPWQJzECBwA9E1DQEbQ8hvfRZSx51TyIuKGtAbGjHLlAextRwm4IcKlNSufukUBm3PzH2d9EVT8qIGDDvMd9SuRgyr7RtdO6SCH4pYU8k4V0KGHv2iew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=COImYF2++HhiACCrr5iv4Mk29UJKr2t79+lwCpgoV7g=;
 b=CZ9vWkac1WZhf/29hgofI6sn67AuPF5Rh2OodVvYmCyndSTFVafo9kGNbgQxMuSq2WDgb5WcHKYfAm03zIUIOo9TqcqKFiUG6Le/0I7juk49oVmNimUodJyaHRP6VQ89hm5/7MMhh2MIBWWtUQC+6oeBlqbVoq34PwyCSZrL06N9pAI4OR7AUj10KmTIWja8e8zsADfkKHAdEPkNj+xo0md4LegWqCKLc5zDGkXGi6gVgGBnS7oF4o9Hn4yM+fGWUcqxjyNdg7IoWy0o4X4z9wQRYN+h/ol7COsPnZhP0YcoaJzP8xV+i5BrRjwh6odxqYyyob5QZBSE7NyaX/45Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5533.namprd11.prod.outlook.com (2603:10b6:5:38a::7) by
 CH3PR11MB8383.namprd11.prod.outlook.com (2603:10b6:610:171::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.18; Mon, 21 Oct 2024 03:10:15 +0000
Received: from DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd]) by DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd%6]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 03:10:15 +0000
Message-ID: <2081c6c5-42c0-4a7f-8926-8ed054adf772@windriver.com>
Date: Mon, 21 Oct 2024 11:10:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-core][PATCH] tzdata&tzcode-native: upgrade 2024a -> 2024b
To: openembedded-core@lists.openembedded.org,
        mathieu.dubois-briand@bootlin.com
References: <20241016084538.3146229-1-jinfeng.wang.cn@windriver.com>
 <ZxESzm1S7pE5c1Xp@bootlin-mathieu>
Content-Language: en-US
From: "Wang, Jinfeng (CN)" <jinfeng.wang.cn@windriver.com>
In-Reply-To: <ZxESzm1S7pE5c1Xp@bootlin-mathieu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYAPR01CA0106.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::22) To DM4PR11MB5533.namprd11.prod.outlook.com
 (2603:10b6:5:38a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5533:EE_|CH3PR11MB8383:EE_
X-MS-Office365-Filtering-Correlation-Id: 66e3be7a-5e36-42a9-d1d0-08dcf17de24d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V2twM2JhTXpPR1NoZGJnYm4wTDBmZGg4VDlZNVRlUTJ3QmNsK2pWa2hYSWlS?=
 =?utf-8?B?SkllM3NlK1kxYUIvcVVNdTlUeXJrQjJDRWJFRVNFWVJzOU9tRHFoOHVjaDdr?=
 =?utf-8?B?eDhERmN3MzhiTkFvYTRDMkR6OENUcGJIR25aSHl6RWdxb3RMdkdpdjEwaTZ5?=
 =?utf-8?B?QU5qV3F4VnRuSWNUTnpGOHVrTzFQRWppa1Y2SS9YWFF2ZG81UFN2VnZlWXZP?=
 =?utf-8?B?Sy9sUXFpZUgvTlNiUW55MzQ5TWpCc1A0c2RaU0RGVkM3akhKa00wRHBKZy9u?=
 =?utf-8?B?OU8xSURRaEZCU1ovblp5TlI2V200QkJSeXBHZVZJa2VBZVo5Z2tQRW1vby9H?=
 =?utf-8?B?RUpweVhsUEZxTUFYZ2Mya2hLQjhsSzhzK2VvZ0hvQzFyOWZzaTdycXM1djR4?=
 =?utf-8?B?Z0ZaNXNkTDBFVEc0cWR2SC9DQ2hyMUdweVNaWjFBbGp2ZThwbER5bk5meTBL?=
 =?utf-8?B?RFZYV05BMFFjanQzajJ0TGRJUnFCREEvUjREMDM0c1NYUjRSWHlFazR3UTg5?=
 =?utf-8?B?VFpwNWhPRlNkMkZPRHRha1dOcFRldmU0OVpDNVRGSXJYUXJkTElwd01FVVp3?=
 =?utf-8?B?MER3VFBvQWNqSGFCSUZRdDZsK3ZMRXkxbnlCaTlDaHBOMExoZk1RUTl3a09l?=
 =?utf-8?B?MVo2NW5YTnY2dm9aQ0UybE9UYkE3NlBEaGFsNEtSeWU2b1hoWDZUb2dvTEhh?=
 =?utf-8?B?NzRmVnkrM0FxNi9jcE00TE42ZlFjZWs3WVJGL3hrU0pJNUFSazIyYWxSME11?=
 =?utf-8?B?UXlXWXd3cHJhaC80SFNHOGNueXRTWSt5d0dIYWd3N3kwaEc5UXNjR2s1Qy9u?=
 =?utf-8?B?bGV4VUtGeEY0aFNoNDlhZ3kyYXg0MWE3N1FQb3R3aEJwRGNab0Q5b1pQMVZj?=
 =?utf-8?B?Q25qTUxNYjhuMWRYbks5M3pZK2R4QlNFNmxGalhPcUs3cjBvcVNrU3pZMkZB?=
 =?utf-8?B?QlV5L1JQcWt0eVZSOEtEa3QxbzZGV3dCZE9nSlZKK29Ud0pocGV6ZG9QQmIw?=
 =?utf-8?B?alFXWUFPSXEyYnUrZlpOUktOeDlDc1diTlRwcnR0WkRFc3k4K1JIMW9KNUdL?=
 =?utf-8?B?ZlRnZmZSRzAvL2JjbHRZZDFFZzNyNkFEQ25Ld0xUdWx0Z1lGV2p5ZXArQ3JK?=
 =?utf-8?B?S2ZuN0Y4SDdrd213U0ZwNnB1ZDJ0UUxvRzBWNlJMK0JUZWF3c1pOVksxVWVB?=
 =?utf-8?B?ZGx5R1dkeFpHUzFJVjVLVFBxOWM4OVZBUWRBMzg5NDRFN1FmYy8wc3RKaFRP?=
 =?utf-8?B?UUprMFN4RE9lVFR0bE8xTWprNTlOMmdSZ1JZOVdXRDRVTk1NaUlXQ2FlZmt1?=
 =?utf-8?B?T21zYkp4MVhySWxoeFBhdittQnlGcUh1MHFVZStCR29sd213SWdJY2MwZzBo?=
 =?utf-8?B?bEFxamsyaFZRRUNrWkFuRExJU1lkMXFKZjVlazhOU2VTUm1YWXFiN3NvQnZQ?=
 =?utf-8?B?a09pNnBGRzZDS3dxUWtOUEdFOWtWc0VvKzh1M3JGMS9lY1dWUUNSaEIrMUJR?=
 =?utf-8?B?NkphSUJOcTRXcnhmcEwvQ01zZGl0MmplQXJTbkptZ2dxQnE5VUZ4YUI1eHdM?=
 =?utf-8?B?RllYUHV3RjZaNlFTS0lyaVArazJzMXdySzVJVldGTDZ1SFZtRUJXaE42cTJJ?=
 =?utf-8?B?SjVEc1YySlFWR24vVEhuaW1jNXdXUDRJSXlnT1phZU1LeUxuUHcxQjR6NUdZ?=
 =?utf-8?Q?52JbzQAqKx2tfLqQzdFe?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5533.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d2h4YTlnSk5oWkRYV2k0VHVTSFpJN2VYY1laeWpqVlhvYmR3cjhVTEVPeWFJ?=
 =?utf-8?B?SHhtZGZkWEEyK29RMzRoOURmaEpaK2J2S1I3Uk5hb3dRU284MjNZTlJoenpW?=
 =?utf-8?B?eTFVT1dCQ0hvcDhLZy85aWYzcEZRaStNVEluOXRGZ3dRai8yd1l1Ti9oM3Rw?=
 =?utf-8?B?N3o2STFIbjl2L2J5UThkbThnQTJ2anR6QmIvZ2dST2tlSmwxMlNPTjd1Rllq?=
 =?utf-8?B?S1pxWnJRaGVnNitOekpKZ2hGVWpieVU5cTVkYnptOVIzeEVBZWI4TGlUOFYr?=
 =?utf-8?B?NlQ0aXNFbEM2RkNFSzFmanYvYURiY0JESjhWMGdnSXMxcmhITlpCdmpBYnZ5?=
 =?utf-8?B?MUZJMzhVeXZnSnN4SENqZmJiUktRSHZhdzhXU1B3YTZGdHVtRXNJV0piNFUx?=
 =?utf-8?B?VzNSUktoUC9UaXkra3BRdVUzNnBqOGx6ZlRMYTJFYlVUNDdFV1JJQnQ4WW84?=
 =?utf-8?B?dnB1T0VkRXVXcHViOURYdkphZkZuN2cxNVpsZTVCOFZ0aVFPWTdkZ3J0K1lh?=
 =?utf-8?B?QmQ5YWY3dmRVNGIwWGd2ei96QVRMOUNEdFlYZ0wzMjJ4R25DWU12MDBtWW5Y?=
 =?utf-8?B?TXoyWU9FT0x4dGo1RE4rMmtJNGF6V0luWDVySFZiRS9oS0RpTnY5YWNKUFA0?=
 =?utf-8?B?Qmh3c3Bzd1dpd1N6dDNkVE9SUll0TEM4OGU2VmRQZndITGdEYmtISHVob3ls?=
 =?utf-8?B?a2NlakJQak1yTTVBYlkzTXI5YnZTS0Evb2R5UjJickpkTkZ3RVRncyszOXFk?=
 =?utf-8?B?RXpNNWxSM3JBQ1FBbXBLZFliZGk5MkltMHh6N3pSa3Z6MThvVTc3OFlYMmVt?=
 =?utf-8?B?VUVMUXoxS2NRLzVjMW1ObXppb0dxQ0E0eWs1N2xaOXlTbXhYdVM2UWY3dHNE?=
 =?utf-8?B?aURiYXZIejdKbHBKVjR4aGVLUnM5VitqOXpmbDVtSUhXVFpZbGR3MjJPa2lG?=
 =?utf-8?B?UzdMR2hyQ1FDWVNueG5WRmV4c21UWlVNK2JaMnpSTC8yS3cwRXE1US9vakNy?=
 =?utf-8?B?VzJYdGVObnBUVjZLU2pXYVlVUjJhMXBWRVRZZm5MMDU4aHVJMHZTeTdMR1lU?=
 =?utf-8?B?czRZVHlpWHlkZzN0NkU2R25xMUdrWXRhYkY1c0VpeDNyVlA2VTB1SzZKelFm?=
 =?utf-8?B?L0ZCazVaMzk3WnZCSXJWOXNWRGhqb1JiRjN4YlF3bDhOcnJnS0R6b1JqMEhn?=
 =?utf-8?B?Y0pEN0FaNU15d3d6M1ZuOG4zazBzQTRkUkRMZG1ibGRIOEEwa0E1OFQ3ZzZk?=
 =?utf-8?B?Z1FWQUp5ZFJtbXMyWUZBSGpIeGthcjJRUG8wcWpEa1ppdEtHNlV4aDAwOEwr?=
 =?utf-8?B?NXcwU2FibDNmY3RYTE5OQm1SeWRIVHo0YXhSWk5rTjUxbjBuN2RCTEFIWUFr?=
 =?utf-8?B?OWpLd25YVy80dWsrRm5BOU1nRjlvT1ZvNGtzbHNwUHVoaGFURC9Lam96MUdF?=
 =?utf-8?B?MzBqbWU4TFZyWlpCejB2djF1NHpxVHo3V1o2VWtCOGNRM2tUd2FRemdIL2Mr?=
 =?utf-8?B?Rk5VRG5zSlVEcmEreC96SGRpWENtRldIbi90aG9HN1liWWdJVHZmT3IzVzBo?=
 =?utf-8?B?bVMxZTNVMXhpZE80TmdRemowV3RMMmpoRDRQL2o2eTdOSkEveDJjWlZFTzhn?=
 =?utf-8?B?bzl6UlM3a3RsQTFXZEU2dnNWSmw3WXJlSUdJSWx0RmZQSWo3Qy9LREpsM2J2?=
 =?utf-8?B?dWZ3UGlqcWowRkJ4UUFjSVlJVkZVTVFyaEp0KzJHRmRDWjhTWnVjOXMrSXNo?=
 =?utf-8?B?SFdGYWd1aXdocEQ2SUFreFd6N1R5U1hBc0kvWEo4RUJtRzdVYUhqMGpTU0V3?=
 =?utf-8?B?dkxrY1poZjc2N09wQTMyV3NjZFptZ1lvaWhZSit1SmtaOEZKVkxCNmNLNUx6?=
 =?utf-8?B?NkRvZkNhVVJ1dlJpVkkvUlJxK2duY2lRNElIMVZPYjQxV0ZBeUs0RTVPd3FZ?=
 =?utf-8?B?Q0hVNnExL1M2em1URU1kb3diNmRnWnpUUjdHR2wzVTRrL2hTcHVRY3crZnhT?=
 =?utf-8?B?RjZITEtTdDhNdGgvazZSVTJwVGhsdy9aSUxwSWUyNmc3Q1FLSENiY05TZVlh?=
 =?utf-8?B?ZlhWL0lja1FPYkNoWWJPc3JPakxrbVVKS2JlemlYamNJSXdGS0FKbFFheXFs?=
 =?utf-8?B?VGdPcnRGN2ZkVnJvajFoZ3dyZnFpaGxtSzROWEFxM1BFT2RpQnM5V2VrZ3NG?=
 =?utf-8?B?ZVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e3be7a-5e36-42a9-d1d0-08dcf17de24d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5533.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 03:10:15.2985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i0CwXk69RDoHbNklRA7QoTLO9O+sdVZvs//tbhX0Yh1hVmPgCaZyBHtjTkeeLnfE8H1qZGAA55XhNRg1FV39jIb9z7wWGIJrX0mdyI3QJMs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8383
X-Authority-Analysis: v=2.4 cv=UrgxNPwB c=1 sm=1 tr=0 ts=6715c61c cx=c_pps a=RoG0BMNHDmmKSZcrvsSD+g==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=iGHA9ds3AAAA:8 a=1NWNoF9oAAAA:8 a=P-IC7800AAAA:8 a=lSmtqWvVsQH4zDC1yv0A:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=97APRTa-CG6DvPMFVxHL:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: DEGsO6VMC-WQaajthxIaguobaxUlg2-V
X-Proofpoint-GUID: REAQJfJl00bS6fG-HEyVJwTAk5j7-lGj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-20_23,2024-10-17_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410210021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 03:10:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206095


On 10/17/2024 9:39 PM, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Wed, Oct 16, 2024 at 04:45:38PM +0800, Wang, Jinfeng (CN) via lists.openembedded.org wrote:
>> From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
>>
>> Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
>> ---
>>   meta/recipes-extended/timezone/timezone.inc | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
> Hi Jinfeng,
>
> I tried to apply your patch and got a ptest failure on the autobuilder.
> It seems to be related to this timezone update.
>
> AssertionError:
> Failed ptests:
> {'glib-2.0': ['glib/gdatetime.test']}
>
> https://valkyrie.yoctoproject.org/#/builders/73/builds/239/steps/13/logs/stdio
> https://valkyrie.yoctoproject.org/#/builders/61/builds/240/steps/12/logs/stdio
>
> Looking at the log, I can see this:
>
> GLib:ERROR:/usr/src/debug/glib-2.0/2.82.1/glib/tests/gdatetime.c:2960:test_posix_parse:
> assertion failed (g_time_zone_get_abbreviation (tz, 0) == "PST"): ("LMT"
> == "PST")
> not ok /GTimeZone/posix-parse -
> GLib:ERROR:/usr/src/debug/glib-2.0/2.82.1/glib/tests/gdatetime.c:2960:test_posix_parse:
> assertion failed (g_time_zone_get_abbreviation (tz, 0) == "PST"): ("LMT"
> == "PST")
> Bail out!
> FAIL: glib/gdatetime.test (Child process killed by signal 6)
>
> https://valkyrie.yocto.io/pub/non-release/20241016-109/testresults/qemux86-64-ptest/glib-2.0.log
>
> Can you have a look please ?

I'm working on it.


Thanks.

Jinfeng

>
> --
> Mathieu Dubois-briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com


Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5594F53D74
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 16:44:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55414.1773679458432537479
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 09:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=i3YMj1rH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75354e842b=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G5ep9e3065477
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 09:44:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=jS03hbzt42ZHWhAO8O/0Uo
	/uB0uzFMmgdAcPKbz+CcI=; b=i3YMj1rHi5Ccx0c3s6kLckVnV3SRr+4vVkdLoO
	sN6LosGSUwqzhYyhnnbod8Sokh0qZpon0BGfsW1tv7Fxcr7Ij+4zZwMYwWfzaICj
	BQPevyFDZMBgyG5nvH119SUczV9yw+vUDi+2HTx7fLXqvEk8+o4tOg+ruOnNxR8H
	ZVQo/HeDKjrU3VwsVxod9yrJoDiOnSwaeMU1+FSYrbK3J4e0wpsqjoZHEIUr6zDS
	9VrsQpe2oS64z0XV0kHwWlUqg/7+pBeVmnfY7Y6eYw7zymHJqYHy7Y9zM9CuVe8i
	2FJntTn4lsRj26c7L19SHxSmuXiZPYpXwXgwYzAnIePHvp9Q==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012049.outbound.protection.outlook.com [52.101.43.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw2y123pc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Mar 2026 09:44:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XYSFW00KYncMxi4wRVBQcpbnTl19KjtAXDvxK11K/WBb0mspl3Z5NFE2U0ppSyTc3qw2mjZjUuNWl2tmUbTm6V+mIEHyf6uvpiqPQ9z6EQJceAZBCmZiFJIGv253h5zJzlZiY4TqU3CYSd4Av+RGbId4WUg2gEIPXDYxo3ovnwOtYTy2boBY9hGTJ2YMhcATAkUtgl5NXRTzIfOl4cXpDMREoKPIMT7IwIDDp9NxSHzjb9qllDpo2lxJzQ36PNZ1+qOPTldvuoC2Jn223GHHl2j9oho20dDi9tImJWTJsKP+/n0PgKQZGnB99sxUO9fSK8LmgiBgHXXmSdRILPdNDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jS03hbzt42ZHWhAO8O/0Uo/uB0uzFMmgdAcPKbz+CcI=;
 b=MiZjmiwUoVB4cYbpqsInhuPbXKPFTrsh3v2OyhYMWYSAQZmCf6z/aeaBTNtMQmmYGk+DCuA7AYUYO5T4eyvyAPrCPNLGok5mxtYFzRvstnGumjF2ZyB1F0O6Fo/Du2mwtdB43us2GQNnAEkejLdGdV7RKCVcey+anjm1MlDMGKbGYwPCHA0Oy0cyX/3JRJNz1Y1qS8cBJyzZRG19hN5oRHiEisLA/+p2Zwz/1rvKSX607aQ+GMFHio8C1DqaEdZhxR/gil10KwIzbLw3GYAckjcSnCFzV7odNzmfpxmC8wJlt7T9TMiQ9VD+eNYm8/fapIM0IFpv4XGcnN52tw2jIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DSVPR11MB9768.namprd11.prod.outlook.com (2603:10b6:8:352::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Mon, 16 Mar
 2026 16:44:15 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9723.014; Mon, 16 Mar 2026
 16:44:15 +0000
Content-Type: multipart/alternative;
 boundary="------------q0Ao04KmFU0LAhLxEMsktcVt"
Message-ID: <7eee2810-6ecb-4d7c-a601-35f7dceacb5e@windriver.com>
Date: Mon, 16 Mar 2026 12:44:13 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: enable dynamic LLVM linking by default
To: sunilkumar.dora@windriver.com, openembedded-core@lists.openembedded.org
Cc: alex@linutronix.de, Sundeep.Kokkonda@windriver.com
References: <20260313160133.2347467-1-sunilkumar.dora@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20260313160133.2347467-1-sunilkumar.dora@windriver.com>
X-ClientProxiedBy: SJ0PR03CA0038.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::13) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DSVPR11MB9768:EE_
X-MS-Office365-Filtering-Correlation-Id: fca708e0-2c07-4279-0e03-08de837b428e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|8096899003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	UST+DbHVV/Eo9cjUMO3Nwz8dXyRNEBiYfMnfAyLL8pNuHVKbdxjKUJh6CfFrU0Nmw1wO6WAZZa70+jOs/Ip2YX340kxdydJImJQjfw0wsK65WiS3FVW741uPTn264ZuVV9r3qxo5AIlClLa83IQEkDQm5P0Y1sE1WvV7dqeyLkgIs9irSUxByG28N3r+gVAM6aEb2/DDSjQNmf9eipD87uFwzfyS4BAl5odz92PI9XSOG0FSTMIsy/unBt815K2E3ch3LNu+LAnwfoAKyadCRik3LXW4POKyET1jS0b37o2vaR4bcFmpGk59QqBLD24kv6f3yt/7IBgpnyKKWqNdrw5WobeLnfSKR8qK1G2Qc6JptNPPo+ImFX6kuBcwSiIFPeyJrHzNiaeFqooMM88goZqvpPI8iTwOlgj5b+6PA6wCjse1hQF0z0k7WT3h8/wln9p4goHG1i+F7cBqp0GCA1v8ktlguRnM0kXmUtOeKOjD7x5kZDipLBG7RXWuEl9PFdB7if+/AXTYvd6qZ5gJSksZChkvQOkWaqITR3JqCtBvPnEo/wHt3xEVTVDAjUNx2tpY4s2P3y751SXv1TQcsunXzWzvOLK03VxVuZrW0XShyQoDA+PWcvl6Hr2BXwc2mUPgoRR2Y2D34rGkizsycTuB4rqvN+9NnBOhixvxDNIzI66m6u/RWvyBMtbs5SALf9SQ25VDv41LJ21J/vTlEo9d3SlYo87Kmx8SJqbv9vE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dm5tMy9mVUVkUXVmMm9aNE5YanJsblFheUtaNzlZY3ltQlJTUmVJWVBTSDN6?=
 =?utf-8?B?NzhUZFowTE9teXNCTFRpVDh1R1JFYUZNTWZJdWNWQ3EwYUpKaDNEeG9ZWkRx?=
 =?utf-8?B?RitNbmFZc0RzR3lMbFM2UFpPQVhVTjh4MEZJMGE2YWJ5WnR5MTRocjNxSkxv?=
 =?utf-8?B?dUEwalp4QVQ4RWsyTzFJeExzejZqUUhoaDh5MHRzVzE4VmNCQ3QzbVIrbDBD?=
 =?utf-8?B?VE9hUW40eEh3a3A2VDlhN0QvdmtsTFRpNEtxVklnVVdpenlDeUFzcmpPL0JJ?=
 =?utf-8?B?clJYRVZPY1hjdVRPWlJBTlRRK204UTgzS1NFejlUT2VRVTAzbHhvSFE1Nmtt?=
 =?utf-8?B?KzYyVHJUTWliTzh5MlJlaHBpcy9SeUxvMG9YVHcyYWYwdjN3akMwNU9SaTcz?=
 =?utf-8?B?L1VzamJuaU0rUk1Qc2xqeG5XekFPay8yQktuZWVLaGE3L0pBUDNWQkQxNmpj?=
 =?utf-8?B?Ly9uVEtBZXd0cXZHMjhkbUlxa2QwazJpeVl2c1NVTDBKc2dtd2FhWVVSTFVr?=
 =?utf-8?B?QlpNcHFKWVRLZGRYTDIwRU13YlMxZEZ0QUVFS082MG1FRm44ZFdTV29lM3dC?=
 =?utf-8?B?N3M3OWRKMEhUazBHc2MxWjBheVJneVVGOE43U3oyYm9DdTJiZXgwT1NNeHdk?=
 =?utf-8?B?SmNFMlF1V1c4WTdQVkFZYVZ0eGMvem1jaTJHTkJ4SzRMNElnNjZLTjlRVEtK?=
 =?utf-8?B?cFlLWVNnS1dYUlRjWW9BWFdBbDFtZWQxSXlwVGJZeVdIWEpza0VFdW5zMjV0?=
 =?utf-8?B?eThIYlg4UnZrTHBQR0xCaW1SaDlhSFd6YmQxcS9OQk1UWFlrU0s5a01oZGdK?=
 =?utf-8?B?amNQa2txMllWMkV0R0I4ZWF6SUtqdWtJbCtDUTMvdFhVN2JXRmxMT1orLzVE?=
 =?utf-8?B?NGNCK0JyZHpTVHl3T1M2djIvSzJWRCsrcTV3ZFFFWUloV1VlaXJRYXU0Z2Nw?=
 =?utf-8?B?NEYvTW5TWjdqU1NmeXFsZ3pLUkRnNld5eFhIeDRDMGpsU01INlZBVG1qR0sy?=
 =?utf-8?B?bHYxTXhja1U2RUxyaDFWeDl5TkdEWnkyaHZOWDZNanNOZXBHRnkzd2U0VmtM?=
 =?utf-8?B?TUVCNGxTZ09hbFc3SlB4cTA1RzFDZzJhTFR3bmdDandDNEsrb3lWTFJXU1NO?=
 =?utf-8?B?WTI3cVlMTzQyYm5zMnVEOE5YeEVxS2thVU9YQlpOZHpPL1hrVG5HUGNDWWxt?=
 =?utf-8?B?ellIcmU5VWRGOFd4OXU0NVNUWjV6SGlDVk5xTFV0WlEzZWFOWDViN3Nzc1pq?=
 =?utf-8?B?NHh3K3lLVWVQd0NvTTVycGtaQmV4ZWlmSTJiaEhUZWttYXpwU0o4cGY0UEQ0?=
 =?utf-8?B?TGRSMnJWMTFkUDdSeUxyUzFWSW5DSUdKbnJMTDhoRTlxcHc1UnNpNTJIazJx?=
 =?utf-8?B?alNxeHkrY2QyemlWUUZXTjZoaWJHcnV3cDRoeFhRdVpvc0QzbDJMTFFaK0R5?=
 =?utf-8?B?SU1YalhDS0NkamV0bWNDOW4vdEFZa2tKNlY1YWYrb1FLL1RSTkZIazhHUkh3?=
 =?utf-8?B?Wi9QN1J2WnkxUHFQNkp0LzRMRHpHN0RIRmZSLzJaSGV5SFJMdVBsRDQ0Umpk?=
 =?utf-8?B?bld1c3N2UGRYeUJPZ2JSZmFsOEtWSnZhVU5WWnRiN2hxcHVKbE5JYXpzK2ZZ?=
 =?utf-8?B?dStZR2ZkNFZNd1RpL3FFaWdocFBCMEQ2YU00eG5EVlVJNlRTZFRCNXFXMUFk?=
 =?utf-8?B?YlN6YjhjaEN4b0J0MUxiYWtLY05ZYWpUM2dHSWp4eXY0R2c4SnFEcDVUQTh5?=
 =?utf-8?B?aG5pWHBHSnhnamVZVG1sbUNEbDAwL3ErMGhqWWI1bDEvRmNRMlEyUUhaK2lj?=
 =?utf-8?B?elExWHNCMDFLV1FJSnBlcUJ3QmswbWZrdGhMTVA2UnAvSEhTdFpvd1V3Nk9I?=
 =?utf-8?B?N1d0d3RrRWFySzV1bFFiQUlHYmkyNnV0dHQ1WGVKSVVzWm8vRjY3dE03M2JO?=
 =?utf-8?B?Y0tNSXZhYWF0VEdkQ1pCVklKd3FPdGhMZnpqWEQ2YmVzTlhuRHl1cXZ4ZnBr?=
 =?utf-8?B?SHA2dnZHNkIwblY5WWNKbmt4MjhGNEVGTjBLTUo5S3N2dWE5QmNyeDJzK29K?=
 =?utf-8?B?NE5PQlhid1JUTGp6TS9GTEFFOW16Kzl6MDRLVzJLVXVnZkdUVU5CdXJXWFM3?=
 =?utf-8?B?UXFSbWVSSjVNM2FJOUhoVE81Rk44SW9zQk5qSkZ2RGxpTzVVYnNzOXhYcUVU?=
 =?utf-8?B?VkZQOERsRDdEOEZJVXppaDVqakF0Qkt5eWF6VFJIM3owKzNOdGp5cnBYb3dE?=
 =?utf-8?B?MnEyRWQ2ZUZaMWNHbTJkMEdycVdndUV6TDZyL1J5eHRCYkN6OXhxM25zM3pJ?=
 =?utf-8?B?bDdsenp4OGpTY09UejRjNjBMUHo1TjJvYlZiVVVxZjNKMVR5MEUyMTBQd0hI?=
 =?utf-8?Q?cPUFdvc1s/7sFWSE=3D?=
X-Exchange-RoutingPolicyChecked: 
	KD2rb8SmBK6nTKPH0ei7Bok9BfOXkrHLi94vsojnXljRoPCpauT2t+q4BCPYJYuY3FMKMmPGbJUGK1cT9cCKT5s+lrH+cPmI9wIr7rwroC8Z0zmrbLvaLbA6VHhCo4r+g9smr/j8nP+d0JCnuz1N5IYpL/TMIi3i+y2eQw2luRu2Ipym7Tsy9egJG/01aN23ryVDfF9yfUy1S67xsTu7XAiNJYnjEL39sDjA3v5aP4P/8YyrW5A/6MmOU+s0Gu3KLU/wMMESWjM3HxKvGN12xZD8bXb39gE5EhvY2A+g7S7zh7MURFpxIxcU8WB1mxEVNgzxe84pRklgHS4l0q3wnA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fca708e0-2c07-4279-0e03-08de837b428e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 16:44:15.5692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 82xhBdJaF3eqsz+obl7k4vCP/ivzsNFIp9dhP2bREKrwCNK4Pp07WPAa+Fbn3BTIqVXkFGkvH4D2An/7VfGiXGnoN4XwZ1E6DLlrzk/VPNM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9768
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=CekFJbrl c=1 sm=1 tr=0 ts=69b83361 cx=c_pps
 a=cGw96uMdUXN41aDBKcSctA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=4VMTV1J62369icTZtw0A:9 a=QEXdDO2ut3YA:10 a=JA9UTegUjv4hGxCviMsA:9
 a=b7Qi0aiMYPvHPE6A:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEyNiBTYWx0ZWRfX+99erVPB/ONE
 rFm3OMNwTNqIjcA3ogptQDIgG20Ou4h0VFknF/xf6X7Kpfkvpbo9IygYjKzrKoZTqjtQXEV2WKK
 L5F38e9YgyU/ANMyalEFSLREDEu/mg4B7ydEsHV1QFNtne/zX7WrXp62fWHtwH7PmAHF4+Nwy/G
 vkcD9mT6uJS1tmsdJd5EV6C6n+DCGp1vxTxFT6kFOMKF6/H0HFui5o6vYj5xIKpi41ySSCgoVmS
 NMwfNGVqccljZH9BiOoQ/eyUIXYn8VrZGtlSEN5aTHRy3upRBFtvMEoHMRHAfoIHyahHZoT1kwf
 P3PIeQArQb9UZYzIvmc5+fzyhHGELaoEVh+pPGAs5SMNmCGNyVPJabKG+SFT3MQxV2CG5zFgKN5
 WJPiz218TPSJnz5dtbENiaE4TzzbkRYh/CUoEYbHDuNAd1/kSby+5/zswCgDgaa4rW3ToUqzJdL
 zdcxBCDDstQ/2gtf9iQ==
X-Proofpoint-GUID: LkOaFp0EYE3fxnkHPAJM-Y-WF3laWSHV
X-Proofpoint-ORIG-GUID: trkSUbl9L27CZlQSLlcepFVLIrCO7Hfi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160126
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 16:44:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233260

--------------q0Ao04KmFU0LAhLxEMsktcVt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-03-13 12:01 p.m., sunilkumar.dora@windriver.com wrote:
> From: Sunil Dora<sunilkumar.dora@windriver.com>
>
> Fixes [YOCTO #16058]
>
> Enable dynamic linking with LLVM (link-shared) for all rust variants
> (native, nativesdk and target) via a PACKAGECONFIG option, enabled
> by default. This prevents segmentation faults when reusing sstate
> artifacts built with different host toolchains.
>
> Update multilib library symlinking to include shared libraries and
> adjust the rust selftest to install llvm so the dynamically linked
> compiler can run correctly.

Sunil,

Please simplify the reproduction and report this upstream to GCC folks.

reply with the bug if any.

The goal is that eventually, 5+ years, we could revert this change
if this is really an upstream bug.

../Randy


> Suggested-by: Alexander Kanavin<alex@linutronix.de>
> Signed-off-by: Sunil Dora<sunilkumar.dora@windriver.com>
> ---
>   meta/lib/oeqa/selftest/cases/rust.py      |  2 +-
>   meta/recipes-devtools/rust/rust_1.94.0.bb | 10 ++++++----
>   2 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
> index 3ae1946e43..7614941661 100644
> --- a/meta/lib/oeqa/selftest/cases/rust.py
> +++ b/meta/lib/oeqa/selftest/cases/rust.py
> @@ -47,7 +47,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
>           bitbake("{} -c test_compile".format(recipe))
>           builddir = get_bb_var("RUSTSRC", "rust")
>           # build core-image-minimal with required packages
> -        default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp", "libzstd", "openssl"]
> +        default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp", "libzstd", "llvm", "openssl"]
>           features = []
>           features.append('IMAGE_FEATURES += "ssh-server-dropbear"')
>           features.append('CORE_IMAGE_EXTRA_INSTALL += "{0}"'.format(" ".join(default_installed_packages)))
> diff --git a/meta/recipes-devtools/rust/rust_1.94.0.bb b/meta/recipes-devtools/rust/rust_1.94.0.bb
> index 2be0bd8d89..0d34a312c0 100644
> --- a/meta/recipes-devtools/rust/rust_1.94.0.bb
> +++ b/meta/recipes-devtools/rust/rust_1.94.0.bb
> @@ -15,6 +15,9 @@ DEPENDS:append:class-nativesdk = " cargo-native rust-native"
>   
>   RDEPENDS:${PN}:append:class-target = " gcc g++ binutils"
>   
> +PACKAGECONFIG ??= "llvm-shared"
> +PACKAGECONFIG[llvm-shared] = ",,,"
> +
>   # Otherwise we'll depend on what we provide
>   INHIBIT_DEFAULT_RUST_DEPS:class-native = "1" # We don't need to depend on gcc-native because yocto assumes it 
> exists @@ -124,8 +127,7 @@ python do_configure() { # [llvm] 
> config.add_section("llvm")
> -    if d.getVar('PN') == "rust-native":
> -        config.set("llvm", "link-shared", e(True))
> +    config.set("llvm", "link-shared", e(bb.utils.contains('PACKAGECONFIG', 'llvm-shared', True, False, d)))
>       config.set("llvm", "static-libstdcpp", e(False))
>       config.set("llvm", "download-ci-llvm", e(False))
>       if "llvm" in (d.getVar('TC_CXX_RUNTIME') or ""): @@ -190,7 +192,7 @@ python do_configure() { bb.build.exec_func("setup_cargo_environment", d)
>   }
>   
> -# llvm-config expects static libraries to be in the 'lib' directory rather than 'lib64' when
> +# llvm-config expects static/dynamic libraries to be in the 'lib' directory rather than 'lib64' when
>   # multilibs enabled. Since we are copying the natively built llvm-config into the target sysroot
>   # and executing it there, it will default to searching in 'lib', as it is unaware of the 'lib64'
>   # directory. To ensure llvm-config can locate the necessary libraries, create a symlink from 'lib'
> @@ -207,7 +209,7 @@ do_compile:append:class-target() {
>   
>           # Only do per-file symlinking if lib is a real directory (not symlink)
>           if [ -d "$lib_dir" ] && [ ! -L "$lib_dir" ]; then
> -            for lib64_file in "${lib64_dir}"/libLLVM*.a; do
> +            for lib64_file in "${lib64_dir}"/libLLVM*.a "${lib64_dir}"/libLLVM*.so*; do
>                   if [ -e "$lib64_file" ]; then
>                       lib_name=$(basename "${lib64_file}")
>                       target_link="${lib_dir}/${lib_name}"


-- 
# Randy MacLeod
# Wind River Linux

--------------q0Ao04KmFU0LAhLxEMsktcVt
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <head>

    
  </head>
  <body>
    <div class="moz-cite-prefix">On 2026-03-13 12:01 p.m.,
      <a class="moz-txt-link-abbreviated" href="mailto:sunilkumar.dora@windriver.com">sunilkumar.dora@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260313160133.2347467-1-sunilkumar.dora@windriver.com">
      <pre wrap="" class="moz-quote-pre">From: Sunil Dora <a class="moz-txt-link-rfc2396E" href="mailto:sunilkumar.dora@windriver.com">&lt;sunilkumar.dora@windriver.com&gt;</a>

Fixes [YOCTO #16058]

Enable dynamic linking with LLVM (link-shared) for all rust variants
(native, nativesdk and target) via a PACKAGECONFIG option, enabled
by default. This prevents segmentation faults when reusing sstate
artifacts built with different host toolchains.

Update multilib library symlinking to include shared libraries and
adjust the rust selftest to install llvm so the dynamically linked
compiler can run correctly.
</pre>
    </blockquote>
    <p>Sunil,</p>
    <p>Please simplify the reproduction and report this upstream to GCC
      folks.<br>
      <br>
      reply with the bug if any.<br>
      <br>
      The goal is that eventually, 5+ years, we could revert this change<br>
      if this is really an upstream bug.</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20260313160133.2347467-1-sunilkumar.dora@windriver.com">
      <pre wrap="" class="moz-quote-pre">
Suggested-by: Alexander Kanavin <a class="moz-txt-link-rfc2396E" href="mailto:alex@linutronix.de">&lt;alex@linutronix.de&gt;</a>
Signed-off-by: Sunil Dora <a class="moz-txt-link-rfc2396E" href="mailto:sunilkumar.dora@windriver.com">&lt;sunilkumar.dora@windriver.com&gt;</a>
---
 meta/lib/oeqa/selftest/cases/rust.py      |  2 +-
 meta/recipes-devtools/rust/rust_1.94.0.bb | 10 ++++++----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 3ae1946e43..7614941661 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -47,7 +47,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
         bitbake(&quot;{} -c test_compile&quot;.format(recipe))
         builddir = get_bb_var(&quot;RUSTSRC&quot;, &quot;rust&quot;)
         # build core-image-minimal with required packages
-        default_installed_packages = [&quot;libgcc&quot;, &quot;libstdc++&quot;, &quot;libatomic&quot;, &quot;libgomp&quot;, &quot;libzstd&quot;, &quot;openssl&quot;]
+        default_installed_packages = [&quot;libgcc&quot;, &quot;libstdc++&quot;, &quot;libatomic&quot;, &quot;libgomp&quot;, &quot;libzstd&quot;, &quot;llvm&quot;, &quot;openssl&quot;]
         features = []
         features.append('IMAGE_FEATURES += &quot;ssh-server-dropbear&quot;')
         features.append('CORE_IMAGE_EXTRA_INSTALL += &quot;{0}&quot;'.format(&quot; &quot;.join(default_installed_packages)))
diff --git a/meta/recipes-devtools/rust/rust_1.94.0.bb b/meta/recipes-devtools/rust/rust_1.94.0.bb
index 2be0bd8d89..0d34a312c0 100644
--- a/meta/recipes-devtools/rust/rust_1.94.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.94.0.bb
@@ -15,6 +15,9 @@ DEPENDS:append:class-nativesdk = &quot; cargo-native rust-native&quot;
 
 RDEPENDS:${PN}:append:class-target = &quot; gcc g++ binutils&quot;
 
+PACKAGECONFIG ??= &quot;llvm-shared&quot;
+PACKAGECONFIG[llvm-shared] = &quot;,,,&quot;
+
 # Otherwise we'll depend on what we provide
 INHIBIT_DEFAULT_RUST_DEPS:class-native = &quot;1<a class="moz-txt-link-rfc2396E" href="mailto:#Wedon'tneedtodependongcc-nativebecauseyoctoassumesitexists@@-124,8+127,7@@pythondo_configure(){#[llvm]config.add_section(">&quot;
 # We don't need to depend on gcc-native because yocto assumes it exists
@@ -124,8 +127,7 @@ python do_configure() {
 
     # [llvm]
     config.add_section(&quot;</a>llvm&quot;)
-    if d.getVar('PN') == &quot;rust-native&quot;:
-        config.set(&quot;llvm&quot;, &quot;link-shared&quot;, e(True))
+    config.set(&quot;llvm&quot;, &quot;link-shared&quot;, e(bb.utils.contains('PACKAGECONFIG', 'llvm-shared', True, False, d)))
     config.set(&quot;llvm&quot;, &quot;static-libstdcpp&quot;, e(False))
     config.set(&quot;llvm&quot;, &quot;download-ci-llvm&quot;, e(False))
     if &quot;llvm&quot; in (d.getVar('TC_CXX_RUNTIME') or &quot;<a class="moz-txt-link-rfc2396E" href="mailto:):@@-190,7+192,7@@pythondo_configure(){bb.build.exec_func(">&quot;):
@@ -190,7 +192,7 @@ python do_configure() {
     bb.build.exec_func(&quot;</a>setup_cargo_environment&quot;, d)
 }
 
-# llvm-config expects static libraries to be in the 'lib' directory rather than 'lib64' when
+# llvm-config expects static/dynamic libraries to be in the 'lib' directory rather than 'lib64' when
 # multilibs enabled. Since we are copying the natively built llvm-config into the target sysroot
 # and executing it there, it will default to searching in 'lib', as it is unaware of the 'lib64'
 # directory. To ensure llvm-config can locate the necessary libraries, create a symlink from 'lib'
@@ -207,7 +209,7 @@ do_compile:append:class-target() {
 
         # Only do per-file symlinking if lib is a real directory (not symlink)
         if [ -d &quot;$lib_dir&quot; ] &amp;&amp; [ ! -L &quot;$lib_dir&quot; ]; then
-            for lib64_file in &quot;${lib64_dir}&quot;/libLLVM*.a; do
+            for lib64_file in &quot;${lib64_dir}&quot;/libLLVM*.a &quot;${lib64_dir}&quot;/libLLVM*.so*; do
                 if [ -e &quot;$lib64_file&quot; ]; then
                     lib_name=$(basename &quot;${lib64_file}&quot;)
                     target_link=&quot;${lib_dir}/${lib_name}&quot;
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------q0Ao04KmFU0LAhLxEMsktcVt--


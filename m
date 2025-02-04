Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74289C02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 11:30:27 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.114431.1738668624591593969
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 03:30:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=41309b8077=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 514AGuwM032294
	for <openembedded-core@lists.openembedded.org>; Tue, 4 Feb 2025 11:30:23 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2171.outbound.protection.outlook.com [104.47.55.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44h8u12v9h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 11:30:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nTu6SMRJCUC6hODe3f3gIHHt6TdGui2qrnL5HuoTeVLoP4YCI4WWo4W6ogNcmPcD8NlwACr2pUdIIvyl7/qOPNAY7kouUn5tfYk4lQd1+g4HsFEDgpbPz+Cgu0N2uOrUUPNsXChsi5El0+HkRPsRIBnBWHXltTyEtQazD2siIWzM+H8ksv5vOt3Gy/FWmUzoMBN4xxtXWPn4Eo1HmHtUYgsdE3uH1HomXDpqq05hZ1zIy75TLdqCkOF34ScdIQkeeycv6wbfqGGCdhTO4YlqcLoSTZKmzlvQJo44uzijh5tXn78L0hqmJbNpAJx8FfdYxDXCr3rF/9Uk2w9/ptc+lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ngCixqAEMFm9/USPZqm8kscQ+VuJZMpHJtu/nBDf+pk=;
 b=yIQWATh3Doiivyyc9XPqr+/SKtHXk9lsqxgTbkpO46ozHvhaHMkXKgkwx0bNcNvVx3t8cuLavS6MHSCIkOd/QkWVtL79H06WzC4c3JorBXzDluXPiGVt2Pwe6owdmq0BFMUXh+O7evgMBy6u0eKvFqkc9wDFITzRvkdtDQKvLDuBfF7A4/BcdcZIU+YsfGtnvJWujBlbZREfuhWtMHtUylw/N9XGJtZtXS9ZKbYTWthbc2CpS1oTEicqJRDuLR8gfewhScyixA2NAryePR2C+mgXVpq3zRV0QHuN4owuDN1BCcakpEZQA/Lg7HwCYLi3/5wrVjQ2vH97BJ9Ps5mAnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA1PR11MB7776.namprd11.prod.outlook.com (2603:10b6:208:3f9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 11:30:08 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 11:30:08 +0000
Message-ID: <c81b3950-dfb4-4f13-8b14-675771944f4a@windriver.com>
Date: Tue, 4 Feb 2025 19:29:57 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] nfs-utils: add PACKAGECONFIG for gssapi
To: yi.zhao@eng.windriver.com, openembedded-core@lists.openembedded.org
References: <181C134EC495FF13.2487@lists.openembedded.org>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <181C134EC495FF13.2487@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::13) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA1PR11MB7776:EE_
X-MS-Office365-Filtering-Correlation-Id: 036b4dd0-ec0e-41fc-eb19-08dd450f4755
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NFAvR1hHUmlFU3pOelFXdU9SYUZEbWpYTWc1QUpZTk5BNlZTZytpTVd3NUVM?=
 =?utf-8?B?c3pJNkRSYU1jZldyMEtJYWJVWXF5RGtPNHI3MXFXMHltN25jd2I2MmNYUzhH?=
 =?utf-8?B?M3IwTFBsU20zSFVCbW1zSlFmUnhES0JRRGVGZXlGeWdTUDBITUJDcThMWTVa?=
 =?utf-8?B?ZFlZSXRVL3RVd2tsdXZnZ0oxdkVlQWVESTZmdUN0TEdHczlVNEp4K1M5cXhO?=
 =?utf-8?B?TlVnTzFnOWZvdllGa01TN21PYlNaT2hyMkJPb1R4YjcvRjhPR3VHc3U5R3JD?=
 =?utf-8?B?WVVkSGVDM1BtSSt6TUxSd1FJZFNsWFIxVm5oc09lZmFJYkFZMlhJZXhOblVQ?=
 =?utf-8?B?YUZ2bE5Qd0FzRWNWM3F3aytyZUxvYXhFcjdUUklOQThVZkczdThINGl4NGdi?=
 =?utf-8?B?K0Jqc2hjOE96WGlsUDEwUjhyM2RTaFRyV0JKWkgyQmgwUGZzVi91RVlDQUor?=
 =?utf-8?B?cGR2N0V5US9NZTNqMVdPNkUzbGwyU3NNcTc1WDV4QndWWlkyVU5nSkIwSWVK?=
 =?utf-8?B?MVFtbmkwUHRJTG1hMUN0TDVIZWU1aFRTSTQ3VGNrV2lGZjNQRThMb0R6cDRn?=
 =?utf-8?B?RllDMkVyNG9qcGhtaTVGMEFhQUxqNWViSThuM3M3Sm9Sbm0rRFdYU2VLNE5Y?=
 =?utf-8?B?V01Ic1pMVzV5ZFFBbWVQNk53OGJ3VTdKNDFGWUY0eE5SOExXV05ncXhXaHIx?=
 =?utf-8?B?S2Y0TTdnM2hmM1NkYXRHa3l3RGRUcVpNbzVDV04waHlsRjl3cS9JU2ZUR2Yy?=
 =?utf-8?B?Z0VRRzJGN0VZR1NESkx2Z2lMSjVoSHBKYmFFelFtU0RQSS9xYXdmbUF5WHRl?=
 =?utf-8?B?STJOc3JVQ2Z0aFRZYzBCVTJNdUtLbk5oRzVHdTBhT0tMMmUzS0dmVWNwVUtZ?=
 =?utf-8?B?eHJuUWZjMG91bXBLanc4RHNCdjFOVWhmVWdXeFJjOEFoMG1EY3hRL1V2V3Nq?=
 =?utf-8?B?WURjcjBXbUlkQ3pFdTA0dGlUa3ZxMEdQNnBiVy9idzh2YmZzMW1ncjhMQzRy?=
 =?utf-8?B?ZzNVZXhhWE1ndlZGZFM3dE02ZHI3MkxEMjJBdThWeEpVRTBkOTBlM2ZDbHBn?=
 =?utf-8?B?V3hvNHBrU1dJUEdBNitoa0I2VTBaNjZrV216MDRYSU9McU9xRkJCZ3dzNkFt?=
 =?utf-8?B?YTEzUmJORGYwd0J3VDNnN29LUm9IWThEcnlMZ0NaVHVuekZxVytoTUQ1dGNL?=
 =?utf-8?B?ZmdnUURZUE1yU0h0UUJIaWFSUkwweGJkbHU4ZDMvdGt1VEF4eTIxS1RvV2hh?=
 =?utf-8?B?M2VVNGxEaWYzVUpEZTdBNkY2cXBNVTdYTC9hQjI2ZXRqTVhEbk5pcGxpdzRI?=
 =?utf-8?B?NEhjbnNnd3dxNjQ1SVJsQkxadUl5TVUrMmZXVmsrLy9Xd1FXRVBnZEl4VWJu?=
 =?utf-8?B?VzhjS0x1Mm43UEU4UzdKOStWR09Rb0ZxNjFHNzIvOGpScGZzK0swRjhjd29V?=
 =?utf-8?B?NUsya21zWnExdHhtTWhhR3NuSUFqbDdNVWtDYlJqQnBEMStWWS9MREQ3MDJt?=
 =?utf-8?B?dW1JeXlEcWxWMWt4OGp3NUFZcWJhYzR4SE5NUUtDN0ZZLysycHlxMkVaaFZa?=
 =?utf-8?B?SFpheWxWTkpvTjd4SWZEaDljMjZIc0c1eXJIcW5DS0lVL3RaemhDUmIxM0FL?=
 =?utf-8?B?SGU1cjdxSXB4TEFpMWVFa0RFWWxRY2FPd3dvVCtVT29SZXFaR2FtSzlvNUtG?=
 =?utf-8?B?aXNaWTRlOUZlY3B1ajFkQW9OcEFmS205eWZCa1BhaUh1WjZLeVNwbzVRNy80?=
 =?utf-8?B?emNON1FtM1hTL2RJZVlGSlM3WDU3SXNKTUpqTVA2ZGVJenY2Nk1NY2l6a3M1?=
 =?utf-8?B?TDBvZVRyWEgrdi9vakRYQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z3Q0WVI4RkJLenNUUnBmVWI0VXVWbWcrNGdoc1dBWHM5WmdjS3lENi9vZVVG?=
 =?utf-8?B?ZXVTYWE1U0VxZWlkNzhRRU9LL1JoOFZCK3JqcHdHbWc5Z3VBc21wbUFTdlM4?=
 =?utf-8?B?S1YxZUkwYUl0NnUrWTgvaHJRU0hXeWZQaTd2OWY4UEwzcnZzZkJCUmlxQWxt?=
 =?utf-8?B?ZGh4QkJQZ1QwQUwvaGZBVXZSU1V3YzZmKzFxZEF5VW5iaWp3V21rZVpNMkpq?=
 =?utf-8?B?SHY5Qi81RXlsUkg0RTNiT2xRYllLcE82NE56K1NPVVhhZHFjV0pWL0FjRDhC?=
 =?utf-8?B?TWNSdmxGWHNjQ3Z4R3JLTTMyV2pWTjRHWHlNd1hEK2RFVld2VDZJb1l5L3h5?=
 =?utf-8?B?d3hSaU9GRnVIQXB5eC9EY0FsVG5CTUFscHR5cUxMV1pvTnN4SDV0THo3NURy?=
 =?utf-8?B?VEZSQ3JBRGlLRFVZR0lKYkVXemJTdm9qTFB1bUxHaEZlQlJjMHdxbklDZzFx?=
 =?utf-8?B?eUFHS09KVWRybktFUkJBdDd6Z29oM3V6SkYyZmNvZ3lMK1hNdzlod2hKcWdP?=
 =?utf-8?B?aUM1c1FHb0FKWitFa0lGT0g2eE5aNU56VmtYb2c1OWZmSDZXSHdHbnJRbkRE?=
 =?utf-8?B?SGNyTUlSUFd1aHdkR0FMRmRUY1NZVkFmNUlkb2hzblREYWdKUk03dWxrK0o0?=
 =?utf-8?B?b3UrTmFxUEJXZEZzVGY1emg3N0hHMnk3Ylp4bUJmVmxVMHRRV2hTODEzellD?=
 =?utf-8?B?TnJrSTA3Zmw2dzc0RmNWbi9obUtkam0wRDZ2SjkzSUl5cU1IbkxxK2NQajFX?=
 =?utf-8?B?Um5yVFdBZVJ3VzBQd01rSDNkeUl6MTJtWW1vTmd3WEphMjlKUURoVGI0Unla?=
 =?utf-8?B?NWxDWm5GZlVuQnlMTnhaQnNnWS9JcmIxNTZsRzdDTWt2TFluNDEwd3hRamJG?=
 =?utf-8?B?cVhISWZkZkJFbVBHTllmaTlnWTZ3aHFBSVBLVEEvQ1cwUTc1NG5jR1hIbkJl?=
 =?utf-8?B?SE5NYjdpbU1MSmZWQ3laT1pVTGNya214S2lnd2VWZUVJNlVLRHdXdTgyWUY4?=
 =?utf-8?B?cGxzbFNKUlVST21EdnBseWZSRUs3ZzhKRnFJMEl6WlppNW9LMFpMdEMwVk9y?=
 =?utf-8?B?SG45QWxqQUZCNDl1MDlJYW55OEJyeGxTeFc4UU4zOVBIU2NjTlU5ZEFaVmwy?=
 =?utf-8?B?d0l1Wk1pVzVyMzRiRW92QURQZ25KN3Vva09CcEFjb2IxbHlsQm4wYzRPVUdQ?=
 =?utf-8?B?RFdpakRtUm1CWGlWZlg5emF2eXUyS0VYZ1ArSHd2WnVuZHJwM1QyeXpuZEgz?=
 =?utf-8?B?aGlYQ1lncnlETmtxbC9sVC9DdDk4ZmpqRmpVOEd2MnBRaU4yOUtnRVUybGtX?=
 =?utf-8?B?Y3Z6TUVVeHNNOG0xT3AvVEplbHRsb1d4TU10SUFCVlpJSTNibEd1VVdGYXFS?=
 =?utf-8?B?QnR0aDZnVUNPYld0TlV4Um1nSUZqT2YzdXFFb3NhWnpiaEE3SEcwSk9sUVBm?=
 =?utf-8?B?Wm9ZVFdSUTBQcFpRSnpVZVhVdHJuUWt0RWtPNHlHMDl1UEpQdVJvRVphVTU5?=
 =?utf-8?B?blRXQmNTaEtocmpPTlU1VjUvdE80Q2duSi9mbXNFRmhUM2t0WFI3SE9VUHlQ?=
 =?utf-8?B?WGpPUmJ3bUtCNHlxc002MjFZTWxxQkNRcnZiUGpnU3d0MUk3TzcwUCtuR0ZI?=
 =?utf-8?B?R0VlUG1xR3pzNnpINFNDSkV1djdsWlI0Z3JWMVIrQW81aVdLRSszaW1SQjZ3?=
 =?utf-8?B?VVZLa1NDakhLdnh3R1djVTBLK1JvNlNKOVhlQVhuamh4S0o4OXVRQzhHUmI3?=
 =?utf-8?B?UVdrUkZPcXdURWhPNERRM1ZBSjgvSkJ2TVc3MU04dmg4cTVoWVRmTDA4d01E?=
 =?utf-8?B?cHlBNDIrQzFsc0xDOXFWbFpVMjJvZm94cGxDeVZ2dE9NSXJSY0d1L01DUVJF?=
 =?utf-8?B?NUdReVFEUDZSaXgzOS8rL1NWRzAwMk9kK3orbUpXM3VvMXdqbklOc3ZvQmwy?=
 =?utf-8?B?K1FNdHJLdEJRYzRMTjhtWU8yWXc1aTY4bnFCUko0K0F6VWNBRzFmMC9lNlc4?=
 =?utf-8?B?Vnk3M1c1OHNNYkpSY2g5ZVJwS0xMZXVWWmFyZnhub2F0aVZvMkZOOGZJNERq?=
 =?utf-8?B?Q1NXM2JNU3dVUW1lRWJxVTVMNnlwR3cxS21yNWdsNnp2ZUxxRkExKzlUR2Ju?=
 =?utf-8?Q?M1fx5tf9ddblcplktux4rmFzV?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 036b4dd0-ec0e-41fc-eb19-08dd450f4755
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 11:30:08.1765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D9lqEQqC1oROfx0RKjbfteG9dLrlrW+mNBPQnjo9a8mbuxnAQ/h6aPQTqdgHrsdy4A+B16OkDu2aPQUzIo/tvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7776
X-Proofpoint-ORIG-GUID: KfRtiwHlt5Fr4qIJMWgt8aSqnJysvSMe
X-Authority-Analysis: v=2.4 cv=HuqMG1TS c=1 sm=1 tr=0 ts=67a1fa4f cx=c_pps a=98TgpmV4a5moxWevO5qy4g==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=7P9wYh92dKXZWOJEl_gA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: KfRtiwHlt5Fr4qIJMWgt8aSqnJysvSMe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_05,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502040092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 11:30:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210773

Ping ...


//Yi


On 1/19/25 19:06, Yi Zhao via lists.openembedded.org wrote:
> Add PACKAGECONFIG[gssapi] to support build with gss and svcgss.
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>   ...nd-krb5-config-for-cross-compilation.patch | 53 +++++++++++++++++++
>   .../nfs-utils/nfs-utils_2.8.2.bb              |  4 +-
>   2 files changed, 56 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Find-krb5-config-for-cross-compilation.patch
>
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Find-krb5-config-for-cross-compilation.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Find-krb5-config-for-cross-compilation.patch
> new file mode 100644
> index 0000000000..019660c12f
> --- /dev/null
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Find-krb5-config-for-cross-compilation.patch
> @@ -0,0 +1,53 @@
> +From 74d01a9e6d19eb963bbf081e3ea7c692759a8fe3 Mon Sep 17 00:00:00 2001
> +From: Stefan Ghinea <stefan.ghinea@windriver.com>
> +Date: Mon, 18 Dec 2023 01:20:21 +0000
> +Subject: [PATCH] Find krb5-config for cross-compilation
> +
> +With $dir being used as base search for both libgssapi and krb5-config,
> +in OE krb5-config is found in $dir/bin/crossscripts instead of $dir/bin
> +so add this to the search posibillities relative to $dir.
> +Remove check for needing to set -rpath in KRBLDFLAGS.
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
> +Signed-off-by: Haitao Liu <haitao.liu@windriver.com>
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + aclocal/kerberos5.m4 | 13 ++-----------
> + 1 file changed, 2 insertions(+), 11 deletions(-)
> +
> +diff --git a/aclocal/kerberos5.m4 b/aclocal/kerberos5.m4
> +index f96f0fd..61bc81e 100644
> +--- a/aclocal/kerberos5.m4
> ++++ b/aclocal/kerberos5.m4
> +@@ -26,6 +26,8 @@ AC_DEFUN([AC_KERBEROS_V5],[
> +       K5CONFIG=$dir/bin/krb5-config
> +     elif test -f "/usr/kerberos/bin/krb5-config"; then
> +       K5CONFIG="/usr/kerberos/bin/krb5-config"
> ++    elif test -f $dir/bin/crossscripts/krb5-config; then
> ++      K5CONFIG=$dir/bin/crossscripts/krb5-config
> +     elif test -f "/usr/lib/mit/bin/krb5-config"; then
> +       K5CONFIG="/usr/lib/mit/bin/krb5-config"
> +     fi
> +@@ -71,17 +73,6 @@ AC_DEFUN([AC_KERBEROS_V5],[
> +   fi
> +   AC_MSG_RESULT($KRBDIR)
> +
> +-  dnl Check if -rpath=$(KRBDIR)/lib is needed
> +-  echo "The current KRBDIR is $KRBDIR"
> +-  if test "$KRBDIR/lib" = "/lib" -o "$KRBDIR/lib" = "/usr/lib" \
> +-       -o "$KRBDIR/lib" = "//lib" -o "$KRBDIR/lib" = "/usr//lib" ; then
> +-    KRBLDFLAGS="";
> +-  elif /sbin/ldconfig -p | grep > /dev/null "=> $KRBDIR/lib/"; then
> +-    KRBLDFLAGS="";
> +-  else
> +-    KRBLDFLAGS="-Wl,-rpath=$KRBDIR/lib"
> +-  fi
> +-
> +   dnl Now check for functions within gssapi library
> +   AC_CHECK_LIB($gssapi_lib, gss_krb5_export_lucid_sec_context,
> +     AC_DEFINE(HAVE_LUCID_CONTEXT_SUPPORT, 1, [Define this if the Kerberos GSS library supports gss_krb5_export_lucid_sec_context]), ,$KRBLIBS)
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
> index 18c4a249b3..4cc698f62b 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
> @@ -32,6 +32,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
>              file://clang-warnings.patch \
>              file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch \
>              file://0001-Fix-typecast-warning-with-clang.patch \
> +           file://0001-Find-krb5-config-for-cross-compilation.patch \
>              "
>   
>   SRC_URI[sha256sum] = "a39bbea76ac0ab9e6e8699caf3c308b6b310c20d458e8fa8606196d358e7fb15"
> @@ -56,7 +57,6 @@ EXTRA_OECONF = "--with-statduser=rpcuser \
>                   --enable-mountconfig \
>                   --enable-libmount-mount \
>                   --enable-uuid \
> -                --disable-gss \
>                   --disable-nfsdcltrack \
>                   --with-statdpath=/var/lib/nfs/statd \
>                   --with-rpcgen=${HOSTTOOLS_DIR}/rpcgen \
> @@ -75,6 +75,8 @@ PACKAGECONFIG[nfsv41] = "--enable-nfsv41,--disable-nfsv41,libdevmapper,libdevmap
>   # keyutils is available in meta-oe
>   PACKAGECONFIG[nfsv4] = "--enable-nfsv4,--disable-nfsv4,keyutils,python3-core"
>   PACKAGECONFIG[nfsdctl] = "--enable-nfsdctl,--disable-nfsdctl,libnl readline,"
> +#krb5 is available in meta-oe
> +PACKAGECONFIG[gssapi] = "--enable-gss --enable-svcgss --with-krb5=${STAGING_EXECPREFIXDIR},--disable-gss --disable-svcgss,krb5"
>   
>   PACKAGES =+ "${PN}-client ${PN}-mount ${PN}-stats ${PN}-rpcctl"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210002): https://lists.openembedded.org/g/openembedded-core/message/210002
> Mute This Topic: https://lists.openembedded.org/mt/110696372/7283133
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [yi.zhao@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


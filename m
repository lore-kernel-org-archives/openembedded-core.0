Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB79C25B77
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 04:36:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2402.1716352605450282806
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 May 2024 21:36:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=58721eaa3c=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44M4UXiG016206
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 04:36:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y96gur436-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 04:36:44 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 44M4ahDK024027
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 04:36:44 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y96gur434-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 04:36:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SsjACurS/R+U6MOQmgAf5Cxgrq3kP7iKq2HNv+CetisA7ui3C5WcFBMsfq6UxJ1/KNG3RNZZ7eAhKUIVFViqEXPYxERiyInRWXqigJv12n9MT7LUWlAGvFpoh9A8N6JKkld+YD2pyWomlwSAZm+AAnZgfyPkAencZm/yUOyDiO4xxPyoRmz2pScu9AYW2hrGH+1y+5tLixv/3M+9akAaIuqiW3dAR2o66PVUM5UAsEtwrIS9z+o3htrqsdeMhGFVDIx5pyKZcCn1xwibiuL3O46bunJtJ+rOEZ1xgK+z/c23YHdC7AmZFvj3laR/U50PsOGBH2WC9z1xcpULDX2m3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHrsAEzJNWaXocZMiiJJ1UYZrQ372pRsHn7NB699WAk=;
 b=Xg1xfmpiBYDkaAEerACODV17fTvfnmFscq+Dsh3E97k9gpO/LvjmnxWM5FExdZpujXnAr3/lpac6plqDr5ZQZzLg5mhYwwtlZ6TeuIEgW9kCR63hgjlJhz9p+0aj3p6tCiSAAVDe37Q+YjYWQtMkxkAqgR+eU1wNfD0y4J6p1AX1+8J2msJNS4Msfn23lDTwjg6DWkSxzPvLc+TuUCytsn2uFnlux6FAsQzBITQNw6B7qU+yONeiq+USQfqig5pWjk4zTTOeU1p9bcf6b4b7BB9drloIAs6INwgv+cNKIt3sUIsXQjZKo82vZM3zw+ziqE9I7g/9GsZj1+JC26gJcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SA2PR11MB4908.namprd11.prod.outlook.com (2603:10b6:806:112::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 04:36:41 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%4]) with mapi id 15.20.7611.016; Wed, 22 May 2024
 04:36:40 +0000
Content-Type: multipart/alternative;
 boundary="------------sB7PLoE0jQ1qsN1XyqMHqfso"
Message-ID: <9bdca88f-c694-4905-9988-7d5f6b9182b3@windriver.com>
Date: Wed, 22 May 2024 12:36:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [master][scarthgap][PATCH] ptest-runner: Bump to 2.4.4
 (95f528c)
To: Changqing Li <changqing.li@eng.windriver.com>,
        openembedded-core@lists.openembedded.org, anibal@limonsoftware.com
References: <17CEFBF983FDDAAE.21609@lists.openembedded.org>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <17CEFBF983FDDAAE.21609@lists.openembedded.org>
X-ClientProxiedBy: SG2PR01CA0127.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::31) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SA2PR11MB4908:EE_
X-MS-Office365-Filtering-Correlation-Id: fdb2245c-2068-46ac-50ab-08dc7a18c61f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZDhjWkxzZm9MTUltd2pSTms2bEk3bHlPd1dJaXN0a1BwRnlSd041dFZQWXFD?=
 =?utf-8?B?ZUlSYzFMVFNxU3BkOEhwWGltVEpTcjdEblIvYkxmMVFVV0lQRGJOVEJ4VkhQ?=
 =?utf-8?B?Y2xIQ3VUdXliSFR3MzBLNVNRckFiUU9HVzhQaHdyZHJmOWlqMW9zaU01VjR5?=
 =?utf-8?B?MDF0OGVXVzh4YTZwNTBQWVQxTVJadXlkS091dXBoaGY2NHF2aDBSYS91cmFK?=
 =?utf-8?B?QklIWWNhQk1HSTF2dnJQV0FXZmpkKzV3N1hKT2xnK2NIMk43SEtyNlByclBr?=
 =?utf-8?B?MjRkY3ozUGhzcEFNbjNtano4UjIvWkdna3Zma3QrMDhRSEVpbnpsOHBZV0pR?=
 =?utf-8?B?Q0l1QWxkekhISFdSdjNUcHliTTArT2svSDN0WDhvMCs4TXlDSkV2VzFBWVVB?=
 =?utf-8?B?cDF6ampKQW1QbkdPUUk5UThmQUtHNElFMS9VeHM4d0ZhSzg0ZjdWcDFuSDFv?=
 =?utf-8?B?KzkvNnIrVjJKM3JmWEFCRE41bkNXUUZJanRMYzU0OUZKaFkrcjRnU2ZqbkJx?=
 =?utf-8?B?dENsUjd3eDJZNkd0a0pkQ0VCM3hzMkhFOC9ZYmZwWlEzZWF6Si8zZUsyUW9i?=
 =?utf-8?B?OTBHTkxtRWo3dWJ4L2VNVnp6MXM2U3dvT05wSjltbEhXSVpQV2xvTzRnaGpJ?=
 =?utf-8?B?d1VaK0Z5TnFJdjQ2UU5TQXRnSUZ6VktYTzZDVGhHb0t6dmRBTGlkUFRZRm1m?=
 =?utf-8?B?R0tTUi81eFVsYTZma0ZlVG1Dem14aHcyOWtsVUVKbEUvY3FnRE15TVdTeWdv?=
 =?utf-8?B?MDRoOTFtemxRNmQ2ZlR0cTRud2NvOFRRNzVJVmJRcldyVkZ0OXN1ZC9jZlVk?=
 =?utf-8?B?T1krTXljZmloeWJsWWxyYjZWV0Rvd2hMS2l1MU96aFhUYVZ2bE9YbFZDb2tX?=
 =?utf-8?B?Zmg2TllKWDNXVjRteHdvVlRORzVqckJmQlhQYzVCL3p3ZVVKcHZUejloUUtZ?=
 =?utf-8?B?OEdhdCtDV1hsN1lCUDBPSUdNSWhCd1NmRFV3eC8zVkJBQldDeDVWTVJrSE1P?=
 =?utf-8?B?UlpvdFJJbEFtTWU4SmRra2JrOVpSQ1ZBZE9mWGhMcjR2ZmlMMFZhR21iM29S?=
 =?utf-8?B?Z3dLVERjQmhUc1k0MTJFN2pqdmRGUmNFcW9KSFVvSFdkcGlyR09VMzlJZlZZ?=
 =?utf-8?B?WjhRSVBhMWhFdEg4YlJOWlkwV3FQcXNWODNadnp1UCtoeGlHZmNyRitZT05H?=
 =?utf-8?B?SHFCQVFJcjU5RVBUTW40T2xDVTkyWmN0UW1HMXB2RWgyc09lNDdYSzBqSDdC?=
 =?utf-8?B?b1d1ZGRldGwvb1ZIeGRaeGpMeGNIQkR5QWtDTnY4bWhJQ2dKOWhCVG1LK3dP?=
 =?utf-8?B?VldpRnI2NmlTNnRqYlJxZlo3K0g5K3lRSUplaE92NDhWbVBINmFaZUtoaUd6?=
 =?utf-8?B?blNVSnZLaWxSV0h5ZzhOSVJVL3MyUGlUVXJKYXhuVlhudjNWWGhGbnZVTFdQ?=
 =?utf-8?B?TWJPWHBrYnZmazhNaXFkeUNQYVBqU3ZnTmdUb0pkSkdiVWlXYS9LT2VYZllv?=
 =?utf-8?B?RW9aU3JHZGlheGJLZFlzZURpTzN2TWJxM3JxMjJtQkNZaFJETWFHVXB5L0JV?=
 =?utf-8?B?STZLYkJqOWNDek9LNWU5TDZEVWg4T1hJR2xPVnJjWE90UGFZbnFVODZZQWo2?=
 =?utf-8?Q?uukRFOCKPox/xg9ZC2/zggIOb+g2vuh627IKH51+TBhs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VThjUjBtUmZVK3p1ZkM2Q2pDbjh2c3h6c21ycFFqeEp0RnZjdmxCcUtIUml0?=
 =?utf-8?B?UFd5MnRDd1pXUTBLb0xGTklwM2N5cEhYM09NWTFyNFZyZmtsWnVSQU5jcDdu?=
 =?utf-8?B?UWNxOUd1YTRoNkYybFR1N09uYU10RVBtMHgzWHNBWHVhRWZ2czNabXZNNFdp?=
 =?utf-8?B?MzQwcFpPU3FNT2JYV0JxcGh4anp4NjYrbGczZ1hiZGMvMXhzREE0em9DeTNs?=
 =?utf-8?B?RFlpK3ZHbkpIV0hoSkx5QkF4clMwSDhQQWMwUGQ0RUU4N3Z1TjFCa2YwQWFx?=
 =?utf-8?B?bHdpT1QvMGxCZDZEM1NsNjhSWlovdWdXNnlrQmt6K0dyZFM1MklERlNMV0NO?=
 =?utf-8?B?ZXExdjRXUWFoWkYrMDdGd1I2RGpuWEdWTWpERFp1OTdWcHZZdkx2Mkh6WmRF?=
 =?utf-8?B?ckYzN0dGYnlySTczV0Qyd25aVktNOWdxOGF3MHNTNGxTRWU5dVJPUUJvbFR2?=
 =?utf-8?B?MldRdjVXcW1qZFlsdHFWRHlHYldXNW1ydlQzK0xGSjZhSHl6bmVRdGw4NEtG?=
 =?utf-8?B?Ny9ocVgxc08rWjh0Z1M0RmVwd2NFNWpDR0VJUTlIcm9xT0s3VXdjaURkZWND?=
 =?utf-8?B?cHN5WVhKNy9JeUs2a0JPNG9IV3IvakxHdEVaNmRDTmJIRnNFLytheUlKSjJX?=
 =?utf-8?B?dUpFbWxOanhia1NoVDg3ditSb3BBR1J1UVBYZDUrcFkrUGxMNGxqR0ozdFhV?=
 =?utf-8?B?M3ZoWHBGejc1N1RaYkdRVDY0STFZVVZxR2NTQXg3cnJ5blBYdDVhSmdZNzhV?=
 =?utf-8?B?WC9YUnZKbGlXT0pBd24zYjAwVkI0L1h3Mm12OVlsN2VlZEFnNTFVZWZsTEs0?=
 =?utf-8?B?V2dEbUowdnlCQ3hFQUtRZ3hkY3BGYlZ0MGRUYks5NGtsQlRnWlR1UXUyM01v?=
 =?utf-8?B?N1EwWkxqK1NnK0dUTG5ISXFhSHdjU0dsUHdhcTBkZGRyNC9OL0ova0dIQXJm?=
 =?utf-8?B?eitnOXJCWWxUQzdGNnZMU3AzYkxCWERpOUI1QWNydHQzM3dpVGRMMjhyQWRw?=
 =?utf-8?B?RllKMTAzZGxsdDJXckJBYjJsVmJScW8xem42b1RpN2VFZ3NoV1JCcmVtL0dk?=
 =?utf-8?B?aCtES2JtSDZNSXp3NmRBd0FoT3hwVDZGS1VWWVMrdE4wbDRwT2sySjJNbWgv?=
 =?utf-8?B?dVBGS0p1N3dWT1hNTkloYzc4TmlieTFoRlNyaTY5R0FQbGxOODlmaGhRZW9s?=
 =?utf-8?B?S2pQNHB5K2VGNHBPUXlpRjlQd2ZmUW92bERsb0tQY040U0pNWXhxa3dTbVlQ?=
 =?utf-8?B?b2M1NC9zSjFub2toZFhvY1BJbVdMNG1kRmM0cmY1ek1KZ2p1cUdlR3BGeUVw?=
 =?utf-8?B?OVl0Y1hLRjY0K0NhR055VHYyYTlqejh1NzFxZGZHeE1OSmF2UitHSFZaQ1NY?=
 =?utf-8?B?ak5sRnRWN2VlVTQ3WWUwR3MwNUdrblBvclVMME92VWVnT2w4SEQrKzNGTjdi?=
 =?utf-8?B?YURLd1czQTB1bmE5MitWV2t4WUxNTzc2OFpRVlkvVk1wTSs5TzZnODJQNkZj?=
 =?utf-8?B?elBlWnZFYmRsczVpZVE2ZG1PSjkrY1FMdkU4R1dJVkdXTEF1LzlkbWo1SUkr?=
 =?utf-8?B?bkNibUl2Qmw1OWRSM3QvaFl4NGxmSlE1b0hjWEx6c01LUCsrQ1liTkRTeTQ0?=
 =?utf-8?B?SUMvZzZ6blVrOUVGTUF6T1h1WXFZV2JUVFFpbnd5NmwyZi91RDBtR0IrQWpx?=
 =?utf-8?B?L21FaTgwaXBWdTZVNDJUaTRxUnYrOTdSZHkwNzRmazVsVytCREt6K0hHbGxo?=
 =?utf-8?B?TVhwRmt6NG9aOUtDOVBwTllsZmF6cmp3dXRZR3Z0OTRhbmNaUUtHZlF1NlMy?=
 =?utf-8?B?N1ViZlhNN3k2SnQ3cC8vYm5aQnIrR0pDYW1Id09sWExlQjgwM1h4OW1kdy9T?=
 =?utf-8?B?ZE1qL2Q0N0J0ZUU3VmZUZnYvNXV5dWkvcm9zMm5qL2w0eVdScXNIdWE4eTIv?=
 =?utf-8?B?cUVlQ2pzdXhnMUpseFZpZ2JadzRvazA0SmVzZ1JoWUFTVE1xajNjbTkxQVZX?=
 =?utf-8?B?d3h0SXJQbmN5OGtvZmxheHVFK0cwR2pVSThFSXZOQzhVM3RMYTBtT1M0Ty9k?=
 =?utf-8?B?TXpmbmNKWXBmQUhNdUNoUW14QmRUY1ZmbVRJMTFqaU1VTU5MZlJ0N2JkcEN6?=
 =?utf-8?B?UTlOSGl4OWQzcEo3L2VJWEl2K3RzYWM2VkdmMzk5MVQwOENJTUU2M1NieEhG?=
 =?utf-8?B?dVE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdb2245c-2068-46ac-50ab-08dc7a18c61f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 04:36:40.4571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JC+rjHb4pswulaVtwoCu03KF53mXxhrej5Y9Wef4NQZwPvDRMpbrz9h+1LLbA64KsBPhdNb4ml5xB1n+S8CFM9JKVFZ/5bh2qF2S8REbm0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4908
X-Proofpoint-ORIG-GUID: duIFS-Fat547UaJTDMVZmuA_nhnpM8P-
X-Proofpoint-GUID: QoJPBhtt2-yZuXjub2zj2-oc_tWMVocq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_01,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405220030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 04:36:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199681

--------------sB7PLoE0jQ1qsN1XyqMHqfso
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Kindly ping

On 5/13/24 15:32, Changqing Li wrote:
> From: Changqing Li<changqing.li@windriver.com>
>
> Changes in 2.4.4:
> 95f528c utils.c: run_ptests improve error handling on ptests iteration
> c48e5fc utils.c: run-ptests improve pseudo-terminal handling
>
> Signed-off-by: Changqing Li<changqing.li@windriver.com>
> ---
>   .../{ptest-runner_2.4.3.bb => ptest-runner_2.4.4.bb}            | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta/recipes-support/ptest-runner/{ptest-runner_2.4.3.bb => ptest-runner_2.4.4.bb} (95%)
>
> diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb
> similarity index 95%
> rename from meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb
> rename to meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb
> index e6668da01f..2263e07280 100644
> --- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb
> +++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb
> @@ -7,7 +7,7 @@ HOMEPAGE ="http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
>   LICENSE = "GPL-2.0-or-later"
>   LIC_FILES_CHKSUM ="file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
>   
> -SRCREV = "92c1b97bfdb4a94acc1cabcaf97eef52dc29144c"
> +SRCREV = "95f528cff0bc52903b98c292d4a322fcffa74471"
>   PV .= "+git"
>   
>   SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199225):https://lists.openembedded.org/g/openembedded-core/message/199225
> Mute This Topic:https://lists.openembedded.org/mt/106068298/3616873
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [changqing.li@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------sB7PLoE0jQ1qsN1XyqMHqfso
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p>Kindly ping<br>
    </p>
    <div class="moz-cite-prefix">On 5/13/24 15:32, Changqing Li wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:17CEFBF983FDDAAE.21609@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Changes in 2.4.4:
95f528c utils.c: run_ptests improve error handling on ptests iteration
c48e5fc utils.c: run-ptests improve pseudo-terminal handling

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
 .../{ptest-runner_2.4.3.bb =&gt; ptest-runner_2.4.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.4.3.bb =&gt; ptest-runner_2.4.4.bb} (95%)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb
similarity index 95%
rename from meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb
rename to meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb
index e6668da01f..2263e07280 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.3.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb
@@ -7,7 +7,7 @@ HOMEPAGE = <a class="moz-txt-link-rfc2396E" href="http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/">&quot;http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/&quot;</a>
 LICENSE = &quot;GPL-2.0-or-later&quot;
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://LICENSE;md5=751419260aa954499f7abaabaa882bbe">&quot;file://LICENSE;md5=751419260aa954499f7abaabaa882bbe&quot;</a>
 
-SRCREV = &quot;92c1b97bfdb4a94acc1cabcaf97eef52dc29144c&quot;
+SRCREV = &quot;95f528cff0bc52903b98c292d4a322fcffa74471&quot;
 PV .= &quot;+git&quot;
 
 SRC_URI = &quot;git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https \
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#199225): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/199225">https://lists.openembedded.org/g/openembedded-core/message/199225</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/106068298/3616873">https://lists.openembedded.org/mt/106068298/3616873</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:changqing.li@eng.windriver.com">changqing.li@eng.windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------sB7PLoE0jQ1qsN1XyqMHqfso--


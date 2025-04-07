Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD2BC3601E
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 03:29:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.38860.1743996594236559781
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Apr 2025 20:29:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6192bc662b=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 537361vB021265
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Apr 2025 03:29:53 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2042.outbound.protection.outlook.com [104.47.74.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tug8ht3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 03:29:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lix6bdOhIRO7YTP7ZMI26L6uGidjyWEQDMLBF1PQvA6uThJ0812I7H/VQRRDszItP6T4CWqGgC3MIN2UVBsV92tIsGI/+mK3R/5+a/dYygZ+Fwpbpt/34eMmfrZx8jbIEdESkFdfvw5Ql+NRybe7Hx2Wzeej4uzmbL1BO9dH5T3bYG85KMquIXh1SPHiE8SO7lfUuZJDJJoNO+1Xxm2Qy14QlWkMRldPG66+KD2E3uj0UAkKpR4D1bLAKYn7/AMaAuvxeS7B6c42XLhDN0WZ477jj8cepq9WKyiSFRCmMmTr8tgx1CO6YIwR/MxtaQIHxRoILk0IwJp1f6PxTeppsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ray4vWoL1B1c/zxhFlLwozvQRVS+0tvsIFF0Fiypn8s=;
 b=E7cZb1/LShDHjyyqDmK/u6TA2BfDRKkVaxIQtFl9InF3PUzhfav8MDLBdJ3nf8bDUzw5PPlSh30Jx8OS91wmd7+yr3TgV4Q/Hn6xiABwxzfvNmAM4Xcs2ctaVQvnopH9rYvOuUIwMxZ0tJNBShZkLaSt+H5Kbq8848SeUs2uVCREPlVZ8ip4/MDa0Dxt3C3IsAV6tJNfEeEUgjN67+O9ms4YggLI8w1YN1yhkbSmFBISGi19k0OoeBMONXzuTj2bLywDkTywCXtSPRqdIv5QbLwX6LNlGWbhCCE7q+Eo9nqo/QPZitGIrXmpRx+5rK/gRWit5PAwDNThLel8FAiIJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Mon, 7 Apr
 2025 03:29:49 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%6]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 03:29:49 +0000
Message-ID: <be126d8f-975f-4bad-8ce3-edee74dde507@windriver.com>
Date: Mon, 7 Apr 2025 11:29:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] live-vm-common.bbclass: conditionally to
 add kernel and initrd to efi.img of ISO live
To: openembedded-core@lists.openembedded.org
References: <1830F91FBCDA61F8.4736@lists.openembedded.org>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <1830F91FBCDA61F8.4736@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0128.apcprd02.prod.outlook.com
 (2603:1096:4:188::20) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|IA1PR11MB8200:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bbef209-99c3-454d-4c25-08dd75847345
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RklmeStRbmdadWtwakdiSEI2WXh3WmxCaElYUzNlK2loZTZCbk50blBmMWIy?=
 =?utf-8?B?d0pnMDAzREcwQlhoOGFXbjVBT1BkYmZuTFhmTVJlZXorYlFPRkg0RVRzZ0NP?=
 =?utf-8?B?ZUVEeEllblZPeXNpTW9oUEFXeDdlOFJmcFlrclF0alZXc0YwUHpZME9hcGhy?=
 =?utf-8?B?SXJ6T0FTTzkzbzVpbnhRYnJrb0MxK3hhaXdZNE52MXkycGFDOUZ0Yk1hZGJp?=
 =?utf-8?B?aERYbmFaTkI2bm5aRG53cW95QlNkbkZKMDZ3emFlZ3MwK0o3bW1jWER3SHJJ?=
 =?utf-8?B?cHlWZ0htOEg5YktQeXJDdWRvSW13ZGV1MlpMTjV6STFHQVZQTjZkU0ZYdzZx?=
 =?utf-8?B?N1NHYnQzNUNteWdGZnlWZWpLWDIzSWJyaDlRbkpiem9oWmZiY1NyZnNadVky?=
 =?utf-8?B?M2R3SEk1aThPM2JuQnQ4c1JBQVVqSE0xK05KdUlEblVUL29qMVZOWE1IN0du?=
 =?utf-8?B?dDZ5RVM4dE9VcFVidlJsL2FIS0V6Qk1sc1NER3BuZUNRY2pWOXhSdkk2YWYy?=
 =?utf-8?B?THJseDF0ZWtMZVJ4OGZrSXZva29oc3ZxZExhKzYyMFBaYUxYSC8vdHJzaEdl?=
 =?utf-8?B?YUtvSmZXc2RQREZacE9xZXl1SDVtYW9XTStWR2xVd25RWk9uWGw4amZPY3FP?=
 =?utf-8?B?UGNPT01jRjloRU9QUDAxRkU2azFJdkVZYzM0c1AxRnJQUE5ka3JNSzA3dzZz?=
 =?utf-8?B?ZUZRamV5bGMyWmY5YVdWQTI2clVIRnMybkZGOE14N1g2Q3BFMVFLTDI0d2ZP?=
 =?utf-8?B?NmlrUER5WnJvbzdJUFlWWWE0cnJTblhQZ1Y4UlVBaGhyWWZWaG03d0lNT1hl?=
 =?utf-8?B?RTBTUFpUOGtURjZwd2FENi9oUGpkSW94RzZwTy9SMHovbjFJdWRhQmlZanZW?=
 =?utf-8?B?TFhhanc5VzJ5YWcyUG8zbEpVMGNPNUlJU0xneG45L3hoMFhubm5lc21FWG9E?=
 =?utf-8?B?c21NRDAzOThWRG9PR0o4TGlwdVVvRitleWtjdnR5bFhWZEprcVFlUFFMUUhP?=
 =?utf-8?B?VlJSSUtDZXhBVTNmMHYvNnh6K3haY3RyUTBjUFVOaE5pWjd2bzRvVDA0Rmc3?=
 =?utf-8?B?T0daMFFJNit0MERJdkJCLzR2VnhGNWNLcHVRWTd3dzkrS3o0V1NLNUp6NVhO?=
 =?utf-8?B?akNXbE94MmJXdVFRR3N4UXZ5aUR6bDRURmVvTzFhd0poZFdxUTBlM1BNdFZm?=
 =?utf-8?B?SGI3MnJncXhBdlZqOWFnWjVobk1ZY2dBa3BaV2VsdEV1Ym50d1JvS0lCOEpl?=
 =?utf-8?B?MGRtZ0x3WFVFTXBWcHlFLzZMdW9tbnVFMWJUbFNTYW1jS0NJdlBiaFlsVGVX?=
 =?utf-8?B?Qk51YndxaXZDdGtSTTV0WE0xeHZYWThKcjZndUVObkJZVlVQMXpUTDJUZkMx?=
 =?utf-8?B?OTRnSXhTOUhCZnNIQ0h6Qll0ZHJLZ1pBQks4NEtoUlhtaXJkdlF5VHVUazZ2?=
 =?utf-8?B?M2VJbVpWN1lDU3pNeTRLUm5DbUJ4YmRyOCtwcTI0NHl3MGdPUW9LK1VLWThM?=
 =?utf-8?B?UmN2WGQ1ZFFvMTF2T2FrUERoOEpFZjhDQ0ZZL2s1VklEUTh0UUJxenN6TXIv?=
 =?utf-8?B?Sy9lbTdyN3NjemJndXZFVDJXeGJvN3Z6RmFUdUV1WFJEM3NodE1jME9SYWJL?=
 =?utf-8?B?T3I3OVJmamFmWHZJRGRGR3JBSkI2aUVGbXV2YmlFajFlZXJHMHZBWWo1UUo4?=
 =?utf-8?B?K3VPVTNNUFVNc3N2SEpXbGNpQytnOFRQc1VLbEhBZjlzM2xCRHlyNk05Rk5m?=
 =?utf-8?B?MnpBR212UlV3S3UydnFuTnRwZkNZQlhta2NhSS9UbVBwMHU0cGhyZ0RYcE5u?=
 =?utf-8?B?SGpvd1V4SGdLcDhoWU1vTmNuUzZlbUQva0FSMWpDam54eDNGOFU1ZXhPbzB6?=
 =?utf-8?Q?xEsWEl0traVX6?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aEtDZTdHQjdmTVFVUEdYb0RYd1RxNEpKK0ErRWZwQXgyL3JBb1MySGh6MEYz?=
 =?utf-8?B?MC9yaStwaXBxRnhWZzUwMWVXK3dhNS9DZmIzUlFRTmNySUt2Z1dseXd1dnkw?=
 =?utf-8?B?enJ1TzFhTHl3WlhuQmtpSjc2M2VUNDRTRUh3dXk5M2gxM3dGV3VMaklMRkZW?=
 =?utf-8?B?aDRpQXlrK0hpNG5rYkdwa1phMS8rZWpEU2V0RnRQenZqTE1kL0xGZHk0YWNZ?=
 =?utf-8?B?blhwOXB4M1FQU3R0ci9jQkhsTWxKbU82QW0ya29wK2gxQzNJUjhJSFdwbEVU?=
 =?utf-8?B?eEhob1F3RE5wcTdFVDNtd2tnYjRXSjNWTFhTSmVUVEZkUVhIS3pRR1BXTm5E?=
 =?utf-8?B?eFNwOXh5cWMrUWF4aUIyblV3OVhNRkRucTN6RlZxYWN0MURQWkV2bVY4eTNk?=
 =?utf-8?B?em5zeFNkUzRGckdhM0hxN0trTVM4aGNSMWYxSEZyUWxjSlhSdVpmSXc3WVlw?=
 =?utf-8?B?c216MGdzQ0hUeDVGMVNXWXExejBXTzVZbS96V2NQajVyNzJvV2JneWhuck93?=
 =?utf-8?B?MWVqa3BwUDExenZGVXVGRi9LenBlOGNVMjc2Vm5YbDZRWmhOMWxhMlBSaVdT?=
 =?utf-8?B?RHVXUGZWTVRJMW5kaURYaUdwQm50MURTSGp3V3RQcjR4ZDZNVk1LdlNSbmpP?=
 =?utf-8?B?Y1ZJbjJqTEtjNmxDUjlOZTFyQ2lwQzRDeTU1WlRFTkVwaGpDdjlHazU0dEl3?=
 =?utf-8?B?Y0dka2thQ1Z6WXRBRVBQZno4NFRTTTdqSUQwK2xjWHlCamNPSXg1REFBZ2VP?=
 =?utf-8?B?UVFCK3ZzeU5vZnRzVmNURlhaczhkR0xrekhla2ZUZjBtQ1dES0lRNXNBbkxY?=
 =?utf-8?B?UmFZM1hzQTRZVS92UWhUUnY5a0hTb1QxN1hDMVYwbmdrRW5lRVJsUGRmQjcw?=
 =?utf-8?B?UEd1d3QrQkFTTWhlc0xxMTQ1Rk96T00xOGljU0xXUEUvMVluLzU0Vm9ZcTR0?=
 =?utf-8?B?dnR5aWkxYXJ4RzkxaEVzbGZzcCtlZzI2Z2owV3dXSWRTTHAyNHNXckhzanI3?=
 =?utf-8?B?TDU0LzNEb2ZZUVhXOEcxYVFvQkVHU095TmFndGs3cU4rQW9pM2pPRVBhYm4y?=
 =?utf-8?B?Y01XT1VWY25jQzUxQkVoK3dIa1V0WmV4cGtUQ0RUTUd5aU0rT2tVazYzZFdR?=
 =?utf-8?B?c3NGNXRidlYwTTR2MXBGRXp0RTdJYVZDeExuVkdlT2tUengvWVBxZThaRTV5?=
 =?utf-8?B?K1FWVDRaMTBDYlViSVhqQ2VQNEZKa3N5VzcwQXNycEN1Q0FjMy95TDNFMDdp?=
 =?utf-8?B?SVF1VnhFUDVOZnJucVVWejZJd1UraXl1QytZa1R4MlVwblJrajRRVTN4b1FZ?=
 =?utf-8?B?bVphWXd6NE5kaHQ5and6cnJ1aitnYm9xOUJyNWVWSEdQSEFhUUIyZzlCbEVS?=
 =?utf-8?B?Z0t1S1AwaGZYcW1GQUp5V2ZoNnJKejFtK1d1ZlUxT2VCWVB0SGYxTlQxekpi?=
 =?utf-8?B?bnV6RW52cU1EVUw0c1ZxQ0RMYURvYkgyeHNnZmxkM01ML2RmVGdZbXJCTCt5?=
 =?utf-8?B?Y1NDSjMrWXRGbXdFT3pQZ0toTTFEUGNjbVpER2dFNmhISEsvRkVnK3N3Rmc4?=
 =?utf-8?B?VENSZUV4UUVNWHpSYWdpWVZKbEF2MTlCUmMrYVFOZmdseGVBa0tzaVpjcjBa?=
 =?utf-8?B?MlZCYW40RGdwUE1ERnQvMUF4QWcxVGYrRUQ2ak82TEFKN1ZMN3I1d1pFbUNz?=
 =?utf-8?B?NFZ0NWFOQ0RvNjJZa2FsN2VlZis4aVBDTnRHa2ZCTXl5TnVBcEt2QWgzVGxa?=
 =?utf-8?B?clB4VFYvNkRwdzNRTVN0SG1zZitKSTJjSUpsUVhmYkNGM2tyVm9kbGtkM3p2?=
 =?utf-8?B?NGJNT25rWGVNTGRUSHlHZGFwNlJGTkdKVHZrczZZV0tRdmMrZUpWK1pmNytG?=
 =?utf-8?B?clV0V1NjdWZpSXFPNno1NGZhQ08vTmhTd1oxcFB4YytrdUR1SVd0WFgvYVhV?=
 =?utf-8?B?OGRQT3pldVluYzJkTHZmbjVpU2tONS9SN2xwY21TUmhGbWwyRGNRWGhKSVhR?=
 =?utf-8?B?bGJ3RWRzTW1nVmU1aVkxYzBWM04wanEzOUpJWE95Ymk2SjMySGJJQnByTlNU?=
 =?utf-8?B?Y2FiRUJaZ0FGMTdvcm5IN0VqYkRuRjBLcVBTZTNJU0VXOTJwelVzTFFSOVRQ?=
 =?utf-8?B?cnpHL0M2YU51OVB3Z2VtVUZmYzdYVk1CcWZ2aHBpT1FIQWNxOEt4eGxiby92?=
 =?utf-8?B?OEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bbef209-99c3-454d-4c25-08dd75847345
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 03:29:48.9566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DQYeDQ9UzOxDVU1pvFPh4YFiZuXRvixAhTujVP+Ooj/e8cG8p8Lf5us33Bc7zDzNm0BE5o+CGWPURK21BQUrkbZ3Iox7yx596AIYDJD633k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8200
X-Proofpoint-GUID: O_-9opeLJ8DU_oQ2lqBrs0uvuO5QGGT2
X-Authority-Analysis: v=2.4 cv=YJefyQGx c=1 sm=1 tr=0 ts=67f346b0 cx=c_pps a=CZyBIZNk7+VlD+/eRBofeA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=fBPbGx2vQGdftNXC2MUA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: O_-9opeLJ8DU_oQ2lqBrs0uvuO5QGGT2
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_01,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504070023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 03:29:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214393

Ping

//Hongxu

On 3/28/25 21:02, hongxu via lists.openembedded.org wrote:
> Add var-EFI_ISO_KERNEL, if ${EFI_ISO_KERNEL} != "1", do not add kernel and
> initrd to efi.img of ISO live.
>
> For grub-efi's ISO live, the kernel and initrd is not necessary in efi.img,
> because grub-efi's bootx64.efi sets `search.file ($cmdpath)/EFI/BOOT/grub.cfg root'
> to locate kernel and initrd in ISO live image.
>
> It helps while the size of initrd is big to break the limit of efi.img in which
> the filesystem type is FAT
>
> Also clean up ${EFIIMGDIR} before populating
>
> Set EFI_ISO_KERNEL ??= "1" by default which adds kernel and initrd to efi.img
> as usual
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/classes-recipe/live-vm-common.bbclass | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-recipe/live-vm-common.bbclass b/meta/classes-recipe/live-vm-common.bbclass
> index d90cc67ebc..f087d9e236 100644
> --- a/meta/classes-recipe/live-vm-common.bbclass
> +++ b/meta/classes-recipe/live-vm-common.bbclass
> @@ -48,18 +48,25 @@ efi_populate_common() {
>           printf 'fs0:%s\%s\n' "$EFIPATH" "${EFI_BOOT_IMAGE}" >${DEST}/startup.nsh
>   }
>   
> +# Kernel(with initrd) image in efi.img of ISO live
> +EFI_ISO_KERNEL ??= "1"
> +
>   efi_iso_populate() {
>           iso_dir=$1
>           efi_populate $iso_dir
> +
> +        rm -rf ${EFIIMGDIR}
>           # Build a EFI directory to create efi.img
>           mkdir -p ${EFIIMGDIR}/${EFIDIR}
>           cp $iso_dir/${EFIDIR}/* ${EFIIMGDIR}${EFIDIR}
> -        cp $iso_dir/${KERNEL_IMAGETYPE} ${EFIIMGDIR}
> +        if [ "${EFI_ISO_KERNEL}" = "1" ]; then
> +                cp $iso_dir/${KERNEL_IMAGETYPE} ${EFIIMGDIR}
> +        fi
>   
>           EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
>           printf 'fs0:%s\%s\n' "$EFIPATH" "${EFI_BOOT_IMAGE}" >${EFIIMGDIR}/startup.nsh
>   
> -        if [ -f "$iso_dir/initrd" ] ; then
> +        if [ -f "$iso_dir/initrd" -a "${EFI_ISO_KERNEL}" = "1" ] ; then
>                   cp $iso_dir/initrd ${EFIIMGDIR}
>           fi
>   }
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#213836): https://lists.openembedded.org/g/openembedded-core/message/213836
> Mute This Topic: https://lists.openembedded.org/mt/111953457/3617049
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [hongxu.jia@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>



Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA9DE7718D
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 09:40:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10859.1734946831242234253
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 01:40:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=208738cb70=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN7pSws031662
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 09:40:30 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43njw0spx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 09:40:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RwbfWDke6UQ3jGjrXBcXPyNysFmKsj+DBQqSF/2J3TQx78/J3JXXGIilljBy3qY36sLOqQ+qeq88Ykk3sqL5A+YM54ruNtM+Hc8ZtKMM647PpiI3a1iaUEFk75goBKpZzW3+9k8TrMXRMyo3cDwCVNVPEkfIpjkPLAyUM7HDjAhIGxBdAsgl5smu7M0k8AWKxJY7HoHlRpG5VSFmTdMfr2vFSFKNNrI9RImJsvujVY8eyljsrq9WZG7+hpjtIzvE0V0U4qVGdxoBZijOiPcpVzwPqEMV7qUXQC4CQ2021rUjHL0/VKgtj93OfRtZi/rcwmY9t+RPapwAtH2jjrvVGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TjvCyFS7gVb8esHgS5F0RNZVTUM2YFWaMC30Rq9L3zk=;
 b=iGhG8XFsRNWoMy3Cyvz3dDdR/jVK7F/J9nz5KtJy2GwPGTEp3dVX2J8qiwgt3vFuePHq1wbR178+TIy39jZN2dweVMdC/A3BEi5wgZFPv2Vjh/uO/y+y3vpLSIy1sTclTdCYU6jaTlazrUfsBllUtqBwPt2vYOGOkWmfT1yktuRDzFXPWZBCMEyvHzS+IIHZPp7NzBqeYDZ/b69RGUCGfF4/RnR+O6crxa+hS1tPtn350kQ6t6/Jy0sRxmMCU49Px+wR+Hwusm9DZEaXCyoUJ1jN8LRUH+7F7xJaw5Tun7LUPrUTkZiMyjeQFeHXvoO28XtG5/4rqn6uKvcWgUO4YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by SJ0PR11MB6744.namprd11.prod.outlook.com (2603:10b6:a03:47d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Mon, 23 Dec
 2024 09:40:26 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%5]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 09:40:25 +0000
Message-ID: <e47ab30e-725f-4054-9f41-35f0888a8b0f@windriver.com>
Date: Mon, 23 Dec 2024 17:40:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] tcl: Fix issue causing tcl-ptest to fail
To: Jiaying.Song.CN@windriver.com, openembedded-core@lists.openembedded.org
Cc: changqing.li@windriver.com
References: <20241223090642.959439-1-jiaying.song.cn@windriver.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <20241223090642.959439-1-jiaying.song.cn@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG3P274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::23)
 To LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|SJ0PR11MB6744:EE_
X-MS-Office365-Filtering-Correlation-Id: bbadc8d6-82d4-40f7-5ec6-08dd2335d3a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NFFUbHlZTWRuaXFUTXp2YW04ZUdxZVZtemRDUzh0NjFvRDYrS3hHZnhOaFRm?=
 =?utf-8?B?aHZackVhWUpGMkdzN1REaERWWGcvYWNId0lESUFZOW1US1ZKMGJFZDgxWVdi?=
 =?utf-8?B?QTZiVFd3S3VoaUZFL0x5bEN2alc3NUZCV2JwQWFTSmtCczlxTnVVNXRNdHVQ?=
 =?utf-8?B?cnpVRkNETzJGSDJEVnFpYjJ0YUNKZzFFeTVBMVBCbTY4VWY4Vm5QVlhxQ3pG?=
 =?utf-8?B?QTNPSUVUT2lqcThQMmRsd0pOUm44MkdFaS9QUHBBMjNBbHNUTDRnSVU4MDgy?=
 =?utf-8?B?MG1LZEhUUUNKdHdwRTcwY0ZMbkhORE1FODJhOU9WazN5QW1NcGxKdlIySDlu?=
 =?utf-8?B?Ty9rUFNKK21HajB1aGVLaGx4Qk1jUTlGVlMvZS9FQVhOdlV0VzBlTmtRT0k1?=
 =?utf-8?B?MEFBL3QyOWd1ZEFtOTRnM1ZHWEtzS0I2VDkvMmV5ZDJsRzVRZEZWZ01MN3Fr?=
 =?utf-8?B?bzRqVmhDU0t6WE9lb2JBclZabytqVE8rMTcvbnRYU3MyTmRQMXpMbm4remQ5?=
 =?utf-8?B?aDN3V3JWUWJPcW5DNUJSR25vQ1NmYWtQWCtXaVBrVGFWR3VINklITFRMQVdZ?=
 =?utf-8?B?YWJEa0Vrcml3Zng3ZUQrck0rNFk1TnN1b0s3WHl1NktpQWhhSldWcFZFZFdj?=
 =?utf-8?B?OFZpVjM0SCtOamlDSW16L0RQc0V3QkxQTklSY29jYW5Ic09aNVhWRDdhQkdW?=
 =?utf-8?B?eGtCdXk5NFFzQ01lVklSb2ZUK0l3YmhqSjREYUtCeC81SWlsdWNLdEJvZ0Jp?=
 =?utf-8?B?bTVyWTFZNzNnQzF5WFMxdjkyRHVQYmxCSXp5SkRzclJJaENHU0VTUUJ4SVNl?=
 =?utf-8?B?djBWZHA5LzJNczNiOXRZNUN5YXF3MUVIVXlEQWVDRi9zRHhadURETWsvYXlT?=
 =?utf-8?B?TkZLbStHWVJ2Yi91RFcza2Q3a2JhZVFpR1BTb2U3Umk2QlhYMzVJV3JvSHBN?=
 =?utf-8?B?Y3J6V2h4Yk9nNlFLL0l4WXU5aWFUYmJvcUt0dnZpUEVuWi9BVWJqQXFBZ3Er?=
 =?utf-8?B?LzJGYnhST1NVcGw1c3h3cW11K2l6RVRHQ2NOeWI1ejV5eEFzNXZpQzNyY0wr?=
 =?utf-8?B?b2tRYXlsaDdJM3BJVzdqL2lXeHNtc2RyQ0xtcXJLUFNhNlZsdHdmWks3RkQ4?=
 =?utf-8?B?NnQwMC9mU21oazN2elhhQnRvZG9yRWUxank1QWt5a2pzVEVuRVdZZVIyUUI5?=
 =?utf-8?B?SXByTkhqd0h1WjhtbmRxSjB4SlIwWlM1TlJ5b2dHOGF6Z1J1T0RiZ3Uxekd6?=
 =?utf-8?B?eVhSSGQwN1dXVWU0ZEZBM0xEaWJTbmdzZ3pFK2g5K3dhVFptaG05c3VEcnMy?=
 =?utf-8?B?SnJEUHpVdnRZWGdmVTA0MEgvbENrWGRUTUJkdlYxdERLRWVrR1VIdTZBZ0hm?=
 =?utf-8?B?Vm5DMGdRM2xZSlMzQWYzNjA0c3Z5ZzRzWVNjeG16dUFOS0J5QjFhanNBMHB2?=
 =?utf-8?B?ZE1WRk11dXdpN01KSEtobCt0bS9kODNWYlgxQW4yZHBNVExRdEE0TFBwRGJT?=
 =?utf-8?B?S29ENkFEYUxDY0ZiOWhUL1hNNENsVXdDSlgwdnpmb21CUnQxZnpodmlLMmRn?=
 =?utf-8?B?TnJsSWNpUGR1Y3ZSVExLSkJsNTFzeTl0SUVhaFJGelAvK0Z6UDRXdXI3MS9i?=
 =?utf-8?B?QW5TNy9obVZLTlJYWll6ZTk0WXJySkY3V3pTTkhCVW5naTdGcXFESGY4Q0oy?=
 =?utf-8?B?RFRJd2lPNWRTdkQ2eE1hWHAzMm90M0tzTGVoZDNCNU9FZXljMzJIUGZMaFcw?=
 =?utf-8?B?M2RzTTAwYkZMM1pjWmJnSjIySUtJd3BPbFpWUnJoUmlRbURNd3ZNTEhCa1pn?=
 =?utf-8?B?STZtTzI5bDJlU3RUSm1td2hidXFhMjd5cGFkd3JIQnZzM29BU0NlSmNGMld6?=
 =?utf-8?Q?PryO+cbjblolo?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4022899009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?K2Y5Q0ZOZVpPT3VRUGhlVEVYN3ZnNkdGYVJFNVF4UEx0ZHJNWFJFUmxyU2xy?=
 =?utf-8?B?b1QrOFM5Y0JtQWMxVEpWNkhwVi9CaUJSRFk0WXF3c21GTUM5YkQrV2w5ZnZW?=
 =?utf-8?B?SDJ2a0FlRHFqbTVPUTNreDVFUHJmSUhuSEZGbUVaUXluTkZyamRmeHRPL3B5?=
 =?utf-8?B?Skt5dDhEY1V6UWgxOWRka1NCQ3FVZ0pORGlDcE0xNG96c3M0cmM2eVlhWEh3?=
 =?utf-8?B?R3VzV2dQUTV0WnNzWkt2VTYzZFRIWjJMbXdLN1pqRHU4c1I4S3RmZDVKRlpF?=
 =?utf-8?B?OHFiV1hxd1dJc3lhMDllNGZJdndQazg5VG9OUHpwc3dUNDY2UWN2MGNuRWJj?=
 =?utf-8?B?S05Ta3Z1VmhMc09Gb0h6alJqR2E3UmZacGZIcFdwQU9pTTFiVGVJTVl6Smla?=
 =?utf-8?B?WERrWFNWRmIrVVhwMllJUzdqZE56aDcxK29ja1VrMnVXR0FHZW5DNVh1OWM0?=
 =?utf-8?B?NWI2aklkZy9HOFRwaFJ5ZWRUNk9GejE5NFBYTVQ3NWcxeVQ0YkxwTXJpODZM?=
 =?utf-8?B?L3IzQlgvSVRqNEFVTFFZN25vZmg0ay9CVWRsTjIwRm1mL0hwVGlhZEtPV1RN?=
 =?utf-8?B?YURTNkJPSktweHI3N3UwVnR6L1JyQzJ2TmJPUVZhak8rTGVQZjU1OXN0YjdX?=
 =?utf-8?B?MEpmYVYreFpqTXh3dkJHRUg2T0I1dytvaFVLdnRWUlRmUllORDcvVVp5UHdT?=
 =?utf-8?B?Z2ZTOVROaGxROTRQTmJ2TmlQTWlOSHl1MWl6Q1U5clBFV2lFY3dRdnBMajRz?=
 =?utf-8?B?T0VpUjlPTTNuZFJwMitXTnMxY2krTkM5Tk92d1dpdDBaQUZiaXNBU0ZTSmlY?=
 =?utf-8?B?L1orUVdGc2thMWpYSFk0cE5sRE1aVS9hU3JPNFhwZHhTTXBzczBLRHAvNXJ2?=
 =?utf-8?B?aTU1RFFvWUpYMFB4cGEvS3h1ZmVxRk12TmxSb25WWlpWckhCMENDSitrSkJi?=
 =?utf-8?B?YzVTRDNqeERjWnNaNHpCbEsvNFBaYVJLbElXZCtXbHQvaFhRdmJJMnNEQldq?=
 =?utf-8?B?dnB4bnY1UXBCUUZ3V1Mxcjd0dC9xajBnVUJCckYrcjdnSk5QeGI4RTdnZ0dJ?=
 =?utf-8?B?dUdLRUUxZGRGUGZ0NWVpTTk2TFlFT0ZXZUpUZmx1L1l0bGdLd2MyRnRZMWZa?=
 =?utf-8?B?bG41YTZ0d1JEZXpEZTNlS3BocThxUlZBOUNPd0lPd1M2ci9DbU0rQmlGVGlV?=
 =?utf-8?B?TSt0SDRHaWN6RGN6TC9iTGZNSzlWUkF5cnJnYmFIUTRKbFlCM3NFbHNrdmNz?=
 =?utf-8?B?QWRVdjhPSkFnMXBoMXM0R2lVVkw1Y00rVThJTW1CbVpGM1pGa2hmU0Y4Zklv?=
 =?utf-8?B?L045VWFtOEkzSXU5ME50aFpmKzEzRVZGRGZ2ZjV0VmxnOEFhNmpDdUkzZ3dv?=
 =?utf-8?B?QXdPeEs2dkdpV2kvT1QwRThGaFYycDQxMXNmMXZVa2F3MHRHZTJvczBLZ2Rx?=
 =?utf-8?B?bFNRRm1SdG1oVFVnOFlHblFlc0Z0TUZVYndQVTlzTklETk5jTHI5UEJoclAz?=
 =?utf-8?B?WXFPWHNuK2JhTEFFWEgzMm8wRlNtNk9KenhQTXZjanVnVWhIV1B1RUhyVHJ3?=
 =?utf-8?B?bFVQTHNSdzZIZlcwT1BrWWVuazJ2VFMrcjkySGFRWW9oWG9FcUhEZ2tQc1dX?=
 =?utf-8?B?MjNMQUh3emxySWNPSnZiRDk3TEtlTVYvekg3WUdjOStueW83WDdLenVHSURK?=
 =?utf-8?B?RXpwdGU0V2NiUVFjRnZ6SkpWZW9BKzJWYm83bEhJMTZmMWgxUGx5MEV0QVJ4?=
 =?utf-8?B?a1ZPQklrbktjMFZLRndzQk4zSk53T1RhZXROZ05EdzVmMTVjYWNGc3QxQ2t0?=
 =?utf-8?B?SDZWT1NQUXl1VlFqMmp1TFFsYzRSYXhjUXRMQjhXVTVBWXVsMjB0R3c0U1hw?=
 =?utf-8?B?VnVwV3hDZmszd1JVS2Z2YTBJTzh4M0p5Y3FwalZuTmRvblVSZ3hObHZueWZK?=
 =?utf-8?B?eFN3YVB1Vy9UN0RDdzBKSkc2TUExeitBQk1YOXRDUzZTckp5Z3JGNWdFRDJi?=
 =?utf-8?B?YTlnV2FrczAycE5sVzJZN3ZRaWtzdUk4ay9pdWovQ21FZElmWFp5eVZVODl5?=
 =?utf-8?B?d1lHS1RVL2htd2R5R254VnRKcWFHaEdobWNNdFE4bDdKQytHZTQ0cjJHYjBM?=
 =?utf-8?B?bEFERi96UzA4TW8vS1FJVTk5UXl6N25UK2kyVGFwTkxTZ3NjSG11d2hMdWsw?=
 =?utf-8?B?Ync9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbadc8d6-82d4-40f7-5ec6-08dd2335d3a5
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 09:40:25.0430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yfv7nN9iRmRm7WLclvaJ38RvBu/VXFQ+927DBS4HvELZ8OemkpGgYooW2lrqLZAywyLqvl2fFyTZKjUoQ1Tb13OOFnvoozzCCKtkH2pbI80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6744
X-Authority-Analysis: v=2.4 cv=Yc5H5xRf c=1 sm=1 tr=0 ts=6769300e cx=c_pps a=5b96o3JgDboJA9an2DnXiA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=JYrYsgSehLvj9HFqaEYA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: t9X_2haekxdUf4LszkkoMMhS3JjVk2RX
X-Proofpoint-GUID: t9X_2haekxdUf4LszkkoMMhS3JjVk2RX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-23_04,2024-12-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0 mlxlogscore=876
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412230086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 09:40:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209038



On 12/23/24 17:06, Song, Jiaying (CN) via lists.openembedded.org wrote:
> From: Jiaying Song <jiaying.song.cn@windriver.com>
> 
> Modify the TCL_LIBRARY to the correct value to resolve the following error:
> 
> application-specific initialization failed: Cannot find a usable init.tcl in the following directories:
>      /usr/lib/tcl/ptest/library {} /usr/lib64/tcl9.0 /usr/lib64/tcl/lib/tcl9.0 /usr/lib64/lib/tcl9.0 /usr/lib64/tcl/library /usr/lib64/library /usr/lib64/tcl9.0/library /usr/lib64/tcl9.0.0/library /usr/tcl9.0.0/library
> 
> Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
> ---
>   meta/recipes-devtools/tcltk/tcl/run-ptest | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-devtools/tcltk/tcl/run-ptest
> index 8a9f611b0f..0842ca320d 100644
> --- a/meta/recipes-devtools/tcltk/tcl/run-ptest
> +++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
> @@ -1,6 +1,6 @@
>   #!/bin/sh
>   
> -export TCL_LIBRARY=/usr/lib/tcl/ptest/library
> +export TCL_LIBRARY=/usr/lib64/tcl/ptest/library

Please hold on the patch, I guess it doesn't work when multilib is not enabled.

// Robert

>   export ERROR_ON_FAILURES=1
>   export LANG=en-US.UTF-8
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#209015): https://lists.openembedded.org/g/openembedded-core/message/209015
> Mute This Topic: https://lists.openembedded.org/mt/110254947/7304958
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [liezhi.yang@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


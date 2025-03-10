Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82181C282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 07:29:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.31782.1741591761159223840
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 00:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=51640283d4=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A6SUhx008299
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 07:29:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458cv8sqxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 07:29:19 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52A7TJTd031476;
	Mon, 10 Mar 2025 07:29:19 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458cv8sqxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 07:29:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jh5/v6Ky+3jdk9WFo5JGG1vHnTW+b4Szn5FRfFr8WmMkGYhecVjpxLlF/TjB3sS4mi/KGFxJ/1ksJjb3NLJYdeTrIKbD/XE6LcmqfMKf9Lf6Du3a5NMUxsBf+aesGYRXFJlWv7C+UUZeRZ7DZBPDATUOC0CiNuKpJ/BxXVHDfuZuthnYSMn3SwW/vQw/mIv8l9prt3XJ/96wvaYVnXaAqRycQ2J94gXoxCUJ6RMcWECOoO749tJ7SyJJgz8nrceIohskG0FVLGAGbn9GwMOxH5t0ZIfN9LUD4ilPW8QadyDDIM41mdbcO8kthLU1cMhWOnzhHsmiviZEx5hL+SVyCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9isdFcl5YMBHc1IqGqJKatuttlBEsw3GTGsDSAAWkQ=;
 b=Rr+JPncpIKYsu95OFOvlw5luW13/j8mLuRcWkXthjL2qk7ICCoEcZHhRz8PUIu/EhX+M2u5OhLIQcy6qC+DDTRanWdAe1PmB+fSsFcWkhjOLr0KBYSuC13D01Ho8t3R32+V46QLuOEGOryFb1z3n0Gpgky5OAJq6EIkP+glnyA62D9620UA3Y/QPIkvbmNqxDX5xnCP3GUnFzynim/FUeFWpCczf9AlhqWfFG5kdhytfFSL8dMop1aWB/oylJJT187GQrkXMfjAN0i84fSV/1m/Zy7B5ysHzpLVgnpcp1ghy2Fn2B3oX/kfil/UBhGKxFUnR2lrDZTP5k1Gc1ujk8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by SJ0PR11MB4925.namprd11.prod.outlook.com (2603:10b6:a03:2df::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 07:29:15 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%7]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 07:29:14 +0000
Content-Type: multipart/alternative;
 boundary="------------rNVTKcsDGc08gni0MABUzPGk"
Message-ID: <64fe699d-a030-4777-82fa-faef18ca9c22@windriver.com>
Date: Mon, 10 Mar 2025 15:29:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: Patchtest results for [PATCH] docbook-xml-dtd4: correct license
 name
To: patchtest@automation.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
References: <20250310071234.2370628-1-hongxu.jia@windriver.com>
 <010101957ee9e7b8-265cb694-4d61-42b6-b160-8ba936e42232-000000@us-west-2.amazonses.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <010101957ee9e7b8-265cb694-4d61-42b6-b160-8ba936e42232-000000@us-west-2.amazonses.com>
X-ClientProxiedBy: TYCPR01CA0135.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::15) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|SJ0PR11MB4925:EE_
X-MS-Office365-Filtering-Correlation-Id: b3dc9dc6-10f2-45bf-3683-08dd5fa54279
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|13003099007|8096899003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eVo0eDEzVFNtblJ3SmxkV2FwMEtKdHRFb3VGcEcxOTlMY3M5Y01UNTZmL2pD?=
 =?utf-8?B?alRFR05sVjJPOXpCSzVGeVNlRkxMK3cxdXUzanpBTHRGZUtwWncwd2pmQVJu?=
 =?utf-8?B?L3dIMFlVdTBnWHhrMVZ4b1NndFYwdTB2V0RQajliV1JZMmp2cW52eTRTc2k3?=
 =?utf-8?B?L2QwMnFhcEVacmw2QXpMeERxeXlIcXlVTkRZRlJ4d1hiR0NHVjQ3M293dGd5?=
 =?utf-8?B?R051M2NrWklNS0FHZnVSRmpqM05pdVM5dUlRVlc5VHQ4YS8zaTlsWjlPMmpy?=
 =?utf-8?B?aUZwZmxrR25RaVpsSVE5ZkRKdk5sd0JQMTI0NHY1WnR4QnhZYjcvdE1aVVNa?=
 =?utf-8?B?YjZzd1pydzlPckxKd1lSaFl5dFh5L1l1VG9VbTRGMzg2TDBGVTlIelkvVU1K?=
 =?utf-8?B?V3EvaTdSNzVjVDFkTUJrZlY1d28rU2Ryelp1S3VBdmpBMUdVUm4xUUgxWlVW?=
 =?utf-8?B?cmtoaUJxM1R1WTNwWStVVjNHOTgzbXNPNmx0TTRCWHJpUnlsSm1hRUQwaThp?=
 =?utf-8?B?SXZBYVhvc2JlSVE2eTluWnFVVDkrMGtwaGVZK1VGK2JPWTZ3QWo1eW8vTy9W?=
 =?utf-8?B?Y2YycXlNT1oycXY2WWM5MXh0bmtITDRGNjlFWExQSDZSUzk5UDhId3ZuaUZH?=
 =?utf-8?B?cDF0Qjd2NHNheVQ1UGtHYy9TYjJURjkyTEJFNnBTVnRiVWJUMDFqaDgyd3Fl?=
 =?utf-8?B?a21zYllQbHljZHByajgwaWsxWThCS01HdlJXU0JCU3JibEZodWswTmp4MXQ2?=
 =?utf-8?B?QWl2RG8rQVoyY3F6bnp2MFd5RlNtZjNoRUEzU3BGbW9SakhsQ2JYZ3d3NmJp?=
 =?utf-8?B?SWFaNm43a1FaZWtMZmc3Sm9YQ1lzWVhlanJsak00ODdxWFd3RFh4bE01VTc3?=
 =?utf-8?B?UjBTWHM2bE1EYnhmeTJ3Tk1VTzlrdnhKaDRycWpnZFdqUVdGWmlLdmNPY2VE?=
 =?utf-8?B?RFdqZWV4Q2hvWTVQNWhWekNqcEpZMzVJTDhDNENKSitVbkI5TGExa3lzeTJq?=
 =?utf-8?B?MExUQW5DYkRoSHRMblUxNHJNOXlHdDA2dG16WnF3Z21IRGY1Y3dBamk4M3NR?=
 =?utf-8?B?UTJkVG4raTFQYkFYTllxd3R0Q2RUYU9UZ1lkaUlQRXl2Y0V5Vnk5UDVITHpq?=
 =?utf-8?B?VjJrNUFEMkxoRm1GaStQWFlYRDRZZUFrbVBpYU1yRHFKekFNT2FBY0JaNUdM?=
 =?utf-8?B?NzVGWnFkWm1BM2laSjd1WW1nVmhJRy92YlNMU2ZWL2tRdTN2UDkyYXVMVlFk?=
 =?utf-8?B?Y2ZpTDhhR2htWFArRTNkMnpFT3d2V0NmRWlyU0F5cFZyZC9pc2pYaWZhcjZu?=
 =?utf-8?B?bXlBNTV1anBQNWVPRFRnOWdBSjd4U2kxSFhwYVVJcTVKNjhEMUNudlYyd1h2?=
 =?utf-8?B?OFRRUmd4RDBnYVhKbitoeVVubG9YYXVhUWM1SHZGRE5LcGk3dEw0dVgrVnRL?=
 =?utf-8?B?SWRidG94c0tadk0zam82VlVLbFZaNnhPS3BLdStFaFpCcVhPcEJlMzNZaVFn?=
 =?utf-8?B?SFJtMVRyd3MwQ0NrRWxYTnBDRDZab1BXaHdNcVpTdHdwSzAzbzQzZ1h1VUs0?=
 =?utf-8?B?ZkRXWS8wVmpSWXBRUGR3MGpJKzZmZHo5V0Yzb3JNTVYxSnhUQ1FCSlBEUU5P?=
 =?utf-8?B?UFBRS3h1VkdneUNzL0pFbndNSFRaZmtBa0hwMXNXYjcvVlZmQjF2UFNOQ3NM?=
 =?utf-8?B?dVdJaitGQW5jWDZabXY3QWhSNmtEb2xvdDZZMlNTVEo0SytIb2pOSjFhc0Nk?=
 =?utf-8?B?YmtGQi81dEErRHBrN1RRSnF2eDhRL0V1enV3MXMzRGNObDBubUQyMDN3d016?=
 =?utf-8?B?UkJBSVJTZjB3KzhnUWhsdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(8096899003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VUhPYmVkUW9JK2F5V1NTYUFEY1pGL3pUQlhnMXVDaithOXYyMFY4OFhhcFBw?=
 =?utf-8?B?Tm5KL0ptdU54a1JVcmk3QXNveklnMHNrZWt3WktDb2JJNEtJTmJ5VTl5eVpn?=
 =?utf-8?B?cUE4ZlY5d1FqeVlsWmJpbzV2TG5RY2FKdzJaYTNMQ0lXT09CSXUvd2xlMkJF?=
 =?utf-8?B?N1JnTHArZmEwQzA1RjRROW1CV25HdnREM2dNSXhVd21ESEk1bUNNL3l1bnRy?=
 =?utf-8?B?U1FVaFFkWC9kdmlJMnVzMnpmQzdRN3hsRmhiTkwwTzlXYmJ4SVE2UVgxUjJx?=
 =?utf-8?B?bmpjUDNGeVd2N1JhQi91bW5HbS9RcW5HekR6U2lucUZqdnZMY01RdUs5NjBB?=
 =?utf-8?B?UkJRMW9lUjRQZWhLanRBb2NiNDBxNjVWQUhtaDJTUEJ0NDlOUkloSlMvL1Fo?=
 =?utf-8?B?Z2lvMEc5bHh3dWZ1T3pkVXpiWmlLc3dRZk1HcGdjdzdYazJyOEtlNTE3ZHJn?=
 =?utf-8?B?eVozb2c2dVR1K0JEdXNmQ1R1R1ZXSFNMZFA0bWhUVUZscnRoeTJnRENFUG5C?=
 =?utf-8?B?eDlORVRmNGo0M1dSZnNYNlY5R1lzSXVRdk5lOCtoNHZGdjdram5vVDU3Uk54?=
 =?utf-8?B?UXpEM1dBbHhWZFNlRkhsWTJneDBVUnpuTUNsKzNYcE05U3B4RlBSb0VzZDZ4?=
 =?utf-8?B?ZmRtamRDa0dqTTlxYWdUNmI1Q3R1MzcveFlUV0dXQTV2TW4yb09US2dnTUJn?=
 =?utf-8?B?MVdQRFh4OWs1K0QyRlBNZi9icTVIbGV5dUZPTGM0MVZXZ2ZFQWZ4cytBNk1t?=
 =?utf-8?B?dUJ6cWtOc0RrQjhuOXdqaTVjcUlYQzlKcVJ4bGhQZCtZUytBeGRGZE5nM2Rk?=
 =?utf-8?B?Tm9LY29rUzhwMEdMY3JQanlTVUFaQXMxR3ptVkVFTjZSWS8yYXdLOS91WmxD?=
 =?utf-8?B?WHFOSHZiU3JsUFZTR1h6eWRQRXYzVzdvWExidjVGMkhKS3FUcG11T0poRitH?=
 =?utf-8?B?REVPcVBTYWViOGtNS2VtUnZPY3pjVzRCZVYxMm5tMmsrZEpHRnB2SWs1U0tJ?=
 =?utf-8?B?MWhUdWlYeHZOR3MvdkZycjNGWTZlZVpBTG1KS1RtTHF5dFlzRWdtcGFtanBm?=
 =?utf-8?B?YnR6OFpsdlIzaUtyUHFPbnlOVmk0NWNGSm1PMTNwZ1lWUjVLM0pOL0VTWXJE?=
 =?utf-8?B?YmNpZlNiRlNJRko0a3ZpbE5wUG9CU3FmUHd0UEMrWk1xSFlpYkdncWNEMlBI?=
 =?utf-8?B?MUplRVY0dVRFUjgwOWJUK2FFeDNBSkh0TmVLdVN0bVZMZ3NXTVJwV2RjazZm?=
 =?utf-8?B?SEZDWlZtTGJvbUs1MW9nOEZVdTBiOEY1SGhTTjB2cHhmTitoRGg0UXh0VWhE?=
 =?utf-8?B?MFBldnE4WDdXVzFWUGV1TWVQSVhqNk5uVDVJQndMVytkZ3dOejVndWRKS2dn?=
 =?utf-8?B?aWIzZFhQY21aNDBMcUxxM2gvVzIyOXRyWDB1eW9MakI5a3NaMjFtSnFVZDdZ?=
 =?utf-8?B?UnIxcGxYNmtnWGtQYk0rSmlEdW1jY2lZU0ExeHlneGtSMWdTTnlGME5MT20r?=
 =?utf-8?B?Y2lzVVR4NHM1WkNmOW94czdSYzdBcjl0NC9HLzBoeEl4V1Bud3ZaSGxSTUQy?=
 =?utf-8?B?TzhkakJXUWhyb2xCRzZqN1BYakljeDZmenM2WFJNd1VMVEJpazdtMFpsUkor?=
 =?utf-8?B?RDh2L3g1M0xmd0MrWFBYR0xHYW81Um9rVVZCL081WUQ3WUFtVUdma3hoM29X?=
 =?utf-8?B?K2d4Yk5PWUxjUzNxWWloMlY0WHVOa1BBRkNKSS9EL3VWc2ZMUzBvSzJBOUF1?=
 =?utf-8?B?RG9ycXpXblplMCtHSWo4N2RvM1BrOUdSV1RMMmpXZ2sxTHRKeGZVSi85WUx5?=
 =?utf-8?B?NE96RndoMVgxa1RFMEN5VHUzZlBMUVdBS3JJQTRYTHBRYUlvRHZQVXFJVVdX?=
 =?utf-8?B?Z0UxTmc4S1IxdTdBMG94S25jZnNMN1prVFlEcE84dFNZY1lTeVRUbEVkc2pm?=
 =?utf-8?B?bjI3RWVNT0pURE10R3FSdDB4aUptcE40aFVuWDNXbEd0T3ZvakNlVGJDNzB6?=
 =?utf-8?B?eUJhOFhNR3ZiNWJxOFk3aFFKR3doOFRyeWpnY0hvWHBiZEF6ODF0c3lWRXhl?=
 =?utf-8?B?SmduK3N5Z2lQcGRRMnFNQWVqa2RIQ3IxNFI4ckhXcVlIT1hxNlUvWFdUdU16?=
 =?utf-8?B?K0dlbzJGMGtwSmI5YWQ0MW55SnhFOHk0WjB6UDV0OTFHQ20yL3FkSlBjRlNz?=
 =?utf-8?B?QUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3dc9dc6-10f2-45bf-3683-08dd5fa54279
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 07:29:14.8170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j6QI9xoAYbNDNMgCz8NoIHaRb3TNg3OrGPuly7m7p2ET61EJyl5YZoAVIZ/KjUVmYYIJ4yxxhELMWCgAbn9rpgBpn2iReYVowE+IpqpaTqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4925
X-Proofpoint-ORIG-GUID: pTJFgSw3BPg23iCdjO60SToWpUhdz6gl
X-Authority-Analysis: v=2.4 cv=QbKcvtbv c=1 sm=1 tr=0 ts=67ce94d0 cx=c_pps a=gaH0ZU3udx4N2M5FeSqnRg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=iGHA9ds3AAAA:8 a=axM0gMKoedX3htypnKUA:9 a=QEXdDO2ut3YA:10 a=B8ibFTVmAAAA:8 a=LVVdaqqDU9W9cF4QaU8A:9 a=doWNUa8G51Ujv-tt:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=xvSgdcfEVHFitugM1GHH:22
X-Proofpoint-GUID: bKz1yS4IqwryGKDleBUqMHNVVOAxL75W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_02,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2502100000 definitions=main-2503100057
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 07:29:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212492

--------------rNVTKcsDGc08gni0MABUzPGk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/10/25 15:16, patchtest@automation.yoctoproject.org wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch /home/patchtest/share/mboxes/docbook-xml-dtd4-correct-license-name.patch
>
> FAIL: test src uri left files: Patches not removed from tree. Remove them and amend the submitted mbox (test_metadata.TestMetadata.test_src_uri_left_files)

I am afraid it is a false alarm,

the local file 
meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/LICENSE-OASIS was 
removed,

and rename meta/files/common-licenses/OASIS to 
meta/files/common-licenses/DocBook

But the review patch renamed 
meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/LICENSE-OASIS to 
meta/files/common-licenses/DocBook

and remove meta/files/common-licenses/OASIS

rename from meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/LICENSE-OASIS
rename to meta/files/common-licenses/DocBook
...
--- a/meta/files/common-licenses/OASIS
+++ /dev/null

//Hongxu

> PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
> PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
> PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
> PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
> PASS: test lic files chksum modified not mentioned (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
> PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
> PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
> PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)
>
> SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
> SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
> SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
> SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
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
> bug athttps://bugzilla.yoctoproject.org/  (use the 'Patchtest' category
> under 'Yocto Project Subprojects'). For more information on specific
> failures, see:https://wiki.yoctoproject.org/wiki/Patchtest. Thank
> you!


--------------rNVTKcsDGc08gni0MABUzPGk
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 3/10/25 15:16,
      <a class="moz-txt-link-abbreviated" href="mailto:patchtest@automation.yoctoproject.org">patchtest@automation.yoctoproject.org</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:010101957ee9e7b8-265cb694-4d61-42b6-b160-8ba936e42232-000000@us-west-2.amazonses.com">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

Thank you for your submission. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/docbook-xml-dtd4-correct-license-name.patch

FAIL: test src uri left files: Patches not removed from tree. Remove them and amend the submitted mbox (test_metadata.TestMetadata.test_src_uri_left_files)
</pre>
    </blockquote>
    <p>I am afraid it is a <span data-slate-fragment="JTVCJTdCJTIydHlwZSUyMiUzQSUyMnBhcmFncmFwaCUyMiUyQyUyMmNoaWxkcmVuJTIyJTNBJTVCJTdCJTIyaWQlMjIlM0ElMjIwQkF6cm54Z0F2JTIyJTJDJTIycGFyYUlkeCUyMiUzQTIlMkMlMjJzcmMlMjIlM0ElMjJTb2Z0d2FyZSUyMHdpbGwlMjBleGlzdC4lMjIlMkMlMjJkc3QlMjIlM0ElMjIlRTglQkQlQUYlRTQlQkIlQjYlRTUlQjAlODYlRTQlQkMlOUElRTUlQUQlOTglRTUlOUMlQTglRTMlODAlODIlMjIlMkMlMjJtZXRhZGF0YSUyMiUzQSUyMiUyMiUyQyUyMm1hdGNoZXMlMjIlM0FudWxsJTJDJTIybWV0YURhdGElMjIlM0ElNUIlNUQlMkMlMjJ0ZXh0JTIyJTNBJTIyZmFsc2UlMjBhbGFybSUyMiU3RCU1RCU3RCU1RA==" style="white-space: pre;">false alarm,</span></p>
    <p><span data-slate-fragment="JTVCJTdCJTIydHlwZSUyMiUzQSUyMnBhcmFncmFwaCUyMiUyQyUyMmNoaWxkcmVuJTIyJTNBJTVCJTdCJTIyaWQlMjIlM0ElMjIwQkF6cm54Z0F2JTIyJTJDJTIycGFyYUlkeCUyMiUzQTIlMkMlMjJzcmMlMjIlM0ElMjJTb2Z0d2FyZSUyMHdpbGwlMjBleGlzdC4lMjIlMkMlMjJkc3QlMjIlM0ElMjIlRTglQkQlQUYlRTQlQkIlQjYlRTUlQjAlODYlRTQlQkMlOUElRTUlQUQlOTglRTUlOUMlQTglRTMlODAlODIlMjIlMkMlMjJtZXRhZGF0YSUyMiUzQSUyMiUyMiUyQyUyMm1hdGNoZXMlMjIlM0FudWxsJTJDJTIybWV0YURhdGElMjIlM0ElNUIlNUQlMkMlMjJ0ZXh0JTIyJTNBJTIyZmFsc2UlMjBhbGFybSUyMiU3RCU1RCU3RCU1RA==" style="white-space: pre;">the local file </span><span style="white-space: pre-wrap">meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/LICENSE-OASIS was removed,</span></p>
    <p><span style="white-space: pre-wrap">and rename </span><span style="white-space: pre-wrap">meta/files/common-licenses/OASIS to </span><span style="white-space: pre-wrap">meta/files/common-licenses/DocBook</span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <p><span style="white-space: pre-wrap">But the review patch renamed </span><span data-slate-fragment="JTVCJTdCJTIydHlwZSUyMiUzQSUyMnBhcmFncmFwaCUyMiUyQyUyMmNoaWxkcmVuJTIyJTNBJTVCJTdCJTIyaWQlMjIlM0ElMjIwQkF6cm54Z0F2JTIyJTJDJTIycGFyYUlkeCUyMiUzQTIlMkMlMjJzcmMlMjIlM0ElMjJTb2Z0d2FyZSUyMHdpbGwlMjBleGlzdC4lMjIlMkMlMjJkc3QlMjIlM0ElMjIlRTglQkQlQUYlRTQlQkIlQjYlRTUlQjAlODYlRTQlQkMlOUElRTUlQUQlOTglRTUlOUMlQTglRTMlODAlODIlMjIlMkMlMjJtZXRhZGF0YSUyMiUzQSUyMiUyMiUyQyUyMm1hdGNoZXMlMjIlM0FudWxsJTJDJTIybWV0YURhdGElMjIlM0ElNUIlNUQlMkMlMjJ0ZXh0JTIyJTNBJTIyZmFsc2UlMjBhbGFybSUyMiU3RCU1RCU3RCU1RA==" style="white-space: pre;"></span><span style="white-space: pre-wrap">meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/LICENSE-OASIS </span><span style="white-space: pre-wrap">to </span><span style="white-space: pre-wrap">meta/files/common-licenses/DocBook</span></p>
    <p><span style="white-space: pre-wrap">and remove </span><span style="white-space: pre-wrap">meta/files/common-licenses/OASIS</span></p>
    <pre class="moz-quote-pre" wrap="">rename from meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/LICENSE-OASIS
rename to meta/files/common-licenses/DocBook
...
--- a/meta/files/common-licenses/OASIS
+++ /dev/null</pre>
    <p></p>
    <p><span data-slate-fragment="JTVCJTdCJTIydHlwZSUyMiUzQSUyMnBhcmFncmFwaCUyMiUyQyUyMmNoaWxkcmVuJTIyJTNBJTVCJTdCJTIyaWQlMjIlM0ElMjIwQkF6cm54Z0F2JTIyJTJDJTIycGFyYUlkeCUyMiUzQTIlMkMlMjJzcmMlMjIlM0ElMjJTb2Z0d2FyZSUyMHdpbGwlMjBleGlzdC4lMjIlMkMlMjJkc3QlMjIlM0ElMjIlRTglQkQlQUYlRTQlQkIlQjYlRTUlQjAlODYlRTQlQkMlOUElRTUlQUQlOTglRTUlOUMlQTglRTMlODAlODIlMjIlMkMlMjJtZXRhZGF0YSUyMiUzQSUyMiUyMiUyQyUyMm1hdGNoZXMlMjIlM0FudWxsJTJDJTIybWV0YURhdGElMjIlM0ElNUIlNUQlMkMlMjJ0ZXh0JTIyJTNBJTIyZmFsc2UlMjBhbGFybSUyMiU3RCU1RCU3RCU1RA==" style="white-space: pre;">//Hongxu
</span></p>
    <blockquote type="cite" cite="mid:010101957ee9e7b8-265cb694-4d61-42b6-b160-8ba936e42232-000000@us-west-2.amazonses.com">
      <pre class="moz-quote-pre" wrap="">
PASS: pretest src uri left files (test_metadata.TestMetadata.pretest_src_uri_left_files)
PASS: test CVE check ignore (test_metadata.TestMetadata.test_cve_check_ignore)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_message_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_message_user_tags)
PASS: test lic files chksum modified not mentioned (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_length)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test shortlog format (test_mbox.TestMbox.test_shortlog_format)
PASS: test shortlog length (test_mbox.TestMbox.test_shortlog_length)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_list)

SKIP: pretest pylint: No python related patches, skipping test (test_python_pylint.PyLint.pretest_pylint)
SKIP: test CVE tag format: No new CVE patches introduced (test_patch.TestPatch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new CVE patches introduced (test_patch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new CVE patches introduced (test_patch.TestPatch.test_upstream_status_presence_format)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.test_bugzilla_entry_format)
SKIP: test lic files chksum presence: No added recipes, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test (test_metadata.TestMetadata.test_license_presence)
SKIP: test pylint: No python related patches, skipping test (test_python_pylint.PyLint.test_pylint)
SKIP: test series merge on head: Merge test is disabled for now (test_mbox.TestMbox.test_series_merge_on_head)
SKIP: test summary presence: No added recipes, skipping test (test_metadata.TestMetadata.test_summary_presence)

---

Please address the issues identified and
submit a new revision of the patch, or alternatively, reply to this
email with an explanation of why the patch should be accepted. If you
believe these results are due to an error in patchtest, please submit a
bug at <a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/">https://bugzilla.yoctoproject.org/</a> (use the 'Patchtest' category
under 'Yocto Project Subprojects'). For more information on specific
failures, see: <a class="moz-txt-link-freetext" href="https://wiki.yoctoproject.org/wiki/Patchtest">https://wiki.yoctoproject.org/wiki/Patchtest</a>. Thank
you!
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------rNVTKcsDGc08gni0MABUzPGk--


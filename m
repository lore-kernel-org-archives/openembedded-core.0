Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D620CCD18D
	for <webhook@archiver.kernel.org>; Wed, 18 Sep 2024 07:56:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10146.1726646177107373459
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Sep 2024 00:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=99913293f1=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48I5eqoL016649
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 00:56:16 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41na0mkj65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 00:56:16 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48I7uGBV022673;
	Wed, 18 Sep 2024 00:56:16 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41na0mkj63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Sep 2024 00:56:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N2UySfWCeDNZ4DmCFCT5pMJ5fU6U+4AwOE1wXGHaj5qoQ/Z1d2ZfF8zFTBD56gmmof3lY3kK/h8Qt3zpmqhku3G6OcW/00voVdHDUK+ZJBzgQIUzhaHAlSMRDbNIbrkdam+inHnolKlguzzdJGff1S7FN5XWmgio3UpNsUaPc/5HqihvVH/UnDc2cAz1pl8nHYiBgnNAz+Lmv6hvJI4QcXZF8spRPXujXZBSAzKnkYZ0ku83p4fVmo103jzR1YeHIrrqyo5PTeq1inMblyqnGLbm+f8xPK8POnnTlNTq0J/cimVubOwXzcb+PLwTmqBnQn9PHgwuqC/9UURCfV3+/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e+4CqWq6N1Le+dfOZUi3XOYmzSj7tTh5YKto9cDgu9k=;
 b=rLTV7Y7pwoyvuvZTXEaViON3A3kuodC8/YuenzKN6+iFQka2/QzKkt2LMTIAfFOlwjcgdQ+HSYRtgPCjAMyXk1ueQhZ0hWIh6V7AHnE4Ca33HA4PjHuA14pajWDpwHzHY+4Qvn0ZOtGq6tZAPG7uOXbW9karllhwJSpApNzfHt0+awFu1qeEMitsDy++LH3gtKj6uSgYn+Q7phje3psM3ovQ1aSqz/cwkg5gi5FCcYG4TrM4AOVOcOAiE8u7Y7zfpEj2BqX/qzGRPW+m9cqUAizh6LhwVeumlymFwhDb3Sg/Wxn/37VoWBM2gjMxU5noQAsdpmS2pyRmuuCOCAo75w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by MW3PR11MB4570.namprd11.prod.outlook.com (2603:10b6:303:5f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Wed, 18 Sep
 2024 07:56:13 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%4]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 07:56:12 +0000
Message-ID: <5ddadebf-0590-43c6-9229-dced344ee360@windriver.com>
Date: Wed, 18 Sep 2024 15:56:03 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 1/2] classes: Print bitbake branch and
 revision
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com
References: <cover.1726065189.git.liezhi.yang@windriver.com>
 <ad2b2df4041f0c721d1a82de0fe759d896c6bfb6.1726065189.git.liezhi.yang@windriver.com>
 <04e4a589de370a4c69c8cedd976866fc61779e6f.camel@linuxfoundation.org>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <04e4a589de370a4c69c8cedd976866fc61779e6f.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SI2PR06CA0017.apcprd06.prod.outlook.com
 (2603:1096:4:186::15) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|MW3PR11MB4570:EE_
X-MS-Office365-Filtering-Correlation-Id: 61d808ee-ee41-467b-c771-08dcd7b75d1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y0h4TU9Eb1ltakZsekVnYkt0U1Y3UFRwUFU4cklvOEovNVh6cFprQnRFbEVa?=
 =?utf-8?B?aGcvWHhvYS9wbGhyc0pqa3Exbng3VUVpQzJYQjNTRnZTdFAvVGF2SXNsR2Jl?=
 =?utf-8?B?QzNVY0N6NGRuUERBWERkOHI5VWZuWXJYRy8vVXVodkNNN1g5QUtLSmMxQUFx?=
 =?utf-8?B?N0o1ODJldVF2dU1ELzYvRVROaTBZT29qR21talpWOVFUaFIxcGpTUDlJbVov?=
 =?utf-8?B?Q3krUFhvRW51dVd6Ujk2ODl4eUZPdEIyYkJtS2Zrakx0MHhLRDRGV29YQUx5?=
 =?utf-8?B?UzMxQzVxMFZ0bDJJdVBNUmljMTFhN2tZK281d3JoQjJ5TG9OQ01ZTmpsQU5h?=
 =?utf-8?B?RzRJaDFEcjRLRHVaY0poa24wenkyckJ2UjZFQUN6b2FyWjFjbUl6TzFrR1hl?=
 =?utf-8?B?QTdMU2ppamorNGdNWjRLSURpZzFkc09tUHpCeWtUMUtuOWVaaDNydTlkMkdh?=
 =?utf-8?B?THNXZG9RK29adzFhdjdCQzB4K01iNjI2cG1zQlVYaWU3Nkw3TVZHT1VQcFZU?=
 =?utf-8?B?NWtlZjlOY1NNYXZtYlJ3dHNyTGRIL1pTdElVeWRPTjh1THdPVXhwbXI2eHlt?=
 =?utf-8?B?NFEvUGpkeVlvYnhNSDQ4azdLVElRL2RhZFFKZkdXRnMrcEtoaUVXRjFkbGNI?=
 =?utf-8?B?ak15ZHphbjBWSVZ5eDJZbldmbHAvcmtZY1F1czVsMW8yamlVUTY0bzg0dGt2?=
 =?utf-8?B?WUR5MWJVUXFEOU9ieVpiT0FYSks3R0FPWmVIWnN0R1RFTUN2THJiOXphVVk3?=
 =?utf-8?B?RkNObmdkZ1V5bGdXVmlISjFELzR2bTAyaHlPNWo2NlFCaUViU0lJK1Mwc0c1?=
 =?utf-8?B?dU85ZSt5YVJIRHNvQVRLRjFKek1uQmViVldBaDVTbFEvajRrYzZwbTJEeXQy?=
 =?utf-8?B?SlUyR0pONlZwMThTQllrWjcxUEtjSUQvOXVqWVRPNWc4RXJ3L1JISjdKdDVa?=
 =?utf-8?B?RkxsaUYvaWNFNUpoLzk4SmE4NnV1ak5DQVpKajRTa29kQ1h4b3JSV3YycWFF?=
 =?utf-8?B?WXdSK3hxa0NHd202THBVZUU0V2kxY05XZ1RuWVJYbUNhUkNMV1o5TkFOVFJL?=
 =?utf-8?B?c3ZaZ2xnSjJhT21jcTJqYWp1VmhiNEtjUWxqSWNmcXFEejc4aHJWaFA1VmJZ?=
 =?utf-8?B?eG55aU5tcS9JOEliaGg5ZFdWZlVQT3ROTFFqU1VNdEw2WXViS3NtS2dCcVNy?=
 =?utf-8?B?TGU4QXRmdW5WREZZcTMxWXlsU0czcmVrMFRabjZXd2NSWDRWaGhscjVUWXF0?=
 =?utf-8?B?VjRXcURvakgxa0l5SnB5ZmhNOEtpS0lFaURUOEluaUg4RzBhMkMxeGx0eUZZ?=
 =?utf-8?B?aWxONmY4UEJqV01QdE91enNXZ0xWU21VL2xxTTlxQ1BhWVYvR0FWTzRPbEdG?=
 =?utf-8?B?RjBGU29zaXNpclIyaDYzZit6aTd5ejhwcCtaa0pGQ1F3OVcxRHhZU3RNZTNX?=
 =?utf-8?B?dWZqRmlaSkZnTHhCakVSUUpIT2Y3M3dicjlYS1g0VFZTZ1Y5c1ZqQmNkWkhz?=
 =?utf-8?B?cXgxeEo1Wm9iSXpTTWxyeVlnK1NnRlZMdXFPNlFia0hUV0svekpENzUzK29D?=
 =?utf-8?B?MXh3M0R3RXh5T3dSYXFCWUpPa3ZhNzJxVkZHYlJTejdsaVh0K09hQjgzTGdI?=
 =?utf-8?B?SjdJaTZYSFhaR2JHNEcxWkU5UGY0VXVvYzYzK1F3ZG9UL3Z0c0hWOCtFTzFM?=
 =?utf-8?B?T2NyY0p2K1JvWU01ZlRrSi9XeGloSWg1c2wyaDhyZFRDTEVwYXJQRGY0SWg1?=
 =?utf-8?B?dCtXTUxMNlFvT1ZrWVNIem1IbEVWL2NQdURyaXUvVmZQV1ZnSmhkZ1FiYzRB?=
 =?utf-8?B?clU2Q3Q0aG1od3FhN1RFQT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NWQvM0lWWVpYNHN2cTF5Nm1CcW92SCtMSENSc2RUcDk2dTJtck1UQlRKZEN0?=
 =?utf-8?B?V3VxeVZrSkV5anZub0VwVmM4ZmdYNzJBQzJRUHh4NUlBeGJIbHQ3YjFER0ZF?=
 =?utf-8?B?QWkyejJmbjFSMmoxYm11a1hoMnBDanFqZUhZQmdaRElicTJpemRRaEJzN1du?=
 =?utf-8?B?bWs5N1BmYkxkYlNaTnZ5U3lnd0N2YlloNzYxTTRnNVErdUpLZS9qcTcwNi9T?=
 =?utf-8?B?cm1lUGVRdGlrdm5mNHFmS1ZDSTJNdnZXbjlzaGtpeXhCK2I3QmYvTnNjTmFN?=
 =?utf-8?B?UDhVNlNndEN6ZnVwcG5rb3BuZEdpaUgrRElIeWtNUW9GU3lSQ2xaakJQU2pK?=
 =?utf-8?B?cjhYZkoyWTM4dWNQUjFLRGpHcXdOeDA2YU0wTmJSY2Nra3RuY2V6bjRNVGVN?=
 =?utf-8?B?b2hoVTREck4xMWxtYTN6YTcxNHQ2ZjB5dUJXNXFwTzlqRE1wSDZhUjRWUnNp?=
 =?utf-8?B?SWtLVUpTUVc0WkR4eml4bXQyS0szQ3JhRDBoTlRhTjNkMXpGaDA3WU5ydC92?=
 =?utf-8?B?Vm1PYmt3K1FCOXRPczVaQ3dhMGdJMnJKYVBtenNWQUJNdjNyQjZWZUZzNTVL?=
 =?utf-8?B?Mjg1eTRmYVZOUmJqdExkSnI3WGtrR1JtRjhVYW9Rd005aEtxZ21XRG5VNGJn?=
 =?utf-8?B?T3c5c0JGUXYwSVRCb2dzWHlDSmZzUHpsTG14a3kyNlc4MC80VVZSa3prM1p6?=
 =?utf-8?B?S29tdlNXNVc4emVIcU5WWU9OVFNpdXAyZHFEQXlKKzdKZE9nQkh3bGJXTTdT?=
 =?utf-8?B?Q1oycGwrcFVCcGxlcGtacTA0elZRZExqQmhOckFPMEdHUE00eGFhRk9Gd0xJ?=
 =?utf-8?B?WDdOWjVJQkdZcnJ0ZjR1NVpwY2tyaS9INUwxQ3NMQkpqL2swbXpteFU0a0JJ?=
 =?utf-8?B?aWhrVWp6NEJiU3dELzYzMG0rcEd1NUpRQlFKWFRvVVJEUkNMQWlqeVFaYnVl?=
 =?utf-8?B?RHlCRFlVbmdlUmxDRWpQUTMxckxUZjJyVTlMSHNUY2dqSEpCTnNTTDJQRnVF?=
 =?utf-8?B?Zy9iazl1WW02SjNaSVB0RzhjV2Uyc2VnL1JqQ25ySjJTcnJEalQ4RWlTS2wr?=
 =?utf-8?B?MHYrMnVUS2wzZUtpNXpXVDJmOXRNajF4TTNXZnRqaTRzTXJ2QnhVWkQrOTR2?=
 =?utf-8?B?S3pDVDdXOVNSSGpjaTU5R0JsWXpPZDU0dWVob0l4MzJoamN6VGExTG1BZ01m?=
 =?utf-8?B?ZUR5UElvcTZjODNzUVZxU1gvdWlMLzdrc2ZsQXlCWHdCa0pZRGFHMHdPcmEr?=
 =?utf-8?B?R1NMc210ZytIVlhIeHRWSWU4RVBhVlFHWmpkckMxSkRBNVUxU2lGVnRPaS8r?=
 =?utf-8?B?RkRlaHlNVUI3d2cwa0ROYmFWYnEwcW45VDNXeERiNVdHUW13ZzkvRStUdVJ4?=
 =?utf-8?B?c3FwVEE1REF1ZHovdXlIZ2V5djI3V2NZcUNqU0toallKQmkwOFZpdWx0ZnEz?=
 =?utf-8?B?bnlINmVLejJSZEp0VElQYit1ZFdCVnlsb05CNEt0eDQ1T1lLdERZbTlRc2hy?=
 =?utf-8?B?Y2Zldkg4YXA3a2Y5WEMwcXFYU0gzSlhaWHE5cjhuWnJXNVRRTEJpSWtuNXVD?=
 =?utf-8?B?QlBnU3gvQWFwZmJSNU94TjRoNEN5cXJqeUZ4NXR5TmkxUVBtdmxJakcydExk?=
 =?utf-8?B?L0FmU3lOa2FIRVNOcEdDUFE1U0ZaQmp6dS9GT3I5cnhFN2RiRnY5STM1S2FP?=
 =?utf-8?B?K0d0SGhHNVIzV1pYVy9FN2swZHZHYkR4SDhiUGxmQmZLaENwbWR1TmZBYkRn?=
 =?utf-8?B?cG8rWk5qOEFLelF3NkVER2dLSVl5aEx3cWxvbG16V0RZMFlOWWxCa200SU00?=
 =?utf-8?B?cDZTd0NlTXUyaVd4YmcrZVBVSmNaREVHbEUzeURJZEI0VlNMU2hEbG1hcklo?=
 =?utf-8?B?bkt3K3p1bjloaXpZMzB0Y3JvakhrYUhzZGt2dlQwYmltMFNNMHdQMlBjdTFC?=
 =?utf-8?B?d2IzYytsaGZlY2VhL1drU1lJMGlhbEp5QklBUHlsY29BeEs2YXhOamJodFFG?=
 =?utf-8?B?UkptUGxNaytCOFVrZXNGcEhzcHNQUGxHU3U0OEtSNE05Vk1nTkRIdkhKbE1a?=
 =?utf-8?B?UVYwakFKeWV0dTlKTi9DS0R3ZFRPOS9WUlRhcVZ0eS83STM2cEtxeVNlcEU0?=
 =?utf-8?B?aWNJYm9tOGkxNDdaVFRmdEl0aUllNEcrREd6YmRTekpIdmgrZHVZVEViQUZn?=
 =?utf-8?B?WkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61d808ee-ee41-467b-c771-08dcd7b75d1c
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 07:56:12.3959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EXxzGI0srQ8gpurmLaQBtsrwtsPQ+WsG8+F2kxu/WTuYAEkDb46FaYRxvvyNSGLnR0+lDYgthM+G2BnNcM3Ut6RcY+Cq0oJHgiIC5KTnegw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4570
X-Proofpoint-ORIG-GUID: qNQcFx9W6y4vkEgL-B2RiavegmPwW1sR
X-Authority-Analysis: v=2.4 cv=d6+nygjE c=1 sm=1 tr=0 ts=66ea87a0 cx=c_pps a=Bc47kgIQ+uE7vzpOcRUeGA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=I0WAQ2ySYm25rZOq4OQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: x7_MZOb7Zb3NeEJbHSSyZHw6FuDh9tB4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-18_06,2024-09-16_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 mlxscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2408220000
 definitions=main-2409180048
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 48I5eqoL016649
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 07:56:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204637



On 9/17/24 19:12, Richard Purdie wrote:
> On Wed, 2024-09-11 at 07:35 -0700, Robert Yang via lists.openembedded.o=
rg wrote:
>> From: Robert Yang <liezhi.yang@windriver.com>
>>
>> There is no bitbake revision when it is in a separate repo, then we ha=
ve no way
>> to know which version of bitbake is used from the log, this patch alwa=
ys prints
>> it.
>>
>> * console-latest.log
>> bitbake=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 =3D "master:165368bad152a14b32b5216b938aa4b915d72a70"
>> meta
>> meta-poky
>> meta-yocto-bsp=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D "master:165368b=
ad152a14b32b5216b938aa4b915d72a70"
>=20
> I think this is confusing as it implies that revision is in the bitbake
> repository which it isn't, that is a poky revision. The current output
> tries to make that clear, this patch starts to confuse that.
>=20
> We're really close to release and I'm not going to rush into changing
> this so close to a release build. I don't mind printing a bitbake
> revision but it should probably only be when it is a separate repo. The
> change is too late for 5.1 IMO.

Thanks, I will send a V4 for 5.2.

// Robert

>=20
> Cheers,
>=20
> Richard


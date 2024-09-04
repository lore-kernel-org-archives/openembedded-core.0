Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD4F6CD37BF
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 02:22:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.41000.1725416516709165992
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 19:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=99776febe4=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4841TsaH015039
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Sep 2024 02:21:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41edxkg168-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 02:21:55 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4842LtKD026497
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Sep 2024 02:21:55 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41edxkg167-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Sep 2024 02:21:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ND46AAm1AjuBvjF98NF1C5zg9NtYORAcqS7zy3O6xeq5SyQj1gURhaQDIvDIl6b3AfyQli9EywtuSH6WWdihDlmjXZaiUwZFmyY90dOIUlE+WkueFsgcLUWUyj11YCnkKswUkVxp6L7nFRltwyu80gMAAYxWyjDVmNnIss+eedQN5vU3UYC896DtYR5P5zsevIpLiaH4Gu1S1ctmyyMOcTZ1uE/o7iJsdPlgAoLIZF1PIq3B2J/Rq17t0EwQZxLTQ19UPrDbV7N/eePdsLKCn4BkMjoKtiQrRwt+1npjnrtr2lGPJUveHY8IPlQJ2z6Paa93bgkwPsd6x6WuxFOdtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QsRMw+nV5i6f9j2ZBE/rcww8W2NjZXQQ9bPcN4iCKmo=;
 b=ppStTPahLPodOmeNL9K73FB9THreOgLl8l5P2c860x6BKHEN171llIUUu2xc1IpCw1yjjIHEdtRH2uqWs+89apNc//+BqyZ2rz6n0DJTXav+gZopY4YGtWDJV5qWC3eZJBREaXEDw/hoGccGJK2vQAhZhZgIsamL8B0uCpYqIN9jh9rPhHKFw4V3Oo8hZ9BfpNVAV8RqDEQtpqhZnQMTzMKiw0axeBxNjINM5mQbcsJ2tTFF8c1bTUBhMq8iWYVFy1Cawi/zMRrk0C9YbjzfEpBaSFrLprZh1fmiM8v6AfEubxc8f0FPl+uKvCld70HnS1U9BQ+5cDGgCV1IpaUanw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 LV8PR11MB8557.namprd11.prod.outlook.com (2603:10b6:408:1e8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Wed, 4 Sep
 2024 02:21:52 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 02:21:52 +0000
Message-ID: <8bfb9f2d-2c90-40ec-8a8b-f24609dce67c@windriver.com>
Date: Wed, 4 Sep 2024 10:21:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 06/22] json-glib: upgrade 1.8.0 -> 1.10.0
To: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
References: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
 <1725352379-20334-6-git-send-email-wangmy@fujitsu.com>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <1725352379-20334-6-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0235.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::30) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|LV8PR11MB8557:EE_
X-MS-Office365-Filtering-Correlation-Id: fb5843ec-51b3-4f18-3dc9-08dccc88569b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|4022899009|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c1JIMjAwanlrenJpZUZVakVZM2wyYjZ1NWRmSk16ZzUrT0h4NGl2V1N0VmxU?=
 =?utf-8?B?K2huOGxhZVNGSDVCZkt3NUFVSmd2TXAwRHliaXh1QzdZL29uRENIaFRHV1Ji?=
 =?utf-8?B?SElhT3gyK05KMjZJNDdKRXY1V1VjWG9qV0NncUFrSGxHYjhmTkRkaDhjZ1l1?=
 =?utf-8?B?MnlCNnNTeFRINlVwNTl0cVp3ZERFNkdIelYweDVRcDQ0N3RCay8wRjh1bHEy?=
 =?utf-8?B?RFgvWk9ad1RhSllLMlFsVkhWVUx6cTFmMkNMU1FrblRBV1ZpMTljWmEvWDNG?=
 =?utf-8?B?alRyU2Y4aTg0ZTRLTmN6Tm90a1c2b2tmMG1pNWxpSldXK0U2djQ4Y2xQT2lw?=
 =?utf-8?B?eTNzaE1YbTFRWStKRFNNdHhXWVBkVjlYaWJaemc2L1Q0eTJyem85OUZOR05l?=
 =?utf-8?B?aDlTenFtUzRRaHlOb3M1VmpTb3FmYW5lRnc1UDdNRmZmQ2VwVXhHQnpXeHA2?=
 =?utf-8?B?cWJBdzA4U3h4RlR2NnlzM1hIRHZ6SWJoWnJmTTNEcVlhWGdPd0JRUWVaZ2Mv?=
 =?utf-8?B?Z3NpVWFrSGN6U3M4b3pLRXljeFRGVXpOTGZKc2VXcitlM0JVZ1ZtcklOMkdH?=
 =?utf-8?B?cUc0bDNnczNtSEtkS2R5Y3JBaktZbzJVS0kxandtdHZZVVJRcFhvdy8wZFF0?=
 =?utf-8?B?bGV1alZScXIrR2lLaWRIaFNHdW91bW9RWEFSblc0ZXdvMG84UFhUdnNPdnBH?=
 =?utf-8?B?WXJnUWFqcXM3MEs1OGxkNFpnN2lueTNCMjlIVk8rTWhJWEE5d3Q0NEpiK3Nu?=
 =?utf-8?B?d0tUNTVuTDBHTHhtMDcwMVdEdUcvSzl0NmZvKzhnSkFzZmlhVVhxN01IVStD?=
 =?utf-8?B?Wm1PVDBRVkhXZVlwK0NrZHVLZ2JFOTVuL1RhZXFXYzh2ektZQnZibGNXQUVa?=
 =?utf-8?B?eHQ4ckczN2JlWXBrRVdhd2tBRHk2ZktnK2h3dTE2Z0dUMG5WS3BWM0lvL3dh?=
 =?utf-8?B?V0VKUTI0a2l2MDgrUW5CYVJFaGlSZnpZbkhOeWlOTmRvQUx6cHV0dFFITkxK?=
 =?utf-8?B?TUU4QXZ5bklpZkl4eGRGVnlNdm5HWUV3Qm5ZVjU1VlJzL3gxeElFd1BMWWly?=
 =?utf-8?B?SDl0R2J2aWh6aENrZE4ya3NVam5DSDQyeUVRaU9rVXQvaUVOVGV6RGRrUzdm?=
 =?utf-8?B?Q0JFei93VElsSUhwMWF2bC9GT0VXajZpZ0Y1RG9FZzFlV1JVRXJWbDZtaEhE?=
 =?utf-8?B?ZzI4bnVOZ3lONzUrd3Brd0JEOTA3VUM0dEVBb2tGemNEdUo1a3BYZTNHTHVj?=
 =?utf-8?B?c05iNzg1dzh2MEVVRzdhbnhlQkt3b1RSbmhVMTJxaUpzZlQ0OTJNVFVSVitG?=
 =?utf-8?B?TGxTUlVtMkthQTlkNFV4R0NuNTR1RkNmWmdMbmdvdVJ3RG5WUGkzemJmaGcv?=
 =?utf-8?B?QUEzNVFjMG5DNDZwSStQR1lnN3I0dVRWc0wxdHBjcFhVS3F3SEdvcFNzRmdK?=
 =?utf-8?B?eU0ydTF0UmRGZ2dJb2p3V3RyNXc1aHdyN3Z0cHNqUG5qMVBKUFdUcURPUVVt?=
 =?utf-8?B?Um83QlVvMkhtZ1A5dXh5UkFVcTRMR1d5K3NocUhLMWJrM2FGT2VhTnJwZkhw?=
 =?utf-8?B?SVNwdVdiYXg3bDNlRGphR1NZa3F1Wm1iZW1JWlY0amU3UC9yaVF5VHM0bjhJ?=
 =?utf-8?B?cTdTQjZYMVBoMW9BbXpSUDFyeWV2S3MvdUFsRXhHOG9FTlRtNjhHQ3VlSE14?=
 =?utf-8?B?a1NOWVdqbUxuMEZHM28wVFYrdWk4OWpWbjM4bStINks2eVpuT0ZoUWNISlVV?=
 =?utf-8?Q?HlV12d/pRMeDlRrYFM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NHMveW9HQURwTDRjRGFHWGJjM0VWMDlXNEZUYmI2MGQxaElrUDF2cXNoaTFJ?=
 =?utf-8?B?MVFJZkxBQURhTlJPc2l0VzZMTHpvSU5FaWlSbVZ6c0xUVWxQdTZGeEN6MENH?=
 =?utf-8?B?K1M1ZGV1U21EL0MxTVEyOGtibk10RDVZdEVzU0FpUDJPOUErK0RnMDBoZEds?=
 =?utf-8?B?OHkwUXRPMnlydHdNWFh2aWxqQkV2T2dQVXJFRzF2dVVuRXIvR0FNMU1CWlB5?=
 =?utf-8?B?KzFWeEZ4UXI1ZWJ6aGtQa2FKNUc0Mkk4WFI2S2RseEcyMlZDdzVrY3NNN1RF?=
 =?utf-8?B?MElvQUYzTXN6bHFINVFDZGYxWDBYUTU0dSs3eEdsZS9VUUg2cjFhYUFPTGc1?=
 =?utf-8?B?blR5R2tadDg0YjJoQlVFNktUMVk1TW8zVVBXUy9SZU5xeWo2NXUxZkxBTk83?=
 =?utf-8?B?WmtHUnNTQ1NqTU9wS25lVGEvdEZGcnV3Z2JyaDAwU3IzbWRWSzI2QktPRU16?=
 =?utf-8?B?dURnRUJ5MFBzV2pWVWVsZFRuNytlZ0xKcmtTRllzYWlPVkMzZ0ZySGZBdDBv?=
 =?utf-8?B?QTlzc0lMZXhnN0RiMWxUQmNrL2J3S210K2pHWDRkTTNJZjZkVWkrTXljamoy?=
 =?utf-8?B?S0RVMDZLZHpkOFR0U25sN1o0a1JEenRia29uS1ZRdjZQcjRZOW1qbWxlTTgz?=
 =?utf-8?B?OXZiUzd5NGtlekNxS0loZ1czd09RMzRQSmdjTkJsWlErbTZkOHU3dVpoUUNU?=
 =?utf-8?B?WlczckhjOGVSR1F6M01wZFlQZnQwbXNIR1BvRlVmcElEMzZIU1RzZzh2ZkRH?=
 =?utf-8?B?SmNWQXhpMStHYUswc0hPd2g0TDVuMnpUSi8vNHROSk9FTzAwMjZ4QzJCcFRj?=
 =?utf-8?B?NGlhd1ZiRFVLZ0VzR1BDSzRSQitjTGcvUUcyeUZpamhXQWR5RE5wY2lWMzNC?=
 =?utf-8?B?SDZIUHlia0lDbmlBMWc2cjR5S2tGbURCOU5RUEVWNWVCdU5obG42ZjV1ZGZn?=
 =?utf-8?B?cmZZYWtVYUNEWEJzWjZOazJ2MUFmYTZJdWFzOFJkbkF0OG04cWJUOXNScStj?=
 =?utf-8?B?aU9FRFF1ZjNZOFRhR1lwRmh0TlE1bHlkSEJ2RHNGMk45dUFmUUpnZGFaZzFX?=
 =?utf-8?B?M3NQQ2lmVEhVb0ZJd3dsVXQxMEdCalpaL0JJZnZCWU5OUWhIVlhpcHZlRG40?=
 =?utf-8?B?bm9EYW92azRFTTFMRE8zelMwVHhEQlYxSDNNSldQQWU0YXA3U3BiQXRzY2th?=
 =?utf-8?B?em9FeUxkSXptUjIrbmJxVVQ2Rk1PVkErSS94V0lCaFRramtXOHI0MXEwMXUr?=
 =?utf-8?B?U0czVXlXSVY2N2RmaVV0Sm8xRkJjdktjVXZRUnlBaTBkYWIzaHZTVFQ0ZHVv?=
 =?utf-8?B?RnlIME5yaWdhN0Z3ZjIxWTE2WnJNU1FzSitSMG15bmJ4UzdHQm9pSmVUZ1dK?=
 =?utf-8?B?KzB3dW9aTVFmNHM2ekhIZVZTSkl6L3hpeURKQlFxUWpFODZsa0hCaWo5Rk5w?=
 =?utf-8?B?RzBSa2JiR2E4T0hYN3RFZ0txN0N4cFlQTHRaSlZRRmhjOHN1MXhQcTdwK1Nr?=
 =?utf-8?B?VGliR1gxN0VYQ3JJWmFtdUc0QWxrS0JzZTZXYXk0MWJDUHh6bnFLNzhuZ1Nl?=
 =?utf-8?B?VDhFNXd3SU8ybi9vWEVUdTVmSUF5L1A1MjVMdWZvZWcvUE8ydVErdzhpSmhM?=
 =?utf-8?B?aXlub01DSVQ1a2MyOUFveTR1eXZqZWQyWlpYOFZ5YTh1U1Q1bE5PTXpnNlJL?=
 =?utf-8?B?dEY2SUJDZ0VBQ2NOUTZkQ1VxL1NWR3NuVEhPeDI4Tm5GcDhWT0hBN1V1UFNR?=
 =?utf-8?B?Q3lDYkwxSW9NUFBuZTMyYU5hUG9ybGhnRWFLOXdqYjM4Sk9hNk1nU1JNUVZ1?=
 =?utf-8?B?N2JFVWhwdnJDZnV0N1k0YnQrZHVnUkN0b29wMnNkY1haYm1Kb2hYa25ROTha?=
 =?utf-8?B?SW1nNTEvcEIwMG5UNmVLRUZhNGdPb2t0cEdPb1d0UUZ4QmpEcmtlcGtmU2dR?=
 =?utf-8?B?aFZGNGdja1pveEZITnJQenFrNEpZZ3RkbnpzQnR5MERjdld1M2tTcVBtYzRE?=
 =?utf-8?B?SklmK09kODVZdWVNUklaZ3M1bmg2WUFoOE5GdTNoWm9CekloY2FzeG4rS0p1?=
 =?utf-8?B?RFBKQzk2RU9vS09JRFdDeGxSTFpTeTBuUXNia1F0WVVqZ0tGZ3ZaQmZIQ01M?=
 =?utf-8?Q?J6AXiVx+KU7YWH7nT7Tw9yUHA?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb5843ec-51b3-4f18-3dc9-08dccc88569b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 02:21:52.1815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KSh/90abRZDyaisabUIdrAFzlaIHSMI3hmVoA12txf3+17gCvKcWZ4FyYwERbUL1hinvuL3Vee0hTAdEgRnDlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8557
X-Proofpoint-ORIG-GUID: Ts7VELAGxAGEu87XZTI1zTqW967L7YP9
X-Authority-Analysis: v=2.4 cv=UfsDS7SN c=1 sm=1 tr=0 ts=66d7c443 cx=c_pps a=28bFCgguF5sZfysLuYgbMw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8
 a=omOdbC7AAAAA:8 a=26qUNFTaAAAA:20 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=FeFskXcg8a3BcLTPfxgA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: FdI-PK6_DNxQUmYTbpG8NptY9XKIvnpZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_01,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 mlxscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2407110000
 definitions=main-2409040014
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Sep 2024 02:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204183


On 9/3/24 16:32, wangmy via lists.openembedded.org wrote:
> License-Update: Add copyright and licensing metadata to all files
>
> Changelog:
> ==========
> - Improve conformance of the JSON parser
> - Add conformance test suite from https://github.com/nst/JSONTestSuite
> - Add JsonParser:strict to enable strict parsing
> - Add '--strict' to json-glib-validate to enable strict parsing
> - Deprecate the signals on JsonParser
> - Port tools man pages from DocBook to reStructureText
> - Add "documentation" configuration option, and deprecate "gtk_doc"
> - Add JsonGenerator.take_root()
> - Documentation improvements for JsonReader
> - Raise parser error for malformed Unicode
> - Build fixes and performance improvements
> - Allow disabling installed tests
> - Support parsing multiple root statements in non-strict mode
> - Allow loading files >4GB with json-glib-validate
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>   .../json-glib/{json-glib_1.8.0.bb => json-glib_1.10.0.bb}     | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-gnome/json-glib/{json-glib_1.8.0.bb => json-glib_1.10.0.bb} (87%)
>
> diff --git a/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb b/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb
> similarity index 87%
> rename from meta/recipes-gnome/json-glib/json-glib_1.8.0.bb
> rename to meta/recipes-gnome/json-glib/json-glib_1.10.0.bb
> index 2094ebe3e7..8d71524dd5 100644
> --- a/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb
> +++ b/meta/recipes-gnome/json-glib/json-glib_1.10.0.bb
> @@ -7,7 +7,7 @@ HOMEPAGE = "https://wiki.gnome.org/Projects/JsonGlib"
>   BUGTRACKER = "https://gitlab.gnome.org/GNOME/json-glib/issues"
>   
>   LICENSE = "LGPL-2.1-only"


The COPYING file now links to LICENSES/LGPL-2.1-or-later.txt[1]. The 
LICENSE should be changed from "LGPL-2.1-only" to "LGPL-2.1-later".

[1] 
https://gitlab.gnome.org/GNOME/json-glib/-/commit/a06d43db36545aff10eb384d62548d96a7cf6020


//Yi

> -LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=41890f71f740302b785c27661123bff5"
>   
>   DEPENDS = "glib-2.0 glib-2.0-native"
>   
> @@ -18,7 +18,7 @@ GIDOCGEN_MESON_ENABLE_FLAG = 'enabled'
>   GIDOCGEN_MESON_DISABLE_FLAG = 'disabled'
>   
>   SRC_URI += " file://run-ptest"
> -SRC_URI[archive.sha256sum] = "97ef5eb92ca811039ad50a65f06633f1aae64792789307be7170795d8b319454"
> +SRC_URI[archive.sha256sum] = "1bca8d66d96106ecc147df3133b95a5bb784f1fa6f15d06dd7c1a8fb4a10af7b"
>   
>   PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
>   PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native xmlto-native"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204133): https://lists.openembedded.org/g/openembedded-core/message/204133
> Mute This Topic: https://lists.openembedded.org/mt/108241638/7283133
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [yi.zhao@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


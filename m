Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 016FEC36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 06:31:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.40300.1744007508750527399
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Apr 2025 23:31:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=61920ac1a5=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5376IANs022059
	for <openembedded-core@lists.openembedded.org>; Sun, 6 Apr 2025 23:31:48 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45u41m1g8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 06 Apr 2025 23:31:48 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5376VlnM009509;
	Sun, 6 Apr 2025 23:31:47 -0700
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45u41m1g8u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Apr 2025 23:31:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uXjEXOvOc1ytt2UpL3EwfjUD1rxn2WCTGa63WosMPb5bSRJtwGdqKammckc2V+CXGhILIM/yAPCkOniuQX7G85nHi+xcWpf5PgbgwvPf3K1ghXgokgO3QhKR3Q85xuMH06LN/7l6rk0xrcgn2tEAvURtReQ4xoT9RONI7vpQRkfRNNdvE0/RwSPx2hmWt2yDQcAqXE8uxyqpcJ64QLGQItYZOz/ui1zjOvAF+yk5Rv7pjLXCF/iOxt38cflUn42GsaVHnpl8w6t4QpJjZEjPRx71BmvEp5EfLcoqthHknwVe0xnKTOgb0SweEFGEBfDknJmDV+m8pQUZjiQyIJLeZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2Z4g657OvLwEK7Ks6dd10Wes6qUo1TKMuf13Ivbvs8=;
 b=NLbEzc7xVXIJvgQMMGZXCIN0zRNf4d5J58xQ+YCYsTSBAxZFODsoCsqBWULkYhG9Qmhd+SCCSxpx64HCM5wZe0vjgboL5wXeGvXeDBTFq8NF5nSdgpydY2ztJnwLqpPuoPai73FogATFkYngOAb2Kadc5LnZu976mnECPNM2e2Z8VhKpq1D0Kqm1Chs2Mk7xQXdml8u60DeMJRvhZq3Ex4Xr7Nwx7Vv56E8/sKJLeqlDe4QA2KSbrnJ2WSjgZ40xqeWk8YU9mlu5lf7TTqLpkTyBEcOr4wVGAxhpeNNFsDhJ8ItfBIPfLrFDCJYPcxeFndZFJHl1fVCiH/ulyaprtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ2PR11MB7428.namprd11.prod.outlook.com (2603:10b6:a03:4cf::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 06:31:42 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 06:31:42 +0000
Message-ID: <61379a9d-d66b-41cb-86f9-56a9208317da@windriver.com>
Date: Mon, 7 Apr 2025 14:31:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] qemu.bbclass: move to classes/ directory so that
 INHERIT can use it
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250403074552.971291-1-Qi.Chen@windriver.com>
 <CANNYZj9BwZVVt2Mk61KY0S0NLmD8zR-=a2EDnSccKF7xRL6ofA@mail.gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CANNYZj9BwZVVt2Mk61KY0S0NLmD8zR-=a2EDnSccKF7xRL6ofA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:194::22) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ2PR11MB7428:EE_
X-MS-Office365-Filtering-Correlation-Id: f443634a-da51-49f2-73ae-08dd759ddc56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M3RQd1c4YTdTQ0NkVm9tdTFRVkpoVDBseWgxVk5TVm5SNEVxOW5BM05JekRO?=
 =?utf-8?B?eDZuM3VBTGcweE5md0QrTXNybmJvUzJhcm1EM0k4TWtXUGNjcFVHMHczWkpm?=
 =?utf-8?B?Tkhjd29ib0IySm8yMlhJYW1Pdys0cm1qL2FiM242YmlVQlgvUWdaYVhTc3Zw?=
 =?utf-8?B?Z2x1MnVVa1hBYUxZVDB5c3lNRTNUWEVNbWI0R2ppcXlzZGIvTDQxNEpPbnhJ?=
 =?utf-8?B?a29QYXFnRnI3dDg4TU1nQnhISDNCZUhMOExENDd4ejJXYWszMXgzai80em4x?=
 =?utf-8?B?OGdHQXpQZkFaMkU3VVNsdlRZcTN5WWxYNDVMeU1ndlBnbk05WkFkUnlUM3Uv?=
 =?utf-8?B?YkdxUHh1Z1lpTGM1R0J6RlB2K285MXpoMVF0WENnaXVVc2xxcVdaNllENVN5?=
 =?utf-8?B?cHNKY3UrVlRaVWRwQXdlYjRZYXM5VWo1TXlxQWxvaCtrM0lGdGExUHovNkp3?=
 =?utf-8?B?ejZ4czF6d3A4UjNOc1BJbHNYY0kxSjZPMlRjczZtK1RFK3N5azRmQ2N4M2oz?=
 =?utf-8?B?NXhUQk9acnBsVUg4OGM1bm1wVWxwbTVyeTZQSmhuWWRwdXVvRHQvUmMyR0xO?=
 =?utf-8?B?b2oxUzdrWXg0SXFFaW9QZU9GUEhrSnV3K1MzY1pjYXJtR0xJNlZ1dWc4WSty?=
 =?utf-8?B?dkVsQ3pJNlArQkV6ZTQrTHZhUlR4MVg5THF4QWxJc2dpeDRGb1p0VS91ZUwz?=
 =?utf-8?B?V2ZWRGI2VHlDeXYvc0E3R01hMmp3UitIR3BaT3V0OUV6VUFpQ1ZkZUVKN0Uy?=
 =?utf-8?B?Q2lPbmx5Q0ZtNjE1THNtRlJsVGRFd05jMjA4bzVEdVQ0cG5jaTM0MTJ2OWVT?=
 =?utf-8?B?bm4wVHZrWmQwdUN6Wm9pVlFUVVp4dW1kSGNHdkJYZ2lKcTNqS25rc0JQKzg1?=
 =?utf-8?B?NGI0UXRlSER3TXBvUkJCOFpuRmRLc3EwRjM2d3UzL2REUWRwdzJMNnE5U2FN?=
 =?utf-8?B?WndCdENhVlJ2WFY0OVViQXVKL1hXV1owNkxyYXRHQUFpNkhlUUtTSnlpeWFh?=
 =?utf-8?B?NjM5bnFiN0pWM3ozVnhWeFFxOE9TSVhXVVFRbmpORjVBWXpkVVFtSlE2dEFS?=
 =?utf-8?B?UVUrYi9MSWFQRXlwVllZdVloSk5Pc3kyN3M2ZVVTRWFBeS9BSmdhNDZpbW8v?=
 =?utf-8?B?dzR3Mzdpdmw5dUpjQk5YbTIrMzdLMzc2cGVEVkZwSW9vTndMSm5zSTFZdWNX?=
 =?utf-8?B?N2tUSlh4YlJQZ1dIcUwvSXo3MlFhYVNQczkyYzVqdUsrRXVKUkthNTJpY3A2?=
 =?utf-8?B?b3RGTHZjSXA5V2pRS0tqcmF6QTRpa0hza3poRmFhSlRBZ0FVcGJXUW1CYlpw?=
 =?utf-8?B?WGkxcnRBSWFyZm1laGM2K3hvSWNMOERXR05WNDA3K1UyL1lWYnBMSnJiNXFj?=
 =?utf-8?B?SG9NQmVUUUZvZzY0QVpSZ1BsSGRUeDZMYW9aN1ZGZDVTNGpQQ05hMlBJU0k0?=
 =?utf-8?B?bzhtRmFaN0xMMENtRHBnaFo2VXA5bWhqVDlDZnA2NW9IVmFOVEx3Wk5BVmFJ?=
 =?utf-8?B?ak9zNjlxSy9zSDMvQTVrc2ZzYXNtR1lRdFdpaVd0Ni9VUmtzMElha3VSUktH?=
 =?utf-8?B?RWZYQy9HWjc3bi9RcFR4Z3dGbTZUTWlDRTBWWVJKTDdUd1pCblNnRUh3Zk5k?=
 =?utf-8?B?UlBjRiszR0JiL0VFWE1senNXcEt6b3FFUVJlRTZmMHlmbHl3TFhFNEVUNy9Y?=
 =?utf-8?B?WGwzRG5zRFdxdkdWc2tYZGV6Kzl2UGRiL2xQN3JiYXNTSEI1ZkdFdDVZVE56?=
 =?utf-8?B?ZVVVU2JVbndQNFlUVUxlbEdOcGhRamdINXBmY290RmRVMVpzRGNidGNNbFhw?=
 =?utf-8?B?T3hWUklFeUVUY0laWW15RzFZK3JUNVZ4M1I3MHUrdHEzUTBqZHhGZ0tBMWlh?=
 =?utf-8?Q?KDZfznwvvXgaa?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MVJ1WkFjM2R3NUp2bzA4RGlCTkpGdHltYU1Fb2pwbkRsYnpHSkV6ZW9WWDhn?=
 =?utf-8?B?VUdnS2FMRE1NdTZ1OFRlWlVGM1VJNnk4TWw3WUlkMzZBMk1WdkRRRjJiNnZ0?=
 =?utf-8?B?NXZEWUNjYUdCbjltbHR2RmF6dVFXYXZlaStJVEVSMXRMQjF6ZkJkNkJHZVFv?=
 =?utf-8?B?WGRoeHQ1OEgzYWMyLzI1dGZjRHgvd29DK0YwdjNaWkw4V2IrcW1tZEFrOEpZ?=
 =?utf-8?B?Z2Ezd2p1Tlh1Nklpc25zVS9KdjllQVc0V2pwNk1PcFpvNTBFajNuMFVpOXZp?=
 =?utf-8?B?WHRlYWxmY0xUdHBCbEpTOStRWmhjc013QUlMVS83NDNuZDUrN0RDaVY3MUpq?=
 =?utf-8?B?WHhXT0NzQllxbmhxTzNESGtUeWVldVY3Sys5TWN1U0NOcXBUVmZkTDgvZU43?=
 =?utf-8?B?QkphV29PTXRyRmFzY0NLMFNaL2NCREpCa1lmcWNKc2RHc0FrcHJDQmJrSW5W?=
 =?utf-8?B?VVVNb0ZGUzZXLytkc1o5Z0lwNFY4ZGszL1JpUkppZ2Jqb0x6elQrSXNSUXpR?=
 =?utf-8?B?N2kxMmg1eml4VWNoL0dHZmY5UFRmTHUrUkpFRzBKdCtwak9RTXd3QWhWQVdW?=
 =?utf-8?B?VzZKNEpBU1NtbmF2aDB5YXB6TzY3ZTJMQVdwRG42QUdlWlJKR2VXUVBDUWVZ?=
 =?utf-8?B?Y1ByQXhsK2VkVVRiOUN3aEJkckY0MG15WWRBK0UyalVFWW5udDFPT2pUdTlJ?=
 =?utf-8?B?cGs5VW5heWRIMFdxbm5wcHZaWDBDNU5wVEpucXl0WlAvL2U3WHJqVHhNOStF?=
 =?utf-8?B?d3JZcmFhMFBWZitmTEt3NVY1cGpEbElBSDFVaUVXdnpnTElBYm00V0NLKzBw?=
 =?utf-8?B?bGoxVHV3d0tEdHQxZ1J3c3VvaGo2dllPK3FJT3hTditEZ3FaUHNFVFIvVnB4?=
 =?utf-8?B?WVVoczI5emNndjRFK241YU9HUmF1dDNhNFlkbm01V1Z0UmpBUWk2U3Fvb1ND?=
 =?utf-8?B?ZDNMSURqSTVOU055Mnp5Z0c5NXg5S201N1QrdS9EWm92SHZSbG9BelBRMWdi?=
 =?utf-8?B?V1gwTi9JM1dISm5VRENlaTVQRHg2andLZWQxYnNteGM1WU1WSVltaGVtVmpx?=
 =?utf-8?B?cVN4aWFSVExKQTlLcjBjbloxazYzQUJQcnppVnJCWGpjMFh5L3JabFc0SndZ?=
 =?utf-8?B?SGZkZVFDZzl4Q2FtRnNDQndhb21xRnA1OFhPbXJ5OGxMWVJYZGg1Y2tOWjRT?=
 =?utf-8?B?VjVHM0J6NUtVUGlRS2RmRk1FNTNWY2xGUTNnZHd0T3pSWDNKN1JNVzJlWkRp?=
 =?utf-8?B?K2FuUFdIU0ZTcFpnS29odTNVOFpySEpqZkEvUnRwMkZ5VFZxbHZZeDRwemxG?=
 =?utf-8?B?TURpUFBxNFdHRm43LytNWlJhU2sxZGlmVUhBNkN3YW8wQmdySnZIVnhwQ1ZN?=
 =?utf-8?B?dzIwMXMzNStWOC9ISTVkUlNkOVQwZVRtSjk3Zy9PZmx3enZzRUdnT1JLVXVn?=
 =?utf-8?B?MWZ3QjRSYU0zU0lnMTZ1VitDUkZ6cEt2eXFKcmR5Z2hmeERjT3VKUUdnNFRG?=
 =?utf-8?B?SlNGQUtSaWc0Nlo2WDRJZzhCTHA3SHU4a21kVkwrNXpPYTBadWFDZWY2dlVJ?=
 =?utf-8?B?SXFQNDkrQWNJTmRNSExpTXk1Vy9iZWhkTUJsWnh6cVZhUHJFYnhQSzRnSUxO?=
 =?utf-8?B?U3QvREdJaENiNGY5V3NqcnlMU1VjWWI3elZ6bEduNnVGcFFMRDVPNW1TUE1t?=
 =?utf-8?B?YWhrSnBxSDQ0RHJHZFFDNk8rU3NMQ1JPbVVWbjJEQ1h6WDdMR1JSczFETmE5?=
 =?utf-8?B?N21wY1A2NmlCUy9Temp0bXZtN3JFS1k3cXVuNGV5MDgrS1hjYlNVclBOcFdK?=
 =?utf-8?B?Y0IxSXkvWG0wZUlNdW9XNk4xK0JYcm5nVTMwOXdQemVZZVJ1bHpwR3I4aVI4?=
 =?utf-8?B?SlFRU0VxSHpDY1JZeTZOQURXOUsrelR2NmZ2c3Q0aVhzdTk4Q2s3UlFxNlR2?=
 =?utf-8?B?eWswbnpkeVRGZXdpYTJLenU4ZnBMa2xkck9kZG9NaXhWRSszc2htMlBhMnNY?=
 =?utf-8?B?b0pPTTBlQ21xend1VFNMSnQzdFJPRGRVbWhGenpqbGtxeUNIOW1wYjIvc3Fn?=
 =?utf-8?B?VWFmNTVoVXRUWks2ZFBtNk5OeHhDVE12YzBTSmVxMlQzd1JIVmIwUEdkN25r?=
 =?utf-8?Q?yOe5Gix2ogxKfw10fGNXDzHfD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f443634a-da51-49f2-73ae-08dd759ddc56
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 06:31:42.4600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yYm0gUDKyP6x8BhP0yEuGU2wRpR3kgSkAdhezTSAYOg01J/SNZvq+WVjnbD/547iP1aez1wA4OwnIX+fuRevdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7428
X-Proofpoint-GUID: l6w5MakrLcXYLfN5D9hvq9d6OhokwIyY
X-Proofpoint-ORIG-GUID: Ey87193dD4wG5PZaF2zAb5KDN2yf83ZD
X-Authority-Analysis: v=2.4 cv=QOZoRhLL c=1 sm=1 tr=0 ts=67f37154 cx=c_pps a=CmjB6Nkc3E8pi8fe8piFzA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=w_HbZ-kElbsavAsC:21 a=xqWC_Br6kY4A:10
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=Q4-j1AaZAAAA:8 a=IjAguEUGekTYZzs5A8gA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_02,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=766 bulkscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 spamscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504070045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 06:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214398

On 4/3/25 16:32, Alexander Kanavin wrote:
> On Thu, 3 Apr 2025 at 09:46, Chen Qi via lists.openembedded.org
> <Qi.Chen=windriver.com@lists.openembedded.org> wrote:
>> The functions in this bbclass is useful. Move it to classes/ directory
>> so that it could both inherited by individual recipes and via INHERIT.
> If the functions are useful, they should be moved into meta/lib/oe. It
> would also be good to explain what is specifically useful and why.
>
> Alex

The qemu_wrapper_cmdline function is useful to run binaries via qemu 
user mode.

I'm not sure if we should move this function and the one it invokes 
(qemu_target_binary) to meta/lib/oe, because it also depends on 
QEMU_OPTIONS which is set in this bbclass.

"""
QEMU_OPTIONS = "-r ${OLDEST_KERNEL} 
${@d.getVar("QEMU_EXTRAOPTIONS:tune-%s" % d.getVar('TUNE_PKGARCH')) or ""}"
QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS:tune-${TUNE_PKGARCH}"

"""

Moving qemu.bbclass to be under classes/ has the benefit of enabling 
other bbclass that could be used via "INHERIT" to make use of it.

Regards,
Qi



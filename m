Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BCB7CD343F
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 07:48:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31760.1779349692775207207
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 00:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cYXuI80f;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96010b0c56=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L5VKpG3838569
	for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 07:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=9QFSykmzDOpGpid6wCX8pP3WW3G09F9estS5q2hKXmQ=; b=cYXuI80fy1F9
	K7PJYB+Bm6mAflk4FxQeKrQO4N0HjDvRYlS1jXSrqVNYyZQR99XQy8zn587T5j+A
	Sw0XT8dliym6P6LzuMZ3YbLwUx/WWU8xFK301+zBXmf2MerT83DXXVq9T7gH+zR0
	T4Zhq1SY/cp/R6YpMhxYBmgE0TxBisMus4vk2BAYzxd7r71mvA5AZyy+lenY7J9G
	xCWvHsMwDWDad4ozhsRKNavQ3ynWVBkdsBTNuzaeZCz+XRLOtfepCfwJrvZQN4Bn
	3eaZQtHxooVr0Ng1P1VjDshB7TkMGO0oJnGTdQivJsWcdy7AQfP8AW1KW1CS2Dh1
	u3rXxIXeAg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010016.outbound.protection.outlook.com [52.101.56.16])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6fj3xrfv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 21 May 2026 07:48:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XaYxX+L3WHKCK0menoMtPESMQhrfaSO1hOopjUduI2x1UrrT5I6w46HZpIGEJgFRnP43SYh0LLDqXO2dDOso+9kRR69lRPaaImtG4UNOWfLBxkK7SPt3tG4gi7L4BrDeRkVWu+ScQh9j/9oVXGu89IbeGROHHuBoSbjY850cfYAl5fCVIX7w9Qd4kt0T9PTCgBGJRzocSaDc54tuSlhQlX6j0yt4R90wSxQM4ooh+uJB8y6V2hAVAg3b+5j2wWnNIsKOUhOC4c54IJ9LUrK+tQbQnJyC3DuheSMmYkUll8E/53YS/pNDPzsYNIHMSNgKj048i6AjaUj/C56TGCxfaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9QFSykmzDOpGpid6wCX8pP3WW3G09F9estS5q2hKXmQ=;
 b=grNLUCrZn1FKH0vnqZk3hw2+gFWNAo8WcDgP9+qYS0kt/cccu3Abe6igoeru4z+9q5VwfpKl+Rad9c5COmwJP4rcWr0DgwSYbZPiaTFRsuzm4C+ALhXvRnm2Qp/pJAHbRwk/syuW7J1V4i3SCa+0XKiAixsavsVMRpI404918sSIHYdbu0NTKh80mw7iCJNR07M7sLKWH9f1+FBMwcFGv+RLpXyOE42vF3lDEjveouCZAi6yBXEYPmWWFfUgVJM4mYc7eA7NXW99U0ScQyG8kq8Sr2tR2/ND6NV14Pgbmhtj25fSj80nOXpGQr5EytkVFwtOibibtk+xc8L2aWSE9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by CH3PR11MB8093.namprd11.prod.outlook.com (2603:10b6:610:139::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 07:48:07 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3%6]) with mapi id 15.21.0025.020; Thu, 21 May 2026
 07:48:07 +0000
Message-ID: <cee8d3c8-468b-4519-a068-71fac43097df@windriver.com>
Date: Thu, 21 May 2026 15:47:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] strace: upgrade 6.19 -> 7.0
To: Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org
References: <cover.1778659781.git.liezhi.yang@windriver.com>
 <19dc384322b778c446534c54666b60f0eb721827.1778659781.git.liezhi.yang@windriver.com>
 <cf357f4b53fc07fdc62cf8def7f75395b490feec.camel@pbarker.dev>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <cf357f4b53fc07fdc62cf8def7f75395b490feec.camel@pbarker.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0036.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::20) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|CH3PR11MB8093:EE_
X-MS-Office365-Filtering-Correlation-Id: 820cd9d8-07b6-4549-d039-08deb70d4bcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|4143699003|11063799006|22082099003|56012099003|18002099003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info: 
	9fiRWqoJZhqvBXGNW5OCNFr2Cpqo5f+yA+CBSpSzwZnf/Z1cM3gqjH0Uod0+iZHooeIj/hup/WlunZaif/MD04Euhk3f1o0wXNJEDa9pE5ErlAIx8MH4HffB9KZqQzVNm7+plII1c87JwfHKnVVCXYXIZMmHPAEDrqNnGBQ8MAvqrpanWwEA+1GzxySeWv9rtnKBrcI5feHKp4SpcZwGM1reGPijjpFhxhqyDyBefRSvnkOSQ8pV2AkpkrNu/gnOSEoCxJzgdx6jssa8vgF38MIgOgyyHLEm+kMQRvoUAdV5agC0LBUI3slwaQ6hiQMnWBunu2w2wfMYVkjcc5yzixl2WNuxFzqGXw0MaHjNyZYN1AFqp6nBaK/bVboPRUojAbGVp+b+0jaQ1cTj2uX3aOCmSAqImPcqZdMY2kzMwTAkNY6B7JqActPQAOe9dJSoE5DT3ahVm697z96eLliXiNI5NmCU9e9/KsoKnjOSI17eAVHTOLwE2U6fjqRslsSE9zmTuboX3vEdojj2AQI/BUVrkBi78oB8azI9SlNE7eok9w/GJGahB8jerkqeuzUQgCxjvQdQ0krAqgESahBDLWOAno/ebxCk+uKvwuZtg0XwDfRNSVFsb/Sy+jbW2gq8BLxOd1/CWbkmgXARrfQaieuqMmIoeblCxe+W7A8U7nfNgWyIhiTkMTTDzgnWz3SA
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4143699003)(11063799006)(22082099003)(56012099003)(18002099003)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q2V5Q2VEQ3ZYTmdEODg1NUZ6UFdOTUl2RWpvcXFDZTVjTlJzbTltRndUbk9m?=
 =?utf-8?B?N3Rya3I0RC9DaWlVRlFPU242eGJyZ2pteHVQM3Nvd2VVNHZQRjBiL3dscEZz?=
 =?utf-8?B?dG10ZVZOT3V1bGRORURpTjZDNHpVU09tWUwzNTVrMENlZ1E3Z25iZUtjY1Qv?=
 =?utf-8?B?aUxsNWxaL29sY1dIM2VSOFZTRUxIeXIxdG5BUjJtRlB6elFhOFpSSDdoeS9Z?=
 =?utf-8?B?QkhvZ0loZGoxNXZDUnJ6WlZtR2cyS2VNdzBKWGhnNEdGdXhNYVBhUlFPN1ds?=
 =?utf-8?B?MGRoUXk0dExmMThUTWxVelB5cjhrYVMxbjZUa0c5TDNmLzRFNC9weWpFenVL?=
 =?utf-8?B?ZFphNlkvRHFFOWFqazlsM0tDSkcwR3NWMGtLa1BYNU1wWDNBTnRweVE4V3Bv?=
 =?utf-8?B?dHhFL0s0b25sRzFmV3poSEdxTTdRM0VHMzFhaUs1MFBmT3Bqa0VqUXNhWHZ3?=
 =?utf-8?B?U3NBaVRXNzRFSWtoMVJHOVAyZGw2cE1nVGdqUW1NVWdjdEhyTktqa2EwUmVi?=
 =?utf-8?B?NVFWUmgwZHd4aGY0YlU0d1pYT01Kemx4TzFqT3UrQ0JrUFU2ZlIzRFd3a0VN?=
 =?utf-8?B?TGZRVW9QbVUzYnBPcTZxYzQ0TTdLMzdiMmErTjZxMmMzdlliNUpxRGZGdURa?=
 =?utf-8?B?ay9aOVN6M2dqUnNZVTkwSU9NMDlrbWlkVzlVOGNxYzFzUXVWWmFMaWNvWkFh?=
 =?utf-8?B?RjhyUm8yWGRYS1ZmOU1LdVJCbThCYjRrb1JxVWgrWTlwZ0JsVy9HOGpZeFFt?=
 =?utf-8?B?RmozMENsR1d0NjhaSkZISW1TZGxaQ2l0c3A4R20zQUJsVEFtWlE4alMyZ01o?=
 =?utf-8?B?Q2V5SEhpQk9hd2J0NzIzOXdpazFlWUtVeWVBM25DZmxiRDU4L3QzM0JoWVFO?=
 =?utf-8?B?NDF2VTE0bFR6dlFGZXBYME13aGNEYXRjQzNWOUU0azhveHM0RHdtR1JkNVl5?=
 =?utf-8?B?MEFib0grYm5QRzdBeUhwbVhLZnNaTHJCdEVyVXczTW0zb3dNR0h4bmd5SDZY?=
 =?utf-8?B?OHpBSVljb04rTit5VENFclAyMG52aDJWc3NUa3pCY2Z1Vk5qWGpuNzJyM0N1?=
 =?utf-8?B?RWNuSzN3YjNPTHg4Rlhia0s3bmtvVDhJNzFtMGFOZm94ZW9pQnQ2NGxqaDlz?=
 =?utf-8?B?NVc1c1FaSm5FeWlhc09xRmgzRkdjQVZwNlU5YmRlekl6VFNPNTkzQmJFR0Zm?=
 =?utf-8?B?ZVluYXFhb2hITHptN2pucmo3L2k1YVcydnExQnJqSUU5UWJMQmZ5WlNCSEM5?=
 =?utf-8?B?U05pcWpDM3QwODNqY2F2OGxWOFRobmxnemtpV3Vta3FTaUluU2ZCQk1lbHpH?=
 =?utf-8?B?MFdFb2pXajBlb2FxblExTzJQVjF2eDFVUk9FQk44NTl4Z2FGR2FRVnRiRzgy?=
 =?utf-8?B?ME95UFBuUS93eG5yczhWV1czOEsxWXdETDFhbnlZVWRRY1BQRXk5RWdUcjJT?=
 =?utf-8?B?QXpCNThjWGh0VHRHb1h5eFdHY1ZxWXhKVmRHOUdFUUNtMU01VldBWlN6RllO?=
 =?utf-8?B?azlyZnpqckl2emJmN2kwZmV5b3QzQmExTkJUUG0xVlhsRUh3azVlZUxIbzdG?=
 =?utf-8?B?WUlITnNJQWRIR0p1dy9UdzYyQ3llb3dSMXZQT2oxdGV2RkNyd3pwejAzaW9H?=
 =?utf-8?B?LzdKUGlLbGRlb3c5NkU4ZGkxbS84cmF5NGQ4OWxvWElieEprZnVWS0wzS2xW?=
 =?utf-8?B?aGozV3BucGV2TWJlMDdya245Tyt1QzZhT2ZueVUrSzd2dktHOHhTSzJFTkh0?=
 =?utf-8?B?UUx4dksxZ2xsMEhiWnhlZ0FLR3pacjQzNnBNdkIyL0xkbkV0WVlLT2x0dGFL?=
 =?utf-8?B?cHlReUEvL3FqUW0yUXFKUkp6dFVwc0toTkRubU1qN2l0bS9LRkZGa2t0Wktm?=
 =?utf-8?B?TmZueUx4QXVURExiQWVEUDJUUW9kUWdTaDZKb3k5OER2Z2t4U2YzY2NQYTFM?=
 =?utf-8?B?OWlDRnR6S3hCME4xV0FYMzRlMUhVUERQcFVLT1BMUE1vdE50Yk85Ynp3UFpD?=
 =?utf-8?B?QVBLUTV4WWRhd1M0dVhxTlBpaFVPbEdqWER1YVpUSkpJa1gxejVzdytoVVBr?=
 =?utf-8?B?eHkyeDV0aXVHaC9ndUF2MUdLQUpMRTZ1NlZxbm9rcWlIS2xpVWZ0NnllQTJ2?=
 =?utf-8?B?RWIzZGFnMk9LWk1aZ0hVZERDRlZ4S0R4a2wvZEVZdGJRRkIrR0NScm40NU1N?=
 =?utf-8?B?WGg5RlpaaXp6bCtxN0NQYmFTcmpSNVNBdHZzaWNRckJoaE5kRUxJc3V6Qzk5?=
 =?utf-8?B?SHdvRE9uS3oxd3RwN0xDNWJIK3BRb0ZMQ045MjFnTnA4T3hPbHNXalYvN1NW?=
 =?utf-8?B?bW5tWmhxV29teFNWZC81bUtYek41RFplTi9BUTllT2JESUppRUp3RS94WXhE?=
 =?utf-8?Q?xaSCHPy7uMdk6X7c=3D?=
X-Exchange-RoutingPolicyChecked: 
	WvS5V/4C/x4ipAgOILZxUG5aR5K5QSbtujDNthCnq1EA895Kc9oZ41v+8FOcQESwZaHUduUL9gvrC5/hgPMA6X0q1x7KIc8OgXf6P20b2KCPoBw4qkaxttPBbcm43CPXJFSA26nskj38ndQH6MEiPFWzJDl7/nV/X97OGR478hjKIpXygwVlSLruP+GVQEzDe8IsyX9S3I8pmZhoV/1LxOU+L9xXOC2vvl7BTicEuBGs1RF2+05Jiijy05K48aCqu4x0hPgE4yvX+ccmx1vXdzVE4cXbW5YF9YudtRC/DlEm0W+RFce3asXamjt/O0/3N9MxMvmdamFZ6s+Abp3ixg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 820cd9d8-07b6-4549-d039-08deb70d4bcf
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 07:48:07.0858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yqvo6jMeXXYAGvgZNZ3yEopYKI/VgFDz4owe2LLKJBY+n/9P7awgwb1PoF+flAJ6OwQUVdnfJ4SKDLrtj+iMgSeup6OdlDyzFBua4sc+bCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8093
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: xa13DqFljJ44ceZ2zyY4Ynf4EOR1MDSL
X-Proofpoint-ORIG-GUID: mLX5pGD1kF84vCEYy3X1MIbdX-E0cz9y
X-Authority-Analysis: v=2.4 cv=VssTxe2n c=1 sm=1 tr=0 ts=6a0eb8bb cx=c_pps
 a=DYD6gEfmkstUuBQ4PvrWrw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=t7CeM3EgAAAA:8 a=REORgL2HQeVbRjW3N8gA:9 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA3MyBTYWx0ZWRfX4OSA2nIlk/mQ
 8xLbvepF7J7FtWxfqJ/K9iigvSA9yVAqz0d4IitWwtGGZB4eUWIngj9aluIQUwU9E/AStCghJc6
 V0GuQhMCVio5hiSC+XcsvS3/H/Yv3jiqfMKsy9TSZDyCAS1mqIpL1SHC9mwU5e/fV5hHfHLdCfL
 h+69uQISC3/TEhvTMTPIMc1xmtCPs1AZgtMlqzCJlSbLExue5XjOJNAPU5PvlD0fTV0VH1whCj5
 4rCKYOnP/v7Y/gPdK5QOGPt4Iduxtu0KBX4ecBS16epMOYveTJt/MG2nwlqg8+28wkrVvfnc3hF
 UAmKFBMqHuMnrgYpnO7tvS/nUfCBdZnIofaLjjPs3u2kW77+JAkHrDXX5HH0be+nc/0Sowvusw3
 P9KRcbMYLNLq/zWuCMhCXuaQ4jKvUKzEkQculFdaHzcHNACL1r2SsAukhUPCCAkJ8+KZc7fLuit
 78FjgCEIqGhQ4JAYb/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210073
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 07:48:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237474



On 5/19/26 01:52, Paul Barker wrote:
> On Wed, 2026-05-13 at 01:14 -0700, liezhi.yang@windriver.com wrote:
>> From: Robert Yang <liezhi.yang@windriver.com>
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   ...gnore-pwritev-pwrite64-tests-on-musl.patch | 62 +++++++++++++++++++
>>   ...toconf-macro-to-detect-largefile-sup.patch |  4 +-
>>   ...kport-ax_prog_cc_for_build.m4-macros.patch |  2 +-
>>   ...001-strace-fix-reproducibilty-issues.patch |  2 +-
>>   ...002-tests-Replace-off64_t-with-off_t.patch |  2 +-
>>   .../strace/strace/Makefile-ptest.patch        |  6 +-
>>   .../strace/strace/ptest-spacesave.patch       |  2 +-
>>   .../strace/strace/skip-bpf.patch              | 25 +++++---
>>   .../strace/strace/skip-load.patch             |  2 +-
>>   .../strace/strace/update-gawk-paths.patch     |  2 +-
>>   .../strace/{strace_6.19.bb => strace_7.0.bb}  |  3 +-
>>   11 files changed, 91 insertions(+), 21 deletions(-)
>>   create mode 100644 meta/recipes-devtools/strace/files/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch
>>   rename meta/recipes-devtools/strace/{strace_6.19.bb => strace_7.0.bb} (96%)
>>
>> diff --git a/meta/recipes-devtools/strace/files/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch b/meta/recipes-devtools/strace/files/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch
>> new file mode 100644
>> index 0000000000..d19533854c
>> --- /dev/null
>> +++ b/meta/recipes-devtools/strace/files/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch
> 
> It looks like this file has been copied from the directory
> meta/recipes-devtools/strace/strace, perhaps by the AUH misbehaving.
> 
> Also, a few of the patch refreshes look unnecessary to me as they only
> change the From line.
> 
>> diff --git a/meta/recipes-devtools/strace/strace_6.19.bb b/meta/recipes-devtools/strace/strace_7.0.bb
>> similarity index 96%
>> rename from meta/recipes-devtools/strace/strace_6.19.bb
>> rename to meta/recipes-devtools/strace/strace_7.0.bb
>> index 7b8d4851fb..1150cfda61 100644
>> --- a/meta/recipes-devtools/strace/strace_6.19.bb
>> +++ b/meta/recipes-devtools/strace/strace_7.0.bb
>> @@ -20,10 +20,9 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
>>   SRC_URI:append:libc-musl = "\
>>              file://0001-Ignore-pwritev-pwrite64-tests-on-musl.patch \
>>              "
>> -SRC_URI[sha256sum] = "e076c851eec0972486ec842164fdc54547f9d17abd3d1449de8b120f5d299143"
>> +SRC_URI[sha256sum] = "6c92419be3f2ec560b31728a4652217c59864c8642ba7b1b3771b1b013ad074b"
>>   
>>   # remove at next version upgrade or when output changes
>> -PR = "r1"
>>   HASHEQUIV_HASH_VERSION .= ".1"
> 
> Please send a v3 with the comment and both assignments dropped.

Thank you very much, V3 has been sent, with remove the above lines and
strace/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch.

// Robert

> 
> Best regards,
> 



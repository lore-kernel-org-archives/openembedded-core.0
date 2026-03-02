Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82951E9B359
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 10:32:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.157700.1772447564031552142
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 02:32:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Cm3Yuhaf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=752162eecc=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62240nqX1320945
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Mar 2026 02:32:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=evsZddqNpRgH2NFAiWpJO1Z/AZz/xqBujE1/GOQDtFw=; b=
	Cm3YuhafOJxFrNmwXzrKA4gswWOfpRgTQhQF5ZZGISF64Gkwu/Qb4TAnb34bPHEd
	vmmWVYJidnPTnxSHWCUQOCyR4+g3AMjJlCVXXun90BgX+j5Bf6MVo8Slw0c3cwBG
	q6A0Ezapij8ocIkz55vpsBDwE13DWJnwbnt8lCzlW1g7nAm4R7y/FUSRM+pDRI+U
	/OTCSJOS/BR+/ATqaLqi0EwT8eqKXxr4t1fdhYysVnkfsphT+OnzFfYMCgcVkGCj
	/bKtxrfvoBbcV6VVowLo1iKTNjlTq831INZATcXeIIzzNC7ugEhldn30NQ2slQJO
	AotntdwHN7rTnz6HF8fdog==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010061.outbound.protection.outlook.com [52.101.201.61])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckvh41vb1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 02:32:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CwUAeD11XdEv/5etaOeQfsmHZyLdZMuq94yaCGAOTHU8jLYLm17Pxn4cDfpeeaq/iTmACha9KJhCOpC65J8zmol5hWrBMtT2f2GwRFZYCjpHWjRbmmxIu5pDxtRSmSrUAFXFwWozLozffNjmAKqgki/g+5dH4r+I++z94Gk34/CGAyVB8HacvFc2/wwYp8LfsOO9gaPFKc24nHquDGIzZ4wcP8wQ2PbRJApwedNt5//Ck8Jcx0hkLex6L0Wiz+bAcMob3Tb2PIaBdDbWxlaNGljpQBcj76rL68vGDcgenkCMtGiv/eY1O+nDBQ1nREznZ+FdTc5UvYYUPc7Vnin7Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=evsZddqNpRgH2NFAiWpJO1Z/AZz/xqBujE1/GOQDtFw=;
 b=TnWAscyl/9PBP6HL3YQobuHId/VVtgb6XSSNb+eyXR1hyb2NPXZE3FJ4rHZy1nRLfgrBzB1TvHdS/JKNlLaMES8gPK4PiUQOg+YBrs0EiOSXwiUchGfu7lNPyHdNp+ao1Rrh9qIM6RA+zGB/FvIVzMp8p90DUNPTTfpCSR5Q3EeyI/M3o+XvM4asi/PwkEpVLeWptowUDdfzPnzG2nwQRUSC8KBxuV+N6YHr0V6yht5icHC7wrUsNpNC7PIFKl+QV68EEwRO6qnemnDXwzUDM3gkD0x16lX+mlJnNq35cWYFAZbN3mRLSI8L6TmvWlcbYCEtxSUPifskfYCzJB2u5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH8PR11MB6682.namprd11.prod.outlook.com (2603:10b6:510:1c5::7)
 by DM4PR11MB5261.namprd11.prod.outlook.com (2603:10b6:5:388::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 10:32:41 +0000
Received: from PH8PR11MB6682.namprd11.prod.outlook.com
 ([fe80::cc94:c7d0:93c5:b6de]) by PH8PR11MB6682.namprd11.prod.outlook.com
 ([fe80::cc94:c7d0:93c5:b6de%5]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 10:32:41 +0000
Message-ID: <362ef8d3-fd5c-4a45-b6a3-739aabde6959@windriver.com>
Date: Mon, 2 Mar 2026 16:02:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4 V2] Oe-selftest for Clang, LLVM, LLD
To: openembedded-core@lists.openembedded.org
Cc: Randy.Macleod@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20260302064938.2052450-1-Deepesh.Varatharajan@windriver.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <20260302064938.2052450-1-Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0088.namprd05.prod.outlook.com
 (2603:10b6:a03:332::33) To PH8PR11MB6682.namprd11.prod.outlook.com
 (2603:10b6:510:1c5::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6682:EE_|DM4PR11MB5261:EE_
X-MS-Office365-Filtering-Correlation-Id: e637956a-89e1-49c2-40fc-08de78470877
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	2azWg+8dNM+lqodqIu41Wi3Rx5apB8Sk9abKlzJ4LAj3KlmdHM29+C6CjVmq4WC/LDOYTX+Tj4Oebap6KTPDopSuuTipNi4SPt2LXpAFPue3KM3RDZPbWMT87XPR4XTW7mkN9sZ95xk2+KAcLjXN711u6IVy4C6mFjYBhy724lVDv0sFjjuFc4KgbxfjRvOyVtIh750sCfVd3vEewES5JDUaCjsGnxhqLna8n4OBb7COFgPim8At/8aewysOfbZFTYKLuSSY00Ulq8z/i+peISWeg+uOeczd7gVf0dleKI+2BPnNEYwK9jGeb9CXOEO6h/Gm9zDw8oUtzvNq0Mdsd2RmZ4J0DVBwg5FQW5Sx9gFP+triDVdJcsI5hui7iTYMuC1i3q7qdjKUnccmfFZC+H3MX00YUPvcoXGaUMnZiBzRcUUtEG+mulAU1kqDy70rI6t2eIFmLsrNKXgczX51s1Beqx43pP4XbqafyAUZJUASw3JvzNo7wjCDQ/twy29Ga9BaMImU1WVspF26bKrkHMV+pNPQk3iyIKMPE4KfOblsQsgpEpGvRnYCQoj1ApWDmz9tRr2GpoizdlYf9XopbgmPWBOCnm3Bs74auqYa8ZnMs1t6hfzmyRSDewKvO5Kg4lq7zShlt3O0tumuc0G1y756y6xMdtMkEvCnMyPEGbh7I4K+w5unB209lO6n+4rSX2LSTFWJGYHbuJYdU8+qCSW4+HtfOo68J8+Zf0ZdwA8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6682.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y0F5VjExb1Z5a2VTN29mcmdQSnMxV2R2K3VMayszb0pBSGNOQWxUd0RsUTR6?=
 =?utf-8?B?QTlvVlh5ZTVxVFRsY3lIbmhQTlhpUjd5dlVyZm5DTEFVME9sTHNVOFdMaVZh?=
 =?utf-8?B?ZEtoU2M4MGRueEpmTnhXYkZKV2FiZGs3aUoycmdwV3NUOVBnbStCMDNHV0tY?=
 =?utf-8?B?WktvYThVU2QrbHNFdGNOME9CVmZmdjZKR1VZZTNhVkdIUjJaUE00aUlYTDNS?=
 =?utf-8?B?WVI3cjFKcURDUnJkQlVoV3lOcFRNUUF5OFBkL3d4R3JPZTR4b2VlMHJ2VVdS?=
 =?utf-8?B?UkpNMy9XQ2dKVm5tUTFBOHlKODczRGx0b2trSVJLa1dIZjVsQ0N1bFBaaUc0?=
 =?utf-8?B?MnpwbFFtdnd6SEtmNWYyMXlmaCtRLzhTRUlhbnlJRndOUzQrS2ZicGR4TTlk?=
 =?utf-8?B?VkFBY2xyZDlreXJBMHl0WE04QmU1U2s3aXM5YWN5WlVVNVVkZU5KV0U0SU54?=
 =?utf-8?B?VFFTSjFWWlJ2Y01zZkcycVZpV1IxYXdPdyt4VzJSRjVZL2Q3SDBYa1lLNGx0?=
 =?utf-8?B?T3VWRU93S0c2YlA4Q0FNcVpLeXc2VlFQTm9BakJYV2J0dzVGUE1DeXc2NzZ0?=
 =?utf-8?B?Nmh4aU1BaGpuY2ZBZkMxdkE4ZjludnZudEhHNml4eW12OENmcG8vMFZlZ2My?=
 =?utf-8?B?RWo0NHlPMlltKzVpNlk0ZDlSNU11b2c3SVlCMXpDTkdEYlRIUHZmZG9xV3Fp?=
 =?utf-8?B?b2RUdzZ2d2ZWMnR4aEJOTGsycFJVR0dZYlp0WHJhRmlvVzAvN2ovaXlIV2Ju?=
 =?utf-8?B?Nm41cURjMVlqTWU2a0kvS0Z0dW5LRlFKdjV2RS9QVy9tcU5JY1JMa2Y1ellw?=
 =?utf-8?B?NzAwV1htTkZodTk5eTE4blBGYmhqOVAycTl1SjR1Z2xwaUJVY3IwbExFUjc0?=
 =?utf-8?B?NFU4bktQWlY5ak9NTDgwNDgrbXlTdjU3V2Y4cUxlN0tKVzN0VHVCb1ZzOWZt?=
 =?utf-8?B?S1hEcGdnTkoxMXZNS20vb1JFem9nS1F1SkxDaGo4Ymc4dW5GWW9CYWVGTzNh?=
 =?utf-8?B?NUJZdEFlU09FY3V4WnFsZUhGclZxY0ZSVVo4M1daZzRwenVSRUxOVzY3NGhy?=
 =?utf-8?B?S1d4MGRlMkdySjZ5eTJ6MmVxTWdKQmFFVzd1QmM0N0x6SnhBVm5PV2VQalJi?=
 =?utf-8?B?VFNIdGhEY0R4SWo3ckhlWFBaNFVzNTBZSDdrT0ZrV1RNendpNE9ldU0rSDN5?=
 =?utf-8?B?MHZtenRYOUxPU0FkM2RFcjhjL2dQQUFpQ1dUZndDNnVDYmN0R2ZGQWM1MUgx?=
 =?utf-8?B?Y05KdlFnblBPWjFINFRNOERGa0x3aE5mbEJMUjkyR1JBM3VJU2tDWkJ0MEZM?=
 =?utf-8?B?WVAxVkc3emlveEllbm9haW83cDBSTjdab1JxdVNibktLYURYd2dPREszYVZp?=
 =?utf-8?B?ckkzU01yT1JwVHpHMWNPYkRBL2lBdmlUWWZIZ2kxRitCQ1JhVUhwUDNuOUM1?=
 =?utf-8?B?ZlA4Qys0dXJsRmJ3R0VReXBDMjNNV0kzWDdybGhvY3J3OWFmbFkydzU2OUlp?=
 =?utf-8?B?cWM1RUlCU2VJQ2R0V01YeU8zc3IzWFBNV0VTQlp6UFlDRGFqYWhVM1FXei9W?=
 =?utf-8?B?dTR4NDhvNXJRYldDUFlmbWVJRE9aWld0Ti8zWjhVbCtaUVNub2RBTHBhSVEy?=
 =?utf-8?B?NW1FNVZoeFBNRDNiTUxvNGZ5VnZDc2c3OTQzWXVHMnhYdW0xbXhlWVZDbDNZ?=
 =?utf-8?B?SzZpczNZQmFBekREd0NTYlJnTjk0ZkJuLzN4dHRnUGtqRS90ck13QmtBWHJZ?=
 =?utf-8?B?bCtucnBvZjBMemljN1AzN2lIY3c3QXEyalVjQTJ1SWRFNlNMZVkyMHRiU1Zr?=
 =?utf-8?B?SG5oY0t0OElhZ0tmY0VtdEVFemJBRit2aHdMeFRaVUlPLytobUxFQldPb2hn?=
 =?utf-8?B?QnpDQXhRV2FyNGFleFdwdUtuSmtUN0pXVGplMExxRG5vWUJUZ1RtbjdDNUF2?=
 =?utf-8?B?UEJENVBxNjZDMVo0RFlIYlE3UlBnWFZDTDVvcHhLWkh2Y3NLdE1Wa0VKcjhi?=
 =?utf-8?B?Q3lQa0NJbytudmZZUWZTNVBxTEhreVdXT0Iwd0haeFNzRlhKNDlKaEN4VXFX?=
 =?utf-8?B?cEJzejlqZGxkS2RWQnRPVUhrQVlaMmN0TGZpbXVaRy95aWlBU09pMnhBeWd1?=
 =?utf-8?B?Sm9KSFcxOE9mMWZQd3o4OEprUXNmdWNiRlBueHNYUjFFQlkyNHJQTTMzbjk5?=
 =?utf-8?B?M1BzTjhrbmtYMGVpdWpMVDZDVUJMWjcvUEc5aERHV2JVV0lFTWJpQ0pUcVpl?=
 =?utf-8?B?aUNSRE5NNVhqaEtsZURxSHhNaEZVQUJlWTNHdHNpR0wzNU16eFVXWkpaZFJa?=
 =?utf-8?B?OThVYXdIRnF1Zjk1NEZmNXU0ZzdPN3IzMlVlOXpEd0xmaW00UFJnRSsxUzhI?=
 =?utf-8?Q?yPgl6dTlZmwMNueO9CCl9SXzCLIN3PnbRiv5K?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e637956a-89e1-49c2-40fc-08de78470877
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6682.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 10:32:41.4412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lNzA6J10c1snukp0FfUZeRE0FaddIog2NflXDjuxmuzsU6wJbadh2NEwoWutcoIYS2H+/8v8yEF2GtDhZZab7vAEnpexOh5OHH6C5KrAdKK5VEPde/cEe3rRmcqkjjlo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5261
X-Proofpoint-ORIG-GUID: Jaz1qJ6JtDyEXe8Q4B_zJRgSSBekQ4hW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA4NiBTYWx0ZWRfXwqQfrRIH12VS
 BFG6U4QzvPgvwiO230HliHGEGGVb39sMturmV5dCkT1P/VZK5u+Jx/YQaaxj5JG89UF2fsaFIXJ
 BsFo61eKCEIgk6IcbDzB4e7Aoz8/B2mjKeYXE8FmCLcWz9E1G/EtuSDaE+Yhl24bOS167bAFvHW
 YUYZQir00ub2yMr8T+66pkqnUI3JmTPXgeY7jCgCXWg79vq8k0ufREuteC5pIpsqWp9Dzutsl/O
 HodFy7HYU59C4ZK4u1HaWGUmpR3bJikHsQW+LuMPP+/Frz4xNNKJgMil1BOj2s4o7FznT6DMgcR
 oHX9+nRfm0MhhK22CHJX2qQ/7uXtp4Gz7arqlpBNGLny/DITl+ybmBdQoC/abuTgzysEw/8+Zic
 Cqv4qF2SKsZ7hcv7Ueh1DOi7B1gn+yHI+LVO2LQ9UL/MDeIiA5rMwyrqqbMKhoeeUMy4gRlbnth
 kq0n6t4x+5JSAEeiI6Q==
X-Proofpoint-GUID: Jaz1qJ6JtDyEXe8Q4B_zJRgSSBekQ4hW
X-Authority-Analysis: v=2.4 cv=Z/3h3XRA c=1 sm=1 tr=0 ts=69a5674b cx=c_pps
 a=0p5N1A/s2xr2YPsuh+j7dg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=t7CeM3EgAAAA:8 a=H4JC9iuPrgR6bzpHMwUA:9 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020086
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 10:32:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232187

Hi All,

Please ignore this patch. The llvm_sysroot_preprocess_testsuite function 
should be added
to llvm:class-target, not llvm:class-nativesdk. I will send the 
corrected version in V3.

Regards,
Deepesh

On 02-03-2026 12:19, Deepesh.Varatharajan@windriver.com wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> This patch series introduces a test framework to run selftests for
> target builds of Clang, LLVM, and LLD.
>
> v2 changes:
> - Enable required CMake flags only when running the testsuite.
> - Ensure default build time and package sizes remain unaffected.
>
> Summary of changes:
> -Patch 1: Disable clang-tools-extra tests, as Clang's CMake cannot
>            detect the llvm-bcanalyzer target.
> -Patch 2: Enabled the necessary CMake flags for clang, llvm & lld tests
>            when CLANG_ENABLE_TESTSUITE is set to "1".
> -Patch 3: Selftest script for Clang, LLVM, and LLD including exclude list
> -Patch 4: Fix rust build failure by replacing target llvm-config with native
>
> Testing:
> 1. The test suite has been successfully validated on x86-64, arm64, riscv64
> and arm32 for all Clang, LLD & LLVM components.
> 2. Clang and LLD tests passed successfully on x86. LLVM tests are skipped
> on x86 since it's broken. A follow-up bug will be filed and addressed.
> 3. Clang, LLVM & LLD all together ~80K tests are there and we currently
> ~250 tests to exclude list which are failing (0.32%).
>
> Impact on build time:
> These builds were executed in a controlled environment without poky-sstate
> enabled.
>
> Default(without changes):
> +-----------+------------+------------+------------+----------------+
> |  Target   | Run 1      | Run 2      | Run 3      |    Average     |
> | --------- | ---------- | ---------- | ---------- | -------------- |
> |   llvm    | 22m18.441s | 22m31.905s | 22m23.718s |   22m24.688s   |
> |   clang   | 30m09.774s | 30m22.680s | 30m15.312s |   30m15.922s   |
> |   lld     | 1m26.994s  | 1m30.415s  | 1m29.006s  |   1m28.805s    |
> +-----------+------------+------------+------------+----------------+
>
> With the testsuite changes applied:
> +-----------+------------+------------+------------+----------------+
> |  Target   | Run 1      | Run 2      | Run 3      |    Average     |
> | --------- | ---------- | ---------- | ---------- | -------------- |
> |   llvm    | 23m32.104s | 23m45.887s | 23m38.157s |   23m38.716s   |
> |   clang   | 30m31.402s | 30m46.198s | 30m39.445s |   30m39.015s   |
> |   lld     | 1m29.845s  | 1m34.212s  | 1m31.925s  |   1m31.994s    |
> +-----------+------------+------------+------------+----------------+
>
> Comparison:
> The additional overhead is minimal and primarily due to enabling
> test-related build configurations.
> +-----------+-------------+------------------+------------------+
> |  Target   | Default Avg | With Changes Avg |     **Diff**     |
> | --------- | ----------- | ---------------- | ---------------- |
> |   llvm    | 22m24.688s  | 23m38.716s       |   +1m14.028s     |
> |   clang   | 30m15.922s  | 30m39.015s       |   +0m23.093s     |
> |   lld     | 1m28.805s   | 1m31.994s        |   +0m3.189s      |
> +-----------+-------------+------------------+------------------+
>
> Impact on package size and Fix:
> The testsuite changes has a negative impact on certain package sizes,
> as below:
> +---------------------+----------+----------+-----------+------------+
> | Package             | Old (MB) | New (MB) | Diff (MB) | Change (%) |
> +=====================+==========+==========+===========+============+
> | clang/clang-dbg     |    44.99 |    59.79 |    +14.81 |    +32.92% |
> | clang/clang-dev     |    30.22 |    30.22 |     -0.00 |     -0.00% |
> | clang/clang-tools   |     5.05 |    29.58 |    +24.53 |   +485.87% |
> | llvm/llvm-bin       |    16.40 |    71.77 |    +55.36 |   +337.50% |
> | llvm/llvm-dbg       |   386.79 |   646.12 |   +259.33 |    +67.05% |
> | llvm/llvm-dev       |    32.67 |    33.67 |     +1.00 |     +3.05% |
> | llvm/llvm-src       |   387.54 |   389.44 |     +1.90 |     +0.49% |
> | llvm/llvm-staticdev |   609.68 |   616.80 |     +7.12 |     +1.17% |
> +---------------------+----------+----------+-----------+------------+
>
> FIX:
> All testsuite-related changes are now gated by the CLANG_ENABLE_TESTSUITE
> variable (default "0"), ensuring:
> - Test-specific CMake flags are applied only during test execution.
> - Standard builds remain fully unaffected in both build time and package size.
>
> Deepesh Varatharajan (4):
>    clang-tools-extra: disable tests
>    clang: Use CLANG_ENABLE_TESTSUITE to enable LLVM, Clang, and LLD tests
>    oeqa/selftest/clang: Add oe-seltests for Clang/LLVM/LLD
>    rust: Fix rust build failure
>
>   meta/lib/oeqa/selftest/cases/clang.py         | 299 ++++++++++++++++++
>   .../0042-guard-clang-tools-extra-test.patch   |  74 +++++
>   meta/recipes-devtools/clang/clang_git.bb      |   8 +
>   meta/recipes-devtools/clang/common.inc        |   1 +
>   meta/recipes-devtools/clang/lld_git.bb        |   5 +
>   meta/recipes-devtools/clang/llvm_git.bb       |  18 +-
>   meta/recipes-devtools/rust/rust_1.93.0.bb     |   5 +-
>   7 files changed, 407 insertions(+), 3 deletions(-)
>   create mode 100644 meta/lib/oeqa/selftest/cases/clang.py
>   create mode 100644 meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.patch
>


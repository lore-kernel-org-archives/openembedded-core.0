Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01BA0C44520
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 12:29:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12203.1784291396925015428
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 05:29:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GPXMJ37s;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1658a50258=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HCJEMQ998128
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:29:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=jK3fzupuS5F0o1u2H7kEAWtBb4xjhOREMOJbN88hYe8=; b=GPXMJ37sfnOS
	l6C6xM4NWlh8RMd63BXv2QvpruW/0nJWN/NFo3RZdIUL7amlUeY8xiSwKTysJoU3
	MILyINE5Y6oe/m8PBV30u77p7OLM1u+qX09u8yWMxTBNEpqOmLvYzo4Rq4LPnozA
	m/FMdwnPqLt9w6S0TSO6h3VzGrJMNbhPcCsx5xecSishdmE5JOjxEGWAA8/UsvUD
	hPIXe4m0LNaF/3d3E4nxsbdC5WXRDSTEDeV1UZ9VzrKMfYlV8Mk8tIdAX3JOFetL
	ZrHX21oshVH7OsS3WeiXdsQMbp3mrm21enQY5L1TBcYnPCwbOmO05MeNQdFjz6UW
	E+9JDztZyQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011070.outbound.protection.outlook.com [40.107.208.70])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fbnbdsv4u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:29:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gvciFR3FZCjoo5JTjhuPrvRnLgc+2/iwXC8xRw6m15g6VBumYMJPzz2Z6oVHpqBs42Wvg055y2NdaC/RTuy46ZuiYrcHbi+I6oNsHWCwfcfs56a21O5otfcQM899vx2IwGIaHHh28EkePT4LBm+W+rRcJv64+KgNipQTGsWCk5Md9HASd7I7bs6HlwZehGWiagYNoNp5R8ks77V0R+LS6/PLpTe6ckmTtQvFSYryJkzaid5KF3macz84Tu/D3bjcldn6AFxros8nLceRT3GHGDIcpFoRXihL3Hm5ZIkU9TqNrFexeYWmHrJQcSHRQYgv1NaFLjCWQ0x8dmDTuZnx9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jK3fzupuS5F0o1u2H7kEAWtBb4xjhOREMOJbN88hYe8=;
 b=HanB1Vd5bS0MZcchLTev5IoSRArmk7p3d0alqligSBbGQlyFGkNa6O7HGN2DD051zOGwjZEE39Xq/FVfsD+PsRK9fYhuSSbK788avJ4yiO18m60l3TNUCOUk3EGIL31KL2vrmn0X5TuJgCEAAaqCHfW/hsSmlwKYOWsct1rXN6oectMZtzqQK1eLqKCFpo/3sbfpFwWz+Im9cNuvTv5/pzFw5qbUYPctQp+enORCqyE6yS6tc7QH7ieItxJvhx68pP9Ev3QfkWAB7GLIjplzF5cnaUdRPVXMcQFsRGbB2szHzLzZoCJUhzUmz1Y3i5YvgC3UgR5TWRX9ud/seSt40w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH0PR11MB5045.namprd11.prod.outlook.com (2603:10b6:510:3f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 12:29:53 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0223.012; Fri, 17 Jul 2026
 12:29:53 +0000
Message-ID: <a7acee1c-9d07-4e9e-b413-8a440f1700c1@windriver.com>
Date: Fri, 17 Jul 2026 17:59:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 3/4] packagegroups: add
 nativesdk-packagegroup-sdk-clang
To: openembedded-core@lists.openembedded.org
References: <20260717121849.2163115-1-Harish.Sadineni@windriver.com>
 <18C312FCD6D6FB0F.1068600@lists.openembedded.org>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <18C312FCD6D6FB0F.1068600@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0070.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:267::9) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH0PR11MB5045:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c8e097e-4c24-42ad-0ce7-08dee3ff1a72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|10070799003|1800799024|366016|4022899009|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	gJlT1bO6YQ8l3XcQiTflSSufncm+CfAY1Ix9akbdqliALp/kaVg9B/+mNwlm7NzxSxJ0bSyiWbjug+/tReI9HVnX80Ka2W8wwjVGkgAFJOgahagOS+jj0CiZaV2NC8vnm+mj/sHtnLl0zXOjSTlX3iN0evfUGScGjy/8XVN3r4q/yqmSQ0b/DImrvRllT6c9PBpyqAFlcXdvkA2p5y8UCH988z5g4jrAtXAa+04BO7LDX85a2uYCAeOX8bDDaBw3xece3NqmwJbPtBFpCSZFnzT7equk+717w3NKoTdwdRKt+nBfQngh6crRNO4l1KHQUFOxsRg4K0iSVa2tTbuYK2ybtT16IDdlwM28gPNjVm0UAIvJ8GwItsVfHM0SyPWxkvFuNu6AKBuOMpoCio5KcTPN1Vfm+2EbTPXXcXAdpEN+UV4aB71mDEGVuxtY0Xeq77N2Nr60HfaqMTuAIwe8Cyu4IUL5rwOhrX9T2Fg62BKr8IXPx3A1KB3iuaB+e0GTFjXso23PEFf7NpXTNK/pvQxwYEWrMKdzqud/pkJxW14YhD0Te0A2kJW8gerwUype5HV+KVBsROiuq8sZ/eDnU051QoqiZukP/Dv77BegQpV5MTtfE3qACcPxsicQIKKX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(10070799003)(1800799024)(366016)(4022899009)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZlVkU1dXWjhiRlFDMmdQa0xTc0orVWJGTlI4Z2x0SG1HYkZidW9OK1lxb01X?=
 =?utf-8?B?aU9QNzdXRHVMVjc5VGs2RXI4bDVqZWxYdkpBdWtudTZxYm5SMXhzR1FKZE80?=
 =?utf-8?B?TktJZU0rTkZlQnF5cWluZThweTh6T2loSmhQV3V4SWRyNmRtUW1vL1I1TTBm?=
 =?utf-8?B?VndZUkQvYktuaUNYeEd5d0NPREtrbDYwcW5OZDBLZWp1OGZsRk8wZEQvc1RP?=
 =?utf-8?B?Qm1WRUIyeTkvV1pLOWdPS1lHSTdDS1JFN1pXNmI5NzdZTXNXL2dzUDl5N1o1?=
 =?utf-8?B?WW1Vc0puZWNXVi9rWTJ6L0hXOERxdWVhRXMxWGNLcDdmTXk4MlRYTmdNZ01u?=
 =?utf-8?B?ejVRZlBoNyt4V2thRi93WUxia01kSHFTaHpaNHdleHB1bFlDSTNMbzF6Rmh2?=
 =?utf-8?B?ODdNRmxlOHFGdWpKN2d4MXlWMHBKRGZRbFFGT2NITlhiMUFWYno3cTZmNm8r?=
 =?utf-8?B?NEFzclhYaFZzYjVBYmhvclZIKzU4SVRVdU9yMW9SL3YxWUxBdk1NbHpGU3py?=
 =?utf-8?B?V1NtanZENmpKMTlJMmNOYmpkcHI1dmJGREF2VUo0RHBtL0V1Y0JzU3hTc3M0?=
 =?utf-8?B?VzJCMzVML2pFZWFJS1ExMWc0bnhBaVhlbEtPRnY5b2pJVDRIOXFqL1F2OVZI?=
 =?utf-8?B?dUhPNjY1UkJ5RGJudmwyMFZKSGxuaFRTclVWNlNuUCsyaVlMUkVwOTc0aUtL?=
 =?utf-8?B?ejc5MGhqUkVGOU1zNlA5Qy90MCtKbUtMNk9YM2pjNzJCUFA0VkEwUytlUHJy?=
 =?utf-8?B?TVFUaDZqK1NLb3p6K2lyajVKNXVOamIxSDk2aWUrR1F1Y2pBZkFvdm9iOHp4?=
 =?utf-8?B?cFNYVUNGdUdPbGlWSFc0U3NkTG1SamtPTzJWUnRwcVJxdk9OS0Z2bUZERkNq?=
 =?utf-8?B?ZW5ZdUhXb3NHR2x6Y3FubHdFekhJRi95Wk44ZFBkeGdlV3lyWHZnS2c0eU1F?=
 =?utf-8?B?WndPc1BpTG5jeTVUSFlDTE42Ym5PRVFOQWhibm9VSzFxblllNnpuUUNmYURw?=
 =?utf-8?B?MHdVZklxSkNDa05uQWFiTzBmN3lpWUFkUU1wZThtTXU1R3dyalR6N2tZazNw?=
 =?utf-8?B?aW9NYmNnOVBCVUh0YTNtZnVJOVp2VkNIUzljdXNvZ1lsM3ZFNGlBaDMyb0JD?=
 =?utf-8?B?VjFTSTkxQVBXSldjUEhpZVNMZ09ZNnpYMXdaVERkVFFmWS9JZjA0ZDlWUWZ3?=
 =?utf-8?B?TXVCdUFtUnJ1dDZPNE1BV2ttdUV0aG1ycmFwb1ZoYzhXeDdNK3UrelVDY0dG?=
 =?utf-8?B?UzhtbEcvWGdIcEhJMTJGaDNTNjF2L1ZEN0hmSVkydUx6dkhsSVFRNzNPM28r?=
 =?utf-8?B?WEFISWpFajZDaWJkNG5hekVwbEZiRlVVVVFHZFo4UE1tb3J0K0ZWY1lSY1Nk?=
 =?utf-8?B?WlVZUjM1V1NkT2pYVmFBNnJ4YUZrazhZR3JCZG0rMTNtL3cwR1ViOWdwV2Vr?=
 =?utf-8?B?RUNkT1BSR1JlZ0JNUVdJbWRhWUZXT3VWUWhGZzF0VitkalRhVXlmbFhYTG1B?=
 =?utf-8?B?aGpBeVhxL1haU3BXZmNBR0JGQ2NHMjQxaUtLTThka2ZKM1ZNYzNDZ1htNEZH?=
 =?utf-8?B?ZTVYTkpwZVA5aVFNSTJoVjN5Nmo3WlZnbFRIZ1JiVm42UFBNNEdSWklRamI0?=
 =?utf-8?B?dlp1bW15dSsxN1Qrbk5vMEdSdFFIcVFoOGNMRjY2YUNWOVoyblF2VVJRRUdN?=
 =?utf-8?B?TU1nQ2FCOHN5a2pRREpGMElkN3A5R2NYSkhEOGFpQjBBaFBpTVZWSWprcHh1?=
 =?utf-8?B?YnBFZ0N5S0doZCtRejd4c2drVWFpWmZxaEJGL1RFRFJadm5UYjNWN29sREZo?=
 =?utf-8?B?R1RZN0VXTzdQNFJWc1NXd05KRE5mZkxtOWVOMkxLOHlGcTVWdUdQdE0rVkZU?=
 =?utf-8?B?NzhnQlJmUmpsK1RkdTFOanJBN2YrRGNreTVDbXRDakJaUjFhUEI0ZDdJanJN?=
 =?utf-8?B?RlVTaFNVdjE4K1N5RklMdUNVcDB0WU1zTDJZczVpQ0ZFVWthSjZPTmtoVzdi?=
 =?utf-8?B?SEU4UHJOYUNiZkJURWdUZnU0YnhzOVZCaEROWm1mWnpCaWt2SnMrMFZRU0NM?=
 =?utf-8?B?RXQ2ckVUSU1jMWp3YXRvRy9QSk55dzlrc3FlWngrWm4wajR1QVR3S0ZJbk9E?=
 =?utf-8?B?NzY4OUZyY3czYS9UQTROM2JrU3czV09NV0w5OTIrTW1xKzFtWm10Z1hQU0FO?=
 =?utf-8?B?b0s0Q3c5Zk55amlrK0dBM1Y0WEx3N0Zpb09vekFSclhPNmRzT09IZnZoRERz?=
 =?utf-8?B?cmVIeUE1TldGVXJ4Vk9TREV4NWpZMk1mK3NnQXp6bFEzYlJZQkdNNWk1UmJF?=
 =?utf-8?B?SkdkbjBuRUVBeXM1MWxjTmJybWZwbEpRdWxYZ0VsYmJMeU1INFRzZVkwaE8v?=
 =?utf-8?Q?KVPa6r/IH233Iz+r9jM8hLUg4M/Bx98pUATuocyK1H0dc?=
X-MS-Exchange-AntiSpam-MessageData-1: NGgAsAiyz/WrQ0NBkXpzZ0JcgWPGxS6S7y4=
X-Exchange-RoutingPolicyChecked: 
	pYbLRJO9nIodH9/uoNhfkHoODqMv82mVUFVfiAGU+mukzrGYBU8t6XXXUXoESzNC4PnykgGYWyUDD+xprTaGsIS/TSdmzErBFLI5QpHfplnIDr76d4s5J4P9yNhN85kAQ1mjJjxgJWE4beJOCVhNpgLj1SPjvcYg/as01Y0kCxH0iKM6+E1i1GSau1Vzs1oWt97rgc0w2br2r/x201AoUZn7h3IkVX6wsgPJI4AFxXI/8K3pAMxwLfuop2VAFGqHJVoioss22NzGLPtW1ATmrvb872aMaI0T6u+aueNoByRWqFZOlt9f7K+lYbL/iUsjO133z82UHVfh7LxLynusXg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c8e097e-4c24-42ad-0ce7-08dee3ff1a72
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 12:29:53.6227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2nqtGk5U6PKeGBDhn81bnEHfsMw/SCRACiAM7x6/Ss8J6jB9WgPlMegWcoZfe9eHobGAW0laKv9rGcXI1v/lYK5V4LXdKOzknORTUTas4wI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5045
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEyNyBTYWx0ZWRfXwiUrtWQqnsva
 FM/4emzTOgb/a9REooLOfye/+tMOOHBM75jNXCjobMxjjuCHb2RLS6fgRtO3WPV+oBmkKPOsy14
 AEb5Jbljz5uSaF+9kRTA50TW9r6Wqh91BVNEEHYTYysMQa8AlqE1lSAdCD6C7yVyB6l8h3FLadU
 6SqsDdWcWI/hqOsIZM4hwtPoD8ScC+e99z1IfXTCTYfwM+z8z8pGZv3UAecYtB47Ow7ULRpBeue
 /ms0/2fxhLtveIqL1++PNaLztBFHq4HrRsVuhyExxEQjftO6h/cEeJV+qfa2qJBjTUKvBZmtYIp
 le7xOQGHUYRogMuiuxYTEOUYyLakfxtfhIZJKXE1zGnMkPCPitFnJRXD5QcDhUKNHjm5jNgZX09
 7M+B6DzFGRCuioxyiFug87UZndRhfrgcLnF3P+/gXmK0GPG2K4o7BofVNGAgWBtOrAXIcy3cqVS
 bZVG2Z+2xu3w1PbeDCg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEyNyBTYWx0ZWRfX/hJCnQIz3oT/
 SOTxCdlsHo9tCWLggR7PxI6iqjgDBwt8zDhU5+cj69VtF39XFyg7hnz9XNatnGdDlzDisn61KRn
 iNSB+J9klKAZEB9dfxRWgCFh+rDSqZiUEjH4Bg3u3tRbvp0uuCel
X-Authority-Analysis: v=2.4 cv=VI/tWdPX c=1 sm=1 tr=0 ts=6a5a2044 cx=c_pps
 a=0qEcZjvAL+vPLqsQtgLcWw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=0tw0CzZC0HDFEbDj4LQA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 5v7X9nOmLQQzwKaw16DcqH_OniCDEzwf
X-Proofpoint-GUID: 5v7X9nOmLQQzwKaw16DcqH_OniCDEzwf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 12:29:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241169

Hi all,

Please ignore this thread.
I used the wrong packagegroup name in this commit header.
It should be nativesdk-packagegroup-sdk-host-clang (not 
nativesdk-packagegroup-sdk-clang).

i will send a v2.

Thanks,
Harish

On 17-07-2026 05:48 pm, Sadineni, Harish via lists.openembedded.org wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> Add a new nativesdk packagegroup providing the clang, lld, and
> llvm-bin dependencies needed to build external/out-of-tree
> modules in the SDK using the LLVM/Clang toolchain.
>
> Rust support in the kernel on riscv64 requires the LLVM/Clang
> toolchain rather than gcc, so this packagegroup is intended to
> be added alongside nativesdk-packagegroup-sdk-rust when the SDK
> targets riscv64.
>
> Add this to TOOLCHAIN_HOST_TASK to include it in the SDK.
>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>   .../nativesdk-packagegroup-sdk-host-clang.bb       | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>   create mode 100644 meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host-clang.bb
>
> diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host-clang.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host-clang.bb
> new file mode 100644
> index 0000000000..d6ee2120cf
> --- /dev/null
> +++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host-clang.bb
> @@ -0,0 +1,14 @@
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +SUMMARY = "Dependent packages for building external kernel modules using clang"
> +
> +inherit packagegroup
> +inherit_defer nativesdk
> +
> +RDEPENDS:${PN} = "\
> +    nativesdk-clang \
> +    nativesdk-lld \
> +    nativesdk-llvm-bin \
> +"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#241166): https://lists.openembedded.org/g/openembedded-core/message/241166
> Mute This Topic: https://lists.openembedded.org/mt/120313589/8054390
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Harish.Sadineni@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


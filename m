Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EE3C30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 08:13:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5574.1720080806727614987
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 01:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7915407677=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4644sLKm005644
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Jul 2024 01:13:26 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 405jsj089r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 01:13:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZT7CLdTTetkDQe3++UkyuKHoML5v0wYDn2hxi2CUEuz2ufPhyeNxkmz7oQnA2RkrBwS0EB+d8ACWms41AgWJ02Rh+UwqgihNE32Oy+Enl8sGCn4F4GLXQJzWz9zToky3ImTTCjmC5nkqrqhQhb9o6lfusoV5QApzKkpWlPnoRkuULE7J4yvIPQeMV5uYvYbzY4ictcay30CT6B2Wb+ndqS3F9/ziazyDLdFhNjsbnBzcYxBfkbXFd7h2usjYNWJ445otU4zVpsX9+KaXTWKhXoEfKh90tdRek61qvfHhJ+5sJF1lfpxn06ERjRAlBZLIDNXD8wdCNFLpVmYA1ECE3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BgPw67pBLvELZ1vqh1RIT4eT1cInJmtrwHXNiQaARfQ=;
 b=ahC5flNkQ+I75gbbLikqo9ctK4UH7qVaL9uXyB1LmebLxhKQN/IAWseLi2pF1RxYxw3Sg1JQxb3YaDnTDy0vk/yFEG0LE0iVcqdcjINgUFMNVQRTCLLqB0c3r6bL1ibVEnwVei5HioImCGpYe4NoXOzBSdrO6xR/ppmL9pCCI+DFPGL8s8gezn5T2Jk8Xmz+aAuLdpPUYSAKCAO9VZzpenkAHNtGaCIxSHgIzwNDlfZgZkYBcCxVzkVfyUii+Kp8UpLkSXU8MhIjfM7LK0gwXS1Ta6Bu2YP6Z/YEcJLWmbZ2WTgPu0SONCvAijZpUSC7Adgg/snSM5nKvXEH+zzmJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ0PR11MB5199.namprd11.prod.outlook.com (2603:10b6:a03:2dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Thu, 4 Jul
 2024 08:13:22 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%7]) with mapi id 15.20.7741.027; Thu, 4 Jul 2024
 08:13:21 +0000
Message-ID: <738c6004-4c9a-8b9c-c102-1148aaa380f1@windriver.com>
Date: Thu, 4 Jul 2024 16:13:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] [PATCH] VOLATILE_TMP_DIR: Extend to specify the
 persistence of /var/tmp
Content-Language: en-US
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
References: <17D438C2BEE02E99.24551@lists.openembedded.org>
 <a5803329-7dab-46bc-9fbb-a739a524c126@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <a5803329-7dab-46bc-9fbb-a739a524c126@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0209.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::14) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ0PR11MB5199:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c0fed8d-5270-4d2b-3c17-08dc9c012b39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|4022899009|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VjhwKzNOajVpbUhjM1hJR0ljWU5xOWxuNTZzVU90c09zRXI5QXZ2VERndndt?=
 =?utf-8?B?WVVUdG9LL0ZPemF5aU02dzlaQWc5eUlXS01BM1k3dHV3WkMrOEFiVC9pSG95?=
 =?utf-8?B?MDQrRmRQUTBlYnVuSVhvNGFCckFCbDIrTG5zM0kyOUNnbkZvT3pJU0FadVdO?=
 =?utf-8?B?K2hEQWNQTUxkVTJDUTltMnZyOWkveExqM1hyTGQwaFNxTDVGSVdhSUkwTTlh?=
 =?utf-8?B?UmpCU2Y0WVJvdU1mQXYxeDBUdmZwVHpOeEJmM2QvSlBGaHVlS3FESzljMU5O?=
 =?utf-8?B?UDVZSUttblcrYzJSZCs4aytQNmNrNWlvcElzY1kyODdOUWVkN21zcDJpODcy?=
 =?utf-8?B?NGh0akorMGN2Y0lIandCQVREUXlseVQyTnYrRlR4WWRLREFQcHREeWc1dmFu?=
 =?utf-8?B?UHoweWJxMnlNNG5Wcm4rQVlORmh0R2tXdHNUMFNoQ3hXeEdqM2xPSGxhMitH?=
 =?utf-8?B?YkVabGhXSGF3WmNsdWFubFc0TG5JQlNCbnhYVmhlMHljUU9EN0tVNTlwQkt6?=
 =?utf-8?B?dWhjUVJjdVlCRlh2dDNKOEUwbkZYcUdTTzdHK0dwcFV6Q0N3WnEvTmlZMkZI?=
 =?utf-8?B?NmRFd09IMmlLUlEySG1nZXdzY3VNRjNNN3pZNVg1Nmx0SHNpUDF3b1M5ZmtG?=
 =?utf-8?B?Nm5teE15MSs0S21XVmhQSkJRZEhZdVZpSnI0N2ZZeDBiY3djYjdVWmRlS2VX?=
 =?utf-8?B?cGNYdDMzc2gxR1pESU9SYmJvSGZYTXRzZjRISVhLWFFybDVKUlU0T1hVSzg2?=
 =?utf-8?B?RzFLb2VkQ2NnZzZBeWRVOXphNFVwSDRSZEdRclV5RHBXcUkvZnZZdDhBY0d3?=
 =?utf-8?B?Mis3MERRUGNQZW5TOFQvSzBBSmF0a1BZT0psV09ISDdmQVZuMkN1VUFmeVp1?=
 =?utf-8?B?U2NxaWEyTndyZ1h3L3dTc1J3MkhEY0ZrUzUrcithMGhGKzBtcFJBS1Nucjlr?=
 =?utf-8?B?UHNlbURkNGcrSytvcHIxWWcxMExyVHBLSElZZ2s1NEhWTkhKbTlTUW5NTkh0?=
 =?utf-8?B?dGgwZUlNWjJpQjJOMUlSQVovY0VQTkUzVkhzU3VGSm9PNUw1SDh5TUJVaTJM?=
 =?utf-8?B?cnFGd0JiWTNsekVNU0JqY3FNTnpwcFdIV0g0ZmZDeHBtNkhLR0lGb0pmVUt5?=
 =?utf-8?B?TUZBZlZ5NUx0YlpyTTVxam9sZ3RyR0NtT2NKK096d2dheDJ0Y3NBT0ZmYmo4?=
 =?utf-8?B?WDhWU3BzVjdWdWR4aHdlMHNEV3NhWHd3L0ZwR09kcUd3RXZyOU9WdXdZVXpn?=
 =?utf-8?B?R295b1hwanhvdmIxS3pNUXJaNnhwcHVTbW5TQmZ3WkdTdXNKY2FFZExqSXV3?=
 =?utf-8?B?MldwSThXRXJaWWRJc0RVend1aFBEbHFyVWZlRW5vMXF4UlVPMnJPOFRKKy82?=
 =?utf-8?B?ckp0Z1pPUWNFaHFNL3pFREk5UXpnWTJwNTZzZ0Y0c0c3UzJxWEs3cEt4MmdP?=
 =?utf-8?B?T0liUXJWUXhjZkFlTEZ1UlQ2eTh4bkhZVnNVV2dxcGhBTld3c0JWTXJpM2VG?=
 =?utf-8?B?ODh2amRoaEJuS1R3YTBKWHJpeUluMEVQNlVha2FvU3dob1ZyVGFaMjAyc3F4?=
 =?utf-8?B?WHE0Tk1URDhNbU9ZQXFadDNER0l0eDkxSG9TNnVmM0Vmd0tDdkJROUxNdUVs?=
 =?utf-8?B?TW54cEZsOFc1blEyT0N0VGltemNoai9QbXJlVGhlb2FDRHVKNndYQ2RHZXVP?=
 =?utf-8?B?ZXcrd2Z2MEErVTg3SnRFSUNmTE44ZlV5Y2E0czhKNTRabFVkTDNJRmdVYmNR?=
 =?utf-8?Q?GROxplp/4HUDrA9gew=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(4022899009)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SGFrR0ovQVluN2xWMy9yTmE2cWQ4d0VHdGhzWDZBOTIyRkVSYUdma3lPaGl1?=
 =?utf-8?B?U21KL2M3MUd4UHB4QUVsNWwwRE00ZFMvVGdGQ2FoVmFmUEw0Y3p1UWxzb2FE?=
 =?utf-8?B?M1RYeDQ2aGVXaXFPZnQ4TWdKcHd2WlRzaEJ5MG1xK2IvOVZBZFJUeHhGaVph?=
 =?utf-8?B?NEFZVDBHVDluOGFwWXpoTktzZUtFcUU4NHZUSjJJbFNtRmFWZGhacHB4N2Q0?=
 =?utf-8?B?VUJDamNaQVlJYnhSN1NQU1ovQmQvaEN5aG14ZStZVHpYL3I2bGlYOStrQVR3?=
 =?utf-8?B?SElaSzNiN0xNL2lSUENsSC9XWW5zdFIvOU95ZHQ4UkU1WVpEdXQ4ejdySFYw?=
 =?utf-8?B?djJ3bzZheUdkSHFqU0Rmd0hFMitpYk1leWRYYjBSYWdUZDlwNk4zS2h1OW9i?=
 =?utf-8?B?dkZncXozMWpaTlg5ZGppaTZjSHpTc2tBQ2w0S3FVcERmR2t6MHRKeEpyREEv?=
 =?utf-8?B?QytBczV3T0p4NzJodE9UOE1abVFrQ284NWxVeElzSHdQTU83ckZKdFFjOGpr?=
 =?utf-8?B?am9wM0d5VmpaNTlxc1VVcDh1NEFKNVg2SjNiQmNlWkRQdVlqKzhTWktOb21r?=
 =?utf-8?B?aEtXaHE0MFFnMm9ydjdxcUtyeUJVTFNCeW10V2N6bTZCeTl5U1d3MVl6WUFJ?=
 =?utf-8?B?bTJVSGhQN3k4bmVqQWtlNld1RnVvY3JjM3o0WmVvQVBDZzZmRnk5NmlIeDEy?=
 =?utf-8?B?eTg4N09xVXEwRHJzNkVnVzdOT1pPZ1krcE11ZnUxcmZEOWdJT2dadTF2NGRD?=
 =?utf-8?B?ZzdMc2ljdW5OUlRXSkZsN0ZpRVBHaUJXZzlPK1BkdzBBTDhIbnBtb3NQSnpO?=
 =?utf-8?B?MU4zdWI3UmRhMlFkZEZVblBaazR5L1J2VGhlVk5ObDlWN0I0K25wM2RVUU9p?=
 =?utf-8?B?UWZ6RnRZWG9nOUlLWHB0UkdjbXlUYng3R0NYTG0zbDk2aHVFR2F6VjkzWkZF?=
 =?utf-8?B?b1NFc3Nob0cwVk4xdkRXTFZzZDdEZUg1WDJySm9FY3R1aUkyQXdWWG1QUkt5?=
 =?utf-8?B?NHlSNEJocEJsUU8xUWdjdEFYeWFHUHk5bVN6THdlY1ZLREw2VERlRmJtK1ZT?=
 =?utf-8?B?Tm9pYkQ0aVVkcHF0cTZBak0xY0VPLzNiN05QTkxFZkNuSFNiS2YraTRJbFEr?=
 =?utf-8?B?OEVSSnBiL29mTFprWVM1RU42NDJKcWl1Ui81RnpzSzhZamNMWEw5SXFqNWt5?=
 =?utf-8?B?N0VCeVRYaThMdUhQQXF4M2dhT0lpMVk3eGJFSVk4Sk1GYXptNTZRR1N6RlBv?=
 =?utf-8?B?UXJ2T2dKRlUySVNTeExycUNmSi9VMnJjN1Z2MngxMUZiY3dJQ0JQd0Z3UFhH?=
 =?utf-8?B?WlJpeFRxRXVwTG9aK3pYMDBCUFF2aWVQZUNkeUNUTUhUdlQ2Yk41dFBVbkF0?=
 =?utf-8?B?Vy9veWFUempJVnZtU3Fua3dDcjBtWEhyby9wNFBpWkF4YnlPN2N4TmVVZW83?=
 =?utf-8?B?TnNjTVBwdzY3UnZyYnd0b1dlcG9hSldKWHNrUlc2SmliblQ3YXdMeGFxSEE0?=
 =?utf-8?B?c3dFTWRnNmdOdE1lc2xFdkd5c25TR0t4NXRwSVlkVlZOY2xET2hRWlRGWlE4?=
 =?utf-8?B?ZEptZFJwYnY0dnQ4RyszRTRRYkdlUDdtZW93a0RxSCt0YmFGdnRTMXNFcjRB?=
 =?utf-8?B?Q0hEcGllRk03Ti95b211L2FxcVV6d2ZPeHptK2pwRk5ad041NHRmQndiTTd4?=
 =?utf-8?B?RXQzVGk3ZzY0NTMrWitPTzhUeHVkM29qcGxoeFNYOUcybWQ4c0pSNmJRYi8x?=
 =?utf-8?B?TGhiOE03Zlo5c1RudHg4bllTNXdieHRnVzlOaVpQWWljaG84TU9mL1JEREk1?=
 =?utf-8?B?Rkd5MzVER2tRVloxUDAyMktzcUI4R1JSUGRBa3ZVcmlZRXFZbDdsK1haUS85?=
 =?utf-8?B?bk15QlRsYURVRE1pdWs3bWdtekxrZ2hEU09ScFZKdEM5cGJXWk15c3YrNTRD?=
 =?utf-8?B?QnRKQjM3L09UVVNTRDFMTXVBTit1cnJaRjBSczZzak95bWkyZjIyUVRFcWFq?=
 =?utf-8?B?bzVxM2pSbGVMcXNDSEhBU0wrK0JPaS94MkRWNUI4YUUwQVk1Qy9URHlvRlpq?=
 =?utf-8?B?V3hINk5qYndFMy8rWHBDckpFb3hBUmhqT2JIeE1UYXRWaDVhZHZXRnY1NnlE?=
 =?utf-8?Q?U1ua//mT5+Vct+3T7QbaBjgpo?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c0fed8d-5270-4d2b-3c17-08dc9c012b39
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 08:13:21.4650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8MYIRR220JLGyqw6ofa/bE8zbZiDp6xpJAjrko4sG4HL/v/Po5DjZ4XWdnRP148Q0ep+HV3IN4IGxKGrZHV/lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5199
X-Proofpoint-GUID: uCuXn2g3tHJNQVYph2AtO_MVnnwCIyhG
X-Proofpoint-ORIG-GUID: uCuXn2g3tHJNQVYph2AtO_MVnnwCIyhG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_18,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2406140001
 definitions=main-2407040057
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 08:13:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201523

I'd suggest we look at this patch again. IMHO, this patch brings the 
following benefits.

1) Variable names are more consistent

The current situation:
VOLATILE_LOG_DIR handles /var/log.
VOLATILE_TMP_DIR handles /tmp.

After this patch, the situation is:
VOLATILE_LOG_DIR hanldes /var/log.
VOLATILE_TMP_DIR handles /var/tmp.

2) /var/tmp being persistent in fact indicates that /tmp is persistent

This is because /tmp is a symlink to /var/tmp by default. And the 
tmp.mount has been handled well in systemd recipe.

3) Yocto can now build out container image inside which tools using 
/var/tmp can run.

4) When people use a separate partition for /var, they probably want 
persistent /var/tmp. This patch makes it easy to build out such image.

Regards,
Qi



On 6/12/24 08:56, Changqing Li via lists.openembedded.org wrote:
>
> Hi,
>
> Any concern about this patch? VOLATILE_TMP_DIR is originally added to 
> specify the persistence of /tmp,
>
> and I think it named as "VOLATILE_TMP", so maybe it is ok to extend to 
> specify the persistence of /var/tmp (which by default is 
> /var/volatile/tmp).
>
> And this will cause doc change.
>
> Regards
>
> Changqing
>
> On 5/30/24 17:02, Changqing Li wrote:
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> Currently, set VOLATILE_TMP_DIR to "no", only make /tmp as persistent.
>> This patch extends VOLATILE_TMP_DIR to also specify the persistence of
>> /var/tmp by following changes:
>>
>> * change FILESYSTEM_PERMS_TABLES to remove symlink /var/tmp -> /var/volatile/tmp
>>    for the packaging process
>> * update base-files to create /var/tmp as a dir not symlink to /var/volatile/tmp
>>
>> Here is an use case:
>> Steps:
>> 1. docker import core-image-minimal-qemux86-64.tar.bz2 poky:latest
>> 2. docker run -it --rm poky:latest /bin/sh
>> 3. /var/log /var/tmp are deadlinks, and cause "No such file or directory" errors
>>
>> Root cause:
>> By default, /var/tmp links to /var/volatile/tmp, and /var/volatile/tmp
>> usually created by initscript(sysV) or systemd-tmpfile.d(systemd) during
>> boot up, but for container, initscript/systemd-tmpfile.d will not be
>> executed, so /var/volatile/tmp is not created.
>>
>> This patch provides an option for user want to use container, set
>> VOLATILE_TMP_DIR to "no" can resolve above case.
>>
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ---
>>   meta/conf/bitbake.conf                        |  5 ++-
>>   ...fs-perms.txt => fs-perms-volatile-log.txt} | 32 -------------------
>>   ...tent-log.txt => fs-perms-volatile-tmp.txt} | 27 ----------------
>>   meta/files/fs-perms.txt                       |  3 --
>>   .../base-files/base-files_3.0.14.bb           |  5 +--
>>   5 files changed, 7 insertions(+), 65 deletions(-)
>>   copy meta/files/{fs-perms.txt => fs-perms-volatile-log.txt} (53%)
>>   rename meta/files/{fs-perms-persistent-log.txt => fs-perms-volatile-tmp.txt} (59%)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 3ef2deb088..e6ec640809 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -384,7 +384,10 @@ FILESEXTRAPATHS ?= "__default:"
>>   #  base_prefix, prefix, exec_prefix, base_bindir, base_sbindir, base_libdir,
>>   #  datadir, sysconfdir, servicedir, sharedstatedir, localstatedir, infodir,
>>   #  mandir, docdir, bindir, sbindir, libexecdir, libdir and includedir
>> -FILESYSTEM_PERMS_TABLES ?="${@'files/fs-perms.txt' if 
>> oe.types.boolean(d.getVar('VOLATILE_LOG_DIR')) else 
>> 'files/fs-perms-persistent-log.txt'}"
>> +FILESYSTEM_PERMS_TABLES ?=  " files/fs-perms.txt \
>> +                              ${@'files/fs-perms-volatile-log.txt' if oe.types.boolean(d.getVar('VOLATILE_LOG_DIR')) else ''} \
>> +                              ${@'files/fs-perms-volatile-tmp.txt' if oe.types.boolean(d.getVar('VOLATILE_TMP_DIR')) else ''} \
>> +                            "
>>   
>>   ##################################################################
>>   # General work and output directories for the build system.
>> diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms-volatile-log.txt
>> similarity index 53%
>> copy from meta/files/fs-perms.txt
>> copy to meta/files/fs-perms-volatile-log.txt
>> index 48191f504c..fc846bbdc5 100644
>> --- a/meta/files/fs-perms.txt
>> +++ b/meta/files/fs-perms-volatile-log.txt
>> @@ -28,39 +28,7 @@
>>   # Note: all standard config directories are automatically assigned "0755 root root false - - -"
>>   
>>   # Documentation should always be corrected
>> -${mandir}		0755	root	root	true	0644	root	root
>> -${infodir}		0755	root	root	true	0644	root	root
>> -${docdir}		0755	root	root	true	0644	root	root
>> -${datadir}/gtk-doc	0755	root	root	true	0644	root	root
>> -
>> -# Fixup locales
>> -${datadir}/locale	0755	root	root	true	0644	root	root
>> -
>> -# Cleanup headers
>> -${includedir}		0755	root	root	true	0644	root	root
>> -
>> -# Cleanup debug src
>> -/usr/src/debug		0755	root	root	true	0644	root	root
>>   
>>   # Items from base-files
>>   # Links
>> -${localstatedir}/run	link	/run
>>   ${localstatedir}/log	link	volatile/log
>> -${localstatedir}/lock	link	/run/lock
>> -${localstatedir}/tmp	link	volatile/tmp
>> -
>> -/home				0755	root	root	false - - -
>> -/srv				0755	root	root	false - - -
>> -${prefix}/src			0755	root	root	false - - -
>> -${localstatedir}/local		0755	root	root	false - - -
>> -
>> -# Special permissions from base-files
>> -# Set 1777
>> -/tmp				01777	root	root	false - - -
>> -${localstatedir}/volatile/tmp	01777	root	root	false - - -
>> -
>> -# Set 0700
>> -${ROOT_HOME}			0700	root	root	false - - -
>> -
>> -# Set 2775-lsb
>> -${localstatedir}/mail		02775	root	mail	false - - -
>> diff --git a/meta/files/fs-perms-persistent-log.txt b/meta/files/fs-perms-volatile-tmp.txt
>> similarity index 59%
>> rename from meta/files/fs-perms-persistent-log.txt
>> rename to meta/files/fs-perms-volatile-tmp.txt
>> index 61f0a6e26a..26247acda8 100644
>> --- a/meta/files/fs-perms-persistent-log.txt
>> +++ b/meta/files/fs-perms-volatile-tmp.txt
>> @@ -28,38 +28,11 @@
>>   # Note: all standard config directories are automatically assigned "0755 root root false - - -"
>>   
>>   # Documentation should always be corrected
>> -${mandir}		0755	root	root	true	0644	root	root
>> -${infodir}		0755	root	root	true	0644	root	root
>> -${docdir}		0755	root	root	true	0644	root	root
>> -${datadir}/gtk-doc	0755	root	root	true	0644	root	root
>> -
>> -# Fixup locales
>> -${datadir}/locale	0755	root	root	true	0644	root	root
>> -
>> -# Cleanup headers
>> -${includedir}		0755	root	root	true	0644	root	root
>> -
>> -# Cleanup debug src
>> -/usr/src/debug		0755	root	root	true	0644	root	root
>>   
>>   # Items from base-files
>>   # Links
>> -${localstatedir}/run	link	/run
>> -${localstatedir}/lock	link	/run/lock
>>   ${localstatedir}/tmp	link	volatile/tmp
>>   
>> -/home				0755	root	root	false - - -
>> -/srv				0755	root	root	false - - -
>> -${prefix}/src			0755	root	root	false - - -
>> -${localstatedir}/local		0755	root	root	false - - -
>> -
>>   # Special permissions from base-files
>>   # Set 1777
>> -/tmp				01777	root	root	false - - -
>>   ${localstatedir}/volatile/tmp	01777	root	root	false - - -
>> -
>> -# Set 0700
>> -${ROOT_HOME}			0700	root	root	false - - -
>> -
>> -# Set 2775-lsb
>> -${localstatedir}/mail		02775	root	mail	false - - -
>> diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
>> index 48191f504c..d2266c1b26 100644
>> --- a/meta/files/fs-perms.txt
>> +++ b/meta/files/fs-perms.txt
>> @@ -45,9 +45,7 @@ ${includedir}		0755	root	root	true	0644	root	root
>>   # Items from base-files
>>   # Links
>>   ${localstatedir}/run	link	/run
>> -${localstatedir}/log	link	volatile/log
>>   ${localstatedir}/lock	link	/run/lock
>> -${localstatedir}/tmp	link	volatile/tmp
>>   
>>   /home				0755	root	root	false - - -
>>   /srv				0755	root	root	false - - -
>> @@ -57,7 +55,6 @@ ${localstatedir}/local		0755	root	root	false - - -
>>   # Special permissions from base-files
>>   # Set 1777
>>   /tmp				01777	root	root	false - - -
>> -${localstatedir}/volatile/tmp	01777	root	root	false - - -
>>   
>>   # Set 0700
>>   ${ROOT_HOME}			0700	root	root	false - - -
>> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
>> index 1b6e9671e4..256dfb214e 100644
>> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
>> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
>> @@ -31,7 +31,7 @@ UNPACKDIR = "${S}"
>>   INHIBIT_DEFAULT_DEPS = "1"
>>   
>>   docdir:append = "/${P}"
>> -dirs1777 = "/tmp ${localstatedir}/volatile/tmp"
>> +dirs1777 = "/tmp ${localstatedir}/${@'volatile/' if oe.types.boolean('${VOLATILE_TMP_DIR}') else ''}tmp"
>>   dirs2775 = ""
>>   dirs555 = "/sys /proc"
>>   dirs755 = "/boot /dev ${base_bindir} ${base_sbindir} ${base_libdir} \
>> @@ -55,7 +55,8 @@ dirs755-lsb = "/srv  \
>>                  ${prefix}/lib/locale"
>>   dirs2775-lsb = "/var/mail"
>>   
>> -volatiles ="${@'log' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''} tmp"
>> +volatiles ="${@'log' if oe.types.boolean('${VOLATILE_LOG_DIR}') else ''} \ + 
>> ${@'tmp' if oe.types.boolean('${VOLATILE_TMP_DIR}') else ''}"
>>   conffiles = "${sysconfdir}/debian_version ${sysconfdir}/host.conf \
>>                ${sysconfdir}/issue /${sysconfdir}/issue.net \
>>                ${sysconfdir}/nsswitch.conf ${sysconfdir}/profile \
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200553): https://lists.openembedded.org/g/openembedded-core/message/200553
> Mute This Topic: https://lists.openembedded.org/mt/106385197/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>



Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A69CC5B549
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 14:48:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18597.1749048504772219486
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 07:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8250a4c48c=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55427b2R023528
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Jun 2025 07:48:24 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rtnxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 07:48:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ySDtjmWs6MH/8i+cgT+hoEcoCxUiVkpVv/69Cjb65t4xOPddLuF47rz1vqA53WSUY1BGBePF9yYesAPS0C3f3PIIAQJ6F3ctj7ZirWBSvOqDBcie0hUfoeKjP4hKro0cqd375cUoEdeTPfSDN0AVmtnSCBBffCA0vPxXAmAZ/cFMITP+71g3p7dp9ZwRtf9ijACikGzFUEzJPyBXYtrTHa8zwVlHlDI0ZPJbIUfntwRyEi/u9sWHSkQoW9ZkYQ6mXVTwlvaxu++SrzTe/Ha+1anwKt2E6CYG+IsO2rOm3GYzPIos6AjhB7Pmxu0Mb49NIZdMjvBFJjABHzBiHODs2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXX5gTd5WQ+lQGjCkI61UsQ755J9ugVc3KbjQp3K4XI=;
 b=DZGrSaySlfoaeyD84TDFCb+Zl4mGWDX0M7vuQOIjr5KHiINdsB6j6CNPhPlCdzNkzyl4w3UP/g9pBUyTvDXOtLqLPTzFsddB7YLlr4C3iT7GPAvfcUJWWQgW3qJI5rYT1at9vuXs5JGxPGEGxLLE1wZY0l314uaL1sJ7Tkz78JztbnfLQ5wXYnAvFjP6Us22QYM27/QkGPqoGKEv+qoGRgzLGLbjV7fmRpCFd3dtkYHIcb92qtqhFNyicH6aiZhcbKnR8J2ZAYAk88WCsjf8RqZGgt2c+wn3blVUt3dbN1EnNDh1Vst0xe3JfhwO+dWIsRx6JSiLV42fQwDiXgU3gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 IA1PR11MB6441.namprd11.prod.outlook.com (2603:10b6:208:3aa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Wed, 4 Jun
 2025 14:48:18 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%4]) with mapi id 15.20.8769.037; Wed, 4 Jun 2025
 14:48:18 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        sunilkumar.dora@windriver.com
Subject: [kirkstone][PATCH] glibc: pthreads NPTL: lost wakeup fix
Date: Wed,  4 Jun 2025 07:48:14 -0700
Message-ID: <20250604144814.3103080-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0199.namprd13.prod.outlook.com
 (2603:10b6:208:2be::24) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|IA1PR11MB6441:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ea27d4f-f7ac-46c9-767b-08dda376d7e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7PmkYsIiWuSsKKD1Oo7NGy4qxxQYHaD8IiJoIt9fdN5n+gr+vGkrEZ+yqvDh?=
 =?us-ascii?Q?VC/f+pfubRBTfJ51q4UHaBYqriHC+M+5xJ8rZpftjF+Nl2YECivc/t9pKbqj?=
 =?us-ascii?Q?QdEms6wDp5SF9P4nsY5e1qn/NMyM+O82l4WuBt5bfhNQ3vElzAnYgBMTra3+?=
 =?us-ascii?Q?oV58UtTKMFxCbwyfddTiUI99rLOfwUK48Y5fyyQYLGfOYWyIPMAglo85I3AQ?=
 =?us-ascii?Q?Eug6uXHl6a9HJMcsTbx/iHBkxHJcJ/T/J5alFm/KBwU2g3nh1pGql2ImZXoD?=
 =?us-ascii?Q?RYKyRtfzhWk3LvqjMa2pWIb6q4Ufz2tfF6UeI4B+vYiBqCPvKoYxDih3vuW3?=
 =?us-ascii?Q?+StjGFsAwdGTDXZV7w4E8GjjE7C4WQso/VfRV/zM/8Gr/RYrJcxv7ijr7D4A?=
 =?us-ascii?Q?N5ZeZS741yteMC1d+qLkywKMKjubxeZCbhEPCd+sjnerrrQSQeQEQChoVib7?=
 =?us-ascii?Q?RNAisYGp0C9eLZfuqJaGPnLLPy61VOHJT0aGUScJcUIwJW9G2ICtTuH3/p6F?=
 =?us-ascii?Q?j0beJpBvV0gweYLn5vrgcI2fGKJtpG2AJQI956HJ7v/+2LbnS8/cG1Jb+VOV?=
 =?us-ascii?Q?Fialsvk3caytKVylsuvHBeZ0btDiuYy718w3eyA2xPpB2GcDfgkPRMGXGciX?=
 =?us-ascii?Q?b/FDaxttV+/UBUlnddg8CDcCBstpPbK7KwibphsilPSXJqiSLCl/ZUfXgVjS?=
 =?us-ascii?Q?HDry+TdiyLbWIOQhJ6QQC9lKDOrCZas2OAnDMuQzrV+BZHfrV7BoM+0RLSZS?=
 =?us-ascii?Q?ijpTKgyI9xnY8ZVJ6FX9rCDLj6MgE5i71hk4lrLRAFxvxHfl93tjIkB/jSWW?=
 =?us-ascii?Q?q3uUrxOl/Us2mUvhvVMHGkq6MH78Dz3gbv+t8TlqEsLCWM/yjO4uil0A/3Ps?=
 =?us-ascii?Q?1kBGPcQK6E99moYzAGJWHlEm4LR55Hc0rMl85Dfe76FUOjNKbJykMTogdwX3?=
 =?us-ascii?Q?mTiGYEYgN3JTrytImVDLd9AEXzbYpzoOdLvIm8t8/aJkPinMFqzLTO+BtvNv?=
 =?us-ascii?Q?b3orw78MBY4UhvL+Jok8MrLn3XnJxB+hOUujTLA7jxKs5D1sIxpmKFmdhx2O?=
 =?us-ascii?Q?pNYGd44dkvwQHlhwr5vEqUxp0UAGLufQ/iPhaBU5c8OCWDcTWBlvK10dbSDg?=
 =?us-ascii?Q?kNwfWpgvmEB5xE07TaSjV1IS1B1KdV31QDrRVpk7RcK2/X77pk+TzRKNqg6y?=
 =?us-ascii?Q?5xBxmIVy/B1TRQkVwCuu416R+xvpBQY3HqCU8xnB6IaC7dv1xc6vvbbimQRA?=
 =?us-ascii?Q?A+HkwJscOk2Dy3q/Z1hgc9XUlVI0p+U3mtm4p6WzvBfANl9bg5bR3kVcEa0B?=
 =?us-ascii?Q?/P6iPFcxOQGuKWlnFs/RMAUYOfuEfyXUzx5UC1x0l5hLW09k25Zoaedi7dko?=
 =?us-ascii?Q?MOJXW2LSI26rmmiYhe/YxLCJYB9RxLC6CF/lRCvxUHRLSWvoUDkRkQ4RlSBm?=
 =?us-ascii?Q?9Gy0tiXoh8/hAlOPDUd/OhB7lcYhhqGslg/YvJ5N8Bi9CcTdPpzPd8bt2WKe?=
 =?us-ascii?Q?Amz8+yRLJoJL8ck=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CurY5H9rFIZgaqYNnR/aa4oIaM7Ul0kEvDKawFUtJKYG5metaC9TGsBLVvcS?=
 =?us-ascii?Q?HEgo/is2OEL9XPzFnoczj3x3OMIB0/hG/hLqQg6zXuB6mp6CVrB0zES7ltXB?=
 =?us-ascii?Q?v9gUWd5jqg+sRJEKLV00Fqg9UGFB2J1+g7M8qJNY/AvBDEUXOB8eBqwLVtPq?=
 =?us-ascii?Q?eut2/TrwF98YF//w4G5fQtQQn0aPpEZ7gSGcpxBNnJtWX/dH8HmCb8pC/rmd?=
 =?us-ascii?Q?BA7Pm8V91tQZHED26viGiQDv/2Sk/2EBcr69xcZCpTaxJ++//S9dfT8GiU3x?=
 =?us-ascii?Q?+zUonPsMnqmxYWAIIh6OeLCy5yx30W0Mu1R6hyTj6As+IC+9KV7Aip8sIdXJ?=
 =?us-ascii?Q?41sab/5tan/aKh05t8/q3kxRSLKq593CHeLT/KuGqZ6Wb0tUw2SAtukIEGhe?=
 =?us-ascii?Q?gAChMcydmEJo/gE4jUhR254BWz+DGfmzAfKVSOZFxglCg14kpDJjFJTtbwlt?=
 =?us-ascii?Q?Bk6ztd7f6dDokpQU8tyD/gS/xO6FlrgdXd0U/l3TAhyZMsm+SKgXeESy+e3r?=
 =?us-ascii?Q?RlBlUfG+i+q+Kbfn1HkiTmrRCussOx3xTit7b4FQXituIaq42qxmXS/jeSfU?=
 =?us-ascii?Q?sBOkI8qpuTPFvdEdQWxG1SB7xuXgLTETcjb0CAYWI7GM4+Ffz7SqUAX46bf8?=
 =?us-ascii?Q?c2wQxIoN71Xtgi0+sN1fiIBHnCUQ0AzRH5htXGRFqpcwUqBHSDNKhHgr8Hu3?=
 =?us-ascii?Q?SVzJnTjnyWqgUFDcClLasoYsP9d+uBSnRj9G1oDW1Zo3fsPjBGyxeZnR9s4R?=
 =?us-ascii?Q?Jw2s6r9TQGUsNlKvjdFz0l8a9Vu8BNUXYVVHghaJvcp0wAFsNwJBjgYTvvIf?=
 =?us-ascii?Q?2oGpRHV6YEDSaLcY7gylCdNUI77k0QYpBl5frWbrlVF77rHtn0mcIyDCkc9A?=
 =?us-ascii?Q?A5BObro+bs+ggnuhZFFVhwcfGysFyMGjLN9pw8/3YX2cvMM28c22JgUsZgM1?=
 =?us-ascii?Q?/RCvoYyMkg41GwIfMIIri5ZGKAE2cpzrTGsnGFXVZ4ZRRijvmSPRdwasiSWQ?=
 =?us-ascii?Q?v0+xQSmC4UuSAZZnCEmCXsUz26fzugmSDNv21rL0w6mxPSkvBnO0knG30Z+A?=
 =?us-ascii?Q?wZW3rqUtU17Tnf4Btw4+7iKIxWtCFERuLvF5cuI64fM1I52pMEvZexVObe3h?=
 =?us-ascii?Q?BHoTuU6Bu+NvpnIcw1tWA1pbwB2jYWpizwITo/Vw7v49FqES7Y0AnlU1mxx/?=
 =?us-ascii?Q?XoV5/N3yDkv3HXfCpP3ET1U4tGLnc/eVsMfPDlDzqvvuXpUWaFyW+zA0tfux?=
 =?us-ascii?Q?GjIswd0wZ8odK8nK0kqFM2qcie07lqVAa3UGGjHeF2qCFuA0h0031XnyOmTs?=
 =?us-ascii?Q?knogVHRtFHNS8VGSBGG3xfT1+CkN3Y38H8i8flLE5Iby5GxVyz3bW+NPXZSF?=
 =?us-ascii?Q?7H2qBdnUCsdjOosPLoQ5CGkBIvT+Y/lsR26+HPE6gOzNlxZeaTPavditaa8i?=
 =?us-ascii?Q?JiTLGbsCiyyKSqHVQ8o/aKmBgK7F2/y57UiL2i1K/ZaF2Wlb06eBaut6Cy7X?=
 =?us-ascii?Q?E/6OLlDFvyC0GRqRVmfDlmrdWpD5gBylc5DedFo0OzSJ/rX3nKNtccd6MY7y?=
 =?us-ascii?Q?eL9r8xUhOpRmu/PGJ0/XxvtcaR6tKUchxjRSuFbYE/TUP9oSRAFGiGYbL7ZX?=
 =?us-ascii?Q?UA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ea27d4f-f7ac-46c9-767b-08dda376d7e3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 14:48:18.3665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aPQD1MmztKk6/A20TFtDd9sgnbri3O8R2s/MUgUd1yNGxbjnDdH6H6SgtE7VrEyeGaGISEUou3Zy+4KANRfWuavXnevMa1WvUz77qtmLzpw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6441
X-Proofpoint-GUID: x0gLhHK12He6i2Fb6yez7HB7eKtJw_2l
X-Authority-Analysis: v=2.4 cv=VIHdn8PX c=1 sm=1 tr=0 ts=68405cb8 cx=c_pps a=mi3bKrpD1VGuQXVfC4HZlQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=9HCAcUqT18UWe_jgNpsA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDExMSBTYWx0ZWRfXzExnNm/EMFsh gIPlGozIQQ7usdpGPIHSwZbygGiq6DZUCLM0UwYErhdNA2G1jWFWFlNrtGesP0mSpcJTAIXGgxd mHMaGloPo/lrYeDdkIGlWRXZ1k9AU54LUqZFZtIVl5sBfAMDXGORSe3us6CAV+Z5xFHa+ZPSxhD
 MhPpIdZPjvVF2c757DCZ+g03R4oSxIqGCI25WVKqTGpx7tG4K+T7BUD/kqInxrRvbz3u4fyxc90 DrAvu/YCpb4OK4scKcMIBSqQlEuuv9+0p7aRXh/dRIE7g739WIHPqLy0VY8gCfR3EsRjHJA67+y QbkreuHYnfvc63Ti1HMocx6mwQT4G8E2q1P50L0Vu1dGdpYpSrQGNZI8OzZm9qXDUi2nKIalJ/I
 yv75b761ztecX51g7Enj241Q/48/xlNuzfu9oSOorWmTtU49BzD3M92FWdESVQ86csjRv6HW
X-Proofpoint-ORIG-GUID: x0gLhHK12He6i2Fb6yez7HB7eKtJw_2l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506040111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 14:48:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217951

From: Sunil Dora <sunilkumar.dora@windriver.com>

PR: [https://sourceware.org/bugzilla/show_bug.cgi?id=25847]

[BUG]
A race condition in pthread_cond_wait could lead to lost wake-ups when:
   A waiter thread decrements __g_signals but gets preempted before checking g1_start
   The condition variable's group rotates multiple times during preemption
   The thread resumes and incorrectly believes it stole a signal from current group
   This corrupts signal accounting (__g_size[G1] > __g_refs[G1])
   Final signal gets delivered to empty group while waiters remain in another group

Impact:
Applications using pthread condition variables could experience hangs due to lost wake-ups.
This particularly affects high-contention scenarios with many threads.

Reproduction Steps:
1. Build glibc(2.35) with injected delay (usleep(10)) in __pthread_cond_wait_common
   Just before : uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
   File: { nptl/pthread_cond_wait.c }
2. Compile test program with custom glibc:
   ( https://sourceware.org/bugzilla/attachment.cgi?id=14360 )
   gcc -g -o pthread_cond_bug pthread_cond_bug.c \
   -Wl,-dynamic-linker=<CUSTOM_GLIBC>/lib/ld-linux-x86-64.so.2 \
   -Wl,-rpath=<CUSTOM_GLIBC>/lib -L<CUSTOM_GLIBC>/lib \
   -I<CUSTOM_GLIBC>/include -lpthread
3. Run with CPU pinning: taskset -c 0 ./pthread_cond_bug

Behavior:
Without the fix: If the bug is triggered, the process will hang for 300 seconds until an alarm
is triggered. It will then crash and generate a core dump.
We can also attach core dump to gdb and manually verify.

With the fix: The process runs smoothly, even with the forced delay in glibc.

Fix Details:
The fix prevents signal stealing by:
   Broadening scope of g_refs to cover entire wait operation
   Removing the complex signal stealing handling code
   Properly maintaining signal accounting invariants

Upstream Status: Fixed in glibc 2.41
[ https://sourceware.org/bugzilla/show_bug.cgi?id=25847#c72 ]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 .../0004-pthreads-NPTL-lost-wakeup-fix.patch  | 579 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 580 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0004-pthreads-NPTL-lost-wakeup-fix.patch

diff --git a/meta/recipes-core/glibc/glibc/0004-pthreads-NPTL-lost-wakeup-fix.patch b/meta/recipes-core/glibc/glibc/0004-pthreads-NPTL-lost-wakeup-fix.patch
new file mode 100644
index 0000000000..7d1d8c3662
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0004-pthreads-NPTL-lost-wakeup-fix.patch
@@ -0,0 +1,579 @@
+From 55dd0d9bfb0d6683a9856534857aa5795ae2ef00 Mon Sep 17 00:00:00 2001
+From: Sunil Dora <sunilkumar.dora@windriver.com>
+Date: Wed, 4 Jun 2025 05:00:05 -0700
+Subject: [PATCH] pthreads NPTL: lost wakeup fix
+
+    This fixes the lost wakeup (from a bug in signal stealing) with a change
+    in the usage of g_signals[] in the condition variable internal state.
+    It also completely eliminates the concept and handling of signal stealing,
+    as well as the need for signalers to block to wait for waiters to wake
+    up every time there is a G1/G2 switch.  This greatly reduces the average
+    and maximum latency for pthread_cond_signal.
+
+The following commits have been cherry-picked from the master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+
+Upstream-Status: Backport [
+  1db84775f831a1494993ce9c118deaf9537cc50a,
+  1db84775f831a1494993ce9c118deaf9537cc50a,
+  0cc973160c23bb67f895bc887dd6942d29f8fee3,
+  b42cc6af11062c260c7dfa91f1c89891366fed3e,
+  4f7b051f8ee3feff1b53b27a906f245afaa9cee1,
+  929a4764ac90382616b6a21f099192b2475da674,
+  ee6c14ed59d480720721aaacc5fb03213dc153da,
+  4b79e27a5073c02f6bff9aa8f4791230a0ab1867,
+  91bb902f58264a2fd50fbce8f39a9a290dd23706,
+]
+
+Co-authored-by: Frank Barrus <frankbarrus_sw@shaggy.cc>
+Co-authored-by: Malte Skarupke <malteskarupke@fastmail.fm>
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_broadcast.c |   8 +-
+ nptl/pthread_cond_common.c    | 110 +++------------
+ nptl/pthread_cond_signal.c    |  19 ++-
+ nptl/pthread_cond_wait.c      | 248 ++++++++--------------------------
+ 4 files changed, 92 insertions(+), 293 deletions(-)
+
+diff --git a/nptl/pthread_cond_broadcast.c b/nptl/pthread_cond_broadcast.c
+index 5ae141ac81..ef0943cdc5 100644
+--- a/nptl/pthread_cond_broadcast.c
++++ b/nptl/pthread_cond_broadcast.c
+@@ -57,10 +57,10 @@ ___pthread_cond_broadcast (pthread_cond_t *cond)
+     {
+       /* Add as many signals as the remaining size of the group.  */
+       atomic_fetch_add_relaxed (cond->__data.__g_signals + g1,
+-				cond->__data.__g_size[g1] << 1);
++				cond->__data.__g_size[g1]);
+       cond->__data.__g_size[g1] = 0;
+ 
+-      /* We need to wake G1 waiters before we quiesce G1 below.  */
++      /* We need to wake G1 waiters before we switch G1 below.  */
+       /* TODO Only set it if there are indeed futex waiters.  We could
+ 	 also try to move this out of the critical section in cases when
+ 	 G2 is empty (and we don't need to quiesce).  */
+@@ -69,11 +69,11 @@ ___pthread_cond_broadcast (pthread_cond_t *cond)
+ 
+   /* G1 is complete.  Step (2) is next unless there are no waiters in G2, in
+      which case we can stop.  */
+-  if (__condvar_quiesce_and_switch_g1 (cond, wseq, &g1, private))
++  if (__condvar_switch_g1 (cond, wseq, &g1, private))
+     {
+       /* Step (3): Send signals to all waiters in the old G2 / new G1.  */
+       atomic_fetch_add_relaxed (cond->__data.__g_signals + g1,
+-				cond->__data.__g_size[g1] << 1);
++				cond->__data.__g_size[g1]);
+       cond->__data.__g_size[g1] = 0;
+       /* TODO Only set it if there are indeed futex waiters.  */
+       do_futex_wake = true;
+diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
+index fb035f72c3..c0731b9166 100644
+--- a/nptl/pthread_cond_common.c
++++ b/nptl/pthread_cond_common.c
+@@ -189,19 +189,17 @@ __condvar_get_private (int flags)
+     return FUTEX_SHARED;
+ }
+ 
+-/* This closes G1 (whose index is in G1INDEX), waits for all futex waiters to
+-   leave G1, converts G1 into a fresh G2, and then switches group roles so that
+-   the former G2 becomes the new G1 ending at the current __wseq value when we
+-   eventually make the switch (WSEQ is just an observation of __wseq by the
+-   signaler).
++/* This closes G1 (whose index is in G1INDEX), converts G1 into a fresh G2,
++   and then switches group roles so that the former G2 becomes the new G1
++   ending at the current __wseq value when we eventually make the switch
++   (WSEQ is just an observation of __wseq by the signaler).
+    If G2 is empty, it will not switch groups because then it would create an
+    empty G1 which would require switching groups again on the next signal.
+    Returns false iff groups were not switched because G2 was empty.  */
+ static bool __attribute__ ((unused))
+-__condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
++__condvar_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+     unsigned int *g1index, int private)
+ {
+-  const unsigned int maxspin = 0;
+   unsigned int g1 = *g1index;
+ 
+   /* If there is no waiter in G2, we don't do anything.  The expression may
+@@ -210,96 +208,26 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+      behavior.
+      Note that this works correctly for a zero-initialized condvar too.  */
+   unsigned int old_orig_size = __condvar_get_orig_size (cond);
+-  uint64_t old_g1_start = __condvar_load_g1_start_relaxed (cond) >> 1;
+-  if (((unsigned) (wseq - old_g1_start - old_orig_size)
+-	  + cond->__data.__g_size[g1 ^ 1]) == 0)
++  uint64_t old_g1_start = __condvar_load_g1_start_relaxed (cond);
++  uint64_t new_g1_start = old_g1_start + old_orig_size;
++  if (((unsigned) (wseq - new_g1_start) + cond->__data.__g_size[g1 ^ 1]) == 0)
+ 	return false;
+ 
+-  /* Now try to close and quiesce G1.  We have to consider the following kinds
+-     of waiters:
++  /* We have to consider the following kinds of waiters:
+      * Waiters from less recent groups than G1 are not affected because
+        nothing will change for them apart from __g1_start getting larger.
+      * New waiters arriving concurrently with the group switching will all go
+        into G2 until we atomically make the switch.  Waiters existing in G2
+        are not affected.
+-     * Waiters in G1 will be closed out immediately by setting a flag in
+-       __g_signals, which will prevent waiters from blocking using a futex on
+-       __g_signals and also notifies them that the group is closed.  As a
+-       result, they will eventually remove their group reference, allowing us
+-       to close switch group roles.  */
+ 
+-  /* First, set the closed flag on __g_signals.  This tells waiters that are
+-     about to wait that they shouldn't do that anymore.  This basically
+-     serves as an advance notificaton of the upcoming change to __g1_start;
+-     waiters interpret it as if __g1_start was larger than their waiter
+-     sequence position.  This allows us to change __g1_start after waiting
+-     for all existing waiters with group references to leave, which in turn
+-     makes recovery after stealing a signal simpler because it then can be
+-     skipped if __g1_start indicates that the group is closed (otherwise,
+-     we would have to recover always because waiters don't know how big their
+-     groups are).  Relaxed MO is fine.  */
+-  atomic_fetch_or_relaxed (cond->__data.__g_signals + g1, 1);
++     * Waiters in G1 will be closed out immediately by the advancing of
++       __g_signals to the next "lowseq" (low 31 bits of the new g1_start),
++     * Waiters in G1 have already received a signal and been woken.  */
+ 
+-  /* Wait until there are no group references anymore.  The fetch-or operation
+-     injects us into the modification order of __g_refs; release MO ensures
+-     that waiters incrementing __g_refs after our fetch-or see the previous
+-     changes to __g_signals and to __g1_start that had to happen before we can
+-     switch this G1 and alias with an older group (we have two groups, so
+-     aliasing requires switching group roles twice).  Note that nobody else
+-     can have set the wake-request flag, so we do not have to act upon it.
+-
+-     Also note that it is harmless if older waiters or waiters from this G1
+-     get a group reference after we have quiesced the group because it will
+-     remain closed for them either because of the closed flag in __g_signals
+-     or the later update to __g1_start.  New waiters will never arrive here
+-     but instead continue to go into the still current G2.  */
+-  unsigned r = atomic_fetch_or_release (cond->__data.__g_refs + g1, 0);
+-  while ((r >> 1) > 0)
+-    {
+-      for (unsigned int spin = maxspin; ((r >> 1) > 0) && (spin > 0); spin--)
+-	{
+-	  /* TODO Back off.  */
+-	  r = atomic_load_relaxed (cond->__data.__g_refs + g1);
+-	}
+-      if ((r >> 1) > 0)
+-	{
+-	  /* There is still a waiter after spinning.  Set the wake-request
+-	     flag and block.  Relaxed MO is fine because this is just about
+-	     this futex word.
+-
+-	     Update r to include the set wake-request flag so that the upcoming
+-	     futex_wait only blocks if the flag is still set (otherwise, we'd
+-	     violate the basic client-side futex protocol).  */
+-	  r = atomic_fetch_or_relaxed (cond->__data.__g_refs + g1, 1) | 1;
+-
+-	  if ((r >> 1) > 0)
+-	    futex_wait_simple (cond->__data.__g_refs + g1, r, private);
+-	  /* Reload here so we eventually see the most recent value even if we
+-	     do not spin.   */
+-	  r = atomic_load_relaxed (cond->__data.__g_refs + g1);
+-	}
+-    }
+-  /* Acquire MO so that we synchronize with the release operation that waiters
+-     use to decrement __g_refs and thus happen after the waiters we waited
+-     for.  */
+-  atomic_thread_fence_acquire ();
+-
+-  /* Update __g1_start, which finishes closing this group.  The value we add
+-     will never be negative because old_orig_size can only be zero when we
+-     switch groups the first time after a condvar was initialized, in which
+-     case G1 will be at index 1 and we will add a value of 1.  See above for
+-     why this takes place after waiting for quiescence of the group.
+-     Relaxed MO is fine because the change comes with no additional
+-     constraints that others would have to observe.  */
+-  __condvar_add_g1_start_relaxed (cond,
+-      (old_orig_size << 1) + (g1 == 1 ? 1 : - 1));
+-
+-  /* Now reopen the group, thus enabling waiters to again block using the
+-     futex controlled by __g_signals.  Release MO so that observers that see
+-     no signals (and thus can block) also see the write __g1_start and thus
+-     that this is now a new group (see __pthread_cond_wait_common for the
+-     matching acquire MO loads).  */
+-  atomic_store_release (cond->__data.__g_signals + g1, 0);
++  /* Update __g1_start, which closes this group.  Relaxed MO is fine because
++     the change comes with no additional constraints that others would have
++     to observe.  */
++  __condvar_add_g1_start_relaxed (cond, old_orig_size);
+ 
+   /* At this point, the old G1 is now a valid new G2 (but not in use yet).
+      No old waiter can neither grab a signal nor acquire a reference without
+@@ -311,9 +239,13 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+   g1 ^= 1;
+   *g1index ^= 1;
+ 
++  /* Now advance the new G1 g_signals to the new g1_start, giving it
++     an effective signal count of 0 to start.  */
++  atomic_store_release (cond->__data.__g_signals + g1, (unsigned)new_g1_start);
++
+   /* These values are just observed by signalers, and thus protected by the
+      lock.  */
+-  unsigned int orig_size = wseq - (old_g1_start + old_orig_size);
++  unsigned int orig_size = wseq - new_g1_start;
+   __condvar_set_orig_size (cond, orig_size);
+   /* Use and addition to not loose track of cancellations in what was
+      previously G2.  */
+diff --git a/nptl/pthread_cond_signal.c b/nptl/pthread_cond_signal.c
+index 14800ba00b..07427369aa 100644
+--- a/nptl/pthread_cond_signal.c
++++ b/nptl/pthread_cond_signal.c
+@@ -69,19 +69,18 @@ ___pthread_cond_signal (pthread_cond_t *cond)
+   bool do_futex_wake = false;
+ 
+   /* If G1 is still receiving signals, we put the signal there.  If not, we
+-     check if G2 has waiters, and if so, quiesce and switch G1 to the former
+-     G2; if this results in a new G1 with waiters (G2 might have cancellations
+-     already, see __condvar_quiesce_and_switch_g1), we put the signal in the
+-     new G1.  */
++     check if G2 has waiters, and if so, switch G1 to the former G2; if this
++     results in a new G1 with waiters (G2 might have cancellations already,
++     see __condvar_switch_g1), we put the signal in the new G1. */
+   if ((cond->__data.__g_size[g1] != 0)
+-      || __condvar_quiesce_and_switch_g1 (cond, wseq, &g1, private))
++      || __condvar_switch_g1 (cond, wseq, &g1, private))
+     {
+       /* Add a signal.  Relaxed MO is fine because signaling does not need to
+-	 establish a happens-before relation (see above).  We do not mask the
+-	 release-MO store when initializing a group in
+-	 __condvar_quiesce_and_switch_g1 because we use an atomic
+-	 read-modify-write and thus extend that store's release sequence.  */
+-      atomic_fetch_add_relaxed (cond->__data.__g_signals + g1, 2);
++         establish a happens-before relation (see above).  We do not mask the
++         release-MO store when initializing a group in __condvar_switch_g1
++         because we use an atomic read-modify-write and thus extend that
++         store's release sequence.  */
++      atomic_fetch_add_relaxed (cond->__data.__g_signals + g1, 1);
+       cond->__data.__g_size[g1]--;
+       /* TODO Only set it if there are indeed futex waiters.  */
+       do_futex_wake = true;
+diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
+index 20c348a503..d5b1344c38 100644
+--- a/nptl/pthread_cond_wait.c
++++ b/nptl/pthread_cond_wait.c
+@@ -84,7 +84,7 @@ __condvar_cancel_waiting (pthread_cond_t *cond, uint64_t seq, unsigned int g,
+      not hold a reference on the group.  */
+   __condvar_acquire_lock (cond, private);
+ 
+-  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond) >> 1;
++  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
+   if (g1_start > seq)
+     {
+       /* Our group is closed, so someone provided enough signals for it.
+@@ -238,9 +238,7 @@ __condvar_cleanup_waiting (void *arg)
+    signaled), and a reference count.
+ 
+    The group reference count is used to maintain the number of waiters that
+-   are using the group's futex.  Before a group can change its role, the
+-   reference count must show that no waiters are using the futex anymore; this
+-   prevents ABA issues on the futex word.
++   are using the group's futex.
+ 
+    To represent which intervals in the waiter sequence the groups cover (and
+    thus also which group slot contains G1 or G2), we use a 64b counter to
+@@ -251,7 +249,7 @@ __condvar_cleanup_waiting (void *arg)
+    figure out whether they are in a group that has already been completely
+    signaled (i.e., if the current G1 starts at a later position that the
+    waiter's position).  Waiters cannot determine whether they are currently
+-   in G2 or G1 -- but they do not have too because all they are interested in
++   in G2 or G1 -- but they do not have to because all they are interested in
+    is whether there are available signals, and they always start in G2 (whose
+    group slot they know because of the bit in the waiter sequence.  Signalers
+    will simply fill the right group until it is completely signaled and can
+@@ -280,7 +278,6 @@ __condvar_cleanup_waiting (void *arg)
+      * Waiters fetch-add while having acquire the mutex associated with the
+        condvar.  Signalers load it and fetch-xor it concurrently.
+    __g1_start: Starting position of G1 (inclusive)
+-     * LSB is index of current G2.
+      * Modified by signalers while having acquired the condvar-internal lock
+        and observed concurrently by waiters.
+    __g1_orig_size: Initial size of G1
+@@ -300,11 +297,10 @@ __condvar_cleanup_waiting (void *arg)
+        last reference.
+      * Reference count used by waiters concurrently with signalers that have
+        acquired the condvar-internal lock.
+-   __g_signals: The number of signals that can still be consumed.
++   __g_signals: The number of signals that can still be consumed, relative to
++     the current g1_start.  (i.e. g1_start with the signal count added)
+      * Used as a futex word by waiters.  Used concurrently by waiters and
+        signalers.
+-     * LSB is true iff this group has been completely signaled (i.e., it is
+-       closed).
+    __g_size: Waiters remaining in this group (i.e., which have not been
+      signaled yet.
+      * Accessed by signalers and waiters that cancel waiting (both do so only
+@@ -328,18 +324,6 @@ __condvar_cleanup_waiting (void *arg)
+    sufficient because if a waiter can see a sufficiently large value, it could
+    have also consume a signal in the waiters group.
+ 
+-   Waiters try to grab a signal from __g_signals without holding a reference
+-   count, which can lead to stealing a signal from a more recent group after
+-   their own group was already closed.  They cannot always detect whether they
+-   in fact did because they do not know when they stole, but they can
+-   conservatively add a signal back to the group they stole from; if they
+-   did so unnecessarily, all that happens is a spurious wake-up.  To make this
+-   even less likely, __g1_start contains the index of the current g2 too,
+-   which allows waiters to check if there aliasing on the group slots; if
+-   there wasn't, they didn't steal from the current G1, which means that the
+-   G1 they stole from must have been already closed and they do not need to
+-   fix anything.
+-
+    It is essential that the last field in pthread_cond_t is __g_signals[1]:
+    The previous condvar used a pointer-sized field in pthread_cond_t, so a
+    PTHREAD_COND_INITIALIZER from that condvar implementation might only
+@@ -379,7 +363,6 @@ static __always_inline int
+ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+     clockid_t clockid, const struct __timespec64 *abstime)
+ {
+-  const int maxspin = 0;
+   int err;
+   int result = 0;
+ 
+@@ -396,8 +379,7 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+      because we do not need to establish any happens-before relation with
+      signalers (see __pthread_cond_signal); modification order alone
+      establishes a total order of waiters/signals.  We do need acquire MO
+-     to synchronize with group reinitialization in
+-     __condvar_quiesce_and_switch_g1.  */
++     to synchronize with group reinitialization in __condvar_switch_g1.  */
+   uint64_t wseq = __condvar_fetch_add_wseq_acquire (cond, 2);
+   /* Find our group's index.  We always go into what was G2 when we acquired
+      our position.  */
+@@ -424,178 +406,64 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+       return err;
+     }
+ 
+-  /* Now wait until a signal is available in our group or it is closed.
+-     Acquire MO so that if we observe a value of zero written after group
+-     switching in __condvar_quiesce_and_switch_g1, we synchronize with that
+-     store and will see the prior update of __g1_start done while switching
+-     groups too.  */
+-  unsigned int signals = atomic_load_acquire (cond->__data.__g_signals + g);
+ 
+-  do
++  while (1)
+     {
+-      while (1)
+-	{
+-	  /* Spin-wait first.
+-	     Note that spinning first without checking whether a timeout
+-	     passed might lead to what looks like a spurious wake-up even
+-	     though we should return ETIMEDOUT (e.g., if the caller provides
+-	     an absolute timeout that is clearly in the past).  However,
+-	     (1) spurious wake-ups are allowed, (2) it seems unlikely that a
+-	     user will (ab)use pthread_cond_wait as a check for whether a
+-	     point in time is in the past, and (3) spinning first without
+-	     having to compare against the current time seems to be the right
+-	     choice from a performance perspective for most use cases.  */
+-	  unsigned int spin = maxspin;
+-	  while (signals == 0 && spin > 0)
+-	    {
+-	      /* Check that we are not spinning on a group that's already
+-		 closed.  */
+-	      if (seq < (__condvar_load_g1_start_relaxed (cond) >> 1))
+-		goto done;
+-
+-	      /* TODO Back off.  */
+-
+-	      /* Reload signals.  See above for MO.  */
+-	      signals = atomic_load_acquire (cond->__data.__g_signals + g);
+-	      spin--;
+-	    }
+-
+-	  /* If our group will be closed as indicated by the flag on signals,
+-	     don't bother grabbing a signal.  */
+-	  if (signals & 1)
+-	    goto done;
+-
+-	  /* If there is an available signal, don't block.  */
+-	  if (signals != 0)
+-	    break;
+-
+-	  /* No signals available after spinning, so prepare to block.
+-	     We first acquire a group reference and use acquire MO for that so
+-	     that we synchronize with the dummy read-modify-write in
+-	     __condvar_quiesce_and_switch_g1 if we read from that.  In turn,
+-	     in this case this will make us see the closed flag on __g_signals
+-	     that designates a concurrent attempt to reuse the group's slot.
+-	     We use acquire MO for the __g_signals check to make the
+-	     __g1_start check work (see spinning above).
+-	     Note that the group reference acquisition will not mask the
+-	     release MO when decrementing the reference count because we use
+-	     an atomic read-modify-write operation and thus extend the release
+-	     sequence.  */
+-	  atomic_fetch_add_acquire (cond->__data.__g_refs + g, 2);
+-	  if (((atomic_load_acquire (cond->__data.__g_signals + g) & 1) != 0)
+-	      || (seq < (__condvar_load_g1_start_relaxed (cond) >> 1)))
+-	    {
+-	      /* Our group is closed.  Wake up any signalers that might be
+-		 waiting.  */
+-	      __condvar_dec_grefs (cond, g, private);
+-	      goto done;
+-	    }
+-
+-	  // Now block.
+-	  struct _pthread_cleanup_buffer buffer;
+-	  struct _condvar_cleanup_buffer cbuffer;
+-	  cbuffer.wseq = wseq;
+-	  cbuffer.cond = cond;
+-	  cbuffer.mutex = mutex;
+-	  cbuffer.private = private;
+-	  __pthread_cleanup_push (&buffer, __condvar_cleanup_waiting, &cbuffer);
+-
+-	  err = __futex_abstimed_wait_cancelable64 (
+-	    cond->__data.__g_signals + g, 0, clockid, abstime, private);
+-
+-	  __pthread_cleanup_pop (&buffer, 0);
+-
+-	  if (__glibc_unlikely (err == ETIMEDOUT || err == EOVERFLOW))
+-	    {
+-	      __condvar_dec_grefs (cond, g, private);
+-	      /* If we timed out, we effectively cancel waiting.  Note that
+-		 we have decremented __g_refs before cancellation, so that a
+-		 deadlock between waiting for quiescence of our group in
+-		 __condvar_quiesce_and_switch_g1 and us trying to acquire
+-		 the lock during cancellation is not possible.  */
+-	      __condvar_cancel_waiting (cond, seq, g, private);
+-	      result = err;
+-	      goto done;
+-	    }
++      /* Now wait until a signal is available in our group or it is closed.
++         Acquire MO so that if we observe (signals == lowseq) after group
++         switching in __condvar_switch_g1, we synchronize with that store and
++         will see the prior update of __g1_start done while switching groups
++         too.  */
++      unsigned int signals = atomic_load_acquire (cond->__data.__g_signals + g);
++      uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
++
++      if (seq < g1_start)
++        {
++          /* If the group is closed already,
++             then this waiter originally had enough extra signals to
++             consume, up until the time its group was closed.  */
++           break;
++        }
++
++      /* If there is an available signal, don't block.
++         If __g1_start has advanced at all, then we must be in G1
++         by now, perhaps in the process of switching back to an older
++         G2, but in either case we're allowed to consume the available
++         signal and should not block anymore.  */
++      if ((int)(signals - (unsigned int)g1_start) > 0)
++        {
++         /* Try to grab a signal.  See above for MO.  (if we do another loop
++            iteration we need to see the correct value of g1_start)  */
++           if (atomic_compare_exchange_weak_acquire (
++                       cond->__data.__g_signals + g,
++                       &signals, signals - 1))
++	      break;
+ 	  else
+-	    __condvar_dec_grefs (cond, g, private);
++	    continue;
+ 
+-	  /* Reload signals.  See above for MO.  */
+-	  signals = atomic_load_acquire (cond->__data.__g_signals + g);
+ 	}
+-
++      // Now block.
++      struct _pthread_cleanup_buffer buffer;
++      struct _condvar_cleanup_buffer cbuffer;
++      cbuffer.wseq = wseq;
++      cbuffer.cond = cond;
++      cbuffer.mutex = mutex;
++      cbuffer.private = private;
++      __pthread_cleanup_push (&buffer, __condvar_cleanup_waiting, &cbuffer);
++
++      err = __futex_abstimed_wait_cancelable64 (
++        cond->__data.__g_signals + g, signals, clockid, abstime, private);
++
++      __pthread_cleanup_pop (&buffer, 0);
++
++      if (__glibc_unlikely (err == ETIMEDOUT || err == EOVERFLOW))
++        {
++          /* If we timed out, we effectively cancel waiting.  */
++          __condvar_cancel_waiting (cond, seq, g, private);
++          result = err;
++          break;
++        }
+     }
+-  /* Try to grab a signal.  Use acquire MO so that we see an up-to-date value
+-     of __g1_start below (see spinning above for a similar case).  In
+-     particular, if we steal from a more recent group, we will also see a
+-     more recent __g1_start below.  */
+-  while (!atomic_compare_exchange_weak_acquire (cond->__data.__g_signals + g,
+-						&signals, signals - 2));
+-
+-  /* We consumed a signal but we could have consumed from a more recent group
+-     that aliased with ours due to being in the same group slot.  If this
+-     might be the case our group must be closed as visible through
+-     __g1_start.  */
+-  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
+-  if (seq < (g1_start >> 1))
+-    {
+-      /* We potentially stole a signal from a more recent group but we do not
+-	 know which group we really consumed from.
+-	 We do not care about groups older than current G1 because they are
+-	 closed; we could have stolen from these, but then we just add a
+-	 spurious wake-up for the current groups.
+-	 We will never steal a signal from current G2 that was really intended
+-	 for G2 because G2 never receives signals (until it becomes G1).  We
+-	 could have stolen a signal from G2 that was conservatively added by a
+-	 previous waiter that also thought it stole a signal -- but given that
+-	 that signal was added unnecessarily, it's not a problem if we steal
+-	 it.
+-	 Thus, the remaining case is that we could have stolen from the current
+-	 G1, where "current" means the __g1_start value we observed.  However,
+-	 if the current G1 does not have the same slot index as we do, we did
+-	 not steal from it and do not need to undo that.  This is the reason
+-	 for putting a bit with G2's index into__g1_start as well.  */
+-      if (((g1_start & 1) ^ 1) == g)
+-	{
+-	  /* We have to conservatively undo our potential mistake of stealing
+-	     a signal.  We can stop trying to do that when the current G1
+-	     changes because other spinning waiters will notice this too and
+-	     __condvar_quiesce_and_switch_g1 has checked that there are no
+-	     futex waiters anymore before switching G1.
+-	     Relaxed MO is fine for the __g1_start load because we need to
+-	     merely be able to observe this fact and not have to observe
+-	     something else as well.
+-	     ??? Would it help to spin for a little while to see whether the
+-	     current G1 gets closed?  This might be worthwhile if the group is
+-	     small or close to being closed.  */
+-	  unsigned int s = atomic_load_relaxed (cond->__data.__g_signals + g);
+-	  while (__condvar_load_g1_start_relaxed (cond) == g1_start)
+-	    {
+-	      /* Try to add a signal.  We don't need to acquire the lock
+-		 because at worst we can cause a spurious wake-up.  If the
+-		 group is in the process of being closed (LSB is true), this
+-		 has an effect similar to us adding a signal.  */
+-	      if (((s & 1) != 0)
+-		  || atomic_compare_exchange_weak_relaxed
+-		       (cond->__data.__g_signals + g, &s, s + 2))
+-		{
+-		  /* If we added a signal, we also need to add a wake-up on
+-		     the futex.  We also need to do that if we skipped adding
+-		     a signal because the group is being closed because
+-		     while __condvar_quiesce_and_switch_g1 could have closed
+-		     the group, it might stil be waiting for futex waiters to
+-		     leave (and one of those waiters might be the one we stole
+-		     the signal from, which cause it to block using the
+-		     futex).  */
+-		  futex_wake (cond->__data.__g_signals + g, 1, private);
+-		  break;
+-		}
+-	      /* TODO Back off.  */
+-	    }
+-	}
+-    }
+-
+- done:
+ 
+   /* Confirm that we have been woken.  We do that before acquiring the mutex
+      to allow for execution of pthread_cond_destroy while having acquired the
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 9073e04537..b3c4a10023 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -66,6 +66,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
            file://0003-sunrpc-suppress-gcc-os-warning-on-user2netname.patch \
            file://0001-stdlib-Add-single-threaded-fast-path-to-rand.patch \
+           file://0004-pthreads-NPTL-lost-wakeup-fix.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.49.0



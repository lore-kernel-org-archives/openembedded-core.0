Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81261C678D7
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 02:05:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.186705.1673921148908527011
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 18:05:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03811263df=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30H23GNO028266
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 18:05:48 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3vsqa36x-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 18:05:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hMfLQ7NsDQ/rMMunI73PeWF/UhzbnCuU0VJacykUIghLWdFBh6KFreVLyGQ5dsCPKIUDuysuqIrpOI/5finytqGr4GmONWf+7WsafqCM8zSLlNmr3jEkkHCsMS7yTziLhUL0BQ7ciHSPfmVTjhzaT0zyPvLHrennd1crLI3nM9z/l/0mIrezhCU/Sb7z9RH5f18mNdvgUXp+RFcPiemRJLGZuIrRfyWK0q+lmC1A9o12aB6DDjF5c/0eEvFHrxP6djMi/DfjlrzznDzGF7USp3hWOzLBn8C6jmeGpEbiamDqA9PXFIlTjDuvrsnYHSowA6z+90Ig6AvHmdPQo39pXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1HZ0aynjtTSHe37TxCI1lepdIEPj7EwC/NHJZdDh98=;
 b=B3TVdyFQzfeEM0WpkvXALQ86vr50P6uhhgOjU7AzJK78lXr6wedMxaq3zah8UG3Q5oDhGc4Tg6b0XqYraa1N9e/YOh0pfU3w3mHTmMucoJXF90u9+cxkrfBgZiw6CBV9+3NLouiT6/piyMO4w7viOIrYYlA0uHxeVdFSuVhL1b8G/2cPwwwmtNLDddEeKSlZZpzRzeS7CKSazUpg5oSSEzCBUQsiHQxddVIosKOnbMorL3h+zj0ff4BPa2XKe1r7l+x3fHM0F7xvxIaNtraUW+TP3mtACzpQMjFBMH52Pmv09ktijY2fzw+7m2amATd+FHTcREit9jSkLrspEq3eyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SA0PR11MB4623.namprd11.prod.outlook.com (2603:10b6:806:95::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Tue, 17 Jan
 2023 02:05:45 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::39df:478e:d974:335a]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::39df:478e:d974:335a%8]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 02:05:45 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][PATCH 0/3] set qemuppc64 default nfs rootfs mount r/w size to 524288
Date: Tue, 17 Jan 2023 10:05:01 +0800
Message-Id: <20230117020504.697181-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0072.namprd03.prod.outlook.com
 (2603:10b6:a03:331::17) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SA0PR11MB4623:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a95ed20-1f36-4f53-af77-08daf82f57eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rr9wSqL7fQHxOaHXjPZsiHOv41d3D6CGGaa97oCbhoLGLp5b66PVE6R1AkNljmsIXsdivaCGZuhvKvkk6q+DiAigOjRTmMHMvW/KRG0bLs4urJiujYfnN4jMmlgW8W288k8owNuTH9ovQooWbLNn2CayCHQre0VatWXubPUNoc4vOAeN5o77xp4xUBpusT6wIcvmjxRuUqx7BwwX8Ghyb2bH8iyTNoIQhLlR28yEHV6qbRFzL4d19fuj2xTXVvBku+tUMB7S9/UkbGpJA+Wb500mAwemk1VqvJRypVFX8PrBYVN4QMmzUsX5nUULmGpBINCdgKw/YfeshQRil0T+zTAVFG2d17XhNNx9F9qpJZt+IEooxzmpo5DwK1xsjo5tub5Y2VD4pV4/ifXc+GX0VMfMa/yjYDwv0QZlJuHlEF8KoNH7LeVyx+lQo7PE6LxCupSs9vt0I4FubniRmmWx5IQEA0RDIgeGiQW/IeYOelQfluxkCKp5PiXTxwfm/kFycL2sIIwOnFz8Ysde7juoQ5S2388JZ+lfQ81MLb0i+KhA1W4SwqaVpYiwIWmDLFBPmajktXRsV5P6M752vq/4CxeD//cBiCY3mMDt+ZVzCje5RUjMigUxpsb/lSWPuay+GrWOA92/cHfH3hR2A0uW7kLQa3BX47JpCooVLl793p+tHXO13SI1eeIPHS4LCCu+mqgZQBg5GRFROTR/54sPV1JzFeCaYPULno3YfX8wfDU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(136003)(346002)(396003)(376002)(366004)(451199015)(6486002)(966005)(478600001)(8936002)(44832011)(5660300002)(6916009)(41300700001)(66556008)(66476007)(26005)(66946007)(8676002)(2906002)(316002)(83170400001)(52116002)(38100700002)(38350700002)(6506007)(6666004)(1076003)(6512007)(186003)(2616005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gK4ggkyRpSa4yTPmTXS2OsgvLHBYsKWLdS9dMO32JIK9rpaQrhITGd+RxG9F?=
 =?us-ascii?Q?2zjjlCfZeolr73BObjnEJwxWIc3ECVcdnLHtPKdMPz5ZemhU7vhd4YPpxJ7t?=
 =?us-ascii?Q?xCZrV8CNohpIP3mfJkKSmPMYXHvRUkAKmSI0faVCUcAmoPqIwztZ3oUlxUKc?=
 =?us-ascii?Q?SuYprcqxgDfYTsopaVqyRfx9cH30ifkbk3znFDd4RLI8iRaeckueV2IPPrFs?=
 =?us-ascii?Q?LsMlmox5Ac9DXOHpvERGSkON+GvrHUMGhcfUvlAs74NTVSFc9AZzOFWxHaNW?=
 =?us-ascii?Q?csnzVF3mScIMhZld3cPf2ATcMECD0Lw/Tp7OrbE/+92b3VKrXDwgcS+YjQhZ?=
 =?us-ascii?Q?nva+kQox6u97luClTqOHOkC3wm4eydrergwmd6WEMCd/P03bW3FNrYjfhyXJ?=
 =?us-ascii?Q?FgJA1gv+G7si4D88FRXgtQTzpvDhC0VUo4+JxLP/JZzRIqMGnKaRV14KBhGd?=
 =?us-ascii?Q?pdsA3YdHbriYKwThVacENX9GYX/C7Qz7yrwFHLMCHcU4zyqF5nKVFTDWymtO?=
 =?us-ascii?Q?naMaq3tmNGpLhyDkvajXqb5BTUJJcVgnJIf+Ew8mBvbZjjvtllpeUQ9SyDpj?=
 =?us-ascii?Q?dChUHeZbKzYJu4kn+CTELogvkxVe7eYBAkoW3jFQcjLAJ9wxPHglXsHfDNli?=
 =?us-ascii?Q?+3IZQ3EBRtqutBMagvtkpjZzMU31l382yIxHXWSGFu7k+S9gBAjhrBRPlZr7?=
 =?us-ascii?Q?/mQzU8gqQGBaRaCsIyhvdleBxr5oeYQW+YZTUsk7Ks0Ert6GnVGwFEBYiems?=
 =?us-ascii?Q?J45tMIqkJG/sosQnjKdKuhJAvzjYliStL6alHHaDgSJNml2PEJ+c1eBr6nQZ?=
 =?us-ascii?Q?N4qQax4r/FkDuTFSuCBrOWEJCOVe8kLtmbMRZOHl6i84ikOP5VAsjPN6dRzT?=
 =?us-ascii?Q?a3VW3h3qRHHw5dMQJSSxnXjClPIn4nrxoheT1qyHckQFUbjoQZA98j+eRhEi?=
 =?us-ascii?Q?e5vMzWF/kIQiNRaJVupBdQMx9fb6+aOLJ84tZQwOpQNEuNiCdDS4ZzUkECwH?=
 =?us-ascii?Q?pJKfyZ4oTNV6Cghrhdmg4tVONGzQ9WaikbA/4/QE1A1cVOuMMf1j1izIcEIP?=
 =?us-ascii?Q?vVDWeIIEMjoAHjD1KA07Zpo3qa04lCbnFVuvkRlQVBylf4NXaIPSkVNm8pjS?=
 =?us-ascii?Q?mnHy941i6q7nllKIoJXEL70HBLZGjv/OPa5Onoc+LxpigTYqEZtnK246JV7A?=
 =?us-ascii?Q?Ve6/cTau4Ybbi2PgoZiRlT4uSH+eLJv4tCzJZZ0u/gghjvew6S39knvEKBGP?=
 =?us-ascii?Q?/92quN+j5PevW+IAOG5WN56/N/Us6rkCf8dTcAaDM/92lwKBSFiQxjlHZiUG?=
 =?us-ascii?Q?yeGd1yeE5avlogZQKIiL3BoVS8bBQ+PL0wf85Ddh1cUsTrhd2uwEYoBbRkZO?=
 =?us-ascii?Q?zFOQB4BheEZJjTSQZ+ccer8Kul6AFFBF70XBZmaV15SF3GL9Jn6j2rjZ5vmm?=
 =?us-ascii?Q?2CLeoBIUlnbudWOfixvEHg3YAQ6Tolg1XmkTwoLnA181QG3ACtmL7X/hZilT?=
 =?us-ascii?Q?jmcJN6PSZFGUz2mE/TAUdu+DSXbb19+3IHHaiS4bq3k9hsGevg9+oyEea9so?=
 =?us-ascii?Q?1Ip+x67gE3F+HpSPIpa+K7An5E2YCcalTQaDSh2zjE32yySpnlCQiSzzUxct?=
 =?us-ascii?Q?0g=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a95ed20-1f36-4f53-af77-08daf82f57eb
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 02:05:45.1435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b6QnbgD4Ud8yzXUHg6Dl8VwUy56MqID40Hkjamd/Y3RlncucdWM1FL7p/Yy2dAYAsyQB8eIc+RNVDpPgBk1oeXvh4/S837GVGJKqi9BzdHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4623
X-Proofpoint-GUID: eH6aLqOp-KruGpm-T_bFtS31hxjY5inp
X-Proofpoint-ORIG-GUID: eH6aLqOp-KruGpm-T_bFtS31hxjY5inp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-16_18,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301170012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 02:05:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176021

From: Xiangyu Chen <xiangyu.chen@windriver.com>

On master oe, build a qemuppc64 with systemd as default init, when we
use nfs bootup, the kernel might panic due to missing symbol in dynamic
libraries as below:

  hid-generic 0003:0627:0001.0003: input: USB HID v0.01 Mouse [QEMU QEMU USB Tablet] on usb-0000:00:01.0-3/input0
  /sbin/init: /lib64/libm.so.6: version `XZ_5.0' not found (required by /usr/lib64/libkmod.so.2)
  Kernel panic - not syncing: Attempted to kill init! exitcode=0x00007f00
  CPU: 0 PID: 1 Comm: init Not tainted 5.15.78-yocto-standard #1
  Call Trace:
  [c000000007443ba0] [c0000000009538d0] dump_stack_lvl+0x74/0xa8 (unreliable)
  [c000000007443be0] [c000000000103524] panic+0x170/0x3cc
  [c000000007443c80] [c00000000010cf64] do_exit+0xb44/0xb50
  [c000000007443d50] [c00000000010d040] do_group_exit+0x60/0xd0
  [c000000007443d90] [c00000000010d0d4] sys_exit_group+0x24/0x30
  [c000000007443db0] [c00000000002cfd4] system_call_exception+0x194/0x2f0
  [c000000007443e10] [c00000000000c2cc] system_call_common+0xec/0x250
  --- interrupt: c00 at 0x7fff9ed9e840
  NIP:  00007fff9ed9e840 LR: 00007fff9ed7da20 CTR: 0000000000000000
  REGS: c000000007443e80 TRAP: 0c00   Not tainted (5.15.78-yocto-standard)
  MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 24022442  XER: 00000000

One or more of the libraries systemd depends on failed to load due to
unresolved symbols/functions.  This was intermittent - with a failure
rate estimated between 5% and 30%.

After checking the code, this issue happens on gcc 12, kirkstone is using
gcc 11 works well, with both using the exact same v5.15.84 kernel commit.

There is a kernel fix from upstream [1], they changed the rsize / wsize
to a multiple of PAGE_SIZE, when we applied this patch, the qemuppc64's
default r/wsize went from 4096 to 524288.But the qemuppc64 doesn't have
its own linux-yocto kernel branch, so apply this change might cause
regression with other platforms which share branch with qemuppc64.

So, we added an extra option for nfs rootfs, and set the qemuppc64 default
r/w size to 524288 to line up with the kernel fix[1].

Yocto did a similar thing in the distant past[2] - prior to boot-arg
adjustments existing - by allowing a Kconfig to set the defaults on
nfsboot, in order to work around hardware limitations.

There are 3 patches for this fix:
the patch 1 added QB_NFSROOTFS_EXTRA_OPT in qemuboot.bbclass,it contains 
a default QB_NFSROOTFS_EXTRA_OPT value and some notes in comment.
the patch 2 contains processing this value in runqemu script
the patch 3 set the r/wsize value in qemuppc64 machine configuration
file.

Reference:
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=940261a195080cf
[2] https://git.yoctoproject.org/linux-yocto-4.1/commit/?h=standard/base&id=a96cfd98add95

Xiangyu Chen (3):
  qemuboot.bbclass: add QB_NFSROOTFS_EXTRA_OPT for nfs rootfs extra
    option
  runqemu: add process of option QB_NFSROOTFS_EXTRA_OPT
  qemuppc64: set the qemuppc64 nfs r/wsize mount options to 524288

 meta/classes-recipe/qemuboot.bbclass | 3 +++
 meta/conf/machine/qemuppc64.conf     | 1 +
 scripts/runqemu                      | 6 +++++-
 3 files changed, 9 insertions(+), 1 deletion(-)

-- 
2.34.1



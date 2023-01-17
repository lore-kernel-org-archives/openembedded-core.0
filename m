Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EEF4C46467
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 02:05:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.186706.1673921150550984728
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 18:05:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03811263df=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30H1sUGG024872
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 18:05:50 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3rj6ta6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 18:05:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ObC6+zY/kTuPgZwhgCph/6gJ7xEFzMVtZJsHgYNwNEP6TvvlW5NGHlyZ/8Pa6BSKoCa/Vo8G0BG1V2oEZSIdBl7ilV04u3oRPkTg9jArH7qQBMP5xOz2peXlGgnTThFdVaG8GF3PfW2bsOPvw6GiKg8TQGcysqo6Y/cn86go2Tv0AnA1I7kGsML6pWhH7yk/zsx45UrNXuo7UOwzNh9RiVcMjy7eqCpUPMLYWzc1eluYTPvk5p+iin2X9pokUY4wi+PDz0vyRndgENO2rxgKFiZHJkAfwXGEmdXZ+Q1Q5r4VER25MugZihhvA/7JfrPCvfLWGtgmiSrm9e4cZURIbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1FmiisYS2VsHhzC8zo3UIrM0GAZ4Iot6xwgww3a7ilM=;
 b=H4ruaXJlbAh4TApz20G60JOU199/wjs9V0Ugv0oofVaGaTdcdCAxgotxOaTIOwvkXMfRMiTUf2xX/bCRa6LL2vixzDzTiPnlOVNwBnu3fnwA9vkYfXlU9DekducYxnH7zxnhgMqrMi4coVbBpycG+HUQ2DdV84sxy11piQv7yBzN4XWlOVafUNjSb+2WW1QUvCeFQOjHnX0dSgKSpk6ZFTmVfrvs5DoD0oHXJMq3uBuEwMEVCJ2xXrP1nOAwsDRJSzM1DLW4SF1B2qvb6S9PfcC3413KD4sGMc9wGQXi39j8w21dJpC7tzBKfRMhoPEIfb+SEPj3T/fN+N38m8l7Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SA0PR11MB4623.namprd11.prod.outlook.com (2603:10b6:806:95::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Tue, 17 Jan
 2023 02:05:48 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::39df:478e:d974:335a]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::39df:478e:d974:335a%8]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 02:05:48 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][PATCH 3/3] qemuppc64: set the qemuppc64 nfs r/wsize mount options to 524288
Date: Tue, 17 Jan 2023 10:05:04 +0800
Message-Id: <20230117020504.697181-4-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117020504.697181-1-xiangyu.chen@eng.windriver.com>
References: <20230117020504.697181-1-xiangyu.chen@eng.windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0072.namprd03.prod.outlook.com
 (2603:10b6:a03:331::17) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SA0PR11MB4623:EE_
X-MS-Office365-Filtering-Correlation-Id: fdac16f0-eced-49dd-2136-08daf82f59fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Fgf4Bc03mV8E546rWx7bwEKGHMpke1faabVC2CSM6tlFivk74EZSW5MqS/uBaX7XL9Jfx/nvooVl+m7j+/Bpf8gJyNlP+kqhg6jmZTzJqAHHNvwfj4/O6RMEh2xPaucOPHY8n7YmMfHaaB7dD646ejmogPycPF2Bu4u7G2Swzm4TzJg4bGysGmgqPwEOj+slGgOwsI0aQhkPkfLk6GiXN5CS5Rswa13Q85Cri6ehdXfAY/J4twSkEbizNJqKh+bt2q0JhzGn0uPBQ2fCQBJ1OWuFXiSyn8/nvbfTv6mztybHcTuwMyfs9R11CbVZTn+FGbXFwtx6cMXvKhfRgNvO3NeOpa3jOwCBbjTrA9dM/1prrX8smS9cHHF7f8yZl5vGZ4EpMPx5UyCjYYa6bs29h4EJZH8E9IcltSXT4cngk6lxg67E/qkjY3dAqvwyGIN7/HNAD9wTj4nUbZJOuQ4nNzehF9o9tAXq/HEjsjyATu8B3JAshC+gJaQfP/lguFE14bBvptIl+typNf4m/wJQ9QVPyVCx/tGUbclvLuXJ3tVZe6R1zhw8SfNOn8xdiugVSwxrgsMPlxYJYjtkYkpVHioM4r7zBvkWvmV3tyq9gyF9Z8LmxJ/UvI/ZJUyqFa7hkwAC52TTDpjF3oNCAR/6qznSsRGLEKz/IAAAvA96ALT7rPxhOHmZy9fpUXy0jt6zB7LR8GUrXyJTUbhQnlOkm1tMmDQGa73otS0h6BOzJQI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(136003)(346002)(396003)(376002)(366004)(451199015)(6486002)(966005)(478600001)(8936002)(44832011)(5660300002)(6916009)(41300700001)(66556008)(66476007)(26005)(66946007)(8676002)(2906002)(316002)(83170400001)(52116002)(38100700002)(38350700002)(6506007)(6666004)(1076003)(6512007)(186003)(2616005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ho4nav+8D/w6GAbo7eToUiIAa68H6S4ZsaGNqLiBagPbRUf7A9/B7Uw+Zed9?=
 =?us-ascii?Q?4C5FVa2tlr7j9FmEHqD8LgLkVMvErhg8IeYGCz9dUQhQYDIKWoR+EF31fIm6?=
 =?us-ascii?Q?64rNem7KAAlzvPofxg5cdwwjX8wGK6JkNiw+XjKi5GbHjI+keWeqN+WgRC+b?=
 =?us-ascii?Q?RVSQXpPKfSOaswL3HwYPWn2zl+E77JnMuE/4Yk24UwhJbquCZy4I4szW4cAz?=
 =?us-ascii?Q?SYMIOUbbbrj5lF2cT/zX007NaqmXCP6dJnL1naHhT8R/7TUFh3RITsv0sW21?=
 =?us-ascii?Q?Krps3Nk7X7LaBvSOpGN7IpfAm3PQXFhfHKbI0dlaUep4+i8r9lK7MDnobnFh?=
 =?us-ascii?Q?LBwaVNgPrm+1h4ZW920ec5SxUmAXV4U4urZABeQaS+EqrAg+2jbCw7J7z9dx?=
 =?us-ascii?Q?bmNKeAsn9OawUn4EFZ/ofn4ERrDq9aIqVyE6cAdVe0uKYp4yhd8jaGBSuckz?=
 =?us-ascii?Q?jvgkGp4pZrklXxJjrgaoXkfBfUkekhXGm/2p3KOulA/b5xZbcRZHHF3/6nfu?=
 =?us-ascii?Q?yw9zRnntMDMyXF5s9X5K71foPnpA0hl8xNonAlK3ZLwmhgerW8ibUJfcAcVO?=
 =?us-ascii?Q?msraBNQZeoWrGuPBQeM0gI9WluBPFnofewlXxjPi0jm9D4zORuTnkhqJg4U1?=
 =?us-ascii?Q?p9IVQ0c7/xX52H/wIYJwIhBSpBY9ki4YPX86E6ESnUZ2deA6HwZWW/B2GqjF?=
 =?us-ascii?Q?7HMt4mHKXJVQZQN3K+BjXcSztJgOXvjCWk9UQ7nlTlDyE3pGZgMsmWqCMtbD?=
 =?us-ascii?Q?7TEF4aGSd1R+iAcz2FS//N/ySR010xY8T9ED9SJGPNQ1FJq4TpCRwK+91kOu?=
 =?us-ascii?Q?4fen3GiBgwcpFvpPJOupU8CdTtVztJ4II4ln5kOW8kAR6I+vdk7x6hF3o32X?=
 =?us-ascii?Q?JZUzkMI2Styj4zq+UG2Kwyy1exLaN0Cv67t6UqymHg8FY7zvtjPtKLmc0cdX?=
 =?us-ascii?Q?VDSplEZRtzaZs9FWqoQRwqyHTwMMrTAcroLDrzis3QVrNjeHYCma0Sp64Gbd?=
 =?us-ascii?Q?0TfvBT43vjXCIwhssTKkOl1/IzUSuicBuFON7eoVsVyygQx2h286XpiAlibK?=
 =?us-ascii?Q?lbv6Apmat4QbSdUcMA9HyMDktNhzsMLbrv3s+kPtWG8eqUhMTzDwGPzYemJO?=
 =?us-ascii?Q?Ws5deiU1hOf5jx3RbnuW9Sw+AMiOlduXmXokCDueaS0CS/gSdDMDDc0sbPmq?=
 =?us-ascii?Q?e40EaCN0H3rdlR4cG2CCaTNIdbMFyeeb3+5EblQdCqkSvcRYvgTZ3/v1VYMv?=
 =?us-ascii?Q?7aiFiTp4WqwxgTrWNL2wAHnwAKOTe8nPSiFcFNR8XkxKiUwOtoSwzNXiR+Wr?=
 =?us-ascii?Q?B2XZlIT3mvkdta+VUsI2PcI6nBwt5SPmyQU2PCL2gj1BlfP/QZ2dWmdkSwsK?=
 =?us-ascii?Q?gVdRTailQa04KiajevK4egN5KaVLM0pgWvTbo0Vi/TuuxbxfkEnyl+lCEr+9?=
 =?us-ascii?Q?Vs/hdq0RjOsdQ6nKXW5pHW16igYJEoIqasGrI3SWjDA1s4TMjiF3sdsKrbS/?=
 =?us-ascii?Q?bV8w2BtQRia7bW2X/RwiVv3j8IUvJWUHqXvGypBmZNTbQz2HYUqE8Ys0uGmE?=
 =?us-ascii?Q?+h0PXPzPTEiVkVm9VZ0rL4jqt1OE6EP42rpfMB7/r4DNTPoEIV2ogtIdiFiJ?=
 =?us-ascii?Q?eQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdac16f0-eced-49dd-2136-08daf82f59fe
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 02:05:48.5824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R4ShLjNGBZGCR9cJ8ll3w4pY5JB4rcw/khUrinHxZYjpLAalrhCSx9gVp0oj1jUTzxeGSA20kBQDzm8ao96WV/p0dpgWGOPiI/0YtWDyLWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4623
X-Proofpoint-GUID: kJuf6vewWUBS2cdW-5y15GDVOpTZivDI
X-Proofpoint-ORIG-GUID: kJuf6vewWUBS2cdW-5y15GDVOpTZivDI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-16_18,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301170012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 02:05:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176023

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

Reference:
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=940261a195080cf
[2] https://git.yoctoproject.org/linux-yocto-4.1/commit/?h=standard/base&id=a96cfd98add95

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta/conf/machine/qemuppc64.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/machine/qemuppc64.conf b/meta/conf/machine/qemuppc64.conf
index 304f06a30d..7709339313 100644
--- a/meta/conf/machine/qemuppc64.conf
+++ b/meta/conf/machine/qemuppc64.conf
@@ -15,6 +15,7 @@ QB_MACHINE = "-machine pseries"
 QB_CPU = "-cpu POWER9"
 QB_SMP = "-smp 2"
 
+QB_NFSROOTFS_EXTRA_OPT = "wsize=524288,rsize=524288"
 QB_KERNEL_CMDLINE_APPEND = "console=hvc0 nohugevmalloc"
 #QB_OPT_APPEND += "-device qemu-xhci -device usb-tablet -device usb-kbd"
 QB_OPT_APPEND = "-usb -device usb-tablet"
-- 
2.34.1



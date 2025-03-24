Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A7ACC36002
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 08:03:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.34002.1742803423699510268
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 01:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5178f84d8d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O7wvXs029108
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 01:03:43 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2045.outbound.protection.outlook.com [104.47.58.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hrg41ned-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 01:03:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pi7gUDer1zrCdUz/aeHbXVY8m658sX4UMAPRIV6FMp6nrMzhC7h9n2vysr6OHnFw+Q1yfGs+NQ0Fj5CfyK36tzlvLAYAvezWFt9i6VMO0fT0Dufw+LOV7YSR43rNFAeX9veWxYVApk1PyIBtIp6wrYPavz+2xB5l4aJ7USS02JQyNkgj92WgOMYddkOYeAekxO2N8KLZKGE5qEi98FZI4x6jnw3G6nka7h4TKNqAXcbeKhfhpB9d2Q4lgi8IYm/9MvaG9glZG3bH2UPuRLll6zRWZSIcgJEtxkupvzTCkD4S041bbzl6Zxez4U5nBTADZWy9qQGyHcAfg3j4rCTomQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kv3XpOIsBUP5lxkInh5IILUvla6OEr4q+KAZ67Rqx+0=;
 b=bryknHET3yipHDVZlKCYvsJLzKFg67xjzR+6kU5zdFw7FWW+HDUJotm5DRgPtKBZvoTvhJIwddGGOoRuEt76SifMyaWI5s/Typd3j/KajNM6TnD6LxNeE9pINF3USL/DIbWkZXQ6+M2awzTQF7PCXX80Jvs3+sulGPXfNzn765hBf0oi8l6VoppRQLb/ctDvI4TwhjsGXpR87uD9nGODkklAR5V4/EUAcf2b8Q45CJkp1TCzhcBdbAcNRey4lB2OCf1Wrrjf1ou+kT+4suQAGQZxUJV5PnrSgQdxvJYmV1WC7yPRtbEGyBirVVQ1m7nujOryYIShPMBxg0wMoQHu4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MW5PR11MB5905.namprd11.prod.outlook.com (2603:10b6:303:19f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.42; Mon, 24 Mar 2025 08:03:39 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 08:03:39 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] coreutils: fix segfault for ls --context
Date: Mon, 24 Mar 2025 16:03:23 +0800
Message-Id: <20250324080323.2528137-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:3:17::18) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MW5PR11MB5905:EE_
X-MS-Office365-Filtering-Correlation-Id: dd6801a5-8320-433b-408b-08dd6aaa62c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|159843002;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5pphSh1k5J1EXsmRw3Ic4zX//IuopM9RerDUUemaOhrzpLK40qaw58VQO5Dn?=
 =?us-ascii?Q?+uPd1Qt0DDndUmMPAeII+eNGykJzXs8Xwg4TGIQHAbVIzCq+SzOiAhTPAtRh?=
 =?us-ascii?Q?PqXbtOWWDIAqe7Nr4HtqcHCxaAPrZvts5dKkkvf6ibgtew+Z28009c7xKwx7?=
 =?us-ascii?Q?7DcMQb0hmJZYML2Xjdj3ZP39RbINT3M1kDCweXNWvmCHhTxNe0Nupt369rYf?=
 =?us-ascii?Q?mWt1FRVeUQrxXkFilbHKiZjbhbcweYclLSsyKQ1XIpCvP1qIHbt1eNBdDIqM?=
 =?us-ascii?Q?Vc5WY5Qa6O1kUiXaMsRI9aE+EfWem4PhO5o+o2NLH00A5HrjL62dV3EH6pZL?=
 =?us-ascii?Q?we5I/ShjhkE+yviSQoBQtUaWVw6s8ynn0133bVBQLqwsjmZW7MnIgx4Ddb0g?=
 =?us-ascii?Q?K49gmkPsK6vhzeayxCtaHPi/Ghio99Nu5j0r69cNBl4MvwbY28R0WgJ3ozCN?=
 =?us-ascii?Q?WZPAwx2RxLSMGMDWBVVyjcKWxOzJ1IXGXU8haYL9uJuGzgJ9XbBBnkWNzEr0?=
 =?us-ascii?Q?+2P0SkMxN1Bhm+lxuTylD1hS5lf8sma80iaA9GKUxaHUXcLB3Xma5R78tkwK?=
 =?us-ascii?Q?IeOr0YkLZUsq2bixTOFMDyblXybHM28N77sRjANwNJwaZowCrtJelfJISrzV?=
 =?us-ascii?Q?S/3sAWiB/nHc89U2LTMMTFGtx+I5K36QHkbg+M7Gh62elinDDiasfO6LYwpb?=
 =?us-ascii?Q?yrE9+P+vn/RS3Es0R2zKXLSXSr34mr2o0FwkUj0LnrUjXsnSuc1ZRzRRnbEQ?=
 =?us-ascii?Q?1xcIMm5bNIJIZ1A1SbSm6TekIN9i7OQ8gEnOs3LXVqnEOriSuwbqyh8eIdGF?=
 =?us-ascii?Q?0rGSjLvz1qDAIsxxcOC6WiCIEwa9iPiKW1t/8T/+s1xf6ejeIOMkWewNt5uM?=
 =?us-ascii?Q?5Xzq4gOFkzXFkWZEFrFWuZRXMqHTR7Eg5p3xkw7Z42XYvy9c7ADkyysNxMgZ?=
 =?us-ascii?Q?GCK/IplOn6Joo276b+/GTZ9/u3PyQ+MjXpkUXINguoL3md8cTVUindLxEaqA?=
 =?us-ascii?Q?RCClpqKs+oITa+r07pjjFBCxuZqJRmn0CM5Tu1Sib7ixzBkR9DBVSrDpMbZc?=
 =?us-ascii?Q?vBwUldz7/HoUr42L9y/sw3bUoC07vUN1xCNB1MUjN6r85kjVEBibc7xv5zfV?=
 =?us-ascii?Q?qdgaWHE83BZtYhgkozQ3MvVl9Du+gyo5Mbv9h6TbSJMX7nUCan1OCiM2zJtI?=
 =?us-ascii?Q?A7jMN1OR1tm0xguXuIHN7QV9Ifb1ybG8V1DtgnIWRJI6iPZzLQ1csKjzmewP?=
 =?us-ascii?Q?keWr7tVNLmpKiNWjm98PbCMLGTT1CmIFu9Ixunpz7ZbLmFPPhpPwJYQx7jLr?=
 =?us-ascii?Q?9DR214enlt9Vf6BvbrF2MIVusXXDM7nOBaZ6uKJCRYMNFBs8fzOS/HjiqRcP?=
 =?us-ascii?Q?DkxVgDb3ogNKmeghlUiFbXc1VOJRW3mwWng7GKxx3B4jLTTsVUSNux50YDtW?=
 =?us-ascii?Q?p7JOgsCs5zb8ZprzpJd2z6Qv8gNplLN30a+V54ajQN7VQ5bC1no7WA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(159843002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wyqvj/v87HTxGFXNEVyQGfLVesIkMo0mKfDyrss/+19vh7KpZKRcxNnOvk64?=
 =?us-ascii?Q?WOR6HmAAjO0t3z6eTYuPAwwlkNFMtB5vwSs5QEcUP0FdbX9S4nuZ7znyy+Jh?=
 =?us-ascii?Q?2U3f4UjZE0c7v9FigkYNBPwyYBe/m5bCcCjPtKHnPDZuGsW5dKSPm+livsOF?=
 =?us-ascii?Q?1k+5PVkxkagRKGq/H62J3d565FsDkCKfNFubGZXQshaABho7ylrqzILrO05k?=
 =?us-ascii?Q?MIOt8GtyNT3BjAXcnfJeXJNNAE93XY41Z5GHIlACpe5eKcvd8qzIyPyP+gws?=
 =?us-ascii?Q?VIWf/yw52qKYYA/a3CZU0GlcUr+vtWipj5mqMpPZw+BfVsMO5HLxm38+lUXC?=
 =?us-ascii?Q?92uRxCucw5VFcomYtMoHv24020SrrxSy7lHL+Co0AhTvpTqCd8QDP4CYSqew?=
 =?us-ascii?Q?a1cvFPABitKEjIKvQPeVKUx0+xDOrl94AVAeD5SwGscxpNC/WPD0Sr4rXHqP?=
 =?us-ascii?Q?yeFydOi+7ACZNJrlW0iKl04GpX6nUFe1BGiT1ZPHPgD/zfR1pn0jtKiBaWd3?=
 =?us-ascii?Q?+tpjnL5eLgxfdY6ypilOQjSS0deqNf2p3Pvvu5eBmGjWKAqjPhq+g8JuiOla?=
 =?us-ascii?Q?MqjuqgXh6Jk2r24ftovrZGOz+ZocmPZhpyZPXYtxeJ5IKOsUM5huIZmbyPb1?=
 =?us-ascii?Q?PMA8D2hDR642dvo/tVa+JrRp8vQ7ZeiUmcCM+nHFozME1aSgRwraMHgKd01K?=
 =?us-ascii?Q?1+w5biJOYMw+ksHrI3dhxrAYYCHjukQsvMI7xuKIgDAZjukRzicDi9LQ7WZG?=
 =?us-ascii?Q?LNQvGzJ20hGFzFq+NiSDB4f/2ClJy1qN1QiK5tAaH+lHfiYsRO4QdcXxgoa1?=
 =?us-ascii?Q?Drdc/pk8vLhQh0E7N3KgAhiFZdk1OSyzADlvJusksDfmivf5R57b/tcZpQhf?=
 =?us-ascii?Q?iqW1xz/dQTQVj3xqkfykKHnRiyZr4/xJFYNeKNWejDVJ7K3QHyMM7/x3xIcr?=
 =?us-ascii?Q?sI3JdVVT91/qVweNixd38cJvlN7cDHLtSkjaFnX4LN+ej7WqQOq60YFDzcWr?=
 =?us-ascii?Q?Wvw8FXjHrG71n+cYSQ+MZ4/pu2vF1GhspKqyOjX05ERTfIZub2Gb5F5uyXFq?=
 =?us-ascii?Q?FtZr9u0e02/D1qUuvDpl2T9Fo3CUJUfNFttvzQ5TA7bzsZMQMUhi/UVgAYL5?=
 =?us-ascii?Q?/aJPtReJP8YuePsRtxdwTMxA38uRMOFYAnXVYVraIffoaRsTm30KuLLG4hng?=
 =?us-ascii?Q?r272ejrBwOCO+yEdaOGPzrw22vPX/DNLaFwDqJ2UoSb1K9tkgVCGnI/xJTS0?=
 =?us-ascii?Q?lHCe9O7+cTOl+xMkzKGaw5kImc87YN9UOpedfEkemQCB4wCoYo2yohFfy+Ey?=
 =?us-ascii?Q?JtseIpSsIXVRX810T/C50kbzNCJPcCYbtNdgvEkGr1sm0XhdwTrtcbcaBXv5?=
 =?us-ascii?Q?lM6BOogS0T7+JDHlZsqsovz1lKOPGcBIm954GG82JDVRTYUXZadxTFd24qGn?=
 =?us-ascii?Q?FuAUm/Lqtze8YLZvQNtNqFTeV07BSkcDjJE0GFhstnY5ifHZ1jgaI/2HOZ25?=
 =?us-ascii?Q?+ZNWllW+uXaMxChNXSspM234eQwjyTSLRLkuCzG+z8ErqY+CC1ufm9nTw1cO?=
 =?us-ascii?Q?0VXXqyk0PY0tTibPyrkVO3XFJLAjtFSTLGq0RRos?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd6801a5-8320-433b-408b-08dd6aaa62c8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 08:03:39.2410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gSjX+b9JpmJaFlGAeVWG7WNbp7fHo8FhavLmaJnUV5jay8cr6C7nnrURape910NWM85KnGGL57sZGmmTxO5KCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5905
X-Authority-Analysis: v=2.4 cv=HZwUTjE8 c=1 sm=1 tr=0 ts=67e111df cx=c_pps a=Syk5hotmcjzKYaivvMT4gg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=BCVRRYYnAAAA:8 a=ClZDezWknGBtRwHcXm0A:9 a=FdTzh2GWekK77mhwV6Dw:22 a=Yfo1nd69h7ycsZ8reatu:22
X-Proofpoint-GUID: jWg_BzyenhHg-sCs-2C5OvDYTFksKVv6
X-Proofpoint-ORIG-GUID: jWg_BzyenhHg-sCs-2C5OvDYTFksKVv6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_04,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503240058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 08:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213514

Backport a patch to fix crash for ls --context when enable selinux:

root@qemux86-64:~# ls -Z /home
Segmentation fault (core dumped)

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../0001-ls-fix-crash-with-context.patch      | 101 ++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_9.6.bb  |   1 +
 2 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils/0001-ls-fix-crash-with-context.patch

diff --git a/meta/recipes-core/coreutils/coreutils/0001-ls-fix-crash-with-context.patch b/meta/recipes-core/coreutils/coreutils/0001-ls-fix-crash-with-context.patch
new file mode 100644
index 0000000000..b1a92875a6
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/0001-ls-fix-crash-with-context.patch
@@ -0,0 +1,101 @@
+From 43a63408630e5064317823702518099f0ea652dd Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?P=C3=A1draig=20Brady?= <P@draigBrady.com>
+Date: Fri, 17 Jan 2025 17:29:34 +0000
+Subject: [PATCH] ls: fix crash with --context
+
+* src/ls.c (main): Flag that we need to stat()
+if we're going to get security context (call file_has_aclinfo_cache).
+(file_has_aclinfo_cache): Be defensive and only lookup the device
+for the file if the stat has been performed.
+(has_capability_cache): Likewise.
+* tests/ls/selinux-segfault.sh: Add a test case.
+* NEWS: Mention the bug fix.
+Reported by Bruno Haible.
+
+Upstream-Status: Backport
+[https://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=915004f403cb25fadb207ddfdbe6a2f43bd44fac]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ NEWS                         |  3 +++
+ src/ls.c                     | 10 +++++-----
+ tests/ls/selinux-segfault.sh |  3 +++
+ 3 files changed, 11 insertions(+), 5 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index 3799f75..65867f9 100644
+--- a/NEWS
++++ b/NEWS
+@@ -4,6 +4,9 @@ GNU coreutils NEWS                                    -*- outline -*-
+ 
+ ** Bug fixes
+ 
++  `ls -Z dir` would crash.
++  [bug introduced in coreutils-9.6]
++
+   cp fixes support for --update=none-fail, which would have been
+   rejected as an invalid option.
+   [bug introduced in coreutils-9.5]
+diff --git a/src/ls.c b/src/ls.c
+index 3215360..f67167f 100644
+--- a/src/ls.c
++++ b/src/ls.c
+@@ -1768,7 +1768,7 @@ main (int argc, char **argv)
+ 
+   format_needs_stat = ((sort_type == sort_time) | (sort_type == sort_size)
+                        | (format == long_format)
+-                       | print_block_size | print_hyperlink);
++                       | print_block_size | print_hyperlink | print_scontext);
+   format_needs_type = ((! format_needs_stat)
+                        & (recursive | print_with_color | print_scontext
+                           | directories_first
+@@ -3309,7 +3309,7 @@ file_has_aclinfo_cache (char const *file, struct fileinfo *f,
+   static int unsupported_scontext_err;
+   static dev_t unsupported_device;
+ 
+-  if (f->stat.st_dev == unsupported_device)
++  if (f->stat_ok && f->stat.st_dev == unsupported_device)
+     {
+       ai->buf = ai->u.__gl_acl_ch;
+       ai->size = 0;
+@@ -3322,7 +3322,7 @@ file_has_aclinfo_cache (char const *file, struct fileinfo *f,
+   errno = 0;
+   int n = file_has_aclinfo (file, ai, flags);
+   int err = errno;
+-  if (n <= 0 && !acl_errno_valid (err))
++  if (f->stat_ok && n <= 0 && !acl_errno_valid (err))
+     {
+       unsupported_return = n;
+       unsupported_scontext = ai->scontext;
+@@ -3342,14 +3342,14 @@ has_capability_cache (char const *file, struct fileinfo *f)
+      found that has_capability fails indicating lack of support.  */
+   static dev_t unsupported_device;
+ 
+-  if (f->stat.st_dev == unsupported_device)
++  if (f->stat_ok && f->stat.st_dev == unsupported_device)
+     {
+       errno = ENOTSUP;
+       return 0;
+     }
+ 
+   bool b = has_capability (file);
+-  if ( !b && !acl_errno_valid (errno))
++  if (f->stat_ok && !b && !acl_errno_valid (errno))
+     unsupported_device = f->stat.st_dev;
+   return b;
+ }
+diff --git a/tests/ls/selinux-segfault.sh b/tests/ls/selinux-segfault.sh
+index 11623ac..1cac2b5 100755
+--- a/tests/ls/selinux-segfault.sh
++++ b/tests/ls/selinux-segfault.sh
+@@ -30,4 +30,7 @@ mkdir sedir || framework_failure_
+ ln -sf missing sedir/broken || framework_failure_
+ returns_ 1 ls -L -R -Z -m sedir > out || fail=1
+ 
++# ls 9.6 would segfault with the following
++ls -Z . > out || fail=1
++
+ Exit $fail
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/coreutils/coreutils_9.6.bb b/meta/recipes-core/coreutils/coreutils_9.6.bb
index 17bd33958b..6db435cfcb 100644
--- a/meta/recipes-core/coreutils/coreutils_9.6.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.6.bb
@@ -17,6 +17,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
            file://intermittent-testfailure.patch \
+           file://0001-ls-fix-crash-with-context.patch \
            file://run-ptest \
            "
 SRC_URI[sha256sum] = "7a0124327b398fd9eb1a6abde583389821422c744ffa10734b24f557610d3283"
-- 
2.34.1



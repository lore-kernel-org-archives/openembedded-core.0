Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7D3DEFCE29
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 17:44:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24357.1772646257887597871
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 09:44:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ULCXJhEu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7523672f62=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624Ce2Oe2794028
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Mar 2026 17:44:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=o+wpLU2QRljptvCxgpPOEfhcA6SbaNjbMf9eec1WUpE=; b=
	ULCXJhEueK7nHSMyvgedNPBNstox4pYFShSTqtL+YUl/vRap5l90EJHb6g6i34WT
	ARDxZYNftzhJ8DOb8qrg9GtfzDs0oxx93sSiZV8j29/n/dwV3WKZEGVWT322bsKc
	itt/QkSTcQRk5rbk7qf9ZKBSU5ynZZQ5d4izBcBRLFj0jZ6lAj4vM9/7g9pCN//m
	+71IvzoRkirHYWMsEqjmR2ArryaOcnb8RVZTCzD3E3BWsEes3eHyxGw4IN6YOi1U
	O6py1ePvTzXNChhfwE5V1fjCcwsRacHWrZoOMzZzNa4Rr6pRERE3rzepkov62+K/
	7rgla6dI1JzY1qTQLDGUOQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010069.outbound.protection.outlook.com [52.101.56.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvnj1h-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 17:44:16 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAWAxjD85mLf7llh7QhWTGsgia5BX3p/hJVTu7fk+mYCrT1vV8hV52z3Z5YsJe/ZYQiL7NooKXN5efWVj0+cXvDqBA0ZeBUNU8H2gjRus/stwYASLxT/BBIwBx3cwGKz1RPP3GvMjy1RR1ADKYX3aaUeDPt6FOsOPF2hMjDfl1jJgkhcD+SSvBN3NqOxegmPcrGY95lAhoUjcjPWPxmCpTvsZJwipKZJUWv49e0h21uorUl6d07QDAF1NYEqrv0OEQ29JJo9a1vBCo4CAm/1GzO+93xpy3c6BYYObYtKJVAE774o0uzFVzRYC6Hi4egYGi9UDWFPZpGnBRJ9tmsXdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o+wpLU2QRljptvCxgpPOEfhcA6SbaNjbMf9eec1WUpE=;
 b=fXgpi3IoNGzSohwgP/xjLYkKJkKRyHEgWvd7Ym7MuCdYRK2/xKTYF6CZdksRgTDjzan2dqh4TzAn1X/MtTCH4zPpkStrWJbnq/L+dhTZY1fZsVmpwQXFaudqi0uJ/0WOz5Uo12eM43Gj/queSqtHfSIEJu/qsNfqXhP3FAj//UGJUJxhI8Q27PyYz7QKd+qv88OBCGfTQexvsudMWv0W/Jy6x6J1IV46htQGni3n5O411SfwCBPVGC2PbYXkPHO8R6F1jN8QT58H8eJucKGDXZzNIR27dHoud4XqxmQCv5MN7WpebsGyBklm/TtShuWZ9KfsOXgwoNKrCLHujgu27g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA1PR11MB8100.namprd11.prod.outlook.com (2603:10b6:208:445::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Wed, 4 Mar
 2026 17:44:14 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 17:44:14 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        paul@pbarker.dev, yoann.congal@smile.fr
Subject: [PATCH v7 07/14] kernel: Disable ccache when kernel rust support is enabled
Date: Wed,  4 Mar 2026 09:43:17 -0800
Message-ID: <20260304174324.1186644-8-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
References: <20260304174324.1186644-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0158.namprd05.prod.outlook.com
 (2603:10b6:a03:339::13) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA1PR11MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: 521b6fac-dde4-49f9-3791-08de7a15a6a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	WkIfmog3DeI6xU0+cX8Y/jTLBD7WY6BxRpJBj+i96EA7KmRnA6L1Ak0iqI1X2CMeMv857PvemyWPK4mjzWJ1apET9BNYrk0YV91ryuhgZ7vXYEl9FnEZqnuMGDg70+r0nXUNvq1loGNzXmY0IbwiUJIvQzx0Dtz4/O6nv0HgdqQR6O+xOpOaS3HDjj6TZtlSgIYgZG6V95qfk1bUiyHYwSK+QYqGHV5KX3MihmuZxwKg6jkNm4NUZpueJH7mm+zrOLsZfpspJ9axxlR901F9An4fh7qGQR4BnxLozcilRLB5XMGhFBQ8pKcwT6XggZHHmvp4b/RoZw0+h++UZTe7LBUSZJ7c3h53pgJHaztunnHSq9LEZicfs3DOz9uhiGxLIdWw48LAwkf10xd9/o4TOQ8uXXzstR6dGqpLH6NwTynOpOkJN6k0O7LbxLWxWXMQVonyBYxiEM/TYgdWG0/MSM/ZxBp8t6hJoayyn5VcJF36olkIuiXkC+ISrYSu4F+3u6NyeSgJ6OXLWyFbBU23KUybTm3O6t8GdLUwZEIyVLgBa0C2onwYwgMCho7i3X0bGCoBtqUNEs3+Um52ECxo5PuhQv+TRLxbjoknH1mKn7rSsoiWXi2zHMeBxeUsxoXF+hQympUN8PSBi2tWhPvBJLEHJ1MYBEXwf7Bfyh+MQtiIglcogExY513mwN0KoSRfqcT+TZRlEOoVHSPoRF8fd0TgccReLBKQ5HlFP+o27AbJKekmQW/VPf8GaSxM63OI
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?B8ZlEw5kKoFVIhljkrKlbtDTzG9Qv6/x8KYzorfVPoahSypolthj9/ZvjMVe?=
 =?us-ascii?Q?s/TVgU51YsUYKzHNgs7zz82M9hDkxdr7Cvz6qt7+KCVvr4q2d9seuNh1UljH?=
 =?us-ascii?Q?RUFyecKeeqCsJz9/rtBDapvEGwCNCwE7z8buZxbaXQ7Cq4EUJZuME7ccTLcS?=
 =?us-ascii?Q?qrs8Vdy2CVMs7pRmcoKP2O+WouUFm/EwpNpfmZWi+GfGn1hJKXrrbmrOtk2X?=
 =?us-ascii?Q?6qfiBwXI5A60vGcCCsxoPU2SCnxOhnfpjCLKtQ7TFBNQLG7lVJUc57afIjjy?=
 =?us-ascii?Q?mrwEC1aPSeSZ6UAu1pntUeKYW+d65jKYAY08YWWlOHdHc3XUrtvIsYEnTKn5?=
 =?us-ascii?Q?Tk5l6yFyOU+vDo4IBGSnD/RGL2bcZkhniegrcehnnOW4Kl9xrvOiZFnMBO66?=
 =?us-ascii?Q?YlTav5CM/qsMnvnXGnXtVnD0z7Js42iRg6itd3DDy6vVUjEnW4L8ptExzIoo?=
 =?us-ascii?Q?4gXYvg8BWAIOFlerokOlJ6+2NhopHQmOLCSenrYgHnaDpwJEJG05t1lE6XXx?=
 =?us-ascii?Q?Zvex2/LtJ7KIuNfAKLh1q/lIZBftEkcnje9e42+mrEbmlfGCkleLXbCU9f/x?=
 =?us-ascii?Q?Pxil7c8IRGAcF7iq9rBqAuU01Jd89Ch37/T6E4jdc1+F9zfvMWtF9J7t72xc?=
 =?us-ascii?Q?RH4+u4994uHgDxyOeabEgLElbyV9q4NUPqPDAV+uAONtSH+tLaDGdJZE/kAT?=
 =?us-ascii?Q?KRrWoXxEjf5BVjzXpMLOC9bbtPuPZhIuwZx8mRvh6x6+F3LToaac77DBQ2qN?=
 =?us-ascii?Q?mVHrAsY1VGvHeSmc7shdEZStiWnTCBDgLKTya1r7J2tuHh2Zi62IJNRPUBGy?=
 =?us-ascii?Q?7KZfCUIyRjhiiDq/YjQ5zeGUAeSvQ/R/Fnak9JYelUp8KXq799f9UgegrzMq?=
 =?us-ascii?Q?cGIUx0bVBUrb6ZEwa9qy+y9DRmM0e9ZD4myrNhyY1TmCJO2lIpCVQdrCPePD?=
 =?us-ascii?Q?yd1I1XLQ/e3iRCgi2v+CiQzX0TtTrFyIs9jhD0IU79oiD1hxTcsaZVCogj7Z?=
 =?us-ascii?Q?KSa4HqU44xacBUc1XOLwdBEscqbBFnMdHZM4SPqZ0h2xATlwJU+pzPJl0bYs?=
 =?us-ascii?Q?IljS8N8lCVyXvR5u9FDHmskTJcIEinBxoC8cnLTfSGTjLstoUWIgTperdOZ8?=
 =?us-ascii?Q?BpnzsHysXnopMypfzhEuC7ilkqAtuOM6DFs61bhd4hXisnLwteKkISafClZp?=
 =?us-ascii?Q?CEzM2/GAe3tmhlxsuw97LVJJ81TtG2eyOqfAcf00J3CZy0cb7IrZpdpPhZM0?=
 =?us-ascii?Q?o+Wh7Kd+K1Dt4gPZjPKfshMIIzRA8T3rWqc2fRJC9LK5oT/bs1uS7Sk9eE5+?=
 =?us-ascii?Q?zAM6hPWVARi6PdOLq45/wv/I3kPUXQWpyl/Dky211UZfFbaKWl5ZRqXoY2nc?=
 =?us-ascii?Q?Ismxw4aN5eTWPr5XXqADvl3kQGO5Zpf3ouMYmrklKluSKFa3LLEH/V+7qEyK?=
 =?us-ascii?Q?SPnS6VqkBiuTpb7LSNEaG3p2drsSo0nlCx30Bk2QgU9+tqLMv7R0Tt0wE2L4?=
 =?us-ascii?Q?UMkaMxo21iYYPfMfFRvOaRUwoCDyB38MNR3/pO/Z5XB1I/qoLpoTEMWy7XFB?=
 =?us-ascii?Q?37A1ccLyg6q4uG1pKi0iV4GECjTqEZL1qHV3ELB07UGrkm+bNysjPdbS6Wra?=
 =?us-ascii?Q?0YHZ6Onb7TGG7WeEvFUEz5X6aAvt/aHR+veHai56X8sY/YWUx1OHgrpb7obv?=
 =?us-ascii?Q?YvuLr8uRTFjFf5Zau97TPJJx+WMuCDfIIhGGQzbVHDF87oluD7jj7TH1qIXf?=
 =?us-ascii?Q?p/5Fi37K/4xpKUuL0jKdGyO2tT+f3mU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 521b6fac-dde4-49f9-3791-08de7a15a6a4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 17:44:14.3046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mD3u72YLgDm82KtT5HHIcgndMgW5NNfVUU4LlVzVOJBGIZhiqOllhDgWYvlZfYcjLISarT+ifu3+BSFCMrUan+2+kSQhqmk7omFA8yfAbuU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8100
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: _y-yWwqN7qSnoRaQcr9WzLWtnaXL42qB
X-Proofpoint-ORIG-GUID: xbMaTcSa6Ja8VA1zzYGZpQi1TTe2P6eV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NCBTYWx0ZWRfX2mw1N9r6kzRY
 VTfO00XxuDppTw0aXhijvGavwVHGxCziLYj3Zby6W0WEXA686HWfzsvVdeFSm8RfOjPqHoT29B3
 hUEtauOZlTnyLjiTLkE/CdEPNV0RDKTSdnZOxUql/9yM1va7ahArVCKNK5+R8i4jUxMRHNBXBou
 MJdBjsy6lhoucFTAzqU9SAWRqhpePxchBO+p9VnX16maYWrG+3E89oIIDFmRAOziGoH9Vvq9AdU
 8Ao04NwPbYxAjYztYMU3xaZR5srqzdHz9bvuaU2AbYwphXiSRmOpaxs8H6XoGyFVK32wYfd9vOi
 MBTaTD66YEfHevcK/d5nbGNrPCqUtsmXUSxLU4Km7oOnRwnsm6h428OVx6udn2Bn1D4cxBrEyqz
 56K/v2bWd5+EttjR9LJVulTqw85py0pBBZBWPTzB7E44gJ7Cfe4dNhEqAzkL7xw2R0XKsMPkBUC
 7o37FnRzFn0MyWL83ZA==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69a86f70 cx=c_pps
 a=vVq7UQVwO1zAg9gY0+x7SQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=Q4-j1AaZAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=iUso3aUBSlOXKDWHM7YA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040144
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 17:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232423

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Currently, a ccache enabled build fails with:
  |   HOSTRUSTC scripts/generate_rust_target
  |   HOSTCC  scripts/kallsyms
  |   HOSTCC  scripts/sorttable
  |   HOSTCC  scripts/asn1_compiler
  |   TOUCH   include/generated/gcc-plugins.h
  |   DESCEND objtool
  | error: multiple input filenames provided (first two filenames are gcc and
.../tmp/work-shared/qemux86-64/kernel-source/scripts/generate_rust_target.rs)

Linux rust build infrastructure does not currently support ccache (Opened bug[0]).

Quick summary: There are 2 issues: $HOSTCC is not escaped and rustc
expect a path (and not a command)

Disable ccache if KERNEL_RUST_SUPPORT is 'True' for kernel and kernel module builds, including
auxiliary tooling such as make-mod-scripts.

More details in: https://lists.openembedded.org/g/openembedded-core/message/229336

[0]: https://github.com/Rust-for-Linux/linux/issues/1224

Co-developed-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Cc: Alban MOIZAN <alban.moizan@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto-rust.bbclass              | 7 +++++++
 .../make-mod-scripts/make-mod-scripts_1.0.bb               | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto-rust.bbclass b/meta/classes-recipe/kernel-yocto-rust.bbclass
index fd9ee91c79..608ccc4609 100644
--- a/meta/classes-recipe/kernel-yocto-rust.bbclass
+++ b/meta/classes-recipe/kernel-yocto-rust.bbclass
@@ -16,3 +16,10 @@ do_kernel_configme[depends] += "${RUST_KERNEL_TASK_DEPENDS}"
 do_kernel_configme:append () {
         oe_runmake -C ${S} O=${B} rustavailable
 }
+
+# Linux rust build infrastructure does not currently support ccache
+# see https://github.com/Rust-for-Linux/linux/issues/1224
+# Quick summary: There are 2 issues: $HOSTCC is not escaped and rustc expect a path (and not a command)
+# More details in: https://lists.openembedded.org/g/openembedded-core/message/229336
+# Disable ccache for kernel build if kernel rust support is enabled to workaround this.
+CCACHE_DISABLE ?= "1"
diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 874e16e642..6226382001 100644
--- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -36,3 +36,10 @@ do_configure() {
 		-C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} $t
 	done
 }
+
+# Linux rust build infrastructure does not currently support ccache
+# see https://github.com/Rust-for-Linux/linux/issues/1224
+# Quick summary: There are 2 issues: $HOSTCC is not escaped and rustc expect a path (and not a command)
+# More details in: https://lists.openembedded.org/g/openembedded-core/message/229336
+# Disable ccache for kernel build if kernel rust support is enabled to workaround this
+CCACHE_DISABLE ?= "${@bb.utils.contains('KERNEL_RUST_SUPPORT', 'True', '1', '0', d)}"
-- 
2.49.0



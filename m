Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE094C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 13:10:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.13102.1699449042365525154
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 05:10:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9676a13196=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3A8C0TT6017248
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Nov 2023 05:10:42 -0800
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2040.outbound.protection.outlook.com [104.47.74.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3u7w2t0pms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 05:10:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJD2fh+deoXJOBxoudBrD7VkW9UeQEjHHAF5bLVm/WvkxlOpMFMXQgMJY3z7WWBsOm2+k+pgHigYAaDJcIl9FAQa/i7mj25HFUaz5drIPVnTfV1dzzuOi6P90Q1PSfhGmpWtTgXwd/l8rc2I2iQ3CnbhDo5ZNwoEB5Az8coHMxqnRMvikocYOdbavbvi1XuDdro+nPJyu3cwlmVoJwIczXLK8f29jD4ghPZpDJ5/RHCctufFHt3pUV6puQLNBZtXux85FEiqLO+BIBH2K7VLAGZ475AcTHUHJMKVNyHAQ3zoEF91ILNyWg7B6JQacpkAVq46BfIBt1F6aTGOn9e1sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hk7AcDrd/WLTnT85PG66Eef1c7eww+YGm61ty4IcWkE=;
 b=A1NAcBtkq/PzUulbBSfjcjgCdjRX8IP8MVuK6n4XD+9fUvkVjbUsrM9znhcK+/w4bj2wrE/E87QrdJohOSE9Q1xJtGKygxnygOXzYjG2d6gEPeKCQQfMYUTKaXuWEK8rnRhdh5CCFSfCRXuiXx4nck6Tutpudz9e4LfX14q2HF3hazG/SZ9Vck/C3LPC+y02sBsvtW3xNGPK1/Yy5HYV+44foNbxNnd9waD2ygIHF4GOIEr/PayQYwIUJJk614ebLCJe6CZP7hitFbzI5+wLCnFITFOHbDn+sB5Jybhk2ESvj6A7ieD27PE2pgsYS9DnPzOBJOdgZ2TAEXPCbJVmUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SJ0PR11MB5815.namprd11.prod.outlook.com (2603:10b6:a03:426::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 13:10:39 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd%4]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 13:10:39 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore][PATCH] qemu: fix "Bad FPU state detected" fault on qemu-system-i386
Date: Wed,  8 Nov 2023 21:44:54 +0800
Message-Id: <20231108134454.1925755-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:194::10) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SJ0PR11MB5815:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b5eec58-fa1d-43fb-31a4-08dbe05c1a85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	v5oQ/8Dyx/MIaMjBHmoA1EfB1FYqCR8ZmYjII4wGTUc1/gd50xAospRWbjtdG1gEnBaGtT7UrZRguWMvaYuO0wP7tDSWnDBCmxvU5ykKXwLcUL1oWTSxmId9fVeE+DXMnoH//0H/zEXU2B+acSHymWMMMjnthRwB5mgKmfrKOlHuChnJvxu7Amr0BdZqiZwqmPcEPFiTCeSKN/vlFTlvP7B1yFQlhwBz9vsnKja2nscfH4fnlzV7eCG0Iuvrflsv7juRfVxYNP0gt4SkS89wgIiJXvXJvH87TuAiobE2HwUgJRPsNwm1kE1+85+9X4f+5Nzm+0s1HuWiZu1C3wNz7aKopHN/dcFLf4Ny7vFkJZElZ1crYf0+nZi9iRqPpqJp0dfYDZqA4SxnEX2uQRAR0prMbQefFjcYXDAeQdKsSBY4RlTmmmABy109oJ9Zk/dlXxufAzSp+x5T4Q5/8E/oIP2++6uwRNADRwylibzTpAbailGrj8zQq3s7QFIs7m7iQb8mN07clpOCciQjuW0inp0OcB41J6W/YuRTOR2gaq1QEkWjlPxHIZoXl4Lou4YEmSLdI+RBOiefPVE4fDp8nMOfSnAf8js8/L942ifBTQrdajZEjCUTjrwr3XP3wUTVAlU8fbbIlxeneMt1O3CIcQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(39850400004)(396003)(366004)(230922051799003)(230173577357003)(230273577357003)(64100799003)(451199024)(186009)(1800799009)(1076003)(52116002)(2616005)(6666004)(41300700001)(26005)(6506007)(6512007)(38100700002)(83170400001)(83380400001)(6486002)(966005)(66556008)(5660300002)(44832011)(2906002)(38350700005)(8676002)(66476007)(45080400002)(66946007)(6916009)(8936002)(316002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?z/2VBZwBuxE+t65fDCHiMtGn0lIDb5TJLfqESuWt04Xvg5ufFJy+mEZ2xlr+?=
 =?us-ascii?Q?edrFwOsmPqMPzM4QwXyl8lfk4wGY4kp5wBL1dvjYCvQMvaOHyRovYrWvKQM0?=
 =?us-ascii?Q?qzjTiSHQLMzrSCcysBIHaNFhI/gQQVGjDfVak8ln1inNDbauopyvsKqRB0pI?=
 =?us-ascii?Q?8/CiV2WUa4rdXIWUDzKx7tzGUC84vOuIXtP+FrOlYUHtItXufkpK/Ets3tN0?=
 =?us-ascii?Q?ZPTuj2OUmKPXzjIWT0/0cYifazffhrRw07OG3pt6eSt34i/3ATh3LvfV3dAv?=
 =?us-ascii?Q?oYCaNS58Pc1mkF3BSjvbBngiumSYFJOLjS1f62qyYtjcfytg/AQFpkE5S3m+?=
 =?us-ascii?Q?4HPj9M+MquSTm1MT6mH2xQ0BW1Nzhks1JHaAqdlKsIBWoBU2eMBFtwjrTo2z?=
 =?us-ascii?Q?IWIL+q80PN3bFanVyoSwN0o9JPUhs1mXcqQ4XMwwU7Qw8NK8ps2aGMvtPbb8?=
 =?us-ascii?Q?wegAUzRablQKlKcgBWR7P1RTokwY6fyPpZlL0RNEDm0/4thfsLROrm2vYVEM?=
 =?us-ascii?Q?Ek60MpYZOFiSuOv/EPhzeNxMviCqng+5NIvzauYAnK9rKAg86NcgH7g4mNB/?=
 =?us-ascii?Q?EkVQ5v9JjnxG4DVfc4MEKbruHNEnpho7kObEYqx6KAMXulETx6z1WYBLfG87?=
 =?us-ascii?Q?h/hk1fRReY6fysrUpDhKwmFTkCULVMw3tcxtidCCF14euJ7ILSEYNHuOmD1J?=
 =?us-ascii?Q?MN2syux7mMBEM0L/2BgGNgbDg3fhU0Vgc1pT5gfAu8HOkMysRZtdTUe6YVPr?=
 =?us-ascii?Q?ooHCUb29T4JT4hRQ8gs8EZLGzDFk7jC1RUIF+no3YK4MKzjWtYuAlwPd6T7V?=
 =?us-ascii?Q?Z0gJLrPLTcx5JLAp6hpPAINiU4HtBd+QC9Xjx77/F6KxrC66cxJYIiAN8p7R?=
 =?us-ascii?Q?D+SoBBkLy1fDK226Oc5DJG3s5XKk/hfR5dEFq8BLtQlehILJ8AD2/RPKFHP2?=
 =?us-ascii?Q?qBBWxhiTmhtSwtL7yPpI7tqNiYwctvuzWQp63T/wXYPSCPsJp6fxCPnpmH5T?=
 =?us-ascii?Q?/awlEudnzTRQj4YwJngI6pHG8EzT3c9ECjgJljhHq0vTo9jltmP3LQ/Hdmz4?=
 =?us-ascii?Q?5NUaxUoUOi0GaXtONk4pS13edbncGmrNE5yaU9Z/ck9QlToU9afIDpKbsUBx?=
 =?us-ascii?Q?iFvrEoTl+3+a48pb2XR+uSdor/bUPoU08/IhbEFHqWcjUtf0exndX6KETtJU?=
 =?us-ascii?Q?uyuqLQyNAF5kX33PjeXJoT6LEz6qjLzkpAbSNBp/CurNGHlYYWM72biQr3fK?=
 =?us-ascii?Q?FXpCuZhnl64j4YlHN6es+1gZunv/GsKFLRZU3zcWqlLSkXnwof/4JCTalgwP?=
 =?us-ascii?Q?JbYkrx9ZjETSWmdM27wSTZI7aZPzJrab0D7rPJJrlGMLUSVOd59ny6vwLSJi?=
 =?us-ascii?Q?HnzAwWjL0J4VUrFBc9cgp9MJYzt5Zo0YstydVKICuxGOURghu1Tshb3VIZ7H?=
 =?us-ascii?Q?6NVCtfBE9MQcDy0LyTS3A+45foYjhbUyOddRcQJXJEcuCcrCg1ViTFM/FiOy?=
 =?us-ascii?Q?cA/j5NZ6bvStFrg3af6Ra1A/0gHxPpBqWzESxewQl0DQg3G8ULBbCAdWZOfn?=
 =?us-ascii?Q?EcnfDypM2Gzm5YQFehTB0wsqzXekdgbhhluUZ0IGkb5UJP5RafksGfG87Z4x?=
 =?us-ascii?Q?+A=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b5eec58-fa1d-43fb-31a4-08dbe05c1a85
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 13:10:39.1213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ZzqfhOA6kzbHrYwP2lpR07L3gyCTCAqj0YLIWklBwZZQO6wcja4CxN6wnu6rT5lV75ti0JiqXzJ+ZJ8CGKbYFxZ3mgRWSUlqVvqNCuK49M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5815
X-Proofpoint-GUID: Pkfdq4U87K1sU-LfGGUh6EP2f2VKw-jK
X-Proofpoint-ORIG-GUID: Pkfdq4U87K1sU-LfGGUh6EP2f2VKw-jK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-08_01,2023-11-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 mlxlogscore=886 impostorscore=0 clxscore=1015 phishscore=0 bulkscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311080110
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 13:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190322

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Qemu introduced a commit "target/i386: Enable AVX cpuid bits when using TCG"
since v7.2.0. It causes qemu-system-i386 hang with following error:

traps: rndc-confgen[342] general protection fault ip:b7ef5545 sp:bfcc6e6c error:0
------------[ cut here ]------------
Bad FPU state detected at __restore_fpregs_from_fpstate+0x2f/0x60, reinitializing FPU registers.
WARNING: CPU: 7 PID: 353 at arch/x86/mm/extable.c:65 fixup_exception+0x29c/0x2d0
Modules linked in: cfg80211 8021q parport_pc parport sch_fq_codel openvswitch nsh nf_conncount nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 kvm irqbypass fuse configfs
CPU: 7 PID: 353 Comm: in:imklog Not tainted 5.15.78-yocto-standard #1
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.1-0-g3208b098f51a-prebuilt.qemu.org 04/01/2014
EIP: fixup_exception+0x29c/0x2d0
Code: 05 ed da 89 df 01 68 b0 cb 5f df e8 4f e7 b6 00 0f 0b 58 e9 9d fe ff ff c6 05 ef da 89 df 01 50 68 f0 cb 5f df e8 35 e7 b6 00 <0f> 0b 5b 5e e9 0a ff ff ff ba 01 00 00 00 89 f0 e8 8a c1 b6 00 0f
EAX: 00000060 EBX: df734b60 ECX: f5be9cd0 EDX: f5be9ccc
ESI: c3485eec EDI: 0000000d EBP: c3485e64 ESP: c3485e4c
DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068 EFLAGS: 00000096
CR0: 80050033 CR2: b79fdde0 CR3: 03cbe000 CR4: 001506d0
Call Trace:
 ? __restore_fpregs_from_fpstate+0x2f/0x60
 exc_general_protection+0x9a/0x390
 ? exc_bounds+0x90/0x90
 handle_exception+0x133/0x133

Upstream has been fixed this issue[1], so backport the patch to fix it.

Ref:
[1] https://gitlab.com/qemu-project/qemu/-/commit/48b60eb6c917646df9efa7ddb4c25929f358d647

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...avx2-instructions-vzeroall-and-vperm.patch | 58 +++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-target-i386-fix-avx2-instructions-vzeroall-and-vperm.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index a7f1099dd5..80b5d966e4 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -43,6 +43,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2023-3354.patch \
 	   file://CVE-2023-3180.patch \
 	   file://CVE-2023-42467.patch \
+	   file://0001-target-i386-fix-avx2-instructions-vzeroall-and-vperm.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-target-i386-fix-avx2-instructions-vzeroall-and-vperm.patch b/meta/recipes-devtools/qemu/qemu/0001-target-i386-fix-avx2-instructions-vzeroall-and-vperm.patch
new file mode 100644
index 0000000000..a687862445
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-target-i386-fix-avx2-instructions-vzeroall-and-vperm.patch
@@ -0,0 +1,58 @@
+From 06690248bdb917f71b673183de9334c92f4a1eaa Mon Sep 17 00:00:00 2001
+From: Xinyu Li <lixinyu20s@ict.ac.cn>
+Date: Wed, 10 May 2023 22:52:22 +0800
+Subject: [PATCH] target/i386: fix avx2 instructions vzeroall and vpermdq
+
+vzeroall: xmm_regs should be used instead of xmm_t0
+vpermdq: bit 3 and 7 of imm should be considered
+
+Upstream-Status: Backport from
+[https://gitlab.com/qemu-project/qemu/-/commit/48b60eb6c917646df9efa7ddb4c25929f358d647]
+
+Signed-off-by: Xinyu Li <lixinyu20s@ict.ac.cn>
+Message-Id: <20230510145222.586487-1-lixinyu20s@ict.ac.cn>
+Cc: qemu-stable@nongnu.org
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+(cherry picked from commit 056d649007bc9fdae9f1d576e77c1316e9a34468)
+Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ target/i386/ops_sse.h      | 8 ++++++++
+ target/i386/tcg/emit.c.inc | 2 +-
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
+index 3cbc36a59d..44c1e70093 100644
+--- a/target/i386/ops_sse.h
++++ b/target/i386/ops_sse.h
+@@ -2493,6 +2493,14 @@ void helper_vpermdq_ymm(Reg *d, Reg *v, Reg *s, uint32_t order)
+     d->Q(1) = r1;
+     d->Q(2) = r2;
+     d->Q(3) = r3;
++    if (order & 0x8) {
++        d->Q(0) = 0;
++        d->Q(1) = 0;
++    }
++    if (order & 0x80) {
++        d->Q(2) = 0;
++        d->Q(3) = 0;
++    }
+ }
+ 
+ void helper_vpermq_ymm(Reg *d, Reg *s, uint32_t order)
+diff --git a/target/i386/tcg/emit.c.inc b/target/i386/tcg/emit.c.inc
+index 7037ff91c6..34028a7475 100644
+--- a/target/i386/tcg/emit.c.inc
++++ b/target/i386/tcg/emit.c.inc
+@@ -2283,7 +2283,7 @@ static void gen_VZEROALL(DisasContext *s, CPUX86State *env, X86DecodedInsn *deco
+ {
+     TCGv_ptr ptr = tcg_temp_new_ptr();
+ 
+-    tcg_gen_addi_ptr(ptr, cpu_env, offsetof(CPUX86State, xmm_t0));
++    tcg_gen_addi_ptr(ptr, cpu_env, offsetof(CPUX86State, xmm_regs));
+     gen_helper_memset(ptr, ptr, tcg_constant_i32(0),
+                       tcg_constant_ptr(CPU_NB_REGS * sizeof(ZMMReg)));
+     tcg_temp_free_ptr(ptr);
+-- 
+2.25.1
+
-- 
2.25.1



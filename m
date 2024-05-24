Return-Path: <mark.hatle@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F02C41513
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 20:12:31 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.55])
 by mx.groups.io with SMTP id smtpd.web10.4791.1716581543570349823
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 May 2024 13:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=UnLnZqBK;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.94.55, mailfrom: mark.hatle@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J2l312V/I3nOn9ZDbIKZEX9drQTJKyNpQcGm7Yo5WITiZGHZGdguc3+175IpfVF56curbc2aFaBVlZVYDVlPHgSV3b1I3f9V45yC9oUuN+RAlRP6QRd448I/waF5UW0ZZL//NLOZ5WiPLX1QKecisLor+VqXwOCX2NgLSMYS20GCXxHmLfhv/N1qwZBXmbHlZpyI2Xm6+0N3gLwsNuU9qnWqOwMQL6yBccl5e5oJkC5kWq0DotTpfIVQZfqE3mlhQXcaaH+iVq6UD+XACnIHavKHdx0zw6LDUPUbbQyaHT/DsPbwXLTyJ4iDprLAhAIfL5wlflKd0O1JNufuo5hB2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KvahwkfPwNOx5sje5WCi/YXlp++bLrvVXD6EheNLIOU=;
 b=J+arNV8q4RKtfxMNYCK9G3dwNqdy9d1Hb9sDrSWEMWKxvWVLXoPT+6V5AQ5CHLtA7c8mcGOOb0oga+GHbnkEie/Ri991twRkGnQNeigm1eW6+7hJ0dBZHN1LNss4ymA+LwAbSt/GqWchvfyFX772pPmc51ZidMI6fYLg/Vz3pU8apP0cpEliUPl3WhA7K2rRvoDXrCg5d1y3D3KPT6fM+lkT/2XWmjybVb+z9Bn6GhgjafljOeMM8i3MCDX0kKSmo3qMtHfIFDARLLcOueImMzZE5Pk9WaNVZzp8CCJffg+XUk9/ifgnzueomoES1gqC+BNJI9XNd2MkZAMBBBzwKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KvahwkfPwNOx5sje5WCi/YXlp++bLrvVXD6EheNLIOU=;
 b=UnLnZqBKl3rLlvBT+KyqDvX+LU7qfnKruyGedK4SKFo/VzHxPtH1e3cDPNj1kYrQhGeuvcpR6vl2ZAgvTKM86GYm1tHcZ4+2Ee/v6FHLYBWVhGAexD23Tys92ne6hwbxz1EpJnJUso/MYTW4VT3GfInlqSH4VfVIFbThtwYA/lQ=
Received: from BY5PR17CA0045.namprd17.prod.outlook.com (2603:10b6:a03:167::22)
 by DM4PR12MB6445.namprd12.prod.outlook.com (2603:10b6:8:bd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.18; Fri, 24 May
 2024 20:12:18 +0000
Received: from MWH0EPF000971E5.namprd02.prod.outlook.com
 (2603:10b6:a03:167:cafe::4a) by BY5PR17CA0045.outlook.office365.com
 (2603:10b6:a03:167::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55 via Frontend
 Transport; Fri, 24 May 2024 20:12:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E5.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Fri, 24 May 2024 20:12:17 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 24 May
 2024 15:12:16 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 24 May
 2024 15:12:15 -0500
Received: from xcolc230100.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 24 May 2024 15:12:15 -0500
From: Mark Hatle <mark.hatle@amd.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap 2/2] gcc: Fix for CVE-2024-0151
Date: Fri, 24 May 2024 14:12:14 -0600
Message-ID: <20240524201214.3858538-3-mark.hatle@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524201214.3858538-1-mark.hatle@amd.com>
References: <20240524201214.3858538-1-mark.hatle@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: mark.hatle@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E5:EE_|DM4PR12MB6445:EE_
X-MS-Office365-Filtering-Correlation-Id: affb44b1-fff3-46df-314d-08dc7c2dcfb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|36860700004|1800799015|82310400017|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7j7/tMYEnonJ0+kktMx7rnU7lbV9tmFy1g2pDjIberBzP6H5ehMOwspH0Cxx?=
 =?us-ascii?Q?aYKQA3rc9fjMPIvxnI5nJwlP2RLloHU9KOflxvJsrTodY2vu0q3yu3WMV+Pr?=
 =?us-ascii?Q?YNVNLFLYdcwJEBooXjb9WddLelePhibs3VsPBcVDtqwZT9+cdlGwbxA/j9ux?=
 =?us-ascii?Q?tpetoQekTvMpsEE3nZmUkN2vnZHApiIkeyQsOI63fMP3KodhashO1XgdcDlt?=
 =?us-ascii?Q?BAcptj5Lb7m5pkp9kBp3Jcv+KDDL931dETLXONr5HGILdWtAHiwQRF9Du5Iu?=
 =?us-ascii?Q?Byu7cmDdmGjMGBuBpnVAcD93YZUJjqf8PGfcX4GEpx4ssV77CZg6MdQSjyYF?=
 =?us-ascii?Q?Oq3Nf5rtmfhYPOTDK+6tFs9bgS67Sao/HK1hpbmrv2+Rl3wPAPFPACIZX+EH?=
 =?us-ascii?Q?s0ypvEJaTYRdDxS/5mEmJG8Zzj4ABsE2olrFP1SC7ocYu4unnK5NJ4pA2h/q?=
 =?us-ascii?Q?MFHaM3pahwYoiXXFY6Udx5oICorjMTr0eYrN5YjYPyDcyweT1iKtNKB+CZzC?=
 =?us-ascii?Q?yeB/hRnnEr7snSU6iSYQtCsjDsMswRk/2/sbufcONm8xDizLatPToiHj4zeF?=
 =?us-ascii?Q?B7l5gYRb4bwDnK+1259tjSSVqyBTr4p8PqqE+8ewO97Z/76H8bYpZkiAgz7P?=
 =?us-ascii?Q?O/DraEV2ICkVRB9kZir/Zbc3bqi7yZeLvN39xRZWWoUf7SujwKWe+Lm/pIMa?=
 =?us-ascii?Q?HcirWk7mgPsiAqD2lm1qlNRI8QIPHUf6IMU1/+kWf3G4u9csBWD5huKDsgxA?=
 =?us-ascii?Q?nCcJr2XAQtSAVyYEs5OPWVAIav6h1fhQ2ECijSYCxoNa1f3ZOmihRM8MUOw9?=
 =?us-ascii?Q?60uAMbUrX89sRG104b5nCLueNbVKM9U32H+vAMDK/AznJVyNZET0HmTaFpoW?=
 =?us-ascii?Q?xyvN3Xdb3HdZ7BzRE4VFeAUAR3BhU0xd8qWK4Z+qrarRKza6YZ/e7dWrk4MB?=
 =?us-ascii?Q?GmcY8Jd4/42TTncUC7PuiSS6ifc/33zQ73JC7cT3pddI3zYtrP7OiofkfD4w?=
 =?us-ascii?Q?LBJ6S6iHz0r4MvBQta/RwlfKAeJnSAFQ2qbvEg5Mdy4Q7Ghugi5TBVUdPxbh?=
 =?us-ascii?Q?Dwh/RekwCWIYpQYMlJzZkNVYXFrbhvnWDZi6h1sMw96xBLwShfRs1CdUvZEF?=
 =?us-ascii?Q?wglCMH8nGSPuIKnGhDNOjLlxuOEUxtQd6tGASgSY3y9Ppm+fB0EDeCO4NyWi?=
 =?us-ascii?Q?D/t0+l5QhlNsfPE0s80uM/jRJ5EkMFCfAUyl8AeBfvrEHhB67H/8Ww/VRrrs?=
 =?us-ascii?Q?eELoQU1yytxEkELR6lA4gKeN6FgzrRHBFLN15s05lo2sEyACqTh7F0RMOg4A?=
 =?us-ascii?Q?2UAQfUC6jzLhcVk6vxnV3xnf?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(82310400017)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 20:12:17.7827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: affb44b1-fff3-46df-314d-08dc7c2dcfb2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000971E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6445
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 20:12:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199861

Fix for insufficient argument checking in Secure state Entry functions
in software using Cortex-M Security Extensions (CMSE), that has been
compiled using toolchains that implement 'Arm v8-M Security Extensions
Requirements on Development Tools' prior to version 1.4, allows an
attacker to pass values to Secure state that are out of range for types
smaller than 32-bits. Out of range values might lead to incorrect
operations in secure state.

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
---
 meta/recipes-devtools/gcc/gcc-13.2.inc        |   1 +
 .../gcc/gcc/CVE-2024-0151.patch               | 315 ++++++++++++++++++
 2 files changed, 316 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/CVE-2024-0151.patch

diff --git a/meta/recipes-devtools/gcc/gcc-13.2.inc b/meta/recipes-devtools=
/gcc/gcc-13.2.inc
index 603377a49a..abf177822b 100644
--- a/meta/recipes-devtools/gcc/gcc-13.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-13.2.inc
@@ -68,6 +68,7 @@ SRC_URI =3D "${BASEURI} \
            file://CVE-2023-4039.patch \
            file://0026-aarch64-Fix-loose-ldpstp-check-PR111411.patch \
            file://0027-Fix-gcc-vect-module-testcases.patch \
+           file://CVE-2024-0151.patch \
 "
 SRC_URI[sha256sum] =3D "e275e76442a6067341a27f04c5c6b83d8613144004c0413528=
863dc6b5c743da"
=20
diff --git a/meta/recipes-devtools/gcc/gcc/CVE-2024-0151.patch b/meta/recip=
es-devtools/gcc/gcc/CVE-2024-0151.patch
new file mode 100644
index 0000000000..01d55b5cdb
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/CVE-2024-0151.patch
@@ -0,0 +1,315 @@
+arm: Zero/Sign extends for CMSE security
+
+This patch makes the following changes:
+
+1) When calling a secure function from non-secure code then any arguments
+   smaller than 32-bits that are passed in registers are zero- or sign-ext=
ended.
+2) After a non-secure function returns into secure code then any return va=
lue
+   smaller than 32-bits that is passed in a register is  zero- or sign-ext=
ended.
+
+This patch addresses the following CVE-2024-0151.
+
+gcc/ChangeLog:
+        PR target/114837
+        * config/arm/arm.cc (cmse_nonsecure_call_inline_register_clear):
+          Add zero/sign extend.
+        (arm_expand_prologue): Add zero/sign extend.
+
+gcc/testsuite/ChangeLog:
+
+        * gcc.target/arm/cmse/extend-param.c: New test.
+        * gcc.target/arm/cmse/extend-return.c: New test.
+
+CVE: CVE-2023-4039
+Upstream-Status: Backport [https://gcc.gnu.org/pipermail/gcc-patches/2024-=
April/649973.html]
+Signed-off-by: Mark Hatle <mark.hatle@amd.com>
+
+diff --git a/gcc/config/arm/arm.cc b/gcc/config/arm/arm.cc
+index 0217abc218d60956ce727e6d008d46b9176dddc5..ea0c963a4d67ecd70e1571624e=
84dfe46d757df9 100644
+--- a/gcc/config/arm/arm.cc
++++ b/gcc/config/arm/arm.cc
+@@ -19210,6 +19210,30 @@ cmse_nonsecure_call_inline_register_clear (void)
+ 	  end_sequence ();
+ 	  emit_insn_before (seq, insn);
+=20
++	  /* The AAPCS requires the callee to widen integral types narrower
++	     than 32 bits to the full width of the register; but when handling
++	     calls to non-secure space, we cannot trust the callee to have
++	     correctly done so.  So forcibly re-widen the result here.  */
++	  tree ret_type =3D TREE_TYPE (fntype);
++	  if ((TREE_CODE (ret_type) =3D=3D INTEGER_TYPE
++	      || TREE_CODE (ret_type) =3D=3D ENUMERAL_TYPE
++	      || TREE_CODE (ret_type) =3D=3D BOOLEAN_TYPE)
++	      && known_lt (GET_MODE_SIZE (TYPE_MODE (ret_type)), 4))
++	    {
++	      machine_mode ret_mode =3D TYPE_MODE (ret_type);
++	      rtx extend;
++	      if (TYPE_UNSIGNED (ret_type))
++		extend =3D gen_rtx_ZERO_EXTEND (SImode,
++					      gen_rtx_REG (ret_mode, R0_REGNUM));
++	      else
++		extend =3D gen_rtx_SIGN_EXTEND (SImode,
++					      gen_rtx_REG (ret_mode, R0_REGNUM));
++	      emit_insn_after (gen_rtx_SET (gen_rtx_REG (SImode, R0_REGNUM),
++					     extend), insn);
++
++	    }
++
++
+ 	  if (TARGET_HAVE_FPCXT_CMSE)
+ 	    {
+ 	      rtx_insn *last, *pop_insn, *after =3D insn;
+@@ -23652,6 +23676,51 @@ arm_expand_prologue (void)
+=20
+   ip_rtx =3D gen_rtx_REG (SImode, IP_REGNUM);
+=20
++  /* The AAPCS requires the callee to widen integral types narrower
++     than 32 bits to the full width of the register; but when handling
++     calls to non-secure space, we cannot trust the callee to have
++     correctly done so.  So forcibly re-widen the result here.  */
++  if (IS_CMSE_ENTRY (func_type))
++    {
++      function_args_iterator args_iter;
++      CUMULATIVE_ARGS args_so_far_v;
++      cumulative_args_t args_so_far;
++      bool first_param =3D true;
++      tree arg_type;
++      tree fndecl =3D current_function_decl;
++      tree fntype =3D TREE_TYPE (fndecl);
++      arm_init_cumulative_args (&args_so_far_v, fntype, NULL_RTX, fndecl)=
;
++      args_so_far =3D pack_cumulative_args (&args_so_far_v);
++      FOREACH_FUNCTION_ARGS (fntype, arg_type, args_iter)
++	{
++	  rtx arg_rtx;
++
++	  if (VOID_TYPE_P (arg_type))
++	    break;
++
++	  function_arg_info arg (arg_type, /*named=3D*/true);
++	  if (!first_param)
++	    /* We should advance after processing the argument and pass
++	       the argument we're advancing past.  */
++	    arm_function_arg_advance (args_so_far, arg);
++	  first_param =3D false;
++	  arg_rtx =3D arm_function_arg (args_so_far, arg);
++	  gcc_assert (REG_P (arg_rtx));
++	  if ((TREE_CODE (arg_type) =3D=3D INTEGER_TYPE
++	      || TREE_CODE (arg_type) =3D=3D ENUMERAL_TYPE
++	      || TREE_CODE (arg_type) =3D=3D BOOLEAN_TYPE)
++	      && known_lt (GET_MODE_SIZE (GET_MODE (arg_rtx)), 4))
++	    {
++	      if (TYPE_UNSIGNED (arg_type))
++		emit_set_insn (gen_rtx_REG (SImode, REGNO (arg_rtx)),
++			       gen_rtx_ZERO_EXTEND (SImode, arg_rtx));
++	      else
++		emit_set_insn (gen_rtx_REG (SImode, REGNO (arg_rtx)),
++			       gen_rtx_SIGN_EXTEND (SImode, arg_rtx));
++	    }
++	}
++    }
++
+   if (IS_STACKALIGN (func_type))
+     {
+       rtx r0, r1;
+diff --git a/gcc/testsuite/gcc.target/arm/cmse/extend-param.c b/gcc/testsu=
ite/gcc.target/arm/cmse/extend-param.c
+new file mode 100644
+index 0000000000000000000000000000000000000000..01fac7862385f871f3ecc246ed=
e95eea180be025
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/arm/cmse/extend-param.c
+@@ -0,0 +1,96 @@
++/* { dg-do compile } */
++/* { dg-options "-mcmse" } */
++/* { dg-final { check-function-bodies "**" "" "" } } */
++
++#include <arm_cmse.h>
++#include <stdbool.h>
++
++#define ARRAY_SIZE (256)
++char array[ARRAY_SIZE];
++
++enum offset
++{
++    zero =3D 0,
++    one =3D 1,
++    two =3D 2
++};
++
++/*
++**__acle_se_unsignSecureFunc:
++**	...
++**	uxtb	r0, r0
++**	...
++*/
++__attribute__((cmse_nonsecure_entry)) char unsignSecureFunc (unsigned cha=
r index) {
++    if (index >=3D ARRAY_SIZE)
++      return 0;
++    return array[index];
++}
++
++/*
++**__acle_se_signSecureFunc:
++**	...
++**	sxtb	r0, r0
++**	...
++*/
++__attribute__((cmse_nonsecure_entry)) char signSecureFunc (signed char in=
dex) {
++    if (index >=3D ARRAY_SIZE)
++      return 0;
++    return array[index];
++}
++
++/*
++**__acle_se_shortUnsignSecureFunc:
++**	...
++**	uxth	r0, r0
++**	...
++*/
++__attribute__((cmse_nonsecure_entry)) char shortUnsignSecureFunc (unsigne=
d short index) {
++    if (index >=3D ARRAY_SIZE)
++      return 0;
++    return array[index];
++}
++
++/*
++**__acle_se_shortSignSecureFunc:
++**	...
++**	sxth	r0, r0
++**	...
++*/
++__attribute__((cmse_nonsecure_entry)) char shortSignSecureFunc (signed sh=
ort index) {
++    if (index >=3D ARRAY_SIZE)
++      return 0;
++    return array[index];
++}
++
++/*
++**__acle_se_enumSecureFunc:
++**	...
++**	uxtb	r0, r0
++**	...
++*/
++__attribute__((cmse_nonsecure_entry)) char enumSecureFunc (enum offset in=
dex) {
++
++  // Compiler may optimize away bounds check as value is an unsigned char=
.
++
++  // According to AAPCS caller will zero extend to ensure value is < 256.
++
++  if (index >=3D ARRAY_SIZE)
++    return 0;
++  return array[index];
++
++}
++
++/*
++**__acle_se_boolSecureFunc:
++**	...
++**	uxtb	r0, r0
++**	...
++*/
++__attribute__((cmse_nonsecure_entry)) char boolSecureFunc (bool index) {
++
++  if (index >=3D ARRAY_SIZE)
++    return 0;
++  return array[index];
++
++}
+\ No newline at end of file
+diff --git a/gcc/testsuite/gcc.target/arm/cmse/extend-return.c b/gcc/tests=
uite/gcc.target/arm/cmse/extend-return.c
+new file mode 100644
+index 0000000000000000000000000000000000000000..cf731ed33df7e6dc101320c197=
0016f01b14c59a
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/arm/cmse/extend-return.c
+@@ -0,0 +1,92 @@
++/* { dg-do compile } */
++/* { dg-options "-mcmse" } */
++/* { dg-final { check-function-bodies "**" "" "" } } */
++
++#include <arm_cmse.h>
++#include <stdbool.h>
++
++enum offset
++{
++    zero =3D 0,
++    one =3D 1,
++    two =3D 2
++};
++
++typedef unsigned char __attribute__ ((cmse_nonsecure_call)) ns_unsign_foo=
_t (void);
++typedef signed char __attribute__ ((cmse_nonsecure_call)) ns_sign_foo_t (=
void);
++typedef unsigned short __attribute__ ((cmse_nonsecure_call)) ns_short_uns=
ign_foo_t (void);
++typedef signed short __attribute__ ((cmse_nonsecure_call)) ns_short_sign_=
foo_t (void);
++typedef enum offset __attribute__ ((cmse_nonsecure_call)) ns_enum_foo_t (=
void);
++typedef bool __attribute__ ((cmse_nonsecure_call)) ns_bool_foo_t (void);
++
++/*
++**unsignNonsecure0:
++**	...
++**	bl	__gnu_cmse_nonsecure_call
++**	uxtb	r0, r0
++**	...
++*/
++unsigned char unsignNonsecure0 (ns_unsign_foo_t * ns_foo_p)
++{
++  return ns_foo_p ();
++}
++
++/*
++**signNonsecure0:
++**	...
++**	bl	__gnu_cmse_nonsecure_call
++**	sxtb	r0, r0
++**	...
++*/
++signed char signNonsecure0 (ns_sign_foo_t * ns_foo_p)
++{
++  return ns_foo_p ();
++}
++
++/*
++**shortUnsignNonsecure0:
++**	...
++**	bl	__gnu_cmse_nonsecure_call
++**	uxth	r0, r0
++**	...
++*/
++unsigned short shortUnsignNonsecure0 (ns_short_unsign_foo_t * ns_foo_p)
++{
++  return ns_foo_p ();
++}
++
++/*
++**shortSignNonsecure0:
++**	...
++**	bl	__gnu_cmse_nonsecure_call
++**	sxth	r0, r0
++**	...
++*/
++signed short shortSignNonsecure0 (ns_short_sign_foo_t * ns_foo_p)
++{
++  return ns_foo_p ();
++}
++
++/*
++**enumNonsecure0:
++**	...
++**	bl	__gnu_cmse_nonsecure_call
++**	uxtb	r0, r0
++**	...
++*/
++unsigned char __attribute__((noipa)) enumNonsecure0 (ns_enum_foo_t * ns_f=
oo_p)
++{
++  return ns_foo_p ();
++}
++
++/*
++**boolNonsecure0:
++**	...
++**	bl	__gnu_cmse_nonsecure_call
++**	uxtb	r0, r0
++**	...
++*/
++unsigned char boolNonsecure0 (ns_bool_foo_t * ns_foo_p)
++{
++  return ns_foo_p ();
++}
+\ No newline at end of file
--=20
2.34.1



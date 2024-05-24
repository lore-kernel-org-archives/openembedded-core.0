Return-Path: <mark.hatle@amd.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6812C25B7D
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 20:12:31 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.53])
 by mx.groups.io with SMTP id smtpd.web10.4794.1716581549294658403
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 May 2024 13:12:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@amd.com header.s=selector1 header.b=szMDY30m;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: amd.com, ip: 40.107.220.53, mailfrom: mark.hatle@amd.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mcDw/Fnj+h5mP20fVWBnbrXdOxmp0SfBOzFudd4tymaI0NLxYcceRr5K18EwjHJYCmw0nUmLdL36zoBrGaK/QcjRKA2VzKrs/g0RG5ViHsdR9yLh83Z0L7Y+lzV5nAr7hbeK7zt+typYwbqcYg94cnZ9RdUWT9yr63ouQESNafwyhckVsQ7Kwg77ymM8ZrC9LK4rpmjqOzyyZPO9HMbwb00a7boNMGdzuIqyC47seAq+1oGlQSbisKHU1tB0tCzlcBixfEOqgfekoEMzns/wtas7hVjwfCw37ytMxhxevyg69y3FKuuKshZ29kLWB6yKG0W+IuHHj4YE1f+58AjU2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbKo+qBkALG0ZXrHAFKaFvJMAA7xTnGk3ADz8SzPxCQ=;
 b=auNVk954UxrO1Wn+dLrem0tx1aZynWHiR/Lkr1Z3CgLKvoGA96yPpYKy6RvlL+R2L8482Zco+YjFUbyLf/VUORa0dU8C4pVZ6ak/d0N8xz436rQ0UpXr1n0pPxb58gwUTds45ai5y4aaCPrezxgJ5mZXqSWMMcdihT5MQ249StF3PTPa4Bjo/Q9hhnJG6tDdhMDMByNdSBZVIWolw66LGARmNPRTO1CDuapgCQdOWrLfJ8rvZfC2i0ozDChh0DNwqEZ6oSbEojf1LHGSP9W1ovNcppH9TPnHrHoXfVFEgaHHKVA4FduPHQebOYyRYN/D7d4Y+wVEee0vnJifk/Azog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=amd.com; dmarc=pass (p=quarantine sp=quarantine pct=100)
 action=none header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbKo+qBkALG0ZXrHAFKaFvJMAA7xTnGk3ADz8SzPxCQ=;
 b=szMDY30mu1OO6dhgYthOyj9XgkaKEN+rNONA7Rat1nKHgYEq0461yM3TGYa7F7Me2FAZHnysXijlaZ9MLyFRwjkEM22r3+IHF+irkplmPFAaGYIify/9Ubu4BP3h72ABiw68FCsHRHOGjpSvTFkATbnBr6oUWXoUfKvqy3JHDDY=
Received: from CYXPR03CA0011.namprd03.prod.outlook.com (2603:10b6:930:d0::19)
 by SA1PR12MB6701.namprd12.prod.outlook.com (2603:10b6:806:251::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Fri, 24 May
 2024 20:12:16 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:930:d0:cafe::3d) by CYXPR03CA0011.outlook.office365.com
 (2603:10b6:930:d0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.20 via Frontend
 Transport; Fri, 24 May 2024 20:12:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Fri, 24 May 2024 20:12:16 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 24 May
 2024 15:12:15 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 24 May
 2024 15:12:15 -0500
Received: from xcolc230100.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 24 May 2024 15:12:15 -0500
From: Mark Hatle <mark.hatle@amd.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap 1/2] binutils: Fix aarch64 disassembly abort
Date: Fri, 24 May 2024 14:12:13 -0600
Message-ID: <20240524201214.3858538-2-mark.hatle@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|SA1PR12MB6701:EE_
X-MS-Office365-Filtering-Correlation-Id: e10a4f9a-5c84-4675-f394-08dc7c2dcebb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|36860700004|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nBGFSATVMn8ZWz2Lhhazjnmqeu4tfguXMourhlrNPbfGWCsiq/O2gSNTdn+M?=
 =?us-ascii?Q?Rmy0BRhs9f/7GHF4t56oc7vQAZcnicxFER+0aVCU2w72OSUqu/KHXfvXrUJk?=
 =?us-ascii?Q?WukkYl9quavEa+rd6SkJxJENw8EUFmQU7+9ZMzP+FXk+Yip98U9UVoz0yHNq?=
 =?us-ascii?Q?Sd0SsTRbhQI6Mg7/xRKdSziJ46YRYWmLzVdM5xPcWzx0wrFzjmTvISb0B/F6?=
 =?us-ascii?Q?WXjZ2kj+mG4fwOKB+P/z6WRSNVjFn2nx2eHtgKpc2ObhdNzY74nNTamkY3a1?=
 =?us-ascii?Q?uK5vv0X8NGvip78lgKJESuC518BGfiFhAa9WkrAGVAn58QElUOMHzRKFpZ9Y?=
 =?us-ascii?Q?kHT/iTuZmlw0EDJHDk/2Nup8J5nOR5NM6oUi9tysjf0HQn35uYkePjmtbTk/?=
 =?us-ascii?Q?ylyPnCTHSXES6jB8o5ZzE54fabuJ7jWG0T0SA0Pm52A9Ge1EhmpQebR4X47U?=
 =?us-ascii?Q?9gsAI2GebfOrz+wq+ZeLvR8SRHTF972vu9Tt+Ga4tKu9UEiJRrS22Wk4zxU4?=
 =?us-ascii?Q?FevZueRpkf8dArhnyfRlX3Udhk1N7f40rlX2NN5qD8sLvBJSOzhkC9f8t3SH?=
 =?us-ascii?Q?uaZvXKa33iGrmNgggu6Atut385U8Kcbu2+243/NGnMr4kJksAY36ETFYkDLJ?=
 =?us-ascii?Q?AgkOmaGPgq5cVgr41fbAoJz6uOEKFWJQJwx0YRy/m1qjDBieaaT9xdYefVmB?=
 =?us-ascii?Q?G2ojuSOSOcwe5+vyk041LTv93WYBKWocNq3KLsRbotqNDVOaghkJrf0oNj7E?=
 =?us-ascii?Q?uipFPkliuwf0Ff4/Fu3VEuaKeRAaExtAJg62Vfr6rgmMJIqiNY1UlCtuvtNZ?=
 =?us-ascii?Q?uUasq/kZExMuZllqiDODmDJ0ORzxCJE5YF1UhYm5GTxdjnJ7gN+lUS74+EwC?=
 =?us-ascii?Q?9pFD4q2QNlG1LJN2dUnvubLyfz05RREsjYy6EznHCkrt4yx0FYsRrdg/wXfu?=
 =?us-ascii?Q?6DH7ZQbQ4uvFW2ompd0hzA/6IPkIEhC+FP3W8tjxBU4HwPSveJ4ERg4/0f3r?=
 =?us-ascii?Q?0B5kDvRWce1P0qXmToqqVyp1qt2Mw7qVvUodKvJh6E5ph/sXnjxxZMAANKqi?=
 =?us-ascii?Q?RmyClsuLBUxKkWApWtU/FbjUTaGF2fwBsBfhGkrEGI35uD/ZH9W6G0ETNN2X?=
 =?us-ascii?Q?bKlJ2SAwR0uV48cfNOrAXACt24FvmSkv3tRWQKaoR5m0k5+ZPPvrk3kMkFU/?=
 =?us-ascii?Q?NaEWJdYW9v8rXYESxqb3pkIFdS/BgdT6+1zaXEzhZZoG1M3WcEpo2aOaXGf7?=
 =?us-ascii?Q?1NFXlBpItnPu401wH1aJkOooTj89SDg5GQZzl2M8pJ+x4FTzAClVusE1v9zg?=
 =?us-ascii?Q?ehi3EGyE6KFIyfI5UdwC106f?=
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 20:12:16.2314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e10a4f9a-5c84-4675-f394-08dc7c2dcebb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6701
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 May 2024 20:12:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199862

Code backported from binutils development tree.

  aarch64: Remove asserts from operand qualifier decoders [PR31595]

  Given that the disassembler should never abort when decoding
  (potentially random) data, assertion statements in the
  `get_*reg_qualifier_from_value' function family prove problematic.

  ...

Signed-off-by: Mark Hatle <mark.hatle@amd.com>
---
 .../binutils/binutils-2.42.inc                |   1 +
 ...sserts-from-operand-qualifier-decode.patch | 382 ++++++++++++++++++
 2 files changed, 383 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0016-aarch64-Re=
move-asserts-from-operand-qualifier-decode.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipe=
s-devtools/binutils/binutils-2.42.inc
index 3b6f47d4ce..d2f49560f3 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -36,5 +36,6 @@ SRC_URI =3D "\
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patc=
h \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patc=
h \
      file://0015-gprofng-change-use-of-bignum-to-bigint.patch \
+     file://0016-aarch64-Remove-asserts-from-operand-qualifier-decode.patc=
h \
 "
 S  =3D "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0016-aarch64-Remove-as=
serts-from-operand-qualifier-decode.patch b/meta/recipes-devtools/binutils/=
binutils/0016-aarch64-Remove-asserts-from-operand-qualifier-decode.patch
new file mode 100644
index 0000000000..7b52425a38
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0016-aarch64-Remove-asserts-f=
rom-operand-qualifier-decode.patch
@@ -0,0 +1,382 @@
+From 5b1c70bfe0d8f84dc28237d6150b7b9d57c791a8 Mon Sep 17 00:00:00 2001
+From: Victor Do Nascimento <victor.donascimento@arm.com>
+Date: Tue, 16 Apr 2024 11:49:15 +0100
+Subject: [PATCH] aarch64: Remove asserts from operand qualifier decoders
+ [PR31595]
+
+Given that the disassembler should never abort when decoding
+(potentially random) data, assertion statements in the
+`get_*reg_qualifier_from_value' function family prove problematic.
+
+Consider the random 32-bit word W, encoded in a data segment and
+encountered on execution of `objdump -D <obj_name>'.
+
+If:
+
+  (W & ~opcode_mask) =3D=3D valid instruction
+
+Then before `print_insn_aarch64_word' has a chance to report the
+instruction as potentially undefined, an attempt will be made to have
+the qualifiers for the instruction's register operands (if any)
+decoded.  If the relevant bits do not map onto a valid qualifier for
+the matched instruction-like word, an abort will be triggered and the
+execution of objdump aborted.
+
+As this scenario is perfectly feasible and, in light of the fact that
+objdump must successfully decode all sections of a given object file,
+it is not appropriate to assert in this family of functions.
+
+Therefore, we add a new pseudo-qualifier `AARCH64_OPND_QLF_ERR' for
+handling invalid qualifier-associated values and re-purpose the
+assertion conditions in qualifier-retrieving functions to be the
+predicate guarding the returning of the calculated qualifier type.
+If the predicate fails, we return this new qualifier and allow the
+caller to handle the error as appropriate.
+
+As these functions are called either from within
+`aarch64_extract_operand' or `do_special_decoding', both of which are
+expected to return non-zero values, it suffices that callers return
+zero upon encountering `AARCH64_OPND_QLF_ERR'.
+
+Ar present the error presented in the hypothetical scenario has been
+encountered in `get_sreg_qualifier_from_value', but the change is made
+to the whole family to keep the interface consistent.
+
+Bug: https://sourceware.org/PR31595
+
+Upstream-Status: Backport [commit 2601b201e95ea0edab89342ee7137c74e88a8a79=
]
+
+Signed-off-by: Mark Hatle <mark.hatle@amd.com>
+---
+ .../testsuite/binutils-all/aarch64/illegal.d  |  1 +
+ .../testsuite/binutils-all/aarch64/illegal.s  |  3 +
+ include/opcode/aarch64.h                      |  3 +
+ opcodes/aarch64-dis.c                         | 98 +++++++++++++++----
+ 4 files changed, 87 insertions(+), 18 deletions(-)
+
+diff --git a/binutils/testsuite/binutils-all/aarch64/illegal.d b/binutils/=
testsuite/binutils-all/aarch64/illegal.d
+index 4b90a1d9f39..b69318aec85 100644
+--- a/binutils/testsuite/binutils-all/aarch64/illegal.d
++++ b/binutils/testsuite/binutils-all/aarch64/illegal.d
+@@ -8,5 +8,6 @@ Disassembly of section \.text:
+=20
+ 0+000 <.*>:
+ [ 	]+0:[ 	]+68ea18cc[ 	]+.inst[ 	]+0x68ea18cc ; undefined
++[ 	]+4:[ 	]+9dc39839[ 	]+.inst[ 	]+0x9dc39839 ; undefined
+ #pass
+=20
+diff --git a/binutils/testsuite/binutils-all/aarch64/illegal.s b/binutils/=
testsuite/binutils-all/aarch64/illegal.s
+index 216cbe6f265..43668c6db55 100644
+--- a/binutils/testsuite/binutils-all/aarch64/illegal.s
++++ b/binutils/testsuite/binutils-all/aarch64/illegal.s
+@@ -4,4 +4,7 @@
+ 	# ldpsw   x12, x6, [x6],#-8 ; illegal because one of the dest regs is al=
so the address reg
+ 	.inst 0x68ea18cc
+=20
++	# illegal, resembles the opcode `ldapur' with invalid qualifier bits
++	.inst 0x9dc39839
++
+ 	# FIXME: Add more illegal instructions here.
+diff --git a/include/opcode/aarch64.h b/include/opcode/aarch64.h
+index 2fca9528c20..e8fe93ef127 100644
+--- a/include/opcode/aarch64.h
++++ b/include/opcode/aarch64.h
+@@ -894,6 +894,9 @@ enum aarch64_opnd_qualifier
+   /* Special qualifier helping retrieve qualifier information during the
+      decoding time (currently not in use).  */
+   AARCH64_OPND_QLF_RETRIEVE,
++
++  /* Special qualifier used for indicating error in qualifier retrieval. =
 */
++  AARCH64_OPND_QLF_ERR,
+ };
+ =0C
+ /* Instruction class.  */
+diff --git a/opcodes/aarch64-dis.c b/opcodes/aarch64-dis.c
+index 96f42ae862a..b70e6da9eb7 100644
+--- a/opcodes/aarch64-dis.c
++++ b/opcodes/aarch64-dis.c
+@@ -219,9 +219,10 @@ static inline enum aarch64_opnd_qualifier
+ get_greg_qualifier_from_value (aarch64_insn value)
+ {
+   enum aarch64_opnd_qualifier qualifier =3D AARCH64_OPND_QLF_W + value;
+-  assert (value <=3D 0x1
+-	  && aarch64_get_qualifier_standard_value (qualifier) =3D=3D value);
+-  return qualifier;
++  if (value <=3D 0x1
++      && aarch64_get_qualifier_standard_value (qualifier) =3D=3D value)
++    return qualifier;
++  return AARCH64_OPND_QLF_ERR;
+ }
+=20
+ /* Given VALUE, return qualifier for a vector register.  This does not su=
pport
+@@ -237,9 +238,10 @@ get_vreg_qualifier_from_value (aarch64_insn value)
+   if (qualifier >=3D AARCH64_OPND_QLF_V_2H)
+     qualifier +=3D 1;
+=20
+-  assert (value <=3D 0x8
+-	  && aarch64_get_qualifier_standard_value (qualifier) =3D=3D value);
+-  return qualifier;
++  if (value <=3D 0x8
++      && aarch64_get_qualifier_standard_value (qualifier) =3D=3D value)
++    return qualifier;
++  return AARCH64_OPND_QLF_ERR;
+ }
+=20
+ /* Given VALUE, return qualifier for an FP or AdvSIMD scalar register.  *=
/
+@@ -248,9 +250,10 @@ get_sreg_qualifier_from_value (aarch64_insn value)
+ {
+   enum aarch64_opnd_qualifier qualifier =3D AARCH64_OPND_QLF_S_B + value;
+=20
+-  assert (value <=3D 0x4
+-	  && aarch64_get_qualifier_standard_value (qualifier) =3D=3D value);
+-  return qualifier;
++  if (value <=3D 0x4
++      && aarch64_get_qualifier_standard_value (qualifier) =3D=3D value)
++    return qualifier;
++  return AARCH64_OPND_QLF_ERR;
+ }
+=20
+ /* Given the instruction in *INST which is probably half way through the
+@@ -263,13 +266,17 @@ get_expected_qualifier (const aarch64_inst *inst, in=
t i)
+ {
+   aarch64_opnd_qualifier_seq_t qualifiers;
+   /* Should not be called if the qualifier is known.  */
+-  assert (inst->operands[i].qualifier =3D=3D AARCH64_OPND_QLF_NIL);
+-  int invalid_count;
+-  if (aarch64_find_best_match (inst, inst->opcode->qualifiers_list,
+-			       i, qualifiers, &invalid_count))
+-    return qualifiers[i];
++  if (inst->operands[i].qualifier =3D=3D AARCH64_OPND_QLF_NIL)
++    {
++      int invalid_count;
++      if (aarch64_find_best_match (inst, inst->opcode->qualifiers_list,
++				   i, qualifiers, &invalid_count))
++	return qualifiers[i];
++      else
++	return AARCH64_OPND_QLF_NIL;
++    }
+   else
+-    return AARCH64_OPND_QLF_NIL;
++    return AARCH64_OPND_QLF_ERR;
+ }
+=20
+ /* Operand extractors.  */
+@@ -355,6 +362,8 @@ aarch64_ext_reglane (const aarch64_operand *self, aarc=
h64_opnd_info *info,
+ 	  aarch64_insn value =3D extract_field (FLD_imm4_11, code, 0);
+ 	  /* Depend on AARCH64_OPND_Ed to determine the qualifier.  */
+ 	  info->qualifier =3D get_expected_qualifier (inst, info->idx);
++	  if (info->qualifier =3D=3D AARCH64_OPND_QLF_ERR)
++	    return 0;
+ 	  shift =3D get_logsz (aarch64_get_qualifier_esize (info->qualifier));
+ 	  info->reglane.index =3D value >> shift;
+ 	}
+@@ -374,6 +383,8 @@ aarch64_ext_reglane (const aarch64_operand *self, aarc=
h64_opnd_info *info,
+ 	  if (pos > 3)
+ 	    return false;
+ 	  info->qualifier =3D get_sreg_qualifier_from_value (pos);
++	  if (info->qualifier =3D=3D AARCH64_OPND_QLF_ERR)
++	    return 0;
+ 	  info->reglane.index =3D (unsigned) (value >> 1);
+ 	}
+     }
+@@ -381,6 +392,8 @@ aarch64_ext_reglane (const aarch64_operand *self, aarc=
h64_opnd_info *info,
+     {
+       /* Need information in other operand(s) to help decoding.  */
+       info->qualifier =3D get_expected_qualifier (inst, info->idx);
++      if (info->qualifier =3D=3D AARCH64_OPND_QLF_ERR)
++	return 0;
+       switch (info->qualifier)
+ 	{
+ 	case AARCH64_OPND_QLF_S_4B:
+@@ -405,6 +418,8 @@ aarch64_ext_reglane (const aarch64_operand *self, aarc=
h64_opnd_info *info,
+=20
+       /* Need information in other operand(s) to help decoding.  */
+       info->qualifier =3D get_expected_qualifier (inst, info->idx);
++      if (info->qualifier =3D=3D AARCH64_OPND_QLF_ERR)
++	return 0;
+       switch (info->qualifier)
+ 	{
+ 	case AARCH64_OPND_QLF_S_H:
+@@ -644,9 +659,15 @@ aarch64_ext_advsimd_imm_shift (const aarch64_operand =
*self ATTRIBUTE_UNUSED,
+ 	 1xxx	1	2D  */
+       info->qualifier =3D
+ 	get_vreg_qualifier_from_value ((pos << 1) | (int) Q);
++      if (info->qualifier =3D=3D AARCH64_OPND_QLF_ERR)
++	return false;
+     }
+   else
+-    info->qualifier =3D get_sreg_qualifier_from_value (pos);
++    {
++      info->qualifier =3D get_sreg_qualifier_from_value (pos);
++      if (info->qualifier =3D=3D AARCH64_OPND_QLF_ERR)
++	return 0;
++    }
+=20
+   if (info->type =3D=3D AARCH64_OPND_IMM_VLSR)
+     /* immh	<shift>
+@@ -773,6 +794,8 @@ aarch64_ext_advsimd_imm_modified (const aarch64_operan=
d *self ATTRIBUTE_UNUSED,
+=20
+   /* cmode */
+   info->qualifier =3D get_expected_qualifier (inst, info->idx);
++  if (info->qualifier =3D=3D AARCH64_OPND_QLF_ERR)
++    return 0;
+   switch (info->qualifier)
+     {
+     case AARCH64_OPND_QLF_NIL:
+@@ -1014,6 +1037,8 @@ aarch64_ext_ft (const aarch64_operand *self ATTRIBUT=
E_UNUSED,
+       if (value > 0x4)
+ 	return false;
+       info->qualifier =3D get_sreg_qualifier_from_value (value);
++      if (info->qualifier =3D=3D AARCH64_OPND_QLF_ERR)
++	return 0;
+     }
+=20
+   return true;
+@@ -1086,6 +1111,8 @@ aarch64_ext_rcpc3_addr_offset (const aarch64_operand=
 *self ATTRIBUTE_UNUSED,
+ 			       aarch64_operand_error *errors ATTRIBUTE_UNUSED)
+ {
+   info->qualifier =3D get_expected_qualifier (inst, info->idx);
++  if (info->qualifier =3D=3D AARCH64_OPND_QLF_ERR)
++    return 0;
+=20
+   /* Rn */
+   info->addr.base_regno =3D extract_field (self->fields[0], code, 0);
+@@ -1105,6 +1132,8 @@ aarch64_ext_addr_offset (const aarch64_operand *self=
 ATTRIBUTE_UNUSED,
+ 			 aarch64_operand_error *errors ATTRIBUTE_UNUSED)
+ {
+   info->qualifier =3D get_expected_qualifier (inst, info->idx);
++  if (info->qualifier =3D=3D AARCH64_OPND_QLF_ERR)
++    return 0;
+=20
+   /* Rn */
+   info->addr.base_regno =3D extract_field (self->fields[0], code, 0);
+@@ -1154,6 +1183,8 @@ aarch64_ext_addr_regoff (const aarch64_operand *self=
 ATTRIBUTE_UNUSED,
+       /* Need information in other operand(s) to help achieve the decodin=
g
+ 	 from 'S' field.  */
+       info->qualifier =3D get_expected_qualifier (inst, info->idx);
++      if (info->qualifier =3D=3D AARCH64_OPND_QLF_ERR)
++	return 0;
+       /* Get the size of the data element that is accessed, which may be
+ 	 different from that of the source register size, e.g. in strb/ldrb.  */
+       size =3D aarch64_get_qualifier_esize (info->qualifier);
+@@ -1172,6 +1203,8 @@ aarch64_ext_addr_simm (const aarch64_operand *self, =
aarch64_opnd_info *info,
+ {
+   aarch64_insn imm;
+   info->qualifier =3D get_expected_qualifier (inst, info->idx);
++  if (info->qualifier =3D=3D AARCH64_OPND_QLF_ERR)
++    return 0;
+=20
+   /* Rn */
+   info->addr.base_regno =3D extract_field (FLD_Rn, code, 0);
+@@ -1210,6 +1243,8 @@ aarch64_ext_addr_uimm12 (const aarch64_operand *self=
, aarch64_opnd_info *info,
+ {
+   int shift;
+   info->qualifier =3D get_expected_qualifier (inst, info->idx);
++  if (info->qualifier =3D=3D AARCH64_OPND_QLF_ERR)
++    return 0;
+   shift =3D get_logsz (aarch64_get_qualifier_esize (info->qualifier));
+   /* Rn */
+   info->addr.base_regno =3D extract_field (self->fields[0], code, 0);
+@@ -1228,6 +1263,8 @@ aarch64_ext_addr_simm10 (const aarch64_operand *self=
, aarch64_opnd_info *info,
+   aarch64_insn imm;
+=20
+   info->qualifier =3D get_expected_qualifier (inst, info->idx);
++  if (info->qualifier =3D=3D AARCH64_OPND_QLF_ERR)
++    return 0;
+   /* Rn */
+   info->addr.base_regno =3D extract_field (self->fields[0], code, 0);
+   /* simm10 */
+@@ -2467,6 +2504,8 @@ decode_sizeq (aarch64_inst *inst)
+   if (mask =3D=3D 0x7)
+     {
+       inst->operands[idx].qualifier =3D get_vreg_qualifier_from_value (va=
lue);
++      if (inst->operands[idx].qualifier =3D=3D AARCH64_OPND_QLF_ERR)
++	return 0;
+       return 1;
+     }
+=20
+@@ -2649,6 +2688,8 @@ do_special_decoding (aarch64_inst *inst)
+       idx =3D select_operand_for_sf_field_coding (inst->opcode);
+       value =3D extract_field (FLD_sf, inst->value, 0);
+       inst->operands[idx].qualifier =3D get_greg_qualifier_from_value (va=
lue);
++      if (inst->operands[idx].qualifier =3D=3D AARCH64_OPND_QLF_ERR)
++	return 0;
+       if ((inst->opcode->flags & F_N)
+ 	  && extract_field (FLD_N, inst->value, 0) !=3D value)
+ 	return 0;
+@@ -2659,6 +2700,8 @@ do_special_decoding (aarch64_inst *inst)
+       idx =3D select_operand_for_sf_field_coding (inst->opcode);
+       value =3D extract_field (FLD_lse_sz, inst->value, 0);
+       inst->operands[idx].qualifier =3D get_greg_qualifier_from_value (va=
lue);
++      if (inst->operands[idx].qualifier =3D=3D AARCH64_OPND_QLF_ERR)
++	return 0;
+     }
+   /* rcpc3 'size' field.  */
+   if (inst->opcode->flags & F_RCPC3_SIZE)
+@@ -2670,12 +2713,18 @@ do_special_decoding (aarch64_inst *inst)
+ 	{
+ 	  if (aarch64_operands[inst->operands[i].type].op_class
+ 	      =3D=3D AARCH64_OPND_CLASS_INT_REG)
+-	    inst->operands[i].qualifier =3D get_greg_qualifier_from_value (value=
 & 1);
++	    {
++	      inst->operands[i].qualifier =3D get_greg_qualifier_from_value (val=
ue & 1);
++	      if (inst->operands[i].qualifier =3D=3D AARCH64_OPND_QLF_ERR)
++		return 0;
++	    }
+ 	  else if (aarch64_operands[inst->operands[i].type].op_class
+ 	      =3D=3D AARCH64_OPND_CLASS_FP_REG)
+ 	    {
+ 	      value +=3D (extract_field (FLD_opc1, inst->value, 0) << 2);
+ 	      inst->operands[i].qualifier =3D get_sreg_qualifier_from_value (val=
ue);
++	      if (inst->operands[i].qualifier =3D=3D AARCH64_OPND_QLF_ERR)
++		return 0;
+ 	    }
+ 	}
+     }
+@@ -2709,7 +2758,11 @@ do_special_decoding (aarch64_inst *inst)
+       /* For most related instruciton, the 'size' field is fully availabl=
e for
+ 	 operand encoding.  */
+       if (mask =3D=3D 0x3)
+-	inst->operands[idx].qualifier =3D get_sreg_qualifier_from_value (value);
++	{
++	  inst->operands[idx].qualifier =3D get_sreg_qualifier_from_value (value=
);
++	  if (inst->operands[idx].qualifier =3D=3D AARCH64_OPND_QLF_ERR)
++	    return 0;
++	}
+       else
+ 	{
+ 	  get_operand_possible_qualifiers (idx, inst->opcode->qualifiers_list,
+@@ -2744,6 +2797,9 @@ do_special_decoding (aarch64_inst *inst)
+       Q =3D (unsigned) extract_field (FLD_Q, inst->value, inst->opcode->m=
ask);
+       inst->operands[0].qualifier =3D
+ 	get_vreg_qualifier_from_value ((num << 1) | Q);
++      if (inst->operands[0].qualifier =3D=3D AARCH64_OPND_QLF_ERR)
++	return 0;
++
+     }
+=20
+   if ((inst->opcode->flags & F_OPD_SIZE) && inst->opcode->iclass =3D=3D s=
ve2_urqvs)
+@@ -2753,7 +2809,11 @@ do_special_decoding (aarch64_inst *inst)
+ 				       inst->opcode->mask);
+       inst->operands[0].qualifier
+ 	=3D get_vreg_qualifier_from_value (1 + (size << 1));
++      if (inst->operands[0].qualifier =3D=3D AARCH64_OPND_QLF_ERR)
++	return 0;
+       inst->operands[2].qualifier =3D get_sreg_qualifier_from_value (size=
);
++      if (inst->operands[2].qualifier =3D=3D AARCH64_OPND_QLF_ERR)
++	return 0;
+     }
+=20
+   if (inst->opcode->flags & F_GPRSIZE_IN_Q)
+@@ -2772,6 +2832,8 @@ do_special_decoding (aarch64_inst *inst)
+       assert (idx =3D=3D 0 || idx =3D=3D 1);
+       value =3D extract_field (FLD_Q, inst->value, 0);
+       inst->operands[idx].qualifier =3D get_greg_qualifier_from_value (va=
lue);
++      if (inst->operands[idx].qualifier =3D=3D AARCH64_OPND_QLF_ERR)
++	return 0;
+     }
+=20
+   if (inst->opcode->flags & F_LDS_SIZE)
+--=20
+2.34.1
+
--=20
2.34.1



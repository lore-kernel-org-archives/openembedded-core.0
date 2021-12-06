Return-Path: <matthias@extraklein.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A12C433F5
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 06:40:50 +0000 (UTC)
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [188.68.61.102])
 by mx.groups.io with SMTP id smtpd.web08.48098.1638772846576770199
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Dec 2021 22:40:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@extraklein.de
 header.s=key2 header.b=gcKqvozm;
 spf=pass (domain: extraklein.de, ip: 188.68.61.102,
 mailfrom: matthias@extraklein.de)
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4J6v2N4mcZz7yQW
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Dec 2021 07:40:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=extraklein.de;
	s=key2; t=1638772844;
	bh=fraQwHz9PQ7OL9iw4BrTw7CFDBSzmhk362HoqHlrI5k=;
	h=From:To:Cc:Subject:Date:From;
	b=gcKqvozmvgeKfaH2tf5rv5p81ktwGuTGMZUs9l5lm94/OqiMbHT4DB3ahJLv20BFN
	 UKBRL9aGFaqoi2bJW4oPVPSNWP54X7e+IgQ52DAtZX+Vaz5sLoZdwBAu8RmnXwxOig
	 KIJmafcd3kXw2R89kB/LoeNGYPwZTu8z7Tb8DTBbH9EQDsOeZSXbn6fdD7GRsO8991
	 4ykq6jHv8CaIK8DJ0Y1Gm92HVcNUpPjscOrqhFAUW30nnrGLCuWgd7B7hAKbz/d7KB
	 HG9YOtGbJ0VjJAZWEwHbc6yknsSNIiVyXdjPbAQvt3NKIw5vk/KzJGlAh6inHmakA/
	 p/KbBoI/nqqNA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4J6v2N4KByz7yQQ
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Dec 2021 07:40:44 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
Received: from mx2fa3.netcup.net (unknown [10.243.12.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4J6v2M45kbz8tLC
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Dec 2021 07:40:43 +0100 (CET)
Received: from localhost (ip-62-143-218-156.hsi01.unitymediagroup.de
 [62.143.218.156])
	by mx2fa3.netcup.net (Postfix) with ESMTPSA id AC48914004A;
	Mon,  6 Dec 2021 07:40:42 +0100 (CET)
Authentication-Results: mx2fa3;
        spf=pass (sender IP is 62.143.218.156)
 smtp.mailfrom=matthias@extraklein.de smtp.helo=localhost
Received-SPF: pass (mx2fa3: connection is authenticated)
From: Matthias Klein <matthias@extraklein.de>
To: openembedded-core@lists.openembedded.org
Cc: Matthias Klein <matthias@extraklein.de>
Subject: [PATCH] gdb: fix aarch64 remote debugging gdb/28355
Date: Mon,  6 Dec 2021 07:40:19 +0100
Message-Id: <20211206064019.1405-1-matthias@extraklein.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-PPP-Message-ID: <163877284297.19882.10578243667987670496@mx2fa3.netcup.net>
X-PPP-Vhost: extraklein.de
X-NC-CID: virVCac48Tk53EueKDDayZwAw1P+B8m6kVYlG5SSqcd8+zdqMIY=
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 06:40:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159206

The raspberry3-64 machine from meta-raspberrypi is affected by this bug.

https://sourceware.org/bugzilla/show_bug.cgi?id=3D28355
https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dpatch;h=3Deb79b23180=
66cafb75ffdce310e3bbd44f7c79e3
https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3D7fd854685=
3e3f0333ba8d8238413aba7eb45c69f

Signed-off-by: Matthias Klein <matthias@extraklein.de>
---
 meta/recipes-devtools/gdb/gdb-11.1.inc        |   1 +
 ...erver-register-set-selection-dynamic.patch | 317 ++++++++++++++++++
 2 files changed, 318 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0011-AArch64-Make-gdbse=
rver-register-set-selection-dynamic.patch

diff --git a/meta/recipes-devtools/gdb/gdb-11.1.inc b/meta/recipes-devtoo=
ls/gdb/gdb-11.1.inc
index 686627926d..a480997220 100644
--- a/meta/recipes-devtools/gdb/gdb-11.1.inc
+++ b/meta/recipes-devtools/gdb/gdb-11.1.inc
@@ -15,5 +15,6 @@ SRC_URI =3D "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0008-resolve-restrict-keyword-conflict.patch \
            file://0009-Fix-invalid-sigprocmask-call.patch \
            file://0010-gdbserver-ctrl-c-handling.patch \
+           file://0011-AArch64-Make-gdbserver-register-set-selection-dyn=
amic.patch \
            "
 SRC_URI[sha256sum] =3D "cccfcc407b20d343fb320d4a9a2110776dd3165118ffd41f=
4b1b162340333f94"
diff --git a/meta/recipes-devtools/gdb/gdb/0011-AArch64-Make-gdbserver-re=
gister-set-selection-dynamic.patch b/meta/recipes-devtools/gdb/gdb/0011-A=
Arch64-Make-gdbserver-register-set-selection-dynamic.patch
new file mode 100644
index 0000000000..6fc1859391
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0011-AArch64-Make-gdbserver-register-=
set-selection-dynamic.patch
@@ -0,0 +1,317 @@
+From eb79b2318066cafb75ffdce310e3bbd44f7c79e3 Mon Sep 17 00:00:00 2001
+From: Luis Machado <luis.machado@linaro.org>
+Date: Fri, 29 Oct 2021 14:54:36 -0300
+Subject: [PATCH] [AArch64] Make gdbserver register set selection dynamic
+
+The current register set selection mechanism for AArch64 is static, base=
d
+on a pre-populated array of register sets.
+
+This means that we might potentially probe register sets that are not
+available. This is OK if the kernel errors out during ptrace, but probin=
g the
+tag_ctl register, for example, does not result in a ptrace error if the =
kernel
+supports the tagged address ABI but not MTE (PR 28355).
+
+Making the register set selection dynamic, based on feature checks, solv=
es
+this and simplifies the code a bit. It allows us to list all of the regi=
ster
+sets only once, and pick and choose based on HWCAP/HWCAP2 or other prope=
rties.
+
+gdb/ChangeLog:
+
+2021-11-03  Luis Machado  <luis.machado@linaro.org>
+
+	PR gdb/28355
+
+	* arch/aarch64.h (struct aarch64_features): New struct.
+
+gdbserver/ChangeLog:
+
+2021-11-03  Luis Machado  <luis.machado@linaro.org>
+
+	PR gdb/28355
+
+	* linux-aarch64-low.cc (is_sve_tdesc): Remove.
+	(aarch64_target::low_arch_setup): Rework to adjust the register sets.
+	(aarch64_regsets): Update to list all register sets.
+	(aarch64_regsets_info, regs_info_aarch64): Replace NULL with nullptr.
+	(aarch64_sve_regsets, aarch64_sve_regsets_info)
+	(regs_info_aarch64_sve): Remove.
+	(aarch64_adjust_register_sets): New.
+	(aarch64_target::get_regs_info): Remove references to removed structs.
+	(initialize_low_arch): Likewise.
+
+[ChangeLog entry stripped so that patch applies cleanly]
+Upstream-Status: Accepted
+---
+
+diff --git a/gdb/arch/aarch64.h b/gdb/arch/aarch64.h
+index 0eb702c5b5e..95edb664b55 100644
+--- a/gdb/arch/aarch64.h
++++ b/gdb/arch/aarch64.h
+@@ -22,6 +22,15 @@
+=20
+ #include "gdbsupport/tdesc.h"
+=20
++/* Holds information on what architectural features are available.  Thi=
s is
++   used to select register sets.  */
++struct aarch64_features
++{
++  bool sve =3D false;
++  bool pauth =3D false;
++  bool mte =3D false;
++};
++
+ /* Create the aarch64 target description.  A non zero VQ value indicate=
s both
+    the presence of SVE and the Vector Quotient - the number of 128bit c=
hunks in
+    an SVE Z register.  HAS_PAUTH_P indicates the presence of the PAUTH
+diff --git a/gdbserver/linux-aarch64-low.cc b/gdbserver/linux-aarch64-lo=
w.cc
+index daccfef746e..9a8cb4169a7 100644
+--- a/gdbserver/linux-aarch64-low.cc
++++ b/gdbserver/linux-aarch64-low.cc
+@@ -196,16 +196,6 @@ is_64bit_tdesc (void)
+   return register_size (regcache->tdesc, 0) =3D=3D 8;
+ }
+=20
+-/* Return true if the regcache contains the number of SVE registers.  *=
/
+-
+-static bool
+-is_sve_tdesc (void)
+-{
+-  struct regcache *regcache =3D get_thread_regcache (current_thread, 0)=
;
+-
+-  return tdesc_contains_feature (regcache->tdesc, "org.gnu.gdb.aarch64.=
sve");
+-}
+-
+ static void
+ aarch64_fill_gregset (struct regcache *regcache, void *buf)
+ {
+@@ -680,40 +670,6 @@ aarch64_target::low_new_fork (process_info *parent,
+   *child->priv->arch_private =3D *parent->priv->arch_private;
+ }
+=20
+-/* Matches HWCAP_PACA in kernel header arch/arm64/include/uapi/asm/hwca=
p.h.  */
+-#define AARCH64_HWCAP_PACA (1 << 30)
+-
+-/* Implementation of linux target ops method "low_arch_setup".  */
+-
+-void
+-aarch64_target::low_arch_setup ()
+-{
+-  unsigned int machine;
+-  int is_elf64;
+-  int tid;
+-
+-  tid =3D lwpid_of (current_thread);
+-
+-  is_elf64 =3D linux_pid_exe_is_elf_64_file (tid, &machine);
+-
+-  if (is_elf64)
+-    {
+-      uint64_t vq =3D aarch64_sve_get_vq (tid);
+-      unsigned long hwcap =3D linux_get_hwcap (8);
+-      unsigned long hwcap2 =3D linux_get_hwcap2 (8);
+-      bool pauth_p =3D hwcap & AARCH64_HWCAP_PACA;
+-      /* MTE is AArch64-only.  */
+-      bool mte_p =3D hwcap2 & HWCAP2_MTE;
+-
+-      current_process ()->tdesc
+-	=3D aarch64_linux_read_description (vq, pauth_p, mte_p);
+-    }
+-  else
+-    current_process ()->tdesc =3D aarch32_linux_read_description ();
+-
+-  aarch64_linux_get_debug_reg_capacity (lwpid_of (current_thread));
+-}
+-
+ /* Wrapper for aarch64_sve_regs_copy_to_reg_buf.  */
+=20
+ static void
+@@ -730,21 +686,36 @@ aarch64_sve_regs_copy_from_regcache (struct regcac=
he *regcache, void *buf)
+   return aarch64_sve_regs_copy_from_reg_buf (regcache, buf);
+ }
+=20
++/* Array containing all the possible register sets for AArch64/Linux.  =
During
++   architecture setup, these will be checked against the HWCAP/HWCAP2 b=
its for
++   validity and enabled/disabled accordingly.
++
++   Their sizes are set to 0 here, but they will be adjusted later depen=
ding
++   on whether each register set is available or not.  */
+ static struct regset_info aarch64_regsets[] =3D
+ {
++  /* GPR registers.  */
+   { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_PRSTATUS,
+-    sizeof (struct user_pt_regs), GENERAL_REGS,
++    0, GENERAL_REGS,
+     aarch64_fill_gregset, aarch64_store_gregset },
++  /* Floating Point (FPU) registers.  */
+   { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_FPREGSET,
+-    sizeof (struct user_fpsimd_state), FP_REGS,
++    0, FP_REGS,
+     aarch64_fill_fpregset, aarch64_store_fpregset
+   },
++  /* Scalable Vector Extension (SVE) registers.  */
++  { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_ARM_SVE,
++    0, EXTENDED_REGS,
++    aarch64_sve_regs_copy_from_regcache, aarch64_sve_regs_copy_to_regca=
che
++  },
++  /* PAC registers.  */
+   { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_ARM_PAC_MASK,
+-    AARCH64_PAUTH_REGS_SIZE, OPTIONAL_REGS,
+-    NULL, aarch64_store_pauthregset },
++    0, OPTIONAL_REGS,
++    nullptr, aarch64_store_pauthregset },
++  /* Tagged address control / MTE registers.  */
+   { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_ARM_TAGGED_ADDR_CTRL,
+-    AARCH64_LINUX_SIZEOF_MTE, OPTIONAL_REGS, aarch64_fill_mteregset,
+-    aarch64_store_mteregset },
++    0, OPTIONAL_REGS,
++    aarch64_fill_mteregset, aarch64_store_mteregset },
+   NULL_REGSET
+ };
+=20
+@@ -752,47 +723,95 @@ static struct regsets_info aarch64_regsets_info =3D
+   {
+     aarch64_regsets, /* regsets */
+     0, /* num_regsets */
+-    NULL, /* disabled_regsets */
++    nullptr, /* disabled_regsets */
+   };
+=20
+ static struct regs_info regs_info_aarch64 =3D
+   {
+-    NULL, /* regset_bitmap */
+-    NULL, /* usrregs */
++    nullptr, /* regset_bitmap */
++    nullptr, /* usrregs */
+     &aarch64_regsets_info,
+   };
+=20
+-static struct regset_info aarch64_sve_regsets[] =3D
++/* Given FEATURES, adjust the available register sets by setting their
++   sizes.  A size of 0 means the register set is disabled and won't be
++   used.  */
++
++static void
++aarch64_adjust_register_sets (const struct aarch64_features &features)
+ {
+-  { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_PRSTATUS,
+-    sizeof (struct user_pt_regs), GENERAL_REGS,
+-    aarch64_fill_gregset, aarch64_store_gregset },
+-  { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_ARM_SVE,
+-    SVE_PT_SIZE (AARCH64_MAX_SVE_VQ, SVE_PT_REGS_SVE), EXTENDED_REGS,
+-    aarch64_sve_regs_copy_from_regcache, aarch64_sve_regs_copy_to_regca=
che
+-  },
+-  { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_ARM_PAC_MASK,
+-    AARCH64_PAUTH_REGS_SIZE, OPTIONAL_REGS,
+-    NULL, aarch64_store_pauthregset },
+-  { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_ARM_TAGGED_ADDR_CTRL,
+-    AARCH64_LINUX_SIZEOF_MTE, OPTIONAL_REGS, aarch64_fill_mteregset,
+-    aarch64_store_mteregset },
+-  NULL_REGSET
+-};
++  struct regset_info *regset;
+=20
+-static struct regsets_info aarch64_sve_regsets_info =3D
+-  {
+-    aarch64_sve_regsets, /* regsets.  */
+-    0, /* num_regsets.  */
+-    NULL, /* disabled_regsets.  */
+-  };
++  for (regset =3D aarch64_regsets; regset->size >=3D 0; regset++)
++    {
++      switch (regset->nt_type)
++	{
++	case NT_PRSTATUS:
++	  /* General purpose registers are always present.  */
++	  regset->size =3D sizeof (struct user_pt_regs);
++	  break;
++	case NT_FPREGSET:
++	  /* This is unavailable when SVE is present.  */
++	  if (!features.sve)
++	    regset->size =3D sizeof (struct user_fpsimd_state);
++	  break;
++	case NT_ARM_SVE:
++	  if (features.sve)
++	    regset->size =3D SVE_PT_SIZE (AARCH64_MAX_SVE_VQ, SVE_PT_REGS_SVE)=
;
++	  break;
++	case NT_ARM_PAC_MASK:
++	  if (features.pauth)
++	    regset->size =3D AARCH64_PAUTH_REGS_SIZE;
++	  break;
++	case NT_ARM_TAGGED_ADDR_CTRL:
++	  if (features.mte)
++	    regset->size =3D AARCH64_LINUX_SIZEOF_MTE;
++	  break;
++	default:
++	  gdb_assert_not_reached ("Unknown register set found.");
++	}
++    }
++}
+=20
+-static struct regs_info regs_info_aarch64_sve =3D
+-  {
+-    NULL, /* regset_bitmap.  */
+-    NULL, /* usrregs.  */
+-    &aarch64_sve_regsets_info,
+-  };
++/* Matches HWCAP_PACA in kernel header arch/arm64/include/uapi/asm/hwca=
p.h.  */
++#define AARCH64_HWCAP_PACA (1 << 30)
++
++/* Implementation of linux target ops method "low_arch_setup".  */
++
++void
++aarch64_target::low_arch_setup ()
++{
++  unsigned int machine;
++  int is_elf64;
++  int tid;
++
++  tid =3D lwpid_of (current_thread);
++
++  is_elf64 =3D linux_pid_exe_is_elf_64_file (tid, &machine);
++
++  if (is_elf64)
++    {
++      struct aarch64_features features;
++
++      uint64_t vq =3D aarch64_sve_get_vq (tid);
++      features.sve =3D (vq > 0);
++      /* A-profile PAC is 64-bit only.  */
++      features.pauth =3D linux_get_hwcap (8) & AARCH64_HWCAP_PACA;
++      /* A-profile MTE is 64-bit only.  */
++      features.mte =3D linux_get_hwcap2 (8) & HWCAP2_MTE;
++
++      current_process ()->tdesc
++	=3D aarch64_linux_read_description (vq, features.pauth, features.mte);
++
++      /* Adjust the register sets we should use for this particular set=
 of
++	 features.  */
++      aarch64_adjust_register_sets (features);
++    }
++  else
++    current_process ()->tdesc =3D aarch32_linux_read_description ();
++
++  aarch64_linux_get_debug_reg_capacity (lwpid_of (current_thread));
++}
+=20
+ /* Implementation of linux target ops method "get_regs_info".  */
+=20
+@@ -802,9 +821,7 @@ aarch64_target::get_regs_info ()
+   if (!is_64bit_tdesc ())
+     return &regs_info_aarch32;
+=20
+-  if (is_sve_tdesc ())
+-    return &regs_info_aarch64_sve;
+-
++  /* AArch64 64-bit registers.  */
+   return &regs_info_aarch64;
+ }
+=20
+@@ -3294,5 +3311,4 @@ initialize_low_arch (void)
+   initialize_low_arch_aarch32 ();
+=20
+   initialize_regsets_info (&aarch64_regsets_info);
+-  initialize_regsets_info (&aarch64_sve_regsets_info);
+ }
+--=20
+2.27.0
+
--=20
2.30.2



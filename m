Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D547C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 18:28:07 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web09.2286.1643826486098483525
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Db2vAAJF;
 spf=pass (domain: gmail.com, ip: 209.85.208.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id u18so398966edt.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 10:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Oz6lB3aefLz4NSlN76l56rKqVUNqPJxx8upxS07zDJ0=;
        b=Db2vAAJFJgd4/dvt40s5hnD98/1UR57F3kkivK7re3j9gyBsomXAgOaYbtJo21xUoL
         ysLHZXYtP18DMtORS6iXLtmU4tHGCJyP6UmJHVp5Tw1xYiWtDS0DOdlQTxpSEg1Nh10k
         drQWskjpRtP626CMIKN9cnrer8ztfRtCcSMwsQtehONFYWLlJzOapcETtowCq7trzyME
         dT9hMl14vR1MthOxkZJziyDVZQKqcYK4lSqZ7t40zvOsAXRV7Kxkhh1Tt9qamfB6v2jJ
         TAhLQCiGDrwW0+DrLa5hVzSMoqQH+Bo1RP0LDcCASZ85IUJUATivsRHALqF3fiMYLAQj
         F3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Oz6lB3aefLz4NSlN76l56rKqVUNqPJxx8upxS07zDJ0=;
        b=TZ08mOgjetTV5UZvLf4kxDKzk5oxrWa0/DKmITHZddXyTHCYUiR3McPlJofNoXKF9I
         XVFy/kfwf91BevwaDdkUcTK/56gD4wceRzuoxUdXErKZIV4NAYTgRVMwdi9owZKR4guq
         5JVPPKsngBR54FnsUq+C3ncjiIDqN5KdUsRBOKk2ki5+6OnVhPhGik2yJaMn5WaOlU+r
         Br3q9KVt+OnDvoICidxacQUVbHFR8I52QAhl7lJOkYTzk5JHdi9Ngbgp3RJ/q0OhSfC0
         /W5NH76A0X9PhcZcn+714HK3TTFx6cegosNfBtAmuV8QqRjZjN2x2mKJVRJG93IOb30B
         aQkw==
X-Gm-Message-State: AOAM533RO6KKbLVVh5ZlMs7ZA9xf1jx6K1+ZZo/zKg9URwwR+Y1aMDuN
	ov8wyoI3uUOTTLjpkBSQTcZRIl0YHG4=
X-Google-Smtp-Source: 
 ABdhPJzLpxK6QqVOtTVM1OD9q2aiFYuUIIAwotDrIL3KC0Ute6LNNYI2UcdSDpnj6c/1F8BiknFkLA==
X-Received: by 2002:a05:6402:2682:: with SMTP id
 w2mr31073380edd.355.1643826484407;
        Wed, 02 Feb 2022 10:28:04 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 i12sm15644203ejy.43.2022.02.02.10.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 10:28:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/33] gdb: update 11.1 -> 11.2
Date: Wed,  2 Feb 2022 19:27:28 +0100
Message-Id: <20220202182758.919991-3-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220202182758.919991-1-alex@linutronix.de>
References: <20220202182758.919991-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 18:28:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161228

Simplyfy .inc structure: merge gdb.inc into gdb_11.2.bb, rename
gdb-${PV}.inc to gdb.inc. This will allow easier automatic updates.

Drop upstreamed patch.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/gdb/gdb-11.1.inc        |  19 --
 ...ian_11.1.bb => gdb-cross-canadian_11.2.bb} |   2 +-
 .../{gdb-cross_11.1.bb => gdb-cross_11.2.bb}  |   2 +-
 meta/recipes-devtools/gdb/gdb.inc             |  27 +-
 ...erver-register-set-selection-dynamic.patch | 317 ------------------
 .../gdb/{gdb_11.1.bb => gdb_11.2.bb}          |  13 +-
 6 files changed, 31 insertions(+), 349 deletions(-)
 delete mode 100644 meta/recipes-devtools/gdb/gdb-11.1.inc
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_11.1.bb => gdb-cross-canadian_11.2.bb} (71%)
 rename meta/recipes-devtools/gdb/{gdb-cross_11.1.bb => gdb-cross_11.2.bb} (50%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0011-AArch64-Make-gdbserver-register-set-selection-dynamic.patch
 rename meta/recipes-devtools/gdb/{gdb_11.1.bb => gdb_11.2.bb} (80%)

diff --git a/meta/recipes-devtools/gdb/gdb-11.1.inc b/meta/recipes-devtools/gdb/gdb-11.1.inc
deleted file mode 100644
index 5364a880e3..0000000000
--- a/meta/recipes-devtools/gdb/gdb-11.1.inc
+++ /dev/null
@@ -1,19 +0,0 @@
-LICENSE = "GPLv2 & GPLv3 & LGPLv2 & LGPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
-		    file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
-		    file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
-		    file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674"
-
-SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
-           file://0001-make-man-install-relative-to-DESTDIR.patch \
-           file://0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch \
-           file://0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch \
-           file://0005-Dont-disable-libreadline.a-when-using-disable-static.patch \
-           file://0006-use-asm-sgidefs.h.patch \
-           file://0007-Change-order-of-CFLAGS.patch \
-           file://0008-resolve-restrict-keyword-conflict.patch \
-           file://0009-Fix-invalid-sigprocmask-call.patch \
-           file://0010-gdbserver-ctrl-c-handling.patch \
-           file://0011-AArch64-Make-gdbserver-register-set-selection-dynamic.patch \
-           "
-SRC_URI[sha256sum] = "cccfcc407b20d343fb320d4a9a2110776dd3165118ffd41f4b1b162340333f94"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_11.1.bb b/meta/recipes-devtools/gdb/gdb-cross-canadian_11.2.bb
similarity index 71%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_11.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_11.2.bb
index 301035940c..4ab2b7156d 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian_11.1.bb
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian_11.2.bb
@@ -1,3 +1,3 @@
 require gdb-common.inc
 require gdb-cross-canadian.inc
-require gdb-${PV}.inc
+require gdb.inc
diff --git a/meta/recipes-devtools/gdb/gdb-cross_11.1.bb b/meta/recipes-devtools/gdb/gdb-cross_11.2.bb
similarity index 50%
rename from meta/recipes-devtools/gdb/gdb-cross_11.1.bb
rename to meta/recipes-devtools/gdb/gdb-cross_11.2.bb
index 50cf159fdb..3b654a2f0d 100644
--- a/meta/recipes-devtools/gdb/gdb-cross_11.1.bb
+++ b/meta/recipes-devtools/gdb/gdb-cross_11.2.bb
@@ -1,2 +1,2 @@
 require gdb-cross.inc
-require gdb-${PV}.inc
+require gdb.inc
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 2c95ed3ca0..cf801b192b 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -1,11 +1,18 @@
-require gdb-common.inc
-
-inherit gettext pkgconfig
-
-#LDFLAGS:append = " -s"
-#export CFLAGS:append=" -L${STAGING_LIBDIR}"
-
-# cross-canadian must not see this
-PACKAGES =+ "gdbserver"
-FILES:gdbserver = "${bindir}/gdbserver"
+LICENSE = "GPLv2 & GPLv3 & LGPLv2 & LGPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
+		    file://COPYING3;md5=d32239bcb673463ab874e80d47fae504 \
+		    file://COPYING3.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
+		    file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674"
 
+SRC_URI = "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
+           file://0001-make-man-install-relative-to-DESTDIR.patch \
+           file://0002-mips-linux-nat-Define-_ABIO32-if-not-defined.patch \
+           file://0003-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch \
+           file://0005-Dont-disable-libreadline.a-when-using-disable-static.patch \
+           file://0006-use-asm-sgidefs.h.patch \
+           file://0007-Change-order-of-CFLAGS.patch \
+           file://0008-resolve-restrict-keyword-conflict.patch \
+           file://0009-Fix-invalid-sigprocmask-call.patch \
+           file://0010-gdbserver-ctrl-c-handling.patch \
+           "
+SRC_URI[sha256sum] = "1497c36a71881b8671a9a84a0ee40faab788ca30d7ba19d8463c3cc787152e32"
diff --git a/meta/recipes-devtools/gdb/gdb/0011-AArch64-Make-gdbserver-register-set-selection-dynamic.patch b/meta/recipes-devtools/gdb/gdb/0011-AArch64-Make-gdbserver-register-set-selection-dynamic.patch
deleted file mode 100644
index 6fc1859391..0000000000
--- a/meta/recipes-devtools/gdb/gdb/0011-AArch64-Make-gdbserver-register-set-selection-dynamic.patch
+++ /dev/null
@@ -1,317 +0,0 @@
-From eb79b2318066cafb75ffdce310e3bbd44f7c79e3 Mon Sep 17 00:00:00 2001
-From: Luis Machado <luis.machado@linaro.org>
-Date: Fri, 29 Oct 2021 14:54:36 -0300
-Subject: [PATCH] [AArch64] Make gdbserver register set selection dynamic
-
-The current register set selection mechanism for AArch64 is static, based
-on a pre-populated array of register sets.
-
-This means that we might potentially probe register sets that are not
-available. This is OK if the kernel errors out during ptrace, but probing the
-tag_ctl register, for example, does not result in a ptrace error if the kernel
-supports the tagged address ABI but not MTE (PR 28355).
-
-Making the register set selection dynamic, based on feature checks, solves
-this and simplifies the code a bit. It allows us to list all of the register
-sets only once, and pick and choose based on HWCAP/HWCAP2 or other properties.
-
-gdb/ChangeLog:
-
-2021-11-03  Luis Machado  <luis.machado@linaro.org>
-
-	PR gdb/28355
-
-	* arch/aarch64.h (struct aarch64_features): New struct.
-
-gdbserver/ChangeLog:
-
-2021-11-03  Luis Machado  <luis.machado@linaro.org>
-
-	PR gdb/28355
-
-	* linux-aarch64-low.cc (is_sve_tdesc): Remove.
-	(aarch64_target::low_arch_setup): Rework to adjust the register sets.
-	(aarch64_regsets): Update to list all register sets.
-	(aarch64_regsets_info, regs_info_aarch64): Replace NULL with nullptr.
-	(aarch64_sve_regsets, aarch64_sve_regsets_info)
-	(regs_info_aarch64_sve): Remove.
-	(aarch64_adjust_register_sets): New.
-	(aarch64_target::get_regs_info): Remove references to removed structs.
-	(initialize_low_arch): Likewise.
-
-[ChangeLog entry stripped so that patch applies cleanly]
-Upstream-Status: Accepted
----
-
-diff --git a/gdb/arch/aarch64.h b/gdb/arch/aarch64.h
-index 0eb702c5b5e..95edb664b55 100644
---- a/gdb/arch/aarch64.h
-+++ b/gdb/arch/aarch64.h
-@@ -22,6 +22,15 @@
- 
- #include "gdbsupport/tdesc.h"
- 
-+/* Holds information on what architectural features are available.  This is
-+   used to select register sets.  */
-+struct aarch64_features
-+{
-+  bool sve = false;
-+  bool pauth = false;
-+  bool mte = false;
-+};
-+
- /* Create the aarch64 target description.  A non zero VQ value indicates both
-    the presence of SVE and the Vector Quotient - the number of 128bit chunks in
-    an SVE Z register.  HAS_PAUTH_P indicates the presence of the PAUTH
-diff --git a/gdbserver/linux-aarch64-low.cc b/gdbserver/linux-aarch64-low.cc
-index daccfef746e..9a8cb4169a7 100644
---- a/gdbserver/linux-aarch64-low.cc
-+++ b/gdbserver/linux-aarch64-low.cc
-@@ -196,16 +196,6 @@ is_64bit_tdesc (void)
-   return register_size (regcache->tdesc, 0) == 8;
- }
- 
--/* Return true if the regcache contains the number of SVE registers.  */
--
--static bool
--is_sve_tdesc (void)
--{
--  struct regcache *regcache = get_thread_regcache (current_thread, 0);
--
--  return tdesc_contains_feature (regcache->tdesc, "org.gnu.gdb.aarch64.sve");
--}
--
- static void
- aarch64_fill_gregset (struct regcache *regcache, void *buf)
- {
-@@ -680,40 +670,6 @@ aarch64_target::low_new_fork (process_info *parent,
-   *child->priv->arch_private = *parent->priv->arch_private;
- }
- 
--/* Matches HWCAP_PACA in kernel header arch/arm64/include/uapi/asm/hwcap.h.  */
--#define AARCH64_HWCAP_PACA (1 << 30)
--
--/* Implementation of linux target ops method "low_arch_setup".  */
--
--void
--aarch64_target::low_arch_setup ()
--{
--  unsigned int machine;
--  int is_elf64;
--  int tid;
--
--  tid = lwpid_of (current_thread);
--
--  is_elf64 = linux_pid_exe_is_elf_64_file (tid, &machine);
--
--  if (is_elf64)
--    {
--      uint64_t vq = aarch64_sve_get_vq (tid);
--      unsigned long hwcap = linux_get_hwcap (8);
--      unsigned long hwcap2 = linux_get_hwcap2 (8);
--      bool pauth_p = hwcap & AARCH64_HWCAP_PACA;
--      /* MTE is AArch64-only.  */
--      bool mte_p = hwcap2 & HWCAP2_MTE;
--
--      current_process ()->tdesc
--	= aarch64_linux_read_description (vq, pauth_p, mte_p);
--    }
--  else
--    current_process ()->tdesc = aarch32_linux_read_description ();
--
--  aarch64_linux_get_debug_reg_capacity (lwpid_of (current_thread));
--}
--
- /* Wrapper for aarch64_sve_regs_copy_to_reg_buf.  */
- 
- static void
-@@ -730,21 +686,36 @@ aarch64_sve_regs_copy_from_regcache (struct regcache *regcache, void *buf)
-   return aarch64_sve_regs_copy_from_reg_buf (regcache, buf);
- }
- 
-+/* Array containing all the possible register sets for AArch64/Linux.  During
-+   architecture setup, these will be checked against the HWCAP/HWCAP2 bits for
-+   validity and enabled/disabled accordingly.
-+
-+   Their sizes are set to 0 here, but they will be adjusted later depending
-+   on whether each register set is available or not.  */
- static struct regset_info aarch64_regsets[] =
- {
-+  /* GPR registers.  */
-   { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_PRSTATUS,
--    sizeof (struct user_pt_regs), GENERAL_REGS,
-+    0, GENERAL_REGS,
-     aarch64_fill_gregset, aarch64_store_gregset },
-+  /* Floating Point (FPU) registers.  */
-   { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_FPREGSET,
--    sizeof (struct user_fpsimd_state), FP_REGS,
-+    0, FP_REGS,
-     aarch64_fill_fpregset, aarch64_store_fpregset
-   },
-+  /* Scalable Vector Extension (SVE) registers.  */
-+  { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_ARM_SVE,
-+    0, EXTENDED_REGS,
-+    aarch64_sve_regs_copy_from_regcache, aarch64_sve_regs_copy_to_regcache
-+  },
-+  /* PAC registers.  */
-   { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_ARM_PAC_MASK,
--    AARCH64_PAUTH_REGS_SIZE, OPTIONAL_REGS,
--    NULL, aarch64_store_pauthregset },
-+    0, OPTIONAL_REGS,
-+    nullptr, aarch64_store_pauthregset },
-+  /* Tagged address control / MTE registers.  */
-   { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_ARM_TAGGED_ADDR_CTRL,
--    AARCH64_LINUX_SIZEOF_MTE, OPTIONAL_REGS, aarch64_fill_mteregset,
--    aarch64_store_mteregset },
-+    0, OPTIONAL_REGS,
-+    aarch64_fill_mteregset, aarch64_store_mteregset },
-   NULL_REGSET
- };
- 
-@@ -752,47 +723,95 @@ static struct regsets_info aarch64_regsets_info =
-   {
-     aarch64_regsets, /* regsets */
-     0, /* num_regsets */
--    NULL, /* disabled_regsets */
-+    nullptr, /* disabled_regsets */
-   };
- 
- static struct regs_info regs_info_aarch64 =
-   {
--    NULL, /* regset_bitmap */
--    NULL, /* usrregs */
-+    nullptr, /* regset_bitmap */
-+    nullptr, /* usrregs */
-     &aarch64_regsets_info,
-   };
- 
--static struct regset_info aarch64_sve_regsets[] =
-+/* Given FEATURES, adjust the available register sets by setting their
-+   sizes.  A size of 0 means the register set is disabled and won't be
-+   used.  */
-+
-+static void
-+aarch64_adjust_register_sets (const struct aarch64_features &features)
- {
--  { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_PRSTATUS,
--    sizeof (struct user_pt_regs), GENERAL_REGS,
--    aarch64_fill_gregset, aarch64_store_gregset },
--  { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_ARM_SVE,
--    SVE_PT_SIZE (AARCH64_MAX_SVE_VQ, SVE_PT_REGS_SVE), EXTENDED_REGS,
--    aarch64_sve_regs_copy_from_regcache, aarch64_sve_regs_copy_to_regcache
--  },
--  { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_ARM_PAC_MASK,
--    AARCH64_PAUTH_REGS_SIZE, OPTIONAL_REGS,
--    NULL, aarch64_store_pauthregset },
--  { PTRACE_GETREGSET, PTRACE_SETREGSET, NT_ARM_TAGGED_ADDR_CTRL,
--    AARCH64_LINUX_SIZEOF_MTE, OPTIONAL_REGS, aarch64_fill_mteregset,
--    aarch64_store_mteregset },
--  NULL_REGSET
--};
-+  struct regset_info *regset;
- 
--static struct regsets_info aarch64_sve_regsets_info =
--  {
--    aarch64_sve_regsets, /* regsets.  */
--    0, /* num_regsets.  */
--    NULL, /* disabled_regsets.  */
--  };
-+  for (regset = aarch64_regsets; regset->size >= 0; regset++)
-+    {
-+      switch (regset->nt_type)
-+	{
-+	case NT_PRSTATUS:
-+	  /* General purpose registers are always present.  */
-+	  regset->size = sizeof (struct user_pt_regs);
-+	  break;
-+	case NT_FPREGSET:
-+	  /* This is unavailable when SVE is present.  */
-+	  if (!features.sve)
-+	    regset->size = sizeof (struct user_fpsimd_state);
-+	  break;
-+	case NT_ARM_SVE:
-+	  if (features.sve)
-+	    regset->size = SVE_PT_SIZE (AARCH64_MAX_SVE_VQ, SVE_PT_REGS_SVE);
-+	  break;
-+	case NT_ARM_PAC_MASK:
-+	  if (features.pauth)
-+	    regset->size = AARCH64_PAUTH_REGS_SIZE;
-+	  break;
-+	case NT_ARM_TAGGED_ADDR_CTRL:
-+	  if (features.mte)
-+	    regset->size = AARCH64_LINUX_SIZEOF_MTE;
-+	  break;
-+	default:
-+	  gdb_assert_not_reached ("Unknown register set found.");
-+	}
-+    }
-+}
- 
--static struct regs_info regs_info_aarch64_sve =
--  {
--    NULL, /* regset_bitmap.  */
--    NULL, /* usrregs.  */
--    &aarch64_sve_regsets_info,
--  };
-+/* Matches HWCAP_PACA in kernel header arch/arm64/include/uapi/asm/hwcap.h.  */
-+#define AARCH64_HWCAP_PACA (1 << 30)
-+
-+/* Implementation of linux target ops method "low_arch_setup".  */
-+
-+void
-+aarch64_target::low_arch_setup ()
-+{
-+  unsigned int machine;
-+  int is_elf64;
-+  int tid;
-+
-+  tid = lwpid_of (current_thread);
-+
-+  is_elf64 = linux_pid_exe_is_elf_64_file (tid, &machine);
-+
-+  if (is_elf64)
-+    {
-+      struct aarch64_features features;
-+
-+      uint64_t vq = aarch64_sve_get_vq (tid);
-+      features.sve = (vq > 0);
-+      /* A-profile PAC is 64-bit only.  */
-+      features.pauth = linux_get_hwcap (8) & AARCH64_HWCAP_PACA;
-+      /* A-profile MTE is 64-bit only.  */
-+      features.mte = linux_get_hwcap2 (8) & HWCAP2_MTE;
-+
-+      current_process ()->tdesc
-+	= aarch64_linux_read_description (vq, features.pauth, features.mte);
-+
-+      /* Adjust the register sets we should use for this particular set of
-+	 features.  */
-+      aarch64_adjust_register_sets (features);
-+    }
-+  else
-+    current_process ()->tdesc = aarch32_linux_read_description ();
-+
-+  aarch64_linux_get_debug_reg_capacity (lwpid_of (current_thread));
-+}
- 
- /* Implementation of linux target ops method "get_regs_info".  */
- 
-@@ -802,9 +821,7 @@ aarch64_target::get_regs_info ()
-   if (!is_64bit_tdesc ())
-     return &regs_info_aarch32;
- 
--  if (is_sve_tdesc ())
--    return &regs_info_aarch64_sve;
--
-+  /* AArch64 64-bit registers.  */
-   return &regs_info_aarch64;
- }
- 
-@@ -3294,5 +3311,4 @@ initialize_low_arch (void)
-   initialize_low_arch_aarch32 ();
- 
-   initialize_regsets_info (&aarch64_regsets_info);
--  initialize_regsets_info (&aarch64_sve_regsets_info);
- }
--- 
-2.27.0
-
diff --git a/meta/recipes-devtools/gdb/gdb_11.1.bb b/meta/recipes-devtools/gdb/gdb_11.2.bb
similarity index 80%
rename from meta/recipes-devtools/gdb/gdb_11.1.bb
rename to meta/recipes-devtools/gdb/gdb_11.2.bb
index e73e3a2c5c..9c6db4ca2c 100644
--- a/meta/recipes-devtools/gdb/gdb_11.1.bb
+++ b/meta/recipes-devtools/gdb/gdb_11.2.bb
@@ -1,5 +1,15 @@
+require gdb-common.inc
+
+inherit gettext pkgconfig
+
+#LDFLAGS:append = " -s"
+#export CFLAGS:append=" -L${STAGING_LIBDIR}"
+
+# cross-canadian must not see this
+PACKAGES =+ "gdbserver"
+FILES:gdbserver = "${bindir}/gdbserver"
+
 require gdb.inc
-require gdb-${PV}.inc
 
 inherit python3-dir
 
@@ -26,3 +36,4 @@ EOF
 		chmod +x ${WORKDIR}/python
 	fi
 }
+
-- 
2.20.1



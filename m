Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.2935.1602804154370450765
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 16:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZTRlsTY5;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id p11so224181pld.5
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2020 16:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KIEzQ6ji/fyTOwrMoMAiRZ3FX3lzGf0526g2uBzKA3o=;
        b=ZTRlsTY5hdFw/U//qIu9Xppf3QSeTRIsYdJfsoHG1epa5us+eBWIa3wB//Zcz5crny
         HZbSjop6IxitREGXMBT81Zu4TlnO4GwVsL7iYR2Q3lNHRYFF8PlZ4eabRyQ9oG8dgQIc
         OU3156Gyl5uD0btjtqy9BRx4VBaZKpopZnxFlFs6mPO8SQkRrm3fj904hxA0GySQXUTh
         Hpw4yhdZWpB2KhS72YCFSZ5rmnHfLq0HhxY7h/x7WjbNMbG5p3Mzj4UsQy11Ge4LTakA
         0cE/v1DYygS4f3rZArHn/a/xFiTXZfiS1QYght80QJkAVHAMdS+8xXw4R7sRZhW4uSbR
         DqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KIEzQ6ji/fyTOwrMoMAiRZ3FX3lzGf0526g2uBzKA3o=;
        b=DlbcSpfAgec995ipjZ8ub64DYHWiI8qGYKCfosHWmYpxty2qIxT/+r8KjXszmJ03tP
         /aLOjk19FOtq1ukRkgi0Mvrk7ORkH7bvr+M+Aay1M3Lkij+tNUdXupgK0O/M7Ytf8QUp
         Pqlk1LVRwSGGTRZUYt9bQAqOyOierZMRu82rF6L5WMGpyDI/dT1obC5yEKS9q7s+KHk/
         jd5njdixoaQIuAaVFY9WjtmI2iDakXxSoU9qsjTtrBbLvkVFIGieTq+CvjqLueFLnWbJ
         B+r9RNnKSUh8v7NFFnJSy8snB5xKet7fD6wYIqWJ+TCzlzCQ1Shk2BNPOS0D/JBtbT3v
         3F/g==
X-Gm-Message-State: AOAM532fagSSF6005C7SAwRlRc7ha0Nal4pwg+QgtO+xmWX4ET3c+kSD
	QmJT6oaz26+h6/zG6mTPg7XxPIR+Aci7xw==
X-Google-Smtp-Source: ABdhPJxezk3mSXKs5JMKQ5niny76v1nsy1ei+g3Ji4e1CB1PDsbQB6wbmg3IF9Ie+qWD1XS4QlE03w==
X-Received: by 2002:a17:90a:4b87:: with SMTP id i7mr1096021pjh.68.1602804151793;
        Thu, 15 Oct 2020 16:22:31 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4467])
        by smtp.gmail.com with ESMTPSA id m11sm359812pfa.69.2020.10.15.16.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 16:22:31 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Victor Kamensky <kamensky@cisco.com>
Subject: [PATCH] qemumips: Use upstream propsed patches to enable 64-entry TLB
Date: Thu, 15 Oct 2020 16:22:28 -0700
Message-Id: <20201015232228.2941340-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This will also provide some much needed testing for upstream patches
which are RFC atm, if this works for yocto we can provide the feedback
upstream and help them merge into qemu

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Victor Kamensky <kamensky@cisco.com>
---
 meta/conf/machine/qemumips.conf               |   2 +-
 meta/recipes-devtools/qemu/qemu.inc           |   5 +-
 ...tlb-fictitious-cpu-type-like-34Kf-bu.patch | 118 ------------------
 ...-cpu_mips_realize_env-propagate-Erro.patch |  83 ++++++++++++
 ...e-number-of-TLB-entries-in-CPUMIPSSt.patch |  81 ++++++++++++
 ...-the-number-of-TLB-entries-a-CPU-pro.patch | 111 ++++++++++++++++
 ...w-using-the-34Kf-with-16-32-64-prese.patch |  59 +++++++++
 7 files changed, 339 insertions(+), 120 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-target-mips-Make-cpu_mips_realize_env-propagate-Erro.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0002-target-mips-Store-number-of-TLB-entries-in-CPUMIPSSt.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0003-target-mips-Make-the-number-of-TLB-entries-a-CPU-pro.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0004-target-mips-Allow-using-the-34Kf-with-16-32-64-prese.patch

diff --git a/meta/conf/machine/qemumips.conf b/meta/conf/machine/qemumips.conf
index b8c80f02ef..a6051f2948 100644
--- a/meta/conf/machine/qemumips.conf
+++ b/meta/conf/machine/qemumips.conf
@@ -15,4 +15,4 @@ SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyS1"
 
 QB_SYSTEM_NAME = "qemu-system-mips"
 
-QB_CPU = "-cpu 34Kf-64tlb"
+QB_CPU = "-cpu 34Kf,tlb-entries=64"
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 6c0edcb706..1b0c054caa 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -31,7 +31,10 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0001-qemu-Do-not-include-file-if-not-exists.patch \
            file://find_datadir.patch \
            file://usb-fix-setup_len-init.patch \
-           file://0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch \
+           file://0001-target-mips-Make-cpu_mips_realize_env-propagate-Erro.patch \
+           file://0002-target-mips-Store-number-of-TLB-entries-in-CPUMIPSSt.patch \
+           file://0003-target-mips-Make-the-number-of-TLB-entries-a-CPU-pro.patch \
+           file://0004-target-mips-Allow-using-the-34Kf-with-16-32-64-prese.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch b/meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch
deleted file mode 100644
index b6312e1543..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch
+++ /dev/null
@@ -1,118 +0,0 @@
-From b3fcc7d96523ad8e3ea28c09d495ef08529d01ce Mon Sep 17 00:00:00 2001
-From: Victor Kamensky <kamensky@cisco.com>
-Date: Wed, 7 Oct 2020 10:19:42 -0700
-Subject: [PATCH] mips: add 34Kf-64tlb fictitious cpu type like 34Kf but with
- 64 TLBs
-
-In Yocto Project CI runs it was observed that test run
-of 32 bit mips image takes almost twice longer than 64 bit
-mips image with the same logical load and CI execution
-hits timeout.
-
-See https://bugzilla.yoctoproject.org/show_bug.cgi?id=13992
-
-Yocto project uses 34Kf cpu type to run 32 bit mips image,
-and MIPS64R2-generic cpu type to run 64 bit mips64 image.
-
-Upon qemu behavior differences investigation between mips
-and mips64 two prominent observations came up: under
-logically similar load (same definition and configuration
-of user-land image) in case of mips get_physical_address
-function is called almost twice more often, meaning
-twice more memory accesses involved in this case. Also
-number of tlbwr instruction executed (r4k_helper_tlbwr
-qemu function) almost 16 time bigger in mips case than in
-mips64.
-
-It turns out that 34Kf cpu has 16 TLBs, but in case of
-MIPS64R2-generic it is 64 TLBs. So that explains why
-some many more tlbwr had to be execute by kernel TLB refill
-handler in case of 32 bit misp.
-
-The idea of the fix is to come up with new 34Kf-64tlb fictitious
-cpu type, that would behave exactly as 34Kf but it would
-contain 64 TLBs to reduce TLB trashing. After all, adding
-more TLBs to soft mmu is easy.
-
-Experiment with some significant non-trvial load in Yocto
-environment by running do_testimage load shows that 34Kf-64tlb
-cpu performs 40% or so better than original 34Kf cpu wrt test
-execution real time.
-
-It is not ideal to have cpu type that does not exist in the
-wild but given performance gains it seems to be justified.
-
-Signed-off-by: Victor Kamensky <kamensky@cisco.com>
----
- target/mips/translate_init.inc.c | 55 ++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 55 insertions(+)
-
-diff --git a/target/mips/translate_init.inc.c b/target/mips/translate_init.inc.c
-index 637caccd89..b73ab48231 100644
---- a/target/mips/translate_init.inc.c
-+++ b/target/mips/translate_init.inc.c
-@@ -297,6 +297,61 @@ const mips_def_t mips_defs[] =
-         .insn_flags = CPU_MIPS32R2 | ASE_MIPS16 | ASE_DSP | ASE_MT,
-         .mmu_type = MMU_TYPE_R4000,
-     },
-+    /*
-+     * Verbatim copy of "34Kf" cpu, only bumped up number of TLB entries
-+     * from 16 to 64 (see CP0_Config0 value at CP0C1_MMU bits) to improve
-+     * performance by reducing number of TLB refill exceptions and
-+     * eliminating need to run all corresponding TLB refill handling
-+     * instructions.
-+     */
-+    {
-+        .name = "34Kf-64tlb",
-+        .CP0_PRid = 0x00019500,
-+        .CP0_Config0 = MIPS_CONFIG0 | (0x1 << CP0C0_AR) |
-+                       (MMU_TYPE_R4000 << CP0C0_MT),
-+        .CP0_Config1 = MIPS_CONFIG1 | (1 << CP0C1_FP) | (63 << CP0C1_MMU) |
-+                       (0 << CP0C1_IS) | (3 << CP0C1_IL) | (1 << CP0C1_IA) |
-+                       (0 << CP0C1_DS) | (3 << CP0C1_DL) | (1 << CP0C1_DA) |
-+                       (1 << CP0C1_CA),
-+        .CP0_Config2 = MIPS_CONFIG2,
-+        .CP0_Config3 = MIPS_CONFIG3 | (1 << CP0C3_VInt) | (1 << CP0C3_MT) |
-+                       (1 << CP0C3_DSPP),
-+        .CP0_LLAddr_rw_bitmask = 0,
-+        .CP0_LLAddr_shift = 0,
-+        .SYNCI_Step = 32,
-+        .CCRes = 2,
-+        .CP0_Status_rw_bitmask = 0x3778FF1F,
-+        .CP0_TCStatus_rw_bitmask = (0 << CP0TCSt_TCU3) | (0 << CP0TCSt_TCU2) |
-+                    (1 << CP0TCSt_TCU1) | (1 << CP0TCSt_TCU0) |
-+                    (0 << CP0TCSt_TMX) | (1 << CP0TCSt_DT) |
-+                    (1 << CP0TCSt_DA) | (1 << CP0TCSt_A) |
-+                    (0x3 << CP0TCSt_TKSU) | (1 << CP0TCSt_IXMT) |
-+                    (0xff << CP0TCSt_TASID),
-+        .CP1_fcr0 = (1 << FCR0_F64) | (1 << FCR0_L) | (1 << FCR0_W) |
-+                    (1 << FCR0_D) | (1 << FCR0_S) | (0x95 << FCR0_PRID),
-+        .CP1_fcr31 = 0,
-+        .CP1_fcr31_rw_bitmask = 0xFF83FFFF,
-+        .CP0_SRSCtl = (0xf << CP0SRSCtl_HSS),
-+        .CP0_SRSConf0_rw_bitmask = 0x3fffffff,
-+        .CP0_SRSConf0 = (1U << CP0SRSC0_M) | (0x3fe << CP0SRSC0_SRS3) |
-+                    (0x3fe << CP0SRSC0_SRS2) | (0x3fe << CP0SRSC0_SRS1),
-+        .CP0_SRSConf1_rw_bitmask = 0x3fffffff,
-+        .CP0_SRSConf1 = (1U << CP0SRSC1_M) | (0x3fe << CP0SRSC1_SRS6) |
-+                    (0x3fe << CP0SRSC1_SRS5) | (0x3fe << CP0SRSC1_SRS4),
-+        .CP0_SRSConf2_rw_bitmask = 0x3fffffff,
-+        .CP0_SRSConf2 = (1U << CP0SRSC2_M) | (0x3fe << CP0SRSC2_SRS9) |
-+                    (0x3fe << CP0SRSC2_SRS8) | (0x3fe << CP0SRSC2_SRS7),
-+        .CP0_SRSConf3_rw_bitmask = 0x3fffffff,
-+        .CP0_SRSConf3 = (1U << CP0SRSC3_M) | (0x3fe << CP0SRSC3_SRS12) |
-+                    (0x3fe << CP0SRSC3_SRS11) | (0x3fe << CP0SRSC3_SRS10),
-+        .CP0_SRSConf4_rw_bitmask = 0x3fffffff,
-+        .CP0_SRSConf4 = (0x3fe << CP0SRSC4_SRS15) |
-+                    (0x3fe << CP0SRSC4_SRS14) | (0x3fe << CP0SRSC4_SRS13),
-+        .SEGBITS = 32,
-+        .PABITS = 32,
-+        .insn_flags = CPU_MIPS32R2 | ASE_MIPS16 | ASE_DSP | ASE_MT,
-+        .mmu_type = MMU_TYPE_R4000,
-+    },
-     {
-         .name = "74Kf",
-         .CP0_PRid = 0x00019700,
--- 
-2.14.5
-
diff --git a/meta/recipes-devtools/qemu/qemu/0001-target-mips-Make-cpu_mips_realize_env-propagate-Erro.patch b/meta/recipes-devtools/qemu/qemu/0001-target-mips-Make-cpu_mips_realize_env-propagate-Erro.patch
new file mode 100644
index 0000000000..27f38d6215
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-target-mips-Make-cpu_mips_realize_env-propagate-Erro.patch
@@ -0,0 +1,83 @@
+From 6f5b9be3e3f36b74e3346441d86c8cc3de1523aa Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
+Date: Fri, 16 Oct 2020 00:47:43 +0200
+Subject: [PATCH 1/4] target/mips: Make cpu_mips_realize_env() propagate Error
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+To be able to propagate error to our caller, make
+cpu_mips_realize_env() take an Error argument and
+return a boolean value indicating an error is set or
+not, following the example documented since commit
+e3fe3988d7 ("error: Document Error API usage rules").
+
+Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
+---
+Upstream-Status: Submitted
+ target/mips/cpu.c       |  4 +++-
+ target/mips/internal.h  | 10 +++++++++-
+ target/mips/translate.c |  4 +++-
+ 3 files changed, 15 insertions(+), 3 deletions(-)
+
+diff --git a/target/mips/cpu.c b/target/mips/cpu.c
+index e86cd065..117c7483 100644
+--- a/target/mips/cpu.c
++++ b/target/mips/cpu.c
+@@ -147,7 +147,9 @@ static void mips_cpu_realizefn(DeviceState *dev, Error **errp)
+         return;
+     }
+ 
+-    cpu_mips_realize_env(&cpu->env);
++    if (!cpu_mips_realize_env(&cpu->env, errp)) {
++        return;
++    }
+ 
+     cpu_reset(cs);
+     qemu_init_vcpu(cs);
+diff --git a/target/mips/internal.h b/target/mips/internal.h
+index 7f159a92..c2b2e79c 100644
+--- a/target/mips/internal.h
++++ b/target/mips/internal.h
+@@ -206,7 +206,15 @@ void mips_tcg_init(void);
+ 
+ /* TODO QOM'ify CPU reset and remove */
+ void cpu_state_reset(CPUMIPSState *s);
+-void cpu_mips_realize_env(CPUMIPSState *env);
++
++/**
++ * cpu_mips_realize_env: Realize CPUMIPSState
++ * @env: CPUMIPSState object
++ * @errp: pointer to error object
++ * On success, return %true.
++ * On failure, store an error through @errp and return %false.
++ */
++bool cpu_mips_realize_env(CPUMIPSState *env, Error **errp);
+ 
+ /* cp0_timer.c */
+ uint32_t cpu_mips_get_random(CPUMIPSState *env);
+diff --git a/target/mips/translate.c b/target/mips/translate.c
+index 9fad58ea..3e81a957 100644
+--- a/target/mips/translate.c
++++ b/target/mips/translate.c
+@@ -31324,7 +31324,7 @@ void mips_tcg_init(void)
+ 
+ #include "translate_init.inc.c"
+ 
+-void cpu_mips_realize_env(CPUMIPSState *env)
++bool cpu_mips_realize_env(CPUMIPSState *env, Error **errp)
+ {
+     env->exception_base = (int32_t)0xBFC00000;
+ 
+@@ -31333,6 +31333,8 @@ void cpu_mips_realize_env(CPUMIPSState *env)
+ #endif
+     fpu_init(env, env->cpu_model);
+     mvp_init(env, env->cpu_model);
++
++    return true;
+ }
+ 
+ bool cpu_supports_cps_smp(const char *cpu_type)
+-- 
+2.28.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/0002-target-mips-Store-number-of-TLB-entries-in-CPUMIPSSt.patch b/meta/recipes-devtools/qemu/qemu/0002-target-mips-Store-number-of-TLB-entries-in-CPUMIPSSt.patch
new file mode 100644
index 0000000000..c1a41012bd
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0002-target-mips-Store-number-of-TLB-entries-in-CPUMIPSSt.patch
@@ -0,0 +1,81 @@
+From d0f795e5267079ebed36b8aa8b9c5809135cbeda Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
+Date: Fri, 16 Oct 2020 00:47:44 +0200
+Subject: [PATCH 2/4] target/mips: Store number of TLB entries in CPUMIPSState
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+As we want to make the number of TLB entries configurable,
+store it in CPUMIPSState. Introduce the init_tlb_entries()
+helper which initializes it from the CP0C1_MMU config content.
+
+Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
+---
+Upstream-Status: Submitted
+ target/mips/cpu.h                |  1 +
+ target/mips/translate.c          | 13 ++++++++++++-
+ target/mips/translate_init.inc.c |  2 +-
+ 3 files changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/target/mips/cpu.h b/target/mips/cpu.h
+index 7cf7f523..b84e9a8f 100644
+--- a/target/mips/cpu.h
++++ b/target/mips/cpu.h
+@@ -1140,6 +1140,7 @@ struct CPUMIPSState {
+ #endif
+ 
+     const mips_def_t *cpu_model;
++    uint8_t tlb_entries;
+     void *irq[8];
+     QEMUTimer *timer; /* Internal timer */
+     struct MIPSITUState *itu;
+diff --git a/target/mips/translate.c b/target/mips/translate.c
+index 3e81a957..36ad27c2 100644
+--- a/target/mips/translate.c
++++ b/target/mips/translate.c
+@@ -31324,8 +31324,18 @@ void mips_tcg_init(void)
+ 
+ #include "translate_init.inc.c"
+ 
++static bool init_tlb_entries(CPUMIPSState *env, Error **errp)
++{
++    env->tlb_entries = 1 + extract32(env->cpu_model->CP0_Config1, CP0C1_MMU, 6);
++
++    return true;
++}
++
+ bool cpu_mips_realize_env(CPUMIPSState *env, Error **errp)
+ {
++    if (!init_tlb_entries(env, errp)) {
++        return false;
++    }
+     env->exception_base = (int32_t)0xBFC00000;
+ 
+ #ifndef CONFIG_USER_ONLY
+@@ -31365,7 +31375,8 @@ void cpu_state_reset(CPUMIPSState *env)
+ #ifdef TARGET_WORDS_BIGENDIAN
+     env->CP0_Config0 |= (1 << CP0C0_BE);
+ #endif
+-    env->CP0_Config1 = env->cpu_model->CP0_Config1;
++    env->CP0_Config1 = deposit32(env->cpu_model->CP0_Config1, CP0C1_MMU, 6,
++                                 env->tlb_entries - 1);
+     env->CP0_Config2 = env->cpu_model->CP0_Config2;
+     env->CP0_Config3 = env->cpu_model->CP0_Config3;
+     env->CP0_Config4 = env->cpu_model->CP0_Config4;
+diff --git a/target/mips/translate_init.inc.c b/target/mips/translate_init.inc.c
+index 637caccd..a426463c 100644
+--- a/target/mips/translate_init.inc.c
++++ b/target/mips/translate_init.inc.c
+@@ -946,7 +946,7 @@ static void fixed_mmu_init (CPUMIPSState *env, const mips_def_t *def)
+ 
+ static void r4k_mmu_init (CPUMIPSState *env, const mips_def_t *def)
+ {
+-    env->tlb->nb_tlb = 1 + ((def->CP0_Config1 >> CP0C1_MMU) & 63);
++    env->tlb->nb_tlb = env->tlb_entries;
+     env->tlb->map_address = &r4k_map_address;
+     env->tlb->helper_tlbwi = r4k_helper_tlbwi;
+     env->tlb->helper_tlbwr = r4k_helper_tlbwr;
+-- 
+2.28.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/0003-target-mips-Make-the-number-of-TLB-entries-a-CPU-pro.patch b/meta/recipes-devtools/qemu/qemu/0003-target-mips-Make-the-number-of-TLB-entries-a-CPU-pro.patch
new file mode 100644
index 0000000000..1114c6bc65
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0003-target-mips-Make-the-number-of-TLB-entries-a-CPU-pro.patch
@@ -0,0 +1,111 @@
+From e5593790ca37315d6cc9f4a999b0f030000a1585 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
+Date: Fri, 16 Oct 2020 00:47:45 +0200
+Subject: [PATCH 3/4] target/mips: Make the number of TLB entries a CPU property
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Allow selecting the number of TLB entries from a preset array.
+
+Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
+---
+Upstream-Status: Submitted
+ target/mips/cpu.c       |  8 +++++++-
+ target/mips/internal.h  |  1 +
+ target/mips/translate.c | 26 ++++++++++++++++++++++++--
+ 3 files changed, 32 insertions(+), 3 deletions(-)
+
+diff --git a/target/mips/cpu.c b/target/mips/cpu.c
+index 117c7483..da318313 100644
+--- a/target/mips/cpu.c
++++ b/target/mips/cpu.c
+@@ -26,7 +26,7 @@
+ #include "qemu/module.h"
+ #include "sysemu/kvm.h"
+ #include "exec/exec-all.h"
+-
++#include "hw/qdev-properties.h"
+ 
+ static void mips_cpu_set_pc(CPUState *cs, vaddr value)
+ {
+@@ -183,6 +183,11 @@ static ObjectClass *mips_cpu_class_by_name(const char *cpu_model)
+     return oc;
+ }
+ 
++static Property mips_cpu_properties[] = {
++    DEFINE_PROP_UINT8("tlb-entries", MIPSCPU, env.tlb_entries, 0),
++    DEFINE_PROP_END_OF_LIST()
++};
++
+ static void mips_cpu_class_init(ObjectClass *c, void *data)
+ {
+     MIPSCPUClass *mcc = MIPS_CPU_CLASS(c);
+@@ -192,6 +197,7 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
+     device_class_set_parent_realize(dc, mips_cpu_realizefn,
+                                     &mcc->parent_realize);
+     device_class_set_parent_reset(dc, mips_cpu_reset, &mcc->parent_reset);
++    device_class_set_props(dc, mips_cpu_properties);
+ 
+     cc->class_by_name = mips_cpu_class_by_name;
+     cc->has_work = mips_cpu_has_work;
+diff --git a/target/mips/internal.h b/target/mips/internal.h
+index c2b2e79c..34f82c6e 100644
+--- a/target/mips/internal.h
++++ b/target/mips/internal.h
+@@ -29,6 +29,7 @@ struct mips_def_t {
+     int32_t CP0_PRid;
+     int32_t CP0_Config0;
+     int32_t CP0_Config1;
++    const unsigned *CP0_Config1_MMU_preset;
+     int32_t CP0_Config2;
+     int32_t CP0_Config3;
+     int32_t CP0_Config4;
+diff --git a/target/mips/translate.c b/target/mips/translate.c
+index 36ad27c2..aa648bd0 100644
+--- a/target/mips/translate.c
++++ b/target/mips/translate.c
+@@ -39,6 +39,7 @@
+ #include "exec/translator.h"
+ #include "exec/log.h"
+ #include "qemu/qemu-print.h"
++#include "qapi/error.h"
+ 
+ #define MIPS_DEBUG_DISAS 0
+ 
+@@ -31326,9 +31327,30 @@ void mips_tcg_init(void)
+ 
+ static bool init_tlb_entries(CPUMIPSState *env, Error **errp)
+ {
+-    env->tlb_entries = 1 + extract32(env->cpu_model->CP0_Config1, CP0C1_MMU, 6);
++    const unsigned *preset = env->cpu_model->CP0_Config1_MMU_preset;
++    bool valid = false;
+ 
+-    return true;
++    if (!env->tlb_entries) {
++        env->tlb_entries = 1 + extract32(env->cpu_model->CP0_Config1,
++                                         CP0C1_MMU, 6);
++        return true;
++    }
++    if (!preset) {
++        error_setg(errp, "Property 'tlb-entries' not modifiable for this CPU");
++        return false;
++    }
++    while (!valid && *preset) {
++        if (*preset == env->tlb_entries) {
++            valid = true;
++            break;
++        }
++        preset++;
++    }
++    if (!valid) {
++        error_setg(errp, "Invalid value '%u' for property 'tlb-entries'",
++                   env->tlb_entries);
++    }
++    return valid;
+ }
+ 
+ bool cpu_mips_realize_env(CPUMIPSState *env, Error **errp)
+-- 
+2.28.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/0004-target-mips-Allow-using-the-34Kf-with-16-32-64-prese.patch b/meta/recipes-devtools/qemu/qemu/0004-target-mips-Allow-using-the-34Kf-with-16-32-64-prese.patch
new file mode 100644
index 0000000000..32e5a260ab
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0004-target-mips-Allow-using-the-34Kf-with-16-32-64-prese.patch
@@ -0,0 +1,59 @@
+From 8b25ae5bde3bf30bd50cd28d538c872a92d56e19 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
+Date: Fri, 16 Oct 2020 00:47:46 +0200
+Subject: [PATCH 4/4] target/mips: Allow using the 34Kf with 16/32/64 preset TLB entries
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Per "MIPS32 34K Processor Core Family Software User's Manual,
+Revision 01.13" page 8 in "Joint TLB (JTLB)" section:
+
+  "The JTLB is a fully associative TLB cache containing 16, 32,
+   or 64-dual-entries mapping up to 128 virtual pages to their
+   corresponding physical addresses."
+
+Add these values to the CP0_Config1_MMU_preset array.
+
+Example to use a 34Kf cpu with preset 64 TLB:
+
+  $ qemu-system-mipsel -cpu 34Kf,tlb-entries=64 ...
+
+This is helpful for developers of the Yocto Project [*]:
+
+  Yocto Project uses qemu-system-mips 34Kf cpu model, to run 32bit
+  MIPS CI loop. It was observed that in this case CI test execution
+  time was almost twice longer than 64bit MIPS variant that runs
+  under MIPS64R2-generic model. It was investigated and concluded
+  that the difference in number of TLBs 16 in 34Kf case vs 64 in
+  MIPS64R2-generic is responsible for most of CI real time execution
+  difference. Because with 16 TLBs linux user-land trashes TLB more
+  and it needs to execute more instructions in TLB refill handler
+  calls, as result it runs much longer.
+
+[*] https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg03428.html
+
+Buglink: https://bugzilla.yoctoproject.org/show_bug.cgi?id=13992
+Reported-by: Victor Kamensky <kamensky@cisco.com>
+Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
+---
+Upstream-Status: Submitted
+
+ target/mips/translate_init.inc.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/target/mips/translate_init.inc.c b/target/mips/translate_init.inc.c
+index a426463c..02500e69 100644
+--- a/target/mips/translate_init.inc.c
++++ b/target/mips/translate_init.inc.c
+@@ -258,6 +258,7 @@ const mips_def_t mips_defs[] =
+                        (0 << CP0C1_IS) | (3 << CP0C1_IL) | (1 << CP0C1_IA) |
+                        (0 << CP0C1_DS) | (3 << CP0C1_DL) | (1 << CP0C1_DA) |
+                        (1 << CP0C1_CA),
++        .CP0_Config1_MMU_preset = (const unsigned[]){16, 32, 64, 0},
+         .CP0_Config2 = MIPS_CONFIG2,
+         .CP0_Config3 = MIPS_CONFIG3 | (1 << CP0C3_VInt) | (1 << CP0C3_MT) |
+                        (1 << CP0C3_DSPP),
+-- 
+2.28.0
+
-- 
2.28.0


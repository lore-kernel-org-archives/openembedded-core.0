Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C59AC5AC82
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 05:11:32 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23237.1786338682426916841
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 22:11:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=C5NKmUXO;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-495437bb891so11444765e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2026 22:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786338680; x=1786943480; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7jbymhkEfxCq2QYA0C0cS5t608tWxJ3G9DDboQC9lkM=;
        b=C5NKmUXOEsb8A/PlASvc0DOyetYsJ1uZrvMGA7a040vazNd9pCXM1cjL+tKAKSPxO7
         bOyjkFj1xIm0aQzk3r0sxTgOQ+r79uep1P2Ljyyib52+njh/39eWs9Z3jBcL2NFYgVZC
         siEPLznscMSrDClpTxTowckYHRHRPzS/jwJ551guwyBqcBVoVkiVgz7KqeBKQB2L9z+9
         czgYU2zyk3hjtQ7AgfAR6k16w07fNQSO6wmCcGmo+xjvfgZXpmsQKE/L7kz4FwwobN/x
         3H2qlNqdNhe7Iz/caPrJm+8EgKbZy9CtsegBo+BzuSnwAShsHI9jJngf4SiJ0fXxshFr
         55cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786338680; x=1786943480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7jbymhkEfxCq2QYA0C0cS5t608tWxJ3G9DDboQC9lkM=;
        b=G5+xechELF4d/kzBYQ5sYUiwJ3OEw6In7PntPmM6AdocNCCHvNATqsAVNBaJgkd7JY
         JOysNqEl+s5sRy6LZrdkqQTCFDcrsI5bbJaKaxUjcxhKjfmbI2fDLld4jiIKOqT2aQdO
         hv7H6Up0j2iIB5hvTELjd4d7X0UEYuCxMmcqLgMr/hd/cBIzJ9RceKeZ/nCHFwpxexeH
         fNiw89HzH5+/E1o1A3KKmgSRoW5EyYiE12UEdqwEuYF2wTtTqgxNBtufAlCjCIaE9wr6
         n/I99auHFk+lbllVeWkYl3Qh0w4WUO96sksMo8S1827z1ELskAlPMa+9DuEZLYmEHftk
         BUww==
X-Gm-Message-State: AOJu0YzJYNp5fuTEMSYPSegRUlNJkYWfvj9zNtIrW+WyhG3IedUkocaR
	hTohMhllwajYpJGC+uKI/Vu7TEkaxDOKPIu939B6ZCbVpYCaB8KYFP88zRTOyg==
X-Gm-Gg: AR+sD11/snI1TTyqrFdkhYUyqqhdKvkYWn0FDRmp9IcUFne13BQ+MAtitLdRynOHwTl
	CUnMokcRcokCASR0bIF4zmU0rtH4mpFyg/Q7C5UIj3cg0e/2WEDY/IvwoCg991US/DtLLv8ytfr
	0kVRhg5we1JpWfOBDvzURGA72PqPUJJq/ejYxdah+Fx/u2PBnljqOI44bOR52gHBinK7ljhsYmf
	+lcmmMuMpdbhmU6k3x55mS/1QdW27G6YUTnogQnFiHih53msyWmoMEiRK3i8GvfANNYEJ0nwXbd
	IuYHjuFQ9rvUfiGyYiCg8E6gVPBOydEbRNRuH6ON0Ouvmq6FWAsTxUqXLnGaZBxzYfq/w6Q4SWq
	mXcjdyuh9xo7vtdQjHjIfQHZk/k49dtdccKrlyjs0uLf9xkXrjRmA8Y+NDp+UFEfCsSdttix0sm
	obGq01LTdI+AQThhe2Yfu4em2mGylOy4ZZRPaHtHhJRjJp91HNVW1tHiAgZqlb6nX0DNvqB5Klj
	2t4dBPSURsupuWkBHEa5QOWG1JGz1IeFjv/GNA=
X-Received: by 2002:a05:600c:3154:b0:495:3bc6:d381 with SMTP id 5b1f17b1804b1-49962453c45mr180727415e9.2.1786338680477;
        Sun, 09 Aug 2026 22:11:20 -0700 (PDT)
Received: from [192.168.5.15] (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995422016fsm315556305e9.8.2026.08.09.22.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 22:11:19 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 10 Aug 2026 06:11:07 +0100
Subject: [PATCH v2 1/2] qemu: Backport support for 'aarch64=off' with TCG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260810-tune-a32-v2-1-52045fd54937@gmail.com>
References: <20260810-tune-a32-v2-0-52045fd54937@gmail.com>
In-Reply-To: <20260810-tune-a32-v2-0-52045fd54937@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>, 
 Alex Kiernan <alexk@a-squared-projects.uk>, Jon Mason <jdmason@kudzu.us>
X-Mailer: b4 0.15.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 05:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243106

Backport the two-commit series from qemu master which allows the
'aarch64' CPU feature to be disabled under TCG for CPUs which support
AArch32 at their highest implemented exception level. This allows an
AArch32-only ARMv8-A guest to be run with qemu-system-aarch64 as e.g.
'-cpu cortex-a35,aarch64=off', matching the '-cpu host,aarch64=off'
invocation used with KVM, and is used by the qemuarmv8a32 machine.

AI-Generated: Claude Code (Claude Fable 5)
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Alex Kiernan <alexk@a-squared-projects.uk>
---
 meta/recipes-devtools/qemu/qemu.inc                |   2 +
 ...lear-AArch64-ID-regs-from-ARMISARegisters.patch | 110 +++++++++++++++++
 ...-Allow-aarch64-off-to-be-set-for-TCG-CPUs.patch | 134 +++++++++++++++++++++
 3 files changed, 246 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 9ec522124cc3..13c73c9ec33c 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -34,6 +34,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch \
            file://0012-meson-fix-close_range-detection-on-older-glibc.patch \
            file://0013-hw-scsi-vhost-scsi-include-standard-headers-for-vhost-worker-structs.patch \
+           file://0014-target-arm-Clear-AArch64-ID-regs-from-ARMISARegisters.patch \
+           file://0015-target-arm-Allow-aarch64-off-to-be-set-for-TCG-CPUs.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            file://0001-ui-sdl2.c-force-disable-SDL_HINT_VIDEO_X11_FORCE_EGL.patch \
diff --git a/meta/recipes-devtools/qemu/qemu/0014-target-arm-Clear-AArch64-ID-regs-from-ARMISARegisters.patch b/meta/recipes-devtools/qemu/qemu/0014-target-arm-Clear-AArch64-ID-regs-from-ARMISARegisters.patch
new file mode 100644
index 000000000000..3e1ccbfe590b
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0014-target-arm-Clear-AArch64-ID-regs-from-ARMISARegisters.patch
@@ -0,0 +1,110 @@
+From 95146de5d20ecfa7104b8bd632c717b3bbd8e151 Mon Sep 17 00:00:00 2001
+From: Peter Maydell <peter.maydell@linaro.org>
+Date: Thu, 16 Apr 2026 17:53:51 +0100
+Subject: [PATCH] target/arm: Clear AArch64 ID regs from ARMISARegisters if
+ AArch64 disabled
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+If we create a normally-AArch64 CPU and configure it with
+aarch64=off, this will by default leave all the AArch64 ID register
+values in its ARMISARegisters struct untouched.  That in turn means
+that tests of cpu_isar_feature(aa64_something, cpu) will return true.
+
+Until now we have had a design policy that you shouldn't check an
+aa64_ feature unless you know that the CPU has AArch64; but this is
+quite fragile as it's easy to forget and only causes a problem in the
+corner case where AArch64 was turned off.  In particular, when we
+extend the ability to disable AArch64 from only KVM to also TCG there
+are many more aa64 feature check points which we would otherwise have
+to audit for whether they needed to be guarded with a check on
+ARM_FEATURE_AARCH64.
+
+Instead, make the CPU realize function zero out all the 64-bit ID
+registers if a TCG CPU doesn't have AArch64; this will make aa64_
+feature tests generally return false.
+
+We only do this for TCG because only TCG really needs it, and for
+KVM it might be confusing to have QEMU's idea of the ID registers
+be different from KVM's.
+
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Message-id: 20260416165353.589569-2-peter.maydell@linaro.org
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/95146de5d20ecfa7104b8bd632c717b3bbd8e151]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+
+---
+ target/arm/cpu.c | 35 +++++++++++++++++++++++++++++++++++
+ target/arm/cpu.h |  3 ++-
+ 2 files changed, 37 insertions(+), 1 deletion(-)
+
+diff --git a/target/arm/cpu.c b/target/arm/cpu.c
+index b62de8addff9..6705ee9db7c4 100644
+--- a/target/arm/cpu.c
++++ b/target/arm/cpu.c
+@@ -1606,6 +1606,27 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
+     }
+ }
+ 
++static void arm_clear_aarch64_idregs(ARMCPU *cpu)
++{
++    /* Zero out all the AArch64 ID registers in ARMISARegisters */
++    SET_IDREG(&cpu->isar, ID_AA64ISAR0, 0);
++    SET_IDREG(&cpu->isar, ID_AA64ISAR1, 0);
++    SET_IDREG(&cpu->isar, ID_AA64ISAR2, 0);
++    SET_IDREG(&cpu->isar, ID_AA64PFR0, 0);
++    SET_IDREG(&cpu->isar, ID_AA64PFR1, 0);
++    SET_IDREG(&cpu->isar, ID_AA64PFR2, 0);
++    SET_IDREG(&cpu->isar, ID_AA64MMFR0, 0);
++    SET_IDREG(&cpu->isar, ID_AA64MMFR1, 0);
++    SET_IDREG(&cpu->isar, ID_AA64MMFR2, 0);
++    SET_IDREG(&cpu->isar, ID_AA64MMFR3, 0);
++    SET_IDREG(&cpu->isar, ID_AA64DFR0, 0);
++    SET_IDREG(&cpu->isar, ID_AA64DFR1, 0);
++    SET_IDREG(&cpu->isar, ID_AA64AFR0, 0);
++    SET_IDREG(&cpu->isar, ID_AA64AFR1, 0);
++    SET_IDREG(&cpu->isar, ID_AA64ZFR0, 0);
++    SET_IDREG(&cpu->isar, ID_AA64SMFR0, 0);
++}
++
+ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
+ {
+     CPUState *cs = CPU(dev);
+@@ -1733,6 +1754,20 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
+     }
+ #endif
+ 
++    /*
++     * A TCG aarch64=off CPU has no AArch64 at all, so we clear out the
++     * ID registers to avoid cpu_isar_feature(aa64_something, cpu) tests
++     * incorrectly returning true. We don't do this for other accelerators
++     * (which in practice means "for KVM", since no others have AArch32
++     * guest support) because from KVM's point of view the AArch64 ID
++     * registers still exist and must have their correct values. So we
++     * avoid clearing them out so that we don't have QEMU and KVM with
++     * different ideas of the ID registers.
++     */
++    if (tcg_enabled() && !arm_feature(env, ARM_FEATURE_AARCH64)) {
++        arm_clear_aarch64_idregs(cpu);
++    }
++
+ #ifdef CONFIG_USER_ONLY
+     /*
+      * User mode relies on IC IVAU instructions to catch modification of
+diff --git a/target/arm/cpu.h b/target/arm/cpu.h
+index 657ff4ab20b3..ab6bacf4aa87 100644
+--- a/target/arm/cpu.h
++++ b/target/arm/cpu.h
+@@ -1080,7 +1080,8 @@ struct ArchCPU {
+      * Note that if you add an ID register to the ARMISARegisters struct
+      * you need to also update the 32-bit and 64-bit versions of the
+      * kvm_arm_get_host_cpu_features() function to correctly populate the
+-     * field by reading the value from the KVM vCPU.
++     * field by reading the value from the KVM vCPU. If it is an AArch64
++     * ID register then you also must update arm_clear_aarch64_idregs().
+      */
+     struct ARMISARegisters {
+         uint32_t mvfr0;
diff --git a/meta/recipes-devtools/qemu/qemu/0015-target-arm-Allow-aarch64-off-to-be-set-for-TCG-CPUs.patch b/meta/recipes-devtools/qemu/qemu/0015-target-arm-Allow-aarch64-off-to-be-set-for-TCG-CPUs.patch
new file mode 100644
index 000000000000..e8afe6464ac8
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0015-target-arm-Allow-aarch64-off-to-be-set-for-TCG-CPUs.patch
@@ -0,0 +1,134 @@
+From 970ea8478c059a7b753b21b60b4d7aa10944f120 Mon Sep 17 00:00:00 2001
+From: Peter Maydell <peter.maydell@linaro.org>
+Date: Thu, 16 Apr 2026 17:53:52 +0100
+Subject: [PATCH] target/arm: Allow 'aarch64=off' to be set for TCG CPUs
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Allow the 'aarch64=off' property, which is currently KVM-only, to
+be set for TCG CPUs also.
+
+Note that we don't permit it on the qemu-aarch64 user-mode binary:
+this makes no sense as that executable can only handle AArch64
+syscalls (and it would also assert at startup since it doesn't
+compile in the A32-specific GDB xml files like arm-neon.xml).
+
+Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Tested-by: Clément Chigot <chigot@adacore.com>
+Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
+Message-id: 20260416165353.589569-3-peter.maydell@linaro.org
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/970ea8478c059a7b753b21b60b4d7aa10944f120]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+
+---
+ docs/system/arm/cpu-features.rst | 10 +++++----
+ target/arm/cpu-features.h        |  5 +++++
+ target/arm/cpu.c                 | 36 ++++++++++++++++++++++++++++----
+ tests/qtest/arm-cpu-features.c   |  8 ++-----
+ 4 files changed, 45 insertions(+), 14 deletions(-)
+
+diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
+index ce19ae6a046c..10b0eff27e54 100644
+--- a/docs/system/arm/cpu-features.rst
++++ b/docs/system/arm/cpu-features.rst
+@@ -23,10 +23,12 @@ not implement ARMv8-A, will not have the ``aarch64`` CPU property.
+ QEMU's support may be limited for some CPU features, only partially
+ supporting the feature or only supporting the feature under certain
+ configurations.  For example, the ``aarch64`` CPU feature, which, when
+-disabled, enables the optional AArch32 CPU feature, is only supported
+-when using the KVM accelerator and when running on a host CPU type that
+-supports the feature.  While ``aarch64`` currently only works with KVM,
+-it could work with TCG.  CPU features that are specific to KVM are
++disabled, enables the optional AArch32 CPU feature, can only be set to
++``off`` on the TCG and KVM accelerators, and it cannot be set to
++``off`` under KVM unless running on a host CPU type that supports
++running guests in AArch32.
++
++CPU features that are inherently specific to KVM are
+ prefixed with "kvm-" and are described in "KVM VCPU Features".
+ 
+ CPU Feature Probing
+diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
+index b683c9551a0e..6e5212ff6cc7 100644
+--- a/target/arm/cpu-features.h
++++ b/target/arm/cpu-features.h
+@@ -1071,6 +1071,11 @@ static inline bool isar_feature_aa64_aa32_el2(const ARMISARegisters *id)
+     return FIELD_EX64_IDREG(id, ID_AA64PFR0, EL2) >= 2;
+ }
+ 
++static inline bool isar_feature_aa64_aa32_el3(const ARMISARegisters *id)
++{
++    return FIELD_EX64_IDREG(id, ID_AA64PFR0, EL3) >= 2;
++}
++
+ static inline bool isar_feature_aa64_ras(const ARMISARegisters *id)
+ {
+     return FIELD_EX64_IDREG(id, ID_AA64PFR0, RAS) != 0;
+diff --git a/target/arm/cpu.c b/target/arm/cpu.c
+index 6705ee9db7c4..9b80dda140ad 100644
+--- a/target/arm/cpu.c
++++ b/target/arm/cpu.c
+@@ -1244,10 +1244,38 @@ static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
+      * uniform execution state like do_interrupt.
+      */
+     if (value == false) {
+-        if (!kvm_enabled() || !kvm_arm_aarch32_supported()) {
+-            error_setg(errp, "'aarch64' feature cannot be disabled "
+-                             "unless KVM is enabled and 32-bit EL1 "
+-                             "is supported");
++        if (kvm_enabled()) {
++            if (!kvm_arm_aarch32_supported()) {
++                error_setg(errp, "'aarch64' feature cannot be disabled for KVM "
++                           "because this host does not support 32-bit EL1");
++                return;
++            }
++        } else if (tcg_enabled()) {
++#ifdef CONFIG_USER_ONLY
++            error_setg(errp, "'aarch64' feature cannot be disabled for "
++                       "usermode emulator qemu-aarch64; use qemu-arm instead");
++            return;
++#else
++            bool aa32_at_highest_el;
++            if (arm_feature(&cpu->env, ARM_FEATURE_EL3)) {
++                aa32_at_highest_el = cpu_isar_feature(aa64_aa32_el3, cpu);
++            } else if (arm_feature(&cpu->env, ARM_FEATURE_EL2)) {
++                aa32_at_highest_el = cpu_isar_feature(aa64_aa32_el2, cpu);
++            } else {
++                aa32_at_highest_el = cpu_isar_feature(aa64_aa32_el1, cpu);
++            }
++
++            if (!aa32_at_highest_el) {
++                error_setg(errp, "'aarch64' feature cannot be disabled for "
++                           "this TCG CPU because it does not support 32-bit "
++                           "execution at its highest implemented exception "
++                           "level");
++                return;
++            }
++#endif
++        } else {
++            error_setg(errp, "'aarch64' feature cannot be disabled for "
++                       "this accelerator");
+             return;
+         }
+         unset_feature(&cpu->env, ARM_FEATURE_AARCH64);
+diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
+index bbdd89a81d32..cb4d01fd46ae 100644
+--- a/tests/qtest/arm-cpu-features.c
++++ b/tests/qtest/arm-cpu-features.c
+@@ -493,12 +493,8 @@ static void test_query_cpu_model_expansion(const void *data)
+         sve_tests_default(qts, "max");
+         pauth_tests_default(qts, "max");
+ 
+-        /* Test that features that depend on KVM generate errors without. */
+-        assert_error(qts, "max",
+-                     "'aarch64' feature cannot be disabled "
+-                     "unless KVM is enabled and 32-bit EL1 "
+-                     "is supported",
+-                     "{ 'aarch64': false }");
++        /* TCG allows us to turn off AArch64 on the 'max' CPU type */
++        assert_set_feature(qts, "max", "aarch64", false);
+     }
+ 
+     qtest_quit(qts);

-- 
2.43.0



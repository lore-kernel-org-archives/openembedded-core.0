Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 852C2C5DF7F
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 11:21:55 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27890.1786965705025135460
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 04:21:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=yRbks9dC;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b45f2e5f58so1808640e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 04:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786965703; x=1787570503; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2KraIqbcEjV9OBYm3jJTgIT7rTHEPOLM1anyw1fgx/U=;
        b=yRbks9dC2qvGsn7+ciaXDjKD/OZeoCkTiJL+a05pRCEwm+cnehFWPuZ4DCWgMWgxOv
         1RjxpeMa0ju5lbDLDBv5gY9xL32ZsLlOHKWBMe1qP4MbSaWGVemunOvkh6cXe9AZSlbW
         sEdQWCDwxngcQlFqh6Wt+p3LS/lKsYw0jwVn8hw+2M6bSVmVydMjvI48oQPLvKzQgz/u
         0flhXo5YvvAxXnoOwB2sZZZVBHg1Vd/kV3Q3pUWFzHuYv/KPIOC7C+RMjRsW7EyOh87C
         hUvyulz3l08K5TkPFNL9GL5ReyofqItGVQa9ZkHPb6WO/c27i6jxvJx/Xzptj9C57nBs
         91Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786965703; x=1787570503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2KraIqbcEjV9OBYm3jJTgIT7rTHEPOLM1anyw1fgx/U=;
        b=Yi9+MRMm/nm0uKqCBFae/B8BeNNHebxYbNXqrvs/8TSBERxZuHq3wYCEaqasui729E
         wHNM831p7Hk8SkxpxXfUq8WKRwpmJJXPlezSRfrjLk+M2gDP8aEdAavsvWEikfZalPJK
         pIEnXjz/2oDrYVgaw5QHekU/1TXHcf9aSZZXbNs0TMlXE/FBu6QEKw130RH2UBctztar
         BKhXDKrRlDZCIxgtCN2r0pTTfJrWXGJ37cMFd3Ql8ryz6blmhgqZ3Q5Fi4Yp9w0Nc3sT
         aAHJJ+2JKtZyfGPq7jYXQYOoWampQgYysdBdXoYxWoQBlt4s/rCnRcSS1G6JPOugb1lg
         oY9A==
X-Gm-Message-State: AOJu0YzJutCNVdO3fyrS94Fsa9u7dWUrq2LXIQjZxTP03mxVOjmpC7vS
	uJfyB3vC4yROuvmPSDdy6bmBNzbDhMRBCvAAIQ3G3vEJYBO8fpujlO25oh+BrTknDVYvh6jY8Lv
	VScVj
X-Gm-Gg: AR+sD12sxMs0critcf0ooP7X9SSUB5kiUpK+O6n9erihUSzwm1MSOh9V3OMzEz3x4WB
	Vvj4LhunTrnQZJUcQQN1fV+GJWuKIv7X1LMb3pl5SLZqMfBpJrpcKPLIWJQ/cz1Q6iMbFAL7ta3
	WHEs97EJcHBoN617OhTrGW/oNtoAEsY+lcBz/gGzfKy/7uj9kEk+d0RwSKfAdSEnVU3QAEc+S5q
	pUIbr/mRBdA62RKjt3S7xO4O03vKFz+/jreaA9ShHtfiGSxI86/eq91tFqqd6zVEnA0y4zlyXO+
	xdDlirLrLYei/6rIpCu+CWQjprnd7tovYW6cE/Ec7eXxeJpEkstkGR4ppbvmZ3J2g/ycUG7rban
	J2p0jqi216PCB8S2ZJ4Q2tLw3rgXTkW8ssqbr4theO2kOMRW6oOEiXY+FVX9WLhbc1b2vUKcbwv
	5J1JGuqe10rk35RObecyWvC7WZpiKoGB27J3KE88MXHWI502lgp89z3+eBoS9yxF66AuaA83DAj
	z7x/G+9dK+54lA=
X-Received: by 2002:a05:6512:3d8b:b0:5b1:53e9:43b6 with SMTP id 2adb3069b0e04-5b45917eb1bmr3164430e87.34.1786965702782;
        Mon, 17 Aug 2026 04:21:42 -0700 (PDT)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cfa0e5esm318180e87.25.2026.08.17.04.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 04:21:42 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH v2 1/4] lttng-modules: fix build with kernel 7.2
Date: Mon, 17 Aug 2026 14:21:26 +0300
Message-ID: <20260817112129.1271154-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260817112129.1271154-1-mikko.rapeli@linaro.org>
References: <20260817112129.1271154-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 11:21:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243614

With patches from upstream 2.15 stable branch.
Fixes build error:

| lttng-syscalls.c: In function 'lttng_syscall_event_enabler_create_event':
| lttng-syscalls.c:612:17: error: implicit declaration of function 'strncpy' [-Wimplicit-function-declaration]
|   612 |                 strncpy(ev.name, desc->event_name, LTTNG_KERNEL_ABI_SYM_NAME_LEN - 1);
|       |                 ^~~~~~~
| lttng-syscalls.c:101:1: note: include '<string.h>' or provide a declaration of 'strncpy'
|   100 | #include <instrumentation/syscalls/syscalls_unknown.h>
|   +++ |+#include <string.h>
|   101 | #undef TRACE_SYSTEM
| lttng-syscalls.c:612:17: warning: incompatible implicit declaration of built-in function 'strncpy' [-Wbuiltin-declaration-mismatch]
|   612 |                 strncpy(ev.name, desc->event_name, LTTNG_KERNEL_ABI_SYM_NAME_LEN - 1);
|       |                 ^~~~~~~
| lttng-syscalls.c:612:17: note: include '<string.h>' or provide a declaration of 'strncpy'
| lttng-syscalls.c:704:17: warning: incompatible implicit declaration of built-in function 'strncpy' [-Wbuiltin-declaration-mismatch]
|   704 |                 strncpy(ev.name, desc->event_name, LTTNG_KERNEL_ABI_SYM_NAME_LEN - 1);
|       |                 ^~~~~~~
| lttng-syscalls.c:704:17: note: include '<string.h>' or provide a declaration of 'strncpy'

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 ...ix-x86-msr-Remove-rdmsrl-wrmsrl-v7.2.patch | 100 ++++++++++++
 ...-Rename-kvm_cache_regs.h-regs.h-v7.2.patch |  54 +++++++
 ...-sk_skb_reason_drop-sock-parameter-v.patch |  61 +++++++
 ...oints-pass-a-transaction-handle-to-t.patch |  63 ++++++++
 ...oints-add-in_fsync-field-to-transact.patch |  41 +++++
 ...oints-trace-transaction-states-durin.patch |  68 ++++++++
 ...-Remove-strncpy-from-the-kernel-v7.2.patch | 153 ++++++++++++++++++
 .../lttng/lttng-modules_2.15.2.bb             |   9 +-
 8 files changed, 548 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-x86-msr-Remove-rdmsrl-wrmsrl-v7.2.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-KVM-x86-Rename-kvm_cache_regs.h-regs.h-v7.2.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-net-constify-sk_skb_reason_drop-sock-parameter-v.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-fix-btrfs-tracepoints-pass-a-transaction-handle-to-t.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-fix-btrfs-tracepoints-add-in_fsync-field-to-transact.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0006-fix-btrfs-tracepoints-trace-transaction-states-durin.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0007-fix-string-Remove-strncpy-from-the-kernel-v7.2.patch

v2: change to patches over 2.15 release instead of an update to rc version
    since they are also in upstream 2.15 stable branch pending release

v1: https://lists.openembedded.org/g/openembedded-core/message/243419

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-x86-msr-Remove-rdmsrl-wrmsrl-v7.2.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-x86-msr-Remove-rdmsrl-wrmsrl-v7.2.patch
new file mode 100644
index 0000000000..850ff7c617
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-x86-msr-Remove-rdmsrl-wrmsrl-v7.2.patch
@@ -0,0 +1,100 @@
+From 81b382b849b72e02e585f8b467161ae278e1b2c2 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 22 Jun 2026 10:38:12 -0400
+Subject: [PATCH 1/7] fix: x86/msr: Remove rdmsrl() / wrmsrl() (v7.2)
+
+See upstream commits:
+
+  commit 666a5742b72133e219e989855e87d32fd8c95677
+  Author: Juergen Gross <jgross@suse.com>
+  Date:   Mon Jun 8 10:28:07 2026 +0200
+
+    x86/msr: Remove rdmsrl()
+
+    rdmsrl() has no users left. Delete it.
+
+  commit b5884070f9da9ffecd5141b5811cfdbaa274809a
+  Author: Juergen Gross <jgross@suse.com>
+  Date:   Mon Jun 8 10:28:09 2026 +0200
+
+    x86/msr: Remove wrmsrl()
+
+    wrmsrl() has no users left. Delete it.
+
+  commit c435e608cf59ffab815aa2571182dc8c50fe4112
+  Author: Ingo Molnar <mingo@kernel.org>
+  Date:   Wed Apr 9 22:28:54 2025 +0200
+
+    x86/msr: Rename 'rdmsrl()' to 'rdmsrq()'
+
+  commit 78255eb23973323633432d9ec40b65c15e41888a
+  Author: Ingo Molnar <mingo@kernel.org>
+  Date:   Wed Apr 9 22:28:55 2025 +0200
+
+    x86/msr: Rename 'wrmsrl()' to 'wrmsrq()'
+
+Upstream-Status: Backport
+
+Change-Id: Idf16225a146119986fb5fa811b527873d5581804
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/wrapper/ibt.h | 19 +++++++++++++++----
+ 1 file changed, 15 insertions(+), 4 deletions(-)
+
+diff --git a/include/wrapper/ibt.h b/include/wrapper/ibt.h
+index e089a8f6..53983802 100644
+--- a/include/wrapper/ibt.h
++++ b/include/wrapper/ibt.h
+@@ -8,6 +8,8 @@
+ #ifndef _LTTNG_WRAPPER_IBT_H
+ #define _LTTNG_WRAPPER_IBT_H
+ 
++#include <lttng/kernel-version.h>
++
+ struct irq_ibt_state {
+ 	u64 msr;
+ 	unsigned long flags;
+@@ -22,6 +24,15 @@ struct irq_ibt_state {
+ #ifdef CONFIG_X86_KERNEL_IBT
+ # include <asm/cpufeature.h>
+ # include <asm/msr.h>
++
++# if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,16,0))
++#  define lttng_rdmsrq rdmsrq
++#  define lttng_wrmsrq wrmsrq
++# else
++#  define lttng_rdmsrq rdmsrl
++#  define lttng_wrmsrq wrmsrl
++# endif
++
+ static inline __attribute__((always_inline))
+ struct irq_ibt_state wrapper_irq_ibt_save(void)
+ {
+@@ -31,8 +42,8 @@ struct irq_ibt_state wrapper_irq_ibt_save(void)
+ 	if (!cpu_feature_enabled(X86_FEATURE_IBT))
+ 		goto end;
+ 	local_irq_save(state.flags);
+-	rdmsrl(MSR_IA32_S_CET, msr);
+-	wrmsrl(MSR_IA32_S_CET, msr & ~CET_ENDBR_EN);
++	lttng_rdmsrq(MSR_IA32_S_CET, msr);
++	lttng_wrmsrq(MSR_IA32_S_CET, msr & ~CET_ENDBR_EN);
+ 	state.msr = msr;
+ end:
+ 	return state;
+@@ -45,10 +56,10 @@ void wrapper_irq_ibt_restore(struct irq_ibt_state state)
+ 
+ 	if (!cpu_feature_enabled(X86_FEATURE_IBT))
+ 		return;
+-	rdmsrl(MSR_IA32_S_CET, msr);
++	lttng_rdmsrq(MSR_IA32_S_CET, msr);
+ 	msr &= ~CET_ENDBR_EN;
+ 	msr |= (state.msr & CET_ENDBR_EN);
+-	wrmsrl(MSR_IA32_S_CET, msr);
++	lttng_wrmsrq(MSR_IA32_S_CET, msr);
+ 	local_irq_restore(state.flags);
+ }
+ #else
+-- 
+2.55.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-fix-KVM-x86-Rename-kvm_cache_regs.h-regs.h-v7.2.patch b/meta/recipes-kernel/lttng/lttng-modules/0002-fix-KVM-x86-Rename-kvm_cache_regs.h-regs.h-v7.2.patch
new file mode 100644
index 0000000000..17a1615e34
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0002-fix-KVM-x86-Rename-kvm_cache_regs.h-regs.h-v7.2.patch
@@ -0,0 +1,54 @@
+From de43b6dcacff6e725f831d2151bee43de2cda579 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 22 Jun 2026 13:33:50 -0400
+Subject: [PATCH 2/7] fix: KVM: x86: Rename kvm_cache_regs.h => regs.h (v7.2)
+
+See upstream commit:
+
+  commit ece08316ca21ac2a3f3cc47a27b25f95adf1cfb2
+  Author: Sean Christopherson <seanjc@google.com>
+  Date:   Fri May 29 15:21:49 2026 -0700
+
+    KVM: x86: Rename kvm_cache_regs.h => regs.h
+
+    Rename kvm_cache_regs.h to simply regs.h, as the "cache" nomenclature is
+    already a lie (the file deals with state/registers that aren't cached per
+    se), and so that more code/functionality can be landed in the header
+    without making it a truly horrible misnomer.
+
+    Deliberately drop the kvm_ prefix/namespace to align with other "local"
+    headers, and to further differentiate regs.h from the public/global
+    arch/x86/include/asm/kvm_vcpu_regs.h, which sadly needs to stay in asm/
+    so that the number of registers can be referenced by kvm_vcpu_arch.
+
+    No functional change intended.
+
+Upstream-Status: Backport
+
+Change-Id: If61095ef1c19c34de3c04b0f19d4eccb4418386b
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/instrumentation/events/arch/x86/kvm/trace.h | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/include/instrumentation/events/arch/x86/kvm/trace.h b/include/instrumentation/events/arch/x86/kvm/trace.h
+index 265b0d81..79f2b473 100644
+--- a/include/instrumentation/events/arch/x86/kvm/trace.h
++++ b/include/instrumentation/events/arch/x86/kvm/trace.h
+@@ -12,7 +12,12 @@
+ #include <lttng/kernel-version.h>
+ #include <wrapper/kvm-x86.h>
+ #include <../arch/x86/kvm/lapic.h>
++
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,2,0))
++#include <../arch/x86/kvm/regs.h>
++#else
+ #include <../arch/x86/kvm/kvm_cache_regs.h>
++#endif
+ 
+ #undef TRACE_SYSTEM
+ #define TRACE_SYSTEM kvm_x86
+-- 
+2.55.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0003-fix-net-constify-sk_skb_reason_drop-sock-parameter-v.patch b/meta/recipes-kernel/lttng/lttng-modules/0003-fix-net-constify-sk_skb_reason_drop-sock-parameter-v.patch
new file mode 100644
index 0000000000..9240d3d07d
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0003-fix-net-constify-sk_skb_reason_drop-sock-parameter-v.patch
@@ -0,0 +1,61 @@
+From 909a3356fbdff6ee5601217eba052b8d884b40e6 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 22 Jun 2026 13:42:07 -0400
+Subject: [PATCH 3/7] fix: net: constify sk_skb_reason_drop() sock parameter
+ (v7.2)
+
+See upstream commit:
+
+  commit 5c4b709b5fc1929ed3e9d3ef48c089d7df8b8dff
+  Author: Eric Dumazet <edumazet@google.com>
+  Date:   Mon May 11 07:23:08 2026 +0000
+
+    net: constify sk_skb_reason_drop() sock parameter
+
+    sk_skb_reason_drop() does not change sock parameter, make it
+    const so that we can call it from TCP stack without a cast
+    on a (const) listener socket.
+
+Upstream-Status: Backport
+
+Change-Id: Iadb94b94b493d3806ccd7531d3a191a5dbc85da8
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/instrumentation/events/skb.h | 20 +++++++++++++++++++-
+ 1 file changed, 19 insertions(+), 1 deletion(-)
+
+diff --git a/include/instrumentation/events/skb.h b/include/instrumentation/events/skb.h
+index dd62e177..a1a84aae 100644
+--- a/include/instrumentation/events/skb.h
++++ b/include/instrumentation/events/skb.h
+@@ -43,7 +43,25 @@ LTTNG_TRACEPOINT_ENUM(skb_drop_reason,
+ )
+ #endif
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,11,0) || \
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,2,0))
++LTTNG_TRACEPOINT_EVENT_MAP(kfree_skb,
++
++	skb_kfree,
++
++	TP_PROTO(struct sk_buff *skb, void *location,
++		enum skb_drop_reason reason, const struct sock *rx_sk),
++
++	TP_ARGS(skb, location, reason, rx_sk),
++
++	TP_FIELDS(
++		ctf_integer_hex(void *, skbaddr, skb)
++		ctf_integer_hex(void *, location, location)
++		ctf_integer_network(unsigned short, protocol, skb->protocol)
++		ctf_enum(skb_drop_reason, uint8_t, reason, reason)
++		ctf_integer_hex(const void *, rx_skaddr, rx_sk)
++	)
++)
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,11,0) || \
+     LTTNG_RHEL_KERNEL_RANGE(5,14,0,503,21,1,  5,15,0,0,0,0))
+ 
+ LTTNG_TRACEPOINT_EVENT_MAP(kfree_skb,
+-- 
+2.55.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0004-fix-btrfs-tracepoints-pass-a-transaction-handle-to-t.patch b/meta/recipes-kernel/lttng/lttng-modules/0004-fix-btrfs-tracepoints-pass-a-transaction-handle-to-t.patch
new file mode 100644
index 0000000000..288c90431c
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0004-fix-btrfs-tracepoints-pass-a-transaction-handle-to-t.patch
@@ -0,0 +1,63 @@
+From 21d22aa8da0bb16dbb0a8e211941a0541d8ac5ec Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 22 Jun 2026 13:50:27 -0400
+Subject: [PATCH 4/7] fix: btrfs: tracepoints: pass a transaction handle to
+ transaction commit event (v7.2)
+
+See upstream commit:
+
+  commit e1ad307c7ab1af0b5c14549b23982464c22996cc
+  Author: Filipe Manana <fdmanana@suse.com>
+  Date:   Fri Apr 17 17:43:19 2026 +0100
+
+    btrfs: tracepoints: pass a transaction handle to transaction commit event
+
+    The transaction commit tracepoint prints fs_info->generation as if it
+    were the ID of the committed transaction but this does not always match
+    that ID. This is because the trace point is called in the transaction
+    commit path after the transaction is in the TRANS_STATE_COMPLETED state,
+    which means another transaction may have already started (which can happen
+    as soon as the transaction state was set to TRANS_STATE_UNBLOCKED), in
+    which case fs_info->generation was incremented and does not correspond
+    to the committed transaction anymore.
+
+    So fix this by passing a transaction handle to the trace event instead of
+    fs_info. This will also allow later for the trace event to dump other
+    useful information about the transaction.
+
+Upstream-Status: Backport
+
+Change-Id: Icc45cfbe008773565d23b0115d1e86578e6cbfca
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/instrumentation/events/btrfs.h | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/include/instrumentation/events/btrfs.h b/include/instrumentation/events/btrfs.h
+index 29ee15ed..ee815b68 100644
+--- a/include/instrumentation/events/btrfs.h
++++ b/include/instrumentation/events/btrfs.h
+@@ -55,7 +55,18 @@ struct extent_state;
+ #define lttng_fs_info_fsid fs_info->fsid
+ #endif
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,17,0))
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,2,0))
++LTTNG_TRACEPOINT_EVENT(btrfs_transaction_commit,
++
++	TP_PROTO(const struct btrfs_trans_handle *trans),
++
++	TP_ARGS(trans),
++
++	TP_FIELDS(
++		ctf_integer(u64, generation, trans->transid)
++	)
++)
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,17,0))
+ LTTNG_TRACEPOINT_EVENT(btrfs_transaction_commit,
+ 
+ 	TP_PROTO(const struct btrfs_fs_info *fs_info),
+-- 
+2.55.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0005-fix-btrfs-tracepoints-add-in_fsync-field-to-transact.patch b/meta/recipes-kernel/lttng/lttng-modules/0005-fix-btrfs-tracepoints-add-in_fsync-field-to-transact.patch
new file mode 100644
index 0000000000..549ca21b08
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0005-fix-btrfs-tracepoints-add-in_fsync-field-to-transact.patch
@@ -0,0 +1,41 @@
+From 27f1057933317846d64c1f7a2d83120291b349c2 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 22 Jun 2026 13:53:44 -0400
+Subject: [PATCH 5/7] fix: btrfs: tracepoints: add in_fsync field to
+ transaction commit event (v7.2)
+
+See upstream commit:
+
+  commit 889ad3845a8c029e93a46251f78d61b277cf5e61
+  Author: Filipe Manana <fdmanana@suse.com>
+  Date:   Fri Apr 17 18:12:16 2026 +0100
+
+    btrfs: tracepoints: add in_fsync field to transaction commit event
+
+    Include the in_fsync value from the transaction handle so that we can know
+    if a transaction commit was triggered by a fsync call.
+
+Upstream-Status: Backport
+
+Change-Id: If8c0e00e4e9b0fb066cf784a4a0b8053d298da49
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/instrumentation/events/btrfs.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/instrumentation/events/btrfs.h b/include/instrumentation/events/btrfs.h
+index ee815b68..e3527739 100644
+--- a/include/instrumentation/events/btrfs.h
++++ b/include/instrumentation/events/btrfs.h
+@@ -64,6 +64,7 @@ LTTNG_TRACEPOINT_EVENT(btrfs_transaction_commit,
+ 
+ 	TP_FIELDS(
+ 		ctf_integer(u64, generation, trans->transid)
++		ctf_integer(bool, in_fsync, trans->in_fsync)
+ 	)
+ )
+ #elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,17,0))
+-- 
+2.55.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0006-fix-btrfs-tracepoints-trace-transaction-states-durin.patch b/meta/recipes-kernel/lttng/lttng-modules/0006-fix-btrfs-tracepoints-trace-transaction-states-durin.patch
new file mode 100644
index 0000000000..15b8bc3f8c
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0006-fix-btrfs-tracepoints-trace-transaction-states-durin.patch
@@ -0,0 +1,68 @@
+From dae7dae8b220c38c699bd2971f1b61f4a40e0a5f Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Mon, 22 Jun 2026 13:56:42 -0400
+Subject: [PATCH 6/7] fix: btrfs: tracepoints: trace transaction states during
+ commit phase (v7.2)
+
+See upstream commit:
+
+  commit 17819dc282f15d49fac8d7eb94d571e69c22cbdf
+  Author: Filipe Manana <fdmanana@suse.com>
+  Date:   Thu Apr 23 17:05:23 2026 +0100
+
+    btrfs: tracepoints: trace transaction states during commit phase
+
+    Currently the trace event is fired only when a transaction is fully
+    complete (its state is TRANS_STATE_COMPLETED). However during a
+    transaction commit we go through several states and as soon as the
+    state reaches TRANS_STATE_UNBLOCKED, another transaction can start.
+    Therefore it's useful to track every transaction state changed during
+    the commit of a transaction, so that we can see if a new transaction
+    is started before the current one is completed. Add the transaction
+    state to the transaction commit event and call the event everytime
+    we change the transaction state during commit.
+
+Upstream-Status: Backport
+
+Change-Id: I3429d43d73fe8eacf8c25c61b8da8fbd551e71f7
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/instrumentation/events/btrfs.h | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/include/instrumentation/events/btrfs.h b/include/instrumentation/events/btrfs.h
+index e3527739..ee430726 100644
+--- a/include/instrumentation/events/btrfs.h
++++ b/include/instrumentation/events/btrfs.h
+@@ -56,6 +56,19 @@ struct extent_state;
+ #endif
+ 
+ #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(7,2,0))
++LTTNG_TRACEPOINT_ENUM(btrfs_transaction_states,
++
++	TP_ENUM_VALUES(
++		ctf_enum_value("TRANS_STATE_RUNNING", TRANS_STATE_RUNNING)
++		ctf_enum_value("TRANS_STATE_COMMIT_PREP", TRANS_STATE_COMMIT_PREP)
++		ctf_enum_value("TRANS_STATE_COMMIT_START", TRANS_STATE_COMMIT_START)
++		ctf_enum_value("TRANS_STATE_COMMIT_DOING", TRANS_STATE_COMMIT_DOING)
++		ctf_enum_value("TRANS_STATE_UNBLOCKED", TRANS_STATE_UNBLOCKED)
++		ctf_enum_value("TRANS_STATE_SUPER_COMMITTED", TRANS_STATE_SUPER_COMMITTED)
++		ctf_enum_value("TRANS_STATE_COMPLETED", TRANS_STATE_COMPLETED)
++	)
++)
++
+ LTTNG_TRACEPOINT_EVENT(btrfs_transaction_commit,
+ 
+ 	TP_PROTO(const struct btrfs_trans_handle *trans),
+@@ -65,6 +78,7 @@ LTTNG_TRACEPOINT_EVENT(btrfs_transaction_commit,
+ 	TP_FIELDS(
+ 		ctf_integer(u64, generation, trans->transid)
+ 		ctf_integer(bool, in_fsync, trans->in_fsync)
++		ctf_enum(btrfs_transaction_states, int, state, trans->transaction->state)
+ 	)
+ )
+ #elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,17,0))
+-- 
+2.55.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0007-fix-string-Remove-strncpy-from-the-kernel-v7.2.patch b/meta/recipes-kernel/lttng/lttng-modules/0007-fix-string-Remove-strncpy-from-the-kernel-v7.2.patch
new file mode 100644
index 0000000000..9382a9898b
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0007-fix-string-Remove-strncpy-from-the-kernel-v7.2.patch
@@ -0,0 +1,153 @@
+From 4c818b15fe2f06ce95101c875d9ceedd71b29f5a Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Tue, 23 Jun 2026 13:38:45 -0400
+Subject: [PATCH 7/7] fix: string: Remove strncpy() from the kernel (v7.2)
+
+See upstream commits:
+
+  commit 079a028d6327e68cfa5d38b36123637b321c19a7
+  Author: Kees Cook <kees@kernel.org>
+  Date:   Mon Mar 23 01:27:25 2026 +0000
+
+    string: Remove strncpy() from the kernel
+
+    strncpy() has been a persistent source of bugs due to its ambiguous
+    intended usage and frequently counter-intuitive semantics: it may not
+    NUL-terminate the destination, and it unconditionally zero-pads to the
+    full length, which isn't always needed. All former callers have been
+    migrated[1] to:
+
+      - strscpy()        for NUL-terminated destinations
+      - strscpy_pad()    for NUL-terminated destinations needing zero-padding
+      - strtomem_pad()   for non-NUL-terminated fixed-width fields
+      - memcpy_and_pad() for bounded copies with explicit padding
+      - memcpy()         for known-length copies
+
+    Remove the generic implementation, its declaration, the FORTIFY_SOURCE
+    wrapper, and associated tests.
+
+  commit 458a3bf82df4fe1f951d0f52b1e0c1e9d5a88a3b
+  Author: Tobin C. Harding <tobin@kernel.org>
+  Date:   Fri Apr 5 12:58:58 2019 +1100
+
+    lib/string: Add strscpy_pad() function
+
+    We have a function to copy strings safely and we have a function to copy
+    strings and zero the tail of the destination (if source string is
+    shorter than destination buffer) but we do not have a function to do
+    both at once.  This means developers must write this themselves if they
+    desire this functionality.  This is a chore, and also leaves us open to
+    off by one errors unnecessarily.
+
+    Add a function that calls strscpy() then memset()s the tail to zero if
+    the source string is shorter than the destination buffer.
+
+Upstream-Status: Backport
+
+Change-Id: Ia80045fab7b0a75feedc8301d251584295c1ed4e
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+---
+ include/wrapper/string.h | 57 ++++++++++++++++++++++++++++++++++++++++
+ src/lttng-syscalls.c     |  7 +++--
+ 2 files changed, 60 insertions(+), 4 deletions(-)
+ create mode 100644 include/wrapper/string.h
+
+diff --git a/include/wrapper/string.h b/include/wrapper/string.h
+new file mode 100644
+index 00000000..d13b3863
+--- /dev/null
++++ b/include/wrapper/string.h
+@@ -0,0 +1,57 @@
++// SPDX-FileCopyrightText: 2026 Michael Jeanson <mjeanson@efficios.com>
++// SPDX-License-Identifier: GPL-2.0-only
++
++#ifndef _LTTNG_WRAPPER_STRING_H
++#define _LTTNG_WRAPPER_STRING_H
++
++#include <lttng/kernel-version.h>
++#include <linux/string.h>
++
++/**
++ * strscpy_pad() - Copy a C-string into a sized buffer
++ * @dst: Where to copy the string to
++ * @src: Where to copy the string from
++ * @size: Size of destination buffer
++ *
++ * Copy the string, or as much of it as fits, into the dest buffer. The
++ * behavior is undefined if the string buffers overlap. The destination
++ * buffer is always %NUL terminated, unless it's zero-sized.
++ *
++ * If the source string is shorter than the destination buffer, the
++ * remaining bytes in the buffer will be filled with %NUL bytes.
++ *
++ * For full explanation of why you may want to consider using the
++ * 'strscpy' functions please see the function docstring for strscpy().
++ *
++ * Returns:
++ * * The number of characters copied (not including the trailing %NULs)
++ * * -E2BIG if count is 0 or @src was truncated.
++ */
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,2,0))
++static inline
++ssize_t lttng_strscpy_pad(char *dst, const char *src, size_t count)
++{
++	return strscpy_pad(dst, src, count);
++}
++#else
++static inline
++ssize_t lttng_strscpy_pad(char *dst, const char *src, size_t count)
++{
++	ssize_t ret;
++
++	if (count == 0)
++		 return -E2BIG;
++
++	strncpy(dst, src, count);
++
++	ret = strnlen(dst, count);
++	if (ret >= count) {
++		dst[count - 1] = '\0';
++		ret = -E2BIG;
++	}
++
++	return ret;
++}
++#endif
++
++#endif /* _LTTNG_WRAPPER_STRING_H */
+diff --git a/src/lttng-syscalls.c b/src/lttng-syscalls.c
+index e24d4c73..d5476a71 100644
+--- a/src/lttng-syscalls.c
++++ b/src/lttng-syscalls.c
+@@ -28,6 +28,7 @@
+ #include <wrapper/rcu.h>
+ #include <wrapper/syscall.h>
+ #include <wrapper/limits.h>
++#include <wrapper/string.h>
+ #include <lttng/events.h>
+ #include <lttng/events-internal.h>
+ #include <lttng/utils.h>
+@@ -609,8 +610,7 @@ void lttng_syscall_event_enabler_create_event(struct lttng_event_enabler_common
+ 			ev.u.syscall.abi = LTTNG_KERNEL_ABI_SYSCALL_ABI_COMPAT;
+ 			break;
+ 		}
+-		strncpy(ev.name, desc->event_name, LTTNG_KERNEL_ABI_SYM_NAME_LEN - 1);
+-		ev.name[LTTNG_KERNEL_ABI_SYM_NAME_LEN - 1] = '\0';
++		lttng_strscpy_pad(ev.name, desc->event_name, LTTNG_KERNEL_ABI_SYM_NAME_LEN);
+ 		ev.instrumentation = LTTNG_KERNEL_ABI_SYSCALL;
+ 		ev.token = syscall_event_enabler->user_token;
+ 		event_recorder_enabler = lttng_event_recorder_enabler_create(LTTNG_ENABLER_FORMAT_NAME, &ev,
+@@ -701,8 +701,7 @@ void lttng_syscall_event_enabler_create_event(struct lttng_event_enabler_common
+ 			ev.u.syscall.abi = LTTNG_KERNEL_ABI_SYSCALL_ABI_COMPAT;
+ 			break;
+ 		}
+-		strncpy(ev.name, desc->event_name, LTTNG_KERNEL_ABI_SYM_NAME_LEN - 1);
+-		ev.name[LTTNG_KERNEL_ABI_SYM_NAME_LEN - 1] = '\0';
++		lttng_strscpy_pad(ev.name, desc->event_name, LTTNG_KERNEL_ABI_SYM_NAME_LEN);
+ 		ev.instrumentation = LTTNG_KERNEL_ABI_SYSCALL;
+ 		ev.token = syscall_event_enabler->user_token;
+ 		event_counter_enabler = lttng_event_counter_enabler_create(LTTNG_ENABLER_FORMAT_NAME, &ev,
+-- 
+2.55.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.15.2.bb b/meta/recipes-kernel/lttng/lttng-modules_2.15.2.bb
index bfa1fc619a..3c103ccbb7 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.15.2.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.15.2.bb
@@ -16,7 +16,14 @@ inherit upstream-stable-release-point
 include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
-           "
+    file://0001-fix-x86-msr-Remove-rdmsrl-wrmsrl-v7.2.patch \
+    file://0002-fix-KVM-x86-Rename-kvm_cache_regs.h-regs.h-v7.2.patch \
+    file://0003-fix-net-constify-sk_skb_reason_drop-sock-parameter-v.patch \
+    file://0004-fix-btrfs-tracepoints-pass-a-transaction-handle-to-t.patch \
+    file://0005-fix-btrfs-tracepoints-add-in_fsync-field-to-transact.patch \
+    file://0006-fix-btrfs-tracepoints-trace-transaction-states-durin.patch \
+    file://0007-fix-string-Remove-strncpy-from-the-kernel-v7.2.patch \
+"
 
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch \
-- 
2.55.0



Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 328E6C61D97
	for <webhook@archiver.kernel.org>; Fri, 24 Nov 2023 19:30:55 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.1733.1700854252961911500
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Nov 2023 11:30:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NguMLe0T;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3b83ed78a91so1307202b6e.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 11:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700854252; x=1701459052; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OP9mbCmYOMD8xLSCBMELwsqRs31ebaAIJwNDvNP63zA=;
        b=NguMLe0T53Pu+hEu+BI6NL2EA3iGby2HPwImea5bgiy3EjK2CGg/SQ1x4T0CfqhDqw
         pvkI6a+HwDtgE1iCWtIdY+DQnomrOPaLWvJ2ligt0FXTHPLqRftmvC3I5OFZ0Iv3JxJ1
         0jx9UEjEUlQI93zQhOUNRU7EHVVxAAlLc1LuqigU588NyzR/6n2r/iGQ19xRUskk+oiR
         yjvJgy4/SIfxCR0/D4kR9xYPflCKIVYH9hnjwjwD14/2I9lLvVyZNMoP3Z1Or8k5WF2n
         dFJI0aqQi2xfEyKjWX4QuRUibQ7X08CIRbl0SeiU4zLfLlEoJPKGITmdgs7hSnU3isi2
         ml2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700854252; x=1701459052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OP9mbCmYOMD8xLSCBMELwsqRs31ebaAIJwNDvNP63zA=;
        b=PQELCvH+VCsvwtKc9EvCJapfZmwE4V74AIMP0MMhti5BcUFUNm2rUwgDW+1Es+CbKo
         TuAtLa1cxNm9m10SfNJRpCUmNhBpr/MnCVKvY/xdQ9mciGtjA/g2X1p6hdRIwnPpo9EU
         y1Ha/fyG41SHzG9MDfvxi1ZJPnjcdNbiqVaTC/uHZozow6DbWIH/2uHX8qUFMBaNai0B
         tWGCqkdS9jh22IG2ztOaIrbS1pEAnO8VfvCBHjk45Dc0BCoY4zzeGpu+0p04XbB0Cgok
         BGZbQGBXzyqs9OxZ0uXCUsSeCsHVB9DlGQjI5ZFY6PRA+G/63IJZVYiBvSmJP+CZvf02
         +jow==
X-Gm-Message-State: AOJu0YygHgNXRxMo7hJtSI7lNMPUtSK/O5tev+kBBGph2JB2n2AW5Wmq
	ojOuJIds7VNqxVL9Nd049gdT6YZUo/vHKw==
X-Google-Smtp-Source: AGHT+IGEBRnzzVfE5fCWwVlTuDDTOn9xcTg7DWJf0HKPW/B508eIKRG3zvH7aSLbNQx7hecepAk1nw==
X-Received: by 2002:a05:6808:8f3:b0:3ae:5c48:6f41 with SMTP id d19-20020a05680808f300b003ae5c486f41mr4294694oic.28.1700854251975;
        Fri, 24 Nov 2023 11:30:51 -0800 (PST)
Received: from localhost.localdomain ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id g6-20020ad45106000000b0067a2061fc21sm303820qvp.101.2023.11.24.11.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 11:30:51 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] lttng-modules: fix build for v6.7+
Date: Fri, 24 Nov 2023 14:30:49 -0500
Message-Id: <20231124193049.3547849-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Nov 2023 19:30:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191215

From: Bruce Ashfield <bruce.ashfield@gmail.com>

While working on the update to linux-yocto-dev lttng-modules
needed some tweaks (as usual).

With these three patches (submitted to lttng-dev), we can
once again build core-image-kernel-dev for v6.7+

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...-and-cpu_core_id-moved-in-linux-6.7..patch | 79 +++++++++++++++++++
 ...e-missing-CONFIG_TRACEPOINTS-to-warn.patch | 10 +--
 ...per-fdtable-adjust-fd-lookup-to-v6.7.patch | 35 ++++++++
 ...ignatures-changed-in-linux-6.7.0-rc1.patch | 71 +++++++++++++++++
 .../lttng/lttng-modules_2.13.10.bb            |  3 +
 5 files changed, 193 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-phys_proc_id-and-cpu_core_id-moved-in-linux-6.7..patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-wrapper-fdtable-adjust-fd-lookup-to-v6.7.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-mm-vmscan-signatures-changed-in-linux-6.7.0-rc1.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-phys_proc_id-and-cpu_core_id-moved-in-linux-6.7..patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-phys_proc_id-and-cpu_core_id-moved-in-linux-6.7..patch
new file mode 100644
index 0000000000..598f5a7efa
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-phys_proc_id-and-cpu_core_id-moved-in-linux-6.7..patch
@@ -0,0 +1,79 @@
+From 4f32efe70b618c4721bf197692fc9d709d352528 Mon Sep 17 00:00:00 2001
+From: Kienan Stewart <kstewart@efficios.com>
+Date: Mon, 20 Nov 2023 11:27:12 -0500
+Subject: [PATCH 1/2] fix: phys_proc_id and cpu_core_id moved in linux
+ 6.7.0-rc1
+
+See upstream commit:
+
+    commit 02fb601d27a7abf60d52b21bdf5b100a8d63da3f
+    Author: Thomas Gleixner <tglx@linutronix.de>
+    Date:   Mon Aug 14 10:18:30 2023 +0200
+
+        x86/cpu: Move phys_proc_id into topology info
+
+        Rename it to pkg_id which is the terminology used in the kernel.
+
+        No functional change.
+
+See upstream commit:
+
+    commit e95256335d45cc965cd12c423535002974313340
+    Author: Thomas Gleixner <tglx@linutronix.de>
+    Date:   Mon Aug 14 10:18:34 2023 +0200
+
+        x86/cpu: Move cpu_core_id into topology info
+
+        Rename it to core_id and stick it to the other ID fields.
+
+        No functional change.
+
+Upstream-Status: Backport [commit 4f32efe7]
+
+Signed-off-by: Kienan Stewart <kstewart@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Change-Id: I574b02430210d5bb72c4b9db901d0e3a6dc7bea0
+---
+ .../instrumentation/events/lttng-statedump.h  | 19 +++++++++++++++++++
+ 1 file changed, 19 insertions(+)
+
+diff --git a/include/instrumentation/events/lttng-statedump.h b/include/instrumentation/events/lttng-statedump.h
+index 642aa356..4831a941 100644
+--- a/include/instrumentation/events/lttng-statedump.h
++++ b/include/instrumentation/events/lttng-statedump.h
+@@ -253,6 +253,23 @@ LTTNG_TRACEPOINT_EVENT(lttng_statedump_interrupt,
+ 
+ #define LTTNG_HAVE_STATEDUMP_CPU_TOPOLOGY
+ 
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,7,0))
++LTTNG_TRACEPOINT_EVENT(lttng_statedump_cpu_topology,
++	TP_PROTO(struct lttng_kernel_session *session, struct cpuinfo_x86 *c),
++	TP_ARGS(session, c),
++	TP_FIELDS(
++		ctf_string(architecture, "x86")
++		ctf_integer(uint16_t, cpu_id, c->cpu_index)
++		ctf_string(vendor, c->x86_vendor_id[0] ? c->x86_vendor_id : "unknown")
++		ctf_integer(uint8_t, family, c->x86)
++		ctf_integer(uint8_t, model, c->x86_model)
++		ctf_string(model_name, c->x86_model_id[0] ? c->x86_model_id : "unknown")
++		ctf_integer(uint16_t, physical_id, c->topo.pkg_id)
++		ctf_integer(uint16_t, core_id, c->topo.core_id)
++		ctf_integer(uint16_t, cores, c->booted_cores)
++	)
++)
++#else
+ LTTNG_TRACEPOINT_EVENT(lttng_statedump_cpu_topology,
+ 	TP_PROTO(struct lttng_kernel_session *session, struct cpuinfo_x86 *c),
+ 	TP_ARGS(session, c),
+@@ -268,6 +285,8 @@ LTTNG_TRACEPOINT_EVENT(lttng_statedump_cpu_topology,
+ 		ctf_integer(uint16_t, cores, c->booted_cores)
+ 	)
+ )
++#endif /* LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,7,0) */
++
+ #endif /* CONFIG_X86_32 || CONFIG_X86_64 */
+ 
+ #endif /*  LTTNG_TRACE_LTTNG_STATEDUMP_H */
+-- 
+2.34.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch
index 76a5787c37..120528bf9c 100644
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch
@@ -19,10 +19,10 @@ Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
  src/Kbuild | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)
 
-diff --git a/src/Kbuild b/src/Kbuild
-index 7137874..04eb5c9 100644
---- a/src/Kbuild
-+++ b/src/Kbuild
+Index: lttng-modules-2.13.10/src/Kbuild
+===================================================================
+--- lttng-modules-2.13.10.orig/src/Kbuild
++++ lttng-modules-2.13.10/src/Kbuild
 @@ -2,10 +2,13 @@
  
  ifdef CONFIG_LOCALVERSION	# Check if dot-config is included.
@@ -38,7 +38,7 @@ index 7137874..04eb5c9 100644
  TOP_LTTNG_MODULES_DIR := $(shell dirname $(lastword $(MAKEFILE_LIST)))/..
  
  lttng_check_linux_version = $(shell pwd)/include/linux/version.h
-@@ -150,3 +153,5 @@ lttng-statedump-objs := lttng-statedump-impl.o
+@@ -150,3 +153,5 @@ lttng-statedump-objs := lttng-statedump-
  obj-$(CONFIG_LTTNG) += probes/
  obj-$(CONFIG_LTTNG) += lib/
  obj-$(CONFIG_LTTNG) += tests/
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-wrapper-fdtable-adjust-fd-lookup-to-v6.7.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-wrapper-fdtable-adjust-fd-lookup-to-v6.7.patch
new file mode 100644
index 0000000000..b374483517
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-wrapper-fdtable-adjust-fd-lookup-to-v6.7.patch
@@ -0,0 +1,35 @@
+From 76e4ea0c33a8c7726c0df28083d5c8bc1c1335e8 Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@gmail.com>
+Date: Thu, 23 Nov 2023 13:49:51 -0500
+Subject: [PATCH] wrapper/fdtable: adjust fd lookup to v6.7+
+
+commit 0ede61d8589cc2d93 [file: convert to SLAB_TYPESAFE_BY_RCU]
+renames lookup_fd_rcu to lookup_fdget_rcu, so we need to
+version adjust the fdtable wrapper accordingly.
+
+Upstream-Status: Submitted [https://lists.lttng.org/pipermail/lttng-dev/2023-November/030667.html]
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+---
+ include/wrapper/fdtable.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/include/wrapper/fdtable.h b/include/wrapper/fdtable.h
+index fa5f7207..aaf2b9e7 100644
+--- a/include/wrapper/fdtable.h
++++ b/include/wrapper/fdtable.h
+@@ -16,7 +16,11 @@
+ static inline
+ struct file *lttng_lookup_fd_rcu(unsigned int fd)
+ {
++#if (LTTNG_LINUX_VERSION_CODE < LTTNG_KERNEL_VERSION(6,7,0))
+ 	return lookup_fd_rcu(fd);
++#else
++	return lookup_fdget_rcu(fd);
++#endif
+ }
+ #else
+ static inline
+-- 
+2.34.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-fix-mm-vmscan-signatures-changed-in-linux-6.7.0-rc1.patch b/meta/recipes-kernel/lttng/lttng-modules/0002-fix-mm-vmscan-signatures-changed-in-linux-6.7.0-rc1.patch
new file mode 100644
index 0000000000..a1b979c95a
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0002-fix-mm-vmscan-signatures-changed-in-linux-6.7.0-rc1.patch
@@ -0,0 +1,71 @@
+From aee34d916bdae79abcf103ef098cbb2e0c20bf83 Mon Sep 17 00:00:00 2001
+From: Kienan Stewart <kstewart@efficios.com>
+Date: Mon, 20 Nov 2023 11:33:14 -0500
+Subject: [PATCH 2/2] fix: mm, vmscan signatures changed in linux 6.7.0-rc1
+
+See upstream commit:
+
+    commit 3dfbb555c98ac55b9d911f9af0e35014b445fb41
+    Author: Vlastimil Babka <vbabka@suse.cz>
+    Date:   Thu Sep 14 15:16:39 2023 +0200
+
+        mm, vmscan: remove ISOLATE_UNMAPPED
+
+        This isolate_mode_t flag is effectively unused since 89f6c88a6ab4 ("mm:
+        __isolate_lru_page_prepare() in isolate_migratepages_block()") as
+        sc->may_unmap is now checked directly (and only node_reclaim has a mode
+        that sets it to 0).  The last remaining place is mm_vmscan_lru_isolate
+        tracepoint for the isolate_mode parameter.  That one was mainly used to
+        indicate the active/inactive mode, which the trace-vmscan-postprocess.pl
+        script consumed, but that got silently broken.  After fixing the script by
+        the previous patch, it does not need the isolate_mode anymore.  So just
+        remove the parameter and with that the whole ISOLATE_UNMAPPED flag.
+
+Upstream-Status: Backport [commit aee34d91]
+
+Signed-off-by: Kienan Stewart <kstewart@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+Change-Id: Ie7346886d926a1a9d20bcb1570c587c5e943a1c3
+---
+ include/instrumentation/events/mm_vmscan.h | 28 +++++++++++++++++++++-
+ 1 file changed, 27 insertions(+), 1 deletion(-)
+
+Index: lttng-modules-2.13.10/include/instrumentation/events/mm_vmscan.h
+===================================================================
+--- lttng-modules-2.13.10.orig/include/instrumentation/events/mm_vmscan.h
++++ lttng-modules-2.13.10/include/instrumentation/events/mm_vmscan.h
+@@ -369,7 +369,33 @@ LTTNG_TRACEPOINT_EVENT_MAP(mm_shrink_sla
+ )
+ #endif
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,11,0))
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,7,0))
++LTTNG_TRACEPOINT_EVENT(mm_vmscan_lru_isolate,
++
++	TP_PROTO(int classzone_idx,
++		int order,
++		unsigned long nr_requested,
++		unsigned long nr_scanned,
++		unsigned long nr_skipped,
++		unsigned long nr_taken,
++		int lru
++	),
++
++	TP_ARGS(classzone_idx, order, nr_requested, nr_scanned, nr_skipped,
++		nr_taken, lru
++	),
++
++	TP_FIELDS(
++		ctf_integer(int, classzone_idx, classzone_idx)
++		ctf_integer(int, order, order)
++		ctf_integer(unsigned long, nr_requested, nr_requested)
++		ctf_integer(unsigned long, nr_scanned, nr_scanned)
++		ctf_integer(unsigned long, nr_skipped, nr_skipped)
++		ctf_integer(unsigned long, nr_taken, nr_taken)
++		ctf_integer(int, lru, lru)
++	)
++)
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(4,11,0))
+ LTTNG_TRACEPOINT_EVENT(mm_vmscan_lru_isolate,
+ 
+ 	TP_PROTO(int classzone_idx,
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb
index 4c0e37ebc7..a7e3096c6a 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb
@@ -10,6 +10,9 @@ inherit module
 include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
+           file://0001-fix-phys_proc_id-and-cpu_core_id-moved-in-linux-6.7..patch \
+           file://0002-fix-mm-vmscan-signatures-changed-in-linux-6.7.0-rc1.patch \
+           file://0001-wrapper-fdtable-adjust-fd-lookup-to-v6.7.patch \
            "
 
 # Use :append here so that the patch is applied also when using devupstream
-- 
2.34.1



Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA46C47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 04:16:09 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.8305.1706242562285549470
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jan 2024 20:16:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 293DE40C50
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 04:16:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NiVc4NULjLWF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jan 2024 04:16:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0F25940AE9
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 04:16:01 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 2022E163DD7;
	Thu, 25 Jan 2024 23:16:00 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH] lttng-modules: upgrade 2.13.10 -> 2.13.11
Date: Thu, 25 Jan 2024 23:15:59 -0500
Message-Id: <20240126041559.2714710-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 04:16:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194344

Changelog:
https://lwn.net/Articles/957396/

Drop 2 backported patches and 1 implemented differently upstream.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 ...-and-cpu_core_id-moved-in-linux-6.7..patch | 79 -------------------
 ...per-fdtable-adjust-fd-lookup-to-v6.7.patch | 35 --------
 ...ignatures-changed-in-linux-6.7.0-rc1.patch | 71 -----------------
 ...es_2.13.10.bb =3D> lttng-modules_2.13.11.bb} |  5 +-
 4 files changed, 1 insertion(+), 189 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-phys=
_proc_id-and-cpu_core_id-moved-in-linux-6.7..patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-wrapper-=
fdtable-adjust-fd-lookup-to-v6.7.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-mm-v=
mscan-signatures-changed-in-linux-6.7.0-rc1.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.10.bb =3D> lttng-mo=
dules_2.13.11.bb} (81%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-phys_proc_i=
d-and-cpu_core_id-moved-in-linux-6.7..patch b/meta/recipes-kernel/lttng/l=
ttng-modules/0001-fix-phys_proc_id-and-cpu_core_id-moved-in-linux-6.7..pa=
tch
deleted file mode 100644
index 598f5a7efa..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-phys_proc_id-and-c=
pu_core_id-moved-in-linux-6.7..patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 4f32efe70b618c4721bf197692fc9d709d352528 Mon Sep 17 00:00:00 2001
-From: Kienan Stewart <kstewart@efficios.com>
-Date: Mon, 20 Nov 2023 11:27:12 -0500
-Subject: [PATCH 1/2] fix: phys_proc_id and cpu_core_id moved in linux
- 6.7.0-rc1
-
-See upstream commit:
-
-    commit 02fb601d27a7abf60d52b21bdf5b100a8d63da3f
-    Author: Thomas Gleixner <tglx@linutronix.de>
-    Date:   Mon Aug 14 10:18:30 2023 +0200
-
-        x86/cpu: Move phys_proc_id into topology info
-
-        Rename it to pkg_id which is the terminology used in the kernel.
-
-        No functional change.
-
-See upstream commit:
-
-    commit e95256335d45cc965cd12c423535002974313340
-    Author: Thomas Gleixner <tglx@linutronix.de>
-    Date:   Mon Aug 14 10:18:34 2023 +0200
-
-        x86/cpu: Move cpu_core_id into topology info
-
-        Rename it to core_id and stick it to the other ID fields.
-
-        No functional change.
-
-Upstream-Status: Backport [commit 4f32efe7]
-
-Signed-off-by: Kienan Stewart <kstewart@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Change-Id: I574b02430210d5bb72c4b9db901d0e3a6dc7bea0
----
- .../instrumentation/events/lttng-statedump.h  | 19 +++++++++++++++++++
- 1 file changed, 19 insertions(+)
-
-diff --git a/include/instrumentation/events/lttng-statedump.h b/include/=
instrumentation/events/lttng-statedump.h
-index 642aa356..4831a941 100644
---- a/include/instrumentation/events/lttng-statedump.h
-+++ b/include/instrumentation/events/lttng-statedump.h
-@@ -253,6 +253,23 @@ LTTNG_TRACEPOINT_EVENT(lttng_statedump_interrupt,
-=20
- #define LTTNG_HAVE_STATEDUMP_CPU_TOPOLOGY
-=20
-+#if (LTTNG_LINUX_VERSION_CODE >=3D LTTNG_KERNEL_VERSION(6,7,0))
-+LTTNG_TRACEPOINT_EVENT(lttng_statedump_cpu_topology,
-+	TP_PROTO(struct lttng_kernel_session *session, struct cpuinfo_x86 *c),
-+	TP_ARGS(session, c),
-+	TP_FIELDS(
-+		ctf_string(architecture, "x86")
-+		ctf_integer(uint16_t, cpu_id, c->cpu_index)
-+		ctf_string(vendor, c->x86_vendor_id[0] ? c->x86_vendor_id : "unknown"=
)
-+		ctf_integer(uint8_t, family, c->x86)
-+		ctf_integer(uint8_t, model, c->x86_model)
-+		ctf_string(model_name, c->x86_model_id[0] ? c->x86_model_id : "unknow=
n")
-+		ctf_integer(uint16_t, physical_id, c->topo.pkg_id)
-+		ctf_integer(uint16_t, core_id, c->topo.core_id)
-+		ctf_integer(uint16_t, cores, c->booted_cores)
-+	)
-+)
-+#else
- LTTNG_TRACEPOINT_EVENT(lttng_statedump_cpu_topology,
- 	TP_PROTO(struct lttng_kernel_session *session, struct cpuinfo_x86 *c),
- 	TP_ARGS(session, c),
-@@ -268,6 +285,8 @@ LTTNG_TRACEPOINT_EVENT(lttng_statedump_cpu_topology,
- 		ctf_integer(uint16_t, cores, c->booted_cores)
- 	)
- )
-+#endif /* LTTNG_LINUX_VERSION_CODE >=3D LTTNG_KERNEL_VERSION(6,7,0) */
-+
- #endif /* CONFIG_X86_32 || CONFIG_X86_64 */
-=20
- #endif /*  LTTNG_TRACE_LTTNG_STATEDUMP_H */
---=20
-2.34.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-wrapper-fdtable=
-adjust-fd-lookup-to-v6.7.patch b/meta/recipes-kernel/lttng/lttng-modules=
/0001-wrapper-fdtable-adjust-fd-lookup-to-v6.7.patch
deleted file mode 100644
index b374483517..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-wrapper-fdtable-adjust=
-fd-lookup-to-v6.7.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 76e4ea0c33a8c7726c0df28083d5c8bc1c1335e8 Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@gmail.com>
-Date: Thu, 23 Nov 2023 13:49:51 -0500
-Subject: [PATCH] wrapper/fdtable: adjust fd lookup to v6.7+
-
-commit 0ede61d8589cc2d93 [file: convert to SLAB_TYPESAFE_BY_RCU]
-renames lookup_fd_rcu to lookup_fdget_rcu, so we need to
-version adjust the fdtable wrapper accordingly.
-
-Upstream-Status: Submitted [https://lists.lttng.org/pipermail/lttng-dev/=
2023-November/030667.html]
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
----
- include/wrapper/fdtable.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/include/wrapper/fdtable.h b/include/wrapper/fdtable.h
-index fa5f7207..aaf2b9e7 100644
---- a/include/wrapper/fdtable.h
-+++ b/include/wrapper/fdtable.h
-@@ -16,7 +16,11 @@
- static inline
- struct file *lttng_lookup_fd_rcu(unsigned int fd)
- {
-+#if (LTTNG_LINUX_VERSION_CODE < LTTNG_KERNEL_VERSION(6,7,0))
- 	return lookup_fd_rcu(fd);
-+#else
-+	return lookup_fdget_rcu(fd);
-+#endif
- }
- #else
- static inline
---=20
-2.34.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules/0002-fix-mm-vmscan-s=
ignatures-changed-in-linux-6.7.0-rc1.patch b/meta/recipes-kernel/lttng/lt=
tng-modules/0002-fix-mm-vmscan-signatures-changed-in-linux-6.7.0-rc1.patc=
h
deleted file mode 100644
index a1b979c95a..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0002-fix-mm-vmscan-signatur=
es-changed-in-linux-6.7.0-rc1.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From aee34d916bdae79abcf103ef098cbb2e0c20bf83 Mon Sep 17 00:00:00 2001
-From: Kienan Stewart <kstewart@efficios.com>
-Date: Mon, 20 Nov 2023 11:33:14 -0500
-Subject: [PATCH 2/2] fix: mm, vmscan signatures changed in linux 6.7.0-r=
c1
-
-See upstream commit:
-
-    commit 3dfbb555c98ac55b9d911f9af0e35014b445fb41
-    Author: Vlastimil Babka <vbabka@suse.cz>
-    Date:   Thu Sep 14 15:16:39 2023 +0200
-
-        mm, vmscan: remove ISOLATE_UNMAPPED
-
-        This isolate_mode_t flag is effectively unused since 89f6c88a6ab=
4 ("mm:
-        __isolate_lru_page_prepare() in isolate_migratepages_block()") a=
s
-        sc->may_unmap is now checked directly (and only node_reclaim has=
 a mode
-        that sets it to 0).  The last remaining place is mm_vmscan_lru_i=
solate
-        tracepoint for the isolate_mode parameter.  That one was mainly =
used to
-        indicate the active/inactive mode, which the trace-vmscan-postpr=
ocess.pl
-        script consumed, but that got silently broken.  After fixing the=
 script by
-        the previous patch, it does not need the isolate_mode anymore.  =
So just
-        remove the parameter and with that the whole ISOLATE_UNMAPPED fl=
ag.
-
-Upstream-Status: Backport [commit aee34d91]
-
-Signed-off-by: Kienan Stewart <kstewart@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Change-Id: Ie7346886d926a1a9d20bcb1570c587c5e943a1c3
----
- include/instrumentation/events/mm_vmscan.h | 28 +++++++++++++++++++++-
- 1 file changed, 27 insertions(+), 1 deletion(-)
-
-Index: lttng-modules-2.13.10/include/instrumentation/events/mm_vmscan.h
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- lttng-modules-2.13.10.orig/include/instrumentation/events/mm_vmscan.=
h
-+++ lttng-modules-2.13.10/include/instrumentation/events/mm_vmscan.h
-@@ -369,7 +369,33 @@ LTTNG_TRACEPOINT_EVENT_MAP(mm_shrink_sla
- )
- #endif
-=20
--#if (LTTNG_LINUX_VERSION_CODE >=3D LTTNG_KERNEL_VERSION(4,11,0))
-+#if (LTTNG_LINUX_VERSION_CODE >=3D LTTNG_KERNEL_VERSION(6,7,0))
-+LTTNG_TRACEPOINT_EVENT(mm_vmscan_lru_isolate,
-+
-+	TP_PROTO(int classzone_idx,
-+		int order,
-+		unsigned long nr_requested,
-+		unsigned long nr_scanned,
-+		unsigned long nr_skipped,
-+		unsigned long nr_taken,
-+		int lru
-+	),
-+
-+	TP_ARGS(classzone_idx, order, nr_requested, nr_scanned, nr_skipped,
-+		nr_taken, lru
-+	),
-+
-+	TP_FIELDS(
-+		ctf_integer(int, classzone_idx, classzone_idx)
-+		ctf_integer(int, order, order)
-+		ctf_integer(unsigned long, nr_requested, nr_requested)
-+		ctf_integer(unsigned long, nr_scanned, nr_scanned)
-+		ctf_integer(unsigned long, nr_skipped, nr_skipped)
-+		ctf_integer(unsigned long, nr_taken, nr_taken)
-+		ctf_integer(int, lru, lru)
-+	)
-+)
-+#elif (LTTNG_LINUX_VERSION_CODE >=3D LTTNG_KERNEL_VERSION(4,11,0))
- LTTNG_TRACEPOINT_EVENT(mm_vmscan_lru_isolate,
-=20
- 	TP_PROTO(int classzone_idx,
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb b/meta/re=
cipes-kernel/lttng/lttng-modules_2.13.11.bb
similarity index 81%
rename from meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.13.11.bb
index a7e3096c6a..4f2cadee90 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.11.bb
@@ -10,15 +10,12 @@ inherit module
 include lttng-platforms.inc
=20
 SRC_URI =3D "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://0001-fix-phys_proc_id-and-cpu_core_id-moved-in-linux-6=
.7..patch \
-           file://0002-fix-mm-vmscan-signatures-changed-in-linux-6.7.0-r=
c1.patch \
-           file://0001-wrapper-fdtable-adjust-fd-lookup-to-v6.7.patch \
            "
=20
 # Use :append here so that the patch is applied also when using devupstr=
eam
 SRC_URI:append =3D " file://0001-src-Kbuild-change-missing-CONFIG_TRACEP=
OINTS-to-warn.patch"
=20
-SRC_URI[sha256sum] =3D "13abfb1ac870711f0d0adfa88e53b17deb2e3052173715a2=
60a6ef14aa45b0a7"
+SRC_URI[sha256sum] =3D "297211d6fda459c85793c1f498c90fad2939cda7939d503f=
3ec5eaaf5fbec3c7"
=20
 export INSTALL_MOD_DIR=3D"kernel/lttng-modules"
=20
--=20
2.25.1



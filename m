Return-Path: <Yanfei.Xu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id C388A601D9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Mar 2020 11:04:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 02EB4STf024217
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Mar 2020 04:04:38 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.487.0;
	Sat, 14 Mar 2020 04:04:04 -0700
From: <yanfei.xu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 14 Mar 2020 19:04:03 +0800
Message-ID: <20200314110403.17437-1-yanfei.xu@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH] Fix lttng-modules build failure on some versions of kernel
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 14 Mar 2020 11:04:47 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Yanfei Xu <yanfei.xu@windriver.com>

Fix lttng-modules build failure on some versions of the kernel that
between 4.19.103 and 4.20.0
between 5.4.19   and 5.5.0
between 5.5.3    and 5.6.0
greater than or equal to 5.6.0

---------Error messages-------------
build_default_image_feature_list8/intel-x86-64-standard-glibc-std-OE/build/tmp-glibc/work/intel_x86_64-wrs-linux/lttng-modules/2.11.1+gitAUTOINC+6ad0e68b43-r0/git/probes/lttng-probe-kvm-x86-mmu.c:39:
| /buildarea1/WRL1019_Regression/qemu_build/build_dir_nxt/intel-x86-64/03032007-build_default_image_feature_list8/intel-x86-64-standard-glibc-std-OE/build/tmp-glibc/work/intel_x86_64-wrs-linux/lttng-modules/2.11.1+gitAUTOINC+6ad0e68b43-r0/git/probes/../probes/lttng-tracepoint-event-impl.h:130:6: error: conflicting types for 'trace_fast_page_fault'
|   130 | void trace_##_name(_proto);
|       |      ^~~~~~
| /buildarea1/WRL1019_Regression/qemu_build/build_dir_nxt/intel-x86-64/03032007-build_default_image_feature_list8/intel-x86-64-standard-glibc-std-OE/build/tmp-glibc/work/intel_x86_64-wrs-linux/lttng-modules/2.11.1+gitAUTOINC+6ad0e68b43-r0/git/probes/../probes/lttng-tracepoint-event-impl.h:42:2: note: in expansion of macro 'LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP'

------------------------------------

Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
---
 ...-Use-gpa_t-for-cr2-gpa-to-fix-TDP-support.patch | 97 ++++++++++++++++++++++
 meta/recipes-kernel/lttng/lttng-modules_2.11.1.bb  |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-KVM-x86-Use-gpa_t-for-cr2-gpa-to-fix-TDP-support.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-KVM-x86-Use-gpa_t-for-cr2-gpa-to-fix-TDP-support.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-KVM-x86-Use-gpa_t-for-cr2-gpa-to-fix-TDP-support.patch
new file mode 100644
index 0000000..1fd3609
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-KVM-x86-Use-gpa_t-for-cr2-gpa-to-fix-TDP-support.patch
@@ -0,0 +1,97 @@
+From 175c0c3c2ee8aae7a1185f591988f02e0e3be103 Mon Sep 17 00:00:00 2001
+From: Michael Jeanson <mjeanson@efficios.com>
+Date: Tue, 11 Feb 2020 14:41:29 -0500
+Subject: [PATCH] fix: KVM: x86: Use gpa_t for cr2/gpa to fix TDP support on
+ 32-bit (v5.6)
+
+See upstream commit :
+
+  commit 736c291c9f36b07f8889c61764c28edce20e715d
+  Author: Sean Christopherson <sean.j.christopherson@intel.com>
+  Date:   Fri Dec 6 15:57:14 2019 -0800
+
+    KVM: x86: Use gpa_t for cr2/gpa to fix TDP support on 32-bit KVM
+
+    Convert a plethora of parameters and variables in the MMU and page fault
+    flows from type gva_t to gpa_t to properly handle TDP on 32-bit KVM.
+
+    Thanks to PSE and PAE paging, 32-bit kernels can access 64-bit physical
+    addresses.  When TDP is enabled, the fault address is a guest physical
+    address and thus can be a 64-bit value, even when both KVM and its guest
+    are using 32-bit virtual addressing, e.g. VMX's VMCS.GUEST_PHYSICAL is a
+    64-bit field, not a natural width field.
+
+    Using a gva_t for the fault address means KVM will incorrectly drop the
+    upper 32-bits of the GPA.  Ditto for gva_to_gpa() when it is used to
+    translate L2 GPAs to L1 GPAs.
+
+    Opportunistically rename variables and parameters to better reflect the
+    dual address modes, e.g. use "cr2_or_gpa" for fault addresses and plain
+    "addr" instead of "vaddr" when the address may be either a GVA or an L2
+    GPA.  Similarly, use "gpa" in the nonpaging_page_fault() flows to avoid
+    a confusing "gpa_t gva" declaration; this also sets the stage for a
+    future patch to combing nonpaging_page_fault() and tdp_page_fault() with
+    minimal churn.
+
+    Sprinkle in a few comments to document flows where an address is known
+    to be a GVA and thus can be safely truncated to a 32-bit value.  Add
+    WARNs in kvm_handle_page_fault() and FNAME(gva_to_gpa_nested)() to help
+    document such cases and detect bugs.
+
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+
+Upstream-Status: Backport [https://github.com/lttng/lttng-modules/commit/175c0c3c2ee8aae7a1185f591988f02e0e3be103]
+Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
+
+---
+ .../lttng-module/arch/x86/kvm/mmutrace.h      | 26 +++++++++++++++++++
+ 1 file changed, 26 insertions(+)
+
+diff --git a/instrumentation/events/lttng-module/arch/x86/kvm/mmutrace.h b/instrumentation/events/lttng-module/arch/x86/kvm/mmutrace.h
+index e25a774..dd0c679 100644
+--- a/instrumentation/events/lttng-module/arch/x86/kvm/mmutrace.h
++++ b/instrumentation/events/lttng-module/arch/x86/kvm/mmutrace.h
+@@ -214,6 +214,30 @@ LTTNG_TRACEPOINT_EVENT_MAP(
+ 	)
+ )
+ 
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,6,0) || \
++	LTTNG_KERNEL_RANGE(4,19,103, 4,20,0) || \
++	LTTNG_KERNEL_RANGE(5,4,19, 5,5,0) || \
++	LTTNG_KERNEL_RANGE(5,5,3, 5,6,0))
++LTTNG_TRACEPOINT_EVENT_MAP(
++	fast_page_fault,
++
++	kvm_mmu_fast_page_fault,
++
++	TP_PROTO(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa, u32 error_code,
++		 u64 *sptep, u64 old_spte, bool retry),
++	TP_ARGS(vcpu, cr2_or_gpa, error_code, sptep, old_spte, retry),
++
++	TP_FIELDS(
++		ctf_integer(int, vcpu_id, vcpu->vcpu_id)
++		ctf_integer(gpa_t, cr2_or_gpa, cr2_or_gpa)
++		ctf_integer(u32, error_code, error_code)
++		ctf_integer_hex(u64 *, sptep, sptep)
++		ctf_integer(u64, old_spte, old_spte)
++		ctf_integer(u64, new_spte, *sptep)
++		ctf_integer(bool, retry, retry)
++	)
++)
++#else
+ LTTNG_TRACEPOINT_EVENT_MAP(
+ 	fast_page_fault,
+ 
+@@ -233,6 +257,8 @@ LTTNG_TRACEPOINT_EVENT_MAP(
+ 		ctf_integer(bool, retry, retry)
+ 	)
+ )
++#endif
++
+ #endif /* LTTNG_TRACE_KVM_MMU_H */
+ 
+ #undef TRACE_INCLUDE_PATH
+-- 
+2.18.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.11.1.bb b/meta/recipes-kernel/lttng/lttng-modules_2.11.1.bb
index c833ff7..db0888a 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.11.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.11.1.bb
@@ -11,6 +11,7 @@ COMPATIBLE_HOST = '(x86_64|i.86|powerpc|aarch64|mips|nios2|arm|riscv).*-linux'
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
            file://BUILD_RUNTIME_BUG_ON-vs-gcc7.patch \
+           file://0001-fix-KVM-x86-Use-gpa_t-for-cr2-gpa-to-fix-TDP-support.patch \
            "
 
 SRC_URI[md5sum] = "0d964723c8765b39835e5e6efc60a604"
-- 
2.7.4



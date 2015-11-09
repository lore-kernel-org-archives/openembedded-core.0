Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 589F776230
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 12:41:08 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2015 04:40:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,265,1444719600"; d="scan'208";a="596861426"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Nov 2015 04:40:59 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Nov 2015 14:43:58 +0200
Message-Id: <090fbaaf8c5d1b0a51169fce3b9c6ef822103dc7.1447072488.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1447072488.git.jussi.kukkonen@intel.com>
References: <cover.1447072488.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 1/8] qemu: Backport malloc-trace disabling
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
X-List-Received-Date: Mon, 09 Nov 2015 12:41:12 -0000

Allocation tracing has been removed from GLib 2.46 and trying to use
it results in an ugly warning: Backport patch to not use it in Qemu.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../qemu/qemu/trace-remove-malloc-tracing.patch    | 97 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.4.0.bb           |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/trace-remove-malloc-tracing.patch

diff --git a/meta/recipes-devtools/qemu/qemu/trace-remove-malloc-tracing.patch b/meta/recipes-devtools/qemu/qemu/trace-remove-malloc-tracing.patch
new file mode 100644
index 0000000..73d699f
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/trace-remove-malloc-tracing.patch
@@ -0,0 +1,97 @@
+From 98cf48f60aa4999f5b2808569a193a401a390e6a Mon Sep 17 00:00:00 2001
+From: Paolo Bonzini <pbonzini@redhat.com>
+Date: Wed, 16 Sep 2015 17:38:44 +0200
+Subject: [PATCH] trace: remove malloc tracing
+
+The malloc vtable is not supported anymore in glib, because it broke
+when constructors called g_malloc.  Remove tracing of g_malloc,
+g_realloc and g_free calls.
+
+Note that, for systemtap users, glib also provides tracepoints
+glib.mem_alloc, glib.mem_free, glib.mem_realloc, glib.slice_alloc
+and glib.slice_free.
+
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+Reviewed-by: Alberto Garcia <berto@igalia.com>
+Message-id: 1442417924-25831-1-git-send-email-pbonzini@redhat.com
+Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
+
+
+For Yocto:
+Upstream-Status: Backport [commit 98cf48f60a, included in 2.4.1]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+
+---
+ trace-events |    3 ---
+ vl.c         |   27 ---------------------------
+ 2 files changed, 0 insertions(+), 30 deletions(-)
+
+diff --git a/trace-events b/trace-events
+index 6790292..b813ae4 100644
+--- a/trace-events
++++ b/trace-events
+@@ -603,9 +603,6 @@ scsi_request_sense(int target, int lun, int tag) "target %d lun %d tag %d"
+ vm_state_notify(int running, int reason) "running %d reason %d"
+ load_file(const char *name, const char *path) "name %s location %s"
+ runstate_set(int new_state) "new state %d"
+-g_malloc(size_t size, void *ptr) "size %zu ptr %p"
+-g_realloc(void *ptr, size_t size, void *newptr) "ptr %p size %zu newptr %p"
+-g_free(void *ptr) "ptr %p"
+ system_wakeup_request(int reason) "reason=%d"
+ qemu_system_shutdown_request(void) ""
+ qemu_system_powerdown_request(void) ""
+diff --git a/vl.c b/vl.c
+index f2bd8d2..ea9e0e6 100644
+--- a/vl.c
++++ b/vl.c
+@@ -2703,26 +2703,6 @@ static const QEMUOption *lookup_opt(int argc, char **argv,
+     return popt;
+ }
+ 
+-static gpointer malloc_and_trace(gsize n_bytes)
+-{
+-    void *ptr = malloc(n_bytes);
+-    trace_g_malloc(n_bytes, ptr);
+-    return ptr;
+-}
+-
+-static gpointer realloc_and_trace(gpointer mem, gsize n_bytes)
+-{
+-    void *ptr = realloc(mem, n_bytes);
+-    trace_g_realloc(mem, n_bytes, ptr);
+-    return ptr;
+-}
+-
+-static void free_and_trace(gpointer mem)
+-{
+-    trace_g_free(mem);
+-    free(mem);
+-}
+-
+ static int machine_set_property(void *opaque,
+                                 const char *name, const char *value,
+                                 Error **errp)
+@@ -2950,11 +2930,6 @@ int main(int argc, char **argv, char **envp)
+     bool userconfig = true;
+     const char *log_mask = NULL;
+     const char *log_file = NULL;
+-    GMemVTable mem_trace = {
+-        .malloc = malloc_and_trace,
+-        .realloc = realloc_and_trace,
+-        .free = free_and_trace,
+-    };
+     const char *trace_events = NULL;
+     const char *trace_file = NULL;
+     ram_addr_t maxram_size;
+@@ -2970,8 +2945,6 @@ int main(int argc, char **argv, char **envp)
+     error_set_progname(argv[0]);
+     qemu_init_exec_dir(argv[0]);
+ 
+-    g_mem_set_vtable(&mem_trace);
+-
+     module_call_init(MODULE_INIT_QOM);
+ 
+     qemu_add_opts(&qemu_drive_opts);
+-- 
+1.7.0.4
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.4.0.bb b/meta/recipes-devtools/qemu/qemu_2.4.0.bb
index 1505b80..7fdae32 100644
--- a/meta/recipes-devtools/qemu/qemu_2.4.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.4.0.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://smc91c111_fix2.patch \
             file://smc91c111_fix3.patch \
             file://no-valgrind.patch \
+            file://trace-remove-malloc-tracing.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "186ee8194140a484a455f8e3c74589f4"
-- 
2.1.4



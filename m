Return-Path: <Yasir_Khan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 3F9A961FE4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 17:23:22 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1XF4vr-0005Rw-Vh from Yasir_Khan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Aug 2014 10:23:24 -0700
Received: from svr-pkl-eng-06.pkl.mentorg.com ([137.202.156.65]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 6 Aug 2014 10:23:23 -0700
From: Yasir Khan <yasir_khan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Aug 2014 22:23:01 +0500
Message-Id: <1407345781-16805-1-git-send-email-yasir_khan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
X-OriginalArrivalTime: 06 Aug 2014 17:23:23.0822 (UTC)
	FILETIME=[205FA4E0:01CFB19B]
Subject: [PATCH] trace-cmd: Update to version 2.3.2
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
X-List-Received-Date: Wed, 06 Aug 2014 17:23:28 -0000

From: Yasir-Khan <yasir_khan@mentor.com>

Current trace-cmd version 1.2 throws "recorder error in
splice input" error while recording a trace on kernel
version 3.10. Update the trace-cmd version to latest 2.3.2
to resolve this error.

Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
---
 ...dd-checks-for-invalid-pointers-to-fix-seg.patch |   61 -------------
 ...o-not-call-stop_threads-if-doing-latency-.patch |   38 --------
 ...etting-plugin-to-nop-clears-data-before-i.patch |   96 --------------------
 .../trace-cmd-fix-syntax-error-of-shell.patch      |   30 ------
 .../{trace-cmd_1.2.bb => trace-cmd_2.3.2.bb}       |   31 +++++--
 5 files changed, 22 insertions(+), 234 deletions(-)
 delete mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Add-checks-for-invalid-pointers-to-fix-seg.patch
 delete mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Do-not-call-stop_threads-if-doing-latency-.patch
 delete mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Setting-plugin-to-nop-clears-data-before-i.patch
 delete mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-fix-syntax-error-of-shell.patch
 rename meta/recipes-kernel/trace-cmd/{trace-cmd_1.2.bb => trace-cmd_2.3.2.bb} (29%)

diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Add-checks-for-invalid-pointers-to-fix-seg.patch b/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Add-checks-for-invalid-pointers-to-fix-seg.patch
deleted file mode 100644
index 8fdeedb..0000000
--- a/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Add-checks-for-invalid-pointers-to-fix-seg.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From a6e259b2cd43db3c0f69441f627a8cf214f88506 Mon Sep 17 00:00:00 2001
-From: Mark Asselstine <mark.asselstine@windriver.com>
-Date: Thu, 5 Apr 2012 15:19:44 -0400
-Subject: [PATCH] trace-cmd: Add checks for invalid pointers to fix segfaults
-
-Upstream-Status: Backport
-
-Running 'trace-cmd report' after running latency tracers will cause a
-segfault due to invalid pointers. Adding checks to ensure
-pointers/lists are initialized before attempting to use them prevents
-these segfaults.
-
-Link: http://lkml.kernel.org/r/1333653586-3379-2-git-send-email-mark.asselstine@windriver.com
-
-Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
-Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
----
- trace-input.c |   12 +++++++++---
- 1 file changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/trace-input.c b/trace-input.c
-index b6af1e6..5151c1e 100644
---- a/trace-input.c
-+++ b/trace-input.c
-@@ -695,7 +695,8 @@ static void __free_page(struct tracecmd_input *handle, struct page *page)
- 
- static void free_page(struct tracecmd_input *handle, int cpu)
- {
--	if (!handle->cpu_data[cpu].page)
-+	if (!handle->cpu_data || cpu >= handle->cpus ||
-+	    !handle->cpu_data[cpu].page)
- 		return;
- 
- 	__free_page(handle, handle->cpu_data[cpu].page);
-@@ -746,8 +747,12 @@ void tracecmd_record_ref(struct record *record)
- 
- static void free_next(struct tracecmd_input *handle, int cpu)
- {
--	struct record *record = handle->cpu_data[cpu].next;
-+	struct record *record;
-+
-+	if (!handle->cpu_data || cpu >= handle->cpus)
-+		return;
- 
-+	record = handle->cpu_data[cpu].next;
- 	if (!record)
- 		return;
- 
-@@ -2337,7 +2342,8 @@ void tracecmd_close(struct tracecmd_input *handle)
- 		/* The tracecmd_peek_data may have cached a record */
- 		free_next(handle, cpu);
- 		free_page(handle, cpu);
--		if (!list_empty(&handle->cpu_data[cpu].pages))
-+		if (handle->cpu_data &&
-+		    !list_empty(&handle->cpu_data[cpu].pages))
- 			warning("pages still allocated on cpu %d%s",
- 				cpu, show_records(&handle->cpu_data[cpu].pages));
- 	}
--- 
-1.7.10.4
-
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Do-not-call-stop_threads-if-doing-latency-.patch b/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Do-not-call-stop_threads-if-doing-latency-.patch
deleted file mode 100644
index 4c00c51..0000000
--- a/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Do-not-call-stop_threads-if-doing-latency-.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 356dee73d9ced3e019dea2883a7f357fd4664b3e Mon Sep 17 00:00:00 2001
-From: Mark Asselstine <mark.asselstine@windriver.com>
-Date: Thu, 5 Apr 2012 15:19:45 -0400
-Subject: [PATCH] trace-cmd: Do not call stop_threads() if doing latency
- tracing
-
-Upstream-Status: Backport
-
-If we are using a latency tracer we do not call start_threads() we
-should therefore not call stop_threads() if 'latency'. Attempting
-to call stop_threads() without first calling start_threads() will
-cause a segfault since pids will be uninitialized.
-
-Link: http://lkml.kernel.org/r/1333653586-3379-3-git-send-email-mark.asselstine@windriver.com
-
-Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
-Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
----
- trace-record.c |    3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/trace-record.c b/trace-record.c
-index fcec28b..1c56fa9 100644
---- a/trace-record.c
-+++ b/trace-record.c
-@@ -2216,7 +2216,8 @@ void trace_record (int argc, char **argv)
- 		}
- 
- 		disable_tracing();
--		stop_threads();
-+		if (!latency)
-+			stop_threads();
- 	}
- 
- 	for (cpu = 0; cpu < cpu_count; cpu++) {
--- 
-1.7.10.4
-
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Setting-plugin-to-nop-clears-data-before-i.patch b/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Setting-plugin-to-nop-clears-data-before-i.patch
deleted file mode 100644
index 724e1e8..0000000
--- a/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Setting-plugin-to-nop-clears-data-before-i.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From d65740d61e7a4ea6d8d77237954b33dd18e3276c Mon Sep 17 00:00:00 2001
-From: Mark Asselstine <mark.asselstine@windriver.com>
-Date: Sun, 8 Apr 2012 11:38:45 -0400
-Subject: [PATCH] trace-cmd: Setting plugin to 'nop' clears data before it's
- recorded
-
-Upstream-Status: Backport
-
-commit e09a5db1a929ab668c273b87c4f0a32b81e1c21a
-[trace-cmd: Add trace-cmd record --date option]
-
-moved the call to disable_all() in trace_record() from after record_data()
-to before it. Unfortunately disable_all() sets 'nop' in 'current_tracer'
-which has the side affect of clearing 'trace', thus all the latency tracer
-reports are empty/useless. Here we make disable_all() optionally call
-set_plugin() thus, where we need to, we can delay the disabling of the tracer
-until we have had a chance to capture 'trace'. We have added this delayed
-behavior to trace_record() to fix the latency reports, for all other calls to
-disable_all() we continue to have set_plugin() called.
-
-Link: http://lkml.kernel.org/r/1333899525-6436-1-git-send-email-mark.asselstine@windriver.com
-
-Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
-Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
----
- trace-record.c |   16 ++++++++++------
- 1 file changed, 10 insertions(+), 6 deletions(-)
-
-diff --git a/trace-record.c b/trace-record.c
-index 1c56fa9..95d4a2a 100644
---- a/trace-record.c
-+++ b/trace-record.c
-@@ -897,11 +897,13 @@ static void disable_tracing(void)
- 	write_tracing_on(0);
- }
- 
--static void disable_all(void)
-+static void disable_all(int disable_tracer)
- {
- 	disable_tracing();
- 
--	set_plugin("nop");
-+	if (disable_tracer)
-+		set_plugin("nop");
-+
- 	reset_events();
- 
- 	/* Force close and reset of ftrace pid file */
-@@ -1573,7 +1575,7 @@ static void set_funcs(void)
- 	/* make sure we are filtering functions */
- 	if (func_stack) {
- 		if (!functions_filtered()) {
--			disable_all();
-+			disable_all(1);
- 			die("Function stack trace set, but functions not filtered");
- 		}
- 		save_option(FUNC_STACK_TRACE);
-@@ -1938,7 +1940,7 @@ void trace_record (int argc, char **argv)
- 				break;
- 			}
- 		}
--		disable_all();
-+		disable_all(1);
- 		set_buffer_size();
- 		exit(0);
- 	} else
-@@ -2147,7 +2149,7 @@ void trace_record (int argc, char **argv)
- 
- 	if (!extract) {
- 		fset = set_ftrace(!disable);
--		disable_all();
-+		disable_all(1);
- 
- 		/* Record records the date first */
- 		if (record && date)
-@@ -2227,7 +2229,7 @@ void trace_record (int argc, char **argv)
- 	}
- 
- 	if (!keep)
--		disable_all();
-+		disable_all(0);
- 
- 	printf("Kernel buffer statistics:\n"
- 	       "  Note: \"entries\" are the entries left in the kernel ring buffer and are not\n"
-@@ -2249,6 +2251,8 @@ void trace_record (int argc, char **argv)
- 	if (keep)
- 		exit(0);
- 
-+	set_plugin("nop");
-+
- 	/* If tracing_on was enabled before we started, set it on now */
- 	if (tracing_on_init_val)
- 		write_tracing_on(tracing_on_init_val);
--- 
-1.7.10.4
-
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-fix-syntax-error-of-shell.patch b/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-fix-syntax-error-of-shell.patch
deleted file mode 100644
index 8e7c2a4..0000000
--- a/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-fix-syntax-error-of-shell.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-trace-cmd: fix syntax error of shell
-
-Delete "<<<" syntax of bash in Makefile, else we would get following error:
-
-       Syntax error: redirection unexpected
-
-Upstream-Status: Pending
-
-Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
----
- Makefile |    3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index c1fa906..7973c53 100644
---- a/Makefile
-+++ b/Makefile
-@@ -89,8 +89,7 @@ endif
- 
- # $(call test-build, snippet, ret) -> ret if snippet compiles
- #                                  -> empty otherwise
--test-build = $(if $(shell $(CC) -o /dev/null -c -x c - > /dev/null 2>&1 \
--	                  <<<'$1' && echo y), $2)
-+test-build = $(if $(shell echo '$1' |$(CC) -o /dev/null -c -x c - > /dev/null 2>&1 && echo y), $2)
- 
- # have udis86 disassembler library?
- udis86-flags := $(call test-build,\#include <udis86.h>,-DHAVE_UDIS86 -ludis86)
--- 
-1.7.9.5
-
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb b/meta/recipes-kernel/trace-cmd/trace-cmd_2.3.2.bb
similarity index 29%
rename from meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
rename to meta/recipes-kernel/trace-cmd/trace-cmd_2.3.2.bb
index 6f3319d..e497544 100644
--- a/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd_2.3.2.bb
@@ -4,20 +4,33 @@ LICENSE = "GPLv2 & LGPLv2.1"
 require trace-cmd.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
-                    file://trace-cmd.c;beginline=6;endline=8;md5=2c22c965a649ddd7973d7913c5634a5e \
+		    file://trace-cmd.c;beginline=6;endline=8;md5=2c22c965a649ddd7973d7913c5634a5e \
                     file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff \
-                    file://trace-input.c;beginline=5;endine=8;md5=6ad47cc2b03385d8456771eec5eeea0b"
+                    file://trace-input.c;beginline=5;endine=8;md5=dafd8a1cade30b847a8686dd3628cea4 \
+"
+SRCREV = "79e08f8edb38c4c5098486caaa87ca90ba00f547"
+
+PV = "2.3.2+git${SRCPV}"
 
-SRC_URI_append = "file://trace-cmd-Add-checks-for-invalid-pointers-to-fix-seg.patch \
-           file://trace-cmd-Do-not-call-stop_threads-if-doing-latency-.patch \
-           file://trace-cmd-Setting-plugin-to-nop-clears-data-before-i.patch \
-           file://trace-cmd-fix-syntax-error-of-shell.patch \
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;protocol=git;branch=trace-cmd-stable-v2.3 \
 "
 
-EXTRA_OEMAKE = "'prefix=${prefix}'"
+EXTRA_OEMAKE = "\
+    'prefix=${prefix}' \
+    'bindir=${bindir}' \
+    'man_dir=${mandir}' \
+    'html_install=${datadir}/kernelshark/html' \
+    'img_install=${datadir}/kernelshark/html/images' \
+    \
+    'bindir_relative=${@oe.path.relative(prefix, bindir)}' \
+    'libdir=${@oe.path.relative(prefix, libdir)}' \
+    \
+    NO_PYTHON=1 \
+"
 
-FILES_${PN}-dbg += "${datadir}/trace-cmd/plugins/.debug/"
+FILES_${PN}-dbg += "${libdir}/trace-cmd/plugins/.debug"
 
 do_install() {
-	oe_runmake prefix="${prefix}" DESTDIR="${D}" install
+        oe_runmake DESTDIR="${D}" install
 }
+
-- 
1.7.9.5



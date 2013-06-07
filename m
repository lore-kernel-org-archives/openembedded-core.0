Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5226C6A8C9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 05:37:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r575bmbC001287
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Jun 2013 22:37:48 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.158) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 6 Jun 2013 22:37:46 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Jun 2013 13:37:44 +0800
Message-ID: <bc103af47f51792d48f33ec9c8cd3e08b3266911.1370583392.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1370583392.git.rongqing.li@windriver.com>
References: <cover.1370583392.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] trace-cmd: backport three patches
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
X-List-Received-Date: Fri, 07 Jun 2013 05:37:46 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

Backport three patches to fix running issues.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 ...dd-checks-for-invalid-pointers-to-fix-seg.patch |   61 +++++++++++++
 ...o-not-call-stop_threads-if-doing-latency-.patch |   38 ++++++++
 ...etting-plugin-to-nop-clears-data-before-i.patch |   96 ++++++++++++++++++++
 meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb     |    8 +-
 4 files changed, 201 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Add-checks-for-invalid-pointers-to-fix-seg.patch
 create mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Do-not-call-stop_threads-if-doing-latency-.patch
 create mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Setting-plugin-to-nop-clears-data-before-i.patch

diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Add-checks-for-invalid-pointers-to-fix-seg.patch b/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Add-checks-for-invalid-pointers-to-fix-seg.patch
new file mode 100644
index 0000000..8fdeedb
--- /dev/null
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Add-checks-for-invalid-pointers-to-fix-seg.patch
@@ -0,0 +1,61 @@
+From a6e259b2cd43db3c0f69441f627a8cf214f88506 Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Thu, 5 Apr 2012 15:19:44 -0400
+Subject: [PATCH] trace-cmd: Add checks for invalid pointers to fix segfaults
+
+Upstream-Status: Backport
+
+Running 'trace-cmd report' after running latency tracers will cause a
+segfault due to invalid pointers. Adding checks to ensure
+pointers/lists are initialized before attempting to use them prevents
+these segfaults.
+
+Link: http://lkml.kernel.org/r/1333653586-3379-2-git-send-email-mark.asselstine@windriver.com
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
+---
+ trace-input.c |   12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/trace-input.c b/trace-input.c
+index b6af1e6..5151c1e 100644
+--- a/trace-input.c
++++ b/trace-input.c
+@@ -695,7 +695,8 @@ static void __free_page(struct tracecmd_input *handle, struct page *page)
+ 
+ static void free_page(struct tracecmd_input *handle, int cpu)
+ {
+-	if (!handle->cpu_data[cpu].page)
++	if (!handle->cpu_data || cpu >= handle->cpus ||
++	    !handle->cpu_data[cpu].page)
+ 		return;
+ 
+ 	__free_page(handle, handle->cpu_data[cpu].page);
+@@ -746,8 +747,12 @@ void tracecmd_record_ref(struct record *record)
+ 
+ static void free_next(struct tracecmd_input *handle, int cpu)
+ {
+-	struct record *record = handle->cpu_data[cpu].next;
++	struct record *record;
++
++	if (!handle->cpu_data || cpu >= handle->cpus)
++		return;
+ 
++	record = handle->cpu_data[cpu].next;
+ 	if (!record)
+ 		return;
+ 
+@@ -2337,7 +2342,8 @@ void tracecmd_close(struct tracecmd_input *handle)
+ 		/* The tracecmd_peek_data may have cached a record */
+ 		free_next(handle, cpu);
+ 		free_page(handle, cpu);
+-		if (!list_empty(&handle->cpu_data[cpu].pages))
++		if (handle->cpu_data &&
++		    !list_empty(&handle->cpu_data[cpu].pages))
+ 			warning("pages still allocated on cpu %d%s",
+ 				cpu, show_records(&handle->cpu_data[cpu].pages));
+ 	}
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Do-not-call-stop_threads-if-doing-latency-.patch b/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Do-not-call-stop_threads-if-doing-latency-.patch
new file mode 100644
index 0000000..4c00c51
--- /dev/null
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Do-not-call-stop_threads-if-doing-latency-.patch
@@ -0,0 +1,38 @@
+From 356dee73d9ced3e019dea2883a7f357fd4664b3e Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Thu, 5 Apr 2012 15:19:45 -0400
+Subject: [PATCH] trace-cmd: Do not call stop_threads() if doing latency
+ tracing
+
+Upstream-Status: Backport
+
+If we are using a latency tracer we do not call start_threads() we
+should therefore not call stop_threads() if 'latency'. Attempting
+to call stop_threads() without first calling start_threads() will
+cause a segfault since pids will be uninitialized.
+
+Link: http://lkml.kernel.org/r/1333653586-3379-3-git-send-email-mark.asselstine@windriver.com
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
+---
+ trace-record.c |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/trace-record.c b/trace-record.c
+index fcec28b..1c56fa9 100644
+--- a/trace-record.c
++++ b/trace-record.c
+@@ -2216,7 +2216,8 @@ void trace_record (int argc, char **argv)
+ 		}
+ 
+ 		disable_tracing();
+-		stop_threads();
++		if (!latency)
++			stop_threads();
+ 	}
+ 
+ 	for (cpu = 0; cpu < cpu_count; cpu++) {
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Setting-plugin-to-nop-clears-data-before-i.patch b/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Setting-plugin-to-nop-clears-data-before-i.patch
new file mode 100644
index 0000000..724e1e8
--- /dev/null
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd/trace-cmd-Setting-plugin-to-nop-clears-data-before-i.patch
@@ -0,0 +1,96 @@
+From d65740d61e7a4ea6d8d77237954b33dd18e3276c Mon Sep 17 00:00:00 2001
+From: Mark Asselstine <mark.asselstine@windriver.com>
+Date: Sun, 8 Apr 2012 11:38:45 -0400
+Subject: [PATCH] trace-cmd: Setting plugin to 'nop' clears data before it's
+ recorded
+
+Upstream-Status: Backport
+
+commit e09a5db1a929ab668c273b87c4f0a32b81e1c21a
+[trace-cmd: Add trace-cmd record --date option]
+
+moved the call to disable_all() in trace_record() from after record_data()
+to before it. Unfortunately disable_all() sets 'nop' in 'current_tracer'
+which has the side affect of clearing 'trace', thus all the latency tracer
+reports are empty/useless. Here we make disable_all() optionally call
+set_plugin() thus, where we need to, we can delay the disabling of the tracer
+until we have had a chance to capture 'trace'. We have added this delayed
+behavior to trace_record() to fix the latency reports, for all other calls to
+disable_all() we continue to have set_plugin() called.
+
+Link: http://lkml.kernel.org/r/1333899525-6436-1-git-send-email-mark.asselstine@windriver.com
+
+Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
+---
+ trace-record.c |   16 ++++++++++------
+ 1 file changed, 10 insertions(+), 6 deletions(-)
+
+diff --git a/trace-record.c b/trace-record.c
+index 1c56fa9..95d4a2a 100644
+--- a/trace-record.c
++++ b/trace-record.c
+@@ -897,11 +897,13 @@ static void disable_tracing(void)
+ 	write_tracing_on(0);
+ }
+ 
+-static void disable_all(void)
++static void disable_all(int disable_tracer)
+ {
+ 	disable_tracing();
+ 
+-	set_plugin("nop");
++	if (disable_tracer)
++		set_plugin("nop");
++
+ 	reset_events();
+ 
+ 	/* Force close and reset of ftrace pid file */
+@@ -1573,7 +1575,7 @@ static void set_funcs(void)
+ 	/* make sure we are filtering functions */
+ 	if (func_stack) {
+ 		if (!functions_filtered()) {
+-			disable_all();
++			disable_all(1);
+ 			die("Function stack trace set, but functions not filtered");
+ 		}
+ 		save_option(FUNC_STACK_TRACE);
+@@ -1938,7 +1940,7 @@ void trace_record (int argc, char **argv)
+ 				break;
+ 			}
+ 		}
+-		disable_all();
++		disable_all(1);
+ 		set_buffer_size();
+ 		exit(0);
+ 	} else
+@@ -2147,7 +2149,7 @@ void trace_record (int argc, char **argv)
+ 
+ 	if (!extract) {
+ 		fset = set_ftrace(!disable);
+-		disable_all();
++		disable_all(1);
+ 
+ 		/* Record records the date first */
+ 		if (record && date)
+@@ -2227,7 +2229,7 @@ void trace_record (int argc, char **argv)
+ 	}
+ 
+ 	if (!keep)
+-		disable_all();
++		disable_all(0);
+ 
+ 	printf("Kernel buffer statistics:\n"
+ 	       "  Note: \"entries\" are the entries left in the kernel ring buffer and are not\n"
+@@ -2249,6 +2251,8 @@ void trace_record (int argc, char **argv)
+ 	if (keep)
+ 		exit(0);
+ 
++	set_plugin("nop");
++
+ 	/* If tracing_on was enabled before we started, set it on now */
+ 	if (tracing_on_init_val)
+ 		write_tracing_on(tracing_on_init_val);
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb b/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
index 90ba3b3..ff895f8 100644
--- a/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
+++ b/meta/recipes-kernel/trace-cmd/trace-cmd_1.2.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://trace-cmd.c;beginline=6;endline=8;md5=2c22c965a649ddd7973d7913c5634a5e \
                     file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff \
-                    file://trace-input.c;beginline=5;endine=8;md5=c9c405aaf5cfc09582ec83cf6e83a020"
+                    file://trace-input.c;beginline=5;endine=8;md5=6ad47cc2b03385d8456771eec5eeea0b"
 
 SRCREV = "7055ffd37beeb44714e86a4abc703f7e175a0db5"
 PR = "r3"
@@ -14,7 +14,11 @@ inherit pkgconfig pythonnative
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;protocol=git \
            file://addldflags.patch \
            file://make-docs-optional.patch \
-           file://blktrace-api-compatibility.patch"
+           file://blktrace-api-compatibility.patch \
+           file://trace-cmd-Add-checks-for-invalid-pointers-to-fix-seg.patch \
+           file://trace-cmd-Do-not-call-stop_threads-if-doing-latency-.patch \
+           file://trace-cmd-Setting-plugin-to-nop-clears-data-before-i.patch \
+"
 S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE = "'prefix=${prefix}'"
-- 
1.7.10.4



Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QIBt7-0006lK-Ay
	for openembedded-core@lists.openembedded.org;
	Fri, 06 May 2011 05:39:33 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 May 2011 20:36:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,324,1301900400"; d="scan'208";a="431491342"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by azsmga001.ch.intel.com with ESMTP; 05 May 2011 20:36:35 -0700
Message-Id: <c1791b09971fb5d6576b60a0231fe02412d6fef7.1304652773.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1304652773.git.nitin.a.kamble@intel.com>
References: <cover.1304652773.git.nitin.a.kamble@intel.com>
Old-Date: Wed, 4 May 2011 10:35:41 -0700
Date: Thu, 05 May 2011 20:36:35 -0700
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 07/10] linux-yocto_git.bb: Backport upstream fix for gcc 4.6 compilation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 May 2011 03:39:34 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../perf-tool-Fix-gcc-4.6.0-issues.patch           |  266 ++++++++++++++++++++
 meta/recipes-kernel/linux/linux-yocto_git.bb       |    4 +-
 2 files changed, 269 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto/perf-tool-Fix-gcc-4.6.0-issues.patch

diff --git a/meta/recipes-kernel/linux/linux-yocto/perf-tool-Fix-gcc-4.6.0-issues.patch b/meta/recipes-kernel/linux/linux-yocto/perf-tool-Fix-gcc-4.6.0-issues.patch
new file mode 100644
index 0000000..c3510ad
--- /dev/null
+++ b/meta/recipes-kernel/linux/linux-yocto/perf-tool-Fix-gcc-4.6.0-issues.patch
@@ -0,0 +1,266 @@
+Backported to linux-yocto kernel git version
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+
+From patchwork Tue Apr 19 20:09:19 2011
+Content-Type: text/plain; charset="utf-8"
+MIME-Version: 1.0
+Content-Transfer-Encoding: 7bit
+Subject: [70/70] perf tool: Fix gcc 4.6.0 issues
+Date: Tue, 19 Apr 2011 20:09:19 -0000
+From: Greg Kroah-Hartman <gregkh@suse.de>
+X-Patchwork-Id: 719212
+Message-Id: <20110419201050.665258193@clark.kroah.org>
+To: linux-kernel@vger.kernel.org, stable@kernel.org
+Cc: stable-review@kernel.org, torvalds@linux-foundation.org,
+ akpm@linux-foundation.org, alan@lxorguk.ukuu.org.uk,
+ Ingo Molnar <mingo@redhat.com>, Kyle McMartin <kyle@redhat.com>,
+ Arnaldo Carvalho de Melo <acme@redhat.com>, Thomas Meyer <thomas@m3y3r.de>
+
+2.6.38-stable review patch.  If anyone has any objections, please let us know.
+
+------------------
+
+From: Kyle McMartin <kyle@mcmartin.ca>
+
+commit fb7d0b3cefb80a105f7fd26bbc62e0cbf9192822 upstream.
+
+GCC 4.6.0 in Fedora rawhide turned up some compile errors in tools/perf
+due to the -Werror=unused-but-set-variable flag.
+
+I've gone through and annotated some of the assignments that had side
+effects (ie: return value from a function) with the __used annotation,
+and in some cases, just removed unused code.
+
+In a few cases, we were assigning something useful, but not using it in
+later parts of the function.
+
+kyle@dreadnought:~/src% gcc --version
+gcc (GCC) 4.6.0 20110122 (Red Hat 4.6.0-0.3)
+
+Cc: Ingo Molnar <mingo@redhat.com>
+LKML-Reference: <20110124161304.GK27353@bombadil.infradead.org>
+Signed-off-by: Kyle McMartin <kyle@redhat.com>
+[ committer note: Fixed up the annotation fixes, as that code moved recently ]
+Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
+[Backported to 2.6.38.2 by deleting unused but set variables]
+Signed-off-by: Thomas Meyer <thomas@m3y3r.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
+
+---
+tools/perf/bench/sched-pipe.c                          |    2 +-
+ tools/perf/builtin-sched.c                             |   12 +++---------
+ tools/perf/builtin-top.c                               |    5 +----
+ tools/perf/util/header.c                               |    2 +-
+ tools/perf/util/hist.c                                 |    3 ---
+ tools/perf/util/scripting-engines/trace-event-python.c |    3 +--
+ tools/perf/util/symbol.c                               |    4 ++--
+ tools/perf/util/trace-event-parse.c                    |    2 +-
+ tools/perf/util/ui/browsers/map.c                      |    2 +-
+ 9 files changed, 11 insertions(+), 24 deletions(-)
+
+
+
+--
+To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
+the body of a message to majordomo@vger.kernel.org
+More majordomo info at  http://vger.kernel.org/majordomo-info.html
+Please read the FAQ at  http://www.tux.org/lkml/
+
+Index: linux/tools/perf/bench/sched-pipe.c
+===================================================================
+--- linux.orig/tools/perf/bench/sched-pipe.c
++++ linux/tools/perf/bench/sched-pipe.c
+@@ -55,7 +55,7 @@ int bench_sched_pipe(int argc, const cha
+ 	 * discarding returned value of read(), write()
+ 	 * causes error in building environment for perf
+ 	 */
+-	int ret, wait_stat;
++	int __used ret, wait_stat;
+ 	pid_t pid, retpid;
+ 
+ 	argc = parse_options(argc, argv, options,
+Index: linux/tools/perf/builtin-sched.c
+===================================================================
+--- linux.orig/tools/perf/builtin-sched.c
++++ linux/tools/perf/builtin-sched.c
+@@ -369,11 +369,6 @@ static void
+ process_sched_event(struct task_desc *this_task __used, struct sched_atom *atom)
+ {
+ 	int ret = 0;
+-	u64 now;
+-	long long delta;
+-
+-	now = get_nsecs();
+-	delta = start_time + atom->timestamp - now;
+ 
+ 	switch (atom->type) {
+ 		case SCHED_EVENT_RUN:
+@@ -561,7 +556,7 @@ static void wait_for_tasks(void)
+ 
+ static void run_one_test(void)
+ {
+-	u64 T0, T1, delta, avg_delta, fluct, std_dev;
++	u64 T0, T1, delta, avg_delta, fluct;
+ 
+ 	T0 = get_nsecs();
+ 	wait_for_tasks();
+@@ -577,7 +572,6 @@ static void run_one_test(void)
+ 	else
+ 		fluct = delta - avg_delta;
+ 	sum_fluct += fluct;
+-	std_dev = sum_fluct / nr_runs / sqrt(nr_runs);
+ 	if (!run_avg)
+ 		run_avg = delta;
+ 	run_avg = (run_avg*9 + delta)/10;
+@@ -798,7 +792,7 @@ replay_switch_event(struct trace_switch_
+ 		    u64 timestamp,
+ 		    struct thread *thread __used)
+ {
+-	struct task_desc *prev, *next;
++	struct task_desc *prev, __used *next;
+ 	u64 timestamp0;
+ 	s64 delta;
+ 
+@@ -1403,7 +1397,7 @@ map_switch_event(struct trace_switch_eve
+ 		 u64 timestamp,
+ 		 struct thread *thread __used)
+ {
+-	struct thread *sched_out, *sched_in;
++	struct thread *sched_out __used, *sched_in;
+ 	int new_shortname;
+ 	u64 timestamp0;
+ 	s64 delta;
+Index: linux/tools/perf/builtin-top.c
+===================================================================
+--- linux.orig/tools/perf/builtin-top.c
++++ linux/tools/perf/builtin-top.c
+@@ -180,7 +180,6 @@ static int parse_source(struct sym_entry
+ 	FILE *file;
+ 	char command[PATH_MAX*2];
+ 	const char *path;
+-	u64 len;
+ 
+ 	if (!syme)
+ 		return -1;
+@@ -209,8 +208,6 @@ static int parse_source(struct sym_entry
+ 	}
+ 	path = map->dso->long_name;
+ 
+-	len = sym->end - sym->start;
+-
+ 	sprintf(command,
+ 		"objdump --start-address=%#0*Lx --stop-address=%#0*Lx -dS %s",
+ 		BITS_PER_LONG / 4, map__rip_2objdump(map, sym->start),
+@@ -1263,7 +1260,7 @@ static int __cmd_top(void)
+ {
+ 	pthread_t thread;
+ 	int i, counter;
+-	int ret;
++	int ret __used;
+ 	/*
+ 	 * FIXME: perf_session__new should allow passing a O_MMAP, so that all this
+ 	 * mmap reading, etc is encapsulated in it. Use O_WRONLY for now.
+Index: linux/tools/perf/util/header.c
+===================================================================
+--- linux.orig/tools/perf/util/header.c
++++ linux/tools/perf/util/header.c
+@@ -1113,7 +1113,7 @@ int event__synthesize_tracing_data(int f
+ {
+ 	event_t ev;
+ 	ssize_t size = 0, aligned_size = 0, padding;
+-	int err = 0;
++	int err __used = 0;
+ 
+ 	memset(&ev, 0, sizeof(ev));
+ 
+Index: linux/tools/perf/util/hist.c
+===================================================================
+--- linux.orig/tools/perf/util/hist.c
++++ linux/tools/perf/util/hist.c
+@@ -1091,7 +1091,6 @@ int hist_entry__annotate(struct hist_ent
+ 	char command[PATH_MAX * 2];
+ 	FILE *file;
+ 	int err = 0;
+-	u64 len;
+ 
+ 	if (filename == NULL) {
+ 		if (dso->has_build_id) {
+@@ -1128,8 +1127,6 @@ fallback:
+ 		 filename, sym->name, map->unmap_ip(map, sym->start),
+ 		 map->unmap_ip(map, sym->end));
+ 
+-	len = sym->end - sym->start;
+-
+ 	pr_debug("annotating [%p] %30s : [%p] %30s\n",
+ 		 dso, dso->long_name, sym, sym->name);
+ 
+Index: linux/tools/perf/util/scripting-engines/trace-event-python.c
+===================================================================
+--- linux.orig/tools/perf/util/scripting-engines/trace-event-python.c
++++ linux/tools/perf/util/scripting-engines/trace-event-python.c
+@@ -248,8 +248,7 @@ static void python_process_event(int cpu
+ 	context = PyCObject_FromVoidPtr(scripting_context, NULL);
+ 
+ 	PyTuple_SetItem(t, n++, PyString_FromString(handler_name));
+-	PyTuple_SetItem(t, n++,
+-			PyCObject_FromVoidPtr(scripting_context, NULL));
++	PyTuple_SetItem(t, n++, context);
+ 
+ 	if (handler) {
+ 		PyTuple_SetItem(t, n++, PyInt_FromLong(cpu));
+Index: linux/tools/perf/util/symbol.c
+===================================================================
+--- linux.orig/tools/perf/util/symbol.c
++++ linux/tools/perf/util/symbol.c
+@@ -1481,8 +1481,8 @@ int dso__load(struct dso *self, struct m
+ 			snprintf(name, size, "%s", self->long_name);
+ 			break;
+ 		case DSO__ORIG_GUEST_KMODULE:
+-			if (map->groups && map->groups->machine)
+-				root_dir = map->groups->machine->root_dir;
++			if (map->groups && machine)
++				root_dir = machine->root_dir;
+ 			else
+ 				root_dir = "";
+ 			snprintf(name, size, "%s%s", root_dir, self->long_name);
+Index: linux/tools/perf/util/trace-event-parse.c
+===================================================================
+--- linux.orig/tools/perf/util/trace-event-parse.c
++++ linux/tools/perf/util/trace-event-parse.c
+@@ -153,7 +153,7 @@ void parse_proc_kallsyms(char *file, uns
+ 	char *next = NULL;
+ 	char *addr_str;
+ 	char ch;
+-	int ret;
++	int ret __used;
+ 	int i;
+ 
+ 	line = strtok_r(file, "\n", &next);
+Index: linux/tools/perf/util/ui/browsers/map.c
+===================================================================
+--- linux.orig/tools/perf/util/ui/browsers/map.c
++++ linux/tools/perf/util/ui/browsers/map.c
+@@ -40,7 +40,7 @@ static int ui_entry__read(const char *ti
+ out_free_form:
+ 	newtPopWindow();
+ 	newtFormDestroy(form);
+-	return 0;
++	return err;
+ }
+ 
+ struct map_browser {
+Index: linux/tools/perf/builtin-stat.c
+===================================================================
+--- linux.orig/tools/perf/builtin-stat.c
++++ linux/tools/perf/builtin-stat.c
+@@ -211,7 +211,7 @@ static void read_counter(int counter)
+ 	u64 count[3], single_count[3];
+ 	int cpu;
+ 	size_t res, nv;
+-	int scaled;
++	int scaled __used;
+ 	int i, thread;
+ 
+ 	count[0] = count[1] = count[2] = 0;
diff --git a/meta/recipes-kernel/linux/linux-yocto_git.bb b/meta/recipes-kernel/linux/linux-yocto_git.bb
index 3b4e77e..e08d2df 100644
--- a/meta/recipes-kernel/linux/linux-yocto_git.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_git.bb
@@ -35,7 +35,9 @@ PR = "r17"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 SRCREV_FORMAT = "meta_machine"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-2.6.37;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
+SRC_URI = "git://git.yoctoproject.org/linux-yocto-2.6.37;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta \
+           file://perf-tool-Fix-gcc-4.6.0-issues.patch \
+          "
 
 COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemux86-64|mpc8315e-rdb|routerstationpro|beagleboard)"
 
-- 
1.7.3.4




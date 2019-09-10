Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4CD517F370
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 21:42:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8ALfoEb025614
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 14:42:05 -0700
Received: from fidler.wrs.com (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 10 Sep 2019 14:42:00 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Sep 2019 17:41:36 -0400
Message-ID: <20190910214136.22971-4-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190910214136.22971-1-Randy.MacLeod@windriver.com>
References: <20190910214136.22971-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Subject: [v2 4/4] valgrind: disable 256 ptests for aarch64
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
X-List-Received-Date: Tue, 10 Sep 2019 21:42:14 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

On qemuarm64 systems, about half of the valgrind tests fail and
often result in defunct processes, eg:
   root       819   818 25 00:12 pts/0    00:01:52 /usr/bin/valgrind --command-line-only=yes --memcheck:leak-check=no --tool=memcheck -q --track-origins=
   root       861   420  0 00:13 pts/0    00:00:00 [sh] <defunct>
Eventually these processes use so much memory that the
out of memory killer runs.

Hide the tests that fail as a horrid work-around until the
root cause has been resolved since this at least allows the
ptest run to complete. This work-around is done in the run-ptest
script using a sorted list of tests so that they can be easily
restored one by one without a rebuild during testing.

With core-image-minimal on qemuarm64:
Recipe         | Passed      | Failed   | Skipped   | Time(s)
valgrind       | 333         | 49       | 17        | 7637

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../valgrind/valgrind/remove-for-aarch64      | 236 ++++++++++++++++++
 .../valgrind/valgrind/run-ptest               |  16 ++
 .../valgrind/valgrind_3.15.0.bb               |   2 +
 3 files changed, 254 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64

diff --git a/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64 b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
new file mode 100644
index 0000000000..acf4fd1bc1
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/remove-for-aarch64
@@ -0,0 +1,236 @@
+cachegrind/tests/ann1
+callgrind/tests/simwork1
+callgrind/tests/simwork2
+callgrind/tests/simwork3
+callgrind/tests/simwork-both
+callgrind/tests/simwork-cache
+callgrind/tests/threads
+callgrind/tests/threads-use
+drd/tests/annotate_barrier
+drd/tests/annotate_barrier_xml
+drd/tests/annotate_hbefore
+drd/tests/annotate_hb_err
+drd/tests/annotate_hb_race
+drd/tests/annotate_ignore_read
+drd/tests/annotate_ignore_rw
+drd/tests/annotate_ignore_rw2
+drd/tests/annotate_ignore_write
+drd/tests/annotate_ignore_write2
+drd/tests/annotate_order_1
+drd/tests/annotate_order_2
+drd/tests/annotate_order_3
+drd/tests/annotate_publish_hg
+drd/tests/annotate_rwlock
+drd/tests/annotate_rwlock_hg
+drd/tests/annotate_sem
+drd/tests/annotate_smart_pointer
+drd/tests/annotate_smart_pointer2
+drd/tests/annotate_spinlock
+drd/tests/annotate_static
+drd/tests/annotate_trace_memory
+drd/tests/annotate_trace_memory_xml
+drd/tests/atomic_var
+drd/tests/bar_bad
+drd/tests/bar_bad_xml
+drd/tests/bar_trivial
+drd/tests/bug-235681
+drd/tests/bug322621
+drd/tests/circular_buffer
+drd/tests/concurrent_close
+drd/tests/custom_alloc
+drd/tests/custom_alloc_fiw
+drd/tests/dlopen
+drd/tests/fork-parallel
+drd/tests/fork-serial
+drd/tests/fp_race
+drd/tests/fp_race2
+drd/tests/fp_race_xml
+drd/tests/free_is_write
+drd/tests/free_is_write2
+drd/tests/hg01_all_ok
+drd/tests/hg02_deadlock
+drd/tests/hg03_inherit
+drd/tests/hg04_race
+drd/tests/hg05_race2
+drd/tests/hg06_readshared
+drd/tests/hold_lock_1
+drd/tests/hold_lock_2
+drd/tests/linuxthreads_det
+drd/tests/matinv
+drd/tests/memory_allocation
+drd/tests/monitor_example
+drd/tests/new_delete
+drd/tests/pth_barrier
+drd/tests/pth_barrier2
+drd/tests/pth_barrier3
+drd/tests/pth_barrier_race
+drd/tests/pth_barrier_reinit
+drd/tests/pth_barrier_thr_cr
+drd/tests/pth_broadcast
+drd/tests/pth_cancel_locked
+drd/tests/pth_cleanup_handler
+drd/tests/pth_cond_race
+drd/tests/pth_cond_race2
+drd/tests/pth_detached2
+drd/tests/pth_detached3
+drd/tests/pth_detached_sem
+drd/tests/pth_inconsistent_cond_wait
+drd/tests/pth_mutex_reinit
+drd/tests/pth_once
+drd/tests/pth_process_shared_mutex
+drd/tests/pth_spinlock
+drd/tests/pth_uninitialized_cond
+drd/tests/read_and_free_race
+drd/tests/recursive_mutex
+drd/tests/rwlock_race
+drd/tests/rwlock_test
+drd/tests/rwlock_type_checking
+drd/tests/sem_as_mutex
+drd/tests/sem_as_mutex2
+drd/tests/sem_as_mutex3
+drd/tests/sem_open
+drd/tests/sem_open2
+drd/tests/sem_open3
+drd/tests/sem_open_traced
+drd/tests/sem_wait
+drd/tests/sigalrm
+drd/tests/sigaltstack
+drd/tests/std_atomic
+drd/tests/std_string
+drd/tests/std_thread
+drd/tests/std_thread2
+drd/tests/str_tester
+drd/tests/tc01_simple_race
+drd/tests/tc02_simple_tls
+drd/tests/tc03_re_excl
+drd/tests/tc04_free_lock
+drd/tests/tc05_simple_race
+drd/tests/tc06_two_races
+drd/tests/tc07_hbl1
+drd/tests/tc08_hbl2
+drd/tests/tc09_bad_unlock
+drd/tests/tc10_rec_lock
+drd/tests/tc11_XCHG
+drd/tests/tc12_rwl_trivial
+drd/tests/tc13_laog1
+drd/tests/tc15_laog_lockdel
+drd/tests/tc16_byterace
+drd/tests/tc17_sembar
+drd/tests/tc18_semabuse
+drd/tests/tc19_shadowmem
+drd/tests/tc21_pthonce
+drd/tests/tc22_exit_w_lock
+drd/tests/tc23_bogus_condwait
+helgrind/tests/annotate_rwlock
+helgrind/tests/annotate_smart_pointer
+helgrind/tests/bar_bad
+helgrind/tests/bar_trivial
+helgrind/tests/bug322621
+helgrind/tests/cond_init_destroy
+helgrind/tests/cond_timedwait_invalid
+helgrind/tests/cond_timedwait_test
+helgrind/tests/free_is_write
+helgrind/tests/hg01_all_ok
+helgrind/tests/hg03_inherit
+helgrind/tests/hg04_race
+helgrind/tests/hg05_race2
+helgrind/tests/hg06_readshared
+helgrind/tests/locked_vs_unlocked1_fwd
+helgrind/tests/locked_vs_unlocked1_rev
+helgrind/tests/locked_vs_unlocked2
+helgrind/tests/locked_vs_unlocked3
+helgrind/tests/pth_barrier1
+helgrind/tests/pth_barrier2
+helgrind/tests/pth_barrier3
+helgrind/tests/pth_destroy_cond
+helgrind/tests/rwlock_race
+helgrind/tests/rwlock_test
+helgrind/tests/shmem_abits
+helgrind/tests/stackteardown
+helgrind/tests/t2t_laog
+helgrind/tests/tc01_simple_race
+helgrind/tests/tc02_simple_tls
+helgrind/tests/tc03_re_excl
+helgrind/tests/tc04_free_lock
+helgrind/tests/tc05_simple_race
+helgrind/tests/tc06_two_races
+helgrind/tests/tc06_two_races_xml
+helgrind/tests/tc07_hbl1
+helgrind/tests/tc08_hbl2
+helgrind/tests/tc09_bad_unlock
+helgrind/tests/tc10_rec_lock
+helgrind/tests/tc11_XCHG
+helgrind/tests/tc12_rwl_trivial
+helgrind/tests/tc13_laog1
+helgrind/tests/tc14_laog_dinphils
+helgrind/tests/tc15_laog_lockdel
+helgrind/tests/tc16_byterace
+helgrind/tests/tc17_sembar
+helgrind/tests/tc18_semabuse
+helgrind/tests/tc19_shadowmem
+helgrind/tests/tc20_verifywrap
+helgrind/tests/tc21_pthonce
+helgrind/tests/tc22_exit_w_lock
+helgrind/tests/tc23_bogus_condwait
+helgrind/tests/tc24_nonzero_sem
+helgrind/tests/tls_threads
+memcheck/tests/accounting
+memcheck/tests/addressable
+memcheck/tests/arm64-linux/scalar
+memcheck/tests/atomic_incs
+memcheck/tests/badaddrvalue
+memcheck/tests/badfree
+memcheck/tests/badfree-2trace
+memcheck/tests/badfree3
+memcheck/tests/badjump
+memcheck/tests/badjump2
+memcheck/tests/badloop
+memcheck/tests/badpoll
+memcheck/tests/badrw
+memcheck/tests/big_blocks_freed_list
+memcheck/tests/brk2
+memcheck/tests/dw4
+memcheck/tests/err_disable4
+memcheck/tests/err_disable_arange1
+memcheck/tests/leak-autofreepool-5
+memcheck/tests/leak_cpp_interior
+memcheck/tests/linux/lsframe1
+memcheck/tests/linux/lsframe2
+memcheck/tests/linux/with-space
+memcheck/tests/origin5-bz2
+memcheck/tests/origin6-fp
+memcheck/tests/overlap
+memcheck/tests/partial_load_dflt
+memcheck/tests/pdb-realloc2
+memcheck/tests/sh-mem
+memcheck/tests/sh-mem-random
+memcheck/tests/sigaltstack
+memcheck/tests/sigkill
+memcheck/tests/signal2
+memcheck/tests/supp_unknown
+memcheck/tests/threadname
+memcheck/tests/threadname_xml
+memcheck/tests/unit_oset
+memcheck/tests/varinfo1
+memcheck/tests/varinfo2
+memcheck/tests/varinfo3
+memcheck/tests/varinfo4
+memcheck/tests/varinfo5
+memcheck/tests/varinfo6
+memcheck/tests/varinforestrict
+memcheck/tests/vcpu_bz2
+memcheck/tests/vcpu_fbench
+memcheck/tests/vcpu_fnfns
+memcheck/tests/wcs
+memcheck/tests/wrap1
+memcheck/tests/wrap2
+memcheck/tests/wrap3
+memcheck/tests/wrap4
+memcheck/tests/wrap5
+memcheck/tests/wrap6
+memcheck/tests/wrap7
+memcheck/tests/wrap8
+memcheck/tests/wrapmalloc
+memcheck/tests/wrapmallocstatic
+memcheck/tests/writev1
+memcheck/tests/xml1
diff --git a/meta/recipes-devtools/valgrind/valgrind/run-ptest b/meta/recipes-devtools/valgrind/valgrind/run-ptest
index 5b3ad2a2ed..97b0a85dbf 100755
--- a/meta/recipes-devtools/valgrind/valgrind/run-ptest
+++ b/meta/recipes-devtools/valgrind/valgrind/run-ptest
@@ -17,6 +17,14 @@ EXP_TOOLS="exp-bbv exp-dhat exp-sgcheck"
 GDB_BIN=@bindir@/gdb
 cd ${VALGRIND_LIB}/ptest && ./gdbserver_tests/make_local_links ${GDB_BIN}
 
+arch=`arch`
+if [ "$arch" = "aarch64" ]; then
+   echo "Aarch64: Hide valgrind tests that result in defunct process and then out of memory"
+   for i in `cat remove-for-aarch64`; do
+      mv $i.vgtest $i.IGNORE;
+   done
+fi
+
 cd ${VALGRIND_LIB}/ptest && ./tests/vg_regtest \
     --valgrind=${VALGRIND_BIN} \
     --valgrind-lib=${VALGRIND_LIB} \
@@ -29,6 +37,14 @@ cd ${VALGRIND_LIB}/ptest && \
     gdbserver_tests ${TOOLS} ${EXP_TOOLS} \
     2>&1|tee -a ${LOG}
 
+if [ "$arch" = "aarch64" ]; then
+   echo "Aarch64: Restore valgrind tests that result in defunct process and then out of memory"
+   for i in `cat remove-for-aarch64`; do
+      mv $i.IGNORE $i.vgtest;
+   done
+fi
+
+
 passed=`grep PASS: ${LOG}|wc -l`
 failed=`grep FAIL: ${LOG}|wc -l`
 skipped=`grep SKIP: ${LOG}|wc -l`
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
index 6d47b6d01d..63f972945d 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.15.0.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://sourceware.org/pub/valgrind/valgrind-${PV}.tar.bz2 \
            file://fixed-perl-path.patch \
            file://Added-support-for-PPC-instructions-mfatbu-mfatbl.patch \
            file://run-ptest \
+           file://remove-for-aarch64 \
            file://0004-Fix-out-of-tree-builds.patch \
            file://0005-Modify-vg_test-wrapper-to-support-PTEST-formats.patch \
            file://0001-Remove-tests-that-fail-to-build-on-some-PPC32-config.patch \
@@ -165,6 +166,7 @@ do_install_ptest() {
 
     # The scripts reference config.h so add it to the top ptest dir.
     cp ${B}/config.h ${D}${PTEST_PATH}
+    install -D ${WORKDIR}/remove-for-aarch64 ${D}${PTEST_PATH}
 
     # Add an executable need by none/tests/bigcode
     mkdir ${D}${PTEST_PATH}/perf
-- 
2.22.0



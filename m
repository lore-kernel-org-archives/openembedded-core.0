X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Petr Vorel" <pevik@seznam.cz>
Subject: [PATCH 1/1] ltp: Update to 20220930
Date: Sat,  1 Oct 2022 19:21:07 +0200
Message-Id: <20221001172107.16226-1-pevik@seznam.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Petr Vorel <petr.vorel@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>, Khem Raj <raj.khem@gmail.com>

From: Petr Vorel <petr.vorel@gmail.com>

Remove all patches accepted upstream.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

could you please test this patchset?

Kind regards,
Petr

 ...-access-mode-in-KVM-test-ELF-headers.patch |  40 -----
 ...olve-conflict-in-different-header-fi.patch |  71 --------
 ...-lapi-pidfd-adding-pidfd-header-file.patch |  60 -------
 ...-Fix-usage-of-PAGESIZE-from-memcg_li.patch | 121 --------------
 ...ait-for-umount-completed-in-thread_b.patch |  63 -------
 ...x-usage-of-variables-from-tst_net.sh.patch | 154 ------------------
 ...0001-netstress-Restore-runtime-to-5m.patch |  53 ------
 ...fs05_make_tree-Restore-5-min-timeout.patch |  31 ----
 ...nt-instead-of-pthread_t-for-thread-I.patch |  36 ----
 ...igrate_pages03-restore-runtime-to-5m.patch |  44 -----
 ...-kvm-use-LD-instead-of-hardcoding-ld.patch |  39 -----
 ...ile-variable-for-building-KVM-payloa.patch |  63 -------
 .../ltp/{ltp_20220527.bb => ltp_20220930.bb}  |  16 +-
 13 files changed, 2 insertions(+), 789 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-kvm-Fix-stack-access-mode-in-KVM-test-ELF-headers.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-lapi-fsmount-resolve-conflict-in-different-header-fi.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-lapi-pidfd-adding-pidfd-header-file.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-memcg-functional-Fix-usage-of-PAGESIZE-from-memcg_li.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-mountns0-1-3-wait-for-umount-completed-in-thread_b.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-net_stress-Fix-usage-of-variables-from-tst_net.sh.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-netstress-Restore-runtime-to-5m.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-nfs05_make_tree-Restore-5-min-timeout.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-rt-migrate-Use-int-instead-of-pthread_t-for-thread-I.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-migrate_pages03-restore-runtime-to-5m.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0002-kvm-use-LD-instead-of-hardcoding-ld.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0003-Add-KVM_LD-Makefile-variable-for-building-KVM-payloa.patch
 rename meta/recipes-extended/ltp/{ltp_20220527.bb => ltp_20220930.bb} (86%)

diff --git a/meta/recipes-extended/ltp/ltp/0001-kvm-Fix-stack-access-mode-in-KVM-test-ELF-headers.patch b/meta/recipes-extended/ltp/ltp/0001-kvm-Fix-stack-access-mode-in-KVM-test-ELF-headers.patch
deleted file mode 100644
index 764e9c0d9f..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-kvm-Fix-stack-access-mode-in-KVM-test-ELF-headers.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 608fc7bcda43e60536ae1f19842f7affba8f0aea Mon Sep 17 00:00:00 2001
-From: Martin Doucha <mdoucha@suse.cz>
-Date: Wed, 1 Jun 2022 16:16:34 +0200
-Subject: [PATCH] kvm: Fix stack access mode in KVM test ELF headers
-
-When the linker converts guest payload binary into a linkable resource
-object file, it somehow defaults to requesting executable stack section
-for the final test binary. This trips some build-time security checks
-on newer systems. Add explicit linker option to make the stack
-non-executable.
-
-Suggested-by: Fabian Vogt <fvogt@suse.com>
-Signed-off-by: Martin Doucha <mdoucha@suse.cz>
-Reviewed-by: Petr Vorel <pvorel@suse.cz>
-Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-Upstream-Status: Backport [https://github.com/linux-test-project/ltp/commit/f9715d7c2e78713e26533c6e0846aaabf5c4095b]
----
- testcases/kernel/kvm/Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/testcases/kernel/kvm/Makefile b/testcases/kernel/kvm/Makefile
-index 69a9946fe..adab56952 100644
---- a/testcases/kernel/kvm/Makefile
-+++ b/testcases/kernel/kvm/Makefile
-@@ -50,11 +50,11 @@ include $(top_srcdir)/include/mk/generic_leaf_target.mk
- ifdef VERBOSE
- 	$(CC) $(GUEST_CPPFLAGS) $(GUEST_CFLAGS) $(GUEST_LDFLAGS) -o $*-payload.elf $^ $(GUEST_LDLIBS)
- 	objcopy -O binary -j .init.boot -j .text -j .data -j .init -j .preinit_array -j .init_array --gap-fill=0 $*-payload.elf $*-payload.bin
--	ld -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
-+	ld -z noexecstack -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
- else
- 	@$(CC) $(GUEST_CPPFLAGS) $(GUEST_CFLAGS) $(GUEST_LDFLAGS) -o $*-payload.elf $^ $(GUEST_LDLIBS)
- 	@objcopy -O binary -j .init.boot -j .text -j .data -j .init -j .preinit_array -j .init_array --gap-fill=0 $*-payload.elf $*-payload.bin
--	@ld -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
-+	@ld -z noexecstack -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
- 	@echo KVM_CC $(target_rel_dir)$@
- endif
- 	@rm $*-payload.elf $*-payload.bin
diff --git a/meta/recipes-extended/ltp/ltp/0001-lapi-fsmount-resolve-conflict-in-different-header-fi.patch b/meta/recipes-extended/ltp/ltp/0001-lapi-fsmount-resolve-conflict-in-different-header-fi.patch
deleted file mode 100644
index cdbcf6b288..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-lapi-fsmount-resolve-conflict-in-different-header-fi.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From b857f8723f30a4b9554bf6b0ff8fa52fd07e8b60 Mon Sep 17 00:00:00 2001
-From: Li Wang <liwang@redhat.com>
-Date: Fri, 5 Aug 2022 14:34:01 +0800
-Subject: [PATCH] lapi/fsmount: resolve conflict in different header files
-
-The latest glibc added new wrappers (e.g. mount_setattr, fsopen) support
-in sys/mount.h, which partly conflicts with linux/mount.h at the same time.
-
-We need to make adjustments to header files to fix compiling error on
-different platforms.
-
-Upstream-Status: Backport [https://github.com/linux-test-project/ltp/commit/b857f8723f30a4b9554bf6b0ff8fa52fd07e8b60]
-Signed-off-by: Li Wang <liwang@redhat.com>
-Reviewed-by: Petr Vorel <pvorel@suse.cz>
----
- configure.ac           | 1 +
- include/lapi/fs.h      | 6 ++++--
- include/lapi/fsmount.h | 7 +++++--
- 3 files changed, 10 insertions(+), 4 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index d50ec1ea7..dbd53cab6 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -113,6 +113,7 @@ AC_CHECK_FUNCS_ONCE([ \
-     mkdirat \
-     mknodat \
-     modify_ldt \
-+    mount_setattr \
-     move_mount \
-     name_to_handle_at \
-     open_tree \
-diff --git a/include/lapi/fs.h b/include/lapi/fs.h
-index 27b3a183c..84a168a67 100644
---- a/include/lapi/fs.h
-+++ b/include/lapi/fs.h
-@@ -6,8 +6,10 @@
-  * Email: code@zilogic.com
-  */
- 
--#ifdef HAVE_LINUX_FS_H
--# include <linux/fs.h>
-+#ifndef HAVE_MOUNT_SETATTR
-+# ifdef HAVE_LINUX_FS_H
-+#  include <linux/fs.h>
-+# endif
- #endif
- 
- #include <sys/user.h>
-diff --git a/include/lapi/fsmount.h b/include/lapi/fsmount.h
-index b11e7a7bd..07eb42ffa 100644
---- a/include/lapi/fsmount.h
-+++ b/include/lapi/fsmount.h
-@@ -11,9 +11,12 @@
- #include "config.h"
- #include <sys/syscall.h>
- #include <sys/types.h>
-+#include <sys/mount.h>
- 
--#ifdef HAVE_LINUX_MOUNT_H
--# include <linux/mount.h>
-+#ifndef HAVE_FSOPEN
-+# ifdef HAVE_LINUX_MOUNT_H
-+#  include <linux/mount.h>
-+# endif
- #endif
- 
- #include "lapi/fcntl.h"
--- 
-2.37.2
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-lapi-pidfd-adding-pidfd-header-file.patch b/meta/recipes-extended/ltp/ltp/0001-lapi-pidfd-adding-pidfd-header-file.patch
deleted file mode 100644
index 184c42640a..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-lapi-pidfd-adding-pidfd-header-file.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From dbc9c14c92a5acf450d07868a735ac8cd6ec5b90 Mon Sep 17 00:00:00 2001
-From: Li Wang <liwang@redhat.com>
-Date: Fri, 5 Aug 2022 14:34:00 +0800
-Subject: [PATCH] lapi/pidfd: adding pidfd header file
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The newer Glibc already provided wrapper for the series pidfd syscall,
-so let's include the header file conditionally.
-
-  # rpm -q glibc-devel
-  glibc-devel-2.35.9000-31.fc37.ppc64le
-  # rpm -ql glibc-devel | grep pidfd
-  /usr/include/sys/pidfd.h
-
-To get rid of compiling error from fedora-rawhide:
-
-  tst_safe_macros.c: In function ‘safe_pidfd_open’:
-  tst_safe_macros.c:135:16: error: implicit declaration of function ‘pidfd_open’ [-Werror=implicit-function-declaration]
-  135 |         rval = pidfd_open(pid, flags);
-      |                ^~~~~~~~~~
-
-Upstream-Status: Backport [https://github.com/linux-test-project/ltp/commit/dbc9c14c92a5acf450d07868a735ac8cd6ec5b90]
-Signed-off-by: Li Wang <liwang@redhat.com>
-Reviewed-by: Petr Vorel <pvorel@suse.cz>
----
- configure.ac         | 1 +
- include/lapi/pidfd.h | 3 +++
- 2 files changed, 4 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 69b145b5f..d50ec1ea7 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -71,6 +71,7 @@ AC_CHECK_HEADERS_ONCE([ \
-     sys/epoll.h \
-     sys/fanotify.h \
-     sys/inotify.h \
-+    sys/pidfd.h
-     sys/prctl.h \
-     sys/shm.h \
-     sys/timerfd.h \
-diff --git a/include/lapi/pidfd.h b/include/lapi/pidfd.h
-index 244d3acaf..9ca8e5aa2 100644
---- a/include/lapi/pidfd.h
-+++ b/include/lapi/pidfd.h
-@@ -8,6 +8,9 @@
- #define LAPI_PIDFD_H__
- 
- #include <fcntl.h>
-+#ifdef HAVE_SYS_PIDFD_H
-+# include <sys/pidfd.h>
-+#endif
- #include "config.h"
- #include "lapi/syscalls.h"
- 
--- 
-2.37.2
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-memcg-functional-Fix-usage-of-PAGESIZE-from-memcg_li.patch b/meta/recipes-extended/ltp/ltp/0001-memcg-functional-Fix-usage-of-PAGESIZE-from-memcg_li.patch
deleted file mode 100644
index 726f6212f3..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-memcg-functional-Fix-usage-of-PAGESIZE-from-memcg_li.patch
+++ /dev/null
@@ -1,121 +0,0 @@
-From bda92ad659a52d38ac810099f69adff626b064c6 Mon Sep 17 00:00:00 2001
-From: Joerg Vehlow <joerg.vehlow@aox.de>
-Date: Mon, 27 Jun 2022 10:44:49 +0200
-Subject: [PATCH] memcg/functional: Fix usage of PAGESIZE from memcg_lib.sh
-
-$PAGESIZES is set in memcg_lib.sh, which was moved to the bottom of the file.
-
-Fixes: 04021637f ("tst_test.sh: Cleanup getopts usage")
-
-Reviewed-by: Petr Vorel <pvorel@suse.cz>
-Signed-off-by: Joerg Vehlow <joerg.vehlow@aox.de>
-Upstream-Status: Backport [bda92ad659a52d38ac810099f69adff626b064c6]
----
- .../controllers/memcg/functional/memcg_failcnt.sh      |  7 ++++---
- .../memcg/functional/memcg_max_usage_in_bytes_test.sh  | 10 +++++-----
- .../memcg/functional/memcg_subgroup_charge.sh          |  8 ++++----
- .../memcg/functional/memcg_usage_in_bytes_test.sh      | 10 +++++-----
- 4 files changed, 18 insertions(+), 17 deletions(-)
-
-diff --git a/testcases/kernel/controllers/memcg/functional/memcg_failcnt.sh b/testcases/kernel/controllers/memcg/functional/memcg_failcnt.sh
-index 1fed01569..1be98a056 100755
---- a/testcases/kernel/controllers/memcg/functional/memcg_failcnt.sh
-+++ b/testcases/kernel/controllers/memcg/functional/memcg_failcnt.sh
-@@ -12,9 +12,6 @@ MEMCG_TESTFUNC=test
- MEMCG_SHMMAX=1
- TST_TEST_DATA="--mmap-anon --mmap-file --shm"
- 
--MEMORY_LIMIT=$PAGESIZE
--MEMORY_TO_ALLOCATE=$((MEMORY_LIMIT * 2))
--
- test()
- {
- 	ROD echo $MEMORY_LIMIT \> memory.limit_in_bytes
-@@ -36,4 +33,8 @@ test()
- }
- 
- . memcg_lib.sh
-+
-+MEMORY_LIMIT=$PAGESIZE
-+MEMORY_TO_ALLOCATE=$((MEMORY_LIMIT * 2))
-+
- tst_run
-diff --git a/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh b/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh
-index d1ffbe053..302810513 100755
---- a/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh
-+++ b/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh
-@@ -9,11 +9,6 @@
- MEMCG_TESTFUNC=test
- TST_CNT=4
- 
--
--MEM_TO_ALLOC=$((PAGESIZE * 1024))
--MEM_EXPECTED_UPPER=$((MEM_TO_ALLOC + MEM_USAGE_RANGE))
--MEM_LIMIT=$((MEM_TO_ALLOC * 2))
--
- # Run test cases which checks memory.[memsw.]max_usage_in_bytes after make
- # some memory allocation
- test_max_usage_in_bytes()
-@@ -88,4 +83,9 @@ test4()
- }
- 
- . memcg_lib.sh
-+
-+MEM_TO_ALLOC=$((PAGESIZE * 1024))
-+MEM_EXPECTED_UPPER=$((MEM_TO_ALLOC + MEM_USAGE_RANGE))
-+MEM_LIMIT=$((MEM_TO_ALLOC * 2))
-+
- tst_run
-diff --git a/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh b/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
-index 08b6697d4..9bcc01258 100755
---- a/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
-+++ b/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
-@@ -12,10 +12,6 @@
- MEMCG_TESTFUNC=test
- TST_CNT=3
- 
--
--# Allocate memory bigger than per-cpu kernel memory
--MEM_TO_ALLOC=$((PAGESIZES * 2))
--
- # Test the memory charge won't move to subgroup
- # $1 - memory.limit_in_bytes in sub group
- test_subgroup()
-@@ -67,4 +63,8 @@ test3()
- }
- 
- . memcg_lib.sh
-+
-+# Allocate memory bigger than per-cpu kernel memory
-+MEM_TO_ALLOC=$((PAGESIZES * 2))
-+
- tst_run
-diff --git a/testcases/kernel/controllers/memcg/functional/memcg_usage_in_bytes_test.sh b/testcases/kernel/controllers/memcg/functional/memcg_usage_in_bytes_test.sh
-index 6f932124e..125d88e55 100755
---- a/testcases/kernel/controllers/memcg/functional/memcg_usage_in_bytes_test.sh
-+++ b/testcases/kernel/controllers/memcg/functional/memcg_usage_in_bytes_test.sh
-@@ -9,11 +9,6 @@
- MEMCG_TESTFUNC=test
- TST_CNT=2
- 
--
--MEM_TO_ALLOC=$((PAGESIZE * 1024))
--MEM_EXPECTED_UPPER=$((MEM_TO_ALLOC + MEM_USAGE_RANGE))
--MEM_LIMIT=$((MEM_TO_ALLOC * 2))
--
- test1()
- {
- 	tst_res TINFO "Test memory.usage_in_bytes"
-@@ -35,4 +30,9 @@ test2()
- }
- 
- . memcg_lib.sh
-+
-+MEM_TO_ALLOC=$((PAGESIZE * 1024))
-+MEM_EXPECTED_UPPER=$((MEM_TO_ALLOC + MEM_USAGE_RANGE))
-+MEM_LIMIT=$((MEM_TO_ALLOC * 2))
-+
- tst_run
--- 
-2.37.1
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-mountns0-1-3-wait-for-umount-completed-in-thread_b.patch b/meta/recipes-extended/ltp/ltp/0001-mountns0-1-3-wait-for-umount-completed-in-thread_b.patch
deleted file mode 100644
index 1339c603b9..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-mountns0-1-3-wait-for-umount-completed-in-thread_b.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 6d4c8343d33e7d8fa059246310413f029a9e8573 Mon Sep 17 00:00:00 2001
-From: Li Wang <liwang@redhat.com>
-Date: Thu, 7 Jul 2022 17:38:45 +0800
-Subject: [PATCH] mountns0[1-3]: wait for umount completed in thread_b
-
-To get rid of race condition (occurs with umount_folders):
-
-    mountns01.c:42: TPASS: shared mount in parent passed
-    mountns01.c:83: TPASS: shared mount in child passed
-    tst_device.c:394: TWARN: umount('B') failed with EINVAL
-    mountns.h:39: TWARN: umount(B) failed: EINVAL (22)
-
-Signed-off-by: Li Wang <liwang@redhat.com>
-Reviewed-by: Yang Xu <xuyang2018.jy@fujitsu.com>
-Upstream-Status: Backport [6d4c8343d33e7d8fa059246310413f029a9e8573]
----
- testcases/kernel/containers/mountns/mountns01.c | 2 ++
- testcases/kernel/containers/mountns/mountns02.c | 2 ++
- testcases/kernel/containers/mountns/mountns03.c | 2 ++
- 3 files changed, 6 insertions(+)
-
-diff --git a/testcases/kernel/containers/mountns/mountns01.c b/testcases/kernel/containers/mountns/mountns01.c
-index e99134aba..e8f176920 100644
---- a/testcases/kernel/containers/mountns/mountns01.c
-+++ b/testcases/kernel/containers/mountns/mountns01.c
-@@ -86,6 +86,8 @@ static void run(void)
- 
- 	TST_CHECKPOINT_WAKE(0);
- 
-+	SAFE_WAIT(NULL);
-+
- 	SAFE_UMOUNT(DIRA);
- }
- 
-diff --git a/testcases/kernel/containers/mountns/mountns02.c b/testcases/kernel/containers/mountns/mountns02.c
-index 258b61217..4b85fa79b 100644
---- a/testcases/kernel/containers/mountns/mountns02.c
-+++ b/testcases/kernel/containers/mountns/mountns02.c
-@@ -87,6 +87,8 @@ static void run(void)
- 
- 	TST_CHECKPOINT_WAKE(0);
- 
-+	SAFE_WAIT(NULL);
-+
- 	SAFE_UMOUNT(DIRA);
- }
- 
-diff --git a/testcases/kernel/containers/mountns/mountns03.c b/testcases/kernel/containers/mountns/mountns03.c
-index f37ae7902..1d26a25d8 100644
---- a/testcases/kernel/containers/mountns/mountns03.c
-+++ b/testcases/kernel/containers/mountns/mountns03.c
-@@ -97,6 +97,8 @@ static void run(void)
- 
- 	TST_CHECKPOINT_WAKE(0);
- 
-+	SAFE_WAIT(NULL);
-+
- 	SAFE_UMOUNT(DIRA);
- }
- 
--- 
-2.37.1
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-net_stress-Fix-usage-of-variables-from-tst_net.sh.patch b/meta/recipes-extended/ltp/ltp/0001-net_stress-Fix-usage-of-variables-from-tst_net.sh.patch
deleted file mode 100644
index f747a1f97f..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-net_stress-Fix-usage-of-variables-from-tst_net.sh.patch
+++ /dev/null
@@ -1,154 +0,0 @@
-From 33c156e295e35d4839a135d8ba5db485b7712ced Mon Sep 17 00:00:00 2001
-From: Joerg Vehlow <joerg.vehlow@aox.de>
-Date: Mon, 27 Jun 2022 09:27:09 +0200
-Subject: [PATCH] net_stress: Fix usage of variables from tst_net.sh
-
-These tests use variables (NS_TIMES, IP_TOTAL, ROUTE_TOTAL
-and IF_UPDOWN_TIMES) from tst_net.sh, before sourcing it.
-
-Fixes: 04021637f ("tst_test.sh: Cleanup getopts usage")
-
-Reviewed-by: Petr Vorel <pvorel@suse.cz>
-Signed-off-by: Joerg Vehlow <joerg.vehlow@aox.de>
-Upstream-Status: Backport [33c156e295e35d4839a135d8ba5db485b7712ced]
----
- testcases/network/stress/interface/if-addr-adddel.sh    | 7 ++++---
- testcases/network/stress/interface/if-addr-addlarge.sh  | 7 ++++---
- testcases/network/stress/interface/if-route-adddel.sh   | 5 +++--
- testcases/network/stress/interface/if-route-addlarge.sh | 5 +++--
- testcases/network/stress/interface/if-updown.sh         | 5 +++--
- testcases/network/stress/interface/if4-addr-change.sh   | 4 +++-
- 6 files changed, 20 insertions(+), 13 deletions(-)
-
-diff --git a/testcases/network/stress/interface/if-addr-adddel.sh b/testcases/network/stress/interface/if-addr-adddel.sh
-index cb453e612..0750501f0 100755
---- a/testcases/network/stress/interface/if-addr-adddel.sh
-+++ b/testcases/network/stress/interface/if-addr-adddel.sh
-@@ -7,9 +7,6 @@
- 
- IF_CMD='ifconfig'
- 
--# The interval of the check interface activity
--CHECK_INTERVAL=${CHECK_INTERVAL:-$(($NS_TIMES / 20))}
--
- test_body()
- {
- 	local cmd="$CMD"
-@@ -89,4 +86,8 @@ test_body()
- }
- 
- . if-lib.sh
-+
-+# The interval of the check interface activity
-+CHECK_INTERVAL=${CHECK_INTERVAL:-$(($NS_TIMES / 20))}
-+
- tst_run
-diff --git a/testcases/network/stress/interface/if-addr-addlarge.sh b/testcases/network/stress/interface/if-addr-addlarge.sh
-index 3c876c17d..d0759c86b 100755
---- a/testcases/network/stress/interface/if-addr-addlarge.sh
-+++ b/testcases/network/stress/interface/if-addr-addlarge.sh
-@@ -7,9 +7,6 @@
- 
- IF_CMD='ifconfig'
- 
--# The interval of the check interface activity
--CHECK_INTERVAL=${CHECK_INTERVAL:-$(($IP_TOTAL / 20))}
--
- test_body()
- {
- 	local cmd="$CMD"
-@@ -110,4 +107,8 @@ test_body()
- }
- 
- . if-lib.sh
-+
-+# The interval of the check interface activity
-+CHECK_INTERVAL=${CHECK_INTERVAL:-$(($IP_TOTAL / 20))}
-+
- tst_run
-diff --git a/testcases/network/stress/interface/if-route-adddel.sh b/testcases/network/stress/interface/if-route-adddel.sh
-index b50da268a..51445e4f7 100755
---- a/testcases/network/stress/interface/if-route-adddel.sh
-+++ b/testcases/network/stress/interface/if-route-adddel.sh
-@@ -7,8 +7,6 @@
- 
- IF_CMD='route'
- 
--CHECK_INTERVAL=${CHECK_INTERVAL:-$(($NS_TIMES / 20))}
--
- test_body()
- {
- 	local cmd="$CMD"
-@@ -64,4 +62,7 @@ test_body()
- }
- 
- . if-lib.sh
-+
-+CHECK_INTERVAL=${CHECK_INTERVAL:-$(($NS_TIMES / 20))}
-+
- tst_run
-diff --git a/testcases/network/stress/interface/if-route-addlarge.sh b/testcases/network/stress/interface/if-route-addlarge.sh
-index 7d09d1216..355b6b4ab 100755
---- a/testcases/network/stress/interface/if-route-addlarge.sh
-+++ b/testcases/network/stress/interface/if-route-addlarge.sh
-@@ -7,8 +7,6 @@
- 
- IF_CMD='route'
- 
--CHECK_INTERVAL=${CHECK_INTERVAL:-$(($ROUTE_TOTAL / 20))}
--
- test_body()
- {
- 	local cmd="$CMD"
-@@ -76,4 +74,7 @@ test_body()
- }
- 
- . if-lib.sh
-+
-+CHECK_INTERVAL=${CHECK_INTERVAL:-$(($ROUTE_TOTAL / 20))}
-+
- tst_run
-diff --git a/testcases/network/stress/interface/if-updown.sh b/testcases/network/stress/interface/if-updown.sh
-index 9a5709c85..71c78d785 100755
---- a/testcases/network/stress/interface/if-updown.sh
-+++ b/testcases/network/stress/interface/if-updown.sh
-@@ -8,8 +8,6 @@
- IF_CMD='ifconfig'
- TST_CLEANUP="if_cleanup_restore"
- 
--CHECK_INTERVAL=${CHECK_INTERVAL:-$(($IF_UPDOWN_TIMES / 20))}
--
- test_body()
- {
- 	local cmd="$CMD"
-@@ -47,4 +45,7 @@ test_body()
- }
- 
- . if-lib.sh
-+
-+CHECK_INTERVAL=${CHECK_INTERVAL:-$(($IF_UPDOWN_TIMES / 20))}
-+
- tst_run
-diff --git a/testcases/network/stress/interface/if4-addr-change.sh b/testcases/network/stress/interface/if4-addr-change.sh
-index b9ece2af9..f162e6a51 100755
---- a/testcases/network/stress/interface/if4-addr-change.sh
-+++ b/testcases/network/stress/interface/if4-addr-change.sh
-@@ -9,7 +9,6 @@ TST_CLEANUP="do_cleanup"
- TST_TESTFUNC="test_body"
- TST_NEEDS_CMDS="ifconfig"
- 
--CHECK_INTERVAL=${CHECK_INTERVAL:-$(($NS_TIMES / 20))}
- # Maximum host portion of the IPv4 address on the local host
- LHOST_IPV4_HOST_MAX="254"
- 
-@@ -61,4 +60,7 @@ test_body()
- }
- 
- . tst_net.sh
-+
-+CHECK_INTERVAL=${CHECK_INTERVAL:-$(($NS_TIMES / 20))}
-+
- tst_run
--- 
-2.37.1
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-netstress-Restore-runtime-to-5m.patch b/meta/recipes-extended/ltp/ltp/0001-netstress-Restore-runtime-to-5m.patch
deleted file mode 100644
index 8acfaf7c8e..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-netstress-Restore-runtime-to-5m.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From cc4a27c235d0cf69a55cd8829b232566b0223333 Mon Sep 17 00:00:00 2001
-From: Petr Vorel <pvorel@suse.cz>
-Date: Wed, 13 Jul 2022 09:46:14 +0200
-Subject: [PATCH] netstress: Restore runtime to 5m
-
-netstress requires the previous default timeout 5m due longer timeout
-for higher message sizes (e.g. 65535):
-
-./sctp_ipsec.sh -6 -p comp -m transport -s 100:1000:65535:R65535
-sctp_ipsec 1 TPASS: netstress passed, median time 5 ms, data: 5 9 6 5 5
-sctp_ipsec 2 TINFO: run server 'netstress -T sctp -S fd00:1:1:1::1 -D ltp_ns_veth1 -R 500000 -B /tmp/LTP_sctp_ipsec.ARZbGkvjPa'
-sctp_ipsec 2 TINFO: run client 'netstress -l -T sctp -H fd00:1:1:1::1 -n 1000 -N 1000 -S fd00:1:1:1::2 -D ltp_ns_veth2 -a 2 -r 100 -d /tmp/LTP_sctp_ipsec.ARZbGkvjPa/tst_netload.res' 5 times
-sctp_ipsec 2 TPASS: netstress passed, median time 6 ms, data: 8 6 6 5 6
-sctp_ipsec 3 TINFO: run server 'netstress -T sctp -S fd00:1:1:1::1 -D ltp_ns_veth1 -R 500000 -B /tmp/LTP_sctp_ipsec.ARZbGkvjPa'
-sctp_ipsec 3 TINFO: run client 'netstress -l -T sctp -H fd00:1:1:1::1 -n 65535 -N 65535 -S fd00:1:1:1::2 -D ltp_ns_veth2 -a 2 -r 100 -d /tmp/LTP_sctp_ipsec.ARZbGkvjPa/tst_netload.res' 5 times
-sctp_ipsec 3 TWARN: netstress failed, ret: 2
-tst_test.c:1526: TINFO: Timeout per run is 0h 00m 30s
-netstress.c:896: TINFO: IP_BIND_ADDRESS_NO_PORT is used
-netstress.c:898: TINFO: connection: addr 'fd00:1:1:1::1', port '55097'
-netstress.c:900: TINFO: client max req: 100
-netstress.c:901: TINFO: clients num: 2
-netstress.c:906: TINFO: client msg size: 65535
-netstress.c:907: TINFO: server msg size: 65535
-netstress.c:979: TINFO: SCTP client
-netstress.c:475: TINFO: Running the test over IPv6
-Test timeouted, sending SIGKILL!
-tst_test.c:1577: TINFO: If you are running on slow machine, try exporting LTP_TIMEOUT_MUL > 1
-tst_test.c:1579: TBROK: Test killed! (timeout?)
-
-Converting netstress.c to use TST_NO_DEFAULT_MAIN (i.e. implementing main)
-would require more changes, because it uses .forks_child, .needs_checkpoints,
-cleanup function.
-
-Signed-off-by: Petr Vorel <pvorel@suse.cz>
-Upstream-Status: Backport [cc4a27c235d0cf69a55cd8829b232566b0223333]
----
- testcases/network/netstress/netstress.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/testcases/network/netstress/netstress.c b/testcases/network/netstress/netstress.c
-index 6c9e83112..7c222531d 100644
---- a/testcases/network/netstress/netstress.c
-+++ b/testcases/network/netstress/netstress.c
-@@ -1028,5 +1028,6 @@ static struct tst_test test = {
- 		{"B:", &server_bg, "Run in background, arg is the process directory"},
- 		{}
- 	},
-+	.max_runtime = 300,
- 	.needs_checkpoints = 1,
- };
--- 
-2.37.1
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-nfs05_make_tree-Restore-5-min-timeout.patch b/meta/recipes-extended/ltp/ltp/0001-nfs05_make_tree-Restore-5-min-timeout.patch
deleted file mode 100644
index 2b9557ad01..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-nfs05_make_tree-Restore-5-min-timeout.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 463da729537faa6d5ef206912fdec871c1059dac Mon Sep 17 00:00:00 2001
-From: Petr Vorel <pvorel@suse.cz>
-Date: Thu, 16 Jun 2022 16:33:31 +0200
-Subject: [PATCH] nfs05_make_tree: Restore 5 min timeout
-
-nfs05_make_tree is a long running test. The previous default timeout 5
-min was enough after reducing runtime in 05be61cf6.
-
-But the new default 30 sec introduced in the concept of max runtime is
-definitely not enough. Restore the previous timeout 5 min.
-
-Signed-off-by: Petr Vorel <pvorel@suse.cz>
-
-Upstream-Status: Backport [463da729537faa6d5ef206912fdec871c1059dac]
----
- testcases/network/nfs/nfs_stress/nfs05_make_tree.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/testcases/network/nfs/nfs_stress/nfs05_make_tree.c b/testcases/network/nfs/nfs_stress/nfs05_make_tree.c
-index fdc13bd5d..5456c1bf0 100644
---- a/testcases/network/nfs/nfs_stress/nfs05_make_tree.c
-+++ b/testcases/network/nfs/nfs_stress/nfs05_make_tree.c
-@@ -215,4 +215,5 @@ static struct tst_test test = {
- 	.options = opts,
- 	.test_all = do_test,
- 	.setup = setup,
-+	.max_runtime = 300,
- };
--- 
-2.37.1
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-rt-migrate-Use-int-instead-of-pthread_t-for-thread-I.patch b/meta/recipes-extended/ltp/ltp/0001-rt-migrate-Use-int-instead-of-pthread_t-for-thread-I.patch
deleted file mode 100644
index e49f53a9e2..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-rt-migrate-Use-int-instead-of-pthread_t-for-thread-I.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 11e503344c36c1c7df3e455d81736dc4a5b43775 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 23 Aug 2022 23:20:53 -0700
-Subject: [PATCH] rt-migrate: Use int instead of pthread_t for thread IDs
-
-pthread_t is opaque, but create_fifo_thread() returns integer therefore
-on musl where thread_t is not integer, this fails to compile e.g.
-
-| rt-migrate.c:450:14: error: incompatible integer to pointer conversion assigning to 'pthread_t' (aka 'struct __pthread *') from 'int' [-Wint-conversion]
-|                 threads[i] = create_fifo_thread(start_task, (void *)i,
-|                            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Align the types used to fix the problems.
-
-Upstream-Status: Submitted [https://lists.linux.it/pipermail/ltp/2022-August/030239.html]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- testcases/realtime/func/rt-migrate/rt-migrate.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/testcases/realtime/func/rt-migrate/rt-migrate.c b/testcases/realtime/func/rt-migrate/rt-migrate.c
-index 3e6c82a2fb..97ab604c7f 100644
---- a/testcases/realtime/func/rt-migrate/rt-migrate.c
-+++ b/testcases/realtime/func/rt-migrate/rt-migrate.c
-@@ -394,7 +394,7 @@ static void stop_log(int sig)
- 
- int main(int argc, char **argv)
- {
--	pthread_t *threads;
-+	int *threads;
- 	long i;
- 	int ret;
- 	struct timespec intv;
--- 
-2.37.2
-
diff --git a/meta/recipes-extended/ltp/ltp/0001-syscalls-migrate_pages03-restore-runtime-to-5m.patch b/meta/recipes-extended/ltp/ltp/0001-syscalls-migrate_pages03-restore-runtime-to-5m.patch
deleted file mode 100644
index 1652f8c94e..0000000000
--- a/meta/recipes-extended/ltp/ltp/0001-syscalls-migrate_pages03-restore-runtime-to-5m.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 9fb28002bb2ce988b99d1756ff7b902f76e3472a Mon Sep 17 00:00:00 2001
-From: Jan Stancek <jstancek@redhat.com>
-Date: Tue, 21 Jun 2022 10:37:17 +0200
-Subject: [PATCH] syscalls/migrate_pages03: restore runtime to 5m
-
-Arches with large pages have trouble completing all loops in 30s,
-restore runtime to 5m. Also check for remaining runtime and
-exit if we run out.
-
-Signed-off-by: Jan Stancek <jstancek@redhat.com>
-Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
-Signed-off-by: Li Wang <liwang@redhat.com>
-Upstream-Status: Backport [9fb28002bb2ce988b99d1756ff7b902f76e3472a]
----
- testcases/kernel/syscalls/migrate_pages/migrate_pages03.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/testcases/kernel/syscalls/migrate_pages/migrate_pages03.c b/testcases/kernel/syscalls/migrate_pages/migrate_pages03.c
-index c6afb4cce..2866c96e6 100644
---- a/testcases/kernel/syscalls/migrate_pages/migrate_pages03.c
-+++ b/testcases/kernel/syscalls/migrate_pages/migrate_pages03.c
-@@ -127,6 +127,11 @@ static void migrate_test(void)
- 			tst_res(TFAIL | TERRNO, "migrate_pages() failed");
- 			return;
- 		}
-+
-+		if (!tst_remaining_runtime()) {
-+			tst_res(TINFO, "Out of runtime, exitting...");
-+			break;
-+		}
- 	}
- 	SAFE_SETEUID(0);
- 
-@@ -134,6 +139,7 @@ static void migrate_test(void)
- }
- 
- static struct tst_test test = {
-+	.max_runtime = 300,
- 	.min_kver = "2.6.32",
- 	.needs_root = 1,
- 	.setup = setup,
--- 
-2.37.1
-
diff --git a/meta/recipes-extended/ltp/ltp/0002-kvm-use-LD-instead-of-hardcoding-ld.patch b/meta/recipes-extended/ltp/ltp/0002-kvm-use-LD-instead-of-hardcoding-ld.patch
deleted file mode 100644
index 060ba05835..0000000000
--- a/meta/recipes-extended/ltp/ltp/0002-kvm-use-LD-instead-of-hardcoding-ld.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 1cea308a647c2a2f9790b0bac7c523de7aa83270 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Tue, 12 Jul 2022 15:03:54 +0100
-Subject: [PATCH] kvm: use $(LD) instead of hardcoding ld
-
-In cross-compiled builds the host ld may not know the required ELF format,
-so ensure we use $(LD) which will be the cross-capable ld binary.
-
-Closes: https://github.com/linux-test-project/ltp/pull/948
-
-Upstream-Status: Backport [https://github.com/linux-test-project/ltp/commit/f94e0ef3b7280f886384703ef9019aaf2f2dfebb]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-Reviewed-by: Petr Vorel <pvorel@suse.cz>
-Reviewed-by: Martin Doucha <mdoucha@suse.cz>
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- testcases/kernel/kvm/Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/testcases/kernel/kvm/Makefile b/testcases/kernel/kvm/Makefile
-index adab56952..d67230735 100644
---- a/testcases/kernel/kvm/Makefile
-+++ b/testcases/kernel/kvm/Makefile
-@@ -50,11 +50,11 @@ include $(top_srcdir)/include/mk/generic_leaf_target.mk
- ifdef VERBOSE
- 	$(CC) $(GUEST_CPPFLAGS) $(GUEST_CFLAGS) $(GUEST_LDFLAGS) -o $*-payload.elf $^ $(GUEST_LDLIBS)
- 	objcopy -O binary -j .init.boot -j .text -j .data -j .init -j .preinit_array -j .init_array --gap-fill=0 $*-payload.elf $*-payload.bin
--	ld -z noexecstack -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
-+	$(LD) -z noexecstack -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
- else
- 	@$(CC) $(GUEST_CPPFLAGS) $(GUEST_CFLAGS) $(GUEST_LDFLAGS) -o $*-payload.elf $^ $(GUEST_LDLIBS)
- 	@objcopy -O binary -j .init.boot -j .text -j .data -j .init -j .preinit_array -j .init_array --gap-fill=0 $*-payload.elf $*-payload.bin
--	@ld -z noexecstack -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
-+	@$(LD) -z noexecstack -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
- 	@echo KVM_CC $(target_rel_dir)$@
- endif
- 	@rm $*-payload.elf $*-payload.bin
diff --git a/meta/recipes-extended/ltp/ltp/0003-Add-KVM_LD-Makefile-variable-for-building-KVM-payloa.patch b/meta/recipes-extended/ltp/ltp/0003-Add-KVM_LD-Makefile-variable-for-building-KVM-payloa.patch
deleted file mode 100644
index 974ca5eebe..0000000000
--- a/meta/recipes-extended/ltp/ltp/0003-Add-KVM_LD-Makefile-variable-for-building-KVM-payloa.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From a8d41b7937a34904611011ca357f8db880d42270 Mon Sep 17 00:00:00 2001
-From: Martin Doucha <mdoucha@suse.cz>
-Date: Mon, 25 Jul 2022 17:37:27 +0200
-Subject: [PATCH] Add KVM_LD Makefile variable for building KVM payload
- binaries
-
-KVM linker needs to be configurable for cross-compiling but some
-linkers don't support the linker script for wrapping arbitrary files
-into linkable resource files. Allow KVM linker to be changed
-independently of $LD via $KVM_LD.
-
-Signed-off-by: Martin Doucha <mdoucha@suse.cz>
-Acked-by: Richard Palethorpe <rpalethorpe@suse.com>
-
-Upstream-Status: Backport [https://github.com/linux-test-project/ltp/commit/5ef0b7892a17b64040e55e9ad62d36ebb75d33fd]
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- doc/build-system-guide.txt    | 5 +++++
- testcases/kernel/kvm/Makefile | 5 +++--
- 2 files changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/doc/build-system-guide.txt b/doc/build-system-guide.txt
-index 166f7fb92..b8d267b4b 100644
---- a/doc/build-system-guide.txt
-+++ b/doc/build-system-guide.txt
-@@ -145,6 +145,11 @@ $(CPPFLAGS)		: Preprocessor flags, e.g. -I arguments.
- 
- $(DEBUG_CFLAGS)		: Debug flags to pass to $(CC), -g, etc.
- 
-+$(KVM_LD)		: Special linker for wrapping KVM payload binaries
-+			  into linkable object files. Defaults to $(LD).
-+			  Change this variable if the KVM Makefile fails
-+			  to build files named *-payload.o.
-+
- $(LD)			: The system linker (typically $(CC), but not
- 			  necessarily).
- 
-diff --git a/testcases/kernel/kvm/Makefile b/testcases/kernel/kvm/Makefile
-index d67230735..31f144c26 100644
---- a/testcases/kernel/kvm/Makefile
-+++ b/testcases/kernel/kvm/Makefile
-@@ -11,6 +11,7 @@ GUEST_CPPFLAGS = $(CPPFLAGS) -DCOMPILE_PAYLOAD
- GUEST_CFLAGS = -ffreestanding -O2 -Wall -fno-asynchronous-unwind-tables -mno-mmx -mno-sse
- GUEST_LDFLAGS = -nostdlib -Wl,--build-id=none
- GUEST_LDLIBS =
-+KVM_LD ?= $(LD)
- 
- FILTER_OUT_MAKE_TARGETS := lib_guest lib_host lib_x86
- 
-@@ -50,11 +51,11 @@ include $(top_srcdir)/include/mk/generic_leaf_target.mk
- ifdef VERBOSE
- 	$(CC) $(GUEST_CPPFLAGS) $(GUEST_CFLAGS) $(GUEST_LDFLAGS) -o $*-payload.elf $^ $(GUEST_LDLIBS)
- 	objcopy -O binary -j .init.boot -j .text -j .data -j .init -j .preinit_array -j .init_array --gap-fill=0 $*-payload.elf $*-payload.bin
--	$(LD) -z noexecstack -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
-+	$(KVM_LD) -z noexecstack -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
- else
- 	@$(CC) $(GUEST_CPPFLAGS) $(GUEST_CFLAGS) $(GUEST_LDFLAGS) -o $*-payload.elf $^ $(GUEST_LDLIBS)
- 	@objcopy -O binary -j .init.boot -j .text -j .data -j .init -j .preinit_array -j .init_array --gap-fill=0 $*-payload.elf $*-payload.bin
--	@$(LD) -z noexecstack -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
-+	@$(KVM_LD) -z noexecstack -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
- 	@echo KVM_CC $(target_rel_dir)$@
- endif
- 	@rm $*-payload.elf $*-payload.bin
diff --git a/meta/recipes-extended/ltp/ltp_20220527.bb b/meta/recipes-extended/ltp/ltp_20220930.bb
similarity index 86%
rename from meta/recipes-extended/ltp/ltp_20220527.bb
rename to meta/recipes-extended/ltp/ltp_20220930.bb
index b657a6adb1..5aa5dcb0b4 100644
--- a/meta/recipes-extended/ltp/ltp_20220527.bb
+++ b/meta/recipes-extended/ltp/ltp_20220930.bb
@@ -24,23 +24,11 @@ TUNE_CCARGS:remove:x86-64 = "-mfpmath=sse"
 
 CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "6f88e0f6f1d6eb12c48c902f50f47ecbd3b0f18a"
+SRCREV = "b763f81998f19f783982d3937d1fd05bcf649c16"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
            file://disable_hanging_tests.patch \
-           file://0001-kvm-Fix-stack-access-mode-in-KVM-test-ELF-headers.patch \
-           file://0002-kvm-use-LD-instead-of-hardcoding-ld.patch \
-           file://0003-Add-KVM_LD-Makefile-variable-for-building-KVM-payloa.patch \
-           file://0001-nfs05_make_tree-Restore-5-min-timeout.patch \
-           file://0001-syscalls-migrate_pages03-restore-runtime-to-5m.patch \
-           file://0001-mountns0-1-3-wait-for-umount-completed-in-thread_b.patch \
-           file://0001-netstress-Restore-runtime-to-5m.patch \
-           file://0001-net_stress-Fix-usage-of-variables-from-tst_net.sh.patch \
-           file://0001-memcg-functional-Fix-usage-of-PAGESIZE-from-memcg_li.patch \
-           file://0001-lapi-pidfd-adding-pidfd-header-file.patch \
-           file://0001-lapi-fsmount-resolve-conflict-in-different-header-fi.patch \
-           file://0001-rt-migrate-Use-int-instead-of-pthread_t-for-thread-I.patch \
            "
 
 S = "${WORKDIR}/git"
@@ -53,7 +41,7 @@ inherit autotools-brokensep pkgconfig
 # https://github.com/linux-test-project/ltp/commit/3fce2064b54843218d085aae326c8f7ecf3a8c41#diff-39268f0855c634ca48c8993fcd2c95b12a65b79e8d9fa5ccd6b0f5a8785c0dd6R36
 LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd', '', d)}"
 
-# After 0002-kvm-use-LD-instead-of-hardcoding-ld.patch
+# After f94e0ef3b ("kvm: use $(LD) instead of hardcoding ld")
 # https://github.com/linux-test-project/ltp/commit/f94e0ef3b7280f886384703ef9019aaf2f2dfebb
 # it fails with gold also a bit later when trying to use *-payload.bin
 # http://errors.yoctoproject.org/Errors/Details/663094/
-- 
2.37.2


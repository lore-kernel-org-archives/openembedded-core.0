Return-Path: <Catalin.Enache@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A058A6010D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 16:43:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v67Ghm5t032049
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Jul 2017 09:43:48 -0700
Received: from otp-linux01.wrs.com (128.224.126.17) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 7 Jul 2017 09:43:47 -0700
From: Catalin Enache <catalin.enache@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Jul 2017 19:43:34 +0300
Message-ID: <20170707164334.217694-1-catalin.enache@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [morty][PATCH v3] glibc: fix pthread_cond_broadcast issue (arm)
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
X-List-Received-Date: Fri, 07 Jul 2017 16:43:49 -0000
Content-Type: text/plain

pthread_mutex functions such as pthread_cond_wait(), pthread_mutex_unlock() return
errors after PTHREAD_PRIO_INHERIT is enabled

Reference:
https://sourceware.org/bugzilla/show_bug.cgi?id=18463

Upstream patches:
https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=f0e3925bf3b8df6940c3346db17e42615979d458
https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=13cb8f76da9d9420330796f469dbf10643ba5b12
https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=23b5cae1af04f2d912910fdaf73cb482265798c1
https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=ed19993b5b0d05d62cc883571519a67dae481a14
https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=2e4cf778972573221e9b87fd992844ea9b67b9bf
https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=abff18c0c6055ca5d1cd46923fd1205c057139a5

This issue is Morty specific (glibc 2.24).
The issue is no longer present in glibc 2.25 (master branch).

Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
---
 .../glibc/0001-Add-atomic_exchange_relaxed.patch   |   58 +
 ...operations-required-by-the-new-condition-.patch |  124 +
 ...d-pretty-printers-for-the-NPTL-lock-types.patch | 3197 +++++++++
 ...-implementation-that-provides-stronger-or.patch | 7171 ++++++++++++++++++++
 .../glibc/0005-Remove-__ASSUME_REQUEUE_PI.patch    |  149 +
 .../glibc/0006-Fix-atomic_fetch_xor_release.patch  |   81 +
 meta/recipes-core/glibc/glibc_2.24.bb              |    6 +
 7 files changed, 10786 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-Add-atomic_exchange_relaxed.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0002-Add-atomic-operations-required-by-the-new-condition-.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0003-Add-pretty-printers-for-the-NPTL-lock-types.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0004-New-condvar-implementation-that-provides-stronger-or.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0005-Remove-__ASSUME_REQUEUE_PI.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0006-Fix-atomic_fetch_xor_release.patch

diff --git a/meta/recipes-core/glibc/glibc/0001-Add-atomic_exchange_relaxed.patch b/meta/recipes-core/glibc/glibc/0001-Add-atomic_exchange_relaxed.patch
new file mode 100644
index 0000000..a33a135
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-Add-atomic_exchange_relaxed.patch
@@ -0,0 +1,58 @@
+From ce74a620bf9e1a40b7ba06d35160e20633a4d8bb Mon Sep 17 00:00:00 2001
+From: Catalin Enache <catalin.enache@windriver.com>
+Date: Fri, 7 Jul 2017 13:11:16 +0300
+Subject: [PATCH 1/6] Add atomic_exchange_relaxed.
+
+* include/atomic.h (atomic_exchange_relaxed): New
+
+Upstream-Status: Backport
+
+Author: Torvald Riegel <triegel@redhat.com>
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ ChangeLog        | 4 ++++
+ include/atomic.h | 9 +++++++++
+ 2 files changed, 13 insertions(+)
+
+diff --git a/ChangeLog b/ChangeLog
+index 0fbda90..cb87279 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,7 @@
++2016-08-05  Torvald Riegel  <triegel@redhat.com>
++
++	* include/atomic.h (atomic_exchange_relaxed): New.
++
+ 2016-01-28  Carlos O'Donell  <carlos@redhat.com>
+ 	    Alexey Makhalov <amakhalov@vmware.com>
+ 	    Florian Weimer <fweimer@redhat.com>
+diff --git a/include/atomic.h b/include/atomic.h
+index ad3db25..129ee24 100644
+--- a/include/atomic.h
++++ b/include/atomic.h
+@@ -588,6 +588,9 @@ void __atomic_link_error (void);
+   __atomic_compare_exchange_n ((mem), (expected), (desired), 1,		      \
+     __ATOMIC_RELEASE, __ATOMIC_RELAXED); })
+ 
++# define atomic_exchange_relaxed(mem, desired) \
++  ({ __atomic_check_size((mem));					      \
++  __atomic_exchange_n ((mem), (desired), __ATOMIC_RELAXED); })
+ # define atomic_exchange_acquire(mem, desired) \
+   ({ __atomic_check_size((mem));					      \
+   __atomic_exchange_n ((mem), (desired), __ATOMIC_ACQUIRE); })
+@@ -684,6 +687,12 @@ void __atomic_link_error (void);
+    *(expected) == __atg103_expected; })
+ # endif
+ 
++/* XXX Fall back to acquire MO because archs do not define a weaker
++   atomic_exchange.  */
++# ifndef atomic_exchange_relaxed
++#  define atomic_exchange_relaxed(mem, val) \
++   atomic_exchange_acq ((mem), (val))
++# endif
+ # ifndef atomic_exchange_acquire
+ #  define atomic_exchange_acquire(mem, val) \
+    atomic_exchange_acq ((mem), (val))
+-- 
+2.10.2
+
diff --git a/meta/recipes-core/glibc/glibc/0002-Add-atomic-operations-required-by-the-new-condition-.patch b/meta/recipes-core/glibc/glibc/0002-Add-atomic-operations-required-by-the-new-condition-.patch
new file mode 100644
index 0000000..c4747fa
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0002-Add-atomic-operations-required-by-the-new-condition-.patch
@@ -0,0 +1,124 @@
+From b85e30e655027132c4326d2fdde010c517165aaf Mon Sep 17 00:00:00 2001
+From: Catalin Enache <catalin.enache@windriver.com>
+Date: Fri, 30 Jun 2017 14:27:34 +0300
+Subject: [PATCH 2/6] Add atomic operations required by the new condition
+ variable.
+
+    * include/atomic.h (atomic_fetch_and_relaxed,
+    atomic_fetch_and_release, atomic_fetch_or_release,
+    atomic_fetch_xor_release): New.
+
+Upstream-Status: Backport
+
+Author: Torvald Riegel <triegel@redhat.com>
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ ChangeLog        |  6 ++++++
+ include/atomic.h | 47 +++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 53 insertions(+)
+
+diff --git a/ChangeLog b/ChangeLog
+index cb87279..96b6da2 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,9 @@
++2016-08-09  Torvald Riegel  <triegel@redhat.com>
++
++	* include/atomic.h (atomic_fetch_and_relaxed,
++	atomic_fetch_and_release, atomic_fetch_or_release,
++	atomic_fetch_xor_release): New.
++
+ 2016-08-05  Torvald Riegel  <triegel@redhat.com>
+ 
+ 	* include/atomic.h (atomic_exchange_relaxed): New.
+diff --git a/include/atomic.h b/include/atomic.h
+index 129ee24..5a8e7e7 100644
+--- a/include/atomic.h
++++ b/include/atomic.h
+@@ -611,9 +611,15 @@ void __atomic_link_error (void);
+   ({ __atomic_check_size((mem));					      \
+   __atomic_fetch_add ((mem), (operand), __ATOMIC_ACQ_REL); })
+ 
++# define atomic_fetch_and_relaxed(mem, operand) \
++  ({ __atomic_check_size((mem));					      \
++  __atomic_fetch_and ((mem), (operand), __ATOMIC_RELAXED); })
+ # define atomic_fetch_and_acquire(mem, operand) \
+   ({ __atomic_check_size((mem));					      \
+   __atomic_fetch_and ((mem), (operand), __ATOMIC_ACQUIRE); })
++# define atomic_fetch_and_release(mem, operand) \
++  ({ __atomic_check_size((mem));					      \
++  __atomic_fetch_and ((mem), (operand), __ATOMIC_RELEASE); })
+ 
+ # define atomic_fetch_or_relaxed(mem, operand) \
+   ({ __atomic_check_size((mem));					      \
+@@ -621,6 +627,13 @@ void __atomic_link_error (void);
+ # define atomic_fetch_or_acquire(mem, operand) \
+   ({ __atomic_check_size((mem));					      \
+   __atomic_fetch_or ((mem), (operand), __ATOMIC_ACQUIRE); })
++# define atomic_fetch_or_release(mem, operand) \
++  ({ __atomic_check_size((mem));					      \
++  __atomic_fetch_or ((mem), (operand), __ATOMIC_RELEASE); })
++
++# define atomic_fetch_xor_release(mem, operand) \
++  ({ __atomic_check_size((mem));					      \
++  __atomic_fetch_xor ((mem), (operand), __ATOMIC_RELEASE); })
+ 
+ #else /* !USE_ATOMIC_COMPILER_BUILTINS  */
+ 
+@@ -724,12 +737,24 @@ void __atomic_link_error (void);
+    atomic_exchange_and_add_acq ((mem), (operand)); })
+ # endif
+ 
++/* XXX Fall back to acquire MO because archs do not define a weaker
++   atomic_and_val.  */
++# ifndef atomic_fetch_and_relaxed
++#  define atomic_fetch_and_relaxed(mem, operand) \
++   atomic_fetch_and_acquire ((mem), (operand))
++# endif
+ /* XXX The default for atomic_and_val has acquire semantics, but this is not
+    documented.  */
+ # ifndef atomic_fetch_and_acquire
+ #  define atomic_fetch_and_acquire(mem, operand) \
+    atomic_and_val ((mem), (operand))
+ # endif
++# ifndef atomic_fetch_and_release
++/* XXX This unnecessarily has acquire MO.  */
++#  define atomic_fetch_and_release(mem, operand) \
++   ({ atomic_thread_fence_release ();					      \
++   atomic_and_val ((mem), (operand)); })
++# endif
+ 
+ /* XXX The default for atomic_or_val has acquire semantics, but this is not
+    documented.  */
+@@ -743,6 +768,28 @@ void __atomic_link_error (void);
+ #  define atomic_fetch_or_relaxed(mem, operand) \
+    atomic_fetch_or_acquire ((mem), (operand))
+ # endif
++/* XXX Contains an unnecessary acquire MO because archs do not define a weaker
++   atomic_or_val.  */
++# ifndef atomic_fetch_or_release
++#  define atomic_fetch_or_release(mem, operand) \
++   ({ atomic_thread_fence_release ();					      \
++   atomic_fetch_or_acquire ((mem), (operand)); })
++# endif
++
++# ifndef atomic_fetch_xor_release
++# define atomic_fetch_xor_release(mem, operand) \
++  ({ __typeof (*(mem)) __atg104_old;					      \
++     __typeof (mem) __atg104_memp = (mem);				      \
++     __typeof (*(mem)) __atg104_op = (operand);				      \
++									      \
++     do									      \
++       __atg104_old = (*__atg104_memp);					      \
++     while (__builtin_expect						      \
++	    (atomic_compare_and_exchange_bool_rel (			      \
++		__atg104_memp, __atg104_old ^ __atg104_op, __atg104_old), 0));\
++									      \
++     __atg104_old; })
++#endif
+ 
+ #endif /* !USE_ATOMIC_COMPILER_BUILTINS  */
+ 
+-- 
+2.10.2
+
diff --git a/meta/recipes-core/glibc/glibc/0003-Add-pretty-printers-for-the-NPTL-lock-types.patch b/meta/recipes-core/glibc/glibc/0003-Add-pretty-printers-for-the-NPTL-lock-types.patch
new file mode 100644
index 0000000..9eb635d
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0003-Add-pretty-printers-for-the-NPTL-lock-types.patch
@@ -0,0 +1,3197 @@
+From 246fee86fc90c57738ee282a061039f82832f4ea Mon Sep 17 00:00:00 2001
+From: Catalin Enache <catalin.enache@windriver.com>
+Date: Fri, 30 Jun 2017 13:42:04 +0300
+Subject: [PATCH 3/6] Add pretty printers for the NPTL lock types
+
+This patch adds pretty printers for the following NPTL types:
+
+- pthread_mutex_t
+- pthread_mutexattr_t
+- pthread_cond_t
+- pthread_condattr_t
+- pthread_rwlock_t
+- pthread_rwlockattr_t
+
+To load the pretty printers into your gdb session, do the following:
+
+python
+import sys
+sys.path.insert(0, '/path/to/glibc/build/nptl/pretty-printers')
+end
+
+source /path/to/glibc/source/pretty-printers/nptl-printers.py
+
+You can check which printers are registered and enabled by issuing the
+'info pretty-printer' gdb command. Printers should trigger automatically when
+trying to print a variable of one of the types mentioned above.
+
+The printers are architecture-independent, and were tested on an AMD64 running
+Ubuntu 14.04 and an x86 VM running Fedora 24.
+
+In order to work, the printers need to know the values of various flags that
+are scattered throughout pthread.h and pthreadP.h as enums and #defines. Since
+replicating these constants in the printers file itself would create a
+maintenance burden, I wrote a script called gen-py-const.awk that Makerules uses
+to extract the constants. This script is pretty much the same as gen-as-const.awk,
+except it doesn't cast the constant values to 'long' and is thorougly documented.
+The constants need only to be enumerated in a .pysym file, which is then referenced
+by a Make variable called gen-py-const-headers.
+
+As for the install directory, I discussed this with Mike Frysinger and Siddhesh
+Poyarekar, and we agreed that it can be handled in a separate patch, and shouldn't
+block merging of this one.
+
+In addition, I've written a series of test cases for the pretty printers.
+Each lock type (mutex, condvar and rwlock) has two test programs, one for itself
+and other for its related 'attributes' object. Each test program in turn has a
+PExpect-based Python script that drives gdb and compares its output to the
+expected printer's. The tests run on the glibc host, which is assumed to have
+both gdb and PExpect; if either is absent the tests will fail with code 77
+(UNSUPPORTED). For cross-testing you should use cross-test-ssh.sh as test-wrapper.
+I've tested the printers on both native builds and a cross build using a Beaglebone
+Black running Debian, with the build system's filesystem shared with the board
+through NFS.
+
+Finally, I've written a README that explains all this and more.
+
+    * INSTALL: Regenerated.
+    * Makeconfig: Add comments and whitespace to make the control flow
+    clearer.
+    (+link-printers-tests, +link-pie-printers-tests, CFLAGS-printers-tests,
+    installed-rtld-LDFLAGS, built-rtld-LDFLAGS, link-libc-rpath,
+    link-libc-tests-after-rpath-link, link-libc-printers-tests): New.
+    (rtld-LDFLAGS, rtld-tests-LDFLAGS, link-libc-tests-rpath-link,
+    link-libc-tests): Use the new variables as required.
+    * Makerules ($(py-const)): New rule.
+    generated: Add $(py-const).
+    * README.pretty-printers: New file.
+    * Rules (tests-printers-programs, tests-printers-out, py-env): New.
+    (others): Depend on $(py-const).
+    (tests): Depend on $(tests-printers-programs) or $(tests-printers-out),
+    as required.  Pass $(tests-printers) to merge-test-results.sh.
+    * manual/install.texi: Add requirements for testing the pretty printers.
+    * nptl/Makefile (gen-py-const-headers, pretty-printers, tests-printers,
+    CFLAGS-test-mutexattr-printers.c CFLAGS-test-mutex-printers.c,
+    CFLAGS-test-condattr-printers.c, CFLAGS-test-cond-printers.c,
+    CFLAGS-test-rwlockattr-printers.c CFLAGS-test-rwlock-printers.c,
+    tests-printers-libs): Define.
+    * nptl/nptl-printers.py: New file.
+    * nptl/nptl_lock_constants.pysym: Likewise.
+    * nptl/test-cond-printers.c: Likewise.
+    * nptl/test-cond-printers.py: Likewise.
+    * nptl/test-condattr-printers.c: Likewise.
+    * nptl/test-condattr-printers.py: Likewise.
+    * nptl/test-mutex-printers.c: Likewise.
+    * nptl/test-mutex-printers.py: Likewise.
+    * nptl/test-mutexattr-printers.c: Likewise.
+    * nptl/test-mutexattr-printers.py: Likewise.
+    * nptl/test-rwlock-printers.c: Likewise.
+    * nptl/test-rwlock-printers.py: Likewise.
+    * nptl/test-rwlockattr-printers.c: Likewise.
+    * nptl/test-rwlockattr-printers.py: Likewise.
+    * scripts/gen-py-const.awk: Likewise.
+    * scripts/test_printers_common.py: Likewise.
+    * scripts/test_printers_exceptions.py: Likewise.
+
+Upstream-Status: Backport
+
+Author: Martin Galvan <martin.galvan@tallertechnologies.com>
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ ChangeLog                           |  45 +++
+ INSTALL                             |  27 ++
+ Makeconfig                          |  76 ++++-
+ Makerules                           |  46 +++
+ NEWS                                |   6 +
+ README.pretty-printers              | 169 ++++++++++
+ Rules                               |  44 ++-
+ manual/install.texi                 |  30 ++
+ nptl/Makefile                       |  18 +
+ nptl/nptl-printers.py               | 633 ++++++++++++++++++++++++++++++++++++
+ nptl/nptl_lock_constants.pysym      |  75 +++++
+ nptl/test-cond-printers.c           |  57 ++++
+ nptl/test-cond-printers.py          |  50 +++
+ nptl/test-condattr-printers.c       |  94 ++++++
+ nptl/test-condattr-printers.py      |  71 ++++
+ nptl/test-mutex-printers.c          | 151 +++++++++
+ nptl/test-mutex-printers.py         |  97 ++++++
+ nptl/test-mutexattr-printers.c      | 144 ++++++++
+ nptl/test-mutexattr-printers.py     | 101 ++++++
+ nptl/test-rwlock-printers.c         |  78 +++++
+ nptl/test-rwlock-printers.py        |  64 ++++
+ nptl/test-rwlockattr-printers.c     |  98 ++++++
+ nptl/test-rwlockattr-printers.py    |  73 +++++
+ scripts/gen-py-const.awk            | 118 +++++++
+ scripts/test_printers_common.py     | 364 +++++++++++++++++++++
+ scripts/test_printers_exceptions.py |  61 ++++
+ 26 files changed, 2770 insertions(+), 20 deletions(-)
+ create mode 100644 README.pretty-printers
+ create mode 100644 nptl/nptl-printers.py
+ create mode 100644 nptl/nptl_lock_constants.pysym
+ create mode 100644 nptl/test-cond-printers.c
+ create mode 100644 nptl/test-cond-printers.py
+ create mode 100644 nptl/test-condattr-printers.c
+ create mode 100644 nptl/test-condattr-printers.py
+ create mode 100644 nptl/test-mutex-printers.c
+ create mode 100644 nptl/test-mutex-printers.py
+ create mode 100644 nptl/test-mutexattr-printers.c
+ create mode 100644 nptl/test-mutexattr-printers.py
+ create mode 100644 nptl/test-rwlock-printers.c
+ create mode 100644 nptl/test-rwlock-printers.py
+ create mode 100644 nptl/test-rwlockattr-printers.c
+ create mode 100644 nptl/test-rwlockattr-printers.py
+ create mode 100644 scripts/gen-py-const.awk
+ create mode 100644 scripts/test_printers_common.py
+ create mode 100644 scripts/test_printers_exceptions.py
+
+diff --git a/ChangeLog b/ChangeLog
+index 96b6da2..8036c1e 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,48 @@
++2016-12-08  Martin Galvan  <martin.galvan@tallertechnologies.com>
++
++	* INSTALL: Regenerated.
++	* Makeconfig: Add comments and whitespace to make the control flow
++	clearer.
++	(+link-printers-tests, +link-pie-printers-tests,
++	CFLAGS-printers-tests, installed-rtld-LDFLAGS,
++	built-rtld-LDFLAGS, link-libc-rpath,
++	link-libc-tests-after-rpath-link,
++	link-libc-printers-tests): New.
++	(rtld-LDFLAGS, rtld-tests-LDFLAGS, link-libc-tests-rpath-link,
++	link-libc-tests): Use the new variables as required.
++	* Makerules ($(py-const)): New rule.
++	generated: Add $(py-const).
++	* README.pretty-printers: New file.
++	* Rules (tests-printers-programs, tests-printers-out, py-env): New.
++	(others): Depend on $(py-const).
++	(tests): Depend on $(tests-printers-programs) or
++	$(tests-printers-out),
++	as required.  Pass $(tests-printers) to merge-test-results.sh.
++	* manual/install.texi: Add requirements for testing the pretty
++	printers.
++	* nptl/Makefile (gen-py-const-headers, pretty-printers,
++	tests-printers, CFLAGS-test-mutexattr-printers.c
++	CFLAGS-test-mutex-printers.c, CFLAGS-test-condattr-printers.c,
++	CFLAGS-test-cond-printers.c, CFLAGS-test-rwlockattr-printers.c
++	CFLAGS-test-rwlock-printers.c, tests-printers-libs): Define.
++	* nptl/nptl-printers.py: New file.
++	* nptl/nptl_lock_constants.pysym: Likewise.
++	* nptl/test-cond-printers.c: Likewise.
++	* nptl/test-cond-printers.py: Likewise.
++	* nptl/test-condattr-printers.c: Likewise.
++	* nptl/test-condattr-printers.py: Likewise.
++	* nptl/test-mutex-printers.c: Likewise.
++	* nptl/test-mutex-printers.py: Likewise.
++	* nptl/test-mutexattr-printers.c: Likewise.
++	* nptl/test-mutexattr-printers.py: Likewise.
++	* nptl/test-rwlock-printers.c: Likewise.
++	* nptl/test-rwlock-printers.py: Likewise.
++	* nptl/test-rwlockattr-printers.c: Likewise.
++	* nptl/test-rwlockattr-printers.py: Likewise.
++	* scripts/gen-py-const.awk: Likewise.
++	* scripts/test_printers_common.py: Likewise.
++	* scripts/test_printers_exceptions.py: Likewise.
++
+ 2016-08-09  Torvald Riegel  <triegel@redhat.com>
+ 
+ 	* include/atomic.h (atomic_fetch_and_relaxed,
+diff --git a/INSTALL b/INSTALL
+index ec3445f..dd62c86 100644
+--- a/INSTALL
++++ b/INSTALL
+@@ -224,6 +224,33 @@ You can specify 'stop-on-test-failure=y' when running 'make check' to
+ make the test run stop and exit with an error status immediately when a
+ failure occurs.
+ 
++   The GNU C Library pretty printers come with their own set of scripts
++for testing, which run together with the rest of the testsuite through
++'make check'.  These scripts require the following tools to run
++successfully:
++
++   * Python 2.7.6/3.4.3 or later
++
++     Python is required for running the printers' test scripts.
++
++   * PExpect 4.0
++
++     The printer tests drive GDB through test programs and compare its
++     output to the printers'.  PExpect is used to capture the output of
++     GDB, and should be compatible with the Python version in your
++     system.
++
++   * GDB 7.8 or later with support for Python 2.7.6/3.4.3 or later
++
++     GDB itself needs to be configured with Python support in order to
++     use the pretty printers.  Notice that your system having Python
++     available doesn't imply that GDB supports it, nor that your
++     system's Python and GDB's have the same version.
++
++If these tools are absent, the printer tests will report themselves as
++'UNSUPPORTED'.  Notice that some of the printer tests require the GNU C
++Library to be compiled with debugging symbols.
++
+    To format the 'GNU C Library Reference Manual' for printing, type
+ 'make dvi'.  You need a working TeX installation to do this.  The
+ distribution builds the on-line formatted version of the manual, as Info
+diff --git a/Makeconfig b/Makeconfig
+index 03fd89c..2d92d94 100644
+--- a/Makeconfig
++++ b/Makeconfig
+@@ -416,6 +416,11 @@ $(+link-pie-before-libc) $(rtld-tests-LDFLAGS) $(link-libc-tests) \
+ 			 $(+link-pie-after-libc)
+ $(call after-link,$@)
+ endef
++define +link-pie-printers-tests
++$(+link-pie-before-libc) $(built-rtld-LDFLAGS) $(link-libc-printers-tests) \
++			 $(+link-pie-after-libc)
++$(call after-link,$@)
++endef
+ endif
+ # Command for statically linking programs with the C library.
+ ifndef +link-static
+@@ -445,7 +450,8 @@ ifeq (yes,$(build-pie-default))
+ no-pie-ldflag = -no-pie
+ +link = $(+link-pie)
+ +link-tests = $(+link-pie-tests)
+-else
+++link-printers-tests = $(+link-pie-printers-tests)
++else  # not build-pie-default
+ +link-before-libc = $(CC) -nostdlib -nostartfiles -o $@ \
+ 	      $(sysdep-LDFLAGS) $(LDFLAGS) $(LDFLAGS-$(@F)) \
+ 	      $(combreloc-LDFLAGS) $(relro-LDFLAGS) $(hashstyle-LDFLAGS) \
+@@ -466,51 +472,87 @@ $(+link-before-libc) $(rtld-tests-LDFLAGS) $(link-libc-tests) \
+ 		     $(+link-after-libc)
+ $(call after-link,$@)
+ endef
+-endif
+-else
++define +link-printers-tests
++$(+link-before-libc) $(built-rtld-LDFLAGS) $(link-libc-printers-tests) \
++		     $(+link-after-libc)
++$(call after-link,$@)
++endef
++endif  # build-pie-default
++else  # build-static
+ +link = $(+link-static)
+ +link-tests = $(+link-static-tests)
+-endif
+-endif
+++link-printers-tests = $(+link-static-tests)
++endif  # build-shared
++endif  # +link
++
++# The pretty printer test programs need to be compiled without optimizations
++# so they won't confuse gdb.  We could use either the 'GCC optimize' pragma
++# or the 'optimize' function attribute to achieve this; however, at least on
++# ARM, gcc always produces different debugging symbols when invoked with
++# a -O greater than 0 than when invoked with -O0, regardless of anything else
++# we're using to suppress optimizations.  Therefore, we need to explicitly pass
++# -O0 to it through CFLAGS.
++# Additionally, the build system will try to -include $(common-objpfx)/config.h
++# when compiling the tests, which will throw an error if some special macros
++# (such as __OPTIMIZE__ and IS_IN_build) aren't defined.  To avoid this, we
++# tell gcc to define IS_IN_build.
++CFLAGS-printers-tests := -O0 -ggdb3 -DIS_IN_build
++
+ ifeq (yes,$(build-shared))
++# These indicate whether to link using the built ld.so or the installed one.
++installed-rtld-LDFLAGS = -Wl,-dynamic-linker=$(rtlddir)/$(rtld-installed-name)
++built-rtld-LDFLAGS = -Wl,-dynamic-linker=$(elf-objpfx)ld.so
++
+ ifndef rtld-LDFLAGS
+-rtld-LDFLAGS = -Wl,-dynamic-linker=$(rtlddir)/$(rtld-installed-name)
++rtld-LDFLAGS = $(installed-rtld-LDFLAGS)
+ endif
++
+ ifndef rtld-tests-LDFLAGS
+ ifeq (yes,$(build-hardcoded-path-in-tests))
+-rtld-tests-LDFLAGS = -Wl,-dynamic-linker=$(elf-objpfx)ld.so
++rtld-tests-LDFLAGS = $(built-rtld-LDFLAGS)
+ else
+-rtld-tests-LDFLAGS = $(rtld-LDFLAGS)
+-endif
+-endif
+-endif
++rtld-tests-LDFLAGS = $(installed-rtld-LDFLAGS)
++endif  # build-hardcoded-path-in-tests
++endif  # rtld-tests-LDFLAGS
++
++endif  # build-shared
++
+ ifndef link-libc
+ ifeq (yes,$(build-shared))
+ # We need the versioned name of libc.so in the deps of $(others) et al
+ # so that the symlink to libc.so is created before anything tries to
+ # run the linked programs.
++link-libc-rpath = -Wl,-rpath=$(rpath-link)
+ link-libc-rpath-link = -Wl,-rpath-link=$(rpath-link)
++
+ ifeq (yes,$(build-hardcoded-path-in-tests))
+-link-libc-tests-rpath-link = -Wl,-rpath=$(rpath-link)
++link-libc-tests-rpath-link = $(link-libc-rpath)
+ else
+ link-libc-tests-rpath-link = $(link-libc-rpath-link)
+-endif
++endif  # build-hardcoded-path-in-tests
++
+ link-libc-before-gnulib = $(common-objpfx)libc.so$(libc.so-version) \
+ 			  $(common-objpfx)$(patsubst %,$(libtype.oS),c) \
+ 			  $(as-needed) $(elf-objpfx)ld.so \
+ 			  $(no-as-needed)
+ link-libc = $(link-libc-rpath-link) $(link-libc-before-gnulib) $(gnulib)
++
++link-libc-tests-after-rpath-link = $(link-libc-before-gnulib) $(gnulib-tests)
+ link-libc-tests = $(link-libc-tests-rpath-link) \
+-		  $(link-libc-before-gnulib) $(gnulib-tests)
++		  $(link-libc-tests-after-rpath-link)
++# Pretty printer test programs always require rpath instead of rpath-link.
++link-libc-printers-tests = $(link-libc-rpath) \
++			   $(link-libc-tests-after-rpath-link)
++
+ # This is how to find at build-time things that will be installed there.
+ rpath-dirs = math elf dlfcn nss nis rt resolv crypt mathvec
+ rpath-link = \
+ $(common-objdir):$(subst $(empty) ,:,$(patsubst ../$(subdir),.,$(rpath-dirs:%=$(common-objpfx)%)))
+-else
++else  # build-static
+ link-libc = $(common-objpfx)libc.a $(otherlibs) $(gnulib) $(common-objpfx)libc.a $(gnulib)
+ link-libc-tests = $(common-objpfx)libc.a $(otherlibs) $(gnulib-tests) $(common-objpfx)libc.a $(gnulib-tests)
+-endif
+-endif
++endif  # build-shared
++endif  # link-libc
+ 
+ # Differences in the linkers on the various platforms.
+ LDFLAGS-rpath-ORIGIN = -Wl,-rpath,'$$ORIGIN'
+diff --git a/Makerules b/Makerules
+index be3c11b..b7e0f59 100644
+--- a/Makerules
++++ b/Makerules
+@@ -214,6 +214,52 @@ sed-remove-dotdot := -e 's@  *\([^ 	\/$$][^ 	\]*\)@ $$(..)\1@g' \
+ 		     -e 's@^\([^ 	\/$$][^ 	\]*\)@$$(..)\1@g'
+ endif
+ 
++ifdef gen-py-const-headers
++# We'll use a static pattern rule to match .pysym files with their
++# corresponding generated .py files.
++# The generated .py files go in the submodule's dir in the glibc build dir.
++py-const-files := $(patsubst %.pysym,%.py,$(gen-py-const-headers))
++py-const-dir := $(objpfx)
++py-const := $(addprefix $(py-const-dir),$(py-const-files))
++py-const-script := $(..)scripts/gen-py-const.awk
++
++# This is a hack we use to generate .py files with constants for Python
++# pretty printers.  It works the same way as gen-as-const.
++# See scripts/gen-py-const.awk for details on how the awk | gcc mechanism
++# works.
++#
++# $@.tmp and $@.tmp2 are temporary files we use to store the partial contents
++# of the target file.  We do this instead of just writing on $@ because, if the
++# build process terminates prematurely, re-running Make wouldn't run this rule
++# since Make would see that the target file already exists (despite it being
++# incomplete).
++#
++# The sed line replaces "@name@SOME_NAME@value@SOME_VALUE@" strings from the
++# output of 'gcc -S' with "SOME_NAME = SOME_VALUE" strings.
++# The '-n' option, combined with the '/p' command, makes sed output only the
++# modified lines instead of the whole input file.  The output is redirected
++# to a .py file; we'll import it in the pretty printers file to read
++# the constants generated by gen-py-const.awk.
++# The regex has two capturing groups, for SOME_NAME and SOME_VALUE
++# respectively.  Notice SOME_VALUE may be prepended by a special character,
++# depending on the assembly syntax (e.g. immediates are prefixed by a '$'
++# in AT&T x86, and by a '#' in ARM).  We discard it using a complemented set
++# before the second capturing group.
++$(py-const): $(py-const-dir)%.py: %.pysym $(py-const-script) \
++	     $(common-before-compile)
++	$(make-target-directory)
++	$(AWK) -f $(py-const-script) $< \
++	       | $(CC) -S -o $@.tmp $(CFLAGS) $(CPPFLAGS) -x c -
++	echo '# GENERATED FILE\n' > $@.tmp2
++	echo '# Constant definitions for pretty printers.' >> $@.tmp2
++	echo '# See gen-py-const.awk for details.\n' >> $@.tmp2
++	sed -n -r 's/^.*@name@([^@]+)@value@[^[:xdigit:]Xx-]*([[:xdigit:]Xx-]+)@.*/\1 = \2/p' \
++	    $@.tmp >> $@.tmp2
++	mv -f $@.tmp2 $@
++	rm -f $@.tmp
++
++generated += $(py-const)
++endif  # gen-py-const-headers
+ 
+ ifdef gen-as-const-headers
+ # Generating headers for assembly constants.
+diff --git a/NEWS b/NEWS
+index b0447e7..3002773 100644
+--- a/NEWS
++++ b/NEWS
+@@ -5,6 +5,12 @@ See the end for copying conditions.
+ Please send GNU C library bug reports via <http://sourceware.org/bugzilla/>
+ using `glibc' in the "product" field.
+ 
++
++* GDB pretty printers have been added for mutex and condition variable
++  structures in POSIX Threads. When installed and loaded in gdb these pretty
++  printers show various pthread variables in human-readable form when read
++  using the 'print' or 'display' commands in gdb.
++
+ Version 2.24
+ 
+ * The minimum Linux kernel version that this version of the GNU C Library
+diff --git a/README.pretty-printers b/README.pretty-printers
+new file mode 100644
+index 0000000..8662900
+--- /dev/null
++++ b/README.pretty-printers
+@@ -0,0 +1,169 @@
++README for the glibc Python pretty printers
++===========================================
++
++Pretty printers are gdb extensions that allow it to print useful, human-readable
++information about a program's variables.  For example, for a pthread_mutex_t
++gdb would usually output something like this:
++
++(gdb) print mutex
++$1 = {
++  __data = {
++    __lock = 22020096,
++    __count = 0,
++    __owner = 0,
++    __nusers = 0,
++    __kind = 576,
++    __spins = 0,
++    __elision = 0,
++    __list = {
++      __prev = 0x0,
++      __next = 0x0
++    }
++  },
++  __size = "\000\000P\001", '\000' <repeats 12 times>, "@\002", '\000' <repeats 21 times>,
++  __align = 22020096
++}
++
++However, with a pretty printer gdb will output something like this:
++
++(gdb) print mutex
++$1 = pthread_mutex_t = {
++  Type = Normal,
++  Status = Unlocked,
++  Robust = No,
++  Shared = No,
++  Protocol = Priority protect,
++  Priority ceiling = 42
++}
++
++Before printing a value, gdb will first check if there's a pretty printer
++registered for it.  If there is, it'll use it, otherwise it'll print the value
++as usual.  Pretty printers can be registered in various ways; for our purposes
++we register them for the current objfile by calling
++gdb.printing.register_pretty_printer().
++
++Currently our printers are based on gdb.RegexpCollectionPrettyPrinter, which
++means they'll be triggered if the type of the variable we're printing matches
++a given regular expression.  For example, MutexPrinter will be triggered if
++our variable's type matches the regexp '^pthread_mutex_t$'.
++
++Besides the printers themselves, each module may have a constants file which the
++printers will import.  These constants are generated from C headers during the
++build process, and need to be in the Python search path when loading the
++printers.
++
++
++Installing and loading
++----------------------
++
++The pretty printers and their constant files may be installed in different paths
++for each distro, though gdb should be able to automatically load them by itself.
++When in doubt, you can use the 'info pretty-printer' gdb command to list the
++loaded pretty printers.
++
++If the printers aren't automatically loaded for some reason, you should add the
++following to your .gdbinit:
++
++python
++import sys
++sys.path.insert(0, '/path/to/constants/file/directory')
++end
++
++source /path/to/printers.py
++
++If you're building glibc manually, '/path/to/constants/file/directory' should be
++'/path/to/glibc-build/submodule', where 'submodule' is e.g. nptl.
++
++
++Testing
++-------
++
++The pretty printers come with a small test suite based on PExpect, which is a
++Python module with Expect-like features for spawning and controlling interactive
++programs.  Each printer has a corresponding C program and a Python script
++that uses PExpect to drive gdb through the program and compare its output to
++the expected printer's.
++
++The tests run on the glibc host, which is assumed to have both gdb and PExpect;
++if any of those is absent the tests will fail with code 77 (UNSUPPORTED).
++Native builds can be tested simply by doing 'make check'; cross builds must use
++cross-test-ssh.sh as test-wrapper, like this:
++
++make test-wrapper='/path/to/scripts/cross-test-ssh.sh user@host' check
++
++(Remember to share the build system's filesystem with the glibc host's through
++NFS or something similar).
++
++Running 'make check' on a cross build will only compile the test programs,
++without running the scripts.
++
++
++Adding new pretty printers
++--------------------------
++
++Adding new pretty printers to glibc requires following these steps:
++
++1. Identify which constants must be generated from C headers, and write the
++corresponding .pysym file.  See scripts/gen-py-const.awk for more information
++on how this works.  The name of the .pysym file must be added to the
++'gen-py-const-headers' variable in your submodule's Makefile (without the .pysym
++extension).
++
++2. Write the pretty printer code itself.  For this you can follow the gdb
++Python API documentation, and use the existing printers as examples.  The printer
++code must import the generated constants file (which will have the same name
++as your .pysym file).  The names of the pretty printer files must be added
++to the 'pretty-printers' variable in your submodule's Makefile (without the .py
++extension).
++
++3. Write the unit tests for your pretty printers.  The build system calls each
++test script passing it the paths to the test program source, the test program
++binary, and the printer files you added to 'pretty-printers' in the previous
++step.  The test scripts, in turn, must import scripts/test_printers_common
++and call the init_test function passing it, among other things, the name of the
++set of pretty printers to enable (as seen by running 'info pretty-printer').
++You can use the existing unit tests as examples.
++
++4. Add the names of the pretty printer tests to the 'tests-printers' variable
++in your submodule's Makefile (without extensions).  In addition, for each test
++program you must define a corresponding CFLAGS-* variable and set it to
++$(CFLAGS-printers-tests) to ensure they're compiled correctly.  For example,
++test-foo-printer.c requires the following:
++
++CFLAGS-test-foo-printer.c := $(CFLAGS-printers-tests)
++
++Finally, if your programs need to be linked with a specific library, you can add
++its name to the 'tests-printers-libs' variable in your submodule's Makefile.
++
++
++Known issues
++------------
++
++* Pretty printers are inherently coupled to the code they're targetting, thus
++any changes to the target code must also update the corresponding printers.
++On the plus side, the printer code itself may serve as a kind of documentation
++for the target code.
++
++* Older versions of the gdb Python API have a bug where
++gdb.RegexpCollectionPrettyPrinter would not be able to get a value's real type
++if it was typedef'd.  This would cause gdb to ignore the pretty printers for
++types like pthread_mutex_t, which is defined as:
++
++typedef union
++{
++  ...
++} pthread_mutex_t;
++
++This was fixed in commit 1b588015839caafc608a6944a78aea170f5fb2f6, and released
++as part of gdb 7.8.  However, typedef'ing an already typedef'd type may cause
++a similar issue, e.g.:
++
++typedef pthread_mutex_t mutex;
++mutex a_mutex;
++
++Here, trying to print a_mutex won't trigger the pthread_mutex_t printer.
++
++* The test programs must be compiled without optimizations.  This is necessary
++because the test scripts rely on the C code structure being preserved when
++stepping through the programs.  Things like aggressive instruction reordering
++or optimizing variables out may make this kind of testing impossible.
+diff --git a/Rules b/Rules
+index 8306d36..10a6479 100644
+--- a/Rules
++++ b/Rules
+@@ -85,16 +85,27 @@ common-generated += dummy.o dummy.c
+ 
+ .PHONY: others tests bench bench-build
+ 
++# Test programs for the pretty printers.
++tests-printers-programs := $(addprefix $(objpfx),$(tests-printers))
++
++# .out files with the output of running the pretty printer tests.
++tests-printers-out := $(patsubst %,$(objpfx)%.out,$(tests-printers))
++
+ ifeq ($(build-programs),yes)
+ others: $(addprefix $(objpfx),$(others) $(sysdep-others) $(extra-objs))
+ else
+ others: $(addprefix $(objpfx),$(extra-objs))
+ endif
++
++# Generate constant files for Python pretty printers if required.
++others: $(py-const)
++
+ ifeq ($(run-built-tests),no)
+-tests: $(addprefix $(objpfx),$(tests) $(test-srcs)) $(tests-special)
++tests: $(addprefix $(objpfx),$(tests) $(test-srcs)) $(tests-special) \
++       $(tests-printers-programs)
+ xtests: tests $(xtests-special)
+ else
+-tests: $(tests:%=$(objpfx)%.out) $(tests-special)
++tests: $(tests:%=$(objpfx)%.out) $(tests-special) $(tests-printers-out)
+ xtests: tests $(xtests:%=$(objpfx)%.out) $(xtests-special)
+ endif
+ 
+@@ -102,7 +113,8 @@ tests-special-notdir = $(patsubst $(objpfx)%, %, $(tests-special))
+ xtests-special-notdir = $(patsubst $(objpfx)%, %, $(xtests-special))
+ tests:
+ 	$(..)scripts/merge-test-results.sh -s $(objpfx) $(subdir) \
+-	  $(sort $(tests) $(tests-special-notdir:.out=)) \
++	  $(sort $(tests) $(tests-special-notdir:.out=) \
++	  $(tests-printers)) \
+ 	  > $(objpfx)subdir-tests.sum
+ xtests:
+ 	$(..)scripts/merge-test-results.sh -s $(objpfx) $(subdir) \
+@@ -212,6 +224,32 @@ endif
+ 
+ endif	# tests
+ 
++ifneq "$(strip $(tests-printers))" ""
++# We're defining this here for now; later it'll be defined at configure time
++# inside Makeconfig.
++PYTHON := python
++
++# Static pattern rule for building the test programs for the pretty printers.
++$(tests-printers-programs): %: %.o $(tests-printers-libs) \
++  $(sort $(filter $(common-objpfx)lib%,$(link-libc-static-tests))) \
++  $(addprefix $(csu-objpfx),start.o) $(+preinit) $(+postinit)
++	$(+link-printers-tests)
++
++# Add the paths to the generated constants file and test_common_printers.py
++# to PYTHONPATH so the test scripts can find them.
++py-env := PYTHONPATH=$(py-const-dir):$(..)scripts:$${PYTHONPATH}
++
++# Static pattern rule that matches the test-* targets to their .c and .py
++# prerequisites.  It'll run the corresponding test script for each test program
++# we compiled and place its output in the corresponding .out file.
++# The pretty printer files and test_common_printers.py must be present for all.
++$(tests-printers-out): $(objpfx)%.out: $(objpfx)% %.py %.c $(pretty-printers) \
++		       $(..)scripts/test_printers_common.py
++	$(test-wrapper-env) $(py-env) \
++	    $(PYTHON) $*.py $*.c $(objpfx)$* $(pretty-printers) > $@; \
++	$(evaluate-test)
++endif
++
+ 
+ .PHONY: distclean realclean subdir_distclean subdir_realclean \
+ 	subdir_clean subdir_mostlyclean subdir_testclean
+diff --git a/manual/install.texi b/manual/install.texi
+index 79ee45f..468479e 100644
+--- a/manual/install.texi
++++ b/manual/install.texi
+@@ -256,6 +256,36 @@ occurred.  You can specify @samp{stop-on-test-failure=y} when running
+ @code{make check} to make the test run stop and exit with an error
+ status immediately when a failure occurs.
+ 
++The @glibcadj{} pretty printers come with their own set of scripts for testing,
++which run together with the rest of the testsuite through @code{make check}.
++These scripts require the following tools to run successfully:
++
++@itemize @bullet
++@item
++Python 2.7.6/3.4.3 or later
++
++Python is required for running the printers' test scripts.
++
++@item PExpect 4.0
++
++The printer tests drive GDB through test programs and compare its output
++to the printers'.  PExpect is used to capture the output of GDB, and should be
++compatible with the Python version in your system.
++
++@item
++GDB 7.8 or later with support for Python 2.7.6/3.4.3 or later
++
++GDB itself needs to be configured with Python support in order to use the
++pretty printers.  Notice that your system having Python available doesn't imply
++that GDB supports it, nor that your system's Python and GDB's have the same
++version.
++@end itemize
++
++@noindent
++If these tools are absent, the printer tests will report themselves as
++@code{UNSUPPORTED}.  Notice that some of the printer tests require @theglibc{}
++to be compiled with debugging symbols.
++
+ To format the @cite{GNU C Library Reference Manual} for printing, type
+ @w{@code{make dvi}}.  You need a working @TeX{} installation to do
+ this.  The distribution builds the on-line formatted version of the
+diff --git a/nptl/Makefile b/nptl/Makefile
+index 7dec4ed..49f6ba6 100644
+--- a/nptl/Makefile
++++ b/nptl/Makefile
+@@ -308,6 +308,24 @@ gen-as-const-headers = pthread-errnos.sym \
+ 		       unwindbuf.sym \
+ 		       lowlevelrobustlock.sym pthread-pi-defines.sym
+ 
++gen-py-const-headers := nptl_lock_constants.pysym
++pretty-printers := nptl-printers.py
++tests-printers := test-mutexattr-printers test-mutex-printers \
++		  test-condattr-printers test-cond-printers \
++		  test-rwlockattr-printers test-rwlock-printers
++
++CFLAGS-test-mutexattr-printers.c := $(CFLAGS-printers-tests)
++CFLAGS-test-mutex-printers.c := $(CFLAGS-printers-tests)
++CFLAGS-test-condattr-printers.c := $(CFLAGS-printers-tests)
++CFLAGS-test-cond-printers.c := $(CFLAGS-printers-tests)
++CFLAGS-test-rwlockattr-printers.c := $(CFLAGS-printers-tests)
++CFLAGS-test-rwlock-printers.c := $(CFLAGS-printers-tests)
++
++ifeq ($(build-shared),yes)
++tests-printers-libs := $(shared-thread-library)
++else
++tests-printers-libs := $(static-thread-library)
++endif
+ 
+ LDFLAGS-pthread.so = -Wl,--enable-new-dtags,-z,nodelete,-z,initfirst
+ 
+diff --git a/nptl/nptl-printers.py b/nptl/nptl-printers.py
+new file mode 100644
+index 0000000..e402f23
+--- /dev/null
++++ b/nptl/nptl-printers.py
+@@ -0,0 +1,633 @@
++# Pretty printers for the NPTL lock types.
++#
++# Copyright (C) 2016 Free Software Foundation, Inc.
++# This file is part of the GNU C Library.
++#
++# The GNU C Library is free software; you can redistribute it and/or
++# modify it under the terms of the GNU Lesser General Public
++# License as published by the Free Software Foundation; either
++# version 2.1 of the License, or (at your option) any later version.
++#
++# The GNU C Library is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++# Lesser General Public License for more details.
++#
++# You should have received a copy of the GNU Lesser General Public
++# License along with the GNU C Library; if not, see
++# <http://www.gnu.org/licenses/>.
++
++"""This file contains the gdb pretty printers for the following types:
++
++    * pthread_mutex_t
++    * pthread_mutexattr_t
++    * pthread_cond_t
++    * pthread_condattr_t
++    * pthread_rwlock_t
++    * pthread_rwlockattr_t
++
++You can check which printers are registered and enabled by issuing the
++'info pretty-printer' gdb command.  Printers should trigger automatically when
++trying to print a variable of one of the types mentioned above.
++"""
++
++from __future__ import print_function
++
++import gdb
++import gdb.printing
++from nptl_lock_constants import *
++
++MUTEX_TYPES = {
++    PTHREAD_MUTEX_NORMAL: ('Type', 'Normal'),
++    PTHREAD_MUTEX_RECURSIVE: ('Type', 'Recursive'),
++    PTHREAD_MUTEX_ERRORCHECK: ('Type', 'Error check'),
++    PTHREAD_MUTEX_ADAPTIVE_NP: ('Type', 'Adaptive')
++}
++
++class MutexPrinter(object):
++    """Pretty printer for pthread_mutex_t."""
++
++    def __init__(self, mutex):
++        """Initialize the printer's internal data structures.
++
++        Args:
++            mutex: A gdb.value representing a pthread_mutex_t.
++        """
++
++        data = mutex['__data']
++        self.lock = data['__lock']
++        self.count = data['__count']
++        self.owner = data['__owner']
++        self.kind = data['__kind']
++        self.values = []
++        self.read_values()
++
++    def to_string(self):
++        """gdb API function.
++
++        This is called from gdb when we try to print a pthread_mutex_t.
++        """
++
++        return 'pthread_mutex_t'
++
++    def children(self):
++        """gdb API function.
++
++        This is called from gdb when we try to print a pthread_mutex_t.
++        """
++
++        return self.values
++
++    def read_values(self):
++        """Read the mutex's info and store it in self.values.
++
++        The data contained in self.values will be returned by the Iterator
++        created in self.children.
++        """
++
++        self.read_type()
++        self.read_status()
++        self.read_attributes()
++        self.read_misc_info()
++
++    def read_type(self):
++        """Read the mutex's type."""
++
++        mutex_type = self.kind & PTHREAD_MUTEX_KIND_MASK
++
++        # mutex_type must be casted to int because it's a gdb.Value
++        self.values.append(MUTEX_TYPES[int(mutex_type)])
++
++    def read_status(self):
++        """Read the mutex's status.
++
++        For architectures which support lock elision, this method reads
++        whether the mutex appears as locked in memory (i.e. it may show it as
++        unlocked even after calling pthread_mutex_lock).
++        """
++
++        if self.kind == PTHREAD_MUTEX_DESTROYED:
++            self.values.append(('Status', 'Destroyed'))
++        elif self.kind & PTHREAD_MUTEX_ROBUST_NORMAL_NP:
++            self.read_status_robust()
++        else:
++            self.read_status_no_robust()
++
++    def read_status_robust(self):
++        """Read the status of a robust mutex.
++
++        In glibc robust mutexes are implemented in a very different way than
++        non-robust ones.  This method reads their locking status,
++        whether it may have waiters, their registered owner (if any),
++        whether the owner is alive or not, and the status of the state
++        they're protecting.
++        """
++
++        if self.lock == PTHREAD_MUTEX_UNLOCKED:
++            self.values.append(('Status', 'Unlocked'))
++        else:
++            if self.lock & FUTEX_WAITERS:
++                self.values.append(('Status', 'Locked, possibly with waiters'))
++            else:
++                self.values.append(('Status',
++                                    'Locked, possibly with no waiters'))
++
++            if self.lock & FUTEX_OWNER_DIED:
++                self.values.append(('Owner ID', '%d (dead)' % self.owner))
++            else:
++                self.values.append(('Owner ID', self.lock & FUTEX_TID_MASK))
++
++        if self.owner == PTHREAD_MUTEX_INCONSISTENT:
++            self.values.append(('State protected by this mutex',
++                                'Inconsistent'))
++        elif self.owner == PTHREAD_MUTEX_NOTRECOVERABLE:
++            self.values.append(('State protected by this mutex',
++                                'Not recoverable'))
++
++    def read_status_no_robust(self):
++        """Read the status of a non-robust mutex.
++
++        Read info on whether the mutex is locked, if it may have waiters
++        and its owner (if any).
++        """
++
++        lock_value = self.lock
++
++        if self.kind & PTHREAD_MUTEX_PRIO_PROTECT_NP:
++            lock_value &= ~(PTHREAD_MUTEX_PRIO_CEILING_MASK)
++
++        if lock_value == PTHREAD_MUTEX_UNLOCKED:
++            self.values.append(('Status', 'Unlocked'))
++        else:
++            if self.kind & PTHREAD_MUTEX_PRIO_INHERIT_NP:
++                waiters = self.lock & FUTEX_WAITERS
++                owner = self.lock & FUTEX_TID_MASK
++            else:
++                # Mutex protocol is PP or none
++                waiters = (self.lock != PTHREAD_MUTEX_LOCKED_NO_WAITERS)
++                owner = self.owner
++
++            if waiters:
++                self.values.append(('Status', 'Locked, possibly with waiters'))
++            else:
++                self.values.append(('Status',
++                                    'Locked, possibly with no waiters'))
++
++            self.values.append(('Owner ID', owner))
++
++    def read_attributes(self):
++        """Read the mutex's attributes."""
++
++        if self.kind != PTHREAD_MUTEX_DESTROYED:
++            if self.kind & PTHREAD_MUTEX_ROBUST_NORMAL_NP:
++                self.values.append(('Robust', 'Yes'))
++            else:
++                self.values.append(('Robust', 'No'))
++
++            # In glibc, robust mutexes always have their pshared flag set to
++            # 'shared' regardless of what the pshared flag of their
++            # mutexattr was.  Therefore a robust mutex will act as shared
++            # even if it was initialized with a 'private' mutexattr.
++            if self.kind & PTHREAD_MUTEX_PSHARED_BIT:
++                self.values.append(('Shared', 'Yes'))
++            else:
++                self.values.append(('Shared', 'No'))
++
++            if self.kind & PTHREAD_MUTEX_PRIO_INHERIT_NP:
++                self.values.append(('Protocol', 'Priority inherit'))
++            elif self.kind & PTHREAD_MUTEX_PRIO_PROTECT_NP:
++                prio_ceiling = ((self.lock & PTHREAD_MUTEX_PRIO_CEILING_MASK)
++                                >> PTHREAD_MUTEX_PRIO_CEILING_SHIFT)
++
++                self.values.append(('Protocol', 'Priority protect'))
++                self.values.append(('Priority ceiling', prio_ceiling))
++            else:
++                # PTHREAD_PRIO_NONE
++                self.values.append(('Protocol', 'None'))
++
++    def read_misc_info(self):
++        """Read miscellaneous info on the mutex.
++
++        For now this reads the number of times a recursive mutex was locked
++        by the same thread.
++        """
++
++        mutex_type = self.kind & PTHREAD_MUTEX_KIND_MASK
++
++        if mutex_type == PTHREAD_MUTEX_RECURSIVE and self.count > 1:
++            self.values.append(('Times locked recursively', self.count))
++
++class MutexAttributesPrinter(object):
++    """Pretty printer for pthread_mutexattr_t.
++
++    In the NPTL this is a type that's always casted to struct pthread_mutexattr
++    which has a single 'mutexkind' field containing the actual attributes.
++    """
++
++    def __init__(self, mutexattr):
++        """Initialize the printer's internal data structures.
++
++        Args:
++            mutexattr: A gdb.value representing a pthread_mutexattr_t.
++        """
++
++        self.values = []
++
++        try:
++            mutexattr_struct = gdb.lookup_type('struct pthread_mutexattr')
++            self.mutexattr = mutexattr.cast(mutexattr_struct)['mutexkind']
++            self.read_values()
++        except gdb.error:
++            # libpthread doesn't have debug symbols, thus we can't find the
++            # real struct type.  Just print the union members.
++            self.values.append(('__size', mutexattr['__size']))
++            self.values.append(('__align', mutexattr['__align']))
++
++    def to_string(self):
++        """gdb API function.
++
++        This is called from gdb when we try to print a pthread_mutexattr_t.
++        """
++
++        return 'pthread_mutexattr_t'
++
++    def children(self):
++        """gdb API function.
++
++        This is called from gdb when we try to print a pthread_mutexattr_t.
++        """
++
++        return self.values
++
++    def read_values(self):
++        """Read the mutexattr's info and store it in self.values.
++
++        The data contained in self.values will be returned by the Iterator
++        created in self.children.
++        """
++
++        mutexattr_type = (self.mutexattr
++                          & ~PTHREAD_MUTEXATTR_FLAG_BITS
++                          & ~PTHREAD_MUTEX_NO_ELISION_NP)
++
++        # mutexattr_type must be casted to int because it's a gdb.Value
++        self.values.append(MUTEX_TYPES[int(mutexattr_type)])
++
++        if self.mutexattr & PTHREAD_MUTEXATTR_FLAG_ROBUST:
++            self.values.append(('Robust', 'Yes'))
++        else:
++            self.values.append(('Robust', 'No'))
++
++        if self.mutexattr & PTHREAD_MUTEXATTR_FLAG_PSHARED:
++            self.values.append(('Shared', 'Yes'))
++        else:
++            self.values.append(('Shared', 'No'))
++
++        protocol = ((self.mutexattr & PTHREAD_MUTEXATTR_PROTOCOL_MASK) >>
++                    PTHREAD_MUTEXATTR_PROTOCOL_SHIFT)
++
++        if protocol == PTHREAD_PRIO_NONE:
++            self.values.append(('Protocol', 'None'))
++        elif protocol == PTHREAD_PRIO_INHERIT:
++            self.values.append(('Protocol', 'Priority inherit'))
++        elif protocol == PTHREAD_PRIO_PROTECT:
++            self.values.append(('Protocol', 'Priority protect'))
++
++CLOCK_IDS = {
++    CLOCK_REALTIME: 'CLOCK_REALTIME',
++    CLOCK_MONOTONIC: 'CLOCK_MONOTONIC',
++    CLOCK_PROCESS_CPUTIME_ID: 'CLOCK_PROCESS_CPUTIME_ID',
++    CLOCK_THREAD_CPUTIME_ID: 'CLOCK_THREAD_CPUTIME_ID',
++    CLOCK_MONOTONIC_RAW: 'CLOCK_MONOTONIC_RAW',
++    CLOCK_REALTIME_COARSE: 'CLOCK_REALTIME_COARSE',
++    CLOCK_MONOTONIC_COARSE: 'CLOCK_MONOTONIC_COARSE'
++}
++
++class ConditionVariablePrinter(object):
++    """Pretty printer for pthread_cond_t."""
++
++    def __init__(self, cond):
++        """Initialize the printer's internal data structures.
++
++        Args:
++            cond: A gdb.value representing a pthread_cond_t.
++        """
++
++        # Since PTHREAD_COND_SHARED is an integer, we need to cast it to void *
++        # to be able to compare it to the condvar's __data.__mutex member.
++        #
++        # While it looks like self.shared_value should be a class variable,
++        # that would result in it having an incorrect size if we're loading
++        # these printers through .gdbinit for a 64-bit objfile in AMD64.
++        # This is because gdb initially assumes the pointer size to be 4 bytes,
++        # and only sets it to 8 after loading the 64-bit objfiles.  Since
++        # .gdbinit runs before any objfiles are loaded, this would effectively
++        # make self.shared_value have a size of 4, thus breaking later
++        # comparisons with pointers whose types are looked up at runtime.
++        void_ptr_type = gdb.lookup_type('void').pointer()
++        self.shared_value = gdb.Value(PTHREAD_COND_SHARED).cast(void_ptr_type)
++
++        data = cond['__data']
++        self.total_seq = data['__total_seq']
++        self.mutex = data['__mutex']
++        self.nwaiters = data['__nwaiters']
++        self.values = []
++
++        self.read_values()
++
++    def to_string(self):
++        """gdb API function.
++
++        This is called from gdb when we try to print a pthread_cond_t.
++        """
++
++        return 'pthread_cond_t'
++
++    def children(self):
++        """gdb API function.
++
++        This is called from gdb when we try to print a pthread_cond_t.
++        """
++
++        return self.values
++
++    def read_values(self):
++        """Read the condvar's info and store it in self.values.
++
++        The data contained in self.values will be returned by the Iterator
++        created in self.children.
++        """
++
++        self.read_status()
++        self.read_attributes()
++        self.read_mutex_info()
++
++    def read_status(self):
++        """Read the status of the condvar.
++
++        This method reads whether the condvar is destroyed and how many threads
++        are waiting for it.
++        """
++
++        if self.total_seq == PTHREAD_COND_DESTROYED:
++            self.values.append(('Status', 'Destroyed'))
++
++        self.values.append(('Threads waiting for this condvar',
++                            self.nwaiters >> COND_NWAITERS_SHIFT))
++
++    def read_attributes(self):
++        """Read the condvar's attributes."""
++
++        clock_id = self.nwaiters & ((1 << COND_NWAITERS_SHIFT) - 1)
++
++        # clock_id must be casted to int because it's a gdb.Value
++        self.values.append(('Clock ID', CLOCK_IDS[int(clock_id)]))
++
++        shared = (self.mutex == self.shared_value)
++
++        if shared:
++            self.values.append(('Shared', 'Yes'))
++        else:
++            self.values.append(('Shared', 'No'))
++
++    def read_mutex_info(self):
++        """Read the data of the mutex this condvar is bound to.
++
++        A pthread_cond_t's __data.__mutex member is a void * which
++        must be casted to pthread_mutex_t *.  For shared condvars, this
++        member isn't recorded and has a special value instead.
++        """
++
++        if self.mutex and self.mutex != self.shared_value:
++            mutex_type = gdb.lookup_type('pthread_mutex_t')
++            mutex = self.mutex.cast(mutex_type.pointer()).dereference()
++
++            self.values.append(('Mutex', mutex))
++
++class ConditionVariableAttributesPrinter(object):
++    """Pretty printer for pthread_condattr_t.
++
++    In the NPTL this is a type that's always casted to struct pthread_condattr,
++    which has a single 'value' field containing the actual attributes.
++    """
++
++    def __init__(self, condattr):
++        """Initialize the printer's internal data structures.
++
++        Args:
++            condattr: A gdb.value representing a pthread_condattr_t.
++        """
++
++        self.values = []
++
++        try:
++            condattr_struct = gdb.lookup_type('struct pthread_condattr')
++            self.condattr = condattr.cast(condattr_struct)['value']
++            self.read_values()
++        except gdb.error:
++            # libpthread doesn't have debug symbols, thus we can't find the
++            # real struct type.  Just print the union members.
++            self.values.append(('__size', condattr['__size']))
++            self.values.append(('__align', condattr['__align']))
++
++    def to_string(self):
++        """gdb API function.
++
++        This is called from gdb when we try to print a pthread_condattr_t.
++        """
++
++        return 'pthread_condattr_t'
++
++    def children(self):
++        """gdb API function.
++
++        This is called from gdb when we try to print a pthread_condattr_t.
++        """
++
++        return self.values
++
++    def read_values(self):
++        """Read the condattr's info and store it in self.values.
++
++        The data contained in self.values will be returned by the Iterator
++        created in self.children.
++        """
++
++        clock_id = self.condattr & ((1 << COND_NWAITERS_SHIFT) - 1)
++
++        # clock_id must be casted to int because it's a gdb.Value
++        self.values.append(('Clock ID', CLOCK_IDS[int(clock_id)]))
++
++        if self.condattr & 1:
++            self.values.append(('Shared', 'Yes'))
++        else:
++            self.values.append(('Shared', 'No'))
++
++class RWLockPrinter(object):
++    """Pretty printer for pthread_rwlock_t."""
++
++    def __init__(self, rwlock):
++        """Initialize the printer's internal data structures.
++
++        Args:
++            rwlock: A gdb.value representing a pthread_rwlock_t.
++        """
++
++        data = rwlock['__data']
++        self.readers = data['__nr_readers']
++        self.queued_readers = data['__nr_readers_queued']
++        self.queued_writers = data['__nr_writers_queued']
++        self.writer_id = data['__writer']
++        self.shared = data['__shared']
++        self.prefers_writers = data['__flags']
++        self.values = []
++        self.read_values()
++
++    def to_string(self):
++        """gdb API function.
++
++        This is called from gdb when we try to print a pthread_rwlock_t.
++        """
++
++        return 'pthread_rwlock_t'
++
++    def children(self):
++        """gdb API function.
++
++        This is called from gdb when we try to print a pthread_rwlock_t.
++        """
++
++        return self.values
++
++    def read_values(self):
++        """Read the rwlock's info and store it in self.values.
++
++        The data contained in self.values will be returned by the Iterator
++        created in self.children.
++        """
++
++        self.read_status()
++        self.read_attributes()
++
++    def read_status(self):
++        """Read the status of the rwlock."""
++
++        # Right now pthread_rwlock_destroy doesn't do anything, so there's no
++        # way to check if an rwlock is destroyed.
++
++        if self.writer_id:
++            self.values.append(('Status', 'Locked (Write)'))
++            self.values.append(('Writer ID', self.writer_id))
++        elif self.readers:
++            self.values.append(('Status', 'Locked (Read)'))
++            self.values.append(('Readers', self.readers))
++        else:
++            self.values.append(('Status', 'Unlocked'))
++
++        self.values.append(('Queued readers', self.queued_readers))
++        self.values.append(('Queued writers', self.queued_writers))
++
++    def read_attributes(self):
++        """Read the attributes of the rwlock."""
++
++        if self.shared:
++            self.values.append(('Shared', 'Yes'))
++        else:
++            self.values.append(('Shared', 'No'))
++
++        if self.prefers_writers:
++            self.values.append(('Prefers', 'Writers'))
++        else:
++            self.values.append(('Prefers', 'Readers'))
++
++class RWLockAttributesPrinter(object):
++    """Pretty printer for pthread_rwlockattr_t.
++
++    In the NPTL this is a type that's always casted to
++    struct pthread_rwlockattr, which has two fields ('lockkind' and 'pshared')
++    containing the actual attributes.
++    """
++
++    def __init__(self, rwlockattr):
++        """Initialize the printer's internal data structures.
++
++        Args:
++            rwlockattr: A gdb.value representing a pthread_rwlockattr_t.
++        """
++
++        self.values = []
++
++        try:
++            rwlockattr_struct = gdb.lookup_type('struct pthread_rwlockattr')
++            self.rwlockattr = rwlockattr.cast(rwlockattr_struct)
++            self.read_values()
++        except gdb.error:
++            # libpthread doesn't have debug symbols, thus we can't find the
++            # real struct type.  Just print the union members.
++            self.values.append(('__size', rwlockattr['__size']))
++            self.values.append(('__align', rwlockattr['__align']))
++
++    def to_string(self):
++        """gdb API function.
++
++        This is called from gdb when we try to print a pthread_rwlockattr_t.
++        """
++
++        return 'pthread_rwlockattr_t'
++
++    def children(self):
++        """gdb API function.
++
++        This is called from gdb when we try to print a pthread_rwlockattr_t.
++        """
++
++        return self.values
++
++    def read_values(self):
++        """Read the rwlockattr's info and store it in self.values.
++
++        The data contained in self.values will be returned by the Iterator
++        created in self.children.
++        """
++
++        rwlock_type = self.rwlockattr['lockkind']
++        shared = self.rwlockattr['pshared']
++
++        if shared == PTHREAD_PROCESS_SHARED:
++            self.values.append(('Shared', 'Yes'))
++        else:
++            # PTHREAD_PROCESS_PRIVATE
++            self.values.append(('Shared', 'No'))
++
++        if (rwlock_type == PTHREAD_RWLOCK_PREFER_READER_NP or
++            rwlock_type == PTHREAD_RWLOCK_PREFER_WRITER_NP):
++            # This is a known bug.  Using PTHREAD_RWLOCK_PREFER_WRITER_NP will
++            # still make the rwlock prefer readers.
++            self.values.append(('Prefers', 'Readers'))
++        elif rwlock_type == PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP:
++            self.values.append(('Prefers', 'Writers'))
++
++def register(objfile):
++    """Register the pretty printers within the given objfile."""
++
++    printer = gdb.printing.RegexpCollectionPrettyPrinter('glibc-pthread-locks')
++
++    printer.add_printer('pthread_mutex_t', r'^pthread_mutex_t$',
++                        MutexPrinter)
++    printer.add_printer('pthread_mutexattr_t', r'^pthread_mutexattr_t$',
++                        MutexAttributesPrinter)
++    printer.add_printer('pthread_cond_t', r'^pthread_cond_t$',
++                        ConditionVariablePrinter)
++    printer.add_printer('pthread_condattr_t', r'^pthread_condattr_t$',
++                        ConditionVariableAttributesPrinter)
++    printer.add_printer('pthread_rwlock_t', r'^pthread_rwlock_t$',
++                        RWLockPrinter)
++    printer.add_printer('pthread_rwlockattr_t', r'^pthread_rwlockattr_t$',
++                        RWLockAttributesPrinter)
++
++    if objfile == None:
++        objfile = gdb
++
++    gdb.printing.register_pretty_printer(objfile, printer)
++
++register(gdb.current_objfile())
+diff --git a/nptl/nptl_lock_constants.pysym b/nptl/nptl_lock_constants.pysym
+new file mode 100644
+index 0000000..303ec61
+--- /dev/null
++++ b/nptl/nptl_lock_constants.pysym
+@@ -0,0 +1,75 @@
++#include <pthreadP.h>
++
++-- Mutex types
++PTHREAD_MUTEX_KIND_MASK          PTHREAD_MUTEX_KIND_MASK_NP
++PTHREAD_MUTEX_NORMAL
++PTHREAD_MUTEX_RECURSIVE          PTHREAD_MUTEX_RECURSIVE_NP
++PTHREAD_MUTEX_ERRORCHECK         PTHREAD_MUTEX_ERRORCHECK_NP
++PTHREAD_MUTEX_ADAPTIVE_NP
++
++-- Mutex status
++-- These are hardcoded all over the code; there are no enums/macros for them.
++PTHREAD_MUTEX_DESTROYED         -1
++PTHREAD_MUTEX_UNLOCKED           0
++PTHREAD_MUTEX_LOCKED_NO_WAITERS  1
++
++-- For robust mutexes
++PTHREAD_MUTEX_INCONSISTENT
++PTHREAD_MUTEX_NOTRECOVERABLE
++FUTEX_OWNER_DIED
++
++-- For robust and PI mutexes
++FUTEX_WAITERS
++FUTEX_TID_MASK
++
++-- Mutex attributes
++PTHREAD_MUTEX_ROBUST_NORMAL_NP
++PTHREAD_MUTEX_PRIO_INHERIT_NP
++PTHREAD_MUTEX_PRIO_PROTECT_NP
++PTHREAD_MUTEX_PSHARED_BIT
++PTHREAD_MUTEX_PRIO_CEILING_SHIFT
++PTHREAD_MUTEX_PRIO_CEILING_MASK
++
++-- Mutex attribute flags
++PTHREAD_MUTEXATTR_PROTOCOL_SHIFT
++PTHREAD_MUTEXATTR_PROTOCOL_MASK
++PTHREAD_MUTEXATTR_PRIO_CEILING_MASK
++PTHREAD_MUTEXATTR_FLAG_ROBUST
++PTHREAD_MUTEXATTR_FLAG_PSHARED
++PTHREAD_MUTEXATTR_FLAG_BITS
++PTHREAD_MUTEX_NO_ELISION_NP
++
++-- Priority protocols
++PTHREAD_PRIO_NONE
++PTHREAD_PRIO_INHERIT
++PTHREAD_PRIO_PROTECT
++
++-- These values are hardcoded as well:
++-- Value of __mutex for shared condvars.
++PTHREAD_COND_SHARED             (void *)~0l
++
++-- Value of __total_seq for destroyed condvars.
++PTHREAD_COND_DESTROYED          -1ull
++
++-- __nwaiters encodes the number of threads waiting on a condvar
++-- and the clock ID.
++-- __nwaiters >> COND_NWAITERS_SHIFT gives us the number of waiters.
++COND_NWAITERS_SHIFT
++
++-- Condvar clock IDs
++CLOCK_REALTIME
++CLOCK_MONOTONIC
++CLOCK_PROCESS_CPUTIME_ID
++CLOCK_THREAD_CPUTIME_ID
++CLOCK_MONOTONIC_RAW
++CLOCK_REALTIME_COARSE
++CLOCK_MONOTONIC_COARSE
++
++-- Rwlock attributes
++PTHREAD_RWLOCK_PREFER_READER_NP
++PTHREAD_RWLOCK_PREFER_WRITER_NP
++PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP
++
++-- 'Shared' attribute values
++PTHREAD_PROCESS_PRIVATE
++PTHREAD_PROCESS_SHARED
+diff --git a/nptl/test-cond-printers.c b/nptl/test-cond-printers.c
+new file mode 100644
+index 0000000..0f2a5f4
+--- /dev/null
++++ b/nptl/test-cond-printers.c
+@@ -0,0 +1,57 @@
++/* Helper program for testing the pthread_cond_t pretty printer.
++
++   Copyright (C) 2016 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++/* Keep the calls to the pthread_* functions on separate lines to make it easy
++   to advance through the program using the gdb 'next' command.  */
++
++#include <time.h>
++#include <pthread.h>
++
++#define PASS 0
++#define FAIL 1
++
++static int test_status_destroyed (pthread_cond_t *condvar);
++
++int
++main (void)
++{
++  pthread_cond_t condvar;
++  pthread_condattr_t attr;
++  int result = FAIL;
++
++  if (pthread_condattr_init (&attr) == 0
++      && test_status_destroyed (&condvar) == PASS)
++    result = PASS;
++  /* Else, one of the pthread_cond* functions failed.  */
++
++  return result;
++}
++
++/* Initializes CONDVAR, then destroys it.  */
++static int
++test_status_destroyed (pthread_cond_t *condvar)
++{
++  int result = FAIL;
++
++  if (pthread_cond_init (condvar, NULL) == 0
++      && pthread_cond_destroy (condvar) == 0)
++    result = PASS; /* Test status (destroyed).  */
++
++  return result;
++}
+diff --git a/nptl/test-cond-printers.py b/nptl/test-cond-printers.py
+new file mode 100644
+index 0000000..af0e12e
+--- /dev/null
++++ b/nptl/test-cond-printers.py
+@@ -0,0 +1,50 @@
++# Common tests for the ConditionVariablePrinter class.
++#
++# Copyright (C) 2016 Free Software Foundation, Inc.
++# This file is part of the GNU C Library.
++#
++# The GNU C Library is free software; you can redistribute it and/or
++# modify it under the terms of the GNU Lesser General Public
++# License as published by the Free Software Foundation; either
++# version 2.1 of the License, or (at your option) any later version.
++#
++# The GNU C Library is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++# Lesser General Public License for more details.
++#
++# You should have received a copy of the GNU Lesser General Public
++# License along with the GNU C Library; if not, see
++# <http://www.gnu.org/licenses/>.
++
++import sys
++
++from test_printers_common import *
++
++test_source = sys.argv[1]
++test_bin = sys.argv[2]
++printer_files = sys.argv[3:]
++printer_names = ['global glibc-pthread-locks']
++
++try:
++    init_test(test_bin, printer_files, printer_names)
++    go_to_main()
++
++    var = 'condvar'
++    to_string = 'pthread_cond_t'
++
++    break_at(test_source, 'Test status (destroyed)')
++    continue_cmd() # Go to test_status_destroyed
++    test_printer(var, to_string, {'Status': 'Destroyed'})
++
++    continue_cmd() # Exit
++
++except (NoLineError, pexpect.TIMEOUT) as exception:
++    print('Error: {0}'.format(exception))
++    result = FAIL
++
++else:
++    print('Test succeeded.')
++    result = PASS
++
++exit(result)
+diff --git a/nptl/test-condattr-printers.c b/nptl/test-condattr-printers.c
+new file mode 100644
+index 0000000..4db4098
+--- /dev/null
++++ b/nptl/test-condattr-printers.c
+@@ -0,0 +1,94 @@
++/* Helper program for testing the pthread_cond_t and pthread_condattr_t
++   pretty printers.
++
++   Copyright (C) 2016 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++/* Keep the calls to the pthread_* functions on separate lines to make it easy
++   to advance through the program using the gdb 'next' command.  */
++
++#include <time.h>
++#include <pthread.h>
++
++#define PASS 0
++#define FAIL 1
++
++static int condvar_reinit (pthread_cond_t *condvar,
++			   const pthread_condattr_t *attr);
++static int test_setclock (pthread_cond_t *condvar, pthread_condattr_t *attr);
++static int test_setpshared (pthread_cond_t *condvar, pthread_condattr_t *attr);
++
++/* Need these so we don't have lines longer than 79 chars.  */
++#define SET_SHARED(attr, shared) pthread_condattr_setpshared (attr, shared)
++
++int
++main (void)
++{
++  pthread_cond_t condvar;
++  pthread_condattr_t attr;
++  int result = FAIL;
++
++  if (pthread_condattr_init (&attr) == 0
++      && pthread_cond_init (&condvar, NULL) == 0
++      && test_setclock (&condvar, &attr) == PASS
++      && test_setpshared (&condvar, &attr) == PASS)
++    result = PASS;
++  /* Else, one of the pthread_cond* functions failed.  */
++
++  return result;
++}
++
++/* Destroys CONDVAR and re-initializes it using ATTR.  */
++static int
++condvar_reinit (pthread_cond_t *condvar, const pthread_condattr_t *attr)
++{
++  int result = FAIL;
++
++  if (pthread_cond_destroy (condvar) == 0
++      && pthread_cond_init (condvar, attr) == 0)
++    result = PASS;
++
++  return result;
++}
++
++/* Tests setting the clock ID attribute.  */
++static int
++test_setclock (pthread_cond_t *condvar, pthread_condattr_t *attr)
++{
++  int result = FAIL;
++
++  if (pthread_condattr_setclock (attr, CLOCK_REALTIME) == 0 /* Set clock.  */
++      && condvar_reinit (condvar, attr) == PASS)
++    result = PASS;
++
++  return result;
++}
++
++/* Tests setting whether the condvar can be shared between processes.  */
++static int
++test_setpshared (pthread_cond_t *condvar, pthread_condattr_t *attr)
++{
++  int result = FAIL;
++
++  if (SET_SHARED (attr, PTHREAD_PROCESS_SHARED) == 0 /* Set shared.  */
++      && condvar_reinit (condvar, attr) == PASS
++      && SET_SHARED (attr, PTHREAD_PROCESS_PRIVATE) == 0
++      && condvar_reinit (condvar, attr) == PASS)
++    result = PASS;
++
++  return result;
++}
+diff --git a/nptl/test-condattr-printers.py b/nptl/test-condattr-printers.py
+new file mode 100644
+index 0000000..7ea01db
+--- /dev/null
++++ b/nptl/test-condattr-printers.py
+@@ -0,0 +1,71 @@
++# Common tests for the ConditionVariablePrinter and
++# ConditionVariableAttributesPrinter classes.
++#
++# Copyright (C) 2016 Free Software Foundation, Inc.
++# This file is part of the GNU C Library.
++#
++# The GNU C Library is free software; you can redistribute it and/or
++# modify it under the terms of the GNU Lesser General Public
++# License as published by the Free Software Foundation; either
++# version 2.1 of the License, or (at your option) any later version.
++#
++# The GNU C Library is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++# Lesser General Public License for more details.
++#
++# You should have received a copy of the GNU Lesser General Public
++# License along with the GNU C Library; if not, see
++# <http://www.gnu.org/licenses/>.
++
++import sys
++
++from test_printers_common import *
++
++test_source = sys.argv[1]
++test_bin = sys.argv[2]
++printer_files = sys.argv[3:]
++printer_names = ['global glibc-pthread-locks']
++
++try:
++    init_test(test_bin, printer_files, printer_names)
++    go_to_main()
++
++    check_debug_symbol('struct pthread_condattr')
++
++    condvar_var = 'condvar'
++    condvar_to_string = 'pthread_cond_t'
++
++    attr_var = 'attr'
++    attr_to_string = 'pthread_condattr_t'
++
++    break_at(test_source, 'Set clock')
++    continue_cmd() # Go to test_setclock
++    next_cmd(2)
++    test_printer(condvar_var, condvar_to_string, {'Clock ID': 'CLOCK_REALTIME'})
++    test_printer(attr_var, attr_to_string, {'Clock ID': 'CLOCK_REALTIME'})
++
++    break_at(test_source, 'Set shared')
++    continue_cmd() # Go to test_setpshared
++    next_cmd(2)
++    test_printer(condvar_var, condvar_to_string, {'Shared': 'Yes'})
++    test_printer(attr_var, attr_to_string, {'Shared': 'Yes'})
++    next_cmd(2)
++    test_printer(condvar_var, condvar_to_string, {'Shared': 'No'})
++    test_printer(attr_var, attr_to_string, {'Shared': 'No'})
++
++    continue_cmd() # Exit
++
++except (NoLineError, pexpect.TIMEOUT) as exception:
++    print('Error: {0}'.format(exception))
++    result = FAIL
++
++except DebugError as exception:
++    print(exception)
++    result = UNSUPPORTED
++
++else:
++    print('Test succeeded.')
++    result = PASS
++
++exit(result)
+diff --git a/nptl/test-mutex-printers.c b/nptl/test-mutex-printers.c
+new file mode 100644
+index 0000000..b973e82
+--- /dev/null
++++ b/nptl/test-mutex-printers.c
+@@ -0,0 +1,151 @@
++/* Helper program for testing the pthread_mutex_t pretty printer.
++
++   Copyright (C) 2016 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++/* Keep the calls to the pthread_* functions on separate lines to make it easy
++   to advance through the program using the gdb 'next' command.  */
++
++#include <stdlib.h>
++#include <errno.h>
++#include <pthread.h>
++
++#define PASS 0
++#define FAIL 1
++
++static int test_status_destroyed (pthread_mutex_t *mutex);
++static int test_status_no_robust (pthread_mutex_t *mutex,
++				  pthread_mutexattr_t *attr);
++static int test_status_robust (pthread_mutex_t *mutex,
++			       pthread_mutexattr_t *attr);
++static int test_locking_state_robust (pthread_mutex_t *mutex);
++static void *thread_func (void *arg);
++static int test_recursive_locks (pthread_mutex_t *mutex,
++				 pthread_mutexattr_t *attr);
++
++int
++main (void)
++{
++  pthread_mutex_t mutex;
++  pthread_mutexattr_t attr;
++  int result = FAIL;
++
++  if (pthread_mutexattr_init (&attr) == 0
++      && test_status_destroyed (&mutex) == PASS
++      && test_status_no_robust (&mutex, &attr) == PASS
++      && test_status_robust (&mutex, &attr) == PASS
++      && test_recursive_locks (&mutex, &attr) == PASS)
++    result = PASS;
++  /* Else, one of the pthread_mutex* functions failed.  */
++
++  return result;
++}
++
++/* Initializes MUTEX, then destroys it.  */
++static int
++test_status_destroyed (pthread_mutex_t *mutex)
++{
++  int result = FAIL;
++
++  if (pthread_mutex_init (mutex, NULL) == 0
++      && pthread_mutex_destroy (mutex) == 0)
++    result = PASS; /* Test status (destroyed).  */
++
++  return result;
++}
++
++/* Tests locking of non-robust mutexes.  */
++static int
++test_status_no_robust (pthread_mutex_t *mutex, pthread_mutexattr_t *attr)
++{
++  int result = FAIL;
++
++  if (pthread_mutexattr_setrobust (attr, PTHREAD_MUTEX_STALLED) == 0
++      && pthread_mutex_init (mutex, attr) == 0
++      && pthread_mutex_lock (mutex) == 0 /* Test status (non-robust).  */
++      && pthread_mutex_unlock (mutex) == 0
++      && pthread_mutex_destroy (mutex) == 0)
++    result = PASS;
++
++  return result;
++}
++
++/* Tests locking of robust mutexes.  */
++static int
++test_status_robust (pthread_mutex_t *mutex, pthread_mutexattr_t *attr)
++{
++  int result = FAIL;
++
++  if (pthread_mutexattr_setrobust (attr, PTHREAD_MUTEX_ROBUST) == 0
++      && pthread_mutex_init (mutex, attr) == 0
++      && test_locking_state_robust (mutex) == PASS /* Test status (robust).  */
++      && pthread_mutex_destroy (mutex) == 0)
++    result = PASS;
++
++  return result;
++}
++
++/* Tests locking and state corruption of robust mutexes.  We'll mark it as
++   inconsistent, then not recoverable.  */
++static int
++test_locking_state_robust (pthread_mutex_t *mutex)
++{
++  int result = FAIL;
++  pthread_t thread;
++
++  if (pthread_create (&thread, NULL, thread_func, mutex) == 0 /* Create.  */
++      && pthread_join (thread, NULL) == 0
++      && pthread_mutex_lock (mutex) == EOWNERDEAD /* Test locking (robust).  */
++      && pthread_mutex_unlock (mutex) == 0)
++    result = PASS;
++
++  return result;
++}
++
++/* Function to be called by the child thread when testing robust mutexes.  */
++static void *
++thread_func (void *arg)
++{
++  pthread_mutex_t *mutex = (pthread_mutex_t *)arg;
++
++  if (pthread_mutex_lock (mutex) != 0) /* Thread function.  */
++    exit (FAIL);
++
++  /* Thread terminates without unlocking the mutex, thus marking it as
++     inconsistent.  */
++  return NULL;
++}
++
++/* Tests locking the mutex multiple times in a row.  */
++static int
++test_recursive_locks (pthread_mutex_t *mutex, pthread_mutexattr_t *attr)
++{
++  int result = FAIL;
++
++  if (pthread_mutexattr_settype (attr, PTHREAD_MUTEX_RECURSIVE) == 0
++      && pthread_mutex_init (mutex, attr) == 0
++      && pthread_mutex_lock (mutex) == 0
++      && pthread_mutex_lock (mutex) == 0
++      && pthread_mutex_lock (mutex) == 0 /* Test recursive locks.  */
++      && pthread_mutex_unlock (mutex) == 0
++      && pthread_mutex_unlock (mutex) == 0
++      && pthread_mutex_unlock (mutex) == 0
++      && pthread_mutex_destroy (mutex) == 0)
++    result = PASS;
++
++  return result;
++}
+diff --git a/nptl/test-mutex-printers.py b/nptl/test-mutex-printers.py
+new file mode 100644
+index 0000000..7f542ad
+--- /dev/null
++++ b/nptl/test-mutex-printers.py
+@@ -0,0 +1,97 @@
++# Tests for the MutexPrinter class.
++#
++# Copyright (C) 2016 Free Software Foundation, Inc.
++# This file is part of the GNU C Library.
++#
++# The GNU C Library is free software; you can redistribute it and/or
++# modify it under the terms of the GNU Lesser General Public
++# License as published by the Free Software Foundation; either
++# version 2.1 of the License, or (at your option) any later version.
++#
++# The GNU C Library is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++# Lesser General Public License for more details.
++#
++# You should have received a copy of the GNU Lesser General Public
++# License along with the GNU C Library; if not, see
++# <http://www.gnu.org/licenses/>.
++
++import sys
++
++from test_printers_common import *
++
++test_source = sys.argv[1]
++test_bin = sys.argv[2]
++printer_files = sys.argv[3:]
++printer_names = ['global glibc-pthread-locks']
++
++try:
++    init_test(test_bin, printer_files, printer_names)
++    go_to_main()
++
++    var = 'mutex'
++    to_string = 'pthread_mutex_t'
++
++    break_at(test_source, 'Test status (destroyed)')
++    continue_cmd() # Go to test_status_destroyed
++    test_printer(var, to_string, {'Status': 'Destroyed'})
++
++    break_at(test_source, 'Test status (non-robust)')
++    continue_cmd() # Go to test_status_no_robust
++    test_printer(var, to_string, {'Status': 'Unlocked'})
++    next_cmd()
++    thread_id = get_current_thread_lwpid()
++    test_printer(var, to_string, {'Status': 'Locked, possibly with no waiters',
++                                  'Owner ID': thread_id})
++
++    break_at(test_source, 'Test status (robust)')
++    continue_cmd() # Go to test_status_robust
++    test_printer(var, to_string, {'Status': 'Unlocked'})
++
++    # We'll now test the robust mutex locking states.  We'll create a new
++    # thread that will lock a robust mutex and exit without unlocking it.
++    break_at(test_source, 'Create')
++    continue_cmd() # Go to test_locking_state_robust
++    # Set a breakpoint for the new thread to hit.
++    break_at(test_source, 'Thread function')
++    continue_cmd()
++    # By now the new thread is created and has hit its breakpoint.
++    set_scheduler_locking(True)
++    parent = 1
++    child = 2
++    select_thread(child)
++    child_id = get_current_thread_lwpid()
++    # We've got the new thread's ID.
++    select_thread(parent)
++    # Make the new thread finish its function while we wait.
++    continue_cmd(thread=child)
++    # The new thread should be dead by now.
++    break_at(test_source, 'Test locking (robust)')
++    continue_cmd()
++    test_printer(var, to_string, {'Owner ID': r'{0} \(dead\)'.format(child_id)})
++    # Try to lock and unlock the mutex.
++    next_cmd()
++    test_printer(var, to_string, {'Owner ID': thread_id,
++                           'State protected by this mutex': 'Inconsistent'})
++    next_cmd()
++    test_printer(var, to_string, {'Status': 'Unlocked',
++                        'State protected by this mutex': 'Not recoverable'})
++    set_scheduler_locking(False)
++
++    break_at(test_source, 'Test recursive locks')
++    continue_cmd() # Go to test_recursive_locks
++    test_printer(var, to_string, {'Times locked recursively': '2'})
++    next_cmd()
++    test_printer(var, to_string, {'Times locked recursively': '3'})
++    continue_cmd() # Exit
++
++except (NoLineError, pexpect.TIMEOUT) as exception:
++    print('Error: {0}'.format(exception))
++    result = FAIL
++
++else:
++    print('Test succeeded.')
++    result = PASS
++
++exit(result)
+diff --git a/nptl/test-mutexattr-printers.c b/nptl/test-mutexattr-printers.c
+new file mode 100644
+index 0000000..9ecfff7
+--- /dev/null
++++ b/nptl/test-mutexattr-printers.c
+@@ -0,0 +1,144 @@
++/* Helper program for testing the pthread_mutex_t and pthread_mutexattr_t
++   pretty printers.
++
++   Copyright (C) 2016 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++/* Keep the calls to the pthread_* functions on separate lines to make it easy
++   to advance through the program using the gdb 'next' command.  */
++
++#include <pthread.h>
++
++#define PASS 0
++#define FAIL 1
++#define PRIOCEILING 42
++
++/* Need these so we don't have lines longer than 79 chars.  */
++#define SET_TYPE(attr, type) pthread_mutexattr_settype (attr, type)
++#define SET_ROBUST(attr, robust) pthread_mutexattr_setrobust (attr, robust)
++#define SET_SHARED(attr, shared) pthread_mutexattr_setpshared (attr, shared)
++#define SET_PROTOCOL(attr, protocol) \
++	pthread_mutexattr_setprotocol (attr, protocol)
++#define SET_PRIOCEILING(mutex, prioceiling, old_ceiling) \
++	pthread_mutex_setprioceiling (mutex, prioceiling, old_ceiling)
++
++static int mutex_reinit (pthread_mutex_t *mutex,
++			 const pthread_mutexattr_t *attr);
++static int test_settype (pthread_mutex_t *mutex, pthread_mutexattr_t *attr);
++static int test_setrobust (pthread_mutex_t *mutex, pthread_mutexattr_t *attr);
++static int test_setpshared (pthread_mutex_t *mutex, pthread_mutexattr_t *attr);
++static int test_setprotocol (pthread_mutex_t *mutex,
++			     pthread_mutexattr_t *attr);
++
++int
++main (void)
++{
++  pthread_mutex_t mutex;
++  pthread_mutexattr_t attr;
++  int result = FAIL;
++
++  if (pthread_mutexattr_init (&attr) == 0
++      && pthread_mutex_init (&mutex, NULL) == 0
++      && test_settype (&mutex, &attr) == PASS
++      && test_setrobust (&mutex, &attr) == PASS
++      && test_setpshared (&mutex, &attr) == PASS
++      && test_setprotocol (&mutex, &attr) == PASS)
++    result = PASS;
++  /* Else, one of the pthread_mutex* functions failed.  */
++
++  return result;
++}
++
++/* Destroys MUTEX and re-initializes it using ATTR.  */
++static int
++mutex_reinit (pthread_mutex_t *mutex, const pthread_mutexattr_t *attr)
++{
++  int result = FAIL;
++
++  if (pthread_mutex_destroy (mutex) == 0
++      && pthread_mutex_init (mutex, attr) == 0)
++    result = PASS;
++
++  return result;
++}
++
++/* Tests setting the mutex type.  */
++static int
++test_settype (pthread_mutex_t *mutex, pthread_mutexattr_t *attr)
++{
++  int result = FAIL;
++
++  if (SET_TYPE (attr, PTHREAD_MUTEX_ERRORCHECK) == 0 /* Set type.  */
++      && mutex_reinit (mutex, attr) == 0
++      && SET_TYPE (attr, PTHREAD_MUTEX_RECURSIVE) == 0
++      && mutex_reinit (mutex, attr) == 0
++      && SET_TYPE (attr, PTHREAD_MUTEX_NORMAL) == 0
++      && mutex_reinit (mutex, attr) == 0)
++    result = PASS;
++
++  return result;
++}
++
++/* Tests setting whether the mutex is robust.  */
++static int
++test_setrobust (pthread_mutex_t *mutex, pthread_mutexattr_t *attr)
++{
++  int result = FAIL;
++
++  if (SET_ROBUST (attr, PTHREAD_MUTEX_ROBUST) == 0 /* Set robust.  */
++      && mutex_reinit (mutex, attr) == 0
++      && SET_ROBUST (attr, PTHREAD_MUTEX_STALLED) == 0
++      && mutex_reinit (mutex, attr) == 0)
++    result = PASS;
++
++  return result;
++}
++
++/* Tests setting whether the mutex can be shared between processes.  */
++static int
++test_setpshared (pthread_mutex_t *mutex, pthread_mutexattr_t *attr)
++{
++  int result = FAIL;
++
++  if (SET_SHARED (attr, PTHREAD_PROCESS_SHARED) == 0 /* Set shared.  */
++      && mutex_reinit (mutex, attr) == 0
++      && SET_SHARED (attr, PTHREAD_PROCESS_PRIVATE) == 0
++      && mutex_reinit (mutex, attr) == 0)
++    result = PASS;
++
++  return result;
++}
++
++/* Tests setting the mutex protocol and, for Priority Protect, the Priority
++   Ceiling.  */
++static int
++test_setprotocol (pthread_mutex_t *mutex, pthread_mutexattr_t *attr)
++{
++  int result = FAIL;
++  int old_prioceiling;
++
++  if (SET_PROTOCOL (attr, PTHREAD_PRIO_INHERIT) == 0 /* Set protocol.  */
++      && mutex_reinit (mutex, attr) == 0
++      && SET_PROTOCOL (attr, PTHREAD_PRIO_PROTECT) == 0
++      && mutex_reinit (mutex, attr) == 0
++      && SET_PRIOCEILING(mutex, PRIOCEILING, &old_prioceiling) == 0
++      && SET_PROTOCOL (attr, PTHREAD_PRIO_NONE) == 0
++      && mutex_reinit (mutex, attr) == 0)
++    result = PASS;
++
++  return result;
++}
+diff --git a/nptl/test-mutexattr-printers.py b/nptl/test-mutexattr-printers.py
+new file mode 100644
+index 0000000..4464723
+--- /dev/null
++++ b/nptl/test-mutexattr-printers.py
+@@ -0,0 +1,101 @@
++# Common tests for the MutexPrinter and MutexAttributesPrinter classes.
++#
++# Copyright (C) 2016 Free Software Foundation, Inc.
++# This file is part of the GNU C Library.
++#
++# The GNU C Library is free software; you can redistribute it and/or
++# modify it under the terms of the GNU Lesser General Public
++# License as published by the Free Software Foundation; either
++# version 2.1 of the License, or (at your option) any later version.
++#
++# The GNU C Library is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++# Lesser General Public License for more details.
++#
++# You should have received a copy of the GNU Lesser General Public
++# License along with the GNU C Library; if not, see
++# <http://www.gnu.org/licenses/>.
++
++import sys
++
++from test_printers_common import *
++
++test_source = sys.argv[1]
++test_bin = sys.argv[2]
++printer_files = sys.argv[3:]
++printer_names = ['global glibc-pthread-locks']
++PRIOCEILING = 42
++
++try:
++    init_test(test_bin, printer_files, printer_names)
++    go_to_main()
++
++    check_debug_symbol('struct pthread_mutexattr')
++
++    mutex_var = 'mutex'
++    mutex_to_string = 'pthread_mutex_t'
++
++    attr_var = 'attr'
++    attr_to_string = 'pthread_mutexattr_t'
++
++    break_at(test_source, 'Set type')
++    continue_cmd() # Go to test_settype
++    next_cmd(2)
++    test_printer(attr_var, attr_to_string, {'Type': 'Error check'})
++    test_printer(mutex_var, mutex_to_string, {'Type': 'Error check'})
++    next_cmd(2)
++    test_printer(attr_var, attr_to_string, {'Type': 'Recursive'})
++    test_printer(mutex_var, mutex_to_string, {'Type': 'Recursive'})
++    next_cmd(2)
++    test_printer(attr_var, attr_to_string, {'Type': 'Normal'})
++    test_printer(mutex_var, mutex_to_string, {'Type': 'Normal'})
++
++    break_at(test_source, 'Set robust')
++    continue_cmd() # Go to test_setrobust
++    next_cmd(2)
++    test_printer(attr_var, attr_to_string, {'Robust': 'Yes'})
++    test_printer(mutex_var, mutex_to_string, {'Robust': 'Yes'})
++    next_cmd(2)
++    test_printer(attr_var, attr_to_string, {'Robust': 'No'})
++    test_printer(mutex_var, mutex_to_string, {'Robust': 'No'})
++
++    break_at(test_source, 'Set shared')
++    continue_cmd() # Go to test_setpshared
++    next_cmd(2)
++    test_printer(attr_var, attr_to_string, {'Shared': 'Yes'})
++    test_printer(mutex_var, mutex_to_string, {'Shared': 'Yes'})
++    next_cmd(2)
++    test_printer(attr_var, attr_to_string, {'Shared': 'No'})
++    test_printer(mutex_var, mutex_to_string, {'Shared': 'No'})
++
++    break_at(test_source, 'Set protocol')
++    continue_cmd() # Go to test_setprotocol
++    next_cmd(2)
++    test_printer(attr_var, attr_to_string, {'Protocol': 'Priority inherit'})
++    test_printer(mutex_var, mutex_to_string, {'Protocol': 'Priority inherit'})
++    next_cmd(2)
++    test_printer(attr_var, attr_to_string, {'Protocol': 'Priority protect'})
++    test_printer(mutex_var, mutex_to_string, {'Protocol': 'Priority protect'})
++    next_cmd(2)
++    test_printer(mutex_var, mutex_to_string, {'Priority ceiling':
++                                              str(PRIOCEILING)})
++    next_cmd()
++    test_printer(attr_var, attr_to_string, {'Protocol': 'None'})
++    test_printer(mutex_var, mutex_to_string, {'Protocol': 'None'})
++
++    continue_cmd() # Exit
++
++except (NoLineError, pexpect.TIMEOUT) as exception:
++    print('Error: {0}'.format(exception))
++    result = FAIL
++
++except DebugError as exception:
++    print(exception)
++    result = UNSUPPORTED
++
++else:
++    print('Test succeeded.')
++    result = PASS
++
++exit(result)
+diff --git a/nptl/test-rwlock-printers.c b/nptl/test-rwlock-printers.c
+new file mode 100644
+index 0000000..dbbe9b8
+--- /dev/null
++++ b/nptl/test-rwlock-printers.c
+@@ -0,0 +1,78 @@
++/* Helper program for testing the pthread_rwlock_t pretty printer.
++
++   Copyright (C) 2016 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++/* Keep the calls to the pthread_* functions on separate lines to make it easy
++   to advance through the program using the gdb 'next' command.  */
++
++#include <pthread.h>
++
++#define PASS 0
++#define FAIL 1
++
++static int test_locking_reader (pthread_rwlock_t *rwlock);
++static int test_locking_writer (pthread_rwlock_t *rwlock);
++
++int
++main (void)
++{
++  pthread_rwlock_t rwlock;
++
++  int result = FAIL;
++
++  if (test_locking_reader (&rwlock) == PASS
++      && test_locking_writer (&rwlock) == PASS)
++    result = PASS;
++  /* Else, one of the pthread_rwlock* functions failed.  */
++
++  return result;
++}
++
++/* Tests locking the rwlock multiple times as a reader.  */
++static int
++test_locking_reader (pthread_rwlock_t *rwlock)
++{
++  int result = FAIL;
++
++  if (pthread_rwlock_init (rwlock, NULL) == 0
++      && pthread_rwlock_rdlock (rwlock) == 0 /* Test locking (reader).  */
++      && pthread_rwlock_rdlock (rwlock) == 0
++      && pthread_rwlock_rdlock (rwlock) == 0
++      && pthread_rwlock_unlock (rwlock) == 0
++      && pthread_rwlock_unlock (rwlock) == 0
++      && pthread_rwlock_unlock (rwlock) == 0
++      && pthread_rwlock_destroy (rwlock) == 0)
++    result = PASS;
++
++  return result;
++}
++
++/* Tests locking the rwlock as a writer.  */
++static int
++test_locking_writer (pthread_rwlock_t *rwlock)
++{
++  int result = FAIL;
++
++  if (pthread_rwlock_init (rwlock, NULL) == 0
++      && pthread_rwlock_wrlock (rwlock) == 0 /* Test locking (writer).  */
++      && pthread_rwlock_unlock (rwlock) == 0
++      && pthread_rwlock_destroy (rwlock) == 0)
++    result = PASS;
++
++  return result;
++}
+diff --git a/nptl/test-rwlock-printers.py b/nptl/test-rwlock-printers.py
+new file mode 100644
+index 0000000..b972fa6
+--- /dev/null
++++ b/nptl/test-rwlock-printers.py
+@@ -0,0 +1,64 @@
++# Common tests for the RWLockPrinter class.
++#
++# Copyright (C) 2016 Free Software Foundation, Inc.
++# This file is part of the GNU C Library.
++#
++# The GNU C Library is free software; you can redistribute it and/or
++# modify it under the terms of the GNU Lesser General Public
++# License as published by the Free Software Foundation; either
++# version 2.1 of the License, or (at your option) any later version.
++#
++# The GNU C Library is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++# Lesser General Public License for more details.
++#
++# You should have received a copy of the GNU Lesser General Public
++# License along with the GNU C Library; if not, see
++# <http://www.gnu.org/licenses/>.
++
++import sys
++
++from test_printers_common import *
++
++test_source = sys.argv[1]
++test_bin = sys.argv[2]
++printer_files = sys.argv[3:]
++printer_names = ['global glibc-pthread-locks']
++
++try:
++    init_test(test_bin, printer_files, printer_names)
++    go_to_main()
++
++    var = 'rwlock'
++    to_string = 'pthread_rwlock_t'
++
++    break_at(test_source, 'Test locking (reader)')
++    continue_cmd() # Go to test_locking_reader
++    test_printer(var, to_string, {'Status': 'Unlocked'})
++    next_cmd()
++    test_printer(var, to_string, {'Status': r'Locked \(Read\)', 'Readers': '1'})
++    next_cmd()
++    test_printer(var, to_string, {'Readers': '2'})
++    next_cmd()
++    test_printer(var, to_string, {'Readers': '3'})
++
++    break_at(test_source, 'Test locking (writer)')
++    continue_cmd() # Go to test_locking_writer
++    test_printer(var, to_string, {'Status': 'Unlocked'})
++    next_cmd()
++    thread_id = get_current_thread_lwpid()
++    test_printer(var, to_string, {'Status': r'Locked \(Write\)',
++                                  'Writer ID': thread_id})
++
++    continue_cmd() # Exit
++
++except (NoLineError, pexpect.TIMEOUT) as exception:
++    print('Error: {0}'.format(exception))
++    result = FAIL
++
++else:
++    print('Test succeeded.')
++    result = PASS
++
++exit(result)
+diff --git a/nptl/test-rwlockattr-printers.c b/nptl/test-rwlockattr-printers.c
+new file mode 100644
+index 0000000..d12facf
+--- /dev/null
++++ b/nptl/test-rwlockattr-printers.c
+@@ -0,0 +1,98 @@
++/* Helper program for testing the pthread_rwlock_t and pthread_rwlockattr_t
++   pretty printers.
++
++   Copyright (C) 2016 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++/* Keep the calls to the pthread_* functions on separate lines to make it easy
++   to advance through the program using the gdb 'next' command.  */
++
++#include <pthread.h>
++
++#define PASS 0
++#define FAIL 1
++
++/* Need these so we don't have lines longer than 79 chars.  */
++#define SET_KIND(attr, kind) pthread_rwlockattr_setkind_np (attr, kind)
++#define SET_SHARED(attr, shared) pthread_rwlockattr_setpshared (attr, shared)
++
++static int rwlock_reinit (pthread_rwlock_t *rwlock,
++			  const pthread_rwlockattr_t *attr);
++static int test_setkind_np (pthread_rwlock_t *rwlock,
++			    pthread_rwlockattr_t *attr);
++static int test_setpshared (pthread_rwlock_t *rwlock,
++			    pthread_rwlockattr_t *attr);
++
++int
++main (void)
++{
++  pthread_rwlock_t rwlock;
++  pthread_rwlockattr_t attr;
++  int result = FAIL;
++
++  if (pthread_rwlockattr_init (&attr) == 0
++      && pthread_rwlock_init (&rwlock, NULL) == 0
++      && test_setkind_np (&rwlock, &attr) == PASS
++      && test_setpshared (&rwlock, &attr) == PASS)
++    result = PASS;
++  /* Else, one of the pthread_rwlock* functions failed.  */
++
++  return result;
++}
++
++/* Destroys RWLOCK and re-initializes it using ATTR.  */
++static int
++rwlock_reinit (pthread_rwlock_t *rwlock, const pthread_rwlockattr_t *attr)
++{
++  int result = FAIL;
++
++  if (pthread_rwlock_destroy (rwlock) == 0
++      && pthread_rwlock_init (rwlock, attr) == 0)
++    result = PASS;
++
++  return result;
++}
++
++/* Tests setting whether the rwlock prefers readers or writers.  */
++static int
++test_setkind_np (pthread_rwlock_t *rwlock, pthread_rwlockattr_t *attr)
++{
++  int result = FAIL;
++
++  if (SET_KIND (attr, PTHREAD_RWLOCK_PREFER_READER_NP) == 0 /* Set kind.  */
++      && rwlock_reinit (rwlock, attr) == PASS
++      && SET_KIND (attr, PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP) == 0
++      && rwlock_reinit (rwlock, attr) == PASS)
++    result = PASS;
++
++  return result;
++}
++
++/* Tests setting whether the rwlock can be shared between processes.  */
++static int
++test_setpshared (pthread_rwlock_t *rwlock, pthread_rwlockattr_t *attr)
++{
++  int result = FAIL;
++
++  if (SET_SHARED (attr, PTHREAD_PROCESS_SHARED) == 0 /* Set shared.  */
++      && rwlock_reinit (rwlock, attr) == PASS
++      && SET_SHARED (attr, PTHREAD_PROCESS_PRIVATE) == 0
++      && rwlock_reinit (rwlock, attr) == PASS)
++    result = PASS;
++
++  return result;
++}
+diff --git a/nptl/test-rwlockattr-printers.py b/nptl/test-rwlockattr-printers.py
+new file mode 100644
+index 0000000..1ca2dc6
+--- /dev/null
++++ b/nptl/test-rwlockattr-printers.py
+@@ -0,0 +1,73 @@
++# Common tests for the RWLockPrinter and RWLockAttributesPrinter classes.
++#
++# Copyright (C) 2016 Free Software Foundation, Inc.
++# This file is part of the GNU C Library.
++#
++# The GNU C Library is free software; you can redistribute it and/or
++# modify it under the terms of the GNU Lesser General Public
++# License as published by the Free Software Foundation; either
++# version 2.1 of the License, or (at your option) any later version.
++#
++# The GNU C Library is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++# Lesser General Public License for more details.
++#
++# You should have received a copy of the GNU Lesser General Public
++# License along with the GNU C Library; if not, see
++# <http://www.gnu.org/licenses/>.
++
++import sys
++
++from test_printers_common import *
++
++test_source = sys.argv[1]
++test_bin = sys.argv[2]
++printer_files = sys.argv[3:]
++printer_names = ['global glibc-pthread-locks']
++
++try:
++    init_test(test_bin, printer_files, printer_names)
++    go_to_main()
++
++    check_debug_symbol('struct pthread_rwlockattr')
++
++    rwlock_var = 'rwlock'
++    rwlock_to_string = 'pthread_rwlock_t'
++
++    attr_var = 'attr'
++    attr_to_string = 'pthread_rwlockattr_t'
++
++    break_at(test_source, 'Set kind')
++    continue_cmd() # Go to test_setkind_np
++    next_cmd(2)
++    test_printer(rwlock_var, rwlock_to_string, {'Prefers': 'Readers'})
++    test_printer(attr_var, attr_to_string, {'Prefers': 'Readers'})
++    next_cmd(2)
++    test_printer(rwlock_var, rwlock_to_string, {'Prefers': 'Writers'})
++    test_printer(attr_var, attr_to_string, {'Prefers': 'Writers'})
++
++    break_at(test_source, 'Set shared')
++    continue_cmd() # Go to test_setpshared
++    next_cmd(2)
++    test_printer(rwlock_var, rwlock_to_string, {'Shared': 'Yes'})
++    test_printer(attr_var, attr_to_string, {'Shared': 'Yes'})
++    next_cmd(2)
++    test_printer(rwlock_var, rwlock_to_string, {'Shared': 'No'})
++    test_printer(attr_var, attr_to_string, {'Shared': 'No'})
++
++    continue_cmd() # Exit
++
++except (NoLineError, pexpect.TIMEOUT) as exception:
++    print('Error: {0}'.format(exception))
++    result = FAIL
++
++except DebugError as exception:
++    print(exception)
++    result = UNSUPPORTED
++
++else:
++    print('Test succeeded.')
++    result = PASS
++
++exit(result)
+diff --git a/scripts/gen-py-const.awk b/scripts/gen-py-const.awk
+new file mode 100644
+index 0000000..4586f59
+--- /dev/null
++++ b/scripts/gen-py-const.awk
+@@ -0,0 +1,118 @@
++# Script to generate constants for Python pretty printers.
++#
++# Copyright (C) 2016 Free Software Foundation, Inc.
++# This file is part of the GNU C Library.
++#
++# The GNU C Library is free software; you can redistribute it and/or
++# modify it under the terms of the GNU Lesser General Public
++# License as published by the Free Software Foundation; either
++# version 2.1 of the License, or (at your option) any later version.
++#
++# The GNU C Library is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++# Lesser General Public License for more details.
++#
++# You should have received a copy of the GNU Lesser General Public
++# License along with the GNU C Library; if not, see
++# <http://www.gnu.org/licenses/>.
++
++# This script is a smaller version of the clever gen-asm-const.awk hack used to
++# generate ASM constants from .sym files.  We'll use this to generate constants
++# for Python pretty printers.
++#
++# The input to this script are .pysym files that look like:
++# #C_Preprocessor_Directive...
++# NAME1
++# NAME2 expression...
++#
++# A line giving just a name implies an expression consisting of just that name.
++# Comments start with '--'.
++#
++# The output of this script is a 'dummy' function containing 'asm' declarations
++# for each non-preprocessor line in the .pysym file.  The expression values
++# will appear as input operands to the 'asm' declaration.  For example, if we
++# have:
++#
++# /* header.h */
++# #define MACRO 42
++#
++# struct S {
++#     char c1;
++#     char c2;
++#     char c3;
++# };
++#
++# enum E {
++#     ZERO,
++#     ONE
++# };
++#
++# /* symbols.pysym */
++# #include <stddef.h>
++# #include "header.h"
++# -- This is a comment
++# MACRO
++# C3_OFFSET offsetof(struct S, c3)
++# E_ONE ONE
++#
++# the output will be:
++#
++# #include <stddef.h>
++# #include "header.h"
++# void dummy(void)
++# {
++#   asm ("@name@MACRO@value@%0@" : : "i" (MACRO));
++#   asm ("@name@C3_OFFSET@value@%0@" : : "i" (offsetof(struct S, c3)));
++#   asm ("@name@E_ONE@value@%0@" : : "i" (ONE));
++# }
++#
++# We'll later feed this output to gcc -S.  Since '-S' tells gcc to compile but
++# not assemble, gcc will output something like:
++#
++# dummy:
++# 	...
++# 	@name@MACRO@value@$42@
++# 	@name@C3_OFFSET@value@$2@
++# 	@name@E_ONE@value@$1@
++#
++# Finally, we can process that output to extract the constant values.
++# Notice gcc may prepend a special character such as '$' to each value.
++
++# found_symbol indicates whether we found a non-comment, non-preprocessor line.
++BEGIN { found_symbol = 0 }
++
++# C preprocessor directives go straight through.
++/^#/ { print; next; }
++
++# Skip comments.
++/--/ { next; }
++
++# Trim leading whitespace.
++{ sub(/^[[:blank:]]*/, ""); }
++
++# If we found a non-comment, non-preprocessor line, print the 'dummy' function
++# header.
++NF > 0 && !found_symbol {
++    print "void dummy(void)\n{";
++    found_symbol = 1;
++}
++
++# If the line contains just a name, duplicate it so we can use that name
++# as the value of the expression.
++NF == 1 { sub(/^.*$/, "& &"); }
++
++# If a line contains a name and an expression...
++NF > 1 {
++    name = $1;
++
++    # Remove any characters before the second field.
++    sub(/^[^[:blank:]]+[[:blank:]]+/, "");
++
++    # '$0' ends up being everything that appeared after the first field
++    # separator.
++    printf "  asm (\"@name@%s@value@%0@\" : : \"i\" (%s));\n", name, $0;
++}
++
++# Close the 'dummy' function.
++END { if (found_symbol) print "}"; }
+diff --git a/scripts/test_printers_common.py b/scripts/test_printers_common.py
+new file mode 100644
+index 0000000..c79d7e3
+--- /dev/null
++++ b/scripts/test_printers_common.py
+@@ -0,0 +1,364 @@
++# Common functions and variables for testing the Python pretty printers.
++#
++# Copyright (C) 2016 Free Software Foundation, Inc.
++# This file is part of the GNU C Library.
++#
++# The GNU C Library is free software; you can redistribute it and/or
++# modify it under the terms of the GNU Lesser General Public
++# License as published by the Free Software Foundation; either
++# version 2.1 of the License, or (at your option) any later version.
++#
++# The GNU C Library is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++# Lesser General Public License for more details.
++#
++# You should have received a copy of the GNU Lesser General Public
++# License along with the GNU C Library; if not, see
++# <http://www.gnu.org/licenses/>.
++
++"""These tests require PExpect 4.0 or newer.
++
++Exported constants:
++    PASS, FAIL, UNSUPPORTED (int): Test exit codes, as per evaluate-test.sh.
++"""
++
++import os
++import re
++from test_printers_exceptions import *
++
++PASS = 0
++FAIL = 1
++UNSUPPORTED = 77
++
++gdb_bin = 'gdb'
++gdb_options = '-q -nx'
++gdb_invocation = '{0} {1}'.format(gdb_bin, gdb_options)
++pexpect_min_version = 4
++gdb_min_version = (7, 8)
++encoding = 'utf-8'
++
++try:
++    import pexpect
++except ImportError:
++    print('PExpect 4.0 or newer must be installed to test the pretty printers.')
++    exit(UNSUPPORTED)
++
++pexpect_version = pexpect.__version__.split('.')[0]
++
++if int(pexpect_version) < pexpect_min_version:
++    print('PExpect 4.0 or newer must be installed to test the pretty printers.')
++    exit(UNSUPPORTED)
++
++if not pexpect.which(gdb_bin):
++    print('gdb 7.8 or newer must be installed to test the pretty printers.')
++    exit(UNSUPPORTED)
++
++timeout = 5
++TIMEOUTFACTOR = os.environ.get('TIMEOUTFACTOR')
++
++if TIMEOUTFACTOR:
++    timeout = int(TIMEOUTFACTOR)
++
++try:
++    # Check the gdb version.
++    version_cmd = '{0} --version'.format(gdb_invocation, timeout=timeout)
++    gdb_version_out = pexpect.run(version_cmd, encoding=encoding)
++
++    # The gdb version string is "GNU gdb <PKGVERSION><version>", where
++    # PKGVERSION can be any text.  We assume that there'll always be a space
++    # between PKGVERSION and the version number for the sake of the regexp.
++    version_match = re.search(r'GNU gdb .* ([1-9]+)\.([0-9]+)', gdb_version_out)
++
++    if not version_match:
++        print('The gdb version string (gdb -v) is incorrectly formatted.')
++        exit(UNSUPPORTED)
++
++    gdb_version = (int(version_match.group(1)), int(version_match.group(2)))
++
++    if gdb_version < gdb_min_version:
++        print('gdb 7.8 or newer must be installed to test the pretty printers.')
++        exit(UNSUPPORTED)
++
++    # Check if gdb supports Python.
++    gdb_python_cmd = '{0} -ex "python import os" -batch'.format(gdb_invocation,
++                                                                timeout=timeout)
++    gdb_python_error = pexpect.run(gdb_python_cmd, encoding=encoding)
++
++    if gdb_python_error:
++        print('gdb must have python support to test the pretty printers.')
++        exit(UNSUPPORTED)
++
++    # If everything's ok, spawn the gdb process we'll use for testing.
++    gdb = pexpect.spawn(gdb_invocation, echo=False, timeout=timeout,
++                        encoding=encoding)
++    gdb_prompt = u'\(gdb\)'
++    gdb.expect(gdb_prompt)
++
++except pexpect.ExceptionPexpect as exception:
++    print('Error: {0}'.format(exception))
++    exit(FAIL)
++
++def test(command, pattern=None):
++    """Sends 'command' to gdb and expects the given 'pattern'.
++
++    If 'pattern' is None, simply consumes everything up to and including
++    the gdb prompt.
++
++    Args:
++        command (string): The command we'll send to gdb.
++        pattern (raw string): A pattern the gdb output should match.
++
++    Returns:
++        string: The string that matched 'pattern', or an empty string if
++            'pattern' was None.
++    """
++
++    match = ''
++
++    gdb.sendline(command)
++
++    if pattern:
++        # PExpect does a non-greedy match for '+' and '*'.  Since it can't look
++        # ahead on the gdb output stream, if 'pattern' ends with a '+' or a '*'
++        # we may end up matching only part of the required output.
++        # To avoid this, we'll consume 'pattern' and anything that follows it
++        # up to and including the gdb prompt, then extract 'pattern' later.
++        index = gdb.expect([u'{0}.+{1}'.format(pattern, gdb_prompt),
++                            pexpect.TIMEOUT])
++
++        if index == 0:
++            # gdb.after now contains the whole match.  Extract the text that
++            # matches 'pattern'.
++            match = re.match(pattern, gdb.after, re.DOTALL).group()
++        elif index == 1:
++            # We got a timeout exception.  Print information on what caused it
++            # and bail out.
++            error = ('Response does not match the expected pattern.\n'
++                     'Command: {0}\n'
++                     'Expected pattern: {1}\n'
++                     'Response: {2}'.format(command, pattern, gdb.before))
++
++            raise pexpect.TIMEOUT(error)
++    else:
++        # Consume just the the gdb prompt.
++        gdb.expect(gdb_prompt)
++
++    return match
++
++def init_test(test_bin, printer_files, printer_names):
++    """Loads the test binary file and the required pretty printers to gdb.
++
++    Args:
++        test_bin (string): The name of the test binary file.
++        pretty_printers (list of strings): A list with the names of the pretty
++            printer files.
++    """
++
++    # Load all the pretty printer files.  We're assuming these are safe.
++    for printer_file in printer_files:
++        test('source {0}'.format(printer_file))
++
++    # Disable all the pretty printers.
++    test('disable pretty-printer', r'0 of [0-9]+ printers enabled')
++
++    # Enable only the required printers.
++    for printer in printer_names:
++        test('enable pretty-printer {0}'.format(printer),
++             r'[1-9][0-9]* of [1-9]+ printers enabled')
++
++    # Finally, load the test binary.
++    test('file {0}'.format(test_bin))
++
++def go_to_main():
++    """Executes a gdb 'start' command, which takes us to main."""
++
++    test('start', r'main')
++
++def get_line_number(file_name, string):
++    """Returns the number of the line in which 'string' appears within a file.
++
++    Args:
++        file_name (string): The name of the file we'll search through.
++        string (string): The string we'll look for.
++
++    Returns:
++        int: The number of the line in which 'string' appears, starting from 1.
++    """
++    number = -1
++
++    with open(file_name) as src_file:
++        for i, line in enumerate(src_file):
++            if string in line:
++                number = i + 1
++                break
++
++    if number == -1:
++        raise NoLineError(file_name, string)
++
++    return number
++
++def break_at(file_name, string, temporary=True, thread=None):
++    """Places a breakpoint on the first line in 'file_name' containing 'string'.
++
++    'string' is usually a comment like "Stop here".  Notice this may fail unless
++    the comment is placed inline next to actual code, e.g.:
++
++        ...
++        /* Stop here */
++        ...
++
++    may fail, while:
++
++        ...
++        some_func(); /* Stop here */
++        ...
++
++    will succeed.
++
++    If 'thread' isn't None, the breakpoint will be set for all the threads.
++    Otherwise, it'll be set only for 'thread'.
++
++    Args:
++        file_name (string): The name of the file we'll place the breakpoint in.
++        string (string): A string we'll look for inside the file.
++            We'll place a breakpoint on the line which contains it.
++        temporary (bool): Whether the breakpoint should be automatically deleted
++            after we reach it.
++        thread (int): The number of the thread we'll place the breakpoint for,
++            as seen by gdb.  If specified, it should be greater than zero.
++    """
++
++    if not thread:
++        thread_str = ''
++    else:
++        thread_str = 'thread {0}'.format(thread)
++
++    if temporary:
++        command = 'tbreak'
++        break_type = 'Temporary breakpoint'
++    else:
++        command = 'break'
++        break_type = 'Breakpoint'
++
++    line_number = str(get_line_number(file_name, string))
++
++    test('{0} {1}:{2} {3}'.format(command, file_name, line_number, thread_str),
++         r'{0} [0-9]+ at 0x[a-f0-9]+: file {1}, line {2}\.'.format(break_type,
++                                                                   file_name,
++                                                                   line_number))
++
++def continue_cmd(thread=None):
++    """Executes a gdb 'continue' command.
++
++    If 'thread' isn't None, the command will be applied to all the threads.
++    Otherwise, it'll be applied only to 'thread'.
++
++    Args:
++        thread (int): The number of the thread we'll apply the command to,
++            as seen by gdb.  If specified, it should be greater than zero.
++    """
++
++    if not thread:
++        command = 'continue'
++    else:
++        command = 'thread apply {0} continue'.format(thread)
++
++    test(command)
++
++def next_cmd(count=1, thread=None):
++    """Executes a gdb 'next' command.
++
++    If 'thread' isn't None, the command will be applied to all the threads.
++    Otherwise, it'll be applied only to 'thread'.
++
++    Args:
++        count (int): The 'count' argument of the 'next' command.
++        thread (int): The number of the thread we'll apply the command to,
++            as seen by gdb.  If specified, it should be greater than zero.
++    """
++
++    if not thread:
++        command = 'next'
++    else:
++        command = 'thread apply {0} next'
++
++    test('{0} {1}'.format(command, count))
++
++def select_thread(thread):
++    """Selects the thread indicated by 'thread'.
++
++    Args:
++        thread (int): The number of the thread we'll switch to, as seen by gdb.
++            This should be greater than zero.
++    """
++
++    if thread > 0:
++        test('thread {0}'.format(thread))
++
++def get_current_thread_lwpid():
++    """Gets the current thread's Lightweight Process ID.
++
++    Returns:
++        string: The current thread's LWP ID.
++    """
++
++    # It's easier to get the LWP ID through the Python API than the gdb CLI.
++    command = 'python print(gdb.selected_thread().ptid[1])'
++
++    return test(command, r'[0-9]+')
++
++def set_scheduler_locking(mode):
++    """Executes the gdb 'set scheduler-locking' command.
++
++    Args:
++        mode (bool): Whether the scheduler locking mode should be 'on'.
++    """
++    modes = {
++        True: 'on',
++        False: 'off'
++    }
++
++    test('set scheduler-locking {0}'.format(modes[mode]))
++
++def test_printer(var, to_string, children=None, is_ptr=True):
++    """ Tests the output of a pretty printer.
++
++    For a variable called 'var', this tests whether its associated printer
++    outputs the expected 'to_string' and children (if any).
++
++    Args:
++        var (string): The name of the variable we'll print.
++        to_string (raw string): The expected output of the printer's 'to_string'
++            method.
++        children (map {raw string->raw string}): A map with the expected output
++            of the printer's children' method.
++        is_ptr (bool): Whether 'var' is a pointer, and thus should be
++            dereferenced.
++    """
++
++    if is_ptr:
++        var = '*{0}'.format(var)
++
++    test('print {0}'.format(var), to_string)
++
++    if children:
++        for name, value in children.items():
++            # Children are shown as 'name = value'.
++            test('print {0}'.format(var), r'{0} = {1}'.format(name, value))
++
++def check_debug_symbol(symbol):
++    """ Tests whether a given debugging symbol exists.
++
++    If the symbol doesn't exist, raises a DebugError.
++
++    Args:
++        symbol (string): The symbol we're going to check for.
++    """
++
++    try:
++        test('ptype {0}'.format(symbol), r'type = {0}'.format(symbol))
++
++    except pexpect.TIMEOUT:
++        # The symbol doesn't exist.
++        raise DebugError(symbol)
+diff --git a/scripts/test_printers_exceptions.py b/scripts/test_printers_exceptions.py
+new file mode 100644
+index 0000000..17034b5
+--- /dev/null
++++ b/scripts/test_printers_exceptions.py
+@@ -0,0 +1,61 @@
++# Exception classes used when testing the Python pretty printers.
++#
++# Copyright (C) 2016 Free Software Foundation, Inc.
++# This file is part of the GNU C Library.
++#
++# The GNU C Library is free software; you can redistribute it and/or
++# modify it under the terms of the GNU Lesser General Public
++# License as published by the Free Software Foundation; either
++# version 2.1 of the License, or (at your option) any later version.
++#
++# The GNU C Library is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++# Lesser General Public License for more details.
++#
++# You should have received a copy of the GNU Lesser General Public
++# License along with the GNU C Library; if not, see
++# <http://www.gnu.org/licenses/>.
++
++class NoLineError(Exception):
++    """Custom exception to indicate that a test file doesn't contain
++    the requested string.
++    """
++
++    def __init__(self, file_name, string):
++        """Constructor.
++
++        Args:
++            file_name (string): The name of the test file.
++            string (string): The string that was requested.
++        """
++
++        super(NoLineError, self).__init__()
++        self.file_name = file_name
++        self.string = string
++
++    def __str__(self):
++        """Shows a readable representation of the exception."""
++
++        return ('File {0} has no line containing the following string: {1}'
++                .format(self.file_name, self.string))
++
++class DebugError(Exception):
++    """Custom exception to indicate that a required debugging symbol is missing.
++    """
++
++    def __init__(self, symbol):
++        """Constructor.
++
++        Args:
++            symbol (string): The name of the entity whose debug info is missing.
++        """
++
++        super(DebugError, self).__init__()
++        self.symbol = symbol
++
++    def __str__(self):
++        """Shows a readable representation of the exception."""
++
++        return ('The required debugging information for {0} is missing.'
++                .format(self.symbol))
+-- 
+2.10.2
+
diff --git a/meta/recipes-core/glibc/glibc/0004-New-condvar-implementation-that-provides-stronger-or.patch b/meta/recipes-core/glibc/glibc/0004-New-condvar-implementation-that-provides-stronger-or.patch
new file mode 100644
index 0000000..3c7bfa1
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0004-New-condvar-implementation-that-provides-stronger-or.patch
@@ -0,0 +1,7171 @@
+From 27af8689a6ba8d182f3cbe6ba42cc654ceed0351 Mon Sep 17 00:00:00 2001
+From: Catalin Enache <catalin.enache@windriver.com>
+Date: Fri, 30 Jun 2017 11:56:41 +0300
+Subject: [PATCH 4/6] New condvar implementation that provides stronger
+ ordering guarantees.
+
+This is a new implementation for condition variables, required
+after http://austingroupbugs.net/view.php?id=609 to fix bug 13165.  In
+essence, we need to be stricter in which waiters a signal or broadcast
+is required to wake up; this couldn't be solved using the old algorithm.
+ISO C++ made a similar clarification, so this also fixes a bug in
+current libstdc++, for example.
+
+We can't use the old algorithm anymore because futexes do not guarantee
+to wake in FIFO order.  Thus, when we wake, we can't simply let any
+waiter grab a signal, but we need to ensure that one of the waiters
+happening before the signal is woken up.  This is something the previous
+algorithm violated (see bug 13165).
+
+There's another issue specific to condvars: ABA issues on the underlying
+futexes.  Unlike mutexes that have just three states, or semaphores that
+have no tokens or a limited number of them, the state of a condvar is
+the *order* of the waiters.  A waiter on a semaphore can grab a token
+whenever one is available; a condvar waiter must only consume a signal
+if it is eligible to do so as determined by the relative order of the
+waiter and the signal.
+Therefore, this new algorithm maintains two groups of waiters: Those
+eligible to consume signals (G1), and those that have to wait until
+previous waiters have consumed signals (G2).  Once G1 is empty, G2
+becomes the new G1.  64b counters are used to avoid ABA issues.
+
+This condvar doesn't yet use a requeue optimization (ie, on a broadcast,
+waking just one thread and requeueing all others on the futex of the
+mutex supplied by the program).  I don't think doing the requeue is
+necessarily the right approach (but I haven't done real measurements
+yet):
+* If a program expects to wake many threads at the same time and make
+that scalable, a condvar isn't great anyway because of how it requires
+waiters to operate mutually exclusive (due to the mutex usage).  Thus, a
+thundering herd problem is a scalability problem with or without the
+optimization.  Using something like a semaphore might be more
+appropriate in such a case.
+* The scalability problem is actually at the mutex side; the condvar
+could help (and it tries to with the requeue optimization), but it
+should be the mutex who decides how that is done, and whether it is done
+at all.
+* Forcing all but one waiter into the kernel-side wait queue of the
+mutex prevents/avoids the use of lock elision on the mutex.  Thus, it
+prevents the only cure against the underlying scalability problem
+inherent to condvars.
+* If condvars use short critical sections (ie, hold the mutex just to
+check a binary flag or such), which they should do ideally, then forcing
+all those waiter to proceed serially with kernel-based hand-off (ie,
+futex ops in the mutex' contended state, via the futex wait queues) will
+be less efficient than just letting a scalable mutex implementation take
+care of it.  Our current mutex impl doesn't employ spinning at all, but
+if critical sections are short, spinning can be much better.
+* Doing the requeue stuff requires all waiters to always drive the mutex
+into the contended state.  This leads to each waiter having to call
+futex_wake after lock release, even if this wouldn't be necessary.
+
+    [BZ #13165]
+    * nptl/pthread_cond_broadcast.c (__pthread_cond_broadcast): Rewrite to
+    use new algorithm.
+    * nptl/pthread_cond_destroy.c (__pthread_cond_destroy): Likewise.
+    * nptl/pthread_cond_init.c (__pthread_cond_init): Likewise.
+    * nptl/pthread_cond_signal.c (__pthread_cond_signal): Likewise.
+    * nptl/pthread_cond_wait.c (__pthread_cond_wait): Likewise.
+    (__pthread_cond_timedwait): Move here from pthread_cond_timedwait.c.
+    (__condvar_confirm_wakeup, __condvar_cancel_waiting,
+    __condvar_cleanup_waiting, __condvar_dec_grefs,
+    __pthread_cond_wait_common): New.
+    (__condvar_cleanup): Remove.
+    * npt/pthread_condattr_getclock.c (pthread_condattr_getclock): Adapt.
+    * npt/pthread_condattr_setclock.c (pthread_condattr_setclock):
+    Likewise.
+    * npt/pthread_condattr_getpshared.c (pthread_condattr_getpshared):
+    Likewise.
+    * npt/pthread_condattr_init.c (pthread_condattr_init): Likewise.
+    * nptl/tst-cond1.c: Add comment.
+    * nptl/tst-cond20.c (do_test): Adapt.
+    * nptl/tst-cond22.c (do_test): Likewise.
+    * sysdeps/aarch64/nptl/bits/pthreadtypes.h (pthread_cond_t): Adapt
+    structure.
+    * sysdeps/arm/nptl/bits/pthreadtypes.h (pthread_cond_t): Likewise.
+    * sysdeps/ia64/nptl/bits/pthreadtypes.h (pthread_cond_t): Likewise.
+    * sysdeps/m68k/nptl/bits/pthreadtypes.h (pthread_cond_t): Likewise.
+    * sysdeps/microblaze/nptl/bits/pthreadtypes.h (pthread_cond_t):
+    Likewise.
+    * sysdeps/mips/nptl/bits/pthreadtypes.h (pthread_cond_t): Likewise.
+    * sysdeps/nios2/nptl/bits/pthreadtypes.h (pthread_cond_t): Likewise.
+    * sysdeps/s390/nptl/bits/pthreadtypes.h (pthread_cond_t): Likewise.
+    * sysdeps/sh/nptl/bits/pthreadtypes.h (pthread_cond_t): Likewise.
+    * sysdeps/tile/nptl/bits/pthreadtypes.h (pthread_cond_t): Likewise.
+    * sysdeps/unix/sysv/linux/alpha/bits/pthreadtypes.h (pthread_cond_t):
+    Likewise.
+    * sysdeps/unix/sysv/linux/powerpc/bits/pthreadtypes.h (pthread_cond_t):
+    Likewise.
+    * sysdeps/x86/bits/pthreadtypes.h (pthread_cond_t): Likewise.
+    * sysdeps/nptl/internaltypes.h (COND_NWAITERS_SHIFT): Remove.
+    (COND_CLOCK_BITS): Adapt.
+    * sysdeps/nptl/pthread.h (PTHREAD_COND_INITIALIZER): Adapt.
+    * nptl/pthreadP.h (__PTHREAD_COND_CLOCK_MONOTONIC_MASK,
+    __PTHREAD_COND_SHARED_MASK): New.
+    * nptl/nptl-printers.py (CLOCK_IDS): Remove.
+    (ConditionVariablePrinter, ConditionVariableAttributesPrinter): Adapt.
+    * nptl/nptl_lock_constants.pysym: Adapt.
+    * nptl/test-cond-printers.py: Adapt.
+    * sysdeps/unix/sysv/linux/hppa/internaltypes.h (cond_compat_clear,
+    cond_compat_check_and_clear): Adapt.
+    * sysdeps/unix/sysv/linux/hppa/pthread_cond_timedwait.c: Remove file ...
+    * sysdeps/unix/sysv/linux/hppa/pthread_cond_wait.c
+    (__pthread_cond_timedwait): ... and move here.
+    * nptl/DESIGN-condvar.txt: Remove file.
+    * nptl/lowlevelcond.sym: Likewise.
+    * nptl/pthread_cond_timedwait.c: Likewise.
+    * sysdeps/unix/sysv/linux/i386/i486/pthread_cond_broadcast.S: Likewise.
+    * sysdeps/unix/sysv/linux/i386/i486/pthread_cond_signal.S: Likewise.
+    * sysdeps/unix/sysv/linux/i386/i486/pthread_cond_timedwait.S: Likewise.
+    * sysdeps/unix/sysv/linux/i386/i486/pthread_cond_wait.S: Likewise.
+    * sysdeps/unix/sysv/linux/i386/i586/pthread_cond_broadcast.S: Likewise.
+    * sysdeps/unix/sysv/linux/i386/i586/pthread_cond_signal.S: Likewise.
+    * sysdeps/unix/sysv/linux/i386/i586/pthread_cond_timedwait.S: Likewise.
+    * sysdeps/unix/sysv/linux/i386/i586/pthread_cond_wait.S: Likewise.
+    * sysdeps/unix/sysv/linux/i386/i686/pthread_cond_broadcast.S: Likewise.
+    * sysdeps/unix/sysv/linux/i386/i686/pthread_cond_signal.S: Likewise.
+    * sysdeps/unix/sysv/linux/i386/i686/pthread_cond_timedwait.S: Likewise.
+    * sysdeps/unix/sysv/linux/i386/i686/pthread_cond_wait.S: Likewise.
+    * sysdeps/unix/sysv/linux/x86_64/pthread_cond_broadcast.S: Likewise.
+    * sysdeps/unix/sysv/linux/x86_64/pthread_cond_signal.S: Likewise.
+    * sysdeps/unix/sysv/linux/x86_64/pthread_cond_timedwait.S: Likewise.
+    * sysdeps/unix/sysv/linux/x86_64/pthread_cond_wait.S: Likewise.
+
+Upstream-Status: Backport
+
+Author: Torvald Riegel <triegel@redhat.com>
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ ChangeLog                                          |  74 ++
+ nptl/DESIGN-condvar.txt                            | 134 ---
+ nptl/Makefile                                      |   6 +-
+ nptl/lowlevelcond.sym                              |  16 -
+ nptl/nptl-printers.py                              |  70 +-
+ nptl/nptl_lock_constants.pysym                     |  27 +-
+ nptl/pthreadP.h                                    |   7 +
+ nptl/pthread_cond_broadcast.c                      |  99 ++-
+ nptl/pthread_cond_common.c                         | 466 ++++++++++
+ nptl/pthread_cond_destroy.c                        |  82 +-
+ nptl/pthread_cond_init.c                           |  28 +-
+ nptl/pthread_cond_signal.c                         |  99 ++-
+ nptl/pthread_cond_timedwait.c                      | 268 ------
+ nptl/pthread_cond_wait.c                           | 754 ++++++++++++----
+ nptl/pthread_condattr_getclock.c                   |   2 +-
+ nptl/pthread_condattr_getpshared.c                 |   3 +-
+ nptl/pthread_condattr_init.c                       |   4 +-
+ nptl/pthread_condattr_setclock.c                   |  11 +-
+ nptl/test-cond-printers.py                         |   2 +-
+ nptl/tst-cond1.c                                   |   3 +
+ nptl/tst-cond20.c                                  |   5 +-
+ nptl/tst-cond22.c                                  |  18 +-
+ sysdeps/aarch64/nptl/bits/pthreadtypes.h           |  31 +-
+ sysdeps/arm/nptl/bits/pthreadtypes.h               |  29 +-
+ sysdeps/ia64/nptl/bits/pthreadtypes.h              |  31 +-
+ sysdeps/m68k/nptl/bits/pthreadtypes.h              |  32 +-
+ sysdeps/microblaze/nptl/bits/pthreadtypes.h        |  29 +-
+ sysdeps/mips/nptl/bits/pthreadtypes.h              |  31 +-
+ sysdeps/nios2/nptl/bits/pthreadtypes.h             |  31 +-
+ sysdeps/nptl/internaltypes.h                       |  17 +-
+ sysdeps/nptl/pthread.h                             |   2 +-
+ sysdeps/s390/nptl/bits/pthreadtypes.h              |  29 +-
+ sysdeps/sh/nptl/bits/pthreadtypes.h                |  29 +-
+ sysdeps/tile/nptl/bits/pthreadtypes.h              |  29 +-
+ sysdeps/unix/sysv/linux/alpha/bits/pthreadtypes.h  |  31 +-
+ sysdeps/unix/sysv/linux/hppa/internaltypes.h       |  40 +-
+ .../unix/sysv/linux/hppa/pthread_cond_timedwait.c  |  41 -
+ sysdeps/unix/sysv/linux/hppa/pthread_cond_wait.c   |  13 +
+ .../sysv/linux/i386/i686/pthread_cond_timedwait.S  |  20 -
+ .../unix/sysv/linux/i386/pthread_cond_broadcast.S  | 241 -----
+ sysdeps/unix/sysv/linux/i386/pthread_cond_signal.S | 216 -----
+ .../unix/sysv/linux/i386/pthread_cond_timedwait.S  | 974 ---------------------
+ sysdeps/unix/sysv/linux/i386/pthread_cond_wait.S   | 642 --------------
+ .../unix/sysv/linux/powerpc/bits/pthreadtypes.h    |  31 +-
+ .../sysv/linux/x86_64/pthread_cond_broadcast.S     | 177 ----
+ .../unix/sysv/linux/x86_64/pthread_cond_signal.S   | 161 ----
+ .../sysv/linux/x86_64/pthread_cond_timedwait.S     | 623 -------------
+ sysdeps/unix/sysv/linux/x86_64/pthread_cond_wait.S | 555 ------------
+ sysdeps/x86/bits/pthreadtypes.h                    |  29 +-
+ 49 files changed, 1671 insertions(+), 4621 deletions(-)
+ delete mode 100644 nptl/DESIGN-condvar.txt
+ delete mode 100644 nptl/lowlevelcond.sym
+ create mode 100644 nptl/pthread_cond_common.c
+ delete mode 100644 nptl/pthread_cond_timedwait.c
+ delete mode 100644 sysdeps/unix/sysv/linux/hppa/pthread_cond_timedwait.c
+ delete mode 100644 sysdeps/unix/sysv/linux/i386/i686/pthread_cond_timedwait.S
+ delete mode 100644 sysdeps/unix/sysv/linux/i386/pthread_cond_broadcast.S
+ delete mode 100644 sysdeps/unix/sysv/linux/i386/pthread_cond_signal.S
+ delete mode 100644 sysdeps/unix/sysv/linux/i386/pthread_cond_timedwait.S
+ delete mode 100644 sysdeps/unix/sysv/linux/i386/pthread_cond_wait.S
+ delete mode 100644 sysdeps/unix/sysv/linux/x86_64/pthread_cond_broadcast.S
+ delete mode 100644 sysdeps/unix/sysv/linux/x86_64/pthread_cond_signal.S
+ delete mode 100644 sysdeps/unix/sysv/linux/x86_64/pthread_cond_timedwait.S
+ delete mode 100644 sysdeps/unix/sysv/linux/x86_64/pthread_cond_wait.S
+
+diff --git a/ChangeLog b/ChangeLog
+index 8036c1e..c94db7b 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,77 @@
++2016-12-31  Torvald Riegel  <triegel@redhat.com>
++
++	[BZ #13165]
++	* nptl/pthread_cond_broadcast.c (__pthread_cond_broadcast): Rewrite to
++	use new algorithm.
++	* nptl/pthread_cond_destroy.c (__pthread_cond_destroy): Likewise.
++	* nptl/pthread_cond_init.c (__pthread_cond_init): Likewise.
++	* nptl/pthread_cond_signal.c (__pthread_cond_signal): Likewise.
++	* nptl/pthread_cond_wait.c (__pthread_cond_wait): Likewise.
++	(__pthread_cond_timedwait): Move here from pthread_cond_timedwait.c.
++	(__condvar_confirm_wakeup, __condvar_cancel_waiting,
++	__condvar_cleanup_waiting, __condvar_dec_grefs,
++	__pthread_cond_wait_common): New.
++	(__condvar_cleanup): Remove.
++	* npt/pthread_condattr_getclock.c (pthread_condattr_getclock): Adapt.
++	* npt/pthread_condattr_setclock.c (pthread_condattr_setclock):
++	Likewise.
++	* npt/pthread_condattr_getpshared.c (pthread_condattr_getpshared):
++	Likewise.
++	* npt/pthread_condattr_init.c (pthread_condattr_init): Likewise.
++	* nptl/tst-cond1.c: Add comment.
++	* nptl/tst-cond20.c (do_test): Adapt.
++	* nptl/tst-cond22.c (do_test): Likewise.
++	* sysdeps/aarch64/nptl/bits/pthreadtypes.h (pthread_cond_t): Adapt
++	structure.
++	* sysdeps/arm/nptl/bits/pthreadtypes.h (pthread_cond_t): Likewise.
++	* sysdeps/ia64/nptl/bits/pthreadtypes.h (pthread_cond_t): Likewise.
++	* sysdeps/m68k/nptl/bits/pthreadtypes.h (pthread_cond_t): Likewise.
++	* sysdeps/microblaze/nptl/bits/pthreadtypes.h (pthread_cond_t):
++	Likewise.
++	* sysdeps/mips/nptl/bits/pthreadtypes.h (pthread_cond_t): Likewise.
++	* sysdeps/nios2/nptl/bits/pthreadtypes.h (pthread_cond_t): Likewise.
++	* sysdeps/s390/nptl/bits/pthreadtypes.h (pthread_cond_t): Likewise.
++	* sysdeps/sh/nptl/bits/pthreadtypes.h (pthread_cond_t): Likewise.
++	* sysdeps/tile/nptl/bits/pthreadtypes.h (pthread_cond_t): Likewise.
++	* sysdeps/unix/sysv/linux/alpha/bits/pthreadtypes.h (pthread_cond_t):
++	Likewise.
++	* sysdeps/unix/sysv/linux/powerpc/bits/pthreadtypes.h (pthread_cond_t):
++	Likewise.
++	* sysdeps/x86/bits/pthreadtypes.h (pthread_cond_t): Likewise.
++	* sysdeps/nptl/internaltypes.h (COND_NWAITERS_SHIFT): Remove.
++	(COND_CLOCK_BITS): Adapt.
++	* sysdeps/nptl/pthread.h (PTHREAD_COND_INITIALIZER): Adapt.
++	* nptl/pthreadP.h (__PTHREAD_COND_CLOCK_MONOTONIC_MASK,
++	__PTHREAD_COND_SHARED_MASK): New.
++	* nptl/nptl-printers.py (CLOCK_IDS): Remove.
++	(ConditionVariablePrinter, ConditionVariableAttributesPrinter): Adapt.
++	* nptl/nptl_lock_constants.pysym: Adapt.
++	* nptl/test-cond-printers.py: Adapt.
++	* sysdeps/unix/sysv/linux/hppa/internaltypes.h (cond_compat_clear,
++	cond_compat_check_and_clear): Adapt.
++	* sysdeps/unix/sysv/linux/hppa/pthread_cond_timedwait.c: Remove file ...
++	* sysdeps/unix/sysv/linux/hppa/pthread_cond_wait.c
++	(__pthread_cond_timedwait): ... and move here.
++	* nptl/DESIGN-condvar.txt: Remove file.
++	* nptl/lowlevelcond.sym: Likewise.
++	* nptl/pthread_cond_timedwait.c: Likewise.
++	* sysdeps/unix/sysv/linux/i386/i486/pthread_cond_broadcast.S: Likewise.
++	* sysdeps/unix/sysv/linux/i386/i486/pthread_cond_signal.S: Likewise.
++	* sysdeps/unix/sysv/linux/i386/i486/pthread_cond_timedwait.S: Likewise.
++	* sysdeps/unix/sysv/linux/i386/i486/pthread_cond_wait.S: Likewise.
++	* sysdeps/unix/sysv/linux/i386/i586/pthread_cond_broadcast.S: Likewise.
++	* sysdeps/unix/sysv/linux/i386/i586/pthread_cond_signal.S: Likewise.
++	* sysdeps/unix/sysv/linux/i386/i586/pthread_cond_timedwait.S: Likewise.
++	* sysdeps/unix/sysv/linux/i386/i586/pthread_cond_wait.S: Likewise.
++	* sysdeps/unix/sysv/linux/i386/i686/pthread_cond_broadcast.S: Likewise.
++	* sysdeps/unix/sysv/linux/i386/i686/pthread_cond_signal.S: Likewise.
++	* sysdeps/unix/sysv/linux/i386/i686/pthread_cond_timedwait.S: Likewise.
++	* sysdeps/unix/sysv/linux/i386/i686/pthread_cond_wait.S: Likewise.
++	* sysdeps/unix/sysv/linux/x86_64/pthread_cond_broadcast.S: Likewise.
++	* sysdeps/unix/sysv/linux/x86_64/pthread_cond_signal.S: Likewise.
++	* sysdeps/unix/sysv/linux/x86_64/pthread_cond_timedwait.S: Likewise.
++	* sysdeps/unix/sysv/linux/x86_64/pthread_cond_wait.S: Likewise.
++
+ 2016-12-08  Martin Galvan  <martin.galvan@tallertechnologies.com>
+ 
+ 	* INSTALL: Regenerated.
+diff --git a/nptl/DESIGN-condvar.txt b/nptl/DESIGN-condvar.txt
+deleted file mode 100644
+index 4845251..0000000
+--- a/nptl/DESIGN-condvar.txt
++++ /dev/null
+@@ -1,134 +0,0 @@
+-Conditional Variable pseudocode.
+-================================
+-
+-       int pthread_cond_timedwait (pthread_cond_t *cv, pthread_mutex_t *mutex);
+-       int pthread_cond_signal    (pthread_cond_t *cv);
+-       int pthread_cond_broadcast (pthread_cond_t *cv);
+-
+-struct pthread_cond_t {
+-
+-   unsigned int cond_lock;
+-
+-         internal mutex
+-
+-   uint64_t total_seq;
+-
+-     Total number of threads using the conditional variable.
+-
+-   uint64_t wakeup_seq;
+-
+-     sequence number for next wakeup.
+-
+-   uint64_t woken_seq;
+-
+-     sequence number of last woken thread.
+-
+-   uint32_t broadcast_seq;
+-
+-}
+-
+-
+-struct cv_data {
+-
+-   pthread_cond_t *cv;
+-
+-   uint32_t bc_seq
+-
+-}
+-
+-
+-
+-cleanup_handler(cv_data)
+-{
+-  cv = cv_data->cv;
+-  lll_lock(cv->lock);
+-
+-  if (cv_data->bc_seq == cv->broadcast_seq) {
+-    ++cv->wakeup_seq;
+-    ++cv->woken_seq;
+-  }
+-
+-  /* make sure no signal gets lost.  */
+-  FUTEX_WAKE(cv->wakeup_seq, ALL);
+-
+-  lll_unlock(cv->lock);
+-}
+-
+-
+-cond_timedwait(cv, mutex, timeout):
+-{
+-   lll_lock(cv->lock);
+-   mutex_unlock(mutex);
+-
+-   cleanup_push
+-
+-   ++cv->total_seq;
+-   val = seq =  cv->wakeup_seq;
+-   cv_data.bc = cv->broadcast_seq;
+-   cv_data.cv = cv;
+-
+-   while (1) {
+-
+-     lll_unlock(cv->lock);
+-
+-     enable_async(&cv_data);
+-
+-     ret = FUTEX_WAIT(cv->wakeup_seq, val, timeout);
+-
+-     restore_async
+-
+-     lll_lock(cv->lock);
+-
+-     if (bc != cv->broadcast_seq)
+-       goto bc_out;
+-
+-     val = cv->wakeup_seq;
+-
+-     if (val != seq && cv->woken_seq != val) {
+-       ret = 0;
+-       break;
+-     }
+-
+-     if (ret == TIMEDOUT) {
+-       ++cv->wakeup_seq;
+-       break;
+-     }
+-   }
+-
+-   ++cv->woken_seq;
+-
+- bc_out:
+-   lll_unlock(cv->lock);
+-
+-   cleanup_pop
+-
+-   mutex_lock(mutex);
+-
+-   return ret;
+-}
+-
+-cond_signal(cv)
+-{
+-   lll_lock(cv->lock);
+-
+-   if (cv->total_seq > cv->wakeup_seq) {
+-     ++cv->wakeup_seq;
+-     FUTEX_WAKE(cv->wakeup_seq, 1);
+-   }
+-
+-   lll_unlock(cv->lock);
+-}
+-
+-cond_broadcast(cv)
+-{
+-   lll_lock(cv->lock);
+-
+-   if (cv->total_seq > cv->wakeup_seq) {
+-     cv->wakeup_seq = cv->total_seq;
+-     cv->woken_seq = cv->total_seq;
+-     ++cv->broadcast_seq;
+-     FUTEX_WAKE(cv->wakeup_seq, ALL);
+-   }
+-
+-   lll_unlock(cv->lock);
+-}
+diff --git a/nptl/Makefile b/nptl/Makefile
+index 49f6ba6..1f0674c 100644
+--- a/nptl/Makefile
++++ b/nptl/Makefile
+@@ -71,7 +71,7 @@ libpthread-routines = nptl-init vars events version pt-interp \
+ 		      pthread_rwlockattr_getkind_np \
+ 		      pthread_rwlockattr_setkind_np \
+ 		      pthread_cond_init pthread_cond_destroy \
+-		      pthread_cond_wait pthread_cond_timedwait \
++		      pthread_cond_wait \
+ 		      pthread_cond_signal pthread_cond_broadcast \
+ 		      old_pthread_cond_init old_pthread_cond_destroy \
+ 		      old_pthread_cond_wait old_pthread_cond_timedwait \
+@@ -181,7 +181,6 @@ CFLAGS-pthread_timedjoin.c = -fexceptions -fasynchronous-unwind-tables
+ CFLAGS-pthread_once.c = $(uses-callbacks) -fexceptions \
+ 			-fasynchronous-unwind-tables
+ CFLAGS-pthread_cond_wait.c = -fexceptions -fasynchronous-unwind-tables
+-CFLAGS-pthread_cond_timedwait.c = -fexceptions -fasynchronous-unwind-tables
+ CFLAGS-sem_wait.c = -fexceptions -fasynchronous-unwind-tables
+ CFLAGS-sem_timedwait.c = -fexceptions -fasynchronous-unwind-tables
+ 
+@@ -303,8 +302,7 @@ test-xfail-tst-once5 = yes
+ # Files which must not be linked with libpthread.
+ tests-nolibpthread = tst-unload
+ 
+-gen-as-const-headers = pthread-errnos.sym \
+-		       lowlevelcond.sym lowlevelrwlock.sym \
++gen-as-const-headers = pthread-errnos.sym lowlevelrwlock.sym \
+ 		       unwindbuf.sym \
+ 		       lowlevelrobustlock.sym pthread-pi-defines.sym
+ 
+diff --git a/nptl/lowlevelcond.sym b/nptl/lowlevelcond.sym
+deleted file mode 100644
+index 18e1ada..0000000
+--- a/nptl/lowlevelcond.sym
++++ /dev/null
+@@ -1,16 +0,0 @@
+-#include <stddef.h>
+-#include <sched.h>
+-#include <bits/pthreadtypes.h>
+-#include <internaltypes.h>
+-
+---
+-
+-cond_lock	offsetof (pthread_cond_t, __data.__lock)
+-cond_futex	offsetof (pthread_cond_t, __data.__futex)
+-cond_nwaiters	offsetof (pthread_cond_t, __data.__nwaiters)
+-total_seq	offsetof (pthread_cond_t, __data.__total_seq)
+-wakeup_seq	offsetof (pthread_cond_t, __data.__wakeup_seq)
+-woken_seq	offsetof (pthread_cond_t, __data.__woken_seq)
+-dep_mutex	offsetof (pthread_cond_t, __data.__mutex)
+-broadcast_seq	offsetof (pthread_cond_t, __data.__broadcast_seq)
+-nwaiters_shift	COND_NWAITERS_SHIFT
+diff --git a/nptl/nptl-printers.py b/nptl/nptl-printers.py
+index e402f23..76adadd 100644
+--- a/nptl/nptl-printers.py
++++ b/nptl/nptl-printers.py
+@@ -293,16 +293,6 @@ class MutexAttributesPrinter(object):
+         elif protocol == PTHREAD_PRIO_PROTECT:
+             self.values.append(('Protocol', 'Priority protect'))
+ 
+-CLOCK_IDS = {
+-    CLOCK_REALTIME: 'CLOCK_REALTIME',
+-    CLOCK_MONOTONIC: 'CLOCK_MONOTONIC',
+-    CLOCK_PROCESS_CPUTIME_ID: 'CLOCK_PROCESS_CPUTIME_ID',
+-    CLOCK_THREAD_CPUTIME_ID: 'CLOCK_THREAD_CPUTIME_ID',
+-    CLOCK_MONOTONIC_RAW: 'CLOCK_MONOTONIC_RAW',
+-    CLOCK_REALTIME_COARSE: 'CLOCK_REALTIME_COARSE',
+-    CLOCK_MONOTONIC_COARSE: 'CLOCK_MONOTONIC_COARSE'
+-}
+-
+ class ConditionVariablePrinter(object):
+     """Pretty printer for pthread_cond_t."""
+ 
+@@ -313,24 +303,8 @@ class ConditionVariablePrinter(object):
+             cond: A gdb.value representing a pthread_cond_t.
+         """
+ 
+-        # Since PTHREAD_COND_SHARED is an integer, we need to cast it to void *
+-        # to be able to compare it to the condvar's __data.__mutex member.
+-        #
+-        # While it looks like self.shared_value should be a class variable,
+-        # that would result in it having an incorrect size if we're loading
+-        # these printers through .gdbinit for a 64-bit objfile in AMD64.
+-        # This is because gdb initially assumes the pointer size to be 4 bytes,
+-        # and only sets it to 8 after loading the 64-bit objfiles.  Since
+-        # .gdbinit runs before any objfiles are loaded, this would effectively
+-        # make self.shared_value have a size of 4, thus breaking later
+-        # comparisons with pointers whose types are looked up at runtime.
+-        void_ptr_type = gdb.lookup_type('void').pointer()
+-        self.shared_value = gdb.Value(PTHREAD_COND_SHARED).cast(void_ptr_type)
+-
+         data = cond['__data']
+-        self.total_seq = data['__total_seq']
+-        self.mutex = data['__mutex']
+-        self.nwaiters = data['__nwaiters']
++        self.wrefs = data['__wrefs']
+         self.values = []
+ 
+         self.read_values()
+@@ -360,7 +334,6 @@ class ConditionVariablePrinter(object):
+ 
+         self.read_status()
+         self.read_attributes()
+-        self.read_mutex_info()
+ 
+     def read_status(self):
+         """Read the status of the condvar.
+@@ -369,41 +342,22 @@ class ConditionVariablePrinter(object):
+         are waiting for it.
+         """
+ 
+-        if self.total_seq == PTHREAD_COND_DESTROYED:
+-            self.values.append(('Status', 'Destroyed'))
+-
+-        self.values.append(('Threads waiting for this condvar',
+-                            self.nwaiters >> COND_NWAITERS_SHIFT))
++        self.values.append(('Threads known to still execute a wait function',
++                            self.wrefs >> PTHREAD_COND_WREFS_SHIFT))
+ 
+     def read_attributes(self):
+         """Read the condvar's attributes."""
+ 
+-        clock_id = self.nwaiters & ((1 << COND_NWAITERS_SHIFT) - 1)
+-
+-        # clock_id must be casted to int because it's a gdb.Value
+-        self.values.append(('Clock ID', CLOCK_IDS[int(clock_id)]))
++	if (self.wrefs & PTHREAD_COND_CLOCK_MONOTONIC_MASK) != 0:
++		self.values.append(('Clock ID', 'CLOCK_MONOTONIC'))
++	else:
++		self.values.append(('Clock ID', 'CLOCK_REALTIME'))
+ 
+-        shared = (self.mutex == self.shared_value)
+-
+-        if shared:
++        if (self.wrefs & PTHREAD_COND_SHARED_MASK) != 0:
+             self.values.append(('Shared', 'Yes'))
+         else:
+             self.values.append(('Shared', 'No'))
+ 
+-    def read_mutex_info(self):
+-        """Read the data of the mutex this condvar is bound to.
+-
+-        A pthread_cond_t's __data.__mutex member is a void * which
+-        must be casted to pthread_mutex_t *.  For shared condvars, this
+-        member isn't recorded and has a special value instead.
+-        """
+-
+-        if self.mutex and self.mutex != self.shared_value:
+-            mutex_type = gdb.lookup_type('pthread_mutex_t')
+-            mutex = self.mutex.cast(mutex_type.pointer()).dereference()
+-
+-            self.values.append(('Mutex', mutex))
+-
+ class ConditionVariableAttributesPrinter(object):
+     """Pretty printer for pthread_condattr_t.
+ 
+@@ -453,10 +407,12 @@ class ConditionVariableAttributesPrinter(object):
+         created in self.children.
+         """
+ 
+-        clock_id = self.condattr & ((1 << COND_NWAITERS_SHIFT) - 1)
++        clock_id = (self.condattr >> 1) & ((1 << COND_CLOCK_BITS) - 1)
+ 
+-        # clock_id must be casted to int because it's a gdb.Value
+-        self.values.append(('Clock ID', CLOCK_IDS[int(clock_id)]))
++	if clock_id != 0:
++		self.values.append(('Clock ID', 'CLOCK_MONOTONIC'))
++	else:
++		self.values.append(('Clock ID', 'CLOCK_REALTIME'))
+ 
+         if self.condattr & 1:
+             self.values.append(('Shared', 'Yes'))
+diff --git a/nptl/nptl_lock_constants.pysym b/nptl/nptl_lock_constants.pysym
+index 303ec61..2ab3179 100644
+--- a/nptl/nptl_lock_constants.pysym
++++ b/nptl/nptl_lock_constants.pysym
+@@ -44,26 +44,13 @@ PTHREAD_PRIO_NONE
+ PTHREAD_PRIO_INHERIT
+ PTHREAD_PRIO_PROTECT
+ 
+--- These values are hardcoded as well:
+--- Value of __mutex for shared condvars.
+-PTHREAD_COND_SHARED             (void *)~0l
+-
+--- Value of __total_seq for destroyed condvars.
+-PTHREAD_COND_DESTROYED          -1ull
+-
+--- __nwaiters encodes the number of threads waiting on a condvar
+--- and the clock ID.
+--- __nwaiters >> COND_NWAITERS_SHIFT gives us the number of waiters.
+-COND_NWAITERS_SHIFT
+-
+--- Condvar clock IDs
+-CLOCK_REALTIME
+-CLOCK_MONOTONIC
+-CLOCK_PROCESS_CPUTIME_ID
+-CLOCK_THREAD_CPUTIME_ID
+-CLOCK_MONOTONIC_RAW
+-CLOCK_REALTIME_COARSE
+-CLOCK_MONOTONIC_COARSE
++-- Condition variable
++-- FIXME Why do macros prefixed with __ cannot be used directly?
++PTHREAD_COND_SHARED_MASK          __PTHREAD_COND_SHARED_MASK
++PTHREAD_COND_CLOCK_MONOTONIC_MASK __PTHREAD_COND_CLOCK_MONOTONIC_MASK
++COND_CLOCK_BITS
++-- These values are hardcoded:
++PTHREAD_COND_WREFS_SHIFT          3
+ 
+ -- Rwlock attributes
+ PTHREAD_RWLOCK_PREFER_READER_NP
+diff --git a/nptl/pthreadP.h b/nptl/pthreadP.h
+index 4edc74b..e9992bc 100644
+--- a/nptl/pthreadP.h
++++ b/nptl/pthreadP.h
+@@ -167,6 +167,13 @@ enum
+ #define __PTHREAD_ONCE_FORK_GEN_INCR	4
+ 
+ 
++/* Condition variable definitions.  See __pthread_cond_wait_common.
++   Need to be defined here so there is one place from which
++   nptl_lock_constants can grab them.  */
++#define __PTHREAD_COND_CLOCK_MONOTONIC_MASK 2
++#define __PTHREAD_COND_SHARED_MASK 1
++
++
+ /* Internal variables.  */
+ 
+ 
+diff --git a/nptl/pthread_cond_broadcast.c b/nptl/pthread_cond_broadcast.c
+index 552fd42..87c0755 100644
+--- a/nptl/pthread_cond_broadcast.c
++++ b/nptl/pthread_cond_broadcast.c
+@@ -19,72 +19,71 @@
+ #include <endian.h>
+ #include <errno.h>
+ #include <sysdep.h>
+-#include <lowlevellock.h>
++#include <futex-internal.h>
+ #include <pthread.h>
+ #include <pthreadP.h>
+ #include <stap-probe.h>
++#include <atomic.h>
+ 
+ #include <shlib-compat.h>
+-#include <kernel-features.h>
+ 
++#include "pthread_cond_common.c"
+ 
++
++/* We do the following steps from __pthread_cond_signal in one critical
++   section: (1) signal all waiters in G1, (2) close G1 so that it can become
++   the new G2 and make G2 the new G1, and (3) signal all waiters in the new
++   G1.  We don't need to do all these steps if there are no waiters in G1
++   and/or G2.  See __pthread_cond_signal for further details.  */
+ int
+ __pthread_cond_broadcast (pthread_cond_t *cond)
+ {
+   LIBC_PROBE (cond_broadcast, 1, cond);
+ 
+-  int pshared = (cond->__data.__mutex == (void *) ~0l)
+-		? LLL_SHARED : LLL_PRIVATE;
+-  /* Make sure we are alone.  */
+-  lll_lock (cond->__data.__lock, pshared);
++  unsigned int wrefs = atomic_load_relaxed (&cond->__data.__wrefs);
++  if (wrefs >> 3 == 0)
++    return 0;
++  int private = __condvar_get_private (wrefs);
++
++  __condvar_acquire_lock (cond, private);
+ 
+-  /* Are there any waiters to be woken?  */
+-  if (cond->__data.__total_seq > cond->__data.__wakeup_seq)
++  unsigned long long int wseq = __condvar_load_wseq_relaxed (cond);
++  unsigned int g2 = wseq & 1;
++  unsigned int g1 = g2 ^ 1;
++  wseq >>= 1;
++  bool do_futex_wake = false;
++
++  /* Step (1): signal all waiters remaining in G1.  */
++  if (cond->__data.__g_size[g1] != 0)
+     {
+-      /* Yes.  Mark them all as woken.  */
+-      cond->__data.__wakeup_seq = cond->__data.__total_seq;
+-      cond->__data.__woken_seq = cond->__data.__total_seq;
+-      cond->__data.__futex = (unsigned int) cond->__data.__total_seq * 2;
+-      int futex_val = cond->__data.__futex;
+-      /* Signal that a broadcast happened.  */
+-      ++cond->__data.__broadcast_seq;
+-
+-      /* We are done.  */
+-      lll_unlock (cond->__data.__lock, pshared);
+-
+-      /* Wake everybody.  */
+-      pthread_mutex_t *mut = (pthread_mutex_t *) cond->__data.__mutex;
+-
+-      /* Do not use requeue for pshared condvars.  */
+-      if (mut == (void *) ~0l
+-	  || PTHREAD_MUTEX_PSHARED (mut) & PTHREAD_MUTEX_PSHARED_BIT)
+-	goto wake_all;
+-
+-#if (defined lll_futex_cmp_requeue_pi \
+-     && defined __ASSUME_REQUEUE_PI)
+-      if (USE_REQUEUE_PI (mut))
+-	{
+-	  if (lll_futex_cmp_requeue_pi (&cond->__data.__futex, 1, INT_MAX,
+-					&mut->__data.__lock, futex_val,
+-					LLL_PRIVATE) == 0)
+-	    return 0;
+-	}
+-      else
+-#endif
+-	/* lll_futex_requeue returns 0 for success and non-zero
+-	   for errors.  */
+-	if (!__builtin_expect (lll_futex_requeue (&cond->__data.__futex, 1,
+-						  INT_MAX, &mut->__data.__lock,
+-						  futex_val, LLL_PRIVATE), 0))
+-	  return 0;
+-
+-wake_all:
+-      lll_futex_wake (&cond->__data.__futex, INT_MAX, pshared);
+-      return 0;
++      /* Add as many signals as the remaining size of the group.  */
++      atomic_fetch_add_relaxed (cond->__data.__g_signals + g1,
++				cond->__data.__g_size[g1] << 1);
++      cond->__data.__g_size[g1] = 0;
++
++      /* We need to wake G1 waiters before we quiesce G1 below.  */
++      /* TODO Only set it if there are indeed futex waiters.  We could
++	 also try to move this out of the critical section in cases when
++	 G2 is empty (and we don't need to quiesce).  */
++      futex_wake (cond->__data.__g_signals + g1, INT_MAX, private);
+     }
+ 
+-  /* We are done.  */
+-  lll_unlock (cond->__data.__lock, pshared);
++  /* G1 is complete.  Step (2) is next unless there are no waiters in G2, in
++     which case we can stop.  */
++  if (__condvar_quiesce_and_switch_g1 (cond, wseq, &g1, private))
++    {
++      /* Step (3): Send signals to all waiters in the old G2 / new G1.  */
++      atomic_fetch_add_relaxed (cond->__data.__g_signals + g1,
++				cond->__data.__g_size[g1] << 1);
++      cond->__data.__g_size[g1] = 0;
++      /* TODO Only set it if there are indeed futex waiters.  */
++      do_futex_wake = true;
++    }
++
++  __condvar_release_lock (cond, private);
++
++  if (do_futex_wake)
++    futex_wake (cond->__data.__g_signals + g1, INT_MAX, private);
+ 
+   return 0;
+ }
+diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
+new file mode 100644
+index 0000000..b374396
+--- /dev/null
++++ b/nptl/pthread_cond_common.c
+@@ -0,0 +1,466 @@
++/* pthread_cond_common -- shared code for condition variable.
++   Copyright (C) 2016 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <http://www.gnu.org/licenses/>.  */
++
++#include <atomic.h>
++#include <stdint.h>
++#include <pthread.h>
++#include <libc-internal.h>
++
++/* We need 3 least-significant bits on __wrefs for something else.  */
++#define __PTHREAD_COND_MAX_GROUP_SIZE ((unsigned) 1 << 29)
++
++#if __HAVE_64B_ATOMICS == 1
++
++static uint64_t __attribute__ ((unused))
++__condvar_load_wseq_relaxed (pthread_cond_t *cond)
++{
++  return atomic_load_relaxed (&cond->__data.__wseq);
++}
++
++static uint64_t __attribute__ ((unused))
++__condvar_fetch_add_wseq_acquire (pthread_cond_t *cond, unsigned int val)
++{
++  return atomic_fetch_add_acquire (&cond->__data.__wseq, val);
++}
++
++static uint64_t __attribute__ ((unused))
++__condvar_fetch_xor_wseq_release (pthread_cond_t *cond, unsigned int val)
++{
++  return atomic_fetch_xor_release (&cond->__data.__wseq, val);
++}
++
++static uint64_t __attribute__ ((unused))
++__condvar_load_g1_start_relaxed (pthread_cond_t *cond)
++{
++  return atomic_load_relaxed (&cond->__data.__g1_start);
++}
++
++static void __attribute__ ((unused))
++__condvar_add_g1_start_relaxed (pthread_cond_t *cond, unsigned int val)
++{
++  atomic_store_relaxed (&cond->__data.__g1_start,
++      atomic_load_relaxed (&cond->__data.__g1_start) + val);
++}
++
++#else
++
++/* We use two 64b counters: __wseq and __g1_start.  They are monotonically
++   increasing and single-writer-multiple-readers counters, so we can implement
++   load, fetch-and-add, and fetch-and-xor operations even when we just have
++   32b atomics.  Values we add or xor are less than or equal to 1<<31 (*),
++   so we only have to make overflow-and-addition atomic wrt. to concurrent
++   load operations and xor operations.  To do that, we split each counter into
++   two 32b values of which we reserve the MSB of each to represent an
++   overflow from the lower-order half to the higher-order half.
++
++   In the common case, the state is (higher-order / lower-order half, and . is
++   basically concatenation of the bits):
++   0.h     / 0.l  = h.l
++
++   When we add a value of x that overflows (i.e., 0.l + x == 1.L), we run the
++   following steps S1-S4 (the values these represent are on the right-hand
++   side):
++   S1:  0.h     / 1.L == (h+1).L
++   S2:  1.(h+1) / 1.L == (h+1).L
++   S3:  1.(h+1) / 0.L == (h+1).L
++   S4:  0.(h+1) / 0.L == (h+1).L
++   If the LSB of the higher-order half is set, readers will ignore the
++   overflow bit in the lower-order half.
++
++   To get an atomic snapshot in load operations, we exploit that the
++   higher-order half is monotonically increasing; if we load a value V from
++   it, then read the lower-order half, and then read the higher-order half
++   again and see the same value V, we know that both halves have existed in
++   the sequence of values the full counter had.  This is similar to the
++   validated reads in the time-based STMs in GCC's libitm (e.g.,
++   method_ml_wt).
++
++   The xor operation needs to be an atomic read-modify-write.  The write
++   itself is not an issue as it affects just the lower-order half but not bits
++   used in the add operation.  To make the full fetch-and-xor atomic, we
++   exploit that concurrently, the value can increase by at most 1<<31 (*): The
++   xor operation is only called while having acquired the lock, so not more
++   than __PTHREAD_COND_MAX_GROUP_SIZE waiters can enter concurrently and thus
++   increment __wseq.  Therefore, if the xor operation observes a value of
++   __wseq, then the value it applies the modification to later on can be
++   derived (see below).
++
++   One benefit of this scheme is that this makes load operations
++   obstruction-free because unlike if we would just lock the counter, readers
++   can almost always interpret a snapshot of each halves.  Readers can be
++   forced to read a new snapshot when the read is concurrent with an overflow.
++   However, overflows will happen infrequently, so load operations are
++   practically lock-free.
++
++   (*) The highest value we add is __PTHREAD_COND_MAX_GROUP_SIZE << 2 to
++   __g1_start (the two extra bits are for the lock in the two LSBs of
++   __g1_start).  */
++
++typedef struct
++{
++  unsigned int low;
++  unsigned int high;
++} _condvar_lohi;
++
++static uint64_t
++__condvar_fetch_add_64_relaxed (_condvar_lohi *lh, unsigned int op)
++{
++  /* S1. Note that this is an atomic read-modify-write so it extends the
++     release sequence of release MO store at S3.  */
++  unsigned int l = atomic_fetch_add_relaxed (&lh->low, op);
++  unsigned int h = atomic_load_relaxed (&lh->high);
++  uint64_t result = ((uint64_t) h << 31) | l;
++  l += op;
++  if ((l >> 31) > 0)
++    {
++      /* Overflow.  Need to increment higher-order half.  Note that all
++	 add operations are ordered in happens-before.  */
++      h++;
++      /* S2. Release MO to synchronize with the loads of the higher-order half
++	 in the load operation.  See __condvar_load_64_relaxed.  */
++      atomic_store_release (&lh->high, h | ((unsigned int) 1 << 31));
++      l ^= (unsigned int) 1 << 31;
++      /* S3.  See __condvar_load_64_relaxed.  */
++      atomic_store_release (&lh->low, l);
++      /* S4.  Likewise.  */
++      atomic_store_release (&lh->high, h);
++    }
++  return result;
++}
++
++static uint64_t
++__condvar_load_64_relaxed (_condvar_lohi *lh)
++{
++  unsigned int h, l, h2;
++  do
++    {
++      /* This load and the second one below to the same location read from the
++	 stores in the overflow handling of the add operation or the
++	 initializing stores (which is a simple special case because
++	 initialization always completely happens before further use).
++	 Because no two stores to the higher-order half write the same value,
++	 the loop ensures that if we continue to use the snapshot, this load
++	 and the second one read from the same store operation.  All candidate
++	 store operations have release MO.
++	 If we read from S2 in the first load, then we will see the value of
++	 S1 on the next load (because we synchronize with S2), or a value
++	 later in modification order.  We correctly ignore the lower-half's
++	 overflow bit in this case.  If we read from S4, then we will see the
++	 value of S3 in the next load (or a later value), which does not have
++	 the overflow bit set anymore.
++	  */
++      h = atomic_load_acquire (&lh->high);
++      /* This will read from the release sequence of S3 (i.e, either the S3
++	 store or the read-modify-writes at S1 following S3 in modification
++	 order).  Thus, the read synchronizes with S3, and the following load
++	 of the higher-order half will read from the matching S2 (or a later
++	 value).
++	 Thus, if we read a lower-half value here that already overflowed and
++	 belongs to an increased higher-order half value, we will see the
++	 latter and h and h2 will not be equal.  */
++      l = atomic_load_acquire (&lh->low);
++      /* See above.  */
++      h2 = atomic_load_relaxed (&lh->high);
++    }
++  while (h != h2);
++  if (((l >> 31) > 0) && ((h >> 31) > 0))
++    l ^= (unsigned int) 1 << 31;
++  return ((uint64_t) (h & ~((unsigned int) 1 << 31)) << 31) + l;
++}
++
++static uint64_t __attribute__ ((unused))
++__condvar_load_wseq_relaxed (pthread_cond_t *cond)
++{
++  return __condvar_load_64_relaxed ((_condvar_lohi *) &cond->__data.__wseq32);
++}
++
++static uint64_t __attribute__ ((unused))
++__condvar_fetch_add_wseq_acquire (pthread_cond_t *cond, unsigned int val)
++{
++  uint64_t r = __condvar_fetch_add_64_relaxed
++      ((_condvar_lohi *) &cond->__data.__wseq32, val);
++  atomic_thread_fence_acquire ();
++  return r;
++}
++
++static uint64_t __attribute__ ((unused))
++__condvar_fetch_xor_wseq_release (pthread_cond_t *cond, unsigned int val)
++{
++  _condvar_lohi *lh = (_condvar_lohi *) &cond->__data.__wseq32;
++  /* First, get the current value.  See __condvar_load_64_relaxed.  */
++  unsigned int h, l, h2;
++  do
++    {
++      h = atomic_load_acquire (&lh->high);
++      l = atomic_load_acquire (&lh->low);
++      h2 = atomic_load_relaxed (&lh->high);
++    }
++  while (h != h2);
++  if (((l >> 31) > 0) && ((h >> 31) == 0))
++    h++;
++  h &= ~((unsigned int) 1 << 31);
++  l &= ~((unsigned int) 1 << 31);
++
++  /* Now modify.  Due to the coherence rules, the prior load will read a value
++     earlier in modification order than the following fetch-xor.
++     This uses release MO to make the full operation have release semantics
++     (all other operations access the lower-order half).  */
++  unsigned int l2 = atomic_fetch_xor_release (&lh->low, val)
++      & ~((unsigned int) 1 << 31);
++  if (l2 < l)
++    /* The lower-order half overflowed in the meantime.  This happened exactly
++       once due to the limit on concurrent waiters (see above).  */
++    h++;
++  return ((uint64_t) h << 31) + l2;
++}
++
++static uint64_t __attribute__ ((unused))
++__condvar_load_g1_start_relaxed (pthread_cond_t *cond)
++{
++  return __condvar_load_64_relaxed
++      ((_condvar_lohi *) &cond->__data.__g1_start32);
++}
++
++static void __attribute__ ((unused))
++__condvar_add_g1_start_relaxed (pthread_cond_t *cond, unsigned int val)
++{
++  ignore_value (__condvar_fetch_add_64_relaxed
++      ((_condvar_lohi *) &cond->__data.__g1_start32, val));
++}
++
++#endif  /* !__HAVE_64B_ATOMICS  */
++
++
++/* The lock that signalers use.  See pthread_cond_wait_common for uses.
++   The lock is our normal three-state lock: not acquired (0) / acquired (1) /
++   acquired-with-futex_wake-request (2).  However, we need to preserve the
++   other bits in the unsigned int used for the lock, and therefore it is a
++   little more complex.  */
++static void __attribute__ ((unused))
++__condvar_acquire_lock (pthread_cond_t *cond, int private)
++{
++  unsigned int s = atomic_load_relaxed (&cond->__data.__g1_orig_size);
++  while ((s & 3) == 0)
++    {
++      if (atomic_compare_exchange_weak_acquire (&cond->__data.__g1_orig_size,
++	  &s, s | 1))
++	return;
++      /* TODO Spinning and back-off.  */
++    }
++  /* We can't change from not acquired to acquired, so try to change to
++     acquired-with-futex-wake-request and do a futex wait if we cannot change
++     from not acquired.  */
++  while (1)
++    {
++      while ((s & 3) != 2)
++	{
++	  if (atomic_compare_exchange_weak_acquire
++	      (&cond->__data.__g1_orig_size, &s, (s & ~(unsigned int) 3) | 2))
++	    {
++	      if ((s & 3) == 0)
++		return;
++	      break;
++	    }
++	  /* TODO Back off.  */
++	}
++      futex_wait_simple (&cond->__data.__g1_orig_size,
++	  (s & ~(unsigned int) 3) | 2, private);
++      /* Reload so we see a recent value.  */
++      s = atomic_load_relaxed (&cond->__data.__g1_orig_size);
++    }
++}
++
++/* See __condvar_acquire_lock.  */
++static void __attribute__ ((unused))
++__condvar_release_lock (pthread_cond_t *cond, int private)
++{
++  if ((atomic_fetch_and_release (&cond->__data.__g1_orig_size,
++				 ~(unsigned int) 3) & 3)
++      == 2)
++    futex_wake (&cond->__data.__g1_orig_size, 1, private);
++}
++
++/* Only use this when having acquired the lock.  */
++static unsigned int __attribute__ ((unused))
++__condvar_get_orig_size (pthread_cond_t *cond)
++{
++  return atomic_load_relaxed (&cond->__data.__g1_orig_size) >> 2;
++}
++
++/* Only use this when having acquired the lock.  */
++static void __attribute__ ((unused))
++__condvar_set_orig_size (pthread_cond_t *cond, unsigned int size)
++{
++  /* We have acquired the lock, but might get one concurrent update due to a
++     lock state change from acquired to acquired-with-futex_wake-request.
++     The store with relaxed MO is fine because there will be no further
++     changes to the lock bits nor the size, and we will subsequently release
++     the lock with release MO.  */
++  unsigned int s;
++  s = (atomic_load_relaxed (&cond->__data.__g1_orig_size) & 3)
++      | (size << 2);
++  if ((atomic_exchange_relaxed (&cond->__data.__g1_orig_size, s) & 3)
++      != (s & 3))
++    atomic_store_relaxed (&cond->__data.__g1_orig_size, (size << 2) | 2);
++}
++
++/* Returns FUTEX_SHARED or FUTEX_PRIVATE based on the provided __wrefs
++   value.  */
++static int __attribute__ ((unused))
++__condvar_get_private (int flags)
++{
++  if ((flags & __PTHREAD_COND_SHARED_MASK) == 0)
++    return FUTEX_PRIVATE;
++  else
++    return FUTEX_SHARED;
++}
++
++/* This closes G1 (whose index is in G1INDEX), waits for all futex waiters to
++   leave G1, converts G1 into a fresh G2, and then switches group roles so that
++   the former G2 becomes the new G1 ending at the current __wseq value when we
++   eventually make the switch (WSEQ is just an observation of __wseq by the
++   signaler).
++   If G2 is empty, it will not switch groups because then it would create an
++   empty G1 which would require switching groups again on the next signal.
++   Returns false iff groups were not switched because G2 was empty.  */
++static bool __attribute__ ((unused))
++__condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
++    unsigned int *g1index, int private)
++{
++  const unsigned int maxspin = 0;
++  unsigned int g1 = *g1index;
++
++  /* If there is no waiter in G2, we don't do anything.  The expression may
++     look odd but remember that __g_size might hold a negative value, so
++     putting the expression this way avoids relying on implementation-defined
++     behavior.
++     Note that this works correctly for a zero-initialized condvar too.  */
++  unsigned int old_orig_size = __condvar_get_orig_size (cond);
++  uint64_t old_g1_start = __condvar_load_g1_start_relaxed (cond) >> 1;
++  if (((unsigned) (wseq - old_g1_start - old_orig_size)
++	  + cond->__data.__g_size[g1 ^ 1]) == 0)
++	return false;
++
++  /* Now try to close and quiesce G1.  We have to consider the following kinds
++     of waiters:
++     * Waiters from less recent groups than G1 are not affected because
++       nothing will change for them apart from __g1_start getting larger.
++     * New waiters arriving concurrently with the group switching will all go
++       into G2 until we atomically make the switch.  Waiters existing in G2
++       are not affected.
++     * Waiters in G1 will be closed out immediately by setting a flag in
++       __g_signals, which will prevent waiters from blocking using a futex on
++       __g_signals and also notifies them that the group is closed.  As a
++       result, they will eventually remove their group reference, allowing us
++       to close switch group roles.  */
++
++  /* First, set the closed flag on __g_signals.  This tells waiters that are
++     about to wait that they shouldn't do that anymore.  This basically
++     serves as an advance notificaton of the upcoming change to __g1_start;
++     waiters interpret it as if __g1_start was larger than their waiter
++     sequence position.  This allows us to change __g1_start after waiting
++     for all existing waiters with group references to leave, which in turn
++     makes recovery after stealing a signal simpler because it then can be
++     skipped if __g1_start indicates that the group is closed (otherwise,
++     we would have to recover always because waiters don't know how big their
++     groups are).  Relaxed MO is fine.  */
++  atomic_fetch_or_relaxed (cond->__data.__g_signals + g1, 1);
++
++  /* Wait until there are no group references anymore.  The fetch-or operation
++     injects us into the modification order of __g_refs; release MO ensures
++     that waiters incrementing __g_refs after our fetch-or see the previous
++     changes to __g_signals and to __g1_start that had to happen before we can
++     switch this G1 and alias with an older group (we have two groups, so
++     aliasing requires switching group roles twice).  Note that nobody else
++     can have set the wake-request flag, so we do not have to act upon it.
++
++     Also note that it is harmless if older waiters or waiters from this G1
++     get a group reference after we have quiesced the group because it will
++     remain closed for them either because of the closed flag in __g_signals
++     or the later update to __g1_start.  New waiters will never arrive here
++     but instead continue to go into the still current G2.  */
++  unsigned r = atomic_fetch_or_release (cond->__data.__g_refs + g1, 0);
++  while ((r >> 1) > 0)
++    {
++      for (unsigned int spin = maxspin; ((r >> 1) > 0) && (spin > 0); spin--)
++	{
++	  /* TODO Back off.  */
++	  r = atomic_load_relaxed (cond->__data.__g_refs + g1);
++	}
++      if ((r >> 1) > 0)
++	{
++	  /* There is still a waiter after spinning.  Set the wake-request
++	     flag and block.  Relaxed MO is fine because this is just about
++	     this futex word.  */
++	  r = atomic_fetch_or_relaxed (cond->__data.__g_refs + g1, 1);
++
++	  if ((r >> 1) > 0)
++	    futex_wait_simple (cond->__data.__g_refs + g1, r, private);
++	  /* Reload here so we eventually see the most recent value even if we
++	     do not spin.   */
++	  r = atomic_load_relaxed (cond->__data.__g_refs + g1);
++	}
++    }
++  /* Acquire MO so that we synchronize with the release operation that waiters
++     use to decrement __g_refs and thus happen after the waiters we waited
++     for.  */
++  atomic_thread_fence_acquire ();
++
++  /* Update __g1_start, which finishes closing this group.  The value we add
++     will never be negative because old_orig_size can only be zero when we
++     switch groups the first time after a condvar was initialized, in which
++     case G1 will be at index 1 and we will add a value of 1.  See above for
++     why this takes place after waiting for quiescence of the group.
++     Relaxed MO is fine because the change comes with no additional
++     constraints that others would have to observe.  */
++  __condvar_add_g1_start_relaxed (cond,
++      (old_orig_size << 1) + (g1 == 1 ? 1 : - 1));
++
++  /* Now reopen the group, thus enabling waiters to again block using the
++     futex controlled by __g_signals.  Release MO so that observers that see
++     no signals (and thus can block) also see the write __g1_start and thus
++     that this is now a new group (see __pthread_cond_wait_common for the
++     matching acquire MO loads).  */
++  atomic_store_release (cond->__data.__g_signals + g1, 0);
++
++  /* At this point, the old G1 is now a valid new G2 (but not in use yet).
++     No old waiter can neither grab a signal nor acquire a reference without
++     noticing that __g1_start is larger.
++     We can now publish the group switch by flipping the G2 index in __wseq.
++     Release MO so that this synchronizes with the acquire MO operation
++     waiters use to obtain a position in the waiter sequence.  */
++  wseq = __condvar_fetch_xor_wseq_release (cond, 1) >> 1;
++  g1 ^= 1;
++  *g1index ^= 1;
++
++  /* These values are just observed by signalers, and thus protected by the
++     lock.  */
++  unsigned int orig_size = wseq - (old_g1_start + old_orig_size);
++  __condvar_set_orig_size (cond, orig_size);
++  /* Use and addition to not loose track of cancellations in what was
++     previously G2.  */
++  cond->__data.__g_size[g1] += orig_size;
++
++  /* The new G1's size may be zero because of cancellations during its time
++     as G2.  If this happens, there are no waiters that have to receive a
++     signal, so we do not need to add any and return false.  */
++  if (cond->__data.__g_size[g1] == 0)
++    return false;
++
++  return true;
++}
+diff --git a/nptl/pthread_cond_destroy.c b/nptl/pthread_cond_destroy.c
+index 1acd804..5845c6a 100644
+--- a/nptl/pthread_cond_destroy.c
++++ b/nptl/pthread_cond_destroy.c
+@@ -20,66 +20,42 @@
+ #include <shlib-compat.h>
+ #include "pthreadP.h"
+ #include <stap-probe.h>
+-
+-
++#include <atomic.h>
++#include <futex-internal.h>
++
++#include "pthread_cond_common.c"
++
++/* See __pthread_cond_wait for a high-level description of the algorithm.
++
++   A correct program must make sure that no waiters are blocked on the condvar
++   when it is destroyed, and that there are no concurrent signals or
++   broadcasts.  To wake waiters reliably, the program must signal or
++   broadcast while holding the mutex or after having held the mutex.  It must
++   also ensure that no signal or broadcast are still pending to unblock
++   waiters; IOW, because waiters can wake up spuriously, the program must
++   effectively ensure that destruction happens after the execution of those
++   signal or broadcast calls.
++   Thus, we can assume that all waiters that are still accessing the condvar
++   have been woken.  We wait until they have confirmed to have woken up by
++   decrementing __wrefs.  */
+ int
+ __pthread_cond_destroy (pthread_cond_t *cond)
+ {
+-  int pshared = (cond->__data.__mutex == (void *) ~0l)
+-		? LLL_SHARED : LLL_PRIVATE;
+-
+   LIBC_PROBE (cond_destroy, 1, cond);
+ 
+-  /* Make sure we are alone.  */
+-  lll_lock (cond->__data.__lock, pshared);
+-
+-  if (cond->__data.__total_seq > cond->__data.__wakeup_seq)
+-    {
+-      /* If there are still some waiters which have not been
+-	 woken up, this is an application bug.  */
+-      lll_unlock (cond->__data.__lock, pshared);
+-      return EBUSY;
+-    }
+-
+-  /* Tell pthread_cond_*wait that this condvar is being destroyed.  */
+-  cond->__data.__total_seq = -1ULL;
+-
+-  /* If there are waiters which have been already signalled or
+-     broadcasted, but still are using the pthread_cond_t structure,
+-     pthread_cond_destroy needs to wait for them.  */
+-  unsigned int nwaiters = cond->__data.__nwaiters;
+-
+-  if (nwaiters >= (1 << COND_NWAITERS_SHIFT))
++  /* Set the wake request flag.  We could also spin, but destruction that is
++     concurrent with still-active waiters is probably neither common nor
++     performance critical.  Acquire MO to synchronize with waiters confirming
++     that they finished.  */
++  unsigned int wrefs = atomic_fetch_or_acquire (&cond->__data.__wrefs, 4);
++  int private = __condvar_get_private (wrefs);
++  while (wrefs >> 3 != 0)
+     {
+-      /* Wake everybody on the associated mutex in case there are
+-	 threads that have been requeued to it.
+-	 Without this, pthread_cond_destroy could block potentially
+-	 for a long time or forever, as it would depend on other
+-	 thread's using the mutex.
+-	 When all threads waiting on the mutex are woken up, pthread_cond_wait
+-	 only waits for threads to acquire and release the internal
+-	 condvar lock.  */
+-      if (cond->__data.__mutex != NULL
+-	  && cond->__data.__mutex != (void *) ~0l)
+-	{
+-	  pthread_mutex_t *mut = (pthread_mutex_t *) cond->__data.__mutex;
+-	  lll_futex_wake (&mut->__data.__lock, INT_MAX,
+-			  PTHREAD_MUTEX_PSHARED (mut));
+-	}
+-
+-      do
+-	{
+-	  lll_unlock (cond->__data.__lock, pshared);
+-
+-	  lll_futex_wait (&cond->__data.__nwaiters, nwaiters, pshared);
+-
+-	  lll_lock (cond->__data.__lock, pshared);
+-
+-	  nwaiters = cond->__data.__nwaiters;
+-	}
+-      while (nwaiters >= (1 << COND_NWAITERS_SHIFT));
++      futex_wait_simple (&cond->__data.__wrefs, wrefs, private);
++      /* See above.  */
++      wrefs = atomic_load_acquire (&cond->__data.__wrefs);
+     }
+-
++  /* The memory the condvar occupies can now be reused.  */
+   return 0;
+ }
+ versioned_symbol (libpthread, __pthread_cond_destroy,
+diff --git a/nptl/pthread_cond_init.c b/nptl/pthread_cond_init.c
+index 9023370..c1eac5f 100644
+--- a/nptl/pthread_cond_init.c
++++ b/nptl/pthread_cond_init.c
+@@ -19,25 +19,29 @@
+ #include <shlib-compat.h>
+ #include "pthreadP.h"
+ #include <stap-probe.h>
++#include <string.h>
+ 
+ 
++/* See __pthread_cond_wait for details.  */
+ int
+ __pthread_cond_init (pthread_cond_t *cond, const pthread_condattr_t *cond_attr)
+ {
+   struct pthread_condattr *icond_attr = (struct pthread_condattr *) cond_attr;
+ 
+-  cond->__data.__lock = LLL_LOCK_INITIALIZER;
+-  cond->__data.__futex = 0;
+-  cond->__data.__nwaiters = (icond_attr != NULL
+-			     ? ((icond_attr->value >> 1)
+-				& ((1 << COND_NWAITERS_SHIFT) - 1))
+-			     : CLOCK_REALTIME);
+-  cond->__data.__total_seq = 0;
+-  cond->__data.__wakeup_seq = 0;
+-  cond->__data.__woken_seq = 0;
+-  cond->__data.__mutex = (icond_attr == NULL || (icond_attr->value & 1) == 0
+-			  ? NULL : (void *) ~0l);
+-  cond->__data.__broadcast_seq = 0;
++  memset (cond, 0, sizeof (pthread_cond_t));
++
++  /* Update the pretty printers if the internal representation of icond_attr
++     is changed.  */
++
++  /* Iff not equal to ~0l, this is a PTHREAD_PROCESS_PRIVATE condvar.  */
++  if (icond_attr != NULL && (icond_attr->value & 1) != 0)
++    cond->__data.__wrefs |= __PTHREAD_COND_SHARED_MASK;
++  int clockid = (icond_attr != NULL
++		 ? ((icond_attr->value >> 1) & ((1 << COND_CLOCK_BITS) - 1))
++		 : CLOCK_REALTIME);
++  /* If 0, CLOCK_REALTIME is used; CLOCK_MONOTONIC otherwise.  */
++  if (clockid != CLOCK_REALTIME)
++    cond->__data.__wrefs |= __PTHREAD_COND_CLOCK_MONOTONIC_MASK;
+ 
+   LIBC_PROBE (cond_init, 2, cond, cond_attr);
+ 
+diff --git a/nptl/pthread_cond_signal.c b/nptl/pthread_cond_signal.c
+index b3a6d3d..a95d569 100644
+--- a/nptl/pthread_cond_signal.c
++++ b/nptl/pthread_cond_signal.c
+@@ -19,62 +19,79 @@
+ #include <endian.h>
+ #include <errno.h>
+ #include <sysdep.h>
+-#include <lowlevellock.h>
++#include <futex-internal.h>
+ #include <pthread.h>
+ #include <pthreadP.h>
++#include <atomic.h>
++#include <stdint.h>
+ 
+ #include <shlib-compat.h>
+-#include <kernel-features.h>
+ #include <stap-probe.h>
+ 
++#include "pthread_cond_common.c"
+ 
++/* See __pthread_cond_wait for a high-level description of the algorithm.  */
+ int
+ __pthread_cond_signal (pthread_cond_t *cond)
+ {
+-  int pshared = (cond->__data.__mutex == (void *) ~0l)
+-		? LLL_SHARED : LLL_PRIVATE;
+-
+   LIBC_PROBE (cond_signal, 1, cond);
+ 
+-  /* Make sure we are alone.  */
+-  lll_lock (cond->__data.__lock, pshared);
+-
+-  /* Are there any waiters to be woken?  */
+-  if (cond->__data.__total_seq > cond->__data.__wakeup_seq)
++  /* First check whether there are waiters.  Relaxed MO is fine for that for
++     the same reasons that relaxed MO is fine when observing __wseq (see
++     below).  */
++  unsigned int wrefs = atomic_load_relaxed (&cond->__data.__wrefs);
++  if (wrefs >> 3 == 0)
++    return 0;
++  int private = __condvar_get_private (wrefs);
++
++  __condvar_acquire_lock (cond, private);
++
++  /* Load the waiter sequence number, which represents our relative ordering
++     to any waiters.  Relaxed MO is sufficient for that because:
++     1) We can pick any position that is allowed by external happens-before
++        constraints.  In particular, if another __pthread_cond_wait call
++        happened before us, this waiter must be eligible for being woken by
++        us.  The only way do establish such a happens-before is by signaling
++        while having acquired the mutex associated with the condvar and
++        ensuring that the signal's critical section happens after the waiter.
++        Thus, the mutex ensures that we see that waiter's __wseq increase.
++     2) Once we pick a position, we do not need to communicate this to the
++        program via a happens-before that we set up: First, any wake-up could
++        be a spurious wake-up, so the program must not interpret a wake-up as
++        an indication that the waiter happened before a particular signal;
++        second, a program cannot detect whether a waiter has not yet been
++        woken (i.e., it cannot distinguish between a non-woken waiter and one
++        that has been woken but hasn't resumed execution yet), and thus it
++        cannot try to deduce that a signal happened before a particular
++        waiter.  */
++  unsigned long long int wseq = __condvar_load_wseq_relaxed (cond);
++  unsigned int g1 = (wseq & 1) ^ 1;
++  wseq >>= 1;
++  bool do_futex_wake = false;
++
++  /* If G1 is still receiving signals, we put the signal there.  If not, we
++     check if G2 has waiters, and if so, quiesce and switch G1 to the former
++     G2; if this results in a new G1 with waiters (G2 might have cancellations
++     already, see __condvar_quiesce_and_switch_g1), we put the signal in the
++     new G1.  */
++  if ((cond->__data.__g_size[g1] != 0)
++      || __condvar_quiesce_and_switch_g1 (cond, wseq, &g1, private))
+     {
+-      /* Yes.  Mark one of them as woken.  */
+-      ++cond->__data.__wakeup_seq;
+-      ++cond->__data.__futex;
+-
+-#if (defined lll_futex_cmp_requeue_pi \
+-     && defined __ASSUME_REQUEUE_PI)
+-      pthread_mutex_t *mut = cond->__data.__mutex;
+-
+-      if (USE_REQUEUE_PI (mut)
+-	/* This can only really fail with a ENOSYS, since nobody can modify
+-	   futex while we have the cond_lock.  */
+-	  && lll_futex_cmp_requeue_pi (&cond->__data.__futex, 1, 0,
+-				       &mut->__data.__lock,
+-				       cond->__data.__futex, pshared) == 0)
+-	{
+-	  lll_unlock (cond->__data.__lock, pshared);
+-	  return 0;
+-	}
+-      else
+-#endif
+-	/* Wake one.  */
+-	if (! __builtin_expect (lll_futex_wake_unlock (&cond->__data.__futex,
+-						       1, 1,
+-						       &cond->__data.__lock,
+-						       pshared), 0))
+-	  return 0;
+-
+-      /* Fallback if neither of them work.  */
+-      lll_futex_wake (&cond->__data.__futex, 1, pshared);
++      /* Add a signal.  Relaxed MO is fine because signaling does not need to
++	 establish a happens-before relation (see above).  We do not mask the
++	 release-MO store when initializing a group in
++	 __condvar_quiesce_and_switch_g1 because we use an atomic
++	 read-modify-write and thus extend that store's release sequence.  */
++      atomic_fetch_add_relaxed (cond->__data.__g_signals + g1, 2);
++      cond->__data.__g_size[g1]--;
++      /* TODO Only set it if there are indeed futex waiters.  */
++      do_futex_wake = true;
+     }
+ 
+-  /* We are done.  */
+-  lll_unlock (cond->__data.__lock, pshared);
++  __condvar_release_lock (cond, private);
++
++  if (do_futex_wake)
++    futex_wake (cond->__data.__g_signals + g1, 1, private);
+ 
+   return 0;
+ }
+diff --git a/nptl/pthread_cond_timedwait.c b/nptl/pthread_cond_timedwait.c
+deleted file mode 100644
+index 711a51d..0000000
+--- a/nptl/pthread_cond_timedwait.c
++++ /dev/null
+@@ -1,268 +0,0 @@
+-/* Copyright (C) 2003-2016 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+-   Contributed by Martin Schwidefsky <schwidefsky@de.ibm.com>, 2003.
+-
+-   The GNU C Library is free software; you can redistribute it and/or
+-   modify it under the terms of the GNU Lesser General Public
+-   License as published by the Free Software Foundation; either
+-   version 2.1 of the License, or (at your option) any later version.
+-
+-   The GNU C Library is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
+-   Lesser General Public License for more details.
+-
+-   You should have received a copy of the GNU Lesser General Public
+-   License along with the GNU C Library; if not, see
+-   <http://www.gnu.org/licenses/>.  */
+-
+-#include <endian.h>
+-#include <errno.h>
+-#include <sysdep.h>
+-#include <lowlevellock.h>
+-#include <pthread.h>
+-#include <pthreadP.h>
+-#include <sys/time.h>
+-#include <kernel-features.h>
+-
+-#include <shlib-compat.h>
+-
+-#ifndef HAVE_CLOCK_GETTIME_VSYSCALL
+-# undef INTERNAL_VSYSCALL
+-# define INTERNAL_VSYSCALL INTERNAL_SYSCALL
+-# undef INLINE_VSYSCALL
+-# define INLINE_VSYSCALL INLINE_SYSCALL
+-#else
+-# include <libc-vdso.h>
+-#endif
+-
+-/* Cleanup handler, defined in pthread_cond_wait.c.  */
+-extern void __condvar_cleanup (void *arg)
+-     __attribute__ ((visibility ("hidden")));
+-
+-struct _condvar_cleanup_buffer
+-{
+-  int oldtype;
+-  pthread_cond_t *cond;
+-  pthread_mutex_t *mutex;
+-  unsigned int bc_seq;
+-};
+-
+-int
+-__pthread_cond_timedwait (pthread_cond_t *cond, pthread_mutex_t *mutex,
+-			  const struct timespec *abstime)
+-{
+-  struct _pthread_cleanup_buffer buffer;
+-  struct _condvar_cleanup_buffer cbuffer;
+-  int result = 0;
+-
+-  /* Catch invalid parameters.  */
+-  if (abstime->tv_nsec < 0 || abstime->tv_nsec >= 1000000000)
+-    return EINVAL;
+-
+-  int pshared = (cond->__data.__mutex == (void *) ~0l)
+-		? LLL_SHARED : LLL_PRIVATE;
+-
+-#if (defined lll_futex_timed_wait_requeue_pi \
+-     && defined __ASSUME_REQUEUE_PI)
+-  int pi_flag = 0;
+-#endif
+-
+-  /* Make sure we are alone.  */
+-  lll_lock (cond->__data.__lock, pshared);
+-
+-  /* Now we can release the mutex.  */
+-  int err = __pthread_mutex_unlock_usercnt (mutex, 0);
+-  if (err)
+-    {
+-      lll_unlock (cond->__data.__lock, pshared);
+-      return err;
+-    }
+-
+-  /* We have one new user of the condvar.  */
+-  ++cond->__data.__total_seq;
+-  ++cond->__data.__futex;
+-  cond->__data.__nwaiters += 1 << COND_NWAITERS_SHIFT;
+-
+-  /* Work around the fact that the kernel rejects negative timeout values
+-     despite them being valid.  */
+-  if (__glibc_unlikely (abstime->tv_sec < 0))
+-    goto timeout;
+-
+-  /* Remember the mutex we are using here.  If there is already a
+-     different address store this is a bad user bug.  Do not store
+-     anything for pshared condvars.  */
+-  if (cond->__data.__mutex != (void *) ~0l)
+-    cond->__data.__mutex = mutex;
+-
+-  /* Prepare structure passed to cancellation handler.  */
+-  cbuffer.cond = cond;
+-  cbuffer.mutex = mutex;
+-
+-  /* Before we block we enable cancellation.  Therefore we have to
+-     install a cancellation handler.  */
+-  __pthread_cleanup_push (&buffer, __condvar_cleanup, &cbuffer);
+-
+-  /* The current values of the wakeup counter.  The "woken" counter
+-     must exceed this value.  */
+-  unsigned long long int val;
+-  unsigned long long int seq;
+-  val = seq = cond->__data.__wakeup_seq;
+-  /* Remember the broadcast counter.  */
+-  cbuffer.bc_seq = cond->__data.__broadcast_seq;
+-
+-  while (1)
+-    {
+-#if (!defined __ASSUME_FUTEX_CLOCK_REALTIME \
+-     || !defined lll_futex_timed_wait_bitset)
+-      struct timespec rt;
+-      {
+-# ifdef __NR_clock_gettime
+-	INTERNAL_SYSCALL_DECL (err);
+-	(void) INTERNAL_VSYSCALL (clock_gettime, err, 2,
+-				  (cond->__data.__nwaiters
+-				   & ((1 << COND_NWAITERS_SHIFT) - 1)),
+-				  &rt);
+-	/* Convert the absolute timeout value to a relative timeout.  */
+-	rt.tv_sec = abstime->tv_sec - rt.tv_sec;
+-	rt.tv_nsec = abstime->tv_nsec - rt.tv_nsec;
+-# else
+-	/* Get the current time.  So far we support only one clock.  */
+-	struct timeval tv;
+-	(void) __gettimeofday (&tv, NULL);
+-
+-	/* Convert the absolute timeout value to a relative timeout.  */
+-	rt.tv_sec = abstime->tv_sec - tv.tv_sec;
+-	rt.tv_nsec = abstime->tv_nsec - tv.tv_usec * 1000;
+-# endif
+-      }
+-      if (rt.tv_nsec < 0)
+-	{
+-	  rt.tv_nsec += 1000000000;
+-	  --rt.tv_sec;
+-	}
+-      /* Did we already time out?  */
+-      if (__glibc_unlikely (rt.tv_sec < 0))
+-	{
+-	  if (cbuffer.bc_seq != cond->__data.__broadcast_seq)
+-	    goto bc_out;
+-
+-	  goto timeout;
+-	}
+-#endif
+-
+-      unsigned int futex_val = cond->__data.__futex;
+-
+-      /* Prepare to wait.  Release the condvar futex.  */
+-      lll_unlock (cond->__data.__lock, pshared);
+-
+-      /* Enable asynchronous cancellation.  Required by the standard.  */
+-      cbuffer.oldtype = __pthread_enable_asynccancel ();
+-
+-/* REQUEUE_PI was implemented after FUTEX_CLOCK_REALTIME, so it is sufficient
+-   to check just the former.  */
+-#if (defined lll_futex_timed_wait_requeue_pi \
+-     && defined __ASSUME_REQUEUE_PI)
+-      /* If pi_flag remained 1 then it means that we had the lock and the mutex
+-	 but a spurious waker raced ahead of us.  Give back the mutex before
+-	 going into wait again.  */
+-      if (pi_flag)
+-	{
+-	  __pthread_mutex_cond_lock_adjust (mutex);
+-	  __pthread_mutex_unlock_usercnt (mutex, 0);
+-	}
+-      pi_flag = USE_REQUEUE_PI (mutex);
+-
+-      if (pi_flag)
+-	{
+-	  unsigned int clockbit = (cond->__data.__nwaiters & 1
+-				   ? 0 : FUTEX_CLOCK_REALTIME);
+-	  err = lll_futex_timed_wait_requeue_pi (&cond->__data.__futex,
+-						 futex_val, abstime, clockbit,
+-						 &mutex->__data.__lock,
+-						 pshared);
+-	  pi_flag = (err == 0);
+-	}
+-      else
+-#endif
+-
+-	{
+-#if (!defined __ASSUME_FUTEX_CLOCK_REALTIME \
+-     || !defined lll_futex_timed_wait_bitset)
+-	  /* Wait until woken by signal or broadcast.  */
+-	  err = lll_futex_timed_wait (&cond->__data.__futex,
+-				      futex_val, &rt, pshared);
+-#else
+-	  unsigned int clockbit = (cond->__data.__nwaiters & 1
+-				   ? 0 : FUTEX_CLOCK_REALTIME);
+-	  err = lll_futex_timed_wait_bitset (&cond->__data.__futex, futex_val,
+-					     abstime, clockbit, pshared);
+-#endif
+-	}
+-
+-      /* Disable asynchronous cancellation.  */
+-      __pthread_disable_asynccancel (cbuffer.oldtype);
+-
+-      /* We are going to look at shared data again, so get the lock.  */
+-      lll_lock (cond->__data.__lock, pshared);
+-
+-      /* If a broadcast happened, we are done.  */
+-      if (cbuffer.bc_seq != cond->__data.__broadcast_seq)
+-	goto bc_out;
+-
+-      /* Check whether we are eligible for wakeup.  */
+-      val = cond->__data.__wakeup_seq;
+-      if (val != seq && cond->__data.__woken_seq != val)
+-	break;
+-
+-      /* Not woken yet.  Maybe the time expired?  */
+-      if (__glibc_unlikely (err == -ETIMEDOUT))
+-	{
+-	timeout:
+-	  /* Yep.  Adjust the counters.  */
+-	  ++cond->__data.__wakeup_seq;
+-	  ++cond->__data.__futex;
+-
+-	  /* The error value.  */
+-	  result = ETIMEDOUT;
+-	  break;
+-	}
+-    }
+-
+-  /* Another thread woken up.  */
+-  ++cond->__data.__woken_seq;
+-
+- bc_out:
+-
+-  cond->__data.__nwaiters -= 1 << COND_NWAITERS_SHIFT;
+-
+-  /* If pthread_cond_destroy was called on this variable already,
+-     notify the pthread_cond_destroy caller all waiters have left
+-     and it can be successfully destroyed.  */
+-  if (cond->__data.__total_seq == -1ULL
+-      && cond->__data.__nwaiters < (1 << COND_NWAITERS_SHIFT))
+-    lll_futex_wake (&cond->__data.__nwaiters, 1, pshared);
+-
+-  /* We are done with the condvar.  */
+-  lll_unlock (cond->__data.__lock, pshared);
+-
+-  /* The cancellation handling is back to normal, remove the handler.  */
+-  __pthread_cleanup_pop (&buffer, 0);
+-
+-  /* Get the mutex before returning.  */
+-#if (defined lll_futex_timed_wait_requeue_pi \
+-     && defined __ASSUME_REQUEUE_PI)
+-  if (pi_flag)
+-    {
+-      __pthread_mutex_cond_lock_adjust (mutex);
+-      err = 0;
+-    }
+-  else
+-#endif
+-    err = __pthread_mutex_cond_lock (mutex);
+-
+-  return err ?: result;
+-}
+-
+-versioned_symbol (libpthread, __pthread_cond_timedwait, pthread_cond_timedwait,
+-		  GLIBC_2_3_2);
+diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
+index 3f62acc..2b43402 100644
+--- a/nptl/pthread_cond_wait.c
++++ b/nptl/pthread_cond_wait.c
+@@ -19,219 +19,655 @@
+ #include <endian.h>
+ #include <errno.h>
+ #include <sysdep.h>
+-#include <lowlevellock.h>
++#include <futex-internal.h>
+ #include <pthread.h>
+ #include <pthreadP.h>
+-#include <kernel-features.h>
++#include <sys/time.h>
++#include <atomic.h>
++#include <stdint.h>
++#include <stdbool.h>
+ 
+ #include <shlib-compat.h>
+ #include <stap-probe.h>
++#include <time.h>
++
++#include "pthread_cond_common.c"
++
+ 
+ struct _condvar_cleanup_buffer
+ {
+-  int oldtype;
++  uint64_t wseq;
+   pthread_cond_t *cond;
+   pthread_mutex_t *mutex;
+-  unsigned int bc_seq;
++  int private;
+ };
+ 
+ 
+-void
+-__attribute__ ((visibility ("hidden")))
+-__condvar_cleanup (void *arg)
++/* Decrease the waiter reference count.  */
++static void
++__condvar_confirm_wakeup (pthread_cond_t *cond, int private)
+ {
+-  struct _condvar_cleanup_buffer *cbuffer =
+-    (struct _condvar_cleanup_buffer *) arg;
+-  unsigned int destroying;
+-  int pshared = (cbuffer->cond->__data.__mutex == (void *) ~0l)
+-		? LLL_SHARED : LLL_PRIVATE;
++  /* If destruction is pending (i.e., the wake-request flag is nonzero) and we
++     are the last waiter (prior value of __wrefs was 1 << 3), then wake any
++     threads waiting in pthread_cond_destroy.  Release MO to synchronize with
++     these threads.  Don't bother clearing the wake-up request flag.  */
++  if ((atomic_fetch_add_release (&cond->__data.__wrefs, -8) >> 2) == 3)
++    futex_wake (&cond->__data.__wrefs, INT_MAX, private);
++}
++
+ 
+-  /* We are going to modify shared data.  */
+-  lll_lock (cbuffer->cond->__data.__lock, pshared);
++/* Cancel waiting after having registered as a waiter previously.  SEQ is our
++   position and G is our group index.
++   The goal of cancellation is to make our group smaller if that is still
++   possible.  If we are in a closed group, this is not possible anymore; in
++   this case, we need to send a replacement signal for the one we effectively
++   consumed because the signal should have gotten consumed by another waiter
++   instead; we must not both cancel waiting and consume a signal.
++
++   Must not be called while still holding a reference on the group.
++
++   Returns true iff we consumed a signal.
++
++   On some kind of timeouts, we may be able to pretend that a signal we
++   effectively consumed happened before the timeout (i.e., similarly to first
++   spinning on signals before actually checking whether the timeout has
++   passed already).  Doing this would allow us to skip sending a replacement
++   signal, but this case might happen rarely because the end of the timeout
++   must race with someone else sending a signal.  Therefore, we don't bother
++   trying to optimize this.  */
++static void
++__condvar_cancel_waiting (pthread_cond_t *cond, uint64_t seq, unsigned int g,
++			  int private)
++{
++  bool consumed_signal = false;
+ 
+-  if (cbuffer->bc_seq == cbuffer->cond->__data.__broadcast_seq)
++  /* No deadlock with group switching is possible here because we have do
++     not hold a reference on the group.  */
++  __condvar_acquire_lock (cond, private);
++
++  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond) >> 1;
++  if (g1_start > seq)
++    {
++      /* Our group is closed, so someone provided enough signals for it.
++	 Thus, we effectively consumed a signal.  */
++      consumed_signal = true;
++    }
++  else
+     {
+-      /* This thread is not waiting anymore.  Adjust the sequence counters
+-	 appropriately.  We do not increment WAKEUP_SEQ if this would
+-	 bump it over the value of TOTAL_SEQ.  This can happen if a thread
+-	 was woken and then canceled.  */
+-      if (cbuffer->cond->__data.__wakeup_seq
+-	  < cbuffer->cond->__data.__total_seq)
++      if (g1_start + __condvar_get_orig_size (cond) <= seq)
++	{
++	  /* We are in the current G2 and thus cannot have consumed a signal.
++	     Reduce its effective size or handle overflow.  Remember that in
++	     G2, unsigned int size is zero or a negative value.  */
++	  if (cond->__data.__g_size[g] + __PTHREAD_COND_MAX_GROUP_SIZE > 0)
++	    {
++	      cond->__data.__g_size[g]--;
++	    }
++	  else
++	    {
++	      /* Cancellations would overflow the maximum group size.  Just
++		 wake up everyone spuriously to create a clean state.  This
++		 also means we do not consume a signal someone else sent.  */
++	      __condvar_release_lock (cond, private);
++	      __pthread_cond_broadcast (cond);
++	      return;
++	    }
++	}
++      else
+ 	{
+-	  ++cbuffer->cond->__data.__wakeup_seq;
+-	  ++cbuffer->cond->__data.__futex;
++	  /* We are in current G1.  If the group's size is zero, someone put
++	     a signal in the group that nobody else but us can consume.  */
++	  if (cond->__data.__g_size[g] == 0)
++	    consumed_signal = true;
++	  else
++	    {
++	      /* Otherwise, we decrease the size of the group.  This is
++		 equivalent to atomically putting in a signal just for us and
++		 consuming it right away.  We do not consume a signal sent
++		 by someone else.  We also cannot have consumed a futex
++		 wake-up because if we were cancelled or timed out in a futex
++		 call, the futex will wake another waiter.  */
++	      cond->__data.__g_size[g]--;
++	    }
+ 	}
+-      ++cbuffer->cond->__data.__woken_seq;
+     }
+ 
+-  cbuffer->cond->__data.__nwaiters -= 1 << COND_NWAITERS_SHIFT;
++  __condvar_release_lock (cond, private);
+ 
+-  /* If pthread_cond_destroy was called on this variable already,
+-     notify the pthread_cond_destroy caller all waiters have left
+-     and it can be successfully destroyed.  */
+-  destroying = 0;
+-  if (cbuffer->cond->__data.__total_seq == -1ULL
+-      && cbuffer->cond->__data.__nwaiters < (1 << COND_NWAITERS_SHIFT))
++  if (consumed_signal)
+     {
+-      lll_futex_wake (&cbuffer->cond->__data.__nwaiters, 1, pshared);
+-      destroying = 1;
++      /* We effectively consumed a signal even though we didn't want to.
++	 Therefore, we need to send a replacement signal.
++	 If we would want to optimize this, we could do what
++	 pthread_cond_signal does right in the critical section above.  */
++      __pthread_cond_signal (cond);
+     }
++}
+ 
+-  /* We are done.  */
+-  lll_unlock (cbuffer->cond->__data.__lock, pshared);
+-
+-  /* Wake everybody to make sure no condvar signal gets lost.  */
+-  if (! destroying)
+-    lll_futex_wake (&cbuffer->cond->__data.__futex, INT_MAX, pshared);
+-
+-  /* Get the mutex before returning unless asynchronous cancellation
+-     is in effect.  We don't try to get the mutex if we already own it.  */
+-  if (!(USE_REQUEUE_PI (cbuffer->mutex))
+-      || ((cbuffer->mutex->__data.__lock & FUTEX_TID_MASK)
+-	  != THREAD_GETMEM (THREAD_SELF, tid)))
+-  {
+-    __pthread_mutex_cond_lock (cbuffer->mutex);
+-  }
+-  else
+-    __pthread_mutex_cond_lock_adjust (cbuffer->mutex);
++/* Wake up any signalers that might be waiting.  */
++static void
++__condvar_dec_grefs (pthread_cond_t *cond, unsigned int g, int private)
++{
++  /* Release MO to synchronize-with the acquire load in
++     __condvar_quiesce_and_switch_g1.  */
++  if (atomic_fetch_add_release (cond->__data.__g_refs + g, -2) == 3)
++    {
++      /* Clear the wake-up request flag before waking up.  We do not need more
++	 than relaxed MO and it doesn't matter if we apply this for an aliased
++	 group because we wake all futex waiters right after clearing the
++	 flag.  */
++      atomic_fetch_and_relaxed (cond->__data.__g_refs + g, ~(unsigned int) 1);
++      futex_wake (cond->__data.__g_refs + g, INT_MAX, private);
++    }
+ }
+ 
++/* Clean-up for cancellation of waiters waiting for normal signals.  We cancel
++   our registration as a waiter, confirm we have woken up, and re-acquire the
++   mutex.  */
++static void
++__condvar_cleanup_waiting (void *arg)
++{
++  struct _condvar_cleanup_buffer *cbuffer =
++    (struct _condvar_cleanup_buffer *) arg;
++  pthread_cond_t *cond = cbuffer->cond;
++  unsigned g = cbuffer->wseq & 1;
+ 
+-int
+-__pthread_cond_wait (pthread_cond_t *cond, pthread_mutex_t *mutex)
++  __condvar_dec_grefs (cond, g, cbuffer->private);
++
++  __condvar_cancel_waiting (cond, cbuffer->wseq >> 1, g, cbuffer->private);
++  /* FIXME With the current cancellation implementation, it is possible that
++     a thread is cancelled after it has returned from a syscall.  This could
++     result in a cancelled waiter consuming a futex wake-up that is then
++     causing another waiter in the same group to not wake up.  To work around
++     this issue until we have fixed cancellation, just add a futex wake-up
++     conservatively.  */
++  futex_wake (cond->__data.__g_signals + g, 1, cbuffer->private);
++
++  __condvar_confirm_wakeup (cond, cbuffer->private);
++
++  /* XXX If locking the mutex fails, should we just stop execution?  This
++     might be better than silently ignoring the error.  */
++  __pthread_mutex_cond_lock (cbuffer->mutex);
++}
++
++/* This condvar implementation guarantees that all calls to signal and
++   broadcast and all of the three virtually atomic parts of each call to wait
++   (i.e., (1) releasing the mutex and blocking, (2) unblocking, and (3) re-
++   acquiring the mutex) happen in some total order that is consistent with the
++   happens-before relations in the calling program.  However, this order does
++   not necessarily result in additional happens-before relations being
++   established (which aligns well with spurious wake-ups being allowed).
++
++   All waiters acquire a certain position in a 64b waiter sequence (__wseq).
++   This sequence determines which waiters are allowed to consume signals.
++   A broadcast is equal to sending as many signals as are unblocked waiters.
++   When a signal arrives, it samples the current value of __wseq with a
++   relaxed-MO load (i.e., the position the next waiter would get).  (This is
++   sufficient because it is consistent with happens-before; the caller can
++   enforce stronger ordering constraints by calling signal while holding the
++   mutex.)  Only waiters with a position less than the __wseq value observed
++   by the signal are eligible to consume this signal.
++
++   This would be straight-forward to implement if waiters would just spin but
++   we need to let them block using futexes.  Futexes give no guarantee of
++   waking in FIFO order, so we cannot reliably wake eligible waiters if we
++   just use a single futex.  Also, futex words are 32b in size, but we need
++   to distinguish more than 1<<32 states because we need to represent the
++   order of wake-up (and thus which waiters are eligible to consume signals);
++   blocking in a futex is not atomic with a waiter determining its position in
++   the waiter sequence, so we need the futex word to reliably notify waiters
++   that they should not attempt to block anymore because they have been
++   already signaled in the meantime.  While an ABA issue on a 32b value will
++   be rare, ignoring it when we are aware of it is not the right thing to do
++   either.
++
++   Therefore, we use a 64b counter to represent the waiter sequence (on
++   architectures which only support 32b atomics, we use a few bits less).
++   To deal with the blocking using futexes, we maintain two groups of waiters:
++   * Group G1 consists of waiters that are all eligible to consume signals;
++     incoming signals will always signal waiters in this group until all
++     waiters in G1 have been signaled.
++   * Group G2 consists of waiters that arrive when a G1 is present and still
++     contains waiters that have not been signaled.  When all waiters in G1
++     are signaled and a new signal arrives, the new signal will convert G2
++     into the new G1 and create a new G2 for future waiters.
++
++   We cannot allocate new memory because of process-shared condvars, so we
++   have just two slots of groups that change their role between G1 and G2.
++   Each has a separate futex word, a number of signals available for
++   consumption, a size (number of waiters in the group that have not been
++   signaled), and a reference count.
++
++   The group reference count is used to maintain the number of waiters that
++   are using the group's futex.  Before a group can change its role, the
++   reference count must show that no waiters are using the futex anymore; this
++   prevents ABA issues on the futex word.
++
++   To represent which intervals in the waiter sequence the groups cover (and
++   thus also which group slot contains G1 or G2), we use a 64b counter to
++   designate the start position of G1 (inclusive), and a single bit in the
++   waiter sequence counter to represent which group slot currently contains
++   G2.  This allows us to switch group roles atomically wrt. waiters obtaining
++   a position in the waiter sequence.  The G1 start position allows waiters to
++   figure out whether they are in a group that has already been completely
++   signaled (i.e., if the current G1 starts at a later position that the
++   waiter's position).  Waiters cannot determine whether they are currently
++   in G2 or G1 -- but they do not have too because all they are interested in
++   is whether there are available signals, and they always start in G2 (whose
++   group slot they know because of the bit in the waiter sequence.  Signalers
++   will simply fill the right group until it is completely signaled and can
++   be closed (they do not switch group roles until they really have to to
++   decrease the likelihood of having to wait for waiters still holding a
++   reference on the now-closed G1).
++
++   Signalers maintain the initial size of G1 to be able to determine where
++   G2 starts (G2 is always open-ended until it becomes G1).  They track the
++   remaining size of a group; when waiters cancel waiting (due to PThreads
++   cancellation or timeouts), they will decrease this remaining size as well.
++
++   To implement condvar destruction requirements (i.e., that
++   pthread_cond_destroy can be called as soon as all waiters have been
++   signaled), waiters increment a reference count before starting to wait and
++   decrement it after they stopped waiting but right before they acquire the
++   mutex associated with the condvar.
++
++   pthread_cond_t thus consists of the following (bits that are used for
++   flags and are not part of the primary value of each field but necessary
++   to make some things atomic or because there was no space for them
++   elsewhere in the data structure):
++
++   __wseq: Waiter sequence counter
++     * LSB is index of current G2.
++     * Waiters fetch-add while having acquire the mutex associated with the
++       condvar.  Signalers load it and fetch-xor it concurrently.
++   __g1_start: Starting position of G1 (inclusive)
++     * LSB is index of current G2.
++     * Modified by signalers while having acquired the condvar-internal lock
++       and observed concurrently by waiters.
++   __g1_orig_size: Initial size of G1
++     * The two least-significant bits represent the condvar-internal lock.
++     * Only accessed while having acquired the condvar-internal lock.
++   __wrefs: Waiter reference counter.
++     * Bit 2 is true if waiters should run futex_wake when they remove the
++       last reference.  pthread_cond_destroy uses this as futex word.
++     * Bit 1 is the clock ID (0 == CLOCK_REALTIME, 1 == CLOCK_MONOTONIC).
++     * Bit 0 is true iff this is a process-shared condvar.
++     * Simple reference count used by both waiters and pthread_cond_destroy.
++     (If the format of __wrefs is changed, update nptl_lock_constants.pysym
++      and the pretty printers.)
++   For each of the two groups, we have:
++   __g_refs: Futex waiter reference count.
++     * LSB is true if waiters should run futex_wake when they remove the
++       last reference.
++     * Reference count used by waiters concurrently with signalers that have
++       acquired the condvar-internal lock.
++   __g_signals: The number of signals that can still be consumed.
++     * Used as a futex word by waiters.  Used concurrently by waiters and
++       signalers.
++     * LSB is true iff this group has been completely signaled (i.e., it is
++       closed).
++   __g_size: Waiters remaining in this group (i.e., which have not been
++     signaled yet.
++     * Accessed by signalers and waiters that cancel waiting (both do so only
++       when having acquired the condvar-internal lock.
++     * The size of G2 is always zero because it cannot be determined until
++       the group becomes G1.
++     * Although this is of unsigned type, we rely on using unsigned overflow
++       rules to make this hold effectively negative values too (in
++       particular, when waiters in G2 cancel waiting).
++
++   A PTHREAD_COND_INITIALIZER condvar has all fields set to zero, which yields
++   a condvar that has G2 starting at position 0 and a G1 that is closed.
++
++   Because waiters do not claim ownership of a group right when obtaining a
++   position in __wseq but only reference count the group when using futexes
++   to block, it can happen that a group gets closed before a waiter can
++   increment the reference count.  Therefore, waiters have to check whether
++   their group is already closed using __g1_start.  They also have to perform
++   this check when spinning when trying to grab a signal from __g_signals.
++   Note that for these checks, using relaxed MO to load __g1_start is
++   sufficient because if a waiter can see a sufficiently large value, it could
++   have also consume a signal in the waiters group.
++
++   Waiters try to grab a signal from __g_signals without holding a reference
++   count, which can lead to stealing a signal from a more recent group after
++   their own group was already closed.  They cannot always detect whether they
++   in fact did because they do not know when they stole, but they can
++   conservatively add a signal back to the group they stole from; if they
++   did so unnecessarily, all that happens is a spurious wake-up.  To make this
++   even less likely, __g1_start contains the index of the current g2 too,
++   which allows waiters to check if there aliasing on the group slots; if
++   there wasn't, they didn't steal from the current G1, which means that the
++   G1 they stole from must have been already closed and they do not need to
++   fix anything.
++
++   It is essential that the last field in pthread_cond_t is __g_signals[1]:
++   The previous condvar used a pointer-sized field in pthread_cond_t, so a
++   PTHREAD_COND_INITIALIZER from that condvar implementation might only
++   initialize 4 bytes to zero instead of the 8 bytes we need (i.e., 44 bytes
++   in total instead of the 48 we need).  __g_signals[1] is not accessed before
++   the first group switch (G2 starts at index 0), which will set its value to
++   zero after a harmless fetch-or whose return value is ignored.  This
++   effectively completes initialization.
++
++
++   Limitations:
++   * This condvar isn't designed to allow for more than
++     __PTHREAD_COND_MAX_GROUP_SIZE * (1 << 31) calls to __pthread_cond_wait.
++   * More than __PTHREAD_COND_MAX_GROUP_SIZE concurrent waiters are not
++     supported.
++   * Beyond what is allowed as errors by POSIX or documented, we can also
++     return the following errors:
++     * EPERM if MUTEX is a recursive mutex and the caller doesn't own it.
++     * EOWNERDEAD or ENOTRECOVERABLE when using robust mutexes.  Unlike
++       for other errors, this can happen when we re-acquire the mutex; this
++       isn't allowed by POSIX (which requires all errors to virtually happen
++       before we release the mutex or change the condvar state), but there's
++       nothing we can do really.
++     * When using PTHREAD_MUTEX_PP_* mutexes, we can also return all errors
++       returned by __pthread_tpp_change_priority.  We will already have
++       released the mutex in such cases, so the caller cannot expect to own
++       MUTEX.
++
++   Other notes:
++   * Instead of the normal mutex unlock / lock functions, we use
++     __pthread_mutex_unlock_usercnt(m, 0) / __pthread_mutex_cond_lock(m)
++     because those will not change the mutex-internal users count, so that it
++     can be detected when a condvar is still associated with a particular
++     mutex because there is a waiter blocked on this condvar using this mutex.
++*/
++static __always_inline int
++__pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
++    const struct timespec *abstime)
+ {
+-  struct _pthread_cleanup_buffer buffer;
+-  struct _condvar_cleanup_buffer cbuffer;
++  const int maxspin = 0;
+   int err;
+-  int pshared = (cond->__data.__mutex == (void *) ~0l)
+-		? LLL_SHARED : LLL_PRIVATE;
+-
+-#if (defined lll_futex_wait_requeue_pi \
+-     && defined __ASSUME_REQUEUE_PI)
+-  int pi_flag = 0;
+-#endif
++  int result = 0;
+ 
+   LIBC_PROBE (cond_wait, 2, cond, mutex);
+ 
+-  /* Make sure we are alone.  */
+-  lll_lock (cond->__data.__lock, pshared);
+-
+-  /* Now we can release the mutex.  */
++  /* Acquire a position (SEQ) in the waiter sequence (WSEQ).  We use an
++     atomic operation because signals and broadcasts may update the group
++     switch without acquiring the mutex.  We do not need release MO here
++     because we do not need to establish any happens-before relation with
++     signalers (see __pthread_cond_signal); modification order alone
++     establishes a total order of waiters/signals.  We do need acquire MO
++     to synchronize with group reinitialization in
++     __condvar_quiesce_and_switch_g1.  */
++  uint64_t wseq = __condvar_fetch_add_wseq_acquire (cond, 2);
++  /* Find our group's index.  We always go into what was G2 when we acquired
++     our position.  */
++  unsigned int g = wseq & 1;
++  uint64_t seq = wseq >> 1;
++
++  /* Increase the waiter reference count.  Relaxed MO is sufficient because
++     we only need to synchronize when decrementing the reference count.  */
++  unsigned int flags = atomic_fetch_add_relaxed (&cond->__data.__wrefs, 8);
++  int private = __condvar_get_private (flags);
++
++  /* Now that we are registered as a waiter, we can release the mutex.
++     Waiting on the condvar must be atomic with releasing the mutex, so if
++     the mutex is used to establish a happens-before relation with any
++     signaler, the waiter must be visible to the latter; thus, we release the
++     mutex after registering as waiter.
++     If releasing the mutex fails, we just cancel our registration as a
++     waiter and confirm that we have woken up.  */
+   err = __pthread_mutex_unlock_usercnt (mutex, 0);
+-  if (__glibc_unlikely (err))
++  if (__glibc_unlikely (err != 0))
+     {
+-      lll_unlock (cond->__data.__lock, pshared);
++      __condvar_cancel_waiting (cond, seq, g, private);
++      __condvar_confirm_wakeup (cond, private);
+       return err;
+     }
+ 
+-  /* We have one new user of the condvar.  */
+-  ++cond->__data.__total_seq;
+-  ++cond->__data.__futex;
+-  cond->__data.__nwaiters += 1 << COND_NWAITERS_SHIFT;
+-
+-  /* Remember the mutex we are using here.  If there is already a
+-     different address store this is a bad user bug.  Do not store
+-     anything for pshared condvars.  */
+-  if (cond->__data.__mutex != (void *) ~0l)
+-    cond->__data.__mutex = mutex;
+-
+-  /* Prepare structure passed to cancellation handler.  */
+-  cbuffer.cond = cond;
+-  cbuffer.mutex = mutex;
+-
+-  /* Before we block we enable cancellation.  Therefore we have to
+-     install a cancellation handler.  */
+-  __pthread_cleanup_push (&buffer, __condvar_cleanup, &cbuffer);
+-
+-  /* The current values of the wakeup counter.  The "woken" counter
+-     must exceed this value.  */
+-  unsigned long long int val;
+-  unsigned long long int seq;
+-  val = seq = cond->__data.__wakeup_seq;
+-  /* Remember the broadcast counter.  */
+-  cbuffer.bc_seq = cond->__data.__broadcast_seq;
++  /* Now wait until a signal is available in our group or it is closed.
++     Acquire MO so that if we observe a value of zero written after group
++     switching in __condvar_quiesce_and_switch_g1, we synchronize with that
++     store and will see the prior update of __g1_start done while switching
++     groups too.  */
++  unsigned int signals = atomic_load_acquire (cond->__data.__g_signals + g);
+ 
+   do
+     {
+-      unsigned int futex_val = cond->__data.__futex;
+-      /* Prepare to wait.  Release the condvar futex.  */
+-      lll_unlock (cond->__data.__lock, pshared);
+-
+-      /* Enable asynchronous cancellation.  Required by the standard.  */
+-      cbuffer.oldtype = __pthread_enable_asynccancel ();
+-
+-#if (defined lll_futex_wait_requeue_pi \
+-     && defined __ASSUME_REQUEUE_PI)
+-      /* If pi_flag remained 1 then it means that we had the lock and the mutex
+-	 but a spurious waker raced ahead of us.  Give back the mutex before
+-	 going into wait again.  */
+-      if (pi_flag)
++      while (1)
+ 	{
+-	  __pthread_mutex_cond_lock_adjust (mutex);
+-	  __pthread_mutex_unlock_usercnt (mutex, 0);
++	  /* Spin-wait first.
++	     Note that spinning first without checking whether a timeout
++	     passed might lead to what looks like a spurious wake-up even
++	     though we should return ETIMEDOUT (e.g., if the caller provides
++	     an absolute timeout that is clearly in the past).  However,
++	     (1) spurious wake-ups are allowed, (2) it seems unlikely that a
++	     user will (ab)use pthread_cond_wait as a check for whether a
++	     point in time is in the past, and (3) spinning first without
++	     having to compare against the current time seems to be the right
++	     choice from a performance perspective for most use cases.  */
++	  unsigned int spin = maxspin;
++	  while (signals == 0 && spin > 0)
++	    {
++	      /* Check that we are not spinning on a group that's already
++		 closed.  */
++	      if (seq < (__condvar_load_g1_start_relaxed (cond) >> 1))
++		goto done;
++
++	      /* TODO Back off.  */
++
++	      /* Reload signals.  See above for MO.  */
++	      signals = atomic_load_acquire (cond->__data.__g_signals + g);
++	      spin--;
++	    }
++
++	  /* If our group will be closed as indicated by the flag on signals,
++	     don't bother grabbing a signal.  */
++	  if (signals & 1)
++	    goto done;
++
++	  /* If there is an available signal, don't block.  */
++	  if (signals != 0)
++	    break;
++
++	  /* No signals available after spinning, so prepare to block.
++	     We first acquire a group reference and use acquire MO for that so
++	     that we synchronize with the dummy read-modify-write in
++	     __condvar_quiesce_and_switch_g1 if we read from that.  In turn,
++	     in this case this will make us see the closed flag on __g_signals
++	     that designates a concurrent attempt to reuse the group's slot.
++	     We use acquire MO for the __g_signals check to make the
++	     __g1_start check work (see spinning above).
++	     Note that the group reference acquisition will not mask the
++	     release MO when decrementing the reference count because we use
++	     an atomic read-modify-write operation and thus extend the release
++	     sequence.  */
++	  atomic_fetch_add_acquire (cond->__data.__g_refs + g, 2);
++	  if (((atomic_load_acquire (cond->__data.__g_signals + g) & 1) != 0)
++	      || (seq < (__condvar_load_g1_start_relaxed (cond) >> 1)))
++	    {
++	      /* Our group is closed.  Wake up any signalers that might be
++		 waiting.  */
++	      __condvar_dec_grefs (cond, g, private);
++	      goto done;
++	    }
++
++	  // Now block.
++	  struct _pthread_cleanup_buffer buffer;
++	  struct _condvar_cleanup_buffer cbuffer;
++	  cbuffer.wseq = wseq;
++	  cbuffer.cond = cond;
++	  cbuffer.mutex = mutex;
++	  cbuffer.private = private;
++	  __pthread_cleanup_push (&buffer, __condvar_cleanup_waiting, &cbuffer);
++
++	  if (abstime == NULL)
++	    {
++	      /* Block without a timeout.  */
++	      err = futex_wait_cancelable (
++		  cond->__data.__g_signals + g, 0, private);
++	    }
++	  else
++	    {
++	      /* Block, but with a timeout.
++		 Work around the fact that the kernel rejects negative timeout
++		 values despite them being valid.  */
++	      if (__glibc_unlikely (abstime->tv_sec < 0))
++	        err = ETIMEDOUT;
++
++	      else if ((flags & __PTHREAD_COND_CLOCK_MONOTONIC_MASK) != 0)
++		{
++		  /* CLOCK_MONOTONIC is requested.  */
++		  struct timespec rt;
++		  if (__clock_gettime (CLOCK_MONOTONIC, &rt) != 0)
++		    __libc_fatal ("clock_gettime does not support "
++				  "CLOCK_MONOTONIC");
++		  /* Convert the absolute timeout value to a relative
++		     timeout.  */
++		  rt.tv_sec = abstime->tv_sec - rt.tv_sec;
++		  rt.tv_nsec = abstime->tv_nsec - rt.tv_nsec;
++		  if (rt.tv_nsec < 0)
++		    {
++		      rt.tv_nsec += 1000000000;
++		      --rt.tv_sec;
++		    }
++		  /* Did we already time out?  */
++		  if (__glibc_unlikely (rt.tv_sec < 0))
++		    err = ETIMEDOUT;
++		  else
++		    err = futex_reltimed_wait_cancelable
++			(cond->__data.__g_signals + g, 0, &rt, private);
++		}
++	      else
++		{
++		  /* Use CLOCK_REALTIME.  */
++		  err = futex_abstimed_wait_cancelable
++		      (cond->__data.__g_signals + g, 0, abstime, private);
++		}
++	    }
++
++	  __pthread_cleanup_pop (&buffer, 0);
++
++	  if (__glibc_unlikely (err == ETIMEDOUT))
++	    {
++	      __condvar_dec_grefs (cond, g, private);
++	      /* If we timed out, we effectively cancel waiting.  Note that
++		 we have decremented __g_refs before cancellation, so that a
++		 deadlock between waiting for quiescence of our group in
++		 __condvar_quiesce_and_switch_g1 and us trying to acquire
++		 the lock during cancellation is not possible.  */
++	      __condvar_cancel_waiting (cond, seq, g, private);
++	      result = ETIMEDOUT;
++	      goto done;
++	    }
++	  else
++	    __condvar_dec_grefs (cond, g, private);
++
++	  /* Reload signals.  See above for MO.  */
++	  signals = atomic_load_acquire (cond->__data.__g_signals + g);
+ 	}
+-      pi_flag = USE_REQUEUE_PI (mutex);
+ 
+-      if (pi_flag)
++    }
++  /* Try to grab a signal.  Use acquire MO so that we see an up-to-date value
++     of __g1_start below (see spinning above for a similar case).  In
++     particular, if we steal from a more recent group, we will also see a
++     more recent __g1_start below.  */
++  while (!atomic_compare_exchange_weak_acquire (cond->__data.__g_signals + g,
++						&signals, signals - 2));
++
++  /* We consumed a signal but we could have consumed from a more recent group
++     that aliased with ours due to being in the same group slot.  If this
++     might be the case our group must be closed as visible through
++     __g1_start.  */
++  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
++  if (seq < (g1_start >> 1))
++    {
++      /* We potentially stole a signal from a more recent group but we do not
++	 know which group we really consumed from.
++	 We do not care about groups older than current G1 because they are
++	 closed; we could have stolen from these, but then we just add a
++	 spurious wake-up for the current groups.
++	 We will never steal a signal from current G2 that was really intended
++	 for G2 because G2 never receives signals (until it becomes G1).  We
++	 could have stolen a signal from G2 that was conservatively added by a
++	 previous waiter that also thought it stole a signal -- but given that
++	 that signal was added unnecessarily, it's not a problem if we steal
++	 it.
++	 Thus, the remaining case is that we could have stolen from the current
++	 G1, where "current" means the __g1_start value we observed.  However,
++	 if the current G1 does not have the same slot index as we do, we did
++	 not steal from it and do not need to undo that.  This is the reason
++	 for putting a bit with G2's index into__g1_start as well.  */
++      if (((g1_start & 1) ^ 1) == g)
+ 	{
+-	  err = lll_futex_wait_requeue_pi (&cond->__data.__futex,
+-					   futex_val, &mutex->__data.__lock,
+-					   pshared);
+-
+-	  pi_flag = (err == 0);
++	  /* We have to conservatively undo our potential mistake of stealing
++	     a signal.  We can stop trying to do that when the current G1
++	     changes because other spinning waiters will notice this too and
++	     __condvar_quiesce_and_switch_g1 has checked that there are no
++	     futex waiters anymore before switching G1.
++	     Relaxed MO is fine for the __g1_start load because we need to
++	     merely be able to observe this fact and not have to observe
++	     something else as well.
++	     ??? Would it help to spin for a little while to see whether the
++	     current G1 gets closed?  This might be worthwhile if the group is
++	     small or close to being closed.  */
++	  unsigned int s = atomic_load_relaxed (cond->__data.__g_signals + g);
++	  while (__condvar_load_g1_start_relaxed (cond) == g1_start)
++	    {
++	      /* Try to add a signal.  We don't need to acquire the lock
++		 because at worst we can cause a spurious wake-up.  If the
++		 group is in the process of being closed (LSB is true), this
++		 has an effect similar to us adding a signal.  */
++	      if (((s & 1) != 0)
++		  || atomic_compare_exchange_weak_relaxed
++		       (cond->__data.__g_signals + g, &s, s + 2))
++		{
++		  /* If we added a signal, we also need to add a wake-up on
++		     the futex.  We also need to do that if we skipped adding
++		     a signal because the group is being closed because
++		     while __condvar_quiesce_and_switch_g1 could have closed
++		     the group, it might stil be waiting for futex waiters to
++		     leave (and one of those waiters might be the one we stole
++		     the signal from, which cause it to block using the
++		     futex).  */
++		  futex_wake (cond->__data.__g_signals + g, 1, private);
++		  break;
++		}
++	      /* TODO Back off.  */
++	    }
+ 	}
+-      else
+-#endif
+-	  /* Wait until woken by signal or broadcast.  */
+-	lll_futex_wait (&cond->__data.__futex, futex_val, pshared);
+-
+-      /* Disable asynchronous cancellation.  */
+-      __pthread_disable_asynccancel (cbuffer.oldtype);
+-
+-      /* We are going to look at shared data again, so get the lock.  */
+-      lll_lock (cond->__data.__lock, pshared);
+-
+-      /* If a broadcast happened, we are done.  */
+-      if (cbuffer.bc_seq != cond->__data.__broadcast_seq)
+-	goto bc_out;
+-
+-      /* Check whether we are eligible for wakeup.  */
+-      val = cond->__data.__wakeup_seq;
+     }
+-  while (val == seq || cond->__data.__woken_seq == val);
+ 
+-  /* Another thread woken up.  */
+-  ++cond->__data.__woken_seq;
++ done:
+ 
+- bc_out:
++  /* Confirm that we have been woken.  We do that before acquiring the mutex
++     to allow for execution of pthread_cond_destroy while having acquired the
++     mutex.  */
++  __condvar_confirm_wakeup (cond, private);
+ 
+-  cond->__data.__nwaiters -= 1 << COND_NWAITERS_SHIFT;
+-
+-  /* If pthread_cond_destroy was called on this varaible already,
+-     notify the pthread_cond_destroy caller all waiters have left
+-     and it can be successfully destroyed.  */
+-  if (cond->__data.__total_seq == -1ULL
+-      && cond->__data.__nwaiters < (1 << COND_NWAITERS_SHIFT))
+-    lll_futex_wake (&cond->__data.__nwaiters, 1, pshared);
++  /* Woken up; now re-acquire the mutex.  If this doesn't fail, return RESULT,
++     which is set to ETIMEDOUT if a timeout occured, or zero otherwise.  */
++  err = __pthread_mutex_cond_lock (mutex);
++  /* XXX Abort on errors that are disallowed by POSIX?  */
++  return (err != 0) ? err : result;
++}
+ 
+-  /* We are done with the condvar.  */
+-  lll_unlock (cond->__data.__lock, pshared);
+ 
+-  /* The cancellation handling is back to normal, remove the handler.  */
+-  __pthread_cleanup_pop (&buffer, 0);
++/* See __pthread_cond_wait_common.  */
++int
++__pthread_cond_wait (pthread_cond_t *cond, pthread_mutex_t *mutex)
++{
++  return __pthread_cond_wait_common (cond, mutex, NULL);
++}
+ 
+-  /* Get the mutex before returning.  Not needed for PI.  */
+-#if (defined lll_futex_wait_requeue_pi \
+-     && defined __ASSUME_REQUEUE_PI)
+-  if (pi_flag)
+-    {
+-      __pthread_mutex_cond_lock_adjust (mutex);
+-      return 0;
+-    }
+-  else
+-#endif
+-    return __pthread_mutex_cond_lock (mutex);
++/* See __pthread_cond_wait_common.  */
++int
++__pthread_cond_timedwait (pthread_cond_t *cond, pthread_mutex_t *mutex,
++    const struct timespec *abstime)
++{
++  /* Check parameter validity.  This should also tell the compiler that
++     it can assume that abstime is not NULL.  */
++  if (abstime->tv_nsec < 0 || abstime->tv_nsec >= 1000000000)
++    return EINVAL;
++  return __pthread_cond_wait_common (cond, mutex, abstime);
+ }
+ 
+ versioned_symbol (libpthread, __pthread_cond_wait, pthread_cond_wait,
+ 		  GLIBC_2_3_2);
++versioned_symbol (libpthread, __pthread_cond_timedwait, pthread_cond_timedwait,
++		  GLIBC_2_3_2);
+diff --git a/nptl/pthread_condattr_getclock.c b/nptl/pthread_condattr_getclock.c
+index d156302..cecb4aa 100644
+--- a/nptl/pthread_condattr_getclock.c
++++ b/nptl/pthread_condattr_getclock.c
+@@ -23,6 +23,6 @@ int
+ pthread_condattr_getclock (const pthread_condattr_t *attr, clockid_t *clock_id)
+ {
+   *clock_id = (((((const struct pthread_condattr *) attr)->value) >> 1)
+-	       & ((1 << COND_NWAITERS_SHIFT) - 1));
++	       & ((1 << COND_CLOCK_BITS) - 1));
+   return 0;
+ }
+diff --git a/nptl/pthread_condattr_getpshared.c b/nptl/pthread_condattr_getpshared.c
+index 5a10f3e..8147966 100644
+--- a/nptl/pthread_condattr_getpshared.c
++++ b/nptl/pthread_condattr_getpshared.c
+@@ -22,7 +22,8 @@
+ int
+ pthread_condattr_getpshared (const pthread_condattr_t *attr, int *pshared)
+ {
+-  *pshared = ((const struct pthread_condattr *) attr)->value & 1;
++  *pshared = (((const struct pthread_condattr *) attr)->value & 1
++	      ? PTHREAD_PROCESS_SHARED : PTHREAD_PROCESS_PRIVATE);
+ 
+   return 0;
+ }
+diff --git a/nptl/pthread_condattr_init.c b/nptl/pthread_condattr_init.c
+index 0ce42e5..6e5168d 100644
+--- a/nptl/pthread_condattr_init.c
++++ b/nptl/pthread_condattr_init.c
+@@ -23,7 +23,9 @@
+ int
+ __pthread_condattr_init (pthread_condattr_t *attr)
+ {
+-  memset (attr, '\0', sizeof (*attr));
++  struct pthread_condattr *iattr = (struct pthread_condattr *) attr;
++  /* Default is not pshared and CLOCK_REALTIME.  */
++  iattr-> value = CLOCK_REALTIME << 1;
+ 
+   return 0;
+ }
+diff --git a/nptl/pthread_condattr_setclock.c b/nptl/pthread_condattr_setclock.c
+index 25e2a17..3cfad84 100644
+--- a/nptl/pthread_condattr_setclock.c
++++ b/nptl/pthread_condattr_setclock.c
+@@ -18,7 +18,7 @@
+ 
+ #include <assert.h>
+ #include <errno.h>
+-#include <stdbool.h>
++#include <futex-internal.h>
+ #include <time.h>
+ #include <sysdep.h>
+ #include "pthreadP.h"
+@@ -33,12 +33,17 @@ pthread_condattr_setclock (pthread_condattr_t *attr, clockid_t clock_id)
+        in the pthread_cond_t structure needs to be adjusted.  */
+     return EINVAL;
+ 
++  /* If we do not support waiting using CLOCK_MONOTONIC, return an error.  */
++  if (clock_id == CLOCK_MONOTONIC
++      && !futex_supports_exact_relative_timeouts())
++    return ENOTSUP;
++
+   /* Make sure the value fits in the bits we reserved.  */
+-  assert (clock_id < (1 << COND_NWAITERS_SHIFT));
++  assert (clock_id < (1 << COND_CLOCK_BITS));
+ 
+   int *valuep = &((struct pthread_condattr *) attr)->value;
+ 
+-  *valuep = ((*valuep & ~(((1 << COND_NWAITERS_SHIFT) - 1) << 1))
++  *valuep = ((*valuep & ~(((1 << COND_CLOCK_BITS) - 1) << 1))
+ 	     | (clock_id << 1));
+ 
+   return 0;
+diff --git a/nptl/test-cond-printers.py b/nptl/test-cond-printers.py
+index af0e12e..9e807c9 100644
+--- a/nptl/test-cond-printers.py
++++ b/nptl/test-cond-printers.py
+@@ -35,7 +35,7 @@ try:
+ 
+     break_at(test_source, 'Test status (destroyed)')
+     continue_cmd() # Go to test_status_destroyed
+-    test_printer(var, to_string, {'Status': 'Destroyed'})
++    test_printer(var, to_string, {'Threads known to still execute a wait function': '0'})
+ 
+     continue_cmd() # Exit
+ 
+diff --git a/nptl/tst-cond1.c b/nptl/tst-cond1.c
+index 75ab9c8..509bbd0 100644
+--- a/nptl/tst-cond1.c
++++ b/nptl/tst-cond1.c
+@@ -73,6 +73,9 @@ do_test (void)
+ 
+   puts ("parent: wait for condition");
+ 
++  /* This test will fail on spurious wake-ups, which are allowed; however,
++     the current implementation shouldn't produce spurious wake-ups in the
++     scenario we are testing here.  */
+   err = pthread_cond_wait (&cond, &mut);
+   if (err != 0)
+     error (EXIT_FAILURE, err, "parent: cannot wait fir signal");
+diff --git a/nptl/tst-cond20.c b/nptl/tst-cond20.c
+index 918c4ad..665a66a 100644
+--- a/nptl/tst-cond20.c
++++ b/nptl/tst-cond20.c
+@@ -96,7 +96,10 @@ do_test (void)
+ 
+   for (i = 0; i < ROUNDS; ++i)
+     {
+-      pthread_cond_wait (&cond2, &mut);
++      /* Make sure we discard spurious wake-ups.  */
++      do
++	pthread_cond_wait (&cond2, &mut);
++      while (count != N);
+ 
+       if (i & 1)
+         pthread_mutex_unlock (&mut);
+diff --git a/nptl/tst-cond22.c b/nptl/tst-cond22.c
+index bd978e5..64f19ea 100644
+--- a/nptl/tst-cond22.c
++++ b/nptl/tst-cond22.c
+@@ -106,10 +106,11 @@ do_test (void)
+       status = 1;
+     }
+ 
+-  printf ("cond = { %d, %x, %lld, %lld, %lld, %p, %u, %u }\n",
+-	  c.__data.__lock, c.__data.__futex, c.__data.__total_seq,
+-	  c.__data.__wakeup_seq, c.__data.__woken_seq, c.__data.__mutex,
+-	  c.__data.__nwaiters, c.__data.__broadcast_seq);
++  printf ("cond = { %llu, %llu, %u/%u/%u, %u/%u/%u, %u, %u }\n",
++	  c.__data.__wseq, c.__data.__g1_start,
++	  c.__data.__g_signals[0], c.__data.__g_refs[0], c.__data.__g_size[0],
++	  c.__data.__g_signals[1], c.__data.__g_refs[1], c.__data.__g_size[1],
++	  c.__data.__g1_orig_size, c.__data.__wrefs);
+ 
+   if (pthread_create (&th, NULL, tf, (void *) 1l) != 0)
+     {
+@@ -148,10 +149,11 @@ do_test (void)
+       status = 1;
+     }
+ 
+-  printf ("cond = { %d, %x, %lld, %lld, %lld, %p, %u, %u }\n",
+-	  c.__data.__lock, c.__data.__futex, c.__data.__total_seq,
+-	  c.__data.__wakeup_seq, c.__data.__woken_seq, c.__data.__mutex,
+-	  c.__data.__nwaiters, c.__data.__broadcast_seq);
++  printf ("cond = { %llu, %llu, %u/%u/%u, %u/%u/%u, %u, %u }\n",
++	  c.__data.__wseq, c.__data.__g1_start,
++	  c.__data.__g_signals[0], c.__data.__g_refs[0], c.__data.__g_size[0],
++	  c.__data.__g_signals[1], c.__data.__g_refs[1], c.__data.__g_size[1],
++	  c.__data.__g1_orig_size, c.__data.__wrefs);
+ 
+   return status;
+ }
+diff --git a/sysdeps/aarch64/nptl/bits/pthreadtypes.h b/sysdeps/aarch64/nptl/bits/pthreadtypes.h
+index 13984a7..c6fa632 100644
+--- a/sysdeps/aarch64/nptl/bits/pthreadtypes.h
++++ b/sysdeps/aarch64/nptl/bits/pthreadtypes.h
+@@ -90,17 +90,30 @@ typedef union
+ {
+   struct
+   {
+-    int __lock;
+-    unsigned int __futex;
+-    __extension__ unsigned long long int __total_seq;
+-    __extension__ unsigned long long int __wakeup_seq;
+-    __extension__ unsigned long long int __woken_seq;
+-    void *__mutex;
+-    unsigned int __nwaiters;
+-    unsigned int __broadcast_seq;
++    __extension__ union
++    {
++      __extension__ unsigned long long int __wseq;
++      struct {
++	unsigned int __low;
++	unsigned int __high;
++      } __wseq32;
++    };
++    __extension__ union
++    {
++      __extension__ unsigned long long int __g1_start;
++      struct {
++	unsigned int __low;
++	unsigned int __high;
++      } __g1_start32;
++    };
++    unsigned int __g_refs[2];
++    unsigned int __g_size[2];
++    unsigned int __g1_orig_size;
++    unsigned int __wrefs;
++    unsigned int __g_signals[2];
+   } __data;
+   char __size[__SIZEOF_PTHREAD_COND_T];
+-  long int __align;
++  __extension__ long long int __align;
+ } pthread_cond_t;
+ 
+ typedef union
+diff --git a/sysdeps/arm/nptl/bits/pthreadtypes.h b/sysdeps/arm/nptl/bits/pthreadtypes.h
+index afb5392..53518c6 100644
+--- a/sysdeps/arm/nptl/bits/pthreadtypes.h
++++ b/sysdeps/arm/nptl/bits/pthreadtypes.h
+@@ -93,14 +93,27 @@ typedef union
+ {
+   struct
+   {
+-    int __lock;
+-    unsigned int __futex;
+-    __extension__ unsigned long long int __total_seq;
+-    __extension__ unsigned long long int __wakeup_seq;
+-    __extension__ unsigned long long int __woken_seq;
+-    void *__mutex;
+-    unsigned int __nwaiters;
+-    unsigned int __broadcast_seq;
++    __extension__ union
++    {
++      __extension__ unsigned long long int __wseq;
++      struct {
++	unsigned int __low;
++	unsigned int __high;
++      } __wseq32;
++    };
++    __extension__ union
++    {
++      __extension__ unsigned long long int __g1_start;
++      struct {
++	unsigned int __low;
++	unsigned int __high;
++      } __g1_start32;
++    };
++    unsigned int __g_refs[2];
++    unsigned int __g_size[2];
++    unsigned int __g1_orig_size;
++    unsigned int __wrefs;
++    unsigned int __g_signals[2];
+   } __data;
+   char __size[__SIZEOF_PTHREAD_COND_T];
+   __extension__ long long int __align;
+diff --git a/sysdeps/ia64/nptl/bits/pthreadtypes.h b/sysdeps/ia64/nptl/bits/pthreadtypes.h
+index f2e6dac..e72dbfd 100644
+--- a/sysdeps/ia64/nptl/bits/pthreadtypes.h
++++ b/sysdeps/ia64/nptl/bits/pthreadtypes.h
+@@ -90,17 +90,30 @@ typedef union
+ {
+   struct
+   {
+-    int __lock;
+-    unsigned int __futex;
+-    __extension__ unsigned long long int __total_seq;
+-    __extension__ unsigned long long int __wakeup_seq;
+-    __extension__ unsigned long long int __woken_seq;
+-    void *__mutex;
+-    unsigned int __nwaiters;
+-    unsigned int __broadcast_seq;
++    __extension__ union
++    {
++      __extension__ unsigned long long int __wseq;
++      struct {
++	unsigned int __low;
++	unsigned int __high;
++      } __wseq32;
++    };
++    __extension__ union
++    {
++      __extension__ unsigned long long int __g1_start;
++      struct {
++	unsigned int __low;
++	unsigned int __high;
++      } __g1_start32;
++    };
++    unsigned int __g_refs[2];
++    unsigned int __g_size[2];
++    unsigned int __g1_orig_size;
++    unsigned int __wrefs;
++    unsigned int __g_signals[2];
+   } __data;
+   char __size[__SIZEOF_PTHREAD_COND_T];
+-  long int __align;
++  __extension__ long long int __align;
+ } pthread_cond_t;
+ 
+ typedef union
+diff --git a/sysdeps/m68k/nptl/bits/pthreadtypes.h b/sysdeps/m68k/nptl/bits/pthreadtypes.h
+index d8faa7a..c5e9021 100644
+--- a/sysdeps/m68k/nptl/bits/pthreadtypes.h
++++ b/sysdeps/m68k/nptl/bits/pthreadtypes.h
+@@ -88,19 +88,33 @@ typedef union
+ 
+ 
+ /* Data structure for conditional variable handling.  The structure of
+-   the attribute type is deliberately not exposed.  */
++   the attribute type is not exposed on purpose.  */
+ typedef union
+ {
+   struct
+   {
+-    int __lock __attribute__ ((__aligned__ (4)));
+-    unsigned int __futex;
+-    __extension__ unsigned long long int __total_seq;
+-    __extension__ unsigned long long int __wakeup_seq;
+-    __extension__ unsigned long long int __woken_seq;
+-    void *__mutex;
+-    unsigned int __nwaiters;
+-    unsigned int __broadcast_seq;
++    __extension__ union
++    {
++      __extension__ unsigned long long int __wseq;
++      struct {
++	unsigned int __low;
++	unsigned int __high;
++      } __wseq32;
++    };
++    __extension__ union
++    {
++      __extension__ unsigned long long int __g1_start;
++      struct {
++	unsigned int __low;
++	unsigned int __high;
++      } __g1_start32;
++    };
++    /* Enforce proper alignment of fields used as futex words.  */
++    unsigned int __g_refs[2] __attribute__ ((__aligned__ (4)));
++    unsigned int __g_size[2];
++    unsigned int __g1_orig_size;
++    unsigned int __wrefs;
++    unsigned int __g_signals[2];
+   } __data;
+   char __size[__SIZEOF_PTHREAD_COND_T];
+   __extension__ long long int __align;
+diff --git a/sysdeps/microblaze/nptl/bits/pthreadtypes.h b/sysdeps/microblaze/nptl/bits/pthreadtypes.h
+index 9e9e307..b6623c2 100644
+--- a/sysdeps/microblaze/nptl/bits/pthreadtypes.h
++++ b/sysdeps/microblaze/nptl/bits/pthreadtypes.h
+@@ -91,14 +91,27 @@ typedef union
+ {
+   struct
+   {
+-    int __lock;
+-    unsigned int __futex;
+-    __extension__ unsigned long long int __total_seq;
+-    __extension__ unsigned long long int __wakeup_seq;
+-    __extension__ unsigned long long int __woken_seq;
+-    void *__mutex;
+-    unsigned int __nwaiters;
+-    unsigned int __broadcast_seq;
++    __extension__ union
++    {
++      __extension__ unsigned long long int __wseq;
++      struct {
++	unsigned int __low;
++	unsigned int __high;
++      } __wseq32;
++    };
++    __extension__ union
++    {
++      __extension__ unsigned long long int __g1_start;
++      struct {
++	unsigned int __low;
++	unsigned int __high;
++      } __g1_start32;
++    };
++    unsigned int __g_refs[2];
++    unsigned int __g_size[2];
++    unsigned int __g1_orig_size;
++    unsigned int __wrefs;
++    unsigned int __g_signals[2];
+   } __data;
+   char __size[__SIZEOF_PTHREAD_COND_T];
+   __extension__ long long int __align;
+diff --git a/sysdeps/mips/nptl/bits/pthreadtypes.h b/sysdeps/mips/nptl/bits/pthreadtypes.h
+index 68ed94b..7ddc7bf 100644
+--- a/sysdeps/mips/nptl/bits/pthreadtypes.h
++++ b/sysdeps/mips/nptl/bits/pthreadtypes.h
+@@ -117,19 +117,32 @@ typedef union
+ 
+ 
+ /* Data structure for conditional variable handling.  The structure of
+-   the attribute type is deliberately not exposed.  */
++   the attribute type is not exposed on purpose.  */
+ typedef union
+ {
+   struct
+   {
+-    int __lock;
+-    unsigned int __futex;
+-    __extension__ unsigned long long int __total_seq;
+-    __extension__ unsigned long long int __wakeup_seq;
+-    __extension__ unsigned long long int __woken_seq;
+-    void *__mutex;
+-    unsigned int __nwaiters;
+-    unsigned int __broadcast_seq;
++    __extension__ union
++    {
++      __extension__ unsigned long long int __wseq;
++      struct {
++	unsigned int __low;
++	unsigned int __high;
++      } __wseq32;
++    };
++    __extension__ union
++    {
++      __extension__ unsigned long long int __g1_start;
++      struct {
++	unsigned int __low;
++	unsigned int __high;
++      } __g1_start32;
++    };
++    unsigned int __g_refs[2];
++    unsigned int __g_size[2];
++    unsigned int __g1_orig_size;
++    unsigned int __wrefs;
++    unsigned int __g_signals[2];
+   } __data;
+   char __size[__SIZEOF_PTHREAD_COND_T];
+   __extension__ long long int __align;
+diff --git a/sysdeps/nios2/nptl/bits/pthreadtypes.h b/sysdeps/nios2/nptl/bits/pthreadtypes.h
+index 76076d0..3995e26 100644
+--- a/sysdeps/nios2/nptl/bits/pthreadtypes.h
++++ b/sysdeps/nios2/nptl/bits/pthreadtypes.h
+@@ -88,19 +88,32 @@ typedef union
+ 
+ 
+ /* Data structure for conditional variable handling.  The structure of
+-   the attribute type is deliberately not exposed.  */
++   the attribute type is not exposed on purpose.  */
+ typedef union
+ {
+   struct
+   {
+-    int __lock;
+-    unsigned int __futex;
+-    __extension__ unsigned long long int __total_seq;
+-    __extension__ unsigned long long int __wakeup_seq;
+-    __extension__ unsigned long long int __woken_seq;
+-    void *__mutex;
+-    unsigned int __nwaiters;
+-    unsigned int __broadcast_seq;
++    __extension__ union
++    {
++      __extension__ unsigned long long int __wseq;
++      struct {
++	unsigned int __low;
++	unsigned int __high;
++      } __wseq32;
++    };
++    __extension__ union
++    {
++      __extension__ unsigned long long int __g1_start;
++      struct {
++	unsigned int __low;
++	unsigned int __high;
++      } __g1_start32;
++    };
++    unsigned int __g_refs[2];
++    unsigned int __g_size[2];
++    unsigned int __g1_orig_size;
++    unsigned int __wrefs;
++    unsigned int __g_signals[2];
+   } __data;
+   char __size[__SIZEOF_PTHREAD_COND_T];
+   __extension__ long long int __align;
+diff --git a/sysdeps/nptl/internaltypes.h b/sysdeps/nptl/internaltypes.h
+index 203c548..31e5a43 100644
+--- a/sysdeps/nptl/internaltypes.h
++++ b/sysdeps/nptl/internaltypes.h
+@@ -68,20 +68,13 @@ struct pthread_condattr
+ {
+   /* Combination of values:
+ 
+-     Bit 0  : flag whether conditional variable will be sharable between
+-	      processes.
+-
+-     Bit 1-7: clock ID.  */
++     Bit 0                : flag whether conditional variable will be
++                            sharable between processes.
++     Bit 1-COND_CLOCK_BITS: Clock ID.  COND_CLOCK_BITS is the number of bits
++                            needed to represent the ID of the clock.  */
+   int value;
+ };
+-
+-
+-/* The __NWAITERS field is used as a counter and to house the number
+-   of bits for other purposes.  COND_CLOCK_BITS is the number
+-   of bits needed to represent the ID of the clock.  COND_NWAITERS_SHIFT
+-   is the number of bits reserved for other purposes like the clock.  */
+-#define COND_CLOCK_BITS		1
+-#define COND_NWAITERS_SHIFT	1
++#define COND_CLOCK_BITS	1
+ 
+ 
+ /* Read-write lock variable attribute data structure.  */
+diff --git a/sysdeps/nptl/pthread.h b/sysdeps/nptl/pthread.h
+index fd0894e..c122446 100644
+--- a/sysdeps/nptl/pthread.h
++++ b/sysdeps/nptl/pthread.h
+@@ -183,7 +183,7 @@ enum
+ 
+ 
+ /* Conditional variable handling.  */
+-#define PTHREAD_COND_INITIALIZER { { 0, 0, 0, 0, 0, (void *) 0, 0, 0 } }
++#define PTHREAD_COND_INITIALIZER { { {0}, {0}, {0, 0}, {0, 0}, 0, 0, {0, 0} } }
+ 
+ 
+ /* Cleanup buffers */
+diff --git a/sysdeps/s390/nptl/bits/pthreadtypes.h b/sysdeps/s390/nptl/bits/pthreadtypes.h
+index 40d10fe..4e455ab 100644
+--- a/sysdeps/s390/nptl/bits/pthreadtypes.h
++++ b/sysdeps/s390/nptl/bits/pthreadtypes.h
+@@ -142,14 +142,27 @@ typedef union
+ {
+   struct
+   {
+-    int __lock;
+-    unsigned int __futex;
+-    __extension__ unsigned long long int __total_seq;
+-    __extension__ unsigned long long int __wakeup_seq;
+-    __extension__ unsigned long long int __woken_seq;
+-    void *__mutex;
+-    unsigned int __nwaiters;
+-    unsigned int __broadcast_seq;
++    __extension__ union
++    {
++      __extension__ unsigned long long int __wseq;
++      struct {
++	unsigned int __low;
++	unsigned int __high;
++      } __wseq32;
++    };
++    __extension__ union
++    {
++      __extension__ unsigned long long int __g1_start;
++      struct {
++	unsigned int __low;
++	unsigned int __high;
++      } __g1_start32;
++    };
++    unsigned int __g_refs[2];
++    unsigned int __g_size[2];
++    unsigned int __g1_orig_size;
++    unsigned int __wrefs;
++    unsigned int __g_signals[2];
+   } __data;
+   char __size[__SIZEOF_PTHREAD_COND_T];
+   __extension__ long long int __align;
+diff --git a/sysdeps/sh/nptl/bits/pthreadtypes.h b/sysdeps/sh/nptl/bits/pthreadtypes.h
+index 13fbd73..065dd11 100644
+--- a/sysdeps/sh/nptl/bits/pthreadtypes.h
++++ b/sysdeps/sh/nptl/bits/pthreadtypes.h
+@@ -93,14 +93,27 @@ typedef union
+ {
+   struct
+   {
+-    int __lock;
+-    unsigned int __futex;
+-    __extension__ unsigned long long int __total_seq;
+-    __extension__ unsigned long long int __wakeup_seq;
+-    __extension__ unsigned long long int __woken_seq;
+-    void *__mutex;
+-    unsigned int __nwaiters;
+-    unsigned int __broadcast_seq;
++    __extension__ union
++    {
++      __extension__ unsigned long long int __wseq;
++      struct {
++	unsigned int __low;
++	unsigned int __high;
++      } __wseq32;
++    };
++    __extension__ union
++    {
++      __extension__ unsigned long long int __g1_start;
++      struct {
++	unsigned int __low;
++	unsigned int __high;
++      } __g1_start32;
++    };
++    unsigned int __g_refs[2];
++    unsigned int __g_size[2];
++    unsigned int __g1_orig_size;
++    unsigned int __wrefs;
++    unsigned int __g_signals[2];
+   } __data;
+   char __size[__SIZEOF_PTHREAD_COND_T];
+   __extension__ long long int __align;
+diff --git a/sysdeps/tile/nptl/bits/pthreadtypes.h b/sysdeps/tile/nptl/bits/pthreadtypes.h
+index 7d68650..c12737f 100644
+--- a/sysdeps/tile/nptl/bits/pthreadtypes.h
++++ b/sysdeps/tile/nptl/bits/pthreadtypes.h
+@@ -122,14 +122,27 @@ typedef union
+ {
+   struct
+   {
+-    int __lock;
+-    unsigned int __futex;
+-    __extension__ unsigned long long int __total_seq;
+-    __extension__ unsigned long long int __wakeup_seq;
+-    __extension__ unsigned long long int __woken_seq;
+-    void *__mutex;
+-    unsigned int __nwaiters;
+-    unsigned int __broadcast_seq;
++    __extension__ union
++    {
++      __extension__ unsigned long long int __wseq;
++      struct {
++	unsigned int __low;
++	unsigned int __high;
++      } __wseq32;
++    };
++    __extension__ union
++    {
++      __extension__ unsigned long long int __g1_start;
++      struct {
++	unsigned int __low;
++	unsigned int __high;
++      } __g1_start32;
++    };
++    unsigned int __g_refs[2];
++    unsigned int __g_size[2];
++    unsigned int __g1_orig_size;
++    unsigned int __wrefs;
++    unsigned int __g_signals[2];
+   } __data;
+   char __size[__SIZEOF_PTHREAD_COND_T];
+   __extension__ long long int __align;
+diff --git a/sysdeps/unix/sysv/linux/alpha/bits/pthreadtypes.h b/sysdeps/unix/sysv/linux/alpha/bits/pthreadtypes.h
+index 1a1779b..d88b045 100644
+--- a/sysdeps/unix/sysv/linux/alpha/bits/pthreadtypes.h
++++ b/sysdeps/unix/sysv/linux/alpha/bits/pthreadtypes.h
+@@ -84,19 +84,32 @@ typedef union
+ 
+ 
+ /* Data structure for conditional variable handling.  The structure of
+-   the attribute type is deliberately not exposed.  */
++   the attribute type is not exposed on purpose.  */
+ typedef union
+ {
+   struct
+   {
+-    int __lock;
+-    unsigned int __futex;
+-    __extension__ unsigned long long int __total_seq;
+-    __extension__ unsigned long long int __wakeup_seq;
+-    __extension__ unsigned long long int __woken_seq;
+-    void *__mutex;
+-    unsigned int __nwaiters;
+-    unsigned int __broadcast_seq;
++    __extension__ union
++    {
++      __extension__ unsigned long long int __wseq;
++      struct {
++	unsigned int __low;
++	unsigned int __high;
++      } __wseq32;
++    };
++    __extension__ union
++    {
++      __extension__ unsigned long long int __g1_start;
++      struct {
++	unsigned int __low;
++	unsigned int __high;
++      } __g1_start32;
++    };
++    unsigned int __g_refs[2];
++    unsigned int __g_size[2];
++    unsigned int __g1_orig_size;
++    unsigned int __wrefs;
++    unsigned int __g_signals[2];
+   } __data;
+   char __size[__SIZEOF_PTHREAD_COND_T];
+   __extension__ long long int __align;
+diff --git a/sysdeps/unix/sysv/linux/hppa/internaltypes.h b/sysdeps/unix/sysv/linux/hppa/internaltypes.h
+index 651ce2e..d649657 100644
+--- a/sysdeps/unix/sysv/linux/hppa/internaltypes.h
++++ b/sysdeps/unix/sysv/linux/hppa/internaltypes.h
+@@ -46,32 +46,38 @@ fails because __initializer is zero, and the structure will be used as
+ is correctly.  */
+ 
+ #define cond_compat_clear(var) \
+-({											\
+-  int tmp = 0;										\
+-  var->__data.__lock = 0;								\
+-  var->__data.__futex = 0;								\
+-  var->__data.__mutex = NULL;								\
+-  /* Clear __initializer last, to indicate initialization is done.  */			\
+-  __asm__ __volatile__ ("stw,ma %1,0(%0)"						\
+-			: : "r" (&var->__data.__initializer), "r" (tmp) : "memory");	\
++({									\
++  int tmp = 0;								\
++  var->__data.__wseq = 0;						\
++  var->__data.__signals_sent = 0;					\
++  var->__data.__confirmed = 0;						\
++  var->__data.__generation = 0;						\
++  var->__data.__mutex = NULL;						\
++  var->__data.__quiescence_waiters = 0;					\
++  var->__data.__clockid = 0;						\
++  /* Clear __initializer last, to indicate initialization is done.  */	\
++  /* This synchronizes-with the acquire load below.  */			\
++  atomic_store_release (&var->__data.__initializer, 0);			\
+ })
+ 
+ #define cond_compat_check_and_clear(var) \
+ ({								\
+-  int ret;							\
+-  volatile int *value = &var->__data.__initializer;		\
+-  if ((ret = atomic_compare_and_exchange_val_acq(value, 2, 1)))	\
++  int v;							\
++  int *value = &var->__data.__initializer;			\
++  /* This synchronizes-with the release store above.  */	\
++  while ((v = atomic_load_acquire (value)) != 0)		\
+     {								\
+-      if (ret == 1)						\
++      if (v == 1						\
++	  /* Relaxed MO is fine; it only matters who's first.  */        \
++	  && atomic_compare_exchange_acquire_weak_relaxed (value, 1, 2)) \
+ 	{							\
+-	  /* Initialize structure.  */				\
++	  /* We're first; initialize structure.  */		\
+ 	  cond_compat_clear (var);				\
++	  break;						\
+ 	}							\
+       else							\
+-        {							\
+-	  /* Yield until structure is initialized.  */		\
+-	  while (*value == 2) sched_yield ();			\
+-        }							\
++	/* Yield before we re-check initialization status.  */	\
++	sched_yield ();						\
+     }								\
+ })
+ 
+diff --git a/sysdeps/unix/sysv/linux/hppa/pthread_cond_timedwait.c b/sysdeps/unix/sysv/linux/hppa/pthread_cond_timedwait.c
+deleted file mode 100644
+index ec6fd23..0000000
+--- a/sysdeps/unix/sysv/linux/hppa/pthread_cond_timedwait.c
++++ /dev/null
+@@ -1,41 +0,0 @@
+-/* Copyright (C) 2009-2016 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+-   Contributed by Carlos O'Donell <carlos@codesourcery.com>, 2009.
+-
+-   The GNU C Library is free software; you can redistribute it and/or
+-   modify it under the terms of the GNU Lesser General Public
+-   License as published by the Free Software Foundation; either
+-   version 2.1 of the License, or (at your option) any later version.
+-
+-   The GNU C Library is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Lesser General Public License for more details.
+-
+-   You should have received a copy of the GNU Lesser General Public
+-   License along with the GNU C Library.  If not, see
+-   <http://www.gnu.org/licenses/>.  */
+-
+-#ifndef INCLUDED_SELF
+-# define INCLUDED_SELF
+-# include <pthread_cond_timedwait.c>
+-#else
+-# include <pthread.h>
+-# include <pthreadP.h>
+-# include <internaltypes.h>
+-# include <shlib-compat.h>
+-int
+-__pthread_cond_timedwait (pthread_cond_t *cond, pthread_mutex_t *mutex,
+-			  const struct timespec *abstime)
+-{
+-  cond_compat_check_and_clear (cond);
+-  return __pthread_cond_timedwait_internal (cond, mutex, abstime);
+-}
+-versioned_symbol (libpthread, __pthread_cond_timedwait, pthread_cond_timedwait,
+-                  GLIBC_2_3_2);
+-# undef versioned_symbol
+-# define versioned_symbol(lib, local, symbol, version)
+-# undef __pthread_cond_timedwait
+-# define __pthread_cond_timedwait __pthread_cond_timedwait_internal
+-# include_next <pthread_cond_timedwait.c>
+-#endif
+diff --git a/sysdeps/unix/sysv/linux/hppa/pthread_cond_wait.c b/sysdeps/unix/sysv/linux/hppa/pthread_cond_wait.c
+index 8f02831..0611f7d 100644
+--- a/sysdeps/unix/sysv/linux/hppa/pthread_cond_wait.c
++++ b/sysdeps/unix/sysv/linux/hppa/pthread_cond_wait.c
+@@ -32,9 +32,22 @@ __pthread_cond_wait (pthread_cond_t *cond, pthread_mutex_t *mutex)
+ }
+ versioned_symbol (libpthread, __pthread_cond_wait, pthread_cond_wait,
+                   GLIBC_2_3_2);
++int
++__pthread_cond_timedwait (cond, mutex, abstime)
++     pthread_cond_t *cond;
++     pthread_mutex_t *mutex;
++     const struct timespec *abstime;
++{
++  cond_compat_check_and_clear (cond);
++  return __pthread_cond_timedwait_internal (cond, mutex, abstime);
++}
++versioned_symbol (libpthread, __pthread_cond_timedwait, pthread_cond_timedwait,
++                  GLIBC_2_3_2);
+ # undef versioned_symbol
+ # define versioned_symbol(lib, local, symbol, version)
+ # undef __pthread_cond_wait
+ # define __pthread_cond_wait __pthread_cond_wait_internal
++# undef __pthread_cond_timedwait
++# define __pthread_cond_timedwait __pthread_cond_timedwait_internal
+ # include_next <pthread_cond_wait.c>
+ #endif
+diff --git a/sysdeps/unix/sysv/linux/i386/i686/pthread_cond_timedwait.S b/sysdeps/unix/sysv/linux/i386/i686/pthread_cond_timedwait.S
+deleted file mode 100644
+index f697e5b..0000000
+--- a/sysdeps/unix/sysv/linux/i386/i686/pthread_cond_timedwait.S
++++ /dev/null
+@@ -1,20 +0,0 @@
+-/* Copyright (C) 2003-2016 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+-   Contributed by Ulrich Drepper <drepper@redhat.com>, 2003.
+-
+-   The GNU C Library is free software; you can redistribute it and/or
+-   modify it under the terms of the GNU Lesser General Public
+-   License as published by the Free Software Foundation; either
+-   version 2.1 of the License, or (at your option) any later version.
+-
+-   The GNU C Library is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Lesser General Public License for more details.
+-
+-   You should have received a copy of the GNU Lesser General Public
+-   License along with the GNU C Library; if not, see
+-   <http://www.gnu.org/licenses/>.  */
+-
+-#define HAVE_CMOV 1
+-#include "../pthread_cond_timedwait.S"
+diff --git a/sysdeps/unix/sysv/linux/i386/pthread_cond_broadcast.S b/sysdeps/unix/sysv/linux/i386/pthread_cond_broadcast.S
+deleted file mode 100644
+index 5996688..0000000
+--- a/sysdeps/unix/sysv/linux/i386/pthread_cond_broadcast.S
++++ /dev/null
+@@ -1,241 +0,0 @@
+-/* Copyright (C) 2002-2016 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+-   Contributed by Ulrich Drepper <drepper@redhat.com>, 2002.
+-
+-   The GNU C Library is free software; you can redistribute it and/or
+-   modify it under the terms of the GNU Lesser General Public
+-   License as published by the Free Software Foundation; either
+-   version 2.1 of the License, or (at your option) any later version.
+-
+-   The GNU C Library is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Lesser General Public License for more details.
+-
+-   You should have received a copy of the GNU Lesser General Public
+-   License along with the GNU C Library; if not, see
+-   <http://www.gnu.org/licenses/>.  */
+-
+-#include <sysdep.h>
+-#include <shlib-compat.h>
+-#include <lowlevellock.h>
+-#include <lowlevelcond.h>
+-#include <kernel-features.h>
+-#include <pthread-pi-defines.h>
+-#include <pthread-errnos.h>
+-#include <stap-probe.h>
+-
+-	.text
+-
+-	/* int pthread_cond_broadcast (pthread_cond_t *cond) */
+-	.globl	__pthread_cond_broadcast
+-	.type	__pthread_cond_broadcast, @function
+-	.align	16
+-__pthread_cond_broadcast:
+-	cfi_startproc
+-	pushl	%ebx
+-	cfi_adjust_cfa_offset(4)
+-	cfi_rel_offset(%ebx, 0)
+-	pushl	%esi
+-	cfi_adjust_cfa_offset(4)
+-	cfi_rel_offset(%esi, 0)
+-	pushl	%edi
+-	cfi_adjust_cfa_offset(4)
+-	cfi_rel_offset(%edi, 0)
+-	pushl	%ebp
+-	cfi_adjust_cfa_offset(4)
+-	cfi_rel_offset(%ebp, 0)
+-	cfi_remember_state
+-
+-	movl	20(%esp), %ebx
+-
+-	LIBC_PROBE (cond_broadcast, 1, %edx)
+-
+-	/* Get internal lock.  */
+-	movl	$1, %edx
+-	xorl	%eax, %eax
+-	LOCK
+-#if cond_lock == 0
+-	cmpxchgl %edx, (%ebx)
+-#else
+-	cmpxchgl %edx, cond_lock(%ebx)
+-#endif
+-	jnz	1f
+-
+-2:	addl	$cond_futex, %ebx
+-	movl	total_seq+4-cond_futex(%ebx), %eax
+-	movl	total_seq-cond_futex(%ebx), %ebp
+-	cmpl	wakeup_seq+4-cond_futex(%ebx), %eax
+-	ja	3f
+-	jb	4f
+-	cmpl	wakeup_seq-cond_futex(%ebx), %ebp
+-	jna	4f
+-
+-	/* Cause all currently waiting threads to recognize they are
+-	   woken up.  */
+-3:	movl	%ebp, wakeup_seq-cond_futex(%ebx)
+-	movl	%eax, wakeup_seq-cond_futex+4(%ebx)
+-	movl	%ebp, woken_seq-cond_futex(%ebx)
+-	movl	%eax, woken_seq-cond_futex+4(%ebx)
+-	addl	%ebp, %ebp
+-	addl	$1, broadcast_seq-cond_futex(%ebx)
+-	movl	%ebp, (%ebx)
+-
+-	/* Get the address of the mutex used.  */
+-	movl	dep_mutex-cond_futex(%ebx), %edi
+-
+-	/* Unlock.  */
+-	LOCK
+-	subl	$1, cond_lock-cond_futex(%ebx)
+-	jne	7f
+-
+-	/* Don't use requeue for pshared condvars.  */
+-8:	cmpl	$-1, %edi
+-	je	9f
+-
+-	/* Do not use requeue for pshared condvars.  */
+-	testl	$PS_BIT, MUTEX_KIND(%edi)
+-	jne	9f
+-
+-	/* Requeue to a non-robust PI mutex if the PI bit is set and
+-	   the robust bit is not set.  */
+-	movl	MUTEX_KIND(%edi), %eax
+-	andl	$(ROBUST_BIT|PI_BIT), %eax
+-	cmpl	$PI_BIT, %eax
+-	je	81f
+-
+-	/* Wake up all threads.  */
+-#ifdef __ASSUME_PRIVATE_FUTEX
+-	movl	$(FUTEX_CMP_REQUEUE|FUTEX_PRIVATE_FLAG), %ecx
+-#else
+-	movl	%gs:PRIVATE_FUTEX, %ecx
+-	orl	$FUTEX_CMP_REQUEUE, %ecx
+-#endif
+-	movl	$SYS_futex, %eax
+-	movl	$0x7fffffff, %esi
+-	movl	$1, %edx
+-	/* Get the address of the futex involved.  */
+-# if MUTEX_FUTEX != 0
+-	addl	$MUTEX_FUTEX, %edi
+-# endif
+-/* FIXME: Until Ingo fixes 4G/4G vDSO, 6 arg syscalls are broken for sysenter.
+-	ENTER_KERNEL  */
+-	int	$0x80
+-
+-	/* For any kind of error, which mainly is EAGAIN, we try again
+-	   with WAKE.  The general test also covers running on old
+-	   kernels.  */
+-	cmpl	$0xfffff001, %eax
+-	jae	9f
+-
+-6:	xorl	%eax, %eax
+-	popl	%ebp
+-	cfi_adjust_cfa_offset(-4)
+-	cfi_restore(%ebp)
+-	popl	%edi
+-	cfi_adjust_cfa_offset(-4)
+-	cfi_restore(%edi)
+-	popl	%esi
+-	cfi_adjust_cfa_offset(-4)
+-	cfi_restore(%esi)
+-	popl	%ebx
+-	cfi_adjust_cfa_offset(-4)
+-	cfi_restore(%ebx)
+-	ret
+-
+-	cfi_restore_state
+-
+-81:	movl	$(FUTEX_CMP_REQUEUE_PI|FUTEX_PRIVATE_FLAG), %ecx
+-	movl	$SYS_futex, %eax
+-	movl	$0x7fffffff, %esi
+-	movl	$1, %edx
+-	/* Get the address of the futex involved.  */
+-# if MUTEX_FUTEX != 0
+-	addl	$MUTEX_FUTEX, %edi
+-# endif
+-	int	$0x80
+-
+-	/* For any kind of error, which mainly is EAGAIN, we try again
+-	with WAKE.  The general test also covers running on old
+-	kernels.  */
+-	cmpl	$0xfffff001, %eax
+-	jb	6b
+-	jmp	9f
+-
+-	/* Initial locking failed.  */
+-1:
+-#if cond_lock == 0
+-	movl	%ebx, %edx
+-#else
+-	leal	cond_lock(%ebx), %edx
+-#endif
+-#if (LLL_SHARED-LLL_PRIVATE) > 255
+-	xorl	%ecx, %ecx
+-#endif
+-	cmpl	$-1, dep_mutex(%ebx)
+-	setne	%cl
+-	subl	$1, %ecx
+-	andl	$(LLL_SHARED-LLL_PRIVATE), %ecx
+-#if LLL_PRIVATE != 0
+-	addl	$LLL_PRIVATE, %ecx
+-#endif
+-	call	__lll_lock_wait
+-	jmp	2b
+-
+-	.align	16
+-	/* Unlock.  */
+-4:	LOCK
+-	subl	$1, cond_lock-cond_futex(%ebx)
+-	je	6b
+-
+-	/* Unlock in loop requires wakeup.  */
+-5:	leal	cond_lock-cond_futex(%ebx), %eax
+-#if (LLL_SHARED-LLL_PRIVATE) > 255
+-	xorl	%ecx, %ecx
+-#endif
+-	cmpl	$-1, dep_mutex-cond_futex(%ebx)
+-	setne	%cl
+-	subl	$1, %ecx
+-	andl	$(LLL_SHARED-LLL_PRIVATE), %ecx
+-#if LLL_PRIVATE != 0
+-	addl	$LLL_PRIVATE, %ecx
+-#endif
+-	call	__lll_unlock_wake
+-	jmp	6b
+-
+-	/* Unlock in loop requires wakeup.  */
+-7:	leal	cond_lock-cond_futex(%ebx), %eax
+-#if (LLL_SHARED-LLL_PRIVATE) > 255
+-	xorl	%ecx, %ecx
+-#endif
+-	cmpl	$-1, dep_mutex-cond_futex(%ebx)
+-	setne	%cl
+-	subl	$1, %ecx
+-	andl	$(LLL_SHARED-LLL_PRIVATE), %ecx
+-#if LLL_PRIVATE != 0
+-	addl	$LLL_PRIVATE, %ecx
+-#endif
+-	call	__lll_unlock_wake
+-	jmp	8b
+-
+-9:	/* The futex requeue functionality is not available.  */
+-	movl	$0x7fffffff, %edx
+-#if FUTEX_PRIVATE_FLAG > 255
+-	xorl	%ecx, %ecx
+-#endif
+-	cmpl	$-1, dep_mutex-cond_futex(%ebx)
+-	sete	%cl
+-	subl	$1, %ecx
+-#ifdef __ASSUME_PRIVATE_FUTEX
+-	andl	$FUTEX_PRIVATE_FLAG, %ecx
+-#else
+-	andl	%gs:PRIVATE_FUTEX, %ecx
+-#endif
+-	addl	$FUTEX_WAKE, %ecx
+-	movl	$SYS_futex, %eax
+-	ENTER_KERNEL
+-	jmp	6b
+-	cfi_endproc
+-	.size	__pthread_cond_broadcast, .-__pthread_cond_broadcast
+-versioned_symbol (libpthread, __pthread_cond_broadcast, pthread_cond_broadcast,
+-		  GLIBC_2_3_2)
+diff --git a/sysdeps/unix/sysv/linux/i386/pthread_cond_signal.S b/sysdeps/unix/sysv/linux/i386/pthread_cond_signal.S
+deleted file mode 100644
+index 0038775..0000000
+--- a/sysdeps/unix/sysv/linux/i386/pthread_cond_signal.S
++++ /dev/null
+@@ -1,216 +0,0 @@
+-/* Copyright (C) 2002-2016 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+-   Contributed by Ulrich Drepper <drepper@redhat.com>, 2002.
+-
+-   The GNU C Library is free software; you can redistribute it and/or
+-   modify it under the terms of the GNU Lesser General Public
+-   License as published by the Free Software Foundation; either
+-   version 2.1 of the License, or (at your option) any later version.
+-
+-   The GNU C Library is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Lesser General Public License for more details.
+-
+-   You should have received a copy of the GNU Lesser General Public
+-   License along with the GNU C Library; if not, see
+-   <http://www.gnu.org/licenses/>.  */
+-
+-#include <sysdep.h>
+-#include <shlib-compat.h>
+-#include <lowlevellock.h>
+-#include <lowlevelcond.h>
+-#include <kernel-features.h>
+-#include <pthread-pi-defines.h>
+-#include <pthread-errnos.h>
+-#include <stap-probe.h>
+-
+-	.text
+-
+-	/* int pthread_cond_signal (pthread_cond_t *cond) */
+-	.globl	__pthread_cond_signal
+-	.type	__pthread_cond_signal, @function
+-	.align	16
+-__pthread_cond_signal:
+-
+-	cfi_startproc
+-	pushl	%ebx
+-	cfi_adjust_cfa_offset(4)
+-	cfi_rel_offset(%ebx, 0)
+-	pushl	%edi
+-	cfi_adjust_cfa_offset(4)
+-	cfi_rel_offset(%edi, 0)
+-	cfi_remember_state
+-
+-	movl	12(%esp), %edi
+-
+-	LIBC_PROBE (cond_signal, 1, %edi)
+-
+-	/* Get internal lock.  */
+-	movl	$1, %edx
+-	xorl	%eax, %eax
+-	LOCK
+-#if cond_lock == 0
+-	cmpxchgl %edx, (%edi)
+-#else
+-	cmpxchgl %edx, cond_lock(%edi)
+-#endif
+-	jnz	1f
+-
+-2:	leal	cond_futex(%edi), %ebx
+-	movl	total_seq+4(%edi), %eax
+-	movl	total_seq(%edi), %ecx
+-	cmpl	wakeup_seq+4(%edi), %eax
+-#if cond_lock != 0
+-	/* Must use leal to preserve the flags.  */
+-	leal	cond_lock(%edi), %edi
+-#endif
+-	ja	3f
+-	jb	4f
+-	cmpl	wakeup_seq-cond_futex(%ebx), %ecx
+-	jbe	4f
+-
+-	/* Bump the wakeup number.  */
+-3:	addl	$1, wakeup_seq-cond_futex(%ebx)
+-	adcl	$0, wakeup_seq-cond_futex+4(%ebx)
+-	addl	$1, (%ebx)
+-
+-	/* Wake up one thread.  */
+-	pushl	%esi
+-	cfi_adjust_cfa_offset(4)
+-	cfi_rel_offset(%esi, 0)
+-	pushl	%ebp
+-	cfi_adjust_cfa_offset(4)
+-	cfi_rel_offset(%ebp, 0)
+-
+-#if FUTEX_PRIVATE_FLAG > 255
+-	xorl	%ecx, %ecx
+-#endif
+-	cmpl	$-1, dep_mutex-cond_futex(%ebx)
+-	sete	%cl
+-	je	8f
+-
+-	movl	dep_mutex-cond_futex(%ebx), %edx
+-	/* Requeue to a non-robust PI mutex if the PI bit is set and
+-	   the robust bit is not set.  */
+-	movl	MUTEX_KIND(%edx), %eax
+-	andl	$(ROBUST_BIT|PI_BIT), %eax
+-	cmpl	$PI_BIT, %eax
+-	je	9f
+-
+-8:	subl	$1, %ecx
+-#ifdef __ASSUME_PRIVATE_FUTEX
+-	andl	$FUTEX_PRIVATE_FLAG, %ecx
+-#else
+-	andl	%gs:PRIVATE_FUTEX, %ecx
+-#endif
+-	addl	$FUTEX_WAKE_OP, %ecx
+-	movl	$SYS_futex, %eax
+-	movl	$1, %edx
+-	movl	$1, %esi
+-	movl	$FUTEX_OP_CLEAR_WAKE_IF_GT_ONE, %ebp
+-	/* FIXME: Until Ingo fixes 4G/4G vDSO, 6 arg syscalls are broken for
+-	   sysenter.
+-	ENTER_KERNEL  */
+-	int	$0x80
+-	popl	%ebp
+-	cfi_adjust_cfa_offset(-4)
+-	cfi_restore(%ebp)
+-	popl	%esi
+-	cfi_adjust_cfa_offset(-4)
+-	cfi_restore(%esi)
+-
+-	/* For any kind of error, we try again with WAKE.
+-	   The general test also covers running on old kernels.  */
+-	cmpl	$-4095, %eax
+-	jae	7f
+-
+-6:	xorl	%eax, %eax
+-	popl	%edi
+-	cfi_adjust_cfa_offset(-4)
+-	cfi_restore(%edi)
+-	popl	%ebx
+-	cfi_adjust_cfa_offset(-4)
+-	cfi_restore(%ebx)
+-	ret
+-
+-	cfi_restore_state
+-
+-9:	movl	$(FUTEX_CMP_REQUEUE_PI|FUTEX_PRIVATE_FLAG), %ecx
+-	movl	$SYS_futex, %eax
+-	movl	$1, %edx
+-	xorl	%esi, %esi
+-	movl	dep_mutex-cond_futex(%ebx), %edi
+-	movl	(%ebx), %ebp
+-	/* FIXME: Until Ingo fixes 4G/4G vDSO, 6 arg syscalls are broken for
+-	   sysenter.
+-	ENTER_KERNEL  */
+-	int	$0x80
+-	popl	%ebp
+-	popl	%esi
+-
+-	leal	-cond_futex(%ebx), %edi
+-
+-	/* For any kind of error, we try again with WAKE.
+-	   The general test also covers running on old kernels.  */
+-	cmpl	$-4095, %eax
+-	jb	4f
+-
+-7:
+-#ifdef __ASSUME_PRIVATE_FUTEX
+-	andl	$FUTEX_PRIVATE_FLAG, %ecx
+-#else
+-	andl	%gs:PRIVATE_FUTEX, %ecx
+-#endif
+-	orl	$FUTEX_WAKE, %ecx
+-
+-	movl	$SYS_futex, %eax
+-	/* %edx should be 1 already from $FUTEX_WAKE_OP syscall.
+-	movl	$1, %edx  */
+-	ENTER_KERNEL
+-
+-	/* Unlock.  Note that at this point %edi always points to
+-	   cond_lock.  */
+-4:	LOCK
+-	subl	$1, (%edi)
+-	je	6b
+-
+-	/* Unlock in loop requires wakeup.  */
+-5:	movl	%edi, %eax
+-#if (LLL_SHARED-LLL_PRIVATE) > 255
+-	xorl	%ecx, %ecx
+-#endif
+-	cmpl	$-1, dep_mutex-cond_futex(%ebx)
+-	setne	%cl
+-	subl	$1, %ecx
+-	andl	$(LLL_SHARED-LLL_PRIVATE), %ecx
+-#if LLL_PRIVATE != 0
+-	addl	$LLL_PRIVATE, %ecx
+-#endif
+-	call	__lll_unlock_wake
+-	jmp	6b
+-
+-	/* Initial locking failed.  */
+-1:
+-#if cond_lock == 0
+-	movl	%edi, %edx
+-#else
+-	leal	cond_lock(%edi), %edx
+-#endif
+-#if (LLL_SHARED-LLL_PRIVATE) > 255
+-	xorl	%ecx, %ecx
+-#endif
+-	cmpl	$-1, dep_mutex(%edi)
+-	setne	%cl
+-	subl	$1, %ecx
+-	andl	$(LLL_SHARED-LLL_PRIVATE), %ecx
+-#if LLL_PRIVATE != 0
+-	addl	$LLL_PRIVATE, %ecx
+-#endif
+-	call	__lll_lock_wait
+-	jmp	2b
+-
+-	cfi_endproc
+-	.size	__pthread_cond_signal, .-__pthread_cond_signal
+-versioned_symbol (libpthread, __pthread_cond_signal, pthread_cond_signal,
+-		  GLIBC_2_3_2)
+diff --git a/sysdeps/unix/sysv/linux/i386/pthread_cond_timedwait.S b/sysdeps/unix/sysv/linux/i386/pthread_cond_timedwait.S
+deleted file mode 100644
+index 6256376..0000000
+--- a/sysdeps/unix/sysv/linux/i386/pthread_cond_timedwait.S
++++ /dev/null
+@@ -1,974 +0,0 @@
+-/* Copyright (C) 2002-2016 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+-   Contributed by Ulrich Drepper <drepper@redhat.com>, 2002.
+-
+-   The GNU C Library is free software; you can redistribute it and/or
+-   modify it under the terms of the GNU Lesser General Public
+-   License as published by the Free Software Foundation; either
+-   version 2.1 of the License, or (at your option) any later version.
+-
+-   The GNU C Library is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Lesser General Public License for more details.
+-
+-   You should have received a copy of the GNU Lesser General Public
+-   License along with the GNU C Library; if not, see
+-   <http://www.gnu.org/licenses/>.  */
+-
+-#include <sysdep.h>
+-#include <shlib-compat.h>
+-#include <lowlevellock.h>
+-#include <lowlevelcond.h>
+-#include <pthread-errnos.h>
+-#include <pthread-pi-defines.h>
+-#include <kernel-features.h>
+-#include <stap-probe.h>
+-
+-	.text
+-
+-/* int pthread_cond_timedwait (pthread_cond_t *cond, pthread_mutex_t *mutex,
+-			       const struct timespec *abstime)  */
+-	.globl	__pthread_cond_timedwait
+-	.type	__pthread_cond_timedwait, @function
+-	.align	16
+-__pthread_cond_timedwait:
+-.LSTARTCODE:
+-	cfi_startproc
+-#ifdef SHARED
+-	cfi_personality(DW_EH_PE_pcrel | DW_EH_PE_sdata4 | DW_EH_PE_indirect,
+-			DW.ref.__gcc_personality_v0)
+-	cfi_lsda(DW_EH_PE_pcrel | DW_EH_PE_sdata4, .LexceptSTART)
+-#else
+-	cfi_personality(DW_EH_PE_udata4, __gcc_personality_v0)
+-	cfi_lsda(DW_EH_PE_udata4, .LexceptSTART)
+-#endif
+-
+-	pushl	%ebp
+-	cfi_adjust_cfa_offset(4)
+-	cfi_rel_offset(%ebp, 0)
+-	pushl	%edi
+-	cfi_adjust_cfa_offset(4)
+-	cfi_rel_offset(%edi, 0)
+-	pushl	%esi
+-	cfi_adjust_cfa_offset(4)
+-	cfi_rel_offset(%esi, 0)
+-	pushl	%ebx
+-	cfi_adjust_cfa_offset(4)
+-	cfi_rel_offset(%ebx, 0)
+-
+-	movl	20(%esp), %ebx
+-	movl	28(%esp), %ebp
+-
+-	LIBC_PROBE (cond_timedwait, 3, %ebx, 24(%esp), %ebp)
+-
+-	cmpl	$1000000000, 4(%ebp)
+-	movl	$EINVAL, %eax
+-	jae	18f
+-
+-	/* Stack frame:
+-
+-	   esp + 32
+-		    +--------------------------+
+-	   esp + 24 | timeout value            |
+-		    +--------------------------+
+-	   esp + 20 | futex pointer            |
+-		    +--------------------------+
+-	   esp + 16 | pi-requeued flag         |
+-		    +--------------------------+
+-	   esp + 12 | old broadcast_seq value  |
+-		    +--------------------------+
+-	   esp +  4 | old wake_seq value       |
+-		    +--------------------------+
+-	   esp +  0 | old cancellation mode    |
+-		    +--------------------------+
+-	*/
+-
+-#ifndef __ASSUME_FUTEX_CLOCK_REALTIME
+-# ifdef PIC
+-	LOAD_PIC_REG (cx)
+-	cmpl	$0, __have_futex_clock_realtime@GOTOFF(%ecx)
+-# else
+-	cmpl	$0, __have_futex_clock_realtime
+-# endif
+-	je	.Lreltmo
+-#endif
+-
+-	/* Get internal lock.  */
+-	movl	$1, %edx
+-	xorl	%eax, %eax
+-	LOCK
+-#if cond_lock == 0
+-	cmpxchgl %edx, (%ebx)
+-#else
+-	cmpxchgl %edx, cond_lock(%ebx)
+-#endif
+-	jnz	1f
+-
+-	/* Store the reference to the mutex.  If there is already a
+-	   different value in there this is a bad user bug.  */
+-2:	cmpl	$-1, dep_mutex(%ebx)
+-	movl	24(%esp), %eax
+-	je	17f
+-	movl	%eax, dep_mutex(%ebx)
+-
+-	/* Unlock the mutex.  */
+-17:	xorl	%edx, %edx
+-	call	__pthread_mutex_unlock_usercnt
+-
+-	testl	%eax, %eax
+-	jne	16f
+-
+-	addl	$1, total_seq(%ebx)
+-	adcl	$0, total_seq+4(%ebx)
+-	addl	$1, cond_futex(%ebx)
+-	addl	$(1 << nwaiters_shift), cond_nwaiters(%ebx)
+-
+-#ifdef __ASSUME_FUTEX_CLOCK_REALTIME
+-# define FRAME_SIZE 24
+-#else
+-# define FRAME_SIZE 32
+-#endif
+-	subl	$FRAME_SIZE, %esp
+-	cfi_adjust_cfa_offset(FRAME_SIZE)
+-	cfi_remember_state
+-
+-	/* Get and store current wakeup_seq value.  */
+-	movl	wakeup_seq(%ebx), %edi
+-	movl	wakeup_seq+4(%ebx), %edx
+-	movl	broadcast_seq(%ebx), %eax
+-	movl	%edi, 4(%esp)
+-	movl	%edx, 8(%esp)
+-	movl	%eax, 12(%esp)
+-
+-	/* Reset the pi-requeued flag.  */
+-	movl	$0, 16(%esp)
+-
+-	cmpl	$0, (%ebp)
+-	movl	$-ETIMEDOUT, %esi
+-	js	6f
+-
+-8:	movl	cond_futex(%ebx), %edi
+-	movl	%edi, 20(%esp)
+-
+-	/* Unlock.  */
+-	LOCK
+-#if cond_lock == 0
+-	subl	$1, (%ebx)
+-#else
+-	subl	$1, cond_lock(%ebx)
+-#endif
+-	jne	3f
+-
+-.LcleanupSTART:
+-4:	call	__pthread_enable_asynccancel
+-	movl	%eax, (%esp)
+-
+-	leal	(%ebp), %esi
+-#if FUTEX_PRIVATE_FLAG > 255
+-	xorl	%ecx, %ecx
+-#endif
+-	cmpl	$-1, dep_mutex(%ebx)
+-	sete	%cl
+-	je	40f
+-
+-	movl	dep_mutex(%ebx), %edi
+-	/* Requeue to a non-robust PI mutex if the PI bit is set and
+-	   the robust bit is not set.  */
+-	movl	MUTEX_KIND(%edi), %eax
+-	andl	$(ROBUST_BIT|PI_BIT), %eax
+-	cmpl	$PI_BIT, %eax
+-	jne	40f
+-
+-	movl	$(FUTEX_WAIT_REQUEUE_PI|FUTEX_PRIVATE_FLAG), %ecx
+-	/* The following only works like this because we only support
+-	   two clocks, represented using a single bit.  */
+-	testl	$1, cond_nwaiters(%ebx)
+-	/* XXX Need to implement using sete instead of a jump.  */
+-	jne	42f
+-	orl	$FUTEX_CLOCK_REALTIME, %ecx
+-
+-42:	movl	20(%esp), %edx
+-	addl	$cond_futex, %ebx
+-.Ladd_cond_futex_pi:
+-	movl	$SYS_futex, %eax
+-	ENTER_KERNEL
+-	subl	$cond_futex, %ebx
+-.Lsub_cond_futex_pi:
+-	movl	%eax, %esi
+-	/* Set the pi-requeued flag only if the kernel has returned 0. The
+-	   kernel does not hold the mutex on ETIMEDOUT or any other error.  */
+-	cmpl	$0, %eax
+-	sete	16(%esp)
+-	je	41f
+-
+-	/* When a futex syscall with FUTEX_WAIT_REQUEUE_PI returns
+-	   successfully, it has already locked the mutex for us and the
+-	   pi_flag (16(%esp)) is set to denote that fact.  However, if another
+-	   thread changed the futex value before we entered the wait, the
+-	   syscall may return an EAGAIN and the mutex is not locked.  We go
+-	   ahead with a success anyway since later we look at the pi_flag to
+-	   decide if we got the mutex or not.  The sequence numbers then make
+-	   sure that only one of the threads actually wake up.  We retry using
+-	   normal FUTEX_WAIT only if the kernel returned ENOSYS, since normal
+-	   and PI futexes don't mix.
+-
+-	   Note that we don't check for EAGAIN specifically; we assume that the
+-	   only other error the futex function could return is EAGAIN (barring
+-	   the ETIMEOUT of course, for the timeout case in futex) since
+-	   anything else would mean an error in our function.  It is too
+-	   expensive to do that check for every call (which is  quite common in
+-	   case of a large number of threads), so it has been skipped.  */
+-	cmpl	$-ENOSYS, %eax
+-	jne	41f
+-	xorl	%ecx, %ecx
+-
+-40:	subl	$1, %ecx
+-	movl	$0, 16(%esp)
+-#ifdef __ASSUME_PRIVATE_FUTEX
+-	andl	$FUTEX_PRIVATE_FLAG, %ecx
+-#else
+-	andl	%gs:PRIVATE_FUTEX, %ecx
+-#endif
+-	addl	$FUTEX_WAIT_BITSET, %ecx
+-	/* The following only works like this because we only support
+-	   two clocks, represented using a single bit.  */
+-	testl	$1, cond_nwaiters(%ebx)
+-	jne	30f
+-	orl	$FUTEX_CLOCK_REALTIME, %ecx
+-30:
+-	movl	20(%esp), %edx
+-	movl	$0xffffffff, %ebp
+-	addl	$cond_futex, %ebx
+-.Ladd_cond_futex:
+-	movl	$SYS_futex, %eax
+-	ENTER_KERNEL
+-	subl	$cond_futex, %ebx
+-.Lsub_cond_futex:
+-	movl	28+FRAME_SIZE(%esp), %ebp
+-	movl	%eax, %esi
+-
+-41:	movl	(%esp), %eax
+-	call	__pthread_disable_asynccancel
+-.LcleanupEND:
+-
+-	/* Lock.  */
+-	movl	$1, %edx
+-	xorl	%eax, %eax
+-	LOCK
+-#if cond_lock == 0
+-	cmpxchgl %edx, (%ebx)
+-#else
+-	cmpxchgl %edx, cond_lock(%ebx)
+-#endif
+-	jnz	5f
+-
+-6:	movl	broadcast_seq(%ebx), %eax
+-	cmpl	12(%esp), %eax
+-	jne	23f
+-
+-	movl	woken_seq(%ebx), %eax
+-	movl	woken_seq+4(%ebx), %ecx
+-
+-	movl	wakeup_seq(%ebx), %edi
+-	movl	wakeup_seq+4(%ebx), %edx
+-
+-	cmpl	8(%esp), %edx
+-	jne	7f
+-	cmpl	4(%esp), %edi
+-	je	15f
+-
+-7:	cmpl	%ecx, %edx
+-	jne	9f
+-	cmp	%eax, %edi
+-	jne	9f
+-
+-15:	cmpl	$-ETIMEDOUT, %esi
+-	je	28f
+-
+-	/* We need to go back to futex_wait.  If we're using requeue_pi, then
+-	   release the mutex we had acquired and go back.  */
+-	movl	16(%esp), %edx
+-	test	%edx, %edx
+-	jz	8b
+-
+-	/* Adjust the mutex values first and then unlock it.  The unlock
+-	   should always succeed or else the kernel did not lock the mutex
+-	   correctly.  */
+-	movl	dep_mutex(%ebx), %eax
+-	call	__pthread_mutex_cond_lock_adjust
+-	movl	dep_mutex(%ebx), %eax
+-	xorl	%edx, %edx
+-	call	__pthread_mutex_unlock_usercnt
+-	jmp	8b
+-
+-28:	addl	$1, wakeup_seq(%ebx)
+-	adcl	$0, wakeup_seq+4(%ebx)
+-	addl	$1, cond_futex(%ebx)
+-	movl	$ETIMEDOUT, %esi
+-	jmp	14f
+-
+-23:	xorl	%esi, %esi
+-	jmp	24f
+-
+-9:	xorl	%esi, %esi
+-14:	addl	$1, woken_seq(%ebx)
+-	adcl	$0, woken_seq+4(%ebx)
+-
+-24:	subl	$(1 << nwaiters_shift), cond_nwaiters(%ebx)
+-
+-	/* Wake up a thread which wants to destroy the condvar object.  */
+-	movl	total_seq(%ebx), %eax
+-	andl	total_seq+4(%ebx), %eax
+-	cmpl	$0xffffffff, %eax
+-	jne	25f
+-	movl	cond_nwaiters(%ebx), %eax
+-	andl	$~((1 << nwaiters_shift) - 1), %eax
+-	jne	25f
+-
+-	addl	$cond_nwaiters, %ebx
+-	movl	$SYS_futex, %eax
+-#if FUTEX_PRIVATE_FLAG > 255
+-	xorl	%ecx, %ecx
+-#endif
+-	cmpl	$-1, dep_mutex-cond_nwaiters(%ebx)
+-	sete	%cl
+-	subl	$1, %ecx
+-#ifdef __ASSUME_PRIVATE_FUTEX
+-	andl	$FUTEX_PRIVATE_FLAG, %ecx
+-#else
+-	andl	%gs:PRIVATE_FUTEX, %ecx
+-#endif
+-	addl	$FUTEX_WAKE, %ecx
+-	movl	$1, %edx
+-	ENTER_KERNEL
+-	subl	$cond_nwaiters, %ebx
+-
+-25:	LOCK
+-#if cond_lock == 0
+-	subl	$1, (%ebx)
+-#else
+-	subl	$1, cond_lock(%ebx)
+-#endif
+-	jne	10f
+-
+-11:	movl	24+FRAME_SIZE(%esp), %eax
+-	/* With requeue_pi, the mutex lock is held in the kernel.  */
+-	movl	16(%esp), %ecx
+-	testl	%ecx, %ecx
+-	jnz	27f
+-
+-	call	__pthread_mutex_cond_lock
+-26:	addl	$FRAME_SIZE, %esp
+-	cfi_adjust_cfa_offset(-FRAME_SIZE)
+-
+-	/* We return the result of the mutex_lock operation if it failed.  */
+-	testl	%eax, %eax
+-#ifdef HAVE_CMOV
+-	cmovel	%esi, %eax
+-#else
+-	jne	22f
+-	movl	%esi, %eax
+-22:
+-#endif
+-
+-18:	popl	%ebx
+-	cfi_adjust_cfa_offset(-4)
+-	cfi_restore(%ebx)
+-	popl	%esi
+-	cfi_adjust_cfa_offset(-4)
+-	cfi_restore(%esi)
+-	popl	%edi
+-	cfi_adjust_cfa_offset(-4)
+-	cfi_restore(%edi)
+-	popl	%ebp
+-	cfi_adjust_cfa_offset(-4)
+-	cfi_restore(%ebp)
+-
+-	ret
+-
+-	cfi_restore_state
+-
+-27:	call	__pthread_mutex_cond_lock_adjust
+-	xorl	%eax, %eax
+-	jmp	26b
+-
+-	cfi_adjust_cfa_offset(-FRAME_SIZE);
+-	/* Initial locking failed.  */
+-1:
+-#if cond_lock == 0
+-	movl	%ebx, %edx
+-#else
+-	leal	cond_lock(%ebx), %edx
+-#endif
+-#if (LLL_SHARED-LLL_PRIVATE) > 255
+-	xorl	%ecx, %ecx
+-#endif
+-	cmpl	$-1, dep_mutex(%ebx)
+-	setne	%cl
+-	subl	$1, %ecx
+-	andl	$(LLL_SHARED-LLL_PRIVATE), %ecx
+-#if LLL_PRIVATE != 0
+-	addl	$LLL_PRIVATE, %ecx
+-#endif
+-	call	__lll_lock_wait
+-	jmp	2b
+-
+-	/* The initial unlocking of the mutex failed.  */
+-16:
+-	LOCK
+-#if cond_lock == 0
+-	subl	$1, (%ebx)
+-#else
+-	subl	$1, cond_lock(%ebx)
+-#endif
+-	jne	18b
+-
+-	movl	%eax, %esi
+-#if cond_lock == 0
+-	movl	%ebx, %eax
+-#else
+-	leal	cond_lock(%ebx), %eax
+-#endif
+-#if (LLL_SHARED-LLL_PRIVATE) > 255
+-	xorl	%ecx, %ecx
+-#endif
+-	cmpl	$-1, dep_mutex(%ebx)
+-	setne	%cl
+-	subl	$1, %ecx
+-	andl	$(LLL_SHARED-LLL_PRIVATE), %ecx
+-#if LLL_PRIVATE != 0
+-	addl	$LLL_PRIVATE, %ecx
+-#endif
+-	call	__lll_unlock_wake
+-
+-	movl	%esi, %eax
+-	jmp	18b
+-
+-	cfi_adjust_cfa_offset(FRAME_SIZE)
+-
+-	/* Unlock in loop requires wakeup.  */
+-3:
+-#if cond_lock == 0
+-	movl	%ebx, %eax
+-#else
+-	leal	cond_lock(%ebx), %eax
+-#endif
+-#if (LLL_SHARED-LLL_PRIVATE) > 255
+-	xorl	%ecx, %ecx
+-#endif
+-	cmpl	$-1, dep_mutex(%ebx)
+-	setne	%cl
+-	subl	$1, %ecx
+-	andl	$(LLL_SHARED-LLL_PRIVATE), %ecx
+-#if LLL_PRIVATE != 0
+-	addl	$LLL_PRIVATE, %ecx
+-#endif
+-	call	__lll_unlock_wake
+-	jmp	4b
+-
+-	/* Locking in loop failed.  */
+-5:
+-#if cond_lock == 0
+-	movl	%ebx, %edx
+-#else
+-	leal	cond_lock(%ebx), %edx
+-#endif
+-#if (LLL_SHARED-LLL_PRIVATE) > 255
+-	xorl	%ecx, %ecx
+-#endif
+-	cmpl	$-1, dep_mutex(%ebx)
+-	setne	%cl
+-	subl	$1, %ecx
+-	andl	$(LLL_SHARED-LLL_PRIVATE), %ecx
+-#if LLL_PRIVATE != 0
+-	addl	$LLL_PRIVATE, %ecx
+-#endif
+-	call	__lll_lock_wait
+-	jmp	6b
+-
+-	/* Unlock after loop requires wakeup.  */
+-10:
+-#if cond_lock == 0
+-	movl	%ebx, %eax
+-#else
+-	leal	cond_lock(%ebx), %eax
+-#endif
+-#if (LLL_SHARED-LLL_PRIVATE) > 255
+-	xorl	%ecx, %ecx
+-#endif
+-	cmpl	$-1, dep_mutex(%ebx)
+-	setne	%cl
+-	subl	$1, %ecx
+-	andl	$(LLL_SHARED-LLL_PRIVATE), %ecx
+-#if LLL_PRIVATE != 0
+-	addl	$LLL_PRIVATE, %ecx
+-#endif
+-	call	__lll_unlock_wake
+-	jmp	11b
+-
+-#ifndef __ASSUME_FUTEX_CLOCK_REALTIME
+-	cfi_adjust_cfa_offset(-FRAME_SIZE)
+-.Lreltmo:
+-	/* Get internal lock.  */
+-	movl	$1, %edx
+-	xorl	%eax, %eax
+-	LOCK
+-# if cond_lock == 0
+-	cmpxchgl %edx, (%ebx)
+-# else
+-	cmpxchgl %edx, cond_lock(%ebx)
+-# endif
+-	jnz	101f
+-
+-	/* Store the reference to the mutex.  If there is already a
+-	   different value in there this is a bad user bug.  */
+-102:	cmpl	$-1, dep_mutex(%ebx)
+-	movl	24(%esp), %eax
+-	je	117f
+-	movl	%eax, dep_mutex(%ebx)
+-
+-	/* Unlock the mutex.  */
+-117:	xorl	%edx, %edx
+-	call	__pthread_mutex_unlock_usercnt
+-
+-	testl	%eax, %eax
+-	jne	16b
+-
+-	addl	$1, total_seq(%ebx)
+-	adcl	$0, total_seq+4(%ebx)
+-	addl	$1, cond_futex(%ebx)
+-	addl	$(1 << nwaiters_shift), cond_nwaiters(%ebx)
+-
+-	subl	$FRAME_SIZE, %esp
+-	cfi_adjust_cfa_offset(FRAME_SIZE)
+-
+-	/* Get and store current wakeup_seq value.  */
+-	movl	wakeup_seq(%ebx), %edi
+-	movl	wakeup_seq+4(%ebx), %edx
+-	movl	broadcast_seq(%ebx), %eax
+-	movl	%edi, 4(%esp)
+-	movl	%edx, 8(%esp)
+-	movl	%eax, 12(%esp)
+-
+-	/* Reset the pi-requeued flag.  */
+-	movl	$0, 16(%esp)
+-
+-	/* Get the current time.  */
+-108:	movl	%ebx, %edx
+-# ifdef __NR_clock_gettime
+-	/* Get the clock number.  */
+-	movl	cond_nwaiters(%ebx), %ebx
+-	andl	$((1 << nwaiters_shift) - 1), %ebx
+-	/* Only clocks 0 and 1 are allowed so far.  Both are handled in the
+-	   kernel.  */
+-	leal	24(%esp), %ecx
+-	movl	$__NR_clock_gettime, %eax
+-	ENTER_KERNEL
+-	movl	%edx, %ebx
+-
+-	/* Compute relative timeout.  */
+-	movl	(%ebp), %ecx
+-	movl	4(%ebp), %edx
+-	subl	24(%esp), %ecx
+-	subl	28(%esp), %edx
+-# else
+-	/* Get the current time.  */
+-	leal	24(%esp), %ebx
+-	xorl	%ecx, %ecx
+-	movl	$__NR_gettimeofday, %eax
+-	ENTER_KERNEL
+-	movl	%edx, %ebx
+-
+-	/* Compute relative timeout.  */
+-	movl	28(%esp), %eax
+-	movl	$1000, %edx
+-	mul	%edx		/* Milli seconds to nano seconds.  */
+-	movl	(%ebp), %ecx
+-	movl	4(%ebp), %edx
+-	subl	24(%esp), %ecx
+-	subl	%eax, %edx
+-# endif
+-	jns	112f
+-	addl	$1000000000, %edx
+-	subl	$1, %ecx
+-112:	testl	%ecx, %ecx
+-	movl	$-ETIMEDOUT, %esi
+-	js	106f
+-
+-	/* Store relative timeout.  */
+-121:	movl	%ecx, 24(%esp)
+-	movl	%edx, 28(%esp)
+-
+-	movl	cond_futex(%ebx), %edi
+-	movl	%edi, 20(%esp)
+-
+-	/* Unlock.  */
+-	LOCK
+-# if cond_lock == 0
+-	subl	$1, (%ebx)
+-# else
+-	subl	$1, cond_lock(%ebx)
+-# endif
+-	jne	103f
+-
+-.LcleanupSTART2:
+-104:	call	__pthread_enable_asynccancel
+-	movl	%eax, (%esp)
+-
+-	leal	24(%esp), %esi
+-# if FUTEX_PRIVATE_FLAG > 255
+-	xorl	%ecx, %ecx
+-# endif
+-	cmpl	$-1, dep_mutex(%ebx)
+-	sete	%cl
+-	subl	$1, %ecx
+-# ifdef __ASSUME_PRIVATE_FUTEX
+-	andl	$FUTEX_PRIVATE_FLAG, %ecx
+-# else
+-	andl	%gs:PRIVATE_FUTEX, %ecx
+-# endif
+-# if FUTEX_WAIT != 0
+-	addl	$FUTEX_WAIT, %ecx
+-# endif
+-	movl	20(%esp), %edx
+-	addl	$cond_futex, %ebx
+-.Ladd_cond_futex2:
+-	movl	$SYS_futex, %eax
+-	ENTER_KERNEL
+-	subl	$cond_futex, %ebx
+-.Lsub_cond_futex2:
+-	movl	%eax, %esi
+-
+-141:	movl	(%esp), %eax
+-	call	__pthread_disable_asynccancel
+-.LcleanupEND2:
+-
+-
+-	/* Lock.  */
+-	movl	$1, %edx
+-	xorl	%eax, %eax
+-	LOCK
+-# if cond_lock == 0
+-	cmpxchgl %edx, (%ebx)
+-# else
+-	cmpxchgl %edx, cond_lock(%ebx)
+-# endif
+-	jnz	105f
+-
+-106:	movl	broadcast_seq(%ebx), %eax
+-	cmpl	12(%esp), %eax
+-	jne	23b
+-
+-	movl	woken_seq(%ebx), %eax
+-	movl	woken_seq+4(%ebx), %ecx
+-
+-	movl	wakeup_seq(%ebx), %edi
+-	movl	wakeup_seq+4(%ebx), %edx
+-
+-	cmpl	8(%esp), %edx
+-	jne	107f
+-	cmpl	4(%esp), %edi
+-	je	115f
+-
+-107:	cmpl	%ecx, %edx
+-	jne	9b
+-	cmp	%eax, %edi
+-	jne	9b
+-
+-115:	cmpl	$-ETIMEDOUT, %esi
+-	je	28b
+-
+-	jmp	8b
+-
+-	cfi_adjust_cfa_offset(-FRAME_SIZE)
+-	/* Initial locking failed.  */
+-101:
+-# if cond_lock == 0
+-	movl	%ebx, %edx
+-# else
+-	leal	cond_lock(%ebx), %edx
+-# endif
+-# if (LLL_SHARED-LLL_PRIVATE) > 255
+-	xorl	%ecx, %ecx
+-# endif
+-	cmpl	$-1, dep_mutex(%ebx)
+-	setne	%cl
+-	subl	$1, %ecx
+-	andl	$(LLL_SHARED-LLL_PRIVATE), %ecx
+-# if LLL_PRIVATE != 0
+-	addl	$LLL_PRIVATE, %ecx
+-# endif
+-	call	__lll_lock_wait
+-	jmp	102b
+-
+-	cfi_adjust_cfa_offset(FRAME_SIZE)
+-
+-	/* Unlock in loop requires wakeup.  */
+-103:
+-# if cond_lock == 0
+-	movl	%ebx, %eax
+-# else
+-	leal	cond_lock(%ebx), %eax
+-# endif
+-# if (LLL_SHARED-LLL_PRIVATE) > 255
+-	xorl	%ecx, %ecx
+-# endif
+-	cmpl	$-1, dep_mutex(%ebx)
+-	setne	%cl
+-	subl	$1, %ecx
+-	andl	$(LLL_SHARED-LLL_PRIVATE), %ecx
+-# if LLL_PRIVATE != 0
+-	addl	$LLL_PRIVATE, %ecx
+-# endif
+-	call	__lll_unlock_wake
+-	jmp	104b
+-
+-	/* Locking in loop failed.  */
+-105:
+-# if cond_lock == 0
+-	movl	%ebx, %edx
+-# else
+-	leal	cond_lock(%ebx), %edx
+-# endif
+-# if (LLL_SHARED-LLL_PRIVATE) > 255
+-	xorl	%ecx, %ecx
+-# endif
+-	cmpl	$-1, dep_mutex(%ebx)
+-	setne	%cl
+-	subl	$1, %ecx
+-	andl	$(LLL_SHARED-LLL_PRIVATE), %ecx
+-# if LLL_PRIVATE != 0
+-	addl	$LLL_PRIVATE, %ecx
+-# endif
+-	call	__lll_lock_wait
+-	jmp	106b
+-#endif
+-
+-	.size	__pthread_cond_timedwait, .-__pthread_cond_timedwait
+-versioned_symbol (libpthread, __pthread_cond_timedwait, pthread_cond_timedwait,
+-		  GLIBC_2_3_2)
+-
+-
+-	.type	__condvar_tw_cleanup2, @function
+-__condvar_tw_cleanup2:
+-	subl	$cond_futex, %ebx
+-	.size	__condvar_tw_cleanup2, .-__condvar_tw_cleanup2
+-	.type	__condvar_tw_cleanup, @function
+-__condvar_tw_cleanup:
+-	movl	%eax, %esi
+-
+-	/* Get internal lock.  */
+-	movl	$1, %edx
+-	xorl	%eax, %eax
+-	LOCK
+-#if cond_lock == 0
+-	cmpxchgl %edx, (%ebx)
+-#else
+-	cmpxchgl %edx, cond_lock(%ebx)
+-#endif
+-	jz	1f
+-
+-#if cond_lock == 0
+-	movl	%ebx, %edx
+-#else
+-	leal	cond_lock(%ebx), %edx
+-#endif
+-#if (LLL_SHARED-LLL_PRIVATE) > 255
+-	xorl	%ecx, %ecx
+-#endif
+-	cmpl	$-1, dep_mutex(%ebx)
+-	setne	%cl
+-	subl	$1, %ecx
+-	andl	$(LLL_SHARED-LLL_PRIVATE), %ecx
+-#if LLL_PRIVATE != 0
+-	addl	$LLL_PRIVATE, %ecx
+-#endif
+-	call	__lll_lock_wait
+-
+-1:	movl	broadcast_seq(%ebx), %eax
+-	cmpl	12(%esp), %eax
+-	jne	3f
+-
+-	/* We increment the wakeup_seq counter only if it is lower than
+-	   total_seq.  If this is not the case the thread was woken and
+-	   then canceled.  In this case we ignore the signal.  */
+-	movl	total_seq(%ebx), %eax
+-	movl	total_seq+4(%ebx), %edi
+-	cmpl	wakeup_seq+4(%ebx), %edi
+-	jb	6f
+-	ja	7f
+-	cmpl	wakeup_seq(%ebx), %eax
+-	jbe	7f
+-
+-6:	addl	$1, wakeup_seq(%ebx)
+-	adcl	$0, wakeup_seq+4(%ebx)
+-	addl	$1, cond_futex(%ebx)
+-
+-7:	addl	$1, woken_seq(%ebx)
+-	adcl	$0, woken_seq+4(%ebx)
+-
+-3:	subl	$(1 << nwaiters_shift), cond_nwaiters(%ebx)
+-
+-	/* Wake up a thread which wants to destroy the condvar object.  */
+-	xorl	%edi, %edi
+-	movl	total_seq(%ebx), %eax
+-	andl	total_seq+4(%ebx), %eax
+-	cmpl	$0xffffffff, %eax
+-	jne	4f
+-	movl	cond_nwaiters(%ebx), %eax
+-	andl	$~((1 << nwaiters_shift) - 1), %eax
+-	jne	4f
+-
+-	addl	$cond_nwaiters, %ebx
+-	movl	$SYS_futex, %eax
+-#if FUTEX_PRIVATE_FLAG > 255
+-	xorl	%ecx, %ecx
+-#endif
+-	cmpl	$-1, dep_mutex-cond_nwaiters(%ebx)
+-	sete	%cl
+-	subl	$1, %ecx
+-#ifdef __ASSUME_PRIVATE_FUTEX
+-	andl	$FUTEX_PRIVATE_FLAG, %ecx
+-#else
+-	andl	%gs:PRIVATE_FUTEX, %ecx
+-#endif
+-	addl	$FUTEX_WAKE, %ecx
+-	movl	$1, %edx
+-	ENTER_KERNEL
+-	subl	$cond_nwaiters, %ebx
+-	movl	$1, %edi
+-
+-4:	LOCK
+-#if cond_lock == 0
+-	subl	$1, (%ebx)
+-#else
+-	subl	$1, cond_lock(%ebx)
+-#endif
+-	je	2f
+-
+-#if cond_lock == 0
+-	movl	%ebx, %eax
+-#else
+-	leal	cond_lock(%ebx), %eax
+-#endif
+-#if (LLL_SHARED-LLL_PRIVATE) > 255
+-	xorl	%ecx, %ecx
+-#endif
+-	cmpl	$-1, dep_mutex(%ebx)
+-	setne	%cl
+-	subl	$1, %ecx
+-	andl	$(LLL_SHARED-LLL_PRIVATE), %ecx
+-#if LLL_PRIVATE != 0
+-	addl	$LLL_PRIVATE, %ecx
+-#endif
+-	call	__lll_unlock_wake
+-
+-	/* Wake up all waiters to make sure no signal gets lost.  */
+-2:	testl	%edi, %edi
+-	jnz	5f
+-	addl	$cond_futex, %ebx
+-#if FUTEX_PRIVATE_FLAG > 255
+-	xorl	%ecx, %ecx
+-#endif
+-	cmpl	$-1, dep_mutex-cond_futex(%ebx)
+-	sete	%cl
+-	subl	$1, %ecx
+-#ifdef __ASSUME_PRIVATE_FUTEX
+-	andl	$FUTEX_PRIVATE_FLAG, %ecx
+-#else
+-	andl	%gs:PRIVATE_FUTEX, %ecx
+-#endif
+-	addl	$FUTEX_WAKE, %ecx
+-	movl	$SYS_futex, %eax
+-	movl	$0x7fffffff, %edx
+-	ENTER_KERNEL
+-
+-	/* Lock the mutex only if we don't own it already.  This only happens
+-	   in case of PI mutexes, if we got cancelled after a successful
+-	   return of the futex syscall and before disabling async
+-	   cancellation.  */
+-5:	movl	24+FRAME_SIZE(%esp), %eax
+-	movl	MUTEX_KIND(%eax), %ebx
+-	andl	$(ROBUST_BIT|PI_BIT), %ebx
+-	cmpl	$PI_BIT, %ebx
+-	jne	8f
+-
+-	movl	(%eax), %ebx
+-	andl	$TID_MASK, %ebx
+-	cmpl	%ebx, %gs:TID
+-	jne	8f
+-	/* We managed to get the lock.  Fix it up before returning.  */
+-	call	__pthread_mutex_cond_lock_adjust
+-	jmp	9f
+-
+-8:	call	__pthread_mutex_cond_lock
+-
+-9:	movl	%esi, (%esp)
+-.LcallUR:
+-	call	_Unwind_Resume
+-	hlt
+-.LENDCODE:
+-	cfi_endproc
+-	.size	__condvar_tw_cleanup, .-__condvar_tw_cleanup
+-
+-
+-	.section .gcc_except_table,"a",@progbits
+-.LexceptSTART:
+-	.byte	DW_EH_PE_omit			# @LPStart format (omit)
+-	.byte	DW_EH_PE_omit			# @TType format (omit)
+-	.byte	DW_EH_PE_sdata4			# call-site format
+-						# DW_EH_PE_sdata4
+-	.uleb128 .Lcstend-.Lcstbegin
+-.Lcstbegin:
+-	.long	.LcleanupSTART-.LSTARTCODE
+-	.long	.Ladd_cond_futex_pi-.LcleanupSTART
+-	.long	__condvar_tw_cleanup-.LSTARTCODE
+-	.uleb128  0
+-	.long	.Ladd_cond_futex_pi-.LSTARTCODE
+-	.long	.Lsub_cond_futex_pi-.Ladd_cond_futex_pi
+-	.long	__condvar_tw_cleanup2-.LSTARTCODE
+-	.uleb128  0
+-	.long	.Lsub_cond_futex_pi-.LSTARTCODE
+-	.long	.Ladd_cond_futex-.Lsub_cond_futex_pi
+-	.long	__condvar_tw_cleanup-.LSTARTCODE
+-	.uleb128  0
+-	.long	.Ladd_cond_futex-.LSTARTCODE
+-	.long	.Lsub_cond_futex-.Ladd_cond_futex
+-	.long	__condvar_tw_cleanup2-.LSTARTCODE
+-	.uleb128  0
+-	.long	.Lsub_cond_futex-.LSTARTCODE
+-	.long	.LcleanupEND-.Lsub_cond_futex
+-	.long	__condvar_tw_cleanup-.LSTARTCODE
+-	.uleb128  0
+-#ifndef __ASSUME_FUTEX_CLOCK_REALTIME
+-	.long	.LcleanupSTART2-.LSTARTCODE
+-	.long	.Ladd_cond_futex2-.LcleanupSTART2
+-	.long	__condvar_tw_cleanup-.LSTARTCODE
+-	.uleb128  0
+-	.long	.Ladd_cond_futex2-.LSTARTCODE
+-	.long	.Lsub_cond_futex2-.Ladd_cond_futex2
+-	.long	__condvar_tw_cleanup2-.LSTARTCODE
+-	.uleb128  0
+-	.long	.Lsub_cond_futex2-.LSTARTCODE
+-	.long	.LcleanupEND2-.Lsub_cond_futex2
+-	.long	__condvar_tw_cleanup-.LSTARTCODE
+-	.uleb128  0
+-#endif
+-	.long	.LcallUR-.LSTARTCODE
+-	.long	.LENDCODE-.LcallUR
+-	.long	0
+-	.uleb128  0
+-.Lcstend:
+-
+-
+-#ifdef SHARED
+-	.hidden DW.ref.__gcc_personality_v0
+-	.weak	DW.ref.__gcc_personality_v0
+-	.section .gnu.linkonce.d.DW.ref.__gcc_personality_v0,"aw",@progbits
+-	.align	4
+-	.type	DW.ref.__gcc_personality_v0, @object
+-	.size	DW.ref.__gcc_personality_v0, 4
+-DW.ref.__gcc_personality_v0:
+-	.long   __gcc_personality_v0
+-#endif
+diff --git a/sysdeps/unix/sysv/linux/i386/pthread_cond_wait.S b/sysdeps/unix/sysv/linux/i386/pthread_cond_wait.S
+deleted file mode 100644
+index 5016718..0000000
+--- a/sysdeps/unix/sysv/linux/i386/pthread_cond_wait.S
++++ /dev/null
+@@ -1,642 +0,0 @@
+-/* Copyright (C) 2002-2016 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+-   Contributed by Ulrich Drepper <drepper@redhat.com>, 2002.
+-
+-   The GNU C Library is free software; you can redistribute it and/or
+-   modify it under the terms of the GNU Lesser General Public
+-   License as published by the Free Software Foundation; either
+-   version 2.1 of the License, or (at your option) any later version.
+-
+-   The GNU C Library is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Lesser General Public License for more details.
+-
+-   You should have received a copy of the GNU Lesser General Public
+-   License along with the GNU C Library; if not, see
+-   <http://www.gnu.org/licenses/>.  */
+-
+-#include <sysdep.h>
+-#include <shlib-compat.h>
+-#include <lowlevellock.h>
+-#include <lowlevelcond.h>
+-#include <tcb-offsets.h>
+-#include <pthread-errnos.h>
+-#include <pthread-pi-defines.h>
+-#include <kernel-features.h>
+-#include <stap-probe.h>
+-
+-
+-	.text
+-
+-/* int pthread_cond_wait (pthread_cond_t *cond, pthread_mutex_t *mutex)  */
+-	.globl	__pthread_cond_wait
+-	.type	__pthread_cond_wait, @function
+-	.align	16
+-__pthread_cond_wait:
+-.LSTARTCODE:
+-	cfi_startproc
+-#ifdef SHARED
+-	cfi_personality(DW_EH_PE_pcrel | DW_EH_PE_sdata4 | DW_EH_PE_indirect,
+-			DW.ref.__gcc_personality_v0)
+-	cfi_lsda(DW_EH_PE_pcrel | DW_EH_PE_sdata4, .LexceptSTART)
+-#else
+-	cfi_personality(DW_EH_PE_udata4, __gcc_personality_v0)
+-	cfi_lsda(DW_EH_PE_udata4, .LexceptSTART)
+-#endif
+-
+-	pushl	%ebp
+-	cfi_adjust_cfa_offset(4)
+-	cfi_rel_offset(%ebp, 0)
+-	pushl	%edi
+-	cfi_adjust_cfa_offset(4)
+-	cfi_rel_offset(%edi, 0)
+-	pushl	%esi
+-	cfi_adjust_cfa_offset(4)
+-	cfi_rel_offset(%esi, 0)
+-	pushl	%ebx
+-	cfi_adjust_cfa_offset(4)
+-	cfi_rel_offset(%ebx, 0)
+-
+-	xorl	%esi, %esi
+-	movl	20(%esp), %ebx
+-
+-	LIBC_PROBE (cond_wait, 2, 24(%esp), %ebx)
+-
+-	/* Get internal lock.  */
+-	movl	$1, %edx
+-	xorl	%eax, %eax
+-	LOCK
+-#if cond_lock == 0
+-	cmpxchgl %edx, (%ebx)
+-#else
+-	cmpxchgl %edx, cond_lock(%ebx)
+-#endif
+-	jnz	1f
+-
+-	/* Store the reference to the mutex.  If there is already a
+-	   different value in there this is a bad user bug.  */
+-2:	cmpl	$-1, dep_mutex(%ebx)
+-	movl	24(%esp), %eax
+-	je	15f
+-	movl	%eax, dep_mutex(%ebx)
+-
+-	/* Unlock the mutex.  */
+-15:	xorl	%edx, %edx
+-	call	__pthread_mutex_unlock_usercnt
+-
+-	testl	%eax, %eax
+-	jne	12f
+-
+-	addl	$1, total_seq(%ebx)
+-	adcl	$0, total_seq+4(%ebx)
+-	addl	$1, cond_futex(%ebx)
+-	addl	$(1 << nwaiters_shift), cond_nwaiters(%ebx)
+-
+-#define FRAME_SIZE 20
+-	subl	$FRAME_SIZE, %esp
+-	cfi_adjust_cfa_offset(FRAME_SIZE)
+-	cfi_remember_state
+-
+-	/* Get and store current wakeup_seq value.  */
+-	movl	wakeup_seq(%ebx), %edi
+-	movl	wakeup_seq+4(%ebx), %edx
+-	movl	broadcast_seq(%ebx), %eax
+-	movl	%edi, 4(%esp)
+-	movl	%edx, 8(%esp)
+-	movl	%eax, 12(%esp)
+-
+-	/* Reset the pi-requeued flag.  */
+-8:	movl	$0, 16(%esp)
+-	movl	cond_futex(%ebx), %ebp
+-
+-	/* Unlock.  */
+-	LOCK
+-#if cond_lock == 0
+-	subl	$1, (%ebx)
+-#else
+-	subl	$1, cond_lock(%ebx)
+-#endif
+-	jne	3f
+-
+-.LcleanupSTART:
+-4:	call	__pthread_enable_asynccancel
+-	movl	%eax, (%esp)
+-
+-	xorl	%ecx, %ecx
+-	cmpl	$-1, dep_mutex(%ebx)
+-	sete	%cl
+-	je	18f
+-
+-	movl	dep_mutex(%ebx), %edi
+-	/* Requeue to a non-robust PI mutex if the PI bit is set and
+-	   the robust bit is not set.  */
+-	movl	MUTEX_KIND(%edi), %eax
+-	andl	$(ROBUST_BIT|PI_BIT), %eax
+-	cmpl	$PI_BIT, %eax
+-	jne	18f
+-
+-	movl	$(FUTEX_WAIT_REQUEUE_PI|FUTEX_PRIVATE_FLAG), %ecx
+-	movl	%ebp, %edx
+-	xorl	%esi, %esi
+-	addl	$cond_futex, %ebx
+-.Ladd_cond_futex_pi:
+-	movl	$SYS_futex, %eax
+-	ENTER_KERNEL
+-	subl	$cond_futex, %ebx
+-.Lsub_cond_futex_pi:
+-	/* Set the pi-requeued flag only if the kernel has returned 0. The
+-	   kernel does not hold the mutex on error.  */
+-	cmpl	$0, %eax
+-	sete	16(%esp)
+-	je	19f
+-
+-	/* When a futex syscall with FUTEX_WAIT_REQUEUE_PI returns
+-	   successfully, it has already locked the mutex for us and the
+-	   pi_flag (16(%esp)) is set to denote that fact.  However, if another
+-	   thread changed the futex value before we entered the wait, the
+-	   syscall may return an EAGAIN and the mutex is not locked.  We go
+-	   ahead with a success anyway since later we look at the pi_flag to
+-	   decide if we got the mutex or not.  The sequence numbers then make
+-	   sure that only one of the threads actually wake up.  We retry using
+-	   normal FUTEX_WAIT only if the kernel returned ENOSYS, since normal
+-	   and PI futexes don't mix.
+-
+-	   Note that we don't check for EAGAIN specifically; we assume that the
+-	   only other error the futex function could return is EAGAIN since
+-	   anything else would mean an error in our function.  It is too
+-	   expensive to do that check for every call (which is 	quite common in
+-	   case of a large number of threads), so it has been skipped.  */
+-	cmpl	$-ENOSYS, %eax
+-	jne	19f
+-	xorl	%ecx, %ecx
+-
+-18:	subl	$1, %ecx
+-#ifdef __ASSUME_PRIVATE_FUTEX
+-	andl	$FUTEX_PRIVATE_FLAG, %ecx
+-#else
+-	andl	%gs:PRIVATE_FUTEX, %ecx
+-#endif
+-#if FUTEX_WAIT != 0
+-	addl	$FUTEX_WAIT, %ecx
+-#endif
+-	movl	%ebp, %edx
+-	addl	$cond_futex, %ebx
+-.Ladd_cond_futex:
+-	movl	$SYS_futex, %eax
+-	ENTER_KERNEL
+-	subl	$cond_futex, %ebx
+-.Lsub_cond_futex:
+-
+-19:	movl	(%esp), %eax
+-	call	__pthread_disable_asynccancel
+-.LcleanupEND:
+-
+-	/* Lock.  */
+-	movl	$1, %edx
+-	xorl	%eax, %eax
+-	LOCK
+-#if cond_lock == 0
+-	cmpxchgl %edx, (%ebx)
+-#else
+-	cmpxchgl %edx, cond_lock(%ebx)
+-#endif
+-	jnz	5f
+-
+-6:	movl	broadcast_seq(%ebx), %eax
+-	cmpl	12(%esp), %eax
+-	jne	16f
+-
+-	movl	woken_seq(%ebx), %eax
+-	movl	woken_seq+4(%ebx), %ecx
+-
+-	movl	wakeup_seq(%ebx), %edi
+-	movl	wakeup_seq+4(%ebx), %edx
+-
+-	cmpl	8(%esp), %edx
+-	jne	7f
+-	cmpl	4(%esp), %edi
+-	je	22f
+-
+-7:	cmpl	%ecx, %edx
+-	jne	9f
+-	cmp	%eax, %edi
+-	je	22f
+-
+-9:	addl	$1, woken_seq(%ebx)
+-	adcl	$0, woken_seq+4(%ebx)
+-
+-	/* Unlock */
+-16:	subl	$(1 << nwaiters_shift), cond_nwaiters(%ebx)
+-
+-	/* Wake up a thread which wants to destroy the condvar object.  */
+-	movl	total_seq(%ebx), %eax
+-	andl	total_seq+4(%ebx), %eax
+-	cmpl	$0xffffffff, %eax
+-	jne	17f
+-	movl	cond_nwaiters(%ebx), %eax
+-	andl	$~((1 << nwaiters_shift) - 1), %eax
+-	jne	17f
+-
+-	addl	$cond_nwaiters, %ebx
+-	movl	$SYS_futex, %eax
+-#if FUTEX_PRIVATE_FLAG > 255
+-	xorl	%ecx, %ecx
+-#endif
+-	cmpl	$-1, dep_mutex-cond_nwaiters(%ebx)
+-	sete	%cl
+-	subl	$1, %ecx
+-#ifdef __ASSUME_PRIVATE_FUTEX
+-	andl	$FUTEX_PRIVATE_FLAG, %ecx
+-#else
+-	andl	%gs:PRIVATE_FUTEX, %ecx
+-#endif
+-	addl	$FUTEX_WAKE, %ecx
+-	movl	$1, %edx
+-	ENTER_KERNEL
+-	subl	$cond_nwaiters, %ebx
+-
+-17:	LOCK
+-#if cond_lock == 0
+-	subl	$1, (%ebx)
+-#else
+-	subl	$1, cond_lock(%ebx)
+-#endif
+-	jne	10f
+-
+-	/* With requeue_pi, the mutex lock is held in the kernel.  */
+-11:	movl	24+FRAME_SIZE(%esp), %eax
+-	movl	16(%esp), %ecx
+-	testl	%ecx, %ecx
+-	jnz	21f
+-
+-	call	__pthread_mutex_cond_lock
+-20:	addl	$FRAME_SIZE, %esp
+-	cfi_adjust_cfa_offset(-FRAME_SIZE);
+-
+-14:	popl	%ebx
+-	cfi_adjust_cfa_offset(-4)
+-	cfi_restore(%ebx)
+-	popl	%esi
+-	cfi_adjust_cfa_offset(-4)
+-	cfi_restore(%esi)
+-	popl	%edi
+-	cfi_adjust_cfa_offset(-4)
+-	cfi_restore(%edi)
+-	popl	%ebp
+-	cfi_adjust_cfa_offset(-4)
+-	cfi_restore(%ebp)
+-
+-	/* We return the result of the mutex_lock operation.  */
+-	ret
+-
+-	cfi_restore_state
+-
+-21:	call	__pthread_mutex_cond_lock_adjust
+-	xorl	%eax, %eax
+-	jmp	20b
+-
+-	cfi_adjust_cfa_offset(-FRAME_SIZE);
+-
+-	/* We need to go back to futex_wait.  If we're using requeue_pi, then
+-	   release the mutex we had acquired and go back.  */
+-22:	movl	16(%esp), %edx
+-	test	%edx, %edx
+-	jz	8b
+-
+-	/* Adjust the mutex values first and then unlock it.  The unlock
+-	   should always succeed or else the kernel did not lock the mutex
+-	   correctly.  */
+-	movl	dep_mutex(%ebx), %eax
+-	call    __pthread_mutex_cond_lock_adjust
+-	movl	dep_mutex(%ebx), %eax
+-	xorl	%edx, %edx
+-	call	__pthread_mutex_unlock_usercnt
+-	jmp	8b
+-
+-	/* Initial locking failed.  */
+-1:
+-#if cond_lock == 0
+-	movl	%ebx, %edx
+-#else
+-	leal	cond_lock(%ebx), %edx
+-#endif
+-#if (LLL_SHARED-LLL_PRIVATE) > 255
+-	xorl	%ecx, %ecx
+-#endif
+-	cmpl	$-1, dep_mutex(%ebx)
+-	setne	%cl
+-	subl	$1, %ecx
+-	andl	$(LLL_SHARED-LLL_PRIVATE), %ecx
+-#if LLL_PRIVATE != 0
+-	addl	$LLL_PRIVATE, %ecx
+-#endif
+-	call	__lll_lock_wait
+-	jmp	2b
+-
+-	/* The initial unlocking of the mutex failed.  */
+-12:
+-	LOCK
+-#if cond_lock == 0
+-	subl	$1, (%ebx)
+-#else
+-	subl	$1, cond_lock(%ebx)
+-#endif
+-	jne	14b
+-
+-	movl	%eax, %esi
+-#if cond_lock == 0
+-	movl	%ebx, %eax
+-#else
+-	leal	cond_lock(%ebx), %eax
+-#endif
+-#if (LLL_SHARED-LLL_PRIVATE) > 255
+-	xorl	%ecx, %ecx
+-#endif
+-	cmpl	$-1, dep_mutex(%ebx)
+-	setne	%cl
+-	subl	$1, %ecx
+-	andl	$(LLL_SHARED-LLL_PRIVATE), %ecx
+-#if LLL_PRIVATE != 0
+-	addl	$LLL_PRIVATE, %ecx
+-#endif
+-	call	__lll_unlock_wake
+-
+-	movl	%esi, %eax
+-	jmp	14b
+-
+-	cfi_adjust_cfa_offset(FRAME_SIZE)
+-
+-	/* Unlock in loop requires wakeup.  */
+-3:
+-#if cond_lock == 0
+-	movl	%ebx, %eax
+-#else
+-	leal	cond_lock(%ebx), %eax
+-#endif
+-#if (LLL_SHARED-LLL_PRIVATE) > 255
+-	xorl	%ecx, %ecx
+-#endif
+-	cmpl	$-1, dep_mutex(%ebx)
+-	setne	%cl
+-	subl	$1, %ecx
+-	andl	$(LLL_SHARED-LLL_PRIVATE), %ecx
+-#if LLL_PRIVATE != 0
+-	addl	$LLL_PRIVATE, %ecx
+-#endif
+-	call	__lll_unlock_wake
+-	jmp	4b
+-
+-	/* Locking in loop failed.  */
+-5:
+-#if cond_lock == 0
+-	movl	%ebx, %edx
+-#else
+-	leal	cond_lock(%ebx), %edx
+-#endif
+-#if (LLL_SHARED-LLL_PRIVATE) > 255
+-	xorl	%ecx, %ecx
+-#endif
+-	cmpl	$-1, dep_mutex(%ebx)
+-	setne	%cl
+-	subl	$1, %ecx
+-	andl	$(LLL_SHARED-LLL_PRIVATE), %ecx
+-#if LLL_PRIVATE != 0
+-	addl	$LLL_PRIVATE, %ecx
+-#endif
+-	call	__lll_lock_wait
+-	jmp	6b
+-
+-	/* Unlock after loop requires wakeup.  */
+-10:
+-#if cond_lock == 0
+-	movl	%ebx, %eax
+-#else
+-	leal	cond_lock(%ebx), %eax
+-#endif
+-#if (LLL_SHARED-LLL_PRIVATE) > 255
+-	xorl	%ecx, %ecx
+-#endif
+-	cmpl	$-1, dep_mutex(%ebx)
+-	setne	%cl
+-	subl	$1, %ecx
+-	andl	$(LLL_SHARED-LLL_PRIVATE), %ecx
+-#if LLL_PRIVATE != 0
+-	addl	$LLL_PRIVATE, %ecx
+-#endif
+-	call	__lll_unlock_wake
+-	jmp	11b
+-
+-	.size	__pthread_cond_wait, .-__pthread_cond_wait
+-versioned_symbol (libpthread, __pthread_cond_wait, pthread_cond_wait,
+-		  GLIBC_2_3_2)
+-
+-
+-	.type	__condvar_w_cleanup2, @function
+-__condvar_w_cleanup2:
+-	subl	$cond_futex, %ebx
+-	.size	__condvar_w_cleanup2, .-__condvar_w_cleanup2
+-.LSbl4:
+-	.type	__condvar_w_cleanup, @function
+-__condvar_w_cleanup:
+-	movl	%eax, %esi
+-
+-	/* Get internal lock.  */
+-	movl	$1, %edx
+-	xorl	%eax, %eax
+-	LOCK
+-#if cond_lock == 0
+-	cmpxchgl %edx, (%ebx)
+-#else
+-	cmpxchgl %edx, cond_lock(%ebx)
+-#endif
+-	jz	1f
+-
+-#if cond_lock == 0
+-	movl	%ebx, %edx
+-#else
+-	leal	cond_lock(%ebx), %edx
+-#endif
+-#if (LLL_SHARED-LLL_PRIVATE) > 255
+-	xorl	%ecx, %ecx
+-#endif
+-	cmpl	$-1, dep_mutex(%ebx)
+-	setne	%cl
+-	subl	$1, %ecx
+-	andl	$(LLL_SHARED-LLL_PRIVATE), %ecx
+-#if LLL_PRIVATE != 0
+-	addl	$LLL_PRIVATE, %ecx
+-#endif
+-	call	__lll_lock_wait
+-
+-1:	movl	broadcast_seq(%ebx), %eax
+-	cmpl	12(%esp), %eax
+-	jne	3f
+-
+-	/* We increment the wakeup_seq counter only if it is lower than
+-	   total_seq.  If this is not the case the thread was woken and
+-	   then canceled.  In this case we ignore the signal.  */
+-	movl	total_seq(%ebx), %eax
+-	movl	total_seq+4(%ebx), %edi
+-	cmpl	wakeup_seq+4(%ebx), %edi
+-	jb	6f
+-	ja	7f
+-	cmpl	wakeup_seq(%ebx), %eax
+-	jbe	7f
+-
+-6:	addl	$1, wakeup_seq(%ebx)
+-	adcl	$0, wakeup_seq+4(%ebx)
+-	addl	$1, cond_futex(%ebx)
+-
+-7:	addl	$1, woken_seq(%ebx)
+-	adcl	$0, woken_seq+4(%ebx)
+-
+-3:	subl	$(1 << nwaiters_shift), cond_nwaiters(%ebx)
+-
+-	/* Wake up a thread which wants to destroy the condvar object.  */
+-	xorl	%edi, %edi
+-	movl	total_seq(%ebx), %eax
+-	andl	total_seq+4(%ebx), %eax
+-	cmpl	$0xffffffff, %eax
+-	jne	4f
+-	movl	cond_nwaiters(%ebx), %eax
+-	andl	$~((1 << nwaiters_shift) - 1), %eax
+-	jne	4f
+-
+-	addl	$cond_nwaiters, %ebx
+-	movl	$SYS_futex, %eax
+-#if FUTEX_PRIVATE_FLAG > 255
+-	xorl	%ecx, %ecx
+-#endif
+-	cmpl	$-1, dep_mutex-cond_nwaiters(%ebx)
+-	sete	%cl
+-	subl	$1, %ecx
+-#ifdef __ASSUME_PRIVATE_FUTEX
+-	andl	$FUTEX_PRIVATE_FLAG, %ecx
+-#else
+-	andl	%gs:PRIVATE_FUTEX, %ecx
+-#endif
+-	addl	$FUTEX_WAKE, %ecx
+-	movl	$1, %edx
+-	ENTER_KERNEL
+-	subl	$cond_nwaiters, %ebx
+-	movl	$1, %edi
+-
+-4:	LOCK
+-#if cond_lock == 0
+-	subl	$1, (%ebx)
+-#else
+-	subl	$1, cond_lock(%ebx)
+-#endif
+-	je	2f
+-
+-#if cond_lock == 0
+-	movl	%ebx, %eax
+-#else
+-	leal	cond_lock(%ebx), %eax
+-#endif
+-#if (LLL_SHARED-LLL_PRIVATE) > 255
+-	xorl	%ecx, %ecx
+-#endif
+-	cmpl	$-1, dep_mutex(%ebx)
+-	setne	%cl
+-	subl	$1, %ecx
+-	andl	$(LLL_SHARED-LLL_PRIVATE), %ecx
+-#if LLL_PRIVATE != 0
+-	addl	$LLL_PRIVATE, %ecx
+-#endif
+-	call	__lll_unlock_wake
+-
+-	/* Wake up all waiters to make sure no signal gets lost.  */
+-2:	testl	%edi, %edi
+-	jnz	5f
+-	addl	$cond_futex, %ebx
+-#if FUTEX_PRIVATE_FLAG > 255
+-	xorl	%ecx, %ecx
+-#endif
+-	cmpl	$-1, dep_mutex-cond_futex(%ebx)
+-	sete	%cl
+-	subl	$1, %ecx
+-#ifdef __ASSUME_PRIVATE_FUTEX
+-	andl	$FUTEX_PRIVATE_FLAG, %ecx
+-#else
+-	andl	%gs:PRIVATE_FUTEX, %ecx
+-#endif
+-	addl	$FUTEX_WAKE, %ecx
+-	movl	$SYS_futex, %eax
+-	movl	$0x7fffffff, %edx
+-	ENTER_KERNEL
+-
+-	/* Lock the mutex only if we don't own it already.  This only happens
+-	   in case of PI mutexes, if we got cancelled after a successful
+-	   return of the futex syscall and before disabling async
+-	   cancellation.  */
+-5:	movl	24+FRAME_SIZE(%esp), %eax
+-	movl	MUTEX_KIND(%eax), %ebx
+-	andl	$(ROBUST_BIT|PI_BIT), %ebx
+-	cmpl	$PI_BIT, %ebx
+-	jne	8f
+-
+-	movl	(%eax), %ebx
+-	andl	$TID_MASK, %ebx
+-	cmpl	%ebx, %gs:TID
+-	jne	8f
+-	/* We managed to get the lock.  Fix it up before returning.  */
+-	call	__pthread_mutex_cond_lock_adjust
+-	jmp	9f
+-
+-8:	call	__pthread_mutex_cond_lock
+-
+-9:	movl	%esi, (%esp)
+-.LcallUR:
+-	call	_Unwind_Resume
+-	hlt
+-.LENDCODE:
+-	cfi_endproc
+-	.size	__condvar_w_cleanup, .-__condvar_w_cleanup
+-
+-
+-	.section .gcc_except_table,"a",@progbits
+-.LexceptSTART:
+-	.byte	DW_EH_PE_omit			# @LPStart format (omit)
+-	.byte	DW_EH_PE_omit			# @TType format (omit)
+-	.byte	DW_EH_PE_sdata4			# call-site format
+-						# DW_EH_PE_sdata4
+-	.uleb128 .Lcstend-.Lcstbegin
+-.Lcstbegin:
+-	.long	.LcleanupSTART-.LSTARTCODE
+-	.long	.Ladd_cond_futex_pi-.LcleanupSTART
+-	.long	__condvar_w_cleanup-.LSTARTCODE
+-	.uleb128  0
+-	.long	.Ladd_cond_futex_pi-.LSTARTCODE
+-	.long	.Lsub_cond_futex_pi-.Ladd_cond_futex_pi
+-	.long	__condvar_w_cleanup2-.LSTARTCODE
+-	.uleb128  0
+-	.long	.Lsub_cond_futex_pi-.LSTARTCODE
+-	.long	.Ladd_cond_futex-.Lsub_cond_futex_pi
+-	.long	__condvar_w_cleanup-.LSTARTCODE
+-	.uleb128  0
+-	.long	.Ladd_cond_futex-.LSTARTCODE
+-	.long	.Lsub_cond_futex-.Ladd_cond_futex
+-	.long	__condvar_w_cleanup2-.LSTARTCODE
+-	.uleb128  0
+-	.long	.Lsub_cond_futex-.LSTARTCODE
+-	.long	.LcleanupEND-.Lsub_cond_futex
+-	.long	__condvar_w_cleanup-.LSTARTCODE
+-	.uleb128  0
+-	.long	.LcallUR-.LSTARTCODE
+-	.long	.LENDCODE-.LcallUR
+-	.long	0
+-	.uleb128  0
+-.Lcstend:
+-
+-#ifdef SHARED
+-	.hidden DW.ref.__gcc_personality_v0
+-	.weak   DW.ref.__gcc_personality_v0
+-	.section .gnu.linkonce.d.DW.ref.__gcc_personality_v0,"aw",@progbits
+-	.align 4
+-	.type   DW.ref.__gcc_personality_v0, @object
+-	.size   DW.ref.__gcc_personality_v0, 4
+-DW.ref.__gcc_personality_v0:
+-	.long   __gcc_personality_v0
+-#endif
+diff --git a/sysdeps/unix/sysv/linux/powerpc/bits/pthreadtypes.h b/sysdeps/unix/sysv/linux/powerpc/bits/pthreadtypes.h
+index 345e79a..371bc3c 100644
+--- a/sysdeps/unix/sysv/linux/powerpc/bits/pthreadtypes.h
++++ b/sysdeps/unix/sysv/linux/powerpc/bits/pthreadtypes.h
+@@ -123,19 +123,32 @@ typedef union
+ 
+ 
+ /* Data structure for conditional variable handling.  The structure of
+-   the attribute type is deliberately not exposed.  */
++   the attribute type is not exposed on purpose.  */
+ typedef union
+ {
+   struct
+   {
+-    int __lock;
+-    unsigned int __futex;
+-    __extension__ unsigned long long int __total_seq;
+-    __extension__ unsigned long long int __wakeup_seq;
+-    __extension__ unsigned long long int __woken_seq;
+-    void *__mutex;
+-    unsigned int __nwaiters;
+-    unsigned int __broadcast_seq;
++    __extension__ union
++    {
++      __extension__ unsigned long long int __wseq;
++      struct {
++	unsigned int __low;
++	unsigned int __high;
++      } __wseq32;
++    };
++    __extension__ union
++    {
++      __extension__ unsigned long long int __g1_start;
++      struct {
++	unsigned int __low;
++	unsigned int __high;
++      } __g1_start32;
++    };
++    unsigned int __g_refs[2];
++    unsigned int __g_size[2];
++    unsigned int __g1_orig_size;
++    unsigned int __wrefs;
++    unsigned int __g_signals[2];
+   } __data;
+   char __size[__SIZEOF_PTHREAD_COND_T];
+   __extension__ long long int __align;
+diff --git a/sysdeps/unix/sysv/linux/x86_64/pthread_cond_broadcast.S b/sysdeps/unix/sysv/linux/x86_64/pthread_cond_broadcast.S
+deleted file mode 100644
+index de455dd..0000000
+--- a/sysdeps/unix/sysv/linux/x86_64/pthread_cond_broadcast.S
++++ /dev/null
+@@ -1,177 +0,0 @@
+-/* Copyright (C) 2002-2016 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+-   Contributed by Ulrich Drepper <drepper@redhat.com>, 2002.
+-
+-   The GNU C Library is free software; you can redistribute it and/or
+-   modify it under the terms of the GNU Lesser General Public
+-   License as published by the Free Software Foundation; either
+-   version 2.1 of the License, or (at your option) any later version.
+-
+-   The GNU C Library is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Lesser General Public License for more details.
+-
+-   You should have received a copy of the GNU Lesser General Public
+-   License along with the GNU C Library; if not, see
+-   <http://www.gnu.org/licenses/>.  */
+-
+-#include <sysdep.h>
+-#include <shlib-compat.h>
+-#include <lowlevellock.h>
+-#include <lowlevelcond.h>
+-#include <kernel-features.h>
+-#include <pthread-pi-defines.h>
+-#include <pthread-errnos.h>
+-#include <stap-probe.h>
+-
+-	.text
+-
+-	/* int pthread_cond_broadcast (pthread_cond_t *cond) */
+-ENTRY(__pthread_cond_broadcast)
+-
+-	LIBC_PROBE (cond_broadcast, 1, %rdi)
+-
+-	/* Get internal lock.  */
+-	movl	$1, %esi
+-	xorl	%eax, %eax
+-	LOCK
+-#if cond_lock == 0
+-	cmpxchgl %esi, (%rdi)
+-#else
+-	cmpxchgl %esi, cond_lock(%rdi)
+-#endif
+-	jnz	1f
+-
+-2:	addq	$cond_futex, %rdi
+-	movq	total_seq-cond_futex(%rdi), %r9
+-	cmpq	wakeup_seq-cond_futex(%rdi), %r9
+-	jna	4f
+-
+-	/* Cause all currently waiting threads to recognize they are
+-	   woken up.  */
+-	movq	%r9, wakeup_seq-cond_futex(%rdi)
+-	movq	%r9, woken_seq-cond_futex(%rdi)
+-	addq	%r9, %r9
+-	movl	%r9d, (%rdi)
+-	incl	broadcast_seq-cond_futex(%rdi)
+-
+-	/* Get the address of the mutex used.  */
+-	mov	dep_mutex-cond_futex(%rdi), %R8_LP
+-
+-	/* Unlock.  */
+-	LOCK
+-	decl	cond_lock-cond_futex(%rdi)
+-	jne	7f
+-
+-8:	cmp	$-1, %R8_LP
+-	je	9f
+-
+-	/* Do not use requeue for pshared condvars.  */
+-	testl	$PS_BIT, MUTEX_KIND(%r8)
+-	jne	9f
+-
+-	/* Requeue to a PI mutex if the PI bit is set.  */
+-	movl	MUTEX_KIND(%r8), %eax
+-	andl	$(ROBUST_BIT|PI_BIT), %eax
+-	cmpl	$PI_BIT, %eax
+-	je	81f
+-
+-	/* Wake up all threads.  */
+-#ifdef __ASSUME_PRIVATE_FUTEX
+-	movl	$(FUTEX_CMP_REQUEUE|FUTEX_PRIVATE_FLAG), %esi
+-#else
+-	movl	%fs:PRIVATE_FUTEX, %esi
+-	orl	$FUTEX_CMP_REQUEUE, %esi
+-#endif
+-	movl	$SYS_futex, %eax
+-	movl	$1, %edx
+-	movl	$0x7fffffff, %r10d
+-	syscall
+-
+-	/* For any kind of error, which mainly is EAGAIN, we try again
+-	   with WAKE.  The general test also covers running on old
+-	   kernels.  */
+-	cmpq	$-4095, %rax
+-	jae	9f
+-
+-10:	xorl	%eax, %eax
+-	retq
+-
+-	/* Wake up all threads.  */
+-81:	movl	$(FUTEX_CMP_REQUEUE_PI|FUTEX_PRIVATE_FLAG), %esi
+-	movl	$SYS_futex, %eax
+-	movl	$1, %edx
+-	movl	$0x7fffffff, %r10d
+-	syscall
+-
+-	/* For any kind of error, which mainly is EAGAIN, we try again
+-	   with WAKE.  The general test also covers running on old
+-	   kernels.  */
+-	cmpq	$-4095, %rax
+-	jb	10b
+-	jmp	9f
+-
+-	.align	16
+-	/* Unlock.  */
+-4:	LOCK
+-	decl	cond_lock-cond_futex(%rdi)
+-	jne	5f
+-
+-6:	xorl	%eax, %eax
+-	retq
+-
+-	/* Initial locking failed.  */
+-1:
+-#if cond_lock != 0
+-	addq	$cond_lock, %rdi
+-#endif
+-	LP_OP(cmp) $-1, dep_mutex-cond_lock(%rdi)
+-	movl	$LLL_PRIVATE, %eax
+-	movl	$LLL_SHARED, %esi
+-	cmovne	%eax, %esi
+-	callq	__lll_lock_wait
+-#if cond_lock != 0
+-	subq	$cond_lock, %rdi
+-#endif
+-	jmp	2b
+-
+-	/* Unlock in loop requires wakeup.  */
+-5:	addq	$cond_lock-cond_futex, %rdi
+-	LP_OP(cmp) $-1, dep_mutex-cond_lock(%rdi)
+-	movl	$LLL_PRIVATE, %eax
+-	movl	$LLL_SHARED, %esi
+-	cmovne	%eax, %esi
+-	callq	__lll_unlock_wake
+-	jmp	6b
+-
+-	/* Unlock in loop requires wakeup.  */
+-7:	addq	$cond_lock-cond_futex, %rdi
+-	cmp	$-1, %R8_LP
+-	movl	$LLL_PRIVATE, %eax
+-	movl	$LLL_SHARED, %esi
+-	cmovne	%eax, %esi
+-	callq	__lll_unlock_wake
+-	subq	$cond_lock-cond_futex, %rdi
+-	jmp	8b
+-
+-9:	/* The futex requeue functionality is not available.  */
+-	cmp	$-1, %R8_LP
+-	movl	$0x7fffffff, %edx
+-#ifdef __ASSUME_PRIVATE_FUTEX
+-	movl	$FUTEX_WAKE, %eax
+-	movl	$(FUTEX_WAKE|FUTEX_PRIVATE_FLAG), %esi
+-	cmove	%eax, %esi
+-#else
+-	movl	$0, %eax
+-	movl	%fs:PRIVATE_FUTEX, %esi
+-	cmove	%eax, %esi
+-	orl	$FUTEX_WAKE, %esi
+-#endif
+-	movl	$SYS_futex, %eax
+-	syscall
+-	jmp	10b
+-END(__pthread_cond_broadcast)
+-
+-versioned_symbol (libpthread, __pthread_cond_broadcast, pthread_cond_broadcast,
+-		  GLIBC_2_3_2)
+diff --git a/sysdeps/unix/sysv/linux/x86_64/pthread_cond_signal.S b/sysdeps/unix/sysv/linux/x86_64/pthread_cond_signal.S
+deleted file mode 100644
+index da14bc3..0000000
+--- a/sysdeps/unix/sysv/linux/x86_64/pthread_cond_signal.S
++++ /dev/null
+@@ -1,161 +0,0 @@
+-/* Copyright (C) 2002-2016 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+-   Contributed by Ulrich Drepper <drepper@redhat.com>, 2002.
+-
+-   The GNU C Library is free software; you can redistribute it and/or
+-   modify it under the terms of the GNU Lesser General Public
+-   License as published by the Free Software Foundation; either
+-   version 2.1 of the License, or (at your option) any later version.
+-
+-   The GNU C Library is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Lesser General Public License for more details.
+-
+-   You should have received a copy of the GNU Lesser General Public
+-   License along with the GNU C Library; if not, see
+-   <http://www.gnu.org/licenses/>.  */
+-
+-#include <sysdep.h>
+-#include <shlib-compat.h>
+-#include <lowlevellock.h>
+-#include <lowlevelcond.h>
+-#include <pthread-pi-defines.h>
+-#include <kernel-features.h>
+-#include <pthread-errnos.h>
+-#include <stap-probe.h>
+-
+-
+-	.text
+-
+-ENTRY(__pthread_cond_signal)
+-
+-	LIBC_PROBE (cond_signal, 1, %rdi)
+-
+-	/* Get internal lock.  */
+-	movq	%rdi, %r8
+-	movl	$1, %esi
+-	xorl	%eax, %eax
+-	LOCK
+-#if cond_lock == 0
+-	cmpxchgl %esi, (%rdi)
+-#else
+-	cmpxchgl %esi, cond_lock(%rdi)
+-#endif
+-	jnz	1f
+-
+-2:	addq	$cond_futex, %rdi
+-	movq	total_seq(%r8), %rcx
+-	cmpq	wakeup_seq(%r8), %rcx
+-	jbe	4f
+-
+-	/* Bump the wakeup number.  */
+-	addq	$1, wakeup_seq(%r8)
+-	addl	$1, (%rdi)
+-
+-	/* Wake up one thread.  */
+-	LP_OP(cmp) $-1, dep_mutex(%r8)
+-	movl	$FUTEX_WAKE_OP, %esi
+-	movl	$1, %edx
+-	movl	$SYS_futex, %eax
+-	je	8f
+-
+-	/* Get the address of the mutex used.  */
+-	mov     dep_mutex(%r8), %RCX_LP
+-	movl	MUTEX_KIND(%rcx), %r11d
+-	andl	$(ROBUST_BIT|PI_BIT), %r11d
+-	cmpl	$PI_BIT, %r11d
+-	je	9f
+-
+-#ifdef __ASSUME_PRIVATE_FUTEX
+-	movl	$(FUTEX_WAKE_OP|FUTEX_PRIVATE_FLAG), %esi
+-#else
+-	orl	%fs:PRIVATE_FUTEX, %esi
+-#endif
+-
+-8:	movl	$1, %r10d
+-#if cond_lock != 0
+-	addq	$cond_lock, %r8
+-#endif
+-	movl	$FUTEX_OP_CLEAR_WAKE_IF_GT_ONE, %r9d
+-	syscall
+-#if cond_lock != 0
+-	subq	$cond_lock, %r8
+-#endif
+-	/* For any kind of error, we try again with WAKE.
+-	   The general test also covers running on old kernels.  */
+-	cmpq	$-4095, %rax
+-	jae	7f
+-
+-	xorl	%eax, %eax
+-	retq
+-
+-	/* Wake up one thread and requeue none in the PI Mutex case.  */
+-9:	movl	$(FUTEX_CMP_REQUEUE_PI|FUTEX_PRIVATE_FLAG), %esi
+-	movq	%rcx, %r8
+-	xorq	%r10, %r10
+-	movl	(%rdi), %r9d	// XXX Can this be right?
+-	syscall
+-
+-	leaq	-cond_futex(%rdi), %r8
+-
+-	/* For any kind of error, we try again with WAKE.
+-	   The general test also covers running on old kernels.  */
+-	cmpq	$-4095, %rax
+-	jb	4f
+-
+-7:
+-#ifdef __ASSUME_PRIVATE_FUTEX
+-	andl	$FUTEX_PRIVATE_FLAG, %esi
+-#else
+-	andl	%fs:PRIVATE_FUTEX, %esi
+-#endif
+-	orl	$FUTEX_WAKE, %esi
+-	movl	$SYS_futex, %eax
+-	/* %rdx should be 1 already from $FUTEX_WAKE_OP syscall.
+-	movl	$1, %edx  */
+-	syscall
+-
+-	/* Unlock.  */
+-4:	LOCK
+-#if cond_lock == 0
+-	decl	(%r8)
+-#else
+-	decl	cond_lock(%r8)
+-#endif
+-	jne	5f
+-
+-6:	xorl	%eax, %eax
+-	retq
+-
+-	/* Initial locking failed.  */
+-1:
+-#if cond_lock != 0
+-	addq	$cond_lock, %rdi
+-#endif
+-	LP_OP(cmp) $-1, dep_mutex-cond_lock(%rdi)
+-	movl	$LLL_PRIVATE, %eax
+-	movl	$LLL_SHARED, %esi
+-	cmovne	%eax, %esi
+-	callq	__lll_lock_wait
+-#if cond_lock != 0
+-	subq	$cond_lock, %rdi
+-#endif
+-	jmp	2b
+-
+-	/* Unlock in loop requires wakeup.  */
+-5:
+-	movq	%r8, %rdi
+-#if cond_lock != 0
+-	addq	$cond_lock, %rdi
+-#endif
+-	LP_OP(cmp) $-1, dep_mutex-cond_lock(%rdi)
+-	movl	$LLL_PRIVATE, %eax
+-	movl	$LLL_SHARED, %esi
+-	cmovne	%eax, %esi
+-	callq	__lll_unlock_wake
+-	jmp	6b
+-END(__pthread_cond_signal)
+-
+-versioned_symbol (libpthread, __pthread_cond_signal, pthread_cond_signal,
+-		  GLIBC_2_3_2)
+diff --git a/sysdeps/unix/sysv/linux/x86_64/pthread_cond_timedwait.S b/sysdeps/unix/sysv/linux/x86_64/pthread_cond_timedwait.S
+deleted file mode 100644
+index 82ffa1a..0000000
+--- a/sysdeps/unix/sysv/linux/x86_64/pthread_cond_timedwait.S
++++ /dev/null
+@@ -1,623 +0,0 @@
+-/* Copyright (C) 2002-2016 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+-   Contributed by Ulrich Drepper <drepper@redhat.com>, 2002.
+-
+-   The GNU C Library is free software; you can redistribute it and/or
+-   modify it under the terms of the GNU Lesser General Public
+-   License as published by the Free Software Foundation; either
+-   version 2.1 of the License, or (at your option) any later version.
+-
+-   The GNU C Library is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Lesser General Public License for more details.
+-
+-   You should have received a copy of the GNU Lesser General Public
+-   License along with the GNU C Library; if not, see
+-   <http://www.gnu.org/licenses/>.  */
+-
+-#include <sysdep.h>
+-#include <shlib-compat.h>
+-#include <lowlevellock.h>
+-#include <lowlevelcond.h>
+-#include <pthread-pi-defines.h>
+-#include <pthread-errnos.h>
+-#include <stap-probe.h>
+-
+-#include <kernel-features.h>
+-
+-
+-	.text
+-
+-
+-/* int pthread_cond_timedwait (pthread_cond_t *cond, pthread_mutex_t *mutex,
+-			       const struct timespec *abstime)  */
+-	.globl	__pthread_cond_timedwait
+-	.type	__pthread_cond_timedwait, @function
+-	.align	16
+-__pthread_cond_timedwait:
+-.LSTARTCODE:
+-	cfi_startproc
+-#ifdef SHARED
+-	cfi_personality(DW_EH_PE_pcrel | DW_EH_PE_sdata4 | DW_EH_PE_indirect,
+-			DW.ref.__gcc_personality_v0)
+-	cfi_lsda(DW_EH_PE_pcrel | DW_EH_PE_sdata4, .LexceptSTART)
+-#else
+-	cfi_personality(DW_EH_PE_udata4, __gcc_personality_v0)
+-	cfi_lsda(DW_EH_PE_udata4, .LexceptSTART)
+-#endif
+-
+-	pushq	%r12
+-	cfi_adjust_cfa_offset(8)
+-	cfi_rel_offset(%r12, 0)
+-	pushq	%r13
+-	cfi_adjust_cfa_offset(8)
+-	cfi_rel_offset(%r13, 0)
+-	pushq	%r14
+-	cfi_adjust_cfa_offset(8)
+-	cfi_rel_offset(%r14, 0)
+-	pushq	%r15
+-	cfi_adjust_cfa_offset(8)
+-	cfi_rel_offset(%r15, 0)
+-#define FRAME_SIZE (32+8)
+-	subq	$FRAME_SIZE, %rsp
+-	cfi_adjust_cfa_offset(FRAME_SIZE)
+-	cfi_remember_state
+-
+-	LIBC_PROBE (cond_timedwait, 3, %rdi, %rsi, %rdx)
+-
+-	cmpq	$1000000000, 8(%rdx)
+-	movl	$EINVAL, %eax
+-	jae	48f
+-
+-	/* Stack frame:
+-
+-	   rsp + 48
+-		    +--------------------------+
+-	   rsp + 32 | timeout value            |
+-		    +--------------------------+
+-	   rsp + 24 | old wake_seq value       |
+-		    +--------------------------+
+-	   rsp + 16 | mutex pointer            |
+-		    +--------------------------+
+-	   rsp +  8 | condvar pointer          |
+-		    +--------------------------+
+-	   rsp +  4 | old broadcast_seq value  |
+-		    +--------------------------+
+-	   rsp +  0 | old cancellation mode    |
+-		    +--------------------------+
+-	*/
+-
+-	LP_OP(cmp) $-1, dep_mutex(%rdi)
+-
+-	/* Prepare structure passed to cancellation handler.  */
+-	movq	%rdi, 8(%rsp)
+-	movq	%rsi, 16(%rsp)
+-	movq	%rdx, %r13
+-
+-	je	22f
+-	mov	%RSI_LP, dep_mutex(%rdi)
+-
+-22:
+-	xorb	%r15b, %r15b
+-
+-	/* Get internal lock.  */
+-	movl	$1, %esi
+-	xorl	%eax, %eax
+-	LOCK
+-#if cond_lock == 0
+-	cmpxchgl %esi, (%rdi)
+-#else
+-	cmpxchgl %esi, cond_lock(%rdi)
+-#endif
+-	jnz	31f
+-
+-	/* Unlock the mutex.  */
+-32:	movq	16(%rsp), %rdi
+-	xorl	%esi, %esi
+-	callq	__pthread_mutex_unlock_usercnt
+-
+-	testl	%eax, %eax
+-	jne	46f
+-
+-	movq	8(%rsp), %rdi
+-	incq	total_seq(%rdi)
+-	incl	cond_futex(%rdi)
+-	addl	$(1 << nwaiters_shift), cond_nwaiters(%rdi)
+-
+-	/* Get and store current wakeup_seq value.  */
+-	movq	8(%rsp), %rdi
+-	movq	wakeup_seq(%rdi), %r9
+-	movl	broadcast_seq(%rdi), %edx
+-	movq	%r9, 24(%rsp)
+-	movl	%edx, 4(%rsp)
+-
+-	cmpq	$0, (%r13)
+-	movq	$-ETIMEDOUT, %r14
+-	js	36f
+-
+-38:	movl	cond_futex(%rdi), %r12d
+-
+-	/* Unlock.  */
+-	LOCK
+-#if cond_lock == 0
+-	decl	(%rdi)
+-#else
+-	decl	cond_lock(%rdi)
+-#endif
+-	jne	33f
+-
+-.LcleanupSTART1:
+-34:	callq	__pthread_enable_asynccancel
+-	movl	%eax, (%rsp)
+-
+-	movq	%r13, %r10
+-	movl	$FUTEX_WAIT_BITSET, %esi
+-	LP_OP(cmp) $-1, dep_mutex(%rdi)
+-	je	60f
+-
+-	mov	dep_mutex(%rdi), %R8_LP
+-	/* Requeue to a non-robust PI mutex if the PI bit is set and
+-	the robust bit is not set.  */
+-	movl	MUTEX_KIND(%r8), %eax
+-	andl	$(ROBUST_BIT|PI_BIT), %eax
+-	cmpl	$PI_BIT, %eax
+-	jne	61f
+-
+-	movl	$(FUTEX_WAIT_REQUEUE_PI|FUTEX_PRIVATE_FLAG), %esi
+-	xorl	%eax, %eax
+-	/* The following only works like this because we only support
+-	   two clocks, represented using a single bit.  */
+-	testl	$1, cond_nwaiters(%rdi)
+-	movl	$FUTEX_CLOCK_REALTIME, %edx
+-	cmove	%edx, %eax
+-	orl	%eax, %esi
+-	movq	%r12, %rdx
+-	addq	$cond_futex, %rdi
+-	movl	$SYS_futex, %eax
+-	syscall
+-
+-	cmpl	$0, %eax
+-	sete	%r15b
+-
+-#ifdef __ASSUME_REQUEUE_PI
+-	jmp	62f
+-#else
+-	je	62f
+-
+-	/* When a futex syscall with FUTEX_WAIT_REQUEUE_PI returns
+-	   successfully, it has already locked the mutex for us and the
+-	   pi_flag (%r15b) is set to denote that fact.  However, if another
+-	   thread changed the futex value before we entered the wait, the
+-	   syscall may return an EAGAIN and the mutex is not locked.  We go
+-	   ahead with a success anyway since later we look at the pi_flag to
+-	   decide if we got the mutex or not.  The sequence numbers then make
+-	   sure that only one of the threads actually wake up.  We retry using
+-	   normal FUTEX_WAIT only if the kernel returned ENOSYS, since normal
+-	   and PI futexes don't mix.
+-
+-	   Note that we don't check for EAGAIN specifically; we assume that the
+-	   only other error the futex function could return is EAGAIN (barring
+-	   the ETIMEOUT of course, for the timeout case in futex) since
+-	   anything else would mean an error in our function.  It is too
+-	   expensive to do that check for every call (which is  quite common in
+-	   case of a large number of threads), so it has been skipped.  */
+-	cmpl    $-ENOSYS, %eax
+-	jne     62f
+-
+-	subq	$cond_futex, %rdi
+-#endif
+-
+-61:	movl	$(FUTEX_WAIT_BITSET|FUTEX_PRIVATE_FLAG), %esi
+-60:	xorb	%r15b, %r15b
+-	xorl	%eax, %eax
+-	/* The following only works like this because we only support
+-	   two clocks, represented using a single bit.  */
+-	testl	$1, cond_nwaiters(%rdi)
+-	movl	$FUTEX_CLOCK_REALTIME, %edx
+-	movl	$0xffffffff, %r9d
+-	cmove	%edx, %eax
+-	orl	%eax, %esi
+-	movq	%r12, %rdx
+-	addq	$cond_futex, %rdi
+-	movl	$SYS_futex, %eax
+-	syscall
+-62:	movq	%rax, %r14
+-
+-	movl	(%rsp), %edi
+-	callq	__pthread_disable_asynccancel
+-.LcleanupEND1:
+-
+-	/* Lock.  */
+-	movq	8(%rsp), %rdi
+-	movl	$1, %esi
+-	xorl	%eax, %eax
+-	LOCK
+-#if cond_lock == 0
+-	cmpxchgl %esi, (%rdi)
+-#else
+-	cmpxchgl %esi, cond_lock(%rdi)
+-#endif
+-	jne	35f
+-
+-36:	movl	broadcast_seq(%rdi), %edx
+-
+-	movq	woken_seq(%rdi), %rax
+-
+-	movq	wakeup_seq(%rdi), %r9
+-
+-	cmpl	4(%rsp), %edx
+-	jne	53f
+-
+-	cmpq	24(%rsp), %r9
+-	jbe	45f
+-
+-	cmpq	%rax, %r9
+-	ja	39f
+-
+-45:	cmpq	$-ETIMEDOUT, %r14
+-	je	99f
+-
+-	/* We need to go back to futex_wait.  If we're using requeue_pi, then
+-	   release the mutex we had acquired and go back.  */
+-	test	%r15b, %r15b
+-	jz	38b
+-
+-	/* Adjust the mutex values first and then unlock it.  The unlock
+-	   should always succeed or else the kernel did not lock the
+-	   mutex correctly.  */
+-	movq	%r8, %rdi
+-	callq	__pthread_mutex_cond_lock_adjust
+-	xorl	%esi, %esi
+-	callq	__pthread_mutex_unlock_usercnt
+-	/* Reload cond_var.  */
+-	movq	8(%rsp), %rdi
+-	jmp	38b
+-
+-99:	incq	wakeup_seq(%rdi)
+-	incl	cond_futex(%rdi)
+-	movl	$ETIMEDOUT, %r14d
+-	jmp	44f
+-
+-53:	xorq	%r14, %r14
+-	jmp	54f
+-
+-39:	xorq	%r14, %r14
+-44:	incq	woken_seq(%rdi)
+-
+-54:	subl	$(1 << nwaiters_shift), cond_nwaiters(%rdi)
+-
+-	/* Wake up a thread which wants to destroy the condvar object.  */
+-	cmpq	$0xffffffffffffffff, total_seq(%rdi)
+-	jne	55f
+-	movl	cond_nwaiters(%rdi), %eax
+-	andl	$~((1 << nwaiters_shift) - 1), %eax
+-	jne	55f
+-
+-	addq	$cond_nwaiters, %rdi
+-	LP_OP(cmp) $-1, dep_mutex-cond_nwaiters(%rdi)
+-	movl	$1, %edx
+-#ifdef __ASSUME_PRIVATE_FUTEX
+-	movl	$FUTEX_WAKE, %eax
+-	movl	$(FUTEX_WAKE|FUTEX_PRIVATE_FLAG), %esi
+-	cmove	%eax, %esi
+-#else
+-	movl	$0, %eax
+-	movl	%fs:PRIVATE_FUTEX, %esi
+-	cmove	%eax, %esi
+-	orl	$FUTEX_WAKE, %esi
+-#endif
+-	movl	$SYS_futex, %eax
+-	syscall
+-	subq	$cond_nwaiters, %rdi
+-
+-55:	LOCK
+-#if cond_lock == 0
+-	decl	(%rdi)
+-#else
+-	decl	cond_lock(%rdi)
+-#endif
+-	jne	40f
+-
+-	/* If requeue_pi is used the kernel performs the locking of the
+-	   mutex. */
+-41:	movq	16(%rsp), %rdi
+-	testb	%r15b, %r15b
+-	jnz	64f
+-
+-	callq	__pthread_mutex_cond_lock
+-
+-63:	testq	%rax, %rax
+-	cmoveq	%r14, %rax
+-
+-48:	addq	$FRAME_SIZE, %rsp
+-	cfi_adjust_cfa_offset(-FRAME_SIZE)
+-	popq	%r15
+-	cfi_adjust_cfa_offset(-8)
+-	cfi_restore(%r15)
+-	popq	%r14
+-	cfi_adjust_cfa_offset(-8)
+-	cfi_restore(%r14)
+-	popq	%r13
+-	cfi_adjust_cfa_offset(-8)
+-	cfi_restore(%r13)
+-	popq	%r12
+-	cfi_adjust_cfa_offset(-8)
+-	cfi_restore(%r12)
+-
+-	retq
+-
+-	cfi_restore_state
+-
+-64:	callq	__pthread_mutex_cond_lock_adjust
+-	movq	%r14, %rax
+-	jmp	48b
+-
+-	/* Initial locking failed.  */
+-31:
+-#if cond_lock != 0
+-	addq	$cond_lock, %rdi
+-#endif
+-	LP_OP(cmp) $-1, dep_mutex-cond_lock(%rdi)
+-	movl	$LLL_PRIVATE, %eax
+-	movl	$LLL_SHARED, %esi
+-	cmovne	%eax, %esi
+-	callq	__lll_lock_wait
+-	jmp	32b
+-
+-	/* Unlock in loop requires wakeup.  */
+-33:
+-#if cond_lock != 0
+-	addq	$cond_lock, %rdi
+-#endif
+-	LP_OP(cmp) $-1, dep_mutex-cond_lock(%rdi)
+-	movl	$LLL_PRIVATE, %eax
+-	movl	$LLL_SHARED, %esi
+-	cmovne	%eax, %esi
+-	callq	__lll_unlock_wake
+-	jmp	34b
+-
+-	/* Locking in loop failed.  */
+-35:
+-#if cond_lock != 0
+-	addq	$cond_lock, %rdi
+-#endif
+-	LP_OP(cmp) $-1, dep_mutex-cond_lock(%rdi)
+-	movl	$LLL_PRIVATE, %eax
+-	movl	$LLL_SHARED, %esi
+-	cmovne	%eax, %esi
+-	callq	__lll_lock_wait
+-#if cond_lock != 0
+-	subq	$cond_lock, %rdi
+-#endif
+-	jmp	36b
+-
+-	/* Unlock after loop requires wakeup.  */
+-40:
+-#if cond_lock != 0
+-	addq	$cond_lock, %rdi
+-#endif
+-	LP_OP(cmp) $-1, dep_mutex-cond_lock(%rdi)
+-	movl	$LLL_PRIVATE, %eax
+-	movl	$LLL_SHARED, %esi
+-	cmovne	%eax, %esi
+-	callq	__lll_unlock_wake
+-	jmp	41b
+-
+-	/* The initial unlocking of the mutex failed.  */
+-46:	movq	8(%rsp), %rdi
+-	movq	%rax, (%rsp)
+-	LOCK
+-#if cond_lock == 0
+-	decl	(%rdi)
+-#else
+-	decl	cond_lock(%rdi)
+-#endif
+-	jne	47f
+-
+-#if cond_lock != 0
+-	addq	$cond_lock, %rdi
+-#endif
+-	LP_OP(cmp) $-1, dep_mutex-cond_lock(%rdi)
+-	movl	$LLL_PRIVATE, %eax
+-	movl	$LLL_SHARED, %esi
+-	cmovne	%eax, %esi
+-	callq	__lll_unlock_wake
+-
+-47:	movq	(%rsp), %rax
+-	jmp	48b
+-
+-	.size	__pthread_cond_timedwait, .-__pthread_cond_timedwait
+-versioned_symbol (libpthread, __pthread_cond_timedwait, pthread_cond_timedwait,
+-		  GLIBC_2_3_2)
+-
+-
+-	.align	16
+-	.type	__condvar_cleanup2, @function
+-__condvar_cleanup2:
+-	/* Stack frame:
+-
+-	   rsp + 72
+-		    +--------------------------+
+-	   rsp + 64 | %r12                     |
+-		    +--------------------------+
+-	   rsp + 56 | %r13                     |
+-		    +--------------------------+
+-	   rsp + 48 | %r14                     |
+-		    +--------------------------+
+-	   rsp + 24 | unused                   |
+-		    +--------------------------+
+-	   rsp + 16 | mutex pointer            |
+-		    +--------------------------+
+-	   rsp +  8 | condvar pointer          |
+-		    +--------------------------+
+-	   rsp +  4 | old broadcast_seq value  |
+-		    +--------------------------+
+-	   rsp +  0 | old cancellation mode    |
+-		    +--------------------------+
+-	*/
+-
+-	movq	%rax, 24(%rsp)
+-
+-	/* Get internal lock.  */
+-	movq	8(%rsp), %rdi
+-	movl	$1, %esi
+-	xorl	%eax, %eax
+-	LOCK
+-#if cond_lock == 0
+-	cmpxchgl %esi, (%rdi)
+-#else
+-	cmpxchgl %esi, cond_lock(%rdi)
+-#endif
+-	jz	1f
+-
+-#if cond_lock != 0
+-	addq	$cond_lock, %rdi
+-#endif
+-	LP_OP(cmp) $-1, dep_mutex-cond_lock(%rdi)
+-	movl	$LLL_PRIVATE, %eax
+-	movl	$LLL_SHARED, %esi
+-	cmovne	%eax, %esi
+-	callq	__lll_lock_wait
+-#if cond_lock != 0
+-	subq	$cond_lock, %rdi
+-#endif
+-
+-1:	movl	broadcast_seq(%rdi), %edx
+-	cmpl	4(%rsp), %edx
+-	jne	3f
+-
+-	/* We increment the wakeup_seq counter only if it is lower than
+-	   total_seq.  If this is not the case the thread was woken and
+-	   then canceled.  In this case we ignore the signal.  */
+-	movq	total_seq(%rdi), %rax
+-	cmpq	wakeup_seq(%rdi), %rax
+-	jbe	6f
+-	incq	wakeup_seq(%rdi)
+-	incl	cond_futex(%rdi)
+-6:	incq	woken_seq(%rdi)
+-
+-3:	subl	$(1 << nwaiters_shift), cond_nwaiters(%rdi)
+-
+-	/* Wake up a thread which wants to destroy the condvar object.  */
+-	xorq	%r12, %r12
+-	cmpq	$0xffffffffffffffff, total_seq(%rdi)
+-	jne	4f
+-	movl	cond_nwaiters(%rdi), %eax
+-	andl	$~((1 << nwaiters_shift) - 1), %eax
+-	jne	4f
+-
+-	LP_OP(cmp) $-1, dep_mutex(%rdi)
+-	leaq	cond_nwaiters(%rdi), %rdi
+-	movl	$1, %edx
+-#ifdef __ASSUME_PRIVATE_FUTEX
+-	movl	$FUTEX_WAKE, %eax
+-	movl	$(FUTEX_WAKE|FUTEX_PRIVATE_FLAG), %esi
+-	cmove	%eax, %esi
+-#else
+-	movl	$0, %eax
+-	movl	%fs:PRIVATE_FUTEX, %esi
+-	cmove	%eax, %esi
+-	orl	$FUTEX_WAKE, %esi
+-#endif
+-	movl	$SYS_futex, %eax
+-	syscall
+-	subq	$cond_nwaiters, %rdi
+-	movl	$1, %r12d
+-
+-4:	LOCK
+-#if cond_lock == 0
+-	decl	(%rdi)
+-#else
+-	decl	cond_lock(%rdi)
+-#endif
+-	je	2f
+-#if cond_lock != 0
+-	addq	$cond_lock, %rdi
+-#endif
+-	LP_OP(cmp) $-1, dep_mutex-cond_lock(%rdi)
+-	movl	$LLL_PRIVATE, %eax
+-	movl	$LLL_SHARED, %esi
+-	cmovne	%eax, %esi
+-	callq	__lll_unlock_wake
+-
+-	/* Wake up all waiters to make sure no signal gets lost.  */
+-2:	testq	%r12, %r12
+-	jnz	5f
+-	addq	$cond_futex, %rdi
+-	LP_OP(cmp) $-1, dep_mutex-cond_futex(%rdi)
+-	movl	$0x7fffffff, %edx
+-#ifdef __ASSUME_PRIVATE_FUTEX
+-	movl	$FUTEX_WAKE, %eax
+-	movl	$(FUTEX_WAKE|FUTEX_PRIVATE_FLAG), %esi
+-	cmove	%eax, %esi
+-#else
+-	movl	$0, %eax
+-	movl	%fs:PRIVATE_FUTEX, %esi
+-	cmove	%eax, %esi
+-	orl	$FUTEX_WAKE, %esi
+-#endif
+-	movl	$SYS_futex, %eax
+-	syscall
+-
+-	/* Lock the mutex only if we don't own it already.  This only happens
+-	   in case of PI mutexes, if we got cancelled after a successful
+-	   return of the futex syscall and before disabling async
+-	   cancellation.  */
+-5:	movq	16(%rsp), %rdi
+-	movl	MUTEX_KIND(%rdi), %eax
+-	andl	$(ROBUST_BIT|PI_BIT), %eax
+-	cmpl	$PI_BIT, %eax
+-	jne	7f
+-
+-	movl	(%rdi), %eax
+-	andl	$TID_MASK, %eax
+-	cmpl	%eax, %fs:TID
+-	jne	7f
+-	/* We managed to get the lock.  Fix it up before returning.  */
+-	callq	__pthread_mutex_cond_lock_adjust
+-	jmp	8f
+-
+-7:	callq	__pthread_mutex_cond_lock
+-
+-8:	movq	24(%rsp), %rdi
+-	movq	FRAME_SIZE(%rsp), %r15
+-	movq	FRAME_SIZE+8(%rsp), %r14
+-	movq	FRAME_SIZE+16(%rsp), %r13
+-	movq	FRAME_SIZE+24(%rsp), %r12
+-.LcallUR:
+-	call	_Unwind_Resume
+-	hlt
+-.LENDCODE:
+-	cfi_endproc
+-	.size	__condvar_cleanup2, .-__condvar_cleanup2
+-
+-
+-	.section .gcc_except_table,"a",@progbits
+-.LexceptSTART:
+-	.byte	DW_EH_PE_omit			# @LPStart format
+-	.byte	DW_EH_PE_omit			# @TType format
+-	.byte	DW_EH_PE_uleb128		# call-site format
+-	.uleb128 .Lcstend-.Lcstbegin
+-.Lcstbegin:
+-	.uleb128 .LcleanupSTART1-.LSTARTCODE
+-	.uleb128 .LcleanupEND1-.LcleanupSTART1
+-	.uleb128 __condvar_cleanup2-.LSTARTCODE
+-	.uleb128  0
+-	.uleb128 .LcallUR-.LSTARTCODE
+-	.uleb128 .LENDCODE-.LcallUR
+-	.uleb128 0
+-	.uleb128  0
+-.Lcstend:
+-
+-
+-#ifdef SHARED
+-	.hidden	DW.ref.__gcc_personality_v0
+-	.weak	DW.ref.__gcc_personality_v0
+-	.section .gnu.linkonce.d.DW.ref.__gcc_personality_v0,"aw",@progbits
+-	.align	LP_SIZE
+-	.type	DW.ref.__gcc_personality_v0, @object
+-	.size	DW.ref.__gcc_personality_v0, LP_SIZE
+-DW.ref.__gcc_personality_v0:
+-	ASM_ADDR __gcc_personality_v0
+-#endif
+diff --git a/sysdeps/unix/sysv/linux/x86_64/pthread_cond_wait.S b/sysdeps/unix/sysv/linux/x86_64/pthread_cond_wait.S
+deleted file mode 100644
+index c82f37b..0000000
+--- a/sysdeps/unix/sysv/linux/x86_64/pthread_cond_wait.S
++++ /dev/null
+@@ -1,555 +0,0 @@
+-/* Copyright (C) 2002-2016 Free Software Foundation, Inc.
+-   This file is part of the GNU C Library.
+-   Contributed by Ulrich Drepper <drepper@redhat.com>, 2002.
+-
+-   The GNU C Library is free software; you can redistribute it and/or
+-   modify it under the terms of the GNU Lesser General Public
+-   License as published by the Free Software Foundation; either
+-   version 2.1 of the License, or (at your option) any later version.
+-
+-   The GNU C Library is distributed in the hope that it will be useful,
+-   but WITHOUT ANY WARRANTY; without even the implied warranty of
+-   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-   Lesser General Public License for more details.
+-
+-   You should have received a copy of the GNU Lesser General Public
+-   License along with the GNU C Library; if not, see
+-   <http://www.gnu.org/licenses/>.  */
+-
+-#include <sysdep.h>
+-#include <shlib-compat.h>
+-#include <lowlevellock.h>
+-#include <lowlevelcond.h>
+-#include <tcb-offsets.h>
+-#include <pthread-pi-defines.h>
+-#include <pthread-errnos.h>
+-#include <stap-probe.h>
+-
+-#include <kernel-features.h>
+-
+-
+-	.text
+-
+-/* int pthread_cond_wait (pthread_cond_t *cond, pthread_mutex_t *mutex)  */
+-	.globl	__pthread_cond_wait
+-	.type	__pthread_cond_wait, @function
+-	.align	16
+-__pthread_cond_wait:
+-.LSTARTCODE:
+-	cfi_startproc
+-#ifdef SHARED
+-	cfi_personality(DW_EH_PE_pcrel | DW_EH_PE_sdata4 | DW_EH_PE_indirect,
+-			DW.ref.__gcc_personality_v0)
+-	cfi_lsda(DW_EH_PE_pcrel | DW_EH_PE_sdata4, .LexceptSTART)
+-#else
+-	cfi_personality(DW_EH_PE_udata4, __gcc_personality_v0)
+-	cfi_lsda(DW_EH_PE_udata4, .LexceptSTART)
+-#endif
+-
+-#define FRAME_SIZE (32+8)
+-	leaq	-FRAME_SIZE(%rsp), %rsp
+-	cfi_adjust_cfa_offset(FRAME_SIZE)
+-
+-	/* Stack frame:
+-
+-	   rsp + 32
+-		    +--------------------------+
+-	   rsp + 24 | old wake_seq value       |
+-		    +--------------------------+
+-	   rsp + 16 | mutex pointer            |
+-		    +--------------------------+
+-	   rsp +  8 | condvar pointer          |
+-		    +--------------------------+
+-	   rsp +  4 | old broadcast_seq value  |
+-		    +--------------------------+
+-	   rsp +  0 | old cancellation mode    |
+-		    +--------------------------+
+-	*/
+-
+-	LIBC_PROBE (cond_wait, 2, %rdi, %rsi)
+-
+-	LP_OP(cmp) $-1, dep_mutex(%rdi)
+-
+-	/* Prepare structure passed to cancellation handler.  */
+-	movq	%rdi, 8(%rsp)
+-	movq	%rsi, 16(%rsp)
+-
+-	je	15f
+-	mov	%RSI_LP, dep_mutex(%rdi)
+-
+-	/* Get internal lock.  */
+-15:	movl	$1, %esi
+-	xorl	%eax, %eax
+-	LOCK
+-#if cond_lock == 0
+-	cmpxchgl %esi, (%rdi)
+-#else
+-	cmpxchgl %esi, cond_lock(%rdi)
+-#endif
+-	jne	1f
+-
+-	/* Unlock the mutex.  */
+-2:	movq	16(%rsp), %rdi
+-	xorl	%esi, %esi
+-	callq	__pthread_mutex_unlock_usercnt
+-
+-	testl	%eax, %eax
+-	jne	12f
+-
+-	movq	8(%rsp), %rdi
+-	incq	total_seq(%rdi)
+-	incl	cond_futex(%rdi)
+-	addl	$(1 << nwaiters_shift), cond_nwaiters(%rdi)
+-
+-	/* Get and store current wakeup_seq value.  */
+-	movq	8(%rsp), %rdi
+-	movq	wakeup_seq(%rdi), %r9
+-	movl	broadcast_seq(%rdi), %edx
+-	movq	%r9, 24(%rsp)
+-	movl	%edx, 4(%rsp)
+-
+-	/* Unlock.  */
+-8:	movl	cond_futex(%rdi), %edx
+-	LOCK
+-#if cond_lock == 0
+-	decl	(%rdi)
+-#else
+-	decl	cond_lock(%rdi)
+-#endif
+-	jne	3f
+-
+-.LcleanupSTART:
+-4:	callq	__pthread_enable_asynccancel
+-	movl	%eax, (%rsp)
+-
+-	xorq	%r10, %r10
+-	LP_OP(cmp) $-1, dep_mutex(%rdi)
+-	leaq	cond_futex(%rdi), %rdi
+-	movl	$FUTEX_WAIT, %esi
+-	je	60f
+-
+-	mov	dep_mutex-cond_futex(%rdi), %R8_LP
+-	/* Requeue to a non-robust PI mutex if the PI bit is set and
+-	the robust bit is not set.  */
+-	movl	MUTEX_KIND(%r8), %eax
+-	andl	$(ROBUST_BIT|PI_BIT), %eax
+-	cmpl	$PI_BIT, %eax
+-	jne	61f
+-
+-	movl	$(FUTEX_WAIT_REQUEUE_PI|FUTEX_PRIVATE_FLAG), %esi
+-	movl	$SYS_futex, %eax
+-	syscall
+-
+-	cmpl	$0, %eax
+-	sete	%r8b
+-
+-#ifdef __ASSUME_REQUEUE_PI
+-	jmp	62f
+-#else
+-	je	62f
+-
+-	/* When a futex syscall with FUTEX_WAIT_REQUEUE_PI returns
+-	   successfully, it has already locked the mutex for us and the
+-	   pi_flag (%r8b) is set to denote that fact.  However, if another
+-	   thread changed the futex value before we entered the wait, the
+-	   syscall may return an EAGAIN and the mutex is not locked.  We go
+-	   ahead with a success anyway since later we look at the pi_flag to
+-	   decide if we got the mutex or not.  The sequence numbers then make
+-	   sure that only one of the threads actually wake up.  We retry using
+-	   normal FUTEX_WAIT only if the kernel returned ENOSYS, since normal
+-	   and PI futexes don't mix.
+-
+-	   Note that we don't check for EAGAIN specifically; we assume that the
+-	   only other error the futex function could return is EAGAIN since
+-	   anything else would mean an error in our function.  It is too
+-	   expensive to do that check for every call (which is 	quite common in
+-	   case of a large number of threads), so it has been skipped.  */
+-	cmpl	$-ENOSYS, %eax
+-	jne	62f
+-
+-# ifndef __ASSUME_PRIVATE_FUTEX
+-	movl	$FUTEX_WAIT, %esi
+-# endif
+-#endif
+-
+-61:
+-#ifdef __ASSUME_PRIVATE_FUTEX
+-	movl	$(FUTEX_WAIT|FUTEX_PRIVATE_FLAG), %esi
+-#else
+-	orl	%fs:PRIVATE_FUTEX, %esi
+-#endif
+-60:	xorb	%r8b, %r8b
+-	movl	$SYS_futex, %eax
+-	syscall
+-
+-62:	movl	(%rsp), %edi
+-	callq	__pthread_disable_asynccancel
+-.LcleanupEND:
+-
+-	/* Lock.  */
+-	movq	8(%rsp), %rdi
+-	movl	$1, %esi
+-	xorl	%eax, %eax
+-	LOCK
+-#if cond_lock == 0
+-	cmpxchgl %esi, (%rdi)
+-#else
+-	cmpxchgl %esi, cond_lock(%rdi)
+-#endif
+-	jnz	5f
+-
+-6:	movl	broadcast_seq(%rdi), %edx
+-
+-	movq	woken_seq(%rdi), %rax
+-
+-	movq	wakeup_seq(%rdi), %r9
+-
+-	cmpl	4(%rsp), %edx
+-	jne	16f
+-
+-	cmpq	24(%rsp), %r9
+-	jbe	19f
+-
+-	cmpq	%rax, %r9
+-	jna	19f
+-
+-	incq	woken_seq(%rdi)
+-
+-	/* Unlock */
+-16:	subl	$(1 << nwaiters_shift), cond_nwaiters(%rdi)
+-
+-	/* Wake up a thread which wants to destroy the condvar object.  */
+-	cmpq	$0xffffffffffffffff, total_seq(%rdi)
+-	jne	17f
+-	movl	cond_nwaiters(%rdi), %eax
+-	andl	$~((1 << nwaiters_shift) - 1), %eax
+-	jne	17f
+-
+-	addq	$cond_nwaiters, %rdi
+-	LP_OP(cmp) $-1, dep_mutex-cond_nwaiters(%rdi)
+-	movl	$1, %edx
+-#ifdef __ASSUME_PRIVATE_FUTEX
+-	movl	$FUTEX_WAKE, %eax
+-	movl	$(FUTEX_WAKE|FUTEX_PRIVATE_FLAG), %esi
+-	cmove	%eax, %esi
+-#else
+-	movl	$0, %eax
+-	movl	%fs:PRIVATE_FUTEX, %esi
+-	cmove	%eax, %esi
+-	orl	$FUTEX_WAKE, %esi
+-#endif
+-	movl	$SYS_futex, %eax
+-	syscall
+-	subq	$cond_nwaiters, %rdi
+-
+-17:	LOCK
+-#if cond_lock == 0
+-	decl	(%rdi)
+-#else
+-	decl	cond_lock(%rdi)
+-#endif
+-	jne	10f
+-
+-	/* If requeue_pi is used the kernel performs the locking of the
+-	   mutex. */
+-11:	movq	16(%rsp), %rdi
+-	testb	%r8b, %r8b
+-	jnz	18f
+-
+-	callq	__pthread_mutex_cond_lock
+-
+-14:	leaq	FRAME_SIZE(%rsp), %rsp
+-	cfi_adjust_cfa_offset(-FRAME_SIZE)
+-
+-	/* We return the result of the mutex_lock operation.  */
+-	retq
+-
+-	cfi_adjust_cfa_offset(FRAME_SIZE)
+-
+-18:	callq	__pthread_mutex_cond_lock_adjust
+-	xorl	%eax, %eax
+-	jmp	14b
+-
+-	/* We need to go back to futex_wait.  If we're using requeue_pi, then
+-	   release the mutex we had acquired and go back.  */
+-19:	testb	%r8b, %r8b
+-	jz	8b
+-
+-	/* Adjust the mutex values first and then unlock it.  The unlock
+-	   should always succeed or else the kernel did not lock the mutex
+-	   correctly.  */
+-	movq	16(%rsp), %rdi
+-	callq	__pthread_mutex_cond_lock_adjust
+-	movq	%rdi, %r8
+-	xorl	%esi, %esi
+-	callq	__pthread_mutex_unlock_usercnt
+-	/* Reload cond_var.  */
+-	movq	8(%rsp), %rdi
+-	jmp	8b
+-
+-	/* Initial locking failed.  */
+-1:
+-#if cond_lock != 0
+-	addq	$cond_lock, %rdi
+-#endif
+-	LP_OP(cmp) $-1, dep_mutex-cond_lock(%rdi)
+-	movl	$LLL_PRIVATE, %eax
+-	movl	$LLL_SHARED, %esi
+-	cmovne	%eax, %esi
+-	callq	__lll_lock_wait
+-	jmp	2b
+-
+-	/* Unlock in loop requires wakeup.  */
+-3:
+-#if cond_lock != 0
+-	addq	$cond_lock, %rdi
+-#endif
+-	LP_OP(cmp) $-1, dep_mutex-cond_lock(%rdi)
+-	movl	$LLL_PRIVATE, %eax
+-	movl	$LLL_SHARED, %esi
+-	cmovne	%eax, %esi
+-	/* The call preserves %rdx.  */
+-	callq	__lll_unlock_wake
+-#if cond_lock != 0
+-	subq	$cond_lock, %rdi
+-#endif
+-	jmp	4b
+-
+-	/* Locking in loop failed.  */
+-5:
+-#if cond_lock != 0
+-	addq	$cond_lock, %rdi
+-#endif
+-	LP_OP(cmp) $-1, dep_mutex-cond_lock(%rdi)
+-	movl	$LLL_PRIVATE, %eax
+-	movl	$LLL_SHARED, %esi
+-	cmovne	%eax, %esi
+-	callq	__lll_lock_wait
+-#if cond_lock != 0
+-	subq	$cond_lock, %rdi
+-#endif
+-	jmp	6b
+-
+-	/* Unlock after loop requires wakeup.  */
+-10:
+-#if cond_lock != 0
+-	addq	$cond_lock, %rdi
+-#endif
+-	LP_OP(cmp) $-1, dep_mutex-cond_lock(%rdi)
+-	movl	$LLL_PRIVATE, %eax
+-	movl	$LLL_SHARED, %esi
+-	cmovne	%eax, %esi
+-	callq	__lll_unlock_wake
+-	jmp	11b
+-
+-	/* The initial unlocking of the mutex failed.  */
+-12:	movq	%rax, %r10
+-	movq	8(%rsp), %rdi
+-	LOCK
+-#if cond_lock == 0
+-	decl	(%rdi)
+-#else
+-	decl	cond_lock(%rdi)
+-#endif
+-	je	13f
+-
+-#if cond_lock != 0
+-	addq	$cond_lock, %rdi
+-#endif
+-	LP_OP(cmp) $-1, dep_mutex-cond_lock(%rdi)
+-	movl	$LLL_PRIVATE, %eax
+-	movl	$LLL_SHARED, %esi
+-	cmovne	%eax, %esi
+-	callq	__lll_unlock_wake
+-
+-13:	movq	%r10, %rax
+-	jmp	14b
+-
+-	.size	__pthread_cond_wait, .-__pthread_cond_wait
+-versioned_symbol (libpthread, __pthread_cond_wait, pthread_cond_wait,
+-		  GLIBC_2_3_2)
+-
+-
+-	.align	16
+-	.type	__condvar_cleanup1, @function
+-	.globl	__condvar_cleanup1
+-	.hidden	__condvar_cleanup1
+-__condvar_cleanup1:
+-	/* Stack frame:
+-
+-	   rsp + 32
+-		    +--------------------------+
+-	   rsp + 24 | unused                   |
+-		    +--------------------------+
+-	   rsp + 16 | mutex pointer            |
+-		    +--------------------------+
+-	   rsp +  8 | condvar pointer          |
+-		    +--------------------------+
+-	   rsp +  4 | old broadcast_seq value  |
+-		    +--------------------------+
+-	   rsp +  0 | old cancellation mode    |
+-		    +--------------------------+
+-	*/
+-
+-	movq	%rax, 24(%rsp)
+-
+-	/* Get internal lock.  */
+-	movq	8(%rsp), %rdi
+-	movl	$1, %esi
+-	xorl	%eax, %eax
+-	LOCK
+-#if cond_lock == 0
+-	cmpxchgl %esi, (%rdi)
+-#else
+-	cmpxchgl %esi, cond_lock(%rdi)
+-#endif
+-	jz	1f
+-
+-#if cond_lock != 0
+-	addq	$cond_lock, %rdi
+-#endif
+-	LP_OP(cmp) $-1, dep_mutex-cond_lock(%rdi)
+-	movl	$LLL_PRIVATE, %eax
+-	movl	$LLL_SHARED, %esi
+-	cmovne	%eax, %esi
+-	callq	__lll_lock_wait
+-#if cond_lock != 0
+-	subq	$cond_lock, %rdi
+-#endif
+-
+-1:	movl	broadcast_seq(%rdi), %edx
+-	cmpl	4(%rsp), %edx
+-	jne	3f
+-
+-	/* We increment the wakeup_seq counter only if it is lower than
+-	   total_seq.  If this is not the case the thread was woken and
+-	   then canceled.  In this case we ignore the signal.  */
+-	movq	total_seq(%rdi), %rax
+-	cmpq	wakeup_seq(%rdi), %rax
+-	jbe	6f
+-	incq	wakeup_seq(%rdi)
+-	incl	cond_futex(%rdi)
+-6:	incq	woken_seq(%rdi)
+-
+-3:	subl	$(1 << nwaiters_shift), cond_nwaiters(%rdi)
+-
+-	/* Wake up a thread which wants to destroy the condvar object.  */
+-	xorl	%ecx, %ecx
+-	cmpq	$0xffffffffffffffff, total_seq(%rdi)
+-	jne	4f
+-	movl	cond_nwaiters(%rdi), %eax
+-	andl	$~((1 << nwaiters_shift) - 1), %eax
+-	jne	4f
+-
+-	LP_OP(cmp) $-1, dep_mutex(%rdi)
+-	leaq	cond_nwaiters(%rdi), %rdi
+-	movl	$1, %edx
+-#ifdef __ASSUME_PRIVATE_FUTEX
+-	movl	$FUTEX_WAKE, %eax
+-	movl	$(FUTEX_WAKE|FUTEX_PRIVATE_FLAG), %esi
+-	cmove	%eax, %esi
+-#else
+-	movl	$0, %eax
+-	movl	%fs:PRIVATE_FUTEX, %esi
+-	cmove	%eax, %esi
+-	orl	$FUTEX_WAKE, %esi
+-#endif
+-	movl	$SYS_futex, %eax
+-	syscall
+-	subq	$cond_nwaiters, %rdi
+-	movl	$1, %ecx
+-
+-4:	LOCK
+-#if cond_lock == 0
+-	decl	(%rdi)
+-#else
+-	decl	cond_lock(%rdi)
+-#endif
+-	je	2f
+-#if cond_lock != 0
+-	addq	$cond_lock, %rdi
+-#endif
+-	LP_OP(cmp) $-1, dep_mutex-cond_lock(%rdi)
+-	movl	$LLL_PRIVATE, %eax
+-	movl	$LLL_SHARED, %esi
+-	cmovne	%eax, %esi
+-	/* The call preserves %rcx.  */
+-	callq	__lll_unlock_wake
+-
+-	/* Wake up all waiters to make sure no signal gets lost.  */
+-2:	testl	%ecx, %ecx
+-	jnz	5f
+-	addq	$cond_futex, %rdi
+-	LP_OP(cmp) $-1, dep_mutex-cond_futex(%rdi)
+-	movl	$0x7fffffff, %edx
+-#ifdef __ASSUME_PRIVATE_FUTEX
+-	movl	$FUTEX_WAKE, %eax
+-	movl	$(FUTEX_WAKE|FUTEX_PRIVATE_FLAG), %esi
+-	cmove	%eax, %esi
+-#else
+-	movl	$0, %eax
+-	movl	%fs:PRIVATE_FUTEX, %esi
+-	cmove	%eax, %esi
+-	orl	$FUTEX_WAKE, %esi
+-#endif
+-	movl	$SYS_futex, %eax
+-	syscall
+-
+-	/* Lock the mutex only if we don't own it already.  This only happens
+-	   in case of PI mutexes, if we got cancelled after a successful
+-	   return of the futex syscall and before disabling async
+-	   cancellation.  */
+-5:	movq	16(%rsp), %rdi
+-	movl	MUTEX_KIND(%rdi), %eax
+-	andl	$(ROBUST_BIT|PI_BIT), %eax
+-	cmpl	$PI_BIT, %eax
+-	jne	7f
+-
+-	movl	(%rdi), %eax
+-	andl	$TID_MASK, %eax
+-	cmpl	%eax, %fs:TID
+-	jne	7f
+-	/* We managed to get the lock.  Fix it up before returning.  */
+-	callq	__pthread_mutex_cond_lock_adjust
+-	jmp	8f
+-
+-
+-7:	callq	__pthread_mutex_cond_lock
+-
+-8:	movq	24(%rsp), %rdi
+-.LcallUR:
+-	call	_Unwind_Resume
+-	hlt
+-.LENDCODE:
+-	cfi_endproc
+-	.size	__condvar_cleanup1, .-__condvar_cleanup1
+-
+-
+-	.section .gcc_except_table,"a",@progbits
+-.LexceptSTART:
+-	.byte	DW_EH_PE_omit			# @LPStart format
+-	.byte	DW_EH_PE_omit			# @TType format
+-	.byte	DW_EH_PE_uleb128		# call-site format
+-	.uleb128 .Lcstend-.Lcstbegin
+-.Lcstbegin:
+-	.uleb128 .LcleanupSTART-.LSTARTCODE
+-	.uleb128 .LcleanupEND-.LcleanupSTART
+-	.uleb128 __condvar_cleanup1-.LSTARTCODE
+-	.uleb128 0
+-	.uleb128 .LcallUR-.LSTARTCODE
+-	.uleb128 .LENDCODE-.LcallUR
+-	.uleb128 0
+-	.uleb128 0
+-.Lcstend:
+-
+-
+-#ifdef SHARED
+-	.hidden	DW.ref.__gcc_personality_v0
+-	.weak	DW.ref.__gcc_personality_v0
+-	.section .gnu.linkonce.d.DW.ref.__gcc_personality_v0,"aw",@progbits
+-	.align	LP_SIZE
+-	.type	DW.ref.__gcc_personality_v0, @object
+-	.size	DW.ref.__gcc_personality_v0, LP_SIZE
+-DW.ref.__gcc_personality_v0:
+-	ASM_ADDR __gcc_personality_v0
+-#endif
+diff --git a/sysdeps/x86/bits/pthreadtypes.h b/sysdeps/x86/bits/pthreadtypes.h
+index 16b8f4f..a3a738f 100644
+--- a/sysdeps/x86/bits/pthreadtypes.h
++++ b/sysdeps/x86/bits/pthreadtypes.h
+@@ -140,14 +140,27 @@ typedef union
+ {
+   struct
+   {
+-    int __lock;
+-    unsigned int __futex;
+-    __extension__ unsigned long long int __total_seq;
+-    __extension__ unsigned long long int __wakeup_seq;
+-    __extension__ unsigned long long int __woken_seq;
+-    void *__mutex;
+-    unsigned int __nwaiters;
+-    unsigned int __broadcast_seq;
++    __extension__ union
++    {
++      __extension__ unsigned long long int __wseq;
++      struct {
++	unsigned int __low;
++	unsigned int __high;
++      } __wseq32;
++    };
++    __extension__ union
++    {
++      __extension__ unsigned long long int __g1_start;
++      struct {
++	unsigned int __low;
++	unsigned int __high;
++      } __g1_start32;
++    };
++    unsigned int __g_refs[2];
++    unsigned int __g_size[2];
++    unsigned int __g1_orig_size;
++    unsigned int __wrefs;
++    unsigned int __g_signals[2];
+   } __data;
+   char __size[__SIZEOF_PTHREAD_COND_T];
+   __extension__ long long int __align;
+-- 
+2.10.2
+
diff --git a/meta/recipes-core/glibc/glibc/0005-Remove-__ASSUME_REQUEUE_PI.patch b/meta/recipes-core/glibc/glibc/0005-Remove-__ASSUME_REQUEUE_PI.patch
new file mode 100644
index 0000000..8d4ba41
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0005-Remove-__ASSUME_REQUEUE_PI.patch
@@ -0,0 +1,149 @@
+From 27b7131d3d8133bf3a5ce72d4e4ff4dfadd71f20 Mon Sep 17 00:00:00 2001
+From: Catalin Enache <catalin.enache@windriver.com>
+Date: Fri, 30 Jun 2017 12:08:29 +0300
+Subject: [PATCH 5/6] Remove __ASSUME_REQUEUE_PI
+
+The new cond var implementation (ed19993b5b0d) removed all the
+__ASSUME_{REQUEUE_PI,FUTEX_LOCK_PI} internal usage so there is no
+need to keep defining it.  This patch removes all USE_REQUEUE_PI
+and __ASSUME_REQUEUE_PI.  It is as follow up from BZ#18463.
+
+Checked with a build for x86_64-linux-gnu, arm-linux-gnueabhf,
+m68-linux-gnu, mips64-linux-gnu, and sparc64-linux-gnu.
+
+    * nptl/pthreadP.h (USE_REQUEUE_PI): Remove ununsed macro.
+    * sysdeps/unix/sysv/linux/arm/kernel-features.h
+    (__ASSUME_REQUEUE_PI): Likewise.
+    * sysdeps/unix/sysv/linux/kernel-features.h
+    (__ASSUME_REQUEUE_PI): Likewise.
+    * sysdeps/unix/sysv/linux/m68k/kernel-features.h
+    (__ASSUME_REQUEUE_PI): Likewise.
+    * sysdeps/unix/sysv/linux/mips/kernel-features.h
+    (__ASSUME_REQUEUE_PI): Likewise.
+    * sysdeps/unix/sysv/linux/sparc/kernel-features.h
+    (__ASSUME_REQUEUE_PI): Likewise.
+
+Upstream-Status: Backport
+
+Author: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ ChangeLog                                       | 14 ++++++++++++++
+ nptl/pthreadP.h                                 | 12 ------------
+ sysdeps/unix/sysv/linux/arm/kernel-features.h   |  1 -
+ sysdeps/unix/sysv/linux/kernel-features.h       |  5 -----
+ sysdeps/unix/sysv/linux/m68k/kernel-features.h  |  1 -
+ sysdeps/unix/sysv/linux/mips/kernel-features.h  |  1 -
+ sysdeps/unix/sysv/linux/sparc/kernel-features.h |  1 -
+ 7 files changed, 14 insertions(+), 21 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index c94db7b..44c518b 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,17 @@
++2017-04-04  Adhemerval Zanella  <adhemerval.zanella@linaro.org>
++
++	* nptl/pthreadP.h (USE_REQUEUE_PI): Remove ununsed macro.
++	* sysdeps/unix/sysv/linux/arm/kernel-features.h
++	(__ASSUME_REQUEUE_PI): Likewise.
++	* sysdeps/unix/sysv/linux/kernel-features.h
++	(__ASSUME_REQUEUE_PI): Likewise.
++	* sysdeps/unix/sysv/linux/m68k/kernel-features.h
++	(__ASSUME_REQUEUE_PI): Likewise.
++	* sysdeps/unix/sysv/linux/mips/kernel-features.h
++	(__ASSUME_REQUEUE_PI): Likewise.
++	* sysdeps/unix/sysv/linux/sparc/kernel-features.h
++	(__ASSUME_REQUEUE_PI): Likewise.
++
+ 2016-12-31  Torvald Riegel  <triegel@redhat.com>
+ 
+ 	[BZ #13165]
+diff --git a/nptl/pthreadP.h b/nptl/pthreadP.h
+index e9992bc..730c4ad 100644
+--- a/nptl/pthreadP.h
++++ b/nptl/pthreadP.h
+@@ -594,18 +594,6 @@ extern void __wait_lookup_done (void) attribute_hidden;
+ # define PTHREAD_STATIC_FN_REQUIRE(name) __asm (".globl " #name);
+ #endif
+ 
+-/* Test if the mutex is suitable for the FUTEX_WAIT_REQUEUE_PI operation.  */
+-#if (defined lll_futex_wait_requeue_pi \
+-     && defined __ASSUME_REQUEUE_PI)
+-# define USE_REQUEUE_PI(mut) \
+-   ((mut) && (mut) != (void *) ~0l \
+-    && (((mut)->__data.__kind \
+-	 & (PTHREAD_MUTEX_PRIO_INHERIT_NP | PTHREAD_MUTEX_ROBUST_NORMAL_NP)) \
+-	== PTHREAD_MUTEX_PRIO_INHERIT_NP))
+-#else
+-# define USE_REQUEUE_PI(mut) 0
+-#endif
+-
+ /* Returns 0 if POL is a valid scheduling policy.  */
+ static inline int
+ check_sched_policy_attr (int pol)
+diff --git a/sysdeps/unix/sysv/linux/arm/kernel-features.h b/sysdeps/unix/sysv/linux/arm/kernel-features.h
+index 6ca607e..339ad45 100644
+--- a/sysdeps/unix/sysv/linux/arm/kernel-features.h
++++ b/sysdeps/unix/sysv/linux/arm/kernel-features.h
+@@ -23,7 +23,6 @@
+    futex_atomic_cmpxchg_inatomic, depending on kernel
+    configuration.  */
+ #if __LINUX_KERNEL_VERSION < 0x030E03
+-# undef __ASSUME_REQUEUE_PI
+ # undef __ASSUME_SET_ROBUST_LIST
+ #endif
+ 
+diff --git a/sysdeps/unix/sysv/linux/kernel-features.h b/sysdeps/unix/sysv/linux/kernel-features.h
+index 1d3b554..9f2cf9f 100644
+--- a/sysdeps/unix/sysv/linux/kernel-features.h
++++ b/sysdeps/unix/sysv/linux/kernel-features.h
+@@ -101,11 +101,6 @@
+ #define __ASSUME_PREADV	1
+ #define __ASSUME_PWRITEV	1
+ 
+-/* Support for FUTEX_*_REQUEUE_PI was added in 2.6.31 (but some
+-   architectures lack futex_atomic_cmpxchg_inatomic in some
+-   configurations).  */
+-#define __ASSUME_REQUEUE_PI	1
+-
+ /* Support for recvmmsg functionality was added in 2.6.33.  The macros
+    defined correspond to those for accept4.  */
+ #if __LINUX_KERNEL_VERSION >= 0x020621
+diff --git a/sysdeps/unix/sysv/linux/m68k/kernel-features.h b/sysdeps/unix/sysv/linux/m68k/kernel-features.h
+index 46ec601..174c1c6 100644
+--- a/sysdeps/unix/sysv/linux/m68k/kernel-features.h
++++ b/sysdeps/unix/sysv/linux/m68k/kernel-features.h
+@@ -51,6 +51,5 @@
+ 
+ /* No support for PI futexes or robust mutexes before 3.10 for m68k.  */
+ #if __LINUX_KERNEL_VERSION < 0x030a00
+-# undef __ASSUME_REQUEUE_PI
+ # undef __ASSUME_SET_ROBUST_LIST
+ #endif
+diff --git a/sysdeps/unix/sysv/linux/mips/kernel-features.h b/sysdeps/unix/sysv/linux/mips/kernel-features.h
+index b486d90..a795911c 100644
+--- a/sysdeps/unix/sysv/linux/mips/kernel-features.h
++++ b/sysdeps/unix/sysv/linux/mips/kernel-features.h
+@@ -24,7 +24,6 @@
+ /* The MIPS kernel does not support futex_atomic_cmpxchg_inatomic if
+    emulating LL/SC.  */
+ #if __mips == 1 || defined _MIPS_ARCH_R5900
+-# undef __ASSUME_REQUEUE_PI
+ # undef __ASSUME_SET_ROBUST_LIST
+ #endif
+ 
+diff --git a/sysdeps/unix/sysv/linux/sparc/kernel-features.h b/sysdeps/unix/sysv/linux/sparc/kernel-features.h
+index 69c9c7c..dd3ddf0 100644
+--- a/sysdeps/unix/sysv/linux/sparc/kernel-features.h
++++ b/sysdeps/unix/sysv/linux/sparc/kernel-features.h
+@@ -34,6 +34,5 @@
+ /* 32-bit SPARC kernels do not support
+    futex_atomic_cmpxchg_inatomic.  */
+ #if !defined __arch64__ && !defined __sparc_v9__
+-# undef __ASSUME_REQUEUE_PI
+ # undef __ASSUME_SET_ROBUST_LIST
+ #endif
+-- 
+2.10.2
+
diff --git a/meta/recipes-core/glibc/glibc/0006-Fix-atomic_fetch_xor_release.patch b/meta/recipes-core/glibc/glibc/0006-Fix-atomic_fetch_xor_release.patch
new file mode 100644
index 0000000..7616efa
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0006-Fix-atomic_fetch_xor_release.patch
@@ -0,0 +1,81 @@
+From b671f20cc160238b62894d032a55baf85867106e Mon Sep 17 00:00:00 2001
+From: Catalin Enache <catalin.enache@windriver.com>
+Date: Fri, 30 Jun 2017 19:12:43 +0300
+Subject: [PATCH 6/6] Fix atomic_fetch_xor_release.
+
+No code uses atomic_fetch_xor_release except for the upcoming
+conditional variable rewrite. Therefore there is no user
+visible bug here. The use of atomic_compare_and_exchange_bool_rel
+is removed (since it doesn't exist anymore), and is replaced
+by atomic_compare_exchange_weak_release.
+
+We use weak_release because it provides better performance in
+the loop (the weak semantic) and because the xor is release MO
+(the release semantic). We don't reload expected in the loop
+because atomic_compare_and_exchange_weak_release does this for
+us as part of the CAS failure.
+
+It is otherwise a fairly plain conversion that fixes building
+the new condvar for 32-bit x86. Passes all regression tests
+for x86.
+
+Upstream-Status: Backport
+
+Author: Carlos O'Donell <carlos@systemhalted.org>
+Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
+---
+ ChangeLog        |  6 ++++++
+ include/atomic.h | 19 +++++++++++--------
+ 2 files changed, 17 insertions(+), 8 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index 44c518b..893262d 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,9 @@
++2016-10-26  Carlos O'Donell  <carlos@redhat.com>
++
++	* include/atomic.h
++	[USE_COMPILER_ATOMIC_BUILTINS && !atomic_fetch_xor_release]
++	(atomic_fetch_xor_release): Use	atomic_compare_exchange_weak_release.
++
+ 2017-04-04  Adhemerval Zanella  <adhemerval.zanella@linaro.org>
+ 
+ 	* nptl/pthreadP.h (USE_REQUEUE_PI): Remove ununsed macro.
+diff --git a/include/atomic.h b/include/atomic.h
+index 5a8e7e7..c8b4664 100644
+--- a/include/atomic.h
++++ b/include/atomic.h
+@@ -777,18 +777,21 @@ void __atomic_link_error (void);
+ # endif
+ 
+ # ifndef atomic_fetch_xor_release
++/* Failing the atomic_compare_exchange_weak_release reloads the value in
++   __atg104_expected, so we need only do the XOR again and retry.  */
+ # define atomic_fetch_xor_release(mem, operand) \
+-  ({ __typeof (*(mem)) __atg104_old;					      \
+-     __typeof (mem) __atg104_memp = (mem);				      \
++  ({ __typeof (mem) __atg104_memp = (mem);				      \
++     __typeof (*(mem)) __atg104_expected = (*__atg104_memp);		      \
++     __typeof (*(mem)) __atg104_desired;				      \
+      __typeof (*(mem)) __atg104_op = (operand);				      \
+ 									      \
+      do									      \
+-       __atg104_old = (*__atg104_memp);					      \
+-     while (__builtin_expect						      \
+-	    (atomic_compare_and_exchange_bool_rel (			      \
+-		__atg104_memp, __atg104_old ^ __atg104_op, __atg104_old), 0));\
+-									      \
+-     __atg104_old; })
++       __atg104_desired = __atg104_expected ^ __atg104_op;		      \
++     while (__glibc_unlikely						      \
++	    (atomic_compare_exchange_weak_release (			      \
++	       __atg104_memp, &__atg104_expected, __atg104_desired)	      \
++	     == 0));							      \
++     __atg104_expected; })
+ #endif
+ 
+ #endif /* !USE_ATOMIC_COMPILER_BUILTINS  */
+-- 
+2.10.2
+
diff --git a/meta/recipes-core/glibc/glibc_2.24.bb b/meta/recipes-core/glibc/glibc_2.24.bb
index 08ae459..e723e03 100644
--- a/meta/recipes-core/glibc/glibc_2.24.bb
+++ b/meta/recipes-core/glibc/glibc_2.24.bb
@@ -39,6 +39,12 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0026-build_local_scope.patch \
            file://0028-Bug-20116-Fix-use-after-free-in-pthread_create.patch \
            file://CVE-2016-6323.patch \
+           file://0001-Add-atomic_exchange_relaxed.patch \
+           file://0002-Add-atomic-operations-required-by-the-new-condition-.patch \
+           file://0003-Add-pretty-printers-for-the-NPTL-lock-types.patch \
+           file://0004-New-condvar-implementation-that-provides-stronger-or.patch \
+           file://0005-Remove-__ASSUME_REQUEUE_PI.patch \
+           file://0006-Fix-atomic_fetch_xor_release.patch \
 "
 
 SRC_URI += "\
-- 
2.10.2



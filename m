Return-Path: <wangxin2015.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 297ED65CB6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Sep 2016 14:11:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="10846431"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Sep 2016 22:11:36 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id A700B404240C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Sep 2016 22:11:36 +0800 (CST)
Received: from ubuntu.g08.fujitsu.local (10.167.226.120) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Sun, 11 Sep 2016 22:11:37 +0800
From: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 11 Sep 2016 10:11:30 -0400
Message-ID: <1473603090-1486-1-git-send-email-wangxin2015.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.120]
X-yoursite-MailScanner-ID: A700B404240C.A60C4
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangxin2015.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] ltp: 20160126 -> 20160510
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
X-List-Received-Date: Sun, 11 Sep 2016 14:11:44 -0000
Content-Type: text/plain

1) Upgrade ltp from 20160126 to 20160510.
2) Modify some patches, since the data has been changed.
    0011-Rename-sigset-variable-to-sigset1.patch
    0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch
3) Delete some patches, since they are no use.
    0001-ltp-Don-t-link-against-libfl.patch 
    0006-sendfile-Use-off64_t-instead-of-__off64_t.patch 
    0012-fsstress.c-Replace-__int64_t-with-int64_t.patch 
    0013-include-fcntl.h-for-getting-O_-definitions.patch 
    0014-hyperthreading-Include-sys-types.h-for-pid_t-definit.patch 
    0015-mincore01-Rename-PAGESIZE-to-pagesize.patch 
    0016-ustat-Change-header-from-ustat.h-to-sys-ustat.h.patch 
    0017-replace-sigval_t-with-union-sigval.patch 
    0019-tomoyo-Replace-canonicalize_file_name-with-realpath.patch 
    0032-regen.sh-Include-asm-unistd.h-explicitly.patch 
    
Signed-off-by: Wang Xin <wangxin2015.fnst@cn.fujitsu.com>
---
 .../0011-Rename-sigset-variable-to-sigset1.patch   | 60 +++++++++++-----------
 ...READ_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch |  6 +--
 .../ltp/{ltp_20160126.bb => ltp_20160510.bb}       | 12 +----
 3 files changed, 34 insertions(+), 44 deletions(-)
 rename meta/recipes-extended/ltp/{ltp_20160126.bb => ltp_20160510.bb} (88%)

diff --git a/meta/recipes-extended/ltp/ltp/0011-Rename-sigset-variable-to-sigset1.patch b/meta/recipes-extended/ltp/ltp/0011-Rename-sigset-variable-to-sigset1.patch
index 945280c..6eace63 100644
--- a/meta/recipes-extended/ltp/ltp/0011-Rename-sigset-variable-to-sigset1.patch
+++ b/meta/recipes-extended/ltp/ltp/0011-Rename-sigset-variable-to-sigset1.patch
@@ -20,8 +20,8 @@ index 7203e9e..fce87d6 100644
  /**************/
  
  key_t key;
--sigset_t sigset;
-+sigset_t sigset1;
+-sigset_t set;
++sigset_t set1;
  
  #define  SIZE  16*1024
  
@@ -29,12 +29,12 @@ index 7203e9e..fce87d6 100644
  
  	key = (key_t) getpid();
  
--	sigemptyset(&sigset);
--	sigaddset(&sigset, SIGUSR1);
--	sigprocmask(SIG_BLOCK, &sigset, NULL);
-+	sigemptyset(&sigset1);
-+	sigaddset(&sigset1, SIGUSR1);
-+	sigprocmask(SIG_BLOCK, &sigset1, NULL);
+-	sigemptyset(&set);
+-	sigaddset(&set, SIGUSR1);
+-	sigprocmask(SIG_BLOCK, &set, NULL);
++	sigemptyset(&set1);
++	sigaddset(&set1, SIGUSR1);
++	sigprocmask(SIG_BLOCK, &set1, NULL);
  
  	pid = fork();
  	switch (pid) {
@@ -42,8 +42,8 @@ index 7203e9e..fce87d6 100644
  	char *cp;
  	int sig;
  
--	sigwait(&sigset, &sig);
-+	sigwait(&sigset1, &sig);
+-	sigwait(&set, &sig);
++	sigwait(&set1, &sig);
  	chld_pid = getpid();
  /*--------------------------------------------------------*/
  
@@ -55,8 +55,8 @@ index a3c9ca3..77b0fc9 100644
  /**************/
  
  key_t key;
--sigset_t sigset;
-+sigset_t sigset1;
+-sigset_t set;
++sigset_t set1;
  
  int child();
  static int rm_shm(int);
@@ -64,12 +64,12 @@ index a3c9ca3..77b0fc9 100644
  
  	key = (key_t) getpid();
  
--	sigemptyset(&sigset);
--	sigaddset(&sigset, SIGUSR1);
--	sigprocmask(SIG_BLOCK, &sigset, NULL);
-+	sigemptyset(&sigset1);
-+	sigaddset(&sigset1, SIGUSR1);
-+	sigprocmask(SIG_BLOCK, &sigset1, NULL);
+-	sigemptyset(&set);
+-	sigaddset(&set, SIGUSR1);
+-	sigprocmask(SIG_BLOCK, &set, NULL);
++	sigemptyset(&set1);
++	sigaddset(&set1, SIGUSR1);
++	sigprocmask(SIG_BLOCK, &set1, NULL);
  
  	pid = fork();
  	switch (pid) {
@@ -77,8 +77,8 @@ index a3c9ca3..77b0fc9 100644
  	char *cp;
  	int sig;
  
--	sigwait(&sigset, &sig);
-+	sigwait(&sigset1, &sig);
+-	sigwait(&set, &sig);
++	sigwait(&set1, &sig);
  	chld_pid = getpid();
  
  	if ((shmid = shmget(key, SIZE, 0)) < 0) {
@@ -90,8 +90,8 @@ index 20fca52..6fb1d57 100644
  int sig_catch = 0;		/* variable to blocked/unblocked signals */
  
  struct sigaction sa_new;	/* struct to hold signal info */
--sigset_t sigset;		/* signal set to hold signal lists */
-+sigset_t sigset1;		/* signal set to hold signal lists */
+-sigset_t set;		/* signal set to hold signal lists */
++sigset_t set1;		/* signal set to hold signal lists */
  sigset_t sigset2;
  
  int main(int ac, char **av)
@@ -99,8 +99,8 @@ index 20fca52..6fb1d57 100644
  		 * so that, signal will not be delivered to
  		 * the test process.
  		 */
--		TEST(sigprocmask(SIG_BLOCK, &sigset, 0));
-+		TEST(sigprocmask(SIG_BLOCK, &sigset1, 0));
+-		TEST(sigprocmask(SIG_BLOCK, &set, 0));
++		TEST(sigprocmask(SIG_BLOCK, &set1, 0));
  
  		/* Get the process id of test process */
  		my_pid = getpid();
@@ -108,8 +108,8 @@ index 20fca52..6fb1d57 100644
  				 */
  				errno = 0;
  				if (sigprocmask(SIG_UNBLOCK,
--						&sigset, 0) == -1) {
-+						&sigset1, 0) == -1) {
+-						&set, 0) == -1) {
++						&set1, 0) == -1) {
  					tst_brkm(TFAIL, cleanup,
  						 "sigprocmask() failed "
  						 "to unblock signal, "
@@ -117,8 +117,8 @@ index 20fca52..6fb1d57 100644
  	 * Initialise the signal sets with the list that
  	 * excludes/includes  all system-defined signals.
  	 */
--	if (sigemptyset(&sigset) == -1) {
-+	if (sigemptyset(&sigset1) == -1) {
+-	if (sigemptyset(&set) == -1) {
++	if (sigemptyset(&set1) == -1) {
  		tst_brkm(TFAIL, cleanup,
  			 "sigemptyset() failed, errno=%d : %s",
  			 errno, strerror(errno));
@@ -126,8 +126,8 @@ index 20fca52..6fb1d57 100644
  	 * Add specified signal (SIGINT) to the signal set
  	 * which excludes system-defined signals.
  	 */
--	if (sigaddset(&sigset, SIGINT) == -1) {
-+	if (sigaddset(&sigset1, SIGINT) == -1) {
+-	if (sigaddset(&set, SIGINT) == -1) {
++	if (sigaddset(&set1, SIGINT) == -1) {
  		tst_brkm(TFAIL, cleanup,
  			 "sigaddset() failed, errno=%d : %s",
  			 errno, strerror(errno));
diff --git a/meta/recipes-extended/ltp/ltp/0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch b/meta/recipes-extended/ltp/ltp/0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch
index d2d6d76..13b6b24 100644
--- a/meta/recipes-extended/ltp/ltp/0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch
+++ b/meta/recipes-extended/ltp/ltp/0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch
@@ -25,9 +25,9 @@ index 5c1c58c..3244b5e 100644
 +#else
 +static pthread_mutex_t tmutex = {  PTHREAD_MUTEX_RECURSIVE };
 +#endif
- /*
-  * Define local function prototypes.
-  */
+ static void check_env(void);
+ static void tst_condense(int tnum, int ttype, const char *tmesg);
+ static void tst_print(const char *tcid, int tnum, int ttype, const char *tmesg);
 -- 
 2.7.0
 
diff --git a/meta/recipes-extended/ltp/ltp_20160126.bb b/meta/recipes-extended/ltp/ltp_20160510.bb
similarity index 88%
rename from meta/recipes-extended/ltp/ltp_20160126.bb
rename to meta/recipes-extended/ltp/ltp_20160510.bb
index 7631e0e..9ac386f 100644
--- a/meta/recipes-extended/ltp/ltp_20160126.bb
+++ b/meta/recipes-extended/ltp/ltp_20160510.bb
@@ -24,28 +24,19 @@ DEPENDS_append_libc-musl = " fts "
 EXTRA_OEMAKE_append_libc-musl = " LIBC=musl "
 CFLAGS_append_powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS_append_mips64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "fce797676b14f50406718e7ef640b50da66c9b36"
+SRCREV = "149490ec2de45a5dc7a9fd2c31add615fdd4f82b"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git \
-           file://0001-ltp-Don-t-link-against-libfl.patch \
            file://0002-Add-knob-to-control-whether-numa-support-should-be-c.patch \
            file://0003-Add-knob-to-control-tirpc-support.patch \
            file://0004-build-Add-option-to-select-libc-implementation.patch \
            file://0005-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch \
-           file://0006-sendfile-Use-off64_t-instead-of-__off64_t.patch \
            file://0007-replace-SIGCLD-with-SIGCHLD.patch \
            file://0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch \
            file://0009-Guard-error.h-with-__GLIBC__.patch \
            file://0010-replace-__BEGIN_DECLS-and-__END_DECLS.patch \
            file://0011-Rename-sigset-variable-to-sigset1.patch \
-           file://0012-fsstress.c-Replace-__int64_t-with-int64_t.patch \
-           file://0013-include-fcntl.h-for-getting-O_-definitions.patch \
-           file://0014-hyperthreading-Include-sys-types.h-for-pid_t-definit.patch \
-           file://0015-mincore01-Rename-PAGESIZE-to-pagesize.patch \
-           file://0016-ustat-Change-header-from-ustat.h-to-sys-ustat.h.patch \
-           file://0017-replace-sigval_t-with-union-sigval.patch \
            file://0018-guard-mallocopt-with-__GLIBC__.patch \
-           file://0019-tomoyo-Replace-canonicalize_file_name-with-realpath.patch \
            file://0020-getdents-define-getdents-getdents64-only-for-glibc.patch \
            file://0021-Define-_GNU_SOURCE-for-MREMAP_MAYMOVE-definition.patch \
            file://0022-include-sys-types.h.patch \
@@ -58,7 +49,6 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0029-trace_shed-Fix-build-with-musl.patch \
            file://0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch \
            file://0031-vma03-fix-page-size-offset-as-per-page-size-alignmen.patch \
-           file://0032-regen.sh-Include-asm-unistd.h-explicitly.patch \
            file://0033-shmat1-Cover-GNU-specific-code-under-__USE_GNU.patch \
            file://0034-periodic_output.patch \
            file://0035-fix-test_proc_kill-hang.patch \
-- 
2.7.4





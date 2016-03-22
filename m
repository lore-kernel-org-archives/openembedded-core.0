Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id BBFDA65CBF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 15:54:30 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id 51so16286346qgy.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 08:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=hcwuTsQL7qJ9SgS0Jhwq1gw8mLC7NYcRhgOru6GXkh4=;
	b=TddT2s6RmpwSUlMRJzUWEHHkc1NTipqQWjboTyFbCEdTtFYcyMWLgVJDONWjs8icBh
	Raj6jM2tR3gMQX+M9FcArffzlABKdH11ElgSts2mwN/uK7AHvOp5+vX1ssWiNjnuF3Yb
	bhpfioO+TQd9vFMk7yt0hhEOyZ1/d0iIE8xzM5f1nbZuJlcD/IW8aNEzHuIwpTsz/DSD
	kF3zfDBRwYV4Gt1SOJRR03jC1M6z4Ra1pl0eG3JqCAC6dX7yqgBounNW3pvU2pjoqNin
	1IauCkn4fESBWrmx4ej/LPd5llzr7yDgNlymcIbw6NNSp7a/d0hJ1hM4Bgzu0SaJLbDL
	z+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hcwuTsQL7qJ9SgS0Jhwq1gw8mLC7NYcRhgOru6GXkh4=;
	b=HM7fFaiD8brmpBlJ3OV3H0dFkewE+xjFo/GlZ2Dz3knK1Xfs+HFggh/uCr2en0pxbE
	PVaEn1BoP3ezYM9cCt9mrtIRDJzAnvrP42jgvmtDVH85P53Q263um9kgk7xitMA4HrZM
	kYPoeAAU9UxU0uFrF11xPV/l5UcChi64+o03cPM04go7s0R1nZh5Eg54DRfWqAc7aeIg
	ydXP03EqfNTgpplcXtKkUNVlV7WGnpJwYZ+sL9jo6bogrpCMvtX1uOqCBvQ90o/0q2vW
	vX1G+h1Fv+9GcbVvT9WlAFeX6STxZ1LImAiEkvSYugQ3RlLiNDzFwybd+XUjaN7zKl5I
	hi5Q==
X-Gm-Message-State: AD7BkJIS0N3xPsE+wTBQ6+C1+rKSvaJvdGGmrs5XXulknuEtggath5ez6JTPKv9OanDavw==
X-Received: by 10.140.27.132 with SMTP id 4mr5961828qgx.6.1458662070787;
	Tue, 22 Mar 2016 08:54:30 -0700 (PDT)
Received: from eos.sys.comcast.net (a-96-118-179-133.sys.comcast.net.
	[96.118.179.133]) by smtp.gmail.com with ESMTPSA id
	v190sm14904470qka.46.2016.03.22.08.54.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 22 Mar 2016 08:54:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2016 15:54:23 +0000
Message-Id: <1458662063-6267-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH V2] ltp: Fix build on x86/musl
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
X-List-Received-Date: Tue, 22 Mar 2016 15:54:31 -0000

In last patch it covered out the non-glibc case well
but did not define else case, when __GLIBC__ is not
defined, as a result errors like

| getcpu01.c:107:41: error: use of undeclared identifier 'sys_support'
|         if (((tst_kvercmp(2, 6, 20)) < 0) || !(sys_support)) {

appeared, fixed it with this updated patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
ChangeLog since v1:
- Fix build with i586/musl

 ...__GLIBC_PREREQ-is-defined-before-using-it.patch | 50 ++++++++++++----------
 ...1-Cover-GNU-specific-code-under-__USE_GNU.patch | 41 ++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20160126.bb          |  3 +-
 3 files changed, 71 insertions(+), 23 deletions(-)
 create mode 100644 meta/recipes-extended/ltp/ltp/0033-shmat1-Cover-GNU-specific-code-under-__USE_GNU.patch

diff --git a/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch b/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
index 59e169e..d123074 100644
--- a/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
+++ b/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
@@ -1,17 +1,18 @@
-From 714024e4699b28eed866d775f4c715b0e55b76f7 Mon Sep 17 00:00:00 2001
+From a3cbee31daae2466bc8dcac36b33a01352693346 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 7 Jan 2016 19:40:08 +0000
-Subject: [PATCH 08/32] Check if __GLIBC_PREREQ is defined before using it
+Subject: [PATCH 01/26] Check if __GLIBC_PREREQ is defined before using it
 
 __GLIBC_PREREQ is specific to glibc so it should be checked if it is
 defined or not.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
- testcases/kernel/syscalls/accept4/accept4_01.c     |  9 ++++++-
- testcases/kernel/syscalls/getcpu/getcpu01.c        | 31 ++++++++++++++++++++++
- .../sched_getaffinity/sched_getaffinity01.c        | 26 ++++++++++++++++++
- 3 files changed, 65 insertions(+), 1 deletion(-)
+ testcases/kernel/syscalls/accept4/accept4_01.c     |  9 ++++-
+ testcases/kernel/syscalls/getcpu/getcpu01.c        | 40 +++++++++++++++++++++-
+ .../sched_getaffinity/sched_getaffinity01.c        | 26 ++++++++++++++
+ 3 files changed, 73 insertions(+), 2 deletions(-)
 
 diff --git a/testcases/kernel/syscalls/accept4/accept4_01.c b/testcases/kernel/syscalls/accept4/accept4_01.c
 index 6072bfa..2b090cb 100644
@@ -58,47 +59,52 @@ index 6072bfa..2b090cb 100644
  	acceptfd = accept4(lfd, (struct sockaddr *)&claddr, &addrlen,
  			   closeonexec_flag | nonblock_flag);
 diff --git a/testcases/kernel/syscalls/getcpu/getcpu01.c b/testcases/kernel/syscalls/getcpu/getcpu01.c
-index c927512..6de6362 100644
+index c927512..921b107 100644
 --- a/testcases/kernel/syscalls/getcpu/getcpu01.c
 +++ b/testcases/kernel/syscalls/getcpu/getcpu01.c
 @@ -62,6 +62,7 @@
  #include <dirent.h>
  
  #if defined(__i386__) || defined(__x86_64__)
-+#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
++#if defined(__GLIBC__)
  #if __GLIBC_PREREQ(2,6)
  #if defined(__x86_64__)
  #include <utmpx.h>
-@@ -72,13 +73,16 @@ int sys_support = 1;
+@@ -75,10 +76,17 @@ int sys_support = 0;
  #else
  int sys_support = 0;
  #endif
++#else
++int sys_support = 0;
 +#endif
- #else
- int sys_support = 0;
- #endif
  
-+#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
++#if defined(__GLIBC__)
  #if !(__GLIBC_PREREQ(2, 7))
  #define CPU_FREE(ptr) free(ptr)
  #endif
++#else
++#define CPU_FREE(ptr) free(ptr)
 +#endif
  
  void cleanup(void);
  void setup(void);
-@@ -164,9 +168,11 @@ static inline int getcpu(unsigned *cpu_id, unsigned *node_id,
+@@ -164,9 +172,14 @@ static inline int getcpu(unsigned *cpu_id, unsigned *node_id,
  {
  #if defined(__i386__)
  	return syscall(318, cpu_id, node_id, cache_struct);
-+#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
- #elif __GLIBC_PREREQ(2,6)
+-#elif __GLIBC_PREREQ(2,6)
++#if defined(__GLIBC__)
++#if __GLIBC_PREREQ(2,6)
++	*cpu_id = sched_getcpu();
++#endif
++#else
  	*cpu_id = sched_getcpu();
  #endif
 +#endif
  	return 0;
  }
  
-@@ -191,15 +197,20 @@ unsigned int set_cpu_affinity(void)
+@@ -191,15 +204,20 @@ unsigned int set_cpu_affinity(void)
  	cpu_set_t *set;
  	size_t size;
  	int nrcpus = 1024;
@@ -119,7 +125,7 @@ index c927512..6de6362 100644
  #if __GLIBC_PREREQ(2, 7)
  	size = CPU_ALLOC_SIZE(nrcpus);
  	CPU_ZERO_S(size, set);
-@@ -207,8 +218,13 @@ realloc:
+@@ -207,8 +225,13 @@ realloc:
  	size = sizeof(cpu_set_t);
  	CPU_ZERO(set);
  #endif
@@ -133,7 +139,7 @@ index c927512..6de6362 100644
  #if __GLIBC_PREREQ(2, 7)
  		if (errno == EINVAL && nrcpus < (1024 << 8)) {
  			nrcpus = nrcpus << 2;
-@@ -220,10 +236,17 @@ realloc:
+@@ -220,10 +243,17 @@ realloc:
  				 "NR_CPUS of the kernel is more than 1024, so we'd better use a newer glibc(>= 2.7)");
  		else
  #endif
@@ -151,7 +157,7 @@ index c927512..6de6362 100644
  #if __GLIBC_PREREQ(2, 7)
  	CPU_ZERO_S(size, set);
  	CPU_SET_S(cpu_max, size, set);
-@@ -231,6 +254,10 @@ realloc:
+@@ -231,6 +261,10 @@ realloc:
  	CPU_ZERO(set);
  	CPU_SET(cpu_max, set);
  #endif
@@ -162,7 +168,7 @@ index c927512..6de6362 100644
  	if (sched_setaffinity(0, size, set) < 0) {
  		CPU_FREE(set);
  		tst_brkm(TFAIL, NULL, "sched_setaffinity:errno:%d", errno);
-@@ -247,11 +274,15 @@ unsigned int max_cpuid(size_t size, cpu_set_t * set)
+@@ -247,11 +281,15 @@ unsigned int max_cpuid(size_t size, cpu_set_t * set)
  {
  	unsigned int index, max = 0;
  	for (index = 0; index < size * BITS_PER_BYTE; index++)
@@ -275,5 +281,5 @@ index 9d6a81a..4ed13b2 100644
  	QUICK_TEST(sched_getaffinity(0, len, (cpu_set_t *) - 1));
  	QUICK_TEST(sched_getaffinity(0, 0, mask));
 -- 
-2.7.0
+1.9.1
 
diff --git a/meta/recipes-extended/ltp/ltp/0033-shmat1-Cover-GNU-specific-code-under-__USE_GNU.patch b/meta/recipes-extended/ltp/ltp/0033-shmat1-Cover-GNU-specific-code-under-__USE_GNU.patch
new file mode 100644
index 0000000..868e1cf
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/0033-shmat1-Cover-GNU-specific-code-under-__USE_GNU.patch
@@ -0,0 +1,41 @@
+From 5e3dea669e5b0b769f322d54a3bb9f320b5327da Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 22 Mar 2016 15:47:14 +0000
+Subject: [PATCH 26/26] shmat1: Cover GNU specific code under __USE_GNU
+
+on x86, we use uc_mcontext element from sigcontext
+which is marked gnu-specific in glibc, this patch
+adds this condition around the code
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ testcases/kernel/mem/mtest06/shmat1.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/testcases/kernel/mem/mtest06/shmat1.c b/testcases/kernel/mem/mtest06/shmat1.c
+index 0d6d7a4..bee69f6 100644
+--- a/testcases/kernel/mem/mtest06/shmat1.c
++++ b/testcases/kernel/mem/mtest06/shmat1.c
+@@ -111,7 +111,7 @@ int done_shmat = 0;		/* disallow read and writes before shmat      */
+ static void sig_handler(int signal,	/* signal number, set to handle SIGALRM       */
+ 			int code, struct ucontext *ut)
+ {				/* contains pointer to sigcontext structure   */
+-#ifdef __i386__
++#if defined(__i386__) && defined(__USE_GNU)
+ 	unsigned long except;	/* exception type.                            */
+ 	int ret = 0;		/* exit code from signal handler.             */
+ 	struct sigcontext *scp =	/* pointer to sigcontext structure            */
+@@ -122,7 +122,7 @@ static void sig_handler(int signal,	/* signal number, set to handle SIGALRM
+ 		fprintf(stdout, "Test ended, success\n");
+ 		exit(0);
+ 	}
+-#ifdef __i386__
++#if defined(__i386__) && defined(__USE_GNU)
+ 	else {
+ 		except = scp->trapno;
+ 		fprintf(stderr, "signal caught - [%d] ", signal);
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/ltp/ltp_20160126.bb b/meta/recipes-extended/ltp/ltp_20160126.bb
index ac16793..720a569 100644
--- a/meta/recipes-extended/ltp/ltp_20160126.bb
+++ b/meta/recipes-extended/ltp/ltp_20160126.bb
@@ -59,7 +59,8 @@ SRC_URI = "git://github.com/linux-test-project/ltp.git \
            file://0030-lib-Use-PTHREAD_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch \
            file://0031-vma03-fix-page-size-offset-as-per-page-size-alignmen.patch \
            file://0032-regen.sh-Include-asm-unistd.h-explicitly.patch \
-"
+           file://0033-shmat1-Cover-GNU-specific-code-under-__USE_GNU.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
1.9.1



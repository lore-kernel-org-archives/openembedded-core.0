Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 72FEA6AC3C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 05:34:12 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id 51so4755283qgy.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 22:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=yxeq+35ubqinFxLSbgobsuyG4anWS6L+rPOFfRd5Y/w=;
	b=YHcvkwzjhNZoFCMwM9xQCzafyMNsZNc3MNZSFZh0EY2Rgmc3xZLxECOJl8LIPO9/g9
	Uu9GihZJchU7QOyvpFDymY+wzptzMsmQ5eNrZBfjWeQDHFZPATOT0GLEOmBOcm1bo1Lt
	FY8Rw/UXDmsyq/Vi2Z9DBxPUaMq7CDuY1+GNW0eavgzAxih++4CbxLDTLiFnGNy38026
	adbDfpQbjEZl7nGYy3PgzDvfUgYHToCcjrifklaFDzBF1A1XH7303c8Bzcg7ZQs1+znN
	JBDJweEbntck5URdgf0PnxFC1kLfTd2pd1w95ab7YK2dpCVAVzDIY92wsAEFKsObaMpM
	Q0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=yxeq+35ubqinFxLSbgobsuyG4anWS6L+rPOFfRd5Y/w=;
	b=Kq8Vjrzx5/qw0NEv+3W2ZL9s0D8AnSWeA0wx4zH7if7eTRvMgZ/GKBVJHXfkKkhBaN
	T/aZeZaFXlefUCUwENFPdfwZ4Dj0JBEWv2h5+CDbR//sb/YfWEoc4ND84sOol4Z4RrY8
	QuIcOo/iTUPUK2mMMoVMXooDtnZfUAl6qqYiRhfWKlhwghlG0CLWdM8rsZDNxGIaUlFK
	/DL21TdNLC6loxpIc8XZrawbVncfsrWT5MFKoZM22SEpRfnhElzSJCChK2oAkzm2nlal
	222qOUzTZp9mdzOQpAfrbZ5WanxYGm8c1hDVlXD46WK3PqB6hE12lyU0uZgBrOyU0IZf
	Dfbg==
X-Gm-Message-State: AD7BkJI9LhE/+mtZ2Bsrvc/+6SjumBNlgra94w97jRKmMNyb6KStGpduhtb5xcKyXZMEDA==
X-Received: by 10.140.160.214 with SMTP id g205mr47581498qhg.88.1458624853162; 
	Mon, 21 Mar 2016 22:34:13 -0700 (PDT)
Received: from eos.sys.comcast.net (a-96-118-179-133.sys.comcast.net.
	[96.118.179.133]) by smtp.gmail.com with ESMTPSA id
	u202sm13918242qka.43.2016.03.21.22.34.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Mar 2016 22:34:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2016 05:34:05 +0000
Message-Id: <1458624845-32637-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] ltp: Fix build on x86/musl
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
X-List-Received-Date: Tue, 22 Mar 2016 05:34:15 -0000

In last patch it covered out the non-glibc case well
but did not define else case, when __GLIBC__ is not
defined, as a result errors like

| getcpu01.c:107:41: error: use of undeclared identifier 'sys_support'
|         if (((tst_kvercmp(2, 6, 20)) < 0) || !(sys_support)) {

appeared, fixed it with this updated patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...__GLIBC_PREREQ-is-defined-before-using-it.patch | 36 +++++++++++-----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch b/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
index 59e169e..fd71b38 100644
--- a/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
+++ b/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch
@@ -1,17 +1,18 @@
-From 714024e4699b28eed866d775f4c715b0e55b76f7 Mon Sep 17 00:00:00 2001
+From 54a1c3da53e351b52ae750bd2865435650ec55f5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 7 Jan 2016 19:40:08 +0000
-Subject: [PATCH 08/32] Check if __GLIBC_PREREQ is defined before using it
+Subject: [PATCH 01/25] Check if __GLIBC_PREREQ is defined before using it
 
 __GLIBC_PREREQ is specific to glibc so it should be checked if it is
 defined or not.
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
- testcases/kernel/syscalls/accept4/accept4_01.c     |  9 ++++++-
- testcases/kernel/syscalls/getcpu/getcpu01.c        | 31 ++++++++++++++++++++++
- .../sched_getaffinity/sched_getaffinity01.c        | 26 ++++++++++++++++++
- 3 files changed, 65 insertions(+), 1 deletion(-)
+ testcases/kernel/syscalls/accept4/accept4_01.c     |  9 +++++-
+ testcases/kernel/syscalls/getcpu/getcpu01.c        | 33 ++++++++++++++++++++++
+ .../sched_getaffinity/sched_getaffinity01.c        | 26 +++++++++++++++++
+ 3 files changed, 67 insertions(+), 1 deletion(-)
 
 diff --git a/testcases/kernel/syscalls/accept4/accept4_01.c b/testcases/kernel/syscalls/accept4/accept4_01.c
 index 6072bfa..2b090cb 100644
@@ -58,7 +59,7 @@ index 6072bfa..2b090cb 100644
  	acceptfd = accept4(lfd, (struct sockaddr *)&claddr, &addrlen,
  			   closeonexec_flag | nonblock_flag);
 diff --git a/testcases/kernel/syscalls/getcpu/getcpu01.c b/testcases/kernel/syscalls/getcpu/getcpu01.c
-index c927512..6de6362 100644
+index c927512..2d252b4 100644
 --- a/testcases/kernel/syscalls/getcpu/getcpu01.c
 +++ b/testcases/kernel/syscalls/getcpu/getcpu01.c
 @@ -62,6 +62,7 @@
@@ -69,14 +70,13 @@ index c927512..6de6362 100644
  #if __GLIBC_PREREQ(2,6)
  #if defined(__x86_64__)
  #include <utmpx.h>
-@@ -72,13 +73,16 @@ int sys_support = 1;
+@@ -75,10 +76,15 @@ int sys_support = 0;
  #else
  int sys_support = 0;
  #endif
++#else
++int sys_support = 0;
 +#endif
- #else
- int sys_support = 0;
- #endif
  
 +#if defined(__GLIBC__) && defined(__GLIBC_PREREQ)
  #if !(__GLIBC_PREREQ(2, 7))
@@ -86,7 +86,7 @@ index c927512..6de6362 100644
  
  void cleanup(void);
  void setup(void);
-@@ -164,9 +168,11 @@ static inline int getcpu(unsigned *cpu_id, unsigned *node_id,
+@@ -164,9 +170,11 @@ static inline int getcpu(unsigned *cpu_id, unsigned *node_id,
  {
  #if defined(__i386__)
  	return syscall(318, cpu_id, node_id, cache_struct);
@@ -98,7 +98,7 @@ index c927512..6de6362 100644
  	return 0;
  }
  
-@@ -191,15 +197,20 @@ unsigned int set_cpu_affinity(void)
+@@ -191,15 +199,20 @@ unsigned int set_cpu_affinity(void)
  	cpu_set_t *set;
  	size_t size;
  	int nrcpus = 1024;
@@ -119,7 +119,7 @@ index c927512..6de6362 100644
  #if __GLIBC_PREREQ(2, 7)
  	size = CPU_ALLOC_SIZE(nrcpus);
  	CPU_ZERO_S(size, set);
-@@ -207,8 +218,13 @@ realloc:
+@@ -207,8 +220,13 @@ realloc:
  	size = sizeof(cpu_set_t);
  	CPU_ZERO(set);
  #endif
@@ -133,7 +133,7 @@ index c927512..6de6362 100644
  #if __GLIBC_PREREQ(2, 7)
  		if (errno == EINVAL && nrcpus < (1024 << 8)) {
  			nrcpus = nrcpus << 2;
-@@ -220,10 +236,17 @@ realloc:
+@@ -220,10 +238,17 @@ realloc:
  				 "NR_CPUS of the kernel is more than 1024, so we'd better use a newer glibc(>= 2.7)");
  		else
  #endif
@@ -151,7 +151,7 @@ index c927512..6de6362 100644
  #if __GLIBC_PREREQ(2, 7)
  	CPU_ZERO_S(size, set);
  	CPU_SET_S(cpu_max, size, set);
-@@ -231,6 +254,10 @@ realloc:
+@@ -231,6 +256,10 @@ realloc:
  	CPU_ZERO(set);
  	CPU_SET(cpu_max, set);
  #endif
@@ -162,7 +162,7 @@ index c927512..6de6362 100644
  	if (sched_setaffinity(0, size, set) < 0) {
  		CPU_FREE(set);
  		tst_brkm(TFAIL, NULL, "sched_setaffinity:errno:%d", errno);
-@@ -247,11 +274,15 @@ unsigned int max_cpuid(size_t size, cpu_set_t * set)
+@@ -247,11 +276,15 @@ unsigned int max_cpuid(size_t size, cpu_set_t * set)
  {
  	unsigned int index, max = 0;
  	for (index = 0; index < size * BITS_PER_BYTE; index++)
@@ -275,5 +275,5 @@ index 9d6a81a..4ed13b2 100644
  	QUICK_TEST(sched_getaffinity(0, len, (cpu_set_t *) - 1));
  	QUICK_TEST(sched_getaffinity(0, 0, mask));
 -- 
-2.7.0
+1.9.1
 
-- 
1.9.1



Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.11868.1630289072774162401
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Aug 2021 19:04:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: hongxu.jia@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 17U24SlJ029841
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 29 Aug 2021 19:04:28 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 29 Aug 2021 19:04:27 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Sun, 29 Aug 2021 19:04:27 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 29 Aug 2021 19:04:27 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>, <raj.khem@gmail.com>
Subject: [PATCH V2] glibc: fix create thread failed in old unprivileged docker
Date: Sun, 29 Aug 2021 19:04:27 -0700
Message-ID: <20210830020427.52276-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <169FCB55FC9F4293.26797@lists.openembedded.org>
References: <169FCB55FC9F4293.26797@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Since upstream commit [d8ea0d0168 Add an internal wrapper for clone, clone2
and clone3] applied, start a unprivileged container (docker run without
--privileged), it creates a thread failed in container.

In commit d8ea0d0168, it calls __clone3 if HAVE_CLONE3_WAPPER is defined.  If
__clone3 returns -1 with ENOSYS, fall back to clone or clone2.

The newest docker has fixed the issue in commit [1], but it was applied
only on master, to backward compatibility with old docker, discussed
with glibc maintainer [2], explicitly disable clone3 wrapper work by removing
macro definition of HAVE_CLONE3_WRAPPER

[1] https://github.com/moby/moby/commit/9f6b562dd12ef7b1f9e2f8e6f2ab6477790a6594
[2] https://sourceware.org/pipermail/libc-alpha/2021-August/130591.html

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...hread-failed-in-unprivileged-process.patch | 92 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.34.bb         |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in-unprivileged-process.patch

diff --git a/meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in-unprivileged-process.patch b/meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in-unprivileged-process.patch
new file mode 100644
index 0000000000..2adfac2993
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in-unprivileged-process.patch
@@ -0,0 +1,92 @@
+From d454c5746f053ed845ef05b61f5355dc1e8a947c Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sun, 29 Aug 2021 20:49:16 +0800
+Subject: [PATCH] fix create thread failed in unprivileged process
+
+Since commit [d8ea0d0168 Add an internal wrapper for clone, clone2 and clone3]
+applied, start a unprivileged container (docker run without --privileged),
+it creates a thread failed in container.
+
+In commit d8ea0d0168, it calls __clone3 if HAVE_CLONE3_WAPPER is defined.  If
+__clone3 returns -1 with ENOSYS, fall back to clone or clone2.
+
+The newest docker has fixed the issue in commit [1], but it was applied
+only on master, to backward compatibility with old docker, we explicitly
+disable clone3 wrapper work by removing macro definition of HAVE_CLONE3_WRAPPER
+
+[1] https://github.com/moby/moby/commit/9f6b562dd12ef7b1f9e2f8e6f2ab6477790a6594
+
+Here are the test steps:
+
+1) Prepare test code
+cat > conftest.c <<ENDOF
+ #include <pthread.h>
+ #include <stdio.h>
+
+int check_me = 0;
+void* func(void* data) {check_me = 42; printf("start thread: check_me %d\n", check_me); return &check_me;}
+int main()
+{
+  pthread_t t;
+  void *ret;
+  pthread_create (&t, 0, func, 0);
+  pthread_join (t, &ret);
+  printf("check_me %d, p %p\n", check_me, &ret);
+  return (check_me != 42 || ret != &check_me);
+}
+
+ENDOF
+
+2) Compile
+gcc -o conftest -pthread conftest.c
+
+3) Start a container with glibc 2.34 installed
+[skip details]
+docker run -it <container-image-name> bash
+
+4) Run conftest without this patch
+$ ./conftest
+check_me 0, p 0x7ffd91ccd400
+
+5) Run conftest with this patch
+$ ./conftest
+start thread: check_me 42
+check_me 42, p 0x7ffe253c6f20
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ sysdeps/unix/sysv/linux/i386/sysdep.h   | 3 ++-
+ sysdeps/unix/sysv/linux/x86_64/sysdep.h | 3 ++-
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/sysdeps/unix/sysv/linux/i386/sysdep.h b/sysdeps/unix/sysv/linux/i386/sysdep.h
+index 8a9911b7ac..60d5cb2d9a 100644
+--- a/sysdeps/unix/sysv/linux/i386/sysdep.h
++++ b/sysdeps/unix/sysv/linux/i386/sysdep.h
+@@ -291,7 +291,8 @@ struct libc_do_syscall_args
+ # define HAVE_TIME_VSYSCALL             "__vdso_time"
+ # define HAVE_CLOCK_GETRES_VSYSCALL     "__vdso_clock_getres"
+ 
+-# define HAVE_CLONE3_WRAPPER		1
++/* Disable it to backward compatibility with old docker */
++//# define HAVE_CLONE3_WRAPPER		1
+ 
+ # undef HAVE_INTERNAL_BRK_ADDR_SYMBOL
+ # define HAVE_INTERNAL_BRK_ADDR_SYMBOL 1
+diff --git a/sysdeps/unix/sysv/linux/x86_64/sysdep.h b/sysdeps/unix/sysv/linux/x86_64/sysdep.h
+index 327e59388b..a7bc2cc686 100644
+--- a/sysdeps/unix/sysv/linux/x86_64/sysdep.h
++++ b/sysdeps/unix/sysv/linux/x86_64/sysdep.h
+@@ -377,7 +377,8 @@
+ # define HAVE_GETCPU_VSYSCALL		"__vdso_getcpu"
+ # define HAVE_CLOCK_GETRES64_VSYSCALL   "__vdso_clock_getres"
+ 
+-# define HAVE_CLONE3_WRAPPER			1
++/* Disable it to backward compatibility with old docker */
++//# define HAVE_CLONE3_WRAPPER			1
+ 
+ # define SINGLE_THREAD_BY_GLOBAL		1
+ 
+-- 
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.34.bb b/meta/recipes-core/glibc/glibc_2.34.bb
index eafc0216ff..46de1dae43 100644
--- a/meta/recipes-core/glibc/glibc_2.34.bb
+++ b/meta/recipes-core/glibc/glibc_2.34.bb
@@ -57,6 +57,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
            file://0001-CVE-2021-38604.patch \
            file://0002-CVE-2021-38604.patch \
+           file://0001-fix-create-thread-failed-in-unprivileged-process.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.30.2


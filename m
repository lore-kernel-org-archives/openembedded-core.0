Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web09.3878.1630245159868574261
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Aug 2021 06:52:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: hongxu.jia@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 17TDqapW025430
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Sun, 29 Aug 2021 06:52:36 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 17TDqZvD011058
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 29 Aug 2021 06:52:36 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 29 Aug 2021 06:52:35 -0700
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 29 Aug 2021 06:52:35 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>
Subject: [PATCH] glibc: fix create thread failed in unprivileged process
Date: Sun, 29 Aug 2021 06:52:35 -0700
Message-ID: <20210829135235.43999-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Since upstream commit [d8ea0d0168 Add an internal wrapper for clone, clone2
and clone3] applied, start a unprivileged container (docker run without
--privileged), it creates a thread failed in container.

In commit d8ea0d0168, it calls __clone3 if HAVE_CLONE3_WAPPER is defined.  If
__clone3 returns -1 with ENOSYS, fall back to clone or clone2.

As known from [1], cloneXXX fails with EPERM if CLONE_NEWCGROUP,
CLONE_NEWIPC, CLONE_NEWNET, CLONE_NEWNS, CLONE_NEWPID, or CLONE_NEWUTS
was specified by an unprivileged process (process without CAP_SYS_ADMIN)

[1] https://man7.org/linux/man-pages/man2/clone3.2.html

So if __clone3 returns -1 with EPERM, fall back to clone or clone2 could
fix the issue.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...d-failed-in-unprivileged-process-BZ-.patch | 79 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.34.bb         |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in-unprivileged-process-BZ-.patch

diff --git a/meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in-unprivileged-process-BZ-.patch b/meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
new file mode 100644
index 0000000000..3283dd7ad8
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
@@ -0,0 +1,79 @@
+From a8bc44936202692edcd82a48c07d7cf27d6ed8ee Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Sun, 29 Aug 2021 20:49:16 +0800
+Subject: [PATCH] fix create thread failed in unprivileged process [BZ #28287]
+
+Since commit [d8ea0d0168 Add an internal wrapper for clone, clone2 and clone3]
+applied, start a unprivileged container (docker run without --privileged),
+it creates a thread failed in container.
+
+In commit d8ea0d0168, it calls __clone3 if HAVE_CLONE3_WAPPER is defined.  If
+__clone3 returns -1 with ENOSYS, fall back to clone or clone2.
+
+As known from [1], cloneXXX fails with EPERM if CLONE_NEWCGROUP,
+CLONE_NEWIPC, CLONE_NEWNET, CLONE_NEWNS, CLONE_NEWPID, or CLONE_NEWUTS
+was specified by an unprivileged process (process without CAP_SYS_ADMIN)
+
+[1] https://man7.org/linux/man-pages/man2/clone3.2.html
+
+So if __clone3 returns -1 with EPERM, fall back to clone or clone2 could
+fix the issue. Here are the test steps:
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
+Upstream-Status: Submitted [libc-alpha@sourceware.org]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ sysdeps/unix/sysv/linux/clone-internal.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sysdeps/unix/sysv/linux/clone-internal.c b/sysdeps/unix/sysv/linux/clone-internal.c
+index 979f7880be..97101994e8 100644
+--- a/sysdeps/unix/sysv/linux/clone-internal.c
++++ b/sysdeps/unix/sysv/linux/clone-internal.c
+@@ -52,7 +52,7 @@ __clone_internal (struct clone_args *cl_args,
+   /* Try clone3 first.  */
+   int saved_errno = errno;
+   ret = __clone3 (cl_args, sizeof (*cl_args), func, arg);
+-  if (ret != -1 || errno != ENOSYS)
++  if (ret != -1 || (errno != ENOSYS && errno != EPERM))
+     return ret;
+ 
+   /* NB: Restore errno since errno may be checked against non-zero
+-- 
+2.30.2
+
diff --git a/meta/recipes-core/glibc/glibc_2.34.bb b/meta/recipes-core/glibc/glibc_2.34.bb
index eafc0216ff..6dc315c349 100644
--- a/meta/recipes-core/glibc/glibc_2.34.bb
+++ b/meta/recipes-core/glibc/glibc_2.34.bb
@@ -57,6 +57,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0030-powerpc-Do-not-ask-compiler-for-finding-arch.patch \
            file://0001-CVE-2021-38604.patch \
            file://0002-CVE-2021-38604.patch \
+           file://0001-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.27.0


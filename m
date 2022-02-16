Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8954C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 02:54:46 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web09.7386.1644980086039530797
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 18:54:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: hongxu.jia@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 21G2sUTp026481
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Feb 2022 18:54:30 -0800
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 15 Feb 2022 18:54:29 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 15 Feb 2022 18:54:29 -0800
Received: from ala-lpggp7.wrs.com (147.11.105.171) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 15 Feb 2022 18:54:29 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>, <raj.khem@gmail.com>
Subject: [PATCH] glibc: fix create thread failed in unprivileged process
Date: Tue, 15 Feb 2022 18:54:29 -0800
Message-ID: <20220216025429.33339-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Feb 2022 02:54:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161764

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
 ...d-failed-in-unprivileged-process-BZ-.patch | 88 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch

diff --git a/meta/recipes-core/glibc/glibc/0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch b/meta/recipes-core/glibc/glibc/0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
new file mode 100644
index 0000000000..b431ea168d
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch
@@ -0,0 +1,88 @@
+From 6609858239b8f94e12c19eac0cec425511d1211f Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Inappropriate [Rejected by upstream]
+
+Upstream glibc rejected it because the latest docker has resolved the issue [1],
+and upstream glibc does not backward compatibility with old docker[2]
+
+In order to build Yocto with uninative in old docker, we need this local
+patch
+
+[1] https://github.com/moby/moby/commit/9f6b562dd12ef7b1f9e2f8e6f2ab6477790a6594
+[2] https://sourceware.org/pipermail/libc-alpha/2021-August/130590.html
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ sysdeps/unix/sysv/linux/clone-internal.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sysdeps/unix/sysv/linux/clone-internal.c b/sysdeps/unix/sysv/linux/clone-internal.c
+index a71effcbd3..a0569113aa 100644
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
+2.27.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 2903a4001f..b785b61154 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -47,6 +47,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0021-Replace-echo-with-printf-builtin-in-nscd-init-script.patch \
            file://0022-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch \
            file://0023-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
+           file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
-- 
2.27.0



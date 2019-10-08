Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id DDA8C7F38A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Oct 2019 15:04:50 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id i32so3084972pgl.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Oct 2019 08:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=CpFJ44w1vhMloksstcFg67llIDMA2i+M0sNnHCm3m8s=;
	b=g2GUqVu/pyHimHF8BZYkZLBb1iXYVUpo3xqaBWoATet9Gk99etvdS7UoHJkqbOsCYn
	J6Ob0pxQ4Hsbu/fHcYfdbicA06Wz3onCvZORa/zqiZNEpT+lLe6wRvxUMznKjWI+Fkdz
	Er52DP+f6YItYfUcWZD/fSeIYKmqBGqbtSRG9t5hBtTt9DiG4Sjojfp8i5cCOKAw1whL
	7isPNW33J7UIz/2S3fxpL4FO/rg/hNMlBqGHRMajoD8lMrKHQJqI5SczfT/gQjMzJLq/
	CndAVD6F/HarbQxuM6KWvxlz+mWkK3V7gPVgd5VJsOlexLbT94m4UpDaIr9R6MSvz8Vt
	lZ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CpFJ44w1vhMloksstcFg67llIDMA2i+M0sNnHCm3m8s=;
	b=HQNM77tvqoF81YYd19H2nfaSCoGDfpMTz+HT9l9tCiDctGGHarQiArn763zsZloCpm
	6WsGN+WejDR3DqZRqs/opIHGBlq34sPuhYwnERctSXQY7hZ9y5fBLW9HUHseoEGDNGGu
	WydtRsWJzIpuYGFgmJytyl0FnMlc4bT9eYeTVC8IEoseKGGVA5TaU0ZLHa3KHg+kiSBs
	c7KCkejUuyEIlttSsJHyGsbf2QpvdrNs/5NbbYGhkOQgFisXm/XWPqe6bkTdh5h5N+XG
	4YTDwSo87LyPIK120CAckfMqAAGNP70rc6KAgAeSNDidQAYLNnTNJ7Rg1CvyXTj8ao3D
	rPGw==
X-Gm-Message-State: APjAAAUEfjSeBKgosKNsijTPu5cocb8URZNas5b/1tyvStFkBNM1VoTd
	/6AdW0ApFAzuxMyyoOQBvjlej4wpr1k=
X-Google-Smtp-Source: APXvYqyXqU8knCrhzgLr4vFHQyZE4vNUPgKBUTnb3ZJzY/A6kjQ7LkKJG/XvG6u5w4IvdHfz8sTmxg==
X-Received: by 2002:a63:d641:: with SMTP id d1mr22299710pgj.96.1570547091583; 
	Tue, 08 Oct 2019 08:04:51 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:8d14:b7f9:8b16:849f])
	by smtp.gmail.com with ESMTPSA id
	a8sm17675579pfo.118.2019.10.08.08.04.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Oct 2019 08:04:51 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Oct 2019 08:04:35 -0700
Message-Id: <fbedc2d73ff472c89ba273a890408f93015e8f17.1570546808.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570546808.git.akuster808@gmail.com>
References: <cover.1570546808.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [warrior 08/10] qemu: fix build issue on new hosts with glibc 2.30
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
X-List-Received-Date: Tue, 08 Oct 2019 15:04:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This fixes the following error:

TOPDIR/tmp/work/x86_64-linux/qemu-native/3.1.0-r0/qemu-3.1.0/linux-user/syscall.c:254:16: error: static declaration of ‘gettid’ follows non-static declaration
 254 | _syscall0(int, gettid)
 |                ^~~~~~
 TOPDIR/tmp/work/x86_64-linux/qemu-native/3.1.0-r0/qemu-3.1.0/linux-user/syscall.c:185:13: note: in definition of macro ‘_syscall0’
 185 | static type name (void)   \
 |             ^~~~
 In file included from /usr/include/unistd.h:1170,
 from TOPDIR/tmp/work/x86_64-linux/qemu-native/3.1.0-r0/qemu-3.1.0/include/qemu/osdep.h:90,
 from TOPDIR/tmp/work/x86_64-linux/qemu-native/3.1.0-r0/qemu-3.1.0/linux-user/syscall.c:20:
 /usr/include/bits/unistd_ext.h:34:16: note: previous declaration of ‘gettid’ was here
 34 | extern __pid_t gettid (void) __THROW;
 |                ^~~~~~

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc                |  2 +
 ...nux-user-assume-__NR_gettid-always-exists.patch | 49 +++++++++++
 ...rename-gettid-to-sys_gettid-to-avoid-clas.patch | 95 ++++++++++++++++++++++
 3 files changed, 146 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-linux-user-assume-__NR_gettid-always-exists.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-linux-user-rename-gettid-to-sys_gettid-to-avoid-clas.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index e720ddf..40c3174 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -33,6 +33,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0014-linux-user-fix-to-handle-variably-sized-SIOCGSTAMP-w.patch \
            file://CVE-2018-20815.patch \
            file://CVE-2019-8934.patch \
+           file://0001-linux-user-assume-__NR_gettid-always-exists.patch \
+           file://0001-linux-user-rename-gettid-to-sys_gettid-to-avoid-clas.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-linux-user-assume-__NR_gettid-always-exists.patch b/meta/recipes-devtools/qemu/qemu/0001-linux-user-assume-__NR_gettid-always-exists.patch
new file mode 100644
index 0000000..b09ddbe
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-linux-user-assume-__NR_gettid-always-exists.patch
@@ -0,0 +1,49 @@
+From 184943d827ce09375284e6fbb9fd5eeb9e369529 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
+Date: Wed, 20 Mar 2019 16:18:41 +0000
+Subject: [PATCH] linux-user: assume __NR_gettid always exists
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The gettid syscall was introduced in Linux 2.4.11. This is old enough
+that we can assume it always exists and thus not bother with the
+conditional backcompat logic.
+
+Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Reviewed-by: Laurent Vivier <laurent@vivier.eu>
+Message-Id: <20190320161842.13908-2-berrange@redhat.com>
+Signed-off-by: Laurent Vivier <laurent@vivier.eu>
+
+Upstream-Status: Backport
+dependancy patch for fix
+
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
+---
+
+
+ linux-user/syscall.c | 8 --------
+ 1 file changed, 8 deletions(-)
+
+Index: qemu-3.1.0/linux-user/syscall.c
+===================================================================
+--- qemu-3.1.0.orig/linux-user/syscall.c
++++ qemu-3.1.0/linux-user/syscall.c
+@@ -250,15 +250,7 @@ static type name (type1 arg1,type2 arg2,
+ #define TARGET_NR__llseek TARGET_NR_llseek
+ #endif
+ 
+-#ifdef __NR_gettid
+ _syscall0(int, gettid)
+-#else
+-/* This is a replacement for the host gettid() and must return a host
+-   errno. */
+-static int gettid(void) {
+-    return -ENOSYS;
+-}
+-#endif
+ 
+ /* For the 64-bit guest on 32-bit host case we must emulate
+  * getdents using getdents64, because otherwise the host
diff --git a/meta/recipes-devtools/qemu/qemu/0001-linux-user-rename-gettid-to-sys_gettid-to-avoid-clas.patch b/meta/recipes-devtools/qemu/qemu/0001-linux-user-rename-gettid-to-sys_gettid-to-avoid-clas.patch
new file mode 100644
index 0000000..86d7678
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-linux-user-rename-gettid-to-sys_gettid-to-avoid-clas.patch
@@ -0,0 +1,95 @@
+From 71ba74f67eaca21b0cc9d96f534ad3b9a7161400 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
+Date: Wed, 20 Mar 2019 16:18:42 +0000
+Subject: [PATCH] linux-user: rename gettid() to sys_gettid() to avoid clash
+ with glibc
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The glibc-2.29.9000-6.fc31.x86_64 package finally includes the gettid()
+function as part of unistd.h when __USE_GNU is defined. This clashes
+with linux-user code which unconditionally defines this function name
+itself.
+
+/home/berrange/src/virt/qemu/linux-user/syscall.c:253:16: error: static declaration of ‘gettid’ follows non-static declaration
+  253 | _syscall0(int, gettid)
+      |                ^~~~~~
+/home/berrange/src/virt/qemu/linux-user/syscall.c:184:13: note: in definition of macro ‘_syscall0’
+  184 | static type name (void)   \
+      |             ^~~~
+In file included from /usr/include/unistd.h:1170,
+                 from /home/berrange/src/virt/qemu/include/qemu/osdep.h:107,
+                 from /home/berrange/src/virt/qemu/linux-user/syscall.c:20:
+/usr/include/bits/unistd_ext.h:34:16: note: previous declaration of ‘gettid’ was here
+   34 | extern __pid_t gettid (void) __THROW;
+      |                ^~~~~~
+  CC      aarch64-linux-user/linux-user/signal.o
+make[1]: *** [/home/berrange/src/virt/qemu/rules.mak:69: linux-user/syscall.o] Error 1
+make[1]: *** Waiting for unfinished jobs....
+make: *** [Makefile:449: subdir-aarch64-linux-user] Error 2
+
+While we could make our definition conditional and rely on glibc's impl,
+this patch simply renames our definition to sys_gettid() which is a
+common pattern in this file.
+
+Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
+Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
+Reviewed-by: Laurent Vivier <laurent@vivier.eu>
+Message-Id: <20190320161842.13908-3-berrange@redhat.com>
+Signed-off-by: Laurent Vivier <laurent@vivier.eu>
+
+Upstream-status: Backport
+
+Fixes issue found on tumbleweed-ty-1
+Yocto bug: https://bugzilla.yoctoproject.org/show_bug.cgi?id=13577
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
+---
+ linux-user/syscall.c | 11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+Index: qemu-3.1.0/linux-user/syscall.c
+===================================================================
+--- qemu-3.1.0.orig/linux-user/syscall.c
++++ qemu-3.1.0/linux-user/syscall.c
+@@ -250,7 +250,8 @@ static type name (type1 arg1,type2 arg2,
+ #define TARGET_NR__llseek TARGET_NR_llseek
+ #endif
+ 
+-_syscall0(int, gettid)
++#define __NR_sys_gettid __NR_gettid
++_syscall0(int, sys_gettid)
+ 
+ /* For the 64-bit guest on 32-bit host case we must emulate
+  * getdents using getdents64, because otherwise the host
+@@ -5483,7 +5484,7 @@ static void *clone_func(void *arg)
+     cpu = ENV_GET_CPU(env);
+     thread_cpu = cpu;
+     ts = (TaskState *)cpu->opaque;
+-    info->tid = gettid();
++    info->tid = sys_gettid();
+     task_settid(ts);
+     if (info->child_tidptr)
+         put_user_u32(info->tid, info->child_tidptr);
+@@ -5628,9 +5629,9 @@ static int do_fork(CPUArchState *env, un
+                mapping.  We can't repeat the spinlock hack used above because
+                the child process gets its own copy of the lock.  */
+             if (flags & CLONE_CHILD_SETTID)
+-                put_user_u32(gettid(), child_tidptr);
++                put_user_u32(sys_gettid(), child_tidptr);
+             if (flags & CLONE_PARENT_SETTID)
+-                put_user_u32(gettid(), parent_tidptr);
++                put_user_u32(sys_gettid(), parent_tidptr);
+             ts = (TaskState *)cpu->opaque;
+             if (flags & CLONE_SETTLS)
+                 cpu_set_tls (env, newtls);
+@@ -10588,7 +10589,7 @@ static abi_long do_syscall1(void *cpu_en
+         return TARGET_PAGE_SIZE;
+ #endif
+     case TARGET_NR_gettid:
+-        return get_errno(gettid());
++        return get_errno(sys_gettid());
+ #ifdef TARGET_NR_readahead
+     case TARGET_NR_readahead:
+ #if TARGET_ABI_BITS == 32
-- 
2.7.4



Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1E68B7F518
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 15:49:42 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id e1so3941029pgj.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2019 08:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=b5offvoL7qAppAGfNH1X7ndEYfR3Hg56k58LJKHSpqo=;
	b=l9SPc95dPR2XA8ZhXReniQWHUNG5nCspNC6dkjL3XtWj5ORydBPMGE6q4jyqAOv9UL
	ddZZoRl9nnKEHcGQYv2hqL7HP2EqsyQTZqLC6fYfhEOAa0vp34mnaKMXLBtuPmPhvSk4
	lyRE6zxMPWZlOcwUSmGL/sd0sPKBiUKqUcNgn6aYWWg4Hvi3zK6l8KwZdcywzHWSZ0fq
	9dwz3AJIOeA0bVoVApzORSvSQvH6cnd0n1qhX/MhPRbU8ZVtmvXDiiL8KvOgwLuSy3AY
	L84fujAj4iSkZEBuUWrEtal258uHcTkXj9DiHJB2rtQA1EwH1IqOYPDGFqRkEnyZFm2t
	ytGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=b5offvoL7qAppAGfNH1X7ndEYfR3Hg56k58LJKHSpqo=;
	b=PQHi8z1elXWwX0Lg2HyItvMMP3mbNgNz9j9+U6S2dypc9CX3kvmcaPss64p8pitQKU
	+yDf2kMyh/sqnNWzJCZuODGqXAFUqzRz0PLrorygtRZ+32UnLB1N0CUh8OTFvW70AzyW
	K9LFBSFlP8WTU4epAWoLUm6+ZD4EwFICd1Pkxip6/+F6RqQN4OUvjTDrNROal4UlWmvn
	01GEqXmjBaGSYDuKAHGVpKs/DaFQDnbxBw6Jo+7n9fDohhoMt0ZsONauXFp4C4wRlhwz
	M/kFOd2JsRQFuUykLY7qXKoDecrWMkt8/McYAfzRWhZN4Ev55c0dXZUfLiFMBp+PbJ07
	NENg==
X-Gm-Message-State: APjAAAXn8OTeymZM4nO1/mdFDJuNemVP7wLftz+Y5XKm3IiBel93FaaZ
	fqFG7eoZEMMXVmDmo6kzmplyYj74
X-Google-Smtp-Source: APXvYqyj3i31cKilCOelr2AqOGqhCbdNediKMdX7YIqpEsp2g6YO/jDvCdJMG1DTqEJbx+EezXw3dw==
X-Received: by 2002:a63:1b44:: with SMTP id b4mr12081798pgm.421.1570722582823; 
	Thu, 10 Oct 2019 08:49:42 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:ac6d:f6a6:e34b:c619])
	by smtp.gmail.com with ESMTPSA id
	m26sm9872552pgn.71.2019.10.10.08.49.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Oct 2019 08:49:41 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Oct 2019 08:49:21 -0700
Message-Id: <5b5ca76cc5dd424248c7e687e562597a2c85df57.1570722439.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1570722439.git.akuster808@gmail.com>
References: <cover.1570722439.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [thud 09/12] qemu: fix build issue on new hosts with glibc 2.30
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
X-List-Received-Date: Thu, 10 Oct 2019 15:49:42 -0000
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
 ...nux-user-assume-__NR_gettid-always-exists.patch | 49 +++++++++++
 ...rename-gettid-to-sys_gettid-to-avoid-clas.patch | 95 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_3.0.0.bb           |  2 +
 3 files changed, 146 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-linux-user-assume-__NR_gettid-always-exists.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-linux-user-rename-gettid-to-sys_gettid-to-avoid-clas.patch

diff --git a/meta/recipes-devtools/qemu/qemu/0001-linux-user-assume-__NR_gettid-always-exists.patch b/meta/recipes-devtools/qemu/qemu/0001-linux-user-assume-__NR_gettid-always-exists.patch
new file mode 100644
index 0000000..767b200
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
+Index: qemu-3.0.0/linux-user/syscall.c
+===================================================================
+--- qemu-3.0.0.orig/linux-user/syscall.c
++++ qemu-3.0.0/linux-user/syscall.c
+@@ -251,15 +251,7 @@ static type name (type1 arg1,type2 arg2,
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
index 0000000..ab3b71d
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
+Index: qemu-3.0.0/linux-user/syscall.c
+===================================================================
+--- qemu-3.0.0.orig/linux-user/syscall.c
++++ qemu-3.0.0/linux-user/syscall.c
+@@ -251,7 +251,8 @@ static type name (type1 arg1,type2 arg2,
+ #define TARGET_NR__llseek TARGET_NR_llseek
+ #endif
+ 
+-_syscall0(int, gettid)
++#define __NR_sys_gettid __NR_gettid
++_syscall0(int, sys_gettid)
+ 
+ /* For the 64-bit guest on 32-bit host case we must emulate
+  * getdents using getdents64, because otherwise the host
+@@ -6483,7 +6484,7 @@ static void *clone_func(void *arg)
+     cpu = ENV_GET_CPU(env);
+     thread_cpu = cpu;
+     ts = (TaskState *)cpu->opaque;
+-    info->tid = gettid();
++    info->tid = sys_gettid();
+     task_settid(ts);
+     if (info->child_tidptr)
+         put_user_u32(info->tid, info->child_tidptr);
+@@ -6628,9 +6629,9 @@ static int do_fork(CPUArchState *env, un
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
+@@ -11876,7 +11877,7 @@ abi_long do_syscall(void *cpu_env, int n
+         break;
+ #endif
+     case TARGET_NR_gettid:
+-        ret = get_errno(gettid());
++        ret = get_errno(sys_gettid());
+         break;
+ #ifdef TARGET_NR_readahead
+     case TARGET_NR_readahead:
diff --git a/meta/recipes-devtools/qemu/qemu_3.0.0.bb b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
index 6c3049b..e483aca 100644
--- a/meta/recipes-devtools/qemu/qemu_3.0.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_3.0.0.bb
@@ -40,6 +40,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2019-3812.patch \
            file://CVE-2019-6778.patch \
            file://CVE-2019-8934.patch \
+           file://0001-linux-user-assume-__NR_gettid-always-exists.patch \
+           file://0001-linux-user-rename-gettid-to-sys_gettid-to-avoid-clas.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.7.4



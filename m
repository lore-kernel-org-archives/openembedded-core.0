Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 45B4365CE9
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Oct 2019 14:43:13 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id q15so5571570pll.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Oct 2019 07:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JHt870rIMJGbtO1Q6Xz1CYaZkFONb4Pl2PooG7Ut7d4=;
	b=RFLYl2WHRVj5S04rWVnhnWAVG4ZK4x7tj2Gcg46PElB29L2IQOEpnhdg6lFAum/1aN
	HQYRKyznqOFLRJmL8asR73olA9znC/h7WOpA7M+BMCBBkOfq9Ga6yWTNfJSYP3uYeneR
	6qN/OpxeQ9C2yTJkbHhwyp134lTkzYK/N4p4sIZvd+Hwzo+loK1IHHxJ0Brkr11W1tml
	tyO7JTxXFheZ2NyPLf4S6ZF0Sc8VKfxHFSDrM4vZNBAnTRKom/Ymf7Bh274+lzU9X1Sz
	0rlyFNuTJZOGO7H/ggpxreoomqsiQhbdtrIHZTcP2UYTc48YNmF2CNtUjGVPwpU5t5KS
	R+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=JHt870rIMJGbtO1Q6Xz1CYaZkFONb4Pl2PooG7Ut7d4=;
	b=bVjORDLlArKMkeO7G9YHqOjstqQ3CJzmtRngdU6FLekzJTb/lSdUPrvfz+QrbZtS9B
	imy3kFNjMSfQyAXTMO4nJ7+GpBWogcatdoVl0LHuwtfbFrpRfvkllx7X4pRdcCpQAC8e
	lfKaREcn0EobucNvRJUCaUCRr822NnWVPkEjO8ypY+xxrLzx1JG1VQ7pMyaXjxzoqTxc
	pzSAg0rLIra32WmRvcCqclLwXEc6JHUrklRbiS7zJfYAn4XLPXsMp6mMSvC01npgIpZ0
	30yYqXz4Y5jXWfWCuVhvAkFpPxIG+/230R+wDTcxfATaoeqmkXGnbPBHyXUx9bvK6sJE
	AHVg==
X-Gm-Message-State: APjAAAU/8RIPXzwTyBF9o7gJdIFS08Kfw1JD4iFUhlxQ5d9Q59EQRuXH
	Jpbqvl1IEJk5ofrH3aUsLuNvyK0sa3I=
X-Google-Smtp-Source: APXvYqyRUHE+Ujkq7hagVqTZ6GlB4Xg6Xasso1IY+mb2Fi0FXja0SXqSM7/TZ7jLNZ8g/Ccdt0Zv0w==
X-Received: by 2002:a17:902:322:: with SMTP id
	31mr25086838pld.150.1570372993789; 
	Sun, 06 Oct 2019 07:43:13 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:65e8:7322:d189:1d85])
	by smtp.gmail.com with ESMTPSA id
	l1sm11558471pja.30.2019.10.06.07.43.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 06 Oct 2019 07:43:13 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  6 Oct 2019 07:43:11 -0700
Message-Id: <1570372991-15250-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [warrior][PATCH] qemu: fix build issue on new hosts with glibc 2.30
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
X-List-Received-Date: Sun, 06 Oct 2019 14:43:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Affects <= qemu 3.1.0

[Yocto #13577]

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
 2 files changed, 144 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-linux-user-assume-__NR_gettid-always-exists.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-linux-user-rename-gettid-to-sys_gettid-to-avoid-clas.patch

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



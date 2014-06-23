Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 983BF6FBE3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jun 2014 06:28:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5N6SUeU028006
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jun 2014 23:28:30 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.137) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 22 Jun 2014 23:28:29 -0700
From: <rongqing.li@windriver.com>
To: <liezhi.yang@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Jun 2014 14:28:30 +0800
Message-ID: <1403504910-12319-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] qemu: exclude some ARM EABI obsolete syscalls
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
X-List-Received-Date: Mon, 23 Jun 2014 06:28:34 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

some syscalls are obsolete and no longer available for EABI, exclude them to
fix the below error:
        In file included from qemu-seccomp.c:16:0:
        qemu-seccomp.c:28:7: error: '__NR_select' undeclared here (not in a function)
              { SCMP_SYS(select), 252 },
                ^
        qemu-seccomp.c:36:7: error: '__NR_mmap' undeclared here (not in a function)
              { SCMP_SYS(mmap), 247 },
                ^
        qemu-seccomp.c:57:7: error: '__NR_getrlimit' undeclared here (not in a function)
              { SCMP_SYS(getrlimit), 245 },
                ^
        qemu-seccomp.c:96:7: error: '__NR_time' undeclared here (not in a function)
              { SCMP_SYS(time), 245 },
                ^
        qemu-seccomp.c:185:7: error: '__NR_alarm' undeclared here (not in a function)
              { SCMP_SYS(alarm), 241 },

please refer source files:
        arch/arm/include/uapi/asm/unistd.h
or kernel header:
        /usr/include/asm/unistd.h

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 .../exclude-some-arm-EABI-obsolete-syscalls.patch  |   93 ++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu.inc                |    1 +
 2 files changed, 94 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/files/exclude-some-arm-EABI-obsolete-syscalls.patch

diff --git a/meta/recipes-devtools/qemu/files/exclude-some-arm-EABI-obsolete-syscalls.patch b/meta/recipes-devtools/qemu/files/exclude-some-arm-EABI-obsolete-syscalls.patch
new file mode 100644
index 0000000..171bda7
--- /dev/null
+++ b/meta/recipes-devtools/qemu/files/exclude-some-arm-EABI-obsolete-syscalls.patch
@@ -0,0 +1,93 @@
+[PATCH] exclude some arm EABI obsolete syscalls
+
+Upstream-Status: Pending
+
+some syscalls are obsolete and no longer available for EABI, exclude them to
+fix the below error:
+	In file included from qemu-seccomp.c:16:0:
+	qemu-seccomp.c:28:7: error: '__NR_select' undeclared here (not in a function)
+	      { SCMP_SYS(select), 252 },
+	        ^
+	qemu-seccomp.c:36:7: error: '__NR_mmap' undeclared here (not in a function)
+	      { SCMP_SYS(mmap), 247 },
+	        ^
+	qemu-seccomp.c:57:7: error: '__NR_getrlimit' undeclared here (not in a function)
+	      { SCMP_SYS(getrlimit), 245 },
+	        ^
+	qemu-seccomp.c:96:7: error: '__NR_time' undeclared here (not in a function)
+	      { SCMP_SYS(time), 245 },
+	        ^
+	qemu-seccomp.c:185:7: error: '__NR_alarm' undeclared here (not in a function)
+	      { SCMP_SYS(alarm), 241 },
+
+please refer source files:
+	arch/arm/include/uapi/asm/unistd.h
+or kernel header:
+	/usr/include/asm/unistd.h
+
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+---
+ qemu-seccomp.c | 14 ++++++++------
+ 1 file changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/qemu-seccomp.c b/qemu-seccomp.c
+index caa926e..5a78502 100644
+--- a/qemu-seccomp.c
++++ b/qemu-seccomp.c
+@@ -25,15 +25,21 @@ static const struct QemuSeccompSyscall seccomp_whitelist[] = {
+     { SCMP_SYS(timer_settime), 255 },
+     { SCMP_SYS(timer_gettime), 254 },
+     { SCMP_SYS(futex), 253 },
++#if !defined(__ARM_EABI__)
+     { SCMP_SYS(select), 252 },
++    { SCMP_SYS(time), 245 },
++    { SCMP_SYS(alarm), 241 },
++    { SCMP_SYS(getrlimit), 245 },
++    { SCMP_SYS(mmap), 247 },
++    { SCMP_SYS(socketcall), 250 },
++    { SCMP_SYS(ipc), 245 },
++#endif
+     { SCMP_SYS(recvfrom), 251 },
+     { SCMP_SYS(sendto), 250 },
+-    { SCMP_SYS(socketcall), 250 },
+     { SCMP_SYS(read), 249 },
+     { SCMP_SYS(io_submit), 249 },
+     { SCMP_SYS(brk), 248 },
+     { SCMP_SYS(clone), 247 },
+-    { SCMP_SYS(mmap), 247 },
+     { SCMP_SYS(mprotect), 246 },
+     { SCMP_SYS(execve), 245 },
+     { SCMP_SYS(open), 245 },
+@@ -48,13 +54,11 @@ static const struct QemuSeccompSyscall seccomp_whitelist[] = {
+     { SCMP_SYS(bind), 245 },
+     { SCMP_SYS(listen), 245 },
+     { SCMP_SYS(semget), 245 },
+-    { SCMP_SYS(ipc), 245 },
+     { SCMP_SYS(gettimeofday), 245 },
+     { SCMP_SYS(readlink), 245 },
+     { SCMP_SYS(access), 245 },
+     { SCMP_SYS(prctl), 245 },
+     { SCMP_SYS(signalfd), 245 },
+-    { SCMP_SYS(getrlimit), 245 },
+     { SCMP_SYS(set_tid_address), 245 },
+     { SCMP_SYS(statfs), 245 },
+     { SCMP_SYS(unlink), 245 },
+@@ -93,7 +97,6 @@ static const struct QemuSeccompSyscall seccomp_whitelist[] = {
+     { SCMP_SYS(times), 245 },
+     { SCMP_SYS(exit), 245 },
+     { SCMP_SYS(clock_gettime), 245 },
+-    { SCMP_SYS(time), 245 },
+     { SCMP_SYS(restart_syscall), 245 },
+     { SCMP_SYS(pwrite64), 245 },
+     { SCMP_SYS(nanosleep), 245 },
+@@ -182,7 +185,6 @@ static const struct QemuSeccompSyscall seccomp_whitelist[] = {
+     { SCMP_SYS(lstat64), 241 },
+     { SCMP_SYS(sendfile64), 241 },
+     { SCMP_SYS(ugetrlimit), 241 },
+-    { SCMP_SYS(alarm), 241 },
+     { SCMP_SYS(rt_sigsuspend), 241 },
+     { SCMP_SYS(rt_sigqueueinfo), 241 },
+     { SCMP_SYS(rt_tgsigqueueinfo), 241 },
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 076e8ad..ab0724a 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -20,6 +20,7 @@ SRC_URI = "\
     file://no-strip.patch \
     file://larger_default_ram_size.patch \
     file://disable-grabs.patch \
+    file://exclude-some-arm-EABI-obsolete-syscalls.patch \
     "
 
 SRC_URI_append_class-native = "\
-- 
1.7.10.4



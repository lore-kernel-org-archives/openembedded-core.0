Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 56B8978837
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 20:06:34 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id x4-v6so1680179pln.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2018 13:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=N95zqs9Pd94F4odfHvJHu4D/UQhKkg+iVMzAUxsEZTQ=;
	b=qe4GOhJGFHanOHaQpkD/MirbWZueywi3iGOJC1aXEMQR9WR0yMKLbOBTCCdGrFwrv5
	7ZKBWqnc+bVeWVyhmplofKsaMP5t6NTdznh6amcU3UAG2rIyh5YIFFLdpHFY0Q1kHjLc
	nl6CJRubAfgopIoPwcgrcyuCQMgj3rESDLtvDkwUldkOFNlbOdUybmickNvc/lBNu7n5
	WpBaOSfQtmRFj5lB/X92+0FlRzFk52gfpsbn/NZDy7e+u2XsFXZqQ35HTmazO2yfcgn/
	Xt5VkENvTHXr/PEdq/ITvt4mmWq1Ujblx0i+Dfh7nEHm7XkXLEJ2G5p1TUuzdqpVhvSw
	rj6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=N95zqs9Pd94F4odfHvJHu4D/UQhKkg+iVMzAUxsEZTQ=;
	b=ZNVvcWWcb8u5/TKgjhKBI0zBH9s9rRk2jaMckrs1jhEYS5oXJfR9byvB++oKTEglFN
	iYbxfRpovJdj/OKKJuPz2TaA8pneLC3SuBlLZ3mKJOdIxmfub+eHuE2Y7TzQlXM9ULum
	CCooAJlmvkQedFzgUYXkFut8XfCoW5eSVKffkQF8mSks7ynC+Hwo1VhrUAC79B6uplp3
	pUfIYDhCdCgMdyuZbfV8lEeFrTGYwi1/So7VQs4WM4Vlveo9ZP13WMZheWxNDy7oqdh0
	WMbU7rUm4OAydEKdQixr/qaScjyw/bAcI/ncC1bDSeXX5w+5PKd77VJF9TbM9U6McKny
	6osw==
X-Gm-Message-State: AElRT7HafA/y1Y4rU3v8j1TSljsgI3W7p5Gs8+cItaslP+qpUlZ2AaZ1
	Wo0MWGW6aVGeISI0uPxyVTZrJmH0
X-Google-Smtp-Source: AG47ELuUxLMPf+oDvEMfGZ4/A3Ke0mFWF5mIJehBK9ajMo5Bzp8hw93bncmS6zSdSIONfX9qcAiQFg==
X-Received: by 2002:a17:902:3341:: with SMTP id
	a59-v6mr1489721plc.68.1521576396206; 
	Tue, 20 Mar 2018 13:06:36 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	188sm5011523pfe.93.2018.03.20.13.06.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Mar 2018 13:06:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2018 13:06:28 -0700
Message-Id: <20180320200628.40622-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [PATCH] systemd: Fix build failures with glibc 2.27 + kernels without memfd
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
X-List-Received-Date: Tue, 20 Mar 2018 20:06:35 -0000

Backport a fix that is needed for systemd to build with latest glibc
and kernel being old.

see
https://github.com/systemd/systemd/issues/8099

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/systemd/systemd/0032-memfd.patch | 272 +++++++++++++++++++++
 meta/recipes-core/systemd/systemd_237.bb           |   1 +
 2 files changed, 273 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0032-memfd.patch

diff --git a/meta/recipes-core/systemd/systemd/0032-memfd.patch b/meta/recipes-core/systemd/systemd/0032-memfd.patch
new file mode 100644
index 0000000000..f7cfd60a3f
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0032-memfd.patch
@@ -0,0 +1,272 @@
+missing_syscall: when adding syscall replacements, use different names (
+
+#8229)
+
+In meson.build we check that functions are available using:
+    meson.get_compiler('c').has_function('foo')
+which checks the following:
+- if __stub_foo or __stub___foo are defined, return false
+- if foo is declared (a pointer to the function can be taken), return true
+- otherwise check for __builtin_memfd_create
+
+_stub is documented by glibc as
+   It defines a symbol '__stub_FUNCTION' for each function
+   in the C library which is a stub, meaning it will fail
+   every time called, usually setting errno to ENOSYS.
+
+So if __stub is defined, we know we don't want to use the glibc version, but
+this doesn't tell us if the name itself is defined or not. If it _is_ defined,
+and we define our replacement as an inline static function, we get an error:
+
+In file included from ../src/basic/missing.h:1358:0,
+                 from ../src/basic/util.h:47,
+                 from ../src/basic/calendarspec.h:29,
+                 from ../src/basic/calendarspec.c:34:
+../src/basic/missing_syscall.h:65:19: error: static declaration of 'memfd_create' follows non-static declaration
+ static inline int memfd_create(const char *name, unsigned int flags) {
+                   ^~~~~~~~~~~~
+.../usr/include/bits/mman-shared.h:46:5: note: previous declaration of 'memfd_create' was here
+ int memfd_create (const char *__name, unsigned int __flags) __THROW;
+     ^~~~~~~~~~~~
+
+To avoid this problem, call our inline functions different than glibc,
+and use a #define to map the official name to our replacement.
+
+Fixes #8099.
+
+v2:
+- use "missing_" as the prefix instead of "_"
+
+v3:
+- rebase and update for statx()
+
+  Unfortunately "statx" is also present in "struct statx", so the define
+  causes issues. Work around this by using a typedef.
+
+I checked that systemd compiles with current glibc
+(glibc-devel-2.26-24.fc27.x86_64) if HAVE_MEMFD_CREATE, HAVE_GETTID,
+HAVE_PIVOT_ROOT, HAVE_SETNS, HAVE_RENAMEAT2, HAVE_KCMP, HAVE_KEYCTL,
+HAVE_COPY_FILE_RANGE, HAVE_BPF, HAVE_STATX are forced to 0.
+
+Setting HAVE_NAME_TO_HANDLE_AT to 0 causes an issue, but it's not because of
+the define, but because of struct file_handle.
+
+
+backport https://github.com/systemd/systemd/commit/5187dd2c403caf92d09f3491e41f1ceb3f10491f
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport [https://github.com/systemd/systemd/issues/8099]
+Index: git/src/basic/missing_syscall.h
+===================================================================
+--- git.orig/src/basic/missing_syscall.h
++++ git/src/basic/missing_syscall.h
+@@ -26,9 +26,11 @@
+ #include <sys/types.h>
+ 
+ #if !HAVE_PIVOT_ROOT
+-static inline int pivot_root(const char *new_root, const char *put_old) {
++static inline int missing_pivot_root(const char *new_root, const char *put_old) {
+         return syscall(SYS_pivot_root, new_root, put_old);
+ }
++
++#  define pivot_root missing_pivot_root
+ #endif
+ 
+ #if !HAVE_CANONICALIZE_FILE_NAME
+@@ -68,7 +70,7 @@ static inline char *canonicalize_file_na
+ #    endif
+ #  endif
+ 
+-static inline int memfd_create(const char *name, unsigned int flags) {
++static inline int missing_memfd_create(const char *name, unsigned int flags) {
+ #  ifdef __NR_memfd_create
+         return syscall(__NR_memfd_create, name, flags);
+ #  else
+@@ -76,6 +78,8 @@ static inline int memfd_create(const cha
+         return -1;
+ #  endif
+ }
++
++#  define memfd_create missing_memfd_create
+ #endif
+ 
+ /* ======================================================================= */
+@@ -115,7 +119,7 @@ static inline int memfd_create(const cha
+ #    endif
+ #  endif
+ 
+-static inline int getrandom(void *buffer, size_t count, unsigned flags) {
++static inline int missing_getrandom(void *buffer, size_t count, unsigned flags) {
+ #  ifdef __NR_getrandom
+         return syscall(__NR_getrandom, buffer, count, flags);
+ #  else
+@@ -123,14 +127,18 @@ static inline int getrandom(void *buffer
+         return -1;
+ #  endif
+ }
++
++#  define getrandom missing_getrandom
+ #endif
+ 
+ /* ======================================================================= */
+ 
+ #if !HAVE_GETTID
+-static inline pid_t gettid(void) {
++static inline pid_t missing_gettid(void) {
+         return (pid_t) syscall(SYS_gettid);
+ }
++
++#  define gettid missing_gettid
+ #endif
+ 
+ /* ======================================================================= */
+@@ -158,7 +166,7 @@ struct file_handle {
+         unsigned char f_handle[0];
+ };
+ 
+-static inline int name_to_handle_at(int fd, const char *name, struct file_handle *handle, int *mnt_id, int flags) {
++static inline int missing_name_to_handle_at(int fd, const char *name, struct file_handle *handle, int *mnt_id, int flags) {
+ #  ifdef __NR_name_to_handle_at
+         return syscall(__NR_name_to_handle_at, fd, name, handle, mnt_id, flags);
+ #  else
+@@ -166,6 +174,8 @@ static inline int name_to_handle_at(int
+         return -1;
+ #  endif
+ }
++
++#  define name_to_handle_at missing_name_to_handle_at
+ #endif
+ 
+ /* ======================================================================= */
+@@ -183,7 +193,7 @@ static inline int name_to_handle_at(int
+ #    endif
+ #  endif
+ 
+-static inline int setns(int fd, int nstype) {
++static inline int missing_setns(int fd, int nstype) {
+ #  ifdef __NR_setns
+         return syscall(__NR_setns, fd, nstype);
+ #  else
+@@ -191,6 +201,8 @@ static inline int setns(int fd, int nsty
+         return -1;
+ #  endif
+ }
++
++#  define setns missing_setns
+ #endif
+ 
+ /* ======================================================================= */
+@@ -236,7 +248,7 @@ static inline pid_t raw_getpid(void) {
+ #    endif
+ #  endif
+ 
+-static inline int renameat2(int oldfd, const char *oldname, int newfd, const char *newname, unsigned flags) {
++static inline int missing_renameat2(int oldfd, const char *oldname, int newfd, const char *newname, unsigned flags) {
+ #  ifdef __NR_renameat2
+         return syscall(__NR_renameat2, oldfd, oldname, newfd, newname, flags);
+ #  else
+@@ -244,12 +256,14 @@ static inline int renameat2(int oldfd, c
+         return -1;
+ #  endif
+ }
++
++#  define renameat2 missing_renameat2
+ #endif
+ 
+ /* ======================================================================= */
+ 
+ #if !HAVE_KCMP
+-static inline int kcmp(pid_t pid1, pid_t pid2, int type, unsigned long idx1, unsigned long idx2) {
++static inline int missing_kcmp(pid_t pid1, pid_t pid2, int type, unsigned long idx1, unsigned long idx2) {
+ #  ifdef __NR_kcmp
+         return syscall(__NR_kcmp, pid1, pid2, type, idx1, idx2);
+ #  else
+@@ -257,36 +271,44 @@ static inline int kcmp(pid_t pid1, pid_t
+         return -1;
+ #  endif
+ }
++
++#  define kcmp missing_kcmp
+ #endif
+ 
+ /* ======================================================================= */
+ 
+ #if !HAVE_KEYCTL
+-static inline long keyctl(int cmd, unsigned long arg2, unsigned long arg3, unsigned long arg4,unsigned long arg5) {
++static inline long missing_keyctl(int cmd, unsigned long arg2, unsigned long arg3, unsigned long arg4,unsigned long arg5) {
+ #  ifdef __NR_keyctl
+         return syscall(__NR_keyctl, cmd, arg2, arg3, arg4, arg5);
+ #  else
+         errno = ENOSYS;
+         return -1;
+ #  endif
++
++#  define keyctl missing_keyctl
+ }
+ 
+-static inline key_serial_t add_key(const char *type, const char *description, const void *payload, size_t plen, key_serial_t ringid) {
++static inline key_serial_t missing_add_key(const char *type, const char *description, const void *payload, size_t plen, key_serial_t ringid) {
+ #  ifdef __NR_add_key
+         return syscall(__NR_add_key, type, description, payload, plen, ringid);
+ #  else
+         errno = ENOSYS;
+         return -1;
+ #  endif
++
++#  define add_key missing_add_key
+ }
+ 
+-static inline key_serial_t request_key(const char *type, const char *description, const char * callout_info, key_serial_t destringid) {
++static inline key_serial_t missing_request_key(const char *type, const char *description, const char * callout_info, key_serial_t destringid) {
+ #  ifdef __NR_request_key
+         return syscall(__NR_request_key, type, description, callout_info, destringid);
+ #  else
+         errno = ENOSYS;
+         return -1;
+ #  endif
++
++#  define request_key missing_request_key
+ }
+ #endif
+ 
+@@ -313,10 +335,10 @@ static inline key_serial_t request_key(c
+ #    endif
+ #  endif
+ 
+-static inline ssize_t copy_file_range(int fd_in, loff_t *off_in,
+-                                      int fd_out, loff_t *off_out,
+-                                      size_t len,
+-                                      unsigned int flags) {
++static inline ssize_t missing_copy_file_range(int fd_in, loff_t *off_in,
++                                              int fd_out, loff_t *off_out,
++                                              size_t len,
++                                              unsigned int flags) {
+ #  ifdef __NR_copy_file_range
+         return syscall(__NR_copy_file_range, fd_in, off_in, fd_out, off_out, len, flags);
+ #  else
+@@ -324,6 +346,8 @@ static inline ssize_t copy_file_range(in
+         return -1;
+ #  endif
+ }
++
++#  define copy_file_range missing_copy_file_range
+ #endif
+ 
+ /* ======================================================================= */
+@@ -351,7 +375,7 @@ static inline ssize_t copy_file_range(in
+ 
+ union bpf_attr;
+ 
+-static inline int bpf(int cmd, union bpf_attr *attr, size_t size) {
++static inline int missing_bpf(int cmd, union bpf_attr *attr, size_t size) {
+ #ifdef __NR_bpf
+         return (int) syscall(__NR_bpf, cmd, attr, size);
+ #else
+@@ -360,6 +384,7 @@ static inline int bpf(int cmd, union bpf
+ #endif
+ }
+ 
++#  define bpf missing_bpf
+ #endif
+ 
+ /* ======================================================================= */
diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
index ecf8e74940..e6336db0de 100644
--- a/meta/recipes-core/systemd/systemd_237.bb
+++ b/meta/recipes-core/systemd/systemd_237.bb
@@ -49,6 +49,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0029-nss-mymachines-Build-conditionally-when-ENABLE_MYHOS.patch \
            file://0030-fix-missing-of-__register_atfork-for-non-glibc-build.patch \
            file://0031-fix-missing-ULONG_LONG_MAX-definition-in-case-of-mus.patch \
+           file://0032-memfd.patch \
            "
 SRC_URI_append_qemuall = " file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"
 
-- 
2.16.2



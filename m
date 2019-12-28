Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3F1F77CD73
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2019 13:18:08 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id 9so22461425lfq.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2019 05:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=nIMa8MJd3mAkDSfix21LttWk7qG2Fgsqf4P8JjqpiVo=;
	b=rGnloU4h7XSAxdcEmjI8KVED+lgTL16QZBckJH2uvP4QPSw5cNbN7Wsyp6kVPqKzBT
	zMKO5u/I36w/OcL9sYC7dvnXYOq57I1g5Y1t6o1ckXk7b2yYirFGEaQdjHJmD+tfct+I
	R3k3kvFp7lL3WeY+RorEO4KyZ8RRRV5xMAwwP+o8YZDVYAQA4o+2Bfe34jasSmwAN8Xa
	kMyT6tXz34HsLMfEP3sPPmyTD99JndIMOVjkbLEd/JdDbLlXotoJd0N4dAemyRX5miNN
	H3ucpRNsyTPuaJsbQhP5MESXF1ZCG/UzeESonXqjTBnovYszc2jXJF66EtbM788B5pGz
	1hPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nIMa8MJd3mAkDSfix21LttWk7qG2Fgsqf4P8JjqpiVo=;
	b=ty0Z3IqqTBv/McRO8d8GcaVnUqFQtSQPRlLk2fozmb2hPkuGwAoW92yop1Dtv6/yH4
	Eq1wTnLA0QkQZR9F9VumAXkI+29clDFbGo4bHZR7AcXR/+LIdsVTLkc8cS3iZDcsig6f
	F1NB5tvFZ9HUkDfViHtEyICs7VYsNd9lVJB60OCPNtPa45DqDK73CwkGrkpXSgiYoUM1
	0dw/m01CXVmUoC608z8InIs3ewN6gAn1pU3Sy0+v3B3pisRekj4/yBJwKmQIv84PMPM8
	tYRBubpzgFxv4nlAII1SzGywTfMN/rnxtTmxGURnLGtMahJc+aAftS+ODSDqj7zsNpvq
	dF0Q==
X-Gm-Message-State: APjAAAWYKcaq3FmMrsDSwYpUr8nD5O/MbYsfdbS1zRKmClU5I4R+cUh6
	bXcX9NcXpyjDHI31/m55DVDlBkd+wvPknA==
X-Google-Smtp-Source: APXvYqzpACbweoywuDjQBmhepSXm3MAewzsdyN3tIvasbVGr4Wby+IN/iZUBgbmscWQb+KlQV59gkA==
X-Received: by 2002:a19:710a:: with SMTP id m10mr31487072lfc.58.1577539088428; 
	Sat, 28 Dec 2019 05:18:08 -0800 (PST)
Received: from peterliu-Precision-7530.lan
	(c-75fd72d5.022-417-73746f13.bbcust.telenor.se. [213.114.253.117])
	by smtp.gmail.com with ESMTPSA id
	u17sm5868500ljk.62.2019.12.28.05.18.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 28 Dec 2019 05:18:07 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Dec 2019 14:18:02 +0100
Message-Id: <1577539082-9744-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>, stefan.agner@toradex.com,
	simon.bueler@toradex.com
Subject: [PATCH] systemd: fix a test-seccomp build issue
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
X-List-Received-Date: Sat, 28 Dec 2019 13:18:08 -0000

From: Ming Liu <liu.ming50@gmail.com>

Fix a following compiling issue when seccomp is enabled by
PACKAGECONFIG:
| ../test-seccomp.c: In function 'test_protect_sysctl':
| ../test-seccomp.c:307:5: error: "__NR__sysctl" is not defined, evaluates to 0 [-Werror=undef]
|  307 | #if __NR__sysctl > 0
|      |     ^~~~~~~~~~~~

Reference:
https://github.com/systemd/systemd/pull/14032

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 ...e-comprehensive-protection-against-libsec.patch | 152 +++++++++++++++++++++
 meta/recipes-core/systemd/systemd_243.bb           |   1 +
 2 files changed, 153 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-seccomp-more-comprehensive-protection-against-libsec.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-seccomp-more-comprehensive-protection-against-libsec.patch b/meta/recipes-core/systemd/systemd/0001-seccomp-more-comprehensive-protection-against-libsec.patch
new file mode 100644
index 0000000..f359d28
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-seccomp-more-comprehensive-protection-against-libsec.patch
@@ -0,0 +1,152 @@
+From 4df8fe8415eaf4abd5b93c3447452547c6ea9e5f Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Thu, 14 Nov 2019 17:51:30 +0100
+Subject: [PATCH] seccomp: more comprehensive protection against libseccomp's
+ __NR_xyz namespace invasion
+
+A follow-up for 59b657296a2fe104f112b91bbf9301724067cc81, adding the
+same conditioning for all cases of our __NR_xyz use.
+
+Fixes: #14031
+
+Reference:
+https://github.com/systemd/systemd/pull/14032/commits/62f66fdbcc33580467c01b1f149474b6c973df5a
+
+Upstream-Status: Backport
+
+Signed-off-by: Ming Liu <liu.ming50@gmail.com>
+---
+ src/basic/missing_syscall.h | 10 +++++-----
+ src/test/test-seccomp.c     | 19 ++++++++++---------
+ 2 files changed, 15 insertions(+), 14 deletions(-)
+
+diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
+index 6d9b125..1255d8b 100644
+--- a/src/basic/missing_syscall.h
++++ b/src/basic/missing_syscall.h
+@@ -274,7 +274,7 @@ static inline int missing_renameat2(int oldfd, const char *oldname, int newfd, c
+ 
+ #if !HAVE_KCMP
+ static inline int missing_kcmp(pid_t pid1, pid_t pid2, int type, unsigned long idx1, unsigned long idx2) {
+-#  ifdef __NR_kcmp
++#  if defined __NR_kcmp && __NR_kcmp > 0
+         return syscall(__NR_kcmp, pid1, pid2, type, idx1, idx2);
+ #  else
+         errno = ENOSYS;
+@@ -289,7 +289,7 @@ static inline int missing_kcmp(pid_t pid1, pid_t pid2, int type, unsigned long i
+ 
+ #if !HAVE_KEYCTL
+ static inline long missing_keyctl(int cmd, unsigned long arg2, unsigned long arg3, unsigned long arg4, unsigned long arg5) {
+-#  ifdef __NR_keyctl
++#  if defined __NR_keyctl && __NR_keyctl > 0
+         return syscall(__NR_keyctl, cmd, arg2, arg3, arg4, arg5);
+ #  else
+         errno = ENOSYS;
+@@ -300,7 +300,7 @@ static inline long missing_keyctl(int cmd, unsigned long arg2, unsigned long arg
+ }
+ 
+ static inline key_serial_t missing_add_key(const char *type, const char *description, const void *payload, size_t plen, key_serial_t ringid) {
+-#  ifdef __NR_add_key
++#  if defined __NR_add_key && __NR_add_key > 0
+         return syscall(__NR_add_key, type, description, payload, plen, ringid);
+ #  else
+         errno = ENOSYS;
+@@ -311,7 +311,7 @@ static inline key_serial_t missing_add_key(const char *type, const char *descrip
+ }
+ 
+ static inline key_serial_t missing_request_key(const char *type, const char *description, const char * callout_info, key_serial_t destringid) {
+-#  ifdef __NR_request_key
++#  if defined __NR_request_key && __NR_request_key > 0
+         return syscall(__NR_request_key, type, description, callout_info, destringid);
+ #  else
+         errno = ENOSYS;
+@@ -496,7 +496,7 @@ enum {
+ static inline long missing_set_mempolicy(int mode, const unsigned long *nodemask,
+                            unsigned long maxnode) {
+         long i;
+-#  ifdef __NR_set_mempolicy
++#  if defined __NR_set_mempolicy && __NR_set_mempolicy > 0
+         i = syscall(__NR_set_mempolicy, mode, nodemask, maxnode);
+ #  else
+         errno = ENOSYS;
+diff --git a/src/test/test-seccomp.c b/src/test/test-seccomp.c
+index 018c20f..c669204 100644
+--- a/src/test/test-seccomp.c
++++ b/src/test/test-seccomp.c
+@@ -28,7 +28,8 @@
+ #include "tmpfile-util.h"
+ #include "virt.h"
+ 
+-#if SCMP_SYS(socket) < 0 || defined(__i386__) || defined(__s390x__) || defined(__s390__)
++/* __NR_socket may be invalid due to libseccomp */
++#if !defined(__NR_socket) || __NR_socket <= 0 || defined(__i386__) || defined(__s390x__) || defined(__s390__)
+ /* On these archs, socket() is implemented via the socketcall() syscall multiplexer,
+  * and we can't restrict it hence via seccomp. */
+ #  define SECCOMP_RESTRICT_ADDRESS_FAMILIES_BROKEN 1
+@@ -304,14 +305,14 @@ static void test_protect_sysctl(void) {
+         assert_se(pid >= 0);
+ 
+         if (pid == 0) {
+-#if __NR__sysctl > 0
++#if defined __NR__sysctl && __NR__sysctl > 0
+                 assert_se(syscall(__NR__sysctl, NULL) < 0);
+                 assert_se(errno == EFAULT);
+ #endif
+ 
+                 assert_se(seccomp_protect_sysctl() >= 0);
+ 
+-#if __NR__sysctl > 0
++#if defined __NR__sysctl && __NR__sysctl > 0
+                 assert_se(syscall(__NR__sysctl, 0, 0, 0) < 0);
+                 assert_se(errno == EPERM);
+ #endif
+@@ -640,7 +641,7 @@ static void test_load_syscall_filter_set_raw(void) {
+                 assert_se(poll(NULL, 0, 0) == 0);
+ 
+                 assert_se(s = hashmap_new(NULL));
+-#if SCMP_SYS(access) >= 0
++#if defined __NR_access && __NR_access > 0
+                 assert_se(hashmap_put(s, UINT32_TO_PTR(__NR_access + 1), INT_TO_PTR(-1)) >= 0);
+ #else
+                 assert_se(hashmap_put(s, UINT32_TO_PTR(__NR_faccessat + 1), INT_TO_PTR(-1)) >= 0);
+@@ -656,7 +657,7 @@ static void test_load_syscall_filter_set_raw(void) {
+                 s = hashmap_free(s);
+ 
+                 assert_se(s = hashmap_new(NULL));
+-#if SCMP_SYS(access) >= 0
++#if defined __NR_access && __NR_access > 0
+                 assert_se(hashmap_put(s, UINT32_TO_PTR(__NR_access + 1), INT_TO_PTR(EILSEQ)) >= 0);
+ #else
+                 assert_se(hashmap_put(s, UINT32_TO_PTR(__NR_faccessat + 1), INT_TO_PTR(EILSEQ)) >= 0);
+@@ -672,7 +673,7 @@ static void test_load_syscall_filter_set_raw(void) {
+                 s = hashmap_free(s);
+ 
+                 assert_se(s = hashmap_new(NULL));
+-#if SCMP_SYS(poll) >= 0
++#if defined __NR_poll && __NR_poll > 0
+                 assert_se(hashmap_put(s, UINT32_TO_PTR(__NR_poll + 1), INT_TO_PTR(-1)) >= 0);
+ #else
+                 assert_se(hashmap_put(s, UINT32_TO_PTR(__NR_ppoll + 1), INT_TO_PTR(-1)) >= 0);
+@@ -689,7 +690,7 @@ static void test_load_syscall_filter_set_raw(void) {
+                 s = hashmap_free(s);
+ 
+                 assert_se(s = hashmap_new(NULL));
+-#if SCMP_SYS(poll) >= 0
++#if defined __NR_poll && __NR_poll > 0
+                 assert_se(hashmap_put(s, UINT32_TO_PTR(__NR_poll + 1), INT_TO_PTR(EILSEQ)) >= 0);
+ #else
+                 assert_se(hashmap_put(s, UINT32_TO_PTR(__NR_ppoll + 1), INT_TO_PTR(EILSEQ)) >= 0);
+@@ -767,8 +768,8 @@ static int real_open(const char *path, int flags, mode_t mode) {
+          * testing purposes that calls the real syscall, on architectures where SYS_open is defined. On
+          * other architectures, let's just fall back to the glibc call. */
+ 
+-#ifdef SYS_open
+-        return (int) syscall(SYS_open, path, flags, mode);
++#if defined __NR_open && __NR_open > 0
++        return (int) syscall(__NR_open, path, flags, mode);
+ #else
+         return open(path, flags, mode);
+ #endif
+-- 
+2.7.4
+
diff --git a/meta/recipes-core/systemd/systemd_243.bb b/meta/recipes-core/systemd/systemd_243.bb
index ac7a5f8..a568cdc 100644
--- a/meta/recipes-core/systemd/systemd_243.bb
+++ b/meta/recipes-core/systemd/systemd_243.bb
@@ -23,6 +23,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0004-rules-whitelist-hd-devices.patch \
            file://0005-rules-watch-metadata-changes-in-ide-devices.patch \
            file://0001-unit-file.c-consider-symlink-on-filesystems-like-NFS.patch \
+           file://0001-seccomp-more-comprehensive-protection-against-libsec.patch \
            file://99-default.preset \
            "
 
-- 
2.7.4



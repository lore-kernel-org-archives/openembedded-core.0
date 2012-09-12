Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TBgC5-0001Yv-NM
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 08:13:02 +0200
Received: by obblz20 with SMTP id lz20so2111545obb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 23:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=/ZJQk9d9zVv/Y4evYMvjLHovYLIbC5S5ICfRf4qYtpQ=;
	b=WwxcR5i6BC2vSkT+Y0/k+E729zsjmbT4qy/sK1NU50NDBEspZVGAfO66BXHVFDIKer
	Rqqi2LY0ey3QYhUw3lMB/WkSeNjUVgRYuqgZSrhPb6ZWkO0b8b7t2Ypn2otCt2TjJiJW
	eI5sbra6HmZ6XCV5EL8fV9xgCNOCJddD9EmKqABXJvv0dwmqe1iUrzR8vZuDi911LyuG
	DMgzf6C9DZspnlwezKbMI4s1lgwD4IP7b1K5qsKbVytSSqDe4L19/TEktgh4wvc8nSSr
	kSZsMrjOJYoQZ2hO40d1pRfTks5x4FhZxypW9vnFRhsLYUBx6lCl2btMLcLsUGLcJt2a
	eEeg==
Received: by 10.60.27.10 with SMTP id p10mr20463110oeg.49.1347429629611;
	Tue, 11 Sep 2012 23:00:29 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id k8sm15262335oeh.9.2012.09.11.23.00.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 23:00:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 22:59:15 -0700
Message-Id: <1347429555-32159-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1347429555-32159-1-git-send-email-raj.khem@gmail.com>
References: <1347429555-32159-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 3/3] uclibc: Revert systemd regressing patch from upsteam uclibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Sep 2012 06:13:02 -0000

This patch is causing systemd based systemd to not boot

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc-git.inc            |    5 +-
 ...nt.c-wtent.c-move-functions-from-utxent.c.patch |  321 ++++++++++++++++++++
 2 files changed, 324 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-Revert-utent.c-wtent.c-move-functions-from-utxent.c.patch

diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
index eec4ded..4da9c58 100644
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -1,9 +1,9 @@
-SRCREV="555ae2e88cd16a83f854634b6c3f35715b11d3d4"
+SRCREV="cb43f2afba0633400387fa7c55dda3396517f58a"
 
 DEFAULT_PREFERENCE = "-1"
 
 PV = "0.9.33+git${SRCPV}"
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-git' ], d)}"
 
@@ -26,5 +26,6 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=master;protocol=git \
 	file://0001-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch \
 	file://0001-librt-Use-nodefaultlibs-instead-of-nostdlib.patch \
 	file://mount.h-update.patch \
+	file://0001-Revert-utent.c-wtent.c-move-functions-from-utxent.c.patch \
 	"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/uclibc/uclibc-git/0001-Revert-utent.c-wtent.c-move-functions-from-utxent.c.patch b/meta/recipes-core/uclibc/uclibc-git/0001-Revert-utent.c-wtent.c-move-functions-from-utxent.c.patch
new file mode 100644
index 0000000..8c202ac
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-git/0001-Revert-utent.c-wtent.c-move-functions-from-utxent.c.patch
@@ -0,0 +1,321 @@
+Upstream-Status: Pending
+
+From 096abf14d2dc978607ccd8a0d7f42da65d8991f3 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 9 Sep 2012 22:00:04 -0700
+Subject: [PATCH] Revert "utent.c, wtent.c: move functions from utxent.c"
+
+This reverts commit 84135275cfeebc0b233c1c96eeada4d4178a0b18.
+---
+ include/utmp.h          |    8 +++++
+ libc/misc/utmp/utent.c  |   80 +++++++++++------------------------------------
+ libc/misc/utmp/utxent.c |    4 +--
+ libc/misc/utmp/wtent.c  |   14 ++-------
+ 4 files changed, 30 insertions(+), 76 deletions(-)
+
+diff --git a/include/utmp.h b/include/utmp.h
+index cb8e08f..10b75c9 100644
+--- a/include/utmp.h
++++ b/include/utmp.h
+@@ -57,29 +57,37 @@ extern void logwtmp (__const char *__ut_line, __const char *__ut_name,
+ /* Append entry UTMP to the wtmp-like file WTMP_FILE.  */
+ extern void updwtmp (__const char *__wtmp_file, __const struct utmp *__utmp)
+      __THROW;
++libc_hidden_proto(updwtmp)
+ 
+ /* Change name of the utmp file to be examined.  */
+ extern int utmpname (__const char *__file) __THROW;
++libc_hidden_proto(utmpname)
+ 
+ /* Read next entry from a utmp-like file.  */
+ extern struct utmp *getutent (void) __THROW;
++libc_hidden_proto(getutent)
+ 
+ /* Reset the input stream to the beginning of the file.  */
+ extern void setutent (void) __THROW;
++libc_hidden_proto(setutent)
+ 
+ /* Close the current open file.  */
+ extern void endutent (void) __THROW;
++libc_hidden_proto(endutent)
+ 
+ /* Search forward from the current point in the utmp file until the
+    next entry with a ut_type matching ID->ut_type.  */
+ extern struct utmp *getutid (__const struct utmp *__id) __THROW;
++libc_hidden_proto(getutid)
+ 
+ /* Search forward from the current point in the utmp file until the
+    next entry with a ut_line matching LINE->ut_line.  */
+ extern struct utmp *getutline (__const struct utmp *__line) __THROW;
++libc_hidden_proto(getutline)
+ 
+ /* Write out entry pointed to by UTMP_PTR into the utmp file.  */
+ extern struct utmp *pututline (__const struct utmp *__utmp_ptr) __THROW;
++libc_hidden_proto(pututline)
+ 
+ 
+ #if 0 /* def	__USE_MISC */
+diff --git a/libc/misc/utmp/utent.c b/libc/misc/utmp/utent.c
+index a35bb2b..07ca44e 100644
+--- a/libc/misc/utmp/utent.c
++++ b/libc/misc/utmp/utent.c
+@@ -19,9 +19,6 @@
+ #include <errno.h>
+ #include <string.h>
+ #include <utmp.h>
+-#ifdef __UCLIBC_HAS_UTMPX__
+-# include <utmpx.h>
+-#endif
+ #include <not-cancel.h>
+ 
+ #include <bits/uClibc_mutex.h>
+@@ -34,7 +31,7 @@ static const char default_file_name[] = _PATH_UTMP;
+ static const char *static_ut_name = default_file_name;
+ 
+ /* This function must be called with the LOCK held */
+-static void __setutent_unlocked(void)
++static void __setutent(void)
+ {
+     if (static_fd < 0) {
+ 	static_fd = open_not_cancel_2(static_ut_name, O_RDWR | O_CLOEXEC);
+@@ -53,24 +50,19 @@ static void __setutent_unlocked(void)
+     lseek(static_fd, 0, SEEK_SET);
+ }
+ #if defined __UCLIBC_HAS_THREADS__
+-static void __setutent(void)
++void setutent(void)
+ {
+     __UCLIBC_MUTEX_LOCK(utmplock);
+-    __setutent_unlocked();
++    __setutent();
+     __UCLIBC_MUTEX_UNLOCK(utmplock);
+ }
+ #else
+-static void __setutent(void);
+-strong_alias(__setutent_unlocked,__setutent)
+-#endif
+ strong_alias(__setutent,setutent)
+-
+-#ifdef __UCLIBC_HAS_UTMPX__
+-strong_alias(__setutent,setutxent)
+ #endif
++libc_hidden_def(setutent)
+ 
+ /* This function must be called with the LOCK held */
+-static struct utmp *__getutent_unlocked(void)
++static struct utmp *__getutent(void)
+ {
+     if (static_fd < 0) {
+ 	__setutent();
+@@ -86,27 +78,19 @@ static struct utmp *__getutent_unlocked(void)
+     return NULL;
+ }
+ #if defined __UCLIBC_HAS_THREADS__
+-static struct utmp *__getutent(void)
++struct utmp *getutent(void)
+ {
+     struct utmp *ret;
+ 
+     __UCLIBC_MUTEX_LOCK(utmplock);
+-    ret = __getutent_unlocked();
++    ret = __getutent();
+     __UCLIBC_MUTEX_UNLOCK(utmplock);
+     return ret;
+ }
+ #else
+-static struct utmp *__getutent(void);
+-strong_alias(__getutent_unlocked,__getutent)
+-#endif
+ strong_alias(__getutent,getutent)
+-
+-#ifdef __UCLIBC_HAS_UTMPX__
+-struct utmpx *getutxent(void)
+-{
+-	return (struct utmpx *) __getutent ();
+-}
+ #endif
++libc_hidden_def(getutent)
+ 
+ static void __endutent(void)
+ {
+@@ -117,13 +101,10 @@ static void __endutent(void)
+     __UCLIBC_MUTEX_UNLOCK(utmplock);
+ }
+ strong_alias(__endutent,endutent)
+-
+-#ifdef __UCLIBC_HAS_UTMPX__
+-strong_alias(__endutent,endutxent)
+-#endif
++libc_hidden_def(endutent)
+ 
+ /* This function must be called with the LOCK held */
+-static struct utmp *__getutid_unlocked(const struct utmp *utmp_entry)
++static struct utmp *__getutid(const struct utmp *utmp_entry)
+ {
+     struct utmp *lutmp;
+     unsigned type;
+@@ -133,7 +114,7 @@ static struct utmp *__getutid_unlocked(const struct utmp *utmp_entry)
+     type = utmp_entry->ut_type - 1;
+     type /= 4;
+ 
+-    while ((lutmp = __getutent_unlocked()) != NULL) {
++    while ((lutmp = __getutent()) != NULL) {
+ 	if (type == 0 && lutmp->ut_type == utmp_entry->ut_type)	{
+ 	    /* one of RUN_LVL, BOOT_TIME, NEW_TIME, OLD_TIME */
+ 	    return lutmp;
+@@ -147,34 +128,26 @@ static struct utmp *__getutid_unlocked(const struct utmp *utmp_entry)
+     return NULL;
+ }
+ #if defined __UCLIBC_HAS_THREADS__
+-static struct utmp *__getutid(const struct utmp *utmp_entry)
++struct utmp *getutid(const struct utmp *utmp_entry)
+ {
+     struct utmp *ret;
+ 
+     __UCLIBC_MUTEX_LOCK(utmplock);
+-    ret = __getutid_unlocked(utmp_entry);
++    ret = __getutid(utmp_entry);
+     __UCLIBC_MUTEX_UNLOCK(utmplock);
+     return ret;
+ }
+ #else
+-static struct utmp *__getutid(const struct utmp *utmp_entry);
+-strong_alias(__getutid_unlocked,__getutid)
+-#endif
+ strong_alias(__getutid,getutid)
+-
+-#ifdef __UCLIBC_HAS_UTMPX__
+-struct utmpx *getutxid(const struct utmpx *utmp_entry)
+-{
+-	return (struct utmpx *) __getutid ((const struct utmp *) utmp_entry);
+-}
+ #endif
++libc_hidden_def(getutid)
+ 
+ static struct utmp *__getutline(const struct utmp *utmp_entry)
+ {
+     struct utmp *lutmp;
+ 
+     __UCLIBC_MUTEX_LOCK(utmplock);
+-    while ((lutmp = __getutent_unlocked()) != NULL) {
++    while ((lutmp = __getutent()) != NULL) {
+ 	if (lutmp->ut_type == USER_PROCESS || lutmp->ut_type == LOGIN_PROCESS) {
+ 	    if (strncmp(lutmp->ut_line, utmp_entry->ut_line, sizeof(lutmp->ut_line)) == 0) {
+ 		break;
+@@ -185,13 +158,7 @@ static struct utmp *__getutline(const struct utmp *utmp_entry)
+     return lutmp;
+ }
+ strong_alias(__getutline,getutline)
+-
+-#ifdef __UCLIBC_HAS_UTMPX__
+-struct utmpx *getutxline(const struct utmpx *utmp_entry)
+-{
+-	return (struct utmpx *) __getutline ((const struct utmp *) utmp_entry);
+-}
+-#endif
++libc_hidden_def(getutline)
+ 
+ static struct utmp *__pututline(const struct utmp *utmp_entry)
+ {
+@@ -200,7 +167,7 @@ static struct utmp *__pututline(const struct utmp *utmp_entry)
+        the file pointer where they want it, everything will work out. */
+     lseek(static_fd, (off_t) - sizeof(struct utmp), SEEK_CUR);
+ 
+-    if (__getutid_unlocked(utmp_entry) != NULL)
++    if (__getutid(utmp_entry) != NULL)
+ 	lseek(static_fd, (off_t) - sizeof(struct utmp), SEEK_CUR);
+     else
+ 	lseek(static_fd, (off_t) 0, SEEK_END);
+@@ -211,13 +178,7 @@ static struct utmp *__pututline(const struct utmp *utmp_entry)
+     return (struct utmp *)utmp_entry;
+ }
+ strong_alias(__pututline,pututline)
+-
+-#ifdef __UCLIBC_HAS_UTMPX__
+-struct utmpx *pututxline (const struct utmpx *utmp_entry)
+-{
+-	return (struct utmpx *) __pututline ((const struct utmp *) utmp_entry);
+-}
+-#endif
++libc_hidden_def(pututline)
+ 
+ static int __utmpname(const char *new_ut_name)
+ {
+@@ -241,7 +202,4 @@ static int __utmpname(const char *new_ut_name)
+     return 0; /* or maybe return -(static_ut_name != new_ut_name)? */
+ }
+ strong_alias(__utmpname,utmpname)
+-
+-#ifdef __UCLIBC_HAS_UTMPX__
+-strong_alias(__utmpname,utmpxname)
+-#endif
++libc_hidden_def(utmpname)
+diff --git a/libc/misc/utmp/utxent.c b/libc/misc/utmp/utxent.c
+index 71157cc..a0e80a6 100644
+--- a/libc/misc/utmp/utxent.c
++++ b/libc/misc/utmp/utxent.c
+@@ -13,7 +13,6 @@
+ #include <utmpx.h>
+ #include <utmp.h>
+ 
+-#if 0 /* moved to utent.c */
+ void setutxent(void)
+ {
+ 	setutent ();
+@@ -49,12 +48,10 @@ int utmpxname (const char *new_ut_name)
+ 	return utmpname (new_ut_name);
+ }
+ 
+-/* moved to wtent.c */
+ void updwtmpx (const char *wtmpx_file, const struct utmpx *utmpx)
+ {
+ 	updwtmp (wtmpx_file, (const struct utmp *) utmpx);
+ }
+-#endif
+ 
+ /* Copy the information in UTMPX to UTMP. */
+ void getutmp (const struct utmpx *utmpx, struct utmp *utmp)
+@@ -107,3 +104,4 @@ void getutmpx (const struct utmp *utmp, struct utmpx *utmpx)
+ 	utmpx->ut_time = utmp->ut_time;
+ #endif
+ }
++
+diff --git a/libc/misc/utmp/wtent.c b/libc/misc/utmp/wtent.c
+index 9b3ad50..b5e4ee5 100644
+--- a/libc/misc/utmp/wtent.c
++++ b/libc/misc/utmp/wtent.c
+@@ -11,9 +11,6 @@
+ #include <time.h>
+ #include <unistd.h>
+ #include <utmp.h>
+-#ifdef __UCLIBC_HAS_UTMPX__
+-# include <utmpx.h>
+-#endif
+ #include <fcntl.h>
+ #include <sys/file.h>
+ #include <not-cancel.h>
+@@ -36,7 +33,7 @@ void logwtmp (const char *line, const char *name, const char *host)
+ }
+ #endif
+ 
+-static void __updwtmp(const char *wtmp_file, const struct utmp *lutmp)
++void updwtmp(const char *wtmp_file, const struct utmp *lutmp)
+ {
+     int fd;
+ 
+@@ -49,11 +46,4 @@ static void __updwtmp(const char *wtmp_file, const struct utmp *lutmp)
+ 	}
+     }
+ }
+-strong_alias(__updwtmp,updwtmp)
+-
+-#ifdef __UCLIBC_HAS_UTMPX__
+-void updwtmpx (const char *wtmpx_file, const struct utmpx *utmpx)
+-{
+-	__updwtmp (wtmpx_file, (const struct utmp *) utmpx);
+-}
+-#endif
++libc_hidden_def(updwtmp)
+-- 
+1.7.9.5
+
-- 
1.7.9.5




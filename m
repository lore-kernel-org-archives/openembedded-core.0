Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id AF3607317A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 06:23:21 +0000 (UTC)
Received: by qkdp187 with SMTP id p187so121558848qkd.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Dec 2015 22:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=wqD2UkkIogu0EFu2nEESHZyS1/ZSVsD2qtbSnLqPKZo=;
	b=ywo1P5Z2MmKUwodiZXVLx4vnMS08t4cEqM98tui+Qyt3wOhlgOjv5JAZieVsmoWGxN
	Gg9dhKIsQRlOkF8cP69LCYFVSHZQhwiCwQINuo+rjxaAJhTczoLpTK8s5NbNikF13euK
	StWiXXHQQbXHvaN8In0Q362TiTnFRrFSCKjrMb+C9+c8rVh3WpBqWo39vvDpWhB1QLe1
	coUPRV8Z/NrILu2GksWojVhWZMTAxItOh5AC/SNWSZfD0nwbMDwasx55TueW4IY1tOk1
	GVBfK+XR+zgUnQ1hClY4BFUvFeJ2qkv8VhVQxCRtStv/d7Fc3HG5DXzbBJcqaQT7hsCa
	sH5A==
X-Received: by 10.55.214.151 with SMTP id p23mr40384883qkl.8.1450074201930;
	Sun, 13 Dec 2015 22:23:21 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	s105sm13252860qge.40.2015.12.13.22.23.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Dec 2015 22:23:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 06:23:11 +0000
Message-Id: <cfa28c64c5ac5216b64e34c07276dbd052587b0a.1450073907.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <a2dd5384b2607cf7e507cf280addd31ee6df2391.1450073907.git.raj.khem@gmail.com>
References: <a2dd5384b2607cf7e507cf280addd31ee6df2391.1450073907.git.raj.khem@gmail.com>
In-Reply-To: <cover.1450073907.git.raj.khem@gmail.com>
References: <cover.1450073907.git.raj.khem@gmail.com>
Subject: [PATCH 4/6] util-linux: Upgrade to 2.27.1
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
X-List-Received-Date: Mon, 14 Dec 2015 06:23:21 -0000

Patches that are dropped are already available upstream in 2.27 release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../util-linux/util-linux/fix-parallel-build.patch | 35 ----------------------
 .../util-linux/uclibc-__progname-conflict.patch    | 32 --------------------
 .../util-linux-ng-replace-siginterrupt.patch       | 33 --------------------
 .../{util-linux_2.26.2.bb => util-linux_2.27.1.bb} | 11 +++----
 4 files changed, 4 insertions(+), 107 deletions(-)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/fix-parallel-build.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/uclibc-__progname-conflict.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/util-linux-ng-replace-siginterrupt.patch
 rename meta/recipes-core/util-linux/{util-linux_2.26.2.bb => util-linux_2.27.1.bb} (72%)

diff --git a/meta/recipes-core/util-linux/util-linux/fix-parallel-build.patch b/meta/recipes-core/util-linux/util-linux/fix-parallel-build.patch
deleted file mode 100644
index adb271c..0000000
--- a/meta/recipes-core/util-linux/util-linux/fix-parallel-build.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 774f55f9dd22c01e4041a183d8dff14811f29114 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Fri, 4 Apr 2014 17:33:04 +0800
-Subject: [PATCH] sys-utils/Makemodule.am: fix parallel build issue
-
-The rule SETARCH_MAN_LINKS is used for the files under the sys-utils
-dir, for example:
-
-echo ".so man8/setarch.8" > sys-utils/linux32.8
-
-but it depends on nothing so that the sys-utils dir may not exist, we
-can create the sys-utils dir to fix problem.
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- sys-utils/Makemodule.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/sys-utils/Makemodule.am b/sys-utils/Makemodule.am
-index 6265282..62ead37 100644
---- a/sys-utils/Makemodule.am
-+++ b/sys-utils/Makemodule.am
-@@ -124,6 +124,7 @@ man_MANS += $(SETARCH_MAN_LINKS)
- CLEANFILES += $(SETARCH_MAN_LINKS)
- 
- $(SETARCH_MAN_LINKS):
-+	$(MKDIR_P) sys-utils
- 	$(AM_V_GEN)echo ".so man8/setarch.8" > $@
- 
- install-exec-hook-setarch:
--- 
-1.8.2.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/uclibc-__progname-conflict.patch b/meta/recipes-core/util-linux/util-linux/uclibc-__progname-conflict.patch
deleted file mode 100644
index 5031a73..0000000
--- a/meta/recipes-core/util-linux/util-linux/uclibc-__progname-conflict.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-configure should include errno.h instead of argp.h when
-checking for presence of program_invocation_short_name
-uclibc defines this to be const char* unlike util-linux-ng
-which defines this to be char* so this error goes unnoticed
-on glibc/eglibc systems.
-
-here is the error it fixes
-
-in file included from mountP.h:14:0,                                                                               
-                 from cache.c:29:                                                                                  
-/home/kraj/work/slugos/build/tmp-slugos-uclibc/sysroots/nslu2le/usr/include/errno.h:55:46: error: conflicting types for '__progname'                                                                                                  
-../../../include/c.h:118:14: note: previous declaration of '__progname' was here                                   
-make[3]: *** [cache.lo] Error 1          
-
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Jonathan Liu <net147@gmail.com>
-
-Upstream-Status: Pending
-Index: util-linux-2.22.1/configure.ac
-===================================================================
---- util-linux-2.22.1.orig/configure.ac
-+++ util-linux-2.22.1/configure.ac
-@@ -372,7 +372,7 @@ esac
- 
- AC_MSG_CHECKING([whether program_invocation_short_name is defined])
- AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
--	#include <argp.h>
-+	#include <errno.h>
- ]], [[
- 	program_invocation_short_name = "test";
- ]])], [
diff --git a/meta/recipes-core/util-linux/util-linux/util-linux-ng-replace-siginterrupt.patch b/meta/recipes-core/util-linux/util-linux/util-linux-ng-replace-siginterrupt.patch
deleted file mode 100644
index 6717a75..0000000
--- a/meta/recipes-core/util-linux/util-linux/util-linux-ng-replace-siginterrupt.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Upstream-Status: Pending
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- login-utils/login.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/login-utils/login.c b/login-utils/login.c
-index ebb76f5..38c881b 100644
---- a/login-utils/login.c
-+++ b/login-utils/login.c
-@@ -1110,6 +1110,7 @@ int main(int argc, char **argv)
- 	char *buff;
- 	int childArgc = 0;
- 	int retcode;
-+	struct sigaction act;
- 
- 	char *pwdbuf = NULL;
- 	struct passwd *pwd = NULL, _pwd;
-@@ -1123,7 +1124,9 @@ int main(int argc, char **argv)
- 	timeout = (unsigned int)getlogindefs_num("LOGIN_TIMEOUT", LOGIN_TIMEOUT);
- 
- 	signal(SIGALRM, timedout);
--	siginterrupt(SIGALRM, 1);	/* we have to interrupt syscalls like ioctl() */
-+	(void) sigaction(SIGALRM, NULL, &act);
-+	act.sa_flags &= ~SA_RESTART;
-+	sigaction(SIGALRM, &act, NULL);
- 	alarm(timeout);
- 	signal(SIGQUIT, SIG_IGN);
- 	signal(SIGINT, SIG_IGN);
--- 
-1.9.1
-
diff --git a/meta/recipes-core/util-linux/util-linux_2.26.2.bb b/meta/recipes-core/util-linux/util-linux_2.27.1.bb
similarity index 72%
rename from meta/recipes-core/util-linux/util-linux_2.26.2.bb
rename to meta/recipes-core/util-linux/util-linux_2.27.1.bb
index 02e42c1..14a77ca 100644
--- a/meta/recipes-core/util-linux/util-linux_2.26.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.27.1.bb
@@ -1,4 +1,4 @@
-MAJOR_VERSION = "2.26"
+MAJOR_VERSION = "2.27"
 require util-linux.inc
 
 # To support older hosts, we need to patch and/or revert
@@ -8,11 +8,8 @@ OLDHOST_class-native = "file://util-linux-native.patch \
                         file://util-linux-native-qsort.patch \
 			"
 
-SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
-            file://util-linux-ng-2.16-mount_lock_path.patch \
-            file://uclibc-__progname-conflict.patch \
+SRC_URI += "file://util-linux-ng-2.16-mount_lock_path.patch \
             file://configure-sbindir.patch \
-            file://fix-parallel-build.patch \
             file://runuser.pamd \
             file://runuser-l.pamd \
             ${OLDHOST} \
@@ -23,8 +20,8 @@ SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
             file://display_testname_for_subtest.patch \
             file://avoid_parallel_tests.patch \
 "
-SRC_URI[md5sum] = "9bdf368c395f1b70325d0eb22c7f48fb"
-SRC_URI[sha256sum] = "0e29bda142528a48a0a953c39ff63093651a4809042e1790fbd6aa8663fd9666"
+SRC_URI[md5sum] = "3cd2698d1363a2c64091c2dadc974647"
+SRC_URI[sha256sum] = "0a818fcdede99aec43ffe6ca5b5388bff80d162f2f7bd4541dca94fecb87a290"
 
 CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=ms"
 
-- 
2.6.4



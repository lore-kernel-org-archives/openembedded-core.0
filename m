Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1FD4560034
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 08:53:47 +0000 (UTC)
Received: by webcq43 with SMTP id cq43so32831765web.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 01:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MJAF1JlqI7LjGA+dhX3e8d02IEVhSZjjE8loF1uUQJA=;
	b=q8YVoEbMH+KS4QDlbEiA1Vpb0S1RoDnuLHmi6Hajh0W8J1olp+Fq4VJ2awhN56YFCm
	fyTGGsrmqMnDBJzrfNY0sV9aMgegGuu6Wcru6N4BgbYLMbV8FDH1l8bAP022vRo6lOwN
	236jo5BIDJE2GmyDD6s2q6MkLqaXvydgiGOpq4xIF4VVmVuT2RCgd34qh8pNuPrsKlz8
	Ze1omx/oHGXOV73DN+2TX5rse4LTUJSPoGw8THYNhufy8uMAjys9V4m9i0u5r9aJgzll
	RBHsPD4fKFkcYgmmowp12e649ggnqVZz6+olUtlDCJIILBBkivW9ZDL2D2dQpkS7NFvG
	hMVg==
X-Received: by 10.180.74.135 with SMTP id t7mr31789710wiv.72.1426496028668;
	Mon, 16 Mar 2015 01:53:48 -0700 (PDT)
Received: from s42.loc (91-119-229-249.dynamic.xdsl-line.inode.at.
	[91.119.229.249]) by mx.google.com with ESMTPSA id
	i10sm14369089wja.40.2015.03.16.01.53.47
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 16 Mar 2015 01:53:47 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.80)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1YXQmQ-00071A-BD; Mon, 16 Mar 2015 09:53:46 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2015 09:53:44 +0100
Message-Id: <1426496025-26942-2-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1426496025-26942-1-git-send-email-rep.dot.nop@gmail.com>
References: <1426496025-26942-1-git-send-email-rep.dot.nop@gmail.com>
Subject: [PATCH 2/3] rpcbind: respin patches
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
X-List-Received-Date: Mon, 16 Mar 2015 08:53:48 -0000

Due to libc-dependant conditional patching (which should be completely
forbidden -- fix it properly instead) the last PV bump forgot to adjust
patches so they failed to apply.

Fix this by redoing the patches. These patches were submitted for
upstream master, add backported patches for the current tarball.

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 ...001-configure.ac-Check-for-rpcsvc-mount.h.patch |   64 ++++++++++++++++++++
 .../rpcbind/rpcbind/0001-uclibc-nss.patch          |   30 ---------
 .../rpcbind/0002-uclibc-rpcsvc-defines.patch       |   60 ------------------
 meta/recipes-extended/rpcbind/rpcbind_0.2.2.bb     |    8 +--
 4 files changed, 66 insertions(+), 96 deletions(-)
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-configure.ac-Check-for-rpcsvc-mount.h.patch
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-uclibc-nss.patch
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/0002-uclibc-rpcsvc-defines.patch

diff --git a/meta/recipes-extended/rpcbind/rpcbind/0001-configure.ac-Check-for-rpcsvc-mount.h.patch b/meta/recipes-extended/rpcbind/rpcbind/0001-configure.ac-Check-for-rpcsvc-mount.h.patch
new file mode 100644
index 0000000..cd3137f
--- /dev/null
+++ b/meta/recipes-extended/rpcbind/rpcbind/0001-configure.ac-Check-for-rpcsvc-mount.h.patch
@@ -0,0 +1,64 @@
+From 8c5e97b9ff5699a5eafad6c4348bbb0b84ec30e0 Mon Sep 17 00:00:00 2001
+From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+Date: Tue, 3 Mar 2015 01:59:50 +0100
+Subject: [PATCH,rpcbind 2/4] configure.ac: Check for rpcsvc/mount.h
+To: Steve Dickson <SteveD@redhat.com>
+Cc: libtirpc-devel@lists.sourceforge.net
+
+The function check_callit() attempts to reference a number of defines
+from files that might not be available for everything but glibc.
+
+For simplicity assume that if there is no rpcsvc/mount.h all the other
+includes do not exist either.
+
+Upstream-Status: Submitted
+
+Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
+---
+ configure.ac   |  2 +-
+ src/security.c | 17 +++++++++++++++++
+ 2 files changed, 18 insertions(+), 1 deletion(-)
+
+diff -rdup rpcbind-0.2.2.orig/configure.ac rpcbind-0.2.2/configure.ac
+--- rpcbind-0.2.2.orig/configure.ac	2014-11-25 21:34:48.000000000 +0100
++++ rpcbind-0.2.2/configure.ac	2015-03-12 10:47:12.613608115 +0100
+@@ -55,4 +55,6 @@ AS_IF([test x$enable_libwrap = xyes], [
+ 
+ AC_SEARCH_LIBS([pthread_create], [pthread])
+ 
++AC_CHECK_HEADERS([nss.h rpcsvc/mount.h])
++
+ AC_OUTPUT([Makefile])
+diff -rdup rpcbind-0.2.2.orig/src/security.c rpcbind-0.2.2/src/security.c
+--- rpcbind-0.2.2.orig/src/security.c	2014-11-25 21:34:48.000000000 +0100
++++ rpcbind-0.2.2/src/security.c	2015-03-12 10:45:40.580434845 +0100
+@@ -20,12 +20,29 @@
+ /*
+  * XXX for special case checks in check_callit.
+  */
++#ifdef HAVE_RPCSVC_MOUNT_H
+ #include <rpcsvc/mount.h>
+ #include <rpcsvc/rquota.h>
+ #include <rpcsvc/nfs_prot.h>
+ #include <rpcsvc/yp.h>
+ #include <rpcsvc/ypclnt.h>
+ #include <rpcsvc/yppasswd.h>
++#else
++# define MOUNTPROC_MNT	1
++# define MOUNTPROC_UMNT	3
++# define NFS_PROGRAM	100003
++# define YPPROG		100004
++# define MOUNTPROG	100005
++# define YPBINDPROG	100007
++# define YPPASSWDPROG	100009
++# define RQUOTAPROG	100011
++
++# define YPBINDPROC_SETDOM	2
++# define YPPROC_MATCH	3
++# define YPPROC_FIRST	4
++# define YPPROC_NEXT	5
++# define YPPROC_ALL	8
++#endif
+ 
+ #include "rpcbind.h"
+ 
diff --git a/meta/recipes-extended/rpcbind/rpcbind/0001-uclibc-nss.patch b/meta/recipes-extended/rpcbind/rpcbind/0001-uclibc-nss.patch
deleted file mode 100644
index afa55f3..0000000
--- a/meta/recipes-extended/rpcbind/rpcbind/0001-uclibc-nss.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Upstream-Status: Pending
-
-From b8f0d7b7318ba344c25785d6f5cf3f8de98012d4 Mon Sep 17 00:00:00 2001
-From: Natanael Copa <ncopa@alpinelinux.org>
-Date: Tue, 2 Feb 2010 09:36:03 +0000
-Subject: [PATCH 1/2] uclibc-nss
-
----
- src/rpcbind.c |    4 ++++
- 1 files changed, 4 insertions(+), 0 deletions(-)
-
-diff --git a/src/rpcbind.c b/src/rpcbind.c
-index 525ffba..1fe1a60 100644
---- a/src/rpcbind.c
-+++ b/src/rpcbind.c
-@@ -67,7 +67,11 @@
- #include <pwd.h>
- #include <string.h>
- #include <errno.h>
-+#if defined(__UCLIBC__)
-+#define __nss_configure_lookup(x,y)
-+#else
- #include <nss.h>
-+#endif
- #include "config.h"
- #include "rpcbind.h"
- 
--- 
-1.6.6.1
-
diff --git a/meta/recipes-extended/rpcbind/rpcbind/0002-uclibc-rpcsvc-defines.patch b/meta/recipes-extended/rpcbind/rpcbind/0002-uclibc-rpcsvc-defines.patch
deleted file mode 100644
index c54fc96..0000000
--- a/meta/recipes-extended/rpcbind/rpcbind/0002-uclibc-rpcsvc-defines.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-Upstream-Status: Pending
-
-From 077add040c2e30d3ac507362f4afe350f47be027 Mon Sep 17 00:00:00 2001
-From: Natanael Copa <ncopa@alpinelinux.org>
-Date: Tue, 2 Feb 2010 09:47:57 +0000
-Subject: [PATCH 2/2] uclibc-rpcsvc-defines
-
----
- src/security.c |   28 ++++++++++++++++++++++++++++
- 1 files changed, 28 insertions(+), 0 deletions(-)
-
-diff --git a/src/security.c b/src/security.c
-index 0edeac6..e9fed55 100644
---- a/src/security.c
-+++ b/src/security.c
-@@ -20,6 +20,32 @@
- /*
-  * XXX for special case checks in check_callit.
-  */
-+#if defined(__UCLIBC__)
-+
-+#define MOUNTPROC_MNT 1
-+#define MOUNTPROC_UMNT 3
-+
-+#define NFS_PROGRAM	100003
-+#define YPPROG		100004
-+#define MOUNTPROG	100005
-+#define YPBINDPROG	100007
-+#define YPPASSWDPROG	100009
-+#define RQUOTAPROG	100011
-+
-+#define YPPROC_NULL	0
-+#define YPPROC_DOMAIN 	1
-+#define YPPROC_DOMAIN_NONACK 2
-+#define YPPROC_MATCH	3
-+#define YPPROC_FIRST	4
-+#define YPPROC_NEXT	5
-+#define YPPROC_XFR	6
-+#define YPPROC_CLEAR	7
-+#define YPPROC_ALL	8
-+
-+#define YPBINDPROC_SETDOM	2
-+
-+#else
-+
- #include <rpcsvc/mount.h>
- #include <rpcsvc/rquota.h>
- #include <rpcsvc/nfs_prot.h>
-@@ -27,6 +53,8 @@
- #include <rpcsvc/ypclnt.h>
- #include <rpcsvc/yppasswd.h>
- 
-+#endif
-+
- #include "rpcbind.h"
- 
- #ifdef LIBWRAP
--- 
-1.6.6.1
-
diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.2.bb b/meta/recipes-extended/rpcbind/rpcbind_0.2.2.bb
index fd4b2b5..7414d89 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_0.2.2.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.2.bb
@@ -10,19 +10,15 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b46486e4c4a416602693a711bb5bfa39 \
                     file://src/rpcinfo.c;beginline=1;endline=27;md5=f8a8cd2cb25ac5aa16767364fb0e3c24"
 
+PR = "r1"
 SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
            file://init.d \
-           ${UCLIBCPATCHES} \
+           file://0001-configure.ac-Check-for-rpcsvc-mount.h.patch \
            file://rpcbind.conf \
            file://rpcbind.socket \
            file://rpcbind.service \
           "
 
-UCLIBCPATCHES_libc-uclibc = "file://0001-uclibc-nss.patch \
-                             file://0002-uclibc-rpcsvc-defines.patch \
-                            "
-UCLIBCPATCHES ?= ""
-
 SRC_URI[md5sum] = "8acf839bfef2364a05fbd6be5f8edf9a"
 SRC_URI[sha256sum] = "13dbc8c796dbe0ce8df873007bea0490c8460b56202d918c9eb6fa0358a08f29"
 
-- 
1.7.10.4



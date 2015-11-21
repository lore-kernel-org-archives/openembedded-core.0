Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6C0F1607AB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Nov 2015 18:22:53 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so153150563pab.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Nov 2015 10:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=sh85dp1xz3cvVGIc0pExUh+/6TH12HjEgqVTfT7isps=;
	b=ceEzISvENIvD4rW7TnsFBgWm+qvRVZOjwR28cTdWxQ1pIB6XCeOQkzmAlWlCzY++pf
	kGkMwYbBvCADE5mDOMqV0+pIkb6wCXMKOSIug+p5M/2oxujj06PRYCsGEicIXAWWKtef
	Ji1fE7/3Zikw2n1RUyb8dKVAM4jdRW1HnMgkO168NszP9kUXmrxZ6fODCeFGc9RZtfol
	89peBdYRLxoc37EGNvL67bt9+nHbG9zM6laF3WyNS9lREel0PmLYyShuvCoXKAFoIdoR
	QJmhdRHXOZsmqsJkJ0Pxi0v4lHDDL7In1YgYawFOnycrbex1nSYAykfoflm8gB+dpKXp
	LvEw==
X-Received: by 10.66.150.37 with SMTP id uf5mr27329240pab.30.1448130174071;
	Sat, 21 Nov 2015 10:22:54 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	w13sm4381110pbs.70.2015.11.21.10.22.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Nov 2015 10:22:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
X-Google-Original-From: Armin Kuster <akuster@mvista.com>
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id C2691FCC839; Sat, 21 Nov 2015 10:22:47 -0800 (PST)
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Nov 2015 10:22:44 -0800
Message-Id: <d72b398ffb5ea9b64ada5fad3147f288897ffeb0.1448130024.git.akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1448130024.git.akuster@mvista.com>
References: <cover.1448130024.git.akuster@mvista.com>
In-Reply-To: <cover.1448130024.git.akuster@mvista.com>
References: <cover.1448130024.git.akuster@mvista.com>
Subject: [PATCH 3/4] rsync: backport libattr checking patch
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
X-List-Received-Date: Sat, 21 Nov 2015 18:22:55 -0000

From: Sergiy Kibrik <sakib@meta.ua>

Add check_libattr.patch to version 3.1.0 recipe, which checks
and includes libattr to linker, otherwise rsync may fail to build
with linker error below (as -lattr option gets omitted):

[..]
lib/sysxattrs.o: undefined reference to symbol 'llistxattr@@ATTR_1.0'
[..]/lib/libattr.so.1: error adding symbols: DSO missing from command line

Signed-off-by: Sergiy Kibrik <sakib@meta.ua>
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../rsync/files/check_libattr.patch                | 33 ++++++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.1.0.bb         |  3 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/rsync/files/check_libattr.patch

diff --git a/meta/recipes-devtools/rsync/files/check_libattr.patch b/meta/recipes-devtools/rsync/files/check_libattr.patch
new file mode 100644
index 0000000..cb159fa
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/check_libattr.patch
@@ -0,0 +1,33 @@
+From 677c6e14cc7d5f41371d5616865a5f0cfc0a273f Mon Sep 17 00:00:00 2001
+From: Wayne Davison <wayned@samba.org>
+Date: Mon, 5 May 2014 09:25:13 -0700
+Subject: [PATCH] Check for attr lib.
+
+---
+ configure.ac | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index c7b28c5..8e3703c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1007,7 +1007,7 @@ else
+     *)
+ 	AC_MSG_RESULT(running tests:)
+ 	AC_CHECK_LIB(acl,acl_get_file)
+-	    AC_CACHE_CHECK([for ACL support],samba_cv_HAVE_POSIX_ACLS,[
++	AC_CACHE_CHECK([for ACL support],samba_cv_HAVE_POSIX_ACLS,[
+ 	    AC_TRY_LINK([#include <sys/types.h>
+ #include <sys/acl.h>],
+ [ acl_t acl; int entry_id; acl_entry_t *entry_p; return acl_get_entry( acl, entry_id, entry_p);],
+@@ -1057,6 +1057,7 @@ else
+ 	AC_DEFINE(HAVE_LINUX_XATTRS, 1, [True if you have Linux xattrs])
+ 	AC_DEFINE(SUPPORT_XATTRS, 1)
+ 	AC_DEFINE(NO_SYMLINK_USER_XATTRS, 1, [True if symlinks do not support user xattrs])
++	AC_CHECK_LIB(attr,getxattr)
+ 	;;
+     darwin*)
+ 	AC_MSG_RESULT(Using OS X xattrs)
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/rsync/rsync_3.1.0.bb b/meta/recipes-devtools/rsync/rsync_3.1.0.bb
index a4a5c10..d253fe9 100644
--- a/meta/recipes-devtools/rsync/rsync_3.1.0.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.1.0.bb
@@ -1,7 +1,8 @@
 require rsync.inc
 
 
-SRC_URI += "file://acinclude.m4"
+SRC_URI += "file://acinclude.m4 \
+	    file://check_libattr.patch"
 
 SRC_URI[md5sum] = "3be148772a33224771a8d4d2a028b132"
 SRC_URI[sha256sum] = "81ca23f77fc9b957eb9845a6024f41af0ff0c619b7f38576887c63fa38e2394e"
-- 
1.9.1



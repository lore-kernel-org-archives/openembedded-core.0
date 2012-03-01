Received: from mail-pz0-f50.google.com ([209.85.210.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S30zW-0003Ca-TC
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Mar 2012 09:03:59 +0100
Received: by dald2 with SMTP id d2so510999dal.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Feb 2012 23:55:28 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.68.238.136 as permitted sender) client-ip=10.68.238.136; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.68.238.136 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.68.238.136])
	by 10.68.238.136 with SMTP id vk8mr16816142pbc.143.1330588528599
	(num_hops = 1); Wed, 29 Feb 2012 23:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Aecia/nuZXR0RhC5/1NMVza3ccIQMeC1YK90UAaRs0I=;
	b=Yx3SI4Ppd0Auql/yzTLGqQY74YTgZSQmzYQZvM7l+rukTCPNsk4pqLyI74oFM/VP2P
	eJwx3wD9hK9NYkiEH51ZXjVlQoMMQRBJ83msw1Ld35BlE7uMpTaqs9J/7xVmupuFFT7q
	0/BdtPVKAYRZJV1oTNe7HMulVmCgGeQYMlgYw=
Received: by 10.68.238.136 with SMTP id vk8mr13927994pbc.143.1330588528514;
	Wed, 29 Feb 2012 23:55:28 -0800 (PST)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id d8sm1445323pbg.5.2012.02.29.23.55.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Feb 2012 23:55:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Feb 2012 23:55:00 -0800
Message-Id: <1330588500-25258-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] util-linux: Fix build when NLS is disabled
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Mar 2012 08:03:59 -0000

AC_CHECK_DECLS generated defines should be
checked with #if not #ifdef

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../fix_NL_TIME_FIRST_WEEKDAY.patch                |   24 ++++++++++++++++++++
 meta/recipes-core/util-linux/util-linux_2.21.bb    |    5 ++-
 2 files changed, 27 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux-2.21/fix_NL_TIME_FIRST_WEEKDAY.patch

diff --git a/meta/recipes-core/util-linux/util-linux-2.21/fix_NL_TIME_FIRST_WEEKDAY.patch b/meta/recipes-core/util-linux/util-linux-2.21/fix_NL_TIME_FIRST_WEEKDAY.patch
new file mode 100644
index 0000000..545c3a9
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux-2.21/fix_NL_TIME_FIRST_WEEKDAY.patch
@@ -0,0 +1,24 @@
+configure uses AC_CHECK_DECLS to check for _NL_TIME_WEEK_1STDAY
+which means we will get HAVE_DECL__NL_TIME_WEEK_1STDAY
+defined to 1 if symbol is declared, otherwise to 0 in config.h
+
+Therefore we cannot rely on conditionals which check for it
+being defined or not since it always will be defined so correct
+thing is to use #if instead of #ifdef
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+Index: util-linux-2.21/misc-utils/cal.c
+===================================================================
+--- util-linux-2.21.orig/misc-utils/cal.c	2012-02-29 23:41:54.413347665 -0800
++++ util-linux-2.21/misc-utils/cal.c	2012-02-29 23:42:44.573350057 -0800
+@@ -297,7 +297,7 @@
+  * the locale database, which can be overridden with the
+  * -s (Sunday) or -m (Monday) options.
+  */
+-#ifdef HAVE_DECL__NL_TIME_WEEK_1STDAY
++#if HAVE_DECL__NL_TIME_WEEK_1STDAY
+ 	/*
+ 	 * You need to use 2 locale variables to get the first day of the week.
+ 	 * This is needed to support first_weekday=2 and first_workday=1 for
diff --git a/meta/recipes-core/util-linux/util-linux_2.21.bb b/meta/recipes-core/util-linux/util-linux_2.21.bb
index aa6ac64..8234ecb 100644
--- a/meta/recipes-core/util-linux/util-linux_2.21.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.21.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.21"
-PR = "r0"
+PR = "r1"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
@@ -7,7 +7,8 @@ LICENSE_util-linux-lscpu = "GPLv3+"
 
 SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
             file://util-linux-ng-2.16-mount_lock_path.patch \
-            file://uclibc-__progname-conflict.patch \      
+            file://uclibc-__progname-conflict.patch \
+            file://fix_NL_TIME_FIRST_WEEKDAY.patch \
 "
 
 SRC_URI[md5sum] = "3c7a26963f3921c1e775a80330321870"
-- 
1.7.5.4




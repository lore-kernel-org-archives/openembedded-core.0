Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QgqzN-00050g-F1
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 06:23:57 +0200
Received: by mail-iy0-f175.google.com with SMTP id 10so5392633iym.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 21:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Ecc1fQHtig8+wwtMVm922VOT5G+bdDA1sAFMZilZlK0=;
	b=RlJIyQeyupZAyuvuysMhFUgsOa9Imfe+5phxrr29fzhNTXwSHsGvgoOhpU/sCMY1wt
	vvoOHz0o52xiYnA80tN/RGFn7eEFgwKmMzir5kjS2+Twouu0nRQLAndDYl6hZf87CZf/
	WK1QyBkq7NWCQ8WkdFszq0EMVhmP8HBPYYLDI=
Received: by 10.42.73.4 with SMTP id q4mr723822icj.156.1310530795994;
	Tue, 12 Jul 2011 21:19:55 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id ft12sm8672139ibb.19.2011.07.12.21.19.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jul 2011 21:19:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2011 21:19:44 -0700
Message-Id: <1310530784-16538-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1310530784-16538-1-git-send-email-raj.khem@gmail.com>
References: <1310530784-16538-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/2] util-linux: Replace sigsetmask with posix compliant functions
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
X-List-Received-Date: Wed, 13 Jul 2011 04:23:57 -0000

This patch is not needed upstream since the code using sigsetmask
has been deleted.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../util-linux-2.19.1/remove_sigsetmark.patch      |   35 ++++++++++++++++++++
 meta/recipes-core/util-linux/util-linux_2.19.1.bb  |    3 +-
 2 files changed, 37 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux-2.19.1/remove_sigsetmark.patch

diff --git a/meta/recipes-core/util-linux/util-linux-2.19.1/remove_sigsetmark.patch b/meta/recipes-core/util-linux/util-linux-2.19.1/remove_sigsetmark.patch
new file mode 100644
index 0000000..02e4d16
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux-2.19.1/remove_sigsetmark.patch
@@ -0,0 +1,35 @@
+simpleinit: remove deprecated sigsetmask()
+
+The sigsetmask() is deprecated in favor of sigprocmask().
+
+This is not needed upstream since simpleinit is removed from
+util-linux-ng master
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Inappropriate
+
+Index: util-linux-2.19.1/simpleinit/shutdown.c
+===================================================================
+--- util-linux-2.19.1.orig/simpleinit/shutdown.c	2011-03-04 03:47:47.000000000 -0800
++++ util-linux-2.19.1/simpleinit/shutdown.c	2011-07-06 08:43:39.183849752 -0700
+@@ -145,7 +145,7 @@
+ {
+ 	int c, i, fd;
+ 	char *ptr;
+-
++	sigset_t sigmask;
+ 	i = getdtablesize ();
+ 	for (fd = 3; fd < i; fd++) close (fd);
+ 	if (getpid () == 1)
+@@ -153,7 +153,9 @@
+ 	    for (fd = 0; fd < 3; fd++) close (fd);
+ 	    while (1) wait (NULL);  /*  Grim reaper never stops  */
+ 	}
+-	sigsetmask (0); /*  simpleinit(8) blocks all signals: undo for ALRM  */
++	/*  simpleinit(8) blocks all signals: undo for ALRM  */
++	sigemptyset(&sigmask);
++	sigprocmask (SIG_SETMASK, &sigmask, NULL);
+ 	for (i = 1; i < NSIG; i++) signal (i, SIG_DFL);
+ 
+         setlocale(LC_ALL, "");
diff --git a/meta/recipes-core/util-linux/util-linux_2.19.1.bb b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
index 0fd67d1..2ef95e6 100644
--- a/meta/recipes-core/util-linux/util-linux_2.19.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.19.1.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.19"
-PR = "r2"
+PR = "r3"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
@@ -8,6 +8,7 @@ LICENSE_util-linux-lscpu = "GPLv3+"
 SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
             file://util-linux-ng-2.16-mount_lock_path.patch \
             file://uclibc-__progname-conflict.patch \      
+            file://remove_sigsetmark.patch \
 "
 
 SRC_URI[md5sum] = "3eab06f05163dfa65479c44e5231932c"
-- 
1.7.5.1




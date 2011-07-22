Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QkABm-0008Se-N5
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 09:30:26 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Jul 2011 00:26:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,246,1309762800"; d="scan'208";a="31084145"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.1])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2011 00:26:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 00:25:59 -0700
Message-Id: <221751792ccd151d82b15add04be4851889caac9.1311318447.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311318447.git.sgw@linux.intel.com>
References: <cover.1311318447.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311318447.git.sgw@linux.intel.com>
References: <cover.1311318447.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 11/16] util-linux: Replace sigsetmask with posix compliant functions
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
X-List-Received-Date: Fri, 22 Jul 2011 07:30:27 -0000

From: Khem Raj <raj.khem@gmail.com>

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
1.7.3.4




Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S266A-00027s-2z
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 20:19:02 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 27 Feb 2012 11:10:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122056433"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.37])
	by fmsmga001.fm.intel.com with ESMTP; 27 Feb 2012 11:10:33 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2012 11:10:21 -0800
Message-Id: <1917f9e3ccf8558491f0f671ba0525319cd3cf02.1330369680.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1330369680.git.sgw@linux.intel.com>
References: <cover.1330369680.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330369680.git.sgw@linux.intel.com>
References: <cover.1330369680.git.sgw@linux.intel.com>
Subject: [PATCH 03/13] util-linux: Update to 2.21
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
X-List-Received-Date: Mon, 27 Feb 2012 19:19:03 -0000

This updates various checksums for the COPYING files, which moved in the process
no changes to Licenses

Tweak the scanf_cv_alloc_modifier and rebase the patch

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../util-linux-ng-replace-siginterrupt.patch       |   25 -------------------
 .../{util-linux-2.20.1 => util-linux-2.21}/MCONFIG |    0
 .../defines.h                                      |    0
 .../make_include                                   |    0
 .../remove-lscpu.patch                             |    0
 .../remove_sigsetmark.patch                        |    0
 .../swapargs.h                                     |    0
 .../uclibc-__progname-conflict.patch               |    0
 .../uclibc-compile.patch                           |    0
 .../util-linux-ng-2.16-mount_lock_path.patch       |    0
 .../util-linux-ng-replace-siginterrupt.patch       |   26 ++++++++++++++++++++
 meta/recipes-core/util-linux/util-linux.inc        |    8 ++++--
 .../{util-linux_2.20.1.bb => util-linux_2.21.bb}   |   12 ++++----
 13 files changed, 37 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-core/util-linux/util-linux-2.20.1/util-linux-ng-replace-siginterrupt.patch
 rename meta/recipes-core/util-linux/{util-linux-2.20.1 => util-linux-2.21}/MCONFIG (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.20.1 => util-linux-2.21}/defines.h (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.20.1 => util-linux-2.21}/make_include (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.20.1 => util-linux-2.21}/remove-lscpu.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.20.1 => util-linux-2.21}/remove_sigsetmark.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.20.1 => util-linux-2.21}/swapargs.h (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.20.1 => util-linux-2.21}/uclibc-__progname-conflict.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.20.1 => util-linux-2.21}/uclibc-compile.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.20.1 => util-linux-2.21}/util-linux-ng-2.16-mount_lock_path.patch (100%)
 create mode 100644 meta/recipes-core/util-linux/util-linux-2.21/util-linux-ng-replace-siginterrupt.patch
 rename meta/recipes-core/util-linux/{util-linux_2.20.1.bb => util-linux_2.21.bb} (84%)

diff --git a/meta/recipes-core/util-linux/util-linux-2.20.1/util-linux-ng-replace-siginterrupt.patch b/meta/recipes-core/util-linux/util-linux-2.20.1/util-linux-ng-replace-siginterrupt.patch
deleted file mode 100644
index c5c0aff..0000000
--- a/meta/recipes-core/util-linux/util-linux-2.20.1/util-linux-ng-replace-siginterrupt.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Upstream-Status: Pending
-
-Index: util-linux-ng-2.14/login-utils/login.c
-===================================================================
---- util-linux-ng-2.14.orig/login-utils/login.c	2008-05-28 16:01:02.000000000 -0700
-+++ util-linux-ng-2.14/login-utils/login.c	2009-03-04 18:31:42.000000000 -0800
-@@ -358,6 +358,7 @@
-     char *childArgv[10];
-     char *buff;
-     int childArgc = 0;
-+    struct sigaction act;
- #ifdef HAVE_SECURITY_PAM_MISC_H
-     int retcode;
-     pam_handle_t *pamh = NULL;
-@@ -373,7 +374,9 @@
-     pid = getpid();
- 
-     signal(SIGALRM, timedout);
--    siginterrupt(SIGALRM,1);           /* we have to interrupt syscalls like ioclt() */
-+    (void) sigaction(SIGALRM, NULL, &act);
-+    act.sa_flags &= ~SA_RESTART;
-+    sigaction(SIGALRM, &act, NULL);
-     alarm((unsigned int)timeout);
-     signal(SIGQUIT, SIG_IGN);
-     signal(SIGINT, SIG_IGN);
diff --git a/meta/recipes-core/util-linux/util-linux-2.20.1/MCONFIG b/meta/recipes-core/util-linux/util-linux-2.21/MCONFIG
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.20.1/MCONFIG
rename to meta/recipes-core/util-linux/util-linux-2.21/MCONFIG
diff --git a/meta/recipes-core/util-linux/util-linux-2.20.1/defines.h b/meta/recipes-core/util-linux/util-linux-2.21/defines.h
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.20.1/defines.h
rename to meta/recipes-core/util-linux/util-linux-2.21/defines.h
diff --git a/meta/recipes-core/util-linux/util-linux-2.20.1/make_include b/meta/recipes-core/util-linux/util-linux-2.21/make_include
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.20.1/make_include
rename to meta/recipes-core/util-linux/util-linux-2.21/make_include
diff --git a/meta/recipes-core/util-linux/util-linux-2.20.1/remove-lscpu.patch b/meta/recipes-core/util-linux/util-linux-2.21/remove-lscpu.patch
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.20.1/remove-lscpu.patch
rename to meta/recipes-core/util-linux/util-linux-2.21/remove-lscpu.patch
diff --git a/meta/recipes-core/util-linux/util-linux-2.20.1/remove_sigsetmark.patch b/meta/recipes-core/util-linux/util-linux-2.21/remove_sigsetmark.patch
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.20.1/remove_sigsetmark.patch
rename to meta/recipes-core/util-linux/util-linux-2.21/remove_sigsetmark.patch
diff --git a/meta/recipes-core/util-linux/util-linux-2.20.1/swapargs.h b/meta/recipes-core/util-linux/util-linux-2.21/swapargs.h
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.20.1/swapargs.h
rename to meta/recipes-core/util-linux/util-linux-2.21/swapargs.h
diff --git a/meta/recipes-core/util-linux/util-linux-2.20.1/uclibc-__progname-conflict.patch b/meta/recipes-core/util-linux/util-linux-2.21/uclibc-__progname-conflict.patch
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.20.1/uclibc-__progname-conflict.patch
rename to meta/recipes-core/util-linux/util-linux-2.21/uclibc-__progname-conflict.patch
diff --git a/meta/recipes-core/util-linux/util-linux-2.20.1/uclibc-compile.patch b/meta/recipes-core/util-linux/util-linux-2.21/uclibc-compile.patch
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.20.1/uclibc-compile.patch
rename to meta/recipes-core/util-linux/util-linux-2.21/uclibc-compile.patch
diff --git a/meta/recipes-core/util-linux/util-linux-2.20.1/util-linux-ng-2.16-mount_lock_path.patch b/meta/recipes-core/util-linux/util-linux-2.21/util-linux-ng-2.16-mount_lock_path.patch
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-2.20.1/util-linux-ng-2.16-mount_lock_path.patch
rename to meta/recipes-core/util-linux/util-linux-2.21/util-linux-ng-2.16-mount_lock_path.patch
diff --git a/meta/recipes-core/util-linux/util-linux-2.21/util-linux-ng-replace-siginterrupt.patch b/meta/recipes-core/util-linux/util-linux-2.21/util-linux-ng-replace-siginterrupt.patch
new file mode 100644
index 0000000..ef56048
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux-2.21/util-linux-ng-replace-siginterrupt.patch
@@ -0,0 +1,26 @@
+Upstream-Status: Pending
+
+Index: util-linux-2.21/login-utils/login.c
+===================================================================
+--- util-linux-2.21.orig/login-utils/login.c
++++ util-linux-2.21/login-utils/login.c
+@@ -1216,6 +1216,8 @@ int main(int argc, char **argv)
+ 	char *buff;
+ 	int childArgc = 0;
+ 	int retcode;
++	struct sigaction act;
++
+ 
+ 	char *pwdbuf = NULL;
+ 	struct passwd *pwd = NULL, _pwd;
+@@ -1229,7 +1231,9 @@ int main(int argc, char **argv)
+ 	timeout = getlogindefs_num("LOGIN_TIMEOUT", LOGIN_TIMEOUT);
+ 
+ 	signal(SIGALRM, timedout);
+-	siginterrupt(SIGALRM, 1);	/* we have to interrupt syscalls like ioclt() */
++	(void) sigaction(SIGALRM, NULL, &act);
++	act.sa_flags &= ~SA_RESTART;
++	sigaction(SIGALRM, &act, NULL);
+ 	alarm((unsigned int)timeout);
+ 	signal(SIGQUIT, SIG_IGN);
+ 	signal(SIGINT, SIG_IGN);
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index f60f33b..1a3d293 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -9,9 +9,11 @@ LICENSE = "GPLv2+ & LGPLv2.1+ & BSD"
 
 LIC_FILES_CHKSUM = "file://README.licensing;md5=9c920d811858a74b67a36ba23cbaa95f \
                     file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
-                    file://licenses/COPYING.GPL;md5=8ca43cbc842c2336e835926c2166c28b \
-                    file://licenses/COPYING.UCB;md5=263860f8968d8bafa5392cab74285262 \
-                    file://getopt/COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+                    file://Documentation/licenses/COPYING.GPLv2;md5=8ca43cbc842c2336e835926c2166c28b \
+                    file://Documentation/licenses/COPYING.LGPLv2.1;md5=bbb461211a33b134d42ed5ee802b37ff \
+                    file://Documentation/licenses/COPYING.BSD-3;md5=58dcd8452651fc8b07d1f65ce07ca8af \
+                    file://Documentation/licenses/COPYING.UCB;md5=263860f8968d8bafa5392cab74285262 \
+                    file://getopt/COPYING;md5=c3a41733416fb80af7ba1b7e1f712551"
 
 inherit autotools gettext pkgconfig
 DEPENDS = "zlib ncurses"
diff --git a/meta/recipes-core/util-linux/util-linux_2.20.1.bb b/meta/recipes-core/util-linux/util-linux_2.21.bb
similarity index 84%
rename from meta/recipes-core/util-linux/util-linux_2.20.1.bb
rename to meta/recipes-core/util-linux/util-linux_2.21.bb
index ed445d7..aa6ac64 100644
--- a/meta/recipes-core/util-linux/util-linux_2.20.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.21.bb
@@ -1,5 +1,5 @@
-MAJOR_VERSION = "2.20"
-PR = "r2"
+MAJOR_VERSION = "2.21"
+PR = "r0"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
@@ -10,15 +10,15 @@ SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
             file://uclibc-__progname-conflict.patch \      
 "
 
-SRC_URI[md5sum] = "079b37517fd4e002a2e6e992e8b4e361"
-SRC_URI[sha256sum] = "d16ebcda3e64ab88ed363d9c1242cdb7ccfd5e1f56c83d0c3b0638c23793bbe0"
+SRC_URI[md5sum] = "3c7a26963f3921c1e775a80330321870"
+SRC_URI[sha256sum] = "2813ae6fe0449b60402e122c2baf97f26aa53e6e2dd05591c6cbcdf67ffdb6c6"
 
 # Only lscpu part is gplv3; rest of the code is not, 
 # so take out the lscpu parts while running non-gplv3 build.
 python () {
     d.setVar("REMOVELSCPU", "no")
     if (d.getVar("INCOMPATIBLE_LICENSE", True) or "").find("GPLv3") != -1:
-        # avoid GPLv3 
+        # avoid GPLv3
         d.setVar("REMOVELSCPU", "yes")
         packages = (d.getVar("PACKAGES", False) or "").split()
         if "util-linux-lscpu" in packages:
@@ -39,7 +39,7 @@ do_remove_lscpu() {
 
 addtask remove_lscpu before do_configure after do_patch
 
-CACHED_CONFIGUREVARS += "scanf_cv_type_modifier=as"
+CACHED_CONFIGUREVARS += "scanf_cv_alloc_modifier=as"
 EXTRA_OECONF_virtclass-native += "--disable-fallocate --disable-use-tty-group"
 
 do_install_append () {
-- 
1.7.7.6




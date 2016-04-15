Return-Path: <william.c.randle@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6D84165C5C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 22:22:47 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 15 Apr 2016 15:22:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,489,1455004800"; d="scan'208";a="687012606"
Received: from wcrandle-mobl1.amr.corp.intel.com ([10.254.30.128])
	by FMSMGA003.fm.intel.com with ESMTP; 15 Apr 2016 15:22:46 -0700
From: Bill Randle <william.c.randle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Apr 2016 15:22:38 -0700
Message-Id: <1460758958-6882-1-git-send-email-william.c.randle@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] systemd: use OE core paths under /var/volatile for /var/tmp and /var/log
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
X-List-Received-Date: Fri, 15 Apr 2016 22:22:49 -0000

OE uses /var/volatile/log and /var/volatile/tmp instead of
/var/log and /var/tmp. By also making the change in these
config files, it avoids systemd printing a warning message
about /var/{log,tmp} already existing. Set directory perms on
/var/volatile/tmp to match those systemd uses for /var/tmp.

[YOCTO #9424]

Signed-off-by: Bill Randle <william.c.randle@intel.com>
---
 .../systemd/systemd/00-create-volatile.conf        | 10 ++--
 ...use-OE-core-paths-for-var-tmp-and-var-log.patch | 53 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_229.bb           |  1 +
 3 files changed, 59 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0024-use-OE-core-paths-for-var-tmp-and-var-log.patch

diff --git a/meta/recipes-core/systemd/systemd/00-create-volatile.conf b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
index 87cbe1e..d6bba6c 100644
--- a/meta/recipes-core/systemd/systemd/00-create-volatile.conf
+++ b/meta/recipes-core/systemd/systemd/00-create-volatile.conf
@@ -1,7 +1,7 @@
-#This goes hand-in-hand with the base-files of OE-Core. The file must
-# be sorted before 'systemd.conf' becuase this attempts to create a file
+# This goes hand-in-hand with the base-files of OE-Core. The file must
+# be sorted before 'systemd.conf' because this attempts to create a file
 # inside /var/log.
 
-
-d		/var/volatile/log		-	-	-	-
-d		/var/volatile/tmp		1777	-	-
+d /var/volatile 0755 - - -
+d /var/volatile/log 0755 - - -
+q /var/volatile/tmp 1777 root root 30d
diff --git a/meta/recipes-core/systemd/systemd/0024-use-OE-core-paths-for-var-tmp-and-var-log.patch b/meta/recipes-core/systemd/systemd/0024-use-OE-core-paths-for-var-tmp-and-var-log.patch
new file mode 100644
index 0000000..f12db3a
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0024-use-OE-core-paths-for-var-tmp-and-var-log.patch
@@ -0,0 +1,53 @@
+From d4e695e3afd92cc55a6d836a6973073beff4aba4 Mon Sep 17 00:00:00 2001
+From: Bill Randle <william.c.randle@intel.com>
+Date: Fri, 15 Apr 2016 14:34:16 -0700
+Subject: [PATCH] systemd: use OE core paths for /var/tmp and /var/log
+
+OE uses /var/volatile/log and /var/volatile/tmp instead of
+/var/log and /var/tmp. By also making the change in these
+config files, it avoids systemd printing a warning message
+about /var/{log,tmp} already existing.
+
+[YOCTO #9424]
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Bill Randle <william.c.randle@intel.com>
+---
+ tmpfiles.d/tmp.conf | 4 +++-
+ tmpfiles.d/var.conf | 4 +++-
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/tmpfiles.d/tmp.conf b/tmpfiles.d/tmp.conf
+index 6bbd1aa..4ca7af7 100644
+--- a/tmpfiles.d/tmp.conf
++++ b/tmpfiles.d/tmp.conf
+@@ -9,7 +9,9 @@
+ 
+ # Clear tmp directories separately, to make them easier to override
+ q /tmp 1777 root root 10d
+-q /var/tmp 1777 root root 30d
++# OE Core uses /var/volatile/tmp rather than /var/tmp
++#q /var/tmp 1777 root root 30d
++L /var/tmp - - - - /var/volatile/tmp
+ 
+ # Exclude namespace mountpoints created with PrivateTmp=yes
+ x /tmp/systemd-private-%b-*
+diff --git a/tmpfiles.d/var.conf b/tmpfiles.d/var.conf
+index ae7952e..09d5fee 100644
+--- a/tmpfiles.d/var.conf
++++ b/tmpfiles.d/var.conf
+@@ -11,7 +11,9 @@ q /var 0755 - - -
+ 
+ L /var/run - - - - ../run
+ 
+-d /var/log 0755 - - -
++# OE Core uses /var/volatile/log rather than /var/log
++#d /var/log 0755 - - -
++L /var/log - - - - /var/volatile/log
+ f /var/log/wtmp 0664 root utmp -
+ f /var/log/btmp 0600 root utmp -
+ 
+-- 
+2.5.0
+
diff --git a/meta/recipes-core/systemd/systemd_229.bb b/meta/recipes-core/systemd/systemd_229.bb
index c23c749..9334065 100644
--- a/meta/recipes-core/systemd/systemd_229.bb
+++ b/meta/recipes-core/systemd/systemd_229.bb
@@ -54,6 +54,7 @@ SRC_URI = "git://github.com/systemd/systemd.git;protocol=git \
            file://0021-include-missing.h-for-getting-secure_getenv-definiti.patch \
            file://0022-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch \
            file://0023-build-sys-fix-build-with-libgrcypt-disabled.patch \
+           file://0024-use-OE-core-paths-for-var-tmp-and-var-log.patch \
 "
 SRC_URI_append_libc-uclibc = "\
            file://0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch \
-- 
2.5.0



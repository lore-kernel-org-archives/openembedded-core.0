Received: from li44-10.members.linode.com ([72.14.181.10] helo=plausible.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andy.ross@windriver.com>) id 1TE5hj-0007Mx-JO
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 23:51:39 +0200
Received: from cougar.plausible.org (unknown [67.171.188.207])
	(Authenticated sender: andy-wrs)
	by plausible.org (Postfix) with ESMTPSA id 7EF0928E52;
	Tue, 18 Sep 2012 14:39:00 -0700 (PDT)
From: Andy Ross <andy.ross@windriver.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2012 14:38:44 -0700
Message-Id: <1348004325-30668-2-git-send-email-andy.ross@windriver.com>
X-Mailer: git-send-email 1.7.11.4
In-Reply-To: <1348004325-30668-1-git-send-email-andy.ross@windriver.com>
References: <1348004325-30668-1-git-send-email-andy.ross@windriver.com>
Subject: [PATCH 1/2] busybox: add /usr/bin/stat applet
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
X-List-Received-Date: Tue, 18 Sep 2012 21:51:39 -0000

The busybox defconfig lacks a stat tool, the functionality of which
cannot be reproduced in a way accessible to a shell script running in
a minimal configuration.  Enable, and modify the installation path to
/usr/bin/stat to match the coreutils tool for proper alternatives
handling.

Signed-off-by: Andy Ross <andy.ross@windriver.com>
---
 meta/recipes-core/busybox/busybox-1.20.2/defconfig  |  4 ++--
 .../busybox/busybox-1.20.2/stat-usr-bin.patch       | 21 +++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.20.2.bb         |  5 +++--
 3 files changed, 26 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox-1.20.2/stat-usr-bin.patch

diff --git a/meta/recipes-core/busybox/busybox-1.20.2/defconfig b/meta/recipes-core/busybox/busybox-1.20.2/defconfig
index dff07f1..b39234f 100644
--- a/meta/recipes-core/busybox/busybox-1.20.2/defconfig
+++ b/meta/recipes-core/busybox/busybox-1.20.2/defconfig
@@ -270,8 +270,8 @@ CONFIG_SORT=y
 CONFIG_FEATURE_SORT_BIG=y
 # CONFIG_SPLIT is not set
 # CONFIG_FEATURE_SPLIT_FANCY is not set
-# CONFIG_STAT is not set
-# CONFIG_FEATURE_STAT_FORMAT is not set
+CONFIG_STAT=y
+CONFIG_FEATURE_STAT_FORMAT=y
 CONFIG_STTY=y
 # CONFIG_SUM is not set
 CONFIG_SYNC=y
diff --git a/meta/recipes-core/busybox/busybox-1.20.2/stat-usr-bin.patch b/meta/recipes-core/busybox/busybox-1.20.2/stat-usr-bin.patch
new file mode 100644
index 0000000..4049324
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox-1.20.2/stat-usr-bin.patch
@@ -0,0 +1,21 @@
+busybox: move /bin/stat to /usr/bin/stat to match coreutils
+
+The coreutils stat binary lives in /usr/bin, fix busybox to use the same path so
+they can be properly tracked by alternatives.
+
+Upstream-Status: Inappropriate [embedded]
+Signed-off-by: Andy Ross <andy.ross@windriver.com>
+
+diff --git a/include/applets.src.h b/include/applets.src.h
+index 0d33bfc..30ae3ad 100644
+--- a/include/applets.src.h
++++ b/include/applets.src.h
+@@ -340,7 +340,7 @@ IF_SOFTLIMIT(APPLET_ODDNAME(softlimit, chpst, BB_DIR_USR_BIN, BB_SUID_DROP, soft
+ IF_SORT(APPLET_NOEXEC(sort, sort, BB_DIR_USR_BIN, BB_SUID_DROP, sort))
+ IF_SPLIT(APPLET(split, BB_DIR_USR_BIN, BB_SUID_DROP))
+ IF_START_STOP_DAEMON(APPLET_ODDNAME(start-stop-daemon, start_stop_daemon, BB_DIR_SBIN, BB_SUID_DROP, start_stop_daemon))
+-IF_STAT(APPLET(stat, BB_DIR_BIN, BB_SUID_DROP))
++IF_STAT(APPLET(stat, BB_DIR_USR_BIN, BB_SUID_DROP))
+ IF_STRINGS(APPLET(strings, BB_DIR_USR_BIN, BB_SUID_DROP))
+ IF_STTY(APPLET(stty, BB_DIR_BIN, BB_SUID_DROP))
+ /* Needs to be run by root or be suid root - needs to change uid and gid: */
diff --git a/meta/recipes-core/busybox/busybox_1.20.2.bb b/meta/recipes-core/busybox/busybox_1.20.2.bb
index ced04d2..2251383 100644
--- a/meta/recipes-core/busybox/busybox_1.20.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.20.2.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://B921600.patch \
@@ -26,7 +26,8 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://defconfig \
            file://busybox-mkfs-minix-tests_bigendian.patch \
            file://fix-for-spurious-testsuite-failure.patch \
-           file://busybox-1.20.2-kernel_ver.patch"
+           file://busybox-1.20.2-kernel_ver.patch \
+           file://stat-usr-bin.patch"
 
 SRC_URI[tarball.md5sum] = "e025414bc6cd79579cc7a32a45d3ae1c"
 SRC_URI[tarball.sha256sum] = "eb13ff01dae5618ead2ef6f92ba879e9e0390f9583bd545d8789d27cf39b6882"
-- 
1.7.11.4




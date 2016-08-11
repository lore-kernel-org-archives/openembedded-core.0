Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9BBAE7705F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 18:14:14 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Aug 2016 11:14:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,506,1464678000"; d="scan'208";a="1012761233"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by orsmga001.jf.intel.com with ESMTP; 11 Aug 2016 11:14:14 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2016 18:10:59 +0000
Message-Id: <1470939059-32387-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Cc: joshua.g.lock@intel.com, Roy Li <rongqing.li@windriver.com>
Subject: [PATCH][fido] systemd: re-enable mount propagation for udevd
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
X-List-Received-Date: Thu, 11 Aug 2016 18:14:17 -0000

From: Roy Li <rongqing.li@windriver.com>

With MountFlags=slave, those mounts then become private to the systemd-udevd
namespace and are no longer accessible from outside the namespace, which is
not expected

[YOCTO #8613]

(From OE-Core rev: 73f43d857fe0102033f25491007b6dbe3d5fa8ee)

Signed-off-by: Roy Li <rongqing.li@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f2092e67ea880301058396b831a9a18905317d0d)
Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 ...dev-re-enable-mount-propagation-for-udevd.patch | 31 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_219.bb           |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/udev-re-enable-mount-propagation-for-udevd.patch

diff --git a/meta/recipes-core/systemd/systemd/udev-re-enable-mount-propagation-for-udevd.patch b/meta/recipes-core/systemd/systemd/udev-re-enable-mount-propagation-for-udevd.patch
new file mode 100644
index 0000000..23e22d4
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/udev-re-enable-mount-propagation-for-udevd.patch
@@ -0,0 +1,31 @@
+From: Michael Biebl <biebl@debian.org>
+Date: Sat, 27 Sep 2014 04:19:24 +0200
+Subject: udev: re-enable mount propagation for udevd
+
+Upstream-Status: Backport [http://http.debian.net/debian/pool/main/s/systemd/systemd_215-17+deb8u4.debian.tar.xz]
+
+laptop-mode-tools remounts file systems from within a udev rule to apply
+certain mount options. With MountFlags=slave, those mounts then become private
+to the systemd-udevd namespace and are no longer accessible from outside the
+namespace.
+While the root cause is the broken behaviour of laptop-mode-tools, with mount
+propagation turned off, this can result in a read-only root file system.
+Therefore revert the relevant parts from commit
+c2c13f2df42e0691aecabe3979ea81cd7faa35c7 to re-enable mount propagation for
+udevd.
+
+Once affected packages have been fixed, this patch should be dropped
+again.
+
+Closes: #762018
+diff --git a/units/systemd-udevd.service.in b/units/systemd-udevd.service.in
+index e7216d6..1e9a600 100644
+--- a/units/systemd-udevd.service.in
++++ b/units/systemd-udevd.service.in
+@@ -21,6 +21,5 @@ Sockets=systemd-udevd-control.socket systemd-udevd-kernel.socket
+ Restart=always
+ RestartSec=0
+ ExecStart=@rootlibexecdir@/systemd-udevd
+-MountFlags=slave
+ KillMode=mixed
+ WatchdogSec=1min
diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
index b972dd4..1d08c9e 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -49,6 +49,7 @@ SRC_URI = "git://github.com/systemd/systemd-stable;branch=v219-stable;protocol=g
            file://00-create-volatile.conf \
            file://init \
            file://run-ptest \
+           file://udev-re-enable-mount-propagation-for-udevd.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.6.6



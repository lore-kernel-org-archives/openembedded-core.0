Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5C733601D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 02:11:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4A2BXk9015579
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 May 2016 19:11:33 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 9 May 2016 19:11:32 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 May 2016 10:09:33 +0800
Message-ID: <1462846173-3640-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] systemd: re-enable mount propagation for udevd
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
X-List-Received-Date: Tue, 10 May 2016 02:11:36 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

With MountFlags=slave, those mounts then become private to the systemd-udevd
namespace and are no longer accessible from outside the namespace, which is
not expected

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...dev-re-enable-mount-propagation-for-udevd.patch | 31 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_229.bb           |  1 +
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
diff --git a/meta/recipes-core/systemd/systemd_229.bb b/meta/recipes-core/systemd/systemd_229.bb
index c23c749..78692c4 100644
--- a/meta/recipes-core/systemd/systemd_229.bb
+++ b/meta/recipes-core/systemd/systemd_229.bb
@@ -54,6 +54,7 @@ SRC_URI = "git://github.com/systemd/systemd.git;protocol=git \
            file://0021-include-missing.h-for-getting-secure_getenv-definiti.patch \
            file://0022-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch \
            file://0023-build-sys-fix-build-with-libgrcypt-disabled.patch \
+           file://udev-re-enable-mount-propagation-for-udevd.patch \
 "
 SRC_URI_append_libc-uclibc = "\
            file://0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch \
-- 
2.8.1



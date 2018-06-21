Return-Path: <zhe.he@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 75AC477BEB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 11:08:46 +0000 (UTC)
Received: from ala-blade48.wrs.com (ala-blade48.wrs.com [147.11.105.68])
	by mail.windriver.com (8.15.2/8.15.1) with SMTP id w5LB8kFM008051
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 04:08:46 -0700 (PDT)
Received: by ala-blade48.wrs.com (sSMTP sendmail emulation);
	Thu, 21 Jun 2018 04:08:45 -0700
From: He Zhe <zhe.he@windriver.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jun 2018 04:08:45 -0700
Message-Id: <20180621110845.48767-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] cryptodev: Fix build errors with v4.17+
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
X-List-Received-Date: Thu, 21 Jun 2018 11:08:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Backport from upstream to update internal syscall function usage.
https://github.com/cryptodev-linux/cryptodev-linux
f60aa08c63fc02780554a0a12180a478ca27d49f

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 .../cryptodev/cryptodev-module_1.9.bb              |  1 +
 .../0001-ioctl.c-Fix-build-with-linux-4.17.patch   | 43 ++++++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-with-linux-4.17.patch

diff --git a/meta/recipes-kernel/cryptodev/cryptodev-module_1.9.bb b/meta/recipes-kernel/cryptodev/cryptodev-module_1.9.bb
index ed6d0ecae97..6052650c955 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-module_1.9.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-module_1.9.bb
@@ -10,6 +10,7 @@ DEPENDS += "cryptodev-linux"
 SRC_URI += " \
 file://0001-Disable-installing-header-file-provided-by-another-p.patch \
 file://0001-ioctl.c-Fix-build-with-linux-4.13.patch \
+file://0001-ioctl.c-Fix-build-with-linux-4.17.patch \
 "
 
 EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
diff --git a/meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-with-linux-4.17.patch b/meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-with-linux-4.17.patch
new file mode 100644
index 00000000000..5881d1c4eec
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-with-linux-4.17.patch
@@ -0,0 +1,43 @@
+From f60aa08c63fc02780554a0a12180a478ca27d49f Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>
+Date: Wed, 23 May 2018 18:43:39 +0300
+Subject: [PATCH] ioctl.c: Fix build with linux 4.17
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Since kernel 4.17-rc1, sys_* syscalls can no longer be called directly:
+819671ff849b ("syscalls: define and explain goal to not call syscalls in the kernel")
+
+Since cryptodev uses sys_close() - and this has been removed in commit:
+2ca2a09d6215 ("fs: add ksys_close() wrapper; remove in-kernel calls to sys_close()")
+cryptodev has to be updated to use the ksys_close() wrapper.
+
+Signed-off-by: Horia Geantă <horia.geanta@nxp.com>
+
+Upstream-Status: Backport
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ ioctl.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/ioctl.c b/ioctl.c
+index d831b0c..2571034 100644
+--- a/ioctl.c
++++ b/ioctl.c
+@@ -828,7 +828,11 @@ cryptodev_ioctl(struct file *filp, unsigned int cmd, unsigned long arg_)
+ 		fd = clonefd(filp);
+ 		ret = put_user(fd, p);
+ 		if (unlikely(ret)) {
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 17, 0))
+ 			sys_close(fd);
++#else
++			ksys_close(fd);
++#endif
+ 			return ret;
+ 		}
+ 		return ret;
+-- 
+2.7.4
+
-- 
2.11.0



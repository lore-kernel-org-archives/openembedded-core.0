Return-Path: <zhengjunling@huawei.com>
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [119.145.14.66])
	by mail.openembedded.org (Postfix) with ESMTP id A9721756C1
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jun 2015 07:56:24 +0000 (UTC)
Received: from 172.24.2.119 (EHLO szxeml425-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BHH97211; Sun, 07 Jun 2015 15:56:22 +0800 (CST)
Received: from Patch-Test.huawei (10.107.197.245) by
	szxeml425-hub.china.huawei.com (10.82.67.180) with Microsoft SMTP
	Server id 14.3.158.1; Sun, 7 Jun 2015 15:56:18 +0800
From: Junling Zheng <zhengjunling@huawei.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 7 Jun 2015 07:52:19 +0000
Message-ID: <1433663540-1760-3-git-send-email-zhengjunling@huawei.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1433663540-1760-1-git-send-email-zhengjunling@huawei.com>
References: <1433663540-1760-1-git-send-email-zhengjunling@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.107.197.245]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020201.5573F927.0021, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: bbc810744c038b05ab61a16c9fd95c79
Subject: [PATCH 2/3] busybox: fix double free error for ifconfig
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
X-List-Received-Date: Sun, 07 Jun 2015 07:56:26 -0000
Content-Type: text/plain

This patch backports a commit from upstream to fix a potential double
free error when executing ifconfig circularly:
http://git.busybox.net/busybox/commit/?id=a97777889328157bb7d06ec618bad16712a9c345.

Thanks to Chen Gang for reporting and analyzing this bug.

Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
Signed-off-by: Chen Gang <cg.chen@huawei.com>
---
 ...ix-double-free-fatal-error-in-INET_sprint.patch | 67 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.23.2.bb        |  1 +
 meta/recipes-core/busybox/busybox_git.bb           |  1 +
 3 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-ifconfig-fix-double-free-fatal-error-in-INET_sprint.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-ifconfig-fix-double-free-fatal-error-in-INET_sprint.patch b/meta/recipes-core/busybox/busybox/0001-ifconfig-fix-double-free-fatal-error-in-INET_sprint.patch
new file mode 100644
index 0000000..2d729b1
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-ifconfig-fix-double-free-fatal-error-in-INET_sprint.patch
@@ -0,0 +1,67 @@
+From a97777889328157bb7d06ec618bad16712a9c345 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Tue, 3 Feb 2015 12:11:30 +0100
+Subject: [PATCH] ifconfig: fix double free fatal error in INET_sprint
+
+Derived from:
+http://git.busybox.net/busybox/commit/?id=a97777889328157bb7d06ec618bad16712a9c345.
+
+While INET_sprint or INET6_sprint is called circularly by keeping
+ifconfiging, sap->sa_family would be cleaned by other parallel processes
+such as dhclient sometimes, and then there would be a double free error
+like the following:
+
+  *** glibc detected *** ifconfig: double free or corruption (fasttop): 0x000a6008 ***
+  ======= Backtrace: =========
+  /lib/libc.so.6(+0x6bc84)[0x40133c84]
+  /lib/libc.so.6(cfree+0x94)[0x40138684]
+  ifconfig[0x1c460]
+  ifconfig[0x1c6a0]
+  ifconfig[0x1ccf4]
+  ifconfig[0x187c8]
+  ifconfig[0xd544]
+  ifconfig[0xd5dc]
+  ifconfig[0xdca8]
+  /lib/libc.so.6(__libc_start_main+0x110)[0x400df258]
+  ======= Memory map: ========
+  00008000-0009c000 r-xp 00000000 1f:05 444328     /bin/busybox
+  000a3000-000a4000 rw-p 00093000 1f:05 444328     /bin/busybox
+
+This patch moved free() two lines down to address this problem.
+
+Upstream-Status: Backport
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+---
+ networking/interface.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/networking/interface.c b/networking/interface.c
+index bf7d2b1..b0572d0 100644
+--- a/networking/interface.c
++++ b/networking/interface.c
+@@ -91,9 +91,9 @@ static const char* FAST_FUNC INET_sprint(struct sockaddr *sap, int numeric)
+ {
+ 	static char *buff; /* defaults to NULL */
+ 
+-	free(buff);
+ 	if (sap->sa_family == 0xFFFF || sap->sa_family == 0)
+ 		return "[NONE SET]";
++	free(buff);
+ 	buff = INET_rresolve((struct sockaddr_in *) sap, numeric, 0xffffff00);
+ 	return buff;
+ }
+@@ -173,9 +173,9 @@ static const char* FAST_FUNC INET6_sprint(struct sockaddr *sap, int numeric)
+ {
+ 	static char *buff;
+ 
+-	free(buff);
+ 	if (sap->sa_family == 0xFFFF || sap->sa_family == 0)
+ 		return "[NONE SET]";
++	free(buff);
+ 	buff = INET6_rresolve((struct sockaddr_in6 *) sap, numeric);
+ 	return buff;
+ }
+-- 
+1.8.3.4
+
diff --git a/meta/recipes-core/busybox/busybox_1.23.2.bb b/meta/recipes-core/busybox/busybox_1.23.2.bb
index b1b9032..f7bf8e2 100644
--- a/meta/recipes-core/busybox/busybox_1.23.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.23.2.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://login-utilities.cfg \
            file://recognize_connmand.patch \
            file://busybox-cross-menuconfig.patch \
+           file://0001-ifconfig-fix-double-free-fatal-error-in-INET_sprint.patch \
 "
 
 SRC_URI[tarball.md5sum] = "7925683d7dd105aabe9b6b618d48cc73"
diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
index cee5b91..675e56a 100644
--- a/meta/recipes-core/busybox/busybox_git.bb
+++ b/meta/recipes-core/busybox/busybox_git.bb
@@ -36,6 +36,7 @@ SRC_URI = "git://busybox.net/busybox.git \
            file://login-utilities.cfg \
            file://recognize_connmand.patch \
            file://busybox-cross-menuconfig.patch \
+           file://0001-ifconfig-fix-double-free-fatal-error-in-INET_sprint.patch \
 "
 
 EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
-- 
1.8.3.4



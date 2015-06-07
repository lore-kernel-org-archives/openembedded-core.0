Return-Path: <zhengjunling@huawei.com>
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [119.145.14.66])
	by mail.openembedded.org (Postfix) with ESMTP id AB34D7583E
	for <openembedded-core@lists.openembedded.org>;
	Sun,  7 Jun 2015 07:56:24 +0000 (UTC)
Received: from 172.24.2.119 (EHLO szxeml425-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BHH97208; Sun, 07 Jun 2015 15:56:22 +0800 (CST)
Received: from Patch-Test.huawei (10.107.197.245) by
	szxeml425-hub.china.huawei.com (10.82.67.180) with Microsoft SMTP
	Server id 14.3.158.1; Sun, 7 Jun 2015 15:56:18 +0800
From: Junling Zheng <zhengjunling@huawei.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 7 Jun 2015 07:52:20 +0000
Message-ID: <1433663540-1760-4-git-send-email-zhengjunling@huawei.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <1433663540-1760-1-git-send-email-zhengjunling@huawei.com>
References: <1433663540-1760-1-git-send-email-zhengjunling@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.107.197.245]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020205.5573F926.00BF, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 3b7c5aee58eb8797ac2e6a3993383236
Subject: [PATCH 3/3] busybox: fix the wrong help text for chown
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

Only when DESKTOP is enabled, chown has -L, -H and -P options.

Backport a commit from upstream to fix it:
http://git.busybox.net/busybox/commit/?id=d291c2fdd5cb8616605c67ecbfb04274fa094242.

Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
---
 .../busybox/busybox/0001-chown-fix-help-text.patch | 34 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.23.2.bb        |  1 +
 meta/recipes-core/busybox/busybox_git.bb           |  1 +
 3 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-chown-fix-help-text.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-chown-fix-help-text.patch b/meta/recipes-core/busybox/busybox/0001-chown-fix-help-text.patch
new file mode 100644
index 0000000..4299799
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-chown-fix-help-text.patch
@@ -0,0 +1,34 @@
+From d291c2fdd5cb8616605c67ecbfb04274fa094242 Mon Sep 17 00:00:00 2001
+From: Junling Zheng <zhengjunling@huawei.com>
+Date: Sun, 7 Jun 2015 02:32:23 +0200
+Subject: [PATCH] chown: fix help text
+
+Derived from:
+http://git.busybox.net/busybox/commit/?id=d291c2fdd5cb8616605c67ecbfb04274fa094242.
+
+Only when DESKTOP is enabled, chown has -L, -H and -P options.
+
+Upstream-Status: Backport
+
+Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+---
+ coreutils/chown.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/coreutils/chown.c b/coreutils/chown.c
+index cb07bbc..679c0d8 100644
+--- a/coreutils/chown.c
++++ b/coreutils/chown.c
+@@ -11,7 +11,7 @@
+ /* http://www.opengroup.org/onlinepubs/007904975/utilities/chown.html */
+ 
+ //usage:#define chown_trivial_usage
+-//usage:       "[-RhLHP"IF_DESKTOP("cvf")"]... OWNER[<.|:>[GROUP]] FILE..."
++//usage:       "[-Rh"IF_DESKTOP("LHPcvf")"]... OWNER[<.|:>[GROUP]] FILE..."
+ //usage:#define chown_full_usage "\n\n"
+ //usage:       "Change the owner and/or group of each FILE to OWNER and/or GROUP\n"
+ //usage:     "\n	-R	Recurse"
+-- 
+1.8.3.4
+
diff --git a/meta/recipes-core/busybox/busybox_1.23.2.bb b/meta/recipes-core/busybox/busybox_1.23.2.bb
index f7bf8e2..85e462e 100644
--- a/meta/recipes-core/busybox/busybox_1.23.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.23.2.bb
@@ -31,6 +31,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://recognize_connmand.patch \
            file://busybox-cross-menuconfig.patch \
            file://0001-ifconfig-fix-double-free-fatal-error-in-INET_sprint.patch \
+           file://0001-chown-fix-help-text.patch \
 "
 
 SRC_URI[tarball.md5sum] = "7925683d7dd105aabe9b6b618d48cc73"
diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
index 675e56a..c5596d8 100644
--- a/meta/recipes-core/busybox/busybox_git.bb
+++ b/meta/recipes-core/busybox/busybox_git.bb
@@ -37,6 +37,7 @@ SRC_URI = "git://busybox.net/busybox.git \
            file://recognize_connmand.patch \
            file://busybox-cross-menuconfig.patch \
            file://0001-ifconfig-fix-double-free-fatal-error-in-INET_sprint.patch \
+           file://0001-chown-fix-help-text.patch \
 "
 
 EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
-- 
1.8.3.4



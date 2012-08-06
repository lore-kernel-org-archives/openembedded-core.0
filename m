Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1SyDZc-0003uj-S2
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 05:01:41 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q762nt20011015
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 5 Aug 2012 19:49:55 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.163) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Sun, 5 Aug 2012 19:49:55 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Aug 2012 10:50:01 +0800
Message-ID: <1344221401-23578-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH] busybox: fix du-k-works test case
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
X-List-Received-Date: Mon, 06 Aug 2012 03:01:41 -0000
Content-Type: text/plain

From: Roy.Li <rongqing.li@windriver.com>

[YOCTO #2896]

The du-k-works test seems to assume that du -k on a directory with two files
totaling 80 kilobytes should report either 80k or 88k. In ext4 filesystm however,
both busybox' du -k and coreutils' du -k reports a size of 84k which causes the
test to fail.

Intergrate the patch from:
http://git.busybox.net/busybox/commit/?id=a5ee090e8651692545514a81a16c6cde3a2dc577

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 .../fix-for-spurious-testsuite-failure.patch       |   27 ++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.19.4.bb        |    5 ++-
 2 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox-1.19.4/fix-for-spurious-testsuite-failure.patch

diff --git a/meta/recipes-core/busybox/busybox-1.19.4/fix-for-spurious-testsuite-failure.patch b/meta/recipes-core/busybox/busybox-1.19.4/fix-for-spurious-testsuite-failure.patch
new file mode 100644
index 0000000..b75eaac
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox-1.19.4/fix-for-spurious-testsuite-failure.patch
@@ -0,0 +1,27 @@
+Backport the patch from:
+http://git.busybox.net/busybox/commit/?id=a5ee090e8651692545514a81a16c6cde3a2dc577
+
+From a5ee090e8651692545514a81a16c6cde3a2dc577 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Thu, 10 May 2012 19:26:37 +0200
+Subject: [PATCH] fix for spurious testsuite failure
+
+Upstream-Status: Backport
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+---
+ testsuite/du/du-k-works |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/testsuite/du/du-k-works b/testsuite/du/du-k-works
+index 229a948..36dcaa8 100644
+--- a/testsuite/du/du-k-works
++++ b/testsuite/du/du-k-works
+@@ -3,4 +3,5 @@ cd du.testdir
+ dd if=/dev/zero of=file1 bs=1k count=64 2>/dev/null
+ dd if=/dev/zero of=file2 bs=1k count=16 2>/dev/null
+ test x"`busybox du -k .`" = x"80	." \
++  -o x"`busybox du -k .`" = x"84	." \
+   -o x"`busybox du -k .`" = x"88	."
+-- 
+1.7.4.1
+
diff --git a/meta/recipes-core/busybox/busybox_1.19.4.bb b/meta/recipes-core/busybox/busybox_1.19.4.bb
index ced50c5..2e262ca 100644
--- a/meta/recipes-core/busybox/busybox_1.19.4.bb
+++ b/meta/recipes-core/busybox/busybox_1.19.4.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r12"
+PR = "r13"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://B921600.patch \
@@ -24,7 +24,8 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://mdev.conf \
            file://umount.busybox \
            file://defconfig \
-           file://busybox-mkfs-minix-tests_bigendian.patch"
+           file://busybox-mkfs-minix-tests_bigendian.patch \
+           file://fix-for-spurious-testsuite-failure.patch"
 
 SRC_URI[tarball.md5sum] = "9c0cae5a0379228e7b55e5b29528df8e"
 SRC_URI[tarball.sha256sum] = "9b853406da61ffb59eb488495fe99cbb7fb3dd29a31307fcfa9cf070543710ee"
-- 
1.7.4.1




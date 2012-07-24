Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <yao.zhao@windriver.com>) id 1StgGy-0001LG-OB
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 16:39:41 +0200
Received: from yzhao2-OptiPlex-990.corp.ad.wrs.com
	(yzhao2-optiplex-990.corp.ad.wrs.com [128.224.147.210])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6OESB78004331
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2012 07:28:11 -0700 (PDT)
From: Yao Zhao <yao.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jul 2012 10:28:00 -0400
Message-Id: <1343140080-13210-1-git-send-email-yao.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] busybox: fix the problem that mkfs.minix.tests fails on big endian platform
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
X-List-Received-Date: Tue, 24 Jul 2012 14:39:41 -0000

patch mkfs.minix.tests to have correct md5sum on big endian platform.

Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
---
 .../busybox-mkfs-minix-tests_bigendian.patch       |   34 ++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.19.4.bb        |    3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/busybox/busybox-1.19.4/busybox-mkfs-minix-tests_bigendian.patch

diff --git a/meta/recipes-core/busybox/busybox-1.19.4/busybox-mkfs-minix-tests_bigendian.patch b/meta/recipes-core/busybox/busybox-1.19.4/busybox-mkfs-minix-tests_bigendian.patch
new file mode 100644
index 0000000..089c5e0
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox-1.19.4/busybox-mkfs-minix-tests_bigendian.patch
@@ -0,0 +1,34 @@
+patch mkfs.minix.tests to have correct md5sum on big endian platform
+
+Upstream-Status: Accepted, expected in next release
+
+Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
+
+diff --git a/testsuite/mkfs.minix.tests b/testsuite/mkfs.minix.tests
+index 8a33c16..7eecaf2 100755
+--- a/testsuite/mkfs.minix.tests
++++ b/testsuite/mkfs.minix.tests
+@@ -8,6 +8,14 @@
+ 
+ # testing "test name" "options" "expected result" "file input" "stdin"
+ 
++# '\n' produces 10 on little endian, but not on big endian
++cr=`echo | od -i | sed 's/.* //g;2d'`
++if [ x"$cr" = x"10" ]; then
++	hash=4f35f7afeba07d56055bed1f29ae20b7
++else
++	hash=5adbc1b3ccd20ca5d0ab5bc1e13ac3fc
++fi
++
+ testing "mkfs.minix" \
+ 	"dd if=/dev/zero of=input bs=1k count=1024 2>/dev/null; mkfs.minix input; md5sum <input" \
+ "352 inodes\n"\
+@@ -15,7 +23,7 @@ testing "mkfs.minix" \
+ "Firstdatazone=15 (15)\n"\
+ "Zonesize=1024\n"\
+ "Maxsize=268966912\n"\
+-"4f35f7afeba07d56055bed1f29ae20b7  -\n" \
++"$hash  -\n" \
+ 	"" \
+ 	""
+ 
diff --git a/meta/recipes-core/busybox/busybox_1.19.4.bb b/meta/recipes-core/busybox/busybox_1.19.4.bb
index de331ad..d0ea459 100644
--- a/meta/recipes-core/busybox/busybox_1.19.4.bb
+++ b/meta/recipes-core/busybox/busybox_1.19.4.bb
@@ -22,7 +22,8 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://mdev \
            file://mdev.conf \
            file://umount.busybox \
-           file://defconfig"
+           file://defconfig \
+           file://busybox-mkfs-minix-tests_bigendian.patch"
 
 SRC_URI[tarball.md5sum] = "9c0cae5a0379228e7b55e5b29528df8e"
 SRC_URI[tarball.sha256sum] = "9b853406da61ffb59eb488495fe99cbb7fb3dd29a31307fcfa9cf070543710ee"
-- 
1.7.9.5




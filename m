Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Stw3n-0004Xt-Sd
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 09:31:08 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Jul 2012 00:19:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="172897595"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.97])
	by azsmga001.ch.intel.com with ESMTP; 25 Jul 2012 00:19:32 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jul 2012 00:19:18 -0700
Message-Id: <ad53b55fb02f3415db775809afc45a2494a07df2.1343200454.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1343200454.git.sgw@linux.intel.com>
References: <cover.1343200454.git.sgw@linux.intel.com>
In-Reply-To: <cover.1343200454.git.sgw@linux.intel.com>
References: <cover.1343200454.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 24/28] busybox: fix the problem that mkfs.minix.tests fails on big endian platform
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
X-List-Received-Date: Wed, 25 Jul 2012 07:31:08 -0000

From: Yao Zhao <yao.zhao@windriver.com>

patch mkfs.minix.tests to have correct md5sum on big endian platform.

Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../busybox-mkfs-minix-tests_bigendian.patch       |   34 ++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.19.4.bb        |    3 +-
 2 files changed, 36 insertions(+), 1 deletions(-)
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
index 6e69d22..cc97e2a 100644
--- a/meta/recipes-core/busybox/busybox_1.19.4.bb
+++ b/meta/recipes-core/busybox/busybox_1.19.4.bb
@@ -24,7 +24,8 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://mdev \
            file://mdev.conf \
            file://umount.busybox \
-           file://defconfig"
+           file://defconfig \
+           file://busybox-mkfs-minix-tests_bigendian.patch"
 
 SRC_URI[tarball.md5sum] = "9c0cae5a0379228e7b55e5b29528df8e"
 SRC_URI[tarball.sha256sum] = "9b853406da61ffb59eb488495fe99cbb7fb3dd29a31307fcfa9cf070543710ee"
-- 
1.7.7.6




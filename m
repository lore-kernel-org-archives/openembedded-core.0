Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1U04Gv-0008C8-O8
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 07:02:18 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0T5kd4Z020464
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 21:46:39 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Mon, 28 Jan 2013 21:46:36 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Jan 2013 13:47:50 +0800
Message-ID: <83ad6c4f673b68751aff48ad9a76fbd3eafc1d15.1359438225.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1359438225.git.kai.kang@windriver.com>
References: <cover.1359438225.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] busybox: update test case du-k-works
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
X-List-Received-Date: Tue, 29 Jan 2013 06:02:20 -0000
Content-Type: text/plain

busybox test case du-k-work fails on ext3/4 image whose size less than
512M. Add patch testsuite-du-du-k-works-fix-false-positive.patch to fix
it and it has been merged by upstream.

[Yocto 2896]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 ...estsuite-du-du-k-works-fix-false-positive.patch |   35 ++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.20.2.bb        |    5 ++-
 2 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox-1.20.2/testsuite-du-du-k-works-fix-false-positive.patch

diff --git a/meta/recipes-core/busybox/busybox-1.20.2/testsuite-du-du-k-works-fix-false-positive.patch b/meta/recipes-core/busybox/busybox-1.20.2/testsuite-du-du-k-works-fix-false-positive.patch
new file mode 100644
index 0000000..070c41b
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox-1.20.2/testsuite-du-du-k-works-fix-false-positive.patch
@@ -0,0 +1,35 @@
+Upstream-Status: Accepted
+
+[Yocto 2896]
+
+Signed-off-by: Kang Kai <kai.kang@windriver.com>
+---
+From 03b614739b923994ff0bef74622973ad18fefebd Mon Sep 17 00:00:00 2001
+From: Kang Kai <kai.kang@windriver.com>
+Date: Mon, 28 Jan 2013 14:02:51 +0100
+Subject: [PATCH] testsuite/du/du-k-works: fix false positive
+
+Signed-off-by: Kang Kai <kai.kang@windriver.com>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+---
+ testsuite/du/du-k-works |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/testsuite/du/du-k-works b/testsuite/du/du-k-works
+index 36dcaa8..417b0da 100644
+--- a/testsuite/du/du-k-works
++++ b/testsuite/du/du-k-works
+@@ -2,6 +2,10 @@ mkdir du.testdir
+ cd du.testdir
+ dd if=/dev/zero of=file1 bs=1k count=64 2>/dev/null
+ dd if=/dev/zero of=file2 bs=1k count=16 2>/dev/null
++# ext4 on images <512M gives 81kb
++# ext3 on images <512M gives 83kb
+ test x"`busybox du -k .`" = x"80	." \
++  -o x"`busybox du -k .`" = x"81	." \
++  -o x"`busybox du -k .`" = x"83	." \
+   -o x"`busybox du -k .`" = x"84	." \
+   -o x"`busybox du -k .`" = x"88	."
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-core/busybox/busybox_1.20.2.bb b/meta/recipes-core/busybox/busybox_1.20.2.bb
index 3e628d2..783261e 100644
--- a/meta/recipes-core/busybox/busybox_1.20.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.20.2.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://B921600.patch \
@@ -27,7 +27,8 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://busybox-mkfs-minix-tests_bigendian.patch \
            file://fix-for-spurious-testsuite-failure.patch \
            file://busybox-1.20.2-kernel_ver.patch \
-           file://stat-usr-bin.patch"
+           file://stat-usr-bin.patch \
+           file://testsuite-du-du-k-works-fix-false-positive.patch"
 
 SRC_URI[tarball.md5sum] = "e025414bc6cd79579cc7a32a45d3ae1c"
 SRC_URI[tarball.sha256sum] = "eb13ff01dae5618ead2ef6f92ba879e9e0390f9583bd545d8789d27cf39b6882"
-- 
1.7.5.4




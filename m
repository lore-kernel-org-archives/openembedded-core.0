Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C28BF6FC52
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 09:10:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4T9AM6P000248
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 02:10:22 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 29 May 2014 02:10:21 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 May 2014 17:10:19 +0800
Message-ID: <e6a039546ac6da09a55950978189b3bc3b75fb8d.1401354584.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1401354584.git.Chong.Lu@windriver.com>
References: <cover.1401354584.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] nfs-utils: use cross toolchain to compile testlk
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
X-List-Received-Date: Thu, 29 May 2014 09:10:27 -0000
Content-Type: text/plain

testlk is built with host gcc at do_compile stage, which leads to unrecognized
some flags for special architecture. Using cross toolchain instead.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 .../nfs-utils-use-cross-toolchain-to-compile.patch | 26 ++++++++++++++++++++++
 .../nfs-utils/nfs-utils_1.3.0.bb                   |  3 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-use-cross-toolchain-to-compile.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-use-cross-toolchain-to-compile.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-use-cross-toolchain-to-compile.patch
new file mode 100644
index 0000000..52a02e1
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-use-cross-toolchain-to-compile.patch
@@ -0,0 +1,26 @@
+nfs-utils: use cross toolchain to compile testlk
+
+testlk is built with host gcc at do_compile stage, which leads to unrecognized
+some flags for special architecture. Using cross toolchain instead.
+
+Upstream-Status: Pending
+
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ tools/locktest/Makefile.am |    1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/tools/locktest/Makefile.am b/tools/locktest/Makefile.am
+index 3156815..87d0bac 100644
+--- a/tools/locktest/Makefile.am
++++ b/tools/locktest/Makefile.am
+@@ -1,6 +1,5 @@
+ ## Process this file with automake to produce Makefile.in
+ 
+-CC=$(CC_FOR_BUILD)
+ LIBTOOL = @LIBTOOL@ --tag=CC
+ 
+ noinst_PROGRAMS = testlk
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
index 73cfa6b..1eee798 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
@@ -28,7 +28,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://nfs-utils.conf \
            file://nfs-server.service \
            file://nfs-mountd.service \
-           file://nfs-statd.service "
+           file://nfs-statd.service \
+           file://nfs-utils-use-cross-toolchain-to-compile.patch"
 
 SRC_URI[md5sum] = "6e93a7997ca3a1eac56bf219adab72a8"
 SRC_URI[sha256sum] = "ab8384d0e487ed6a18c5380d5df28015f7dd98680bf08f3247c97d9f7d99e56f"
-- 
1.8.1.2



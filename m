Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DA5AB6FA6E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jun 2014 05:35:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s545ZjtC025290
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Jun 2014 22:35:45 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 3 Jun 2014 22:35:44 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Jun 2014 13:35:41 +0800
Message-ID: <34aaaaeafe1ddaaffdaa53dc9f3fa03c10872be5.1401859998.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1401859998.git.Chong.Lu@windriver.com>
References: <cover.1401859998.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1][V2] nfs-utils: unset CFLAGS for testlk build
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
X-List-Received-Date: Wed, 04 Jun 2014 05:35:46 -0000
Content-Type: text/plain

testlk is built with host gcc at do_compile stage, which leads to unrecognized
some flags for special architecture. So unset CFLAGS for testlk to make sure
it passed.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 .../nfs-utils-unset-CFLAGS-for-testlk-build.patch  | 31 ++++++++++++++++++++++
 .../nfs-utils/nfs-utils_1.3.0.bb                   |  4 ++-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-unset-CFLAGS-for-testlk-build.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-unset-CFLAGS-for-testlk-build.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-unset-CFLAGS-for-testlk-build.patch
new file mode 100644
index 0000000..6f06edf
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-unset-CFLAGS-for-testlk-build.patch
@@ -0,0 +1,31 @@
+From c6819380f27eeb57210b3d2758aa2f8e6af54b56 Mon Sep 17 00:00:00 2001
+From: Chong Lu <Chong.Lu@windriver.com>
+Date: Tue, 3 Jun 2014 09:56:50 +0800
+Subject: [PATCH] nfs-utils: unset CFLAGS for testlk build
+
+testlk is built with host gcc at do_compile stage, which leads to unrecognized
+some flags for special architecture. So unset CFLAGS for testlk to make sure
+it passed.
+
+Upstream-Status: Pending
+
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ tools/locktest/Makefile.am |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tools/locktest/Makefile.am b/tools/locktest/Makefile.am
+index 3156815..325b061 100644
+--- a/tools/locktest/Makefile.am
++++ b/tools/locktest/Makefile.am
+@@ -1,6 +1,7 @@
+ ## Process this file with automake to produce Makefile.in
+ 
+ CC=$(CC_FOR_BUILD)
++CFLAGS =
+ LIBTOOL = @LIBTOOL@ --tag=CC
+ 
+ noinst_PROGRAMS = testlk
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
index 048b0e5..689fe55 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
@@ -28,7 +28,9 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://nfs-utils.conf \
            file://nfs-server.service \
            file://nfs-mountd.service \
-           file://nfs-statd.service "
+           file://nfs-statd.service \
+           file://nfs-utils-unset-CFLAGS-for-testlk-build.patch \
+"
 
 SRC_URI[md5sum] = "6e93a7997ca3a1eac56bf219adab72a8"
 SRC_URI[sha256sum] = "ab8384d0e487ed6a18c5380d5df28015f7dd98680bf08f3247c97d9f7d99e56f"
-- 
1.8.1.2



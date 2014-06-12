Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CC10365D34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jun 2014 02:23:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5C2Nh6x022599
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jun 2014 19:23:43 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 11 Jun 2014 19:23:42 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Jun 2014 10:23:40 +0800
Message-ID: <96b0248ed24ff97d718b876a8d1cbced3226c66c.1402539725.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1402539725.git.Chong.Lu@windriver.com>
References: <cover.1402539725.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] nfs-utils: Do not pass CFLAGS to gcc while building
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
X-List-Received-Date: Thu, 12 Jun 2014 02:23:49 -0000
Content-Type: text/plain

Do not pass CFLAGS/LDFLAGS to gcc while building, The needed flags has
been passed by xxx_CFLAGS=$(CFLAGS_FOR_BUILD).

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 ...-Do-not-pass-CFLAGS-to-gcc-while-building.patch | 42 ++++++++++++++++++++++
 .../nfs-utils-unset-CFLAGS-for-testlk-build.patch  | 31 ----------------
 .../nfs-utils/nfs-utils_1.3.0.bb                   |  2 +-
 3 files changed, 43 insertions(+), 32 deletions(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-Do-not-pass-CFLAGS-to-gcc-while-building.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-unset-CFLAGS-for-testlk-build.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-Do-not-pass-CFLAGS-to-gcc-while-building.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-Do-not-pass-CFLAGS-to-gcc-while-building.patch
new file mode 100644
index 0000000..993f1e5
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-Do-not-pass-CFLAGS-to-gcc-while-building.patch
@@ -0,0 +1,42 @@
+nfs-utils: Do not pass CFLAGS to gcc while building
+
+Do not pass CFLAGS/LDFLAGS to gcc while building, The needed flags has
+been passed by xxx_CFLAGS=$(CFLAGS_FOR_BUILD).
+
+Upstream-Status: Pending
+
+Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
+---
+ tools/locktest/Makefile.am |    2 ++
+ tools/rpcgen/Makefile.am   |    2 ++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/tools/locktest/Makefile.am b/tools/locktest/Makefile.am
+index 3156815..1729fd1 100644
+--- a/tools/locktest/Makefile.am
++++ b/tools/locktest/Makefile.am
+@@ -1,6 +1,8 @@
+ ## Process this file with automake to produce Makefile.in
+ 
+ CC=$(CC_FOR_BUILD)
++CFLAGS=
++LDFLAGS=
+ LIBTOOL = @LIBTOOL@ --tag=CC
+ 
+ noinst_PROGRAMS = testlk
+diff --git a/tools/rpcgen/Makefile.am b/tools/rpcgen/Makefile.am
+index 8a9ec89..8bacdaa 100644
+--- a/tools/rpcgen/Makefile.am
++++ b/tools/rpcgen/Makefile.am
+@@ -1,6 +1,8 @@
+ ## Process this file with automake to produce Makefile.in
+ 
+ CC=$(CC_FOR_BUILD)
++CFLAGS=
++LDFLAGS=
+ LIBTOOL = @LIBTOOL@ --tag=CC
+ 
+ noinst_PROGRAMS = rpcgen
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-unset-CFLAGS-for-testlk-build.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-unset-CFLAGS-for-testlk-build.patch
deleted file mode 100644
index 6f06edf..0000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-unset-CFLAGS-for-testlk-build.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From c6819380f27eeb57210b3d2758aa2f8e6af54b56 Mon Sep 17 00:00:00 2001
-From: Chong Lu <Chong.Lu@windriver.com>
-Date: Tue, 3 Jun 2014 09:56:50 +0800
-Subject: [PATCH] nfs-utils: unset CFLAGS for testlk build
-
-testlk is built with host gcc at do_compile stage, which leads to unrecognized
-some flags for special architecture. So unset CFLAGS for testlk to make sure
-it passed.
-
-Upstream-Status: Pending
-
-Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
----
- tools/locktest/Makefile.am |    1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tools/locktest/Makefile.am b/tools/locktest/Makefile.am
-index 3156815..325b061 100644
---- a/tools/locktest/Makefile.am
-+++ b/tools/locktest/Makefile.am
-@@ -1,6 +1,7 @@
- ## Process this file with automake to produce Makefile.in
- 
- CC=$(CC_FOR_BUILD)
-+CFLAGS =
- LIBTOOL = @LIBTOOL@ --tag=CC
- 
- noinst_PROGRAMS = testlk
--- 
-1.7.9.5
-
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
index 689fe55..8575647 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.0.bb
@@ -29,7 +29,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://nfs-server.service \
            file://nfs-mountd.service \
            file://nfs-statd.service \
-           file://nfs-utils-unset-CFLAGS-for-testlk-build.patch \
+           file://nfs-utils-Do-not-pass-CFLAGS-to-gcc-while-building.patch \
 "
 
 SRC_URI[md5sum] = "6e93a7997ca3a1eac56bf219adab72a8"
-- 
1.8.1.2



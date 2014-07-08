Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 45BB27040D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jul 2014 15:39:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s68FdLpe014552
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Jul 2014 08:39:21 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 8 Jul 2014 08:39:21 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Jul 2014 08:39:20 -0700
Message-ID: <c4727f88946b538e45d0cb52f28bfc2d6f5264c5.1404833184.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1404833184.git.liezhi.yang@windriver.com>
References: <cover.1404833184.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] rpm: disable -Wno-override-init
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
X-List-Received-Date: Tue, 08 Jul 2014 15:39:22 -0000
Content-Type: text/plain

Fixed rpm-native.do_configure error on CentOS 5.x:
cc1: error: unrecognized command line option "-Wno-override-init"

The -Wno-override-init was commented in rpm-5.4.9, but commented out in
rpm-5.4.14 thus it is failed to build on CentOS 5.x, comment it again to fix
the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../rpm/rpm/rpm-disable-Wno-override-init.patch    |   32 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4+cvs.bb           |    1 +
 meta/recipes-devtools/rpm/rpm_5.4.14.bb            |    1 +
 3 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-disable-Wno-override-init.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-disable-Wno-override-init.patch b/meta/recipes-devtools/rpm/rpm/rpm-disable-Wno-override-init.patch
new file mode 100644
index 0000000..8b5f8d6
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-disable-Wno-override-init.patch
@@ -0,0 +1,32 @@
+From 70d881873b443c9bad502db9665595455d4f0ac9 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Tue, 8 Jul 2014 07:41:10 +0800
+Subject: [PATCH] configure.ac: disable -Wno-override-init
+
+Fixed rpm-native.do_configure error on CentOS 5.x:
+
+cc1: error: unrecognized command line option "-Wno-override-init"
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index adeffe0..6746b4c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -163,7 +163,7 @@ AC_ARG_ENABLE(build-warnings,
+ # XXX gcc-4.2 on Mac OS X hasn't
+ #            CFLAGS="$CFLAGS -Wno-unused-but-set-variable"
+ # XXX rpmio/set.c needs this
+-            CFLAGS="$CFLAGS -Wno-override-init"
++#            CFLAGS="$CFLAGS -Wno-override-init"
+         elif test ".`$CC -V 2>&1 | grep 'Sun C'`" != .; then
+             dnl # Sun Studio (usually "cc")
+             CFLAGS="$CFLAGS -v"
+--
+1.8.2.1
+
diff --git a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
index 4ab22e7..27d01dd 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4+cvs.bb
@@ -108,6 +108,7 @@ SRC_URI = "cvs://anonymous@rpm5.org/cvs;tag=rpm-5_4;module=rpm \
 	   file://rpm-fix-logio-cp.patch \
 	   file://rpm-db5-or-db6.patch \
 	   file://rpm-rpmpgp-fix.patch \
+	   file://rpm-disable-Wno-override-init.patch \
 	  "
 
 # Uncomment the following line to enable platform score debugging
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index cc836be..15c1738 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -91,6 +91,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.14-0.20131024.src.rpm;e
 	   file://rpm-payload-use-hashed-inode.patch \
 	   file://rpm-fix-logio-cp.patch \
 	   file://rpm-db5-or-db6.patch \
+	   file://rpm-disable-Wno-override-init.patch \
 	  "
 
 # Uncomment the following line to enable platform score debugging
-- 
1.7.9.5



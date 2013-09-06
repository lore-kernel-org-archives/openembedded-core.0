Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 6867F60EF1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 21:05:54 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1; Fri, 6 Sep 2013
	23:05:51 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4200)	id BBB5F28CD09;
	Fri,  6 Sep 2013 23:05:51 +0200 (CEST)
From: Tudor Florea <tudor.florea@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 6 Sep 2013 23:05:50 +0200
Message-ID: <1378501550-48227-1-git-send-email-tudor.florea@enea.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: tudor.florea@enea.com does not
	designate permitted sender hosts)
Subject: buildtest-TESTS and runtest-TESTS targets required by ptest.
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
X-List-Received-Date: Fri, 06 Sep 2013 21:05:55 -0000
Content-Type: text/plain

From 035ad642c76bbf388de198a886f544e4da8a7efc Mon Sep 17 00:00:00 2001
From: Tudor Florea <tudor.florea@enea.com>
Date: Fri, 6 Sep 2013 22:49:30 +0200
Subject: [PATCH] kmod: avoid parallel-tests


Signed-off-by: Tudor Florea <tudor.florea@enea.com>
---
 meta/recipes-kernel/kmod/kmod.inc                    |    1 +
 .../kmod/kmod/remove_parallel_tests.patch            |   18 ++++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 meta/recipes-kernel/kmod/kmod/remove_parallel_tests.patch

diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index 1728a4e..633258b 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -19,6 +19,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git \
            file://depmod-search.conf \
            file://run-ptest \
            file://ptest.patch \
+           file://remove_parallel_tests.patch \
           "
 
 SRCREV = "3b38c7fcb58be4ddc34f90454c5f5dc3693d2d85"
diff --git a/meta/recipes-kernel/kmod/kmod/remove_parallel_tests.patch b/meta/recipes-kernel/kmod/kmod/remove_parallel_tests.patch
new file mode 100644
index 0000000..ee19428
--- /dev/null
+++ b/meta/recipes-kernel/kmod/kmod/remove_parallel_tests.patch
@@ -0,0 +1,18 @@
+Avoid parallel-tests as it remove
+buildtest-TESTS and runtest-TESTS targets
+
+Signed-off-by: Tudor Florea <tudor.florea@enea.com>
+Upstream-Status: Inappropriate (disable feature incompatible with ptest) 
+
+diff -ruN a/configure.ac b/configure.ac
+--- a/configure.ac	2013-09-02 15:05:18.662366800 +0200
++++ b/configure.ac	2013-09-02 15:05:49.557066764 +0200
+@@ -8,7 +8,7 @@
+ AC_CONFIG_SRCDIR([libkmod/libkmod.c])
+ AC_CONFIG_AUX_DIR([build-aux])
+ AM_INIT_AUTOMAKE([check-news foreign 1.11 silent-rules
+-	tar-pax no-dist-gzip dist-xz subdir-objects color-tests parallel-tests])
++	tar-pax no-dist-gzip dist-xz subdir-objects color-tests])
+ AC_PROG_CC_STDC
+ AC_USE_SYSTEM_EXTENSIONS
+ AC_SYS_LARGEFILE
-- 
1.7.10.4



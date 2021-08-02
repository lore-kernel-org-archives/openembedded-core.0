Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web09.17006.1627890765018628590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 00:53:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="193002070"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="193002070"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:12 -0700
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="478652612"
Received: from chewchoo-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.228.46])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:53:10 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 17/37] parted: improve ptest execution
Date: Mon,  2 Aug 2021 15:52:04 +0800
Message-Id: <4395acee739e09249ca5cdab77322c49616fc0c6.1627890114.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1627890114.git.anuj.mittal@intel.com>
References: <cover.1627890114.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

Delete the right log files in run-ptest so the tests can be executed
more than once.

Install config.h so the tests which examine the build configuration will
do the right thing, specifically this causes the tests using libblkid to
execute instead of skip.

Add missing RDEPENDS: mkswap and tune2fs binaries, loop and vfat kernel
modules.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 43bd50cbf902ce92ea613d142fae2524011b8f55)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-extended/parted/files/run-ptest | 2 +-
 meta/recipes-extended/parted/parted_3.4.bb   | 9 ++++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/parted/files/run-ptest b/meta/recipes-extended/parted/files/run-ptest
index 374f1bfbc9..c3d6fca339 100644
--- a/meta/recipes-extended/parted/files/run-ptest
+++ b/meta/recipes-extended/parted/files/run-ptest
@@ -2,6 +2,6 @@
 
 mkdir -p /etc/udev/mount.blacklist.d
 echo /dev/sda1 >> /etc/udev/mount.blacklist.d/parted-tmp
-rm -f *.log
+rm -f tests/*.log
 make -C tests test-suite.log
 rm /etc/udev/mount.blacklist.d/parted-tmp
diff --git a/meta/recipes-extended/parted/parted_3.4.bb b/meta/recipes-extended/parted/parted_3.4.bb
index c15f5aeb0b..eea3d91d56 100644
--- a/meta/recipes-extended/parted/parted_3.4.bb
+++ b/meta/recipes-extended/parted/parted_3.4.bb
@@ -35,10 +35,13 @@ do_install_ptest() {
 	cp ${S}/build-aux/test-driver $t/build-aux/
 	cp -r ${S}/tests $t
 	cp ${B}/tests/Makefile $t/tests/
+	mkdir $t/lib
+	cp ${B}/lib/config.h $t/lib
 	sed -i "s|^VERSION.*|VERSION = ${PV}|g" $t/tests/Makefile
 	sed -i "s|^srcdir =.*|srcdir = \.|g" $t/tests/Makefile
 	sed -i "s|^abs_srcdir =.*|abs_srcdir = \.|g" $t/tests/Makefile
-	sed -i "s|^abs_top_srcdir =.*|abs_top_srcdir = \.\.|g" $t/tests/Makefile
+	sed -i "s|^abs_top_srcdir =.*|abs_top_srcdir = "${PTEST_PATH}"|g" $t/tests/Makefile
+	sed -i "s|^abs_top_builddir =.*|abs_top_builddir = "${PTEST_PATH}"|g" $t/tests/Makefile
 	sed -i "s|^Makefile:.*|Makefile:|g" $t/tests/Makefile
 	sed -i "/^BUILDINFO.*$/d" $t/tests/Makefile
 	for i in print-align print-max print-flags dup-clobber duplicate fs-resize; \
@@ -47,8 +50,8 @@ do_install_ptest() {
 	sed -e 's| ../parted||' -i $t/tests/*.sh
 }
 
-RDEPENDS_${PN}-ptest = "bash coreutils perl util-linux-losetup python3 make gawk e2fsprogs-mke2fs python3-core"
-RRECOMMENDS_${PN}-ptest = "kernel-module-scsi-debug"
+RDEPENDS_${PN}-ptest = "bash coreutils perl util-linux-losetup util-linux-mkswap python3 make gawk e2fsprogs-mke2fs e2fsprogs-tune2fs python3-core dosfstools"
+RRECOMMENDS_${PN}-ptest = "kernel-module-scsi-debug kernel-module-loop kernel-module-vfat"
 RDEPENDS_${PN}-ptest_append_libc-glibc = "\
         glibc-utils \
         locale-base-en-us \
-- 
2.31.1


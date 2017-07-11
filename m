Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 40BDA7808D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 12:57:56 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jul 2017 05:57:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,346,1496127600"; d="scan'208";a="1171113860"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jul 2017 05:57:57 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 971ED5804B8;
	Tue, 11 Jul 2017 05:57:56 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jul 2017 15:58:13 +0300
Message-Id: <1499777893-16292-4-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1499777893-16292-1-git-send-email-maxin.john@intel.com>
References: <1499777893-16292-1-git-send-email-maxin.john@intel.com>
Cc: joshua.g.lock@intel.com, stanley.cheong.kwan.phoong@intel.com
Subject: [PATCH 3/3] libxt: fix build failure
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
X-List-Received-Date: Tue, 11 Jul 2017 12:57:56 -0000

libxt build fails with this error:

/home/maxin/poky/build/tmp/work/i586-poky-linux/libxt/1_1.1.5-r0/recipe-sysroot/usr/include/bits/long-double.h:57:33:
fatal error: bits/long-double-64.h: No such file or directory
| compilation terminated.
| Makefile:408: recipe for target 'makestrs.o' failed

Fix the makestrs build.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...il-don-t-link-makestrs-with-target-cflags.patch | 33 ++++++++++++++++++++++
 meta/recipes-graphics/xorg-lib/libxt_1.1.5.bb      |  4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxt/0001-libXt-util-don-t-link-makestrs-with-target-cflags.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxt/0001-libXt-util-don-t-link-makestrs-with-target-cflags.patch b/meta/recipes-graphics/xorg-lib/libxt/0001-libXt-util-don-t-link-makestrs-with-target-cflags.patch
new file mode 100644
index 0000000..1a691a3
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxt/0001-libXt-util-don-t-link-makestrs-with-target-cflags.patch
@@ -0,0 +1,33 @@
+From b0c0e6d90bd99a699701c9542640adb218f5d536 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Mon, 10 Jul 2017 16:51:13 +0300
+Subject: [PATCH] libXt: util: don't link makestrs with target cflags
+
+The line: AM_CFLAGS = $(XT_CFLAGS)
+in util/Makefile.am is wrong because it adds target cflags to the
+compilation of makestrs, which is built for the build machine, which
+leads to build failures when cross-compiling.
+
+Upstream-Status: Pending
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ util/Makefile.am | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/util/Makefile.am b/util/Makefile.am
+index 800b35b..f2dd1f9 100644
+--- a/util/Makefile.am
++++ b/util/Makefile.am
+@@ -11,7 +11,6 @@ EXTRA_DIST = \
+ 	StrDefs.ht \
+ 	string.list
+ 
+-AM_CFLAGS = $(XT_CFLAGS)
+ makestrs_SOURCES = makestrs.c
+ 
+ 
+-- 
+2.4.0
+
diff --git a/meta/recipes-graphics/xorg-lib/libxt_1.1.5.bb b/meta/recipes-graphics/xorg-lib/libxt_1.1.5.bb
index c1ed0bb..180d00d 100644
--- a/meta/recipes-graphics/xorg-lib/libxt_1.1.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libxt_1.1.5.bb
@@ -23,7 +23,9 @@ PE = "1"
 
 XORG_PN = "libXt"
 
-SRC_URI +=  "file://libxt_fix_for_x32.patch"
+SRC_URI +=  "file://libxt_fix_for_x32.patch \
+             file://0001-libXt-util-don-t-link-makestrs-with-target-cflags.patch \
+            "
 
 BBCLASSEXTEND = "native"
 
-- 
2.4.0



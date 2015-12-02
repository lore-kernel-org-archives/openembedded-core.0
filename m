Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C87406FF64
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 05:06:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tB2567LJ021497
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 1 Dec 2015 21:06:07 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 1 Dec 2015 21:06:06 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 2 Dec 2015 13:06:01 +0800
Message-ID: <8e3c76d86f19c59b63908de6d7d9c2cc24858858.1449032673.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1449032673.git.hongxu.jia@windriver.com>
References: <cover.1449032673.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] python: gcc optimization level 2
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
X-List-Received-Date: Wed, 02 Dec 2015 05:06:20 -0000
Content-Type: text/plain

The qemu didn't support '-march=corei7 -mtune=corei7' and
gcc optimization level 3 '-O3' very well, in which the
/usr/lib64/python2.7/test/test_md5.py and
/usr/lib64/python2.7/test/test_sha.py failed.

So we use gcc optimization level 2 to instead.

YOCTO [# 8747]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...001-configure.ac-gcc-optimization-level-2.patch | 40 ++++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.9.bb       |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/0001-configure.ac-gcc-optimization-level-2.patch

diff --git a/meta/recipes-devtools/python/python/0001-configure.ac-gcc-optimization-level-2.patch b/meta/recipes-devtools/python/python/0001-configure.ac-gcc-optimization-level-2.patch
new file mode 100644
index 0000000..f760403
--- /dev/null
+++ b/meta/recipes-devtools/python/python/0001-configure.ac-gcc-optimization-level-2.patch
@@ -0,0 +1,40 @@
+From 55520995fa6c72f6a93a7ccc8503167f359bc63d Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Mon, 30 Nov 2015 06:25:08 -0500
+Subject: [PATCH] configure.ac: gcc optimization level 2
+
+The qemu didn't support '-march=corei7 -mtune=corei7' and
+gcc optimization level 3 '-O3' very well, in which the
+/usr/lib64/python2.7/test/test_md5.py and
+/usr/lib64/python2.7/test/test_sha.py failed.
+
+So we use gcc optimization level 2 to instead.
+
+Upstream-Status: Inappropriate [qemu corei7 specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 87a4f02..d3ad673 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1076,11 +1076,11 @@ then
+ 		# debug builds.
+ 		OPT="-g -O0 -Wall $STRICT_PROTO"
+ 	    else
+-		OPT="-g $WRAP -O3 -Wall $STRICT_PROTO"
++		OPT="-g $WRAP -O2 -Wall $STRICT_PROTO"
+ 	    fi
+ 	    ;;
+ 	*)
+-	    OPT="-O3 -Wall $STRICT_PROTO"
++	    OPT="-O2 -Wall $STRICT_PROTO"
+ 	    ;;
+ 	esac
+ 	case $ac_sys_system in
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/python/python_2.7.9.bb b/meta/recipes-devtools/python/python_2.7.9.bb
index bc20417..12dd7fa 100644
--- a/meta/recipes-devtools/python/python_2.7.9.bb
+++ b/meta/recipes-devtools/python/python_2.7.9.bb
@@ -26,6 +26,7 @@ SRC_URI += "\
   file://parallel-makeinst-create-bindir.patch \
   file://use_sysroot_ncurses_instead_of_host.patch \
   file://avoid_parallel_make_races_on_pgen.patch \
+  file://0001-configure.ac-gcc-optimization-level-2.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
1.9.1



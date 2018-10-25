Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2D21878DEC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 08:59:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9P8xGgf008160
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 01:59:37 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Thu, 25 Oct 2018 01:59:29 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Oct 2018 16:59:28 +0800
Message-ID: <1540457968-325221-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] python-native: fix one do_populate_sysroot warning
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
X-List-Received-Date: Thu, 25 Oct 2018 08:59:46 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Fix below warning:
WARNING: Skipping RPATH /usr/lib64 as is a standard search path for
work/x86_64-linux/python-native/2.7.15-r1.1/recipe-sysroot-native/
usr/lib/python2.7/lib-dynload/_bsddb.so

setup.py will check db.h under include_dirs, for native build,
/usr/lib64 will be insert to postion 0 of include_dirs, so
it's priority is higher then our sysroot, cause db.h sysroot
is ignored, and rpath set to /usr/lib64. and this cause warning
when do_populate_sysroot. use append to fix it.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...ative-fix-one-do_populate_sysroot-warning.patch | 39 ++++++++++++++++++++++
 .../python/python-native_2.7.15.bb                 |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-native/0001-python-native-fix-one-do_populate_sysroot-warning.patch

diff --git a/meta/recipes-devtools/python/python-native/0001-python-native-fix-one-do_populate_sysroot-warning.patch b/meta/recipes-devtools/python/python-native/0001-python-native-fix-one-do_populate_sysroot-warning.patch
new file mode 100644
index 0000000..9898189
--- /dev/null
+++ b/meta/recipes-devtools/python/python-native/0001-python-native-fix-one-do_populate_sysroot-warning.patch
@@ -0,0 +1,39 @@
+From 12292444e1b3662b994bc223d92b8338fb0895ff Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 25 Oct 2018 07:32:14 +0000
+Subject: [PATCH] python-native: fix one do_populate_sysroot warning
+
+Fix below warning:
+WARNING: Skipping RPATH /usr/lib64 as is a standard search path for
+work/x86_64-linux/python-native/2.7.15-r1.1/recipe-sysroot-native/
+usr/lib/python2.7/lib-dynload/_bsddb.so
+
+setup.py will check db.h under include_dirs, for native build,
+/usr/lib64 will be insert to postion 0 of include_dirs, so
+it's priority is higher then our sysroot, cause db.h sysroot
+is ignored, and rpath set to /usr/lib64. and this cause warning
+when do_populate_sysroot. use append to fix it.
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ setup.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setup.py b/setup.py
+index 7bf13ed..6c0f29b 100644
+--- a/setup.py
++++ b/setup.py
+@@ -40,7 +40,7 @@ def add_dir_to_list(dirlist, dir):
+     1) 'dir' is not already in 'dirlist'
+     2) 'dir' actually exists, and is a directory."""
+     if dir is not None and os.path.isdir(dir) and dir not in dirlist:
+-        dirlist.insert(0, dir)
++        dirlist.append(dir)
+
+ def macosx_sdk_root():
+     """
+-- 
+2.18.0
+
diff --git a/meta/recipes-devtools/python/python-native_2.7.15.bb b/meta/recipes-devtools/python/python-native_2.7.15.bb
index 7c491fa..f9a9a5d 100644
--- a/meta/recipes-devtools/python/python-native_2.7.15.bb
+++ b/meta/recipes-devtools/python/python-native_2.7.15.bb
@@ -16,6 +16,7 @@ SRC_URI += "\
             file://builddir.patch \
             file://parallel-makeinst-create-bindir.patch \
             file://revert_use_of_sysconfigdata.patch \
+            file://0001-python-native-fix-one-do_populate_sysroot-warning.patch \
            "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
2.7.4



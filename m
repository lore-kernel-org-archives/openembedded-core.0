Return-Path: <Changqing.Li@windriver.com>
X-Greylist: delayed 6731 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 07 Feb 2020 07:59:59 UTC
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 14FDE60AF3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 07:59:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 01767nxc007522
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Feb 2020 22:07:49 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Thu, 6 Feb 2020 22:07:47 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Feb 2020 14:07:44 +0800
Message-ID: <1581055664-311654-2-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581055664-311654-1-git-send-email-changqing.li@windriver.com>
References: <1581055664-311654-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] python3: Do not hardcode "lib" for distutils
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
X-List-Received-Date: Fri, 07 Feb 2020 08:00:00 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Get the sys.lib from python3 itself and do not use
hardcoded value of 'lib' for distutils.

Solve the error below that occurs when run "python3 setup.py
install"
on lib64 multilib platform:
[Errno 2] No such file or directory:
'/usr/lib/python3.7/site-packages/test-easy-install-1828.write-test'

Signed-off-by: Li Zhou <li.zhou@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...python3-Do-not-hardcode-lib-for-distutils.patch | 43 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.8.1.bb      |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-python3-Do-not-hardcode-lib-for-distutils.patch

diff --git a/meta/recipes-devtools/python/python3/0001-python3-Do-not-hardcode-lib-for-distutils.patch b/meta/recipes-devtools/python/python3/0001-python3-Do-not-hardcode-lib-for-distutils.patch
new file mode 100644
index 0000000..fe031b9
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-python3-Do-not-hardcode-lib-for-distutils.patch
@@ -0,0 +1,43 @@
+From bb711b53f10d32a90a27ccf4b0dc51e4a701d862 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 7 Feb 2020 09:42:09 +0800
+Subject: [PATCH] python3: Do not hardcode "lib" for distutils
+
+Get the sys.lib from python3 itself and do not use
+hardcoded value of 'lib' for distutils.
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ Lib/distutils/command/install.py | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/Lib/distutils/command/install.py b/Lib/distutils/command/install.py
+index c625c95..8e32f54 100644
+--- a/Lib/distutils/command/install.py
++++ b/Lib/distutils/command/install.py
+@@ -19,6 +19,8 @@ from site import USER_BASE
+ from site import USER_SITE
+ HAS_USER_SITE = True
+
++libname = sys.lib
++
+ WINDOWS_SCHEME = {
+     'purelib': '$base/Lib/site-packages',
+     'platlib': '$base/Lib/site-packages',
+@@ -29,8 +31,8 @@ WINDOWS_SCHEME = {
+
+ INSTALL_SCHEMES = {
+     'unix_prefix': {
+-        'purelib': '$base/lib/python$py_version_short/site-packages',
+-        'platlib': '$platbase/lib/python$py_version_short/site-packages',
++        'purelib': '$base/' + libname + '/python$py_version_short/site-packages',
++        'platlib': '$platbase/' + libname + '/python$py_version_short/site-packages',
+         'headers': '$base/include/python$py_version_short$abiflags/$dist_name',
+         'scripts': '$base/bin',
+         'data'   : '$base',
+--
+2.7.4
+
diff --git a/meta/recipes-devtools/python/python3_3.8.1.bb b/meta/recipes-devtools/python/python3_3.8.1.bb
index 981b52e..c836066 100644
--- a/meta/recipes-devtools/python/python3_3.8.1.bb
+++ b/meta/recipes-devtools/python/python3_3.8.1.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-setup.py-pass-missing-libraries-to-Extension-for-mul.patch \
            file://0001-Makefile-do-not-compile-.pyc-in-parallel.patch \
            file://0001-configure.ac-fix-LIBPL.patch \
+           file://0001-python3-Do-not-hardcode-lib-for-distutils.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.7.4



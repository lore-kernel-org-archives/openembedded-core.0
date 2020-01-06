Return-Path: <Li.Zhou@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5A06160273
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 06:04:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 00664Baj004195
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 5 Jan 2020 22:04:11 -0800 (PST)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Sun, 5 Jan 2020 22:04:10 -0800
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Jan 2020 14:03:17 +0800
Message-ID: <1578290597-8588-2-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1578290597-8588-1-git-send-email-li.zhou@windriver.com>
References: <1578290597-8588-1-git-send-email-li.zhou@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
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
X-List-Received-Date: Mon, 06 Jan 2020 06:04:10 -0000
Content-Type: text/plain

Get the sys.lib from python3 itself and do not use
 hardcoded value of 'lib' for distutils.

Solve the error below that occurs when run "python3 setup.py install"
on lib64 multilib platform:
[Errno 2] No such file or directory: '/usr/lib/python3.7/site-packages/test-easy-install-1828.write-test'

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 ...python3-Do-not-hardcode-lib-for-distutils.patch | 42 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.7.6.bb      |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-python3-Do-not-hardcode-lib-for-distutils.patch

diff --git a/meta/recipes-devtools/python/python3/0001-python3-Do-not-hardcode-lib-for-distutils.patch b/meta/recipes-devtools/python/python3/0001-python3-Do-not-hardcode-lib-for-distutils.patch
new file mode 100644
index 0000000..9cab2ad
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-python3-Do-not-hardcode-lib-for-distutils.patch
@@ -0,0 +1,42 @@
+From 9dd978f044b9ada446fa827be01bbc34057ebfcf Mon Sep 17 00:00:00 2001
+From: Li Zhou <li.zhou@windriver.com>
+Date: Thu, 2 Jan 2020 13:29:17 +0800
+Subject: [PATCH] python3: Do not hardcode "lib" for distutils
+
+Get the sys.lib from python3 itself and do not use
+ hardcoded value of 'lib' for distutils.
+
+Upstream-Status: Inappropriate [oe-core specific]
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ Lib/distutils/command/install.py | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/Lib/distutils/command/install.py b/Lib/distutils/command/install.py
+index 0258d3d..352fd8f 100644
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
++        'purelib': '$platbase/'+libname+'/python$py_version_short/site-packages',
++        'platlib': '$platbase/'+libname+'/python$py_version_short/site-packages',
+         'headers': '$base/include/python$py_version_short$abiflags/$dist_name',
+         'scripts': '$base/bin',
+         'data'   : '$base',
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/python/python3_3.7.6.bb b/meta/recipes-devtools/python/python3_3.7.6.bb
index ae2f105..618245e 100644
--- a/meta/recipes-devtools/python/python3_3.7.6.bb
+++ b/meta/recipes-devtools/python/python3_3.7.6.bb
@@ -30,6 +30,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-test_locale.py-correct-the-test-output-format.patch \
            file://0017-setup.py-do-not-report-missing-dependencies-for-disa.patch \
            file://0001-configure.ac-fix-LIBPL.patch \
+           file://0001-python3-Do-not-hardcode-lib-for-distutils.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
1.9.1



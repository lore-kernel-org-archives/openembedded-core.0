Return-Path: <Li.Zhou@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8E7486FF6B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2016 03:13:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5T3DOcC003243
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2016 20:13:25 -0700 (PDT)
Received: from pek-lzhou2-d1.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Tue, 28 Jun 2016 20:13:24 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jun 2016 11:12:55 +0800
Message-ID: <20160629031255.3551-1-li.zhou@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
X-Originating-IP: [128.224.162.243]
Subject: [PATCH] python3: correct the multilib support patch
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
X-List-Received-Date: Wed, 29 Jun 2016 03:13:25 -0000
Content-Type: text/plain

When python3 rebased its multilib patch, the hard coded "lib" path
isn't really changed because of the rebasing's error, and cause
phthon3's failure when running on 64bit platforms as below:
Could not find platform independent libraries <prefix>
Could not find platform dependent libraries <exec_prefix>
Consider setting $PYTHONHOME to <prefix>[:<exec_prefix>]
Fatal Python error: Py_Initialize: Unable to get the locale encoding
ImportError: No module named 'encodings'

Here correct the rebasing error and solve this issue.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 ...ython3-correct-the-multilib-support-patch.patch | 47 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.1.bb      |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-python3-correct-the-multilib-support-patch.patch

diff --git a/meta/recipes-devtools/python/python3/0001-python3-correct-the-multilib-support-patch.patch b/meta/recipes-devtools/python/python3/0001-python3-correct-the-multilib-support-patch.patch
new file mode 100644
index 0000000..0443fb4
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-python3-correct-the-multilib-support-patch.patch
@@ -0,0 +1,47 @@
+From ea237efcfa72012f044c7b3091c9c9b038141df8 Mon Sep 17 00:00:00 2001
+From: Li Zhou <li.zhou@windriver.com>
+Date: Wed, 29 Jun 2016 10:45:01 +0800
+Subject: [PATCH] python3: correct the multilib support patch
+
+When python3 rebased its multilib patch, the hard coded "lib" path
+isn't really changed because of the rebasing's error, and cause
+phthon3's failure when running on 64bit platforms as below:
+Could not find platform independent libraries <prefix>
+Could not find platform dependent libraries <exec_prefix>
+Consider setting $PYTHONHOME to <prefix>[:<exec_prefix>]
+Fatal Python error: Py_Initialize: Unable to get the locale encoding
+ImportError: No module named 'encodings'
+
+Here correct the rebasing error and solve this issue.
+
+Upstream-Status: Pending
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ Modules/getpath.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/Modules/getpath.c b/Modules/getpath.c
+index 034d91a..5deb33d 100644
+--- a/Modules/getpath.c
++++ b/Modules/getpath.c
+@@ -132,7 +132,6 @@ static wchar_t prefix[MAXPATHLEN+1];
+ static wchar_t exec_prefix[MAXPATHLEN+1];
+ static wchar_t progpath[MAXPATHLEN+1];
+ static wchar_t *module_search_path = NULL;
+-static wchar_t *lib_python = L"" LIB_PYTHON;
+ 
+ /* Get file status. Encode the path to the locale encoding. */
+ 
+@@ -514,7 +513,7 @@ calculate_path(void)
+     _pythonpath = Py_DecodeLocale(PYTHONPATH, NULL);
+     _prefix = Py_DecodeLocale(PREFIX, NULL);
+     _exec_prefix = Py_DecodeLocale(EXEC_PREFIX, NULL);
+-    lib_python = Py_DecodeLocale("lib/python" VERSION, NULL);
++    lib_python = Py_DecodeLocale(LIB_PYTHON, NULL);
+ 
+     if (!_pythonpath || !_prefix || !_exec_prefix || !lib_python) {
+         Py_FatalError(
+-- 
+2.9.0
+
diff --git a/meta/recipes-devtools/python/python3_3.5.1.bb b/meta/recipes-devtools/python/python3_3.5.1.bb
index 2fbb3cb..1e6626f 100644
--- a/meta/recipes-devtools/python/python3_3.5.1.bb
+++ b/meta/recipes-devtools/python/python3_3.5.1.bb
@@ -38,6 +38,7 @@ SRC_URI += "\
             file://setup.py-find-libraries-in-staging-dirs.patch \
             file://use_packed_importlib.patch \
             file://configure.ac-fix-LIBPL.patch \
+            file://0001-python3-correct-the-multilib-support-patch.patch \
            "
 SRC_URI[md5sum] = "e9ea6f2623fffcdd871b7b19113fde80"
 SRC_URI[sha256sum] = "c6d57c0c366d9060ab6c0cdf889ebf3d92711d466cc0119c441dbf2746f725c9"
-- 
2.9.0



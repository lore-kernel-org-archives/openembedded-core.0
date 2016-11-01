Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1D87871B65
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Nov 2016 07:46:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uA17k9kI020086
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Nov 2016 00:46:09 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 1 Nov 2016 00:46:08 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Nov 2016 15:39:44 +0800
Message-ID: <d2329bbbddbfe000ef6d0cdf17975bef6cf96f51.1477985510.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <cover.1477985510.git.kai.kang@windriver.com>
References: <cover.1477985510.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] python3: fix library search path
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
X-List-Received-Date: Tue, 01 Nov 2016 07:46:08 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When enable multilib, it fails to run python3:

| Could not find platform independent libraries <prefix>
| Could not find platform dependent libraries <exec_prefix>
| Consider setting $PYTHONHOME to <prefix>[:<exec_prefix>]
| Fatal Python error: Py_Initialize: Unable to get the locale encoding
| ImportError: No module named 'encodings'
|
| Current thread 0x00007f62ea5b2700 (most recent call first):
| Aborted (core dumped)

The root cause is the module search path /usr/lib is wrong for x86-64
when multilib is enabled. So replace fixed path string with right macro.

Clean up python-3.3-multilib.patch for Modules/getpath.c at same time.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...t-python3-lib-pathes-for-multilib-support.patch | 49 ++++++++++++++++++++++
 .../python/python3/python-3.3-multilib.patch       | 13 +++---
 meta/recipes-devtools/python/python3_3.5.2.bb      |  1 +
 3 files changed, 55 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/correct-python3-lib-pathes-for-multilib-support.patch

diff --git a/meta/recipes-devtools/python/python3/correct-python3-lib-pathes-for-multilib-support.patch b/meta/recipes-devtools/python/python3/correct-python3-lib-pathes-for-multilib-support.patch
new file mode 100644
index 0000000..8ca5a6a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/correct-python3-lib-pathes-for-multilib-support.patch
@@ -0,0 +1,49 @@
+When enable multilib, it fails to run python3:
+
+| Could not find platform independent libraries <prefix>
+| Could not find platform dependent libraries <exec_prefix>
+| Consider setting $PYTHONHOME to <prefix>[:<exec_prefix>]
+| Fatal Python error: Py_Initialize: Unable to get the locale encoding
+| ImportError: No module named 'encodings'
+|
+| Current thread 0x00007f62ea5b2700 (most recent call first):
+| Aborted (core dumped)
+
+The root cause is the module search path /usr/lib is wrong for x86-64 when
+multilib is enabled. So replace fixed path string with right macro.
+
+Upstream-Status: Pending
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff --git a/Modules/getpath.c b/Modules/getpath.c
+index 18deb60..d22af53 100644
+--- a/Modules/getpath.c
++++ b/Modules/getpath.c
+@@ -494,7 +494,7 @@ calculate_path(void)
+     _pythonpath = Py_DecodeLocale(PYTHONPATH, NULL);
+     _prefix = Py_DecodeLocale(PREFIX, NULL);
+     _exec_prefix = Py_DecodeLocale(EXEC_PREFIX, NULL);
+-    lib_python = Py_DecodeLocale("lib/python" VERSION, NULL);
++    lib_python = Py_DecodeLocale(LIB_PYTHON, NULL);
+ 
+     if (!_pythonpath || !_prefix || !_exec_prefix || !lib_python) {
+         Py_FatalError(
+@@ -683,7 +683,7 @@ calculate_path(void)
+     }
+     else
+         wcsncpy(zip_path, _prefix, MAXPATHLEN);
+-    joinpath(zip_path, L"lib/python00.zip");
++    joinpath(zip_path, LIB L"/python00.zip");
+     bufsz = wcslen(zip_path);   /* Replace "00" with version */
+     zip_path[bufsz - 6] = VERSION[0];
+     zip_path[bufsz - 5] = VERSION[2];
+@@ -695,7 +695,7 @@ calculate_path(void)
+             fprintf(stderr,
+                 "Could not find platform dependent libraries <exec_prefix>\n");
+         wcsncpy(exec_prefix, _exec_prefix, MAXPATHLEN);
+-        joinpath(exec_prefix, L"lib/lib-dynload");
++        joinpath(exec_prefix, LIB L"/lib-dynload");
+     }
+     /* If we found EXEC_PREFIX do *not* reduce it!  (Yet.) */
+ 
diff --git a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
index 056e8e7..f7e73ee 100644
--- a/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
+++ b/meta/recipes-devtools/python/python3/python-3.3-multilib.patch
@@ -7,6 +7,11 @@ get the sys.lib from python itself and do not use hardcoded value of 'lib'
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
 
+Remove the section to add a global var in Modules/getpath.c that the global var
+has been removed from python3 upstream.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
 Index: Python-3.5.2/Include/pythonrun.h
 ===================================================================
 --- Python-3.5.2.orig/Include/pythonrun.h
@@ -130,14 +135,6 @@ Index: Python-3.5.2/Modules/getpath.c
  #ifndef LANDMARK
  #define LANDMARK L"os.py"
  #endif
-@@ -113,6 +120,7 @@ static wchar_t prefix[MAXPATHLEN+1];
- static wchar_t exec_prefix[MAXPATHLEN+1];
- static wchar_t progpath[MAXPATHLEN+1];
- static wchar_t *module_search_path = NULL;
-+static wchar_t *lib_python = L"" LIB_PYTHON;
- 
- /* Get file status. Encode the path to the locale encoding. */
- 
 Index: Python-3.5.2/Python/getplatform.c
 ===================================================================
 --- Python-3.5.2.orig/Python/getplatform.c
diff --git a/meta/recipes-devtools/python/python3_3.5.2.bb b/meta/recipes-devtools/python/python3_3.5.2.bb
index e6cbb9c..7e6f019 100644
--- a/meta/recipes-devtools/python/python3_3.5.2.bb
+++ b/meta/recipes-devtools/python/python3_3.5.2.bb
@@ -37,6 +37,7 @@ SRC_URI += "\
             file://setup.py-find-libraries-in-staging-dirs.patch \
             file://configure.ac-fix-LIBPL.patch \
             file://python3-fix-CVE-2016-1000110.patch \
+            file://correct-python3-lib-pathes-for-multilib-support.patch \
            "
 SRC_URI[md5sum] = "8906efbacfcdc7c3c9198aeefafd159e"
 SRC_URI[sha256sum] = "0010f56100b9b74259ebcd5d4b295a32324b58b517403a10d1a2aa7cb22bca40"
-- 
2.10.1



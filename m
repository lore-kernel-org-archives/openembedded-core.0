Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9755D79312
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 08:40:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9P8eNUp023637
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Oct 2018 01:40:23 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 25 Oct 2018 01:39:51 -0700
From: <mingli.yu@windriver.com>
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
Date: Thu, 25 Oct 2018 16:39:19 +0800
Message-ID: <1540456759-247805-3-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1540456759-247805-1-git-send-email-mingli.yu@windriver.com>
References: <1540456759-247805-1-git-send-email-mingli.yu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] python: add tk support
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
X-List-Received-Date: Thu, 25 Oct 2018 08:40:22 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Enable tk to add tk support for python.
before the patch:
 # python
 Python 2.7.15 (default, Oct 25 2018, 08:12:45)
 [GCC 8.2.0] on linux2
 Type "help", "copyright", "credits" or "license" for more information.
 >>> import Tkinter
 Traceback (most recent call last):
   File "<stdin>", line 1, in <module>
   File "/usr/lib64/python2.7/lib-tk/Tkinter.py", line 39, in <module>
     import _tkinter # If this fails your Python may not be configured for Tk
 ImportError: No module named _tkinter
 >>>

after the patch:
 # python
 Python 2.7.15 (default, Oct 25 2018, 08:12:45)
 [GCC 8.2.0] on linux2
 Type "help", "copyright", "credits" or "license" for more information.
 >>> import Tkinter
 >>>

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 .../python/avoid_warning_about_tkinter.patch       | 29 ----------------------
 .../python/python/python2-manifest.json            |  8 +++---
 meta/recipes-devtools/python/python_2.7.15.bb      |  8 +++---
 3 files changed, 10 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python/avoid_warning_about_tkinter.patch

diff --git a/meta/recipes-devtools/python/python/avoid_warning_about_tkinter.patch b/meta/recipes-devtools/python/python/avoid_warning_about_tkinter.patch
deleted file mode 100644
index 287095f..0000000
--- a/meta/recipes-devtools/python/python/avoid_warning_about_tkinter.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-_tkinter module needs tk module along with tcl. tk is not yet integrated
-in yocto so we skip the check for this module.
-Avoid a warning by not adding this module to missing variable.
-
-Upstream-Status: Inappropriate [distribution]
-
-Also simply disable the tk module since its not in DEPENDS.
-Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
-
-Index: Python-2.7.13/setup.py
-===================================================================
---- Python-2.7.13.orig/setup.py
-+++ Python-2.7.13/setup.py
-@@ -1783,10 +1783,12 @@ class PyBuildExt(build_ext):
-         self.extensions.extend(exts)
- 
-         # Call the method for detecting whether _tkinter can be compiled
--        self.detect_tkinter(inc_dirs, lib_dirs)
-+        # self.detect_tkinter(inc_dirs, lib_dirs)
- 
--        if '_tkinter' not in [e.name for e in self.extensions]:
--            missing.append('_tkinter')
-+        # tkinter module will not be avalaible as yocto
-+        # doesn't have tk integrated (yet)
-+        #if '_tkinter' not in [e.name for e in self.extensions]:
-+        #    missing.append('_tkinter')
- 
- ##         # Uncomment these lines if you want to play with xxmodule.c
- ##         ext = Extension('xx', ['xxmodule.c'])
diff --git a/meta/recipes-devtools/python/python/python2-manifest.json b/meta/recipes-devtools/python/python/python2-manifest.json
index 260fa6f..7b49e94 100644
--- a/meta/recipes-devtools/python/python/python2-manifest.json
+++ b/meta/recipes-devtools/python/python/python2-manifest.json
@@ -963,10 +963,12 @@
     "tkinter": {
         "summary": "Python Tcl/Tk bindings", 
         "rdepends": [
-            "core"
+            "core",
+            "tk"
         ], 
         "files": [
-            "${libdir}/python2.7/lib-tk"
+            "${libdir}/python2.7/lib-tk",
+            "${libdir}/python2.7/lib-dynload/_tkinter.so"
         ]
     }, 
     "unittest": {
@@ -1043,4 +1045,4 @@
             "${libdir}/python2.7/lib-dynload/zlib.so"
         ]
     }
-}
\ No newline at end of file
+}
diff --git a/meta/recipes-devtools/python/python_2.7.15.bb b/meta/recipes-devtools/python/python_2.7.15.bb
index dd969d8..a6ecbb9 100644
--- a/meta/recipes-devtools/python/python_2.7.15.bb
+++ b/meta/recipes-devtools/python/python_2.7.15.bb
@@ -1,6 +1,6 @@
 require python.inc
 
-DEPENDS = "python-native libffi bzip2 gdbm openssl \
+DEPENDS = "python-native libffi bzip2 gdbm openssl tk \
            readline sqlite3 zlib virtual/crypt"
 
 PR = "${INC_PR}"
@@ -21,7 +21,6 @@ SRC_URI += "\
   file://setuptweaks.patch \
   file://check-if-target-is-64b-not-host.patch \
   file://search_db_h_in_inc_dirs_and_avoid_warning.patch \
-  file://avoid_warning_about_tkinter.patch \
   file://avoid_warning_for_sunos_specific_module.patch \
   file://python-2.7.3-remove-bsdb-rpath.patch \
   file://run-ptest \
@@ -227,7 +226,10 @@ python(){
             # Make it work with or without $PN
             if '${PN}' in value:
                 value=value.split('-')[1]
-            d.appendVar('RDEPENDS_' + pypackage, ' ' + pn + '-' + value)
+            if "tkinter" in pypackage and value == "tk":
+                d.appendVar('RDEPENDS_' + pypackage, ' ' + value)
+            else:
+                d.appendVar('RDEPENDS_' + pypackage, ' ' + pn + '-' + value)
         d.setVar('SUMMARY_' + pypackage, python_manifest[key]['summary'])
 
     # Prepending so to avoid python-misc getting everything
-- 
2.7.4



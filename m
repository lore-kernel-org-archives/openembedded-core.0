Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 47A5B7458F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 11:49:07 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id v16-v6so12558103wro.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 04:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=TbYf7Um+tr5gRBGFhoVZikmcLknJbjxaHBgCGUMXIg4=;
	b=q9ZAuGVYF9DVXjTueir4mq9NfweqlY2WMVL7uh4ihYjwp4+9/ZWi+oAPE70Liz9mUd
	Af+JL+KIUlVHlg+Vg//BDoGB+yTqPnHi44NwNtwGH32DO/0CsCOIzNtFSx6FIIHCkNkb
	LKyTbPbGtVnmEjVZ8KoWrSvYqFAQDcl5zKzaXfXJsltnPgUIs0mDfi/phdl6xIQB/IWn
	/nF9glNTiuI7PTyOx5CE9tbHjjhMBG+XJcrLr8bwVao7BqNi963eCWqxCly4pHsGvVfV
	9VIohXWs4CUJgOyAHj7djTJLla7rPJ6n28rQjz/Q3r0V+BQWJFwsB9ye6BuFlpxvM9VF
	gvFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=TbYf7Um+tr5gRBGFhoVZikmcLknJbjxaHBgCGUMXIg4=;
	b=M/f8b1ZCUk2gt3hign/O94mPdHpI82A+PU5QhR622MYBT4x32gAnt4NwMlCKJnsMw2
	0tB/9VhHsYYtKMcj72S59a+pjyBnLhdy3hSDcDWO+XpCbYynIu/dK8XqOVFa97MEw0QZ
	kFf/Fr7s+yE6uxac1OI2wyNHbFCFWsKyyE2AbWpBWpgI67vp044CFjwuZ+kuNMsswHR1
	ITht1UMFuhDAaZUc1kVnskk/mUilp4lwXzBDkLO6tPyJ7CmUaPp5lfMrbzFh2/j7zbzU
	Id4Ufjd8mlSt2FZyO6g9sDDB/SJ8reSDC6lWvFI7515pyEI5Tjg22B7EnkcD1dBqHk8T
	iogw==
X-Gm-Message-State: ABuFfogEI13mH7+NBlfkSnXOMz+XMC9eHS8Gfb2EyqV7beA/qIYizB5W
	j+8DlvuAb9t4OdEWtreXyrhVaUvFOyo=
X-Google-Smtp-Source: ACcGV60wBkPRh3f9Sev2p1gSDiWfyeysNWpBkdpXKVBNk1TKc4Dy9KJo6+GLI6he34o9l05Ym5O3pw==
X-Received: by 2002:adf:ffc3:: with SMTP id
	x3-v6mr2356885wrs.137.1537530546719; 
	Fri, 21 Sep 2018 04:49:06 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	n8-v6sm3479850wrw.31.2018.09.21.04.49.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Sep 2018 04:49:06 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Sep 2018 12:48:57 +0100
Message-Id: <20180921114900.26338-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/4] python3: don't sort the manifest in create_manifest
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
X-List-Received-Date: Fri, 21 Sep 2018 11:49:08 -0000

Instead of sorting the entire manifest when it is updated, use OrderedDict to
preserve the order of fields.  This means that packages can be ordered in the
manifest to allow non-trivial FILES assignments (such as a package that picks up
pieces of other packages)

The manifest has been regenerated with the new stable ordering, and
distutils-staticdev moved above distutils so the packaging rules work as
expected.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../python/python3/create_manifest3.py             |  21 +-
 .../python/python3/python3-manifest.json           | 940 ++++++++++-----------
 2 files changed, 480 insertions(+), 481 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/create_manifest3.py b/meta/recipes-devtools/python/python3/create_manifest3.py
index 2db5e3b0b67..efef62af943 100644
--- a/meta/recipes-devtools/python/python3/create_manifest3.py
+++ b/meta/recipes-devtools/python/python3/create_manifest3.py
@@ -43,6 +43,7 @@ import sys
 import subprocess
 import json
 import os
+import collections
 
 # Get python version from ${PYTHON_MAJMIN}
 pyversion = str(sys.argv[1])
@@ -54,7 +55,7 @@ for p in sys.path:
         nativelibfolder = p[:p.find(pivot)+len(pivot)]
 
 # Empty dict to hold the whole manifest
-new_manifest = {}
+new_manifest = collections.OrderedDict()
 
 # Check for repeated files, folders and wildcards
 allfiles = []
@@ -79,7 +80,7 @@ def isCached(item):
 
 # Read existing JSON manifest
 with open('python3-manifest.json') as manifest:
-    old_manifest = json.load(manifest)
+    old_manifest = json.load(manifest, object_pairs_hook=collections.OrderedDict)
 
 #
 # First pass to get core-package functionality, because we base everything on the fact that core is actually working
@@ -195,18 +196,16 @@ for pypkg in old_manifest:
 
 for pypkg in old_manifest:
     # Use an empty dict as data structure to hold data for each package and fill it up
-    new_manifest[pypkg] = {}
-    new_manifest[pypkg]['files'] = []
+    new_manifest[pypkg] = collections.OrderedDict()
+    new_manifest[pypkg]['summary'] = old_manifest[pypkg]['summary']
     new_manifest[pypkg]['rdepends'] = []
+    new_manifest[pypkg]['files'] = []
+    new_manifest[pypkg]['cached'] = old_manifest[pypkg]['cached']
 
     # All packages should depend on core
     if pypkg != 'core':
-         new_manifest[pypkg]['rdepends'].append('core')
-         new_manifest[pypkg]['cached'] = []
-    else:
-         new_manifest[pypkg]['cached'] = old_manifest[pypkg]['cached']
-    new_manifest[pypkg]['summary'] = old_manifest[pypkg]['summary']
-
+        new_manifest[pypkg]['rdepends'].append('core')
+        new_manifest[pypkg]['cached'] = []
 
     print('\n')
     print('--------------------------')
@@ -400,7 +399,7 @@ for pypkg in new_manifest:
 
 # Create the manifest from the data structure that was built
 with open('python3-manifest.json.new','w') as outfile:
-    json.dump(new_manifest,outfile,sort_keys=True, indent=4)
+    json.dump(new_manifest,outfile, indent=4)
     outfile.write('\n')
 
 if (repeated):
diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
index 90a41fbf29c..95ae3fb0215 100644
--- a/meta/recipes-devtools/python/python3/python3-manifest.json
+++ b/meta/recipes-devtools/python/python3/python3-manifest.json
@@ -1,22 +1,17 @@
 {
     "2to3": {
-        "cached": [],
+        "summary": "Python automated Python 2 to 3 code translator",
+        "rdepends": [
+            "core"
+        ],
         "files": [
             "${bindir}/2to3-*",
             "${libdir}/python${PYTHON_MAJMIN}/lib2to3"
         ],
-        "rdepends": [
-            "core"
-        ],
-        "summary": "Python automated Python 2 to 3 code translator"
+        "cached": []
     },
     "asyncio": {
-        "cached": [],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/asyncio",
-            "${libdir}/python${PYTHON_MAJMIN}/concurrent",
-            "${libdir}/python${PYTHON_MAJMIN}/concurrent/futures"
-        ],
+        "summary": "Python Asynchronous I/",
         "rdepends": [
             "compression",
             "core",
@@ -32,14 +27,17 @@
             "threading",
             "unixadmin"
         ],
-        "summary": "Python Asynchronous I/"
+        "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/asyncio",
+            "${libdir}/python${PYTHON_MAJMIN}/concurrent",
+            "${libdir}/python${PYTHON_MAJMIN}/concurrent/futures"
+        ],
+        "cached": []
     },
     "audio": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/chunk.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sndhdr.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sunau.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/wave.*.pyc"
+        "summary": "Python Audio Handling",
+        "rdepends": [
+            "core"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/chunk.py",
@@ -49,33 +47,28 @@
             "${libdir}/python${PYTHON_MAJMIN}/sunau.py",
             "${libdir}/python${PYTHON_MAJMIN}/wave.py"
         ],
-        "rdepends": [
-            "core"
-        ],
-        "summary": "Python Audio Handling"
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/chunk.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sndhdr.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sunau.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/wave.*.pyc"
+        ]
     },
     "codecs": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/xdrlib.*.pyc"
+        "summary": "Python codec",
+        "rdepends": [
+            "core"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_multibytecodec.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/xdrlib.py"
         ],
-        "rdepends": [
-            "core"
-        ],
-        "summary": "Python codec"
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/xdrlib.*.pyc"
+        ]
     },
     "compile": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/compileall.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/py_compile.*.pyc"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/compileall.py",
-            "${libdir}/python${PYTHON_MAJMIN}/py_compile.py"
-        ],
+        "summary": "Python bytecode compilation support",
         "rdepends": [
             "asyncio",
             "compression",
@@ -91,16 +84,21 @@
             "threading",
             "unixadmin"
         ],
-        "summary": "Python bytecode compilation support"
+        "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/compileall.py",
+            "${libdir}/python${PYTHON_MAJMIN}/py_compile.py"
+        ],
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/compileall.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/py_compile.*.pyc"
+        ]
     },
     "compression": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_compression.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bz2.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/gzip.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/lzma.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tarfile.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/zipfile.*.pyc"
+        "summary": "Python high-level compression support",
+        "rdepends": [
+            "core",
+            "shell",
+            "unixadmin"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/_compression.py",
@@ -113,87 +111,18 @@
             "${libdir}/python${PYTHON_MAJMIN}/tarfile.py",
             "${libdir}/python${PYTHON_MAJMIN}/zipfile.py"
         ],
-        "rdepends": [
-            "core",
-            "shell",
-            "unixadmin"
-        ],
-        "summary": "Python high-level compression support"
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_compression.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bz2.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/gzip.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/lzma.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tarfile.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/zipfile.*.pyc"
+        ]
     },
     "core": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/__future__.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_bootlocale.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_collections_abc.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_markupbase.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sitebuiltins.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sysconfigdata.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_weakrefset.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/abc.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/argparse.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ast.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bisect.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/code.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/codecs.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/codeop.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/configparser.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/contextlib.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/copy.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/copyreg.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/csv.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/dis.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/enum.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/functools.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/genericpath.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/getopt.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/gettext.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/heapq.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/imp.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/inspect.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/io.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/keyword.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/linecache.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/locale.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/opcode.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/operator.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/optparse.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/os.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/platform.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/posixpath.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/re.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/reprlib.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/rlcompleter.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/selectors.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/signal.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/site.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sre_compile.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sre_constants.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sre_parse.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/stat.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/stringprep.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/struct.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/subprocess.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/symbol.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sysconfig.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/textwrap.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/threading.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/token.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tokenize.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/traceback.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/types.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/warnings.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/weakref.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/collections/__pycache__",
-            "${libdir}/python${PYTHON_MAJMIN}/collections/__pycache__/abc.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__",
-            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__/aliases.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__/latin_1.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__/utf_8.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__",
-            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/abc.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/machinery.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/util.*.pyc"
-        ],
+        "summary": "Python interpreter and core modules",
+        "rdepends": [],
         "files": [
             "${bindir}/python*[!-config]",
             "${includedir}/python${PYTHON_BINABI}/pyconfig*.h",
@@ -296,13 +225,86 @@
             "${libdir}/python${PYTHON_MAJMIN}/warnings.py",
             "${libdir}/python${PYTHON_MAJMIN}/weakref.py"
         ],
-        "rdepends": [],
-        "summary": "Python interpreter and core modules"
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/__future__.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_bootlocale.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_collections_abc.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_markupbase.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sitebuiltins.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sysconfigdata.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_weakrefset.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/abc.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/argparse.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ast.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bisect.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/code.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/codecs.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/codeop.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/configparser.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/contextlib.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/copy.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/copyreg.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/csv.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/dis.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/enum.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/functools.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/genericpath.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/getopt.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/gettext.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/heapq.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/imp.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/inspect.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/io.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/keyword.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/linecache.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/locale.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/opcode.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/operator.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/optparse.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/os.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/platform.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/posixpath.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/re.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/reprlib.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/rlcompleter.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/selectors.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/signal.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/site.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sre_compile.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sre_constants.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sre_parse.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/stat.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/stringprep.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/struct.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/subprocess.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/symbol.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/sysconfig.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/textwrap.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/threading.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/token.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tokenize.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/traceback.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/types.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/warnings.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/weakref.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/collections/__pycache__",
+            "${libdir}/python${PYTHON_MAJMIN}/collections/__pycache__/abc.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__",
+            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__/aliases.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__/latin_1.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/encodings/__pycache__/utf_8.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__",
+            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/abc.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/machinery.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/importlib/__pycache__/util.*.pyc"
+        ]
     },
     "crypt": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/crypt.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/hashlib.*.pyc"
+        "summary": "Python basic cryptographic and hashing support",
+        "rdepends": [
+            "core",
+            "math",
+            "stringold"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/crypt.py",
@@ -312,81 +314,79 @@
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha256.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha512.*.so"
         ],
-        "rdepends": [
-            "core",
-            "math",
-            "stringold"
-        ],
-        "summary": "Python basic cryptographic and hashing support"
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/crypt.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/hashlib.*.pyc"
+        ]
     },
     "ctypes": {
-        "cached": [],
+        "summary": "Python C types support",
+        "rdepends": [
+            "core"
+        ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/ctypes",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_ctypes.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_ctypes_test.*.so"
         ],
+        "cached": []
+    },
+    "curses": {
+        "summary": "Python curses support",
         "rdepends": [
             "core"
         ],
-        "summary": "Python C types support"
-    },
-    "curses": {
-        "cached": [],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/curses",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_curses.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_curses_panel.*.so"
         ],
+        "cached": []
+    },
+    "datetime": {
+        "summary": "Python calendar and time support",
         "rdepends": [
             "core"
         ],
-        "summary": "Python curses support"
-    },
-    "datetime": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_strptime.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/calendar.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/datetime.*.pyc"
-        ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/_strptime.py",
             "${libdir}/python${PYTHON_MAJMIN}/calendar.py",
             "${libdir}/python${PYTHON_MAJMIN}/datetime.py",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_datetime.*.so"
         ],
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_strptime.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/calendar.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/datetime.*.pyc"
+        ]
+    },
+    "db": {
+        "summary": "Python file-based database support",
         "rdepends": [
             "core"
         ],
-        "summary": "Python calendar and time support"
-    },
-    "db": {
-        "cached": [],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/dbm",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_dbm.*.so"
         ],
-        "rdepends": [
-            "core"
-        ],
-        "summary": "Python file-based database support"
+        "cached": []
     },
     "debugger": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bdb.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pdb.*.pyc"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/bdb.py",
-            "${libdir}/python${PYTHON_MAJMIN}/pdb.py"
-        ],
+        "summary": "Python debugger",
         "rdepends": [
             "core",
             "pprint",
             "shell",
             "stringold"
         ],
-        "summary": "Python debugger"
+        "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/bdb.py",
+            "${libdir}/python${PYTHON_MAJMIN}/pdb.py"
+        ],
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/bdb.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pdb.*.pyc"
+        ]
     },
     "dev": {
         "cached": [],
@@ -411,26 +411,16 @@
         "summary": "Python development package"
     },
     "difflib": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/difflib.*.pyc"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/difflib.py"
-        ],
+        "summary": "Python helpers for computing deltas between objects",
         "rdepends": [
             "core"
         ],
-        "summary": "Python helpers for computing deltas between objects"
-    },
-    "distutils": {
-        "cached": [],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/distutils"
-        ],
-        "rdepends": [
-            "core"
+            "${libdir}/python${PYTHON_MAJMIN}/difflib.py"
         ],
-        "summary": "Python Distribution Utilities"
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/difflib.*.pyc"
+        ]
     },
     "distutils-staticdev": {
         "cached": [
@@ -444,13 +434,18 @@
         ],
         "summary": "Python distribution utilities (static libraries)"
     },
-    "doctest": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/doctest.*.pyc"
+    "distutils": {
+        "summary": "Python Distribution Utilities",
+        "rdepends": [
+            "core"
         ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/doctest.py"
+            "${libdir}/python${PYTHON_MAJMIN}/distutils"
         ],
+        "cached": []
+    },
+    "doctest": {
+        "summary": "Python framework for running examples in docstrings",
         "rdepends": [
             "core",
             "debugger",
@@ -461,16 +456,15 @@
             "stringold",
             "unittest"
         ],
-        "summary": "Python framework for running examples in docstrings"
-    },
-    "email": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/imaplib.*.pyc"
-        ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/email",
-            "${libdir}/python${PYTHON_MAJMIN}/imaplib.py"
+            "${libdir}/python${PYTHON_MAJMIN}/doctest.py"
         ],
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/doctest.*.pyc"
+        ]
+    },
+    "email": {
+        "summary": "Python email support",
         "rdepends": [
             "core",
             "crypt",
@@ -479,74 +473,82 @@
             "math",
             "netclient"
         ],
-        "summary": "Python email support"
+        "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/email",
+            "${libdir}/python${PYTHON_MAJMIN}/imaplib.py"
+        ],
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/imaplib.*.pyc"
+        ]
     },
     "fcntl": {
-        "cached": [],
+        "summary": "Python's fcntl interface",
+        "rdepends": [
+            "core"
+        ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/fcntl.*.so"
         ],
+        "cached": []
+    },
+    "gdbm": {
+        "summary": "Python GNU database support",
         "rdepends": [
             "core"
         ],
-        "summary": "Python's fcntl interface"
-    },
-    "gdbm": {
-        "cached": [],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_gdbm.*.so"
         ],
-        "rdepends": [
-            "core"
-        ],
-        "summary": "Python GNU database support"
+        "cached": []
     },
     "html": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/formatter.*.pyc"
+        "summary": "Python HTML processing support",
+        "rdepends": [
+            "core"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/formatter.py",
             "${libdir}/python${PYTHON_MAJMIN}/html"
         ],
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/formatter.*.pyc"
+        ]
+    },
+    "idle": {
+        "summary": "Python Integrated Development Environment",
         "rdepends": [
             "core"
         ],
-        "summary": "Python HTML processing support"
-    },
-    "idle": {
-        "cached": [],
         "files": [
             "${bindir}/idle*",
             "${libdir}/python${PYTHON_MAJMIN}/idlelib"
         ],
-        "rdepends": [
-            "core"
-        ],
-        "summary": "Python Integrated Development Environment"
+        "cached": []
     },
     "image": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/colorsys.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/imghdr.*.pyc"
+        "summary": "Python graphical image handling",
+        "rdepends": [
+            "core"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/colorsys.py",
             "${libdir}/python${PYTHON_MAJMIN}/imghdr.py"
         ],
-        "rdepends": [
-            "core"
-        ],
-        "summary": "Python graphical image handling"
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/colorsys.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/imghdr.*.pyc"
+        ]
     },
     "io": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_pyio.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ipaddress.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pipes.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/socket.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ssl.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tempfile.*.pyc"
+        "summary": "Python low-level I/O",
+        "rdepends": [
+            "compression",
+            "core",
+            "crypt",
+            "math",
+            "netclient",
+            "shell",
+            "unixadmin"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/_pyio.py",
@@ -559,46 +561,39 @@
             "${libdir}/python${PYTHON_MAJMIN}/ssl.py",
             "${libdir}/python${PYTHON_MAJMIN}/tempfile.py"
         ],
-        "rdepends": [
-            "compression",
-            "core",
-            "crypt",
-            "math",
-            "netclient",
-            "shell",
-            "unixadmin"
-        ],
-        "summary": "Python low-level I/O"
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_pyio.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ipaddress.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pipes.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/socket.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ssl.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tempfile.*.pyc"
+        ]
     },
     "json": {
-        "cached": [],
+        "summary": "Python JSON support",
+        "rdepends": [
+            "core"
+        ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/json",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_json.*.so"
         ],
-        "rdepends": [
-            "core"
-        ],
-        "summary": "Python JSON support"
+        "cached": []
     },
     "logging": {
-        "cached": [],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/logging"
-        ],
+        "summary": "Python logging support",
         "rdepends": [
             "core",
             "stringold"
         ],
-        "summary": "Python logging support"
-    },
-    "mailbox": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/mailbox.*.pyc"
-        ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/mailbox.py"
+            "${libdir}/python${PYTHON_MAJMIN}/logging"
         ],
+        "cached": []
+    },
+    "mailbox": {
+        "summary": "Python mailbox format support",
         "rdepends": [
             "core",
             "crypt",
@@ -611,46 +606,51 @@
             "netclient",
             "stringold"
         ],
-        "summary": "Python mailbox format support"
+        "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/mailbox.py"
+        ],
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/mailbox.*.pyc"
+        ]
     },
     "math": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/random.*.pyc"
+        "summary": "Python math support",
+        "rdepends": [
+            "core",
+            "crypt"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_random.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/cmath.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/random.py"
         ],
-        "rdepends": [
-            "core",
-            "crypt"
-        ],
-        "summary": "Python math support"
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/random.*.pyc"
+        ]
     },
     "mime": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/quopri.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/uu.*.pyc"
+        "summary": "Python MIME handling APIs",
+        "rdepends": [
+            "core"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/quopri.py",
             "${libdir}/python${PYTHON_MAJMIN}/uu.py"
         ],
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/quopri.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/uu.*.pyc"
+        ]
+    },
+    "mmap": {
+        "summary": "Python memory-mapped file support",
         "rdepends": [
             "core"
         ],
-        "summary": "Python MIME handling APIs"
-    },
-    "mmap": {
-        "cached": [],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/mmap.*.so"
         ],
-        "rdepends": [
-            "core"
-        ],
-        "summary": "Python memory-mapped file support"
+        "cached": []
     },
     "modules": {
         "cached": [],
@@ -713,27 +713,31 @@
         "summary": "All Python modules"
     },
     "multiprocessing": {
-        "cached": [],
+        "summary": "Python multiprocessing support",
+        "rdepends": [
+            "core"
+        ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_multiprocessing.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/multiprocessing"
         ],
-        "rdepends": [
-            "core"
-        ],
-        "summary": "Python multiprocessing support"
+        "cached": []
     },
     "netclient": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/base64.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ftplib.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/hmac.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/mimetypes.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/nntplib.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/poplib.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/smtplib.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/telnetlib.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/uuid.*.pyc"
+        "summary": "Python Internet Protocol clients",
+        "rdepends": [
+            "compression",
+            "core",
+            "crypt",
+            "ctypes",
+            "datetime",
+            "email",
+            "io",
+            "math",
+            "mime",
+            "shell",
+            "stringold",
+            "unixadmin"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/base64.py",
@@ -750,54 +754,48 @@
             "${libdir}/python${PYTHON_MAJMIN}/urllib/__pycache__",
             "${libdir}/python${PYTHON_MAJMIN}/uuid.py"
         ],
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/base64.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/ftplib.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/hmac.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/mimetypes.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/nntplib.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/poplib.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/smtplib.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/telnetlib.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/uuid.*.pyc"
+        ]
+    },
+    "netserver": {
+        "summary": "Python Internet Protocol servers",
         "rdepends": [
             "compression",
             "core",
             "crypt",
-            "ctypes",
             "datetime",
             "email",
+            "html",
             "io",
             "math",
             "mime",
+            "netclient",
             "shell",
             "stringold",
             "unixadmin"
         ],
-        "summary": "Python Internet Protocol clients"
-    },
-    "netserver": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cgi.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/socketserver.*.pyc"
-        ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/cgi.py",
             "${libdir}/python${PYTHON_MAJMIN}/socketserver.py"
         ],
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cgi.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/socketserver.*.pyc"
+        ]
+    },
+    "numbers": {
+        "summary": "Python number APIs",
         "rdepends": [
-            "compression",
-            "core",
-            "crypt",
-            "datetime",
-            "email",
-            "html",
-            "io",
-            "math",
-            "mime",
-            "netclient",
-            "shell",
-            "stringold",
-            "unixadmin"
-        ],
-        "summary": "Python Internet Protocol servers"
-    },
-    "numbers": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_pydecimal.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/decimal.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/fractions.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/numbers.*.pyc"
+            "core"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/_pydecimal.py",
@@ -806,17 +804,17 @@
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_decimal.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/numbers.py"
         ],
-        "rdepends": [
-            "core"
-        ],
-        "summary": "Python number APIs"
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_pydecimal.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/decimal.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/fractions.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/numbers.*.pyc"
+        ]
     },
     "pickle": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_compat_pickle.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pickle.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pickletools.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/shelve.*.pyc"
+        "summary": "Python serialisation/persistence support",
+        "rdepends": [
+            "core"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/_compat_pickle.py",
@@ -825,54 +823,55 @@
             "${libdir}/python${PYTHON_MAJMIN}/pickletools.py",
             "${libdir}/python${PYTHON_MAJMIN}/shelve.py"
         ],
-        "rdepends": [
-            "core"
-        ],
-        "summary": "Python serialisation/persistence support"
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_compat_pickle.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pickle.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pickletools.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/shelve.*.pyc"
+        ]
     },
     "pkgutil": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pkgutil.*.pyc"
+        "summary": "Python package extension utility support",
+        "rdepends": [
+            "core"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/pkgutil.py"
         ],
-        "rdepends": [
-            "core"
-        ],
-        "summary": "Python package extension utility support"
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pkgutil.*.pyc"
+        ]
     },
     "plistlib": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/plistlib.*.pyc"
-        ],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/plistlib.py"
-        ],
+        "summary": "Generate and parse Mac OS X .plist files",
         "rdepends": [
             "core",
             "datetime",
             "xml"
         ],
-        "summary": "Generate and parse Mac OS X .plist files"
+        "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/plistlib.py"
+        ],
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/plistlib.*.pyc"
+        ]
     },
     "pprint": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pprint.*.pyc"
+        "summary": "Python pretty-print support",
+        "rdepends": [
+            "core"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/pprint.py"
         ],
-        "rdepends": [
-            "core"
-        ],
-        "summary": "Python pretty-print support"
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pprint.*.pyc"
+        ]
     },
     "profile": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cProfile.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/profile.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pstats.*.pyc"
+        "summary": "Python basic performance profiling support",
+        "rdepends": [
+            "core"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/cProfile.py",
@@ -880,57 +879,58 @@
             "${libdir}/python${PYTHON_MAJMIN}/profile.py",
             "${libdir}/python${PYTHON_MAJMIN}/pstats.py"
         ],
-        "rdepends": [
-            "core"
-        ],
-        "summary": "Python basic performance profiling support"
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cProfile.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/profile.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pstats.*.pyc"
+        ]
     },
     "pydoc": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pydoc.*.pyc"
+        "summary": "Python interactive help support",
+        "rdepends": [
+            "core",
+            "netclient",
+            "pkgutil"
         ],
         "files": [
             "${bindir}/pydoc*",
             "${libdir}/python${PYTHON_MAJMIN}/pydoc.py",
             "${libdir}/python${PYTHON_MAJMIN}/pydoc_data"
         ],
-        "rdepends": [
-            "core",
-            "netclient",
-            "pkgutil"
-        ],
-        "summary": "Python interactive help support"
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pydoc.*.pyc"
+        ]
     },
     "resource": {
-        "cached": [],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/resource.*.so"
-        ],
+        "summary": "Python resource control interface",
         "rdepends": [
             "core"
         ],
-        "summary": "Python resource control interface"
-    },
-    "runpy": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/runpy.*.pyc"
-        ],
         "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/runpy.py"
+            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/resource.*.so"
         ],
+        "cached": []
+    },
+    "runpy": {
+        "summary": "Python helper for locating/executing scripts in module namespace",
         "rdepends": [
             "core",
             "pkgutil"
         ],
-        "summary": "Python helper for locating/executing scripts in module namespace"
+        "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/runpy.py"
+        ],
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/runpy.*.pyc"
+        ]
     },
     "shell": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cmd.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/fnmatch.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/glob.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/shlex.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/shutil.*.pyc"
+        "summary": "Python shell-like functionality",
+        "rdepends": [
+            "compression",
+            "core",
+            "stringold",
+            "unixadmin"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/cmd.py",
@@ -939,26 +939,16 @@
             "${libdir}/python${PYTHON_MAJMIN}/shlex.py",
             "${libdir}/python${PYTHON_MAJMIN}/shutil.py"
         ],
-        "rdepends": [
-            "compression",
-            "core",
-            "stringold",
-            "unixadmin"
-        ],
-        "summary": "Python shell-like functionality"
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cmd.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/fnmatch.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/glob.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/shlex.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/shutil.*.pyc"
+        ]
     },
     "smtpd": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/asynchat.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/asyncore.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/smtpd.*.pyc"
-        ],
-        "files": [
-            "${bindir}/smtpd.py",
-            "${libdir}/python${PYTHON_MAJMIN}/asynchat.py",
-            "${libdir}/python${PYTHON_MAJMIN}/asyncore.py",
-            "${libdir}/python${PYTHON_MAJMIN}/smtpd.py"
-        ],
+        "summary": "Python Simple Mail Transport Daemon",
         "rdepends": [
             "core",
             "crypt",
@@ -970,24 +960,34 @@
             "netclient",
             "stringold"
         ],
-        "summary": "Python Simple Mail Transport Daemon"
+        "files": [
+            "${bindir}/smtpd.py",
+            "${libdir}/python${PYTHON_MAJMIN}/asynchat.py",
+            "${libdir}/python${PYTHON_MAJMIN}/asyncore.py",
+            "${libdir}/python${PYTHON_MAJMIN}/smtpd.py"
+        ],
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/asynchat.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/asyncore.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/smtpd.*.pyc"
+        ]
     },
     "sqlite3": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/__pycache__",
-            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/__pycache__/dbapi2.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/__pycache__/dump.*.pyc"
+        "summary": "Python Sqlite3 database support",
+        "rdepends": [
+            "core",
+            "datetime"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sqlite3.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/sqlite3/dbapi2.py",
             "${libdir}/python${PYTHON_MAJMIN}/sqlite3/dump.py"
         ],
-        "rdepends": [
-            "core",
-            "datetime"
-        ],
-        "summary": "Python Sqlite3 database support"
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/__pycache__",
+            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/__pycache__/dbapi2.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/sqlite3/__pycache__/dump.*.pyc"
+        ]
     },
     "sqlite3-tests": {
         "cached": [],
@@ -1001,41 +1001,41 @@
         "summary": "Python Sqlite3 database support tests"
     },
     "stringold": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/string.*.pyc"
+        "summary": "Python string APIs [deprecated]",
+        "rdepends": [
+            "core"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/string.py"
         ],
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/string.*.pyc"
+        ]
+    },
+    "syslog": {
+        "summary": "Python syslog interface",
         "rdepends": [
             "core"
         ],
-        "summary": "Python string APIs [deprecated]"
-    },
-    "syslog": {
-        "cached": [],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/syslog.*.so"
         ],
-        "rdepends": [
-            "core"
-        ],
-        "summary": "Python syslog interface"
+        "cached": []
     },
     "terminal": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pty.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tty.*.pyc"
+        "summary": "Python terminal controlling support",
+        "rdepends": [
+            "core",
+            "io"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/pty.py",
             "${libdir}/python${PYTHON_MAJMIN}/tty.py"
         ],
-        "rdepends": [
-            "core",
-            "io"
-        ],
-        "summary": "Python terminal controlling support"
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pty.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tty.*.pyc"
+        ]
     },
     "tests": {
         "cached": [],
@@ -1049,11 +1049,9 @@
         "summary": "Python tests"
     },
     "threading": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_dummy_thread.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_threading_local.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/dummy_threading.*.pyc",
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/queue.*.pyc"
+        "summary": "Python threading & synchronization support",
+        "rdepends": [
+            "core"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/_dummy_thread.py",
@@ -1061,40 +1059,37 @@
             "${libdir}/python${PYTHON_MAJMIN}/dummy_threading.py",
             "${libdir}/python${PYTHON_MAJMIN}/queue.py"
         ],
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_dummy_thread.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_threading_local.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/dummy_threading.*.pyc",
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/queue.*.pyc"
+        ]
+    },
+    "tkinter": {
+        "summary": "Python Tcl/Tk bindings",
         "rdepends": [
             "core"
         ],
-        "summary": "Python threading & synchronization support"
-    },
-    "tkinter": {
-        "cached": [],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/tkinter"
         ],
-        "rdepends": [
-            "core"
-        ],
-        "summary": "Python Tcl/Tk bindings"
+        "cached": []
     },
     "typing": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/typing.*.pyc"
+        "summary": "Python typing support",
+        "rdepends": [
+            "core"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/typing.py"
         ],
-        "rdepends": [
-            "core"
-        ],
-        "summary": "Python typing support"
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/typing.*.pyc"
+        ]
     },
     "unittest": {
-        "cached": [],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/unittest",
-            "${libdir}/python${PYTHON_MAJMIN}/unittest/",
-            "${libdir}/python${PYTHON_MAJMIN}/unittest/__pycache__"
-        ],
+        "summary": "Python unit testing framework",
         "rdepends": [
             "core",
             "difflib",
@@ -1103,45 +1098,50 @@
             "shell",
             "stringold"
         ],
-        "summary": "Python unit testing framework"
+        "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/unittest",
+            "${libdir}/python${PYTHON_MAJMIN}/unittest/",
+            "${libdir}/python${PYTHON_MAJMIN}/unittest/__pycache__"
+        ],
+        "cached": []
     },
     "unixadmin": {
-        "cached": [
-            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/getpass.*.pyc"
+        "summary": "Python Unix administration support",
+        "rdepends": [
+            "core",
+            "io"
         ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/getpass.py",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/grp.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/nis.*.so"
         ],
-        "rdepends": [
-            "core",
-            "io"
-        ],
-        "summary": "Python Unix administration support"
+        "cached": [
+            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/getpass.*.pyc"
+        ]
     },
     "xml": {
-        "cached": [],
+        "summary": "Python basic XML support",
+        "rdepends": [
+            "core"
+        ],
         "files": [
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_elementtree.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/pyexpat.*.so",
             "${libdir}/python${PYTHON_MAJMIN}/xml"
         ],
-        "rdepends": [
-            "core"
-        ],
-        "summary": "Python basic XML support"
+        "cached": []
     },
     "xmlrpc": {
-        "cached": [],
-        "files": [
-            "${libdir}/python${PYTHON_MAJMIN}/xmlrpc",
-            "${libdir}/python${PYTHON_MAJMIN}/xmlrpc/__pycache__"
-        ],
+        "summary": "Python XML-RPC support",
         "rdepends": [
             "core",
             "xml"
         ],
-        "summary": "Python XML-RPC support"
+        "files": [
+            "${libdir}/python${PYTHON_MAJMIN}/xmlrpc",
+            "${libdir}/python${PYTHON_MAJMIN}/xmlrpc/__pycache__"
+        ],
+        "cached": []
     }
 }
-- 
2.11.0



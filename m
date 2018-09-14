Return-Path: <geissonator@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id BEEDD71C9B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 21:33:21 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id h23-v6so4343911ita.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 14:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=qRTBLm2XREhM7EPZIFYBJOiGDKSqBlRg/1nvXJSpEMc=;
	b=tfB4Ka1vbJCz6she2an33+n4BhsrRLwisszADLG6RFTNOQRkcs1ONAdVA3FbHKPETP
	36xp10He4xUWA/DZGDKaIshMrCKZ3cV07Fp/+oKn1crj979SHa+xlBDnUJZqaT9odMmN
	M1VTneX19N80JIcfKW+eMooWwDLlEKJFz/lR6b5vG4+vvk78oiDSrWrIbJ8NdlzT9OWh
	uzAI4lWnfxGg37ckBsGSofscDpiIaLeqGTd5SA/HrUa+kLIoYINPR7BPCoz53B8GieZt
	0Gwm0BUIcTYaw0jmVQceQBj6nKvZuUqMGSXmWOTXqRNbfwB60rvJ2PXLje9r1JRdn2jm
	w30Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qRTBLm2XREhM7EPZIFYBJOiGDKSqBlRg/1nvXJSpEMc=;
	b=IOaHjBE3AJ5EC2+NH+jG4NYSpoVY6iITJwytihK7OOFC99C/qvW77HTGERYqFUrDMj
	66xc7oijcOITHnX+CU33G47HFdj0PnjGmKRJGEx6jxisQY2BPweLe8V1rkb08akiQSlt
	f0HAC2+IhIXMvhQqDBShDnDS9v/W7ZXOs39vcxE0EMiKuMwLxyqKqaqnwTUy8yYnros4
	9GiVWLwDrXpI+UPtsmEe/x2w/YpShrOy2JDifTZpyA3ZlFlwrYNacFH9IKwKZennICBA
	NtThTmJnkBASgn587Hfoyb26FzyQyrTZm0KsBt1flLiPQ6XYE5hFhykVIJqZnv9ysLVY
	mKmw==
X-Gm-Message-State: APzg51BhPmJ67/fILJsy2Ao43937j4+1cXJ59xSMZzJlVehngeeLQy1h
	i4IwSA4cVMYw0Pp0JLLJwUvBnBf8
X-Google-Smtp-Source: ANB0VdbFf+AN1wnXJTtPV/KYFrRvtMHwic9edGYyhM8woaIDXybr4Zwie8KV6LIu5fe4KrGCUIxegQ==
X-Received: by 2002:a02:5691:: with SMTP id
	u17-v6mr13399444jad.9.1536960801925; 
	Fri, 14 Sep 2018 14:33:21 -0700 (PDT)
Received: from andrewg-VirtualBox.ibm.com ([32.97.110.56])
	by smtp.gmail.com with ESMTPSA id
	y21-v6sm2584215ioa.54.2018.09.14.14.33.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Sep 2018 14:33:21 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Sep 2018 14:33:06 -0700
Message-Id: <1536960788-26056-1-git-send-email-geissonator@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Andrew Geissler <geissonator@gmail.com>,
	alejandro.enedino.hernandez-samaniego@xilinx.com
Subject: [PATCH 1/3] python: don't sort the manifest in create_manifest
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
X-List-Received-Date: Fri, 14 Sep 2018 21:33:22 -0000

Instead of sorting the entire manifest when it is updated, use
OrderedDict to preserve the order of fields.This means that
packages can be ordered in the manifest to allow non-trivial
FILES assignments (such as a package that picks up pieces of
other packages)

The manifest has been regenerated with the new stable ordering, and
distutils-staticdev moved above distutils so the packaging rules work as
expected.

This is a backport of the same changes done by Ross Burton for python3

Signed-off-by: Andrew Geissler <geissonator@gmail.com>
---
 .../python/python/create_manifest2.py              |   16 +-
 .../python/python/python2-manifest.json            | 1658 ++++++++++----------
 2 files changed, 839 insertions(+), 835 deletions(-)

diff --git a/meta/recipes-devtools/python/python/create_manifest2.py b/meta/recipes-devtools/python/python/create_manifest2.py
index e745045..1af1443 100644
--- a/meta/recipes-devtools/python/python/create_manifest2.py
+++ b/meta/recipes-devtools/python/python/create_manifest2.py
@@ -37,6 +37,7 @@ import sys
 import subprocess
 import json
 import os
+import collections
 
 # Hack to get native python search path (for folders), not fond of it but it works for now
 pivot='recipe-sysroot-native'
@@ -45,7 +46,7 @@ for p in sys.path:
     nativelibfolder=p[:p.find(pivot)+len(pivot)]
 
 # Empty dict to hold the whole manifest
-new_manifest = {}
+new_manifest = collections.OrderedDict()
 
 # Check for repeated files, folders and wildcards
 allfiles=[]
@@ -63,7 +64,7 @@ def isFolder(value):
 
 # Read existing JSON manifest
 with open('python2-manifest.json') as manifest:
-  old_manifest=json.load(manifest)
+  old_manifest = json.load(manifest, object_pairs_hook=collections.OrderedDict)
 
 
 # First pass to get core-package functionality, because we base everything on the fact that core is actually working
@@ -124,13 +125,14 @@ for key in old_manifest:
 
 for key in old_manifest:
     # Use an empty dict as data structure to hold data for each package and fill it up
-    new_manifest[key]={}
-    new_manifest[key]['files']=[]
+    new_manifest[key] = collections.OrderedDict()
+    new_manifest[key]['summary'] = old_manifest[key]['summary']
     new_manifest[key]['rdepends']=[]
+    new_manifest[key]['files'] = []
+
     # All packages should depend on core
     if key != 'core':
-         new_manifest[key]['rdepends'].append('core')
-    new_manifest[key]['summary']=old_manifest[key]['summary']
+        new_manifest[key]['rdepends'].append('core')
 
     # Handle special cases, we assume that when they were manually added 
     # to the manifest we knew what we were doing.
@@ -274,4 +276,4 @@ for key in new_manifest:
 
 # Create the manifest from the data structure that was built
 with open('python2-manifest.json.new','w') as outfile:
-    json.dump(new_manifest,outfile,sort_keys=True, indent=4, separators=(',', ': '))
+    json.dump(new_manifest,outfile, indent=4)
diff --git a/meta/recipes-devtools/python/python/python2-manifest.json b/meta/recipes-devtools/python/python/python2-manifest.json
index 723e513..cacba5b 100644
--- a/meta/recipes-devtools/python/python/python2-manifest.json
+++ b/meta/recipes-devtools/python/python/python2-manifest.json
@@ -1,1047 +1,1049 @@
 {
     "2to3": {
-        "files": [
-            "${bindir}/2to3",
-            "${libdir}/python2.7/lib2to3"
-        ],
+        "summary": "Python automated Python 2 to 3 code translator", 
         "rdepends": [
             "core"
-        ],
-        "summary": "Python automated Python 2 to 3 code translator"
-    },
-    "argparse": {
+        ], 
         "files": [
-            "${libdir}/python2.7/argparse.py"
-        ],
+            "${bindir}/2to3", 
+            "${libdir}/python2.7/lib2to3"
+        ]
+    }, 
+    "argparse": {
+        "summary": "Python command line argument parser", 
         "rdepends": [
-            "codecs",
-            "core",
-            "lang",
+            "codecs", 
+            "core", 
+            "lang", 
             "textutils"
-        ],
-        "summary": "Python command line argument parser"
-    },
-    "audio": {
+        ], 
         "files": [
-            "${libdir}/python2.7/audiodev.py",
-            "${libdir}/python2.7/chunk.py",
-            "${libdir}/python2.7/lib-dynload/audioop.so",
-            "${libdir}/python2.7/lib-dynload/ossaudiodev.so",
-            "${libdir}/python2.7/sndhdr.py",
-            "${libdir}/python2.7/sunau.py",
-            "${libdir}/python2.7/sunaudio.py",
-            "${libdir}/python2.7/toaiff.py",
-            "${libdir}/python2.7/wave.py"
-        ],
+            "${libdir}/python2.7/argparse.py"
+        ]
+    }, 
+    "audio": {
+        "summary": "Python Audio Handling", 
         "rdepends": [
-            "core",
-            "crypt",
-            "fcntl",
-            "io",
+            "core", 
+            "crypt", 
+            "fcntl", 
+            "io", 
             "math"
-        ],
-        "summary": "Python Audio Handling"
-    },
+        ], 
+        "files": [
+            "${libdir}/python2.7/audiodev.py", 
+            "${libdir}/python2.7/chunk.py", 
+            "${libdir}/python2.7/lib-dynload/audioop.so", 
+            "${libdir}/python2.7/lib-dynload/ossaudiodev.so", 
+            "${libdir}/python2.7/sndhdr.py", 
+            "${libdir}/python2.7/sunau.py", 
+            "${libdir}/python2.7/sunaudio.py", 
+            "${libdir}/python2.7/toaiff.py", 
+            "${libdir}/python2.7/wave.py"
+        ]
+    }, 
     "bsddb": {
-        "files": [
-            "${libdir}/python2.7/bsddb",
-            "${libdir}/python2.7/lib-dynload/_bsddb.so"
-        ],
+        "summary": "Python bindings for the Berkeley Database", 
         "rdepends": [
             "core"
-        ],
-        "summary": "Python bindings for the Berkeley Database"
-    },
-    "codecs": {
+        ], 
         "files": [
-            "${libdir}/python2.7/gettext.py",
-            "${libdir}/python2.7/lib-dynload/_codecs_cn.so",
-            "${libdir}/python2.7/lib-dynload/_codecs_hk.so",
-            "${libdir}/python2.7/lib-dynload/_codecs_iso2022.so",
-            "${libdir}/python2.7/lib-dynload/_codecs_jp.so",
-            "${libdir}/python2.7/lib-dynload/_codecs_kr.so",
-            "${libdir}/python2.7/lib-dynload/_codecs_tw.so",
-            "${libdir}/python2.7/lib-dynload/_multibytecodec.so",
-            "${libdir}/python2.7/lib-dynload/unicodedata.so",
-            "${libdir}/python2.7/locale.py",
-            "${libdir}/python2.7/stringprep.py",
-            "${libdir}/python2.7/xdrlib.py"
-        ],
+            "${libdir}/python2.7/bsddb", 
+            "${libdir}/python2.7/lib-dynload/_bsddb.so"
+        ]
+    }, 
+    "codecs": {
+        "summary": "Python codec", 
         "rdepends": [
-            "core",
-            "io",
+            "core", 
+            "io", 
             "lang"
-        ],
-        "summary": "Python codec"
-    },
+        ], 
+        "files": [
+            "${libdir}/python2.7/gettext.py", 
+            "${libdir}/python2.7/lib-dynload/_codecs_cn.so", 
+            "${libdir}/python2.7/lib-dynload/_codecs_hk.so", 
+            "${libdir}/python2.7/lib-dynload/_codecs_iso2022.so", 
+            "${libdir}/python2.7/lib-dynload/_codecs_jp.so", 
+            "${libdir}/python2.7/lib-dynload/_codecs_kr.so", 
+            "${libdir}/python2.7/lib-dynload/_codecs_tw.so", 
+            "${libdir}/python2.7/lib-dynload/_multibytecodec.so", 
+            "${libdir}/python2.7/lib-dynload/unicodedata.so", 
+            "${libdir}/python2.7/locale.py", 
+            "${libdir}/python2.7/stringprep.py", 
+            "${libdir}/python2.7/xdrlib.py"
+        ]
+    }, 
     "compile": {
-        "files": [
-            "${libdir}/python2.7/compileall.py",
-            "${libdir}/python2.7/py_compile.py"
-        ],
+        "summary": "Python bytecode compilation support", 
         "rdepends": [
             "core"
-        ],
-        "summary": "Python bytecode compilation support"
-    },
-    "compiler": {
+        ], 
         "files": [
-            "${libdir}/python2.7/compiler"
-        ],
+            "${libdir}/python2.7/compileall.py", 
+            "${libdir}/python2.7/py_compile.py"
+        ]
+    }, 
+    "compiler": {
+        "summary": "Python compiler support", 
         "rdepends": [
-            "core",
-            "io",
+            "core", 
+            "io", 
             "lang"
-        ],
-        "summary": "Python compiler support"
-    },
-    "compression": {
+        ], 
         "files": [
-            "${libdir}/python2.7/gzip.py",
-            "${libdir}/python2.7/lib-dynload/bz2.so",
-            "${libdir}/python2.7/tarfile.py",
-            "${libdir}/python2.7/zipfile.py"
-        ],
+            "${libdir}/python2.7/compiler"
+        ]
+    }, 
+    "compression": {
+        "summary": "Python high-level compression support", 
         "rdepends": [
-            "core",
-            "io",
-            "shell",
-            "unixadmin",
+            "core", 
+            "io", 
+            "shell", 
+            "unixadmin", 
             "zlib"
-        ],
-        "summary": "Python high-level compression support"
-    },
-    "contextlib": {
+        ], 
         "files": [
-            "${libdir}/python2.7/contextlib.py"
-        ],
+            "${libdir}/python2.7/gzip.py", 
+            "${libdir}/python2.7/lib-dynload/bz2.so", 
+            "${libdir}/python2.7/tarfile.py", 
+            "${libdir}/python2.7/zipfile.py"
+        ]
+    }, 
+    "contextlib": {
+        "summary": "Python utilities for with-statementcontexts.", 
         "rdepends": [
-            "core",
+            "core", 
             "lang"
-        ],
-        "summary": "Python utilities for with-statementcontexts."
-    },
-    "core": {
+        ], 
         "files": [
-            "${bindir}/python*",
-            "${includedir}/python2.7/pyconfig*.h",
-            "${libdir}/python2.7/ConfigParser.py",
-            "${libdir}/python2.7/UserDict.py",
-            "${libdir}/python2.7/UserList.py",
-            "${libdir}/python2.7/UserString.py",
-            "${libdir}/python2.7/__future__.py",
-            "${libdir}/python2.7/_abcoll.py",
-            "${libdir}/python2.7/_sysconfigdata.py",
-            "${libdir}/python2.7/_weakrefset.py",
-            "${libdir}/python2.7/abc.py",
-            "${libdir}/python2.7/ast.py",
-            "${libdir}/python2.7/atexit.py",
-            "${libdir}/python2.7/codecs.py",
-            "${libdir}/python2.7/collections.py",
-            "${libdir}/python2.7/copy.py",
-            "${libdir}/python2.7/copy_reg.py",
-            "${libdir}/python2.7/encodings",
-            "${libdir}/python2.7/encodings/aliases.py",
-            "${libdir}/python2.7/encodings/utf_8.py",
-            "${libdir}/python2.7/genericpath.py",
-            "${libdir}/python2.7/getopt.py",
-            "${libdir}/python2.7/heapq.py",
-            "${libdir}/python2.7/importlib",
-            "${libdir}/python2.7/keyword.py",
-            "${libdir}/python2.7/lib-dynload/_collections.so",
-            "${libdir}/python2.7/lib-dynload/_heapq.so",
-            "${libdir}/python2.7/lib-dynload/_locale.so",
-            "${libdir}/python2.7/lib-dynload/_struct.so",
-            "${libdir}/python2.7/lib-dynload/binascii.so",
-            "${libdir}/python2.7/lib-dynload/itertools.so",
-            "${libdir}/python2.7/lib-dynload/operator.so",
-            "${libdir}/python2.7/lib-dynload/readline.so",
-            "${libdir}/python2.7/lib-dynload/strop.so",
-            "${libdir}/python2.7/lib-dynload/time.so",
-            "${libdir}/python2.7/lib-dynload/xreadlines.so",
-            "${libdir}/python2.7/linecache.py",
-            "${libdir}/python2.7/new.py",
-            "${libdir}/python2.7/os.py",
-            "${libdir}/python2.7/platform.py",
-            "${libdir}/python2.7/posixpath.py",
-            "${libdir}/python2.7/re.py",
-            "${libdir}/python2.7/rlcompleter.py",
-            "${libdir}/python2.7/site.py",
-            "${libdir}/python2.7/sitecustomize.py",
-            "${libdir}/python2.7/sre_compile.py",
-            "${libdir}/python2.7/sre_constants.py",
-            "${libdir}/python2.7/sre_parse.py",
-            "${libdir}/python2.7/stat.py",
-            "${libdir}/python2.7/string.py",
-            "${libdir}/python2.7/struct.py",
-            "${libdir}/python2.7/sysconfig.py",
-            "${libdir}/python2.7/traceback.py",
-            "${libdir}/python2.7/types.py",
-            "${libdir}/python2.7/warnings.py",
+            "${libdir}/python2.7/contextlib.py"
+        ]
+    }, 
+    "core": {
+        "summary": "Python interpreter and core modules", 
+        "rdepends": [], 
+        "files": [
+            "${bindir}/python*", 
+            "${includedir}/python2.7/pyconfig*.h", 
+            "${libdir}/python2.7/ConfigParser.py", 
+            "${libdir}/python2.7/UserDict.py", 
+            "${libdir}/python2.7/UserList.py", 
+            "${libdir}/python2.7/UserString.py", 
+            "${libdir}/python2.7/__future__.py", 
+            "${libdir}/python2.7/_abcoll.py", 
+            "${libdir}/python2.7/_sysconfigdata.py", 
+            "${libdir}/python2.7/_weakrefset.py", 
+            "${libdir}/python2.7/abc.py", 
+            "${libdir}/python2.7/ast.py", 
+            "${libdir}/python2.7/atexit.py", 
+            "${libdir}/python2.7/codecs.py", 
+            "${libdir}/python2.7/collections.py", 
+            "${libdir}/python2.7/copy.py", 
+            "${libdir}/python2.7/copy_reg.py", 
+            "${libdir}/python2.7/encodings", 
+            "${libdir}/python2.7/encodings/aliases.py", 
+            "${libdir}/python2.7/encodings/utf_8.py", 
+            "${libdir}/python2.7/genericpath.py", 
+            "${libdir}/python2.7/getopt.py", 
+            "${libdir}/python2.7/heapq.py", 
+            "${libdir}/python2.7/importlib", 
+            "${libdir}/python2.7/keyword.py", 
+            "${libdir}/python2.7/lib-dynload/_collections.so", 
+            "${libdir}/python2.7/lib-dynload/_heapq.so", 
+            "${libdir}/python2.7/lib-dynload/_locale.so", 
+            "${libdir}/python2.7/lib-dynload/_struct.so", 
+            "${libdir}/python2.7/lib-dynload/binascii.so", 
+            "${libdir}/python2.7/lib-dynload/itertools.so", 
+            "${libdir}/python2.7/lib-dynload/operator.so", 
+            "${libdir}/python2.7/lib-dynload/readline.so", 
+            "${libdir}/python2.7/lib-dynload/strop.so", 
+            "${libdir}/python2.7/lib-dynload/time.so", 
+            "${libdir}/python2.7/lib-dynload/xreadlines.so", 
+            "${libdir}/python2.7/linecache.py", 
+            "${libdir}/python2.7/new.py", 
+            "${libdir}/python2.7/os.py", 
+            "${libdir}/python2.7/platform.py", 
+            "${libdir}/python2.7/posixpath.py", 
+            "${libdir}/python2.7/re.py", 
+            "${libdir}/python2.7/rlcompleter.py", 
+            "${libdir}/python2.7/site.py", 
+            "${libdir}/python2.7/sitecustomize.py", 
+            "${libdir}/python2.7/sre_compile.py", 
+            "${libdir}/python2.7/sre_constants.py", 
+            "${libdir}/python2.7/sre_parse.py", 
+            "${libdir}/python2.7/stat.py", 
+            "${libdir}/python2.7/string.py", 
+            "${libdir}/python2.7/struct.py", 
+            "${libdir}/python2.7/sysconfig.py", 
+            "${libdir}/python2.7/traceback.py", 
+            "${libdir}/python2.7/types.py", 
+            "${libdir}/python2.7/warnings.py", 
             "${libdir}/python2.7/weakref.py"
-        ],
-        "rdepends": [],
-        "summary": "Python interpreter and core modules"
-    },
+        ]
+    }, 
     "crypt": {
+        "summary": "Python basic cryptographic and hashing support", 
+        "rdepends": [
+            "core"
+        ], 
         "files": [
-            "${libdir}/python2.7/hashlib.py",
-            "${libdir}/python2.7/lib-dynload/_hashlib.so",
-            "${libdir}/python2.7/lib-dynload/crypt.so",
-            "${libdir}/python2.7/md5.py",
+            "${libdir}/python2.7/hashlib.py", 
+            "${libdir}/python2.7/lib-dynload/_hashlib.so", 
+            "${libdir}/python2.7/lib-dynload/crypt.so", 
+            "${libdir}/python2.7/md5.py", 
             "${libdir}/python2.7/sha.py"
-        ],
+        ]
+    }, 
+    "ctypes": {
+        "summary": "Python C types support", 
         "rdepends": [
             "core"
-        ],
-        "summary": "Python basic cryptographic and hashing support"
-    },
-    "ctypes": {
+        ], 
         "files": [
-            "${libdir}/python2.7/ctypes",
-            "${libdir}/python2.7/lib-dynload/_ctypes.so",
+            "${libdir}/python2.7/ctypes", 
+            "${libdir}/python2.7/lib-dynload/_ctypes.so", 
             "${libdir}/python2.7/lib-dynload/_ctypes_test.so"
-        ],
+        ]
+    }, 
+    "curses": {
+        "summary": "Python curses support", 
         "rdepends": [
             "core"
-        ],
-        "summary": "Python C types support"
-    },
-    "curses": {
+        ], 
         "files": [
-            "${libdir}/python2.7/curses",
-            "${libdir}/python2.7/lib-dynload/_curses.so",
+            "${libdir}/python2.7/curses", 
+            "${libdir}/python2.7/lib-dynload/_curses.so", 
             "${libdir}/python2.7/lib-dynload/_curses_panel.so"
-        ],
-        "rdepends": [
-            "core"
-        ],
-        "summary": "Python curses support"
-    },
+        ]
+    }, 
     "datetime": {
-        "files": [
-            "${libdir}/python2.7/_strptime.py",
-            "${libdir}/python2.7/calendar.py",
-            "${libdir}/python2.7/lib-dynload/datetime.so"
-        ],
+        "summary": "Python calendar and time support", 
         "rdepends": [
-            "codecs",
-            "core",
+            "codecs", 
+            "core", 
             "lang"
-        ],
-        "summary": "Python calendar and time support"
-    },
-    "db": {
+        ], 
         "files": [
-            "${libdir}/python2.7/anydbm.py",
-            "${libdir}/python2.7/dbhash.py",
-            "${libdir}/python2.7/dumbdbm.py",
-            "${libdir}/python2.7/lib-dynload/dbm.so",
-            "${libdir}/python2.7/whichdb.py"
-        ],
+            "${libdir}/python2.7/_strptime.py", 
+            "${libdir}/python2.7/calendar.py", 
+            "${libdir}/python2.7/lib-dynload/datetime.so"
+        ]
+    }, 
+    "db": {
+        "summary": "Python file-based database support", 
         "rdepends": [
-            "bsddb",
-            "core",
+            "bsddb", 
+            "core", 
             "gdbm"
-        ],
-        "summary": "Python file-based database support"
-    },
-    "debugger": {
+        ], 
         "files": [
-            "${libdir}/python2.7/bdb.py",
-            "${libdir}/python2.7/pdb.py"
-        ],
+            "${libdir}/python2.7/anydbm.py", 
+            "${libdir}/python2.7/dbhash.py", 
+            "${libdir}/python2.7/dumbdbm.py", 
+            "${libdir}/python2.7/lib-dynload/dbm.so", 
+            "${libdir}/python2.7/whichdb.py"
+        ]
+    }, 
+    "debugger": {
+        "summary": "Python debugger", 
         "rdepends": [
-            "core",
-            "io",
-            "lang",
-            "pprint",
+            "core", 
+            "io", 
+            "lang", 
+            "pprint", 
             "shell"
-        ],
-        "summary": "Python debugger"
-    },
+        ], 
+        "files": [
+            "${libdir}/python2.7/bdb.py", 
+            "${libdir}/python2.7/pdb.py"
+        ]
+    }, 
     "dev": {
         "files": [
-            "${base_libdir}/*.a",
-            "${base_libdir}/*.o",
-            "${datadir}/aclocal",
-            "${datadir}/pkgconfig",
-            "${includedir}",
-            "${libdir}/*.a",
-            "${libdir}/*.la",
-            "${libdir}/*.o",
-            "${libdir}/lib*${SOLIBSDEV}",
-            "${libdir}/pkgconfig",
+            "${base_libdir}/*.a", 
+            "${base_libdir}/*.o", 
+            "${datadir}/aclocal", 
+            "${datadir}/pkgconfig", 
+            "${includedir}", 
+            "${libdir}/*.a", 
+            "${libdir}/*.la", 
+            "${libdir}/*.o", 
+            "${libdir}/lib*${SOLIBSDEV}", 
+            "${libdir}/pkgconfig", 
             "${libdir}/python2.7/config/Makefile"
-        ],
+        ], 
         "rdepends": [
             "core"
-        ],
+        ], 
         "summary": "Python development package"
-    },
+    }, 
     "difflib": {
-        "files": [
-            "${libdir}/python2.7/difflib.py"
-        ],
+        "summary": "Python helpers for computing deltas between objects", 
         "rdepends": [
-            "core",
+            "core", 
             "lang"
-        ],
-        "summary": "Python helpers for computing deltas between objects"
-    },
-    "distutils": {
+        ], 
         "files": [
-            "${libdir}/python2.7/config",
-            "${libdir}/python2.7/distutils"
-        ],
+            "${libdir}/python2.7/difflib.py"
+        ]
+    }, 
+    "distutils": {
+        "summary": "Python Distribution Utilities", 
         "rdepends": [
             "core"
-        ],
-        "summary": "Python Distribution Utilities"
-    },
+        ], 
+        "files": [
+            "${libdir}/python2.7/config", 
+            "${libdir}/python2.7/distutils"
+        ]
+    }, 
     "distutils-staticdev": {
         "files": [
             "${libdir}/python2.7/config/lib*.a"
-        ],
+        ], 
         "rdepends": [
             "distutils"
-        ],
+        ], 
         "summary": "Python distribution utilities (static libraries)"
-    },
+    }, 
     "doctest": {
+        "summary": "Python framework for running examples in docstrings", 
+        "rdepends": [
+            "core", 
+            "crypt", 
+            "debugger", 
+            "difflib", 
+            "fcntl", 
+            "io", 
+            "lang", 
+            "math", 
+            "pprint", 
+            "shell", 
+            "unittest"
+        ], 
         "files": [
             "${libdir}/python2.7/doctest.py"
-        ],
-        "rdepends": [
-            "core",
-            "crypt",
-            "debugger",
-            "difflib",
-            "fcntl",
-            "io",
-            "lang",
-            "math",
-            "pprint",
-            "shell",
-            "unittest"
-        ],
-        "summary": "Python framework for running examples in docstrings"
-    },
+        ]
+    }, 
     "email": {
+        "summary": "Python email support", 
+        "rdepends": [
+            "contextlib", 
+            "core", 
+            "crypt", 
+            "fcntl", 
+            "io", 
+            "lang", 
+            "math", 
+            "netclient", 
+            "pickle", 
+            "subprocess", 
+            "textutils", 
+            "threading"
+        ], 
         "files": [
-            "${libdir}/python2.7/email",
+            "${libdir}/python2.7/email", 
             "${libdir}/python2.7/imaplib.py"
-        ],
-        "rdepends": [
-            "contextlib",
-            "core",
-            "crypt",
-            "fcntl",
-            "io",
-            "lang",
-            "math",
-            "netclient",
-            "pickle",
-            "subprocess",
-            "textutils"
-        ],
-        "summary": "Python email support"
-    },
+        ]
+    }, 
     "fcntl": {
+        "summary": "Python's fcntl interface", 
+        "rdepends": [
+            "core"
+        ], 
         "files": [
             "${libdir}/python2.7/lib-dynload/fcntl.so"
-        ],
+        ]
+    }, 
+    "gdbm": {
+        "summary": "Python GNU database support", 
         "rdepends": [
             "core"
-        ],
-        "summary": "Python's fcntl interface"
-    },
-    "gdbm": {
+        ], 
         "files": [
             "${libdir}/python2.7/lib-dynload/gdbm.so"
-        ],
+        ]
+    }, 
+    "hotshot": {
+        "summary": "Python hotshot performance profiler", 
         "rdepends": [
             "core"
-        ],
-        "summary": "Python GNU database support"
-    },
-    "hotshot": {
+        ], 
         "files": [
-            "${libdir}/python2.7/hotshot",
+            "${libdir}/python2.7/hotshot", 
             "${libdir}/python2.7/lib-dynload/_hotshot.so"
-        ],
+        ]
+    }, 
+    "html": {
+        "summary": "Python HTML processing support", 
         "rdepends": [
             "core"
-        ],
-        "summary": "Python hotshot performance profiler"
-    },
-    "html": {
+        ], 
         "files": [
-            "${libdir}/python2.7/HTMLParser.py",
-            "${libdir}/python2.7/formatter.py",
-            "${libdir}/python2.7/htmlentitydefs.py",
-            "${libdir}/python2.7/htmllib.py",
-            "${libdir}/python2.7/markupbase.py",
+            "${libdir}/python2.7/HTMLParser.py", 
+            "${libdir}/python2.7/formatter.py", 
+            "${libdir}/python2.7/htmlentitydefs.py", 
+            "${libdir}/python2.7/htmllib.py", 
+            "${libdir}/python2.7/markupbase.py", 
             "${libdir}/python2.7/sgmllib.py"
-        ],
+        ]
+    }, 
+    "idle": {
+        "summary": "Python Integrated Development Environment", 
         "rdepends": [
             "core"
-        ],
-        "summary": "Python HTML processing support"
-    },
-    "idle": {
+        ], 
         "files": [
-            "${bindir}/idle",
+            "${bindir}/idle", 
             "${libdir}/python2.7/idlelib"
-        ],
+        ]
+    }, 
+    "image": {
+        "summary": "Python graphical image handling", 
         "rdepends": [
             "core"
-        ],
-        "summary": "Python Integrated Development Environment"
-    },
-    "image": {
+        ], 
         "files": [
-            "${libdir}/python2.7/colorsys.py",
+            "${libdir}/python2.7/colorsys.py", 
             "${libdir}/python2.7/imghdr.py"
-        ],
-        "rdepends": [
-            "core"
-        ],
-        "summary": "Python graphical image handling"
-    },
+        ]
+    }, 
     "io": {
-        "files": [
-            "${libdir}/python2.7/StringIO.py",
-            "${libdir}/python2.7/_pyio.py",
-            "${libdir}/python2.7/io.py",
-            "${libdir}/python2.7/lib-dynload/_io.so",
-            "${libdir}/python2.7/lib-dynload/_socket.so",
-            "${libdir}/python2.7/lib-dynload/_ssl.so",
-            "${libdir}/python2.7/lib-dynload/cStringIO.so",
-            "${libdir}/python2.7/lib-dynload/select.so",
-            "${libdir}/python2.7/lib-dynload/termios.so",
-            "${libdir}/python2.7/pipes.py",
-            "${libdir}/python2.7/socket.py",
-            "${libdir}/python2.7/ssl.py",
-            "${libdir}/python2.7/tempfile.py"
-        ],
-        "rdepends": [
-            "contextlib",
-            "core",
-            "crypt",
-            "fcntl",
-            "lang",
-            "math",
-            "netclient",
+        "summary": "Python low-level I/O", 
+        "rdepends": [
+            "contextlib", 
+            "core", 
+            "crypt", 
+            "fcntl", 
+            "lang", 
+            "math", 
+            "netclient", 
             "textutils"
-        ],
-        "summary": "Python low-level I/O"
-    },
+        ], 
+        "files": [
+            "${libdir}/python2.7/StringIO.py", 
+            "${libdir}/python2.7/_pyio.py", 
+            "${libdir}/python2.7/io.py", 
+            "${libdir}/python2.7/lib-dynload/_io.so", 
+            "${libdir}/python2.7/lib-dynload/_socket.so", 
+            "${libdir}/python2.7/lib-dynload/_ssl.so", 
+            "${libdir}/python2.7/lib-dynload/cStringIO.so", 
+            "${libdir}/python2.7/lib-dynload/select.so", 
+            "${libdir}/python2.7/lib-dynload/termios.so", 
+            "${libdir}/python2.7/pipes.py", 
+            "${libdir}/python2.7/socket.py", 
+            "${libdir}/python2.7/ssl.py", 
+            "${libdir}/python2.7/tempfile.py"
+        ]
+    }, 
     "json": {
-        "files": [
-            "${libdir}/python2.7/json",
-            "${libdir}/python2.7/lib-dynload/_json.so"
-        ],
+        "summary": "Python JSON support", 
         "rdepends": [
             "core"
-        ],
-        "summary": "Python JSON support"
-    },
-    "lang": {
+        ], 
         "files": [
-            "${libdir}/python2.7/bisect.py",
-            "${libdir}/python2.7/code.py",
-            "${libdir}/python2.7/codeop.py",
-            "${libdir}/python2.7/dis.py",
-            "${libdir}/python2.7/functools.py",
-            "${libdir}/python2.7/inspect.py",
-            "${libdir}/python2.7/lib-dynload/_bisect.so",
-            "${libdir}/python2.7/lib-dynload/_functools.so",
-            "${libdir}/python2.7/lib-dynload/array.so",
-            "${libdir}/python2.7/lib-dynload/parser.so",
-            "${libdir}/python2.7/opcode.py",
-            "${libdir}/python2.7/repr.py",
-            "${libdir}/python2.7/symbol.py",
-            "${libdir}/python2.7/token.py",
-            "${libdir}/python2.7/tokenize.py"
-        ],
+            "${libdir}/python2.7/json", 
+            "${libdir}/python2.7/lib-dynload/_json.so"
+        ]
+    }, 
+    "lang": {
+        "summary": "Python low-level language support", 
         "rdepends": [
             "core"
-        ],
-        "summary": "Python low-level language support"
-    },
+        ], 
+        "files": [
+            "${libdir}/python2.7/bisect.py", 
+            "${libdir}/python2.7/code.py", 
+            "${libdir}/python2.7/codeop.py", 
+            "${libdir}/python2.7/dis.py", 
+            "${libdir}/python2.7/functools.py", 
+            "${libdir}/python2.7/inspect.py", 
+            "${libdir}/python2.7/lib-dynload/_bisect.so", 
+            "${libdir}/python2.7/lib-dynload/_functools.so", 
+            "${libdir}/python2.7/lib-dynload/array.so", 
+            "${libdir}/python2.7/lib-dynload/parser.so", 
+            "${libdir}/python2.7/opcode.py", 
+            "${libdir}/python2.7/repr.py", 
+            "${libdir}/python2.7/symbol.py", 
+            "${libdir}/python2.7/token.py", 
+            "${libdir}/python2.7/tokenize.py"
+        ]
+    }, 
     "logging": {
-        "files": [
-            "${libdir}/python2.7/logging"
-        ],
+        "summary": "Python logging support", 
         "rdepends": [
-            "core",
-            "io",
+            "core", 
+            "io", 
             "threading"
-        ],
-        "summary": "Python logging support"
-    },
+        ], 
+        "files": [
+            "${libdir}/python2.7/logging"
+        ]
+    }, 
     "mailbox": {
+        "summary": "Python mailbox format support", 
+        "rdepends": [
+            "codecs", 
+            "contextlib", 
+            "core", 
+            "crypt", 
+            "datetime", 
+            "email", 
+            "fcntl", 
+            "io", 
+            "lang", 
+            "math", 
+            "mime", 
+            "netclient", 
+            "textutils"
+        ], 
         "files": [
             "${libdir}/python2.7/mailbox.py"
-        ],
-        "rdepends": [
-            "codecs",
-            "contextlib",
-            "core",
-            "crypt",
-            "datetime",
-            "email",
-            "fcntl",
-            "io",
-            "lang",
-            "math",
-            "mime",
-            "netclient",
-            "textutils"
-        ],
-        "summary": "Python mailbox format support"
-    },
+        ]
+    }, 
     "math": {
-        "files": [
-            "${libdir}/python2.7/lib-dynload/_random.so",
-            "${libdir}/python2.7/lib-dynload/cmath.so",
-            "${libdir}/python2.7/lib-dynload/math.so",
-            "${libdir}/python2.7/random.py",
-            "${libdir}/python2.7/sets.py"
-        ],
+        "summary": "Python math support", 
         "rdepends": [
-            "core",
+            "core", 
             "crypt"
-        ],
-        "summary": "Python math support"
-    },
+        ], 
+        "files": [
+            "${libdir}/python2.7/lib-dynload/_random.so", 
+            "${libdir}/python2.7/lib-dynload/cmath.so", 
+            "${libdir}/python2.7/lib-dynload/math.so", 
+            "${libdir}/python2.7/random.py", 
+            "${libdir}/python2.7/sets.py"
+        ]
+    }, 
     "mime": {
+        "summary": "Python MIME handling APIs", 
+        "rdepends": [
+            "contextlib", 
+            "core", 
+            "crypt", 
+            "fcntl", 
+            "io", 
+            "lang", 
+            "math", 
+            "netclient", 
+            "textutils"
+        ], 
         "files": [
-            "${libdir}/python2.7/MimeWriter.py",
-            "${libdir}/python2.7/mimetools.py",
-            "${libdir}/python2.7/mimetypes.py",
-            "${libdir}/python2.7/quopri.py",
-            "${libdir}/python2.7/rfc822.py",
+            "${libdir}/python2.7/MimeWriter.py", 
+            "${libdir}/python2.7/mimetools.py", 
+            "${libdir}/python2.7/mimetypes.py", 
+            "${libdir}/python2.7/quopri.py", 
+            "${libdir}/python2.7/rfc822.py", 
             "${libdir}/python2.7/uu.py"
-        ],
-        "rdepends": [
-            "contextlib",
-            "core",
-            "crypt",
-            "fcntl",
-            "io",
-            "lang",
-            "math",
-            "netclient",
-            "textutils"
-        ],
-        "summary": "Python MIME handling APIs"
-    },
+        ]
+    }, 
     "mmap": {
-        "files": [
-            "${libdir}/python2.7/lib-dynload/mmap.so"
-        ],
+        "summary": "Python memory-mapped file support", 
         "rdepends": [
             "core"
-        ],
-        "summary": "Python memory-mapped file support"
-    },
+        ], 
+        "files": [
+            "${libdir}/python2.7/lib-dynload/mmap.so"
+        ]
+    }, 
     "modules": {
-        "files": [],
-        "rdepends": [
-            "2to3",
-            "argparse",
-            "audio",
-            "bsddb",
-            "codecs",
-            "compile",
-            "compiler",
-            "compression",
-            "contextlib",
-            "core",
-            "crypt",
-            "ctypes",
-            "curses",
-            "datetime",
-            "db",
-            "debugger",
-            "difflib",
-            "distutils",
-            "doctest",
-            "email",
-            "fcntl",
-            "gdbm",
-            "hotshot",
-            "html",
-            "idle",
-            "image",
-            "io",
-            "json",
-            "lang",
-            "logging",
-            "mailbox",
-            "math",
-            "mime",
-            "mmap",
-            "multiprocessing",
-            "netclient",
-            "netserver",
-            "numbers",
-            "pickle",
-            "pkgutil",
-            "plistlib",
-            "pprint",
-            "profile",
-            "pydoc",
-            "re",
-            "resource",
-            "robotparser",
-            "runpy",
-            "shell",
-            "smtpd",
-            "sqlite3",
-            "sqlite3",
-            "stringold",
-            "subprocess",
-            "syslog",
-            "terminal",
-            "textutils",
-            "threading",
-            "tkinter",
-            "unittest",
-            "unixadmin",
-            "xml",
-            "xmlrpc",
+        "files": [], 
+        "rdepends": [
+            "2to3", 
+            "argparse", 
+            "audio", 
+            "bsddb", 
+            "codecs", 
+            "compile", 
+            "compiler", 
+            "compression", 
+            "contextlib", 
+            "core", 
+            "crypt", 
+            "ctypes", 
+            "curses", 
+            "datetime", 
+            "db", 
+            "debugger", 
+            "difflib", 
+            "distutils", 
+            "doctest", 
+            "email", 
+            "fcntl", 
+            "gdbm", 
+            "hotshot", 
+            "html", 
+            "idle", 
+            "image", 
+            "io", 
+            "json", 
+            "lang", 
+            "logging", 
+            "mailbox", 
+            "math", 
+            "mime", 
+            "mmap", 
+            "multiprocessing", 
+            "netclient", 
+            "netserver", 
+            "numbers", 
+            "pickle", 
+            "pkgutil", 
+            "plistlib", 
+            "pprint", 
+            "profile", 
+            "pydoc", 
+            "re", 
+            "resource", 
+            "robotparser", 
+            "runpy", 
+            "shell", 
+            "smtpd", 
+            "sqlite3", 
+            "sqlite3", 
+            "stringold", 
+            "subprocess", 
+            "syslog", 
+            "terminal", 
+            "textutils", 
+            "threading", 
+            "tkinter", 
+            "unittest", 
+            "unixadmin", 
+            "xml", 
+            "xmlrpc", 
             "zlib"
-        ],
+        ], 
         "summary": "All Python modules"
-    },
+    }, 
     "multiprocessing": {
-        "files": [
-            "${libdir}/python2.7/lib-dynload/_multiprocessing.so",
-            "${libdir}/python2.7/multiprocessing"
-        ],
+        "summary": "Python multiprocessing support", 
         "rdepends": [
-            "core",
-            "fcntl",
-            "io",
-            "pickle",
-            "subprocess",
+            "core", 
+            "fcntl", 
+            "io", 
+            "pickle", 
+            "subprocess", 
             "threading"
-        ],
-        "summary": "Python multiprocessing support"
-    },
-    "netclient": {
+        ], 
         "files": [
-            "${libdir}/python2.7/Cookie.py",
-            "${libdir}/python2.7/_LWPCookieJar.py",
-            "${libdir}/python2.7/_MozillaCookieJar.py",
-            "${libdir}/python2.7/base64.py",
-            "${libdir}/python2.7/cookielib.py",
-            "${libdir}/python2.7/ftplib.py",
-            "${libdir}/python2.7/hmac.py",
-            "${libdir}/python2.7/httplib.py",
-            "${libdir}/python2.7/nntplib.py",
-            "${libdir}/python2.7/poplib.py",
-            "${libdir}/python2.7/smtplib.py",
-            "${libdir}/python2.7/telnetlib.py",
-            "${libdir}/python2.7/urllib.py",
-            "${libdir}/python2.7/urllib2.py",
-            "${libdir}/python2.7/urlparse.py",
-            "${libdir}/python2.7/uuid.py"
-        ],
-        "rdepends": [
-            "codecs",
-            "contextlib",
-            "core",
-            "crypt",
-            "ctypes",
-            "datetime",
-            "email",
-            "fcntl",
-            "io",
-            "lang",
-            "math",
-            "mime",
-            "pickle",
-            "subprocess",
-            "textutils",
+            "${libdir}/python2.7/lib-dynload/_multiprocessing.so", 
+            "${libdir}/python2.7/multiprocessing"
+        ]
+    }, 
+    "netclient": {
+        "summary": "Python Internet Protocol clients", 
+        "rdepends": [
+            "codecs", 
+            "contextlib", 
+            "core", 
+            "crypt", 
+            "ctypes", 
+            "datetime", 
+            "email", 
+            "fcntl", 
+            "io", 
+            "lang", 
+            "math", 
+            "mime", 
+            "pickle", 
+            "subprocess", 
+            "textutils", 
             "threading"
-        ],
-        "summary": "Python Internet Protocol clients"
-    },
+        ], 
+        "files": [
+            "${libdir}/python2.7/Cookie.py", 
+            "${libdir}/python2.7/_LWPCookieJar.py", 
+            "${libdir}/python2.7/_MozillaCookieJar.py", 
+            "${libdir}/python2.7/base64.py", 
+            "${libdir}/python2.7/cookielib.py", 
+            "${libdir}/python2.7/ftplib.py", 
+            "${libdir}/python2.7/hmac.py", 
+            "${libdir}/python2.7/httplib.py", 
+            "${libdir}/python2.7/nntplib.py", 
+            "${libdir}/python2.7/poplib.py", 
+            "${libdir}/python2.7/smtplib.py", 
+            "${libdir}/python2.7/telnetlib.py", 
+            "${libdir}/python2.7/urllib.py", 
+            "${libdir}/python2.7/urllib2.py", 
+            "${libdir}/python2.7/urlparse.py", 
+            "${libdir}/python2.7/uuid.py"
+        ]
+    }, 
     "netserver": {
+        "summary": "Python Internet Protocol servers", 
+        "rdepends": [
+            "compression", 
+            "contextlib", 
+            "core", 
+            "crypt", 
+            "fcntl", 
+            "io", 
+            "lang", 
+            "math", 
+            "mime", 
+            "netclient", 
+            "shell", 
+            "textutils", 
+            "threading", 
+            "unixadmin", 
+            "zlib"
+        ], 
         "files": [
-            "${libdir}/python2.7/BaseHTTPServer.py",
-            "${libdir}/python2.7/CGIHTTPServer.py",
-            "${libdir}/python2.7/SimpleHTTPServer.py",
-            "${libdir}/python2.7/SocketServer.py",
+            "${libdir}/python2.7/BaseHTTPServer.py", 
+            "${libdir}/python2.7/CGIHTTPServer.py", 
+            "${libdir}/python2.7/SimpleHTTPServer.py", 
+            "${libdir}/python2.7/SocketServer.py", 
             "${libdir}/python2.7/cgi.py"
-        ],
-        "rdepends": [
-            "compression",
-            "contextlib",
-            "core",
-            "crypt",
-            "fcntl",
-            "io",
-            "lang",
-            "math",
-            "mime",
-            "netclient",
-            "shell",
-            "textutils",
-            "threading",
-            "unixadmin",
-            "zlib"
-        ],
-        "summary": "Python Internet Protocol servers"
-    },
+        ]
+    }, 
     "numbers": {
-        "files": [
-            "${libdir}/python2.7/decimal.py",
-            "${libdir}/python2.7/fractions.py",
-            "${libdir}/python2.7/numbers.py"
-        ],
+        "summary": "Python number APIs", 
         "rdepends": [
-            "codecs",
-            "core",
-            "lang",
-            "math",
+            "codecs", 
+            "core", 
+            "lang", 
+            "math", 
             "threading"
-        ],
-        "summary": "Python number APIs"
-    },
-    "pickle": {
+        ], 
         "files": [
-            "${libdir}/python2.7/lib-dynload/cPickle.so",
-            "${libdir}/python2.7/pickle.py",
-            "${libdir}/python2.7/pickletools.py",
-            "${libdir}/python2.7/shelve.py"
-        ],
+            "${libdir}/python2.7/decimal.py", 
+            "${libdir}/python2.7/fractions.py", 
+            "${libdir}/python2.7/numbers.py"
+        ]
+    }, 
+    "pickle": {
+        "summary": "Python serialisation/persistence support", 
         "rdepends": [
-            "core",
+            "core", 
             "io"
-        ],
-        "summary": "Python serialisation/persistence support"
-    },
-    "pkgutil": {
+        ], 
         "files": [
-            "${libdir}/python2.7/pkgutil.py"
-        ],
+            "${libdir}/python2.7/lib-dynload/cPickle.so", 
+            "${libdir}/python2.7/pickle.py", 
+            "${libdir}/python2.7/pickletools.py", 
+            "${libdir}/python2.7/shelve.py"
+        ]
+    }, 
+    "pkgutil": {
+        "summary": "Python package extension utility support", 
         "rdepends": [
             "core"
-        ],
-        "summary": "Python package extension utility support"
-    },
+        ], 
+        "files": [
+            "${libdir}/python2.7/pkgutil.py"
+        ]
+    }, 
     "plistlib": {
+        "summary": "Generate and parse Mac OS X .plist files", 
+        "rdepends": [
+            "core", 
+            "datetime", 
+            "io"
+        ], 
         "files": [
             "${libdir}/python2.7/plistlib.py"
-        ],
+        ]
+    }, 
+    "pprint": {
+        "summary": "Python pretty-print support", 
         "rdepends": [
-            "core",
-            "datetime",
+            "core", 
             "io"
-        ],
-        "summary": "Generate and parse Mac OS X .plist files"
-    },
-    "pprint": {
+        ], 
         "files": [
             "${libdir}/python2.7/pprint.py"
-        ],
-        "rdepends": [
-            "core",
-            "io"
-        ],
-        "summary": "Python pretty-print support"
-    },
+        ]
+    }, 
     "profile": {
-        "files": [
-            "${libdir}/python2.7/cProfile.py",
-            "${libdir}/python2.7/lib-dynload/_lsprof.so",
-            "${libdir}/python2.7/profile.py",
-            "${libdir}/python2.7/pstats.py"
-        ],
+        "summary": "Python basic performance profiling support", 
         "rdepends": [
-            "codecs",
-            "core",
-            "lang",
-            "resource",
+            "codecs", 
+            "core", 
+            "lang", 
+            "resource", 
             "textutils"
-        ],
-        "summary": "Python basic performance profiling support"
-    },
-    "pydoc": {
+        ], 
         "files": [
-            "${bindir}/pydoc",
-            "${libdir}/python2.7/pydoc.py",
-            "${libdir}/python2.7/pydoc_data"
-        ],
+            "${libdir}/python2.7/cProfile.py", 
+            "${libdir}/python2.7/lib-dynload/_lsprof.so", 
+            "${libdir}/python2.7/profile.py", 
+            "${libdir}/python2.7/pstats.py"
+        ]
+    }, 
+    "pydoc": {
+        "summary": "Python interactive help support", 
         "rdepends": [
-            "codecs",
-            "core",
-            "lang",
+            "codecs", 
+            "core", 
+            "lang", 
             "pkgutil"
-        ],
-        "summary": "Python interactive help support"
-    },
+        ], 
+        "files": [
+            "${bindir}/pydoc", 
+            "${libdir}/python2.7/pydoc.py", 
+            "${libdir}/python2.7/pydoc_data"
+        ]
+    }, 
     "re": {
+        "summary": "Python Regular Expression APIs", 
+        "rdepends": [
+            "core"
+        ], 
         "files": [
             "${libdir}/python2.7/sre.py"
-        ],
+        ]
+    }, 
+    "resource": {
+        "summary": "Python resource control interface", 
         "rdepends": [
             "core"
-        ],
-        "summary": "Python Regular Expression APIs"
-    },
-    "resource": {
+        ], 
         "files": [
             "${libdir}/python2.7/lib-dynload/resource.so"
-        ],
-        "rdepends": [
-            "core"
-        ],
-        "summary": "Python resource control interface"
-    },
+        ]
+    }, 
     "robotparser": {
-        "files": [
-            "${libdir}/python2.7/robotparser.py"
-        ],
+        "summary": "Python robots.txt parser", 
         "rdepends": [
-            "contextlib",
-            "core",
-            "io",
-            "lang",
-            "netclient",
+            "contextlib", 
+            "core", 
+            "io", 
+            "lang", 
+            "netclient", 
             "textutils"
-        ],
-        "summary": "Python robots.txt parser"
-    },
-    "runpy": {
+        ], 
         "files": [
-            "${libdir}/python2.7/runpy.py"
-        ],
+            "${libdir}/python2.7/robotparser.py"
+        ]
+    }, 
+    "runpy": {
+        "summary": "Python helper for locating/executing scripts in module namespace", 
         "rdepends": [
-            "core",
+            "core", 
             "pkgutil"
-        ],
-        "summary": "Python helper for locating/executing scripts in module namespace"
-    },
-    "shell": {
+        ], 
         "files": [
-            "${libdir}/python2.7/cmd.py",
-            "${libdir}/python2.7/commands.py",
-            "${libdir}/python2.7/dircache.py",
-            "${libdir}/python2.7/fnmatch.py",
-            "${libdir}/python2.7/glob.py",
-            "${libdir}/python2.7/popen2.py",
-            "${libdir}/python2.7/shlex.py",
-            "${libdir}/python2.7/shutil.py"
-        ],
+            "${libdir}/python2.7/runpy.py"
+        ]
+    }, 
+    "shell": {
+        "summary": "Python shell-like functionality", 
         "rdepends": [
-            "compression",
-            "core",
-            "io",
-            "unixadmin",
+            "compression", 
+            "core", 
+            "io", 
+            "unixadmin", 
             "zlib"
-        ],
-        "summary": "Python shell-like functionality"
-    },
+        ], 
+        "files": [
+            "${libdir}/python2.7/cmd.py", 
+            "${libdir}/python2.7/commands.py", 
+            "${libdir}/python2.7/dircache.py", 
+            "${libdir}/python2.7/fnmatch.py", 
+            "${libdir}/python2.7/glob.py", 
+            "${libdir}/python2.7/popen2.py", 
+            "${libdir}/python2.7/shlex.py", 
+            "${libdir}/python2.7/shutil.py"
+        ]
+    }, 
     "smtpd": {
-        "files": [
-            "${bindir}/smtpd.py",
-            "${libdir}/python2.7/asynchat.py",
-            "${libdir}/python2.7/asyncore.py",
-            "${libdir}/python2.7/smtpd.py"
-        ],
+        "summary": "Python Simple Mail Transport Daemon", 
         "rdepends": [
-            "core",
-            "fcntl",
-            "io",
+            "core", 
+            "fcntl", 
+            "io", 
             "lang"
-        ],
-        "summary": "Python Simple Mail Transport Daemon"
-    },
-    "sqlite3": {
+        ], 
         "files": [
-            "${libdir}/python2.7/lib-dynload/_sqlite3.so"
-        ],
+            "${bindir}/smtpd.py", 
+            "${libdir}/python2.7/asynchat.py", 
+            "${libdir}/python2.7/asyncore.py", 
+            "${libdir}/python2.7/smtpd.py"
+        ]
+    }, 
+    "sqlite3": {
+        "summary": "Python Sqlite3 database support", 
         "rdepends": [
             "core"
-        ],
-        "summary": "Python Sqlite3 database support"
-    },
-    "sqlite3-tests": {
+        ], 
         "files": [
-            "${libdir}/python2.7/sqlite3/test"
-        ],
+            "${libdir}/python2.7/lib-dynload/_sqlite3.so"
+        ]
+    }, 
+    "sqlite3-tests": {
+        "summary": "Python Sqlite3 database support tests", 
         "rdepends": [
-            "core",
+            "core", 
             "tests"
-        ],
-        "summary": "Python Sqlite3 database support tests"
-    },
-    "stringold": {
+        ], 
         "files": [
-            "${libdir}/python2.7/stringold.py"
-        ],
+            "${libdir}/python2.7/sqlite3/test"
+        ]
+    }, 
+    "stringold": {
+        "summary": "Python string APIs [deprecated]", 
         "rdepends": [
             "core"
-        ],
-        "summary": "Python string APIs [deprecated]"
-    },
+        ], 
+        "files": [
+            "${libdir}/python2.7/stringold.py"
+        ]
+    }, 
     "subprocess": {
+        "summary": "Python subprocess support", 
+        "rdepends": [
+            "core", 
+            "fcntl", 
+            "io", 
+            "pickle", 
+            "threading"
+        ], 
         "files": [
             "${libdir}/python2.7/subprocess.py"
-        ],
-        "rdepends": [
-            "core",
-            "fcntl",
-            "io",
-            "pickle"
-        ],
-        "summary": "Python subprocess support"
-    },
+        ]
+    }, 
     "syslog": {
-        "files": [
-            "${libdir}/python2.7/lib-dynload/syslog.so"
-        ],
+        "summary": "Python syslog interface", 
         "rdepends": [
             "core"
-        ],
-        "summary": "Python syslog interface"
-    },
-    "terminal": {
+        ], 
         "files": [
-            "${libdir}/python2.7/pty.py",
-            "${libdir}/python2.7/tty.py"
-        ],
+            "${libdir}/python2.7/lib-dynload/syslog.so"
+        ]
+    }, 
+    "terminal": {
+        "summary": "Python terminal controlling support", 
         "rdepends": [
-            "core",
+            "core", 
             "io"
-        ],
-        "summary": "Python terminal controlling support"
-    },
-    "tests": {
+        ], 
         "files": [
-            "${libdir}/python2.7/test"
-        ],
+            "${libdir}/python2.7/pty.py", 
+            "${libdir}/python2.7/tty.py"
+        ]
+    }, 
+    "tests": {
+        "summary": "Python tests", 
         "rdepends": [
             "core"
-        ],
-        "summary": "Python tests"
-    },
-    "textutils": {
+        ], 
         "files": [
-            "${libdir}/python2.7/csv.py",
-            "${libdir}/python2.7/lib-dynload/_csv.so",
-            "${libdir}/python2.7/optparse.py",
-            "${libdir}/python2.7/textwrap.py"
-        ],
+            "${libdir}/python2.7/test"
+        ]
+    }, 
+    "textutils": {
+        "summary": "Python option parsin", 
         "rdepends": [
-            "codecs",
-            "core",
-            "io",
+            "codecs", 
+            "core", 
+            "io", 
             "lang"
-        ],
-        "summary": "Python option parsin"
-    },
+        ], 
+        "files": [
+            "${libdir}/python2.7/csv.py", 
+            "${libdir}/python2.7/lib-dynload/_csv.so", 
+            "${libdir}/python2.7/optparse.py", 
+            "${libdir}/python2.7/textwrap.py"
+        ]
+    }, 
     "threading": {
+        "summary": "Python threading & synchronization support", 
+        "rdepends": [
+            "core"
+        ], 
         "files": [
-            "${libdir}/python2.7/Queue.py",
-            "${libdir}/python2.7/_threading_local.py",
-            "${libdir}/python2.7/dummy_thread.py",
-            "${libdir}/python2.7/dummy_threading.py",
-            "${libdir}/python2.7/mutex.py",
+            "${libdir}/python2.7/Queue.py", 
+            "${libdir}/python2.7/_threading_local.py", 
+            "${libdir}/python2.7/dummy_thread.py", 
+            "${libdir}/python2.7/dummy_threading.py", 
+            "${libdir}/python2.7/mutex.py", 
             "${libdir}/python2.7/threading.py"
-        ],
+        ]
+    }, 
+    "tkinter": {
+        "summary": "Python Tcl/Tk bindings", 
         "rdepends": [
             "core"
-        ],
-        "summary": "Python threading & synchronization support"
-    },
-    "tkinter": {
+        ], 
         "files": [
             "${libdir}/python2.7/lib-tk"
-        ],
-        "rdepends": [
-            "core"
-        ],
-        "summary": "Python Tcl/Tk bindings"
-    },
+        ]
+    }, 
     "unittest": {
-        "files": [
-            "${libdir}/python2.7/unittest"
-        ],
+        "summary": "Python unit testing framework", 
         "rdepends": [
-            "core",
-            "difflib",
-            "io",
-            "lang",
-            "pprint",
+            "core", 
+            "difflib", 
+            "io", 
+            "lang", 
+            "pprint", 
             "shell"
-        ],
-        "summary": "Python unit testing framework"
-    },
-    "unixadmin": {
+        ], 
         "files": [
-            "${libdir}/python2.7/getpass.py",
-            "${libdir}/python2.7/lib-dynload/grp.so",
-            "${libdir}/python2.7/lib-dynload/nis.so"
-        ],
+            "${libdir}/python2.7/unittest"
+        ]
+    }, 
+    "unixadmin": {
+        "summary": "Python Unix administration support", 
         "rdepends": [
-            "core",
+            "core", 
             "io"
-        ],
-        "summary": "Python Unix administration support"
-    },
-    "xml": {
+        ], 
         "files": [
-            "${libdir}/python2.7/lib-dynload/_elementtree.so",
-            "${libdir}/python2.7/lib-dynload/pyexpat.so",
-            "${libdir}/python2.7/xml"
-        ],
+            "${libdir}/python2.7/getpass.py", 
+            "${libdir}/python2.7/lib-dynload/grp.so", 
+            "${libdir}/python2.7/lib-dynload/nis.so"
+        ]
+    }, 
+    "xml": {
+        "summary": "Python basic XML support", 
         "rdepends": [
             "core"
-        ],
-        "summary": "Python basic XML support"
-    },
+        ], 
+        "files": [
+            "${libdir}/python2.7/lib-dynload/_elementtree.so", 
+            "${libdir}/python2.7/lib-dynload/pyexpat.so", 
+            "${libdir}/python2.7/xml"
+        ]
+    }, 
     "xmlrpc": {
+        "summary": "Python XML-RPC support", 
+        "rdepends": [
+            "codecs", 
+            "compression", 
+            "contextlib", 
+            "core", 
+            "crypt", 
+            "datetime", 
+            "fcntl", 
+            "io", 
+            "lang", 
+            "math", 
+            "mime", 
+            "netclient", 
+            "netserver", 
+            "pkgutil", 
+            "pydoc", 
+            "textutils", 
+            "threading", 
+            "xml", 
+            "zlib"
+        ], 
         "files": [
-            "${libdir}/python2.7/DocXMLRPCServer.py",
+            "${libdir}/python2.7/DocXMLRPCServer.py", 
             "${libdir}/python2.7/SimpleXMLRPCServer.py"
-        ],
-        "rdepends": [
-            "codecs",
-            "compression",
-            "contextlib",
-            "core",
-            "crypt",
-            "datetime",
-            "fcntl",
-            "io",
-            "lang",
-            "math",
-            "mime",
-            "netclient",
-            "netserver",
-            "pkgutil",
-            "pydoc",
-            "textutils",
-            "threading",
-            "xml",
-            "zlib"
-        ],
-        "summary": "Python XML-RPC support"
-    },
+        ]
+    }, 
     "zlib": {
-        "files": [
-            "${libdir}/python2.7/lib-dynload/zlib.so"
-        ],
+        "summary": "Python zlib compression support", 
         "rdepends": [
             "core"
-        ],
-        "summary": "Python zlib compression support"
+        ], 
+        "files": [
+            "${libdir}/python2.7/lib-dynload/zlib.so"
+        ]
     }
-}
+}
\ No newline at end of file
-- 
2.7.4



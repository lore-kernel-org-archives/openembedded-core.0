Return-Path: <Konrad.Scherer@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 831C07F324
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 18:56:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x8RIuhlF022894
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 11:56:43 -0700 (PDT)
Received: from argon.wrs.com (128.224.20.149) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 27 Sep 2019 11:56:42 -0700
From: Konrad Scherer <konrad.scherer@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Sep 2019 14:56:42 -0400
Message-ID: <20190927185642.29251-1-konrad.scherer@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [master][PATCH] gen-lockedsig-cache: Replace glob lookup with hash to filename lookup
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
X-List-Received-Date: Fri, 27 Sep 2019 18:56:42 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Konrad Scherer <Konrad.Scherer@windriver.com>

Using the glob function to map signatures to sstate files is very slow
when the sstate is large and accessed over nfs. The lookup now only
loads the necessary prefixes and doesn't use glob as all.

Unfortunately I don't have access to the systems where the performance
isse was noticed and on my test system the glob is fast enough that
the performance numbers aren't useful. I could verify that file list
returned by the new code is the same.

[YOCTO #13539]

Signed-off-by: Konrad Scherer <Konrad.Scherer@windriver.com>
---
 meta/lib/oe/copy_buildsystem.py |  3 ++-
 scripts/gen-lockedsig-cache     | 44 +++++++++++++++++++++++++++++----
 2 files changed, 41 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/copy_buildsystem.py b/meta/lib/oe/copy_buildsystem.py
index 31a84f5b06..c515683608 100644
--- a/meta/lib/oe/copy_buildsystem.py
+++ b/meta/lib/oe/copy_buildsystem.py
@@ -259,7 +259,8 @@ def create_locked_sstate_cache(lockedsigs, input_sstate_cache, output_sstate_cac
     bb.note('Generating sstate-cache...')
 
     nativelsbstring = d.getVar('NATIVELSBSTRING')
-    bb.process.run("gen-lockedsig-cache %s %s %s %s %s" % (lockedsigs, input_sstate_cache, output_sstate_cache, nativelsbstring, filterfile or ''))
+    stdout, _ = bb.process.run("gen-lockedsig-cache %s %s %s %s %s" % (lockedsigs, input_sstate_cache, output_sstate_cache, nativelsbstring, filterfile or ''))
+    bb.debug(stdout)
     if fixedlsbstring and nativelsbstring != fixedlsbstring:
         nativedir = output_sstate_cache + '/' + nativelsbstring
         if os.path.isdir(nativedir):
diff --git a/scripts/gen-lockedsig-cache b/scripts/gen-lockedsig-cache
index e3076e11a5..ae5e09d89f 100755
--- a/scripts/gen-lockedsig-cache
+++ b/scripts/gen-lockedsig-cache
@@ -5,9 +5,9 @@
 
 import os
 import sys
-import glob
 import shutil
 import errno
+import time
 
 def mkdir(d):
     try:
@@ -16,6 +16,33 @@ def mkdir(d):
         if e.errno != errno.EEXIST:
             raise e
 
+# extract the hash from past the last colon to last underscore
+def extract_sha(filename):
+    return filename.split(':')[7].split('_')[0]
+
+# get all files in a directory, extract hash and make
+# a map from hash to list of file with that hash
+def map_sha_to_files(dir_, prefix, sha_map):
+    sstate_prefix_path = dir_ + '/' + prefix + '/'
+    sstate_files = os.listdir(sstate_prefix_path)
+    for f in sstate_files:
+        sha = extract_sha(f)
+        if sha not in sha_map:
+            sha_map[sha] = []
+        sha_map[sha].append(sstate_prefix_path + f)
+
+# given a prefix build a map of hash to list of files
+def build_sha_cache(prefix):
+    sha_map = {}
+
+    sstate_dir = sys.argv[2]
+    map_sha_to_files(sstate_dir, prefix, sha_map)
+
+    native_sstate_dir = sys.argv[2] + sys.argv[4]
+    map_sha_to_files(native_sstate_dir, prefix, sha_map)
+
+    return sha_map
+
 if len(sys.argv) < 5:
     print("Incorrect number of arguments specified")
     print("syntax: gen-lockedsig-cache <locked-sigs.inc> <input-cachedir> <output-cachedir> <nativelsbstring> [filterfile]")
@@ -41,12 +68,19 @@ with open(sys.argv[1]) as f:
                 sigs.append(sig)
 
 print('Gathering file list')
+start_time = time.perf_counter()
 files = set()
+sstate_content_cache = {}
 for s in sigs:
-    p = sys.argv[2] + "/" + s[:2] + "/*" + s + "*"
-    files |= set(glob.glob(p))
-    p = sys.argv[2] + "/%s/" % sys.argv[4] + s[:2] + "/*" + s + "*"
-    files |= set(glob.glob(p))
+    prefix = s[:2]
+    if prefix not in sstate_content_cache:
+        sstate_content_cache[prefix] = build_sha_cache(prefix)
+
+    for f in sstate_content_cache[prefix][s]:
+        files.add(f)
+
+elapsed = time.perf_counter() - start_time
+print("Gathering file list took %.1fs" % elapsed)
 
 print('Processing files')
 for f in files:
-- 
2.23.0



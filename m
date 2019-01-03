Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 7F8E26C23C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 07:54:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jan 2019 23:54:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,434,1539673200"; d="scan'208";a="307091604"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga006.fm.intel.com with ESMTP; 02 Jan 2019 23:54:36 -0800
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Jan 2019 15:23:13 +0800
Message-Id: <1546500195-57586-2-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1546500195-57586-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1546500195-57586-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: [PATCH 1/3 v2] scripts/oe-git-archive: fix non-existent key referencing error
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
X-List-Received-Date: Thu, 03 Jan 2019 07:54:35 -0000

Without installing gitpython package, oe-git-archive will face error
below, where it was referencing key that was non-existent inside
metadata object.

Traceback (most recent call last):
  File "<poky_dir>/scripts/oe-git-archive", line 271, in <module>
    sys.exit(main())
  File "<poky_dir>/scripts/oe-git-archive", line 229, in main
    'commit_count': metadata['layers']['meta']['commit_count'],
KeyError: 'commit_count'

Fix this error by checking the key existent from metadata before
referencing it.

[YOCTO# 13082]

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 scripts/oe-git-archive | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/scripts/oe-git-archive b/scripts/oe-git-archive
index ab19cb9..80c2379 100755
--- a/scripts/oe-git-archive
+++ b/scripts/oe-git-archive
@@ -1,4 +1,4 @@
-#!/usr/bin/python3
+#!/usr/bin/env python3
 #
 # Helper script for committing data to git and pushing upstream
 #
@@ -208,6 +208,18 @@ def parse_args(argv):
                         help="Data to commit")
     return parser.parse_args(argv)
 
+def _get_metadata_value(metadata, keys):
+    if len(keys) > 0:
+        key = keys.pop(0)
+        if key in metadata:
+            if len(keys) == 0:
+                return metadata[key]
+            else:
+                return _get_metadata_value(metadata[key], keys)
+        else:
+            return ""
+    else:
+        return ""
 
 def main(argv=None):
     """Script entry point"""
@@ -223,11 +235,15 @@ def main(argv=None):
 
         # Get keywords to be used in tag and branch names and messages
         metadata = metadata_from_bb()
-        keywords = {'hostname': metadata['hostname'],
-                    'branch': metadata['layers']['meta']['branch'],
-                    'commit': metadata['layers']['meta']['commit'],
-                    'commit_count': metadata['layers']['meta']['commit_count'],
-                    'machine': metadata['config']['MACHINE']}
+        keywords_map = {'hostname': ['hostname'],
+                        'branch': ['layers', 'meta', 'branch'],
+                        'commit': ['layers', 'meta', 'commit'],
+                        'commit_count': ['layers', 'meta', 'commit_count'],
+                        'machine': ['config', 'MACHINE']}
+        keywords = {}
+        for map_key in keywords_map.keys():
+            keywords_value = _get_metadata_value(metadata, keywords_map[map_key])
+            keywords[map_key] = keywords_value
 
         # Expand strings early in order to avoid getting into inconsistent
         # state (e.g. no tag even if data was committed)
-- 
2.7.4



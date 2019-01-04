Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 1D53C7BDCB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jan 2019 07:17:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Jan 2019 23:17:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,437,1539673200"; d="scan'208";a="123191436"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga002.jf.intel.com with ESMTP; 03 Jan 2019 23:17:22 -0800
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Jan 2019 14:46:01 +0800
Message-Id: <1546584363-72836-2-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1546584363-72836-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1546584363-72836-1-git-send-email-ee.peng.yeoh@intel.com>
Subject: [PATCH 1/3 v3] scripts/oe-git-archive: fix non-existent key referencing error
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
X-List-Received-Date: Fri, 04 Jan 2019 07:17:22 -0000

Without installing gitpython package, oe-git-archive will face error
below, where it was referencing key that was non-existent inside
metadata object.

Traceback (most recent call last):
  File "<poky_dir>/scripts/oe-git-archive", line 271, in <module>
    sys.exit(main())
  File "<poky_dir>/scripts/oe-git-archive", line 229, in main
    'commit_count': metadata['layers']['meta']['commit_count'],
KeyError: 'commit_count'

Fix this error by adding exception catch when referencing
non-existent key (based on inputs provided by Richard Purdie).

[YOCTO# 13082]

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 scripts/oe-git-archive | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/scripts/oe-git-archive b/scripts/oe-git-archive
index ab19cb9..913291a 100755
--- a/scripts/oe-git-archive
+++ b/scripts/oe-git-archive
@@ -1,4 +1,4 @@
-#!/usr/bin/python3
+#!/usr/bin/env python3
 #
 # Helper script for committing data to git and pushing upstream
 #
@@ -208,6 +208,13 @@ def parse_args(argv):
                         help="Data to commit")
     return parser.parse_args(argv)
 
+def get_nested(d, list_of_keys):
+    try:
+        for k in list_of_keys:
+            d = d[k]
+        return d
+    except KeyError:
+        return ""
 
 def main(argv=None):
     """Script entry point"""
@@ -223,11 +230,11 @@ def main(argv=None):
 
         # Get keywords to be used in tag and branch names and messages
         metadata = metadata_from_bb()
-        keywords = {'hostname': metadata['hostname'],
-                    'branch': metadata['layers']['meta']['branch'],
-                    'commit': metadata['layers']['meta']['commit'],
-                    'commit_count': metadata['layers']['meta']['commit_count'],
-                    'machine': metadata['config']['MACHINE']}
+        keywords = {'hostname': get_nested(metadata, ['hostname']),
+                    'branch': get_nested(metadata, ['layers', 'meta', 'branch']),
+                    'commit': get_nested(metadata, ['layers', 'meta', 'commit']),
+                    'commit_count': get_nested(metadata, ['layers', 'meta', 'commit_count']),
+                    'machine': get_nested(metadata, ['config', 'MACHINE'])}
 
         # Expand strings early in order to avoid getting into inconsistent
         # state (e.g. no tag even if data was committed)
-- 
2.7.4



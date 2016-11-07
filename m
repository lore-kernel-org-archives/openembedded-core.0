Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id CCAD360248
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 22:47:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 07 Nov 2016 14:47:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,459,1473145200"; d="scan'208";a="1056519065"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.14.208])
	by orsmga001.jf.intel.com with ESMTP; 07 Nov 2016 14:47:40 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2016 22:47:23 +0000
Message-Id: <51f3cbb567a289dc90fd901a1d4bedf5456ed766.1478558432.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1478558432.git.joshua.g.lock@intel.com>
References: <cover.1478558432.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1478558432.git.joshua.g.lock@intel.com>
References: <cover.1478558432.git.joshua.g.lock@intel.com>
Subject: [PATCH 2/4] lib/oe/lsb: make the release dict keys consistent regardless of source
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
X-List-Received-Date: Mon, 07 Nov 2016 22:47:39 -0000

Rather than have the distro_identifier method look for different keys in
the dict depending on the source ensure that each function for retrieving
release data uses the same key names in the returned dict.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/lib/oe/lsb.py | 36 +++++++++++++++++++++---------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
index e0bdfba..0bb7686 100644
--- a/meta/lib/oe/lsb.py
+++ b/meta/lib/oe/lsb.py
@@ -1,5 +1,5 @@
-def release_dict():
-    """Return the output of lsb_release -ir as a dictionary"""
+def release_dict_lsb():
+    """ Return the output of lsb_release -ir as a dictionary """
     from subprocess import PIPE
 
     try:
@@ -7,19 +7,28 @@ def release_dict():
     except bb.process.CmdError as exc:
         return None
 
+    lsb_map = { 'Distributor ID': 'DISTRIB_ID',
+                'Release': 'DISTRIB_RELEASE'}
+    lsb_keys = lsb_map.keys()
+
     data = {}
     for line in output.splitlines():
-        if line.startswith("-e"): line = line[3:]
+        if line.startswith("-e"):
+            line = line[3:]
         try:
             key, value = line.split(":\t", 1)
         except ValueError:
             continue
-        else:
-            data[key] = value
+        if key in lsb_keys:
+            data[lsb_map[key]] = value
+
+    if len(data.keys()) != 2:
+        return None
+
     return data
 
 def release_dict_file():
-    """ Try to gather LSB release information manually when lsb_release tool is unavailable """
+    """ Try to gather release information manually when other methods fail """
     data = None
     try:
         if os.path.exists('/etc/lsb-release'):
@@ -64,15 +73,12 @@ def distro_identifier(adjust_hook=None):
 
     import re
 
-    lsb_data = release_dict()
-    if lsb_data:
-        distro_id, release = lsb_data['Distributor ID'], lsb_data['Release']
-    else:
-        lsb_data_file = release_dict_file()
-        if lsb_data_file:
-            distro_id, release = lsb_data_file['DISTRIB_ID'], lsb_data_file.get('DISTRIB_RELEASE', None)
-        else:
-            distro_id, release = None, None
+    distro_data = release_dict_lsb()
+    if not distro_data:
+        distro_data = release_dict_file()
+
+    distro_id = distro_data['DISTRIB_ID']
+    release = distro_data['DISTRIB_RELEASE']
 
     if adjust_hook:
         distro_id, release = adjust_hook(distro_id, release)
-- 
2.7.4



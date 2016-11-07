Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 4328771A5A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 22:47:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 07 Nov 2016 14:47:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,459,1473145200"; d="scan'208";a="1056519069"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.14.208])
	by orsmga001.jf.intel.com with ESMTP; 07 Nov 2016 14:47:41 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Nov 2016 22:47:24 +0000
Message-Id: <8a2842620aca528dab7eb32ed310bffeb12f97ae.1478558432.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1478558432.git.joshua.g.lock@intel.com>
References: <cover.1478558432.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1478558432.git.joshua.g.lock@intel.com>
References: <cover.1478558432.git.joshua.g.lock@intel.com>
Subject: [PATCH 3/4] lib/oe/lsb: prefer /etc/os-release for distribution data
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
X-List-Received-Date: Mon, 07 Nov 2016 22:47:41 -0000

os-release(5) is an increasingly standard source of operating system
identification and more likely to be present on modern OS deployments, i.e.
many container variants of common distros include os-release and not the
lsb_release tool.

Therefore we should favour parsing /etc/os-release in distro_identifier(),
try lsb_release when that fails and finally fall back on various distro
specific sources of OS identification.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/lib/oe/lsb.py | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
index 0bb7686..bdc893f 100644
--- a/meta/lib/oe/lsb.py
+++ b/meta/lib/oe/lsb.py
@@ -1,3 +1,22 @@
+def release_dict_osr():
+    """ Populate a dict with pertinent values from /etc/os-release """
+    if not os.path.exists('/etc/os-release'):
+        return None
+
+    data = {}
+    with open('/etc/os-release') as f:
+        for line in f:
+            key, val = line.rstrip().split('=', 1)
+            if key == 'NAME':
+                data['DISTRIB_ID'] = val
+            if key == 'VERSION_ID':
+                data['DISTRIB_RELEASE'] = val
+
+    if len(data.keys()) != 2:
+        return None
+
+    return data
+
 def release_dict_lsb():
     """ Return the output of lsb_release -ir as a dictionary """
     from subprocess import PIPE
@@ -46,14 +65,6 @@ def release_dict_file():
             if match:
                 data['DISTRIB_ID'] = match.group(1)
                 data['DISTRIB_RELEASE'] = match.group(2)
-        elif os.path.exists('/etc/os-release'):
-            data = {}
-            with open('/etc/os-release') as f:
-                for line in f:
-                    if line.startswith('NAME='):
-                        data['DISTRIB_ID'] = line[5:].rstrip().strip('"')
-                    if line.startswith('VERSION_ID='):
-                        data['DISTRIB_RELEASE'] = line[11:].rstrip().strip('"')
         elif os.path.exists('/etc/SuSE-release'):
             data = {}
             data['DISTRIB_ID'] = 'SUSE LINUX'
@@ -73,7 +84,12 @@ def distro_identifier(adjust_hook=None):
 
     import re
 
-    distro_data = release_dict_lsb()
+    # Try /etc/os-release first, then the output of `lsb_release -ir` and
+    # finally fall back on parsing various release files in order to determine
+    # host distro name and version.
+    distro_data = release_dict_osr()
+    if not distro_data:
+        distro_data = release_dict_lsb()
     if not distro_data:
         distro_data = release_dict_file()
 
-- 
2.7.4



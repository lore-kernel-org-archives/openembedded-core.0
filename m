Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3F12B71A36
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2016 14:50:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 08 Nov 2016 06:50:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,462,1473145200"; d="scan'208";a="1056869882"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.8.222])
	by orsmga001.jf.intel.com with ESMTP; 08 Nov 2016 06:50:09 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2016 14:49:55 +0000
Message-Id: <8033a65e8747c2db3e4d467e462e190174db1104.1478615920.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1478615920.git.joshua.g.lock@intel.com>
References: <cover.1478615920.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1478615920.git.joshua.g.lock@intel.com>
References: <cover.1478615920.git.joshua.g.lock@intel.com>
Subject: [PATCH v2 3/4] lib/oe/lsb: prefer /etc/os-release for distribution data
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
X-List-Received-Date: Tue, 08 Nov 2016 14:50:08 -0000

os-release(5) is an increasingly standard source of operating system
identification and more likely to be present on modern OS deployments, i.e.
many container variants of common distros include os-release and not the
lsb_release tool.

Therefore we should favour parsing /etc/os-release in distro_identifier(),
try lsb_release when that fails and finally fall back on various distro
specific sources of OS identification.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/lib/oe/lsb.py | 37 ++++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
index 0bb7686..8018c7b 100644
--- a/meta/lib/oe/lsb.py
+++ b/meta/lib/oe/lsb.py
@@ -1,3 +1,25 @@
+def release_dict_osr():
+    """ Populate a dict with pertinent values from /etc/os-release """
+    if not os.path.exists('/etc/os-release'):
+        return None
+
+    data = {}
+    with open('/etc/os-release') as f:
+        for line in f:
+            try:
+                key, val = line.rstrip().split('=', 1)
+            except ValueError:
+                continue
+            if key == 'NAME':
+                data['DISTRIB_ID'] = val.strip('"')
+            if key == 'VERSION_ID':
+                data['DISTRIB_RELEASE'] = val.strip('"')
+
+    if len(data.keys()) != 2:
+        return None
+
+    return data
+
 def release_dict_lsb():
     """ Return the output of lsb_release -ir as a dictionary """
     from subprocess import PIPE
@@ -46,14 +68,6 @@ def release_dict_file():
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
@@ -73,7 +87,12 @@ def distro_identifier(adjust_hook=None):
 
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



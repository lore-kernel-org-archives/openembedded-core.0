Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id ABD2F77D44
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 08:17:27 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Apr 2017 01:17:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,257,1488873600"; d="scan'208";a="850336759"
Received: from lcosgrav-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.20.227])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Apr 2017 01:17:26 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Apr 2017 11:17:33 +0300
Message-Id: <20170427081733.20125-2-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20170427081733.20125-1-markus.lehtonen@linux.intel.com>
References: <20170427081733.20125-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH v2 1/1] oe.lsb: add get_os_release()
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
X-List-Received-Date: Thu, 27 Apr 2017 08:17:28 -0000

Move get_os_release() from oeqa.utils.metadata to oe.lsb, merging the
code with release_dict_osr() from oe.lsb. This removes some code
duplication and makes get_os_release() more robust.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oe/lsb.py              | 33 ++++++++++++++++++++-------------
 meta/lib/oeqa/utils/metadata.py | 16 +++-------------
 2 files changed, 23 insertions(+), 26 deletions(-)

diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
index 3a945e0fce..71c0992c5d 100644
--- a/meta/lib/oe/lsb.py
+++ b/meta/lib/oe/lsb.py
@@ -1,19 +1,26 @@
+def get_os_release():
+    """Get all key-value pairs from /etc/os-release as a dict"""
+    from collections import OrderedDict
+
+    data = OrderedDict()
+    if os.path.exists('/etc/os-release'):
+        with open('/etc/os-release') as f:
+            for line in f:
+                try:
+                    key, val = line.rstrip().split('=', 1)
+                except ValueError:
+                    continue
+                data[key.strip()] = val.strip('"')
+    return data
+
 def release_dict_osr():
     """ Populate a dict with pertinent values from /etc/os-release """
-    if not os.path.exists('/etc/os-release'):
-        return None
-
     data = {}
-    with open('/etc/os-release') as f:
-        for line in f:
-            try:
-                key, val = line.rstrip().split('=', 1)
-            except ValueError:
-                continue
-            if key == 'ID':
-                data['DISTRIB_ID'] = val.strip('"')
-            if key == 'VERSION_ID':
-                data['DISTRIB_RELEASE'] = val.strip('"')
+    os_release = get_os_release()
+    if 'ID' in os_release:
+        data['DISTRIB_ID'] = os_release['ID']
+    if 'VERSION_ID' in os_release:
+        data['DISTRIB_RELEASE'] = os_release['VERSION_ID']
 
     return data
 
diff --git a/meta/lib/oeqa/utils/metadata.py b/meta/lib/oeqa/utils/metadata.py
index cb81155e54..65bbdc61f4 100644
--- a/meta/lib/oeqa/utils/metadata.py
+++ b/meta/lib/oeqa/utils/metadata.py
@@ -10,19 +10,9 @@ from collections.abc import MutableMapping
 from xml.dom.minidom import parseString
 from xml.etree.ElementTree import Element, tostring
 
+from oe.lsb import get_os_release
 from oeqa.utils.commands import runCmd, get_bb_vars
 
-def get_os_release():
-    """Get info from /etc/os-release as a dict"""
-    data = OrderedDict()
-    os_release_file = '/etc/os-release'
-    if not os.path.exists(os_release_file):
-        return None
-    with open(os_release_file) as fobj:
-        for line in fobj:
-            key, value = line.split('=', 1)
-            data[key.strip().lower()] = value.strip().strip('"')
-    return data
 
 def metadata_from_bb():
     """ Returns test's metadata as OrderedDict.
@@ -45,9 +35,9 @@ def metadata_from_bb():
     os_release = get_os_release()
     if os_release:
         info_dict['host_distro'] = OrderedDict()
-        for key in ('id', 'version_id', 'pretty_name'):
+        for key in ('ID', 'VERSION_ID', 'PRETTY_NAME'):
             if key in os_release:
-                info_dict['host_distro'][key] = os_release[key]
+                info_dict['host_distro'][key.lower()] = os_release[key]
 
     info_dict['layers'] = get_layers(data_dict['BBLAYERS'])
     info_dict['bitbake'] = git_rev_info(os.path.dirname(bb.__file__))
-- 
2.12.0



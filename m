Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BD633605FF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 22:09:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Nov 2016 14:09:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,496,1473145200"; d="scan'208";a="1059902589"
Received: from jlock-mobl1.ger.corp.intel.com ([10.249.254.65])
	by orsmga001.jf.intel.com with ESMTP; 15 Nov 2016 14:09:06 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2016 22:08:54 +0000
Message-Id: <1479247734-30259-1-git-send-email-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] lib/oe/lsb: better handle missing fields
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
X-List-Received-Date: Tue, 15 Nov 2016 22:09:09 -0000

Some rolling release distros, such as Arch Linux, don't include a
VERSION_ID field in their os-release file.

Change release_dict_osr() to better handle this optional field
being absent.

Further improve the resilience of the release_dict_*() methods by
always returning a dict and using dict.get() in distro_identifier()
to supply a default, empty string, value when then key is missing.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/lib/oe/lsb.py | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
index 5a795a1..3a945e0 100644
--- a/meta/lib/oe/lsb.py
+++ b/meta/lib/oe/lsb.py
@@ -15,9 +15,6 @@ def release_dict_osr():
             if key == 'VERSION_ID':
                 data['DISTRIB_RELEASE'] = val.strip('"')
 
-    if len(data.keys()) != 2:
-        return None
-
     return data
 
 def release_dict_lsb():
@@ -27,7 +24,7 @@ def release_dict_lsb():
     try:
         output, err = bb.process.run(['lsb_release', '-ir'], stderr=PIPE)
     except bb.process.CmdError as exc:
-        return None
+        return {}
 
     lsb_map = { 'Distributor ID': 'DISTRIB_ID',
                 'Release': 'DISTRIB_RELEASE'}
@@ -51,7 +48,7 @@ def release_dict_lsb():
 
 def release_dict_file():
     """ Try to gather release information manually when other methods fail """
-    data = None
+    data = {}
     try:
         if os.path.exists('/etc/lsb-release'):
             data = {}
@@ -78,7 +75,7 @@ def release_dict_file():
                         break
 
     except IOError:
-        return None
+        return {}
     return data
 
 def distro_identifier(adjust_hook=None):
@@ -96,8 +93,8 @@ def distro_identifier(adjust_hook=None):
     if not distro_data:
         distro_data = release_dict_file()
 
-    distro_id = distro_data['DISTRIB_ID']
-    release = distro_data['DISTRIB_RELEASE']
+    distro_id = distro_data.get('DISTRIB_ID', '')
+    release = distro_data.get('DISTRIB_RELEASE', '')
 
     if adjust_hook:
         distro_id, release = adjust_hook(distro_id, release)
-- 
2.7.4



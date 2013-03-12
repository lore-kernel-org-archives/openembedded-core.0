Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UFGKR-0003eO-G8
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 04:56:43 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Mar 2013 20:40:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,827,1355126400"; d="scan'208";a="304388163"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.40])
	by fmsmga002.fm.intel.com with ESMTP; 11 Mar 2013 20:40:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Mar 2013 03:39:56 +0000
Message-Id: <1363059596-10002-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] lib/oe/lsb: enable getting distro ID when lsb_release is not installed
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Mar 2013 03:56:45 -0000

If lsb_release is not installed (as it may not be on headless/minimal
installations on distros whose LSB package has a long list of
dependencies) we need to gather the information directly from files in
/etc.

Fixes [YOCTO #4012].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/lsb.py |   39 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
index 9133356..f4a5ba1 100644
--- a/meta/lib/oe/lsb.py
+++ b/meta/lib/oe/lsb.py
@@ -17,6 +17,37 @@ def release_dict():
             data[key] = value
     return data
 
+def release_dict_file():
+    """ Try to gather LSB release information manually when lsb_release tool is unavailable """
+    data = None
+    try:
+        if os.path.exists('/etc/lsb-release'):
+            data = {}
+            with open('/etc/lsb-release') as f:
+                for line in f:
+                    key, value = line.split("=", 1)
+                    data[key] = value
+        elif os.path.exists('/etc/redhat-release'):
+            data = {}
+            with open('/etc/redhat-release') as f:
+                distro = f.readline().strip()
+            import re
+            match = re.match(r'(.*) release (.*) \((.*)\)', distro)
+            if match:
+                data['DISTRIB_ID'] = match.group(1)
+                data['DISTRIB_RELEASE'] = match.group(2)
+        elif os.path.exists('/etc/SuSE-release'):
+            data = {}
+            data['DISTRIB_ID'] = 'SUSE LINUX'
+            with open('/etc/SuSE-release') as f:
+                for line in f:
+                    if line.startswith('VERSION = '):
+                        data['DISTRIB_RELEASE'] = line[10:].rstrip()
+                        break
+    except IOError:
+        return None
+    return data
+
 def distro_identifier(adjust_hook=None):
     """Return a distro identifier string based upon lsb_release -ri,
        with optional adjustment via a hook"""
@@ -25,8 +56,12 @@ def distro_identifier(adjust_hook=None):
     if lsb_data:
         distro_id, release = lsb_data['Distributor ID'], lsb_data['Release']
     else:
-        distro_id, release = None, None
-        
+        lsb_data_file = release_dict_file()
+        if lsb_data_file:
+            distro_id, release = lsb_data_file['DISTRIB_ID'], lsb_data_file['DISTRIB_RELEASE']
+        else:
+            distro_id, release = None, None
+
     if adjust_hook:
         distro_id, release = adjust_hook(distro_id, release)
     if not distro_id:
-- 
1.7.10.4




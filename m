Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 81673619DE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 16:12:00 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Jun 2013 09:11:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,958,1363158000"; d="scan'208";a="323981975"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.97])
	by azsmga001.ch.intel.com with ESMTP; 28 Jun 2013 09:09:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 17:09:46 +0100
Message-Id: <1372435786-15915-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] lib/oe/lsb.py: fall back to /etc/os-release for host distro ID
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
X-List-Received-Date: Fri, 28 Jun 2013 16:12:01 -0000

The new standard for host distribution identification [1] is
/etc/os-release, and a number of newer distributions provide this file,
so add support for this in order to pick up more distributions.
Additionally, handle "rolling release" style distributions that don't
report a version number, e.g. Arch Linux.

With this change we can identify the most common distributions, so this
should satisfy [YOCTO #4271]. Note that this doesn't imply support for
these distros as build hosts, just that we can identify them.

[1] http://www.freedesktop.org/software/systemd/man/os-release.html

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/lsb.py | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
index fed1204..b53f361 100644
--- a/meta/lib/oe/lsb.py
+++ b/meta/lib/oe/lsb.py
@@ -44,6 +44,14 @@ def release_dict_file():
                     if line.startswith('VERSION = '):
                         data['DISTRIB_RELEASE'] = line[10:].rstrip()
                         break
+        elif os.path.exists('/etc/os-release'):
+            data = {}
+            with open('/etc/os-release') as f:
+                for line in f:
+                    if line.startswith('NAME='):
+                        data['DISTRIB_ID'] = line[5:].rstrip().strip('"')
+                    if line.startswith('VERSION_ID='):
+                        data['DISTRIB_RELEASE'] = line[11:].rstrip().strip('"')
     except IOError:
         return None
     return data
@@ -58,7 +66,7 @@ def distro_identifier(adjust_hook=None):
     else:
         lsb_data_file = release_dict_file()
         if lsb_data_file:
-            distro_id, release = lsb_data_file['DISTRIB_ID'], lsb_data_file['DISTRIB_RELEASE']
+            distro_id, release = lsb_data_file['DISTRIB_ID'], lsb_data_file.get('DISTRIB_RELEASE', None)
         else:
             distro_id, release = None, None
 
@@ -66,4 +74,8 @@ def distro_identifier(adjust_hook=None):
         distro_id, release = adjust_hook(distro_id, release)
     if not distro_id:
         return "Unknown"
-    return '{0}-{1}'.format(distro_id, release).replace(' ','-').replace('/','-')
+    if release:
+        id_str = '{0}-{1}'.format(distro_id, release)
+    else:
+        id_str = distro_id
+    return id_str.replace(' ','-').replace('/','-')
-- 
1.8.1.2



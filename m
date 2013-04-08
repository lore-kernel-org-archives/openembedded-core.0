Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1UPDo3-0008PY-E9
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 17:16:29 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 08 Apr 2013 07:57:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,432,1363158000"; d="scan'208";a="314747275"
Received: from bogdanm.rb.intel.com ([10.237.105.166])
	by orsmga002.jf.intel.com with ESMTP; 08 Apr 2013 07:59:06 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Apr 2013 18:02:38 +0300
Message-Id: <1365433358-29073-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] smart: disable CHANNELSDIR
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
X-List-Received-Date: Mon, 08 Apr 2013 15:16:30 -0000

Make CHANNELSDIR in smart empty, since this causes host contamination issues
on some RPM-based hosts on which smart is already installed.

[YOCTO #3881]

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../python/python-smartpm/smart-channelsdir.patch  | 24 ++++++++++++++++++++++
 .../python/python-smartpm_1.4.1.bb                 |  3 ++-
 2 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-channelsdir.patch

diff --git a/meta/recipes-devtools/python/python-smartpm/smart-channelsdir.patch b/meta/recipes-devtools/python/python-smartpm/smart-channelsdir.patch
new file mode 100644
index 0000000..e621b33
--- /dev/null
+++ b/meta/recipes-devtools/python/python-smartpm/smart-channelsdir.patch
@@ -0,0 +1,24 @@
+Make CHANNELSDIR in smart empty, since this causes host contamination issues
+on some RPM-based hosts on which smart is already installed.
+
+[YOCTO #3881]
+
+Upstream-Status: Inappropriate [embedded specific]
+
+diff --git a/smart/plugins/channelsync.py b/smart/plugins/channelsync.py
+index 3ba95ff..646d696 100644
+--- a/smart/plugins/channelsync.py
++++ b/smart/plugins/channelsync.py
+@@ -23,7 +23,11 @@ from smart.channel import *
+ from smart import *
+ import os
+ 
+-CHANNELSDIR = "/etc/smart/channels/"
++# For now, we leave the definition of CHANNELSDIR empty. This prevents smart
++# from erroneously consider the  build host's channels while setting up its
++# channels [YOCTO #3881]. If this feature will be used in the future, CHANNELSDIR
++# should be set to a proper value.
++CHANNELSDIR = ""
+ 
+ def syncChannels(channelsdir, force=None):
+ 
diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
index d92933f..001d9e4 100644
--- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
+++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
@@ -11,7 +11,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
 
 DEPENDS = "python rpm"
-PR = "r8"
+PR = "r9"
 SRCNAME = "smart"
 
 SRC_URI = "\
@@ -27,6 +27,7 @@ SRC_URI = "\
           file://smart-improve-error-reporting.patch \
           file://smart-multilib-fixes.patch \
           file://smart-yaml-error.patch \
+          file://smart-channelsdir.patch \
           "
 
 SRC_URI[md5sum] = "573ef32ba177a6b3c4bf7ef04873fcb6"
-- 
1.8.1.4




Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1U07Jo-0001HC-Te
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 10:17:36 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 29 Jan 2013 01:01:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,559,1355126400"; d="scan'208";a="249615597"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.166])
	by azsmga001.ch.intel.com with ESMTP; 29 Jan 2013 01:01:46 -0800
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jan 2013 11:05:02 +0200
Message-Id: <1359450302-32222-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH v2] python-smartpm: multilib fixes
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
X-List-Received-Date: Tue, 29 Jan 2013 09:17:38 -0000
X-List-Received-Date: Tue, 29 Jan 2013 09:17:38 -0000

To fix some multilib issues, change the way the RPM backend decides
if two packages can coexist: if they have a different architecture,
automatically assume that they can coexist (which is fundamental for
multilib).

[YOCTO #3681]

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../python-smartpm/smart-multilib-fixes.patch      |   22 ++++++++++++++++++++
 .../python/python-smartpm_1.4.1.bb                 |    3 ++-
 2 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-multilib-fixes.patch

diff --git a/meta/recipes-devtools/python/python-smartpm/smart-multilib-fixes.patch b/meta/recipes-devtools/python/python-smartpm/smart-multilib-fixes.patch
new file mode 100644
index 0000000..56fef79
--- /dev/null
+++ b/meta/recipes-devtools/python/python-smartpm/smart-multilib-fixes.patch
@@ -0,0 +1,22 @@
+To fix some multilib issues, change the way the RPM backend decides
+if two packages can coexist: if they have a different architecture,
+automatically assume that they can coexist (which is fundamental for
+multilib).
+
+Upstream-Status: Pending
+
+Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
+
+diff --git a/smart/backends/rpm/base.py b/smart/backends/rpm/base.py
+index 6e83d40..7140c1b 100644
+--- a/smart/backends/rpm/base.py
++++ b/smart/backends/rpm/base.py
+@@ -228,6 +228,8 @@ class RPMPackage(Package):
+             return False
+         selfver, selfarch = splitarch(self.version)
+         otherver, otherarch = splitarch(other.version)
++        if selfarch != otherarch:
++            return True
+         selfcolor = getArchColor(selfarch)
+         othercolor = getArchColor(otherarch)
+         if (selfcolor and othercolor and selfcolor != othercolor and
diff --git a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
index 4d0f96b..06641ad 100644
--- a/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
+++ b/meta/recipes-devtools/python/python-smartpm_1.4.1.bb
@@ -11,7 +11,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
 
 DEPENDS = "python rpm"
-PR = "r7"
+PR = "r8"
 SRCNAME = "smart"
 
 SRC_URI = "\
@@ -25,6 +25,7 @@ SRC_URI = "\
           file://smart-tmpdir.patch \
           file://smart-metadata-match.patch \
           file://smart-improve-error-reporting.patch \
+          file://smart-multilib-fixes.patch \
           "
 
 SRC_URI[md5sum] = "573ef32ba177a6b3c4bf7ef04873fcb6"
-- 
1.7.10.4




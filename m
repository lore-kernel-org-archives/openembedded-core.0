Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1TzquA-0003ya-G7
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 16:46:14 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Jan 2013 07:30:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,551,1355126400"; d="scan'208";a="195877101"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.166])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Jan 2013 07:30:13 -0800
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2013 17:33:29 +0200
Message-Id: <1359387209-6272-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] python-smartpm: multilib fixes
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
X-List-Received-Date: Mon, 28 Jan 2013 15:46:17 -0000

To fix some multilib issues, change the way smart's RPM backend decides
if two packages can coexist:

 - don't test the "multi-version" flag on the packet. In Yocto,
almost every package can be "multi-version" in a multilib configuration.
  - let two packages coexist if they have different versions OR different
architectures (which is fundamental for multilib).

[YOCTO #3681]

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../python-smartpm/smart-multilib-fixes.patch      |   31 ++++++++++++++++++++
 .../python/python-smartpm_1.4.1.bb                 |    3 +-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-multilib-fixes.patch

diff --git a/meta/recipes-devtools/python/python-smartpm/smart-multilib-fixes.patch b/meta/recipes-devtools/python/python-smartpm/smart-multilib-fixes.patch
new file mode 100644
index 0000000..6051ef3
--- /dev/null
+++ b/meta/recipes-devtools/python/python-smartpm/smart-multilib-fixes.patch
@@ -0,0 +1,31 @@
+smart multilib fixes
+
+To fix some multilib issues, change the way the RPM backend decides
+if two packages can coexist:
+
+ - don't test the "multi-version" flag on the packet. In Yocto,
+almost every package can be "multi-version" in a multilib configuration.
+ - let two packages coexist if they have different versions OR different
+architectures (which is fundamental for multilib). 
+
+Upstream-Status: Pending
+
+Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
+
+diff --git a/smart/backends/rpm/base.py b/smart/backends/rpm/base.py
+index 6e83d40..72eb8a9 100644
+--- a/smart/backends/rpm/base.py
++++ b/smart/backends/rpm/base.py
+@@ -233,9 +233,9 @@ class RPMPackage(Package):
+         if (selfcolor and othercolor and selfcolor != othercolor and
+             not sysconf.get("rpm-strict-multilib")):
+             return True
+-        if not pkgconf.testFlag("multi-version", self):
+-            return False
+-        return selfver != otherver
++        #if not pkgconf.testFlag("multi-version", self):
++        #    return False
++        return selfver != otherver or selfarch != otherarch
+ 
+     def matches(self, relation, version):
+         if not relation:
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




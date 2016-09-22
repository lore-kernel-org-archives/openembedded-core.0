Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 65B5A71974
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 13:05:58 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 22 Sep 2016 06:05:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,378,1470726000"; d="scan'208";a="1034671546"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.13.185])
	by orsmga001.jf.intel.com with ESMTP; 22 Sep 2016 06:05:57 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Sep 2016 14:05:50 +0100
Message-Id: <1474549551-15435-1-git-send-email-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] toolchain-scripts-base: add base class for toolchain_create_sdk_version
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
X-List-Received-Date: Thu, 22 Sep 2016 13:06:00 -0000

We use toolchain_create_sdk_version() in buildtools-tarball but
don't want the extra classes toolchain-scripts pulls in, therefore
split out a separate base class for this function which both
toolchain-scripts and the buildtools-tarball can inherit.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/classes/toolchain-scripts-base.bbclass | 11 +++++++++++
 meta/classes/toolchain-scripts.bbclass      | 14 +-------------
 2 files changed, 12 insertions(+), 13 deletions(-)
 create mode 100644 meta/classes/toolchain-scripts-base.bbclass

diff --git a/meta/classes/toolchain-scripts-base.bbclass b/meta/classes/toolchain-scripts-base.bbclass
new file mode 100644
index 0000000..2489b9d
--- /dev/null
+++ b/meta/classes/toolchain-scripts-base.bbclass
@@ -0,0 +1,11 @@
+#This function create a version information file
+toolchain_create_sdk_version () {
+	local versionfile=$1
+	rm -f $versionfile
+	touch $versionfile
+	echo 'Distro: ${DISTRO}' >> $versionfile
+	echo 'Distro Version: ${DISTRO_VERSION}' >> $versionfile
+	echo 'Metadata Revision: ${METADATA_REVISION}' >> $versionfile
+	echo 'Timestamp: ${DATETIME}' >> $versionfile
+}
+toolchain_create_sdk_version[vardepsexclude] = "DATETIME"
diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 997ff88..0e11f2d 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -1,4 +1,4 @@
-inherit siteinfo kernel-arch
+inherit toolchain-scripts-base siteinfo kernel-arch
 
 # We want to be able to change the value of MULTIMACH_TARGET_SYS, because it
 # doesn't always match our expectations... but we default to the stock value
@@ -136,18 +136,6 @@ toolchain_create_sdk_siteconfig () {
 # The immediate expansion above can result in unwanted path dependencies here
 toolchain_create_sdk_siteconfig[vardepsexclude] = "TOOLCHAIN_CONFIGSITE_SYSROOTCACHE"
 
-#This function create a version information file
-toolchain_create_sdk_version () {
-	local versionfile=$1
-	rm -f $versionfile
-	touch $versionfile
-	echo 'Distro: ${DISTRO}' >> $versionfile
-	echo 'Distro Version: ${DISTRO_VERSION}' >> $versionfile
-	echo 'Metadata Revision: ${METADATA_REVISION}' >> $versionfile
-	echo 'Timestamp: ${DATETIME}' >> $versionfile
-}
-toolchain_create_sdk_version[vardepsexclude] = "DATETIME"
-
 python __anonymous () {
     import oe.classextend
     deps = ""
-- 
2.7.4



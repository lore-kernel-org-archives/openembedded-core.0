Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 04D5977700
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 11:25:44 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 10 Mar 2017 03:25:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,140,1486454400"; d="scan'208";a="1106988176"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 10 Mar 2017 03:25:44 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Mar 2017 13:23:56 +0200
Message-Id: <34f20f77a127ec573dc77565dc40039b13d270d2.1489144807.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 17/44] package_rpm.bbclass: make architecture-independent .rpm packages "noarch" instead of "all"
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
X-List-Received-Date: Fri, 10 Mar 2017 11:25:44 -0000

Too many places in dnf/rpm4 stack make that assumption; let's not fight against it.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/package_rpm.bbclass | 4 +++-
 meta/classes/sstate.bbclass      | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index db448ab8d1d..07eb974f736 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -684,7 +684,9 @@ python do_package_rpm () {
     rpmbuild = d.getVar('RPMBUILD')
     targetsys = d.getVar('TARGET_SYS')
     targetvendor = d.getVar('HOST_VENDOR')
-    package_arch = (d.getVar('PACKAGE_ARCH') or "").replace("-", "_")
+    # Too many places in dnf stack assume that arch-independent packages are "noarch".
+    # Let's not fight against this.
+    package_arch = (d.getVar('PACKAGE_ARCH') or "").replace("-", "_").replace("all", "noarch")
     sdkpkgsuffix = (d.getVar('SDKPKGSUFFIX') or "nativesdk").replace("-", "_")
     if package_arch not in "all any noarch".split() and not package_arch.endswith(sdkpkgsuffix):
         ml_prefix = (d.getVar('MLPREFIX') or "").replace("-", "_")
diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 23dda082ca4..b7d8e610f07 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -25,7 +25,7 @@ PV[vardepvalue] = "${PV}"
 SSTATE_EXTRAPATH[vardepvalue] = ""
 
 # For multilib rpm the allarch packagegroup files can overwrite (in theory they're identical)
-SSTATE_DUPWHITELIST = "${DEPLOY_DIR_IMAGE}/ ${DEPLOY_DIR}/licenses/ ${DEPLOY_DIR_RPM}/all/"
+SSTATE_DUPWHITELIST = "${DEPLOY_DIR_IMAGE}/ ${DEPLOY_DIR}/licenses/ ${DEPLOY_DIR_RPM}/noarch/"
 # Avoid docbook/sgml catalog warnings for now
 SSTATE_DUPWHITELIST += "${STAGING_ETCDIR_NATIVE}/sgml ${STAGING_DATADIR_NATIVE}/sgml"
 # Archive the sources for many architectures in one deploy folder
-- 
2.11.0



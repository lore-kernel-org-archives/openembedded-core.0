Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id E496777719
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 11:25:52 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 10 Mar 2017 03:25:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,140,1486454400"; d="scan'208";a="1106988213"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 10 Mar 2017 03:25:53 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Mar 2017 13:24:04 +0200
Message-Id: <877a23b383a47a6b6e2b0f7861e71fb84a2678cf.1489144807.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 25/44] package_rpm.bbclass: no need to specify the magic file location
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
X-List-Received-Date: Fri, 10 Mar 2017 11:25:53 -0000

It's handled by the rpm wrapper command, created in rpm recipe.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/package_rpm.bbclass | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 27a2bb479a2..9b634e583b8 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -693,7 +693,6 @@ python do_package_rpm () {
     d.setVar('RPM_PKGWRITEDIR', pkgwritedir)
     bb.debug(1, 'PKGWRITEDIR: %s' % d.getVar('RPM_PKGWRITEDIR'))
     pkgarch = d.expand('${PACKAGE_ARCH_EXTEND}${HOST_VENDOR}-${HOST_OS}')
-    magicfile = d.expand('${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc')
     bb.utils.mkdirhier(pkgwritedir)
     os.chmod(pkgwritedir, 0o755)
 
@@ -711,7 +710,6 @@ python do_package_rpm () {
         cmd = cmd + " --define '__find_provides %{nil}'"
     cmd = cmd + " --define '_unpackaged_files_terminate_build 0'"
     cmd = cmd + " --define 'debug_package %{nil}'"
-    cmd = cmd + " --define '_rpmfc_magic_path " + magicfile + "'"
     cmd = cmd + " --define '_tmppath " + workdir + "'"
     if d.getVarFlag('ARCHIVER_MODE', 'srpm') == '1' and bb.data.inherits_class('archiver', d):
         cmd = cmd + " --define '_sourcedir " + d.getVar('ARCHIVER_OUTDIR') + "'"
-- 
2.11.0



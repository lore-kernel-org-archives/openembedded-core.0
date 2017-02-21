Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 4F99C72F7D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 14:48:53 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 21 Feb 2017 06:48:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,190,1484035200"; d="scan'208";a="1132875793"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 21 Feb 2017 06:48:53 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 16:46:42 +0200
Message-Id: <fc54f03855b29145ef7e947e39641b124b09dbb4.1487687951.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
References: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 25/39] package_rpm.bbclass: no need to specify the magic file location
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
X-List-Received-Date: Tue, 21 Feb 2017 14:48:53 -0000

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



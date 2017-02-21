Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id C672972F83
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 14:48:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 21 Feb 2017 06:48:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,190,1484035200"; d="scan'208";a="1132875810"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 21 Feb 2017 06:48:55 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 16:46:44 +0200
Message-Id: <8a29ba811f9e411142deaee2d89ffec99e107125.1487687951.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
References: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 27/39] package_rpm.bbclass: instruct rpm to not remove the buildroot directory
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
X-List-Received-Date: Tue, 21 Feb 2017 14:48:55 -0000

This is the ${W}/package directory which may be reused in subsequent builds.

Also clean up various default directories rpm 4 creates.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/package_rpm.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 9b634e583b8..ff86dc87980 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -697,7 +697,7 @@ python do_package_rpm () {
     os.chmod(pkgwritedir, 0o755)
 
     cmd = rpmbuild
-    cmd = cmd + " --nodeps --short-circuit --target " + pkgarch + " --buildroot " + pkgd
+    cmd = cmd + " --noclean --nodeps --short-circuit --target " + pkgarch + " --buildroot " + pkgd
     cmd = cmd + " --define '_topdir " + workdir + "' --define '_rpmdir " + pkgwritedir + "'"
     cmd = cmd + " --define '_builddir " + d.getVar('S') + "'"
     cmd = cmd + " --define '_build_name_fmt %%{NAME}-%%{VERSION}-%%{RELEASE}.%%{ARCH}.rpm'"
@@ -721,8 +721,11 @@ python do_package_rpm () {
         bb.build.exec_func('SBUILDSPEC', d)
     cmd = cmd + " -bb " + outspecfile
 
+    # rpm 4 creates various empty directories in _topdir, let's clean them up
+    cleanupcmd = "rm -rf %s/BUILDROOT %s/SOURCES %s/SPECS %s/SRPMS" % (workdir, workdir, workdir, workdir)
+
     # Build the rpm package!
-    d.setVar('BUILDSPEC', cmd + "\n")
+    d.setVar('BUILDSPEC', cmd + "\n" + cleanupcmd + "\n")
     d.setVarFlag('BUILDSPEC', 'func', '1')
     bb.build.exec_func('BUILDSPEC', d)
 
-- 
2.11.0



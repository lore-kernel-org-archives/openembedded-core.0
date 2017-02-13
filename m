Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 9C303731AE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 15:06:04 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 13 Feb 2017 07:06:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,156,1484035200"; d="scan'208";a="64546742"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 13 Feb 2017 07:06:04 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Feb 2017 17:05:57 +0200
Message-Id: <23db1a069d75e3420a6e52b436cc0363fe1fb4c4.1486997986.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
References: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 27/36] package_rpm.bbclass: prevent rpm from using sysroot paths that it was originally compiled with
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
X-List-Received-Date: Mon, 13 Feb 2017 15:06:05 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/package_rpm.bbclass | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 1bf155a92ea..a972f0bb7d5 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -699,6 +699,14 @@ python do_package_rpm () {
     bb.utils.mkdirhier(pkgwritedir)
     os.chmod(pkgwritedir, 0o755)
 
+    # Direct rpm-native to read configuration from our sysroot, not the one it was compiled in
+    # libmagic also has sysroot path contamination, so override it
+    export_cmd = """
+export RPM_CONFIGDIR=%s
+export RPM_ETCCONFIGDIR=%s
+export MAGIC=%s
+""" %(oe.path.join(d.getVar('STAGING_LIBDIR_NATIVE'), "rpm"),d.getVar('STAGING_DIR_NATIVE'), magicfile)
+
     cmd = rpmbuild
     cmd = cmd + " --nodeps --short-circuit --target " + pkgarch + " --buildroot " + pkgd
     cmd = cmd + " --define '_topdir " + workdir + "' --define '_rpmdir " + pkgwritedir + "'"
@@ -713,20 +721,19 @@ python do_package_rpm () {
         cmd = cmd + " --define '__find_provides %{nil}'"
     cmd = cmd + " --define '_unpackaged_files_terminate_build 0'"
     cmd = cmd + " --define 'debug_package %{nil}'"
-    cmd = cmd + " --define '_rpmfc_magic_path " + magicfile + "'"
     cmd = cmd + " --define '_tmppath " + workdir + "'"
     if d.getVarFlag('ARCHIVER_MODE', 'srpm') == '1' and bb.data.inherits_class('archiver', d):
         cmd = cmd + " --define '_sourcedir " + d.getVar('ARCHIVER_OUTDIR') + "'"
         cmdsrpm = cmd + " --define '_srcrpmdir " + d.getVar('ARCHIVER_OUTDIR') + "'"
         cmdsrpm = cmdsrpm + " -bs " + outspecfile
         # Build the .src.rpm
-        d.setVar('SBUILDSPEC', cmdsrpm + "\n")
+        d.setVar('SBUILDSPEC', export_cmd + "\n"+ cmdsrpm + "\n")
         d.setVarFlag('SBUILDSPEC', 'func', '1')
         bb.build.exec_func('SBUILDSPEC', d)
     cmd = cmd + " -bb " + outspecfile
 
     # Build the rpm package!
-    d.setVar('BUILDSPEC', cmd + "\n")
+    d.setVar('BUILDSPEC', export_cmd + "\n" + cmd + "\n")
     d.setVarFlag('BUILDSPEC', 'func', '1')
     bb.build.exec_func('BUILDSPEC', d)
 
-- 
2.11.0



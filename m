Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 00A18747FD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 09:36:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 May 2018 02:36:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,436,1520924400"; d="scan'208";a="42455554"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga008.fm.intel.com with ESMTP; 24 May 2018 02:36:51 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2018 12:36:44 +0300
Message-Id: <20180524093649.6911-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH 1/6] package_manager.py: get rid of ROOTFS_RPM_DEBUG in RpmPM()
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
X-List-Received-Date: Thu, 24 May 2018 09:36:52 -0000

This was undocumented, and it's better to just always enable
full debug output, as this allows immediate generation of logs
with full diagnostics when things go not as expected.

Also, change the output of dnf from note to debug level; this
does not affect what is written to log file, but does reduce the
verbosity of bitbake -v.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 1cba5ee9688..5ac729455e9 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -888,7 +888,7 @@ class RpmPM(PackageManager):
         os.environ['RPM_ETCCONFIGDIR'] = self.target_rootfs
 
         dnf_cmd = bb.utils.which(os.getenv('PATH'), "dnf")
-        standard_dnf_args = (["-v", "--rpmverbosity=debug"] if self.d.getVar('ROOTFS_RPM_DEBUG') else []) + ["-y",
+        standard_dnf_args = ["-v", "--rpmverbosity=debug", "-y",
                              "-c", oe.path.join(self.target_rootfs, "etc/dnf/dnf.conf"),
                              "--setopt=reposdir=%s" %(oe.path.join(self.target_rootfs, "etc/yum.repos.d")),
                              "--repofrompath=oe-repo,%s" % (self.rpm_repo_dir),
@@ -900,7 +900,7 @@ class RpmPM(PackageManager):
         try:
             output = subprocess.check_output(cmd,stderr=subprocess.STDOUT).decode("utf-8")
             if print_output:
-                bb.note(output)
+                bb.debug(1, output)
             return output
         except subprocess.CalledProcessError as e:
             if print_output:
-- 
2.17.0



Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D10256003C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 10:05:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 May 2018 03:05:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,451,1520924400"; d="scan'208";a="232488503"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 28 May 2018 03:05:28 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 May 2018 13:05:31 +0300
Message-Id: <20180528100537.3827-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH 1/7] package_manager.py: get rid of ROOTFS_RPM_DEBUG in RpmPM()
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
X-List-Received-Date: Mon, 28 May 2018 10:05:29 -0000

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



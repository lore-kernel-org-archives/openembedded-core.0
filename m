Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DD1647772F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 21:35:48 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Sep 2017 14:35:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,476,1498546800"; d="scan'208";a="1169068312"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by orsmga001.jf.intel.com with ESMTP; 04 Sep 2017 14:35:49 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Sep 2017 14:35:47 -0700
Message-Id: <20170904213548.15582-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.3
Subject: [PATCH 1/2] package_deb, ipk: improve subprocess output on package manager command
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
X-List-Received-Date: Mon, 04 Sep 2017 21:35:49 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Redirecting stderr to stdout helps debugging issues, i.e instead of just
getting the return code, get also the error log from the pkg manger
This commit is in the way to figure out the root cause of [YOCTO #12012],
where dpkg-deb fails with a 2 return code and according to the man page,
there are multiple issues leading to the same code.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/classes/package_deb.bbclass | 4 +++-
 meta/classes/package_ipk.bbclass | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 83baa6c21b..30605344f4 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -286,7 +286,9 @@ def deb_write_pkg(pkg, d):
             conffiles.close()
 
         os.chdir(basedir)
-        subprocess.check_output("PATH=\"%s\" dpkg-deb -b %s %s" % (localdata.getVar("PATH"), root, pkgoutdir), shell=True)
+        subprocess.check_output("PATH=\"%s\" dpkg-deb -b %s %s" % (localdata.getVar("PATH"), root, pkgoutdir),
+                                stderr=subprocess.STDOUT,
+                                shell=True)
 
     finally:
         cleanupcontrol(root)
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index d58b824d3a..ec90996184 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -244,7 +244,9 @@ def ipk_write_pkg(pkg, d):
 
         os.chdir(basedir)
         subprocess.check_output("PATH=\"%s\" %s %s %s" % (localdata.getVar("PATH"),
-                                                          d.getVar("OPKGBUILDCMD"), pkg, pkgoutdir), shell=True)
+                                                          d.getVar("OPKGBUILDCMD"), pkg, pkgoutdir),
+                                stderr=subprocess.STDOUT,
+                                shell=True)
 
         if d.getVar('IPK_SIGN_PACKAGES') == '1':
             ipkver = "%s-%s" % (d.getVar('PKGV'), d.getVar('PKGR'))
-- 
2.12.3



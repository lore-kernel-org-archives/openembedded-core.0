Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0B0536AC33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 00:10:22 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 23 Mar 2015 17:10:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,455,1422950400"; d="scan'208";a="684533861"
Received: from yctb03.ostc.intel.com (HELO yctb03.otcr.jf.intel.com)
	([10.23.219.52])
	by fmsmga001.fm.intel.com with ESMTP; 23 Mar 2015 17:10:22 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Mar 2015 16:05:07 +0000
Message-Id: <1427126707-38854-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
MIME-Version: 1.0
Subject: [PATCH] package_deb: Fix rootfs generation in non Debian-based hosts
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
X-List-Received-Date: Tue, 24 Mar 2015 00:10:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since we have support of log checking in deb/ipk [1] rootfs generation
in non Debian-based hosts fails because apt-ftparchive generates a
warn when not find /etc/apt/apt.conf.d/ (available in Debian-based
hosts).

In order to fix,

	package_manager.py: DpkgPMIndexer add support for export APT_CONF
	to environment.

[1] http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=86aec93902af2e2d7d73ca9a643707fcca45055c

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index c9a8084..395c0d01 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -169,7 +169,14 @@ class OpkgIndexer(Indexer):
 
 
 class DpkgIndexer(Indexer):
+    def __init__(self, d, deploy_dir, apt_conf_file=None):
+        self.apt_conf_file = apt_conf_file
+        Indexer.__init__(self, d, deploy_dir)
+
     def write_index(self):
+        if not self.apt_conf_file is None:
+            os.environ['APT_CONFIG'] = self.apt_conf_file
+
         pkg_archs = self.d.getVar('PACKAGE_ARCHS', True)
         if pkg_archs is not None:
             arch_list = pkg_archs.split()
@@ -1507,7 +1514,7 @@ class DpkgPM(PackageManager):
 
         self._create_configs(archs, base_archs)
 
-        self.indexer = DpkgIndexer(self.d, self.deploy_dir)
+        self.indexer = DpkgIndexer(self.d, self.deploy_dir, self.apt_conf_file)
 
     """
     This function will change a package's status in /var/lib/dpkg/status file.
-- 
1.8.4.5



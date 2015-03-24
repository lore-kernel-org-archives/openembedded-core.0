Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 61FE460034
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 17:55:24 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 24 Mar 2015 10:55:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,459,1422950400"; d="scan'208";a="545655139"
Received: from yctb03.ostc.intel.com (HELO yctb03.otcr.jf.intel.com)
	([10.23.219.52])
	by orsmga003.jf.intel.com with ESMTP; 24 Mar 2015 10:55:23 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Mar 2015 09:50:08 +0000
Message-Id: <1427190608-15189-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
MIME-Version: 1.0
Subject: [PATCH] package_deb: DpkgIndexer use apt-ftparchive that needs a valid config
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
X-List-Received-Date: Tue, 24 Mar 2015 17:55:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Oberritter <obi@opendreambox.org>

Since we have support of log checking in deb/ipk [1] rootfs generation
in non Debian-based hosts fails because apt-ftparchive generates a
Warning when not find /etc/apt/apt.conf.d/ (available in Debian-based
hosts).

package_manager.py: DpkgPMIndexer add support for generate and export apt
configuration.

[1] http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=86aec93902af2e2d7d73ca9a643707fcca45055c

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oe/package_manager.py | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index c9a8084..743c7cb 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -169,7 +169,35 @@ class OpkgIndexer(Indexer):
 
 
 class DpkgIndexer(Indexer):
+    def _create_configs(self):
+        bb.utils.mkdirhier(self.apt_conf_dir)
+        bb.utils.mkdirhier(os.path.join(self.apt_conf_dir, "lists", "partial"))
+        bb.utils.mkdirhier(os.path.join(self.apt_conf_dir, "apt.conf.d"))
+        bb.utils.mkdirhier(os.path.join(self.apt_conf_dir, "preferences.d"))
+
+        with open(os.path.join(self.apt_conf_dir, "preferences"),
+                "w") as prefs_file:
+            pass
+        with open(os.path.join(self.apt_conf_dir, "sources.list"),
+                "w+") as sources_file:
+            pass
+
+        with open(self.apt_conf_file, "w") as apt_conf:
+            with open(os.path.join(self.d.expand("${STAGING_ETCDIR_NATIVE}"),
+                "apt", "apt.conf.sample")) as apt_conf_sample:
+                for line in apt_conf_sample.read().split("\n"):
+                    line = re.sub("#ROOTFS#", "/dev/null", line)
+                    line = re.sub("#APTCONF#", self.apt_conf_dir, line)
+                    apt_conf.write(line + "\n")
+
     def write_index(self):
+        self.apt_conf_dir = os.path.join(self.d.expand("${APTCONF_TARGET}"),
+                "apt-ftparchive")
+        self.apt_conf_file = os.path.join(self.apt_conf_dir, "apt.conf")
+        self._create_configs()
+
+        os.environ['APT_CONFIG'] = self.apt_conf_file
+
         pkg_archs = self.d.getVar('PACKAGE_ARCHS', True)
         if pkg_archs is not None:
             arch_list = pkg_archs.split()
-- 
1.8.4.5



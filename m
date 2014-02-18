Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C2B6B6F13F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 09:42:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1I9giAW013230
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Feb 2014 01:42:44 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 18 Feb 2014 01:42:44 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Feb 2014 17:42:25 +0800
Message-ID: <1e5d48e5fd1de1a728a69398182242c1b05ec229.1392716065.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1392716065.git.hongxu.jia@windriver.com>
References: <cover.1392716065.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 2/5] package_manager.py: tweak handle_bad_recommendations for ipk incremental image generation
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
X-List-Received-Date: Tue, 18 Feb 2014 09:42:44 -0000
Content-Type: text/plain

Let opkg_dir be configurable in handle_bad_recommendations,
so it could work on other root fs.

Invoke handle_bad_recommendations in dump_install_solution
which simulates package install on other root fs.

[YOCTO #1894]
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/package_manager.py | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 4ea9677..3cfd4af 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -1157,12 +1157,19 @@ class OpkgPM(PackageManager):
 
         return output
 
-    def handle_bad_recommendations(self):
-        bad_recommendations = self.d.getVar("BAD_RECOMMENDATIONS", True)
-        if bad_recommendations is None:
+    def handle_bad_recommendations(self, opkg_dir=""):
+        bad_recommendations = self.d.getVar("BAD_RECOMMENDATIONS", True) or ""
+        if bad_recommendations.strip() == "":
             return
 
-        status_file = os.path.join(self.opkg_dir, "status")
+        if opkg_dir == "":
+            opkg_dir = self.opkg_dir
+        status_file = os.path.join(opkg_dir, "status")
+
+        # If status file existed, it means the bad recommendations has already
+        # been handled
+        if os.path.exists(status_file):
+            return
 
         cmd = "%s %s info " % (self.opkg_cmd, self.opkg_args)
 
@@ -1177,7 +1184,7 @@ class OpkgPM(PackageManager):
                              "returned %d:\n%s" % (pkg_info, e.returncode, e.output))
 
                 if output == "":
-                    bb.note("Requested ignored recommendation $i is "
+                    bb.note("Requested ignored recommendation %s is "
                             "not a package" % pkg)
                     continue
 
@@ -1204,6 +1211,7 @@ class OpkgPM(PackageManager):
         temp_rootfs = self.d.expand('${T}/opkg')
         temp_opkg_dir = os.path.join(temp_rootfs, 'var/lib/opkg')
         bb.utils.mkdirhier(temp_opkg_dir)
+        self.handle_bad_recommendations(temp_opkg_dir)
 
         opkg_args = "-f %s -o %s " % (self.config_file, temp_rootfs)
         opkg_args += self.d.getVar("OPKG_ARGS", True)
-- 
1.8.1.2



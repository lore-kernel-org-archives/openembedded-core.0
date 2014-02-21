Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A8A1E6E74B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 06:38:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1L6cfkM011185
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 20 Feb 2014 22:38:41 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Thu, 20 Feb 2014 22:38:40 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Feb 2014 14:38:20 +0800
Message-ID: <d96d70a0429e2678f0d2b9dae8c395e81f505b32.1392963956.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1392963956.git.hongxu.jia@windriver.com>
References: <cover.1392963956.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 4/5] rootfs.py: support BAD_RECOMMENDATIONS for ipk incremental image generation
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
X-List-Received-Date: Fri, 21 Feb 2014 06:38:40 -0000
Content-Type: text/plain

While incremental image generation enabled and the previous image is
existed, if BAD_RECOMMENDATIONS is changed, the operation on the
existing image is complicated, so remove the old image in this situation.

The same with PACKAGE_EXCLUDE and NO_RECOMMENDATIONS.

[YOCTO #1894]
Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/rootfs.py | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index e0f6cd8..78e9627 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -443,7 +443,7 @@ class OpkgRootfs(Rootfs):
         self.pkg_archs = self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS", True)
 
         self.inc_opkg_image_gen = self.d.getVar('INC_IPK_IMAGE_GEN', True) or ""
-        if self.inc_opkg_image_gen != "1":
+        if self._remove_old_rootfs():
             bb.utils.remove(self.image_rootfs, True)
             self.pm = OpkgPM(d,
                              self.image_rootfs,
@@ -546,6 +546,33 @@ class OpkgRootfs(Rootfs):
                 bb.note('decremental removed: %s' % ' '.join(pkg_to_remove))
                 self.pm.remove(pkg_to_remove)
 
+    '''
+    Compare with previous existing image creation, if some conditions
+    triggered, the previous old image should be removed.
+    The conditions include any of 'PACKAGE_EXCLUDE, NO_RECOMMENDATIONS
+    and BAD_RECOMMENDATIONS' has been changed.
+    '''
+    def _remove_old_rootfs(self):
+        if self.inc_opkg_image_gen != "1":
+            return True
+
+        vars_list_file = self.d.expand('${T}/vars_list')
+
+        old_vars_list = ""
+        if os.path.exists(vars_list_file):
+            old_vars_list = open(vars_list_file, 'r+').read()
+
+        new_vars_list = '%s:%s:%s\n' % \
+                ((self.d.getVar('BAD_RECOMMENDATIONS', True) or '').strip(),
+                 (self.d.getVar('NO_RECOMMENDATIONS', True) or '').strip(),
+                 (self.d.getVar('PACKAGE_EXCLUDE', True) or '').strip())
+        open(vars_list_file, 'w+').write(new_vars_list)
+
+        if old_vars_list != new_vars_list:
+            return True
+
+        return False
+
     def _create(self):
         pkgs_to_install = self.manifest.parse_initial_manifest()
         opkg_pre_process_cmds = self.d.getVar('OPKG_PREPROCESS_COMMANDS', True)
-- 
1.8.1.2



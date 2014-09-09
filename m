Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CED7660167
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 10:16:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s89AG9hx010187
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Sep 2014 03:16:09 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 9 Sep 2014 03:16:08 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Sep 2014 03:16:08 -0700
Message-ID: <4e8cdaffb79ea56a3644ede8af0cacbefd167197.1410257258.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1410257258.git.liezhi.yang@windriver.com>
References: <cover.1410257258.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] rootfs.py: fix PRE/POSTPROCESS_COMMANDS for rpm and deb
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
X-List-Received-Date: Tue, 09 Sep 2014 10:16:10 -0000
Content-Type: text/plain

The rpm didn't run RPM_PREPROCESS_COMMANDS or RPM_POSTPROCESS_COMMANDS,
the similar to deb, this patch fix the problem.

And fix a typo:
DEB_POSTPROCESS_COMMAND -> DEB_POSTPROCESS_COMMANDS

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oe/rootfs.py |   14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 0424a01..ed2af80 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -295,10 +295,14 @@ class RpmRootfs(Rootfs):
 
     def _create(self):
         pkgs_to_install = self.manifest.parse_initial_manifest()
+        rpm_pre_process_cmds = self.d.getVar('RPM_PREPROCESS_COMMANDS', True)
+        rpm_post_process_cmds = self.d.getVar('RPM_POSTPROCESS_COMMANDS', True)
 
         # update PM index files
         self.pm.write_index()
 
+        execute_pre_post_process(self.d, rpm_pre_process_cmds)
+
         self.pm.dump_all_available_pkgs()
 
         if self.inc_rpm_image_gen == "1":
@@ -320,6 +324,8 @@ class RpmRootfs(Rootfs):
 
         self.pm.install_complementary()
 
+        execute_pre_post_process(self.d, rpm_post_process_cmds)
+
         self._log_check()
 
         if self.inc_rpm_image_gen == "1":
@@ -401,6 +407,8 @@ class DpkgRootfs(Rootfs):
 
     def _create(self):
         pkgs_to_install = self.manifest.parse_initial_manifest()
+        deb_pre_process_cmds = self.d.getVar('DEB_PREPROCESS_COMMANDS', True)
+        deb_post_process_cmds = self.d.getVar('DEB_POSTPROCESS_COMMANDS', True)
 
         alt_dir = self.d.expand("${IMAGE_ROOTFS}/var/lib/dpkg/alternatives")
         bb.utils.mkdirhier(alt_dir)
@@ -408,6 +416,8 @@ class DpkgRootfs(Rootfs):
         # update PM index files
         self.pm.write_index()
 
+        execute_pre_post_process(self.d, deb_pre_process_cmds)
+
         self.pm.update()
 
         for pkg_type in self.install_order:
@@ -423,9 +433,11 @@ class DpkgRootfs(Rootfs):
 
         self.pm.run_pre_post_installs()
 
+        execute_pre_post_process(self.d, deb_post_process_cmds)
+
     @staticmethod
     def _depends_list():
-        return ['DEPLOY_DIR_DEB', 'DEB_SDK_ARCH', 'APTCONF_TARGET', 'APT_ARGS', 'DPKG_ARCH', 'DEB_PREPROCESS_COMMANDS', 'DEB_POSTPROCESS_COMMAND']
+        return ['DEPLOY_DIR_DEB', 'DEB_SDK_ARCH', 'APTCONF_TARGET', 'APT_ARGS', 'DPKG_ARCH', 'DEB_PREPROCESS_COMMANDS', 'DEB_POSTPROCESS_COMMANDS']
 
     def _get_delayed_postinsts(self):
         pkg_list = []
-- 
1.7.9.5



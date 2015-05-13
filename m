Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C841474030
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 06:50:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4D6o8Dd005565
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 23:50:08 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.153) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 12 May 2015 23:50:08 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 May 2015 14:50:08 +0800
Message-ID: <09a67ecf6dc27478bd7631300eed246fc69b3777.1431499753.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1431499753.git.Qi.Chen@windriver.com>
References: <cover.1431499753.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] populate_sdk_ext: set noexec flag for some tasks
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
X-List-Received-Date: Wed, 13 May 2015 06:50:07 -0000
Content-Type: text/plain

For the SDK, what we are interested in is the sysroot part. So the
only useful task is do_populate_sysroot. Other tasks like do_package
don't need to run. So mark them as 'noexec' for SDK.

This would result in two benefits:
1) The size of extensible SDK is larged reduced. For example, extensible
   SDK for core-image-minimal is reduced from 1.8G to 793M.
2) The installation time is reduced as a lot of tasks are not run.

[YOCTO #7590]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/populate_sdk_ext.bbclass | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index dc2c58e..573d338 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -141,8 +141,22 @@ python copy_buildsystem () {
     sigfile = d.getVar('WORKDIR', True) + '/locked-sigs.inc'
     oe.copy_buildsystem.generate_locked_sigs(sigfile, d)
 
+    # Mark tasks to be 'noexec' for the SDK as we only need the sysroot part
+    base_class_path = os.path.join(baseoutpath, core_meta_subdir, 'classes', 'base.bbclass')
+    if os.path.exists(base_class_path):
+        with open(base_class_path, 'a') as f:
+            f.write('do_package[noexec] = "1"\n')
+            f.write('do_packagedata[noexec] = "1"\n')
+            f.write('do_package_qa[noexec] = "1"\n')
+            f.write('do_package_write_rpm[noexec] = "1"\n')
+            f.write('do_package_write_ipk[noexec] = "1"\n')
+            f.write('do_package_write_deb[noexec] = "1"\n')
+            f.write('do_deploy[noexec] = "1"\n')
+            f.write('do_populate_lic[noexec] = "1"\n')
+            f.write('do_rootfs[noexec] = "1"\n')
+
     # Filter the locked signatures file to just the sstate tasks we are interested in
-    allowed_tasks = ['do_populate_lic', 'do_populate_sysroot', 'do_packagedata', 'do_package_write_ipk', 'do_package_write_rpm', 'do_package_write_deb', 'do_package_qa', 'do_deploy']
+    allowed_tasks = ['do_populate_sysroot']
     excluded_targets = d.getVar('SDK_TARGETS', True)
     lockedsigs_pruned = baseoutpath + '/conf/locked-sigs.inc'
     oe.copy_buildsystem.prune_lockedsigs(allowed_tasks,
-- 
1.9.1



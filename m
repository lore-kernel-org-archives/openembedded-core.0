Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9998278246
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 13:50:26 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 May 2017 06:50:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,397,1491289200"; d="scan'208";a="1174694232"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 26 May 2017 06:50:25 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id DCC325803BC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 06:50:24 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 May 2017 16:49:55 +0300
Message-Id: <1e2b78ac0de5a09c37c67bcdc1335d351f5713db.1495806200.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1495806200.git.ed.bartosh@linux.intel.com>
References: <cover.1495806200.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 1/1] image_types_wic: schedule prepare_wic_build correctly
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
X-List-Received-Date: Fri, 26 May 2017 13:50:26 -0000

When EFI is enabled we need to ensure that kernel and bootloader
artifacts are fully deployed before running prepare_wic_build.
This is done by scheduling this task after do_bootimg and
by adding dependencty to virtual/kernel:do_deploy task.

Scheduled prepare_wic_build only if wic build is enabled to
avoid running it when it's not needed.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image_types_wic.bbclass | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index d8430e4..baf375b 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -69,6 +69,12 @@ python () {
                 # file in process_wks_template as well, so just put it in
                 # a variable and let the metadata deal with the deps.
                 d.setVar('_WKS_TEMPLATE', body)
+
+        if d.getVar('EFI_CLASS'):
+            bb.build.addtask('do_prepare_wic_build', 'do_image_wic', 'do_bootimg', d)
+            d.appendVarFlag('do_prepare_wic_build', 'depends', 'virtual/kernel:do_deploy')
+        else:
+            bb.build.addtask('do_prepare_wic_build', 'do_image_wic', None, d)
 }
 
 #
@@ -139,19 +145,15 @@ python do_prepare_wic_build() {
         with open(wks_file, 'w') as f:
             f.write(template_body)
 
-    if d.getVar('USING_WIC'):
-        # Generate parition UUID
-        from uuid import uuid4
-        partuuid = str(uuid4())
-        d.setVar("ROOTFS_PARTUUID", partuuid)
+    # Generate parition UUID
+    from uuid import uuid4
+    partuuid = str(uuid4())
+    d.setVar("ROOTFS_PARTUUID", partuuid)
 
-        if d.getVar("EFI_CLASS"):
-            populate_bootfs(partuuid)
+    if d.getVar("EFI_CLASS"):
+        populate_bootfs(partuuid)
 
-        template = d.getVar("_WKS_TEMPLATE")
-        if template:
-            write_wks_template(template, d.getVar('WKS_FULL_PATH'))
+    template = d.getVar("_WKS_TEMPLATE")
+    if template:
+        write_wks_template(template, d.getVar('WKS_FULL_PATH'))
 }
-
-addtask do_prepare_wic_build before do_image_wic
-do_prepare_wic_build[depends] = "${MLPREFIX}${EFI_PROVIDER}:do_deploy virtual/kernel:do_deploy"
-- 
2.1.4



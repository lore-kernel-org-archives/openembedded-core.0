Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7E65F77DB8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 13:48:34 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 May 2017 06:48:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,354,1491289200"; d="scan'208";a="88380486"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 17 May 2017 06:48:36 -0700
Received: from vmed.fi.intel.com (crosswalk-testmaster.fi.intel.com
	[10.237.72.36])
	by linux.intel.com (Postfix) with ESMTP id 9472F6A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 06:48:20 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 May 2017 13:47:50 +0000
Message-Id: <b852248822868b543e6bec8c4dbea6d43eb55f1b.1495028624.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1495028624.git.ed.bartosh@linux.intel.com>
References: <cover.1495028624.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v4 7/7] image_types_wic: schedule prepare_wic_build correctly
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
X-List-Received-Date: Wed, 17 May 2017 13:48:34 -0000

Scheduled prepare_wic_build only if wic build enabled.
Added dependencies to kernel and efi bootloader deploy
tasks only if EFI is enabled.

This should fix build failure on machines without
EFI functionality.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image_types_wic.bbclass | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index d8430e49ac..3b73261d5e 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -69,6 +69,11 @@ python () {
                 # file in process_wks_template as well, so just put it in
                 # a variable and let the metadata deal with the deps.
                 d.setVar('_WKS_TEMPLATE', body)
+
+        bb.build.addtask('do_prepare_wic_build', 'do_image_wic', None, d)
+        if d.getVar('EFI_CLASS'):
+            d.appendVarFlag('do_prepare_wic_build', 'depends',
+                            '%s%s:do_deploy virtual/kernel:do_deploy' % (d.getVar('MLPREFIX'), d.getVar('EFI_CLASS')))
 }
 
 #
@@ -139,19 +144,15 @@ python do_prepare_wic_build() {
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
2.12.0



Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id A3BCD780F8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 12:45:19 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 25 May 2017 05:45:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,391,1491289200"; d="scan'208";a="91670806"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 25 May 2017 05:45:20 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 4E3B1580363;
	Thu, 25 May 2017 05:45:19 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 May 2017 15:44:55 +0300
Message-Id: <1495716295-14065-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1495492710.16848.2.camel@intel.com>
References: <1495492710.16848.2.camel@intel.com>
Cc: saul.wold@intel.com
Subject: [PATCH] timage_types_wic: reschedule do_prepare_wic_build
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
X-List-Received-Date: Thu, 25 May 2017 12:45:20 -0000

do_prepare_wic_build depended on do_deploy task of EFI_PROVIDER recipe.
This approach didn't work on meta-intel as there is no EFI_PROVIDER
recipe in that layer.

Scheduled do_prepare_wic_build after do_bootimg to fix the issue.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image_types_wic.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 3b73261..baf375b 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -70,10 +70,11 @@ python () {
                 # a variable and let the metadata deal with the deps.
                 d.setVar('_WKS_TEMPLATE', body)
 
-        bb.build.addtask('do_prepare_wic_build', 'do_image_wic', None, d)
         if d.getVar('EFI_CLASS'):
-            d.appendVarFlag('do_prepare_wic_build', 'depends',
-                            '%s%s:do_deploy virtual/kernel:do_deploy' % (d.getVar('MLPREFIX'), d.getVar('EFI_CLASS')))
+            bb.build.addtask('do_prepare_wic_build', 'do_image_wic', 'do_bootimg', d)
+            d.appendVarFlag('do_prepare_wic_build', 'depends', 'virtual/kernel:do_deploy')
+        else:
+            bb.build.addtask('do_prepare_wic_build', 'do_image_wic', None, d)
 }
 
 #
-- 
2.1.4



Return-Path: <amarnath.valluri@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id CDCE777499
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 13:12:34 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 06 Sep 2016 06:12:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,291,1470726000"; 
   d="scan'208";a="5105735"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 06 Sep 2016 06:12:34 -0700
Received: from avalluri-GigaByte.fi.intel.com (avalluri-gigabyte.fi.intel.com
	[10.237.72.170]) (using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id B37456A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 06:12:12 -0700 (PDT)
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Sep 2016 16:13:06 +0300
Message-Id: <1473167586-11640-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH] classes/populate_sdk_ext: exclude image tasks from locked signatures
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
X-List-Received-Date: Tue, 06 Sep 2016 13:12:35 -0000

Tasks for image recipes cannot be locked and should be excluded from eSDK
generated locked-sigs.inc. get_sdk_install_targets() was not returning right
image targets to be excluded incase of 'minimal' sdk. This change fixes the issue.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index d8d123a..1a15d2a 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -43,7 +43,7 @@ SDK_TARGETS ?= "${PN}"
 
 def get_sdk_install_targets(d, images_only=False):
     sdk_install_targets = ''
-    if d.getVar('SDK_EXT_TYPE', True) != 'minimal':
+    if images_only or d.getVar('SDK_EXT_TYPE', True) != 'minimal':
         sdk_install_targets = d.getVar('SDK_TARGETS', True)
 
         depd = d.getVar('BB_TASKDEPDATA', False)
-- 
2.5.0

---------------------------------------------------------------------
Intel Finland Oy
Registered Address: PL 281, 00181 Helsinki 
Business Identity Code: 0357606 - 4 
Domiciled in Helsinki 

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.



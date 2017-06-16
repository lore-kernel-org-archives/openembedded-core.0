Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 74D7478429
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:03:37 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jun 2017 05:03:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,347,1493708400"; d="scan'208";a="115237241"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 16 Jun 2017 05:03:37 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 0878958027E;
	Fri, 16 Jun 2017 05:03:36 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 15:02:07 +0300
Message-Id: <1497614527-25454-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] image.bbclass: use prependVarFlag for postfuncs
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
X-List-Received-Date: Fri, 16 Jun 2017 12:03:37 -0000

It would be possible to achieve any order of calling functions if
prefuncs are added with appendVarFlag and postfuncs with prependVarFlag.
Then image_X.bbclass can add code with either pre/post-funcs or
do_image_x_append or _prepend.

The execution order would be:

image_X prefuncs
image prefuncs
do_image_X_prepend from image_X.bbclass
do_image_X from image.bbclass
do_image_X_append from image_X.bbclass
image postfuncs
image_X postfuncs

[YOCTO #11372]

Thanks to Ola Nillsson for the idea.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 9a04b43..be8c9dd 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -498,7 +498,7 @@ python () {
         d.setVarFlag(task, 'fakeroot', '1')
 
         d.appendVarFlag(task, 'prefuncs', ' ' + debug + ' set_image_size')
-        d.appendVarFlag(task, 'postfuncs', ' create_symlinks')
+        d.prependVarFlag(task, 'postfuncs', ' create_symlinks')
         d.appendVarFlag(task, 'subimages', ' ' + ' '.join(subimages))
         d.appendVarFlag(task, 'vardeps', ' ' + ' '.join(vardeps))
         d.appendVarFlag(task, 'vardepsexclude', 'DATETIME')
-- 
2.1.4



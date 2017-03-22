Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7A99377B62
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 13:44:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP; 22 Mar 2017 06:44:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,205,1486454400"; d="scan'208";a="1111070039"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 22 Mar 2017 06:44:05 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 722A42C8001
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 06:43:59 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Mar 2017 15:42:29 +0200
Message-Id: <c751a81b774460973992b7bfac677ca23d3029b6.1490188583.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1490188583.git.ed.bartosh@linux.intel.com>
References: <cover.1490188583.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 05/10] wic: use STAGING_DATADIR as a default for bootimg_dir
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
X-List-Received-Date: Wed, 22 Mar 2017 13:44:04 -0000

Default value for bootimg_dir was not set in main wic script
unlike the rest of artifacts: kernel_dir, roofts_dir and
native_sysroot. Set it to the value of STAGING_DATADIR for
consistency and to avoid confusion of wic plugin developers.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/wic | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/wic b/scripts/wic
index 99721dc..8e9c05c 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -171,8 +171,6 @@ def wic_create_subcommand(args, usage_str):
     if options.build_check and not engine.verify_build_env():
         raise WicError("Couldn't verify build environment, exiting")
 
-    bootimg_dir = ""
-
     if options.debug:
         logger.setLevel(logging.DEBUG)
 
@@ -189,6 +187,7 @@ def wic_create_subcommand(args, usage_str):
 
         rootfs_dir = get_bitbake_var("IMAGE_ROOTFS", options.image_name)
         kernel_dir = get_bitbake_var("DEPLOY_DIR_IMAGE", options.image_name)
+        bootimg_dir = get_bitbake_var("STAGING_DATADIR", options.image_name)
         native_sysroot = get_bitbake_var("RECIPE_SYSROOT_NATIVE",
                                          options.image_name) #, cache=False)
     else:
-- 
2.1.4



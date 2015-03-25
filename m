Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7CCB460034
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 00:16:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 24 Mar 2015 17:16:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,461,1422950400"; d="scan'208";a="670103928"
Received: from bitbang.jf.intel.com ([10.7.201.37])
	by orsmga001.jf.intel.com with ESMTP; 24 Mar 2015 17:16:28 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Mar 2015 17:16:26 -0700
Message-Id: <1427242586-23928-1-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] populate_sdk_ext: Log the "Preparing build system" step
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
X-List-Received-Date: Wed, 25 Mar 2015 00:16:31 -0000

When using bitbake to do the setscene as part of sdk setup, it would be
useful to have a log in the case where it fails.

The log is called preparing_build_system.log and is in the top level
directory of the extracted sdk.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index ec1cff0..22e0ffc 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -182,7 +182,7 @@ sdk_ext_postinst() {
 	# dash which is /bin/sh on Ubuntu will not preserve the
 	# current working directory when first ran, nor will it set $1 when
 	# sourcing a script. That is why this has to look so ugly.
-	sh -c ". buildtools/environment-setup* > /dev/null && cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir > /dev/null && bitbake ${SDK_TARGETS} > /dev/null" || { echo "SDK preparation failed" ; exit 1 ; }
+	sh -c ". buildtools/environment-setup* > preparing_build_system.log && cd $target_sdk_dir/`dirname ${oe_init_build_env_path}` && set $target_sdk_dir && . $target_sdk_dir/${oe_init_build_env_path} $target_sdk_dir >> preparing_build_system.log && bitbake ${SDK_TARGETS} >> preparing_build_system.log" || { echo "SDK preparation failed: see `pwd`/preparing_build_system.log" ; exit 1 ; }
 	echo done
 }
 
-- 
1.9.3



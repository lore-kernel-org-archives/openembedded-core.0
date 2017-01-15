Return-Path: <juro.bystricky@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 4EADE6E64A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jan 2017 18:45:43 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 15 Jan 2017 10:45:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,234,1477983600"; d="scan'208";a="53316555"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga005.jf.intel.com with ESMTP; 15 Jan 2017 10:45:44 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Jan 2017 10:41:51 -0800
Message-Id: <1484505711-6341-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH] bitbake.conf: require conf/multiconfig/${BB_CURRENT_MC}.conf
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
X-List-Received-Date: Sun, 15 Jan 2017 18:45:44 -0000

Presently there is no check to verify the existence of configuration
files as listed in BBMULTICONFIG.
For example, BBMULTICONFIG = "foobar" in local.conf does not trigger
an error or even a warning when there is no conf/multiconfig/foobar.conf.
The missing file is silently ignored.

This patch changes the inclusion of all multiconfig configuration files as
a non-optional requirement. If the file is missing, we get an error such as:

ERROR: ParseError at /data/master-multi/poky/meta/conf/bitbake.conf:704: Could not include required file conf/multiconfig/foobar.conf

Although the "default" configuration is not listed in BBMULTICONFIG,
this change also requires the file multiconfig/default.conf to exist.
The "default" (non-multiconfig) configuration is normally configured via local.conf,
so although this file is required, it can/should be empty. This patch creates
an empty file default.conf in meta/conf/multiconfig.

[YOCTO#10917]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/conf/bitbake.conf             | 2 +-
 meta/conf/multiconfig/default.conf | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 create mode 100644 meta/conf/multiconfig/default.conf

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 40efb95..c8516a8 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -701,7 +701,7 @@ require conf/abi_version.conf
 include conf/site.conf
 include conf/auto.conf
 include conf/local.conf
-include conf/multiconfig/${BB_CURRENT_MC}.conf
+require conf/multiconfig/${BB_CURRENT_MC}.conf
 include conf/build/${BUILD_SYS}.conf
 include conf/target/${TARGET_SYS}.conf
 include conf/machine/${MACHINE}.conf
diff --git a/meta/conf/multiconfig/default.conf b/meta/conf/multiconfig/default.conf
new file mode 100644
index 0000000..e69de29
-- 
2.7.4



Return-Path: <juro.bystricky@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2A92C6E65F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 19:45:55 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 30 Mar 2016 12:45:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,417,1455004800"; d="scan'208";a="774903655"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga003.jf.intel.com with ESMTP; 30 Mar 2016 12:45:55 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Mar 2016 12:31:54 -0700
Message-Id: <1459366314-23967-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1459366314-23967-1-git-send-email-juro.bystricky@intel.com>
References: <1459366314-23967-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [jethro][PATCH 1/1] python3: fix building nativesdk-python3
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
X-List-Received-Date: Wed, 30 Mar 2016 19:45:55 -0000

When the class nativesdk.bbclass is inherited, it redefines TARGET_CC_ARCH,
in the case of python3, this enables debug, causing an error while linking.
Since we don't enable debug during configure some functions are not declared.
This patch makes sure we keep debug disabled, fixing the linking errors.

[YOCTO #9357]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/recipes-devtools/python/python3_3.4.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.4.3.bb b/meta/recipes-devtools/python/python3_3.4.3.bb
index f61d278..4f4e79c 100644
--- a/meta/recipes-devtools/python/python3_3.4.3.bb
+++ b/meta/recipes-devtools/python/python3_3.4.3.bb
@@ -61,6 +61,7 @@ CACHED_CONFIGUREVARS = "ac_cv_have_chflags=no \
 TARGET_CC_ARCH_append_armv6 = " -D__SOFTFP__"
 TARGET_CC_ARCH_append_armv7a = " -D__SOFTFP__"
 TARGET_CC_ARCH += "-DNDEBUG -fno-inline"
+SDK_CC_ARCH += "-DNDEBUG -fno-inline"
 EXTRA_OEMAKE += "CROSS_COMPILE=yes"
 EXTRA_OECONF += "CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ --without-ensurepip"
 
-- 
1.9.1



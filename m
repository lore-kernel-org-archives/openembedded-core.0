Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9F90C6011C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 16:55:31 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 24 Nov 2015 08:55:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,338,1444719600"; d="scan'208";a="693504243"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by orsmga003.jf.intel.com with ESMTP; 24 Nov 2015 08:55:31 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Nov 2015 16:50:45 +0000
Message-Id: <d65f0a500e7fd46d67038b4ad2c3c01a795de3f7.1448383756.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1448383756.git.alejandro.hernandez@linux.intel.com>
References: <cover.1448383756.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/1] python3: fix building nativesdk-python3
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
X-List-Received-Date: Tue, 24 Nov 2015 16:55:32 -0000

When the class nativesdk.bbclass is inherited, it redefines TARGET_CC_ARCH,
in the case of python3, this enables debug, causing an error while linking,
since we dont enable debug during configure theres no declaration of some
functions, this patch makes sure we keep debug disabled, fixing the linking errors.

[YOCTO #8467]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-devtools/python/python3_3.5.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3_3.5.0.bb b/meta/recipes-devtools/python/python3_3.5.0.bb
index 2b16cd2..42a87af 100644
--- a/meta/recipes-devtools/python/python3_3.5.0.bb
+++ b/meta/recipes-devtools/python/python3_3.5.0.bb
@@ -61,6 +61,7 @@ CACHED_CONFIGUREVARS = "ac_cv_have_chflags=no \
 TARGET_CC_ARCH_append_armv6 = " -D__SOFTFP__"
 TARGET_CC_ARCH_append_armv7a = " -D__SOFTFP__"
 TARGET_CC_ARCH += "-DNDEBUG -fno-inline"
+SDK_CC_ARCH += "-DNDEBUG -fno-inline"
 EXTRA_OEMAKE += "CROSS_COMPILE=yes"
 EXTRA_OECONF += "CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ --without-ensurepip"
 
-- 
1.8.4.5



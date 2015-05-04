Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7E46F73C7D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 May 2015 16:42:57 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 04 May 2015 09:42:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,366,1427785200"; d="scan'208";a="566012488"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by orsmga003.jf.intel.com with ESMTP; 04 May 2015 09:42:52 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 May 2015 09:43:01 +0000
Message-Id: <8e23f7b415fcb129bded92112cac97c74ead2460.1430732245.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <f0998ca770393ec8de5dbf0af7e46ee6500ed529.1430732245.git.alejandro.hernandez@linux.intel.com>
References: <f0998ca770393ec8de5dbf0af7e46ee6500ed529.1430732245.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1430732245.git.alejandro.hernandez@linux.intel.com>
References: <cover.1430732245.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 2/2] python3: Disable pip to fix issues on the Autobuilders
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
X-List-Received-Date: Mon, 04 May 2015 16:42:58 -0000

As Python-3.4 pip is required and installed by default, pips installation
is bootstrapped using python wheels, this makes it complicated to patch,
by default the installation uses an absolute path to /tmp, on most cases
this would not be a problem, but since on the Autobuilders several Python
installations (for different archs) may be happening at the same time,
this shared resource utilization results in errors at do_install(), this
patch disables pip installation by default for now, until we have a
python3-pip package which we can easily patch in these situations.

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-devtools/python/python3_3.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3_3.4.2.bb b/meta/recipes-devtools/python/python3_3.4.2.bb
index 8bd69ed..0350de6 100644
--- a/meta/recipes-devtools/python/python3_3.4.2.bb
+++ b/meta/recipes-devtools/python/python3_3.4.2.bb
@@ -62,7 +62,7 @@ TARGET_CC_ARCH_append_armv6 = " -D__SOFTFP__"
 TARGET_CC_ARCH_append_armv7a = " -D__SOFTFP__"
 TARGET_CC_ARCH += "-DNDEBUG -fno-inline"
 EXTRA_OEMAKE += "CROSS_COMPILE=yes"
-EXTRA_OECONF += "CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/"
+EXTRA_OECONF += "CROSSPYTHONPATH=${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/ --without-ensurepip"
 
 export CROSS_COMPILE = "${TARGET_PREFIX}"
 export _PYTHON_PROJECT_BASE = "${B}"
-- 
1.8.4.5



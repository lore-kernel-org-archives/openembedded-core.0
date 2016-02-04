Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 34935772AF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 20:31:58 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 04 Feb 2016 12:31:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,397,1449561600"; d="scan'208";a="740710356"
Received: from bitbang.jf.intel.com ([10.7.199.151])
	by orsmga003.jf.intel.com with ESMTP; 04 Feb 2016 12:31:58 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Feb 2016 12:31:42 -0800
Message-Id: <2e8da26665e4462698961f66d391055178175846.1454614198.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1454614198.git.randy.e.witt@linux.intel.com>
References: <cover.1454614198.git.randy.e.witt@linux.intel.com>
In-Reply-To: <cover.1454614198.git.randy.e.witt@linux.intel.com>
References: <cover.1454614198.git.randy.e.witt@linux.intel.com>
Subject: [PATCH 2/5] toolchain-scripts.bbclass: Use PYTHONPATH instead of PYTHONHOME
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
X-List-Received-Date: Thu, 04 Feb 2016 20:31:58 -0000

In the extensible sdk it was originally intended that the native sstate
would always be setscened as part of the sdk installation. However, the
soon to come "minimal" sdk won't do that.

A side effect of that is that pointing PYTHONHOME at the native sysroot
within the "bitbake workspace" won't work. For now only set PYTHONPATH
instead and continue using the python that comes from buildtools.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/classes/toolchain-scripts.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index ab4feb0..13e7390 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -31,7 +31,7 @@ toolchain_create_sdk_env_script () {
 	echo "export OECORE_NATIVE_SYSROOT=\"$sdkpathnative\"" >> $script
 	echo 'export OECORE_TARGET_SYSROOT="$SDKTARGETSYSROOT"' >> $script
 	echo "export OECORE_ACLOCAL_OPTS=\"-I $sdkpathnative/usr/share/aclocal\"" >> $script
-	echo "export PYTHONHOME=$sdkpathnative$prefix" >> $script
+	echo "export PYTHONPATH=$sdkpathnative$prefix" >> $script
 	echo 'unset command_not_found_handle' >> $script
 
 	toolchain_shared_env_script
-- 
2.5.0



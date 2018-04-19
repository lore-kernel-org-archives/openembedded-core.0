Return-Path: <juro.bystricky@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 84E81745EC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Apr 2018 18:03:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Apr 2018 11:03:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,297,1520924400"; d="scan'208";a="44580858"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga003.jf.intel.com with ESMTP; 19 Apr 2018 11:03:48 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Apr 2018 11:04:10 -0700
Message-Id: <1524161050-80986-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH] bitbake.conf: re-order DEBUG_PREFIX_MAP
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
X-List-Received-Date: Thu, 19 Apr 2018 18:03:47 -0000

When specifying several -fdebug-prefix-map command line options to
gcc, they are evaluated right to left (last one first).
Normally, the order is irrelevant. However, when we try to map both:

recipe-sysroot-native
recipe-sysroot

the order matters. With the original order most of our debug packages contain
incorrect debug symbols.
Take for example /usr/bin/.debug/setfacl from acl-dbg:

$ strings setfacl | grep native
...
-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/7.3.0/include
-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/7.3.0/include
-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/7.3.0/include
-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/7.3.0/include
-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/7.3.0/include
-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/7.3.0/include
-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/7.3.0/include
-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/7.3.0/include

Reordering the fdebug-prefix-map arguments will give us the correct paths:
/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/7.3.0/include

Note there may be additional an incorrect paths, such as:
/usr/src/debug/glibc/2.27-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux.gcc-cross-initial-x86_64/gcc/x86_64-poky-linux/7.3.0/include

But that one needs to be fixed in the recipe for glibc.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/conf/bitbake.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index ec3207c..bc962bb 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -597,9 +597,10 @@ EXTRA_OEMAKE_prepend_task-install = "${PARALLEL_MAKEINST} "
 ##################################################################
 # Optimization flags.
 ##################################################################
+# Beware: applied last to first
 DEBUG_PREFIX_MAP ?= "-fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
-                     -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
                      -fdebug-prefix-map=${STAGING_DIR_HOST}= \
+                     -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
 "
 DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types ${DEBUG_PREFIX_MAP}"
 
-- 
2.7.4



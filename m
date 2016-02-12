Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8BC24607A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Feb 2016 19:06:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Feb 2016 11:06:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,436,1449561600"; d="scan'208";a="883090665"
Received: from wwojtkie-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.28.188])
	by orsmga001.jf.intel.com with ESMTP; 12 Feb 2016 11:06:02 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Feb 2016 21:06:00 +0200
Message-Id: <1455303960-7173-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH] nss: define RPATH variable
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
X-List-Received-Date: Fri, 12 Feb 2016 19:06:09 -0000

Otherwise the nss libs do not get any RPATH/RUNPATH. Consequently, the
.so dependencies of nss libs are always searched from the base lib
directories of the host (i.e. /lib/ and /usr/lib). This causes problems
with nss-native where the .so's should be searched from the base lib
directories of the sysroot instead of the host file system.

This particular problem has probably been unnoticed as nss-native is
seldom used and/or most users are likely to have nss libraries installed
on their host system. In this case everything most likely work as
expected.

[YOCTO #9041]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-support/nss/nss_3.21.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/nss/nss_3.21.bb b/meta/recipes-support/nss/nss_3.21.bb
index 552fd6c..8b9fb71 100644
--- a/meta/recipes-support/nss/nss_3.21.bb
+++ b/meta/recipes-support/nss/nss_3.21.bb
@@ -91,12 +91,16 @@ do_compile() {
 
     export NSS_DISABLE_GTESTS=1
 
+    # Need to set RPATH so that chrpath will do its job correctly
+    RPATH="-Wl,-rpath-link,${STAGING_LIBDIR_NATIVE} -Wl,-rpath-link,${STAGING_BASE_LIBDIR_NATIVE} -Wl,-rpath,${STAGING_LIBDIR_NATIVE} -Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE}"
+
     # We can modify CC in the environment, but if we set it via an
     # argument to make, nsinstall, a host program, will also build with it!
     #
     export CC="${CC} -g"
     make -C ./nss CCC="${CXX} -g" \
-        OS_TEST=${OS_TEST}
+        OS_TEST=${OS_TEST} \
+        RPATH="${RPATH}"
 }
 
 
-- 
2.6.2



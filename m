Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Stw3j-0004Xl-EH
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 09:31:04 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Jul 2012 00:19:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="172897589"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.97])
	by azsmga001.ch.intel.com with ESMTP; 25 Jul 2012 00:19:30 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jul 2012 00:19:14 -0700
Message-Id: <5b7b1152a55792380fcc4e49298439769f51fe77.1343200454.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1343200454.git.sgw@linux.intel.com>
References: <cover.1343200454.git.sgw@linux.intel.com>
In-Reply-To: <cover.1343200454.git.sgw@linux.intel.com>
References: <cover.1343200454.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 20/28] eglibc-initial: Fix build failure due to missing limits.h
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jul 2012 07:31:06 -0000

From: Khem Raj <raj.khem@gmail.com>

We have had these things in place to overcome a limitation
from our gcc-initial-cross not staging a self sufficient
limits.h. Now thats fixed we do reset TOOLCHAIN_OPTIONS
to point to sysroot where linux kernel headers are staged
and not the bootstrap sysroot which will infact be popuated
by eglibc-initial itself.

Secondly we dont need to set CPPFLAGS specially as we
are doing that in eglibc.inc so we override that

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/eglibc/eglibc-initial.inc     |    1 +
 meta/recipes-core/eglibc/eglibc-initial_2.16.bb |    9 ++++++---
 meta/recipes-core/eglibc/eglibc_2.16.bb         |    2 +-
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-initial.inc b/meta/recipes-core/eglibc/eglibc-initial.inc
index 9062516..1020e40 100644
--- a/meta/recipes-core/eglibc/eglibc-initial.inc
+++ b/meta/recipes-core/eglibc/eglibc-initial.inc
@@ -8,6 +8,7 @@ PACKAGES_DYNAMIC = ""
 
 STAGINGCC = "gcc-cross-initial"
 STAGINGCC_virtclass-nativesdk = "gcc-crosssdk-initial"
+TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TARGET}"
 
 do_configure () {
 	sed -ie 's,{ (exit 1); exit 1; }; },{ (exit 0); }; },g' ${S}/configure
diff --git a/meta/recipes-core/eglibc/eglibc-initial_2.16.bb b/meta/recipes-core/eglibc/eglibc-initial_2.16.bb
index 787c762..f6b09ac 100644
--- a/meta/recipes-core/eglibc/eglibc-initial_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc-initial_2.16.bb
@@ -1,6 +1,9 @@
 require eglibc_${PV}.bb
 require eglibc-initial.inc
 
-do_configure_prepend () {
-        unset CFLAGS
-}
+# main eglibc recipes muck with TARGET_CPPFLAGS to point into
+# final target sysroot but we
+# are not there when building eglibc-initial
+# so reset it here
+
+TARGET_CPPFLAGS = ""
diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
index b76d943..fc3d82b 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "19383"
 
 DEPENDS += "gperf-native"
-PR = "r1"
+PR = "r2"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_16"
-- 
1.7.7.6




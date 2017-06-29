Return-Path: <brian.avery@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 93B6F78212
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jun 2017 21:38:18 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Jun 2017 14:38:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,283,1496127600"; d="scan'208";a="102905112"
Received: from bavery-ws-desk.jf.intel.com ([10.54.74.28])
	by orsmga004.jf.intel.com with ESMTP; 29 Jun 2017 14:38:18 -0700
From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Jun 2017 14:41:37 -0700
Message-Id: <2fd70db39e0dc8c9b75d1e13bad5523edf280b4e.1498760462.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1498760462.git.brian.avery@intel.com>
References: <cover.1498760462.git.brian.avery@intel.com>
Subject: [PATCH 1/1] scripts/oe-setup-rpmrepo: leverage oe-run-native
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
X-List-Received-Date: Thu, 29 Jun 2017 21:38:18 -0000

RSS means we no longer have a large native sysroot to run binaries from.
oe-run-native deals with this already, so this patch uses oe-run-native
to call the createrepo_c native binary that we need to make the package
feed indices.

[YOCTO #11706]
Signed-off-by: brian avery <brian.avery@intel.com>
---
 scripts/oe-setup-rpmrepo | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/scripts/oe-setup-rpmrepo b/scripts/oe-setup-rpmrepo
index df1c614..4e3d89e 100755
--- a/scripts/oe-setup-rpmrepo
+++ b/scripts/oe-setup-rpmrepo
@@ -72,7 +72,7 @@ setup_sysroot() {
 		BUILD_SYS="$BUILD_ARCH-$BUILD_OS"
 
 		OECORE_NATIVE_SYSROOT=$TMPDIR/sysroots/$BUILD_SYS
-	fi 
+	fi
 }
 
 setup_sysroot
@@ -88,16 +88,13 @@ if [ ! -d "$RPM_DIR" ]; then
    	echo "Error: rpm dir $RPM_DIR doesn't exist"
 	exit 1
 fi
-
-CREATEREPO=$OECORE_NATIVE_SYSROOT/usr/bin/createrepo_c
-if [ ! -e "$CREATEREPO" ]; then
-   	echo "Error: can't find createrepo binary"
-	echo "please run bitbake createrepo-native first"
-	exit 1
+if ! oe-run-native createrepo-c-native createrepo_c "$RPM_DIR"&>/dev/null; then
+    echo "Could not run createrepo_c, using bitbake to add to"
+    echo "native sysroot and trying again..."
+    bitbake createrepo-c-native -caddto_recipe_sysroot
+    # this time show the error mesage in case it's helpful
+    if ! oe-run-native createrepo-c-native createrepo_c "$RPM_DIR"; then
+        exit 1
+    fi
 fi
-
-export PATH=${PATH}:${OECORE_NATIVE_SYSROOT}/usr/bin
-
-$CREATEREPO "$RPM_DIR"
-
 exit 0
-- 
1.9.1



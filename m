Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A21BB60290
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 17:46:46 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 21 Jan 2016 09:46:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,326,1449561600"; d="scan'208";a="637950347"
Received: from unknown (HELO mqz-osx-suse64.fi.intel.com) ([10.252.18.3])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Jan 2016 09:46:47 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jan 2016 19:46:41 +0200
Message-Id: <1453398401-32288-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1453398401-32288-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1453398401-32288-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/2] build-perf-test.sh: add eSDK testing
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
X-List-Received-Date: Thu, 21 Jan 2016 17:46:47 -0000

Add simple initial eSDK test. Currently, only download size and
installation time of eSDK is measured. The eSDK to be tested is
generated from the same image that the other tests are run for. This
patch will add two new fields to the global results log and that needs
to be taken into account when examining the results.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/contrib/build-perf-test.sh | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/scripts/contrib/build-perf-test.sh b/scripts/contrib/build-perf-test.sh
index 105b54b..f1f44d3 100755
--- a/scripts/contrib/build-perf-test.sh
+++ b/scripts/contrib/build-perf-test.sh
@@ -353,6 +353,29 @@ test3 () {
     bbtime -p
 }
 
+#
+# Test 4 - eSDK
+# Measure: eSDK size and installation time
+test4 () {
+    log "Running Test 4: eSDK size and installation time"
+    bbnotime $IMAGE -c do_populate_sdk_ext
+
+    esdk_installer=(tmp/deploy/sdk/*-toolchain-ext-*.sh)
+
+    if [ ${#esdk_installer[*]} -eq 1 ]; then
+        s=$((`stat -c %s "$esdk_installer"` / 1024))
+        SIZES[(( size_count++ ))]="$s"
+        log "Download SIZE of eSDK is: $s kB"
+
+        do_sync
+        time_cmd "$esdk_installer" -y -d "tmp/esdk-deploy"
+    else
+        log "ERROR: other than one sdk found (${esdk_installer[*]}), reporting size and time as 0."
+        SIZES[(( size_count++ ))]="0"
+        TIMES[(( time_count++ ))]="0"
+    fi
+
+}
 
 
 # RUN!
@@ -362,6 +385,7 @@ test1_p2
 test1_p3
 test2
 test3
+test4
 
 # if we got til here write to global results
 write_results
-- 
2.1.4



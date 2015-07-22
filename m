Return-Path: <george.l.musat@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0D6F2761AB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jul 2015 11:58:36 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 22 Jul 2015 04:58:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,523,1432623600"; d="scan'208";a="767339717"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jul 2015 04:58:32 -0700
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id 8F41C6A4005;
	Wed, 22 Jul 2015 04:57:48 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jul 2015 14:58:46 +0300
Message-Id: <1437566326-9093-2-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1437566326-9093-1-git-send-email-george.l.musat@intel.com>
References: <1437566326-9093-1-git-send-email-george.l.musat@intel.com>
Subject: [PATCH 2/2] ptest-runner: Added the option to run a single package ptest suite.
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
X-List-Received-Date: Wed, 22 Jul 2015 11:58:37 -0000

If you give it a ptest enabled package as a paramter it will run
only it's suite.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 .../ptest-runner/files/ptest-runner                | 47 +++++++++++++---------
 1 file changed, 28 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-support/ptest-runner/files/ptest-runner b/meta/recipes-support/ptest-runner/files/ptest-runner
index a21102e..9f69602 100644
--- a/meta/recipes-support/ptest-runner/files/ptest-runner
+++ b/meta/recipes-support/ptest-runner/files/ptest-runner
@@ -1,27 +1,36 @@
 #!/bin/sh
-ANYFAILED=no
-echo "START: $0"
 
-for libdir in /usr/lib*
-do
+ARGS=("$@")
 
-    [ ! -d "$libdir" ] && continue
+ANYFAILED=no
+echo "START: $0"
 
-    for x in `ls -d $libdir/*/ptest 2>/dev/null`
+function run_ptest()
+{
+    for libdir in $1
     do
-        [ ! -f $x/run-ptest ] && continue
-        [ -h `dirname $x` ] && continue
-
-        date "+%Y-%m-%dT%H:%M"
-        echo "BEGIN: $x"
-        cd "$x"
-        timeout 10m ./run-ptest || ANYFAILED=yes
-        echo "END: $x"
-        date "+%Y-%m-%dT%H:%M"
+        [ ! -d "$libdir" ] && continue
+        for x in `ls -d $libdir*/ptest 2>/dev/null`
+        do
+            [ ! -f $x/run-ptest ] && continue
+            [ -h `dirname $x` ] && continue
+            date "+%Y-%m-%dT%H:%M"
+            echo "BEGIN: $x"
+            cd "$x"
+            timeout 10m ./run-ptest || ANYFAILED=yes
+            echo "END: $x"
+            date "+%Y-%m-%dT%H:%M"
+        done
     done
-done
-echo "STOP: $0"
-if [ "$ANYFAILED" = "yes"  ]; then
-    exit 1
+    echo "STOP: $0"
+    if [ "$ANYFAILED" = "yes"  ]; then
+        exit 1
+    fi
+}
+
+if [ "$#" -lt 1 ]; then
+    run_ptest '/usr/lib/*'
+else
+    run_ptest /usr/lib/${ARGS}
 fi
 exit 0
-- 
2.1.4



Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RxISv-0004HK-V8
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 14:30:42 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 14 Feb 2012 05:22:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="117403924"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.250])
	by fmsmga001.fm.intel.com with ESMTP; 14 Feb 2012 05:22:29 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2012 13:22:24 +0000
Message-Id: <0e9d34790d483bc9fcfe0d74bb325b22df98b91c.1329225663.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1329225663.git.paul.eggleton@linux.intel.com>
References: <cover.1329225663.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1329225663.git.paul.eggleton@linux.intel.com>
References: <cover.1329225663.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/4] scripts/bitbake: pass through debug options to initial pseudo build
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
X-List-Received-Date: Tue, 14 Feb 2012 13:30:42 -0000

If you specify -D or -v options to the bitbake wrapper script, and the
initial pseudo build needs to be done, it's useful to pass these
options through to that command so that you can debug the initial
pseudo build as well.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/bitbake |   14 +++++++++++++-
 1 files changed, 13 insertions(+), 1 deletions(-)

diff --git a/scripts/bitbake b/scripts/bitbake
index 1c8d4eb..dda3b26 100755
--- a/scripts/bitbake
+++ b/scripts/bitbake
@@ -4,6 +4,7 @@ export BBFETCH2=True
 export BB_ENV_EXTRAWHITE="PSEUDO_BUILD PSEUDO_DISABLED $BB_ENV_EXTRAWHITE"
 
 NO_BUILD_OPTS="--version -h --help -p --parse-only -s --show-versions -e --environment -g --graphviz"
+PASSTHROUGH_OPTS="-D -DD -DDD -DDDD -v"
 needpseudo="1"
 for opt in $@; do
 for key in $NO_BUILD_OPTS; do
@@ -69,7 +70,18 @@ if [ $buildpseudo = "1" ]; then
     if [ $needtar = "0" ]; then
         TARTARGET=""
     fi
-    bitbake pseudo-native $TARTARGET -c populate_sysroot
+    # Pass through debug options
+    additionalopts=""
+    for opt in $@; do
+        for key in $PASSTHROUGH_OPTS; do
+            if [ $opt = $key ]
+            then
+                additionalopts="$additionalopts $opt"
+                break
+            fi
+        done
+    done
+    bitbake pseudo-native $TARTARGET $additionalopts -c populate_sysroot
     ret=$?
     if [ "$ret" != "0" ]; then
         exit 1
-- 
1.7.5.4




Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SCV3X-00045s-Ux
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 13:59:20 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Mar 2012 04:50:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146197016"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.228])
	by fmsmga002.fm.intel.com with ESMTP; 27 Mar 2012 04:50:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Mar 2012 12:50:10 +0100
Message-Id: <198e1157afad1418826484e4044f59c7741b57f9.1332848153.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1332848153.git.paul.eggleton@linux.intel.com>
References: <cover.1332848153.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1332848153.git.paul.eggleton@linux.intel.com>
References: <cover.1332848153.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] scripts/bitbake: add/fix some comments
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
X-List-Received-Date: Tue, 27 Mar 2012 11:59:20 -0000

Add some comments explaining what this script does, fix one grammatical
error in a comment and make the tar-replacement-native comment give the
full reason why it is needed.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/bitbake |   16 +++++++++++++---
 1 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/scripts/bitbake b/scripts/bitbake
index f02e89b..a8adeb7 100755
--- a/scripts/bitbake
+++ b/scripts/bitbake
@@ -1,10 +1,20 @@
 #!/bin/sh
 
+# This is the bitbake wrapper script that ensures everything is set up
+# correctly in the environment, builds pseudo separately if it hasn't
+# already been built, and then runs bitbake within pseudo.
+
 export BBFETCH2=True
 export BB_ENV_EXTRAWHITE="PSEUDO_BUILD PSEUDO_DISABLED $BB_ENV_EXTRAWHITE"
 
+# For certain operations (i.e. that won't be actually running any tasks)
+# we don't need pseudo
 NO_BUILD_OPTS="--version -h --help -p --parse-only -s --show-versions -e --environment -g --graphviz"
+
+# Some options are useful to pass through to the initial pseudo build if
+# that needs to be run (for debugging)
 PASSTHROUGH_OPTS="-D -DD -DDD -DDDD -v"
+
 needpseudo="1"
 for opt in $@; do
 for key in $NO_BUILD_OPTS; do
@@ -29,7 +39,7 @@ if [ "$py_v3_check" != "" ]; then
 fi
 
 # Similarly, we now have code that doesn't parse correctly with older
-# versions of Python, and rather than fixing that and be eternally
+# versions of Python, and rather than fixing that and being eternally
 # vigilant for any other new feature use, just check the version here.
 py_v26_check=`python -c 'import sys; print sys.version_info >= (2,6,0)'`
 if [ "$py_v26_check" != "True" ]; then
@@ -53,8 +63,8 @@ float_test() {
      echo | awk 'END { exit ( !( '"$1"')); }'
 }
 
-# Tar version 1.24 and onwards handle symlinks in sstate packages correctly
-# but earlier versions do not
+# Tar version 1.24 and onwards handle overwriting symlinks correctly
+# but earlier versions do not; this needs to work properly for sstate
 float_test "$TARVERSION > 1.23" && needtar="0"
 
 buildpseudo="1"
-- 
1.7.5.4




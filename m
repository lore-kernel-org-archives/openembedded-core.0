Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id F2B467720E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 04:45:39 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 10 Aug 2016 21:45:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,503,1464678000"; d="scan'208";a="863475686"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.171.53])
	by orsmga003.jf.intel.com with ESMTP; 10 Aug 2016 21:45:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2016 16:45:05 +1200
Message-Id: <dd68fce60392cd398c33a000c96e5b6dc518285b.1470890478.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1470890478.git.paul.eggleton@linux.intel.com>
References: <cover.1470890478.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1470890478.git.paul.eggleton@linux.intel.com>
References: <cover.1470890478.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 08/10] toolchain-shar-extract.sh: add option to list contents
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
X-List-Received-Date: Thu, 11 Aug 2016 04:45:40 -0000

Add a -l command-line option for SDK installers to get a list of files
that will be extracted by the SDK - internally this just runs "tar tv"
on the embedded tarball. This can be used to look at which files the SDK
provides without actually installing it. The initial user of this is the
extensible SDK build process which needs to know what binaries are going
to be installed by the buildtools installer without installing it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/files/toolchain-shar-extract.sh | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 9279310..4345104 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -47,7 +47,8 @@ relocate=1
 savescripts=0
 verbose=0
 publish=0
-while getopts ":yd:npDRS" OPT; do
+listcontents=0
+while getopts ":yd:npDRSl" OPT; do
 	case $OPT in
 	y)
 		answer="Y"
@@ -72,6 +73,9 @@ while getopts ":yd:npDRS" OPT; do
 	S)
 		savescripts=1
 		;;
+	l)
+		listcontents=1
+		;;
 	*)
 		echo "Usage: $(basename $0) [-y] [-d <dir>]"
 		echo "  -y         Automatic yes to all prompts"
@@ -83,11 +87,18 @@ while getopts ":yd:npDRS" OPT; do
 		echo "  -S         Save relocation scripts"
 		echo "  -R         Do not relocate executables"
 		echo "  -D         use set -x to see what is going on"
+		echo "  -l         list files that will be extracted"
 		exit 1
 		;;
 	esac
 done
 
+payload_offset=$(($(grep -na -m1 "^MARKER:$" $0|cut -d':' -f1) + 1))
+if [ "$listcontents" = "1" ] ; then
+    tail -n +$payload_offset $0| tar tvJ || exit 1
+    exit
+fi
+
 titlestr="@SDK_TITLE@ installer version @SDK_VERSION@"
 printf "%s\n" "$titlestr"
 printf "%${#titlestr}s\n" | tr " " "="
@@ -187,8 +198,6 @@ if [ ! -x $target_sdk_dir -o ! -w $target_sdk_dir -o ! -r $target_sdk_dir ]; the
 	$SUDO_EXEC mkdir -p $target_sdk_dir >/dev/null 2>&1
 fi
 
-payload_offset=$(($(grep -na -m1 "^MARKER:$" $0|cut -d':' -f1) + 1))
-
 printf "Extracting SDK..."
 tail -n +$payload_offset $0| $SUDO_EXEC tar xJ -C $target_sdk_dir --checkpoint=.2500 $EXTRA_TAR_OPTIONS || exit 1
 echo "done"
-- 
2.5.5



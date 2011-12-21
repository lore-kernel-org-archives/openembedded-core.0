Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1RdDmW-0004CW-Dd
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 05:27:56 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 20 Dec 2011 20:20:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="89810763"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by orsmga002.jf.intel.com with ESMTP; 20 Dec 2011 20:20:50 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2011 12:32:50 +0800
Message-Id: <9b44ef75482f0625eb56d98bed2e491fa2eb7da7.1324441819.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1324441819.git.shane.wang@intel.com>
References: <cover.1324441819.git.shane.wang@intel.com>
Subject: [PATCH 1/1] Create a script for SUMMARY audit in recipes
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
X-List-Received-Date: Wed, 21 Dec 2011 04:27:56 -0000

Some recipes don't contain SUMMARY, which HOB will use for descriptions.
If the summary is missing, bitbake will create a default value for summary.
That is PN plus string " version " plus its version. Every maintainer should add and update the summary fields according to audit results.

[YOCTO #1804] got fixed, and maintainers should follow up.

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 scripts/contrib/summary-audit.sh |   55 ++++++++++++++++++++++++++++++++++++++
 1 files changed, 55 insertions(+), 0 deletions(-)
 create mode 100755 scripts/contrib/summary-audit.sh

diff --git a/scripts/contrib/summary-audit.sh b/scripts/contrib/summary-audit.sh
new file mode 100755
index 0000000..63b43cb
--- /dev/null
+++ b/scripts/contrib/summary-audit.sh
@@ -0,0 +1,55 @@
+#!/bin/sh
+#
+# Perform an audit of which recipes provide summary and which
+# are missing for HOB2.
+#
+# Setup requirements: Run this script after source'ing the build
+# environment script, so you're running it from build/ directory.
+#
+# Maintainer: Shane Wang <shane.wang@intel.com>
+
+DISTRO_TRACKING_FILE="../meta/conf/distro/include/distro_tracking_fields.inc"
+REPORT_MISSING_SUMMARY="summary.txt"
+REPORT_LOG="summary.log"
+
+rm -rf $REPORT_MISSING_SUMMARY $REPORT_LOG
+
+BITBAKE=`which bitbake`
+if [ -z "$BITBAKE" ]; then
+	echo "Error: bitbake command not found."
+	echo "Did you forget to source the build environment script?"
+	exit 1
+fi
+
+packages=(`bitbake -s | awk '{ print \$1 }'`)
+versions=(`bitbake -s | awk '{ print \$2 }'`)
+
+echo "Package Num: ${#packages[*]} Version Num: ${#versions[*]}" >> "$REPORT_LOG"
+len=${#packages[*]}
+
+for (( i=0; i < "$len"; i++ )); do
+	pkg=${packages[$i]}
+
+	if [[ "$pkg" == "Loading" || "$pkg" == "Loaded" ||
+          "$pkg" == "Parsing" || "$pkg" == "Package" ||
+          "$pkg" == "NOTE:"   || "$pkg" == "WARNING:" ||
+          "$pkg" == "done."   || "$pkg" == "============" ||
+          "$pkg" == "ERROR:"  || "$pkg" == "Traceback" ||
+          "$pkg" == "File"    || "$pkg" == "IndexError:" ]]
+	then
+		# Skip initial bitbake output
+		continue
+	fi
+
+	SUMMARY=`bitbake -e $pkg | grep -e "^SUMMARY *=" | awk -F '=' '{ print \$2 }' | awk -F '"' '{ print \$2 }'`
+	ver=${versions[$i]#*:} # remove ':' in the version
+	echo "Handling package $pkg ($i out of $len) ..."
+	echo "HANDLING SUMMARY of package $pkg ... $SUMMARY <---NOT---> $pkg version $ver" >> "$REPORT_LOG"
+
+	if [[ "$SUMMARY" =~ "$pkg"" version ""$ver" ]]; then
+		# find which summary is missing and report
+		maintainer=`cat ../meta/conf/distro/include/distro_tracking_fields.inc | grep -e "^RECIPE_MAINTAINER_pn-"$pkg" *=" | cut -d= -f2`
+		echo "$pkg"" = ""$maintainer" >> "$REPORT_MISSING_SUMMARY"
+	fi
+done
+echo "DONE!" >> "$REPORT_LOG"
-- 
1.7.6




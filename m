Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RJYC0-0002rD-9z
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 00:12:56 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Oct 2011 15:06:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,415,1315206000"; d="scan'208";a="83263245"
Received: from unknown (HELO swold-mobl.Mikenopa.local) ([10.255.15.81])
	by fmsmga002.fm.intel.com with ESMTP; 27 Oct 2011 15:06:54 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2011 00:06:35 +0200
Message-Id: <5ff6fd336a732d83205745b1dde3187630f39924.1319753141.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1319753141.git.sgw@linux.intel.com>
References: <cover.1319753141.git.sgw@linux.intel.com>
In-Reply-To: <cover.1319753141.git.sgw@linux.intel.com>
References: <cover.1319753141.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 15/18] documentation-audit.sh: script for auditing documentation build status
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
X-List-Received-Date: Thu, 27 Oct 2011 22:12:57 -0000

From: Scott Garman <scott.a.garman@intel.com>

This script is used to enumerate which recipes are building
documentation. It does this by checking that a -doc package
gets generated and contains files.

The script works by building each recipe using the output from
bitbake -s.

It will generate several report files, listing which recipes
include documentation, which are missing documentation, and
which did not successfully build at all.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 scripts/contrib/documentation-audit.sh |   92 ++++++++++++++++++++++++++++++++
 1 files changed, 92 insertions(+), 0 deletions(-)
 create mode 100755 scripts/contrib/documentation-audit.sh

diff --git a/scripts/contrib/documentation-audit.sh b/scripts/contrib/documentation-audit.sh
new file mode 100755
index 0000000..5070fee
--- /dev/null
+++ b/scripts/contrib/documentation-audit.sh
@@ -0,0 +1,92 @@
+#!/bin/bash
+#
+# Perform an audit of which packages provide documentation and which
+# are missing -doc packages.
+#
+# Setup requirements: be sure to be building for MACHINE=qemux86. Run
+# this script after source'ing the build environment script, so you're
+# running it from build/ directory.
+#
+# Maintainer: Scott Garman <scott.a.garman@intel.com>
+
+REPORT_DOC_SIMPLE="documentation_exists.txt"
+REPORT_DOC_DETAIL="documentation_exists_detail.txt"
+REPORT_MISSING_SIMPLE="documentation_missing.txt"
+REPORT_MISSING_DETAIL="documentation_missing_detail.txt"
+REPORT_BUILD_ERRORS="build_errors.txt"
+
+rm -rf $REPORT_DOC_SIMPLE $REPORT_DOC_DETAIL $REPORT_MISSING_SIMPLE $REPORT_MISSING_DETAIL
+
+BITBAKE=`which bitbake`
+if [ -z "$BITBAKE" ]; then
+	echo "Error: bitbake command not found."
+	echo "Did you forget to source the build environment script?"
+	exit 1
+fi
+
+echo "REMINDER: you need to build for MACHINE=qemux86 or you won't get useful results"
+echo "REMINDER: you need to have COMMERCIAL_LICENSE = \"\" in local.conf or you'll get false positives"
+
+for pkg in `bitbake -s | awk '{ print \$1 }'`; do
+	if [[ "$pkg" == "Loading" || "$pkg" == "Loaded" ||
+          "$pkg" == "Parsing" || "$pkg" == "Package" ||
+          "$pkg" == "NOTE:"   || "$pkg" == "WARNING:" ||
+          "$pkg" == "done."   || "$pkg" == "============" ]]
+	then
+		# Skip initial bitbake output
+		continue
+	fi
+	if [[ "$pkg" =~ -native$ || "$pkg" =~ -nativesdk$ ||
+          "$pkg" =~ -cross-canadian ]]; then
+		# Skip native/nativesdk/cross-canadian recipes
+		continue
+	fi
+	if [[ "$pkg" =~ ^meta- || "$pkg" =~ ^task- || "$pkg" =~ -image ]]; then
+		# Skip meta, task and image recipes
+		continue
+	fi
+	if [[ "$pkg" =~ ^glibc- || "$pkg" =~ ^libiconv$ ||
+          "$pkg" =~ -toolchain$ || "$pkg" =~ ^package-index$ ||
+          "$pkg" =~ ^linux- || "$pkg" =~ ^adt-installer$ ||
+          "$pkg" =~ ^eds-tools$ || "$pkg" =~ ^external-python-tarball$ ||
+          "$pkg" =~ ^qt4-embedded$ || "$pkg" =~ ^qt-mobility ]]; then
+		# Skip glibc, libiconv, -toolchain, and other recipes known
+		# to cause build conflicts or trigger false positives.
+		continue
+	fi	
+
+	echo "Building package $pkg..."
+	bitbake $pkg > /dev/null
+	if [ $? -ne 0 ]; then
+		echo "There was an error building package $pkg" >> "$REPORT_MISSING_DETAIL"
+		echo "$pkg" >> $REPORT_BUILD_ERRORS
+
+		# Do not skip the remaining tests, as sometimes the
+		# exit status is 1 due to QA errors, and we can still
+		# perform the -doc checks.
+	fi
+
+	echo "$pkg built successfully, checking for a documentation package..."
+	WORKDIR=`bitbake -e $pkg | grep ^WORKDIR | awk -F '=' '{ print \$2 }' | awk -F '"' '{ print \$2 }'`
+	FIND_DOC_PKG=`find $WORKDIR/packages-split/*-doc -maxdepth 0 -type d`
+	if [ -z "$FIND_DOC_PKG" ]; then
+		# No -doc package was generated:
+		echo "No -doc package: $pkg" >> "$REPORT_MISSING_DETAIL"
+		echo "$pkg" >> $REPORT_MISSING_SIMPLE
+		continue
+	fi
+
+	FIND_DOC_FILES=`find $FIND_DOC_PKG -type f`
+	if [ -z "$FIND_DOC_FILES" ]; then
+		# No files shipped with the -doc package:
+		echo "No files shipped with the -doc package: $pkg" >> "$REPORT_MISSING_DETAIL"
+		echo "$pkg" >> $REPORT_MISSING_SIMPLE
+		continue
+	fi
+
+	echo "Documentation shipped with $pkg:" >> "$REPORT_DOC_DETAIL"
+	echo "$FIND_DOC_FILES" >> "$REPORT_DOC_DETAIL"
+	echo ""	>> "$REPORT_DOC_DETAIL"
+
+	echo "$pkg" >> "$REPORT_DOC_SIMPLE"
+done
-- 
1.7.6.4




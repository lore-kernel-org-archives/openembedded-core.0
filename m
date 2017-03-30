Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 61A5F77D4C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 19:57:16 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga105.fm.intel.com with ESMTP; 30 Mar 2017 12:57:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,248,1486454400"; d="scan'208";a="81119773"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.126])
	by orsmga005.jf.intel.com with ESMTP; 30 Mar 2017 12:57:17 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 14:01:14 -0600
Message-Id: <1490904074-5530-2-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1490904074-5530-1-git-send-email-anibal.limon@linux.intel.com>
References: <1490904074-5530-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCHv2 2/2] scripts: Add yocto-compat-layer-wrapper
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
X-List-Received-Date: Thu, 30 Mar 2017 19:57:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This script will be used to create it's own build directory to make
runs of yocto-compat-layer.py againts layers isolated.

Example:

$ source oe-init-build-env
$ yocto-compat-layer-wrapper LAYER_DIR LAYER_DIR_N

[YOCTO #11164]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 scripts/yocto-compat-layer-wrapper | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100755 scripts/yocto-compat-layer-wrapper

diff --git a/scripts/yocto-compat-layer-wrapper b/scripts/yocto-compat-layer-wrapper
new file mode 100755
index 0000000..db4b687
--- /dev/null
+++ b/scripts/yocto-compat-layer-wrapper
@@ -0,0 +1,27 @@
+#!/usr/bin/env bash
+
+# Yocto Project compatibility layer tool wrapper
+#
+# Creates a temprary build directory to run Yocto Project Compatible
+# script to avoid a contaminated environment.
+#
+# Copyright (C) 2017 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+if [ -z "$BUILDDIR" ]; then
+	echo "Please source oe-init-build-env before run this script."
+	exit 2
+fi
+
+base_dir=$(realpath $BUILDDIR/../)
+cd $base_dir
+
+build_dir=$(mktemp -p $base_dir -d -t build-XXXX)
+
+source oe-init-build-env $build_dir
+yocto-compat-layer.py "$@"
+retcode=$?
+
+rm -rf $build_dir
+
+exit $retcode
-- 
2.1.4



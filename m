Return-Path: <anibal.limon@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id B8C3C77C05
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 21:40:13 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 29 Mar 2017 14:40:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,243,1486454400"; d="scan'208";a="80736027"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.126])
	by orsmga005.jf.intel.com with ESMTP; 29 Mar 2017 14:40:14 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Mar 2017 15:44:10 -0600
Message-Id: <1490823850-20782-2-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1490823850-20782-1-git-send-email-anibal.limon@linux.intel.com>
References: <1490823850-20782-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: patrick.ohly@gmx.de, saul.wold@intel.com
Subject: [PATCH 2/2] scripts: Add yocto-compat-layer-wrapper
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
X-List-Received-Date: Wed, 29 Mar 2017 21:40:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This script will be used to create it's own environment to make
runs of yocto-compat-layer.py againts layers isolated.

It clones the oe-core and bitbake repository in a temporary folder
and then calls yocto-compat-layer.py with specified LAYERS_DIRs to
test.

Example:

$ ./scripts/yocto-compat-layer-wrapper LAYER_DIR LAYER_DIR_N

[YOCTO #11164]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 scripts/yocto-compat-layer-wrapper | 68 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100755 scripts/yocto-compat-layer-wrapper

diff --git a/scripts/yocto-compat-layer-wrapper b/scripts/yocto-compat-layer-wrapper
new file mode 100755
index 0000000..6776f64
--- /dev/null
+++ b/scripts/yocto-compat-layer-wrapper
@@ -0,0 +1,68 @@
+#!/usr/bin/env bash
+
+# Yocto Project compatibility layer tool wrapper
+#
+# Copyright (C) 2017 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+oe_core_repo="git://git.openembedded.org/openembedded-core"
+bitbake_repo="git://git.openembedded.org/bitbake"
+
+show_help() {
+	printf "Usage: %s [-o output_log] [-h] LAYER_DIR ...\n" $0
+}
+
+output_log=''
+layer_dirs=""
+while getopts o:h arg
+do
+	case $arg in
+	o)
+		output_log=$(realpath "$OPTARG");;
+	h)
+		show_help
+		exit 0;;
+	?)
+		show_help
+		exit 2;;
+	esac
+done
+shift $(($OPTIND - 1))
+if [[ -z $* ]]; then
+	show_help
+	exit 1
+else
+	for layer_dir in $(realpath $*); do
+		layer_dirs="$layer_dirs $layer_dir"
+	done
+fi
+
+env_dir=$(mktemp -d -t yocto-compat-XXXX)
+echo "The environment will be setup at $env_dir"
+echo ""
+
+echo "Cloning oe-core..."
+git clone $oe_core_repo $env_dir
+if [ $? -ne 0 ]; then
+	echo "Failed to clone oe-core repository"
+	exit 1
+fi
+
+echo "Cloning bitbake..."
+git clone $bitbake_repo $env_dir/bitbake
+if [ $? -ne 0 ]; then
+	echo "Failed to clone bitbake repository"
+	exit 1
+fi
+
+echo ""
+echo "Changing directory to $env_dir"
+cd $env_dir
+source oe-init-build-env
+if [[ -z $output_log ]]; then
+	echo "Running yocto-compat-layer.py $layer_dirs"
+	yocto-compat-layer.py $layer_dirs
+else
+	echo "Running yocto-compat-layer.py -o $output_log $layer_dirs"
+	yocto-compat-layer.py -o $output_log $layer_dirs
+fi
-- 
2.1.4



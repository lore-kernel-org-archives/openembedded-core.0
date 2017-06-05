Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BB299780EC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 22:06:39 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jun 2017 15:06:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,303,1493708400"; d="scan'208";a="109502576"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.117])
	by orsmga005.jf.intel.com with ESMTP; 05 Jun 2017 15:06:39 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Jun 2017 17:06:42 -0500
Message-Id: <1496700402-18627-2-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1496700402-18627-1-git-send-email-anibal.limon@linux.intel.com>
References: <1496700402-18627-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: patrick.ohly@gmx.de, libertad.gonzalez.de.la.cruz@intel.com
Subject: [PATCH 2/2] scripts/yocto-compat-layer-wrapper: Use realpath of output_log
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
X-List-Received-Date: Mon, 05 Jun 2017 22:06:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We are using a temp directory, use the realpath for output log
to store the results in the original BUILDDIR.

[YOCTO #11571]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 scripts/yocto-compat-layer-wrapper | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/scripts/yocto-compat-layer-wrapper b/scripts/yocto-compat-layer-wrapper
index db4b687..b6baeb4 100755
--- a/scripts/yocto-compat-layer-wrapper
+++ b/scripts/yocto-compat-layer-wrapper
@@ -13,13 +13,29 @@ if [ -z "$BUILDDIR" ]; then
 	exit 2
 fi
 
+# since we are using a temp directory, use the realpath for output
+# log option
+output_log=''
+while getopts o: name
+do
+	case $name in
+	o) output_log=$(realpath "$OPTARG")
+	esac
+done
+shift $(($OPTIND - 1))
+
+# generate a temp directory to run compat layer script
 base_dir=$(realpath $BUILDDIR/../)
 cd $base_dir
 
 build_dir=$(mktemp -p $base_dir -d -t build-XXXX)
 
 source oe-init-build-env $build_dir
-yocto-compat-layer.py "$@"
+if [[ $output_log != '' ]]; then
+	yocto-compat-layer.py -o "$output_log" "$*"
+else
+	yocto-compat-layer.py "$@"
+fi
 retcode=$?
 
 rm -rf $build_dir
-- 
2.1.4



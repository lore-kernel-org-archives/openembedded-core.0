Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0383E78282
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 16:32:07 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jun 2017 09:32:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,315,1493708400"; d="scan'208";a="271875677"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.117])
	by fmsmga004.fm.intel.com with ESMTP; 08 Jun 2017 09:32:06 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 11:32:03 -0500
Message-Id: <e3f44ec1d66dfd861860f61fa249fcb7dc953752.1496939387.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1496939387.git.anibal.limon@linux.intel.com>
References: <cover.1496939387.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1496939387.git.anibal.limon@linux.intel.com>
References: <cover.1496939387.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/7] scripts/yocto-compat-layer-wrapper: Use realpath of output_log
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
X-List-Received-Date: Thu, 08 Jun 2017 16:32:08 -0000
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



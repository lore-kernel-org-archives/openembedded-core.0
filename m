Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D2E2760132
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 12:42:43 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 07 Sep 2015 05:42:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,485,1437462000"; d="scan'208";a="556940018"
Received: from wmurray-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.25.6])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Sep 2015 05:42:41 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Sep 2015 13:42:17 +0100
Message-Id: <d69bc064c62cc0293f5e9db1259772639636a31e.1441629547.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1441629547.git.paul.eggleton@linux.intel.com>
References: <cover.1441629547.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1441629547.git.paul.eggleton@linux.intel.com>
References: <cover.1441629547.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 01/11] toolchain-shar-extract.sh: ensure extensible SDK install path obeys restrictions
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
X-List-Received-Date: Mon, 07 Sep 2015 12:42:44 -0000

From: Brendan Le Foll <brendan.le.foll@intel.com>

There are some characters that cannot appear in the installation path, so we
need to check for these

Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/files/toolchain-shar-extract.sh | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 3a50991..85719fa 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -85,9 +85,18 @@ else
 	target_sdk_dir=$(readlink -m "$target_sdk_dir")
 fi
 
-if [ -n "$(echo $target_sdk_dir|grep ' ')" ]; then
-	echo "The target directory path ($target_sdk_dir) contains spaces. Abort!"
-	exit 1
+if [ "$SDK_EXTENSIBLE" = "1" ]; then
+	# We're going to be running the build system, additional restrictions apply
+	if echo "$target_sdk_dir" | grep -q '[+\ @]'; then
+		echo "The target directory path ($target_sdk_dir) contains illegal" \
+		     "characters such as spaces, @ or +. Abort!"
+		exit 1
+	fi
+else
+	if [ -n "$(echo $target_sdk_dir|grep ' ')" ]; then
+		echo "The target directory path ($target_sdk_dir) contains spaces. Abort!"
+		exit 1
+	fi
 fi
 
 if [ -e "$target_sdk_dir/environment-setup-@REAL_MULTIMACH_TARGET_SYS@" ]; then
-- 
2.1.0



Return-Path: <brendan.le.foll@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 63C9373E11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 13:32:50 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Aug 2015 06:32:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,710,1432623600"; d="scan'208";a="786789172"
Received: from jupiter.iwi.intel.com ([172.28.33.51])
	by fmsmga002.fm.intel.com with ESMTP; 19 Aug 2015 06:32:49 -0700
From: brendan.le.foll@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Aug 2015 14:32:43 +0100
Message-Id: <1439991165-13121-2-git-send-email-brendan.le.foll@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1439991165-13121-1-git-send-email-brendan.le.foll@intel.com>
References: <1439991165-13121-1-git-send-email-brendan.le.foll@intel.com>
Subject: [PATCH 1/3] toolchain-shar-extract.sh: ensure extensible SDK install path obeys restrictions
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
X-List-Received-Date: Wed, 19 Aug 2015 13:32:52 -0000

From: Brendan Le Foll <brendan.le.foll@intel.com>

There are some characters that cannot appear in the installation path, so we
need to check for these

Signed-off-by: Brendan Le Foll <brendan.le.foll@intel.com>
---
 meta/files/toolchain-shar-extract.sh | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 0a33ee8..6984e11 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -85,9 +85,12 @@ else
 	target_sdk_dir=$(readlink -m "$target_sdk_dir")
 fi
 
-if [ -n "$(echo $target_sdk_dir|grep ' ')" ]; then
-	echo "The target directory path ($target_sdk_dir) contains spaces. Abort!"
-	exit 1
+if [ "$SDK_EXTENSIBLE" = "1" ]; then
+	if [[ "$target_sdk_dir" =~ [+\ @] ]]; then
+		echo "The target directory path ($target_sdk_dir) contains illegal" \
+		     "characters such as spaces, @ or +. Abort!"
+		exit 1
+	fi
 fi
 
 if [ -e "$target_sdk_dir/environment-setup-@REAL_MULTIMACH_TARGET_SYS@" ]; then
-- 
2.5.0



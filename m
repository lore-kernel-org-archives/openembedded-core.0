Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 994526AC00
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 02:38:09 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 22 Nov 2015 18:38:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,335,1444719600"; d="scan'208";a="857558596"
Received: from echoo1-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.170.181])
	by fmsmga002.fm.intel.com with ESMTP; 22 Nov 2015 18:38:08 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 15:37:38 +1300
Message-Id: <0407396139730e3000fa010c163d8bc0bb3fd89a.1448246218.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1448246218.git.paul.eggleton@linux.intel.com>
References: <cover.1448246218.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1448246218.git.paul.eggleton@linux.intel.com>
References: <cover.1448246218.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/7] toolchain-shar-extract.sh: do not allow $ in paths for ext SDK
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
X-List-Received-Date: Mon, 23 Nov 2015 02:38:09 -0000

If you put an $ character in the path, SDK installation fails during the
preparation stage, so add this to the disallowed characters.

Fixes [YOCTO #8625].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/files/toolchain-shar-extract.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 98b9f1c..954b6b3 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -101,9 +101,9 @@ fi
 
 if [ "$SDK_EXTENSIBLE" = "1" ]; then
 	# We're going to be running the build system, additional restrictions apply
-	if echo "$target_sdk_dir" | grep -q '[+\ @]'; then
+	if echo "$target_sdk_dir" | grep -q '[+\ @$]'; then
 		echo "The target directory path ($target_sdk_dir) contains illegal" \
-		     "characters such as spaces, @ or +. Abort!"
+		     "characters such as spaces, @, \$ or +. Abort!"
 		exit 1
 	fi
 else
-- 
2.1.0



Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 241D7731B0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:00:25 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 22 Jan 2016 04:00:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,330,1449561600"; d="scan'208";a="732272765"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.181.236])
	by orsmga003.jf.intel.com with ESMTP; 22 Jan 2016 04:00:24 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 23 Jan 2016 00:59:55 +1300
Message-Id: <3fea7289d34159135a083d58c3a4be4d79fbb8e7.1453463789.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1453463789.git.paul.eggleton@linux.intel.com>
References: <cover.1453463789.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1453463789.git.paul.eggleton@linux.intel.com>
References: <cover.1453463789.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 08/14] toolchain-shar-extract.sh: improve behaviour when xz is not installed
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
X-List-Received-Date: Fri, 22 Jan 2016 12:00:25 -0000

Currently if xz isn't installed when installing the SDK you get an error
from tar and then the SDK installation continues, cascading into a load
of other failures since files are missing. Add a check to see if xz can
be run and error out if it can't, and also exit if tar fails.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/files/toolchain-shar-extract.sh | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index b1ef4b7..d844771 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -29,6 +29,11 @@ if [ "$INST_ARCH" != "$SDK_ARCH" ]; then
 	fi
 fi
 
+if ! xz -V > /dev/null 2>&1; then
+	echo "Error: xz is required for installation of this SDK, please install it first"
+	exit 1
+fi
+
 DEFAULT_INSTALL_DIR="@SDKPATH@"
 SUDO_EXEC=""
 target_sdk_dir=""
@@ -168,7 +173,7 @@ fi
 payload_offset=$(($(grep -na -m1 "^MARKER:$" $0|cut -d':' -f1) + 1))
 
 printf "Extracting SDK..."
-tail -n +$payload_offset $0| $SUDO_EXEC tar xJ -C $target_sdk_dir --checkpoint=.2500
+tail -n +$payload_offset $0| $SUDO_EXEC tar xJ -C $target_sdk_dir --checkpoint=.2500 || exit 1
 echo "done"
 
 printf "Setting it up..."
-- 
2.5.0



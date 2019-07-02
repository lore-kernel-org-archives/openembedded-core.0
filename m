Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 175E17EA97
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2019 04:20:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Jul 2019 21:13:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,442,1557212400"; d="scan'208";a="166050118"
Received: from aradinsa-mobl1.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.181.235])
	by orsmga003.jf.intel.com with ESMTP; 01 Jul 2019 21:13:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Jul 2019 16:12:46 +1200
Message-Id: <dc6f669e7b7dbb7b97f8cea4b5f57b2bbb9bc885.1562040724.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1562040724.git.paul.eggleton@linux.intel.com>
References: <cover.1562040724.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] scripts/contrib/ddimage: be explicit whether device doesn't exist or isn't writeable
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
X-List-Received-Date: Tue, 02 Jul 2019 04:20:11 -0000
Content-Transfer-Encoding: 8bit

Make the error messages a little more friendly.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/contrib/ddimage | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/ddimage b/scripts/contrib/ddimage
index a7dc5f7487b..7f2ad112a62 100755
--- a/scripts/contrib/ddimage
+++ b/scripts/contrib/ddimage
@@ -122,6 +122,12 @@ if [ ! -e "$IMAGE" ]; then
 	exit 1
 fi
 
+if [ ! -e "$DEVICE" ]; then
+	echo "ERROR: Device $DEVICE does not exist"
+	usage
+	exit 1
+fi
+
 if [ "$(uname)" = "Darwin" ]; then
 	# readlink doesn't support -f on MacOS, just assume it isn't a symlink
 	ACTUAL_DEVICE=$DEVICE
@@ -139,9 +145,8 @@ if is_inuse $ACTUAL_DEVICE ; then
 	exit 1
 fi
 
-
 if [ ! -w "$DEVICE" ]; then
-	echo "ERROR: Device $DEVICE does not exist or is not writable"
+	echo "ERROR: Device $DEVICE is not writable - possibly use sudo?"
 	usage
 	exit 1
 fi
-- 
2.20.1



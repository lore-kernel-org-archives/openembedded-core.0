Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3CB7473D46
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 13:02:29 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 21 Apr 2015 06:02:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,616,1422950400"; d="scan'208";a="559403145"
Received: from ppiorkow-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.9.218])
	by orsmga003.jf.intel.com with ESMTP; 21 Apr 2015 06:02:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Apr 2015 14:01:56 +0100
Message-Id: <25fdad352220138493ccf426d06bf65c2246d9cb.1429621253.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1429621253.git.paul.eggleton@linux.intel.com>
References: <cover.1429621253.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1429621253.git.paul.eggleton@linux.intel.com>
References: <cover.1429621253.git.paul.eggleton@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 3/3] mkefidisk.sh: be more explicit with device error
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
X-List-Received-Date: Tue, 21 Apr 2015 13:02:29 -0000

* Specify whether the device can't be found or can't be written to
* Give a hint to use sudo

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/contrib/mkefidisk.sh | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index d6bc965..55f72b0 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -173,7 +173,11 @@ fi
 
 if [ ! -w "$DEVICE" ]; then
 	usage
-	die "Device $DEVICE does not exist or is not writable"
+	if [ ! -e "${DEVICE}" ] ; then
+		die "Device $DEVICE cannot be found"
+	else
+		die "Device $DEVICE is not writable (need to run under sudo?)"
+	fi
 fi
 
 if [ ! -e "$HDDIMG" ]; then
-- 
2.1.0



Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 22D3C6ABF7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Apr 2015 13:02:28 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 21 Apr 2015 06:02:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,616,1422950400"; d="scan'208";a="559403129"
Received: from ppiorkow-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.9.218])
	by orsmga003.jf.intel.com with ESMTP; 21 Apr 2015 06:02:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Apr 2015 14:01:55 +0100
Message-Id: <783f2e243ee5714fe36119e674fa4db77ba52281.1429621253.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1429621253.git.paul.eggleton@linux.intel.com>
References: <cover.1429621253.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1429621253.git.paul.eggleton@linux.intel.com>
References: <cover.1429621253.git.paul.eggleton@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 2/3] mkefidisk.sh: fix hanging on non-writeable device
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
X-List-Received-Date: Tue, 21 Apr 2015 13:02:28 -0000

If cleanup() is called early on, as happens when the device isn't
writeable, then none of the mount point variables are set; thus the
script was calling grep with only one argument and appeared to hang
since it was waiting for input on stdin.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/contrib/mkefidisk.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index 74cf40d..d6bc965 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -136,6 +136,9 @@ unmount_device() {
 }
 
 unmount() {
+	if [ "$1" = "" ] ; then
+		return 0
+	fi
 	grep -q $1 /proc/mounts
 	if [ $? -eq 0 ]; then
 		debug "Unmounting $1"
-- 
2.1.0



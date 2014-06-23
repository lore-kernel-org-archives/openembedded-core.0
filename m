Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8A2A465F77
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jun 2014 21:37:51 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 23 Jun 2014 14:32:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,533,1400050800"; d="scan'208";a="562109515"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga002.jf.intel.com with ESMTP; 23 Jun 2014 14:36:59 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jun 2014 14:44:41 -0700
Message-Id: <9b67e808e9115abc08321cd3dd3d38a74e6f41c0.1403559881.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 2.0.0
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH] mkefidisk.sh: Allow symlink for device
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
X-List-Received-Date: Mon, 23 Jun 2014 21:37:58 -0000

Allow the user to specify a symlink as the host device. If a link is
used, mkefidisk will now dereference it and use the link target when
looking for sysfs information.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/contrib/mkefidisk.sh | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index c86849d..1992d6c 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -98,6 +98,11 @@ DEVICE=$1
 HDDIMG=$2
 TARGET_DEVICE=$3
 
+LINK=$(readlink $DEVICE)
+if [ $? -eq 0 ]; then
+	DEVICE="$LINK"
+fi
+
 if [ ! -w "$DEVICE" ]; then
 	echo "ERROR: Device $DEVICE does not exist or is not writable"
 	usage
-- 
2.0.0



Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7DC3B705DC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 21:16:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Jul 2014 14:10:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,673,1400050800"; d="scan'208";a="544425847"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga001.jf.intel.com with ESMTP; 16 Jul 2014 14:16:13 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jul 2014 14:15:58 +0000
Message-Id: <c2eb45f71b32d7e1e53eda60e6ca2ae0d857f28c.1405520111.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <cover.1405520111.git.dvhart@linux.intel.com>
References: <cover.1405520111.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1405520111.git.dvhart@linux.intel.com>
References: <cover.1405520111.git.dvhart@linux.intel.com>
Subject: [PATCH 2/8] mkefidisk.sh: Add mount error checking
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
X-List-Received-Date: Wed, 16 Jul 2014 21:16:17 -0000

Provide reasonable feedabck if the mount commands fail.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/contrib/mkefidisk.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index 959307a..0d0674b 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -241,7 +241,11 @@ mkdir $ROOTFS_MNT
 mkdir $BOOTFS_MNT
 
 mount -o loop $HDDIMG $HDDIMG_MNT
+if [ $? -ne 0 ]; then echo "ERROR: Failed to mount $HDDIMG"; fi
+
 mount -o loop $HDDIMG_MNT/rootfs.img $HDDIMG_ROOTFS_MNT
+if [ $? -ne 0 ]; then echo "ERROR: Failed to mount rootfs.img"; fi
+
 mount $ROOTFS $ROOTFS_MNT
 mount $BOOTFS $BOOTFS_MNT
 
-- 
2.0.0



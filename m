Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2585A6007B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2013 15:40:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 Oct 2013 08:37:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1013,1371106800"; d="scan'208";a="386280403"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.107])
	by orsmga001.jf.intel.com with ESMTP; 01 Oct 2013 08:40:11 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Oct 2013 08:40:11 -0700
Message-Id: <1380642011-14346-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] image.bbclass: ensure makedevs does return true
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
X-List-Received-Date: Tue, 01 Oct 2013 15:40:40 -0000

When doing an incremental image generation, ensure that makedevs returns true when it encounters
a node that already exists, otherwise image generation will fail.

[YOCTO #5288]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 7650594..463fa71 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -337,7 +337,7 @@ fakeroot do_rootfs () {
 		for devtable in ${@get_devtable_list(d)}; do
 			# Always return ture since there maybe already one when use the
 			# incremental image generation
-			makedevs -r ${IMAGE_ROOTFS} -D $devtable
+			makedevs -r ${IMAGE_ROOTFS} -D $devtable || true
 		done
 	fi
 
-- 
1.8.3.1



Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RpvPw-0003BI-O7
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 06:29:08 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 24 Jan 2012 21:21:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="99434794"
Received: from unknown (HELO localhost) ([10.255.14.109])
	by azsmga001.ch.intel.com with ESMTP; 24 Jan 2012 21:21:21 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Tom Zanussi <tom.zanussi@intel.com>
Date: Tue, 24 Jan 2012 21:20:54 -0800
Message-Id: <68ac20e3e44f7da9e9732c1dc38448c07708475e.1327468756.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1327468756.git.dvhart@linux.intel.com>
References: <cover.1327468756.git.dvhart@linux.intel.com>
Subject: [PATCH 1/1] bootimg: Fix a math thinko in the block count calculation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jan 2012 05:29:09 -0000

Fixes [YOCTO #1852] ... again.

The conversion from sectors to blocks was multiplying by 2 instead
of dividing by 2. Blocks are 1024 bytes, sectors are 512 bytes. The
result was images being much larger than intended.

Reported-by: Tom Zanussi <tom.zanussi@intel.com>
Signed-off-by: Darren Hart <dvhart@linux.intel.com>
CC: Joshua Lock <josh@linux.intel.com>
---
 meta/classes/bootimg.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index df3ee73..e65bef7 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -133,7 +133,7 @@ build_hddimg() {
 		SECTORS=$(expr $SECTORS + $(expr $DIR_SECTORS + $FAT_SECTORS))
 
 		# Determine the final size in blocks accounting for some padding
-		BLOCKS=$(expr $(expr $SECTORS \* 2) + ${BOOTIMG_EXTRA_SPACE})
+		BLOCKS=$(expr $(expr $SECTORS / 2) + ${BOOTIMG_EXTRA_SPACE})
 
 		# Ensure total sectors is an integral number of sectors per
 		# track or mcopy will complain. Sectors are 512 bytes, and we
-- 
1.7.6.5




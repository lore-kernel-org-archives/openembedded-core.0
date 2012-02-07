Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RuqSV-0006YO-NO
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 20:12:07 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 07 Feb 2012 10:14:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="64132628"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.5])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Feb 2012 10:14:40 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2012 18:14:34 +0000
Message-Id: <939c5725279d6af70f79b64e1945a27084517cc3.1328638222.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1328638222.git.paul.eggleton@linux.intel.com>
References: <cover.1328638222.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1328638222.git.paul.eggleton@linux.intel.com>
References: <cover.1328638222.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] classes/buildhistory: sort image file list
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
X-List-Received-Date: Tue, 07 Feb 2012 19:12:08 -0000

Sort the contents of files-in-image.txt to avoid unnecessary changes
showing up in the history due to reordering.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 69a9d02..3964247 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -310,7 +310,7 @@ buildhistory_get_image_installed() {
 buildhistory_get_imageinfo() {
 	# List the files in the image, but exclude date/time etc.
 	# This awk script is somewhat messy, but handles where the size is not printed for device files under pseudo
-	( cd ${IMAGE_ROOTFS} && find . -ls | awk '{ if ( $7 ~ /[0-9]/ ) printf "%s %10-s %10-s %10s %s %s %s\n", $3, $5, $6, $7, $11, $12, $13 ; else printf "%s %10-s %10-s %10s %s %s %s\n", $3, $5, $6, 0, $10, $11, $12 }' > ${BUILDHISTORY_DIR_IMAGE}/files-in-image.txt )
+	( cd ${IMAGE_ROOTFS} && find . -ls | awk '{ if ( $7 ~ /[0-9]/ ) printf "%s %10-s %10-s %10s %s %s %s\n", $3, $5, $6, $7, $11, $12, $13 ; else printf "%s %10-s %10-s %10s %s %s %s\n", $3, $5, $6, 0, $10, $11, $12 }' | sort -k5 > ${BUILDHISTORY_DIR_IMAGE}/files-in-image.txt )
 
 	# Record some machine-readable meta-information about the image
 	echo -n > ${BUILDHISTORY_DIR_IMAGE}/image-info.txt
-- 
1.7.5.4




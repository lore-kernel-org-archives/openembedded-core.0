Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Q0dOX-00027q-NQ
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Mar 2011 18:23:25 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 18 Mar 2011 10:21:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,206,1299484800"; d="scan'208";a="668776707"
Received: from unknown (HELO helios) ([10.255.12.183])
	by fmsmga002.fm.intel.com with SMTP; 18 Mar 2011 10:21:39 -0700
Received: by helios (sSMTP sendmail emulation); Fri, 18 Mar 2011 17:21:41 +0000
Message-Id: <e4306900908edf0baab8ac72b7c68101e4805239.1300467808.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1300467808.git.paul.eggleton@linux.intel.com>
References: <cover.1300467808.git.paul.eggleton@linux.intel.com>
Old-Date: Wed, 16 Mar 2011 12:02:35 +0000
Date: Fri, 18 Mar 2011 17:21:41 +0000
To: openembedded-core@lists.openembedded.org
CC: 
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] initscripts: Make umountfs a bit more robust, bump PR
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
X-List-Received-Date: Fri, 18 Mar 2011 17:23:26 -0000

From: Tom Rini <tom_rini@mentor.com>

Avoids error messages on shutdown.

Imported from OE commit 072cad0100fd828e7fee8f3fa3ade23e4306b394

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../initscripts/initscripts-1.0/umountfs           |    6 +++---
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/umountfs b/meta/recipes-core/initscripts/initscripts-1.0/umountfs
index 5c6793d..6ad0e43 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/umountfs
+++ b/meta/recipes-core/initscripts/initscripts-1.0/umountfs
@@ -16,9 +16,9 @@ swapoff -a
 
 # We leave /proc mounted.
 echo "Unmounting local filesystems..."
-mount -o remount,ro /mnt/ram
-umount -f -a -r
-
+grep -q /mnt/ram /proc/mounts && mount -o remount,ro /mnt/ram
 mount -o remount,ro /
 
+umount -f -a -r > /dev/null 2>&1
+
 : exit 0
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 1d2509e..d990925 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -6,7 +6,7 @@ DEPENDS = "makedevs"
 RDEPENDS_${PN} = "makedevs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-PR = "r123"
+PR = "r124"
 
 SRC_URI = "file://functions \
            file://halt \
-- 
1.7.1




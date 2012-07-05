Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SmqgZ-00066v-Ta
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 20:21:52 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Jul 2012 11:10:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="173821325"
Received: from unknown (HELO localhost) ([10.255.12.184])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jul 2012 11:10:40 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jul 2012 11:08:59 -0700
Message-Id: <4f44ff83fd87ca9ee470f3ee789bb5550aa5101a.1341511739.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Darren Hart <dvhart@linux.intel.com>, saul.wold@intel.com
Subject: [PATCH] bootimg: Use STAGING_KERNEL_DIR
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
X-List-Received-Date: Thu, 05 Jul 2012 18:21:52 -0000

bootimg.bbclass using STAGING_DIR_HOST/kernel instead of
STAGING_KERNEL_DIR, resulting in build failure of live images.

| install: cannot stat `/usr/local/dev/yocto/fishriver-test/build/tmp/sysroots/fishriver/kernel/bzImage': No such file or directory

Replace it with STAGING_KERNEL_DIR.

UNTESTED - PLEASE TEST PRIOR TO PULL.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
CC: tom.zanussi@intel.com
CC: saul.wold@intel.com
CC: nitin.a.kamble@intel.com
---
 meta/classes/bootimg.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index 370b378..a4c0e8d 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -63,7 +63,7 @@ populate() {
 	install -d ${DEST}
 
 	# Install bzImage, initrd, and rootfs.img in DEST for all loaders to use.
-	install -m 0644 ${STAGING_DIR_HOST}/kernel/bzImage ${DEST}/vmlinuz
+	install -m 0644 ${STAGING_KERNEL_DIR}/bzImage ${DEST}/vmlinuz
 
 	if [ -n "${INITRD}" ] && [ -s "${INITRD}" ]; then
 		install -m 0644 ${INITRD} ${DEST}/initrd
-- 
1.7.10.4




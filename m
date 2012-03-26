Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SC3qo-0003s4-VQ
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 08:56:23 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 25 Mar 2012 23:47:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="133089936"
Received: from unknown (HELO localhost.localdomain) ([10.255.15.253])
	by fmsmga001.fm.intel.com with ESMTP; 25 Mar 2012 23:47:23 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Mar 2012 23:47:06 -0700
Message-Id: <364f6a61d06cecb52e21639dc69f292a4b8a3591.1332744104.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1332744104.git.sgw@linux.intel.com>
References: <cover.1332744104.git.sgw@linux.intel.com>
In-Reply-To: <cover.1332744104.git.sgw@linux.intel.com>
References: <cover.1332744104.git.sgw@linux.intel.com>
Subject: [Build App RFC 3/5] boot-directdisk: Fix Block Calcuation
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
X-List-Received-Date: Mon, 26 Mar 2012 06:56:23 -0000

This also changes the timeout to be settable

The block calcuation was not correctly rounding, see comment

Thanks to Darren Hart for fixing this.

Cc: Darren Hart <dvhart@linux.intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/boot-directdisk.bbclass |   19 +++++++++++++------
 1 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index 893164f..e9e1ba3 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -37,9 +37,8 @@ BOOTDD_EXTRA_SPACE ?= "16384"
 # Get the build_syslinux_cfg() function from the syslinux class
 
 AUTO_SYSLINUXCFG = "1"
-LABELS = "boot"
 SYSLINUX_ROOT ?= "root=/dev/sda2"
-SYSLINUX_TIMEOUT = "10" # 1 second
+SYSLINUX_TIMEOUT ?= "10"
 
 SYSLINUXCFG  = "${HDDDIR}/syslinux.cfg"
 SYSLINUXMENU = "${HDDDIR}/menu"
@@ -55,15 +54,23 @@ build_boot_dd() {
 	install -m 444 ${STAGING_LIBDIR}/syslinux/ldlinux.sys ${HDDDIR}/ldlinux.sys
 
 	BLOCKS=`du -bks ${HDDDIR} | cut -f 1`
-	SIZE=`expr $BLOCKS + ${BOOTDD_EXTRA_SPACE}`
+	BLOCKS=`expr $BLOCKS + ${BOOTDD_EXTRA_SPACE}`
+
+	# Ensure total sectors is an integral number of sectors per
+	# track or mcopy will complain. Sectors are 512 bytes, and we
+	# generate images with 32 sectors per track. This calculation is
+	# done in blocks, thus the mod by 16 instead of 32.
+	BLOCKS=$(expr $BLOCKS + $(expr 16 - $(expr $BLOCKS % 16)))
+
+	mkdosfs -n ${BOOTDD_VOLUME_ID} -S 512 -C ${HDDIMG} $BLOCKS 
+	mcopy -i ${HDDIMG} -s ${HDDDIR}/* ::/
 
-	mkdosfs -n ${BOOTDD_VOLUME_ID} -d ${HDDDIR} -C ${HDDIMG} $SIZE 
 	syslinux ${HDDIMG}
 	chmod 644 ${HDDIMG}
 
 	ROOTFSBLOCKS=`du -Lbks ${ROOTFS} | cut -f 1`
-	TOTALSIZE=`expr $SIZE + $ROOTFSBLOCKS`
-	END1=`expr $SIZE \* 1024`
+	TOTALSIZE=`expr $BLOCKS + $ROOTFSBLOCKS`
+	END1=`expr $BLOCKS \* 1024`
 	END2=`expr $END1 + 512`
 	END3=`expr \( $ROOTFSBLOCKS \* 1024 \) + $END1`
 
-- 
1.7.7.6




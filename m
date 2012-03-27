Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SCPKB-0006em-KN
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 07:52:07 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 Mar 2012 22:43:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146024243"
Received: from unknown (HELO swold-mobl.domain.invalid) ([10.255.12.107])
	by fmsmga002.fm.intel.com with ESMTP; 26 Mar 2012 22:43:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Mar 2012 22:42:57 -0700
Message-Id: <d1260c2e8f4042d5e9a92be0f0f2660f8a80d241.1332826876.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1332826876.git.sgw@linux.intel.com>
References: <cover.1332826876.git.sgw@linux.intel.com>
In-Reply-To: <cover.1332826876.git.sgw@linux.intel.com>
References: <cover.1332826876.git.sgw@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 3/6] boot-directdisk: Fix Block Calcuation
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
X-List-Received-Date: Tue, 27 Mar 2012 05:52:07 -0000

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




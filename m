Return-Path: <dvhart@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AF4C960167
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 16:12:49 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 21 Jul 2014 09:12:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,702,1400050800"; d="scan'208";a="573144871"
Received: from dvhart-mac01.jf.intel.com (HELO localhost) ([10.24.5.55])
	by fmsmga002.fm.intel.com with ESMTP; 21 Jul 2014 09:12:50 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jul 2014 09:12:48 -0700
Message-Id: <ed4096687e8949bd92cef0034233fd9d70ca9856.1405959168.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH] mkefidisk.sh: Remove initrd entry for gummiboot
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
X-List-Received-Date: Mon, 21 Jul 2014 16:12:53 -0000

My previous patch adding gummiboot support was missing the line to
remove the initrd line from the boot config. This was an oversight in
copying over the grub setup to gummiboot. Add the necessary logic to
remove it.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/contrib/mkefidisk.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index 7ec373e..ba2b563 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -355,6 +355,7 @@ if [ -d "$GUMMI_ENTRIES" ]; then
 		echo "ERROR: $GUMMI_CFG not found"
 	fi
 
+	sed -i "/initrd /d" $GUMMI_CFG
 	sed -i "s@ root=[^ ]*@ @" $GUMMI_CFG
 	sed -i "s@options *LABEL=boot @options LABEL=Boot root=$TARGET_ROOTFS ro rootwait quiet @" $GUMMI_CFG
 fi
-- 
1.9.1



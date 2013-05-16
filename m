Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ud2oJ-0000qN-Fh
	for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 20:22:00 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 May 2013 11:03:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,685,1363158000"; d="scan'208";a="242589266"
Received: from unknown (HELO localhost.localdomain) ([10.255.12.48])
	by AZSMGA002.ch.intel.com with ESMTP; 16 May 2013 11:03:14 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 May 2013 21:03:05 +0300
Message-Id: <8b8b01c83be448811e256c3d894bf087f9169ef2.1368727195.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1368727195.git.sgw@linux.intel.com>
References: <cover.1368727195.git.sgw@linux.intel.com>
In-Reply-To: <cover.1368727195.git.sgw@linux.intel.com>
References: <cover.1368727195.git.sgw@linux.intel.com>
Subject: [PATCH 1/3] rpm-postinst: remove un-needed RDEPENDS on base-files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 May 2013 18:22:16 -0000
X-List-Received-Date: Thu, 16 May 2013 18:22:16 -0000
X-List-Received-Date: Thu, 16 May 2013 18:22:16 -0000

This was transferred un-intentionally when we split the rpm code,
the base-files then layed down additional files (specificaly /etc/mtab)
in the initramfs image and caused problems for the installer code.

Removing the RDEPENDS will fix the image generation issue and thus
the installer, so we will need to revert a previous patch that attempted
to fix the earlier issue #4229.

[YOCTO #4504]
[YOCTO #4229]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/rpm/rpm-postinsts.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/rpm/rpm-postinsts.bb b/meta/recipes-devtools/rpm/rpm-postinsts.bb
index 3d2d05d..3c0f520 100644
--- a/meta/recipes-devtools/rpm/rpm-postinsts.bb
+++ b/meta/recipes-devtools/rpm/rpm-postinsts.bb
@@ -3,8 +3,6 @@ SECTION = "core"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/LGPL-2.1;md5=1a6d268fd218675ffea8be556788b780"
 
-RDEPENDS_${PN} = "base-files"
-
 inherit allarch
 #
 # Allow distributions to alter when [postponed] package install scripts are run
-- 
1.8.0.2




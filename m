Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Qc1iC-0002rX-Ms
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 22:50:17 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Jun 2011 13:46:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,445,1304319600"; d="scan'208";a="21642960"
Received: from doubt.jf.intel.com (HELO localhost) ([10.7.199.165])
	by orsmga001.jf.intel.com with ESMTP; 29 Jun 2011 13:46:35 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: jiajun.xu@intel.com,
	openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2011 13:46:20 -0700
Message-Id: <df20387875e5ec669be2f84697fb439e2cc43eed.1309380310.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1309380310.git.dvhart@linux.intel.com>
References: <cover.1309380310.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1309380310.git.dvhart@linux.intel.com>
References: <cover.1309380310.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 1/1] kernel: move menuconfig task after configure
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
X-List-Received-Date: Wed, 29 Jun 2011 20:50:17 -0000

Fixes [YOCTO 1136]

linux-yocto adds some configure steps that are necessary to prepare the source
tree after the do_patch task. This causes a "-c menuconfig" to fail in a clean
build tree. Typical use of menuconfig should be to modify the config provided
by the recipe being built. It therefor makes sense for the menuconfig task to
come after the configure task. This also happens to fix the issue seen with the
linux-yocto kernel recipe.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/classes/kernel.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index fd27832..f282a57 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -194,7 +194,7 @@ do_menuconfig() {
 	fi
 }
 do_menuconfig[nostamp] = "1"
-addtask menuconfig after do_patch
+addtask menuconfig after do_configure
 
 pkg_postinst_kernel () {
 	cd /${KERNEL_IMAGEDEST}; update-alternatives --install /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
-- 
1.7.1




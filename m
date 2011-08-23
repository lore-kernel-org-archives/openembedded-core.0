Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Qvssg-0003Zs-PZ
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 17:27:11 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Aug 2011 08:22:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="41363338"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.18.129])
	by orsmga001.jf.intel.com with ESMTP; 23 Aug 2011 08:22:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Aug 2011 16:22:14 +0100
Message-Id: <d61dc1988ac39cc249f94588d5453e9b90298f75.1314112712.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1314112712.git.paul.eggleton@linux.intel.com>
References: <cover.1314112712.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1314112712.git.paul.eggleton@linux.intel.com>
References: <cover.1314112712.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] image.bbclass, kernel.bbclass: remove non-standard -n option from cp command
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
X-List-Received-Date: Tue, 23 Aug 2011 15:27:11 -0000

-n is not a POSIX option and does not work on some systems (e.g. Debian
Lenny); in any case it is not strictly necessary here, so remove it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/image.bbclass  |    2 +-
 meta/classes/kernel.bbclass |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 286ae01..bf8b73a 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -138,7 +138,7 @@ fakeroot do_rootfs () {
 	mkdir -p ${IMAGE_ROOTFS}
 	mkdir -p ${DEPLOY_DIR_IMAGE}
 
-	cp -n ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOY_DIR_IMAGE}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
+	cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOY_DIR_IMAGE}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
 
 	if [ "${USE_DEVFS}" != "1" ]; then
 		for devtable in ${@get_devtable_list(d)}; do
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index a2b10f2..c855268 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -501,7 +501,7 @@ kernel_do_deploy() {
 	rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.bin
 	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGE_SYMLINK_NAME}.bin
 
-	cp -n ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
+	cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
 }
 do_deploy[dirs] = "${DEPLOYDIR} ${B}"
 
-- 
1.7.4.1




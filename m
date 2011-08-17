Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Qtl4J-0001c0-U3
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 20:42:24 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Aug 2011 11:37:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,240,1312182000"; d="scan'208";a="39516515"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.18.37])
	by azsmga001.ch.intel.com with ESMTP; 17 Aug 2011 11:37:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Aug 2011 19:37:37 +0100
Message-Id: <8c4bf939c0906cd744debeb85d5d55de622c184e.1313606178.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1313606178.git.paul.eggleton@linux.intel.com>
References: <cover.1313606178.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1313606178.git.paul.eggleton@linux.intel.com>
References: <cover.1313606178.git.paul.eggleton@linux.intel.com>
Subject: [RFC PATCH 1/2] image.bbclass, kernel.bbclass: create warning file about deleting deploydir files
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
X-List-Received-Date: Wed, 17 Aug 2011 18:42:24 -0000

New users sometimes delete files in tmp/deploy/images assuming they will
be re-created just by re-running the build, and then are confused when
this doesn't work. To discourage people from doing this, create a file
called README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt in
tmp/deploy/images containing an explanation of what needs to be done to
re-create files there.

Fixes [YOCTO #1315] and [YOCTO #1346].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/image.bbclass      |    2 ++
 meta/classes/kernel.bbclass     |    2 ++
 meta/files/deploydir_readme.txt |    8 ++++++++
 3 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 meta/files/deploydir_readme.txt

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 54eb78b..286ae01 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -138,6 +138,8 @@ fakeroot do_rootfs () {
 	mkdir -p ${IMAGE_ROOTFS}
 	mkdir -p ${DEPLOY_DIR_IMAGE}
 
+	cp -n ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOY_DIR_IMAGE}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
+
 	if [ "${USE_DEVFS}" != "1" ]; then
 		for devtable in ${@get_devtable_list(d)}; do
 			makedevs -r ${IMAGE_ROOTFS} -D $devtable
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 386b05e..a2b10f2 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -500,6 +500,8 @@ kernel_do_deploy() {
 	cd ${DEPLOYDIR}
 	rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.bin
 	ln -sf ${KERNEL_IMAGE_BASE_NAME}.bin ${KERNEL_IMAGE_SYMLINK_NAME}.bin
+
+	cp -n ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOYDIR}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
 }
 do_deploy[dirs] = "${DEPLOYDIR} ${B}"
 
diff --git a/meta/files/deploydir_readme.txt b/meta/files/deploydir_readme.txt
new file mode 100644
index 0000000..97ec185
--- /dev/null
+++ b/meta/files/deploydir_readme.txt
@@ -0,0 +1,8 @@
+Files in the deploy directory will not be re-created automatically if you
+delete them. If you do delete a file, you will need to run:
+
+  bitbake -c clean TARGET
+  bitbake TARGET
+
+where TARGET is the name of the appropriate package or target e.g.
+"virtual/kernel" for the kernel, an image, etc.
-- 
1.7.4.1




Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eflanagan@envy.jf.intel.com>) id 1ScmQW-00047i-Ry
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 01:47:42 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 07 Jun 2012 16:37:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="154476663"
Received: from envy.jf.intel.com ([10.7.201.175])
	by orsmga002.jf.intel.com with ESMTP; 07 Jun 2012 16:37:07 -0700
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy.jf.intel.com (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id
	q57NbLtK006591 for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jun 2012 16:37:21 -0700
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id q57NbLxR006590
	for openembedded-core@lists.openembedded.org;
	Thu, 7 Jun 2012 16:37:21 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jun 2012 16:37:10 -0700
Message-Id: <5c02eb40c42c7195998ae0905a622c7dc06db158.1339111944.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <480358f458a7874b5705fc48547489d19a9df72c.1339111944.git.elizabeth.flanagan@intel.com>
References: <480358f458a7874b5705fc48547489d19a9df72c.1339111944.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1339111944.git.elizabeth.flanagan@intel.com>
References: <cover.1339111944.git.elizabeth.flanagan@intel.com>
Subject: [Consolidated Pull 22/22] rootfs_rpm.bbclass: save rpmlib rather than remove it
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
X-List-Received-Date: Thu, 07 Jun 2012 23:47:42 -0000

From: Robert Yang <liezhi.yang@windriver.com>

The rpmlib was removed when images that add
"remove_packaging_data_files" to ROOTFS_POSTPROCESS_COMMAND, which would
make the increment rpm image generation doesn't work in the second
build, since list_installed_packages would get incorrect value in the
second build, move the rpmlib to ${T} rather than remove it, and move it
back when INC_RPM_IMAGE_GEN =1.

[YOCTO #2440]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/image.bbclass      |    6 ++++++
 meta/classes/rootfs_rpm.bbclass |    6 +++++-
 2 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 573c905..fb932b9 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -143,6 +143,12 @@ fakeroot do_rootfs () {
     # When use the rpm incremental image generation, don't remove the rootfs
     if [ "${INC_RPM_IMAGE_GEN}" != "1" -o "${IMAGE_PKGTYPE}" != "rpm" ]; then
         rm -rf ${IMAGE_ROOTFS}
+    elif [ -d ${T}/saved_rpmlib/var/lib/rpm ]; then
+        # Move the rpmlib back
+        if [ ! -d ${IMAGE_ROOTFS}/var/lib/rpm ]; then
+                mkdir -p ${IMAGE_ROOTFS}/var/lib/
+                mv ${T}/saved_rpmlib/var/lib/rpm ${IMAGE_ROOTFS}/var/lib/
+        fi
     fi
 	rm -rf ${MULTILIB_TEMP_ROOTFS}
 	mkdir -p ${IMAGE_ROOTFS}
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 9039b21..fbc46c0 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -154,7 +154,11 @@ EOF
 }
 
 remove_packaging_data_files() {
-	rm -rf ${IMAGE_ROOTFS}${rpmlibdir}
+	# Save the rpmlib for increment rpm image generation
+	t="${T}/saved_rpmlib/var/lib"
+	rm -fr $t
+	mkdir -p $t
+	mv ${IMAGE_ROOTFS}${rpmlibdir} $t
 	rm -rf ${IMAGE_ROOTFS}${opkglibdir}
 }
 
-- 
1.7.5.4




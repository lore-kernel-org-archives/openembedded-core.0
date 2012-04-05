Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SFr03-0008DW-M6
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 20:01:36 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 05 Apr 2012 10:51:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="85766031"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.33])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Apr 2012 10:51:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Apr 2012 18:51:06 +0100
Message-Id: <423754db43c0ccea638c978dd243fd6b1ecb9125.1333648154.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1333648154.git.paul.eggleton@linux.intel.com>
References: <cover.1333648154.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1333648154.git.paul.eggleton@linux.intel.com>
References: <cover.1333648154.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] self-hosted-image: use Clearlooks theme
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
X-List-Received-Date: Thu, 05 Apr 2012 18:01:36 -0000

Use a nicer theme (Clearlooks) to improve Hob's appearance in the self
hosted image and fix the progress bar not changing colour when the build
fails.

Fixes [YOCTO #2208]

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/images/self-hosted-image.bb |    6 +++++-
 meta/recipes-core/tasks/task-self-hosted.bb   |    3 ++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/images/self-hosted-image.bb b/meta/recipes-core/images/self-hosted-image.bb
index 2a21967..62b09b1 100644
--- a/meta/recipes-core/images/self-hosted-image.bb
+++ b/meta/recipes-core/images/self-hosted-image.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PR = "r10"
+PR = "r11"
 
 IMAGE_FEATURES += "x11-mini package-management"
 
@@ -55,6 +55,10 @@ fakeroot do_populate_poky_src () {
 
 	# Allow builder to use sudo to setup tap/tun
 	echo "builder ALL=(ALL) NOPASSWD: ALL" >> ${IMAGE_ROOTFS}/etc/sudoers
+
+	# Use Clearlooks GTK+ theme
+	mkdir -p ${IMAGE_ROOTFS}/etc/gtk-2.0
+	echo 'gtk-theme-name = "Clearlooks"' > ${IMAGE_ROOTFS}/etc/gtk-2.0/gtkrc
 }
 
 IMAGE_PREPROCESS_COMMAND += "do_populate_poky_src; "
diff --git a/meta/recipes-core/tasks/task-self-hosted.bb b/meta/recipes-core/tasks/task-self-hosted.bb
index 87928b6..6a24a7f 100644
--- a/meta/recipes-core/tasks/task-self-hosted.bb
+++ b/meta/recipes-core/tasks/task-self-hosted.bb
@@ -3,7 +3,7 @@
 #
 
 DESCRIPTION = "Create Basic Image Tasks"
-PR = "r7"
+PR = "r8"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
@@ -194,4 +194,5 @@ RDEPENDS_task-self-hosted-graphics = "\
     libsdl-dev \
     libx11-dev \
     python-pygtk \
+    gtk-theme-clearlooks \
     "
-- 
1.7.5.4




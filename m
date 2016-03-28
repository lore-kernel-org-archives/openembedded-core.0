Return-Path: <juro.bystricky@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id BB97265CC2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 22:15:17 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 28 Mar 2016 15:15:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,408,1455004800"; d="scan'208";a="943231171"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga002.jf.intel.com with ESMTP; 28 Mar 2016 15:15:18 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Mar 2016 15:01:24 -0700
Message-Id: <1459202484-4746-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1459202484-4746-1-git-send-email-juro.bystricky@intel.com>
References: <1459202484-4746-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 1/1] build-appliance-image: Fix permissions
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
X-List-Received-Date: Mon, 28 Mar 2016 22:15:18 -0000

Explicitly set all permissions.
This fixes various problems such as:

Unable to create '/home/builder/poky/bitbake/lib/bb/pysh/pyshtables.py'
[Errno 22] invalid mode ('w') or filename '/home/builder/poky/bitbake/lib/bb/pysh/pyshtables.py'

and failure to create sub-directories in the directory 'poky':

mkdir: cannot create directory '<dir>': Invalid argument

While in there, added a few non-functional changes:
Added sample proxy settings into .bashrc
Added environmental variable with SRCREV actually used to populate the Build
Appliance into .bashrc (BA_SRCREV)

[YOCTO#9314]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 .../images/build-appliance-image_14.0.0.bb          | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/images/build-appliance-image_14.0.0.bb b/meta/recipes-core/images/build-appliance-image_14.0.0.bb
index 61f69f4..fb48657 100644
--- a/meta/recipes-core/images/build-appliance-image_14.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_14.0.0.bb
@@ -21,7 +21,7 @@ IMAGE_FSTYPES = "vmdk"
 
 inherit core-image
 
-SRCREV ?= "992e5774714ef44bc91d45e2aaf2acfc23c72d63"
+SRCREV ?= "b58e5b1fb3bcacbcfce17a748bca5f60c3528b4f"
 SRC_URI = "git://git.yoctoproject.org/poky \
            file://Yocto_Build_Appliance.vmx \
            file://Yocto_Build_Appliance.vmxf \
@@ -39,17 +39,16 @@ fakeroot do_populate_poky_src () {
 	rm -rf ${WORKDIR}/git/.git
 	rm -f ${WORKDIR}/git/.gitignore
 
-	cp -Rp ${WORKDIR}/git ${IMAGE_ROOTFS}/home/builder/poky
+	cp -R ${WORKDIR}/git ${IMAGE_ROOTFS}/home/builder/poky
 
 	mkdir -p ${IMAGE_ROOTFS}/home/builder/poky/build/conf
 	mkdir -p ${IMAGE_ROOTFS}/home/builder/poky/build/downloads
 	if [ ${BA_INCLUDE_SOURCES} != 0 ]; then
 		cp -RpL ${DL_DIR}/* ${IMAGE_ROOTFS}/home/builder/poky/build/downloads/
+		# Remove the git2_* tarballs -- this is ok since we still have the git2/.
+		rm -rf ${IMAGE_ROOTFS}/home/builder/poky/build/downloads/git2_*
 	fi
 
-	# Remove the git2_* tarballs -- this is ok since we still have the git2/.
-	rm -rf ${IMAGE_ROOTFS}/home/builder/poky/build/downloads/git2_*
-
 	echo "/usr/bin" > ${IMAGE_ROOTFS}/home/builder/poky/build/pseudodone
 	echo "INHERIT += \"rm_work\"" >> ${IMAGE_ROOTFS}/home/builder/poky/build/conf/auto.conf
 	mkdir -p ${IMAGE_ROOTFS}/home/builder/pseudo
@@ -57,9 +56,19 @@ fakeroot do_populate_poky_src () {
 	echo "export PSEUDO_LOCALSTATEDIR=/home/builder/pseudo" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
 	echo "export PSEUDO_LIBDIR=/usr/lib/pseudo/lib64" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
 
+	# Also save (for reference only) the actual SRCREV used to create this image
+	echo "export BA_SRCREV=${SRCREV}" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
+	echo "" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
+	echo "# If working behind a proxy and using the provided oe-git-proxy script" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
+	echo "# you need to set ALL_PROXY based on your proxy settings." >> ${IMAGE_ROOTFS}/home/builder/.bashrc
+	echo "# Example ALL_PROXY values:" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
+	echo "# export ALL_PROXY=https://proxy.example.com:8080" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
+	echo "# export ALL_PROXY=socks://socks.example.com:1080" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
+
 	chown builder.builder ${IMAGE_ROOTFS}/home/builder/pseudo
 
-	chown -R builder.builder  ${IMAGE_ROOTFS}/home/builder/poky
+	chown -R builder.builder ${IMAGE_ROOTFS}/home/builder/poky
+	chmod -R ug+rw ${IMAGE_ROOTFS}/home/builder/poky
 
 	# Allow builder to use sudo to setup tap/tun
 	echo "builder ALL=(ALL) NOPASSWD: ALL" >> ${IMAGE_ROOTFS}/etc/sudoers
-- 
1.9.1



Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 52BA9758E8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 05:09:57 +0000 (UTC)
Received: by iebmu5 with SMTP id mu5so17647620ieb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 22:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=P6ZvZ4ZmI+M4ndBurZPtOftDG68kwdV0wLm2Q4FB8fg=;
	b=Iaw+voCfJRt2It0mV0WyjFaQ7l9lF9WcuKztU4ZsePBdRHOs9bdECJQ/iltpLOTh+u
	B0oYiLbDVRV/pdmRWke84PMrRH2MKn/7U9a90+MPEOR5PikD3sTXSD+nvGttGh80ln1G
	xCkvxGLZiI5MTyRYO5HV9zHxRBqjbvB9PNlqR78sb0tIS5Q+virwaTipKT8+Joukd6UV
	pkM4R+p5VUP4MG3IZUl+gDdJO5Q2UCDrpbxH52PUL9TJOLhaJP+Uc6OaTUsUOVnWMCDs
	mrHJ3rquJ7SVR9SuIHnDlPiNVGoKFNsasXm9//DsZFSjvjS+48qNN27e7wdgSCqrnDR4
	NN2Q==
X-Received: by 10.42.142.66 with SMTP id r2mr14981066icu.87.1434085798662;
	Thu, 11 Jun 2015 22:09:58 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id fm3sm942215igb.1.2015.06.11.22.09.57
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 Jun 2015 22:09:57 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jun 2015 22:09:49 -0700
Message-Id: <1434085789-27225-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [RFC][PATCH] populate_sdk_base.bbclass: use pbzip2 to compress SDK tar file
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
X-List-Received-Date: Fri, 12 Jun 2015 05:10:00 -0000

Just a rough proof of concept, but the benefits seem worthwhile. Time to
run 'bitbake -c populate_sdk <myimage>' on a 12 core build server reduces
from 5m8 to 3m35.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/populate_sdk_base.bbclass        |  6 +++---
 meta/recipes-extended/pbzip2/pbzip2_1.1.12.bb | 27 +++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/pbzip2/pbzip2_1.1.12.bb

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 7f7a87f..f3a2e75 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -40,7 +40,7 @@ TOOLCHAIN_TARGET_TASK_ATTEMPTONLY ?= ""
 TOOLCHAIN_OUTPUTNAME ?= "${SDK_NAME}-toolchain-${SDK_VERSION}"
 
 SDK_RDEPENDS = "${TOOLCHAIN_TARGET_TASK} ${TOOLCHAIN_HOST_TASK}"
-SDK_DEPENDS = "virtual/fakeroot-native"
+SDK_DEPENDS = "virtual/fakeroot-native pbzip2-native"
 
 # We want the MULTIARCH_TARGET_SYS to point to the TUNE_PKGARCH, not PACKAGE_ARCH as it
 # could be set to the MACHINE_ARCH
@@ -108,13 +108,13 @@ fakeroot create_sdk_files() {
 	sed -i -e "s:##DEFAULT_INSTALL_DIR##:$escaped_sdkpath:" ${SDK_OUTPUT}/${SDKPATH}/relocate_sdk.py
 }
 
-SDKTAROPTS = "--owner=root --group=root -j"
+SDKTAROPTS = "--owner=root --group=root"
 
 fakeroot tar_sdk() {
 	# Package it up
 	mkdir -p ${SDK_DEPLOY}
 	cd ${SDK_OUTPUT}/${SDKPATH}
-	tar ${SDKTAROPTS} -c --file=${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2 .
+	tar ${SDKTAROPTS} -cf - . | pbzip2 > ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2
 }
 
 fakeroot create_shar() {
diff --git a/meta/recipes-extended/pbzip2/pbzip2_1.1.12.bb b/meta/recipes-extended/pbzip2/pbzip2_1.1.12.bb
new file mode 100644
index 0000000..fb70d0c
--- /dev/null
+++ b/meta/recipes-extended/pbzip2/pbzip2_1.1.12.bb
@@ -0,0 +1,27 @@
+SUMMARY = "PBZIP2 is a parallel implementation of bzip2"
+DESCRIPTION = "PBZIP2 is a parallel implementation of the bzip2 block-sorting \
+file compressor that uses pthreads and achieves near-linear speedup on SMP \
+machines. The output of this version is fully compatible with bzip2 v1.0.2 or \
+newer (ie: anything compressed with pbzip2 can be decompressed with bzip2)."
+HOMEPAGE = "http://compression.ca/pbzip2/"
+SECTION = "console/utils"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4c4f2edec9679d5abef3514a816b54a4"
+
+DEPENDS = "bzip2"
+
+SRC_URI = "https://launchpad.net/${BPN}/1.1/${PV}/+download/${BP}.tar.gz"
+
+SRC_URI[md5sum] = "91a4911b13305850423840eb0fa6f4f9"
+SRC_URI[sha256sum] = "573bb358a5a7d3bf5f42f881af324cedf960c786e8d66dd03d448ddd8a0166ee"
+
+do_configure[noexec] = "1"
+
+EXTRA_OEMAKE = "CXX='${CXX} ${CXXFLAGS}' LDFLAGS='${LDFLAGS}'"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 pbzip2 ${D}${bindir}/
+}
+
+BBCLASSEXTEND = "native"
-- 
1.9.1



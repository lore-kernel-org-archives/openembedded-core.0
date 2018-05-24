Return-Path: <kamel.hacene@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id 7335D605C3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 21:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id 8B97A1EE2747;
	Thu, 24 May 2018 23:23:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id fzUmxi2l1VxA; Thu, 24 May 2018 23:23:55 +0200 (CEST)
Received: from chamow.localdomain (unknown [88.191.40.239])
	by idris.smile.fr (Postfix) with ESMTPA id 71ACA1EE271B;
	Thu, 24 May 2018 23:23:55 +0200 (CEST)
From: Kamel Hacene <kamel.hacene@smile.fr>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2018 23:27:55 +0200
Message-Id: <20180524212755.3124-1-kamel.hacene@smile.fr>
X-Mailer: git-send-email 2.16.2
Subject: [PATCH] image_types: improve reproducibility of .cpio files.
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
X-List-Received-Date: Thu, 24 May 2018 21:30:29 -0000

When BUILD_REPRODUCIBLE_BINARIES is set, run cpio command with the
--reproducible flag and set the timestamp of the created /init file to
REPRODUCIBLE_TIMESTAMP_ROOTFS in accordance with reproducible_final_image_task
in image.bbclass.

Signed-off-by: Kamel Hacene <kamel.hacene@smile.fr>
---
 meta/classes/image_types.bbclass | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 00a00d318f..345dba5358 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -127,9 +127,16 @@ IMAGE_CMD_TAR ?= "tar"
 # ignore return code 1 "file changed as we read it" as other tasks(e.g. do_image_wic) may be hardlinking rootfs
 IMAGE_CMD_tar = "${IMAGE_CMD_TAR} --numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
 
+# Extra options given to the cpio command
+CPIO_EXTRA_OPTS ?= ""
+CPIO_EXTRA_OPTS += "${@'--reproducible' if d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1' else ''}"
 do_image_cpio[cleandirs] += "${WORKDIR}/cpio_append"
 IMAGE_CMD_cpio () {
-	(cd ${IMAGE_ROOTFS} && find . | cpio -o -H newc >${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
+	# Ensure cpio provides --reproducible option if generating a reproducible binary
+	if [ "$BUILD_REPRODUCIBLE_BINARIES" = "1" ] && ! cpio --help | grep -q "\-\-reproducible"; then
+		bbfatal "cpio v2.12 or higher is required to generate a reproducible binary. Upgrade your host's cpio command or use oe's cpio recipe by adding a depend to cpio-native in your image."
+	fi
+	(cd ${IMAGE_ROOTFS} && find . | cpio ${CPIO_EXTRA_OPTS} -o -H newc >${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
 	# We only need the /init symlink if we're building the real
 	# image. The -dbg image doesn't need it! By being clever
 	# about this we also avoid 'touch' below failing, as it
@@ -142,7 +149,10 @@ IMAGE_CMD_cpio () {
 			else
 				touch ${WORKDIR}/cpio_append/init
 			fi
-			(cd  ${WORKDIR}/cpio_append && echo ./init | cpio -oA -H newc -F ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
+			if [ "$BUILD_REPRODUCIBLE_BINARIES" = "1" ]; then
+				touch --no-dereference --date=@${REPRODUCIBLE_TIMESTAMP_ROOTFS} ${WORKDIR}/cpio_append/init
+			fi
+			(cd  ${WORKDIR}/cpio_append && echo ./init | cpio ${CPIO_EXTRA_OPTS} -oA -H newc -F ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
 		fi
 	fi
 }
-- 
2.16.2



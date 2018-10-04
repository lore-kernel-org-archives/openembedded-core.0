Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 276C07503E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 06:40:31 +0000 (UTC)
Received: from mail1.siemens.de (mail1.siemens.de [139.23.33.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w946eWl1023069
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Oct 2018 08:40:32 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.50.201])
	by mail1.siemens.de (8.15.2/8.15.2) with ESMTP id w946eWbw011083;
	Thu, 4 Oct 2018 08:40:32 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id DF254997B1D;
	Thu,  4 Oct 2018 08:40:30 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Oct 2018 08:40:04 +0200
Message-Id: <20181004064004.4633-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] populate_sdk_base: move template files location to variables
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
X-List-Received-Date: Thu, 04 Oct 2018 06:40:32 -0000

Let users to use custom toolchain template files instead of overloading
the whole function.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/classes/populate_sdk_base.bbclass | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index e07ad0cc6b..d9a391c613 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -228,14 +228,17 @@ fakeroot tar_sdk() {
 	tar ${SDKTAROPTS} -cf - . | xz -T 0 > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.tar.xz
 }
 
+TOOLCHAIN_SHAR_EXT_TMPL ?= "${COREBASE}/meta/files/toolchain-shar-extract.sh"
+TOOLCHAIN_SHAR_REL_TMPL ?= "${COREBASE}/meta/files/toolchain-shar-relocate.sh"
+
 fakeroot create_shar() {
 	# copy in the template shar extractor script
-	cp ${COREBASE}/meta/files/toolchain-shar-extract.sh ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.sh
+	cp ${TOOLCHAIN_SHAR_EXT_TMPL} ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.sh
 
 	rm -f ${T}/pre_install_command ${T}/post_install_command
 
 	if [ ${SDK_RELOCATE_AFTER_INSTALL} -eq 1 ] ; then
-		cp ${COREBASE}/meta/files/toolchain-shar-relocate.sh ${T}/post_install_command
+		cp ${TOOLCHAIN_SHAR_REL_TMPL} ${T}/post_install_command
 	fi
 	cat << "EOF" >> ${T}/pre_install_command
 ${SDK_PRE_INSTALL_COMMAND}
@@ -299,8 +302,8 @@ def sdk_variables(d):
 
 do_populate_sdk[vardeps] += "${@sdk_variables(d)}"
 
-do_populate_sdk[file-checksums] += "${COREBASE}/meta/files/toolchain-shar-relocate.sh:True \
-                                    ${COREBASE}/meta/files/toolchain-shar-extract.sh:True"
+do_populate_sdk[file-checksums] += "${TOOLCHAIN_SHAR_REL_TMPL}:True \
+                                    ${TOOLCHAIN_SHAR_EXT_TMPL}:True"
 
 do_populate_sdk[dirs] = "${PKGDATA_DIR} ${TOPDIR}"
 do_populate_sdk[depends] += "${@' '.join([x + ':do_populate_sysroot' for x in d.getVar('SDK_DEPENDS').split()])}  ${@d.getVarFlag('do_rootfs', 'depends', False)}"
-- 
2.11.0



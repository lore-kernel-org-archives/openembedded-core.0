Return-Path: <andrej.valek@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 0679479D66
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Nov 2018 08:43:44 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id wA78hh0t006019
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Wed, 7 Nov 2018 09:43:43 +0100
Received: from dev.vm6.ccp.siemens.com ([163.242.52.58])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id wA78hhBl019845;
	Wed, 7 Nov 2018 09:43:43 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 250268F08A5;
	Wed,  7 Nov 2018 09:43:43 +0100 (CET)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Nov 2018 09:43:05 +0100
Message-Id: <20181107084305.13375-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] rootfs: ensure that packages in IMAGE_INSTALL_DEBUGFS are existing
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
X-List-Received-Date: Wed, 07 Nov 2018 08:43:45 -0000

Ensure that additional packages in IMAGE_INSTALL_DEBUGFS are available
before installation.

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 452b1ad391..ecb903ee37 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -24,7 +24,7 @@ POPULATE_SDK_POST_TARGET_COMMAND += "rootfs_sysroot_relativelinks; "
 LICENSE ?= "MIT"
 PACKAGES = ""
 DEPENDS += "${@' '.join(["%s-qemuwrapper-cross" % m for m in d.getVar("MULTILIB_VARIANTS").split()])} qemuwrapper-cross depmodwrapper-cross cross-localedef-native"
-RDEPENDS += "${PACKAGE_INSTALL} ${LINGUAS_INSTALL}"
+RDEPENDS += "${PACKAGE_INSTALL} ${LINGUAS_INSTALL} ${IMAGE_INSTALL_DEBUGFS}"
 RRECOMMENDS += "${PACKAGE_INSTALL_ATTEMPTONLY}"
 PATH_prepend = "${@":".join(all_multilib_tune_values(d, 'STAGING_BINDIR_CROSS').split())}:"
 
-- 
2.11.0



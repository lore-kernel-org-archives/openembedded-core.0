Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 15DA571B16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 23:36:56 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id C9709B89FD2; Thu,  1 Dec 2016 00:36:52 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2016 00:36:51 +0100
Message-Id: <1480549011-12168-5-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480549011-12168-1-git-send-email-obi@opendreambox.org>
References: <1480549011-12168-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 5/5] kernel.bbclass: fix kernel_do_compile for KERNEL_IMAGETYPE = "vmlinux.gz" on mips
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
X-List-Received-Date: Wed, 30 Nov 2016 23:36:56 -0000

The target directory didn't exist.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/classes/kernel.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index b21cdbc..d07f69c 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -264,6 +264,7 @@ kernel_do_compile() {
 		oe_runmake ${typeformake} CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
 		for type in ${KERNEL_IMAGETYPES} ; do
 			if test "${typeformake}.gz" = "${type}"; then
+				mkdir -p "${KERNEL_OUTPUT_DIR}"
 				gzip -9c < "${typeformake}" > "${KERNEL_OUTPUT_DIR}/${type}"
 				break;
 			fi
-- 
2.7.4



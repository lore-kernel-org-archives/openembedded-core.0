Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3FBB271AFE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 23:36:54 +0000 (UTC)
Received: by t510.zcs.saftware.de (Postfix, from userid 1000)
	id 6F592B8A4A1; Thu,  1 Dec 2016 00:36:52 +0100 (CET)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2016 00:36:50 +0100
Message-Id: <1480549011-12168-4-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480549011-12168-1-git-send-email-obi@opendreambox.org>
References: <1480549011-12168-1-git-send-email-obi@opendreambox.org>
Subject: [PATCH 4/5] kernel.bbclass: do not copy bundled initramfs to /boot
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

These files cause warnings because they don't get packaged, now that they
don't land in kernel-vmlinux anymore.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/classes/kernel.bbclass | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 634553c..b21cdbc 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -235,12 +235,6 @@ do_bundle_initramfs () {
 				mv -f ${KERNEL_OUTPUT_DIR}/$type.bak ${KERNEL_OUTPUT_DIR}/$type
 			fi
 		done
-		# Update install area
-		for type in ${KERNEL_IMAGETYPES} ; do
-			echo "There is kernel image bundled with initramfs: ${B}/${KERNEL_OUTPUT_DIR}/$type.initramfs"
-			install -m 0644 ${B}/${KERNEL_OUTPUT_DIR}/$type.initramfs ${D}/boot/$type-initramfs-${MACHINE}.bin
-			echo "${B}/${KERNEL_OUTPUT_DIR}/$type.initramfs"
-		done
 	fi
 }
 do_bundle_initramfs[dirs] = "${B}"
-- 
2.7.4



Return-Path: <mylene.josserand@free-electrons.com>
X-Greylist: delayed 338 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 12 Apr 2017 20:09:34 UTC
Received: from mail.free-electrons.com (mail.free-electrons.com [62.4.15.54])
	by mail.openembedded.org (Postfix) with ESMTP id EA3E577D03
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 20:09:34 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 110)
	id 237322075C; Wed, 12 Apr 2017 22:03:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from dell-desktop.home (vlr31-1-88-188-122-34.fbx.proxad.net
	[88.188.122.34])
	by mail.free-electrons.com (Postfix) with ESMTPSA id C2D09203CE;
	Wed, 12 Apr 2017 22:03:45 +0200 (CEST)
From: =?UTF-8?q?Myl=C3=A8ne=20Josserand?= <mylene.josserand@free-electrons.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Apr 2017 22:03:08 +0200
Message-Id: <20170412200308.3452-1-mylene.josserand@free-electrons.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] meta: classes: Add building dir to uImage creation
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
X-List-Received-Date: Wed, 12 Apr 2017 20:09:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On the do_uboot_mkimage task from kernel-uimage.bbclass, in case
KEEPUIMAGE is different than the default "yes" value, the uboot-mkimage
command fails because the path of the created uImage does not exist.

On this task, we are under the BUILDDIR so there is no folder arch/<ARCH>/boot.
Add the ${B} (for kernel build directory) as prefix to this folder fixes the problem.

Signed-off-by: Mylène Josserand <mylene.josserand@free-electrons.com>

diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uimage.bbclass
index e2e9b63..19c6ade 100644
--- a/meta/classes/kernel-uimage.bbclass
+++ b/meta/classes/kernel-uimage.bbclass
@@ -28,7 +28,7 @@ do_uboot_mkimage() {
 					awk '$3=="${UBOOT_ENTRYSYMBOL}" {print $1}'`
 			fi
 
-			uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C "${linux_comp}" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
+			uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C "${linux_comp}" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${B}/arch/${ARCH}/boot/uImage
 			rm -f linux.bin
 		fi
 	fi
-- 
2.7.4



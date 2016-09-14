Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
	[74.201.84.163])
	by mail.openembedded.org (Postfix) with ESMTP id F0502731F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 17:12:58 +0000 (UTC)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
	with SMTPS id 147387317675268.31181850446842;
	Wed, 14 Sep 2016 10:12:56 -0700 (PDT)
From: Patrick Williams <patrick@stwcx.xyz>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2016 12:12:52 -0500
Message-Id: <20160914171252.17773-1-patrick@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH] util-linux: split {mkfs, fsck}.minix into packages
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
X-List-Received-Date: Wed, 14 Sep 2016 17:13:00 -0000

mkfs.minix and fsck.minix are likely rarely used, so split
them into their own packages to reduce the footprint of
util-linux.  This follows the pattern of cramfs support
within util-linux.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 meta/recipes-core/util-linux/util-linux.inc | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index bf770d8..4df8d5a 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -31,7 +31,9 @@ PACKAGES =+ "util-linux-agetty util-linux-fdisk util-linux-cfdisk util-linux-sfd
              util-linux-mount util-linux-readprofile util-linux-uuidd \
              util-linux-uuidgen util-linux-lscpu util-linux-fsck util-linux-blkid \
              util-linux-mkfs util-linux-mcookie util-linux-reset \
-             util-linux-mkfs.cramfs util-linux-fsck.cramfs util-linux-fstrim \
+             util-linux-mkfs.cramfs util-linux-fsck.cramfs \
+             util-linux-mkfs.minix util-linux-fsck.minix \
+             util-linux-fstrim \
              util-linux-partx util-linux-hwclock util-linux-mountpoint \
              util-linux-findfs util-linux-getopt util-linux-sulogin util-linux-prlimit"
 PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', 'util-linux-pylibmount', '', d)}"
@@ -96,9 +98,12 @@ FILES_util-linux-pylibmount = "${PYTHON_SITEPACKAGES_DIR}/libmount/pylibmount.so
                                ${PYTHON_SITEPACKAGES_DIR}/libmount/__pycache__/*"
 FILES_util-linux-lscpu = "${bindir}/lscpu"
 
-FILES_util-linux-fsck = "${base_sbindir}/fsck*"
+FILES_util-linux-fsck = "${base_sbindir}/fsck ${base_sbindir}/fsck.${BPN}"
 FILES_util-linux-mkfs = "${sbindir}/mkfs"
 
+FILES_util-linux-fsck.minix = "${base_sbindir}/fsck.minix ${base_sbindir}/fsck.minix.${BPN}"
+FILES_util-linux-mkfs.minix = "${base_sbindir}/mkfs.minix ${base_sbindir}/mkfs.minix.${BPN}"
+
 FILES_util-linux-fsck.cramfs = "${sbindir}/fsck.cramfs"
 FILES_util-linux-mkfs.cramfs = "${sbindir}/mkfs.cramfs"
 
@@ -248,7 +253,8 @@ ALTERNATIVE_util-linux-swaponoff = "swapoff swapon"
 ALTERNATIVE_LINK_NAME[swapoff] = "${base_sbindir}/swapoff"
 ALTERNATIVE_LINK_NAME[swapon] = "${base_sbindir}/swapon"
 
-ALTERNATIVE_util-linux-fsck = "fsck.minix fsck"
+ALTERNATIVE_util-linux-fsck.minix = "fsck.minix"
+ALTERNATIVE_util-linux-fsck = "fsck"
 ALTERNATIVE_LINK_NAME[fsck.minix] = "${base_sbindir}/fsck.minix"
 ALTERNATIVE_LINK_NAME[fsck] = "${base_sbindir}/fsck"
 
-- 
2.9.0




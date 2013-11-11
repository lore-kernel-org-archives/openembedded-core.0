Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 635D56D7D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 11:57:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rABBv5iq004476
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 11 Nov 2013 03:57:05 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Mon, 11 Nov 2013 03:57:04 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Nov 2013 19:56:54 +0800
Message-ID: <47a3d3ce3a8b52053dba8f8d934ac03dc26a4978.1384170897.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1384170897.git.hongxu.jia@windriver.com>
References: <cover.1384170897.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/1] kernel-grub.bbclass: support /boot area within root partition
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
X-List-Received-Date: Mon, 11 Nov 2013 11:57:05 -0000
Content-Type: text/plain

Previously, it supported the situation that /boot area with separate boot
partition:
...
menuentry "Update bzImage-3.10.10-WR6.0.0.0_standard-3.10" {
    set root=(hd0,1)
    linux /bzImage-3.10.10-WR6.0.0.0_standard root=/dev/sdb1 rw ip=dhcp
}
...

But didn't consider the situation that /boot within root partition:
...
menuentry "Update bzImage-3.10.10-WR6.0.0.0_standard-3.10" {
    set root=(hd0,1)
    linux /boot/bzImage-3.10.10-WR6.0.0.0_standard root=/dev/sdb1 rw ip=dhcp
}
...

This fix supported them both.
[YOCTO #5514]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/kernel-grub.bbclass | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel-grub.bbclass b/meta/classes/kernel-grub.bbclass
index 70564f0..85721ff 100644
--- a/meta/classes/kernel-grub.bbclass
+++ b/meta/classes/kernel-grub.bbclass
@@ -40,10 +40,11 @@ pkg_preinst_kernel-image_append () {
 pkg_postinst_kernel-image_prepend () {
 	get_new_grub_cfg() {
 		grubcfg="$1"
+		old_image="$2"
 		title="Update ${KERNEL_IMAGETYPE}-${KERNEL_VERSION}-${PV}"
 		if [ "${grubcfg##*/}" = "grub.cfg" ]; then
 			rootfs=`grep " *linux \+[^ ]\+ \+root=" $grubcfg -m 1 | \
-				 sed "s# *linux \+[^ ]\+ \+root=#    linux /${KERNEL_IMAGETYPE}-${KERNEL_VERSION} root=#"`
+				 sed "s#${old_image}#${old_image%/*}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}#"`
 
 			echo "menuentry \"$title\" {"
 			echo "    set root=(hd0,1)"
@@ -51,7 +52,7 @@ pkg_postinst_kernel-image_prepend () {
 			echo "}"
 		elif [ "${grubcfg##*/}" = "menu.list" ]; then
 			rootfs=`grep "kernel \+[^ ]\+ \+root=" $grubcfg -m 1 | \
-				 sed "s#kernel \+[^ ]\+ \+root=#kernel /${KERNEL_IMAGETYPE}-${KERNEL_VERSION} root=#"`
+				 sed "s#${old_image}#${old_image%/*}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}#"`
 
 			echo "default 0"
 			echo "timeout 30"
@@ -79,9 +80,9 @@ pkg_postinst_kernel-image_prepend () {
 	fi
 
 	# Don't update grubcfg at first install while old bzImage doesn't exist.
-	if [ -f "$D/boot/$old_image" ]; then
+	if [ -f "$D/boot/${old_image##*/}" ]; then
 		grubcfgtmp="$grubcfg.tmp"
-		get_new_grub_cfg "$grubcfg"  > $grubcfgtmp
+		get_new_grub_cfg "$grubcfg" "$old_image"  > $grubcfgtmp
 		get_old_grub_cfg "$grubcfg" >> $grubcfgtmp
 		mv $grubcfgtmp $grubcfg
 		echo "Caution! Update kernel may affect kernel-module!"
-- 
1.8.1.2



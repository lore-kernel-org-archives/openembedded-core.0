Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 40F9461016
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2013 09:26:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8C9Q2On024942
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Sep 2013 02:26:02 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 12 Sep 2013 02:26:01 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Sep 2013 17:25:56 +0800
Message-ID: <732e1a82d56c4355c0bae26ed5aec0151b5adb1a.1378977276.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1378977276.git.hongxu.jia@windriver.com>
References: <cover.1378977276.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: cxu@windriver.com
Subject: [PATCH 1/1] kernel.bbclass: Need a method to install/update for bzImage
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
X-List-Received-Date: Thu, 12 Sep 2013 09:26:02 -0000
Content-Type: text/plain

While installing a rpm to update kernel on a deployed target, it will update
the boot area and the boot menu with the kernel as the priority but allow
you to fall back to the original kernel as well.

- In pre-install script, it backs up original kernel to avoid confliction with
  new one.
- In post-install script, it updates the new kernel as the boot priority.

[YOCTO #4104]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/kernel.bbclass | 65 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index e039dfc..f0dd679 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -263,7 +263,72 @@ ALLOW_EMPTY_kernel-image = "1"
 ALLOW_EMPTY_kernel-modules = "1"
 DESCRIPTION_kernel-modules = "Kernel modules meta package"
 
+pkg_preinst_kernel-image () {
+	if [ -z "$D" ]; then
+		# Parsing confliction
+		[ -f /boot/grub/menu.list ] && grubcfg="/boot/grub/menu.list"
+		[ -f /boot/grub/grub.cfg ] && grubcfg="/boot/grub/grub.cfg"
+		if [ -n "$grubcfg" ]; then
+			# Dereference symlink to avoid confliction with new kernel name.
+			if grep -q "/${KERNEL_IMAGETYPE} root=" $grubcfg; then
+				kimage=`realpath /boot/${KERNEL_IMAGETYPE}`;
+				sed -i "s#${KERNEL_IMAGETYPE} root=#${kimage##*/} root=#" $grubcfg
+			fi
+
+			# Rename old kernel if it conflicts with new kernel name.
+			if grep -q "/${KERNEL_IMAGETYPE}-${KERNEL_VERSION} root=" $grubcfg; then
+				timestamp=`date +%s`
+				kimage="/boot/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}-$timestamp-back"
+				sed -i "s#${KERNEL_IMAGETYPE}-${KERNEL_VERSION} root=#${kimage##*/} root=#" $grubcfg
+				mv /boot/${KERNEL_IMAGETYPE}-${KERNEL_VERSION} $kimage
+			fi
+		fi
+	fi
+}
+
 pkg_postinst_kernel-image () {
+	get_new_grub_cfg() {
+		title="Update ${KERNEL_IMAGETYPE}-${KERNEL_VERSION}-${PV}"
+		if [ -f /boot/grub/grub.cfg ]; then
+			rootfs=`grep " *linux [^ ].* root=" /boot/grub/grub.cfg -m 1 | \
+				 sed "s# *linux [^ ].* root=#    linux /${KERNEL_IMAGETYPE}-${KERNEL_VERSION} root=#"`
+
+			echo "menuentry \"$title\" {"
+			echo "    set root=(hd0,1)"
+			echo "$rootfs"
+			echo "}"
+		elif [ -f /boot/grub/menu.list ] ; then
+			rootfs=`grep "kernel [^ ].* root=" /boot/grub/menu.list -m 1 | \
+				 sed "s#kernel [^ ].* root=#kernel /${KERNEL_IMAGETYPE}-${KERNEL_VERSION} root=#"`
+
+			echo "default 0"
+			echo "timeout 30"
+			echo "title $title"
+			echo "root  (hd0,0)"
+			echo "$rootfs"
+		fi
+	}
+
+	get_old_grub_cfg() {
+		if [ -f /boot/grub/grub.cfg ]; then
+			cat /boot/grub/grub.cfg
+		elif [ -f /boot/grub/menu.list ] ; then
+			cat /boot/grub/menu.list | sed -e '/^default/d' -e '/^timeout/d'
+		fi
+	}
+
+	if [ -z "$D" ]; then
+		[ -f /boot/grub/menu.list ] && grubcfg="/boot/grub/menu.list"
+		[ -f /boot/grub/grub.cfg ] && grubcfg="/boot/grub/grub.cfg"
+		if [ -n "$grubcfg" ]; then
+			grubcfgtmp="$grubcfg.tmp"
+			get_new_grub_cfg  > $grubcfgtmp
+			get_old_grub_cfg >> $grubcfgtmp
+			mv $grubcfgtmp $grubcfg
+			echo "Caution! Update kernel may affect kernel-module!"
+		fi
+	fi
+
 	update-alternatives --install /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
 	if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
 		mkdir -p $D/lib/modules/${KERNEL_VERSION}
-- 
1.8.1.2



Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 81BB16D1E4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 02:45:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9I2jd03026855
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 17 Oct 2013 19:45:39 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 17 Oct 2013 19:45:39 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Oct 2013 10:45:35 +0800
Message-ID: <e3ebf78eb8e435eda3b1381e9fd96c194ace2a83.1382063996.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1382063996.git.hongxu.jia@windriver.com>
References: <cover.1382063996.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/1] kernel-grub.bbclass: add a method to install/update for bzImage
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
X-List-Received-Date: Fri, 18 Oct 2013 02:45:38 -0000
Content-Type: text/plain

While installing a rpm to update kernel on a deployed target, it will update
the boot area and the boot menu with the kernel as the priority but allow
you to fall back to the original kernel as well.

- In kernel-image's preinstall scriptlet, it backs up original kernel to avoid
  probable confliction with the new one.
- In kernel-image's postinstall scriptlet, it modify grub's config file to
  updates the new kernel as the boot priority.

[YOCTO #4104]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/kernel-grub.bbclass | 90 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)
 create mode 100644 meta/classes/kernel-grub.bbclass

diff --git a/meta/classes/kernel-grub.bbclass b/meta/classes/kernel-grub.bbclass
new file mode 100644
index 0000000..70564f0
--- /dev/null
+++ b/meta/classes/kernel-grub.bbclass
@@ -0,0 +1,90 @@
+#
+# While installing a rpm to update kernel on a deployed target, it will update
+# the boot area and the boot menu with the kernel as the priority but allow
+# you to fall back to the original kernel as well.
+#
+# - In kernel-image's preinstall scriptlet, it backs up original kernel to avoid
+#   probable confliction with the new one.
+#
+# - In kernel-image's postinstall scriptlet, it modifies grub's config file to
+#   updates the new kernel as the boot priority.
+#
+
+pkg_preinst_kernel-image_append () {
+	# Parsing confliction
+	[ -f "$D/boot/grub/menu.list" ] && grubcfg="$D/boot/grub/menu.list"
+	[ -f "$D/boot/grub/grub.cfg" ] && grubcfg="$D/boot/grub/grub.cfg"
+	if [ -n "$grubcfg" ]; then
+		# Dereference symlink to avoid confliction with new kernel name.
+		if grep -q "/${KERNEL_IMAGETYPE} \+root=" $grubcfg; then
+			if [ -L "$D/boot/${KERNEL_IMAGETYPE}" ]; then
+				kimage=`realpath $D/boot/${KERNEL_IMAGETYPE} 2>/dev/null`
+				if [ -f "$D$kimage" ]; then
+					sed -i "s:${KERNEL_IMAGETYPE} \+root=:${kimage##*/} root=:" $grubcfg
+				fi
+			fi
+		fi
+
+		# Rename old kernel if it conflicts with new kernel name.
+		if grep -q "/${KERNEL_IMAGETYPE}-${KERNEL_VERSION} \+root=" $grubcfg; then
+			if [ -f "$D/boot/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}" ]; then
+				timestamp=`date +%s`
+				kimage="$D/boot/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}-$timestamp-back"
+				sed -i "s:${KERNEL_IMAGETYPE}-${KERNEL_VERSION} \+root=:${kimage##*/} root=:" $grubcfg
+				mv "$D/boot/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}" "$kimage"
+			fi
+		fi
+	fi
+}
+
+pkg_postinst_kernel-image_prepend () {
+	get_new_grub_cfg() {
+		grubcfg="$1"
+		title="Update ${KERNEL_IMAGETYPE}-${KERNEL_VERSION}-${PV}"
+		if [ "${grubcfg##*/}" = "grub.cfg" ]; then
+			rootfs=`grep " *linux \+[^ ]\+ \+root=" $grubcfg -m 1 | \
+				 sed "s# *linux \+[^ ]\+ \+root=#    linux /${KERNEL_IMAGETYPE}-${KERNEL_VERSION} root=#"`
+
+			echo "menuentry \"$title\" {"
+			echo "    set root=(hd0,1)"
+			echo "$rootfs"
+			echo "}"
+		elif [ "${grubcfg##*/}" = "menu.list" ]; then
+			rootfs=`grep "kernel \+[^ ]\+ \+root=" $grubcfg -m 1 | \
+				 sed "s#kernel \+[^ ]\+ \+root=#kernel /${KERNEL_IMAGETYPE}-${KERNEL_VERSION} root=#"`
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
+		grubcfg="$1"
+		if [ "${grubcfg##*/}" = "grub.cfg" ]; then
+			cat "$grubcfg"
+		elif [ "${grubcfg##*/}" = "menu.list" ]; then
+			cat "$grubcfg" | sed -e '/^default/d' -e '/^timeout/d'
+		fi
+	}
+
+	if [ -f "$D/boot/grub/grub.cfg" ]; then
+		grubcfg="$D/boot/grub/grub.cfg"
+		old_image=`grep ' *linux \+[^ ]\+ \+root=' -m 1 "$grubcfg" | awk '{print $2}'`
+	elif [ -f "$D/boot/grub/menu.list" ]; then
+		grubcfg="$D/boot/grub/menu.list"
+		old_image=`grep '^kernel \+[^ ]\+ \+root=' -m 1 "$grubcfg" | awk '{print $2}'`
+	fi
+
+	# Don't update grubcfg at first install while old bzImage doesn't exist.
+	if [ -f "$D/boot/$old_image" ]; then
+		grubcfgtmp="$grubcfg.tmp"
+		get_new_grub_cfg "$grubcfg"  > $grubcfgtmp
+		get_old_grub_cfg "$grubcfg" >> $grubcfgtmp
+		mv $grubcfgtmp $grubcfg
+		echo "Caution! Update kernel may affect kernel-module!"
+	fi
+}
+
-- 
1.8.1.2



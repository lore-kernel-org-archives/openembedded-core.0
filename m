Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5E75D6C52E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Dec 2018 09:56:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wB39u48h018229
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 3 Dec 2018 01:56:05 -0800 (PST)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 3 Dec 2018 01:56:04 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Mon, 3 Dec 2018 18:13:28 +0800
Message-ID: <1543832010-8787-2-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1543832010-8787-1-git-send-email-hongxu.jia@windriver.com>
References: <1543832010-8787-1-git-send-email-hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] initramfs-module-setup-live: add realroot
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
X-List-Received-Date: Mon, 03 Dec 2018 09:56:05 -0000
Content-Type: text/plain

The setup-live module of initramfs-framework is introduced to integrate
the functionality of init-live.sh, but it missed to create /media/realroot

Refer init-live.sh, add scriptlet named `realroot' after scriptlet `union-fs'

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../initrdscripts/initramfs-framework/realroot             | 14 ++++++++++++++
 .../initrdscripts/initramfs-module-setup-live_1.0.bb       |  3 +++
 2 files changed, 17 insertions(+)
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/realroot

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/realroot b/meta/recipes-core/initrdscripts/initramfs-framework/realroot
new file mode 100644
index 0000000..19ff855
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/realroot
@@ -0,0 +1,14 @@
+realroot_enabled() {
+    return 0
+}
+
+realroot_run() {
+    for i in `ls /run/media 2>/dev/null`; do
+        if [ -f /run/media/$i/rootfs.img -o -f /run/media/$i/isolinux/rootfs.img ] ; then
+            echo "Move /run/media/$i to /media/realroot"
+            mkdir -p  $ROOTFS_DIR/media/realroot
+            mount -n --move "/run/media/$i" $ROOTFS_DIR/media/realroot
+            break
+        fi
+    done
+}
diff --git a/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb
index 30831c2..c0ebd40 100644
--- a/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb
@@ -10,6 +10,7 @@ inherit allarch
 FILESEXTRAPATHS_prepend := "${THISDIR}/initramfs-framework:"
 SRC_URI = "file://setup-live \
            file://union-fs \
+           file://realroot \
 "
 
 S = "${WORKDIR}"
@@ -18,8 +19,10 @@ do_install() {
     install -d ${D}/init.d
     install -m 0755 ${WORKDIR}/setup-live ${D}/init.d/80-setup-live
     install -m 0755 ${WORKDIR}/union-fs ${D}/init.d/91-union-fs
+    install -m 0755 ${WORKDIR}/realroot ${D}/init.d/92-realroot
 }
 
 FILES_${PN} = "/init.d/80-setup-live \
                /init.d/91-union-fs \
+               /init.d/92-realroot \
               "
-- 
2.7.4



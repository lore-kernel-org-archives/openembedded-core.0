Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4BBDA6FE96
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 10:45:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5GAjVSQ013092
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 03:45:31 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 16 Jun 2014 03:45:28 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jun 2014 18:46:28 +0800
Message-ID: <4492b52274d0ac89938a17bd569aedff723e69bc.1402915083.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1402915083.git.Qi.Chen@windriver.com>
References: <cover.1402915083.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/9] bootimg.bbclass: take initramfs into consideration
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
X-List-Received-Date: Mon, 16 Jun 2014 10:45:30 -0000
Content-Type: text/plain

It's a reasonable assumption that if INITRAMFS_IMAGE is set, the user
wants to do something with it. So the bootimg.bbclass should not just
ignore the existence of INITRAMFS_IMAGE.

This patch fixes the bootimg.bbclass to ship the initramfs image or
the bundled kernel for later use.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/bootimg.bbclass |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index 7678567..b925265 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -66,6 +66,11 @@ populate() {
 
 	# Install bzImage, initrd, and rootfs.img in DEST for all loaders to use.
 	install -m 0644 ${STAGING_KERNEL_DIR}/bzImage ${DEST}/vmlinuz
+	if [ -n "${INITRAMFS_IMAGE}" ] && [ "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
+		install -m 0644 ${STAGING_KERNEL_DIR}/bzImage-initramfs-${MACHINE}.bin ${DEST}/vmlinuz-initramfs
+	elif [ -n "${INITRAMFS_IMAGE}" ]; then
+		install -m 0644 ${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.cpio.gz ${DEST}/initrd.img
+	fi
 
 	if [ -n "${INITRD}" ] && [ -s "${INITRD}" ]; then
 		install -m 0644 ${INITRD} ${DEST}/initrd
@@ -237,4 +242,4 @@ IMAGE_TYPEDEP_iso = "ext3"
 IMAGE_TYPEDEP_hddimg = "ext3"
 IMAGE_TYPES_MASKED += "iso hddimg"
 
-addtask bootimg before do_build
+addtask bootimg before do_build after do_bundle_initramfs
-- 
1.7.9.5



Return-Path: <Zumeng.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0944760721
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jan 2018 03:20:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w0L3KhfG017252
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 20 Jan 2018 19:20:43 -0800 (PST)
Received: from pek-lpgbuild4.wrs.com (128.224.153.32) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Sat, 20 Jan 2018 19:20:42 -0800
From: Zumeng Chen <zumeng.chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 21 Jan 2018 11:26:58 +0800
Message-ID: <1516505218-23044-1-git-send-email-zumeng.chen@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/1] kernel-uboot: support Image kernel type for arm64
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
X-List-Received-Date: Sun, 21 Jan 2018 03:20:47 -0000
Content-Type: text/plain

Image will be generated for arm64, and no compression for Image in u-boot as
well. So we just put the file into the right place for the rest of the build
to find it.

Signed-off-by: Zumeng Chen <zumeng.chen@windriver.com>
---

 meta/classes/kernel-uboot.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/kernel-uboot.bbclass b/meta/classes/kernel-uboot.bbclass
index 87f0265..2364053 100644
--- a/meta/classes/kernel-uboot.bbclass
+++ b/meta/classes/kernel-uboot.bbclass
@@ -3,6 +3,10 @@ uboot_prep_kimage() {
 		vmlinux_path="arch/${ARCH}/boot/compressed/vmlinux"
 		linux_suffix=""
 		linux_comp="none"
+	elif [ -e arch/${ARCH}/boot/Image ] ; then
+		vmlinux_path="vmlinux"
+		linux_suffix=""
+		linux_comp="none"
 	elif [ -e arch/${ARCH}/boot/vmlinuz.bin ]; then
 		rm -f linux.bin
 		cp -l arch/${ARCH}/boot/vmlinuz.bin linux.bin
-- 
2.7.4



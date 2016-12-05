Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8EF72719B9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 14:54:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uB5Esh96006574
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Dec 2016 06:54:43 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 5 Dec 2016 06:54:42 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Dec 2016 06:54:40 -0800
Message-ID: <6b83cd885e710da3a267839eb73856a6354f4aab.1480949616.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1480949616.git.liezhi.yang@windriver.com>
References: <cover.1480949616.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] image.bbclass: inherit image_types_uboot when needed
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
X-List-Received-Date: Mon, 05 Dec 2016 14:54:42 -0000
Content-Type: text/plain

Fixed:
MACHINE = "qemuarm"
IMAGE_FSTYPES += "ext3.bz2.u-boot"
[snip]
No IMAGE_CMD defined for IMAGE_FSTYPES entry 'ext3.bz2.u-boot' - possibly invalid type name or missing support class
[snip]

This is because image_types_uboot is not inherited, inherit it when
needed will fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/image.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 6111f6d..b10272a 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -144,6 +144,15 @@ inherit ${IMAGE_TYPE_live}
 IMAGE_TYPE_vm = '${@bb.utils.contains_any("IMAGE_FSTYPES", ["vmdk", "vdi", "qcow2", "hdddirect"], "image-vm", "", d)}'
 inherit ${IMAGE_TYPE_vm}
 
+def build_uboot(d):
+    if 'u-boot' in (d.getVar('IMAGE_FSTYPES', True) or ''):
+        return "image_types_uboot"
+    else:
+        return ""
+
+IMAGE_TYPE_uboot = "${@build_uboot(d)}"
+inherit ${IMAGE_TYPE_uboot}
+
 python () {
     deps = " " + imagetypes_getdepends(d)
     d.appendVarFlag('do_rootfs', 'depends', deps)
-- 
2.9.0



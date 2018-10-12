Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 482EA79B9B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 09:39:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9C9cIfB025023
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 02:39:13 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Fri, 12 Oct 2018 02:38:42 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Oct 2018 16:57:11 +0800
Message-ID: <0c4bf43c1f51e38b1845b1b86b4513e95828d729.1539334497.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1539334497.git.kai.kang@windriver.com>
References: <cover.1539334497.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] image_types_wic: set consistent staging dirs
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
X-List-Received-Date: Fri, 12 Oct 2018 09:39:22 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

When build wic image with multilib enabled by following config:

  MACHINE = "qemux86-64"
  require conf/multilib.conf
  MULTILIBS = "multilib:lib32"
  DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

  IMAGE_FSTYPES = "wic"

it fails to build lib32 image such as lib32-core-image-minimal:

| DEBUG: Executing shell function do_image_wic
| INFO: Creating image(s)...
|
| ERROR: Couldn't find correct bootimg_dir, exiting

Dependency syslinux is not expand to lib32-syslinux when multilib is
enabled. It is populated to ${WORKDIR}/recipe-sysroot, but script wic
searches syslinux in ${WORKDIR}/lib32-recipe-sysroot and causes error.

Set consistent staging dirs for wic to fix the issue.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/image_types_wic.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 5b40a9e919..402920805d 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -54,6 +54,11 @@ WKS_FILE_DEPENDS ??= "${WKS_FILE_DEPENDS_DEFAULT} ${WKS_FILE_DEPENDS_BOOTLOADERS
 
 DEPENDS += "${@ '${WKS_FILE_DEPENDS}' if d.getVar('USING_WIC') else '' }"
 
+# Dependency syslinux is not expanded when multilib is enabled, consistent staging dirs are needed
+RECIPE_SYSROOT = "${WORKDIR}/recipe-sysroot"
+STAGING_DIR_HOST = "${WORKDIR}/recipe-sysroot"
+STAGING_DIR_TARGET = "${WORKDIR}/recipe-sysroot"
+
 python do_write_wks_template () {
     """Write out expanded template contents to WKS_FULL_PATH."""
     import re
-- 
2.18.0



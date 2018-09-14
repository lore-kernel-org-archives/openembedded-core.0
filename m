Return-Path: <Ovidiu.Panait@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5CF7879550
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 13:14:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8EDEaV2009477
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 06:14:36 -0700 (PDT)
Received: from l1.corp.ad.wrs.com (128.224.124.169) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 14 Sep 2018 06:14:35 -0700
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Sep 2018 16:03:10 +0300
Message-ID: <20180914130310.395-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [morty][PATCH v2] qemux86: wic: Add MLPREFIX to syslinux
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
X-List-Received-Date: Fri, 14 Sep 2018 13:14:35 -0000
Content-Type: text/plain

Fix the following do_image_wic failure for lib32-core-image-minimal:
| DEBUG: Executing python function set_image_size
| DEBUG: Python function set_image_size finished
| DEBUG: Executing shell function do_image_wic
| Error: Please build syslinux first

Test case:
MACHINE ?= "qemux86-64"

require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

IMAGE_FSTYPES_append = " wic wic.bmap"

$ bitbake lib32-core-image-minimal

Currently, syslinux gets built instead of lib32-syslinux, so do_image_wic
doesn't find the right files into tmp/sysroots/lib32-qemux86-64 sysroot.

Pyro and later releases are not affected by this issue because they are
based on Recipe Specific Sysroot, so syslinux binaries end up in the
right place.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta/conf/machine/qemux86-64.conf | 2 +-
 meta/conf/machine/qemux86.conf    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 4f30033e51..e093078d9d 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -33,4 +33,4 @@ MACHINE_FEATURES += "x86"
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
 
 WKS_FILE ?= "directdisk.wks"
-do_image_wic[depends] += "syslinux:do_build syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
+do_image_wic[depends] += "${MLPREFIX}syslinux:do_build syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index e232947aee..29897aaaaf 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -32,4 +32,4 @@ MACHINE_FEATURES += "x86"
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
 
 WKS_FILE = "directdisk.wks"
-do_image_wic[depends] += "syslinux:do_build syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
+do_image_wic[depends] += "${MLPREFIX}syslinux:do_build syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
-- 
2.17.1



Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id F278377C84
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 14:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491490177; x=1523026177;
	h=from:to:cc:subject:date:message-id;
	bh=Od7EfJb5ngE1piLXNfDY14gdNkByenS3gWu07pbYPjw=;
	b=l3SxLl96q17tJp4CCC1A503HSv0V82yu+Ybi3D3KBEVOsZ6DLtL2qVJx
	9qnoo0Zf7uDEZOakahZFI8u1a3fXpA==;
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Apr 2017 07:49:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,160,1488873600"; d="scan'208";a="245199409"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 06 Apr 2017 07:49:37 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id D416D6A4080;
	Thu,  6 Apr 2017 07:49:27 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Apr 2017 17:48:17 +0300
Message-Id: <1491490097-26925-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] qemux86*.conf: changed dependency task for syslinux
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
X-List-Received-Date: Thu, 06 Apr 2017 14:49:36 -0000

Changed dependency task for syslinux from do_build to
do_populate_sysroot as do_build dependency caused conflicts in
populating image recipe sysroot using conflicting recipes. This
makes do_image_wic task to fail with FileExistsError trying to
copy the same file from two conflicting recipes.

This should also speed up image creation a bit as do_populate_sysroot
task is faster than do_build.

[YOCTO #11295]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/conf/machine/qemux86-64.conf | 2 +-
 meta/conf/machine/qemux86.conf    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 150d745..10189cb 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -30,4 +30,4 @@ MACHINE_FEATURES += "x86"
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
 
 WKS_FILE ?= "directdisk.wks"
-do_image_wic[depends] += "syslinux:do_build syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
+do_image_wic[depends] += "syslinux:do_populate_sysroot syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 1b478e9..c26dda2 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -29,4 +29,4 @@ MACHINE_FEATURES += "x86"
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
 
 WKS_FILE ?= "directdisk.wks"
-do_image_wic[depends] += "syslinux:do_build syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
+do_image_wic[depends] += "syslinux:do_populate_sysroot syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
-- 
2.1.4



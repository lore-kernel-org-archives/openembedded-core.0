Return-Path: <yogesh.tyagi@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D519C54E67
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 06:08:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by mx.groups.io with SMTP id smtpd.web10.37223.1710914910377373233
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Mar 2024 23:08:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=bhnuO7Xf;
 spf=pass (domain: intel.com, ip: 198.175.65.20, mailfrom: yogesh.tyagi@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710914910; x=1742450910;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YUnFCuT4U6E9Xwwn50rQwcbNl5Vr/0454nHoeXkyVQ4=;
  b=bhnuO7XfX+FCzmYJBqejpM/TL5st3Ka+QT7md8cC/PSDYUlptZZV7btV
   RtaKSP6mJmLt0ju1eeGFOYtzET3Ds1D5hxHXZI3MoZUuOXHR0d0sjiYK4
   GOGAJ6vNXmghpr0IxQZNRYBiZGy3sCTtvV/tcJ06CDLMy5K/nTC8dm6p8
   XHO09G2g8lHWqofJ0c9wzntaJ3jx89dsNXxRcbA3RVicTLu4Fd1PrA0dG
   r54EuotWEhDcnXw+yBQ6LyEGdy3MEU79vvNx0xY6KQVYKzggB0cmnOkwk
   gg6LxEN7kSwcnQbNZMP/jrIFGmbPIXykGDgtLLOC7ruvtx3q7Yg6EvT/b
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5699472"
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="5699472"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 23:08:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,139,1708416000"; 
   d="scan'208";a="14439362"
Received: from ytyagi-desk.iind.intel.com ([10.49.15.7])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 23:08:28 -0700
From: Yogesh Tyagi <yogesh.tyagi@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] lttng-modules: fix v6.8+ build
Date: Wed, 20 Mar 2024 11:38:18 +0530
Message-Id: <20240320060818.523327-1-yogesh.tyagi@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 06:08:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197348

Backport a patch which remove 'needed' in trace_ext4_discard_preallocations

Signed-off-by: Yogesh Tyagi <yogesh.tyagi@intel.com>
---
 ..._preallocations-changed-in-linux-6.8.patch | 52 +++++++++++++++++++
 .../lttng/lttng-modules_2.13.11.bb            |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0006-Fix-ext4_discard_preallocations-changed-in-linux-6.8.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0006-Fix-ext4_discard_preallocations-changed-in-linux-6.8.patch b/meta/recipes-kernel/lttng/lttng-modules/0006-Fix-ext4_discard_preallocations-changed-in-linux-6.8.patch
new file mode 100644
index 00000000000..c35f5b61fa4
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0006-Fix-ext4_discard_preallocations-changed-in-linux-6.8.patch
@@ -0,0 +1,52 @@
+From c1e074414f087b6ecc229a9385a44eb3b3dfeaea Mon Sep 17 00:00:00 2001
+From: Kienan Stewart <kstewart@efficios.com>
+Date: Mon, 5 Feb 2024 08:52:29 -0500
+Subject: [PATCH] Fix: ext4_discard_preallocations changed in linux 6.8.0-rc3
+
+See upstream commit:
+
+    commit f0e54b6087de9571ec61c189d6c378b81edbe3b2
+    Author: Kemeng Shi <shikemeng@huaweicloud.com>
+    Date:   Fri Jan 5 17:21:02 2024 +0800
+
+        ext4: remove 'needed' in trace_ext4_discard_preallocations
+
+        As 'needed' to trace_ext4_discard_preallocations is always 0 which
+        is meaningless. Just remove it.
+
+Change-Id: Ib6b698ca553c4beebd4ca791c83bbbb927901758
+Signed-off-by: Kienan Stewart <kstewart@efficios.com>
+Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
+
+Upstream-Status: Backport [https://github.com/lttng/lttng-modules/commit/2da4de37de6382b4440737fdf4320e08a089afcd]
+
+Signed-off-by: Yogesh Tyagi <yogesh.tyagi@intel.com>
+---
+ include/instrumentation/events/ext4.h | 14 +++++++++++++-
+ 1 file changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/include/instrumentation/events/ext4.h b/include/instrumentation/events/ext4.h
+index 222416e..05a6453 100644
+--- a/include/instrumentation/events/ext4.h
++++ b/include/instrumentation/events/ext4.h
+@@ -490,7 +490,19 @@ LTTNG_TRACEPOINT_EVENT(ext4_mb_release_group_pa,
+ )
+ #endif
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,9,0) || \
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,8,0))
++LTTNG_TRACEPOINT_EVENT(ext4_discard_preallocations,
++	TP_PROTO(struct inode *inode, unsigned int len),
++
++	TP_ARGS(inode, len),
++
++	TP_FIELDS(
++		ctf_integer(dev_t, dev, inode->i_sb->s_dev)
++		ctf_integer(ino_t, ino, inode->i_ino)
++		ctf_integer(unsigned int, len, len)
++	)
++)
++#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,9,0) || \
+ 	LTTNG_KERNEL_RANGE(5,8,6, 5,9,0))
+ LTTNG_TRACEPOINT_EVENT(ext4_discard_preallocations,
+ 	TP_PROTO(struct inode *inode, unsigned int len, unsigned int needed),
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.11.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.11.bb
index b6bae733c75..5d2379df848 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.11.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.11.bb
@@ -15,6 +15,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0003-Fix-strlcopy-removed-in-linux-6.8.0-rc1.patch \
            file://0004-Fix-btrfs_chunk-tracepoints-changed-in-linux-6.8.0-r.patch \
            file://0005-Fix-btrfs_get_extent-flags-and-compress_type-changed.patch \
+           file://0006-Fix-ext4_discard_preallocations-changed-in-linux-6.8.patch \
         "
 
 # Use :append here so that the patch is applied also when using devupstream
-- 
2.34.1



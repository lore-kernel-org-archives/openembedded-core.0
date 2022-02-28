Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE9BC433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:01:33 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.19879.1646056878394925946
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:01:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=IYkJDtlD;
 spf=pass (domain: intel.com, ip: 192.55.52.136,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646056893; x=1677592893;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=LNdAGKK4tciIItqie7njIWmcyfUvYt4IYlMWmaI5DsI=;
  b=IYkJDtlDTBmllMcBsUYjWMhTitFGqYnl9KFYpunkm6ez6Kdr6Dz48njB
   ELdHyfSzJZnJGifY2Oo1mrqUqn7GGP3HEtlpf7HUI2VRSGkNW0GdKObDw
   96ccQZmv2ZDCqhSUiXGel0skLU23PLOLZn/Fyl2sM8F0I038euW9a0CdR
   /oxhjcq6U+AKaIiiXeMHYwtegvuRpJcONSjC8JrJJU8hwUdrdZXe1NG+C
   RLVE1kiJPqYf8QH4MXSGVOjtTgy5fg9rvg/9pXXeP6mhpdbuFLH+/0sht
   MaQLzPGo9qSM9/6SaiSVGZLOKcwhgZL+OIvUJRoOzjfOgFcSsqy9176Yy
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="232857373"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="232857373"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:26 -0800
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="778092749"
Received: from jtang17-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.141.22])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2022 06:01:25 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 31/39] initramfs-framework: unmount automounts
 before switch_root
Date: Mon, 28 Feb 2022 22:00:21 +0800
Message-Id: 
 <999883990235251127b65f2277dcb40004e7f657.1646056612.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646056612.git.anuj.mittal@intel.com>
References: <cover.1646056612.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:01:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162487

From: Justin Bronder <jsbronder@cold-front.org>

If mounts are left lingering, then after we switch_root, attempts to
modify the block devices will result in an EBUSY with no way to unmount
them.  As we're about to switch_root anyways, there isn't much use to
keep anything mounted unless it has the new rootfs.

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4dc7af6d25597ea10ea43e76c7c3d7251462c0e5)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
(cherry picked from commit 991631492f4fafc1852113a34a60b025342518b6)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../initrdscripts/initramfs-framework/finish         | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/finish b/meta/recipes-core/initrdscripts/initramfs-framework/finish
index 717383ebac..f08a920867 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/finish
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/finish
@@ -12,6 +12,18 @@ finish_run() {
 			fatal "ERROR: There's no '/dev' on rootfs."
 		fi
 
+		# Unmount anything that was automounted by busybox via mdev-mount.sh.
+		# We're about to switch_root, and leaving anything mounted will prevent
+		# the next rootfs from modifying the block device.  Ignore ROOT_DISK,
+		# if it was set by setup-live, because it'll be mounted over loopback
+		# to ROOTFS_DIR.
+		local dev
+		for dev in /run/media/*; do
+			if mountpoint -q "${dev}" && [ "${dev##*/}" != "${ROOT_DISK}" ]; then
+				umount -f "${dev}" || debug "Failed to unmount ${dev}"
+			fi
+		done
+
 		info "Switching root to '$ROOTFS_DIR'..."
 
 		debug "Moving /dev, /proc and /sys onto rootfs..."
-- 
2.35.1



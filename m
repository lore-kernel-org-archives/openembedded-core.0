Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4344DC43217
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 15:08:44 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web12.13657.1645542520813188935
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:08:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=k7mjq489;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645542523; x=1677078523;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=4ZK4YUDGv0wDQZJjsBrXWBhmWU7o9f3RPRP8yw6slOc=;
  b=k7mjq489WMHa8k+OUbWs2iKiajB9KRR1OciqSPafZo0paP9yMvTTGzSt
   zy2VyhUQ26GYlP9Wpcrjis7ht5jW6UsKO0wt3IghPXhVtf4sE0fmfgr1x
   iK34zQdpXgskA1IQxji6RW9cocZWzKJaBovIYT83g5Sx4/csCAiOqpmSm
   y5r43JDt1sPi3Ion/jc5jmRams8BAyxZC9fhAa+94yLekg8fqFXJzhqY1
   jNf9VxiaraAAKXVDEEC3jFG3bVT9Ie0W40QIB2vqnwi5feDvOaXVhosYU
   /Xpo0WJ1wNGioiJQbbMeagvLuejjCfI0ohivMvtO7FaoXIUjTVrtVbJ73
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="249305232"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="249305232"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:28 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600";
   d="scan'208";a="532258745"
Received: from mmohdnaj-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.137.195])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 07:08:27 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 25/38] initramfs-framework: unmount automounts
 before switch_root
Date: Tue, 22 Feb 2022 23:07:26 +0800
Message-Id: 
 <991631492f4fafc1852113a34a60b025342518b6.1645536711.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645536711.git.anuj.mittal@intel.com>
References: <cover.1645536711.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 15:08:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162161

From: Justin Bronder <jsbronder@cold-front.org>

If mounts are left lingering, then after we switch_root, attempts to
modify the block devices will result in an EBUSY with no way to unmount
them.  As we're about to switch_root anyways, there isn't much use to
keep anything mounted unless it has the new rootfs.

Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4dc7af6d25597ea10ea43e76c7c3d7251462c0e5)
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



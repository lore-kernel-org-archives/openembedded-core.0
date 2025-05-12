Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE4C4C3ABC3
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:01 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.45912.1747040637108405502
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Uu4JTWbe;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040636; x=1778576636;
  h=from:to:cc:subject:date:message-id;
  bh=cuQMHZOG6zjGuOVWmJEVNT3vk+1ZvyN38l8ndbJ5G+4=;
  b=Uu4JTWbeZKz1ZQfIAOGc4FvxPhYCuAW8U5ldZhijcRa70111PNsAMMjk
   odSHpidRfksKsnLEo0G5JcuD8N3ckNw4cXvELBOfzlq29Jm/O8LSAPsIL
   e76fo0vBBoI2m42zIxW8hPPmUTb1z6ehNslBIy4DFiO/Ju1ZbGy0FRb4g
   /AnY9QudoorkeTvuRT5zS+DI/2/DGtEE2AlyxQr0rlroSrpC/avUIyjv1
   Nvol4r7ioCNHGVPVazMDjnLqrwFj6uPeFGXwKKwqr18iBcoNEpYxcubul
   llgI6tKEtWxIthCwgFVmHpab4ooLT9ADbBfZgYqgnxFSJR2J6hg6ZsGfy
   w==;
X-CSE-ConnectionGUID: raktKEx2RoiQK7GL8ZNjMQ==
X-CSE-MsgGUID: J1F6LjD1RIqAEiELG51fpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="186489670"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="186489670"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:03:54 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id DB5B5D4C33
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8C083BF3D1
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:03:52 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id ECC8C1A009B;
	Mon, 12 May 2025 17:03:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/56] appstream: upgrade 1.0.4 -> 1.0.5
Date: Mon, 12 May 2025 17:02:44 +0800
Message-Id: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216299

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
Features:
 * qt: Expose markup conversion utils
 * desktop-styles: Add android and iOS
 * validator: Check for xml:lang="en" being used on description template elements
 * validator: Flag cases of raw text in "description" elements
 * metadata: Add more known extensions into as_metadata_file_guess_style()

Specification:
 * docs: Clarify that the style segment of a screenshot environment is optional
 * docs: Explain consequences of defining an icon for desktop-app metainfo
 * docs: Clarify that description content must be in p/li elements

Bugfixes:
 * validator: mark as_validator_issue_tag_list static
 * docs: Add workaround for gi-docgen misnaming devhelp files
 * compose: Do not permit SVG images as screenshots
 * compose: Don't "forget" to scan remaining paths when re-encountering a dir
 * pool: Try explicit singular term match if we only have low-quality tokens
 * utils: Provide compatibility with Fedora icon tarballs when installing them
 * utils: Remove leftover g_chmod()
 * zstd-decompressor: Pass output/written data when decompression finished
 * utils: Expect a dash in icons file name
 * utils: Recognize .yml* and .yaml* file extension variants, and .zst extension
 * utils: Rename the appstream file when re-saving it on install

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../appstream/{appstream_1.0.4.bb => appstream_1.0.5.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/appstream/{appstream_1.0.4.bb => appstream_1.0.5.bb} (94%)

diff --git a/meta/recipes-support/appstream/appstream_1.0.4.bb b/meta/recipes-support/appstream/appstream_1.0.5.bb
similarity index 94%
rename from meta/recipes-support/appstream/appstream_1.0.4.bb
rename to meta/recipes-support/appstream/appstream_1.0.5.bb
index a9c87f7589..3e4f8708d8 100644
--- a/meta/recipes-support/appstream/appstream_1.0.4.bb
+++ b/meta/recipes-support/appstream/appstream_1.0.5.bb
@@ -30,7 +30,7 @@ SRC_URI = " \
 	file://0002-Do-not-build-qt-tests.patch \
 	file://0003-Fix-PACKAGE_PREFIX_DIR-in-qt-cmake-AppStreamQtConfig.patch \
 "
-SRC_URI[sha256sum] = "2d218348067f98c4f34a3ffe2d8219ad9f504b1b2481f1872dec66c77bf37509"
+SRC_URI[sha256sum] = "ce0ed29e89abd5f0cf790ea87d792f1967c3413060beb30e63a979578d975121"
 
 S = "${WORKDIR}/AppStream-${PV}"
 
-- 
2.43.0



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4627C021B2
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 07:41:28 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.14624.1739864483510125833
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 23:41:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HfcqPF6l;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739864484; x=1771400484;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=aQv+f95feXmqJn/Z+QSmuC8grLu8jNEnNmOsq65TpYo=;
  b=HfcqPF6lmU/DlytwjifSSVt7C9gal/4YiEz/UmGLbvmTKNVd0BrijIl2
   woPE6Dmd8bbvraRCYW5hWY4jmXINze8biBtPhZe8xIvrnhYt63SGzo4jB
   a1Uw3PCC+6kh4B1dUQ731zAq8ADTv3+EF/FT0xg42MqwKvpLeHY/3yIK9
   D3xxw/VkDd5DEwAIZbitx8eHeIdLaz4rbCA7m2oBuXpwVIOKM0mER0ilJ
   +HjkckMBS2542VHI3yxi0B0gMTLuMVPOsjx/w5TaWORdKLGKg1pbXtdNu
   dyMS1BplSfs0E9hv5k0nTD3chYbRtwSYhv2HiJ/aWuzf70FeS3GqX9gDZ
   A==;
X-CSE-ConnectionGUID: Db43bL5YSVyiy9Wzg7N68g==
X-CSE-MsgGUID: W6rzFNFKSjGb5tVeUOEo1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="190317065"
X-IronPort-AV: E=Sophos;i="6.13,295,1732546800"; 
   d="scan'208";a="190317065"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:41:21 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 31E25D4C39
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id EC032D8ADF
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:18 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8EECA1A000B;
	Tue, 18 Feb 2025 15:41:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/32] erofs-utils: upgrade 1.8.4 -> 1.8.5
Date: Tue, 18 Feb 2025 15:39:06 +0800
Message-Id: <1739864375-21394-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:41:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211566

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- (mkfs.erofs) Support '-Efragdedupe=inode' for multithreading;
- (dump.erofs) Add '--cat' to show file contents (Juan Hernandez);
- (mkfs.erofs) Fix inefficient fragment deduplication;
- (fsck.erofs/erofsfuse) Introduce fragment cache;
- (fsck.erofs) Preserve S{U,G}ID bits properly on extraction;
- (mkfs.erofs, tarerofs) Align non-existent directories with their parents;
- Several minor bugfixes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../erofs-utils/{erofs-utils_1.8.4.bb => erofs-utils_1.8.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/erofs-utils/{erofs-utils_1.8.4.bb => erofs-utils_1.8.5.bb} (94%)

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.4.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.5.bb
similarity index 94%
rename from meta/recipes-devtools/erofs-utils/erofs-utils_1.8.4.bb
rename to meta/recipes-devtools/erofs-utils/erofs-utils_1.8.5.bb
index ba06e7019d..54ead294fb 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.4.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.5.bb
@@ -5,7 +5,7 @@ SECTION = "base"
 LIC_FILES_CHKSUM = "file://COPYING;md5=73001d804ea1e3d84365f652242cca20"
 HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/README"
 
-SRCREV = "b4b93c26c7e8e771af93627f02791818e7c78f6c"
+SRCREV = "7bc147fafd53a2a9ff7c22399491079e5bfffafc"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master;protocol=https"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
-- 
2.43.0



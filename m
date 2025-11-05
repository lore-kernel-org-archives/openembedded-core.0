Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD91CCFA1A
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:47:31 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2980.1762386439864192560
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:47:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Gek/mAyH;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386445; x=1793922445;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EeDUDb9bOIRD7Boemjcs2YA/S+UHYM9VZ3BKRvQqoJw=;
  b=Gek/mAyHpWX7TiH9SM0k2ElRkt6YyOqAT1id+c/aFBYknpuVPt1t2IEA
   nX5tTpQoEY+K9HKCvbNVyn3d0mpY99MWaScwKnvdKeIAol1UwgPBE0kAu
   AjLSgGZS79jkzpqJVE9aNL8IVugYOOuy97qTJDRGcboSxzGjdCa+ME4C6
   VmbOS4fSVgO9brdUl3YCQhBPY9lq/eUTBBuShDTBPZsgTuK1rKNa1LYpH
   QO8IKLE6rpRdUZVe3jNLWr4OZ5cWXqMYItj4BprA2HuUiyRODSX3OGTTq
   HCxwveoFfhIxhi7neiHfoWObvpSOaQyhoqe67v+jr+MP3uYy+74O0nHXF
   A==;
X-CSE-ConnectionGUID: wpAnO9x+Smyry8YjDvsxCA==
X-CSE-MsgGUID: fv549U7ETlSaUOYVmxhcEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="221965700"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="221965700"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:47:25 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id D71421547
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:24 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 9084E1000241
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:24 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 0D36814005BB;
	Wed,  5 Nov 2025 23:47:21 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/29] btrfs-tools: upgrade 6.16 -> 6.17
Date: Thu,  6 Nov 2025 07:46:47 +0800
Message-ID: <20251105234712.446-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251105234712.446-1-wangmy@fujitsu.com>
References: <20251105234712.446-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:47:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225934

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* inspect list-chunks: more sorting keys, descending order
* fi resize: add support for offline (unmounted) growing of single device
* device stats: add support for offline (unmounted) reads
* quota status: new command, overview what mode is enabled, tunables
* fi commit-stats: new command, print various commit stats from sysfs (since
  kernel 6.1)
* balance start: print warning and delay start if there's a missing device
  in the filesystem
* mkfs:
   * print zoned mode (native, emulated)
* check:
   * verify device bytes in super block item and in chunk tree
* other
   * updated CI, new and updated tests
   * cleanups, refactoring
   * documentation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../btrfs-tools/{btrfs-tools_6.16.bb => btrfs-tools_6.17.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.16.bb => btrfs-tools_6.17.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.bb
index ef809d384b..bb72cb0c04 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.16.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.17.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://github.com/kdave/btrfs-progs.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "54694de98fdc4ea5678cdd77b920c044bbf64f26"
+SRCREV = "c03e29f083678f47a7d7d810db4d21d905979b77"
 
 PACKAGECONFIG ??= " \
     programs \
-- 
2.43.0



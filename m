Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E2F3CD12A4
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 07:10:58 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.130221.1712646653922232115
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:10:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=d54bDnnU;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1712646654; x=1744182654;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vzRMrqs5/5F0ppsbPOpejIONWiJ3doRCxG4e6fMDvBU=;
  b=d54bDnnUXf5PYMExfwQ93bWureyW38L+RVZprXZqqC/Z6iQgZ4Mt7ClB
   mpNaMi5yO3vC4Na97RcDP7wRtD7jWFZGHtWuCSg2OENiT+K4uMKJeno2P
   Zp1pKKHjOuUrrA/Iw0GJjiRumx9/0l12U5CSBQJkkYYlGZ3lIZLu51Ecg
   oMUv5XUXzT72S/JXNtgL4c4M1nu5WFhnZmBY7Uu/fXfQd0HfnVLvG0QDu
   cYvtsNQWX3V4c4txoOinXxHfuoi8HFXnHiNtpy/tv9ShUdgu7Yv2mqJIG
   kdsnu4mJrHzyN4FV3EnWZGCnrehq6ooQCY6DHAjpfrlXRnYyLHD01RwF6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="143011350"
X-IronPort-AV: E=Sophos;i="6.07,189,1708354800"; 
   d="scan'208";a="143011350"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:10:35 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A8ECEE9A3D
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:33 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id DFEBE4E706
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6BA4C20093260
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1A2B81A0002;
	Tue,  9 Apr 2024 15:10:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/33] btrfs-tools: upgrade 6.7.1 -> 6.8
Date: Tue,  9 Apr 2024 15:09:50 +0800
Message-Id: <1712646620-16608-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28306.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28306.006
X-TMASE-Result: 10--6.870000-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrTfK5j0EZbyswAYdq1VTXoyrB
	Ldpas6PSvEu7/nJvA7NVmNrvsGRXOh1hN+DNBjvOqhcdnP91eXE2ugGkJu34Zv0xtTdU+At9aUh
	+D1JijDMcYLgNAmVRseAQzLn9D5aP40Sc6ZJqILQD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpixwb6oUXQPLKHfxuc8sSk8d0KiTeJteVBfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTt+Tf0tcxKuLrUhTdz4zi9OQ0Nz1JILqpzqHD6N0oYwq25xN1Zi0ugIg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 07:10:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198044

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* fix --enqueue option timeout handling
* subvolume: remove support for undocumented options -c and -x,
  functionality disabled in kernel
* libbtrfsutil:
   * version 0.1.3, backward compabile
   * add aliases for all existing functions with unified naming scheme
   * updated header defintions for recently added kernel features
* send: v3 supported in experimental mode
* other:
   * docs: manual page references, graphs, enhancements, clarifications
   * error handling fixes
   * cleanups and refactoring

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../btrfs-tools/{btrfs-tools_6.7.1.bb => btrfs-tools_6.8.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.7.1.bb => btrfs-tools_6.8.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.7.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.7.1.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.bb
index 8132c2cc72..15cc7ac244 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.7.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "60abf7a90776c2405f616182ef6129474bbcb109"
+SRCREV = "3793e987d2b4e878410da16f33d963043d137d48"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.34.1



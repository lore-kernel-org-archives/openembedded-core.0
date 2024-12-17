Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 888FDE77186
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 08:58:35 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.77342.1734425910443067922
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 00:58:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=W8N18xRY;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734425910; x=1765961910;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=cCXNxtuabVWSpC7hrF7swB72K4dYvSk6g37hzGjh+LM=;
  b=W8N18xRYQWPqRogfCEhS2dSBnC4UFJAstQ8XZP6fIv0wP3h6ZrPcVFOE
   V5I7TzeHOW6nRkIfnNDZF0+1h7BsFDNfYc1wXBsTlWzSMzJyvB6Hh5bne
   rYwXpcHsqwqwV6zZIj3HICsxop+42EEQPB8isBgaiFzJRMWCOAwZBlKej
   h3yoWKxIZfP7WzzKvBWuT8i6BEZr2zTLW9eHM7qaLOvnic7S9wC8HddI2
   I3ZXN3/RQUf8YQPTHsTCWRUcji4mnECbiDZMhW+JMZ9J0JZz+cWhutnVM
   LcapQuUHu6Oxl9xd6jN/xE76Lgam2eXjEL6iIdyStCDbZxZ8onwOh4tSX
   w==;
X-CSE-ConnectionGUID: Ufu1WJ48Sge67RCGl5+VgQ==
X-CSE-MsgGUID: Oz/WcL6rSVqGBavrXdYsMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="184237970"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="184237970"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 17:58:27 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 10402E8521
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:26 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id DC4EFD9742
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 659882007CDE4
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:25 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 00A321A000B;
	Tue, 17 Dec 2024 16:58:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 04/21] erofs-utils: upgrade 1.8.2 -> 1.8.3
Date: Tue, 17 Dec 2024 16:57:50 +0800
Message-Id: <1734425887-18069-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
References: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10--0.081700-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytO2MZoFipNWzT0
	dtIjR7IbmonMfneen24nSEroEw7CcMu8JJAANxZNgvmNrsT46HJS5VVMJCvraujMOEZ5AL0SSeb
	k8lenLCn6bYgoYymUwA3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXR/IzlV+CMbaH62
	gsspfBET+Ok6f9gUlFBhQWw3lZ+IVx9EmrVy1N/KzGfgakLdja2ouYuLMUrI47mh2NTeNHlAOiV
	FpF7nSJOoVDnE6J6/SAMuqetGVethtouMvD9sV53QfwsVk0UbvqwGfCk7KUs2VhXXKRXnlnuDWz
	St5FcEvRg1lFmEXWuDQJrb53m0Gn2RflsG+0l31/SaqyfVIZd6yzPdZUi1Q5G6qe6mG/duvz8hc
	fRAfGb4geppQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 08:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208808

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- (mkfs.erofs) Fix multi-threaded compression with '-Eall-fragments';
- (mkfs.erofs) Fix large chunk-based image generation;
- (mkfs.erofs) Avoid large arrays on the stack
- (mkfs.erofs) Fix PAX format parsing in headerball mode
- (mkfs.erofs) Several fixes for incremental builds
- (mkfs.erofs) Fix reproducible builds due to 'i_ino'
- Use pkg-config for liblz4 configuration;
- Get rid of pthread_cancel() dependencies;
- (mkfs.erofs) Add '-U <clear|random>' support;
- (mkfs.erofs) Add '--hard-dereference' for NixOS reproducibility
- Several minor random fixes.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../erofs-utils/{erofs-utils_1.8.2.bb => erofs-utils_1.8.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/erofs-utils/{erofs-utils_1.8.2.bb => erofs-utils_1.8.3.bb} (94%)

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.2.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.3.bb
similarity index 94%
rename from meta/recipes-devtools/erofs-utils/erofs-utils_1.8.2.bb
rename to meta/recipes-devtools/erofs-utils/erofs-utils_1.8.3.bb
index 4d8689f87c..996303c7f0 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.2.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.3.bb
@@ -5,7 +5,7 @@ SECTION = "base"
 LIC_FILES_CHKSUM = "file://COPYING;md5=73001d804ea1e3d84365f652242cca20"
 HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/README"
 
-SRCREV = "8bedd862edfbb9a5e54dd37abede29020dd8fdfb"
+SRCREV = "8d6c5d48615e23cd47cf9eb793904aedbb93ff4e"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master;protocol=https"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
-- 
2.43.0



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1918DC83F39
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 08:08:36 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.2950.1752566910226179785
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 01:08:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=D35IdzU/;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752566912; x=1784102912;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lzWcNwS86rVFBLmICnaKeVY16OHqBXvf3Psz+71K5zw=;
  b=D35IdzU/wajCy/Uo/VNT53DTLHMAZlN3Z8zi4ecsayBfPO1M9VlIvTi4
   PE8IVtCRqqpS2eJeCYfiHk4du/4Gw2eHww7nPc+QzpnXNPmtMqtI8XH+N
   8dbabUfc4V7kLTmujGcpvMR+Ub9MFPXvuq0a3aoczRvDdN+EdWhuTHzyT
   9bRdqH3euYbqj8jq4EbXOOdpS7uHGYpCUowXdaiXHlRUyQnG0smeJ6Inn
   e7sNVVZTRViHMZcciConLpGKTK9efFSNiFPIC8H/TpNhDULY04MsEKytF
   yT2RRL3Y0zRIyhbhF+Yt2VlX291Fc2PB9Z72MGrDjIH5UVvt+asNEQpEl
   w==;
X-CSE-ConnectionGUID: xfABTCKHROCp+lZLhqExyg==
X-CSE-MsgGUID: mAEkaqqXSXyxp9s0EmbrUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="193782255"
X-IronPort-AV: E=Sophos;i="6.16,313,1744038000"; 
   d="scan'208";a="193782255"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 17:08:31 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id B7591C00201
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:31 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 20400C00886
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:31 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B1B1F1A0074;
	Tue, 15 Jul 2025 16:08:27 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/19] lsof: upgrade 4.99.4 -> 4.99.5
Date: Tue, 15 Jul 2025 16:08:10 +0800
Message-ID: <20250715080819.622-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250715080819.622-1-wangmy@fujitsu.com>
References: <20250715080819.622-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220278

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- fix legacy linux kernel compatibility due to missing /proc/self/ns
- fix potential null pointer deference

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/lsof/{lsof_4.99.4.bb => lsof_4.99.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/lsof/{lsof_4.99.4.bb => lsof_4.99.5.bb} (90%)

diff --git a/meta/recipes-extended/lsof/lsof_4.99.4.bb b/meta/recipes-extended/lsof/lsof_4.99.5.bb
similarity index 90%
rename from meta/recipes-extended/lsof/lsof_4.99.4.bb
rename to meta/recipes-extended/lsof/lsof_4.99.5.bb
index b977fc4897..292db224af 100644
--- a/meta/recipes-extended/lsof/lsof_4.99.4.bb
+++ b/meta/recipes-extended/lsof/lsof_4.99.5.bb
@@ -6,9 +6,9 @@ SECTION = "devel"
 LICENSE = "Spencer-94"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a48ac97a8550eff12395a2c0d6151510"
 
-SRC_URI = "git://github.com/lsof-org/lsof;branch=master;protocol=https \
+SRC_URI = "git://github.com/lsof-org/lsof;branch=master;protocol=https;tag=${PV} \
            file://remove-host-information.patch"
-SRCREV = "bbf320ce586a848f880bca7b758d50ae4c712624"
+SRCREV = "ed0fef9a134b64c9398075185534a76714c91179"
 
 inherit update-alternatives autotools pkgconfig manpages
 PACKAGECONFIG[manpages] = ""
-- 
2.43.0



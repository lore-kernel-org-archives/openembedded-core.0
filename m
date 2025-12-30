Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E65AAE95A60
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 09:17:49 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61242.1767086261189154625
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 01:17:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tjd3ma2L;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767086261; x=1798622261;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PuNCnwg2/3LsyhrLFJ/qiDkGWpkq3mxIGE3qFShnH+U=;
  b=tjd3ma2LWdIRLL+Y5BChwHfrXnl0x9ZPxIpTOQRjvPmkycQ2w/bz9QRN
   HfLDRYte6Y828OqZFl7EpE5miNf2p72fMwFNXcrwZzZY68CymgFmY0/hx
   7kWxW5FYhMwznvhgAYC3xrNGNNpyYfsmPABNcSJEBXhyr3+XMyvMv0u+U
   raGvNhvy6EdqMgt8IlpRQHjJa8WTWQsOfTflxXRIXbURw9DtZAcf0Capx
   N/7fcFCAox4QPqPXX1bGr5ApN6L6Lm6vxNw3SZCCBzTcizEe4OoA/qSzX
   nJ12cmcky1X3k77cV/3E8iF94p+1Y1kX1DQuaOBh1CW0MLf9NELoRJ8Kr
   A==;
X-CSE-ConnectionGUID: sEbuFGLpSSaswWCdDh8SsA==
X-CSE-MsgGUID: oqL0Y7Z/RgSSjXtA7BW7dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="228271195"
X-IronPort-AV: E=Sophos;i="6.21,188,1763391600"; 
   d="scan'208";a="228271195"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 18:17:40 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 92E951002B82
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:17:39 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 36CCE8D72DC
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:17:39 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 885391800587;
	Tue, 30 Dec 2025 09:17:36 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/12] ell: upgrade 0.80 -> 0.81
Date: Tue, 30 Dec 2025 17:17:06 +0800
Message-ID: <20251230091714.1501-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251230091714.1501-1-wangmy@fujitsu.com>
References: <20251230091714.1501-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228647

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Fix issue with systemd watchdog protocol handling.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/ell/{ell_0.80.bb => ell_0.81.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.80.bb => ell_0.81.bb} (88%)

diff --git a/meta/recipes-core/ell/ell_0.80.bb b/meta/recipes-core/ell/ell_0.81.bb
similarity index 88%
rename from meta/recipes-core/ell/ell_0.80.bb
rename to meta/recipes-core/ell/ell_0.81.bb
index 90474dadae..f9b702531a 100644
--- a/meta/recipes-core/ell/ell_0.80.bb
+++ b/meta/recipes-core/ell/ell_0.81.bb
@@ -15,4 +15,4 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "6efc70ae6d3e2ca1ec255ecd855a3d5fadefe59897f4307816e3ba7a771f3d00"
+SRC_URI[sha256sum] = "672ca1e44dc0ddce1665941754b4e2b3b9203481d7d7a60e0b5f39829d73fa14"
-- 
2.43.0



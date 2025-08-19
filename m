Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 445A3CA0EFA
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 03:35:50 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.5631.1755574542730048094
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Aug 2025 20:35:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Qf8bASA1;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755574544; x=1787110544;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vyZ2rxO7n5y9D5XiLmt738cZOX/U3ykypLXR/HMqlNM=;
  b=Qf8bASA1Agve0bLLaiQ/L0Ciie/MUcF+7UzXXp7JXVABl3ZgVQV30K8I
   ruHc2pxpG4qa7LwgLe1ZFVSzsambnN8OkaTzKEoiDYtHCTZkF43JCT50B
   7o31APLgANTZ1Bq4u/ZXbThp8ZMrBL0AB6570aH//sNYjtVBlXTKE6wr/
   aUIe0BSsXwCXin+jvhCBeyxMkZiLoooLFIJBjs4m4HnbEzxtex0VlZ8Op
   tZrjfVq+c+hwyjF2J81Cq7KGljCRLISpIz/krqw8MoJ0aN/T5ZF+UfwPU
   b6T+1eWs5Z4Rm8naVhphXvUSQjMnsZfuOtbkgiqdpAATETzeLJmEVp93K
   w==;
X-CSE-ConnectionGUID: lPaEemVxTAmdFG4xGcERPg==
X-CSE-MsgGUID: HMquzq70QFmCYEqxaJCx9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="209708779"
X-IronPort-AV: E=Sophos;i="6.17,300,1747666800"; 
   d="scan'208";a="209708779"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 12:35:42 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 090028204CA
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:42 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id B4B12C041E3
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:41 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 83C4D180010A
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:39 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BF5841A007E;
	Tue, 19 Aug 2025 11:35:35 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 05/11] gstreamer1.0-vaapi: upgrade 1.26.3 -> 1.26.5
Date: Tue, 19 Aug 2025 11:34:26 +0800
Message-ID: <20250819033433.390-5-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250819033433.390-1-liuyd.fnst@fujitsu.com>
References: <20250819033433.390-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222065

Refer to release note, no changes this time
https://gstreamer.freedesktop.org/releases/1.26/#1.26.5

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...streamer1.0-vaapi_1.26.3.bb => gstreamer1.0-vaapi_1.26.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.26.3.bb => gstreamer1.0-vaapi_1.26.5.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.5.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.3.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.5.bb
index 98eba8bcdb..f61125105d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.5.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "2d643fbd1420297da5a4d6945d11f0a5b4f82feea54ea6aec9368d42995d8b03"
+SRC_URI[sha256sum] = "b42d44db63f3195a6f33296e1ead32c14d01ef27452b7068f1a2d86624f55ea9"
 
 S = "${UNPACKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.43.0



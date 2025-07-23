Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B023FC83F27
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 01:06:52 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.3839.1753232802927872662
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 18:06:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HaDlNomt;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753232802; x=1784768802;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rDjCW5DisfI+cjkV3l/d8+7vRJI0qAYjbXZsFsp7y6E=;
  b=HaDlNomtlylhQvuov3q0VCONfx+9U6IIEo/eqFwbRQgc/Evs+5MNGRDo
   ie+ecKsUWhNPZplcTeSv+YkV8VDDd2DaIxeQ1FpKc2eWMtTEy433A9fpg
   idPMd+9vL1tLuwojb4H5GN5DOWyOPkPGhYEWv5UTDSF6446xbgN6doF0b
   tRsJYXqt9MMjxB2cFi2uMD7P3yVqv146VwDxRAkVzEZYYLNNO33IgEr/U
   E2nP7BFZ+AVLCN+fwIHVuCEDMxPnl+0rTCnTK1PI/OMq2rHYkB11zOCXy
   HvbbIZxsNXuCLwrC8GyhacG3ib3Po87eLoy6oUMSf4jRONzMrl/TkfPcJ
   g==;
X-CSE-ConnectionGUID: GLRcW1qGS4aLfii8A+sAqA==
X-CSE-MsgGUID: 7bKPAHJ3TJ+HOURCBxlzgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="195058739"
X-IronPort-AV: E=Sophos;i="6.16,333,1744038000"; 
   d="scan'208";a="195058739"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 10:06:40 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id EC871100035D
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 01:06:40 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 60B9C1C00292
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 01:06:40 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6C52F1A0073;
	Wed, 23 Jul 2025 09:06:37 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 03/12] less: upgrade 678 -> 679
Date: Wed, 23 Jul 2025 09:06:05 +0800
Message-ID: <20250723010614.926-3-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250723010614.926-1-liuyd.fnst@fujitsu.com>
References: <20250723010614.926-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 01:06:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220762

Changelog:
==========
- Fix bad parsing of lesskey file an env var is a prefix of another env var
- Fix unexpected exit using -K if a key press is received while reading the input file

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta/recipes-extended/less/{less_678.bb => less_679.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/less/{less_678.bb => less_679.bb} (95%)

diff --git a/meta/recipes-extended/less/less_678.bb b/meta/recipes-extended/less/less_679.bb
similarity index 95%
rename from meta/recipes-extended/less/less_678.bb
rename to meta/recipes-extended/less/less_679.bb
index 87ec6c92ca..613c71f571 100644
--- a/meta/recipes-extended/less/less_678.bb
+++ b/meta/recipes-extended/less/less_679.bb
@@ -29,7 +29,7 @@ SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "4c085364f3028290d34647df27f56018c365dc4c0092ab7de74ed8fe89014fe7"
+SRC_URI[sha256sum] = "9b68820c34fa8a0af6b0e01b74f0298bcdd40a0489c61649b47058908a153d78"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.43.0



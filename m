Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41550CCFA0D
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:47:41 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2987.1762386453730347649
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:47:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FR/bRATT;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386454; x=1793922454;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fQ8IlUzka9u+oirjGUQw7ybswtUqCqrauB5ouaeFeUg=;
  b=FR/bRATTgoWzzVCRpbBlv9JnOb6LUMqpIevtS7OwY5PSHEliF0qipJAn
   1MDuo9vytkfsM/1wqEimGqgAx9zXE20UgAnXgfhoFzptuMU9IflXRqb0f
   943Sot/E8KwMJQp57c7SwvjrTVam3JaPrwaz1T5+tKn9jZ8punyriRqCh
   gufFlHDqM7VlIwTJj1tgGYxv78oRkTxIRL0Mbwt7vaVmG2/aDVMh1ieYC
   MW7vR5OvYW5h3Zvl0iLy13+oR3ZH2MCgMQTdS5keupOF8Y3Bc8IhUUjMV
   5ZO6Q9DhG+t46H5ICPYgNA0JUnFEQk1xuWUH/brFLgUeFgoRrFmsv6p4p
   w==;
X-CSE-ConnectionGUID: ZE8L9LH8RVer4OGTrFtgFg==
X-CSE-MsgGUID: 3IGs3ZFRSQGDeXn7dN1Xzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="218188328"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="218188328"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:47:32 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 3DD041C005F1
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:32 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id E8F4718019AA
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:31 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 66B3114002E7;
	Wed,  5 Nov 2025 23:47:29 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/29] ell: upgrade 0.79 -> 0.80
Date: Thu,  6 Nov 2025 07:46:51 +0800
Message-ID: <20251105234712.446-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251105234712.446-1-wangmy@fujitsu.com>
References: <20251105234712.446-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:47:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225938

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Fix issue with ECDHE client key exchange.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/ell/{ell_0.79.bb => ell_0.80.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.79.bb => ell_0.80.bb} (88%)

diff --git a/meta/recipes-core/ell/ell_0.79.bb b/meta/recipes-core/ell/ell_0.80.bb
similarity index 88%
rename from meta/recipes-core/ell/ell_0.79.bb
rename to meta/recipes-core/ell/ell_0.80.bb
index 8bd0f8badd..90474dadae 100644
--- a/meta/recipes-core/ell/ell_0.79.bb
+++ b/meta/recipes-core/ell/ell_0.80.bb
@@ -15,4 +15,4 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "28dabdb1966fd2e47363c44e041de507e9420411b846947efa01b4cb0cda0d6b"
+SRC_URI[sha256sum] = "6efc70ae6d3e2ca1ec255ecd855a3d5fadefe59897f4307816e3ba7a771f3d00"
-- 
2.43.0



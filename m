Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65886CD98CC
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 09:50:02 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16553.1781084996753610341
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 02:49:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Xb2eWfrv;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781084997; x=1812620997;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nWKs/CMIcFFSTZPWh2y8bO4cv/M55NpcYNllXqUSMl4=;
  b=Xb2eWfrvMvD4vlCxPrXUm0gamRO5ljL1tlZ8E1u0RXUr4DCmvw2FzxF3
   eGteWtSeOiW95rVXxA/u39hZuCCqKgj+OjoPoSvWBaex3sKlsQQNFNxnI
   OzFtqS2LbUIHAOSuG4dUoqExdjCLTLC4SgnPTubbDikekNraXpojzOZMS
   n+5dMjq1KrWG8zkezDkLYbU0SQByyQXomCcM32pQ2cOys+nq/+XK1GQYd
   nEJwzAPUHYTl55AplR0dXRKY8icCWAXAT14Gc9+z+u6avXG4VUodYxwv9
   EOIvjid0CyKpA53/YXWemM3WWLqwCjfEFPW2mZM/m7LLbytPh1S2ClkPK
   Q==;
X-CSE-ConnectionGUID: LWDsqemMQaa76FGnOEEcgg==
X-CSE-MsgGUID: eJQ1BzWgQ4OUkF+QrwFHQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="246966921"
X-IronPort-AV: E=Sophos;i="6.24,197,1774278000"; 
   d="scan'208";a="246966921"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 18:49:56 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 577D81000343
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:49:55 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 0959C1C1746E
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:49:55 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 1EF93140027D;
	Wed, 10 Jun 2026 09:49:52 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/16] file: upgrade 5.47 -> 5.48
Date: Wed, 10 Jun 2026 17:49:23 +0800
Message-ID: <20260610094932.2264-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260610094932.2264-1-wangmy@fujitsu.com>
References: <20260610094932.2264-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:50:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238333

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
* add landlock support
* add BE/LE GUID
* multiple fixes to prevent integer overflow in 32 bits
* PR/745: streamout: Don't flush when trying to set negative offsets
          on pipes, just continue, fixes 'cat file.zip | file -'
* PR/753: vmihalko: Fix race is magic_getpath()
* PR/728: Anton Monroe: Reinstate regex/c

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/file/{file_5.47.bb => file_5.48.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/file/{file_5.47.bb => file_5.48.bb} (97%)

diff --git a/meta/recipes-devtools/file/file_5.47.bb b/meta/recipes-devtools/file/file_5.48.bb
similarity index 97%
rename from meta/recipes-devtools/file/file_5.47.bb
rename to meta/recipes-devtools/file/file_5.48.bb
index 528ed49a12..20e167f436 100644
--- a/meta/recipes-devtools/file/file_5.47.bb
+++ b/meta/recipes-devtools/file/file_5.48.bb
@@ -14,7 +14,7 @@ DEPENDS:class-native = "bzip2-replacement-native"
 SRC_URI = "git://github.com/file/file.git;branch=master;protocol=https \
            "
 
-SRCREV = "7d20612996567ecedec7f5c58f7bf15c2cf42c19"
+SRCREV = "eb754ace19fed5481d8142426543100a2d6bae4e"
 
 inherit autotools update-alternatives
 
-- 
2.43.0



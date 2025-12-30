Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA053E9413E
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 09:17:49 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61242.1767086261189154625
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 01:17:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LFwutNrg;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767086267; x=1798622267;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Vb/1vc8MeoZ+IFLHqcdvZELcD+LVKg7HxXo5s/Nu9Hc=;
  b=LFwutNrg8nE7Eh+MHNfYF73xWRKQ3KqcXBUiF1srua7OXPv03h4i39fn
   RYScyIJk2Oy287FbJ1jV3JVNT9UGmMa2YAMILI2Gja39qItFv9kXVc9by
   KU5ZjipGv0eZzkFHFU6+WkplS5CIfNHkYKomC1k4AYedS7QTEnIQM42t5
   GR/d/GplAX24WqMQ4kBTjjd4vlYM55c1BChinY0Fjs+ywXh7h840kO9c1
   WZG3SHzbx31ifQNoe9ZQJDxnPWKnoh/q65phstkMGjE6CTYvUQ+3X9T70
   JjwlVFtlBWj8tdpRagtCaVvtaUSGZ4fJ0c3uIoZYMiXmP3CcyU7Hx2YIW
   A==;
X-CSE-ConnectionGUID: SWR6Er6fTJuPbu+UEFDpQg==
X-CSE-MsgGUID: 7nPE9xWmQLGaO/nCEIjSIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="228271205"
X-IronPort-AV: E=Sophos;i="6.21,188,1763391600"; 
   d="scan'208";a="228271205"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 18:17:46 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 11E8542A31F
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:17:46 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id BC0251800BF9
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:17:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 451B81800514;
	Tue, 30 Dec 2025 09:17:43 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 09/12] re2c: upgrade 4.3 -> 4.3.1
Date: Tue, 30 Dec 2025 17:17:10 +0800
Message-ID: <20251230091714.1501-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251230091714.1501-1-wangmy@fujitsu.com>
References: <20251230091714.1501-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 09:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228651

From: Wang Mingyu <wangmy@fujitsu.com>

Fixed bugs:
==========
- allow conditions that have no rules except for default rule
- use unsigned character type in C/C++ examples
- fix broken end of input rule $ with captures

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/re2c/{re2c_4.3.bb => re2c_4.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/re2c/{re2c_4.3.bb => re2c_4.3.1.bb} (90%)

diff --git a/meta/recipes-support/re2c/re2c_4.3.bb b/meta/recipes-support/re2c/re2c_4.3.1.bb
similarity index 90%
rename from meta/recipes-support/re2c/re2c_4.3.bb
rename to meta/recipes-support/re2c/re2c_4.3.1.bb
index eafdf93078..bead73279f 100644
--- a/meta/recipes-support/re2c/re2c_4.3.bb
+++ b/meta/recipes-support/re2c/re2c_4.3.1.bb
@@ -7,7 +7,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "51e88d6d6b6ab03eb7970276aca7e0db4f8e29c958b84b561d2fdcb8351c7150"
+SRC_URI[sha256sum] = "5f5e8a618960f68bb46ee8728ecd4132e1275b595cfc7a48476f977afd01d0cc"
 GITHUB_BASE_URI = "https://github.com/skvadrik/re2c/releases"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0



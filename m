Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C3D8108E1C9
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:15:25 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7867.1773915316565450898
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:15:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=noM8kWUL;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915316; x=1805451316;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r/TiurbcxnQQ1wCxYFHZ23g4Z31So6Fuok7nXAfrUFI=;
  b=noM8kWUL/C8j72u6ZgYC1S5niuEXSrHvEe9gUsobVqqK7zMXyYs4M7/y
   lpohi4bRfQhdwRXFx97QXXQ2xnFFKN2QzvFKyTo6RLxKqVbbSeQYT7jc2
   4CnKg/g3eAqUNtU3joC4dF0A/kDHRvXsYa6mwvn5a8oy/XY/dD4msAQzz
   K1hL0EcqE1uSHIHw7IyupADZVNdYWpExj5lGz7JCyhIXS1AT/jZeHiTjD
   lJL0ro1549kQupZilcFCde3jD+Lu9QVvQ1icgMv1RkT7WGKPjEZzLvZlx
   PLY9Y/Mr3dq9iemZuKb6izMIsFMsCLWf2QvjP1aVxTK1wNJesvzwWUpC2
   w==;
X-CSE-ConnectionGUID: AuMSbp4ASIKT8gtqOO9qJA==
X-CSE-MsgGUID: Oxhpm/ntSdypZ8YLJamDyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="221352224"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="221352224"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:15:15 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 1BE68100037F
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:15 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id C17DDC03418
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:14 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id E37D6101E532;
	Thu, 19 Mar 2026 10:15:11 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 27/40] python3-pyopenssl: upgrade 25.3.0 -> 26.0.0
Date: Thu, 19 Mar 2026 18:13:19 +0800
Message-ID: <20260319101332.2067-27-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233489

From: Wang Mingyu <wangmy@fujitsu.com>

Changes:
- Added support for using aws-lc instead of OpenSSL.
- Properly raise an error if a DTLS cookie callback returned a cookie longer
  than DTLS1_COOKIE_LENGTH bytes. Previously this would result in a
  buffer-overflow. Credit to dark_haxor for reporting the issue. CVE-2026-27459
- Added OpenSSL.SSL.Connection.get_group_name to determine which group name was
  negotiated.
- Context.set_tlsext_servername_callback now handles exceptions raised in the
  callback by calling sys.excepthook and returning a fatal TLS alert.
  Previously, exceptions were silently swallowed and the handshake would proceed
  as if the callback had succeeded. Credit to Leury Castillo for reporting this
  issue. CVE-2026-27448

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-pyopenssl_25.3.0.bb => python3-pyopenssl_26.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyopenssl_25.3.0.bb => python3-pyopenssl_26.0.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_26.0.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb
rename to meta/recipes-devtools/python/python3-pyopenssl_26.0.0.bb
index b5230293d2..ca2ee93d29 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_25.3.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_26.0.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl python3-cryptography"
 
-SRC_URI[sha256sum] = "c981cb0a3fd84e8602d7afc209522773b94c1c2446a3c710a75b06fe1beae329"
+SRC_URI[sha256sum] = "f293934e52936f2e3413b89c6ce36df66a0b34ae1ea3a053b8c5020ff2f513fc"
 
 inherit pypi setuptools3
 
-- 
2.43.0



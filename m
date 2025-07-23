Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD927C83F27
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 01:07:12 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.3858.1753232823814032003
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 18:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eqaKmF21;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753232825; x=1784768825;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N9m7S8e6oxldwpvAltZ8w93cwBoPjUEdMzRcCBpmh+M=;
  b=eqaKmF2106w9ufe9P+DNiDOX/3YGmiurN5OkOAsvlLgAC9Jv0oGZmUju
   i2a5qh2Dhs4OludzJLnAifyVfwMUJZWiulK6koPbaubYlt6diAYwcexQ1
   Aopeqy3s+lmFOuoF4tCmy2kn9/HFpkcypn/xbbqjTDHuLeYeQmpebfwGi
   BoYH5388tTVCmRGLM1kNBy7h+Uvf5nMHx9a7FcpHuGMJZPXTcfi5n88rE
   UL4ukslyGMKpSfJpVRYCTmwEptikjCw6pA/ydpq0OR0SoAF6FXvdBBAtt
   tS7F7qOULj9OHGqyqy3wofiisFze9nqsORWw04ds0aK1WNVHn56kGsdDV
   g==;
X-CSE-ConnectionGUID: c+Th0TW4RGq2n6fXFJsnrg==
X-CSE-MsgGUID: am7ZG5DcTamXTBEznhSzgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="207079086"
X-IronPort-AV: E=Sophos;i="6.16,333,1744038000"; 
   d="scan'208";a="207079086"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 10:07:03 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 0955C8203D4
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 01:07:02 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 790E1C00835
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 01:07:01 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 95A501A0074;
	Wed, 23 Jul 2025 09:06:58 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 10/12] python3-typing-extensions: upgrade 4.14.0 -> 4.14.1
Date: Wed, 23 Jul 2025 09:06:12 +0800
Message-ID: <20250723010614.926-10-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250723010614.926-1-liuyd.fnst@fujitsu.com>
References: <20250723010614.926-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 01:07:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220769

Changelog:
==========
- Fix usage of typing_extensions.TypedDict nested inside other types
(e.g., typing.Type[typing_extensions.TypedDict]). This is not allowed by the
type system but worked on older versions, so we maintain support.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...extensions_4.14.0.bb => python3-typing-extensions_4.14.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-typing-extensions_4.14.0.bb => python3-typing-extensions_4.14.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-typing-extensions_4.14.0.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.14.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-typing-extensions_4.14.0.bb
rename to meta/recipes-devtools/python/python3-typing-extensions_4.14.1.bb
index 1c03aacc10..32edb656db 100644
--- a/meta/recipes-devtools/python/python3-typing-extensions_4.14.0.bb
+++ b/meta/recipes-devtools/python/python3-typing-extensions_4.14.1.bb
@@ -16,7 +16,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 PYPI_PACKAGE = "typing_extensions"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "8676b788e32f02ab42d9e7c61324048ae4c6d844a399eebace3d4979d75ceef4"
+SRC_URI[sha256sum] = "38b39f4aeeab64884ce9f74c94263ef78f3c22467c8724005483154c26648d36"
 
 inherit pypi python_flit_core
 
-- 
2.43.0



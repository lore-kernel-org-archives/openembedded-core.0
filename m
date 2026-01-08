Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A4AD1488A
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 01:41:20 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22491.1767836473262962394
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 17:41:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AJtTRQCT;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767836473; x=1799372473;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bMB6jD42SWAMq6reKtAgor7TztbT682rmvBJrWYy9a8=;
  b=AJtTRQCTKtLDUU2hZToIFlO2iWT3E57XjD/DvQCejSiRQyQcm8O8+KqJ
   gYdnNr6kHKDWApxeAnwfIUJqLOmvTKP8en3TVyRKjhQWRPfXTdrR28YCC
   WXd3YR0AqGjTZj5jBg2o19gKwf13kMCbUkoYJOd/r2OFL+XCRrpHPDrVa
   6/O//u23elItEJSbG448Nb4GPJCXLvM/eZFpblJ/e87PX8NtD+X3L3Nqz
   PkhyGCNR7yPr/5OyZXN8K+n2+L6rb278H14tshvErahlH/JpWPzPS4zMY
   mUsmklFXgYdp4AuVFhSJ8dBBbRP2cnjPkKIerXJPSuZaQZbRF5pjmyip/
   A==;
X-CSE-ConnectionGUID: s8FUZjgQRkukNtvd1SKgWg==
X-CSE-MsgGUID: b6MxYGJXSLWrC8wVtuJMOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="225095459"
X-IronPort-AV: E=Sophos;i="6.21,209,1763391600"; 
   d="scan'208";a="225095459"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 10:41:11 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 664CB100035B
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Jan 2026 01:41:11 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 1C3C3C02E50
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Jan 2026 01:41:11 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id E6C248214E1
	for <openembedded-core@lists.openembedded.org>; Thu,  8 Jan 2026 01:41:08 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] python3-roman-numerals-py: upgrade 3.1.0 -> 4.1.0
Date: Thu,  8 Jan 2026 09:41:01 +0800
Message-ID: <20260108014101.1974-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jan 2026 01:41:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229036

1.Changelog:
  Restore LICENCE.rst in the roman-numerals-py meta-package
  Add some debug assertions for unsafe blocks

2.Add bbclass python_setuptools_build_meta to solve following error:
  pyproject_hooks._impl.BackendUnavailable: Cannot import 'setuptools.build_meta'
  ERROR Backend 'setuptools.build_meta' is not available.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...umerals-py_3.1.0.bb => python3-roman-numerals-py_4.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-roman-numerals-py_3.1.0.bb => python3-roman-numerals-py_4.1.0.bb} (68%)

diff --git a/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb b/meta/recipes-devtools/python/python3-roman-numerals-py_4.1.0.bb
similarity index 68%
rename from meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb
rename to meta/recipes-devtools/python/python3-roman-numerals-py_4.1.0.bb
index 9a76df0de2..8689a6315f 100644
--- a/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb
+++ b/meta/recipes-devtools/python/python3-roman-numerals-py_4.1.0.bb
@@ -3,10 +3,10 @@ HOMEPAGE = "https://github.com/AA-Turner/roman-numerals/"
 LICENSE = "0BSD & CC0-1.0"
 LIC_FILES_CHKSUM = "file://LICENCE.rst;md5=bfcc8b16e42929aafeb9d414360bc2fd"
 
-SRC_URI[sha256sum] = "be4bf804f083a4ce001b5eb7e3c0862479d10f94c936f6c4e5f250aa5ff5bd2d"
+SRC_URI[sha256sum] = "f5d7b2b4ca52dd855ef7ab8eb3590f428c0b1ea480736ce32b01fef2a5f8daf9"
 PYPI_PACKAGE = "roman_numerals_py"
 UPSTREAM_CHECK_PYPI_PACKAGE = "roman_numerals_py"
 
-inherit pypi python_flit_core
+inherit pypi python_flit_core python_setuptools_build_meta
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0



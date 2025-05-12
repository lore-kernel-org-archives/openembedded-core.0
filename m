Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F08AC3ABDF
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:13 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.45918.1747040642037410105
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kw2gYdvO;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040646; x=1778576646;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=iAbzNmmKzHtmjebgWQcRsrhOWnP2CVsxKj9aNqruTZA=;
  b=kw2gYdvOZ1AGBfYlFuPesl7L+UG8X4V08/J7iboSPr2QLpN6BJtWScMS
   LQby+/vvBZZ0eokKJfx11zZAhIP1cdJWo82h7ai1LbqKweHiyPi0DnS0k
   JZz0a7rXIwi6NWXjax2NgvT1gS6t0ytIA/Qx3zJu7Zl5eGlMlMmQUSzA1
   zjZwFh6n571CfzMJe8mErNudrDdIrpKxiJy0aUfNyQWsLfFyKLyeP+U3+
   GYpENjcI4Rhp1+ixUNtgAcDSXA7n1C9pfn+S4+A+btBoJZzj5HbI0zyYZ
   8UzWelZ4yXUMKf+0k0KCs9JyKr96HsQzu6DXo/ePgrfg6kE5tR2KG86Ab
   A==;
X-CSE-ConnectionGUID: /+Ap4vu0QgOJp8klK0f6vQ==
X-CSE-MsgGUID: LCcxLlSoRNCZd/HrP3Pctg==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="198343079"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="198343079"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:04 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 59AB3D6EFE
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1C9D9D5040
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:02 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D12B81A00A0;
	Mon, 12 May 2025 17:04:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 42/56] python3-markdown: upgrade 3.7 -> 3.8
Date: Mon, 12 May 2025 17:03:25 +0800
Message-Id: <1747040619-7566-42-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216337

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Changed
-------
- DRY fix in abbr extension by introducing method create_element
- Clean up test directory by removing some redundant tests and port non-redundant cases to the newer test framework.
- Improved performance of the raw HTML post-processor

Fixed
---------
- Backslash Unescape IDs set via attr_list on toc
- Ensure md_in_html processes content inside "markdown" blocks as they are parsed outside of "markdown" blocks to keep things more consistent for third-party extensions
- md_in_html handle tags within inline code blocks better
- md_in_html fix handling of one-liner block HTML handling
- Ensure <center> is treated like a block-level element
- Ensure that abbr extension respects AtomicString and does not process perceived abbreviations in these strings
- Ensure smarty extension correctly renders nested closing quotes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-markdown_3.7.bb => python3-markdown_3.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-markdown_3.7.bb => python3-markdown_3.8.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-markdown_3.7.bb b/meta/recipes-devtools/python/python3-markdown_3.8.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-markdown_3.7.bb
rename to meta/recipes-devtools/python/python3-markdown_3.8.bb
index 6a2ab36494..09c2f3435b 100644
--- a/meta/recipes-devtools/python/python3-markdown_3.7.bb
+++ b/meta/recipes-devtools/python/python3-markdown_3.8.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=ec58cdf7cfed06a21f7a9362627a5480"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "2ae2471477cfd02dbbf038d5d9bc226d40def84b4fe2986e49b59b6b472bbed2"
+SRC_URI[sha256sum] = "7df81e63f0df5c4b24b7d156eb81e4690595239b7d70937d0409f1b0de319c6f"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.43.0



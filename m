Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D2AC77B7A
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 09:17:03 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.26272.1750065419038930731
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 02:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=t4kwELFB;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750065419; x=1781601419;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HgMLNjozKRv9j042faYNkCYyO4ooCk95M0qAestMYoQ=;
  b=t4kwELFB4FNi8D6FK/KmfzvHkvl+mGtZVHtaQ+I81E12hXtUb1F4rHvR
   2/UsJfn3xdaGXvFioegCBslf5zh+bMzgeynwWGuSzUt+KvE73k5ngJbrN
   vK8AD9oiHuLySp9QgARIUN+oUQZYhlQdMbFx7XzkSiSCkxn8T351KJ+vB
   Y3xx/GWE8EBwBh95kK8nwGbiSV2EHbCp4DISHYMwBQaqPudxMK/kHM2lN
   iVU0bgKqNtq7cxlV3XHdLTv2WMtqGNnZ2DmP7+PGdQppd57MzVtk2jwRF
   anroB2+oiexbYoWxl5dVsyp4O0okSkovRFXrjIDGZYctzn34OmpzepAnL
   g==;
X-CSE-ConnectionGUID: dw8aDgyHTzuCPtKoSjiddA==
X-CSE-MsgGUID: SFuNs5k1S8iualv0+iNlCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="202102166"
X-IronPort-AV: E=Sophos;i="6.16,240,1744038000"; 
   d="scan'208";a="202102166"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:16:57 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id CFDF2D5004
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 80EC3D5042
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:53 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C28F61A0074;
	Mon, 16 Jun 2025 17:16:52 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 14/24] python3-cython: upgrade 3.1.1 -> 3.1.2
Date: Mon, 16 Jun 2025 17:16:32 +0800
Message-ID: <20250616091643.918-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250616091643.918-1-wangmy@fujitsu.com>
References: <20250616091643.918-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218788

From: Wang Mingyu <wangmy@fujitsu.com>

Bugs fixed
----------
* Attribute lookups failed on the "bool" builtin type.
* Type checks on or-ed union types could incorrectly return false.
* Negative list indexing could accidentally wrap around twice in PyPy and the Limited API.
* Iterating over literal sequences with starred (unpacked) items could infer a wrong
  type for the loop variable and fail to assign the values.
* Calls to C functions taking exception types failed to check for a 'None' argument.
* Fused functions had an incorrect "__module__" attribute.
* The type of Cython implemented functions had an incorrect "__module__" attribute.
* Errors while indexing into "bytearray" or "str" in "nogil" sections could crash.
* "bytearray.append()" could silently accept some invalid character numbers.
* The C++11 "<type_traits>" header was included regardless of the C++ version.
* "PyDict_GetItemStringRef()" was accidentally used in older Limited API versions.
* "abort()" was used but not always available in the Limited API.
* Some dependencies were missing from the "depfile".
* Embedded function signatures were not always separated from the existing docstring.
* "numpy.math" was missing from "Cython/Includes/" and could not be cimported.
* Some tests were adapted for NumPy 2.x.
* Some C compiler warnings were fixed.
* "Cython.Build" was not officially exposing the "cythonize" function.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cython_3.1.1.bb => python3-cython_3.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cython_3.1.1.bb => python3-cython_3.1.2.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-cython_3.1.1.bb b/meta/recipes-devtools/python/python3-cython_3.1.2.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-cython_3.1.1.bb
rename to meta/recipes-devtools/python/python3-cython_3.1.2.bb
index 1bc6eda4ac..77dbbe8b2c 100644
--- a/meta/recipes-devtools/python/python3-cython_3.1.1.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.1.2.bb
@@ -7,7 +7,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 
-SRC_URI[sha256sum] = "505ccd413669d5132a53834d792c707974248088c4f60c497deb1b416e366397"
+SRC_URI[sha256sum] = "6bbf7a953fa6762dfecdec015e3b054ba51c0121a45ad851fa130f63f5331381"
 
 inherit pypi setuptools3 cython
 
-- 
2.43.0



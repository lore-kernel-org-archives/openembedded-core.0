Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06DB1C47258
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 09:17:55 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.74280.1705310272932269575
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 01:17:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="146153017"
X-IronPort-AV: E=Sophos;i="6.04,196,1695654000"; 
   d="scan'208";a="146153017"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 18:17:51 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1CD43C14A1
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:17:48 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 52BFABF3C5
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:17:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E97DA202CCD24
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:17:46 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7E2771A0070;
	Mon, 15 Jan 2024 17:17:46 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-cython: upgrade 3.0.7 -> 3.0.8
Date: Mon, 15 Jan 2024 17:17:16 +0800
Message-Id: <1705310236-24392-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28120.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28120.006
X-TMASE-Result: 10--0.050300-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mruoYFb0nRiqMf0wrpkdMLWlNp
	x0NRruuf10tb9E75znw18CUuLuHkY1UOrgtLp608/HTKStsDGMJyGvikEsYi8N9RlPzeVuQQ1vZ
	7s3YIVDJRQk2usXqRT6GCpFd/1kOaL/tBTZzO5Q07Cl8sx4HBG8PCYXPGeJYnAhn751acftuem2
	vw+cenKeLzNWBegCW29sZ0UX0EaOILbigRnpKlKZx+7GyJjhAULRIMZkyHkHXxPlpSoI06pOsr6
	gAYTG3MqnOnPnpCLuLLLDssnvsdC45+ZqbsCje0cvczV7J7BPSrMu/z/C8QMDCofHWOtELT7H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 09:17:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193653

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Using "const" together with defined fused types could fail to compile.
* A "use after free" bug was fixed in parallel sections.
* Several types were not available as "cython.*" types in pure Python code.
* The generated code is now correct C89 again, removing some C++ style "//" comments
  and C99-style declaration-after-code code ordering.  This is still relevant for some
  ols C compilers, specifically ones that match old Python 2.7 installations.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/python/python-cython.inc                  | 2 +-
 .../python/{python3-cython_3.0.7.bb => python3-cython_3.0.8.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cython_3.0.7.bb => python3-cython_3.0.8.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
index bc1953c504..d116eb826d 100644
--- a/meta/recipes-devtools/python/python-cython.inc
+++ b/meta/recipes-devtools/python/python-cython.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "fb299acf3a578573c190c858d49e0cf9d75f4bc49c3f24c5a63804997ef09213"
+SRC_URI[sha256sum] = "8333423d8fd5765e7cceea3a9985dd1e0a5dfeb2734629e1a2ed2d6233d39de6"
 UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
 
 inherit pypi
diff --git a/meta/recipes-devtools/python/python3-cython_3.0.7.bb b/meta/recipes-devtools/python/python3-cython_3.0.8.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-cython_3.0.7.bb
rename to meta/recipes-devtools/python/python3-cython_3.0.8.bb
-- 
2.34.1



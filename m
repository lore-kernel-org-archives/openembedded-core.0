Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB76C021B7
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 07:41:39 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.14628.1739864485290970726
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Feb 2025 23:41:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZsDqvSku;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739864492; x=1771400492;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=PLitvTNyZ4X4N6ZVvymbpQKrcEBtUaC9MAELtab8Hvs=;
  b=ZsDqvSkuG+WZGVirS+ubY32Koc3vzfEkDYqwRyA9O/sWZVmOvw9OH8il
   z8ZW13Jd9Va4NHrZKw/lKnye60xGqUE7QE35tYw8HiRFG623cBbCywUTD
   0FHzjHnsm744xk4FP4ag3NPm0jFM2DfgOjigrEleKEZHdB4tajRZ/7ud6
   qIffszx0cuA1hgErInDhIU3jDRTUHu5anJHKxuih5XAKpJKfe3CYFK2GZ
   mXgAaRT+0yhbLCQmtNLabzOrXnwbrtfYQJfHm28yVOoU4q+aQ9ldcx/K8
   ejHmVb2/c70Q4OdRa/SWhvMzEbLuzNgVjW2Zu4v8ryeRkvOpJeLUpmUG5
   g==;
X-CSE-ConnectionGUID: hc3uhkUgTIi6cmh0awCjBQ==
X-CSE-MsgGUID: udYVt9KzRcKV9+Ed2S1mBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="169232669"
X-IronPort-AV: E=Sophos;i="6.13,295,1732546800"; 
   d="scan'208";a="169232669"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:41:31 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2BEF9142DA
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id EA9CBF313
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 16:41:28 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B12FE1A0071;
	Tue, 18 Feb 2025 15:41:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 24/32] python3-psutil: upgrade 6.1.1 -> 7.0.0
Date: Tue, 18 Feb 2025 15:39:27 +0800
Message-Id: <1739864375-21394-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 07:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211585

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- net_if_addrs() also returns the broadcast address instead of None.
- Python 2.7 is no longer supported. Latest version supporting Python 2.7 is
  psutil 6.1.X. Install it with: pip2 install psutil==6.1.*.
- removed long deprecated Process.memory_info_ex() method. It was deprecated in
  psutil 4.0.0, released 8 years ago. Substitute is Process.memory_full_info().
- Avoid segfault (a cPython bug) on Process.memory_maps() for processes that use
  hundreds of GBs of memory.
- virtual_memory() now relies on host_statistics64 instead of host_statistics.
  This is the same approach used by vm_stat CLI tool, and should grant more accurate results.
- Python 2.7 is no longer supported.
- removed long deprecated Process.memory_info_ex() method.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-psutil_6.1.1.bb => python3-psutil_7.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-psutil_6.1.1.bb => python3-psutil_7.0.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-psutil_6.1.1.bb b/meta/recipes-devtools/python/python3-psutil_7.0.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-psutil_6.1.1.bb
rename to meta/recipes-devtools/python/python3-psutil_7.0.0.bb
index 9cd2d20fff..22ead67ad9 100644
--- a/meta/recipes-devtools/python/python3-psutil_6.1.1.bb
+++ b/meta/recipes-devtools/python/python3-psutil_7.0.0.bb
@@ -3,7 +3,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a9c72113a843d0d732a0ac1c200d81b1"
 HOMEPAGE = "https://pypi.org/project/psutil/"
 
-SRC_URI[sha256sum] = "cf8496728c18f2d0b45198f06895be52f36611711746b7f30c464b422b50e2f5"
+SRC_URI[sha256sum] = "7be9c3eba38beccb6495ea33afd982a44074b78f28c434a1f51cc07fd315c456"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0



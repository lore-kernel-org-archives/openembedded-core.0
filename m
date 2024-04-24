Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D69CC25B76
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:15 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.11726.1713948187326415360
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=opqJKvgc;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948188; x=1745484188;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=wo3TKAmJBb5AXDrQezXKfKob98ndHXciLgIGtnQ+Ifg=;
  b=opqJKvgc8GkZ7m+tcdLj0Z9b/0PJECU7kPqQBke68iAj/VzbcVQUn0KD
   VPLbX56ZGXhHarOHjO/rNA76p+4dp3s7BDzs8uZE8Dis12c05W8jY0mVb
   3/BY6lhCkBJhO7nA18YeeVCbGHA0jufn6I+wdH0qVFZSdp7mpRh+ABeJG
   jp7lj6cvXImjcDnOQXyiDBA7/KEE3L4Kd6XP1eYHx6N0fP8zgwvzd/ZuY
   LVTkwYXW4ep4T/jWF2ueY5mwv/WEao2I/EelEg+cFUXMBv+rFX4ltyLk7
   Rs286J9YbDEPWg+4womHFIiQCAaXryyKo5Ohj/m9DFHBWh2DEtsab6cy2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="156537568"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="156537568"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:43:06 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 02F39152F9
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:03 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2D81ED52EF
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id BBE551EA822
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:01 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 66FC91A000B;
	Wed, 24 Apr 2024 16:43:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 20/38] python3-beartype: upgrade 0.18.2 -> 0.18.5
Date: Wed, 24 Apr 2024 16:42:14 +0800
Message-Id: <1713948152-13501-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10-1.621100-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGEWNbZfbxvwGOwpfLMeBwRuuLG21Eb4T84Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXIfzaFWNenM6x5smb+JNiTXFKf359rbune1rL
	mZ+1sPxKIjuznJNNnE+Lvu9NeOn0chSC3uCjwwZ+HkDApFncvrkYHQirshob/+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198667

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-beartype_0.18.2.bb => python3-beartype_0.18.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-beartype_0.18.2.bb => python3-beartype_0.18.5.bb} (75%)

diff --git a/meta/recipes-devtools/python/python3-beartype_0.18.2.bb b/meta/recipes-devtools/python/python3-beartype_0.18.5.bb
similarity index 75%
rename from meta/recipes-devtools/python/python3-beartype_0.18.2.bb
rename to meta/recipes-devtools/python/python3-beartype_0.18.5.bb
index 1b6ab6a42b..04fbd3139f 100644
--- a/meta/recipes-devtools/python/python3-beartype_0.18.2.bb
+++ b/meta/recipes-devtools/python/python3-beartype_0.18.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://beartype.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e71f94261c1b39896cacacfeaf60560e"
 
-SRC_URI[sha256sum] = "a6fbc0be9269889312388bfec6a9ddf41bf8fe31b68bcf9c8239db35cd38f411"
+SRC_URI[sha256sum] = "264ddc2f1da9ec94ff639141fbe33d22e12a9f75aa863b83b7046ffff1381927"
 
 inherit setuptools3 pypi
 
-- 
2.34.1



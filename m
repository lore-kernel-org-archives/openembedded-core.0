Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3375C54E5A
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 07:33:41 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.8395.1709105612164643064
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 23:33:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=o8M5D9LJ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709105616; x=1740641616;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=oo8g0TBnuf+d5PwYiWDL0q45AMQCwsI9+7WjjG6PPDs=;
  b=o8M5D9LJbxl10bn+VQGY6/th2i6FEw4rsfId6b29P6MDbz3ddxxaGCXq
   DWVgTUmmZnlXawWd8+VEwbRB3MXDmbZEYxkGcO5oQ9kvJR+2asuedoeUK
   PNqm3FKIkrGl6iiw6Jm414HJfTAy9z3yzS0vQhpR08QjihtQT204qKlvp
   CpUZd922rXydhfC62z1EO5GUZrEgu5CJlSvLNS4ZwpTtKnx093LFzdvQW
   NGhMGq5QKWhEYhFcf3acj3aiAhp/iEEy/ApwT/yp538t04OIqVNOXayuc
   7XNzAG/RFhM2wPhVIL7UKDSOuli0GEViL1gU47zkH2tVh6skOgYNKWjbc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="138291827"
X-IronPort-AV: E=Sophos;i="6.06,190,1705330800"; 
   d="scan'208";a="138291827"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 16:33:35 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 22DA12A0DFE
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:33 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 60D7BCFAC8
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E6EAE2008FF8D
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 16:33:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 95A721A006A;
	Wed, 28 Feb 2024 15:33:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 30/48] python3-beartype: upgrade 0.17.0 -> 0.17.2
Date: Wed, 28 Feb 2024 15:32:37 +0800
Message-Id: <1709105575-24259-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
References: <1709105575-24259-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28218.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28218.005
X-TMASE-Result: 10-1.621100-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGEWNbZfbxvwGOwpfLMeBwRuuLG21Eb4T84Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXLzFfz2cw/XuSJKk9dVBKWeDSiiLDZfFS4+5I
	wwW1qaXBQ1xJ5hAxRPZPFdxFr1bG3t0OFALs0/IuaZe7R1LncNy1gXLHx/l9r+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 07:33:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196354

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-beartype_0.17.0.bb => python3-beartype_0.17.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-beartype_0.17.0.bb => python3-beartype_0.17.2.bb} (75%)

diff --git a/meta/recipes-devtools/python/python3-beartype_0.17.0.bb b/meta/recipes-devtools/python/python3-beartype_0.17.2.bb
similarity index 75%
rename from meta/recipes-devtools/python/python3-beartype_0.17.0.bb
rename to meta/recipes-devtools/python/python3-beartype_0.17.2.bb
index 7b14a3794b..05fd74543b 100644
--- a/meta/recipes-devtools/python/python3-beartype_0.17.0.bb
+++ b/meta/recipes-devtools/python/python3-beartype_0.17.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://beartype.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e71f94261c1b39896cacacfeaf60560e"
 
-SRC_URI[sha256sum] = "3226fbba8c53b4e698acdb47dcaf3c0640151c4d405618c281e6631f4112947d"
+SRC_URI[sha256sum] = "e911e1ae7de4bccd15745f7643609d8732f64de5c2fb844e89cbbed1c5a8d495"
 
 inherit setuptools3 pypi
 
-- 
2.34.1



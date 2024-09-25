Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A21CF58ED
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:55 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.9320.1727246989147612632
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dIMsuPpQ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246989; x=1758782989;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ADF+6begrRtWmrtoEtgMsYTLaXT0Zdj8kSUEVAfoQ1o=;
  b=dIMsuPpQhYH+T1+Oo3e9h1wUgrmCaVQRNGbdVbG2xph7liXqGY9uHb5C
   IMeeQlsxEZwAOQ1it7z1jucSOG43wk6YYEWJFPXek3aP4slhcQSTyELty
   HocxjD6Ag2Q1Xz6X7XaOflHhqvPga1AfLgTBHvapXZBYJZUiFSVHsdAJa
   3CHLxotsjbtDJIBnHdKcfexWA2lLuyc0x6wys4QZ+mWDtnVRDTbGVjK10
   slNnRd85XN+90ejb1SCM7vTqwbU8/vGFd5B+9TgjE8z9MIDzLsrUERKJI
   gCmkWvd2DpqrQrg9I41uvTmLmx/POCVhrTQQTsEtezjsr+UKwjtuYqQau
   A==;
X-CSE-ConnectionGUID: bYUmumoeTx2h1CaOy5vRuw==
X-CSE-MsgGUID: 7qm7f1s2S5GFe5GRpSA6eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="162105421"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="162105421"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:47 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1047DD8011
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:45 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 50BE8BF3D6
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id DB4F420086326
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:43 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8BDE21A000A;
	Wed, 25 Sep 2024 14:49:43 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 28/47] python3-idna: upgrade 3.8 -> 3.10
Date: Wed, 25 Sep 2024 14:49:01 +0800
Message-Id: <1727246960-20665-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10-0.568700-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMOuce7gFxhKa3zndiJkHFMhFtRKarSV80bo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXINw1j094Dbqh2K143P9ekacHXPF0xlouE1Gy
	EjpErJbDJfX4z5aOFym/EOfHBSxOCR1oTI2oii1OqOla7sNAqBvi+isOM1bFH+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204916

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Deprecate setup.cfg in favour of pyproject.toml
- Use ruff for code formatting

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-idna_3.8.bb => python3-idna_3.10.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-idna_3.8.bb => python3-idna_3.10.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-idna_3.8.bb b/meta/recipes-devtools/python/python3-idna_3.10.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-idna_3.8.bb
rename to meta/recipes-devtools/python/python3-idna_3.10.bb
index 95c3c8cc44..854dc35242 100644
--- a/meta/recipes-devtools/python/python3-idna_3.8.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.10.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kjd/idna"
 LICENSE = "BSD-3-Clause & Python-2.0 & Unicode-TOU"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=204c0612e40a4dd46012a78d02c80fb1"
 
-SRC_URI[sha256sum] = "d838c2c0ed6fced7693d5e8ab8e734d5f8fda53a039c0164afb0b82e771e3603"
+SRC_URI[sha256sum] = "12f65c9b470abda6dc35cf8e63cc574b1c52b11df2c86030af0ac09b01b13ea9"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.34.1



Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E599CD342C
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 08:33:18 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.18357.1725352394100647992
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 01:33:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ES+tSFZ4;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725352395; x=1756888395;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=hYfqcqODjYlGaZo2AhEDFBBxGdOq5OKCQgufuLw9xAQ=;
  b=ES+tSFZ4avvTzjLBTee/969Vwc4yHmWqEFel54mZ8uuM71DBuKOzKL03
   ABPkESXIK6+3m0+JBpK/+5nFiZAXfQktnEQvnyQKs7EvFaN7gkK/aKCOE
   /jbde7ft/0p+t9AeXG/+3Sd1Eu3BsL+654id9uwctaZ/BVGbW/+3kk+YN
   jQYQ3KxDVrtdcpFt4iFKGS8Y0Eimy3XGZAR6Qc8kC/RKKtyQvXz+3W8mj
   VMnSNkmL+WOvm2+rC/qlylqiQG59PpWy17BF0kGl0hgXebZnKEBrHzoov
   slrjcClI0b8fbArVaRtwoJMFsrMvDwZa24HnazLPUywHtI0DjJY0NE6ZZ
   Q==;
X-CSE-ConnectionGUID: 7dOvwLskTvqyMD4AfHCaNQ==
X-CSE-MsgGUID: 1koIRQJRT+O7bHdR7yPVvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="159919350"
X-IronPort-AV: E=Sophos;i="6.10,198,1719846000"; 
   d="scan'208";a="159919350"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 17:33:12 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1FE5AC68E6
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:10 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6232C103E3
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:09 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E98346C811
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:08 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8B6D61A000C;
	Tue,  3 Sep 2024 16:33:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/22] diffoscope: upgrade 276 -> 277
Date: Tue,  3 Sep 2024 16:32:41 +0800
Message-Id: <1725352379-20334-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
References: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28638.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28638.006
X-TMASE-Result: 10--3.081800-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrg55m5RSwLML+Aw16GgqpO0YW
	rlwuTVqz6xjZ53WIKh+ghdqjkPMyFu1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ6Po
	oNqqZn93i8zVgXoAltr8hWd4lAsFlC24oEZ6SpSmcfuxsiY4QFNuj8+a2g3QKq8aQZafUKTds0Z
	stCZemRoL0czICATnjxLRFhkibzZ+q7pkko9cfxOd5ijrcUdjV4p89SI7+vEBByR9l9RRp+ux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 08:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204132

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Don't crash when attempting to hashing symlinks with targets that point to
  a directory.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../diffoscope/{diffoscope_276.bb => diffoscope_277.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_276.bb => diffoscope_277.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_276.bb b/meta/recipes-support/diffoscope/diffoscope_277.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_276.bb
rename to meta/recipes-support/diffoscope/diffoscope_277.bb
index ed8ae52d9a..f609e607f3 100644
--- a/meta/recipes-support/diffoscope/diffoscope_276.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_277.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "094d1f8c312ef9e776247c5f7653b7953dc9c41a037683a1a5937d63a232584a"
+SRC_URI[sha256sum] = "d2d4236d7b72be8344b0c7a19506350a7b17d316bcd79d7bfc113e10400b0e10"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.34.1



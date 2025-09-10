Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3BDECA0FED
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:17:39 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.13231.1757495859027367245
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:17:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TmA3pEYl;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495859; x=1789031859;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tDOuDmENgJ/a+o4+6GucQTKSLsRanM/uc7DjLnJWPn0=;
  b=TmA3pEYl45HtARbjqC93FAfIZqBYE+6V07w1VAfijybqxjlXnYyXkn+v
   Oxc7au9N5BL4wIOcav/Itrh0nNEr7RTDsIqQNegu4WvUnbaxVfQgDWQaY
   BZrj10OfHEy0i8B1wH61n1jeEugODJnsJUJyn0jp/kG+JtrfKvwDlOC35
   qgBHGBHbMYHTd9tJXHfGSRhIVOd9o11uqRynaOoZRpXCrqudnTf1wy62n
   ugHGj9bWzz6lpl4nnp2eJenQzBT12wZdYxSjJd+pkxjyGeEKlS5UnngNP
   aELdoh76gp3la4slXItpIQZUMyICry+Cny2NKNrxg/bnBdYeK5sO/aDhs
   Q==;
X-CSE-ConnectionGUID: gpTZnd0PRgCDmxI3Y8CD5g==
X-CSE-MsgGUID: TXtFGU2pSA+HIzdMJ3Cnlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="212499232"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="212499232"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:17:37 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 6A7E21C1C718
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:37 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 213548D65CC
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:37 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTPS id 69B8F1013118
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:35 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 613CE1A0073;
	Wed, 10 Sep 2025 17:17:32 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 22/40] mpg123: upgrade 1.33.0 -> 1.33.2
Date: Wed, 10 Sep 2025 17:16:28 +0800
Message-ID: <20250910091646.998-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250910091646.998-1-wangmy@fujitsu.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223173

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mpg123/{mpg123_1.33.0.bb => mpg123_1.33.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.33.0.bb => mpg123_1.33.2.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.33.0.bb b/meta/recipes-multimedia/mpg123/mpg123_1.33.2.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.33.0.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.33.2.bb
index 2905bf0abc..23bb400ce5 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.33.0.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.33.2.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "2290e3aede6f4d163e1a17452165af33caad4b5f0948f99429cfa2d8385faa9d"
+SRC_URI[sha256sum] = "2c54fabbfa696dce8f9b137c8ef7a429a061f8fe633cd7d0a511809855f2c219"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.43.0



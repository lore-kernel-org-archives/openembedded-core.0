Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68916EC0495
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 10:10:07 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14971.1772532598075268807
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 02:09:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qVrcbRB+;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772532596; x=1804068596;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4kQZz/E9XzJS5mWX75IpS0fjLRk39GYEJ1iOECJxYr0=;
  b=qVrcbRB+/HU6Ng/UI0wqRXESVFBjxrO7isRdEVjQSbtgFfO2WGPNvwfx
   9Ero+CS252sVP0tOPIk7mAf8b+Ye5LxO7MUnQxqD0FPObDJTQvbGEwSk8
   8mLfIavLlyZY2GALa+stxzLoerkclY5b3f7I4/immggA5VScwAGdeE1C2
   xWvt8mDx6/WqTtjNhdNCEfUkoYnpmw3x9ul5Fj7XeMH4jYFUbv6I/lOjl
   6hA4hV/hBiHkR9wK4rjyZQk/uDSf63Huhb6HXgeb7z1t8VOePw/yMOUWy
   eyny2TU3jdaAfggCsTrQrkMi/yz1W/ziCrMreeHRDPYqK/V3F3cxNoGvt
   A==;
X-CSE-ConnectionGUID: /HMZuKR8QVanZEuMjVhPQQ==
X-CSE-MsgGUID: 6a0uG4GEQqOb6qpiaQnYOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="231685139"
X-IronPort-AV: E=Sophos;i="6.21,321,1763391600"; 
   d="scan'208";a="231685139"
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 2F7DB3AA
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:09:56 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id DF866C0037B
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:09:55 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 339E61001CE3;
	Tue,  3 Mar 2026 10:09:52 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/23] libcap-ng-python,libcap-ng: upgrade 0.9 -> 0.9.1,0.9 -> 0.9.1
Date: Tue,  3 Mar 2026 18:09:13 +0800
Message-ID: <20260303100929.1624-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260303100929.1624-1-wangmy@fujitsu.com>
References: <20260303100929.1624-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 10:10:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232284

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
- Deprecate captest
- In cap-audit, if tested app uses file system based capabilities, drop setpcap
- In cap-audit, fully resolve paths before classifying
- In cap-audit, add JSON escaping to output
- In cap-audit, filter pre-exec, startup, and shutdown capability noise
- pscap now has a --tree disply mode
- More code cleanups
- Improve output alignment of various utilities

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libcap-ng-python_0.9.bb => libcap-ng-python_0.9.1.bb}      | 0
 meta/recipes-support/libcap-ng/libcap-ng.inc                    | 2 +-
 .../libcap-ng/{libcap-ng_0.9.bb => libcap-ng_0.9.1.bb}          | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libcap-ng/{libcap-ng-python_0.9.bb => libcap-ng-python_0.9.1.bb} (100%)
 rename meta/recipes-support/libcap-ng/{libcap-ng_0.9.bb => libcap-ng_0.9.1.bb} (100%)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng-python_0.9.bb
rename to meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb
diff --git a/meta/recipes-support/libcap-ng/libcap-ng.inc b/meta/recipes-support/libcap-ng/libcap-ng.inc
index 632527eb12..9d65c889bd 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng.inc
+++ b/meta/recipes-support/libcap-ng/libcap-ng.inc
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://COPYING.LIB;md5=e3eda01d9815f8d24aae2dbd89b68b06"
 
 SRC_URI = "git://github.com/stevegrubb/libcap-ng.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "6ab1fe90fc24fcc1ed4ced635eb20166bcf00023"
+SRCREV = "427ed6d2c2b16e9b48f12953e55febfead3ef2e2"
 
 inherit lib_package autotools pkgconfig
 
diff --git a/meta/recipes-support/libcap-ng/libcap-ng_0.9.bb b/meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb
similarity index 100%
rename from meta/recipes-support/libcap-ng/libcap-ng_0.9.bb
rename to meta/recipes-support/libcap-ng/libcap-ng_0.9.1.bb
-- 
2.43.0



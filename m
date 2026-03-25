Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E52ED103A9A1
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 10:44:08 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19579.1774435447631490282
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 03:44:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BClxP2m6;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774435447; x=1805971447;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YpnJBTxzJVCpLU7WPzuMeMV21xxaz1w4hVLs4/yGMqw=;
  b=BClxP2m6rj+9N4Pf79FyTB045UeXygoLEtzbhh8kL7+VG81Mr/Ca5YeY
   UW/9LRju0RtBb4NDUwfamOKGN4SEgGV4Fa/IkiPEACkQSRz8Ox7rbdglV
   lYYEzxmP2IB4BZD3QKFyKPlyPO2CY9cxwKsUqnozSFDchZHayz4vuKWHF
   bjK3h48RvvVlemsC4Bi9S+cMIiM7BDKnzNfuoi2KQJd04STLVVyAF+UUP
   pITCUG+lkl7ecp1JeG1JipegARUKrT2HpSek/ZwIT4VsmqlvY6J6ysHVI
   yOVsBIdqb5ssZTVg8IVEcNOMmDSHSNUBxpsdmF6DPABZGpSzJPk0QxhtN
   A==;
X-CSE-ConnectionGUID: QLCPXsOvRiiQLqf5OdwT2w==
X-CSE-MsgGUID: 2yM/PvjxRRCxbslMAMkSCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="223228066"
X-IronPort-AV: E=Sophos;i="6.23,139,1770562800"; 
   d="scan'208";a="223228066"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 19:44:06 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 079A81C00087
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 10:44:06 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id A4BEC180717E
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 10:44:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 2E0024041CC;
	Wed, 25 Mar 2026 10:44:02 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] harfbuzz: upgrade 12.3.2 -> 13.2.1
Date: Wed, 25 Mar 2026 18:43:59 +0800
Message-ID: <20260325104359.1114-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 10:44:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233869

From: Wang Mingyu <wangmy@fujitsu.com>

This commit upgrades HarfBuzz to version 13.2.1, addressing
the need for a newer release with extended capabilities.

Key changes and improvements in this upgrade include:
* New hb-raster and hb-vector libraries:** HarfBuzz 13.x introduces 'hb-raster'
  for glyph rasterization and 'hb-vector' for vector output.
* Optional libpng and zlib dependencies:** The new 'hb-raster' and 'hb-vector'
  libraries may optionally depend on 'libpng' and 'zlib' for specific functionalities
* PACKAGECONFIG for libpng and zlib
* Separate Packaging for hb-raster and hb-vector

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{harfbuzz_12.3.2.bb => harfbuzz_13.2.1.bb}         | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_12.3.2.bb => harfbuzz_13.2.1.bb} (76%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_13.2.1.bb
similarity index 76%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_13.2.1.bb
index 12bebc4bee..4a3d9df241 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_12.3.2.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_13.2.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b98429b8e8e3c2a67cfef01e99e4893d \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "6f6db164359a2da5a84ef826615b448b33e6306067ad829d85d5b0bf936f1bb8"
+SRC_URI[sha256sum] = "6695da3eb7e1be0aa3092fe4d81433a33b47f4519259c759d729e3a9a55c1429"
 
 DEPENDS += "glib-2.0-native"
 
@@ -29,11 +29,13 @@ PACKAGECONFIG ??= "cairo freetype glib icu"
 PACKAGECONFIG[cairo] = "-Dcairo=enabled,-Dcairo=disabled,cairo"
 PACKAGECONFIG[chafa] = "-Dchafa=enabled,-Dchafa=disabled,chafa"
 PACKAGECONFIG[freetype] = "-Dfreetype=enabled,-Dfreetype=disabled,freetype"
+PACKAGECONFIG[libpng] = "-Dpng=enabled,-Dpng=disabled,libpng"
+PACKAGECONFIG[zlib] = "-Dzlib=enabled,-Dzlib=disabled,zlib"
 PACKAGECONFIG[glib] = "-Dglib=enabled,-Dglib=disabled,glib-2.0"
 PACKAGECONFIG[graphite] = "-Dgraphite2=enabled,-Dgraphite2=disabled,graphite2"
 PACKAGECONFIG[icu] = "-Dicu=enabled,-Dicu=disabled,icu"
 
-PACKAGES =+ "${PN}-icu ${PN}-icu-dev ${PN}-subset"
+PACKAGES =+ "${PN}-icu ${PN}-icu-dev ${PN}-subset ${PN}-raster ${PN}-vector"
 
 LEAD_SONAME = "libharfbuzz.so"
 
@@ -48,5 +50,9 @@ FILES:${PN}-icu-dev = "${libdir}/libharfbuzz-icu.so \
                        ${libdir}/pkgconfig/harfbuzz-icu.pc \
 "
 FILES:${PN}-subset = "${libdir}/libharfbuzz-subset.so.*"
+FILES:${PN}-raster = "${libdir}/libharfbuzz-raster.so.*"
+FILES:${PN}-raster-dev = "${libdir}/libharfbuzz-raster.so ${libdir}/pkgconfig/harfbuzz-raster.pc"
+FILES:${PN}-vector = "${libdir}/libharfbuzz-vector.so.*"
+FILES:${PN}-vector-dev = "${libdir}/libharfbuzz-vector.so ${libdir}/pkgconfig/harfbuzz-vector.pc"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0



Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BACC5CA0EF8
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 08:50:00 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.15528.1755679791130702609
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 01:49:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IEuiKkw+;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755679791; x=1787215791;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=c1Vegbyso1JXbPHKSO+/ZSGzCNDcY+X34YeByhy+jPA=;
  b=IEuiKkw+89LmDjytiyY4c5jL5W/SiOXXe9UJFP1HCl9i7Xz98JQdpWFr
   iwojDf6jPWItQSFk1r081Qv85vduM7D70GJ4dQVPWMZ2F2Xk6gU0MwGaF
   hVyD8RWk0wDJ6NdC/Fu0b6qzG0R/y6TvyZa+A57miQIB4FIba7iPCmVw7
   XjNlCCpgTIltkWzQCUEy3BuumC+VnRrxfLeLAuURyyHb24GaOJFYoy0uY
   L3Z5IOxXEdpQIJsCNf1+snWwbeKsWKpxm2Akx2nlSX1h6mTJv4jvC8m5/
   EJHKTyU3vf9QW2sc9tCuyVgyGNiT7RABUphH96lTvsa8SP7aH5+pAf5ge
   Q==;
X-CSE-ConnectionGUID: zJFNMkGySUeAxAtud+/aZw==
X-CSE-MsgGUID: Vj8vaz1qSY6iUhQaEgyR2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="197444836"
X-IronPort-AV: E=Sophos;i="6.17,302,1747666800"; 
   d="scan'208";a="197444836"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 17:49:49 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 9BA521000344
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 08:49:49 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 597D51004172
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 08:49:49 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id 5787B2000289
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 08:49:47 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 474C31A0071;
	Wed, 20 Aug 2025 16:49:44 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH] nghttp2: remove nghttp2-proxy
Date: Wed, 20 Aug 2025 16:49:37 +0800
Message-ID: <20250820084937.447-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 08:50:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222161

fix issue that:
 | nothing provides nghttp2-proxy >= 1.66.0 needed by nghttp2-1.66.0-r0.core2_64 from base

nghttp2-proxy is supposed to involve files ${bindir}/nghttpx and ${datadir}/${BPN}/fetch-ocsp-response

But now nghttp2-proxy will not be created because:
1. ENABLE_APP=OFF in EXTRA_OECMAKE makes ${bindir}/nghttpx not be produced
2. 1.66.0 version has removed fetch-ocsp-response-file according to the Changelog

| cat /tmp/work/aarch64-ubinux-linux/nghttp2/1.66.0/sources/nghttp2-1.66.0/ChangeLog
| ....
| nghttpx: Remove OCSP stapling
|
| This commit removes OCSP stapling features and the following options
| are deprecated and have no effect:
|
| - fetch-ocsp-response-file
| - no-ocsp
| - no-verify-ocsp
| - ocsp-update-interval

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta/recipes-support/nghttp2/nghttp2_1.66.0.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.66.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.66.0.bb
index 2886681827..123ddb2d08 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.66.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.66.0.bb
@@ -14,15 +14,12 @@ PACKAGECONFIG[manpages] = ""
 # first place
 EXTRA_OECMAKE = "-DENABLE_EXAMPLES=OFF -DENABLE_APP=OFF -DENABLE_HPACK_TOOLS=OFF -DENABLE_PYTHON_BINDINGS=OFF"
 
-PACKAGES =+ "lib${BPN} ${PN}-proxy "
+PACKAGES =+ "lib${BPN}"
 
-RDEPENDS:${PN} = "${PN}-proxy (>= ${PV})"
 RDEPENDS:${PN}:class-native = ""
-RDEPENDS:${PN}-proxy = "openssl python3-core python3-io python3-shell"
 
 ALLOW_EMPTY:${PN} = "1"
 FILES:${PN} = ""
 FILES:lib${BPN} = "${libdir}/*${SOLIBS}"
-FILES:${PN}-proxy = "${bindir}/nghttpx ${datadir}/${BPN}/fetch-ocsp-response"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0



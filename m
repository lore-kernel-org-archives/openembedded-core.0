Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FD6AC433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 01:52:48 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web09.4636.1644457967859847739
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 17:52:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: changqing.li@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 21A1qiMX017945
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 9 Feb 2022 17:52:44 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 9 Feb 2022 17:52:44 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 9 Feb 2022 17:52:43 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V2] nghttp2: fix for multilib support
Date: Thu, 10 Feb 2022 09:52:43 +0800
Message-ID: <20220210015243.43112-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Feb 2022 01:52:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161598

From: Changqing Li <changqing.li@windriver.com>

Update package name to fix following error:
ERROR: Required build target 'lib32-core-image-minimal' has no buildable providers.
Missing or unbuildable dependency chain was: ['lib32-core-image-minimal', 'lib32-libnghttp2']

for lib32 image, lib{PN} will be expanded as lib32-liblib32-nghttp2, so
above error occurs, update lib{PN} to lib{BPN} to fix it.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-support/nghttp2/nghttp2_1.46.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.46.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.46.0.bb
index 972ff2d60a..0ad45ed2c7 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.46.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.46.0.bb
@@ -19,7 +19,7 @@ PACKAGECONFIG[manpages] = ""
 # first place
 EXTRA_OECMAKE = "-DENABLE_EXAMPLES=OFF -DENABLE_APP=OFF -DENABLE_HPACK_TOOLS=OFF"
 
-PACKAGES =+ "lib${PN} ${PN}-client ${PN}-proxy ${PN}-server"
+PACKAGES =+ "lib${BPN} ${PN}-client ${PN}-proxy ${PN}-server"
 
 RDEPENDS:${PN} = "${PN}-client (>= ${PV}) ${PN}-proxy (>= ${PV}) ${PN}-server (>= ${PV})"
 RDEPENDS:${PN}:class-native = ""
@@ -27,7 +27,7 @@ RDEPENDS:${PN}-proxy = "openssl python3-core python3-io python3-shell"
 
 ALLOW_EMPTY:${PN} = "1"
 FILES:${PN} = ""
-FILES:lib${PN} = "${libdir}/*${SOLIBS}"
+FILES:lib${BPN} = "${libdir}/*${SOLIBS}"
 FILES:${PN}-client = "${bindir}/h2load ${bindir}/nghttp"
 FILES:${PN}-proxy = "${bindir}/nghttpx ${datadir}/${BPN}/fetch-ocsp-response"
 FILES:${PN}-server = "${bindir}/nghttpd"
-- 
2.17.1



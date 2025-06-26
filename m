Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6230C7EE32
	for <webhook@archiver.kernel.org>; Thu, 26 Jun 2025 13:15:32 +0000 (UTC)
Received: from esa5.hc324-48.eu.iphmx.com (esa5.hc324-48.eu.iphmx.com [207.54.71.60])
 by mx.groups.io with SMTP id smtpd.web10.7878.1750943728643464867
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 06:15:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=HVYS8Q88;
 spf=pass (domain: bmw.de, ip: 207.54.71.60, mailfrom: prvs=26537330a=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1750943728; x=1782479728;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wXFHORQ49NiajPfJrqBc7kRfJ2POtFYXN4Hfsp9u+KA=;
  b=HVYS8Q88P5lQa9pzmR6qqNP0A+Q5Wo0qglYZyOQJjhJ/WQQNvR/U8Qz6
   BiEViqYaFBksV3MN8TZpvqmFmpJ3bA805WYl3smjNJSzaqATYPcMF3zhf
   PkTA6zrBqamw41NGDOv232TorcPBTDP8cw/cH+puh2MCbAdxGtGGW1z+H
   0=;
X-CSE-ConnectionGUID: y/3SzpikSSavX+Rel1gvrg==
X-CSE-MsgGUID: ohwDh8RaS5ilBwEEIRDrXw==
Received: from 160.46.252.46.spf.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
 esa5.hc324-48.eu.iphmx.com with ESMTP/TLS; 26 Jun 2025 15:15:25 +0200
Received: from esabb2.muc ([160.50.100.34])  by esagw5.muc with ESMTP/TLS;
 26 Jun 2025 15:15:26 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb2.muc with ESMTP/TLS; 26 Jun 2025 15:14:41 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.215) by
 smucmp12a.europe.bmw.corp (10.30.13.95) with Microsoft SMTP Server
 (version=TLS; Thu, 26 Jun 2025 15:14:40 +0200
X-CSE-ConnectionGUID: U4kkMzkRT6CKSlOwPwuEng==
X-CSE-MsgGUID: vtHv0J18ToKJOkvTKxU2sg==
X-CSE-ConnectionGUID: yYl9Dd5qQZS2Q1EjjfIKuw==
X-CSE-MsgGUID: DfzLfeaAS6a+q/JmOMw2sw==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>, <quentin.schulz@cherry.de>,
	<m.felsch@pengutronix.de>
Subject: [PATCH] json-c: Re-enable '-Werror' now that icecc is not supported anymore
Date: Thu, 26 Jun 2025 15:14:13 +0200
Message-ID: <20250626131413.3666480-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp15f.europe.bmw.corp (10.30.13.140) To
 smucmp12a.europe.bmw.corp (10.30.13.95)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 13:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219353

6481e8b209b ("json-c: fix icecc compilation") disabled '-Werror' unconditionally
for all compilers. As support for icecc has been removed via ba4fd5229893
("classes/recipes-devtools: Drop icecc from OE-Core") recently, we can re-enable
it.

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
CC: quentin.schulz@cherry.de
CC: m.felsch@pengutronix.de
---
 meta/recipes-devtools/json-c/json-c_0.18.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/json-c/json-c_0.18.bb b/meta/recipes-devtools/json-c/json-c_0.18.bb
index ece320d66ce1f03ce0c8655374c02c283a9364dd..5edeced4c55df088e1a9990d9e159fe970bb537b 100644
--- a/meta/recipes-devtools/json-c/json-c_0.18.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.18.bb
@@ -19,10 +19,8 @@ UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+)-\d+"
 
 RPROVIDES:${PN} = "libjson"
 
-# - '-Werror' must be disabled for ICECC builds
-# - Apps aren't needed/packaged and their CMakeLists.txt is incompatible with CMake 4+.
-EXTRA_OECMAKE = "-DDISABLE_WERROR=ON \
-                 -DBUILD_APPS=OFF \
+# Apps aren't needed/packaged and their CMakeLists.txt is incompatible with CMake 4+.
+EXTRA_OECMAKE = "-DBUILD_APPS=OFF \
 "
 
 inherit cmake ptest


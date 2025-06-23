Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 916C9C7115B
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 09:12:38 +0000 (UTC)
Received: from esa10.hc324-48.eu.iphmx.com (esa10.hc324-48.eu.iphmx.com [207.54.69.29])
 by mx.groups.io with SMTP id smtpd.web11.15592.1750669957381341901
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jun 2025 02:12:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=g5GEvme3;
 spf=pass (domain: bmw.de, ip: 207.54.69.29, mailfrom: prvs=2622c1177=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1750669957; x=1782205957;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7mQtfpmTce147NUqC7gqtFQ05KOaweool9dyqqemVVw=;
  b=g5GEvme3pQNVynFuKrSizm8DLDTqJOvjsaZrNk5GUq2r7BIUurweYGk/
   laa0ltr7n9BjCdqj18bzVWrP3ludgB8uUIie9QfnuvbC99qfPCL4X3E5D
   ljNE2/VMzGP66r5nnjmSmBtlf+TRHrAzz1Kk2GCOC7fjXENBpXEkJg4w9
   Y=;
X-CSE-ConnectionGUID: jbZnZiNFRlWdJ+IIyo97YA==
X-CSE-MsgGUID: Go4hJnhxQuil6QCj7WZ3xw==
Received: from 160.46.252.49.spf.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa10.hc324-48.eu.iphmx.com with ESMTP/TLS; 23 Jun 2025 11:12:35 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw6.muc with ESMTP/TLS;
 23 Jun 2025 11:12:23 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb1.muc with ESMTP/TLS; 23 Jun 2025 11:12:20 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.212) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Mon, 23 Jun 2025 11:12:19 +0200
X-CSE-ConnectionGUID: fUBDABYGQbip2i+bGkKn/Q==
X-CSE-MsgGUID: 95heuuftSIaXqY0DCAibiA==
X-CSE-ConnectionGUID: bBVg0VXRR5Km/aJMKXfByA==
X-CSE-MsgGUID: DCWpRYr3T4StNj0SaNZYMw==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [PATCH] json-c: Don't build unneeded apps to unblock builds with CMake 4+
Date: Mon, 23 Jun 2025 11:12:03 +0200
Message-ID: <20250623091203.2859711-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SMUCMP10F.europe.bmw.corp (2a03:1e80:a15:58f::202c) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jun 2025 09:12:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219205

Disable build of the apps, as we don't seem to package them (upstream says they
aren't ready, see [0]). They are the only part of the code that doesn't build
yet with CMake 4+. One alternative would be to apply [1], but the PR hasn't been
merged yet by upstream, so we keep it simple.

[0]: https://github.com/json-c/json-c/blob/7cee5237dc6c0831e3f9dc490394eaea44636861/apps/CMakeLists.txt#L119-L121
[1]: https://github.com/json-c/json-c/pull/888
---
 meta/recipes-devtools/json-c/json-c_0.18.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/json-c/json-c_0.18.bb b/meta/recipes-devtools/json-c/json-c_0.18.bb
index 2fd1897ba8..ece320d66c 100644
--- a/meta/recipes-devtools/json-c/json-c_0.18.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.18.bb
@@ -19,8 +19,11 @@ UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+)-\d+"
 
 RPROVIDES:${PN} = "libjson"
 
-# Required for ICECC builds
-EXTRA_OECMAKE = "-DDISABLE_WERROR=ON"
+# - '-Werror' must be disabled for ICECC builds
+# - Apps aren't needed/packaged and their CMakeLists.txt is incompatible with CMake 4+.
+EXTRA_OECMAKE = "-DDISABLE_WERROR=ON \
+                 -DBUILD_APPS=OFF \
+"
 
 inherit cmake ptest
 


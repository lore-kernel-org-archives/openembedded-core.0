Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C49FBC77B7F
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 09:56:38 +0000 (UTC)
Received: from esa12.hc324-48.eu.iphmx.com (esa12.hc324-48.eu.iphmx.com [207.54.72.34])
 by mx.groups.io with SMTP id smtpd.web10.16029.1750672593333551934
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jun 2025 02:56:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=XZRAqqsk;
 spf=pass (domain: bmw.de, ip: 207.54.72.34, mailfrom: prvs=2622c1177=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1750672592; x=1782208592;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6s71GMz6rttMoZcTt8nbMtx/RY9kPOdh9aaLZK/E4UQ=;
  b=XZRAqqsk14Kc+WKuoSBJKgfAUg4ZQzyEcg9M2MQy/HVttipjsnVnWos5
   xr1xJjgo01obefGSzxc5WRP/ECoK+y1prs8hJpqTuFBHJHp1S63Y3Opbf
   5s4HJcKkXFbVBt4JdQHdpvn6I17z6mmpQ/TmaVF8DLKlWlbaHdABeGiKn
   g=;
X-CSE-ConnectionGUID: 00/cfCamRQCN9yhr3OBEaQ==
X-CSE-MsgGUID: HNDOj1iARoW9ew1ceOZusw==
Received: from 160.46.252.49.spf.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa12.hc324-48.eu.iphmx.com with ESMTP/TLS; 23 Jun 2025 11:56:30 +0200
Received: from esabb4.muc ([160.50.100.33])  by esagw6.muc with ESMTP/TLS;
 23 Jun 2025 11:56:29 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb4.muc with ESMTP/TLS; 23 Jun 2025 11:56:29 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.203) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Mon, 23 Jun 2025 11:56:29 +0200
X-CSE-ConnectionGUID: 1993EB+uR3WYHk2GdToCFw==
X-CSE-MsgGUID: Up9g2vbPQpyZaUqtjedumQ==
X-CSE-ConnectionGUID: 3Zz6HgnyTJCE1jMA76ec4w==
X-CSE-MsgGUID: ZPodigjeQYqNWfdZYvwo6Q==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [PATCH v2] json-c: Don't build unneeded apps to unblock builds with CMake 4+
Date: Mon, 23 Jun 2025 11:56:01 +0200
Message-ID: <20250623095601.2953081-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp17a.europe.bmw.corp (2a03:1e80:a15:58f::1:3a) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jun 2025 09:56:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219209

Disable build of the apps, as we don't seem to package them (upstream says they
aren't ready, see [0]). They are the only part of the code that doesn't build
yet with CMake 4+. One alternative would be to apply [1], but the PR hasn't been
merged yet by upstream, so we keep it simple.

[0]: https://github.com/json-c/json-c/blob/7cee5237dc6c0831e3f9dc490394eaea44636861/apps/CMakeLists.txt#L119-L121
[1]: https://github.com/json-c/json-c/pull/888

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
changes in v2:
- Add missing 'Signed-off-by' footer
---
 meta/recipes-devtools/json-c/json-c_0.18.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/json-c/json-c_0.18.bb b/meta/recipes-devtools/json-c/json-c_0.18.bb
index 2fd1897ba87cc98d4707f09e1e4aaa23300efe05..ece320d66ce1f03ce0c8655374c02c283a9364dd 100644
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
 


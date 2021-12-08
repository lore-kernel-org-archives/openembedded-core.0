Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8C8CC433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 08:16:36 +0000 (UTC)
Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.9622.1638951394680421981
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 00:16:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1B88GX5l029781
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 8 Dec 2021 00:16:33 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 8 Dec 2021 00:16:33 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 8 Dec 2021 00:16:32 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] libhandy: Add private headers
Date: Wed, 8 Dec 2021 16:13:21 +0800
Message-ID: <20211208081321.21274-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <16BEB45802538548.12270@lists.openembedded.org>
References: <16BEB45802538548.12270@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 08:16:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159343

From: Mingli Yu <mingli.yu@windriver.com>

After the commit(8157ecc Separate public and private enums) introduced,
there comes a race as below:
 | In file included from ../git/src/hdy-settings.c:11:
 | ../git/src/hdy-settings-private.h:16:10: fatal error: hdy-enums-private.h: No such file or directory
 |    16 | #include "hdy-enums-private.h"

So also add private headers like private sources did now to libhandy_sources
to fix the issue.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../libhandy/0001-Add-private-headers.patch   | 37 +++++++++++++++++++
 meta/recipes-gnome/libhandy/libhandy_1.5.0.bb |  4 +-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-gnome/libhandy/libhandy/0001-Add-private-headers.patch

diff --git a/meta/recipes-gnome/libhandy/libhandy/0001-Add-private-headers.patch b/meta/recipes-gnome/libhandy/libhandy/0001-Add-private-headers.patch
new file mode 100644
index 0000000000..7b2a512738
--- /dev/null
+++ b/meta/recipes-gnome/libhandy/libhandy/0001-Add-private-headers.patch
@@ -0,0 +1,37 @@
+From e7c3e8fa00f6a68b2e0629db5ee115e641ea710e Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 8 Dec 2021 07:35:52 +0000
+Subject: [PATCH] Add private headers
+
+After the commit(8157ecc Separate public and private enums) introduced,
+there comes a race as below:
+ | In file included from ../git/src/hdy-settings.c:11:
+ | ../git/src/hdy-settings-private.h:16:10: fatal error: hdy-enums-private.h: No such file or directory
+ |    16 | #include "hdy-enums-private.h"
+
+So also add private headers like private sources to libhandy_sources to
+fix the issue.
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libhandy/-/merge_requests/796]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/meson.build b/src/meson.build
+index d087323..6f11f27 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -64,7 +64,7 @@ hdy_private_enums = gnome.mkenums('hdy-enums-private',
+ )
+ 
+ libhandy_public_sources += [hdy_public_enums[0]]
+-libhandy_private_sources += [hdy_private_enums[0]]
++libhandy_private_sources += hdy_private_enums
+ libhandy_generated_headers += [hdy_public_enums[1]]
+ 
+ src_headers = [
+-- 
+2.32.0
+
diff --git a/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb b/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb
index d0b59b1a62..605ef2b5fa 100644
--- a/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb
@@ -9,7 +9,9 @@ BUGTRACKER = "https://gitlab.gnome.org/GNOME/libhandy/-/issues"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=master"
+SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=master \
+           file://0001-Add-private-headers.patch \
+"
 SRCREV = "8fa8306a79215fc6ebf2483145da98bf9b2495ab"
 S = "${WORKDIR}/git"
 
-- 
2.32.0



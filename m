Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40B72C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 06:40:05 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web12.8802.1638945604140476196
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 22:40:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1B86ds1j011489
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 7 Dec 2021 22:39:54 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1B86dr5X029196
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 7 Dec 2021 22:39:54 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 7 Dec 2021 22:39:53 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 7 Dec 2021 22:39:52 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] libhandy: add hdy-enums-private.h
Date: Wed, 8 Dec 2021 14:36:41 +0800
Message-ID: <20211208063641.8068-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 06:40:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159340

From: Mingli Yu <mingli.yu@windriver.com>

After the commit(8157ecc Separate public and private enums) introduced,
there comes a race as below:
 | In file included from ../git/src/hdy-settings.c:11:
 | ../git/src/hdy-settings-private.h:16:10: fatal error: hdy-enums-private.h: No such file or directory
 |    16 | #include "hdy-enums-private.h"

So add hdy-enums-private.h to libhandy_sources to fix the issue.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../0001-Add-hdy-enums-private.h.patch        | 52 +++++++++++++++++++
 meta/recipes-gnome/libhandy/libhandy_1.5.0.bb |  4 +-
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-gnome/libhandy/libhandy/0001-Add-hdy-enums-private.h.patch

diff --git a/meta/recipes-gnome/libhandy/libhandy/0001-Add-hdy-enums-private.h.patch b/meta/recipes-gnome/libhandy/libhandy/0001-Add-hdy-enums-private.h.patch
new file mode 100644
index 0000000000..e50eae0b42
--- /dev/null
+++ b/meta/recipes-gnome/libhandy/libhandy/0001-Add-hdy-enums-private.h.patch
@@ -0,0 +1,52 @@
+From 8ee30d1c415b916b6b59557c0081274756b1d849 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 8 Dec 2021 01:58:14 +0000
+Subject: [PATCH] Add hdy-enums-private.h
+
+After the commit(8157ecc Separate public and private enums) introduced,
+there comes a race as below:
+ | In file included from ../git/src/hdy-settings.c:11:
+ | ../git/src/hdy-settings-private.h:16:10: fatal error: hdy-enums-private.h: No such file or directory
+ |    16 | #include "hdy-enums-private.h"
+
+So add hdy-enums-private.h to libhandy_sources to fix the issue.
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libhandy/-/merge_requests/796]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/meson.build | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/meson.build b/src/meson.build
+index d087323..dd7c3ee 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -39,6 +39,8 @@ hdy_version_h = configure_file(
+ 
+ libhandy_generated_headers = [
+ ]
++libhandy_generated_private_headers = [
++]
+ 
+ install_headers(['handy.h'],
+   subdir: libhandy_header_subdir)
+@@ -66,6 +68,7 @@ hdy_private_enums = gnome.mkenums('hdy-enums-private',
+ libhandy_public_sources += [hdy_public_enums[0]]
+ libhandy_private_sources += [hdy_private_enums[0]]
+ libhandy_generated_headers += [hdy_public_enums[1]]
++libhandy_generated_private_headers += [hdy_private_enums[1]]
+ 
+ src_headers = [
+   'hdy-action-row.h',
+@@ -187,6 +190,7 @@ install_headers(src_headers, subdir: libhandy_header_subdir)
+ 
+ libhandy_sources = [
+   libhandy_generated_headers,
++  libhandy_generated_private_headers,
+   libhandy_public_sources,
+   libhandy_private_sources,
+   libhandy_resources,
+-- 
+2.32.0
+
diff --git a/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb b/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb
index d0b59b1a62..3ff56a6111 100644
--- a/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb
@@ -9,7 +9,9 @@ BUGTRACKER = "https://gitlab.gnome.org/GNOME/libhandy/-/issues"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=master"
+SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=master \
+           file://0001-Add-hdy-enums-private.h.patch \
+"
 SRCREV = "8fa8306a79215fc6ebf2483145da98bf9b2495ab"
 S = "${WORKDIR}/git"
 
-- 
2.32.0



Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.22691.1591587054342172442
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Jun 2020 20:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,486,1583164800"; 
   d="scan'208";a="94054715"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 08 Jun 2020 11:30:30 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id DE6E04BCC89E
	for <openembedded-core@lists.openembedded.org>; Mon,  8 Jun 2020 11:30:29 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 8 Jun 2020 11:30:33 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] xkeyboard-config:upgrade 2.29 -> 2.30
Date: Mon, 8 Jun 2020 11:30:27 +0800
Message-ID: <1591587027-32693-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: DE6E04BCC89E.A6931
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

-0001-fix-python3-support.patch
Removed since this is included in 2.30.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../0001-fix-python3-support.patch            | 34 -------------------
 ...onfig_2.29.bb => xkeyboard-config_2.30.bb} |  5 ++-
 2 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/xkeyboard-config/0001-fix-python3-support.patch
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.29.bb => xkeyboard-config_2.30.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config/0001-fix-python3-support.patch b/meta/recipes-graphics/xorg-lib/xkeyboard-config/0001-fix-python3-support.patch
deleted file mode 100644
index f723f70332..0000000000
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config/0001-fix-python3-support.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 168ac446cdd9a1b59d6b708360a9556515ba56b9 Mon Sep 17 00:00:00 2001
-From: MilhouseVH <milhouseVH.github@nmacleod.com>
-Date: Sun, 16 Feb 2020 09:41:43 +0000
-Subject: [PATCH] fix python3 support
-
-https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/issues/197
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- rules/compat/map-variants.py | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/rules/compat/map-variants.py b/rules/compat/map-variants.py
-index ebbfec9..979ba43 100755
---- a/rules/compat/map-variants.py
-+++ b/rules/compat/map-variants.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/python3
-+#!/usr/bin/env python3
- 
- import argparse
- import re
-@@ -12,8 +12,8 @@ class Layout(object):
-             assert variant is None
-             # parse a layout(variant) string
-             match = re.match(r'([^(]+)\(([^)]+)\)', layout)
--            self.layout = match[1]
--            self.variant = match[2]
-+            self.layout = match.groups()[0]
-+            self.variant = match.groups()[1]
- 
-     def __str__(self):
-         if self.variant:
diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.29.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.29.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb
index 598b584787..599a76e182 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.29.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.30.bb
@@ -13,10 +13,9 @@ LICENSE = "MIT & MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2 \
-           file://0001-fix-python3-support.patch \
            "
-SRC_URI[md5sum] = "b5980bdc6c7d79f6dcccba8c76bb6c5d"
-SRC_URI[sha256sum] = "1d4175278bf06000683656763a8b1d3282c61a314b6db41260c8efe92d621802"
+SRC_URI[md5sum] = "c8f0c7b719856f4159e88a25525c65ba"
+SRC_URI[sha256sum] = "095a524f7b633ed257617202d06c9c71fe020c8897b106cf0dcdd0c6e8b797d4"
 
 SECTION = "x11/libs"
 DEPENDS = "util-macros libxslt-native"
-- 
2.17.1




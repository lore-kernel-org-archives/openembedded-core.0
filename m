Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.674.1589315873803411756
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 13:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=jVLusaRq;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=h6oi=62=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49M8kk1D7Hz4y
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 22:37:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1589315870;
	bh=Q9mfEKbPA1vU+gYSvWgVWNHqXye/AVXUerjB4bwVZI8=;
	h=From:To:Subject:Date:From;
	b=jVLusaRqzQ/nmZchN2ahWBWO1wrwapUmwLPJ8Y9teDhXlT7yJwEy2VWVlxQ7pRgPl
	 lynFARGkZEPxRJ5u32T+1DYxyhBGy80luZT3nZ+f1YDNdqVK6kRU5hV/0MqVpboray
	 EyMBIqND2nfrODRWFWj2LWmweQ6w2tpAPqIzeKfu/KdVhsRW0R5r3qI4Dx6P/OD3DB
	 mdsL8zog6REHFj+Y2Wv+in0xEFJIyHT1ZstRpzMtY9TWGyzyL4pjSSiQDa3e8Td2SZ
	 mKlhfAlUAZXpBYiKfB/0GDT4BGI+LeQXL5TPrti7dTWP69Z6nFy8tlh42tX2izam+8
	 pJuJ+pl6sjokTYyu/ShdLb/D3Ydur+VSgJL06wU6fBFB5W5IaUwQHLKCzdOhsxwK/R
	 sO1TA5ZCUHQATGW92jtHVCa9SYffZ5CaUKtZ5UXGgGrjPC2M/wqnl27ZASBE6h0166
	 qpCHZP0AZIY+UEvGdIX39Qeh+5EhtbbKVwbD872WCxU8kui5mdrY7ZDXshS+WoiKoP
	 snBIPK+rTxEDbEyeHE5rQqv+3EJlY6uk7+jMHgexBBrfWd4e17EeIt3/bOvVwQxewD
	 0cfLA+M8ueLcfNop+ZpUfSIpZc2MnMswPCPYn+uLfyXwydvtbGW6bsxK9Ds/l+j5YA
	 uXwFgsQJYhx9IaQQ0/uRIeQw=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] vte: Remove workaround for gcc 4.8
Date: Tue, 12 May 2020 23:37:44 +0300
Message-Id: <20200512203748.8779-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...chool-asignment-to-avoid-gcc-4.8-err.patch | 27 -------------------
 meta/recipes-support/vte/vte_0.60.2.bb        |  2 +-
 2 files changed, 1 insertion(+), 28 deletions(-)
 delete mode 100644 meta/recipes-support/vte/vte/0001-app.cc-use-old-school-asignment-to-avoid-gcc-4.8-err.patch

diff --git a/meta/recipes-support/vte/vte/0001-app.cc-use-old-school-asignment-to-avoid-gcc-4.8-err.patch b/meta/recipes-support/vte/vte/0001-app.cc-use-old-school-asignment-to-avoid-gcc-4.8-err.patch
deleted file mode 100644
index 9c3f98fa61..0000000000
--- a/meta/recipes-support/vte/vte/0001-app.cc-use-old-school-asignment-to-avoid-gcc-4.8-err.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 442da9076b52003743ffc6fd7b9d647de6d7aa8f Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 17 Jan 2019 16:37:54 +0100
-Subject: [PATCH] app.cc: use old school asignment to avoid gcc 4.8 error
-
-This is needed to build vte-native on Centos 7,
-and can be dropped once that OS is no longer supported.
-
-Upstream-Status: Inappropriate [ancient compiler fix]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- src/app/app.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/app/app.cc b/src/app/app.cc
-index d424064..675d789 100644
---- a/src/app/app.cc
-+++ b/src/app/app.cc
-@@ -306,7 +306,7 @@ public:
-                 else
-                         alpha = get_alpha();
- 
--                GdkRGBA color{bg_color};
-+                GdkRGBA color = bg_color;
-                 color.alpha = alpha;
-                 return color;
-         }
diff --git a/meta/recipes-support/vte/vte_0.60.2.bb b/meta/recipes-support/vte/vte_0.60.2.bb
index a722e152a4..4a33f6e4d0 100644
--- a/meta/recipes-support/vte/vte_0.60.2.bb
+++ b/meta/recipes-support/vte/vte_0.60.2.bb
@@ -17,7 +17,7 @@ GIR_MESON_OPTION = 'gir'
 inherit gnomebase gtk-doc features_check upstream-version-is-even gobject-introspection
 
 # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
-SRC_URI += "file://0001-app.cc-use-old-school-asignment-to-avoid-gcc-4.8-err.patch \
+SRC_URI += " \
             file://0002-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
            "
 SRC_URI[archive.md5sum] = "1a0b5395915d2f3c88484511b38cc584"
-- 
2.17.1

